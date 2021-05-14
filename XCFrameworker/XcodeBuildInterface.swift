//
//  XcodeBuildInterface.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation
import Combine

class XCodeBuildInterface {
  static let instance = XCodeBuildInterface()
  
  enum Command: String { case list
    var argument: String { "-" + rawValue }
  }
  
  var cancellables = Set<AnyCancellable>()
  init() {
    Process.which("xcodebuild")
      .sink { completion in
        switch completion {
        case .failure(let err):
          print(err)
        default: break
        }
      } receiveValue: { path in
        print("Found Xcodebuild: \(path)")
        self.xcodebuildPath.send(path)
      }
      .store(in: &cancellables)
  }
  
  var xcodebuildPath = CurrentValueSubject<String, Never>("")
  
  func query<ResultType: Codable>(_ buildTarget: XcodeBuildTarget, using command: Command) -> AnyPublisher<ResultType, Error> {
    let args: [String] = ["-" + buildTarget.rawType, buildTarget.url.path, command.argument, "-json"]
    
    return xcodebuildPath
      .filter { $0 != "" }
      .flatMap() { path in
        Process(path: path, arguments: args)
          .publisher()
      }
      .decode(type: ResultType.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

//
//  XcodeProject.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation
import Combine
import Suite

class XcodeProject: XcodeBuildTarget, ObservableObject {
	let url: URL

  var loadingSubscription: AnyCancellable?
	var rawType: String { "project" }
  var targets: [Target] = [] { didSet { if selectedTarget == nil { selectedTarget = targets.first }}}
  var schemes: [Scheme] = [] { didSet { if selectedScheme == nil { selectedScheme = schemes.first }}}
  var configurations: [Configuration] = [] { didSet { if selectedConfiguration == nil { selectedConfiguration = configurations.first }}}
  var name: String?
  
  var selectedTarget: Target?
  var selectedScheme: Scheme?
  var selectedConfiguration: Configuration?
  
  var isLoaded = CurrentValueSubject<Bool, Never>(false)

	init(url: URL) {
		self.url = url
    load()
	}
  
  func load() {
    loadingSubscription = XCodeBuildInterface.instance.query(self, using: .list)
      .replaceError(with: XCodeBuildInterface.List())
      .sink { list in
        self.name = list.project.name
        self.targets = list.project.targets.map { Target(name: $0) }.sorted()
        self.schemes = list.project.schemes.map { Scheme(name: $0) }.sorted()
        self.configurations = list.project.configurations.map { Configuration(name: $0) }.sorted()
        self.isLoaded.value = true
        self.objectWillChange.sendOnMain()
      }
  }
}

extension XcodeProject {
	static let sample = XcodeProject(url: URL(fileURLWithPath: "/Users/ben/Documents/ManagedProjects/Common/SABase/SABase.xcodeproj"))
}

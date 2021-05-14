//
//  XcodeProject.Target.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

extension XcodeProject {
  struct Target: Identifiable, Hashable, Comparable {
    var id: String { name }
    func hash(into hasher: inout Hasher) {  name.hash(into: &hasher) }
    let name: String
 
    static func <(lhs: Target, rhs: Target) -> Bool { lhs.name < rhs.name }
    static let none = Target(name: "(none)")
  }
}

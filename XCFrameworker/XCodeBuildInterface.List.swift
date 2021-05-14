//
//  Xcodebuild.List.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

extension XCodeBuildInterface {
	struct List: Codable {
		var project: Project = Project()
		
		struct Project: Codable {
			var name: String = ""
      var configurations: [String] = []
      var schemes: [String] = []
      var targets: [String] = []
		}
	}
}

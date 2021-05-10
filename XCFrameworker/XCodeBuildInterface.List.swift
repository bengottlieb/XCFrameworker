//
//  Xcodebuild.List.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

extension XCodeBuildInterface {
	struct List: Codable {
		let project: Project
		
		struct Project: Codable {
			let name: String
			let configurations: [String]
			let schemes: [String]
			let targets: [String]
		}
	}
}

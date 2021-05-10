//
//  XcodeProject.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

class XcodeProject: XcodeBuildTarget {
	let url: URL

	var rawType: String { "project" }

	init(url: URL) {
		self.url = url
	}
}

extension XcodeProject {
	static let sample = XcodeProject(url: URL(fileURLWithPath: "/Users/ben/Documents/ManagedProjects/Common/SABase/SABase.xcodeproj"))
}

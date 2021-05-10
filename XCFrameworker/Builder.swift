//
//  Builder.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

class Builder {
	let buildTarget: XcodeBuildTarget
	
	init(project: XcodeProject) {
		self.buildTarget = project
	}
}

//
//  XcodeBuildee.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Foundation

protocol XcodeBuildTarget {
	var url: URL { get }
	var rawType: String { get }
}


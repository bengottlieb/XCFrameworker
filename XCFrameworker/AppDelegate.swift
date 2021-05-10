//
//  AppDelegate.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import Cocoa
import SwiftUI
import Combine

@main
class AppDelegate: NSObject, NSApplicationDelegate {

	var window: NSWindow!
	var cancellables = Set<AnyCancellable>()

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Create the SwiftUI view that provides the window contents.
		let contentView = ContentView()

//		Process.which("xcodebuild")
//			.sink { completion in
//				print(completion)
//			} receiveValue: { result in
//				print(result)
//			}
//			.store(in: &cancellables)

		XCodeBuildInterface().query(XcodeProject.sample, using: .list)
			.sink { completion in
				print(completion)
			} receiveValue: { (result: XCodeBuildInterface.List) in
				print(result)
			}
			.store(in: &cancellables)

		
		// Create the window and set the content view.
		window = NSWindow(
		    contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
		    styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
		    backing: .buffered, defer: false)
		window.isReleasedWhenClosed = false
		window.center()
		window.setFrameAutosaveName("Main Window")
		window.contentView = NSHostingView(rootView: contentView)
		window.makeKeyAndOrderFront(nil)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}


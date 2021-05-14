//
//  ContentView.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			ProjectBuildConfigurationView(project: .sample)
			
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

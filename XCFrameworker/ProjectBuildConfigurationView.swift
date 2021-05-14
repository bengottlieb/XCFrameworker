//
//  ProjectBuildConfigurationView.swift
//  XCFrameworker
//
//  Created by Ben Gottlieb on 5/10/21.
//

import SwiftUI

struct ProjectBuildConfigurationView: View {
  @ObservedObject var project: XcodeProject
  
  var body: some View {
    VStack() {
      Text(project.name ?? "")
      HStack() {
        Picker("Target", selection: $project.selectedTarget) {
          ForEach(project.targets) { target in
            Text(target.name).tag(target)
          }
        }
        Spacer()
      }
      
      HStack() {
        Picker("Configuration", selection: $project.selectedConfiguration) {
          ForEach(project.configurations) { config in
            Text(config.name).tag(config)
          }
        }
        Spacer()
      }
      
      HStack() {
        Picker("Scheme", selection: $project.selectedScheme) {
          ForEach(project.schemes) { scheme in
            Text(scheme.name).tag(scheme)
          }
        }
        Spacer()
      }
    }
    .padding()
  }
}

struct ProjectBuildConfigurationView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectBuildConfigurationView(project: .sample)
  }
}

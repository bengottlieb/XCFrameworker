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
        Picker("", selection: $project.selectedTarget) {
          ForEach(project.targets) { target in
            Text(target.name).tag(target)
          }
        }
        .fixedSize()
        Spacer()
      }
      
      HStack() {
        Picker("", selection: $project.selectedConfiguration) {
          ForEach(project.configurations) { config in
            Text(config.name).tag(config)
          }
        }
        .fixedSize()
        Spacer()
      }
      
      HStack() {
        Picker("", selection: $project.selectedTarget) {
          ForEach(project.schemes) { scheme in
            Text(scheme.name).tag(scheme)
          }
        }
        .fixedSize()
        Spacer()
      }
    }
    .pickerStyle(SegmentedPickerStyle())
    .padding()
  }
}

struct ProjectBuildConfigurationView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectBuildConfigurationView(project: .sample)
  }
}

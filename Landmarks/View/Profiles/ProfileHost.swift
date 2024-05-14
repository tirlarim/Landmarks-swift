//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Stanislav Romanov on 25.12.2023.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @Environment(ModelData.self) var modelData
  @State private var draftProfile = Profile.default
  
  var body: some View {
    @Bindable var modelData = modelData
    
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel", role: .cancel) {
            draftProfile = modelData.profile
            editMode?.animation().wrappedValue = .inactive
          }
        }
        Spacer()
        EditButton()
      }
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear(perform: {modelData.profile = draftProfile})
          .onDisappear(perform: {modelData.profile = draftProfile})
      }
    }
    .padding()
  }
}

#Preview {
  ProfileHost()
    .environment(ModelData())
}

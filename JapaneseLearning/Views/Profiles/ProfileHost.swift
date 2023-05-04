//
//  ProfileHost.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        //Text("Profile ove: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 20)
        {
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
            
            //ProfileSummary(profile: draftProfile)
            if editMode?.wrappedValue == .inactive
            {
                ProfileSummary(profile: modelData.profile)
            }
            else {
                //Text("Profile Editor")
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}


//
//  ProfileEditor.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List {
            //Name
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
                
            }
            HStack {
                Text("Gmail").bold()
                Divider()
                TextField("Gmail", text: $profile.email)
                
            }
            // Notification On/Off
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            //Season: winter, summer, spring, fall
            VStack(alignment: .leading, spacing: 20) {
                Text("Current Level").bold()
                Picker("Current Level", selection: $profile.currentLevel) {
                    ForEach(Profile.Level.allCases) {
                        season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
                .background(.brown)
            }
            //Date
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date)
            {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}


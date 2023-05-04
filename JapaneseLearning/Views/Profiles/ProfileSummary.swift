//
//  ProfileSummary.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData

    @State private var isLearnedOnly = true
    var filteredWords: [Word] {
        modelData.words.filter {
            word in (!isLearnedOnly || word.isLearned)
        }
    }
    
    var profile: Profile
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Profile")
                        .bold()
                        .font(.title)
                    Spacer()
                }
                Divider()
                HStack {
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text(profile.username)
                                .bold()
                                .font(.title)
                            Text("Email: \(profile.email)")
                            Text("Notification: \(profile.prefersNotifications ? "On": "Off")")
                            Text("Seasonal Photos: \(profile.currentLevel.rawValue)")
                            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                            
                        }
                        Spacer()
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.brown)
                            .frame(width: 100, height: 70)
                            .cornerRadius(10)
                        Image("japanese_flag")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 70, height: 70)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    Spacer()
                }
            }
            Divider()
            VStack {
                HStack {
                    Text("Statistic")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                StudyGraph(data: [200.0, 75.0, 60.0, 300.0, 120.0, 80.0, 100.0], totalValue: 625.0)
                Spacer()
            }
            Divider()
            VStack {
                HStack {
                    Text("Achivement")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                ForEach(filteredWords) { word in
                    BirdBadge(word: word)
                }
                Spacer()
            }
            Divider()
            
            
            Spacer()
        }
        .padding(5)
        .background(.white)
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}

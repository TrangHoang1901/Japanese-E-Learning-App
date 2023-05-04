//
//  Start.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import SwiftUI

struct Start: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case profile
    }
    
    var body: some View
    {
        TabView(selection: $selection) {
            PageRow()
                .tabItem {
                    Label("Home", systemImage: "suit.heart")
                }
                .tag(Tab.home)
            ProfileHost()
                .tabItem {
                    Label("Profile", systemImage: "list.bullet")
                }
                .tag(Tab.profile)
        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .environmentObject(ModelData())
    }
}

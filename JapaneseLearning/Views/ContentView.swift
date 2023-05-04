//
//  ContentView.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink
                {
                    Start()
                } label : {
                    Text("Let's Begin!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.pink)
                }
                .frame(width: 200, height: 70)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .buttonStyle(.plain)
                .background(.teal)
                .cornerRadius(10)
            }
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

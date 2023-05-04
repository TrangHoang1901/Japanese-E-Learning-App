//
//  PageLabel.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/22/23.
//

import SwiftUI

struct PageLabel: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showDetails = false
    @State private var isShowingSheet = false

    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Image("tomato")
                    .resizable()
                Spacer()
            }
            Text("Fruits")
                .font(.body)
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                isShowingSheet.toggle()
            })
            {
                Text("Start")
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $isShowingSheet)
            {
                LessonHome()
            }
            .frame(width: 50, height: 30)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))

        }
        .padding()
        .background(.teal)
        .bold()
        .frame(width: 170, height: 180)
        .cornerRadius(20)

    }
}

struct PageLabel_Previews: PreviewProvider {
    static var previews: some View {
        PageLabel()
            .environmentObject(ModelData())
    }
}

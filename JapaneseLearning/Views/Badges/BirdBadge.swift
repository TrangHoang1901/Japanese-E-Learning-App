//
//  BirdBadge.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import SwiftUI

struct BirdBadge: View {
    @EnvironmentObject var modelData: ModelData
    var word: Word
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.brown)
                .frame(width: 70, height: 50)
                .cornerRadius(10)
            //Image("apple")
            //Image(systemName: "apple")
            word.image
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        
    }
}

struct BirdBadge_Previews: PreviewProvider {
    static var words = ModelData().words

    static var previews: some View {
        BirdBadge(word: words[2])
            .environmentObject(ModelData())
    }
}



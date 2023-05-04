//
//  WordMap.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/23/23.
//

import SwiftUI

struct WordMap: View {

    
    @EnvironmentObject var modelData: ModelData
    @State private var isShowingSheet = false
    
    var word: Word
    var body: some View {
        ScrollView {
            Button(action: {
                isShowingSheet.toggle()
            })
            {
                //WordRow(word: modelData.words[0])
                WordRow(word: word)
                Label("", systemImage: "cursor.rays")
            }
            .sheet(isPresented: $isShowingSheet)
            {
                WordDetail(word: word)
            }
            
        }

    }
}

struct WordMap_Previews: PreviewProvider {
    static var words = ModelData().words
    static var previews: some View {
        WordMap(word: words[0])
            .environmentObject(ModelData())
    }
}

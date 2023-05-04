//
//  WordRow.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import SwiftUI

struct WordRow: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showEnglish = false
    
    var word: Word
    
    var wordIndex: Int {
        modelData.words.firstIndex(where: {
            $0.id == word.id
        })!
    }
    
    func englishConverter(_ showEnglish: Bool) -> some View {
        if showEnglish {
            return AnyView(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(word.nameWord)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: "character.bubble.fill.ja")
                        .foregroundColor(.pink)
                }
                
            )
        }
        else {
            return AnyView(
            HStack() {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(word.japaneseWord.kanji)
                    Text(word.japaneseWord.hiragana)
                    Spacer()
                }
                //.padding()
                Spacer()
                Image(systemName: "character.bubble.fill")
                    .foregroundColor(.pink)
            })
        }
    }

    
    var body: some View {
        HStack {
            word.image
                .resizable()
                .frame(width: 100, height: 100)
            Button(action: {self.showEnglish.toggle()})
            {
                englishConverter(showEnglish)
            }
            isLearnedButton(isSet: $modelData.words[wordIndex].isLearned)
                .foregroundColor(.pink)
        }
        .padding()
        //.background(.brown)
    }
}

struct WordRow_Previews: PreviewProvider {
    static var words = ModelData().words
    
    static var previews: some View {
        
        WordRow(word: words[2])
            .environmentObject(ModelData())
    }
}


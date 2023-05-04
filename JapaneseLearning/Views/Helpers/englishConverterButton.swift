//
//  englishConverterButton.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/18/23.
//

import SwiftUI

struct englishConverterButton: View {
    @Binding var isSet: Bool
    
    @State private var showEnglish = false
    
    var word: Word
    
    func englishConverter(_ showEnglish: Bool) -> some View {
        if showEnglish {
            return AnyView(
                HStack() {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(word.nameWord)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: "a.book.closed.fill.ja")
                        .foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
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
                Spacer()
                Image(systemName: "a.book.closed")
                    .foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
            })
        }
    }

    
    var body: some View {
        Button(action: {
            self.showEnglish.toggle()
        }) {
            englishConverter(showEnglish)
        }
    }
}

struct englishConverterButton_Previews: PreviewProvider {
    static var previews: some View {
        englishConverterButton(isSet: .constant(true), word: ModelData().words[1])
    }
}

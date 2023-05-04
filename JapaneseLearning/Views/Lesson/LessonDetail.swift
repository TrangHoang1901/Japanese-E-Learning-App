//
//  LessonDetail.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/18/23.
//

import SwiftUI

struct LessonDetail: View {
    
    var word: Word
    var body: some View {
        VStack {
            Text(word.japaneseWord.kanji)
            Text(word.nameWord)
        }
    }
}

struct LessonDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        LessonDetail(word: ModelData().words[0])
    }
}

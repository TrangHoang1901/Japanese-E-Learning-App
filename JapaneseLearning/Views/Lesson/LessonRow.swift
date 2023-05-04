//
//  LessonRow.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/18/23.
//

import SwiftUI

struct LessonRow: View {
    
    @EnvironmentObject var modelData: ModelData
    var lessonOrder: Int
    //@Binding var words: [Word]
    
    var filteredWords: [Word] {
        modelData.words.filter {
            $0.lesson == lessonOrder
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "\(lessonOrder).circle")
            VStack(alignment: .leading) {
                Text("Lesson \(lessonOrder)")
                    .bold()
                    .font(.title)
                //.padding(.leading, 15)
                
                HStack {
                    ForEach(filteredWords) { word in
                        VStack(alignment: .leading) {
                            Text(word.japaneseWord.kanji)
                            Text(word.nameWord)
                        }
                        .font(.caption)
                    }
                }
            }
        }
    }
}

struct LessonRow_Previews: PreviewProvider {
    //static var words = ModelData().words
    static var modelData = ModelData()
    static var previews: some View {
        LessonRow(lessonOrder: modelData.words[0].lesson)
            .environmentObject(modelData)
    }
}


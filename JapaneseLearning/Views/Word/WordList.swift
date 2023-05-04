//
//  WordList.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import SwiftUI

struct WordList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var lesson = 1
    
    @State private var isLearnedOnly = false
    var filteredWords: [Word] {
        modelData.words.filter {
            word in ((!isLearnedOnly || word.isLearned) && word.lesson == lesson)
        }
    }
    
    var body: some View
    {
        /*
        NavigationView
        {
            List {
                HStack {
                    Button(action: { self.isLearnedOnly.toggle()})
                    {
                        //Image(systemName: "book")
                        Text(isLearnedOnly ? Image(systemName: "book") : Image(systemName: "book.closed"))
                        Text("Learned")
                    }
                    .foregroundColor(.pink)
                    
                    Spacer()
                    ForEach(filteredWords) { word in
                        NavigationLink
                        {
                            WordDetail(word: word)
                        } label : {
                            WordMap(word: word)
                        }
                        .buttonStyle(.plain)
                        .background(.brown)
                    }
                }
            }
            .navigationTitle(Text("Lesson 1"))
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(Color(.white))
            .navigationBarHidden(false)
            
        }
         */
        List {
            HStack {
                Button(action: { self.isLearnedOnly.toggle()})
                {
                    //Image(systemName: "book")
                    Text(isLearnedOnly ? Image(systemName: "book") : Image(systemName: "book.closed"))
                    Text("Learned")
                }
                .foregroundColor(.pink)
            }
            ForEach(filteredWords) { word in
                WordMap(word: word)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}
struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList(lesson: 3)
            .environmentObject(ModelData())
    }
}


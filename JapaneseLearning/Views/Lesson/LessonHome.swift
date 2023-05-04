//
//  LessonHome.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/18/23.
//

import SwiftUI

struct LessonHome: View {
    
    @State private var list = [1, 2, 3]
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationView {
            List {
                Image("fruit")
                    .resizable()
                    .scaledToFill() //fill the frame of the view
                //.frame(height: 200)
                //.clipped() //make sure to fit in the view
                //.ignoresSafeArea()
                    .listRowInsets(EdgeInsets())
                
                ForEach(list, id: \.self) { lesson in
                    NavigationLink
                    {
                        WordList(lesson: lesson)
                    } label : {
                        LessonRow(lessonOrder: lesson)
                        //WordRow(word: word)
                        //Label(WordRow(word: word), systemImage: "suit.heart")
                    }
                    .buttonStyle(.plain)
                    
                }
                //.listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.large)
            //.background(.blue)
            //.navigationBarTitleDisplayMode(.inline)
        }
        //.background(.blue)
    }
}

struct LessonHome_Previews: PreviewProvider {
    static var previews: some View {
        LessonHome()
            .environmentObject(ModelData())
    }
}
    




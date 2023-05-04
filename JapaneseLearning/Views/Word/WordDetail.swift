//
//  WordDetail.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import SwiftUI

struct WordDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var textEditorCheck: String = ""
    @State private var isCorrect: Bool = false
    @State private var isQuiz = false
    @State private var isChecked = false
    @State private var isMovedRight = false
    @State private var isMovedLeft = false
    
    var word: Word
    
    var wordIndex: Int {
        modelData.words.firstIndex(where: {
            $0.id == word.id
        })!
    }
    
    var body: some View {
        VStack(spacing: 5) {

            word.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 80))
                //.background(.teal)
            //Spacer()
            
            //Voice
            VStack(alignment: .leading)
            {
                //Spacer()
                HStack(spacing: 25) {
                    Image(systemName: "speaker.wave.2.circle.fill")
                        .foregroundColor(.yellow)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Kanji: " + word.japaneseWord.kanji)
                        Text("Hiragana: " + word.japaneseWord.hiragana)
                        Text("Phrase: " + word.japaneseWord.nameWordInEnglishPhrases)
                    }
                }
                Spacer()
                //Example
                HStack(spacing: 25) {
                    Image(systemName: "doc.richtext.fill.ja")
                        .foregroundColor(.yellow)
                    VStack(alignment: .leading) {
                        Text("Example")
                            //.foregroundColor(.black)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(word.examples.senInHiragana)
                            Text(word.examples.senWordInHiraganaPhrases)
                            Text(word.examples.senWordInEnglish)
                        }
                        .font(.body)
                        .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: -50))
                    }
                }
                
                //Practice the word
                Spacer()
                HStack(spacing: 25)
                {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .foregroundColor(.yellow)
                    VStack(alignment: .leading)
                    {
                        Text("Practice")
                            //.foregroundColor(.black)
                        HStack {
                            Text("Rewrite word")
                            TextField("_____", text: $textEditorCheck)
                                 .frame(width: 50)
                                 .underline()
                                 .background(Color.clear)
                            Text("and check。")
                        }
                        .font(.body)
                        Button(action: {
                            if !isChecked {
                                if textEditorCheck == word.japaneseWord.hiragana || textEditorCheck == word.japaneseWord.kanji
                                {
                                    isCorrect = true
                                }
                                isChecked = true
                            } else {
                                isChecked = false
                                textEditorCheck = ""
                            }
                        }
                        ){
                            Text(isChecked ? "Redo" : "Check")
                                .frame(height: 0)
                                .font(.caption2)
                                .padding()
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            if isChecked && !textEditorCheck.isEmpty
                            {
                                if isCorrect {
                                    Text("Correct!")
                                        .foregroundColor(.green)
                                }
                                else {
                                    Text("Wrong!")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        //.frame(height: 20)
                        .disabled(textEditorCheck.isEmpty)

                        
                    }
                }
                
                Spacer()
                Spacer()
                
                
                HStack(alignment: .bottom, spacing: 15) {
                    /*
                    //Left
                    /*Image(systemName: "arrow.left.to.line")
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width / 12))
                        //.foregroundColor(.yellow)*/
                    Button(action: {
                        // Navigate to new page here
                    }) {
                        if wordIndex > 0
                        {
                            NavigationLink(destination: WordDetail(word: modelData.words[wordIndex - 1]))
                            {
                                Image(systemName: "arrow.left.to.line")
                            }
                        }
                    }
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: (UIScreen.main.bounds.width / 12))
                     */
                    //Like
                    /*
                    Button(action: { self.isChecked.toggle() }) {
                        Text(self.isChecked ? Image(systemName: "suit.heart.fill") : Image(systemName: "suit.heart"))
                    }
                    .frame(width: (UIScreen.main.bounds.width / 12))
                    .padding()
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    */
                    
                    isLearnedButton(isSet: $modelData.words[wordIndex].isLearned)
                        //.foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
                        .frame(width: (UIScreen.main.bounds.width / 8))
                        .padding()
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
                    //Quiz
                    Button(action: { self.isQuiz.toggle() }) {
                        Text(self.isQuiz ? "Pressed" : "Quiz")
                            //
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.teal)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .frame(height: 5)
                .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .background(.brown)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .ignoresSafeArea()

        //}
        //.navigationTitle(word.nameWord)
        //.navigationBarTitleDisplayMode(.inline)
        //.toolbar {
         //   isLearnedButton(isSet: //$modelData.words[wordIndex].isLearned)
        }
        .background(.yellow)
        
    }
}

struct WordDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        //WordDetail(word: modelData.words[1])
        //    .environment(modelData)
        WordDetail(word: modelData.words[1])
            .environmentObject(modelData)
        //WordDetail()
    }
}

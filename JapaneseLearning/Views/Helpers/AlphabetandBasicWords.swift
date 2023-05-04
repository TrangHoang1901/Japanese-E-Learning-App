//
//  AlphabetandBasicWords.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import SwiftUI

struct AlphabetandBasicWords: View {
    @State private var check: String = ""
    
    var body: some View {
        List {
            HStack {
                Spacer()
                Image("hospital")
                    .resizable()
                    //.aspectRatio(contentMode: .fit)
                    //.listRowInsets(EdgeInsets()) //fill all the view
                    .ignoresSafeArea(edges: .top)
                    .frame(width: 500, height: 300)
                Spacer()
            }
            
            //Voice
            HStack(spacing: 25) {
                Image(systemName: "speaker.wave.2.circle.fill")
                    .foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
                VStack(alignment: .leading) {
                    Text("病院 (びょういん)")
                    Text("Byouin")
                }
                
            }
            .padding()
            
            //Example
            HStack(spacing: 25) {
                Image(systemName: "doc.richtext.fill.ja")
                    .foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
                VStack(alignment: .leading) {
                    Text("Example")
                    //Spacer(minLength: CGFloat:2)
                    VStack(alignment: .leading) {
                        Text("ぼくはきのうびょういんにいった.")
                            .font(.callout)
                        Text("kanojo wa byouin de hatarai te iru.")
                            .font(.callout)
                        Text("I went to a hospital yesterday.")
                            .font(.callout)
                    }
                }
            }
            .padding()
            
            //Spacer()
            
            //Practice the word
            HStack(spacing: 25) {
                Image(systemName: "square.and.pencil.circle.fill")
                    .foregroundColor(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
                VStack(alignment: .leading) {
                    Text("Practice")
                    TextField("", text: $check, prompt: Text("Type"))
                        .border(Color(hue: 0.921, saturation: 1.0, brightness: 1.0))
                        .textFieldStyle(.roundedBorder)
                }
                
            }
            .padding()
            
                                
        }
        .font(.body)
        .bold()
        //.frame(alignment: .leading)
        //.padding()
        .listStyle(.inset)
        
    }
}

struct AlphabetandBasicWords_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetandBasicWords()
    }
}

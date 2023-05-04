//
//  Word.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import Foundation
import SwiftUI

struct Word: Hashable, Codable, Identifiable {
    var id: Int
    //var category: String
    var lesson: Int
    var nameWord: String
    
    private var imageName: String // only implemented within this .swift file
    var image: Image {
        Image(imageName)
    }
    
    var japaneseWord: JapaneseWord
    struct JapaneseWord: Hashable, Codable {
        var kanji: String
        var hiragana: String
        var nameWordInEnglishPhrases: String
    }
    
    var examples: Example
    struct Example: Hashable, Codable {
        var senInKanji: String
        var senInHiragana: String
        var senWordInHiraganaPhrases: String
        var senWordInEnglish: String
    }
    
    var isLearned: Bool

}

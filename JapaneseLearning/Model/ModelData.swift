//
//  ModelData.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/17/23.
//

import Foundation
import Combine


//var words: [Word] = load("fruits.json")


final class ModelData: ObservableObject {
    //An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var words: [Word] = load("fruits.json")
    @Published var profile = Profile.default
}



//Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.

//The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

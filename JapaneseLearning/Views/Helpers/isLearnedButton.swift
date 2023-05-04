//
//  isLearnedButton.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/18/23.
//

import SwiftUI

struct isLearnedButton: View {
    
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label : {
            Label("Toggle Favorite", systemImage: isSet ? "book" : "book.closed")
                .labelStyle(.iconOnly)
                .foregroundColor(.black)
        }
    }
}

struct isLearnedButton_Previews: PreviewProvider {
    static var previews: some View {
        isLearnedButton(isSet: .constant(false))
    }
}



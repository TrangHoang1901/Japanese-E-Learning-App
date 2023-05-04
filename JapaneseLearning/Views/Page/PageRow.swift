//
//  PageRow.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 3/22/23.
//

import SwiftUI

struct PageRow: View {
    
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("こんにちは 🇯🇵!")
                    .bold()
                    .font(.title)
                .foregroundColor(.pink)
                Spacer()
            }
            .padding(20)
            Image("places")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            VStack(spacing: 15) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 10) {
                        //Spacer()
                        
                        PageLabel()
                        PageLabel()
                        PageLabel()
                        //Spacer()
                    }
                    
                }
                //Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 10) {
                        PageLabel2()
                        PageLabel2()
                        PageLabel2()
                    }
                }
            }
            .padding()
            //.background(.brown)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            //.ignoresSafeArea()
            
        }
    }
}

struct PageRow_Previews: PreviewProvider {
    
    static var previews: some View {
        PageRow()
            .environmentObject(ModelData())
    }
}

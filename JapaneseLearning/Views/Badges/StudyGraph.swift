//
//  StudyGraph.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import SwiftUI

struct StudyGraph: View {
    let data: [Double]
    let totalValue: Double
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                ForEach(data.indices, id: \.self) { index in
                    BarView(value: data[index] / totalValue, index: index)
                }
            }
        }
    }
}

struct BarView: View {
    let value: Double
    let index: Int
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.teal)
                    .frame(width: 20, height: 150)
                
                Capsule()
                    .fill(Color.yellow)
                    .frame(width: 20, height: CGFloat(value) * 150)
            }
            Text("Week \(index + 1)")
                .font(.footnote)
        }
    }
}



struct StudyGraph_Previews: PreviewProvider {
    
    static var previews: some View {
        StudyGraph(data: [100.0, 75.0, 60.0, 90.0, 120.0, 80.0, 100.0], totalValue: 625.0)
    }
}

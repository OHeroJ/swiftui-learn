//
//  LearnGeometryReader.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/22.
//

import SwiftUI

struct LearnGeometryReader: View {
    var body: some View {
        VStack {

            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 50) {
                    ForEach(1..<8) { item in
                        GeometryReader { geometry in
                            Image("\(item)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .background(Color.red)
                                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 40), axis: (x: 20, y: 20, z: 20))
                        }
                        .frame(width: 370, height: 400)
                        .padding(20)
                    }
                }
            })
        }.navigationTitle(Text("GeometryReader"))
    }
}

struct LearnGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            LearnGeometryReader()
        })
    }
}

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
                        .frame(width: 270, height: 300)
                        .padding(20)
                    }
                }
            })
            
            Circle().fill(Color.blue)
                .overlay(Circle().strokeBorder(Color.white).padding(10))
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Divider()
            
            Text("love swiftui")
                .foregroundColor(.white)
                .padding(10)
                .background(GeometryReader{ proxy in
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            })
            
            Text("love swiftui")
                .foregroundColor(.white)
                .padding(10)
                .background(Color.blue)
            
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

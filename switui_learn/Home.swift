//
//  Home.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/16.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView(content: {
            List{
                ForEach(0..<20) { _ in
                    HStack {
                        Image("tab_mine")
                            .frame(width: 80, height: 80, alignment: .center)
                            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
                        VStack(alignment: .leading, spacing: 20, content: {
                            Text("Hello World")
                
                            Text("2020/10/19").font(.footnote)
                        })
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
            }.navigationTitle(Text("Home").foregroundColor(.red))
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

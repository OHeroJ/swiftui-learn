//
//  ContentView.swift
//  switui_learn
//
//  Created by laijihua on 2020/7/22.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("GitHub",
                 style: TextStyle(font: .title, padding: .only(bottom:20), color: .white)
            )
            Button("授权") {
                
            }
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/
                )
        .background(Color.black)
        .ignoresSafeArea()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


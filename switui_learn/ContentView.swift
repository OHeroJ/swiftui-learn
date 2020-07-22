//
//  ContentView.swift
//  switui_learn
//
//  Created by laijihua on 2020/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(.red)
            Spacer()
            Text("Oheroj/swiftui-learn")
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  swiftui-learn
//
//  Created by laijihua on 2020/5/29.
//  Copyright © 2020 laijihua. All rights reserved.
//

import SwiftUI

struct ContentView: View {


    var body: some View {
        VStack {

            VStack(alignment: .center) {
                Text("Hello, swiftui!")
                    .font(.title)
                    .foregroundColor(.red)

                HStack {
                    Text(/*@START_MENU_TOKEN@*/"laijihua"/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("nice stuff!")
                }.padding()

            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

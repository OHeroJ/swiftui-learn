//
//  Learn.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/16.
//

import SwiftUI

struct Learn: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink("List 学习", destination: LearnList())
                    .padding(10)
                NavigationLink("State 学习", destination: LearnState())
                    .padding(10)
                NavigationLink("ObservableObject 学习", destination: LearnObservableObject())
                    .padding(10)
                NavigationLink("EnvironmentObject 学习", destination: LearnEnvironmentObject())
                    .padding(10)
            }.navigationTitle("Learn")
        })
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}

//
//  Learn.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/16.
//

import SwiftUI

struct FilterView: View {
    @Binding var showFavorited: Bool
    
    var body: some View {
        Toggle(isOn: $showFavorited, label: {
            Text("toggle")
        }).padding(30)
    }
}

struct Learn: View {
    @State private var showFavorited: Bool = false
    var body: some View {
        NavigationView(content: {
            VStack(content: {
                FilterView(showFavorited: $showFavorited)
                    .navigationTitle(Text("Learn"))
                
                if showFavorited {
                    Text("OK").font(.title)
                } else {
                    Text("Bad").font(.title)
                }
            })
        })
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}

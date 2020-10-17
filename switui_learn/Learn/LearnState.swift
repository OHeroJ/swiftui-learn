//
//  LearnState.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
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

struct LearnState: View {
    @State private var showFavorited: Bool = false
    var body: some View {
        VStack(content: {
            FilterView(showFavorited: $showFavorited)
            if showFavorited {
                Text("OK").font(.title)
            } else {
                Text("Bad").font(.title)
            }
        }).navigationTitle(Text("State"))
    }
}

struct LearnState_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            LearnState()
        })
    }
}

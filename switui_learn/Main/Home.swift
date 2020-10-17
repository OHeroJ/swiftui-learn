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
            Text("Home")
            .navigationTitle(Text("Home").foregroundColor(.red))
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

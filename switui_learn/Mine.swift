//
//  Mine.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/16.
//

import SwiftUI

struct Mine: View {
    var body: some View {
        NavigationView(content: {
            Text("Hello, World!").navigationTitle(Text("Mine"))
        })
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}

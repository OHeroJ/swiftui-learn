//
//  Mine.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/16.
//

import SwiftUI
import Combine

struct Mine: View {
        
    var body: some View {
        NavigationView(content: {
            Text("Mine").navigationTitle(Text("Mine"))
        })
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}

//
//  Tab.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image("tab_home")
                    Text("home")
                }
            
            Learn()
                .tabItem {
                    Image("tab_learn")
                    Text("learn")
                }
            
            Mine()
                .tabItem {
                    Image("tab_mine")
                    Text("mine")
                }
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}

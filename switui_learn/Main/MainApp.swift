//
//  ContentView.swift
//  switui_learn
//
//  Created by laijihua on 2020/7/22.
//

import SwiftUI

struct MainApp: View {
    
    @State private var isAuth = false
    
    var body: some View {
        if isAuth {
            Tab()
        }
        else {
            Auth(isAuth: $isAuth)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
    }
}


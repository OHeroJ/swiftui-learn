//
//  ContentView.swift
//  switui_learn
//
//  Created by laijihua on 2020/7/22.
//

import SwiftUI



struct ContentView: View {
    @State private var isAuth = false
    
    var body: some View {
        if isAuth {
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
        else {
            VStack(alignment: .center) {
                Text("GitHub")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()

                Button("授权") {
                    isAuth.toggle()
                }

           }
           .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                   maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                   minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                   maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/
            )
            .background(Color.black)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  Auth.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI

struct Auth: View {
    
    @Binding var isAuth: Bool
    
    var body: some View {
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

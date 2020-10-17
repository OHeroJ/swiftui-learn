//
//  LearnEnvironmentObject.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI
import Combine

class User: ObservableObject {
    @Published var name = "OldBirds"
}


struct EditView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct LearnEnvironmentObject: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }.environmentObject(user)
    }
}

struct LearnEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        LearnEnvironmentObject()
    }
}

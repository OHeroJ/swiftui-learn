//
//  CircleImage.swift
//  swiftui-learn
//
//  Created by laijihua on 2020/5/30.
//  Copyright © 2020 laijihua. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("logo")
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

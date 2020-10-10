//
//  TextStyle.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/10.
//

import SwiftUI

struct TextStyle: ViewModifier {
    let font: Font
    let padding: EdgeInsets
    let color: Color
    let backgroundColor: Color
    
    init(font:Font = .title, padding: EdgeInsets = .zero,color: Color = .clear,backgroundColor: Color = .clear) {
        self.font = font
        self.padding = padding
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(padding)
            .foregroundColor(color)
            .background(backgroundColor)
    }
}

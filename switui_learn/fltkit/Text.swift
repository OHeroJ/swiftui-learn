//
//  Text.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/10.
//

import SwiftUI

extension EdgeInsets {
    init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.init(top: top, leading: left, bottom: bottom, trailing: right)
    }
    
    static func only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets {
        return EdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    static var zero: EdgeInsets = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

extension Text {
    init(_ text: String, style: TextStyle) {
        self.init(text)
        _ = modifier(style)
    }
}




//
//  LearnAnimate.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI

struct LearnAnimate: View {
    
    @State private var flipFlop = false
    
    let timer = Timer
        .publish(every: 1, on: .current, in: .common)
        .autoconnect()
    
    
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle().fill(Color.green)
                Circle().fill(Color.yellow)
                    .scaleEffect(0.8)
                Circle().fill(Color.orange)
                    .scaleEffect(0.6)
                Circle().fill(Color.red)
                    .scaleEffect(0.4)
            }
            .scaleEffect(flipFlop ? 0.2 : 0.8)
            .opacity(flipFlop ? 0.1 : 1.0)
            .animation(Animation.spring().repeatForever(autoreverses: true))
            .onReceive(timer, perform: { _ in
                self.flipFlop.toggle()
            })
            
            Path(
                UIBezierPath(roundedRect:
                                CGRect(origin: .zero, size: CGSize(width: 100, height: 50)),
                             byRoundingCorners: [.topRight, .bottomLeft],
                             cornerRadii: CGSize(width: 15, height: 15)
                ).cgPath
            )
            .fill(Color.blue)
            .padding(20)
            .onTapGesture(count: 1, perform: {
                print("was Tap")
            })
        }
    }
}

struct LearnAnimate_Previews: PreviewProvider {
    static var previews: some View {
        LearnAnimate()
    }
}

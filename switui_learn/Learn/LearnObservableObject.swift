//
//  LearnObservableObject.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI
import Combine

class BookingStore: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var bookingName: String = "" {
        didSet { updateUI() }
    }
    
    var seats: Int = 1 {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        objectWillChange.send()
    }
}

struct LearnObservableObject: View {
    
    @ObservedObject var model = BookingStore()
    
    var body: some View {
        VStack{
            Text(model.bookingName)
            TextField("Your Name", text: $model.bookingName)
            Stepper("Seats: \(model.seats)", value: $model.seats, in: 1...5)
        }.navigationTitle(Text("ObservableObject"))
    }
}

struct LearnObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            LearnObservableObject()
        })
    }
}

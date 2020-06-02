//
//  UserData.swift
//  swiftui-learn
//
//  Created by laijihua on 2020/6/2.
//  Copyright © 2020 laijihua. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

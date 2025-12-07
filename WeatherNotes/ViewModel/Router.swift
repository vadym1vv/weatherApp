//
//  Router.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    func reset() {
        path = NavigationPath()
    }
}

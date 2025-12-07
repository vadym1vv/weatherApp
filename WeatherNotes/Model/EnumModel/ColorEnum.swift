//
//  ColorEnum.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

enum ColorEnum: String {
    case accentPrimary, primaryBackground, secondaryBackground, textDisabled, textPrimary, textSecondary
    
    var color: Color {
        return Color(self.rawValue)
    }
}

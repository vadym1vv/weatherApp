//
//  WeatherInfoComponent.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct WeatherInfoComponent: View {
    
    let weatherTitle: String
    let weatherSystemTitle: String
    let weatherDegree: String
    let location: String
    var fontSize: CGFloat = 60
    
    var body: some View {
        VStack {
            Image(systemName: "sun.max")
                .resizable()
                .scaledToFit()
                .foregroundStyle(ColorEnum.textSecondary.color)
            
            HStack {
                Text(location)
                Text(weatherDegree)
            }
            .font(.system(size: fontSize, weight: .bold, design: .rounded))
            .foregroundStyle(ColorEnum.textPrimary.color)
        }
    }
}

struct WeatherInfoComponent_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoComponent(weatherTitle: "Wind", weatherSystemTitle: WeatherConditionCodeEnum.clear.rawValue, weatherDegree: "-5", location: "Kyiv")
    }
}

//
//  WeatherConditionCodeEnum.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

public enum WeatherConditionCodeEnum: String, Codable, CaseIterable, Sendable {
    
    case clear
    case mostlyClear
    case partlyCloudy
    case mostlyCloudy
    case cloudy
    
    case foggy
    case haze
    case smoky
    case dust
    
    case drizzle
    case rain
    case heavyRain
    case sunShowers
    
    case isolatedThunderstorms
    case scatteredThunderstorms
    case strongStorms
    case thunderstorms
    
    case flurries
    case snow
    case heavySnow
    case blowingSnow
    case freezingRain
    case sleet
    case wintryMix
    
    case windy
    case breezy
    
    case frigid
    case extremeHeat
    case hail
    case tropicalStorm
    case hurricane
    
    case unknown
    
    public var systemIcon: String {
        switch self {
        case .clear, .mostlyClear:
            return "sun.max"
            
        case .partlyCloudy, .mostlyCloudy:
            return "cloud.sun"
        case .cloudy:
            return "cloud"
        case .foggy:
            return "cloud.fog"
        case .haze:
            return "sun.haze"
        case .smoky:
            return "smoke"
        case .dust:
            return "sun.dust"
        case .drizzle:
            return "cloud.drizzle"
        case .rain:
            return "cloud.rain"
        case .heavyRain:
            return "cloud.heavyrain"
        case .sunShowers:
            return "cloud.sun.rain"
        case .isolatedThunderstorms:
            return "cloud.bolt"
        case .scatteredThunderstorms, .strongStorms, .thunderstorms:
            return "cloud.bolt.rain"
        case .flurries, .snow:
            return "cloud.snow"
        case .heavySnow:
            return "cloud.snow.fill"
        case .blowingSnow:
            return "wind.snow"
        case .freezingRain, .sleet, .wintryMix:
            return "cloud.sleet"
        case .windy, .breezy:
            return "wind"
        case .frigid:
            return "thermometer.snowflake"
        case .extremeHeat:
            return "thermometer.sun"
        case .hail:
            return "cloud.hail"
        case .tropicalStorm:
            return "tropicalstorm"
        case .hurricane:
            return "hurricane"
        case .unknown:
            return "questionmark.circle"
        }
    }
}

struct WeatherConditionCodeEnum_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false) {
            ForEach(WeatherConditionCodeEnum.allCases, id: \.self) { weatherEnum in
                Image(systemName: weatherEnum.systemIcon)
            }
        }
    }
}


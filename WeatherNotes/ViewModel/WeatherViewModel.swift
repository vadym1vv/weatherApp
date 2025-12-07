//
//  WeatherViewModel.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import Foundation
import SwiftUI
import WeatherKit
import CoreLocation

@MainActor
class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var temperature: String = "--"
    @Published var conditionTitle: String = "--"
    @Published var conditionCode: WeatherConditionCodeEnum = .unknown
    @Published var city: String = "--"
    
    private let weatherService = WeatherService.shared
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager,
                                     didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager,
                                     didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        Task { await updateWeather(for: location) }
    }
    
    func updateWeather(for location: CLLocation) async {
        do {
            let weather = try await weatherService.weather(for: location)
            let current = weather.currentWeather
            
            temperature = "\(Int(current.temperature.value))°"
            conditionTitle = current.condition.description
            
            conditionCode = WeatherConditionCodeEnum(from: current.condition)
            
            let placemarks = try await CLGeocoder().reverseGeocodeLocation(location)
            city = placemarks.first?.locality ?? "Unknown"
            
        } catch {
            print("Weather error:", error)
        }
    }
}


extension WeatherConditionCodeEnum {
    init(from condition: WeatherCondition) {
        self = WeatherConditionCodeEnum(rawValue: condition.rawValue) ?? .unknown
    }
}

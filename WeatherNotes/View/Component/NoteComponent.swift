//
//  NoteComponent.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NoteComponent: View {
    
    let noteTitle: String
    let weatherTitle: String
    let weatherSystemTitle: String
    let weatherDegree: Int
    let location: String
    
    var body: some View {
        VStack {
            WeatherInfoComponent(weatherTitle: weatherTitle, weatherSystemTitle: weatherSystemTitle, weatherDegree: weatherDegree, location: location, fontSize: 30)
                .padding(.vertical)
                .frame(height: 200)
            Text(noteTitle)
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .padding([.bottom, .horizontal])
        }
        
        .frame(maxWidth: .infinity)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct NoteComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NoteComponent(noteTitle: "Running", weatherTitle: "Wind", weatherSystemTitle: WeatherConditionCodeEnum.snow.rawValue, weatherDegree: -5, location: "Kyiv")
            NoteComponent(noteTitle: "Running asfas fas fasf as f asf af asf asf asf af asf asf asf asf asf asf asf asf asf asf asf as fas fasf asf as fasf asf asf as fas f", weatherTitle: "Wind", weatherSystemTitle: WeatherConditionCodeEnum.snow.rawValue, weatherDegree: -5, location: "Kyiv")
        }
            .padding()
    }
}

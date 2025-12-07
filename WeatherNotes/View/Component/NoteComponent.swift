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
    let weatherDegree: String
    let location: String
    let date: Date
    
    var body: some View {
        VStack {
            WeatherInfoComponent(weatherTitle: weatherTitle, weatherSystemTitle: weatherSystemTitle, weatherDegree: weatherDegree, location: location, fontSize: 30)
                .padding(.vertical)
                .frame(height: 200)
            Group {
                Text(noteTitle)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .padding([.bottom, .horizontal])
                    .foregroundStyle(ColorEnum.textPrimary.color)
                HStack {
                    Spacer()
                    Text("\(date.formatted())")
                        .padding([.bottom, .trailing])
                }
            }
        }
        
        .frame(maxWidth: .infinity)
        .background(ColorEnum.secondaryBackground.color)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct NoteComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NoteComponent(noteTitle: "Running", weatherTitle: "Wind", weatherSystemTitle: WeatherConditionCodeEnum.snow.systemIcon, weatherDegree: "-5", location: "Kyiv", date: .now)
            NoteComponent(noteTitle: "Running asfas fas fasf as f asf af asf asf asf af asf asf asf asf asf asf asf asf asf asf asf as fas fasf asf as fasf asf asf as fas f", weatherTitle: "Wind", weatherSystemTitle: WeatherConditionCodeEnum.snow.systemIcon, weatherDegree: "-5", location: "Kyiv", date: .now)
        }
            .padding()
    }
}

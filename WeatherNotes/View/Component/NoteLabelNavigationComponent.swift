//
//  NoteLabelNavigationComponent.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NoteLabelNavigationComponent: View {
    
    let imgSystemName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: imgSystemName)
                .resizable()
                .scaledToFit()
                .padding()
                .padding(.top)
                .foregroundStyle(ColorEnum.accentPrimary.color)
            Text(title)
                .font(.system(size: 30, weight: .regular, design: .monospaced))
                .padding(.bottom)
                .foregroundStyle(ColorEnum.textPrimary.color)
        }
        .frame(maxWidth: .infinity)
        .background(ColorEnum.secondaryBackground.color)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct NoteLabelNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            NoteLabelNavigationComponent(imgSystemName: "note.text.badge.plus", title: "New Note")
            NoteLabelNavigationComponent(imgSystemName: "note.text.badge.plus", title: "New Note")
        }
        .frame(height: UIScreen.main.bounds.height / 2)
        .padding(.horizontal)
    }
}

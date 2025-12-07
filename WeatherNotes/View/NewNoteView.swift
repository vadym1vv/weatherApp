//
//  NewNoteView.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NewNoteView: View {
    
    
    @EnvironmentObject private var coreDataNoteVM: CoreDataNoteVM
    
    @State private var title: String? = nil
    
    var isSaveAvailable: Bool {
        if let title, !title.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack {
            WeatherInfoComponent(weatherTitle: "Wind", weatherSystemTitle: "sun.max", weatherDegree: -7, location: "Kyiv")
            Spacer()
            TextField("Note Title", text: Binding(get: {
                title ?? ""
            }, set: { userInput in
                title = userInput
            }))
            .frame(height: 44)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Button {
                coreDataNoteVM.newNote(noteTitle: title, weatherDegree: -7, weatherTitle: "Wind", weatherSystemTitle: "sun.max", location: "Kyiv")
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }
            .buttonStyle(.borderedProminent)
            .tint(isSaveAvailable ? .gray : .yellow)
            .disabled(!isSaveAvailable)
            .padding(.bottom)
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            .environmentObject(CoreDataNoteVM())
    }
}

//
//  NoteListView.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NoteListView: View {
    
    @EnvironmentObject private var coreDataNoteVM: CoreDataNoteVM
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(coreDataNoteVM.notes, id: \.self) { note in
                    if let noteTitle = note.noteTitle, let weatherTitle = note.weatherTitle, let weatherSystemTitle = note.weatherSystemTitle, let location = note.location {
                        NoteComponent(noteTitle: noteTitle, weatherTitle: weatherTitle, weatherSystemTitle: weatherSystemTitle, weatherDegree: Int(note.weatherDegree), location: location)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
            .environmentObject(CoreDataNoteVM())
    }
}

//
//  NoteListView.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NoteListView: View {
    
    @EnvironmentObject private var coreDataNoteVM: CoreDataNoteVM
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            TopBarNavigationComponent(
                leadingView:
                    Button {
                        router.path.removeLast()
                    } label:{
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("back")
                        }
                    },
                centerView:
                    Text("My Notes"),
                trailingView:
                    EmptyView()
            )
            .foregroundStyle(ColorEnum.textSecondary.color)
            VStack {
                if (coreDataNoteVM.notes.isEmpty) {
                    Spacer()
                        Image(systemName: "snowflake")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height / 3)
                            .foregroundStyle(ColorEnum.textSecondary.color)
                        Text("Nothing to dislay\n Try to add a new note")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(ColorEnum.textPrimary.color)
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(coreDataNoteVM.notes, id: \.self) { note in
                            if let noteTitle = note.noteTitle, let weatherTitle = note.weatherTitle, let weatherSystemTitle = note.weatherSystemTitle, let location = note.location, let weatherDegree = note.weatherDegree, let date = note.noteDate {
                                NoteComponent(noteTitle: noteTitle, weatherTitle: weatherTitle, weatherSystemTitle: weatherSystemTitle, weatherDegree: weatherDegree, location: location, date: date)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorEnum.primaryBackground.color)
        .navigationBarHidden(true)
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
            .environmentObject(CoreDataNoteVM())
            .environmentObject(Router())
    }
}

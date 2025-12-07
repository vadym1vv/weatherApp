//
//  CoreDataNoteVM.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import Foundation
import CoreData

class CoreDataNoteVM: CoreDataSettings {
    @Published var notes: [NoteEntity] = []
    
    override init(container: NSPersistentContainer = CoreDataSettings.shared.container) {
        super.init(container: container)
        fetchEntity()
    }
    
    func newNote(noteTitle: String?, weatherDegree: Int, weatherTitle: String, weatherSystemTitle: String, location: String, noteDate: Date = .now) {
        let newNoteEntity = NoteEntity(context: container.viewContext)
        newNoteEntity.noteTitle = noteTitle
        newNoteEntity.weatherDegree = Int32(weatherDegree)
        newNoteEntity.weatherTitle = weatherTitle
        newNoteEntity.weatherSystemTitle = weatherSystemTitle
        newNoteEntity.location = location
        newNoteEntity.noteDate = noteDate
        saveData()
        fetchEntity()
    }
    
    func fetchEntity() {
        notes = fetchEntities(NoteEntity.self)
    }
}

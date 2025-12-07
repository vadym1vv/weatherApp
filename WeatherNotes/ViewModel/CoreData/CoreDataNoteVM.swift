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
    
    func newNote(title: String?, weatherDegree: Int, weatherStatus: String, location: String, noteDate: Date = .now) {
        var newNoteEntity = NoteEntity(context: container.viewContext)
        newNoteEntity.title = title
        newNoteEntity.weatherDegree = Int32(weatherDegree)
        newNoteEntity.weatherStatus = weatherStatus
        newNoteEntity.location = location
        newNoteEntity.noteDate = noteDate
        saveData()
        fetchEntity()
    }
    
    func fetchEntity() {
        notes = fetchEntities(NoteEntity.self)
    }
}

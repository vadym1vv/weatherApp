//
//  NavigationPathEnum.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import Foundation
import SwiftUI

enum NavigationPathEnum: Identifiable, Hashable {
    var id: Self { self }

    case noteListView
    case newNoteView
    
    @ViewBuilder
    var navigationView: some View {
        switch self {
        case .noteListView:
            NoteListView()
        case .newNoteView:
            NewNoteView()
        }
    }
}

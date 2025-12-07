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
            Image(systemName: "sun.max")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: UIScreen.main.bounds.height / 4)
            
            Text("7C")
                .fontWeight(.heavy)
//                .font(.system(.largeTitle))
                .font(.system(size: 60, weight: .bold, design: .rounded))
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
                coreDataNoteVM.newNote(title: title, weatherDegree: -7, weatherStatus: "sun.max", location: "Kiev")
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

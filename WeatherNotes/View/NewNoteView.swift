//
//  NewNoteView.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI

struct NewNoteView: View {
    
    @EnvironmentObject private var coreDataNoteVM: CoreDataNoteVM
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var weatherViewModel: WeatherViewModel
    
    @State private var title: String? = nil
    
    var isSaveAvailable: Bool {
        if let title, !title.isEmpty {
            return true
        }
        return false
    }
    
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
                    Text("New Note"),
                trailingView:
                    EmptyView()
            )
            .foregroundStyle(ColorEnum.textSecondary.color)
            VStack {
                WeatherInfoComponent(weatherTitle: weatherViewModel.conditionTitle, weatherSystemTitle: weatherViewModel.conditionCode.systemIcon, weatherDegree: weatherViewModel.temperature, location: weatherViewModel.city)
                Spacer()
                TextField("Note Title", text: Binding(get: {
                    title ?? ""
                }, set: { userInput in
                    title = userInput
                }))
                .padding(.horizontal)
                .frame(height: 60)
                .background(ColorEnum.secondaryBackground.color)
                .foregroundStyle(ColorEnum.textPrimary.color)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Button {
                    coreDataNoteVM.newNote(noteTitle: title, weatherDegree: weatherViewModel.temperature, weatherTitle: weatherViewModel.conditionTitle, weatherSystemTitle: weatherViewModel.conditionCode.systemIcon, location: weatherViewModel.city)
                    router.path.removeLast()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .foregroundStyle(isSaveAvailable ? ColorEnum.textPrimary.color : ColorEnum.textDisabled.color)
                }
                .buttonStyle(.borderedProminent)
                .tint(isSaveAvailable ? ColorEnum.accentPrimary.color : ColorEnum.accentPrimary.color.opacity(0.5))
                .disabled(!isSaveAvailable)
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorEnum.primaryBackground.color)
        .navigationBarHidden(true)
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            .environmentObject(CoreDataNoteVM())
            .environmentObject(Router())
            .environmentObject(WeatherViewModel())
    }
}

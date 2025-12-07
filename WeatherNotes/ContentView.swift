//
//  ContentView.swift
//  WeatherNotes
//
//  Created by vadym vasylaki on 07.12.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var weatherViewModel: WeatherViewModel = WeatherViewModel()
    @StateObject private var coreDataNoteVM: CoreDataNoteVM = CoreDataNoteVM()
    @StateObject private var router: Router = Router()
    @StateObject private var networkMonitorVM: NetworkMonitorVM = NetworkMonitorVM()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                VStack {
                    WeatherInfoComponent(weatherTitle: weatherViewModel.conditionTitle, weatherSystemTitle: weatherViewModel.conditionCode.systemIcon, weatherDegree: weatherViewModel.temperature, location: weatherViewModel.city)
                        .frame(height: UIScreen.main.bounds.height / 2)
                    Spacer()
                    HStack {
                        Button {
                            router.path.append(NavigationPathEnum.newNoteView)
                        } label: {
                            NoteLabelNavigationComponent(imgSystemName: "note.text.badge.plus", title: "New Note")
                        }
                        
                        Button {
                            router.path.append(NavigationPathEnum.noteListView)
                        } label: {
                            NoteLabelNavigationComponent(imgSystemName: "list.bullet.rectangle.portrait", title: "My Notes")
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 5)

                }
                .padding()
            }
            .overlay {
                if (!networkMonitorVM.isConnected) {
                    VStack {
                        Image(systemName: "network")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height / 3)
                                .foregroundStyle(ColorEnum.textSecondary.color)
                            Text("Connection Error...")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(ColorEnum.textPrimary.color)
                        Button {
                            networkMonitorVM.checkConnectionWithPing { status in
                                DispatchQueue.main.async {
                                    networkMonitorVM.isConnected = status
                                }
                            }
                        } label: {
                            Text("Check for connection")
                                .frame(maxWidth: UIScreen.main.bounds.width / 2)
                                .frame(height: 44)
                                .foregroundStyle( ColorEnum.textPrimary.color )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint( ColorEnum.accentPrimary.color)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(ColorEnum.secondaryBackground.color)
                }
            }
            .background(ColorEnum.primaryBackground.color)
            .navigationDestination(for: NavigationPathEnum.self) { path in
                path.navigationView
                    .environmentObject(router)
                    .environmentObject(weatherViewModel)
                    .environmentObject(coreDataNoteVM)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

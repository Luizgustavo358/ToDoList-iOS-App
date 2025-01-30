//
//  ContentView.swift
//  ToDoList
//
//  Created by Luiz Gustavo Bragança dos Santos on 09/01/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        // signed in
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview("English") {
    MainView()
        .environment(\.locale, Locale(identifier: "EN"))
}

#Preview("Portuguese") {
    MainView()
        .environment(\.locale, Locale(identifier: "PT-BR"))
}

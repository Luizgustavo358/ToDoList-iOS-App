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
                // signed in
                ToDoListView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}

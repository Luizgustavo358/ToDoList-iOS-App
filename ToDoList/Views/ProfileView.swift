//
//  ProfileView.swift
//  ToDoList
//
//  Created by Luiz Gustavo Bragança dos Santos on 09/01/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                        .padding()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info
        VStack(alignment: .leading) {
            // Name
            Text("Name: ")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            
            Text(user.name)
                .font(.body)
                .padding(.bottom, 5)
            
            
            // Email
            Text("Email:")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            
            Text(user.email)
                .font(.body)
                .padding(.bottom, 5)
            
            
            // Member Since
            Text("Member Since:")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .numeric, time: .shortened))")
                .font(.body)
                .padding(.bottom, 10)
        }
        
        // Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .padding()
        .background(Color(red: 1, green: 0, blue: 0))
        .foregroundStyle(.white)
        .clipShape(Capsule())
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}

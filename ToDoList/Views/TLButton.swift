//
//  TLButton.swift
//  ToDoList
//
//  Created by Luiz Gustavo Bragança dos Santos on 11/01/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview("English") {
    TLButton(title: "Value", background: .pink) {
        // Action
    }
    .environment(\.locale, Locale(identifier: "EN"))
}

#Preview("Portuguese") {
    TLButton(title: "Value", background: .pink) {
        // Action
    }
    .environment(\.locale, Locale(identifier: "PT-BR"))
}

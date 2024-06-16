//
//  ButtonView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 16.06.24.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(isDisabled ? .black : .white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isDisabled ? Color.clear : Color.black)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
        }
        .disabled(isDisabled)
        .padding(.horizontal, 50)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Title", isDisabled: true, action: {})
    }
}

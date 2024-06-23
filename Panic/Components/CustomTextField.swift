//
//  CustomTextField.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.2), lineWidth: 2)
            )
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Placeholder")
    }
}

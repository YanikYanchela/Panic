//
//  InputView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 16.06.24.
//

import SwiftUI

struct InputView: View {

    @Binding var text: String
    let placeholder: String
    var isSecureField: Bool = false
    
    @FocusState var isEnabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if isSecureField {
                inputField(SecureField(placeholder, text: $text))
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
            } else {
                inputField(TextField(placeholder, text: $text))
                    .autocorrectionDisabled()
            }
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.black.opacity(0.2))
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 0.2), value: isEnabled)
            }
            .frame(height: 2)
        }
    }
    
    private func inputField<Content: View>(_ content: Content) -> some View {
        content
            .accentColor(.black)
            .focused($isEnabled)
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), placeholder: "Placeholder")
    }
}

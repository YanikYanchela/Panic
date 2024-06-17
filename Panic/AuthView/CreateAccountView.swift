//
//  CreateAccountView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 17.06.24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var showPassword = false
    
    @Environment(\.dismiss) var dismiss
    
    var isButtonDisabled: Bool {
        !isValidEmail(email) || password.isEmpty || password.count < 6 || password != confirmPassword
    }
    
    var isCheckPassword: Bool { password == confirmPassword }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Spacer().frame(height: 50)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Create\naccount.")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("It takes less than a minute..")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 20)
                   
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    InputView(text: $fullname, placeholder: "Full name")
                        .autocapitalization(.words)
                    
                    InputView(text: $email, placeholder: "Email")
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $password, placeholder: "Password", isSecureField: !showPassword)
                            .keyboardType(.asciiCapable)
                        
                        Button(action: { showPassword.toggle() }) {
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.black)
                                .padding(.trailing, 8)
                        }
                    }
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword, placeholder: "Confirm password", isSecureField: !showPassword)
                            .keyboardType(.asciiCapable)
                        
                        Image(systemName: isCheckPassword ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 8)
                    }
                }
                .padding(.horizontal, 30)
                
                ButtonView(title: "Create an Account", isDisabled: isButtonDisabled) {
                    // Action for create account
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 5) {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    
                    Button("Sign in.") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    .bold()
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color.green)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

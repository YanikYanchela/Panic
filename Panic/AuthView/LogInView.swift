//
//  LogInView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 16.06.24.
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    @State var showPassword = false
    
    var isButtonDisabled: Bool {
        !isValidEmail(email) || password.isEmpty || password.count < 6
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Spacer().frame(height: 50)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome \nback.")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("login to continue...")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                
                VStack(spacing: 40) {
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
                    
                    Button("forgot password?") {
                        // Action for forgot password
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal, 30)
                
                ButtonView(title: "Log in", isDisabled: isButtonDisabled) {
                    // Action for login
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 5) {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Create one.")
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

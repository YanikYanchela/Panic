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
    @State var showPassword = true
    
    var isButtonDisabled: Bool {
        email.isEmpty || !email.contains("@") || !email.contains(".") || password.isEmpty || password.count < 6
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
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
                
                VStack(spacing: 20) {
                    InputView(text: $email, placeholder: "Email")
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $password, placeholder: "Password", isSecureField: showPassword)
                        
                        Button(action: { showPassword.toggle() }) {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
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
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Create one.")
                            .foregroundColor(.black)
                    }
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

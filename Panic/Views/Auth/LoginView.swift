//
//  LoginView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 16.06.24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
                    InputView(text: $viewModel.email, placeholder: "Email")
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $viewModel.password, placeholder: "Password", isSecureField: !viewModel.showPassword)
                            .keyboardType(.asciiCapable)
                        
                        Button(action: { withAnimation(.easeInOut(duration: 0.1)) { viewModel.showPassword.toggle() }}) {
                            Image(systemName: viewModel.showPassword ? "eye.fill" : "eye.slash.fill")
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
                
                ButtonView(title: "Log in", isDisabled: viewModel.isButtonDisabled  ) {
                    viewModel.login()
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

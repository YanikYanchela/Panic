//
//  CreateAccountView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 17.06.24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @StateObject var viewModel = CreateAccountViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
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
                    InputView(text: $viewModel.fullname, placeholder: "Full name")
                        .autocapitalization(.words)
                    
                    InputView(text: $viewModel.email, placeholder: "Email")
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $viewModel.password, placeholder: "Password", isSecureField: !viewModel.showPassword)
                            .keyboardType(.asciiCapable)
                        
                        Button(action: { withAnimation(.easeInOut(duration: 0.1)){ viewModel.showPassword.toggle() }}) {
                            Image(systemName: viewModel.showPassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.black)
                                .padding(.trailing, 8)
                        }
                    }
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $viewModel.confirmPassword , placeholder: "Confirm password", isSecureField: !viewModel.showPassword)
                            .keyboardType(.asciiCapable)
                        
                        Image(systemName: viewModel.isCheckPassword ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 8)
                            .rotationEffect(viewModel.isCheckPassword ? .degrees(0) : .degrees(360))
                            .animation(.easeInOut(duration: 0.4), value: viewModel.isCheckPassword)
                    }
                }
                .padding(.horizontal, 30)
                
                ButtonView(title: "Create an Account", isDisabled: viewModel.isButtonDisabled) {
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

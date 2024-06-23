//
//  CreateAccountViewModel.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import Foundation

final class CreateAccountViewModel: AuthViewModel {
   
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showPassword = false
    
    var isConfirmPasswordEnabled: Bool = true
    
  
    func createAccount() {
        print("Account created for: \(fullname), \(email)")
    }
}

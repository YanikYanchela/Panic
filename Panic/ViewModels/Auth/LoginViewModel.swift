//
//  LoginViewModel.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import Foundation

final class LoginViewModel: AuthViewModel {
   
    @Published var email = ""
    @Published  var password = ""
    @Published  var showPassword = false
    
    var isConfirmPasswordEnabled: Bool = false
    var confirmPassword: String = ""
    var fullname: String = ""
    
   
    
    func login() {
        
    }
}


//
//  AuthViewModel.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import Foundation

protocol AuthViewModel: ObservableObject {
    var fullname: String { get set }
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    var showPassword: Bool { get set }
    var isConfirmPasswordEnabled: Bool { get set }
    var isButtonDisabled: Bool { get }
    var isCheckPassword: Bool { get }
    
    func isValidEmail(_ email: String) -> Bool
}

extension AuthViewModel {
    var isButtonDisabled: Bool {
        if isConfirmPasswordEnabled { 
            return !isValidEmail(email) || password.isEmpty || password.count < 6 || password != confirmPassword || fullname.isEmpty
        } else {
            return !isValidEmail(email) || password.isEmpty || password.count < 6
        }
    }
    
    var isCheckPassword: Bool {
        if isConfirmPasswordEnabled { 
            return password == confirmPassword
        } else {
            return false
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

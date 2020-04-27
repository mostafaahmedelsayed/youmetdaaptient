////
////  validation.swift
////  careMatePatient
////
////  Created by khabeer on 4/18/20.
////  Copyright © 2020 khabeer. All rights reserved.
////
//
//
//
//import Foundation
//
//class Validation {
//    
//    let PassowrdMinLength = 8
//    let PhoneMinLength = 5
//    let PhoneMaxLength = 12
//    
//    typealias ValidationResult = Result< (), Errorr>
//    
//    // Name
//    
//    class func validateName(_ name: String) -> ValidationResult {
//        guard name.trimmed.characters.count > 0 else {
//            return .error(.invalidName)
//            
//            
//        }
//        return .success()
//    }
//    
//    class func isValidName(_ name: String) -> Bool {
//        return validateName(name).isSuccess
//    }
//    
//    
//    
//    // Username
//    
//    
//    class func validateUsername(_ username: String) -> ValidationResult {
//        let count = username.trimmed.characters.count
//        
//        if count == 0
//        {
//            return .error(.enterUsername)
//        }
//        else if count > 0
//        {
//            return .success()
//        }
//        else
//        {
//            return .error(.invalidUsername)
//        }
//    }
//    
//    class func validateUserPassword(_ password: String) -> ValidationResult {
//        let PassowrdMinLength = 8
//        
//        let count = password.trimmed.characters.count
//        
//        if count == 0
//        {
//            return .error(.enterEightCharPassword)
//        }
//        else if count >= PassowrdMinLength
//        {
//            return .success()
//        }
//        else
//        {
//            return .error(.enterEightCharPassword)
//        }
//    }
//    
//    class func validateUername(_ username: String) -> ValidationResult {
//        guard username.trimmed.characters.count > 0 else {
//            return .error(.invalidUsername)
//        }
//        return .success()
//    }
//    
//    class func isValidUsername(_ username: String) -> Bool {
//        return validateUsername(username).isSuccess
//    }
//    
//    // Password
//    
//    class func validatePassword(_ password: String) -> ValidationResult {
//        let PassowrdMinLength = 8
//        
//        guard password.characters.count >= PassowrdMinLength else {
//            return .error(.invalidPassword)
//        }
//        return .success()
//    }
//    
//    // ValidateUserName
//    
//    class func ValidateUserName(_ password: String) -> ValidationResult {
//        let PassowrdMinLength = 3
//        
//        guard password.characters.count >= PassowrdMinLength else {
//            return .error(.invalidPassword)
//        }
//        return .success()
//    }
//    
//    class func isValidUserName(_ password: String) -> Bool {
//        return ValidateUserName(password).isSuccess
//    }
//    class func isValidPassword(_ password: String) -> Bool {
//        return validateUserPassword(password).isSuccess
//    }
//    
//    
//    // Email
//    
//    class func validateEmail(_ email: String) -> ValidationResult {
//        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
//        guard NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email) else {
//            return .error(.invalidEmail)
//        }
//        return .success()
//    }
//    
//    class func isValidEmail(_ email: String) -> Bool {
//        return validateEmail(email).isSuccess
//    }
//    
//    // Phone
//    
//    class func validatePhone(_ phone: String) -> ValidationResult {
//        let set = CharacterSet(charactersIn: "0123456789+").inverted
//        let arr = phone.components(separatedBy: set)
//        guard arr.count == 1 else {
//            return .error(.invalidNumber)
//        }
//        
//        let PhoneMinLength = 9
//        let PhoneMaxLength = 12
//        guard phone.characters.count >= PhoneMinLength && phone.characters.count <= PhoneMaxLength else {
//            return .error(.invalidNumber)
//        }
//        
//        return .success()
//    }
//    
//    class func isValidPhone(_ phone: String) -> Bool {
//        if phone.isEmpty
//        {
//            return true
//        }
//        return validatePhone(phone).isSuccess
//    }
//}

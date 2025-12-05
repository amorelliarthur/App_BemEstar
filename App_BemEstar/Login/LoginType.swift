//
//  LoginType.swift
//  App_BemEstar
//
//  Created by user288583 on 12/5/25.
//

import CryptoKit
import Foundation

extension LoginType {
    init(username: String, passwordHash: String) {
        self.username = username
        self.passwordHash = passwordHash
    }
}


struct LoginType {
    let username: String
    let passwordHash: String
    
    init(username: String, password: String) {
        self.username = username
        self.passwordHash = LoginType.sha256(password)
    }
    
    public static func sha256(_ input: String) -> String {
        let data = Data(input.utf8)
        let digest = SHA256.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}

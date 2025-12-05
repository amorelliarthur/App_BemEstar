//
//  LoginStorage.swift
//  App_BemEstar
//
//  Created by user288583 on 12/5/25.
//

import Foundation

struct LoginStorage {

    private static let key = "savedUsers"

    // Salva array de LoginType
    static func saveUsers(_ users: [LoginType]) {
        let data = users.map { ["username": $0.username, "passwordHash": $0.passwordHash] }
        UserDefaults.standard.set(data, forKey: key)
    }

    // Carrega array de LoginType
    static func loadUsers() -> [LoginType] {
        guard let array = UserDefaults.standard.array(forKey: key) as? [[String: String]] else {
            return []
        }
        return array.compactMap { dict in
            if let username = dict["username"], let passwordHash = dict["passwordHash"] {
                return LoginType(username: username, passwordHash: passwordHash)
            }
            return nil
        }
    }
}

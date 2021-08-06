//
//  userFirebase.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 06/08/2021.
//

import Foundation
import FirebaseFirestore

extension appUser{
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [appUser] {
        var users = [appUser]()
        for document in documents {
            users.append(appUser(firstName: document["firstName"] as? String ?? "",
                                 lastName: document["lastName"] as? String ?? "",
                                 role: document["role"] as? String ?? ""))
        }
        return users
    }
}

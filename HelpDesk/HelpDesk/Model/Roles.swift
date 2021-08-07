//
//  Roles.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 31/07/2021.
//

import Foundation
import FirebaseFirestore

class Roles {
  
    var role : [String] = [
        "Administrateur",
        "Chef de Porjet",
        "Technicien",
        "Utilisateur"
    ]
    
    var name : String!
    let database = Firestore.firestore()
    
    func createRole(name : String) {
        let docRef = database.document("Role/\(name)")
        
        docRef.setData(["name": name])
    }
    
}

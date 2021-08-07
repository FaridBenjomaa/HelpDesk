//
//  Categorie.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

class Categorie {

    var name : String!
    let database = Firestore.firestore()
    
    func createCategorie(name : String) {
        let docRef = database.document("Categorie/\(name)")
        
        docRef.setData(["name": name])
    }
    
    
}

//
//  CategorieServices.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

class CategorieServices {
    let database = Firestore.firestore()
    
    func get(collectionID: String, handler: @escaping ([appCategorie]) -> Void) {
        database.collection("Categorie")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error)
                    handler([])
                }else{
                    handler(appCategorie.build(from: querySnapshot?.documents ?? [ ]))
                }
            }
                
    }
}

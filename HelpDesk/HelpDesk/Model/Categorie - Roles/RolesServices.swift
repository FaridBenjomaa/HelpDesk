//
//  RolesServices.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

class RolesServices {
    let database = Firestore.firestore()
    
    func get(collectionID: String, handler: @escaping ([appRole]) -> Void) {
        database.collection("Role")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error)
                    handler([])
                }else{
                    handler(appRole.build(from: querySnapshot?.documents ?? [ ]))
                }
            }
                
    }
}

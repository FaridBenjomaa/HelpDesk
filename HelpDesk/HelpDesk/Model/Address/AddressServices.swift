//
//  AddressServices.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

class AddressServices {
    let database = Firestore.firestore()
    
    func get(collectionID: String, handler: @escaping ([appAddress]) -> Void) {
        database.collection("Adresse")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error)
                    handler([])
                }else{
                    handler(appAddress.build(from: querySnapshot?.documents ?? [ ]))
                }
            }
    }
}


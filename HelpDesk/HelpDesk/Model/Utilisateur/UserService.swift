//
//  UserService.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 06/08/2021.
//

import Foundation
import FirebaseFirestore

class UserService {
    let database = Firestore.firestore()
    
    func get(collectionID: String, handler: @escaping ([appUser]) -> Void) {
        database.collection("Users")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error)
                    handler([])
                }else{
                    handler(appUser.build(from: querySnapshot?.documents ?? [ ]))
                }
            }
                
    }
}

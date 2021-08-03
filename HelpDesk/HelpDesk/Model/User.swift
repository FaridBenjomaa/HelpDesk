//
//  Users.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 31/07/2021.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore


class  User  {
    
    var firstName : String!
    var lastName : String!
    var username : String!
    var email : String!
    var ref = Database.database(url: "https://helpdeskapp-ba9e6-default-rtdb.europe-west1.firebasedatabase.app").reference()
    let database = Firestore.firestore()
    
    var userList : [String] = []
    var userdetail : [String] = []
    
    init(){

    }
    
    init(firstName: String, lastName : String, username : String, email : String ) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.email = email
    }
    
    init(firstName: String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
    }
   
    func createUser(username : String, firstName: String, lastName: String, email: String, role : String, userid: String){
       ref = Database.database(url: "https://helpdeskapp-ba9e6-default-rtdb.europe-west1.firebasedatabase.app").reference()
  
        ref.child("Users/\(userid)/userName").setValue(username)
        ref.child("Users/\(userid)/firstName").setValue(firstName)
        ref.child("Users/\(userid)/lastName").setValue(lastName)
        ref.child("Users/\(userid)/email").setValue(email)
        ref.child("Users/\(userid)/role").setValue(role)
        
        let docRef = database.document("Users/\(username)")
        docRef.setData(["UserName": username, "firstName": firstName, "lastName": lastName, "email": email, "role": role, "userId": userid])
    }
    
    func getUser(userid: String) {
        ref.child("Users").child(userid).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let firstName = value?["firstName"] as? String ?? ""
            let lastName = value?["lastName"] as? String ?? ""
            
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    func getUserToDatabase(username: String){
        let docRef = database.collection("Users").document("\(username)")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
}


//
//  Address.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

class Address {

    //MARK: Properties
    var name : String!
    var streetNumber: String!
    var streetName: String!
    var streetNameOptionel: String!
    var zipCode: String!
    var cityName: String!
    let database = Firestore.firestore()
  
 
    //MARK: Public Functions
    func createAddress(name : String, streetNumber: String, streetName: String, streetNameOptionel: String, zipCode: String, cityName: String ) {
        let docRef = database.document("Adresse/\(name)")
   
        docRef.setData(["name": name, "streetNumber": streetNumber, "streetName": streetName, "streetNameOptionel" : streetNameOptionel, "zipCode" : zipCode, "cityName": cityName])
    }
    
    func createAddressWithoutStreetNameOptionel(name : String, streetNumber: String, streetName: String, zipCode: String, cityName: String ) {
        let docRef = database.document("Adresse/\(name)")
   
        docRef.setData(["name": name, "streetNumber": streetNumber, "streetName": streetName,  "zipCode" : zipCode, "cityName": cityName])
    }
    
    func createAddressWithoutStreetNameOptionelandWhitoutStreetNumber(name : String, streetName: String, zipCode: String, cityName: String ) {
        let docRef = database.document("Adresse/\(name)")
   
        docRef.setData(["name": name,  "streetName": streetName,  "zipCode" : zipCode, "cityName": cityName])
    }
    
    func createAddressWhitoutStreetNumber(name : String,  streetName: String, streetNameOptionel: String, zipCode: String, cityName: String ) {
        let docRef = database.document("Adresse/\(name)")
   
        docRef.setData(["name": name, "streetName": streetName, "streetNameOptionel" : streetNameOptionel, "zipCode" : zipCode, "cityName": cityName])
    }
    
}

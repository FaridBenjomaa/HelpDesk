//
//  AddressFirebase.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import Foundation
import FirebaseFirestore

extension appAddress{
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [appAddress] {
        var address = [appAddress]()
        for document in documents {
            address.append(appAddress(name: document["name"] as? String ?? "",
                                        streetNumber: document["streetNumber"] as? String ?? "",
                                        streetName: document["streetName"] as? String ?? "",
                                        streetNameOptionel: document["streetNameOptionel"] as? String ?? "",
                                        zipCode: document["zipCode"] as? String ?? "",
                                        cityName: document["cityName"] as? String ?? ""))
        }
        return address
    }


}


 



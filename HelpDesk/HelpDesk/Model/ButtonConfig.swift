//
//  ButtonConfig.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 02/08/2021.
//

import Foundation
import UIKit
import FirebaseAuth

class ButtonConfig : UIViewController {
    
    func setUpWhiteButtons(button : UIButton){
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.red.cgColor
    }
    
    func setUpRedButtons(button : UIButton){
        button.layer.cornerRadius = 20
    }
    
    func logout(){
        try? Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
}

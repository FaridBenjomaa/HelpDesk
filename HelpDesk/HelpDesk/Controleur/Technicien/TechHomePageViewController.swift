//
//  TechHomePageViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 31/07/2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class TechHomePageViewController: UIViewController {
    
    
    
    //MARK: Outlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ajoutUtilisateurButton: UIButton!
    @IBOutlet weak var ajoutLieuxButton: UIButton!
    @IBOutlet weak var ajoutCategorieButton: UIButton!
    @IBOutlet weak var Ajoutlabel: UILabel!
    @IBOutlet weak var makeResquestButton: UIButton!
    @IBOutlet weak var showRequestButton: UIButton!
    
    //MARK: Properties
    var button = ButtonConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setUpWhiteButtons(button: ajoutUtilisateurButton)
        button.setUpWhiteButtons(button: ajoutLieuxButton)
        button.setUpWhiteButtons(button: ajoutCategorieButton)
        button.setUpWhiteButtons(button: showRequestButton)
        button.setUpRedButtons(button: makeResquestButton)
        
        
        if let user  = Auth.auth().currentUser {
            
            let ref = Database.database(url: "https://helpdeskapp-ba9e6-default-rtdb.europe-west1.firebasedatabase.app").reference()
            let userID = Auth.auth().currentUser?.uid
            
            ref.child("Users").child(userID!).observeSingleEvent(of: .value) { snapshot in
                let value = snapshot.value as? NSDictionary
                let firstName = value?["firstName"] as? String ?? "no user name"
                let lastName = value?["lastName"] as? String ?? "no user name"
                self.firstNameLabel.text = firstName
                self.lastNameLabel.text = lastName
                
                if (value?["role"]) as? String == "Technicien" {
                    self.HideButton(bool: true)
                }else  if (value?["role"]) as? String == "Administrateur" {
                    self.HideButton(bool: false)
                }
            }
            
        }else {
            fatalError("erreur aucun utilisateur connecter")
        }
        
        
    }
    
    //MARK: Private Functions
    private func HideButton(bool : Bool){
        Ajoutlabel.isHidden = bool
        ajoutLieuxButton.isHidden = bool
        ajoutCategorieButton.isHidden = bool
        ajoutUtilisateurButton.isHidden = bool
        
    }
    
    
    //MARK: actions
    @IBAction func logoutButtonTapped(_ sender: Any) {
        try? Auth.auth().signOut()
         dismiss(animated: true, completion: nil)
        button.logout()
    }
    
}



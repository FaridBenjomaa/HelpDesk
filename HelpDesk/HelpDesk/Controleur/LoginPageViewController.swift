//
//  LoginPageViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 30/07/2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginPageViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var logoFull: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var connexionButton: UIButton!
    @IBOutlet weak var inscriptionButton: UIButton!
    
    //MARK: Properties
    var user = User()
    var button = ButtonConfig()
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()

        button.setUpWhiteButtons(button: inscriptionButton)
        button.setUpRedButtons(button: connexionButton)
        setupTextFieldManager()
    }
    
    //MARK: Private Functions
    private func setupTextFieldManager() {
        idTextField.delegate = self
        passwordTextfield.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    

    //MARK: Actions
    @objc private func hideKeyboard() {
        idTextField.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }
    
    @IBAction func connexionButtonTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: idTextField.text!, password: passwordTextfield.text!) { (authResult, error) in
            if error != nil {
                print(error.debugDescription)
            }else {
                let ref = Database.database(url: "https://helpdeskapp-ba9e6-default-rtdb.europe-west1.firebasedatabase.app").reference()
                let userID = Auth.auth().currentUser?.uid
                
                ref.child("Users").child(userID!).observeSingleEvent(of: .value) { snapshot in
                    let value = snapshot.value as? NSDictionary
                
                    if (value?["role"]) as? String == "Technicien" {
                        self.performSegue(withIdentifier: "connexionToTechHome", sender: self)
                    }else  if (value?["role"]) as? String == "Administrateur" {
                        self.performSegue(withIdentifier: "connexionToAdminHome", sender: self)
                    }else if (value?["role"]) as? String == "Utilisateur" {
                        self.performSegue(withIdentifier: "connexionToUserHome", sender: self)
                    }
            
                }
            }
        }
    }
 
}

extension LoginPageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

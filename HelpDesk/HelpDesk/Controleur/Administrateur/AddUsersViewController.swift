//
//  AddUsersViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 31/07/2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddUsersViewController: UIViewController {
    
    
    //MARK: Properties
    var button = ButtonConfig()
    var user = User()
    var role = Roles()
    var roleName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setUpWhiteButtons(button: valideButton)
        setupTextFieldManager()
    }
    
    //MARK: Outlets
    @IBOutlet weak var rolePickerView: UIPickerView!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var valideButton: UIButton!
    
    //MARK: Actions
    @IBAction func valider(_ sender: Any) {
        if firstName.text != "" && lastname.text != "" {
            let username = "\(firstName.text!).\(lastname.text!)"
            let email = "\(username)@test.com"
            print(email)
            
            Auth.auth().createUser(withEmail: email, password: passwordTextfield.text!) { (authResult, error) in
                if error != nil {
                    print(error.debugDescription)
                }else{
                    let ref = Database.database(url: "https://helpdeskapp-ba9e6-default-rtdb.europe-west1.firebasedatabase.app").reference()
                    let userID = Auth.auth().currentUser?.uid
                    
                    ref.child("Users").child(userID!).setValue(["userName": username])
                    self.user.createUser(username: username, firstName: self.firstName.text!, lastName: self.lastname.text!, email: email,role: self.roleName, userid: userID!)
                    
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }else {
            print("Erreur de connexion")
        }
    }
    
    
    //MARK: Private Functions
    @objc private func hideKeyboard() {
        firstName.resignFirstResponder()
        lastname.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }
    
    private func setupTextFieldManager() {
        firstName.delegate = self
        lastname.delegate = self
        passwordTextfield.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    
}

extension AddUsersViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension AddUsersViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return role.role.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let roleName = role.role[row]
    
        return roleName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        roleName =  role.role[row]
        
    }
    
}






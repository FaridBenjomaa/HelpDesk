//
//  AddCategoriesViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import UIKit

class AddCategoriesViewController: UIViewController {

    //MARK: Properties
    var button = ButtonConfig()
    var categorie = Categorie()
    var role = Roles()
    
    //MARK: Outlets
    @IBOutlet weak var addCategorieTextField: UITextField!
    @IBOutlet weak var addCategorieValideButton: UIButton!
    @IBOutlet weak var addCategorieAndContinue: UIButton!
    
    @IBOutlet weak var addRoleAndContinue: UIButton!
    @IBOutlet weak var addRoleValideButton: UIButton!
    @IBOutlet weak var addRoleTextField: UITextField!
    
    
    //MARK: Actions
    @IBAction func valideAddedCategorie(_ sender: Any) {
        let categorieName = addCategorieTextField.text
        categorie.createCategorie(name: categorieName!)
       
    }
    @IBAction func valideAddedCategorieAndClose(_ sender: Any) {
        let categorieName = addCategorieTextField.text
        categorie.createCategorie(name: categorieName!)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func valideAddedRole(_ sender: Any) {
        let roleName = addRoleTextField.text
        role.createRole(name: roleName!)
    }
    
    @IBAction func valideAddedRoleAndClose(_ sender: Any) {
        let roleName = addRoleTextField.text
        role.createRole(name: roleName!)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dissmissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setUpWhiteButtons(button: addRoleAndContinue)
        button.setUpRedButtons(button: addRoleValideButton)
        button.setUpWhiteButtons(button: addCategorieAndContinue)
        button.setUpRedButtons(button: addCategorieValideButton)
        setupTextFieldManager()
    }
    
    //MARK: Privates Func
    
    @objc private func hideKeyboard() {
        addCategorieTextField.resignFirstResponder()
        addRoleTextField.resignFirstResponder()
    }
    
    private func setupTextFieldManager() {
        addCategorieTextField.delegate = self
        addRoleTextField.delegate = self
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
}

extension AddCategoriesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

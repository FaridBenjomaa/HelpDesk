//
//  AddAdresseViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import UIKit

class AddAdresseViewController: UIViewController {

    //MARK: Properties
    var button = ButtonConfig()
    var address = Address()
    
    
    //MARK: Outlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetNumberTextField: UITextField!
    @IBOutlet weak var streetNameTextField: UITextField!
    @IBOutlet weak var streetNameOptionelTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var addAdressButton: UIButton!
    @IBOutlet weak var addNewAddressButton: UIButton!
    
    //MARK: Actions
    @IBAction func addAddressTappedButton(_ sender: Any) {
        createAddressToDataBase()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func addNewAdressTappedButton(_ sender: Any) {
        createAddressToDataBase()
        clearTextField()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setUpRedButtons(button: addAdressButton)
        button.setUpWhiteButtons(button: addNewAddressButton)
        setupTextFieldManager()

    }
    
    //MARK: Privates Func
    @objc private func hideKeyboard() {
        nameTextField.resignFirstResponder()
        streetNumberTextField.resignFirstResponder()
        streetNameTextField.resignFirstResponder()
        streetNameOptionelTextField.resignFirstResponder()
        zipCodeTextField.resignFirstResponder()
        cityNameTextField.resignFirstResponder()
    }
    
    private func setupTextFieldManager() {
        nameTextField.delegate = self
        streetNumberTextField.delegate = self
        streetNameTextField.delegate = self
        streetNameOptionelTextField.delegate = self
        zipCodeTextField.delegate = self
        cityNameTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func clearTextField(){
        nameTextField.text = ""
        streetNameTextField.text = ""
        streetNumberTextField.text = ""
        streetNameOptionelTextField.text = ""
        zipCodeTextField.text = ""
        cityNameTextField.text = ""
    }
    
    fileprivate func createAddressToDataBase() {
        if streetNameOptionelTextField.text != "" && streetNumberTextField.text != "" {
            address.createAddress(name: nameTextField.text!,
                                  streetNumber: streetNumberTextField.text!,
                                  streetName: streetNameTextField.text!,
                                  streetNameOptionel: streetNameOptionelTextField.text!,
                                  zipCode: zipCodeTextField.text!,
                                  cityName: cityNameTextField.text!)
        }else if streetNameOptionelTextField.text != "" && streetNumberTextField.text == ""{
            address.createAddressWhitoutStreetNumber(name: nameTextField.text!,
                                                     streetName: streetNameTextField.text!,
                                                     streetNameOptionel: streetNameOptionelTextField.text!,
                                                     zipCode: zipCodeTextField.text!,
                                                     cityName: cityNameTextField.text!)
        }else if streetNameOptionelTextField.text == "" && streetNumberTextField.text != ""{
            address.createAddressWithoutStreetNameOptionel(name: nameTextField.text!,
                                                           streetNumber: streetNumberTextField.text!,
                                                           streetName: streetNameTextField.text!,
                                                           zipCode: zipCodeTextField.text!,
                                                           cityName: cityNameTextField.text!)
        }else if streetNameOptionelTextField.text == "" && streetNumberTextField.text == ""{
            address.createAddressWithoutStreetNameOptionelandWhitoutStreetNumber(name: nameTextField.text!,
                                                                                 streetName: streetNameTextField.text!,
                                                                                 zipCode: zipCodeTextField.text!,
                                                                                 cityName: cityNameTextField.text!)
        }
    }

}

extension AddAdresseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

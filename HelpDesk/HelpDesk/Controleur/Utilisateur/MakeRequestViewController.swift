//
//  MakeRequestViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 16/08/2021.
//

import UIKit

class MakeRequestViewController: UIViewController {

   //MARK: Properties
    var button = ButtonConfig()
    var categorieName : String!
    var placeName : String!
   
    private var categorieService: CategorieServices?
       private var allCategories = [appCategorie]() {
           didSet {
               DispatchQueue.main.async {
                   self.categories = self.allCategories
               }
           }
       }
    
    var categories = [appCategorie]() {
        didSet {
            DispatchQueue.main.async {
                self.categoriePickerView.reloadAllComponents()
            }
        }
    }
    
    private var addressService: AddressServices?
       private var allAddress = [appAddress]() {
           didSet {
               DispatchQueue.main.async {
                   self.address = self.allAddress
               }
           }
       }
    
    var address = [appAddress]() {
        didSet {
            DispatchQueue.main.async {
                self.placePickerView.reloadAllComponents()
            }
        }
    }
    
    
    
    
  
    //MARK: Fonctions
    func loadData() {
        let service = CategorieServices()
        service.get(collectionID: "Categorie") { categories in
                self.allCategories = categories
            }
        let addressService = AddressServices()
        addressService.get(collectionID: "Address") { address in
            self.allAddress = address
        }
        }
    
    
    //MARK: Outlets
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var requestTitleTextField: UITextField!
    @IBOutlet weak var requestTextField: UITextField!
    
    @IBOutlet weak var placePickerView: UIPickerView!
    @IBOutlet weak var categoriePickerView: UIPickerView!
    
    
    //MARK: Actions
    @IBAction func sendRequestTappedButton(_ sender: Any) {
        
    }
    
    //MARK: Private Functions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    
}

extension MakeRequestViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == placePickerView{
          return address.count
        }else if pickerView == categoriePickerView{
            return categories.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
        if pickerView == placePickerView {
            return address[row].name
        }else if pickerView == categoriePickerView{
            return  categories[row].name!
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        
        if pickerView == placePickerView{
            placeName = address[row].name
           
        }else if pickerView == categoriePickerView{
            categorieName = categories[row].name
           
        }
        
    }
    
}

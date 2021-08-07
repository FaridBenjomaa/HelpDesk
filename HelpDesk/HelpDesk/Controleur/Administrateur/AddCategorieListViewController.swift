//
//  AddCategorieListViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import UIKit

class AddCategorieListViewController: UIViewController {

    //MARK: Properties
    var button = ButtonConfig()
    private var service: CategorieServices?
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
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var addCategorieButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        button.setUpWhiteButtons(button: addCategorieButton)
       
    }
    
    //MARK: Fonctions
    func loadData() {
           let service = CategorieServices()
            service.get(collectionID: "Categorie") { categories in
                self.allCategories = categories
            }
        }

}

extension AddCategorieListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "categorieListLineCell" ,for: indexPath ) as?
                CategorieListLineCell else {
            return UITableViewCell()
        }
        let name = categories[indexPath.row].name

        cell.configure(nom: name!)
        return cell
    }
}

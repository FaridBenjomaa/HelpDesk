//
//  AddAddressListViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import UIKit

class AddAddressListViewController: UIViewController {

    //MARK: Properties
    var button = ButtonConfig()
    private var service: AddressServices?
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
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var addPlaceButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        button.setUpWhiteButtons(button: addPlaceButton)
    }
    
    //MARK: Fonctions
    func loadData() {
           let service = AddressServices()
            service.get(collectionID: "Adresse") { address in
                self.allAddress = address
            }
        }

}

extension AddAddressListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "addressListLineCell" ,for: indexPath ) as?
                AddressListLineCell else {
            return UITableViewCell()
        }
        let name = address[indexPath.row].name

        cell.configure(nom: name!)
        return cell
    }
}

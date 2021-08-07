//
//  AddUserListViewController.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 02/08/2021.
//

import UIKit
import FirebaseFirestore

class AddUserListViewController: UIViewController {

    //MARK: Properties
    var button = ButtonConfig()
  
  
    private var service: UserService?
       private var allusers = [appUser]() {
           didSet {
               DispatchQueue.main.async {
                   self.users = self.allusers
               }
           }
       }
    
    var users = [appUser]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addUserButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setUpWhiteButtons(button: addUserButton)
        loadData()

    }
    
    //MARK: Fonctions
    func loadData() {
            service = UserService()
            service?.get(collectionID: "User") { users in
                self.allusers = users
            }
        }
 
}
 



extension AddUserListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "userListLineCell" ,for: indexPath ) as?
                UserListLineCell else {
            return UITableViewCell()
        }
    
        let firstName = users[indexPath.row].firstName
        let lastName = users[indexPath.row].lastName
        let role = users[indexPath.row].role

        cell.configure(prenom: firstName!, nom: lastName!, role: role!)
   
        return cell
    }
}



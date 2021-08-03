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
    let db = Firestore.firestore()
    var user : [ String : Any ] = [ : ]
    //MARK: Outlets
    
    @IBOutlet weak var addUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setUpWhiteButtons(button: addUserButton)
        
        let docRef = db.collection("Users").document("Admin.Admin")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                self.user = document.data()!
                print(self.user["firstName"]!)
                
                
            } else {
                print("Document does not exist")
            }
        }
        
    }
 
 
}


extension AddUsersViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "userListLineCell" ,for: indexPath ) as?
                UserListLineCell else {
            return UITableViewCell()
        }
        
   
        return cell
    }
}

extension AddUsersViewController: UITableViewDelegate {

}

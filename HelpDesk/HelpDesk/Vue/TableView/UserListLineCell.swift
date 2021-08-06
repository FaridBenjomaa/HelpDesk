//
//  UserListLineCell.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 02/08/2021.
//

import UIKit

class UserListLineCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: Private Functions
    func configure(prenom: String, nom: String, role: String){
    
        prenomLabel.text = prenom
        nomLabel.text = nom
        roleLabel.text = role
    }
    
}

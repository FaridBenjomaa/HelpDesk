//
//  CategorieListLineCell.swift
//  HelpDesk
//
//  Created by Farid Benjomaa on 07/08/2021.
//

import UIKit

class CategorieListLineCell: UITableViewCell {

    @IBOutlet weak var categorieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: Private Functions
    func configure( nom: String){
    
        categorieName.text = nom
      
    }
}

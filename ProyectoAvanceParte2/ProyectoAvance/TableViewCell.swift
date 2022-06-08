//
//  TableViewCell.swift
//  ProyectoAvance
//
//  Created by UNAM FCA 11 on 06/04/22.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCellEjercicio.swift
//  ProyectoAvance
//
//  Created by Laboratorio UNAM-Apple on 18/05/22.
//

import UIKit

class TableViewCellEjercicio: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lableDia: UILabel!
    @IBOutlet weak var lableSerie: UILabel!
    @IBOutlet weak var lableEnfoque: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCellPendientes.swift
//  ProyectoAvance
//
//  Created by UNAM FCA 11 on 28/04/22.
//

import UIKit

class TableViewCellPendientes: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var materia: UILabel!
    
    @IBOutlet weak var descripcion: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

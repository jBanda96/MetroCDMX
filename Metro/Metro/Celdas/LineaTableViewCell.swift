//
//  LineaTableViewCell.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class LineaTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var mySubtitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myShowButton: UIButton!
    @IBOutlet weak var myReportButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

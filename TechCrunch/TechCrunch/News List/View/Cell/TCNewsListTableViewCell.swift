//
//  TCNewsListTableViewCell.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import UIKit

class TCNewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static var identifier: String {
        return String(describing: self)
    }
    
}

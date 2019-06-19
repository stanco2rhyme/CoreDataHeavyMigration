//
//  InternationalUsersTableViewCell.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/18/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//

import UIKit

class InternationalUsersTableViewCell: UITableViewCell {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var age: UILabel!
  @IBOutlet weak var sex: UILabel!
  @IBOutlet weak var country: UILabel!
  @IBOutlet weak var userImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TC2021NOTableViewCell.swift
//  Swift Practice # 105 Taichung Two Result
//
//  Created by Dogpa's MBAir M1 on 2021/11/1.
//

import UIKit

class TC2021NOTableViewCell: UITableViewCell {

    
    @IBOutlet weak var villageLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    @IBOutlet weak var disAgreeLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

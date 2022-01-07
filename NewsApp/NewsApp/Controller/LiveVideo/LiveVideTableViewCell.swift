//
//  LiveVideTableViewCell.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 04/06/1443 AH.
//

import UIKit

class LiveVideTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleVideoLiveLable: UILabel!
    @IBOutlet weak var imageChanellLive: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func comminInit(image:UIImage){
        self.imageChanellLive.image = image

}
}

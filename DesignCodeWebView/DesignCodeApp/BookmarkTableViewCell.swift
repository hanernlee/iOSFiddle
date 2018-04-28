//
//  BookmarkTableViewCell.swift
//  DesignCodeApp
//
//  Created by Tiago Mergulhão on 23/01/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {

    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  FruitTableViewCell.swift
//  CheckList23-10-21
//
//  Created by 副山俊輔 on 2023/10/21.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkImageView.image = UIImage(systemName: "checkmark")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ fruit: Fruit) {
        listNameLabel.text = fruit.name
        checkImageView.isHidden = !fruit.shouldShow
    }
}

//
//  CheckListTableViewCell.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/12.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    private let customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark")
        image.tintColor = .orange
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }

    private func setupComponents() {
        contentView.addSubview(customLabel)
        contentView.addSubview(checkImage)

        NSLayoutConstraint.activate([
            customLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customLabel.leftAnchor.constraint(equalTo: checkImage.rightAnchor, constant: 10),
            customLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            checkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkImage.widthAnchor.constraint(equalToConstant: 30),
            checkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(_ fruit: Fruit) {
        customLabel.text = fruit.name
        checkImage.isHidden = !fruit.shouldShow
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

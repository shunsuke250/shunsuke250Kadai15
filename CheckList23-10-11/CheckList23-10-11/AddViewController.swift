//
//  AddViewController.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/14.
//

import UIKit

class AddViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "名前"
        return label
    }()

    private let addTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()

    private var saveBarButtonItem: UIBarButtonItem!
    private var cancelBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupComponents()
        saveBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(saveFruit)
        )
        cancelBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancel)
        )
        navigationItem.rightBarButtonItem = saveBarButtonItem
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }

    private func setupComponents() {
        view.addSubview(nameLabel)
        view.addSubview(addTextField)

        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(50)
            $0.top.equalToSuperview().offset(150)
        }
        addTextField.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.right).offset(20)
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.width.equalTo(200)
        }
    }

    @objc func saveFruit() {
    }

    @objc func cancel() {
    }
}

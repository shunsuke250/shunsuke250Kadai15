//
//  AddViewController.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/14.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func saveFruit(name: String)
}

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

    weak var delegate: AddViewControllerDelegate?

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

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])

        NSLayoutConstraint.activate([
            addTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 20),
            addTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            addTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func saveFruit() {
        guard let fruit = addTextField.text?.trimmingCharacters(in: .whitespaces), !fruit.isEmpty else { return }
        delegate?.saveFruit(name: fruit)
        dismiss(animated: true, completion: nil)
    }

    @objc private func cancel() {
        dismiss(animated: true, completion: nil)
    }
}

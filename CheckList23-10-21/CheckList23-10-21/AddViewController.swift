//
//  AddViewController.swift
//  CheckList23-10-21
//
//  Created by 副山俊輔 on 2023/10/21.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func saveFruit(name: String)
}

class AddViewController: UIViewController {

    weak var delegate: AddViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

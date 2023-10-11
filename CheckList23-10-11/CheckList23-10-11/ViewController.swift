//
//  ViewController.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .lightGray
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setConstrains()
    }

    private func setupComponents() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }

    private func setConstrains() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}


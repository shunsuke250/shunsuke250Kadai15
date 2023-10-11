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
    
    let cellIdentifier = "CustomCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setConstrains()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CheckListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    private func setupComponents() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }

    private func setConstrains() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        10
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        42
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath) as! CheckListTableViewCell
        cell.customLabel.text = "test\(indexPath.row)"

        return cell
    }
}

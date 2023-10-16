//
//  ViewController.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let fruits: [(String, Bool)] = [
        ("りんご", false),
        ("みかん", true),
        ("バナナ", false),
        ("パイナップル", true)
    ]

    private let cellIdentifier = "CustomCell"

    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()

    private var addBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CheckListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addFruit)
        )
        navigationItem.rightBarButtonItem = addBarButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    private func setupComponents() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // プラスボタンがタップされたとき
    @objc func addFruit() {
        let addViewController = AddViewController()
        let navigationController = UINavigationController(rootViewController: addViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        fruits.count
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
        let (fruitName, shouldShowImage) = fruits[indexPath.row]
        cell.customLabel.text = fruitName
        cell.checkImage.isHidden = !shouldShowImage

        return cell
    }
}

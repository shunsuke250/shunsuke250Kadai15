//
//  ViewController.swift
//  CheckList23-10-11
//
//  Created by 副山俊輔 on 2023/10/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var fruits = [
        Fruit(name: "りんご", shouldShow: false),
        Fruit(name: "みかん", shouldShow: true),
        Fruit(name: "バナナ", shouldShow: false),
        Fruit(name: "パイナップル", shouldShow: true)
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
        print(fruits)
    }

    private func setupComponents() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // プラスボタンがタップされたとき
    @objc private func addFruit() {
        let addViewController = AddViewController()
        let navigationController = UINavigationController(rootViewController: addViewController)
        addViewController.delegate = self
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CheckListTableViewCell else {
            return CheckListTableViewCell()
        }
        cell.configure(fruits[indexPath.row])

        return cell
    }
}

extension ViewController: AddViewControllerDelegate {
    func saveFruit(name: String) {
        fruits.append(Fruit(name: name, shouldShow: false))
        tableView.reloadData()
    }
}

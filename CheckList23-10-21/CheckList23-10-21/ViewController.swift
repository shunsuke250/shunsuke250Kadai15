//
//  ViewController.swift
//  CheckList23-10-21
//
//  Created by 副山俊輔 on 2023/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var fruits = [
        Fruit(name: "りんご", shouldShow: false),
        Fruit(name: "みかん", shouldShow: true),
        Fruit(name: "バナナ", shouldShow: false),
        Fruit(name: "パイナップル", shouldShow: true)
    ]

    private let cellIdentifier = "CustomCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FruitTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    @IBAction func addFruit(_ sender: Any) {
        let addViewController = AddViewController()
        let navigationController = UINavigationController(rootViewController: addViewController)
        addViewController.delegate = self
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
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
        ) as? FruitTableViewCell else {
            return FruitTableViewCell()
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

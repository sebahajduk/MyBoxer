//
//  ShopVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit

class ShopVC: UIViewController {
    
    let itemCategories: [String] = ["Gloves", "Boots", "Shorts", "Wraps"]
    let menu = MBShopMenu(frame: .zero)
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    private func configure() {
        view.addSubviews([menu, tableView])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(ShopItemCell.self, forCellReuseIdentifier: ShopItemCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: menu.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemCell.reuseID) as! ShopItemCell

        cell.set()
        return cell
    }


}

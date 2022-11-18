//
//  ShopVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit

protocol UpdateCategoryDelegate: AnyObject {
    func updateCategory(to category: ItemType)
}

class ShopVC: UIViewController, UpdateCategoryDelegate {
    
    var player: Player!
    
    let itemCategories: [String] = ["Gloves", "Boots", "Shorts", "Wraps"]
    let menu = MBShopMenu(frame: .zero)
    let tableView = UITableView()
    
    var type: ItemType = .gloves
    
    let gloves: [Item] = [
        Item(name: "Boxing glove", stats: 3, cost: 15, type: .gloves),
        Item(name: "Boxing glove", stats: 5, cost: 25, type: .gloves),
        Item(name: "Boxing glove", stats: 7, cost: 40, type: .gloves),
        Item(name: "Boxing glove", stats: 11, cost: 60, type: .gloves),
        Item(name: "Boxing glove", stats: 13, cost: 90, type: .gloves),
    ]
    
    let boots: [Item] = [
        Item(name: "Boxing boots", stats: 3, cost: 15, type: .boots),
        Item(name: "Boxing boots", stats: 5, cost: 25, type: .boots),
        Item(name: "Boxing boots", stats: 7, cost: 40, type: .boots),
        Item(name: "Boxing boots", stats: 11, cost: 60, type: .boots),
        Item(name: "Boxing boots", stats: 13, cost: 90, type: .boots),
    ]
    
    let shorts: [Item] = [
        Item(name: "Boxing shorts", stats: 3, cost: 15, type: .shorts),
        Item(name: "Boxing shorts", stats: 5, cost: 25, type: .shorts),
        Item(name: "Boxing shorts", stats: 7, cost: 40, type: .shorts),
        Item(name: "Boxing shorts", stats: 11, cost: 60, type: .shorts),
        Item(name: "Boxing shorts", stats: 13, cost: 90, type: .shorts),
    ]
    
    let tapes: [Item] = [
        Item(name: "Boxing tapes", stats: 3, cost: 15, type: .tapes),
        Item(name: "Boxing tapes", stats: 5, cost: 25, type: .tapes),
        Item(name: "Boxing tapes", stats: 7, cost: 40, type: .tapes),
        Item(name: "Boxing tapes", stats: 11, cost: 60, type: .tapes),
        Item(name: "Boxing tapes", stats: 13, cost: 90, type: .tapes),
    ]
    
    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    func updateCategory(to type: ItemType) {
        self.type = type
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { () -> Void in
            self.tableView.reloadData()
        })
    }
    
    private func configure() {
        view.addSubviews([menu, tableView])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.updateCategoryDelegate = self
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(ShopItemCell.self, forCellReuseIdentifier: ShopItemCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 30),
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

        switch type {
        case .gloves:
            cell.set(item: gloves[indexPath.row])
        case .boots:
            cell.set(item: boots[indexPath.row])
        case .shorts:
            cell.set(item: shorts[indexPath.row])
        case .tapes:
            cell.set(item: tapes[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item: Item
        
        switch type {
        case .gloves:
            item = gloves[indexPath.row]
        case .boots:
            item = boots[indexPath.row]
        case .shorts:
            item = shorts[indexPath.row]
        case .tapes:
            item = tapes[indexPath.row]
        }
        
        if player.money < item.cost {
            let alert = AlertVC(title: "You do not have enough money", message: AlertType.notEnoughMoney)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
            return
        }
        
        player.buyItem(item)
    }
}

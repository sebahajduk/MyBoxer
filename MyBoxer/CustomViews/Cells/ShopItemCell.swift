//
//  ShopItemCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 10/10/2022.
//

import UIKit

enum EquipmentCategory {
    case gloves, boots, shorts, tapes
}

class ShopItemCell: UITableViewCell {
    
    static let reuseID = "ShopItemCell"
    
    let itemName = MBLabel(size: 16)
    let itemStats = MBLabel(size: 16, color: .systemGray2)
    let itemImage = MBImageView(frame: .zero)
    let itemPrice = MBLabel(size: 16, color: .systemYellow)
    let coin = UIImageView(image: Images.coin)
    
    let gloves: [Item] = [
        Item(name: "Boxing glove", stats: 3, cost: 15),
        Item(name: "Boxing glove", stats: 5, cost: 25),
        Item(name: "Boxing glove", stats: 7, cost: 40),
        Item(name: "Boxing glove", stats: 11, cost: 60),
        Item(name: "Boxing glove", stats: 13, cost: 90),
    ]
    
    let boots: [Item] = [
        Item(name: "Boxing boots", stats: 3, cost: 15),
        Item(name: "Boxing boots", stats: 5, cost: 25),
        Item(name: "Boxing boots", stats: 7, cost: 40),
        Item(name: "Boxing boots", stats: 11, cost: 60),
        Item(name: "Boxing boots", stats: 13, cost: 90),
    ]
    
    let shorts: [Item] = [
        Item(name: "Boxing shorts", stats: 3, cost: 15),
        Item(name: "Boxing shorts", stats: 5, cost: 25),
        Item(name: "Boxing shorts", stats: 7, cost: 40),
        Item(name: "Boxing shorts", stats: 11, cost: 60),
        Item(name: "Boxing shorts", stats: 13, cost: 90),
    ]
    
    let tapes: [Item] = [
        Item(name: "Boxing tapes", stats: 3, cost: 15),
        Item(name: "Boxing tapes", stats: 5, cost: 25),
        Item(name: "Boxing tapes", stats: 7, cost: 40),
        Item(name: "Boxing tapes", stats: 11, cost: 60),
        Item(name: "Boxing tapes", stats: 13, cost: 90),
    ]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for category: EquipmentCategory, at row: Int) {
        switch category {
        case .gloves:
            itemName.text = gloves[row].name
            itemStats.text = "Punch power +\(gloves[row].stats)"
            itemPrice.text = "\(gloves[row].cost)"
            itemImage.image = Images.boxingGlove
        case .boots:
            itemName.text = boots[row].name
            itemStats.text = "Movement +\(boots[row].stats)"
            itemPrice.text = "\(boots[row].cost)"
            itemImage.image = Images.boxingBoots
        case .shorts:
            itemName.text = shorts[row].name
            itemStats.text = "Endurance +\(shorts[row].stats)"
            itemPrice.text = "\(shorts[row].cost)"
            itemImage.image = Images.boxingShorts
        case .tapes:
            itemName.text = tapes[row].name
            itemStats.text = "Punch speed +\(tapes[row].stats)"
            itemPrice.text = "\(tapes[row].cost)"
            itemImage.image = Images.boxingTapes
        }
    }
    
    private func configure() {
        addSubviews([itemName, itemStats, itemImage, itemPrice, coin])
        
        coin.translatesAutoresizingMaskIntoConstraints = false
        
        coin.tintColor = .systemYellow
        
        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            itemImage.widthAnchor.constraint(equalToConstant: 80),
            itemImage.heightAnchor.constraint(equalToConstant: 80),
            
            itemName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            
            itemStats.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            itemStats.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemStats.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            itemStats.heightAnchor.constraint(equalToConstant: 30),
            
            coin.topAnchor.constraint(equalTo: itemPrice.topAnchor, constant: -1),
            coin.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            coin.heightAnchor.constraint(equalToConstant: 15),
            coin.widthAnchor.constraint(equalToConstant: 15),
            
            itemPrice.heightAnchor.constraint(equalToConstant: 16),
            itemPrice.leadingAnchor.constraint(equalTo: coin.trailingAnchor, constant: 2),
            itemPrice.widthAnchor.constraint(equalToConstant: 150),
            itemPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

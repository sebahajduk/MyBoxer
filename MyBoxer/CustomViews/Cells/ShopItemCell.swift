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
    let coin = UIImageView(image: UIImage(systemName: "dollarsign.circle.fill"))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for category: EquipmentCategory) {
        
        switch category {
        case .gloves:
            itemName.text = "Boxing glove"
            itemStats.text = "Punch power +5"
            itemPrice.text = "150"
            itemImage.image = Images.boxingGlove
        case .boots:
            itemName.text = "Boxing boots"
            itemStats.text = "Movement +5"
            itemPrice.text = "50"
            itemImage.image = Images.boxingBoots
        case .shorts:
            itemName.text = "Boxing shorts"
            itemStats.text = "Endurance +5"
            itemPrice.text = "350"
            itemImage.image = Images.boxingShorts
        case .tapes:
            itemName.text = "Boxing tapes"
            itemStats.text = "Power +5"
            itemPrice.text = "1000"
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

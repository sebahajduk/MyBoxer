//
//  MBShopMenu.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 13/10/2022.
//

import UIKit

class MBShopMenu: UIView {
    
    let buttonGloves = MBShopMenuButton(string: "")
    let buttonBoots = MBShopMenuButton(string: "")
    let buttonShorts = MBShopMenuButton(string: "")
    let buttonTapes = MBShopMenuButton(string: "")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews([buttonGloves, buttonBoots, buttonShorts, buttonTapes])

        buttonGloves.backgroundColor = .systemMint
        buttonBoots.backgroundColor = .systemMint
        buttonShorts.backgroundColor = .systemMint
        buttonTapes.backgroundColor = .systemMint

        NSLayoutConstraint.activate([
            buttonGloves.topAnchor.constraint(equalTo: topAnchor),
            buttonGloves.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            buttonBoots.topAnchor.constraint(equalTo: topAnchor),
            buttonBoots.leadingAnchor.constraint(equalTo: buttonGloves.trailingAnchor, constant: 11),

            buttonShorts.topAnchor.constraint(equalTo: topAnchor),
            buttonShorts.leadingAnchor.constraint(equalTo: buttonBoots.trailingAnchor, constant: 11),

            buttonTapes.topAnchor.constraint(equalTo: topAnchor),
            buttonTapes.leadingAnchor.constraint(equalTo: buttonShorts.trailingAnchor, constant: 11),
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

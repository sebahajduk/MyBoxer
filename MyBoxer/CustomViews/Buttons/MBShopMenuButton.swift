//
//  MBShopMenuButton.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 13/10/2022.
//

import UIKit

class MBShopMenuButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(string: String) {
        self.init()
        configure()
    }
    
    private func configure() {
//        setBackgroundImage(image, for: .normal)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 30),
            widthAnchor.constraint(equalToConstant: 80)
        ])
    }

}

//
//  OpponentStatView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 01/10/2022.
//

import UIKit

enum Stats {
    case vitality, power, speed, footwork, movement, defence, endurance
}

class OpponentStatView: UIView {
    
    let stat = MBLabel(size: 16, color: .systemGray2)
    let statValue = MBLabel(size: 16, color: .systemGray2, alignment: .right)

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(statType: Stats, value: Int) {
        self.init(frame: .zero)
        
        configure(statType: statType, value: value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(statType: Stats, value: Int) {
        addSubviews([stat, statValue])
        
        switch statType {
        case .vitality:
            stat.text = "vitality"
        case .power:
            stat.text = "power"
        case .speed:
            stat.text = "speed"
        case .footwork:
            stat.text = "footwork"
        case .movement:
            stat.text = "movement"
        case .defence:
            stat.text = "defence"
        case .endurance:
            stat.text = "endurance"
        }
        
        statValue.text = "\(value)"
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat.topAnchor.constraint(equalTo: self.topAnchor),
            stat.leadingAnchor.constraint(equalTo: leadingAnchor),
            stat.widthAnchor.constraint(equalToConstant: 100),
            stat.heightAnchor.constraint(equalToConstant: 16),
            
            statValue.centerYAnchor.constraint(equalTo: stat.centerYAnchor),
            statValue.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statValue.widthAnchor.constraint(equalToConstant: 50),
            statValue.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
}

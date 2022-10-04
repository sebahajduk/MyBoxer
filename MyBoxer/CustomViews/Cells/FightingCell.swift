//
//  FightingCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

class FightingCell: UITableViewCell {
    
    /*
                HP
            1       2
            3       4
            5       6
     */
    
    static let reuseID = "FightingCell"
    
    let vitLabel = MBLabel(size: 16, color: .systemGray2)
    
    let opponentImage = MBImageView(frame: .zero)
    let opponentName = MBLabel(size: 16)
    var opponentVitality: OpponentStatView!
    var opponentPunchPower: OpponentStatView!
    var opponentPunchSpeed: OpponentStatView!
    var opponentFootwork: OpponentStatView!
    var opponentMovement: OpponentStatView!
    var opponentDefence: OpponentStatView!
    var opponentEndurance: OpponentStatView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        set()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set() {
        opponentImage.image = UIImage(named: "baby-face")
        opponentName.text = "Henryk Sienkiewcz"
        opponentVitality = OpponentStatView(statType: .vitality, value: 100)
        opponentPunchPower = OpponentStatView(statType: .power, value: 100)
        opponentPunchSpeed = OpponentStatView(statType: .speed, value: 100)
        opponentFootwork = OpponentStatView(statType: .footwork, value: 100)
        opponentMovement = OpponentStatView(statType: .movement, value: 100)
        opponentDefence = OpponentStatView(statType: .defence, value: 100)
        opponentEndurance = OpponentStatView(statType: .endurance, value: 100)
    }
    
    private func configure() {
        addSubviews([opponentImage, opponentName, opponentVitality, opponentPunchPower, opponentPunchSpeed, opponentFootwork, opponentMovement, opponentDefence, opponentEndurance])
        
        opponentVitality.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            opponentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            opponentImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            opponentImage.heightAnchor.constraint(equalToConstant: 140),
            opponentImage.widthAnchor.constraint(equalToConstant: 140),
            
            opponentName.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            opponentName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            opponentName.heightAnchor.constraint(equalToConstant: 18),
            
            opponentVitality.topAnchor.constraint(equalTo: opponentName.bottomAnchor, constant: 18),
            opponentVitality.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentVitality.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentVitality.heightAnchor.constraint(equalToConstant: 16),
            
            opponentPunchPower.topAnchor.constraint(equalTo: opponentVitality.bottomAnchor, constant: 4),
            opponentPunchPower.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentPunchPower.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentPunchPower.heightAnchor.constraint(equalToConstant: 16),
            
            opponentPunchSpeed.topAnchor.constraint(equalTo: opponentPunchPower.bottomAnchor, constant: 4),
            opponentPunchSpeed.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentPunchSpeed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentPunchSpeed.heightAnchor.constraint(equalToConstant: 16),
            
            opponentFootwork.topAnchor.constraint(equalTo: opponentPunchSpeed.bottomAnchor, constant: 4),
            opponentFootwork.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentFootwork.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentFootwork.heightAnchor.constraint(equalToConstant: 16),
            
            opponentMovement.topAnchor.constraint(equalTo: opponentFootwork.bottomAnchor, constant: 4),
            opponentMovement.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentMovement.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentMovement.heightAnchor.constraint(equalToConstant: 16),
            
            opponentDefence.topAnchor.constraint(equalTo: opponentMovement.bottomAnchor, constant: 4),
            opponentDefence.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentDefence.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentDefence.heightAnchor.constraint(equalToConstant: 16),
            
            opponentEndurance.topAnchor.constraint(equalTo: opponentDefence.bottomAnchor, constant: 4),
            opponentEndurance.leadingAnchor.constraint(equalTo: opponentImage.trailingAnchor, constant: 20),
            opponentEndurance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            opponentEndurance.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func configureStats() {
        // Space between stats = 4
    }
    
}

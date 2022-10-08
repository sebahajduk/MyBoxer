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
    let opponentVitality: OpponentStatView = OpponentStatView(statType: .vitality)
    var opponentPunchPower: OpponentStatView = OpponentStatView(statType: .power)
    var opponentPunchSpeed: OpponentStatView = OpponentStatView(statType: .speed)
    var opponentFootwork: OpponentStatView = OpponentStatView(statType: .footwork)
    var opponentMovement: OpponentStatView = OpponentStatView(statType: .movement)
    var opponentDefence: OpponentStatView = OpponentStatView(statType: .defence)
    var opponentEndurance: OpponentStatView = OpponentStatView(statType: .endurance)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for opponent: Opponent) {
        opponentImage.image = UIImage(named: "baby-face")
        opponentName.text = "Henryk Sienkiewicz"
        opponentVitality.set(value: Int(opponent.vitality))
        opponentPunchPower.set(value: opponent.punchPower)
        opponentPunchSpeed.set(value: opponent.punchSpeed)
        opponentFootwork.set(value: opponent.footwork)
        opponentMovement.set(value: opponent.movement)
        opponentDefence.set(value: opponent.defence)
        opponentEndurance.set(value: opponent.endurance)
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

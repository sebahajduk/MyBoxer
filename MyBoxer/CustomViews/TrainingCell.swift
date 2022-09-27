//
//  TrainingCell.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 27/09/2022.
//

import UIKit

class TrainingCell: UITableViewCell {
    
    static let reuseID = "trainingCell"
    
    let trainingImage = MBImageView(frame: .zero)
    let trainingName = UILabel()
    let trainingEffect = UILabel()
    let trainingStamina = UILabel()
    
    let bolt = UIImageView(image: UIImage(systemName: "bolt.fill"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(for training: Training) {
        trainingImage.image = training.image
        trainingName.text = training.name
        trainingEffect.text = training.effect
        trainingStamina.text = "\(training.staminaNeeded)"
    }
    
    private func configure() {
        trainingName.translatesAutoresizingMaskIntoConstraints = false
        trainingEffect.translatesAutoresizingMaskIntoConstraints = false
        trainingStamina.translatesAutoresizingMaskIntoConstraints = false
        bolt.translatesAutoresizingMaskIntoConstraints = false
        
        trainingName.font = UIFont(name: "Plaguard", size: 20)
        
        trainingEffect.font = UIFont(name: "Plaguard", size: 16)
        trainingEffect.textColor = UIColor.systemGray2
        
        trainingStamina.font = UIFont(name: "Plaguard", size: 16)
        trainingStamina.textColor = UIColor.systemMint
        
        bolt.tintColor = .systemMint
        
        addSubviews([trainingImage, trainingName, trainingEffect, trainingStamina, bolt])
        NSLayoutConstraint.activate([
            trainingImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            trainingImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trainingImage.widthAnchor.constraint(equalToConstant: 80),
            trainingImage.heightAnchor.constraint(equalToConstant: 80),
            
            trainingName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trainingName.leadingAnchor.constraint(equalTo: trainingImage.trailingAnchor, constant: 20),
            trainingName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            trainingName.heightAnchor.constraint(equalToConstant: 20),
            
            trainingEffect.topAnchor.constraint(equalTo: trainingName.bottomAnchor, constant: 10),
            trainingEffect.leadingAnchor.constraint(equalTo: trainingImage.trailingAnchor, constant: 20),
            trainingEffect.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            trainingEffect.heightAnchor.constraint(equalToConstant: 30),
            
            trainingStamina.heightAnchor.constraint(equalToConstant: 16),
            trainingStamina.leadingAnchor.constraint(equalTo: trainingImage.trailingAnchor, constant: 20),
            trainingStamina.widthAnchor.constraint(equalToConstant: 10),
            trainingStamina.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            bolt.topAnchor.constraint(equalTo: trainingStamina.topAnchor, constant: -1),
            bolt.leadingAnchor.constraint(equalTo: trainingStamina.trailingAnchor),
            bolt.heightAnchor.constraint(equalToConstant: 15),
            bolt.widthAnchor.constraint(equalToConstant: 15)
        ])
    }

}

//
//  PlayerDetailsVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 20/10/2022.
//

import UIKit

class PlayerDetailsVC: UIViewController {

    let containerView = ContainerView()
    
    let playerImage = UIImageView(image: Images.player)
    let playerName = MBLabel(size: 20)
    let playerRecord = MBLabel(size: 16, color: .systemGray2)
    
    let level: StatView = StatView(statType: .level)
    let vitality: StatView = StatView(statType: .vitality)
    let punchPower: StatView = StatView(statType: .power)
    let punchSpeed: StatView = StatView(statType: .speed)
    let footwork: StatView = StatView(statType: .footwork)
    let movement: StatView = StatView(statType: .movement)
    let defence: StatView = StatView(statType: .defence)
    let endurance: StatView = StatView(statType: .endurance)
    
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configure()
        configureConstraints()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    private func configure() {
        view.addSubviews([containerView, playerImage, playerName, playerRecord, level, vitality, punchPower, punchSpeed, footwork, movement, defence, endurance, dismissButton])
        
        playerName.text = "Jonny Baldwin"
        playerName.textAlignment = .center
        
        playerRecord.text = "10/1/3"
        playerRecord.textAlignment = .center
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.setTitle("Close", for: .normal)
        dismissButton.backgroundColor = .systemGray2
        dismissButton.layer.cornerRadius = 10
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 500),
            containerView.widthAnchor.constraint(equalToConstant: 293),
            
            playerImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            playerImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerImage.heightAnchor.constraint(equalToConstant: 100),
            playerImage.widthAnchor.constraint(equalToConstant: 100),
            
            playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10),
            playerName.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 22),
            playerName.widthAnchor.constraint(equalToConstant: 253),
            
            playerRecord.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 2),
            playerRecord.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            playerRecord.heightAnchor.constraint(equalToConstant: 18),
            playerRecord.widthAnchor.constraint(equalToConstant: 253),
            
            level.topAnchor.constraint(equalTo: playerRecord.bottomAnchor, constant: 30),
            level.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            level.heightAnchor.constraint(equalToConstant: 20),
            level.widthAnchor.constraint(equalToConstant: 253),
            
            vitality.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 2),
            vitality.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vitality.heightAnchor.constraint(equalToConstant: 20),
            vitality.widthAnchor.constraint(equalToConstant: 253),
            
            punchPower.topAnchor.constraint(equalTo: vitality.bottomAnchor, constant: 2),
            punchPower.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            punchPower.heightAnchor.constraint(equalToConstant: 20),
            punchPower.widthAnchor.constraint(equalToConstant: 253),
            
            punchSpeed.topAnchor.constraint(equalTo: punchPower.bottomAnchor, constant: 2),
            punchSpeed.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            punchSpeed.heightAnchor.constraint(equalToConstant: 20),
            punchSpeed.widthAnchor.constraint(equalToConstant: 253),
            
            footwork.topAnchor.constraint(equalTo: punchSpeed.bottomAnchor, constant: 2),
            footwork.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            footwork.heightAnchor.constraint(equalToConstant: 20),
            footwork.widthAnchor.constraint(equalToConstant: 253),
            
            movement.topAnchor.constraint(equalTo: footwork.bottomAnchor, constant: 2),
            movement.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            movement.heightAnchor.constraint(equalToConstant: 20),
            movement.widthAnchor.constraint(equalToConstant: 253),
            
            defence.topAnchor.constraint(equalTo: movement.bottomAnchor, constant: 2),
            defence.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            defence.heightAnchor.constraint(equalToConstant: 20),
            defence.widthAnchor.constraint(equalToConstant: 253),
            
            endurance.topAnchor.constraint(equalTo: defence.bottomAnchor, constant: 2),
            endurance.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            endurance.heightAnchor.constraint(equalToConstant: 20),
            endurance.widthAnchor.constraint(equalToConstant: 253),
            
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            dismissButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalToConstant: 88)
        ])
    }

}

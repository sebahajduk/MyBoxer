//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 04/11/2022.
//

import UIKit

class FightingVC: UIViewController {

    var player: Player!
    var opponent: Opponent!
    
    var playerImage = MBImageView(frame: .zero)
    var opponentImage = MBImageView(frame: .zero)
    
    var vsLabel = MBLabel(size: 15)
    
    let roundLabel = MBLabel(size: 15)
    var roundNumberLabel = MBLabel(size: 20)
    var time = MBLabel(size: 30)
    
    var playerName = MBLabel(size: 15)
    var opponentName = MBLabel(size: 15)
    
    var playerHealthBar = MBProgressView(for: .hp, showTitle: false)
    var playerStaminaBar = MBProgressView(for: .stamina, showTitle: false)
    
    var opponentHealthBar = MBProgressView(for: .hp, showTitle: false)
    var opponentStaminaBar = MBProgressView(for: .stamina, showTitle: false)
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        configureConstraints()
    }
    
    func set(player: Player!, opponent: Opponent!) {
        self.player = player
        self.opponent = opponent
    }
    
    private func configure() {
        view.addSubviews([playerImage, opponentImage, vsLabel, playerName, opponentName, playerHealthBar, playerStaminaBar, opponentHealthBar, opponentStaminaBar, tableView, roundLabel, roundNumberLabel, time])
        
        playerImage.image = Images.player
        opponentImage.image = Images.opponent
        
        vsLabel.text = "VS"
        
        playerName.text = "My Boxer"
        playerName.textAlignment = .center
        
        opponentName.text = "Devin Colbert"
        opponentName.textAlignment = .center
        
        roundLabel.text = "Round"
        roundLabel.textAlignment = .center
        
        roundNumberLabel.text = "3"
        roundNumberLabel.textAlignment = .center
        
        time.text = "20"
        time.textAlignment = .center
        
        playerHealthBar.setProgress(1, animated: true)
        playerStaminaBar.setProgress(1, animated: true)
        
        opponentHealthBar.setProgress(1, animated: true)
        opponentStaminaBar.setProgress(1, animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 30
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            playerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playerImage.heightAnchor.constraint(equalToConstant: 120),
            playerImage.widthAnchor.constraint(equalToConstant: 120),
            
            opponentImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            opponentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            opponentImage.heightAnchor.constraint(equalToConstant: 120),
            opponentImage.widthAnchor.constraint(equalToConstant: 120),
            
            roundLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundLabel.widthAnchor.constraint(equalToConstant: 50),
            roundLabel.heightAnchor.constraint(equalToConstant: 16),
            
            roundNumberLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 5),
            roundNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundNumberLabel.widthAnchor.constraint(equalToConstant: 20),
            roundNumberLabel.heightAnchor.constraint(equalToConstant: 21),
            
            vsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vsLabel.bottomAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: -10),
            vsLabel.heightAnchor.constraint(equalToConstant: 20),
            vsLabel.widthAnchor.constraint(equalToConstant: 20),
            
            time.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            time.centerYAnchor.constraint(equalTo: playerHealthBar.bottomAnchor),
            time.heightAnchor.constraint(equalToConstant: 31),
            time.widthAnchor.constraint(equalToConstant: 30),
            
            playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10),
            playerName.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerName.heightAnchor.constraint(equalToConstant: 16),
            playerName.widthAnchor.constraint(equalToConstant: 120),
            
            opponentName.topAnchor.constraint(equalTo: opponentImage.bottomAnchor, constant: 10),
            opponentName.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentName.heightAnchor.constraint(equalToConstant: 16),
            opponentName.widthAnchor.constraint(equalToConstant: 120),
            
            playerHealthBar.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 5),
            playerHealthBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerHealthBar.heightAnchor.constraint(equalToConstant: 10),
            playerHealthBar.widthAnchor.constraint(equalToConstant: 120),
            
            playerStaminaBar.topAnchor.constraint(equalTo: playerHealthBar.bottomAnchor, constant: 5),
            playerStaminaBar.centerXAnchor.constraint(equalTo: playerImage.centerXAnchor),
            playerStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            playerStaminaBar.widthAnchor.constraint(equalToConstant: 120),
            
            opponentHealthBar.topAnchor.constraint(equalTo: opponentName.bottomAnchor, constant: 5),
            opponentHealthBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentHealthBar.heightAnchor.constraint(equalToConstant: 10),
            opponentHealthBar.widthAnchor.constraint(equalToConstant: 120),
            
            opponentStaminaBar.topAnchor.constraint(equalTo: opponentHealthBar.bottomAnchor, constant: 5),
            opponentStaminaBar.centerXAnchor.constraint(equalTo: opponentImage.centerXAnchor),
            opponentStaminaBar.heightAnchor.constraint(equalToConstant: 10),
            opponentStaminaBar.widthAnchor.constraint(equalToConstant: 120),
            
            tableView.topAnchor.constraint(equalTo: playerStaminaBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FightingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

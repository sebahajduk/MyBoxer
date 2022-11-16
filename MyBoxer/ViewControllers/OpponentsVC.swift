//
//  FightingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 29/09/2022.
//

import UIKit

class OpponentsVC: UIViewController {
    
    let tableView = UITableView()
    
    var player: Player!
    
    let opponents: [Opponent] = [
        Opponent(forLevel: 1, name: "Devin Colbert"),
        Opponent(forLevel: 2, name: "Colt Street"),
        Opponent(forLevel: 4, name: "Deryck Michaels"),
        Opponent(forLevel: 8, name: "Brody Miller"),
        Opponent(forLevel: 16, name: "Theo Barker"),
        Opponent(forLevel: 24, name: "Hughie Mcbride"),
        Opponent(forLevel: 32, name: "Alvin Blair"),
        Opponent(forLevel: 40, name: "Randolph Barton"),
        Opponent(forLevel: 48, name: "Gaylord Saunders"),
        Opponent(forLevel: 56, name: "Atwater Fitzgerald"),
        Opponent(forLevel: 64, name: "Marsh Bell"),
        Opponent(forLevel: 72, name: "Justin Andrews"),
        Opponent(forLevel: 80, name: "Jordan Jenning"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    convenience init(player: Player) {
        self.init()
        
        self.player = player
    }
    
    private func configure() {
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FightingCell.self, forCellReuseIdentifier: FightingCell.reuseID)
        tableView.rowHeight = 192
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension OpponentsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opponents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FightingCell.reuseID) as! FightingCell
        
        cell.set(for: opponents[indexPath.row], index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let fightingVC = FightingVC()
        
        if player.hp > 50 {
            fightingVC.set(player: player, opponent: opponents[indexPath.row])
            navigationController?.pushViewController(fightingVC, animated: true)
        } else {
            let alert = AlertVC(title: "You're exhausted", message: AlertType.youExhausted)
            
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            navigationController?.present(alert, animated: true)
        }
    }
}

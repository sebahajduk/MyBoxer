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
        Opponent(forLevel: 1),
        Opponent(forLevel: 5),
        Opponent(forLevel: 10),
        Opponent(forLevel: 20),
        Opponent(forLevel: 50)
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
        
        let fightingVC = FightingVC()
        
        fightingVC.set(player: player, opponent: opponents[indexPath.row])
        
        navigationController?.pushViewController(fightingVC, animated: true)
        
    }
}

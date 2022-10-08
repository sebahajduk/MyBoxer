//
//  TrainingVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 24/09/2022.
//

import UIKit

class TrainingVC: UIViewController {
    
    let tableView = UITableView()
    
    var boxer: Player!
    
    let trainings: [Training] = [
        Training(name: "Shadow boxing", staminaNeeded: 5, effect: "+1 Movement / +1 Defence", image: Images.shadowBox!),
        Training(name: "Weight lifting", staminaNeeded: 5, effect: "+2 Punch power", image: Images.weightLift!),
        Training(name: "Jumping rope", staminaNeeded: 5, effect: "+2 Footwork", image: Images.jumpingRope!),
        Training(name: "Ball throw", staminaNeeded: 5, effect: "+2 Punch speed", image: Images.ballThrow!),
        Training(name: "Intervals", staminaNeeded: 5, effect: "+2 Endurance", image: Images.interval!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(myBoxer: Player) {
        self.init()
        configureData(myBoxer: myBoxer)
        configureTableView()
    }
    
    private func configureData(myBoxer: Player) {
        boxer = myBoxer
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TrainingCell.self, forCellReuseIdentifier: TrainingCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TrainingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainingCell.reuseID) as! TrainingCell
        cell.set(for: trainings[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        boxer.shadowBox()
        
        if TimeManager.shared.inProgres {
            print("Cannot do training. You are already train")
        } else {
            TimeManager.shared.train(for: 200)
        }
        print(boxer.movement)
    }
}

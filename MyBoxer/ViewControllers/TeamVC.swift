//
//  TeamVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 16/10/2022.
//

import UIKit

protocol UpdateTeamHireAgency: AnyObject {
    func updateTeamHireAgency(to specialization: MemberType)
}

class TeamVC: UIViewController, UpdateTeamHireAgency {
    
    let menu = MBTeamMenu(frame: .zero)
    let tableView = UITableView()
    
    var category: MemberType = .manager

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configure()
    }
    
    private func configure() {
        view.addSubviews([menu, tableView])
        menu.updateTeamHireAgencyDelegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(TeamMemberCell.self, forCellReuseIdentifier: TeamMemberCell.reuseID)
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateTeamHireAgency(to specialization: MemberType) {
        self.category = specialization
        
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { () -> Void in
            self.tableView.reloadData()
        })
        
    }

}

extension TeamVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamMemberCell.reuseID) as! TeamMemberCell
        
        cell.set(to: category)
        
        return cell
    }
    
    
}

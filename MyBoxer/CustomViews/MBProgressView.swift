//
//  MBProgressView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

enum MBProgressType {
    case hp
    case stamina
    case experience
    case time
}

class MBProgressView: UIProgressView {
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(for type: MBProgressType) {
        self.init()
        configure(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(type: MBProgressType) {
        progressViewStyle = .default
        trackTintColor = .secondarySystemBackground
        addSubview(title)
        title.font = UIFont(name: "Plaguard", size: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .hp:
            progressTintColor = .systemRed
            title.text = "Health"
        case .stamina:
            progressTintColor = .systemMint
            title.text = "Stamina"
        case .experience:
            progressTintColor = .systemCyan
            title.text = "Experience"
        case .time:
            progressTintColor = .systemGray2
            title.text = "2:30"
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
}

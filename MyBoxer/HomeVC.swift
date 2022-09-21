//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

class HomeVC: UIViewController {

    let testImage = MBImageView(frame: .zero)
    
    let staminaProgress = MBProgressView(for: .stamina)
    let healthProgress = MBProgressView(for: .hp)
    let experienceProgress = MBProgressView(for: .experience)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    private func configure() {
        configureButtonsMenu()
    }
    
    
    private func configureButtonsMenu() {
        testImage.image = Images.bag
        
        healthProgress.setProgress(0.5, animated: true)
        staminaProgress.setProgress(0.8, animated: true)
        experienceProgress.setProgress(0.5, animated: true)
        
        view.addSubview(healthProgress)
        view.addSubview(staminaProgress)
        view.addSubview(experienceProgress)
        view.addSubview(testImage)

        NSLayoutConstraint.activate([
            healthProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            healthProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            healthProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            healthProgress.heightAnchor.constraint(equalToConstant: 17),
            
            staminaProgress.topAnchor.constraint(equalTo: healthProgress.bottomAnchor, constant: 10),
            staminaProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            staminaProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            staminaProgress.heightAnchor.constraint(equalToConstant: 17),

            experienceProgress.topAnchor.constraint(equalTo: staminaProgress.bottomAnchor, constant: 10),
            experienceProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            experienceProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            experienceProgress.heightAnchor.constraint(equalToConstant: 17),
            
            testImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            testImage.centerXAnchor.constraint(equalTo: experienceProgress.centerXAnchor),
            testImage.heightAnchor.constraint(equalToConstant: 100),
            testImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

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
    
    let statusPhoto = UIImageView()
    
    let timeProgress = MBProgressView(for: .time)

    let rankButton = MBButton(image: Images.rank!)
    let trainingButton = MBButton(image: Images.bag!)
    let fightButton = MBButton(image: Images.ring!)
    let shopButton = MBButton(image: Images.shop!)
    let teamButton = MBButton(image: Images.team!)
    
    /*
        trainingButton          fightButton
        shopButton              teamButton
                    rankButton
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    private func configure() {
        configureBars()
        configurePhotoStatus()
        configureButtonsMenu()
        configureContraints()
    }
    
    private func configureBars() {
        healthProgress.setProgress(0.5, animated: true)
        staminaProgress.setProgress(0.8, animated: true)
        experienceProgress.setProgress(0.5, animated: true)
        timeProgress.setProgress(0.3, animated: true)
        
        view.addSubviews([healthProgress, staminaProgress, experienceProgress, timeProgress, trainingButton, fightButton, shopButton, teamButton, rankButton])
    }
    
    private func configurePhotoStatus() {
        statusPhoto.image = UIImage(named: "training")
        view.addSubview(statusPhoto)
        statusPhoto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureButtonsMenu() {
        testImage.image = Images.bag
    }
    
    private func configureContraints() {
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
            
            statusPhoto.topAnchor.constraint(equalTo: experienceProgress.bottomAnchor, constant: 40),
            statusPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusPhoto.heightAnchor.constraint(equalToConstant: 240),
            statusPhoto.widthAnchor.constraint(equalToConstant: 300),
            
            timeProgress.topAnchor.constraint(equalTo: statusPhoto.bottomAnchor, constant: 10),
            timeProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeProgress.heightAnchor.constraint(equalToConstant: 17),
            
            trainingButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            trainingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            fightButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            fightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            shopButton.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 90),
            shopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            teamButton.topAnchor.constraint(equalTo: fightButton.bottomAnchor, constant: 40),
            teamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            rankButton.topAnchor.constraint(equalTo: shopButton.bottomAnchor, constant: 40),
            rankButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}

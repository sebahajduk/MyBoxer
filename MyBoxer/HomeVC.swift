//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

extension UIButton {
    func pulsate() {

                let pulse = CASpringAnimation(keyPath: "transform.scale")
                pulse.duration = 0.2
                pulse.fromValue = 0.95
                pulse.toValue = 1.0
                pulse.autoreverses = true
                pulse.repeatCount = 2
                pulse.initialVelocity = 0.5
                pulse.damping = 1.0

                layer.add(pulse, forKey: "pulse")
            }
}

class HomeVC: UIViewController {

    let testImage = MBImageView(frame: .zero)
    
    let staminaProgress = MBProgressView(for: .stamina)
    let healthProgress = MBProgressView(for: .hp)
    let experienceProgress = MBProgressView(for: .experience)
    
    let statusPhoto = UIImageView()
    
    let timeProgress = MBProgressView(for: .time)

    let button = UIButton()
    
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
        
        view.addSubview(healthProgress)
        view.addSubview(staminaProgress)
        view.addSubview(experienceProgress)
        view.addSubview(timeProgress)
        
        
        
        button.setBackgroundImage(Images.bag, for: .normal)
        button.backgroundColor = .black.withAlphaComponent(0.2)
        button.setTitle("HELLO", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
    }
    
    private func configurePhotoStatus() {
        statusPhoto.image = UIImage(named: "training")
        view.addSubview(statusPhoto)
        statusPhoto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureButtonsMenu() {
        testImage.image = Images.bag
        view.addSubview(testImage)
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
            
            button.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.widthAnchor.constraint(equalToConstant: 100),
            
            testImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            testImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testImage.heightAnchor.constraint(equalToConstant: 100),
            testImage.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
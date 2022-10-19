//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    var player = Player()
    
    let staminaProgress = MBProgressView(for: .stamina)
    let healthProgress = MBProgressView(for: .hp)
    let experienceProgress = MBProgressView(for: .experience)
    
    let statusPhoto = UIImageView()
    
    let timeProgress = MBProgressView(for: .time)

    let rankButton = MBHomeButton(image: Images.rank!)
    let trainingButton = MBHomeButton(image: Images.bag!)
    let fightButton = MBHomeButton(image: Images.ring!)
    let shopButton = MBHomeButton(image: Images.shop!)
    let teamButton = MBHomeButton(image: Images.team!)
    
    let timeLeftLabel = MBLabel(size: 15, alignment: .center)
    var timeLeft: TimeInterval?
    var isTimerActive = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        startTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    private func configure() {
        configureBars()
        configurePhotoStatus()
        configureButtonsMenu()
        configureContraints()
    }
    
    private func configureBars() {
        healthProgress.setProgress(player.hp/player.vitality, animated: true)
        staminaProgress.setProgress(Float(player.stamina/100), animated: true)
        experienceProgress.setProgress(Float(player.experience/player.nextLevel), animated: true)
        
        view.addSubviews([healthProgress, staminaProgress, experienceProgress, timeProgress, timeLeftLabel])
    }
    
    private func configurePhotoStatus() {
        statusPhoto.image = UIImage(named: "boxer")
        statusPhoto.sizeToFit()
        view.addSubview(statusPhoto)
        statusPhoto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureButtonsMenu() {
        view.addSubviews([trainingButton, fightButton, shopButton, teamButton, rankButton])
        
        trainingButton.addTarget(self, action: #selector(pushTrainingVC), for: .touchUpInside)
        fightButton.addTarget(self, action: #selector(pushFightingVC), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(pushShopVC), for: .touchUpInside)
        teamButton.addTarget(self, action: #selector(pushTeamVC), for: .touchUpInside)
        rankButton.addTarget(self, action: #selector(pushRankVC), for: .touchUpInside)
    }
    
    private func startTimer() {
        if TimeManager.shared.inProgres && !isTimerActive {
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                if TimeManager.shared.inProgres {
                    self.timeLeft = TimeManager.shared.getTimeLeft()
                    self.isTimerActive = true
                    DispatchQueue.main.async {
                        self.timeProgress.setProgress(Float((self.timeLeft ?? 0) / TimeManager.shared.trainingTime), animated: true)
                        self.timeLeftLabel.text = DateComponentsFormatter().string(from: self.timeLeft!)!
                        print(Float(self.timeLeft!))
                    }
                } else {
                    self.timeProgress.setProgress(0, animated: true)
                    self.timeLeftLabel.text = ""
                    self.isTimerActive = false
                    timer.invalidate()
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        isTimerActive = false
        timeProgress.setProgress(Float((self.timeLeft ?? 0) / TimeManager.shared.trainingTime), animated: true)
    }
    
    @objc func pushTrainingVC() {
        let trainingVC = TrainingVC(myBoxer: player)
        
        navigationController!.pushViewController(trainingVC, animated: true)
    }
     
    @objc func pushFightingVC() {
        let fightingVC = FightingVC()
        
        navigationController!.pushViewController(fightingVC, animated: true)
    }
    
    @objc func pushShopVC() {
        let shopVC = ShopVC()
        
        navigationController!.pushViewController(shopVC, animated: true)
    }
    
    @objc func pushTeamVC() {
        let teamVC = TeamVC()
        
        navigationController!.pushViewController(teamVC, animated: true)
    }
    
    @objc func pushRankVC() {
        let rankVC = RankVC()
        
        navigationController!.pushViewController(rankVC, animated: true)
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
            statusPhoto.widthAnchor.constraint(equalToConstant: 240),
            
            timeProgress.topAnchor.constraint(equalTo: statusPhoto.bottomAnchor, constant: 10),
            timeProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeProgress.heightAnchor.constraint(equalToConstant: 17),
            
            timeLeftLabel.topAnchor.constraint(equalTo: timeProgress.bottomAnchor, constant: 10),
            timeLeftLabel.centerXAnchor.constraint(equalTo: timeProgress.centerXAnchor),
            timeLeftLabel.heightAnchor.constraint(equalToConstant: 17),
            timeLeftLabel.widthAnchor.constraint(equalToConstant: 100),
            
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

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
    
    let playerPhoto = UIImageView(image: Images.player)
    let coinLabel = MBLabel(size: 15, color: .label, alignment: .right)
    let coinImage = UIImageView(image: Images.coin)
    
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
        loadData()
        configure()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [self] in
            updateUI()
            startTimer()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startTimer()
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
        saveBoxer()
    }
    
    private func saveBoxer() {
        Defaults.shared.myBoxer = player
    }
    
    private func loadData() {
        player = Defaults.shared.myBoxer ?? Player()
        player.homeRegeneration(intervals: TimeManagerLocal.shared.timeIntervals)
        
        switch player.division {
        case .lightweight:
            Boxers.lightweightBoxers.insert(player, at: player.rank)
        case .middleweight:
            Boxers.middleweightBoxers.insert(player, at: player.rank)
        case .heavyweight:
            Boxers.heavyweightBoxers.insert(player, at: player.rank)
        }
    }
    
    //MARK: Time managment
    
    private func startTimer() {
        var timerFiredCounter = 0
        if !isTimerActive {
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] timer in
                if TimeManagerLocal.shared.inProgres {
                    timeLeft = TimeManagerLocal.shared.getTimeLeft()
                    isTimerActive = true
                    DispatchQueue.main.async { [self] in
                        timeProgress.setProgress(Float((timeLeft ?? 0) / Defaults.shared.actionTime), animated: true)
                        timeLeftLabel.text = DateComponentsFormatter().string(from: timeLeft!)!
                        print(Float(timeLeft!))
                    }
                } else {
                    if timerFiredCounter == 1500 {
                        player.homeRegeneration(intervals: 1)
                        updateUI()
                        timerFiredCounter = 0
                    }
                    timerFiredCounter += 1
                    timeLeftLabel.text = ""
                    stopTimer()
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        isTimerActive = false
        timeProgress.setProgress(0, animated: true)
    }
    
    //MARK: View updating
    
    private func updateUI() {
        DispatchQueue.main.async { [self] in
            healthProgress.setProgress(Float(player.hp/player.vitality), animated: true)
            staminaProgress.setProgress(Float(player.stamina/player.fullStamina), animated: true)
            experienceProgress.setProgress(Float(player.experience/player.nextLevel), animated: true)
            
            coinLabel.text = "\(player.money)"
        }
    }
    
    //MARK: View configuration
    
    private func configure() {
        view.addSubviews([coinImage, coinLabel])
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(pushDetailVC))
        
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.tintColor = .systemYellow
        coinLabel.text = String(player.money)
        
        configureBars()
        configurePlayerPhoto()
        configureButtonsMenu()
        configureContraints()
    }
    
    private func configureBars() {
        view.addSubviews([healthProgress, staminaProgress, experienceProgress, timeProgress, timeLeftLabel])
        
        healthProgress.setProgress(Float(player.hp/player.vitality), animated: true)
        staminaProgress.setProgress(Float(player.stamina/player.fullStamina), animated: true)
        experienceProgress.setProgress(Float(player.experience/player.nextLevel), animated: true)
    }
    
    private func configurePlayerPhoto() {
        view.addSubview(playerPhoto)
        playerPhoto.sizeToFit()
        playerPhoto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureButtonsMenu() {
        view.addSubviews([trainingButton, fightButton, shopButton, teamButton, rankButton])
        
        trainingButton.addTarget(self, action: #selector(pushTrainingVC), for: .touchUpInside)
        fightButton.addTarget(self, action: #selector(pushOpponentsVC), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(pushShopVC), for: .touchUpInside)
        teamButton.addTarget(self, action: #selector(pushTeamVC), for: .touchUpInside)
        rankButton.addTarget(self, action: #selector(pushRankVC), for: .touchUpInside)
    }
    
    private func configureContraints() {
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            coinImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coinImage.widthAnchor.constraint(equalToConstant: 15),
            coinImage.heightAnchor.constraint(equalToConstant: 15),
            
            coinLabel.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor),
            coinLabel.trailingAnchor.constraint(equalTo: coinImage.leadingAnchor, constant: -2),
            coinLabel.widthAnchor.constraint(equalToConstant: 150),
            coinLabel.heightAnchor.constraint(equalToConstant: 15),
            
            healthProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
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
            
            playerPhoto.topAnchor.constraint(equalTo: experienceProgress.bottomAnchor, constant: 40),
            playerPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerPhoto.heightAnchor.constraint(equalToConstant: 240),
            playerPhoto.widthAnchor.constraint(equalToConstant: 240),
            
            timeProgress.topAnchor.constraint(equalTo: playerPhoto.bottomAnchor, constant: 10),
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
    
    //MARK: Objective-c methods
    
    @objc func pushDetailVC() {
        let detailVC = PlayerDetailsVC()
        
        detailVC.set(player: player)
        
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        
        navigationController!.present(detailVC, animated: true)
    }
    
    @objc func pushTrainingVC() {
        let trainingVC = TrainingVC(myBoxer: player)
        
        navigationController!.pushViewController(trainingVC, animated: true)
    }
    
    @objc func pushOpponentsVC() {
        let opponentsVC = OpponentsVC(player: player)
        
        navigationController!.pushViewController(opponentsVC, animated: true)
    }
    
    @objc func pushShopVC() {
        let shopVC = ShopVC(player: player)
        
        navigationController!.pushViewController(shopVC, animated: true)
    }
    
    @objc func pushTeamVC() {
        let teamVC = TeamVC(player: player)
        
        navigationController!.pushViewController(teamVC, animated: true)
    }
    
    @objc func pushRankVC() {
        let rankVC = RankVC()
        
        navigationController!.pushViewController(rankVC, animated: true)
    }
}

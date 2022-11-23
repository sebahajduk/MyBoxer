//
//  Player.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Player: Boxer {
    var currentLevel: Int = 1
    var experience: Double = 0.0
    var nextLevel: Double = 100.0
    
    var money: Int = 0
    
    // Multipliers for team members effects
    var moneyMultiplier = 1.0
    var trainingEffect = 1.0
    var fightRegeneration = 1.0
    var homeRegeneration = 1.0

    func training(_ type: TrainingType) {
        switch type {
            
        case .shadowBoxing:
            movement += 1
            defence += 1
            
        case .weightLifting:
            punchPower += 2
            
        case .jumpingRope:
            footwork += 2
        
        case .ballThrow:
            punchSpeed += 2
        
        case .intervals:
            endurance += 2
        }
        stamina -= 5
        experienceGained(points: 50)
    }
    
    func homeRegeneration(intervals: Int = 0) {
        if stamina < fullStamina {
            stamina += fullStamina * (0.01 * Double(intervals))
        }
        
        if stamina > fullStamina {
            stamina = fullStamina
        }
        
        if hp < vitality {
            hp += vitality * (0.01 * Double(intervals))
        }
        
        if hp > vitality {
            hp = vitality
        }
    }
    
    func wonFight(against opponent: Opponent) {
        money += Int(opponent.vitality * 1000)
        experienceGained(points: opponent.vitality)
    }
    
    func hire(member: Member) {
        money -= member.price
        switch member.type {
        case .manager:
            moneyMultiplier = 1.0
            moneyMultiplier += Double(member.stats) / 100
            print("Money multiplier: \(moneyMultiplier)")
        case .coach:
            trainingEffect = 1.0
            trainingEffect += Double(member.stats) / 100
            print("Training effect: \(trainingEffect)")
        case .cutman:
            fightRegeneration = 1.0
            fightRegeneration += Double(member.stats) / 100
            print("Fight regeneration: \(fightRegeneration)")
        case .physio:
            homeRegeneration = 1.0
            homeRegeneration += Double(member.stats) / 100
            print("Home regeneration: \(homeRegeneration)")
        }
    }
    
    func buyItem(_ item: Item) {
        money -= item.cost
        switch item.type {
        case .gloves:
            punchPower += item.stats
        case .boots:
            footwork += item.stats
        case .shorts:
            movement += item.stats
        case .tapes:
            punchSpeed += item.stats
        }
    }
    
    private func experienceGained(points: Double) {
        experience += points
        if experience >= nextLevel {
            levelUp()
        }
    }
    
    private func levelUp() {
        experience -= nextLevel
        nextLevel += 100 * Double(currentLevel)
        currentLevel += 1
        
        if currentLevel % 3 == 0 {
            vitality += 10
            movement += 1
            defence += 1
            punchSpeed += 1
            punchPower += 1
            footwork += 1
            endurance += 1
        }
    }
    
    override init() {
        super.init()
    }
    
    //MARK: Codable conformance
    
    private enum CodingKeys: String, CodingKey {
        case hp, stamina, fullStamina, currentLevel, experience, nextLevel, money, moneyMultiplier, trainingEffect, fightRegeneration, homeRegeration
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try super.init(from: decoder)
        
        hp = try container.decode(Double.self, forKey: .hp)
        stamina = try container.decode(Double.self, forKey: .stamina)
        fullStamina = try container.decode(Double.self, forKey: .fullStamina)
        currentLevel = try container.decode(Int.self, forKey: .currentLevel)
        experience = try container.decode(Double.self, forKey: .experience)
        nextLevel = try container.decode(Double.self, forKey: .nextLevel)
        money = try container.decode(Int.self, forKey: .money)
        moneyMultiplier = try container.decode(Double.self, forKey: .moneyMultiplier)
        trainingEffect = try container.decode(Double.self, forKey: .trainingEffect)
        fightRegeneration = try container.decode(Double.self, forKey: .fightRegeneration)
        homeRegeneration = try container.decode(Double.self, forKey: .homeRegeration)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try super.encode(to: encoder)
        
        try container.encode(hp, forKey: .hp)
        try container.encode(stamina, forKey: .stamina)
        try container.encode(fullStamina, forKey: .fullStamina)
        try container.encode(currentLevel, forKey: .currentLevel)
        try container.encode(experience, forKey: .experience)
        try container.encode(nextLevel, forKey: .nextLevel)
        try container.encode(money, forKey: .money)
        try container.encode(moneyMultiplier, forKey: .moneyMultiplier)
        try container.encode(trainingEffect, forKey: .trainingEffect)
        try container.encode(fightRegeneration, forKey: .fightRegeneration)
        try container.encode(homeRegeneration, forKey: .homeRegeration)
    }
    
}

//
//  Player.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Player: Boxer {
    var hp: Float = 100
    
    var stamina: Float = 100
    var fullStamina: Float = 100
    
    var currentLevel: Int = 1
    var experience: Float = 0.0
    var nextLevel: Float = 100.0

    
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
    
    func homeRegeneration(intervals: Int = 1) {
        if stamina < fullStamina {
            stamina += fullStamina * (0.01 * Float(intervals))
        }
        
        if stamina > fullStamina {
            stamina = fullStamina
        }
        
        if hp < vitality {
            hp += vitality * (0.01 * Float(intervals))
        }
        
        if hp > vitality {
            hp = vitality
        }
    }
    
    private func experienceGained(points: Float) {
        if nextLevel - experience > points {
            experience += points
        } else {
            levelUp()
        }
    }
    
    private func levelUp() {
        experience -= nextLevel
        nextLevel += 100 * Float(currentLevel)
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
        case hp, stamina, fullStamina, currentLevel, experience, nextLevel
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try super.init(from: decoder)
        
        hp = try container.decode(Float.self, forKey: .hp)
        stamina = try container.decode(Float.self, forKey: .stamina)
        fullStamina = try container.decode(Float.self, forKey: .fullStamina)
        currentLevel = try container.decode(Int.self, forKey: .currentLevel)
        experience = try container.decode(Float.self, forKey: .experience)
        nextLevel = try container.decode(Float.self, forKey: .nextLevel)
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
    }
    
    
    
}

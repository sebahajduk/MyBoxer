//
//  Player.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Player: Boxer, Codable {
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
        experience += 50
    }
    
    func homeRegeneration(intervals: Int = 1) {
        if stamina < fullStamina {
            stamina += stamina * (0.01 * Float(intervals))
        }
        
        if hp < vitality {
            hp += hp * (0.01 * Float(intervals))
        }
    }
    
    
    
    private func experienceGained(points: Float) {
        if experience < nextLevel {
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
}

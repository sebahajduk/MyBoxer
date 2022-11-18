//
//  Boxer.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

enum punchTypes: CaseIterable {
    case jab, hook, uppercut
}

class Boxer: Codable {
    var vitality: Float = 100.0
    var punchPower: Float = 10 // Weight lifting +2
    var punchSpeed: Float = 10 // Ball throwing +2
    var footwork: Float = 10 // Jumping rope +2
    var movement: Float = 10 // Shadow box +1
    var defence: Float = 10 // Shadow box +1
    var endurance: Float = 10 // Interval +2
    
    var hp: Float = 100
    var stamina: Float = 100
    var fullStamina: Float = 100
    
    func punch(opponent: Boxer) -> Float {
        let punchType = punchTypes.allCases.randomElement()!
        let attPower = punchPower - (opponent.defence * 0.1)
        let hitChance = (punchSpeed - ((opponent.movement + opponent.footwork) * 0.1)) / punchSpeed
        
        switch punchType {
        case .jab:
            // Fastest punch. It has biggest chance to hit the target, but damage is small.
            let n = Float.random(in: 0...1)
            if stamina >= 1 { stamina -= 1 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance {
                let p = Float.random(in: 0.8...1.0)
                return attPower * p
            } else {
                return 0.0
            }
            
        case .hook:
            // Medium punch. It has smaller chance to hit the targer, but damage is bigger than jab.
            let n = Float.random(in: 0...1)
            if stamina >= 3 { stamina -= 3 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance - 0.2 {
                let p = Float.random(in: 0.9...1.2)
                return attPower * p
            } else {
                return 0.0
            }
            
        case .uppercut:
            // Hard punch. It has the biggest damage, but it's hard to hit the target.
            let n = Float.random(in: 0...1)
            if stamina >= 5 { stamina -= 5 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance - 0.4 {
                let p = Float.random(in: 1.2...1.6)
                return attPower * p
            } else {
                return 0.0
            }
            
        }
        
        
    }
    
    func regeneration() {
        stamina += endurance
        
        if stamina > fullStamina {
            stamina = fullStamina
        }
    }
    
}

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

class Boxers {
    static var boxers: [Boxer] = [
        Opponent(forLevel: 1, name: "Devin Colbert"),
        Opponent(forLevel: 2, name: "Colt Street"),
        Opponent(forLevel: 4, name: "Deryck Michaels"),
        Opponent(forLevel: 8, name: "Brody Miller"),
        Opponent(forLevel: 16, name: "Theo Barker"),
        Opponent(forLevel: 24, name: "Hughie Mcbride"),
        Opponent(forLevel: 32, name: "Alvin Blair"),
        Opponent(forLevel: 40, name: "Randolph Barton"),
        Opponent(forLevel: 48, name: "Gaylord Saunders"),
        Opponent(forLevel: 56, name: "Atwater Fitzgerald"),
        Opponent(forLevel: 64, name: "Marsh Bell"),
        Opponent(forLevel: 72, name: "Justin Andrews"),
        Opponent(forLevel: 80, name: "Jordan Jenning")
    ]
}

class Boxer: Codable {
    var vitality: Double = 100.0
    var punchPower: Double = 10 // Weight lifting +2
    var punchSpeed: Double = 10 // Ball throwing +2
    var footwork: Double = 10 // Jumping rope +2
    var movement: Double = 10 // Shadow box +1
    var defence: Double = 10 // Shadow box +1
    var endurance: Double = 10 // Interval +2
    
    var hp: Double = 100
    var stamina: Double = 100
    var fullStamina: Double = 100
    
    func punch(opponent: Boxer) -> Double {
        let punchType = punchTypes.allCases.randomElement()!
        let attPower = punchPower - (opponent.defence * 0.1)
        let hitChance = (punchSpeed - ((opponent.movement + opponent.footwork) * 0.1)) / punchSpeed
        
        switch punchType {
        case .jab:
            // Fastest punch. It has biggest chance to hit the target, but damage is small.
            let n = Double.random(in: 0...1)
            if stamina >= 1 { stamina -= 1 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance {
                let p = Double.random(in: 0.8...1.0)
                return attPower * p
            } else {
                return 0.0
            }
            
        case .hook:
            // Medium punch. It has smaller chance to hit the targer, but damage is bigger than jab.
            let n = Double.random(in: 0...1)
            if stamina >= 3 { stamina -= 3 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance - 0.2 {
                let p = Double.random(in: 0.9...1.2)
                return attPower * p
            } else {
                return 0.0
            }
            
        case .uppercut:
            // Hard punch. It has the biggest damage, but it's hard to hit the target.
            let n = Double.random(in: 0...1)
            if stamina >= 5 { stamina -= 5 } else { return 0.00001 }
            print("\(stamina)  /// \(vitality)")
            if n <= hitChance - 0.4 {
                let p = Double.random(in: 1.2...1.6)
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

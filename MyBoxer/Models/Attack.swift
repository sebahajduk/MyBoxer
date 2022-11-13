//
//  Attack.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 06/11/2022.
//

import Foundation

struct Attack {
    let attacker: Attacker
    let damage: Float
    
    static func hit(attacker: Boxer, defender: Boxer) -> Float {
        let damage = attacker.punch(opponent: defender)
        
        return damage
    }
}

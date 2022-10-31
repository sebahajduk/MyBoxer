//
//  Player.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Player: Boxer {
    var hp: Float = 80.0
    var stamina: Int = 100
    
    var currentLevel: Int = 1
    var experience: Float = 20.0
    var nextLevel: Float = 100.0
    
    var status: BoxerStatus = .training
    
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
        
        saveBoxer()
    }
    
    private func saveBoxer() {
        Defaults.shared.myBoxer = self
        
        
        
    }
}

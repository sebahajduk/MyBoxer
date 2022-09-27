//
//  Boxer.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

enum BoxerStatus {
    case training, fighting, resting
}

class Boxer {
    var vitality: Float = 100.0
    var punchPower: Int = 10 // Weight lifting +2
    var punchSpeed: Int = 10 // Ball throwing +2
    var footwork: Int = 10 // Jumping rope +2
    var movement: Int = 10 // Shadow box +1
    var defence: Int = 10 // Shadow box +1
    var endurance: Int = 10 // Interval +2
    
    #warning("Change it to correct values")
    var hp: Float = 80.0
    var stamina: Int = 100
    
    var currentLevel: Int = 1
    var experience: Float = 20.0
    var nextLevel: Float = 100.0
    
    var status: BoxerStatus = .training
    
    func shadowBox() {
        movement += 1
        defence += 1
    }
}

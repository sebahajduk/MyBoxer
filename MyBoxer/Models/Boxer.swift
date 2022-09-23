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
    var vitality: Int = 100
    var punchPower: Int = 10
    var punchSpeed: Int = 10
    var footwork: Int = 10
    var movement: Int = 10
    var defence: Int = 10
    var condition: Int = 10
    
    #warning("Change it to correct values")
    var hp: Int = 80
    var stamina: Int = 100
    
    var currentLevel: Int = 1
    var experience: Int = 0
    var nextLevel: Int = 100
    
    var status: BoxerStatus = .training
}

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
    
}

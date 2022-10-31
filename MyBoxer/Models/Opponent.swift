//
//  Opponent.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Opponent: Boxer {
    
    init(forLevel: Int) {
        super.init()
        self.vitality = Float(forLevel) * 150
        punchPower = forLevel * 2
        punchSpeed = forLevel * 2
        footwork = forLevel * 4
        movement = forLevel * 3
        defence = forLevel * 3
        endurance = forLevel * 5
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

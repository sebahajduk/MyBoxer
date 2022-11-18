//
//  Opponent.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 25/10/2022.
//

import Foundation

class Opponent: Boxer {
    
    var name: String!
    
    init(forLevel: Int, name: String) {
        super.init()
        vitality = Float(forLevel) * 150
        hp = vitality
        self.name = name
        punchPower = Float(forLevel * 2)
        punchSpeed = Float(forLevel * 2)
        footwork = Float(forLevel * 4)
        movement = Float(forLevel * 3)
        defence = Float(forLevel * 3)
        endurance = Float(forLevel * 5)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

//
//  Item.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 11/10/2022.
//

import Foundation

struct Item {
    let name: String
    let stats: Float
    let cost: Int
    
    init(name: String, stats: Float, cost: Int) {
        self.name = name
        self.stats = stats
        self.cost = cost
    }
}

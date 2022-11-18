//
//  Item.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 11/10/2022.
//

import UIKit

enum ItemType {
    case gloves, boots, shorts, tapes
}

struct Item {
    let name: String
    let stats: Float
    let cost: Int
    let type: ItemType
    var image: UIImage! = Images.boxingGlove
    
    init(name: String, stats: Float, cost: Int, type: ItemType) {
        self.name = name
        self.stats = stats
        self.cost = cost
        self.type = type
        
        switch type {
        case .gloves:
            image = Images.boxingGlove
        case .boots:
            image = Images.boxingBoots
        case .shorts:
            image = Images.boxingShorts
        case .tapes:
            image = Images.boxingTapes
        }
    }
}

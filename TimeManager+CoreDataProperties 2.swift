//
//  TimeManager+CoreDataProperties.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 26/10/2022.
//
//

import Foundation
import CoreData


extension TimeManager {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeManager> {
        return NSFetchRequest<TimeManager>(entityName: "TimeManager")
    }


}

extension TimeManager : Identifiable {

}

//
//  TimeManager.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 04/10/2022.
//

import Foundation

class TimeManager {
    
    static let shared = TimeManager()
    
    var now = Date.now
    var endedTime: Date!
    var timeLeft: TimeInterval! = 0.5 {
        didSet {
            HomeVC.shared.timeProgressValue = Float(timeLeft)
        }
    }
    var inProgres: Bool = false
    
    func start() {
        endedTime = now.addingTimeInterval(10)
        inProgres = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.now = Date.now
            if self.endedTime < self.now {
                print("Training completed")
                self.inProgres = false
                timer.invalidate()
            } else {
                print("Training...")
                self.timeLeft = self.endedTime.timeIntervalSinceReferenceDate - self.now.timeIntervalSinceReferenceDate
                
            }
        }
    }
    
}

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
    var timeLeft: TimeInterval! = 0.5
    var inProgres: Bool = false
    var trainingTime: Double = 1
    
    func train(for time: Double) {
        now = Date.now
        trainingTime = time
        endedTime = now.addingTimeInterval(time)
        inProgres = true
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.now = Date.now
            if self.endedTime < self.now {
                self.inProgres = false
                timer.invalidate()
            }
        }
    }
    
    func getTimeLeft() -> TimeInterval! {
        self.timeLeft = self.endedTime.timeIntervalSinceReferenceDate - self.now.timeIntervalSinceReferenceDate
        return timeLeft
    }
    
}

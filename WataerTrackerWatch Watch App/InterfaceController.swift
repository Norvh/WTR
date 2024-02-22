//
//  InterfaceController.swift
//  WataerTrackerWatch Watch App
//
//

import WatchKit
import Foundation

class ProgressTrackInterfaceController: WKInterfaceController {
    @IBOutlet var progressLabel: WKInterfaceLabel!
    @IBOutlet var waterIntakeLabel: WKInterfaceLabel!
    @IBOutlet var addWaterButton: WKInterfaceButton!
    @IBOutlet var removeWaterButton: WKInterfaceButton!
    
    var currentWaterIntake: Double = 0.0
    var dailyWaterIntakeGoal: Double = 2.0 // مثال للهدف اليومي، يمكن تعديله حسب الحاجة

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        updateUI()
    }
    
    func updateUI() {
        let progress = currentWaterIntake / dailyWaterIntakeGoal
        progressLabel.setText(String(format: "%.1f%%", progress * 100))
        waterIntakeLabel.setText(String(format: "%.1f / %.1f liters", currentWaterIntake, dailyWaterIntakeGoal))
    }
    
    @IBAction func addWater() {
        currentWaterIntake += 0.1
        updateUI()
    }
    
    @IBAction func removeWater() {
        if currentWaterIntake > 0 {
            currentWaterIntake -= 0.1
        }
        updateUI()
    }
}

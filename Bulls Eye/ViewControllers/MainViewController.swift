//
//  MainViewController.swift
//  Bulls Eye
//
//  Created by Muhammed Karakul on 11.06.2018.
//  Copyright © 2018 Muhammed Karakul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var randomNumber = 0
    var score = 0
    var round = 1
    var sliderValue = 0
    
    enum Status {
        case equal
        case greather
        case less
    }
    
    // MARK: - Outlets
    @IBOutlet weak var guessSlider: UISlider!
    @IBOutlet weak var bullsEyeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(status: false)
    }
    
    // MARK: - Methods
    func showAlert(title: String, message: String, status: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)

        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.updateView(status: status)
        }
        
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateView(status: Bool) {
        
        guessSlider.setValue(50, animated: true)
        randomNumber = Int(arc4random_uniform(99) + 1)
        bullsEyeLabel.text = String(randomNumber)
        
        if status {
            score = score + sliderValue
            round = round + 1
        } else {
            score = 0
            round = 1
        }
        
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    // MARK: - Actions
    
    @IBAction func hitMeButtonTapped(_ sender: UIButton) {
        sliderValue = Int(guessSlider.value)
        if abs(sliderValue - randomNumber) > 10 {
            showAlert(title: "Tekrar dene.", message: "Fark 10 dan buyuk.\nTahmin: \(sliderValue)", status: false)
        } else {
            showAlert(title: "Oldukca yaklastin.", message: "Fark 10 dan kucuk.\nTahmin: \(sliderValue)", status: true)
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        updateView(status: false)
    }
    
}

//
//  ViewController.swift
//  Scale
//
//  Created by Ethan Song on 10/2/18.
//  Copyright © 2018 Ethan Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weight = 0.00
    var tareWeight = 0.00
    var timer = Timer()
    
    
    @IBOutlet weak var tareButton: UIButton!
    @IBOutlet weak var weightButton: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
         /*timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(adjustScale), userInfo: nil, repeats: true)*/
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    @IBAction func tareScale(_ sender: Any) {
        
        tareWeight = weight
        weight -= tareWeight
        weightLabel.text = String(weight)+"g"
    }
    
    @IBAction func resetScale(_ sender: Any) {
        
        let alert = UIAlertController(title: "Reset?", message: "Are you sure?", preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Okay", style: .default, handler: self.reset)
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(okayButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    @objc func reset(alert: UIAlertAction){
        weight = 0.0
        tareWeight = 0.0
        weightLabel.text = String(weight)
        print("reset")
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*if let touch = touches.first {
            if #available(iOS 12.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        weightLabel.text = "385+ g"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let roundGrams = Double(grams)
                        weight = roundGrams - tareWeight
                        weightLabel.text = String(weight) + "g"
                    }
                }
            }
        }*/
    }
    @objc func adjustScale(_ touches: Set<UITouch>){
        if let touch = touches.first {
            if #available(iOS 12.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        weightLabel.text = "385+ g"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let roundGrams = Double(grams)
                        weight = roundGrams - tareWeight
                        weightLabel.text = String(weight) + "g"
                    }
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        weight = 0.0
        weightLabel.text = String(weight)
    }
    
    
    
    
    
    
    
    
    

}
    



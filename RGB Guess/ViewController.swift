//
//  ViewController.swift
//  RGB Guess
//
//  Created by 郑淇木 on 6/28/15.
//  Copyright (c) 2015 Qimu Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var R: Int = 0;
    var G: Int = 0;
    var B: Int = 0;
    
    var R_answer: Int = 123;
    var G_answer: Int = 54;
    var B_answer: Int = 90;
    
    @IBOutlet weak var R_label: UILabel!
    @IBOutlet weak var G_label: UILabel!
    @IBOutlet weak var B_label: UILabel!
    
    
    @IBOutlet weak var R_slider: UISlider!
    @IBOutlet weak var G_slider: UISlider!
    @IBOutlet weak var B_slider: UISlider!
    
    
    let norm: Float = 255.0;
    
    @IBAction func skipProblem() {
        newRound()
    }
    
    @IBOutlet weak var colorBoard: UIView!

    @IBAction func checkColor() {
        
        let difference = abs(R_answer - R) + abs(G_answer - G) + abs(B_answer - B)
        let score = max(Int(100 - Float(difference) / 3), 0)
        
        let message = "Answer: (\(R_answer),\(G_answer),\(B_answer))"  +
                        "\nYour score: \(score)"

        
        
        let alert = UIAlertController(title: "Score", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                                                                                self.newRound()
                                                                            })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newRound(){
        R = 0
        G = 0
        B = 0
        
        R_answer = Int(arc4random_uniform(256))
        G_answer = Int(arc4random_uniform(256))
        B_answer = Int(arc4random_uniform(256))
        
        colorBoard.backgroundColor = UIColor(red: CGFloat(Float(R_answer)/norm), green: CGFloat(Float(G_answer)/norm), blue: CGFloat(Float(B_answer)/norm), alpha: CGFloat(1.0))
        
        
        initializeSlider()
        updateLabelText()
        println(colorBoard.backgroundColor!.description)
        
    }
    
    
    @IBAction func sliderChange(sender: UISlider) {
        switch sender.restorationIdentifier! {
            case "R": R = lroundf(sender.value)
            case "G": G = lroundf(sender.value)
            case "B": B = lroundf(sender.value)
        default:
            break
        }
        updateLabelText()
    }
    
    func initializeSlider(){
        R_slider.value = 0
        G_slider.value = 0
        B_slider.value = 0
        
        
    }
    
    func updateLabelText() {
        R_label.text = "\(R)"
        G_label.text = "\(G)"
        B_label.text = "\(B)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


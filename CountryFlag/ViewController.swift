//
//  ViewController.swift
//  CountryFlag
//
//  Created by Severus Snape on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreButton: UIButton!
    
    private var questionCount = 0
    private var countriesArray = [String]()
    private var score = 0
    private var correctAnswer = 0
    private var highScore = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countriesArray += ["estonia", "france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        
        buttonLayer()
        askQuestion()
    
    }
    
    func askQuestion(alert: UIAlertAction! = nil){
       
      
      
        countriesArray.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countriesArray[0]), for: UIControl.State.normal)
        button2.setImage(UIImage(named: countriesArray[1]),for: UIControl.State.normal)
        button3.setImage(UIImage(named: countriesArray[2]), for: UIControl.State.normal)
        
        title = countriesArray[correctAnswer].uppercased()
        
        
        questionCount += 1
        
        if questionCount == 10{
            let endAlert = UIAlertController(title: "Game Over", message: "Your score: \(score)", preferredStyle: .alert)
            endAlert.addAction(UIAlertAction(title: "Okey", style: .default, handler: nil))
            
            present(endAlert, animated: true)
        }
        
        
       
    
    }
    

    
    

    @IBAction func selectAnswer(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
          
            
        } else{
            title = "Wrong"
            score -= 1
        }
        
        let alert = UIAlertController(title: title, message: "Your score: \(score)", preferredStyle: .alert)

        alert.addAction(UIAlertAction.init(title: "Continue", style: UIAlertAction.Style.default,handler: askQuestion))
        
        present(alert, animated: true)
      
        scoreLabel.text = "\(score)"
        
    
       
    
    }
  
    
    func buttonLayer(){
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }
    
}


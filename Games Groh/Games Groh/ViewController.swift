//
//  ViewController.swift
//  Games Groh
//
//  Created by period4 on 4/5/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet var label9 : UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    var allLabels: [UILabel] = []
    
    func checkForWinner()
        {

        if label1.text == label2.text && label2.text == label3.text  && label1.text != ""
        {
        alert()
        }
        if label4.text == label5.text && label5.text == label6.text  && label4.text != ""
        {
        alert()
        }
        if label7.text == label8.text && label8.text == label9.text  && label7.text != ""
        {
        alert()
        }
        if label1.text == label4.text && label4.text == label7.text  && label1.text != ""
        {
        alert()
        }
        if label2.text == label5.text && label5.text == label8.text  && label2.text != ""
        {
        alert()
        }
        if label3.text == label6.text && label6.text == label9.text  && label3.text != ""
        {
        alert()
        }
        if label1.text == label5.text && label5.text == label9.text  && label1.text != ""
        {
        alert()
        }
        if label3.text == label5.text && label5.text == label7.text  && label3.text != ""
        {
        alert()
        }
                
        }
    
    func alert()  {
        let winningAlert = UIAlertController(title: "You Won🥳🥳🥳", message: "Whoever you beat was probaly terrible🤣😂🤣😂", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game???", style: .default) { (action)
            in self.reset()
        }
        winningAlert.addAction(newGameButton)
        present(winningAlert, animated: true, completion: nil)
        }

        

    @IBAction func tagG(_ sender: UITapGestureRecognizer) {
        let seletcedPoint = sender.location(in: myView)
        for label in allLabels{
            if label.frame.contains(seletcedPoint){
        placeInToLabel(myLabel: label)
            }
        }
    checkForWinner()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        allLabels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        // Do any additional setup after loading the view.
    }
                
    
               
    func placeInToLabel(myLabel: UILabel){
        if myLabel.text == ""{
            if turnLabel.text == "X"{
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
            }
            else {
                myLabel.text = turnLabel.text
                turnLabel.text = "X"
                
            }
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    
    func reset()  {
        for label in allLabels{
            label.text = ""
        }
        turnLabel.text = "X"
    }
    

    
}


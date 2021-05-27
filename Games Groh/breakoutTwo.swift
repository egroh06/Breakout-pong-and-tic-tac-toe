//
//  breakoutTwo.swift
//  Games Groh
//
//  Created by period4 on 5/21/21.
//

import UIKit
import AVFoundation
class breakoutTwo: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var paddle : UIView!
    
    var allBricks = [UIView]()
    @IBOutlet weak var brick1: UIView!
    @IBOutlet weak var brick2: UIView!
    @IBOutlet weak var brick3: UIView!
    @IBOutlet weak var brick4: UIView!
    @IBOutlet weak var brick5: UIView!
    @IBOutlet weak var brick6: UIView!
    @IBOutlet weak var brick7: UIView!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    var startingPoint : CGPoint = CGPoint(x:45, y:100 )
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    var bricksDynamicBehavior : UIDynamicItemBehavior!
    
    var brickCount = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = 13
        allBricks = [brick1, brick2, brick3, brick4, brick5, brick6, brick7]
        ball.isHidden = true
        paddle.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer){
        paddle.center = CGPoint(x: sender.location(in: view).x , y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
        
    }
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7 , dy: 0.7 )
        pushBehavior.active = true
        pushBehavior.magnitude = 0.8
        dynamicAnimator.addBehavior(pushBehavior)
       
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ball])
        ballDynamicBehavior.allowsRotation = false
        ballDynamicBehavior.elasticity = 0.7
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.resistance = 0.0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.density = 1000
        paddleDynamicBehavior.elasticity = 0.7
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        bricksDynamicBehavior = UIDynamicItemBehavior(items: allBricks)
        bricksDynamicBehavior.density = 500
        bricksDynamicBehavior.elasticity = 0.9
        bricksDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(bricksDynamicBehavior)
        
    }
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        sender.isHidden = true
        paddle.isHidden = false
        ball.isHidden = false
        ball.center = startingPoint
        let sound = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "SHREK")
        sound.speak(utterance)
      
        
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in allBricks{
            if item1.isEqual(ball) && item2.isEqual(brick) {
                brick.isHidden = true
                collisionBehavior.removeItem(brick)
                brickCount = brickCount - 1
                print(brickCount)
                if brickCount == 0 {
                    winAlert()
                   // ball.isHidden = true
                   // collisionBehavior.removeItem(ball)
                    ballDynamicBehavior.resistance = 1000
                    startButtonOutlet.isHidden = false
                    brickCount = 7
                    for brick in allBricks{
                        brick.isHidden = false
                    }
                    
                }
            }
        }
    
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddle.center.y {
            alert()
        }
        
    }
    func reset()  {
        //reset bricks
        
        
    }
    
    func alert()  {
        let losingAlert = UIAlertController(title: "Game over", message: "Maybe try a different game😂🤣😂", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game???", style: .default) { (action)
            in self.reset()
            
        }
        losingAlert.addAction(newGameButton)
        present(losingAlert, animated: true, completion: nil)
    }
    func winAlert() {
        let winAlert = UIAlertController(title: "YOU WIN!!", message: "", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game???", style: .default) { (action)
            in self.reset()
                       }
        winAlert.addAction(newGameButton)
        present(winAlert, animated: true, completion: nil)
    }
   

}

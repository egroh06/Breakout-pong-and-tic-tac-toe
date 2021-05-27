//
//  pong.swift
//  Games Groh
//
//  Created by period4 on 5/17/21.
//

import UIKit


class pong : UIViewController, UICollisionBehaviorDelegate {

    
    @IBOutlet weak var paddleOne: UIView!
    @IBOutlet weak var paddleTwo: UIView!
    @IBOutlet weak var ball: UIView!
   
    var startingPoint : CGPoint = CGPoint(x:45, y:100 )
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func paddleOneMove(_ sender: Any) {
        paddleOne.center = CGPoint(x: (sender as AnyObject).location(in: view).x , y: paddleOne.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleOne)
    }
    
    @IBAction func paddleTwoMove(_ sender: Any) {
        paddleTwo.center = CGPoint(x: (sender as AnyObject).location(in: view).x , y: paddleTwo.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleTwo)
    }
     
    func dynamicBehaviors()  {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7 , dy: 0.7 )
        pushBehavior.active = true
        pushBehavior.magnitude = 0.8
        dynamicAnimator.addBehavior(pushBehavior)
       
        collisionBehavior = UICollisionBehavior(items: [ball, paddleOne, paddleTwo] )
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
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleOne, paddleTwo])
        paddleDynamicBehavior.density = 1000
        paddleDynamicBehavior.elasticity = 0.7
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
    }

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddleOne.center.y {
            
        } else if p.y < paddleTwo.center.y {
    
                                  }
    }
        
       
        
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        paddleTwo.isHidden = false
        paddleOne.isHidden = false
        ball.isHidden = false
        ball.center = startingPoint
    }
    
    
    
    
    
    
    
    
    
}


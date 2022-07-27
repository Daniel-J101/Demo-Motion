//
//  CooperViewController.swift
//  ClassDemo17-Motion
//
//  Created by Joe Miller on 7/21/22.
//  Copyright © 2022 bulko. All rights reserved.
//

import UIKit
import CoreMotion

class CooperViewController: UIViewController {
    @IBOutlet weak var cooperImageView: UIImageView!
    
    let motionManager = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(
            to: OperationQueue.current!) {
                (deviceMotion, error) -> Void in
                
                if error == nil {
                    self.handleDeviceMotionUpdate(deviceMotion:deviceMotion!)
                } else {
                    print("Error occurred.")
                }
            }
    }
    
    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let gravity = deviceMotion.gravity
        let rotation = atan2(gravity.x, gravity.y) - Double.pi
        self.cooperImageView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
        
    }
    
    func degrees(radians:Double) -> Double {
        return 180 / Double.pi * radians
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

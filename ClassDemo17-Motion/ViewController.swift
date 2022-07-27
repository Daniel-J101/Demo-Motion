//
//  ViewController.swift
//  ClassDemo17-Motion
//
//  Created by bulko on 10/26/16.
//  Copyright © 2016 bulko. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xAccelLabel: UILabel!
    @IBOutlet weak var yAccelLabel: UILabel!
    @IBOutlet weak var zAccelLabel: UILabel!
    @IBOutlet weak var xRotationLabel: UILabel!
    @IBOutlet weak var yRotationLabel: UILabel!
    @IBOutlet weak var zRotationLabel: UILabel!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let acceleration = deviceMotion.userAcceleration
        let xAcc = acceleration.x
        let yAcc = acceleration.y
        let zAcc = acceleration.z
        
        xAccelLabel.text = String(format: "%0.2f", xAcc)
        yAccelLabel.text = String(format: "%0.2f", yAcc)
        zAccelLabel.text = String(format: "%0.2f", zAcc)
        
        
        let attitude = deviceMotion.attitude
        let pitch = degrees(radians: attitude.pitch)
        let roll = degrees(radians: attitude.roll)
        let yaw = degrees(radians: attitude.yaw)
        
        xRotationLabel.text = String(format: "0.2f", pitch)
        yRotationLabel.text = String(format: "0.2f", roll)
        zRotationLabel.text = String(format: "0.2f", yaw)
        
        
        
    }
    
    func degrees(radians:Double) -> Double {
        return 180 / Double.pi * radians
    }

}

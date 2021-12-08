//
//  ViewController.swift
//  Sketch
//
//  Created by 최승민 on 2021/12/08.
//

import UIKit

class ViewController: UIViewController {
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnBlack: UIButton!
    @IBOutlet var btnRed: UIButton!
    @IBOutlet var btnGreen: UIButton!
    @IBOutlet var btnBlue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnBlack.isEnabled = false
        enableButtons(red: false)
    }
    
    func enableButtons(black: Bool = true, red: Bool = true, green: Bool = true, blue: Bool = true) {
        btnBlack.isEnabled = black
        btnRed.isEnabled = red
        btnGreen.isEnabled = green
        btnBlue.isEnabled = blue
    }

    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func btnColorChangeBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
        enableButtons(black: false)
    }
    
    @IBAction func btnColorChangeRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
        enableButtons(red: false)
    }
    @IBAction func btnColorChangeGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
        enableButtons(green: false)
    }
    @IBAction func btnColorChangeBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
        enableButtons(blue: false)
    }

    @IBAction func tfChangeTickness(_ sender: UITextField) {
        lineSize = CGFloat((sender.text! as NSString).floatValue)
    }
}


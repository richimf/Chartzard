//
//  Chartzard.swift
//  Chartzard
//
//  Created by Richie on 12/19/17.
//  Copyright © 2017 Richie. All rights reserved.
//

import Foundation
import UIKit

class Chartzard: UIView {
    
    private var data:[Int] = []
    private var color:CGColor?
    private var previousScale:CGFloat = 1.0
    private let zoomItSelector:Selector = #selector(Chartzard.zoomIt(sender:))

    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.data = data
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        setGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
       // drawLine()
        setupLayer()
    }
    
    private func setupLayer(){
        self.layer.contentsGravity = kCAGravityCenter
        drawLine(steps: 2000)
        self.layer.masksToBounds = false
    }
    
    func setGesture(){
       // let pinch = UIPinchGestureRecognizer(target: self, action: zoomItSelector)
       // tap.delegate = self as? UIGestureRecognizerDelegate
       // self.addGestureRecognizer(pinch)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: zoomItSelector)
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    //TODO: Quizas le convenga ser un Lazy Object
//    func generatePath()->CGPath?{
//        let path:CGPath?
//        return path
//    }

    func drawLine(steps:Int){
        //1
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        //2
        ctx.beginPath()
        //ctx.move(to: CGPoint(x: 0.0, y: 0.0)) //pone un nuevo path en el origen especificado
        //ctx.addLine(to: CGPoint(x: Double(i)+10.0, y: Double(i)+10.0))

        let centerY = frame.height / 2   // find the vertical center
        let steps = 2000                 // Divide the curve into steps
        let stepX = frame.width / CGFloat(steps) // find the horizontal step distance
        ctx.move(to: CGPoint(x: 0.0, y: centerY)) //pone un nuevo path en el origen especificado

        for i in 0...steps {
            let x = CGFloat(i) * stepX
            let y = (sin(Double(i) * 0.1) * 40) + Double(centerY)
            ctx.addLine(to: CGPoint(x: x, y: CGFloat(y)))
        }
        
        //ctx.addPath(path)
        //ctx.addLine(to: CGPoint(x: 100.0, y: 200.0))
        ctx.setLineWidth(2)
        ctx.setStrokeColor(UIColor(red:0.24, green:0.78, blue:0.38, alpha:1.00).cgColor)
        //3
        //ctx.closePath()
        ctx.strokePath()
    }
    
    func drawLineLayer(){
        //1
        //let customLayer:CALayer = CALayer(layer: self.layer)
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        //2
        ctx.beginPath()
        //ctx.move(to: CGPoint(x: 0.0, y: 0.0)) //pone un nuevo path en el origen especificado
        //ctx.addLine(to: CGPoint(x: Double(i)+10.0, y: Double(i)+10.0))
        
        let centerY = frame.height / 2   // find the vertical center
        let steps = 2000                 // Divide the curve into steps
        let stepX = frame.width / CGFloat(steps) // find the horizontal step distance
        ctx.move(to: CGPoint(x: 0.0, y: centerY)) //pone un nuevo path en el origen especificado
        
        for i in 0...steps {
            let x = CGFloat(i) * stepX
            let y = (sin(Double(i) * 0.1) * 40) + Double(centerY)
            ctx.addLine(to: CGPoint(x: x, y: CGFloat(y)))
        }
        
        //ctx.addPath(path)
        //ctx.addLine(to: CGPoint(x: 100.0, y: 200.0))
        ctx.setLineWidth(2)
        ctx.setStrokeColor(UIColor(red:0.24, green:0.78, blue:0.38, alpha:1.00).cgColor)
        //3
        //ctx.closePath()
        ctx.strokePath()
        
        self.layer.contents = ctx
    }
    
    //TODO: Intengar que sea O(n)
    private func generatePath(){
        
    }
    
    //TODO: GRID FOR GRAPH
    //TODO: DRAG AND SWIPE INDICATOR, ZOOM, ANIMATION, CANDLE INDICATORS
    func zoomIt(sender: UIPinchGestureRecognizer? = nil) {
        //pinchAction(sender: sender!)
//        let scale:CGFloat = previousScale
//        //self.transform = CGAffineTransform(scaleX: scale, y: scale)
//        let transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 1, 0);
//        //set back the transform
//        self.layer.transform = transform
//        self.layer.bounds = self.bounds
//        previousScale = (scale == 2.0) ? 1.0 : 2.0
        
        drawLine(steps: 200)
    }
    
    func handleIt(gestureRecognizer: UIGestureRecognizer) {
        print("jeje")
    }
    
    func pinchAction(sender:UIPinchGestureRecognizer) {
        let scale:CGFloat = previousScale * sender.scale
        self.transform = CGAffineTransform(scaleX: scale, y: scale);
        previousScale = sender.scale
    }
    
}

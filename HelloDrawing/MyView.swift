//
//  MyView.swift
//  HelloDrawing
//
//  Created by Kotyada,Durga Susmitha on 4/11/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import UIKit

class MyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 */
    var points:[[CGPoint]] = []
    var color:[UIColor] = []
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        if points.count > 0{
            //for subpath in points{
            for i in 0 ..< points.count{
                let subpath = points[i]
                if subpath.count == 0{
                    return
                }

                let path = UIBezierPath()
                //UIColor.red.setStroke()
                color[i].setStroke()
         path.move(to:subpath[0])
         // path.move(to:points[0])
        //for pt in points{
                for pt in subpath{
            path.addLine(to:pt)
        }
        path.stroke()
        }
        }
//        path.move(to:CGPoint(x: 200.0, y: 50.0))
//        path.addLine(to:CGPoint(x: 20.0, y: 150.0))
//        path.addLine(to:CGPoint(x: 5.0, y: 30.0))
//        path.close()
//        UIColor.red.setStroke()
//        UIColor.green.setFill()
//        path.lineWidth = 5.0
//        path.stroke()
//        path.fill()
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        points.append([(touch?.location(in: self))!])
        color.append(UIColor(displayP3Red: CGFloat(Float.random(in: 0.0 ... 1.0)), green: CGFloat(Float.random(in: 0.0 ... 1.0)), blue: CGFloat(Float.random(in: 0.0 ... 1.0)), alpha: 1.0))
        print("Began: \(String(describing: touch?.location(in: self)))")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        points[points.count-1].append((touch?.location(in: self))!)
        print("Moved: \(String(describing: touch?.location(in: self)))")
        setNeedsDisplay()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        points[points.count-1].append((touch?.location(in: self))!)
        print("Ended: \(String(describing: touch?.location(in: self)))")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        print("Cancelle: \(String(describing: touch?.location(in: self)))")
    }
}

//
//  PainterView.swift
//  MyApp08
//
//  Created by iii on 2017/6/23.
//  Copyright © 2017年 iii. All rights reserved.
//

import UIKit

class PainterView: UIView {
    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    private var lines:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var recycle:Array<Array<(CGFloat,CGFloat)>> = [[]]
    
    // 呈現外觀
    override func draw(_ rect: CGRect) {
        viewW = rect.size.width
        viewH = rect.size.height

        let context:CGContext? = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        for j in 0..<lines.count {
            if lines[j].count<=1 {continue}
            for i in 1..<lines[j].count {
                let (p0x, p0y) = lines[j][i-1]
                let (p1x, p1y) = lines[j][i]
                
                context?.move(to: CGPoint(x: p0x, y: p0y))
                context?.addLine(to: CGPoint(x: p1x, y: p1y))
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        
        recycle = [[]]
        lines += [[]]
        lines[lines.count-1] += [(point.x, point.y)]
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        
        lines[lines.count-1] += [(point.x, point.y)]
        setNeedsDisplay()
    }
    
    func clear() {
        lines = [[]]
        recycle = [[]]
        setNeedsDisplay()
    }
    
    func undo(){
        if lines.count > 0 {
            recycle +=  [lines.remove(at: lines.count-1)]
            setNeedsDisplay()
        }
    }
    
    func redo() {
        if recycle.count > 0 {
            lines +=  [recycle.remove(at: recycle.count-1)]
            setNeedsDisplay()
        }
    }
    
    
    
    
    
}

//
//  LimitChartDataSetRendererEffect.swift
//  Charts
//
//  Created by Kip Nicol on 4/26/16.
//  Copyright © 2016 dcg. All rights reserved.
//

import Foundation

public class LimitChartDataSetRendererEffect: ChartDataSetRendererEffect {

    var limit: Double
    var lineWidth: CGFloat
    
    var labelAttributedString: NSAttributedString?
    var labelInsects = UIEdgeInsets(top: 0, left: 20, bottom: 2, right: 0)
    
    public init(limit: Double, lineWidth: CGFloat, labelAttributedString: NSAttributedString?) {
        self.limit = limit
        self.lineWidth = lineWidth
        self.labelAttributedString = labelAttributedString
        super.init()
    }
    
    override public func didDrawData(context: CGContext) {
        CGContextSaveGState(context)
        
        let lineMidPoint = transformValueToPixel(CGPoint(x: 0, y: limit))
        let limitLineRect = CGRect(x: parentRenderer.viewPortHandler.contentLeft, y: lineMidPoint.y - (lineWidth / 2.0), width: parentRenderer.viewPortHandler.contentWidth, height: lineWidth)
        
        drawLine(context, limitLineRect: limitLineRect)
        drawLabel(context, limitLineRect: limitLineRect)
        
        CGContextRestoreGState(context)
    }
    
    func drawLabel(context: CGContext, limitLineRect: CGRect) {
        if let labelAttributedText = labelAttributedString {
            let textSize = labelAttributedText.size()
            let prymeTextRect = CGRect(x: limitLineRect.origin.x + labelInsects.left, y: limitLineRect.minY - textSize.height - labelInsects.bottom, width: textSize.width, height: textSize.height)
            
            UIGraphicsPushContext(context)
            labelAttributedText.drawInRect(prymeTextRect)
            UIGraphicsPopContext()
        }
    }
    
    func drawLine(context: CGContext, limitLineRect: CGRect) {
        CGContextSaveGState(context)
        
        CGContextAddRect(context, limitLineRect)
        CGContextClip(context)
        
        // Draw the gradient
        let baseColor = UIColor.whiteColor()
        let locations = [CGFloat(0.0), CGFloat(0.50), CGFloat(1.0)]
        let colors = [
            baseColor.colorWithAlphaComponent(0.10).CGColor,
            baseColor.colorWithAlphaComponent(0.85).CGColor,
            baseColor.colorWithAlphaComponent(0.10).CGColor,
            ]
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), colors as CFArrayRef, locations);
        let point1 = CGPointMake(limitLineRect.origin.x, limitLineRect.midY);
        let point2 = CGPointMake(limitLineRect.maxX, limitLineRect.midY);
        CGContextDrawLinearGradient(context, gradient, point1, point2, [.DrawsBeforeStartLocation, .DrawsAfterEndLocation]);
        
        CGContextRestoreGState(context)
    }
}

//
//  LineChartDataSetImageRendererEffect.swift
//  Charts
//
//  Created by Kip Nicol on 2/11/16.
//  Copyright © 2016 dcg. All rights reserved.
//

import Foundation

public class LineChartDataSetImageRendererEffect: LineChartDataSetRendererEffect
{
    public var image: UIImage
    public var imageCenterDataEntry: ChartDataEntry
    public var imageSize: CGSize
    
    public init(image: UIImage, imageCenterDataEntry: ChartDataEntry, imageSize: CGSize)
    {
        self.image = image
        self.imageCenterDataEntry = imageCenterDataEntry
        self.imageSize = imageSize
        
        super.init()
    }
    
    public override func willDrawData(context: CGContext)
    {
        CGContextSaveGState(context)
        
        // TODO: update name of pointMapped method
        let originPoint = pointMapped(CGPoint(x: Double(imageCenterDataEntry.xIndex), y: imageCenterDataEntry.value))
        var drawRect = CGRect(origin: originPoint, size: imageSize)
        drawRect.offsetInPlace(dx: -drawRect.width / 2.0, dy: -drawRect.height / 2.0)
        
        image.drawInRect(drawRect)
        
        CGContextRestoreGState(context)
    }
}

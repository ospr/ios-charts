//
//  ChartRendererEffect.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
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
        
        let originPoint = transformValueToPixel(CGPoint(x: Double(imageCenterDataEntry.xIndex), y: imageCenterDataEntry.value))
        var drawRect = CGRect(origin: originPoint, size: imageSize)
        drawRect.offsetInPlace(dx: -drawRect.width / 2.0, dy: -drawRect.height / 2.0)
        
        image.drawInRect(drawRect)
        
        CGContextRestoreGState(context)
    }
}

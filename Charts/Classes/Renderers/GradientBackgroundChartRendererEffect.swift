//
//  GradientBackgroundChartRendererEffect.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

public class GradientBackgroundChartRendererEffect: ChartRendererEffect
{
    public var gradientColors: [UIColor]
    public var gradientLocations: [CGFloat]
    
    private var cachedGradientImage = UIImage()
    
    public init(gradientColors: [UIColor], gradientLocations: [CGFloat])
    {
        self.gradientColors = gradientColors
        self.gradientLocations = gradientLocations
        
        super.init()
    }
    
    override public func willDrawData(context: CGContext)
    {
        let bounds = parentChart.bounds
        
        if cachedGradientImage.size != bounds.size
        {
            UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
            
            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            CGContextAddRect(context, bounds)
            CGContextEOClip(context)
            
            let space = CGColorSpaceCreateDeviceRGB()
            let gradient = CGGradientCreateWithColors(space, gradientColors.map{ $0.CGColor } as CFArrayRef, gradientLocations)
            
            let point = CGPointMake(bounds.midX, bounds.minY)
            let point2 = CGPointMake(bounds.midX, bounds.maxY)
            CGContextDrawLinearGradient(context, gradient, point, point2, [.DrawsBeforeStartLocation, .DrawsAfterEndLocation])
            
            cachedGradientImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
        }
        
        cachedGradientImage.drawInRect(bounds)
    }
}

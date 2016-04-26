//
//  ShadowChartDataSetRendererEffect.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

public class ShadowChartDataSetRendererEffect: ChartDataSetRendererEffect
{
    var shadowColor: UIColor
    var shadowBlur: CGFloat
    var shadowOffset: CGSize
    
    public init(shadowColor: UIColor, shadowBlur: CGFloat, shadowOffset: CGSize)
    {
        self.shadowColor = shadowColor
        self.shadowBlur = shadowBlur
        self.shadowOffset
            = shadowOffset
        
        super.init()
    }
    
    public override func willDrawData(context: CGContext)
    {
        CGContextSaveGState(context)
        
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, shadowColor.CGColor)
    }
    
    public override func didDrawData(context: CGContext)
    {
        CGContextRestoreGState(context)
    }
}

//
//  ChartRendererEffectBase.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

public class ChartRendererEffect: ChartRendererEffectBase
{
    public var parentChart: ChartViewBase!
    
    internal func updateForRendering(parentChart parentChart: ChartViewBase)
    {
        self.parentChart = parentChart
    }
}

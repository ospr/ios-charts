//
//  LineChartDataSetRendererEffect.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

public class LineChartDataSetRendererEffect: ChartRendererEffectBase
{
    public var parentRenderer: LineChartRenderer!
    public var parentDataSet: IChartDataSet!
    
    internal func updateForRendering(parentRenderer parentRenderer: LineChartRenderer, parentDataSet: IChartDataSet)
    {
        self.parentRenderer = parentRenderer
        self.parentDataSet = parentDataSet
    }
    
    public func transformValueToPixel(valuePoint: CGPoint) -> CGPoint
    {
        let valueToPixelTransformer = parentRenderer.dataProvider!.getTransformer(parentDataSet.axisDependency)
        return CGPointApplyAffineTransform(valuePoint, valueToPixelTransformer.valueToPixelMatrix)
    }
}

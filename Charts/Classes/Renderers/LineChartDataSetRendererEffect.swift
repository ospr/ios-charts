//
//  ChartDataSetRendererEffect.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

public protocol ChartRendering {
    var viewPortHandler: ChartViewPortHandler! { get }
    var renderingDataProvider: BarLineScatterCandleBubbleChartDataProvider? { get }
}

public class ChartDataSetRendererEffect: ChartRendererEffectBase
{
    public var parentRenderer: ChartRendering!
    public var parentDataSet: IChartDataSet!
    
    internal func updateForRendering(parentRenderer parentRenderer: ChartRendering, parentDataSet: IChartDataSet)
    {
        self.parentRenderer = parentRenderer
        self.parentDataSet = parentDataSet
    }
    
    public func transformValueToPixel(valuePoint: CGPoint) -> CGPoint
    {
        let valueToPixelTransformer = parentRenderer.renderingDataProvider!.getTransformer(parentDataSet.axisDependency)
        return CGPointApplyAffineTransform(valuePoint, valueToPixelTransformer.valueToPixelMatrix)
    }
}

//
//  LineScatterCandleRadarChartDataSet.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 29/7/15.
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation
import UIKit

public class LineScatterCandleRadarChartDataSet: BarLineScatterCandleBubbleChartDataSet, ILineScatterCandleRadarChartDataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    /// Enables / disables the horizontal highlight-indicator. If disabled, the indicator is not drawn.
    public var drawHorizontalHighlightIndicatorEnabled = true
    
    /// Enables / disables the lower vertical highlight-indicator. If disabled, the indicator is not drawn.
    public var drawLowerVerticalHighlightIndicatorEnabled = true

    /// Enables / disables the upper vertical highlight-indicator. If disabled, the indicator is not drawn.
    public var drawUpperVerticalHighlightIndicatorEnabled = true
    
    /// - returns: true if horizontal highlight indicator lines are enabled (drawn)
    public var isHorizontalHighlightIndicatorEnabled: Bool { return drawHorizontalHighlightIndicatorEnabled }
    
    /// - returns: true if lower vertical highlight indicator lines are enabled (drawn)
    public var isLowerVerticalHighlightIndicatorEnabled: Bool { return drawLowerVerticalHighlightIndicatorEnabled }

    /// - returns: true if upper vertical highlight indicator lines are enabled (drawn)
    public var isUpperVerticalHighlightIndicatorEnabled: Bool { return drawUpperVerticalHighlightIndicatorEnabled }
    
    /// Enables / disables both vertical and horizontal highlight-indicators.
    /// :param: enabled
    public func setDrawHighlightIndicators(enabled: Bool)
    {
        drawHorizontalHighlightIndicatorEnabled = enabled
        setDrawVerticalHighlightIndicators(enabled: enabled)
    }
    
    /// Enables / disables the lower and upper vertical highlight-indicator. If disabled, the indicator is not drawn.
    public func setDrawVerticalHighlightIndicators(enabled enabled: Bool)
    {
        drawLowerVerticalHighlightIndicatorEnabled = enabled
        drawUpperVerticalHighlightIndicatorEnabled = enabled
    }
    
    // MARK: NSCopying
    
    public override func copyWithZone(zone: NSZone) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! LineScatterCandleRadarChartDataSet
        copy.drawHorizontalHighlightIndicatorEnabled = drawHorizontalHighlightIndicatorEnabled
        copy.drawLowerVerticalHighlightIndicatorEnabled = drawLowerVerticalHighlightIndicatorEnabled
        copy.drawUpperVerticalHighlightIndicatorEnabled = drawUpperVerticalHighlightIndicatorEnabled
        return copy
    }
    
}

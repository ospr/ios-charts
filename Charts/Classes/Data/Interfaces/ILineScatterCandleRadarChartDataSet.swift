//
//  ILineScatterCandleRadarChartDataSet.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 26/2/15.
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/ios-charts
//

import Foundation

@objc
public protocol ILineScatterCandleRadarChartDataSet: IBarLineScatterCandleBubbleChartDataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    /// Enables / disables the horizontal highlight-indicator. If disabled, the indicator is not drawn.
    var drawHorizontalHighlightIndicatorEnabled: Bool { get set }
    
    /// Enables / disables the vertical highlight-indicator. If disabled, the indicator is not drawn.
    var drawLowerVerticalHighlightIndicatorEnabled: Bool { get set }

    /// Enables / disables the vertical highlight-indicator. If disabled, the indicator is not drawn.
    var drawUpperVerticalHighlightIndicatorEnabled: Bool { get set }
    
    /// - returns: true if horizontal highlight indicator lines are enabled (drawn)
    var isHorizontalHighlightIndicatorEnabled: Bool { get }
    
    /// - returns: true if lower vertical highlight indicator lines are enabled (drawn)
    var isLowerVerticalHighlightIndicatorEnabled: Bool { get }

    /// - returns: true if upper vertical highlight indicator lines are enabled (drawn)
    var isUpperVerticalHighlightIndicatorEnabled: Bool { get }
    
    /// Enables / disables both vertical and horizontal highlight-indicators.
    /// :param: enabled
    func setDrawHighlightIndicators(enabled: Bool)
    
    /// Enables / disables both upper/lower vertical highlight-indicators.
    /// :param: enabled
    func setDrawVerticalHighlightIndicators(enabled enabled: Bool)
}

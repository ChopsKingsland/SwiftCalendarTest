//
//  CalendarMode.swift
//  calendar
//
//  Created by Charlie Kingsland on 12/09/2021.
//

import Foundation
import SwiftUI

enum CalenderMode {
    case month(estimateHeight: CGFloat)
    case week(estimateHeight: CGFloat)
    var estimateHeight: CGFloat {
        switch self {
        case .month(estimateHeight: let estimateHeight):
            return estimateHeight
        case .week(estimateHeight: let estimateHeight):
            return estimateHeight
        }
    }
}

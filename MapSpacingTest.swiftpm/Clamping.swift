//
//  Clamping.swift
//  MapSpacingTest
//
//  Created by Liam Edwards on 6/01/24.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

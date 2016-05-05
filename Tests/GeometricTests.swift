//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class GeometricTests: XCTestCase {
    func testGeometric() {
        let n = 1000000
        let p: ContinuousValue = uniform(exclusiveMin: 0.0, exclusiveMax: 1.0)

        let samples: [DiscreteValue] = (0..<n).map({ _ in geometric(probability: p) })

        let mean = Double(samples.reduce(0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: DiscreteValue) in
            current + (Double(val) - mean) * (Double(val) - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        XCTAssertEqualWithAccuracy(mean, (1 - p) / p, accuracy: 1)
        XCTAssertEqualWithAccuracy(variance, (1 - p) / (p * p), accuracy: 1)
    }
}
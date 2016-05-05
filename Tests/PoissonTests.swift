//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class PoissonTests: XCTestCase {
    func testPoisson() {
        let n = 10000
        let λ: ContinuousValue = uniform(DBL_MIN...250)

        let samples: [DiscreteValue] = (0..<n).map({ _ in poisson(frequency: λ) })

        let mean = Double(samples.reduce(0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: DiscreteValue) in
            current + (Double(val) - mean) * (Double(val) - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        XCTAssertEqualWithAccuracy(mean, λ, accuracy: 0.007 * Double(n))
        XCTAssertEqualWithAccuracy(variance, λ, accuracy: 0.007 * Double(n))
    }
}
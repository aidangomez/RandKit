//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class ExponentialTests: XCTestCase {
    func testExponential() {
        let n = 10000
        let λ: ContinuousValue = uniform(DBL_MIN...DBL_MAX)

        let samples: [ContinuousValue] = (0..<n).map({ _ in exponential(rate: λ) })

        let mean = Double(samples.reduce(0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: ContinuousValue) in
            current + (val - mean) * (val - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        XCTAssertEqualWithAccuracy(mean, 1.0 / λ, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(variance, 1.0 / (λ * λ), accuracy: 0.01)
    }
}
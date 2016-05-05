//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class BernoulliTests: XCTestCase {
    func testBernoulli() {
        let n = 10000
        let p = uniform()

        let samples: [DiscreteValue] = (0..<n).map({ _ in bernoulli(probability: p) })

        for sample in samples {
            XCTAssert(0 == sample || sample == 1)
        }

        let mean = Double(samples.reduce(0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: DiscreteValue) in
            current + (Double(val) - mean) * (Double(val) - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        XCTAssertEqualWithAccuracy(mean, p, accuracy: 0.007)
        XCTAssertEqualWithAccuracy(variance, p * (1 - p), accuracy: 0.007)
    }
}
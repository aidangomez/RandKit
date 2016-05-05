//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class BinomialTests: XCTestCase {
    func testBinomial() {
        let n = 10000
        let trials: Int = uniform(1...1000)
        let p = uniform()

        let samples: [DiscreteValue] = (0..<n).map({ _ in binomial(trials: trials, probability: p) })

        let mean = Double(samples.reduce(0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: DiscreteValue) in
            current + (Double(val) - mean) * (Double(val) - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        XCTAssertEqualWithAccuracy(mean, Double(trials) * p, accuracy: Double(trials) * 0.007)
        XCTAssertEqualWithAccuracy(variance, Double(trials) * p * (1 - p), accuracy: Double(trials) * 0.007)
    }
}
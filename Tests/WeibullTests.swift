//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit



func gamma(z: Double) -> Double {
    let p = [676.5203681218851, -1259.1392167224028, 771.32342877765313, -176.61502916214059, 12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7]

    var result = z
    if z < 0.5 {
        result = M_PI / (sin(M_PI*z) * gamma(1-z))
    } else {
        result -= 1
        var x = 0.99999999999980993

        for (i, pval) in p.enumerate() {
            x += pval / (result + Double(i + 1))
        }

        let t = result + Double(p.count) - 0.5
        result = sqrt(2 * M_PI) * pow(t, result + 0.5) * exp(-t) * x
    }

    return result
}


class WeibullTests: XCTestCase {
    func testWeibull() {
        let n = 1000000
        let λ: ContinuousValue = uniform(DBL_MIN...10000000)
        let k: ContinuousValue = uniform(DBL_MIN...10000000)

        let samples: [ContinuousValue] = (0..<n).map({ _ in weibull(scale: Double(λ), shape: Double(k)) })

        let mean = Double(samples.reduce(0.0, combine: +)) / Double(n)
        let varianceSum = { (current: Double, val: ContinuousValue) in
            current + (Double(val) - mean) * (Double(val) - mean)
        }
        let variance = samples.reduce(0.0, combine: varianceSum) / Double(n)

        let a = gamma(1 + 1 / k)
        let b = gamma(1 + 2 / k) - a * a
        XCTAssertEqualWithAccuracy(mean, λ * Double(a), accuracy: 0.5)
        XCTAssertEqualWithAccuracy(variance, λ * λ * Double(b), accuracy: 0.5)
    }
}
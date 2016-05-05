//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class NormalTests: XCTestCase {
    func testNormal() {
        let n = 10000

        let samples: [Double] = (0..<n).map({ _ in random() })

        for i in 0..<n {
            let sample = samples[i]
            XCTAssert(0 <= sample && sample < 1)
        }

        let mean = samples.reduce(0.0, combine: +) / ContinuousValue(n)

        XCTAssertEqualWithAccuracy(mean, 0.5, accuracy: 0.007)
    }
}
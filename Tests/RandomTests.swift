//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import RandKit

class RandomTests: XCTestCase {
    func testRandomUniform() {
        let n = 10000

        let samples: [Double] = (0..<n).map({ _ in random() })

        for i in 0..<n {
            let sample = samples[i]
            XCTAssert(0 <= sample && sample < 1)
        }

        let mean = samples.reduce(0.0, combine: +) / ContinuousValue(n)

        XCTAssertEqualWithAccuracy(mean, 0.5, accuracy: 0.007)
    }

    func testRandomUniformRange() {
        let range = -500...1000
        let n = 10000

        let dSamples: [Double] = (0..<n).map({ _ in random(range) })

        for i in 0..<n {
            let dSample = dSamples[i]
            XCTAssert(Double(range.startIndex) <= dSample && dSample < Double(range.endIndex))
        }

        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)

        XCTAssertEqualWithAccuracy(dMean, 250, accuracy: 10)
    }

    func testRandomUniformMax() {
        let max = 12345
        let n = 10000

        let dSamples: [Double] = (0..<n).map({ _ in random(Double(max)) })
        let iSamples: [Int] = (0..<n).map({ _ in random(max) })

        for i in 0..<n {
            let dSample = dSamples[i]
            let iSample = iSamples[i]
            XCTAssert(0 <= dSample && dSample < Double(max))
            XCTAssert(0 <= iSample && iSample < max)
        }

        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)
        let iMean = Double(iSamples.reduce(0, combine: +)) / Double(n)

        let expected = Double(max) / 2.0
        XCTAssertEqualWithAccuracy(dMean, expected, accuracy: Double(max) * 0.007)
        XCTAssertEqualWithAccuracy(iMean, expected, accuracy: Double(max) * 0.007)
    }

    func testRandomNormal() {
        let n = 1000000

        let dSamples: [Double] = (0..<n).map({ _ in normal() })

        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)

        XCTAssertEqualWithAccuracy(dMean, 0.0, accuracy: 0.05)
    }

    func testRandomProbability() {
        let c = 50
        let n = 10000

        for _ in 0..<c {
            let p: Double = random()
            let dSamples: [Int] = (0..<n).map({ _ in random(probability: p) ? 1 : 0 })

            let dMean = Double(dSamples.reduce(0, combine: +)) / Double(n)

            XCTAssertEqualWithAccuracy(dMean, p, accuracy: 0.05)
        }
    }
}

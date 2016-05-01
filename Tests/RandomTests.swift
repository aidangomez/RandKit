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

        let fSamples: [Float] = (0..<n).map({ _ in random() })
        let dSamples: [Double] = (0..<n).map({ _ in random() })

        for i in 0..<n {
            let fSample = fSamples[i]
            let dSample = dSamples[i]
            XCTAssert(0 <= fSample && fSample < 1)
            XCTAssert(0 <= dSample && dSample < 1)
        }

        let fMean = fSamples.reduce(0.0, combine: +) / Float(n)
        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)

        XCTAssertEqualWithAccuracy(fMean, 0.5, accuracy: 0.007)
        XCTAssertEqualWithAccuracy(dMean, 0.5, accuracy: 0.007)
    }

    func testRandomUniformRange() {
        let range = -500...1000
        let n = 10000

        let fSamples: [Float] = (0..<n).map({ _ in random(range) })
        let dSamples: [Double] = (0..<n).map({ _ in random(range) })

        for i in 0..<n {
            let fSample = fSamples[i]
            let dSample = dSamples[i]
            XCTAssert(Float(range.startIndex) <= fSample && fSample < Float(range.endIndex))
            XCTAssert(Double(range.startIndex) <= dSample && dSample < Double(range.endIndex))
        }

        let fMean = fSamples.reduce(0.0, combine: +) / Float(n)
        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)

        XCTAssertEqualWithAccuracy(fMean, 250, accuracy: 7)
        XCTAssertEqualWithAccuracy(dMean, 250, accuracy: 7)
    }

    func testRandomUniformMax() {
        let max = 12345
        let n = 10000

        let fSamples: [Float] = (0..<n).map({ _ in random(Float(max)) })
        let dSamples: [Double] = (0..<n).map({ _ in random(Double(max)) })
        let iSamples: [Int] = (0..<n).map({ _ in random(max) })

        for i in 0..<n {
            let fSample = fSamples[i]
            let dSample = dSamples[i]
            let iSample = iSamples[i]
            XCTAssert(0 <= fSample && fSample < Float(max))
            XCTAssert(0 <= dSample && dSample < Double(max))
            XCTAssert(0 <= iSample && iSample < max)
        }

        let fMean = fSamples.reduce(0.0, combine: +) / Float(n)
        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)
        let iMean = Double(iSamples.reduce(0, combine: +)) / Double(n)

        let expected = Double(max) / 2.0
        XCTAssertEqualWithAccuracy(fMean, Float(expected), accuracy: Float(max) * 0.007)
        XCTAssertEqualWithAccuracy(dMean, expected, accuracy: Double(max) * 0.007)
        XCTAssertEqualWithAccuracy(iMean, expected, accuracy: Double(max) * 0.007)
    }

    func testRandomNormal() {
        let n = 10000

        let fSamples: [Float] = (0..<n).map({ _ in normal() })
        let dSamples: [Double] = (0..<n).map({ _ in normal() })
        let iSamples: [Int] = (0..<n).map({ _ in normal() })

        let fMean = fSamples.reduce(0.0, combine: +) / Float(n)
        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)
        let iMean = Double(iSamples.reduce(0, combine: +)) / Double(n)

        XCTAssertEqualWithAccuracy(fMean, 0.0, accuracy: 0.05)
        XCTAssertEqualWithAccuracy(dMean, 0.0, accuracy: 0.05)
        XCTAssertEqualWithAccuracy(iMean, 0.0, accuracy: Double(INT32_MAX) * 0.05)
    }

    func testRandomProbability() {
        let c = 50
        let n = 10000

        for _ in 0..<c {
            let p: Double = random()
            let fSamples: [Int] = (0..<n).map({ _ in probability(p) ? 1 : 0 })
            let dSamples: [Int] = (0..<n).map({ _ in probability(p) ? 1 : 0 })
            let iSamples: [Int] = (0..<n).map({ _ in probability(p) ? 1 : 0 })

            let fMean = Float(fSamples.reduce(0, combine: +)) / Float(n)
            let dMean = Double(dSamples.reduce(0, combine: +)) / Double(n)
            let iMean = Double(iSamples.reduce(0, combine: +)) / Double(n)

            XCTAssertEqualWithAccuracy(fMean, Float(p), accuracy: 0.05)
            XCTAssertEqualWithAccuracy(dMean, p, accuracy: 0.05)
            XCTAssertEqualWithAccuracy(iMean, p, accuracy: 0.05)
        }
    }
}

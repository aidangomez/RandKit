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
        let iSamples: [Int] = (0..<n).map({ _ in random() })

        for i in 0..<n {
            let fSample = fSamples[i]
            let dSample = dSamples[i]
            let iSample = iSamples[i]
            XCTAssert(0 <= fSample && fSample < 1)
            XCTAssert(0 <= dSample && dSample < 1)
            XCTAssert(0 <= iSample && iSample < Int(INT32_MAX))
        }

        let fMean = fSamples.reduce(0.0, combine: +) / Float(n)
        let dMean = dSamples.reduce(0.0, combine: +) / Double(n)
        let iMean = Double(iSamples.reduce(0, combine: +)) / Double(n)

        XCTAssertEqualWithAccuracy(fMean, 0.5, accuracy: 0.05)
        XCTAssertEqualWithAccuracy(dMean, 0.5, accuracy: 0.05)
        XCTAssertEqualWithAccuracy(iMean, Double(INT32_MAX) / 2.0, accuracy: Double(INT32_MAX) * 0.05)
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
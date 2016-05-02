//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class RandomGenerator<Element, D: DistributionType where D.Element == Element>: GeneratorType {
    let distribution: D

    public init(distribution: D) {
        self.distribution  = distribution
    }

    public func next() -> Element? {
        return distribution.random()
    }
}

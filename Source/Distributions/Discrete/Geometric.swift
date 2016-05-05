//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class GeometricDistribution: DiscreteDistributionType {
    public typealias Element = DiscreteValue
    public let probability: Double

    public init(probability: Double) {
        self.probability = probability
    }

    public func random() -> Element {
        return geometric(probability: probability)
    }
}

public func geometric(probability p: Double) -> DiscreteValue {
    var x = 0
    while bernoulli(probability: p) != 1 {
        x += 1
    }
    return x
}


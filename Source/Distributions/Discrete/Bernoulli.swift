//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class BernoulliDistribution: DiscreteDistributionType {
    public typealias Element = DiscreteValue
    public let probability: Double

    public init(probability: Double) {
        self.probability = probability
    }

    public func random() -> Element {
        return bernoulli(probability: probability)
    }
}

public func bernoulli(probability p: Double) -> Bool {
    let x: ContinuousValue = uniform(0..<1)
    return x < p
}

public func bernoulli(probability p: Double) -> DiscreteValue {
    let x: ContinuousValue = uniform(exclusiveMin: 0, exclusiveMax: 1)
    return x < p ? 1 : 0
}

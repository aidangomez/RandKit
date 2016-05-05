//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class PoissonDistribution: DiscreteDistributionType {
    public typealias Element = DiscreteValue
    public let frequency: Double

    public init(frequency: Double) {
        self.frequency = frequency
    }

    public func random() -> Element {
        return poisson(frequency: frequency)
    }
}

public func poisson(frequency λ: Double) -> DiscreteValue {
    let bound = exp(-λ)
    precondition(bound != 0)
    var product = uniform(exclusiveMin: 0, exclusiveMax: 1)
    var i = 1
    while product >= bound {
        product *= uniform()
        i += 1
    }
    return i
}

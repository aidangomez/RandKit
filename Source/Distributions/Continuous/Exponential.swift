//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class ExponentialDistribution: ContinuousDistributionType {
    public typealias Element = ContinuousValue
    public let rate: Double

    public init(rate: Double) {
        self.rate = rate
    }

    public func random() -> Element {
        return exponential(rate: rate)
    }
}

public func exponential(rate λ: Double) -> ContinuousValue {
    return -log(uniform(exclusiveMin: 0, exclusiveMax: 1)) / λ
}

//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class WeibullDistribution: ContinuousDistributionType {
    public typealias Element = ContinuousValue
    public let scale: Double
    public let shape: Double

    public init(scale: Double, shape: Double) {
        self.scale = scale
        self.shape = shape
    }

    public func random() -> Element {
        return weibull(scale: scale, shape: shape)
    }
}

public func weibull(scale λ: Double, shape k: Double) -> ContinuousValue {
    return λ * pow(-log(uniform(exclusiveMin: 0, exclusiveMax: 1)), 1.0 / k)
}

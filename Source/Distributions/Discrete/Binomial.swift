//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class BinomialDistribution: DiscreteDistributionType {
    public typealias Element = DiscreteValue
    public let probability: Double
    public let trialCount: Int

    public init(probability: Double, trialCount: Int) {
        self.probability = probability
        self.trialCount = trialCount
    }

    public func random() -> Element {
        return binomial(trials: trialCount, probability: probability)
    }
}

public func binomial(trials n: Int, probability p: Double) -> DiscreteValue {
    let y: [DiscreteValue] = (0..<n).map({ _ in bernoulli(probability: p) })
    return y.reduce(0, combine: +)
}


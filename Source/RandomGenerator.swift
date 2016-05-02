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

public class SamplingGenerator<Element, D: DiscreteDistributionType where D.Element == DiscreteValue>: GeneratorType {
    let distribution: D
    let elements: [Element]

    public init(elements: [Element], distribution: D) {
        self.elements = elements
        self.distribution  = distribution
    }

    public func next() -> Element? {
        let index = distribution.random()
        return elements[index]
    }

    public func sample(count: Int = 1, withReplacement replacement: Bool = false) -> [Element] {
        if replacement {
            let indices = (0..<count).map({ _ in distribution.random() })
            let values = indices.map({ elements[$0] })
            return values
        } else {
            precondition(count <= elements.count)
            var indices = [DiscreteValue]()
            var values = [Element]()
            for _ in 0..<count {
                var index = distribution.random()
                while indices.contains(index) {
                    index = distribution.random()
                }
                indices.append(index)
                values.append(elements[index])
            }
            return values
        }
    }
}

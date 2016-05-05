//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class ContinuousUniformDistribution: ContinuousDistributionType {
    public typealias Element = ContinuousValue

    public let range: Range<Int>

    public init(range: Range<Int>) {
        self.range = range
    }

    public func random() -> Element {
        return uniform(range)
    }
}

public class DiscreteUniformDistribution: DiscreteDistributionType {
    public typealias Element = DiscreteValue

    public let range: Range<Int>

    public init(range: Range<Int>) {
        self.range = range
    }

    public func random() -> Element {
        return uniform(range)
    }
}

public func uniform() -> ContinuousValue {
    return ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)
}

/// Return values uniformly distributed over `range`
public func uniform(range: Range<Int>) -> ContinuousValue {
    return ContinuousValue(range.count) * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)) + ContinuousValue(range.startIndex)
}

public func uniform(range: Range<Int>) -> DiscreteValue {
    return DiscreteValue(arc4random_uniform(UInt32(range.count))) + range.startIndex
}

public func uniform(range: ClosedInterval<Double>) -> ContinuousValue {
    return (range.end - range.start) * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)) + range.start
}

public func uniform(range: HalfOpenInterval<Double>) -> ContinuousValue {
    return (range.end - DBL_MIN - range.start) * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)) + range.start
}

/// Return values uniformly distributed between `[0, max)`
public func uniform(max: Double) -> ContinuousValue {
    return max * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX))
}

public func uniform(max: Int) -> DiscreteValue {
    return DiscreteValue(arc4random_uniform(UInt32(max)))
}

public func uniform(exclusiveMin min: Double, exclusiveMax max: Double) -> ContinuousValue {
    return (max - 2 * DBL_MIN - min) * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)) + min + DBL_MIN
}

public func uniform(exclusiveMin min: Double, inclusiveMax max: Double) -> ContinuousValue {
    return (max - (min + DBL_MIN)) * (ContinuousValue(arc4random()) / ContinuousValue(UINT32_MAX)) + (min + DBL_MIN)
}

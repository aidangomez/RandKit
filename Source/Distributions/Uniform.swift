//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class UniformDistribution<Element: ValueType>: DistributionType {
    let range: Range<Int>

    public init(range: Range<Int>) {
        self.range = range
    }

    public func random() -> Element {
        return uniform(range)
    }
}

public func uniform<T: ValueType>() -> T {
    return T(arc4random()) / T(UINT32_MAX)
}

/// Return values uniformly distributed over `range`
public func uniform<T: ValueType>(range: Range<Int>) -> T {
    return T(range.count) * T(arc4random()) / T(UINT32_MAX) + T(range.startIndex)
}

public func uniform(range: Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.count))) + range.startIndex
}

/// Return values uniformly distributed between `[0, max)`
public func uniform<T: ValueType>(max: T) -> T {
    return T(max) * T(arc4random()) / T(UINT32_MAX)
}

public func uniform(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
}

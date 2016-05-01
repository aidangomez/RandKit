//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public func random<T: ValueType>() -> T {
    return uniform()
}

public func random<T: ValueType>(max: T) -> T {
    return uniform(max)
}

public func random(max: Int) -> Int {
    return uniform(max)
}

public func random<T: ValueType>(range: Range<Int>) -> T {
    return uniform(range)
}

/// Return `true` with probability `p`
public func probability<T: ValueType>(p: T) -> Bool {
    let v = random(T(1))
    return v < p
}

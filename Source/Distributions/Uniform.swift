//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public func uniform<T: ValueType>() -> T {
    return T(arc4random()) / T(UINT32_MAX)
}

public func uniform<T: ValueType>(range: Range<Int>) -> T {
    return T(range.count) * T(arc4random()) / T(UINT32_MAX) + T(range.startIndex)
}

public func uniform(range: Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.count))) + range.startIndex
}

public func uniform<T: ValueType>(max: T) -> T {
    return T(max) * T(arc4random()) / T(UINT32_MAX)
}

public func uniform(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
}

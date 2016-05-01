//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

public protocol ValueType: FloatingPointType, Comparable {
    init(_: Self)
    init(_: Float)
    init(_: Double)

    func /(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
}

extension Float: ValueType {}
extension Double: ValueType {}

public func log<T: ValueType>(x: T) -> T {
    if let val = x as? Float {
        return T(log(val))
    } else if let val = x as? Double {
        return T(log(val))
    } else {
        fatalError("Unsupported ValueType: \(x.dynamicType)")
    }
}

public func sqrt<T: ValueType>(x: T) -> T {
    if let val = x as? Float {
        return T(sqrt(val))
    } else if let val = x as? Double {
        return T(sqrt(val))
    } else {
        fatalError("Unsupported ValueType: \(x.dynamicType)")
    }
}
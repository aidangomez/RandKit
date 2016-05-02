//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public func random() -> ContinuousValue {
    return uniform()
}

public func random(max: ContinuousValue) -> ContinuousValue {
    return uniform(max)
}

public func random(max: DiscreteValue) -> DiscreteValue {
    return uniform(max)
}

public func random(range: Range<Int>) -> ContinuousValue {
    return uniform(range)
}

public func random(range: Range<Int>) -> DiscreteValue {
    return uniform(range)
}

/// Return `true` with probability `p`
public func random(probability p: ContinuousValue) -> Bool {
    let v: ContinuousValue = random(0..<1)
    return v < p
}

/// Generate `sample` random values within range `inRange`
public func random(sample count: Int, inRange range: Range<Int>, withReplacement replacement: Bool = false) -> [DiscreteValue] {
    if replacement {
        let values: [DiscreteValue] = (0..<count).map({ _ in uniform(range) })
        return values
    } else {
        precondition(count <= range.count)
        var values = [DiscreteValue]()
        while values.count < count {
            let value: DiscreteValue = uniform(range)
            if values.contains(value) {
                continue
            } else {
                values.append(value)
            }
        }
        return values
    }
}

public func random(sample count: Int, inRange range: Range<Int>, withReplacement replacement: Bool = false) -> [ContinuousValue] {
    if replacement {
        let values: [ContinuousValue] = (0..<count).map({ _ in uniform(range) })
        return values
    } else {
        precondition(count <= range.count)
        var values = [ContinuousValue]()
        while values.count < count {
            let value: ContinuousValue = uniform(range)
            if values.contains(value) {
                continue
            } else {
                values.append(value)
            }
        }
        return values
    }
}

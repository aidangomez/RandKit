//  Copyright © 2016 Aidan Gomez.
//
// This file is part of RandKit. The full RandKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.


public class NormalDistribution: ContinuousDistributionType {
    public typealias Element = ContinuousValue

    public init() {}

    public func random() -> Element {
        return normal()
    }
}

/// https://en.wikipedia.org/wiki/Marsaglia_polar_method
func marsagliaPolarMethod() -> ContinuousValue {
    var x1 = 0.0
    var x2 = 0.0
    var w = 0.0

    while w >= 1 || w == 0 {
        x1 = 2 * uniform() - 1;
        x2 = 2 * uniform() - 1;
        w = x1 * x1 + x2 * x2;
    }

    w = sqrt(-2 * log(w) / w );
    return x1 * w // we return y1 and discard y2
}

public func normal() -> ContinuousValue {
    return marsagliaPolarMethod()
}


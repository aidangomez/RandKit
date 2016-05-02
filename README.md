# RandKit

Random number generation for Swift.

##Included Features:
- Distributions
  - Uniform
  - Normal
  - Feel free to contribute!
- Generators
- Probabilities

##Usage:
``` swift
/// Uniform
let randomZeroToOne: Double = random()
let randomOverRange: Double = random(-16...32)

/// Probability
let coinFlip: Bool = probability(0.5)

/// Normal
let normalValue: Double = normal()

/// Generator
let uniformDistribution = UniformDistribution(range: -1...1)
let uniformGenerator = RandomGenerator(distribution: uniformDistribution)
```


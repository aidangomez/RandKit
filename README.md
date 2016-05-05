# RandKit

Random number generation for Swift.

##Included Features:
- Distributions
  - Uniform
  - Normal
  - Bernoulli
  - Binomial
  - Exponential
  - Geometric
  - Poisson
  - Weibull
  - Feel free to contribute!
- Generators
- Probabilities

##Usage:
``` swift
/// Uniform Randomness
let randomZeroToOneTopOpen = random() // [0, 1)
let randomZeroToOneOpen = random(exclusiveMin: 0, exclusiveMax: 1) // (0, 1)
let randomZeroToOneBottomOpen = random(exclusiveMin: 0, inclusiveMax: 1) // (0, 1]
let randomZeroToOneClosed: Double = random(0...1)

/// Probability
let coinFlip: Bool = random(probability: 0.5)

/// Generators
let uniformDistribution = UniformDistribution(range: -1...1)
let uniformGenerator = RandomGenerator(distribution: uniformDistribution)

/// Sampling
let samplingGenerator = SamplingGenerator(elements: ["red", "green", "blue"], uniformDistribution)
let image = samplingGenerator.sample(128, withReplacement: true)
```


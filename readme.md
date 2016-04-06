# Expectation

[![Build Status](https://travis-ci.org/ollieatkinson/Expectation.svg?branch=master)](https://travis-ci.org/ollieatkinson/Expectation)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/ollieatkinson/Expectation/master/LICENSE)
[![codecov.io](http://codecov.io/github/ollieatkinson/Expectation/coverage.svg?branch=development)](http://codecov.io/github/ollieatkinson/Expectation?branch=development)

A simple and elegant matcher framework built on top of XCTest for Swift.

## Introduction

There are alternatives to this framework, such as [Nimble](https://github.com/Quick/Nimble), however the code is complex and makes difficult work to write new matchers.

Expectation provides additional methods for an expectation using protocol extension pattern matching.

## Installation

_The latest build 0.0.3 is made for swift 2.2, if you require swift 2.1 please use version 0.0.2._

### CocoaPods

Integrate Expectation using a Podfile:

```ruby
use_frameworks!
pod 'Expectation'
```

### Carthage

Add the following to your Cartfile:

```ruby
github "ollieatkinson/Expectation"
```

## Syntax

Expectation provides easy to use syntax without the need to specify data types. It also is much more readable and does not suffer from parenthesitis.

```swift
expect("Mario").toNot.equal("Luigi")
```

## Built-in matchers

> `expect(x).to.equal(y)`
> passes if they are equal using the `==` operator.

> `expect(x).to.beIdenticalTo(y)`
> compares `x` and `y` and passes if they have the same memory address.

> `expect(x).to.beNil()`
> passes if `x` is `nil`.

> `expect(x).to.beTrue()`
> passes if `x` is `true`.

> `expect(x).to.beFalse()`
> passes if `x` is `false`.

> `expect(x).to.contain(y)`
> passes if array `x` contains `y`.

> `expect(x).to.haveCountOf(y)`
> passes if array `x` has `y` number of elements.

> `expect(x).to.beEmpty(y)`
> passes if array `x` has no elements.

> `expect(x).to.beDynamicType(y)`
> passes if `x` has dynamic type `y`. Can be used on `class` and `struct`.

> `expect(x).to.beKindOf(y)`
> passes if `x` is an instance of `y` (class, struct and protocol).

> `expect(x).to.beCloseTo(y, within: z)`
> passes if `x` is close to `y` within `z`.

> `expect(x).to.beLessThan(y)`
> passes if `x` is less than `y`.

> `expect(x).to.beLessThanOrEqualTo(y)` 
> passes if `x` is less than or equal to `y`.

> `expect(x).to.beGreaterThan(y)`
> passes if `x` is greater than `y`.

> `expect(x).to.beGreaterThanOrEqualTo(y)` 
> passes if `x` is greater than or equal to `y`.

> `expect(x).to.conformTo(y)`
> passes if `x` conforms to the NSProtocol `y`.

> `expect(x).to.respondTo(y)`
> passes if `x` responds to the method `y`.

> `expect(x).to.havePrefix(y)` 
> passes if String `x` begins with `y`.

> `expect(x).to.haveSuffix(y)` 
> passes if String `x` ends with `y`.

## Inverting Matchers

Every matcher's criteria can be inverted by prepending .notTo or .toNot:

> `expect(x).toNot.equal(y)` 
> compares `x` and `y` and passes if they are not equal.

## Forced Failing

You can fail a test by using the failure attribute. This can be used to test branching.

> `fail("This should not happen")` 
> fail a test.

## Writing your own matchers

Matchers are simple and easy to follow.

```swift
extension Expectation where T: Comparable {
  
  func beLessThan(other: T, _ description: String = "") {
    assertTrue(expect < other, self.description(#function, other, description))
  }

}
```

The pattern for the kinds of classes which the method is included on is defined by the matcher of the class extension. The example below is to match types which conform to the [Comparable Protocol](https://developer.apple.com/library/ios/documentation/Swift/Reference/Swift_Comparable_Protocol/index.html).

```swift
extension Expectation where T: Comparable
```

The function defined in here will only be valid for objects that conform to the matched pattern, in this case `Comparable`. 

- `other` is required for the method body to assert the truth.
- `description` is optional and only required if you wish to provide an additional description.

```
func beLessThan(other: T, _ description: String = "")
```

There are a few assertion methods to use

- `assertTrue`
- `assertFalse`
- `assertNil`
- `assertNotNil`
- `fail`

These should be used to validate the input for the function.

```swift
assertTrue(expect < other, self.description(#function, other, description))
```

The custom description should be passed in along with the function name and value.

## Future Improvements

- [ ] Asynchronous Matching
- [ ] do-try-catch matchers
- [ ] NSNotification matchers

...

[Create issues for feature requests](https://github.com/ollieatkinson/expectation/issues).

## Alternatives

- Nimble - [Quick/Nimble](https://github.com/Quick/Nimble/)
- SwiftHamcrest - [nschum/SwiftHamcrest](https://github.com/nschum/SwiftHamcrest)
- Expecta - [specta/Expecta](https://github.com/specta/expecta) (Objective-C)

## Contributing

1. Fork it ([https://github.com/ollieatkinson/expectation/fork](https://github.com/ollieatkinson/expectation/fork))
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

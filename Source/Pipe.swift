//
//  Pipe.swift
//
//  Created by Daniel Thorpe on 11/05/2015.
//

infix operator |> { precedence 50 associativity left }

/**
Pipe. e.g. x |> f is transformed into f(x). But it's chainable
so that x |> f |> g |> h is transformed into h(g(f(x)))
*/
public func |> <Input, Output>(left: Input, right: Input -> Output) -> Output {
    return right(left)
}

/// Curried version of map
public func map<S: SequenceType, T>(transform: (S.Generator.Element) -> T)(source: S) -> [T] {
    return map(source, transform)
}

/// Curried version of filter
public func filter<S: SequenceType>(includeElement: (S.Generator.Element) -> Bool)(source: S) -> [S.Generator.Element] {
    return filter(source, includeElement)
}

/// Curried version of reduce
public func reduce<S: SequenceType, U>(initial: U, combine: (U, S.Generator.Element) -> U)(source: S) -> U {
    return reduce(source, initial, combine)
}

/// Curried version of sorted
public func sorted<S: SequenceType>(isOrderedBefore: (S.Generator.Element, S.Generator.Element) -> Bool)(source: S) -> [S.Generator.Element] {
    return sorted(source, isOrderedBefore)
}


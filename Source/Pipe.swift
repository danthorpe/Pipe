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
public func |> <Input, Output>(lhs: Input, rhs: Input -> Output) -> Output {
    return rhs(lhs)
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

/// Curried version of find
public func find<C: CollectionType where C.Generator.Element: Equatable>(value: C.Generator.Element) -> (C) -> C.Index? {
    return { find($0, value) }
}

/// Curried version Array.append
public func append<T>(element: T) -> [T] -> [T] {
    return { (var array) in
        array.append(element)
        return array
    }
}

/// Curried version Array.insert:atIndex:
public func insert<T>(element: T, atIndex index: Int) -> [T] -> [T] {
    return { (var array) in
        array.insert(element, atIndex: index)
        return array
    }
}

/// Curried version Array.removeAtIndex:
public func removeAtIndex<T>(index: Int) -> [T] -> [T] {
    return { (var array) in
        array.removeAtIndex(index)
        return array
    }
}

/// Curried version of sum
public func sum<S: SequenceType where S.Generator.Element == UInt8>(source: S)   -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Int8>(source: S)    -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == UInt16>(source: S)  -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Int16>(source: S)   -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == UInt32>(source: S)  -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Int32>(source: S)   -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == UInt64>(source: S)  -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Int64>(source: S)   -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == UInt>(source: S)    -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Int>(source: S)     -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Float80>(source: S) -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Double>(source: S)  -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == Float>(source: S)   -> S.Generator.Element { return reduce(source, 0, +) }
public func sum<S: SequenceType where S.Generator.Element == CGFloat>(source: S) -> S.Generator.Element { return reduce(source, 0, +) }

//
//  PipeTests.swift
//  Pipe Dream
//
//  Created by Daniel Thorpe on 08/06/2015.
//  Copyright © 2015 Dan Thorpe. All rights reserved.
//

import UIKit
import XCTest
import Pipe


class PipeTests: XCTestCase {

    let numbers = [4, 8, 15, 16, 23, 42]

    func test_Pipe_map() {
        XCTAssertEqual(numbers |> map { $0 * 10 }, [40, 80, 150, 160, 230, 420])
    }

    func test_Pipe_filter_then_map() {
        let result = numbers
            |> filter { $0 % 2 != 0 }
            |> map { $0 * 10 }
        XCTAssertEqual(result, [150, 230])
    }

    func test_Pipe_map_then_filter() {
        let result = numbers
            |> map { $0 * 7 } // [28, 56, 105, 112, 161, 294]
            |> filter { $0 % 2 != 0 }
        XCTAssertEqual(result, [105, 161])
    }

    func test_Pipe_reduce() {
        XCTAssertEqual(numbers |> reduce(0, combine: +), 108)
    }

    func test_Pipe_sum_integers() {
        XCTAssertEqual(numbers |> sum, 108)
    }

    func test_Pipe_sum_doubles() {
        XCTAssertEqual(numbers |> map { Double($0) } |> sum, 108.0)
    }

    func test_Pipe_sum_floats() {
        XCTAssertEqual(numbers |> map { Float($0) } |> sum, 108.0)
    }

    func test_Pipe_sort_reverse() {
        XCTAssertEqual(numbers |> sorted(>), [42, 23, 16, 15, 8, 4])
    }

    func test_Pipe_sort_again() {
        XCTAssertEqual(numbers |> sorted(>) |> sorted(<), numbers)
    }

    func test_Pipe_custom_closure() {
        XCTAssertEqual(numbers |> { s in s.map { $0 * 10 } }, [40, 80, 150, 160, 230, 420])
    }

    func test_Pipe_find_a_number() {
        let result = numbers |> find(15)
        XCTAssertTrue(result == 2)
    }

    func test_Pipe_find_return_none() {
        let result = numbers |> find(666)
        XCTAssertTrue(result == nil)
    }

    func test_Pipe_array_remove_insert() {
        let result = numbers
            |> removeAtIndex(0)
            |> insert(6, atIndex: 0)
        XCTAssertEqual(result[0], 6)
    }
}



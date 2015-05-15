//
//  PipeSpec.swift
//
//  Created by Daniel Thorpe on 11/05/2015.
//

import UIKit
import XCTest
import Quick
import Nimble
import Pipe

class PipeSpecs: QuickSpec {
    override func spec() {
        describe("Pipe") {
            let numbers = [4, 8, 15, 16, 23, 42]

            describe("map") {
                it("should be 10x") {
                    let result = numbers
                        |> map { $0 * 10 }
                    expect(result).to(equal([40, 80, 150, 160, 230, 420]))
                }
            }

            describe("filter then map") {
                it("should have only two odd numbers") {
                    let result = numbers
                        |> filter { $0 % 2 != 0 }
                        |> map { $0 * 10 }
                    expect(result).to(equal([150, 230]))
                }
            }

            describe("reduce") {
                it("should sum") {
                    let result = numbers
                        |> reduce(0, +)
                    expect(result).to(equal(108))
                }
            }

            describe("sort") {
                it("should reverse") {
                    let result = numbers
                        |> sorted(>)
                    expect(result).to(equal([42, 23, 16, 15, 8, 4]))
                }

                it("sorting again") {
                    let result = numbers
                        |> sorted(>)
                        |> sorted(<)
                    expect(result).to(equal(numbers))
                }
            }

            describe("custom closure") {
                it("should be 10x") {
                    let result = numbers
                        |> { s in map(s) { $0 * 10 } }
                    expect(result).to(equal([40, 80, 150, 160, 230, 420]))
                }
            }

        }
    }
}
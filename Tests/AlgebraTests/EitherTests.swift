import XCTest
@testable import Algebra

final class EitherTests: XCTestCase {
    func testLeft() {
        // given
        let value = "left-value"
        // when
        let either: Either<String, String> = .left(value)
        // then
        XCTAssertTrue(either.isLeft)
        XCTAssertEqual(value, either.left)
    }

    func testRight() {
        // given
        let value = "right-value"
        // when
        let either: Either<String, String> = .right(value)
        // then
        XCTAssertTrue(either.isRight)
        XCTAssertEqual(value, either.right)
    }

    func testSwap() {
        // given
        let value = "value"
        // when
        let swappedToRight: Either<Void, String> = Either<String, Void>
            .left(value)
            .swap()
        // then
        XCTAssertEqual(value, swappedToRight.right)
        // and when
        let reSwappedToLeft = swappedToRight.swap()
        // then
        XCTAssertEqual(value, reSwappedToLeft.left)
    }

    func testFoldOnLeft() {
        // given
        let value = "value"
        // when
        let foldedLeft = Either<String, String>
            .left(value)
            .fold({ $0 }, { $0 })
        // then
        XCTAssertEqual(value, foldedLeft)
    }

    func testFoldOnRight() {
        // given
        let value = "value"
        // when
        let foldedRight = Either<String, String>
            .right(value)
            .fold({ $0 }, { $0 })
        // then
        XCTAssertEqual(value, foldedRight)
    }

    func testFoldOnLeftByKeyPath() {
        // given
        let value = "value"
        // when
        let foldedLeft = Either<String, String>
            .left(value)
            .fold(\.self, \.self)
        // then
        XCTAssertEqual(value, foldedLeft)
    }

    func testFoldOnRightByKeyPath() {
        // given
        let value = "value"
        // when
        let foldedRight = Either<String, String>
            .right(value)
            .fold(\.self, \.self)
        // then
        XCTAssertEqual(value, foldedRight)
    }
}

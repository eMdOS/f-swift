/// Represents a value of one of 2 possible types (a disjoint union.)
/// An type of `Either` is either an value of `Left` or `Right`.
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)

    /// Returns `true` if this is a `Left`, `false` otherwise.
    public var isLeft: Bool {
        left != nil
    }

    /// Projects this `Either` as a `Left?`.
    public var left: Left? {
        if case let .left(value) = self {
            return value
        }
        return nil
    }

    /// Returns `true` if this is a `Right`, `false` otherwise.
    public var isRight: Bool {
        right != nil
    }

    /// Projects this `Either` as a `Right?`.
    public var right: Right? {
        if case let .right(value) = self {
            return value
        }
        return nil
    }

    /// If this is a `Left`, then return the left value in `Right` or vice versa.
    /// - Returns: A new `Either` by swapping the value types.
    public func swap() -> Either<Right, Left> {
        switch self {
        case .left(let value): return .right(value)
        case .right(let value): return .left(value)
        }
    }
}

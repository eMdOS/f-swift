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

    /// Evaluates the given closures based on the side set, passing the `left|right` value as a parameter.
    /// - Parameters:
    ///   - onLeft: A closure that takes the **left** value of the instance.
    ///   - onRight: A closure that takes the **right** value of the instance.
    /// - Returns: The result of the given closure whether is **left** or **right**.
    public func fold<Value>(_ onLeft: (Left) -> Value, _ onRight: (Right) -> Value) -> Value {
        switch self {
        case .left(let left):
            return onLeft(left)
        case .right(let right):
            return onRight(right)
        }
    }

    /// Evaluates the given key-paths based on the side set, passing the `left|right` value as a parameter.
    /// - Parameters:
    ///   - onLeftKeyPath: A key-path that zooms-in into the left instance - if any.
    ///   - onRightKeyPath: A key-path that zooms-in into the right instance - if any.
    /// - Returns: The value of the key-path whether is **left** or **right**.
    public func fold<SubValue>(_ onLeftKeyPath: KeyPath<Left, SubValue>, _ onRightKeyPath: KeyPath<Right, SubValue>) -> SubValue {
        switch self {
        case .left(let left):
            return left[keyPath: onLeftKeyPath]
        case .right(let right):
            return right[keyPath: onRightKeyPath]
        }
    }
}

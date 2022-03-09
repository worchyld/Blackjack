//
//  Ext+Optional.swift
//  Blackjack
//
//  Created by Amarjit on 09/03/2022.
//

import Foundation

public extension Optional {
  /// Represents that an `Optional` was `nil`.
  enum UnwrapError: Error {
    case `nil`
    case typeMismatch
  }

  /// [An alterative to overloading `??` to throw errors upon `nil`.](
  /// https://forums.swift.org/t/unwrap-or-throw-make-the-safe-choice-easier/14453/7)
  /// - Note: Useful for emulating `break`, with `map`, `forEach`, etc.
  /// - Throws: `UnwrapError` when `nil`.
  var unwrapped: Wrapped {
    get throws {
      switch self {
      case let wrapped?:
        return wrapped
      case nil:
        throw UnwrapError.nil
      }
    }
  }
}

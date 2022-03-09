//
//  Ext+CaseIterable.swift
//  Blackjack
//
//  Created by Amarjit on 09/03/2022.
//

import Foundation

public extension CaseIterable where Self: Equatable {
  /// The first match for this case in `allCases`.
  /// - Throws: `AllCasesError<Self>.noIndex`
  var caseIndex: AllCases.Index {
    get throws {
      do { return try Self.allCases.firstIndex(of: self).unwrapped }
      catch { throw AllCasesError.noIndex(self) }
    }
  }
}

public enum AllCasesError<Case: CaseIterable>: Error {
  /// No `AllCases.Index` corresponds to this case.
  case noIndex(Case)
}

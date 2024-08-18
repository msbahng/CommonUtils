//
//  Future+Extension.swift
//  
//
//  Created by Mooseok Bahng on 2023/07/06.
//

import Foundation
import Combine

//extension Future where Failure == Error, Output: Sendable {
//    convenience init(asyncFunc: @escaping @Sendable () async throws -> Output) {
//        self.init { promise in
//            Task {
//                do {
//                    let result = try await asyncFunc()
//                    promise(.success(result))
//                } catch {
//                    promise(.failure(error))
//                }
//            }
//        }
//    }
//}
//
//extension Future where Failure == Never, Output: Sendable {
//    convenience init(asyncFunc: @escaping @Sendable () async -> Output) {
//        self.init { promise in
//            Task {
//                let result = await asyncFunc()
//                promise(.success(result))
//            }
//        }
//    }
//}

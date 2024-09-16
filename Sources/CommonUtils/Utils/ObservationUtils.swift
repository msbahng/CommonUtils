//
//  ObservationUtils.swift
//
//
//  Created by 方 茂碩（Mooseok Bahng） on 2023/12/01.
//

import Foundation

public func continuousObservationTracking<T>(
    _ apply: @escaping (@Sendable () -> T),
    onChange: @escaping (@Sendable () -> Void)
) {
    _ = withObservationTracking(apply, onChange: {
        onChange()
        continuousObservationTracking(apply, onChange: onChange)
    })
}

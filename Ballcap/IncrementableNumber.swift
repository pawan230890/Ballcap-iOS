//
//  Incremental.swift
//  Ballcap
//
//  Created by 1amageek on 2019/04/02.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum Incremental: Codable {
    case increment(Double)
    case value(Double)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Double.self)
        self = .value(value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch (self) {
        case .increment(let value):
            try container.encode(FieldValue.increment(value))
            break
        case .value(let value):
            try container.encode(value)
            break
        }
    }
}

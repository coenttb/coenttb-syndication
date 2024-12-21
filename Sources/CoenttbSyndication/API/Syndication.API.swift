//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/12/2024.
//

import Dependencies
import Foundation
import Languages
import URLRouting
import MacroCodableKit

public enum API: Equatable, Sendable {
    case image(String)
}
extension CoenttbSyndication.API {
    public struct Router: ParserPrinter, Sendable {
        
        public init(){}
        
        public var body: some URLRouting.Router<CoenttbSyndication.API> {
            OneOf {
                URLRouting.Route(.case(CoenttbSyndication.API.image)) {
                    Path {
                        "image"
                        Parse(.string)
                    }
                }
            }
        }
    }
}

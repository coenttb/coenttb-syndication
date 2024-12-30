//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/12/2024.
//

import Coenttb_Web

public enum API: Equatable, Sendable {
    case image(String)
}
extension Coenttb_Syndication.API {
    public struct Router: ParserPrinter, Sendable {
        
        public init(){}
        
        public var body: some URLRouting.Router<Coenttb_Syndication.API> {
            OneOf {
                URLRouting.Route(.case(Coenttb_Syndication.API.image)) {
                    Path {
                        "image"
                        Parse(.string)
                    }
                }
            }
        }
    }
}

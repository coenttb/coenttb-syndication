//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/12/2024.
//

import Coenttb_Syndication
import Coenttb_Vapor
import Foundation

extension RSS.Feed {
    public struct Response {
        let feed: RSS.Feed

        public init(feed: RSS.Feed) {
            self.feed = feed
        }
    }
}

extension RSS.Feed.Response: AsyncResponseEncodable {
    public func encodeResponse(for request: Vapor.Request) async throws -> Vapor.Response {
        Vapor.Response(
            status: .ok,
            headers: ["Content-Type": "application/rss+xml; charset=utf-8"],
            body: .init(string: RSS.Feed.XML(feed: feed).description)
        )
    }
}

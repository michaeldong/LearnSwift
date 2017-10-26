//
//  MJYPData.swift
//
//  Created by michaelxing on 2017/10/26
//  Copyright (c) xiaomi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MJYPData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let shareUrl = "share_url"
    static let ctime = "ctime"
    static let favor = "favor"
    static let articleId = "article_id"
    static let subtitle = "subtitle"
    static let like = "like"
    static let from = "from"
    static let hit = "hit"
    static let title = "title"
    static let displayMode = "display_mode"
    static let picUrl = "pic_url"
    static let picUrls = "pic_urls"
    static let url = "url"
  }

  // MARK: Properties
  public var shareUrl: String?
  public var ctime: Int?
  public var favor: Int?
  public var articleId: Int?
  public var subtitle: String?
  public var like: Int?
  public var from: String?
  public var hit: Int?
  public var title: String?
  public var displayMode: Int?
  public var picUrl: String?
  public var picUrls: [String]?
  public var url: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
    public mutating func mapping(map: Map) {
    shareUrl <- map[SerializationKeys.shareUrl]
    ctime <- map[SerializationKeys.ctime]
    favor <- map[SerializationKeys.favor]
    articleId <- map[SerializationKeys.articleId]
    subtitle <- map[SerializationKeys.subtitle]
    like <- map[SerializationKeys.like]
    from <- map[SerializationKeys.from]
    hit <- map[SerializationKeys.hit]
    title <- map[SerializationKeys.title]
    displayMode <- map[SerializationKeys.displayMode]
    picUrl <- map[SerializationKeys.picUrl]
    picUrls <- map[SerializationKeys.picUrls]
    url <- map[SerializationKeys.url]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = ctime { dictionary[SerializationKeys.ctime] = value }
    if let value = favor { dictionary[SerializationKeys.favor] = value }
    if let value = articleId { dictionary[SerializationKeys.articleId] = value }
    if let value = subtitle { dictionary[SerializationKeys.subtitle] = value }
    if let value = like { dictionary[SerializationKeys.like] = value }
    if let value = from { dictionary[SerializationKeys.from] = value }
    if let value = hit { dictionary[SerializationKeys.hit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = displayMode { dictionary[SerializationKeys.displayMode] = value }
    if let value = picUrl { dictionary[SerializationKeys.picUrl] = value }
    if let value = picUrls { dictionary[SerializationKeys.picUrls] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

}

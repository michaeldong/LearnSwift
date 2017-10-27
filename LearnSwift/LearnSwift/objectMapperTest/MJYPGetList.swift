//
//  MJYPGetList.swift
//
//  Created by michaelxing on 2017/10/26
//  Copyright (c) xiaomi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MJYPGetList: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let shopdata = "data"
    static let message = "message"
    static let code = "code"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var shopdata: MJYPDatas?
  public var message: String?
  public var code: Int?

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
    descriptionValue <- map[SerializationKeys.descriptionValue]
    shopdata <- map[SerializationKeys.shopdata]
    message <- map[SerializationKeys.message]
    code <- map[SerializationKeys.code]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = shopdata { dictionary[SerializationKeys.shopdata] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    return dictionary
  }

}

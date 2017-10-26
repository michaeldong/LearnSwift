//
//  MJYPMappable.swift
//
//  Created by michaelxing on 2017/10/26
//  Copyright (c) xiaomi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MJYPMappable: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let message = "message"
    static let timestamp = "timestamp"
    static let code = "code"
    static let result = "result"
  }

  // MARK: Properties
  public var message: String?
  public var timestamp: Int?
  public var code: Int?
  public var result: MJYPResult?

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
    message <- map[SerializationKeys.message]
    timestamp <- map[SerializationKeys.timestamp]
    code <- map[SerializationKeys.code]
    result <- map[SerializationKeys.result]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = result { dictionary[SerializationKeys.result] = value.dictionaryRepresentation() }
    return dictionary
  }

}

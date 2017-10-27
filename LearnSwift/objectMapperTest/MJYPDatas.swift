//
//  MJYPShopdata.swift
//
//  Created by michaelxing on 2017/10/26
//  Copyright (c) xiaomi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MJYPDatas: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let top = "top"
    static let data = "data"
  }

  // MARK: Properties
  public var top: MJYPTop?
  public var data: [MJYPData]?

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
    top <- map[SerializationKeys.top]
    data <- map[SerializationKeys.data]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = top { dictionary[SerializationKeys.top] = value.dictionaryRepresentation() }
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}

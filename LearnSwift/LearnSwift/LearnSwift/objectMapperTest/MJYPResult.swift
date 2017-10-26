//
//  MJYPResult.swift
//
//  Created by michaelxing on 2017/10/26
//  Copyright (c) xiaomi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MJYPResult: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let getList = "GetList"
  }

  // MARK: Properties
  public var getList: MJYPGetList?

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
    getList <- map[SerializationKeys.getList]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = getList { dictionary[SerializationKeys.getList] = value.dictionaryRepresentation() }
    return dictionary
  }

}

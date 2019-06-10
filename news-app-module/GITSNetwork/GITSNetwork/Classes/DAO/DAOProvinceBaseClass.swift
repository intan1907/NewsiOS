//
//  DAOProvinceBaseClass.swift
//
//  Created by Tri Rejeki on 29/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOProvinceBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let code = "code"
    static let data = "data"
    static let message = "message"
  }

  // MARK: Properties
  public var code: Int?
  public var data: DAOProvinceData?
  public var message: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    code = json[SerializationKeys.code].int
    data = DAOProvinceData(json: json[SerializationKeys.data])
    message = json[SerializationKeys.message].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
    self.data = aDecoder.decodeObject(forKey: SerializationKeys.data) as? DAOProvinceData
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(data, forKey: SerializationKeys.data)
    aCoder.encode(message, forKey: SerializationKeys.message)
  }

}

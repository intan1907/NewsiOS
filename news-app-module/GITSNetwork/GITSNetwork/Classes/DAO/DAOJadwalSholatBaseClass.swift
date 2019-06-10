//
//  DAOJadwalSholatBaseClass.swift
//
//  Created by Tri Rejeki on 27/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOJadwalSholatBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let result = "data"
    static let code = "code"
    static let message = "message"
  }

  // MARK: Properties
  public var result: [DAOJadwalSholatResult]?
  public var code: Int?
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
    if let items = json[SerializationKeys.result].array { result = items.map { DAOJadwalSholatResult(json: $0) } }
    code = json[SerializationKeys.code].int
    message = json[SerializationKeys.message].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = result { dictionary[SerializationKeys.result] = value.map { $0.dictionaryRepresentation() } }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.result = aDecoder.decodeObject(forKey: SerializationKeys.result) as? [DAOJadwalSholatResult]
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(result, forKey: SerializationKeys.result)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(message, forKey: SerializationKeys.message)
  }

}

//
//  DAOProvinceData.swift
//
//  Created by Tri Rejeki on 29/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOProvinceData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "content"
    static let pagination = "pagination"
  }

  // MARK: Properties
  public var content: [DAOProvinceContent]?
  public var pagination: DAOProvincePagination?

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
    if let items = json[SerializationKeys.content].array { content = items.map { DAOProvinceContent(json: $0) } }
    pagination = DAOProvincePagination(json: json[SerializationKeys.pagination])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.map { $0.dictionaryRepresentation() } }
    if let value = pagination { dictionary[SerializationKeys.pagination] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? [DAOProvinceContent]
    self.pagination = aDecoder.decodeObject(forKey: SerializationKeys.pagination) as? DAOProvincePagination
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(pagination, forKey: SerializationKeys.pagination)
  }

}

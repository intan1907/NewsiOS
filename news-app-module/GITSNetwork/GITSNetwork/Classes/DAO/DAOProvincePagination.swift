//
//  DAOProvincePagination.swift
//
//  Created by Tri Rejeki on 29/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOProvincePagination: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let page = "page"
    static let limit = "limit"
    static let lastPage = "last_page"
  }

  // MARK: Properties
  public var total: Int?
  public var page: Int?
  public var limit: Int?
  public var lastPage: Int?

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
    total = json[SerializationKeys.total].int
    page = json[SerializationKeys.page].int
    limit = json[SerializationKeys.limit].int
    lastPage = json[SerializationKeys.lastPage].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = page { dictionary[SerializationKeys.page] = value }
    if let value = limit { dictionary[SerializationKeys.limit] = value }
    if let value = lastPage { dictionary[SerializationKeys.lastPage] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.page = aDecoder.decodeObject(forKey: SerializationKeys.page) as? Int
    self.limit = aDecoder.decodeObject(forKey: SerializationKeys.limit) as? Int
    self.lastPage = aDecoder.decodeObject(forKey: SerializationKeys.lastPage) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(page, forKey: SerializationKeys.page)
    aCoder.encode(limit, forKey: SerializationKeys.limit)
    aCoder.encode(lastPage, forKey: SerializationKeys.lastPage)
  }

}

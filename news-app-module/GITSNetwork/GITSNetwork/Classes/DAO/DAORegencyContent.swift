//
//  DAORegencyContent.swift
//
//  Created by Tri Rejeki on 29/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAORegencyContent: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let lng = "lng"
    static let id = "id"
    static let placeId = "place_id"
    static let kabupaten = "kabupaten"
    static let formattedAddress = "formatted_address"
    static let x = "x"
    static let provinceId = "province_id"
    static let lat = "lat"
    static let y = "y"
    static let provinsi = "provinsi"
  }

  // MARK: Properties
  public var lng: Float?
  public var id: Int?
  public var placeId: String?
  public var kabupaten: String?
  public var formattedAddress: String?
  public var x: String?
  public var provinceId: Int?
  public var lat: Float?
  public var y: String?
  public var provinsi: String?

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
    lng = json[SerializationKeys.lng].float
    id = json[SerializationKeys.id].int
    placeId = json[SerializationKeys.placeId].string
    kabupaten = json[SerializationKeys.kabupaten].string
    formattedAddress = json[SerializationKeys.formattedAddress].string
    x = json[SerializationKeys.x].string
    provinceId = json[SerializationKeys.provinceId].int
    lat = json[SerializationKeys.lat].float
    y = json[SerializationKeys.y].string
    provinsi = json[SerializationKeys.provinsi].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = lng { dictionary[SerializationKeys.lng] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = placeId { dictionary[SerializationKeys.placeId] = value }
    if let value = kabupaten { dictionary[SerializationKeys.kabupaten] = value }
    if let value = formattedAddress { dictionary[SerializationKeys.formattedAddress] = value }
    if let value = x { dictionary[SerializationKeys.x] = value }
    if let value = provinceId { dictionary[SerializationKeys.provinceId] = value }
    if let value = lat { dictionary[SerializationKeys.lat] = value }
    if let value = y { dictionary[SerializationKeys.y] = value }
    if let value = provinsi { dictionary[SerializationKeys.provinsi] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.lng = aDecoder.decodeObject(forKey: SerializationKeys.lng) as? Float
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.placeId = aDecoder.decodeObject(forKey: SerializationKeys.placeId) as? String
    self.kabupaten = aDecoder.decodeObject(forKey: SerializationKeys.kabupaten) as? String
    self.formattedAddress = aDecoder.decodeObject(forKey: SerializationKeys.formattedAddress) as? String
    self.x = aDecoder.decodeObject(forKey: SerializationKeys.x) as? String
    self.provinceId = aDecoder.decodeObject(forKey: SerializationKeys.provinceId) as? Int
    self.lat = aDecoder.decodeObject(forKey: SerializationKeys.lat) as? Float
    self.y = aDecoder.decodeObject(forKey: SerializationKeys.y) as? String
    self.provinsi = aDecoder.decodeObject(forKey: SerializationKeys.provinsi) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(lng, forKey: SerializationKeys.lng)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(placeId, forKey: SerializationKeys.placeId)
    aCoder.encode(kabupaten, forKey: SerializationKeys.kabupaten)
    aCoder.encode(formattedAddress, forKey: SerializationKeys.formattedAddress)
    aCoder.encode(x, forKey: SerializationKeys.x)
    aCoder.encode(provinceId, forKey: SerializationKeys.provinceId)
    aCoder.encode(lat, forKey: SerializationKeys.lat)
    aCoder.encode(y, forKey: SerializationKeys.y)
    aCoder.encode(provinsi, forKey: SerializationKeys.provinsi)
  }

}

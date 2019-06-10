//
//  DAOJadwalSholatResult.swift
//
//  Created by Tri Rejeki on 27/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOJadwalSholatResult: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let maghrib = "maghrib"
    static let imsak = "imsak"
    static let id = "id"
    static let ashar = "ashar"
    static let placeId = "place_id"
    static let dzuhur = "dzuhur"
    static let dhuha = "dhuha"
    static let subuh = "subuh"
    static let isya = "isya"
    static let terbit = "terbit"
    static let tanggal = "tanggal"
  }

  // MARK: Properties
  public var maghrib: String?
  public var imsak: String?
  public var id: Int?
  public var ashar: String?
  public var placeId: String?
  public var dzuhur: String?
  public var dhuha: String?
  public var subuh: String?
  public var isya: String?
  public var terbit: String?
  public var tanggal: String?

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
    maghrib = json[SerializationKeys.maghrib].string
    imsak = json[SerializationKeys.imsak].string
    id = json[SerializationKeys.id].int
    ashar = json[SerializationKeys.ashar].string
    placeId = json[SerializationKeys.placeId].string
    dzuhur = json[SerializationKeys.dzuhur].string
    dhuha = json[SerializationKeys.dhuha].string
    subuh = json[SerializationKeys.subuh].string
    isya = json[SerializationKeys.isya].string
    terbit = json[SerializationKeys.terbit].string
    tanggal = json[SerializationKeys.tanggal].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = maghrib { dictionary[SerializationKeys.maghrib] = value }
    if let value = imsak { dictionary[SerializationKeys.imsak] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = ashar { dictionary[SerializationKeys.ashar] = value }
    if let value = placeId { dictionary[SerializationKeys.placeId] = value }
    if let value = dzuhur { dictionary[SerializationKeys.dzuhur] = value }
    if let value = dhuha { dictionary[SerializationKeys.dhuha] = value }
    if let value = subuh { dictionary[SerializationKeys.subuh] = value }
    if let value = isya { dictionary[SerializationKeys.isya] = value }
    if let value = terbit { dictionary[SerializationKeys.terbit] = value }
    if let value = tanggal { dictionary[SerializationKeys.tanggal] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.maghrib = aDecoder.decodeObject(forKey: SerializationKeys.maghrib) as? String
    self.imsak = aDecoder.decodeObject(forKey: SerializationKeys.imsak) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.ashar = aDecoder.decodeObject(forKey: SerializationKeys.ashar) as? String
    self.placeId = aDecoder.decodeObject(forKey: SerializationKeys.placeId) as? String
    self.dzuhur = aDecoder.decodeObject(forKey: SerializationKeys.dzuhur) as? String
    self.dhuha = aDecoder.decodeObject(forKey: SerializationKeys.dhuha) as? String
    self.subuh = aDecoder.decodeObject(forKey: SerializationKeys.subuh) as? String
    self.isya = aDecoder.decodeObject(forKey: SerializationKeys.isya) as? String
    self.terbit = aDecoder.decodeObject(forKey: SerializationKeys.terbit) as? String
    self.tanggal = aDecoder.decodeObject(forKey: SerializationKeys.tanggal) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(maghrib, forKey: SerializationKeys.maghrib)
    aCoder.encode(imsak, forKey: SerializationKeys.imsak)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(ashar, forKey: SerializationKeys.ashar)
    aCoder.encode(placeId, forKey: SerializationKeys.placeId)
    aCoder.encode(dzuhur, forKey: SerializationKeys.dzuhur)
    aCoder.encode(dhuha, forKey: SerializationKeys.dhuha)
    aCoder.encode(subuh, forKey: SerializationKeys.subuh)
    aCoder.encode(isya, forKey: SerializationKeys.isya)
    aCoder.encode(terbit, forKey: SerializationKeys.terbit)
    aCoder.encode(tanggal, forKey: SerializationKeys.tanggal)
  }

}

import Foundation

struct MediaData: Codable {
	let mediaType: String?
	let entryId: String?
	let entryStatus: String?
	let thumbnailUrl: String?

	enum CodingKeys: String, CodingKey {
		case mediaType = "mediaType"
		case entryId = "entryId"
		case entryStatus = "entryStatus"
		case thumbnailUrl = "thumbnailUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
		entryId = try values.decodeIfPresent(String.self, forKey: .entryId)
		entryStatus = try values.decodeIfPresent(String.self, forKey: .entryStatus)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
	}
}

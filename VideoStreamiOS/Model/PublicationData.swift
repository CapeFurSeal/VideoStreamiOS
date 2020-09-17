import Foundation

struct PublicationData : Codable {
	let createdAt: String?
	let updatedAt: String?
	let released: Bool?
	let releaseFrom: String?
	let releaseTo: String?

	enum CodingKeys: String, CodingKey {
		case createdAt = "createdAt"
		case updatedAt = "updatedAt"
		case released = "released"
		case releaseFrom = "releaseFrom"
		case releaseTo = "releaseTo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		released = try values.decodeIfPresent(Bool.self, forKey: .released)
		releaseFrom = try values.decodeIfPresent(String.self, forKey: .releaseFrom)
		releaseTo = try values.decodeIfPresent(String.self, forKey: .releaseTo)
	}
}

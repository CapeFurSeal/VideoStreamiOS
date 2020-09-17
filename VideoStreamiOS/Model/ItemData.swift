import Foundation

struct ItemData: Codable, Identifiable {
	let id: String?
	let mediaData: MediaData?
	let metaData: MetaData?
	let publicationData: PublicationData?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case mediaData = "mediaData"
		case metaData = "metaData"
		case publicationData = "publicationData"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		mediaData = try values.decodeIfPresent(MediaData.self, forKey: .mediaData)
		metaData = try values.decodeIfPresent(MetaData.self, forKey: .metaData)
		publicationData = try values.decodeIfPresent(PublicationData.self, forKey: .publicationData)
	}
}

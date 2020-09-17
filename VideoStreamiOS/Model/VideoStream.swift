import Foundation

struct VideoStream: Codable {
	let feedMetaData: FeedMetaData?
	let sections: [Sections]?

	enum CodingKeys: String, CodingKey {
		case feedMetaData = "feedMetaData"
		case sections = "sections"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		feedMetaData = try values.decodeIfPresent(FeedMetaData.self, forKey: .feedMetaData)
		sections = try values.decodeIfPresent([Sections].self, forKey: .sections)
	}
}

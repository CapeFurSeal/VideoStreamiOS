import Foundation

struct FeedMetaData : Codable, Identifiable {
	let id: String?
	let name: String?
	let title: String?
	let description: String?
	let target: String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case title = "title"
		case description = "description"
		case target = "target"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		target = try values.decodeIfPresent(String.self, forKey: .target)
	}
}

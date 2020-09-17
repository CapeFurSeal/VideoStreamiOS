import Foundation

struct MetaData: Codable {
	let body: String?
	let coreCategories: [String]?
	let teams: [String]?
	let tvShowCategories: [String]?
	let sysEntryEntitlements: [String]?
	let videoDuration: Int?
	let people: [String]?
	let title: String?
	let contentTags: [String]?
	let tags: [String]?

	enum CodingKeys: String, CodingKey {

		case body = "body"
		case coreCategories = "corecategories"
		case teams = "teams"
		case tvShowCategories = "tvshowcategories"
		case sysEntryEntitlements = "SysEntryEntitlements"
		case videoDuration = "VideoDuration"
		case people = "people"
		case title = "title"
		case contentTags = "contenttags"
		case tags = "tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		coreCategories = try values.decodeIfPresent([String].self, forKey: .coreCategories)
		teams = try values.decodeIfPresent([String].self, forKey: .teams)
		tvShowCategories = try values.decodeIfPresent([String].self, forKey: .tvShowCategories)
		sysEntryEntitlements = try values.decodeIfPresent([String].self, forKey: .sysEntryEntitlements)
		videoDuration = try values.decodeIfPresent(Int.self, forKey: .videoDuration)
		people = try values.decodeIfPresent([String].self, forKey: .people)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		contentTags = try values.decodeIfPresent([String].self, forKey: .contentTags)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
	}

}

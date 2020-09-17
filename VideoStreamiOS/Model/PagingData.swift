import Foundation

struct PagingData: Codable {
	let totalCount: Int?
	let itemCount: Int?
	let pageCount: Int?
	let pageSize: Int?
	let pageIndex: Int?

	enum CodingKeys: String, CodingKey {
		case totalCount = "totalCount"
		case itemCount = "itemCount"
		case pageCount = "pageCount"
		case pageSize = "pageSize"
		case pageIndex = "pageIndex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
		itemCount = try values.decodeIfPresent(Int.self, forKey: .itemCount)
		pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
		pageSize = try values.decodeIfPresent(Int.self, forKey: .pageSize)
		pageIndex = try values.decodeIfPresent(Int.self, forKey: .pageIndex)
	}
}

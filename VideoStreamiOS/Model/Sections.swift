import Foundation

struct Sections : Codable, Identifiable {
	let id: String?
	let name: String?
	let itemData: [ItemData]?
	let pagingData: PagingData?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case itemData = "itemData"
		case pagingData = "pagingData"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		itemData = try values.decodeIfPresent([ItemData].self, forKey: .itemData)
		pagingData = try values.decodeIfPresent(PagingData.self, forKey: .pagingData)
	}
}

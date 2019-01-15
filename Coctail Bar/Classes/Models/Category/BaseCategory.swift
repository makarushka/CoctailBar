
import Foundation
struct BaseCategory: Codable {
	let drinks : [DrinkCategory]?

	enum CodingKeys: String, CodingKey {

		case drinks = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		drinks = try values.decodeIfPresent([DrinkCategory].self, forKey: .drinks)
	}

}

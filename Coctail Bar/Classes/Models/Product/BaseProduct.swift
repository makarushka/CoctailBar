
import Foundation
struct BaseProduct : Codable {
	var drinks : [Drink]?

	enum CodingKeys: String, CodingKey {

		case drinks = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		drinks = try values.decodeIfPresent([Drink].self, forKey: .drinks)
	}

}

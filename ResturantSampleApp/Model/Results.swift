/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Results : Mappable {
	var geometry : Geometry?
	var icon : String?
	var id : String?
	var name : String?
	var opening_hours : Opening_hours?
	var photos : [Photos]?
	var place_id : String?
	var plus_code : Plus_code?
	var price_level : Int?
	var rating : Double?
	var reference : String?
	var scope : String?
	var types : [String]?
	var user_ratings_total : Int?
	var vicinity : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		geometry <- map["geometry"]
		icon <- map["icon"]
		id <- map["id"]
		name <- map["name"]
		opening_hours <- map["opening_hours"]
		photos <- map["photos"]
		place_id <- map["place_id"]
		plus_code <- map["plus_code"]
		price_level <- map["price_level"]
		rating <- map["rating"]
		reference <- map["reference"]
		scope <- map["scope"]
		types <- map["types"]
		user_ratings_total <- map["user_ratings_total"]
		vicinity <- map["vicinity"]
	}

}
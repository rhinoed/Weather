////
////  WeatherResponse.swift
////  Weather
////
////  Created by Mark Edmunds on 11/7/24.
////
//
//
//struct WeatherResponse: Codable {
//	let coord: Coordinates
//	let weather: [WeatherData]
//	let base: String
//	let main: Main
//	let visibility: Int
//	let wind: Wind
//	let clouds: Clouds
//	let dt: Int
//	let sys: Sys
//	let timezone: Int
//	let id: Int
//	let name: String
//	let cod: Int
//}
//
//// Coordinates model
//struct Coordinates: Codable {
//	let lon: Double
//	let lat: Double
//}
//
//// Weather model (within an array)
//struct WeatherData: Codable {
//	let id: Int
//	let main: String
//	let description: String
//	let icon: String
//}
//
//// Main weather conditions model
//struct Main: Codable {
//	let temp: Double
//	let feelsLike: Double
//	let tempMin: Double
//	let tempMax: Double
//	let pressure: Int
//	let humidity: Int
//	let seaLevel: Int?
//	let grndLevel: Int?
//
//	enum CodingKeys: String, CodingKey {
//		case temp
//		case feelsLike = "feels_like"
//		case tempMin = "temp_min"
//		case tempMax = "temp_max"
//		case pressure
//		case humidity
//		case seaLevel = "sea_level"
//		case grndLevel = "grnd_level"
//	}
//}
//
//// Wind conditions model
//struct Wind: Codable {
//	let speed: Double
//	let deg: Int
//	let gust: Double?
//}
//
//// Cloud conditions model
//struct Clouds: Codable {
//	let all: Int
//}
//
//// System information model
//struct Sys: Codable {
//	let type: Int?
//	let id: Int?
//	let country: String
//	let sunrise: Int
//	let sunset: Int
//}

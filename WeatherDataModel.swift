//
//  WeatherDataModel.swift
//  Weather
//
//  Created by Mark Edmunds on 11/7/24.
//

import Foundation

// Top-level response model
struct WeatherResponse: Codable {
	let coord: Coordinates
	let weather: [WeatherData]
	let base: String
	let main: MainConditions
	let visibility: Int
	let wind: Wind
	let clouds: Clouds
	let dt: Int
	let sys: Sys
	let timezone: Int
	let id: Int
	let name: String
	let cod: Int
}

// Coordinates model
struct Coordinates: Codable {
	let lon: Double
	let lat: Double
}

// Weather model (within an array)
struct WeatherData: Codable {
	let id: Int
	let main: String
	let description: String
	let icon: String
}

// Main weather conditions model
struct MainConditions: Codable {
	let temp: Double
	let feelsLike: Double
	let tempMin: Double
	let tempMax: Double
	let pressure: Int
	let humidity: Int
	let seaLevel: Int?
	let grndLevel: Int?

	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure
		case humidity
		case seaLevel = "sea_level"
		case grndLevel = "grnd_level"
	}
}

// Wind conditions model
struct Wind: Codable {
	let speed: Double
	let deg: Int
	let gust: Double?
	var cardinalDirection: String? {
		switch deg {
		case 0..<11, 349..<360:
			return "N"
		case 11..<34:
			return "NNE"
		case 34..<56:
			return "NE"
		case 56..<79:
			return "ENE"
		case 79..<101:
			return "E"
		case 101..<124:
			return "ESE"
		case 124..<146:
			return "SE"
		case 146..<169:
			return "SSE"
		case 169..<191:
			return "S"
		case 191..<214:
			return "SSW"
		case 214..<236:
			return "SW"
		case 236..<259:
			return "WSW"
		case 259..<281:
			return "W"
		case 281..<304:
			return "WNW"
		case 304..<326:
			return "NW"
		case 326..<349:
			return "NNW"
		default:
			return nil
		}
	}
}

// Cloud conditions model
struct Clouds: Codable {
	let all: Int
}

// System information model
struct Sys: Codable {
	let type: Int?
	let id: Int?
	let country: String
	let sunrise: Int
	let sunset: Int
}

// Weather Response Model
struct OneCallWeatherResponse: Codable {
	let lat: Double
	let lon: Double
	let timezone: String
	let timezoneOffset: Int
	let current: Current
	let minutely: [Minutely]
	let hourly: [Hourly]
	let daily: [Daily]
	let alerts: [Alert]?
	
	enum CodingKeys: String, CodingKey {
		case lat, lon, timezone
		case timezoneOffset = "timezone_offset"
		case current, minutely, hourly, daily, alerts
	}
}

// Current Weather Model
struct Current: Codable {
	let dt: Int
	let sunrise: Int
	let sunset: Int
	let temp: Double
	let feelsLike: Double
	let pressure: Int
	let humidity: Int
	let dewPoint: Double
	let uvi: Double
	let clouds: Int
	let visibility: Int
	let windSpeed: Double
	let windDeg: Int
	let windGust: Double
	let weather: [WeatherType]
	let snow: Snow?
	
	enum CodingKeys: String, CodingKey {
		case dt, sunrise, sunset, temp, pressure, humidity, clouds, visibility, weather, snow
		case feelsLike = "feels_like"
		case dewPoint = "dew_point"
		case uvi
		case windSpeed = "wind_speed"
		case windDeg = "wind_deg"
		case windGust = "wind_gust"
	}
}

// Minutely Forecast Model
struct Minutely: Codable {
	let dt: Int
	let precipitation: Double
}

// Hourly Forecast Model
struct Hourly: Codable {
	let dt: Int
	let temp: Double
	let feelsLike: Double
	let pressure: Int
	let humidity: Int
	let dewPoint: Double
	let uvi: Double
	let clouds: Int
	let visibility: Int
	let windSpeed: Double
	let windDeg: Int
	let windGust: Double
	let weather: [WeatherType]
	let pop: Double
	let snow: Snow?
	
	enum CodingKeys: String, CodingKey {
		case dt, temp, pressure, humidity, clouds, visibility, weather, pop, snow
		case feelsLike = "feels_like"
		case dewPoint = "dew_point"
		case uvi
		case windSpeed = "wind_speed"
		case windDeg = "wind_deg"
		case windGust = "wind_gust"
	}
}

// Daily Forecast Model
struct Daily: Codable {
	let dt: Int
	let sunrise: Int
	let sunset: Int
	let moonrise: Int
	let moonset: Int
	let moonPhase: Double
	let summary: String
	let temp: Temperature
	let feelsLike: FeelsLike
	let pressure: Int
	let humidity: Int
	let dewPoint: Double
	let windSpeed: Double
	let windDeg: Int
	let windGust: Double
	let weather: [WeatherType]
	let clouds: Int
	let pop: Double
	let snow: Double?
	let rain: Double?
	let uvi: Double
	
	enum CodingKeys: String, CodingKey {
		case dt, sunrise, sunset, moonrise, moonset, summary, temp, pressure, humidity, clouds, weather, pop, snow, rain, uvi
		case moonPhase = "moon_phase"
		case feelsLike = "feels_like"
		case dewPoint = "dew_point"
		case windSpeed = "wind_speed"
		case windDeg = "wind_deg"
		case windGust = "wind_gust"
	}
}

// Temperature Model
struct Temperature: Codable {
	let day: Double
	let min: Double
	let max: Double
	let night: Double
	let eve: Double
	let morn: Double
}

// Feels Like Temperature Model
struct FeelsLike: Codable {
	let day: Double
	let night: Double
	let eve: Double
	let morn: Double
}

// Weather Description Model
struct WeatherType: Codable {
	let id: Int
	let main: String
	let description: String
	let icon: String
}

// Snow Model
struct Snow: Codable {
	let oneHour: Double
	
	enum CodingKeys: String, CodingKey {
		case oneHour = "1h"
	}
}

// Alert Model
struct Alert: Codable {
	let senderName: String
	let event: String
	let start: Int
	let end: Int
	let description: String
	let tags: [String]
	
	enum CodingKeys: String, CodingKey {
		case event, start, end, description, tags
		case senderName = "sender_name"
	}
}

//
//  WeatherSession.swift
//  
//
//  Created by Mark Edmunds on 7/30/23.
//

import Foundation
import SwiftUI
struct WeatherSession{
    static let apiKey =  ProcessInfo.processInfo.environment["OPEN_WEATHER_API_KEY"]
	static let baseURL = "https://api.openweathermap.org/data/2.5/weather?q="
	
	static func getCurrentWeatherFor(city: String, units: String) async throws -> Data?{
		guard let apiKey else {
			throw WeatherError.missingAPIKey
		}
		
			guard let url = URL(string: "\(baseURL)\(city)&units=\(units)&appid=\(apiKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
				throw WeatherError.invalidURL("\(baseURL)\(city)&units=\(units)&appid=\(apiKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
			}
			let (data, response) = try await URLSession.shared.data(from: url)
			guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
						print("Failed to retrieve data. Status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
						return nil
					}
			return data
	}
	static func getWeather(city: String,units: String,completion: @escaping (Data?) -> Void) throws -> Data? {
		guard apiKey != nil else{
			throw WeatherError.missingAPIKey
		}

		let urlsesion = URLSession(configuration: .default)
		let urlRequest = URLRequest(url: URL(string: "\(baseURL)\(city)&units=\(units)&appid=\(apiKey ?? "")")!)
		let task = urlsesion.dataTask(with: urlRequest) { (data, response, error) in
			guard error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
				print("Failed to retrieve data. Status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
				return
			}
			completion(data)
		}
			task.resume()
		return nil
 }
	

	// Create WeatherError
	public enum WeatherError: Error{
		case missingAPIKey
		case invalidResponse(String)
		case invalidData
		case invalidURL(String)
	}
}


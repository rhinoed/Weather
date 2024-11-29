// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation
import Foundation
import Rainbow
import ArgumentParser
import SpectreKit





let dateFormatter = DateFormatter()



@main
struct Weather: AsyncParsableCommand {
	@Argument(help: "The city for which you want the weather")
	var city: String
	@Flag(name:[.customShort("c"),.long],help: "Returns temperture in ℃")
	var celciusTrue: Bool = false
	@Flag(name:[.customShort("r"), .long],help: "Returns weather Data in a json string raw from weather server")
	var outputRaw: Bool = false
	static var configuration = CommandConfiguration(
		abstract: "This is meant to be a simple, command line tool to get the current weather information for a given location. The weather information for is provided by https://openweathermap.org",
		version: "0.1.1"
	)
	mutating func run() throws{
		let semi = DispatchSemaphore(value: 0)
		let cityName = city
		let output = outputRaw
		let givenUnits = celciusTrue ? "metric" : "imperial"
		let mTrue = celciusTrue
		print("\(cityName) \(givenUnits) \(output)")
			if #available(macOS 10.15, *) {
				Task{
					print("\(cityName) \(givenUnits) \(output)")
					print(AsciiWeatherIcons.rain)
					print(AsciiWeatherIcons.partlyCloudyRain)
					print(AsciiWeatherIcons.clearSunny)
					print(AsciiWeatherIcons.clearNight)
					print(AsciiWeatherIcons.foggy)
					print(AsciiWeatherIcons.snow)
					print(AsciiWeatherIcons.palt)
					do{
						guard let data = try await WeatherSession.getCurrentWeatherFor(city: cityName, units: givenUnits) else{ fatalError("Could not get data")}
						handleJSONData(data: data, celciusTrue: mTrue, outputRaw: output)
						semi.signal()
					}catch{
						print("Error: \(error)")
					}
				}
				semi.wait()
			} else {

				throw CleanExit.message("Ok, you like rocking it old school, I dig it. But unfortunately, this command is not supported on macOS 10.14 or earlier.")
		
			}
		
	}
	
}

func getWeather(requestString: String,completion: @escaping (Data?) -> ()){
	//print(requestString)
	// ToDo: use url session to make request to open weather api. manage json response.
	
	guard let url = URL(string: requestString)else{
		// let error = URLError(.badURL)
		print("url not created ")
		return
	}

	let session = URLSession(configuration: .default)
	let task = session.dataTask(with: url) { (data, response, error) in
		guard let httpResponse = response as? HTTPURLResponse else{print("Bad Response from server")
			return
		}
		if error == nil && httpResponse.statusCode == 200{
			guard let safeData = data else{return}
			completion(safeData)
			
		}else{
			print("url response error\(String(describing: error))")
			
			completion(nil)
		}
	}
	task.resume()
	

}
func handleJSONData(data: Data, celciusTrue: Bool, outputRaw: Bool){
	// The call to the api controls the actual value of the teperture (lines 22,27). This just sets the appropriate label.
	let label = celciusTrue ?  "℃" : "℉"
	do{
		if outputRaw{
			print(returnRawData(data: data))
		}else{
			let decoder = JSONDecoder()
			let forecast = try decoder.decode( WeatherResponse.self, from: data)
			dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
			let date = "\(dateFormatter.string(from: (Date(timeIntervalSince1970: TimeInterval(forecast.dt)))))"
			let sunrise = "\(dateFormatter.string(from: (Date(timeIntervalSince1970: TimeInterval(forecast.sys.sunrise)))))"
			let sunset = "\(dateFormatter.string(from: (Date(timeIntervalSince1970: TimeInterval(forecast.sys.sunset)))))"
	
			let console = Console()
			console.write(
				Panel(
					Table()
						.addColumns("", "")
						.addRow(Text("Date"), Text("\(date)"))
						.addRow(Text("Location:"), Text("\(forecast.name)"))
						.addRow(Text("Condition:"), Text("\(forecast.weather[0].main)"))
						.addRow(Text("Description:"), Text("\(forecast.weather[0].description)"))
						.addRow(Text("Temperture:"), Text("\(forecast.main.temp)\(label)"))
						.addRow(Text("Humidity:"), Text("\(forecast.main.humidity)%"))
						.addRow(Text("Pressure:"), Text("\(forecast.main.pressure)hPa"))
						.addRow(Text("Wind Speed:"), Text("\(forecast.wind.cardinalDirection ?? "N") \(forecast.wind.speed)m/s"))
						.addRow(Text("Wind Direction:"), Text("\(forecast.wind.deg)°"))
						.addRow(Text("Cloudiness:"), Text("\(forecast.clouds.all)%"))
						.addRow(Text("Sunrise:"), Text("\(sunrise)"))
						.addRow(Text("Sunset:"), Text("\(sunset)"))

				)
				.setHeader("[white bold]Weather for: \(forecast.name)[/]")
				.setHeaderAlignment(.center)
				.setBorderStyle(.plain)
				.setBorderColor(Color.rgb(128, 128, 0)))
			
		}
		
		
	}catch{
		print("error thrown while getting weather:  \(error)" )
	}
	
}
func returnRawData (data: Data)-> String{
	guard let weatherDataRew = String(data: data, encoding: .utf8) else{return "Something went wrong no weather data"}
	return weatherDataRew
}


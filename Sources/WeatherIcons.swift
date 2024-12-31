import Foundation
import Rainbow

struct WeatherIcons {
    static let clearSky = "☀️"
    static let fewClouds = "🌤"
    static let scatteredClouds = "🌥"
    static let brokenClouds = "☁️"
    static let showerRain = "🌧"
    static let rain = "🌧"
    static let thunderstorm = "⛈"
    static let snow = "❄️"
    static let mist = "🌫"
    static let unknown = "🤷‍♂️"
}

struct AsciiWeatherIcons{
    let reset = "\u{001B}[0m"         // Reset color to default
let yellow = "\u{001B}[33m"       // Yellow color for the sun
let gray = "\u{001B}[37m"
let blue = "\u{001B}[34m"
let brightBlue = "\u{001B}[94m"
let brightWhite = "\u{001B}[97m"       
    
    static let cloudy: String = """
                                 \u{001B}[37m,.-.
                                 (    ).
                                (____(__)\u{001B}[0m
                               """

    static let partlyCludy: String = """
                                     \u{001B}[33m_`/˘˘,\u{001B}[37m.-.
                                     \u{001B}[33m  \\_\u{001B}[37m(	 ).
                                      \u{001B}[33m/\u{001B}[37m(____(__)\u{001B}[0m
                                     """
    
    static let rain: String = """
                              \u{001B}[37m,.-.
                             (    ).
                            (____(__)\u{001B}[0m
                             \u{001B}[34m¿ ¿ ¿ ¿
                              ¿ ¿ ¿\u{001B}[0m
                            """
    static let partlyCloudyRain: String = """
                                           \u{001B}[33m_`/˘˘,\u{001B}[37m.-.
                                           \u{001B}[33m  \\_\u{001B}[37m(	 ).
                                            \u{001B}[33m/\u{001B}[37m(____(__)\u{001B}[0m
                                              \u{001B}[34m¿ ¿ ¿ ¿
                                               ¿ ¿ ¿\u{001B}[0m
                                          """
    static let clearSunny: String = """
                                      \\   /
                                       .-.
                                    — (   ) —
                                       `-❜
                                      /   \\                                    
                                    """.yellow
    static let clearNight: String = """
                                       .-.
                                      (   ) 
                                       `-❜
                                    """.lightWhite
                                
    static let foggy: String = """
                                   \u{001B}[33m\\   /
                                    .-.
                                 — ( \u{001B}[37m≈≈≈≈≈
                                     ≈≈≈≈≈
                                     ≈≈≈≈≈\u{001B}[0m
                                """
    static let snow: String = """
                                \u{001B}[37m,.-.
                               (    ).
                              (____(__)\u{001B}[0m
                               \u{001B}[97m❄︎  ❄︎  ❄︎
                                ❄︎  ❄︎  \u{001B}[0m
                              """
    static let palt: String = """
                                \u{001B}[33m\\   /
                                 .-.
                              — ( \u{001B}[37m,.-.
                                 (    ).
                                (____(__)\u{001B}[0m
                              """

}

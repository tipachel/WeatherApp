//
//  ContentView.swift
//  Weather
//
//  Created by Tipachel on 01.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                              weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            
            }else  {
                if locationManager.isLoading {
                    LoadingView()
                }else {
                    WellcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.661, saturation: 0.823, brightness: 0.409))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

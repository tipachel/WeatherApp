//
//  WeatherView.swift
//  Weather
//
//  Created by Tipachel on 01.03.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2018/12/10/16/22/city-3867295_960_720.png")) {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                        .frame(maxWidth: .infinity)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Weather now")
                            .bold()
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                        }
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.661, saturation: 0.823, brightness: 0.409))
                    .background(.white)
                    .cornerRadius(20 , corners: [.topLeft, .topRight])
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.661, saturation: 0.823, brightness: 0.409))
            .preferredColorScheme(.dark)
        }
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
}

//
//  ContentView.swift
//  Analogic Clock
//
//  Created by Jorge Giannotta on 16/05/21.
//

import SwiftUI

struct ContentView: View {
    
    var width = UIScreen.main.bounds.width
    @State var currentTime = Time(min: 0, sec: 0, hour: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Text("Analogic Clock UI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer(minLength: 0)
            
            Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            Text(getDate())
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom)
            
            ZStack{
                RoundedRectangle(cornerRadius: 60.0)
                    .fill(Color("bg"))
//                Circle()
//                    .fill(Color("bg"))
                
                Circle()
                    .fill(Color("bg2"))
                    .frame(width: 140, height: 140)
                
                Circle()
                    .fill(Color("bg3"))
                    .frame(width: 70, height: 70)
                
                // Seconds And Mintutes Dots
                ForEach(0..<60, id: \.self){ i in
                    Rectangle()
                        .fill(Color("dots"))
                        //60 / 12 = 5
                        .frame(width: 3, height: (i % 5) == 0 ? 15 : 5)
                        .offset(y: (width - 110) / 2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                }
                
                // Seconds
//                Rectangle()
//                    .fill(Color(.green))
//                    .frame(width: 2, height: (width - 180) / 2)
//                    .offset(y: -(width - 180) / 4)
//                    .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
//
//
                SecondStickView()
                    .frame(width: 2, height: (width - 180) / 2)
                    .offset(y: -(width - 180) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
                
                // Minutes
//                Rectangle()
//                    .fill(Color(.blue))
//                    .frame(width: 4, height: (width - 200) / 2)
//                    .offset(y: -(width - 200) / 4)
//                    .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
//
                MinuteStickView()
                    .frame(width: 4, height: (width - 200) / 2)
                    .offset(y: -(width - 200) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
                
                
                // Hours
//                Rectangle()
//                    .fill(Color(.red))
//                    .frame(width: 4.5, height: (width - 240) / 2)
//                    .offset(y: -(width - 240) / 4)
//                    .rotationEffect(.init(degrees: Double(currentTime.hour) * 30))
//
                HourStickView()
                    .frame(width: 4.5, height: (width - 240) / 2)
                    .offset(y: -(width - 280) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.hour) * 30))
                
                //Center Circle
//                Circle()
//                    .fill(Color(.orange))
//                    .frame(width: 15, height: 15)
                
                InsideCircle()
                    .frame(width: 20, height: 20)
            }
            .frame(width: width - 80, height: width - 80)
            
            
            
            Text(getTime())
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top)
            
            
            Spacer(minLength: 0)
        })
        .padding(.horizontal,50)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("mainBG"))
        .ignoresSafeArea(.all)
        
        .onAppear(perform: {
            let calender = Calendar.current
            
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(min: min, sec: sec, hour: hour)
            }
        })
        
        .onReceive(receiver, perform: { (_) in
            let calender = Calendar.current
            
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(min: min, sec: sec, hour: hour)
            }
        })
    }
    func getTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "hh:mm:ss a"
        
        return format.string(from: Date())
    }
    func getDate() -> String {
        let format = DateFormatter()
        format.dateFormat = "dd MMM yyyy"
        
        return format.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Calculating Time
struct Time {
    var min : Int
    var sec : Int
    var hour : Int
}

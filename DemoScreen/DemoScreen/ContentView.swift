//
//  ContentView.swift
//  DemoScreen
//
//  Created by Kalidoss Shanmugam on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView()
                    .padding(.bottom, 10)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        UserTitleView()
                        CalendarCardView()
                        ScheduleMainView()
                        Button(action: {}) {
                            AddNoteButtonView()
                        }
                    }
                }
            }
            .padding()

        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.primary)
            }
            Spacer()
            Button(action: {}) {
                Image("Testuser")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
        }
        .padding(.top)
    }
}

struct UserTitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello Craqy")
                .font(.headline)
            Text("What's your plan?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }
}

struct MeetingCardView: View {
    var index: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text("Today meeting with Ecommerce")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
            VStack(alignment: .leading){
                Text("Designers: ")
                    .foregroundColor(.white)
                HStack(spacing: 3) {
                    
                    ForEach(0 ..< 4) { item in
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(item % 2 == 0 ? .white : .yellow)
                    }
                }
                .padding(.bottom,5)
            }
            .padding()
        }
        .background(index % 2 == 0 ? .green : .pink)
        .frame(width: 160)
        .cornerRadius(10)
    }
}

struct CalendarCardView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10, id: \.self) { item in
                    MeetingCardView(index: item)
                }
            }
        }
    }
}

struct ScheduleTimeView: View {
    var body: some View {
            
            VStack(alignment: .leading,spacing: 5){
                GeometryReader { geo in
                    VStack(alignment: .leading) {
                        Text("9:00 AM")
                            .font(.title2)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.01)
                        Text("30 minutes")
                            .font(.body)
                            .minimumScaleFactor(0.01)

                    }.frame(width: geo.size.width)
                   
                }

            }
            .padding()
            .foregroundColor(.white)
            .background(.green)
            .frame(height: 80)
            .cornerRadius(8)
    }
}

struct ScheduleMainView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Schedule Time")
                .font(.title2)
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            ForEach(0..<5, id: \.self) {index in
                    HStack(spacing: 2) {
                        ForEach(0..<3, id: \.self) {
                            item in
                                ScheduleTimeView()
                            }
                    }
            }
        }
    }
}

struct AddNoteButtonView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "arrowshape.zigzag.right.fill")
                .resizable()
                .frame(width: 30, height: 30)
            
            Text("Add your note")
                .font(.title2)
            
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 15, height: 30)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 30)
        .padding()
        .background(Color.green)
        .cornerRadius(20)
        .padding(.bottom, 20)
        .foregroundColor(.white)
    }
}

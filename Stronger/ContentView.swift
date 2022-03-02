//
//  ContentView.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var selectedTab: Int = 2
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                testing().tag(0)
                    .tabItem { Label("Profile", systemImage: "person.crop.rectangle.fill") }
                Text("History").tag(1)
                    .tabItem { Label("History", systemImage: "clock") }
                Text("Start Workout").tag(2)
                    .tabItem { Label("Start Workout", systemImage: "plus") }
                Excercises().tag(3)
                    .tabItem { Label("Excercises", systemImage: "questionmark") }
                Text("Measure").tag(4)
                    .tabItem { Label("Measure", systemImage: "ruler") }
            }
            .accentColor(colorScheme == .light ? .marineGreen : .neonGreen)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Stronger").font(.title).bold()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "gearshape.fill")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bubble.left.fill")
                }
            }
            .foregroundColor(colorScheme == .light ? .marineGreen : .neonGreen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
        }
    }
}

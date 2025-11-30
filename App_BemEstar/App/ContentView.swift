//
//  ContentView.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedName = namesMock.first!
    
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 20) {
                NavigationBar(selectedName: $selectedName)
                Features_Grid()
                CarouselTabView()
                GoalContainer()                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

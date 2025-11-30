//
//  Features_Grid.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct Features_Grid: View {
    
    var gridLayout: [GridItem]{ return
        Array(repeating: GridItem(.flexible()), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout){
            ForEach(servicesMock){
                service in FeatureType(service: service)
            }
        }.frame(height: 200)
            .padding(.horizontal, 15)
            .padding(.top, 15)
    }
}

#Preview {
    Features_Grid()
}

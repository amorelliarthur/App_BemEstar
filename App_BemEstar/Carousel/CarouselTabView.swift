//
//  CarouselTabView.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    let bannerList: [ServiceType] = carouselMock
    
    var body: some View {
        TabView{
            ForEach(bannerList){ banner in CarouselItemView(banner: banner)}
        }
        .frame(width: 300, height: 230)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}

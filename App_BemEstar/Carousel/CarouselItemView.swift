//
//  CarouselItemView.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct CarouselItemView: View {
    let banner: ServiceType
    var body: some View {
        Image(banner.imagem)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
    }
}

#Preview {
    CarouselItemView(banner: ServiceType(id: 1, nome: "", imagem: "motivacional1"))
}

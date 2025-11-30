//
//  FeatureType.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct FeatureType: View {
    let service: ServiceType
    var body: some View {
        VStack{
            Image(service.imagem)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .fixedSize(horizontal: false, vertical: true)
            Text(service.nome)
                .font(.system(size: 15))
        }.frame(width: 80, height: 80)
    }
}

#Preview {
    FeatureType(service: ServiceType(id: 1, nome: "Exercitar", imagem: "exercicio"))
}

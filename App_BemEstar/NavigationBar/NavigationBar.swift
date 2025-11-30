//
//  NavigationBar.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var selectedName: String
    
    var body: some View {
        HStack(spacing: 8) {
            Menu {
                ForEach(namesMock, id: \.self) { name in
                    Button(name) {
                        selectedName = name
                    }
                }
            } label: {
                Text(selectedName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }

            Button(action: {}) {
                Image(systemName: "person.badge.plus.fill")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)

    }
}

#Preview {
    NavigationBar(selectedName: .constant("Arthur Dias"))
}
	

//
//  GoalListView.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct GoalListView: View {
    let goal: GoalType
    var body: some View {
        HStack{
            Image(systemName: goal.icone)
                .resizable()
                .font(.largeTitle)
                .frame(maxWidth: 38, maxHeight: 40)
            
            VStack(alignment: .leading){
                Text(goal.titulo)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(goal.descricao)
                    .font(.caption)
            }
        }.foregroundStyle(.blue)
    }
}

#Preview {
    GoalListView(goal: GoalType(id: 1, icone: "moon.zzz.fill", titulo: "Descanso", descricao: "Dormir 8h por noite"))
}

//
//  GoalContainer.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct GoalContainer: View {
    let goalList : [GoalType] = GoalMock
    var body: some View {
        VStack(alignment: .leading){
            ForEach(goalList){
                goal in GoalListView(goal: goal)
            }
        }
    }
}

#Preview {
    GoalContainer()
}

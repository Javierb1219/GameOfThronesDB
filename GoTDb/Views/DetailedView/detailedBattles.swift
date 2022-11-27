//
//  charactersView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct detailedBattles: View {
    var battleArray:[battlesArray]
    var currId:Int
    var body: some View {
        
        VStack{
            Spacer()
            Text(battleArray[currId].battleName ?? "No name")
                .font(.largeTitle)
                .frame(alignment: .center)
            Image("warImage")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
        }
        
        VStack(alignment: .leading, spacing: 20){
            Text("Some intresting facts about the battle")
                .font(.title3)
                .padding()
            
            Text("Battle Year: \(battleArray[currId].battleYear ?? 0)")
            Text("Attacking King: \(battleArray[currId].AttackingKing ?? "unknown")")
            Text("Out come for the Attacking king: \(battleArray[currId].AttackerOutcome ?? "unknown")")
            Text("Defending King: \(battleArray[currId].DefendingKing ?? "unknown")")
            Text("Location of the battle: \(battleArray[currId].location ?? "unknown")")
            Text("Region of Battle: \(battleArray[currId].region ?? "Unknown")")
            
            Spacer()
        }
        
        
    }
}

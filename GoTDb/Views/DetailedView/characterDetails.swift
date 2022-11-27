//
//  charactersView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct characterDetails: View {
    var characterArray:[charactersArray]
    var unknowndeathYear:String = "Unknown"
    var body: some View {
        
        VStack{
            Spacer()
            Text(characterArray[0].characterName)
                .font(.largeTitle)
                .frame(alignment: .center)
            Image("characters")
                .resizable()
                .frame(width: 300, height: 200, alignment: .center)
        }
        
        VStack(alignment: .leading, spacing: 20){
            Text("Some intresting facts about \(characterArray[0].characterName)")
                .font(.title3)
                .padding()
            
            Text("Allegiance: \(characterArray[0].Allegiance ?? "Unknown")")
            
            if(characterArray[0].DeathYear == nil){
                Text("Year of death: Unknown")
            }
            else{
                Text("Year of death: \(characterArray[0].DeathYear ?? 0)")
            }
            Text("Book first apperance: \(characterArray[0].BookApperance ?? "Unknown")")
            Text("Book of death: \(characterArray[0].BookDeath ?? "Unknown")")
            
            Spacer()
        }
        
        
    }
}

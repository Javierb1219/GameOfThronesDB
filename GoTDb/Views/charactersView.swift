//
//  battlesView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct charactersView: View {
    @StateObject var connect = psqlConnect()
    @State var showBattle:Bool = false
    @State var showId:Int = 1
    var body: some View {
        
        VStack{
            List{
                ForEach(connect.characterArray, id: \.self){
                    battles in
                    Button{
                        print(battles.characterName)
                        connect.selectCharacterInfo(cName: battles.characterName)
                        //print(battles)
                        //showId = battles.character
                        showBattle.toggle()
                    } label: {
                        VStack{
                            HStack{
                                //Text(battles.battleNo)
                                Text("\(battles.characterName)")
                                    //.foregroundColor(.black)
                            }//end of inner Hstack
                        }//end of innerVstack
                    }//end of label for button
                }//end of ForEach
            }//end of list
            .sheet(isPresented: $showBattle) {
                characterDetails(characterArray: connect.selectedCharacter)
            }
        .navigationTitle("Game Of Thrones Characters")
        }//end of Vstack
        .onAppear{
            connect.createCharacterArray()
        }
        
    }
}

//
//  battlesView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct battlesView: View {
    @StateObject var connect = psqlConnect()
    @State var showBattle:Bool = false
    @State var showId:Int = 1
    var body: some View {
        
        VStack{
            
            NavigationView{
                List{
                    ForEach(connect.battleArray){
                        battles in
                        Button{
                            showId = battles.battleNo
                            showBattle.toggle()
                        } label: {
                            VStack{
                                HStack{
                                    //Text(battles.battleNo)
                                    Text("\(battles.battleNo).")
                                        //.foregroundColor(.black)
                                    Text("\(battles.battleName ?? "No name")")
                                        //.foregroundColor(.black)
                                }//end of inner Hstack
                            }//end of innerVstack
                        }//end of label for button
                    }//end of ForEach
                }//end of list
                .sheet(isPresented: $showBattle) {
                    detailedBattles(battleArray: connect.battleArray, currId: showId)
                }
            }//end of navigationView
            .navigationTitle("Game Of Thrones Battles")
        }//end of Vstack
        .onAppear{
            connect.connectNow()
        }
        
    }
}

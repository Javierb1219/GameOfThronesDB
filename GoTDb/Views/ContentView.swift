//
//  ContentView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var connect = psqlConnect()
    var body: some View {
        
        NavigationView{
            VStack{
                Text("WELCOME TO GOT DATA")
                    .font(.largeTitle)
                    .foregroundColor(.mint)
                Image("got")
                    .resizable()
                    .frame(width: 400, height: 250)
                Text("What would you like to know more about?")
                    .multilineTextAlignment(.center)
                    .font(.title)
                NavigationLink(destination: battlesView())
                {
                    Text("Battles")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                    
                }//end of battleView NavigationLink
                
                NavigationLink(destination: charactersView())
                {
                    Text("characters")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                    
                }//end of characterView NavigationLink
                
                NavigationLink(destination: seasonsView())
                {
                    Text("Seasons")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                    
                }//end of seasonsView NavigationLink
                
//                NavigationLink(destination: episodeView())
//                {
//                    Text("characters")
//                        .frame(minWidth: 0, maxWidth: 300)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
//                        .cornerRadius(40)
//                        .font(.title)
//
//                }//end of characterView NavigationLink
            }//end of Vstack
        }
        .navigationTitle("Game Of Thrones Database")
//        VStack {
//
//            Button("pls work"){
//                connect.connectNow()
//                connect.printArray()
//            }
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  GameDetail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameDetail: View {
    
    @State var isFavorite = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: Constants.placeHolder), options: .highPriority, context: nil)
                    .resizable()
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text("wndiobnd")
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(20)) Hours")
                        .font(.subheadline)
                    
                    HStack {
                        Text("dnwidni")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .padding(.bottom)
                        
                        HStack(alignment: .center, spacing: 3) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Text(String(0.0))
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(10)
                        .cornerRadius(10)
                        .padding(.bottom)
                        
                        Spacer()
                        
                        if isFavorite == false {
                            Button(action: {
                                isFavorite = true
                                // TODO = add game to db
                            }, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            })
                        } else if isFavorite == true {
                            Button(action: {}, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                    .padding(.trailing)
                            }).alert(isPresented: $isFavorite) {
                                Alert(title: Text("Game Added!"), message: Text("Your game has been added to your favorites list"), dismissButton: .default(Text("Got it!")))
                            }
                        }
                        
                    }.padding(.top)
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                        .padding(3)
                    
                    Text("Detaik".formatText())
                        .font(.caption)
                        .padding(3)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            // get detail data
        }
        .navigationTitle("Detail")
    }
    
}

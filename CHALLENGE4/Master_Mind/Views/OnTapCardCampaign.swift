//
//  OnTapCardCampaign.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
//

import SwiftUI

struct OnTapCardCampaign: View {
    var titulo : String?
    var description : String?
    var capa : Data?
    
    @State private var mostraCard = false
    @State private var showNextScreen = false
    
    var body: some View {
        //        NavigationStack{
        
        //ZTACK COM O RETÂNGULO MENOR, CAPA DO CARD
        ZStack{
            VStack{
                
                //CONTEÚDO DO CARD
                if mostraCard {
                    Rectangle()
                        .onTapGesture {
                            withAnimation {
                                //                                self.showNextScreen = true
                                
                                if self.showNextScreen == false {
                                    self.showNextScreen = true
                                }else {
                                    self.showNextScreen = false
                                }
                            }
                        }
                        .overlay(
                            Text(description ?? "Descrição")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 12, leading: 14, bottom: 0, trailing: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //  .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)})
                                .onTapGesture {
                                    withAnimation {
                                        self.showNextScreen = true
                                    }
                                }
                        )
                }
                
                //CAPA DO CARD
                else {
                    if let capa = capa {
                        Image(uiImage: UIImage(data: capa)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 514, height: 336)
                            .clipped()
                            .cornerRadius(16)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 514, height: 336)
                            .cornerRadius(16)
                            .clipped()// Adjust size as needed
                    }
                    Rectangle()
                    //                        .frame(width: 514, height: 400)
                    //                        .background(Color.colorBackgroundCard)
                    //                        .cornerRadius(16)
                    //                        .fill(Color.blue)
                    //                        .frame(width: 200, height: 100)
                        .onTapGesture {
                            withAnimation {
                                self.mostraCard = true
                            }
                        }
                        .overlay(
                            Text(titulo ?? "Title")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 12, leading: 14, bottom: 0, trailing: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    withAnimation {
                                        self.mostraCard = true
                                    }
                                }
                        )
                }
                
                Spacer()
            }
            
            
        } //fim zstack
        
        .frame(width: 514, height: 400)
        .background(Color.colorBackgroundCard)
        .cornerRadius(70)
        
        //  } //fim nav stack
        
    }
    
    
}

//#Preview {
//    OnTapCard()
//}

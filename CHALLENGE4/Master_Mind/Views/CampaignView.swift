//
//  CampaignView.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import SwiftUI
import SwiftData

struct CampaignView: View {
    
    @State private var items: [String] = []
    @State private var isAddCampaignPresent: Bool = false
    @Query private var campanhas : [Campanha]
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(red: 0.09, green: 0.09, blue: 0.1)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Your Adventures!")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.white)
                            .padding(20)
                            .padding(.bottom)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .background(Color(red: 0.14, green: 0.15, blue: 0.17))
                    .shadow(color: .black.opacity(0.35), radius: 2, x: 0, y: 1)
                    
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(campanhas) { campanha in
                                NavigationLink(value: campanha) {
                                    CardCampaign(titulo: campanha.titulo, capa: campanha.capa)
                                        .padding()
                                }
                            }
                            
                            Button(action:
                                    {isAddCampaignPresent.toggle()
                            }, label: {
                                Image("AddSymbol")
                            })
                            .frame(width: 514, height: 420)
                            .background(Color(red: 0.14, green: 0.15, blue: 0.17))
                            .cornerRadius(16)
                            .padding(EdgeInsets(top: 80, leading: 80, bottom: 100, trailing: 50))
                        }.navigationDestination(for: Campanha.self) { campanha in
                            CardEvents(campanha: campanha, cards: campanha.eventos)
                        }
                    }
                    .padding(EdgeInsets(top: 50, leading: 90, bottom: 50, trailing: 90))
                    Spacer()
                }
                .blur(radius: isAddCampaignPresent ? 30 : 0)
                if isAddCampaignPresent {
                    withAnimation{
                        AddCampaignView(isAddCampaignPresent: $isAddCampaignPresent)
                    }
                   }
            }
            }
        }
        
    }

#Preview {
    CampaignView()
        .modelContainer(for: [Campanha.self])
}

//
//  CampaignCard.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import SwiftUI

struct CampaignCard: View {
    var titulo : String?
    var capa : Data?
    
    var body: some View {
            ZStack{
                //Color.colorBackgroundCard
                Color.black //testando
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(red: 0.14, green: 0.15, blue: 0.17))
                    .frame(width: 466, height: 462)
                
                if let capa = capa {
                    Image(uiImage: UIImage(data: capa)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 466, height: 336)
                    .clipped()
                    .cornerRadius(16)
                    .padding(.bottom, 126)// Adjust size as needed
                    } else {
                        // Placeholder image if data is not available
                    Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 466, height: 336)
                    .padding(.bottom, 126)
                    .cornerRadius(16)
                    .clipped()// Adjust size as needed
                    }
                
                VStack(alignment: .center, spacing: 10) {
                    HStack{
                        Text(titulo ?? "Title")
                            .position(x:550, y:150)
                            .font(
                                Font.custom("SF Pro", size: 22)
                                    .weight(.bold))
                            .foregroundColor(.white)
                            .frame(width: 466, height: 28)
                            .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
            }
        }
    }

#Preview {
    CampaignCard()
}

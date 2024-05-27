//
//  CardCampaign.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 22/05/24.
//

import SwiftUI

struct CardCampaign: View {
    var titulo : String?
    var capa : Data?
    var body: some View {
        ZStack{
            VStack{
                if let capa = capa {
                    Image(uiImage: UIImage(data: capa)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 514, height: 336)
                    .clipped()
                    .cornerRadius(16)
//                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    } else {
                        // Placeholder image if data is not available
                    Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 514, height: 336)
                    .cornerRadius(16)
                    .clipped()// Adjust size as needed
                    }
                
                HStack{
                    Text(titulo ?? "Title")
                        .font(.title)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
                
        }
        .frame(width: 514, height: 420)
        .background(Color.colorBackgroundCard)
        .cornerRadius(16)
    }
}

#Preview {
    CardCampaign()
}

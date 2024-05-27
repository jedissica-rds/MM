//
//  Canvas.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 25/05/24.
//

import SwiftUI

struct Canvas: View {

    var body: some View {
        ZStack{
            Color.clear
            RoundedRectangle(cornerRadius: 70)
                .frame(width: 600, height: 500)
                .background(Color.colorBackgroundCard)
                .clipShape(RoundedRectangle(cornerRadius: 70))
        }
        .clipShape(RoundedRectangle(cornerRadius: 70))
        .frame(width: 600, height: 500)
    }
}


#Preview {
    Canvas()
}

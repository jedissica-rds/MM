//
//  CanvasWrapper.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 26/05/24.
//

import SwiftUI

struct CanvasWrapper: View {
    var body: some View {
        ZStack{
                Canvas()
        }
        .background(Color.black.opacity(0.4))
    }
}

#Preview {
    CanvasWrapper()
}

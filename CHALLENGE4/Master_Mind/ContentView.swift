//
//  ContentView.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
            CampaignView()
    }
}
#Preview {
    ContentView()
        .modelContainer(for: [Campanha.self])
}

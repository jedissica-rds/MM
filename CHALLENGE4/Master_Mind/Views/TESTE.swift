//
//  TESTE.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 26/05/24.
//

import SwiftUI

struct ContentView2: View {
    @State private var isPopoverPresented = false
    
    var body: some View {
        VStack {
            Button("Show Popover") {
                self.isPopoverPresented = true
            }
        }
        .popover(isPresented: $isPopoverPresented, arrowEdge: .top) {
            PopoverView()
        }
    }
}

struct PopoverView: View {
    var body: some View {
        VStack {
            Text("This is a Popover")
                .padding()
            // Add more content here if needed
        }
        .frame(width: 200, height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

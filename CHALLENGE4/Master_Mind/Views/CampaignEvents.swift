//
//  CampaignEvents.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
//

import SwiftUI
import SwiftData
        

struct CampaignEvents: View {
    
    @Environment(\.modelContext) private var context
     var campanha: Campanha
    
    @State private var title: String = ""
    @State private var story: String = ""
    @State private var showEventsScreen: Bool = false
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            Section("Eventos") {
                Button(action: {
                    showEventsScreen = true
                }, label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                
                if campanha.eventos.isEmpty {
                    ContentUnavailableView {
                        Text("No reviews")
                    }
                } else {
//                    ReviewListView(movie: movie)
//                    Text("teste")
                    CardEvents(campanha: campanha, cards: campanha.eventos)
                }
            }
            
            
        }.onAppear {
            title = campanha.titulo
        }
        .sheet(isPresented: $showEventsScreen, content: {
            NavigationStack {
//                AddEventView(campanha: campanha, onEventAdded: <#([Eventos]) -> Void#>)
            }
        })
    }
}


struct CampaignDetailContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var campanha: Campanha?
    
    var body: some View {
        ZStack {
            if let campanha {
                CampaignEvents(campanha: campanha)
            }
        }
            .onAppear {
                campanha = Campanha(titulo: "TESTE"/*, historia: "TESTE"*/)
                context.insert(campanha!)
            }
    }
}
    
#Preview {
    CampaignDetailContainerScreen()
        .modelContainer(for: [Campanha.self])
}


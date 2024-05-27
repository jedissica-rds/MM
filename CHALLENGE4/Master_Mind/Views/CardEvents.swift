//
//  CardEvents.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CardEvents: View {
    
    @Environment(\.modelContext) private var context
    let campanha: Campanha
    @State var draggedCard: Eventos?
    @State var cards : [Eventos]
    @State var order : Int = 0
    @State var isAddEventShowing : Bool = false
    
    var body: some View{
        ZStack{
            Color(red: 0.09, green: 0.09, blue: 0.1)
                .ignoresSafeArea()
            VStack{
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 50){
                        ForEach(cards.sorted(by: { $0.order ?? 0 < $1.order ?? 0 })) {evento in
                            OnTapCard(titulo: evento.nome, description: evento.descricao, capa: evento.capa)
                                .onDrag {
                                    self.draggedCard = evento
                                    return NSItemProvider()
                                }
                                .onDrop(of: [.text],
                                        delegate: DropViewDelegate(destinationItem: evento, cards: $cards, draggedItem: $draggedCard)
                                )
                        }.onAppear(){
                            self.cards = self.campanha.eventos
                        }
                    }
                }
                .padding(50)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        isAddEventShowing = true
                    }, label: {
                        Image("buttonMais")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 30))
                }
            }
        }
        .sheet(isPresented: $isAddEventShowing, content: {
            NavigationStack{
                AddEventView(campanha: campanha, onEventAdded: { updatedEvents in
                    // Update the cards array when a new event is added
                    self.cards = updatedEvents
                })
                
            }
        })
    }
    
}
extension Text {
    func justified() -> some View {
        self.multilineTextAlignment(.leading)
            .lineLimit(nil)
            .lineSpacing(5)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
    }
}
struct ShowDescription: View {
    var titulo : String?
    var description : String?
    var capa : Data?
    var body : some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 514, height: 400)
                .foregroundStyle(Color.white)
            VStack{
                HStack{
                    Text(titulo ?? "Teste1")
                        .foregroundStyle(Color.black)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 20, trailing: 0))
                    Spacer()
                }
                HStack{
                    ScrollView {
                        Text(description ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacinia, est non egestas finibus, nunc nunc venenatis tortor, quis commodo sapien tellus maximus ante. Fusce viverra a lacus placerat luctus. Cras imperdiet quam a dapibus porta. Sed non sem et massa blandit pharetra. Pellentesque nulla tortor, placerat venenatis elit id, scelerisque tincidunt tellus. In tincidunt posuere odio, et lacinia tellus. Donec mollis pharetra placerat. Nulla vitae neque bibendum turpis tempor dapibus. Proin fermentum eros ac lorem finibus imperdiet.")
                            .foregroundStyle(Color.black)
                            .justified()
                            .font(.system(size: 24))
                            .lineSpacing(10)
                            .padding(EdgeInsets(top: 20, leading: 30, bottom: 30, trailing: 30))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                }
                Spacer()
            }
            .frame(width: 514, height: 400)
        }
        .frame(width: 514, height: 400)
        .cornerRadius(30)
        .shadow(radius:10)
    }
}


struct ShowBanner: View {
    var titulo : String?
    var description : String?
    var capa : Data?
    var body : some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 514, height: 400)
                .foregroundStyle(Color.white)
            VStack{
                if let capa = capa {
                    Image(uiImage: UIImage(data: capa)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 514, height: 336)
                        .clipped()
//                        .cornerRadius(30)
                        .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 514, height: 336)
                        .cornerRadius(30)
                        .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                        .clipped()// Adjust size as needed
                }
                HStack{
                    Text(titulo ?? "Teste2")
                        .foregroundStyle(Color.black)
                        .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
        }
        .frame(width: 514, height: 400)
        .cornerRadius(30)
        .shadow(radius:10)
    }
}

//struct Card: View {
//    var titulo : String?
//    var description : String?
//    var capa : Data?
//    @State private var isShowingDetails = false
//    
//    var body: some View {
//        VStack {
//            if isShowingDetails {
//                ShowDescription()
//                    .onTapGesture {
//                        withAnimation {
//                            isShowingDetails.toggle()
//                        }
//                    }
//            } else {
//                ShowBanner()
//                    .onTapGesture {
//                        withAnimation {
//                            isShowingDetails.toggle()
//                        }
//                    }
//            }
//        }
//    }
//}
    
    struct OnTapCard: View {
        var titulo : String?
        var description : String?
        var capa : Data?
        @State private var isShowingDetails = false
        
        var body: some View {
            VStack {
                if isShowingDetails {
                    ShowDescription(titulo: titulo, description: description)
                        .onTapGesture {
                            withAnimation {
                                isShowingDetails.toggle()
                            }
                        }
                } else {
                    ShowBanner(titulo: titulo, description: description, capa: capa)
                        .onTapGesture {
                            withAnimation {
                                isShowingDetails.toggle()
                            }
                        }
                }
            }
        }
        
    }
    
    
    #Preview {
        OnTapCard()
    }
    
    


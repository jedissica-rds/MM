//
//  CardCanvas.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import SwiftUI
import SwiftData

struct CardCanvas: View {
    
    @State var isAddEventShowing : Bool = false
    @State private var draggedCard: DraggableCardView?
    @State private var cards: [DraggableCardView] = [DraggableCardView(), DraggableCardView(), DraggableCardView(), DraggableCardView(), DraggableCardView(), DraggableCardView(), DraggableCardView()]
    //    var campanha : Campanha
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
//                    HStack{
//                        ForEach((0...cards.count-1).reversed(), id: \.self) {card in
//                            DraggableCardView()
//                                .onDrag({
//                                    self.draggedCard = cards[card]
//                                    return NSItemProvider()
//                                })
//                                .onDrop(of: [.text],
//                                        delegate: DropViewDelegate(destinationItem: cards[card], cards: $cards, draggedItem: $draggedCard)
//                                )
//                        }
//                        
//                    }
                    
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        isAddEventShowing = true
                    }, label: {
                        Image("AddButton")
                    })
                    //                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    //                    .background(Color.colorBackgroundBox)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                }
            }
        }
        .sheet(isPresented: $isAddEventShowing, content: {
            NavigationStack{
//                    AddEventView(campanha: campanha)
                
            }
        })
    }
}

struct DraggableCardView : View, Equatable {
    var titulo : String?
    var body : some View{
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 400)
            .foregroundColor(.blue)
        RoundedRectangle(cornerRadius: 400).fill(Color.gray).frame(width: 100, height: 2, alignment: .center).padding(5)
    }
}

#Preview {
    CardCanvas()
}

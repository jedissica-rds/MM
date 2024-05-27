//
//  DropViewDelegate.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
import Foundation
import SwiftUI

struct DropViewDelegate : DropDelegate {
    let destinationItem : Eventos
    @Binding var cards : [Eventos]
    @Binding var draggedItem : Eventos?
    
    
    func dropEntered(info: DropInfo) {
        if let draggedItem {
            let fromIndex = cards.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = cards.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.cards.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
                        
                        for (index, event) in cards.enumerated() {
                        event.order = index
                        }
                    }
                }
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem  = nil
        return true
    }
}
//cards.remove(at: fromIndex)
//cards.insert(draggedItem, at: toIndex)
//for (index, card) in cards.enumerated() {
//    card.order = index + 1
//}

//
//  BoardDropDelegate.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 25.04.2024.
//
import Foundation
import SwiftUI

struct BoardDropHandler: DropDelegate {
    
    let board: Board
    let targetList: BoardList
    
    @Binding var lists: [BoardList]
    @Binding var activeList: BoardList?
    
    private func getItemProviders(for typeIdentifier: String, in info: DropInfo) -> [NSItemProvider] {
        info.itemProviders(for: [typeIdentifier])
    }
    
    private func getBoardListProviders(in info: DropInfo) -> [NSItemProvider] {
        getItemProviders(for: BoardList.typeIdentifier, in: info)
    }
    
    private func getCardProviders(in info: DropInfo) -> [NSItemProvider] {
        getItemProviders(for: Card.typeIdentifier, in: info)
    }
    
    func dropEntered(info: DropInfo) {
        guard
            !getBoardListProviders(in: info).isEmpty,
            let activeList = activeList,
            targetList != activeList,
            let fromIndex = lists.firstIndex(of: activeList),
            let toIndex = lists.firstIndex(of: targetList) else {
                return
            }
        lists.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        if !getCardProviders(in: info).isEmpty {
            return DropProposal(operation: .copy)
        } else if !getBoardListProviders(in: info).isEmpty {
            return DropProposal(operation: .move)
        }
        return nil
    }
    
    func performDrop(info: DropInfo) -> Bool {
        let cardProviders = getCardProviders(in: info)
        for cardProvider in cardProviders {
            cardProvider.loadObject(ofClass: Card.self) { item, _ in
                guard let card = item as? Card,
                      card.boardListId != targetList.id
                else { return }
                DispatchQueue.main.async {
                    board.move(card: card, to: targetList, at: 0)
                }
            }
        }
        self.activeList = nil
        return true
    }
}

//
//  CardView.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 7.04.2024.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var boardList: BoardList
    @StateObject var card: Card
    
    var body: some View {
        HStack {
            Text(card.content).lineLimit(3)
            Spacer()
            Menu {
                Button("Güncelle") { handleEditCard() }
                Button("Sil", role: .destructive) {
                    boardList.removeCard(card)
                }
            } label: {
                Image(systemName: "ellipsis.rectangle")
                    .imageScale(.small)
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(4)
        .shadow(radius: 1, y: 1)
    }
    
    private func handleEditCard() {
        presentAlertTextField(title: "Kartı Düzenle", defaultTextFieldText: card.content) { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            card.content = text
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    @StateObject static var boardList = Board.stub.lists[0]
    
    static var previews: some View {
        CardView(boardList: boardList, card: boardList.cards[0])
            .previewLayout(.sizeThatFits)
            .frame(width: 300)
    }
}

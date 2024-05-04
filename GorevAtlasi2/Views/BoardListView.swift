//
//  BoardListView.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 7.04.2024.
//

import SwiftUI

struct BoardListView: View {
    
    @ObservedObject var board: Board
    @StateObject var boardList: BoardList
    
    @State var listHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
            listView
                .frame(maxHeight: listHeight)
            
            Button("+ Kart Ekle") {
                handleAddCard()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding(.vertical)
        .background(boardListBackgroundColor)
        .frame(width: 300)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(boardList.name)
                .font(.headline)
                .lineLimit(2)
                .padding(8)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(8)
            
            Spacer()
            
            Menu {
                Button("İsim Değiştir") {
                    handleBoardListRename()
                }
                
                Button("Sil", role: .destructive) {
                    board.removeBoardList(boardList)
                }
                
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }
        }
        .padding(.horizontal)
    }
    
    private var listView: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(boardList.cards) { card in
                    CardView(boardList: boardList, card: card)
                        .onDrag {
                            NSItemProvider(object: card)
                        }
                }
                .onDelete { indexSet in
                    boardList.cards.remove(atOffsets: indexSet)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                .listRowBackground(Color.clear)
            }
            .onAppear {
                listHeight = calculateListHeight()
            }
        }
    }
    
    private func calculateListHeight() -> CGFloat {
        let cardHeight = CGFloat(100) // Assuming a fixed height for each card
        return CGFloat(boardList.cards.count) * cardHeight
    }
    
    private func handleBoardListRename() {
        // Implement renaming logic
    }
    
    private func handleAddCard() {
        // Implement add card logic
    }
    
}

struct BoardListView_Previews: PreviewProvider {
    
    @StateObject static var board = Board.stub
    
    static var previews: some View {
        BoardListView(board: board, boardList: board.lists[0])
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 512)
    }
}

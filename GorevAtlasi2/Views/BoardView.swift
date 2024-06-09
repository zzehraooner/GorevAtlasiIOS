import SwiftUI

let boardListBackgroundColor = Color(uiColor: UIColor(red: 0.92, green: 0.92, blue: 0.94, alpha: 1))
let trelloBlueBackgroundColor = Color(uiColor: UIColor(red: 0.2, green: 0.47, blue: 0.73, alpha: 1))

struct BoardView: View {
    
    @StateObject private var board = Board.stub
    @State private var dragging: BoardList?
    @State private var scrollToId: UUID? = nil
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                ScrollViewReader { proxy in
                    HStack(spacing: 0) {
                        ForEach(board.lists) { boardList in
                            BoardListView(board: board, boardList: boardList)
                                .id(boardList.id)
                                .onDrag {
                                    self.dragging = boardList
                                    return NSItemProvider(object: boardList)
                                }
                                .onDrop(of: [Card.typeIdentifier, BoardList.typeIdentifier], delegate: BoardDropDelegate(board: board, boardList: boardList, lists: $board.lists, current: $dragging))
                                .frame(width: 300)
                                .background(boardListBackgroundColor)
                                .cornerRadius(8)
                                .padding(.trailing, 8)
                                .onAppear {
                                    if boardList.id == scrollToId {
                                        withAnimation {
                                            proxy.scrollTo(boardList.id, anchor: .leading)
                                        }
                                        scrollToId = nil
                                    }
                                }
                        }
                        
                        Button("+ Liste Ekle") {
                            handleOnAddList(proxy: proxy)
                        }
                        .padding()
                        .frame(width: 300)
                        .background(boardListBackgroundColor.opacity(0.8))
                        .cornerRadius(8)
                        .foregroundColor(.black)
                    }
                    .padding()
                }
            }
            .animation(.default, value: board.lists)
            .background(trelloBlueBackgroundColor)
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle(board.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("İsmi Değiştir") {
                    handleRenameBoard()
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            if let loadedBoard = BoardDiskRepository().loadFromDisk() {
                board = loadedBoard
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            BoardDiskRepository().saveToDisk(board: board)
        }
    }
    
    private func handleOnAddList(proxy: ScrollViewProxy) {
        presentAlertTextField(title: "Liste Ekle") { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            board.addNewBoardListWithName(text)
            DispatchQueue.main.async {
                scrollToId = board.lists.last?.id
            }
        }
    }
    
    private func handleRenameBoard() {
        presentAlertTextField(title: "Çalışma Alanı İsmi Değiştir", defaultTextFieldText: board.name) { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            board.name = text
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}

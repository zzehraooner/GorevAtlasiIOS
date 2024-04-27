//
//  Board+Stub.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 7.04.2024.
//

import Foundation

extension Board {
    
    static var stub: Board {
        let board = Board(name: "Çalışma Alanı")
        let backlogBoardList = BoardList(name: "Projeler", boardID: board.id)
        let backlogCards = [
            "Fonksiyonel Programlama Projesini Bitir",
            "Ağ Programlama Projesini Bitir",
            "Web Tasarım Projesini Bitir",
            "Bitirme Projesini Bitir",
            "Yapay Zeka Projesini Bitir",
            "Görüntü İşleme Projesini Bitir"
        ].map { Card(content: $0, boardListId: backlogBoardList.id) }
        backlogBoardList.cards = backlogCards
        
        let todoBoardList = BoardList(name: "Vize", boardID: board.id)
        let todoCards = [
            "Fonksiyonel Programlama Çalış",
            "Web Tasarım Çalış"
        ].map { Card(content: $0, boardListId: todoBoardList.id) }
        todoBoardList.cards = todoCards
        
        
        let inProgressBoardList = BoardList(name: "Aktif Görev", boardID: board.id)
        let inProgressCards = ["Yapay Zeka Çalış"].map { Card(content: $0, boardListId: inProgressBoardList.id) }
        inProgressBoardList.cards = inProgressCards
        
        
        let doneBoardList = BoardList(name: "Tamamlananlar", boardID: board.id)
        board.lists = [
            backlogBoardList,
            todoBoardList,
            inProgressBoardList,
            doneBoardList
        ]
        
        return board
    }
}

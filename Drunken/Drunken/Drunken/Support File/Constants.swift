//
//  Constants.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

enum Constants {
    enum Title {
        static let setting = "Setting"
    }

    enum Button {
        static let random = "Random"
        static let cancel = "Cancel"
        static let submit = "Submit"
        static let reset = "Reset"
        static let restart = "Restart"
    }

    enum Text {
        static let enterNewCommand = "Enter new command."
        static let editCommand = "Edit Command"
        static let restartGameAlert = "Would you like to restart the game?"
        static let gameEnd = "Game End"
        static let alert = "Alert"
    }

    enum CardDeck {
        static let cards = [
            "2", "22", "222", "2222",
            "3", "33", "333", "3333",
            "4", "44", "444", "4444",
            "5", "55", "555", "5555",
            "6", "66", "666", "6666",
            "7", "77", "777", "7777",
            "8", "88", "888", "8888",
            "9", "99", "999", "9999",
            "0", "00", "000", "0000",
            "J", "JJ", "JJJ", "JJJJ",
            "Q", "QQ", "QQQ", "QQQQ",
            "K", "KK", "KKK", "KKKK",
            "A", "AA", "AAA", "AAAA"
        ]

        static let kingCards = ["K", "KK", "KKK", "KKKK"]
    }

    enum Command {
      static let command2 = "กินครึ่งแก้ว"
      static let command3 = "คนทางซ้ายกิน"
      static let command4 = "คนทางขวากิน"
      static let command5 = "เลือกใครเป็นบัดดี้ก็ได้\nหรือ\nยกเลิกการเป็นบัดดี้"
      static let command6 = "เลือกหมวดหมู่มา 1 หมวด\nใครตอบผิด ตอบซ้ำ\nตอบไม่ได้ กินหมดแก้ว"
      static let command7 = "เลือกตัวเลขมา 1 ตัว\nห้ามพูดเลขที่มีเลขที่เลือก\nหรือหารด้วยตัวเลขที่เลือกลงตัว"
      static let command8 = "เก็บการ์ดนี้ไว้\nเมื่อใช้จะสามารถไปเข้าห้องน้ำได้\nใช้ตอนไหนก็ได้"
      static let command9 = "ทำท่าจับคางตอนไหนก็ได้\nแล้วให้คนอื่นทำตาม\nใครทำคนสุดท้าย กินหมดแก้ว"
      static let command10 = "สร้างคำขึ้นมา 1 คำ ห้ามพูดคำนี้\nจนกว่าเกมจะจบ"
      static let commandJ = "เลือกใบ้ใครก็ได้ 1 คน\n(จะยกเลิกเมื่อมีคนคุยด้วย)"
      static let commandQ = "สั่งใครกินก็ได้"
      static let commandK = "K ใบแรก: สั่งว่าให้ทำไร\nK ใบสอง: จำนวนเท่าไร\nK ใบสาม: ทำที่ไหน\nK ใบสี่: ให้ใครทำ"
      static let commandA = "กินหมดแก้ว"

      static let commandArray = [
        UserDefaultManager.shared.getCommand2(),
        UserDefaultManager.shared.getCommand3(),
        UserDefaultManager.shared.getCommand4(),
        UserDefaultManager.shared.getCommand5(),
        UserDefaultManager.shared.getCommand6(),
        UserDefaultManager.shared.getCommand7(),
        UserDefaultManager.shared.getCommand8(),
        UserDefaultManager.shared.getCommand9(),
        UserDefaultManager.shared.getCommand10(),
        UserDefaultManager.shared.getCommandJack(),
        UserDefaultManager.shared.getCommandQueen(),
        UserDefaultManager.shared.getCommandKing(),
        UserDefaultManager.shared.getCommandAce()
      ]

        static let commandTitleArray = [
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "J",
            "Q",
            "K",
            "A",
        ]
    }

    static var aboutText = "Welcome to Drunken!, the ultimate party game for friends who love a little chaos with their drinks! Whether you’re sipping cocktails, chugging beer, or savoring mocktails, this game brings laughter, challenges, and unforgettable moments.\n\nGather your crew, raise your glasses, and get ready for wild dares, tricky trivia, and surprising twists. But remember:\n •    Play responsibly.\n •    Know your limits.\n •    And most importantly, have a blast!\n\nLet the drinks flow, the laughter roll, and may the best player remain standing (or at least upright)! Cheers! 🥂🎮"
}

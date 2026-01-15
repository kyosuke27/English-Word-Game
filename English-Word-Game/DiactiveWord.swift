//
//  DisableWord.swift
//  English-Word-Game
//
//  Created by kyosuke on 2026/01/12.
//

import SwiftUI

struct DiactiveWord: View {
    @Binding var isBorlderColor:Bool
    let englishWord:EnglishWord?
    let isDiactiveArea:Bool = false
    var body:some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(isBorlderColor ? .white:.gray)
                .frame(width: 100,height: 100)
            if isDiactiveArea {
                Image(systemName: "xmark.circle.fill")
            }
        }
    }
}

#Preview {
    let englishWord1 = EnglishWord(id: 1, moji: "1")
    let englishWord2 = EnglishWord(id: 2, moji: "2")
    DiactiveWord(isBorlderColor:  .constant(false), englishWord: englishWord1)
    DiactiveWord(isBorlderColor:  .constant(true), englishWord: englishWord2)
}

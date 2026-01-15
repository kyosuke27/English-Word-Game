import SwiftUI

struct ActiveWord: View {
    // Data Model
    let word:EnglishWord
    let acitiveColor:Color = .blue
    
    var body:some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(.blue)
                .frame(width: 100,height: 100)
                .overlay(Text(word.moji).font(.largeTitle).foregroundStyle(Color.white))
        }
    }
}

#Preview {
    let word:EnglishWord = EnglishWord(id: 1, moji: "A")
    ActiveWord(word:word)
}

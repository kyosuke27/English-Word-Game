import SwiftUI

struct ActiveWord: View {
    // Data Model
    let word:EnglishWord
    let acitiveColor:Color = .blue
    let height:CGFloat
    let width:CGFloat
    
    var body:some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    Color.extendsColors.componentColor.blueColor
                )
                .frame(width: width, height: height)
                // 下側に濃い影（落ち影）
                .shadow(color: Color.black.opacity(0.50), radius: 0, x: 0, y: 8)
                // 内側に細い枠線（エッジを立てる）
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.white.opacity(0.35), lineWidth: 3)
                )
                // テキスト
                .overlay {
                    Text(word.moji)
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1) // 文字にも軽いシャドウ
                }
        }
    }
}

#Preview {
    let word:EnglishWord = EnglishWord(id: 1, moji: "A")
    ActiveWord(word:word,height:100,width: 190)
}

import SwiftUI

struct QuestionCard: View {
    var body: some View {
        VStack{
            Text("りんご")
            Divider()
            Text("英単語を作ろう")
        }
        .frame(width:200,height:90)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    Color.extendsColors.componentColor.cardBackgroundColor
                )
                .shadow(radius: 4,x: 0,y: 6)
            
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .inset(by: 0.5)
                .stroke(Color.white.opacity(0.35), lineWidth: 3)
        )
    }
    
}

#Preview {
    QuestionCard()
}

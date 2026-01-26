import SwiftUI

struct DiactiveWord: View {
    let width:CGFloat
    let height:CGFloat
    
    var body:some View{
        //        ZStack{
        //            RoundedRectangle(cornerRadius: 5)
        //                .fill(isBorlderColor ? .white:.gray)
        //                .frame(width: side,height: side)
        //            if isDiactiveArea {
        //                Image(systemName: "xmark.circle.fill")
        //            }
        //        }
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    Color.extendedComponentColor.diactiveWordBackgroundColor
                )
                .frame(width: width, height: height)
            // 下側に濃い影（落ち影）
                .shadow(color: Color.black.opacity(0.20), radius: 0, x: 0, y: 8)
            // 内側に細い枠線（エッジを立てる）
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.white.opacity(0.35), lineWidth: 3)
                )
        }
        
    }
}

#Preview {
    DiactiveWord(width:190,height: 100)
}

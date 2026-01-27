import SwiftUI

struct BaseButton: View {
    @State var buttonTapped:Bool = false
    @State private var animateOnce: Bool = false
    let cornerAmount:CGFloat = 12
    let text:String
    var body: some View {
        VStack {
            Text("すぐ開始")
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
        }
        .background(
            LinearGradient(
                colors: [Color.extendsColors.componentColor.greenLightColor, Color.extendsColors.componentColor.greenDarkColor],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerAmount, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: cornerAmount, style: .continuous)
                .stroke(Color.extendsColors.baseColor.borderColor, lineWidth: 1)
        )
        .opacity(animateOnce ? 0.6 : 1.0)
        .scaleEffect(animateOnce ? 0.98 : 1.0)
        // ビューの変化を検知して指定されたアニメーションを実行する
        // .easeInOut:加速と減速を混ぜ合わせる
        // ゆっくり（Start）->早く->ゆっくり（End）
        .animation(.easeInOut(duration: 0.12), value: animateOnce)
        .onTapGesture {
            animateOnce = true
            // DispatchQueue.main -> mainで実行するためにキューにタスクを格納する
            // 0.12秒後にfalseにする処理を実行する
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                animateOnce = false
                print("ボタンタップ")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    BaseButton(text: "サンプル")
}

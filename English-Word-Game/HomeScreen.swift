import SwiftUI

struct AppString:Codable{
    let id:Int
    let appString:String
}


struct HomeScreen: View {
    @State var text:String = ""
    @State private var isUp = false
    var iosFileManager:IOSFileManager = FileManagerImpl()
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                NavigationLink{
                    let questions: [Question] = [
                        Question(id: 1, text: "CAT", answer: "CAT"),
                        Question(id: 2, text: "DOG", answer: "DOG"),
                        Question(id: 3, text: "SUN", answer: "SUN"),
                        Question(id: 4, text: "MOON", answer: "MOON"),
                        Question(id: 5, text: "STAR", answer: "STAR"),
                        Question(id: 6, text: "BOOK", answer: "BOOK"),
                        Question(id: 7, text: "TREE", answer: "TREE"),
                        Question(id: 8, text: "CAR", answer: "CAR"),
                        Question(id: 9, text: "BALL", answer: "BALL"),
                        Question(id: 10, text: "BIRD", answer: "BIRD"),
                        Question(id: 11, text: "FISH", answer: "FISH"),
                        Question(id: 12, text: "MILK", answer: "MILK"),
                        Question(id: 13, text: "CAKE", answer: "CAKE"),
                        Question(id: 14, text: "APPLE", answer: "APPLE"),
                        Question(id: 15, text: "BANANA", answer: "BANANA"),
                        Question(id: 16, text: "CHAIR", answer: "CHAIR"),
                        Question(id: 17, text: "TABLE", answer: "TABLE"),
                        Question(id: 18, text: "PEN", answer: "PEN"),
                        Question(id: 19, text: "MAP", answer: "MAP"),
                        Question(id: 20, text: "HAT", answer: "HAT"),
                        Question(id: 21, text: "SHOE", answer: "SHOE"),
                        Question(id: 22, text: "CUP", answer: "CUP"),
                        Question(id: 23, text: "DOOR", answer: "DOOR"),
                        Question(id: 24, text: "WATER", answer: "WATER"),
                        Question(id: 25, text: "FIRE", answer: "FIRE"),
                        Question(id: 26, text: "WIND", answer: "WIND"),
                        Question(id: 27, text: "SNOW", answer: "SNOW"),
                        Question(id: 28, text: "RAIN", answer: "RAIN"),
                        Question(id: 29, text: "CLOUD", answer: "CLOUD"),
                        Question(id: 30, text: "FLOWER", answer: "FLOWER")
                    ]
                    GameScreen(question: questions)
                    //                    .navigationBarBackButtonHidden()
                }
                label:{
                    Text("すぐ開始")
                }
                Spacer()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.extendedColor.appOrange)
            BaseButton(text:"すぐ開始")
        }
    }
}

#Preview {
    HomeScreen()
}

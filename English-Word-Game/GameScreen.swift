import SwiftUI
struct EnglishWord : Codable,Transferable,Identifiable{
    let id:Int
    let moji:String
    
    init(id: Int, moji: String) {
        self.id = id
        self.moji = moji
    }
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: EnglishWord.self, contentType: .data)
    }
}

struct GameScreen: View {
    let questions:[Question]
    @State var shuffedQuestion:[String]
    @State var nowQuestion:Question
    @State var words:[EnglishWord]
    @State var draggedWords:[EnglishWord?]
    @State var disabledTables:[Bool]
    @State var isClear:Bool?
    @State var questionCount:Int
    
    init(question:[Question]) {
        self.questions = question
        _nowQuestion = State(initialValue: questions[0])
        let shuffledString:[String] = questions[0].text.shuffled().map{String($0)}
        _shuffedQuestion = State(initialValue:shuffledString)
        let shuffledWord = shuffledString.enumerated().map{index,ch in
            EnglishWord(id: index, moji: ch)
        }
        _words = State(initialValue:shuffledWord)
        _draggedWords = State(initialValue:Array(repeating: nil, count: shuffledString.count))
        _disabledTables = State(initialValue: Array(repeating: false, count: shuffledString.count))
        _questionCount = State(initialValue:0)
    }
    
    var body: some View {
        VStack{
            if let clear =  isClear {
                Text(clear ? "正解":"不正解")
            }
            HStack {
                ForEach(words){ word in
                    ActiveWord(word: word,height: 50,width: 90)
                        .draggable(word){
                            // 移動中のデータ
                            ActiveWord(word:word,height: 50,width: 90)
                        }
                        .dropDestination(for: EnglishWord.self){ items, _ in
                            // items -> 移動中のアイテム
                            guard let draggedItem = items.first else {return false}
                            
                            moveCharater(word: draggedItem, target:word)
                            return true
                        }
                }
            }
            .padding()
            HStack {
            }
            .padding()
            .onAppear{
                if disabledTables.count != words.count{
                    disabledTables = Array(repeating: false, count: words.count)
                }
            }
            
            HStack{
                Button {
                    resetAll()
                } label: {
                    Text("リセット")
                        .padding()
                        .background(Color.extendedComponentColor.blueColor)
                        .foregroundStyle(Color.white.opacity(0.8))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 8)
                        )
                    
                }
                Button {
                    // 決定処理
                    checkQuizAnswer(draggedWords: draggedWords)
                } label: {
                    Text("決定！")
                        .padding()
                        .background(Color.pink.opacity(0.5))
                        .foregroundStyle(Color.white.opacity(0.8))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 8)
                        )
                    
                }
            }
            
            Button  {
                nextQuestion(nextindex: self.questionCount+1)
            } label: {
                Text("次の問題")
            }
            
        }
        
    }
    
    private func resetAll(){
        let shuffledWord = shuffedQuestion.enumerated().map{index,ch in
            EnglishWord(id: index, moji: ch)
        }
        self.words = shuffledWord
        self.draggedWords = Array(repeating: nil, count: shuffedQuestion.count)
        self.disabledTables = Array(repeating: false, count: shuffedQuestion.count)
        self.isClear = nil
        self.questionCount = 0
    }
    
    private func checkQuizAnswer(draggedWords:[EnglishWord?]){
        var answer:String = ""
        for word in draggedWords{
            if let w  = word?.moji{
                answer += w
            }
        }
        if answer == self.nowQuestion.answer{
            self.isClear = true
        }else{
            self.isClear = false
        }
    }
    
    // Delete DisableWord Area Character
    private func deleteCharacter(word:[EnglishWord],target:EnglishWord){
        if let id = words.firstIndex(where: { $0.id == target.id }){
            words.remove(at: id)
        }else{
            return
        }
    }
    
    private func nextQuestion(nextindex:Int){
        if(self.questions.count<=nextindex){
            return
        }
        self.questionCount = nextindex
        self.nowQuestion = questions[nextindex]
        self.shuffedQuestion = nowQuestion.text.shuffled().map{String($0)}
        let shuffledWord = shuffedQuestion.enumerated().map{index,ch in
            EnglishWord(id: index, moji: ch)
        }
        self.words = shuffledWord
        self.draggedWords = Array(repeating: nil, count: shuffedQuestion.count)
        self.disabledTables = Array(repeating: false, count: shuffedQuestion.count)
        self.isClear = nil
    }
    
    
    private func moveCharater(word:EnglishWord,target : EnglishWord){
        // fromInex : 移動前の単語要素
        // toIndex : 移動後の単語要素
        // 移動中の要素と移動対象の要素が異なる
        // 移動前の単語がwords要素の中に存在
        // 移動後の単語がwords要素の中に存在
        guard word.id != target.id,
              let fromIndex = words.firstIndex(where: {$0.id == word.id}),
              let toIndex = words.firstIndex(where: {$0.id == target.id})
        else {
            return
        }
        withAnimation {
            let item = words.remove(at: fromIndex)
            words.insert(item, at: toIndex)
        }
    }
}


#Preview {
    let questions:[Question] = [Question(id: 1, text: "CAT", answer: "CAT")]
    GameScreen(question: questions)
}

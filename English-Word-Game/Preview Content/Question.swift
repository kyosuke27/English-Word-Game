struct Question:Codable,Identifiable{
    let id:Int
    let text:String
    let answer:String
    
    init(id: Int, text: String, answer: String) {
        self.id = id
        self.text = text
        self.answer = answer
    }
    
}

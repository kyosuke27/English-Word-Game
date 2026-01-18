import Foundation

protocol IOSFileManager{
    func getData<T:Codable>(fileName:String)->T
    func saveData<T:Codable>(fileName:String,data:T)->Void
}



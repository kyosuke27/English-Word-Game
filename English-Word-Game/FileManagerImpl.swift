import Foundation

struct FileManagerImpl:IOSFileManager{
    func getData<T:Codable>(fileName:String) -> T {
        guard let fileManager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            // urlが取得できない場合はエラーとして出力
            fatalError()
        }
        let url = fileManager.appendingPathComponent(fileName)
        
        guard FileManager.default.fileExists(atPath: url.path) else{
            // ファイルが見つからない場合には一旦エラーとする
            fatalError()
        }
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self,from: data)
        }catch{
            fatalError()
        }
        
    }
    
    func saveData<T:Codable>(fileName:String,data: T) {
        guard let fileManager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{
            fatalError()
        }
        let url = fileManager.appendingPathComponent(fileName)
        do{
            let encodedData = try JSONEncoder().encode(data)
            try encodedData.write(to: url, options: [.atomic])
        }catch{
            fatalError()
        }
    }
}

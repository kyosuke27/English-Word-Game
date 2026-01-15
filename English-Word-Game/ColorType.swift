import SwiftUI

struct BaseColor{
    let appPurple:Color
    let appPink:Color
    let appOrange:Color
    let appYello:Color
    
}

extension Color{
    // インスタンスではなく、型メソッドとして定義する
    static func rgb(r:Double,g:Double,b:Double,a:Double = 1.0)->Color{
        Color(.sRGB,
              red: r/255,
              green: g/255,
              blue: b/255,
              opacity: a)
    }
    static let extendedColor = BaseColor(
        appPurple : Color.rgb(r: 183, g: 177, b: 242),
        appPink : Color.rgb(r: 183, g: 177, b: 242),
        appOrange : Color.rgb(r: 183, g: 177, b: 242),
        appYello : Color.rgb(r: 183, g: 177, b: 242)
    )
}

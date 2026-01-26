import SwiftUI

struct BaseColor{
    let mainGreen:Color
    let appOrange:Color
    let appYello:Color
    let borderColor:Color
    
}

struct ComponentColor{
    let greenLightColor:Color
    let greenDarkColor:Color
    let blueColor:Color
    let cardBackgroundColor:Color
    let diactiveWordBackgroundColor:Color
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
        mainGreen: Color.rgb(r: 92, g: 175, b: 89),
        appOrange : Color.rgb(r: 251, g: 243, b: 185),
        appYello : Color.rgb(r: 183, g: 177, b: 242),
        borderColor: Color.rgb(r: 213, g: 220, b: 222)
    )
    
    static let extendedComponentColor = ComponentColor(
        greenLightColor: Color.rgb(r: 103, g: 183, b: 99),
        greenDarkColor: Color.rgb(r: 72, g: 150, b: 70),
        blueColor: Color.rgb(r:81, g:135, b:227),
        cardBackgroundColor: Color.rgb(r: 243, g: 243, b: 247),
        diactiveWordBackgroundColor:Color.rgb(r: 238, g: 236, b: 248)
    )
}

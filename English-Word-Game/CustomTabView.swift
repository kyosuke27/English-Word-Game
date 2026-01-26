//
//  CustomTabBar.swift
//  English-Word-Game
//
//  Created by kyosuke on 2026/01/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var tabSelection:Int
    let tabItem:[(image:String,title:String)] = [
        ("house", "ホーム"),
        ("person", "プロフィール"),
        ("magnifyingglass", "検索")
    ]
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundStyle(Color(.secondaryLabel))
                .shadow(radius: 2)
            HStack {
                ForEach(tabItem.indices, id: \.self) { index in
                    Button {
                        tabSelection = index
                    } label: {
                        VStack(spacing: 6) {
                            Image(systemName: tabItem[index].image)
                            Text(tabItem[index].title)
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomTabBar(tabSelection: .constant(1))
        .padding(.vertical)
}

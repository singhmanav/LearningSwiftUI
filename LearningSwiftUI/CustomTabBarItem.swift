//
//  CustomTabBarItem.swift
//  LearningSwiftUI
//
//  Created by Manav on 30/12/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import SwiftUI

struct CustomTabBarItem: View {
    let iconName: String
    let label: String
    var onTap: () -> Void = {}
    let selection: Binding<Int>
    let tag: Int
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .frame(minWidth: 25, minHeight: 25)
            Text(label)
                .font(.caption)
        }.foregroundColor(fgColor())
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 5)
            .contentShape(Rectangle()) 
            .onTapGesture {
                self.selection.wrappedValue = self.tag
        }
    }
    
    private func fgColor() -> Color {
        return selection.wrappedValue == tag ? Color(UIColor.systemBlue) : Color(UIColor.systemGray)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var selection: Int = 0
    static var selectionBinding = Binding<Int>(get: { selection }, set: { selection = $0 })
    
    static var previews: some View {
        CustomTabBarItem(iconName: "clock.fill", label: "Recents", selection: selectionBinding, tag: 0)
            .previewLayout(.fixed(width: 80, height: 80))
    }
}

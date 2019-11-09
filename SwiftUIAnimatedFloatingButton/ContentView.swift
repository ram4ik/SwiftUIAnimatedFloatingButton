//
//  ContentView.swift
//  SwiftUIAnimatedFloatingButton
//
//  Created by Ramill Ibragimov on 09.11.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var open = false
    
    var body: some View {
        ZStack {
            Button(action: {self.open.toggle()}) {
                Image(systemName: "plus")
                    .rotationEffect(.degrees(open ? 45 : 0))
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                    .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
            }
            .padding(24)
            .background(Color("Pink"))
            .mask(Circle())
            .shadow(color: Color("Pink"), radius: 10)
            .zIndex(10)
            
            SecondaryButton(open: $open, icon: "bubble.left.fill", color: "Blue", offsetY: -90)
            SecondaryButton(open: $open, icon: "icloud", color: "Blue", offsetX: -60, offsetY: -60, delay: 0.1)
            SecondaryButton(open: $open, icon: "message", color: "Purple", offsetX: -90, delay: 0.2)
            SecondaryButton(open: $open, icon: "pencil.tip", color: "Purple", offsetX: -60, offsetY: 60, delay: 0.3)
            SecondaryButton(open: $open, icon: "video", color: "Green", offsetY: 90, delay: 0.4)
            SecondaryButton(open: $open, icon: "safari", color: "Green", offsetX: 60, offsetY: 60, delay: 0.5)
            SecondaryButton(open: $open, icon: "person.icloud", color: "Purple", offsetX: 90, delay: 0.6)
            SecondaryButton(open: $open, icon: "lock.icloud", color: "Purple", offsetX: 60, offsetY: -60, delay: 0.7)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondaryButton: View {
    @Binding var open: Bool
    var icon = "pencil"
    var color = "Blue"
    var offsetX =  0
    var offsetY = 0
    var delay = 0.0
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        }
        .padding()
        .background(Color(color))
        .mask(Circle())
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(Double(delay)))
        .shadow(color: Color(color), radius: 10)
    }
}

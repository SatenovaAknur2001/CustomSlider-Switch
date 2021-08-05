//
//  SwitchView.swift
//  CustomSlider
//
//  Created by Акнур on 05.08.2021.
//

import SwiftUI

struct Switch: View{
    @Binding var state: Bool
    var body: some View{
        ZStack{
            Capsule()
                .foregroundColor(!state ? .gray : .green)
                .frame(width: 32, height: 20)
                .padding()
                .layoutPriority(3)
            HStack{
                if state {
                    Spacer()
                }
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 16, height: 16)
                
                if !state {
                    Spacer()
                }
            }.frame(width: 32, height: 32)
        }
        .animation(.spring())
        .onTapGesture {
            self.state.toggle()
        }
    }
}

struct SwitchView: View {
    
    @State var isOn = false
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            Switch(state: $isOn)
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}

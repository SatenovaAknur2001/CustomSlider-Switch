//
//  ContentView.swift
//  CustomSlider
//
//  Created by Акнур on 05.08.2021.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var slider = CustomSlider(start: 10, end: 100)
    
    var body: some View {
        VStack{
            HStack(spacing: 190) {
//            Text(" " + slider.valueBetween)
                            Text(" \(slider.lowHandle.currentValue)")
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.6745098039, blue: 0.6901960784, alpha: 1)))
//            Text("Percentages: " + slider.percentagesBetween)
//
            Text(" \(slider.highHandle.currentValue)")
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.6745098039, blue: 0.6901960784, alpha: 1)))
//            Text("Low Value: \(slider.lowHandle.currentValue)")
        
            //Slider
        }
            SliderView(slider: slider)
    }
       
    }
}

struct SliderView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        RoundedRectangle(cornerRadius: slider.lineWidth)
            .fill(Color.gray.opacity(0.2))
            .frame(width: slider.width, height: slider.lineWidth)
            .overlay(
                ZStack {
                    //Path between both handles
                    SliderPathBetweenView(slider: slider)
                    
                    //Low Handle
                    SliderHandleView(handle: slider.lowHandle)
                        .highPriorityGesture(slider.lowHandle.sliderDragGesture)
                    
                    //High Handle
                    SliderHandleView(handle: slider.highHandle)
                        .highPriorityGesture(slider.highHandle.sliderDragGesture)
                }
            )
    }
}

struct SliderHandleView: View {
    @ObservedObject var handle: SliderHandle
    
    var body: some View {
        Circle()
            .frame(width: handle.diameter, height: handle.diameter)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
            .scaleEffect(handle.onDrag ? 1.2 : 1)
            .contentShape(Rectangle())
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
    }
}

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.green, lineWidth: slider.lineWidth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

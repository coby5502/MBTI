//
//  SliderView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/05/01.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.8
            let radius = gr.size.height * 0.5
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbSize
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(.gray)
                HStack {
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: self.value)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = self.value
                                    }
                                    if v.translation.width > 0 {
                                        self.value = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                    } else {
                                        self.value = max(minValue, self.lastCoordinateValue + v.translation.width)
                                    }
                                    
                                }
                        )
                    Spacer()
                }
            }
        }
    }
}

//
//  LottieView.swift
//  AuthenticationProject
//
//  Created by Thiago Lourenço on 13/03/24.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return animationView
    }
}

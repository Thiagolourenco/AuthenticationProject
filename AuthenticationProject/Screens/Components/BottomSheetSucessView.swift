//
//  BottomSheetSucessView.swift
//  AuthenticationProject
//
//  Created by Thiago Lourenço on 13/03/24.
//

import SwiftUI

struct BottomSheetSucessView: View {
    var naivagationSuccess: () -> Void
    
    var body: some View {
        VStack {
            LottieView(animationFileName: "success", loopMode: .loop)
                .scaleEffect(0.2)
                .frame(width: 100, height: 100)
                
            Text("Cadastro realizado com Sucesso!!!")
                .font(.title)
                .padding(.top)
                .multilineTextAlignment(.center)
            Text("Parabéns!! Aproveite nosso App")
                .font(.title2)
                .padding(.top, 2)
                .multilineTextAlignment(.center)
                
          
            Button {
                naivagationSuccess()
            } label: {
                Text("Ir para Login")
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .background(Color("ButtonColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black, radius: 2)
            }
            .padding(.top)
        }
    }
}

#Preview {
   
    BottomSheetSucessView {
        
    }
}

//
//  SignUpView.swift
//  AuthenticationProject
//
//  Created by Thiago Lourenço on 13/03/24.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var isChecked: Bool = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack {
                    LottieView(animationFileName: "animationLogin", loopMode: .loop)
                        .scaleEffect(0.6)
                        .frame(width: 100, height: 100)
                }
                        
                
                Spacer()
                Text("Become a member")
                    .font(.title)
                    .bold()
                    .padding(.top, 32)
                
                
                VStack(alignment: .leading) {
                    
                    Text("Your name")
                        .font(.caption2)
                        .foregroundStyle(.gray.opacity(0.6))

                    
                    HStack {
                        TextField(text: $email) {
                            Text("Enter your name")
                                .font(.caption2)
                            
                        }
                        .font(.caption2)
                        .foregroundStyle(.black.opacity(0.6))
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                        .padding(.leading, 8)
                        
                        Image(systemName: "person")
                            .foregroundStyle(.gray)
                            .padding(.trailing, 8)
                    }
                    .frame(width: 300, height: 40)
                    .background(.gray.opacity(0.1))
                    .border(Color.gray.opacity(0.2), width: 1)
                    .cornerRadius(6)
              
                }
                .padding(.top, 16)

                
                VStack(alignment: .leading) {
                    
                    Text("E-mail address")
                        .font(.caption2)
                        .foregroundStyle(.gray.opacity(0.6))

                    
                    HStack {
                        TextField(text: $email) {
                            Text("Enter your email")
                                .font(.caption2)
                            
                        }
                        .font(.caption2)
                        .foregroundStyle(.black.opacity(0.6))
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                        .padding(.leading, 8)
                        
                        Image(systemName: "envelope")
                            .foregroundStyle(.gray)
                            .padding(.trailing, 8)
                    }
                    .frame(width: 300, height: 40)
                    .background(.gray.opacity(0.1))
                    .border(Color.gray.opacity(0.2), width: 1)
                    .cornerRadius(6)
              
                }
                .padding(.top, 8)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.caption2)
                        .foregroundStyle(.gray.opacity(0.6))
                
                    HStack {
                        SecureField(text: $password) {
                            Text("Enter your password")
                                .font(.caption2)
                            
                        }
                        .font(.caption2)
                        .foregroundStyle(.black.opacity(0.6))
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                        .padding(.leading, 8)
                        
                        Image(systemName: "eye")
                            .foregroundStyle(.gray)
                            .padding(.trailing, 8)
                    }
                    .frame(width: 300, height: 40)
                    .background(.gray.opacity(0.1))
                    .border(Color.gray.opacity(0.2), width: 1)
                    .cornerRadius(6)
                }
                .padding(.top, 6)
              
                HStack {
                    Button {
                        
                    } label: {
                        Image("google")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray.opacity(0.1))
                                    .border(.gray.opacity(0.2), width: 0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                    }
                    
                    Button {
                        
                    } label: {
                            Image("facebook")
                            .resizable(capInsets: EdgeInsets(.zero))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.gray.opacity(0.1))
                                        .border(.gray.opacity(0.2), width: 0.5)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                )

                            
                        
                    }
                    .padding(.leading, 32)
                    .padding(.trailing, 32)
                    
                    Button {
                        
                    } label: {

                        Image(systemName: "apple.logo")
                            .resizable()
                            .frame(width: 20, height: 24)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray.opacity(0.1))
                                    .border(.gray.opacity(0.2), width: 0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                    }
                }
                .padding(.top, 32)
                
                Button {
                    print("Login")
                } label: {
                    HStack {
                        Text("Create an account")
                            .font(.callout)
                            .foregroundStyle(.white)
                            .bold()
                        Image(systemName: "arrow.forward")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("ButtonColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black, radius: 2)

                }
                .padding(.top, 32)
                
                Button {
                    mode.wrappedValue.dismiss()
                }label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.caption2)
                            .foregroundStyle(Color("ButtonColor"))
                            .fontWeight(.semibold)
                        Text("Sign in.")
                            .font(.caption2)
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 4)
                }

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
}

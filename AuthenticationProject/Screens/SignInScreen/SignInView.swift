//
//  SignInView.swift
//  AuthenticationProject
//
//  Created by Thiago Lourenço on 12/03/24.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isChecked: Bool = false
    @State private var isLoading: Bool = false
    @AppStorage("isSign") private var isSign: Bool = true
    
    var body: some View {
        NavigationStack() {
            VStack {
                Spacer()
                
                VStack {
                    LottieView(animationFileName: "animationLoginTwo", loopMode: .loop)
                        .scaleEffect(0.095)
                        .frame(width: 100, height: 100)
                }
                        
                
                Spacer()
                Text("Welcome back!")
                    .font(.title)
                    .bold()
                
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
                .padding(.top, 16)
                
                VStack() {
                    HStack {
                        Text("Password")
                            .font(.caption2)
                            .foregroundStyle(.gray.opacity(0.6))
                        Spacer()
                        Text("Forgot password?")
                            .font(.caption2)
                            .foregroundStyle(.black.opacity(0.6))
                            .underline()

                    }
                    .padding(.leading, 46)
                    .padding(.trailing, 46)
               

                    
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
                
                Button {
                    isChecked.toggle()
                } label: {
                    HStack() {
                        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                
                        Text("Remember me")
                            .font(.caption)
                            .foregroundStyle(.black)
                    }
                }
                .padding([.top], 6)
                .padding([.leading], -146)
                
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
                .padding(.top)
                
                Spacer()
                Button {
                    isLoading = true
                    
                    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                        isLoading = false
                        if let error = error as? NSError {
                            print("Deu Ruim")
                        } else {
                            let userInfo = Auth.auth().currentUser
                            
                            isSign = true
                            print("User Info", userInfo?.email)
                        }
                        
                    }
                } label: {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text("Log in")
                                .font(.callout)
                                .foregroundStyle(.white)
                                .bold()
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(.white)
                          
                        }
                     
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("ButtonColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black, radius: 2)

                }
                .disabled(isLoading)
              
                
                
                
                
                NavigationLink {
                    SignUpView()
                        .transition(.move(edge: .top))
                } label: {
                    HStack {
                        Text("Don't have an account ?")
                            .font(.caption2)
                            .foregroundStyle(Color("ButtonColor"))
                            .fontWeight(.semibold)
                        Text("Sign up now")
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
    SignInView()
}

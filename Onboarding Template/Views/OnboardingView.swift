//
//  OnboardingView.swift
//  Schedule Manager
//
//  Created by Stanley Moukh on 7/10/21.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var onBoarding : Bool
    @State private var step = 1
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing: 30){
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.black))
                    .padding(.top)
                Text("Welcome to this app")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 50, alignment: .center)
                    .lineLimit(nil)
                    .foregroundColor(Color(UIColor.black))
                GeometryReader{ gp in
                    HStack{
                        VStack(spacing : 40){
                            Image("first")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            Text("text")
                                .padding()
                                .animation(Animation.interpolatingSpring( stiffness: 40, damping: 7).delay(0.1))
                            
                        }.frame(width: gp.frame(in: .global).width)
                        VStack(spacing : 40){
                            Image("second")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            Text("text")
                                .padding()
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .animation(Animation.interpolatingSpring( stiffness: 40, damping: 7).delay(0.1))
                            
                        }.frame(width: gp.frame(in: .global).width)
                        VStack(spacing : 40){
                            Image("third")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            Text("text")
                                .padding()
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .animation(Animation.interpolatingSpring( stiffness: 40, damping: 7).delay(0.1))
                            
                        }.frame(width: gp.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(UIColor.lightGray))
                    .font(.title)
                    .frame(width: gp.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity)
                    .offset(x : step == 1 ? 0 : step == 2 ? -gp.frame(in: .global).width
                                : -gp.frame(in: .global).width * 2)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                    
                }
                HStack(spacing : 20){
                    Button(action : {self.step = 1}){
                        ButtonContent(number: "1")
                    }
                    Button(action : {self.step = 2}){
                        ButtonContent(number: "2")
                    }
                    Button(action : {self.step = 3}){
                        ButtonContent(number: "3")
                    }
                    
                    
                }.accentColor(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                
                Button(action :{
                    onBoarding = false
                } ){
                    Text("Continue")
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .padding(.horizontal)
                        .padding()
                        
                        .background(Capsule())
                        .opacity(step == 3 ? 1 : 0)
                        .animation(.none)
                        .scaleEffect(step == 3 ? 1 : 0.01)
                        .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10,initialVelocity: 10))
                }
                
            }
            .accentColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            
        }
    }
}


struct ButtonContent: View {
    var number : String
    var body: some View {
        Text("\(number)")
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.black)
            .cornerRadius(30)
    }
}




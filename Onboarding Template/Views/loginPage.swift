//
//  loginPage.swift
//  Schedule Manager
//
//  Created by Stanley Moukh on 7/12/21.
//

import SwiftUI


struct loginPage: View {
    @State var userName = ""
    @State var password = ""
    @State var showSheet_NewAccount: Bool = false
    @State var showSheet_ForgotPassword: Bool = false
    @State var name = ""
    @State var MobileNumber = ""
    @State var email = ""
    @State var createPassword = ""
    @State var showPassword: Bool = false
    @State var recoveryInfo = ""
    
    
    @AppStorage("stored_User") var user = "test@gmail.com"
    @AppStorage("stored_password") var pass = "1234"
    @Binding var logged: Bool
    
        var body : some View{
            VStack{
                Spacer(minLength: 0)
                Image("fourth")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .padding(.horizontal,35)
                    .padding(.vertical)
                HStack{
                    VStack(alignment: .leading, spacing: 12, content: {
                        Text("Login")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("Please sign in to continue")
                            .foregroundColor(Color.black.opacity(0.5))
                        
                    })
                    Spacer()
                }.padding()
                  
                
                HStack{
                    Image(systemName: "envelope")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    TextField("EMAIL", text: $userName)
                        .autocapitalization(.none)
                    
                }
                .padding()
                .background(Color.black.opacity(userName == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                
                HStack{
                    Image(systemName: "lock")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                    
                }
                .padding()
                .background(Color.black.opacity(userName == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.top)
                
                HStack{
                    Button(action: {
                        if validateLogin(){
                             logged = true
                        }
                    }, label: {
                        Text("Login")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.5))
                            .clipShape(Capsule())
                        
                        
                    })
                    
                    .opacity(userName != "" && password != "" ? 1 : 0.5)
                    .disabled(userName != "" && password != "" ? false : true)
        
                }.padding(.top)
                
                Button(action: {
                    showSheet_ForgotPassword = true
                }, label: {
                    Text("Forgot Password")
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.5))
                })
                .sheet(isPresented: $showSheet_ForgotPassword, content: {
                    
                    NavigationView{
                        ZStack {
                            Color(#colorLiteral(red: 0.9761987704, green: 0.9659196792, blue: 0.9664699141, alpha: 1)).ignoresSafeArea(.all)
                            VStack(spacing: 20){
                                HStack{
                                Text("Password assistance")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                                    
                                Spacer()
                                }
                                HStack{
                                Text("Enter the email adress or mobile phone number associated with your account.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .frame(width: 300, height: 50, alignment: .leading)
                                    .lineLimit(nil)
                                    .foregroundColor(Color(UIColor.black))
                                    
                                Spacer()
                                }
                                
                                VStack{
                                        TextField("Your email or mobile number",text: $recoveryInfo)
                                            
                                    Button(action: {
                                        showSheet_NewAccount = false
                                    }, label: {
                                        Text("Continue")
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .padding(.vertical)
                                            .frame(width: UIScreen.main.bounds.width - 150)
                                            .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.5))
                                            .clipShape(Capsule())
                                                
                                    })
                                    
                                }
                                .padding()
                                .background(Rectangle()
                                                .fill(Color.white)
                                                .shadow(radius: 3)
                                                .cornerRadius(15))
                                
                                
                          
                            }
                            .padding(.bottom, 75)
                            .padding(25)
                            .frame(height: 55)
                            .navigationBarTitle(Text("Forgot Password"), displayMode: .inline)
                            .foregroundColor(.black)
                            .navigationBarItems(leading : Button(action: {
                                showSheet_ForgotPassword = false
                                            }) {
                                                Text("Done").bold()
                        })
                        }
                    }
                    
                })
                HStack(spacing: 5){
                    Text("Don't have an account? ")
                        .foregroundColor(.black)
                    Button(action: {
                        showSheet_NewAccount = true
                    }, label: {
                        Text("Signup")
                            .fontWeight(.heavy)
                            .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.5))
                        
                    })
                    .sheet(isPresented: $showSheet_NewAccount, content: {
                        
                        NavigationView{
                            ZStack {
                                Color(#colorLiteral(red: 0.9761987704, green: 0.9659196792, blue: 0.9664699141, alpha: 1)).ignoresSafeArea(.all)
                                VStack(spacing: 20){
                                    HStack{
                                    Text("Welcome")
                                        .font(.title)
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                    Spacer()
                                    }
                                    VStack{
                                            TextField("Name",text: $name)
                                                .textFieldStyle(MyTextFieldStyle())
                                            TextField("Email",text: $email)
                                                .textFieldStyle(MyTextFieldStyle())
                                                
                                            TextField("Mobile number",text: $MobileNumber)
                                                .textFieldStyle(MyTextFieldStyle())
                                                
                                        CheckView(showPassword: $showPassword,password: $createPassword, title: "Show password")
                                        
                                        Button(action: {
                                            showSheet_NewAccount = false
                                        }, label: {
                                            Text("Continue")
                                                .fontWeight(.heavy)
                                                .foregroundColor(.black)
                                                .padding(.vertical)
                                                .frame(width: UIScreen.main.bounds.width - 150)
                                                .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.5))
                                                .clipShape(Capsule())
                                                    
                                        })
                                        
                                    }
                                    .padding()
                                    .background(Rectangle()
                                                    .fill(Color.white)
                                                    .shadow(radius: 3)
                                                    .cornerRadius(15))
                                    
                                    
                              
                                }
                                .padding(.bottom, 75)
                                .padding(25)
                                .frame(height: 55)
                                .navigationBarTitle(Text("Create Account"), displayMode: .inline)
                                .foregroundColor(.black)
                                .navigationBarItems(leading : Button(action: {
                                    showSheet_NewAccount = false
                                                }) {
                                                    Text("Done").bold()
                            })
                            }
                        }
                        
                    })
                }
                .padding(.vertical)
                
            }
            .animation(.easeOut)
        }
        
        func validateLogin() -> Bool{
            if (userName == user && password == pass){
                return true
            }
            return false
        }
            
        
    }
struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}



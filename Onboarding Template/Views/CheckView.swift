//
//  CheckView.swift
//  Schedule Manager
//
//  Created by Stanley Moukh on 7/14/21.
//

import SwiftUI

struct CheckView: View {
    @State var isChecked:Bool = false
    @Binding var showPassword: Bool
    @Binding var password: String
    
        var title:String
        func toggle(){isChecked = !isChecked}
        var body: some View {
            VStack {
                if showPassword {
                    TextField("Password", text: $password)
                        .textFieldStyle(MyTextFieldStyle())
                } else {
                    SecureField("Password", text: $password)
                        .textFieldStyle(MyTextFieldStyle())
                    
                }
                HStack {
                    Button(action: {
                        isChecked.toggle()
                        self.showPassword.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text(title)
                        }
                })
                    Spacer()
                }
                

            }

        }
}



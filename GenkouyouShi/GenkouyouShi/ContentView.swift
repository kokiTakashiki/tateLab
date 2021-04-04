//
//  ContentView.swift
//  GenkouyouShi
//
//  Created by 武田孝騎 on 2021/02/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var editing = "非入力中です。"
    @State private var showAlert = false

    let windowWid = UIScreen.main.bounds.width
    let windowhgt = UIScreen.main.bounds.height
    
    var body: some View {
        Text("Hello, world!")
        VStack {
            HStack {
                TextField("5文字以上入力してください。", text: $text, onEditingChanged: { isBegin in
                    if isBegin {
                        self.editing = "入力中です。"
                    } else {
                        self.editing = "非入力中です。"
                    }
                }, onCommit: {
                    if self.text.count < 5 {
                        self.showAlert = true
                    }
                })
                .keyboardType(.default)
                .frame(width: UIScreen.main.bounds.width, height: 500.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                //.padding(32)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("エラー"), message: Text("5文字以上入力されていません。"), dismissButton: .default(Text("OK")))
                }
            }
            Text(self.editing)
            Text("入力文字数：\(self.text.count) 文字")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 2388.0, height: 1668.0))
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

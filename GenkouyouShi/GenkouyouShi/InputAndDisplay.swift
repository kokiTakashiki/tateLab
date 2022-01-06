//
//  InputAndDisplay.swift
//  GenkouyouShi
//
//  Created by 武田孝騎 on 2021/03/06.
//

import SwiftUI

struct InputAndDisplay: View {
    @State var text: String = "テスト文字"

    let windowWid = UIScreen.main.bounds.width
    let windowhgt = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            
            // 表示
            Text(text)
                .foregroundColor(.orange)
                //.lineLimit(nil)
                //.padding(5)
                .frame(width: windowWid * 0.45, height: windowhgt * 0.8)//, alignment: .topLeading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 5)
                )
                //.padding(.trailing, 500.0)
            // 入力
            MultilineTextField(text: $text)
                .frame(width: windowWid * 0.45, height: windowhgt * 0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 5)
                )
                //.padding(.trailing, -1000.0)
        }
    }
}

// 複数行入力するためのTextField
struct oriMultilineTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UITextViewDelegate {

        var parent: oriMultilineTextField

        init(_ textView: oriMultilineTextField) {
            self.parent = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

struct InputAndDisplay_Previews: PreviewProvider {
    static var previews: some View {
        InputAndDisplay()
            //.previewLayout(.fixed(width: 2388.0, height: 1668.0))
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

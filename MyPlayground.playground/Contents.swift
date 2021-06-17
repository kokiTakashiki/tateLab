import SwiftUI
import PlaygroundSupport

struct MultilineField: UIViewRepresentable {
    @Binding var text: String

    let onEditingChanged: (Bool) -> Void

    init(text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = {_ in}) {
        self._text = text
        self.onEditingChanged = onEditingChanged
    }

    func makeCoordinator() -> MultilineFieldCoordinator {
        MultilineFieldCoordinator(target: self, onEditingChanged: onEditingChanged)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = text
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        if textView.text != text {
            textView.text = text
        }
    }
}

class MultilineFieldCoordinator : NSObject, UITextViewDelegate {
    let target: MultilineField
    let onEditingChanged: (Bool) -> Void

    init(target: MultilineField, onEditingChanged: @escaping (Bool) -> Void = {_ in}) {
        self.target = target
        self.onEditingChanged = onEditingChanged
    }

    func textViewDidChange(_ textView: UITextView) {
        target.text = textView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        onEditingChanged(true)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        onEditingChanged(false)
    }
}

struct ContentView: View {
    @State var content = ""

    var body: some View {
        VStack {
            MultilineField(text: $content, onEditingChanged: update)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0))))
                .padding()
            Text(content)
        }
    }

    func update(changed: Bool) {
        guard !changed else { return }
        //document.content = content
        //document.updateChangeCount(.done)
    }
}

PlaygroundPage.current.setLiveView(ContentView(content: """
千早ぶる神代もきかず龍田川
からくれなゐに水くくるとは
"""))

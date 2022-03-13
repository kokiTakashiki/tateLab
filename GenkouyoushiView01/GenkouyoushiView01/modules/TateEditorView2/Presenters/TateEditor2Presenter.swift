//
//  TateEditor2Presenter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/03/13.
//

import Foundation

@MainActor
protocol TateEditor2EventHandler: AnyObject {
    func viewDidLoad() async
}

protocol TateEditor2InteractorOutput: AnyObject {
}

@MainActor
final class TateEditor2Presenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: TateEditor2UserInterface
    private let router: TateEditor2RouterInput

    // MARK: Computed Instance Properties

    // MARK: Initializers

    init(view: TateEditor2UserInterface,
         router: TateEditor2RouterInput
    ) {
        self.view = view
        self.router = router
    }

    // MARK: Other Private Methods

}

extension TateEditor2Presenter: TateEditor2EventHandler {
    func viewDidLoad() async {
        do {
            
        } catch {
            // TODO: エラーハンドリング
        }
    }
}

extension TateEditor2Presenter: TateEditor2InteractorOutput {
}

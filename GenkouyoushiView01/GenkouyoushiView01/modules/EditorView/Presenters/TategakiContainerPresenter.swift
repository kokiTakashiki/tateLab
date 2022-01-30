//
//  TategakiContainerPresenter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/30.
//

import Foundation

@MainActor
protocol TategakiContainerEventHandler: AnyObject {
    func viewDidLoad() async
    func updateTategakiViewText(content: EditEntitiy) async
}

protocol TategakiContainerInteractorOutput: AnyObject {
    
}

@MainActor
final class TategakiContainerPresenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: TategakiContainerUserInterface
    //private let interactor: EditorInteractorInput
    private let router: TategakiContainerRouterInput

    // MARK: Computed Instance Properties

    // MARK: Initializers

    init(view: TategakiContainerUserInterface,
         //interactor: EditorInteractorInput,
         router: TategakiContainerRouterInput
    ) {
        self.view = view
        //self.interactor = interactor
        self.router = router
    }

    // MARK: Other Private Methods

}

extension TategakiContainerPresenter: TategakiContainerEventHandler {
    func viewDidLoad() async {
        do {
            
        } catch {
            // TODO: エラーハンドリング
        }
    }
    func updateTategakiViewText(content: EditEntitiy) async {
    }
}

extension TategakiContainerPresenter: TategakiContainerInteractorOutput {
}

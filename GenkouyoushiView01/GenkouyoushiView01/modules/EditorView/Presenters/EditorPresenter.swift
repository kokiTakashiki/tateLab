//
//  EditorPresenter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/18.
//

import Foundation

@MainActor
protocol EditorEventHandler: AnyObject {
    func viewDidLoad() async
    func prepareTategakiContainer(containerView: TategakiContainerViewController, editData: EditEntitiy) async
    func didChangeSelectionEditContent(content: EditEntitiy) async
}

protocol EditorInteractorOutput: AnyObject {
    
}

@MainActor
final class EditorPresenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: EditorUserInterface
    private let interactor: EditorInteractorInput
    private let router: EditorRouterInput

    // MARK: Computed Instance Properties

    // MARK: Initializers

    init(view: EditorUserInterface,
         interactor: EditorInteractorInput,
         router: EditorRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: Other Private Methods

}

extension EditorPresenter: EditorEventHandler {
    func viewDidLoad() async {
        do {
            
        } catch {
            // TODO: エラーハンドリング
        }
    }
    
    func prepareTategakiContainer(containerView: TategakiContainerViewController, editData: EditEntitiy) async {
        do {
            router.prepareTategakiContainer(containerView: containerView, editData: editData)
        } catch {
            // TODO: エラーハンドリング
        }
    }
    
    func didChangeSelectionEditContent(content: EditEntitiy) async {
        //TategakiContainerPresenter.updateTategakiViewText(content: content)
        //await interactor.saveForSpotlight(monster)
    }
}

extension EditorPresenter: EditorInteractorOutput {
}

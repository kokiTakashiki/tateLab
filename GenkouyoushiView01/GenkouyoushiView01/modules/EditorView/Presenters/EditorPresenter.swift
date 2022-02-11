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
    func prepareTategakiContainer(containerView: TategakiContainerViewController, editData: EditEntity) async
    func didChangeSelectionEditContent(content: EditEntity) async
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
    
    private var tategakiContainerPresenter: TategakiContainerEventHandler?

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
    
    func prepareTategakiContainer(containerView: TategakiContainerViewController, editData: EditEntity) async {
        do {
            tategakiContainerPresenter = router.prepareTategakiContainer(containerView: containerView, editData: editData)
        } catch {
            // TODO: エラーハンドリング
        }
    }
    
    func didChangeSelectionEditContent(content: EditEntity) async {
        //await interactor.saveForSpotlight(monster)
        do {
            guard let nonnilTategakiContainerPresenter = tategakiContainerPresenter else { return }
            await nonnilTategakiContainerPresenter.updateTategakiViewText(content: content)
        } catch {
            // TODO: エラーハンドリング
        }
    }
}

extension EditorPresenter: EditorInteractorOutput {
}

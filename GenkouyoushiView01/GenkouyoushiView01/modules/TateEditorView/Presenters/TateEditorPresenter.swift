//
//  TateEditorPresenter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/19.
//

@MainActor
protocol TateEditorEventHandler: AnyObject {
    func viewDidLoad() async
}

protocol TateEditorInteractorOutput: AnyObject {
}

@MainActor
final class TateEditorPresenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: TateEditorUserInterface
    //private let interactor: TateEditorInteractorInput
    private let router: TateEditorRouterInput

    // MARK: Computed Instance Properties
    
    private var tategakiContainerPresenter: TategakiContainerEventHandler?

    // MARK: Initializers

    init(view: TateEditorUserInterface,
         //interactor: TateEditorInteractorInput,
         router: TateEditorRouterInput
    ) {
        self.view = view
        //self.interactor = interactor
        self.router = router
    }

    // MARK: Other Private Methods

}

extension TateEditorPresenter: TateEditorEventHandler {
    func viewDidLoad() async {
        do {
            
        } catch {
            // TODO: エラーハンドリング
        }
    }
}

extension TateEditorPresenter: TateEditorInteractorOutput {
}

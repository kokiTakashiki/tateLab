//
//  DemoListPresenter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import Foundation

@MainActor
protocol DemoListEventHandler: AnyObject {
    func viewDidLoad() async
    func didSelectDemo(_ demo: DemoListEntity) async
}

protocol DemoListInteractorOutput: AnyObject {
}

@MainActor
final class DemoListPresenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: DemoListUserInterface
    //private let interactor:
    private let router: DemoListRouterInput

    // MARK: Computed Instance Properties

    // MARK: Initializers

    init(view: DemoListUserInterface,
         //interactor: ,
         router: DemoListRouterInput
    ) {
        self.view = view
        //self.interactor = interactor
        self.router = router
    }

    // MARK: Other Private Methods

}

extension DemoListPresenter: DemoListEventHandler {
    func viewDidLoad() async {
        do {
            let demoList = [
                DemoListEntity(listID: .tateContainer, title: "縦書きcontainer", description: "TateContainer"),
                DemoListEntity(listID: .tateTextView, title: "縦書きtextView", description: "TateTextView")
            ]
            view.updateDemoList(demoList)
        } catch {
            // TODO: エラーハンドリング
        }
    }
    
    func didSelectDemo(_ demo: DemoListEntity) async {
        switch demo.listID {
        case .tateContainer:
            router.showEditor()
        case .tateTextView:
            router.showTateEditor()
        case .none:
            print("no select view")
        default:
            // TODO: エラーハンドリング
            print("no select view")
        }
    }
}

extension DemoListPresenter: DemoListInteractorOutput {
}

//
//  TateEditorRouters.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/19.
//

import UIKit

@MainActor
protocol TateEditorRouterInput {
}

@MainActor
final class TateEditorRouter {
    // MARK: Stored Instance Properties

    private unowned let viewController: TateEditorViewController

    // MARK: Initializers

    private init(viewController: TateEditorViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    static func assembleModule() -> TateEditorViewController {
//        guard let view = R.storyboard.monsterList.instantiateInitialViewController() else {
//            fatalError("Fail to load MonsterListViewController from Storyboard.")
//        }
        let controller = UIViewController()
        guard let view = controller.instantiateStoryBoardToViewController(storyBoardName: .tateEditorView, withIdentifier: .tateEditorViewID) as? TateEditorViewController else {
            fatalError("Fail to load TateEditorViewController from Storyboard.")
        }
        //let interactor = TateEditorInteractor()
        let router = TateEditorRouter(viewController: view)
        let presenter = TateEditorPresenter(view: view, router: router)

        view.inject(presenter: presenter)
        //interactor.presenter = presenter

        return view
    }

    // MARK: Other Private Methods
}

extension TateEditorRouter: TateEditorRouterInput {
}

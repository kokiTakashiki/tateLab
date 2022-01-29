//
//  EditorRouter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/23.
//

import Foundation
import UIKit

protocol EditorRouterInput {
    func updatetategakiViewText(content: EditEntitiy)
}

final class EditorRouter {
    // MARK: Stored Instance Properties

    private unowned let viewController: EditorViewController

    // MARK: Initializers

    private init(viewController: EditorViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    @MainActor static func assembleModule() -> EditorViewController {
//        guard let view = R.storyboard.monsterList.instantiateInitialViewController() else {
//            fatalError("Fail to load MonsterListViewController from Storyboard.")
//        }
        let controller = UIViewController()
        guard let view = controller.instantiateStoryBoardToViewController(storyBoardName: UIViewController.editorView, withIdentifier: UIViewController.editorViewID) as? EditorViewController else {
            fatalError("Fail to load EditorViewController from Storyboard.")
        }
        let interactor = EditorInteractor()
        let router = EditorRouter(viewController: view)
        let presenter = EditorPresenter(view: view as! EditorUserInterface, interactor: interactor, router: router)

        //view.inject(presenter: presenter)
        interactor.presenter = presenter as? EditorInteractorOutput

        return view
    }

    // MARK: Other Private Methods
}

extension EditorRouter: EditorRouterInput {
    func updatetategakiViewText(content: EditEntitiy) {
        
    }
}

//
//  DemoListRouter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import Foundation
import UIKit

@MainActor
protocol DemoListRouterInput {
}

@MainActor
final class DemoListRouter {
    // MARK: Stored Instance Properties

    private unowned let viewController: DemoListViewController

    // MARK: Initializers

    private init(viewController: DemoListViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    static func assembleModule() -> DemoListViewController {
//        guard let view = R.storyboard.monsterList.instantiateInitialViewController() else {
//            fatalError("Fail to load MonsterListViewController from Storyboard.")
//        }
        let controller = UIViewController()
        guard let view = controller.instantiateStoryBoardToViewController(storyBoardName: UIViewController.demoListView, withIdentifier: UIViewController.demoListViewID) as? DemoListViewController else {
            fatalError("Fail to load EditorViewController from Storyboard.")
        }
        //let interactor =
        let router = DemoListRouter(viewController: view)
        let presenter = DemoListPresenter(view: view, router: router)

        view.inject(presenter: presenter)
        //interactor.presenter = presenter

        return view
    }

    // MARK: Other Private Methods
}

extension DemoListRouter: DemoListRouterInput {
}

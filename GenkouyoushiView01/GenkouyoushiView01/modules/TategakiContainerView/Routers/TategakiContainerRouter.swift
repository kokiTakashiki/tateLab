//
//  TategakiContainerRouter.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/30.
//

import Foundation
import UIKit

@MainActor
protocol TategakiContainerRouterInput {
}

@MainActor
final class TategakiContainerRouter {
    // MARK: Stored Instance Properties

    private unowned let viewController: TategakiContainerViewController

    // MARK: Initializers

    private init(viewController: TategakiContainerViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    // segueで既にviewの初期化が始まっているのでviperの設定だけ
    static func assembleModule(seguePrepareView: TategakiContainerViewController, editData: EditEntitiy) -> TategakiContainerPresenter {
        //let interactor = TategakiContainerInteractor()
        let router = TategakiContainerRouter(viewController: seguePrepareView)
        let presenter = TategakiContainerPresenter(view: seguePrepareView, router: router)

        seguePrepareView.inject(presenter: presenter, editData: editData)
        //interactor.presenter = presenter
        return presenter
    }

    // MARK: Other Private Methods
}

extension TategakiContainerRouter: TategakiContainerRouterInput {
}

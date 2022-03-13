//
//  TateEditor2Routers.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/03/13.
//

import UIKit

@MainActor
protocol TateEditor2RouterInput {
}

@MainActor
final class TateEditor2Router {
    // MARK: Stored Instance Properties

    private unowned let viewController: TateEditor2ViewController

    // MARK: Initializers

    private init(viewController: TateEditor2ViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    static func assembleModule() -> TateEditor2ViewController {
        let controller = UIViewController()
        guard let view = controller.instantiateStoryBoardToViewController(storyBoardName: .tateEditor2View, withIdentifier: .tateEditor2ViewID) as? TateEditor2ViewController else {
            fatalError("Fail to load TateEditorViewController from Storyboard.")
        }
        let router = TateEditor2Router(viewController: view)
        let presenter = TateEditor2Presenter(view: view, router: router)

        view.inject(presenter: presenter)

        return view
    }

    // MARK: Other Private Methods
}

extension TateEditor2Router: TateEditor2RouterInput {
}

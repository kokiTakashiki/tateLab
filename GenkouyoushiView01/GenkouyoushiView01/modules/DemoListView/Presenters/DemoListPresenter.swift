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
            
        } catch {
            // TODO: エラーハンドリング
        }
    }
}

extension DemoListPresenter: DemoListInteractorOutput {
}

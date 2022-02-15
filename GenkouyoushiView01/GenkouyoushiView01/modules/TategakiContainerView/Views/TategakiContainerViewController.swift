//
//  TategakiContainerViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/07.
//

import UIKit

@MainActor
protocol TategakiContainerUserInterface: AnyObject {
    func updateText(editData: EditEntity)
}

@MainActor
final class TategakiContainerViewController: UIViewController {
    
    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: TategakiContainerEventHandler!
    
    private var editData: EditEntity!

    // MARK: Computed Instance Properties

    // MARK: IBOutlets
    @IBOutlet weak var tategakiView: TategakiView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tategakiView.text = "asddfghjklzxcvbnmwqwrtytyuuiioop"
        
        Task {
            await presenter.viewDidLoad()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Task {
            tategakiView.text = editData.content
            tategakiView.setNeedsDisplay()
        }
    }
    
    // MARK: IBActions

    // MARK: Other Internal Methods

    func inject(
        presenter: TategakiContainerEventHandler,
        editData: EditEntity
        //logger: LoggerProtocol = Logger.default
    ) {
        self.presenter = presenter
        self.editData = editData
        //self.logger = logger
    }

    // MARK: Other Private Methods
}

extension TategakiContainerViewController: TategakiContainerUserInterface {
    func updateText(editData: EditEntity) {
        tategakiView.text = editData.content
        tategakiView.setNeedsDisplay()
    }
}

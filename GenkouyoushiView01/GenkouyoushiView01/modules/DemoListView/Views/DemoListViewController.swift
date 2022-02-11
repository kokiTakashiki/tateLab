//
//  DemoListViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import UIKit

protocol DemoListUserInterface: AnyObject {
}

final class DemoListViewController: UIViewController {
    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: DemoListEventHandler!
    
    private var tableData: DemoListEntity!

    // MARK: Computed Instance Properties

    // MARK: IBOutlets
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            await presenter.viewDidLoad()
        }
    }
    
    // MARK: IBActions

    // MARK: Other Internal Methods
    @IBOutlet weak var demoListCollectionView: UICollectionView! {
        willSet {
            
        }
    }
    
    func inject(
        presenter: DemoListEventHandler
        //logger: LoggerProtocol = Logger.default
    ) {
        self.presenter = presenter
        //self.logger = logger
    }

    // MARK: Other Private Methods
}

extension DemoListViewController: DemoListUserInterface {
}

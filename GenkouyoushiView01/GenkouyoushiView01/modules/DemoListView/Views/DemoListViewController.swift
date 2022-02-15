//
//  DemoListViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import UIKit

protocol DemoListUserInterface: AnyObject {
    func updateDemoList(_ demoList: [DemoListEntity])
}

final class DemoListViewController: UIViewController {
    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: DemoListEventHandler!
    
    private var collectionData: [DemoListEntity] = []

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
        didSet {
            demoListCollectionView.register(.init(nibName: .demoListCollectionCell, bundle: nil),
                                            forCellWithReuseIdentifier: .demoListCollectionCell)
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

extension DemoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .demoListCollectionCell, for: indexPath) as? DemoListCollectionViewCell else {
            fatalError("Fail to load CollectionViewCell.")
        }

        Task {
            do {
                let data = collectionData[indexPath.row]
                //let icon = try await imageCacheManager.cacheImage(imageUrl: monster.iconUrl)
                cell.setup(name: data.title, elevation: 1.0)
            } catch {
                // TODO: エラーハンドリング
                //logger.exception(error, file: #file, function: #function, line: #line, column: #column)
            }
        }

        return cell
    }
}

extension DemoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: demoListCollectionView.frame.width - 16.0 * 2, height: 116.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12.0
    }
}

extension DemoListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Task {
            let data = collectionData[indexPath.row]
            //await presenter.didSelectMonster(monster: monster)
            await presenter.didSelectDemo()
        }
    }

}

extension DemoListViewController: DemoListUserInterface {
    func updateDemoList(_ demoList: [DemoListEntity]) {
        self.collectionData = demoList
        demoListCollectionView.reloadData()
        demoListCollectionView.executeCellSlideUpAnimation()
    }
}

//
//  EditorInteractor.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/24.
//

protocol EditorInteractorInput: AnyObject {
    //func fetchMonsters() async throws -> [MonsterDTO]
    //func saveForSpotlight(_ monster: MonsterEntity) async
}

final class EditorInteractor {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    weak var presenter: EditorInteractorOutput!

    //private let editorRepository: MonstersRepository
    //private let monstersTempRepository: MonstersTempRepository
    //private let spotlightRepository: SpotlightRepository

    // MARK: Computed Instance Properties

    // MARK: Initializer

    init(
        //spotlightRepository: SpotlightRepository,
        //monstersRepository: MonstersRepository = MonstersFirebaseClient.shared,
        //monstersTempRepository: MonstersTempRepository = UserDefaultsClient.shared
    ) {
        //self.spotlightRepository = spotlightRepository
        //self.monstersRepository = monstersRepository
        //self.monstersTempRepository = monstersTempRepository
    }

    // MARK: Other Private Methods

}

extension EditorInteractor: EditorInteractorInput {

//    func fetchMonsters() async throws -> [MonsterDTO] {
//        try await monstersRepository.loadMonsters()
//    }

//    func saveForSpotlight(_ monster: MonsterEntity) async {
//        let key = "spotlight_\(monster.name)"
//        monstersTempRepository.saveMonster(monster, forKey: key)
//        await spotlightRepository.saveMonster(monster, forKey: key)
//    }

}

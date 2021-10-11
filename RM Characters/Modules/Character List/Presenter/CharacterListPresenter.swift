import Foundation

final class CharacterListPresenter {

    weak var view: CharacterListViewInput!
    var interactor: CharacterListInteractorInput!
    var router: CharacterListRouterInput!
}

// MARK: - CharacterListModuleInput

extension CharacterListPresenter: CharacterListModuleInput {
    func didSelect(character: Character) {
        router.openCharacterDetail(character: character)
    }
    
	
}

// MARK: - CharacterListViewOutput

extension CharacterListPresenter: CharacterListViewOutput {
	func viewIsReady() {
		view.setupInitialState()
        interactor.getCharacterList()
    }
}

// MARK: - CharacterListInteractorOutput

extension CharacterListPresenter: CharacterListInteractorOutput {
    func didReceive(characters: Characters) {
        view.received(characters: characters)
    }
}

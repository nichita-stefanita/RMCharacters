import Foundation

final class CharacterDetailPresenter {

    weak var view: CharacterDetailViewInput!
    var interactor: CharacterDetailInteractorInput!
    var router: CharacterDetailRouterInput!
}

// MARK: - CharacterDetailModuleInput

extension CharacterDetailPresenter: CharacterDetailModuleInput {
	
}

// MARK: - CharacterDetailViewOutput

extension CharacterDetailPresenter: CharacterDetailViewOutput {
	func viewIsReady() {
		view.setupInitialState()
    }
    
    func didReceive(character: Character) {
        interactor.getNeighbours(character: character)
    }
}

// MARK: - CharacterDetailInteractorOutput

extension CharacterDetailPresenter: CharacterDetailInteractorOutput {
    func didReceive(episode: Episode) {
        view.fillEpisodeName(episode: episode)
    }
    
    func didReceiveNeighbours(characters: [Character]) {
        view.fillCharacterList(characters: characters)
    }
}

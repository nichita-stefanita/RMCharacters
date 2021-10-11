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
}

// MARK: - CharacterDetailInteractorOutput

extension CharacterDetailPresenter: CharacterDetailInteractorOutput {
	
}
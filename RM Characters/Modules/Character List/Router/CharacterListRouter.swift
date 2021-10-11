import Foundation

final class CharacterListRouter: CharacterListRouterInput {
	var viewController: CharacterListViewController!
    
    func openCharacterDetail(character: Character) {
        let characterDetail = CharacterDetailViewController.construct(character: character)
        viewController.navigationController?.pushViewController(characterDetail, animated: true)
    }
}

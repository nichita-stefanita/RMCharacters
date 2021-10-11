import Foundation

protocol CharacterDetailViewInput: AnyObject {
	func setupInitialState()
    func fillEpisodeName(episode: Episode)
    func fillCharacterList(characters: [Character])
}

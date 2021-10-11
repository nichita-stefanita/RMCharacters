import Foundation

protocol CharacterListViewInput: AnyObject {
	func setupInitialState()
    func received(characters: Characters)
}

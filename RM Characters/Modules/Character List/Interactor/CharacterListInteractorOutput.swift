import Foundation

protocol CharacterListInteractorOutput: AnyObject {
    func didReceive(characters: Characters)
}

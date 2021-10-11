import Foundation

protocol CharacterDetailInteractorOutput: AnyObject {
    func didReceive(episode: Episode)
    func didReceiveNeighbours(characters: [Character])
}

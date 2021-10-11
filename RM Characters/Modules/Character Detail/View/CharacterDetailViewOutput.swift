import Foundation

protocol CharacterDetailViewOutput {
    func viewIsReady()
    func didReceive(character: Character)
}

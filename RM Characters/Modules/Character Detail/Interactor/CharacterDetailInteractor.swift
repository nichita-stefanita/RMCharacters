import Foundation
import Alamofire

final class CharacterDetailInteractor: CharacterDetailInteractorInput {

    weak var output: CharacterDetailInteractorOutput!
    
    func getNeighbours(character: Character) {
        
        if let episodeURL = character.episode.first {
            let episodeID = filterEpisodeID(episode: episodeURL)
            getResidentsFor(episode: episodeID)
        }
    }
    
    
    private func getResidentsFor(episode: Int) {
        
        AF.request("https://rickandmortyapi.com/api/episode/\(episode)").responseDecodable(of: Episode.self) { [weak self] (response) in
            guard let _self = self else { return }
            guard let episode = response.value else { return }
            let characterIDs = _self.filterIDs(characterURLS: episode.characters)
            _self.output.didReceive(episode: episode)
            _self.getCharacters(ids: characterIDs)
        }
    }
    
    private func getCharacters(ids: [String]) {
        var episodeIDs = ""
        ids.forEach({ episodeIDs.append(contentsOf: $0 + ",") })
        // removes last ","
        episodeIDs.popLast()
        
        AF.request("https://rickandmortyapi.com/api/character/\(episodeIDs)").responseDecodable(of: [Character].self) { [weak self] (response) in
            guard let _self = self else { return }
            guard let characters = response.value else { return }
            _self.output.didReceiveNeighbours(characters: characters)
        }
    }
    
    private func filterIDs(characterURLS: [String]) -> [String] {
        return characterURLS.map({ $0.onlyCharacters(charSet: .decimalDigits) })
    }
    
    private func filterEpisodeID(episode: String) -> Int {
        let id = episode.onlyCharacters(charSet: .decimalDigits)
        return Int(id) ?? -1
    }

}

import Foundation
import Alamofire
import SwiftyJSON

final class CharacterListInteractor: CharacterListInteractorInput {

    weak var output: CharacterListInteractorOutput!

    func getCharacterList() {
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: Characters.self) { [weak self] (response) in
            guard let _self = self else { return }
            guard let characters = response.value else { return }
            _self.output.didReceive(characters: characters)
        }
    }
    
}

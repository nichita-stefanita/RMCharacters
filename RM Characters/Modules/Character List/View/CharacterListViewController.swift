import UIKit

final class CharacterListViewController: UIViewController, StoryboardInstantiable {
	static var storyboardName: String = "CharacterListViewController"
    var output: CharacterListViewOutput!
    var moduleInput: CharacterListModuleInput!
    
    private var characterList: Characters!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - CharacterListViewInput

extension CharacterListViewController: CharacterListViewInput {
	func setupInitialState() {
        tableView.register(CharacterTableViewCell.self)
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        
        activityIndicator.startAnimating()
    }
    
    func received(characters: Characters) {
        characterList = characters
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        activityIndicator.stopAnimating()
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        let character = characterList.all[indexPath.row]
        cell.cellSetup(model: character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characterList.all[indexPath.row]
        moduleInput.didSelect(character: character)
    }
}

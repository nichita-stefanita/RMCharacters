import UIKit
import SDWebImage

final class CharacterDetailViewController: UIViewController, StoryboardInstantiable {
    class func construct(character: Character) -> CharacterDetailViewController {
        let controller = CharacterDetailViewController.instantiate()
        controller.character = character
        return controller
    }
    
	static var storyboardName: String = "CharacterDetailViewController"
    
    var output: CharacterDetailViewOutput!
    var moduleInput: CharacterDetailModuleInput!
    
    private var character: Character!
    private var neighboursList: [Character] = []
    
    @IBOutlet weak var moreCharactersTableView: UITableView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var lastKnownLocation: UILabel!
    @IBOutlet weak var firstSeenIn: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var alsoFrom: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        output.didReceive(character: character)
    }
    
    private func fillCharacterInfo() {
        if let characterStatus = Character.Status(rawValue: character.status) {
            let entireText = "\u{00B7} \(character.status)"
            let indicatorText = "\u{00B7}"
            
            status.text = entireText
            
            let attributedString = NSMutableAttributedString(string: entireText)
            let indicatorRange = (entireText as NSString).range(of: indicatorText)
            let rangeAll = (entireText as NSString).range(of: entireText)
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 12, weight: .medium), range: rangeAll)
            
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: characterStatus.indicatorColor, range: indicatorRange)
            
            status.attributedText = attributedString
        }
    
        title = character.name
        lastKnownLocation.text = character.lastKnownLocation.name
        
        alsoFrom.text = "Also from \"\(character.lastKnownLocation.name)\""
        photoImageView.sd_setImage(with: URL(string: character.photoURL), placeholderImage: UIImage(systemName: "person"))
    }
}

// MARK: - CharacterDetailViewInput

extension CharacterDetailViewController: CharacterDetailViewInput {
	func setupInitialState() {
        fillCharacterInfo()
        
        navigationController?.navigationBar.tintColor = .black
        
        moreCharactersTableView.register(CharacterTableViewCell.self)
        moreCharactersTableView.rowHeight = 150
        moreCharactersTableView.separatorStyle = .none
        
        activityIndicator.startAnimating()
    }
    
    func fillEpisodeName(episode: Episode) {
        firstSeenIn.text = episode.name
    }
    
    func fillCharacterList(characters: [Character]) {
        neighboursList = characters
        moreCharactersTableView.dataSource = self
        moreCharactersTableView.delegate = self
        moreCharactersTableView.reloadData()
        
        activityIndicator.stopAnimating()
    }
}


extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return neighboursList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        let character = neighboursList[indexPath.row]
        cell.cellSetup(model: character)
        
        return cell
    }
}

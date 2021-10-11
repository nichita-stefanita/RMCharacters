import UIKit

final class CharacterDetailModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: CharacterDetailViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: CharacterDetailViewController) {

        let router = CharacterDetailRouter()
        router.viewController = viewController

        let presenter = CharacterDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharacterDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter as CharacterDetailModuleInput
    }
}

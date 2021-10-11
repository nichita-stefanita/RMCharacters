import UIKit

final class CharacterListModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: CharacterListViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: CharacterListViewController) {

        let router = CharacterListRouter()
        router.viewController = viewController

        let presenter = CharacterListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharacterListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter as CharacterListModuleInput
    }
}

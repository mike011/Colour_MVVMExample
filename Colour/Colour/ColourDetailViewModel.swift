import UIKit

class ColourDetailViewModel {
    weak var view:ColourDetailViewControllerDelegate?
    var model:Colour?


    init(view:ColourDetailViewControllerDelegate?, model:Colour?) {
        self.view = view
        self.model = model
    }
}

extension ColourDetailViewModel: ViewModel {

    func viewDidAppear(_ animated: Bool) {
        if let view = self.view, let model = self.model {
            view.setBackgroundColour(red: model.red, blue: model.blue, green: model.green, alpha: model.alpha)
            view.setNavigationTitle(model.name)
        }
    }

    func setView(delegate:AnyObject?) {
        self.view = delegate as? ColourDetailViewControllerDelegate
    }
}

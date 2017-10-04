import UIKit

class ColourDetailViewController: UIViewController {

    var viewModel:ColourDetailViewModel?

    override func viewDidAppear(_ animated: Bool) {
        if let viewModel = viewModel {
            viewModel.viewDidAppear(animated)
        }
    }
}

extension ColourDetailViewController : ColourDetailViewControllerDelegate {
    func setNavigationTitle(_ title:String) {
        self.title = title
    }

    func setBackgroundColour(red:Float, blue:Float, green:Float, alpha:Float) {
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}


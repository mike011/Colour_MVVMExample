import UIKit

class ColourListTableViewCell: UITableViewCell {

    var viewModel: CellViewModel? {
        willSet(newViewModel) {
            guard let vm = newViewModel else {
                self.textLabel?.text = ""
                return
            }
            self.textLabel?.text = vm.cellText
        }
    }
}

import UIKit

class ColourListTableViewController: UITableViewController {

    private var viewModel:TableViewModel?

    override func viewDidLoad() {
        super.viewDidLoad();
        self.clearsSelectionOnViewWillAppear = false
        self.viewModel = ColourTableViewModel(view: self, title:"Select a color")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }

        return viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColourListCell", for: indexPath) as? ColourListTableViewCell

        guard let viewModel = viewModel,
            let colourListTableViewCell = cell else {
                return UITableViewCell()
        }

        let detailViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        colourListTableViewCell.viewModel = detailViewModel
        return colourListTableViewCell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.selectRow(atIndexPath: indexPath)
        self.performSegue(withIdentifier: "colourDetailSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel
            else {
                return
        }

        if identifier.compare("colorDetailSegue") != .orderedSame {
            return
        }

        if let colourDetailViewController = segue.destination as? ColourDetailViewController, let destinationViewModel = viewModel.viewModelForSelectedRow() {
            destinationViewModel.setView(delegate: colourDetailViewController)
            colourDetailViewController.viewModel = destinationViewModel
        }
    }
}

extension ColourListTableViewController: ColourListTableViewControllerDelegate {
    func setNavigationTitle(_ title:String) {
        self.title = title
    }
}



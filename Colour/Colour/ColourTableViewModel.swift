import UIKit

class ColourTableViewModel {

    var tableTitle:String

    fileprivate var colourData:[Colour]
    fileprivate var selectedIndexPath:IndexPath?
    fileprivate weak var view:ColourListTableViewControllerDelegate?

    init(view:ColourListTableViewControllerDelegate?, title:String) {
        self.view = view
        self.tableTitle = title

        self.colourData = []

        if let redModel = Colour(name: "Red", red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            let greenModel = Colour(name: "Green", red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
            let blueModel = Colour(name: "Blue", red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0) {
            self.colourData.append(redModel)
            self.colourData.append(greenModel)
            self.colourData.append(blueModel)
        }
    }
}

extension ColourTableViewModel: TableViewModel {

    func setView(delegate:AnyObject?) {
        self.view = delegate as? ColourListTableViewControllerDelegate
    }

    func numberOfRows() -> Int {
        return colourData.count
    }

    func cellViewModel(forIndexPath indexPath:IndexPath) -> CellViewModel? {
        let row = indexPath.row
        if row < 0 || row >= self.colourData.count {
            return nil
        }

        let cellText = colourData[row].name
        return TableViewCellViewModel(view:nil, cellText: cellText)
    }

    func selectRow(atIndexPath indexPath:IndexPath) {
        self.selectedIndexPath = indexPath
    }

    func viewModelForSelectedRow() -> ColourDetailViewModel? {
        guard let selectedIndexPath = selectedIndexPath else {
            return nil
        }

        if selectedIndexPath.row < 0 || selectedIndexPath.row >= colourData.count {
            return nil
        }

        return ColourDetailViewModel(view:nil, model:colourData[selectedIndexPath.row])
    }

    func viewDidAppear(_ animated: Bool) {
        guard let view = view else {
            return
        }
        view.setNavigationTitle(tableTitle)
    }

    func model(forIndexPath indexPath:IndexPath) -> AnyObject? {
        let row = indexPath.row
        if row < 0 || row >= self.colourData.count {
            return nil
        }

        return colourData[row] as AnyObject
    }
}

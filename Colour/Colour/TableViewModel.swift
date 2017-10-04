import UIKit

protocol TableViewModel: ViewModel {

    func numberOfRows() -> Int
    func selectRow(atIndexPath indexPath:IndexPath)

    func viewModelForSelectedRow() -> ColourDetailViewModel?

    func cellViewModel(forIndexPath indexPath:IndexPath) -> CellViewModel?
}

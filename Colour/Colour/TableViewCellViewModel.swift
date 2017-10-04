class TableViewCellViewModel : CellViewModel {
    var cellText: String
    private var view:TableViewCellDelegate?

    func setView(delegate: AnyObject?) {
        view = delegate as? TableViewCellDelegate
    }


    init(view:TableViewCellDelegate?, cellText: String) {
        self.cellText = cellText
    }
}

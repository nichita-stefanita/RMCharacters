import UIKit

extension UITableView {
    open func register(_ cell: UITableViewCell.Type...) {
        cell.forEach {
            let nib = UINib(nibName: $0.identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: $0.identifier)
            print("register identifier : \($0.identifier)")
        }
    }
    
    /// dequeue as subscript. Example: let cell = tableView[CellType.self, indexPath]
    open subscript<CellClass: UITableViewCell>(cellType: CellClass.Type, indexPath: IndexPath) -> CellClass {
        return dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as! CellClass
    }
    
    /// dequeue as subscript. Example: let cell = tableView[CellType.self]
    open subscript<CellClass: UITableViewCell>(cellType: CellClass.Type) -> CellClass {
        return dequeueReusableCell(withIdentifier: cellType.identifier) as! CellClass
    }
    
    func registerHeaderFooter(identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }
}

extension UITableViewCell {
    public static var identifier: String {
        return String(describing: self)
    }
}

//
//  TCSavedNewsViewController.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import UIKit
import CoreData

class TCSavedNewsViewController: UIViewController {
    //MARK: - Outlets, Variables
    @IBOutlet weak var savedDataTableView: UITableView!
    var list: [SavedDataClass]? {
        didSet {
            savedDataTableView.reloadData()
        }
    }
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload) , name: NSNotification.Name("reload"), object: nil)

        let fetchAll = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedDataEntity")
        list = try? container.viewContext.fetch(fetchAll) as? [SavedDataClass]
       
    }
    var container: NSPersistentContainer {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.NewsListContainer
    }
   
    //MARK: - Register Cells
    private func registerCells(){
        savedDataTableView.register(identifier: TCNewsListTableViewCell.identifier)
    }
    
    @objc func reload() {
        let fetchAll = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedDataEntity")
        list = try? container.viewContext.fetch(fetchAll) as? [SavedDataClass]
    }

}
//MARK: - UITableViewDataSource, UITableViewDelegate
extension TCSavedNewsViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TCNewsListTableViewCell.identifier, for: indexPath) as? TCNewsListTableViewCell {
            cell.authorLabel.text = list?[indexPath.row].author
            cell.titleLabel.text = list?[indexPath.row].title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
  
}


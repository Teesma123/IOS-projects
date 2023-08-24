//
//  TCNewsListViewController.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import UIKit
import CoreData

class TCNewsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let newsList = TCNewsListViewModel()
    var data = [Articles]()
    
    //Declare view context
    var container: NSPersistentContainer {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.NewsListContainer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        newsList.getNewsList {
            data in
            self.data = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    //MARK: - Register Cells
    private func registerCells(){
        tableView.register(identifier: TCNewsListTableViewCell.identifier)
    }

    
}
//MARK: - UITableViewDataSource, UITableViewDelegate
extension TCNewsListViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TCNewsListTableViewCell.identifier, for: indexPath) as? TCNewsListTableViewCell {
            cell.authorLabel.text = data[indexPath.row].author
            cell.titleLabel.text = data[indexPath.row].title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    // Long Swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
            
    }
    // click to add the data to core data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectingData = NSEntityDescription.insertNewObject(forEntityName: "SavedDataEntity", into: container.viewContext) as? SavedDataClass
        
        selectingData?.author = data[indexPath.row].author
        selectingData?.title = data[indexPath.row].title
       
        do {
              try container.viewContext.save()
        } catch {
            print("Error")
        }
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
    }
    

}
//MARK: - Extension Tableview
extension UITableView {
    func register(identifier:String)
    {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}

open class SavedDataClass: NSManagedObject {
    @NSManaged var author : String?
    @NSManaged var title : String?
}



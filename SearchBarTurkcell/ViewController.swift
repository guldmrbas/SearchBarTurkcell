//
//  ViewController.swift
//  SearchBarTurkcell
//
//  Created by Gülsüm Demirbaş on 20.05.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
   
    

    @IBOutlet weak var tvliste: UITableView!
    @IBOutlet weak var sbListe: UISearchBar!
    
    
    var liste = ["Armut" , "Çilek" , "Karpuz" , "Kavun"  , "Erik" , "Elma"]
    var filtre : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        filtre.append(contentsOf: liste)
        
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filtre[indexPath.row]
        return cell
        
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           filtre = searchText.isEmpty ? liste : liste.filter({ (str: String) -> Bool in
               return str.range(of: searchText, options: .caseInsensitive) != nil
           })
           
           tvliste.reloadData()
       }


}


//
//  ViewController.swift
//  simpsonBook
//
//  Created by Hande Erdal on 19.08.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var mySimpsons = [Simpsons]()
    var chosenSimpson : Simpsons?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let homer = Simpsons(simpsonName: "Homer", simpsonJob: "Nuclear Engineer", simpsonImage: UIImage(named: "homer.png")!)
        let marge = Simpsons(simpsonName: "Marge", simpsonJob: "Housewife", simpsonImage: UIImage(named: "marge.png")!)
        let lisa = Simpsons(simpsonName: "Lisa", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa.png")!)
        let bart = Simpsons(simpsonName: "Bart", simpsonJob: "Ski Surfer", simpsonImage: UIImage(named: "bart.png")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(lisa)
        mySimpsons.append(bart)

        
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell;
    }
    
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"
        {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson

        }
    }

}


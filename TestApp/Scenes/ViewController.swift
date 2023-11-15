//
//  ViewController.swift
//  TestApp
//
//  Created by Giorgi Goginashvili on 11/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    var personApiManager: PersonManagerProtocol = PersonManager()
    
    var person: [Person] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCell")
        self.tableView.reloadData()
        configureAPI()
    }

    func configureAPI() {
        personApiManager.fetchPerson(completion: { result in
            switch result {
            case .success(let personResponse):
                self.person = personResponse
                print(personResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "PersonDetails", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "PersonDetails") as! PersonDetailsViewController
        detailsVC.person = person[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as! PersonTableViewCell
        cell.configure(with: person[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

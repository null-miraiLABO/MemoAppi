//
//  ViewController.swift
//  MemoAppi
//
//  Created by 岡瀬　瑞樹 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    var objects = [Any]()
    var inputTextField:UITextField?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
    }
    
    @IBAction func insrtNewButton(_ sender: Any) {
        let alert = UIAlertController(title: "ファイル名", message: "", preferredStyle: .alert);
        alert.addTextField{
            textField ->Void in
            textField.placeholder = "新しいファイル";
            self.inputTextField = textField;
        }
        alert.addAction(UIAlertAction(title: "取り消し", style: .default, handler: nil));
        
        let okAction:UIAlertAction = UIAlertAction(title: "決定", style: .default){
            action ->Void in
            if self.inputTextField!.text == ""{
                self.inputTextField!.text == "新しいファイル";
            }
            self.objects.insert(self.inputTextField!.text, at: 0);
            let indexPath = IndexPath(row: 0, section: 0);
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        alert.addAction(okAction);
        present(alert,animated:true, completion: nil);
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //ここから
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section; Int) -> <#return type#> {
        <#function body#>
    }
    
    func tableView(_ tableView: UITableView, ) -> <#return type#> {
        <#function body#>
    }
    
    func tableView(_ tableView: UITableView, ) -> <#return type#> {
        <#function body#>
    }
    
    func tableView(_ tableView: UITableView, ) -> <#return type#> {
        <#function body#>
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func returnDetail(segue: UIStoryboardSegue){
        
    }
}


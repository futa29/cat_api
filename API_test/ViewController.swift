//
//  ViewController.swift
//  API_test
//
//  Created by PC089 on 2022/06/24.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON


class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getImage()
    }
    
    func getImage(){
        let url = "https://api.thecatapi.com/v1/images/search?limit=5&page=10&order=Desc"
        
        //Alamofire
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{(response) in
        
            switch response.result{
            case.success:
                let json:JSON = JSON(response.data as Any)
                let imageString = json[self.count]["url"].string
                
                
                self.imageView.sd_setImage(with: URL(string: imageString!))
                print("成功")
            
            case.failure:
                print("失敗")
            
            
            
        }
    }
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        count += 1
        if count == 5 {
            count = 0
        }
        getImage()
    }
    


}


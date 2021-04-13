import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "https://chickfila-tally.net/service.php" //this will be changed to the path where service.php lives
 
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
            
            var jsonResult = NSArray()
            
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                
            } catch let error as NSError {
                print(error)
                
            }
            
            var jsonElement = NSDictionary()
            let locations = NSMutableArray()
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                let location = LocationModel()
                
                //the following insures none of the JsonElement values are nil through optional binding
                if let FirstName = jsonElement["FirstName"] as? String,
                    let LastName = jsonElement["LastName"] as? String,
                    let UserId = jsonElement["UserId"] as? String,
                    let Email = jsonElement["Email"] as? String,
                    let Gender = jsonElement["Gender"] as? String
                {
                    
                    location.FirstName = FirstName
                    location.LastName = LastName
                    location.UserId = UserId
                    location.Email = Email
                    location.Gender = Gender
                    
                }
                
                locations.add(location)
                
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded(items: locations)
                
            })
        }
}

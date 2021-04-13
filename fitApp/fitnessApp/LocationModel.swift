import Foundation

class LocationModel: NSObject {
    
    //properties
    
    var FirstName: String?
    var LastName: String?
    var UserId: String?
    var Email: String?
    var Gender: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(FirstName: String, LastName: String, UserId: String, Email: String, Gender: String) {
        
        self.FirstName = FirstName
        self.LastName = LastName
        self.UserId = UserId
        self.Email = Email
        self.Gender = Gender
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "FirstName: \(FirstName ?? "None"), LastName: \(LastName ?? "None"), UserId: \(UserId ?? "None"), Email: \(Email ?? "None"), Gender: \(Gender ?? "None")"
        
    }
    
    
}

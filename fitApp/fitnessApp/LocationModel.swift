import Foundation

class LocationModel: NSObject {
    
    //properties
    
    var ExerciseName: String?
    var Weight: String?
    var Reps: String?
    var Sets: String?
    var Focus: String?
    var Description: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(ExerciseName: String, Weight: String, Reps: String, Sets: String, Focus: String, Description: String) {
        
        self.ExerciseName = ExerciseName
        self.Weight = Weight
        self.Reps = Reps
        self.Sets = Sets
        self.Focus = Focus
        self.Description = Description
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ExerciseName: \(ExerciseName ?? "None"), Weight: \(Weight ?? "None"), Reps: \(Reps ?? "None"), Sets: \(Sets ?? "None"), Focus: \(Focus ?? "None") Description: \(Description ?? "None" )"
        
    }
    
    
}

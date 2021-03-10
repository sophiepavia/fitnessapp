//
//  ExerciseTableViewController.swift
//  fitnessApp
//
//  Created by Jack Garthwaite on 3/10/21.
//

import UIKit

struct Exercise{
    var Exname: String
    var Diff: String
}

class ExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exLabel: UILabel!
    
    @IBOutlet weak var Difficulty: UIImageView!
}

class ExerciseTableViewController: UITableViewController {

//MARK: Properties
    
    let exercises = [
        Exercise(Exname: "Sit-up", Diff: "Hard"),
        Exercise(Exname: "Push-up", Diff: "Easy"),
        Exercise(Exname: "Pull-up", Diff: "Medium"),
        Exercise(Exname: "Bicep Curls", Diff: "Easy"),
        Exercise(Exname: "Squats", Diff: "Medium"),
        Exercise(Exname: "Lunges", Diff: "Easy"),
        Exercise(Exname: "Russian Twists", Diff: "Hard"),
        Exercise(Exname: "Jumping Jacks", Diff: "Medium"),
        Exercise(Exname: "Hammer Curls", Diff: "Hard"),
        Exercise(Exname: "Shoulder Press", Diff: "Hard"),
        Exercise(Exname: "Planks", Diff: "Medium"),
        
        
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadSampleEx()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell

        let exercise = exercises[indexPath.row]
        cell.exLabel?.text = exercise.Exname
        cell.Difficulty?.image = UIImage(named: exercise.Diff)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    
    

    
}

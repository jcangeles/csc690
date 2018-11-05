# csc690
Projects for SFSU CSC 690

//TO-DO APP
1. A UITableView shares both uncompleted tasks. They differ by the checkmark on the right side.
2. A "+" button was added in the nav bar; uses an UIAlertController.
    This design was by choice has tasks are simple (only a title/brief description)
    A whole new view to add a new task would have been overkill.
    Comes with a "cancel", "ok" button.
3. For the edit aspect of the task, I added a swipe left functionality to delete selected task.
4. Marking the task as completed constitutes checking the martk on the right side.
5. Uncompleted and completed tasks share the same UITableView.
6. The app saves data to UserDefaults, closes and reopens without losing tasks.
    The Task class (model) follow the Codable Protocol and incorporates both decoder init and encoder func. 
    The ViewController takes care of the encoding from the viewDidLoad func. 
    Uses observer notification from UIApplication.didEnterBackgroundNotification to call specific func in VC.
    
Notes:  
a. All requirements met and fully working. (Tested on personal iPhone 6s+).  
b. Model, View, VC implemented properly. Unit tests are included for the Task class.  
c. Works both in landscape and portrait mode.  

    
        
            
//SPYAPP

This simple app contains 4 simple ciphers with encoding/decoding options.
Note: unit testing stopped working for XCode 10, works fine on previous versions
Requirements for each cipher are the following:


1. Caesar
    Input: Anything
    Key: numeric
2. Alphanumeric Caesar
    Input: alphanumeric
    Key: numeric
3. Vigenere
    Input: alphabetic
    Key: alphabetic
4. Atbash
    Input: alphabetic
    Key: not required.

# Coordinator Pattern

### Problem:

> UIViewController: 
is it view or is it controller ? 
The MVC pattern relies on stuffing the viewController with much functionalities it may contain:

1- Inserts new model objects 
2- NSFetchedResultsControllerDelegate 
3- Handles Navigation
4- TableView Delegates 
4- datasources ....

### Coordinator pattern helps in:

1- Control the flow of the app
2- Handle iPhone/iPad variants 
3- Handle A\B testing variants 


# Steps to create coordinators 

1- create a coordinator protocol 
- contain a child of coordinators 
- navigation controller instance 
- start method ... start()

2- add a concrete implementation of that protocol
3- connect the viewController to the coordinator, ViewController shall no more be responsible for creating other viewControllers and presenting it, remove tight coupling.



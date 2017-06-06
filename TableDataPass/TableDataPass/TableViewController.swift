import UIKit
import GoogleMaps

class FirstTableView: UITableViewController {
  
  @IBOutlet weak var myImage: UIImageView!
  
  var coordinates = [
    FirstTable(location:"600 E Grand Ave, Chicago, IL 60611",name: "Navy Pier",latitude: 41.892269,longitude:  -87.607770),
    FirstTable(location:"E Pearson St, Chicago, IL 60611",name:"Old Water Tower",latitude: 41.897201,longitude: -87.624416),
    FirstTable(location:"111 S Michigan Ave, Chicago, IL ",name: "The Art Institute of Chicago", latitude: 41.879600,longitude: -87.623692),
    FirstTable(location:"201 E Randolph St, Chicago, IL 60602 ",name: "Millenium Park", latitude: 41.882680,longitude: -87.623326),
    FirstTable(location:"200 S Lake Shore Dr, Chicago, IL 60605 ",name: "Shedd Aquarium", latitude: 41.867621,longitude: -87.613952),
    FirstTable(location:"1400 S Lake Shore Dr, Chicago, IL 60605 ",name: "The Field Museum", latitude: 41.866214,longitude: -87.616913),
    FirstTable(location:"1300 S Lake Shore Dr, Chicago, IL 60605 ",name: "Adler Planetarium", latitude: 41.866214,longitude: -87.606442),
    FirstTable(location:"33 S Wacker Dr, Chicago, IL 60606 ",name: "Willis Tower", latitude: 41.879084,longitude: -87.635915),
    FirstTable(location:"1060 W Addison St, Chicago, IL 60613 ",name: "Wrigley Field", latitude: 41.948582,longitude: -87.655204),
    FirstTable(location:"1337 E Randolph St, Chicago, IL 60601 ",name: "Grant Park", latitude: 41.882796,longitude: -87.618209),
    FirstTable(location:"1410 Museum Campus Dr, Chicago, IL 60605 ",name: "Soldier Field", latitude: 41.862393,longitude:-87.615444),
    FirstTable(location:"78 E Washington St, Chicago, IL 60602",name: "Chicago Cultural Center", latitude: 41.883738,longitude: -87.624994),
    FirstTable(location:"301 S Columbus Dr, Chicago, IL 60605",name: "Buckingham Fountain", latitude: 41.875746,longitude: -87.618862),
    FirstTable(location:"Lakefront Trail Chicago, IL 60605 ",name: "Lakefront Trail", latitude: 41.884913,longitude: -87.613167),
    FirstTable(location:"5700 S Lake Shore Dr, Chicago, IL 60637",name: "Museum of Science and Industry", latitude: 41.790685,longitude: -87.583066)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return coordinates.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = coordinates[indexPath.row].name
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
    let destintationViewController = segue.destination as! ViewController
    
    var secondTableArrayTwo: FirstTable
    secondTableArrayTwo = coordinates[indexPath.row]
    destintationViewController.userLatitude = secondTableArrayTwo.latitude
    destintationViewController.userLongitude = secondTableArrayTwo.longitude
    destintationViewController.userAddress = secondTableArrayTwo.location
    destintationViewController.userLocation = secondTableArrayTwo.name
  }
  
}


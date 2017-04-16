# MVVM-SwiftExample

[MVVM-Example-in-Swift](http://candycode.io/a-practical-mvvm-example-in-swift-part-1/)를 읽고 진행하였으며, 이후 개인적인 깨달은 점을 공유하고자 글을 쓴다.

## MVVM의 필요성
ios 개발을 하다보면 정말 누구나 느낀다. `ViewController`는 만능이다. 그러나 너무 무겁다. 정말 `ViewController`가 못하는 것이 없기 때문에 굉장히 무거워지고 결국 유지보수하기 너무 힘들다. 이를 해결하기 위해서 나온 패러다임이 MVVM이다. 기존의 MVC패턴의 `Model`, `View`, `Controller` => `Model`, `View`, `ViewModel`, `Controller`로 쪼갠다.


## 구조
### Model의 역할
평소 알던 `Model`의 역할을 그대로 충실히 따르자.

```swift
class Car {
    var model: String
    var make: String
    var kilowatts: Int
    var photoURL: String
    
    init(model: String, make: String, kilowatts: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.kilowatts = kilowatts
        self.photoURL = photoURL
    }
}
```

### ViewModel의 역할
여기서부터 핵심이다. 변수명만 봐도 뭔가 `Model`과 `ViewController`의 매개지점이라는 것이 느껴진다. `Model`에 있는 property와 향후 `View`에서 보여주어야할 property에 해당하는 변수들을 선언해준다.

```swift
class CarViewModel {
    private var car: Car
    static let horsepowerPerKilowatt = 1.34102209
    
    var modelText: String {
        return car.model
    }
    
    var makeText: String {
        return car.make
    }
    
    var horsepowerText: String {
        let horsepower = Int(round(Double(car.kilowatts) * CarViewModel.horsepowerPerKilowatt))
        return "\(horsepower) HP"
    }
    
    var titleText: String {
        return "\(car.make) \(car.model)"
    }
    
    var photoURL: NSURL? {
        return NSURL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
}
```

### ViewController의 역할
`View`에 보여질 `property`들은 이미 `ViewModel`에서 정의했으니 이제 `Controller`에서는 `ViewModel`에서 정의한 property들을 말 그대로 **Control**하는 역할을 수행한다(닉값한다). 

```swift
class TableViewController: UITableViewController {

    let cars: [CarViewModel] = (UIApplication.shared.delegate as! AppDelegate).cars

    ...
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let carViewModel = cars[indexPath.row]
        
        cell.textLabel?.text = carViewModel.titleText
        cell.detailTextLabel?.text = carViewModel.horsepowerText

        return cell
    }
```
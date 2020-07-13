# Notes From Udemy
### To organize what I learned from Udemy such as theories and tips.

---

**Computed Properties**

Getter

A getter will execute the code in order to get the value of its property.
You don’t need to create an extra method.

e.g. 
```swift
var calcNumber: Int {
    get {
        return calcNumber - 4
    }
}
```

Setter 

A setter allows you to specify some code that should be executed when its value is set.

Called the exact moment that the property is set with a new value.

newValue is predefined in the setter.

e.g. 
```swift
var calcNumber: Int {
    get {
        return calcNumber - 4
    }
    set {
        print(“calcNumber has a new value, \(newValue)”)
    }
}    

calcNumber = 12
```

Complete e.g. with Pizza Calculator
```swift
import Foundation

let pizzaInches: Int = 12
var numberOfPeople: Int = 4
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 2
print(numberOfPeople)

Observed Properties

willSet { executing first }
didSet { coming straight afterwards }

e.g. var pizzaInches: Int = 12 {
    willSet {
    }
    didSet {
        if pizzaInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInches = 18
        }
    }
}

pizzaInches = 33
print(pizzaInches)
```

Challenge

e.g. 
```swift
import Foundation

var width: Float = 1.5
var height: Float = 2.3

var bucketOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf(numberOfBuckets) // round up
        return Int(roundedBuckets)
    }
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
}

print(bucketOfPaint)

bucketOfPaint = 2
```

Computed Properties is useful in cutting down on unnecessary functions and methods and it also makes your code a lot easier to maintain.

---

**Difference between Cocoa Touch Class and Swift File**

Cocoa Touch Class: When you want subclass

Swift File: When you create your own custom class

---

**How to create machine learning models.**

Learned how to create own ML model for an image recognition.
Ctrl + Click 'Xcode' -> Open Developer Tool -> Create ML
Image Classifier -> Drag Directories of Traning Data and Testing Data

e.g. Can learn from Simple Recognition App

```swift
import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera // .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Could not conver to CIImage.")
            }
            
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: nameOfmlmodel().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first {
                if firstResult.identifier.contains("") {
                    self.navigationItem.title = ""
                    self.navigationController?.navigationBar.backgroundColor = .blue
                } else {
                    self.navigationItem.title = ""
                    self.navigationController?.navigationBar.backgroundColor = .red
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
}
```

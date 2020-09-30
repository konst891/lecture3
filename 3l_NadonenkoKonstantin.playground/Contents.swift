import Foundation

enum EngineState {
    case launched, stopped
}

enum WindowState {
    case open, close
}

enum TrunkState {
    case full, empty
}

enum Tyres: String{
    case pirelli = "Pirelli"
    case nokian = "Nokian"
    case michelin = "Michelin"
}

struct RegularCar {
    var brand: String
    var year: String
    var tyres: Tyres
    mutating func switchTyres(newTyres: Tyres) {
        switch newTyres {
        case .pirelli:
            print("\(brand) switched to \(newTyres.rawValue)")
        case .michelin:
            print("\(brand) switched to \(newTyres.rawValue)")
        case .nokian:
            print("\(brand) switched to \(newTyres.rawValue)")
        }
    }
    var trunkState : TrunkState
    var trunkVolume: Double {
        willSet {
            if(trunkState == .empty) && (trunkVolume > 0) && (newValue < trunkVolume) {
                let volumeLeft = trunkVolume - newValue
                print("\(brand) trunk volume left \(volumeLeft)")
            } else {
                print("\(brand) has no space")
            }
        }
    }
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print("\(brand) trunk is empty")
    }
    var engine: EngineState {
        willSet {
            if newValue == .launched {
                print("\(brand) engine will be launched")
            } else {
                print("\(brand) engine will be stopped")
            }
        }
    }
    var window: WindowState {
        willSet {
            if newValue == .open {
                print("\(brand) windows would be open")
            } else {
                print("\(brand) windows would be closed")
            }
        }
    }
}

struct Truck {
    var brand: String
    var year: String
    var hasSleepZone: Bool
    mutating func fillSleepingZone(_ value: Bool) {
        hasSleepZone = value
        print("In \(brand) someone sleeps")
    }
    var trunkState : TrunkState
    var trunkVolume: Double {
        willSet {
            if(trunkState == .empty) && (trunkVolume > 0) && (newValue < trunkVolume) {
                let volumeLeft = trunkVolume - newValue
                print("\(brand) trunk volume left \(volumeLeft)")
            } else {
                print("\(brand) has no space")
            }
        }
    }
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print("\(brand) trunk is empty")
    }
    var engine: EngineState {
        willSet {
            if newValue == .launched {
                print("\(brand) engine will be launched")
            } else {
                print("\(brand) engine will be stopped")
            }
        }
    }
    var window: WindowState {
        willSet {
            if newValue == .open {
                print("\(brand) windows would be open")
            } else {
                print("\(brand) windows would be closed")
            }
        }
    }
}

var bmwCar = RegularCar(brand: "BMW", year: "2020", tyres: .michelin, trunkState: .empty, trunkVolume: 300.0, engine: .stopped, window: .close)
var toyotaCar = RegularCar(brand: "Toyota", year: "2019", tyres: .nokian, trunkState: .full, trunkVolume: 500.0, engine: .launched, window: .open)
bmwCar.trunkVolume = 200.0
bmwCar.engine = .launched
bmwCar.switchTyres(newTyres: .pirelli)
toyotaCar.engine = .stopped
toyotaCar.window = .close

var mercedesTruck = Truck(brand: "Mercedes", year: "2012", hasSleepZone: true, trunkState: .full, trunkVolume: 1000.0, engine: .launched, window: .close)
var renaultTruck = Truck(brand: "Renault", year: "2020", hasSleepZone: false, trunkState: .empty, trunkVolume: 300.0, engine: .stopped, window: .close)
mercedesTruck.emptyTrunk()
mercedesTruck.engine = .stopped
mercedesTruck.fillSleepingZone(false)

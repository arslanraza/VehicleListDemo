[![Build Status](https://travis-ci.org/arslanraza/VehicleListDemo.svg?branch=master)](https://travis-ci.org/arslanraza/VehicleListDemo)

# VehicleListDemo
This app displays a list of Vehicles in a tableView and on a map as pins.

## Platform:

* XCode 9.3
* Minimum iOS Version: 10.0
* Supports all oritnataions and devices using AutoLayouts

---
## About:

* The goal of the project is to create an app that displays a list of Vehicles in a colletion (TableView). The user should also be able to switch the view to map and can see the vehicles as pin on the map.

## Structure:

* The app is divided in 3 main targets

### 1. VehicleListDemo

* This target uses MVVM pattern to layout the UI. The ViewModels hold the business logic and the network interactions. They do not know about the views which makes them reuseable and portable for different projects.

* **ListViewConttroller**: Displays a list of Vehicle with their position on the map
* **MapViewController**: Displays vehicle as pins on map. Change the map will fetch the vehicle information for tha visible area and annotate the newly returned pins.

### 2.. VehicleDemoCore (framework)

* Defines the entities that will be used in the app. The entities conforms to Codable protocol for json serialization. 
* The entities can be used in both iOS and Objective-C classes.

### 3. VehicleDemoNetwork (framework)

##### Network

* Defines a generic protocol based APIClient and Result class that carries out the network operations.

## Unit Tests

##### Unit tests are written using _**QUICK**_ and _**NIMBLE**_ frameworks and covers the following targets

* Model serialization in **VehicleDemoCore** framekwork
* Network operations in **VehicleDemoNetwork** using mock APIClient and and MockURLSession to mimic the behavior of the server.

##### Code Coverage:

* VehicleDemoreNetwork: 50%
* VehicleDemoCore: 100%

## 3rd Party frameworks

##### Following frameworks has been used

* **QUICK**: BDD unit testing framework
* **NIMBLE**: A matcher framework to make expectations in unit tests more readable.

## Suggested Improvements & Assumptions:


* The List and Map controllers have their own viewModels for the purpose of this demo and to show swift to objective-c and objective-c to swift compatibility..
* Ideally they both can be combined in a single tabbase controller to switch between list and map view and can share the same **viewModel**. 
* Vehicle detail view.
* We can add more test coverage for UI. Due to time constraint it couldn't be done now..

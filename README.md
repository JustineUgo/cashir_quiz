# Cashir Quiz

This is a solution to an interview challenge from [cashir.app](https://cashir.app/). In this challenge I am to design a survey application to collect data from users, I am expected to get user responses and persist them locally. I am required to also get and display submitted responses.

<p align="center">
    <img src="https://raw.githubusercontent.com/JustineUgo/cashir_quiz/main/assets/quiz.jpg" width="240" height="480">
</p>

## About Cashir
Never worry about running out of cash. With Cashir, you can withdraw cash without going to the bank and this is one of many other benefits of being the bank.

Get cash or transfer all for free without joining banking hall queues.

* Cash withdrawals
* Cash deposits
* Cash transfers
* Access loans
* Manage transactions
* Transact securely

## Flutter

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

This project is built with flutter.

To check if you have flutter installed, run

```
flutter doctor 
```
if you don't have flutter installed and setup, follow this: [How to setup Flutter](https://docs.flutter.dev/get-started/install)


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/JustineUgo/cashir_quiz.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Connect your mobile phone or emulator and run this command:

```
flutter run
```

## Modules

* Home
* History - convers past quizzes answered, with the score
* Questions - covers the generation of the quizzes

## Details

* Framewort: [Flutter](https://flutter.dev/) > 2.5 with Null Safety
* Architectural pattern: MVC(Model-View-Controller)
* Storage(local): [GetStorage](https://pub.dev/packages/get_storage)
* State management: [GetX](https://github.com/mobxjs/mobx.dart)
* API: https://opentdb.com/api.php?amount=10&category=28&type=multiple

## Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
|- web
```

Here is the folder structure we have been using in this project

```
lib/app
|- data/
|- modules/
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `api endpoints`, `preferences` etc.
2- modules - Contains the 3 different modules of the app. 
3 - routes.dart?????????This file contains all the routes for your application.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- alerts.dart
|- end_points.dart
|- images.dart
|- stylings.dart
```

### Modules

Contains the 3 different modules of the appplication.

```
modules/
|- history/
|- home/
|- questions
```
Folders found in each module:

```
controllers - this is where the logic of the app is written.
views - contains the ui of the module. 
providers?????????contains the network calls.
models - contains the application's dynamic data structure
```



### Routes

This file contains all the routes for your application.

```
routes/
|- app_pages.dart
|- app_routes.dart
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.



## Conclusion

I will be happy to answer any questions that you may have on this project. ????

If you liked my work, don???t forget to ??? star the repo.

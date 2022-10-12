# Mphasis_Test



Functional:

    Fetching and parsing data from API for Peole and Rooms.
    Listing Data.
    Navigation to Details view.
    Accessibility

Non-Functional:

    Scalability:
        Modularity.

    Reliability/Testable:
        Unit tests.

Design Decisions

    UI:
        Storyboard
        SwiftUI
        MVVM Architecture
        

    Principals and Patterns:
        SOLID conformance:
        Utilizing IoC and DI.
        Factory pattern



What could be improved


Improvements in the app.

1) lazy loading of profile images.
2) UI test cases.
3) Better error handling
4) Accessibility optimization. Currently it only support accessibility-value.
5) Search functionality on Contacts/People screen to search person/contact. 
6) Test cases to test jSON parsing. 
7) UISize classes to support dynamic fonts in case of iPhone and iPAD.



About


This project is based on Storyboard with SwiftUI implemented as individual view.
It is designed using MVVM architecture and also following SOLID principles.
The project also has accessibility feature enabled for fonts and values.
It has test cases to test URL generation and also View model test cases. This test cases can be extended to cover maximum code area as and when required.
The HTTPLayer and URL generator, takes into consideration about extension of api's.
It maintans a centralized theme which can be re-branded as per requirement.
Ihe app is iOS 11 compatible, but due to constraint it has been tested from iOS12 and above.( Current testing is done on iOS 12.4, iOS 13 and iOS 15.5)
It is a universal app project supporting both iPhone and iPAD.

Swift 100.0% 








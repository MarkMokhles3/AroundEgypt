# AroundEgypt
You just got a front-row ticket to experience Egypt’s most remarkable spots like never before!

# OIntroduction

Your task is to create 2 simple screens of an existing app called “Around Egypt”, these screens will show a simple listing of multiple virtual tours experiences

# Technical requirements

●    The app should be written in Swift using Xcode and conform to the MVVM architecture.
●    The app should use a caching mechanism to store the data locally and be available offline and refresh data online.
●    Feel free to use Pods/SPMs if needed.

# What to build

●    Home Screen 
●    Implement the screen programmatically using SwiftUI
●    UI (use Figma as reference)
●    Recommended experiences list (Horizontally)
●    Most recent experiences list (Vertically)
●    All list data should be available even if the app is offline 
●    Actions
●    Show experience: 
●    On click : Navigate to the experience screen
●    Like experience:
●    Use the “Like an experience” api
●    Use api response as the updated likes count
●    Update experience like state & count locally
Note : user can't unlike, can like only
●    Search:
●    Add IME search action to the search text field
●    On search IME click: Show search results (use Figma as reference)
●    Clear search:
○    On click: Exit the search state and show the default home data back
●    Experience Screen
●    Implement the screen using SwiftUI
●    UI (use Figma as reference)
●    Show experience details as a sheet
●    Actions
●    Like experience: (same like Home Screen )
●    Testing
●    Add appropriate UI/Unit testing as needed across the app.

# Before you get started

Design reference
●    Please use this Figma file as a UI reference


Backend Apis
●    Please use the following apis using this host  aroundegypt.34ml.com
○    GET Recommended experiences
■    /api/v2/experiences?filter[recommended]=true
○    GET Recent experiences
■    /api/v2/experiences 
○    GET Search experiences
■    /api/v2/experiences?filter[title]={search_text}
○    GET Single experience
■    /api/v2/experiences/{id}
○    POST Like an experience
■    /api/v2/experiences/{id}/like

# How to submit

Please share the project on a public repository on github and share the url with us.

Time estimate
Should take about 7 to 10 hours depending on your experience but you have 3 days to complete it on your own schedule

Evaluation criteria:
●    Functionality: Does the app meet the requirements outlined above? Does it work as expected and without bugs?
●    Code Quality: Is the code well-organized, easy to read, reusable and maintainable?
●    UI: Does the app show correct UI measurements like Figma?
●    Architecture: Is the app's architecture well-designed and appropriate for the task?
●    Design Patterns: Did you use appropriate design patterns to solve the problem at hand?
●    Testing: Did you write valid & sufficient UI/Unit tests?
●    Git Understanding: Does the submission demonstrate understanding of Git version control? Are commits frequent, descriptive, and well-organized?

# Bluedit

A simple replica of the Reddit app with some basic functions. 

### App Design

The app was design to mimic the Reddit app, in terms of UI and some of the logic. The app is using Swift. The app is centered around the MVVM design pattern throughtout the app. The app uses a Singleton class to help in the storing of data throughout the app in a session. 

### Boilerplate / Generated Code

No boilerplates were used, as in the codes were typed from scratch and not pulled or forked from another pre-set template.
Mock data for topics were generated using ChatGPT.

### Libraries Used

1. ObjectMapper 

### Assumptions 
1. The title of the new topic does not have a limit.
2. Users can upvote and downvote any topic multiple times. Meaning that they can downvote Topic 1 multiple times.
3. That any other additional features are not needed if not stated in the requirements. So ie, there is no comments feature, no editing the post body text style, no selecting the community to use, etc.
4. Assumptions on a bunch of padding and sizes, basically eyeballing the scales etc

### Prerequisites

1. App is build to run on iOS 17.2 and above
2. App only runs on iOS 

### Installation Steps

1. run `Pod install` from terminal 
2. Build app on preferred simulator via xcode

## Implementations
<img src="https://github.com/WickedBiscuit/Bluedit/blob/development_readme/Screenshots/Launch.png" alt="Image Alt Text" width="200" />
<img src="https://github.com/WickedBiscuit/Bluedit/blob/development_readme/Screenshots/HomeScreen.png" alt="Image Alt Text" width="200" />
<img src="https://github.com/WickedBiscuit/Bluedit/blob/development_readme/Screenshots/TopicDetail.png" alt="Image Alt Text" width="200" />
<img src="https://github.com/WickedBiscuit/Bluedit/blob/development_readme/Screenshots/AddTopic.png" alt="Image Alt Text" width="200" />

## Key Features

- [x] View list of topics.
- [x] Submit a new topic.
- [x] Vote on topics.
- [x] Expand on topics to view in full.
- [x] View top topics based on upvotes.
- [x] In-memory storage to store data in memory
- [x] Project test  

### Secondary Feature / Code Enhancements 

- [ ] Integrating api calls
- [ ] Adding community list selection for Add Post feature
- [ ] Adding side menu
- [ ] Adding comments
- [ ] Adding share
- [ ] Adding more options when creating post
- [ ] Integrating Base View Controllers and Base Table View Cells as templates for UI codes  



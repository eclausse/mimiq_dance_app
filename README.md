# Mimiq Dance Application Demo

## Getting Started

### Setup Firebase

Follow the instruction given here: https://firebase.google.com/docs/flutter/setup?platform=web

#### Firestore Database

Once you have link your firebase project with the application, create a Firestore database. 
In the database, create a collection named 'studio'.

*Add new entry*
Create a document with those informations:
- name: String
- address: String 
- description: String
- category: String (ballet, jazz, freestyle)
- latitude: Number
- longitude: Number

### Add your Google API

In index.html, put your Google API Key:

```html
29:   <script async src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE&callback=console.debug&libraries=maps,marker&v=beta"></script>
```

## Run the application

```bash
flutter run -d chrome
```

# Author

Evan Clausse
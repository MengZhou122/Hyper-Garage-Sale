# hypergaragesale

A new Flutter application.

## Getting Started

This project is a Smartphone application to publish garage sale information.

1. After loading the project into IDE, click 'get packages' which is highlighted under the toolbar to load packages and libraries.

2. Libraries and packages including Location, Geolocator, Firebase (Auth, FireStore), Google Map, etc.

## Screen Route Navigation Logic:
![Image if Navigation Logic](https://github.com/MengZhou122/hyper_garage_sale/blob/master/images/Navigation%20Logic.png)

1. Welcome Screen is the entrance of the app and gives two options: Login or Register, two FloatingActionButton will lead to related pages.

2. Login / Register Screen needs to input email and the correct password for authentication. After that, the Category Screen will be popped out.

3. In Catagory Screen, there are six options. Without choose one of them, you can not go to the next page. After selecting a category, you can go to Post Screen to make a new publishment or Item List Screen to check available products.

4. Post Screen will need to input product info, address button will get publisher's location automatically after getting permission, add picture button will active rear camera and lead to Camera Screen to take a picture(currently support upload up to 4 images). After post successfully, Item List Screen in the same category will pop out for review, and you will find that your post is at the top of the list.

5. Camera Screen will present the view of the rear camera, press the picture button to capture it and go to Picture Preview Screen.

6. Picture Preview Screen will show the picture just taken and offer two options: use the current picture of retake it. Press retake button will pop back to Camera Screen, and press use it button will add this photo to Post Screen.

7. Item List Screen will show all available items in a scrollable list view. The product name and price will show in a colored block, two different colors are used to distinguish the poster(blue means published by current user and grey color means published by others). A stream is built to keep updating the new post, the most recent published post is rank at the top.

8. Item Detail Screen presents the post detail information. A list of pictures is encapsulated in an Animator for Zoom up. A Google Map widget is added at the bottom to present the publisher's location.

Enjoy coding! --zm

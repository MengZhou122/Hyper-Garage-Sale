# hypergaragesale

A new Flutter application.

## Getting Started

This project is a Smartphone application for publish garage sale information.

1. After loaded the project into IDE, click 'get packages' which is highlighted under the tool bar to load packages and libaries.

2. Libraries and packages including Location, Geolocator, FireBase (Auth, FireStore), Google Map, etc.

## Screen Route Navigation Logic:
![Image if Navigation Logic](https://github.com/MengZhou122/hyper_garage_sale/blob/master/images/Navigation%20logic.png)

1. Main Screen gives two options: Login or Register, two FloatingActionButton will leads to related pages.

2. Login / Register Screen needs to input email and correct password for authentication. After that, Category Screen will be poped out.

3. In Catagory Screen, there are six options. Without choose one of them, you can not go to next page. After selext a category, you can go to Post Screen for make a new publishment or Item List Screen to check available products.

4. Post Screen will need to input prodcut info, address button will get publisher's location automatically after get permission, add picture button will active rear camera and lead to Camera Screen to take a picture(currently support upload up to 4 images). After post sucessfully, Item List Screen in same catefory will pop out for review, and you will find that your post is at the top of the list.

5. Camera Screen will present the view of rear camera, press picture button for capture it and go to Pricture Pewview Screen.

6. Pricture Pewview Screen will show the picture just taken and offer two options: use current picture of retake it. Press retake button will pop back to Camera Screen, and press use it button will add this photo to Post Screen.

7. Item List Screen will show all available items in a scrollale list view. The product name and price will show in a colored block, two different color are used to distigush the poster(blue means published by current user and grey color means published by others). A stream is built to keep updating the new post, the most recent published post is rank at top.

8. Item Detail Screen present the post detail information. A list of pictures is encapsulated in a Animator for Zoom up. A Google Map widget is added at the bottom to present the publisher's location.

Enjoy coding! --zm

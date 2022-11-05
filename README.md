# My Resume App

This is a flutter app that shows an interactive resume. Named "Rezoomay", it has both
dark and light modes, and ability to switch between two different languages: English and 
French.

## Code Base Description
The architecture of the app follows the Model-View-Controller pattern.
There are five folders that contain related files. They are
- Models: contains models of data used in app
- Providers: contains files that describe the classes used in state management
- Translations: files that translate the app into different locales
- Views: contain the files that actually contain UI codes
- Widgets: for resuable widgets.

## Design
The app was absolutely designed by me and is really minimalistic.
It has 5 pages namely: Splash screen, onboard screen, home screen, skills and experinces and
social media screens. 

## Libraries used
Some of the third party libraries used to implement the functionalities include:
- easy_localization: this package assists with localizing the app and providing easy translations

- flutter_screenutil: this package helps with responsiveness

-  font_awesome_flutter: for getting access to few customized icons including those for social media sites

- google_fonts: for getting access to customized fonts from google

- provider: this is a popular package used for state management. The preferred solution because of it's popularity and support

- shared_preferences: this package is used for persisting data locally on user device. Mainly used for user preferences

- url_launcher: this library basically lets us run web links from within our app using the user's OS default settings

## Improvements
With more time, I would have added accessibilty support to the app such as semantics for screen readers and audio support to listen to pages.

## Links

- [Appetize.io](https://appetize.io/app/i2zrtmtuirlxdplw2pk2r2j4om?device=pixel6pro&osVersion=12.0&scale=75)

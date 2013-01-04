# Laberinto Radio Site

This is the official site from the Internet Radio Station [Laberinto Radio](http://www.laberintoradio.net]


## Brief description

This web site controls the radio station programming and schedules.

Each broadcaster has its own account. This account has elements such as avatars,
nickname, description and information about the program it plays.

The profile avatars are uploaded to Amazon S3 storage with the help of
paperclip gem.


The site a simple Chat located in [/chat](http://www.laberintoradio.net/chat)
that is used for the live interaction while a a program is airing.

There is a NodeJs implementation located [here](https://github.com/alanandrade/node-chatserver)
 that gives live to the web chat. In the front end we use Socket.IO in order
to make the websocket available for most devices. Check out /assets/javascript/chat.js.coffee
for more info.


In terms of 'design', there is a WIP on this [branc](https://github.com/alanandrade/laberintoRadioSite/tree/feature/style_shift)
that takes into account responsive grids as well as better aesthetics.
We use Compass, Sussy and obviusly SCSS.


## Testing

Most of the functionality of the application can be read in the rspec/ files.

Here you can find more about the role of each model, controller, and some views ?


There is some WIP on testing the application using cucumber, but we had trouble
integrating it with Authlogic. Some other examples still work though.

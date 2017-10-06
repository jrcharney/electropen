// File: electropen/app.js
// The Hello world example that Express uses.
// TODO: Use HTTPS

const express = require('express');   // Load the express library
const app = express();                // Create a new app object.

// req = request
// res = response
// Respond with "Hello World!" for a request to the root URL (/) or ROUTE.
// For every other path, it will respond with a 404 Not Found.
app.get('/', function (req, res) {
  res.send('Hello World!');
});

// Listen on port 3000 on the localhost for connections.
app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

// Doing it this way rather than the non-generator way doesn't create the scaffolding
// for a full Express app, but we aren't creating a full Express app for the moment.
// If we did  use the generator heres what would be created
// assuming we used "express --view=pug electropen"
//
// mkdir bin
// touch bin/www
// mkdir public
// mkdir public/images
// mkdir public/javascripts
// mkdir public/stylesheets
// touch public/stylesheets/style.css
// mkdir routes
// touch routes/index.js
// touch routes/users.js
// mkdir views
// touch views/error.pug
// touch views/index.pug
// touch views/layout.pug
//
// After that we could install more dependencies.
// npm install
//
// To run this app on MacOS or Linux
// DEBUG=electropen:* npm start
//
// To run this app on Windows
// set DEBUG=electropen:* & npm start

// To run this app do the following command
//    node app.js
// Use ^C to shut it off.

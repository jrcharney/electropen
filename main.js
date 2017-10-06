/* File: electropen/main.js
 * Info: The code for creating windows using electron.
 *       For a quick start guide visit
 *        https://electron.atom.io/docs/tutorial/quick-start/
 * TODO: Mix in Express.js and React. DO NOT use the generators!
 * How this works:
 *  Electron apps are strictured with minimum of three files.
 *    your-app/
 *    |- package.json
 *    |- main.js (this file)
 *    |- index.html (which would be in the win.loadURL() function, but I want to use Express)
 * To run this app:
 *    You need to install electron [insert instructions here] using npm
 *    This means you also need node [insert instruction here for that too]
 *    Once you have installed Electron to run globally with npm,
 *    you only need to run the app in your app's source directory
 *        electron .
 *    If you installed it locally, then run:
 *        ./node_modules/.bin/electron .    # macOS/Linux
 *    or
 *        .\node_modules\.bin\electron .    # Windows
 *
 * Exprress Hello World https://expressjs.com/en/starter/hello-world.html
 */

const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let win

function createWindow () {
  // Create the browser window.
  win = new BrowserWindow({width: 800, height: 600})

  // and load the index.html of the app.
  win.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html'),
    protocol: 'file:',
    slashes: true
  }))

  // Open the DevTools.
  win.webContents.openDevTools()

  // Emitted when the window is closed.
  win.on('closed', () => {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    win = null
  })
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (win === null) {
    createWindow()
  }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.

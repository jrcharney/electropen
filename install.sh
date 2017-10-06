#!/bin/bash
# File: electropen/install.sh
# Info: It doesn't install this software, rather it installs the node dependencies
#       if you don't have them yet.
# TODO: git stuff
# https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/

# https://www.programmableweb.com/api/codepen
# https://blog.codepen.io/documentation/

# If you want to make your own application first, create a folder
# my folder is the electropen folder where all the files and dependencies will go.
mkdir electropen
cd electropen
git init          # initalize the local directory as a git repository
git add .         # Adds the files in the local repository and store the for commit
git commit -m 'First commit'
git remote add origin https://github.com/jrcharney/electropen
git remote -v               # verify new remote
git push -u origin master   # push the local changes to the remote

# Express can be installed in two ways:
# * The generator way:     https://expressjs.com/en/starter/generator.html
# * The non-generator way: https://expressjs.com/en/starter/installing.html
# For now, let's do it the non-generator way.

# Use the npm init command to create a package.json file for your application.
#   See https://docs.npmjs.com/files/package.json
# For a complete list of usage.
npm init

# You'll be asked a lot of questions, but Express recommends hitting return through most of them
#   Except for the one about entry point
#        entry point: (index.js)
#   Enter app.js of whatever you want the name of the main file to be.
#   Electron uses main.js, so it might not be wise to call it that.
#   The default is index.js, so app.js seems good

# package name: (electropen)  ENTER
# version:      (1.0.0) 0.1.0             # Use sematic versioning! http://semver.org/
# description:  A local codepen program
# entry point: (index.js) main.js          # Let app.js be used for express, but main.js for electron
# test command: ENTER                     # You don't need to worry about this for now.
# git repository: https://github.com/jrcharney  # This is optional
# keywords: ENTER
# author: Jason Charney
# license: (ISC) MIT                    # Codepen is MIT, and I usually use MIT. We be MIT users!
# Is this ok? (yes) ENTER

# package.js is now created.
# Install Express locally and save it as a depedency (--save)
npm install express --save
# To install Express temporarily, and not add it to the dependency list,
#   use --no-save instead of --save
#
# With the --save option, a node_modules folder is created
#   containing folders full of all the dependencies.
# Another file called package-lock.json is also created.
# npm tells you that you should commit that file.
# package-lock.json is used to make sure that dependencies
# remain the same on all machines that the project is installed on.
# To see a list of all depdencies run
#   npm list
# To see which dependencies are outdated run
#   npm outdated
# Hopefully you can update those dependencies using the update command
#   npm update
# This link seems to have a good handle on what package-lock does
#   https://www.sitepoint.com/beginners-guide-node-package-manager/
# For the moment, let's not commit package-lock.json
git add package.json
git add package-lock.json

# Install electron using npm.
# The prefered method is to install it as a development dependency in your application (--save-dev).
# The --save-exact flag is also recommended as Electron does not follow semantic versioning
# I also recommend showing what happens verbosely. (--verbose)
npm install electron --save-dev --save-exact --verbose
# You can also install electron globally, but it won't be added to your dependencies
#   npm install electron -g --verbose

# With both of these installed, we can now use Express to simulate being online
# And Electron will act as the framework that contains the express page.
# I'll add more dependencies later.

# One thing we MUST do is create a .jshintrc file to tell the JSHint linter that we are using ES6
# and it doesn't nag at us for using the new features.
# Simply create a file in our directory called .jshintrc and write these lines
#     {
#       "esversion": 6
#     }
# A full detail on what all that does is available at http://jshint.com/docs/options/
# and an explaination as to why it happens in atom is at
#   http://trevorelwell.me/atom-error-const-is-available-in-es6-use-esversion-6/
git add .jshintrc

# We will use the Express Hello world example as our index.html that Electron will use.
# https://expressjs.com/en/starter/hello-world.html
# I would advise editing that hello world which is lacking of proper semicolons on several lines.
git add app.js

# You will also want to set up your git repository
# When you create it, you should ignore the node_modules folder

echo "node_modules" >> .gitignore
git add .gitignore
# This file might contain a list of other things worth adding to .gitignore
#   https://github.com/github/gitignore/blob/master/Node.gitignore

git commit -m 'Ready for the next steps.'
git push origin master

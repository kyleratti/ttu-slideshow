# ttu-slideshow

Friont-end and back-end application for the TTU Sports Slideshow website

# Installation

## Prerequisites

- `NodeJS v12.13.0 (LTS)` ([get](https://nodejs.org/en/download/))
- `Dropbox`
- `Git`

## Step-by-Step

1. Open `PowerShell`
2. Navigate to a common area, i.e. `cd C:\Users\myuser\Documents\Apps\`
3. Run `git clone --depth=1 https://github.com/kyleratti/ttu-slideshow.git ttu-slideshow`
4. Open the installation directory
   - Probably `C:\Users\myuser\Documents\Apps\ttu-slideshow-master`
5. Double-click `server-install-update.bat`
   - If you get any errors, you did something above incorrectly (**or are missing a prerequisite**)

# Updating

1. Open `PowerShell`
2. Navigate to the installation folder, i.e. `cd C:\Users\myuser\Apps\ttu-slideshow`)
3. Run `git pull`
4. **Double-click `server-install-update.bat`**

# Usage

Once installed, usage is very straightforward.

0. **If you just updated the app, you need to re-run `git pull` and `server-install-update.bat`**
1. Open the project directory
   - Probably `C:\Users\myuser\Documents\Apps\ttu-slideshow-master`
1. Double-click `server-start.bat`
   - Yes it's a batch file. Your IT department ~~probably~~ definitely has running `.ps1` files disabled.

# Purpose

This application was developed to act as a "reactive" slideshow for my sister to use during sports games for [TTU Sports](https://ttusports.com). It was originally conceived for the BC Bowl in 2019 to solve the problem of needing a way for student staff to submit photos into a slideshow that is running on another side of the building.

Several solutions were considered:

- Super long cable
  - Outside of Cat5e Ethernet specs and would therefore require multiple switches along the way
- Windows Photos app in slideshow mode
  - Doesn't automatically see changes on disk and change the slideshow
  - I think it's a turd of an app
- Adobe Spark

  - Must wait for photos to upload to and the output video to re-render in Adobe's cloud
  - Doesn't loop
  - Doesn't auto-play
  - Appears to generate a new web link each time

- `rclone` w/ read-only `Dropbox` mount

  - Adding/removing files does not trigger any file system events

# Solution

In the end it seemed easier to write a quick front-end in `React` with a back-end watching for file events on a specified folder. Turns out it actually works pretty well.

## `ttu-slideshow-backend`

The backend watches a directory (environment variable `WATCH_DIR`) for file created and file deleted events. The webserver will serve static content from the same directory (environment variable `PACKAGES_DIR`). When new/deleted file events are triggered, the server will extract the filename and broadcast it to all connected clients via WebSocket. On first connect, the server will send the client a full list of images instead of each one individually.

## `ttu-slideshow-frontend`

The frontend immediately establishes a WebSocket connection to the server (environment variable `API_SERVER`). Once established, it will receive a list of existing images and begin listening for new/removed images.

As soon as any images are loaded, it will begin cycling through them (assuming more than 1 is present).

## `ttu-slideshow-types`

Shared typings between the projects for Typescript to use during development.

# Credits

As always, my life-long friend [RoboPhred](https://github.com/robophred) is responsible for teaching me every programming language I know and "consulting" and assisting in the development of this app (particularly the React side).

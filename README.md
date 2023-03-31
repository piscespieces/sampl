# Sampl — Open Source Alternative To Splice (WIP)

- Ruby On Rail 7
- Postgresql
- TailwindCSS / DaisyUI
- ActiveStorage for File Uploads
- RSpec

### Under Construction 🚧

Sampl is still under construction but it can be launched locally

- Clone repository from GitHub
- Within the root directory run `bundle install` and `yarn install` to install all dependencies needed
- Create the database and run the migration files with `bin/rails db:create db:migrate`
- Run the `seeds.rb` file to seed the database with a `User` that can create `SamplePacks` — `bin/rails db:seed`
- Run the project in `localhost:3000` — If you want to launch the app in a different port, change the port number in the `Procfile.dev`
- Login, and have fun.

### Current Features

A regular `User` can login and see a list of all Sample Packs created by artists
A regular `User` can see the Samples that belong to a Sample Pack
A regular `User` can like Samples from a Sample Pack
A regular `User` can download Samples from a Sample Pack

An artist `User` can login and see a list of all Sample Packs created by other artists
An artist `User`can see the Samples that belong to a Sample Pack
An artist `User` cannot like Samples from a Sample Pack
An artist `User` can download Samples from a Sample Pack
An artist `User` can create Sample Packs and Samples that belong to the Sample Pack

### Upcoming tasks/features

- ~~Direct Uploads with ActiveStorage and Digital Ocean spaces~~
- ~~Deploy app as is~~
- ~~Create `My Liked Samples` section~~
- Create endpoint to download Sample Packs and it's associated Samples in a ZIP file for all `User`s
- ~~Add `Genre`to Sample Packs~~
- ~~Improve view layouts~~
- Create `StarredSamplesPacks` table for `User`s to star Sample Packs
- ~Create a Public Profile View for Artists and regular `Users`s can see it~
- ... 🚧

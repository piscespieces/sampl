# Sampl — Open Source Alternative To Splice (WIP)

- Ruby On Rail 7
- Postgresql
- TailwindCSS / DaisyUI
- ActiveStorage for File Uploads
- RSpec

### Under Construction 🚧

Sampl is still under construction but it can be launch locally

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

- Hook up S3 bucket for Image and Audio Uploads
- Deploy app as is
- Create `My Liked Samples` section for regular `Users`
- Create endpoint to download Sample Packs and it's associated Samples in a ZIP file for all `User`s
- Add `Genre` column to database for Sample Packs and include it's form field in the Sample Pack form
- Improve view layouts
- Add an Audio Data Analizer to Audio Uploads to determine Audio Quality and enforce audio quality validation
- Improve Audio Player design
- Create `StarredSamplesPacks` table for `User`s to star Sample Packs
- Create a Public Profile View for Artists and regular `Users`s can see it
- ... 🚧

### How's it going? (Image)

![Sampl Home Page](https://user-images.githubusercontent.com/49796875/225951604-757e39a2-679e-4cbb-a842-a5fc3bb6b661.png, "Sampl Home Page")

![Sample Pack Index Page](https://user-images.githubusercontent.com/49796875/225950707-30cd331c-5ce7-4108-a0df-32be987375d3.png "Sample Pack Index Page")

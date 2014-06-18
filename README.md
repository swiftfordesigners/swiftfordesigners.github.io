Swift for Designers
=====================
*Welcome to Swift for Designers!*

This is our blog, where we will share updates, information, techniques, and findings relating to Swift.

***Disclaimer:*** Only submit pull requests, issues, and code changes to the `source` branch. **The master branch is automatically built by Travis CI.**

[![Build Status](https://travis-ci.org/swiftfordesigners/swiftfordesigners.github.io.svg?branch=source)](https://travis-ci.org/swiftfordesigners/swiftfordesigners.github.io)

## Workflow
We have our own little workflow for developing and deploying the site. Here's the gist:

### Spin up the site
- Fork it!
- Clone your fork locally.
- `bundle install`
- `jekyll serve -w`

### Posting
- If you would like to add a post, you need to add it as a draft using `rake post`
  - You'll be prompted to add:
    - A post title
    - A single post category
    - Your author nickname (your first name, all lowercase)
    - Share text (text that will be added to tweets and other share functions)
    - Post text (an idea or short blurb to get your post started)
  - Now you can edit the post in your favorite text editor (we prefer Sublime Text 3)
- When you're satisfied with your draft, you can publish it by running `rake publish`
  - You will be prompted with a numbered list of posts. Enter the number of the post you want to publish, and it will automatically be moved into the `_posts` folder and a proper publishing date will be predended to the file name.
- After you publish your post, submit a pull request to the `source` branch. We'll review your post and either approve it, give you feedback to revise it, or deny it.
- If your pull request is merged into the `source` branch, the site will be built and `rake ping` will be run automatically to notify search engines and pingomatic about news posts and sitemap updates.

### Deploying
- When we're ready to deploy the site from the `source` branch, we'll run `rake deploy` to generate the site, commit all changes, and push the contents of `_site` onto the `master` branch.

## Contributing
In order to contribute, you need to follow some specific steps:

1. Fork this repo to your own account.
2. Create a feature branch: `git checkout -b my-awesome-feature`
3. Check your changed files into Git: `git add .`
4. Commit your changes: `git commit -am 'Adding an awesome feature'
5. Push the new branch to your forked repo: `git push origin my-awesome-feature`
6. Create a pull request to merge your feature branch into our source branch.

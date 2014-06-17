Swift for Designers
=====================
*Welcome to Swift for Designers!*

This is our blog, where we will share updates, information, techniques, and findings relating to Swift.

## Workflow
We have our own little workflow for developing and deploying the site. Here's the gist:

### Spin up the site
- Clone the source repo locally
- `bundle install`
- `jekyll serve -w`

### Posting
- If you would like to add a post, you need to add it as a draft using `rake post`
  - You can then enter your desired post title and edit the post in your favorite text editor (we prefer Sublime Text 3)
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
6. Create a pull request to merge your feature branch into our source branch.[![Build Status](https://travis-ci.org/swiftfordesigners/swiftfordesigners.png?branch=master)](https://travis-ci.org/swiftfordesigners/swiftfordesigners)
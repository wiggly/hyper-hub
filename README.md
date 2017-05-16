# HyperHub

A [Hyperloop](http://ruby-hyperloop.io) SPA to access [GitHub](https://github.com)


## Installation

Install dependencies.

```
bash$ bundle install
```

Run local web server.

```
bash$ bundle exec rails server
```

Then direct your web browser to the web server you just started, by default [http://localhost:3000]


## Usage

Currently the SPA only does one thing, displays a list of repositories on GitHub that you have access to.

Authorization is done through personal API tokens rather than OAuth right now for simplicity

There are only two routes currently, one to display repositories and another to configure your API token.


## Purpose

This project has been created to learn about how hyperloop can be used to wrap external APIs instead of using the isomorphic model and to provide a basis for tutorials and show fully working examples of routing, uncontrolled components, operations etc.


## Security

The API token is never sent anywhere except GitHub. Between browser sessions it is held in your browser's LocalStorage.

When generating an API token you may limit the access a particular token has, I recommend only creating tokens with minimal access.

**Please** do not allow the token to delete repositories, I do not think I will ever expose that functionality but I don't want people assuming the data is not real, this is all your reall ive data in GitHub...


## Roadmap

* OAuth
* Editable gists
* Better error handling
* Add pain points discovered to wiki
* Good example of editing resources with uncontrolled component forms

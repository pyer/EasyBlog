# Easy
Ruby static web site generator

## Usage

- rake build : builds HTML pages in `site` directory.
- rake clean : deletes `site` directory and temporary files.
- rake run   : runs Webrick server. Then the web site can be tested on [http://localhost:8080]

## Content

### Pages

Pages are the most basic building block for content.

The simplest way of adding a page is to add an HTML or Markdown file in the `pages` directory. The file name will be the title of the site page.

Markdown files use a .md extension and are converted to HTML on build.

### Posts

Posts are in `posts` directory.
  
To add a new post, simply add a Markdown file in the `posts` directory that follows the convention `YYYY-MM-DD_name-of-post.md`.

The file name is converted to the date and the title of the post.

## Layouts

Layouts are templates that wrap around your content. They allow you to have the source code for your site in one place so you don’t have to repeat things like your navigation and footer on every page.

Layouts, theme and CSS are in `templates` directory.

# Jekyll Content Block Plugins

**Content block plugins** for [Jekyll](http://jekyllrb.com/) that allow you to wrap your markdown inside html sections. This is especially useful with CSS grid frameworks, such as [Bootstrap](https://getbootstrap.com) or [Flexbox Grid](http://flexboxgrid.com).

## Installation

Download and unzip, then place `row.rb` and `col.rb` inside the `_plugins` directory at the root of your Jekyll site (create one if it doesn't exist). Stop and restart your server to initialize the plugins.


## Usage

The plugins allow you to specify rows and columns, which are basically `<div>` elements that wrap around your markdown. This is especially useful for incorporating Bootstrap style rows with responsive columns into long-form webpages without needing to resort to multiple markdown (.md) files. On one website, these plugins allowed me to use one markdown file for an entire page, where normally I would have had to use 12!


### Tags

Insert this into one of your Jekyll markdown files (below frontmatter, as usual), for example `index.md` at the root of your site:

~~~
{% row %}
{% col %}

## Markdown content goes here

This gets rendered as markdown.

{% endcol %}
{% endrow %}
~~~

This would get rendered as:

~~~
<div>
  <div class="row">
    <div>
      <h2>Markdown content goes here</h2>
      <p>This gets rendered as markdown.</p>
    </div>
  </div>
</div>
~~~

The ending tags (endcol, endrow) are required.


### Row parameters

There are a few parameters you can use with the row tag:

- ID
- Classes
- Background image

Parameters are inserted as simple strings, separated by `|`

~~~
{% row id | classes | background-image.jpg %}
...
~~~

Which would render like this:

~~~
<div id="id" class="classes" style="background-image: url(/assets/images/background-image.jpg)">
  <div class="row">
...
~~~

To define only the background image for your div wrapper, for example, leave id and classes empty:

~~~
{% row || background-image.jpg %}
...
~~~


### Col parameters

Column tag accepts 2 parameters:

- Classes
- Background image

~~~
{% col col-xs-12 col-sm-8 col-md-6 col-lg-4 | snowy-mountains.jpg %}
...
~~~

The above example would render like this:

~~~
<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4" style="background-image: url(/assets/images/snowy-mountains.jpg)">
...
~~~


### Example

Here's a full-blown example with background images for the outermost `<div>`, as well as the innermost column `<div>`'s:

~~~
{% row parkas || pattern.jpg %}
{% col col-xs-12 col-md-6 | snowy-mountains.jpg %}

## Parkas
Here are some warm parkas to get you through the winter.

{% endcol %}
{% col col-xs-12 col-md-6 | snowy-mountains-2.jpg %}

## More parkas
Here are some more warm parkas to get you through the winter.

{% endcol %}
{% endrow %}
~~~

which gets rendered like this:

~~~
<div id="parkas" style="background-image: url(/assets/images/background-image.jpg)">
  <div class="row">
    <div class="col-xs-12 col-md-6" style="background-image: url(/assets/images/snowy-mountains.jpg)">
      <h2>Parkas</h2>
      <p>Here are some warm parkas to get you through the winter.</p>
    </div>
    <div class="col-xs-12 col-md-6" style="background-image: url(/assets/images/snowy-mountains-2.jpg)">
      <h2>More Parkas</h2>
      <p>Here are some more warm parkas to get you through the winter.</p>
    </div>
  </div>
</div>
~~~

With some Bootstrap-py CSS, you'd see a section with two columns that show up side by side on larger screens, and stacked vertically on smaller devices.


## Customization

These plugins should be customized to accommodate the CSS grid system you're using; the current structure suits the one I've built for my own use. If you like to keep your image assets somewhere other than `/assets/images/`, make sure to edit the path. You might also want to use `<section>` and `<article>` elements instead of `<div>` for a bit more semantically structured html (like I do).

Remember to restart your Jekyll server any time you make changes to plugins to see your changes.

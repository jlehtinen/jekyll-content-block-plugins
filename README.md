# jekyll-content-block-plugins
Content block plugins for [Jekyll](http://jekyllrb.com/) that allow you to wrap your markdown inside html sections. Especially useful with CSS grid frameworks, such as [Bootstrap](https://getbootstrap.com) or [Flexbox Grid](http://flexboxgrid.com).

## Installation

Download and unzip, then place row.rb and col.rb inside `_plugins` directory of your Jekyll site. Stop and restart your server to start the plugins.

## Usage

The plugins allow you to specify rows and columns, which are basically `<div>` elements that wrap around your markdown. This is especially useful for incorporating Bootstrap style rows and columns into long-form webpages without resorting to multiple markdown (.md) files.

One website I built that inspired me to build these plugins allowed me to use one markdown file for an entire page, where normally I would have had to use 12!

### Tags

Insert this into one of your Jekyll markdown files, for example index.md at the root of your site:

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

Full-blown example:

~~~
{% row parkas || pattern.jpg %}
{% col col-xs-12 col-sm-8 col-md-6 col-lg-4 | snowy-mountains.jpg %}

## Parkas
Here are some warm parkas to get you through the winter.

{% endcol %}
{% col col-xs-12 col-sm-8 col-md-6 col-lg-4 | snowy-mountains-2.jpg %}

## More parkas
Here are some more warm parkas to get you through the winter.

{% endcol %}
{% endrow %}
~~~

which gets rendered like this:

~~~
<div id="parkas" style="background-image: url(/assets/images/background-image.jpg)">
  <div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4" style="background-image: url(/assets/images/snowy-mountains.jpg)">
      <h2>Parkas</h2>
      <p>Here are some warm parkas to get you through the winter.</p>
    </div>
    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4" style="background-image: url(/assets/images/snowy-mountains-2.jpg)">
      <h2>More Parkas</h2>
      <p>Here are some more warm parkas to get you through the winter.</p>
    </div>
  </div>
</div>
~~~


## Customization

These plugins should be customized to accommodate the CSS grid system you're using; the current structure suits the one I'm using (a home grown CSS framework). If you like to keep your image assets somewhere other than `/assets/images/`, make sure to edit the path. You might also want to use `<section>` and `<article>` elements instead of `<div>` for a bit more semantically structured html.

Remember to restart your Jekyll server any time you make changes to plugins to see your changes.

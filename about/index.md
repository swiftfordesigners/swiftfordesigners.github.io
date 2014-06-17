---
layout: page
title: About Us
weight: 2
permalink: /about/
---
Welcome! We're Swift for Designers.

We're awesome! Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo.

Cras justo odio, dapibus ac facilisis in, egestas eget quam. Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit sit amet non magna.

Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed odio dui.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit tempus porttitor. Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

## Contributors
<ul class="grid contributors-list">
  {% for contributor in site.data.contributors %}
    {% assign person = contributor[1] %}
    <li class="grid__col grid__col--2-of-12"><a href="/contributors/{{ person.slug }}"><img class="contributor__avatar--full-width" src="{{ person.avatar }}" alt="{{ person.name }}"></a></li>
  {% endfor %}
</ul>

---
layout: page
title: Resources
weight: 5
permalink: /resources/
---
{% for resource in site.data.resources %}
  {% assign item = resource[1] %}
  <h4>
    <a href="{{ resource.link }}">{{ resource.title }}</a>
  </h4>
  <p>{{ resource.description }}</p>
  <div class="hr--long"></div>
{% endfor %}

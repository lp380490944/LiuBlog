{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

<<<<<<< HEAD
{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ config.title }}{% endblock %}

{% block content %}

  {######################}
  {### CATEGORY BLOCK ###}
  {######################}
  <div class="post-block category">

    <div id="posts" class="posts-collapse">
      <div class="collection-title">
        <{% if theme.seo %}h2{% else %}h1{% endif %}>{#
        #}{{ page.category }}{#
        #}<small>{{  __('title.category')  }}</small>
        </{% if theme.seo %}h2{% else %}h1{% endif %}>
      </div>

      {% for post in page.posts %}
        {{ post_template.render(post) }}
      {% endfor %}
    </div>

  </div>
  {##########################}
  {### END CATEGORY BLOCK ###}
  {##########################}
=======
{% block title %} {{ __('title.category') }}: {{ page.category }} | {{ config.title }} {% endblock %}

{% block content %}

  <section id="posts" class="posts-collapse">
    <div class="collection-title">
      <h2 >
        {{ page.category }}
        <small>{{  __('title.category')  }}</small>
      </h2>
    </div>

    {% for post in page.posts %}
      {{ post_template.render(post) }}
    {% endfor %}
  </section>
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}

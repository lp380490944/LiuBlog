<<<<<<< HEAD
{% if theme.algolia_search.enable %}
  {% include '../_third-party/search/algolia-search/dom.swig' %}
{% elseif theme.swiftype_key %}
  {% include 'search/swiftype.swig' %}
{% elseif theme.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% elseif theme.local_search.enable %}
=======
{% if theme.swiftype_key %}
  {% include 'search/swiftype.swig' %}
{% elseif theme.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% elseif config.search.path %}
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
  {% include 'search/localsearch.swig' %}
{% endif %}

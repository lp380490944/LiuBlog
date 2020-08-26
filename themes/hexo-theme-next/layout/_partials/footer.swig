<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
<<<<<<< HEAD
    <i class="fa fa-{{ theme.authoricon }}"></i>
=======
    <i class="fa fa-heart"></i>
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<<<<<<< HEAD
{% if theme.copyright %}
<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="https://hexo.io">Hexo</a>') }}
=======
<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT.{{ theme.scheme }}
  </a>
</div>
<<<<<<< HEAD
{% endif %}
=======
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec

<script src="{{ javascripts_path }}/application.min.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/latest/picturefill.min.js"></script>
{% editorjsblock %}
<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
<script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      siteData.set("flags_state", flagsState);

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');
    });
  </script>
{% endeditorjsblock %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      sideclick: true,
      mobileModeWidth: 752,
      updateOnKeypress: false,
      resultsContainer: $('.voog-search-modal').get(0)
    });
  </script>

{% endif %}
{{ site.analytics }}

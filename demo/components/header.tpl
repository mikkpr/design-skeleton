{% if site.data.flags_state == nil %}
  {% assign flags_state = true %}
{% else %}
  {% assign flags_state = site.data.flags_state %}
{% endif %}

<header class="container header">
  <h1 class="header-title">
    {% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}
      {% editable site.header %}{% unless editmode %}
    </a>{% endunless %}
  </h1>
  {% if editmode or site.has_many_languages? %}
    <nav class="lang-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <a id="lang-menu-toggle" class="toggle-btn lang-menu-toggle lang-flag lang-flag-{{ page.language_code }} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
        {% if editmode or flags_state == false %}
          <span class="lang-title">
            {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
            <span class="ico-popover-toggle">▼</span>
          </span>
        {% endif %}
      </a>
      <div id="toggleable-lang-menu" class="lang-menu-popover">
        {% include "menu-lang" %}
      </div>
    </nav>
  {% endif %}
</header>

<div class="container main-menu-wrapper">
  <nav class="menu-main">
    {% include "menu-level-1" %}
    {% include "menu-level-2" %}
  </nav>
</div>

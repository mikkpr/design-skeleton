{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <nav class="menu-sub">
      <ul class="menu">
        {% if editmode or item.children? %}
          {% for subitem in item.visible_children %}
            <li class="menu-item"><a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless item.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a></li>
          {% endfor %}
        {% endif %}
        {% if item.hidden_children.size > 0 %}<li class="edit-btn">{% menubtn item.hidden_children %}</li>{% endif %}
        {% if editmode %}<li class="edit-btn">{% menuadd parent="item" %}</li>{% endif %}
      </ul>
    </nav>
  {% endif %}
{% endfor %}

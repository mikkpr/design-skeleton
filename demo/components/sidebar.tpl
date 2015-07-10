{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <nav class="menu-sub" id="sidebar">
      <ul class="menu">
        {% if editmode or item.children? %}
          {% for subitem in item.visible_children %}
            <li class="menu-item"><a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a></li>
            {% if subitem.selected? and subitem.children? or editmode %}
              <ul class="submenu">
                {% if editmode or subitem.children? %}
                  {% for level3 in subitem.visible_children %}
                    <li class="menu-item"><a class="menu-link{% if level3.selected? %} active{% endif %}{% unless level3.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ level3.url }}">{{ level3.title }}</a></li>
                  {% endfor %}
                {% endif %}
                {% if subitem.hidden_children.size > 0 %}<li class="edit-btn">{% menubtn subitem.hidden_children %}</li>{% endif %}
                {% if editmode %}<li class="edit-btn">{% menuadd parent="subitem" %}</li>{% endif %}
              </ul>
            {% endif %}
          {% endfor %}
        {% endif %}
        {% if item.hidden_children.size > 0 %}<li class="edit-btn">{% menubtn item.hidden_children %}</li>{% endif %}
        {% if editmode %}<li class="edit-btn">{% menuadd parent="item" %}</li>{% endif %}
      </ul>
    </nav>
  {% endif %}
{% endfor %}

{% if article.tags.size > 0 or editmode %}
<div class="tags">
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    <div class="tags-list">
      {% for tag in article.tags %}
        <a class="tag-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}{% endunless %}
      {% endfor %}
    </div>
  {% endif %}
</div>
{% endif %}

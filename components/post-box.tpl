<article class="post">
  <header class="post-header">
    <h1 class="post-title">
      {% if post-box == "article" %}
        {% editable article.title %}
      {% else %}
        <a href="{{ article.url }}">{{ article.title }}</a>
      {% endif %}
      {% if article.comments_count > 0 %}
      <span class="post-comments">
        (<a href="{{article.url}}#comments" class="comments-count">{{article.comments_count}}</a>)
      </span>
      {% endif %}
    </h1>
    <section class="post-meta">
      <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
    </section>
  </header>

  <section class="post-content">
    <div class="post-excerpt content-formatted">
      {% if post-box == "article" %}
        {% editable article.excerpt %}
      {% else %}
        {{ article.excerpt }}
      {% endif %}
      {% unless post-box == "article" %}<a href="{{ article.url }}" class="read-more">{{ "read_more" | lc }}</a>{% endunless %}
    </div>
    {% if post-box == "article" %}
      <div class="post-body content-formatted">{% editable article.body %}</div>
    {% endif %}
    {% if post-box == "article" %}{% unless article.new_record? %}{% content name="gallery" bind="Article" %}{% endunless %}{% endif %}
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </section>
</article>

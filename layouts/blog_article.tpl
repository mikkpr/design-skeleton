<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {{ site.stats_header }}
</head>

<body class="post-page">
  {% include "header" %}
  <div class="container post-header-wrapper">
    <header class="post-header content-formatted">
      <h1 class="post-title">
        {% editable article.title %}
      </h1>
      <section class="post-meta">
        <span class="post-author">{{ article.author.name }}</span><span class="separator"> &nbsp;•&nbsp;</span>
        <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
      </section>
    </header>
  </div>
  <main class="container content content-formatted" role="main">
    <article class="post full">

      <section class="post-content content-centered">
        <div class="post-excerpt content-formatted">
          {% editable article.excerpt %}
        </div>

        <div class="post-body content-formatted">
          {% editable article.body %}
        </div>

        {% unless article.new_record? %}{% content name="gallery" bind="Article" %}{% endunless %}
        {% include "tags-post" %}
      </section>
    </article>

    <section id="comments" class="comments content-formatted content-centered">
      {% include "comments" %}
      {% unless article.new_record? %}
        {% include "comment-form" %}
      {% endunless %}
    </section>

  </main>
  {% include "footer" %}
  {% include "javascripts" %}
</body>
</html>

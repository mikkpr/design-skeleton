<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>

<body class="blog-page">

  {% include "header" %}

  <main class="container content content-formatted" role="main">
    <section class="content-centered">
      {% include "tags-blog" %}
      {% if editmode %}<div>{% addbutton %}</div>{% endif %}

      {% for article in articles %}
        {% include "post-box" %}
      {% endfor %}
    </section>
  </main>
  {% include "footer" %}
  {% include "javascripts" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = '{{ site.url }}{{ page.path }}';
      if (currentUrl === blogUrl) {
        $('.js-tags-all').addClass('active');
      };
    });
  </script>
</body>
</html>

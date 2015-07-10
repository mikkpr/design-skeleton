<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>

<body class="front-page">

  {% include "header" %}

  <main class="container content-formatted" role="main">
    <div class="row">
      <section class="twelve rows content-header slogan">{% content name="slogan" %}</section>
    </div>

    <div class="row">

      <article class="eight columns">
        <section class="content-body">
          {% content %}
        </section>
      </article>

      <aside class="four columns">
        {% include "news" %}
      </aside>
    </div>

  </main>
  {% include "footer" %}
  {% include "voog-ref" %}
  {% include "javascripts" %}
</body>
</html>

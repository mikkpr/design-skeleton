<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>

<body class="common-page">

  {% include "header" %}

  <main class="container content-formatted" role="main">

    <article class="content-right">
      <h2 class="content-header">{% content name="slogan" %}</h2>
      <section class="content-body">{% content %}</section>
    </article>

  </main>

  {% include "footer" %}
  {% include "javascripts" %}
</body>
</html>

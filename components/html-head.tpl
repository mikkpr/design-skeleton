<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% stylesheet_link "normalize.min.css" %}
{% stylesheet_link "skeleton.min.css" %}
{% stylesheet_link "main.min.css" %}

{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
{% if site.search.enabled %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.css">{% endif %}

<link href="http://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">

{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% if article %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
{% else %}
  {% if page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">
  {% endunless %}
{% endif %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}

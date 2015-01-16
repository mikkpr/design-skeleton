<section class="news">
  <h3 class="news-header">{{ "latest_news"|lc }}</h3>
  <ul>
    {% if site.latest_1_articles.size > 0 %}
      {% for article in site.latest_3_articles %}
        <li class="news-item">
          <a class="link" href="{{article.url}}">{{article.title}}</a><br>
          <span class="date">{{article.created_at | format_date:"long"}}</span>{% if article.author.firstname %}<span class="author">,&nbsp;{{article.author.firstname}}</span>{% endif %}
        </li>
      {% endfor %}
    {% else %}
      <li class="news-item">No blog posts yet.</li>
    {% endif %}
  </ul>
  {% if site.latest_4_articles.size > 3 %}
    <a href="/blog" class="link more-news">More news</a>
  {% endif %}
</section>

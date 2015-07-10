{% if article.new_record? %}
<h2 class="comment-title" style="padding-top:0;"></h2>
{% else %}
  {% if article.comments_count > 0 %}
  <h2 class="comment-title">{{ "comments" | lc }}</h2>

  <ul class="comment-messages content-formatted">
    {% for comment in article.comments %}
      <li class="comment edy-site-blog-comment">
        <div class="comment-inner">
          <header class="comment-header">
            {% if comment.author_email %}
              <a href="mailto:{{ comment.author_email }}" class="comment-author">{{ comment.author }}</a>
            {% else %}
              <span class="comment-author">{{ comment.author }}</span>
            {% endif %}
            &nbsp;•&nbsp;
            <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
            {% if editmode %}<span class="comment-delete">{% removebutton %}</span>{% endif %}
          </header>
          <section>
            <span class="comment-body">{{ comment.body_html }}</span>
          </section>
        </div>
      </li>
    {% endfor %}
  </ul>
  {% endif %}
{% endif %}

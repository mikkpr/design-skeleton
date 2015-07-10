<div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
  <h2 class="comment-title">{{"add_a_comment"|lc}}</h2>
  {% commentform %}
    {% assign comment_name_error = false %}
    {% assign comment_email_error = false %}
    {% assign comment_body_error = false %}
    {% unless comment.valid? %}
        {% for error in comment.errors %}
            {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
            {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
            {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
        {%endfor %}
    {% endunless %}

    <div class="form_area">
      <div class="row form_fields">
        <div class="six columns row form_field{% if comment_name_error %} form_field_with_errors{% endif %}">
          {% if comment_name_error %}
            <label class="form_field_error" for="comment-form-name">{{ "comment_author_blank" | lc }}</label>
          {% else %}
            <label for="comment-form-name">{{ "name" | lc }}</label>
          {% endif %}
          <input id="comment-form-name" class="form_field_textfield form_field_size_small" name="comment[author]" value="{{ comment.author }}">
        </div>

        <div class="six columns form_field{% if comment_email_error %} form_field_with_errors{% endif %}">
          {% if comment_email_error %}
            <label class="form_field_error" for="comment-form-name">{{ "comment_email_blank" | lc }}</label>
          {% else %}
            <label for="comment-form-name">{{ "email" | lc }}</label>
          {% endif %}
          <input id="comment-form-email" class="form_field_textfield form_field_size_small" name="comment[author_email]" value="{{ comment.author_email }}">
        </div>
      
        <div class="twelve columns form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
          {% if comment_body_error %}
            <label class="form_field_error" for="comment-form-name">{{ "comment_body_blank" | lc }}</label>
          {% else %}
            <label for="comment-form-name">{{ "comment" | lc }}</label>
          {% endif %}
          <textarea id="comment-form-body" class="form_field_textarea form_field_size_medium" name="comment[body]" rows="4">{{ comment.body }}</textarea>
        </div>
      </div>

      <div class="row form_submit">
        <input class="offset-by-four four columns column button button-primary" type="submit" value="{{ "submit" | lc }}">
      </div>
    </div>
  {% endcommentform %}
</div>

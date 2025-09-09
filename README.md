# Rails Blog: Complex Nested Forms

We're going to build off the previous iteration of our Blog App, where we created new models for `User` and `Tag` (and applicable associations) and wrote validations. We want to clean up our tagging feature. Our ability to add tags to a new post is super useful, but what if, when we're making a new post, we want to add a new tag that isn't in the list? Let's build that out.

***NOTE***: As with much of our Rails curriculum, always use the `--no-test-framework` flag when generating models, controllers, etc. This prevents Rails generators from creating additional tests on top of the provided test suite. For example, use `bin/rails generate model User username:string email:string --no-test-framework`. This lab already includes starter files, so you do not need to generate tests.

## Tags

1. We need to change the permitted params in our `PostsController` to accept another attribute, `:tags_attributes`, which contains the tag attributes that we need to create a new tag.
2. We also need an `accepts_nested_attributes_for` macro on our `Post` model, which will permit tags to be nested in our new `Post` form.
3. Now we can build a nested form in our `Post` form. Check out the documentation on [Nested Forms](http://guides.rubyonrails.org/form_helpers.html#nested-forms) for help.
4. We should be able to select previously created tags as well as create a new tag.
5. Remember, because we have a uniqueness validation on the name of tag, we will need to account for that.
6. A user shouldn't have to submit a new tag every time they submit a post.

    ```ruby
    class User < ApplicationRecord
      has_many :posts
      accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['title'].blank? }
    end
    ```

7. To allow a user to create a new tag, the controller action for a new post should instantiate a new tag. Check out the documentation for the [`fields_for` tag](http://apidock.com/rails/ActionView/Helpers/FormBuilder/fields_for).

## Resources

* [Strong Params](http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters)
* [Nested Forms](http://guides.rubyonrails.org/form_helpers.html#nested-forms)
* [`fields_for` tag](http://apidock.com/rails/ActionView/Helpers/FormBuilder/fields_for)
* [Preventing Empty Records](http://guides.rubyonrails.org/form_helpers.html#preventing-empty-records)

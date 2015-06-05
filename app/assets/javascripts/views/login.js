NewsReader.Views.LoginView = Backbone.View.extend({
  template: JST['login'],
  tagName: "form",

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template( { loggedIn: NewsReader.loggedIn } ));

    return this;
  }
});

import consumer from "./consumer"

consumer.subscriptions.create("PostChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.content}</p>`;
    const posts = document.getElementById('posts');
    const newPost = document.getElementById('content');
    posts.insertAdjacentHTML('afterbegin', html);
    newPost.value='';
  }
});
function check() {
  const posts = document.querySelectorAll(".post");
  posts.forEach(function (post) {
    post.addEventListener("click", () => {
      const postId = post.getAttribute("data-id");
    });
  });
}
window.addEventListener("load", check);
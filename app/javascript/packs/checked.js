function check() {
  const posts = document.querySelectorAll(".post");
  posts.forEach(function (post) {
    post.addEventListener("click", () => {
      console.log("click OK")

      const postId = post.getAttribute("data-id");
    });
  });
}
window.addEventListener("load", check);
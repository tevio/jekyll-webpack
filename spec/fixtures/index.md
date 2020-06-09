---
layout: home
---

<div id='home'>
  <h1>Home</h1>
  <a href='/transition'>Transition</a>

  <div class='absolute top-1/4 left-1/4 md:top-1/2 w-1/2' data-controller="hello">
    <input class='text-black' data-target="hello.name" type="text">
    <button data-action="click->hello#greet">Greet</button>
  </div>
</div>

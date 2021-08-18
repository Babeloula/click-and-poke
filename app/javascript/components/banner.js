import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Be the very best?","Hunt rare Pokemons around the world?", "Meet an amazing community?", "Catch Dragonite in a few weeks 🐲"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

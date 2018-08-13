import { recipesearch } from '../components/recipesearch'

function popupsearch() {
  if (document.getElementById('search-recipe')) {
    console.log('hello world')
  const search = document.getElementById('search-recipe');
  search.addEventListener('click', (event) => {
    swal({
      text: 'Search for a keyword. e.g. "vegan, sweetpotato, or brownrice".',
      content: "input",
      button: {
        text: "Search!",
        closeModal: false },
    })
    .then(input => {
      if (!input) throw null;
      return fetch(`https://api.edamam.com/search?q=${input}&app_id=abc032fa&app_key=881b874b66f6bf094bbdb556bec67f0e`);
    })
    .then(response => response.json())
    .then((data) => {
      const result = data.hits[0];
        if (!result) {
          return swal("No recipe was found");
        }
        const name = result.recipe.label;
        const imageURL = result.recipe.image;
        swal({
          title: "Top result:",
          text: name,
          icon: imageURL,
        });
      }
    )
  .catch(err => {
    if (err) {
      swal(console.log(err));
    } else {
      swal.stopLoading();
      swal.close();
    };
  });
})
  }

};

export { popupsearch };


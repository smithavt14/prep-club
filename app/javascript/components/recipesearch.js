function recipesearch() {
  if (document.getElementById('prep_meal')) {
    const input = document.getElementById('prep_meal');
    input.addEventListener('keyup', (event) => {
      if (event.key === "Enter") {
        const query = event.target.value
        fetch(`https://api.edamam.com/search?q=${query}&app_id=abc032fa&app_key=881b874b66f6bf094bbdb556bec67f0e`)
        .then(response => response.json())
        .then((data) => {
          const results = data.hits.slice(0, 3);
          results.forEach((result) => {
            console.log(result.recipe.label)
          // console.log(result.recipe.label);
          // console.log(result.recipe.healthLabels.slice(0, 3));
          // console.log(result.recipe.ingredients);
          // console.log(result.recipe);
          // console.log(result.recipe.image);
          })
        })
      }
    })
  }
}

export { recipesearch };

import { recipesearch } from '../components/recipesearch'

function sweetAlertSearch() {
  swal({
      text: 'Search for a keyword. e.g. "vegan, sweet potato, or brown rice".',
      content: "input",
      button: {
        text: "Search!",
        closeModal: false
      },
    })
  .then(input => {
    if (!input) throw null;
    return fetch(`https://api.edamam.com/search?q=${input}&app_id=abc032fa&app_key=881b874b66f6bf094bbdb556bec67f0e`);
  })
  .then(response => response.json())
  .then((data) => {
    const result = data.hits[Math.floor(Math.random() * data.hits.length)];
    if (!result) {
      return swal("No recipe was found");
    }
    const name = result.recipe.label;
    const imageURL = result.recipe.image;
    const url = result.recipe.url;
    const tags = result.recipe.healthLabels.join(", ")
    swal({
      title: "Top result:",
      text: `Name: ${name}`,
      icon: imageURL,
      buttons: {
        redo: {
          text: "Try again",
          value: "Again",
          closeModal: false,
        },
        confirm: {
          text: "Add it!",
          value: "confirm"
        }
      }
    })
    .then((value) => {
        switch (value) {
        case "confirm":
          const recipeName = document.getElementById('prep_recipe_name')
          const recipeURL = document.getElementById('prep_recipe_url')
          const recipeTags = document.getElementById('prep_tag_list')
          recipeName.value = name
          recipeURL.value = url
          recipeTags.value = tags
          swal({
            icon: "success",
            text: "Added!"
          });
          break;
        case "Again":
          swal(sweetAlertSearch());
          break;
        }
    })
  })
};

function popupsearch() {
  if (document.getElementById('search-recipe')) {
    console.log('hello world')
    const search = document.getElementById('search-recipe');
    search.addEventListener('click', (event) => {
      sweetAlertSearch()
    })
  }
};


export { popupsearch };






// SWAL CODE
//     swal({
//       text: 'Search for a keyword. e.g. "vegan, sweetpotato, or brownrice".',
//       content: "input",
//       button: {
//         text: "Search!",
//         closeModal: false },
//     })
//     .then(input => {
//       if (!input) throw null;
//       return fetch(`https://api.edamam.com/search?q=${input}&app_id=abc032fa&app_key=881b874b66f6bf094bbdb556bec67f0e`);
//     })
//     .then(response => response.json())
//     .then((data) => {
//       const result = data.hits[0];
//         if (!result) {
//           return swal("No recipe was found");
//         }
//         const name = result.recipe.label;
//         const imageURL = result.recipe.image;
//         swal({
//           title: "Top result:",
//           text: name,
//           icon: imageURL,
//           buttons: {
//             redo: {
//               text: "Try again",
//               value: "Again",
//               closeModal: false,
//             },
//             confirm: {
//               text: "Add it!",
//               value: "confirm"
//             }
//           }
//         }).then((value) => {
//             switch (value) {

//             case "confirm":
//               swal({
//                 icon: "success",
//                 text: "Added!"
//               });
//               break;

//             case "again":
//               swal();
//               break;
//           }
// });




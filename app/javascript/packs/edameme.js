console.log("Hello")

const search=`?q=${search_query}&app_id=${ENV['EDAMEME_APP_ID']}&app_key=${ENV['EDAMEME_PUBLIC_KEY']}`

const path=`https://api.edamam.com/${search}`



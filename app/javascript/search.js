document.addEventListener('DOMContentLoaded', () => {
  let searchInput = document.querySelector('#search_bar');
  const searchSubmit = document.querySelector('#search_form');
  const matchesList = document.querySelector('.matches');

  function updateMatches(matches) {
    for (const match of matches) {
      const item = document.createElement('li');
      item.innerText = match.query;
      matchesList.appendChild(item);
    }
  }

  function searchQuery(query) {
    console.log('searchQuery function fired')
    fetch(`${process.env.ANALYTICS_URL}?query=${query}`, {
      method: 'GET',
    })
    .then((res) => res.json())
    .then(data => {
        updateMatches(data);
    })
    .catch((err) => {
        console.error(err);
    });
  }

  function saveQuery(query) {
    console.log('saveQuery function fired')
    fetch(process.env.SAVE_QUERY_URL, {
      method: 'POST',
      body: JSON.stringify({ query }),
      headers: {
        'Content-Type': 'application/json',
      },
    })
      .then(() => {
        searchQuery(query);
      })
      .catch((err) => {
        console.error(err);
      });
  }

  searchInput.addEventListener('input', (e) => {
    const query = e.target.value;
    if (query !== '') searchQuery(query);
  });

  searchSubmit.addEventListener('submit', (e) => {
    e.preventDefault();
    const query = searchInput.value;
    if (query === '') {
        alert('field cannot be empty')
    } else {;
        saveQuery(query);
    }});
});

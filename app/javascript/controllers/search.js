document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('search_bar');
  const searchSubmit = document.getElementById('search_form');
  const matchesList = document.getElementById('matches');
  let timeout;

  function updateMatches(matches) {
    for (const match of matches) {
      const item = document.createElement('li');
      item.innerText = match.query;
      matchesList.appendChild(item);
    }
  }

  function searchQuery(query) {
    fetch(process.env.ANALYTICS_URL, {
      method: 'GET',
      data: { query },
    })
      .then((res) => {
        updateMatches(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }

  function saveQuery(query) {
    fetch(process.env.SAVE_QUERY_URL, {
      method: 'POST',
      body: JSON.stringify({ query }),
      headers: {
        'Content-Type': 'application/json',
      },
    })
      .then((res) => {
        console.log(res);
      })
      .catch((err) => {
        console.log(err);
      });
  }

  searchInput.addEventListener('input', () => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      searchQuery(searchInput.value);
    }, 1000);
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

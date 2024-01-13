document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('search_bar');
    const searchSubmit = document.getElementById('search_form');
    let timeout = null;

    searchInput.addEventListener('input', () => {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            searchQuery(searchInput.value);
        }, 1000);
    });

    searchSubmit.addEventListener('submit', (e) => {
        e.preventDefault();
        saveQuery(searchInput.value);
    });

    function searchQuery(query) {
       $.ajax({
        url: process.env.ANALYTICS_URL,
        method: 'GET',
        dataType: 'json',
        data: {query: query},
        success: (data) => {
            console.log(data);
        },
        error: (err) => {
            console.log(err);
        }
       })
    }

    function saveQuery(query) {
        $.ajax({
            url: process.env.SAVE_QUERY_URL,
            method: 'POST',
            dataType: 'json',
            data: {query: query},
            success: (res) => {
                console.log(res);
            },
            error: (err) => {
                console.log(err);
            }
        })
    }
});

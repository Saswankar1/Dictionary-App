document.addEventListener('DOMContentLoaded', () => {
    const searchButton = document.getElementById('search-button');
    const wordInput = document.getElementById('word-input');
    const definitionElement = document.getElementById('definition');

    // Clear the definition when input changes
    wordInput.addEventListener('input', () => {
        definitionElement.innerText = '';  // Clear the definition text
        definitionElement.classList.remove('show');  // Remove the animation class
    });

    // Search for the definition when the search button is clicked
    searchButton.addEventListener('click', () => {
        const word = wordInput.value.trim();
        definitionElement.classList.remove('show');  // Remove the animation class

        if (word) {
            fetch(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`)
                .then(response => response.json())
                .then(data => {
                    console.log('[data]', data);
                    if (data[0] && data[0].meanings && data[0].meanings[0].definitions && data[0].meanings[0].definitions[0]) {
                        const definition = data[0].meanings[0].definitions[0].definition;
                        definitionElement.innerText = definition;

                        // Add 'show' class to trigger animation
                        definitionElement.classList.add('show');
                    } else {
                        definitionElement.innerText = 'No definition found for the entered word.';
                        definitionElement.classList.add('show');  // Show message with animation
                    }
                })
                .catch((error) => {
                    definitionElement.innerText = 'Error: Word not found or unable to fetch the definition.';
                    console.error('Error fetching the definition:', error);

                    // Add 'show' class to trigger animation
                    definitionElement.classList.add('show');
                });
        } else {
            definitionElement.innerText = 'Please enter a word.';
            definitionElement.classList.add('show');  // Show message with animation
        }
    });
});

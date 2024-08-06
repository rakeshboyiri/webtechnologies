document.addEventListener('DOMContentLoaded', (event) => {
    const checkbox = document.getElementById('myCheckbox');
    const statusText = document.getElementById('status');

    // Function to update the checkbox value and status text
    const updateCheckboxValue = () => {
        if (checkbox.checked) {
            checkbox.value = 'checked';
            statusText.textContent = 'Checkbox is checked';
        } else {
            checkbox.value = 'unchecked';
            statusText.textContent = 'Checkbox is unchecked';
        }
    };

    // Add an event listener to handle change events
    checkbox.addEventListener('change', updateCheckboxValue);
});


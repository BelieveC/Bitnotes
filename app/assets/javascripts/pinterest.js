var pinOneButton = document.querySelector('.pinterest');
    pinOneButton.addEventListener('click', function() {
        PinUtils.pinOne({
            media: e.target.getAttribute('data-media'),
            description: e.target.getAttribute('data-description')
        });
    });
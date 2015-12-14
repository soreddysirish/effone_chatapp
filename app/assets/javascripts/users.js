  $('.checkboxforblocunblockuser').bind('change', function() {
    if (this.checked) {
      $.ajax({
        url: '/users/' + this.value + '/toggle',
        type: 'POST',
        data: {
          'banned': this.checked
        }
      });
    }
  });

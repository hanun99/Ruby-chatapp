$(function() {
    $('#new_room_message').on('ajax:success', function(a, b,c ) {
      $(this).find('input[type="text"]').val('');
    });
  });

  fetch('/my-api-endpoint', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    },
    body: JSON.stringify({ data: 'my data' })
  })
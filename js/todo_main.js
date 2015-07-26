$(function() {
  addTask();

  function addTask() {
    $('li').click(function (event) {
      $(this).remove();
    });
  };

  $('form').submit(function (event) {
    event.preventDefault();
      var task = $(':text').val();
      $(':text').val('');
      if (!task.trim()) return;
      $('#todo_content').append('<li>' + task + '</li>');

    addTask();
  });
});

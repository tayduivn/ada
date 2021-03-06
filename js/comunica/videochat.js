function receiveMessage(event)
{
  // Do we trust the sender of this message?  (might be
  // different from what we originally opened, for example).
  if (event.origin !== HTTP_ROOT_DIR) {
      return;
  } else {
      if (event.data == 'endVideochat') {
          if (location.href.indexOf('view.php') != -1) {
              $j('iframe.ada-videochat-embed').remove();
          } else if (location.href.indexOf('videochat.php') != -1) {
            closeMeAndReloadParent();
        }
      }
  }
}

function endVideoChat(event)
{
  $j('.ada-videochat-embed').each(function() {
    const fakePlaceholder = $j(this).attr('class').replace('.','').replace('ada-videochat-embed','').trim();
    const url = getDirFromPlaceholder(fakePlaceholder) + 'endvideochat.php';
    if (!navigator.sendBeacon) return;
    const data = decodeURIComponent($j(this).data('logout')).substr(1);
    navigator.sendBeacon(url, data);
  });
}


if (window.attachEvent) {
  window.attachEvent('message', receiveMessage, false);
  window.attachEvent('onload', () => { setInterval( doPing, 600000 ); }); // 10 minutes
  window.attachEvent('beforeunload', endVideoChat, false);
} else if (window.addEventListener) {
  window.addEventListener('message', receiveMessage, false);
	window.addEventListener('load', () => { setInterval( doPing, 600000 ); }); // 10 minutes
  window.addEventListener('beforeunload', endVideoChat, false);
} else {
  document.addEventListener('message', receiveMessage, false);
  document.addEventListener('load', () => { setInterval( doPing, 600000 ); }); // 10 minutes
  document.addEventListener('beforeunload', endVideoChat, false);
}

function getDirFromPlaceholder(placeholder) {
  if (placeholder.length >0) {
    return '../modules/' + placeholder.replace('#','').replace('-placeholder','') + '-integration/';
  }
  return null;
}

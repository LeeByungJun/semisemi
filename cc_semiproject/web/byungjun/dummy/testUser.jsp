<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hello Analytics Reporting API V4</title>
  <meta name="google-signin-client_id" content="<REPLACE_WITH_CLIENT_ID>">
  <meta name="google-signin-scope" content="https://www.googleapis.com/auth/analytics.readonly">
<!-- <script id="_wauso5">
	var _wau = _wau || []; _wau.push(["dynamic", "dbf1p5tvjt", "so5", "c4302bffffff", "small"]);
</script>
<script async src="//waust.at/d.js"></script> -->
</head>
<body>
	<h1>Hello Analytics Reporting API V4</h1>

	<!-- The Sign-in button. This will run `queryReports()` on success. -->
	<p class="g-signin2" data-onsuccess="queryReports"></p>
	
	<!-- The API response will be printed here. -->
	<textarea cols="80" rows="20" id="query-output"></textarea>

<script>
  // Replace with your view ID.
  var VIEW_ID = '<REPLACE_WITH_VIEW_ID>';

  // Query the API and print the results to the page.
  function queryReports() {
    gapi.client.request({
      path: '/v4/reports:batchGet',
      root: 'https://analyticsreporting.googleapis.com/',
      method: 'POST',
      body: {
        reportRequests: [
          {
            viewId: VIEW_ID,
            dateRanges: [
              {
                startDate: '7daysAgo',
                endDate: 'today'
              }
            ],
            metrics: [
              {
                expression: 'ga:sessions'
              }
            ]
          }
        ]
      }
    }).then(displayResults, console.error.bind(console));
  }

  function displayResults(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    document.getElementById('query-output').value = formattedJson;
  }
</script>

<!-- Load the JavaScript API client and Sign-in library. -->
<script src="https://apis.google.com/js/client:platform.js"></script>

</body>
</html>
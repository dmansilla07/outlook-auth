<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Outlook Autentication</title>

<c:url var="home" value="/" scope="request" />

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

<spring:url value="/resources/core/js/jquery.1.10.2.min.js"
	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Spring Outlook Authentication</a>
		</div>
	</div>
</nav>

<div class="container" style="min-height: 500px">

	<div class="starter-template">
		<h1>Search Form</h1>
		<br>

		<div id="feedback"></div>

		<form class="form-horizontal" id="search-form">
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Username</label>
				<div class="col-sm-10">
					<input type=text class="form-control" id="username">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="bth-search"
						class="btn btn-primary btn-lg">Simple Login</button>

					<button type="button" id="bth-outlook"
						class="btn btn-primary btn-lg">Outlook Logging</button>
					<button type="button" id="bth-send-email"
						class="btn btn-primary btn-lg">Enviar Email</button>
				</div>
			</div>
		</form>

	</div>

</div>


<script>
	jQuery(document).ready(function($) {
		var code = urlParameterExtraction.queryStringParameters['access_token'];
		$.ajax({
			type : "GET",
			url : "saveSession?idToken="+code,
			contentType : "application/json",
			success : function(data) {
				alert(window.location.host);
				window.location.href = "";
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		});
	});

	var urlParameterExtraction = new (function() {
		function splitQueryString(queryStringFormattedString) {
			var split = queryStringFormattedString.split('&');
			// If there are no parameters in URL, do nothing.
			if (split == "") {
				return {};
			}

			var results = {};
			// If there are parameters in URL, extract key/value pairs. 
			for (var i = 0; i < split.length; ++i) {
				var p = split[i].split('=', 2);
				if (p.length == 1)
					results[p[0]] = "";
				else
					results[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
			}
			return results;
		}
		// Split the query string (after removing preceding '#'). 
		var positionInterrogation = getPositionSign(window.location.href);
		this.queryStringParameters = splitQueryString(window.location.href
				.substr(positionInterrogation + 1));
	})();
	
	function getPositionSign(urlName) {
		for(i=0; i<urlName.length; ++i) {
			if (urlName[i] == '?' || urlName[i] == '#') return i;
		}
		return 0;
	}
	
</script>

</body>
</html>

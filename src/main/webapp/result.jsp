<!DOCTYPE html>
<html>
<head>
    <title>Results</title>
</head>
<body>
<form action="result.jsp">
    <h1>This is the result</h1>
    <div style="color:white">Parameter was <%= request.getParameter("testparam")%></div>
</form>
    <div style="color:white" id="results"></div>
    <button onclick="testAPI()">Test</button>
    <script>
        function testAPI() {
            if (typeof addonUtility != 'undefined') {
                document.getElementById("results").innerText = "addonUtility is present";
            } else {
                document.getElementById("results").innerText = "addonUtility is NOT present";
            }
        }
    </script>
</body>
</html>
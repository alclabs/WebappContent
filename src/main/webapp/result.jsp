<!DOCTYPE html>
<html>
<head>
    <title>Results</title>
</head>
<body>
<form action="result.jsp">
    <h1>This is the result</h1>
    <div>Parameter was <%= request.getParameter("testparam")%></div>
</form>
</body>
</html>
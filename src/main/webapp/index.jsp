<!DOCTYPE html>
<html>
<body>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/uri.js"></script>
<form id="myform" action="result.jsp">
    <input type="text" name="testparam" size="20"/>
    <input type="submit">
</form>
    <div style="color:white" id="results"></div>
    <button onclick="testAPI()">Test</button>
    <script>
        function testAPI() {
            if (typeof addonUtility != 'undefined') {
                document.getElementById("results").innerText = "addonUtility is present, loc="+window.location.href;
            } else {
                document.getElementById("results").innerText = "addonUtility is NOT present";
            }
        }

        $(document).ready(function() {
            var $form = $("#myform");

            var origAction = $form.attr("action");
            // don't know if action is relative or absolute, so calculate a relative one
            var baseuri = new URI($("base").prop("href"));
            var actionURI = new URI(origAction);
            var absuri = actionURI.absoluteTo(baseuri);
            var reluri = absuri.relativeTo(baseuri);

            // post form back to same location as before, but with different params
            var uri = new URI(window.location.href);
            $form.attr("action", uri.path());

            // pull out previous query params
            var params = URI.parseQuery(uri.query());

            // this one is a URI that needs to be modified
            var inneruri = new URI(params.url);
            // add the relative path (from the action attribute of the form), but with leading "/"
            inneruri.path("/"+reluri.path());

            // add top level parameters as hidden form fields
            $form.append($('<input type="hidden" name="addon" value="'+params.addon+'">'));
            $form.append($('<input type="hidden" name="wbs" value="'+params.wbs+'">'));
            $form.append($('<input type="hidden" name="url" value="'+inneruri.valueOf()+'">'));
        });
    </script>
</body>
</html>
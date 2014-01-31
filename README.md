WebappContent Demo
==================

This add-on demonstrates one possible way to submit data to an add-on using a form inside
of a WebCTRL WebApp Content Control.

All of the add-ons we are aware of that have been created to date which provide data inside
of a graphics page have been some form of single page app.  If they communicate with the
server, it was through AJAX requests.  Actually reloading the page (like posting a form)
currently causes some issues.

Brief Explanation
-----------------
The ViewBuilder WebAppContent control will render an IFRAME in the WebCTRL graphics page
and the add-on content will get rendered inside this IFRAME.  The URL used to load this
IFRAME is probably not what you would expect.  The IFRAME actually loads a built-in
WebCTRL page (`/_common/lvl5/includes/addons/addon_content.jsp`) with parameters indicating
the add-on that this control is targeting as well as the location inside the add-on that
contains the requested content.  The `addon_content.jsp` page will do a server side forward
to include the content from the requested page, but wrapped with some preset CSS styles and
helper JavaScript.

If you are going to reload the WebApp Content Control's IFRAME (for example doing a form post),
then you must actually target the `addon_content.jsp` page yourself with the correct parameters.
For a form post it is even more awkward because you will need to add these parameters as
hidden input fields.

The index.jsp file in this project has some example JavaScript to handle this.  It reads the
action property of the form element, changes it to addon_content, and inserts the necessary
hidden input fields to make the post work correctly.

Building the Project
--------------------
This project includes the files necessary to build the add-on using Gradle.  Run `gradlew build`
from the command line (this should work on Windows, OS X, or Linux).

Conclusions
-----------
It is awkward to do this now.  The WebApp Content Control was not designed with this use case
in mind.  We may consider developing a better mechanism to support this in the future.
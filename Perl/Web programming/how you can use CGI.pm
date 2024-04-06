
use strict;
use warnings;
use CGI;

# Create a new CGI object
my $cgi = CGI->new;

# Print the HTTP header with content type text/html
print $cgi->header('text/html');

# Print the HTML head section
print $cgi->start_html('Simple Form Example'),
      $cgi->h1('Simple Form Example'),
      $cgi->start_form,
      $cgi->p('Enter your name: ', $cgi->textfield('name')),
      $cgi->submit,
      $cgi->end_form;

# Process the form submission
if ($cgi->param()) {
    my $name = $cgi->param('name');
    print $cgi->p("Hello, $name! Thank you for submitting the form.");
}

# Print the HTML end section
print $cgi->end_html;

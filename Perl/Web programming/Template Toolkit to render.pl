
use strict;
use warnings;
use Template;

# Create a Template Toolkit object
my $tt = Template->new();

# Define the data to be used in the template
my $data = {
    title => 'Welcome to My Website',
    message => 'Hello, world!',
};

# Process the template and print the output
$tt->process('template.html', $data) || die $tt->error();

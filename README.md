# Renalware::Forms

This gem
- is a library of pre-defined generic PDF forms that Renalware can populate and present
to the user, for example when a user needs to print and sign a list of drugs to be delivered for
homecare.
- provides a API for creating these PDFs, and others (see renalware-forms-* gems) so that form
creation is abstracted from Renalware.

The PDFs are constructed using Prawn, chosen mainly for its speed.

The gem exposes an API for a caller to specify the type and version of the PDF they require, along
with data to populate it (patient name and address etc).

See other gems ie `renalware-forms-<provider>` for instances where we have built custom forms
based on this gem.

## Future enhancements

To be more extensible and remove the need for developer input when adding new forms, an alternative
implementation is possible where the request to create for example "Fresenius Homecare
Supply Version 1.1" will load a PDF file with the corrersponding name. If the PDF is created for
example in Acrobat or LibreOffice and specifically-named form fields are inserted, these can be
populated with the supplied the data the caller also provides. It could even allow the path to a
custom PDF form to be supplied by the caller. Using a shared library of PDF files stored inside this
gem will provide more re-usue opportunity across sites, though there could be nothing stopping a
hospital developing a custom form stored outside of this gem, and not sharing it.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'renalware-forms'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install renalware-forms
```
## Testing

You can generate example instances of all the PDFs in this gem from the command line.

You can see a list available tasks:

```bash
$ bundle exec rake -T
```

For example:

```bash
$ bundle exec rake forms:generic:homecare:v1
```

will create the version 1 PDF with test data and open it in Linux (will require a change
for it to open on a Mac).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

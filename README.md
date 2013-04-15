# NAME

WebService::Booklog - Access to unofficial API of booklog.jp

# VERSION

version v0.0.0

# SYNOPSIS

    my $obj = WebService::Booklog->new;
    my $dat = $obj->get_minishelf_data('yak1ex', status => 'read', rank => 5);
    print Data::Dumper->Dump([$dat]);

# DESCRIPTION

This module provides a way to access __UNOFFICIAL__ [booklog](http://booklog.jp) API.
They are not only __UNOFFICIAL__ but also __UNDOCUMENTED__.
Thus, it is expected to be quite __UNSTABLE__ and use with care.

# METHODS

## `new`

Constructor. There is no argument.

## `get_minishelf_data($account, %params)`

`$account` is a target account name.
Available keys for `%params` are as follows:

- `category`

    Category ID dependent on user configuration.

- `status`

    One of `'want_read'`, `'reading'`, `'read'` and `'stacked'`. I believe the meanings are intuitive.

- `rank`

    An integer from 1 to 5 inclusive.

- `count`

    The number of items. Defaults to 5.

Results are an object like the followings:

    {
      tana => {
        account => $account,
        image_url => $image_url,
        id => $id,
        name => $name,
      },
      category => {
        id => $id,
        name => $name,
      },
      books => [
        {
          title => $title,
          asin => $asin,
          author => $author,
          url => $url,
          image => $image,
          width => $width,
          height => $height,
          catalog => $catalog,
          id => $id,
        },
      ]
    }

From the API, `[]`, empty array ref, denotes empty data.
However, it is replaced as `{}`, empty hash ref, by this interface.

This interface is not documented but it is used by public minishlef widget.
Thus, it is expected to be a bit more stable than others.
However, it is unofficial, too.

# SEE ALSO

- [http://backyard.chocolateboard.net/201204/booklog-jquery](http://backyard.chocolateboard.net/201204/booklog-jquery) An article for minishelf API

# AUTHOR

Yasutaka ATARASHI <yakex@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yasutaka ATARASHI.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

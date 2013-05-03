# NAME

WebService::Booklog - Access to unofficial API of booklog.jp

# VERSION

version v0.0.1

# SYNOPSIS

    my $obj = WebService::Booklog->new;
    my $dat = $obj->get_minishelf('yak1ex', status => 'read', rank => 5);
    print Data::Dumper->Dump([$dat]);
    

    $dat = $obj->get_review(60694202);
    print $dat,"\n"; # Just a string
    

    $dat = $obj->get_shelf('yak1ex', status => 'read', rank => 5);
    print Data::Dumper->Dump([$dat]);

# DESCRIPTION

This module provides a way to access __UNOFFICIAL__ [booklog](http://booklog.jp) API.
They are not only __UNOFFICIAL__ but also __UNDOCUMENTED__.
Thus, it is expected to be quite __UNSTABLE__. Please use with care.

# METHODS

## `new`

Constructor. There is no argument.

## `get_minishelf($account, %params)`

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

Results are represented as an object like the followings:

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

From the raw API, `[]`, empty array ref, is used for empty data.
However, it is replaced as `{}`, empty hash ref, by this method.

This interface is NOT documented but it is used by a public minishelf widget.
Thus, it is expected to be a bit stabler than others.
However, it is unofficial, too.

## `get_review($book_id)`

Get the review content of the specified `$book_id`. `$book_id` can be get by other interfaces.
Just a scalar string is returned.

## `get_shelf($account, %arg)`

Get shelf data of the specified $<$account>. Parameters are as follows:

- `category`

    Category ID dependent on user configuration.

- `status`

    One of `'want_read'`, `'reading'`, `'read'` and `'stacked'`. I believe the meanings are intuitive.

- `rank`

    An integer from 1 to 5 inclusive.

- `sort`

    A string matching `(release|date|read|title|sort)_(desc|asc)`. `date` means register date.

- `tag`

    Tag string

- `keyword`

    Keyword string

- `page`

    Page number

- `parpage`

    Items par page.

- `genre`

    Any of `'other'`, `'book'`, `'ebook'` (e-book), `'comic'`, `'fbook'` (foreign book), `'magazine'`, `'movie'`, `'music'` and `'game'`.

Results are represented as an object like the followings:

    {"user":
        {"user_id":"<id>",
         "account":"<account>",
         "plan_id":"0",
         "nickname":"<nick>",
         "image_url":"<url>",
         "associateid":"",
         "last_login":"yyyy-mm-dd hh:mm:ss",
         "create_on":"yyyy-mm-dd hh:mm:ss"}
        },
     "login":
         {"user_id":"<id>",
          "account":"<account>",
          "shelf_id":"<shelf_id>",
          "plan_id":"0"
         },
     "genre_id":null,
     "category_id":"0",
     "status":"0",
     "rank":"0",
     "tag":null,
     "keyword":null,
     "sort":"sort_desc",
     "books":[
       {"book_id":"<id>",
        "service_id":"1", // amazon.co.jp
        "id":"<asin>",
        "rank":"0",
        "category_id":"0",
        "public":"1",
        "status":"0",
        "create_on":"yyyy-mm-dd hh:mm:ss",
        "read_at":"yyyy\u5e74mm\u6708dd\u65e5", // or null
        "title":"<title>",
        "title2":"<title2>",
        "image":"<url>",
        "height":<height>,
        "width":<width>,
        "item":
            {"service_id":1, // amazon.co.jp
             "id":"<asin>",
             "url":"<url>",
             "title":"<title>",
             "authors":["<author>"],
             "directors":[],
             "artists":[],
             "actors":[],
             "creators":["<illustrator>"],
             "small_image_url":"<url>",
             "small_image_width":"<width>",
             "small_image_height":"<height>",
             "medium_image_url":"<url>",
             "medium_image_width":"<width>",
             "medium_image_height":"<height>",
             "large_image_url":"<url>",
             "large_image_width":"<width>",
             "large_image_height":"<height>",
             "publisher":"<publisher>",
             "release_date":"yyyy-mm-dd",
             "genre_id":1,
             "price":"\uffe5 <price>",
             "savedPrice":"\uffe5 <price>",
             "EAN":"<EAN>",
             "languages":[],
             "pages":"<pages>",
             "ProductGroup":"<Group>",
             "Binding":"\u6587\u5eab",
             "platform":"",
             "AlternateVersions":[],
             "isAdult":"0",
             "create_on":1365502041
             },
         "tags":[],
         "quotes":[]
       },
     ],
     "reviews":false, // { "<id>":{"more":true,"public":"1","description":""}, ... }
     "comments":[],
     "pager":
         {"base_url":"<url>",
          "query":"",
          "total":"305",
          "start":1,
          "end":25,
          "parpage":"25",
          "page":1,
          "maxpage":13,
          "startpage":1,
          "lastpage":10,
          "prevpage":0,
          "nextpage":2}
       }
    }

Probably, structure of `$result->{books}[n]{item}` depends on serivice provider.
I did not and will not investigate them deeply. If you have some information, please let me know.

- 1

    Amazon.co.jp

- 2

    Amazon.com

- 3

    パブー

- 4

    iTunes Store

- 5

    unknown

- 6

    unknown

- 7

    青空文庫

- 8

    BookLive!

- 9

    GALAPAGOS

- 10

    達人出版会

- 11

    O'Reilly Japan

- 12

    unknown

- 13

    技術評論社

- 14

    unknown

- 15

    パブリ

- 16

    honto

- 17

    BOOK☆WALKER

- 18

    ニコニコ静画

# SEE ALSO

- [http://backyard.chocolateboard.net/201204/booklog-jquery](http://backyard.chocolateboard.net/201204/booklog-jquery) An article for minishelf API

# AUTHOR

Yasutaka ATARASHI <yakex@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yasutaka ATARASHI.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

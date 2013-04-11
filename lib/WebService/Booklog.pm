package WebService::Booklog;

use strict;
use warnings;

# VERSION

1;
__END__

ref: http://backyard.chocolateboard.net/201204/booklog-jquery

http://api.booklog.jp/json/account

  omitted for no limitation
  category: all => 0
  status: all => 0, want_read => 1, reading => 2, read => 3, stacked => 4
  rank: all => 0, 1-5
  count: number of items

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


http://booklog.jp/sort

booklist[]=numeric_id&booklist[]=numeric_id&...

    var url ='/sort_edit';
    var data = 'book_id=' + id + '&sort=' + sort;

    var url ='/api/review/fav';
    var params = 'book_id=' + book_id;
    var action = 'add';

    var fav_btn  = $('review_' + book_id + '_fav_btn');

    if (fav_btn.hasClassName('fav_delete')) {
        action = 'delete';
        params += '&_method=delete';
    }

    var url ='/api/follow/add';
    var data = 'account=' + account;

    var url = "/json/review/" + book_id;
{book_id:""}

                parpage     = 25,
                account     = $obj.data('account'),
                genre       = $obj.data('genre') || 'all',
                category_id = $obj.data('category-id'),
                status      = $obj.data('status'),
                sort        = $obj.data('sort'),
                rank        = $obj.data('rank'),
                tag         = $obj.data('tag'),
                keyword     = $obj.data('keyword'),
                url = '/users_api/' + account,
                params = {
                    'category_id': category_id,
                    'status': status,
                    'sort': sort,
                    'rank': rank,
                    'tag': tag,
                    'page': page,
                    'genre': genre,
                    'parpage': parpage
                },
                result, i, max, user, login, books, reviews;

/users_api/<account>
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
    "service_id":"1", // might be amazon?
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
        {"service_id":1, // amazon?
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
 "reviews":false,
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

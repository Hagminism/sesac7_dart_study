import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/http/model/post.dart';
import 'package:modu_3_dart_study/http/repository/post_repository_impl.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final json = [
    {
      "userId": 6,
      "id": 60,
      "title":
          "consequatur placeat omnis quisquam quia reprehenderit fugit veritatis facere",
      "body":
          "asperiores sunt ab assumenda cumque modi velit\nqui esse omnis\nvoluptate et fuga perferendis voluptas\nillo ratione amet aut et omnis",
    },
    {
      "userId": 7,
      "id": 61,
      "title": "voluptatem doloribus consectetur est ut ducimus",
      "body":
          "ab nemo optio odio\ndelectus tenetur corporis similique nobis repellendus rerum omnis facilis\nvero blanditiis debitis in nesciunt doloribus dicta dolores\nmagnam minus velit",
    },
    {
      "userId": 7,
      "id": 62,
      "title": "beatae enim quia vel",
      "body":
          "enim aspernatur illo distinctio quae praesentium\nbeatae alias amet delectus qui voluptate distinctio\nodit sint accusantium autem omnis\nquo molestiae omnis ea eveniet optio",
    },
    {
      "userId": 7,
      "id": 63,
      "title":
          "voluptas blanditiis repellendus animi ducimus error sapiente et suscipit",
      "body":
          "enim adipisci aspernatur nemo\nnumquam omnis facere dolorem dolor ex quis temporibus incidunt\nab delectus culpa quo reprehenderit blanditiis asperiores\naccusantium ut quam in voluptatibus voluptas ipsam dicta",
    },
    {
      "userId": 7,
      "id": 64,
      "title": "et fugit quas eum in in aperiam quod",
      "body":
          "id velit blanditiis\neum ea voluptatem\nmolestiae sint occaecati est eos perspiciatis\nincidunt a error provident eaque aut aut qui",
    },
    {
      "userId": 7,
      "id": 65,
      "title": "consequatur id enim sunt et et",
      "body":
          "voluptatibus ex esse\nsint explicabo est aliquid cumque adipisci fuga repellat labore\nmolestiae corrupti ex saepe at asperiores et perferendis\nnatus id esse incidunt pariatur",
    },
    {
      "userId": 7,
      "id": 66,
      "title": "repudiandae ea animi iusto",
      "body":
          "officia veritatis tenetur vero qui itaque\nsint non ratione\nsed et ut asperiores iusto eos molestiae nostrum\nveritatis quibusdam et nemo iusto saepe",
    },
    {
      "userId": 7,
      "id": 67,
      "title": "aliquid eos sed fuga est maxime repellendus",
      "body":
          "reprehenderit id nostrum\nvoluptas doloremque pariatur sint et accusantium quia quod aspernatur\net fugiat amet\nnon sapiente et consequatur necessitatibus molestiae",
    },
    {
      "userId": 7,
      "id": 68,
      "title": "odio quis facere architecto reiciendis optio",
      "body":
          "magnam molestiae perferendis quisquam\nqui cum reiciendis\nquaerat animi amet hic inventore\nea quia deleniti quidem saepe porro velit",
    },
    {
      "userId": 7,
      "id": 69,
      "title": "fugiat quod pariatur odit minima",
      "body":
          "officiis error culpa consequatur modi asperiores et\ndolorum assumenda voluptas et vel qui aut vel rerum\nvoluptatum quisquam perspiciatis quia rerum consequatur totam quas\nsequi commodi repudiandae asperiores et saepe a",
    },
    {
      "userId": 7,
      "id": 70,
      "title": "voluptatem laborum magni",
      "body":
          "sunt repellendus quae\nest asperiores aut deleniti esse accusamus repellendus quia aut\nquia dolorem unde\neum tempora esse dolore",
    },
    {
      "userId": 8,
      "id": 71,
      "title": "et iusto veniam et illum aut fuga",
      "body":
          "occaecati a doloribus\niste saepe consectetur placeat eum voluptate dolorem et\nqui quo quia voluptas\nrerum ut id enim velit est perferendis",
    },
    {
      "userId": 8,
      "id": 72,
      "title": "sint hic doloribus consequatur eos non id",
      "body":
          "quam occaecati qui deleniti consectetur\nconsequatur aut facere quas exercitationem aliquam hic voluptas\nneque id sunt ut aut accusamus\nsunt consectetur expedita inventore velit",
    },
    {
      "userId": 8,
      "id": 73,
      "title": "consequuntur deleniti eos quia temporibus ab aliquid at",
      "body":
          "voluptatem cumque tenetur consequatur expedita ipsum nemo quia explicabo\naut eum minima consequatur\ntempore cumque quae est et\net in consequuntur voluptatem voluptates aut",
    },
    {
      "userId": 8,
      "id": 74,
      "title": "enim unde ratione doloribus quas enim ut sit sapiente",
      "body":
          "odit qui et et necessitatibus sint veniam\nmollitia amet doloremque molestiae commodi similique magnam et quam\nblanditiis est itaque\nquo et tenetur ratione occaecati molestiae tempora",
    },
    {
      "userId": 8,
      "id": 75,
      "title": "dignissimos eum dolor ut enim et delectus in",
      "body":
          "commodi non non omnis et voluptas sit\nautem aut nobis magnam et sapiente voluptatem\net laborum repellat qui delectus facilis temporibus\nrerum amet et nemo voluptate expedita adipisci error dolorem",
    },
    {
      "userId": 8,
      "id": 76,
      "title": "doloremque officiis ad et non perferendis",
      "body":
          "ut animi facere\ntotam iusto tempore\nmolestiae eum aut et dolorem aperiam\nquaerat recusandae totam odio",
    },
    {
      "userId": 8,
      "id": 77,
      "title": "necessitatibus quasi exercitationem odio",
      "body":
          "modi ut in nulla repudiandae dolorum nostrum eos\naut consequatur omnis\nut incidunt est omnis iste et quam\nvoluptates sapiente aliquam asperiores nobis amet corrupti repudiandae provident",
    },
    {
      "userId": 8,
      "id": 78,
      "title": "quam voluptatibus rerum veritatis",
      "body":
          "nobis facilis odit tempore cupiditate quia\nassumenda doloribus rerum qui ea\nillum et qui totam\naut veniam repellendus",
    },
    {
      "userId": 8,
      "id": 79,
      "title": "pariatur consequatur quia magnam autem omnis non amet",
      "body":
          "libero accusantium et et facere incidunt sit dolorem\nnon excepturi qui quia sed laudantium\nquisquam molestiae ducimus est\nofficiis esse molestiae iste et quos",
    },
    {
      "userId": 8,
      "id": 80,
      "title": "labore in ex et explicabo corporis aut quas",
      "body":
          "ex quod dolorem ea eum iure qui provident amet\nquia qui facere excepturi et repudiandae\nasperiores molestias provident\nminus incidunt vero fugit rerum sint sunt excepturi provident",
    },
    {
      "userId": 9,
      "id": 81,
      "title": "tempora rem veritatis voluptas quo dolores vero",
      "body":
          "facere qui nesciunt est voluptatum voluptatem nisi\nsequi eligendi necessitatibus ea at rerum itaque\nharum non ratione velit laboriosam quis consequuntur\nex officiis minima doloremque voluptas ut aut",
    },
    {
      "userId": 9,
      "id": 82,
      "title": "laudantium voluptate suscipit sunt enim enim",
      "body":
          "ut libero sit aut totam inventore sunt\nporro sint qui sunt molestiae\nconsequatur cupiditate qui iste ducimus adipisci\ndolor enim assumenda soluta laboriosam amet iste delectus hic",
    },
    {
      "userId": 9,
      "id": 83,
      "title": "odit et voluptates doloribus alias odio et",
      "body":
          "est molestiae facilis quis tempora numquam nihil qui\nvoluptate sapiente consequatur est qui\nnecessitatibus autem aut ipsa aperiam modi dolore numquam\nreprehenderit eius rem quibusdam",
    },
    {
      "userId": 9,
      "id": 84,
      "title":
          "optio ipsam molestias necessitatibus occaecati facilis veritatis dolores aut",
      "body":
          "sint molestiae magni a et quos\neaque et quasi\nut rerum debitis similique veniam\nrecusandae dignissimos dolor incidunt consequatur odio",
    },
    {
      "userId": 9,
      "id": 85,
      "title": "dolore veritatis porro provident adipisci blanditiis et sunt",
      "body":
          "similique sed nisi voluptas iusto omnis\nmollitia et quo\nassumenda suscipit officia magnam sint sed tempora\nenim provident pariatur praesentium atque animi amet ratione",
    },
    {
      "userId": 9,
      "id": 86,
      "title": "placeat quia et porro iste",
      "body":
          "quasi excepturi consequatur iste autem temporibus sed molestiae beatae\net quaerat et esse ut\nvoluptatem occaecati et vel explicabo autem\nasperiores pariatur deserunt optio",
    },
    {
      "userId": 9,
      "id": 87,
      "title": "nostrum quis quasi placeat",
      "body":
          "eos et molestiae\nnesciunt ut a\ndolores perspiciatis repellendus repellat aliquid\nmagnam sint rem ipsum est",
    },
    {
      "userId": 9,
      "id": 88,
      "title": "sapiente omnis fugit eos",
      "body":
          "consequatur omnis est praesentium\nducimus non iste\nneque hic deserunt\nvoluptatibus veniam cum et rerum sed",
    },
    {
      "userId": 9,
      "id": 89,
      "title": "sint soluta et vel magnam aut ut sed qui",
      "body":
          "repellat aut aperiam totam temporibus autem et\narchitecto magnam ut\nconsequatur qui cupiditate rerum quia soluta dignissimos nihil iure\ntempore quas est",
    },
    {
      "userId": 9,
      "id": 90,
      "title": "ad iusto omnis odit dolor voluptatibus",
      "body":
          "minus omnis soluta quia\nqui sed adipisci voluptates illum ipsam voluptatem\neligendi officia ut in\neos soluta similique molestias praesentium blanditiis",
    },
    {
      "userId": 10,
      "id": 91,
      "title": "aut amet sed",
      "body":
          "libero voluptate eveniet aperiam sed\nsunt placeat suscipit molestias\nsimilique fugit nam natus\nexpedita consequatur consequatur dolores quia eos et placeat",
    },
    {
      "userId": 10,
      "id": 92,
      "title": "ratione ex tenetur perferendis",
      "body":
          "aut et excepturi dicta laudantium sint rerum nihil\nlaudantium et at\na neque minima officia et similique libero et\ncommodi voluptate qui",
    },
    {
      "userId": 10,
      "id": 93,
      "title": "beatae soluta recusandae",
      "body":
          "dolorem quibusdam ducimus consequuntur dicta aut quo laboriosam\nvoluptatem quis enim recusandae ut sed sunt\nnostrum est odit totam\nsit error sed sunt eveniet provident qui nulla",
    },
    {
      "userId": 10,
      "id": 94,
      "title": "qui qui voluptates illo iste minima",
      "body":
          "aspernatur expedita soluta quo ab ut similique\nexpedita dolores amet\nsed temporibus distinctio magnam saepe deleniti\nomnis facilis nam ipsum natus sint similique omnis",
    },
    {
      "userId": 10,
      "id": 95,
      "title": "id minus libero illum nam ad officiis",
      "body":
          "earum voluptatem facere provident blanditiis velit laboriosam\npariatur accusamus odio saepe\ncumque dolor qui a dicta ab doloribus consequatur omnis\ncorporis cupiditate eaque assumenda ad nesciunt",
    },
  ];

  test('getPostsByKeyword Test', () async {
    // given
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(json),
        200,
      );
    });

    final RemoteDataSource remoteDataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    // when
    final List<Post> posts = await PostRepositoryImpl(
      remoteDataSource: remoteDataSource,
    ).getPostsByKeyword('voluptate');

    // then
    expect(posts.length, equals(5));
  });
}

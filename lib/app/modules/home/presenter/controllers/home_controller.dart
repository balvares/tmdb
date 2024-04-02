import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/enum/state.dart';
import '../../../../core/shared/utils/enviroment.dart';
import '../../../../core/shared/errors/http_exception.dart';
import '../../../../core/providers/movies/domain/entities/movie_entity.dart';
import '../../../../core/providers/movies/usecases/interfaces/get_popular_movies_usecase.dart';
import '../../../../core/providers/movies/usecases/interfaces/get_upcoming_movies_usecase.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> items = [
    {
      "adult": false,
      "backdrop_path": "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg",
      "genre_ids": [28, 878, 12],
      "id": 823464,
      "original_language": "en",
      "original_title": "Godzilla x Kong: The New Empire",
      "overview":
          "O poderoso Kong e o temível Godzilla se unem contra uma colossal ameaça mortal escondida no mundo dos humanos, que ameaça a existência de sua espécie e da nossa. Mergulhando profundamente nos mistérios da Ilha da Caveira e nas origens da Terra Oca, o filme irá explorar a antiga batalha de Titãs que ajudou a forjar esses seres extraordinários e os ligou à humanidade para sempre.",
      "popularity": 5072.084,
      "poster_path": "/kO6K9zEsKhNyqcrdGTSqAI6jrie.jpg",
      "release_date": "2024-03-27",
      "title": "Godzilla e Kong: O Novo Império",
      "video": false,
      "vote_average": 7.112,
      "vote_count": 236
    },
    {
      "adult": false,
      "backdrop_path": "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
      "genre_ids": [28, 12, 16, 35, 10751],
      "id": 1011985,
      "original_language": "en",
      "original_title": "Kung Fu Panda 4",
      "overview":
          "Po está prestes a se tornar o novo líder espiritual do Vale da Paz, mas antes que possa fazer isso, ele deve encontrar um sucessor para se tornar o novo Dragão Guerreiro.  Ele parece encontrar uma em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-la.",
      "popularity": 3472.8,
      "poster_path": "/aNK6MA5EApIo0UJE7ZWSYcZBJKy.jpg",
      "release_date": "2024-03-02",
      "title": "Kung Fu Panda 4",
      "video": false,
      "vote_average": 6.886,
      "vote_count": 483
    },
    {
      "adult": false,
      "backdrop_path": "/oe7mWkvYhK4PLRNAVSvonzyUXNy.jpg",
      "genre_ids": [28, 53],
      "id": 359410,
      "original_language": "en",
      "original_title": "Road House",
      "overview":
          "Um ex-lutador do UFC consegue um emprego como segurança em um estabelecimento na Flórida Keys, apenas para descobrir que este paraíso não é tudo o que parece.",
      "popularity": 3111.068,
      "poster_path": "/h2xDLj6CtzItwQEFyBjIXh5z3QD.jpg",
      "release_date": "2024-03-08",
      "title": "Matador de Aluguel",
      "video": false,
      "vote_average": 7.266,
      "vote_count": 1021
    },
    {
      "adult": false,
      "backdrop_path": "/pwGmXVKUgKN13psUjlhC9zBcq1o.jpg",
      "genre_ids": [28, 14],
      "id": 634492,
      "original_language": "en",
      "original_title": "Madame Web",
      "overview":
          "Depois de sobreviver a um terrível acidente, a paramédica Cassandra Webb começa a desenvolver habilidades de clarividência. Forçada a enfrentar revelações sobre seu passado, ela estabelece um relacionamento com três jovens destinadas a futuros poderosos... se todas conseguirem sobreviver a um presente mortal.",
      "popularity": 1928.87,
      "poster_path": "/zWEm5oy2tE9ku1KSNM089FmZJ2p.jpg",
      "release_date": "2024-02-14",
      "title": "Madame Teia",
      "video": false,
      "vote_average": 5.654,
      "vote_count": 889
    },
    {
      "adult": false,
      "backdrop_path": "/2C3CdVzINUm5Cm1lrbT2uiRstwX.jpg",
      "genre_ids": [28, 14, 10752],
      "id": 856289,
      "original_language": "zh",
      "original_title": "封神第一部：朝歌风云",
      "overview":
          "Baseado no mais conhecido romance clássico de fantasia da China, Fengshenyanyi, a trilogia é um magnífico épico de fantasia oriental que recria as prolongadas guerras míticas entre humanos, imortais e monstros, que aconteceram há mais de três mil anos.",
      "popularity": 1462.884,
      "poster_path": "/8fzJZQhmkLyZeXdZUi1eE2ZKhkm.jpg",
      "release_date": "2023-07-20",
      "title": "Criação dos Deuses I: Reino das Tempestades",
      "video": false,
      "vote_average": 7.154,
      "vote_count": 136
    },
    {
      "adult": false,
      "backdrop_path": "/7ZP8HtgOIDaBs12krXgUIygqEsy.jpg",
      "genre_ids": [878, 28, 14, 12],
      "id": 601796,
      "original_language": "ko",
      "original_title": "외계+인 1부",
      "overview":
          "A porta do tempo se abre entre o espadachim que quer apoderar-se da lendária espada divina no final da Dinastia Goryeo e aqueles que perseguem um prisioneiro alienígena preso em um corpo humano em 2022.",
      "popularity": 1240.858,
      "poster_path": "/ynyN9hdxL5vq7GnSX8Fdz3TfoTE.jpg",
      "release_date": "2022-07-20",
      "title": "Alienoid",
      "video": false,
      "vote_average": 7.15,
      "vote_count": 223
    },
    {
      "adult": false,
      "backdrop_path": "/deLWkOLZmBNkm8p16igfapQyqeq.jpg",
      "genre_ids": [14, 28, 12],
      "id": 763215,
      "original_language": "en",
      "original_title": "Damsel",
      "overview":
          "O casamento de uma jovem com um príncipe encantado se transforma em uma luta por sobrevivência quando ela é oferecida em sacrifício a um dragão que cospe fogo.",
      "popularity": 1189.19,
      "poster_path": "/ub4EHdVBVm3nHJiamU0gGcKS4ae.jpg",
      "release_date": "2024-03-07",
      "title": "Donzela",
      "video": false,
      "vote_average": 7.173,
      "vote_count": 1361
    },
    {
      "adult": false,
      "backdrop_path": "/4woSOUD0equAYzvwhWBHIJDCM88.jpg",
      "genre_ids": [28, 27, 53],
      "id": 1096197,
      "original_language": "pt",
      "original_title": "No Way Up",
      "overview":
          "Um grupo de desconhecidos acabam no meio do Oceano Pacífico depois de um acidente aéreo. Presos em uma bolsa de ar, eles devem trabalhar juntos para enfrentar os perigos que os cercam antes que o oxigênio acabe.",
      "popularity": 975.693,
      "poster_path": "/ktxq0LYgl41I2DUn49TYIaS9dZR.jpg",
      "release_date": "2024-01-18",
      "title": "Desespero Profundo",
      "video": false,
      "vote_average": 6.214,
      "vote_count": 309
    },
    {
      "adult": false,
      "backdrop_path": "/oFAukXiMPrwLpbulGmB5suEZlrm.jpg",
      "genre_ids": [28, 12, 878, 14, 18],
      "id": 624091,
      "original_language": "id",
      "original_title": "Sri Asih",
      "overview":
          "Quando ainda era bebê, Alana foi separada de seus pais e adotada por uma mulher rica. Ao atingir a maioridade, ela descobre que não é um ser humano qualquer e possui superpoderes. O futuro da humanidade agora depende da sua capacidade em controlar a própria raiva.",
      "popularity": 896.246,
      "poster_path": "/jQSvpSCag0IIvPVtlgLZhJJe4LX.jpg",
      "release_date": "2022-11-17",
      "title": "Sri Asih",
      "video": false,
      "vote_average": 6.182,
      "vote_count": 44
    },
    {
      "adult": false,
      "backdrop_path": "/pulJ1iY7GVeppMRipiR7ZGDW7EW.jpg",
      "genre_ids": [18],
      "id": 615,
      "original_language": "en",
      "original_title": "The Passion of the Christ",
      "overview":
          "O filme narra as últimas 12 horas de Jesus Cristo, que, após ser traído por Judas, é preso e levado para o julgamento de Poncio Pilatos. Sem conseguir encontrar um motivo para sua condenação, ele sofre com a pressão popular, que pede a crucificação de Jesus.",
      "popularity": 706.39,
      "poster_path": "/nhepbUWTnLb9fm4qk9h52MYBszm.jpg",
      "release_date": "2004-02-25",
      "title": "A Paixão de Cristo",
      "video": false,
      "vote_average": 7.498,
      "vote_count": 4327
    },
    {
      "adult": false,
      "backdrop_path": "/2KGxQFV9Wp1MshPBf8BuqWUgVAz.jpg",
      "genre_ids": [16, 28, 12, 35, 10751],
      "id": 940551,
      "original_language": "en",
      "original_title": "Migration",
      "overview":
          "A família Mallard está um pouco refém da rotina. Enquanto Mack, o pai, se contenta em manter sua família segura nos arredores de um lago da Nova Inglaterra para sempre, Pam, a mãe, está ansiosa para agitar as coisas e mostrar a seus filhos – o adolescente Dax e a patinha Gwen – o mundo inteiro. Quando uma família de patos migratórios aterrissa em seu lago com histórias emocionantes de lugares distantes, Pam convence Mack a embarcar em uma viagem em família, via Nova York, para a Jamaica tropical.",
      "popularity": 990.599,
      "poster_path": "/wXWnUhdnSuADRp9w7aAZNHx682v.jpg",
      "release_date": "2023-12-06",
      "title": "Patos!",
      "video": false,
      "vote_average": 7.55,
      "vote_count": 1047
    },
    {
      "adult": false,
      "backdrop_path": "/mEoIDEiePnYj178H9znzbl9zvky.jpg",
      "genre_ids": [28],
      "id": 1006540,
      "original_language": "en",
      "original_title": "Bullet Train Down",
      "overview":
          "Em sua corrida inaugural, o trem-bala mais rápido do mundo está equipado com uma bomba que explodirá se cair abaixo de 320 km/h.",
      "popularity": 733.248,
      "poster_path": "/5a7cocgyVuFjYV71neDIGVzD6Yq.jpg",
      "release_date": "2022-08-01",
      "title": "Trem bala à baixo",
      "video": false,
      "vote_average": 5.06,
      "vote_count": 24
    },
    {
      "adult": false,
      "backdrop_path": "/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg",
      "genre_ids": [28, 53, 10752],
      "id": 969492,
      "original_language": "en",
      "original_title": "Land of Bad",
      "overview":
          "Uma missão das forças especiais vira um grande desastre e, cercados pelo inimigo em um território remoto nas Filipinas, a única chance de resgate está nas mãos de Reaper (Russel Crowe), um piloto de drone, e Kinney (Liam Hemsworth), um jovem oficial da aeronáutica. Eles têm 48 horas para resgatar os soldados antes que vire um banho de sangue.",
      "popularity": 832.65,
      "poster_path": "/cCRAMT530bTcZ4xs6E6pTUoAalE.jpg",
      "release_date": "2024-01-25",
      "title": "Zona de Risco",
      "video": false,
      "vote_average": 7.157,
      "vote_count": 461
    },
    {
      "adult": false,
      "backdrop_path": "/uIlBxOQTvreoAEWdFH4LzCNvobN.jpg",
      "genre_ids": [28, 80, 18, 9648, 878, 53],
      "id": 1013240,
      "original_language": "id",
      "original_title": "24 Jam Bersama Gaspar",
      "overview":
          "Um detetive particular que só tem mais 24 horas de vida tenta solucionar o desaparecimento de sua amiga de infância.",
      "popularity": 658.56,
      "poster_path": "/wpEbqJ2UYMx1dCgQW6kRgNAlmo4.jpg",
      "release_date": "2023-10-06",
      "title": "24 Horas com Gaspar",
      "video": false,
      "vote_average": 6.712,
      "vote_count": 26
    },
    {
      "adult": false,
      "backdrop_path": "/cu5Qk2QHxOyyMrD3Bq93DxgmJer.jpg",
      "genre_ids": [28, 80],
      "id": 1046090,
      "original_language": "zh",
      "original_title": "周處除三害",
      "overview":
          "Ao descobrir que é apenas o terceiro fugitivo mais procurado de Taiwan, um criminoso embarca em uma jornada para ultrapassar os dois primeiros.",
      "popularity": 615.858,
      "poster_path": "/3mcmVvWCCkCYK61xndbAhpACSGY.jpg",
      "release_date": "2023-10-06",
      "title": "Os Três Males",
      "video": false,
      "vote_average": 7.538,
      "vote_count": 118
    },
    {
      "adult": false,
      "backdrop_path": "/inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg",
      "genre_ids": [28, 878, 53],
      "id": 399566,
      "original_language": "en",
      "original_title": "Godzilla vs. Kong",
      "overview":
          "Em uma época em que os monstros andam na Terra, a luta da humanidade por seu futuro coloca Godzilla e Kong em rota de colisão que verá as duas forças mais poderosas da natureza no planeta se confrontarem em uma batalha espetacular para as idades. Enquanto Monarch embarca em uma missão perigosa em terreno desconhecido e descobre pistas sobre as origens dos Titãs, uma conspiração humana ameaça tirar as criaturas, boas e más, da face da terra para sempre.",
      "popularity": 712.998,
      "poster_path": "/teW53VSLdZMMSmkn5xBBowu3tEr.jpg",
      "release_date": "2021-03-24",
      "title": "Godzilla vs. Kong",
      "video": false,
      "vote_average": 7.628,
      "vote_count": 9489
    },
    {
      "adult": false,
      "backdrop_path": "/3Kzc6V4MWs3RXCmE5DhAYnfWL8F.jpg",
      "genre_ids": [16, 35, 878],
      "id": 1239251,
      "original_language": "en",
      "original_title": "Megamind vs. the Doom Syndicate",
      "overview":
          "A antiga equipe de vilões de Megamente retorna para Metro City. Para evitar que eles mandem a cidade para a lua, o herói azul vai ter que fingir ainda ser um vilão para conseguir derrotá-los.",
      "popularity": 711.826,
      "poster_path": "/60x76Yb6nMPFwEZ3um5yhUwCga.jpg",
      "release_date": "2024-03-29",
      "title": "Megamente Vs. O Sindicato da Perdição",
      "video": false,
      "vote_average": 5.7,
      "vote_count": 20
    },
    {
      "adult": false,
      "backdrop_path": "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
      "genre_ids": [878, 12],
      "id": 693134,
      "original_language": "en",
      "original_title": "Dune: Part Two",
      "overview":
          "A jornada de Paul Atreides continua. Ele se une a Chani e aos Fremen em uma guerra de vingança contra aqueles que destruíram sua família. Diante de uma escolha entre o amor de sua vida e o destino do universo, Paul tenta evitar um futuro terrível que só ele pode prever.",
      "popularity": 846.078,
      "poster_path": "/e8pI4XkYgUMuSJ8cEFbJE18wc4e.jpg",
      "release_date": "2024-02-27",
      "title": "Duna: Parte Dois",
      "video": false,
      "vote_average": 8.378,
      "vote_count": 2340
    },
    {
      "adult": false,
      "backdrop_path": "/4Ep2KivIBUZbkS7kHjW7Qywnhhj.jpg",
      "genre_ids": [28],
      "id": 1049948,
      "original_language": "en",
      "original_title": "Vikings: Battle of Heirs",
      "overview": "",
      "popularity": 655.151,
      "poster_path": "/87goLbbqrJqAxqDS5cBsik1zKT.jpg",
      "release_date": "2023-04-28",
      "title": "Vikings: Battle of Heirs",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 14
    },
    {
      "adult": false,
      "backdrop_path": "/u0P5drNyTrZoGyJONPcZGbv1mNP.jpg",
      "genre_ids": [28, 53],
      "id": 1124127,
      "original_language": "en",
      "original_title": "Air Force One Down",
      "overview": "",
      "popularity": 675.07,
      "poster_path": "/nKPoSD4pZ3s3CJ9g3cqWRcQ41TC.jpg",
      "release_date": "2024-02-09",
      "title": "Air Force One Down",
      "video": false,
      "vote_average": 6.349,
      "vote_count": 53
    }
  ];

  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  final GetUpcomingMoviesUsecase _getUpcomingMoviesUsecase;

  HomeController({
    required GetPopularMoviesUsecase getPopularMoviesUsecase,
    required GetUpcomingMoviesUsecase getUpcomingMoviesUsecase,
  })  : _getPopularMoviesUsecase = getPopularMoviesUsecase,
        _getUpcomingMoviesUsecase = getUpcomingMoviesUsecase;

  final _state = StateType.load.obs;
  get state => _state.value;
  set state(value) => _state.value = value;

  final _popularMovies = Rxn<MovieEntity>(null);
  MovieEntity? get popularMovies => _popularMovies.value;
  set popularMovies(MovieEntity? value) => _popularMovies.value = value;

  final _upcomingMovies = Rxn<MovieEntity>(null);
  MovieEntity? get upcomingMovies => _upcomingMovies.value;
  set upcomingMovies(MovieEntity? value) => _upcomingMovies.value = value;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final imageUrl = Environment.imageUrl;
  final double fontSize = 10;

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    await _getPopularMovies();
    await _getUpcomingMovies();
  }

  Future<void> _getPopularMovies() async {
    try {
      state = StateType.load;
      popularMovies = await _getPopularMoviesUsecase.call();
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
      var message = "";
      if (e is HttpException) {
        message = "Não foi possivel carregar os dados.";
      } else {
        message = "Ocorreu um problema, tente novamente mais tarde.";
      }
      Get.snackbar("Ops!", message);
    }
  }

  Future<void> _getUpcomingMovies() async {
    try {
      state = StateType.load;
      upcomingMovies = await _getUpcomingMoviesUsecase.call();
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
      var message = "";
      if (e is HttpException) {
        message = "Não foi possivel carregar os dados.";
      } else {
        message = "Ocorreu um problema, tente novamente mais tarde.";
      }
      Get.snackbar("Ops!", message);
    }
  }
}

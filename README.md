# flutter-dent-lab-web
Este projeto é um aplicativo Flutter desenvolvido para gerenciar agendamentos de consultas em um consultório. Ele apresenta uma interface para usuários e administradores, permitindo o agendamento, listagem e gerenciamento de consultas.

Funcionalidades: 
Tela de login com autenticação de usuários e administradores.
Tela de usuário para visualizar e agendar consultas disponíveis.
Tela de administrador para visualizar e gerenciar consultas agendadas.
Possibilidade de filtrar consultas por nome do cliente na tela de administrador.
Adição de novas consultas por meio de um showModalBottomSheet.
Atualização em tempo real da lista de consultas após a criação de uma nova consulta.
Gerenciamento de estado com ChangeNotifier, ChangeNotifierProvider e Consumer.

Tecnologias e pacotes utilizados:
Flutter
Dart
Provider
http

Estrutura do projeto:

Model ConsultaModel: com atributos data, horario e idUser, e métodos fromJson e toJson.
Controller ConsultaController: com ChangeNotifier e métodos fetchConsultas, createConsulta, updateConsulta, removeConsulta e agendarConsulta.
Widget ConsultasList: exibe uma lista de consultas com base no usuário e utiliza o ConsultaController para obter os dados.

Instruções de instalação e uso:
Clone o repositório e navegue até o diretório do projeto.
Execute flutter pub get para instalar as dependências.
Inicie um emulador ou conecte um dispositivo físico.
Execute flutter run para iniciar o aplicativo.
Este projeto demonstra a criação de um aplicativo de agendamento de consultas usando Flutter e Dart. Ele aborda questões importantes, como autenticação, gerenciamento de estado e otimização de desempenho, fornecendo uma base sólida para o desenvolvimento de aplicativos similares.

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela1.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela2.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela3.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela4.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela5.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela6.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela7.png)

![Texto alternativo](https://github.com/KaianNovais/flutter-dent-lab-web/blob/main/images/telas/tela8.png)


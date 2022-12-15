import 'dart:math';

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //list.elementAt(Random().);
  //ADD questões and resposta

  list.add(Question(
    "De acordo com a Política Nacional para Prevenção e Controle do Câncer, as unidades básicas de saúde e as equipes de saúde da família devem atuar articuladas aos distintos componentes da rede de atenção à saúde, sendo a pactuação e regulação do fluxo dos usuários de competência do gestor federal e da sociedade civil organizada.",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));

  list.add(Question(
    "Criança com história familiar positiva para tumor de Wilms e Hemi-hipertrofia deve ser avaliada com ultrassom abdominal de 3 em 3 meses até os 5 anos",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));

  list.add(Question(
    "Leucemias, linfomas e tumores do sistema nervoso central são as neoplasias que apresentam maiores incidências em crianças e adolescente",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));

  list.add(Question(
    "A anemia causa leucemia.",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));

  list.add(Question(
    "Os sinais e sintomas do câncer infantojuvenil são inespecíficos e comuns a outras doenças pediátricas.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    "A criança e o adolescente com câncer em tratamento podem tomar as vacinas que contenham vírus vivos do calendário vacinal e das campanhas nacionais.",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    "Um dos sinais apresentados no retinoblastoma é o reflexo do olho de gato.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    "Crianças e adolescentes em tratamento de câncer que apresentam febre correm risco de vida e, portanto, devem ser encaminhadas ao Centro de Tratamento.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    "A criança em tratamento oncológico que apresenta sangramento nasal e manchas roxas pelo corpo, deve ser encaminhada ao hospital.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    " No atendimento a uma criança com nódulo supraclavicular, deve-se solicitar exames e aguardar confirmação diagnóstica.",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    " A equipe da ESF deve auxiliar o médico oncologista no seguimento domiciliar da criança e do adolescente em tratamento oncológico.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    "Dor óssea associada ao aumento de volume em membros inferiores é um dos principais sinais e sintomas de um Tumor Renal.",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    "No acompanhamento domiciliar, o Agente Comunitário de Saúde deverá visitar o paciente em tratamento oncológico somente a partir da solicitação da família do paciente",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    " Anemia, dor óssea, linfonodomegalia e hepatoesplenomegalia são sinais e sintomas associados à leucemia.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    " Ao atender uma criança com suspeita de câncer, o médico da ESF deve confirmar o diagnóstico e referenciá-la para uma unidade de alta complexidade em oncologia",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    "Crianças com câncer devem ser estimuladas a manter as suas atividades escolares e sociais.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    " Dor de cabeça frequente associada a vômitos não são sintomas de alerta para o diagnóstico de câncer",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));
  list.add(Question(
    "Os pais ou responsáveis legais de crianças / adolescentes com câncer têm direito ao saque do FGTS.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  list.add(Question(
    "Apesar de em alguns países a cura do câncer infantil ultrapassar a faixa dos 70% dos casos, no Brasil, a média de sobrevida está abaixo da esperada, dentre outras causas, também devido às diferenças regionais na oferta de serviços especializados.",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));

  list.shuffle();

  return list;
}

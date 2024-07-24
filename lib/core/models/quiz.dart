class Quiz {
  final String question;
  final List<Answer> answers;
  Quiz({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String title;
  final bool correct;
  Answer({
    required this.title,
    required this.correct,
  });
}

List<Quiz> quizes = [
  Quiz(
    question: 'What is the longest river in the world?',
    answers: [
      Answer(title: 'Amazon', correct: false),
      Answer(title: 'Yangtze', correct: false),
      Answer(title: 'Mississippi', correct: false),
      Answer(title: 'Nile', correct: true),
    ],
  ),
  Quiz(
    question: 'Which country has the largest population?',
    answers: [
      Answer(title: 'United States', correct: false),
      Answer(title: 'Indonesia', correct: false),
      Answer(title: 'Brazil', correct: false),
      Answer(title: 'China', correct: true),
    ],
  ),
  Quiz(
    question: 'What is the capital of Australia?',
    answers: [
      Answer(title: 'Sydney', correct: false),
      Answer(title: 'Melbourne', correct: false),
      Answer(title: 'Brisbane', correct: false),
      Answer(title: 'Canberra', correct: true),
    ],
  ),
  Quiz(
    question: 'Which continent is the Sahara Desert located on?',
    answers: [
      Answer(title: 'Asia', correct: false),
      Answer(title: 'South America', correct: false),
      Answer(title: 'North America', correct: false),
      Answer(title: 'Africa', correct: true),
    ],
  ),
  Quiz(
    question: 'What is the smallest country in the world by land area?',
    answers: [
      Answer(title: 'Monaco', correct: false),
      Answer(title: 'San Marino', correct: false),
      Answer(title: 'Liechtenstein', correct: false),
      Answer(title: 'Vatican City', correct: true),
    ],
  ),
  Quiz(
    question: 'Which ocean is the deepest?',
    answers: [
      Answer(title: 'Atlantic', correct: false),
      Answer(title: 'Indian', correct: false),
      Answer(title: 'Arctic', correct: false),
      Answer(title: 'Pacific', correct: true),
    ],
  ),
  Quiz(
    question: 'Which country is known as the Land of the Rising Sun?',
    answers: [
      Answer(title: 'Thailand', correct: false),
      Answer(title: 'South Korea', correct: false),
      Answer(title: 'China', correct: false),
      Answer(title: 'Japan', correct: true),
    ],
  ),
  Quiz(
    question: 'What is the tallest mountain in the world?',
    answers: [
      Answer(title: 'K2', correct: false),
      Answer(title: 'Kangchenjunga', correct: false),
      Answer(title: 'Lhotse', correct: false),
      Answer(title: 'Mount Everest', correct: true),
    ],
  ),
  Quiz(
    question: 'Which US state has the longest coastline?',
    answers: [
      Answer(title: 'California', correct: false),
      Answer(title: 'Florida', correct: false),
      Answer(title: 'Texas', correct: false),
      Answer(title: 'Alaska', correct: true),
    ],
  ),
  Quiz(
    question: 'What is the largest desert in the world?',
    answers: [
      Answer(title: 'Arabian', correct: false),
      Answer(title: 'Gobi', correct: false),
      Answer(title: 'Kalahari', correct: false),
      Answer(title: 'Antarctic', correct: true),
    ],
  ),
  Quiz(
    question: 'Which river flows through Paris?',
    answers: [
      Answer(title: 'Thames', correct: false),
      Answer(title: 'Danube', correct: false),
      Answer(title: 'Rhine', correct: false),
      Answer(title: 'Seine', correct: true),
    ],
  ),
  Quiz(
    question: 'What is the capital of Canada?',
    answers: [
      Answer(title: 'Toronto', correct: false),
      Answer(title: 'Vancouver', correct: false),
      Answer(title: 'Montreal', correct: false),
      Answer(title: 'Ottawa', correct: true),
    ],
  ),
];

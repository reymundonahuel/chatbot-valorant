program Valorant;

uses initValorantData, funciones;

const
  {Respuestas del Chat Bot}
  name_chatbot = 'ValorantBot';
  bienvenida_bot = 'Hola! Mi nombre es {name_chatbot}! ¿Como es el tuyo?';
  saludos_hablante = 'Genial {name_hablante}! bonito nombre por cierto. Que te gustaria preguntarme sobre Valorant? Puedes preguntarme sobre agentes o como jugar Valorant.';
  option_404 = 'No he encontrado acerca de eso {name_hablante} 🙄';
  sugerir_ejemplos = 'Escribe la palabra ejemplos o dame ejemplos';
  ejemplos = 'Prueba decir algo como: ¿Cuantos agentes hay en el juego? ó ¿Como se llaman los agentes? ó ¿Que hace el agente Yoru?';
  longNameHablante = 15;
  longNameChatbot = 14;

  var
  name_hablante:string;


begin

Greet(bienvenida_bot,name_chatbot,saludos_hablante,ejemplos);




end.


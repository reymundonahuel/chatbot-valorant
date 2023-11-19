unit initValorantData;

{$mode ObjFPC}{$H+}

uses funciones;

interface
procedure initArrays;


const
  q_agentes = 22;
  q_maps = 10;
  longAgenteName = 12;
  longClase = 7;
  longDispo = 7;
  longQname1 = 8;
  longQcost1 = 8;
  longqfunc1 = 8;
  longQname2 = 8;
  longQcost2 = 8;
  longqfunc2 = 8;
  longQname3 = 8;
  longQcost3 = 8;
  longqfunc3 = 8;
  longQname4 = 8;
  longQcost4 = 8;
  longqfunc4 = 8;
  longMapaName = 10;
  longMapaLoc = 9;
  longMapaLanc = 10;
  longMapaDesc = 10;


  long = 7;
  ruta_archivo = 'C:\Users\Nahuel\Desktop\chatbot-valorant'

  desc_agente = 'El agente {agenteName} es de la clase {clase}. Su disponibilidad es de tipo {dispo}. Y sus habilidades son:'
  desc_habilQ = 'La Q se llama {qname1} y tiene un coste de {qcost1} y su funcion es {qfunc1}.'
  desc_habilE = 'La E se llama {qname2} y tiene un coste de {qcost2} y su funcion es {qfunc2}.'
  desc_habilC = 'La C se llama {qname3} y tiene un coste de {qcost3} y su funcion es {qfunc3}.'
  desc_habilX = 'La X se llama {qname4} y tiene un coste de {qcost4} y su funcion es {qfunc4}.'

  desc_mapa = 'El mapa {mapaName} esta localizado en {mapaLoc}. Fue lanzado {mapaLanc}. {mapaDesc}';

  comojugarValorant = '
  Valorant es un juego de disparos en primera persona táctico en el que dos equipos de cinco jugadores se enfrentan entre sí en una serie de rondas. El objetivo del juego es plantar o desactivar una bomba, o eliminar a todos los miembros del equipo contrario.
  En cada ronda, los jugadores comienzan con una cantidad limitada de dinero que pueden usar para comprar armas, habilidades y otros elementos. Las armas se clasifican en cuatro categorías: pistolas, subfusiles, rifles, y rifles de francotirador. Cada categoría tiene sus propias ventajas y desventajas.
  Los jugadores también tienen acceso a una variedad de habilidades especiales que pueden usar para ayudar a su equipo a ganar. Estas habilidades se dividen en dos categorías: habilidades activas y habilidades pasivas. Las habilidades activas se pueden usar en cualquier momento, mientras que las habilidades pasivas siempre están activas.
  El juego se divide en dos mitades, cada una de las cuales tiene 12 rondas. El equipo que gane 13 rondas gana el partido.
  ***Cómo jugar Valorant***
  **Fase de compra**
  Antes de cada ronda, los jugadores tienen la oportunidad de comprar armas, habilidades y otros elementos. El dinero que se puede gastar en cada ronda depende de los resultados de la ronda anterior.
  **Fase de despliegue**
  Después de la fase de compra, los jugadores pueden desplegarse en el mapa. El equipo atacante debe plantar la bomba, mientras que el equipo defensor debe desactivarla.
  **Fase de combate**
  La fase de combate es el momento en que los jugadores luchan entre sí. El objetivo es eliminar a todos los miembros del equipo contrario.'

type
  habilidades_record = RECORD
    idAgente:integer;
    agente:string;
    habilidad1_name:string;
    habilidad1_description:string;
    habilidad1_price:string;
  
    habilidad2_name:string;
    habilidad2_description:string;
    habilidad2_price:string;

    habilidad3_name:string;
    habilidad3_description:string;
    habilidad3_price:string;

    habilidad4_name:string;
    habilidad4_description:string;
    habilidad4_price:string;
  end;

  clases_agentes_record = RECORD
    name:string;
    description:string;
  end;

  agentes_record = RECORD
    id:word;
    name:string[30];
    description:string;
    clase: string;
    disponibilidad: string;
    habilidadesID: integer;
  end;

  mapas_record = RECORD
  name:string;
  localizacion: string;
  fecha_lanzamiento: string;
  description:string;
  end;

  file_agentes = file of agentes_record;
  file_mapas= file of mapas_record;


  var
  { Init variables } 
  agentes:array [1..q_agentes] of agentes_record;
  arch_agentes:file_agentes;
  habilidades:array [1..q_agentes] of habilidades_record;

  mapas:array [1..q_maps] of mapas_record;
  arch_mapas:file_mapas;

  clases:array [1..q_agentes] of clases_agentes_record;



uses
  Classes, SysUtils;

implementation

procedure initArrays;
var

begin
{ Inicializar agentes }
{ Astra }
agentes[0].id = 0;
agentes[0].name = 'Astra';
agentes[0].description = 'Astra controla las energías del cosmos para dar forma al campo de batalla a su antojo. Con pleno dominio de su forma astral y un gran talento para la anticipación estratégica, siempre va eones por delante de los movimientos de sus enemigos.';
agentes[0].clase = 'Controlador';
agentes[0].disponibilidad = 'bloqueada de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[0].habilidades = 0;
habilidades[0].idAgente = 0;
habilidades[0].agente = 'Astra';
habilidades[0].habilidad1_name = 'Pulso nova';
habilidades[0].habilidad1_description = 'coloca estrellas en Forma astral (X). Activa una estrella para detonar un Pulso nova. El Pulso nova se carga brevemente y explota, lo que aturde a todos los jugadores en la zona.';
habilidades[0].habilidad1_price = '12 segundos de reutilización.';
habilidades[0].habilidad2_name = 'Nebulosa';
habilidades[0].habilidad2_description = 'coloca estrellas en Forma astral (X). Activa una estrella para transformarla en una Nebulosa (humo). Usa (F) en una estrella para disiparla, lo que recupera la estrella para poder volver a colocarla tras un tiempo. Disipar una estrella crea una breve Nebulosa falsa en su ubicación antes de recuperarla.';
habilidades[0].habilidad2_price = '15 segundos de reutilización';
habilidades[0].habilidad3_name = 'Pozo gravitatorio';
habilidades[0].habilidad3_description = 'coloca estrellas en Forma astral (X). Activa una estrella para crear un Pozo gravitatorio. Atrae hacia el centro a todos los jugadores en la zona antes de que explote, lo que causa que todos los jugadores atrapados en el interior se vuelvan frágiles.';
habilidades[0].habilidad3_price = '12 segundos de reutilización.';
habilidades[0].habilidad4_name = 'Forma astral / Separación cósmica';
habilidades[0].habilidad4_description = 'activa (X) para entrar en Forma astral y poder colocar estrellas. Las estrellas se pueden reactivar más tarde para transformarlas en un Pulso nova, una Nebulosa o un Pozo gravitatorio. Cuando Separación cósmica está cargada, dispara en Forma astral para empezar a apuntar y, a continuación, usa el disparo para elegir dos ubicaciones. Se creará una Separación cósmica infinita que conecte los dos puntos. Separación cósmica bloquea las balas y atenúa en gran medida los sonidos.';
habilidades[0].habilidad4_price = '150 créditos (forma astral) / 7 puntos de definitiva.';


{ Breach }
agentes[1].id = 1;
agentes[1].name = 'Breach';
agentes[1].description = 'Breach es un iniciador sueco que utiliza sus habilidades para abrir brechas en el campo de batalla y crear oportunidades para su equipo. Sus habilidades le permiten aturdir a los enemigos, cegarlos y causarles daño, lo que lo convierte en un agente muy versátil.';
agentes[1].clase = 'Iniciador';
agentes[1].disponibilidad = 'bloqueada de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[1].habilidades = 1;
habilidades[1].idAgente = 1;
habilidades[1].agente = 'Breach';
habilidades[1].habilidad1_name = 'Explosión cegadora';
habilidades[1].habilidad1_description = 'Equipa una carga explosiva cegadora. Dispara para liberar una rápida explosión que atraviesa paredes. La carga ciega a todos los jugadores que la estén mirando.';
habilidades[1].habilidad1_price = '250 créditos';
habilidades[1].habilidad2_name = 'Falla';
habilidades[1].habilidad2_description = 'Equipa una bomba sísmica. Dispara para liberar un seísmo que aturde a todos los enemigos dentro de la zona de efecto.';
habilidades[1].habilidad2_price = 'gratuita';
habilidades[1].habilidad3_name = 'Réplica';
habilidades[1].habilidad3_description = 'Equipa una carga explosiva de fusión. Dispara para que se extienda por el terreno y explote, infligiendo gran daño a cualquiera que esté dentro de su zona de efecto.';
habilidades[1].habilidad3_price = '200 créditos';
habilidades[1].habilidad4_name = 'Fragor imparable';
habilidades[1].habilidad4_description = 'Equipa una carga explosiva sísmica. Dispara para crear un seísmo que se extiende por una gran zona en forma de cono. Este seísmo aturde y lanza por los aires a los enemigos.';
habilidades[1].habilidad4_price = '7 puntos de definitiva';

{ Brimstone }
agentes[2].id = 2;
agentes[2].name = 'Brimstone';
agentes[2].description = 'Brimstone es un comandante militar estadounidense que utiliza su arsenal orbital para dar apoyo a su equipo. Sus habilidades le permiten crear zonas de control, bloquear la visión y proporcionar a su equipo un impulso de ataque.';
agentes[2].clase = 'Controlador';
agentes[2].disponibilidad = 'desbloqueado desde el inicio';
agentes[2].habilidades = 2;
habilidades[2].idAgente = 2;
habilidades[2].agente = 'Brimstone';
habilidades[2].habilidad1_name = 'Incendiario';
habilidades[2].habilidad1_description = 'Equipa un lanzagranadas incendiarias. Dispara una granada que explota en cuanto toca el suelo, creando una zona de fuego persistente que daña a los jugadores que estén en su interior.';
habilidades[2].habilidad1_price = '250 créditos';
habilidades[2].habilidad2_name = 'Cortina de humo';
habilidades[2].habilidad2_description = 'Equipa un mapa táctico de la zona. Marca una ubicación del mapa y luego confirma el disparo para que caiga en dicho lugar una nube de humo de larga duración que bloquea la visión de los jugadores que estén en su interior. También es útil para impedir que los jugadores te vean si la colocas estratégicamente en huecos de puertas o pasillos estrechos.';
habilidades[2].habilidad2_price = '100 créditos';
habilidades[2].habilidad3_name = 'Baliza estimulante';
habilidades[2].habilidad3_description = 'Equipa una baliza estimulante que puedes lanzar hacia el frente. Al tocar el suelo la baliza se despliega creando un área o campo que otorga disparo rápido a todos los jugadores que estén en su interior.';
habilidades[2].habilidad3_price = '100 créditos';
habilidades[2].habilidad4_name = 'Golpe orbital';
habilidades[2].habilidad4_description = 'Equipa un mapa táctico de la zona y gracias a este puedes señalar una ubicación para disparar un potente golpe orbital de láser. Provoca un gran daño prolongado a los enemigos que se encuentren en la zona afectada.';
habilidades[2].habilidad4_price = '6 puntos de definitiva';

{ Chamber }
agentes[2].id = 3;
agentes[2].name = 'Chamber';
agentes[2].description = 'Chamber es un diseñador de armas siempre bien vestido y bien pertrechado que expulsa a los agresores con precisión letal. Aprovecha su arsenal personalizado para repeler, eliminar enemigos a distancia y crear la contingencia perfecta para cada plan.';
agentes[2].clase = 'Centinela';
agentes[2].disponibilidad = 'bloqueado de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[2].habilidades = 3;
habilidades[2].idAgente = 3;
habilidades[2].agente = 'Chamber';
habilidades[2].habilidad1_name = 'Cazador de cabezas';
habilidades[2].habilidad1_description = 'actívala para equipar una pistola pesada. Utiliza el botón de modo de disparo alternativo para apuntar con la mira.';
habilidades[2].habilidad1_price = '100 créditos';
habilidades[2].habilidad2_name = 'Rendez-Vous';
habilidades[2].habilidad2_description = 'coloca dos anclajes de teleportación. Mientras estén en el suelo y al alcance, reactiva la habilidad para teleportarte rápidamente al otro anclaje. Los anclajes se pueden recoger para volver a colocarlos.';
habilidades[2].habilidad2_price = 'gratuita, 15 segundos de reutilización';
habilidades[2].habilidad3_name = 'Marca registrada';
habilidades[2].habilidad3_description = 'coloca una trampa que rastrea a enemigos. Cuando un enemigo visible entra en el alcance, la trampa inicia una cuenta atrás y, a continuación, desestabiliza el terreno a su alrededor, lo que crea un campo persistente que ralentiza a los jugadores que se encuentren en su interior.';
habilidades[2].habilidad3_price = '150 créditos';
habilidades[2].habilidad4_name = 'Tour de force';
habilidades[2].habilidad4_description = 'actívala para sacar un poderoso rifle de francotirador personalizado que mata a los enemigos con cualquier impacto directo. Matar a un enemigo genera un campo persistente que ralentiza a los jugadores que se encuentren en su interior.';
habilidades[2].habilidad4_price = '7 puntos de definitiva';

{ Cypher }
agentes[2].id = 4;
agentes[2].name = 'Cypher';
agentes[2].description = 'Cypher, como buen centinela, es capaz de adelantarse a los movimientos de los enemigos y cubrir posiciones. Sus habilidades están destinadas a la defensa, así que te recomendamos que lo uses si lo tuyo no es estar al pie del cañón y en el frente de línea. Más bien hay que usarlo creando estrategias con nuestros compañeros y acompañarlos en la batalla dándoles apoyo. Es un personaje que puede funcionar genial cuando se juega en el bando de los defensores y hay que mantener a salvo una zona de la SPIKE';
agentes[2].clase = 'Centinela';
agentes[2].disponibilidad = 'bloqueado de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[2].habilidades = 4;
habilidades[2].idAgente = 4;
habilidades[2].agente = 'Cypher';
habilidades[2].habilidad1_name = 'Prisión cibernética';
habilidades[2].habilidad1_description = 'lanzas de inmediato una prisión cibernética. Esta prisión puede activarse a distancia, apuntando sobre ella, y al hacerlo se creará una zona que bloquea la visión de los enemigos si quieren atravesarla';
habilidades[2].habilidad1_price = '100 créditos';
habilidades[2].habilidad2_name = 'Cámara espía';
habilidades[2].habilidad2_description = 'te equipas con una cámara espía que puedes disparar para fijar en una ubicación. Una vez hecho eso puedes controlar la visión de la cámara (dejando expuesto a Cypher, así que cuidado) para ver lo mismo que ella ve, e incluso puedes disparar un dardo marcador que revelará la posición del enemigo al que alcance.';
habilidades[2].habilidad2_price = 'gratuita';
habilidades[2].habilidad3_name = 'Cable trampa';
habilidades[2].habilidad3_description = 'te equipas con un cable trampa, destructible pero oculto. Puedes dispararlo hacia una pared y este se extenderá hacia la pared del lado opuesto, y también puedes recogerlo para moverlo hacia otra posición. Los jugadores enemigos que atraviesen el cable se quedarán anclados y su posición se revelará, si no logran dispararle a tiempo para librarse acabarán finalmente aturdidos.';
habilidades[2].habilidad3_price = '200 créditos';
habilidades[2].habilidad4_name = 'Hurto neuronal';
habilidades[2].habilidad4_description = 'puedes apuntar sobre un enemigo muerto con tu mira y usar esta habilidad al instante para revelar la posición de todos los enemigos vivos restantes. Especialmente útil cuando solo quedan unos pocos oponentes o no sabes dónde se esconden.';
habilidades[2].habilidad4_price = '7 puntos de definitiva';

{ Fade }
agentes[2].id = 5;
agentes[2].name = 'Fade';
agentes[2].description = 'Fade, la cazarrecompensas turca, desata el poder de las pesadillas para apoderarse de los secretos del enemigo. En armonía con el terror puro, acecha a sus objetivos y revela sus miedos más profundos antes de aplastarlos en la oscuridad';
agentes[2].clase = 'Iniciador';
agentes[2].disponibilidad = 'bloqueado de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[2].habilidades = 5;
habilidades[2].idAgente = 5;
habilidades[2].agente = 'Fade';
habilidades[2].habilidad1_name = 'Capturar';
habilidades[2].habilidad1_description = 'equipa un orbe de tinta de las pesadillas. Puede disparar el orbe para hacerlo caer en picado al suelo después de un tiempo determinado. Al impactar la tinta explotará y creará una zona en la que los enemigos que queden atrapados en ella no podrán escapar por medios normales';
habilidades[2].habilidad1_price = '200 créditos';
habilidades[2].habilidad2_name = 'Atormentar';
habilidades[2].habilidad2_description = 'equipa una entidad de las pesadillas. Puede disparar el orbe para hacerlo caer en picado al suelo después de un tiempo determinado. Al impactar se convertirá en un ente de las pesadillas que revelará la ubicación de los enemigos en su línea de visión. Los enemigos pueden destruir esta entidad';
habilidades[2].habilidad2_price = 'gratuita';
habilidades[2].habilidad3_name = 'Acechadora';
habilidades[2].habilidad3_description = 'te equipas con una Acechadora que puedes lanzar en línea recta. La Acechadora se enfocará en cualquier enemigo o rastro en su cono de visión frontal y lo perseguirá y ofuscará si lo alcanza';
habilidades[2].habilidad3_price = '250 créditos';
habilidades[2].habilidad4_name = 'Anochecer';
habilidades[2].habilidad4_description = 'Fade se equipa con el poder del Miedo. Esto le permite lanzar una onda de energía de las pesadillas que puede atravesar paredes. La energía crea un rastro hacia el oponente, además de ensordecerlo y debilitarlo';
habilidades[2].habilidad4_price = '7 puntos de definitiva';

{ Gekko }
agentes[2].id = 6;
agentes[2].name = 'Gekko';
agentes[2].description = 'Gekko lidera una pequeña pandilla de calamitosas criaturas. Sus colegas toman la delantera para dispersar a los enemigos, mientras que Gekko los persigue para luego reagruparse y repetir el proceso.';
agentes[2].clase = 'Iniciador';
agentes[2].disponibilidad = 'bloqueado de inicio (puede conseguirse mediante su contrato o pagando 1000 puntos Valorant).';
agentes[2].habilidades = 6;
habilidades[2].idAgente = 6;
habilidades[2].agente = 'Gekko';
habilidades[2].habilidad1_name = 'Wingman';
habilidades[2].habilidad1_description = 'equipa a Wingman. Dispara para mandar a Wingman hacia delante en busca de enemigos. Wingman libera una explosión aturdidora en dirección al primer enemigo que ve. Alterna el modo de disparo mientras apuntas a una zona de la Spike o a una Spike colocada para que Wingman la coloque o la desarme. Para colocarla, Gekko debe tener la Spike en su inventario. Cuando Wingman desaparece, vuelve a su estado de glóbulo en reposo. Intreactúa para recuperar el glóbulo y obtener otra carga de Wingman tras un breve enfriamiento.';
habilidades[2].habilidad1_price = '300 créditos';
habilidades[2].habilidad2_name = 'Dizzy';
habilidades[2].habilidad2_description = 'equipa a Dizzy. Dispara para lanzar a Dizzy volando hacia delante. Dizzy carga y libera explosiones de plasma hacia los enemigos en su campo de visión. El plasma ciega a los enemigos alcanzados. Cuando Dizzy desaparece, vuelve a su estado de glóbulo en reposo. Interactúa para recuperar el glóbulo y obtener otra carga de Dizzy tras un breve enfriamiento';
habilidades[2].habilidad2_price = 'gratuita';
habilidades[2].habilidad3_name = 'Acechadora';
habilidades[2].habilidad3_description = 'te equipas con una Acechadora que puedes lanzar en línea recta. La Acechadora se enfocará en cualquier enemigo o rastro en su cono de visión frontal y lo perseguirá y ofuscará si lo alcanza';
habilidades[2].habilidad3_price = '250 créditos';
habilidades[2].habilidad4_name = 'Anochecer';
habilidades[2].habilidad4_description = 'Fade se equipa con el poder del Miedo. Esto le permite lanzar una onda de energía de las pesadillas que puede atravesar paredes. La energía crea un rastro hacia el oponente, además de ensordecerlo y debilitarlo';
habilidades[2].habilidad4_price = '7 puntos de definitiva';


end;




end.


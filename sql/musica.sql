-- Eliminar el esquema si ya existe
DROP SCHEMA IF EXISTS tienda CASCADE;

-- Crear el esquema
CREATE SCHEMA tienda;

CREATE TABLE tienda.artista (
	id_artista SERIAL PRIMARY KEY NOT NULL,
	nombre VARCHAR(200) NOT NULL,
	nacionalidad VARCHAR(100)
);

CREATE TABLE tienda.album (
	id_album SERIAL PRIMARY KEY NOT NULL,
	titulo VARCHAR(200) NOT NULL,
	id_artista INT references tienda.artista(id_artista),
	fecha_lanzamiento DATE,
	formato VARCHAR(10) CHECK (formato IN ('CD', 'Vinilo', 'Casette')) NOT NULL,
	canciones VARCHAR(200)[], 
	precio DECIMAL,
	stock INT
);

CREATE TABLE tienda.ventas (
	id_venta SERIAL PRIMARY KEY NOT NULL,
	id_album INT REFERENCES tienda.album(id_album),
	fecha_hora TIMESTAMP,
	unidades int
);

INSERT INTO tienda.artista (nombre, nacionalidad) VALUES
('Michael Jackson', 'Estados Unidos'),
('Queen', 'Reino Unido'),
('The Beatles', 'Reino Unido'),
('Pink Floyd', 'Reino Unido'),
('Nirvana', 'Estados Unidos'),
('Daft Punk', 'Francia'),
('The Weeknd', 'Canadá'),
('Taylor Swift', 'Estados Unidos'),
('Sabrina Carpenter', 'Estados Unidos'),
('Billie Eilish', 'Estados Unidos'),
('Kendrick Lamar', 'Estados Unidos'),
('Kanye West', 'Estados Unidos'),
('Eminem', 'Estados Unidos'),
('Drake', 'Canadá'),
('Bruno Mars', 'Estados Unidos'),
('Adele', 'Reino Unido'),
('Arctic Monkeys', 'Reino Unido'),
('Radiohead', 'Reino Unido'),
('Metallica', 'Estados Unidos'),
('AC/DC', 'Australia'),
('Gorillaz', 'Reino Unido'),
('David Bowie', 'Reino Unido'),
('Elvis Presley', 'Estados Unidos'),
('Madonna', 'Estados Unidos'),
('Lady Gaga', 'Estados Unidos'),
('Dua Lipa', 'Reino Unido'),
('Bad Bunny', 'Puerto Rico'),
('Rosalía', 'España'),
('Estopa', 'España'),
('Héroes del Silencio', 'España'),
('Sleep Token', 'Reino Unido');

INSERT INTO tienda.album
(titulo, id_artista, fecha_lanzamiento, formato, canciones, precio, stock)
VALUES

-- 1. Michael Jackson
(
    'Thriller', 1, '1982-11-30', 'Casette',
    ARRAY[
        'Wanna Be Startin'' Somethin''',
        'Baby Be Mine',
        'The Girl Is Mine',
        'Thriller',
        'Beat It',
        'Billie Jean',
        'Human Nature',
        'P.Y.T. (Pretty Young Thing)',
        'The Lady in My Life'
    ],
    29.99, 25
),

-- 2. Queen
(
    'A Night at the Opera', 2, '1975-11-21', 'Casette',
    ARRAY[
        'Death on Two Legs (Dedicated to...)',
        'Lazing on a Sunday Afternoon',
        'I''m in Love with My Car',
        'You''re My Best Friend',
        '''39',
        'Sweet Lady',
        'Seaside Rendezvous',
        'The Prophet''s Song',
        'Love of My Life',
        'Good Company',
        'Bohemian Rhapsody',
        'God Save the Queen'
    ],
    34.99, 15
),

-- 3. The Beatles
(
    'Abbey Road', 3, '1969-09-26', 'Vinilo',
    ARRAY[
        'Come Together',
        'Something',
        'Maxwell''s Silver Hammer',
        'Oh! Darling',
        'Octopus''s Garden',
        'I Want You (She''s So Heavy)',
        'Here Comes the Sun',
        'Because',
        'You Never Give Me Your Money',
        'Sun King',
        'Mean Mr. Mustard',
        'Polythene Pam',
        'She Came In Through the Bathroom Window',
        'Golden Slumbers',
        'Carry That Weight',
        'The End',
        'Her Majesty'
    ],
    32.99, 20
),

-- 4. Pink Floyd
(
    'The Dark Side of the Moon', 4, '1973-03-01', 'Vinilo',
    ARRAY[
        'Speak to Me',
        'Breathe',
        'On the Run',
        'Time',
        'The Great Gig in the Sky',
        'Money',
        'Us and Them',
        'Any Colour You Like',
        'Brain Damage',
        'Eclipse'
    ],
    39.99, 12
),

-- 5. Nirvana
(
    'Nevermind', 5, '1991-09-24', 'CD',
    ARRAY[
        'Smells Like Teen Spirit',
        'In Bloom',
        'Come as You Are',
        'Breed',
        'Lithium',
        'Polly',
        'Territorial Pissings',
        'Drain You',
        'Lounge Act',
        'Stay Away',
        'On a Plain',
        'Something in the Way'
    ],
    14.99, 30
),

-- 6. Daft Punk
(
    'Random Access Memories', 6, '2013-05-17', 'Vinilo',
    ARRAY[
        'Give Life Back to Music',
        'The Game of Love',
        'Giorgio by Moroder',
        'Within',
        'Instant Crush',
        'Lose Yourself to Dance',
        'Touch',
        'Get Lucky',
        'Beyond',
        'Motherboard',
        'Fragments of Time',
        'Doin'' It Right',
        'Contact'
    ],
    35.99, 18
),

-- 7. The Weeknd
(
    'After Hours', 7, '2020-03-20', 'CD',
    ARRAY[
        'Alone Again',
        'Too Late',
        'Hardest To Love',
        'Scared To Live',
        'Snowchild',
        'Escape From LA',
        'Heartless',
        'Faith',
        'Blinding Lights',
        'In Your Eyes',
        'Save Your Tears',
        'Repeat After Me (Interlude)',
        'After Hours',
        'Until I Bleed Out'
    ],
    19.99, 40
),

-- 8. Taylor Swift
(
    '1989', 8, '2014-10-27', 'CD',
    ARRAY[
        'Welcome to New York',
        'Blank Space',
        'Style',
        'Out of the Woods',
        'All You Had to Do Was Stay',
        'Shake It Off',
        'I Wish You Would',
        'Bad Blood',
        'Wildest Dreams',
        'How You Get the Girl'
		'This Love'
		'I Know Places'
		'Clean'
	],
	19.99, 60
),

-- 9. Sabrina Carpenter
(
    'Short n'' Sweet', 9, '2024-08-23', 'CD',
    ARRAY[
        'Taste',
        'Please Please Please',
        'Good Graces',
        'Sharpest Tool',
        'Coincidence',
        'Bed Chem',
        'Espresso',
        'Dumb & Poetic',
        'Slim Pickins',
        'Juno',
        'Lie to Girls',
        'Don''t Smile'
    ],
    19.99, 50
),

-- 10. Billie Eilish
(
    'HIT ME HARD AND SOFT', 10, '2024-05-17', 'Vinilo',
    ARRAY[
        'SKINNY',
        'LUNCH',
        'CHIHIRO',
        'BIRDS OF A FEATHER',
        'WILDFLOWER',
        'THE GREATEST',
        'L''AMOUR DE MA VIE',
        'THE DINER',
        'BITTERSUITE',
        'BLUE'
    ],
    29.99, 45
),

-- 11. Kendrick Lamar
(
    'DAMN.', 11, '2017-04-14', 'CD',
    ARRAY[
        'BLOOD.',
        'DNA.',
        'YAH.',
        'ELEMENT.',
        'FEEL.',
        'LOYALTY.',
        'PRIDE.',
        'HUMBLE.',
        'LUST.',
        'LOVE.',
        'XXX.',
        'FEAR.',
        'GOD.',
        'DUCKWORTH.'
    ],
    17.99, 35
),

-- 12. Kanye West
(
    'Graduation', 12, '2007-09-11', 'CD',
    ARRAY[
        'Good Morning',
        'Champion',
        'Stronger',
        'I Wonder',
        'Good Life',
        'Can''t Tell Me Nothing',
        'Barry Bonds',
        'Drunk and Hot Girls',
        'Flashing Lights',
        'Everything I Am',
        'The Glory',
        'Homecoming',
        'Big Brother'
    ],
    19.99, 40
),

-- 13. Eminem
(
    'The Eminem Show', 13, '2002-05-26', 'CD',
    ARRAY[
        'Curtains Up (Skit)',
        'White America',
        'Business',
        'Cleanin'' Out My Closet',
        'Square Dance',
        'The Kiss (Skit)',
        'Soldier',
        'Say Goodbye Hollywood',
        'Drips',
        'Without Me',
        'Paul Rosenberg (Skit)',
        'Sing for the Moment',
        'Superman',
        'Hailie''s Song',
        'Steve Berman (Skit)',
        'When the Music Stops',
        'Say What You Say',
        '''Till I Collapse',
        'My Dad''s Gone Crazy',
        'Curtains Close (Skit)'
    ],
    17.99, 45
),

-- 14. Drake
(
    'Views', 14, '2016-04-29', 'CD',
    ARRAY[
        'Keep the Family Close',
        '9',
        'U With Me?',
        'Feel No Ways',
        'Hype',
        'Weston Road Flows',
        'Redemption',
        'With You',
        'Faithful',
        'Still Here',
        'Controlla',
        'One Dance',
        'Grammys',
        'Childs Play',
        'Pop Style',
        'Too Good',
        'Summers Over Interlude',
        'Fire & Desire',
        'Views',
        'Hotline Bling'
    ],
    18.99, 35
),

-- 15. Bruno Mars
(
    '24K Magic', 15, '2016-11-18', 'Vinilo',
    ARRAY[
        '24K Magic',
        'Chunky',
        'Perm',
        'That''s What I Like',
        'Versace on the Floor',
        'Straight Up & Down',
        'Calling All My Lovelies',
        'Finesse',
        'Too Good to Say Goodbye'
	],
	8.99, 50
),

-- 16. Adele
(
    '21', 16, '2011-01-24', 'CD',
    ARRAY[
        'Rolling in the Deep',
        'Rumour Has It',
        'Turning Tables',
        'Don''t You Remember',
        'Set Fire to the Rain',
        'He Won''t Go',
        'Take It All',
        'I''ll Be Waiting',
        'One and Only',
        'Lovesong',
        'Someone Like You'
    ],
    16.99, 40
),

-- 17. Arctic Monkeys
(
    'AM', 17, '2013-09-09', 'Vinilo',
    ARRAY[
        'Do I Wanna Know?',
        'R U Mine?',
        'One for the Road',
        'Arabella',
        'I Want It All',
        'No. 1 Party Anthem',
        'Mad Sounds',
        'Fireside',
        'Why''d You Only Call Me When You''re High?',
        'Snap Out of It',
        'Knee Socks',
        'I Wanna Be Yours'
    ],
    29.99, 35
),

-- 18. Radiohead
(
    'OK Computer', 18, '1997-06-16', 'CD',
    ARRAY[
        'Airbag',
        'Paranoid Android',
        'Subterranean Homesick Alien',
        'Exit Music (For a Film)',
        'Let Down',
        'Karma Police',
        'Fitter Happier',
        'Electioneering',
        'Climbing Up the Walls',
        'No Surprises',
        'Lucky',
        'The Tourist'
    ],
    18.99, 30
),

-- 19. Metallica
(
    'Master of Puppets', 19, '1986-03-03', 'Casette',
    ARRAY[
        'Battery',
        'Master of Puppets',
        'The Thing That Should Not Be',
        'Welcome Home (Sanitarium)',
        'Disposable Heroes',
        'Leper Messiah',
        'Orion',
        'Damage, Inc.'
    ],
    32.99, 25
),

-- 20. AC/DC
(
    'Back in Black', 20, '1980-07-25', 'Casette',
    ARRAY[
        'Hells Bells',
        'Shoot to Thrill',
        'What Do You Do for Money Honey',
        'Givin the Dog a Bone',
        'Let Me Put My Love into You',
        'Back in Black',
        'You Shook Me All Night Long',
        'Have a Drink on Me',
        'Shake a Leg',
        'Rock and Roll Ain''t Noise Pollution'
    ],
    29.99, 30
),

-- 21. Gorillaz
(
    'Demon Days', 21, '2005-05-23', 'CD',
    ARRAY[
        'Intro',
        'Last Living Souls',
        'Kids with Guns',
        'O Green World',
        'Dirty Harry',
        'Feel Good Inc.',
        'El Mañana',
        'Every Planet We Reach Is Dead',
        'November Has Come',
        'All Alone',
        'White Light',
        'DARE',
        'Fire Coming Out of the Monkey''s Head',
        'Don''t Get Lost in Heaven',
        'Demon Days'
    ],
    19.99, 40
),

-- 22. David Bowie
(
    '"Heroes"', 22, '1977-10-14', 'Vinilo',
    ARRAY[
        'Beauty and the Beast',
        'Joe the Lion',
        'Heroes',
        'Sons of the Silent Age',
        'Blackout',
        'V-2 Schneider',
        'Sense of Doubt',
        'Moss Garden',
        'Neuköln',
        'The Secret Life of Arabia'
    ],
    27.99, 20
),

-- 23. Elvis Presley
(
    'Elvis Presley', 23, '1956-03-23', 'Vinilo',
    ARRAY[
        'Blue Suede Shoes',
        'I''m Counting on You',
        'I Got a Woman',
        'One-Sided Love Affair',
        'I Love You Because',
        'Just Because',
        'Tutti Frutti',
        'Tryin'' to Get to You',
        'I''m Gonna Sit Right Down and Cry (Over You)',
        'I''ll Never Let You Go',
        'Blue Moon',
        'Money Honey'
    ],
    27.99, 20
),

-- 24. Madonna
(
    'Like a Virgin', 24, '1984-11-12', 'Casette',
    ARRAY[
        'Material Girl',
        'Angel',
        'Like a Virgin',
        'Over and Over',
        'Love Don''t Live Here Anymore',
        'Dress You Up',
        'Shoo-Bee-Doo',
        'Pretender',
        'Stay'
    ],
    25.99, 25
),

-- 25. Lady Gaga
(
    'The Fame', 25, '2008-10-28', 'CD',
    ARRAY[
        'Just Dance',
        'LoveGame',
        'Paparazzi',
        'Poker Face',
        'Eh, Eh (Nothing Else I Can Say)',
        'Beautiful, Dirty, Rich',
        'The Fame',
        'Money Honey',
        'Starstruck',
        'Boys Boys Boys',
        'Paper Gangsta',
        'Brown Eyes',
        'I Like It Rough',
        'Summerboy'
    ],
    18.99, 40
),

-- 26. Dua Lipa
(
    'Future Nostalgia', 26, '2020-03-27', 'CD',
    ARRAY[
        'Future Nostalgia',
        'Don''t Start Now',
        'Cool',
        'Physical',
        'Levitating',
        'Pretty Please',
        'Hallucinate',
        'Love Again',
        'Break My Heart',
        'Good in Bed',
        'Boys Will Be Boys'
    ],
    19.99, 45
),

-- 27. Bad Bunny
(
    'Un Verano Sin Ti', 27, '2022-05-06', 'CD',
    ARRAY[
        'Moscow Mule',
        'Después de la Playa',
        'Me Porto Bonito',
        'Tití Me Preguntó',
        'Un Ratito',
        'Yo No Soy Celoso',
        'Tarot',
        'Neverita',
        'La Corriente',
        'Efecto',
        'Party',
        'Aguacero',
        'Enséñame a Bailar',
        'Ojitos Lindos',
        'Dos Mil 16',
        'El Apagón',
        'Otro Atardecer',
        'Un Coco',
        'Andrea',
        'Me Fui de Vacaciones',
        'Un Verano Sin Ti',
        'Agosto',
        'Callaita'
    ],
    22.99, 60
),

-- 28. Rosalía
(
    'MOTOMAMI', 28, '2022-03-18', 'Vinilo',
    ARRAY[
        'SAOKO',
        'CANDY',
        'LA FAMA',
        'BULERÍAS',
        'CHICKEN TERIYAKI',
        'HENTAI',
        'BIZCOCHITO',
        'G3 N15',
        'MOTOMAMI',
        'DIABLO',
        'DELIRIO DE GRANDEZA',
        'CUUUUuuuuuute',
        'COMO UN G',
        'Abcdefg',
        'LA COMBI VERSACE',
        'SAKURA'
    ],
    29.99, 35
),

-- 29. Estopa
(
    'Estopa', 29, '1999-10-18', 'Casette',
    ARRAY[
        'Tu calorro',
        'La raja de tu falda',
        'Me falta el aliento',
        'Tan sólo',
        'Poquito a poco',
        'Suma y sigue',
        'El del medio de los Chichos',
        'Como Camarón',
        'Exiliado en el lavabo',
        'Estopa',
        'Cacho a cacho',
        'Bossanova'
    ],
    15.99, 40
),

-- 30. Héroes del Silencio
(
    'Senderos de traición', 30, '1990-12-04', 'CD',
    ARRAY[
        'Entre dos tierras',
        'Maldito duende',
        'La carta',
        'Malas intenciones',
        'Sal',
        'Senda',
        'Hechizo',
        'Oración',
        'Despertar',
        'Decadencia',
        'Con nombre de guerra',
        'El cuadro II'
    ],
    17.99, 30
),

-- 31. Sleep Token
(
    'Take Me Back to Eden', 31, '2023-05-19', 'Vinilo',
    ARRAY[
        'Chokehold',
        'The Summoning',
        'Granite',
        'Aqua Regia',
        'Vore',
        'Ascensionism',
        'Are You Really Okay?',
        'The Apparition',
        'DYWTYLM',
        'Rain',
        'Take Me Back to Eden',
        'Euclid'
    ],
    39.99, 50
);

INSERT INTO tienda.ventas (id_album, fecha_hora, unidades)
VALUES
    (1, '2026-11-01 10:15:00', 2),
    (2, '2026-11-01 11:30:00', 1),
    (3, '2026-11-01 12:45:00', 3),
    (4, '2026-11-02 09:20:00', 1),
    (5, '2026-11-02 16:10:00', 2),
    (6, '2026-11-03 10:30:00', 1),
    (7, '2026-11-03 17:45:00', 3),
    (8, '2026-11-04 11:00:00', 2),
    (9, '2026-11-04 18:20:00', 4),
    (10, '2026-11-05 12:10:00', 1),
    (11, '2026-11-05 15:30:00', 2),
    (12, '2026-11-06 10:45:00', 1),
    (13, '2026-11-06 19:00:00', 3),
    (14, '2026-11-07 11:15:00', 2),
    (15, '2026-11-07 16:40:00', 1),
    (16, '2026-11-08 12:30:00', 2),
    (17, '2026-11-08 18:15:00', 3),
    (18, '2026-11-09 10:20:00', 1),
    (19, '2026-11-09 17:00:00', 2),
    (20, '2026-11-10 11:45:00', 1),
    (21, '2026-11-10 16:30:00', 3),
    (22, '2026-11-11 09:50:00', 1),
    (23, '2026-11-11 18:10:00', 2),
    (24, '2026-11-12 10:00:00', 1),
    (25, '2026-11-12 17:20:00', 3),
    (26, '2026-11-13 12:15:00', 2),
    (27, '2026-11-13 19:30:00', 4),
    (28, '2026-11-14 11:10:00', 2),
    (29, '2026-11-14 16:45:00', 3),
    (30, '2026-11-15 10:30:00', 1),
    (31, '2026-11-15 18:50:00', 5),
    (1, '2026-11-16 11:20:00', 1),
    (4, '2026-11-16 17:30:00', 2),
    (7, '2026-11-17 10:45:00', 2),
    (8, '2026-11-17 16:15:00', 4),
    (9, '2026-11-18 12:00:00', 3),
    (10, '2026-11-18 18:30:00', 2),
    (11, '2026-11-19 10:10:00', 1),
    (13, '2026-11-19 17:40:00', 2),
    (17, '2026-11-20 11:30:00', 1),
    (19, '2026-11-20 19:15:00', 3),
    (21, '2026-11-21 10:00:00', 2),
    (25, '2026-11-21 16:20:00', 1),
    (27, '2026-11-22 12:45:00', 3),
    (28, '2026-11-22 18:10:00', 2),
    (29, '2026-11-23 10:30:00', 1),
    (31, '2026-11-23 11:45:00', 4),
    (31, '2026-11-23 17:30:00', 3),
    (9, '2026-11-24 10:15:00', 2),
    (31, '2026-11-24 12:30:00', 5);

SELECT * FROM tienda.artista
ORDER BY id_artista;

SELECT * FROM tienda.album
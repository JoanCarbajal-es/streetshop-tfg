-- =====================================================
-- STREETSHOP - DATABASE DATA
-- =====================================================
-- Autor: Joan Alonso Carbajal Quispe
-- Proyecto: TFG - Desarrollo de Aplicaciones Web
-- =====================================================

-- =====================================================
-- CATEGORÍAS (9)
-- =====================================================

INSERT INTO categories (name, slug) VALUES
    ('Sneakers',   'sneakers'),
    ('Ropa',       'ropa'),
    ('Accesorios', 'accesorios'),
    ('Sudaderas',  'sudaderas'),
    ('Chaquetas',  'chaquetas'),
    ('Camisetas',  'camisetas'),
    ('Pantalones', 'pantalones'),
    ('Gorras',     'gorras'),
    ('Mochilas',   'mochilas');


-- =====================================================
-- SNEAKERS — category_id = 1 (IDs 1-12)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(1,  'Air Jordan 1 Retro High OG "Chicago"',  'Nike',        180.00, 1, 'Icónico diseño en rojo, blanco y negro. El sneaker más legendario de la historia del baloncesto, diseñado originalmente para Michael Jordan en 1985.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778167255/streetshop/products/s4qwqt1u4x8k8sjwqnkt.png'),
(2,  'Nike Dunk Low "Panda"',                  'Nike',        120.00, 1, 'Combinación clásica de blanco y negro. Uno de los colorways más buscados y versátiles para el día a día.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168339/streetshop/products/ca8jkcdsizro4h9dkp3i.png'),
(3,  'Yeezy Boost 350 V2 "Zebra"',             'Adidas',      220.00, 1, 'Diseño revolucionario de Kanye West con tecnología Boost. Patrón zebra distintivo en primeknit blanco y negro.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168545/streetshop/products/dvvohtk56byhgds2afrj.png'),
(4,  'New Balance 550 "White Green"',           'New Balance', 140.00, 1, 'Retro basketball shoe con estética vintage. Combinación limpia de blanco con detalles en verde.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168670/streetshop/products/rn6wkf4sbgpu6ngc9qhy.png'),
(5,  'Nike Air Force 1 Low "White"',            'Nike',        110.00, 1, 'El clásico definitivo. Diseño atemporal completamente blanco, básico imprescindible en cualquier colección.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168871/streetshop/products/hag8xomq01xkffokugzx.png'),
(6,  'Adidas Samba OG "Black White"',           'Adidas',      100.00, 1, 'Sneaker de fútbol sala convertido en icono streetwear. Diseño retro con las clásicas 3 rayas.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169108/streetshop/products/nkhcgdhgszurl7sh3lta.png'),
(7,  'Nike Air Max 90 "White"',                 'Nike',        130.00, 1, 'Icono de los 90s con la visible unidad Air. Diseño chunky con detalles en gris y rojo.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169186/streetshop/products/xsyucp8loqvbwqesh6tf.png'),
(8,  'Converse Chuck Taylor All Star "Black"',  'Converse',     65.00, 1, 'El sneaker más icónico de todos los tiempos. Diseño atemporal que nunca pasa de moda.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245996/streetshop/products/i8k9rthgiwpyvvrbba6m.png'),
(9,  'Vans Old Skool "Black White"',            'Vans',         75.00, 1, 'Clásico del skateboarding con la característica raya lateral. Combinación eterna de negro y blanco.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169741/streetshop/products/mkvkrwbpjcrphalzr3cn.png'),
(10, 'Air Jordan 4 Retro "Bred"',              'Nike',        200.00, 1, 'Diseño legendario de Tinker Hatfield. Colorway negro con detalles en rojo, uno de los AJ4 más emblemáticos.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169783/streetshop/products/ab6smoescfb7he3fjiu5.png'),
(11, 'Nike Cortez "White Red"',                 'Nike',         85.00, 1, 'Running shoe clásico de los 70s. Diseño retro con el swoosh rojo característico.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169876/streetshop/products/zr7vtpnry6oegkqsr9ce.png'),
(12, 'Puma Suede Classic "Black"',              'Puma',         70.00, 1, 'Icono del hip-hop y el breakdancing. Suede premium en negro con el característico logo dorado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169901/streetshop/products/w5r69wrvvjxilw7dj3ga.png');

-- =====================================================
-- SUDADERAS — category_id = 4 (IDs 13-14)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(13, 'Supreme Box Logo Hoodie Black', 'Supreme', 450.00, 4, 'La sudadera más icónica del streetwear. Box logo bordado en el pecho, pieza de colección altamente cotizada.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170261/streetshop/products/ycjt4zxnrcjlaezmcsqk.png'),
(14, 'Stüssy Basic Hoodie Grey',      'Stüssy',   85.00, 4, 'Sudadera esencial con el logo clásico de Stüssy. Ajuste cómodo y tejido de calidad premium.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170387/streetshop/products/lb5apyqooedrmipq1zdh.png');

-- =====================================================
-- CHAQUETAS — category_id = 5 (IDs 15-16)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(15, 'Carhartt WIP Detroit Jacket Brown', 'Carhartt',       150.00, 5, 'Chaqueta workwear icónica. Construcción duradera en lona resistente con forro interior acolchado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170410/streetshop/products/uw82e87uevtegjpatytz.png'),
(16, 'The North Face Nuptse 1996 Black',  'The North Face', 320.00, 5, 'Chaqueta puffer legendaria. Relleno de plumón 700 para máximo calor, diseño retro de los 90s.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170467/streetshop/products/eistscqacs5qgnkcuiig.png');
-- =====================================================
-- CAMISETAS — category_id = 6 (IDs 17-18)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(17, 'Palace Tri-Ferg T-Shirt White',      'Palace', 60.00, 6, 'Camiseta básica con el icónico logo triangular. Algodón 100%, corte regular fit.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170504/streetshop/products/ct6q9o3hexqoe5tfhz8p.png'),
(18, 'Adidas Firebird Track Jacket Black', 'Adidas', 75.00, 5, 'Chaqueta de chándal icónica con las 3 rayas. Diseño retro de los 70s actualizado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170562/streetshop/products/lfiacj57n9hgtd41espe.png');

-- =====================================================
-- ROPA VARIADA (IDs 19-30)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(19, 'Champion Reverse Weave Crewneck Grey', 'Champion',   65.00, 4, 'Sudadera clásica con construcción reverse weave que reduce el encogimiento. Logo bordado en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170787/streetshop/products/xuxwbulxmwu3kvhitcyc.png'),
(20, 'Essentials Hoodie Beige',              'Essentials', 100.00, 4, 'Sudadera oversized de la línea Fear of God Essentials. Logo reflectante en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170794/streetshop/products/d7sd4pec6qwcdx2jm9pn.png'),
(21, 'Nike Swoosh Cap Black',                'Nike',        25.00, 8, 'Gorra ajustable clásica con el swoosh bordado. Panel frontal estructurado, cierre de velcro.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170810/streetshop/products/exiikoj1tliudf6kqe8l.png'),
(22, 'Supreme Shoulder Bag Red',             'Supreme',    180.00, 3, 'Bolso crossbody con el box logo. Múltiples compartimentos, correa ajustable.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170817/streetshop/products/ysxfjb0dzffjyd1klze0.png'),
(23, 'Carhartt WIP Watch Hat Beige',         'Carhartt',    35.00, 3, 'Gorro beanie clásico con logo bordado. Acrílico elástico, ajuste universal.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170834/streetshop/products/acxjv04p58zonda7icmy.png'),
(24, 'The North Face Borealis Backpack Black','The North Face',110.00,9,'Mochila versátil de 28L. Compartimento acolchado para laptop, sistema FlexVent.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170980/streetshop/products/su8kcf5ho605npoc2q2s.png'),
(25, 'Ray-Ban Wayfarer Classic Black',       'Ray-Ban',    150.00, 3, 'Las gafas de sol más icónicas del mundo. Montura acetato negro, lentes G-15.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171051/streetshop/products/g3wyodmd7qqelhys7ivr.png'),
(26, 'Nike Elite Socks 3-Pack White',        'Nike',        18.00, 3, 'Calcetines de alto rendimiento. Soporte de arco, amortiguación reforzada.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171398/streetshop/products/gsuidmbnknxd9qs0ey4o.png'),
(27, 'Casio G-Shock DW-5600 Black',          'Casio',       90.00, 3, 'Reloj digital indestructible. Resistente a golpes, 200m water resistant.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171506/streetshop/products/xqhfw8ygarirwonp3tgw.png'),
(28, 'Herschel Little America Backpack Navy','Herschel',   120.00, 9, 'Mochila inspirada en montañismo. 25L de capacidad, forro a rayas característico.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171528/streetshop/products/dlwcmuu8uwuehriyttcv.png'),
(29, 'Nike Tech Fleece Joggers Black',       'Nike',        90.00, 7, 'Pantalón técnico con tejido ligero y cálido. Ajuste cónico, perfecto para cualquier ocasión.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171544/streetshop/products/o1dpbiuiqdd08mi71znp.png'),
(30, 'Levi''s 501 Original Jeans Blue',     'Levi''s',     95.00, 7, 'El jean original desde 1873. Corte straight, botones frontales, denim clásico.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171556/streetshop/products/u8cadbeo8flifghvemqu.png');

-- =====================================================
-- PRODUCTOS AÑADIDOS DESDE ADMIN (IDs 31-53)
-- =====================================================

INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(31, 'Supreme Shop Box Logo New Era 59Fifty Fitted Hat Black',              'Supreme',  120.00, 8, 'Gorra Supreme en colaboración con New Era. Silueta estructurada del modelo 59Fifty con el icónico Box Logo bordado en el frente.',                                                                              'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070492/streetshop/products/oezaqxutkm8xf1jol5d6.png'),
(32, 'Camiseta Stussy Basic en blanco',                                     'Stüssy',    90.00, 6, 'Camiseta básica con el icónico logo de la firma en contraste. Algodón premium y corte regular fit.',                                                                                                            'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070825/streetshop/products/tjc9x3gaxg8ve0qqvpeb.png'),
(33, 'Stussy Rollers Tee Black',                                            'Stüssy',    90.00, 6, 'Camiseta básica negra con el icónico gráfico de dados. Algodón suave, corte regular fit.',                                                                                                                      'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070951/streetshop/products/kmqatlvusvmvhdidxcpv.png'),
(34, 'Stussy Brushed Out Stock Skullcap Brown',                             'Stüssy',    95.00, 3, 'Gorro de punto marrón con el icónico logotipo cepillado en contraste. Mezcla de punto cepillado para un tacto suave y texturizado.',                                                                            'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071042/streetshop/products/f4wghtjx9hymwj6wlbj3.png'),
(35, 'Stussy King Varsity Jacket Navy',                                     'Stüssy',   610.00, 5, 'Chaqueta varsity azul marino con mangas de piel y el icónico logo de corona. Cuerpo de lana de alta calidad.',                                                                                                  'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071195/streetshop/products/etcxrxvx9ighlcb4vvfk.png'),
(36, 'Stussy Skate Stack Zip Pigment Dyed Hoodie Pink',                     'Stüssy',   360.00, 4, 'Sudadera de cremallera rosa con el icónico gráfico Skate Stack en la espalda. Algodón pigment-dyed y corte regular fit.',                                                                                       'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071279/streetshop/products/udohz4qw88gnndbyx874.png'),
(37, 'Stussy New Era 9Twenty Basic Strapback',                              'Stüssy',   105.00, 8, 'Gorra ajustable con el icónico logo de Stussy sobre patrón de camuflaje Real Tree Edge. Diseño 9Twenty de New Era con cierre strapback.',                                                                       'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071509/streetshop/products/i7teathunpzh6arsvwfx.png'),
(38, 'Stussy x Mountain Hardwear UL 20 Backpack Black',                    'Stüssy',   270.00, 9, 'Mochila técnica ultraligera con detalles en contraste. Colaboración exclusiva, diseño funcional de alta resistencia y capacidad de 20L.',                                                                        'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071705/streetshop/products/oapayeee3ts4ug06v2xy.png'),
(39, 'Adidas CTT Chinese Track Top 3.1 Gender Neutral Jacket',             'Adidas',   160.00, 4, 'Chaqueta deportiva de edición especial con cierre de nudos tradicionales y las icónicas tres bandas. Tejido de alta calidad con acabado texturizado y corte de género neutro.',                                  'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071823/streetshop/products/v77uydynz4qpfwapxz3p.png'),
(40, 'Supreme MM6 Maison Margiela Box Logo Zip Up Hooded Sweatshirt Navy', 'Supreme',  599.00, 4, 'Sudadera con capucha y cremallera con el icónico Box Logo Supreme y detalles de salpicaduras de pintura. Colaboración exclusiva con acabado envejecido.',                                                        'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245005/streetshop/products/nudj3z0gviyokeslufzh.png'),
(41, 'Supreme Logo Backpack (SS25) Black',                                  'Supreme',  220.00, 9, 'Mochila técnica negra con logotipos bordados y sistema de cordones elásticos. Tejido Cordura de alta resistencia, múltiples compartimentos y diseño ergonómico.',                                               'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072032/streetshop/products/wavzxbc8bitg76uxikhp.png'),
(42, 'Supreme Hanes Spider-Man Tagless Tees (2 Pack) Red',                 'Supreme',   47.00, 6, 'Pack de dos camisetas rojas con gráfico de telaraña de Spider-Man. Algodón suave, corte regular fit.',                                                                                                           'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072165/streetshop/products/jdu5ohghqfrkikp0sjcz.png'),
(43, 'Supreme MM6 Maison Margiela Box Logo Tee White',                     'Supreme',  170.00, 6, 'Camiseta blanca con el icónico Box Logo en contraste. Colaboración exclusiva, algodón premium y corte regular fit.',                                                                                             'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072301/streetshop/products/rx2y9egsj8ldpofp0wsi.png'),
(44, 'Carhartt WIP Double Knee Pant Blue',                                  'Carhartt', 390.00, 7, 'Pantalón de trabajo azul. Denim de alta resistencia, diseño funcional de inspiración workwear y corte regular fit.',                                                                                            'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072495/streetshop/products/pvpmsk3appnisxjcexrx.png'),
(45, 'Carhartt WIP Hooded Coach Jacket Black/White',                       'Carhartt', 200.00, 5, 'Chaqueta coach negra con capucha y logotipo minimalista en el pecho. Diseño funcional con cierre de botones a presión y cordones ajustables.',                                                                   'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072608/streetshop/products/xvfslcs7rkjcqv1llilo.png'),
(46, 'Carhartt WIP x Sacai Duck Cap Sacai Green',                          'Carhartt', 390.00, 8, 'Gorra verde con el logotipo exclusivo de la colaboración en el frente. Lona de alta resistencia, cierre ajustable y diseño estructurado de seis paneles.',                                                       'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072711/streetshop/products/kbadnef9gnkt5u70zas7.png'),
(47, 'Carhartt WIP Rivet Tote Bag Stone Washed Black',                     'Carhartt',  80.00, 3, 'Bolso tote negro con acabado lavado y detalle de bolsillo frontal con remaches. Lona de algodón resistente, diseño funcional de gran capacidad y estilo urbano atemporal.',                                      'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072894/streetshop/products/sroor82pu3qwimjtahlp.png'),
(48, 'Palace x Nike Font Swoosh T-shirt Black',                            'Palace',   140.00, 6, 'Camiseta negra de manga corta con los logotipos de la colaboración bordados en la espalda. Diseño minimalista de corte relajado, confeccionada en algodón de alto gramaje.',                                     'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073124/streetshop/products/qoj0xhomutt4nacby31b.png'),
(49, 'Palace P90 Baggy Jean Smoked',                                       'Palace',   400.00, 7, 'Pantalón vaquero de corte holgado con gráfico integral de calaveras en efecto humo. Acabado Smoked, diseño de cinco bolsillos y estética urbana de gran impacto visual.',                                        'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073286/streetshop/products/gcvzq3u4kjgijsjxdb3q.png'),
(50, 'Supreme Ghostface Mesh Short Red',                                   'Supreme',  130.00, 7, 'Pantalón corto deportivo de malla roja con gráfico de la máscara de Ghostface. Diseño ligero y transpirable, cintura elástica y corte holgado de estilo urbano.',                                                'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073437/streetshop/products/jbjc9fwoccgnnpbbfese.png'),
(51, 'Supreme Inset Spellout Baggy Jean Black',                            'Supreme',  320.00, 7, 'Pantalón vaquero negro de corte holgado con el nombre de la marca integrado en paneles de contraste. Estilo baggy de inspiración noventera y tejido denim de alta resistencia.',                                 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073504/streetshop/products/qn8ncmyxjvtenv83btkl.png'),
(52, 'Supreme Satin Applique Sweatpant (SS26) Snow Camo',                  'Supreme',  250.00, 7, 'Pantalón de chándal con estampado de camuflaje de nieve y logotipo de satén aplicado en el lateral. Corte relajado con bajos y cintura elásticos, forro polar de algodón de alta densidad.',                     'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073576/streetshop/products/jvscaewrgkopvn3uwyp0.png'),
(53, 'Supreme Small Box Tee (SS26) Brown',                                 'Supreme',  160.00, 6, 'Camiseta marrón de manga corta con el icónico parche bordado del logotipo en miniatura. Colección SS26, algodón de alta calidad y corte clásico regular fit.',                                                   'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073670/streetshop/products/fi9sel3x3namwusokgvz.png');

-- Actualizar la secuencia del ID de productos
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));

-- =====================================================
-- TALLAS — SNEAKERS (IDs 1-12)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (1,'38',3),(1,'39',5),(1,'40',8),(1,'41',10),(1,'42',12),(1,'43',8),(1,'44',5),(1,'45',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (2,'38',4),(2,'39',6),(2,'40',10),(2,'41',15),(2,'42',15),(2,'43',10),(2,'44',6),(2,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (3,'38',2),(3,'39',3),(3,'40',5),(3,'41',7),(3,'42',8),(3,'43',6),(3,'44',4),(3,'45',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (4,'38',5),(4,'39',7),(4,'40',9),(4,'41',12),(4,'42',10),(4,'43',8),(4,'44',5),(4,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (5,'38',10),(5,'39',15),(5,'40',20),(5,'41',25),(5,'42',25),(5,'43',20),(5,'44',15),(5,'45',10);
INSERT INTO product_sizes (product_id, size, stock) VALUES (6,'38',6),(6,'39',8),(6,'40',12),(6,'41',15),(6,'42',12),(6,'43',10),(6,'44',6),(6,'45',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (7,'38',4),(7,'39',6),(7,'40',8),(7,'41',10),(7,'42',10),(7,'43',8),(7,'44',6),(7,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (8,'38',15),(8,'39',20),(8,'40',25),(8,'41',30),(8,'42',25),(8,'43',20),(8,'44',15),(8,'45',10);
INSERT INTO product_sizes (product_id, size, stock) VALUES (9,'38',12),(9,'39',15),(9,'40',18),(9,'41',20),(9,'42',18),(9,'43',15),(9,'44',12),(9,'45',8);
INSERT INTO product_sizes (product_id, size, stock) VALUES (10,'38',2),(10,'39',3),(10,'40',5),(10,'41',6),(10,'42',7),(10,'43',5),(10,'44',3),(10,'45',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (11,'38',8),(11,'39',10),(11,'40',12),(11,'41',15),(11,'42',12),(11,'43',10),(11,'44',8),(11,'45',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (12,'38',10),(12,'39',12),(12,'40',15),(12,'41',18),(12,'42',15),(12,'43',12),(12,'44',10),(12,'45',6);

-- =====================================================
-- TALLAS — SUDADERAS / CHAQUETAS / CAMISETAS / ROPA
-- (IDs 13-20) Tallas: XS, S, M, L, XL, XXL
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (13,'XS',2),(13,'S',3),(13,'M',5),(13,'L',6),(13,'XL',4),(13,'XXL',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (14,'XS',5),(14,'S',8),(14,'M',12),(14,'L',12),(14,'XL',8),(14,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (15,'XS',3),(15,'S',6),(15,'M',10),(15,'L',10),(15,'XL',6),(15,'XXL',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (16,'XS',4),(16,'S',7),(16,'M',10),(16,'L',12),(16,'XL',8),(16,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (17,'XS',6),(17,'S',10),(17,'M',15),(17,'L',15),(17,'XL',10),(17,'XXL',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (18,'XS',5),(18,'S',9),(18,'M',14),(18,'L',14),(18,'XL',9),(18,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (19,'XS',7),(19,'S',12),(19,'M',18),(19,'L',18),(19,'XL',12),(19,'XXL',7);
INSERT INTO product_sizes (product_id, size, stock) VALUES (20,'XS',4),(20,'S',7),(20,'M',10),(20,'L',12),(20,'XL',8),(20,'XXL',4);

-- =====================================================
-- TALLAS — ACCESORIOS / GORRAS / MOCHILAS (IDs 21-28)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (21,'ONE SIZE',50);
INSERT INTO product_sizes (product_id, size, stock) VALUES (22,'ONE SIZE',15);
INSERT INTO product_sizes (product_id, size, stock) VALUES (23,'ONE SIZE',40);
INSERT INTO product_sizes (product_id, size, stock) VALUES (24,'ONE SIZE',25);
INSERT INTO product_sizes (product_id, size, stock) VALUES (25,'ONE SIZE',30);
INSERT INTO product_sizes (product_id, size, stock) VALUES (26,'S (38-40)',20),(26,'M (41-43)',25),(26,'L (44-46)',20);
INSERT INTO product_sizes (product_id, size, stock) VALUES (27,'ONE SIZE',35);
INSERT INTO product_sizes (product_id, size, stock) VALUES (28,'ONE SIZE',20);

-- =====================================================
-- TALLAS — PANTALONES (IDs 29-30)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (29,'XS',4),(29,'S',8),(29,'M',12),(29,'L',12),(29,'XL',8),(29,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (30,'28',5),(30,'30',10),(30,'32',15),(30,'34',15),(30,'36',10),(30,'38',5);

-- =====================================================
-- TALLAS — PRODUCTOS ADMIN (IDs 31-53)
-- =====================================================

-- Gorras (ONE SIZE)
INSERT INTO product_sizes (product_id, size, stock) VALUES (31,'ONE SIZE',20);
INSERT INTO product_sizes (product_id, size, stock) VALUES (37,'ONE SIZE',18);
INSERT INTO product_sizes (product_id, size, stock) VALUES (46,'ONE SIZE',10);

-- Camisetas (XS-XXL)
INSERT INTO product_sizes (product_id, size, stock) VALUES (32,'XS',6),(32,'S',10),(32,'M',16),(32,'L',16),(32,'XL',10),(32,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (33,'XS',6),(33,'S',10),(33,'M',16),(33,'L',16),(33,'XL',10),(33,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (42,'XS',8),(42,'S',12),(42,'M',18),(42,'L',18),(42,'XL',12),(42,'XXL',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (43,'XS',4),(43,'S',7),(43,'M',10),(43,'L',10),(43,'XL',7),(43,'XXL',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (48,'XS',5),(48,'S',9),(48,'M',14),(48,'L',14),(48,'XL',9),(48,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (53,'XS',5),(53,'S',8),(53,'M',12),(53,'L',12),(53,'XL',8),(53,'XXL',4);

-- Accesorios (ONE SIZE)
INSERT INTO product_sizes (product_id, size, stock) VALUES (34,'ONE SIZE',30);
INSERT INTO product_sizes (product_id, size, stock) VALUES (47,'ONE SIZE',25);

-- Chaquetas / Sudaderas (XS-XXL)
INSERT INTO product_sizes (product_id, size, stock) VALUES (35,'XS',3),(35,'S',5),(35,'M',8),(35,'L',8),(35,'XL',5),(35,'XXL',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (36,'XS',4),(36,'S',7),(36,'M',10),(36,'L',10),(36,'XL',7),(36,'XXL',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (39,'XS',5),(39,'S',9),(39,'M',14),(39,'L',14),(39,'XL',9),(39,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (40,'XS',3),(40,'S',5),(40,'M',8),(40,'L',8),(40,'XL',5),(40,'XXL',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (45,'XS',4),(45,'S',7),(45,'M',10),(45,'L',10),(45,'XL',7),(45,'XXL',3);

-- Mochilas (ONE SIZE)
INSERT INTO product_sizes (product_id, size, stock) VALUES (38,'ONE SIZE',15);
INSERT INTO product_sizes (product_id, size, stock) VALUES (41,'ONE SIZE',20);

-- Pantalones (cintura 28-38)
INSERT INTO product_sizes (product_id, size, stock) VALUES (44,'28',4),(44,'30',8),(44,'32',12),(44,'34',12),(44,'36',8),(44,'38',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (49,'28',5),(49,'30',9),(49,'32',14),(49,'34',14),(49,'36',9),(49,'38',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (51,'28',4),(51,'30',7),(51,'32',10),(51,'34',10),(51,'36',7),(51,'38',4);

-- Shorts (XS-XXL)
INSERT INTO product_sizes (product_id, size, stock) VALUES (50,'XS',6),(50,'S',10),(50,'M',15),(50,'L',15),(50,'XL',10),(50,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (52,'XS',5),(52,'S',9),(52,'M',14),(52,'L',14),(52,'XL',9),(52,'XXL',4);

-- =====================================================
-- NUEVOS PRODUCTOS (IDs 54-83)
-- =====================================================

-- Sneakers adicionales (IDs 54-65)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(54, 'New Balance 990v5 "Grey"',               'New Balance', 185.00, 1, 'El rey del dadcore. Fabricado en USA, upper de gamuza y malla, amortiguación ENCAP premium.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172445/streetshop/products/rjhehwv87lj7shpat0te.png'),
(55, 'Adidas Campus 00s "Green"',              'Adidas',       90.00, 1, 'Versión actualizada del clásico Campus. Perfil bajo con upper de gamuza y suela con goma vulcanizada.','https://res.cloudinary.com/dpsfipegh/image/upload/v1778172772/streetshop/products/p5e5251j3orublzrwxzs.png'),
(56, 'Nike Air Max 95 "Neon"',                 'Nike',        160.00, 1, 'Diseño futurista inspirado en la anatomía humana. Colorway neon amarillo icónico de los 90s.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172943/streetshop/products/xl11sy8uurev8bsahd3p.png'),
(57, 'Jordan 3 Retro "White Cement"',          'Nike',        210.00, 1, 'Diseño de Tinker Hatfield con el elefante print icónico. La primera Jordan con visible Air y el Jumpman.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173087/streetshop/products/ofsxqlzq157pevonnfup.png'),
(58, 'Reebok Classic Leather "White"',         'Reebok',       80.00, 1, 'Clásico de los 80s en cuero blanco premium. Diseño limpio y minimalista que nunca pasa de moda.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245697/streetshop/products/tdkwlb50fzm74fm3twdr.png'),
(59, 'Salomon XT-6 "Black"',                   'Salomon',     170.00, 1, 'Trail runner convertido en must-have del streetwear. Upper técnico Sensifit con suela Contagrip.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173278/streetshop/products/xfacv9q0v0sodc9drkql.png'),
(60, 'Nike Blazer Mid 77 "Summit White"',      'Nike',        105.00, 1, 'Sneaker de baloncesto vintage con el swoosh clásico. Upper de cuero blanco con talón en ante.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173432/streetshop/products/xhalteyy8r0xecrwbvyt.png'),
(61, 'Adidas Gazelle Collegiate "Burgundy"',   'Adidas',       95.00, 1, 'Zapatillas clásicas de perfil bajo en ante color burdeos con las tres franjas icónicas y el talón en contraste blanco.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174040/streetshop/products/iul43mhrmmz5jlatukir.png'),
(62, 'New Balance 2002R "Protection Pack"',    'New Balance', 150.00, 1, 'Silhouette futurista con ABZORB y N-ergy. Colorways exclusivos de la Protection Pack.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174175/streetshop/products/oczgywqiy49jbbd0zbmj.png'),
(63, 'Asics Gel-Kayano 14 "Cream"',            'Asics',       130.00, 1, 'Running retro con el característico sistema GEL. Colorway cream con detalles en azul y naranja.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174269/streetshop/products/dzrzbibgti5ev5jvt5qw.png'),
(64, 'Jordan 1 Low "Black Toe"',               'Nike',        110.00, 1, 'Versión low del AJ1 más icónico. Combinación clásica de negro, blanco y rojo.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174348/streetshop/products/etoc5p0mafhgry8dfrbs.png'),
(65, 'On Running Cloudmonster "All White"',    'On Running',  175.00, 1, 'Máxima amortiguación con la tecnología CloudTec. Suela Helion para respuesta explosiva.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174467/streetshop/products/z1zafdg3xosaizczwwku.png');

-- Camisetas adicionales (IDs 66-71)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(66, 'Stüssy Stock Logo Tee Black',            'Stüssy',    45.00, 6, 'Camiseta esencial con el stock logo de Stüssy en el pecho. Jersey de algodón 100% heavyweight.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778175688/streetshop/products/wzstfmp5ier0uo6nz11u.png'),
(67, 'Carhartt WIP Script Tee White',          'Carhartt',  40.00, 6, 'Camiseta de manga corta con el logo script de Carhartt. Algodón orgánico de alta calidad.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778175865/streetshop/products/vz3yne3vcehtohxvblcf.jpg'),
(68, 'Anti Social Social Club Logo Tee Pink',  'ASSC',      55.00, 6, 'Camiseta oversized con el logo de ASSC en rosa. Algodón heavyweight, corte relaxed.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245240/streetshop/products/hwb8rolarjpja7x53p6b.png'),
(69, 'Essentials Small Logo Tee Cream',        'Essentials',50.00, 6, 'Camiseta oversized de Fear of God Essentials. Logo pequeño en el pecho, algodón pesado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176133/streetshop/products/uapo1odoeads3boipd1e.png'),
(70, 'Human Made Duck Tee White',              'Human Made',80.00, 6, 'Camiseta con el pato icónico de Nigo. Algodón japonés premium, bordado en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176187/streetshop/products/qlnby4o7g58cwuixmrna.jpg'),
(71, 'Represent Owners Club Tee Black',        'Represent', 65.00, 6, 'Camiseta heavyweight con el logo Owners Club. Algodón 240gsm, fit oversized.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176254/streetshop/products/l6ljvlwpa20xgmtc0acw.png');

-- Sudaderas adicionales (IDs 72-75)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(72, 'Carhartt WIP Chase Hoodie Grey', 'Carhartt', 95.00,  4, 'Sudadera con capucha y el logo Chase en tono dorado. Felpa 100% algodón, interior afelpado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176566/streetshop/products/cce4b8ocmruslkwznf1n.png'),
(73, 'Nike Club Fleece Hoodie Navy',   'Nike',      70.00,  4, 'Sudadera esencial del guardarropa. Fleece suave con el logo Futura en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176746/streetshop/products/qq7knjqamtpxsco07igv.png'),
(74, 'Adidas Trefoil Hoodie Black',    'Adidas',    75.00,  4, 'Sudadera con el trébol icónico de Adidas Originals. Fleece suave, ajuste regular.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176795/streetshop/products/hr46xferhwj3cb4iczxr.png'),
(75, 'Kith Williams Hoodie Olive',     'Kith',     195.00,  4, 'Sudadera premium de Kith en color oliva. French terry heavyweight, logo bordado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177069/streetshop/products/iapaejkqzwvb8sydnlff.png');

-- Chaquetas adicionales (IDs 76-78)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(76, 'Adidas SST Track Jacket Blue',    'Adidas',  85.00, 5, 'Chaqueta de chándal SST con las 3 rayas. Tejido tafetán brillante.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177491/streetshop/products/lzg056cfziwv2qsbhnjm.png'),
(77, 'Nike Windrunner Jacket Black',    'Nike',   110.00, 5, 'Cortavientos icónico con chevron en el pecho. Tejido ligero y resistente al viento.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177601/streetshop/products/qc08fwkwbmysrsz9otnb.png'),
(78, 'Dickies Eisenhower Jacket Khaki', 'Dickies', 75.00, 5, 'Chaqueta workwear clásica en khaki. Canvas resistente con forro interior, bolsillos múltiples.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177945/streetshop/products/x34wvhubb25kp5xk70xi.png');

-- Pantalones adicionales (IDs 79-80)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(79, 'Carhartt WIP Sid Pant Black', 'Carhartt', 90.00, 7, 'Pantalón chino slim fit de Carhartt WIP. Sarga de algodón, ajuste cómodo todo el día.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178032/streetshop/products/prhbxjijlg9wufxtx3us.png'),
(80, 'Dickies 874 Work Pant Olive',  'Dickies',  50.00, 7, 'El pantalón workwear más icónico. Twill de poliéster-lana, corte straight leg.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178074/streetshop/products/io2l7rl3k02qpu5bemzg.png');

-- Gorras adicionales (IDs 81-82)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(81, 'New Era 9FIFTY Yankees Black',  'New Era',  40.00, 8, 'Gorra snapback oficial de los New York Yankees. Bordado frontal, visera plana.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178565/streetshop/products/tptlzwt70ykfdgwjr1ci.png'),
(82, 'Label Script Coach Cap Brown', 'Carhartt', 60.00, 8, 'Gorra de 6 paneles con logo script bordado. Cierre de hebilla trasera, visera plana.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178652/streetshop/products/obrfjldtelzjzyloukkk.png');

-- Mochila adicional (ID 83)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(83, 'Carhartt WIP Kickflip Backpack Black', 'Carhartt', 80.00, 9, 'Mochila esencial de 20L. Compartimento acolchado para portátil, logo frontal bordado.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178710/streetshop/products/k3gijvpee5ge5wyr6ucc.png');

-- Actualizar secuencia
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));

-- =====================================================
-- TALLAS — NUEVOS SNEAKERS (IDs 54-65)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (54,'38',8),(54,'39',12),(54,'40',15),(54,'41',18),(54,'42',15),(54,'43',12),(54,'44',8),(54,'45',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (55,'38',10),(55,'39',14),(55,'40',18),(55,'41',20),(55,'42',18),(55,'43',14),(55,'44',10),(55,'45',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (56,'38',6),(56,'39',10),(56,'40',14),(56,'41',16),(56,'42',14),(56,'43',10),(56,'44',6),(56,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (57,'38',4),(57,'39',6),(57,'40',9),(57,'41',12),(57,'42',10),(57,'43',7),(57,'44',4),(57,'45',2);
INSERT INTO product_sizes (product_id, size, stock) VALUES (58,'38',12),(58,'39',16),(58,'40',20),(58,'41',22),(58,'42',20),(58,'43',16),(58,'44',12),(58,'45',8);
INSERT INTO product_sizes (product_id, size, stock) VALUES (59,'38',5),(59,'39',8),(59,'40',12),(59,'41',14),(59,'42',12),(59,'43',8),(59,'44',5),(59,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (60,'38',10),(60,'39',14),(60,'40',18),(60,'41',20),(60,'42',18),(60,'43',14),(60,'44',10),(60,'45',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (61,'38',8),(61,'39',12),(61,'40',16),(61,'41',18),(61,'42',16),(61,'43',12),(61,'44',8),(61,'45',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (62,'38',7),(62,'39',10),(62,'40',14),(62,'41',16),(62,'42',14),(62,'43',10),(62,'44',7),(62,'45',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (63,'38',6),(63,'39',10),(63,'40',14),(63,'41',16),(63,'42',14),(63,'43',10),(63,'44',6),(63,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (64,'38',8),(64,'39',12),(64,'40',16),(64,'41',20),(64,'42',16),(64,'43',12),(64,'44',8),(64,'45',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (65,'38',5),(65,'39',8),(65,'40',11),(65,'41',14),(65,'42',11),(65,'43',8),(65,'44',5),(65,'45',2);

-- =====================================================
-- TALLAS — NUEVAS CAMISETAS (IDs 66-71)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (66,'XS',8),(66,'S',12),(66,'M',18),(66,'L',18),(66,'XL',12),(66,'XXL',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (67,'XS',6),(67,'S',10),(67,'M',16),(67,'L',16),(67,'XL',10),(67,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (68,'XS',5),(68,'S',9),(68,'M',14),(68,'L',14),(68,'XL',9),(68,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (69,'XS',7),(69,'S',11),(69,'M',16),(69,'L',16),(69,'XL',11),(69,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (70,'XS',4),(70,'S',7),(70,'M',10),(70,'L',10),(70,'XL',7),(70,'XXL',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (71,'XS',6),(71,'S',10),(71,'M',15),(71,'L',15),(71,'XL',10),(71,'XXL',5);

-- =====================================================
-- TALLAS — NUEVAS SUDADERAS (IDs 72-75)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (72,'XS',5),(72,'S',9),(72,'M',14),(72,'L',14),(72,'XL',9),(72,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (73,'XS',8),(73,'S',14),(73,'M',20),(73,'L',20),(73,'XL',14),(73,'XXL',7);
INSERT INTO product_sizes (product_id, size, stock) VALUES (74,'XS',7),(74,'S',12),(74,'M',18),(74,'L',18),(74,'XL',12),(74,'XXL',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (75,'XS',3),(75,'S',5),(75,'M',8),(75,'L',8),(75,'XL',5),(75,'XXL',2);

-- =====================================================
-- TALLAS — NUEVAS CHAQUETAS (IDs 76-78)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (76,'XS',5),(76,'S',9),(76,'M',14),(76,'L',14),(76,'XL',9),(76,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (77,'XS',6),(77,'S',10),(77,'M',15),(77,'L',15),(77,'XL',10),(77,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (78,'XS',8),(78,'S',14),(78,'M',20),(78,'L',20),(78,'XL',14),(78,'XXL',7);

-- =====================================================
-- TALLAS — NUEVOS PANTALONES (IDs 79-80)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (79,'28',5),(79,'30',10),(79,'32',15),(79,'34',15),(79,'36',10),(79,'38',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (80,'28',8),(80,'30',14),(80,'32',20),(80,'34',20),(80,'36',14),(80,'38',8);

-- =====================================================
-- TALLAS — NUEVAS GORRAS (IDs 81-82)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (81,'ONE SIZE',45);
INSERT INTO product_sizes (product_id, size, stock) VALUES (82,'ONE SIZE',35);

-- =====================================================
-- TALLAS — NUEVA MOCHILA (ID 83)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (83,'ONE SIZE',25);

-- =====================================================
-- ÚLTIMOS PRODUCTOS PARA LLEGAR A 100 (IDs 84-100)
-- =====================================================

-- Sneakers (IDs 84-88)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(84,  'Nike Air Max 1 "Anniversary Red"',         'Nike',        130.00, 1, 'El Air Max original de Tinker Hatfield. Primera zapatilla con ventana Air visible, colorway aniversario en rojo y blanco.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778179728/streetshop/products/x2xl5zkck8jb6pdia06c.png'),
(85,  'Adidas Forum Low "Cloud White Magic Earth"', 'Adidas',      170.00, 1, 'Silhouette de baloncesto de los 80s con la tira de velcro característica. Upper de cuero limpio en blanco con detalles de naranja.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180285/streetshop/products/hmt8zbwaohhwynn1umuo.png'),
(86,  'New Balance 574 "Grey"',                    'New Balance',  85.00, 1, 'El modelo más vendido de New Balance. Comodidad todo el día con amortiguación ENCAP y upper de gamuza.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180359/streetshop/products/v1zzq3hu1rnd2ckj4whe.png'),
(87,  'Nike SB Dunk Low "Safari"',                 'Nike',        120.00, 1, 'Icónico colorway Safari con estampado animal. Upper de cuero con overlay en ante marrón sobre base blanca.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180449/streetshop/products/gkbk7qcjwnlvvhjn0fx1.png'),
(88,  'Adidas Stan Smith "White Green"',            'Adidas',       90.00, 1, 'El tenis más vendido de la historia. Diseño minimalista en cuero blanco con detalles en verde característicos.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180558/streetshop/products/syex1eewbalqpc22ngvv.png');

-- Camisetas (IDs 89-92)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(89,  'Carhartt WIP Pocket T-Shirt White',         'Carhartt',     35.00, 6, 'Camiseta básica con bolsillo en el pecho y logo bordado. Algodón 100%, corte regular, básico imprescindible.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180919/streetshop/products/lqtu8id1sfywtdbgtztb.png'),
(90,  'New Balance Athletics Tee Black',            'New Balance',  40.00, 6, 'Camiseta con el logo athletics de New Balance. Algodón suave, corte regular fit, perfecta para el día a día.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181011/streetshop/products/kot3r5qrhgfo1b1bnbzz.png'),
(91,  'Vans Off The Wall Tee White',                'Vans',         30.00, 6, 'Camiseta clásica con el icónico logo Off The Wall. Algodón 100%, corte regular y estampado en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181100/streetshop/products/z1i19egenejs9dpd3b3j.png'),
(92,  'Dickies Mapleton Tee Stonewashed',           'Dickies',      32.00, 6, 'Camiseta con acabado lavado piedra para textura envejecida. Logo Dickies en el pecho, algodón heavyweight.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181400/streetshop/products/duwlue7pvqhhd9hwnxvi.jpg');

-- Sudaderas (IDs 93-95)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(93,  'Vans Core Basic Hoodie Black',              'Vans',         65.00, 4, 'Sudadera esencial con el logo Vans bordado. Fleece suave, capucha con cordón y bolsillo canguro.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181807/streetshop/products/gqf6nwyky5djtso7wfmv.png'),
(94,  'New Balance Essentials Hoodie Grey',        'New Balance',  70.00, 4, 'Sudadera con el icónico logo NB en el pecho. Fleece de algodón, ajuste regular, ideal para cualquier ocasión.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181918/streetshop/products/kkw9et77j7ccjurbesix.png'),
(95,  'Dickies Oklahoma Hoodie Brown Duck',        'Dickies',      80.00, 4, 'Sudadera workwear en lona resistente color marrón. Construcción duradera con forro interior suave.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778182324/streetshop/products/lbqxo4v6xwdk1pefiuih.jpg');

-- Accesorios (IDs 96-98)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(96,  'Carhartt WIP Military Cap Black',           'Carhartt',     28.00, 8, 'Gorra military de 6 paneles con logo bordado. Perfil bajo, visera curva y cierre snapback.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778182930/streetshop/products/gbc6cpmtuhxj5ll4kqgn.png'),
(97,  'Vans Skate Backpack Black',                 'Vans',         55.00, 9, 'Mochila de 25L con compartimento acolchado para portátil. Tejido resistente, logo Vans en el frente.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183004/streetshop/products/fy0rw28gfs6zymi9vuoc.png'),
(98,  'New Balance Flat Brim Cap Black',           'New Balance',  35.00, 8, 'Gorra snapback con visera plana y logo NB bordado. Tejido técnico, 6 paneles estructurados.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183157/streetshop/products/pz1krubzoutcytqgtk6o.png');

-- Pantalones (IDs 99-100)
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(99,  'Carhartt WIP Marshall Jogger Black',        'Carhartt',     85.00, 7, 'Jogger slim fit con puños elásticos y logo bordado. Algodón suave, perfecto para uso casual y deportivo.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183595/streetshop/products/wdcvm68thxnu3yyhrfio.png'),
(100, 'Dickies 873 Slim Straight Work Pant Black', 'Dickies',      55.00, 7, 'Pantalón slim straight de Dickies en negro. Twill de poliéster-algodón, corte más ajustado que el 874 clásico.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183671/streetshop/products/yjktoesxaljpwua3wcna.png');

-- Actualizar secuencia
SELECT setval('products_id_seq', 100);

-- =====================================================
-- NUEVOS PRODUCTOS (101 - 108)
-- =====================================================
INSERT INTO products (id, name, brand, price, category_id, description, image_url) VALUES
(101, 'Dior B30 Triple Black', 'Dior', 890.00, 1, 'Zapatilla técnica de lujo con malla y paneles reflectantes. Suela esculpida de goma microcelular para máximo confort y estilo urbano.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248172/streetshop/products/geprwyc21sox0yp42ywb.png'),
(102, 'Casio G-SHOCK GMA-P2100-7A', 'Casio', 110.00, 3, 'Reloj analógico-digital en color blanco mate. Resistente a impactos, sumergible hasta 200m y diseño compacto de la serie 2100.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248348/streetshop/products/vkgg78riyytqfl9fvmlq.png'),
(103, 'Tory Burch Kira Turnlock Shoulder Bag Bianco', 'Tory Burch', 525.00, 3, 'Bolso de hombro en piel acolchada color blanco. Incluye el emblemático cierre giratorio Double T y cadena ajustable dorada.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248375/streetshop/products/je8pasni10bjdsxsoxbf.png'),
(104, 'Denim Tears Cotton Wreath Sweatshirt Grey', 'Denim Tears', 280.00, 4, 'Sudadera de algodón premium en color gris melange con el icónico gráfico de coronas de flores de algodón en contraste.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248549/streetshop/products/f6x1ee57wzd6vgc5oaiu.png'),
(105, 'Palace x Nike Track Jacket White', 'Palace', 195.00, 5, 'Chaqueta de chándal colaborativa de nylon técnico. Diseño minimalista con logotipos bordados de ambas marcas en el pecho.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248459/streetshop/products/m7gxknz5sw1tm79nivhb.png'),
(106, 'Camiseta HELLSTAR Classic', 'Hellstar', 145.00, 6, 'Camiseta de corte oversize con lavado vintage y gráficos serigrafiados de alta calidad inspirados en la estética punk moderna.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248679/streetshop/products/rlgmr1rndb515hojxm1b.png'),
(107, 'Godspeed Courtside VVS Shorts Stealth', 'Godspeed', 95.00, 7, 'Pantalones cortos de malla transpirable con logotipos bordados tipo joyería. Ideales para el día a día o uso deportivo.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248741/streetshop/products/obgx5a0uljkldjna92s7.png'),
(108, 'Kith x 47 Los Angeles Dodgers Cap Royal', 'Kith', 75.00, 8, 'Gorra oficial MLB en colaboración con Kith. Acabado lavado tipo vintage, color azul real y bordado frontal en relieve.', 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248839/streetshop/products/fudi9cazc4k6xovj4czo.png');

-- Actualizo secuencia
SELECT setval('products_id_seq', 108);

-- =====================================================
-- TALLAS — SNEAKERS (IDs 84-88)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (84,'38',8),(84,'39',12),(84,'40',16),(84,'41',18),(84,'42',16),(84,'43',12),(84,'44',8),(84,'45',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (85,'38',10),(85,'39',14),(85,'40',18),(85,'41',20),(85,'42',18),(85,'43',14),(85,'44',10),(85,'45',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (86,'38',12),(86,'39',16),(86,'40',20),(86,'41',22),(86,'42',20),(86,'43',16),(86,'44',12),(86,'45',8);
INSERT INTO product_sizes (product_id, size, stock) VALUES (87,'38',5),(87,'39',8),(87,'40',12),(87,'41',14),(87,'42',12),(87,'43',8),(87,'44',5),(87,'45',3);
INSERT INTO product_sizes (product_id, size, stock) VALUES (88,'38',10),(88,'39',14),(88,'40',18),(88,'41',20),(88,'42',18),(88,'43',14),(88,'44',10),(88,'45',6);

-- =====================================================
-- TALLAS — CAMISETAS (IDs 89-92)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (89,'XS',8),(89,'S',14),(89,'M',20),(89,'L',20),(89,'XL',14),(89,'XXL',8);
INSERT INTO product_sizes (product_id, size, stock) VALUES (90,'XS',6),(90,'S',10),(90,'M',16),(90,'L',16),(90,'XL',10),(90,'XXL',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (91,'XS',8),(91,'S',14),(91,'M',20),(91,'L',20),(91,'XL',14),(91,'XXL',8);
INSERT INTO product_sizes (product_id, size, stock) VALUES (92,'XS',6),(92,'S',10),(92,'M',15),(92,'L',15),(92,'XL',10),(92,'XXL',5);

-- =====================================================
-- TALLAS — SUDADERAS (IDs 93-95)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (93,'XS',5),(93,'S',9),(93,'M',14),(93,'L',14),(93,'XL',9),(93,'XXL',4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (94,'XS',7),(94,'S',12),(94,'M',18),(94,'L',18),(94,'XL',12),(94,'XXL',6);
INSERT INTO product_sizes (product_id, size, stock) VALUES (95,'XS',5),(95,'S',8),(95,'M',12),(95,'L',12),(95,'XL',8),(95,'XXL',4);

-- =====================================================
-- TALLAS — ACCESORIOS / GORRAS / MOCHILAS (IDs 96-98)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (96,'ONE SIZE',40);
INSERT INTO product_sizes (product_id, size, stock) VALUES (97,'ONE SIZE',20);
INSERT INTO product_sizes (product_id, size, stock) VALUES (98,'ONE SIZE',35);

-- =====================================================
-- TALLAS — PANTALONES (IDs 99-100)
-- =====================================================

INSERT INTO product_sizes (product_id, size, stock) VALUES (99,'28',5),(99,'30',10),(99,'32',15),(99,'34',15),(99,'36',10),(99,'38',5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (100,'28',6),(100,'30',12),(100,'32',18),(100,'34',18),(100,'36',12),(100,'38',6);

-- =====================================================
-- TALLAS — PRODUCTOS (IDs 101-108)
-- =====================================================
INSERT INTO product_sizes (product_id, size, stock) VALUES (101, '40', 5), (101, '41', 8), (101, '42', 10), (101, '43', 7), (101, '44', 4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (102, 'Única', 20), (103, 'Única', 12), (108, 'Ajustable', 25);
INSERT INTO product_sizes (product_id, size, stock) VALUES (104, 'S', 5), (104, 'M', 10), (104, 'L', 10), (104, 'XL', 5);
INSERT INTO product_sizes (product_id, size, stock) VALUES (105, 'S', 4), (105, 'M', 8), (105, 'L', 8), (105, 'XL', 4);
INSERT INTO product_sizes (product_id, size, stock) VALUES (106, 'S', 10), (106, 'M', 15), (106, 'L', 15), (106, 'XL', 10);
INSERT INTO product_sizes (product_id, size, stock) VALUES (107, 'S', 6), (107, 'M', 12), (107, 'L', 12), (107, 'XL', 6);

-- =====================================================
-- GALERÍA DE IMÁGENES (PRODUCT_IMAGES)
-- =====================================================

-- Para el id 1
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(1, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778167255/streetshop/products/s4qwqt1u4x8k8sjwqnkt.png', true, 0),
(1, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778167262/streetshop/products/u9cmouba3kogmi1uvrqc.png', false, 1);

-- Para el id 2
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(2, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168339/streetshop/products/ca8jkcdsizro4h9dkp3i.png', true, 0),
(2, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168357/streetshop/products/hwavnhafphyvxuaojfoj.png', false, 1);

-- Para el id 3
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(3, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168545/streetshop/products/dvvohtk56byhgds2afrj.png', true, 0),
(3, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168551/streetshop/products/ptnblcsa1hcwbqk5izpz.png', false, 1);

-- Para el id 4
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(4, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168670/streetshop/products/rn6wkf4sbgpu6ngc9qhy.png', true, 0),
(4, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168674/streetshop/products/z5i21banlyei5lhfsyy0.png', false, 1);

-- Para el id 5
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(5, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168871/streetshop/products/hag8xomq01xkffokugzx.png', true, 0),
(5, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778168880/streetshop/products/yrcpezg9ollzb6oiseda.png', false, 1);

-- Para el id 6
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(6, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169108/streetshop/products/nkhcgdhgszurl7sh3lta.png', true, 0),
(6, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169118/streetshop/products/k9fxhpzyavjbng39tiu2.png', false, 1);

-- Para el id 7
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(7, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169186/streetshop/products/xsyucp8loqvbwqesh6tf.png', true, 0),
(7, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169194/streetshop/products/p0eey7bluguzji2slsnz.png', false, 1);

-- Para el id 8
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(8, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245996/streetshop/products/i8k9rthgiwpyvvrbba6m.png', true, 0),
(8, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174591/streetshop/products/hxdxlerh5u5jycci4z8y.jpg', false, 1);

-- Para el id 9
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(9, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169741/streetshop/products/mkvkrwbpjcrphalzr3cn.png', true, 0),
(9, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169761/streetshop/products/yswibfrxoacez8rmb6ps.png', false, 1);

-- Para el id 10
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(10, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169783/streetshop/products/ab6smoescfb7he3fjiu5.png', true, 0),
(10, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169788/streetshop/products/xbi985illyr0rbacjtm1.png', false, 1);

-- Para el id 11
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(11, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169876/streetshop/products/zr7vtpnry6oegkqsr9ce.png', true, 0),
(11, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169887/streetshop/products/qzkmuaxpnzncdku6yuxx.png', false, 1);

-- Para el id 12
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(12, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169901/streetshop/products/w5r69wrvvjxilw7dj3ga.png', true, 0),
(12, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778169985/streetshop/products/dr7uujdr8rk2jciucozf.png', false, 1);

-- Para el id 13
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(13, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170261/streetshop/products/ycjt4zxnrcjlaezmcsqk.png', true, 0);

-- Para el id 14
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(14, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170387/streetshop/products/lb5apyqooedrmipq1zdh.png', true, 0);

-- Para el id 15
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(15, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170410/streetshop/products/uw82e87uevtegjpatytz.png', true, 0);

-- Para el id 16
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(16, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170467/streetshop/products/eistscqacs5qgnkcuiig.png', true, 0);

-- Para el id 17
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(17, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170504/streetshop/products/ct6q9o3hexqoe5tfhz8p.png', true, 0);

-- Para el id 18
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(18, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170562/streetshop/products/lfiacj57n9hgtd41espe.png', true, 0);

-- Para el id 19
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(19, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170787/streetshop/products/xuxwbulxmwu3kvhitcyc.png', true, 0);

-- Para el id 20
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(20, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170794/streetshop/products/d7sd4pec6qwcdx2jm9pn.png', true, 0);

-- Para el id 21
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(21, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170810/streetshop/products/exiikoj1tliudf6kqe8l.png', true, 0);

-- Para el id 22
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(22, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170817/streetshop/products/ysxfjb0dzffjyd1klze0.png', true, 0);

-- Para el id 23
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(23, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170834/streetshop/products/acxjv04p58zonda7icmy.png', true, 0);

-- Para el id 24
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(24, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778170980/streetshop/products/su8kcf5ho605npoc2q2s.png', true, 0);

-- Para el id 25
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(25, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171051/streetshop/products/g3wyodmd7qqelhys7ivr.png', true, 0);

-- Para el id 26
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(26, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171398/streetshop/products/gsuidmbnknxd9qs0ey4o.png', true, 0);

-- Para el id 27
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(27, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171506/streetshop/products/xqhfw8ygarirwonp3tgw.png', true, 0);

-- Para el id 28
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(28, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171528/streetshop/products/dlwcmuu8uwuehriyttcv.png', true, 0);

-- Para el id 29
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(29, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171544/streetshop/products/o1dpbiuiqdd08mi71znp.png', true, 0);

-- Para el id 30
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(30, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778171556/streetshop/products/u8cadbeo8flifghvemqu.png', true, 0);

-- Para el id 31
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(31, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070492/streetshop/products/oezaqxutkm8xf1jol5d6.png', true, 0);

-- Para el id 32
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(32, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070825/streetshop/products/tjc9x3gaxg8ve0qqvpeb.png', true, 0);

-- Para el id 33
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(33, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778070951/streetshop/products/kmqatlvusvmvhdidxcpv.png', true, 0);

-- Para el id 34
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(34, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071042/streetshop/products/f4wghtjx9hymwj6wlbj3.png', true, 0);

-- Para el id 35
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(35, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071195/streetshop/products/etcxrxvx9ighlcb4vvfk.png', true, 0);

-- Para el id 36
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(36, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071279/streetshop/products/udohz4qw88gnndbyx874.png', true, 0);

-- Para el id 37
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(37, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071509/streetshop/products/i7teathunpzh6arsvwfx.png', true, 0);

-- Para el id 38
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(38, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071705/streetshop/products/oapayeee3ts4ug06v2xy.png', true, 0);

-- Para el id 39
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(39, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778071823/streetshop/products/v77uydynz4qpfwapxz3p.png', true, 0);

-- Para el id 40
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(40, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245005/streetshop/products/nudj3z0gviyokeslufzh.png', true, 0);

-- Para el id 41
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(41, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072032/streetshop/products/wavzxbc8bitg76uxikhp.png', true, 0);

-- Para el id 42
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(42, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072165/streetshop/products/jdu5ohghqfrkikp0sjcz.png', true, 0);

-- Para el id 43
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(43, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072301/streetshop/products/rx2y9egsj8ldpofp0wsi.png', true, 0);

-- Para el id 44
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(44, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072495/streetshop/products/pvpmsk3appnisxjcexrx.png', true, 0);

-- Para el id 45
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(45, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072608/streetshop/products/xvfslcs7rkjcqv1llilo.png', true, 0);

-- Para el id 46
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(46, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072711/streetshop/products/kbadnef9gnkt5u70zas7.png', true, 0);

-- Para el id 47
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(47, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778072894/streetshop/products/sroor82pu3qwimjtahlp.png', true, 0);

-- Para el id 48
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(48, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073124/streetshop/products/qoj0xhomutt4nacby31b.png', true, 0);

-- Para el id 49
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(49, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073286/streetshop/products/gcvzq3u4kjgijsjxdb3q.png', true, 0);

-- Para el id 50
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(50, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073437/streetshop/products/jbjc9fwoccgnnpbbfese.png', true, 0);

-- Para el id 51
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(51, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073504/streetshop/products/qn8ncmyxjvtenv83btkl.png', true, 0);

-- Para el id 52
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(52, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073576/streetshop/products/jvscaewrgkopvn3uwyp0.png', true, 0);

-- Para el id 53
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(53, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778073670/streetshop/products/fi9sel3x3namwusokgvz.png', true, 0);

-- Para el id 54
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(54, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172445/streetshop/products/rjhehwv87lj7shpat0te.png', true, 0),
(54, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172467/streetshop/products/rvrrthmh0sth4xm1ryzv.png', false, 1);

-- Para el id 55
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(55, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172772/streetshop/products/p5e5251j3orublzrwxzs.png', true, 0),
(55, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172784/streetshop/products/wjl7gxu3vjiroonguel9.png', false, 1);

-- Para el id 56
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(56, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172943/streetshop/products/xl11sy8uurev8bsahd3p.png', true, 0),
(56, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778172949/streetshop/products/ueyfbigngjnwefpaay5u.png', false, 1);

-- Para el id 57
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(57, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173087/streetshop/products/ofsxqlzq157pevonnfup.png', true, 0),
(57, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173094/streetshop/products/dvyqgf2ztycmcvucgwhp.jpg', false, 1);

-- Para el id 58
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(58, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245697/streetshop/products/tdkwlb50fzm74fm3twdr.png', true, 0),
(58, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173183/streetshop/products/ebnmbtulzdpwdyu7tq7b.png', false, 1);

-- Para el id 59
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(59, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173278/streetshop/products/xfacv9q0v0sodc9drkql.png', true, 0),
(59, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173286/streetshop/products/pqrt69vxlbkj0zmoe1ga.jpg', false, 1);

-- Para el id 60
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(60, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173432/streetshop/products/xhalteyy8r0xecrwbvyt.png', true, 0),
(60, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778173567/streetshop/products/xzjwn0rfou32gctxu5kw.png', false, 1);

-- Para el id 61
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(61, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174040/streetshop/products/iul43mhrmmz5jlatukir.png', true, 0),
(61, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174056/streetshop/products/blclrxzlins94ux3npr4.png', false, 1);

-- Para el id 62
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(62, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174175/streetshop/products/oczgywqiy49jbbd0zbmj.png', true, 0),
(62, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174177/streetshop/products/sg51sta0mjkxxn9qv1kk.png', false, 1);

-- Para el id 63
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(63, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174269/streetshop/products/dzrzbibgti5ev5jvt5qw.png', true, 0),
(63, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174274/streetshop/products/vuntoef9brtzecqjmdrk.png', false, 1);

-- Para el id 64
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(64, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174348/streetshop/products/etoc5p0mafhgry8dfrbs.png', true, 0),
(64, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174350/streetshop/products/lnmimrzim1n2p10skuep.png', false, 1);

-- Para el id 65
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(65, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174467/streetshop/products/z1zafdg3xosaizczwwku.png', true, 0),
(65, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778174480/streetshop/products/z7nb8fgxeuayekggciud.png', false, 1);

-- Para el id 66
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(66, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778175688/streetshop/products/wzstfmp5ier0uo6nz11u.png', true, 0);

-- Para el id 67
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(67, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778175865/streetshop/products/vz3yne3vcehtohxvblcf.jpg', true, 0);

-- Para el id 68
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(68, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778245240/streetshop/products/hwb8rolarjpja7x53p6b.png', true, 0);

-- Para el id 69
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(69, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176133/streetshop/products/uapo1odoeads3boipd1e.png', true, 0);

-- Para el id 70
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(70, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176187/streetshop/products/qlnby4o7g58cwuixmrna.jpg', true, 0);

-- Para el id 71
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(71, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176254/streetshop/products/l6ljvlwpa20xgmtc0acw.png', true, 0);

-- Para el id 72
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(72, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176566/streetshop/products/cce4b8ocmruslkwznf1n.png', true, 0);

-- Para el id 73
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(73, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176746/streetshop/products/qq7knjqamtpxsco07igv.png', true, 0);

-- Para el id 74
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(74, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778176795/streetshop/products/hr46xferhwj3cb4iczxr.png', true, 0);

-- Para el id 75
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(75, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177069/streetshop/products/iapaejkqzwvb8sydnlff.png', true, 0);

-- Para el id 76
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(76, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177491/streetshop/products/lzg056cfziwv2qsbhnjm.png', true, 0);

-- Para el id 77
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(77, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177601/streetshop/products/qc08fwkwbmysrsz9otnb.png', true, 0);

-- Para el id 78
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(78, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778177945/streetshop/products/x34wvhubb25kp5xk70xi.png', true, 0);

-- Para el id 79
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(79, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178032/streetshop/products/prhbxjijlg9wufxtx3us.png', true, 0);

-- Para el id 80
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(80, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178074/streetshop/products/io2l7rl3k02qpu5bemzg.png', true, 0);

-- Para el id 81
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(81, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178565/streetshop/products/tptlzwt70ykfdgwjr1ci.png', true, 0);

-- Para el id 82
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(82, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178652/streetshop/products/obrfjldtelzjzyloukkk.png', true, 0);

-- Para el id 83
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(83, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778178710/streetshop/products/k3gijvpee5ge5wyr6ucc.png', true, 0);

-- Para el id 84
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(84, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778179728/streetshop/products/x2xl5zkck8jb6pdia06c.png', true, 0),
(84, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778179730/streetshop/products/qkxdjmincif4ignd3arb.png', false, 1);

-- Para el id 85
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(85, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180285/streetshop/products/hmt8zbwaohhwynn1umuo.png', true, 0),
(85, 'http://res.cloudinary.com/dpsfipegh/image/upload/v1778180287/streetshop/products/iwc2owdqlno8m9pi7ir3.png', false, 1);

-- Para el id 86
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(86, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180359/streetshop/products/v1zzq3hu1rnd2ckj4whe.png', true, 0),
(86, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180368/streetshop/products/b5ogugnyah7kqrrvlca1.png', false, 1);

-- Para el id 87
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(87, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180449/streetshop/products/gkbk7qcjwnlvvhjn0fx1.png', true, 0),
(87, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180451/streetshop/products/jbtxssagpmdqqma5ss8o.png', false, 1);

-- Para el id 88
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(88, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180558/streetshop/products/syex1eewbalqpc22ngvv.png', true, 0),
(88, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180561/streetshop/products/tbw7mxfjz7afynyzzaln.jpg', false, 1);

-- Para el id 89
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(89, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778180919/streetshop/products/lqtu8id1sfywtdbgtztb.png', true, 0);

-- Para el id 90
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(90, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181011/streetshop/products/kot3r5qrhgfo1b1bnbzz.png', true, 0);

-- Para el id 91
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(91, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181100/streetshop/products/z1i19egenejs9dpd3b3j.png', true, 0);

-- Para el id 92
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(92, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181400/streetshop/products/duwlue7pvqhhd9hwnxvi.jpg', true, 0);

-- Para el id 93
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(93, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181807/streetshop/products/gqf6nwyky5djtso7wfmv.png', true, 0);

-- Para el id 94
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(94, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778181918/streetshop/products/kkw9et77j7ccjurbesix.png', true, 0);

-- Para el id 95
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(95, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778182324/streetshop/products/lbqxo4v6xwdk1pefiuih.jpg', true, 0);

-- Para el id 96
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(96, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778182930/streetshop/products/gbc6cpmtuhxj5ll4kqgn.png', true, 0);

-- Para el id 97
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(97, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183004/streetshop/products/fy0rw28gfs6zymi9vuoc.png', true, 0);

-- Para el id 98
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(98, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183157/streetshop/products/pz1krubzoutcytqgtk6o.png', true, 0);

-- Para el id 99
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(99, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183595/streetshop/products/wdcvm68thxnu3yyhrfio.png', true, 0);

-- Para el id 100
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES 
(100, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778183671/streetshop/products/yjktoesxaljpwua3wcna.png', true, 0);

-- Para el id 101
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(101, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248172/streetshop/products/geprwyc21sox0yp42ywb.png', true, 0),
(101, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248174/streetshop/products/boa58exjjz8xz0rkryvh.png', false, 1);

-- Para el id 102
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(102, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248348/streetshop/products/vkgg78riyytqfl9fvmlq.png', true, 0);

-- Para el id 103
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(103, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248375/streetshop/products/je8pasni10bjdsxsoxbf.png', true, 0);

-- Para el id 104
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(104, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248549/streetshop/products/f6x1ee57wzd6vgc5oaiu.png', true, 0);

-- Para el id 105
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(105, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248459/streetshop/products/m7gxknz5sw1tm79nivhb.png', true, 0);

-- Para el id 106
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(106, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248679/streetshop/products/rlgmr1rndb515hojxm1b.png', true, 0);

-- Para el id 107
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(107, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248741/streetshop/products/obgx5a0uljkldjna92s7.png', true, 0);

-- Para el id 108
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(108, 'https://res.cloudinary.com/dpsfipegh/image/upload/v1778248839/streetshop/products/fudi9cazc4k6xovj4czo.png', true, 0);

-- =====================================================
-- FIN DEL SCRIPT — 108 productos
-- =====================================================
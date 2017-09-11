BEGIN TRANSACTION;
CREATE TABLE "threads_thread" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL, "created_at" datetime NOT NULL, "subject_id" integer NOT NULL REFERENCES "threads_subject" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"));
INSERT INTO `threads_thread` (id,name,created_at,subject_id,user_id) VALUES (1,'How to get your music played in movies','2017-09-01 16:38:46.904000',12,2),
 (2,'What''s your favourite painting and why?','2017-09-01 16:44:21.356000',5,2),
 (3,'How much is that doggy in the window?','2017-09-01 21:04:18.380000',6,2),
 (4,'Anyone play on a ZX Spectrum +','2017-09-01 22:12:45.343000',7,2),
 (5,'Is it back to school already?','2017-09-01 22:14:48.206000',8,2),
 (6,'What''s on TV tonight','2017-09-01 23:15:01.766000',9,2),
 (7,'Where to get a good garden shed','2017-09-04 15:41:09.744000',10,2),
 (8,'What is on in the Theatre','2017-09-05 22:34:47.718000',5,2),
 (9,'What is the best computer game','2017-09-06 18:24:21.307000',7,2),
 (10,'Social Media. Is it good for you','2017-09-06 18:31:07.247000',19,2),
 (11,'Are cookies a waste of money','2017-09-06 18:42:19.917000',15,2);
CREATE TABLE "threads_subject" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL, "description" text NOT NULL);
INSERT INTO `threads_subject` (id,name,description) VALUES (5,'Arts','<p>.</p>'),
 (6,'Business & Finance','<p>.</p>'),
 (7,'Computer Games','<p>.</p>'),
 (8,'Education','<p>.</p>'),
 (9,'Entertainment','<p>.</p>'),
 (10,'Home & Garden','<p>.</p>'),
 (11,'Motor & Transport','<p>.</p>'),
 (12,'Music','<p>.</p>'),
 (13,'Politics','<p>.</p>'),
 (14,'Recreation & Hobbies','<p>.</p>'),
 (15,'Science, Health & Environment','<p>.</p>'),
 (16,'Social & Fun','<p>.</p>'),
 (17,'Society & Culture','<p>.</p>'),
 (18,'Sports','<p>.</p>'),
 (19,'Technology & Internet','<p>.</p>');
CREATE TABLE "threads_post" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "comment" text NOT NULL, "created_at" datetime NOT NULL, "thread_id" integer NOT NULL REFERENCES "threads_thread" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"));
INSERT INTO `threads_post` (id,comment,created_at,thread_id,user_id) VALUES (1,'<p>Write, Rehearse, Record, Release</p>
<p>Also do an instrumental version&nbsp;</p>
<p>Then submit</p>','2017-09-01 16:38:46.904000',1,2),
 (2,'<p>The Scream by Edvard Munch</p>
<p>I just like the lines</p>
<p>And I also did a version of it for Art class</p>','2017-09-01 16:44:21.357000',2,2),
 (3,'<p>the one with the waggedy tail</p>','2017-09-01 21:04:18.380000',3,2),
 (4,'<p>In my childhood</p>','2017-09-01 22:12:45.344000',4,2),
 (5,'<p>yes</p>','2017-09-01 22:14:48.212000',5,2),
 (6,'I believe it is yes','2017-09-01 22:36:07.288000',5,2),
 (8,'Also the Bachelor','2017-09-01 23:15:27.591000',6,2),
 (9,'<p>Adman</p>','2017-09-04 15:41:09.745000',7,2),
 (10,'Timber Fencing Gates','2017-09-04 15:41:32.723000',7,2),
 (11,'test commebt','2017-09-05 12:52:35.593000',3,2),
 (12,'test','2017-09-05 13:56:06.674000',2,1),
 (13,'<p>Which Theatre</p>','2017-09-05 22:34:47.718000',8,2),
 (14,'<p>Super Mario Brothers</p>','2017-09-06 18:24:21.308000',9,2),
 (15,'<p>It''s good to stay in touch but it can be addictive</p>','2017-09-06 18:31:07.247000',10,2),
 (16,'People can over-share','2017-09-06 18:31:48.193000',10,2),
 (17,'<p>Yes I think so</p>','2017-09-06 18:42:19.917000',11,2);
CREATE TABLE "reusable_blog_post" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "content" text NOT NULL, "created_date" datetime NOT NULL, "published_date" datetime NULL, "views" integer NOT NULL, "author_id" integer NOT NULL REFERENCES "accounts_user" ("id"), "image" varchar(100) NULL, "tag" varchar(30) NULL);
INSERT INTO `reusable_blog_post` (id,title,content,created_date,published_date,views,author_id,image,tag) VALUES (1,'post1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2017-08-31 14:17:43','2017-08-31 14:18:29',0,1,'images/150_EURO.JPG','IT'),
 (2,'post2','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2017-08-31 14:19:10','2017-08-31 14:19:29',5,1,'images/400_EURO.JPG','health'),
 (3,'post3','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.','2017-08-31 14:19:45','2017-08-31 14:20:06',6,1,'images/600_EURO.JPG','music'),
 (4,'post4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2017-08-31 14:20:21','2017-08-31 14:20:43',5,1,'images/PAYPAL_ACCOUNTS.JPG','food');
CREATE TABLE "products_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(254) NOT NULL, "description" text NOT NULL, "price" decimal NOT NULL);
INSERT INTO `products_product` (id,name,description,price) VALUES (1,'product1','product1',5.99),
 (2,'product2','product2',7.99),
 (3,'product3','product3',8.99),
 (4,'product4','product4',9.99),
 (5,'product5','product5 description',11.99);
CREATE TABLE "polls_vote" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "poll_id" integer NOT NULL REFERENCES "polls_poll" ("id"), "subject_id" integer NOT NULL REFERENCES "polls_pollsubject" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"));
INSERT INTO `polls_vote` (id,poll_id,subject_id,user_id) VALUES (1,3,3,2),
 (2,4,6,2),
 (3,5,9,2);
CREATE TABLE "polls_pollsubject" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL, "poll_id" integer NOT NULL REFERENCES "polls_poll" ("id"));
INSERT INTO `polls_pollsubject` (id,name,poll_id) VALUES (1,'Cormac Liston',1),
 (2,'Less than 10',3),
 (3,'More than 10 but less than 20',3),
 (4,'More than 20?',3),
 (5,'Twitter',4),
 (6,'Facebook',4),
 (7,'Instagram',4),
 (8,'Chocolate Chip',5),
 (9,'GingerNuut',5),
 (10,'Custard Cream',5);
CREATE TABLE "polls_poll" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question" text NOT NULL, "thread_id" integer NULL UNIQUE REFERENCES "threads_thread" ("id"));
INSERT INTO `polls_poll` (id,question,thread_id) VALUES (1,'Modern or Classic?',2),
 (2,'What is your favourite Theatre in Dublin',8),
 (3,'How many Hours a week do you spend in front of a computer',9),
 (4,'What is your favourite Social Network',10),
 (5,'What is your favourite type of cookie?',11);
CREATE TABLE "paypal_ipn" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "business" varchar(127) NOT NULL, "charset" varchar(255) NOT NULL, "custom" varchar(255) NOT NULL, "notify_version" decimal NULL, "parent_txn_id" varchar(19) NOT NULL, "receiver_email" varchar(254) NOT NULL, "receiver_id" varchar(255) NOT NULL, "residence_country" varchar(2) NOT NULL, "test_ipn" bool NOT NULL, "txn_id" varchar(255) NOT NULL, "verify_sign" varchar(255) NOT NULL, "address_country" varchar(64) NOT NULL, "address_city" varchar(40) NOT NULL, "address_country_code" varchar(64) NOT NULL, "address_name" varchar(128) NOT NULL, "address_state" varchar(40) NOT NULL, "address_status" varchar(255) NOT NULL, "address_street" varchar(200) NOT NULL, "address_zip" varchar(20) NOT NULL, "contact_phone" varchar(20) NOT NULL, "first_name" varchar(64) NOT NULL, "last_name" varchar(64) NOT NULL, "payer_business_name" varchar(127) NOT NULL, "payer_email" varchar(127) NOT NULL, "payer_id" varchar(13) NOT NULL, "auth_amount" decimal NULL, "auth_exp" varchar(28) NOT NULL, "auth_id" varchar(19) NOT NULL, "auth_status" varchar(255) NOT NULL, "exchange_rate" decimal NULL, "invoice" varchar(127) NOT NULL, "item_name" varchar(127) NOT NULL, "item_number" varchar(127) NOT NULL, "mc_currency" varchar(32) NOT NULL, "mc_fee" decimal NULL, "mc_gross" decimal NULL, "mc_handling" decimal NULL, "mc_shipping" decimal NULL, "memo" varchar(255) NOT NULL, "num_cart_items" integer NULL, "option_name1" varchar(64) NOT NULL, "option_name2" varchar(64) NOT NULL, "payer_status" varchar(255) NOT NULL, "payment_date" datetime NULL, "payment_gross" decimal NULL, "payment_status" varchar(255) NOT NULL, "payment_type" varchar(255) NOT NULL, "pending_reason" varchar(255) NOT NULL, "protection_eligibility" varchar(255) NOT NULL, "quantity" integer NULL, "reason_code" varchar(255) NOT NULL, "remaining_settle" decimal NULL, "settle_amount" decimal NULL, "settle_currency" varchar(32) NOT NULL, "shipping" decimal NULL, "shipping_method" varchar(255) NOT NULL, "tax" decimal NULL, "transaction_entity" varchar(255) NOT NULL, "auction_buyer_id" varchar(64) NOT NULL, "auction_closing_date" datetime NULL, "auction_multi_item" integer NULL, "for_auction" decimal NULL, "amount" decimal NULL, "amount_per_cycle" decimal NULL, "initial_payment_amount" decimal NULL, "next_payment_date" datetime NULL, "outstanding_balance" decimal NULL, "payment_cycle" varchar(255) NOT NULL, "period_type" varchar(255) NOT NULL, "product_name" varchar(255) NOT NULL, "product_type" varchar(255) NOT NULL, "profile_status" varchar(255) NOT NULL, "recurring_payment_id" varchar(255) NOT NULL, "rp_invoice_id" varchar(127) NOT NULL, "time_created" datetime NULL, "amount1" decimal NULL, "amount2" decimal NULL, "amount3" decimal NULL, "mc_amount1" decimal NULL, "mc_amount2" decimal NULL, "mc_amount3" decimal NULL, "password" varchar(24) NOT NULL, "period1" varchar(255) NOT NULL, "period2" varchar(255) NOT NULL, "period3" varchar(255) NOT NULL, "reattempt" varchar(1) NOT NULL, "recur_times" integer NULL, "recurring" varchar(1) NOT NULL, "retry_at" datetime NULL, "subscr_date" datetime NULL, "subscr_effective" datetime NULL, "subscr_id" varchar(19) NOT NULL, "username" varchar(64) NOT NULL, "case_creation_date" datetime NULL, "case_id" varchar(255) NOT NULL, "case_type" varchar(255) NOT NULL, "receipt_id" varchar(255) NOT NULL, "currency_code" varchar(32) NOT NULL, "handling_amount" decimal NULL, "transaction_subject" varchar(255) NOT NULL, "ipaddress" char(39) NULL, "flag" bool NOT NULL, "flag_code" varchar(16) NOT NULL, "flag_info" text NOT NULL, "query" text NOT NULL, "response" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "from_view" varchar(6) NULL, "mp_id" varchar(128) NULL, "txn_type" varchar(255) NOT NULL);
INSERT INTO `paypal_ipn` (id,business,charset,custom,notify_version,parent_txn_id,receiver_email,receiver_id,residence_country,test_ipn,txn_id,verify_sign,address_country,address_city,address_country_code,address_name,address_state,address_status,address_street,address_zip,contact_phone,first_name,last_name,payer_business_name,payer_email,payer_id,auth_amount,auth_exp,auth_id,auth_status,exchange_rate,invoice,item_name,item_number,mc_currency,mc_fee,mc_gross,mc_handling,mc_shipping,memo,num_cart_items,option_name1,option_name2,payer_status,payment_date,payment_gross,payment_status,payment_type,pending_reason,protection_eligibility,quantity,reason_code,remaining_settle,settle_amount,settle_currency,shipping,shipping_method,tax,transaction_entity,auction_buyer_id,auction_closing_date,auction_multi_item,for_auction,amount,amount_per_cycle,initial_payment_amount,next_payment_date,outstanding_balance,payment_cycle,period_type,product_name,product_type,profile_status,recurring_payment_id,rp_invoice_id,time_created,amount1,amount2,amount3,mc_amount1,mc_amount2,mc_amount3,password,period1,period2,period3,reattempt,recur_times,recurring,retry_at,subscr_date,subscr_effective,subscr_id,username,case_creation_date,case_id,case_type,receipt_id,currency_code,handling_amount,transaction_subject,ipaddress,flag,flag_code,flag_info,query,response,created_at,updated_at,from_view,mp_id,txn_type) VALUES (1,'','windows-1252','',3.8,'','cormac.liston@gmail.com','','US',1,'263111205V342141H','AhBpGP1a26BqO2bPn7ApItATmBuXAuFtrV-sljmptemu-Y-l..nnXEx7','','','','','','','','','','outlook','personal account','','cormac.liston@outlook.com','ALX42AXH6F6XC',NULL,'','','',NULL,'','1-3d520f24-c3be-4b19-b1d8-91cd3d68cec9','','USD',NULL,5.99,NULL,NULL,'',NULL,'','','verified','2017-08-31 14:40:12',5.99,'Pending','instant','unilateral','Ineligible',1,'',NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',NULL,'','127.0.0.1',0,'','','transaction_subject=&txn_type=web_accept&payment_date=07%3A40%3A12+Aug+31%2C+2017+PDT&last_name=personal+account&residence_country=US&pending_reason=unilateral&item_name=1-3d520f24-c3be-4b19-b1d8-91cd3d68cec9&payment_gross=5.99&mc_currency=USD&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AhBpGP1a26BqO2bPn7ApItATmBuXAuFtrV-sljmptemu-Y-l..nnXEx7&payer_status=verified&test_ipn=1&payer_email=cormac.liston%40outlook.com&txn_id=263111205V342141H&quantity=1&receiver_email=cormac.liston%40gmail.com&first_name=outlook&payer_id=ALX42AXH6F6XC&item_number=&payment_status=Pending&mc_gross=5.99&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=a82d6f6ba3ed0','VERIFIED','2017-08-31 14:40:16.511000','2017-08-31 14:40:16.659000','','','web_accept'),
 (2,'cormac.music@gmail.com','windows-1252','2-2',3.8,'','cormac.music@gmail.com','','US',1,'','AiKZhEEPLJjSIccz.2M.tbyW5YFwA3jeEGnkdpwW1tByqv9D2n5hpom4','','','','','','','','','','outlook','personal account','','cormac.liston@outlook.com','ALX42AXH6F6XC',NULL,'','','',NULL,'d7f925fd-8e30-4efa-b9a4-392c99c07ccd','mag2','','USD',NULL,NULL,NULL,NULL,'',NULL,'','','verified',NULL,NULL,'','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,8.99,NULL,NULL,8.99,'','','','1 M','1',NULL,'1',NULL,'2017-08-31 15:07:01',NULL,'I-GRETX0FLTM62','',NULL,'','','','',NULL,'','127.0.0.1',0,'','','txn_type=subscr_signup&subscr_id=I-GRETX0FLTM62&last_name=personal+account&residence_country=US&mc_currency=USD&item_name=mag2&business=cormac.music%40gmail.com&amount3=8.99&recurring=1&verify_sign=AiKZhEEPLJjSIccz.2M.tbyW5YFwA3jeEGnkdpwW1tByqv9D2n5hpom4&payer_status=verified&test_ipn=1&payer_email=cormac.liston%40outlook.com&first_name=outlook&receiver_email=cormac.music%40gmail.com&payer_id=ALX42AXH6F6XC&invoice=d7f925fd-8e30-4efa-b9a4-392c99c07ccd&reattempt=1&subscr_date=08%3A07%3A01+Aug+31%2C+2017+PDT&custom=2-2&charset=windows-1252&notify_version=3.8&period3=1+M&mc_amount3=8.99&ipn_track_id=db6f3dbe20bab','VERIFIED','2017-08-31 15:07:13.114000','2017-08-31 15:07:13.345000','','','subscr_signup'),
 (3,'cormac.music@gmail.com','windows-1252','2-2',3.8,'','cormac.music@gmail.com','4BXV6GS846H2J','US',1,'0V830658GP986633N','ApBHX6qbpxJW-Ll3oP22LSbo0WeuAJql8PE7OFTxHF9Cei1uh1c3Gpig','','','','','','','','','','outlook','personal account','','cormac.liston@outlook.com','ALX42AXH6F6XC',NULL,'','','',NULL,'d7f925fd-8e30-4efa-b9a4-392c99c07ccd','mag2','','USD',0.56,8.99,NULL,NULL,'',NULL,'','','verified','2017-08-31 15:07:04',8.99,'Completed','instant','','Ineligible',NULL,'',NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'I-GRETX0FLTM62','',NULL,'','','','',NULL,'mag2','127.0.0.1',0,'','','transaction_subject=mag2&payment_date=08%3A07%3A04+Aug+31%2C+2017+PDT&txn_type=subscr_payment&subscr_id=I-GRETX0FLTM62&last_name=personal+account&residence_country=US&item_name=mag2&payment_gross=8.99&mc_currency=USD&business=cormac.music%40gmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=ApBHX6qbpxJW-Ll3oP22LSbo0WeuAJql8PE7OFTxHF9Cei1uh1c3Gpig&payer_status=verified&test_ipn=1&payer_email=cormac.liston%40outlook.com&txn_id=0V830658GP986633N&receiver_email=cormac.music%40gmail.com&first_name=outlook&invoice=d7f925fd-8e30-4efa-b9a4-392c99c07ccd&payer_id=ALX42AXH6F6XC&receiver_id=4BXV6GS846H2J&payment_status=Completed&payment_fee=0.56&mc_fee=0.56&mc_gross=8.99&custom=2-2&charset=windows-1252&notify_version=3.8&ipn_track_id=db6f3dbe20bab','VERIFIED','2017-08-31 15:08:05.348000','2017-08-31 15:08:05.504000','','','subscr_payment'),
 (4,'cormac.music@gmail.com','windows-1252','2-2',3.8,'','cormac.music@gmail.com','4BXV6GS846H2J','US',1,'1G415330B2923703D','A--8MSCLabuvN8L.-MHjxC9uypBtAC1RglbagLahyzx0BwHzBVW4wCdf','','','','','','','','','','outlook','personal account','','cormac.liston@outlook.com','ALX42AXH6F6XC',NULL,'','','',NULL,'3dc7c1b7-9a01-4f15-afe2-bd6ba99a27dc','mag2','','USD',0.56,8.99,NULL,NULL,'',NULL,'','','verified','2017-08-31 15:08:42',8.99,'Completed','instant','','Ineligible',NULL,'',NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'I-U2WWJ29K9BYV','',NULL,'','','','',NULL,'mag2','127.0.0.1',0,'','','transaction_subject=mag2&payment_date=08%3A08%3A42+Aug+31%2C+2017+PDT&txn_type=subscr_payment&subscr_id=I-U2WWJ29K9BYV&last_name=personal+account&residence_country=US&item_name=mag2&payment_gross=8.99&mc_currency=USD&business=cormac.music%40gmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=A--8MSCLabuvN8L.-MHjxC9uypBtAC1RglbagLahyzx0BwHzBVW4wCdf&payer_status=verified&test_ipn=1&payer_email=cormac.liston%40outlook.com&txn_id=1G415330B2923703D&receiver_email=cormac.music%40gmail.com&first_name=outlook&invoice=3dc7c1b7-9a01-4f15-afe2-bd6ba99a27dc&payer_id=ALX42AXH6F6XC&receiver_id=4BXV6GS846H2J&payment_status=Completed&payment_fee=0.56&mc_fee=0.56&mc_gross=8.99&custom=2-2&charset=windows-1252&notify_version=3.8&ipn_track_id=7b779663f40e8','VERIFIED','2017-08-31 15:08:52.393000','2017-08-31 15:08:52.565000','','','subscr_payment'),
 (5,'cormac.music@gmail.com','windows-1252','2-2',3.8,'','cormac.music@gmail.com','','US',1,'','AomRS5l2W2xlt2An.GaSrAzpCl-NAXAGZjk9nzetgug0N08tlmSHcvHs','','','','','','','','','','outlook','personal account','','cormac.liston@outlook.com','ALX42AXH6F6XC',NULL,'','','',NULL,'3dc7c1b7-9a01-4f15-afe2-bd6ba99a27dc','mag2','','USD',NULL,NULL,NULL,NULL,'',NULL,'','','verified',NULL,NULL,'','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,8.99,NULL,NULL,8.99,'','','','1 M','1',NULL,'1',NULL,'2017-08-31 15:08:39',NULL,'I-U2WWJ29K9BYV','',NULL,'','','','',NULL,'','127.0.0.1',0,'','','txn_type=subscr_signup&subscr_id=I-U2WWJ29K9BYV&last_name=personal+account&residence_country=US&mc_currency=USD&item_name=mag2&business=cormac.music%40gmail.com&amount3=8.99&recurring=1&verify_sign=AomRS5l2W2xlt2An.GaSrAzpCl-NAXAGZjk9nzetgug0N08tlmSHcvHs&payer_status=verified&test_ipn=1&payer_email=cormac.liston%40outlook.com&first_name=outlook&receiver_email=cormac.music%40gmail.com&payer_id=ALX42AXH6F6XC&invoice=3dc7c1b7-9a01-4f15-afe2-bd6ba99a27dc&reattempt=1&subscr_date=08%3A08%3A39+Aug+31%2C+2017+PDT&custom=2-2&charset=windows-1252&notify_version=3.8&period3=1+M&mc_amount3=8.99&ipn_track_id=7b779663f40e8','VERIFIED','2017-08-31 15:09:07.686000','2017-08-31 15:09:08.017000','','','subscr_signup');
CREATE TABLE "magazines_purchase" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "magazine_id" integer NOT NULL REFERENCES "magazines_magazine" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"), "subscription_end" datetime NOT NULL);
INSERT INTO `magazines_purchase` (id,magazine_id,user_id,subscription_end) VALUES (1,2,2,'2017-09-28 15:07:13.613000'),
 (2,2,2,'2017-09-28 15:09:08.127000');
CREATE TABLE "magazines_magazine" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(254) NOT NULL, "description" text NOT NULL, "price" decimal NOT NULL);
INSERT INTO `magazines_magazine` (id,name,description,price) VALUES (1,'mag1','Magazine1',7.99),
 (2,'mag2','mag2',8.99),
 (3,'mag3','mag3',9.99),
 (4,'mag4','mag4',10.99);
CREATE TABLE "django_site" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "domain" varchar(100) NOT NULL, "name" varchar(50) NOT NULL);
INSERT INTO `django_site` (id,domain,name) VALUES (2,'example.com','example.com');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO `django_session` (session_key,session_data,expire_date) VALUES ('m4e4xyj56wasbhhkg7o11h2kewoxdmkv','NTc3MDU0Y2VjOTMzZmUyNGJjOGE4ZmIzN2YzZjljNGI1NmUyOTAyODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA2YjBmMDRkM2FlZmM4ZWZhZWE5MjVmM2YzYTA1YTgzODdkMTY2Y2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-14 22:51:45.251000');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (1,'contenttypes','0001_initial','2017-08-31 14:08:18.012000'),
 (2,'contenttypes','0002_remove_content_type_name','2017-08-31 14:08:18.211000'),
 (3,'auth','0001_initial','2017-08-31 14:08:18.464000'),
 (4,'auth','0002_alter_permission_name_max_length','2017-08-31 14:08:18.675000'),
 (5,'auth','0003_alter_user_email_max_length','2017-08-31 14:08:18.778000'),
 (6,'auth','0004_alter_user_username_opts','2017-08-31 14:08:18.889000'),
 (7,'auth','0005_alter_user_last_login_null','2017-08-31 14:08:18.999000'),
 (8,'auth','0006_require_contenttypes_0002','2017-08-31 14:08:19.084000'),
 (9,'accounts','0001_initial','2017-08-31 14:08:19.310000'),
 (10,'accounts','0002_user_stripe_id','2017-08-31 14:08:19.587000'),
 (11,'accounts','0003_user_subscription_end','2017-08-31 14:08:19.850000'),
 (12,'admin','0001_initial','2017-08-31 14:08:20.095000'),
 (13,'sites','0001_initial','2017-08-31 14:08:20.424000'),
 (14,'flatpages','0001_initial','2017-08-31 14:08:20.706000'),
 (15,'ipn','0001_initial','2017-08-31 14:08:20.949000'),
 (16,'ipn','0002_paypalipn_mp_id','2017-08-31 14:08:21.188000'),
 (17,'ipn','0003_auto_20141117_1647','2017-08-31 14:08:21.456000'),
 (18,'ipn','0004_auto_20150612_1826','2017-08-31 14:08:22.660000'),
 (19,'magazines','0001_initial','2017-08-31 14:08:22.948000'),
 (20,'magazines','0002_auto_20160304_1633','2017-08-31 14:08:23.215000'),
 (21,'products','0001_initial','2017-08-31 14:08:23.412000'),
 (22,'reusable_blog','0001_initial','2017-08-31 14:08:23.622000'),
 (23,'reusable_blog','0002_auto_20151129_1823','2017-08-31 14:08:23.911000'),
 (24,'sessions','0001_initial','2017-08-31 14:08:24.110000'),
 (25,'magazines','0003_auto_20170831_1508','2017-08-31 14:09:18.123000'),
 (26,'magazines','0004_auto_20170831_1513','2017-08-31 14:13:29.955000'),
 (27,'magazines','0005_auto_20170831_1657','2017-08-31 15:57:22.505000'),
 (28,'magazines','0006_auto_20170831_1812','2017-08-31 17:13:43.520000'),
 (29,'threads','0001_initial','2017-08-31 17:13:44.073000'),
 (30,'magazines','0007_auto_20170904_1725','2017-09-04 16:25:57.911000'),
 (31,'polls','0001_initial','2017-09-04 16:25:58.341000'),
 (32,'magazines','0008_auto_20170905_1400','2017-09-05 13:01:14.064000'),
 (33,'magazines','0009_auto_20170907_1838','2017-09-07 17:38:54.046000');
CREATE TABLE "django_flatpage_sites" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "flatpage_id" integer NOT NULL REFERENCES "django_flatpage" ("id"), "site_id" integer NOT NULL REFERENCES "django_site" ("id"), UNIQUE ("flatpage_id", "site_id"));
CREATE TABLE "django_flatpage" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "url" varchar(100) NOT NULL, "title" varchar(200) NOT NULL, "content" text NOT NULL, "enable_comments" bool NOT NULL, "template_name" varchar(70) NOT NULL, "registration_required" bool NOT NULL);
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL, UNIQUE ("app_label", "model"));
INSERT INTO `django_content_type` (id,app_label,model) VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'contenttypes','contenttype'),
 (5,'sessions','session'),
 (6,'sites','site'),
 (7,'flatpages','flatpage'),
 (8,'reusable_blog','post'),
 (9,'accounts','user'),
 (10,'products','product'),
 (11,'ipn','paypalipn'),
 (12,'magazines','magazine'),
 (13,'magazines','purchase'),
 (14,'threads','subject'),
 (15,'threads','thread'),
 (16,'threads','post'),
 (17,'polls','poll'),
 (18,'polls','pollsubject'),
 (19,'polls','vote');
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"));
INSERT INTO `django_admin_log` (id,action_time,object_id,object_repr,action_flag,change_message,content_type_id,user_id) VALUES (1,'2017-08-31 14:14:48.508000','1','mag1',1,'',12,1),
 (2,'2017-08-31 14:14:58.836000','2','mag2',1,'',12,1),
 (3,'2017-08-31 14:15:07.735000','3','mag3',1,'',12,1),
 (4,'2017-08-31 14:15:17.105000','4','mag4',1,'',12,1),
 (5,'2017-08-31 14:16:20.974000','1','product1',1,'',10,1),
 (6,'2017-08-31 14:16:37.190000','2','product2',1,'',10,1),
 (7,'2017-08-31 14:16:49.847000','3','product3',1,'',10,1),
 (8,'2017-08-31 14:17:03.660000','4','product4',1,'',10,1),
 (9,'2017-08-31 14:17:24.580000','5','product5',1,'',10,1),
 (10,'2017-08-31 14:19:10.384000','1','post1',1,'',8,1),
 (11,'2017-08-31 14:19:45.306000','2','post2',1,'',8,1),
 (12,'2017-08-31 14:20:20.770000','3','post3',1,'',8,1),
 (13,'2017-08-31 14:20:57.209000','4','post4',1,'',8,1),
 (14,'2017-08-31 22:20:28.658000','1','why be a DEP musician',1,'',14,1),
 (15,'2017-08-31 22:22:05.261000','2','How to get your music into movies',1,'',14,1),
 (16,'2017-08-31 22:22:22.617000','3','making a music video',1,'',14,1),
 (17,'2017-08-31 22:35:35.360000','4','how much do you like Breaking Bad?',1,'',14,1),
 (18,'2017-08-31 22:40:29.622000','3','making a music video',2,'Changed description.',14,1),
 (19,'2017-08-31 22:40:44.620000','2','How to get your music into movies',2,'Changed description.',14,1),
 (20,'2017-08-31 22:41:09.837000','1','why be a DEP musician',2,'Changed description.',14,1),
 (21,'2017-08-31 22:52:38.643000','5','Arts',1,'',14,1),
 (22,'2017-08-31 22:52:56.450000','6','Business & Finance',1,'',14,1),
 (23,'2017-08-31 22:53:13.147000','7','Computer Games',1,'',14,1),
 (24,'2017-08-31 22:53:25.324000','8','Education',1,'',14,1),
 (25,'2017-08-31 22:53:38.448000','9','Entertainment',1,'',14,1),
 (26,'2017-08-31 22:53:53.062000','10','Home & Garden',1,'',14,1),
 (27,'2017-08-31 22:54:17.568000','11','Motor & Transport',1,'',14,1),
 (28,'2017-08-31 22:54:28.669000','12','Music',1,'',14,1),
 (29,'2017-08-31 22:54:41.958000','13','Politics',1,'',14,1),
 (30,'2017-08-31 22:55:00.421000','14','Recreation & Hobbies',1,'',14,1),
 (31,'2017-08-31 22:55:38.617000','15','Science, Health & Environment',1,'',14,1),
 (32,'2017-08-31 22:55:49.797000','16','Social & Fun',1,'',14,1),
 (33,'2017-08-31 22:56:04.835000','17','Society & Culture',1,'',14,1),
 (34,'2017-08-31 22:56:15.301000','18','Sports',1,'',14,1),
 (35,'2017-08-31 22:56:30.293000','19','Technology & Internet',1,'',14,1),
 (36,'2017-08-31 22:56:56.708000','4','how much do you like Breaking Bad?',3,'',14,1),
 (37,'2017-08-31 22:56:56.909000','3','making a music video',3,'',14,1),
 (38,'2017-08-31 22:56:57.136000','2','How to get your music into movies',3,'',14,1),
 (39,'2017-08-31 22:56:57.365000','1','why be a DEP musician',3,'',14,1),
 (40,'2017-09-05 13:45:13.747000','5','product5',2,'Changed description.',10,1),
 (41,'2017-09-05 13:53:05.087000','1','Modern or Classic?',1,'',17,1),
 (42,'2017-09-05 13:54:06.849000','1','Cormac Liston',1,'',18,1);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL, UNIQUE ("content_type_id", "codename"));
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,2,'add_permission','Can add permission'),
 (5,2,'change_permission','Can change permission'),
 (6,2,'delete_permission','Can delete permission'),
 (7,3,'add_group','Can add group'),
 (8,3,'change_group','Can change group'),
 (9,3,'delete_group','Can delete group'),
 (10,4,'add_contenttype','Can add content type'),
 (11,4,'change_contenttype','Can change content type'),
 (12,4,'delete_contenttype','Can delete content type'),
 (13,5,'add_session','Can add session'),
 (14,5,'change_session','Can change session'),
 (15,5,'delete_session','Can delete session'),
 (16,6,'add_site','Can add site'),
 (17,6,'change_site','Can change site'),
 (18,6,'delete_site','Can delete site'),
 (19,7,'add_flatpage','Can add flat page'),
 (20,7,'change_flatpage','Can change flat page'),
 (21,7,'delete_flatpage','Can delete flat page'),
 (22,8,'add_post','Can add post'),
 (23,8,'change_post','Can change post'),
 (24,8,'delete_post','Can delete post'),
 (25,9,'add_user','Can add user'),
 (26,9,'change_user','Can change user'),
 (27,9,'delete_user','Can delete user'),
 (28,10,'add_product','Can add product'),
 (29,10,'change_product','Can change product'),
 (30,10,'delete_product','Can delete product'),
 (31,11,'add_paypalipn','Can add PayPal IPN'),
 (32,11,'change_paypalipn','Can change PayPal IPN'),
 (33,11,'delete_paypalipn','Can delete PayPal IPN'),
 (34,12,'add_magazine','Can add magazine'),
 (35,12,'change_magazine','Can change magazine'),
 (36,12,'delete_magazine','Can delete magazine'),
 (37,13,'add_purchase','Can add purchase'),
 (38,13,'change_purchase','Can change purchase'),
 (39,13,'delete_purchase','Can delete purchase'),
 (40,14,'add_subject','Can add subject'),
 (41,14,'change_subject','Can change subject'),
 (42,14,'delete_subject','Can delete subject'),
 (43,15,'add_thread','Can add thread'),
 (44,15,'change_thread','Can change thread'),
 (45,15,'delete_thread','Can delete thread'),
 (46,16,'add_post','Can add post'),
 (47,16,'change_post','Can change post'),
 (48,16,'delete_post','Can delete post'),
 (49,17,'add_poll','Can add poll'),
 (50,17,'change_poll','Can change poll'),
 (51,17,'delete_poll','Can delete poll'),
 (52,18,'add_pollsubject','Can add poll subject'),
 (53,18,'change_pollsubject','Can change poll subject'),
 (54,18,'delete_pollsubject','Can delete poll subject'),
 (55,19,'add_vote','Can add vote'),
 (56,19,'change_vote','Can change vote'),
 (57,19,'delete_vote','Can delete vote');
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("group_id", "permission_id"));
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "accounts_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("user_id", "permission_id"));
CREATE TABLE "accounts_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "accounts_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), UNIQUE ("user_id", "group_id"));
CREATE TABLE "accounts_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(30) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "stripe_id" varchar(40) NOT NULL, "subscription_end" datetime NOT NULL);
INSERT INTO `accounts_user` (id,password,last_login,is_superuser,username,first_name,last_name,email,is_staff,is_active,date_joined,stripe_id,subscription_end) VALUES (1,'pbkdf2_sha256$20000$mvurxzavD8cv$L4PaiSwg4cGtLUKOWHVKxjhwXyRWc+TzStDDf6n3Wes=','2017-08-31 22:51:45.062000',1,'cormac.liston@outlook.com','','','cormac.liston@outlook.com',1,1,'2017-08-31 14:11:29.414000','','2017-08-31 14:11:29.414000'),
 (2,'pbkdf2_sha256$20000$A4sowmqnPEdN$bX/s7/aMj1dbK8/k2C4ZptSr/FZZavviElhgnBgDXkc=','2017-08-31 23:05:04.309000',0,'cormac74s@gmail.com','','','cormac74s@gmail.com',0,1,'2017-08-31 14:33:27.799000','cus_BJWnK0YvIKLRCN','2017-09-28 14:33:30.579000');
CREATE INDEX "threads_thread_ffaba1d1" ON "threads_thread" ("subject_id");
CREATE INDEX "threads_thread_e8701ad4" ON "threads_thread" ("user_id");
CREATE INDEX "threads_post_e8701ad4" ON "threads_post" ("user_id");
CREATE INDEX "threads_post_e3464c97" ON "threads_post" ("thread_id");
CREATE INDEX "reusable_blog_post_4f331e2f" ON "reusable_blog_post" ("author_id");
CREATE INDEX "polls_vote_ffaba1d1" ON "polls_vote" ("subject_id");
CREATE INDEX "polls_vote_e8701ad4" ON "polls_vote" ("user_id");
CREATE INDEX "polls_vote_582e9e5a" ON "polls_vote" ("poll_id");
CREATE INDEX "polls_pollsubject_582e9e5a" ON "polls_pollsubject" ("poll_id");
CREATE INDEX "paypal_ipn_8e113603" ON "paypal_ipn" ("txn_id");
CREATE INDEX "magazines_purchase_e8701ad4" ON "magazines_purchase" ("user_id");
CREATE INDEX "magazines_purchase_356d5114" ON "magazines_purchase" ("magazine_id");
CREATE INDEX "django_session_de54fa62" ON "django_session" ("expire_date");
CREATE INDEX "django_flatpage_sites_c3368d3a" ON "django_flatpage_sites" ("flatpage_id");
CREATE INDEX "django_flatpage_sites_9365d6e7" ON "django_flatpage_sites" ("site_id");
CREATE INDEX "django_flatpage_572d4e42" ON "django_flatpage" ("url");
CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" ("group_id");
CREATE INDEX "accounts_user_user_permissions_e8701ad4" ON "accounts_user_user_permissions" ("user_id");
CREATE INDEX "accounts_user_user_permissions_8373b171" ON "accounts_user_user_permissions" ("permission_id");
CREATE INDEX "accounts_user_groups_e8701ad4" ON "accounts_user_groups" ("user_id");
CREATE INDEX "accounts_user_groups_0e939a4f" ON "accounts_user_groups" ("group_id");
COMMIT;

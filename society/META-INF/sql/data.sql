INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k191308@nu.edu.pk', 'K191308', 'Mohsin Shaikh', 'k191308@nu.edu.com', 'https://lh3.googleusercontent.com/a/AEdFTp7LUjuE26V7xi7ZqeTsUHCInWG-GSUCKDNkfCo-=s96-c');
INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k190251@nu.edu.pk', 'K190251', 'Mukesh Kumar', 'k190251@nu.edu.pk', 'https://picsum.photos/201');
INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k190127@nu.edu.pk', 'K190127', 'Rooman Asif', 'k190127@nu.edu.pk', 'https://picsum.photos/202');

INSERT INTO tenure (code, description, duration, archived, created_at) VALUES ('spring-2023', 'spring 2023', 'Spring 2023', false, '2023-01-01 18:00:20-05');

INSERT INTO base_society (code, name, full_name, description, image, created_at) VALUES ('EC1', 'DECS', 'Dramatics and Extra Curricular Society', 'The most happening students committee of FAST-NU, the Dramatics and Extra-Curricular Society (DECS)', 'decs.jpg', '2023-01-01 00:00:01-00');
INSERT INTO base_society (code, name, full_name, description, image, created_at) VALUES ('C1', 'ACM', 'Association for Computing Machinery', '#EmbeddingSuccess', 'acm.jpg', '2023-01-01 00:00:01-00');
INSERT INTO base_society (code, name, full_name, description, image, created_at) VALUES ('EC2', 'Sportics', 'Sportics- Nuces(FAST), Khi', 'A society that keeps the sportsman spirit alive in all FASTIAN GEEKS!', 'sportics.jpg', '2023-01-01 00:00:01-00');

INSERT INTO society (code, name, full_name, description, image, tenure_id, base_id, created_at) VALUES ('ExCo1', 'DECS', 'Dramatics and Extra Curricular Society', 'The most happening students committee of FAST-NU, the Dramatics and Extra-Curricular Society (DECS)', 'decs.jpg', 1, 1 ,'2023-01-01 00:00:01-00');
INSERT INTO society (code, name, full_name, description, image, tenure_id, base_id, created_at) VALUES ('Co1', 'ACM', 'Association for Computing Machinery', '#EmbeddingSuccess', 'acm.jpg', 1, 2, '2023-01-01 00:00:01-00');
INSERT INTO society (code, name, full_name, description, image, tenure_id, base_id, created_at) VALUES ('ExCo2', 'Sportics', 'Sportics- Nuces(FAST), Khi', 'A society that keeps the sportsman spirit alive in all FASTIAN GEEKS!', 'sportics.jpg', 1, 3, '2023-01-01 00:00:01-00');

INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 2, 2);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 3);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 3, 2);

INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-1',
'Event 1', 
'Heritage Day 2023', 
'On this upcoming Heritage Day 2023 event at DECS, we would like to honor our star performers who have been tirelessly working day and night to make this event a success. They have shown exceptional dedication and commitment towards their work, and their efforts are truly commendable. It is because of them that we are able to celebrate our rich cultural heritage and traditions with such enthusiasm and zeal.
We recognize the hard work and perseverance of our star performers and would like to thank them for going above and beyond their duties to ensure that everything runs smoothly. 
Rise and shine!
#EntertainmentTakeover 
#DECS',
1,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
1
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-2',
'Event 2', 
'Annual Tour 2023', 
'Here is a great news for the senior batch!
On Monday 19 December and Tuesday 20 December, tickets for the Annual Tour 2023 will be available only for the senior batch aka 19k students.
Venue: One Stop
Timings: 09:00 - 03:30
Other batch students, don''t get depressed, since from Wednesday onwards the sale will be on for you all!
For further queries, you may contact:
Pasha: 03408394669
Ahmed: 03340772139
Wahaj: 03132475602
Fatima: 03333639820
We hope you will join us on tour!
#EntertainmentTakeover 
#DECS',
3,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
1
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-3',
'Event 3', 
'Spotlight 2022', 
'Our newest judge for Spotlight 2022 is Bazelah Mustafa - an impressively talented individual enroute to success and fame, with a vibrant and flourishing range of experience in incredible plays in both Pakistan and the UK, such as Andhera Hone Tak,  Jasoosi Duniya, The Father, Reader and The Bus That Didn''t Stop based on the critically acclaimed book The Footprints of Partition by writer Anam Zakeria. She has also directed the physical theatre productions, ''Soch'' and ''Loop''.
With an undergraduate degree in Drama and Fine Arts from the University of Northampton, Ms Mustafa completed her MA in Advanced Theatre Practice from the Royal Central School of Speech and Drama and is currently teaching in the theatre arts department of NAPA.
A woman who knows what she''s doing and exactly how to do it, a paragon of talent - this is a lady who also choreographed the blockbuster movie Khel Khel Mein!
We are so proud of to have her on our judges panel, and  we can''t wait to see her reaction to FASTian talent!
#EntertainmentTakeover 
#DECS',
3,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
1
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-4',
'Event 4', 
'Let''s catch a lion!',
'We are pleased to announce that Dr. Muhammad Rafi will be conducting a session on guidelines for final year project selection. The purpose of this session is to provide you with the necessary information and guidelines that will help you select a suitable and impactful final year project.
During this session, he will discuss the following topics:
1. Importance of final year project selection.
2. Criteria for selecting a final year project.
3. Available resources and support for final year projects
4. Q&A session
#ACM
#BrillianceOrchestrated',
2,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
2
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-5',
'Event 5', 
'ASTERA DATA INTEGRATION BOOTCAMP 2023', 
'Astera Software is returning to FAST Main campus for the anticipated skill-based workshop, "Astera Data Integration Bootcamp - 2023".
The aim of this workshop is to help students, professionals, and aspiring data scientists understand core concepts of data extraction, data integration, and automating ETL processes employed by businesses and get hands-on with the technicalities by solving a real-life business case study.
Stay tuned for more details.
#ACM
#BrillianceOrchestrated',
2,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
2
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-6',
'Event 6', 
'WEBX Seminar', 
'WebEx is conducting a seminar at Fast Nuces on Tuesday November 15 2020, in S2 at 12:35. 
This seminar will be leading to an interview session arranged by WebEx where students can apply for the available vacancies, they can get further details on this after the seminar. 
WebEx is an e-commerce platform which provides easy to use store solution''s for small businesses and today we are thrilled to inform, that they are here with their enthusiastic team to conduct an informative session for the students. Since they are also our  sponsers for coders cup we are excited to organise. Such sessions as they are a gateway which enlighten the students about the real world, we expect all the students to gain some experience from the team which will later benefit them in the long run.
#ACM
#ACMW
#CodedMultiverse
#CodersCup',
2,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'https://forms.gle/eHWWtU491uTRjJna6',
2
);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES (
'event-7',
'Event 7', 
'The FAST Olympiad is Open', 
'Calling all athletes, gamers and sports enthusiasts! The FAST Olympiad is open to everyone, not just students of FAST NUCES! 
Whether you''re a student, a professional or just love to compete, come join us at the premier sports event of the year. With over 30+ games including traditional sports and esports, there''s something for everyone. Don''t miss out on the chance to showcase your talents and compete for a chance to win a share of the 1 million rupee prize pool. 
See you at the FAST Olympiad!              Fall. Rise. Eyes on the prize',
2,
'2023-03-04 18:00:20-05',
'2023-02-01 19:10:25-07', 
'2023-02-01 19:10:25-07',
true,
'2023-02-01 19:10:25-07',
'/',
3
);

INSERT INTO event_attachment (uri, event_id) VALUES ('decs-heritage-day.jpg', 1);
INSERT INTO event_attachment (uri, event_id) VALUES ('decs-annual-tour.png', 2);
INSERT INTO event_attachment (uri, event_id) VALUES ('decs-spotlight-2022.jpg', 3);
INSERT INTO event_attachment (uri, event_id) VALUES ('acm-lets-catch.jpg', 4);
INSERT INTO event_attachment (uri, event_id) VALUES ('acm-astera-intergration.jpg', 5);
INSERT INTO event_attachment (uri, event_id) VALUES ('acm-webx-seminar.jpg', 6);
INSERT INTO event_attachment (uri, event_id) VALUES ('sportics-fast-olympiad.jpg', 7);

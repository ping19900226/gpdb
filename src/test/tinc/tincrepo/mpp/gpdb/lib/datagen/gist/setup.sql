drop table if exists pre_GistTable1 cascade;
drop table if exists GistTable1 cascade;

CREATE TABLE pre_GistTable1 (
 id INTEGER,
 owner VARCHAR,
 description VARCHAR,
 property BOX, -- Assumes that all properties are rectangles whose sides are 
                -- aligned North/South, East/West.
 poli POLYGON,
 bullseye CIRCLE,
 v VARCHAR,
 t TEXT,
 f FLOAT, 
 p POINT,
 c CIRCLE,
 filler VARCHAR DEFAULT 'This is here just to take up space so that we use more pages of data and sequential scans take a lot more time.  Stones tinheads and mixers coming; we did it all on our own; this summer I hear the crunching; 11 dead in Ohio. Got right down to it; we were cutting us down; could have had fun but, no; left them face down dead on the ground.  How can you listen when you know?'
 )
 DISTRIBUTED BY (id)
 PARTITION BY RANGE (id)
  (
  PARTITION p_one START('1') INCLUSIVE END ('10') EXCLUSIVE,
  DEFAULT PARTITION de_fault
  )
;
CREATE TABLE GistTable1 AS SELECT * FROM pre_GistTable1;
COPY GistTable1 FROM stdin CSV;
1,Snidely Whiplash, "an empire dreamt of but as yet unbuilt", "( (0,0), (1, 1) )", "( (0,0), (1,1), (2,2), (3,3) )", "( (0,0), 0)",,,,,,
2,Theodore Turner, "a ranch and reserve", "((2000,2000), (2100, 2100))", "( (1,1), (2,1), (1,2) )", "( (2,2), 2)",,,,,,
3,Theodore Roosevelt, "overlooks Yellowstone River", "( (1800, 2200), (1801, 2201) )", "( (3,3), (3, 4), (4, 3) )", "( (3,3), 3)",,,,,,
4,Donald Duck, "overlooks Colorado River", "( (1000, 1000), (1001, 1001) )", "( (4,4), (4, 5), (5, 4), (5,5) )", "( (4,4), 4)",,,,,,
5,Roger Rabbit, "Toon Town, unit 127", "( (-1000000, -100000), (-999999, -999999) )", "( (5, -1), (5, -2), (5, -5) )", "( (5, 5), 5 )",,,,,,
6,James T. Kirk, "Utopia Planetia", "( (123456789, 123456789), (123456790, 123456790) )", "( (6,7), (6,5), (5,7) )", "( (6,6), 6)",,,,,,
7,Albus Dumbledore, "Hogwarts", "( (-12000000, -12000000), (-11999990, -11999990) )", "( (7,7), (7,8), (6,7) )", "( (7,7), 7)",,,,,,
8,"Neil, Nell, and Noel Newall", "Null Knoll",,,,,,,,,
9,"Hyquotia P. Cucumber","Radical Vegan Farms", "( (40, 20), (42, 25) )", "( (9,9), (9,8), (8,10) )", "( (9,9), 9)",,,,,,
10,Junipero Serra,California, "( (0, 0), (200, 1000) )", "( (10,10), (10,9), (8,11) )", "( (10,10), 10)",,,,,,
18,K. Serra,California, "( (0, 0), (200, 1000) )", "( (18,18), (18,19), (17,19) )", "( (18,18), 18)",,,,,,
19,Kay Serra,California, "( (0, 0), (200, 1000) )", "( (19,19), (19,18), (20,19) )", "( (19,19), 19)",,,,,,
38,Que Sera,California, "( (0, 0), (200, 1000) )", "( (38,38), (38,39), (37,38) )", "( (38,38), 38)",,,,,,
59,Hypatia,Greece,"( (6050, 20), (7052, 250) )", "( (59,59), (59,60), (60,59) )", "( (59,59), 59)",,,,,,
70, Patty, Cake,"( (6050, 20), (7052, 250) )", "( (70,70), (70,60), (60,70) )", "( (70,70), 70)",,,,,,
80, Leading space man, Leading space woman," ((1,2),(3,4)) ", "( (80,80), (80,79), (79,80) )", "( (80,80), 80)",,,,,,
81,Trailing space man ,trailing space woman ," ((1,2),(3,4)) ", "( (81,81), (81,80), (80,81) )", "( (81,81), 81)",,,,,,
82,  Leading and trailing spaces  ,  leading and trailing spaces  ,"  ((1,2),(3,4))  ", "( (82,82), (82,80), (80,82) )", "( (82,82), 82)",,,,,,
\.
COPY Lab2.Stores FROM stdin USING DELIMITERS '|';
1|Walmart Supercenter|North|5095 Almaden Expy, San Jose|Ben Romaguera
2|Best Buy |East |2650 41st Ave, Soquel|Franklyn Waelchi
3|Apple Store|South|23 N Santa Cruz Ave, Los Gatos|Joan Kunde
\.

COPY Lab2.Products FROM stdin USING DELIMITERS '|';
100|Intelligent Music Player|Google|18.91|4
101|Smart Phone|Apple|73.10|6
102|Intelligent Headphone|Boss|96.71|5
103|Alien Computer|Google|47.00|7
104|Intelligent Phone Charger|Google|41.21|9
105|Smart Speaker with Alexa|Amazon|84.21|9
106|Ring Alarm|Apple|98.60|8
107|Smart Plug|Amazon|50.21|8
108|Kindle Paperwhite|Amazon|123.90|9
109|Wifi Router|TP-Link|18.41|4
110|Full HD Monitor|Acer|37.00|5
\.

COPY Lab2.Customers FROM stdin USING DELIMITERS '|';
1001|Ami Maggio|650 Kessler Common|2017-09-07|319.04|2018-03-11|H
1002|India Crona|15480 Moore Valley|2017-10-30|0.00|2018-03-10|H
1003|Morgan Bernhard|959 Miller Crescent|2017-06-24|324.66|2018-03-26|M
1004|Elfrieda Kuhn|78872 Joesph Mountain|2017-10-14|141.50|2018-03-03|M
1005|Laurice Hilll|53518 Pouros Stravenue|2017-04-26|217.38|2018-03-03|L
\.

COPY Lab2.Sales FROM stdin USING DELIMITERS '|';
101|1001|1|2018-01-16|46.56|9
101|1001|3|2018-01-19|21.56|7
102|1001|1|2018-01-19|24.56|2
105|1001|1|2018-01-16|89.16|4
102|1002|1|2018-01-16|16.81|7
102|1002|1|2018-01-18|33.81|9
103|1003|3|2018-01-18|75.00|7
104|1004|1|2018-01-16|48.30|5
105|1005|3|2018-01-16|54.91|6
102|1001|3|2018-01-18|78.88|5
102|1002|1|2018-01-19|75.79|6
105|1004|3|2018-01-19|167.76|8
\.

COPY Lab2.Payments FROM stdin USING DELIMITERS '|';
1001|Ami Maggio|2018-02-17|100.00|f
1002|India Crona|2018-02-19|117.67|t
1003|Morgan Bernhard|2018-02-26|200.34|f
1004|Elfrieda Kuhn|2018-02-04|100.00|f
1005|Laurice Hilll|2018-02-23|112.08|f
\.

COPY Lab2.Days FROM stdin USING DELIMITERS '|';
1/15/18|C
1/16/18|N
1/17/18|N
1/18/18|N
1/19/18|N
1/20/18|C
1/21/18|C
1/22/18|N
1/23/18|N
1/24/18|N
1/25/18|N
1/26/18|N
\.

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: vessel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA vessel;

ALTER SCHEMA vessel OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: vessel; Owner: postgres
--

CREATE TABLE vessel.categories (
    code integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    PRIMARY KEY(code)
);

ALTER TABLE vessel.categories OWNER TO postgres;

--
-- Name: vessels; Type: TABLE; Schema: vessel; Owner: postgres
--

CREATE TABLE vessel.vessels (
    mmsi integer NOT NULL,
    length double precision,
    width double precision,
    draught double precision,
    build_year integer,
    code integer NOT NULL,
    PRIMARY KEY(mmsi),
    CONSTRAINT fk_code
        FOREIGN KEY(code) 
        REFERENCES vessel.categories(code)
);

ALTER TABLE vessel.vessels OWNER TO postgres;


COPY vessel.categories (code, name, description) FROM stdin;
0	'Not available'	'Not available (default)'
1	Reserved	'Reserved for future use'
2	Reserved	'Reserved for future use'
3	Reserved	'Reserved for future use'
4	Reserved	'Reserved for future use'
5	Reserved	'Reserved for future use'
6	Reserved	'Reserved for future use'
7	Reserved	'Reserved for future use'
8	Reserved	'Reserved for future use'
9	Reserved	'Reserved for future use'
10	Reserved	'Reserved for future use'
11	Reserved	'Reserved for future use'
12	Reserved	'Reserved for future use'
13	Reserved	'Reserved for future use'
14	Reserved	'Reserved for future use'
15	Reserved	'Reserved for future use'
16	Reserved	'Reserved for future use'
17	Reserved	'Reserved for future use'
18	Reserved	'Reserved for future use'
19	Reserved	'Reserved for future use'
20	'Wing in ground (WIG)'	'Wing in ground (WIG), all ships of this type'
21	'Wing in ground (WIG)'	'Wing in ground (WIG), Hazardous category A'
22	'Wing in ground (WIG)'	'Wing in ground (WIG), Hazardous category B'
23	'Wing in ground (WIG)'	'Wing in ground (WIG), Hazardous category C'
24	'Wing in ground (WIG)'	'Wing in ground (WIG), Hazardous category D'
25	'Wing in ground (WIG)'	'Wing in ground (WIG), Reserved for future use'
26	'Wing in ground (WIG)'	'Wing in ground (WIG), Reserved for future use'
27	'Wing in ground (WIG)'	'Wing in ground (WIG), Reserved for future use'
28	'Wing in ground (WIG)'	'Wing in ground (WIG), Reserved for future use'
29	'Wing in ground (WIG)'	'Wing in ground (WIG), Reserved for future use'
30	Fishing	Fishing
31	Towing	Towing
32	'Towing: length exceeds 200m or breadth exceeds 25m'	'Towing: length exceeds 200m or breadth exceeds 25m'
33	'Dredging or underwater ops'	'Dredging or underwater ops'
34	'Diving ops'	'Diving ops'
35	'Military ops'	'Military ops'
36	Sailing	Sailing
37	'Pleasure Craft'	'Pleasure Craft'
38	Reserved	Reserved
39	Reserved	Reserved
40	'High speed craft (HSC)'	'High speed craft (HSC), all ships of this type'
41	'High speed craft (HSC)'	'High speed craft (HSC), Hazardous category A'
42	'High speed craft (HSC)'	'High speed craft (HSC), Hazardous category B'
43	'High speed craft (HSC)'	'High speed craft (HSC), Hazardous category C'
44	'High speed craft (HSC)'	'High speed craft (HSC), Hazardous category D'
45	'High speed craft (HSC)'	'High speed craft (HSC), Reserved for future use'
46	'High speed craft (HSC)'	'High speed craft (HSC), Reserved for future use'
47	'High speed craft (HSC)'	'High speed craft (HSC), Reserved for future use'
48	'High speed craft (HSC)'	'High speed craft (HSC), Reserved for future use'
49	'High speed craft (HSC)'	'High speed craft (HSC), No additional information'
50	'Pilot Vessel'	'Pilot Vessel'
51	'Search and Rescue vessel'	'Search and Rescue vessel'
52	Tug	Tug
53	'Port Tender'	'Port Tender'
54	'Anti-pollution equipment'	'Anti-pollution equipment'
55	'Law Enforcement'	'Law Enforcement'
56	'Spare - Local Vessel'	'Spare - Local Vessel'
57	'Spare - Local Vessel'	'Spare - Local Vessel'
58	'Medical Transport'	'Medical Transport'
59	'Noncombatant ship according to RR Resolution No. 18'	'Noncombatant ship according to RR Resolution No. 18'
60	Passenger	'Passenger, all ships of this type'
61	Passenger	'Passenger, Hazardous category A'
62	Passenger	'Passenger, Hazardous category B'
63	Passenger	'Passenger, Hazardous category C'
64	Passenger	'Passenger, Hazardous category D'
65	Passenger	'Passenger, Reserved for future use'
66	Passenger	'Passenger, Reserved for future use'
67	Passenger	'Passenger, Reserved for future use'
68	Passenger	'Passenger, Reserved for future use'
69	Passenger	'Passenger, No additional information'
70	Cargo	'Cargo, all ships of this type'
71	Cargo	'Cargo, Hazardous category A'
72	Cargo	'Cargo, Hazardous category B'
73	Cargo	'Cargo, Hazardous category C'
74	Cargo	'Cargo, Hazardous category D'
75	Cargo	'Cargo, Reserved for future use'
76	Cargo	'Cargo, Reserved for future use'
77	Cargo	'Cargo, Reserved for future use'
78	Cargo	'Cargo, Reserved for future use'
79	Cargo	'Cargo, No additional information'
80	Tanker	'Tanker, all ships of this type'
81	Tanker	'Tanker, Hazardous category A'
82	Tanker	'Tanker, Hazardous category B'
83	Tanker	'Tanker, Hazardous category C'
84	Tanker	'Tanker, Hazardous category D'
85	Tanker	'Tanker, Reserved for future use'
86	Tanker	'Tanker, Reserved for future use'
87	Tanker	'Tanker, Reserved for future use'
88	Tanker	'Tanker, Reserved for future use'
89	Tanker	'Tanker, No additional information'
90	'Other Type'	'Other Type, all ships of this type'
91	'Other Type'	'Other Type, Hazardous category A'
92	'Other Type'	'Other Type, Hazardous category B'
93	'Other Type'	'Other Type, Hazardous category C'
94	'Other Type'	'Other Type, Hazardous category D'
95	'Other Type'	'Other Type, Reserved for future use'
96	'Other Type'	'Other Type, Reserved for future use'
97	'Other Type'	'Other Type, Reserved for future use'
98	'Other Type'	'Other Type, Reserved for future use'
99	'Other Type'	'Other Type, no additional information'
100	'Other Type'	'Navigation Aid'
101	'Other Type'	'Reference Point'
102	'Other Type'	'RACON'
103	'Other Type'	'OffShore Structure'
104	'Other Type'	'Spare'
105	'Other Type'	'Light, without Sectors'
106	'Other Type'	'Light, with Sectors'
107	'Other Type'	'Leading Light Front'
108	'Other Type'	'Leading Light Rear'
109	'Other Type'	'Beacon, Cardinal N'
110	'Other Type'	'Beacon, Cardinal E'
111	'Other Type'	'Beacon, Cardinal S'
112	'Other Type'	'Beacon, Cardinal W'
113	'Other Type'	'Beacon, Port Hand'
114	'Other Type'	'Beacon, Starboard Hand'
115	'Other Type'	'Beacon, Preferred Channel Port hand'
116	'Other Type'	'Beacon, Preferred Channel Starboard hand'
117	'Other Type'	'Beacon, Isolated danger'
118	'Other Type'	'Beacon, Safe Water'
119	'Other Type'	'Beacon, Special Mark'
120	'Other Type'	'Cardinal Mark N'
121	'Other Type'	'Cardinal Mark E'
122	'Other Type'	'Cardinal Mark S'
123	'Other Type'	'Cardinal Mark W'
124	'Other Type'	'Port Hand Mark'
125	'Other Type'	'Starboard Hand Mark'
126	'Other Type'	'Preferred Channel Port Hand'
127	'Other Type'	'Preferred Channel Starboard Hand'
128	'Other Type'	'Isolated Danger'
129	'Other Type'	'Safe Water'
130	'Other Type'	'Manned VTS'
131	'Other Type'	'Light Vessel'
132	'Other Type'	' Reserved for regional use'
133	'Other Type'	' Reserved for regional use'
134	'Other Type'	' Reserved for regional use'
135	'Other Type'	' Reserved for regional use'
136	'Other Type'	' Reserved for regional use'
137	'Other Type'	' Reserved for regional use'
138	'Other Type'	' Reserved for regional use'
139	'Other Type'	' Reserved for regional use'
140	'Other Type'	' Reserved for regional use'
141	'Other Type'	' Reserved for regional use'
142	'Other Type'	' Reserved for regional use'
143	'Other Type'	' Reserved for regional use'
144	'Other Type'	' Reserved for regional use'
145	'Other Type'	' Reserved for regional use'
146	'Other Type'	' Reserved for regional use'
147	'Other Type'	' Reserved for regional use'
148	'Other Type'	' Reserved for regional use'
149	'Other Type'	' Reserved for regional use'
150	'Other Type'	' Reserved for regional use'
151	'Other Type'	' Reserved for regional use'
152	'Other Type'	' Reserved for regional use'
153	'Other Type'	' Reserved for regional use'
154	'Other Type'	' Reserved for regional use'
155	'Other Type'	' Reserved for regional use'
156	'Other Type'	' Reserved for regional use'
157	'Other Type'	' Reserved for regional use'
158	'Other Type'	' Reserved for regional use'
159	'Other Type'	' Reserved for regional use'
160	'Other Type'	' Reserved for regional use'
161	'Other Type'	' Reserved for regional use'
162	'Other Type'	' Reserved for regional use'
163	'Other Type'	' Reserved for regional use'
164	'Other Type'	' Reserved for regional use'
165	'Other Type'	' Reserved for regional use'
166	'Other Type'	' Reserved for regional use'
167	'Other Type'	' Reserved for regional use'
168	'Other Type'	' Reserved for regional use'
169	'Other Type'	' Reserved for regional use'
170	'Other Type'	' Reserved for regional use'
171	'Other Type'	' Reserved for regional use'
172	'Other Type'	' Reserved for regional use'
173	'Other Type'	' Reserved for regional use'
174	'Other Type'	' Reserved for regional use'
175	'Other Type'	' Reserved for regional use'
176	'Other Type'	' Reserved for regional use'
177	'Other Type'	' Reserved for regional use'
178	'Other Type'	' Reserved for regional use'
179	'Other Type'	' Reserved for regional use'
180	'Other Type'	' Reserved for regional use'
181	'Other Type'	' Reserved for regional use'
182	'Other Type'	' Reserved for regional use'
183	'Other Type'	' Reserved for regional use'
184	'Other Type'	' Reserved for regional use'
185	'Other Type'	' Reserved for regional use'
186	'Other Type'	' Reserved for regional use'
187	'Other Type'	' Reserved for regional use'
188	'Other Type'	' Reserved for regional use'
189	'Other Type'	' Reserved for regional use'
190	'Other Type'	' Reserved for regional use'
191	'Other Type'	' Reserved for regional use'
192	'Other Type'	' Reserved for regional use'
193	'Other Type'	' Reserved for regional use'
194	'Other Type'	' Reserved for regional use'
195	'Other Type'	' Reserved for regional use'
196	'Other Type'	' Reserved for regional use'
197	'Other Type'	' Reserved for regional use'
198	'Other Type'	' Reserved for regional use'
199	'Other Type'	' Reserved for regional use'
200	'Other Type'	' Reserved for future use'
201	'Other Type'	' Reserved for future use'
202	'Other Type'	' Reserved for future use'
203	'Other Type'	' Reserved for future use'
204	'Other Type'	' Reserved for future use'
205	'Other Type'	' Reserved for future use'
206	'Other Type'	' Reserved for future use'
207	'Other Type'	' Reserved for future use'
208	'Other Type'	' Reserved for future use'
209	'Other Type'	' Reserved for future use'
210	'Other Type'	' Reserved for future use'
211	'Other Type'	' Reserved for future use'
212	'Other Type'	' Reserved for future use'
213	'Other Type'	' Reserved for future use'
214	'Other Type'	' Reserved for future use'
215	'Other Type'	' Reserved for future use'
216	'Other Type'	' Reserved for future use'
217	'Other Type'	' Reserved for future use'
218	'Other Type'	' Reserved for future use'
219	'Other Type'	' Reserved for future use'
220	'Other Type'	' Reserved for future use'
221	'Other Type'	' Reserved for future use'
222	'Other Type'	' Reserved for future use'
223	'Other Type'	' Reserved for future use'
224	'Other Type'	' Reserved for future use'
225	'Other Type'	' Reserved for future use'
226	'Other Type'	' Reserved for future use'
227	'Other Type'	' Reserved for future use'
228	'Other Type'	' Reserved for future use'
229	'Other Type'	' Reserved for future use'
230	'Other Type'	' Reserved for future use'
231	'Other Type'	' Reserved for future use'
232	'Other Type'	' Reserved for future use'
233	'Other Type'	' Reserved for future use'
234	'Other Type'	' Reserved for future use'
235	'Other Type'	' Reserved for future use'
236	'Other Type'	' Reserved for future use'
237	'Other Type'	' Reserved for future use'
238	'Other Type'	' Reserved for future use'
239	'Other Type'	' Reserved for future use'
240	'Other Type'	' Reserved for future use'
241	'Other Type'	' Reserved for future use'
242	'Other Type'	' Reserved for future use'
243	'Other Type'	' Reserved for future use'
244	'Other Type'	' Reserved for future use'
245	'Other Type'	' Reserved for future use'
246	'Other Type'	' Reserved for future use'
247	'Other Type'	' Reserved for future use'
248	'Other Type'	' Reserved for future use'
249	'Other Type'	' Reserved for future use'
250	'Other Type'	' Reserved for future use'
251	'Other Type'	' Reserved for future use'
252	'Other Type'	' Reserved for future use'
253	'Other Type'	' Reserved for future use'
254	'Other Type'	' Reserved for future use'
255	'Other Type'	' Reserved for future use'
256	'Other Type'	'No designation'
257	'Other Type'	'No designation'
258	'Other Type'	'No designation'
259	'Other Type'	'No designation'
260	'Other Type'	'No designation'
261	'Other Type'	'No designation'
262	'Other Type'	'No designation'
263	'Other Type'	'No designation'
264	'Other Type'	'No designation'
265	'Other Type'	'No designation'
266	'Other Type'	'No designation'
267	'Other Type'	'No designation'
268	'Other Type'	'No designation'
269	'Other Type'	'No designation'
270	'Other Type'	'No designation'
271	'Other Type'	'No designation'
272	'Other Type'	'No designation'
273	'Other Type'	'No designation'
274	'Other Type'	'No designation'
275	'Other Type'	'No designation'
276	'Other Type'	'No designation'
277	'Other Type'	'No designation'
278	'Other Type'	'No designation'
279	'Other Type'	'No designation'
280	'Other Type'	'No designation'
281	'Other Type'	'No designation'
282	'Other Type'	'No designation'
283	'Other Type'	'No designation'
284	'Other Type'	'No designation'
285	'Other Type'	'No designation'
286	'Other Type'	'No designation'
287	'Other Type'	'No designation'
288	'Other Type'	'No designation'
289	'Other Type'	'No designation'
290	'Other Type'	'No designation'
291	'Other Type'	'No designation'
292	'Other Type'	'No designation'
293	'Other Type'	'No designation'
294	'Other Type'	'No designation'
295	'Other Type'	'No designation'
296	'Other Type'	'No designation'
297	'Other Type'	'No designation'
298	'Other Type'	'No designation'
299	'Other Type'	'No designation'
300	'Other Type'	'No designation'
301	'Other Type'	'No designation'
302	'Other Type'	'No designation'
303	'Other Type'	'No designation'
304	'Other Type'	'No designation'
305	'Other Type'	'No designation'
306	'Other Type'	'No designation'
307	'Other Type'	'No designation'
308	'Other Type'	'No designation'
309	'Other Type'	'No designation'
310	'Other Type'	'No designation'
311	'Other Type'	'No designation'
312	'Other Type'	'No designation'
313	'Other Type'	'No designation'
314	'Other Type'	'No designation'
315	'Other Type'	'No designation'
316	'Other Type'	'No designation'
317	'Other Type'	'No designation'
318	'Other Type'	'No designation'
319	'Other Type'	'No designation'
320	'Other Type'	'No designation'
321	'Other Type'	'No designation'
322	'Other Type'	'No designation'
323	'Other Type'	'No designation'
324	'Other Type'	'No designation'
325	'Other Type'	'No designation'
326	'Other Type'	'No designation'
327	'Other Type'	'No designation'
328	'Other Type'	'No designation'
329	'Other Type'	'No designation'
330	'Other Type'	'No designation'
331	'Other Type'	'No designation'
332	'Other Type'	'No designation'
333	'Other Type'	'No designation'
334	'Other Type'	'No designation'
335	'Other Type'	'No designation'
336	'Other Type'	'No designation'
337	'Other Type'	'No designation'
338	'Other Type'	'No designation'
339	'Other Type'	'No designation'
340	'Other Type'	'No designation'
341	'Other Type'	'No designation'
342	'Other Type'	'No designation'
343	'Other Type'	'No designation'
344	'Other Type'	'No designation'
345	'Other Type'	'No designation'
346	'Other Type'	'No designation'
347	'Other Type'	'No designation'
348	'Other Type'	'No designation'
349	'Other Type'	'No designation'
350	'Other Type'	'No designation'
351	'Other Type'	'No designation'
352	'Other Type'	'No designation'
353	'Other Type'	'No designation'
354	'Other Type'	'No designation'
355	'Other Type'	'No designation'
356	'Other Type'	'No designation'
357	'Other Type'	'No designation'
358	'Other Type'	'No designation'
359	'Other Type'	'No designation'
360	'Other Type'	'No designation'
361	'Other Type'	'No designation'
362	'Other Type'	'No designation'
363	'Other Type'	'No designation'
364	'Other Type'	'No designation'
365	'Other Type'	'No designation'
366	'Other Type'	'No designation'
367	'Other Type'	'No designation'
368	'Other Type'	'No designation'
369	'Other Type'	'No designation'
370	'Other Type'	'No designation'
371	'Other Type'	'No designation'
372	'Other Type'	'No designation'
373	'Other Type'	'No designation'
374	'Other Type'	'No designation'
375	'Other Type'	'No designation'
376	'Other Type'	'No designation'
377	'Other Type'	'No designation'
378	'Other Type'	'No designation'
379	'Other Type'	'No designation'
380	'Other Type'	'No designation'
381	'Other Type'	'No designation'
382	'Other Type'	'No designation'
383	'Other Type'	'No designation'
384	'Other Type'	'No designation'
385	'Other Type'	'No designation'
386	'Other Type'	'No designation'
387	'Other Type'	'No designation'
388	'Other Type'	'No designation'
389	'Other Type'	'No designation'
390	'Other Type'	'No designation'
391	'Other Type'	'No designation'
392	'Other Type'	'No designation'
393	'Other Type'	'No designation'
394	'Other Type'	'No designation'
395	'Other Type'	'No designation'
396	'Other Type'	'No designation'
397	'Other Type'	'No designation'
398	'Other Type'	'No designation'
399	'Other Type'	'No designation'
400	'Other Type'	'No designation'
401	'Other Type'	'No designation'
402	'Other Type'	'No designation'
403	'Other Type'	'No designation'
404	'Other Type'	'No designation'
405	'Other Type'	'No designation'
406	'Other Type'	'No designation'
407	'Other Type'	'No designation'
408	'Other Type'	'No designation'
409	'Other Type'	'No designation'
410	'Other Type'	'No designation'
411	'Other Type'	'No designation'
412	'Other Type'	'No designation'
413	'Other Type'	'No designation'
414	'Other Type'	'No designation'
415	'Other Type'	'No designation'
416	'Other Type'	'No designation'
417	'Other Type'	'No designation'
418	'Other Type'	'No designation'
419	'Other Type'	'No designation'
420	'Other Type'	'No designation'
421	'Other Type'	'No designation'
422	'Other Type'	'No designation'
423	'Other Type'	'No designation'
424	'Other Type'	'No designation'
425	'Other Type'	'No designation'
426	'Other Type'	'No designation'
427	'Other Type'	'No designation'
428	'Other Type'	'No designation'
429	'Other Type'	'No designation'
430	'Other Type'	'No designation'
431	'Other Type'	'No designation'
432	'Other Type'	'No designation'
433	'Other Type'	'No designation'
434	'Other Type'	'No designation'
435	'Other Type'	'No designation'
436	'Other Type'	'No designation'
437	'Other Type'	'No designation'
438	'Other Type'	'No designation'
439	'Other Type'	'No designation'
440	'Other Type'	'No designation'
441	'Other Type'	'No designation'
442	'Other Type'	'No designation'
443	'Other Type'	'No designation'
444	'Other Type'	'No designation'
445	'Other Type'	'No designation'
446	'Other Type'	'No designation'
447	'Other Type'	'No designation'
448	'Other Type'	'No designation'
449	'Other Type'	'No designation'
450	'Other Type'	'No designation'
451	'Other Type'	'No designation'
452	'Other Type'	'No designation'
453	'Other Type'	'No designation'
454	'Other Type'	'No designation'
455	'Other Type'	'No designation'
456	'Other Type'	'No designation'
457	'Other Type'	'No designation'
458	'Other Type'	'No designation'
459	'Other Type'	'No designation'
460	'Other Type'	'No designation'
461	'Other Type'	'No designation'
462	'Other Type'	'No designation'
463	'Other Type'	'No designation'
464	'Other Type'	'No designation'
465	'Other Type'	'No designation'
466	'Other Type'	'No designation'
467	'Other Type'	'No designation'
468	'Other Type'	'No designation'
469	'Other Type'	'No designation'
470	'Other Type'	'No designation'
471	'Other Type'	'No designation'
472	'Other Type'	'No designation'
473	'Other Type'	'No designation'
474	'Other Type'	'No designation'
475	'Other Type'	'No designation'
476	'Other Type'	'No designation'
477	'Other Type'	'No designation'
478	'Other Type'	'No designation'
479	'Other Type'	'No designation'
480	'Other Type'	'No designation'
481	'Other Type'	'No designation'
482	'Other Type'	'No designation'
483	'Other Type'	'No designation'
484	'Other Type'	'No designation'
485	'Other Type'	'No designation'
486	'Other Type'	'No designation'
487	'Other Type'	'No designation'
488	'Other Type'	'No designation'
489	'Other Type'	'No designation'
490	'Other Type'	'No designation'
491	'Other Type'	'No designation'
492	'Other Type'	'No designation'
493	'Other Type'	'No designation'
494	'Other Type'	'No designation'
495	'Other Type'	'No designation'
496	'Other Type'	'No designation'
497	'Other Type'	'No designation'
498	'Other Type'	'No designation'
499	'Other Type'	'No designation'
500	'Other Type'	'No designation'
501	'Other Type'	'No designation'
502	'Other Type'	'No designation'
503	'Other Type'	'No designation'
504	'Other Type'	'No designation'
505	'Other Type'	'No designation'
506	'Other Type'	'No designation'
507	'Other Type'	'No designation'
508	'Other Type'	'No designation'
509	'Other Type'	'No designation'
510	'Other Type'	'No designation'
511	'Other Type'	'No designation'
512	'Other Type'	'No designation'
513	'Other Type'	'No designation'
514	'Other Type'	'No designation'
515	'Other Type'	'No designation'
516	'Other Type'	'No designation'
517	'Other Type'	'No designation'
518	'Other Type'	'No designation'
519	'Other Type'	'No designation'
520	'Other Type'	'No designation'
521	'Other Type'	'No designation'
522	'Other Type'	'No designation'
523	'Other Type'	'No designation'
524	'Other Type'	'No designation'
525	'Other Type'	'No designation'
526	'Other Type'	'No designation'
527	'Other Type'	'No designation'
528	'Other Type'	'No designation'
529	'Other Type'	'No designation'
530	'Other Type'	'No designation'
531	'Other Type'	'No designation'
532	'Other Type'	'No designation'
533	'Other Type'	'No designation'
534	'Other Type'	'No designation'
535	'Other Type'	'No designation'
536	'Other Type'	'No designation'
537	'Other Type'	'No designation'
538	'Other Type'	'No designation'
539	'Other Type'	'No designation'
540	'Other Type'	'No designation'
541	'Other Type'	'No designation'
542	'Other Type'	'No designation'
543	'Other Type'	'No designation'
544	'Other Type'	'No designation'
545	'Other Type'	'No designation'
546	'Other Type'	'No designation'
547	'Other Type'	'No designation'
548	'Other Type'	'No designation'
549	'Other Type'	'No designation'
550	'Other Type'	'No designation'
551	'Other Type'	'No designation'
552	'Other Type'	'No designation'
553	'Other Type'	'No designation'
554	'Other Type'	'No designation'
555	'Other Type'	'No designation'
556	'Other Type'	'No designation'
557	'Other Type'	'No designation'
558	'Other Type'	'No designation'
559	'Other Type'	'No designation'
560	'Other Type'	'No designation'
561	'Other Type'	'No designation'
562	'Other Type'	'No designation'
563	'Other Type'	'No designation'
564	'Other Type'	'No designation'
565	'Other Type'	'No designation'
566	'Other Type'	'No designation'
567	'Other Type'	'No designation'
568	'Other Type'	'No designation'
569	'Other Type'	'No designation'
570	'Other Type'	'No designation'
571	'Other Type'	'No designation'
572	'Other Type'	'No designation'
573	'Other Type'	'No designation'
574	'Other Type'	'No designation'
575	'Other Type'	'No designation'
576	'Other Type'	'No designation'
577	'Other Type'	'No designation'
578	'Other Type'	'No designation'
579	'Other Type'	'No designation'
580	'Other Type'	'No designation'
581	'Other Type'	'No designation'
582	'Other Type'	'No designation'
583	'Other Type'	'No designation'
584	'Other Type'	'No designation'
585	'Other Type'	'No designation'
586	'Other Type'	'No designation'
587	'Other Type'	'No designation'
588	'Other Type'	'No designation'
589	'Other Type'	'No designation'
590	'Other Type'	'No designation'
591	'Other Type'	'No designation'
592	'Other Type'	'No designation'
593	'Other Type'	'No designation'
594	'Other Type'	'No designation'
595	'Other Type'	'No designation'
596	'Other Type'	'No designation'
597	'Other Type'	'No designation'
598	'Other Type'	'No designation'
599	'Other Type'	'No designation'
600	'Other Type'	'No designation'
601	'Other Type'	'No designation'
602	'Other Type'	'No designation'
603	'Other Type'	'No designation'
604	'Other Type'	'No designation'
605	'Other Type'	'No designation'
606	'Other Type'	'No designation'
607	'Other Type'	'No designation'
608	'Other Type'	'No designation'
609	'Other Type'	'No designation'
610	'Other Type'	'No designation'
611	'Other Type'	'No designation'
612	'Other Type'	'No designation'
613	'Other Type'	'No designation'
614	'Other Type'	'No designation'
615	'Other Type'	'No designation'
616	'Other Type'	'No designation'
617	'Other Type'	'No designation'
618	'Other Type'	'No designation'
619	'Other Type'	'No designation'
620	'Other Type'	'No designation'
621	'Other Type'	'No designation'
622	'Other Type'	'No designation'
623	'Other Type'	'No designation'
624	'Other Type'	'No designation'
625	'Other Type'	'No designation'
626	'Other Type'	'No designation'
627	'Other Type'	'No designation'
628	'Other Type'	'No designation'
629	'Other Type'	'No designation'
630	'Other Type'	'No designation'
631	'Other Type'	'No designation'
632	'Other Type'	'No designation'
633	'Other Type'	'No designation'
634	'Other Type'	'No designation'
635	'Other Type'	'No designation'
636	'Other Type'	'No designation'
637	'Other Type'	'No designation'
638	'Other Type'	'No designation'
639	'Other Type'	'No designation'
640	'Other Type'	'No designation'
641	'Other Type'	'No designation'
642	'Other Type'	'No designation'
643	'Other Type'	'No designation'
644	'Other Type'	'No designation'
645	'Other Type'	'No designation'
646	'Other Type'	'No designation'
647	'Other Type'	'No designation'
648	'Other Type'	'No designation'
649	'Other Type'	'No designation'
650	'Other Type'	'No designation'
651	'Other Type'	'No designation'
652	'Other Type'	'No designation'
653	'Other Type'	'No designation'
654	'Other Type'	'No designation'
655	'Other Type'	'No designation'
656	'Other Type'	'No designation'
657	'Other Type'	'No designation'
658	'Other Type'	'No designation'
659	'Other Type'	'No designation'
660	'Other Type'	'No designation'
661	'Other Type'	'No designation'
662	'Other Type'	'No designation'
663	'Other Type'	'No designation'
664	'Other Type'	'No designation'
665	'Other Type'	'No designation'
666	'Other Type'	'No designation'
667	'Other Type'	'No designation'
668	'Other Type'	'No designation'
669	'Other Type'	'No designation'
670	'Other Type'	'No designation'
671	'Other Type'	'No designation'
672	'Other Type'	'No designation'
673	'Other Type'	'No designation'
674	'Other Type'	'No designation'
675	'Other Type'	'No designation'
676	'Other Type'	'No designation'
677	'Other Type'	'No designation'
678	'Other Type'	'No designation'
679	'Other Type'	'No designation'
680	'Other Type'	'No designation'
681	'Other Type'	'No designation'
682	'Other Type'	'No designation'
683	'Other Type'	'No designation'
684	'Other Type'	'No designation'
685	'Other Type'	'No designation'
686	'Other Type'	'No designation'
687	'Other Type'	'No designation'
688	'Other Type'	'No designation'
689	'Other Type'	'No designation'
690	'Other Type'	'No designation'
691	'Other Type'	'No designation'
692	'Other Type'	'No designation'
693	'Other Type'	'No designation'
694	'Other Type'	'No designation'
695	'Other Type'	'No designation'
696	'Other Type'	'No designation'
697	'Other Type'	'No designation'
698	'Other Type'	'No designation'
699	'Other Type'	'No designation'
700	'Other Type'	'No designation'
701	'Other Type'	'No designation'
702	'Other Type'	'No designation'
703	'Other Type'	'No designation'
704	'Other Type'	'No designation'
705	'Other Type'	'No designation'
706	'Other Type'	'No designation'
707	'Other Type'	'No designation'
708	'Other Type'	'No designation'
709	'Other Type'	'No designation'
710	'Other Type'	'No designation'
711	'Other Type'	'No designation'
712	'Other Type'	'No designation'
713	'Other Type'	'No designation'
714	'Other Type'	'No designation'
715	'Other Type'	'No designation'
716	'Other Type'	'No designation'
717	'Other Type'	'No designation'
718	'Other Type'	'No designation'
719	'Other Type'	'No designation'
720	'Other Type'	'No designation'
721	'Other Type'	'No designation'
722	'Other Type'	'No designation'
723	'Other Type'	'No designation'
724	'Other Type'	'No designation'
725	'Other Type'	'No designation'
726	'Other Type'	'No designation'
727	'Other Type'	'No designation'
728	'Other Type'	'No designation'
729	'Other Type'	'No designation'
730	'Other Type'	'No designation'
731	'Other Type'	'No designation'
732	'Other Type'	'No designation'
733	'Other Type'	'No designation'
734	'Other Type'	'No designation'
735	'Other Type'	'No designation'
736	'Other Type'	'No designation'
737	'Other Type'	'No designation'
738	'Other Type'	'No designation'
739	'Other Type'	'No designation'
740	'Other Type'	'No designation'
741	'Other Type'	'No designation'
742	'Other Type'	'No designation'
743	'Other Type'	'No designation'
744	'Other Type'	'No designation'
745	'Other Type'	'No designation'
746	'Other Type'	'No designation'
747	'Other Type'	'No designation'
748	'Other Type'	'No designation'
749	'Other Type'	'No designation'
750	'Other Type'	'No designation'
751	'Other Type'	'No designation'
752	'Other Type'	'No designation'
753	'Other Type'	'No designation'
754	'Other Type'	'No designation'
755	'Other Type'	'No designation'
756	'Other Type'	'No designation'
757	'Other Type'	'No designation'
758	'Other Type'	'No designation'
759	'Other Type'	'No designation'
760	'Other Type'	'No designation'
761	'Other Type'	'No designation'
762	'Other Type'	'No designation'
763	'Other Type'	'No designation'
764	'Other Type'	'No designation'
765	'Other Type'	'No designation'
766	'Other Type'	'No designation'
767	'Other Type'	'No designation'
768	'Other Type'	'No designation'
769	'Other Type'	'No designation'
770	'Other Type'	'No designation'
771	'Other Type'	'No designation'
772	'Other Type'	'No designation'
773	'Other Type'	'No designation'
774	'Other Type'	'No designation'
775	'Other Type'	'No designation'
776	'Other Type'	'No designation'
777	'Other Type'	'No designation'
778	'Other Type'	'No designation'
779	'Other Type'	'No designation'
780	'Other Type'	'No designation'
781	'Other Type'	'No designation'
782	'Other Type'	'No designation'
783	'Other Type'	'No designation'
784	'Other Type'	'No designation'
785	'Other Type'	'No designation'
786	'Other Type'	'No designation'
787	'Other Type'	'No designation'
788	'Other Type'	'No designation'
789	'Other Type'	'No designation'
790	'Other Type'	'No designation'
791	'Other Type'	'No designation'
792	'Other Type'	'No designation'
793	'Other Type'	'No designation'
794	'Other Type'	'No designation'
795	'Other Type'	'No designation'
796	'Other Type'	'No designation'
797	'Other Type'	'No designation'
798	'Other Type'	'No designation'
799	'Other Type'	'No designation'
800	'Other Type'	'No designation'
801	'Other Type'	'No designation'
802	'Other Type'	'No designation'
803	'Other Type'	'No designation'
804	'Other Type'	'No designation'
805	'Other Type'	'No designation'
806	'Other Type'	'No designation'
807	'Other Type'	'No designation'
808	'Other Type'	'No designation'
809	'Other Type'	'No designation'
810	'Other Type'	'No designation'
811	'Other Type'	'No designation'
812	'Other Type'	'No designation'
813	'Other Type'	'No designation'
814	'Other Type'	'No designation'
815	'Other Type'	'No designation'
816	'Other Type'	'No designation'
817	'Other Type'	'No designation'
818	'Other Type'	'No designation'
819	'Other Type'	'No designation'
820	'Other Type'	'No designation'
821	'Other Type'	'No designation'
822	'Other Type'	'No designation'
823	'Other Type'	'No designation'
824	'Other Type'	'No designation'
825	'Other Type'	'No designation'
826	'Other Type'	'No designation'
827	'Other Type'	'No designation'
828	'Other Type'	'No designation'
829	'Other Type'	'No designation'
830	'Other Type'	'No designation'
831	'Other Type'	'No designation'
832	'Other Type'	'No designation'
833	'Other Type'	'No designation'
834	'Other Type'	'No designation'
835	'Other Type'	'No designation'
836	'Other Type'	'No designation'
837	'Other Type'	'No designation'
838	'Other Type'	'No designation'
839	'Other Type'	'No designation'
840	'Other Type'	'No designation'
841	'Other Type'	'No designation'
842	'Other Type'	'No designation'
843	'Other Type'	'No designation'
844	'Other Type'	'No designation'
845	'Other Type'	'No designation'
846	'Other Type'	'No designation'
847	'Other Type'	'No designation'
848	'Other Type'	'No designation'
849	'Other Type'	'No designation'
850	'Other Type'	'No designation'
851	'Other Type'	'No designation'
852	'Other Type'	'No designation'
853	'Other Type'	'No designation'
854	'Other Type'	'No designation'
855	'Other Type'	'No designation'
856	'Other Type'	'No designation'
857	'Other Type'	'No designation'
858	'Other Type'	'No designation'
859	'Other Type'	'No designation'
860	'Other Type'	'No designation'
861	'Other Type'	'No designation'
862	'Other Type'	'No designation'
863	'Other Type'	'No designation'
864	'Other Type'	'No designation'
865	'Other Type'	'No designation'
866	'Other Type'	'No designation'
867	'Other Type'	'No designation'
868	'Other Type'	'No designation'
869	'Other Type'	'No designation'
870	'Other Type'	'No designation'
871	'Other Type'	'No designation'
872	'Other Type'	'No designation'
873	'Other Type'	'No designation'
874	'Other Type'	'No designation'
875	'Other Type'	'No designation'
876	'Other Type'	'No designation'
877	'Other Type'	'No designation'
878	'Other Type'	'No designation'
879	'Other Type'	'No designation'
880	'Other Type'	'No designation'
881	'Other Type'	'No designation'
882	'Other Type'	'No designation'
883	'Other Type'	'No designation'
884	'Other Type'	'No designation'
885	'Other Type'	'No designation'
886	'Other Type'	'No designation'
887	'Other Type'	'No designation'
888	'Other Type'	'No designation'
889	'Other Type'	'No designation'
890	'Other Type'	'No designation'
891	'Other Type'	'No designation'
892	'Other Type'	'No designation'
893	'Other Type'	'No designation'
894	'Other Type'	'No designation'
895	'Other Type'	'No designation'
896	'Other Type'	'No designation'
897	'Other Type'	'No designation'
898	'Other Type'	'No designation'
899	'Other Type'	'No designation'
900	'Other Type'	'No designation'
901	'Other Type'	'No designation'
902	'Other Type'	'No designation'
903	'Other Type'	'No designation'
904	'Other Type'	'No designation'
905	'Other Type'	'No designation'
906	'Other Type'	'No designation'
907	'Other Type'	'No designation'
908	'Other Type'	'No designation'
909	'Other Type'	'No designation'
910	'Other Type'	'No designation'
911	'Other Type'	'No designation'
912	'Other Type'	'No designation'
913	'Other Type'	'No designation'
914	'Other Type'	'No designation'
915	'Other Type'	'No designation'
916	'Other Type'	'No designation'
917	'Other Type'	'No designation'
918	'Other Type'	'No designation'
919	'Other Type'	'No designation'
920	'Other Type'	'No designation'
921	'Other Type'	'No designation'
922	'Other Type'	'No designation'
923	'Other Type'	'No designation'
924	'Other Type'	'No designation'
925	'Other Type'	'No designation'
926	'Other Type'	'No designation'
927	'Other Type'	'No designation'
928	'Other Type'	'No designation'
929	'Other Type'	'No designation'
930	'Other Type'	'No designation'
931	'Other Type'	'No designation'
932	'Other Type'	'No designation'
933	'Other Type'	'No designation'
934	'Other Type'	'No designation'
935	'Other Type'	'No designation'
936	'Other Type'	'No designation'
937	'Other Type'	'No designation'
938	'Other Type'	'No designation'
939	'Other Type'	'No designation'
940	'Other Type'	'No designation'
941	'Other Type'	'No designation'
942	'Other Type'	'No designation'
943	'Other Type'	'No designation'
944	'Other Type'	'No designation'
945	'Other Type'	'No designation'
946	'Other Type'	'No designation'
947	'Other Type'	'No designation'
948	'Other Type'	'No designation'
949	'Other Type'	'No designation'
950	'Other Type'	'No designation'
951	'Other Type'	'No designation'
952	'Other Type'	'No designation'
953	'Other Type'	'No designation'
954	'Other Type'	'No designation'
955	'Other Type'	'No designation'
956	'Other Type'	'No designation'
957	'Other Type'	'No designation'
958	'Other Type'	'No designation'
959	'Other Type'	'No designation'
960	'Other Type'	'No designation'
961	'Other Type'	'No designation'
962	'Other Type'	'No designation'
963	'Other Type'	'No designation'
964	'Other Type'	'No designation'
965	'Other Type'	'No designation'
966	'Other Type'	'No designation'
967	'Other Type'	'No designation'
968	'Other Type'	'No designation'
969	'Other Type'	'No designation'
970	'Other Type'	'No designation'
971	'Other Type'	'No designation'
972	'Other Type'	'No designation'
973	'Other Type'	'No designation'
974	'Other Type'	'No designation'
975	'Other Type'	'No designation'
976	'Other Type'	'No designation'
977	'Other Type'	'No designation'
978	'Other Type'	'No designation'
979	'Other Type'	'No designation'
980	'Other Type'	'No designation'
981	'Other Type'	'No designation'
982	'Other Type'	'No designation'
983	'Other Type'	'No designation'
984	'Other Type'	'No designation'
985	'Other Type'	'No designation'
986	'Other Type'	'No designation'
987	'Other Type'	'No designation'
988	'Other Type'	'No designation'
989	'Other Type'	'No designation'
990	'Other Type'	'No designation'
991	'Other Type'	'No designation'
992	'Other Type'	'No designation'
993	'Other Type'	'No designation'
994	'Other Type'	'No designation'
995	'Other Type'	'No designation'
996	'Other Type'	'No designation'
997	'Other Type'	'No designation'
998	'Other Type'	'No designation'
999	'Other Type'	'No designation'
\.

COPY vessel.vessels (mmsi, length, width, draught, build_year, code) FROM stdin;
224096950	24.0	6.0	30.0	1970	30
224097160	25.0	7.0	30.0	1971	30
224102950	0.0	0.0	30.0	1972	30
224107960	25.0	6.0	30.0	1973	30
224126630	8.0	6.0	30.0	1974	30
224133630	23.0	6.0	30.0	1975	30
224001990	32.0	7.0	60.0	1976	60
224022660	26.0	8.0	60.0	1977	60
224588000	189.0	26.0	60.0	1978	60
224600000	172.0	28.0	60.0	1979	60
224692000	154.0	24.0	60.0	1980	60
210117000	139.0	17.0	70.0	1981	70
210754000	95.0	13.0	70.0	1982	70
212175000	334.0	43.0	70.0	1983	70
212302000	152.0	24.0	70.0	1984	70
212657000	100.0	16.0	70.0	1985	70
212772000	111.0	14.0	70.0	1986	70
215594000	145.0	21.0	80.0	1987	80
215637000	183.0	27.0	80.0	1988	80
215684000	299.0	46.0	80.0	1989	80
215685000	299.0	46.0	80.0	1990	80
215703000	176.0	31.0	80.0	1991	80
215712000	106.0	17.0	80.0	1992	80
247379500	199.0	36.0	90.0	1993	90
247456000	189.0	24.0	90.0	1994	90
248236000	135.0	11.0	90.0	1995	90
248498000	31.0	12.0	90.0	1996	90
255805601	35.0	7.0	90.0	1997	90
255996000	45.0	8.0	90.0	1998	90
255998000	24.0	6.0	30.0	2001	30
255998001	25.0	7.0	30.0	2002	30
255998002	0.0	0.0	30.0	2003	30
255998003	25.0	6.0	30.0	2004	30
255998004	8.0	6.0	30.0	2005	30
255998005	23.0	6.0	30.0	2006	30
255998006	32.0	7.0	60.0	2007	60
255998007	26.0	8.0	60.0	2008	60
255998008	189.0	26.0	60.0	2009	60
255998009	172.0	28.0	60.0	2010	60
255998010	154.0	24.0	60.0	2011	60
255998011	139.0	17.0	70.0	2012	70
255998012	95.0	13.0	70.0	2013	70
255998013	334.0	43.0	70.0	2014	70
255998014	152.0	24.0	70.0	2015	70
255998015	100.0	16.0	70.0	2016	70
255998016	111.0	14.0	70.0	2017	70
255998017	145.0	21.0	80.0	1999	80
255998018	183.0	27.0	80.0	1970	80
255998019	299.0	46.0	80.0	1971	80
255998020	299.0	46.0	80.0	1972	80
255998021	176.0	31.0	80.0	1973	80
255998022	106.0	17.0	80.0	1974	80
255998023	199.0	36.0	90.0	1975	90
255998024	189.0	24.0	90.0	1976	90
255998025	135.0	11.0	90.0	1977	90
255998026	31.0	12.0	90.0	1978	90
255998027	35.0	7.0	90.0	1979	90
255998028	45.0	8.0	90.0	1980	90
255998029	24.0	6.0	30.0	1981	30
255998030	25.0	7.0	30.0	1982	30
255998031	0.0	0.0	30.0	1983	30
255998032	25.0	6.0	30.0	1984	30
255998033	8.0	6.0	30.0	1985	30
255998034	23.0	6.0	30.0	1986	30
255998035	32.0	7.0	60.0	1987	60
255998036	26.0	8.0	60.0	1988	60
255998037	189.0	26.0	60.0	1989	60
255998038	172.0	28.0	60.0	1990	60
255998039	154.0	24.0	60.0	1991	60
255998040	139.0	17.0	70.0	1992	70
255998041	95.0	13.0	70.0	1993	70
255998042	334.0	43.0	70.0	1994	70
255998043	152.0	24.0	70.0	1995	70
255998044	100.0	16.0	70.0	1996	70
255998045	111.0	14.0	70.0	1997	70
255998046	145.0	21.0	80.0	1998	80
255998047	183.0	27.0	80.0	2001	80
255998048	299.0	46.0	80.0	2002	80
255998049	299.0	46.0	80.0	2003	80
255998050	176.0	31.0	80.0	2004	80
255998051	106.0	17.0	80.0	2005	80
255998052	199.0	36.0	90.0	2006	90
255998053	189.0	24.0	90.0	2007	90
255998054	135.0	11.0	90.0	2008	90
255998055	31.0	12.0	90.0	2009	90
255998056	35.0	7.0	90.0	2010	90
255998057	45.0	8.0	90.0	2011	90
255998058	24.0	6.0	30.0	2012	30
255998059	25.0	7.0	30.0	2013	30
255998060	0.0	0.0	30.0	2014	30
255998061	25.0	6.0	30.0	2015	30
255998062	8.0	6.0	30.0	2016	30
255998063	23.0	6.0	30.0	2017	30
255998064	32.0	7.0	60.0	1999	60
255998065	26.0	8.0	60.0	1970	60
255998066	189.0	26.0	60.0	1971	60
255998067	172.0	28.0	60.0	1972	60
255998068	154.0	24.0	60.0	1973	60
255998069	139.0	17.0	70.0	1974	70
255998070	95.0	13.0	70.0	1975	70
255998071	334.0	43.0	70.0	1976	70
255998072	152.0	24.0	70.0	1977	70
255998073	100.0	16.0	70.0	1978	70
255998074	111.0	14.0	70.0	1979	70
255998075	145.0	21.0	80.0	1980	80
255998076	183.0	27.0	80.0	1981	80
255998077	299.0	46.0	80.0	1982	80
255998078	299.0	46.0	80.0	1983	80
255998079	176.0	31.0	80.0	1984	80
255998080	106.0	17.0	80.0	1985	80
255998081	199.0	36.0	90.0	1986	90
255998082	189.0	24.0	90.0	1987	90
255998083	135.0	11.0	90.0	1988	90
255998084	31.0	12.0	90.0	1989	90
255998085	35.0	7.0	90.0	1990	90
255998086	45.0	8.0	90.0	1991	90
255998087	24.0	6.0	30.0	1992	30
255998088	25.0	7.0	30.0	1993	30
255998089	0.0	0.0	30.0	1994	30
255998090	25.0	6.0	30.0	1995	30
255998091	8.0	6.0	30.0	1996	30
255998092	23.0	6.0	30.0	1997	30
255998093	32.0	7.0	60.0	1998	60
255998094	26.0	8.0	60.0	2001	60
255998095	189.0	26.0	60.0	2002	60
255998096	172.0	28.0	60.0	2003	60
255998097	154.0	24.0	60.0	2004	60
255998098	139.0	17.0	70.0	2005	70
255998099	95.0	13.0	70.0	2006	70
255998100	334.0	43.0	70.0	2007	70
255998101	152.0	24.0	70.0	2008	70
255998102	100.0	16.0	70.0	2009	70
255998103	111.0	14.0	70.0	2010	70
255998104	145.0	21.0	80.0	2011	80
255998105	183.0	27.0	80.0	2012	80
255998106	299.0	46.0	80.0	2013	80
255998107	299.0	46.0	80.0	2014	80
255998108	176.0	31.0	80.0	2015	80
255998109	106.0	17.0	80.0	2016	80
255998110	199.0	36.0	90.0	2017	90
255998111	189.0	24.0	90.0	1999	90
255998112	135.0	11.0	90.0	1970	90
255998113	31.0	12.0	90.0	1971	90
255998114	35.0	7.0	90.0	1972	90
255998115	45.0	8.0	90.0	1973	90
255998116	24.0	6.0	30.0	1974	30
255998117	25.0	7.0	30.0	1975	30
255998118	0.0	0.0	30.0	1976	30
255998119	25.0	6.0	30.0	1977	30
255998120	8.0	6.0	30.0	1978	30
255998121	23.0	6.0	30.0	1979	30
255998122	32.0	7.0	60.0	1980	60
255998123	26.0	8.0	60.0	1981	60
255998124	189.0	26.0	60.0	1982	60
255998125	172.0	28.0	60.0	1983	60
255998126	154.0	24.0	60.0	1984	60
255998127	139.0	17.0	70.0	1985	70
255998128	95.0	13.0	70.0	1986	70
255998129	334.0	43.0	70.0	1987	70
255998130	152.0	24.0	70.0	1988	70
255998131	100.0	16.0	70.0	1989	70
255998132	111.0	14.0	70.0	1990	70
255998133	145.0	21.0	80.0	1991	80
255998134	183.0	27.0	80.0	1992	80
255998135	299.0	46.0	80.0	1993	80
255998136	299.0	46.0	80.0	1994	80
255998137	176.0	31.0	80.0	1995	80
255998138	106.0	17.0	80.0	1996	80
255998139	199.0	36.0	90.0	1997	90
255998140	189.0	24.0	90.0	1998	90
255998141	135.0	11.0	90.0	2001	90
255998142	31.0	12.0	90.0	2002	90
255998143	35.0	7.0	90.0	2003	90
255998144	45.0	8.0	90.0	2004	90
255998145	24.0	6.0	30.0	2005	30
255998146	25.0	7.0	30.0	2006	30
255998147	0.0	0.0	30.0	2007	30
255998148	25.0	6.0	30.0	2008	30
255998149	8.0	6.0	30.0	2009	30
255998150	23.0	6.0	30.0	2010	30
255998151	32.0	7.0	60.0	2011	60
255998152	26.0	8.0	60.0	2012	60
255998153	189.0	26.0	60.0	2013	60
255998154	172.0	28.0	60.0	2014	60
255998155	154.0	24.0	60.0	2015	60
255998156	139.0	17.0	70.0	2016	70
255998157	95.0	13.0	70.0	2017	70
255998158	334.0	43.0	70.0	1999	70
255998159	152.0	24.0	70.0	1970	70
255998160	100.0	16.0	70.0	1971	70
255998161	111.0	14.0	70.0	1972	70
255998162	145.0	21.0	80.0	1973	80
255998163	183.0	27.0	80.0	1974	80
255998164	299.0	46.0	80.0	1975	80
255998165	299.0	46.0	80.0	1976	80
255998166	176.0	31.0	80.0	1977	80
255998167	106.0	17.0	80.0	1978	80
255998168	199.0	36.0	90.0	1979	90
255998169	189.0	24.0	90.0	1980	90
255998170	135.0	11.0	90.0	1981	90
255998171	31.0	12.0	90.0	1982	90
255998172	35.0	7.0	90.0	1983	90
255998173	45.0	8.0	90.0	1984	90
255998174	24.0	6.0	30.0	1985	30
255998175	25.0	7.0	30.0	1986	30
255998176	0.0	0.0	30.0	1987	30
255998177	25.0	6.0	30.0	1988	30
255998178	8.0	6.0	30.0	1989	30
255998179	23.0	6.0	30.0	1990	30
255998180	32.0	7.0	60.0	1991	60
255998181	26.0	8.0	60.0	1992	60
255998182	189.0	26.0	60.0	1993	60
255998183	172.0	28.0	60.0	1994	60
255998184	154.0	24.0	60.0	1995	60
255998185	139.0	17.0	70.0	1996	70
255998186	95.0	13.0	70.0	1997	70
255998187	334.0	43.0	70.0	1998	70
255998188	152.0	24.0	70.0	2001	70
255998189	100.0	16.0	70.0	2002	70
255998190	111.0	14.0	70.0	2003	70
255998191	145.0	21.0	80.0	2004	80
255998192	183.0	27.0	80.0	2005	80
255998193	299.0	46.0	80.0	2006	80
255998194	299.0	46.0	80.0	2007	80
255998195	176.0	31.0	80.0	2008	80
255998196	106.0	17.0	80.0	2009	80
255998197	199.0	36.0	90.0	2010	90
255998198	189.0	24.0	90.0	2011	90
255998199	135.0	11.0	90.0	2012	90
255998200	31.0	12.0	90.0	2013	90
255998201	35.0	7.0	90.0	2014	90
255998202	45.0	8.0	90.0	2015	90
255998203	24.0	6.0	30.0	2016	30
255998204	25.0	7.0	30.0	2017	30
255998205	0.0	0.0	30.0	1999	30
255998206	25.0	6.0	30.0	1970	30
255998207	8.0	6.0	30.0	1971	30
255998208	23.0	6.0	30.0	1972	30
255998209	32.0	7.0	60.0	1973	60
255998210	26.0	8.0	60.0	1974	60
255998211	189.0	26.0	60.0	1975	60
255998212	172.0	28.0	60.0	1976	60
255998213	154.0	24.0	60.0	1977	60
255998214	139.0	17.0	70.0	1978	70
255998215	95.0	13.0	70.0	1979	70
255998216	334.0	43.0	70.0	1980	70
255998217	152.0	24.0	70.0	1981	70
255998218	100.0	16.0	70.0	1982	70
255998219	111.0	14.0	70.0	1983	70
255998220	145.0	21.0	80.0	1984	80
255998221	183.0	27.0	80.0	1985	80
255998222	299.0	46.0	80.0	1986	80
255998223	299.0	46.0	80.0	1987	80
255998224	176.0	31.0	80.0	1988	80
255998225	106.0	17.0	80.0	1989	80
255998226	199.0	36.0	90.0	1990	90
255998227	189.0	24.0	90.0	1991	90
255998228	135.0	11.0	90.0	1992	90
255998229	31.0	12.0	90.0	1993	90
255998230	35.0	7.0	90.0	1994	90
255998231	45.0	8.0	90.0	1995	90
255998232	24.0	6.0	30.0	1996	30
255998233	25.0	7.0	30.0	1997	30
255998234	0.0	0.0	30.0	1998	30
255998235	25.0	6.0	30.0	2001	30
255998236	8.0	6.0	30.0	2002	30
255998237	23.0	6.0	30.0	2003	30
255998238	32.0	7.0	60.0	2004	60
255998239	26.0	8.0	60.0	2005	60
255998240	189.0	26.0	60.0	2006	60
255998241	172.0	28.0	60.0	2007	60
255998242	154.0	24.0	60.0	2008	60
255998243	139.0	17.0	70.0	2009	70
255998244	95.0	13.0	70.0	2010	70
255998245	334.0	43.0	70.0	2011	70
255998246	152.0	24.0	70.0	2012	70
255998247	100.0	16.0	70.0	2013	70
255998248	111.0	14.0	70.0	2014	70
255998249	145.0	21.0	80.0	2015	80
255998250	183.0	27.0	80.0	2016	80
255998251	299.0	46.0	80.0	2017	80
255998252	299.0	46.0	80.0	1999	80
255998253	176.0	31.0	80.0	1970	80
255998254	106.0	17.0	80.0	1971	80
255998255	199.0	36.0	90.0	1972	90
255998256	189.0	24.0	90.0	1973	90
255998257	135.0	11.0	90.0	1974	90
255998258	31.0	12.0	90.0	1975	90
255998259	35.0	7.0	90.0	1976	90
255998260	45.0	8.0	90.0	1977	90
255998261	24.0	6.0	30.0	1978	30
255998262	25.0	7.0	30.0	1979	30
255998263	0.0	0.0	30.0	1980	30
255998264	25.0	6.0	30.0	1981	30
255998265	8.0	6.0	30.0	1982	30
255998266	23.0	6.0	30.0	1983	30
255998267	32.0	7.0	60.0	1984	60
255998268	26.0	8.0	60.0	1985	60
255998269	189.0	26.0	60.0	1986	60
255998270	172.0	28.0	60.0	1987	60
255998271	154.0	24.0	60.0	1988	60
255998272	139.0	17.0	70.0	1989	70
255998273	95.0	13.0	70.0	1990	70
255998274	334.0	43.0	70.0	1991	70
255998275	152.0	24.0	70.0	1992	70
255998276	100.0	16.0	70.0	1993	70
255998277	111.0	14.0	70.0	1994	70
255998278	145.0	21.0	80.0	1995	80
255998279	183.0	27.0	80.0	1996	80
255998280	299.0	46.0	80.0	1997	80
255998281	299.0	46.0	80.0	1998	80
255998282	176.0	31.0	80.0	2001	80
255998283	106.0	17.0	80.0	2002	80
255998284	199.0	36.0	90.0	2003	90
255998285	189.0	24.0	90.0	2004	90
255998286	135.0	11.0	90.0	2005	90
255998287	31.0	12.0	90.0	2006	90
255998288	35.0	7.0	90.0	2007	90
255998289	45.0	8.0	90.0	2008	90
255998290	24.0	6.0	30.0	2009	30
255998291	25.0	7.0	30.0	2010	30
255998292	0.0	0.0	30.0	2011	30
255998293	25.0	6.0	30.0	2012	30
255998294	8.0	6.0	30.0	2013	30
255998295	23.0	6.0	30.0	2014	30
255998296	32.0	7.0	60.0	2015	60
255998297	26.0	8.0	60.0	2016	60
255998298	189.0	26.0	60.0	2017	60
255998299	172.0	28.0	60.0	1999	60
255998300	154.0	24.0	60.0	1970	60
255998301	139.0	17.0	70.0	1971	70
255998302	95.0	13.0	70.0	1972	70
255998303	334.0	43.0	70.0	1973	70
255998304	152.0	24.0	70.0	1974	70
255998305	100.0	16.0	70.0	1975	70
255998306	111.0	14.0	70.0	1976	70
255998307	145.0	21.0	80.0	1977	80
255998308	183.0	27.0	80.0	1978	80
255998309	299.0	46.0	80.0	1979	80
255998310	299.0	46.0	80.0	1980	80
255998311	176.0	31.0	80.0	1981	80
255998312	106.0	17.0	80.0	1982	80
255998313	199.0	36.0	90.0	1983	90
255998314	189.0	24.0	90.0	1984	90
255998315	135.0	11.0	90.0	1985	90
255998316	31.0	12.0	90.0	1986	90
255998317	35.0	7.0	90.0	1987	90
255998318	45.0	8.0	90.0	1988	90
255998319	24.0	6.0	30.0	1989	30
255998320	25.0	7.0	30.0	1990	30
255998321	0.0	0.0	30.0	1991	30
255998322	25.0	6.0	30.0	1992	30
255998323	8.0	6.0	30.0	1993	30
255998324	23.0	6.0	30.0	1994	30
255998325	32.0	7.0	60.0	1995	60
255998326	26.0	8.0	60.0	1996	60
255998327	189.0	26.0	60.0	1997	60
255998328	172.0	28.0	60.0	1998	60
255998329	154.0	24.0	60.0	2001	60
255998330	139.0	17.0	70.0	2002	70
255998331	95.0	13.0	70.0	2003	70
255998332	334.0	43.0	70.0	2004	70
255998333	152.0	24.0	70.0	2005	70
255998334	100.0	16.0	70.0	2006	70
255998335	111.0	14.0	70.0	2007	70
255998336	145.0	21.0	80.0	2008	80
255998337	183.0	27.0	80.0	2009	80
255998338	299.0	46.0	80.0	2010	80
255998339	299.0	46.0	80.0	2011	80
255998340	176.0	31.0	80.0	2012	80
255998341	106.0	17.0	80.0	2013	80
255998342	199.0	36.0	90.0	2014	90
255998343	189.0	24.0	90.0	2015	90
255998344	135.0	11.0	90.0	2016	90
255998345	31.0	12.0	90.0	2017	90
255998346	35.0	7.0	90.0	1999	90
255998347	45.0	8.0	90.0	1970	90
255998348	24.0	6.0	30.0	1971	30
255998349	25.0	7.0	30.0	1972	30
255998350	0.0	0.0	30.0	1973	30
255998351	25.0	6.0	30.0	1974	30
255998352	8.0	6.0	30.0	1975	30
255998353	23.0	6.0	30.0	1976	30
255998354	32.0	7.0	60.0	1977	60
255998355	26.0	8.0	60.0	1978	60
255998356	189.0	26.0	60.0	1979	60
255998357	172.0	28.0	60.0	1980	60
255998358	154.0	24.0	60.0	1981	60
255998359	139.0	17.0	70.0	1982	70
255998360	95.0	13.0	70.0	1983	70
255998361	334.0	43.0	70.0	1984	70
255998362	152.0	24.0	70.0	1985	70
255998363	100.0	16.0	70.0	1986	70
255998364	111.0	14.0	70.0	1987	70
255998365	145.0	21.0	80.0	1988	80
255998366	183.0	27.0	80.0	1989	80
255998367	299.0	46.0	80.0	1990	80
255998368	299.0	46.0	80.0	1991	80
255998369	176.0	31.0	80.0	1992	80
255998370	106.0	17.0	80.0	1993	80
255998371	199.0	36.0	90.0	1994	90
255998372	189.0	24.0	90.0	1995	90
255998373	135.0	11.0	90.0	1996	90
255998374	31.0	12.0	90.0	1997	90
255998375	35.0	7.0	90.0	1998	90
255998376	45.0	8.0	90.0	2001	90
255998377	24.0	6.0	30.0	2002	30
255998378	25.0	7.0	30.0	2003	30
255998379	0.0	0.0	30.0	2004	30
\.

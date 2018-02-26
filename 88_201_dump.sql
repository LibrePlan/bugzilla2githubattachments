--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: advanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advanceassignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    reportglobaladvance boolean,
    advance_type_id bigint
);


ALTER TABLE public.advanceassignment OWNER TO naval;

--
-- Name: advancemeasurement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancemeasurement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    advance_assignment_id bigint
);


ALTER TABLE public.advancemeasurement OWNER TO naval;

--
-- Name: advancetype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancetype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    unitname character varying(255),
    defaultmaxvalue numeric(19,4),
    updatable boolean,
    unitprecision numeric(19,4),
    active boolean,
    percentage boolean
);


ALTER TABLE public.advancetype OWNER TO naval;

--
-- Name: all_criterions; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE all_criterions (
    generic_resource_allocation_id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.all_criterions OWNER TO naval;

--
-- Name: assignment_function; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE assignment_function (
    id bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.assignment_function OWNER TO naval;

--
-- Name: basecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE basecalendar (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.basecalendar OWNER TO naval;

--
-- Name: calendardata; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendardata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    parent bigint,
    expiringdate date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendardata OWNER TO naval;

--
-- Name: criterion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    active boolean,
    id_criterion_type bigint NOT NULL,
    parent bigint
);


ALTER TABLE public.criterion OWNER TO naval;

--
-- Name: criterion_type_work_report_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterion_type_work_report_type (
    work_report_type_id bigint NOT NULL,
    criterion_type_id bigint NOT NULL
);


ALTER TABLE public.criterion_type_work_report_type OWNER TO naval;

--
-- Name: criterion_work_report_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterion_work_report_line (
    work_report_line_id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.criterion_work_report_line OWNER TO naval;

--
-- Name: criterionrequirement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionrequirement (
    id bigint NOT NULL,
    criterion_requirement_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    hours_group_id bigint,
    order_element_id bigint,
    criterion_id bigint,
    parent bigint,
    isvalid boolean
);


ALTER TABLE public.criterionrequirement OWNER TO naval;

--
-- Name: criterionsatisfaction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionsatisfaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate timestamp without time zone NOT NULL,
    finishdate timestamp without time zone,
    isdeleted boolean,
    criterion bigint NOT NULL,
    resource bigint NOT NULL
);


ALTER TABLE public.criterionsatisfaction OWNER TO naval;

--
-- Name: criteriontype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criteriontype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    allowsimultaneouscriterionsperresource boolean,
    allowhierarchy boolean,
    enabled boolean,
    resource integer
);


ALTER TABLE public.criteriontype OWNER TO naval;

--
-- Name: day_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE day_assignment (
    id bigint NOT NULL,
    day_assignment_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    hours integer NOT NULL,
    day date NOT NULL,
    resource_id bigint NOT NULL,
    specific_resource_allocation_id bigint,
    generic_resource_allocation_id bigint
);


ALTER TABLE public.day_assignment OWNER TO naval;

--
-- Name: dependency; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE dependency (
    id bigint NOT NULL,
    version bigint NOT NULL,
    origin bigint,
    destination bigint,
    type integer
);


ALTER TABLE public.dependency OWNER TO naval;

--
-- Name: directadvanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE directadvanceassignment (
    advance_assignment_id bigint NOT NULL,
    direct_order_element_id bigint,
    maxvalue numeric(19,2)
);


ALTER TABLE public.directadvanceassignment OWNER TO naval;

--
-- Name: exceptionday; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE exceptionday (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    hours integer,
    base_calendar_id bigint
);


ALTER TABLE public.exceptionday OWNER TO naval;

--
-- Name: generic_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE generic_resource_allocation (
    resource_allocation_id bigint NOT NULL
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: naval
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: naval
--

SELECT pg_catalog.setval('hibernate_sequence', 1260, true);


--
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hibernate_unique_key (
    next_hi integer
);


ALTER TABLE public.hibernate_unique_key OWNER TO naval;

--
-- Name: hoursgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hoursgroup (
    id bigint NOT NULL,
    version bigint NOT NULL,
    workinghours integer,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint NOT NULL
);


ALTER TABLE public.hoursgroup OWNER TO naval;

--
-- Name: hoursperday; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hoursperday (
    base_calendar_id bigint NOT NULL,
    hours integer,
    day_id integer NOT NULL
);


ALTER TABLE public.hoursperday OWNER TO naval;

--
-- Name: indirectadvanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE indirectadvanceassignment (
    advance_assignment_id bigint NOT NULL,
    indirect_order_element_id bigint
);


ALTER TABLE public.indirectadvanceassignment OWNER TO naval;

--
-- Name: label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE label (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    label_type_id bigint
);


ALTER TABLE public.label OWNER TO naval;

--
-- Name: label_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE label_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.label_type OWNER TO naval;

--
-- Name: machine; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine (
    machine_id bigint NOT NULL,
    code character varying(255),
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.machine OWNER TO naval;

--
-- Name: machine_configuration_unit_required_criterions; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine_configuration_unit_required_criterions (
    id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.machine_configuration_unit_required_criterions OWNER TO naval;

--
-- Name: machineworkerassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machineworkerassignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate timestamp without time zone,
    finishdate timestamp without time zone,
    configuration_id bigint NOT NULL,
    worker_id bigint
);


ALTER TABLE public.machineworkerassignment OWNER TO naval;

--
-- Name: machineworkersconfigurationunit; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machineworkersconfigurationunit (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    alpha numeric(19,2) NOT NULL,
    machine bigint NOT NULL
);


ALTER TABLE public.machineworkersconfigurationunit OWNER TO naval;

--
-- Name: order_element_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_label (
    order_element_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_label OWNER TO naval;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_table (
    orderelementid bigint NOT NULL,
    responsible character varying(255),
    customer character varying(255)
);


ALTER TABLE public.order_table OWNER TO naval;

--
-- Name: orderelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    initdate timestamp without time zone,
    enddate timestamp without time zone,
    mandatoryinit boolean,
    mandatoryend boolean,
    description character varying(255),
    code character varying(255),
    parent bigint,
    positionincontainer integer,
    deadline timestamp without time zone
);


ALTER TABLE public.orderelement OWNER TO naval;

--
-- Name: orderline; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderline (
    orderelementid bigint NOT NULL
);


ALTER TABLE public.orderline OWNER TO naval;

--
-- Name: orderlinegroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinegroup (
    orderelementid bigint NOT NULL
);


ALTER TABLE public.orderlinegroup OWNER TO naval;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    calendar bigint
);


ALTER TABLE public.resource OWNER TO naval;

--
-- Name: resourceallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourceallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resourcesperday numeric(19,2),
    task bigint,
    assignment_function bigint
);


ALTER TABLE public.resourceallocation OWNER TO naval;

--
-- Name: resourcecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourcecalendar (
    base_calendar_id bigint NOT NULL
);


ALTER TABLE public.resourcecalendar OWNER TO naval;

--
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO naval;

--
-- Name: task; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    hoursgroup bigint,
    calculatedvalue integer,
    startconstrainttype integer,
    constraintdate timestamp without time zone
);


ALTER TABLE public.task OWNER TO naval;

--
-- Name: taskelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    shareofhours integer,
    name character varying(255),
    notes character varying(255),
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    order_element_id bigint,
    parent bigint,
    base_calendar_id bigint,
    positioninparent integer,
    deadline date
);


ALTER TABLE public.taskelement OWNER TO naval;

--
-- Name: taskgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskgroup (
    task_element_id bigint NOT NULL
);


ALTER TABLE public.taskgroup OWNER TO naval;

--
-- Name: taskmilestone; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskmilestone (
    task_element_id bigint NOT NULL
);


ALTER TABLE public.taskmilestone OWNER TO naval;

--
-- Name: work_report; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date timestamp without time zone,
    place character varying(255),
    responsible character varying(255),
    work_report_type_id bigint NOT NULL
);


ALTER TABLE public.work_report OWNER TO naval;

--
-- Name: work_report_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_line (
    id bigint NOT NULL,
    version bigint NOT NULL,
    numhours integer,
    work_report_id bigint,
    resource_id bigint NOT NULL,
    order_element_id bigint NOT NULL
);


ALTER TABLE public.work_report_line OWNER TO naval;

--
-- Name: work_report_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.work_report_type OWNER TO naval;

--
-- Name: worker; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE worker (
    worker_id bigint NOT NULL,
    firstname character varying(255),
    surname character varying(255),
    nif character varying(255)
);


ALTER TABLE public.worker OWNER TO naval;

--
-- Data for Name: advanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignment (id, version, reportglobaladvance, advance_type_id) FROM stdin;
1428	9	t	202
1444	2	t	202
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id) FROM stdin;
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage) FROM stdin;
202	3	children	100.0000	f	0.0100	t	t
203	2	percentage	100.0000	f	0.0100	t	t
204	1	units	2147483647.0000	f	1.0000	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, name, active, id_criterion_type, parent) FROM stdin;
103	4	hiredResourceWorkingRelationship	t	5	\N
104	3	firedResourceWorkingRelationship	t	5	\N
102	15	paternityLeave	t	1	\N
101	16	medicalLeave	t	1	\N
404	1	torno1	t	98304	\N
405	1	torno2	t	98304	\N
406	1	torno3	t	98304	\N
\.


--
-- Data for Name: criterion_type_work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion_type_work_report_type (work_report_type_id, criterion_type_id) FROM stdin;
\.


--
-- Data for Name: criterion_work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion_work_report_line (work_report_line_id, criterion_id) FROM stdin;
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid) FROM stdin;
1634	DIRECT	7	\N	1333	103	\N	\N
1636	INDIRECT	7	\N	1335	103	1634	t
1638	INDIRECT	7	\N	1336	103	1634	t
1639	INDIRECT	7	1522	\N	103	1634	t
1635	INDIRECT	7	\N	1334	103	1634	t
1637	INDIRECT	7	1521	\N	103	1634	t
1632	DIRECT	8	\N	1335	406	\N	\N
1633	INDIRECT	8	1521	\N	406	1632	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
606	5	2009-11-08 02:58:28.397	\N	f	404	505
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
2	11	CATEGORY	Professional category	t	t	t	1
3	9	TRAINING	Training courses and labor training	t	t	t	1
4	7	JOB	Job	t	t	t	1
5	5	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
6	1	LOCATION_GROUP	Location where the resource work	t	f	t	0
1	17	LEAVE	Leave	f	f	t	1
98304	1	torno	este criterio es para agrupar a todos los tornos de la empresa	t	t	t	2
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id) FROM stdin;
1994	SPECIFIC_DAY	3	8	2009-11-28	707	1819	\N
1995	SPECIFIC_DAY	3	8	2009-11-23	707	1819	\N
1996	SPECIFIC_DAY	3	8	2009-11-10	707	1819	\N
1997	SPECIFIC_DAY	3	8	2009-11-29	707	1819	\N
1998	SPECIFIC_DAY	3	8	2009-11-12	707	1819	\N
1999	SPECIFIC_DAY	3	8	2009-11-15	707	1819	\N
2000	SPECIFIC_DAY	3	8	2009-11-09	707	1819	\N
2001	SPECIFIC_DAY	3	8	2009-11-20	707	1819	\N
2002	SPECIFIC_DAY	3	8	2009-11-27	707	1819	\N
2003	SPECIFIC_DAY	3	8	2009-11-26	707	1819	\N
2004	SPECIFIC_DAY	3	8	2009-11-22	707	1819	\N
2005	SPECIFIC_DAY	3	8	2009-11-17	707	1819	\N
2006	SPECIFIC_DAY	3	8	2009-11-14	707	1819	\N
2007	SPECIFIC_DAY	3	8	2009-11-30	707	1819	\N
2008	SPECIFIC_DAY	3	8	2009-12-02	707	1819	\N
2009	SPECIFIC_DAY	3	8	2009-12-03	707	1819	\N
2010	SPECIFIC_DAY	3	8	2009-11-11	707	1819	\N
2011	SPECIFIC_DAY	3	8	2009-11-16	707	1819	\N
2012	SPECIFIC_DAY	3	8	2009-12-01	707	1819	\N
2013	SPECIFIC_DAY	3	8	2009-11-25	707	1819	\N
2014	SPECIFIC_DAY	3	8	2009-11-24	707	1819	\N
2015	SPECIFIC_DAY	3	8	2009-11-21	707	1819	\N
2016	SPECIFIC_DAY	3	8	2009-11-18	707	1819	\N
2017	SPECIFIC_DAY	3	8	2009-11-19	707	1819	\N
2018	SPECIFIC_DAY	3	8	2009-11-13	707	1819	\N
2269	GENERIC_DAY	0	4	2010-01-29	707	\N	1821
2270	GENERIC_DAY	0	4	2010-02-22	505	\N	1821
2271	GENERIC_DAY	0	4	2009-12-06	505	\N	1821
2272	GENERIC_DAY	0	4	2010-01-28	505	\N	1821
2273	GENERIC_DAY	0	4	2010-02-17	707	\N	1821
2274	GENERIC_DAY	0	4	2010-02-17	505	\N	1821
2275	GENERIC_DAY	0	4	2010-02-27	707	\N	1821
2276	GENERIC_DAY	0	4	2010-02-07	505	\N	1821
2277	GENERIC_DAY	0	4	2010-01-27	707	\N	1821
2278	GENERIC_DAY	0	4	2010-02-28	707	\N	1821
2279	GENERIC_DAY	0	4	2010-02-12	707	\N	1821
2280	GENERIC_DAY	0	4	2010-01-31	505	\N	1821
2281	GENERIC_DAY	0	4	2010-02-02	707	\N	1821
2282	GENERIC_DAY	0	4	2009-12-30	707	\N	1821
2283	GENERIC_DAY	0	4	2009-12-05	505	\N	1821
2284	GENERIC_DAY	0	4	2009-12-07	707	\N	1821
2285	GENERIC_DAY	0	4	2010-02-09	505	\N	1821
2286	GENERIC_DAY	0	4	2010-03-12	707	\N	1821
2287	GENERIC_DAY	0	4	2009-12-13	707	\N	1821
2288	GENERIC_DAY	0	8	2009-11-15	505	\N	1821
2289	GENERIC_DAY	0	4	2009-12-12	707	\N	1821
2290	GENERIC_DAY	0	4	2009-12-28	707	\N	1821
2291	GENERIC_DAY	0	0	2009-12-01	707	\N	1821
2292	GENERIC_DAY	0	4	2010-01-13	505	\N	1821
2293	GENERIC_DAY	0	4	2010-01-30	707	\N	1821
2294	GENERIC_DAY	0	4	2009-12-18	505	\N	1821
2295	GENERIC_DAY	0	4	2010-02-06	505	\N	1821
2296	GENERIC_DAY	0	8	2009-11-21	505	\N	1821
2297	GENERIC_DAY	0	4	2010-02-01	505	\N	1821
2298	GENERIC_DAY	0	8	2009-12-03	505	\N	1821
2299	GENERIC_DAY	0	4	2010-01-04	505	\N	1821
2300	GENERIC_DAY	0	4	2010-02-08	707	\N	1821
2301	GENERIC_DAY	0	4	2010-02-10	505	\N	1821
2302	GENERIC_DAY	0	4	2010-02-18	505	\N	1821
2303	GENERIC_DAY	0	4	2010-02-21	505	\N	1821
2304	GENERIC_DAY	0	4	2010-01-18	707	\N	1821
2305	GENERIC_DAY	0	4	2009-12-19	505	\N	1821
2306	GENERIC_DAY	0	4	2009-12-30	505	\N	1821
2307	GENERIC_DAY	0	4	2010-03-04	707	\N	1821
2308	GENERIC_DAY	0	8	2009-11-16	505	\N	1821
2309	GENERIC_DAY	0	4	2010-03-11	707	\N	1821
2310	GENERIC_DAY	0	4	2009-12-27	505	\N	1821
2311	GENERIC_DAY	0	4	2009-12-15	505	\N	1821
2312	GENERIC_DAY	0	4	2010-01-12	707	\N	1821
2313	GENERIC_DAY	0	8	2009-11-10	505	\N	1821
2314	GENERIC_DAY	0	4	2010-01-31	707	\N	1821
2315	GENERIC_DAY	0	0	2009-11-17	707	\N	1821
2316	GENERIC_DAY	0	4	2010-01-25	707	\N	1821
2317	GENERIC_DAY	0	4	2009-12-10	505	\N	1821
2318	GENERIC_DAY	0	4	2010-03-09	707	\N	1821
2319	GENERIC_DAY	0	4	2010-01-10	505	\N	1821
2320	GENERIC_DAY	0	4	2010-01-13	707	\N	1821
2321	GENERIC_DAY	0	0	2009-11-15	707	\N	1821
2322	GENERIC_DAY	0	0	2009-11-19	707	\N	1821
2323	GENERIC_DAY	0	4	2009-12-11	505	\N	1821
2324	GENERIC_DAY	0	4	2010-03-10	707	\N	1821
2325	GENERIC_DAY	0	8	2009-11-17	505	\N	1821
2326	GENERIC_DAY	0	4	2010-01-02	707	\N	1821
2327	GENERIC_DAY	0	4	2010-02-16	505	\N	1821
2328	GENERIC_DAY	0	4	2010-02-03	505	\N	1821
2329	GENERIC_DAY	0	4	2010-01-01	505	\N	1821
2330	GENERIC_DAY	0	8	2009-11-09	505	\N	1821
2331	GENERIC_DAY	0	4	2010-01-06	505	\N	1821
2332	GENERIC_DAY	0	4	2009-12-22	505	\N	1821
2333	GENERIC_DAY	0	4	2010-01-08	505	\N	1821
2334	GENERIC_DAY	0	4	2010-03-07	707	\N	1821
2335	GENERIC_DAY	0	4	2010-01-07	707	\N	1821
2336	GENERIC_DAY	0	4	2010-02-09	707	\N	1821
2337	GENERIC_DAY	0	4	2010-01-18	505	\N	1821
2338	GENERIC_DAY	0	8	2009-11-26	505	\N	1821
2339	GENERIC_DAY	0	4	2010-01-20	707	\N	1821
2340	GENERIC_DAY	0	4	2010-03-07	505	\N	1821
2341	GENERIC_DAY	0	4	2009-12-26	707	\N	1821
2342	GENERIC_DAY	0	4	2010-01-12	505	\N	1821
2343	GENERIC_DAY	0	4	2010-02-10	707	\N	1821
2344	GENERIC_DAY	0	4	2010-03-06	505	\N	1821
2345	GENERIC_DAY	0	4	2010-01-24	707	\N	1821
2346	GENERIC_DAY	0	4	2010-01-17	505	\N	1821
2347	GENERIC_DAY	0	4	2009-12-17	707	\N	1821
2348	GENERIC_DAY	0	4	2010-03-13	505	\N	1821
2349	GENERIC_DAY	0	4	2010-02-04	707	\N	1821
2350	GENERIC_DAY	0	4	2010-03-08	707	\N	1821
2351	GENERIC_DAY	0	4	2010-01-06	707	\N	1821
2352	GENERIC_DAY	0	4	2009-12-25	505	\N	1821
2353	GENERIC_DAY	0	4	2010-01-03	505	\N	1821
2354	GENERIC_DAY	0	4	2010-01-19	707	\N	1821
2355	GENERIC_DAY	0	0	2009-11-29	707	\N	1821
2356	GENERIC_DAY	0	4	2009-12-09	505	\N	1821
2357	GENERIC_DAY	0	0	2009-11-24	707	\N	1821
2358	GENERIC_DAY	0	0	2009-11-25	707	\N	1821
2359	GENERIC_DAY	0	4	2010-01-03	707	\N	1821
2360	GENERIC_DAY	0	4	2010-01-11	505	\N	1821
2361	GENERIC_DAY	0	8	2009-12-02	505	\N	1821
2362	GENERIC_DAY	0	4	2010-01-05	707	\N	1821
2363	GENERIC_DAY	0	4	2009-12-09	707	\N	1821
2364	GENERIC_DAY	0	4	2009-12-15	707	\N	1821
2365	GENERIC_DAY	0	4	2010-02-27	505	\N	1821
2366	GENERIC_DAY	0	8	2009-12-01	505	\N	1821
2367	GENERIC_DAY	0	4	2010-01-16	505	\N	1821
2368	GENERIC_DAY	0	4	2009-12-10	707	\N	1821
2369	GENERIC_DAY	0	4	2009-12-19	707	\N	1821
2370	GENERIC_DAY	0	4	2010-01-09	707	\N	1821
2371	GENERIC_DAY	0	4	2010-02-19	505	\N	1821
2372	GENERIC_DAY	0	4	2009-12-27	707	\N	1821
2373	GENERIC_DAY	0	4	2010-02-21	707	\N	1821
2374	GENERIC_DAY	0	4	2010-02-16	707	\N	1821
2375	GENERIC_DAY	0	4	2009-12-16	505	\N	1821
2376	GENERIC_DAY	0	4	2010-02-26	707	\N	1821
2377	GENERIC_DAY	0	4	2010-02-05	505	\N	1821
2378	GENERIC_DAY	0	4	2009-12-29	707	\N	1821
2379	GENERIC_DAY	0	4	2010-01-15	707	\N	1821
2380	GENERIC_DAY	0	4	2010-01-01	707	\N	1821
2381	GENERIC_DAY	0	4	2010-03-11	505	\N	1821
2382	GENERIC_DAY	0	4	2010-01-24	505	\N	1821
2383	GENERIC_DAY	0	4	2010-03-03	707	\N	1821
2384	GENERIC_DAY	0	4	2009-12-21	707	\N	1821
2385	GENERIC_DAY	0	4	2010-02-19	707	\N	1821
2386	GENERIC_DAY	0	4	2009-12-25	707	\N	1821
2387	GENERIC_DAY	0	4	2010-01-22	707	\N	1821
2388	GENERIC_DAY	0	4	2010-03-03	505	\N	1821
2389	GENERIC_DAY	0	4	2010-01-08	707	\N	1821
2390	GENERIC_DAY	0	4	2009-12-24	707	\N	1821
2391	GENERIC_DAY	0	0	2009-11-09	707	\N	1821
2392	GENERIC_DAY	0	4	2010-01-16	707	\N	1821
2393	GENERIC_DAY	0	0	2009-11-11	707	\N	1821
2394	GENERIC_DAY	0	4	2010-02-11	505	\N	1821
2395	GENERIC_DAY	0	4	2010-01-21	707	\N	1821
2396	GENERIC_DAY	0	0	2009-11-10	707	\N	1821
2397	GENERIC_DAY	0	4	2010-02-08	505	\N	1821
2398	GENERIC_DAY	0	0	2009-11-27	707	\N	1821
2399	GENERIC_DAY	0	4	2010-03-04	505	\N	1821
2400	GENERIC_DAY	0	4	2010-02-11	707	\N	1821
2401	GENERIC_DAY	0	4	2010-01-20	505	\N	1821
2402	GENERIC_DAY	0	4	2010-02-12	505	\N	1821
2403	GENERIC_DAY	0	0	2009-11-26	707	\N	1821
2404	GENERIC_DAY	0	8	2009-11-12	505	\N	1821
2405	GENERIC_DAY	0	0	2009-11-23	707	\N	1821
2406	GENERIC_DAY	0	4	2010-01-14	505	\N	1821
2407	GENERIC_DAY	0	4	2010-03-01	707	\N	1821
2408	GENERIC_DAY	0	8	2009-11-14	505	\N	1821
2409	GENERIC_DAY	0	0	2009-11-16	707	\N	1821
2410	GENERIC_DAY	0	4	2010-02-24	707	\N	1821
2411	GENERIC_DAY	0	4	2009-12-08	505	\N	1821
2412	GENERIC_DAY	0	4	2009-12-31	505	\N	1821
2413	GENERIC_DAY	0	4	2010-03-05	707	\N	1821
2414	GENERIC_DAY	0	8	2009-11-29	505	\N	1821
2415	GENERIC_DAY	0	4	2010-02-24	505	\N	1821
2416	GENERIC_DAY	0	4	2010-02-04	505	\N	1821
2417	GENERIC_DAY	0	4	2010-01-09	505	\N	1821
2418	GENERIC_DAY	0	8	2009-11-22	505	\N	1821
2419	GENERIC_DAY	0	4	2010-01-21	505	\N	1821
2420	GENERIC_DAY	0	8	2009-11-18	505	\N	1821
2421	GENERIC_DAY	0	4	2010-03-12	505	\N	1821
2422	GENERIC_DAY	0	4	2010-02-26	505	\N	1821
2423	GENERIC_DAY	0	4	2010-02-15	707	\N	1821
2424	GENERIC_DAY	0	4	2010-01-30	505	\N	1821
2425	GENERIC_DAY	0	4	2010-02-07	707	\N	1821
2426	GENERIC_DAY	0	4	2010-02-15	505	\N	1821
2427	GENERIC_DAY	0	4	2009-12-11	707	\N	1821
2428	GENERIC_DAY	0	4	2010-02-22	707	\N	1821
2429	GENERIC_DAY	0	0	2009-11-12	707	\N	1821
2430	GENERIC_DAY	0	0	2009-11-30	707	\N	1821
2431	GENERIC_DAY	0	4	2009-12-20	505	\N	1821
2432	GENERIC_DAY	0	0	2009-11-28	707	\N	1821
2433	GENERIC_DAY	0	4	2009-12-29	505	\N	1821
2434	GENERIC_DAY	0	4	2009-12-16	707	\N	1821
2435	GENERIC_DAY	0	4	2010-02-03	707	\N	1821
2436	GENERIC_DAY	0	4	2010-03-05	505	\N	1821
2437	GENERIC_DAY	0	4	2010-02-20	707	\N	1821
2438	GENERIC_DAY	0	8	2009-11-28	505	\N	1821
2439	GENERIC_DAY	0	4	2010-01-15	505	\N	1821
2440	GENERIC_DAY	0	8	2009-11-27	505	\N	1821
2441	GENERIC_DAY	0	8	2009-11-13	505	\N	1821
2442	GENERIC_DAY	0	8	2009-11-24	505	\N	1821
2443	GENERIC_DAY	0	4	2009-12-26	505	\N	1821
2444	GENERIC_DAY	0	4	2009-12-04	707	\N	1821
2445	GENERIC_DAY	0	0	2009-11-14	707	\N	1821
2446	GENERIC_DAY	0	4	2010-01-04	707	\N	1821
2447	GENERIC_DAY	0	4	2010-02-28	505	\N	1821
2448	GENERIC_DAY	0	4	2009-12-07	505	\N	1821
2449	GENERIC_DAY	0	4	2010-02-23	707	\N	1821
2450	GENERIC_DAY	0	4	2010-01-27	505	\N	1821
2451	GENERIC_DAY	0	4	2009-12-18	707	\N	1821
2452	GENERIC_DAY	0	4	2010-02-01	707	\N	1821
2453	GENERIC_DAY	0	0	2009-11-13	707	\N	1821
2454	GENERIC_DAY	0	4	2010-03-09	505	\N	1821
2455	GENERIC_DAY	0	4	2010-01-02	505	\N	1821
2456	GENERIC_DAY	0	4	2009-12-23	505	\N	1821
2457	GENERIC_DAY	0	8	2009-11-25	505	\N	1821
2458	GENERIC_DAY	0	4	2009-12-12	505	\N	1821
2459	GENERIC_DAY	0	4	2009-12-14	505	\N	1821
2460	GENERIC_DAY	0	4	2009-12-13	505	\N	1821
2461	GENERIC_DAY	0	4	2010-01-26	707	\N	1821
2462	GENERIC_DAY	0	4	2009-12-23	707	\N	1821
2463	GENERIC_DAY	0	4	2010-01-11	707	\N	1821
2464	GENERIC_DAY	0	4	2010-03-02	707	\N	1821
2465	GENERIC_DAY	0	8	2009-11-20	505	\N	1821
2466	GENERIC_DAY	0	4	2010-01-23	707	\N	1821
2467	GENERIC_DAY	0	4	2009-12-28	505	\N	1821
2468	GENERIC_DAY	0	0	2009-11-21	707	\N	1821
2469	GENERIC_DAY	0	4	2010-02-25	505	\N	1821
2470	GENERIC_DAY	0	8	2009-11-30	505	\N	1821
2471	GENERIC_DAY	0	4	2009-12-08	707	\N	1821
2472	GENERIC_DAY	0	4	2010-01-10	707	\N	1821
2473	GENERIC_DAY	0	4	2010-02-14	707	\N	1821
2474	GENERIC_DAY	0	4	2009-12-14	707	\N	1821
2475	GENERIC_DAY	0	4	2010-03-06	707	\N	1821
2476	GENERIC_DAY	0	4	2010-03-08	505	\N	1821
2477	GENERIC_DAY	0	0	2009-12-02	707	\N	1821
2478	GENERIC_DAY	0	4	2009-12-21	505	\N	1821
2479	GENERIC_DAY	0	4	2010-02-13	505	\N	1821
2480	GENERIC_DAY	0	4	2010-03-13	707	\N	1821
2481	GENERIC_DAY	0	4	2010-02-23	505	\N	1821
2482	GENERIC_DAY	0	4	2010-02-18	707	\N	1821
2483	GENERIC_DAY	0	8	2009-11-23	505	\N	1821
2484	GENERIC_DAY	0	8	2009-11-11	505	\N	1821
2485	GENERIC_DAY	0	4	2010-02-02	505	\N	1821
2486	GENERIC_DAY	0	0	2009-11-22	707	\N	1821
2487	GENERIC_DAY	0	4	2010-01-19	505	\N	1821
2488	GENERIC_DAY	0	4	2010-02-20	505	\N	1821
2489	GENERIC_DAY	0	4	2009-12-31	707	\N	1821
2490	GENERIC_DAY	0	0	2009-11-18	707	\N	1821
2491	GENERIC_DAY	0	0	2009-12-03	707	\N	1821
2492	GENERIC_DAY	0	4	2010-01-23	505	\N	1821
2493	GENERIC_DAY	0	4	2009-12-05	707	\N	1821
2494	GENERIC_DAY	0	4	2010-01-26	505	\N	1821
2495	GENERIC_DAY	0	4	2009-12-04	505	\N	1821
2496	GENERIC_DAY	0	4	2009-12-22	707	\N	1821
2497	GENERIC_DAY	0	4	2009-12-20	707	\N	1821
2498	GENERIC_DAY	0	4	2010-01-22	505	\N	1821
2499	GENERIC_DAY	0	4	2009-12-24	505	\N	1821
2500	GENERIC_DAY	0	4	2010-01-17	707	\N	1821
2501	GENERIC_DAY	0	4	2010-01-07	505	\N	1821
2502	GENERIC_DAY	0	4	2009-12-17	505	\N	1821
2503	GENERIC_DAY	0	8	2009-11-19	505	\N	1821
2504	GENERIC_DAY	0	4	2010-01-29	505	\N	1821
2505	GENERIC_DAY	0	4	2010-01-25	505	\N	1821
2506	GENERIC_DAY	0	4	2010-02-05	707	\N	1821
2507	GENERIC_DAY	0	4	2010-03-01	505	\N	1821
2508	GENERIC_DAY	0	4	2010-03-10	505	\N	1821
2509	GENERIC_DAY	0	4	2010-02-13	707	\N	1821
2510	GENERIC_DAY	0	4	2010-01-14	707	\N	1821
2511	GENERIC_DAY	0	4	2010-02-14	505	\N	1821
2512	GENERIC_DAY	0	4	2010-02-25	707	\N	1821
2513	GENERIC_DAY	0	4	2010-02-06	707	\N	1821
2514	GENERIC_DAY	0	4	2009-12-06	707	\N	1821
2515	GENERIC_DAY	0	0	2009-11-20	707	\N	1821
2516	GENERIC_DAY	0	4	2010-03-02	505	\N	1821
2517	GENERIC_DAY	0	4	2010-01-28	707	\N	1821
2518	GENERIC_DAY	0	4	2010-01-05	505	\N	1821
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
\.


--
-- Data for Name: exceptionday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY exceptionday (id, version, date, hours, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
1821
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
25
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
1521	9	500	1.00	f	1335
1522	9	200	1.00	f	1336
1529	2	1000	1.00	f	1358
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
1428	1334
1444	1357
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, name, label_type_id) FROM stdin;
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, name) FROM stdin;
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
505	t1	supertorno	el super torno de la abuela
\.


--
-- Data for Name: machine_configuration_unit_required_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine_configuration_unit_required_criterions (id, criterion_id) FROM stdin;
\.


--
-- Data for Name: machineworkerassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkerassignment (id, version, startdate, finishdate, configuration_id, worker_id) FROM stdin;
1111	3	\N	\N	1010	707
1212	1	\N	\N	1010	707
1112	3	\N	\N	1010	707
909	4	\N	\N	808	707
\.


--
-- Data for Name: machineworkersconfigurationunit; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkersconfigurationunit (id, version, name, alpha, machine) FROM stdin;
1010	3	configuration 1	1.00	505
808	4	configuration 2	1.00	505
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, customer) FROM stdin;
1333	Ahora	Zara
1357	ahora	aqui
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, initdate, enddate, mandatoryinit, mandatoryend, description, code, parent, positionincontainer, deadline) FROM stdin;
1333	9	Pedido 1	2009-11-09 19:51:34.234	\N	f	f	un pedido importante	p1	\N	\N	\N
1334	9	noe1	\N	\N	f	f	\N	ec1	1333	0	\N
1335	9	noe2	\N	\N	f	f	\N	ec2	1334	0	\N
1336	9	noe1 (copy)	\N	\N	f	f	\N	ec1 (copy)	1334	1	\N
1357	2	Pedido 2	2009-11-09 20:34:19.379	\N	f	f	descripcion	Code 3	\N	\N	2009-11-21 00:00:00
1358	2	oe3	\N	\N	f	f	\N	oec3	1357	0	\N
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid) FROM stdin;
1335
1336
1358
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1333
1334
1357
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, calendar) FROM stdin;
707	1	\N
505	5	\N
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
1819	5	1.00	1720	\N
1821	0	1.00	1722	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
1819	707
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, hoursgroup, calculatedvalue, startconstrainttype, constraintdate) FROM stdin;
1719	1521	1	0	\N
1720	1522	1	0	\N
1722	1529	1	0	\N
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, shareofhours, name, notes, startdate, enddate, order_element_id, parent, base_calendar_id, positioninparent, deadline) FROM stdin;
1718	4	\N	noe1	\N	2009-11-09 19:51:34.234	2009-12-04 00:00:00	1334	1717	\N	0	\N
1719	4	\N	noe2	\N	2009-11-09 19:51:34.234	2009-11-30 15:51:34.234	1335	1718	\N	0	\N
1720	4	\N	noe1 (copy)	\N	2009-11-09 00:00:00	2009-12-04 00:00:00	1336	1718	\N	1	\N
1717	4	\N	\N	\N	2009-11-09 19:51:34.234	2009-12-04 00:00:00	1333	\N	\N	\N	\N
1722	2	\N	oe3	\N	2009-11-09 00:00:00	2010-03-14 00:00:00	1358	1721	\N	0	\N
1721	2	\N	\N	\N	2009-11-09 00:00:00	2010-03-14 00:00:00	1357	\N	\N	\N	2009-11-21
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
1717
1718
1721
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, date, place, responsible, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, numhours, work_report_id, resource_id, order_element_id) FROM stdin;
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name) FROM stdin;
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
707	Javier 	Moran	78736622D
\.


--
-- Name: advanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advanceassignment
    ADD CONSTRAINT advanceassignment_pkey PRIMARY KEY (id);


--
-- Name: advancemeasurement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT advancemeasurement_pkey PRIMARY KEY (id);


--
-- Name: advancetype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancetype
    ADD CONSTRAINT advancetype_pkey PRIMARY KEY (id);


--
-- Name: advancetype_unitname_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancetype
    ADD CONSTRAINT advancetype_unitname_key UNIQUE (unitname);


--
-- Name: all_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT all_criterions_pkey PRIMARY KEY (generic_resource_allocation_id, criterion_id);


--
-- Name: assignment_function_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY assignment_function
    ADD CONSTRAINT assignment_function_pkey PRIMARY KEY (id);


--
-- Name: basecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY basecalendar
    ADD CONSTRAINT basecalendar_pkey PRIMARY KEY (id);


--
-- Name: calendardata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_pkey PRIMARY KEY (id);


--
-- Name: criterion_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_name_key UNIQUE (name, id_criterion_type);


--
-- Name: criterion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_pkey PRIMARY KEY (id);


--
-- Name: criterion_type_work_report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion_type_work_report_type
    ADD CONSTRAINT criterion_type_work_report_type_pkey PRIMARY KEY (work_report_type_id, criterion_type_id);


--
-- Name: criterion_work_report_line_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion_work_report_line
    ADD CONSTRAINT criterion_work_report_line_pkey PRIMARY KEY (work_report_line_id, criterion_id);


--
-- Name: criterionrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT criterionrequirement_pkey PRIMARY KEY (id);


--
-- Name: criterionsatisfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_pkey PRIMARY KEY (id);


--
-- Name: criteriontype_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_name_key UNIQUE (name);


--
-- Name: criteriontype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_pkey PRIMARY KEY (id);


--
-- Name: day_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT day_assignment_pkey PRIMARY KEY (id);


--
-- Name: dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (id);


--
-- Name: directadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT directadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: exceptionday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY exceptionday
    ADD CONSTRAINT exceptionday_pkey PRIMARY KEY (id);


--
-- Name: generic_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT generic_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: hoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_pkey PRIMARY KEY (id);


--
-- Name: hoursperday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursperday
    ADD CONSTRAINT hoursperday_pkey PRIMARY KEY (base_calendar_id, day_id);


--
-- Name: indirectadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT indirectadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: label_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_name_key UNIQUE (name, label_type_id);


--
-- Name: label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: label_type_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_name_key UNIQUE (name);


--
-- Name: label_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_pkey PRIMARY KEY (id);


--
-- Name: machine_configuration_unit_required_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT machine_configuration_unit_required_criterions_pkey PRIMARY KEY (id, criterion_id);


--
-- Name: machine_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (machine_id);


--
-- Name: machineworkerassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT machineworkerassignment_pkey PRIMARY KEY (id);


--
-- Name: machineworkersconfigurationunit_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machineworkersconfigurationunit
    ADD CONSTRAINT machineworkersconfigurationunit_pkey PRIMARY KEY (id);


--
-- Name: order_element_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT order_element_label_pkey PRIMARY KEY (order_element_id, label_id);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_pkey PRIMARY KEY (id);


--
-- Name: orderline_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT orderline_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderlinegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinegroup
    ADD CONSTRAINT orderlinegroup_pkey PRIMARY KEY (orderelementid);


--
-- Name: resource_calendar_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_calendar_key UNIQUE (calendar);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resourceallocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT resourceallocation_pkey PRIMARY KEY (id);


--
-- Name: resourcecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resourcecalendar
    ADD CONSTRAINT resourcecalendar_pkey PRIMARY KEY (base_calendar_id);


--
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_element_id);


--
-- Name: taskelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT taskelement_pkey PRIMARY KEY (id);


--
-- Name: taskgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskgroup
    ADD CONSTRAINT taskgroup_pkey PRIMARY KEY (task_element_id);


--
-- Name: taskmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskmilestone
    ADD CONSTRAINT taskmilestone_pkey PRIMARY KEY (task_element_id);


--
-- Name: work_report_line_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_pkey PRIMARY KEY (id);


--
-- Name: work_report_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_pkey PRIMARY KEY (id);


--
-- Name: work_report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_pkey PRIMARY KEY (id);


--
-- Name: worker_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (worker_id);


--
-- Name: fk1a95a222131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a222131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fk27a9a54936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a54936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk27a9a55ac3aeb2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a55ac3aeb2 FOREIGN KEY (hoursgroup) REFERENCES hoursgroup(id);


--
-- Name: fk3a79eb0261f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb0261f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk3a79eb02e036cfed; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02e036cfed FOREIGN KEY (hours_group_id) REFERENCES hoursgroup(id);


--
-- Name: fk3a79eb02efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk3a79eb02f41d57f2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02f41d57f2 FOREIGN KEY (parent) REFERENCES criterionrequirement(id);


--
-- Name: fk3d1ffd21218d7620; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd21218d7620 FOREIGN KEY (indirect_order_element_id) REFERENCES orderelement(id);


--
-- Name: fk3d1ffd212f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd212f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fk3d1ffd218202350f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd218202350f FOREIGN KEY (indirect_order_element_id) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fk3f30d9ad8c4c676c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT fk3f30d9ad8c4c676c FOREIGN KEY (criterion) REFERENCES criterion(id);


--
-- Name: fk3f30d9adeae850b2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT fk3f30d9adeae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fk401dc6acffeb5538; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkersconfigurationunit
    ADD CONSTRAINT fk401dc6acffeb5538 FOREIGN KEY (machine) REFERENCES machine(machine_id);


--
-- Name: fk41e073ae15671e92; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT fk41e073ae15671e92 FOREIGN KEY (assignment_function) REFERENCES assignment_function(id);


--
-- Name: fk41e073aeff61540d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT fk41e073aeff61540d FOREIGN KEY (task) REFERENCES task(task_element_id);


--
-- Name: fk44d86d4707cd777; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY label
    ADD CONSTRAINT fk44d86d4707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fk4822b25e131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion_type_work_report_type
    ADD CONSTRAINT fk4822b25e131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fk4822b25eff876347; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion_type_work_report_type
    ADD CONSTRAINT fk4822b25eff876347 FOREIGN KEY (criterion_type_id) REFERENCES criteriontype(id);


--
-- Name: fk5863798ca44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourcecalendar
    ADD CONSTRAINT fk5863798ca44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk6017744297b1c209; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT fk6017744297b1c209 FOREIGN KEY (orderelementid) REFERENCES orderelement(id);


--
-- Name: fk62b2994b4936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskmilestone
    ADD CONSTRAINT fk62b2994b4936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk70d5d997a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT fk70d5d997a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk70d5d997a5f3c581; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT fk70d5d997a5f3c581 FOREIGN KEY (parent) REFERENCES taskgroup(task_element_id);


--
-- Name: fk70d5d997efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT fk70d5d997efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk7540af6b1545e7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b1545e7a FOREIGN KEY (origin) REFERENCES taskelement(id);


--
-- Name: fk7540af6be838f362; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6be838f362 FOREIGN KEY (destination) REFERENCES taskelement(id);


--
-- Name: fk75a2f39df82680f8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39df82680f8 FOREIGN KEY (orderelementid) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fk7980035061f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk7980035061f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk79800350b1524a73; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk79800350b1524a73 FOREIGN KEY (generic_resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fk7d2eeb5d97b1c209; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegroup
    ADD CONSTRAINT fk7d2eeb5d97b1c209 FOREIGN KEY (orderelementid) REFERENCES orderelement(id);


--
-- Name: fk808010cfb216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignment
    ADD CONSTRAINT fk808010cfb216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


--
-- Name: fk80e79bda4936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskgroup
    ADD CONSTRAINT fk80e79bda4936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk8e542e8114a5c61; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk8e542e8114a5c61 FOREIGN KEY (id_criterion_type) REFERENCES criteriontype(id);


--
-- Name: fk8e542e813a156175; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk8e542e813a156175 FOREIGN KEY (parent) REFERENCES criterion(id);


--
-- Name: fk9469dc27937680b7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT fk9469dc27937680b7 FOREIGN KEY (machine_id) REFERENCES resource(id);


--
-- Name: fk95548d7861f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7861f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk95548d7875999a91; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7875999a91 FOREIGN KEY (id) REFERENCES machineworkersconfigurationunit(id);


--
-- Name: fk9654b9ef5078e161; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion_work_report_line
    ADD CONSTRAINT fk9654b9ef5078e161 FOREIGN KEY (work_report_line_id) REFERENCES work_report_line(id);


--
-- Name: fk9654b9ef61f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion_work_report_line
    ADD CONSTRAINT fk9654b9ef61f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk9ac73f9e40901220; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT fk9ac73f9e40901220 FOREIGN KEY (worker_id) REFERENCES resource(id);


--
-- Name: fkbb2f91fa2f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT fkbb2f91fa2f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fkbb2f91faa9e53843; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT fkbb2f91faa9e53843 FOREIGN KEY (advance_assignment_id) REFERENCES directadvanceassignment(advance_assignment_id);


--
-- Name: fkbb493f5048d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5048d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbb493f506394139; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f506394139 FOREIGN KEY (specific_resource_allocation_id) REFERENCES specific_resource_allocation(resource_allocation_id);


--
-- Name: fkbb493f50b1524a73; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50b1524a73 FOREIGN KEY (generic_resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fkc001d52efd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursperday
    ADD CONSTRAINT fkc001d52efd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


--
-- Name: fkcf1f2cd01ed629ea; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT fkcf1f2cd01ed629ea FOREIGN KEY (parent_order_line) REFERENCES orderline(orderelementid);


--
-- Name: fkd7d7eb1286b2de7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT fkd7d7eb1286b2de7a FOREIGN KEY (configuration_id) REFERENCES machineworkersconfigurationunit(id);


--
-- Name: fkd7d7eb129bebcf10; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT fkd7d7eb129bebcf10 FOREIGN KEY (worker_id) REFERENCES worker(worker_id);


--
-- Name: fkdbbb4fee1e635c19; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4fee1e635c19 FOREIGN KEY (parent) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fke203860c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke203860c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fke203860efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke203860efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fkeb02c3f148d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f148d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkeb02c3f1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fkeb02c3f1f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fkef86282ee893ce10; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkef86282ee893ce10 FOREIGN KEY (calendar) REFERENCES resourcecalendar(base_calendar_id);


--
-- Name: fkf0e8572475ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e8572475ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fkf0e85724eae850b2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e85724eae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fkf4bee4287fa34e3f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT fkf4bee4287fa34e3f FOREIGN KEY (parent) REFERENCES basecalendar(id);


--
-- Name: fkf4bee428a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT fkf4bee428a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fkf788b34975ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT fkf788b34975ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fkf9ce78eda44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY exceptionday
    ADD CONSTRAINT fkf9ce78eda44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fkfc7b7be62f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT fkfc7b7be62f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fkfc7b7be6a1127ce5; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT fkfc7b7be6a1127ce5 FOREIGN KEY (direct_order_element_id) REFERENCES orderelement(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


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
-- Name: criterionhoursgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionhoursgroup (
    hoursgroupid bigint NOT NULL,
    criterionid bigint NOT NULL
);


ALTER TABLE public.criterionhoursgroup OWNER TO naval;

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
    positionincontainer integer
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
    calculatedvalue integer
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
    positioninparent integer
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
606	1	t	202
1515	1	t	202
3535	2	t	202
8787	1	t	202
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
6868	1	asdf	100.0000	t	1.0000	t	f
6869	1	advance type 3	500.0000	t	1.0000	t	f
6870	1	ratatataaaa	145.0000	t	1.0000	t	f
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
5960	1	calendario uno
3030	9	calendario empresa
5959	4	calendario empresa
8181	2	adfasdfasdfasdfasdf
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
6061	1	\N	\N	5960	0
3131	9	\N	\N	3030	0
6060	4	\N	\N	5959	0
8282	2	\N	\N	8181	0
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, name, active, id_criterion_type, parent) FROM stdin;
101	14	medicalLeave	t	1	\N
102	13	paternityLeave	t	1	\N
103	4	hiredResourceWorkingRelationship	t	5	\N
104	3	firedResourceWorkingRelationship	t	5	\N
2323	2	Medico	t	4	\N
2324	1	Profesor	t	4	\N
6262	2	ahora	t	1998848	\N
8484	6	ahora	t	2719744	\N
8486	2	asdfasdf	t	2719744	\N
8488	1	rwetrrwrwrwer	t	2719744	\N
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
-- Data for Name: criterionhoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionhoursgroup (hoursgroupid, criterionid) FROM stdin;
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
3232	9	2009-10-15 20:27:35.463	\N	f	2323	2929
6363	4	2009-10-16 20:19:31.679	\N	f	101	2929
2226	7	2009-08-15 00:00:00	2009-09-15 00:00:00	f	2323	2121
2223	10	2009-10-15 18:58:14.74	\N	f	101	2121
2224	9	2009-09-28 00:00:00	2009-10-16 00:00:00	f	2323	2121
2225	9	2009-10-15 19:03:11.335	2009-10-18 00:00:00	f	2324	2121
2222	10	2009-10-15 18:58:24.89	2009-10-17 00:00:00	f	104	2121
6767	1	2009-10-18 12:52:47.204	\N	f	103	304
8080	1	2009-10-19 10:22:06.661	\N	f	6262	7980
8081	3	2009-10-19 10:22:18.498	\N	f	6262	7979
11009	1	2009-10-19 15:44:49.753	\N	f	8488	10908
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
2719744	6	Alucinacion	pero que pasa	t	t	t	2
1	15	LEAVE	Leave	f	f	t	1
2	11	CATEGORY	Professional category	t	t	t	1
3	9	TRAINING	Training courses and labor training	t	t	t	1
5	5	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
6	1	LOCATION_GROUP	Location where the resource work	t	f	t	0
4	9	JOB	Job	t	t	t	1
1998848	2	LUgo	lugo	t	t	t	2
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id) FROM stdin;
951	GENERIC_DAY	4	4	2010-01-20	304	\N	808
1121	GENERIC_DAY	4	4	2009-10-16	304	\N	808
1061	GENERIC_DAY	4	4	2010-01-15	304	\N	808
1104	GENERIC_DAY	4	4	2010-01-13	304	\N	808
939	GENERIC_DAY	4	4	2009-11-10	306	\N	808
1146	GENERIC_DAY	4	4	2009-12-27	304	\N	808
953	GENERIC_DAY	4	4	2009-12-13	304	\N	808
979	GENERIC_DAY	4	4	2009-11-18	304	\N	808
1024	GENERIC_DAY	4	4	2010-01-19	304	\N	808
910	GENERIC_DAY	4	4	2009-10-30	304	\N	808
982	GENERIC_DAY	4	4	2009-12-03	306	\N	808
1074	GENERIC_DAY	4	4	2010-01-20	306	\N	808
1120	GENERIC_DAY	4	4	2009-12-27	306	\N	808
1115	GENERIC_DAY	4	4	2009-12-07	306	\N	808
960	GENERIC_DAY	4	4	2009-12-02	306	\N	808
1107	GENERIC_DAY	4	4	2009-12-11	306	\N	808
1126	GENERIC_DAY	4	4	2009-11-12	306	\N	808
1143	GENERIC_DAY	4	4	2010-02-06	304	\N	808
1092	GENERIC_DAY	4	4	2010-01-14	304	\N	808
1145	GENERIC_DAY	4	4	2009-12-08	304	\N	808
927	GENERIC_DAY	4	4	2010-02-07	306	\N	808
1044	GENERIC_DAY	4	4	2010-01-23	306	\N	808
1150	GENERIC_DAY	4	4	2010-01-28	304	\N	808
999	GENERIC_DAY	4	4	2010-02-13	304	\N	808
1102	GENERIC_DAY	4	4	2010-02-12	306	\N	808
1155	GENERIC_DAY	4	4	2009-11-20	306	\N	808
1130	GENERIC_DAY	4	4	2009-11-23	304	\N	808
1118	GENERIC_DAY	4	4	2010-02-03	304	\N	808
1109	GENERIC_DAY	4	4	2009-12-03	304	\N	808
1018	GENERIC_DAY	4	4	2010-01-04	304	\N	808
929	GENERIC_DAY	4	4	2009-11-21	306	\N	808
1059	GENERIC_DAY	4	4	2009-12-23	304	\N	808
922	GENERIC_DAY	4	4	2009-11-25	304	\N	808
1035	GENERIC_DAY	4	4	2009-12-15	304	\N	808
1089	GENERIC_DAY	4	4	2009-12-30	304	\N	808
942	GENERIC_DAY	4	4	2010-01-11	304	\N	808
976	GENERIC_DAY	4	4	2009-10-23	304	\N	808
1142	GENERIC_DAY	4	4	2009-12-07	304	\N	808
958	GENERIC_DAY	4	4	2010-01-25	306	\N	808
1075	GENERIC_DAY	4	4	2009-12-14	304	\N	808
1019	GENERIC_DAY	4	4	2009-10-27	306	\N	808
1008	GENERIC_DAY	4	4	2009-12-12	304	\N	808
1129	GENERIC_DAY	4	4	2010-01-30	306	\N	808
972	GENERIC_DAY	4	4	2010-02-12	304	\N	808
1030	GENERIC_DAY	4	4	2009-11-27	306	\N	808
921	GENERIC_DAY	4	4	2010-02-13	306	\N	808
952	GENERIC_DAY	4	4	2009-10-23	306	\N	808
1003	GENERIC_DAY	4	4	2009-12-17	306	\N	808
991	GENERIC_DAY	4	4	2009-11-07	304	\N	808
913	GENERIC_DAY	4	4	2010-01-26	306	\N	808
1017	GENERIC_DAY	4	4	2009-12-09	304	\N	808
1127	GENERIC_DAY	4	4	2010-01-01	306	\N	808
1000	GENERIC_DAY	4	4	2009-12-20	306	\N	808
1119	GENERIC_DAY	4	4	2010-01-29	304	\N	808
1154	GENERIC_DAY	4	4	2010-02-05	304	\N	808
931	GENERIC_DAY	4	4	2009-10-20	306	\N	808
959	GENERIC_DAY	4	4	2010-01-12	306	\N	808
980	GENERIC_DAY	4	4	2009-10-24	306	\N	808
911	GENERIC_DAY	4	4	2010-01-31	306	\N	808
964	GENERIC_DAY	4	4	2009-12-05	306	\N	808
1073	GENERIC_DAY	4	4	2009-12-05	304	\N	808
1095	GENERIC_DAY	4	4	2010-02-04	304	\N	808
994	GENERIC_DAY	4	4	2010-01-11	306	\N	808
1071	GENERIC_DAY	4	4	2010-02-11	304	\N	808
971	GENERIC_DAY	4	4	2009-11-03	306	\N	808
1065	GENERIC_DAY	4	4	2009-12-26	304	\N	808
961	GENERIC_DAY	4	4	2009-12-30	306	\N	808
936	GENERIC_DAY	4	4	2010-01-19	306	\N	808
1066	GENERIC_DAY	4	4	2009-11-06	306	\N	808
965	GENERIC_DAY	4	4	2010-01-02	306	\N	808
1137	GENERIC_DAY	4	4	2009-10-17	304	\N	808
1006	GENERIC_DAY	4	4	2010-01-30	304	\N	808
1147	GENERIC_DAY	4	4	2009-11-19	306	\N	808
1093	GENERIC_DAY	4	4	2009-11-28	304	\N	808
1038	GENERIC_DAY	4	4	2010-02-09	306	\N	808
1021	GENERIC_DAY	4	4	2009-12-26	306	\N	808
935	GENERIC_DAY	4	4	2010-01-07	306	\N	808
969	GENERIC_DAY	4	4	2009-11-17	306	\N	808
1151	GENERIC_DAY	4	4	2009-11-16	304	\N	808
975	GENERIC_DAY	4	4	2010-02-02	304	\N	808
1064	GENERIC_DAY	4	4	2009-11-04	304	\N	808
1036	GENERIC_DAY	4	4	2009-12-18	306	\N	808
1100	GENERIC_DAY	4	4	2010-01-05	306	\N	808
1128	GENERIC_DAY	4	4	2010-01-04	306	\N	808
1004	GENERIC_DAY	4	4	2010-02-11	306	\N	808
1116	GENERIC_DAY	4	4	2010-01-18	306	\N	808
1058	GENERIC_DAY	4	4	2009-11-15	306	\N	808
1049	GENERIC_DAY	4	4	2009-10-21	304	\N	808
1144	GENERIC_DAY	4	4	2010-01-21	306	\N	808
1081	GENERIC_DAY	4	4	2009-10-21	306	\N	808
1041	GENERIC_DAY	4	4	2010-02-05	306	\N	808
1029	GENERIC_DAY	4	4	2009-11-07	306	\N	808
1060	GENERIC_DAY	4	4	2010-02-09	304	\N	808
1001	GENERIC_DAY	4	4	2010-01-13	306	\N	808
955	GENERIC_DAY	4	4	2009-12-22	306	\N	808
1138	GENERIC_DAY	4	4	2009-10-22	304	\N	808
1084	GENERIC_DAY	4	4	2009-11-09	304	\N	808
940	GENERIC_DAY	4	4	2009-12-06	306	\N	808
987	GENERIC_DAY	4	4	2010-01-22	306	\N	808
1054	GENERIC_DAY	4	4	2010-02-15	304	\N	808
1052	GENERIC_DAY	4	4	2010-02-06	306	\N	808
990	GENERIC_DAY	4	4	2010-01-08	304	\N	808
1114	GENERIC_DAY	4	4	2009-12-04	304	\N	808
1090	GENERIC_DAY	4	4	2009-11-16	306	\N	808
1042	GENERIC_DAY	4	4	2009-12-06	304	\N	808
984	GENERIC_DAY	4	4	2010-01-16	304	\N	808
1016	GENERIC_DAY	4	4	2009-12-22	304	\N	808
957	GENERIC_DAY	4	4	2010-02-16	304	\N	808
1123	GENERIC_DAY	4	4	2009-12-24	306	\N	808
1080	GENERIC_DAY	4	4	2009-12-10	304	\N	808
1131	GENERIC_DAY	4	4	2009-11-03	304	\N	808
966	GENERIC_DAY	4	4	2009-11-20	304	\N	808
945	GENERIC_DAY	4	4	2009-11-21	304	\N	808
1031	GENERIC_DAY	4	4	2009-10-15	304	\N	808
937	GENERIC_DAY	4	4	2009-12-29	304	\N	808
924	GENERIC_DAY	4	4	2009-10-24	304	\N	808
909	GENERIC_DAY	4	4	2009-12-08	306	\N	808
1083	GENERIC_DAY	4	4	2009-10-26	306	\N	808
947	GENERIC_DAY	4	4	2010-01-06	304	\N	808
943	GENERIC_DAY	4	4	2009-11-27	304	\N	808
930	GENERIC_DAY	4	4	2010-01-18	304	\N	808
1032	GENERIC_DAY	4	4	2010-01-09	306	\N	808
1037	GENERIC_DAY	4	4	2009-10-29	304	\N	808
978	GENERIC_DAY	4	4	2010-01-03	306	\N	808
1033	GENERIC_DAY	4	4	2009-12-11	304	\N	808
1152	GENERIC_DAY	4	4	2009-10-19	306	\N	808
914	GENERIC_DAY	4	4	2009-12-25	306	\N	808
1139	GENERIC_DAY	4	4	2010-02-16	306	\N	808
1050	GENERIC_DAY	4	4	2009-11-22	304	\N	808
1111	GENERIC_DAY	4	4	2010-01-22	304	\N	808
1062	GENERIC_DAY	4	4	2010-01-27	306	\N	808
1026	GENERIC_DAY	4	4	2009-11-06	304	\N	808
1046	GENERIC_DAY	4	4	2009-11-18	306	\N	808
1134	GENERIC_DAY	4	4	2010-01-15	306	\N	808
1140	GENERIC_DAY	4	4	2009-11-14	304	\N	808
944	GENERIC_DAY	4	4	2010-02-08	304	\N	808
1070	GENERIC_DAY	4	4	2010-02-07	304	\N	808
1141	GENERIC_DAY	4	4	2009-12-01	304	\N	808
989	GENERIC_DAY	4	4	2009-12-13	306	\N	808
1043	GENERIC_DAY	4	4	2010-01-27	304	\N	808
1011	GENERIC_DAY	4	4	2009-12-02	304	\N	808
1034	GENERIC_DAY	4	4	2009-11-14	306	\N	808
1023	GENERIC_DAY	4	4	2009-10-18	306	\N	808
992	GENERIC_DAY	4	4	2009-11-24	306	\N	808
1094	GENERIC_DAY	4	4	2009-11-24	304	\N	808
1040	GENERIC_DAY	4	4	2009-12-23	306	\N	808
925	GENERIC_DAY	4	4	2009-12-16	304	\N	808
1022	GENERIC_DAY	4	4	2009-11-19	304	\N	808
1099	GENERIC_DAY	4	4	2010-01-24	306	\N	808
1132	GENERIC_DAY	4	4	2009-12-16	306	\N	808
932	GENERIC_DAY	4	4	2010-01-10	304	\N	808
977	GENERIC_DAY	4	4	2009-10-15	306	\N	808
1135	GENERIC_DAY	4	4	2009-12-12	306	\N	808
928	GENERIC_DAY	4	4	2010-01-21	304	\N	808
1097	GENERIC_DAY	4	4	2010-01-17	304	\N	808
1069	GENERIC_DAY	4	4	2009-12-18	304	\N	808
981	GENERIC_DAY	4	4	2010-02-10	304	\N	808
983	GENERIC_DAY	4	4	2009-11-08	306	\N	808
1047	GENERIC_DAY	4	4	2010-01-23	304	\N	808
1103	GENERIC_DAY	4	4	2010-02-02	306	\N	808
1125	GENERIC_DAY	4	4	2009-10-31	304	\N	808
970	GENERIC_DAY	4	4	2009-10-18	304	\N	808
993	GENERIC_DAY	4	4	2009-11-13	304	\N	808
933	GENERIC_DAY	4	4	2009-11-04	306	\N	808
963	GENERIC_DAY	4	4	2010-02-14	304	\N	808
1055	GENERIC_DAY	4	4	2010-01-28	306	\N	808
1158	GENERIC_DAY	4	4	2009-12-04	306	\N	808
1020	GENERIC_DAY	4	4	2009-11-05	304	\N	808
1072	GENERIC_DAY	4	4	2009-12-09	306	\N	808
1086	GENERIC_DAY	4	4	2009-11-01	306	\N	808
986	GENERIC_DAY	4	4	2009-11-26	304	\N	808
968	GENERIC_DAY	4	4	2010-02-08	306	\N	808
1051	GENERIC_DAY	4	4	2010-01-29	306	\N	808
1106	GENERIC_DAY	4	4	2009-11-01	304	\N	808
998	GENERIC_DAY	4	4	2010-01-12	304	\N	808
949	GENERIC_DAY	4	4	2009-12-14	306	\N	808
1098	GENERIC_DAY	4	4	2009-11-30	304	\N	808
1078	GENERIC_DAY	4	4	2009-12-24	304	\N	808
1056	GENERIC_DAY	4	4	2010-02-04	306	\N	808
950	GENERIC_DAY	4	4	2010-01-16	306	\N	808
1153	GENERIC_DAY	4	4	2009-12-15	306	\N	808
1053	GENERIC_DAY	4	4	2009-10-16	306	\N	808
1002	GENERIC_DAY	4	4	2009-10-25	306	\N	808
988	GENERIC_DAY	4	4	2009-11-13	306	\N	808
926	GENERIC_DAY	4	4	2009-11-05	306	\N	808
1122	GENERIC_DAY	4	4	2009-10-28	306	\N	808
919	GENERIC_DAY	4	4	2009-11-08	304	\N	808
1108	GENERIC_DAY	4	4	2009-11-23	306	\N	808
1117	GENERIC_DAY	4	4	2010-01-07	304	\N	808
1027	GENERIC_DAY	4	4	2009-12-20	304	\N	808
1124	GENERIC_DAY	4	4	2010-01-09	304	\N	808
1007	GENERIC_DAY	4	4	2009-11-28	306	\N	808
1013	GENERIC_DAY	4	4	2009-12-28	306	\N	808
1101	GENERIC_DAY	4	4	2009-10-30	306	\N	808
1063	GENERIC_DAY	4	4	2010-02-14	306	\N	808
1076	GENERIC_DAY	4	4	2010-01-14	306	\N	808
1148	GENERIC_DAY	4	4	2009-11-11	306	\N	808
1096	GENERIC_DAY	4	4	2010-02-15	306	\N	808
1068	GENERIC_DAY	4	4	2010-01-31	304	\N	808
1009	GENERIC_DAY	4	4	2009-10-26	304	\N	808
1039	GENERIC_DAY	4	4	2010-02-01	304	\N	808
941	GENERIC_DAY	4	4	2009-11-02	306	\N	808
938	GENERIC_DAY	4	4	2010-01-01	304	\N	808
1077	GENERIC_DAY	4	4	2009-11-26	306	\N	808
985	GENERIC_DAY	4	4	2009-12-19	306	\N	808
1091	GENERIC_DAY	4	4	2009-10-22	306	\N	808
920	GENERIC_DAY	4	4	2009-10-28	304	\N	808
974	GENERIC_DAY	4	4	2010-01-10	306	\N	808
1057	GENERIC_DAY	4	4	2010-01-08	306	\N	808
946	GENERIC_DAY	4	4	2009-11-02	304	\N	808
1028	GENERIC_DAY	4	4	2010-01-02	304	\N	808
1157	GENERIC_DAY	4	4	2009-11-29	306	\N	808
973	GENERIC_DAY	4	4	2010-01-03	304	\N	808
1025	GENERIC_DAY	4	4	2009-10-29	306	\N	808
1012	GENERIC_DAY	4	4	2010-02-01	306	\N	808
962	GENERIC_DAY	4	4	2009-11-22	306	\N	808
1048	GENERIC_DAY	4	4	2009-10-25	304	\N	808
1010	GENERIC_DAY	4	4	2009-10-31	306	\N	808
912	GENERIC_DAY	4	4	2010-01-25	304	\N	808
1067	GENERIC_DAY	4	4	2009-11-25	306	\N	808
915	GENERIC_DAY	4	4	2010-02-10	306	\N	808
1112	GENERIC_DAY	4	4	2009-12-25	304	\N	808
967	GENERIC_DAY	4	4	2009-12-01	306	\N	808
1133	GENERIC_DAY	4	4	2009-11-29	304	\N	808
916	GENERIC_DAY	4	4	2009-11-12	304	\N	808
1085	GENERIC_DAY	4	4	2009-12-31	306	\N	808
923	GENERIC_DAY	4	4	2009-10-17	306	\N	808
948	GENERIC_DAY	4	4	2009-11-30	306	\N	808
1105	GENERIC_DAY	4	4	2010-01-05	304	\N	808
1079	GENERIC_DAY	4	4	2010-02-03	306	\N	808
996	GENERIC_DAY	4	4	2010-01-06	306	\N	808
1110	GENERIC_DAY	4	4	2009-12-10	306	\N	808
934	GENERIC_DAY	4	4	2009-10-19	304	\N	808
1087	GENERIC_DAY	4	4	2009-11-11	304	\N	808
1014	GENERIC_DAY	4	4	2009-10-27	304	\N	808
1088	GENERIC_DAY	4	4	2009-11-17	304	\N	808
1156	GENERIC_DAY	4	4	2009-10-20	304	\N	808
1082	GENERIC_DAY	4	4	2009-12-19	304	\N	808
1149	GENERIC_DAY	4	4	2010-01-26	304	\N	808
1045	GENERIC_DAY	4	4	2010-01-24	304	\N	808
997	GENERIC_DAY	4	4	2009-12-21	306	\N	808
995	GENERIC_DAY	4	4	2009-12-31	304	\N	808
1136	GENERIC_DAY	4	4	2009-12-28	304	\N	808
954	GENERIC_DAY	4	4	2009-11-10	304	\N	808
918	GENERIC_DAY	4	4	2009-11-15	304	\N	808
1015	GENERIC_DAY	4	4	2009-12-17	304	\N	808
1005	GENERIC_DAY	4	4	2009-11-09	306	\N	808
1113	GENERIC_DAY	4	4	2010-01-17	306	\N	808
917	GENERIC_DAY	4	4	2009-12-29	306	\N	808
956	GENERIC_DAY	4	4	2009-12-21	304	\N	808
2525	GENERIC_DAY	0	3	2010-10-06	304	\N	2424
2526	GENERIC_DAY	0	2	2010-08-30	2121	\N	2424
2527	GENERIC_DAY	0	3	2010-10-11	306	\N	2424
2528	GENERIC_DAY	0	3	2010-07-02	304	\N	2424
2529	GENERIC_DAY	0	2	2010-08-06	2121	\N	2424
2530	GENERIC_DAY	0	3	2010-07-13	306	\N	2424
2531	GENERIC_DAY	0	2	2010-08-22	2121	\N	2424
2532	GENERIC_DAY	0	3	2010-07-10	304	\N	2424
2533	GENERIC_DAY	0	3	2010-07-06	306	\N	2424
2534	GENERIC_DAY	0	2	2010-10-20	2121	\N	2424
2535	GENERIC_DAY	0	2	2010-07-26	2121	\N	2424
2536	GENERIC_DAY	0	3	2010-09-13	306	\N	2424
2537	GENERIC_DAY	0	3	2010-07-21	306	\N	2424
2538	GENERIC_DAY	0	2	2010-09-18	2121	\N	2424
2539	GENERIC_DAY	0	3	2010-10-23	306	\N	2424
2540	GENERIC_DAY	0	2	2010-06-29	2121	\N	2424
2541	GENERIC_DAY	0	2	2010-10-18	2121	\N	2424
2542	GENERIC_DAY	0	2	2010-08-16	2121	\N	2424
2543	GENERIC_DAY	0	3	2010-08-02	304	\N	2424
2544	GENERIC_DAY	0	2	2010-09-05	2121	\N	2424
2545	GENERIC_DAY	0	2	2010-07-20	2121	\N	2424
2546	GENERIC_DAY	0	3	2010-09-20	306	\N	2424
2547	GENERIC_DAY	0	2	2010-08-18	2121	\N	2424
2548	GENERIC_DAY	0	2	2010-10-25	2121	\N	2424
2549	GENERIC_DAY	0	3	2010-07-22	306	\N	2424
2550	GENERIC_DAY	0	2	2010-10-19	2121	\N	2424
2551	GENERIC_DAY	0	2	2010-09-12	2121	\N	2424
2552	GENERIC_DAY	0	3	2010-06-30	306	\N	2424
2553	GENERIC_DAY	0	3	2010-10-13	306	\N	2424
2554	GENERIC_DAY	0	2	2010-07-12	2121	\N	2424
2555	GENERIC_DAY	0	3	2010-07-09	304	\N	2424
2556	GENERIC_DAY	0	3	2010-08-11	306	\N	2424
2557	GENERIC_DAY	0	2	2010-09-16	2121	\N	2424
2558	GENERIC_DAY	0	3	2010-08-08	304	\N	2424
2559	GENERIC_DAY	0	3	2010-08-22	304	\N	2424
2560	GENERIC_DAY	0	3	2010-08-04	304	\N	2424
2561	GENERIC_DAY	0	3	2010-10-09	306	\N	2424
2562	GENERIC_DAY	0	3	2010-08-15	304	\N	2424
2563	GENERIC_DAY	0	2	2010-09-30	2121	\N	2424
2564	GENERIC_DAY	0	2	2010-06-25	2121	\N	2424
2565	GENERIC_DAY	0	2	2010-07-21	2121	\N	2424
2566	GENERIC_DAY	0	3	2010-07-25	304	\N	2424
2567	GENERIC_DAY	0	3	2010-09-29	304	\N	2424
2568	GENERIC_DAY	0	3	2010-09-05	306	\N	2424
2569	GENERIC_DAY	0	2	2010-07-24	2121	\N	2424
2570	GENERIC_DAY	0	2	2010-09-22	2121	\N	2424
2571	GENERIC_DAY	0	2	2010-08-12	2121	\N	2424
2572	GENERIC_DAY	0	3	2010-08-26	304	\N	2424
2573	GENERIC_DAY	0	3	2010-10-04	306	\N	2424
2574	GENERIC_DAY	0	3	2010-08-23	306	\N	2424
2575	GENERIC_DAY	0	3	2010-08-17	304	\N	2424
2576	GENERIC_DAY	0	3	2010-08-25	306	\N	2424
2577	GENERIC_DAY	0	3	2010-08-28	304	\N	2424
2578	GENERIC_DAY	0	2	2010-10-02	2121	\N	2424
2579	GENERIC_DAY	0	2	2010-07-18	2121	\N	2424
2580	GENERIC_DAY	0	3	2010-06-28	306	\N	2424
2581	GENERIC_DAY	0	3	2010-08-24	306	\N	2424
2582	GENERIC_DAY	0	3	2010-07-26	304	\N	2424
2583	GENERIC_DAY	0	2	2010-07-16	2121	\N	2424
2584	GENERIC_DAY	0	3	2010-07-08	304	\N	2424
2585	GENERIC_DAY	0	3	2010-08-04	306	\N	2424
2586	GENERIC_DAY	0	3	2010-09-30	304	\N	2424
2587	GENERIC_DAY	0	3	2010-09-27	304	\N	2424
2588	GENERIC_DAY	0	3	2010-07-21	304	\N	2424
2589	GENERIC_DAY	0	3	2010-09-24	306	\N	2424
2590	GENERIC_DAY	0	2	2010-07-27	2121	\N	2424
2591	GENERIC_DAY	0	3	2010-07-28	306	\N	2424
2592	GENERIC_DAY	0	2	2010-07-07	2121	\N	2424
2593	GENERIC_DAY	0	3	2010-10-20	304	\N	2424
2594	GENERIC_DAY	0	2	2010-08-23	2121	\N	2424
2595	GENERIC_DAY	0	2	2010-08-24	2121	\N	2424
2596	GENERIC_DAY	0	2	2010-08-28	2121	\N	2424
2597	GENERIC_DAY	0	3	2010-07-27	306	\N	2424
2598	GENERIC_DAY	0	3	2010-08-03	304	\N	2424
2599	GENERIC_DAY	0	3	2010-10-11	304	\N	2424
2600	GENERIC_DAY	0	3	2010-10-07	306	\N	2424
2601	GENERIC_DAY	0	3	2010-06-25	304	\N	2424
2602	GENERIC_DAY	0	2	2010-08-05	2121	\N	2424
2603	GENERIC_DAY	0	2	2010-09-07	2121	\N	2424
2604	GENERIC_DAY	0	2	2010-07-06	2121	\N	2424
2605	GENERIC_DAY	0	3	2010-08-08	306	\N	2424
2606	GENERIC_DAY	0	2	2010-09-13	2121	\N	2424
2607	GENERIC_DAY	0	3	2010-08-01	306	\N	2424
2608	GENERIC_DAY	0	2	2010-09-09	2121	\N	2424
2609	GENERIC_DAY	0	3	2010-08-25	304	\N	2424
2610	GENERIC_DAY	0	2	2010-07-17	2121	\N	2424
2611	GENERIC_DAY	0	3	2010-10-22	304	\N	2424
2612	GENERIC_DAY	0	3	2010-08-01	304	\N	2424
2613	GENERIC_DAY	0	2	2010-08-14	2121	\N	2424
2614	GENERIC_DAY	0	3	2010-08-19	306	\N	2424
2615	GENERIC_DAY	0	2	2010-08-03	2121	\N	2424
2616	GENERIC_DAY	0	3	2010-08-22	306	\N	2424
2617	GENERIC_DAY	0	3	2010-09-03	304	\N	2424
2618	GENERIC_DAY	0	3	2010-08-10	306	\N	2424
2619	GENERIC_DAY	0	3	2010-07-01	306	\N	2424
2620	GENERIC_DAY	0	3	2010-07-12	306	\N	2424
2621	GENERIC_DAY	0	2	2010-10-08	2121	\N	2424
2622	GENERIC_DAY	0	3	2010-06-26	306	\N	2424
2623	GENERIC_DAY	0	2	2010-07-14	2121	\N	2424
2624	GENERIC_DAY	0	3	2010-09-22	304	\N	2424
2625	GENERIC_DAY	0	2	2010-09-25	2121	\N	2424
2626	GENERIC_DAY	0	3	2010-07-19	304	\N	2424
2627	GENERIC_DAY	0	3	2010-10-08	304	\N	2424
2628	GENERIC_DAY	0	3	2010-08-13	306	\N	2424
2629	GENERIC_DAY	0	3	2010-09-28	306	\N	2424
2630	GENERIC_DAY	0	3	2010-06-24	306	\N	2424
2631	GENERIC_DAY	0	2	2010-08-17	2121	\N	2424
2632	GENERIC_DAY	0	3	2010-10-03	306	\N	2424
2633	GENERIC_DAY	0	3	2010-07-07	304	\N	2424
2634	GENERIC_DAY	0	3	2010-09-26	304	\N	2424
2635	GENERIC_DAY	0	3	2010-08-24	304	\N	2424
2636	GENERIC_DAY	0	3	2010-09-29	306	\N	2424
2637	GENERIC_DAY	0	3	2010-07-28	304	\N	2424
2638	GENERIC_DAY	0	3	2010-09-02	306	\N	2424
2639	GENERIC_DAY	0	3	2010-10-23	304	\N	2424
2640	GENERIC_DAY	0	3	2010-09-11	306	\N	2424
2641	GENERIC_DAY	0	3	2010-08-29	304	\N	2424
2642	GENERIC_DAY	0	3	2010-07-17	304	\N	2424
2643	GENERIC_DAY	0	3	2010-07-26	306	\N	2424
2644	GENERIC_DAY	0	3	2010-09-25	304	\N	2424
2645	GENERIC_DAY	0	2	2010-09-24	2121	\N	2424
2646	GENERIC_DAY	0	3	2010-09-17	306	\N	2424
2647	GENERIC_DAY	0	3	2010-09-08	304	\N	2424
2648	GENERIC_DAY	0	3	2010-09-12	306	\N	2424
2649	GENERIC_DAY	0	3	2010-08-14	306	\N	2424
2650	GENERIC_DAY	0	2	2010-10-10	2121	\N	2424
2651	GENERIC_DAY	0	3	2010-06-29	306	\N	2424
2652	GENERIC_DAY	0	3	2010-06-28	304	\N	2424
2653	GENERIC_DAY	0	3	2010-10-15	306	\N	2424
2654	GENERIC_DAY	0	2	2010-10-11	2121	\N	2424
2655	GENERIC_DAY	0	3	2010-08-12	306	\N	2424
2656	GENERIC_DAY	0	3	2010-09-30	306	\N	2424
2657	GENERIC_DAY	0	2	2010-07-28	2121	\N	2424
2658	GENERIC_DAY	0	2	2010-08-15	2121	\N	2424
2659	GENERIC_DAY	0	3	2010-10-18	306	\N	2424
2660	GENERIC_DAY	0	3	2010-10-12	304	\N	2424
2661	GENERIC_DAY	0	2	2010-09-28	2121	\N	2424
2662	GENERIC_DAY	0	3	2010-07-16	306	\N	2424
2663	GENERIC_DAY	0	3	2010-07-11	306	\N	2424
2664	GENERIC_DAY	0	3	2010-09-05	304	\N	2424
2665	GENERIC_DAY	0	2	2010-08-31	2121	\N	2424
2666	GENERIC_DAY	0	3	2010-07-30	306	\N	2424
2667	GENERIC_DAY	0	2	2010-10-03	2121	\N	2424
2668	GENERIC_DAY	0	3	2010-09-10	306	\N	2424
2669	GENERIC_DAY	0	3	2010-09-06	304	\N	2424
2670	GENERIC_DAY	0	3	2010-09-21	304	\N	2424
2671	GENERIC_DAY	0	3	2010-09-23	306	\N	2424
2672	GENERIC_DAY	0	3	2010-09-08	306	\N	2424
2673	GENERIC_DAY	0	3	2010-07-20	304	\N	2424
2674	GENERIC_DAY	0	3	2010-07-14	306	\N	2424
2675	GENERIC_DAY	0	3	2010-09-15	304	\N	2424
2676	GENERIC_DAY	0	3	2010-09-03	306	\N	2424
2677	GENERIC_DAY	0	2	2010-08-29	2121	\N	2424
2678	GENERIC_DAY	0	3	2010-08-12	304	\N	2424
2679	GENERIC_DAY	0	2	2010-10-04	2121	\N	2424
2680	GENERIC_DAY	0	2	2010-08-10	2121	\N	2424
2681	GENERIC_DAY	0	3	2010-10-16	304	\N	2424
2682	GENERIC_DAY	0	3	2010-10-02	304	\N	2424
2683	GENERIC_DAY	0	2	2010-09-26	2121	\N	2424
2684	GENERIC_DAY	0	3	2010-07-10	306	\N	2424
2685	GENERIC_DAY	0	3	2010-07-02	306	\N	2424
2686	GENERIC_DAY	0	3	2010-08-09	304	\N	2424
2687	GENERIC_DAY	0	3	2010-08-28	306	\N	2424
2688	GENERIC_DAY	0	3	2010-08-31	304	\N	2424
2689	GENERIC_DAY	0	3	2010-08-13	304	\N	2424
2690	GENERIC_DAY	0	3	2010-09-09	306	\N	2424
2691	GENERIC_DAY	0	3	2010-09-02	304	\N	2424
2692	GENERIC_DAY	0	3	2010-07-29	306	\N	2424
2693	GENERIC_DAY	0	3	2010-10-12	306	\N	2424
2694	GENERIC_DAY	0	2	2010-06-30	2121	\N	2424
2695	GENERIC_DAY	0	3	2010-09-18	304	\N	2424
2696	GENERIC_DAY	0	2	2010-08-26	2121	\N	2424
2697	GENERIC_DAY	0	3	2010-08-20	304	\N	2424
2698	GENERIC_DAY	0	3	2010-09-13	304	\N	2424
2699	GENERIC_DAY	0	3	2010-09-07	306	\N	2424
2700	GENERIC_DAY	0	2	2010-07-19	2121	\N	2424
2701	GENERIC_DAY	0	2	2010-08-19	2121	\N	2424
2702	GENERIC_DAY	0	3	2010-10-10	306	\N	2424
2703	GENERIC_DAY	0	3	2010-08-06	306	\N	2424
2704	GENERIC_DAY	0	2	2010-09-06	2121	\N	2424
2705	GENERIC_DAY	0	3	2010-10-08	306	\N	2424
2706	GENERIC_DAY	0	2	2010-10-09	2121	\N	2424
2707	GENERIC_DAY	0	2	2010-07-13	2121	\N	2424
2708	GENERIC_DAY	0	3	2010-08-05	304	\N	2424
2709	GENERIC_DAY	0	2	2010-08-09	2121	\N	2424
2710	GENERIC_DAY	0	3	2010-10-03	304	\N	2424
2711	GENERIC_DAY	0	3	2010-08-26	306	\N	2424
2712	GENERIC_DAY	0	3	2010-07-30	304	\N	2424
2713	GENERIC_DAY	0	3	2010-09-10	304	\N	2424
2714	GENERIC_DAY	0	3	2010-09-17	304	\N	2424
2715	GENERIC_DAY	0	3	2010-10-01	306	\N	2424
2716	GENERIC_DAY	0	3	2010-08-07	306	\N	2424
2717	GENERIC_DAY	0	3	2010-07-31	304	\N	2424
2718	GENERIC_DAY	0	3	2010-10-15	304	\N	2424
2719	GENERIC_DAY	0	3	2010-09-01	306	\N	2424
2720	GENERIC_DAY	0	2	2010-09-14	2121	\N	2424
2721	GENERIC_DAY	0	2	2010-09-19	2121	\N	2424
2722	GENERIC_DAY	0	3	2010-07-13	304	\N	2424
2723	GENERIC_DAY	0	2	2010-08-27	2121	\N	2424
2724	GENERIC_DAY	0	3	2010-09-11	304	\N	2424
2725	GENERIC_DAY	0	2	2010-09-20	2121	\N	2424
2726	GENERIC_DAY	0	2	2010-09-10	2121	\N	2424
2727	GENERIC_DAY	0	3	2010-06-27	304	\N	2424
2728	GENERIC_DAY	0	3	2010-09-16	306	\N	2424
2729	GENERIC_DAY	0	2	2010-09-15	2121	\N	2424
2730	GENERIC_DAY	0	3	2010-08-19	304	\N	2424
2731	GENERIC_DAY	0	2	2010-08-20	2121	\N	2424
2732	GENERIC_DAY	0	2	2010-10-14	2121	\N	2424
2733	GENERIC_DAY	0	2	2010-07-10	2121	\N	2424
2734	GENERIC_DAY	0	3	2010-09-28	304	\N	2424
2735	GENERIC_DAY	0	3	2010-10-18	304	\N	2424
2736	GENERIC_DAY	0	2	2010-10-12	2121	\N	2424
2737	GENERIC_DAY	0	3	2010-10-01	304	\N	2424
2738	GENERIC_DAY	0	2	2010-07-29	2121	\N	2424
2739	GENERIC_DAY	0	3	2010-09-15	306	\N	2424
2740	GENERIC_DAY	0	3	2010-10-25	304	\N	2424
2741	GENERIC_DAY	0	3	2010-07-03	304	\N	2424
2742	GENERIC_DAY	0	3	2010-09-01	304	\N	2424
2743	GENERIC_DAY	0	3	2010-08-05	306	\N	2424
2744	GENERIC_DAY	0	3	2010-10-21	306	\N	2424
2745	GENERIC_DAY	0	2	2010-09-27	2121	\N	2424
2746	GENERIC_DAY	0	3	2010-07-23	306	\N	2424
2747	GENERIC_DAY	0	3	2010-08-14	304	\N	2424
2748	GENERIC_DAY	0	3	2010-08-29	306	\N	2424
2749	GENERIC_DAY	0	3	2010-07-17	306	\N	2424
2750	GENERIC_DAY	0	3	2010-07-05	306	\N	2424
2751	GENERIC_DAY	0	2	2010-09-23	2121	\N	2424
2752	GENERIC_DAY	0	3	2010-08-16	304	\N	2424
2753	GENERIC_DAY	0	3	2010-10-19	304	\N	2424
2754	GENERIC_DAY	0	3	2010-08-21	304	\N	2424
2755	GENERIC_DAY	0	2	2010-09-21	2121	\N	2424
2756	GENERIC_DAY	0	3	2010-08-03	306	\N	2424
2757	GENERIC_DAY	0	3	2010-10-10	304	\N	2424
2758	GENERIC_DAY	0	3	2010-08-15	306	\N	2424
2759	GENERIC_DAY	0	3	2010-09-14	304	\N	2424
2760	GENERIC_DAY	0	3	2010-10-06	306	\N	2424
2761	GENERIC_DAY	0	3	2010-09-12	304	\N	2424
2762	GENERIC_DAY	0	3	2010-09-04	304	\N	2424
2763	GENERIC_DAY	0	3	2010-10-07	304	\N	2424
2764	GENERIC_DAY	0	3	2010-09-07	304	\N	2424
2765	GENERIC_DAY	0	3	2010-10-17	306	\N	2424
2766	GENERIC_DAY	0	3	2010-07-07	306	\N	2424
2767	GENERIC_DAY	0	3	2010-09-21	306	\N	2424
2768	GENERIC_DAY	0	2	2010-10-23	2121	\N	2424
2769	GENERIC_DAY	0	3	2010-08-11	304	\N	2424
2770	GENERIC_DAY	0	2	2010-09-02	2121	\N	2424
2771	GENERIC_DAY	0	3	2010-06-26	304	\N	2424
2772	GENERIC_DAY	0	2	2010-07-01	2121	\N	2424
2773	GENERIC_DAY	0	3	2010-07-03	306	\N	2424
2774	GENERIC_DAY	0	3	2010-09-19	304	\N	2424
2775	GENERIC_DAY	0	3	2010-07-12	304	\N	2424
2776	GENERIC_DAY	0	2	2010-08-21	2121	\N	2424
2777	GENERIC_DAY	0	2	2010-07-22	2121	\N	2424
2778	GENERIC_DAY	0	3	2010-09-26	306	\N	2424
2779	GENERIC_DAY	0	2	2010-07-11	2121	\N	2424
2780	GENERIC_DAY	0	2	2010-07-05	2121	\N	2424
2781	GENERIC_DAY	0	3	2010-10-25	306	\N	2424
2782	GENERIC_DAY	0	3	2010-08-16	306	\N	2424
2783	GENERIC_DAY	0	2	2010-07-25	2121	\N	2424
2784	GENERIC_DAY	0	2	2010-07-03	2121	\N	2424
2785	GENERIC_DAY	0	2	2010-10-06	2121	\N	2424
2786	GENERIC_DAY	0	2	2010-09-29	2121	\N	2424
2787	GENERIC_DAY	0	2	2010-09-17	2121	\N	2424
2788	GENERIC_DAY	0	2	2010-09-11	2121	\N	2424
2789	GENERIC_DAY	0	3	2010-10-24	306	\N	2424
2790	GENERIC_DAY	0	3	2010-08-18	306	\N	2424
2791	GENERIC_DAY	0	2	2010-06-23	2121	\N	2424
2792	GENERIC_DAY	0	3	2010-10-24	304	\N	2424
2793	GENERIC_DAY	0	3	2010-08-07	304	\N	2424
2794	GENERIC_DAY	0	2	2010-08-13	2121	\N	2424
2795	GENERIC_DAY	0	3	2010-08-31	306	\N	2424
2796	GENERIC_DAY	0	3	2010-07-01	304	\N	2424
2797	GENERIC_DAY	0	3	2010-06-24	304	\N	2424
2798	GENERIC_DAY	0	3	2010-08-27	306	\N	2424
2799	GENERIC_DAY	0	3	2010-07-25	306	\N	2424
2800	GENERIC_DAY	0	3	2010-06-23	306	\N	2424
2801	GENERIC_DAY	0	3	2010-08-09	306	\N	2424
2802	GENERIC_DAY	0	3	2010-08-23	304	\N	2424
2803	GENERIC_DAY	0	2	2010-06-27	2121	\N	2424
2804	GENERIC_DAY	0	3	2010-08-30	306	\N	2424
2805	GENERIC_DAY	0	3	2010-07-15	304	\N	2424
2806	GENERIC_DAY	0	3	2010-06-29	304	\N	2424
2807	GENERIC_DAY	0	3	2010-09-20	304	\N	2424
2808	GENERIC_DAY	0	2	2010-08-07	2121	\N	2424
2809	GENERIC_DAY	0	3	2010-10-02	306	\N	2424
2810	GENERIC_DAY	0	2	2010-10-01	2121	\N	2424
2811	GENERIC_DAY	0	3	2010-07-29	304	\N	2424
2812	GENERIC_DAY	0	3	2010-10-17	304	\N	2424
2813	GENERIC_DAY	0	2	2010-10-22	2121	\N	2424
2814	GENERIC_DAY	0	3	2010-08-06	304	\N	2424
2815	GENERIC_DAY	0	3	2010-06-27	306	\N	2424
2816	GENERIC_DAY	0	3	2010-08-27	304	\N	2424
2817	GENERIC_DAY	0	3	2010-07-18	306	\N	2424
2818	GENERIC_DAY	0	2	2010-07-23	2121	\N	2424
2819	GENERIC_DAY	0	2	2010-09-08	2121	\N	2424
2820	GENERIC_DAY	0	3	2010-10-05	304	\N	2424
2821	GENERIC_DAY	0	2	2010-08-08	2121	\N	2424
2822	GENERIC_DAY	0	3	2010-07-19	306	\N	2424
2823	GENERIC_DAY	0	3	2010-07-14	304	\N	2424
2824	GENERIC_DAY	0	3	2010-07-27	304	\N	2424
2825	GENERIC_DAY	0	2	2010-07-30	2121	\N	2424
2826	GENERIC_DAY	0	2	2010-08-02	2121	\N	2424
2827	GENERIC_DAY	0	2	2010-09-03	2121	\N	2424
2828	GENERIC_DAY	0	3	2010-07-24	306	\N	2424
2829	GENERIC_DAY	0	3	2010-07-22	304	\N	2424
2830	GENERIC_DAY	0	3	2010-09-16	304	\N	2424
2831	GENERIC_DAY	0	3	2010-08-17	306	\N	2424
2832	GENERIC_DAY	0	2	2010-06-26	2121	\N	2424
2833	GENERIC_DAY	0	3	2010-09-04	306	\N	2424
2834	GENERIC_DAY	0	3	2010-07-24	304	\N	2424
2835	GENERIC_DAY	0	3	2010-09-27	306	\N	2424
2836	GENERIC_DAY	0	2	2010-09-04	2121	\N	2424
2837	GENERIC_DAY	0	3	2010-07-18	304	\N	2424
2838	GENERIC_DAY	0	3	2010-08-20	306	\N	2424
2839	GENERIC_DAY	0	3	2010-07-04	304	\N	2424
2840	GENERIC_DAY	0	3	2010-10-13	304	\N	2424
2841	GENERIC_DAY	0	2	2010-08-25	2121	\N	2424
2842	GENERIC_DAY	0	2	2010-10-17	2121	\N	2424
2843	GENERIC_DAY	0	2	2010-07-02	2121	\N	2424
2844	GENERIC_DAY	0	3	2010-10-09	304	\N	2424
2845	GENERIC_DAY	0	2	2010-10-05	2121	\N	2424
2846	GENERIC_DAY	0	3	2010-06-30	304	\N	2424
2847	GENERIC_DAY	0	3	2010-09-24	304	\N	2424
2848	GENERIC_DAY	0	2	2010-10-24	2121	\N	2424
2849	GENERIC_DAY	0	3	2010-09-19	306	\N	2424
2850	GENERIC_DAY	0	2	2010-06-24	2121	\N	2424
2851	GENERIC_DAY	0	3	2010-07-11	304	\N	2424
2852	GENERIC_DAY	0	3	2010-09-23	304	\N	2424
2853	GENERIC_DAY	0	3	2010-09-22	306	\N	2424
2854	GENERIC_DAY	0	3	2010-07-15	306	\N	2424
2855	GENERIC_DAY	0	2	2010-07-09	2121	\N	2424
2856	GENERIC_DAY	0	2	2010-10-15	2121	\N	2424
2857	GENERIC_DAY	0	3	2010-10-22	306	\N	2424
2858	GENERIC_DAY	0	3	2010-08-02	306	\N	2424
2859	GENERIC_DAY	0	2	2010-09-01	2121	\N	2424
2860	GENERIC_DAY	0	3	2010-07-23	304	\N	2424
2861	GENERIC_DAY	0	2	2010-08-04	2121	\N	2424
2862	GENERIC_DAY	0	2	2010-10-21	2121	\N	2424
2863	GENERIC_DAY	0	3	2010-09-06	306	\N	2424
2864	GENERIC_DAY	0	3	2010-10-19	306	\N	2424
2865	GENERIC_DAY	0	3	2010-08-21	306	\N	2424
2866	GENERIC_DAY	0	3	2010-09-25	306	\N	2424
2867	GENERIC_DAY	0	2	2010-07-04	2121	\N	2424
2868	GENERIC_DAY	0	2	2010-08-11	2121	\N	2424
2869	GENERIC_DAY	0	3	2010-07-09	306	\N	2424
2870	GENERIC_DAY	0	2	2010-08-01	2121	\N	2424
2871	GENERIC_DAY	0	3	2010-08-18	304	\N	2424
2872	GENERIC_DAY	0	2	2010-10-13	2121	\N	2424
2873	GENERIC_DAY	0	3	2010-07-16	304	\N	2424
2874	GENERIC_DAY	0	3	2010-06-25	306	\N	2424
2875	GENERIC_DAY	0	3	2010-10-04	304	\N	2424
2876	GENERIC_DAY	0	3	2010-07-08	306	\N	2424
2877	GENERIC_DAY	0	3	2010-06-23	304	\N	2424
2878	GENERIC_DAY	0	2	2010-07-31	2121	\N	2424
2879	GENERIC_DAY	0	3	2010-10-14	306	\N	2424
2880	GENERIC_DAY	0	3	2010-09-18	306	\N	2424
2881	GENERIC_DAY	0	3	2010-07-06	304	\N	2424
2882	GENERIC_DAY	0	3	2010-07-31	306	\N	2424
2883	GENERIC_DAY	0	3	2010-10-16	306	\N	2424
2884	GENERIC_DAY	0	3	2010-09-14	306	\N	2424
2885	GENERIC_DAY	0	2	2010-07-15	2121	\N	2424
2886	GENERIC_DAY	0	3	2010-10-20	306	\N	2424
2887	GENERIC_DAY	0	3	2010-08-10	304	\N	2424
2888	GENERIC_DAY	0	3	2010-10-14	304	\N	2424
2889	GENERIC_DAY	0	2	2010-07-08	2121	\N	2424
2890	GENERIC_DAY	0	2	2010-10-07	2121	\N	2424
2891	GENERIC_DAY	0	3	2010-10-21	304	\N	2424
2892	GENERIC_DAY	0	3	2010-10-05	306	\N	2424
2893	GENERIC_DAY	0	3	2010-08-30	304	\N	2424
2894	GENERIC_DAY	0	3	2010-09-09	304	\N	2424
2895	GENERIC_DAY	0	3	2010-07-20	306	\N	2424
2896	GENERIC_DAY	0	3	2010-07-04	306	\N	2424
2897	GENERIC_DAY	0	3	2010-07-05	304	\N	2424
2898	GENERIC_DAY	0	2	2010-10-16	2121	\N	2424
2899	GENERIC_DAY	0	2	2010-06-28	2121	\N	2424
7658	SPECIFIC_DAY	0	8	2009-11-07	306	6970	\N
7659	SPECIFIC_DAY	0	8	2009-10-23	306	6970	\N
7660	SPECIFIC_DAY	0	8	2009-11-21	306	6970	\N
7661	SPECIFIC_DAY	0	8	2009-12-14	306	6970	\N
7662	SPECIFIC_DAY	0	8	2009-12-06	306	6970	\N
7663	SPECIFIC_DAY	0	8	2009-12-09	306	6970	\N
7664	SPECIFIC_DAY	0	8	2009-10-27	306	6970	\N
7665	SPECIFIC_DAY	0	8	2009-12-15	306	6970	\N
7666	SPECIFIC_DAY	0	8	2009-10-18	306	6970	\N
7667	SPECIFIC_DAY	0	8	2009-11-20	306	6970	\N
7668	SPECIFIC_DAY	0	8	2009-10-31	306	6970	\N
7669	SPECIFIC_DAY	0	8	2009-11-01	306	6970	\N
7670	SPECIFIC_DAY	0	8	2009-10-28	306	6970	\N
7671	SPECIFIC_DAY	0	8	2009-10-30	306	6970	\N
7672	SPECIFIC_DAY	0	8	2009-11-19	306	6970	\N
7673	SPECIFIC_DAY	0	8	2009-11-29	306	6970	\N
7674	SPECIFIC_DAY	0	8	2009-10-19	306	6970	\N
7675	SPECIFIC_DAY	0	8	2009-11-26	306	6970	\N
7676	SPECIFIC_DAY	0	8	2009-12-13	306	6970	\N
7677	SPECIFIC_DAY	0	8	2009-12-02	306	6970	\N
7678	SPECIFIC_DAY	0	8	2009-12-11	306	6970	\N
7679	SPECIFIC_DAY	0	8	2009-11-06	306	6970	\N
7680	SPECIFIC_DAY	0	8	2009-11-04	306	6970	\N
7681	SPECIFIC_DAY	0	8	2009-11-14	306	6970	\N
7682	SPECIFIC_DAY	0	8	2009-11-15	306	6970	\N
7683	SPECIFIC_DAY	0	8	2009-11-17	306	6970	\N
7684	SPECIFIC_DAY	0	8	2009-12-03	306	6970	\N
7685	SPECIFIC_DAY	0	8	2009-11-22	306	6970	\N
7686	SPECIFIC_DAY	0	8	2009-10-15	306	6970	\N
7687	SPECIFIC_DAY	0	8	2009-10-25	306	6970	\N
7688	SPECIFIC_DAY	0	8	2009-11-24	306	6970	\N
7689	SPECIFIC_DAY	0	8	2009-12-12	306	6970	\N
7690	SPECIFIC_DAY	0	8	2009-11-05	306	6970	\N
7691	SPECIFIC_DAY	0	8	2009-11-18	306	6970	\N
7692	SPECIFIC_DAY	0	8	2009-11-27	306	6970	\N
7693	SPECIFIC_DAY	0	8	2009-12-01	306	6970	\N
7694	SPECIFIC_DAY	0	8	2009-11-08	306	6970	\N
7695	SPECIFIC_DAY	0	8	2009-11-16	306	6970	\N
7696	SPECIFIC_DAY	0	8	2009-11-25	306	6970	\N
7697	SPECIFIC_DAY	0	8	2009-10-24	306	6970	\N
7698	SPECIFIC_DAY	0	8	2009-11-30	306	6970	\N
7699	SPECIFIC_DAY	0	8	2009-11-03	306	6970	\N
7700	SPECIFIC_DAY	0	8	2009-12-10	306	6970	\N
7701	SPECIFIC_DAY	0	8	2009-10-29	306	6970	\N
7702	SPECIFIC_DAY	0	8	2009-11-23	306	6970	\N
7703	SPECIFIC_DAY	0	8	2009-10-21	306	6970	\N
7704	SPECIFIC_DAY	0	8	2009-12-07	306	6970	\N
7705	SPECIFIC_DAY	0	8	2009-10-20	306	6970	\N
7706	SPECIFIC_DAY	0	8	2009-12-04	306	6970	\N
7707	SPECIFIC_DAY	0	8	2009-11-02	306	6970	\N
7708	SPECIFIC_DAY	0	8	2009-10-17	306	6970	\N
7709	SPECIFIC_DAY	0	8	2009-10-16	306	6970	\N
7710	SPECIFIC_DAY	0	8	2009-10-22	306	6970	\N
7711	SPECIFIC_DAY	0	4	2009-12-16	306	6970	\N
7712	SPECIFIC_DAY	0	8	2009-11-12	306	6970	\N
7713	SPECIFIC_DAY	0	8	2009-11-11	306	6970	\N
7714	SPECIFIC_DAY	0	8	2009-11-13	306	6970	\N
7715	SPECIFIC_DAY	0	8	2009-12-08	306	6970	\N
7716	SPECIFIC_DAY	0	8	2009-11-28	306	6970	\N
7717	SPECIFIC_DAY	0	8	2009-12-05	306	6970	\N
7718	SPECIFIC_DAY	0	8	2009-10-26	306	6970	\N
7719	SPECIFIC_DAY	0	8	2009-11-09	306	6970	\N
7720	SPECIFIC_DAY	0	8	2009-11-10	306	6970	\N
7721	GENERIC_DAY	0	0	2009-11-04	306	\N	1717
7722	GENERIC_DAY	0	0	2009-11-18	2121	\N	1717
7723	GENERIC_DAY	0	2	2009-10-25	304	\N	1717
7724	GENERIC_DAY	0	2	2009-11-15	2929	\N	1717
7725	GENERIC_DAY	0	0	2009-11-20	2121	\N	1717
7726	GENERIC_DAY	0	0	2009-12-16	304	\N	1717
7070	SPECIFIC_DAY	0	8	2010-05-01	306	6969	\N
7071	SPECIFIC_DAY	0	8	2010-06-07	306	6969	\N
7072	SPECIFIC_DAY	0	8	2010-01-29	306	6969	\N
7073	SPECIFIC_DAY	0	8	2010-06-08	306	6969	\N
7074	SPECIFIC_DAY	0	8	2010-05-19	306	6969	\N
7075	SPECIFIC_DAY	0	2	2010-06-21	306	6969	\N
7076	SPECIFIC_DAY	0	8	2010-02-04	306	6969	\N
7077	SPECIFIC_DAY	0	8	2010-04-11	306	6969	\N
7078	SPECIFIC_DAY	0	8	2010-04-08	306	6969	\N
7079	SPECIFIC_DAY	0	8	2010-03-16	306	6969	\N
7080	SPECIFIC_DAY	0	8	2010-06-14	306	6969	\N
7081	SPECIFIC_DAY	0	8	2010-02-19	306	6969	\N
7082	SPECIFIC_DAY	0	8	2010-02-09	306	6969	\N
7083	SPECIFIC_DAY	0	8	2010-04-07	306	6969	\N
7084	SPECIFIC_DAY	0	8	2010-04-19	306	6969	\N
7085	SPECIFIC_DAY	0	8	2010-05-09	306	6969	\N
7086	SPECIFIC_DAY	0	8	2010-05-10	306	6969	\N
7087	SPECIFIC_DAY	0	8	2010-02-20	306	6969	\N
7088	SPECIFIC_DAY	0	8	2010-05-22	306	6969	\N
7089	SPECIFIC_DAY	0	8	2010-04-21	306	6969	\N
7090	SPECIFIC_DAY	0	8	2010-06-17	306	6969	\N
7091	SPECIFIC_DAY	0	8	2010-03-10	306	6969	\N
7092	SPECIFIC_DAY	0	8	2010-05-07	306	6969	\N
7093	SPECIFIC_DAY	0	8	2010-02-28	306	6969	\N
7094	SPECIFIC_DAY	0	8	2010-02-05	306	6969	\N
7095	SPECIFIC_DAY	0	8	2010-02-11	306	6969	\N
7096	SPECIFIC_DAY	0	8	2010-04-04	306	6969	\N
7097	SPECIFIC_DAY	0	8	2010-03-06	306	6969	\N
7098	SPECIFIC_DAY	0	8	2010-01-27	306	6969	\N
7099	SPECIFIC_DAY	0	8	2010-04-22	306	6969	\N
7100	SPECIFIC_DAY	0	8	2010-05-04	306	6969	\N
7101	SPECIFIC_DAY	0	8	2010-02-02	306	6969	\N
7102	SPECIFIC_DAY	0	8	2010-03-23	306	6969	\N
7103	SPECIFIC_DAY	0	8	2010-05-17	306	6969	\N
7104	SPECIFIC_DAY	0	8	2010-04-24	306	6969	\N
7105	SPECIFIC_DAY	0	8	2010-03-02	306	6969	\N
7106	SPECIFIC_DAY	0	8	2010-03-17	306	6969	\N
7107	SPECIFIC_DAY	0	8	2010-05-24	306	6969	\N
7108	SPECIFIC_DAY	0	8	2010-02-27	306	6969	\N
7109	SPECIFIC_DAY	0	8	2010-06-05	306	6969	\N
7110	SPECIFIC_DAY	0	8	2010-02-17	306	6969	\N
7111	SPECIFIC_DAY	0	8	2010-05-20	306	6969	\N
7112	SPECIFIC_DAY	0	8	2010-04-13	306	6969	\N
7113	SPECIFIC_DAY	0	8	2010-04-18	306	6969	\N
7114	SPECIFIC_DAY	0	8	2010-06-01	306	6969	\N
7115	SPECIFIC_DAY	0	8	2010-05-23	306	6969	\N
7116	SPECIFIC_DAY	0	8	2010-04-01	306	6969	\N
7117	SPECIFIC_DAY	0	8	2010-04-27	306	6969	\N
7118	SPECIFIC_DAY	0	8	2010-04-30	306	6969	\N
7119	SPECIFIC_DAY	0	8	2010-03-27	306	6969	\N
7120	SPECIFIC_DAY	0	8	2010-02-13	306	6969	\N
7121	SPECIFIC_DAY	0	8	2010-05-08	306	6969	\N
7122	SPECIFIC_DAY	0	8	2010-04-17	306	6969	\N
7123	SPECIFIC_DAY	0	8	2010-05-14	306	6969	\N
7124	SPECIFIC_DAY	0	8	2010-04-16	306	6969	\N
7125	SPECIFIC_DAY	0	8	2010-04-26	306	6969	\N
7126	SPECIFIC_DAY	0	8	2010-05-18	306	6969	\N
7127	SPECIFIC_DAY	0	8	2010-06-09	306	6969	\N
7128	SPECIFIC_DAY	0	8	2010-02-12	306	6969	\N
7129	SPECIFIC_DAY	0	8	2010-02-14	306	6969	\N
7130	SPECIFIC_DAY	0	8	2010-03-18	306	6969	\N
7131	SPECIFIC_DAY	0	8	2010-03-03	306	6969	\N
7132	SPECIFIC_DAY	0	8	2010-04-29	306	6969	\N
7133	SPECIFIC_DAY	0	8	2010-06-13	306	6969	\N
7134	SPECIFIC_DAY	0	8	2010-02-10	306	6969	\N
7135	SPECIFIC_DAY	0	8	2010-02-23	306	6969	\N
7136	SPECIFIC_DAY	0	8	2010-04-06	306	6969	\N
7137	SPECIFIC_DAY	0	8	2010-03-04	306	6969	\N
7138	SPECIFIC_DAY	0	8	2010-06-19	306	6969	\N
7139	SPECIFIC_DAY	0	8	2010-02-25	306	6969	\N
7140	SPECIFIC_DAY	0	8	2010-03-30	306	6969	\N
7141	SPECIFIC_DAY	0	8	2010-05-13	306	6969	\N
7142	SPECIFIC_DAY	0	8	2010-03-22	306	6969	\N
7143	SPECIFIC_DAY	0	8	2010-03-28	306	6969	\N
7144	SPECIFIC_DAY	0	8	2010-04-05	306	6969	\N
7145	SPECIFIC_DAY	0	8	2010-03-19	306	6969	\N
7146	SPECIFIC_DAY	0	8	2010-03-24	306	6969	\N
7147	SPECIFIC_DAY	0	8	2010-02-06	306	6969	\N
7148	SPECIFIC_DAY	0	8	2010-02-01	306	6969	\N
7149	SPECIFIC_DAY	0	8	2010-04-14	306	6969	\N
7150	SPECIFIC_DAY	0	8	2010-05-29	306	6969	\N
7151	SPECIFIC_DAY	0	8	2010-05-25	306	6969	\N
7152	SPECIFIC_DAY	0	8	2010-02-18	306	6969	\N
7153	SPECIFIC_DAY	0	8	2010-04-02	306	6969	\N
7154	SPECIFIC_DAY	0	8	2010-05-06	306	6969	\N
7155	SPECIFIC_DAY	0	8	2010-03-12	306	6969	\N
7156	SPECIFIC_DAY	0	8	2010-05-12	306	6969	\N
7157	SPECIFIC_DAY	0	8	2010-04-25	306	6969	\N
7158	SPECIFIC_DAY	0	8	2010-05-21	306	6969	\N
7159	SPECIFIC_DAY	0	8	2010-04-09	306	6969	\N
7160	SPECIFIC_DAY	0	8	2010-04-10	306	6969	\N
7161	SPECIFIC_DAY	0	8	2010-06-15	306	6969	\N
7162	SPECIFIC_DAY	0	8	2010-06-12	306	6969	\N
7163	SPECIFIC_DAY	0	8	2010-05-11	306	6969	\N
7164	SPECIFIC_DAY	0	8	2010-03-21	306	6969	\N
7165	SPECIFIC_DAY	0	8	2010-06-18	306	6969	\N
7166	SPECIFIC_DAY	0	8	2010-05-03	306	6969	\N
7167	SPECIFIC_DAY	0	8	2010-03-11	306	6969	\N
7168	SPECIFIC_DAY	0	8	2010-04-23	306	6969	\N
7169	SPECIFIC_DAY	0	8	2010-06-11	306	6969	\N
7170	SPECIFIC_DAY	0	8	2010-02-21	306	6969	\N
7171	SPECIFIC_DAY	0	8	2010-02-07	306	6969	\N
7172	SPECIFIC_DAY	0	8	2010-03-31	306	6969	\N
7173	SPECIFIC_DAY	0	8	2010-03-29	306	6969	\N
7174	SPECIFIC_DAY	0	8	2010-02-22	306	6969	\N
7175	SPECIFIC_DAY	0	8	2010-01-26	306	6969	\N
7176	SPECIFIC_DAY	0	8	2010-05-16	306	6969	\N
7177	SPECIFIC_DAY	0	8	2010-03-05	306	6969	\N
7178	SPECIFIC_DAY	0	8	2010-04-03	306	6969	\N
7179	SPECIFIC_DAY	0	8	2010-03-13	306	6969	\N
7180	SPECIFIC_DAY	0	8	2010-02-08	306	6969	\N
7181	SPECIFIC_DAY	0	8	2010-03-20	306	6969	\N
7182	SPECIFIC_DAY	0	8	2010-02-03	306	6969	\N
7183	SPECIFIC_DAY	0	8	2010-05-05	306	6969	\N
7184	SPECIFIC_DAY	0	8	2010-03-08	306	6969	\N
7185	SPECIFIC_DAY	0	8	2010-06-03	306	6969	\N
7186	SPECIFIC_DAY	0	8	2010-06-06	306	6969	\N
7187	SPECIFIC_DAY	0	8	2010-05-31	306	6969	\N
7188	SPECIFIC_DAY	0	8	2010-03-07	306	6969	\N
7189	SPECIFIC_DAY	0	8	2010-04-20	306	6969	\N
7190	SPECIFIC_DAY	0	8	2010-06-16	306	6969	\N
7191	SPECIFIC_DAY	0	8	2010-02-26	306	6969	\N
7192	SPECIFIC_DAY	0	8	2010-03-25	306	6969	\N
7193	SPECIFIC_DAY	0	4	2010-06-20	306	6969	\N
7194	SPECIFIC_DAY	0	8	2010-03-09	306	6969	\N
7195	SPECIFIC_DAY	0	8	2010-01-31	306	6969	\N
7196	SPECIFIC_DAY	0	8	2010-06-04	306	6969	\N
7197	SPECIFIC_DAY	0	8	2010-05-30	306	6969	\N
7198	SPECIFIC_DAY	0	8	2010-03-15	306	6969	\N
7199	SPECIFIC_DAY	0	8	2010-02-24	306	6969	\N
7200	SPECIFIC_DAY	0	8	2010-06-02	306	6969	\N
7201	SPECIFIC_DAY	0	8	2010-02-16	306	6969	\N
7202	SPECIFIC_DAY	0	8	2010-05-27	306	6969	\N
7203	SPECIFIC_DAY	0	8	2010-05-02	306	6969	\N
7204	SPECIFIC_DAY	0	8	2010-05-26	306	6969	\N
7205	SPECIFIC_DAY	0	8	2010-06-10	306	6969	\N
7206	SPECIFIC_DAY	0	8	2010-03-14	306	6969	\N
7207	SPECIFIC_DAY	0	8	2010-04-12	306	6969	\N
7208	SPECIFIC_DAY	0	8	2010-02-15	306	6969	\N
7209	SPECIFIC_DAY	0	8	2010-01-30	306	6969	\N
7210	SPECIFIC_DAY	0	8	2010-03-01	306	6969	\N
7211	SPECIFIC_DAY	0	8	2010-05-15	306	6969	\N
7212	SPECIFIC_DAY	0	8	2010-04-28	306	6969	\N
7213	SPECIFIC_DAY	0	8	2010-03-26	306	6969	\N
7214	SPECIFIC_DAY	0	8	2010-04-15	306	6969	\N
7215	SPECIFIC_DAY	0	8	2010-01-28	306	6969	\N
7216	SPECIFIC_DAY	0	8	2010-05-28	306	6969	\N
7217	SPECIFIC_DAY	0	8	2010-06-11	2929	3737	\N
7218	SPECIFIC_DAY	0	8	2010-02-01	2929	3737	\N
7219	SPECIFIC_DAY	0	8	2010-06-18	2929	3737	\N
7220	SPECIFIC_DAY	0	0	2010-06-20	2929	3737	\N
7221	SPECIFIC_DAY	0	8	2010-04-16	2929	3737	\N
7222	SPECIFIC_DAY	0	0	2010-02-20	2929	3737	\N
7223	SPECIFIC_DAY	0	0	2010-03-21	2929	3737	\N
7224	SPECIFIC_DAY	0	8	2010-06-15	2929	3737	\N
7225	SPECIFIC_DAY	0	8	2010-02-05	2929	3737	\N
7226	SPECIFIC_DAY	0	8	2010-05-18	2929	3737	\N
7227	SPECIFIC_DAY	0	8	2010-02-19	2929	3737	\N
7228	SPECIFIC_DAY	0	0	2010-02-06	2929	3737	\N
7229	SPECIFIC_DAY	0	0	2010-01-30	2929	3737	\N
7230	SPECIFIC_DAY	0	8	2010-03-30	2929	3737	\N
7231	SPECIFIC_DAY	0	8	2010-04-29	2929	3737	\N
7232	SPECIFIC_DAY	0	0	2010-05-22	2929	3737	\N
7233	SPECIFIC_DAY	0	8	2010-02-16	2929	3737	\N
7234	SPECIFIC_DAY	0	0	2010-06-05	2929	3737	\N
7235	SPECIFIC_DAY	0	0	2010-03-13	2929	3737	\N
7236	SPECIFIC_DAY	0	8	2010-05-17	2929	3737	\N
7237	SPECIFIC_DAY	0	8	2010-04-19	2929	3737	\N
7238	SPECIFIC_DAY	0	8	2010-05-12	2929	3737	\N
7239	SPECIFIC_DAY	0	8	2010-05-07	2929	3737	\N
7240	SPECIFIC_DAY	0	8	2010-03-17	2929	3737	\N
7241	SPECIFIC_DAY	0	8	2010-06-09	2929	3737	\N
7242	SPECIFIC_DAY	0	0	2010-02-14	2929	3737	\N
7243	SPECIFIC_DAY	0	8	2010-04-01	2929	3737	\N
7244	SPECIFIC_DAY	0	8	2010-02-24	2929	3737	\N
7245	SPECIFIC_DAY	0	8	2010-04-21	2929	3737	\N
7246	SPECIFIC_DAY	0	8	2010-05-05	2929	3737	\N
7247	SPECIFIC_DAY	0	8	2010-06-01	2929	3737	\N
7248	SPECIFIC_DAY	0	8	2010-04-27	2929	3737	\N
7249	SPECIFIC_DAY	0	8	2010-05-11	2929	3737	\N
7250	SPECIFIC_DAY	0	8	2010-06-08	2929	3737	\N
7251	SPECIFIC_DAY	0	0	2010-03-06	2929	3737	\N
7252	SPECIFIC_DAY	0	8	2010-03-26	2929	3737	\N
7253	SPECIFIC_DAY	0	8	2010-04-30	2929	3737	\N
7254	SPECIFIC_DAY	0	8	2010-03-04	2929	3737	\N
7255	SPECIFIC_DAY	0	8	2010-05-31	2929	3737	\N
7256	SPECIFIC_DAY	0	0	2010-04-18	2929	3737	\N
7257	SPECIFIC_DAY	0	8	2010-03-10	2929	3737	\N
7258	SPECIFIC_DAY	0	0	2010-05-02	2929	3737	\N
7259	SPECIFIC_DAY	0	8	2010-02-11	2929	3737	\N
7260	SPECIFIC_DAY	0	8	2010-05-14	2929	3737	\N
7261	SPECIFIC_DAY	0	8	2010-05-04	2929	3737	\N
7262	SPECIFIC_DAY	0	0	2010-05-16	2929	3737	\N
7263	SPECIFIC_DAY	0	8	2010-04-05	2929	3737	\N
7264	SPECIFIC_DAY	0	8	2010-03-02	2929	3737	\N
7265	SPECIFIC_DAY	0	8	2010-02-18	2929	3737	\N
7266	SPECIFIC_DAY	0	8	2010-03-31	2929	3737	\N
7267	SPECIFIC_DAY	0	8	2010-04-09	2929	3737	\N
7268	SPECIFIC_DAY	0	8	2010-03-01	2929	3737	\N
7269	SPECIFIC_DAY	0	8	2010-04-20	2929	3737	\N
7270	SPECIFIC_DAY	0	8	2010-03-23	2929	3737	\N
7271	SPECIFIC_DAY	0	8	2010-03-18	2929	3737	\N
7272	SPECIFIC_DAY	0	8	2010-04-12	2929	3737	\N
7273	SPECIFIC_DAY	0	8	2010-02-22	2929	3737	\N
7274	SPECIFIC_DAY	0	8	2010-03-25	2929	3737	\N
7275	SPECIFIC_DAY	0	8	2010-03-03	2929	3737	\N
7276	SPECIFIC_DAY	0	0	2010-02-07	2929	3737	\N
7277	SPECIFIC_DAY	0	8	2010-03-08	2929	3737	\N
7278	SPECIFIC_DAY	0	8	2010-05-28	2929	3737	\N
7279	SPECIFIC_DAY	0	8	2010-04-22	2929	3737	\N
7280	SPECIFIC_DAY	0	8	2010-06-14	2929	3737	\N
7281	SPECIFIC_DAY	0	0	2010-03-28	2929	3737	\N
7282	SPECIFIC_DAY	0	8	2010-05-24	2929	3737	\N
7283	SPECIFIC_DAY	0	2	2010-06-21	2929	3737	\N
7727	GENERIC_DAY	0	0	2009-10-15	306	\N	1717
7728	GENERIC_DAY	0	2	2009-11-22	2929	\N	1717
7729	GENERIC_DAY	0	2	2009-11-29	306	\N	1717
7730	GENERIC_DAY	0	0	2009-10-29	306	\N	1717
7731	GENERIC_DAY	0	2	2009-12-12	2121	\N	1717
7732	GENERIC_DAY	0	0	2009-12-01	304	\N	1717
7733	GENERIC_DAY	0	0	2009-11-26	2121	\N	1717
7734	GENERIC_DAY	0	0	2009-12-11	2121	\N	1717
7735	GENERIC_DAY	0	2	2009-11-21	2929	\N	1717
7736	GENERIC_DAY	0	0	2009-11-23	304	\N	1717
7737	GENERIC_DAY	0	0	2009-12-08	304	\N	1717
7738	GENERIC_DAY	0	2	2009-10-24	304	\N	1717
7284	SPECIFIC_DAY	0	0	2010-05-23	2929	3737	\N
7285	SPECIFIC_DAY	0	8	2010-06-04	2929	3737	\N
7286	SPECIFIC_DAY	0	8	2010-02-17	2929	3737	\N
7287	SPECIFIC_DAY	0	8	2010-04-28	2929	3737	\N
7288	SPECIFIC_DAY	0	8	2010-05-21	2929	3737	\N
7289	SPECIFIC_DAY	0	8	2010-03-19	2929	3737	\N
7290	SPECIFIC_DAY	0	8	2010-04-14	2929	3737	\N
7291	SPECIFIC_DAY	0	8	2010-04-07	2929	3737	\N
7292	SPECIFIC_DAY	0	0	2010-06-19	2929	3737	\N
7293	SPECIFIC_DAY	0	0	2010-06-12	2929	3737	\N
7294	SPECIFIC_DAY	0	8	2010-04-02	2929	3737	\N
7295	SPECIFIC_DAY	0	0	2010-05-30	2929	3737	\N
7296	SPECIFIC_DAY	0	8	2010-03-11	2929	3737	\N
7297	SPECIFIC_DAY	0	8	2010-06-16	2929	3737	\N
7298	SPECIFIC_DAY	0	8	2010-03-16	2929	3737	\N
7299	SPECIFIC_DAY	0	0	2010-04-24	2929	3737	\N
7300	SPECIFIC_DAY	0	8	2010-05-26	2929	3737	\N
7301	SPECIFIC_DAY	0	8	2010-02-23	2929	3737	\N
7302	SPECIFIC_DAY	0	0	2010-05-08	2929	3737	\N
7303	SPECIFIC_DAY	0	8	2010-02-12	2929	3737	\N
7304	SPECIFIC_DAY	0	0	2010-02-21	2929	3737	\N
7305	SPECIFIC_DAY	0	8	2010-05-06	2929	3737	\N
7306	SPECIFIC_DAY	0	0	2010-05-29	2929	3737	\N
7307	SPECIFIC_DAY	0	8	2010-02-15	2929	3737	\N
7308	SPECIFIC_DAY	0	0	2010-05-15	2929	3737	\N
7309	SPECIFIC_DAY	0	0	2010-04-11	2929	3737	\N
7310	SPECIFIC_DAY	0	8	2010-04-26	2929	3737	\N
7311	SPECIFIC_DAY	0	0	2010-04-10	2929	3737	\N
7312	SPECIFIC_DAY	0	8	2010-03-12	2929	3737	\N
7313	SPECIFIC_DAY	0	8	2010-02-04	2929	3737	\N
7314	SPECIFIC_DAY	0	0	2010-04-03	2929	3737	\N
7315	SPECIFIC_DAY	0	0	2010-04-17	2929	3737	\N
7316	SPECIFIC_DAY	0	0	2010-04-04	2929	3737	\N
7317	SPECIFIC_DAY	0	0	2010-03-20	2929	3737	\N
7318	SPECIFIC_DAY	0	8	2010-02-08	2929	3737	\N
7319	SPECIFIC_DAY	0	8	2010-03-24	2929	3737	\N
7320	SPECIFIC_DAY	0	8	2010-02-02	2929	3737	\N
7321	SPECIFIC_DAY	0	8	2010-04-08	2929	3737	\N
7322	SPECIFIC_DAY	0	8	2010-03-22	2929	3737	\N
7323	SPECIFIC_DAY	0	8	2010-02-03	2929	3737	\N
7324	SPECIFIC_DAY	0	0	2010-03-14	2929	3737	\N
7325	SPECIFIC_DAY	0	8	2010-03-29	2929	3737	\N
7326	SPECIFIC_DAY	0	8	2010-03-15	2929	3737	\N
7327	SPECIFIC_DAY	0	8	2010-04-23	2929	3737	\N
7328	SPECIFIC_DAY	0	0	2010-01-31	2929	3737	\N
7329	SPECIFIC_DAY	0	8	2010-05-10	2929	3737	\N
7330	SPECIFIC_DAY	0	0	2010-03-07	2929	3737	\N
7331	SPECIFIC_DAY	0	8	2010-05-20	2929	3737	\N
7332	SPECIFIC_DAY	0	8	2010-01-27	2929	3737	\N
7333	SPECIFIC_DAY	0	8	2010-05-27	2929	3737	\N
7334	SPECIFIC_DAY	0	0	2010-04-25	2929	3737	\N
7335	SPECIFIC_DAY	0	8	2010-06-07	2929	3737	\N
7336	SPECIFIC_DAY	0	8	2010-05-19	2929	3737	\N
7337	SPECIFIC_DAY	0	8	2010-02-26	2929	3737	\N
7338	SPECIFIC_DAY	0	8	2010-01-28	2929	3737	\N
7339	SPECIFIC_DAY	0	8	2010-04-06	2929	3737	\N
7340	SPECIFIC_DAY	0	0	2010-06-13	2929	3737	\N
7341	SPECIFIC_DAY	0	8	2010-05-13	2929	3737	\N
7342	SPECIFIC_DAY	0	8	2010-02-09	2929	3737	\N
7343	SPECIFIC_DAY	0	0	2010-02-13	2929	3737	\N
7344	SPECIFIC_DAY	0	8	2010-03-09	2929	3737	\N
7345	SPECIFIC_DAY	0	8	2010-01-26	2929	3737	\N
7346	SPECIFIC_DAY	0	0	2010-02-27	2929	3737	\N
7347	SPECIFIC_DAY	0	8	2010-03-05	2929	3737	\N
7348	SPECIFIC_DAY	0	8	2010-01-29	2929	3737	\N
7349	SPECIFIC_DAY	0	8	2010-06-03	2929	3737	\N
7350	SPECIFIC_DAY	0	8	2010-02-25	2929	3737	\N
7351	SPECIFIC_DAY	0	8	2010-06-17	2929	3737	\N
7352	SPECIFIC_DAY	0	0	2010-05-01	2929	3737	\N
7353	SPECIFIC_DAY	0	8	2010-04-15	2929	3737	\N
7354	SPECIFIC_DAY	0	0	2010-03-27	2929	3737	\N
7355	SPECIFIC_DAY	0	0	2010-05-09	2929	3737	\N
7356	SPECIFIC_DAY	0	8	2010-05-25	2929	3737	\N
7739	GENERIC_DAY	0	0	2009-10-30	306	\N	1717
7740	GENERIC_DAY	0	0	2009-12-01	306	\N	1717
7741	GENERIC_DAY	0	2	2009-10-31	304	\N	1717
7742	GENERIC_DAY	0	0	2009-11-17	2121	\N	1717
7743	GENERIC_DAY	0	8	2009-11-13	2929	\N	1717
7744	GENERIC_DAY	0	0	2009-11-26	306	\N	1717
7745	GENERIC_DAY	0	0	2009-10-20	2121	\N	1717
7746	GENERIC_DAY	0	8	2009-12-04	2929	\N	1717
7747	GENERIC_DAY	0	0	2009-10-23	304	\N	1717
7748	GENERIC_DAY	0	2	2009-10-24	306	\N	1717
7749	GENERIC_DAY	0	0	2009-12-02	2121	\N	1717
7750	GENERIC_DAY	0	0	2009-11-26	304	\N	1717
7751	GENERIC_DAY	0	8	2009-11-11	2929	\N	1717
7752	GENERIC_DAY	0	8	2009-12-09	2929	\N	1717
7753	GENERIC_DAY	0	0	2009-12-14	304	\N	1717
7754	GENERIC_DAY	0	0	2009-12-15	304	\N	1717
7755	GENERIC_DAY	0	2	2009-11-22	306	\N	1717
7756	GENERIC_DAY	0	0	2009-11-16	2121	\N	1717
7757	GENERIC_DAY	0	0	2009-10-28	306	\N	1717
7758	GENERIC_DAY	0	0	2009-11-09	306	\N	1717
7759	GENERIC_DAY	0	0	2009-12-02	306	\N	1717
7760	GENERIC_DAY	0	0	2009-11-27	2121	\N	1717
7761	GENERIC_DAY	0	0	2009-10-16	304	\N	1717
7762	GENERIC_DAY	0	2	2009-11-28	306	\N	1717
7763	GENERIC_DAY	0	0	2009-12-09	2121	\N	1717
7764	GENERIC_DAY	0	0	2009-11-09	304	\N	1717
7765	GENERIC_DAY	0	2	2009-11-15	304	\N	1717
7766	GENERIC_DAY	0	2	2009-10-18	2929	\N	1717
7767	GENERIC_DAY	0	0	2009-11-24	2121	\N	1717
7768	GENERIC_DAY	0	0	2009-11-04	2121	\N	1717
7769	GENERIC_DAY	0	8	2009-11-04	2929	\N	1717
7770	GENERIC_DAY	0	2	2009-11-22	2121	\N	1717
7771	GENERIC_DAY	0	2	2009-11-29	2929	\N	1717
7772	GENERIC_DAY	0	0	2009-11-10	304	\N	1717
7773	GENERIC_DAY	0	0	2009-11-16	306	\N	1717
7774	GENERIC_DAY	0	2	2009-10-17	2929	\N	1717
7775	GENERIC_DAY	0	0	2009-11-30	2121	\N	1717
7776	GENERIC_DAY	0	2	2009-12-12	304	\N	1717
7777	GENERIC_DAY	0	0	2009-12-08	2121	\N	1717
7778	GENERIC_DAY	0	2	2009-10-17	2121	\N	1717
7779	GENERIC_DAY	0	0	2009-10-26	306	\N	1717
7780	GENERIC_DAY	0	2	2009-12-13	304	\N	1717
7781	GENERIC_DAY	0	2	2009-12-06	306	\N	1717
7782	GENERIC_DAY	0	0	2009-11-13	304	\N	1717
7783	GENERIC_DAY	0	0	2009-12-09	304	\N	1717
7784	GENERIC_DAY	0	0	2009-10-20	304	\N	1717
7785	GENERIC_DAY	0	2	2009-12-05	304	\N	1717
7786	GENERIC_DAY	0	2	2009-10-31	306	\N	1717
7787	GENERIC_DAY	0	8	2009-11-23	2929	\N	1717
7788	GENERIC_DAY	0	0	2009-11-05	2121	\N	1717
7789	GENERIC_DAY	0	2	2009-10-18	306	\N	1717
7790	GENERIC_DAY	0	8	2009-10-27	2929	\N	1717
7791	GENERIC_DAY	0	0	2009-11-30	306	\N	1717
7792	GENERIC_DAY	0	2	2009-12-06	2121	\N	1717
7793	GENERIC_DAY	0	0	2009-10-19	2121	\N	1717
7794	GENERIC_DAY	0	2	2009-11-15	306	\N	1717
7795	GENERIC_DAY	0	0	2009-10-28	304	\N	1717
7796	GENERIC_DAY	0	0	2009-12-07	304	\N	1717
7797	GENERIC_DAY	0	0	2009-11-02	306	\N	1717
7798	GENERIC_DAY	0	0	2009-10-23	2121	\N	1717
7799	GENERIC_DAY	0	2	2009-11-07	2121	\N	1717
7800	GENERIC_DAY	0	2	2009-11-21	306	\N	1717
7801	GENERIC_DAY	0	0	2009-11-25	304	\N	1717
7802	GENERIC_DAY	0	0	2009-12-16	2121	\N	1717
7803	GENERIC_DAY	0	0	2009-11-12	304	\N	1717
7804	GENERIC_DAY	0	0	2009-11-11	2121	\N	1717
7805	GENERIC_DAY	0	0	2009-11-19	306	\N	1717
7806	GENERIC_DAY	0	8	2009-10-15	2929	\N	1717
7807	GENERIC_DAY	0	0	2009-10-27	304	\N	1717
7808	GENERIC_DAY	0	2	2009-10-25	306	\N	1717
7809	GENERIC_DAY	0	0	2009-11-30	304	\N	1717
7810	GENERIC_DAY	0	0	2009-10-16	2121	\N	1717
7811	GENERIC_DAY	0	8	2009-10-22	2929	\N	1717
7812	GENERIC_DAY	0	0	2009-12-04	306	\N	1717
7813	GENERIC_DAY	0	8	2009-10-21	2929	\N	1717
7814	GENERIC_DAY	0	2	2009-10-25	2929	\N	1717
7815	GENERIC_DAY	0	0	2009-11-03	306	\N	1717
7816	GENERIC_DAY	0	0	2009-11-09	2121	\N	1717
7817	GENERIC_DAY	0	0	2009-11-27	304	\N	1717
7818	GENERIC_DAY	0	2	2009-10-17	306	\N	1717
7819	GENERIC_DAY	0	2	2009-12-06	2929	\N	1717
7820	GENERIC_DAY	0	8	2009-11-05	2929	\N	1717
7821	GENERIC_DAY	0	0	2009-12-07	2121	\N	1717
7822	GENERIC_DAY	0	0	2009-11-18	304	\N	1717
7823	GENERIC_DAY	0	2	2009-11-29	2121	\N	1717
7824	GENERIC_DAY	0	0	2009-11-06	304	\N	1717
7825	GENERIC_DAY	0	2	2009-11-01	306	\N	1717
7826	GENERIC_DAY	0	0	2009-11-17	306	\N	1717
7827	GENERIC_DAY	0	8	2009-12-02	2929	\N	1717
7828	GENERIC_DAY	0	0	2009-11-04	304	\N	1717
7829	GENERIC_DAY	0	0	2009-10-26	304	\N	1717
7830	GENERIC_DAY	0	0	2009-10-27	306	\N	1717
7831	GENERIC_DAY	0	0	2009-11-05	304	\N	1717
7832	GENERIC_DAY	0	0	2009-11-20	306	\N	1717
7833	GENERIC_DAY	0	0	2009-11-10	306	\N	1717
7834	GENERIC_DAY	0	0	2009-12-16	306	\N	1717
7835	GENERIC_DAY	0	0	2009-12-11	306	\N	1717
7836	GENERIC_DAY	0	2	2009-11-07	306	\N	1717
7837	GENERIC_DAY	0	0	2009-11-10	2121	\N	1717
7838	GENERIC_DAY	0	2	2009-11-01	304	\N	1717
7839	GENERIC_DAY	0	8	2009-11-18	2929	\N	1717
7840	GENERIC_DAY	0	2	2009-10-31	2121	\N	1717
7841	GENERIC_DAY	0	0	2009-12-10	2121	\N	1717
7842	GENERIC_DAY	0	0	2009-10-19	306	\N	1717
7843	GENERIC_DAY	0	8	2009-10-16	2929	\N	1717
7844	GENERIC_DAY	0	8	2009-11-06	2929	\N	1717
7845	GENERIC_DAY	0	0	2009-11-12	306	\N	1717
7846	GENERIC_DAY	0	0	2009-12-10	306	\N	1717
7847	GENERIC_DAY	0	8	2009-12-10	2929	\N	1717
7848	GENERIC_DAY	0	0	2009-12-11	304	\N	1717
7849	GENERIC_DAY	0	8	2009-12-01	2929	\N	1717
7850	GENERIC_DAY	0	0	2009-10-30	304	\N	1717
7851	GENERIC_DAY	0	8	2009-10-20	2929	\N	1717
7852	GENERIC_DAY	0	8	2009-11-02	2929	\N	1717
7853	GENERIC_DAY	0	0	2009-10-16	306	\N	1717
7854	GENERIC_DAY	0	2	2009-11-08	2929	\N	1717
7855	GENERIC_DAY	0	2	2009-11-28	2121	\N	1717
7856	GENERIC_DAY	0	8	2009-12-07	2929	\N	1717
7857	GENERIC_DAY	0	0	2009-12-07	306	\N	1717
7858	GENERIC_DAY	0	8	2009-10-26	2929	\N	1717
7859	GENERIC_DAY	0	8	2009-11-24	2929	\N	1717
7860	GENERIC_DAY	0	0	2009-11-11	304	\N	1717
7861	GENERIC_DAY	0	8	2009-11-25	2929	\N	1717
7862	GENERIC_DAY	0	2	2009-12-12	306	\N	1717
7863	GENERIC_DAY	0	0	2009-12-04	2121	\N	1717
7864	GENERIC_DAY	0	2	2009-11-15	2121	\N	1717
7865	GENERIC_DAY	0	2	2009-11-07	304	\N	1717
7866	GENERIC_DAY	0	0	2009-11-25	306	\N	1717
7867	GENERIC_DAY	0	0	2009-10-22	306	\N	1717
7868	GENERIC_DAY	0	2	2009-11-14	304	\N	1717
7869	GENERIC_DAY	0	0	2009-10-29	304	\N	1717
7870	GENERIC_DAY	0	2	2009-11-28	2929	\N	1717
7871	GENERIC_DAY	0	8	2009-11-20	2929	\N	1717
7872	GENERIC_DAY	0	0	2009-10-21	306	\N	1717
7873	GENERIC_DAY	0	2	2009-11-22	304	\N	1717
7874	GENERIC_DAY	0	0	2009-12-01	2121	\N	1717
7875	GENERIC_DAY	0	2	2009-11-01	2929	\N	1717
7876	GENERIC_DAY	0	4	2009-12-16	2929	\N	1717
7877	GENERIC_DAY	0	2	2009-10-24	2121	\N	1717
7878	GENERIC_DAY	0	2	2009-11-14	2121	\N	1717
7879	GENERIC_DAY	0	2	2009-11-28	304	\N	1717
7880	GENERIC_DAY	0	0	2009-11-03	2121	\N	1717
7881	GENERIC_DAY	0	0	2009-12-14	2121	\N	1717
7882	GENERIC_DAY	0	0	2009-12-04	304	\N	1717
7883	GENERIC_DAY	0	0	2009-11-23	306	\N	1717
7884	GENERIC_DAY	0	0	2009-11-17	304	\N	1717
7885	GENERIC_DAY	0	0	2009-11-19	304	\N	1717
7886	GENERIC_DAY	0	2	2009-11-21	2121	\N	1717
7887	GENERIC_DAY	0	0	2009-10-19	304	\N	1717
7888	GENERIC_DAY	0	8	2009-10-29	2929	\N	1717
7889	GENERIC_DAY	0	0	2009-10-21	304	\N	1717
7890	GENERIC_DAY	0	0	2009-12-03	304	\N	1717
7891	GENERIC_DAY	0	2	2009-11-08	304	\N	1717
7892	GENERIC_DAY	0	8	2009-10-28	2929	\N	1717
7893	GENERIC_DAY	0	2	2009-11-07	2929	\N	1717
7894	GENERIC_DAY	0	8	2009-11-26	2929	\N	1717
7895	GENERIC_DAY	0	0	2009-12-03	2121	\N	1717
7896	GENERIC_DAY	0	2	2009-10-18	304	\N	1717
7897	GENERIC_DAY	0	2	2009-12-05	2929	\N	1717
7898	GENERIC_DAY	0	0	2009-10-23	306	\N	1717
7899	GENERIC_DAY	0	0	2009-12-10	304	\N	1717
7900	GENERIC_DAY	0	0	2009-11-23	2121	\N	1717
7901	GENERIC_DAY	0	2	2009-11-29	304	\N	1717
7902	GENERIC_DAY	0	8	2009-11-19	2929	\N	1717
7903	GENERIC_DAY	0	0	2009-11-13	2121	\N	1717
7904	GENERIC_DAY	0	0	2009-10-29	2121	\N	1717
7905	GENERIC_DAY	0	8	2009-11-16	2929	\N	1717
7906	GENERIC_DAY	0	0	2009-12-03	306	\N	1717
7907	GENERIC_DAY	0	0	2009-10-28	2121	\N	1717
7908	GENERIC_DAY	0	0	2009-10-30	2121	\N	1717
7909	GENERIC_DAY	0	0	2009-11-05	306	\N	1717
7910	GENERIC_DAY	0	0	2009-12-02	304	\N	1717
7911	GENERIC_DAY	0	8	2009-11-12	2929	\N	1717
7912	GENERIC_DAY	0	8	2009-11-10	2929	\N	1717
7913	GENERIC_DAY	0	8	2009-11-27	2929	\N	1717
7914	GENERIC_DAY	0	0	2009-10-26	2121	\N	1717
7915	GENERIC_DAY	0	0	2009-10-15	304	\N	1717
7916	GENERIC_DAY	0	2	2009-10-18	2121	\N	1717
7917	GENERIC_DAY	0	2	2009-12-06	304	\N	1717
7918	GENERIC_DAY	0	0	2009-11-11	306	\N	1717
7919	GENERIC_DAY	0	8	2009-10-30	2929	\N	1717
7920	GENERIC_DAY	0	0	2009-11-13	306	\N	1717
7921	GENERIC_DAY	0	0	2009-11-18	306	\N	1717
7922	GENERIC_DAY	0	0	2009-12-14	306	\N	1717
7923	GENERIC_DAY	0	2	2009-10-17	304	\N	1717
7924	GENERIC_DAY	0	0	2009-10-27	2121	\N	1717
7925	GENERIC_DAY	0	0	2009-11-02	2121	\N	1717
7926	GENERIC_DAY	0	2	2009-12-05	2121	\N	1717
7927	GENERIC_DAY	0	8	2009-12-08	2929	\N	1717
7928	GENERIC_DAY	0	0	2009-12-15	306	\N	1717
7929	GENERIC_DAY	0	0	2009-12-15	2121	\N	1717
7930	GENERIC_DAY	0	0	2009-11-19	2121	\N	1717
7931	GENERIC_DAY	0	2	2009-10-25	2121	\N	1717
7932	GENERIC_DAY	0	0	2009-11-02	304	\N	1717
7933	GENERIC_DAY	0	0	2009-11-20	304	\N	1717
7934	GENERIC_DAY	0	0	2009-12-08	306	\N	1717
7935	GENERIC_DAY	0	2	2009-10-31	2929	\N	1717
7936	GENERIC_DAY	0	0	2009-10-21	2121	\N	1717
7937	GENERIC_DAY	0	8	2009-10-19	2929	\N	1717
7938	GENERIC_DAY	0	0	2009-11-16	304	\N	1717
7939	GENERIC_DAY	0	0	2009-11-27	306	\N	1717
7940	GENERIC_DAY	0	2	2009-11-08	2121	\N	1717
7941	GENERIC_DAY	0	2	2009-12-12	2929	\N	1717
7942	GENERIC_DAY	0	2	2009-12-05	306	\N	1717
7943	GENERIC_DAY	0	0	2009-11-24	304	\N	1717
7944	GENERIC_DAY	0	2	2009-11-08	306	\N	1717
7945	GENERIC_DAY	0	2	2009-11-01	2121	\N	1717
7946	GENERIC_DAY	0	8	2009-11-17	2929	\N	1717
7947	GENERIC_DAY	0	8	2009-10-23	2929	\N	1717
7948	GENERIC_DAY	0	8	2009-11-03	2929	\N	1717
7949	GENERIC_DAY	0	0	2009-10-22	304	\N	1717
7950	GENERIC_DAY	0	8	2009-12-15	2929	\N	1717
7951	GENERIC_DAY	0	8	2009-11-09	2929	\N	1717
7952	GENERIC_DAY	0	0	2009-11-12	2121	\N	1717
7953	GENERIC_DAY	0	0	2009-11-06	306	\N	1717
7954	GENERIC_DAY	0	2	2009-11-14	306	\N	1717
7955	GENERIC_DAY	0	0	2009-10-22	2121	\N	1717
7956	GENERIC_DAY	0	8	2009-12-14	2929	\N	1717
7957	GENERIC_DAY	0	2	2009-10-24	2929	\N	1717
7958	GENERIC_DAY	0	0	2009-10-15	2121	\N	1717
7959	GENERIC_DAY	0	0	2009-11-25	2121	\N	1717
7960	GENERIC_DAY	0	8	2009-12-11	2929	\N	1717
7961	GENERIC_DAY	0	2	2009-12-13	306	\N	1717
7962	GENERIC_DAY	0	2	2009-11-21	304	\N	1717
7963	GENERIC_DAY	0	0	2009-11-03	304	\N	1717
7964	GENERIC_DAY	0	0	2009-12-09	306	\N	1717
7965	GENERIC_DAY	0	0	2009-11-24	306	\N	1717
7966	GENERIC_DAY	0	2	2009-12-13	2121	\N	1717
7967	GENERIC_DAY	0	2	2009-12-13	2929	\N	1717
7968	GENERIC_DAY	0	8	2009-11-30	2929	\N	1717
7969	GENERIC_DAY	0	0	2009-11-06	2121	\N	1717
7970	GENERIC_DAY	0	0	2009-10-20	306	\N	1717
7971	GENERIC_DAY	0	2	2009-11-14	2929	\N	1717
7972	GENERIC_DAY	0	8	2009-12-03	2929	\N	1717
7357	SPECIFIC_DAY	0	0	2010-06-06	2929	3737	\N
7358	SPECIFIC_DAY	0	8	2010-06-10	2929	3737	\N
7359	SPECIFIC_DAY	0	0	2010-02-28	2929	3737	\N
7360	SPECIFIC_DAY	0	8	2010-02-10	2929	3737	\N
7361	SPECIFIC_DAY	0	8	2010-05-03	2929	3737	\N
7362	SPECIFIC_DAY	0	8	2010-04-13	2929	3737	\N
7363	SPECIFIC_DAY	0	8	2010-06-02	2929	3737	\N
9090	GENERIC_DAY	0	2	2010-06-23	2929	\N	8989
9091	GENERIC_DAY	0	0	2009-11-19	2929	\N	8989
9092	GENERIC_DAY	0	3	2010-02-21	7980	\N	8989
9093	GENERIC_DAY	0	0	2010-04-03	2121	\N	8989
9094	GENERIC_DAY	0	2	2010-04-06	7981	\N	8989
9095	GENERIC_DAY	0	0	2009-11-25	2929	\N	8989
9096	GENERIC_DAY	0	2	2010-06-04	7980	\N	8989
9097	GENERIC_DAY	0	3	2010-02-15	7981	\N	8989
9098	GENERIC_DAY	0	0	2010-01-24	2121	\N	8989
9099	GENERIC_DAY	0	0	2010-02-05	2121	\N	8989
9100	GENERIC_DAY	0	0	2010-04-25	7981	\N	8989
9101	GENERIC_DAY	0	0	2010-02-27	7981	\N	8989
9102	GENERIC_DAY	0	4	2010-01-09	7979	\N	8989
9103	GENERIC_DAY	0	4	2010-02-13	7979	\N	8989
9104	GENERIC_DAY	0	2	2010-05-04	7981	\N	8989
9105	GENERIC_DAY	0	2	2010-05-20	7981	\N	8989
9106	GENERIC_DAY	0	2	2010-06-11	7981	\N	8989
9107	GENERIC_DAY	0	2	2010-01-18	7980	\N	8989
9108	GENERIC_DAY	0	0	2010-02-19	2121	\N	8989
9109	GENERIC_DAY	0	0	2010-02-16	2121	\N	8989
9110	GENERIC_DAY	0	0	2009-10-23	2929	\N	8989
9111	GENERIC_DAY	0	0	2009-10-30	2121	\N	8989
9112	GENERIC_DAY	0	2	2010-04-07	7981	\N	8989
9113	GENERIC_DAY	0	0	2009-12-27	304	\N	8989
9114	GENERIC_DAY	0	2	2010-05-21	7979	\N	8989
9115	GENERIC_DAY	0	0	2010-04-02	2929	\N	8989
9116	GENERIC_DAY	0	0	2010-02-15	306	\N	8989
9117	GENERIC_DAY	0	2	2010-06-02	7979	\N	8989
9118	GENERIC_DAY	0	0	2010-04-14	2121	\N	8989
9119	GENERIC_DAY	0	0	2010-02-01	2929	\N	8989
9120	GENERIC_DAY	0	0	2010-01-29	304	\N	8989
9121	GENERIC_DAY	0	0	2009-11-07	2929	\N	8989
9122	GENERIC_DAY	0	0	2010-03-26	306	\N	8989
9123	GENERIC_DAY	0	0	2009-11-17	2929	\N	8989
9124	GENERIC_DAY	0	4	2009-11-14	7980	\N	8989
9125	GENERIC_DAY	0	3	2009-11-13	7980	\N	8989
9126	GENERIC_DAY	0	2	2010-04-06	304	\N	8989
9127	GENERIC_DAY	0	0	2010-05-30	7981	\N	8989
9128	GENERIC_DAY	0	2	2009-12-02	7979	\N	8989
9129	GENERIC_DAY	0	0	2010-05-08	2929	\N	8989
9130	GENERIC_DAY	0	0	2010-03-19	306	\N	8989
9131	GENERIC_DAY	0	2	2010-04-07	7980	\N	8989
9132	GENERIC_DAY	0	0	2009-12-31	304	\N	8989
9133	GENERIC_DAY	0	3	2010-05-16	7980	\N	8989
9134	GENERIC_DAY	0	0	2009-12-06	2121	\N	8989
9135	GENERIC_DAY	0	0	2010-01-30	7981	\N	8989
9136	GENERIC_DAY	0	0	2010-01-03	2121	\N	8989
9137	GENERIC_DAY	0	0	2010-05-29	306	\N	8989
9138	GENERIC_DAY	0	2	2010-01-13	7979	\N	8989
9139	GENERIC_DAY	0	2	2009-12-22	7979	\N	8989
9140	GENERIC_DAY	0	2	2010-03-02	304	\N	8989
9141	GENERIC_DAY	0	3	2010-04-04	304	\N	8989
9142	GENERIC_DAY	0	2	2010-05-06	7980	\N	8989
9143	GENERIC_DAY	0	2	2009-10-23	7979	\N	8989
9144	GENERIC_DAY	0	2	2010-03-30	304	\N	8989
9145	GENERIC_DAY	0	0	2010-04-18	2121	\N	8989
9146	GENERIC_DAY	0	0	2009-11-22	306	\N	8989
9147	GENERIC_DAY	0	0	2010-03-29	306	\N	8989
9148	GENERIC_DAY	0	0	2010-06-23	2121	\N	8989
9149	GENERIC_DAY	0	2	2009-12-18	7980	\N	8989
9150	GENERIC_DAY	0	0	2010-06-20	7981	\N	8989
9151	GENERIC_DAY	0	2	2010-04-20	7979	\N	8989
9152	GENERIC_DAY	0	0	2009-12-28	2121	\N	8989
9153	GENERIC_DAY	0	2	2010-04-13	7979	\N	8989
9154	GENERIC_DAY	0	0	2009-12-12	2929	\N	8989
9155	GENERIC_DAY	0	4	2010-01-09	7980	\N	8989
9156	GENERIC_DAY	0	0	2009-12-08	2929	\N	8989
9157	GENERIC_DAY	0	0	2010-04-14	2929	\N	8989
9158	GENERIC_DAY	0	2	2010-04-19	7979	\N	8989
9159	GENERIC_DAY	0	0	2010-01-24	7981	\N	8989
9160	GENERIC_DAY	0	0	2010-05-08	2121	\N	8989
9161	GENERIC_DAY	0	0	2009-10-27	2121	\N	8989
9162	GENERIC_DAY	0	0	2010-06-17	306	\N	8989
9163	GENERIC_DAY	0	0	2009-12-11	306	\N	8989
9164	GENERIC_DAY	0	0	2010-05-12	2929	\N	8989
9165	GENERIC_DAY	0	0	2010-02-18	306	\N	8989
9166	GENERIC_DAY	0	0	2010-04-03	306	\N	8989
9167	GENERIC_DAY	0	2	2010-03-19	7979	\N	8989
9168	GENERIC_DAY	0	0	2010-02-03	2121	\N	8989
9169	GENERIC_DAY	0	2	2010-02-24	7979	\N	8989
9170	GENERIC_DAY	0	2	2010-03-17	7980	\N	8989
9171	GENERIC_DAY	0	0	2010-06-08	2121	\N	8989
9172	GENERIC_DAY	0	2	2010-04-21	7979	\N	8989
9173	GENERIC_DAY	0	0	2010-06-09	2929	\N	8989
9174	GENERIC_DAY	0	2	2010-05-12	304	\N	8989
9175	GENERIC_DAY	0	3	2009-12-01	7980	\N	8989
9176	GENERIC_DAY	0	0	2009-12-27	7981	\N	8989
9177	GENERIC_DAY	0	0	2009-11-08	306	\N	8989
9178	GENERIC_DAY	0	3	2010-04-03	7980	\N	8989
9179	GENERIC_DAY	0	0	2010-01-11	306	\N	8989
9180	GENERIC_DAY	0	0	2010-01-12	306	\N	8989
9181	GENERIC_DAY	0	2	2010-02-25	7981	\N	8989
9182	GENERIC_DAY	0	0	2009-12-19	306	\N	8989
9183	GENERIC_DAY	0	0	2009-11-10	306	\N	8989
9184	GENERIC_DAY	0	2	2010-05-13	7979	\N	8989
9185	GENERIC_DAY	0	0	2010-01-09	306	\N	8989
9186	GENERIC_DAY	0	2	2010-05-19	7981	\N	8989
9187	GENERIC_DAY	0	2	2010-05-12	7981	\N	8989
9188	GENERIC_DAY	0	0	2009-10-28	306	\N	8989
9189	GENERIC_DAY	0	2	2010-03-18	304	\N	8989
9190	GENERIC_DAY	0	2	2010-05-20	304	\N	8989
9191	GENERIC_DAY	0	2	2009-11-03	7979	\N	8989
9192	GENERIC_DAY	0	3	2010-02-16	7981	\N	8989
9193	GENERIC_DAY	0	2	2010-05-03	7979	\N	8989
9194	GENERIC_DAY	0	3	2010-06-19	7980	\N	8989
9195	GENERIC_DAY	0	0	2009-11-15	2121	\N	8989
9196	GENERIC_DAY	0	2	2010-05-17	7980	\N	8989
9197	GENERIC_DAY	0	2	2010-03-04	7979	\N	8989
9198	GENERIC_DAY	0	0	2009-11-07	2121	\N	8989
9199	GENERIC_DAY	0	2	2010-03-22	304	\N	8989
9200	GENERIC_DAY	0	0	2009-12-16	306	\N	8989
9201	GENERIC_DAY	0	0	2010-06-18	2929	\N	8989
9202	GENERIC_DAY	0	2	2010-02-26	304	\N	8989
9203	GENERIC_DAY	0	0	2009-11-18	2929	\N	8989
9204	GENERIC_DAY	0	0	2010-02-22	2929	\N	8989
9205	GENERIC_DAY	0	2	2010-05-10	7981	\N	8989
9206	GENERIC_DAY	0	0	2009-12-03	304	\N	8989
9207	GENERIC_DAY	0	0	2009-12-14	2929	\N	8989
9208	GENERIC_DAY	0	0	2010-03-04	306	\N	8989
9209	GENERIC_DAY	0	4	2009-12-06	7980	\N	8989
9210	GENERIC_DAY	0	0	2010-02-20	2929	\N	8989
9211	GENERIC_DAY	0	0	2010-02-09	2121	\N	8989
9212	GENERIC_DAY	0	0	2010-05-07	306	\N	8989
9213	GENERIC_DAY	0	3	2010-02-20	7980	\N	8989
9214	GENERIC_DAY	0	0	2009-12-01	306	\N	8989
9215	GENERIC_DAY	0	3	2010-02-11	7981	\N	8989
9216	GENERIC_DAY	0	2	2010-03-25	7980	\N	8989
9217	GENERIC_DAY	0	2	2010-03-06	7979	\N	8989
9218	GENERIC_DAY	0	0	2009-12-13	7981	\N	8989
9219	GENERIC_DAY	0	2	2010-04-17	7979	\N	8989
9220	GENERIC_DAY	0	0	2010-03-11	2929	\N	8989
9221	GENERIC_DAY	0	0	2009-11-02	2121	\N	8989
9222	GENERIC_DAY	0	2	2010-05-18	304	\N	8989
9223	GENERIC_DAY	0	0	2009-12-01	2121	\N	8989
9224	GENERIC_DAY	0	2	2009-12-30	2929	\N	8989
9225	GENERIC_DAY	0	0	2010-01-23	306	\N	8989
9226	GENERIC_DAY	0	2	2010-01-28	7979	\N	8989
9227	GENERIC_DAY	0	2	2010-04-26	7981	\N	8989
9228	GENERIC_DAY	0	0	2010-05-25	2929	\N	8989
9229	GENERIC_DAY	0	2	2010-06-24	7979	\N	8989
9230	GENERIC_DAY	0	2	2010-03-08	7981	\N	8989
9231	GENERIC_DAY	0	0	2010-01-31	2929	\N	8989
9232	GENERIC_DAY	0	0	2010-06-06	306	\N	8989
9233	GENERIC_DAY	0	0	2009-11-16	2121	\N	8989
9234	GENERIC_DAY	0	0	2009-12-15	306	\N	8989
9235	GENERIC_DAY	0	0	2010-06-13	7981	\N	8989
9236	GENERIC_DAY	0	2	2010-06-07	7979	\N	8989
9237	GENERIC_DAY	0	0	2010-04-19	2929	\N	8989
9238	GENERIC_DAY	0	2	2010-03-02	7979	\N	8989
9239	GENERIC_DAY	0	0	2010-03-12	306	\N	8989
9240	GENERIC_DAY	0	3	2009-10-30	7981	\N	8989
9241	GENERIC_DAY	0	4	2009-12-19	7979	\N	8989
9242	GENERIC_DAY	0	0	2010-02-16	306	\N	8989
9243	GENERIC_DAY	0	0	2009-11-12	304	\N	8989
9244	GENERIC_DAY	0	0	2009-12-07	2929	\N	8989
9245	GENERIC_DAY	0	0	2009-11-09	2121	\N	8989
9246	GENERIC_DAY	0	0	2010-04-13	306	\N	8989
9247	GENERIC_DAY	0	0	2009-12-12	304	\N	8989
9248	GENERIC_DAY	0	2	2010-04-05	7980	\N	8989
9249	GENERIC_DAY	0	3	2009-11-03	7980	\N	8989
9250	GENERIC_DAY	0	2	2010-01-18	2929	\N	8989
9251	GENERIC_DAY	0	0	2009-12-25	304	\N	8989
9252	GENERIC_DAY	0	0	2009-10-30	2929	\N	8989
9253	GENERIC_DAY	0	0	2009-11-20	2121	\N	8989
9254	GENERIC_DAY	0	0	2010-02-28	2121	\N	8989
9255	GENERIC_DAY	0	4	2009-12-26	7980	\N	8989
9256	GENERIC_DAY	0	0	2010-04-25	2121	\N	8989
9257	GENERIC_DAY	0	0	2010-05-30	2121	\N	8989
9258	GENERIC_DAY	0	4	2009-10-24	7979	\N	8989
9259	GENERIC_DAY	0	0	2009-11-21	7981	\N	8989
9260	GENERIC_DAY	0	3	2010-06-06	304	\N	8989
9261	GENERIC_DAY	0	0	2010-02-16	2929	\N	8989
9262	GENERIC_DAY	0	3	2010-06-05	304	\N	8989
9263	GENERIC_DAY	0	0	2010-03-31	2929	\N	8989
9264	GENERIC_DAY	0	0	2009-10-27	2929	\N	8989
9265	GENERIC_DAY	0	2	2010-04-27	7981	\N	8989
9266	GENERIC_DAY	0	2	2010-03-17	7979	\N	8989
9267	GENERIC_DAY	0	3	2009-11-24	7981	\N	8989
9268	GENERIC_DAY	0	0	2009-12-05	304	\N	8989
9269	GENERIC_DAY	0	2	2010-01-18	7979	\N	8989
9270	GENERIC_DAY	0	0	2010-05-24	306	\N	8989
9271	GENERIC_DAY	0	0	2010-02-06	7981	\N	8989
9272	GENERIC_DAY	0	0	2009-12-11	2121	\N	8989
9273	GENERIC_DAY	0	0	2009-11-30	304	\N	8989
9274	GENERIC_DAY	0	0	2010-02-17	2929	\N	8989
9275	GENERIC_DAY	0	2	2010-06-13	7979	\N	8989
9276	GENERIC_DAY	0	4	2010-01-23	7980	\N	8989
9277	GENERIC_DAY	0	0	2010-02-08	306	\N	8989
9278	GENERIC_DAY	0	0	2009-12-29	2121	\N	8989
9279	GENERIC_DAY	0	2	2010-05-11	7979	\N	8989
9280	GENERIC_DAY	0	0	2009-11-09	304	\N	8989
9281	GENERIC_DAY	0	3	2009-12-09	7980	\N	8989
9282	GENERIC_DAY	0	3	2009-10-22	7980	\N	8989
9283	GENERIC_DAY	0	2	2010-04-16	304	\N	8989
9284	GENERIC_DAY	0	0	2009-10-20	306	\N	8989
9285	GENERIC_DAY	0	2	2010-01-05	7979	\N	8989
9286	GENERIC_DAY	0	4	2009-12-26	7979	\N	8989
9287	GENERIC_DAY	0	0	2009-10-22	2121	\N	8989
9288	GENERIC_DAY	0	2	2010-05-19	304	\N	8989
9289	GENERIC_DAY	0	3	2010-03-21	304	\N	8989
9290	GENERIC_DAY	0	0	2010-05-13	306	\N	8989
9291	GENERIC_DAY	0	3	2009-12-09	7981	\N	8989
9292	GENERIC_DAY	0	0	2010-05-02	7981	\N	8989
9293	GENERIC_DAY	0	2	2010-06-03	7980	\N	8989
9294	GENERIC_DAY	0	0	2009-11-13	306	\N	8989
9295	GENERIC_DAY	0	0	2010-01-10	7981	\N	8989
9296	GENERIC_DAY	0	2	2010-01-14	7980	\N	8989
9297	GENERIC_DAY	0	4	2009-11-15	7980	\N	8989
9298	GENERIC_DAY	0	3	2009-11-19	7980	\N	8989
9299	GENERIC_DAY	0	0	2010-03-09	2929	\N	8989
9300	GENERIC_DAY	0	0	2010-01-24	304	\N	8989
9301	GENERIC_DAY	0	0	2010-02-07	2121	\N	8989
9302	GENERIC_DAY	0	3	2010-04-18	304	\N	8989
9303	GENERIC_DAY	0	2	2010-03-05	7980	\N	8989
9304	GENERIC_DAY	0	0	2010-04-25	2929	\N	8989
9305	GENERIC_DAY	0	2	2010-05-26	7981	\N	8989
9306	GENERIC_DAY	0	3	2010-02-16	7980	\N	8989
9307	GENERIC_DAY	0	0	2010-01-02	2929	\N	8989
9308	GENERIC_DAY	0	0	2009-11-28	7981	\N	8989
9309	GENERIC_DAY	0	0	2010-06-17	2121	\N	8989
9310	GENERIC_DAY	0	0	2010-02-26	2121	\N	8989
9311	GENERIC_DAY	0	0	2009-11-23	2121	\N	8989
9312	GENERIC_DAY	0	0	2010-06-12	306	\N	8989
9313	GENERIC_DAY	0	0	2010-03-26	2929	\N	8989
9314	GENERIC_DAY	0	0	2010-04-11	306	\N	8989
9315	GENERIC_DAY	0	2	2010-03-08	7979	\N	8989
9316	GENERIC_DAY	0	2	2010-03-03	304	\N	8989
9317	GENERIC_DAY	0	0	2009-12-14	304	\N	8989
9318	GENERIC_DAY	0	3	2009-12-15	7981	\N	8989
9319	GENERIC_DAY	0	0	2010-03-29	2121	\N	8989
9320	GENERIC_DAY	0	0	2010-05-02	306	\N	8989
9321	GENERIC_DAY	0	2	2010-02-22	7980	\N	8989
9322	GENERIC_DAY	0	0	2010-04-06	2929	\N	8989
9323	GENERIC_DAY	0	0	2010-04-24	7981	\N	8989
9324	GENERIC_DAY	0	0	2009-12-19	2929	\N	8989
9325	GENERIC_DAY	0	2	2010-02-17	304	\N	8989
9326	GENERIC_DAY	0	2	2010-02-02	7979	\N	8989
9327	GENERIC_DAY	0	2	2009-12-24	7979	\N	8989
9328	GENERIC_DAY	0	0	2010-06-09	306	\N	8989
9329	GENERIC_DAY	0	0	2010-03-02	2121	\N	8989
9330	GENERIC_DAY	0	2	2010-05-06	7981	\N	8989
9331	GENERIC_DAY	0	2	2010-06-04	7979	\N	8989
9332	GENERIC_DAY	0	0	2010-03-28	2929	\N	8989
9333	GENERIC_DAY	0	0	2010-02-07	2929	\N	8989
9334	GENERIC_DAY	0	0	2010-06-23	304	\N	8989
9335	GENERIC_DAY	0	2	2010-04-14	304	\N	8989
9336	GENERIC_DAY	0	2	2010-06-14	7980	\N	8989
9337	GENERIC_DAY	0	3	2009-12-10	7980	\N	8989
9338	GENERIC_DAY	0	0	2010-06-16	2121	\N	8989
9339	GENERIC_DAY	0	2	2010-02-01	7979	\N	8989
9340	GENERIC_DAY	0	0	2010-01-25	304	\N	8989
9341	GENERIC_DAY	0	0	2009-12-08	306	\N	8989
9342	GENERIC_DAY	0	0	2010-01-13	306	\N	8989
9343	GENERIC_DAY	0	2	2010-06-14	7981	\N	8989
9344	GENERIC_DAY	0	2	2010-05-04	7980	\N	8989
9345	GENERIC_DAY	0	0	2010-02-21	7981	\N	8989
9346	GENERIC_DAY	0	2	2010-04-21	304	\N	8989
9347	GENERIC_DAY	0	0	2010-01-05	2121	\N	8989
9348	GENERIC_DAY	0	0	2010-03-15	306	\N	8989
9349	GENERIC_DAY	0	0	2010-04-24	2121	\N	8989
9350	GENERIC_DAY	0	3	2009-10-23	7980	\N	8989
9351	GENERIC_DAY	0	0	2009-12-12	306	\N	8989
9352	GENERIC_DAY	0	2	2010-05-31	304	\N	8989
9353	GENERIC_DAY	0	0	2009-10-25	7981	\N	8989
9354	GENERIC_DAY	0	0	2009-12-16	2929	\N	8989
9355	GENERIC_DAY	0	2	2010-03-21	7979	\N	8989
9356	GENERIC_DAY	0	2	2010-05-17	7979	\N	8989
9357	GENERIC_DAY	0	2	2010-05-18	7980	\N	8989
9358	GENERIC_DAY	0	0	2009-11-01	2929	\N	8989
9359	GENERIC_DAY	0	0	2010-01-06	306	\N	8989
9360	GENERIC_DAY	0	0	2010-05-28	2929	\N	8989
9361	GENERIC_DAY	0	4	2009-12-12	7979	\N	8989
9362	GENERIC_DAY	0	0	2010-02-06	2929	\N	8989
9363	GENERIC_DAY	0	0	2010-04-21	306	\N	8989
9364	GENERIC_DAY	0	2	2010-01-12	7979	\N	8989
9365	GENERIC_DAY	0	0	2009-11-24	2121	\N	8989
9366	GENERIC_DAY	0	0	2010-03-16	306	\N	8989
9367	GENERIC_DAY	0	2	2010-02-24	7980	\N	8989
9368	GENERIC_DAY	0	0	2010-01-23	304	\N	8989
9369	GENERIC_DAY	0	0	2009-10-30	306	\N	8989
9370	GENERIC_DAY	0	0	2010-01-07	2121	\N	8989
9371	GENERIC_DAY	0	2	2010-03-30	7979	\N	8989
9372	GENERIC_DAY	0	2	2010-06-10	7980	\N	8989
9373	GENERIC_DAY	0	0	2010-04-10	7981	\N	8989
9374	GENERIC_DAY	0	2	2010-01-08	7979	\N	8989
9375	GENERIC_DAY	0	2	2010-04-02	7980	\N	8989
9376	GENERIC_DAY	0	2	2010-06-11	7979	\N	8989
9377	GENERIC_DAY	0	0	2010-05-27	306	\N	8989
9378	GENERIC_DAY	0	0	2009-11-14	2121	\N	8989
9379	GENERIC_DAY	0	2	2010-03-03	7980	\N	8989
9380	GENERIC_DAY	0	2	2009-12-30	7979	\N	8989
9381	GENERIC_DAY	0	0	2009-12-18	306	\N	8989
9382	GENERIC_DAY	0	0	2010-05-27	2929	\N	8989
9383	GENERIC_DAY	0	0	2010-06-24	306	\N	8989
9384	GENERIC_DAY	0	2	2010-04-29	7981	\N	8989
9385	GENERIC_DAY	0	0	2009-11-03	304	\N	8989
9386	GENERIC_DAY	0	2	2010-05-07	304	\N	8989
9387	GENERIC_DAY	0	0	2010-02-12	2929	\N	8989
9388	GENERIC_DAY	0	0	2010-01-31	2121	\N	8989
9389	GENERIC_DAY	0	2	2010-06-07	7980	\N	8989
9390	GENERIC_DAY	0	0	2010-04-24	306	\N	8989
9391	GENERIC_DAY	0	2	2010-03-29	7979	\N	8989
9392	GENERIC_DAY	0	2	2010-04-16	7980	\N	8989
9393	GENERIC_DAY	0	0	2010-01-29	2121	\N	8989
9394	GENERIC_DAY	0	2	2009-12-17	7980	\N	8989
9395	GENERIC_DAY	0	4	2010-01-23	7979	\N	8989
9396	GENERIC_DAY	0	2	2010-01-25	7979	\N	8989
9397	GENERIC_DAY	0	0	2010-03-20	2929	\N	8989
9398	GENERIC_DAY	0	3	2009-10-20	7980	\N	8989
9399	GENERIC_DAY	0	3	2009-10-27	7981	\N	8989
9400	GENERIC_DAY	0	0	2009-11-30	2929	\N	8989
9401	GENERIC_DAY	0	0	2010-01-19	304	\N	8989
9402	GENERIC_DAY	0	2	2010-05-20	7980	\N	8989
9403	GENERIC_DAY	0	0	2009-12-13	304	\N	8989
9404	GENERIC_DAY	0	1	2010-06-22	304	\N	8989
9405	GENERIC_DAY	0	3	2009-11-03	7981	\N	8989
9406	GENERIC_DAY	0	3	2010-03-28	7980	\N	8989
9407	GENERIC_DAY	0	0	2009-12-23	304	\N	8989
9408	GENERIC_DAY	0	0	2009-12-05	2929	\N	8989
9409	GENERIC_DAY	0	2	2010-04-12	7979	\N	8989
9410	GENERIC_DAY	0	2	2010-06-15	7981	\N	8989
9411	GENERIC_DAY	0	0	2009-10-20	2121	\N	8989
9412	GENERIC_DAY	0	2	2010-02-17	7979	\N	8989
9413	GENERIC_DAY	0	0	2010-05-16	7981	\N	8989
9414	GENERIC_DAY	0	0	2010-01-01	304	\N	8989
9415	GENERIC_DAY	0	2	2010-04-08	7981	\N	8989
9416	GENERIC_DAY	0	0	2010-02-25	306	\N	8989
9417	GENERIC_DAY	0	2	2010-04-08	7979	\N	8989
9418	GENERIC_DAY	0	2	2010-03-08	304	\N	8989
9419	GENERIC_DAY	0	0	2010-05-14	306	\N	8989
9420	GENERIC_DAY	0	0	2010-06-05	2929	\N	8989
9421	GENERIC_DAY	0	0	2009-11-10	304	\N	8989
9422	GENERIC_DAY	0	2	2010-03-23	7979	\N	8989
9423	GENERIC_DAY	0	2	2010-04-19	304	\N	8989
9424	GENERIC_DAY	0	0	2010-04-29	306	\N	8989
9425	GENERIC_DAY	0	2	2010-02-18	7979	\N	8989
9426	GENERIC_DAY	0	0	2010-06-06	7981	\N	8989
9427	GENERIC_DAY	0	0	2010-02-20	306	\N	8989
9428	GENERIC_DAY	0	3	2010-04-18	7980	\N	8989
9429	GENERIC_DAY	0	0	2010-03-21	2929	\N	8989
9430	GENERIC_DAY	0	0	2010-04-16	306	\N	8989
9431	GENERIC_DAY	0	0	2010-03-23	2929	\N	8989
9432	GENERIC_DAY	0	0	2010-03-05	2929	\N	8989
9433	GENERIC_DAY	0	0	2010-05-18	2121	\N	8989
9434	GENERIC_DAY	0	0	2009-12-05	7981	\N	8989
9435	GENERIC_DAY	0	2	2010-02-19	7979	\N	8989
9436	GENERIC_DAY	0	0	2010-03-20	2121	\N	8989
9437	GENERIC_DAY	0	2	2010-06-24	7981	\N	8989
9438	GENERIC_DAY	0	0	2009-12-13	2929	\N	8989
9439	GENERIC_DAY	0	0	2010-01-07	304	\N	8989
9440	GENERIC_DAY	0	0	2010-03-27	306	\N	8989
9441	GENERIC_DAY	0	2	2010-03-10	7980	\N	8989
9442	GENERIC_DAY	0	0	2010-02-10	306	\N	8989
9443	GENERIC_DAY	0	2	2010-06-25	7980	\N	8989
9444	GENERIC_DAY	0	0	2010-01-28	2929	\N	8989
9445	GENERIC_DAY	0	0	2009-12-24	2121	\N	8989
9446	GENERIC_DAY	0	0	2010-03-25	2929	\N	8989
9447	GENERIC_DAY	0	3	2009-10-20	7981	\N	8989
9448	GENERIC_DAY	0	0	2010-04-07	306	\N	8989
9449	GENERIC_DAY	0	0	2009-12-29	304	\N	8989
9450	GENERIC_DAY	0	2	2010-05-31	7981	\N	8989
9451	GENERIC_DAY	0	0	2009-12-24	304	\N	8989
9452	GENERIC_DAY	0	0	2010-03-18	2929	\N	8989
9453	GENERIC_DAY	0	2	2010-03-26	304	\N	8989
9454	GENERIC_DAY	0	4	2010-01-30	7979	\N	8989
9455	GENERIC_DAY	0	0	2010-05-03	2121	\N	8989
9456	GENERIC_DAY	0	0	2009-10-24	2121	\N	8989
9457	GENERIC_DAY	0	0	2010-03-20	7981	\N	8989
9458	GENERIC_DAY	0	0	2009-10-26	2121	\N	8989
9459	GENERIC_DAY	0	0	2009-11-29	304	\N	8989
9460	GENERIC_DAY	0	2	2010-03-19	7981	\N	8989
9461	GENERIC_DAY	0	2	2010-01-13	7981	\N	8989
9462	GENERIC_DAY	0	2	2010-04-16	7981	\N	8989
9463	GENERIC_DAY	0	0	2009-12-25	2121	\N	8989
9464	GENERIC_DAY	0	2	2010-05-24	7980	\N	8989
9465	GENERIC_DAY	0	3	2009-12-04	7980	\N	8989
9466	GENERIC_DAY	0	0	2010-06-07	2121	\N	8989
9467	GENERIC_DAY	0	0	2010-01-10	304	\N	8989
9468	GENERIC_DAY	0	0	2010-02-18	2121	\N	8989
9469	GENERIC_DAY	0	0	2010-01-20	306	\N	8989
9470	GENERIC_DAY	0	0	2010-06-19	306	\N	8989
9471	GENERIC_DAY	0	0	2010-02-13	7981	\N	8989
9472	GENERIC_DAY	0	4	2009-11-08	7980	\N	8989
9473	GENERIC_DAY	0	2	2009-12-29	7981	\N	8989
9474	GENERIC_DAY	0	2	2010-04-26	304	\N	8989
9475	GENERIC_DAY	0	0	2009-11-07	304	\N	8989
9476	GENERIC_DAY	0	0	2010-01-08	306	\N	8989
9477	GENERIC_DAY	0	0	2010-06-14	2929	\N	8989
9478	GENERIC_DAY	0	0	2010-04-02	306	\N	8989
9479	GENERIC_DAY	0	0	2010-05-20	2121	\N	8989
9480	GENERIC_DAY	0	2	2010-02-19	7980	\N	8989
9481	GENERIC_DAY	0	0	2010-05-24	2929	\N	8989
9482	GENERIC_DAY	0	3	2010-05-30	7980	\N	8989
9483	GENERIC_DAY	0	0	2010-01-17	2929	\N	8989
9484	GENERIC_DAY	0	0	2009-12-18	2121	\N	8989
9485	GENERIC_DAY	0	0	2010-02-20	7981	\N	8989
9486	GENERIC_DAY	0	0	2010-05-03	2929	\N	8989
9487	GENERIC_DAY	0	2	2010-01-06	2929	\N	8989
9488	GENERIC_DAY	0	2	2010-04-20	7980	\N	8989
9489	GENERIC_DAY	0	3	2009-12-01	7981	\N	8989
9490	GENERIC_DAY	0	2	2010-03-18	7981	\N	8989
9491	GENERIC_DAY	0	2	2010-04-20	304	\N	8989
9492	GENERIC_DAY	0	2	2010-01-15	7981	\N	8989
9493	GENERIC_DAY	0	0	2010-02-08	2121	\N	8989
9494	GENERIC_DAY	0	3	2009-11-05	7981	\N	8989
9495	GENERIC_DAY	0	2	2010-05-27	7981	\N	8989
9496	GENERIC_DAY	0	3	2010-05-02	304	\N	8989
9497	GENERIC_DAY	0	0	2010-01-11	2121	\N	8989
9498	GENERIC_DAY	0	0	2009-12-27	306	\N	8989
9499	GENERIC_DAY	0	0	2010-04-09	306	\N	8989
9500	GENERIC_DAY	0	2	2010-03-12	304	\N	8989
9501	GENERIC_DAY	0	0	2009-12-20	306	\N	8989
9502	GENERIC_DAY	0	2	2010-02-17	7980	\N	8989
9503	GENERIC_DAY	0	2	2010-05-08	7979	\N	8989
9504	GENERIC_DAY	0	2	2010-04-25	7979	\N	8989
9505	GENERIC_DAY	0	0	2009-11-23	304	\N	8989
9506	GENERIC_DAY	0	2	2010-04-13	7980	\N	8989
9507	GENERIC_DAY	0	4	2010-01-03	7980	\N	8989
9508	GENERIC_DAY	0	0	2009-12-19	2121	\N	8989
9509	GENERIC_DAY	0	2	2010-02-19	7981	\N	8989
9510	GENERIC_DAY	0	2	2010-04-14	7979	\N	8989
9511	GENERIC_DAY	0	2	2010-04-15	304	\N	8989
9512	GENERIC_DAY	0	0	2010-01-10	306	\N	8989
9513	GENERIC_DAY	0	0	2010-05-22	2121	\N	8989
9514	GENERIC_DAY	0	4	2009-11-14	7979	\N	8989
9515	GENERIC_DAY	0	0	2010-02-01	304	\N	8989
9516	GENERIC_DAY	0	3	2010-01-28	7981	\N	8989
9517	GENERIC_DAY	0	2	2009-12-25	7979	\N	8989
9518	GENERIC_DAY	0	3	2009-10-19	7980	\N	8989
9519	GENERIC_DAY	0	0	2010-06-15	2121	\N	8989
9520	GENERIC_DAY	0	0	2009-11-04	306	\N	8989
9521	GENERIC_DAY	0	0	2009-12-02	304	\N	8989
9522	GENERIC_DAY	0	0	2010-04-04	2929	\N	8989
9523	GENERIC_DAY	0	2	2009-11-17	7979	\N	8989
9524	GENERIC_DAY	0	0	2010-02-20	2121	\N	8989
9525	GENERIC_DAY	0	0	2010-05-22	7981	\N	8989
9526	GENERIC_DAY	0	3	2010-05-01	304	\N	8989
9527	GENERIC_DAY	0	0	2009-11-15	304	\N	8989
9528	GENERIC_DAY	0	3	2009-10-23	7981	\N	8989
9529	GENERIC_DAY	0	2	2010-01-22	7981	\N	8989
9530	GENERIC_DAY	0	3	2009-11-16	7980	\N	8989
9531	GENERIC_DAY	0	0	2010-01-02	2121	\N	8989
9532	GENERIC_DAY	0	2	2010-01-22	2929	\N	8989
9533	GENERIC_DAY	0	4	2010-01-31	7980	\N	8989
9534	GENERIC_DAY	0	3	2009-11-27	7981	\N	8989
9535	GENERIC_DAY	0	3	2009-12-03	7981	\N	8989
9536	GENERIC_DAY	0	4	2009-10-31	7980	\N	8989
9537	GENERIC_DAY	0	0	2009-12-17	2121	\N	8989
9538	GENERIC_DAY	0	0	2009-11-25	2121	\N	8989
9539	GENERIC_DAY	0	0	2010-01-02	304	\N	8989
9540	GENERIC_DAY	0	0	2010-02-05	306	\N	8989
9541	GENERIC_DAY	0	2	2010-01-11	2929	\N	8989
9542	GENERIC_DAY	0	0	2009-12-20	7981	\N	8989
9543	GENERIC_DAY	0	0	2010-05-13	2929	\N	8989
9544	GENERIC_DAY	0	2	2009-11-27	7979	\N	8989
9545	GENERIC_DAY	0	2	2010-01-19	7981	\N	8989
9546	GENERIC_DAY	0	2	2009-12-17	2929	\N	8989
9547	GENERIC_DAY	0	0	2010-03-22	2121	\N	8989
9548	GENERIC_DAY	0	0	2010-01-04	304	\N	8989
9549	GENERIC_DAY	0	4	2009-11-07	7979	\N	8989
9550	GENERIC_DAY	0	0	2009-11-20	2929	\N	8989
9551	GENERIC_DAY	0	3	2010-06-12	304	\N	8989
9552	GENERIC_DAY	0	0	2010-04-30	306	\N	8989
9553	GENERIC_DAY	0	0	2009-12-10	304	\N	8989
9554	GENERIC_DAY	0	0	2010-03-28	306	\N	8989
9555	GENERIC_DAY	0	3	2009-11-04	7981	\N	8989
9556	GENERIC_DAY	0	0	2010-05-12	306	\N	8989
9557	GENERIC_DAY	0	2	2010-01-12	7981	\N	8989
9558	GENERIC_DAY	0	4	2010-01-16	7980	\N	8989
9559	GENERIC_DAY	0	2	2010-06-01	304	\N	8989
9560	GENERIC_DAY	0	0	2009-11-11	2121	\N	8989
9561	GENERIC_DAY	0	0	2009-11-24	304	\N	8989
9562	GENERIC_DAY	0	0	2009-12-15	2929	\N	8989
9563	GENERIC_DAY	0	0	2010-03-22	2929	\N	8989
9564	GENERIC_DAY	0	2	2010-06-14	7979	\N	8989
9565	GENERIC_DAY	0	4	2009-12-20	7980	\N	8989
9566	GENERIC_DAY	0	0	2010-04-27	306	\N	8989
9567	GENERIC_DAY	0	3	2009-10-29	7980	\N	8989
9568	GENERIC_DAY	0	0	2010-03-13	306	\N	8989
9569	GENERIC_DAY	0	2	2010-05-31	7979	\N	8989
9570	GENERIC_DAY	0	2	2010-04-18	7979	\N	8989
9571	GENERIC_DAY	0	0	2009-11-21	306	\N	8989
9572	GENERIC_DAY	0	2	2010-03-26	7980	\N	8989
9573	GENERIC_DAY	0	3	2010-02-28	304	\N	8989
9574	GENERIC_DAY	0	0	2010-04-18	2929	\N	8989
9575	GENERIC_DAY	0	0	2010-03-10	306	\N	8989
9576	GENERIC_DAY	0	0	2010-01-30	2121	\N	8989
9577	GENERIC_DAY	0	2	2010-04-12	7981	\N	8989
9578	GENERIC_DAY	0	0	2009-11-19	304	\N	8989
9579	GENERIC_DAY	0	0	2010-06-02	2929	\N	8989
9580	GENERIC_DAY	0	2	2010-03-09	304	\N	8989
9581	GENERIC_DAY	0	0	2009-10-31	304	\N	8989
9582	GENERIC_DAY	0	0	2010-05-09	2929	\N	8989
9583	GENERIC_DAY	0	2	2009-11-20	7979	\N	8989
9584	GENERIC_DAY	0	2	2010-05-07	7981	\N	8989
9585	GENERIC_DAY	0	0	2010-06-22	2121	\N	8989
9586	GENERIC_DAY	0	0	2010-05-15	2121	\N	8989
9587	GENERIC_DAY	0	0	2010-05-04	2929	\N	8989
9588	GENERIC_DAY	0	4	2010-02-13	7980	\N	8989
9589	GENERIC_DAY	0	0	2010-05-05	2121	\N	8989
9590	GENERIC_DAY	0	0	2009-11-03	2929	\N	8989
9591	GENERIC_DAY	0	2	2010-01-19	7980	\N	8989
9592	GENERIC_DAY	0	0	2010-04-02	2121	\N	8989
9593	GENERIC_DAY	0	3	2009-11-10	7981	\N	8989
9594	GENERIC_DAY	0	0	2010-06-01	306	\N	8989
9595	GENERIC_DAY	0	4	2009-11-28	7980	\N	8989
9596	GENERIC_DAY	0	2	2010-03-31	304	\N	8989
9597	GENERIC_DAY	0	2	2009-12-23	7981	\N	8989
9598	GENERIC_DAY	0	2	2010-05-06	304	\N	8989
9599	GENERIC_DAY	0	0	2009-12-22	2121	\N	8989
9600	GENERIC_DAY	0	4	2009-11-21	7980	\N	8989
9601	GENERIC_DAY	0	2	2009-12-23	7979	\N	8989
9602	GENERIC_DAY	0	0	2010-04-10	2929	\N	8989
9603	GENERIC_DAY	0	4	2010-01-24	7980	\N	8989
9604	GENERIC_DAY	0	4	2010-01-02	7979	\N	8989
9605	GENERIC_DAY	0	0	2010-01-08	304	\N	8989
9606	GENERIC_DAY	0	2	2010-04-01	7981	\N	8989
9607	GENERIC_DAY	0	0	2009-12-04	304	\N	8989
9608	GENERIC_DAY	0	2	2010-04-08	304	\N	8989
9609	GENERIC_DAY	0	3	2009-12-08	7980	\N	8989
9610	GENERIC_DAY	0	0	2010-04-08	2929	\N	8989
9611	GENERIC_DAY	0	2	2009-12-25	7981	\N	8989
9612	GENERIC_DAY	0	0	2010-06-03	2121	\N	8989
9613	GENERIC_DAY	0	2	2010-02-12	7979	\N	8989
9614	GENERIC_DAY	0	2	2010-05-05	7981	\N	8989
9615	GENERIC_DAY	0	2	2010-06-07	7981	\N	8989
9616	GENERIC_DAY	0	0	2010-01-09	2929	\N	8989
9617	GENERIC_DAY	0	0	2009-12-22	304	\N	8989
9618	GENERIC_DAY	0	0	2010-05-16	2929	\N	8989
9619	GENERIC_DAY	0	2	2009-12-25	2929	\N	8989
9620	GENERIC_DAY	0	4	2010-01-03	7979	\N	8989
9621	GENERIC_DAY	0	2	2010-01-04	7981	\N	8989
9622	GENERIC_DAY	0	0	2009-10-24	2929	\N	8989
9623	GENERIC_DAY	0	0	2009-11-14	2929	\N	8989
9624	GENERIC_DAY	0	0	2010-05-21	2929	\N	8989
9625	GENERIC_DAY	0	0	2010-02-04	2121	\N	8989
9626	GENERIC_DAY	0	0	2010-03-19	2929	\N	8989
9627	GENERIC_DAY	0	2	2010-04-11	7979	\N	8989
9628	GENERIC_DAY	0	0	2009-10-21	304	\N	8989
9629	GENERIC_DAY	0	2	2010-04-13	7981	\N	8989
9630	GENERIC_DAY	0	0	2010-06-25	304	\N	8989
9631	GENERIC_DAY	0	2	2009-12-24	7980	\N	8989
9632	GENERIC_DAY	0	0	2010-01-21	306	\N	8989
9633	GENERIC_DAY	0	2	2010-06-04	304	\N	8989
9634	GENERIC_DAY	0	2	2010-04-03	7979	\N	8989
9635	GENERIC_DAY	0	0	2009-12-07	304	\N	8989
9636	GENERIC_DAY	0	3	2010-05-22	7980	\N	8989
9637	GENERIC_DAY	0	0	2009-12-14	2121	\N	8989
9638	GENERIC_DAY	0	2	2010-06-03	7981	\N	8989
9639	GENERIC_DAY	0	0	2010-02-04	306	\N	8989
9640	GENERIC_DAY	0	0	2010-05-19	2121	\N	8989
9641	GENERIC_DAY	0	3	2010-02-09	7981	\N	8989
9642	GENERIC_DAY	0	0	2010-05-15	7981	\N	8989
9643	GENERIC_DAY	0	0	2009-11-17	304	\N	8989
9644	GENERIC_DAY	0	0	2010-03-07	7981	\N	8989
9645	GENERIC_DAY	0	0	2009-11-05	304	\N	8989
9646	GENERIC_DAY	0	0	2009-10-19	2121	\N	8989
9647	GENERIC_DAY	0	4	2009-10-25	7980	\N	8989
9648	GENERIC_DAY	0	3	2009-12-08	7981	\N	8989
9649	GENERIC_DAY	0	0	2009-10-27	306	\N	8989
9650	GENERIC_DAY	0	0	2010-03-29	2929	\N	8989
9651	GENERIC_DAY	0	2	2010-04-02	7979	\N	8989
9652	GENERIC_DAY	0	0	2010-06-03	306	\N	8989
9653	GENERIC_DAY	0	2	2009-12-18	2929	\N	8989
9654	GENERIC_DAY	0	0	2009-12-22	306	\N	8989
9655	GENERIC_DAY	0	0	2009-11-22	2929	\N	8989
9656	GENERIC_DAY	0	3	2009-10-29	7981	\N	8989
9657	GENERIC_DAY	0	3	2010-01-26	7981	\N	8989
9658	GENERIC_DAY	0	0	2009-11-11	2929	\N	8989
9659	GENERIC_DAY	0	2	2010-05-26	304	\N	8989
9660	GENERIC_DAY	0	2	2010-02-17	7981	\N	8989
9661	GENERIC_DAY	0	3	2010-02-21	304	\N	8989
9662	GENERIC_DAY	0	2	2010-01-04	7980	\N	8989
9663	GENERIC_DAY	0	2	2010-06-01	7979	\N	8989
9664	GENERIC_DAY	0	0	2009-11-22	304	\N	8989
9665	GENERIC_DAY	0	0	2010-04-23	306	\N	8989
9666	GENERIC_DAY	0	0	2010-03-31	2121	\N	8989
9667	GENERIC_DAY	0	3	2010-03-20	7980	\N	8989
9668	GENERIC_DAY	0	2	2009-12-04	7979	\N	8989
9669	GENERIC_DAY	0	0	2009-12-11	2929	\N	8989
9670	GENERIC_DAY	0	2	2010-03-28	7979	\N	8989
9671	GENERIC_DAY	0	0	2010-06-20	2929	\N	8989
9672	GENERIC_DAY	0	0	2010-05-08	7981	\N	8989
9673	GENERIC_DAY	0	2	2010-04-09	7981	\N	8989
9674	GENERIC_DAY	0	0	2010-05-22	306	\N	8989
9675	GENERIC_DAY	0	2	2010-06-23	7979	\N	8989
9676	GENERIC_DAY	0	3	2010-01-26	7980	\N	8989
9677	GENERIC_DAY	0	2	2010-03-19	304	\N	8989
9678	GENERIC_DAY	0	0	2010-01-02	306	\N	8989
9679	GENERIC_DAY	0	0	2010-04-10	306	\N	8989
9680	GENERIC_DAY	0	4	2010-01-10	7980	\N	8989
9681	GENERIC_DAY	0	2	2009-11-18	7979	\N	8989
9682	GENERIC_DAY	0	0	2010-02-04	2929	\N	8989
9683	GENERIC_DAY	0	2	2010-01-15	7980	\N	8989
9684	GENERIC_DAY	0	2	2010-05-13	7980	\N	8989
9685	GENERIC_DAY	0	2	2010-06-09	7980	\N	8989
9686	GENERIC_DAY	0	2	2010-06-03	304	\N	8989
9687	GENERIC_DAY	0	0	2010-01-02	7981	\N	8989
9688	GENERIC_DAY	0	3	2009-11-02	7980	\N	8989
9689	GENERIC_DAY	0	0	2010-05-29	2929	\N	8989
9690	GENERIC_DAY	0	2	2009-12-31	2929	\N	8989
9691	GENERIC_DAY	0	0	2010-05-20	306	\N	8989
9692	GENERIC_DAY	0	2	2010-05-14	7980	\N	8989
9693	GENERIC_DAY	0	0	2009-11-02	2929	\N	8989
9694	GENERIC_DAY	0	0	2009-11-13	2929	\N	8989
9695	GENERIC_DAY	0	0	2009-11-25	304	\N	8989
9696	GENERIC_DAY	0	0	2010-03-22	306	\N	8989
9697	GENERIC_DAY	0	3	2009-10-30	7980	\N	8989
9698	GENERIC_DAY	0	0	2010-04-16	2929	\N	8989
9699	GENERIC_DAY	0	0	2009-12-08	2121	\N	8989
9700	GENERIC_DAY	0	0	2009-12-15	2121	\N	8989
9701	GENERIC_DAY	0	4	2009-11-29	7980	\N	8989
9702	GENERIC_DAY	0	0	2010-01-27	2121	\N	8989
9703	GENERIC_DAY	0	2	2009-12-18	7979	\N	8989
9704	GENERIC_DAY	0	2	2010-04-26	7980	\N	8989
9705	GENERIC_DAY	0	0	2010-02-22	306	\N	8989
9706	GENERIC_DAY	0	4	2009-12-13	7979	\N	8989
9707	GENERIC_DAY	0	2	2010-01-21	2929	\N	8989
9708	GENERIC_DAY	0	3	2010-02-28	7980	\N	8989
9709	GENERIC_DAY	0	0	2010-05-01	2121	\N	8989
9710	GENERIC_DAY	0	2	2010-01-25	7981	\N	8989
9711	GENERIC_DAY	0	2	2009-12-14	7979	\N	8989
9712	GENERIC_DAY	0	3	2009-11-18	7980	\N	8989
9713	GENERIC_DAY	0	2	2010-02-28	7979	\N	8989
9714	GENERIC_DAY	0	2	2010-03-29	7981	\N	8989
9715	GENERIC_DAY	0	0	2010-05-23	7981	\N	8989
9716	GENERIC_DAY	0	2	2010-05-10	304	\N	8989
9717	GENERIC_DAY	0	2	2010-06-22	2929	\N	8989
9718	GENERIC_DAY	0	0	2010-05-01	2929	\N	8989
9719	GENERIC_DAY	0	3	2010-01-27	7980	\N	8989
9720	GENERIC_DAY	0	0	2009-12-12	7981	\N	8989
9721	GENERIC_DAY	0	2	2010-01-13	7980	\N	8989
9722	GENERIC_DAY	0	0	2010-01-08	2121	\N	8989
9723	GENERIC_DAY	0	2	2010-03-19	7980	\N	8989
9724	GENERIC_DAY	0	0	2010-04-29	2121	\N	8989
9725	GENERIC_DAY	0	3	2010-05-29	7980	\N	8989
9726	GENERIC_DAY	0	2	2010-04-27	304	\N	8989
9727	GENERIC_DAY	0	3	2010-05-29	304	\N	8989
9728	GENERIC_DAY	0	0	2010-02-24	306	\N	8989
9729	GENERIC_DAY	0	0	2009-11-18	306	\N	8989
9730	GENERIC_DAY	0	0	2009-10-28	2121	\N	8989
9731	GENERIC_DAY	0	0	2010-04-12	306	\N	8989
9732	GENERIC_DAY	0	0	2010-01-13	304	\N	8989
9733	GENERIC_DAY	0	0	2010-05-12	2121	\N	8989
9734	GENERIC_DAY	0	2	2010-04-24	7979	\N	8989
9735	GENERIC_DAY	0	2	2010-06-23	7980	\N	8989
9736	GENERIC_DAY	0	0	2010-01-17	7981	\N	8989
9737	GENERIC_DAY	0	2	2010-03-13	7979	\N	8989
9738	GENERIC_DAY	0	2	2010-03-01	7980	\N	8989
9739	GENERIC_DAY	0	0	2010-05-11	2121	\N	8989
9740	GENERIC_DAY	0	0	2009-10-31	2121	\N	8989
9741	GENERIC_DAY	0	0	2010-04-04	7981	\N	8989
9742	GENERIC_DAY	0	2	2009-12-28	7979	\N	8989
9743	GENERIC_DAY	0	2	2010-01-11	7980	\N	8989
9744	GENERIC_DAY	0	2	2009-12-24	2929	\N	8989
9745	GENERIC_DAY	0	3	2010-02-01	7981	\N	8989
9746	GENERIC_DAY	0	0	2009-12-11	304	\N	8989
9747	GENERIC_DAY	0	0	2010-06-25	306	\N	8989
9748	GENERIC_DAY	0	0	2010-06-11	2929	\N	8989
9749	GENERIC_DAY	0	2	2010-03-23	304	\N	8989
9750	GENERIC_DAY	0	0	2010-05-08	306	\N	8989
9751	GENERIC_DAY	0	2	2010-01-27	7979	\N	8989
9752	GENERIC_DAY	0	0	2010-02-06	2121	\N	8989
9753	GENERIC_DAY	0	0	2010-05-30	306	\N	8989
9754	GENERIC_DAY	0	0	2010-03-05	2121	\N	8989
9755	GENERIC_DAY	0	3	2010-05-15	304	\N	8989
9756	GENERIC_DAY	0	3	2009-11-12	7981	\N	8989
9757	GENERIC_DAY	0	0	2010-05-24	2121	\N	8989
9758	GENERIC_DAY	0	3	2010-02-20	304	\N	8989
9759	GENERIC_DAY	0	2	2009-12-22	7980	\N	8989
9760	GENERIC_DAY	0	0	2010-05-23	306	\N	8989
9761	GENERIC_DAY	0	2	2010-05-01	7979	\N	8989
9762	GENERIC_DAY	0	0	2010-05-04	2121	\N	8989
9763	GENERIC_DAY	0	2	2010-03-01	7979	\N	8989
9764	GENERIC_DAY	0	0	2010-04-25	306	\N	8989
9765	GENERIC_DAY	0	0	2010-05-18	306	\N	8989
9766	GENERIC_DAY	0	0	2009-11-14	304	\N	8989
9767	GENERIC_DAY	0	4	2009-11-28	7979	\N	8989
9768	GENERIC_DAY	0	0	2009-10-23	304	\N	8989
9769	GENERIC_DAY	0	4	2010-01-17	7980	\N	8989
9770	GENERIC_DAY	0	0	2010-01-10	2121	\N	8989
9771	GENERIC_DAY	0	2	2009-10-29	7979	\N	8989
9772	GENERIC_DAY	0	0	2010-04-28	2121	\N	8989
9773	GENERIC_DAY	0	2	2010-03-10	304	\N	8989
9774	GENERIC_DAY	0	4	2009-11-29	7979	\N	8989
9775	GENERIC_DAY	0	0	2010-03-10	2121	\N	8989
9776	GENERIC_DAY	0	0	2010-02-08	2929	\N	8989
9777	GENERIC_DAY	0	3	2010-06-13	7980	\N	8989
9778	GENERIC_DAY	0	0	2009-12-17	304	\N	8989
9779	GENERIC_DAY	0	2	2009-11-12	7979	\N	8989
9780	GENERIC_DAY	0	0	2010-05-29	2121	\N	8989
9781	GENERIC_DAY	0	0	2010-03-16	2121	\N	8989
9782	GENERIC_DAY	0	0	2010-05-16	306	\N	8989
9783	GENERIC_DAY	0	2	2010-01-04	2929	\N	8989
9784	GENERIC_DAY	0	2	2010-05-14	304	\N	8989
9785	GENERIC_DAY	0	0	2010-01-26	304	\N	8989
9786	GENERIC_DAY	0	3	2010-05-16	304	\N	8989
9787	GENERIC_DAY	0	2	2010-03-15	7980	\N	8989
9788	GENERIC_DAY	0	1	2010-06-22	7981	\N	8989
9789	GENERIC_DAY	0	0	2010-05-10	2929	\N	8989
9790	GENERIC_DAY	0	0	2010-01-14	2121	\N	8989
9791	GENERIC_DAY	0	0	2010-01-23	7981	\N	8989
9792	GENERIC_DAY	0	0	2009-12-08	304	\N	8989
9793	GENERIC_DAY	0	2	2010-02-18	7980	\N	8989
9794	GENERIC_DAY	0	0	2010-03-20	306	\N	8989
9795	GENERIC_DAY	0	0	2010-02-09	2929	\N	8989
9796	GENERIC_DAY	0	2	2010-06-10	7981	\N	8989
9797	GENERIC_DAY	0	2	2010-02-08	7979	\N	8989
9798	GENERIC_DAY	0	2	2010-02-24	7981	\N	8989
9799	GENERIC_DAY	0	3	2010-06-06	7980	\N	8989
9800	GENERIC_DAY	0	2	2010-06-08	7981	\N	8989
9801	GENERIC_DAY	0	1	2010-06-22	7979	\N	8989
9802	GENERIC_DAY	0	2	2010-03-20	7979	\N	8989
9803	GENERIC_DAY	0	2	2010-01-08	2929	\N	8989
9804	GENERIC_DAY	0	2	2010-03-26	7979	\N	8989
9805	GENERIC_DAY	0	2	2010-05-12	7980	\N	8989
9806	GENERIC_DAY	0	0	2009-12-07	2121	\N	8989
9807	GENERIC_DAY	0	0	2010-01-29	306	\N	8989
9808	GENERIC_DAY	0	0	2009-10-22	2929	\N	8989
9809	GENERIC_DAY	0	2	2010-01-20	7981	\N	8989
9810	GENERIC_DAY	0	0	2009-12-19	304	\N	8989
9811	GENERIC_DAY	0	0	2010-06-15	2929	\N	8989
9812	GENERIC_DAY	0	0	2009-11-17	2121	\N	8989
9813	GENERIC_DAY	0	0	2010-04-23	2121	\N	8989
9814	GENERIC_DAY	0	0	2009-10-20	2929	\N	8989
9815	GENERIC_DAY	0	3	2009-10-26	7980	\N	8989
9816	GENERIC_DAY	0	2	2009-12-30	7980	\N	8989
9817	GENERIC_DAY	0	2	2010-01-20	7979	\N	8989
9818	GENERIC_DAY	0	2	2010-06-16	7981	\N	8989
9819	GENERIC_DAY	0	2	2010-03-09	7981	\N	8989
9820	GENERIC_DAY	0	3	2010-02-27	7980	\N	8989
9821	GENERIC_DAY	0	0	2010-02-19	306	\N	8989
9822	GENERIC_DAY	0	0	2009-11-08	304	\N	8989
9823	GENERIC_DAY	0	3	2010-02-02	7981	\N	8989
9824	GENERIC_DAY	0	2	2010-01-14	2929	\N	8989
9825	GENERIC_DAY	0	2	2010-05-11	304	\N	8989
9826	GENERIC_DAY	0	2	2009-12-28	7980	\N	8989
9827	GENERIC_DAY	0	2	2010-05-12	7979	\N	8989
9828	GENERIC_DAY	0	0	2010-02-05	2929	\N	8989
9829	GENERIC_DAY	0	2	2010-06-09	7981	\N	8989
9830	GENERIC_DAY	0	0	2009-10-25	304	\N	8989
9831	GENERIC_DAY	0	2	2010-06-01	7981	\N	8989
9832	GENERIC_DAY	0	0	2010-01-14	306	\N	8989
9833	GENERIC_DAY	0	2	2010-01-13	2929	\N	8989
9834	GENERIC_DAY	0	0	2010-01-03	2929	\N	8989
9835	GENERIC_DAY	0	3	2009-12-15	7980	\N	8989
9836	GENERIC_DAY	0	0	2009-11-06	306	\N	8989
9837	GENERIC_DAY	0	0	2010-06-20	2121	\N	8989
9838	GENERIC_DAY	0	2	2010-05-10	7980	\N	8989
9839	GENERIC_DAY	0	0	2009-11-14	7981	\N	8989
9840	GENERIC_DAY	0	3	2010-02-02	7980	\N	8989
9841	GENERIC_DAY	0	3	2009-11-16	7981	\N	8989
9842	GENERIC_DAY	0	0	2010-01-12	2121	\N	8989
9843	GENERIC_DAY	0	0	2009-11-21	304	\N	8989
9844	GENERIC_DAY	0	2	2010-04-19	7980	\N	8989
9845	GENERIC_DAY	0	0	2009-10-20	304	\N	8989
9846	GENERIC_DAY	0	2	2010-04-14	7980	\N	8989
9847	GENERIC_DAY	0	0	2010-01-15	306	\N	8989
9848	GENERIC_DAY	0	0	2009-11-08	7981	\N	8989
9849	GENERIC_DAY	0	0	2010-01-19	306	\N	8989
9850	GENERIC_DAY	0	0	2009-11-01	306	\N	8989
9851	GENERIC_DAY	0	0	2009-11-16	306	\N	8989
9852	GENERIC_DAY	0	2	2010-06-25	2929	\N	8989
9853	GENERIC_DAY	0	0	2010-03-08	306	\N	8989
9854	GENERIC_DAY	0	3	2009-11-20	7980	\N	8989
9855	GENERIC_DAY	0	3	2009-11-09	7981	\N	8989
9856	GENERIC_DAY	0	0	2010-05-03	306	\N	8989
9857	GENERIC_DAY	0	0	2010-02-21	2121	\N	8989
9858	GENERIC_DAY	0	2	2010-03-01	7981	\N	8989
9859	GENERIC_DAY	0	4	2010-01-24	7979	\N	8989
9860	GENERIC_DAY	0	0	2010-02-21	306	\N	8989
9861	GENERIC_DAY	0	0	2010-01-16	306	\N	8989
9862	GENERIC_DAY	0	0	2009-12-21	2121	\N	8989
9863	GENERIC_DAY	0	2	2010-03-24	7980	\N	8989
9864	GENERIC_DAY	0	2	2010-04-02	7981	\N	8989
9865	GENERIC_DAY	0	2	2009-12-10	7979	\N	8989
9866	GENERIC_DAY	0	2	2010-01-08	7980	\N	8989
9867	GENERIC_DAY	0	2	2010-02-25	304	\N	8989
9868	GENERIC_DAY	0	0	2010-04-20	2929	\N	8989
9869	GENERIC_DAY	0	0	2010-05-17	306	\N	8989
9870	GENERIC_DAY	0	2	2010-04-04	7979	\N	8989
9871	GENERIC_DAY	0	0	2010-05-27	2121	\N	8989
9872	GENERIC_DAY	0	2	2010-02-05	7979	\N	8989
9873	GENERIC_DAY	0	0	2010-02-11	2929	\N	8989
9874	GENERIC_DAY	0	0	2009-12-09	304	\N	8989
9875	GENERIC_DAY	0	2	2010-03-03	7981	\N	8989
9876	GENERIC_DAY	0	2	2010-03-24	304	\N	8989
9877	GENERIC_DAY	0	2	2010-06-15	7979	\N	8989
9878	GENERIC_DAY	0	0	2009-11-20	306	\N	8989
9879	GENERIC_DAY	0	0	2009-11-24	306	\N	8989
9880	GENERIC_DAY	0	2	2010-05-25	7981	\N	8989
9881	GENERIC_DAY	0	3	2010-03-27	304	\N	8989
9882	GENERIC_DAY	0	2	2010-01-19	2929	\N	8989
9883	GENERIC_DAY	0	3	2009-11-27	7980	\N	8989
9884	GENERIC_DAY	0	0	2009-11-26	304	\N	8989
9885	GENERIC_DAY	0	2	2010-03-18	7979	\N	8989
9886	GENERIC_DAY	0	0	2010-06-04	2121	\N	8989
9887	GENERIC_DAY	0	0	2010-01-11	304	\N	8989
9888	GENERIC_DAY	0	3	2009-10-21	7981	\N	8989
9889	GENERIC_DAY	0	0	2010-04-30	2121	\N	8989
9890	GENERIC_DAY	0	0	2009-10-31	7981	\N	8989
9891	GENERIC_DAY	0	0	2009-12-03	2121	\N	8989
9892	GENERIC_DAY	0	2	2010-01-01	2929	\N	8989
9893	GENERIC_DAY	0	0	2009-11-26	306	\N	8989
9894	GENERIC_DAY	0	0	2010-02-15	2929	\N	8989
9895	GENERIC_DAY	0	0	2010-03-19	2121	\N	8989
9896	GENERIC_DAY	0	3	2009-11-23	7981	\N	8989
9897	GENERIC_DAY	0	2	2010-04-06	7979	\N	8989
9898	GENERIC_DAY	0	0	2010-06-18	2121	\N	8989
9899	GENERIC_DAY	0	3	2009-10-21	7980	\N	8989
9900	GENERIC_DAY	0	0	2010-04-06	306	\N	8989
9901	GENERIC_DAY	0	0	2009-12-20	2121	\N	8989
9902	GENERIC_DAY	0	3	2010-02-04	7981	\N	8989
9903	GENERIC_DAY	0	3	2009-11-06	7981	\N	8989
9904	GENERIC_DAY	0	3	2010-02-27	304	\N	8989
9905	GENERIC_DAY	0	3	2009-11-06	7980	\N	8989
9906	GENERIC_DAY	0	3	2010-01-27	7981	\N	8989
9907	GENERIC_DAY	0	0	2010-03-03	306	\N	8989
9908	GENERIC_DAY	0	2	2010-01-25	2929	\N	8989
9909	GENERIC_DAY	0	0	2010-03-10	2929	\N	8989
9910	GENERIC_DAY	0	0	2009-11-25	306	\N	8989
9911	GENERIC_DAY	0	2	2010-02-16	7979	\N	8989
9912	GENERIC_DAY	0	2	2010-06-23	7981	\N	8989
9913	GENERIC_DAY	0	0	2010-03-09	2121	\N	8989
9914	GENERIC_DAY	0	2	2010-01-05	2929	\N	8989
9915	GENERIC_DAY	0	0	2010-05-15	2929	\N	8989
9916	GENERIC_DAY	0	0	2009-11-01	2121	\N	8989
9917	GENERIC_DAY	0	2	2010-06-10	304	\N	8989
9918	GENERIC_DAY	0	0	2010-01-26	306	\N	8989
9919	GENERIC_DAY	0	0	2010-05-02	2121	\N	8989
9920	GENERIC_DAY	0	3	2010-05-23	304	\N	8989
9921	GENERIC_DAY	0	0	2010-05-01	7981	\N	8989
9922	GENERIC_DAY	0	2	2009-12-21	2929	\N	8989
9923	GENERIC_DAY	0	2	2010-05-06	7979	\N	8989
9924	GENERIC_DAY	0	2	2010-01-07	2929	\N	8989
9925	GENERIC_DAY	0	2	2010-06-25	7979	\N	8989
9926	GENERIC_DAY	0	0	2009-12-02	306	\N	8989
9927	GENERIC_DAY	0	0	2009-12-02	2121	\N	8989
9928	GENERIC_DAY	0	0	2010-06-06	2121	\N	8989
9929	GENERIC_DAY	0	2	2010-04-05	304	\N	8989
9930	GENERIC_DAY	0	2	2010-05-14	7979	\N	8989
9931	GENERIC_DAY	0	0	2010-05-23	2121	\N	8989
9932	GENERIC_DAY	0	0	2010-06-01	2929	\N	8989
9933	GENERIC_DAY	0	2	2010-01-01	7979	\N	8989
9934	GENERIC_DAY	0	0	2010-03-23	2121	\N	8989
9935	GENERIC_DAY	0	0	2010-04-30	2929	\N	8989
9936	GENERIC_DAY	0	0	2010-02-15	2121	\N	8989
9937	GENERIC_DAY	0	0	2010-04-03	7981	\N	8989
9938	GENERIC_DAY	0	0	2009-10-25	306	\N	8989
9939	GENERIC_DAY	0	0	2010-04-20	2121	\N	8989
9940	GENERIC_DAY	0	2	2010-03-26	7981	\N	8989
9941	GENERIC_DAY	0	2	2010-03-10	7979	\N	8989
9942	GENERIC_DAY	0	0	2009-10-25	2929	\N	8989
9943	GENERIC_DAY	0	2	2010-05-03	7980	\N	8989
9944	GENERIC_DAY	0	0	2009-10-26	2929	\N	8989
9945	GENERIC_DAY	0	3	2009-11-11	7981	\N	8989
9946	GENERIC_DAY	0	3	2009-12-16	7981	\N	8989
9947	GENERIC_DAY	0	0	2010-05-02	2929	\N	8989
9948	GENERIC_DAY	0	2	2010-06-18	7980	\N	8989
9949	GENERIC_DAY	0	0	2010-06-06	2929	\N	8989
9950	GENERIC_DAY	0	0	2009-11-12	306	\N	8989
9951	GENERIC_DAY	0	3	2009-11-25	7981	\N	8989
9952	GENERIC_DAY	0	0	2010-03-07	2121	\N	8989
9953	GENERIC_DAY	0	0	2010-04-07	2929	\N	8989
9954	GENERIC_DAY	0	2	2009-12-11	7979	\N	8989
9955	GENERIC_DAY	0	0	2010-05-11	2929	\N	8989
9956	GENERIC_DAY	0	0	2010-02-23	2121	\N	8989
9957	GENERIC_DAY	0	3	2009-11-30	7981	\N	8989
9958	GENERIC_DAY	0	3	2009-12-02	7981	\N	8989
9959	GENERIC_DAY	0	3	2009-10-19	7981	\N	8989
9960	GENERIC_DAY	0	2	2009-11-11	7979	\N	8989
9961	GENERIC_DAY	0	2	2010-02-11	7979	\N	8989
9962	GENERIC_DAY	0	3	2009-10-28	7981	\N	8989
9963	GENERIC_DAY	0	0	2010-05-28	2121	\N	8989
9964	GENERIC_DAY	0	0	2010-01-30	304	\N	8989
9965	GENERIC_DAY	0	2	2009-12-01	7979	\N	8989
9966	GENERIC_DAY	0	0	2010-03-14	7981	\N	8989
9967	GENERIC_DAY	0	4	2010-02-06	7980	\N	8989
9968	GENERIC_DAY	0	2	2010-05-25	304	\N	8989
9969	GENERIC_DAY	0	0	2010-01-19	2121	\N	8989
9970	GENERIC_DAY	0	0	2010-02-06	306	\N	8989
9971	GENERIC_DAY	0	0	2009-11-15	2929	\N	8989
9972	GENERIC_DAY	0	0	2009-10-25	2121	\N	8989
9973	GENERIC_DAY	0	2	2010-03-07	7979	\N	8989
9974	GENERIC_DAY	0	0	2010-03-03	2929	\N	8989
9975	GENERIC_DAY	0	2	2010-05-05	7980	\N	8989
9976	GENERIC_DAY	0	3	2010-03-28	304	\N	8989
9977	GENERIC_DAY	0	0	2010-04-08	306	\N	8989
9978	GENERIC_DAY	0	0	2010-01-18	306	\N	8989
9979	GENERIC_DAY	0	0	2010-05-11	306	\N	8989
9980	GENERIC_DAY	0	3	2010-03-21	7980	\N	8989
9981	GENERIC_DAY	0	0	2010-03-24	306	\N	8989
9982	GENERIC_DAY	0	0	2009-11-23	2929	\N	8989
9983	GENERIC_DAY	0	3	2010-05-09	304	\N	8989
9984	GENERIC_DAY	0	2	2009-12-15	7979	\N	8989
9985	GENERIC_DAY	0	2	2010-03-16	7979	\N	8989
9986	GENERIC_DAY	0	2	2010-03-03	7979	\N	8989
9987	GENERIC_DAY	0	0	2010-02-12	2121	\N	8989
9988	GENERIC_DAY	0	0	2010-05-19	2929	\N	8989
9989	GENERIC_DAY	0	0	2010-02-10	2929	\N	8989
9990	GENERIC_DAY	0	3	2010-03-07	304	\N	8989
9991	GENERIC_DAY	0	2	2010-03-15	7981	\N	8989
9992	GENERIC_DAY	0	2	2010-06-11	304	\N	8989
9993	GENERIC_DAY	0	0	2009-11-28	2929	\N	8989
9994	GENERIC_DAY	0	2	2009-11-06	7979	\N	8989
9995	GENERIC_DAY	0	2	2010-02-24	304	\N	8989
9996	GENERIC_DAY	0	4	2009-11-01	7979	\N	8989
9997	GENERIC_DAY	0	2	2010-06-19	7979	\N	8989
9998	GENERIC_DAY	0	0	2010-01-27	306	\N	8989
9999	GENERIC_DAY	0	3	2009-11-05	7980	\N	8989
10000	GENERIC_DAY	0	0	2010-02-13	2929	\N	8989
10001	GENERIC_DAY	0	2	2010-05-19	7980	\N	8989
10002	GENERIC_DAY	0	0	2009-11-15	7981	\N	8989
10003	GENERIC_DAY	0	0	2009-10-29	2929	\N	8989
10004	GENERIC_DAY	0	0	2009-11-03	306	\N	8989
10005	GENERIC_DAY	0	3	2009-12-11	7980	\N	8989
10006	GENERIC_DAY	0	2	2010-05-28	304	\N	8989
10007	GENERIC_DAY	0	2	2010-03-14	7979	\N	8989
10008	GENERIC_DAY	0	0	2010-01-24	2929	\N	8989
10009	GENERIC_DAY	0	0	2010-01-09	2121	\N	8989
10010	GENERIC_DAY	0	0	2009-10-31	2929	\N	8989
10011	GENERIC_DAY	0	2	2010-04-15	7979	\N	8989
10012	GENERIC_DAY	0	0	2010-06-10	306	\N	8989
10013	GENERIC_DAY	0	2	2010-05-21	7980	\N	8989
10014	GENERIC_DAY	0	3	2009-11-12	7980	\N	8989
10015	GENERIC_DAY	0	2	2009-10-21	7979	\N	8989
10016	GENERIC_DAY	0	3	2010-05-08	7980	\N	8989
10017	GENERIC_DAY	0	2	2009-11-10	7979	\N	8989
10018	GENERIC_DAY	0	3	2010-02-10	7980	\N	8989
10019	GENERIC_DAY	0	0	2010-03-14	306	\N	8989
10020	GENERIC_DAY	0	3	2010-06-05	7980	\N	8989
10021	GENERIC_DAY	0	2	2010-05-24	7979	\N	8989
10022	GENERIC_DAY	0	2	2010-05-25	7979	\N	8989
10023	GENERIC_DAY	0	0	2010-06-03	2929	\N	8989
10024	GENERIC_DAY	0	0	2009-12-09	306	\N	8989
10025	GENERIC_DAY	0	0	2010-06-18	306	\N	8989
10026	GENERIC_DAY	0	2	2010-04-27	7979	\N	8989
10027	GENERIC_DAY	0	0	2010-03-13	7981	\N	8989
10028	GENERIC_DAY	0	2	2010-05-30	7979	\N	8989
10029	GENERIC_DAY	0	0	2010-02-19	2929	\N	8989
10030	GENERIC_DAY	0	0	2010-03-07	2929	\N	8989
10031	GENERIC_DAY	0	0	2010-01-03	7981	\N	8989
10032	GENERIC_DAY	0	3	2010-04-24	7980	\N	8989
10033	GENERIC_DAY	0	2	2010-04-07	7979	\N	8989
10034	GENERIC_DAY	0	0	2010-03-27	2121	\N	8989
10035	GENERIC_DAY	0	2	2010-02-26	7981	\N	8989
10036	GENERIC_DAY	0	0	2010-04-11	2121	\N	8989
10037	GENERIC_DAY	0	2	2010-06-08	7980	\N	8989
10038	GENERIC_DAY	0	4	2009-10-24	7980	\N	8989
10039	GENERIC_DAY	0	0	2009-12-04	306	\N	8989
10040	GENERIC_DAY	0	0	2010-03-31	306	\N	8989
10041	GENERIC_DAY	0	0	2010-03-12	2929	\N	8989
10042	GENERIC_DAY	0	0	2009-11-24	2929	\N	8989
10043	GENERIC_DAY	0	0	2009-10-29	306	\N	8989
10044	GENERIC_DAY	0	2	2010-01-01	7981	\N	8989
10045	GENERIC_DAY	0	0	2010-02-02	2929	\N	8989
10046	GENERIC_DAY	0	0	2010-02-02	306	\N	8989
10047	GENERIC_DAY	0	2	2010-02-23	7981	\N	8989
10048	GENERIC_DAY	0	2	2010-03-16	7981	\N	8989
10049	GENERIC_DAY	0	3	2010-04-03	304	\N	8989
10050	GENERIC_DAY	0	0	2009-11-10	2929	\N	8989
10051	GENERIC_DAY	0	2	2009-11-24	7979	\N	8989
10052	GENERIC_DAY	0	2	2010-01-11	7981	\N	8989
10053	GENERIC_DAY	0	0	2009-10-21	2121	\N	8989
10054	GENERIC_DAY	0	2	2010-04-02	304	\N	8989
10055	GENERIC_DAY	0	0	2009-11-26	2929	\N	8989
10056	GENERIC_DAY	0	2	2010-04-21	7980	\N	8989
10057	GENERIC_DAY	0	2	2010-05-04	304	\N	8989
10058	GENERIC_DAY	0	0	2010-01-28	306	\N	8989
10059	GENERIC_DAY	0	0	2009-12-19	7981	\N	8989
10060	GENERIC_DAY	0	0	2010-03-12	2121	\N	8989
10061	GENERIC_DAY	0	0	2010-03-18	2121	\N	8989
10062	GENERIC_DAY	0	3	2010-02-11	7980	\N	8989
10063	GENERIC_DAY	0	0	2010-01-22	2121	\N	8989
10064	GENERIC_DAY	0	0	2010-02-09	304	\N	8989
10065	GENERIC_DAY	0	2	2010-05-05	304	\N	8989
10066	GENERIC_DAY	0	4	2009-12-12	7980	\N	8989
10067	GENERIC_DAY	0	0	2010-04-27	2121	\N	8989
10068	GENERIC_DAY	0	0	2010-06-16	306	\N	8989
10069	GENERIC_DAY	0	2	2009-12-21	7981	\N	8989
10070	GENERIC_DAY	0	3	2010-04-17	7980	\N	8989
10071	GENERIC_DAY	0	0	2010-04-22	306	\N	8989
10072	GENERIC_DAY	0	2	2010-01-14	7979	\N	8989
10073	GENERIC_DAY	0	2	2010-01-04	7979	\N	8989
10074	GENERIC_DAY	0	0	2010-06-15	306	\N	8989
10075	GENERIC_DAY	0	2	2010-01-12	7980	\N	8989
10076	GENERIC_DAY	0	0	2010-01-03	306	\N	8989
10077	GENERIC_DAY	0	0	2010-05-07	2121	\N	8989
10078	GENERIC_DAY	0	0	2009-11-23	306	\N	8989
10079	GENERIC_DAY	0	2	2010-02-22	7979	\N	8989
10080	GENERIC_DAY	0	0	2010-01-27	2929	\N	8989
10081	GENERIC_DAY	0	0	2010-03-06	2929	\N	8989
10082	GENERIC_DAY	0	2	2010-01-19	7979	\N	8989
10083	GENERIC_DAY	0	0	2009-11-05	2121	\N	8989
10084	GENERIC_DAY	0	3	2010-03-14	7980	\N	8989
10085	GENERIC_DAY	0	2	2010-06-01	7980	\N	8989
10086	GENERIC_DAY	0	0	2010-01-26	2929	\N	8989
10087	GENERIC_DAY	0	2	2010-04-19	7981	\N	8989
10088	GENERIC_DAY	0	2	2010-05-25	7980	\N	8989
10089	GENERIC_DAY	0	0	2010-02-27	306	\N	8989
10090	GENERIC_DAY	0	0	2010-04-13	2121	\N	8989
10091	GENERIC_DAY	0	0	2010-02-28	7981	\N	8989
10092	GENERIC_DAY	0	0	2009-11-15	306	\N	8989
10093	GENERIC_DAY	0	2	2010-01-08	7981	\N	8989
10094	GENERIC_DAY	0	2	2010-01-07	7981	\N	8989
10095	GENERIC_DAY	0	2	2010-03-11	7980	\N	8989
10096	GENERIC_DAY	0	2	2010-04-05	7981	\N	8989
10097	GENERIC_DAY	0	0	2009-11-16	2929	\N	8989
10098	GENERIC_DAY	0	0	2010-05-07	2929	\N	8989
10099	GENERIC_DAY	0	4	2009-12-20	7979	\N	8989
10100	GENERIC_DAY	0	0	2010-03-17	306	\N	8989
10101	GENERIC_DAY	0	0	2009-11-12	2929	\N	8989
10102	GENERIC_DAY	0	0	2010-06-13	2121	\N	8989
10103	GENERIC_DAY	0	0	2009-12-20	2929	\N	8989
10104	GENERIC_DAY	0	0	2010-03-27	2929	\N	8989
10105	GENERIC_DAY	0	2	2010-01-01	7980	\N	8989
10106	GENERIC_DAY	0	2	2010-05-15	7979	\N	8989
10107	GENERIC_DAY	0	0	2009-10-23	306	\N	8989
10108	GENERIC_DAY	0	3	2009-11-24	7980	\N	8989
10109	GENERIC_DAY	0	0	2010-03-24	2929	\N	8989
10110	GENERIC_DAY	0	0	2010-04-17	7981	\N	8989
10111	GENERIC_DAY	0	2	2010-06-21	304	\N	8989
10112	GENERIC_DAY	0	4	2009-11-21	7979	\N	8989
10113	GENERIC_DAY	0	0	2010-04-18	306	\N	8989
10114	GENERIC_DAY	0	0	2009-11-27	2929	\N	8989
10115	GENERIC_DAY	0	0	2010-06-04	306	\N	8989
10116	GENERIC_DAY	0	0	2009-11-19	306	\N	8989
10117	GENERIC_DAY	0	2	2010-06-17	7981	\N	8989
10118	GENERIC_DAY	0	2	2010-01-07	7980	\N	8989
10119	GENERIC_DAY	0	0	2010-02-28	306	\N	8989
10120	GENERIC_DAY	0	2	2010-04-22	7979	\N	8989
10121	GENERIC_DAY	0	2	2009-12-29	7979	\N	8989
10122	GENERIC_DAY	0	0	2010-03-04	2929	\N	8989
10123	GENERIC_DAY	0	2	2010-05-29	7979	\N	8989
10124	GENERIC_DAY	0	3	2010-06-12	7980	\N	8989
10125	GENERIC_DAY	0	0	2010-01-16	2121	\N	8989
10126	GENERIC_DAY	0	2	2010-03-12	7979	\N	8989
10127	GENERIC_DAY	0	0	2010-02-26	306	\N	8989
10128	GENERIC_DAY	0	2	2010-02-18	7981	\N	8989
10129	GENERIC_DAY	0	2	2010-06-10	7979	\N	8989
10130	GENERIC_DAY	0	0	2009-12-23	2121	\N	8989
10131	GENERIC_DAY	0	0	2010-04-03	2929	\N	8989
10132	GENERIC_DAY	0	0	2009-12-05	306	\N	8989
10133	GENERIC_DAY	0	2	2010-03-22	7981	\N	8989
10134	GENERIC_DAY	0	0	2010-03-24	2121	\N	8989
10135	GENERIC_DAY	0	0	2010-01-12	304	\N	8989
10136	GENERIC_DAY	0	3	2010-05-15	7980	\N	8989
10137	GENERIC_DAY	0	0	2010-06-08	2929	\N	8989
10138	GENERIC_DAY	0	0	2010-06-24	304	\N	8989
10139	GENERIC_DAY	0	0	2010-06-11	306	\N	8989
10140	GENERIC_DAY	0	0	2010-03-16	2929	\N	8989
10141	GENERIC_DAY	0	0	2010-06-16	2929	\N	8989
10142	GENERIC_DAY	0	0	2010-06-02	306	\N	8989
10143	GENERIC_DAY	0	0	2010-04-12	2121	\N	8989
10144	GENERIC_DAY	0	0	2009-12-05	2121	\N	8989
10145	GENERIC_DAY	0	0	2010-06-05	7981	\N	8989
10146	GENERIC_DAY	0	3	2010-01-28	7980	\N	8989
10147	GENERIC_DAY	0	2	2010-04-26	7979	\N	8989
10148	GENERIC_DAY	0	0	2010-03-11	306	\N	8989
10149	GENERIC_DAY	0	0	2010-01-10	2929	\N	8989
10150	GENERIC_DAY	0	3	2009-11-17	7980	\N	8989
10151	GENERIC_DAY	0	0	2009-12-10	306	\N	8989
10152	GENERIC_DAY	0	3	2009-12-07	7981	\N	8989
10153	GENERIC_DAY	0	0	2009-11-27	2121	\N	8989
10154	GENERIC_DAY	0	0	2009-11-01	7981	\N	8989
10155	GENERIC_DAY	0	0	2010-01-15	304	\N	8989
10156	GENERIC_DAY	0	2	2010-03-29	304	\N	8989
10157	GENERIC_DAY	0	2	2010-04-28	7980	\N	8989
10158	GENERIC_DAY	0	2	2010-03-22	7980	\N	8989
10159	GENERIC_DAY	0	0	2010-06-19	7981	\N	8989
10160	GENERIC_DAY	0	4	2009-12-19	7980	\N	8989
10161	GENERIC_DAY	0	4	2009-11-22	7979	\N	8989
10162	GENERIC_DAY	0	3	2010-02-12	7980	\N	8989
10163	GENERIC_DAY	0	3	2010-03-07	7980	\N	8989
10164	GENERIC_DAY	0	0	2010-05-19	306	\N	8989
10165	GENERIC_DAY	0	0	2009-11-29	7981	\N	8989
10166	GENERIC_DAY	0	0	2009-12-26	304	\N	8989
10167	GENERIC_DAY	0	2	2010-05-09	7979	\N	8989
10168	GENERIC_DAY	0	2	2010-01-06	7981	\N	8989
10169	GENERIC_DAY	0	2	2010-02-27	7979	\N	8989
10170	GENERIC_DAY	0	0	2010-05-30	2929	\N	8989
10171	GENERIC_DAY	0	0	2010-02-02	304	\N	8989
10172	GENERIC_DAY	0	2	2010-04-23	7979	\N	8989
10173	GENERIC_DAY	0	0	2009-11-14	306	\N	8989
10174	GENERIC_DAY	0	0	2010-01-06	2121	\N	8989
10175	GENERIC_DAY	0	2	2009-12-16	7979	\N	8989
10176	GENERIC_DAY	0	2	2010-02-25	7980	\N	8989
10177	GENERIC_DAY	0	0	2010-02-27	2121	\N	8989
10178	GENERIC_DAY	0	0	2010-04-01	306	\N	8989
10179	GENERIC_DAY	0	0	2009-12-03	306	\N	8989
10180	GENERIC_DAY	0	2	2010-01-15	7979	\N	8989
10181	GENERIC_DAY	0	3	2009-11-09	7980	\N	8989
10182	GENERIC_DAY	0	2	2010-03-24	7979	\N	8989
10183	GENERIC_DAY	0	2	2010-01-15	2929	\N	8989
10184	GENERIC_DAY	0	2	2010-04-22	304	\N	8989
10185	GENERIC_DAY	0	0	2010-02-25	2121	\N	8989
10186	GENERIC_DAY	0	0	2010-02-26	2929	\N	8989
10187	GENERIC_DAY	0	3	2010-05-01	7980	\N	8989
10188	GENERIC_DAY	0	0	2010-04-12	2929	\N	8989
10189	GENERIC_DAY	0	2	2010-02-03	7979	\N	8989
10190	GENERIC_DAY	0	0	2010-01-13	2121	\N	8989
10191	GENERIC_DAY	0	4	2009-11-07	7980	\N	8989
10192	GENERIC_DAY	0	0	2010-06-21	2121	\N	8989
10193	GENERIC_DAY	0	0	2010-04-26	2929	\N	8989
10194	GENERIC_DAY	0	0	2010-02-07	304	\N	8989
10195	GENERIC_DAY	0	0	2010-01-30	2929	\N	8989
10196	GENERIC_DAY	0	3	2009-11-25	7980	\N	8989
10197	GENERIC_DAY	0	0	2010-05-26	2929	\N	8989
10198	GENERIC_DAY	0	0	2009-10-24	7981	\N	8989
10199	GENERIC_DAY	0	0	2010-01-30	306	\N	8989
10200	GENERIC_DAY	0	0	2010-04-17	306	\N	8989
10201	GENERIC_DAY	0	3	2009-11-26	7980	\N	8989
10202	GENERIC_DAY	0	2	2010-01-11	7979	\N	8989
10203	GENERIC_DAY	0	0	2009-11-10	2121	\N	8989
10204	GENERIC_DAY	0	2	2010-02-25	7979	\N	8989
10205	GENERIC_DAY	0	2	2010-04-30	7979	\N	8989
10206	GENERIC_DAY	0	0	2009-11-22	7981	\N	8989
10207	GENERIC_DAY	0	0	2009-11-05	306	\N	8989
10208	GENERIC_DAY	0	2	2010-01-18	7981	\N	8989
10209	GENERIC_DAY	0	3	2010-04-11	7980	\N	8989
10210	GENERIC_DAY	0	0	2010-02-17	2121	\N	8989
10211	GENERIC_DAY	0	3	2010-02-15	7980	\N	8989
10212	GENERIC_DAY	0	2	2009-12-23	2929	\N	8989
10213	GENERIC_DAY	0	3	2010-06-20	304	\N	8989
10214	GENERIC_DAY	0	2	2010-01-26	7979	\N	8989
10215	GENERIC_DAY	0	4	2010-02-07	7979	\N	8989
10216	GENERIC_DAY	0	4	2009-12-05	7980	\N	8989
10217	GENERIC_DAY	0	4	2010-02-06	7979	\N	8989
10218	GENERIC_DAY	0	0	2009-12-25	306	\N	8989
10219	GENERIC_DAY	0	2	2009-12-08	7979	\N	8989
10220	GENERIC_DAY	0	3	2010-03-06	304	\N	8989
10221	GENERIC_DAY	0	2	2010-03-25	7979	\N	8989
10222	GENERIC_DAY	0	2	2010-05-18	7981	\N	8989
10223	GENERIC_DAY	0	0	2009-12-27	2929	\N	8989
10224	GENERIC_DAY	0	2	2010-04-29	7979	\N	8989
10225	GENERIC_DAY	0	2	2010-06-15	7980	\N	8989
10226	GENERIC_DAY	0	2	2010-05-05	7979	\N	8989
10227	GENERIC_DAY	0	4	2009-11-15	7979	\N	8989
10228	GENERIC_DAY	0	0	2010-03-03	2121	\N	8989
10229	GENERIC_DAY	0	0	2010-03-17	2121	\N	8989
10230	GENERIC_DAY	0	2	2010-03-23	7980	\N	8989
10231	GENERIC_DAY	0	2	2010-02-04	7979	\N	8989
10232	GENERIC_DAY	0	0	2009-11-22	2121	\N	8989
10233	GENERIC_DAY	0	0	2010-03-27	7981	\N	8989
10234	GENERIC_DAY	0	2	2009-11-30	7979	\N	8989
10235	GENERIC_DAY	0	2	2010-06-02	304	\N	8989
10236	GENERIC_DAY	0	0	2010-02-03	306	\N	8989
10237	GENERIC_DAY	0	0	2010-03-08	2121	\N	8989
10238	GENERIC_DAY	0	0	2009-11-30	306	\N	8989
10239	GENERIC_DAY	0	2	2010-06-04	7981	\N	8989
10240	GENERIC_DAY	0	0	2010-02-11	306	\N	8989
10241	GENERIC_DAY	0	0	2009-12-02	2929	\N	8989
10242	GENERIC_DAY	0	0	2010-03-25	306	\N	8989
10243	GENERIC_DAY	0	0	2009-11-26	2121	\N	8989
10244	GENERIC_DAY	0	0	2010-02-28	2929	\N	8989
10245	GENERIC_DAY	0	0	2010-06-14	2121	\N	8989
10246	GENERIC_DAY	0	2	2010-01-20	7980	\N	8989
10247	GENERIC_DAY	0	0	2009-11-06	2929	\N	8989
10248	GENERIC_DAY	0	0	2009-12-07	306	\N	8989
10249	GENERIC_DAY	0	0	2010-02-23	306	\N	8989
10250	GENERIC_DAY	0	0	2010-04-18	7981	\N	8989
10251	GENERIC_DAY	0	0	2010-05-09	7981	\N	8989
10252	GENERIC_DAY	0	3	2010-02-12	7981	\N	8989
10253	GENERIC_DAY	0	2	2010-06-18	7979	\N	8989
10254	GENERIC_DAY	0	3	2009-10-22	7981	\N	8989
10255	GENERIC_DAY	0	2	2010-06-06	7979	\N	8989
10256	GENERIC_DAY	0	2	2010-01-12	2929	\N	8989
10257	GENERIC_DAY	0	2	2009-12-31	7979	\N	8989
10258	GENERIC_DAY	0	0	2009-10-27	304	\N	8989
10259	GENERIC_DAY	0	0	2009-12-16	304	\N	8989
10260	GENERIC_DAY	0	2	2010-04-29	7980	\N	8989
10261	GENERIC_DAY	0	3	2010-02-03	7980	\N	8989
10262	GENERIC_DAY	0	3	2010-02-09	7980	\N	8989
10263	GENERIC_DAY	0	0	2010-01-22	306	\N	8989
10264	GENERIC_DAY	0	0	2010-06-01	2121	\N	8989
10265	GENERIC_DAY	0	2	2010-05-23	7979	\N	8989
10266	GENERIC_DAY	0	4	2009-12-27	7979	\N	8989
10267	GENERIC_DAY	0	0	2010-05-25	2121	\N	8989
10268	GENERIC_DAY	0	2	2010-04-23	304	\N	8989
10269	GENERIC_DAY	0	3	2010-03-14	304	\N	8989
10270	GENERIC_DAY	0	2	2010-03-11	304	\N	8989
10271	GENERIC_DAY	0	3	2010-03-13	304	\N	8989
10272	GENERIC_DAY	0	0	2010-04-13	2929	\N	8989
10273	GENERIC_DAY	0	3	2010-02-05	7981	\N	8989
10274	GENERIC_DAY	0	0	2010-06-21	306	\N	8989
10275	GENERIC_DAY	0	0	2010-03-08	2929	\N	8989
10276	GENERIC_DAY	0	0	2009-12-12	2121	\N	8989
10277	GENERIC_DAY	0	0	2009-11-02	304	\N	8989
10278	GENERIC_DAY	0	0	2009-12-28	306	\N	8989
10279	GENERIC_DAY	0	0	2009-12-10	2929	\N	8989
10280	GENERIC_DAY	0	4	2009-10-31	7979	\N	8989
10281	GENERIC_DAY	0	0	2009-12-30	306	\N	8989
10282	GENERIC_DAY	0	3	2009-11-04	7980	\N	8989
10283	GENERIC_DAY	0	0	2010-04-29	2929	\N	8989
10284	GENERIC_DAY	0	0	2010-02-14	306	\N	8989
10285	GENERIC_DAY	0	0	2010-04-15	2121	\N	8989
10286	GENERIC_DAY	0	0	2009-11-20	304	\N	8989
10287	GENERIC_DAY	0	0	2010-04-07	2121	\N	8989
10288	GENERIC_DAY	0	0	2010-02-23	2929	\N	8989
10289	GENERIC_DAY	0	2	2010-03-16	7980	\N	8989
10290	GENERIC_DAY	0	2	2009-11-13	7979	\N	8989
10291	GENERIC_DAY	0	2	2010-03-05	7979	\N	8989
10292	GENERIC_DAY	0	0	2010-02-03	2929	\N	8989
10293	GENERIC_DAY	0	0	2010-05-14	2121	\N	8989
10294	GENERIC_DAY	0	2	2010-03-15	304	\N	8989
10295	GENERIC_DAY	0	0	2010-04-14	306	\N	8989
10296	GENERIC_DAY	0	0	2010-02-14	2929	\N	8989
10297	GENERIC_DAY	0	3	2009-11-18	7981	\N	8989
10298	GENERIC_DAY	0	2	2010-04-01	304	\N	8989
10299	GENERIC_DAY	0	0	2010-04-16	2121	\N	8989
10300	GENERIC_DAY	0	0	2010-04-17	2929	\N	8989
10301	GENERIC_DAY	0	0	2009-10-22	306	\N	8989
10302	GENERIC_DAY	0	0	2010-02-21	2929	\N	8989
10303	GENERIC_DAY	0	0	2010-01-17	304	\N	8989
10304	GENERIC_DAY	0	0	2010-01-01	306	\N	8989
10305	GENERIC_DAY	0	0	2009-12-01	2929	\N	8989
10306	GENERIC_DAY	0	2	2010-06-09	7979	\N	8989
10307	GENERIC_DAY	0	0	2009-11-06	2121	\N	8989
10308	GENERIC_DAY	0	2	2010-06-21	7980	\N	8989
10309	GENERIC_DAY	0	3	2009-11-20	7981	\N	8989
10310	GENERIC_DAY	0	0	2010-04-26	306	\N	8989
10311	GENERIC_DAY	0	0	2009-12-21	304	\N	8989
10312	GENERIC_DAY	0	0	2009-12-30	2121	\N	8989
10313	GENERIC_DAY	0	2	2010-06-12	7979	\N	8989
10314	GENERIC_DAY	0	0	2009-11-29	2121	\N	8989
10315	GENERIC_DAY	0	2	2009-10-22	7979	\N	8989
10316	GENERIC_DAY	0	2	2010-03-30	7980	\N	8989
10317	GENERIC_DAY	0	4	2009-12-06	7979	\N	8989
10318	GENERIC_DAY	0	0	2010-05-15	306	\N	8989
10319	GENERIC_DAY	0	2	2010-06-16	7979	\N	8989
10320	GENERIC_DAY	0	3	2009-11-10	7980	\N	8989
10321	GENERIC_DAY	0	3	2010-05-02	7980	\N	8989
10322	GENERIC_DAY	0	0	2009-12-14	306	\N	8989
10323	GENERIC_DAY	0	0	2009-12-09	2121	\N	8989
10324	GENERIC_DAY	0	2	2010-04-22	7980	\N	8989
10325	GENERIC_DAY	0	0	2009-11-17	306	\N	8989
10326	GENERIC_DAY	0	2	2010-01-05	7980	\N	8989
10327	GENERIC_DAY	0	2	2010-03-30	7981	\N	8989
10328	GENERIC_DAY	0	2	2010-01-20	2929	\N	8989
10329	GENERIC_DAY	0	2	2010-05-02	7979	\N	8989
10330	GENERIC_DAY	0	3	2010-04-10	304	\N	8989
10331	GENERIC_DAY	0	2	2009-12-28	7981	\N	8989
10332	GENERIC_DAY	0	3	2010-01-29	7981	\N	8989
10333	GENERIC_DAY	0	0	2009-11-11	304	\N	8989
10334	GENERIC_DAY	0	2	2010-03-25	304	\N	8989
10335	GENERIC_DAY	0	2	2010-03-17	304	\N	8989
10336	GENERIC_DAY	0	0	2010-05-09	2121	\N	8989
10337	GENERIC_DAY	0	2	2010-04-06	7980	\N	8989
10338	GENERIC_DAY	0	2	2009-10-28	7979	\N	8989
10339	GENERIC_DAY	0	0	2009-10-28	2929	\N	8989
10340	GENERIC_DAY	0	0	2009-11-02	306	\N	8989
10341	GENERIC_DAY	0	2	2010-06-14	304	\N	8989
10342	GENERIC_DAY	0	0	2010-03-04	2121	\N	8989
10343	GENERIC_DAY	0	2	2009-10-19	7979	\N	8989
10344	GENERIC_DAY	0	0	2010-03-30	306	\N	8989
10345	GENERIC_DAY	0	2	2010-04-07	304	\N	8989
10346	GENERIC_DAY	0	2	2010-03-02	7980	\N	8989
10347	GENERIC_DAY	0	0	2009-12-16	2121	\N	8989
10348	GENERIC_DAY	0	3	2010-05-30	304	\N	8989
10349	GENERIC_DAY	0	0	2010-04-08	2121	\N	8989
10350	GENERIC_DAY	0	0	2009-12-18	304	\N	8989
10351	GENERIC_DAY	0	0	2010-03-11	2121	\N	8989
10352	GENERIC_DAY	0	0	2010-04-21	2121	\N	8989
10353	GENERIC_DAY	0	0	2009-12-13	2121	\N	8989
10354	GENERIC_DAY	0	2	2009-12-17	7979	\N	8989
10355	GENERIC_DAY	0	0	2010-02-10	304	\N	8989
10356	GENERIC_DAY	0	0	2009-10-26	306	\N	8989
10357	GENERIC_DAY	0	4	2010-02-14	7980	\N	8989
10358	GENERIC_DAY	0	0	2010-06-13	2929	\N	8989
10359	GENERIC_DAY	0	0	2010-05-10	2121	\N	8989
10360	GENERIC_DAY	0	0	2010-05-28	306	\N	8989
10361	GENERIC_DAY	0	0	2009-11-16	304	\N	8989
10362	GENERIC_DAY	0	2	2010-04-08	7980	\N	8989
10363	GENERIC_DAY	0	0	2010-03-02	2929	\N	8989
10364	GENERIC_DAY	0	0	2009-11-13	2121	\N	8989
10365	GENERIC_DAY	0	2	2010-06-21	7979	\N	8989
10366	GENERIC_DAY	0	0	2010-05-17	2121	\N	8989
10367	GENERIC_DAY	0	3	2010-02-01	7980	\N	8989
10368	GENERIC_DAY	0	0	2009-11-04	2929	\N	8989
10369	GENERIC_DAY	0	2	2010-02-10	7979	\N	8989
10370	GENERIC_DAY	0	3	2010-04-17	304	\N	8989
10371	GENERIC_DAY	0	0	2010-06-11	2121	\N	8989
10372	GENERIC_DAY	0	0	2010-05-05	2929	\N	8989
10373	GENERIC_DAY	0	2	2010-02-26	7979	\N	8989
10374	GENERIC_DAY	0	2	2009-12-31	7981	\N	8989
10375	GENERIC_DAY	0	0	2009-12-26	7981	\N	8989
10376	GENERIC_DAY	0	0	2010-06-25	2121	\N	8989
10377	GENERIC_DAY	0	3	2009-10-27	7980	\N	8989
10378	GENERIC_DAY	0	0	2010-03-15	2929	\N	8989
10379	GENERIC_DAY	0	0	2010-04-09	2121	\N	8989
10380	GENERIC_DAY	0	2	2010-03-11	7979	\N	8989
10381	GENERIC_DAY	0	0	2009-12-09	2929	\N	8989
10382	GENERIC_DAY	0	0	2010-04-22	2121	\N	8989
10383	GENERIC_DAY	0	2	2010-04-28	304	\N	8989
10384	GENERIC_DAY	0	2	2010-01-21	7979	\N	8989
10385	GENERIC_DAY	0	0	2009-10-22	304	\N	8989
10386	GENERIC_DAY	0	0	2010-04-05	306	\N	8989
10387	GENERIC_DAY	0	2	2010-01-22	7979	\N	8989
10388	GENERIC_DAY	0	0	2010-06-12	7981	\N	8989
10389	GENERIC_DAY	0	2	2009-12-31	7980	\N	8989
10390	GENERIC_DAY	0	0	2010-05-18	2929	\N	8989
10391	GENERIC_DAY	0	0	2009-11-08	2929	\N	8989
10392	GENERIC_DAY	0	0	2010-03-15	2121	\N	8989
10393	GENERIC_DAY	0	2	2010-04-23	7981	\N	8989
10394	GENERIC_DAY	0	0	2010-05-04	306	\N	8989
10395	GENERIC_DAY	0	2	2010-02-09	7979	\N	8989
10396	GENERIC_DAY	0	2	2010-05-18	7979	\N	8989
10397	GENERIC_DAY	0	0	2010-05-31	2121	\N	8989
10398	GENERIC_DAY	0	0	2010-01-27	304	\N	8989
10399	GENERIC_DAY	0	2	2010-05-27	304	\N	8989
10400	GENERIC_DAY	0	0	2010-01-28	304	\N	8989
10401	GENERIC_DAY	0	0	2010-01-28	2121	\N	8989
10402	GENERIC_DAY	0	2	2010-06-02	7981	\N	8989
10403	GENERIC_DAY	0	3	2010-02-03	7981	\N	8989
10404	GENERIC_DAY	0	3	2010-01-29	7980	\N	8989
10405	GENERIC_DAY	0	3	2010-06-19	304	\N	8989
10406	GENERIC_DAY	0	0	2010-04-04	306	\N	8989
10407	GENERIC_DAY	0	0	2010-03-06	2121	\N	8989
10408	GENERIC_DAY	0	2	2010-06-07	304	\N	8989
10409	GENERIC_DAY	0	2	2010-04-10	7979	\N	8989
10410	GENERIC_DAY	0	0	2010-06-23	306	\N	8989
10411	GENERIC_DAY	0	0	2009-11-05	2929	\N	8989
10412	GENERIC_DAY	0	3	2009-11-11	7980	\N	8989
10413	GENERIC_DAY	0	4	2009-12-05	7979	\N	8989
10414	GENERIC_DAY	0	3	2009-11-02	7981	\N	8989
10415	GENERIC_DAY	0	0	2010-02-02	2121	\N	8989
10416	GENERIC_DAY	0	2	2010-03-24	7981	\N	8989
10417	GENERIC_DAY	0	2	2010-05-26	7979	\N	8989
10418	GENERIC_DAY	0	2	2010-03-12	7981	\N	8989
10419	GENERIC_DAY	0	0	2009-12-06	2929	\N	8989
10420	GENERIC_DAY	0	2	2010-06-05	7979	\N	8989
10421	GENERIC_DAY	0	2	2010-04-20	7981	\N	8989
10422	GENERIC_DAY	0	4	2010-01-10	7979	\N	8989
10423	GENERIC_DAY	0	3	2010-02-04	7980	\N	8989
10424	GENERIC_DAY	0	0	2010-02-04	304	\N	8989
10425	GENERIC_DAY	0	2	2010-01-21	7981	\N	8989
10426	GENERIC_DAY	0	0	2009-12-06	304	\N	8989
10427	GENERIC_DAY	0	2	2010-04-21	7981	\N	8989
10428	GENERIC_DAY	0	2	2009-11-25	7979	\N	8989
10429	GENERIC_DAY	0	0	2010-05-21	306	\N	8989
10430	GENERIC_DAY	0	2	2010-03-04	304	\N	8989
10431	GENERIC_DAY	0	0	2009-11-21	2121	\N	8989
10432	GENERIC_DAY	0	2	2010-03-11	7981	\N	8989
10433	GENERIC_DAY	0	0	2010-02-12	306	\N	8989
10434	GENERIC_DAY	0	0	2010-02-11	2121	\N	8989
10435	GENERIC_DAY	0	0	2010-04-05	2929	\N	8989
10436	GENERIC_DAY	0	0	2009-11-09	2929	\N	8989
10437	GENERIC_DAY	0	0	2009-11-01	304	\N	8989
10438	GENERIC_DAY	0	0	2010-06-19	2929	\N	8989
10439	GENERIC_DAY	0	2	2010-05-13	7981	\N	8989
10440	GENERIC_DAY	0	0	2010-05-31	2929	\N	8989
10441	GENERIC_DAY	0	2	2010-05-21	7981	\N	8989
10442	GENERIC_DAY	0	0	2009-12-31	2121	\N	8989
10443	GENERIC_DAY	0	3	2009-12-04	7981	\N	8989
10444	GENERIC_DAY	0	0	2010-01-09	7981	\N	8989
10445	GENERIC_DAY	0	0	2010-02-14	2121	\N	8989
10446	GENERIC_DAY	0	0	2009-11-12	2121	\N	8989
10447	GENERIC_DAY	0	0	2010-06-19	2121	\N	8989
10448	GENERIC_DAY	0	2	2010-05-24	304	\N	8989
10449	GENERIC_DAY	0	0	2010-02-14	304	\N	8989
10450	GENERIC_DAY	0	0	2010-01-14	304	\N	8989
10451	GENERIC_DAY	0	2	2010-03-29	7980	\N	8989
10452	GENERIC_DAY	0	2	2010-03-22	7979	\N	8989
10453	GENERIC_DAY	0	0	2010-05-26	306	\N	8989
10454	GENERIC_DAY	0	0	2010-01-17	306	\N	8989
10455	GENERIC_DAY	0	2	2009-11-19	7979	\N	8989
10456	GENERIC_DAY	0	0	2010-06-12	2929	\N	8989
10457	GENERIC_DAY	0	0	2009-12-28	304	\N	8989
10458	GENERIC_DAY	0	2	2010-04-22	7981	\N	8989
10459	GENERIC_DAY	0	2	2010-04-28	7979	\N	8989
10460	GENERIC_DAY	0	0	2009-11-29	306	\N	8989
10461	GENERIC_DAY	0	0	2010-02-03	304	\N	8989
10462	GENERIC_DAY	0	0	2010-01-25	306	\N	8989
10463	GENERIC_DAY	0	4	2010-01-31	7979	\N	8989
10464	GENERIC_DAY	0	0	2009-12-21	306	\N	8989
10465	GENERIC_DAY	0	0	2010-06-07	2929	\N	8989
10466	GENERIC_DAY	0	0	2010-03-13	2121	\N	8989
10467	GENERIC_DAY	0	4	2009-11-08	7979	\N	8989
10468	GENERIC_DAY	0	2	2010-04-29	304	\N	8989
10469	GENERIC_DAY	0	0	2010-01-29	2929	\N	8989
10470	GENERIC_DAY	0	2	2009-11-05	7979	\N	8989
10471	GENERIC_DAY	0	0	2010-04-01	2121	\N	8989
10472	GENERIC_DAY	0	3	2009-12-03	7980	\N	8989
10473	GENERIC_DAY	0	2	2010-02-23	7979	\N	8989
10474	GENERIC_DAY	0	0	2010-05-09	306	\N	8989
10475	GENERIC_DAY	0	2	2010-06-02	7980	\N	8989
10476	GENERIC_DAY	0	2	2010-03-31	7979	\N	8989
10477	GENERIC_DAY	0	2	2010-06-25	7981	\N	8989
10478	GENERIC_DAY	0	0	2010-04-22	2929	\N	8989
10479	GENERIC_DAY	0	0	2010-03-21	2121	\N	8989
10480	GENERIC_DAY	0	2	2010-01-06	7979	\N	8989
10481	GENERIC_DAY	0	3	2010-02-08	7981	\N	8989
10482	GENERIC_DAY	0	2	2010-05-17	7981	\N	8989
10483	GENERIC_DAY	0	4	2010-01-16	7979	\N	8989
10484	GENERIC_DAY	0	0	2009-10-31	306	\N	8989
10485	GENERIC_DAY	0	0	2009-12-04	2121	\N	8989
10486	GENERIC_DAY	0	0	2010-03-30	2929	\N	8989
10487	GENERIC_DAY	0	0	2009-10-23	2121	\N	8989
10488	GENERIC_DAY	0	0	2010-01-24	306	\N	8989
10489	GENERIC_DAY	0	0	2010-05-16	2121	\N	8989
10490	GENERIC_DAY	0	0	2010-03-26	2121	\N	8989
10491	GENERIC_DAY	0	0	2010-02-08	304	\N	8989
10492	GENERIC_DAY	0	2	2010-04-09	7979	\N	8989
10493	GENERIC_DAY	0	3	2010-04-25	7980	\N	8989
10494	GENERIC_DAY	0	0	2010-02-16	304	\N	8989
10495	GENERIC_DAY	0	0	2009-11-13	304	\N	8989
10496	GENERIC_DAY	0	2	2010-03-17	7981	\N	8989
10497	GENERIC_DAY	0	2	2010-04-12	304	\N	8989
10498	GENERIC_DAY	0	2	2009-11-26	7979	\N	8989
10499	GENERIC_DAY	0	0	2010-05-01	306	\N	8989
10500	GENERIC_DAY	0	2	2010-06-09	304	\N	8989
10501	GENERIC_DAY	0	0	2010-01-16	2929	\N	8989
10502	GENERIC_DAY	0	2	2010-03-05	304	\N	8989
10503	GENERIC_DAY	0	0	2010-04-20	306	\N	8989
10504	GENERIC_DAY	0	0	2010-01-21	2121	\N	8989
10505	GENERIC_DAY	0	0	2009-12-13	306	\N	8989
10506	GENERIC_DAY	0	4	2009-11-01	7980	\N	8989
10507	GENERIC_DAY	0	2	2010-03-15	7979	\N	8989
10508	GENERIC_DAY	0	2	2009-11-16	7979	\N	8989
10509	GENERIC_DAY	0	0	2009-11-21	2929	\N	8989
10510	GENERIC_DAY	0	2	2010-05-27	7979	\N	8989
10511	GENERIC_DAY	0	0	2010-02-22	2121	\N	8989
10512	GENERIC_DAY	0	0	2010-05-31	306	\N	8989
10513	GENERIC_DAY	0	2	2010-02-23	304	\N	8989
10514	GENERIC_DAY	0	0	2010-03-28	7981	\N	8989
10515	GENERIC_DAY	0	2	2009-10-26	7979	\N	8989
10516	GENERIC_DAY	0	2	2009-11-23	7979	\N	8989
10517	GENERIC_DAY	0	3	2009-11-30	7980	\N	8989
10518	GENERIC_DAY	0	2	2009-12-03	7979	\N	8989
10519	GENERIC_DAY	0	0	2009-10-29	2121	\N	8989
10520	GENERIC_DAY	0	0	2010-03-14	2929	\N	8989
10521	GENERIC_DAY	0	0	2009-12-10	2121	\N	8989
10522	GENERIC_DAY	0	2	2010-06-21	7981	\N	8989
10523	GENERIC_DAY	0	0	2010-01-06	304	\N	8989
10524	GENERIC_DAY	0	0	2009-12-26	2929	\N	8989
10525	GENERIC_DAY	0	2	2009-12-22	7981	\N	8989
10526	GENERIC_DAY	0	0	2009-12-31	306	\N	8989
10527	GENERIC_DAY	0	2	2009-10-20	7979	\N	8989
10528	GENERIC_DAY	0	2	2009-12-21	7979	\N	8989
10529	GENERIC_DAY	0	0	2010-02-13	304	\N	8989
10530	GENERIC_DAY	0	2	2010-03-31	7981	\N	8989
10531	GENERIC_DAY	0	0	2009-11-18	304	\N	8989
10532	GENERIC_DAY	0	0	2010-02-24	2929	\N	8989
10533	GENERIC_DAY	0	2	2010-01-29	7979	\N	8989
10534	GENERIC_DAY	0	0	2010-01-21	304	\N	8989
10535	GENERIC_DAY	0	2	2010-05-07	7979	\N	8989
10536	GENERIC_DAY	0	3	2009-11-23	7980	\N	8989
10537	GENERIC_DAY	0	0	2010-06-09	2121	\N	8989
10538	GENERIC_DAY	0	0	2010-03-28	2121	\N	8989
10539	GENERIC_DAY	0	2	2010-06-17	7980	\N	8989
10540	GENERIC_DAY	0	0	2010-04-23	2929	\N	8989
10541	GENERIC_DAY	0	0	2010-05-29	7981	\N	8989
10542	GENERIC_DAY	0	4	2009-12-13	7980	\N	8989
10543	GENERIC_DAY	0	0	2010-01-23	2929	\N	8989
10544	GENERIC_DAY	0	0	2010-03-09	306	\N	8989
10545	GENERIC_DAY	0	0	2010-04-21	2929	\N	8989
10546	GENERIC_DAY	0	2	2010-01-06	7980	\N	8989
10547	GENERIC_DAY	0	0	2010-06-10	2121	\N	8989
10548	GENERIC_DAY	0	0	2010-03-21	7981	\N	8989
10549	GENERIC_DAY	0	2	2010-03-25	7981	\N	8989
10550	GENERIC_DAY	0	0	2010-02-10	2121	\N	8989
10551	GENERIC_DAY	0	2	2010-05-16	7979	\N	8989
10552	GENERIC_DAY	0	3	2010-05-23	7980	\N	8989
10553	GENERIC_DAY	0	0	2010-03-30	2121	\N	8989
10554	GENERIC_DAY	0	4	2010-01-02	7980	\N	8989
10555	GENERIC_DAY	0	2	2010-05-11	7981	\N	8989
10556	GENERIC_DAY	0	0	2009-11-07	306	\N	8989
10557	GENERIC_DAY	0	0	2010-02-07	7981	\N	8989
10558	GENERIC_DAY	0	0	2009-10-26	304	\N	8989
10559	GENERIC_DAY	0	0	2010-03-06	306	\N	8989
10560	GENERIC_DAY	0	2	2010-03-31	7980	\N	8989
10561	GENERIC_DAY	0	0	2010-01-05	306	\N	8989
10562	GENERIC_DAY	0	0	2010-01-07	306	\N	8989
10563	GENERIC_DAY	0	2	2010-03-02	7981	\N	8989
10564	GENERIC_DAY	0	3	2010-03-13	7980	\N	8989
10565	GENERIC_DAY	0	0	2009-10-19	306	\N	8989
10566	GENERIC_DAY	0	0	2010-02-13	306	\N	8989
10567	GENERIC_DAY	0	0	2010-06-05	2121	\N	8989
10568	GENERIC_DAY	0	0	2010-01-04	2121	\N	8989
10569	GENERIC_DAY	0	2	2010-02-22	304	\N	8989
10570	GENERIC_DAY	0	0	2009-12-15	304	\N	8989
10571	GENERIC_DAY	0	4	2009-11-22	7980	\N	8989
10572	GENERIC_DAY	0	0	2010-02-01	2121	\N	8989
10573	GENERIC_DAY	0	2	2010-02-22	7981	\N	8989
10574	GENERIC_DAY	0	2	2010-03-12	7980	\N	8989
10575	GENERIC_DAY	0	0	2010-04-15	306	\N	8989
10576	GENERIC_DAY	0	0	2009-11-11	306	\N	8989
10577	GENERIC_DAY	0	0	2010-01-04	306	\N	8989
10578	GENERIC_DAY	0	0	2010-01-31	306	\N	8989
10579	GENERIC_DAY	0	0	2009-10-21	2929	\N	8989
10580	GENERIC_DAY	0	0	2010-04-28	2929	\N	8989
10581	GENERIC_DAY	0	0	2010-04-01	2929	\N	8989
10582	GENERIC_DAY	0	0	2010-03-18	306	\N	8989
10583	GENERIC_DAY	0	0	2010-05-26	2121	\N	8989
10584	GENERIC_DAY	0	0	2009-11-18	2121	\N	8989
10585	GENERIC_DAY	0	2	2010-04-30	7981	\N	8989
10586	GENERIC_DAY	0	2	2010-02-20	7979	\N	8989
10587	GENERIC_DAY	0	0	2010-03-13	2929	\N	8989
10588	GENERIC_DAY	0	2	2010-03-18	7980	\N	8989
10589	GENERIC_DAY	0	2	2010-03-23	7981	\N	8989
10590	GENERIC_DAY	0	3	2010-02-08	7980	\N	8989
10591	GENERIC_DAY	0	2	2009-12-17	7981	\N	8989
10592	GENERIC_DAY	0	0	2010-01-09	304	\N	8989
10593	GENERIC_DAY	0	0	2009-11-28	304	\N	8989
10594	GENERIC_DAY	0	0	2010-03-02	306	\N	8989
10595	GENERIC_DAY	0	0	2010-03-21	306	\N	8989
10596	GENERIC_DAY	0	0	2009-10-24	304	\N	8989
10597	GENERIC_DAY	0	2	2010-04-30	304	\N	8989
10598	GENERIC_DAY	0	2	2010-04-27	7980	\N	8989
10599	GENERIC_DAY	0	2	2010-06-18	7981	\N	8989
10600	GENERIC_DAY	0	0	2009-10-19	304	\N	8989
10601	GENERIC_DAY	0	4	2009-12-27	7980	\N	8989
10602	GENERIC_DAY	0	0	2010-02-05	304	\N	8989
10603	GENERIC_DAY	0	0	2009-12-27	2121	\N	8989
10604	GENERIC_DAY	0	0	2010-01-17	2121	\N	8989
10605	GENERIC_DAY	0	3	2010-02-10	7981	\N	8989
10606	GENERIC_DAY	0	0	2009-11-06	304	\N	8989
10607	GENERIC_DAY	0	0	2010-02-15	304	\N	8989
10608	GENERIC_DAY	0	0	2010-05-10	306	\N	8989
10609	GENERIC_DAY	0	0	2010-02-06	304	\N	8989
10610	GENERIC_DAY	0	2	2010-06-11	7980	\N	8989
10611	GENERIC_DAY	0	0	2009-12-26	306	\N	8989
10612	GENERIC_DAY	0	2	2010-01-21	7980	\N	8989
10613	GENERIC_DAY	0	3	2010-03-20	304	\N	8989
10614	GENERIC_DAY	0	2	2009-12-30	7981	\N	8989
10615	GENERIC_DAY	0	2	2009-12-22	2929	\N	8989
10616	GENERIC_DAY	0	2	2009-11-02	7979	\N	8989
10617	GENERIC_DAY	0	0	2010-01-25	2121	\N	8989
10618	GENERIC_DAY	0	0	2009-12-30	304	\N	8989
10619	GENERIC_DAY	0	2	2010-05-28	7981	\N	8989
10620	GENERIC_DAY	0	2	2010-01-07	7979	\N	8989
10621	GENERIC_DAY	0	2	2010-03-01	304	\N	8989
10622	GENERIC_DAY	0	0	2010-05-06	2121	\N	8989
10623	GENERIC_DAY	0	2	2009-11-09	7979	\N	8989
10624	GENERIC_DAY	0	2	2010-02-26	7980	\N	8989
10625	GENERIC_DAY	0	0	2010-06-24	2121	\N	8989
10626	GENERIC_DAY	0	2	2010-05-31	7980	\N	8989
10627	GENERIC_DAY	0	0	2010-04-04	2121	\N	8989
10628	GENERIC_DAY	0	3	2009-11-19	7981	\N	8989
10629	GENERIC_DAY	0	2	2010-05-27	7980	\N	8989
10630	GENERIC_DAY	0	0	2010-01-16	7981	\N	8989
10631	GENERIC_DAY	0	0	2009-12-24	306	\N	8989
10632	GENERIC_DAY	0	2	2009-10-30	7979	\N	8989
10633	GENERIC_DAY	0	3	2009-12-10	7981	\N	8989
10634	GENERIC_DAY	0	3	2009-12-16	7980	\N	8989
10635	GENERIC_DAY	0	2	2010-03-10	7981	\N	8989
10636	GENERIC_DAY	0	0	2010-03-01	2929	\N	8989
10637	GENERIC_DAY	0	2	2010-04-09	304	\N	8989
10638	GENERIC_DAY	0	2	2010-03-04	7980	\N	8989
10639	GENERIC_DAY	0	0	2009-10-19	2929	\N	8989
10640	GENERIC_DAY	0	0	2010-06-10	2929	\N	8989
10641	GENERIC_DAY	0	0	2010-01-18	2121	\N	8989
10642	GENERIC_DAY	0	0	2009-12-01	304	\N	8989
10643	GENERIC_DAY	0	0	2009-11-19	2121	\N	8989
10644	GENERIC_DAY	0	2	2010-04-14	7981	\N	8989
10645	GENERIC_DAY	0	0	2010-05-22	2929	\N	8989
10646	GENERIC_DAY	0	2	2010-06-20	7979	\N	8989
10647	GENERIC_DAY	0	0	2010-04-11	7981	\N	8989
10648	GENERIC_DAY	0	2	2010-04-13	304	\N	8989
10649	GENERIC_DAY	0	3	2009-11-13	7981	\N	8989
10650	GENERIC_DAY	0	0	2009-12-04	2929	\N	8989
10651	GENERIC_DAY	0	0	2010-05-23	2929	\N	8989
10652	GENERIC_DAY	0	0	2010-02-18	2929	\N	8989
10653	GENERIC_DAY	0	2	2010-05-19	7979	\N	8989
10654	GENERIC_DAY	0	0	2010-06-14	306	\N	8989
10655	GENERIC_DAY	0	2	2010-06-17	7979	\N	8989
10656	GENERIC_DAY	0	0	2010-01-23	2121	\N	8989
10657	GENERIC_DAY	0	3	2010-02-05	7980	\N	8989
10658	GENERIC_DAY	0	0	2009-11-03	2121	\N	8989
10659	GENERIC_DAY	0	0	2010-02-07	306	\N	8989
10660	GENERIC_DAY	0	0	2010-04-28	306	\N	8989
10661	GENERIC_DAY	0	2	2010-01-14	7981	\N	8989
10662	GENERIC_DAY	0	3	2010-05-22	304	\N	8989
10663	GENERIC_DAY	0	0	2009-11-04	2121	\N	8989
10664	GENERIC_DAY	0	3	2009-12-11	7981	\N	8989
10665	GENERIC_DAY	0	2	2010-05-11	7980	\N	8989
10666	GENERIC_DAY	0	2	2010-06-03	7979	\N	8989
10667	GENERIC_DAY	0	3	2010-04-04	7980	\N	8989
10668	GENERIC_DAY	0	0	2010-05-20	2929	\N	8989
10669	GENERIC_DAY	0	4	2010-01-17	7979	\N	8989
10670	GENERIC_DAY	0	0	2010-06-21	2929	\N	8989
10671	GENERIC_DAY	0	3	2010-06-20	7980	\N	8989
10672	GENERIC_DAY	0	3	2009-12-02	7980	\N	8989
10673	GENERIC_DAY	0	2	2010-06-15	304	\N	8989
10674	GENERIC_DAY	0	4	2010-02-07	7980	\N	8989
10675	GENERIC_DAY	0	0	2010-02-24	2121	\N	8989
10676	GENERIC_DAY	0	3	2010-03-06	7980	\N	8989
10677	GENERIC_DAY	0	0	2010-04-19	306	\N	8989
10678	GENERIC_DAY	0	0	2010-05-13	2121	\N	8989
10679	GENERIC_DAY	0	2	2010-04-23	7980	\N	8989
10680	GENERIC_DAY	0	2	2010-06-24	7980	\N	8989
10681	GENERIC_DAY	0	2	2009-10-27	7979	\N	8989
10682	GENERIC_DAY	0	2	2010-03-08	7980	\N	8989
10683	GENERIC_DAY	0	2	2010-04-12	7980	\N	8989
10684	GENERIC_DAY	0	0	2010-02-09	306	\N	8989
10685	GENERIC_DAY	0	3	2009-10-28	7980	\N	8989
10686	GENERIC_DAY	0	2	2010-05-21	304	\N	8989
10687	GENERIC_DAY	0	0	2010-03-05	306	\N	8989
10688	GENERIC_DAY	0	0	2010-02-13	2121	\N	8989
10689	GENERIC_DAY	0	0	2010-04-17	2121	\N	8989
10690	GENERIC_DAY	0	2	2010-05-22	7979	\N	8989
10691	GENERIC_DAY	0	0	2010-02-01	306	\N	8989
10692	GENERIC_DAY	0	0	2010-01-05	304	\N	8989
10693	GENERIC_DAY	0	3	2009-12-14	7980	\N	8989
10694	GENERIC_DAY	0	3	2009-12-07	7980	\N	8989
10695	GENERIC_DAY	0	0	2010-01-31	7981	\N	8989
10696	GENERIC_DAY	0	2	2010-06-18	304	\N	8989
10697	GENERIC_DAY	0	2	2010-06-16	304	\N	8989
10698	GENERIC_DAY	0	0	2010-06-08	306	\N	8989
10699	GENERIC_DAY	0	0	2010-03-25	2121	\N	8989
10700	GENERIC_DAY	0	3	2010-04-11	304	\N	8989
10701	GENERIC_DAY	0	0	2010-04-05	2121	\N	8989
10702	GENERIC_DAY	0	2	2009-11-04	7979	\N	8989
10703	GENERIC_DAY	0	2	2010-04-05	7979	\N	8989
10704	GENERIC_DAY	0	2	2010-06-17	304	\N	8989
10705	GENERIC_DAY	0	0	2010-05-25	306	\N	8989
10706	GENERIC_DAY	0	2	2010-02-23	7980	\N	8989
10707	GENERIC_DAY	0	2	2009-12-28	2929	\N	8989
10708	GENERIC_DAY	0	3	2010-05-09	7980	\N	8989
10709	GENERIC_DAY	0	0	2010-02-12	304	\N	8989
10710	GENERIC_DAY	0	2	2010-06-08	304	\N	8989
10711	GENERIC_DAY	0	2	2010-05-20	7979	\N	8989
10712	GENERIC_DAY	0	0	2009-11-09	306	\N	8989
10713	GENERIC_DAY	0	2	2010-04-16	7979	\N	8989
10714	GENERIC_DAY	0	2	2009-12-23	7980	\N	8989
10715	GENERIC_DAY	0	2	2010-04-09	7980	\N	8989
10716	GENERIC_DAY	0	0	2009-11-27	304	\N	8989
10717	GENERIC_DAY	0	2	2010-03-09	7980	\N	8989
10718	GENERIC_DAY	0	3	2010-05-08	304	\N	8989
10719	GENERIC_DAY	0	2	2010-04-01	7980	\N	8989
10720	GENERIC_DAY	0	3	2009-10-26	7981	\N	8989
10721	GENERIC_DAY	0	0	2010-03-14	2121	\N	8989
10722	GENERIC_DAY	0	2	2009-12-18	7981	\N	8989
10723	GENERIC_DAY	0	0	2010-03-01	306	\N	8989
10724	GENERIC_DAY	0	2	2010-04-28	7981	\N	8989
10725	GENERIC_DAY	0	2	2010-05-03	7981	\N	8989
10726	GENERIC_DAY	0	0	2010-03-23	306	\N	8989
10727	GENERIC_DAY	0	0	2010-05-06	306	\N	8989
10728	GENERIC_DAY	0	2	2010-03-04	7981	\N	8989
10729	GENERIC_DAY	0	2	2009-12-07	7979	\N	8989
10730	GENERIC_DAY	0	2	2010-04-01	7979	\N	8989
10731	GENERIC_DAY	0	0	2009-12-23	306	\N	8989
10732	GENERIC_DAY	0	3	2009-11-17	7981	\N	8989
10733	GENERIC_DAY	0	2	2010-02-15	7979	\N	8989
10734	GENERIC_DAY	0	2	2010-05-28	7980	\N	8989
10735	GENERIC_DAY	0	2	2010-05-04	7979	\N	8989
10736	GENERIC_DAY	0	0	2010-04-19	2121	\N	8989
10737	GENERIC_DAY	0	0	2010-04-26	2121	\N	8989
10738	GENERIC_DAY	0	2	2010-06-24	2929	\N	8989
10739	GENERIC_DAY	0	0	2010-05-17	2929	\N	8989
10740	GENERIC_DAY	0	2	2010-05-14	7981	\N	8989
10741	GENERIC_DAY	0	0	2010-03-01	2121	\N	8989
10742	GENERIC_DAY	0	0	2010-04-06	2121	\N	8989
10743	GENERIC_DAY	0	0	2010-06-12	2121	\N	8989
10744	GENERIC_DAY	0	0	2010-03-06	7981	\N	8989
10745	GENERIC_DAY	0	2	2010-05-24	7981	\N	8989
10746	GENERIC_DAY	0	0	2009-12-29	306	\N	8989
10747	GENERIC_DAY	0	2	2010-03-16	304	\N	8989
10748	GENERIC_DAY	0	0	2010-04-09	2929	\N	8989
10749	GENERIC_DAY	0	2	2010-02-19	304	\N	8989
10750	GENERIC_DAY	0	0	2010-01-15	2121	\N	8989
10751	GENERIC_DAY	0	0	2010-02-25	2929	\N	8989
10752	GENERIC_DAY	0	0	2010-04-10	2121	\N	8989
10753	GENERIC_DAY	0	0	2010-01-16	304	\N	8989
10754	GENERIC_DAY	0	3	2009-12-14	7981	\N	8989
10755	GENERIC_DAY	0	0	2009-11-30	2121	\N	8989
10756	GENERIC_DAY	0	2	2010-02-21	7979	\N	8989
10757	GENERIC_DAY	0	0	2009-12-20	304	\N	8989
10758	GENERIC_DAY	0	0	2010-02-11	304	\N	8989
10759	GENERIC_DAY	0	0	2010-06-17	2929	\N	8989
10760	GENERIC_DAY	0	0	2009-11-07	7981	\N	8989
10761	GENERIC_DAY	0	0	2009-12-06	306	\N	8989
10762	GENERIC_DAY	0	2	2010-04-15	7981	\N	8989
10763	GENERIC_DAY	0	0	2010-01-22	304	\N	8989
10764	GENERIC_DAY	0	2	2009-12-29	2929	\N	8989
10765	GENERIC_DAY	0	0	2010-05-21	2121	\N	8989
10766	GENERIC_DAY	0	0	2010-01-20	304	\N	8989
10767	GENERIC_DAY	0	0	2010-02-27	2929	\N	8989
10768	GENERIC_DAY	0	2	2010-01-05	7981	\N	8989
10769	GENERIC_DAY	0	0	2010-04-11	2929	\N	8989
10770	GENERIC_DAY	0	0	2010-06-20	306	\N	8989
10771	GENERIC_DAY	0	0	2009-10-21	306	\N	8989
10772	GENERIC_DAY	0	0	2010-05-06	2929	\N	8989
10773	GENERIC_DAY	0	2	2009-12-24	7981	\N	8989
10774	GENERIC_DAY	0	1	2010-06-22	7980	\N	8989
10775	GENERIC_DAY	0	0	2010-04-27	2929	\N	8989
10776	GENERIC_DAY	0	0	2010-06-13	306	\N	8989
10777	GENERIC_DAY	0	4	2010-01-30	7980	\N	8989
10778	GENERIC_DAY	0	2	2010-06-16	7980	\N	8989
10779	GENERIC_DAY	0	3	2010-06-13	304	\N	8989
10780	GENERIC_DAY	0	3	2010-04-10	7980	\N	8989
10781	GENERIC_DAY	0	2	2009-12-29	7980	\N	8989
10782	GENERIC_DAY	0	3	2009-11-26	7981	\N	8989
10783	GENERIC_DAY	0	2	2010-05-03	304	\N	8989
10784	GENERIC_DAY	0	0	2010-01-31	304	\N	8989
10785	GENERIC_DAY	0	0	2009-12-17	306	\N	8989
10786	GENERIC_DAY	0	0	2010-04-15	2929	\N	8989
10787	GENERIC_DAY	0	0	2010-01-18	304	\N	8989
10788	GENERIC_DAY	0	0	2009-12-06	7981	\N	8989
10789	GENERIC_DAY	0	0	2010-04-24	2929	\N	8989
10790	GENERIC_DAY	0	2	2010-05-17	304	\N	8989
10791	GENERIC_DAY	0	0	2010-01-01	2121	\N	8989
10792	GENERIC_DAY	0	0	2009-11-27	306	\N	8989
10793	GENERIC_DAY	0	0	2009-11-04	304	\N	8989
10794	GENERIC_DAY	0	0	2009-10-28	304	\N	8989
10795	GENERIC_DAY	0	0	2010-01-26	2121	\N	8989
10796	GENERIC_DAY	0	2	2010-05-07	7980	\N	8989
10797	GENERIC_DAY	0	0	2010-01-03	304	\N	8989
10798	GENERIC_DAY	0	3	2010-04-25	304	\N	8989
10799	GENERIC_DAY	0	2	2010-01-25	7980	\N	8989
10800	GENERIC_DAY	0	2	2010-05-13	304	\N	8989
10801	GENERIC_DAY	0	0	2010-03-17	2929	\N	8989
10802	GENERIC_DAY	0	0	2010-05-14	2929	\N	8989
10803	GENERIC_DAY	0	2	2009-12-09	7979	\N	8989
10804	GENERIC_DAY	0	0	2009-11-29	2929	\N	8989
10805	GENERIC_DAY	0	2	2010-06-08	7979	\N	8989
10806	GENERIC_DAY	0	3	2010-03-27	7980	\N	8989
10807	GENERIC_DAY	0	0	2009-11-08	2121	\N	8989
10808	GENERIC_DAY	0	2	2010-05-28	7979	\N	8989
10809	GENERIC_DAY	0	2	2010-04-30	7980	\N	8989
10810	GENERIC_DAY	0	0	2009-10-29	304	\N	8989
10811	GENERIC_DAY	0	4	2009-10-25	7979	\N	8989
10812	GENERIC_DAY	0	3	2010-04-24	304	\N	8989
10813	GENERIC_DAY	0	0	2010-06-07	306	\N	8989
10814	GENERIC_DAY	0	0	2009-10-24	306	\N	8989
10815	GENERIC_DAY	0	0	2010-01-20	2121	\N	8989
10816	GENERIC_DAY	0	2	2010-05-10	7979	\N	8989
10817	GENERIC_DAY	0	0	2009-10-30	304	\N	8989
10818	GENERIC_DAY	0	0	2009-11-28	306	\N	8989
10819	GENERIC_DAY	0	0	2009-12-03	2929	\N	8989
10820	GENERIC_DAY	0	0	2009-12-26	2121	\N	8989
10821	GENERIC_DAY	0	0	2010-03-07	306	\N	8989
10822	GENERIC_DAY	0	0	2010-06-04	2929	\N	8989
10823	GENERIC_DAY	0	2	2010-06-22	306	\N	8989
10824	GENERIC_DAY	0	2	2010-05-26	7980	\N	8989
10825	GENERIC_DAY	0	0	2009-11-28	2121	\N	8989
10826	GENERIC_DAY	0	0	2010-06-02	2121	\N	8989
10827	GENERIC_DAY	0	2	2010-03-27	7979	\N	8989
10828	GENERIC_DAY	0	2	2010-03-09	7979	\N	8989
10829	GENERIC_DAY	0	0	2010-05-05	306	\N	8989
10830	GENERIC_DAY	0	2	2009-12-21	7980	\N	8989
10831	GENERIC_DAY	0	2	2010-02-18	304	\N	8989
10832	GENERIC_DAY	0	4	2010-02-14	7979	\N	8989
10833	GENERIC_DAY	0	0	2010-06-05	306	\N	8989
10834	GENERIC_DAY	0	2	2009-12-25	7980	\N	8989
10835	GENERIC_DAY	0	2	2010-01-22	7980	\N	8989
10836	GENERIC_DAY	0	0	2010-02-14	7981	\N	8989
10837	GENERIC_DAY	0	2	2010-04-15	7980	\N	8989
10838	GENERIC_DAY	0	0	2010-02-17	306	\N	8989
10839	GENERIC_DAY	0	2	2010-03-05	7981	\N	8989
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
393219	3	708	709	0
393220	3	708	709	0
393217	3	708	709	0
1605633	3	3638	3637	0
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
808
1717
2424
8989
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
110
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
505	1	1000	1.00	f	405
506	1	1000	1.00	f	406
1414	1	1000	1.00	f	1314
3434	2	2000	1.00	f	3334
8686	1	2000	1.00	f	8586
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
3131	8	0
3131	8	1
3131	8	2
3131	8	3
3131	8	4
6061	8	0
6061	8	1
8282	8	0
8282	8	1
8282	8	2
8282	8	3
8282	8	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
606	404
1515	1313
3535	3333
8787	8585
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, name, label_type_id) FROM stdin;
6566	1	alta	6464
6568	1	rojo	6465
6569	1	verde	6465
6565	2	media	6464
6570	2	amarrillo	6465
6567	2	urgente	6464
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, name) FROM stdin;
6464	1	prioridad
6465	1	color
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
7980	Machine 3	ahora	adsfasdf
7979	Machine 2	mc2	M123
7981	asdfasfd	asdfasdf	M124
10908	ec1	dsfas	asfdsafd
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
3334	6565
3334	6570
3334	6567
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, customer) FROM stdin;
404	Javier	Moran
1313	Javier Moran	Hola Hola
3333	Javier	\N
8585	Luar	Ahora
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, initdate, enddate, mandatoryinit, mandatoryend, description, code, parent, positionincontainer) FROM stdin;
404	1	Pedido 1	2009-10-15 14:03:18.836	\N	f	f	Hola	p1	\N	\N
405	1	oe1	\N	\N	f	f	\N	ec1	404	0
406	1	oe2	\N	\N	f	f	\N	ec2	404	1
1313	1	Pedido 2	2009-10-15 18:45:00.728	\N	f	f	aaa	ep2	\N	\N
1314	1	newo	\N	\N	f	f	\N	ec1	1313	0
3333	2	Pedido 3	2009-10-15 20:28:55.385	\N	f	f	Pero que pasa	ep3	\N	\N
3334	2	oe1	\N	\N	f	f	\N	oec1	3333	0
8585	1	Pedido 4	2009-10-19 10:44:03.136	\N	f	f	que pasa	ped4	\N	\N
8586	1	no1	\N	\N	f	f	\N	ec1	8585	0
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid) FROM stdin;
405
406
1314
3334
8586
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
404
1313
3333
8585
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, calendar) FROM stdin;
306	3	\N
2929	9	3030
2121	10	5959
304	4	\N
7980	1	\N
7979	4	\N
7981	4	8181
10908	1	\N
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
808	4	1.00	708	\N
2424	0	1.00	709	\N
3737	3	1.00	3637	\N
6969	0	1.00	3637	\N
1717	1	1.00	1617	\N
6970	0	1.00	1617	\N
8989	0	1.00	8889	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id) FROM stdin;
3030
5959
8181
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
6969	306
3737	2929
6970	306
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, hoursgroup, calculatedvalue) FROM stdin;
709	506	1
708	505	1
3637	3434	1
1617	1414	1
8889	8686	1
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, shareofhours, name, notes, startdate, enddate, order_element_id, parent, base_calendar_id, positioninparent) FROM stdin;
709	6	\N	oe2	\N	2010-06-23 00:00:00	2010-10-26 00:00:00	406	707	\N	1
708	6	\N	oe1	\N	2009-10-15 00:00:00	2010-02-17 00:00:00	405	707	\N	0
707	6	\N	\N	\N	2009-10-15 00:00:00	2010-10-26 00:00:00	404	\N	\N	\N
3637	5	\N	oe1	\N	2010-01-26 00:00:00	2010-06-22 00:00:00	3334	3636	\N	1
3638	1	\N	new milestone	\N	2009-10-15 20:28:55.385	2009-10-15 20:28:55.385	\N	3636	\N	0
3636	5	\N	\N	\N	2009-10-15 20:28:55.385	2010-06-22 00:00:00	3333	\N	\N	\N
1617	3	\N	newo	\N	2009-10-15 00:00:00	2009-12-17 00:00:00	1314	1616	\N	0
1616	3	\N	\N	\N	2009-10-15 00:00:00	2009-12-17 00:00:00	1313	\N	\N	\N
8889	2	\N	no1	\N	2009-10-19 00:00:00	2010-06-26 00:00:00	8586	8888	\N	0
8888	2	\N	\N	\N	2009-10-19 00:00:00	2010-06-26 00:00:00	8585	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
707
1616
3636
8888
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
3638
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
306	Susana	Montes	1234323
2929	Oscar	Gonzalez	23124123
2121	Javier	Lorenzo	98320423
304	Javier	Moran	78736622D
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
-- Name: criterionhoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionhoursgroup
    ADD CONSTRAINT criterionhoursgroup_pkey PRIMARY KEY (hoursgroupid, criterionid);


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
-- Name: machine_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (machine_id);


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
-- Name: fka3cfee1117b6c7cd; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionhoursgroup
    ADD CONSTRAINT fka3cfee1117b6c7cd FOREIGN KEY (hoursgroupid) REFERENCES hoursgroup(id);


--
-- Name: fka3cfee115c035047; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionhoursgroup
    ADD CONSTRAINT fka3cfee115c035047 FOREIGN KEY (criterionid) REFERENCES criterion(id);


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


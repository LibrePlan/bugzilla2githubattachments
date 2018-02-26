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
623	1	t	202
606	4	t	202
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
101	14	medicalLeave	t	1	\N
102	13	paternityLeave	t	1	\N
103	4	hiredResourceWorkingRelationship	t	5	\N
104	3	firedResourceWorkingRelationship	t	5	\N
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
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
1	15	LEAVE	Leave	f	f	t	1
2	11	CATEGORY	Professional category	t	t	t	1
3	9	TRAINING	Training courses and labor training	t	t	t	1
4	7	JOB	Job	t	t	t	1
5	5	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
6	1	LOCATION_GROUP	Location where the resource work	t	f	t	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id) FROM stdin;
2491	GENERIC_DAY	0	8	2010-02-02	303	\N	1522
2492	GENERIC_DAY	0	8	2009-12-12	303	\N	1522
2493	GENERIC_DAY	0	8	2010-01-22	303	\N	1522
2494	GENERIC_DAY	0	8	2010-01-12	303	\N	1522
2495	GENERIC_DAY	0	8	2010-01-21	303	\N	1522
2496	GENERIC_DAY	0	8	2010-01-24	303	\N	1522
2497	GENERIC_DAY	0	8	2009-12-10	303	\N	1522
2498	GENERIC_DAY	0	8	2009-12-17	303	\N	1522
2499	GENERIC_DAY	0	8	2010-02-10	303	\N	1522
2500	GENERIC_DAY	0	8	2010-02-12	303	\N	1522
2501	GENERIC_DAY	0	8	2010-01-06	303	\N	1522
2502	GENERIC_DAY	0	8	2010-02-08	303	\N	1522
2503	GENERIC_DAY	0	8	2009-11-12	303	\N	1522
2504	GENERIC_DAY	0	8	2009-12-18	303	\N	1522
2505	GENERIC_DAY	0	8	2009-12-25	303	\N	1522
2506	GENERIC_DAY	0	8	2010-02-15	303	\N	1522
2507	GENERIC_DAY	0	8	2010-01-28	303	\N	1522
2508	GENERIC_DAY	0	8	2010-01-15	303	\N	1522
2509	GENERIC_DAY	0	8	2009-10-26	303	\N	1522
2510	GENERIC_DAY	0	8	2010-01-17	303	\N	1522
2511	GENERIC_DAY	0	8	2009-11-02	303	\N	1522
2512	GENERIC_DAY	0	8	2010-01-13	303	\N	1522
2513	GENERIC_DAY	0	8	2010-02-04	303	\N	1522
2514	GENERIC_DAY	0	8	2010-01-16	303	\N	1522
2515	GENERIC_DAY	0	8	2010-01-04	303	\N	1522
2516	GENERIC_DAY	0	8	2010-02-24	303	\N	1522
2517	GENERIC_DAY	0	8	2009-11-21	303	\N	1522
2518	GENERIC_DAY	0	8	2009-12-15	303	\N	1522
2519	GENERIC_DAY	0	8	2010-01-19	303	\N	1522
2520	GENERIC_DAY	0	8	2010-02-23	303	\N	1522
2521	GENERIC_DAY	0	8	2009-11-06	303	\N	1522
2522	GENERIC_DAY	0	8	2009-11-16	303	\N	1522
2523	GENERIC_DAY	0	8	2010-01-07	303	\N	1522
2524	GENERIC_DAY	0	8	2010-02-20	303	\N	1522
2525	GENERIC_DAY	0	8	2009-12-29	303	\N	1522
2526	GENERIC_DAY	0	8	2010-02-26	303	\N	1522
2527	GENERIC_DAY	0	8	2009-11-10	303	\N	1522
2528	GENERIC_DAY	0	8	2009-12-16	303	\N	1522
1741	SPECIFIC_DAY	3	8	2009-12-16	303	1516	\N
1742	SPECIFIC_DAY	3	8	2009-12-12	303	1516	\N
1743	SPECIFIC_DAY	3	8	2010-02-10	303	1516	\N
1744	SPECIFIC_DAY	3	8	2010-02-27	303	1516	\N
1745	SPECIFIC_DAY	3	8	2010-01-14	303	1516	\N
1746	SPECIFIC_DAY	3	8	2010-02-05	303	1516	\N
1747	SPECIFIC_DAY	3	8	2009-10-29	303	1516	\N
1748	SPECIFIC_DAY	3	8	2010-01-22	303	1516	\N
1749	SPECIFIC_DAY	3	8	2009-12-31	303	1516	\N
1750	SPECIFIC_DAY	3	8	2009-11-16	303	1516	\N
1751	SPECIFIC_DAY	3	8	2009-12-02	303	1516	\N
1752	SPECIFIC_DAY	3	8	2009-11-13	303	1516	\N
1753	SPECIFIC_DAY	3	8	2010-02-13	303	1516	\N
1754	SPECIFIC_DAY	3	8	2010-02-01	303	1516	\N
1755	SPECIFIC_DAY	3	8	2009-12-04	303	1516	\N
1756	SPECIFIC_DAY	3	8	2009-12-09	303	1516	\N
1757	SPECIFIC_DAY	3	8	2010-01-08	303	1516	\N
1758	SPECIFIC_DAY	3	8	2009-12-26	303	1516	\N
1759	SPECIFIC_DAY	3	8	2009-11-05	303	1516	\N
1760	SPECIFIC_DAY	3	8	2009-12-27	303	1516	\N
1761	SPECIFIC_DAY	3	8	2009-12-13	303	1516	\N
1762	SPECIFIC_DAY	3	8	2010-02-19	303	1516	\N
1763	SPECIFIC_DAY	3	8	2010-01-11	303	1516	\N
1764	SPECIFIC_DAY	3	8	2010-02-23	303	1516	\N
1765	SPECIFIC_DAY	3	8	2010-01-03	303	1516	\N
1766	SPECIFIC_DAY	3	8	2010-01-31	303	1516	\N
1767	SPECIFIC_DAY	3	8	2009-10-28	303	1516	\N
1768	SPECIFIC_DAY	3	8	2009-12-07	303	1516	\N
1769	SPECIFIC_DAY	3	8	2010-01-02	303	1516	\N
1770	SPECIFIC_DAY	3	8	2010-01-09	303	1516	\N
1771	SPECIFIC_DAY	3	8	2010-01-13	303	1516	\N
1772	SPECIFIC_DAY	3	8	2009-11-10	303	1516	\N
1773	SPECIFIC_DAY	3	8	2010-02-16	303	1516	\N
1774	SPECIFIC_DAY	3	8	2010-02-15	303	1516	\N
1775	SPECIFIC_DAY	3	8	2009-11-08	303	1516	\N
1776	SPECIFIC_DAY	3	8	2009-12-28	303	1516	\N
1777	SPECIFIC_DAY	3	8	2009-10-30	303	1516	\N
1778	SPECIFIC_DAY	3	8	2010-02-24	303	1516	\N
1779	SPECIFIC_DAY	3	8	2010-02-08	303	1516	\N
1780	SPECIFIC_DAY	3	8	2009-12-19	303	1516	\N
1781	SPECIFIC_DAY	3	8	2009-11-14	303	1516	\N
1782	SPECIFIC_DAY	3	8	2010-01-16	303	1516	\N
1783	SPECIFIC_DAY	3	8	2010-01-27	303	1516	\N
1784	SPECIFIC_DAY	3	8	2009-12-15	303	1516	\N
1785	SPECIFIC_DAY	3	8	2009-11-20	303	1516	\N
1786	SPECIFIC_DAY	3	8	2009-12-23	303	1516	\N
1787	SPECIFIC_DAY	3	8	2010-01-12	303	1516	\N
1788	SPECIFIC_DAY	3	8	2010-02-20	303	1516	\N
1789	SPECIFIC_DAY	3	8	2009-11-25	303	1516	\N
1790	SPECIFIC_DAY	3	8	2009-11-03	303	1516	\N
1791	SPECIFIC_DAY	3	8	2009-11-18	303	1516	\N
1792	SPECIFIC_DAY	3	8	2009-11-27	303	1516	\N
1793	SPECIFIC_DAY	3	8	2010-01-10	303	1516	\N
1794	SPECIFIC_DAY	3	8	2009-11-28	303	1516	\N
1795	SPECIFIC_DAY	3	8	2009-11-24	303	1516	\N
1796	SPECIFIC_DAY	3	8	2009-11-23	303	1516	\N
1797	SPECIFIC_DAY	3	8	2009-10-27	303	1516	\N
1798	SPECIFIC_DAY	3	8	2009-11-09	303	1516	\N
1799	SPECIFIC_DAY	3	8	2009-11-17	303	1516	\N
1800	SPECIFIC_DAY	3	8	2009-11-22	303	1516	\N
1801	SPECIFIC_DAY	3	8	2010-02-18	303	1516	\N
1802	SPECIFIC_DAY	3	8	2009-11-07	303	1516	\N
1803	SPECIFIC_DAY	3	8	2009-10-26	303	1516	\N
1804	SPECIFIC_DAY	3	8	2009-10-31	303	1516	\N
1805	SPECIFIC_DAY	3	8	2010-01-01	303	1516	\N
1806	SPECIFIC_DAY	3	8	2009-12-30	303	1516	\N
1807	SPECIFIC_DAY	3	8	2010-01-04	303	1516	\N
1808	SPECIFIC_DAY	3	8	2009-12-14	303	1516	\N
1809	SPECIFIC_DAY	3	8	2009-11-26	303	1516	\N
1810	SPECIFIC_DAY	3	8	2009-11-30	303	1516	\N
1811	SPECIFIC_DAY	3	8	2009-11-21	303	1516	\N
1812	SPECIFIC_DAY	3	8	2009-12-21	303	1516	\N
1813	SPECIFIC_DAY	3	8	2010-02-04	303	1516	\N
1814	SPECIFIC_DAY	3	8	2009-11-11	303	1516	\N
1815	SPECIFIC_DAY	3	8	2010-02-25	303	1516	\N
1816	SPECIFIC_DAY	3	8	2010-02-03	303	1516	\N
1817	SPECIFIC_DAY	3	8	2010-02-26	303	1516	\N
1818	SPECIFIC_DAY	3	8	2009-12-22	303	1516	\N
1819	SPECIFIC_DAY	3	8	2010-01-17	303	1516	\N
1820	SPECIFIC_DAY	3	8	2009-12-11	303	1516	\N
1821	SPECIFIC_DAY	3	8	2010-02-09	303	1516	\N
1822	SPECIFIC_DAY	3	8	2009-12-05	303	1516	\N
1823	SPECIFIC_DAY	3	8	2010-02-11	303	1516	\N
1824	SPECIFIC_DAY	3	8	2010-01-30	303	1516	\N
1825	SPECIFIC_DAY	3	8	2009-12-24	303	1516	\N
1826	SPECIFIC_DAY	3	8	2010-01-26	303	1516	\N
1827	SPECIFIC_DAY	3	8	2009-12-10	303	1516	\N
1828	SPECIFIC_DAY	3	8	2009-11-19	303	1516	\N
1829	SPECIFIC_DAY	3	8	2010-01-24	303	1516	\N
1830	SPECIFIC_DAY	3	8	2009-12-17	303	1516	\N
1831	SPECIFIC_DAY	3	8	2010-02-22	303	1516	\N
1832	SPECIFIC_DAY	3	8	2009-11-06	303	1516	\N
1833	SPECIFIC_DAY	3	8	2009-12-29	303	1516	\N
1834	SPECIFIC_DAY	3	8	2009-12-01	303	1516	\N
1835	SPECIFIC_DAY	3	8	2010-01-25	303	1516	\N
1836	SPECIFIC_DAY	3	8	2010-01-07	303	1516	\N
1837	SPECIFIC_DAY	3	8	2010-02-17	303	1516	\N
1838	SPECIFIC_DAY	3	8	2010-02-06	303	1516	\N
1839	SPECIFIC_DAY	3	8	2010-02-12	303	1516	\N
1840	SPECIFIC_DAY	3	8	2010-02-02	303	1516	\N
1841	SPECIFIC_DAY	3	8	2010-02-07	303	1516	\N
1842	SPECIFIC_DAY	3	8	2010-01-15	303	1516	\N
1843	SPECIFIC_DAY	3	8	2010-02-21	303	1516	\N
1844	SPECIFIC_DAY	3	8	2009-11-04	303	1516	\N
1845	SPECIFIC_DAY	3	8	2009-11-15	303	1516	\N
1846	SPECIFIC_DAY	3	8	2009-11-01	303	1516	\N
1847	SPECIFIC_DAY	3	8	2010-01-21	303	1516	\N
1848	SPECIFIC_DAY	3	8	2010-01-18	303	1516	\N
1849	SPECIFIC_DAY	3	8	2009-12-25	303	1516	\N
1850	SPECIFIC_DAY	3	8	2010-01-06	303	1516	\N
1851	SPECIFIC_DAY	3	8	2010-01-28	303	1516	\N
1852	SPECIFIC_DAY	3	8	2009-11-29	303	1516	\N
1853	SPECIFIC_DAY	3	8	2009-12-08	303	1516	\N
1854	SPECIFIC_DAY	3	8	2010-01-19	303	1516	\N
1855	SPECIFIC_DAY	3	8	2009-12-06	303	1516	\N
1856	SPECIFIC_DAY	3	8	2010-02-14	303	1516	\N
1857	SPECIFIC_DAY	3	8	2009-11-02	303	1516	\N
1858	SPECIFIC_DAY	3	8	2009-11-12	303	1516	\N
1859	SPECIFIC_DAY	3	8	2010-01-29	303	1516	\N
1860	SPECIFIC_DAY	3	8	2010-01-05	303	1516	\N
1861	SPECIFIC_DAY	3	8	2010-01-20	303	1516	\N
1862	SPECIFIC_DAY	3	8	2009-12-03	303	1516	\N
1863	SPECIFIC_DAY	3	8	2009-12-20	303	1516	\N
1864	SPECIFIC_DAY	3	8	2010-01-23	303	1516	\N
1865	SPECIFIC_DAY	3	8	2009-12-18	303	1516	\N
2529	GENERIC_DAY	0	8	2009-11-28	303	\N	1522
2530	GENERIC_DAY	0	8	2010-02-09	303	\N	1522
2531	GENERIC_DAY	0	8	2009-10-30	303	\N	1522
2532	GENERIC_DAY	0	8	2009-11-22	303	\N	1522
2533	GENERIC_DAY	0	8	2010-02-25	303	\N	1522
2534	GENERIC_DAY	0	8	2009-11-09	303	\N	1522
2535	GENERIC_DAY	0	8	2009-12-30	303	\N	1522
2536	GENERIC_DAY	0	8	2010-02-17	303	\N	1522
2537	GENERIC_DAY	0	8	2009-11-11	303	\N	1522
2538	GENERIC_DAY	0	8	2010-01-23	303	\N	1522
2539	GENERIC_DAY	0	8	2009-11-07	303	\N	1522
2540	GENERIC_DAY	0	8	2009-11-19	303	\N	1522
2541	GENERIC_DAY	0	8	2009-11-17	303	\N	1522
2542	GENERIC_DAY	0	8	2010-01-27	303	\N	1522
2543	GENERIC_DAY	0	8	2009-12-21	303	\N	1522
2544	GENERIC_DAY	0	8	2009-12-02	303	\N	1522
2545	GENERIC_DAY	0	8	2010-02-14	303	\N	1522
2546	GENERIC_DAY	0	8	2010-01-30	303	\N	1522
2547	GENERIC_DAY	0	8	2009-11-26	303	\N	1522
2548	GENERIC_DAY	0	8	2010-02-19	303	\N	1522
2549	GENERIC_DAY	0	8	2010-01-25	303	\N	1522
2550	GENERIC_DAY	0	8	2009-12-27	303	\N	1522
2551	GENERIC_DAY	0	8	2009-12-11	303	\N	1522
2552	GENERIC_DAY	0	8	2010-02-21	303	\N	1522
2553	GENERIC_DAY	0	8	2010-01-03	303	\N	1522
2554	GENERIC_DAY	0	8	2009-11-08	303	\N	1522
2555	GENERIC_DAY	0	8	2009-12-22	303	\N	1522
2556	GENERIC_DAY	0	8	2009-11-20	303	\N	1522
2557	GENERIC_DAY	0	8	2009-11-04	303	\N	1522
2558	GENERIC_DAY	0	8	2009-12-03	303	\N	1522
2559	GENERIC_DAY	0	8	2010-02-22	303	\N	1522
2560	GENERIC_DAY	0	8	2010-01-26	303	\N	1522
2561	GENERIC_DAY	0	8	2009-11-05	303	\N	1522
2562	GENERIC_DAY	0	8	2010-02-01	303	\N	1522
2563	GENERIC_DAY	0	8	2010-01-01	303	\N	1522
2564	GENERIC_DAY	0	8	2009-10-31	303	\N	1522
2565	GENERIC_DAY	0	8	2010-02-13	303	\N	1522
2566	GENERIC_DAY	0	8	2009-11-03	303	\N	1522
2567	GENERIC_DAY	0	8	2010-02-11	303	\N	1522
2568	GENERIC_DAY	0	8	2009-12-08	303	\N	1522
2569	GENERIC_DAY	0	8	2009-11-24	303	\N	1522
2570	GENERIC_DAY	0	8	2010-01-18	303	\N	1522
2571	GENERIC_DAY	0	8	2010-02-06	303	\N	1522
2572	GENERIC_DAY	0	8	2010-01-05	303	\N	1522
2573	GENERIC_DAY	0	8	2009-12-26	303	\N	1522
2574	GENERIC_DAY	0	8	2010-02-27	303	\N	1522
2575	GENERIC_DAY	0	8	2010-01-10	303	\N	1522
2576	GENERIC_DAY	0	8	2009-12-13	303	\N	1522
2577	GENERIC_DAY	0	8	2009-12-14	303	\N	1522
2578	GENERIC_DAY	0	8	2009-12-20	303	\N	1522
2579	GENERIC_DAY	0	8	2009-12-28	303	\N	1522
2580	GENERIC_DAY	0	8	2010-01-31	303	\N	1522
2581	GENERIC_DAY	0	8	2009-11-14	303	\N	1522
2582	GENERIC_DAY	0	8	2010-01-14	303	\N	1522
2583	GENERIC_DAY	0	8	2009-12-07	303	\N	1522
2584	GENERIC_DAY	0	8	2009-12-05	303	\N	1522
2585	GENERIC_DAY	0	8	2010-02-18	303	\N	1522
2586	GENERIC_DAY	0	8	2009-10-29	303	\N	1522
2587	GENERIC_DAY	0	8	2010-02-03	303	\N	1522
2588	GENERIC_DAY	0	8	2009-10-27	303	\N	1522
2589	GENERIC_DAY	0	8	2009-12-23	303	\N	1522
2590	GENERIC_DAY	0	8	2009-11-23	303	\N	1522
2591	GENERIC_DAY	0	8	2010-01-20	303	\N	1522
2592	GENERIC_DAY	0	8	2009-12-06	303	\N	1522
2593	GENERIC_DAY	0	8	2009-12-04	303	\N	1522
2594	GENERIC_DAY	0	8	2009-11-18	303	\N	1522
2595	GENERIC_DAY	0	8	2009-11-25	303	\N	1522
2596	GENERIC_DAY	0	8	2009-12-24	303	\N	1522
2597	GENERIC_DAY	0	8	2009-12-31	303	\N	1522
2598	GENERIC_DAY	0	8	2009-11-30	303	\N	1522
2599	GENERIC_DAY	0	8	2009-12-09	303	\N	1522
2600	GENERIC_DAY	0	8	2009-11-27	303	\N	1522
2601	GENERIC_DAY	0	8	2010-01-29	303	\N	1522
2602	GENERIC_DAY	0	8	2009-12-01	303	\N	1522
2603	GENERIC_DAY	0	8	2009-10-28	303	\N	1522
2604	GENERIC_DAY	0	8	2009-11-15	303	\N	1522
2605	GENERIC_DAY	0	8	2010-02-07	303	\N	1522
2606	GENERIC_DAY	0	8	2010-02-05	303	\N	1522
2607	GENERIC_DAY	0	8	2010-01-08	303	\N	1522
2608	GENERIC_DAY	0	8	2009-11-13	303	\N	1522
2609	GENERIC_DAY	0	8	2010-01-11	303	\N	1522
2610	GENERIC_DAY	0	8	2010-02-16	303	\N	1522
2611	GENERIC_DAY	0	8	2010-01-02	303	\N	1522
2612	GENERIC_DAY	0	8	2010-01-09	303	\N	1522
2613	GENERIC_DAY	0	8	2009-12-19	303	\N	1522
2614	GENERIC_DAY	0	8	2009-11-29	303	\N	1522
2615	GENERIC_DAY	0	8	2009-11-01	303	\N	1522
2616	SPECIFIC_DAY	3	8	2010-03-10	303	1523	\N
2617	SPECIFIC_DAY	3	8	2009-12-21	303	1523	\N
2618	SPECIFIC_DAY	3	8	2010-01-08	303	1523	\N
2619	SPECIFIC_DAY	3	8	2009-12-25	303	1523	\N
2620	SPECIFIC_DAY	3	8	2010-02-24	303	1523	\N
2621	SPECIFIC_DAY	3	8	2010-03-01	303	1523	\N
2622	SPECIFIC_DAY	3	8	2010-01-15	303	1523	\N
2623	SPECIFIC_DAY	3	8	2010-03-07	303	1523	\N
2624	SPECIFIC_DAY	3	8	2010-03-28	303	1523	\N
2625	SPECIFIC_DAY	3	8	2010-02-27	303	1523	\N
2626	SPECIFIC_DAY	3	8	2010-02-11	303	1523	\N
2627	SPECIFIC_DAY	3	8	2009-12-29	303	1523	\N
2628	SPECIFIC_DAY	3	8	2010-03-06	303	1523	\N
2629	SPECIFIC_DAY	3	8	2010-04-04	303	1523	\N
2630	SPECIFIC_DAY	3	8	2010-04-01	303	1523	\N
2631	SPECIFIC_DAY	3	8	2010-01-12	303	1523	\N
2632	SPECIFIC_DAY	3	8	2010-01-05	303	1523	\N
2633	SPECIFIC_DAY	3	8	2010-04-20	303	1523	\N
2634	SPECIFIC_DAY	3	8	2009-12-20	303	1523	\N
2635	SPECIFIC_DAY	3	8	2010-04-02	303	1523	\N
2636	SPECIFIC_DAY	3	8	2010-03-02	303	1523	\N
2637	SPECIFIC_DAY	3	8	2010-01-14	303	1523	\N
2638	SPECIFIC_DAY	3	8	2010-01-19	303	1523	\N
2639	SPECIFIC_DAY	3	8	2010-03-23	303	1523	\N
2640	SPECIFIC_DAY	3	8	2010-03-11	303	1523	\N
2641	SPECIFIC_DAY	3	8	2010-01-21	303	1523	\N
2642	SPECIFIC_DAY	3	8	2010-01-23	303	1523	\N
2643	SPECIFIC_DAY	3	8	2010-02-23	303	1523	\N
2644	SPECIFIC_DAY	3	8	2010-04-03	303	1523	\N
2645	SPECIFIC_DAY	3	8	2010-01-02	303	1523	\N
2646	SPECIFIC_DAY	3	8	2010-01-06	303	1523	\N
2647	SPECIFIC_DAY	3	8	2010-04-07	303	1523	\N
2648	SPECIFIC_DAY	3	8	2010-02-12	303	1523	\N
2649	SPECIFIC_DAY	3	8	2010-02-08	303	1523	\N
2650	SPECIFIC_DAY	3	8	2010-03-15	303	1523	\N
2651	SPECIFIC_DAY	3	8	2010-04-08	303	1523	\N
2652	SPECIFIC_DAY	3	8	2009-12-27	303	1523	\N
2653	SPECIFIC_DAY	3	8	2010-04-18	303	1523	\N
2654	SPECIFIC_DAY	3	8	2009-12-19	303	1523	\N
2655	SPECIFIC_DAY	3	8	2010-02-20	303	1523	\N
2656	SPECIFIC_DAY	3	8	2010-02-03	303	1523	\N
2657	SPECIFIC_DAY	3	8	2010-02-28	303	1523	\N
2658	SPECIFIC_DAY	3	8	2010-01-16	303	1523	\N
2659	SPECIFIC_DAY	3	8	2010-03-21	303	1523	\N
2660	SPECIFIC_DAY	3	8	2010-02-26	303	1523	\N
2661	SPECIFIC_DAY	3	8	2010-03-17	303	1523	\N
2662	SPECIFIC_DAY	3	8	2010-02-02	303	1523	\N
2663	SPECIFIC_DAY	3	8	2010-01-03	303	1523	\N
2664	SPECIFIC_DAY	3	8	2009-12-18	303	1523	\N
2665	SPECIFIC_DAY	3	8	2010-02-06	303	1523	\N
2666	SPECIFIC_DAY	3	8	2010-01-01	303	1523	\N
2667	SPECIFIC_DAY	3	8	2010-03-14	303	1523	\N
2668	SPECIFIC_DAY	3	8	2010-03-30	303	1523	\N
2669	SPECIFIC_DAY	3	8	2010-04-10	303	1523	\N
2670	SPECIFIC_DAY	3	8	2010-04-14	303	1523	\N
2671	SPECIFIC_DAY	3	8	2009-12-22	303	1523	\N
2672	SPECIFIC_DAY	3	8	2010-01-10	303	1523	\N
2673	SPECIFIC_DAY	3	8	2010-02-16	303	1523	\N
2674	SPECIFIC_DAY	3	8	2010-03-29	303	1523	\N
2675	SPECIFIC_DAY	3	8	2010-01-22	303	1523	\N
2676	SPECIFIC_DAY	3	8	2010-02-22	303	1523	\N
2677	SPECIFIC_DAY	3	8	2010-01-09	303	1523	\N
2678	SPECIFIC_DAY	3	8	2010-01-07	303	1523	\N
2679	SPECIFIC_DAY	3	8	2010-02-25	303	1523	\N
2680	SPECIFIC_DAY	3	8	2010-03-16	303	1523	\N
2681	SPECIFIC_DAY	3	8	2009-12-30	303	1523	\N
2682	SPECIFIC_DAY	3	8	2010-03-04	303	1523	\N
2683	SPECIFIC_DAY	3	8	2010-02-10	303	1523	\N
2684	SPECIFIC_DAY	3	8	2010-01-25	303	1523	\N
2685	SPECIFIC_DAY	3	8	2009-12-23	303	1523	\N
2686	SPECIFIC_DAY	3	8	2010-03-25	303	1523	\N
2687	SPECIFIC_DAY	3	8	2010-01-11	303	1523	\N
2688	SPECIFIC_DAY	3	8	2010-01-30	303	1523	\N
2689	SPECIFIC_DAY	3	8	2010-03-19	303	1523	\N
2690	SPECIFIC_DAY	3	8	2010-01-24	303	1523	\N
2691	SPECIFIC_DAY	3	8	2010-04-06	303	1523	\N
2692	SPECIFIC_DAY	3	8	2010-02-17	303	1523	\N
2693	SPECIFIC_DAY	3	8	2010-01-20	303	1523	\N
2694	SPECIFIC_DAY	3	8	2010-03-26	303	1523	\N
2695	SPECIFIC_DAY	3	8	2010-03-27	303	1523	\N
2696	SPECIFIC_DAY	3	8	2009-12-26	303	1523	\N
2697	SPECIFIC_DAY	3	8	2010-02-09	303	1523	\N
2698	SPECIFIC_DAY	3	8	2009-12-28	303	1523	\N
2699	SPECIFIC_DAY	3	8	2010-01-31	303	1523	\N
2700	SPECIFIC_DAY	3	8	2010-02-21	303	1523	\N
2701	SPECIFIC_DAY	3	8	2010-04-09	303	1523	\N
2702	SPECIFIC_DAY	3	8	2010-03-22	303	1523	\N
2703	SPECIFIC_DAY	3	8	2010-03-13	303	1523	\N
2704	SPECIFIC_DAY	3	8	2010-01-17	303	1523	\N
2705	SPECIFIC_DAY	3	8	2010-02-18	303	1523	\N
2706	SPECIFIC_DAY	3	8	2010-03-03	303	1523	\N
2707	SPECIFIC_DAY	3	8	2010-04-21	303	1523	\N
2708	SPECIFIC_DAY	3	8	2009-12-31	303	1523	\N
2709	SPECIFIC_DAY	3	8	2010-04-19	303	1523	\N
2710	SPECIFIC_DAY	3	8	2010-02-14	303	1523	\N
2711	SPECIFIC_DAY	3	8	2010-01-29	303	1523	\N
2712	SPECIFIC_DAY	3	8	2010-01-04	303	1523	\N
2713	SPECIFIC_DAY	3	8	2010-01-13	303	1523	\N
2714	SPECIFIC_DAY	3	8	2010-02-13	303	1523	\N
2715	SPECIFIC_DAY	3	8	2010-02-15	303	1523	\N
2716	SPECIFIC_DAY	3	8	2010-04-11	303	1523	\N
2717	SPECIFIC_DAY	3	8	2009-12-24	303	1523	\N
2718	SPECIFIC_DAY	3	8	2010-02-19	303	1523	\N
2719	SPECIFIC_DAY	3	8	2010-04-12	303	1523	\N
2720	SPECIFIC_DAY	3	8	2010-04-17	303	1523	\N
2721	SPECIFIC_DAY	3	8	2010-03-08	303	1523	\N
2722	SPECIFIC_DAY	3	8	2010-03-05	303	1523	\N
2723	SPECIFIC_DAY	3	8	2010-03-18	303	1523	\N
2724	SPECIFIC_DAY	3	8	2010-01-27	303	1523	\N
2725	SPECIFIC_DAY	3	8	2010-02-01	303	1523	\N
2726	SPECIFIC_DAY	3	8	2010-04-13	303	1523	\N
2727	SPECIFIC_DAY	3	8	2010-03-09	303	1523	\N
2728	SPECIFIC_DAY	3	8	2010-04-15	303	1523	\N
2729	SPECIFIC_DAY	3	8	2010-03-12	303	1523	\N
2730	SPECIFIC_DAY	3	8	2010-01-28	303	1523	\N
2731	SPECIFIC_DAY	3	8	2010-04-05	303	1523	\N
2732	SPECIFIC_DAY	3	8	2010-03-31	303	1523	\N
2733	SPECIFIC_DAY	3	8	2010-01-18	303	1523	\N
2734	SPECIFIC_DAY	3	8	2010-03-24	303	1523	\N
2735	SPECIFIC_DAY	3	8	2010-04-16	303	1523	\N
2736	SPECIFIC_DAY	3	8	2010-01-26	303	1523	\N
2737	SPECIFIC_DAY	3	8	2010-02-07	303	1523	\N
2738	SPECIFIC_DAY	3	8	2010-03-20	303	1523	\N
2739	SPECIFIC_DAY	3	8	2010-02-05	303	1523	\N
2740	SPECIFIC_DAY	3	8	2010-02-04	303	1523	\N
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
1522
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
28
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
505	4	1000	1.00	f	405
523	1	200	1.00	f	440
506	4	1000	1.00	f	406
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
623	439
606	404
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, name, label_type_id) FROM stdin;
808	1	baja	707
810	1	media	707
809	3	urgente	707
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, name) FROM stdin;
707	1	prioridade
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
405	809
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, customer) FROM stdin;
404	Coca-cola	\N
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, initdate, enddate, mandatoryinit, mandatoryend, description, code, parent, positionincontainer) FROM stdin;
404	4	Pedido	2009-10-26 11:41:15.47	\N	f	f	Descripcion 1	ec1	\N	\N
406	4	eo2	\N	\N	f	f	\N	ec2	404	1
439	1	oe1	\N	\N	f	f	\N	ec1	404	0
405	4	oe1 (copy)	\N	\N	f	f	\N	ec1 (copy)	439	0
440	1	New order element	\N	\N	f	f	\N	ec2	439	1
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid) FROM stdin;
405
406
440
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
404
439
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, calendar) FROM stdin;
303	1	\N
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
1516	3	1.00	1416	\N
1520	3	1.00	1416	\N
1522	0	1.00	1418	\N
1523	3	1.00	1416	\N
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
1516	303
1520	303
1523	303
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, hoursgroup, calculatedvalue) FROM stdin;
1418	506	1
1416	505	1
1417	523	1
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, shareofhours, name, notes, startdate, enddate, order_element_id, parent, base_calendar_id, positioninparent) FROM stdin;
1418	4	\N	eo2	\N	2009-10-26 00:00:00	2010-02-28 00:00:00	406	1414	\N	1
1415	4	\N	oe1	\N	2009-10-26 11:41:15.47	2010-04-22 00:00:00	439	1414	\N	0
1416	4	\N	oe1 (copy)	\N	2009-12-18 00:00:00	2010-04-22 00:00:00	405	1415	\N	0
1417	4	\N	New order element	\N	2009-10-26 11:41:15.47	2009-11-03 19:41:15.47	440	1415	\N	1
1414	4	\N	\N	\N	2009-10-26 00:00:00	2010-04-22 00:00:00	404	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
1414
1415
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
303	Javier	Moran	78736622D
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


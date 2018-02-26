--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: advanceassignmenttemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advanceassignmenttemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    advance_type_id bigint,
    order_element_template_id bigint,
    reportglobaladvance boolean,
    maxvalue numeric(19,2)
);


ALTER TABLE public.advanceassignmenttemplate OWNER TO naval;

--
-- Name: advancemeasurement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancemeasurement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    advance_assignment_id bigint,
    communicationdate timestamp without time zone
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
    percentage boolean,
    qualityform boolean
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
    code character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.basecalendar OWNER TO naval;

--
-- Name: calendaravailability; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendaravailability (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate date,
    enddate date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendaravailability OWNER TO naval;

--
-- Name: calendardata; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendardata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    parent bigint,
    expiringdate date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendardata OWNER TO naval;

--
-- Name: calendarexception; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexception (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    date date,
    duration integer,
    calendar_exception_id bigint,
    base_calendar_id bigint
);


ALTER TABLE public.calendarexception OWNER TO naval;

--
-- Name: calendarexceptiontype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexceptiontype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    color character varying(255),
    notassignable boolean
);


ALTER TABLE public.calendarexceptiontype OWNER TO naval;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE configuration (
    id bigint NOT NULL,
    version bigint NOT NULL,
    configuration_id bigint,
    companycode character varying(255),
    generatecodeforcriterion boolean NOT NULL,
    generatecodeforlabel boolean NOT NULL,
    generatecodeforworkreport boolean NOT NULL,
    generatecodeforresources boolean NOT NULL,
    generatecodefortypesofworkhours boolean NOT NULL,
    generatecodeformaterialcategories boolean NOT NULL,
    generatecodeforunittypes boolean NOT NULL,
    expandcompanyplanningviewcharts boolean NOT NULL,
    expandorderplanningviewcharts boolean NOT NULL,
    expandresourceloadviewcharts boolean NOT NULL
);


ALTER TABLE public.configuration OWNER TO naval;

--
-- Name: consolidatedvalue; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE consolidatedvalue (
    id bigint NOT NULL,
    consolidated_value_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    taskenddate date,
    consolidation_id bigint,
    advance_measurement_id bigint
);


ALTER TABLE public.consolidatedvalue OWNER TO naval;

--
-- Name: consolidation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE consolidation (
    id bigint NOT NULL,
    consolidation_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    dir_advance_assignment_id bigint,
    ind_advance_assignment_id bigint
);


ALTER TABLE public.consolidation OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    enabled boolean
);


ALTER TABLE public.cost_category OWNER TO naval;

--
-- Name: criterion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    active boolean,
    id_criterion_type bigint NOT NULL,
    parent bigint,
    predefinedcriterioninternalname character varying(255)
);


ALTER TABLE public.criterion OWNER TO naval;

--
-- Name: criterionrequirement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionrequirement (
    id bigint NOT NULL,
    criterion_requirement_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    hours_group_id bigint,
    order_element_id bigint,
    order_element_template_id bigint,
    criterion_id bigint,
    parent bigint,
    valid boolean
);


ALTER TABLE public.criterionrequirement OWNER TO naval;

--
-- Name: criterionsatisfaction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionsatisfaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
    name character varying(255),
    description character varying(255),
    allowsimultaneouscriterionsperresource boolean,
    allowhierarchy boolean,
    enabled boolean,
    generatecode boolean NOT NULL,
    resource integer,
    predefinedtypeinternalname character varying(255)
);


ALTER TABLE public.criteriontype OWNER TO naval;

--
-- Name: day_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE day_assignment (
    id bigint NOT NULL,
    day_assignment_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    duration integer NOT NULL,
    consolidated boolean,
    day date NOT NULL,
    resource_id bigint NOT NULL,
    specific_container_id bigint,
    generic_container_id bigint,
    derived_container_id bigint
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
    queue_dependency bigint,
    type integer
);


ALTER TABLE public.dependency OWNER TO naval;

--
-- Name: derivedallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE derivedallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    configurationunit bigint NOT NULL
);


ALTER TABLE public.derivedallocation OWNER TO naval;

--
-- Name: deriveddayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE deriveddayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    derived_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.deriveddayassignmentscontainer OWNER TO naval;

--
-- Name: description_values; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE description_values (
    description_value_id bigint NOT NULL,
    fieldname character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values OWNER TO naval;

--
-- Name: description_values_in_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE description_values_in_line (
    description_value_id bigint NOT NULL,
    fieldname character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values_in_line OWNER TO naval;

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
-- Name: effortperday; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE effortperday (
    base_calendar_id bigint NOT NULL,
    effort integer,
    day_id integer NOT NULL
);


ALTER TABLE public.effortperday OWNER TO naval;

--
-- Name: external_company; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE external_company (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    nif character varying(255),
    client boolean,
    subcontractor boolean,
    interactswithapplications boolean,
    appuri character varying(255),
    ourcompanylogin character varying(255),
    ourcompanypassword character varying(255),
    companyuser bigint
);


ALTER TABLE public.external_company OWNER TO naval;

--
-- Name: generic_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE generic_resource_allocation (
    resource_allocation_id bigint NOT NULL
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: genericdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE genericdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.genericdayassignmentscontainer OWNER TO naval;

--
-- Name: heading_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE heading_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.heading_field OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: naval
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: naval
--

SELECT pg_catalog.setval('hibernate_sequence', 1264, true);


--
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hibernate_unique_key (
    next_hi integer
);


ALTER TABLE public.hibernate_unique_key OWNER TO naval;

--
-- Name: hour_cost; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hour_cost (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    pricecost numeric(19,2),
    initdate date,
    enddate date,
    type_of_work_hours_id bigint,
    cost_category_id bigint
);


ALTER TABLE public.hour_cost OWNER TO naval;

--
-- Name: hoursgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hoursgroup (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    resourcetype character varying(255),
    workinghours integer NOT NULL,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint,
    order_line_template bigint
);


ALTER TABLE public.hoursgroup OWNER TO naval;

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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
    name character varying(255),
    generatecode boolean NOT NULL
);


ALTER TABLE public.label_type OWNER TO naval;

--
-- Name: limiting_resource_queue; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_id bigint
);


ALTER TABLE public.limiting_resource_queue OWNER TO naval;

--
-- Name: limiting_resource_queue_dependency; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue_dependency (
    id bigint NOT NULL,
    type integer,
    origin_queue_element_id bigint,
    destiny_queue_element_id bigint
);


ALTER TABLE public.limiting_resource_queue_dependency OWNER TO naval;

--
-- Name: limiting_resource_queue_element; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    limiting_resource_queue_id bigint,
    earlier_start_date_because_of_gantt timestamp without time zone,
    earliest_end_date_because_of_gantt timestamp without time zone,
    creation_timestamp bigint,
    start_date date,
    start_hour integer,
    end_date date,
    end_hour integer
);


ALTER TABLE public.limiting_resource_queue_element OWNER TO naval;

--
-- Name: line_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE line_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.line_field OWNER TO naval;

--
-- Name: machine; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine (
    machine_id bigint NOT NULL,
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
-- Name: material; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    default_unit_price numeric(19,2),
    unit_type bigint,
    disabled boolean,
    category_id bigint
);


ALTER TABLE public.material OWNER TO naval;

--
-- Name: material_assigment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units double precision,
    unit_price numeric(19,2),
    material_id bigint,
    estimated_availability timestamp without time zone,
    status integer,
    order_element_id bigint
);


ALTER TABLE public.material_assigment OWNER TO naval;

--
-- Name: material_assigment_template; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_assigment_template (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units double precision,
    unit_price numeric(19,2),
    material_id bigint,
    order_element_template_id bigint
);


ALTER TABLE public.material_assigment_template OWNER TO naval;

--
-- Name: material_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    generatecode boolean NOT NULL,
    parent_id bigint
);


ALTER TABLE public.material_category OWNER TO naval;

--
-- Name: naval_profile; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE naval_profile (
    id bigint NOT NULL,
    version bigint NOT NULL,
    profilename character varying(255) NOT NULL
);


ALTER TABLE public.naval_profile OWNER TO naval;

--
-- Name: naval_user; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE naval_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    loginname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    disabled boolean,
    lastconnectedscenario bigint
);


ALTER TABLE public.naval_user OWNER TO naval;

--
-- Name: order_authorization; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_authorization (
    id bigint NOT NULL,
    order_authorization_subclass character varying(255) NOT NULL,
    version bigint NOT NULL,
    authorizationtype character varying(255) NOT NULL,
    order_id bigint,
    user_id bigint,
    profile_id bigint
);


ALTER TABLE public.order_authorization OWNER TO naval;

--
-- Name: order_element_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_label (
    order_element_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_label OWNER TO naval;

--
-- Name: order_element_template_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_template_label (
    order_element_template_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_label OWNER TO naval;

--
-- Name: order_element_template_quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_template_quality_form (
    order_element_template_id bigint NOT NULL,
    quality_form_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_quality_form OWNER TO naval;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_table (
    orderelementid bigint NOT NULL,
    responsible character varying(255),
    dependenciesconstraintshavepriority boolean,
    codeautogenerated boolean,
    lastorderelementsequencecode integer,
    workbudget numeric(19,2),
    materialsbudget numeric(19,2),
    totalhours integer,
    customerreference character varying(255),
    externalcode character varying(255),
    state integer,
    customer bigint,
    base_calendar_id bigint
);


ALTER TABLE public.order_table OWNER TO naval;

--
-- Name: orderelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    code character varying(255),
    initdate timestamp without time zone,
    deadline timestamp without time zone,
    lastadvancemeausurementforspreading numeric(19,2),
    dirtylastadvancemeasurementforspreading boolean,
    parent bigint,
    template bigint,
    externalcode character varying(255),
    positionincontainer integer,
    sum_charged_hours_id bigint
);


ALTER TABLE public.orderelement OWNER TO naval;

--
-- Name: orderelementtemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderelementtemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    code character varying(255),
    startasdaysfrombeginning integer,
    deadlineasdaysfrombeginning integer,
    schedulingstatetype integer,
    parent bigint,
    positionincontainer integer
);


ALTER TABLE public.orderelementtemplate OWNER TO naval;

--
-- Name: orderline; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderline (
    orderelementid bigint NOT NULL,
    lasthoursgroupsequencecode integer
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
-- Name: orderlinegrouptemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinegrouptemplate (
    group_template_id bigint NOT NULL
);


ALTER TABLE public.orderlinegrouptemplate OWNER TO naval;

--
-- Name: orderlinetemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinetemplate (
    order_line_template_id bigint NOT NULL,
    lasthoursgroupsequencecode integer
);


ALTER TABLE public.orderlinetemplate OWNER TO naval;

--
-- Name: ordersequence; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE ordersequence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    prefix character varying(255),
    lastvalue integer,
    numberofdigits integer,
    active boolean
);


ALTER TABLE public.ordersequence OWNER TO naval;

--
-- Name: ordertemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE ordertemplate (
    order_template_id bigint NOT NULL,
    base_calendar_id bigint
);


ALTER TABLE public.ordertemplate OWNER TO naval;

--
-- Name: orderversion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderversion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    modificationbyownertimestamp timestamp without time zone,
    ownerscenario bigint
);


ALTER TABLE public.orderversion OWNER TO naval;

--
-- Name: profile_roles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE profile_roles (
    profileid bigint NOT NULL,
    elt character varying(255)
);


ALTER TABLE public.profile_roles OWNER TO naval;

--
-- Name: quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    qualityformtype integer,
    reportadvance boolean,
    advance_type_id bigint
);


ALTER TABLE public.quality_form OWNER TO naval;

--
-- Name: quality_form_items; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE quality_form_items (
    quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    idx integer NOT NULL
);


ALTER TABLE public.quality_form_items OWNER TO naval;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    generatecode boolean NOT NULL,
    limited_resource boolean NOT NULL,
    base_calendar_id bigint
);


ALTER TABLE public.resource OWNER TO naval;

--
-- Name: resourceallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourceallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resourcesperday numeric(19,2),
    intended_total_hours integer,
    originaltotalassignment integer,
    task bigint,
    assignment_function bigint
);


ALTER TABLE public.resourceallocation OWNER TO naval;

--
-- Name: resourcecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourcecalendar (
    base_calendar_id bigint NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.resourcecalendar OWNER TO naval;

--
-- Name: resources_cost_category_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resources_cost_category_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    initdate date,
    enddate date,
    cost_category_id bigint,
    resource_id bigint
);


ALTER TABLE public.resources_cost_category_assignment OWNER TO naval;

--
-- Name: scenario; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scenario (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    lastnotownedreassignationstimestamp timestamp without time zone,
    predecessor bigint
);


ALTER TABLE public.scenario OWNER TO naval;

--
-- Name: scenario_orders; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scenario_orders (
    order_id bigint NOT NULL,
    order_version_id bigint NOT NULL,
    scenario_id bigint NOT NULL
);


ALTER TABLE public.scenario_orders OWNER TO naval;

--
-- Name: scheduling_states_by_order_version; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scheduling_states_by_order_version (
    order_element_id bigint NOT NULL,
    scheduling_state_for_version_id bigint NOT NULL,
    order_version_id bigint NOT NULL
);


ALTER TABLE public.scheduling_states_by_order_version OWNER TO naval;

--
-- Name: schedulingdataforversion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE schedulingdataforversion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    schedulingstatetype integer,
    order_element_id bigint
);


ALTER TABLE public.schedulingdataforversion OWNER TO naval;

--
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO naval;

--
-- Name: specificdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specificdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.specificdayassignmentscontainer OWNER TO naval;

--
-- Name: stretches; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE stretches (
    assignment_function_id bigint NOT NULL,
    date date NOT NULL,
    lengthpercentage numeric(19,2) NOT NULL,
    amountworkpercentage numeric(19,2) NOT NULL,
    stretch_position integer NOT NULL
);


ALTER TABLE public.stretches OWNER TO naval;

--
-- Name: stretchesfunction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE stretchesfunction (
    assignment_function_id bigint NOT NULL,
    type integer
);


ALTER TABLE public.stretchesfunction OWNER TO naval;

--
-- Name: subcontractedtaskdata; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE subcontractedtaskdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    externalcompany bigint,
    subcontratationdate timestamp without time zone,
    subcontractcommunicationdate timestamp without time zone,
    workdescription character varying(255),
    subcontractprice numeric(19,2),
    subcontractedcode character varying(255),
    nodewithoutchildrenexported boolean,
    labelsexported boolean,
    materialassignmentsexported boolean,
    hoursgroupsexported boolean,
    state integer
);


ALTER TABLE public.subcontractedtaskdata OWNER TO naval;

--
-- Name: sumchargedhours; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE sumchargedhours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    directchargedhours integer,
    indirectchargedhours integer
);


ALTER TABLE public.sumchargedhours OWNER TO naval;

--
-- Name: task; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    calculatedvalue integer,
    startconstrainttype integer,
    constraintdate timestamp without time zone,
    subcontrated_task_data_id bigint,
    priority integer
);


ALTER TABLE public.task OWNER TO naval;

--
-- Name: task_quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    quality_form_id bigint,
    order_element_id bigint,
    reportadvance boolean
);


ALTER TABLE public.task_quality_form OWNER TO naval;

--
-- Name: task_quality_form_items; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_quality_form_items (
    task_quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    passed boolean,
    date timestamp without time zone,
    idx integer NOT NULL
);


ALTER TABLE public.task_quality_form_items OWNER TO naval;

--
-- Name: task_source_hours_groups; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_source_hours_groups (
    task_source_id bigint NOT NULL,
    hours_group_id bigint NOT NULL
);


ALTER TABLE public.task_source_hours_groups OWNER TO naval;

--
-- Name: taskelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    notes character varying(255),
    startdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone NOT NULL,
    deadline date,
    advance_percentage numeric(19,2),
    parent bigint,
    base_calendar_id bigint,
    positioninparent integer,
    startdayduration integer,
    enddayduration integer
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
    task_element_id bigint NOT NULL,
    startconstrainttype integer,
    constraintdate timestamp without time zone
);


ALTER TABLE public.taskmilestone OWNER TO naval;

--
-- Name: tasksource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE tasksource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    schedulingdata bigint
);


ALTER TABLE public.tasksource OWNER TO naval;

--
-- Name: type_of_work_hours; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE type_of_work_hours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    defaultprice numeric(19,2),
    enabled boolean,
    generatecode boolean NOT NULL
);


ALTER TABLE public.type_of_work_hours OWNER TO naval;

--
-- Name: unit_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE unit_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    measure character varying(255),
    generatecode boolean NOT NULL
);


ALTER TABLE public.unit_type OWNER TO naval;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE user_profiles (
    user_id bigint NOT NULL,
    profile_id bigint NOT NULL
);


ALTER TABLE public.user_profiles OWNER TO naval;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE user_roles (
    userid bigint NOT NULL,
    elt character varying(255)
);


ALTER TABLE public.user_roles OWNER TO naval;

--
-- Name: virtualworker; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE virtualworker (
    virtualworker_id bigint NOT NULL,
    observations character varying(255)
);


ALTER TABLE public.virtualworker OWNER TO naval;

--
-- Name: work_report; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    date timestamp without time zone,
    generatecode boolean NOT NULL,
    work_report_type_id bigint NOT NULL,
    resource_id bigint,
    order_element_id bigint
);


ALTER TABLE public.work_report OWNER TO naval;

--
-- Name: work_report_label_type_assigment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_label_type_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    labelssharedbylines boolean,
    positionnumber integer,
    label_type_id bigint,
    label_id bigint,
    work_report_type_id bigint
);


ALTER TABLE public.work_report_label_type_assigment OWNER TO naval;

--
-- Name: work_report_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_line (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    numhours integer,
    date timestamp without time zone,
    clockstart integer,
    clockfinish integer,
    work_report_id bigint,
    resource_id bigint NOT NULL,
    order_element_id bigint NOT NULL,
    type_work_hours_id bigint NOT NULL
);


ALTER TABLE public.work_report_line OWNER TO naval;

--
-- Name: work_report_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    dateissharedbylines boolean,
    resourceissharedinlines boolean,
    orderelementissharedinlines boolean,
    hoursmanagement integer
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
-- Name: workreports_labels; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE workreports_labels (
    work_report_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreports_labels OWNER TO naval;

--
-- Name: workreportslines_labels; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE workreportslines_labels (
    work_report_line_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreportslines_labels OWNER TO naval;

--
-- Data for Name: advanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignment (id, version, reportglobaladvance, advance_type_id) FROM stdin;
878804	5	t	809
878805	5	t	809
878806	5	t	809
878801	5	t	809
878802	5	t	809
878803	5	t	809
878807	2	f	809
878808	2	t	808
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
743130	1	809	743376	t	100.00
743131	1	809	743377	t	100.00
743132	1	809	743378	t	100.00
743133	1	809	743380	t	100.00
743134	1	809	743381	t	100.00
743135	1	809	743382	t	100.00
743136	1	809	743383	t	100.00
743137	1	809	743384	t	100.00
743138	1	809	743386	t	100.00
743139	1	809	743387	t	100.00
743140	1	809	743388	t	100.00
743141	1	809	743389	t	100.00
743142	1	809	743391	t	100.00
743143	1	809	743392	t	100.00
743144	1	809	743393	t	100.00
743145	1	809	743394	t	100.00
743146	1	809	743396	t	100.00
743147	1	809	743397	t	100.00
743148	1	809	743398	t	100.00
743149	1	809	743399	t	100.00
743150	1	809	743400	t	100.00
743151	1	809	743402	t	100.00
743152	1	809	743403	t	100.00
743153	1	809	743404	t	100.00
743154	1	809	743405	t	100.00
743155	1	809	743406	t	100.00
743156	1	809	743408	t	100.00
743157	1	809	743409	t	100.00
743562	1	809	743410	t	100.00
743563	1	809	743411	t	100.00
743564	1	809	743412	t	100.00
743565	1	809	743414	t	100.00
743566	1	809	743415	t	100.00
743567	1	809	743416	t	100.00
743568	1	809	743417	t	100.00
743569	1	809	743419	t	100.00
743570	1	809	743420	t	100.00
743571	1	809	743421	t	100.00
743572	1	809	743422	t	100.00
743573	1	809	743423	t	100.00
743574	1	809	743425	t	100.00
743575	1	809	743426	t	100.00
743576	1	809	743427	t	100.00
743577	1	809	743428	t	100.00
743578	1	809	743429	t	100.00
743579	1	809	743431	t	100.00
743580	1	809	743432	t	100.00
743581	1	809	743433	t	100.00
743582	1	809	743434	t	100.00
743583	1	809	743435	t	100.00
743584	1	809	743437	t	100.00
743585	1	809	743438	t	100.00
743586	1	809	743439	t	100.00
743587	1	809	743440	t	100.00
743588	1	809	743441	t	100.00
743589	1	809	743443	t	100.00
743590	1	809	743444	t	100.00
743591	1	809	743445	t	100.00
745685	1	809	745504	t	100.00
745686	1	809	745505	t	100.00
745687	1	809	745506	t	100.00
745688	1	809	745507	t	100.00
745689	1	809	745508	t	100.00
745690	1	809	745509	t	100.00
745691	1	809	745512	t	100.00
745692	1	809	745513	t	100.00
745693	1	809	745514	t	100.00
745694	1	809	745515	t	100.00
745695	1	809	745516	t	100.00
745696	1	809	745517	t	100.00
745697	1	809	745520	t	100.00
745698	1	809	745521	t	100.00
745699	1	809	745522	t	100.00
745700	1	809	745523	t	100.00
745701	1	809	745524	t	100.00
745702	1	809	745525	t	100.00
745703	1	809	745530	t	100.00
745704	1	809	745531	t	100.00
745705	1	809	745532	t	100.00
745706	1	809	745533	t	100.00
745707	1	809	745534	t	100.00
745708	1	809	745535	t	100.00
745709	1	809	745536	t	100.00
745710	1	809	745537	t	100.00
745711	1	809	745538	t	100.00
745712	1	809	745539	t	100.00
745713	1	809	745541	t	100.00
745714	1	809	745542	t	100.00
745715	1	809	745543	t	100.00
745716	1	809	745544	t	100.00
745717	1	809	745545	t	100.00
745718	1	809	745548	t	100.00
745719	1	809	745549	t	100.00
745720	1	809	745552	t	100.00
745721	1	809	745553	t	100.00
745722	1	809	745554	t	100.00
745723	1	809	745555	t	100.00
745724	1	809	745556	t	100.00
745725	1	809	745559	t	100.00
745726	1	809	745560	t	100.00
745727	1	809	745561	t	100.00
745728	1	809	745562	t	100.00
745729	1	809	745563	t	100.00
745730	1	809	745565	t	100.00
745731	1	809	745566	t	100.00
745732	1	809	745567	t	100.00
745733	1	809	745568	t	100.00
745734	1	809	745569	t	100.00
745735	1	809	745571	t	100.00
745736	1	809	745572	t	100.00
745737	1	809	745573	t	100.00
745738	1	809	745574	t	100.00
745739	1	809	745575	t	100.00
745740	1	809	745577	t	100.00
745741	1	809	745578	t	100.00
745742	1	809	745579	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
808	4	children	100.0000	f	0.0100	t	t	f
809	3	percentage	100.0000	f	0.0100	t	t	f
810	2	units	2147483647.0000	f	1.0000	t	f	f
811	1	subcontractor	100.0000	f	0.0100	t	t	f
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

COPY basecalendar (id, version, code, name) FROM stdin;
1	1	31404382-5940-43f3-a811-380cc64a1445	Default
5	2	147f2bc1-7cd4-49e3-9086-d314fd23392d	\N
3	2	0ee8cb6e-5774-428f-9e04-8b56de741d9a	\N
6	2	504e3e70-198f-40d2-930b-e6cbb7a117ad	\N
4	2	4e0fead7-3c0c-4b17-8d5b-e47378dda049	\N
728412	1	ef03781d-041a-4869-8468-5476ed669968	\N
2	4	32f92550-0856-4f50-9714-6e7c5bfa777f	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1316	2	2010-07-29	\N	5	0
1314	2	2010-07-29	\N	3	0
1317	2	2010-07-29	\N	6	0
1315	2	2010-07-29	\N	4	0
728614	1	2010-07-30	\N	728412	0
1313	4	2010-07-29	\N	2	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
101	1	2a940545-5c02-4ac4-bc69-e908212308cb	\N	\N	1	0
105	2	b99c5990-ed0c-42a2-97a4-2c1ebe17212d	1	\N	5	0
103	2	464ce609-e17e-4f2d-840e-3d7afe96d066	1	\N	3	0
106	2	0187f674-7365-4144-80ef-3342ede73d9e	1	\N	6	0
104	2	d3b6d5e5-2468-4b02-8375-8351dd9075f2	1	\N	4	0
728513	1	5cbca47f-c7ee-4a75-b8c7-d3d4d96a7f48	1	\N	728412	0
102	4	4f8a4e98-5e53-44ab-a468-6bdf7927bfcc	1	\N	2	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, duration, calendar_exception_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable) FROM stdin;
606	6	HOLIDAY	HOLIDAY	red	t
607	5	SICK_LEAVE	SICK_LEAVE	red	t
608	4	LEAVE	LEAVE	red	t
609	3	STRIKE	STRIKE	red	t
610	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t
611	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts) FROM stdin;
202	2	1	COMPANY_CODE	t	t	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, taskenddate, consolidation_id, advance_measurement_id) FROM stdin;
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, code, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent, predefinedcriterioninternalname) FROM stdin;
505	14	32a0fd84-802d-44d7-a67b-29699e655566	medicalLeave	t	131072	\N	\N
506	13	c8c3ea3a-058e-49f2-bf5f-694d92d2cfd9	paternityLeave	t	131072	\N	\N
507	4	565b362a-29d1-438e-93be-f220af24824d	hiredResourceWorkingRelationship	t	131076	\N	\N
508	3	8ebd3b38-94d6-4fba-8e3d-91d713f991bf	firedResourceWorkingRelationship	t	131076	\N	\N
509	1	ec514ca5-45f8-4e87-bbab-6d61f94e3566	Wireless	t	131078	\N	\N
510	1	405f3b60-a4cd-46e2-9474-b3abc21d6335	GSI	t	131078	\N	\N
511	1	dec276c6-9afb-418f-bd7d-b8cd79767718	Igalia	t	131078	\N	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
745611	DIRECT	1	\N	\N	745501	511	\N	\N
745612	INDIRECT	1	\N	\N	745502	511	745611	t
745613	DIRECT	1	\N	\N	745503	510	\N	\N
745614	INDIRECT	1	\N	\N	745503	511	745611	t
745615	INDIRECT	1	\N	\N	745504	510	745613	t
745616	INDIRECT	1	\N	\N	745504	511	745611	t
745617	INDIRECT	1	745786	\N	\N	511	745611	t
745618	INDIRECT	1	745786	\N	\N	510	745613	t
745619	INDIRECT	1	\N	\N	745505	511	745611	t
745620	INDIRECT	1	\N	\N	745505	510	745613	t
745621	INDIRECT	1	745787	\N	\N	510	745613	t
745622	INDIRECT	1	745787	\N	\N	511	745611	t
745623	INDIRECT	1	\N	\N	745506	511	745611	t
745624	INDIRECT	1	\N	\N	745506	510	745613	t
745625	INDIRECT	1	745788	\N	\N	511	745611	t
745626	INDIRECT	1	745788	\N	\N	510	745613	t
745627	INDIRECT	1	\N	\N	745507	511	745611	t
745628	INDIRECT	1	\N	\N	745507	510	745613	t
745629	INDIRECT	1	745789	\N	\N	510	745613	t
745630	INDIRECT	1	745789	\N	\N	511	745611	t
745631	INDIRECT	1	\N	\N	745508	511	745611	t
745632	INDIRECT	1	\N	\N	745508	510	745613	t
745633	INDIRECT	1	745790	\N	\N	510	745613	t
745634	INDIRECT	1	745790	\N	\N	511	745611	t
745635	INDIRECT	1	\N	\N	745509	511	745611	t
745636	INDIRECT	1	745791	\N	\N	511	745611	t
745637	INDIRECT	1	\N	\N	745510	511	745611	t
745638	DIRECT	1	\N	\N	745511	510	\N	\N
745639	INDIRECT	1	\N	\N	745511	511	745611	t
743342	DIRECT	1	\N	\N	743379	511	\N	\N
743343	INDIRECT	1	\N	\N	743380	511	743342	t
743344	INDIRECT	1	743234	\N	\N	511	743342	t
743345	INDIRECT	1	\N	\N	743381	511	743342	t
743346	INDIRECT	1	743235	\N	\N	511	743342	t
743347	INDIRECT	1	\N	\N	743382	511	743342	t
743348	INDIRECT	1	743236	\N	\N	511	743342	t
743349	INDIRECT	1	\N	\N	743383	511	743342	t
743350	INDIRECT	1	743237	\N	\N	511	743342	t
743351	INDIRECT	1	\N	\N	743384	511	743342	t
743352	INDIRECT	1	743238	\N	\N	511	743342	t
743353	DIRECT	1	\N	\N	743390	511	\N	\N
743354	INDIRECT	1	\N	\N	743391	511	743353	t
743355	INDIRECT	1	743243	\N	\N	511	743353	t
743356	INDIRECT	1	\N	\N	743392	511	743353	t
743357	INDIRECT	1	743244	\N	\N	511	743353	t
743358	INDIRECT	1	\N	\N	743393	511	743353	t
743359	INDIRECT	1	743245	\N	\N	511	743353	t
743461	INDIRECT	1	\N	\N	743394	511	743353	t
743462	INDIRECT	1	743246	\N	\N	511	743353	t
743463	DIRECT	1	\N	\N	743395	510	\N	\N
743464	INDIRECT	1	\N	\N	743396	510	743463	t
743465	INDIRECT	1	743247	\N	\N	510	743463	t
743466	INDIRECT	1	\N	\N	743397	510	743463	t
743467	INDIRECT	1	743248	\N	\N	510	743463	t
743468	INDIRECT	1	\N	\N	743398	510	743463	t
743469	INDIRECT	1	743249	\N	\N	510	743463	t
743470	INDIRECT	1	\N	\N	743399	510	743463	t
743471	INDIRECT	1	743250	\N	\N	510	743463	t
743472	INDIRECT	1	\N	\N	743400	510	743463	t
743473	INDIRECT	1	743251	\N	\N	510	743463	t
743474	DIRECT	1	\N	\N	743401	510	\N	\N
743475	INDIRECT	1	\N	\N	743402	510	743474	t
743476	INDIRECT	1	743252	\N	\N	510	743474	t
743477	INDIRECT	1	\N	\N	743403	510	743474	t
743478	INDIRECT	1	743253	\N	\N	510	743474	t
743479	INDIRECT	1	\N	\N	743404	510	743474	t
743480	INDIRECT	1	743254	\N	\N	510	743474	t
743481	INDIRECT	1	\N	\N	743405	510	743474	t
743482	INDIRECT	1	743255	\N	\N	510	743474	t
743483	INDIRECT	1	\N	\N	743406	510	743474	t
743484	INDIRECT	1	743256	\N	\N	510	743474	t
743485	DIRECT	1	\N	\N	743407	511	\N	\N
743486	INDIRECT	1	\N	\N	743408	511	743485	t
743487	INDIRECT	1	743257	\N	\N	511	743485	t
743488	INDIRECT	1	\N	\N	743409	511	743485	t
743489	INDIRECT	1	743258	\N	\N	511	743485	t
743490	INDIRECT	1	\N	\N	743410	511	743485	t
743491	INDIRECT	1	743663	\N	\N	511	743485	t
743492	INDIRECT	1	\N	\N	743411	511	743485	t
743493	INDIRECT	1	743664	\N	\N	511	743485	t
743494	INDIRECT	1	\N	\N	743412	511	743485	t
743495	INDIRECT	1	743665	\N	\N	511	743485	t
743496	DIRECT	1	\N	\N	743413	511	\N	\N
743497	INDIRECT	1	\N	\N	743414	511	743496	t
743498	INDIRECT	1	743666	\N	\N	511	743496	t
743499	INDIRECT	1	\N	\N	743415	511	743496	t
743500	INDIRECT	1	743667	\N	\N	511	743496	t
743501	INDIRECT	1	\N	\N	743416	511	743496	t
743502	INDIRECT	1	743668	\N	\N	511	743496	t
743503	INDIRECT	1	\N	\N	743417	511	743496	t
743504	INDIRECT	1	743669	\N	\N	511	743496	t
743505	DIRECT	1	\N	\N	743418	511	\N	\N
743506	INDIRECT	1	\N	\N	743419	511	743505	t
743507	INDIRECT	1	743670	\N	\N	511	743505	t
743508	INDIRECT	1	\N	\N	743420	511	743505	t
743509	INDIRECT	1	743671	\N	\N	511	743505	t
743510	INDIRECT	1	\N	\N	743421	511	743505	t
743511	INDIRECT	1	743672	\N	\N	511	743505	t
743512	INDIRECT	1	\N	\N	743422	511	743505	t
743513	INDIRECT	1	743673	\N	\N	511	743505	t
743514	INDIRECT	1	\N	\N	743423	511	743505	t
743515	INDIRECT	1	743674	\N	\N	511	743505	t
743516	DIRECT	1	\N	\N	743424	511	\N	\N
743517	INDIRECT	1	\N	\N	743425	511	743516	t
743518	INDIRECT	1	743675	\N	\N	511	743516	t
743519	INDIRECT	1	\N	\N	743426	511	743516	t
743520	INDIRECT	1	743676	\N	\N	511	743516	t
743521	INDIRECT	1	\N	\N	743427	511	743516	t
743522	INDIRECT	1	743677	\N	\N	511	743516	t
743523	INDIRECT	1	\N	\N	743428	511	743516	t
743524	INDIRECT	1	743678	\N	\N	511	743516	t
743525	INDIRECT	1	\N	\N	743429	511	743516	t
743526	INDIRECT	1	743679	\N	\N	511	743516	t
743527	DIRECT	1	\N	\N	743430	511	\N	\N
743528	INDIRECT	1	\N	\N	743431	511	743527	t
743529	INDIRECT	1	743680	\N	\N	511	743527	t
743530	INDIRECT	1	\N	\N	743432	511	743527	t
743531	INDIRECT	1	743681	\N	\N	511	743527	t
743532	INDIRECT	1	\N	\N	743433	511	743527	t
743533	INDIRECT	1	743682	\N	\N	511	743527	t
743534	INDIRECT	1	\N	\N	743434	511	743527	t
743535	INDIRECT	1	743683	\N	\N	511	743527	t
743536	INDIRECT	1	\N	\N	743435	511	743527	t
743537	INDIRECT	1	743684	\N	\N	511	743527	t
745640	INDIRECT	1	\N	\N	745512	511	745611	t
745641	INDIRECT	1	\N	\N	745512	510	745638	t
745642	INDIRECT	1	745792	\N	\N	511	745611	t
745643	INDIRECT	1	745792	\N	\N	510	745638	t
745644	INDIRECT	1	\N	\N	745513	510	745638	t
745645	INDIRECT	1	\N	\N	745513	511	745611	t
745646	INDIRECT	1	745793	\N	\N	510	745638	t
745647	INDIRECT	1	745793	\N	\N	511	745611	t
745648	INDIRECT	1	\N	\N	745514	510	745638	t
745649	INDIRECT	1	\N	\N	745514	511	745611	t
745650	INDIRECT	1	745794	\N	\N	510	745638	t
745651	INDIRECT	1	745794	\N	\N	511	745611	t
745652	INDIRECT	1	\N	\N	745515	511	745611	t
745653	INDIRECT	1	\N	\N	745515	510	745638	t
745654	INDIRECT	1	745795	\N	\N	511	745611	t
745655	INDIRECT	1	745795	\N	\N	510	745638	t
745656	INDIRECT	1	\N	\N	745516	510	745638	t
745657	INDIRECT	1	\N	\N	745516	511	745611	t
745658	INDIRECT	1	745796	\N	\N	510	745638	t
745659	INDIRECT	1	745796	\N	\N	511	745611	t
745660	INDIRECT	1	\N	\N	745517	511	745611	t
745661	INDIRECT	1	745797	\N	\N	511	745611	t
745662	INDIRECT	1	\N	\N	745518	511	745611	t
745663	INDIRECT	1	\N	\N	745519	511	745611	t
745664	INDIRECT	1	\N	\N	745520	511	745611	t
745665	INDIRECT	1	745798	\N	\N	511	745611	t
745666	INDIRECT	1	\N	\N	745521	511	745611	t
745667	INDIRECT	1	745799	\N	\N	511	745611	t
745668	INDIRECT	1	\N	\N	745522	511	745611	t
745669	INDIRECT	1	745800	\N	\N	511	745611	t
745670	INDIRECT	1	\N	\N	745523	511	745611	t
745671	INDIRECT	1	745801	\N	\N	511	745611	t
745672	INDIRECT	1	\N	\N	745524	511	745611	t
745673	INDIRECT	1	745802	\N	\N	511	745611	t
745674	INDIRECT	1	\N	\N	745525	511	745611	t
745675	INDIRECT	1	745803	\N	\N	511	745611	t
745676	INDIRECT	1	\N	\N	745526	511	745611	t
745677	INDIRECT	1	\N	\N	745527	511	745611	t
745678	INDIRECT	1	\N	\N	745528	511	745611	t
745679	INDIRECT	1	\N	\N	745529	511	745611	t
745680	INDIRECT	1	\N	\N	745530	511	745611	t
745681	INDIRECT	1	745804	\N	\N	511	745611	t
745682	INDIRECT	1	\N	\N	745531	511	745611	t
745885	INDIRECT	1	745805	\N	\N	511	745611	t
745886	INDIRECT	1	\N	\N	745532	511	745611	t
745887	INDIRECT	1	745806	\N	\N	511	745611	t
745888	INDIRECT	1	\N	\N	745533	511	745611	t
745889	INDIRECT	1	745807	\N	\N	511	745611	t
745890	INDIRECT	1	\N	\N	745534	511	745611	t
745891	INDIRECT	1	745808	\N	\N	511	745611	t
745892	INDIRECT	1	\N	\N	745535	511	745611	t
745893	INDIRECT	1	745809	\N	\N	511	745611	t
745894	INDIRECT	1	\N	\N	745536	511	745611	t
745895	INDIRECT	1	745810	\N	\N	511	745611	t
745896	INDIRECT	1	\N	\N	745537	511	745611	t
745897	INDIRECT	1	745811	\N	\N	511	745611	t
745898	INDIRECT	1	\N	\N	745538	511	745611	t
745899	INDIRECT	1	745812	\N	\N	511	745611	t
745900	INDIRECT	1	\N	\N	745539	511	745611	t
745901	INDIRECT	1	745813	\N	\N	511	745611	t
745902	INDIRECT	1	\N	\N	745540	511	745611	t
745903	INDIRECT	1	\N	\N	745541	511	745611	t
745904	INDIRECT	1	745814	\N	\N	511	745611	t
745905	INDIRECT	1	\N	\N	745542	511	745611	t
745906	INDIRECT	1	745815	\N	\N	511	745611	t
745907	INDIRECT	1	\N	\N	745543	511	745611	t
745908	INDIRECT	1	745816	\N	\N	511	745611	t
745909	INDIRECT	1	\N	\N	745544	511	745611	t
745910	INDIRECT	1	745817	\N	\N	511	745611	t
745911	INDIRECT	1	\N	\N	745545	511	745611	t
745912	INDIRECT	1	745818	\N	\N	511	745611	t
745913	INDIRECT	1	\N	\N	745546	511	745611	t
745914	INDIRECT	1	\N	\N	745547	511	745611	t
745915	INDIRECT	1	\N	\N	745548	511	745611	t
745916	INDIRECT	1	745819	\N	\N	511	745611	t
745917	INDIRECT	1	\N	\N	745549	511	745611	t
745918	INDIRECT	1	745820	\N	\N	511	745611	t
745919	INDIRECT	1	\N	\N	745550	511	745611	t
745920	INDIRECT	1	\N	\N	745551	511	745611	t
745921	INDIRECT	1	\N	\N	745552	511	745611	t
745922	INDIRECT	1	745821	\N	\N	511	745611	t
745923	INDIRECT	1	\N	\N	745553	511	745611	t
745924	INDIRECT	1	745822	\N	\N	511	745611	t
745925	INDIRECT	1	\N	\N	745554	511	745611	t
745926	INDIRECT	1	745823	\N	\N	511	745611	t
745927	INDIRECT	1	\N	\N	745555	511	745611	t
745928	INDIRECT	1	745824	\N	\N	511	745611	t
745929	INDIRECT	1	\N	\N	745556	511	745611	t
745930	INDIRECT	1	745825	\N	\N	511	745611	t
745931	INDIRECT	1	\N	\N	745557	511	745611	t
745932	INDIRECT	1	\N	\N	745558	511	745611	t
745933	INDIRECT	1	\N	\N	745559	511	745611	t
745934	INDIRECT	1	745826	\N	\N	511	745611	t
745935	INDIRECT	1	\N	\N	745560	511	745611	t
745936	INDIRECT	1	745827	\N	\N	511	745611	t
745937	INDIRECT	1	\N	\N	745561	511	745611	t
745938	INDIRECT	1	745828	\N	\N	511	745611	t
745939	INDIRECT	1	\N	\N	745562	511	745611	t
745940	INDIRECT	1	745829	\N	\N	511	745611	t
745941	INDIRECT	1	\N	\N	745563	511	745611	t
745942	INDIRECT	1	745830	\N	\N	511	745611	t
745943	INDIRECT	1	\N	\N	745564	511	745611	t
745944	INDIRECT	1	\N	\N	745565	511	745611	t
745945	INDIRECT	1	745831	\N	\N	511	745611	t
745946	INDIRECT	1	\N	\N	745566	511	745611	t
745947	INDIRECT	1	745832	\N	\N	511	745611	t
745948	INDIRECT	1	\N	\N	745567	511	745611	t
745949	INDIRECT	1	745833	\N	\N	511	745611	t
745950	INDIRECT	1	\N	\N	745568	511	745611	t
745951	INDIRECT	1	745834	\N	\N	511	745611	t
745952	INDIRECT	1	\N	\N	745569	511	745611	t
745953	INDIRECT	1	745835	\N	\N	511	745611	t
745954	INDIRECT	1	\N	\N	745570	511	745611	t
745955	INDIRECT	1	\N	\N	745571	511	745611	t
745956	INDIRECT	1	745836	\N	\N	511	745611	t
745957	INDIRECT	1	\N	\N	745572	511	745611	t
745958	INDIRECT	1	745837	\N	\N	511	745611	t
745959	INDIRECT	1	\N	\N	745573	511	745611	t
745960	INDIRECT	1	745838	\N	\N	511	745611	t
745961	INDIRECT	1	\N	\N	745574	511	745611	t
745962	INDIRECT	1	745839	\N	\N	511	745611	t
745963	INDIRECT	1	\N	\N	745575	511	745611	t
745964	INDIRECT	1	745840	\N	\N	511	745611	t
745965	INDIRECT	1	\N	\N	745576	511	745611	t
745966	INDIRECT	1	\N	\N	745577	511	745611	t
745967	INDIRECT	1	745841	\N	\N	511	745611	t
745968	INDIRECT	1	\N	\N	745578	511	745611	t
745969	INDIRECT	1	745842	\N	\N	511	745611	t
745970	INDIRECT	1	\N	\N	745579	511	745611	t
745971	INDIRECT	1	745843	\N	\N	511	745611	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
152813	1	ba3e08d6-fe99-4e7d-8db2-aa7866a9ca25	2010-07-29 16:12:25.738	\N	f	509	1220
152815	1	0deb1b98-1f90-4be2-b5e7-a04720aaadd4	2010-07-29 16:13:02.494	\N	f	511	1216
152816	1	27a91702-e9b3-4f2a-8250-b7aba6cf0135	2010-07-29 16:13:11.097	\N	f	510	1222
152817	1	68033041-9056-4eec-bbcc-baf912e18045	2010-07-29 16:13:18.967	\N	f	511	1218
152814	3	6fa66ddc-4ddd-4079-b728-bff6e8d6d547	2010-07-29 16:12:46.809	\N	f	511	1214
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource, predefinedtypeinternalname) FROM stdin;
131072	15	284b2fe4-d15e-48f9-a2d5-38934315f200	LEAVE	Leave	f	f	t	f	1	\N
131073	11	91413d31-09e4-4f06-9b49-8d8b6ec1f9fd	CATEGORY	Professional category	t	t	t	f	1	\N
131074	9	c7d27130-7069-4dcd-8ade-d0b75ee199cd	TRAINING	Training courses and labor training	t	t	t	f	1	\N
131075	7	b45a7703-1317-463c-8f9d-07123a999b72	JOB	Job	t	t	t	f	1	\N
131076	5	29943674-565b-4ae7-9297-0e143c612d27	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1	\N
131077	1	445b7eac-a026-4a84-ae60-7d37935a3462	LOCATION_GROUP	Location where the resource work	t	f	t	f	0	\N
131078	1	1a3660ee-2ad7-4ad7-b595-807189b472b3	Empresa	Criterio para agrupar traballadores por empresa de pertenencia	t	t	t	t	0	\N
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, duration, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
\.


--
-- Data for Name: deriveddayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY deriveddayassignmentscontainer (id, version, derived_allocation_id, scenario) FROM stdin;
\.


--
-- Data for Name: description_values; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values (description_value_id, fieldname, value) FROM stdin;
\.


--
-- Data for Name: description_values_in_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values_in_line (description_value_id, fieldname, value) FROM stdin;
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
878806	877228	100.00
878801	877219	100.00
878802	877220	100.00
878803	877223	100.00
878804	877226	100.00
878805	877227	100.00
\.


--
-- Data for Name: effortperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY effortperday (base_calendar_id, effort, day_id) FROM stdin;
101	28800	0
101	28800	1
101	28800	2
101	28800	3
101	28800	4
101	0	5
101	0	6
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
784164	1	Igalia	33333333	t	f	f	\N	\N	\N	1111
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
8714
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
876794	2	462d9ec9-9064-4066-9625-5df9bcadbe8a	WORKER	100	1.00	f	\N	876714
745786	1	37bbdd5e-3a1a-4403-a7bf-0c7118354072	WORKER	0	0.00	f	\N	745504
745787	1	88ca66dc-15a8-4a75-9f47-3920978c4db9	WORKER	0	0.00	f	\N	745505
745788	1	265d43a5-dd0a-4113-acb8-6359e85ea31c	WORKER	0	0.00	f	\N	745506
745789	1	1ffecfda-fbd9-4432-916f-5872375ecb9a	WORKER	0	0.00	f	\N	745507
745790	1	ff989cf9-6637-49a6-a6ce-9f8abaf56c95	WORKER	0	0.00	f	\N	745508
745791	1	6e352a95-f784-47b5-b963-63a5a78f5893	WORKER	0	0.00	f	\N	745509
745792	1	e80b73e4-6fb2-4c14-b633-f00673c37cfa	WORKER	0	0.00	f	\N	745512
745793	1	fe9d2315-b457-4853-8c2e-b1989f9b1ff4	WORKER	0	0.00	f	\N	745513
745794	1	1c063d22-a271-4c0e-82e7-29cef9d78f22	WORKER	0	0.00	f	\N	745514
745795	1	54d19c0c-12e3-4bbf-8edc-6966c0d708b4	WORKER	0	0.00	f	\N	745515
745796	1	52f59709-1c0d-4a1f-a45b-9d5e03c8081f	WORKER	0	0.00	f	\N	745516
745797	1	cb60ec1d-f3bf-4f7d-9768-5b829f2cfb12	WORKER	0	0.00	f	\N	745517
745798	1	750fab30-5f42-4c46-8106-c54adcf641fb	WORKER	0	0.00	f	\N	745520
745799	1	37e8b781-7a8f-4f62-9c71-61d4257b5640	WORKER	0	0.00	f	\N	745521
745800	1	5cace716-ecfc-4746-8ade-080ad7745c76	WORKER	0	0.00	f	\N	745522
745801	1	59a8ef10-2296-4601-b39f-4283e9f53393	WORKER	0	0.00	f	\N	745523
745802	1	8ae60ab8-ad61-48be-b557-d8e229cdbf3c	WORKER	0	0.00	f	\N	745524
745803	1	0c632e4c-9e8b-42fa-bc27-e5313a2ad793	WORKER	0	0.00	f	\N	745525
745804	1	91cb60c2-01c5-441f-b592-55209b2f72b7	WORKER	0	0.00	f	\N	745530
745805	1	780287d2-f814-4bbd-b804-c42a88ec7c03	WORKER	0	0.00	f	\N	745531
745806	1	447748a0-d15e-4d3e-903a-fbbc8ba78d25	WORKER	0	0.00	f	\N	745532
745807	1	bf2d22ae-7eaa-4ed1-918d-a9e101e0266e	WORKER	0	0.00	f	\N	745533
745808	1	20993693-68af-496d-9a3f-cd482f63960f	WORKER	0	0.00	f	\N	745534
745809	1	0cd49bbc-93b0-4f1f-897d-be1c85560013	WORKER	0	0.00	f	\N	745535
745810	1	2ce95b48-4cca-4d27-b9ba-9c2a91350900	WORKER	0	0.00	f	\N	745536
743231	1	e1b1aec1-8f3f-4e14-ac08-2a4af23e37de	WORKER	0	0.00	f	\N	743376
743232	1	a15eaa43-1e75-4e33-9378-416f2730f770	WORKER	0	0.00	f	\N	743377
743233	1	6bdd6ad0-c550-4857-9de8-adec0ae5c245	WORKER	0	0.00	f	\N	743378
743234	1	3f669470-0768-4ba8-912c-5746a505664a	WORKER	0	0.00	f	\N	743380
743235	1	72fd82ea-b513-44d9-b0bb-690fa79d5385	WORKER	0	0.00	f	\N	743381
743236	1	24a2f45d-b1f6-49fb-8a88-a412bcb3cbd4	WORKER	0	0.00	f	\N	743382
743237	1	15421bd0-0372-4229-be24-9a69991b6ca4	WORKER	0	0.00	f	\N	743383
743238	1	5491ac6c-782e-4916-94c0-30bc13784120	WORKER	0	0.00	f	\N	743384
743239	1	7e188aec-114a-46f8-bd2b-a70e45e308e9	WORKER	0	0.00	f	\N	743386
743240	1	fb8450c2-d02c-4c8b-b87b-b24fc1e0a08c	WORKER	0	0.00	f	\N	743387
743241	1	edb2575a-3114-437a-b217-4dc32450dd03	WORKER	0	0.00	f	\N	743388
743242	1	e0eb0134-0fe9-489a-9fe2-ec9b610812a8	WORKER	0	0.00	f	\N	743389
743243	1	1f95ddaf-8bf4-4262-95e4-6b3507304494	WORKER	0	0.00	f	\N	743391
743244	1	55f5fb41-3cf5-4c35-bf61-11a658935847	WORKER	0	0.00	f	\N	743392
743245	1	16ecc517-dd3e-4d01-a596-bec7add87ff6	WORKER	0	0.00	f	\N	743393
743246	1	6f655205-a418-41ea-b2ee-766a0cf2c73f	WORKER	0	0.00	f	\N	743394
743247	1	31711f54-b794-4bf8-bd44-cb2269a8eea5	WORKER	0	0.00	f	\N	743396
743248	1	93fb145d-72b6-469e-a880-326250fb967b	WORKER	0	0.00	f	\N	743397
743249	1	aa4cf8bd-f4c5-455e-872b-804f0e89dc1f	WORKER	0	0.00	f	\N	743398
743250	1	a05dc8af-a634-419e-816d-087d00746754	WORKER	0	0.00	f	\N	743399
743251	1	f3471813-e796-46a4-b588-784c5a5871f6	WORKER	0	0.00	f	\N	743400
743252	1	d4b9edd9-86af-4657-8bb0-b664192dbe2f	WORKER	0	0.00	f	\N	743402
743253	1	03cc3d0c-38a5-4818-b470-030f0327a5a4	WORKER	0	0.00	f	\N	743403
743254	1	f0b35bda-4469-4444-960b-252628df399a	WORKER	0	0.00	f	\N	743404
743255	1	ca5e7092-818d-4db3-a614-b2b55a42fc3f	WORKER	0	0.00	f	\N	743405
743256	1	744a6711-f325-43fb-803a-c73dfa3b7087	WORKER	0	0.00	f	\N	743406
743257	1	f2c89e11-4927-42f7-b1a9-574a7a8573a0	WORKER	0	0.00	f	\N	743408
743258	1	ebde005c-85b0-4b26-a999-341c2462fdc0	WORKER	0	0.00	f	\N	743409
745811	1	908df0da-367d-41d5-a7c6-b30f73dd8317	WORKER	0	0.00	f	\N	745537
876795	2	980f9097-1601-4f30-8c81-a3ef61239ca7	WORKER	100	1.00	f	\N	876716
876796	2	e7730684-765f-4f4a-96bf-e0346669228c	WORKER	100	1.00	f	\N	876717
876797	2	ef376f29-c535-4f99-acdf-4304eca9d249	WORKER	100	1.00	f	\N	876719
876798	2	0f6be644-e033-4772-b852-180b0cb34278	WORKER	100	1.00	f	\N	876720
876799	2	7e6844d5-518b-4d8e-b6d3-09ece9ed4d96	WORKER	100	1.00	f	\N	876721
876800	2	56c5e688-98c0-4b04-b43e-1b71b21974b0	WORKER	100	1.00	f	\N	876722
745812	1	f917e10f-ea05-4060-8dbc-a357b10aa273	WORKER	0	0.00	f	\N	745538
745813	1	f654dc0e-d30f-4115-8df9-68a277222ad7	WORKER	0	0.00	f	\N	745539
745814	1	a5c20e34-2a85-4a85-9435-48aa3a4bf66b	WORKER	0	0.00	f	\N	745541
745815	1	1850a05f-a695-4873-be37-ba144ae6bfb4	WORKER	0	0.00	f	\N	745542
745816	1	4bddd5df-b3c1-4b60-b35c-6fc08e435576	WORKER	0	0.00	f	\N	745543
745817	1	5920a039-7ce1-49c5-bb80-6706998f754c	WORKER	0	0.00	f	\N	745544
745818	1	e6a6a44c-6b59-418c-b143-c0c519ea7832	WORKER	0	0.00	f	\N	745545
745819	1	b0431c7e-73f7-47f4-99ce-85d202a460be	WORKER	0	0.00	f	\N	745548
745820	1	6a7b0282-dd05-4f70-b50d-f93e7715d570	WORKER	0	0.00	f	\N	745549
745821	1	610a2bdc-4151-481f-bc5b-a12d719f81ae	WORKER	0	0.00	f	\N	745552
745822	1	fee37a2d-0e91-45dc-9bda-322441eee450	WORKER	0	0.00	f	\N	745553
743663	1	943ad419-b469-4b87-804b-896d304afd36	WORKER	0	0.00	f	\N	743410
743664	1	7dd3df27-392e-4784-81f7-9c45a0696d50	WORKER	0	0.00	f	\N	743411
743665	1	9d28ee0e-bd8e-4027-a939-e883d496a8ce	WORKER	0	0.00	f	\N	743412
743666	1	647d74ce-81ce-472d-b126-733f409723b4	WORKER	0	0.00	f	\N	743414
743667	1	b0d6c14a-a1ee-4138-ad55-b7eac742e011	WORKER	0	0.00	f	\N	743415
743668	1	ab8e17c1-2ab5-4cf8-ae29-67b3dd4a5893	WORKER	0	0.00	f	\N	743416
743669	1	6df9d8cc-4b39-42de-a12b-25210cbf3776	WORKER	0	0.00	f	\N	743417
743670	1	1846e1f2-1607-495d-bab5-e385a7538caf	WORKER	0	0.00	f	\N	743419
743671	1	49f9cea4-edd3-49ef-8d38-3e7d4f6e4ae4	WORKER	0	0.00	f	\N	743420
743672	1	8baf4f26-29d2-4285-ac84-9067e1116853	WORKER	0	0.00	f	\N	743421
743673	1	5ac2cd66-7955-499a-bf26-b5bac356e65b	WORKER	0	0.00	f	\N	743422
743674	1	30d8fa14-1a11-4b25-b77f-33693116b0ef	WORKER	0	0.00	f	\N	743423
743675	1	ed8f2028-5ea7-488a-ba76-de133cc53555	WORKER	0	0.00	f	\N	743425
743676	1	5517ad7b-577c-4a75-8c3f-91ae7de3c5ca	WORKER	0	0.00	f	\N	743426
743677	1	69a36dde-8ad5-42e2-95bb-aca44e32d967	WORKER	0	0.00	f	\N	743427
743678	1	46af1bff-70ce-4af6-8fb4-6a167b0aaf29	WORKER	0	0.00	f	\N	743428
743679	1	fe30f1a0-32a7-42c6-ba8e-19dd4b8a1b45	WORKER	0	0.00	f	\N	743429
743680	1	7f420e7c-3742-4f95-a399-b94fe11f5202	WORKER	0	0.00	f	\N	743431
743681	1	8e806fca-1fb7-485b-a014-7fab822621a7	WORKER	0	0.00	f	\N	743432
743682	1	95f75990-5522-4d24-906a-abff07d052f1	WORKER	0	0.00	f	\N	743433
743683	1	c25d523b-ff17-497e-9d2e-053854b6775a	WORKER	0	0.00	f	\N	743434
743684	1	100320f8-08b8-483d-aa19-e3f10b2c4dbe	WORKER	0	0.00	f	\N	743435
743685	1	06ae5fc0-6565-4e5d-b355-ad264b708ec4	WORKER	0	0.00	f	\N	743437
743686	1	8015d08b-ef81-48cb-9c6f-48aa88813f3a	WORKER	0	0.00	f	\N	743438
743687	1	fb649117-2b6e-40c4-94f5-85cda6f322f8	WORKER	0	0.00	f	\N	743439
743688	1	40070ae3-1f19-40db-a7bd-60d0ff423d5d	WORKER	0	0.00	f	\N	743440
743689	1	c99c808d-4770-4138-b1e2-6ede56377cd3	WORKER	0	0.00	f	\N	743441
743690	1	d0e5d3c6-b1c3-47a8-8220-d47c097c56f5	WORKER	0	0.00	f	\N	743443
743691	1	254265e7-f15d-4589-8c1d-89dd429af6cb	WORKER	0	0.00	f	\N	743444
743692	1	2850f294-4ae4-4b7c-9916-eaa271e8818b	WORKER	0	0.00	f	\N	743445
745823	1	cc2f8870-ae15-4fc9-93af-081ccda74f3d	WORKER	0	0.00	f	\N	745554
745824	1	9982de6f-bca1-4674-bc92-e797116a6459	WORKER	0	0.00	f	\N	745555
745825	1	611f6830-da4c-49f1-87b3-5e0d3dec3abc	WORKER	0	0.00	f	\N	745556
745826	1	991277e3-bfac-4af7-b0b3-7ab6cffcbc4d	WORKER	0	0.00	f	\N	745559
745827	1	d5665f9c-6487-44d9-b584-eb6c75087c0a	WORKER	0	0.00	f	\N	745560
745828	1	9f4baa5b-fcd8-48ff-a0bf-afb79c26328c	WORKER	0	0.00	f	\N	745561
745829	1	0bf94c75-5560-4679-bf4d-46536b72d5d4	WORKER	0	0.00	f	\N	745562
745830	1	499de07c-b6c2-40d3-9898-63a178490ec7	WORKER	0	0.00	f	\N	745563
745831	1	a850f68f-6b80-446f-94e5-b97cf2cd697d	WORKER	0	0.00	f	\N	745565
745832	1	1696829f-fca2-4e81-9163-fff1a6b6f4c6	WORKER	0	0.00	f	\N	745566
745833	1	d77bd7ea-a99d-440f-b41a-97db34c47042	WORKER	0	0.00	f	\N	745567
745834	1	21fceddf-50ca-4c92-b922-420a943d4d29	WORKER	0	0.00	f	\N	745568
745835	1	4d7930af-f294-4deb-bce9-478624e02883	WORKER	0	0.00	f	\N	745569
745836	1	c9fa1032-962d-4028-8d72-f978cc4bce83	WORKER	0	0.00	f	\N	745571
745837	1	8bc03c4b-ce62-42af-a708-adec195be90e	WORKER	0	0.00	f	\N	745572
745838	1	1c7a40ed-0c29-4c05-8d8e-038067cb13c8	WORKER	0	0.00	f	\N	745573
745839	1	8338302d-67bb-4146-8aee-c828d2c9cf61	WORKER	0	0.00	f	\N	745574
745840	1	08536f08-abd4-45c4-bfaa-f5216b91c433	WORKER	0	0.00	f	\N	745575
745841	1	ad310d98-5ce4-4538-a844-fb8ac95947e0	WORKER	0	0.00	f	\N	745577
745842	1	1aaee5bd-9c03-4aab-9897-03c5d2443e2a	WORKER	0	0.00	f	\N	745578
745843	1	9d0f955b-217d-41a8-88f0-c1b8edf7bc1b	WORKER	0	0.00	f	\N	745579
876801	2	e96c8c92-2073-429b-93f0-a9d50881fd69	WORKER	200	1.00	f	\N	876723
877544	1	9886e622-d4a0-437c-97f3-41d0043089d5	WORKER	100	1.00	f	\N	877724
877545	1	94e1e75c-b050-4259-9c09-00d08de6d640	WORKER	100	1.00	f	\N	877726
877546	1	ddad033e-a4bc-4be4-b3d8-0ce3443a07ab	WORKER	100	1.00	f	\N	877727
877547	1	54dd1110-c809-4901-88a6-776e4980d1c6	WORKER	100	1.00	f	\N	877729
877548	1	6cf39be7-1ece-4544-bba4-ade27d82db83	WORKER	100	1.00	f	\N	877730
877549	1	768b8051-1361-4b9f-a13a-bb2b09c5161f	WORKER	100	1.00	f	\N	877731
877550	1	eba1c22c-98d0-476d-b723-b9c2843f7754	WORKER	100	1.00	f	\N	877732
877551	1	bc00c5f4-3e16-4088-8024-712b14f0f263	WORKER	200	1.00	f	\N	877733
877810	1	f92c1fe8-7d65-47dd-bcd1-da375e7e7a75	WORKER	100	1.00	f	\N	877768
877811	1	5d4692e6-5711-4ff5-8e80-78f536a04bec	WORKER	100	1.00	f	\N	877770
877812	1	ab561b01-9cec-4ed2-b1e7-63274251e64d	WORKER	100	1.00	f	\N	877771
877813	1	ccaf9e8e-cffd-4090-93cd-dd99c3e28137	WORKER	100	1.00	f	\N	877773
877512	8	PREFIX-00011-00001-00001	WORKER	100	1.00	f	877219	\N
877513	8	PREFIX-00011-00007-00001	WORKER	100	1.00	f	877221	\N
877514	8	PREFIX-00011-00008-00001	WORKER	100	1.00	f	877222	\N
877515	8	PREFIX-00011-00009-00001	WORKER	100	1.00	f	877224	\N
877516	8	PREFIX-00011-00010-00001	WORKER	100	1.00	f	877225	\N
877517	8	PREFIX-00011-00004-00001	WORKER	100	1.00	f	877226	\N
877518	8	PREFIX-00011-00005-00001	WORKER	100	1.00	f	877227	\N
877519	8	PREFIX-00011-00006-00001	WORKER	200	1.00	f	877228	\N
877814	1	9b78d781-953f-4db8-a2dd-dfdd422a9fcc	WORKER	100	1.00	f	\N	877774
877815	1	74bf7d70-6354-40bb-b356-bdf33728d7f8	WORKER	100	1.00	f	\N	877775
877816	1	8066f3e1-8e7f-4a94-97a9-4617f12bc470	WORKER	100	1.00	f	\N	877776
877817	1	91e65003-12aa-496c-9902-5e3be78f36d4	WORKER	200	1.00	f	\N	877777
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
878807	877218
878808	877218
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
865166	1	f2524a94-d384-410f-bb46-09f8d7eadee6	Low	865065
865167	9	c7a68eea-4b2b-408a-bcda-7f568af1552e	Medium	865065
865168	26	3017ea1b-3fc9-4082-8d46-188bd9afd274	High	865065
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
865065	1	bc38b67f-a616-42e8-aa48-6d3d77465ed2	Priority	t
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
728715	1	728312
\.


--
-- Data for Name: limiting_resource_queue_dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_dependency (id, type, origin_queue_element_id, destiny_queue_element_id) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
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
\.


--
-- Data for Name: machineworkersconfigurationunit; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkersconfigurationunit (id, version, name, alpha, machine) FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material (id, version, code, description, default_unit_price, unit_type, disabled, category_id) FROM stdin;
880013	1	Plata	Plata	15.00	1010	f	879811
879912	3	Hierro	Hierro	10.00	1010	f	879811
879913	3	Oro	Oro	20.00	1010	f	879811
879914	2	Plastico	Plastico	5.00	1010	f	879812
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
\.


--
-- Data for Name: material_assigment_template; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment_template (id, version, units, unit_price, material_id, order_element_template_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_category (id, version, code, name, generatecode, parent_id) FROM stdin;
909	4	43c1268d-20e2-4b89-bfd9-2c32d7d368b9	Imported materials without category	f	\N
879811	3	0bf27aa3-d6c9-4645-9de6-97d319b77e77	Metalicos	t	\N
879812	3	fb8e995e-a434-44ee-823c-bf0320b99646	Sintéticos	t	\N
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled, lastconnectedscenario) FROM stdin;
1111	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f	\N
1112	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	\N
1113	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f	\N
1114	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f	\N
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
877220	865168
877218	865167
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
876715	865168
877725	865168
877769	865168
878703	865167
\.


--
-- Data for Name: order_element_template_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_quality_form (order_element_template_id, quality_form_id) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, dependenciesconstraintshavepriority, codeautogenerated, lastorderelementsequencecode, workbudget, materialsbudget, totalhours, customerreference, externalcode, state, customer, base_calendar_id) FROM stdin;
877218	\N	\N	t	10	0.00	0.00	900	\N	\N	0	\N	1
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer, sum_charged_hours_id) FROM stdin;
877218	9	Pedido novo	\N	PREFIX-00011	2010-09-07 17:05:14.021	2011-01-17 00:00:00	0.00	f	\N	876713	\N	\N	877319
877219	9	order element 1	\N	PREFIX-00011-00001	\N	\N	0.00	f	877218	876714	\N	0	877320
877221	8	order element 21	\N	PREFIX-00011-00007	\N	\N	0.00	f	877220	876716	\N	0	877322
877222	8	order element 22	\N	PREFIX-00011-00008	\N	\N	0.00	f	877220	876717	\N	1	877323
877224	8	order element 31	\N	PREFIX-00011-00009	\N	\N	0.00	f	877223	876719	\N	0	877325
877225	8	order element 3 (copy)	\N	PREFIX-00011-00010	\N	\N	0.00	f	877223	876720	\N	1	877326
877228	9	order element 2	\N	PREFIX-00011-00006	\N	\N	0.00	f	877218	876723	\N	5	877329
877227	9	order element 1	\N	PREFIX-00011-00005	\N	\N	0.00	f	877218	876722	\N	4	877328
877220	9	order element 2	\N	PREFIX-00011-00002	\N	\N	0.00	f	877218	876715	\N	1	877321
877223	9	order element 3	\N	PREFIX-00011-00003	\N	\N	0.00	f	877218	876718	\N	2	877324
877226	9	order lines 1	\N	PREFIX-00011-00004	\N	\N	0.00	f	877218	876721	\N	3	877327
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
743374	1	Template basic	Proxecto de I+D	PREFIX-00001	0	1110	3	\N	\N
745501	1	Template order element (basic)	\N	PREFIX-00001-00045	\N	\N	3	\N	\N
743375	1	A1 - Coordinacion	\N	PREFIX-00001-00001	\N	\N	3	743374	0
743379	1	A2 - Estudio e analise inicial de estruturas de datos	\N	PREFIX-00001-00005	\N	\N	3	743374	1
743385	1	A3 - Estudio analise modelos planificacion	\N	PREFIX-00001-00011	\N	\N	3	743374	2
743390	1	A4 - Estudio interfaces visualizacion planificacions	\N	PREFIX-00001-00045	\N	\N	3	743374	3
743395	1	A5 - Deseño algoritmos multiobxectivo	\N	PREFIX-00001-00016	\N	\N	3	743374	4
743401	1	A6 - Validacion NavalPlan algoritmos multiobxectivo	\N	PREFIX-00001-00022	\N	\N	3	743374	5
743407	1	A7 -  Simulacion NavalPlan estruturas datos	\N	PREFIX-00001-00028	\N	\N	3	743374	6
743413	1	A8 - Deseño de algoritmos de asignación en modelos de recursos  sobreasignables	\N	PREFIX-00001-00034	\N	\N	3	743374	7
743418	1	A9 - Validación de algoritmos de asignación en modelos de recursos sobreasignables	\N	PREFIX-00001-00039	\N	\N	3	743374	8
743424	1	A10 - Deseño de interfaces de visualizacion e metricas	\N	PREFIX-00001-00052	\N	\N	3	743374	9
743430	1	A11 - Validacion de interfaces de visualizacion	\N	PREFIX-00001-00058	\N	\N	3	743374	10
743436	1	A12 - Conclusions xerais	\N	PREFIX-00001-00064	\N	\N	3	743374	11
743442	1	A13 - Difusion do proxecto	\N	PREFIX-00001-00070	\N	\N	3	743374	12
743376	1	Posta en marcha	\N	PREFIX-00001-00002	\N	\N	0	743375	0
743377	1	Xestion do proxecto	\N	PREFIX-00001-00003	\N	\N	0	743375	1
743378	1	Xestion da I+Dì	\N	PREFIX-00001-00004	\N	\N	0	743375	2
743380	1	Estudo arte datos para modelos planificacion	\N	PREFIX-00001-00006	\N	\N	0	743379	0
743381	1	Estudo da arte estruturas grandes volumes de datos	\N	PREFIX-00001-00007	\N	\N	0	743379	1
743382	1	Analise de tecnicas de compresion da información	\N	PREFIX-00001-00008	\N	\N	0	743379	2
743383	1	Estudio tipos de consultas	\N	PREFIX-00001-00009	\N	\N	0	743379	3
743384	1	Estudio empresas galegas modelos de datos	\N	PREFIX-00001-00010	\N	\N	0	743379	4
743386	1	Documentacion e analise modelos planificacion	\N	PREFIX-00001-00012	\N	\N	0	743385	0
743387	1	Estudio arte algoritmos e heuriticas	\N	PREFIX-00001-00013	\N	\N	0	743385	1
743388	1	Estudio diferentes modelos planificacion empresas galegas	\N	PREFIX-00001-00014	\N	\N	0	743385	2
743389	1	Resumo e conclusións	\N	PREFIX-00001-00015	\N	\N	0	743385	3
743391	1	Estudo arte representacion grafica informacion	\N	PREFIX-00001-00046	\N	\N	0	743390	0
743392	1	Estudio usabilidade aplicacións	\N	PREFIX-00001-00047	\N	\N	0	743390	1
743393	1	Estudo de procedementos e técnicas de monitorización e análise de planificacións	\N	PREFIX-00001-00049	\N	\N	0	743390	2
743394	1	Resumo e conclusións	\N	PREFIX-00001-00051	\N	\N	0	743390	3
743396	1	Documentacion modelo de recursos limitantes naval	\N	PREFIX-00001-00017	\N	\N	0	743395	0
743397	1	Investigacion algoritmos exito potencial	\N	PREFIX-00001-00018	\N	\N	0	743395	1
743398	1	Identificacion obxectivos simultáneos a maximizar interesantes	\N	PREFIX-00001-00019	\N	\N	0	743395	2
743399	1	Personalizacion algoritmos multiobxectivos elixidos sector naval	\N	PREFIX-00001-00020	\N	\N	0	743395	3
743400	1	Resumo e conclusións	\N	PREFIX-00001-00021	\N	\N	0	743395	4
743402	1	Arquitectura e deseño de software	\N	PREFIX-00001-00023	\N	\N	0	743401	0
743403	1	Implementación software validacion	\N	PREFIX-00001-00024	\N	\N	0	743401	1
743404	1	Integracion plataforma NavalPlan	\N	PREFIX-00001-00025	\N	\N	0	743401	2
743405	1	Bancos de probas NavalPlan	\N	PREFIX-00001-00026	\N	\N	0	743401	3
743406	1	Resumo e conclusions	\N	PREFIX-00001-00027	\N	\N	0	743401	4
743408	1	Arquitectura deseño tecnoloxico	\N	PREFIX-00001-00029	\N	\N	0	743407	0
743409	1	Desenvolvemento do software de proba e validacion	\N	PREFIX-00001-00030	\N	\N	0	743407	1
743410	1	Integracion en NavalPlan	\N	PREFIX-00001-00031	\N	\N	0	743407	2
743411	1	Bancos de probas datos empresas	\N	PREFIX-00001-00032	\N	\N	0	743407	3
743412	1	Resumo e conclusions	\N	PREFIX-00001-00033	\N	\N	0	743407	4
743414	1	Estudio da artes funcions de asignacion	\N	PREFIX-00001-00035	\N	\N	0	743413	0
743415	1	Estudio asignacións reais empresas naval	\N	PREFIX-00001-00036	\N	\N	0	743413	1
743416	1	Deseño de funcións de asignacións aplicadas ao sector naval	\N	PREFIX-00001-00037	\N	\N	0	743413	2
743417	1	Resumo e conclusións	\N	PREFIX-00001-00038	\N	\N	0	743413	3
743419	1	Arquitectura e deseño de software de validación	\N	PREFIX-00001-00040	\N	\N	0	743418	0
743420	1	Implementación de software de validación	\N	PREFIX-00001-00041	\N	\N	0	743418	1
743421	1	Integracion en plataforma NavalPlan	\N	PREFIX-00001-00042	\N	\N	0	743418	2
743422	1	Bancos de probas datos reais	\N	PREFIX-00001-00043	\N	\N	0	743418	3
743423	1	Resumo e conclusions	\N	PREFIX-00001-00044	\N	\N	0	743418	4
743425	1	Deseño interfaces represetnacion informacion planificacion	\N	PREFIX-00001-00053	\N	\N	0	743424	0
743426	1	Deseño indicadores sobre planificacions	\N	PREFIX-00001-00054	\N	\N	0	743424	1
743427	1	Deseño representación gráfica indicadores	\N	PREFIX-00001-00055	\N	\N	0	743424	2
743428	1	Desño interaces visualizacion e analise planificacions	\N	PREFIX-00001-00056	\N	\N	0	743424	3
743429	1	Resumo e conclusions	\N	PREFIX-00001-00057	\N	\N	0	743424	4
743431	1	Arquitectura e deseño de software de validación	\N	PREFIX-00001-00059	\N	\N	0	743430	0
743432	1	Desenvolvemento software proba	\N	PREFIX-00001-00060	\N	\N	0	743430	1
743433	1	Integracion en NavalPlan	\N	PREFIX-00001-00061	\N	\N	0	743430	2
743434	1	Banco de probas en NavalPlan	\N	PREFIX-00001-00062	\N	\N	0	743430	3
743435	1	Resumo e conclusions	\N	PREFIX-00001-00063	\N	\N	0	743430	4
743437	1	Recopilación de información	\N	PREFIX-00001-00065	\N	\N	0	743436	0
743438	1	Analise resultado modelos de datos	\N	PREFIX-00001-00066	\N	\N	0	743436	1
743439	1	Analise resultado algoritmia de planificación de recursos	\N	PREFIX-00001-00067	\N	\N	0	743436	2
743440	1	Analise interfaces e metricas de planificación	\N	PREFIX-00001-00068	\N	\N	0	743436	3
743441	1	Elaboracion memoria concluinte do proxecto	\N	PREFIX-00001-00069	\N	\N	0	743436	4
743443	1	Creación e mantemento de páxina web do proxecto	\N	PREFIX-00001-00071	\N	\N	0	743442	0
743444	1	Creación de artigos de presentación dos resultados	\N	PREFIX-00001-00072	\N	\N	0	743442	1
743445	1	Presentacions en congresos	\N	PREFIX-00001-00073	\N	\N	0	743442	2
745502	1	Estudo arte representacion grafica informacion	\N	PREFIX-00001-00074	\N	\N	3	745501	0
745510	1	Estudio usabilidade aplicacións	\N	PREFIX-00001-00075	\N	\N	3	745501	1
745518	1	Estudo de procedementos e técnicas de monitorización e análise de planificacións	\N	PREFIX-00001-00076	\N	\N	3	745501	2
745526	1	Resumo e conclusións	\N	PREFIX-00001-00077	\N	\N	3	745501	3
745540	1	A10 - Deseño de interfaces de visualizacion e metricas	\N	PREFIX-00001-00052	\N	\N	3	745501	4
745546	1	A1 - Coordinacion	\N	PREFIX-00001-00001	\N	\N	3	745501	5
745564	1	A11 - Validacion de interfaces de visualizacion	\N	PREFIX-00001-00058	\N	\N	3	745501	6
745570	1	A12 - Conclusions xerais	\N	PREFIX-00001-00064	\N	\N	3	745501	7
745576	1	A13 - Difusion do proxecto	\N	PREFIX-00001-00070	\N	\N	3	745501	8
745503	1	A5 - Deseño algoritmos multiobxectivo	\N	PREFIX-00001-00016	\N	\N	3	745502	0
745509	1	Estudo arte representacion grafica informacion (copy)	\N	PREFIX-00001-00046	\N	\N	0	745502	1
745504	1	Documentacion modelo de recursos limitantes naval	\N	PREFIX-00001-00017	\N	\N	0	745503	0
745505	1	Investigacion algoritmos exito potencial	\N	PREFIX-00001-00018	\N	\N	0	745503	1
745506	1	Identificacion obxectivos simultáneos a maximizar interesantes	\N	PREFIX-00001-00019	\N	\N	0	745503	2
745507	1	Personalizacion algoritmos multiobxectivos elixidos sector naval	\N	PREFIX-00001-00020	\N	\N	0	745503	3
745508	1	Resumo e conclusións	\N	PREFIX-00001-00021	\N	\N	0	745503	4
745511	1	A6 - Validacion NavalPlan algoritmos multiobxectivo	\N	PREFIX-00001-00022	\N	\N	3	745510	0
745517	1	Estudio usabilidade aplicacións (copy)	\N	PREFIX-00001-00047	\N	\N	0	745510	1
745512	1	Arquitectura e deseño de software	\N	PREFIX-00001-00023	\N	\N	0	745511	0
745513	1	Implementación software validacion	\N	PREFIX-00001-00024	\N	\N	0	745511	1
745514	1	Integracion plataforma NavalPlan	\N	PREFIX-00001-00025	\N	\N	0	745511	2
745515	1	Bancos de probas NavalPlan	\N	PREFIX-00001-00026	\N	\N	0	745511	3
745516	1	Resumo e conclusions	\N	PREFIX-00001-00027	\N	\N	0	745511	4
745519	1	A7 -  Simulacion NavalPlan estruturas datos	\N	PREFIX-00001-00028	\N	\N	3	745518	0
745525	1	Estudo de procedementos e técnicas de monitorización e análise de planificacións (copy)	\N	PREFIX-00001-00049	\N	\N	0	745518	1
745520	1	Arquitectura deseño tecnoloxico	\N	PREFIX-00001-00029	\N	\N	0	745519	0
745521	1	Desenvolvemento do software de proba e validacion	\N	PREFIX-00001-00030	\N	\N	0	745519	1
745522	1	Integracion en NavalPlan	\N	PREFIX-00001-00031	\N	\N	0	745519	2
745523	1	Bancos de probas datos empresas	\N	PREFIX-00001-00032	\N	\N	0	745519	3
745524	1	Resumo e conclusions	\N	PREFIX-00001-00033	\N	\N	0	745519	4
745527	1	A8 - Deseño de algoritmos de asignación en modelos de recursos  sobreasignables	\N	PREFIX-00001-00034	\N	\N	3	745526	0
745539	1	Resumo e conclusións (copy)	\N	PREFIX-00001-00051	\N	\N	0	745526	1
745528	1	Estudio da artes funcions de asignacion	\N	PREFIX-00001-00078	\N	\N	3	745527	0
745536	1	Estudio asignacións reais empresas naval	\N	PREFIX-00001-00036	\N	\N	0	745527	1
745537	1	Deseño de funcións de asignacións aplicadas ao sector naval	\N	PREFIX-00001-00037	\N	\N	0	745527	2
745538	1	Resumo e conclusións	\N	PREFIX-00001-00038	\N	\N	0	745527	3
745529	1	A9 - Validación de algoritmos de asignación en modelos de recursos sobreasignables	\N	PREFIX-00001-00039	\N	\N	3	745528	0
745535	1	Estudio da artes funcions de asignacion (copy)	\N	PREFIX-00001-00035	\N	\N	0	745528	1
745530	1	Arquitectura e deseño de software de validación	\N	PREFIX-00001-00040	\N	\N	0	745529	0
745531	1	Implementación de software de validación	\N	PREFIX-00001-00041	\N	\N	0	745529	1
745532	1	Integracion en plataforma NavalPlan	\N	PREFIX-00001-00042	\N	\N	0	745529	2
745533	1	Bancos de probas datos reais	\N	PREFIX-00001-00043	\N	\N	0	745529	3
745534	1	Resumo e conclusions	\N	PREFIX-00001-00044	\N	\N	0	745529	4
745541	1	Deseño interfaces represetnacion informacion planificacion	\N	PREFIX-00001-00053	\N	\N	0	745540	0
745542	1	Deseño indicadores sobre planificacions	\N	PREFIX-00001-00054	\N	\N	0	745540	1
745543	1	Deseño representación gráfica indicadores	\N	PREFIX-00001-00055	\N	\N	0	745540	2
745544	1	Desño interaces visualizacion e analise planificacions	\N	PREFIX-00001-00056	\N	\N	0	745540	3
745545	1	Resumo e conclusions	\N	PREFIX-00001-00057	\N	\N	0	745540	4
745547	1	Posta en marcha	\N	PREFIX-00001-00079	\N	\N	3	745546	0
745550	1	Xestion do proxecto	\N	PREFIX-00001-00080	\N	\N	3	745546	1
745557	1	Xestion da I+Dì	\N	PREFIX-00001-00081	\N	\N	3	745546	2
745548	1	Estudo arte datos para modelos planificacion	\N	PREFIX-00001-00006	\N	\N	0	745547	0
745549	1	Posta en marcha (copy)	\N	PREFIX-00001-00002	\N	\N	0	745547	1
745551	1	A2 - Estudio e analise inicial de estruturas de datos	\N	PREFIX-00001-00005	\N	\N	3	745550	0
745556	1	Xestion do proxecto (copy)	\N	PREFIX-00001-00003	\N	\N	0	745550	1
745552	1	Estudo da arte estruturas grandes volumes de datos	\N	PREFIX-00001-00007	\N	\N	0	745551	0
745553	1	Analise de tecnicas de compresion da información	\N	PREFIX-00001-00008	\N	\N	0	745551	1
745554	1	Estudio tipos de consultas	\N	PREFIX-00001-00009	\N	\N	0	745551	2
745555	1	Estudio empresas galegas modelos de datos	\N	PREFIX-00001-00010	\N	\N	0	745551	3
745558	1	A3 - Estudio analise modelos planificacion	\N	PREFIX-00001-00011	\N	\N	3	745557	0
745563	1	Xestion da I+Dì (copy)	\N	PREFIX-00001-00004	\N	\N	0	745557	1
745559	1	Documentacion e analise modelos planificacion	\N	PREFIX-00001-00012	\N	\N	0	745558	0
745560	1	Estudio arte algoritmos e heuriticas	\N	PREFIX-00001-00013	\N	\N	0	745558	1
745561	1	Estudio diferentes modelos planificacion empresas galegas	\N	PREFIX-00001-00014	\N	\N	0	745558	2
745562	1	Resumo e conclusións	\N	PREFIX-00001-00015	\N	\N	0	745558	3
745565	1	Arquitectura e deseño de software de validación	\N	PREFIX-00001-00059	\N	\N	0	745564	0
745566	1	Desenvolvemento software proba	\N	PREFIX-00001-00060	\N	\N	0	745564	1
745567	1	Integracion en NavalPlan	\N	PREFIX-00001-00061	\N	\N	0	745564	2
745568	1	Banco de probas en NavalPlan	\N	PREFIX-00001-00062	\N	\N	0	745564	3
745569	1	Resumo e conclusions	\N	PREFIX-00001-00063	\N	\N	0	745564	4
745571	1	Recopilación de información	\N	PREFIX-00001-00065	\N	\N	0	745570	0
745572	1	Analise resultado modelos de datos	\N	PREFIX-00001-00066	\N	\N	0	745570	1
745573	1	Analise resultado algoritmia de planificación de recursos	\N	PREFIX-00001-00067	\N	\N	0	745570	2
745574	1	Analise interfaces e metricas de planificación	\N	PREFIX-00001-00068	\N	\N	0	745570	3
745575	1	Elaboracion memoria concluinte do proxecto	\N	PREFIX-00001-00069	\N	\N	0	745570	4
745577	1	Creación e mantemento de páxina web do proxecto	\N	PREFIX-00001-00071	\N	\N	0	745576	0
745578	1	Creación de artigos de presentación dos resultados	\N	PREFIX-00001-00072	\N	\N	0	745576	1
745579	1	Presentacions en congresos	\N	PREFIX-00001-00073	\N	\N	0	745576	2
876713	2	Pedido novo	\N	PREFIX-00005	0	132	4	\N	\N
876714	2	order element 1	\N	PREFIX-00005-00003	\N	\N	4	876713	0
876715	2	order element 2	\N	PREFIX-00005-00004	\N	\N	4	876713	1
876716	2	order element 21	\N	PREFIX-00005-00006	\N	\N	4	876715	0
876717	2	order element 22	\N	PREFIX-00005-00007	\N	\N	4	876715	1
876718	2	order element 3	\N	PREFIX-00005-00005	\N	\N	4	876713	2
876719	2	order element 31	\N	PREFIX-00005-00008	\N	\N	4	876718	0
876720	2	order element 3 (copy)	\N	PREFIX-00005-00009	\N	\N	4	876718	1
876721	2	order lines 1	\N	PREFIX-00005-00010	\N	\N	4	876713	3
876722	2	order element 1	\N	PREFIX-00005-00011	\N	\N	4	876713	4
877723	1	Ultimo pedido	\N	PREFIX-00005	0	132	4	\N	\N
876723	2	order element 2	\N	PREFIX-00005-00012	\N	\N	4	876713	5
877724	1	order element 1	\N	PREFIX-00005-00003	\N	\N	4	877723	0
877725	1	order element 2	\N	PREFIX-00005-00004	\N	\N	4	877723	1
877728	1	order element 3	\N	PREFIX-00005-00005	\N	\N	4	877723	2
877731	1	order lines 1	\N	PREFIX-00005-00010	\N	\N	4	877723	3
877732	1	order element 1	\N	PREFIX-00005-00011	\N	\N	4	877723	4
877733	1	order element 2	\N	PREFIX-00005-00012	\N	\N	4	877723	5
877726	1	order element 21	\N	PREFIX-00005-00006	\N	\N	4	877725	0
877727	1	order element 22	\N	PREFIX-00005-00007	\N	\N	4	877725	1
877729	1	order element 31	\N	PREFIX-00005-00008	\N	\N	4	877728	0
877730	1	order element 3 (copy)	\N	PREFIX-00005-00009	\N	\N	4	877728	1
877767	1	Novo pedido	\N	PREFIX-00005	0	132	4	\N	\N
877768	1	order element 1	\N	PREFIX-00005-00003	\N	\N	4	877767	0
877769	1	order element 2	\N	PREFIX-00005-00004	\N	\N	4	877767	1
877772	1	order element 3	\N	PREFIX-00005-00005	\N	\N	4	877767	2
877775	1	order lines 1	\N	PREFIX-00005-00010	\N	\N	4	877767	3
877776	1	order element 1	\N	PREFIX-00005-00011	\N	\N	4	877767	4
877777	1	order element 2	\N	PREFIX-00005-00012	\N	\N	4	877767	5
877778	1	novo elemento	New Description	PREFIX-00005-00012	\N	\N	4	877767	6
877770	1	order element 21	\N	PREFIX-00005-00006	\N	\N	4	877769	0
877771	1	order element 22	\N	PREFIX-00005-00007	\N	\N	4	877769	1
877773	1	order element 31	\N	PREFIX-00005-00008	\N	\N	4	877772	0
877774	1	order element 3 (copy)	\N	PREFIX-00005-00009	\N	\N	4	877772	1
878703	1	Order element con labels	\N	PREFIX-00013	0	\N	4	\N	\N
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
877219	1
877221	1
877222	1
877224	1
877225	1
877226	1
877227	1
877228	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
877218
877220
877223
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
743374
743375
743379
743385
743390
743395
743401
743407
743413
743418
743424
743430
743436
743442
745501
745502
745503
745510
745511
745518
745519
745526
745527
745528
745529
745540
745546
745547
745550
745551
745557
745558
745564
745570
745576
876713
876715
876718
877723
877725
877728
877767
877769
877772
878703
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
743376	0
743377	0
743378	0
743380	0
743381	0
743382	0
743383	0
743384	0
743386	0
743387	0
743388	0
743389	0
743391	0
743392	0
743393	0
743394	0
743396	0
743397	0
743398	0
743399	0
743400	0
743402	0
743403	0
743404	0
743405	0
743406	0
743408	0
743409	0
743410	0
743411	0
743412	0
743414	0
743415	0
743416	0
743417	0
743419	0
743420	0
743421	0
743422	0
743423	0
743425	0
743426	0
743427	0
743428	0
743429	0
743431	0
743432	0
743433	0
743434	0
743435	0
743437	0
743438	0
743439	0
743440	0
743441	0
743443	0
743444	0
743445	0
745504	0
745505	0
745506	0
745507	0
745508	0
745509	0
745512	0
745513	0
745514	0
745515	0
745516	0
745517	0
745520	0
745521	0
745522	0
745523	0
745524	0
745525	0
745530	0
745531	0
745532	0
745533	0
745534	0
745535	0
745536	0
745537	0
745538	0
745539	0
745541	0
745542	0
745543	0
745544	0
745545	0
745548	0
745549	0
745552	0
745553	0
745554	0
745555	0
745556	0
745559	0
745560	0
745561	0
745562	0
745563	0
745565	0
745566	0
745567	0
745568	0
745569	0
745571	0
745572	0
745573	0
745574	0
745575	0
745577	0
745578	0
745579	0
876714	0
876716	0
876717	0
876719	0
876720	0
876721	0
876722	0
876723	0
877724	0
877726	0
877727	0
877729	0
877730	0
877731	0
877732	0
877733	0
877768	0
877770	0
877771	0
877773	0
877774	0
877775	0
877776	0
877777	0
877778	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	15	PREFIX	13	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
743374	1
876713	1
877723	1
877767	1
878703	1
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
877592	11	2010-09-10 11:43:21.677	707
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype, reportadvance, advance_type_id) FROM stdin;
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, code, generatecode, limited_resource, base_calendar_id) FROM stdin;
1220	2	1d6c7e00-b56c-4438-afed-1f85c2ddf337	t	f	5
1216	2	f0c9c1c2-bdaf-4357-8f85-08e13c0557c4	t	f	3
1222	2	9afa492d-ff1c-4aba-beba-42dc09c52431	t	f	6
1218	2	7e7fc867-1cf2-4405-be95-0618ac24d747	t	f	4
728312	1	dfc1f512-4862-4197-af8f-56637c15407a	t	t	728412
1214	4	30a3fa8c-d26e-4dd5-b44d-974d5c40da72	t	f	2
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
5	1
3	1
6	1
4	1
728412	1
2	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario (id, version, name, description, lastnotownedreassignationstimestamp, predecessor) FROM stdin;
707	4	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
877218	877592	707
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
877218	877420	877592
877219	877421	877592
877220	877422	877592
877221	877423	877592
877222	877424	877592
877223	877425	877592
877224	877426	877592
877225	877427	877592
877226	877428	877592
877227	877429	877592
877228	877430	877592
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
877420	9	3	877218
877421	9	0	877219
877422	9	0	877220
877423	9	1	877221
877424	9	1	877222
877425	9	0	877223
877426	9	1	877224
877427	9	1	877225
877428	9	0	877226
877429	9	0	877227
877430	9	0	877228
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
\.


--
-- Data for Name: sumchargedhours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY sumchargedhours (id, version, directchargedhours, indirectchargedhours) FROM stdin;
877319	10	100	100
877320	8	0	0
877321	8	0	0
877322	8	0	0
877323	8	0	0
877324	9	100	0
877325	8	0	0
877326	8	0	0
877327	8	0	0
877328	8	0	0
877329	8	0	0
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
878907	1	0	\N	\N	\N
878906	1	0	\N	\N	\N
878902	1	0	\N	\N	5
878903	1	0	\N	\N	\N
878904	1	0	\N	\N	\N
878905	1	0	\N	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
878902	877512
878903	877514
878903	877513
878904	877515
878904	877516
878905	877517
878906	877518
878907	877519
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent, startdayduration, enddayduration) FROM stdin;
878907	4	order element 2	\N	2010-09-07 00:00:00	2010-10-12 00:00:00	\N	0.00	878908	\N	5	0	0
878906	4	order element 1	\N	2010-09-07 00:00:00	2010-09-24 00:00:00	\N	0.00	878908	\N	4	0	0
878902	4	order element 1	\N	2010-09-07 00:00:00	2010-09-19 00:00:00	\N	0.00	878908	\N	0	0	0
878903	5	order element 2	\N	2010-09-07 00:00:00	2010-10-12 00:00:00	\N	0.00	878908	\N	1	0	0
878904	4	order element 3	\N	2010-09-07 00:00:00	2010-10-02 00:00:00	\N	0.00	878908	\N	2	0	0
878905	4	order lines 1	\N	2010-09-07 00:00:00	2010-09-19 00:00:00	\N	0.00	878908	\N	3	0	0
878908	4	Pedido novo	\N	2010-09-07 00:00:00	2010-10-12 00:00:00	2011-01-17	0.00	\N	\N	\N	0	0
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
878908
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id, startconstrainttype, constraintdate) FROM stdin;
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
878902	1	877421
878903	1	877422
878904	1	877425
878905	1	877428
878906	1	877429
878907	1	877430
878908	1	877420
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
877892	1	Parte de traballo	e1e02405-5540-4354-9ff1-5e083eff6fcd	100.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
1010	1	0c6cbf33-02f2-444c-aaa9-c45c37601f91	units	f
1011	1	b91cf86e-a5e2-4362-b71a-dc52657830ca	kg	f
1012	1	841252ad-cd06-4d4c-b0d4-de61a688be6e	km	f
1013	1	5d0b873f-cd5d-4db0-a0eb-055e0ffaba3a	l	f
1014	1	0689082d-8020-4df7-997e-aa3f56f6080a	m	f
1015	1	7d24cec5-2440-4e97-9ab0-eff356a7a0ef	m2	f
1016	1	bc879cd4-7dbb-4795-adcd-421fc624552e	m3	f
1017	1	7f76dd94-7224-48f0-a79e-a3d0599691a7	tn	f
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_profiles (user_id, profile_id) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
1112	ROLE_CREATE_ORDER
1112	ROLE_ADMINISTRATION
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_READ_ALL_ORDERS
1113	ROLE_WS_READER
1114	ROLE_WS_READER
1114	ROLE_WS_WRITER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, generatecode, work_report_type_id, resource_id, order_element_id) FROM stdin;
878195	1	e7ae6ef3-0f1c-49bc-b65c-ab986eaca5d6	\N	t	877993	\N	\N
878196	1	db8c6568-5f89-4901-b544-ba234159b691	\N	t	877993	\N	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
878094	1	e0743dfd-60c6-4697-bee4-e1e7a9a7a5fd	100	2010-09-07 19:23:11.504	\N	\N	878195	1220	877223	877892
878095	1	63419ca8-051c-4b04-ae61-72576bb71d80	100	2010-09-07 19:30:35.424	\N	\N	878196	1220	877218	877892
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
877993	1	Tipo de parte de traballo	TPT-1	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1220	Wireless	1	4
1216	Igalia	2	2
1222	GSI	1	5
1218	Igalia 	3	3
728312	Diego	Pino	36143135
1214	Igalia 	1	1
\.


--
-- Data for Name: workreports_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreports_labels (work_report_id, label_id) FROM stdin;
\.


--
-- Data for Name: workreportslines_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreportslines_labels (work_report_line_id, label_id) FROM stdin;
\.


--
-- Name: advanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advanceassignment
    ADD CONSTRAINT advanceassignment_pkey PRIMARY KEY (id);


--
-- Name: advanceassignmenttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT advanceassignmenttemplate_pkey PRIMARY KEY (id);


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
-- Name: basecalendar_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY basecalendar
    ADD CONSTRAINT basecalendar_code_key UNIQUE (code);


--
-- Name: basecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY basecalendar
    ADD CONSTRAINT basecalendar_pkey PRIMARY KEY (id);


--
-- Name: calendaravailability_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendaravailability
    ADD CONSTRAINT calendaravailability_pkey PRIMARY KEY (id);


--
-- Name: calendardata_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_code_key UNIQUE (code);


--
-- Name: calendardata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_pkey PRIMARY KEY (id);


--
-- Name: calendarexception_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_code_key UNIQUE (code);


--
-- Name: calendarexception_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_pkey PRIMARY KEY (id);


--
-- Name: calendarexceptiontype_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_code_key UNIQUE (code);


--
-- Name: calendarexceptiontype_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_name_key UNIQUE (name);


--
-- Name: calendarexceptiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_pkey PRIMARY KEY (id);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: consolidatedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT consolidatedvalue_pkey PRIMARY KEY (id);


--
-- Name: consolidation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT consolidation_pkey PRIMARY KEY (id);


--
-- Name: cost_category_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_code_key UNIQUE (code);


--
-- Name: cost_category_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_name_key UNIQUE (name);


--
-- Name: cost_category_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_pkey PRIMARY KEY (id);


--
-- Name: criterion_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_code_key UNIQUE (code);


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
-- Name: criterionrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT criterionrequirement_pkey PRIMARY KEY (id);


--
-- Name: criterionsatisfaction_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_code_key UNIQUE (code);


--
-- Name: criterionsatisfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_pkey PRIMARY KEY (id);


--
-- Name: criteriontype_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_code_key UNIQUE (code);


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
-- Name: derivedallocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT derivedallocation_pkey PRIMARY KEY (id);


--
-- Name: deriveddayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT deriveddayassignmentscontainer_pkey PRIMARY KEY (id);


--
-- Name: directadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT directadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: external_company_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_name_key UNIQUE (name);


--
-- Name: external_company_nif_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_nif_key UNIQUE (nif);


--
-- Name: external_company_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_pkey PRIMARY KEY (id);


--
-- Name: generic_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT generic_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: genericdayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT genericdayassignmentscontainer_pkey PRIMARY KEY (id);


--
-- Name: hour_cost_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_code_key UNIQUE (code);


--
-- Name: hour_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_pkey PRIMARY KEY (id);


--
-- Name: hoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_pkey PRIMARY KEY (id);


--
-- Name: hoursperday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT hoursperday_pkey PRIMARY KEY (base_calendar_id, day_id);


--
-- Name: indirectadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT indirectadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: label_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_code_key UNIQUE (code);


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
-- Name: label_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_code_key UNIQUE (code);


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
-- Name: limiting_resource_queue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT limiting_resource_queue_dependency_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_resource_allocation_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_resource_allocation_id_key UNIQUE (resource_allocation_id);


--
-- Name: limiting_resource_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_resource_id_key UNIQUE (resource_id);


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
-- Name: material_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT material_assigment_pkey PRIMARY KEY (id);


--
-- Name: material_assigment_template_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT material_assigment_template_pkey PRIMARY KEY (id);


--
-- Name: material_category_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_code_key UNIQUE (code);


--
-- Name: material_category_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_pkey PRIMARY KEY (id);


--
-- Name: material_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_code_key UNIQUE (code);


--
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: naval_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_profile
    ADD CONSTRAINT naval_profile_pkey PRIMARY KEY (id);


--
-- Name: naval_profile_profilename_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_profile
    ADD CONSTRAINT naval_profile_profilename_key UNIQUE (profilename);


--
-- Name: naval_user_loginname_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT naval_user_loginname_key UNIQUE (loginname);


--
-- Name: naval_user_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT naval_user_pkey PRIMARY KEY (id);


--
-- Name: order_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT order_authorization_pkey PRIMARY KEY (id);


--
-- Name: order_element_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT order_element_label_pkey PRIMARY KEY (order_element_id, label_id);


--
-- Name: order_element_template_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT order_element_template_label_pkey PRIMARY KEY (order_element_template_id, label_id);


--
-- Name: order_element_template_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT order_element_template_quality_form_pkey PRIMARY KEY (order_element_template_id, quality_form_id);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderelement_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_code_key UNIQUE (code);


--
-- Name: orderelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_pkey PRIMARY KEY (id);


--
-- Name: orderelement_sum_charged_hours_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_sum_charged_hours_id_key UNIQUE (sum_charged_hours_id);


--
-- Name: orderelementtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelementtemplate
    ADD CONSTRAINT orderelementtemplate_pkey PRIMARY KEY (id);


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
-- Name: orderlinegrouptemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT orderlinegrouptemplate_pkey PRIMARY KEY (group_template_id);


--
-- Name: orderlinetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinetemplate
    ADD CONSTRAINT orderlinetemplate_pkey PRIMARY KEY (order_line_template_id);


--
-- Name: ordersequence_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY ordersequence
    ADD CONSTRAINT ordersequence_pkey PRIMARY KEY (id);


--
-- Name: ordertemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT ordertemplate_pkey PRIMARY KEY (order_template_id);


--
-- Name: orderversion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderversion
    ADD CONSTRAINT orderversion_pkey PRIMARY KEY (id);


--
-- Name: quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT quality_form_items_pkey PRIMARY KEY (quality_form_id, idx);


--
-- Name: quality_form_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_name_key UNIQUE (name);


--
-- Name: quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_pkey PRIMARY KEY (id);


--
-- Name: resource_base_calendar_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_base_calendar_id_key UNIQUE (base_calendar_id);


--
-- Name: resource_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_code_key UNIQUE (code);


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
-- Name: resources_cost_category_assignment_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_code_key UNIQUE (code);


--
-- Name: resources_cost_category_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_pkey PRIMARY KEY (id);


--
-- Name: scenario_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT scenario_orders_pkey PRIMARY KEY (scenario_id, order_id);


--
-- Name: scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- Name: scheduling_states_by_order_version_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT scheduling_states_by_order_version_pkey PRIMARY KEY (order_element_id, order_version_id);


--
-- Name: schedulingdataforversion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY schedulingdataforversion
    ADD CONSTRAINT schedulingdataforversion_pkey PRIMARY KEY (id);


--
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: specificdayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT specificdayassignmentscontainer_pkey PRIMARY KEY (id);


--
-- Name: stretches_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT stretches_pkey PRIMARY KEY (assignment_function_id, stretch_position);


--
-- Name: stretchesfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY stretchesfunction
    ADD CONSTRAINT stretchesfunction_pkey PRIMARY KEY (assignment_function_id);


--
-- Name: subcontractedtaskdata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT subcontractedtaskdata_pkey PRIMARY KEY (id);


--
-- Name: sumchargedhours_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY sumchargedhours
    ADD CONSTRAINT sumchargedhours_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT task_quality_form_items_pkey PRIMARY KEY (task_quality_form_id, idx);


--
-- Name: task_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT task_quality_form_pkey PRIMARY KEY (id);


--
-- Name: task_source_hours_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT task_source_hours_groups_pkey PRIMARY KEY (task_source_id, hours_group_id);


--
-- Name: task_subcontrated_task_data_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_subcontrated_task_data_id_key UNIQUE (subcontrated_task_data_id);


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
-- Name: tasksource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_pkey PRIMARY KEY (id);


--
-- Name: tasksource_schedulingdata_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_schedulingdata_key UNIQUE (schedulingdata);


--
-- Name: type_of_work_hours_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_code_key UNIQUE (code);


--
-- Name: type_of_work_hours_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_name_key UNIQUE (name);


--
-- Name: type_of_work_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_pkey PRIMARY KEY (id);


--
-- Name: unit_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_code_key UNIQUE (code);


--
-- Name: unit_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id, profile_id);


--
-- Name: virtualworker_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY virtualworker
    ADD CONSTRAINT virtualworker_pkey PRIMARY KEY (virtualworker_id);


--
-- Name: work_report_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_code_key UNIQUE (code);


--
-- Name: work_report_label_type_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT work_report_label_type_assigment_pkey PRIMARY KEY (id);


--
-- Name: work_report_line_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_code_key UNIQUE (code);


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
-- Name: work_report_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_code_key UNIQUE (code);


--
-- Name: work_report_type_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_name_key UNIQUE (name);


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
-- Name: workreports_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT workreports_labels_pkey PRIMARY KEY (work_report_id, label_id);


--
-- Name: workreportslines_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT workreportslines_labels_pkey PRIMARY KEY (work_report_line_id, label_id);


--
-- Name: fk109ac09e8b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk109ac09e8b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fk109ac09eefda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk109ac09eefda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk1961a43d415884f6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY heading_field
    ADD CONSTRAINT fk1961a43d415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


--
-- Name: fk1a95a222131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a222131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fk1a95a22248d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a22248d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk1a95a222efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a222efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk1a9afa91a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT fk1a9afa91a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk1a9afa91adad7e51; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT fk1a9afa91adad7e51 FOREIGN KEY (calendar_exception_id) REFERENCES calendarexceptiontype(id);


--
-- Name: fk1ccb0f7419b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk1ccb0f7419b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk1ccb0f74b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk1ccb0f74b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fk1fc5f45575ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f45575ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fk1fc5f455bd2209e8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f455bd2209e8 FOREIGN KEY (limiting_resource_queue_id) REFERENCES limiting_resource_queue(id);


--
-- Name: fk27a9a54936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a54936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk27a9a55b595a0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a55b595a0 FOREIGN KEY (subcontrated_task_data_id) REFERENCES subcontractedtaskdata(id);


--
-- Name: fk2999e7e5421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT fk2999e7e5421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fk2999e7e57518838c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT fk2999e7e57518838c FOREIGN KEY (resource_allocation_id) REFERENCES specific_resource_allocation(resource_allocation_id);


--
-- Name: fk29d0015519b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fk29d0015519b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk29d001558b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fk29d001558b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fk3a79eb0219b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb0219b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


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
-- Name: fk3afdc2bd75ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT fk3afdc2bd75ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fk3afdc2bd87b470f0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT fk3afdc2bd87b470f0 FOREIGN KEY (configurationunit) REFERENCES machineworkersconfigurationunit(id);


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
-- Name: fk407955279578651e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk407955279578651e FOREIGN KEY (category_id) REFERENCES material_category(id);


--
-- Name: fk40795527f11b2d0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk40795527f11b2d0 FOREIGN KEY (unit_type) REFERENCES unit_type(id);


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
-- Name: fk4a1d42dc9fb7fc18; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinetemplate
    ADD CONSTRAINT fk4a1d42dc9fb7fc18 FOREIGN KEY (order_line_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk4d68b9c89a4a7d90; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT fk4d68b9c89a4a7d90 FOREIGN KEY (order_template_id) REFERENCES orderlinegrouptemplate(group_template_id);


--
-- Name: fk4d68b9c8a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT fk4d68b9c8a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk5280da49161d6c65; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY virtualworker
    ADD CONSTRAINT fk5280da49161d6c65 FOREIGN KEY (virtualworker_id) REFERENCES worker(worker_id);


--
-- Name: fk53cd4dcaa2380ca7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderversion
    ADD CONSTRAINT fk53cd4dcaa2380ca7 FOREIGN KEY (ownerscenario) REFERENCES scenario(id);


--
-- Name: fk5863798ca44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourcecalendar
    ADD CONSTRAINT fk5863798ca44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk593d3b4b1a5e11f8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY stretchesfunction
    ADD CONSTRAINT fk593d3b4b1a5e11f8 FOREIGN KEY (assignment_function_id) REFERENCES assignment_function(id);


--
-- Name: fk5948535228f2695; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk5948535228f2695 FOREIGN KEY (origin_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk59485352e42f8d29; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk59485352e42f8d29 FOREIGN KEY (destiny_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk5c13eccf415884f6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY line_field
    ADD CONSTRAINT fk5c13eccf415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


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
-- Name: fk698876da1b8e7cf2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT fk698876da1b8e7cf2 FOREIGN KEY (derived_allocation_id) REFERENCES derivedallocation(id);


--
-- Name: fk698876da421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT fk698876da421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


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
-- Name: fk711ace7423b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace7423b85cf1 FOREIGN KEY (order_version_id) REFERENCES orderversion(id);


--
-- Name: fk711ace7487287288; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace7487287288 FOREIGN KEY (order_id) REFERENCES order_table(orderelementid);


--
-- Name: fk711ace74c0fb9d8e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace74c0fb9d8e FOREIGN KEY (scenario_id) REFERENCES scenario(id);


--
-- Name: fk7540af6b1545e7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b1545e7a FOREIGN KEY (origin) REFERENCES taskelement(id);


--
-- Name: fk7540af6b9e788f90; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b9e788f90 FOREIGN KEY (queue_dependency) REFERENCES limiting_resource_queue_dependency(id);


--
-- Name: fk7540af6be838f362; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6be838f362 FOREIGN KEY (destination) REFERENCES taskelement(id);


--
-- Name: fk75a2f39d4ec080cf; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39d4ec080cf FOREIGN KEY (customer) REFERENCES external_company(id);


--
-- Name: fk75a2f39da44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39da44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


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
-- Name: fk7daad5cd5078e161; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fk7daad5cd5078e161 FOREIGN KEY (work_report_line_id) REFERENCES work_report_line(id);


--
-- Name: fk7daad5cdc1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fk7daad5cdc1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fk7e57469848d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT fk7e57469848d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


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
-- Name: fk8217a424b216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT fk8217a424b216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


--
-- Name: fk82ca26e5fec79eb0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY description_values
    ADD CONSTRAINT fk82ca26e5fec79eb0 FOREIGN KEY (description_value_id) REFERENCES work_report(id);


--
-- Name: fk8746516b53669f2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT fk8746516b53669f2 FOREIGN KEY (parent_id) REFERENCES material_category(id);


--
-- Name: fk8ca5223648d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk8ca5223648d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk8ca52236c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk8ca52236c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


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
-- Name: fk991fdde5567ad13; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fk991fdde5567ad13 FOREIGN KEY (user_id) REFERENCES naval_user(id);


--
-- Name: fk991fddeedc4db41; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fk991fddeedc4db41 FOREIGN KEY (profile_id) REFERENCES naval_profile(id);


--
-- Name: fk9ac73f9e40901220; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT fk9ac73f9e40901220 FOREIGN KEY (worker_id) REFERENCES resource(id);


--
-- Name: fk9bb0b28841638aab; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelementtemplate
    ADD CONSTRAINT fk9bb0b28841638aab FOREIGN KEY (parent) REFERENCES orderlinegrouptemplate(group_template_id);


--
-- Name: fka01aabd9a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendaravailability
    ADD CONSTRAINT fka01aabd9a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fka01fe4ee8c80ccb7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4ee8c80ccb7 FOREIGN KEY (task_source_id) REFERENCES tasksource(id);


--
-- Name: fka01fe4eee036cfed; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4eee036cfed FOREIGN KEY (hours_group_id) REFERENCES hoursgroup(id);


--
-- Name: fka04a45b123b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b123b85cf1 FOREIGN KEY (order_version_id) REFERENCES orderversion(id);


--
-- Name: fka04a45b19bfe55d0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b19bfe55d0 FOREIGN KEY (scheduling_state_for_version_id) REFERENCES schedulingdataforversion(id);


--
-- Name: fka04a45b1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b1efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fka2d2a4d6cc119699; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fka2d2a4d6cc119699 FOREIGN KEY (configuration_id) REFERENCES basecalendar(id);


--
-- Name: fka87c31085567ad13; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c31085567ad13 FOREIGN KEY (user_id) REFERENCES naval_user(id);


--
-- Name: fka87c310887287288; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c310887287288 FOREIGN KEY (order_id) REFERENCES order_table(orderelementid);


--
-- Name: fka87c3108edc4db41; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c3108edc4db41 FOREIGN KEY (profile_id) REFERENCES naval_profile(id);


--
-- Name: fka9542ec319b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fka9542ec319b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fka9542ec3c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fka9542ec3c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkab89a5edefda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY schedulingdataforversion
    ADD CONSTRAINT fkab89a5edefda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fkadeba4bf87fa6b5d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT fkadeba4bf87fa6b5d FOREIGN KEY (task_quality_form_id) REFERENCES task_quality_form(id);


--
-- Name: fkb05e6e203d72bc6f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e203d72bc6f FOREIGN KEY (id) REFERENCES taskelement(id);


--
-- Name: fkb05e6e209a2c0abd; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e209a2c0abd FOREIGN KEY (schedulingdata) REFERENCES schedulingdataforversion(id);


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
-- Name: fkbb493f5019256004; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5019256004 FOREIGN KEY (generic_container_id) REFERENCES genericdayassignmentscontainer(id);


--
-- Name: fkbb493f5048d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5048d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbb493f50510e7a78; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50510e7a78 FOREIGN KEY (derived_container_id) REFERENCES deriveddayassignmentscontainer(id);


--
-- Name: fkbb493f50756348a8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50756348a8 FOREIGN KEY (specific_container_id) REFERENCES specificdayassignmentscontainer(id);


--
-- Name: fkc001d52efd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT fkc001d52efd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


--
-- Name: fkc5b10467f3909054; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY profile_roles
    ADD CONSTRAINT fkc5b10467f3909054 FOREIGN KEY (profileid) REFERENCES naval_profile(id);


--
-- Name: fkc6c799292c57f12a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fkc6c799292c57f12a FOREIGN KEY (userid) REFERENCES naval_user(id);


--
-- Name: fkcf1f2cd01ed629ea; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT fkcf1f2cd01ed629ea FOREIGN KEY (parent_order_line) REFERENCES orderline(orderelementid);


--
-- Name: fkcf1f2cd08bdc6ac6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT fkcf1f2cd08bdc6ac6 FOREIGN KEY (order_line_template) REFERENCES orderlinetemplate(order_line_template_id);


--
-- Name: fkd06071e0421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT fkd06071e0421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fkd06071e0ee970b; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT fkd06071e0ee970b FOREIGN KEY (resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fkd3056ef7ddc82952; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT fkd3056ef7ddc82952 FOREIGN KEY (group_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fkd59fd7b0fd99606d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT fkd59fd7b0fd99606d FOREIGN KEY (predecessor) REFERENCES scenario(id);


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
-- Name: fkd9f8f120131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fkd9f8f120707cd777; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fkd9f8f120c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkdbbb4fee1e635c19; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4fee1e635c19 FOREIGN KEY (parent) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fkdbbb4fee7ec17fa6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4fee7ec17fa6 FOREIGN KEY (sum_charged_hours_id) REFERENCES sumchargedhours(id);


--
-- Name: fkdbbb4feed97bcc8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4feed97bcc8c FOREIGN KEY (template) REFERENCES orderelementtemplate(id);


--
-- Name: fkdfdb026919b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT fkdfdb026919b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fkdfdb0269b216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT fkdfdb0269b216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


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
-- Name: fke3758148c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fke3758148c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


--
-- Name: fke3758148d5b6184d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fke3758148d5b6184d FOREIGN KEY (type_of_work_hours_id) REFERENCES type_of_work_hours(id);


--
-- Name: fke562c7e93fee60cc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT fke562c7e93fee60cc FOREIGN KEY (companyuser) REFERENCES naval_user(id);


--
-- Name: fke9754bc58b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT fke9754bc58b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fkeb02c3f148d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f148d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkeb02c3f1e7e1020b; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1e7e1020b FOREIGN KEY (type_work_hours_id) REFERENCES type_of_work_hours(id);


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
-- Name: fkecc6114019960f43; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT fkecc6114019960f43 FOREIGN KEY (externalcompany) REFERENCES external_company(id);


--
-- Name: fkee374673ae0677b8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT fkee374673ae0677b8 FOREIGN KEY (assignment_function_id) REFERENCES stretchesfunction(assignment_function_id);


--
-- Name: fkeeedb0fc4cd98327; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT fkeeedb0fc4cd98327 FOREIGN KEY (lastconnectedscenario) REFERENCES scenario(id);


--
-- Name: fkef86282edc874c20; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkef86282edc874c20 FOREIGN KEY (base_calendar_id) REFERENCES resourcecalendar(base_calendar_id);


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
-- Name: fkf2a5f7475c390c4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY description_values_in_line
    ADD CONSTRAINT fkf2a5f7475c390c4 FOREIGN KEY (description_value_id) REFERENCES work_report_line(id);


--
-- Name: fkf436a4163ae24ff8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a4163ae24ff8 FOREIGN KEY (consolidation_id) REFERENCES consolidation(id);


--
-- Name: fkf436a416b96bba28; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a416b96bba28 FOREIGN KEY (advance_measurement_id) REFERENCES advancemeasurement(id);


--
-- Name: fkf436a416cec54333; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a416cec54333 FOREIGN KEY (consolidation_id) REFERENCES consolidation(id);


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
-- Name: fkf8df3e0c430ea1de; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0c430ea1de FOREIGN KEY (ind_advance_assignment_id) REFERENCES indirectadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0c9f1d6611; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0c9f1d6611 FOREIGN KEY (dir_advance_assignment_id) REFERENCES directadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0cff2b2ba3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0cff2b2ba3 FOREIGN KEY (id) REFERENCES task(task_element_id);


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
-- Name: fkfd423ff0c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkfd423ff0c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkfd423ff0f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkfd423ff0f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fkfd509405b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkfd509405b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fkfd509405efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkfd509405efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


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


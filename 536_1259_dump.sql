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
    hours integer,
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
    parent bigint
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
    positionincontainer integer
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
2020	17	t	809
2021	17	t	809
2023	9	t	808
2022	9	f	809
2030	16	t	809
2029	9	f	809
2028	9	t	808
2024	17	t	809
2025	17	t	809
2027	9	f	809
2026	9	t	808
31540	4	f	809
31539	4	t	808
9196	8	f	809
9197	8	t	808
9191	11	t	811
9192	11	t	811
9193	11	t	809
9195	8	f	809
9194	8	t	808
43637	7	t	809
43638	7	t	809
43639	7	t	809
43227	7	t	809
43632	7	t	809
43633	7	t	809
43634	7	t	809
31579	6	f	809
5353	27	t	809
5354	27	t	809
5355	27	t	809
5356	27	t	809
5358	20	t	808
5357	20	f	809
5359	27	t	809
5360	27	t	809
5361	27	t	809
5362	27	t	809
5364	20	t	808
5363	20	f	809
5365	27	t	809
5366	27	t	809
5367	20	t	808
5368	20	f	809
5370	20	t	808
5369	20	f	809
31581	9	t	809
31578	6	t	808
26108	13	t	809
26109	13	t	809
26110	13	t	809
26111	13	t	809
26112	13	t	809
26114	10	t	808
26113	10	f	809
31582	6	f	809
31583	6	t	808
31585	6	t	808
26115	13	t	809
26117	10	f	809
26116	10	t	808
31586	6	f	809
31525	5	t	809
31526	5	t	809
31527	5	t	809
31528	5	t	809
31530	4	f	809
31529	4	t	808
31531	5	t	809
31532	5	t	809
31533	5	t	809
31534	5	t	809
31535	4	f	809
31536	4	t	808
31542	4	f	809
31541	4	t	808
31537	5	t	809
31538	5	t	809
31576	9	t	809
31577	9	t	809
31584	9	t	809
31580	9	t	809
43636	5	f	809
43635	5	t	808
43686	3	t	809
43679	3	t	809
43680	3	t	809
43681	3	t	809
43682	3	t	809
43683	3	t	809
43640	7	t	809
43643	7	t	809
43644	7	t	809
43689	3	t	809
43641	5	f	809
43642	5	t	808
43646	5	t	808
43645	5	f	809
43648	5	f	809
43647	5	t	808
43684	2	f	809
43685	2	t	808
43687	2	t	808
43688	2	f	809
22732	17	t	809
22725	17	t	809
22726	17	t	809
22727	17	t	809
22728	17	t	809
22729	17	t	809
22730	15	t	808
22731	15	f	809
22733	15	f	809
22734	15	t	808
48005	2	t	809
48006	2	t	809
48007	2	t	809
48008	2	t	809
48009	2	t	809
48010	2	t	808
48011	2	f	809
48012	2	t	809
48013	2	f	809
48014	2	t	808
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
26677	1	809	26614	t	100.00
26678	1	809	26615	t	100.00
26679	1	809	26616	t	100.00
26680	1	809	26617	t	100.00
26681	1	809	26619	t	100.00
26682	1	809	26620	t	100.00
26683	1	809	26621	t	100.00
26684	1	809	26622	t	100.00
26685	1	809	26624	t	100.00
26686	1	809	26625	t	100.00
25619	2	809	25436	t	100.00
25620	2	809	25437	t	100.00
25621	2	809	25438	t	100.00
25622	2	809	25440	t	100.00
25623	2	809	25441	t	100.00
25624	2	809	25442	t	100.00
26702	1	809	26652	t	100.00
26703	1	809	26653	t	100.00
26704	1	809	26655	t	100.00
26705	1	809	26656	t	100.00
26706	1	809	26657	t	100.00
47589	1	809	47394	t	100.00
47590	1	809	47395	t	100.00
47591	1	809	47396	t	100.00
47592	1	809	47398	t	100.00
47593	1	809	47399	t	100.00
47594	1	809	47400	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
8956	0	2010-06-19	30.00	9192	\N
8932	5	2010-06-18	25.00	9191	\N
6383	22	2010-06-25	20.00	5353	\N
8915	16	2010-07-29	25.00	5355	\N
27830	0	2010-06-15	50.00	2020	\N
27831	0	2010-06-15	40.00	2030	\N
27799	8	2010-07-08	20.00	26108	\N
27851	1	2010-06-24	25.00	26110	\N
46477	6	2010-06-24	15.00	22727	\N
48905	3	2010-07-16	10.00	22728	\N
51116	1	2010-06-16	70.00	22729	\N
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
5861	4751
5863	4747
7904	4751
7908	4751
16672	4747
16673	4747
16699	4747
16701	4751
26970	4751
26972	4751
26973	4747
26974	4751
26989	4747
27040	4747
27041	4747
27042	4751
27043	4747
27044	4747
27045	4751
27046	4751
27047	4751
27048	4751
27049	4751
43936	4751
43941	4747
43943	4747
43944	4751
43945	4747
43946	510
45765	510
48283	4747
50705	4751
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
1	1	5d393609-e203-42eb-ac95-0a352e90aa98	Default
2	1	b239c933-2a54-493d-81ac-87e587db0bdb	\N
3	3	56404054-9105-4bcd-9775-174952902c25	\N
5	2	8f5ff702-2dbd-4209-928a-54c702dd7673	\N
4444	2	039aaa19-e957-4735-bcdd-258070156265	\N
4445	1	68bb41ad-9f63-4531-b3f3-3fba90b881f0	\N
4446	1	088f35bf-c773-4322-adb4-f0155c2ba870	\N
4447	1	62a7802c-77d6-4499-b79b-09de20279d26	\N
4448	2	52881e47-3ed1-47cd-9345-922398ea874d	\N
4449	1	697d2524-9acc-41f3-b55b-941b34d08eb8	\N
4450	1	9a6a699d-23b6-406c-8172-8c8e80832814	\N
21917	1	570a0ec3-32d5-4291-84f9-a6c8152b99a0	\N
52824	1	c5283fa6-2f91-4359-beae-cac4d08cbada	calendario españa
52823	2	5e035987-4bd8-4f33-87b1-a015e2f5e458	calendario - 3
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-06-13	\N	2	0
1314	3	2010-06-13	\N	3	0
1316	2	2010-06-13	\N	5	0
4646	2	2010-06-14	\N	4444	0
4647	1	2010-06-14	\N	4445	0
4648	1	2010-06-14	\N	4446	0
4649	1	2010-06-14	\N	4447	0
4650	2	2010-06-14	\N	4448	0
4651	1	2010-06-14	\N	4449	0
4652	1	2010-06-14	\N	4450	0
22119	1	2010-06-14	\N	21917	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
101	1	d0f2f4ae-8926-4ef0-a24c-7f7f1feee225	\N	\N	1	0
102	1	5dcd06a8-5bf7-4f0a-b22f-e96c1dd97124	1	\N	2	0
103	3	a6600c81-6dd8-4603-a436-ae3ab3a85b65	1	\N	3	0
105	2	92bf9dec-53b9-4d28-88fc-52241fd90430	1	\N	5	0
4545	2	c6e69c26-8bba-4918-b49d-a8c0b9b1c442	1	\N	4444	0
4546	1	64d2247c-2066-4833-8941-1b5c0bd304e1	1	\N	4445	0
4547	1	29e5cb45-3cb3-4e1d-973c-f9f9110c0b7f	1	\N	4446	0
4548	1	4be9c076-9dec-49aa-8b8c-c49ea0cfa7e4	1	\N	4447	0
4549	2	7a0e6b57-50ac-49a3-a701-7ec79f2bc522	1	\N	4448	0
4550	1	3cce9429-94d2-4a84-b866-5ff33e2f64f5	1	\N	4449	0
4551	1	5e2f282b-8318-4c6f-b1aa-52df873e8f82	1	\N	4450	0
22018	1	12480924-24ef-4d7a-bff5-863f3e3321e0	1	\N	21917	0
52925	1	cdecfdb0-0bac-4eac-a188-eeaaaa78285b	\N	\N	52824	0
52924	2	26bd3e0c-0258-4690-bee1-5e7a72cd4940	52824	2010-06-24	52823	0
52926	1	4bd3e8c4-29a5-4b5b-905b-c6cd4387e23d	52824	\N	52823	1
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
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
6565	NonCalculated	15	2010-06-25	20.00	2010-07-21	5454	6383
51423	NonCalculated	0	2010-06-16	70.00	2010-07-17	22830	51116
46561	NonCalculated	5	2010-06-24	15.00	2010-07-01	22828	46477
49187	NonCalculated	4	2010-07-16	10.00	2010-07-29	22829	48905
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
5454	NonCalculated	21	5353	\N
22830	NonCalculated	0	22729	\N
22828	NonCalculated	5	22727	\N
22829	NonCalculated	3	22728	\N
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, code, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
505	14	88922432-9273-4424-8a2b-8f12feb2a52c	medicalLeave	t	131072	\N
506	13	0950fe65-93d7-4be8-a409-be71a15b6a6d	paternityLeave	t	131072	\N
507	4	8a7d32d6-05b5-4564-86af-b9c83129f31c	hiredResourceWorkingRelationship	t	131076	\N
508	3	8b24931b-c856-44b4-8e9b-cee668109b8f	firedResourceWorkingRelationship	t	131076	\N
509	1	60a0aa3a-7d89-4da7-b969-cea4d3debdcb	Serras	t	131078	\N
510	1	8dba1e21-572d-4c51-835b-3d5a9af7011d	Tornos	t	131078	\N
4753	1	b750558d-8406-431b-9627-8a5613136f62	Ciclo medio electricista	t	131074	\N
4754	1	dc894670-7e51-4aab-83a7-9f4a83665499	Ciclo medio soldadura	t	131074	\N
4755	1	86f7c98c-9cf2-4966-9e5d-b81081f6b006	Ciclo medio tecnologías de la información	t	131074	\N
4756	1	8c1a2c3a-bb12-47cb-aa69-fc98f0df2bcc	Ciclo superior soldadura	t	131074	\N
4757	1	c19886b3-9644-42ca-9625-de225877507a	Electricista	t	131075	\N
4750	2	19674a9d-7408-43e6-bffa-36b9d263f766	Revestidor	t	131075	\N
4758	1	c061322d-e3c2-46f0-880d-8aaac91364a8	Fontanero	t	131075	\N
4749	2	478bbf49-f2d6-4bd4-a1be-1b34e6073b64	Pulidor	t	131075	\N
4751	2	d4c3a0f2-1de4-4162-9475-d8b621a46dcb	Pintor	t	131075	\N
4747	2	2385e1b8-fe90-4a7e-a36e-a40bc7337320	Soldador	t	131075	\N
4748	2	dd23eea0-15ab-40e0-8ecf-68bb25672d85	Andamiero	t	131075	\N
4752	2	7dfba9b4-6e73-4ad2-a0bd-45f9e7401b37	Tornero	t	131075	\N
4759	1	6ab1550f-2fa6-40c9-ac13-d79d3df718dc	Carpintero	t	131075	\N
4760	1	3a270823-a27f-4e91-a897-6fe052be59de	Oficial 2º	t	131073	\N
4761	1	0e7e9b0b-491b-4f96-a161-3150e2e9a48f	Peón	t	131073	\N
4762	1	5ab495e9-714e-4818-a91f-01e4286b373c	Oficial 1º	t	131073	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
26267	INDIRECT	9	26364	\N	\N	510	26266	t
26268	DIRECT	10	\N	25901	\N	4747	\N	\N
43311	DIRECT	6	\N	43464	\N	4751	\N	\N
5798	DIRECT	19	\N	4980	\N	4751	\N	\N
5799	INDIRECT	13	5272	\N	\N	4751	5798	t
5800	DIRECT	19	\N	4981	\N	4747	\N	\N
43313	DIRECT	6	\N	43465	\N	4747	\N	\N
26262	DIRECT	10	\N	25897	\N	4747	\N	\N
26263	INDIRECT	10	26362	\N	\N	4747	26262	t
26264	DIRECT	10	\N	25898	\N	4751	\N	\N
26265	INDIRECT	9	26363	\N	\N	4751	26264	t
26266	DIRECT	10	\N	25899	\N	510	\N	\N
26269	INDIRECT	7	26365	\N	\N	4747	26268	t
23090	INDIRECT	8	22636	\N	\N	4747	23089	t
26270	DIRECT	10	\N	25902	\N	4751	\N	\N
26271	INDIRECT	7	26366	\N	\N	4751	26270	t
5801	INDIRECT	14	5273	\N	\N	4747	5800	t
14960	INDIRECT	9	9106	\N	\N	4747	5800	t
5802	DIRECT	19	\N	4982	\N	4747	\N	\N
5803	INDIRECT	14	5274	\N	\N	4747	5802	t
26272	DIRECT	10	\N	25903	\N	4751	\N	\N
5804	DIRECT	19	\N	4983	\N	4751	\N	\N
26273	INDIRECT	7	26367	\N	\N	4751	26272	t
23100	INDIRECT	5	22641	\N	\N	4751	23099	t
5805	INDIRECT	11	5275	\N	\N	4751	5804	t
5806	DIRECT	19	\N	4984	\N	4751	\N	\N
5807	INDIRECT	19	\N	4985	\N	4751	5806	t
5808	INDIRECT	12	5276	\N	\N	4751	5806	t
5809	INDIRECT	19	\N	4986	\N	4751	5806	t
5810	INDIRECT	11	5277	\N	\N	4751	5806	t
5811	INDIRECT	19	\N	4987	\N	4751	5806	t
5812	INDIRECT	10	5278	\N	\N	4751	5806	t
5813	INDIRECT	19	\N	4988	\N	4751	5806	t
5814	INDIRECT	10	5279	\N	\N	4751	5806	t
5815	DIRECT	19	\N	4989	\N	4747	\N	\N
5816	INDIRECT	19	\N	4990	\N	4747	5815	t
5817	INDIRECT	15	5280	\N	\N	4747	5815	t
5818	INDIRECT	19	\N	4991	\N	4747	5815	t
5819	INDIRECT	15	5281	\N	\N	4747	5815	t
26774	DIRECT	1	\N	\N	26614	4751	\N	\N
26775	INDIRECT	1	26414	\N	\N	4751	26774	t
26776	DIRECT	1	\N	\N	26615	4747	\N	\N
26777	INDIRECT	1	26415	\N	\N	4747	26776	t
26779	DIRECT	1	\N	\N	26616	4747	\N	\N
25786	DIRECT	2	\N	\N	25436	4747	\N	\N
25787	INDIRECT	2	25720	\N	\N	4747	25786	t
25788	DIRECT	2	\N	\N	25437	4751	\N	\N
25789	INDIRECT	2	25721	\N	\N	4751	25788	t
25790	DIRECT	2	\N	\N	25438	510	\N	\N
25791	INDIRECT	2	25722	\N	\N	510	25790	t
25792	DIRECT	2	\N	\N	25440	4747	\N	\N
25793	INDIRECT	2	25723	\N	\N	4747	25792	t
25794	DIRECT	2	\N	\N	25441	4751	\N	\N
25795	INDIRECT	2	25724	\N	\N	4751	25794	t
25796	DIRECT	2	\N	\N	25442	4751	\N	\N
25797	INDIRECT	2	25725	\N	\N	4751	25796	t
26778	INDIRECT	1	26416	\N	\N	4747	26776	t
26780	INDIRECT	1	26417	\N	\N	4747	26779	t
26781	DIRECT	1	\N	\N	26617	4751	\N	\N
26782	INDIRECT	1	26418	\N	\N	4751	26781	t
26783	DIRECT	1	\N	\N	26618	4751	\N	\N
26784	INDIRECT	1	\N	\N	26619	4751	26783	t
26785	INDIRECT	1	26419	\N	\N	4751	26783	t
26786	INDIRECT	1	\N	\N	26620	4751	26783	t
26787	INDIRECT	1	26420	\N	\N	4751	26783	t
26788	INDIRECT	1	\N	\N	26621	4751	26783	t
26789	INDIRECT	1	26421	\N	\N	4751	26783	t
26790	INDIRECT	1	\N	\N	26622	4751	26783	t
26791	INDIRECT	1	26422	\N	\N	4751	26783	t
26792	DIRECT	1	\N	\N	26623	4747	\N	\N
26793	INDIRECT	1	\N	\N	26624	4747	26792	t
26794	INDIRECT	1	26423	\N	\N	4747	26792	t
26795	INDIRECT	1	\N	\N	26625	4747	26792	t
26796	INDIRECT	1	26424	\N	\N	4747	26792	t
43316	DIRECT	6	\N	43466	\N	4747	\N	\N
43318	DIRECT	6	\N	43467	\N	4751	\N	\N
43320	DIRECT	6	\N	43468	\N	4751	\N	\N
43315	INDIRECT	6	43369	\N	\N	4747	43313	t
43314	INDIRECT	6	43368	\N	\N	4747	43313	t
43317	INDIRECT	4	43370	\N	\N	4747	43316	t
23099	DIRECT	11	\N	22345	\N	4751	\N	\N
23096	INDIRECT	7	22639	\N	\N	4747	23095	t
23092	INDIRECT	7	22637	\N	\N	4751	23091	t
23098	INDIRECT	7	22640	\N	\N	4751	23097	t
43319	INDIRECT	4	43371	\N	\N	4751	43318	t
43321	INDIRECT	6	\N	43469	\N	4751	43320	t
43323	INDIRECT	6	\N	43470	\N	4751	43320	t
31631	DIRECT	4	\N	31815	\N	4747	\N	\N
31613	DIRECT	4	\N	25948	\N	4751	\N	\N
31614	INDIRECT	4	26458	\N	\N	4751	31613	t
31615	DIRECT	4	\N	25949	\N	4747	\N	\N
31616	INDIRECT	4	26459	\N	\N	4747	31615	t
31617	INDIRECT	4	26460	\N	\N	4747	31615	t
31618	DIRECT	4	\N	25950	\N	4747	\N	\N
31619	INDIRECT	5	26461	\N	\N	4747	31618	t
31620	DIRECT	4	\N	25951	\N	4751	\N	\N
31621	INDIRECT	4	31714	\N	\N	4751	31620	t
31622	DIRECT	4	\N	25952	\N	4751	\N	\N
31623	INDIRECT	4	\N	25953	\N	4751	31622	t
31624	INDIRECT	4	31715	\N	\N	4751	31622	t
31625	INDIRECT	4	\N	25954	\N	4751	31622	t
31626	INDIRECT	4	31716	\N	\N	4751	31622	t
31627	INDIRECT	4	\N	25955	\N	4751	31622	t
31628	INDIRECT	4	31717	\N	\N	4751	31622	t
31629	INDIRECT	4	\N	25956	\N	4751	31622	t
31630	INDIRECT	4	31718	\N	\N	4751	31622	t
31632	INDIRECT	4	\N	31816	\N	4747	31631	t
31633	INDIRECT	4	31719	\N	\N	4747	31631	t
31634	INDIRECT	4	\N	31817	\N	4747	31631	t
43322	INDIRECT	4	43372	\N	\N	4751	43320	t
43324	INDIRECT	4	43373	\N	\N	4751	43320	t
43325	INDIRECT	6	\N	43471	\N	4751	43320	t
43327	INDIRECT	6	\N	43472	\N	4751	43320	t
43733	DIRECT	6	\N	43473	\N	4747	\N	\N
43326	INDIRECT	4	43374	\N	\N	4751	43320	t
43734	INDIRECT	6	\N	43474	\N	4747	43733	t
43328	INDIRECT	4	43375	\N	\N	4751	43320	t
43736	INDIRECT	6	\N	43475	\N	4747	43733	t
43312	INDIRECT	7	43367	\N	\N	4751	43311	t
43735	INDIRECT	4	43376	\N	\N	4747	43733	t
31635	INDIRECT	4	31720	\N	\N	4747	31631	t
43737	INDIRECT	4	43377	\N	\N	4747	43733	t
43774	DIRECT	2	\N	43501	\N	4747	\N	\N
43776	DIRECT	2	\N	43502	\N	4751	\N	\N
43777	INDIRECT	2	43397	\N	\N	4751	43776	t
43778	DIRECT	2	\N	43503	\N	510	\N	\N
43779	INDIRECT	2	43398	\N	\N	510	43778	t
43780	DIRECT	2	\N	43505	\N	4747	\N	\N
43781	INDIRECT	2	43399	\N	\N	4747	43780	t
43782	DIRECT	2	\N	43506	\N	4751	\N	\N
43783	INDIRECT	2	43400	\N	\N	4751	43782	t
43784	DIRECT	2	\N	43507	\N	4751	\N	\N
43785	INDIRECT	2	43401	\N	\N	4751	43784	t
43775	INDIRECT	3	43396	\N	\N	4747	43774	t
47513	INDIRECT	1	47693	\N	\N	4747	47512	t
23114	INDIRECT	5	22638	\N	\N	510	23107	t
47506	DIRECT	1	\N	\N	47394	4747	\N	\N
47507	INDIRECT	1	47690	\N	\N	4747	47506	t
47508	DIRECT	1	\N	\N	47395	4751	\N	\N
47509	INDIRECT	1	47691	\N	\N	4751	47508	t
47510	DIRECT	1	\N	\N	47396	510	\N	\N
47511	INDIRECT	1	47692	\N	\N	510	47510	t
47512	DIRECT	1	\N	\N	47398	4747	\N	\N
47514	DIRECT	1	\N	\N	47399	4751	\N	\N
47515	INDIRECT	1	47694	\N	\N	4751	47514	t
47516	DIRECT	1	\N	\N	47400	4751	\N	\N
47517	INDIRECT	1	47695	\N	\N	4751	47516	t
23089	DIRECT	11	\N	22339	\N	4747	\N	\N
23091	DIRECT	11	\N	22340	\N	4751	\N	\N
23107	DIRECT	8	\N	22341	\N	510	\N	\N
23095	DIRECT	11	\N	22343	\N	4747	\N	\N
47554	DIRECT	2	\N	47798	\N	4747	\N	\N
47555	INDIRECT	2	47714	\N	\N	4747	47554	t
47556	DIRECT	2	\N	47799	\N	4751	\N	\N
23097	DIRECT	11	\N	22344	\N	4751	\N	\N
47557	INDIRECT	2	47715	\N	\N	4751	47556	t
47558	DIRECT	2	\N	47800	\N	510	\N	\N
47559	INDIRECT	2	47716	\N	\N	510	47558	t
47560	DIRECT	2	\N	47802	\N	4747	\N	\N
47561	INDIRECT	2	47717	\N	\N	4747	47560	t
47562	DIRECT	2	\N	47803	\N	4751	\N	\N
47563	INDIRECT	2	47718	\N	\N	4751	47562	t
47564	DIRECT	2	\N	47804	\N	4751	\N	\N
47565	INDIRECT	2	47719	\N	\N	4751	47564	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2626	2	c0c879d6-1d67-4262-bccd-698d8a6cc04c	2010-06-13 00:00:00	\N	f	510	1216
2627	1	df020c7d-8a9b-407d-8cd0-e2dd81da7463	2010-06-13 12:42:41.932	\N	f	510	1220
4848	1	79097724-5c5c-449c-9402-65968bd4213f	2010-06-14 12:56:07.532	\N	f	4747	4344
4849	1	c64b2471-fe3a-4948-ae4e-4b007ba35c0b	2010-06-14 12:57:11.852	\N	f	4747	4348
4850	1	9f966399-4383-4e12-96f5-5fbaf1570188	2010-06-14 00:00:00	\N	f	4747	4350
4851	1	a387e54a-5903-4821-b768-03bb230cdb70	2010-06-14 12:57:53.247	\N	f	4751	4352
4852	2	3ce6d0f5-c10f-4c6f-8ae0-8544173599a5	2010-06-14 00:00:00	\N	f	4751	4354
4853	1	71712208-998e-42c0-8f9a-b08849f3ef9c	2010-06-14 00:00:00	\N	f	4747	4358
22220	1	2caf2d13-f23c-4f60-beaa-ee2e494d6044	2010-06-14 18:08:20.558	2010-07-14 00:00:00	f	4747	21817
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
131072	15	3d1358b7-eb8e-40bc-8c3b-f6cca7f89b68	LEAVE	Leave	f	f	t	f	1
131076	5	2bb2ac50-d133-4a65-94b6-781aaea01195	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
131077	1	a25159a6-5ec3-43b8-a423-f7aa6723e237	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
131078	1	9c3603cb-62fb-469c-a2c9-8c856e923a9a	Tipo de maquina	Este criterio faise para clasificar os distintos tipos de maquinas	t	f	t	t	2
131074	10	2b1d47d1-5b13-4e5b-8ccf-874309111813	Formación	Training courses and labor training	t	t	t	f	1
131075	9	0a2fd812-e7d8-4774-9030-224bf0462ee5	Tipo de trabajo	Job	t	t	t	f	1
131073	12	ce41a9f3-76fd-4b87-a042-77615da665a5	Categoría profesional	Professional category	t	t	t	f	1
2424832	13	5632c9cf-046f-4141-8d7e-47ffb792cc24	CATEGORY	Professional category	t	t	t	f	1
2424833	11	414260c8-691a-4a87-927c-4ccc85569626	TRAINING	Training courses and labor training	t	t	t	f	1
2424834	9	0282320c-65cd-467d-abec-be8a4c1ce3a8	JOB	Job	t	t	t	f	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
2897	SPECIFIC_DAY	7	8	f	2010-06-21	1216	2729	\N	\N
2895	SPECIFIC_DAY	7	0	f	2010-06-27	1216	2729	\N	\N
2882	SPECIFIC_DAY	7	8	f	2010-06-15	1216	2729	\N	\N
2892	SPECIFIC_DAY	7	0	f	2010-06-13	1216	2729	\N	\N
2888	SPECIFIC_DAY	7	0	f	2010-06-20	1216	2729	\N	\N
2883	SPECIFIC_DAY	7	8	f	2010-06-18	1216	2729	\N	\N
2884	SPECIFIC_DAY	7	0	f	2010-06-19	1216	2729	\N	\N
2890	SPECIFIC_DAY	7	4	f	2010-06-30	1216	2729	\N	\N
2896	SPECIFIC_DAY	7	8	f	2010-06-14	1216	2729	\N	\N
31447	SPECIFIC_DAY	0	8	f	2010-08-03	4352	31212	\N	\N
31448	SPECIFIC_DAY	0	8	f	2010-07-28	4352	31212	\N	\N
31449	SPECIFIC_DAY	0	0	f	2010-06-19	4352	31212	\N	\N
31450	SPECIFIC_DAY	0	8	f	2010-07-19	4352	31212	\N	\N
31451	SPECIFIC_DAY	0	8	f	2010-06-22	4352	31212	\N	\N
31452	SPECIFIC_DAY	0	8	f	2010-07-07	4352	31212	\N	\N
31453	SPECIFIC_DAY	0	0	f	2010-07-11	4352	31212	\N	\N
31454	SPECIFIC_DAY	0	8	f	2010-07-21	4352	31212	\N	\N
31455	SPECIFIC_DAY	0	8	f	2010-07-12	4352	31212	\N	\N
31456	SPECIFIC_DAY	0	8	f	2010-07-27	4352	31212	\N	\N
31457	SPECIFIC_DAY	0	8	f	2010-06-29	4352	31212	\N	\N
31458	SPECIFIC_DAY	0	0	f	2010-07-03	4352	31212	\N	\N
31459	SPECIFIC_DAY	0	8	f	2010-06-30	4352	31212	\N	\N
31460	SPECIFIC_DAY	0	8	f	2010-07-26	4352	31212	\N	\N
31461	SPECIFIC_DAY	0	8	f	2010-07-06	4352	31212	\N	\N
31462	SPECIFIC_DAY	0	8	f	2010-06-25	4352	31212	\N	\N
31463	SPECIFIC_DAY	0	8	f	2010-07-01	4352	31212	\N	\N
31464	SPECIFIC_DAY	0	8	f	2010-07-09	4352	31212	\N	\N
31465	SPECIFIC_DAY	0	0	f	2010-06-13	4352	31212	\N	\N
31466	SPECIFIC_DAY	0	8	f	2010-06-28	4352	31212	\N	\N
31467	SPECIFIC_DAY	0	0	f	2010-07-17	4352	31212	\N	\N
31468	SPECIFIC_DAY	0	8	f	2010-06-18	4352	31212	\N	\N
31469	SPECIFIC_DAY	0	0	f	2010-07-18	4352	31212	\N	\N
31470	SPECIFIC_DAY	0	0	f	2010-06-27	4352	31212	\N	\N
31471	SPECIFIC_DAY	0	0	f	2010-08-01	4352	31212	\N	\N
31472	SPECIFIC_DAY	0	0	f	2010-07-25	4352	31212	\N	\N
31473	SPECIFIC_DAY	0	8	f	2010-07-08	4352	31212	\N	\N
31474	SPECIFIC_DAY	0	8	f	2010-07-15	4352	31212	\N	\N
31475	SPECIFIC_DAY	0	8	f	2010-08-02	4352	31212	\N	\N
31476	SPECIFIC_DAY	0	8	f	2010-06-16	4352	31212	\N	\N
31477	SPECIFIC_DAY	0	4	f	2010-08-04	4352	31212	\N	\N
31478	SPECIFIC_DAY	0	0	f	2010-07-04	4352	31212	\N	\N
31479	SPECIFIC_DAY	0	0	f	2010-07-10	4352	31212	\N	\N
31480	SPECIFIC_DAY	0	8	f	2010-07-13	4352	31212	\N	\N
31481	SPECIFIC_DAY	0	8	f	2010-06-17	4352	31212	\N	\N
31482	SPECIFIC_DAY	0	8	f	2010-07-02	4352	31212	\N	\N
31483	SPECIFIC_DAY	0	8	f	2010-06-15	4352	31212	\N	\N
31484	SPECIFIC_DAY	0	0	f	2010-06-20	4352	31212	\N	\N
31485	SPECIFIC_DAY	0	8	f	2010-06-14	4352	31212	\N	\N
31486	SPECIFIC_DAY	0	0	f	2010-07-31	4352	31212	\N	\N
31487	SPECIFIC_DAY	0	8	f	2010-06-24	4352	31212	\N	\N
31488	SPECIFIC_DAY	0	8	f	2010-07-05	4352	31212	\N	\N
31489	SPECIFIC_DAY	0	8	f	2010-06-21	4352	31212	\N	\N
31490	SPECIFIC_DAY	0	8	f	2010-06-23	4352	31212	\N	\N
31491	SPECIFIC_DAY	0	8	f	2010-07-16	4352	31212	\N	\N
31492	SPECIFIC_DAY	0	0	f	2010-06-26	4352	31212	\N	\N
31493	SPECIFIC_DAY	0	8	f	2010-07-20	4352	31212	\N	\N
31494	SPECIFIC_DAY	0	8	f	2010-07-30	4352	31212	\N	\N
31495	SPECIFIC_DAY	0	8	f	2010-07-22	4352	31212	\N	\N
31496	SPECIFIC_DAY	0	8	f	2010-07-14	4352	31212	\N	\N
31497	SPECIFIC_DAY	0	8	f	2010-07-23	4352	31212	\N	\N
31498	SPECIFIC_DAY	0	0	f	2010-07-24	4352	31212	\N	\N
31499	SPECIFIC_DAY	0	8	f	2010-07-29	4352	31212	\N	\N
38307	SPECIFIC_DAY	2	0	f	2010-11-27	1216	31224	\N	\N
38299	SPECIFIC_DAY	2	8	f	2011-01-03	1216	31224	\N	\N
38316	SPECIFIC_DAY	2	8	f	2010-12-28	1216	31224	\N	\N
38326	SPECIFIC_DAY	2	8	f	2010-12-23	1216	31224	\N	\N
38314	SPECIFIC_DAY	2	0	f	2010-12-11	1216	31224	\N	\N
38331	SPECIFIC_DAY	2	8	f	2010-12-30	1216	31224	\N	\N
44037	GENERIC_DAY	1	8	f	2010-06-25	4354	\N	42525	\N
44038	GENERIC_DAY	1	0	f	2010-06-26	4352	\N	42525	\N
38337	SPECIFIC_DAY	2	8	f	2010-12-27	1216	31224	\N	\N
38342	SPECIFIC_DAY	2	8	f	2010-12-15	1216	31224	\N	\N
38340	SPECIFIC_DAY	2	0	f	2011-01-02	1216	31224	\N	\N
38336	SPECIFIC_DAY	2	0	f	2010-12-19	1216	31224	\N	\N
38335	SPECIFIC_DAY	2	8	f	2010-12-02	1216	31224	\N	\N
38338	SPECIFIC_DAY	2	8	f	2011-01-04	1216	31224	\N	\N
38339	SPECIFIC_DAY	2	8	f	2010-12-03	1216	31224	\N	\N
38341	SPECIFIC_DAY	2	8	f	2010-12-22	1216	31224	\N	\N
38343	SPECIFIC_DAY	2	0	f	2010-11-16	1216	31224	\N	\N
44039	GENERIC_DAY	1	0	f	2010-07-05	4354	\N	42525	\N
44040	GENERIC_DAY	1	4	f	2010-06-28	4354	\N	42525	\N
44041	GENERIC_DAY	1	0	f	2010-07-18	4354	\N	42525	\N
44042	GENERIC_DAY	1	7	f	2010-06-21	4354	\N	42525	\N
44043	GENERIC_DAY	1	8	f	2010-06-23	4354	\N	42525	\N
44044	GENERIC_DAY	1	4	f	2010-06-30	4352	\N	42525	\N
44045	GENERIC_DAY	1	0	f	2010-07-11	4352	\N	42525	\N
44046	GENERIC_DAY	1	0	f	2010-06-19	4354	\N	42525	\N
21472	GENERIC_DAY	3	0	f	2010-07-04	4350	\N	16773	\N
21473	GENERIC_DAY	3	1	f	2010-07-28	4348	\N	16773	\N
21474	GENERIC_DAY	3	4	f	2010-07-07	4348	\N	16773	\N
21475	GENERIC_DAY	3	2	f	2010-07-22	4348	\N	16773	\N
21476	GENERIC_DAY	3	0	f	2010-07-18	4350	\N	16773	\N
21477	GENERIC_DAY	3	0	f	2010-07-04	4344	\N	16773	\N
21478	GENERIC_DAY	3	2	f	2010-07-23	4350	\N	16773	\N
21479	GENERIC_DAY	3	0	f	2010-07-10	4348	\N	16773	\N
21480	GENERIC_DAY	3	0	f	2010-07-25	4348	\N	16773	\N
21481	GENERIC_DAY	3	0	f	2010-07-11	4344	\N	16773	\N
21482	GENERIC_DAY	3	2	f	2010-07-09	4358	\N	16773	\N
21483	GENERIC_DAY	3	2	f	2010-07-26	4344	\N	16773	\N
21484	GENERIC_DAY	3	0	f	2010-07-07	4350	\N	16773	\N
21485	GENERIC_DAY	3	0	f	2010-07-25	4350	\N	16773	\N
21486	GENERIC_DAY	3	2	f	2010-07-12	4358	\N	16773	\N
21487	GENERIC_DAY	3	2	f	2010-07-19	4358	\N	16773	\N
27706	GENERIC_DAY	8	4	f	2010-08-31	4352	\N	27075	\N
27698	GENERIC_DAY	8	0	f	2010-09-05	4354	\N	27075	\N
27685	GENERIC_DAY	8	4	f	2010-08-11	4352	\N	27075	\N
27687	GENERIC_DAY	8	4	f	2010-08-20	4354	\N	27075	\N
27699	GENERIC_DAY	8	4	f	2010-08-17	4354	\N	27075	\N
27711	GENERIC_DAY	8	0	f	2010-09-04	4352	\N	27075	\N
27693	GENERIC_DAY	8	0	f	2010-08-29	4352	\N	27075	\N
27707	GENERIC_DAY	8	4	f	2010-08-27	4354	\N	27075	\N
27690	GENERIC_DAY	8	4	f	2010-08-23	4354	\N	27075	\N
27712	GENERIC_DAY	8	4	f	2010-08-27	4352	\N	27075	\N
27686	GENERIC_DAY	8	4	f	2010-08-25	4354	\N	27075	\N
27691	GENERIC_DAY	8	4	f	2010-08-12	4354	\N	27075	\N
27709	GENERIC_DAY	8	4	f	2010-09-01	4354	\N	27075	\N
27695	GENERIC_DAY	8	4	f	2010-08-04	4352	\N	27075	\N
27694	GENERIC_DAY	8	4	f	2010-09-06	4352	\N	27075	\N
27713	GENERIC_DAY	8	4	f	2010-08-19	4354	\N	27075	\N
27696	GENERIC_DAY	8	4	f	2010-08-17	4352	\N	27075	\N
27714	GENERIC_DAY	8	4	f	2010-08-16	4354	\N	27075	\N
27700	GENERIC_DAY	8	4	f	2010-08-31	4354	\N	27075	\N
27702	GENERIC_DAY	8	4	f	2010-08-10	4352	\N	27075	\N
27708	GENERIC_DAY	8	4	f	2010-08-09	4354	\N	27075	\N
27688	GENERIC_DAY	8	0	f	2010-08-28	4352	\N	27075	\N
27697	GENERIC_DAY	8	4	f	2010-08-04	4354	\N	27075	\N
27704	GENERIC_DAY	8	4	f	2010-08-18	4354	\N	27075	\N
27689	GENERIC_DAY	8	4	f	2010-08-06	4354	\N	27075	\N
27692	GENERIC_DAY	8	4	f	2010-08-13	4352	\N	27075	\N
27703	GENERIC_DAY	8	4	f	2010-08-03	4352	\N	27075	\N
27701	GENERIC_DAY	8	0	f	2010-08-08	4354	\N	27075	\N
27705	GENERIC_DAY	8	4	f	2010-09-06	4354	\N	27075	\N
27710	GENERIC_DAY	8	0	f	2010-09-04	4354	\N	27075	\N
4291	SPECIFIC_DAY	3	8	f	2010-07-20	1220	2731	\N	\N
4287	SPECIFIC_DAY	3	8	f	2010-07-30	1220	2731	\N	\N
4278	SPECIFIC_DAY	3	8	f	2010-08-02	1220	2731	\N	\N
4277	SPECIFIC_DAY	3	0	f	2010-07-24	1220	2731	\N	\N
4290	SPECIFIC_DAY	3	8	f	2010-07-26	1220	2731	\N	\N
4280	SPECIFIC_DAY	3	8	f	2010-07-21	1220	2731	\N	\N
4281	SPECIFIC_DAY	3	0	f	2010-07-25	1220	2731	\N	\N
4292	SPECIFIC_DAY	3	0	f	2010-07-16	1220	2731	\N	\N
4285	SPECIFIC_DAY	3	8	f	2010-08-03	1220	2731	\N	\N
4289	SPECIFIC_DAY	3	0	f	2010-07-17	1220	2731	\N	\N
4295	SPECIFIC_DAY	3	8	f	2010-07-29	1220	2731	\N	\N
4286	SPECIFIC_DAY	3	8	f	2010-07-19	1220	2731	\N	\N
4282	SPECIFIC_DAY	3	8	f	2010-07-28	1220	2731	\N	\N
4276	SPECIFIC_DAY	3	8	f	2010-07-27	1220	2731	\N	\N
2880	SPECIFIC_DAY	7	8	f	2010-06-25	1216	2729	\N	\N
2894	SPECIFIC_DAY	7	8	f	2010-06-29	1216	2729	\N	\N
2889	SPECIFIC_DAY	7	8	f	2010-06-28	1216	2729	\N	\N
2886	SPECIFIC_DAY	7	8	f	2010-06-22	1216	2729	\N	\N
2885	SPECIFIC_DAY	7	8	f	2010-06-16	1216	2729	\N	\N
2887	SPECIFIC_DAY	7	8	f	2010-06-17	1216	2729	\N	\N
2893	SPECIFIC_DAY	7	8	f	2010-06-24	1216	2729	\N	\N
2891	SPECIFIC_DAY	7	8	f	2010-06-23	1216	2729	\N	\N
2881	SPECIFIC_DAY	7	0	f	2010-06-26	1216	2729	\N	\N
4257	SPECIFIC_DAY	3	8	f	2010-07-02	1220	2730	\N	\N
4244	SPECIFIC_DAY	3	0	f	2010-07-11	1220	2730	\N	\N
4253	SPECIFIC_DAY	3	8	f	2010-07-14	1220	2730	\N	\N
4243	SPECIFIC_DAY	3	8	f	2010-07-15	1220	2730	\N	\N
4254	SPECIFIC_DAY	3	8	f	2010-07-07	1220	2730	\N	\N
4258	SPECIFIC_DAY	3	8	f	2010-07-08	1220	2730	\N	\N
4256	SPECIFIC_DAY	3	8	f	2010-07-06	1220	2730	\N	\N
4255	SPECIFIC_DAY	3	4	f	2010-06-30	1220	2730	\N	\N
4242	SPECIFIC_DAY	3	0	f	2010-07-10	1220	2730	\N	\N
4252	SPECIFIC_DAY	3	8	f	2010-07-13	1220	2730	\N	\N
4246	SPECIFIC_DAY	3	8	f	2010-07-12	1220	2730	\N	\N
4248	SPECIFIC_DAY	3	0	f	2010-07-04	1220	2730	\N	\N
4251	SPECIFIC_DAY	3	8	f	2010-07-01	1220	2730	\N	\N
4247	SPECIFIC_DAY	3	8	f	2010-07-05	1220	2730	\N	\N
4250	SPECIFIC_DAY	3	0	f	2010-07-03	1220	2730	\N	\N
4249	SPECIFIC_DAY	3	8	f	2010-07-09	1220	2730	\N	\N
4245	SPECIFIC_DAY	3	8	f	2010-07-16	1220	2730	\N	\N
27494	GENERIC_DAY	8	4	f	2010-07-29	4352	\N	27071	\N
27486	GENERIC_DAY	8	4	f	2010-07-23	4354	\N	27071	\N
27476	GENERIC_DAY	8	0	f	2010-08-01	4352	\N	27071	\N
4288	SPECIFIC_DAY	3	8	f	2010-07-23	1220	2731	\N	\N
4294	SPECIFIC_DAY	3	0	f	2010-08-01	1220	2731	\N	\N
4279	SPECIFIC_DAY	3	4	f	2010-08-04	1220	2731	\N	\N
4284	SPECIFIC_DAY	3	0	f	2010-07-18	1220	2731	\N	\N
4283	SPECIFIC_DAY	3	8	f	2010-07-22	1220	2731	\N	\N
4293	SPECIFIC_DAY	3	0	f	2010-07-31	1220	2731	\N	\N
27614	GENERIC_DAY	8	2	f	2010-08-06	4348	\N	27074	\N
27610	GENERIC_DAY	8	2	f	2010-08-04	4348	\N	27074	\N
27604	GENERIC_DAY	8	2	f	2010-08-23	4348	\N	27074	\N
27632	GENERIC_DAY	8	2	f	2010-08-09	4348	\N	27074	\N
27649	GENERIC_DAY	8	2	f	2010-08-04	4350	\N	27074	\N
27588	GENERIC_DAY	8	2	f	2010-08-16	4358	\N	27074	\N
27608	GENERIC_DAY	8	2	f	2010-08-11	4350	\N	27074	\N
27663	GENERIC_DAY	8	2	f	2010-08-19	4350	\N	27074	\N
27654	GENERIC_DAY	8	2	f	2010-08-26	4358	\N	27074	\N
27583	GENERIC_DAY	8	2	f	2010-08-24	4348	\N	27074	\N
27596	GENERIC_DAY	8	0	f	2010-08-22	4358	\N	27074	\N
27602	GENERIC_DAY	8	2	f	2010-08-20	4348	\N	27074	\N
27598	GENERIC_DAY	8	2	f	2010-08-13	4350	\N	27074	\N
27642	GENERIC_DAY	8	2	f	2010-08-11	4348	\N	27074	\N
27657	GENERIC_DAY	8	0	f	2010-08-08	4348	\N	27074	\N
27658	GENERIC_DAY	8	2	f	2010-08-17	4358	\N	27074	\N
27634	GENERIC_DAY	8	2	f	2010-08-26	4344	\N	27074	\N
27628	GENERIC_DAY	8	2	f	2010-08-19	4358	\N	27074	\N
27627	GENERIC_DAY	8	0	f	2010-08-15	4350	\N	27074	\N
27652	GENERIC_DAY	8	2	f	2010-08-25	4358	\N	27074	\N
27577	GENERIC_DAY	8	0	f	2010-08-15	4358	\N	27074	\N
27573	GENERIC_DAY	8	2	f	2010-08-20	4350	\N	27074	\N
27624	GENERIC_DAY	8	2	f	2010-08-18	4344	\N	27074	\N
27618	GENERIC_DAY	8	0	f	2010-08-14	4348	\N	27074	\N
27625	GENERIC_DAY	8	2	f	2010-08-06	4350	\N	27074	\N
27586	GENERIC_DAY	8	0	f	2010-08-14	4350	\N	27074	\N
27580	GENERIC_DAY	8	2	f	2010-08-05	4348	\N	27074	\N
27592	GENERIC_DAY	8	2	f	2010-08-03	4348	\N	27074	\N
27591	GENERIC_DAY	8	2	f	2010-08-17	4344	\N	27074	\N
37239	GENERIC_DAY	0	2	f	2010-11-19	4348	\N	27138	\N
37240	GENERIC_DAY	0	2	f	2010-12-03	4348	\N	27138	\N
37241	GENERIC_DAY	0	0	f	2010-11-20	4350	\N	27138	\N
37242	GENERIC_DAY	0	2	f	2010-11-10	4350	\N	27138	\N
37243	GENERIC_DAY	0	0	f	2010-12-04	4344	\N	27138	\N
37244	GENERIC_DAY	0	2	f	2010-11-26	4350	\N	27138	\N
37245	GENERIC_DAY	0	0	f	2010-12-12	4350	\N	27138	\N
37246	GENERIC_DAY	0	2	f	2010-11-23	4350	\N	27138	\N
37247	GENERIC_DAY	0	2	f	2010-11-12	4344	\N	27138	\N
37248	GENERIC_DAY	0	2	f	2010-11-30	4358	\N	27138	\N
37249	GENERIC_DAY	0	2	f	2010-11-23	4344	\N	27138	\N
37250	GENERIC_DAY	0	2	f	2010-12-13	4344	\N	27138	\N
37251	GENERIC_DAY	0	0	f	2010-12-11	4344	\N	27138	\N
37252	GENERIC_DAY	0	2	f	2010-12-02	4358	\N	27138	\N
37253	GENERIC_DAY	0	2	f	2010-11-22	4350	\N	27138	\N
37254	GENERIC_DAY	0	2	f	2010-11-10	4348	\N	27138	\N
37255	GENERIC_DAY	0	2	f	2010-11-18	4348	\N	27138	\N
27606	GENERIC_DAY	8	2	f	2010-08-24	4350	\N	27074	\N
27656	GENERIC_DAY	8	2	f	2010-08-09	4358	\N	27074	\N
27582	GENERIC_DAY	8	2	f	2010-08-25	4348	\N	27074	\N
27574	GENERIC_DAY	8	0	f	2010-08-22	4348	\N	27074	\N
27589	GENERIC_DAY	8	0	f	2010-08-07	4358	\N	27074	\N
27622	GENERIC_DAY	8	2	f	2010-08-19	4344	\N	27074	\N
27605	GENERIC_DAY	8	0	f	2010-08-08	4358	\N	27074	\N
27621	GENERIC_DAY	8	0	f	2010-08-07	4350	\N	27074	\N
27570	GENERIC_DAY	8	0	f	2010-08-21	4358	\N	27074	\N
27601	GENERIC_DAY	8	0	f	2010-08-15	4348	\N	27074	\N
27648	GENERIC_DAY	8	2	f	2010-08-12	4358	\N	27074	\N
27636	GENERIC_DAY	8	2	f	2010-08-09	4350	\N	27074	\N
27630	GENERIC_DAY	8	2	f	2010-08-09	4344	\N	27074	\N
27647	GENERIC_DAY	8	0	f	2010-08-15	4344	\N	27074	\N
27629	GENERIC_DAY	8	2	f	2010-08-06	4344	\N	27074	\N
27615	GENERIC_DAY	8	2	f	2010-08-25	4344	\N	27074	\N
27655	GENERIC_DAY	8	1	f	2010-08-27	4358	\N	27074	\N
27626	GENERIC_DAY	8	2	f	2010-08-13	4348	\N	27074	\N
27613	GENERIC_DAY	8	0	f	2010-08-21	4348	\N	27074	\N
27639	GENERIC_DAY	8	2	f	2010-08-25	4350	\N	27074	\N
27669	GENERIC_DAY	8	2	f	2010-08-24	4344	\N	27074	\N
27576	GENERIC_DAY	8	2	f	2010-08-20	4358	\N	27074	\N
27581	GENERIC_DAY	8	2	f	2010-08-23	4358	\N	27074	\N
27607	GENERIC_DAY	8	2	f	2010-08-12	4350	\N	27074	\N
27619	GENERIC_DAY	8	2	f	2010-08-23	4344	\N	27074	\N
27611	GENERIC_DAY	8	2	f	2010-08-10	4348	\N	27074	\N
27653	GENERIC_DAY	8	2	f	2010-08-16	4348	\N	27074	\N
27590	GENERIC_DAY	8	2	f	2010-08-13	4358	\N	27074	\N
27600	GENERIC_DAY	8	0	f	2010-08-08	4344	\N	27074	\N
27666	GENERIC_DAY	8	0	f	2010-08-22	4350	\N	27074	\N
27594	GENERIC_DAY	8	2	f	2010-08-03	4344	\N	27074	\N
27617	GENERIC_DAY	8	2	f	2010-08-05	4344	\N	27074	\N
27660	GENERIC_DAY	8	2	f	2010-08-20	4344	\N	27074	\N
27637	GENERIC_DAY	8	0	f	2010-08-14	4344	\N	27074	\N
27575	GENERIC_DAY	8	2	f	2010-08-18	4358	\N	27074	\N
27584	GENERIC_DAY	8	2	f	2010-08-10	4350	\N	27074	\N
27631	GENERIC_DAY	8	2	f	2010-08-04	4344	\N	27074	\N
27572	GENERIC_DAY	8	0	f	2010-08-07	4344	\N	27074	\N
27593	GENERIC_DAY	8	2	f	2010-08-26	4350	\N	27074	\N
27587	GENERIC_DAY	8	2	f	2010-08-17	4348	\N	27074	\N
27595	GENERIC_DAY	8	2	f	2010-08-16	4344	\N	27074	\N
27651	GENERIC_DAY	8	0	f	2010-08-22	4344	\N	27074	\N
27585	GENERIC_DAY	8	2	f	2010-08-06	4358	\N	27074	\N
27609	GENERIC_DAY	8	2	f	2010-08-26	4348	\N	27074	\N
27662	GENERIC_DAY	8	2	f	2010-08-11	4344	\N	27074	\N
27623	GENERIC_DAY	8	2	f	2010-08-27	4348	\N	27074	\N
27645	GENERIC_DAY	8	2	f	2010-08-19	4348	\N	27074	\N
27616	GENERIC_DAY	8	1	f	2010-08-27	4350	\N	27074	\N
6510	GENERIC_DAY	15	1	f	2010-07-03	4354	\N	5962	\N
6525	GENERIC_DAY	15	5	f	2010-07-16	4354	\N	5962	\N
6303	GENERIC_DAY	17	4	t	2010-06-21	4352	\N	5962	\N
6506	GENERIC_DAY	15	4	f	2010-07-06	4352	\N	5962	\N
6281	GENERIC_DAY	17	0	t	2010-06-20	4354	\N	5962	\N
6512	GENERIC_DAY	15	1	f	2010-07-10	4354	\N	5962	\N
6503	GENERIC_DAY	15	5	f	2010-07-01	4352	\N	5962	\N
6300	GENERIC_DAY	17	4	t	2010-06-22	4352	\N	5962	\N
6532	GENERIC_DAY	15	5	f	2010-07-07	4354	\N	5962	\N
6508	GENERIC_DAY	15	5	f	2010-07-02	4352	\N	5962	\N
6291	GENERIC_DAY	17	4	t	2010-06-15	4354	\N	5962	\N
6306	GENERIC_DAY	17	4	t	2010-06-21	4354	\N	5962	\N
6533	GENERIC_DAY	15	5	f	2010-06-28	4352	\N	5962	\N
6509	GENERIC_DAY	15	5	f	2010-07-05	4354	\N	5962	\N
6324	GENERIC_DAY	17	4	t	2010-06-22	4354	\N	5962	\N
6527	GENERIC_DAY	15	1	f	2010-07-11	4354	\N	5962	\N
6299	GENERIC_DAY	17	4	t	2010-06-25	4352	\N	5962	\N
6325	GENERIC_DAY	17	8	t	2010-06-14	4354	\N	5962	\N
6499	GENERIC_DAY	15	5	f	2010-07-08	4354	\N	5962	\N
6328	GENERIC_DAY	17	0	t	2010-06-19	4354	\N	5962	\N
6309	GENERIC_DAY	17	4	t	2010-06-17	4354	\N	5962	\N
6346	GENERIC_DAY	17	4	t	2010-06-25	4354	\N	5962	\N
6339	GENERIC_DAY	17	4	t	2010-06-18	4352	\N	5962	\N
6502	GENERIC_DAY	15	5	f	2010-06-30	4354	\N	5962	\N
6535	GENERIC_DAY	15	1	f	2010-07-17	4354	\N	5962	\N
6530	GENERIC_DAY	15	4	f	2010-07-08	4352	\N	5962	\N
6501	GENERIC_DAY	15	5	f	2010-07-09	4354	\N	5962	\N
6514	GENERIC_DAY	15	5	f	2010-07-01	4354	\N	5962	\N
6288	GENERIC_DAY	17	4	t	2010-06-23	4352	\N	5962	\N
37285	GENERIC_DAY	0	4	f	2010-09-20	4352	\N	27139	\N
37286	GENERIC_DAY	0	4	f	2010-10-11	4352	\N	27139	\N
37287	GENERIC_DAY	0	4	f	2010-09-27	4354	\N	27139	\N
37288	GENERIC_DAY	0	0	f	2010-09-26	4352	\N	27139	\N
37289	GENERIC_DAY	0	4	f	2010-09-16	4354	\N	27139	\N
37290	GENERIC_DAY	0	4	f	2010-09-22	4354	\N	27139	\N
27578	GENERIC_DAY	8	2	f	2010-08-23	4350	\N	27074	\N
27633	GENERIC_DAY	8	2	f	2010-08-16	4350	\N	27074	\N
27670	GENERIC_DAY	8	4	f	2010-08-30	4352	\N	27075	\N
27672	GENERIC_DAY	8	4	f	2010-09-03	4354	\N	27075	\N
27676	GENERIC_DAY	8	4	f	2010-08-20	4352	\N	27075	\N
27673	GENERIC_DAY	8	0	f	2010-08-21	4352	\N	27075	\N
27717	GENERIC_DAY	8	0	f	2010-08-07	4354	\N	27075	\N
27725	GENERIC_DAY	8	0	f	2010-08-22	4352	\N	27075	\N
27729	GENERIC_DAY	8	0	f	2010-08-15	4354	\N	27075	\N
27674	GENERIC_DAY	8	4	f	2010-08-25	4352	\N	27075	\N
27734	GENERIC_DAY	8	4	f	2010-08-05	4352	\N	27075	\N
27738	GENERIC_DAY	8	0	f	2010-09-05	4352	\N	27075	\N
27718	GENERIC_DAY	8	4	f	2010-08-12	4352	\N	27075	\N
27720	GENERIC_DAY	8	0	f	2010-08-14	4354	\N	27075	\N
27678	GENERIC_DAY	8	0	f	2010-08-14	4352	\N	27075	\N
27724	GENERIC_DAY	8	0	f	2010-08-15	4352	\N	27075	\N
27716	GENERIC_DAY	8	4	f	2010-08-16	4352	\N	27075	\N
27671	GENERIC_DAY	8	4	f	2010-08-05	4354	\N	27075	\N
27728	GENERIC_DAY	8	0	f	2010-08-28	4354	\N	27075	\N
27677	GENERIC_DAY	8	4	f	2010-08-24	4354	\N	27075	\N
27675	GENERIC_DAY	8	4	f	2010-09-02	4354	\N	27075	\N
27723	GENERIC_DAY	8	0	f	2010-08-07	4352	\N	27075	\N
27564	GENERIC_DAY	8	2	f	2010-09-23	4352	\N	27073	\N
27565	GENERIC_DAY	8	4	f	2010-09-22	4354	\N	27073	\N
27568	GENERIC_DAY	8	4	f	2010-09-08	4352	\N	27073	\N
27540	GENERIC_DAY	8	4	f	2010-09-10	4354	\N	27073	\N
27537	GENERIC_DAY	8	4	f	2010-09-07	4352	\N	27073	\N
27563	GENERIC_DAY	8	0	f	2010-09-18	4354	\N	27073	\N
27550	GENERIC_DAY	8	4	f	2010-09-09	4354	\N	27073	\N
27561	GENERIC_DAY	8	4	f	2010-09-10	4352	\N	27073	\N
27547	GENERIC_DAY	8	0	f	2010-09-18	4352	\N	27073	\N
27548	GENERIC_DAY	8	4	f	2010-09-14	4354	\N	27073	\N
27562	GENERIC_DAY	8	4	f	2010-09-21	4352	\N	27073	\N
27558	GENERIC_DAY	8	4	f	2010-09-08	4354	\N	27073	\N
27549	GENERIC_DAY	8	4	f	2010-09-09	4352	\N	27073	\N
27536	GENERIC_DAY	8	4	f	2010-09-20	4352	\N	27073	\N
27538	GENERIC_DAY	8	0	f	2010-09-19	4352	\N	27073	\N
27566	GENERIC_DAY	8	0	f	2010-09-11	4352	\N	27073	\N
27551	GENERIC_DAY	8	4	f	2010-09-17	4354	\N	27073	\N
27557	GENERIC_DAY	8	0	f	2010-09-19	4354	\N	27073	\N
27555	GENERIC_DAY	8	0	f	2010-09-12	4352	\N	27073	\N
27567	GENERIC_DAY	8	0	f	2010-09-11	4354	\N	27073	\N
27559	GENERIC_DAY	8	4	f	2010-09-20	4354	\N	27073	\N
27552	GENERIC_DAY	8	2	f	2010-09-23	4354	\N	27073	\N
27545	GENERIC_DAY	8	0	f	2010-09-12	4354	\N	27073	\N
27560	GENERIC_DAY	8	4	f	2010-09-16	4354	\N	27073	\N
27544	GENERIC_DAY	8	4	f	2010-09-13	4354	\N	27073	\N
27546	GENERIC_DAY	8	4	f	2010-09-07	4354	\N	27073	\N
27539	GENERIC_DAY	8	4	f	2010-09-15	4354	\N	27073	\N
27569	GENERIC_DAY	8	4	f	2010-09-13	4352	\N	27073	\N
27554	GENERIC_DAY	8	4	f	2010-09-15	4352	\N	27073	\N
27553	GENERIC_DAY	8	4	f	2010-09-16	4352	\N	27073	\N
27556	GENERIC_DAY	8	4	f	2010-09-22	4352	\N	27073	\N
27542	GENERIC_DAY	8	4	f	2010-09-17	4352	\N	27073	\N
27541	GENERIC_DAY	8	4	f	2010-09-14	4352	\N	27073	\N
27543	GENERIC_DAY	8	4	f	2010-09-21	4354	\N	27073	\N
31119	GENERIC_DAY	3	0	f	2010-06-27	4348	\N	27090	\N
31098	GENERIC_DAY	3	1	f	2010-07-02	4358	\N	27090	\N
31120	GENERIC_DAY	3	0	f	2010-07-05	4344	\N	27090	\N
31130	GENERIC_DAY	3	1	f	2010-07-08	4358	\N	27090	\N
31124	GENERIC_DAY	3	4	f	2010-07-01	21817	\N	27090	\N
31108	GENERIC_DAY	3	2	f	2010-07-12	4358	\N	27090	\N
31134	GENERIC_DAY	3	2	f	2010-07-14	4358	\N	27090	\N
31122	GENERIC_DAY	3	0	f	2010-07-01	4350	\N	27090	\N
31142	GENERIC_DAY	3	0	f	2010-07-07	4344	\N	27090	\N
31160	GENERIC_DAY	3	0	f	2010-07-04	4350	\N	27090	\N
31164	GENERIC_DAY	3	0	f	2010-07-03	4358	\N	27090	\N
31121	GENERIC_DAY	3	0	f	2010-07-03	4348	\N	27090	\N
31116	GENERIC_DAY	3	0	f	2010-07-13	4344	\N	27090	\N
31101	GENERIC_DAY	3	0	f	2010-07-09	4344	\N	27090	\N
31157	GENERIC_DAY	3	1	f	2010-07-05	4348	\N	27090	\N
31181	GENERIC_DAY	3	6	f	2010-07-05	21817	\N	27090	\N
31178	GENERIC_DAY	3	0	f	2010-06-28	4350	\N	27090	\N
31100	GENERIC_DAY	3	4	f	2010-07-13	21817	\N	27090	\N
31132	GENERIC_DAY	3	4	f	2010-07-12	21817	\N	27090	\N
31186	GENERIC_DAY	3	1	f	2010-07-06	4358	\N	27090	\N
31179	GENERIC_DAY	3	0	f	2010-06-27	4350	\N	27090	\N
31165	GENERIC_DAY	3	0	f	2010-07-12	4344	\N	27090	\N
31117	GENERIC_DAY	3	6	f	2010-07-02	21817	\N	27090	\N
31141	GENERIC_DAY	3	0	f	2010-07-08	4344	\N	27090	\N
31113	GENERIC_DAY	3	0	f	2010-06-27	4358	\N	27090	\N
31176	GENERIC_DAY	3	0	f	2010-07-10	4344	\N	27090	\N
31129	GENERIC_DAY	3	0	f	2010-07-03	4350	\N	27090	\N
31183	GENERIC_DAY	3	1	f	2010-07-12	4348	\N	27090	\N
31127	GENERIC_DAY	3	1	f	2010-07-12	4350	\N	27090	\N
31112	GENERIC_DAY	3	2	f	2010-07-01	4348	\N	27090	\N
31172	GENERIC_DAY	3	3	f	2010-06-29	4358	\N	27090	\N
13229	SPECIFIC_DAY	1	8	f	2010-06-16	4350	8082	\N	\N
13247	SPECIFIC_DAY	1	0	f	2010-07-03	4350	8082	\N	\N
13243	SPECIFIC_DAY	1	8	f	2010-07-05	4350	8082	\N	\N
13231	SPECIFIC_DAY	1	8	f	2010-06-14	4350	8082	\N	\N
13230	SPECIFIC_DAY	1	0	f	2010-07-04	4350	8082	\N	\N
13246	SPECIFIC_DAY	1	6	f	2010-07-08	4350	8082	\N	\N
13251	SPECIFIC_DAY	1	0	f	2010-06-20	4350	8082	\N	\N
13234	SPECIFIC_DAY	1	8	f	2010-06-18	4350	8082	\N	\N
13240	SPECIFIC_DAY	1	8	f	2010-07-01	4350	8082	\N	\N
13242	SPECIFIC_DAY	1	8	f	2010-07-06	4350	8082	\N	\N
13233	SPECIFIC_DAY	1	8	f	2010-07-07	4350	8082	\N	\N
13237	SPECIFIC_DAY	1	8	f	2010-06-25	4350	8082	\N	\N
13235	SPECIFIC_DAY	1	0	f	2010-06-19	4350	8082	\N	\N
13245	SPECIFIC_DAY	1	8	f	2010-06-23	4350	8082	\N	\N
13252	SPECIFIC_DAY	1	8	f	2010-06-15	4350	8082	\N	\N
13248	SPECIFIC_DAY	1	8	f	2010-06-29	4350	8082	\N	\N
13249	SPECIFIC_DAY	1	8	f	2010-06-17	4350	8082	\N	\N
13236	SPECIFIC_DAY	1	8	f	2010-06-24	4350	8082	\N	\N
13239	SPECIFIC_DAY	1	8	f	2010-07-02	4350	8082	\N	\N
13241	SPECIFIC_DAY	1	0	f	2010-06-26	4350	8082	\N	\N
13238	SPECIFIC_DAY	1	8	f	2010-06-22	4350	8082	\N	\N
13250	SPECIFIC_DAY	1	8	f	2010-06-21	4350	8082	\N	\N
13244	SPECIFIC_DAY	1	0	f	2010-06-27	4350	8082	\N	\N
13232	SPECIFIC_DAY	1	8	f	2010-06-28	4350	8082	\N	\N
31146	GENERIC_DAY	3	1	f	2010-07-09	4350	\N	27090	\N
31163	GENERIC_DAY	3	0	f	2010-07-06	4344	\N	27090	\N
31103	GENERIC_DAY	3	0	f	2010-06-30	4344	\N	27090	\N
31185	GENERIC_DAY	3	0	f	2010-07-10	21817	\N	27090	\N
31109	GENERIC_DAY	3	1	f	2010-07-14	4350	\N	27090	\N
31126	GENERIC_DAY	3	0	f	2010-07-10	4348	\N	27090	\N
31144	GENERIC_DAY	3	3	f	2010-06-30	4348	\N	27090	\N
31140	GENERIC_DAY	3	0	f	2010-06-27	21817	\N	27090	\N
31173	GENERIC_DAY	3	2	f	2010-07-09	4358	\N	27090	\N
31145	GENERIC_DAY	3	0	f	2010-07-07	4350	\N	27090	\N
31159	GENERIC_DAY	3	0	f	2010-06-28	4344	\N	27090	\N
31151	GENERIC_DAY	3	4	f	2010-07-09	21817	\N	27090	\N
31177	GENERIC_DAY	3	0	f	2010-07-04	4358	\N	27090	\N
31128	GENERIC_DAY	3	2	f	2010-07-13	4358	\N	27090	\N
31147	GENERIC_DAY	3	1	f	2010-07-13	4350	\N	27090	\N
31148	GENERIC_DAY	3	0	f	2010-07-11	4344	\N	27090	\N
31136	GENERIC_DAY	3	0	f	2010-07-11	4350	\N	27090	\N
31139	GENERIC_DAY	3	1	f	2010-07-06	4348	\N	27090	\N
31170	GENERIC_DAY	3	0	f	2010-07-14	4344	\N	27090	\N
31158	GENERIC_DAY	3	3	f	2010-06-29	4348	\N	27090	\N
31106	GENERIC_DAY	3	0	f	2010-07-03	4344	\N	27090	\N
31180	GENERIC_DAY	3	0	f	2010-07-04	21817	\N	27090	\N
31161	GENERIC_DAY	3	0	f	2010-06-27	4344	\N	27090	\N
31156	GENERIC_DAY	3	1	f	2010-07-05	4358	\N	27090	\N
31114	GENERIC_DAY	3	1	f	2010-07-08	4348	\N	27090	\N
31153	GENERIC_DAY	3	0	f	2010-07-11	4358	\N	27090	\N
31133	GENERIC_DAY	3	2	f	2010-06-28	21817	\N	27090	\N
31155	GENERIC_DAY	3	3	f	2010-06-28	4358	\N	27090	\N
31162	GENERIC_DAY	3	0	f	2010-07-08	4350	\N	27090	\N
31111	GENERIC_DAY	3	0	f	2010-06-29	4350	\N	27090	\N
31115	GENERIC_DAY	3	0	f	2010-06-30	4350	\N	27090	\N
31184	GENERIC_DAY	3	0	f	2010-07-06	4350	\N	27090	\N
31118	GENERIC_DAY	3	0	f	2010-07-02	4344	\N	27090	\N
17686	GENERIC_DAY	6	4	f	2010-07-13	4354	\N	9408	\N
17687	GENERIC_DAY	6	0	f	2010-07-17	4354	\N	9408	\N
17688	GENERIC_DAY	6	4	f	2010-07-26	4352	\N	9408	\N
17689	GENERIC_DAY	6	4	f	2010-07-09	4354	\N	9408	\N
17690	GENERIC_DAY	6	0	f	2010-07-24	4352	\N	9408	\N
8184	SPECIFIC_DAY	13	8	f	2010-07-09	1216	8080	\N	\N
8192	SPECIFIC_DAY	13	1	f	2010-07-19	1216	8080	\N	\N
8188	SPECIFIC_DAY	13	0	f	2010-07-03	1216	8080	\N	\N
8181	SPECIFIC_DAY	13	8	f	2010-07-13	1216	8080	\N	\N
8183	SPECIFIC_DAY	13	0	f	2010-07-18	1216	8080	\N	\N
8198	SPECIFIC_DAY	13	8	f	2010-07-16	1216	8080	\N	\N
8185	SPECIFIC_DAY	13	8	f	2010-07-05	1216	8080	\N	\N
8190	SPECIFIC_DAY	13	8	f	2010-07-15	1216	8080	\N	\N
8186	SPECIFIC_DAY	13	0	f	2010-07-11	1216	8080	\N	\N
8195	SPECIFIC_DAY	13	0	f	2010-07-10	1216	8080	\N	\N
8196	SPECIFIC_DAY	13	4	f	2010-06-30	1216	8080	\N	\N
8182	SPECIFIC_DAY	13	8	f	2010-07-02	1216	8080	\N	\N
8193	SPECIFIC_DAY	13	8	f	2010-07-06	1216	8080	\N	\N
8191	SPECIFIC_DAY	13	0	f	2010-07-17	1216	8080	\N	\N
8199	SPECIFIC_DAY	13	8	f	2010-07-08	1216	8080	\N	\N
8200	SPECIFIC_DAY	13	0	f	2010-07-04	1216	8080	\N	\N
31099	GENERIC_DAY	3	0	f	2010-07-11	4348	\N	27090	\N
31182	GENERIC_DAY	3	2	f	2010-06-30	4358	\N	27090	\N
31105	GENERIC_DAY	3	3	f	2010-06-30	21817	\N	27090	\N
31110	GENERIC_DAY	3	3	f	2010-06-28	4348	\N	27090	\N
31166	GENERIC_DAY	3	1	f	2010-07-14	4348	\N	27090	\N
31107	GENERIC_DAY	3	0	f	2010-07-04	4348	\N	27090	\N
31123	GENERIC_DAY	3	6	f	2010-07-07	21817	\N	27090	\N
31125	GENERIC_DAY	3	6	f	2010-07-08	21817	\N	27090	\N
31131	GENERIC_DAY	3	2	f	2010-06-29	21817	\N	27090	\N
31154	GENERIC_DAY	3	6	f	2010-07-06	21817	\N	27090	\N
31104	GENERIC_DAY	3	1	f	2010-07-07	4348	\N	27090	\N
31102	GENERIC_DAY	3	0	f	2010-06-29	4344	\N	27090	\N
27495	GENERIC_DAY	8	4	f	2010-08-06	4354	\N	27071	\N
27451	GENERIC_DAY	8	4	f	2010-07-21	4354	\N	27071	\N
27493	GENERIC_DAY	8	0	f	2010-07-24	4352	\N	27071	\N
27449	GENERIC_DAY	8	0	f	2010-08-15	4354	\N	27071	\N
27450	GENERIC_DAY	8	4	f	2010-08-02	4354	\N	27071	\N
27488	GENERIC_DAY	8	4	f	2010-07-21	4352	\N	27071	\N
27490	GENERIC_DAY	8	0	f	2010-07-17	4354	\N	27071	\N
27469	GENERIC_DAY	8	4	f	2010-07-15	4354	\N	27071	\N
27482	GENERIC_DAY	8	0	f	2010-07-18	4352	\N	27071	\N
27467	GENERIC_DAY	8	4	f	2010-08-18	4352	\N	27071	\N
27485	GENERIC_DAY	8	4	f	2010-08-18	4354	\N	27071	\N
27497	GENERIC_DAY	8	4	f	2010-08-11	4352	\N	27071	\N
27446	GENERIC_DAY	8	4	f	2010-07-20	4354	\N	27071	\N
27475	GENERIC_DAY	8	4	f	2010-08-09	4352	\N	27071	\N
27460	GENERIC_DAY	8	4	f	2010-07-27	4354	\N	27071	\N
27489	GENERIC_DAY	8	4	f	2010-08-04	4352	\N	27071	\N
27496	GENERIC_DAY	8	4	f	2010-08-17	4354	\N	27071	\N
27447	GENERIC_DAY	8	0	f	2010-07-17	4352	\N	27071	\N
27481	GENERIC_DAY	8	4	f	2010-08-05	4352	\N	27071	\N
27462	GENERIC_DAY	8	0	f	2010-07-31	4354	\N	27071	\N
27456	GENERIC_DAY	8	0	f	2010-08-14	4352	\N	27071	\N
27472	GENERIC_DAY	8	4	f	2010-07-19	4352	\N	27071	\N
27478	GENERIC_DAY	8	0	f	2010-08-08	4352	\N	27071	\N
27477	GENERIC_DAY	8	0	f	2010-07-24	4354	\N	27071	\N
27480	GENERIC_DAY	8	4	f	2010-08-03	4352	\N	27071	\N
27479	GENERIC_DAY	8	4	f	2010-08-12	4354	\N	27071	\N
27491	GENERIC_DAY	8	4	f	2010-08-05	4354	\N	27071	\N
27474	GENERIC_DAY	8	4	f	2010-07-16	4354	\N	27071	\N
27487	GENERIC_DAY	8	4	f	2010-08-12	4352	\N	27071	\N
27483	GENERIC_DAY	8	4	f	2010-07-29	4354	\N	27071	\N
27468	GENERIC_DAY	8	4	f	2010-08-13	4352	\N	27071	\N
27452	GENERIC_DAY	8	4	f	2010-07-30	4352	\N	27071	\N
27453	GENERIC_DAY	8	4	f	2010-08-09	4354	\N	27071	\N
17691	GENERIC_DAY	6	4	f	2010-07-20	4352	\N	9408	\N
17692	GENERIC_DAY	6	4	f	2010-07-20	4354	\N	9408	\N
17693	GENERIC_DAY	6	4	f	2010-07-19	4354	\N	9408	\N
17694	GENERIC_DAY	6	4	f	2010-07-21	4354	\N	9408	\N
17695	GENERIC_DAY	6	0	f	2010-07-25	4352	\N	9408	\N
17696	GENERIC_DAY	6	0	f	2010-07-24	4354	\N	9408	\N
17697	GENERIC_DAY	6	4	f	2010-07-09	4352	\N	9408	\N
17698	GENERIC_DAY	6	4	f	2010-07-23	4352	\N	9408	\N
17699	GENERIC_DAY	6	4	f	2010-07-14	4354	\N	9408	\N
17700	GENERIC_DAY	6	4	f	2010-07-16	4352	\N	9408	\N
17701	GENERIC_DAY	6	4	f	2010-07-23	4354	\N	9408	\N
17702	GENERIC_DAY	6	0	f	2010-07-25	4354	\N	9408	\N
17703	GENERIC_DAY	6	4	f	2010-07-13	4352	\N	9408	\N
17704	GENERIC_DAY	6	0	f	2010-07-11	4352	\N	9408	\N
17705	GENERIC_DAY	6	4	f	2010-07-19	4352	\N	9408	\N
17706	GENERIC_DAY	6	0	f	2010-07-11	4354	\N	9408	\N
17707	GENERIC_DAY	6	4	f	2010-07-22	4354	\N	9408	\N
17708	GENERIC_DAY	6	4	f	2010-07-22	4352	\N	9408	\N
17709	GENERIC_DAY	6	2	f	2010-07-27	4354	\N	9408	\N
17710	GENERIC_DAY	6	4	f	2010-07-16	4354	\N	9408	\N
17711	GENERIC_DAY	6	0	f	2010-07-10	4354	\N	9408	\N
17712	GENERIC_DAY	6	2	f	2010-07-27	4352	\N	9408	\N
17713	GENERIC_DAY	6	0	f	2010-07-17	4352	\N	9408	\N
17714	GENERIC_DAY	6	4	f	2010-07-14	4352	\N	9408	\N
17715	GENERIC_DAY	6	4	f	2010-07-12	4352	\N	9408	\N
17716	GENERIC_DAY	6	0	f	2010-07-10	4352	\N	9408	\N
17717	GENERIC_DAY	6	0	f	2010-07-18	4352	\N	9408	\N
17718	GENERIC_DAY	6	4	f	2010-07-15	4352	\N	9408	\N
17719	GENERIC_DAY	6	4	f	2010-07-12	4354	\N	9408	\N
17720	GENERIC_DAY	6	0	f	2010-07-18	4354	\N	9408	\N
17721	GENERIC_DAY	6	4	f	2010-07-26	4354	\N	9408	\N
17722	GENERIC_DAY	6	4	f	2010-07-21	4352	\N	9408	\N
17723	GENERIC_DAY	6	4	f	2010-07-15	4354	\N	9408	\N
17724	GENERIC_DAY	6	0	f	2010-08-29	4354	\N	9412	\N
17725	GENERIC_DAY	6	0	f	2010-07-31	4352	\N	9412	\N
17726	GENERIC_DAY	6	4	f	2010-08-20	4354	\N	9412	\N
17727	GENERIC_DAY	6	4	f	2010-08-10	4354	\N	9412	\N
17728	GENERIC_DAY	6	4	f	2010-08-10	4352	\N	9412	\N
17729	GENERIC_DAY	6	4	f	2010-08-31	4352	\N	9412	\N
17730	GENERIC_DAY	6	4	f	2010-08-09	4352	\N	9412	\N
17731	GENERIC_DAY	6	4	f	2010-08-02	4354	\N	9412	\N
17732	GENERIC_DAY	6	4	f	2010-07-30	4352	\N	9412	\N
17733	GENERIC_DAY	6	4	f	2010-08-25	4352	\N	9412	\N
17734	GENERIC_DAY	6	4	f	2010-08-18	4352	\N	9412	\N
17735	GENERIC_DAY	6	4	f	2010-08-23	4352	\N	9412	\N
17736	GENERIC_DAY	6	4	f	2010-08-24	4354	\N	9412	\N
17737	GENERIC_DAY	6	0	f	2010-08-15	4354	\N	9412	\N
17738	GENERIC_DAY	6	4	f	2010-08-12	4352	\N	9412	\N
21684	GENERIC_DAY	3	0	f	2010-08-21	4348	\N	16774	\N
21685	GENERIC_DAY	3	2	f	2010-08-12	4350	\N	16774	\N
21686	GENERIC_DAY	3	2	f	2010-08-17	4350	\N	16774	\N
21687	GENERIC_DAY	3	2	f	2010-08-31	4348	\N	16774	\N
21688	GENERIC_DAY	3	0	f	2010-08-28	4344	\N	16774	\N
21689	GENERIC_DAY	3	0	f	2010-07-31	4350	\N	16774	\N
21690	GENERIC_DAY	3	2	f	2010-08-05	4344	\N	16774	\N
21691	GENERIC_DAY	3	2	f	2010-08-13	4350	\N	16774	\N
21692	GENERIC_DAY	3	2	f	2010-08-31	4358	\N	16774	\N
21693	GENERIC_DAY	3	2	f	2010-08-27	4344	\N	16774	\N
21694	GENERIC_DAY	3	0	f	2010-08-08	4358	\N	16774	\N
21695	GENERIC_DAY	3	2	f	2010-08-20	4350	\N	16774	\N
21696	GENERIC_DAY	3	2	f	2010-08-26	4350	\N	16774	\N
21697	GENERIC_DAY	3	2	f	2010-07-29	4350	\N	16774	\N
21698	GENERIC_DAY	3	0	f	2010-08-07	4348	\N	16774	\N
21699	GENERIC_DAY	3	2	f	2010-08-09	4344	\N	16774	\N
21700	GENERIC_DAY	3	0	f	2010-08-21	4350	\N	16774	\N
21701	GENERIC_DAY	3	2	f	2010-09-01	4358	\N	16774	\N
21702	GENERIC_DAY	3	0	f	2010-08-22	4358	\N	16774	\N
21703	GENERIC_DAY	3	2	f	2010-08-10	4358	\N	16774	\N
21704	GENERIC_DAY	3	2	f	2010-08-27	4350	\N	16774	\N
27680	GENERIC_DAY	8	4	f	2010-08-10	4354	\N	27075	\N
27683	GENERIC_DAY	8	4	f	2010-08-26	4352	\N	27075	\N
27682	GENERIC_DAY	8	0	f	2010-08-08	4352	\N	27075	\N
27679	GENERIC_DAY	8	4	f	2010-08-09	4352	\N	27075	\N
27684	GENERIC_DAY	8	4	f	2010-08-23	4352	\N	27075	\N
27715	GENERIC_DAY	8	0	f	2010-08-21	4354	\N	27075	\N
27681	GENERIC_DAY	8	4	f	2010-09-01	4352	\N	27075	\N
27458	GENERIC_DAY	8	4	f	2010-08-10	4354	\N	27071	\N
27471	GENERIC_DAY	8	4	f	2010-07-28	4354	\N	27071	\N
27470	GENERIC_DAY	8	0	f	2010-07-18	4354	\N	27071	\N
27461	GENERIC_DAY	8	4	f	2010-08-13	4354	\N	27071	\N
27454	GENERIC_DAY	8	4	f	2010-08-06	4352	\N	27071	\N
27465	GENERIC_DAY	8	0	f	2010-07-25	4354	\N	27071	\N
27473	GENERIC_DAY	8	0	f	2010-08-07	4352	\N	27071	\N
27448	GENERIC_DAY	8	4	f	2010-08-11	4354	\N	27071	\N
27492	GENERIC_DAY	8	0	f	2010-08-14	4354	\N	27071	\N
27457	GENERIC_DAY	8	4	f	2010-08-16	4352	\N	27071	\N
27455	GENERIC_DAY	8	0	f	2010-07-25	4352	\N	27071	\N
27466	GENERIC_DAY	8	4	f	2010-07-15	4352	\N	27071	\N
27464	GENERIC_DAY	8	4	f	2010-08-17	4352	\N	27071	\N
27484	GENERIC_DAY	8	4	f	2010-07-23	4352	\N	27071	\N
27459	GENERIC_DAY	8	4	f	2010-08-04	4354	\N	27071	\N
27463	GENERIC_DAY	8	0	f	2010-08-01	4354	\N	27071	\N
44047	GENERIC_DAY	1	0	f	2010-07-21	4354	\N	42525	\N
44048	GENERIC_DAY	1	0	f	2010-07-12	4354	\N	42525	\N
44049	GENERIC_DAY	1	0	f	2010-06-27	4352	\N	42525	\N
44050	GENERIC_DAY	1	8	f	2010-07-01	4352	\N	42525	\N
44051	GENERIC_DAY	1	0	f	2010-07-10	4352	\N	42525	\N
44052	GENERIC_DAY	1	4	f	2010-06-30	4354	\N	42525	\N
44053	GENERIC_DAY	1	0	f	2010-07-11	4354	\N	42525	\N
44054	GENERIC_DAY	1	0	f	2010-06-20	4354	\N	42525	\N
44055	GENERIC_DAY	1	1	f	2010-06-17	4352	\N	42525	\N
44056	GENERIC_DAY	1	0	f	2010-07-03	4354	\N	42525	\N
44057	GENERIC_DAY	1	7	f	2010-06-18	4354	\N	42525	\N
44058	GENERIC_DAY	1	1	f	2010-06-15	4352	\N	42525	\N
44059	GENERIC_DAY	1	0	f	2010-07-04	4354	\N	42525	\N
44060	GENERIC_DAY	1	0	f	2010-07-02	4354	\N	42525	\N
44061	GENERIC_DAY	1	8	f	2010-07-02	4352	\N	42525	\N
44062	GENERIC_DAY	1	0	f	2010-07-14	4354	\N	42525	\N
44063	GENERIC_DAY	1	7	f	2010-06-15	4354	\N	42525	\N
44064	GENERIC_DAY	1	8	f	2010-07-19	4352	\N	42525	\N
44065	GENERIC_DAY	1	0	f	2010-07-01	4354	\N	42525	\N
44066	GENERIC_DAY	1	8	f	2010-06-24	4354	\N	42525	\N
44067	GENERIC_DAY	1	0	f	2010-06-23	4352	\N	42525	\N
44068	GENERIC_DAY	1	8	f	2010-07-08	4352	\N	42525	\N
44069	GENERIC_DAY	1	7	f	2010-06-16	4354	\N	42525	\N
44070	GENERIC_DAY	1	0	f	2010-07-08	4354	\N	42525	\N
44071	GENERIC_DAY	1	8	f	2010-06-22	4354	\N	42525	\N
44072	GENERIC_DAY	1	8	f	2010-07-13	4352	\N	42525	\N
44073	GENERIC_DAY	1	8	f	2010-07-06	4352	\N	42525	\N
44074	GENERIC_DAY	1	8	f	2010-07-15	4352	\N	42525	\N
44075	GENERIC_DAY	1	8	f	2010-07-20	4352	\N	42525	\N
44076	GENERIC_DAY	1	0	f	2010-07-10	4354	\N	42525	\N
44077	GENERIC_DAY	1	0	f	2010-07-16	4354	\N	42525	\N
44078	GENERIC_DAY	1	8	f	2010-07-12	4352	\N	42525	\N
27434	GENERIC_DAY	8	4	f	2010-07-30	4354	\N	27071	\N
27432	GENERIC_DAY	8	4	f	2010-07-22	4352	\N	27071	\N
27437	GENERIC_DAY	8	4	f	2010-07-19	4354	\N	27071	\N
27438	GENERIC_DAY	8	4	f	2010-07-20	4352	\N	27071	\N
27435	GENERIC_DAY	8	4	f	2010-07-16	4352	\N	27071	\N
27431	GENERIC_DAY	8	4	f	2010-07-26	4354	\N	27071	\N
27443	GENERIC_DAY	8	4	f	2010-07-22	4354	\N	27071	\N
27439	GENERIC_DAY	8	4	f	2010-08-16	4354	\N	27071	\N
27444	GENERIC_DAY	8	4	f	2010-07-28	4352	\N	27071	\N
27442	GENERIC_DAY	8	4	f	2010-08-02	4352	\N	27071	\N
27433	GENERIC_DAY	8	4	f	2010-07-26	4352	\N	27071	\N
27441	GENERIC_DAY	8	4	f	2010-08-10	4352	\N	27071	\N
27429	GENERIC_DAY	8	0	f	2010-08-07	4354	\N	27071	\N
27428	GENERIC_DAY	8	0	f	2010-07-31	4352	\N	27071	\N
27445	GENERIC_DAY	8	4	f	2010-08-03	4354	\N	27071	\N
27430	GENERIC_DAY	8	0	f	2010-08-08	4354	\N	27071	\N
27440	GENERIC_DAY	8	0	f	2010-08-15	4352	\N	27071	\N
27436	GENERIC_DAY	8	4	f	2010-07-27	4352	\N	27071	\N
44079	GENERIC_DAY	1	8	f	2010-07-07	4352	\N	42525	\N
44080	GENERIC_DAY	1	0	f	2010-06-25	4352	\N	42525	\N
44081	GENERIC_DAY	1	0	f	2010-07-03	4352	\N	42525	\N
44082	GENERIC_DAY	1	1	f	2010-06-16	4352	\N	42525	\N
44083	GENERIC_DAY	1	1	f	2010-06-21	4352	\N	42525	\N
44084	GENERIC_DAY	1	0	f	2010-07-15	4354	\N	42525	\N
44085	GENERIC_DAY	1	4	f	2010-06-29	4352	\N	42525	\N
44086	GENERIC_DAY	1	0	f	2010-07-09	4354	\N	42525	\N
44087	GENERIC_DAY	1	4	f	2010-06-28	4352	\N	42525	\N
44088	GENERIC_DAY	1	0	f	2010-07-19	4354	\N	42525	\N
44089	GENERIC_DAY	1	0	f	2010-06-26	4354	\N	42525	\N
44090	GENERIC_DAY	1	0	f	2010-07-06	4354	\N	42525	\N
44091	GENERIC_DAY	1	0	f	2010-06-20	4352	\N	42525	\N
44092	GENERIC_DAY	1	0	f	2010-07-17	4354	\N	42525	\N
44093	GENERIC_DAY	1	0	f	2010-07-18	4352	\N	42525	\N
44094	GENERIC_DAY	1	0	f	2010-07-07	4354	\N	42525	\N
44095	GENERIC_DAY	1	1	f	2010-06-18	4352	\N	42525	\N
44096	GENERIC_DAY	1	8	f	2010-07-14	4352	\N	42525	\N
44097	GENERIC_DAY	1	0	f	2010-06-24	4352	\N	42525	\N
44098	GENERIC_DAY	1	0	f	2010-06-19	4352	\N	42525	\N
44099	GENERIC_DAY	1	8	f	2010-07-05	4352	\N	42525	\N
44100	GENERIC_DAY	1	7	f	2010-06-17	4354	\N	42525	\N
44101	GENERIC_DAY	1	0	f	2010-06-27	4354	\N	42525	\N
44102	GENERIC_DAY	1	8	f	2010-07-16	4352	\N	42525	\N
44103	GENERIC_DAY	1	4	f	2010-06-29	4354	\N	42525	\N
44104	GENERIC_DAY	1	0	f	2010-07-13	4354	\N	42525	\N
44105	GENERIC_DAY	1	0	f	2010-07-20	4354	\N	42525	\N
44106	GENERIC_DAY	1	8	f	2010-07-09	4352	\N	42525	\N
44107	GENERIC_DAY	1	2	f	2010-07-21	4352	\N	42525	\N
44108	GENERIC_DAY	1	0	f	2010-07-17	4352	\N	42525	\N
44109	GENERIC_DAY	1	0	f	2010-07-04	4352	\N	42525	\N
44110	GENERIC_DAY	1	0	f	2010-06-22	4352	\N	42525	\N
44435	GENERIC_DAY	0	2	f	2010-07-29	4350	\N	42529	\N
44436	GENERIC_DAY	0	0	f	2010-07-31	4358	\N	42529	\N
44437	GENERIC_DAY	0	0	f	2010-08-14	4350	\N	42529	\N
44438	GENERIC_DAY	0	2	f	2010-07-30	4358	\N	42529	\N
44439	GENERIC_DAY	0	2	f	2010-08-09	4350	\N	42529	\N
44440	GENERIC_DAY	0	0	f	2010-07-25	4350	\N	42529	\N
44441	GENERIC_DAY	0	2	f	2010-08-06	4344	\N	42529	\N
44442	GENERIC_DAY	0	0	f	2010-08-08	4350	\N	42529	\N
44443	GENERIC_DAY	0	2	f	2010-08-02	4344	\N	42529	\N
44444	GENERIC_DAY	0	0	f	2010-08-14	4348	\N	42529	\N
44445	GENERIC_DAY	0	0	f	2010-08-15	4350	\N	42529	\N
44446	GENERIC_DAY	0	2	f	2010-08-05	4350	\N	42529	\N
44447	GENERIC_DAY	0	2	f	2010-08-06	4348	\N	42529	\N
44448	GENERIC_DAY	0	2	f	2010-08-11	4358	\N	42529	\N
44449	GENERIC_DAY	0	0	f	2010-07-25	4344	\N	42529	\N
44450	GENERIC_DAY	0	0	f	2010-08-14	4358	\N	42529	\N
44451	GENERIC_DAY	0	0	f	2010-08-15	4348	\N	42529	\N
44452	GENERIC_DAY	0	2	f	2010-08-13	4348	\N	42529	\N
44453	GENERIC_DAY	0	2	f	2010-08-16	4348	\N	42529	\N
44454	GENERIC_DAY	0	2	f	2010-08-04	4344	\N	42529	\N
44455	GENERIC_DAY	0	2	f	2010-08-10	4344	\N	42529	\N
44456	GENERIC_DAY	0	2	f	2010-07-30	4344	\N	42529	\N
44457	GENERIC_DAY	0	0	f	2010-08-01	4348	\N	42529	\N
44458	GENERIC_DAY	0	2	f	2010-08-10	4348	\N	42529	\N
44459	GENERIC_DAY	0	2	f	2010-07-26	4358	\N	42529	\N
44460	GENERIC_DAY	0	0	f	2010-08-15	4344	\N	42529	\N
44461	GENERIC_DAY	0	2	f	2010-08-13	4344	\N	42529	\N
44462	GENERIC_DAY	0	0	f	2010-08-01	4344	\N	42529	\N
44463	GENERIC_DAY	0	1	f	2010-08-17	4358	\N	42529	\N
44464	GENERIC_DAY	0	2	f	2010-07-27	4350	\N	42529	\N
44465	GENERIC_DAY	0	2	f	2010-08-05	4344	\N	42529	\N
44466	GENERIC_DAY	0	0	f	2010-08-15	4358	\N	42529	\N
44467	GENERIC_DAY	0	0	f	2010-08-07	4348	\N	42529	\N
44468	GENERIC_DAY	0	2	f	2010-07-27	4344	\N	42529	\N
44469	GENERIC_DAY	0	0	f	2010-08-07	4344	\N	42529	\N
44470	GENERIC_DAY	0	2	f	2010-08-03	4358	\N	42529	\N
44471	GENERIC_DAY	0	2	f	2010-07-27	4358	\N	42529	\N
44472	GENERIC_DAY	0	2	f	2010-07-22	4358	\N	42529	\N
44473	GENERIC_DAY	0	2	f	2010-08-16	4350	\N	42529	\N
44474	GENERIC_DAY	0	0	f	2010-07-24	4358	\N	42529	\N
44475	GENERIC_DAY	0	2	f	2010-07-30	4348	\N	42529	\N
44476	GENERIC_DAY	0	2	f	2010-07-23	4348	\N	42529	\N
44477	GENERIC_DAY	0	0	f	2010-07-24	4348	\N	42529	\N
44478	GENERIC_DAY	0	0	f	2010-08-07	4358	\N	42529	\N
44479	GENERIC_DAY	0	2	f	2010-07-29	4358	\N	42529	\N
44480	GENERIC_DAY	0	2	f	2010-08-11	4344	\N	42529	\N
44481	GENERIC_DAY	0	2	f	2010-08-09	4358	\N	42529	\N
44482	GENERIC_DAY	0	2	f	2010-08-09	4348	\N	42529	\N
44483	GENERIC_DAY	0	2	f	2010-07-29	4348	\N	42529	\N
44484	GENERIC_DAY	0	2	f	2010-08-13	4350	\N	42529	\N
44485	GENERIC_DAY	0	3	f	2010-07-28	4344	\N	42529	\N
44486	GENERIC_DAY	0	0	f	2010-07-31	4350	\N	42529	\N
44487	GENERIC_DAY	0	2	f	2010-08-10	4358	\N	42529	\N
44488	GENERIC_DAY	0	2	f	2010-08-11	4348	\N	42529	\N
44489	GENERIC_DAY	0	2	f	2010-07-28	4350	\N	42529	\N
44490	GENERIC_DAY	0	2	f	2010-08-12	4358	\N	42529	\N
44491	GENERIC_DAY	0	2	f	2010-08-05	4348	\N	42529	\N
44492	GENERIC_DAY	0	0	f	2010-07-24	4350	\N	42529	\N
44493	GENERIC_DAY	0	2	f	2010-07-29	4344	\N	42529	\N
44494	GENERIC_DAY	0	0	f	2010-08-08	4344	\N	42529	\N
44495	GENERIC_DAY	0	2	f	2010-08-09	4344	\N	42529	\N
44496	GENERIC_DAY	0	2	f	2010-07-23	4344	\N	42529	\N
44497	GENERIC_DAY	0	0	f	2010-08-14	4344	\N	42529	\N
44498	GENERIC_DAY	0	2	f	2010-08-02	4350	\N	42529	\N
44499	GENERIC_DAY	0	2	f	2010-08-05	4358	\N	42529	\N
44500	GENERIC_DAY	0	2	f	2010-08-03	4344	\N	42529	\N
44501	GENERIC_DAY	0	2	f	2010-07-26	4350	\N	42529	\N
44502	GENERIC_DAY	0	2	f	2010-08-04	4348	\N	42529	\N
44503	GENERIC_DAY	0	2	f	2010-07-26	4348	\N	42529	\N
44504	GENERIC_DAY	0	2	f	2010-08-04	4350	\N	42529	\N
44505	GENERIC_DAY	0	0	f	2010-07-31	4348	\N	42529	\N
44506	GENERIC_DAY	0	2	f	2010-08-10	4350	\N	42529	\N
44507	GENERIC_DAY	0	2	f	2010-08-03	4350	\N	42529	\N
44508	GENERIC_DAY	0	1	f	2010-07-28	4358	\N	42529	\N
44509	GENERIC_DAY	0	0	f	2010-08-01	4358	\N	42529	\N
44510	GENERIC_DAY	0	2	f	2010-08-17	4348	\N	42529	\N
44511	GENERIC_DAY	0	0	f	2010-07-31	4344	\N	42529	\N
44512	GENERIC_DAY	0	2	f	2010-08-12	4348	\N	42529	\N
44513	GENERIC_DAY	0	2	f	2010-08-12	4350	\N	42529	\N
44514	GENERIC_DAY	0	2	f	2010-07-27	4348	\N	42529	\N
44515	GENERIC_DAY	0	0	f	2010-07-25	4358	\N	42529	\N
44516	GENERIC_DAY	0	2	f	2010-07-28	4348	\N	42529	\N
44517	GENERIC_DAY	0	2	f	2010-07-23	4358	\N	42529	\N
44518	GENERIC_DAY	0	2	f	2010-08-12	4344	\N	42529	\N
44519	GENERIC_DAY	0	0	f	2010-08-01	4350	\N	42529	\N
44520	GENERIC_DAY	0	2	f	2010-08-16	4344	\N	42529	\N
44521	GENERIC_DAY	0	2	f	2010-07-23	4350	\N	42529	\N
44522	GENERIC_DAY	0	2	f	2010-08-16	4358	\N	42529	\N
44523	GENERIC_DAY	0	2	f	2010-08-17	4344	\N	42529	\N
44524	GENERIC_DAY	0	2	f	2010-07-22	4344	\N	42529	\N
44525	GENERIC_DAY	0	2	f	2010-08-02	4348	\N	42529	\N
44526	GENERIC_DAY	0	0	f	2010-08-08	4348	\N	42529	\N
44527	GENERIC_DAY	0	2	f	2010-08-11	4350	\N	42529	\N
44528	GENERIC_DAY	0	2	f	2010-07-22	4348	\N	42529	\N
44529	GENERIC_DAY	0	0	f	2010-08-08	4358	\N	42529	\N
44530	GENERIC_DAY	0	2	f	2010-08-06	4358	\N	42529	\N
44531	GENERIC_DAY	0	2	f	2010-08-13	4358	\N	42529	\N
44532	GENERIC_DAY	0	2	f	2010-08-06	4350	\N	42529	\N
44533	GENERIC_DAY	0	1	f	2010-08-17	4350	\N	42529	\N
44534	GENERIC_DAY	0	0	f	2010-07-25	4348	\N	42529	\N
44535	GENERIC_DAY	0	0	f	2010-07-24	4344	\N	42529	\N
44536	GENERIC_DAY	0	2	f	2010-08-03	4348	\N	42529	\N
44537	GENERIC_DAY	0	2	f	2010-08-02	4358	\N	42529	\N
44538	GENERIC_DAY	0	2	f	2010-07-26	4344	\N	42529	\N
44539	GENERIC_DAY	0	2	f	2010-08-04	4358	\N	42529	\N
44540	GENERIC_DAY	0	2	f	2010-07-30	4350	\N	42529	\N
44541	GENERIC_DAY	0	0	f	2010-08-07	4350	\N	42529	\N
44542	GENERIC_DAY	0	2	f	2010-07-22	4350	\N	42529	\N
6504	GENERIC_DAY	15	4	f	2010-07-05	4352	\N	5962	\N
6336	GENERIC_DAY	17	4	t	2010-06-24	4352	\N	5962	\N
6534	GENERIC_DAY	15	5	f	2010-07-02	4354	\N	5962	\N
6498	GENERIC_DAY	15	5	f	2010-07-13	4354	\N	5962	\N
6540	GENERIC_DAY	15	4	f	2010-07-20	4352	\N	5962	\N
6298	GENERIC_DAY	17	4	t	2010-06-16	4354	\N	5962	\N
6524	GENERIC_DAY	15	5	f	2010-07-15	4354	\N	5962	\N
6537	GENERIC_DAY	15	1	f	2010-07-04	4354	\N	5962	\N
6516	GENERIC_DAY	15	4	f	2010-07-09	4352	\N	5962	\N
6327	GENERIC_DAY	17	0	t	2010-06-19	4352	\N	5962	\N
6519	GENERIC_DAY	15	1	f	2010-06-27	4354	\N	5962	\N
6505	GENERIC_DAY	15	5	f	2010-07-12	4354	\N	5962	\N
6511	GENERIC_DAY	15	5	f	2010-06-29	4354	\N	5962	\N
8828	GENERIC_DAY	11	2	f	2010-07-01	4350	\N	5964	\N
8829	GENERIC_DAY	11	0	f	2010-06-19	4350	\N	5964	\N
8820	GENERIC_DAY	11	2	f	2010-07-06	4344	\N	5964	\N
8809	GENERIC_DAY	11	2	f	2010-06-30	4358	\N	5964	\N
8830	GENERIC_DAY	11	0	f	2010-06-20	4350	\N	5964	\N
8806	GENERIC_DAY	11	2	f	2010-07-05	4344	\N	5964	\N
8864	GENERIC_DAY	11	2	f	2010-07-06	4350	\N	5964	\N
8846	GENERIC_DAY	11	2	f	2010-07-07	4344	\N	5964	\N
8816	GENERIC_DAY	11	2	f	2010-06-21	4344	\N	5964	\N
8819	GENERIC_DAY	11	2	f	2010-06-15	4358	\N	5964	\N
8834	GENERIC_DAY	11	0	f	2010-06-19	4344	\N	5964	\N
8790	GENERIC_DAY	11	2	f	2010-07-01	4348	\N	5964	\N
8814	GENERIC_DAY	11	0	f	2010-06-27	4358	\N	5964	\N
8831	GENERIC_DAY	11	0	f	2010-06-26	4358	\N	5964	\N
8827	GENERIC_DAY	11	2	f	2010-06-25	4348	\N	5964	\N
8811	GENERIC_DAY	11	2	f	2010-07-05	4358	\N	5964	\N
8796	GENERIC_DAY	11	0	f	2010-07-04	4358	\N	5964	\N
8801	GENERIC_DAY	11	2	f	2010-06-29	4350	\N	5964	\N
8832	GENERIC_DAY	11	2	f	2010-06-15	4344	\N	5964	\N
8800	GENERIC_DAY	11	0	f	2010-06-19	4358	\N	5964	\N
8803	GENERIC_DAY	11	2	f	2010-07-01	4358	\N	5964	\N
8802	GENERIC_DAY	11	2	f	2010-06-23	4358	\N	5964	\N
8857	GENERIC_DAY	11	2	f	2010-07-07	4350	\N	5964	\N
8822	GENERIC_DAY	11	0	f	2010-07-03	4348	\N	5964	\N
8883	GENERIC_DAY	11	2	f	2010-06-30	4348	\N	5964	\N
8841	GENERIC_DAY	11	0	f	2010-07-04	4350	\N	5964	\N
8823	GENERIC_DAY	11	2	f	2010-07-02	4350	\N	5964	\N
8875	GENERIC_DAY	11	2	f	2010-06-21	4348	\N	5964	\N
8826	GENERIC_DAY	11	2	f	2010-06-17	4344	\N	5964	\N
8789	GENERIC_DAY	11	0	f	2010-07-03	4358	\N	5964	\N
8805	GENERIC_DAY	11	2	f	2010-06-28	4344	\N	5964	\N
8817	GENERIC_DAY	11	0	f	2010-06-20	4348	\N	5964	\N
8812	GENERIC_DAY	11	2	f	2010-06-24	4350	\N	5964	\N
8821	GENERIC_DAY	11	2	f	2010-07-08	4344	\N	5964	\N
8791	GENERIC_DAY	11	0	f	2010-06-19	4348	\N	5964	\N
8860	GENERIC_DAY	11	2	f	2010-06-18	4344	\N	5964	\N
8881	GENERIC_DAY	11	2	f	2010-06-22	4350	\N	5964	\N
8869	GENERIC_DAY	11	0	f	2010-06-26	4348	\N	5964	\N
8799	GENERIC_DAY	11	2	f	2010-06-21	4358	\N	5964	\N
8865	GENERIC_DAY	11	0	f	2010-06-27	4350	\N	5964	\N
8807	GENERIC_DAY	11	2	f	2010-06-18	4350	\N	5964	\N
8861	GENERIC_DAY	11	2	f	2010-06-17	4350	\N	5964	\N
8795	GENERIC_DAY	11	2	f	2010-06-28	4350	\N	5964	\N
8833	GENERIC_DAY	11	2	f	2010-06-25	4344	\N	5964	\N
8804	GENERIC_DAY	11	2	f	2010-07-02	4348	\N	5964	\N
8824	GENERIC_DAY	11	2	f	2010-06-28	4348	\N	5964	\N
8810	GENERIC_DAY	11	2	f	2010-06-24	4344	\N	5964	\N
8835	GENERIC_DAY	11	2	f	2010-06-16	4344	\N	5964	\N
21488	GENERIC_DAY	3	0	f	2010-07-10	4350	\N	16773	\N
21489	GENERIC_DAY	3	4	f	2010-07-08	4358	\N	16773	\N
21490	GENERIC_DAY	3	2	f	2010-07-22	4344	\N	16773	\N
21491	GENERIC_DAY	3	0	f	2010-07-16	4344	\N	16773	\N
21492	GENERIC_DAY	3	2	f	2010-07-21	4358	\N	16773	\N
21493	GENERIC_DAY	3	1	f	2010-07-28	4358	\N	16773	\N
21494	GENERIC_DAY	3	2	f	2010-07-26	4358	\N	16773	\N
21495	GENERIC_DAY	3	0	f	2010-07-11	4358	\N	16773	\N
21496	GENERIC_DAY	3	2	f	2010-07-23	4344	\N	16773	\N
21497	GENERIC_DAY	3	0	f	2010-07-17	4358	\N	16773	\N
21498	GENERIC_DAY	3	0	f	2010-07-18	4344	\N	16773	\N
21499	GENERIC_DAY	3	3	f	2010-07-15	4348	\N	16773	\N
21500	GENERIC_DAY	3	3	f	2010-07-12	4348	\N	16773	\N
21501	GENERIC_DAY	3	0	f	2010-07-05	4350	\N	16773	\N
21502	GENERIC_DAY	3	3	f	2010-07-12	4350	\N	16773	\N
21503	GENERIC_DAY	3	3	f	2010-07-15	4350	\N	16773	\N
21504	GENERIC_DAY	3	0	f	2010-07-03	4350	\N	16773	\N
21505	GENERIC_DAY	3	2	f	2010-07-28	4350	\N	16773	\N
21506	GENERIC_DAY	3	0	f	2010-07-08	4350	\N	16773	\N
21507	GENERIC_DAY	3	0	f	2010-07-07	4344	\N	16773	\N
21508	GENERIC_DAY	3	2	f	2010-07-27	4348	\N	16773	\N
21509	GENERIC_DAY	3	0	f	2010-07-17	4344	\N	16773	\N
21510	GENERIC_DAY	3	0	f	2010-07-10	4344	\N	16773	\N
21511	GENERIC_DAY	3	2	f	2010-07-20	4348	\N	16773	\N
21512	GENERIC_DAY	3	2	f	2010-07-23	4358	\N	16773	\N
21513	GENERIC_DAY	3	0	f	2010-07-17	4348	\N	16773	\N
21514	GENERIC_DAY	3	2	f	2010-07-27	4350	\N	16773	\N
21515	GENERIC_DAY	3	2	f	2010-07-14	4358	\N	16773	\N
21516	GENERIC_DAY	3	2	f	2010-07-22	4358	\N	16773	\N
21517	GENERIC_DAY	3	2	f	2010-07-21	4350	\N	16773	\N
21518	GENERIC_DAY	3	2	f	2010-07-26	4348	\N	16773	\N
21519	GENERIC_DAY	3	0	f	2010-07-12	4344	\N	16773	\N
21520	GENERIC_DAY	3	3	f	2010-07-16	4350	\N	16773	\N
21521	GENERIC_DAY	3	4	f	2010-07-06	4358	\N	16773	\N
21522	GENERIC_DAY	3	3	f	2010-07-09	4350	\N	16773	\N
21523	GENERIC_DAY	3	3	f	2010-07-14	4350	\N	16773	\N
21524	GENERIC_DAY	3	4	f	2010-07-07	4358	\N	16773	\N
21525	GENERIC_DAY	3	0	f	2010-07-24	4348	\N	16773	\N
21526	GENERIC_DAY	3	0	f	2010-07-11	4348	\N	16773	\N
21527	GENERIC_DAY	3	4	f	2010-07-02	4348	\N	16773	\N
21528	GENERIC_DAY	3	0	f	2010-07-24	4358	\N	16773	\N
21529	GENERIC_DAY	3	2	f	2010-07-19	4344	\N	16773	\N
21530	GENERIC_DAY	3	2	f	2010-07-21	4344	\N	16773	\N
21531	GENERIC_DAY	3	2	f	2010-07-20	4344	\N	16773	\N
21532	GENERIC_DAY	3	0	f	2010-07-04	4348	\N	16773	\N
21566	GENERIC_DAY	3	2	f	2010-07-16	4358	\N	16773	\N
21567	GENERIC_DAY	3	4	f	2010-07-05	4348	\N	16773	\N
21568	GENERIC_DAY	3	3	f	2010-07-16	4348	\N	16773	\N
21569	GENERIC_DAY	3	2	f	2010-07-19	4350	\N	16773	\N
21570	GENERIC_DAY	3	2	f	2010-07-28	4344	\N	16773	\N
21571	GENERIC_DAY	3	0	f	2010-07-06	4344	\N	16773	\N
21572	GENERIC_DAY	3	2	f	2010-07-19	4348	\N	16773	\N
21573	GENERIC_DAY	3	0	f	2010-07-03	4348	\N	16773	\N
21574	GENERIC_DAY	3	0	f	2010-07-02	4344	\N	16773	\N
21575	GENERIC_DAY	3	0	f	2010-07-13	4344	\N	16773	\N
21576	GENERIC_DAY	3	2	f	2010-07-20	4350	\N	16773	\N
21577	GENERIC_DAY	3	2	f	2010-07-15	4358	\N	16773	\N
21578	GENERIC_DAY	3	0	f	2010-07-25	4344	\N	16773	\N
21579	GENERIC_DAY	3	3	f	2010-07-13	4350	\N	16773	\N
21581	GENERIC_DAY	3	2	f	2010-08-18	4348	\N	16774	\N
21582	GENERIC_DAY	3	2	f	2010-09-01	4350	\N	16774	\N
21583	GENERIC_DAY	3	2	f	2010-08-16	4344	\N	16774	\N
21584	GENERIC_DAY	3	2	f	2010-08-30	4350	\N	16774	\N
21585	GENERIC_DAY	3	2	f	2010-08-25	4350	\N	16774	\N
21586	GENERIC_DAY	3	2	f	2010-08-18	4344	\N	16774	\N
21587	GENERIC_DAY	3	2	f	2010-08-25	4348	\N	16774	\N
21588	GENERIC_DAY	3	2	f	2010-08-02	4344	\N	16774	\N
21589	GENERIC_DAY	3	0	f	2010-08-29	4348	\N	16774	\N
21590	GENERIC_DAY	3	0	f	2010-08-22	4350	\N	16774	\N
21591	GENERIC_DAY	3	2	f	2010-08-06	4344	\N	16774	\N
21592	GENERIC_DAY	3	0	f	2010-08-14	4348	\N	16774	\N
21593	GENERIC_DAY	3	2	f	2010-08-30	4344	\N	16774	\N
21594	GENERIC_DAY	3	2	f	2010-08-11	4350	\N	16774	\N
21595	GENERIC_DAY	3	0	f	2010-08-08	4350	\N	16774	\N
21596	GENERIC_DAY	3	0	f	2010-08-01	4358	\N	16774	\N
21597	GENERIC_DAY	3	2	f	2010-08-05	4350	\N	16774	\N
21598	GENERIC_DAY	3	2	f	2010-08-09	4348	\N	16774	\N
21599	GENERIC_DAY	3	2	f	2010-07-29	4344	\N	16774	\N
21600	GENERIC_DAY	3	2	f	2010-08-10	4344	\N	16774	\N
21601	GENERIC_DAY	3	0	f	2010-08-14	4358	\N	16774	\N
21602	GENERIC_DAY	3	0	f	2010-08-15	4348	\N	16774	\N
21603	GENERIC_DAY	3	2	f	2010-08-20	4358	\N	16774	\N
21604	GENERIC_DAY	3	2	f	2010-08-03	4358	\N	16774	\N
21605	GENERIC_DAY	3	2	f	2010-08-24	4348	\N	16774	\N
21606	GENERIC_DAY	3	0	f	2010-08-28	4348	\N	16774	\N
21607	GENERIC_DAY	3	2	f	2010-08-26	4344	\N	16774	\N
21608	GENERIC_DAY	3	0	f	2010-08-29	4344	\N	16774	\N
21609	GENERIC_DAY	3	2	f	2010-08-05	4348	\N	16774	\N
21610	GENERIC_DAY	3	2	f	2010-07-30	4350	\N	16774	\N
21611	GENERIC_DAY	3	2	f	2010-08-04	4358	\N	16774	\N
21612	GENERIC_DAY	3	0	f	2010-08-15	4358	\N	16774	\N
21613	GENERIC_DAY	3	2	f	2010-08-03	4348	\N	16774	\N
21614	GENERIC_DAY	3	2	f	2010-08-20	4348	\N	16774	\N
21615	GENERIC_DAY	3	2	f	2010-08-11	4358	\N	16774	\N
21616	GENERIC_DAY	3	2	f	2010-08-19	4344	\N	16774	\N
21617	GENERIC_DAY	3	0	f	2010-08-15	4344	\N	16774	\N
21618	GENERIC_DAY	3	0	f	2010-08-08	4348	\N	16774	\N
21619	GENERIC_DAY	3	0	f	2010-08-21	4358	\N	16774	\N
21620	GENERIC_DAY	3	2	f	2010-08-17	4344	\N	16774	\N
21621	GENERIC_DAY	3	2	f	2010-08-12	4348	\N	16774	\N
21622	GENERIC_DAY	3	2	f	2010-08-30	4348	\N	16774	\N
21623	GENERIC_DAY	3	2	f	2010-08-04	4344	\N	16774	\N
21624	GENERIC_DAY	3	0	f	2010-08-14	4344	\N	16774	\N
21625	GENERIC_DAY	3	2	f	2010-08-06	4348	\N	16774	\N
21626	GENERIC_DAY	3	0	f	2010-07-31	4348	\N	16774	\N
21627	GENERIC_DAY	3	2	f	2010-08-17	4348	\N	16774	\N
21628	GENERIC_DAY	3	2	f	2010-08-24	4358	\N	16774	\N
21629	GENERIC_DAY	3	2	f	2010-08-19	4358	\N	16774	\N
21630	GENERIC_DAY	3	0	f	2010-08-29	4350	\N	16774	\N
21631	GENERIC_DAY	3	2	f	2010-08-16	4358	\N	16774	\N
21632	GENERIC_DAY	3	0	f	2010-08-21	4344	\N	16774	\N
21633	GENERIC_DAY	3	2	f	2010-08-24	4350	\N	16774	\N
21634	GENERIC_DAY	3	2	f	2010-08-04	4350	\N	16774	\N
21635	GENERIC_DAY	3	0	f	2010-08-07	4350	\N	16774	\N
21636	GENERIC_DAY	3	2	f	2010-08-09	4358	\N	16774	\N
21637	GENERIC_DAY	3	0	f	2010-08-08	4344	\N	16774	\N
21638	GENERIC_DAY	3	2	f	2010-08-10	4348	\N	16774	\N
21639	GENERIC_DAY	3	2	f	2010-09-01	4348	\N	16774	\N
21640	GENERIC_DAY	3	2	f	2010-08-11	4344	\N	16774	\N
21641	GENERIC_DAY	3	0	f	2010-08-28	4358	\N	16774	\N
21642	GENERIC_DAY	3	0	f	2010-08-28	4350	\N	16774	\N
21643	GENERIC_DAY	3	2	f	2010-08-12	4358	\N	16774	\N
21644	GENERIC_DAY	3	2	f	2010-08-02	4350	\N	16774	\N
21645	GENERIC_DAY	3	2	f	2010-09-01	4344	\N	16774	\N
21646	GENERIC_DAY	3	2	f	2010-07-30	4344	\N	16774	\N
21647	GENERIC_DAY	3	0	f	2010-08-07	4344	\N	16774	\N
21648	GENERIC_DAY	3	2	f	2010-08-16	4350	\N	16774	\N
21649	GENERIC_DAY	3	2	f	2010-08-19	4348	\N	16774	\N
21650	GENERIC_DAY	3	0	f	2010-08-15	4350	\N	16774	\N
21651	GENERIC_DAY	3	2	f	2010-08-06	4358	\N	16774	\N
21652	GENERIC_DAY	3	2	f	2010-08-09	4350	\N	16774	\N
21653	GENERIC_DAY	3	2	f	2010-08-23	4344	\N	16774	\N
21654	GENERIC_DAY	3	2	f	2010-08-05	4358	\N	16774	\N
21655	GENERIC_DAY	3	2	f	2010-08-10	4350	\N	16774	\N
21656	GENERIC_DAY	3	0	f	2010-08-01	4348	\N	16774	\N
21657	GENERIC_DAY	3	2	f	2010-08-18	4350	\N	16774	\N
21658	GENERIC_DAY	3	2	f	2010-08-27	4358	\N	16774	\N
21659	GENERIC_DAY	3	0	f	2010-08-07	4358	\N	16774	\N
21660	GENERIC_DAY	3	2	f	2010-08-17	4358	\N	16774	\N
21661	GENERIC_DAY	3	0	f	2010-07-31	4344	\N	16774	\N
21662	GENERIC_DAY	3	2	f	2010-07-29	4348	\N	16774	\N
21663	GENERIC_DAY	3	2	f	2010-08-02	4348	\N	16774	\N
21664	GENERIC_DAY	3	2	f	2010-08-13	4358	\N	16774	\N
21665	GENERIC_DAY	3	2	f	2010-08-23	4350	\N	16774	\N
21666	GENERIC_DAY	3	2	f	2010-08-11	4348	\N	16774	\N
21667	GENERIC_DAY	3	2	f	2010-08-25	4344	\N	16774	\N
21668	GENERIC_DAY	3	2	f	2010-08-27	4348	\N	16774	\N
21669	GENERIC_DAY	3	0	f	2010-08-14	4350	\N	16774	\N
21670	GENERIC_DAY	3	2	f	2010-08-12	4344	\N	16774	\N
21671	GENERIC_DAY	3	2	f	2010-08-31	4344	\N	16774	\N
21672	GENERIC_DAY	3	2	f	2010-07-30	4358	\N	16774	\N
13228	SPECIFIC_DAY	1	8	f	2010-06-30	4350	8082	\N	\N
21673	GENERIC_DAY	3	0	f	2010-07-31	4358	\N	16774	\N
21674	GENERIC_DAY	3	2	f	2010-08-30	4358	\N	16774	\N
21675	GENERIC_DAY	3	2	f	2010-08-03	4344	\N	16774	\N
21676	GENERIC_DAY	3	0	f	2010-08-22	4348	\N	16774	\N
21677	GENERIC_DAY	3	2	f	2010-08-13	4348	\N	16774	\N
21678	GENERIC_DAY	3	2	f	2010-08-20	4344	\N	16774	\N
21679	GENERIC_DAY	3	2	f	2010-08-25	4358	\N	16774	\N
21680	GENERIC_DAY	3	2	f	2010-08-04	4348	\N	16774	\N
21681	GENERIC_DAY	3	2	f	2010-08-23	4348	\N	16774	\N
21682	GENERIC_DAY	3	2	f	2010-08-23	4358	\N	16774	\N
21683	GENERIC_DAY	3	2	f	2010-07-29	4358	\N	16774	\N
27664	GENERIC_DAY	8	2	f	2010-08-24	4358	\N	27074	\N
27650	GENERIC_DAY	8	2	f	2010-08-03	4350	\N	27074	\N
27643	GENERIC_DAY	8	2	f	2010-08-18	4350	\N	27074	\N
27644	GENERIC_DAY	8	0	f	2010-08-21	4344	\N	27074	\N
27668	GENERIC_DAY	8	2	f	2010-08-05	4358	\N	27074	\N
27640	GENERIC_DAY	8	2	f	2010-08-04	4358	\N	27074	\N
27641	GENERIC_DAY	8	2	f	2010-08-18	4348	\N	27074	\N
27646	GENERIC_DAY	8	2	f	2010-08-12	4348	\N	27074	\N
27635	GENERIC_DAY	8	0	f	2010-08-08	4350	\N	27074	\N
27667	GENERIC_DAY	8	2	f	2010-08-27	4344	\N	27074	\N
37895	SPECIFIC_DAY	1	8	f	2010-08-16	1220	31213	\N	\N
37896	SPECIFIC_DAY	1	0	f	2010-08-14	1220	31213	\N	\N
37897	SPECIFIC_DAY	1	8	f	2010-08-06	1220	31213	\N	\N
37898	SPECIFIC_DAY	1	8	f	2010-08-20	1220	31213	\N	\N
37899	SPECIFIC_DAY	1	4	f	2010-08-04	1220	31213	\N	\N
37900	SPECIFIC_DAY	1	8	f	2010-08-09	1220	31213	\N	\N
37901	SPECIFIC_DAY	1	8	f	2010-08-13	1220	31213	\N	\N
37902	SPECIFIC_DAY	1	8	f	2010-08-18	1220	31213	\N	\N
37903	SPECIFIC_DAY	1	0	f	2010-08-08	1220	31213	\N	\N
37904	SPECIFIC_DAY	1	8	f	2010-08-10	1220	31213	\N	\N
37905	SPECIFIC_DAY	1	8	f	2010-08-19	1220	31213	\N	\N
37906	SPECIFIC_DAY	1	0	f	2010-08-15	1220	31213	\N	\N
37907	SPECIFIC_DAY	1	8	f	2010-08-12	1220	31213	\N	\N
37908	SPECIFIC_DAY	1	0	f	2010-08-07	1220	31213	\N	\N
37909	SPECIFIC_DAY	1	8	f	2010-08-11	1220	31213	\N	\N
37910	SPECIFIC_DAY	1	8	f	2010-08-05	1220	31213	\N	\N
37911	SPECIFIC_DAY	1	8	f	2010-08-17	1220	31213	\N	\N
6515	GENERIC_DAY	15	5	f	2010-07-14	4354	\N	5962	\N
6513	GENERIC_DAY	15	4	f	2010-07-07	4352	\N	5962	\N
6536	GENERIC_DAY	15	1	f	2010-06-26	4354	\N	5962	\N
6518	GENERIC_DAY	15	5	f	2010-06-29	4352	\N	5962	\N
6522	GENERIC_DAY	15	1	f	2010-07-18	4354	\N	5962	\N
6529	GENERIC_DAY	15	1	f	2010-06-26	4352	\N	5962	\N
6517	GENERIC_DAY	15	4	f	2010-07-16	4352	\N	5962	\N
6285	GENERIC_DAY	17	4	t	2010-06-16	4352	\N	5962	\N
6344	GENERIC_DAY	17	0	t	2010-06-20	4352	\N	5962	\N
6531	GENERIC_DAY	15	5	f	2010-07-20	4354	\N	5962	\N
6520	GENERIC_DAY	15	5	f	2010-06-28	4354	\N	5962	\N
6343	GENERIC_DAY	17	4	t	2010-06-15	4352	\N	5962	\N
6500	GENERIC_DAY	15	5	f	2010-07-19	4354	\N	5962	\N
6526	GENERIC_DAY	15	1	f	2010-06-27	4352	\N	5962	\N
6538	GENERIC_DAY	15	4	f	2010-07-13	4352	\N	5962	\N
6295	GENERIC_DAY	17	4	t	2010-06-24	4354	\N	5962	\N
6340	GENERIC_DAY	17	4	t	2010-06-17	4352	\N	5962	\N
6310	GENERIC_DAY	17	4	t	2010-06-23	4354	\N	5962	\N
6521	GENERIC_DAY	15	5	f	2010-06-30	4352	\N	5962	\N
6319	GENERIC_DAY	17	4	t	2010-06-18	4354	\N	5962	\N
6523	GENERIC_DAY	15	4	f	2010-07-12	4352	\N	5962	\N
8798	GENERIC_DAY	11	2	f	2010-07-06	4348	\N	5964	\N
8847	GENERIC_DAY	11	0	f	2010-06-27	4348	\N	5964	\N
8839	GENERIC_DAY	11	2	f	2010-07-07	4348	\N	5964	\N
8867	GENERIC_DAY	11	0	f	2010-07-03	4350	\N	5964	\N
8849	GENERIC_DAY	11	0	f	2010-06-20	4344	\N	5964	\N
8856	GENERIC_DAY	11	2	f	2010-07-07	4358	\N	5964	\N
8866	GENERIC_DAY	11	4	f	2010-06-14	4350	\N	5964	\N
8852	GENERIC_DAY	11	2	f	2010-07-02	4344	\N	5964	\N
8854	GENERIC_DAY	11	0	f	2010-07-04	4344	\N	5964	\N
8840	GENERIC_DAY	11	2	f	2010-06-30	4350	\N	5964	\N
8855	GENERIC_DAY	11	2	f	2010-06-17	4358	\N	5964	\N
8851	GENERIC_DAY	11	2	f	2010-07-01	4344	\N	5964	\N
8877	GENERIC_DAY	11	0	f	2010-06-26	4350	\N	5964	\N
8886	GENERIC_DAY	11	4	f	2010-06-14	4358	\N	5964	\N
8845	GENERIC_DAY	11	2	f	2010-06-30	4344	\N	5964	\N
8885	GENERIC_DAY	11	0	f	2010-07-03	4344	\N	5964	\N
44628	GENERIC_DAY	0	2	f	2010-06-17	4350	\N	42531	\N
44629	GENERIC_DAY	0	0	f	2010-06-26	4348	\N	42531	\N
44630	GENERIC_DAY	0	1	f	2010-06-17	21817	\N	42531	\N
44631	GENERIC_DAY	0	0	f	2010-06-26	4358	\N	42531	\N
44632	GENERIC_DAY	0	0	f	2010-06-20	4350	\N	42531	\N
44633	GENERIC_DAY	0	0	f	2010-06-27	4358	\N	42531	\N
44634	GENERIC_DAY	0	0	f	2010-06-27	21817	\N	42531	\N
44635	GENERIC_DAY	0	0	f	2010-06-27	4348	\N	42531	\N
44636	GENERIC_DAY	0	0	f	2010-06-19	4348	\N	42531	\N
44637	GENERIC_DAY	0	1	f	2010-06-15	4358	\N	42531	\N
44638	GENERIC_DAY	0	0	f	2010-06-26	4344	\N	42531	\N
8836	GENERIC_DAY	11	2	f	2010-06-18	4358	\N	5964	\N
8853	GENERIC_DAY	11	2	f	2010-07-08	4348	\N	5964	\N
8882	GENERIC_DAY	11	2	f	2010-06-25	4350	\N	5964	\N
8873	GENERIC_DAY	11	2	f	2010-07-05	4348	\N	5964	\N
8871	GENERIC_DAY	11	0	f	2010-06-20	4358	\N	5964	\N
8879	GENERIC_DAY	11	2	f	2010-06-16	4350	\N	5964	\N
8842	GENERIC_DAY	11	2	f	2010-07-05	4350	\N	5964	\N
8858	GENERIC_DAY	11	2	f	2010-06-17	4348	\N	5964	\N
8874	GENERIC_DAY	11	2	f	2010-06-24	4348	\N	5964	\N
8850	GENERIC_DAY	11	0	f	2010-07-04	4348	\N	5964	\N
8870	GENERIC_DAY	11	2	f	2010-06-22	4348	\N	5964	\N
8859	GENERIC_DAY	11	1	f	2010-07-08	4350	\N	5964	\N
8863	GENERIC_DAY	11	2	f	2010-07-02	4358	\N	5964	\N
8838	GENERIC_DAY	11	2	f	2010-06-25	4358	\N	5964	\N
44639	GENERIC_DAY	0	2	f	2010-06-25	4348	\N	42531	\N
44640	GENERIC_DAY	0	0	f	2010-06-24	4344	\N	42531	\N
44641	GENERIC_DAY	0	0	f	2010-06-25	4350	\N	42531	\N
44642	GENERIC_DAY	0	0	f	2010-06-20	4348	\N	42531	\N
44643	GENERIC_DAY	0	0	f	2010-06-26	21817	\N	42531	\N
44644	GENERIC_DAY	0	1	f	2010-06-30	4350	\N	42531	\N
44645	GENERIC_DAY	0	1	f	2010-06-16	21817	\N	42531	\N
44646	GENERIC_DAY	0	4	f	2010-06-24	21817	\N	42531	\N
44647	GENERIC_DAY	0	2	f	2010-06-16	4348	\N	42531	\N
44648	GENERIC_DAY	0	4	f	2010-06-30	4348	\N	42531	\N
44649	GENERIC_DAY	0	2	f	2010-06-29	4350	\N	42531	\N
44650	GENERIC_DAY	0	3	f	2010-06-29	4358	\N	42531	\N
44651	GENERIC_DAY	0	2	f	2010-06-17	4344	\N	42531	\N
44652	GENERIC_DAY	0	2	f	2010-06-21	4344	\N	42531	\N
44653	GENERIC_DAY	0	1	f	2010-06-16	4358	\N	42531	\N
44654	GENERIC_DAY	0	2	f	2010-06-16	4344	\N	42531	\N
44655	GENERIC_DAY	0	0	f	2010-06-27	4344	\N	42531	\N
44656	GENERIC_DAY	0	0	f	2010-06-19	4358	\N	42531	\N
44657	GENERIC_DAY	0	2	f	2010-06-24	4358	\N	42531	\N
44658	GENERIC_DAY	0	2	f	2010-06-15	4348	\N	42531	\N
44659	GENERIC_DAY	0	2	f	2010-06-18	4350	\N	42531	\N
44660	GENERIC_DAY	0	1	f	2010-07-01	4358	\N	42531	\N
44661	GENERIC_DAY	0	4	f	2010-06-25	21817	\N	42531	\N
44662	GENERIC_DAY	0	0	f	2010-07-01	4350	\N	42531	\N
44663	GENERIC_DAY	0	1	f	2010-06-30	4358	\N	42531	\N
44664	GENERIC_DAY	0	2	f	2010-06-18	4344	\N	42531	\N
44665	GENERIC_DAY	0	1	f	2010-06-30	21817	\N	42531	\N
44666	GENERIC_DAY	0	0	f	2010-06-23	4350	\N	42531	\N
44667	GENERIC_DAY	0	0	f	2010-06-27	4350	\N	42531	\N
44668	GENERIC_DAY	0	1	f	2010-07-01	4348	\N	42531	\N
44669	GENERIC_DAY	0	3	f	2010-06-28	4358	\N	42531	\N
44670	GENERIC_DAY	0	2	f	2010-07-01	21817	\N	42531	\N
44671	GENERIC_DAY	0	1	f	2010-06-29	4348	\N	42531	\N
44672	GENERIC_DAY	0	0	f	2010-06-20	21817	\N	42531	\N
44673	GENERIC_DAY	0	2	f	2010-06-15	4344	\N	42531	\N
44674	GENERIC_DAY	0	2	f	2010-06-18	4348	\N	42531	\N
44675	GENERIC_DAY	0	0	f	2010-06-23	4344	\N	42531	\N
44676	GENERIC_DAY	0	1	f	2010-06-22	4350	\N	42531	\N
44677	GENERIC_DAY	0	0	f	2010-06-19	21817	\N	42531	\N
37009	GENERIC_DAY	0	0	f	2010-10-17	4350	\N	27137	\N
37010	GENERIC_DAY	0	0	f	2010-10-24	4358	\N	27137	\N
37011	GENERIC_DAY	0	2	f	2010-11-02	4348	\N	27137	\N
37012	GENERIC_DAY	0	0	f	2010-11-06	4350	\N	27137	\N
37013	GENERIC_DAY	0	0	f	2010-10-23	4344	\N	27137	\N
37014	GENERIC_DAY	0	2	f	2010-10-20	4348	\N	27137	\N
37015	GENERIC_DAY	0	2	f	2010-10-22	4358	\N	27137	\N
37016	GENERIC_DAY	0	2	f	2010-10-21	4344	\N	27137	\N
37017	GENERIC_DAY	0	2	f	2010-10-29	4350	\N	27137	\N
37018	GENERIC_DAY	0	2	f	2010-11-03	4348	\N	27137	\N
37019	GENERIC_DAY	0	0	f	2010-10-31	4350	\N	27137	\N
37020	GENERIC_DAY	0	2	f	2010-10-15	4350	\N	27137	\N
37021	GENERIC_DAY	0	2	f	2010-11-04	4344	\N	27137	\N
37022	GENERIC_DAY	0	2	f	2010-10-18	4344	\N	27137	\N
37023	GENERIC_DAY	0	2	f	2010-11-01	4350	\N	27137	\N
37024	GENERIC_DAY	0	1	f	2010-11-08	4358	\N	27137	\N
37025	GENERIC_DAY	0	2	f	2010-11-05	4348	\N	27137	\N
37026	GENERIC_DAY	0	2	f	2010-10-25	4348	\N	27137	\N
37027	GENERIC_DAY	0	2	f	2010-10-22	4350	\N	27137	\N
37028	GENERIC_DAY	0	0	f	2010-10-23	4350	\N	27137	\N
37029	GENERIC_DAY	0	2	f	2010-11-05	4344	\N	27137	\N
37030	GENERIC_DAY	0	2	f	2010-10-13	4344	\N	27137	\N
37031	GENERIC_DAY	0	2	f	2010-11-04	4358	\N	27137	\N
37032	GENERIC_DAY	0	2	f	2010-10-14	4344	\N	27137	\N
37033	GENERIC_DAY	0	2	f	2010-11-08	4348	\N	27137	\N
37034	GENERIC_DAY	0	2	f	2010-10-18	4350	\N	27137	\N
37035	GENERIC_DAY	0	2	f	2010-10-25	4344	\N	27137	\N
37036	GENERIC_DAY	0	0	f	2010-10-31	4344	\N	27137	\N
37037	GENERIC_DAY	0	0	f	2010-10-30	4350	\N	27137	\N
37038	GENERIC_DAY	0	0	f	2010-10-24	4348	\N	27137	\N
37039	GENERIC_DAY	0	2	f	2010-10-19	4344	\N	27137	\N
37040	GENERIC_DAY	0	2	f	2010-11-03	4344	\N	27137	\N
37041	GENERIC_DAY	0	0	f	2010-10-24	4344	\N	27137	\N
37042	GENERIC_DAY	0	2	f	2010-10-15	4344	\N	27137	\N
37043	GENERIC_DAY	0	2	f	2010-11-03	4350	\N	27137	\N
37044	GENERIC_DAY	0	2	f	2010-10-19	4350	\N	27137	\N
37045	GENERIC_DAY	0	0	f	2010-10-30	4348	\N	27137	\N
37046	GENERIC_DAY	0	2	f	2010-11-08	4344	\N	27137	\N
37047	GENERIC_DAY	0	2	f	2010-10-20	4350	\N	27137	\N
37048	GENERIC_DAY	0	0	f	2010-11-07	4358	\N	27137	\N
37049	GENERIC_DAY	0	0	f	2010-10-16	4344	\N	27137	\N
37050	GENERIC_DAY	0	2	f	2010-10-20	4344	\N	27137	\N
37051	GENERIC_DAY	0	2	f	2010-11-05	4358	\N	27137	\N
37052	GENERIC_DAY	0	2	f	2010-11-01	4358	\N	27137	\N
37053	GENERIC_DAY	0	0	f	2010-10-23	4348	\N	27137	\N
37054	GENERIC_DAY	0	2	f	2010-11-05	4350	\N	27137	\N
37055	GENERIC_DAY	0	2	f	2010-10-25	4358	\N	27137	\N
13739	GENERIC_DAY	0	3	f	2010-06-21	1214	\N	9406	\N
13740	GENERIC_DAY	0	3	f	2010-06-18	1220	\N	9406	\N
13741	GENERIC_DAY	0	0	f	2010-06-15	4344	\N	9406	\N
13742	GENERIC_DAY	0	0	f	2010-06-20	4344	\N	9406	\N
13743	GENERIC_DAY	0	0	f	2010-06-19	4356	\N	9406	\N
13744	GENERIC_DAY	0	0	f	2010-06-18	1216	\N	9406	\N
13745	GENERIC_DAY	0	0	f	2010-06-18	4358	\N	9406	\N
13746	GENERIC_DAY	0	0	f	2010-06-21	4350	\N	9406	\N
13747	GENERIC_DAY	0	0	f	2010-06-16	4348	\N	9406	\N
13748	GENERIC_DAY	0	0	f	2010-06-16	4352	\N	9406	\N
13749	GENERIC_DAY	0	0	f	2010-06-19	1216	\N	9406	\N
13750	GENERIC_DAY	0	0	f	2010-06-22	4344	\N	9406	\N
13751	GENERIC_DAY	0	0	f	2010-06-14	4358	\N	9406	\N
13752	GENERIC_DAY	0	2	f	2010-06-14	1220	\N	9406	\N
13753	GENERIC_DAY	0	2	f	2010-06-18	4356	\N	9406	\N
13754	GENERIC_DAY	0	0	f	2010-06-17	4348	\N	9406	\N
13755	GENERIC_DAY	0	0	f	2010-06-17	4358	\N	9406	\N
13756	GENERIC_DAY	0	0	f	2010-06-21	4344	\N	9406	\N
13757	GENERIC_DAY	0	3	f	2010-06-15	1220	\N	9406	\N
13758	GENERIC_DAY	0	0	f	2010-06-19	4358	\N	9406	\N
13759	GENERIC_DAY	0	0	f	2010-06-20	4350	\N	9406	\N
13760	GENERIC_DAY	0	0	f	2010-06-20	4352	\N	9406	\N
13761	GENERIC_DAY	0	0	f	2010-06-18	4354	\N	9406	\N
13762	GENERIC_DAY	0	0	f	2010-06-19	4344	\N	9406	\N
13763	GENERIC_DAY	0	0	f	2010-06-16	1216	\N	9406	\N
13764	GENERIC_DAY	0	0	f	2010-06-18	4350	\N	9406	\N
13765	GENERIC_DAY	0	0	f	2010-06-15	1216	\N	9406	\N
13766	GENERIC_DAY	0	0	f	2010-06-20	1214	\N	9406	\N
13767	GENERIC_DAY	0	0	f	2010-06-14	4344	\N	9406	\N
13768	GENERIC_DAY	0	3	f	2010-06-15	1214	\N	9406	\N
13769	GENERIC_DAY	0	1	f	2010-06-14	4356	\N	9406	\N
13770	GENERIC_DAY	0	0	f	2010-06-16	4358	\N	9406	\N
13771	GENERIC_DAY	0	0	f	2010-06-22	4354	\N	9406	\N
13772	GENERIC_DAY	0	0	f	2010-06-18	4348	\N	9406	\N
13773	GENERIC_DAY	0	0	f	2010-06-15	4352	\N	9406	\N
13774	GENERIC_DAY	0	0	f	2010-06-15	4350	\N	9406	\N
13775	GENERIC_DAY	0	0	f	2010-06-22	4350	\N	9406	\N
13776	GENERIC_DAY	0	2	f	2010-06-17	4356	\N	9406	\N
13777	GENERIC_DAY	0	0	f	2010-06-15	4348	\N	9406	\N
13778	GENERIC_DAY	0	0	f	2010-06-20	4358	\N	9406	\N
13779	GENERIC_DAY	0	1	f	2010-06-22	1214	\N	9406	\N
13780	GENERIC_DAY	0	3	f	2010-06-17	1214	\N	9406	\N
13781	GENERIC_DAY	0	3	f	2010-06-16	1214	\N	9406	\N
13782	GENERIC_DAY	0	0	f	2010-06-17	1216	\N	9406	\N
13783	GENERIC_DAY	0	3	f	2010-06-21	1220	\N	9406	\N
13784	GENERIC_DAY	0	0	f	2010-06-20	1220	\N	9406	\N
13785	GENERIC_DAY	0	0	f	2010-06-19	4350	\N	9406	\N
13786	GENERIC_DAY	0	0	f	2010-06-18	4344	\N	9406	\N
13787	GENERIC_DAY	0	0	f	2010-06-19	4352	\N	9406	\N
13788	GENERIC_DAY	0	0	f	2010-06-19	4348	\N	9406	\N
13789	GENERIC_DAY	0	0	f	2010-06-21	1216	\N	9406	\N
13790	GENERIC_DAY	0	0	f	2010-06-19	1214	\N	9406	\N
13791	GENERIC_DAY	0	0	f	2010-06-22	1216	\N	9406	\N
13792	GENERIC_DAY	0	0	f	2010-06-22	4348	\N	9406	\N
13793	GENERIC_DAY	0	2	f	2010-06-14	1214	\N	9406	\N
13794	GENERIC_DAY	0	0	f	2010-06-16	4350	\N	9406	\N
13795	GENERIC_DAY	0	0	f	2010-06-22	1220	\N	9406	\N
13796	GENERIC_DAY	0	0	f	2010-06-15	4354	\N	9406	\N
13797	GENERIC_DAY	0	0	f	2010-06-22	4358	\N	9406	\N
13798	GENERIC_DAY	0	2	f	2010-06-21	4356	\N	9406	\N
13799	GENERIC_DAY	0	3	f	2010-06-17	1220	\N	9406	\N
13800	GENERIC_DAY	0	0	f	2010-06-21	4348	\N	9406	\N
13801	GENERIC_DAY	0	0	f	2010-06-17	4354	\N	9406	\N
13802	GENERIC_DAY	0	0	f	2010-06-18	4352	\N	9406	\N
13803	GENERIC_DAY	0	0	f	2010-06-15	4358	\N	9406	\N
13804	GENERIC_DAY	0	0	f	2010-06-14	4350	\N	9406	\N
13805	GENERIC_DAY	0	0	f	2010-06-17	4352	\N	9406	\N
13806	GENERIC_DAY	0	0	f	2010-06-14	4354	\N	9406	\N
13807	GENERIC_DAY	0	0	f	2010-06-22	4356	\N	9406	\N
13808	GENERIC_DAY	0	2	f	2010-06-16	4356	\N	9406	\N
13809	GENERIC_DAY	0	0	f	2010-06-16	4344	\N	9406	\N
13810	GENERIC_DAY	0	2	f	2010-06-14	4348	\N	9406	\N
13811	GENERIC_DAY	0	0	f	2010-06-17	4344	\N	9406	\N
13812	GENERIC_DAY	0	1	f	2010-06-14	4352	\N	9406	\N
13813	GENERIC_DAY	0	0	f	2010-06-22	4352	\N	9406	\N
13814	GENERIC_DAY	0	0	f	2010-06-20	4348	\N	9406	\N
13815	GENERIC_DAY	0	0	f	2010-06-21	4354	\N	9406	\N
13816	GENERIC_DAY	0	2	f	2010-06-15	4356	\N	9406	\N
13817	GENERIC_DAY	0	3	f	2010-06-16	1220	\N	9406	\N
13818	GENERIC_DAY	0	0	f	2010-06-20	1216	\N	9406	\N
13819	GENERIC_DAY	0	3	f	2010-06-18	1214	\N	9406	\N
13820	GENERIC_DAY	0	0	f	2010-06-21	4358	\N	9406	\N
13821	GENERIC_DAY	0	0	f	2010-06-16	4354	\N	9406	\N
13822	GENERIC_DAY	0	0	f	2010-06-14	1216	\N	9406	\N
13823	GENERIC_DAY	0	0	f	2010-06-20	4354	\N	9406	\N
13824	GENERIC_DAY	0	0	f	2010-06-20	4356	\N	9406	\N
13825	GENERIC_DAY	0	0	f	2010-06-17	4350	\N	9406	\N
13826	GENERIC_DAY	0	0	f	2010-06-19	1220	\N	9406	\N
13827	GENERIC_DAY	0	0	f	2010-06-19	4354	\N	9406	\N
13828	GENERIC_DAY	0	0	f	2010-06-21	4352	\N	9406	\N
13697	SPECIFIC_DAY	0	0	f	2010-07-03	4344	8089	\N	\N
13698	SPECIFIC_DAY	0	8	f	2010-06-18	4344	8089	\N	\N
13699	SPECIFIC_DAY	0	8	f	2010-07-05	4344	8089	\N	\N
13700	SPECIFIC_DAY	0	0	f	2010-07-04	4344	8089	\N	\N
13701	SPECIFIC_DAY	0	8	f	2010-07-09	4344	8089	\N	\N
13702	SPECIFIC_DAY	0	8	f	2010-06-24	4344	8089	\N	\N
13703	SPECIFIC_DAY	0	8	f	2010-06-30	4344	8089	\N	\N
13704	SPECIFIC_DAY	0	8	f	2010-06-23	4344	8089	\N	\N
13705	SPECIFIC_DAY	0	8	f	2010-07-01	4344	8089	\N	\N
37056	GENERIC_DAY	0	2	f	2010-10-18	4348	\N	27137	\N
37057	GENERIC_DAY	0	2	f	2010-10-21	4350	\N	27137	\N
37058	GENERIC_DAY	0	2	f	2010-10-26	4348	\N	27137	\N
37059	GENERIC_DAY	0	2	f	2010-10-13	4348	\N	27137	\N
37060	GENERIC_DAY	0	2	f	2010-10-25	4350	\N	27137	\N
37061	GENERIC_DAY	0	2	f	2010-10-22	4348	\N	27137	\N
37062	GENERIC_DAY	0	2	f	2010-10-14	4350	\N	27137	\N
37063	GENERIC_DAY	0	2	f	2010-10-14	4348	\N	27137	\N
8872	GENERIC_DAY	11	2	f	2010-06-16	4348	\N	5964	\N
8878	GENERIC_DAY	11	0	f	2010-06-27	4344	\N	5964	\N
8844	GENERIC_DAY	11	2	f	2010-06-23	4344	\N	5964	\N
8862	GENERIC_DAY	11	2	f	2010-07-06	4358	\N	5964	\N
8843	GENERIC_DAY	11	0	f	2010-06-26	4344	\N	5964	\N
8876	GENERIC_DAY	11	2	f	2010-06-21	4350	\N	5964	\N
8884	GENERIC_DAY	11	2	f	2010-06-29	4358	\N	5964	\N
8880	GENERIC_DAY	11	2	f	2010-06-15	4348	\N	5964	\N
37064	GENERIC_DAY	0	2	f	2010-11-02	4350	\N	27137	\N
37065	GENERIC_DAY	0	0	f	2010-10-16	4358	\N	27137	\N
37066	GENERIC_DAY	0	2	f	2010-10-27	4358	\N	27137	\N
37067	GENERIC_DAY	0	2	f	2010-10-19	4358	\N	27137	\N
37068	GENERIC_DAY	0	2	f	2010-10-20	4358	\N	27137	\N
37069	GENERIC_DAY	0	2	f	2010-10-28	4358	\N	27137	\N
37070	GENERIC_DAY	0	2	f	2010-11-02	4358	\N	27137	\N
37071	GENERIC_DAY	0	2	f	2010-10-29	4358	\N	27137	\N
37072	GENERIC_DAY	0	2	f	2010-10-28	4348	\N	27137	\N
37073	GENERIC_DAY	0	2	f	2010-11-02	4344	\N	27137	\N
37074	GENERIC_DAY	0	2	f	2010-10-27	4344	\N	27137	\N
37075	GENERIC_DAY	0	2	f	2010-10-27	4348	\N	27137	\N
37076	GENERIC_DAY	0	0	f	2010-10-16	4350	\N	27137	\N
37077	GENERIC_DAY	0	2	f	2010-10-26	4344	\N	27137	\N
37078	GENERIC_DAY	0	2	f	2010-10-19	4348	\N	27137	\N
37079	GENERIC_DAY	0	2	f	2010-11-01	4348	\N	27137	\N
37080	GENERIC_DAY	0	2	f	2010-10-21	4348	\N	27137	\N
37081	GENERIC_DAY	0	2	f	2010-10-28	4344	\N	27137	\N
37082	GENERIC_DAY	0	0	f	2010-10-31	4348	\N	27137	\N
37083	GENERIC_DAY	0	2	f	2010-11-03	4358	\N	27137	\N
37084	GENERIC_DAY	0	2	f	2010-10-28	4350	\N	27137	\N
37085	GENERIC_DAY	0	2	f	2010-10-29	4348	\N	27137	\N
37086	GENERIC_DAY	0	2	f	2010-11-04	4348	\N	27137	\N
37087	GENERIC_DAY	0	0	f	2010-10-23	4358	\N	27137	\N
37088	GENERIC_DAY	0	2	f	2010-11-04	4350	\N	27137	\N
37089	GENERIC_DAY	0	2	f	2010-10-15	4358	\N	27137	\N
37090	GENERIC_DAY	0	0	f	2010-11-06	4348	\N	27137	\N
37091	GENERIC_DAY	0	0	f	2010-11-07	4350	\N	27137	\N
37092	GENERIC_DAY	0	0	f	2010-11-07	4348	\N	27137	\N
37093	GENERIC_DAY	0	0	f	2010-10-17	4344	\N	27137	\N
37094	GENERIC_DAY	0	2	f	2010-10-21	4358	\N	27137	\N
13706	SPECIFIC_DAY	0	8	f	2010-07-07	4344	8089	\N	\N
13707	SPECIFIC_DAY	0	0	f	2010-06-20	4344	8089	\N	\N
13708	SPECIFIC_DAY	0	0	f	2010-07-11	4344	8089	\N	\N
13709	SPECIFIC_DAY	0	8	f	2010-06-16	4344	8089	\N	\N
13710	SPECIFIC_DAY	0	8	f	2010-07-06	4344	8089	\N	\N
13711	SPECIFIC_DAY	0	8	f	2010-06-17	4344	8089	\N	\N
13712	SPECIFIC_DAY	0	8	f	2010-07-15	4344	8089	\N	\N
13713	SPECIFIC_DAY	0	8	f	2010-07-12	4344	8089	\N	\N
13714	SPECIFIC_DAY	0	8	f	2010-06-21	4344	8089	\N	\N
13715	SPECIFIC_DAY	0	0	f	2010-06-19	4344	8089	\N	\N
13716	SPECIFIC_DAY	0	8	f	2010-07-02	4344	8089	\N	\N
13717	SPECIFIC_DAY	0	8	f	2010-06-28	4344	8089	\N	\N
13718	SPECIFIC_DAY	0	8	f	2010-06-15	4344	8089	\N	\N
13719	SPECIFIC_DAY	0	8	f	2010-06-14	4344	8089	\N	\N
13720	SPECIFIC_DAY	0	8	f	2010-07-08	4344	8089	\N	\N
13721	SPECIFIC_DAY	0	0	f	2010-07-10	4344	8089	\N	\N
13722	SPECIFIC_DAY	0	8	f	2010-06-29	4344	8089	\N	\N
13723	SPECIFIC_DAY	0	0	f	2010-06-26	4344	8089	\N	\N
13724	SPECIFIC_DAY	0	8	f	2010-07-14	4344	8089	\N	\N
13725	SPECIFIC_DAY	0	8	f	2010-07-13	4344	8089	\N	\N
13726	SPECIFIC_DAY	0	0	f	2010-06-27	4344	8089	\N	\N
13727	SPECIFIC_DAY	0	8	f	2010-07-16	4344	8089	\N	\N
13728	SPECIFIC_DAY	0	8	f	2010-06-25	4344	8089	\N	\N
13729	SPECIFIC_DAY	0	8	f	2010-06-22	4344	8089	\N	\N
13730	SPECIFIC_DAY	0	8	f	2010-06-21	4348	8090	\N	\N
13731	SPECIFIC_DAY	0	8	f	2010-06-17	4348	8090	\N	\N
13732	SPECIFIC_DAY	0	3	f	2010-06-22	4348	8090	\N	\N
13733	SPECIFIC_DAY	0	0	f	2010-06-20	4348	8090	\N	\N
13734	SPECIFIC_DAY	0	8	f	2010-06-15	4348	8090	\N	\N
13735	SPECIFIC_DAY	0	8	f	2010-06-14	4348	8090	\N	\N
13736	SPECIFIC_DAY	0	0	f	2010-06-19	4348	8090	\N	\N
13737	SPECIFIC_DAY	0	8	f	2010-06-18	4348	8090	\N	\N
13738	SPECIFIC_DAY	0	8	f	2010-06-16	4348	8090	\N	\N
37095	GENERIC_DAY	0	1	f	2010-11-08	4350	\N	27137	\N
37096	GENERIC_DAY	0	2	f	2010-10-27	4350	\N	27137	\N
37097	GENERIC_DAY	0	2	f	2010-10-22	4344	\N	27137	\N
37098	GENERIC_DAY	0	2	f	2010-10-14	4358	\N	27137	\N
37099	GENERIC_DAY	0	0	f	2010-10-31	4358	\N	27137	\N
37100	GENERIC_DAY	0	2	f	2010-11-01	4344	\N	27137	\N
37101	GENERIC_DAY	0	0	f	2010-10-17	4348	\N	27137	\N
37102	GENERIC_DAY	0	2	f	2010-10-29	4344	\N	27137	\N
37103	GENERIC_DAY	0	2	f	2010-10-13	4358	\N	27137	\N
37104	GENERIC_DAY	0	2	f	2010-10-13	4350	\N	27137	\N
37105	GENERIC_DAY	0	0	f	2010-11-06	4344	\N	27137	\N
37106	GENERIC_DAY	0	0	f	2010-10-30	4344	\N	27137	\N
37107	GENERIC_DAY	0	2	f	2010-10-15	4348	\N	27137	\N
37108	GENERIC_DAY	0	0	f	2010-10-30	4358	\N	27137	\N
37109	GENERIC_DAY	0	0	f	2010-11-06	4358	\N	27137	\N
37110	GENERIC_DAY	0	2	f	2010-10-26	4350	\N	27137	\N
37111	GENERIC_DAY	0	0	f	2010-10-16	4348	\N	27137	\N
37112	GENERIC_DAY	0	0	f	2010-11-07	4344	\N	27137	\N
37113	GENERIC_DAY	0	0	f	2010-10-24	4350	\N	27137	\N
37114	GENERIC_DAY	0	2	f	2010-10-26	4358	\N	27137	\N
37115	GENERIC_DAY	0	0	f	2010-10-17	4358	\N	27137	\N
37116	GENERIC_DAY	0	2	f	2010-10-18	4358	\N	27137	\N
37117	GENERIC_DAY	0	2	f	2010-11-16	4358	\N	27138	\N
37118	GENERIC_DAY	0	2	f	2010-12-06	4350	\N	27138	\N
37119	GENERIC_DAY	0	2	f	2010-11-10	4358	\N	27138	\N
37120	GENERIC_DAY	0	2	f	2010-11-23	4358	\N	27138	\N
37121	GENERIC_DAY	0	2	f	2010-11-11	4358	\N	27138	\N
37122	GENERIC_DAY	0	2	f	2010-11-18	4350	\N	27138	\N
37123	GENERIC_DAY	0	2	f	2010-12-09	4348	\N	27138	\N
37124	GENERIC_DAY	0	0	f	2010-11-13	4350	\N	27138	\N
37125	GENERIC_DAY	0	0	f	2010-11-21	4344	\N	27138	\N
37126	GENERIC_DAY	0	2	f	2010-12-01	4358	\N	27138	\N
37127	GENERIC_DAY	0	0	f	2010-12-04	4350	\N	27138	\N
37128	GENERIC_DAY	0	0	f	2010-11-27	4344	\N	27138	\N
37129	GENERIC_DAY	0	2	f	2010-12-13	4350	\N	27138	\N
37130	GENERIC_DAY	0	0	f	2010-11-14	4348	\N	27138	\N
37131	GENERIC_DAY	0	2	f	2010-11-09	4350	\N	27138	\N
37132	GENERIC_DAY	0	2	f	2010-11-25	4344	\N	27138	\N
37133	GENERIC_DAY	0	2	f	2010-12-10	4344	\N	27138	\N
37134	GENERIC_DAY	0	2	f	2010-11-12	4358	\N	27138	\N
37135	GENERIC_DAY	0	0	f	2010-11-13	4358	\N	27138	\N
37136	GENERIC_DAY	0	0	f	2010-11-27	4358	\N	27138	\N
37137	GENERIC_DAY	0	2	f	2010-11-11	4344	\N	27138	\N
37138	GENERIC_DAY	0	0	f	2010-11-27	4348	\N	27138	\N
37139	GENERIC_DAY	0	0	f	2010-12-11	4348	\N	27138	\N
37140	GENERIC_DAY	0	2	f	2010-11-22	4348	\N	27138	\N
37141	GENERIC_DAY	0	0	f	2010-11-13	4344	\N	27138	\N
37142	GENERIC_DAY	0	2	f	2010-12-03	4350	\N	27138	\N
37143	GENERIC_DAY	0	2	f	2010-12-03	4358	\N	27138	\N
37144	GENERIC_DAY	0	2	f	2010-11-25	4358	\N	27138	\N
37145	GENERIC_DAY	0	2	f	2010-12-09	4358	\N	27138	\N
37146	GENERIC_DAY	0	2	f	2010-12-09	4350	\N	27138	\N
37147	GENERIC_DAY	0	0	f	2010-11-28	4358	\N	27138	\N
37148	GENERIC_DAY	0	0	f	2010-12-12	4358	\N	27138	\N
37149	GENERIC_DAY	0	0	f	2010-12-12	4348	\N	27138	\N
37150	GENERIC_DAY	0	2	f	2010-11-17	4344	\N	27138	\N
37151	GENERIC_DAY	0	2	f	2010-12-06	4358	\N	27138	\N
37152	GENERIC_DAY	0	0	f	2010-11-14	4350	\N	27138	\N
37153	GENERIC_DAY	0	2	f	2010-12-02	4348	\N	27138	\N
37154	GENERIC_DAY	0	2	f	2010-11-24	4344	\N	27138	\N
37155	GENERIC_DAY	0	0	f	2010-11-20	4358	\N	27138	\N
37156	GENERIC_DAY	0	2	f	2010-11-12	4348	\N	27138	\N
37157	GENERIC_DAY	0	2	f	2010-12-10	4350	\N	27138	\N
37158	GENERIC_DAY	0	0	f	2010-11-21	4358	\N	27138	\N
37159	GENERIC_DAY	0	0	f	2010-12-05	4358	\N	27138	\N
37160	GENERIC_DAY	0	2	f	2010-12-13	4358	\N	27138	\N
37161	GENERIC_DAY	0	2	f	2010-12-07	4358	\N	27138	\N
37162	GENERIC_DAY	0	2	f	2010-11-22	4344	\N	27138	\N
37163	GENERIC_DAY	0	2	f	2010-12-02	4344	\N	27138	\N
37164	GENERIC_DAY	0	0	f	2010-12-11	4358	\N	27138	\N
37165	GENERIC_DAY	0	2	f	2010-11-11	4348	\N	27138	\N
37166	GENERIC_DAY	0	2	f	2010-11-15	4348	\N	27138	\N
37167	GENERIC_DAY	0	2	f	2010-11-19	4344	\N	27138	\N
37168	GENERIC_DAY	0	2	f	2010-12-10	4358	\N	27138	\N
37169	GENERIC_DAY	0	0	f	2010-12-05	4348	\N	27138	\N
37170	GENERIC_DAY	0	2	f	2010-11-10	4344	\N	27138	\N
37171	GENERIC_DAY	0	0	f	2010-12-04	4348	\N	27138	\N
37172	GENERIC_DAY	0	2	f	2010-11-15	4344	\N	27138	\N
37173	GENERIC_DAY	0	2	f	2010-12-06	4344	\N	27138	\N
37174	GENERIC_DAY	0	0	f	2010-11-28	4348	\N	27138	\N
37175	GENERIC_DAY	0	0	f	2010-11-14	4344	\N	27138	\N
37176	GENERIC_DAY	0	2	f	2010-11-30	4350	\N	27138	\N
37177	GENERIC_DAY	0	0	f	2010-12-11	4350	\N	27138	\N
37178	GENERIC_DAY	0	2	f	2010-12-06	4348	\N	27138	\N
37179	GENERIC_DAY	0	2	f	2010-11-24	4358	\N	27138	\N
37180	GENERIC_DAY	0	2	f	2010-12-09	4344	\N	27138	\N
37181	GENERIC_DAY	0	2	f	2010-11-29	4344	\N	27138	\N
46723	GENERIC_DAY	4	6	t	2010-06-18	1220	\N	45866	\N
46726	GENERIC_DAY	4	6	f	2010-06-29	1216	\N	45866	\N
46733	GENERIC_DAY	4	10	f	2010-07-01	1220	\N	45866	\N
46719	GENERIC_DAY	4	2	t	2010-06-21	1216	\N	45866	\N
46707	GENERIC_DAY	4	0	f	2010-06-26	1220	\N	45866	\N
46720	GENERIC_DAY	4	2	t	2010-06-15	1216	\N	45866	\N
46712	GENERIC_DAY	4	6	t	2010-06-21	1220	\N	45866	\N
46711	GENERIC_DAY	4	8	t	2010-06-24	1220	\N	45866	\N
37182	GENERIC_DAY	0	0	f	2010-11-28	4344	\N	27138	\N
37183	GENERIC_DAY	0	2	f	2010-12-02	4350	\N	27138	\N
37184	GENERIC_DAY	0	2	f	2010-11-09	4358	\N	27138	\N
37185	GENERIC_DAY	0	2	f	2010-12-08	4348	\N	27138	\N
37186	GENERIC_DAY	0	2	f	2010-11-15	4358	\N	27138	\N
37187	GENERIC_DAY	0	2	f	2010-12-01	4344	\N	27138	\N
37188	GENERIC_DAY	0	2	f	2010-11-09	4344	\N	27138	\N
37189	GENERIC_DAY	0	2	f	2010-11-12	4350	\N	27138	\N
44678	GENERIC_DAY	0	0	f	2010-06-25	4344	\N	42531	\N
44679	GENERIC_DAY	0	0	f	2010-06-24	4350	\N	42531	\N
44680	GENERIC_DAY	0	0	f	2010-06-19	4350	\N	42531	\N
44681	GENERIC_DAY	0	0	f	2010-06-19	4344	\N	42531	\N
44682	GENERIC_DAY	0	2	f	2010-06-15	4350	\N	42531	\N
44683	GENERIC_DAY	0	2	f	2010-06-29	4344	\N	42531	\N
44684	GENERIC_DAY	0	2	f	2010-06-28	4350	\N	42531	\N
44685	GENERIC_DAY	0	1	f	2010-06-28	4348	\N	42531	\N
44686	GENERIC_DAY	0	2	f	2010-06-17	4348	\N	42531	\N
44687	GENERIC_DAY	0	1	f	2010-06-21	4358	\N	42531	\N
44688	GENERIC_DAY	0	4	f	2010-06-23	21817	\N	42531	\N
44689	GENERIC_DAY	0	2	f	2010-06-28	4344	\N	42531	\N
44690	GENERIC_DAY	0	2	f	2010-06-21	4348	\N	42531	\N
44691	GENERIC_DAY	0	0	f	2010-06-20	4344	\N	42531	\N
44692	GENERIC_DAY	0	2	f	2010-06-21	4350	\N	42531	\N
44693	GENERIC_DAY	0	2	f	2010-06-16	4350	\N	42531	\N
44694	GENERIC_DAY	0	0	f	2010-06-29	21817	\N	42531	\N
37190	GENERIC_DAY	0	2	f	2010-12-01	4350	\N	27138	\N
37191	GENERIC_DAY	0	2	f	2010-11-09	4348	\N	27138	\N
37192	GENERIC_DAY	0	2	f	2010-11-19	4350	\N	27138	\N
37193	GENERIC_DAY	0	2	f	2010-12-07	4350	\N	27138	\N
37194	GENERIC_DAY	0	0	f	2010-11-27	4350	\N	27138	\N
37195	GENERIC_DAY	0	2	f	2010-11-24	4350	\N	27138	\N
37196	GENERIC_DAY	0	0	f	2010-11-13	4348	\N	27138	\N
37197	GENERIC_DAY	0	2	f	2010-11-29	4350	\N	27138	\N
37198	GENERIC_DAY	0	0	f	2010-12-04	4358	\N	27138	\N
37199	GENERIC_DAY	0	2	f	2010-11-30	4344	\N	27138	\N
37200	GENERIC_DAY	0	2	f	2010-12-03	4344	\N	27138	\N
37201	GENERIC_DAY	0	2	f	2010-12-07	4348	\N	27138	\N
37202	GENERIC_DAY	0	2	f	2010-11-26	4348	\N	27138	\N
37203	GENERIC_DAY	0	2	f	2010-11-19	4358	\N	27138	\N
37204	GENERIC_DAY	0	2	f	2010-11-26	4358	\N	27138	\N
37205	GENERIC_DAY	0	2	f	2010-11-11	4350	\N	27138	\N
37206	GENERIC_DAY	0	2	f	2010-12-10	4348	\N	27138	\N
37207	GENERIC_DAY	0	0	f	2010-11-28	4350	\N	27138	\N
37208	GENERIC_DAY	0	2	f	2010-11-29	4348	\N	27138	\N
37209	GENERIC_DAY	0	2	f	2010-12-08	4350	\N	27138	\N
37210	GENERIC_DAY	0	2	f	2010-11-25	4348	\N	27138	\N
37211	GENERIC_DAY	0	2	f	2010-11-16	4350	\N	27138	\N
37212	GENERIC_DAY	0	2	f	2010-11-17	4348	\N	27138	\N
37213	GENERIC_DAY	0	2	f	2010-12-13	4348	\N	27138	\N
37214	GENERIC_DAY	0	2	f	2010-11-18	4344	\N	27138	\N
37215	GENERIC_DAY	0	0	f	2010-11-20	4348	\N	27138	\N
37216	GENERIC_DAY	0	2	f	2010-11-22	4358	\N	27138	\N
37217	GENERIC_DAY	0	0	f	2010-12-05	4344	\N	27138	\N
37218	GENERIC_DAY	0	0	f	2010-12-05	4350	\N	27138	\N
37219	GENERIC_DAY	0	2	f	2010-11-16	4348	\N	27138	\N
37220	GENERIC_DAY	0	2	f	2010-11-29	4358	\N	27138	\N
37221	GENERIC_DAY	0	0	f	2010-11-21	4348	\N	27138	\N
37222	GENERIC_DAY	0	2	f	2010-12-08	4344	\N	27138	\N
37223	GENERIC_DAY	0	2	f	2010-11-15	4350	\N	27138	\N
37224	GENERIC_DAY	0	0	f	2010-11-21	4350	\N	27138	\N
37225	GENERIC_DAY	0	2	f	2010-11-26	4344	\N	27138	\N
37226	GENERIC_DAY	0	2	f	2010-11-18	4358	\N	27138	\N
37227	GENERIC_DAY	0	2	f	2010-11-17	4358	\N	27138	\N
37228	GENERIC_DAY	0	2	f	2010-11-30	4348	\N	27138	\N
37229	GENERIC_DAY	0	0	f	2010-11-20	4344	\N	27138	\N
37230	GENERIC_DAY	0	2	f	2010-12-08	4358	\N	27138	\N
37231	GENERIC_DAY	0	2	f	2010-11-17	4350	\N	27138	\N
37232	GENERIC_DAY	0	2	f	2010-11-25	4350	\N	27138	\N
37233	GENERIC_DAY	0	2	f	2010-11-24	4348	\N	27138	\N
37234	GENERIC_DAY	0	0	f	2010-11-14	4358	\N	27138	\N
37235	GENERIC_DAY	0	2	f	2010-11-16	4344	\N	27138	\N
37236	GENERIC_DAY	0	2	f	2010-12-01	4348	\N	27138	\N
37237	GENERIC_DAY	0	0	f	2010-12-12	4344	\N	27138	\N
37238	GENERIC_DAY	0	2	f	2010-12-07	4344	\N	27138	\N
37256	GENERIC_DAY	0	2	f	2010-11-23	4348	\N	27138	\N
37257	GENERIC_DAY	0	4	f	2010-10-07	4354	\N	27139	\N
37258	GENERIC_DAY	0	4	f	2010-09-16	4352	\N	27139	\N
37259	GENERIC_DAY	0	4	f	2010-09-30	4354	\N	27139	\N
37260	GENERIC_DAY	0	4	f	2010-09-21	4354	\N	27139	\N
37261	GENERIC_DAY	0	0	f	2010-09-12	4352	\N	27139	\N
37262	GENERIC_DAY	0	4	f	2010-09-14	4354	\N	27139	\N
37263	GENERIC_DAY	0	4	f	2010-10-11	4354	\N	27139	\N
37264	GENERIC_DAY	0	4	f	2010-10-01	4354	\N	27139	\N
37265	GENERIC_DAY	0	4	f	2010-09-23	4352	\N	27139	\N
37266	GENERIC_DAY	0	4	f	2010-10-08	4354	\N	27139	\N
37267	GENERIC_DAY	0	4	f	2010-10-01	4352	\N	27139	\N
37268	GENERIC_DAY	0	4	f	2010-10-12	4354	\N	27139	\N
37269	GENERIC_DAY	0	4	f	2010-09-17	4352	\N	27139	\N
37270	GENERIC_DAY	0	4	f	2010-10-05	4354	\N	27139	\N
37271	GENERIC_DAY	0	0	f	2010-09-11	4354	\N	27139	\N
37272	GENERIC_DAY	0	4	f	2010-09-21	4352	\N	27139	\N
37273	GENERIC_DAY	0	4	f	2010-09-22	4352	\N	27139	\N
37274	GENERIC_DAY	0	4	f	2010-09-15	4352	\N	27139	\N
37275	GENERIC_DAY	0	4	f	2010-09-09	4354	\N	27139	\N
37276	GENERIC_DAY	0	0	f	2010-10-03	4354	\N	27139	\N
37277	GENERIC_DAY	0	0	f	2010-10-09	4354	\N	27139	\N
37278	GENERIC_DAY	0	4	f	2010-09-28	4352	\N	27139	\N
37279	GENERIC_DAY	0	0	f	2010-09-12	4354	\N	27139	\N
37280	GENERIC_DAY	0	4	f	2010-10-07	4352	\N	27139	\N
37281	GENERIC_DAY	0	0	f	2010-10-03	4352	\N	27139	\N
37282	GENERIC_DAY	0	0	f	2010-10-02	4354	\N	27139	\N
37283	GENERIC_DAY	0	0	f	2010-10-10	4352	\N	27139	\N
37284	GENERIC_DAY	0	4	f	2010-09-13	4354	\N	27139	\N
37291	GENERIC_DAY	0	4	f	2010-09-08	4352	\N	27139	\N
37292	GENERIC_DAY	0	4	f	2010-09-09	4352	\N	27139	\N
37293	GENERIC_DAY	0	4	f	2010-10-13	4352	\N	27139	\N
37294	GENERIC_DAY	0	0	f	2010-09-18	4352	\N	27139	\N
37295	GENERIC_DAY	0	4	f	2010-09-24	4352	\N	27139	\N
37296	GENERIC_DAY	0	4	f	2010-09-27	4352	\N	27139	\N
37297	GENERIC_DAY	0	4	f	2010-09-13	4352	\N	27139	\N
37298	GENERIC_DAY	0	0	f	2010-09-19	4354	\N	27139	\N
37299	GENERIC_DAY	0	1	f	2010-10-14	4352	\N	27139	\N
37300	GENERIC_DAY	0	4	f	2010-09-10	4352	\N	27139	\N
37301	GENERIC_DAY	0	4	f	2010-09-29	4354	\N	27139	\N
37302	GENERIC_DAY	0	4	f	2010-09-20	4354	\N	27139	\N
37303	GENERIC_DAY	0	4	f	2010-10-12	4352	\N	27139	\N
37304	GENERIC_DAY	0	0	f	2010-09-11	4352	\N	27139	\N
37305	GENERIC_DAY	0	4	f	2010-09-24	4354	\N	27139	\N
37306	GENERIC_DAY	0	4	f	2010-10-05	4352	\N	27139	\N
37307	GENERIC_DAY	0	0	f	2010-10-10	4354	\N	27139	\N
37308	GENERIC_DAY	0	4	f	2010-09-15	4354	\N	27139	\N
37309	GENERIC_DAY	0	4	f	2010-09-08	4354	\N	27139	\N
37310	GENERIC_DAY	0	0	f	2010-10-02	4352	\N	27139	\N
37311	GENERIC_DAY	0	0	f	2010-09-19	4352	\N	27139	\N
37312	GENERIC_DAY	0	0	f	2010-10-09	4352	\N	27139	\N
37313	GENERIC_DAY	0	4	f	2010-09-23	4354	\N	27139	\N
37314	GENERIC_DAY	0	1	f	2010-10-14	4354	\N	27139	\N
37315	GENERIC_DAY	0	0	f	2010-09-25	4354	\N	27139	\N
37316	GENERIC_DAY	0	4	f	2010-09-28	4354	\N	27139	\N
37317	GENERIC_DAY	0	4	f	2010-10-06	4352	\N	27139	\N
37318	GENERIC_DAY	0	4	f	2010-09-29	4352	\N	27139	\N
37319	GENERIC_DAY	0	4	f	2010-09-17	4354	\N	27139	\N
37320	GENERIC_DAY	0	4	f	2010-09-30	4352	\N	27139	\N
37321	GENERIC_DAY	0	4	f	2010-09-10	4354	\N	27139	\N
37322	GENERIC_DAY	0	0	f	2010-09-18	4354	\N	27139	\N
37323	GENERIC_DAY	0	0	f	2010-09-25	4352	\N	27139	\N
37324	GENERIC_DAY	0	4	f	2010-10-04	4354	\N	27139	\N
37325	GENERIC_DAY	0	4	f	2010-09-14	4352	\N	27139	\N
37326	GENERIC_DAY	0	4	f	2010-10-13	4354	\N	27139	\N
37327	GENERIC_DAY	0	0	f	2010-09-26	4354	\N	27139	\N
37328	GENERIC_DAY	0	4	f	2010-10-08	4352	\N	27139	\N
37329	GENERIC_DAY	0	4	f	2010-10-04	4352	\N	27139	\N
37330	GENERIC_DAY	0	4	f	2010-10-06	4354	\N	27139	\N
37331	GENERIC_DAY	0	2	f	2010-09-22	4350	\N	27140	\N
37332	GENERIC_DAY	0	2	f	2010-09-15	4344	\N	27140	\N
37333	GENERIC_DAY	0	0	f	2010-09-19	4344	\N	27140	\N
37334	GENERIC_DAY	0	2	f	2010-09-13	4350	\N	27140	\N
37335	GENERIC_DAY	0	2	f	2010-09-08	4358	\N	27140	\N
37336	GENERIC_DAY	0	0	f	2010-09-25	4344	\N	27140	\N
37337	GENERIC_DAY	0	2	f	2010-09-24	4344	\N	27140	\N
37338	GENERIC_DAY	0	2	f	2010-09-24	4350	\N	27140	\N
37339	GENERIC_DAY	0	2	f	2010-09-17	4348	\N	27140	\N
37340	GENERIC_DAY	0	2	f	2010-09-16	4348	\N	27140	\N
37341	GENERIC_DAY	0	2	f	2010-09-27	4348	\N	27140	\N
37342	GENERIC_DAY	0	2	f	2010-09-20	4348	\N	27140	\N
37343	GENERIC_DAY	0	2	f	2010-09-15	4350	\N	27140	\N
37344	GENERIC_DAY	0	2	f	2010-09-30	4350	\N	27140	\N
37345	GENERIC_DAY	0	2	f	2010-09-17	4358	\N	27140	\N
37346	GENERIC_DAY	0	2	f	2010-09-16	4358	\N	27140	\N
37347	GENERIC_DAY	0	2	f	2010-09-30	4358	\N	27140	\N
37348	GENERIC_DAY	0	2	f	2010-09-13	4348	\N	27140	\N
37349	GENERIC_DAY	0	2	f	2010-09-09	4344	\N	27140	\N
37350	GENERIC_DAY	0	2	f	2010-09-17	4350	\N	27140	\N
37351	GENERIC_DAY	0	0	f	2010-09-19	4358	\N	27140	\N
37352	GENERIC_DAY	0	2	f	2010-09-27	4350	\N	27140	\N
37353	GENERIC_DAY	0	2	f	2010-09-10	4344	\N	27140	\N
37354	GENERIC_DAY	0	0	f	2010-09-26	4350	\N	27140	\N
37355	GENERIC_DAY	0	2	f	2010-09-28	4358	\N	27140	\N
37356	GENERIC_DAY	0	2	f	2010-09-14	4348	\N	27140	\N
37357	GENERIC_DAY	0	2	f	2010-09-13	4358	\N	27140	\N
37358	GENERIC_DAY	0	2	f	2010-09-14	4358	\N	27140	\N
37359	GENERIC_DAY	0	0	f	2010-09-18	4348	\N	27140	\N
37360	GENERIC_DAY	0	2	f	2010-09-22	4348	\N	27140	\N
37361	GENERIC_DAY	0	0	f	2010-09-18	4344	\N	27140	\N
37362	GENERIC_DAY	0	0	f	2010-09-25	4348	\N	27140	\N
37363	GENERIC_DAY	0	2	f	2010-09-20	4344	\N	27140	\N
37364	GENERIC_DAY	0	2	f	2010-09-29	4344	\N	27140	\N
37365	GENERIC_DAY	0	2	f	2010-09-10	4348	\N	27140	\N
37366	GENERIC_DAY	0	2	f	2010-09-21	4350	\N	27140	\N
37367	GENERIC_DAY	0	0	f	2010-09-25	4358	\N	27140	\N
37368	GENERIC_DAY	0	2	f	2010-09-24	4358	\N	27140	\N
37369	GENERIC_DAY	0	0	f	2010-09-12	4350	\N	27140	\N
37370	GENERIC_DAY	0	2	f	2010-09-17	4344	\N	27140	\N
37371	GENERIC_DAY	0	2	f	2010-10-04	4344	\N	27140	\N
37372	GENERIC_DAY	0	2	f	2010-09-23	4348	\N	27140	\N
37373	GENERIC_DAY	0	0	f	2010-10-02	4348	\N	27140	\N
37374	GENERIC_DAY	0	0	f	2010-09-18	4358	\N	27140	\N
37375	GENERIC_DAY	0	0	f	2010-09-11	4348	\N	27140	\N
37376	GENERIC_DAY	0	2	f	2010-09-29	4348	\N	27140	\N
37377	GENERIC_DAY	0	0	f	2010-09-11	4358	\N	27140	\N
37378	GENERIC_DAY	0	2	f	2010-09-27	4358	\N	27140	\N
37379	GENERIC_DAY	0	2	f	2010-09-21	4344	\N	27140	\N
37380	GENERIC_DAY	0	2	f	2010-09-23	4344	\N	27140	\N
37381	GENERIC_DAY	0	2	f	2010-09-08	4344	\N	27140	\N
37382	GENERIC_DAY	0	2	f	2010-09-20	4358	\N	27140	\N
37383	GENERIC_DAY	0	0	f	2010-09-19	4350	\N	27140	\N
37384	GENERIC_DAY	0	2	f	2010-09-16	4344	\N	27140	\N
37385	GENERIC_DAY	0	2	f	2010-09-28	4348	\N	27140	\N
37386	GENERIC_DAY	0	2	f	2010-10-01	4344	\N	27140	\N
37387	GENERIC_DAY	0	2	f	2010-09-27	4344	\N	27140	\N
37388	GENERIC_DAY	0	0	f	2010-10-02	4344	\N	27140	\N
37389	GENERIC_DAY	0	2	f	2010-09-22	4358	\N	27140	\N
37390	GENERIC_DAY	0	2	f	2010-09-09	4350	\N	27140	\N
37391	GENERIC_DAY	0	2	f	2010-09-08	4348	\N	27140	\N
37392	GENERIC_DAY	0	0	f	2010-10-03	4344	\N	27140	\N
37393	GENERIC_DAY	0	2	f	2010-09-09	4358	\N	27140	\N
37394	GENERIC_DAY	0	0	f	2010-10-02	4350	\N	27140	\N
37395	GENERIC_DAY	0	2	f	2010-09-10	4358	\N	27140	\N
37396	GENERIC_DAY	0	0	f	2010-09-26	4358	\N	27140	\N
37397	GENERIC_DAY	0	2	f	2010-09-22	4344	\N	27140	\N
37398	GENERIC_DAY	0	0	f	2010-09-12	4344	\N	27140	\N
44695	GENERIC_DAY	0	2	f	2010-06-25	4358	\N	42531	\N
44696	GENERIC_DAY	0	1	f	2010-06-21	21817	\N	42531	\N
44697	GENERIC_DAY	0	1	f	2010-06-17	4358	\N	42531	\N
44698	GENERIC_DAY	0	2	f	2010-06-22	4358	\N	42531	\N
44699	GENERIC_DAY	0	0	f	2010-07-01	4344	\N	42531	\N
44700	GENERIC_DAY	0	1	f	2010-06-15	21817	\N	42531	\N
44701	GENERIC_DAY	0	1	f	2010-06-18	4358	\N	42531	\N
44702	GENERIC_DAY	0	1	f	2010-06-18	21817	\N	42531	\N
44703	GENERIC_DAY	0	0	f	2010-06-22	4348	\N	42531	\N
44704	GENERIC_DAY	0	0	f	2010-06-26	4350	\N	42531	\N
44705	GENERIC_DAY	0	1	f	2010-06-30	4344	\N	42531	\N
44706	GENERIC_DAY	0	2	f	2010-06-23	4348	\N	42531	\N
44707	GENERIC_DAY	0	1	f	2010-06-22	4344	\N	42531	\N
44708	GENERIC_DAY	0	2	f	2010-06-24	4348	\N	42531	\N
44709	GENERIC_DAY	0	0	f	2010-06-28	21817	\N	42531	\N
44710	GENERIC_DAY	0	2	f	2010-06-23	4358	\N	42531	\N
44711	GENERIC_DAY	0	0	f	2010-06-20	4358	\N	42531	\N
44712	GENERIC_DAY	0	4	f	2010-06-22	21817	\N	42531	\N
37399	GENERIC_DAY	0	0	f	2010-09-18	4350	\N	27140	\N
37400	GENERIC_DAY	0	2	f	2010-09-10	4350	\N	27140	\N
37401	GENERIC_DAY	0	0	f	2010-10-03	4358	\N	27140	\N
37402	GENERIC_DAY	0	2	f	2010-09-24	4348	\N	27140	\N
37403	GENERIC_DAY	0	0	f	2010-09-11	4344	\N	27140	\N
37404	GENERIC_DAY	0	2	f	2010-09-15	4358	\N	27140	\N
37405	GENERIC_DAY	0	0	f	2010-09-25	4350	\N	27140	\N
37406	GENERIC_DAY	0	0	f	2010-09-19	4348	\N	27140	\N
37407	GENERIC_DAY	0	2	f	2010-09-20	4350	\N	27140	\N
37408	GENERIC_DAY	0	2	f	2010-09-21	4348	\N	27140	\N
37409	GENERIC_DAY	0	2	f	2010-10-01	4348	\N	27140	\N
37410	GENERIC_DAY	0	0	f	2010-09-26	4348	\N	27140	\N
37411	GENERIC_DAY	0	0	f	2010-10-03	4350	\N	27140	\N
37412	GENERIC_DAY	0	0	f	2010-09-26	4344	\N	27140	\N
37413	GENERIC_DAY	0	2	f	2010-09-23	4358	\N	27140	\N
37414	GENERIC_DAY	0	2	f	2010-09-13	4344	\N	27140	\N
37415	GENERIC_DAY	0	2	f	2010-10-01	4350	\N	27140	\N
37416	GENERIC_DAY	0	2	f	2010-09-15	4348	\N	27140	\N
37417	GENERIC_DAY	0	2	f	2010-09-14	4350	\N	27140	\N
37418	GENERIC_DAY	0	0	f	2010-09-11	4350	\N	27140	\N
37419	GENERIC_DAY	0	0	f	2010-10-03	4348	\N	27140	\N
37420	GENERIC_DAY	0	2	f	2010-09-09	4348	\N	27140	\N
37421	GENERIC_DAY	0	2	f	2010-09-28	4350	\N	27140	\N
37422	GENERIC_DAY	0	2	f	2010-09-21	4358	\N	27140	\N
37423	GENERIC_DAY	0	2	f	2010-10-01	4358	\N	27140	\N
37424	GENERIC_DAY	0	2	f	2010-10-04	4348	\N	27140	\N
37425	GENERIC_DAY	0	2	f	2010-09-28	4344	\N	27140	\N
37426	GENERIC_DAY	0	2	f	2010-09-23	4350	\N	27140	\N
37427	GENERIC_DAY	0	1	f	2010-10-04	4358	\N	27140	\N
37428	GENERIC_DAY	0	2	f	2010-09-14	4344	\N	27140	\N
37429	GENERIC_DAY	0	2	f	2010-09-29	4358	\N	27140	\N
37430	GENERIC_DAY	0	0	f	2010-09-12	4348	\N	27140	\N
37431	GENERIC_DAY	0	2	f	2010-09-30	4344	\N	27140	\N
37432	GENERIC_DAY	0	0	f	2010-10-02	4358	\N	27140	\N
37433	GENERIC_DAY	0	1	f	2010-10-04	4350	\N	27140	\N
37434	GENERIC_DAY	0	2	f	2010-09-16	4350	\N	27140	\N
37435	GENERIC_DAY	0	2	f	2010-09-29	4350	\N	27140	\N
37436	GENERIC_DAY	0	2	f	2010-09-30	4348	\N	27140	\N
37437	GENERIC_DAY	0	0	f	2010-09-12	4358	\N	27140	\N
37438	GENERIC_DAY	0	2	f	2010-09-08	4350	\N	27140	\N
37439	GENERIC_DAY	0	2	f	2010-09-16	4348	\N	27141	\N
37440	GENERIC_DAY	0	2	f	2010-09-14	4358	\N	27141	\N
37441	GENERIC_DAY	0	0	f	2010-09-12	4348	\N	27141	\N
37442	GENERIC_DAY	0	0	f	2010-09-19	4350	\N	27141	\N
37443	GENERIC_DAY	0	2	f	2010-09-20	4358	\N	27141	\N
37444	GENERIC_DAY	0	2	f	2010-09-21	4344	\N	27141	\N
37445	GENERIC_DAY	0	2	f	2010-09-14	4350	\N	27141	\N
37446	GENERIC_DAY	0	2	f	2010-09-16	4358	\N	27141	\N
37447	GENERIC_DAY	0	2	f	2010-09-23	4348	\N	27141	\N
37448	GENERIC_DAY	0	0	f	2010-09-11	4348	\N	27141	\N
37449	GENERIC_DAY	0	2	f	2010-09-10	4344	\N	27141	\N
37450	GENERIC_DAY	0	2	f	2010-09-14	4348	\N	27141	\N
37451	GENERIC_DAY	0	2	f	2010-09-08	4344	\N	27141	\N
37452	GENERIC_DAY	0	1	f	2010-09-24	4350	\N	27141	\N
37453	GENERIC_DAY	0	2	f	2010-09-24	4344	\N	27141	\N
37454	GENERIC_DAY	0	2	f	2010-09-09	4350	\N	27141	\N
37455	GENERIC_DAY	0	2	f	2010-09-16	4344	\N	27141	\N
37456	GENERIC_DAY	0	1	f	2010-09-24	4348	\N	27141	\N
37457	GENERIC_DAY	0	0	f	2010-09-18	4348	\N	27141	\N
37458	GENERIC_DAY	0	0	f	2010-09-12	4350	\N	27141	\N
37459	GENERIC_DAY	0	2	f	2010-09-09	4358	\N	27141	\N
37460	GENERIC_DAY	0	2	f	2010-09-17	4350	\N	27141	\N
37461	GENERIC_DAY	0	2	f	2010-09-09	4344	\N	27141	\N
37462	GENERIC_DAY	0	2	f	2010-09-20	4348	\N	27141	\N
37463	GENERIC_DAY	0	0	f	2010-09-11	4358	\N	27141	\N
37464	GENERIC_DAY	0	2	f	2010-09-08	4358	\N	27141	\N
37465	GENERIC_DAY	0	2	f	2010-09-14	4344	\N	27141	\N
37466	GENERIC_DAY	0	2	f	2010-09-21	4358	\N	27141	\N
37467	GENERIC_DAY	0	2	f	2010-09-13	4348	\N	27141	\N
37468	GENERIC_DAY	0	2	f	2010-09-16	4350	\N	27141	\N
37469	GENERIC_DAY	0	2	f	2010-09-17	4348	\N	27141	\N
37470	GENERIC_DAY	0	0	f	2010-09-18	4358	\N	27141	\N
37471	GENERIC_DAY	0	0	f	2010-09-12	4358	\N	27141	\N
37472	GENERIC_DAY	0	2	f	2010-09-15	4348	\N	27141	\N
37473	GENERIC_DAY	0	2	f	2010-09-17	4358	\N	27141	\N
37474	GENERIC_DAY	0	2	f	2010-09-23	4350	\N	27141	\N
37475	GENERIC_DAY	0	2	f	2010-09-22	4358	\N	27141	\N
37476	GENERIC_DAY	0	2	f	2010-09-22	4344	\N	27141	\N
37477	GENERIC_DAY	0	2	f	2010-09-20	4344	\N	27141	\N
37478	GENERIC_DAY	0	2	f	2010-09-23	4344	\N	27141	\N
37479	GENERIC_DAY	0	2	f	2010-09-15	4344	\N	27141	\N
37480	GENERIC_DAY	0	2	f	2010-09-09	4348	\N	27141	\N
37481	GENERIC_DAY	0	0	f	2010-09-12	4344	\N	27141	\N
37482	GENERIC_DAY	0	0	f	2010-09-19	4344	\N	27141	\N
37483	GENERIC_DAY	0	2	f	2010-09-15	4358	\N	27141	\N
17739	GENERIC_DAY	6	0	f	2010-08-28	4352	\N	9412	\N
17740	GENERIC_DAY	6	0	f	2010-08-14	4352	\N	9412	\N
17741	GENERIC_DAY	6	4	f	2010-07-29	4352	\N	9412	\N
17742	GENERIC_DAY	6	4	f	2010-07-29	4354	\N	9412	\N
17743	GENERIC_DAY	6	4	f	2010-08-11	4352	\N	9412	\N
17744	GENERIC_DAY	6	4	f	2010-08-17	4354	\N	9412	\N
17745	GENERIC_DAY	6	0	f	2010-08-01	4354	\N	9412	\N
17746	GENERIC_DAY	6	4	f	2010-08-30	4352	\N	9412	\N
17747	GENERIC_DAY	6	4	f	2010-08-18	4354	\N	9412	\N
17748	GENERIC_DAY	6	4	f	2010-08-04	4352	\N	9412	\N
17749	GENERIC_DAY	6	4	f	2010-08-11	4354	\N	9412	\N
17750	GENERIC_DAY	6	0	f	2010-08-22	4354	\N	9412	\N
17751	GENERIC_DAY	6	0	f	2010-08-08	4354	\N	9412	\N
17752	GENERIC_DAY	6	4	f	2010-08-20	4352	\N	9412	\N
17753	GENERIC_DAY	6	0	f	2010-08-08	4352	\N	9412	\N
17754	GENERIC_DAY	6	4	f	2010-08-27	4354	\N	9412	\N
17755	GENERIC_DAY	6	4	f	2010-08-27	4352	\N	9412	\N
17756	GENERIC_DAY	6	0	f	2010-08-15	4352	\N	9412	\N
17757	GENERIC_DAY	6	4	f	2010-07-30	4354	\N	9412	\N
17758	GENERIC_DAY	6	4	f	2010-08-05	4354	\N	9412	\N
17759	GENERIC_DAY	6	4	f	2010-08-23	4354	\N	9412	\N
17760	GENERIC_DAY	6	4	f	2010-07-28	4352	\N	9412	\N
17761	GENERIC_DAY	6	0	f	2010-08-21	4354	\N	9412	\N
17762	GENERIC_DAY	6	0	f	2010-08-01	4352	\N	9412	\N
17763	GENERIC_DAY	6	4	f	2010-08-03	4354	\N	9412	\N
17764	GENERIC_DAY	6	4	f	2010-08-06	4354	\N	9412	\N
17765	GENERIC_DAY	6	4	f	2010-08-26	4352	\N	9412	\N
17766	GENERIC_DAY	6	4	f	2010-07-28	4354	\N	9412	\N
17767	GENERIC_DAY	6	4	f	2010-08-30	4354	\N	9412	\N
17768	GENERIC_DAY	6	4	f	2010-08-03	4352	\N	9412	\N
17769	GENERIC_DAY	6	4	f	2010-08-06	4352	\N	9412	\N
17770	GENERIC_DAY	6	0	f	2010-08-07	4354	\N	9412	\N
17771	GENERIC_DAY	6	0	f	2010-08-28	4354	\N	9412	\N
17772	GENERIC_DAY	6	4	f	2010-08-17	4352	\N	9412	\N
17773	GENERIC_DAY	6	0	f	2010-08-07	4352	\N	9412	\N
17774	GENERIC_DAY	6	4	f	2010-08-26	4354	\N	9412	\N
17775	GENERIC_DAY	6	4	f	2010-08-13	4354	\N	9412	\N
17776	GENERIC_DAY	6	4	f	2010-08-05	4352	\N	9412	\N
37484	GENERIC_DAY	0	2	f	2010-09-13	4344	\N	27141	\N
37485	GENERIC_DAY	0	2	f	2010-09-13	4358	\N	27141	\N
37486	GENERIC_DAY	0	0	f	2010-09-19	4358	\N	27141	\N
37487	GENERIC_DAY	0	0	f	2010-09-11	4344	\N	27141	\N
37488	GENERIC_DAY	0	2	f	2010-09-21	4348	\N	27141	\N
37489	GENERIC_DAY	0	2	f	2010-09-22	4350	\N	27141	\N
37490	GENERIC_DAY	0	2	f	2010-09-13	4350	\N	27141	\N
37491	GENERIC_DAY	0	2	f	2010-09-17	4344	\N	27141	\N
37492	GENERIC_DAY	0	2	f	2010-09-23	4358	\N	27141	\N
37493	GENERIC_DAY	0	0	f	2010-09-11	4350	\N	27141	\N
37494	GENERIC_DAY	0	2	f	2010-09-20	4350	\N	27141	\N
37495	GENERIC_DAY	0	2	f	2010-09-08	4348	\N	27141	\N
37496	GENERIC_DAY	0	2	f	2010-09-08	4350	\N	27141	\N
37497	GENERIC_DAY	0	0	f	2010-09-19	4348	\N	27141	\N
37498	GENERIC_DAY	0	2	f	2010-09-21	4350	\N	27141	\N
37499	GENERIC_DAY	0	0	f	2010-09-18	4344	\N	27141	\N
37500	GENERIC_DAY	0	0	f	2010-09-18	4350	\N	27141	\N
37501	GENERIC_DAY	0	1	f	2010-09-24	4358	\N	27141	\N
37502	GENERIC_DAY	0	2	f	2010-09-22	4348	\N	27141	\N
37503	GENERIC_DAY	0	2	f	2010-09-10	4358	\N	27141	\N
37504	GENERIC_DAY	0	2	f	2010-09-10	4350	\N	27141	\N
37505	GENERIC_DAY	0	2	f	2010-09-10	4348	\N	27141	\N
37506	GENERIC_DAY	0	2	f	2010-09-15	4350	\N	27141	\N
37507	GENERIC_DAY	0	4	f	2010-11-03	4352	\N	27142	\N
37508	GENERIC_DAY	0	4	f	2010-10-08	4354	\N	27142	\N
37509	GENERIC_DAY	0	4	f	2010-10-21	4354	\N	27142	\N
37510	GENERIC_DAY	0	4	f	2010-10-18	4354	\N	27142	\N
37511	GENERIC_DAY	0	4	f	2010-11-05	4354	\N	27142	\N
37512	GENERIC_DAY	0	4	f	2010-10-07	4352	\N	27142	\N
37513	GENERIC_DAY	0	0	f	2010-10-30	4354	\N	27142	\N
37514	GENERIC_DAY	0	4	f	2010-11-03	4354	\N	27142	\N
37515	GENERIC_DAY	0	4	f	2010-10-14	4354	\N	27142	\N
37516	GENERIC_DAY	0	0	f	2010-10-10	4352	\N	27142	\N
37517	GENERIC_DAY	0	4	f	2010-11-01	4354	\N	27142	\N
37518	GENERIC_DAY	0	4	f	2010-10-08	4352	\N	27142	\N
37519	GENERIC_DAY	0	4	f	2010-10-19	4354	\N	27142	\N
37520	GENERIC_DAY	0	4	f	2010-10-11	4354	\N	27142	\N
37521	GENERIC_DAY	0	0	f	2010-10-17	4354	\N	27142	\N
37522	GENERIC_DAY	0	0	f	2010-10-09	4354	\N	27142	\N
37523	GENERIC_DAY	0	4	f	2010-10-26	4354	\N	27142	\N
37524	GENERIC_DAY	0	4	f	2010-10-06	4354	\N	27142	\N
37525	GENERIC_DAY	0	4	f	2010-10-11	4352	\N	27142	\N
37526	GENERIC_DAY	0	4	f	2010-10-05	4352	\N	27142	\N
37527	GENERIC_DAY	0	4	f	2010-11-02	4352	\N	27142	\N
37528	GENERIC_DAY	0	4	f	2010-10-12	4352	\N	27142	\N
37529	GENERIC_DAY	0	4	f	2010-11-08	4352	\N	27142	\N
37530	GENERIC_DAY	0	0	f	2010-10-31	4352	\N	27142	\N
37531	GENERIC_DAY	0	4	f	2010-10-19	4352	\N	27142	\N
37532	GENERIC_DAY	0	4	f	2010-10-07	4354	\N	27142	\N
37533	GENERIC_DAY	0	4	f	2010-10-29	4354	\N	27142	\N
37534	GENERIC_DAY	0	4	f	2010-10-26	4352	\N	27142	\N
37535	GENERIC_DAY	0	0	f	2010-11-07	4354	\N	27142	\N
37536	GENERIC_DAY	0	0	f	2010-10-09	4352	\N	27142	\N
37537	GENERIC_DAY	0	4	f	2010-11-01	4352	\N	27142	\N
37538	GENERIC_DAY	0	4	f	2010-10-13	4354	\N	27142	\N
37539	GENERIC_DAY	0	4	f	2010-10-25	4354	\N	27142	\N
37540	GENERIC_DAY	0	4	f	2010-10-28	4352	\N	27142	\N
37541	GENERIC_DAY	0	0	f	2010-11-07	4352	\N	27142	\N
37542	GENERIC_DAY	0	4	f	2010-10-27	4352	\N	27142	\N
37543	GENERIC_DAY	0	4	f	2010-10-13	4352	\N	27142	\N
37544	GENERIC_DAY	0	0	f	2010-10-23	4352	\N	27142	\N
37545	GENERIC_DAY	0	4	f	2010-10-21	4352	\N	27142	\N
37546	GENERIC_DAY	0	4	f	2010-10-14	4352	\N	27142	\N
37547	GENERIC_DAY	0	0	f	2010-10-23	4354	\N	27142	\N
37548	GENERIC_DAY	0	0	f	2010-11-06	4354	\N	27142	\N
37549	GENERIC_DAY	0	4	f	2010-10-28	4354	\N	27142	\N
37550	GENERIC_DAY	0	0	f	2010-10-17	4352	\N	27142	\N
37551	GENERIC_DAY	0	0	f	2010-11-06	4352	\N	27142	\N
37552	GENERIC_DAY	0	4	f	2010-10-25	4352	\N	27142	\N
37553	GENERIC_DAY	0	4	f	2010-10-20	4354	\N	27142	\N
37554	GENERIC_DAY	0	4	f	2010-10-15	4354	\N	27142	\N
37555	GENERIC_DAY	0	0	f	2010-10-16	4354	\N	27142	\N
37556	GENERIC_DAY	0	4	f	2010-10-20	4352	\N	27142	\N
37557	GENERIC_DAY	0	4	f	2010-10-29	4352	\N	27142	\N
37558	GENERIC_DAY	0	4	f	2010-10-22	4352	\N	27142	\N
37559	GENERIC_DAY	0	0	f	2010-10-24	4354	\N	27142	\N
37560	GENERIC_DAY	0	4	f	2010-11-02	4354	\N	27142	\N
37561	GENERIC_DAY	0	4	f	2010-11-04	4352	\N	27142	\N
37562	GENERIC_DAY	0	4	f	2010-11-04	4354	\N	27142	\N
37563	GENERIC_DAY	0	0	f	2010-10-24	4352	\N	27142	\N
37564	GENERIC_DAY	0	4	f	2010-10-05	4354	\N	27142	\N
37565	GENERIC_DAY	0	4	f	2010-11-05	4352	\N	27142	\N
37566	GENERIC_DAY	0	4	f	2010-11-08	4354	\N	27142	\N
37567	GENERIC_DAY	0	4	f	2010-10-15	4352	\N	27142	\N
8848	GENERIC_DAY	11	2	f	2010-06-16	4358	\N	5964	\N
8825	GENERIC_DAY	11	2	f	2010-06-23	4350	\N	5964	\N
8837	GENERIC_DAY	11	2	f	2010-06-28	4358	\N	5964	\N
8815	GENERIC_DAY	11	2	f	2010-06-29	4348	\N	5964	\N
8808	GENERIC_DAY	11	2	f	2010-06-22	4344	\N	5964	\N
8793	GENERIC_DAY	11	2	f	2010-06-22	4358	\N	5964	\N
8794	GENERIC_DAY	11	2	f	2010-06-15	4350	\N	5964	\N
8813	GENERIC_DAY	11	2	f	2010-06-29	4344	\N	5964	\N
8792	GENERIC_DAY	11	2	f	2010-06-24	4358	\N	5964	\N
8868	GENERIC_DAY	11	2	f	2010-06-18	4348	\N	5964	\N
8797	GENERIC_DAY	11	2	f	2010-06-23	4348	\N	5964	\N
8818	GENERIC_DAY	11	1	f	2010-07-08	4358	\N	5964	\N
8189	SPECIFIC_DAY	13	8	f	2010-07-01	1216	8080	\N	\N
8187	SPECIFIC_DAY	13	8	f	2010-07-07	1216	8080	\N	\N
8197	SPECIFIC_DAY	13	8	f	2010-07-14	1216	8080	\N	\N
8194	SPECIFIC_DAY	13	8	f	2010-07-12	1216	8080	\N	\N
37568	GENERIC_DAY	0	4	f	2010-10-22	4354	\N	27142	\N
37569	GENERIC_DAY	0	4	f	2010-10-12	4354	\N	27142	\N
37570	GENERIC_DAY	0	4	f	2010-10-06	4352	\N	27142	\N
37571	GENERIC_DAY	0	4	f	2010-10-27	4354	\N	27142	\N
37572	GENERIC_DAY	0	0	f	2010-10-30	4352	\N	27142	\N
37573	GENERIC_DAY	0	0	f	2010-10-31	4354	\N	27142	\N
37574	GENERIC_DAY	0	4	f	2010-10-18	4352	\N	27142	\N
37575	GENERIC_DAY	0	0	f	2010-10-16	4352	\N	27142	\N
37576	GENERIC_DAY	0	0	f	2010-10-10	4354	\N	27142	\N
37577	GENERIC_DAY	0	0	f	2010-10-30	4352	\N	27143	\N
37578	GENERIC_DAY	0	0	f	2010-10-24	4352	\N	27143	\N
37579	GENERIC_DAY	0	2	f	2010-11-02	4352	\N	27143	\N
37580	GENERIC_DAY	0	4	f	2010-10-22	4354	\N	27143	\N
37581	GENERIC_DAY	0	0	f	2010-10-31	4352	\N	27143	\N
37582	GENERIC_DAY	0	4	f	2010-10-29	4352	\N	27143	\N
37583	GENERIC_DAY	0	4	f	2010-10-26	4354	\N	27143	\N
37584	GENERIC_DAY	0	4	f	2010-10-28	4354	\N	27143	\N
37585	GENERIC_DAY	0	4	f	2010-10-22	4352	\N	27143	\N
37957	SPECIFIC_DAY	3	8	f	2010-09-29	1216	31223	\N	\N
37960	SPECIFIC_DAY	3	8	f	2010-10-12	1216	31223	\N	\N
37956	SPECIFIC_DAY	3	8	f	2010-10-13	1216	31223	\N	\N
37961	SPECIFIC_DAY	3	8	f	2010-10-07	1216	31223	\N	\N
37958	SPECIFIC_DAY	3	8	f	2010-09-30	1216	31223	\N	\N
37959	SPECIFIC_DAY	3	4	f	2010-09-27	1216	31223	\N	\N
37586	GENERIC_DAY	0	0	f	2010-10-24	4354	\N	27143	\N
37587	GENERIC_DAY	0	4	f	2010-10-28	4352	\N	27143	\N
37588	GENERIC_DAY	0	0	f	2010-10-17	4354	\N	27143	\N
37589	GENERIC_DAY	0	4	f	2010-10-25	4354	\N	27143	\N
37590	GENERIC_DAY	0	0	f	2010-10-17	4352	\N	27143	\N
37591	GENERIC_DAY	0	4	f	2010-10-26	4352	\N	27143	\N
37592	GENERIC_DAY	0	4	f	2010-11-01	4354	\N	27143	\N
37593	GENERIC_DAY	0	4	f	2010-10-21	4354	\N	27143	\N
37594	GENERIC_DAY	0	4	f	2010-10-19	4354	\N	27143	\N
37595	GENERIC_DAY	0	4	f	2010-10-29	4354	\N	27143	\N
37596	GENERIC_DAY	0	0	f	2010-10-23	4352	\N	27143	\N
37597	GENERIC_DAY	0	4	f	2010-10-19	4352	\N	27143	\N
37598	GENERIC_DAY	0	0	f	2010-10-16	4352	\N	27143	\N
37599	GENERIC_DAY	0	4	f	2010-10-18	4352	\N	27143	\N
37600	GENERIC_DAY	0	0	f	2010-10-23	4354	\N	27143	\N
37601	GENERIC_DAY	0	4	f	2010-10-21	4352	\N	27143	\N
37602	GENERIC_DAY	0	0	f	2010-10-16	4354	\N	27143	\N
37603	GENERIC_DAY	0	4	f	2010-10-20	4352	\N	27143	\N
37604	GENERIC_DAY	0	4	f	2010-10-18	4354	\N	27143	\N
37605	GENERIC_DAY	0	2	f	2010-11-02	4354	\N	27143	\N
37606	GENERIC_DAY	0	0	f	2010-10-30	4354	\N	27143	\N
37607	GENERIC_DAY	0	4	f	2010-10-15	4354	\N	27143	\N
37608	GENERIC_DAY	0	4	f	2010-10-15	4352	\N	27143	\N
37609	GENERIC_DAY	0	4	f	2010-10-27	4354	\N	27143	\N
37610	GENERIC_DAY	0	0	f	2010-10-31	4354	\N	27143	\N
37611	GENERIC_DAY	0	4	f	2010-10-27	4352	\N	27143	\N
37612	GENERIC_DAY	0	4	f	2010-10-25	4352	\N	27143	\N
37613	GENERIC_DAY	0	4	f	2010-10-20	4354	\N	27143	\N
37614	GENERIC_DAY	0	4	f	2010-11-01	4352	\N	27143	\N
37615	GENERIC_DAY	0	4	f	2010-10-26	4354	\N	27144	\N
37616	GENERIC_DAY	0	0	f	2010-10-03	4354	\N	27144	\N
37617	GENERIC_DAY	0	4	f	2010-10-18	4354	\N	27144	\N
37618	GENERIC_DAY	0	4	f	2010-10-25	4352	\N	27144	\N
37619	GENERIC_DAY	0	4	f	2010-10-19	4354	\N	27144	\N
37620	GENERIC_DAY	0	4	f	2010-09-28	4352	\N	27144	\N
37621	GENERIC_DAY	0	0	f	2010-09-25	4354	\N	27144	\N
37622	GENERIC_DAY	0	4	f	2010-10-20	4354	\N	27144	\N
37623	GENERIC_DAY	0	0	f	2010-10-02	4354	\N	27144	\N
37624	GENERIC_DAY	0	0	f	2010-10-16	4352	\N	27144	\N
37625	GENERIC_DAY	0	4	f	2010-10-27	4352	\N	27144	\N
37626	GENERIC_DAY	0	0	f	2010-10-23	4352	\N	27144	\N
37627	GENERIC_DAY	0	0	f	2010-10-16	4354	\N	27144	\N
37628	GENERIC_DAY	0	4	f	2010-10-06	4354	\N	27144	\N
37629	GENERIC_DAY	0	4	f	2010-10-21	4354	\N	27144	\N
37630	GENERIC_DAY	0	0	f	2010-10-03	4352	\N	27144	\N
37631	GENERIC_DAY	0	0	f	2010-10-24	4352	\N	27144	\N
37632	GENERIC_DAY	0	4	f	2010-10-05	4352	\N	27144	\N
37633	GENERIC_DAY	0	4	f	2010-09-30	4354	\N	27144	\N
37634	GENERIC_DAY	0	4	f	2010-09-30	4352	\N	27144	\N
37635	GENERIC_DAY	0	4	f	2010-10-15	4352	\N	27144	\N
37636	GENERIC_DAY	0	0	f	2010-10-10	4354	\N	27144	\N
37637	GENERIC_DAY	0	0	f	2010-10-23	4354	\N	27144	\N
37638	GENERIC_DAY	0	4	f	2010-10-13	4352	\N	27144	\N
37639	GENERIC_DAY	0	0	f	2010-10-10	4352	\N	27144	\N
37640	GENERIC_DAY	0	4	f	2010-10-15	4354	\N	27144	\N
37641	GENERIC_DAY	0	4	f	2010-10-11	4354	\N	27144	\N
21533	GENERIC_DAY	3	0	f	2010-07-14	4344	\N	16773	\N
21534	GENERIC_DAY	3	2	f	2010-07-26	4350	\N	16773	\N
21535	GENERIC_DAY	3	2	f	2010-07-27	4344	\N	16773	\N
21536	GENERIC_DAY	3	2	f	2010-07-20	4358	\N	16773	\N
21537	GENERIC_DAY	3	0	f	2010-07-03	4344	\N	16773	\N
21538	GENERIC_DAY	3	0	f	2010-07-05	4344	\N	16773	\N
21539	GENERIC_DAY	3	0	f	2010-07-17	4350	\N	16773	\N
21540	GENERIC_DAY	3	2	f	2010-07-22	4350	\N	16773	\N
21541	GENERIC_DAY	3	3	f	2010-07-14	4348	\N	16773	\N
21542	GENERIC_DAY	3	0	f	2010-07-08	4344	\N	16773	\N
21543	GENERIC_DAY	3	4	f	2010-07-02	4358	\N	16773	\N
21544	GENERIC_DAY	3	4	f	2010-07-08	4348	\N	16773	\N
21545	GENERIC_DAY	3	4	f	2010-07-05	4358	\N	16773	\N
21546	GENERIC_DAY	3	0	f	2010-07-15	4344	\N	16773	\N
21547	GENERIC_DAY	3	0	f	2010-07-03	4358	\N	16773	\N
21548	GENERIC_DAY	3	2	f	2010-07-23	4348	\N	16773	\N
21549	GENERIC_DAY	3	0	f	2010-07-25	4358	\N	16773	\N
21550	GENERIC_DAY	3	0	f	2010-07-24	4344	\N	16773	\N
21551	GENERIC_DAY	3	0	f	2010-07-10	4358	\N	16773	\N
21552	GENERIC_DAY	3	2	f	2010-07-27	4358	\N	16773	\N
21553	GENERIC_DAY	3	3	f	2010-07-13	4348	\N	16773	\N
21554	GENERIC_DAY	3	0	f	2010-07-18	4358	\N	16773	\N
21555	GENERIC_DAY	3	2	f	2010-07-21	4348	\N	16773	\N
21556	GENERIC_DAY	3	0	f	2010-07-09	4344	\N	16773	\N
21557	GENERIC_DAY	3	2	f	2010-07-13	4358	\N	16773	\N
21558	GENERIC_DAY	3	4	f	2010-07-06	4348	\N	16773	\N
21559	GENERIC_DAY	3	0	f	2010-07-06	4350	\N	16773	\N
21560	GENERIC_DAY	3	0	f	2010-07-04	4358	\N	16773	\N
21561	GENERIC_DAY	3	3	f	2010-07-09	4348	\N	16773	\N
21562	GENERIC_DAY	3	0	f	2010-07-11	4350	\N	16773	\N
21563	GENERIC_DAY	3	0	f	2010-07-02	4350	\N	16773	\N
21564	GENERIC_DAY	3	0	f	2010-07-24	4350	\N	16773	\N
21565	GENERIC_DAY	3	0	f	2010-07-18	4348	\N	16773	\N
37642	GENERIC_DAY	0	4	f	2010-10-11	4352	\N	27144	\N
37643	GENERIC_DAY	0	4	f	2010-09-27	4352	\N	27144	\N
37644	GENERIC_DAY	0	0	f	2010-09-26	4354	\N	27144	\N
37645	GENERIC_DAY	0	0	f	2010-10-24	4354	\N	27144	\N
37646	GENERIC_DAY	0	4	f	2010-10-18	4352	\N	27144	\N
37647	GENERIC_DAY	0	4	f	2010-10-22	4354	\N	27144	\N
37648	GENERIC_DAY	0	4	f	2010-10-19	4352	\N	27144	\N
37649	GENERIC_DAY	0	4	f	2010-10-05	4354	\N	27144	\N
37650	GENERIC_DAY	0	4	f	2010-10-25	4354	\N	27144	\N
37651	GENERIC_DAY	0	4	f	2010-10-04	4354	\N	27144	\N
37652	GENERIC_DAY	0	4	f	2010-10-12	4352	\N	27144	\N
37653	GENERIC_DAY	0	4	f	2010-10-27	4354	\N	27144	\N
37654	GENERIC_DAY	0	4	f	2010-09-28	4354	\N	27144	\N
37655	GENERIC_DAY	0	4	f	2010-10-29	4352	\N	27144	\N
37656	GENERIC_DAY	0	4	f	2010-10-08	4354	\N	27144	\N
37657	GENERIC_DAY	0	0	f	2010-10-09	4352	\N	27144	\N
37658	GENERIC_DAY	0	4	f	2010-10-28	4354	\N	27144	\N
37659	GENERIC_DAY	0	4	f	2010-10-29	4354	\N	27144	\N
37660	GENERIC_DAY	0	4	f	2010-10-22	4352	\N	27144	\N
37661	GENERIC_DAY	0	0	f	2010-09-26	4352	\N	27144	\N
37662	GENERIC_DAY	0	4	f	2010-10-26	4352	\N	27144	\N
37663	GENERIC_DAY	0	4	f	2010-09-29	4354	\N	27144	\N
37664	GENERIC_DAY	0	4	f	2010-10-06	4352	\N	27144	\N
37665	GENERIC_DAY	0	4	f	2010-10-28	4352	\N	27144	\N
37666	GENERIC_DAY	0	0	f	2010-09-25	4352	\N	27144	\N
37667	GENERIC_DAY	0	4	f	2010-10-12	4354	\N	27144	\N
37668	GENERIC_DAY	0	4	f	2010-10-07	4352	\N	27144	\N
37669	GENERIC_DAY	0	4	f	2010-10-21	4352	\N	27144	\N
37670	GENERIC_DAY	0	4	f	2010-09-29	4352	\N	27144	\N
37671	GENERIC_DAY	0	4	f	2010-10-07	4354	\N	27144	\N
37672	GENERIC_DAY	0	4	f	2010-10-14	4352	\N	27144	\N
37673	GENERIC_DAY	0	0	f	2010-10-17	4352	\N	27144	\N
37674	GENERIC_DAY	0	4	f	2010-10-04	4352	\N	27144	\N
37675	GENERIC_DAY	0	0	f	2010-10-17	4354	\N	27144	\N
37676	GENERIC_DAY	0	4	f	2010-10-01	4352	\N	27144	\N
37677	GENERIC_DAY	0	4	f	2010-10-14	4354	\N	27144	\N
37678	GENERIC_DAY	0	4	f	2010-09-27	4354	\N	27144	\N
37679	GENERIC_DAY	0	4	f	2010-10-01	4354	\N	27144	\N
37680	GENERIC_DAY	0	0	f	2010-10-02	4352	\N	27144	\N
37681	GENERIC_DAY	0	4	f	2010-10-13	4354	\N	27144	\N
37682	GENERIC_DAY	0	0	f	2010-10-09	4354	\N	27144	\N
37683	GENERIC_DAY	0	4	f	2010-10-08	4352	\N	27144	\N
37684	GENERIC_DAY	0	4	f	2010-10-20	4352	\N	27144	\N
37685	GENERIC_DAY	0	4	f	2010-09-10	4352	\N	27145	\N
37686	GENERIC_DAY	0	4	f	2010-09-13	4354	\N	27145	\N
37687	GENERIC_DAY	0	4	f	2010-09-30	4352	\N	27145	\N
37688	GENERIC_DAY	0	4	f	2010-10-06	4352	\N	27145	\N
37689	GENERIC_DAY	0	0	f	2010-10-02	4354	\N	27145	\N
37690	GENERIC_DAY	0	4	f	2010-10-12	4352	\N	27145	\N
37691	GENERIC_DAY	0	4	f	2010-10-11	4354	\N	27145	\N
37692	GENERIC_DAY	0	4	f	2010-09-23	4354	\N	27145	\N
37693	GENERIC_DAY	0	4	f	2010-09-29	4354	\N	27145	\N
37694	GENERIC_DAY	0	4	f	2010-09-10	4354	\N	27145	\N
37695	GENERIC_DAY	0	0	f	2010-10-10	4352	\N	27145	\N
37696	GENERIC_DAY	0	0	f	2010-09-11	4352	\N	27145	\N
37697	GENERIC_DAY	0	0	f	2010-10-09	4354	\N	27145	\N
37698	GENERIC_DAY	0	4	f	2010-09-24	4354	\N	27145	\N
37699	GENERIC_DAY	0	4	f	2010-10-04	4352	\N	27145	\N
37700	GENERIC_DAY	0	4	f	2010-09-28	4354	\N	27145	\N
37701	GENERIC_DAY	0	4	f	2010-10-07	4352	\N	27145	\N
37702	GENERIC_DAY	0	0	f	2010-10-03	4354	\N	27145	\N
37703	GENERIC_DAY	0	4	f	2010-09-20	4354	\N	27145	\N
37704	GENERIC_DAY	0	4	f	2010-10-12	4354	\N	27145	\N
37705	GENERIC_DAY	0	4	f	2010-10-06	4354	\N	27145	\N
37706	GENERIC_DAY	0	4	f	2010-10-01	4354	\N	27145	\N
37707	GENERIC_DAY	0	4	f	2010-09-17	4354	\N	27145	\N
37708	GENERIC_DAY	0	4	f	2010-09-08	4352	\N	27145	\N
37709	GENERIC_DAY	0	4	f	2010-09-15	4352	\N	27145	\N
37710	GENERIC_DAY	0	4	f	2010-10-01	4352	\N	27145	\N
37711	GENERIC_DAY	0	0	f	2010-09-12	4354	\N	27145	\N
37712	GENERIC_DAY	0	0	f	2010-09-18	4352	\N	27145	\N
37713	GENERIC_DAY	0	0	f	2010-10-09	4352	\N	27145	\N
37714	GENERIC_DAY	0	4	f	2010-09-14	4354	\N	27145	\N
37715	GENERIC_DAY	0	4	f	2010-09-09	4352	\N	27145	\N
37716	GENERIC_DAY	0	0	f	2010-10-03	4352	\N	27145	\N
37717	GENERIC_DAY	0	0	f	2010-09-12	4352	\N	27145	\N
37718	GENERIC_DAY	0	4	f	2010-09-21	4352	\N	27145	\N
37719	GENERIC_DAY	0	4	f	2010-09-23	4352	\N	27145	\N
37720	GENERIC_DAY	0	4	f	2010-09-17	4352	\N	27145	\N
37721	GENERIC_DAY	0	4	f	2010-09-16	4354	\N	27145	\N
37722	GENERIC_DAY	0	4	f	2010-09-15	4354	\N	27145	\N
37723	GENERIC_DAY	0	4	f	2010-09-22	4354	\N	27145	\N
37724	GENERIC_DAY	0	4	f	2010-10-11	4352	\N	27145	\N
37725	GENERIC_DAY	0	4	f	2010-09-08	4354	\N	27145	\N
37726	GENERIC_DAY	0	4	f	2010-10-05	4354	\N	27145	\N
37727	GENERIC_DAY	0	4	f	2010-09-24	4352	\N	27145	\N
37728	GENERIC_DAY	0	4	f	2010-09-20	4352	\N	27145	\N
37729	GENERIC_DAY	0	0	f	2010-10-02	4352	\N	27145	\N
37730	GENERIC_DAY	0	4	f	2010-09-27	4352	\N	27145	\N
37731	GENERIC_DAY	0	0	f	2010-09-19	4354	\N	27145	\N
37732	GENERIC_DAY	0	0	f	2010-09-25	4352	\N	27145	\N
37733	GENERIC_DAY	0	4	f	2010-09-14	4352	\N	27145	\N
37734	GENERIC_DAY	0	4	f	2010-09-21	4354	\N	27145	\N
37735	GENERIC_DAY	0	0	f	2010-09-19	4352	\N	27145	\N
37736	GENERIC_DAY	0	0	f	2010-09-18	4354	\N	27145	\N
21580	GENERIC_DAY	3	2	f	2010-08-16	4348	\N	16774	\N
37737	GENERIC_DAY	0	4	f	2010-10-08	4352	\N	27145	\N
37738	GENERIC_DAY	0	4	f	2010-09-09	4354	\N	27145	\N
37739	GENERIC_DAY	0	4	f	2010-10-07	4354	\N	27145	\N
37740	GENERIC_DAY	0	4	f	2010-10-05	4352	\N	27145	\N
37741	GENERIC_DAY	0	4	f	2010-09-27	4354	\N	27145	\N
37742	GENERIC_DAY	0	4	f	2010-09-29	4352	\N	27145	\N
37743	GENERIC_DAY	0	4	f	2010-10-08	4354	\N	27145	\N
37744	GENERIC_DAY	0	4	f	2010-09-28	4352	\N	27145	\N
37745	GENERIC_DAY	0	4	f	2010-09-16	4352	\N	27145	\N
37746	GENERIC_DAY	0	0	f	2010-09-25	4354	\N	27145	\N
37747	GENERIC_DAY	0	0	f	2010-09-26	4352	\N	27145	\N
37748	GENERIC_DAY	0	4	f	2010-09-30	4354	\N	27145	\N
37749	GENERIC_DAY	0	4	f	2010-09-22	4352	\N	27145	\N
37750	GENERIC_DAY	0	0	f	2010-10-10	4354	\N	27145	\N
37751	GENERIC_DAY	0	0	f	2010-09-11	4354	\N	27145	\N
37752	GENERIC_DAY	0	4	f	2010-10-04	4354	\N	27145	\N
37753	GENERIC_DAY	0	4	f	2010-09-13	4352	\N	27145	\N
37754	GENERIC_DAY	0	0	f	2010-09-26	4354	\N	27145	\N
37755	GENERIC_DAY	0	0	f	2011-01-16	4354	\N	27146	\N
37756	GENERIC_DAY	0	4	f	2010-11-30	4352	\N	27146	\N
37757	GENERIC_DAY	0	0	f	2010-11-20	4354	\N	27146	\N
37758	GENERIC_DAY	0	4	f	2010-12-28	4352	\N	27146	\N
37759	GENERIC_DAY	0	4	f	2011-01-14	4352	\N	27146	\N
37760	GENERIC_DAY	0	4	f	2010-11-29	4354	\N	27146	\N
37761	GENERIC_DAY	0	4	f	2011-01-04	4354	\N	27146	\N
37762	GENERIC_DAY	0	4	f	2010-11-22	4352	\N	27146	\N
37763	GENERIC_DAY	0	4	f	2010-11-17	4352	\N	27146	\N
37764	GENERIC_DAY	0	4	f	2010-12-15	4352	\N	27146	\N
37765	GENERIC_DAY	0	4	f	2010-11-10	4354	\N	27146	\N
37766	GENERIC_DAY	0	4	f	2010-12-16	4352	\N	27146	\N
37767	GENERIC_DAY	0	0	f	2010-11-13	4352	\N	27146	\N
37768	GENERIC_DAY	0	4	f	2011-01-07	4352	\N	27146	\N
37769	GENERIC_DAY	0	4	f	2010-12-16	4354	\N	27146	\N
37770	GENERIC_DAY	0	4	f	2010-11-26	4352	\N	27146	\N
37771	GENERIC_DAY	0	4	f	2011-01-03	4352	\N	27146	\N
37772	GENERIC_DAY	0	4	f	2010-12-06	4352	\N	27146	\N
37773	GENERIC_DAY	0	4	f	2011-01-13	4354	\N	27146	\N
37774	GENERIC_DAY	0	4	f	2011-01-17	4354	\N	27146	\N
37775	GENERIC_DAY	0	0	f	2011-01-09	4352	\N	27146	\N
37776	GENERIC_DAY	0	4	f	2010-12-14	4354	\N	27146	\N
37777	GENERIC_DAY	0	4	f	2010-12-22	4354	\N	27146	\N
37778	GENERIC_DAY	0	4	f	2011-01-14	4354	\N	27146	\N
37779	GENERIC_DAY	0	0	f	2011-01-02	4354	\N	27146	\N
37780	GENERIC_DAY	0	4	f	2010-12-01	4354	\N	27146	\N
37781	GENERIC_DAY	0	4	f	2010-11-25	4352	\N	27146	\N
37782	GENERIC_DAY	0	4	f	2011-01-06	4354	\N	27146	\N
37783	GENERIC_DAY	0	0	f	2010-11-20	4352	\N	27146	\N
37784	GENERIC_DAY	0	4	f	2010-12-22	4352	\N	27146	\N
37785	GENERIC_DAY	0	4	f	2010-12-30	4354	\N	27146	\N
37786	GENERIC_DAY	0	4	f	2011-01-12	4354	\N	27146	\N
37787	GENERIC_DAY	0	4	f	2010-12-23	4354	\N	27146	\N
37788	GENERIC_DAY	0	0	f	2010-12-05	4352	\N	27146	\N
37789	GENERIC_DAY	0	0	f	2010-12-11	4354	\N	27146	\N
37790	GENERIC_DAY	0	4	f	2010-12-30	4352	\N	27146	\N
37791	GENERIC_DAY	0	4	f	2010-12-21	4352	\N	27146	\N
37792	GENERIC_DAY	0	4	f	2011-01-12	4352	\N	27146	\N
37793	GENERIC_DAY	0	4	f	2010-11-10	4352	\N	27146	\N
37794	GENERIC_DAY	0	4	f	2010-12-24	4352	\N	27146	\N
37795	GENERIC_DAY	0	0	f	2010-11-21	4354	\N	27146	\N
37796	GENERIC_DAY	0	4	f	2010-11-15	4352	\N	27146	\N
37797	GENERIC_DAY	0	4	f	2010-11-29	4352	\N	27146	\N
37798	GENERIC_DAY	0	4	f	2010-12-27	4352	\N	27146	\N
37799	GENERIC_DAY	0	0	f	2011-01-01	4354	\N	27146	\N
37800	GENERIC_DAY	0	0	f	2010-12-11	4352	\N	27146	\N
37801	GENERIC_DAY	0	4	f	2010-11-18	4352	\N	27146	\N
37802	GENERIC_DAY	0	0	f	2011-01-01	4352	\N	27146	\N
37803	GENERIC_DAY	0	0	f	2010-12-12	4354	\N	27146	\N
37804	GENERIC_DAY	0	0	f	2010-12-05	4354	\N	27146	\N
37805	GENERIC_DAY	0	0	f	2011-01-02	4352	\N	27146	\N
37806	GENERIC_DAY	0	0	f	2010-12-19	4352	\N	27146	\N
17777	GENERIC_DAY	6	4	f	2010-08-24	4352	\N	9412	\N
17778	GENERIC_DAY	6	4	f	2010-08-19	4354	\N	9412	\N
17779	GENERIC_DAY	6	4	f	2010-08-04	4354	\N	9412	\N
17780	GENERIC_DAY	6	4	f	2010-08-19	4352	\N	9412	\N
17781	GENERIC_DAY	6	4	f	2010-08-25	4354	\N	9412	\N
17782	GENERIC_DAY	6	4	f	2010-08-31	4354	\N	9412	\N
17783	GENERIC_DAY	6	4	f	2010-08-16	4354	\N	9412	\N
17784	GENERIC_DAY	6	0	f	2010-08-22	4352	\N	9412	\N
17785	GENERIC_DAY	6	4	f	2010-08-09	4354	\N	9412	\N
17786	GENERIC_DAY	6	4	f	2010-08-12	4354	\N	9412	\N
17787	GENERIC_DAY	6	0	f	2010-07-31	4354	\N	9412	\N
17788	GENERIC_DAY	6	4	f	2010-08-02	4352	\N	9412	\N
17789	GENERIC_DAY	6	4	f	2010-08-16	4352	\N	9412	\N
17790	GENERIC_DAY	6	0	f	2010-08-14	4354	\N	9412	\N
17791	GENERIC_DAY	6	0	f	2010-08-29	4352	\N	9412	\N
17792	GENERIC_DAY	6	0	f	2010-08-21	4352	\N	9412	\N
17793	GENERIC_DAY	6	4	f	2010-08-13	4352	\N	9412	\N
6528	GENERIC_DAY	15	4	f	2010-07-15	4352	\N	5962	\N
6497	GENERIC_DAY	15	5	f	2010-07-06	4354	\N	5962	\N
6507	GENERIC_DAY	15	4	f	2010-07-14	4352	\N	5962	\N
6539	GENERIC_DAY	15	4	f	2010-07-19	4352	\N	5962	\N
37807	GENERIC_DAY	0	4	f	2011-01-06	4352	\N	27146	\N
37808	GENERIC_DAY	0	4	f	2010-11-16	4352	\N	27146	\N
37809	GENERIC_DAY	0	4	f	2010-12-13	4352	\N	27146	\N
37810	GENERIC_DAY	0	4	f	2011-01-11	4354	\N	27146	\N
37811	GENERIC_DAY	0	0	f	2011-01-08	4354	\N	27146	\N
37812	GENERIC_DAY	0	0	f	2010-11-21	4352	\N	27146	\N
37813	GENERIC_DAY	0	0	f	2011-01-08	4352	\N	27146	\N
37814	GENERIC_DAY	0	4	f	2010-12-21	4354	\N	27146	\N
37815	GENERIC_DAY	0	4	f	2010-11-18	4354	\N	27146	\N
37816	GENERIC_DAY	0	4	f	2010-12-20	4352	\N	27146	\N
37817	GENERIC_DAY	0	0	f	2010-11-14	4354	\N	27146	\N
37818	GENERIC_DAY	0	4	f	2010-12-09	4354	\N	27146	\N
37819	GENERIC_DAY	0	0	f	2010-11-28	4354	\N	27146	\N
37820	GENERIC_DAY	0	0	f	2010-12-26	4352	\N	27146	\N
37821	GENERIC_DAY	0	4	f	2010-12-27	4354	\N	27146	\N
37822	GENERIC_DAY	0	4	f	2010-12-02	4354	\N	27146	\N
37823	GENERIC_DAY	0	0	f	2010-11-27	4354	\N	27146	\N
37824	GENERIC_DAY	0	4	f	2010-11-12	4354	\N	27146	\N
37825	GENERIC_DAY	0	0	f	2010-11-14	4352	\N	27146	\N
37826	GENERIC_DAY	0	4	f	2010-12-24	4354	\N	27146	\N
37827	GENERIC_DAY	0	0	f	2010-12-19	4354	\N	27146	\N
37828	GENERIC_DAY	0	4	f	2010-12-31	4354	\N	27146	\N
37829	GENERIC_DAY	0	4	f	2010-12-03	4352	\N	27146	\N
37830	GENERIC_DAY	0	4	f	2011-01-04	4352	\N	27146	\N
37831	GENERIC_DAY	0	4	f	2010-12-29	4352	\N	27146	\N
37832	GENERIC_DAY	0	0	f	2010-12-26	4354	\N	27146	\N
37833	GENERIC_DAY	0	0	f	2010-12-04	4352	\N	27146	\N
37834	GENERIC_DAY	0	4	f	2010-11-24	4352	\N	27146	\N
37835	GENERIC_DAY	0	4	f	2010-12-10	4354	\N	27146	\N
37836	GENERIC_DAY	0	4	f	2010-11-15	4354	\N	27146	\N
37837	GENERIC_DAY	0	4	f	2010-11-22	4354	\N	27146	\N
37838	GENERIC_DAY	0	4	f	2010-12-15	4354	\N	27146	\N
37839	GENERIC_DAY	0	4	f	2010-11-19	4352	\N	27146	\N
37840	GENERIC_DAY	0	0	f	2010-12-18	4352	\N	27146	\N
37841	GENERIC_DAY	0	0	f	2010-12-25	4354	\N	27146	\N
37842	GENERIC_DAY	0	4	f	2010-11-17	4354	\N	27146	\N
37843	GENERIC_DAY	0	0	f	2010-12-18	4354	\N	27146	\N
37844	GENERIC_DAY	0	4	f	2010-12-01	4352	\N	27146	\N
37845	GENERIC_DAY	0	4	f	2010-12-14	4352	\N	27146	\N
37846	GENERIC_DAY	0	4	f	2010-11-23	4354	\N	27146	\N
37847	GENERIC_DAY	0	4	f	2011-01-10	4352	\N	27146	\N
37848	GENERIC_DAY	0	4	f	2010-12-08	4352	\N	27146	\N
37849	GENERIC_DAY	0	4	f	2011-01-17	4352	\N	27146	\N
37850	GENERIC_DAY	0	4	f	2010-11-09	4354	\N	27146	\N
37851	GENERIC_DAY	0	4	f	2010-11-11	4352	\N	27146	\N
37852	GENERIC_DAY	0	0	f	2010-11-13	4354	\N	27146	\N
37853	GENERIC_DAY	0	4	f	2010-11-23	4352	\N	27146	\N
37854	GENERIC_DAY	0	4	f	2011-01-11	4352	\N	27146	\N
37855	GENERIC_DAY	0	4	f	2010-12-20	4354	\N	27146	\N
37856	GENERIC_DAY	0	4	f	2010-12-29	4354	\N	27146	\N
37857	GENERIC_DAY	0	4	f	2010-12-08	4354	\N	27146	\N
37858	GENERIC_DAY	0	4	f	2010-11-25	4354	\N	27146	\N
37859	GENERIC_DAY	0	4	f	2010-12-23	4352	\N	27146	\N
37860	GENERIC_DAY	0	4	f	2010-12-31	4352	\N	27146	\N
37861	GENERIC_DAY	0	4	f	2010-12-06	4354	\N	27146	\N
37862	GENERIC_DAY	0	4	f	2010-11-12	4352	\N	27146	\N
37863	GENERIC_DAY	0	4	f	2010-12-17	4354	\N	27146	\N
37864	GENERIC_DAY	0	4	f	2011-01-13	4352	\N	27146	\N
37865	GENERIC_DAY	0	4	f	2010-11-16	4354	\N	27146	\N
37866	GENERIC_DAY	0	4	f	2010-12-17	4352	\N	27146	\N
37867	GENERIC_DAY	0	4	f	2010-12-03	4354	\N	27146	\N
37868	GENERIC_DAY	0	4	f	2011-01-10	4354	\N	27146	\N
37869	GENERIC_DAY	0	0	f	2010-11-27	4352	\N	27146	\N
37870	GENERIC_DAY	0	0	f	2011-01-15	4354	\N	27146	\N
37871	GENERIC_DAY	0	4	f	2010-12-10	4352	\N	27146	\N
37872	GENERIC_DAY	0	0	f	2010-12-04	4354	\N	27146	\N
37873	GENERIC_DAY	0	4	f	2010-12-13	4354	\N	27146	\N
27733	GENERIC_DAY	8	4	f	2010-09-02	4352	\N	27075	\N
27721	GENERIC_DAY	8	4	f	2010-08-30	4354	\N	27075	\N
27735	GENERIC_DAY	8	4	f	2010-08-11	4354	\N	27075	\N
27731	GENERIC_DAY	8	4	f	2010-08-13	4354	\N	27075	\N
27722	GENERIC_DAY	8	4	f	2010-08-18	4352	\N	27075	\N
27730	GENERIC_DAY	8	4	f	2010-08-06	4352	\N	27075	\N
27736	GENERIC_DAY	8	0	f	2010-08-22	4354	\N	27075	\N
27732	GENERIC_DAY	8	0	f	2010-08-29	4354	\N	27075	\N
27727	GENERIC_DAY	8	4	f	2010-09-03	4352	\N	27075	\N
27719	GENERIC_DAY	8	4	f	2010-08-24	4352	\N	27075	\N
27737	GENERIC_DAY	8	4	f	2010-08-03	4354	\N	27075	\N
27739	GENERIC_DAY	8	4	f	2010-08-26	4354	\N	27075	\N
27726	GENERIC_DAY	8	4	f	2010-08-19	4352	\N	27075	\N
37874	GENERIC_DAY	0	4	f	2010-11-19	4354	\N	27146	\N
37875	GENERIC_DAY	0	0	f	2010-11-28	4352	\N	27146	\N
37876	GENERIC_DAY	0	4	f	2010-11-09	4352	\N	27146	\N
37877	GENERIC_DAY	0	4	f	2011-01-05	4352	\N	27146	\N
37878	GENERIC_DAY	0	4	f	2010-12-07	4352	\N	27146	\N
37879	GENERIC_DAY	0	4	f	2011-01-05	4354	\N	27146	\N
37880	GENERIC_DAY	0	4	f	2010-12-09	4352	\N	27146	\N
37881	GENERIC_DAY	0	4	f	2010-11-26	4354	\N	27146	\N
37882	GENERIC_DAY	0	4	f	2010-11-24	4354	\N	27146	\N
37883	GENERIC_DAY	0	0	f	2011-01-09	4354	\N	27146	\N
37884	GENERIC_DAY	0	4	f	2010-12-02	4352	\N	27146	\N
37885	GENERIC_DAY	0	4	f	2010-11-30	4354	\N	27146	\N
37886	GENERIC_DAY	0	4	f	2010-12-07	4354	\N	27146	\N
37887	GENERIC_DAY	0	0	f	2011-01-16	4352	\N	27146	\N
37888	GENERIC_DAY	0	0	f	2010-12-25	4352	\N	27146	\N
37889	GENERIC_DAY	0	4	f	2011-01-07	4354	\N	27146	\N
37890	GENERIC_DAY	0	0	f	2010-12-12	4352	\N	27146	\N
37891	GENERIC_DAY	0	4	f	2011-01-03	4354	\N	27146	\N
37892	GENERIC_DAY	0	4	f	2010-12-28	4354	\N	27146	\N
37893	GENERIC_DAY	0	0	f	2011-01-15	4352	\N	27146	\N
37894	GENERIC_DAY	0	4	f	2010-11-11	4354	\N	27146	\N
37924	SPECIFIC_DAY	3	0	f	2010-09-18	1216	31221	\N	\N
37928	SPECIFIC_DAY	3	8	f	2010-09-23	1216	31221	\N	\N
37923	SPECIFIC_DAY	3	8	f	2010-09-15	1216	31221	\N	\N
37926	SPECIFIC_DAY	3	8	f	2010-09-24	1216	31221	\N	\N
37925	SPECIFIC_DAY	3	8	f	2010-09-16	1216	31221	\N	\N
37927	SPECIFIC_DAY	3	4	f	2010-09-08	1216	31221	\N	\N
37941	SPECIFIC_DAY	3	8	f	2010-10-20	1220	31222	\N	\N
37931	SPECIFIC_DAY	3	8	f	2010-10-15	1220	31222	\N	\N
37932	SPECIFIC_DAY	3	0	f	2010-10-24	1220	31222	\N	\N
27599	GENERIC_DAY	8	2	f	2010-08-10	4358	\N	27074	\N
27661	GENERIC_DAY	8	0	f	2010-08-14	4358	\N	27074	\N
27612	GENERIC_DAY	8	2	f	2010-08-03	4358	\N	27074	\N
27603	GENERIC_DAY	8	2	f	2010-08-12	4344	\N	27074	\N
27620	GENERIC_DAY	8	0	f	2010-08-21	4350	\N	27074	\N
27665	GENERIC_DAY	8	2	f	2010-08-11	4358	\N	27074	\N
27579	GENERIC_DAY	8	0	f	2010-08-07	4348	\N	27074	\N
27571	GENERIC_DAY	8	2	f	2010-08-17	4350	\N	27074	\N
27638	GENERIC_DAY	8	2	f	2010-08-10	4344	\N	27074	\N
27659	GENERIC_DAY	8	2	f	2010-08-13	4344	\N	27074	\N
27597	GENERIC_DAY	8	2	f	2010-08-05	4350	\N	27074	\N
37967	SPECIFIC_DAY	2	8	f	2010-11-16	1216	31225	\N	\N
37968	SPECIFIC_DAY	2	8	f	2010-11-01	1216	31225	\N	\N
37965	SPECIFIC_DAY	2	8	f	2010-11-05	1216	31225	\N	\N
37970	SPECIFIC_DAY	2	8	f	2010-11-03	1216	31225	\N	\N
37972	SPECIFIC_DAY	2	8	f	2010-11-04	1216	31225	\N	\N
37966	SPECIFIC_DAY	2	8	f	2010-11-10	1216	31225	\N	\N
37971	SPECIFIC_DAY	2	8	f	2010-11-15	1216	31225	\N	\N
37973	SPECIFIC_DAY	2	8	f	2010-11-09	1216	31225	\N	\N
37969	SPECIFIC_DAY	2	8	f	2010-11-11	1216	31225	\N	\N
37974	SPECIFIC_DAY	2	4	f	2010-10-29	1216	31225	\N	\N
37964	SPECIFIC_DAY	2	8	f	2010-11-02	1216	31225	\N	\N
37963	SPECIFIC_DAY	2	8	f	2010-11-08	1216	31225	\N	\N
37962	SPECIFIC_DAY	2	8	f	2010-11-12	1216	31225	\N	\N
37975	SPECIFIC_DAY	1	8	f	2010-08-10	1216	2732	\N	\N
38279	SPECIFIC_DAY	1	8	f	2010-08-23	1216	2732	\N	\N
38280	SPECIFIC_DAY	1	8	f	2010-08-20	1216	2732	\N	\N
38281	SPECIFIC_DAY	1	8	f	2010-08-19	1216	2732	\N	\N
38282	SPECIFIC_DAY	1	8	f	2010-08-09	1216	2732	\N	\N
38283	SPECIFIC_DAY	1	8	f	2010-08-18	1216	2732	\N	\N
38284	SPECIFIC_DAY	1	8	f	2010-08-13	1216	2732	\N	\N
38285	SPECIFIC_DAY	1	8	f	2010-08-24	1216	2732	\N	\N
38286	SPECIFIC_DAY	1	8	f	2010-08-16	1216	2732	\N	\N
38287	SPECIFIC_DAY	1	8	f	2010-08-12	1216	2732	\N	\N
38288	SPECIFIC_DAY	1	4	f	2010-08-06	1216	2732	\N	\N
38289	SPECIFIC_DAY	1	8	f	2010-08-11	1216	2732	\N	\N
38290	SPECIFIC_DAY	1	8	f	2010-08-17	1216	2732	\N	\N
21705	GENERIC_DAY	3	0	f	2010-08-01	4350	\N	16774	\N
21706	GENERIC_DAY	3	2	f	2010-08-19	4350	\N	16774	\N
21707	GENERIC_DAY	3	2	f	2010-08-02	4358	\N	16774	\N
21708	GENERIC_DAY	3	2	f	2010-08-26	4358	\N	16774	\N
21709	GENERIC_DAY	3	2	f	2010-08-03	4350	\N	16774	\N
21710	GENERIC_DAY	3	2	f	2010-08-24	4344	\N	16774	\N
21711	GENERIC_DAY	3	2	f	2010-08-06	4350	\N	16774	\N
21712	GENERIC_DAY	3	0	f	2010-08-22	4344	\N	16774	\N
21713	GENERIC_DAY	3	0	f	2010-08-29	4358	\N	16774	\N
21714	GENERIC_DAY	3	2	f	2010-08-18	4358	\N	16774	\N
21715	GENERIC_DAY	3	0	f	2010-08-01	4344	\N	16774	\N
21716	GENERIC_DAY	3	2	f	2010-07-30	4348	\N	16774	\N
21717	GENERIC_DAY	3	2	f	2010-08-13	4344	\N	16774	\N
21718	GENERIC_DAY	3	2	f	2010-08-31	4350	\N	16774	\N
21719	GENERIC_DAY	3	2	f	2010-08-26	4348	\N	16774	\N
31135	GENERIC_DAY	3	0	f	2010-07-11	21817	\N	27090	\N
31137	GENERIC_DAY	3	2	f	2010-07-01	4358	\N	27090	\N
31167	GENERIC_DAY	3	1	f	2010-07-02	4348	\N	27090	\N
31168	GENERIC_DAY	3	0	f	2010-07-10	4358	\N	27090	\N
31171	GENERIC_DAY	3	0	f	2010-07-01	4344	\N	27090	\N
31149	GENERIC_DAY	3	1	f	2010-07-09	4348	\N	27090	\N
31152	GENERIC_DAY	3	0	f	2010-07-03	21817	\N	27090	\N
31143	GENERIC_DAY	3	0	f	2010-07-05	4350	\N	27090	\N
31169	GENERIC_DAY	3	1	f	2010-07-13	4348	\N	27090	\N
31150	GENERIC_DAY	3	1	f	2010-07-07	4358	\N	27090	\N
31174	GENERIC_DAY	3	0	f	2010-07-10	4350	\N	27090	\N
31175	GENERIC_DAY	3	0	f	2010-07-02	4350	\N	27090	\N
31138	GENERIC_DAY	3	0	f	2010-07-04	4344	\N	27090	\N
44713	GENERIC_DAY	1	8	f	2010-07-14	4352	\N	42532	\N
44714	GENERIC_DAY	1	4	f	2010-06-28	4354	\N	42532	\N
44715	GENERIC_DAY	1	8	f	2010-06-23	4354	\N	42532	\N
44716	GENERIC_DAY	1	0	f	2010-06-20	4352	\N	42532	\N
44717	GENERIC_DAY	1	0	f	2010-07-03	4352	\N	42532	\N
44718	GENERIC_DAY	1	0	f	2010-06-23	4352	\N	42532	\N
44719	GENERIC_DAY	1	0	f	2010-07-18	4352	\N	42532	\N
44720	GENERIC_DAY	1	0	f	2010-06-26	4352	\N	42532	\N
44721	GENERIC_DAY	1	2	f	2010-07-21	4352	\N	42532	\N
44722	GENERIC_DAY	1	0	f	2010-07-21	4354	\N	42532	\N
44723	GENERIC_DAY	1	8	f	2010-07-16	4352	\N	42532	\N
44724	GENERIC_DAY	1	0	f	2010-06-22	4352	\N	42532	\N
44725	GENERIC_DAY	1	8	f	2010-07-20	4352	\N	42532	\N
44726	GENERIC_DAY	1	0	f	2010-07-07	4354	\N	42532	\N
44727	GENERIC_DAY	1	8	f	2010-07-06	4352	\N	42532	\N
44728	GENERIC_DAY	1	8	f	2010-07-01	4352	\N	42532	\N
44729	GENERIC_DAY	1	0	f	2010-07-09	4354	\N	42532	\N
44730	GENERIC_DAY	1	0	f	2010-07-18	4354	\N	42532	\N
44731	GENERIC_DAY	1	0	f	2010-07-01	4354	\N	42532	\N
44732	GENERIC_DAY	1	8	f	2010-06-24	4354	\N	42532	\N
44733	GENERIC_DAY	1	0	f	2010-07-20	4354	\N	42532	\N
44734	GENERIC_DAY	1	0	f	2010-07-15	4354	\N	42532	\N
44735	GENERIC_DAY	1	0	f	2010-06-27	4352	\N	42532	\N
44736	GENERIC_DAY	1	0	f	2010-07-10	4354	\N	42532	\N
44737	GENERIC_DAY	1	1	f	2010-06-18	4352	\N	42532	\N
44738	GENERIC_DAY	1	8	f	2010-07-08	4352	\N	42532	\N
44739	GENERIC_DAY	1	0	f	2010-07-04	4354	\N	42532	\N
44740	GENERIC_DAY	1	4	f	2010-06-28	4352	\N	42532	\N
44741	GENERIC_DAY	1	0	f	2010-07-03	4354	\N	42532	\N
44742	GENERIC_DAY	1	0	f	2010-06-19	4352	\N	42532	\N
44743	GENERIC_DAY	1	0	f	2010-07-12	4354	\N	42532	\N
44744	GENERIC_DAY	1	0	f	2010-07-02	4354	\N	42532	\N
44745	GENERIC_DAY	1	7	f	2010-06-17	4354	\N	42532	\N
44746	GENERIC_DAY	1	7	f	2010-06-15	4354	\N	42532	\N
44747	GENERIC_DAY	1	0	f	2010-07-08	4354	\N	42532	\N
44748	GENERIC_DAY	1	8	f	2010-07-09	4352	\N	42532	\N
44749	GENERIC_DAY	1	8	f	2010-06-22	4354	\N	42532	\N
44750	GENERIC_DAY	1	0	f	2010-07-14	4354	\N	42532	\N
44751	GENERIC_DAY	1	8	f	2010-07-12	4352	\N	42532	\N
44752	GENERIC_DAY	1	7	f	2010-06-18	4354	\N	42532	\N
44753	GENERIC_DAY	1	0	f	2010-07-16	4354	\N	42532	\N
44754	GENERIC_DAY	1	7	f	2010-06-21	4354	\N	42532	\N
44755	GENERIC_DAY	1	1	f	2010-06-21	4352	\N	42532	\N
44756	GENERIC_DAY	1	0	f	2010-07-19	4354	\N	42532	\N
44757	GENERIC_DAY	1	0	f	2010-06-19	4354	\N	42532	\N
44758	GENERIC_DAY	1	0	f	2010-07-17	4352	\N	42532	\N
44759	GENERIC_DAY	1	4	f	2010-06-29	4352	\N	42532	\N
44760	GENERIC_DAY	1	8	f	2010-07-13	4352	\N	42532	\N
44761	GENERIC_DAY	1	0	f	2010-06-27	4354	\N	42532	\N
44762	GENERIC_DAY	1	0	f	2010-07-05	4354	\N	42532	\N
44763	GENERIC_DAY	1	8	f	2010-06-25	4354	\N	42532	\N
44764	GENERIC_DAY	1	4	f	2010-06-30	4352	\N	42532	\N
44765	GENERIC_DAY	1	0	f	2010-06-25	4352	\N	42532	\N
44766	GENERIC_DAY	1	1	f	2010-06-17	4352	\N	42532	\N
44767	GENERIC_DAY	1	0	f	2010-07-04	4352	\N	42532	\N
44768	GENERIC_DAY	1	0	f	2010-07-11	4354	\N	42532	\N
44769	GENERIC_DAY	1	8	f	2010-07-15	4352	\N	42532	\N
44770	GENERIC_DAY	1	0	f	2010-07-13	4354	\N	42532	\N
44771	GENERIC_DAY	1	0	f	2010-07-10	4352	\N	42532	\N
44772	GENERIC_DAY	1	0	f	2010-06-24	4352	\N	42532	\N
44773	GENERIC_DAY	1	8	f	2010-07-19	4352	\N	42532	\N
44774	GENERIC_DAY	1	0	f	2010-06-26	4354	\N	42532	\N
44775	GENERIC_DAY	1	1	f	2010-06-15	4352	\N	42532	\N
44776	GENERIC_DAY	1	0	f	2010-07-17	4354	\N	42532	\N
44777	GENERIC_DAY	1	0	f	2010-07-11	4352	\N	42532	\N
44778	GENERIC_DAY	1	4	f	2010-06-30	4354	\N	42532	\N
44779	GENERIC_DAY	1	0	f	2010-07-06	4354	\N	42532	\N
44780	GENERIC_DAY	1	8	f	2010-07-05	4352	\N	42532	\N
44781	GENERIC_DAY	1	7	f	2010-06-16	4354	\N	42532	\N
44782	GENERIC_DAY	1	1	f	2010-06-16	4352	\N	42532	\N
44783	GENERIC_DAY	1	8	f	2010-07-02	4352	\N	42532	\N
44784	GENERIC_DAY	1	8	f	2010-07-07	4352	\N	42532	\N
44785	GENERIC_DAY	1	0	f	2010-06-20	4354	\N	42532	\N
44786	GENERIC_DAY	1	4	f	2010-06-29	4354	\N	42532	\N
44787	GENERIC_DAY	1	0	f	2010-07-31	4350	\N	42533	\N
44788	GENERIC_DAY	1	0	f	2010-08-08	4350	\N	42533	\N
44789	GENERIC_DAY	1	0	f	2010-08-01	4358	\N	42533	\N
44790	GENERIC_DAY	1	2	f	2010-07-26	4358	\N	42533	\N
44791	GENERIC_DAY	1	0	f	2010-07-24	4358	\N	42533	\N
44792	GENERIC_DAY	1	0	f	2010-08-07	4344	\N	42533	\N
44793	GENERIC_DAY	1	2	f	2010-07-22	4348	\N	42533	\N
44794	GENERIC_DAY	1	0	f	2010-08-01	4348	\N	42533	\N
44795	GENERIC_DAY	1	2	f	2010-07-26	4344	\N	42533	\N
44796	GENERIC_DAY	1	2	f	2010-07-26	4350	\N	42533	\N
44797	GENERIC_DAY	1	2	f	2010-08-13	4344	\N	42533	\N
44798	GENERIC_DAY	1	0	f	2010-08-08	4344	\N	42533	\N
44799	GENERIC_DAY	1	0	f	2010-08-15	4344	\N	42533	\N
44800	GENERIC_DAY	1	2	f	2010-08-09	4358	\N	42533	\N
44801	GENERIC_DAY	1	2	f	2010-07-23	4358	\N	42533	\N
44802	GENERIC_DAY	1	2	f	2010-07-23	4350	\N	42533	\N
44803	GENERIC_DAY	1	3	f	2010-07-28	4344	\N	42533	\N
44804	GENERIC_DAY	1	0	f	2010-08-07	4348	\N	42533	\N
44805	GENERIC_DAY	1	2	f	2010-07-22	4344	\N	42533	\N
44806	GENERIC_DAY	1	0	f	2010-08-15	4348	\N	42533	\N
44807	GENERIC_DAY	1	2	f	2010-08-09	4350	\N	42533	\N
44808	GENERIC_DAY	1	2	f	2010-08-04	4348	\N	42533	\N
44809	GENERIC_DAY	1	2	f	2010-07-29	4358	\N	42533	\N
44810	GENERIC_DAY	1	2	f	2010-08-03	4344	\N	42533	\N
44811	GENERIC_DAY	1	2	f	2010-08-11	4350	\N	42533	\N
44812	GENERIC_DAY	1	2	f	2010-08-11	4344	\N	42533	\N
44813	GENERIC_DAY	1	2	f	2010-08-04	4344	\N	42533	\N
44814	GENERIC_DAY	1	2	f	2010-08-16	4350	\N	42533	\N
44815	GENERIC_DAY	1	2	f	2010-07-30	4348	\N	42533	\N
44816	GENERIC_DAY	1	0	f	2010-08-07	4350	\N	42533	\N
44817	GENERIC_DAY	1	2	f	2010-07-26	4348	\N	42533	\N
44818	GENERIC_DAY	1	2	f	2010-08-03	4358	\N	42533	\N
44819	GENERIC_DAY	1	2	f	2010-08-09	4344	\N	42533	\N
44820	GENERIC_DAY	1	2	f	2010-07-28	4350	\N	42533	\N
44821	GENERIC_DAY	1	2	f	2010-08-16	4344	\N	42533	\N
44822	GENERIC_DAY	1	2	f	2010-08-02	4358	\N	42533	\N
44823	GENERIC_DAY	1	2	f	2010-08-02	4348	\N	42533	\N
44824	GENERIC_DAY	1	2	f	2010-08-10	4350	\N	42533	\N
44825	GENERIC_DAY	1	2	f	2010-07-27	4358	\N	42533	\N
44826	GENERIC_DAY	1	2	f	2010-08-05	4344	\N	42533	\N
44827	GENERIC_DAY	1	2	f	2010-08-12	4348	\N	42533	\N
44828	GENERIC_DAY	1	2	f	2010-08-12	4344	\N	42533	\N
44829	GENERIC_DAY	1	0	f	2010-07-25	4358	\N	42533	\N
44830	GENERIC_DAY	1	2	f	2010-08-10	4344	\N	42533	\N
44831	GENERIC_DAY	1	2	f	2010-08-03	4350	\N	42533	\N
44832	GENERIC_DAY	1	0	f	2010-08-07	4358	\N	42533	\N
44833	GENERIC_DAY	1	0	f	2010-07-31	4344	\N	42533	\N
44834	GENERIC_DAY	1	2	f	2010-07-22	4358	\N	42533	\N
44835	GENERIC_DAY	1	2	f	2010-07-28	4348	\N	42533	\N
44836	GENERIC_DAY	1	1	f	2010-08-17	4358	\N	42533	\N
44837	GENERIC_DAY	1	0	f	2010-08-14	4348	\N	42533	\N
44838	GENERIC_DAY	1	1	f	2010-07-28	4358	\N	42533	\N
44839	GENERIC_DAY	1	2	f	2010-08-02	4350	\N	42533	\N
44840	GENERIC_DAY	1	0	f	2010-08-01	4344	\N	42533	\N
44841	GENERIC_DAY	1	0	f	2010-08-14	4358	\N	42533	\N
44842	GENERIC_DAY	1	2	f	2010-08-16	4358	\N	42533	\N
44843	GENERIC_DAY	1	0	f	2010-08-14	4350	\N	42533	\N
44844	GENERIC_DAY	1	0	f	2010-07-24	4348	\N	42533	\N
44845	GENERIC_DAY	1	2	f	2010-08-03	4348	\N	42533	\N
44846	GENERIC_DAY	1	2	f	2010-08-10	4358	\N	42533	\N
44847	GENERIC_DAY	1	2	f	2010-08-11	4358	\N	42533	\N
44848	GENERIC_DAY	1	2	f	2010-07-23	4344	\N	42533	\N
44849	GENERIC_DAY	1	2	f	2010-08-17	4344	\N	42533	\N
44850	GENERIC_DAY	1	2	f	2010-07-30	4358	\N	42533	\N
44851	GENERIC_DAY	1	2	f	2010-08-06	4350	\N	42533	\N
44852	GENERIC_DAY	1	0	f	2010-08-15	4358	\N	42533	\N
44853	GENERIC_DAY	1	2	f	2010-08-16	4348	\N	42533	\N
44854	GENERIC_DAY	1	2	f	2010-08-04	4358	\N	42533	\N
44855	GENERIC_DAY	1	0	f	2010-08-01	4350	\N	42533	\N
44856	GENERIC_DAY	1	2	f	2010-08-06	4348	\N	42533	\N
44857	GENERIC_DAY	1	2	f	2010-07-30	4350	\N	42533	\N
44858	GENERIC_DAY	1	2	f	2010-08-11	4348	\N	42533	\N
44859	GENERIC_DAY	1	2	f	2010-08-12	4358	\N	42533	\N
44860	GENERIC_DAY	1	2	f	2010-08-13	4350	\N	42533	\N
44861	GENERIC_DAY	1	2	f	2010-07-23	4348	\N	42533	\N
44862	GENERIC_DAY	1	2	f	2010-07-30	4344	\N	42533	\N
44863	GENERIC_DAY	1	2	f	2010-07-27	4348	\N	42533	\N
44864	GENERIC_DAY	1	2	f	2010-08-05	4348	\N	42533	\N
44865	GENERIC_DAY	1	2	f	2010-07-29	4350	\N	42533	\N
44866	GENERIC_DAY	1	0	f	2010-07-31	4358	\N	42533	\N
44867	GENERIC_DAY	1	0	f	2010-07-25	4344	\N	42533	\N
44868	GENERIC_DAY	1	2	f	2010-07-27	4344	\N	42533	\N
44869	GENERIC_DAY	1	2	f	2010-08-17	4348	\N	42533	\N
44870	GENERIC_DAY	1	2	f	2010-08-13	4348	\N	42533	\N
44871	GENERIC_DAY	1	2	f	2010-08-06	4358	\N	42533	\N
44872	GENERIC_DAY	1	2	f	2010-08-09	4348	\N	42533	\N
44873	GENERIC_DAY	1	2	f	2010-08-02	4344	\N	42533	\N
44874	GENERIC_DAY	1	2	f	2010-08-04	4350	\N	42533	\N
44875	GENERIC_DAY	1	0	f	2010-08-08	4358	\N	42533	\N
44876	GENERIC_DAY	1	1	f	2010-08-17	4350	\N	42533	\N
44877	GENERIC_DAY	1	0	f	2010-08-08	4348	\N	42533	\N
44878	GENERIC_DAY	1	2	f	2010-07-29	4348	\N	42533	\N
44879	GENERIC_DAY	1	2	f	2010-08-12	4350	\N	42533	\N
44880	GENERIC_DAY	1	2	f	2010-08-06	4344	\N	42533	\N
44881	GENERIC_DAY	1	0	f	2010-07-25	4350	\N	42533	\N
44882	GENERIC_DAY	1	2	f	2010-08-05	4358	\N	42533	\N
44883	GENERIC_DAY	1	0	f	2010-08-14	4344	\N	42533	\N
44884	GENERIC_DAY	1	0	f	2010-08-15	4350	\N	42533	\N
44885	GENERIC_DAY	1	0	f	2010-07-24	4350	\N	42533	\N
44886	GENERIC_DAY	1	2	f	2010-08-10	4348	\N	42533	\N
44887	GENERIC_DAY	1	0	f	2010-07-25	4348	\N	42533	\N
44888	GENERIC_DAY	1	2	f	2010-08-05	4350	\N	42533	\N
44889	GENERIC_DAY	1	0	f	2010-07-24	4344	\N	42533	\N
44890	GENERIC_DAY	1	2	f	2010-08-13	4358	\N	42533	\N
44891	GENERIC_DAY	1	2	f	2010-07-22	4350	\N	42533	\N
44892	GENERIC_DAY	1	2	f	2010-07-27	4350	\N	42533	\N
44893	GENERIC_DAY	1	2	f	2010-07-29	4344	\N	42533	\N
44894	GENERIC_DAY	1	0	f	2010-07-31	4348	\N	42533	\N
45561	GENERIC_DAY	0	0	f	2010-08-28	4352	\N	42595	\N
45562	GENERIC_DAY	0	4	f	2010-09-13	4352	\N	42595	\N
45563	GENERIC_DAY	0	4	f	2010-09-29	4352	\N	42595	\N
45564	GENERIC_DAY	0	4	f	2010-08-26	4352	\N	42595	\N
45565	GENERIC_DAY	0	4	f	2010-09-29	4354	\N	42595	\N
45566	GENERIC_DAY	0	0	f	2010-09-25	4354	\N	42595	\N
45567	GENERIC_DAY	0	0	f	2010-09-04	4352	\N	42595	\N
45568	GENERIC_DAY	0	4	f	2010-09-17	4352	\N	42595	\N
45569	GENERIC_DAY	0	4	f	2010-09-16	4352	\N	42595	\N
45570	GENERIC_DAY	0	4	f	2010-09-24	4354	\N	42595	\N
45571	GENERIC_DAY	0	4	f	2010-09-10	4352	\N	42595	\N
45572	GENERIC_DAY	0	4	f	2010-09-15	4352	\N	42595	\N
45573	GENERIC_DAY	0	4	f	2010-09-13	4354	\N	42595	\N
45574	GENERIC_DAY	0	0	f	2010-09-26	4354	\N	42595	\N
45575	GENERIC_DAY	0	4	f	2010-09-06	4354	\N	42595	\N
45576	GENERIC_DAY	0	4	f	2010-09-01	4354	\N	42595	\N
45577	GENERIC_DAY	0	4	f	2010-09-27	4352	\N	42595	\N
45578	GENERIC_DAY	0	0	f	2010-09-18	4354	\N	42595	\N
45579	GENERIC_DAY	0	1	f	2010-09-30	4354	\N	42595	\N
45580	GENERIC_DAY	0	4	f	2010-09-23	4354	\N	42595	\N
45581	GENERIC_DAY	0	0	f	2010-09-12	4352	\N	42595	\N
45582	GENERIC_DAY	0	4	f	2010-08-25	4354	\N	42595	\N
45583	GENERIC_DAY	0	4	f	2010-08-31	4354	\N	42595	\N
45584	GENERIC_DAY	0	4	f	2010-09-21	4354	\N	42595	\N
45585	GENERIC_DAY	0	4	f	2010-09-09	4354	\N	42595	\N
45586	GENERIC_DAY	0	4	f	2010-09-23	4352	\N	42595	\N
45587	GENERIC_DAY	0	4	f	2010-09-08	4354	\N	42595	\N
45588	GENERIC_DAY	0	4	f	2010-09-15	4354	\N	42595	\N
45589	GENERIC_DAY	0	4	f	2010-09-27	4354	\N	42595	\N
45590	GENERIC_DAY	0	4	f	2010-09-24	4352	\N	42595	\N
45591	GENERIC_DAY	0	0	f	2010-08-29	4354	\N	42595	\N
45592	GENERIC_DAY	0	4	f	2010-08-27	4354	\N	42595	\N
45593	GENERIC_DAY	0	0	f	2010-09-25	4352	\N	42595	\N
45594	GENERIC_DAY	0	0	f	2010-09-19	4352	\N	42595	\N
45595	GENERIC_DAY	0	4	f	2010-09-20	4354	\N	42595	\N
45596	GENERIC_DAY	0	0	f	2010-08-29	4352	\N	42595	\N
45597	GENERIC_DAY	0	1	f	2010-09-30	4352	\N	42595	\N
45598	GENERIC_DAY	0	4	f	2010-09-10	4354	\N	42595	\N
45599	GENERIC_DAY	0	4	f	2010-09-28	4354	\N	42595	\N
45600	GENERIC_DAY	0	4	f	2010-09-09	4352	\N	42595	\N
45601	GENERIC_DAY	0	0	f	2010-09-12	4354	\N	42595	\N
45602	GENERIC_DAY	0	4	f	2010-08-30	4354	\N	42595	\N
45603	GENERIC_DAY	0	4	f	2010-09-07	4352	\N	42595	\N
45604	GENERIC_DAY	0	4	f	2010-08-30	4352	\N	42595	\N
45605	GENERIC_DAY	0	4	f	2010-09-20	4352	\N	42595	\N
45606	GENERIC_DAY	0	0	f	2010-09-11	4354	\N	42595	\N
45607	GENERIC_DAY	0	4	f	2010-09-28	4352	\N	42595	\N
45608	GENERIC_DAY	0	4	f	2010-08-25	4352	\N	42595	\N
45609	GENERIC_DAY	0	4	f	2010-09-03	4354	\N	42595	\N
45610	GENERIC_DAY	0	0	f	2010-09-04	4354	\N	42595	\N
45611	GENERIC_DAY	0	4	f	2010-08-31	4352	\N	42595	\N
45612	GENERIC_DAY	0	0	f	2010-09-05	4354	\N	42595	\N
45613	GENERIC_DAY	0	4	f	2010-09-06	4352	\N	42595	\N
45614	GENERIC_DAY	0	4	f	2010-09-14	4352	\N	42595	\N
45615	GENERIC_DAY	0	0	f	2010-09-26	4352	\N	42595	\N
45616	GENERIC_DAY	0	4	f	2010-09-01	4352	\N	42595	\N
45617	GENERIC_DAY	0	4	f	2010-09-08	4352	\N	42595	\N
45618	GENERIC_DAY	0	0	f	2010-09-18	4352	\N	42595	\N
45619	GENERIC_DAY	0	4	f	2010-09-17	4354	\N	42595	\N
45620	GENERIC_DAY	0	0	f	2010-09-11	4352	\N	42595	\N
45621	GENERIC_DAY	0	0	f	2010-09-19	4354	\N	42595	\N
45622	GENERIC_DAY	0	4	f	2010-09-14	4354	\N	42595	\N
45623	GENERIC_DAY	0	4	f	2010-09-16	4354	\N	42595	\N
45624	GENERIC_DAY	0	4	f	2010-08-27	4352	\N	42595	\N
45625	GENERIC_DAY	0	4	f	2010-09-22	4354	\N	42595	\N
45626	GENERIC_DAY	0	4	f	2010-08-26	4354	\N	42595	\N
45627	GENERIC_DAY	0	4	f	2010-09-07	4354	\N	42595	\N
45628	GENERIC_DAY	0	0	f	2010-09-05	4352	\N	42595	\N
45629	GENERIC_DAY	0	0	f	2010-08-28	4354	\N	42595	\N
45630	GENERIC_DAY	0	4	f	2010-09-22	4352	\N	42595	\N
45631	GENERIC_DAY	0	4	f	2010-09-02	4354	\N	42595	\N
45632	GENERIC_DAY	0	4	f	2010-09-03	4352	\N	42595	\N
45633	GENERIC_DAY	0	4	f	2010-09-02	4352	\N	42595	\N
45634	GENERIC_DAY	0	4	f	2010-09-21	4352	\N	42595	\N
37916	SPECIFIC_DAY	3	8	f	2010-09-20	1216	31221	\N	\N
37915	SPECIFIC_DAY	3	0	f	2010-09-19	1216	31221	\N	\N
37912	SPECIFIC_DAY	3	8	f	2010-09-22	1216	31221	\N	\N
37919	SPECIFIC_DAY	3	0	f	2010-09-11	1216	31221	\N	\N
37917	SPECIFIC_DAY	3	8	f	2010-09-21	1216	31221	\N	\N
37922	SPECIFIC_DAY	3	0	f	2010-09-12	1216	31221	\N	\N
37918	SPECIFIC_DAY	3	8	f	2010-09-13	1216	31221	\N	\N
37914	SPECIFIC_DAY	3	8	f	2010-09-17	1216	31221	\N	\N
37920	SPECIFIC_DAY	3	8	f	2010-09-14	1216	31221	\N	\N
37913	SPECIFIC_DAY	3	8	f	2010-09-10	1216	31221	\N	\N
37921	SPECIFIC_DAY	3	8	f	2010-09-09	1216	31221	\N	\N
38318	SPECIFIC_DAY	2	8	f	2010-11-23	1216	31224	\N	\N
38295	SPECIFIC_DAY	2	8	f	2010-12-31	1216	31224	\N	\N
38297	SPECIFIC_DAY	2	4	f	2011-01-07	1216	31224	\N	\N
38310	SPECIFIC_DAY	2	8	f	2010-12-10	1216	31224	\N	\N
38322	SPECIFIC_DAY	2	8	f	2010-12-21	1216	31224	\N	\N
38291	SPECIFIC_DAY	2	8	f	2010-11-17	1216	31224	\N	\N
38330	SPECIFIC_DAY	2	0	f	2010-12-26	1216	31224	\N	\N
38301	SPECIFIC_DAY	2	8	f	2010-11-19	1216	31224	\N	\N
38325	SPECIFIC_DAY	2	8	f	2010-12-09	1216	31224	\N	\N
38332	SPECIFIC_DAY	2	0	f	2010-11-20	1216	31224	\N	\N
38334	SPECIFIC_DAY	2	8	f	2010-11-29	1216	31224	\N	\N
38315	SPECIFIC_DAY	2	0	f	2010-12-05	1216	31224	\N	\N
38311	SPECIFIC_DAY	2	0	f	2011-01-01	1216	31224	\N	\N
38294	SPECIFIC_DAY	2	0	f	2010-12-18	1216	31224	\N	\N
38321	SPECIFIC_DAY	2	8	f	2010-11-30	1216	31224	\N	\N
38329	SPECIFIC_DAY	2	8	f	2010-11-25	1216	31224	\N	\N
38312	SPECIFIC_DAY	2	8	f	2010-12-07	1216	31224	\N	\N
38328	SPECIFIC_DAY	2	8	f	2010-12-01	1216	31224	\N	\N
38320	SPECIFIC_DAY	2	0	f	2010-11-28	1216	31224	\N	\N
38317	SPECIFIC_DAY	2	8	f	2010-12-06	1216	31224	\N	\N
38296	SPECIFIC_DAY	2	8	f	2010-12-17	1216	31224	\N	\N
38292	SPECIFIC_DAY	2	8	f	2010-11-18	1216	31224	\N	\N
38313	SPECIFIC_DAY	2	8	f	2010-12-24	1216	31224	\N	\N
38293	SPECIFIC_DAY	2	0	f	2010-12-04	1216	31224	\N	\N
38333	SPECIFIC_DAY	2	0	f	2010-12-12	1216	31224	\N	\N
38319	SPECIFIC_DAY	2	8	f	2011-01-06	1216	31224	\N	\N
38323	SPECIFIC_DAY	2	8	f	2010-11-24	1216	31224	\N	\N
38309	SPECIFIC_DAY	2	8	f	2010-11-22	1216	31224	\N	\N
38308	SPECIFIC_DAY	2	8	f	2010-12-14	1216	31224	\N	\N
38300	SPECIFIC_DAY	2	8	f	2010-11-26	1216	31224	\N	\N
38302	SPECIFIC_DAY	2	8	f	2010-12-20	1216	31224	\N	\N
38298	SPECIFIC_DAY	2	0	f	2010-11-21	1216	31224	\N	\N
38324	SPECIFIC_DAY	2	8	f	2010-12-13	1216	31224	\N	\N
38327	SPECIFIC_DAY	2	8	f	2010-12-16	1216	31224	\N	\N
38306	SPECIFIC_DAY	2	8	f	2010-12-29	1216	31224	\N	\N
38304	SPECIFIC_DAY	2	0	f	2010-12-25	1216	31224	\N	\N
38305	SPECIFIC_DAY	2	8	f	2011-01-05	1216	31224	\N	\N
38303	SPECIFIC_DAY	2	8	f	2010-12-08	1216	31224	\N	\N
37952	SPECIFIC_DAY	3	8	f	2010-10-04	1216	31223	\N	\N
37950	SPECIFIC_DAY	3	8	f	2010-09-28	1216	31223	\N	\N
37953	SPECIFIC_DAY	3	8	f	2010-10-06	1216	31223	\N	\N
37949	SPECIFIC_DAY	3	8	f	2010-10-11	1216	31223	\N	\N
37955	SPECIFIC_DAY	3	8	f	2010-10-08	1216	31223	\N	\N
37954	SPECIFIC_DAY	3	8	f	2010-10-01	1216	31223	\N	\N
37951	SPECIFIC_DAY	3	8	f	2010-10-05	1216	31223	\N	\N
37940	SPECIFIC_DAY	3	4	f	2010-11-01	1220	31222	\N	\N
37944	SPECIFIC_DAY	3	8	f	2010-10-26	1220	31222	\N	\N
37946	SPECIFIC_DAY	3	8	f	2010-10-18	1220	31222	\N	\N
37943	SPECIFIC_DAY	3	8	f	2010-10-28	1220	31222	\N	\N
37929	SPECIFIC_DAY	3	8	f	2010-10-25	1220	31222	\N	\N
37934	SPECIFIC_DAY	3	8	f	2010-10-21	1220	31222	\N	\N
37933	SPECIFIC_DAY	3	8	f	2010-10-19	1220	31222	\N	\N
37947	SPECIFIC_DAY	3	8	f	2010-10-27	1220	31222	\N	\N
37939	SPECIFIC_DAY	3	8	f	2010-10-29	1220	31222	\N	\N
37935	SPECIFIC_DAY	3	0	f	2010-10-31	1220	31222	\N	\N
37942	SPECIFIC_DAY	3	0	f	2010-10-30	1220	31222	\N	\N
37948	SPECIFIC_DAY	3	0	f	2010-10-23	1220	31222	\N	\N
37936	SPECIFIC_DAY	3	0	f	2010-10-16	1220	31222	\N	\N
37937	SPECIFIC_DAY	3	8	f	2010-10-22	1220	31222	\N	\N
37930	SPECIFIC_DAY	3	8	f	2010-10-14	1220	31222	\N	\N
37945	SPECIFIC_DAY	3	0	f	2010-10-17	1220	31222	\N	\N
37938	SPECIFIC_DAY	3	0	f	2010-10-13	1220	31222	\N	\N
45635	GENERIC_DAY	1	0	f	2010-09-11	1220	\N	42597	\N
45636	GENERIC_DAY	1	8	f	2010-09-08	1220	\N	42597	\N
45637	GENERIC_DAY	1	8	f	2010-08-25	1220	\N	42597	\N
45638	GENERIC_DAY	1	8	f	2010-09-01	1220	\N	42597	\N
45639	GENERIC_DAY	1	8	f	2010-09-24	1220	\N	42597	\N
45640	GENERIC_DAY	1	8	f	2010-09-17	1220	\N	42597	\N
45641	GENERIC_DAY	1	0	f	2010-08-21	1220	\N	42597	\N
45642	GENERIC_DAY	1	8	f	2010-08-23	1220	\N	42597	\N
45643	GENERIC_DAY	1	4	f	2010-10-13	1220	\N	42597	\N
45644	GENERIC_DAY	1	8	f	2010-09-13	1220	\N	42597	\N
45645	GENERIC_DAY	1	0	f	2010-08-20	1220	\N	42597	\N
45646	GENERIC_DAY	1	0	f	2010-09-04	1220	\N	42597	\N
45647	GENERIC_DAY	1	8	f	2010-09-06	1220	\N	42597	\N
45648	GENERIC_DAY	1	0	f	2010-10-03	1220	\N	42597	\N
45649	GENERIC_DAY	1	8	f	2010-09-21	1220	\N	42597	\N
45650	GENERIC_DAY	1	8	f	2010-09-28	1220	\N	42597	\N
45651	GENERIC_DAY	1	8	f	2010-08-27	1220	\N	42597	\N
45652	GENERIC_DAY	1	8	f	2010-09-07	1220	\N	42597	\N
45653	GENERIC_DAY	1	8	f	2010-09-29	1220	\N	42597	\N
45654	GENERIC_DAY	1	0	f	2010-08-29	1220	\N	42597	\N
45655	GENERIC_DAY	1	8	f	2010-09-30	1220	\N	42597	\N
45656	GENERIC_DAY	1	8	f	2010-09-09	1220	\N	42597	\N
45657	GENERIC_DAY	1	8	f	2010-08-24	1220	\N	42597	\N
45658	GENERIC_DAY	1	0	f	2010-09-18	1220	\N	42597	\N
45659	GENERIC_DAY	1	0	f	2010-08-28	1220	\N	42597	\N
45660	GENERIC_DAY	1	0	f	2010-10-02	1220	\N	42597	\N
45661	GENERIC_DAY	1	0	f	2010-08-22	1220	\N	42597	\N
45662	GENERIC_DAY	1	8	f	2010-10-08	1220	\N	42597	\N
45663	GENERIC_DAY	1	8	f	2010-10-05	1220	\N	42597	\N
45664	GENERIC_DAY	1	8	f	2010-08-26	1220	\N	42597	\N
45665	GENERIC_DAY	1	8	f	2010-09-16	1220	\N	42597	\N
45666	GENERIC_DAY	1	8	f	2010-10-01	1220	\N	42597	\N
45667	GENERIC_DAY	1	8	f	2010-10-07	1220	\N	42597	\N
45668	GENERIC_DAY	1	8	f	2010-10-06	1220	\N	42597	\N
45669	GENERIC_DAY	1	0	f	2010-09-26	1220	\N	42597	\N
45670	GENERIC_DAY	1	8	f	2010-10-12	1220	\N	42597	\N
45671	GENERIC_DAY	1	0	f	2010-09-19	1220	\N	42597	\N
45672	GENERIC_DAY	1	8	f	2010-09-27	1220	\N	42597	\N
45673	GENERIC_DAY	1	0	f	2010-09-12	1220	\N	42597	\N
45674	GENERIC_DAY	1	8	f	2010-08-30	1220	\N	42597	\N
45675	GENERIC_DAY	1	0	f	2010-10-10	1220	\N	42597	\N
45676	GENERIC_DAY	1	8	f	2010-09-20	1220	\N	42597	\N
45677	GENERIC_DAY	1	8	f	2010-10-11	1220	\N	42597	\N
45678	GENERIC_DAY	1	0	f	2010-09-25	1220	\N	42597	\N
45679	GENERIC_DAY	1	8	f	2010-09-23	1220	\N	42597	\N
45680	GENERIC_DAY	1	8	f	2010-09-22	1220	\N	42597	\N
45681	GENERIC_DAY	1	8	f	2010-09-03	1220	\N	42597	\N
45682	GENERIC_DAY	1	8	f	2010-09-15	1220	\N	42597	\N
45683	GENERIC_DAY	1	8	f	2010-09-02	1220	\N	42597	\N
45684	GENERIC_DAY	1	0	f	2010-10-09	1220	\N	42597	\N
45685	GENERIC_DAY	1	8	f	2010-10-04	1220	\N	42597	\N
45686	GENERIC_DAY	1	8	f	2010-09-14	1220	\N	42597	\N
45687	GENERIC_DAY	1	8	f	2010-09-10	1220	\N	42597	\N
45688	GENERIC_DAY	1	8	f	2010-08-31	1220	\N	42597	\N
45689	GENERIC_DAY	1	0	f	2010-09-05	1220	\N	42597	\N
39331	GENERIC_DAY	24	4	f	2010-10-11	4354	\N	27147	\N
39332	GENERIC_DAY	24	4	f	2010-09-27	4352	\N	27147	\N
39333	GENERIC_DAY	24	4	f	2010-09-23	4352	\N	27147	\N
39334	GENERIC_DAY	24	4	f	2010-10-08	4354	\N	27147	\N
39335	GENERIC_DAY	24	0	f	2010-10-03	4354	\N	27147	\N
39336	GENERIC_DAY	24	4	f	2010-09-17	4352	\N	27147	\N
39337	GENERIC_DAY	24	0	f	2010-10-09	4352	\N	27147	\N
39338	GENERIC_DAY	24	4	f	2010-09-22	4352	\N	27147	\N
39339	GENERIC_DAY	24	4	f	2010-09-14	4352	\N	27147	\N
39340	GENERIC_DAY	24	0	f	2010-09-18	4352	\N	27147	\N
39341	GENERIC_DAY	24	4	f	2010-09-28	4352	\N	27147	\N
39342	GENERIC_DAY	24	0	f	2010-10-03	4352	\N	27147	\N
39343	GENERIC_DAY	24	4	f	2010-10-06	4354	\N	27147	\N
39344	GENERIC_DAY	24	1	f	2010-10-14	4352	\N	27147	\N
39345	GENERIC_DAY	24	0	f	2010-09-19	4354	\N	27147	\N
39346	GENERIC_DAY	24	4	f	2010-09-17	4354	\N	27147	\N
39347	GENERIC_DAY	24	4	f	2010-10-07	4354	\N	27147	\N
39348	GENERIC_DAY	24	0	f	2010-09-11	4354	\N	27147	\N
39349	GENERIC_DAY	24	0	f	2010-09-19	4352	\N	27147	\N
39350	GENERIC_DAY	24	0	f	2010-10-10	4352	\N	27147	\N
39351	GENERIC_DAY	24	4	f	2010-10-12	4352	\N	27147	\N
39352	GENERIC_DAY	24	0	f	2010-09-11	4352	\N	27147	\N
39353	GENERIC_DAY	24	4	f	2010-09-21	4354	\N	27147	\N
39354	GENERIC_DAY	24	4	f	2010-10-13	4352	\N	27147	\N
39355	GENERIC_DAY	24	4	f	2010-10-01	4352	\N	27147	\N
39356	GENERIC_DAY	24	4	f	2010-09-24	4354	\N	27147	\N
39357	GENERIC_DAY	24	4	f	2010-09-23	4354	\N	27147	\N
39358	GENERIC_DAY	24	0	f	2010-09-25	4354	\N	27147	\N
39359	GENERIC_DAY	24	4	f	2010-10-11	4352	\N	27147	\N
39360	GENERIC_DAY	24	4	f	2010-10-12	4354	\N	27147	\N
39361	GENERIC_DAY	24	4	f	2010-09-20	4352	\N	27147	\N
39362	GENERIC_DAY	24	4	f	2010-09-20	4354	\N	27147	\N
39363	GENERIC_DAY	24	4	f	2010-09-16	4354	\N	27147	\N
39364	GENERIC_DAY	24	4	f	2010-09-24	4352	\N	27147	\N
39365	GENERIC_DAY	24	4	f	2010-10-06	4352	\N	27147	\N
39366	GENERIC_DAY	24	4	f	2010-09-28	4354	\N	27147	\N
39367	GENERIC_DAY	24	4	f	2010-09-22	4354	\N	27147	\N
39368	GENERIC_DAY	24	0	f	2010-09-12	4354	\N	27147	\N
39369	GENERIC_DAY	24	4	f	2010-09-13	4352	\N	27147	\N
39370	GENERIC_DAY	24	0	f	2010-10-02	4354	\N	27147	\N
39371	GENERIC_DAY	24	4	f	2010-10-05	4354	\N	27147	\N
39372	GENERIC_DAY	24	4	f	2010-09-30	4352	\N	27147	\N
39373	GENERIC_DAY	24	4	f	2010-09-30	4354	\N	27147	\N
39374	GENERIC_DAY	24	4	f	2010-09-09	4354	\N	27147	\N
39375	GENERIC_DAY	24	0	f	2010-09-26	4354	\N	27147	\N
39376	GENERIC_DAY	24	4	f	2010-10-05	4352	\N	27147	\N
39377	GENERIC_DAY	24	4	f	2010-09-10	4352	\N	27147	\N
39378	GENERIC_DAY	24	0	f	2010-10-02	4352	\N	27147	\N
39379	GENERIC_DAY	24	0	f	2010-09-12	4352	\N	27147	\N
39380	GENERIC_DAY	24	4	f	2010-09-09	4352	\N	27147	\N
39381	GENERIC_DAY	24	4	f	2010-09-27	4354	\N	27147	\N
39382	GENERIC_DAY	24	4	f	2010-09-13	4354	\N	27147	\N
39383	GENERIC_DAY	24	4	f	2010-09-10	4354	\N	27147	\N
39384	GENERIC_DAY	24	4	f	2010-09-08	4354	\N	27147	\N
39385	GENERIC_DAY	24	0	f	2010-10-09	4354	\N	27147	\N
39386	GENERIC_DAY	24	4	f	2010-09-29	4354	\N	27147	\N
39387	GENERIC_DAY	24	0	f	2010-09-26	4352	\N	27147	\N
39388	GENERIC_DAY	24	4	f	2010-09-15	4354	\N	27147	\N
39389	GENERIC_DAY	24	4	f	2010-10-07	4352	\N	27147	\N
39390	GENERIC_DAY	24	4	f	2010-10-01	4354	\N	27147	\N
39391	GENERIC_DAY	24	4	f	2010-10-08	4352	\N	27147	\N
39392	GENERIC_DAY	24	0	f	2010-09-18	4354	\N	27147	\N
39393	GENERIC_DAY	24	4	f	2010-09-16	4352	\N	27147	\N
39394	GENERIC_DAY	24	4	f	2010-09-08	4352	\N	27147	\N
39395	GENERIC_DAY	24	4	f	2010-10-04	4354	\N	27147	\N
39396	GENERIC_DAY	24	4	f	2010-09-15	4352	\N	27147	\N
39397	GENERIC_DAY	24	4	f	2010-09-29	4352	\N	27147	\N
39398	GENERIC_DAY	24	4	f	2010-10-04	4352	\N	27147	\N
39399	GENERIC_DAY	24	0	f	2010-10-10	4354	\N	27147	\N
39400	GENERIC_DAY	24	4	f	2010-09-21	4352	\N	27147	\N
39401	GENERIC_DAY	24	0	f	2010-09-25	4352	\N	27147	\N
39402	GENERIC_DAY	24	1	f	2010-10-14	4354	\N	27147	\N
39403	GENERIC_DAY	24	4	f	2010-09-14	4354	\N	27147	\N
39404	GENERIC_DAY	24	4	f	2010-10-13	4354	\N	27147	\N
39405	GENERIC_DAY	23	2	f	2010-09-16	4350	\N	27148	\N
39406	GENERIC_DAY	23	2	f	2010-09-08	4350	\N	27148	\N
39407	GENERIC_DAY	23	2	f	2010-09-22	4350	\N	27148	\N
39408	GENERIC_DAY	23	2	f	2010-09-29	4344	\N	27148	\N
39409	GENERIC_DAY	23	2	f	2010-09-14	4348	\N	27148	\N
39410	GENERIC_DAY	23	0	f	2010-09-19	4344	\N	27148	\N
39411	GENERIC_DAY	23	2	f	2010-09-22	4348	\N	27148	\N
39412	GENERIC_DAY	23	0	f	2010-10-02	4348	\N	27148	\N
39413	GENERIC_DAY	23	2	f	2010-09-21	4344	\N	27148	\N
39414	GENERIC_DAY	23	0	f	2010-09-11	4344	\N	27148	\N
39415	GENERIC_DAY	23	2	f	2010-09-21	4348	\N	27148	\N
39416	GENERIC_DAY	23	0	f	2010-10-02	4344	\N	27148	\N
39417	GENERIC_DAY	23	0	f	2010-09-25	4348	\N	27148	\N
39418	GENERIC_DAY	23	0	f	2010-10-02	4358	\N	27148	\N
39419	GENERIC_DAY	23	2	f	2010-10-04	4348	\N	27148	\N
39420	GENERIC_DAY	23	0	f	2010-09-26	4350	\N	27148	\N
39421	GENERIC_DAY	23	2	f	2010-09-17	4348	\N	27148	\N
39422	GENERIC_DAY	23	2	f	2010-09-10	4344	\N	27148	\N
39423	GENERIC_DAY	23	2	f	2010-09-21	4350	\N	27148	\N
39424	GENERIC_DAY	23	2	f	2010-09-08	4344	\N	27148	\N
39425	GENERIC_DAY	23	2	f	2010-09-27	4344	\N	27148	\N
39426	GENERIC_DAY	23	2	f	2010-09-30	4344	\N	27148	\N
39427	GENERIC_DAY	23	2	f	2010-09-14	4358	\N	27148	\N
39428	GENERIC_DAY	23	2	f	2010-09-29	4358	\N	27148	\N
39429	GENERIC_DAY	23	2	f	2010-09-20	4350	\N	27148	\N
39430	GENERIC_DAY	23	2	f	2010-09-17	4344	\N	27148	\N
39431	GENERIC_DAY	23	2	f	2010-09-29	4348	\N	27148	\N
39432	GENERIC_DAY	23	2	f	2010-09-10	4358	\N	27148	\N
39433	GENERIC_DAY	23	2	f	2010-09-13	4350	\N	27148	\N
39434	GENERIC_DAY	23	2	f	2010-09-28	4344	\N	27148	\N
39435	GENERIC_DAY	23	2	f	2010-09-13	4344	\N	27148	\N
39436	GENERIC_DAY	23	0	f	2010-10-03	4350	\N	27148	\N
39437	GENERIC_DAY	23	2	f	2010-09-09	4344	\N	27148	\N
39438	GENERIC_DAY	23	0	f	2010-09-18	4344	\N	27148	\N
39439	GENERIC_DAY	23	2	f	2010-10-01	4358	\N	27148	\N
39440	GENERIC_DAY	23	2	f	2010-09-23	4344	\N	27148	\N
39441	GENERIC_DAY	23	0	f	2010-10-03	4344	\N	27148	\N
39442	GENERIC_DAY	23	2	f	2010-09-17	4358	\N	27148	\N
39443	GENERIC_DAY	23	0	f	2010-09-11	4350	\N	27148	\N
39444	GENERIC_DAY	23	2	f	2010-09-15	4344	\N	27148	\N
39445	GENERIC_DAY	23	2	f	2010-09-28	4350	\N	27148	\N
39446	GENERIC_DAY	23	0	f	2010-09-12	4348	\N	27148	\N
39447	GENERIC_DAY	23	2	f	2010-09-27	4350	\N	27148	\N
39448	GENERIC_DAY	23	0	f	2010-09-12	4350	\N	27148	\N
39449	GENERIC_DAY	23	2	f	2010-09-24	4344	\N	27148	\N
39450	GENERIC_DAY	23	2	f	2010-09-16	4358	\N	27148	\N
39451	GENERIC_DAY	23	2	f	2010-10-01	4348	\N	27148	\N
39452	GENERIC_DAY	23	2	f	2010-09-15	4358	\N	27148	\N
39453	GENERIC_DAY	23	0	f	2010-10-03	4358	\N	27148	\N
39454	GENERIC_DAY	23	2	f	2010-09-16	4348	\N	27148	\N
39455	GENERIC_DAY	23	0	f	2010-09-19	4358	\N	27148	\N
39456	GENERIC_DAY	23	2	f	2010-09-20	4358	\N	27148	\N
39457	GENERIC_DAY	23	2	f	2010-09-09	4358	\N	27148	\N
39458	GENERIC_DAY	23	2	f	2010-09-20	4348	\N	27148	\N
39459	GENERIC_DAY	23	2	f	2010-10-01	4344	\N	27148	\N
39460	GENERIC_DAY	23	2	f	2010-09-30	4350	\N	27148	\N
39461	GENERIC_DAY	23	2	f	2010-09-16	4344	\N	27148	\N
39462	GENERIC_DAY	23	2	f	2010-09-22	4344	\N	27148	\N
39463	GENERIC_DAY	23	2	f	2010-09-14	4350	\N	27148	\N
39464	GENERIC_DAY	23	2	f	2010-09-28	4358	\N	27148	\N
39465	GENERIC_DAY	23	0	f	2010-09-12	4344	\N	27148	\N
39466	GENERIC_DAY	23	0	f	2010-09-19	4348	\N	27148	\N
39467	GENERIC_DAY	23	2	f	2010-09-08	4358	\N	27148	\N
39468	GENERIC_DAY	23	2	f	2010-09-09	4350	\N	27148	\N
39469	GENERIC_DAY	23	0	f	2010-09-18	4358	\N	27148	\N
39470	GENERIC_DAY	23	2	f	2010-09-27	4358	\N	27148	\N
39471	GENERIC_DAY	23	2	f	2010-09-08	4348	\N	27148	\N
39472	GENERIC_DAY	23	2	f	2010-09-22	4358	\N	27148	\N
39473	GENERIC_DAY	23	2	f	2010-09-13	4358	\N	27148	\N
39474	GENERIC_DAY	23	2	f	2010-09-15	4350	\N	27148	\N
39475	GENERIC_DAY	23	1	f	2010-10-04	4358	\N	27148	\N
39476	GENERIC_DAY	23	0	f	2010-09-26	4344	\N	27148	\N
39477	GENERIC_DAY	23	0	f	2010-10-03	4348	\N	27148	\N
39478	GENERIC_DAY	23	2	f	2010-09-24	4350	\N	27148	\N
39479	GENERIC_DAY	23	2	f	2010-09-28	4348	\N	27148	\N
39480	GENERIC_DAY	23	2	f	2010-10-04	4344	\N	27148	\N
39481	GENERIC_DAY	23	0	f	2010-09-26	4348	\N	27148	\N
39482	GENERIC_DAY	23	2	f	2010-09-24	4348	\N	27148	\N
39483	GENERIC_DAY	23	2	f	2010-10-01	4350	\N	27148	\N
39484	GENERIC_DAY	23	2	f	2010-09-29	4350	\N	27148	\N
39485	GENERIC_DAY	23	2	f	2010-09-13	4348	\N	27148	\N
39486	GENERIC_DAY	23	2	f	2010-09-30	4358	\N	27148	\N
39487	GENERIC_DAY	23	0	f	2010-09-18	4350	\N	27148	\N
39488	GENERIC_DAY	23	1	f	2010-10-04	4350	\N	27148	\N
39489	GENERIC_DAY	23	2	f	2010-09-24	4358	\N	27148	\N
39490	GENERIC_DAY	23	2	f	2010-09-21	4358	\N	27148	\N
39491	GENERIC_DAY	23	0	f	2010-09-11	4348	\N	27148	\N
39492	GENERIC_DAY	23	2	f	2010-09-15	4348	\N	27148	\N
39493	GENERIC_DAY	23	2	f	2010-09-10	4348	\N	27148	\N
39494	GENERIC_DAY	23	0	f	2010-09-19	4350	\N	27148	\N
39495	GENERIC_DAY	23	2	f	2010-09-14	4344	\N	27148	\N
39496	GENERIC_DAY	23	2	f	2010-09-10	4350	\N	27148	\N
39497	GENERIC_DAY	23	2	f	2010-09-23	4358	\N	27148	\N
39498	GENERIC_DAY	23	0	f	2010-10-02	4350	\N	27148	\N
39499	GENERIC_DAY	23	0	f	2010-09-11	4358	\N	27148	\N
39500	GENERIC_DAY	23	2	f	2010-09-27	4348	\N	27148	\N
39501	GENERIC_DAY	23	0	f	2010-09-25	4344	\N	27148	\N
39502	GENERIC_DAY	23	0	f	2010-09-12	4358	\N	27148	\N
39503	GENERIC_DAY	23	0	f	2010-09-18	4348	\N	27148	\N
39504	GENERIC_DAY	23	2	f	2010-09-20	4344	\N	27148	\N
39505	GENERIC_DAY	23	0	f	2010-09-25	4350	\N	27148	\N
39506	GENERIC_DAY	23	2	f	2010-09-23	4348	\N	27148	\N
39507	GENERIC_DAY	23	0	f	2010-09-25	4358	\N	27148	\N
39508	GENERIC_DAY	23	2	f	2010-09-09	4348	\N	27148	\N
39509	GENERIC_DAY	23	2	f	2010-09-17	4350	\N	27148	\N
39510	GENERIC_DAY	23	0	f	2010-09-26	4358	\N	27148	\N
39511	GENERIC_DAY	23	2	f	2010-09-30	4348	\N	27148	\N
39512	GENERIC_DAY	23	2	f	2010-09-23	4350	\N	27148	\N
39513	GENERIC_DAY	22	0	f	2010-09-19	4344	\N	27149	\N
39514	GENERIC_DAY	22	0	f	2010-09-19	4350	\N	27149	\N
39515	GENERIC_DAY	22	2	f	2010-09-16	4350	\N	27149	\N
39516	GENERIC_DAY	22	2	f	2010-09-21	4358	\N	27149	\N
39517	GENERIC_DAY	22	0	f	2010-09-11	4344	\N	27149	\N
39518	GENERIC_DAY	22	0	f	2010-09-11	4348	\N	27149	\N
39519	GENERIC_DAY	22	2	f	2010-09-13	4344	\N	27149	\N
39520	GENERIC_DAY	22	2	f	2010-09-13	4350	\N	27149	\N
39521	GENERIC_DAY	22	2	f	2010-09-08	4344	\N	27149	\N
39522	GENERIC_DAY	22	2	f	2010-09-08	4358	\N	27149	\N
39523	GENERIC_DAY	22	2	f	2010-09-17	4344	\N	27149	\N
39524	GENERIC_DAY	22	0	f	2010-09-18	4358	\N	27149	\N
39525	GENERIC_DAY	22	0	f	2010-09-12	4348	\N	27149	\N
39526	GENERIC_DAY	22	2	f	2010-09-15	4348	\N	27149	\N
39527	GENERIC_DAY	22	2	f	2010-09-15	4358	\N	27149	\N
39528	GENERIC_DAY	22	2	f	2010-09-20	4358	\N	27149	\N
39529	GENERIC_DAY	22	0	f	2010-09-18	4350	\N	27149	\N
39530	GENERIC_DAY	22	2	f	2010-09-09	4344	\N	27149	\N
39531	GENERIC_DAY	22	2	f	2010-09-13	4348	\N	27149	\N
39532	GENERIC_DAY	22	2	f	2010-09-14	4348	\N	27149	\N
39533	GENERIC_DAY	22	2	f	2010-09-14	4358	\N	27149	\N
39534	GENERIC_DAY	22	0	f	2010-09-18	4348	\N	27149	\N
39535	GENERIC_DAY	22	2	f	2010-09-15	4350	\N	27149	\N
39536	GENERIC_DAY	22	2	f	2010-09-09	4350	\N	27149	\N
39537	GENERIC_DAY	22	2	f	2010-09-13	4358	\N	27149	\N
39538	GENERIC_DAY	22	2	f	2010-09-15	4344	\N	27149	\N
39539	GENERIC_DAY	22	2	f	2010-09-10	4358	\N	27149	\N
39540	GENERIC_DAY	22	2	f	2010-09-17	4358	\N	27149	\N
39541	GENERIC_DAY	22	2	f	2010-09-14	4350	\N	27149	\N
39542	GENERIC_DAY	22	0	f	2010-09-12	4358	\N	27149	\N
39543	GENERIC_DAY	22	2	f	2010-09-23	4348	\N	27149	\N
39544	GENERIC_DAY	22	0	f	2010-09-18	4344	\N	27149	\N
39545	GENERIC_DAY	22	2	f	2010-09-21	4344	\N	27149	\N
39546	GENERIC_DAY	22	2	f	2010-09-16	4348	\N	27149	\N
39547	GENERIC_DAY	22	2	f	2010-09-20	4344	\N	27149	\N
39548	GENERIC_DAY	22	0	f	2010-09-19	4348	\N	27149	\N
39549	GENERIC_DAY	22	2	f	2010-09-22	4348	\N	27149	\N
39550	GENERIC_DAY	22	1	f	2010-09-24	4358	\N	27149	\N
39551	GENERIC_DAY	22	2	f	2010-09-10	4348	\N	27149	\N
39552	GENERIC_DAY	22	2	f	2010-09-20	4350	\N	27149	\N
39553	GENERIC_DAY	22	2	f	2010-09-22	4350	\N	27149	\N
39554	GENERIC_DAY	22	0	f	2010-09-12	4344	\N	27149	\N
39555	GENERIC_DAY	22	2	f	2010-09-21	4350	\N	27149	\N
39556	GENERIC_DAY	22	1	f	2010-09-24	4350	\N	27149	\N
39557	GENERIC_DAY	22	2	f	2010-09-21	4348	\N	27149	\N
39558	GENERIC_DAY	22	0	f	2010-09-19	4358	\N	27149	\N
39559	GENERIC_DAY	22	2	f	2010-09-10	4350	\N	27149	\N
39560	GENERIC_DAY	22	2	f	2010-09-23	4358	\N	27149	\N
39561	GENERIC_DAY	22	2	f	2010-09-22	4344	\N	27149	\N
39562	GENERIC_DAY	22	1	f	2010-09-24	4348	\N	27149	\N
39563	GENERIC_DAY	22	2	f	2010-09-08	4348	\N	27149	\N
39564	GENERIC_DAY	22	0	f	2010-09-11	4350	\N	27149	\N
39565	GENERIC_DAY	22	2	f	2010-09-08	4350	\N	27149	\N
39566	GENERIC_DAY	22	2	f	2010-09-14	4344	\N	27149	\N
39567	GENERIC_DAY	22	2	f	2010-09-16	4344	\N	27149	\N
39568	GENERIC_DAY	22	2	f	2010-09-24	4344	\N	27149	\N
39569	GENERIC_DAY	22	2	f	2010-09-17	4350	\N	27149	\N
39570	GENERIC_DAY	22	2	f	2010-09-10	4344	\N	27149	\N
39571	GENERIC_DAY	22	2	f	2010-09-23	4344	\N	27149	\N
39572	GENERIC_DAY	22	2	f	2010-09-16	4358	\N	27149	\N
39573	GENERIC_DAY	22	2	f	2010-09-09	4348	\N	27149	\N
39574	GENERIC_DAY	22	2	f	2010-09-23	4350	\N	27149	\N
39575	GENERIC_DAY	22	0	f	2010-09-12	4350	\N	27149	\N
39576	GENERIC_DAY	22	2	f	2010-09-09	4358	\N	27149	\N
39577	GENERIC_DAY	22	2	f	2010-09-17	4348	\N	27149	\N
39578	GENERIC_DAY	22	0	f	2010-09-11	4358	\N	27149	\N
39579	GENERIC_DAY	22	2	f	2010-09-22	4358	\N	27149	\N
39580	GENERIC_DAY	22	2	f	2010-09-20	4348	\N	27149	\N
39581	GENERIC_DAY	21	0	f	2010-10-10	4352	\N	27150	\N
39582	GENERIC_DAY	21	4	f	2010-11-01	4352	\N	27150	\N
39583	GENERIC_DAY	21	4	f	2010-11-04	4352	\N	27150	\N
39584	GENERIC_DAY	21	4	f	2010-10-27	4354	\N	27150	\N
39585	GENERIC_DAY	21	4	f	2010-10-06	4352	\N	27150	\N
39586	GENERIC_DAY	21	0	f	2010-10-30	4352	\N	27150	\N
39587	GENERIC_DAY	21	4	f	2010-10-12	4354	\N	27150	\N
39588	GENERIC_DAY	21	0	f	2010-11-06	4354	\N	27150	\N
39589	GENERIC_DAY	21	4	f	2010-10-25	4352	\N	27150	\N
39590	GENERIC_DAY	21	0	f	2010-10-16	4354	\N	27150	\N
39591	GENERIC_DAY	21	4	f	2010-10-05	4354	\N	27150	\N
39592	GENERIC_DAY	21	4	f	2010-10-20	4354	\N	27150	\N
39593	GENERIC_DAY	21	4	f	2010-10-11	4352	\N	27150	\N
39594	GENERIC_DAY	21	4	f	2010-10-06	4354	\N	27150	\N
39595	GENERIC_DAY	21	0	f	2010-10-09	4354	\N	27150	\N
39596	GENERIC_DAY	21	4	f	2010-10-20	4352	\N	27150	\N
39597	GENERIC_DAY	21	4	f	2010-10-08	4352	\N	27150	\N
39598	GENERIC_DAY	21	4	f	2010-10-15	4352	\N	27150	\N
39599	GENERIC_DAY	21	4	f	2010-10-12	4352	\N	27150	\N
39600	GENERIC_DAY	21	4	f	2010-11-08	4352	\N	27150	\N
39601	GENERIC_DAY	21	4	f	2010-10-26	4354	\N	27150	\N
39602	GENERIC_DAY	21	4	f	2010-10-18	4354	\N	27150	\N
39603	GENERIC_DAY	21	0	f	2010-10-24	4352	\N	27150	\N
39604	GENERIC_DAY	21	0	f	2010-10-31	4352	\N	27150	\N
39605	GENERIC_DAY	21	0	f	2010-10-23	4354	\N	27150	\N
39606	GENERIC_DAY	21	0	f	2010-10-09	4352	\N	27150	\N
39607	GENERIC_DAY	21	4	f	2010-10-08	4354	\N	27150	\N
39608	GENERIC_DAY	21	4	f	2010-11-02	4352	\N	27150	\N
39609	GENERIC_DAY	21	4	f	2010-10-13	4354	\N	27150	\N
39610	GENERIC_DAY	21	4	f	2010-11-05	4354	\N	27150	\N
39611	GENERIC_DAY	21	4	f	2010-10-27	4352	\N	27150	\N
39612	GENERIC_DAY	21	0	f	2010-10-30	4354	\N	27150	\N
39613	GENERIC_DAY	21	4	f	2010-10-29	4354	\N	27150	\N
39614	GENERIC_DAY	21	0	f	2010-10-16	4352	\N	27150	\N
39615	GENERIC_DAY	21	4	f	2010-10-14	4352	\N	27150	\N
39616	GENERIC_DAY	21	0	f	2010-10-23	4352	\N	27150	\N
39617	GENERIC_DAY	21	4	f	2010-11-01	4354	\N	27150	\N
39618	GENERIC_DAY	21	0	f	2010-10-10	4354	\N	27150	\N
39619	GENERIC_DAY	21	4	f	2010-10-07	4352	\N	27150	\N
39620	GENERIC_DAY	21	4	f	2010-10-21	4354	\N	27150	\N
39621	GENERIC_DAY	21	4	f	2010-10-21	4352	\N	27150	\N
39622	GENERIC_DAY	21	4	f	2010-10-18	4352	\N	27150	\N
39623	GENERIC_DAY	21	0	f	2010-11-07	4354	\N	27150	\N
39624	GENERIC_DAY	21	0	f	2010-10-17	4354	\N	27150	\N
39625	GENERIC_DAY	21	4	f	2010-10-15	4354	\N	27150	\N
39626	GENERIC_DAY	21	4	f	2010-11-04	4354	\N	27150	\N
39627	GENERIC_DAY	21	4	f	2010-11-08	4354	\N	27150	\N
39628	GENERIC_DAY	21	4	f	2010-11-03	4354	\N	27150	\N
39629	GENERIC_DAY	21	4	f	2010-11-02	4354	\N	27150	\N
39630	GENERIC_DAY	21	4	f	2010-11-03	4352	\N	27150	\N
39631	GENERIC_DAY	21	4	f	2010-10-11	4354	\N	27150	\N
39632	GENERIC_DAY	21	4	f	2010-10-22	4354	\N	27150	\N
39633	GENERIC_DAY	21	4	f	2010-10-28	4352	\N	27150	\N
39634	GENERIC_DAY	21	4	f	2010-10-19	4354	\N	27150	\N
39635	GENERIC_DAY	21	0	f	2010-10-24	4354	\N	27150	\N
39636	GENERIC_DAY	21	0	f	2010-10-31	4354	\N	27150	\N
39637	GENERIC_DAY	21	4	f	2010-10-14	4354	\N	27150	\N
39638	GENERIC_DAY	21	4	f	2010-10-07	4354	\N	27150	\N
39639	GENERIC_DAY	21	0	f	2010-11-06	4352	\N	27150	\N
39640	GENERIC_DAY	21	4	f	2010-11-05	4352	\N	27150	\N
39641	GENERIC_DAY	21	4	f	2010-10-25	4354	\N	27150	\N
39642	GENERIC_DAY	21	4	f	2010-10-22	4352	\N	27150	\N
39643	GENERIC_DAY	21	4	f	2010-10-28	4354	\N	27150	\N
39644	GENERIC_DAY	21	4	f	2010-10-29	4352	\N	27150	\N
39645	GENERIC_DAY	21	4	f	2010-10-05	4352	\N	27150	\N
39646	GENERIC_DAY	21	0	f	2010-11-07	4352	\N	27150	\N
39647	GENERIC_DAY	21	4	f	2010-10-13	4352	\N	27150	\N
39648	GENERIC_DAY	21	0	f	2010-10-17	4352	\N	27150	\N
39649	GENERIC_DAY	21	4	f	2010-10-26	4352	\N	27150	\N
39650	GENERIC_DAY	21	4	f	2010-10-19	4352	\N	27150	\N
39651	GENERIC_DAY	20	4	f	2010-10-19	4354	\N	27151	\N
39652	GENERIC_DAY	20	2	f	2010-11-02	4354	\N	27151	\N
39653	GENERIC_DAY	20	4	f	2010-11-01	4354	\N	27151	\N
39654	GENERIC_DAY	20	2	f	2010-11-02	4352	\N	27151	\N
39655	GENERIC_DAY	20	4	f	2010-10-20	4352	\N	27151	\N
39656	GENERIC_DAY	20	0	f	2010-10-30	4354	\N	27151	\N
39657	GENERIC_DAY	20	4	f	2010-10-20	4354	\N	27151	\N
39658	GENERIC_DAY	20	0	f	2010-10-31	4352	\N	27151	\N
39659	GENERIC_DAY	20	4	f	2010-11-01	4352	\N	27151	\N
39660	GENERIC_DAY	20	4	f	2010-10-18	4352	\N	27151	\N
39661	GENERIC_DAY	20	4	f	2010-10-15	4354	\N	27151	\N
39662	GENERIC_DAY	20	4	f	2010-10-19	4352	\N	27151	\N
39663	GENERIC_DAY	20	4	f	2010-10-28	4352	\N	27151	\N
39664	GENERIC_DAY	20	4	f	2010-10-27	4352	\N	27151	\N
39665	GENERIC_DAY	20	4	f	2010-10-18	4354	\N	27151	\N
39666	GENERIC_DAY	20	0	f	2010-10-16	4352	\N	27151	\N
39667	GENERIC_DAY	20	0	f	2010-10-17	4354	\N	27151	\N
39668	GENERIC_DAY	20	4	f	2010-10-29	4352	\N	27151	\N
39669	GENERIC_DAY	20	4	f	2010-10-25	4352	\N	27151	\N
39670	GENERIC_DAY	20	4	f	2010-10-29	4354	\N	27151	\N
39671	GENERIC_DAY	20	4	f	2010-10-21	4352	\N	27151	\N
39672	GENERIC_DAY	20	4	f	2010-10-26	4352	\N	27151	\N
39673	GENERIC_DAY	20	4	f	2010-10-21	4354	\N	27151	\N
39674	GENERIC_DAY	20	0	f	2010-10-24	4352	\N	27151	\N
39675	GENERIC_DAY	20	4	f	2010-10-28	4354	\N	27151	\N
39676	GENERIC_DAY	20	4	f	2010-10-22	4352	\N	27151	\N
39677	GENERIC_DAY	20	0	f	2010-10-30	4352	\N	27151	\N
39678	GENERIC_DAY	20	4	f	2010-10-26	4354	\N	27151	\N
39679	GENERIC_DAY	20	0	f	2010-10-24	4354	\N	27151	\N
39680	GENERIC_DAY	20	4	f	2010-10-27	4354	\N	27151	\N
39681	GENERIC_DAY	20	0	f	2010-10-23	4354	\N	27151	\N
39682	GENERIC_DAY	20	4	f	2010-10-15	4352	\N	27151	\N
39683	GENERIC_DAY	20	0	f	2010-10-31	4354	\N	27151	\N
39684	GENERIC_DAY	20	4	f	2010-10-25	4354	\N	27151	\N
39685	GENERIC_DAY	20	0	f	2010-10-23	4352	\N	27151	\N
39686	GENERIC_DAY	20	0	f	2010-10-17	4352	\N	27151	\N
39687	GENERIC_DAY	20	4	f	2010-10-22	4354	\N	27151	\N
39688	GENERIC_DAY	20	0	f	2010-10-16	4354	\N	27151	\N
39689	GENERIC_DAY	19	0	f	2010-10-16	4352	\N	27152	\N
39690	GENERIC_DAY	19	4	f	2010-10-28	4352	\N	27152	\N
39691	GENERIC_DAY	19	4	f	2010-10-11	4352	\N	27152	\N
39692	GENERIC_DAY	19	0	f	2010-09-26	4352	\N	27152	\N
39693	GENERIC_DAY	19	0	f	2010-10-02	4352	\N	27152	\N
39694	GENERIC_DAY	19	0	f	2010-10-17	4352	\N	27152	\N
39695	GENERIC_DAY	19	4	f	2010-10-20	4352	\N	27152	\N
39696	GENERIC_DAY	19	4	f	2010-09-29	4354	\N	27152	\N
39697	GENERIC_DAY	19	4	f	2010-10-27	4352	\N	27152	\N
39698	GENERIC_DAY	19	0	f	2010-10-23	4354	\N	27152	\N
39699	GENERIC_DAY	19	4	f	2010-10-28	4354	\N	27152	\N
39700	GENERIC_DAY	19	4	f	2010-10-18	4352	\N	27152	\N
39701	GENERIC_DAY	19	4	f	2010-10-12	4354	\N	27152	\N
39702	GENERIC_DAY	19	4	f	2010-10-11	4354	\N	27152	\N
39703	GENERIC_DAY	19	4	f	2010-10-05	4354	\N	27152	\N
39704	GENERIC_DAY	19	4	f	2010-10-22	4354	\N	27152	\N
39705	GENERIC_DAY	19	4	f	2010-10-26	4352	\N	27152	\N
39706	GENERIC_DAY	19	4	f	2010-10-13	4352	\N	27152	\N
39707	GENERIC_DAY	19	4	f	2010-09-29	4352	\N	27152	\N
39708	GENERIC_DAY	19	4	f	2010-10-15	4352	\N	27152	\N
39709	GENERIC_DAY	19	4	f	2010-10-26	4354	\N	27152	\N
39710	GENERIC_DAY	19	4	f	2010-10-07	4352	\N	27152	\N
39711	GENERIC_DAY	19	4	f	2010-10-27	4354	\N	27152	\N
39712	GENERIC_DAY	19	4	f	2010-10-13	4354	\N	27152	\N
39713	GENERIC_DAY	19	4	f	2010-10-08	4352	\N	27152	\N
39714	GENERIC_DAY	19	4	f	2010-10-05	4352	\N	27152	\N
39715	GENERIC_DAY	19	0	f	2010-10-23	4352	\N	27152	\N
39716	GENERIC_DAY	19	0	f	2010-10-10	4352	\N	27152	\N
39717	GENERIC_DAY	19	4	f	2010-10-12	4352	\N	27152	\N
39718	GENERIC_DAY	19	4	f	2010-10-06	4354	\N	27152	\N
39719	GENERIC_DAY	19	4	f	2010-10-14	4354	\N	27152	\N
39720	GENERIC_DAY	19	4	f	2010-10-29	4354	\N	27152	\N
39721	GENERIC_DAY	19	4	f	2010-10-25	4352	\N	27152	\N
39722	GENERIC_DAY	19	4	f	2010-09-27	4352	\N	27152	\N
39723	GENERIC_DAY	19	4	f	2010-10-18	4354	\N	27152	\N
39724	GENERIC_DAY	19	4	f	2010-10-19	4354	\N	27152	\N
39725	GENERIC_DAY	19	0	f	2010-10-10	4354	\N	27152	\N
39726	GENERIC_DAY	19	0	f	2010-10-02	4354	\N	27152	\N
39727	GENERIC_DAY	19	4	f	2010-10-14	4352	\N	27152	\N
39728	GENERIC_DAY	19	0	f	2010-10-09	4352	\N	27152	\N
39729	GENERIC_DAY	19	4	f	2010-10-07	4354	\N	27152	\N
39730	GENERIC_DAY	19	4	f	2010-10-20	4354	\N	27152	\N
39731	GENERIC_DAY	19	0	f	2010-10-24	4352	\N	27152	\N
39732	GENERIC_DAY	19	4	f	2010-10-25	4354	\N	27152	\N
39733	GENERIC_DAY	19	4	f	2010-09-28	4354	\N	27152	\N
39734	GENERIC_DAY	19	0	f	2010-10-03	4354	\N	27152	\N
39735	GENERIC_DAY	19	0	f	2010-09-26	4354	\N	27152	\N
39736	GENERIC_DAY	19	0	f	2010-10-09	4354	\N	27152	\N
39737	GENERIC_DAY	19	4	f	2010-10-08	4354	\N	27152	\N
39738	GENERIC_DAY	19	0	f	2010-09-25	4354	\N	27152	\N
39739	GENERIC_DAY	19	4	f	2010-10-01	4352	\N	27152	\N
39740	GENERIC_DAY	19	4	f	2010-10-15	4354	\N	27152	\N
39741	GENERIC_DAY	19	0	f	2010-10-24	4354	\N	27152	\N
39742	GENERIC_DAY	19	4	f	2010-10-04	4354	\N	27152	\N
39743	GENERIC_DAY	19	0	f	2010-10-03	4352	\N	27152	\N
39744	GENERIC_DAY	19	0	f	2010-10-17	4354	\N	27152	\N
39745	GENERIC_DAY	19	4	f	2010-10-21	4352	\N	27152	\N
39746	GENERIC_DAY	19	4	f	2010-09-28	4352	\N	27152	\N
39747	GENERIC_DAY	19	4	f	2010-10-21	4354	\N	27152	\N
39748	GENERIC_DAY	19	0	f	2010-09-25	4352	\N	27152	\N
39749	GENERIC_DAY	19	4	f	2010-10-19	4352	\N	27152	\N
39750	GENERIC_DAY	19	4	f	2010-10-29	4352	\N	27152	\N
39751	GENERIC_DAY	19	4	f	2010-09-30	4354	\N	27152	\N
39752	GENERIC_DAY	19	4	f	2010-09-27	4354	\N	27152	\N
39753	GENERIC_DAY	19	4	f	2010-09-30	4352	\N	27152	\N
39754	GENERIC_DAY	19	4	f	2010-10-06	4352	\N	27152	\N
39755	GENERIC_DAY	19	4	f	2010-10-01	4354	\N	27152	\N
39756	GENERIC_DAY	19	0	f	2010-10-16	4354	\N	27152	\N
39757	GENERIC_DAY	19	4	f	2010-10-04	4352	\N	27152	\N
39758	GENERIC_DAY	19	4	f	2010-10-22	4352	\N	27152	\N
39759	GENERIC_DAY	18	4	f	2010-09-08	4352	\N	27153	\N
39760	GENERIC_DAY	18	0	f	2010-10-03	4354	\N	27153	\N
39761	GENERIC_DAY	18	4	f	2010-10-11	4354	\N	27153	\N
39762	GENERIC_DAY	18	4	f	2010-09-20	4352	\N	27153	\N
39763	GENERIC_DAY	18	4	f	2010-09-13	4354	\N	27153	\N
39764	GENERIC_DAY	18	0	f	2010-10-09	4354	\N	27153	\N
39765	GENERIC_DAY	18	4	f	2010-09-09	4352	\N	27153	\N
39766	GENERIC_DAY	18	0	f	2010-10-03	4352	\N	27153	\N
39767	GENERIC_DAY	18	0	f	2010-09-26	4354	\N	27153	\N
39768	GENERIC_DAY	18	4	f	2010-09-21	4354	\N	27153	\N
39769	GENERIC_DAY	18	4	f	2010-09-10	4352	\N	27153	\N
39770	GENERIC_DAY	18	4	f	2010-09-16	4354	\N	27153	\N
39771	GENERIC_DAY	18	0	f	2010-09-18	4354	\N	27153	\N
39772	GENERIC_DAY	18	4	f	2010-10-08	4352	\N	27153	\N
39773	GENERIC_DAY	18	4	f	2010-09-13	4352	\N	27153	\N
39774	GENERIC_DAY	18	4	f	2010-10-07	4354	\N	27153	\N
39775	GENERIC_DAY	18	4	f	2010-09-14	4352	\N	27153	\N
39776	GENERIC_DAY	18	0	f	2010-10-09	4352	\N	27153	\N
39777	GENERIC_DAY	18	4	f	2010-09-20	4354	\N	27153	\N
39778	GENERIC_DAY	18	4	f	2010-10-05	4354	\N	27153	\N
39779	GENERIC_DAY	18	0	f	2010-10-10	4352	\N	27153	\N
39780	GENERIC_DAY	18	4	f	2010-10-08	4354	\N	27153	\N
39781	GENERIC_DAY	18	0	f	2010-10-02	4352	\N	27153	\N
39782	GENERIC_DAY	18	4	f	2010-09-27	4354	\N	27153	\N
39783	GENERIC_DAY	18	0	f	2010-09-11	4352	\N	27153	\N
39784	GENERIC_DAY	18	4	f	2010-09-24	4354	\N	27153	\N
39785	GENERIC_DAY	18	4	f	2010-09-29	4354	\N	27153	\N
39786	GENERIC_DAY	18	0	f	2010-09-12	4354	\N	27153	\N
39787	GENERIC_DAY	18	4	f	2010-09-10	4354	\N	27153	\N
39788	GENERIC_DAY	18	0	f	2010-09-25	4352	\N	27153	\N
39789	GENERIC_DAY	18	0	f	2010-09-11	4354	\N	27153	\N
39790	GENERIC_DAY	18	4	f	2010-09-14	4354	\N	27153	\N
39791	GENERIC_DAY	18	4	f	2010-10-07	4352	\N	27153	\N
39792	GENERIC_DAY	18	0	f	2010-10-10	4354	\N	27153	\N
39793	GENERIC_DAY	18	4	f	2010-09-21	4352	\N	27153	\N
39794	GENERIC_DAY	18	4	f	2010-10-01	4352	\N	27153	\N
39795	GENERIC_DAY	18	0	f	2010-10-02	4354	\N	27153	\N
39796	GENERIC_DAY	18	4	f	2010-09-27	4352	\N	27153	\N
39797	GENERIC_DAY	18	4	f	2010-09-30	4352	\N	27153	\N
39798	GENERIC_DAY	18	4	f	2010-10-05	4352	\N	27153	\N
39799	GENERIC_DAY	18	4	f	2010-09-29	4352	\N	27153	\N
39800	GENERIC_DAY	18	4	f	2010-09-22	4354	\N	27153	\N
39801	GENERIC_DAY	18	4	f	2010-09-17	4354	\N	27153	\N
39802	GENERIC_DAY	18	4	f	2010-10-11	4352	\N	27153	\N
39803	GENERIC_DAY	18	4	f	2010-09-15	4352	\N	27153	\N
39804	GENERIC_DAY	18	4	f	2010-09-17	4352	\N	27153	\N
39805	GENERIC_DAY	18	0	f	2010-09-26	4352	\N	27153	\N
39806	GENERIC_DAY	18	4	f	2010-09-22	4352	\N	27153	\N
39807	GENERIC_DAY	18	4	f	2010-09-09	4354	\N	27153	\N
39808	GENERIC_DAY	18	0	f	2010-09-19	4352	\N	27153	\N
39809	GENERIC_DAY	18	4	f	2010-10-12	4354	\N	27153	\N
39810	GENERIC_DAY	18	4	f	2010-09-28	4352	\N	27153	\N
39811	GENERIC_DAY	18	4	f	2010-10-01	4354	\N	27153	\N
39812	GENERIC_DAY	18	4	f	2010-09-30	4354	\N	27153	\N
39813	GENERIC_DAY	18	4	f	2010-09-23	4354	\N	27153	\N
39814	GENERIC_DAY	18	4	f	2010-10-04	4352	\N	27153	\N
39815	GENERIC_DAY	18	4	f	2010-10-04	4354	\N	27153	\N
39816	GENERIC_DAY	18	4	f	2010-09-15	4354	\N	27153	\N
39817	GENERIC_DAY	18	4	f	2010-09-28	4354	\N	27153	\N
39818	GENERIC_DAY	18	4	f	2010-10-12	4352	\N	27153	\N
39819	GENERIC_DAY	18	4	f	2010-10-06	4352	\N	27153	\N
39820	GENERIC_DAY	18	4	f	2010-10-06	4354	\N	27153	\N
39821	GENERIC_DAY	18	0	f	2010-09-18	4352	\N	27153	\N
39822	GENERIC_DAY	18	4	f	2010-09-08	4354	\N	27153	\N
39823	GENERIC_DAY	18	4	f	2010-09-24	4352	\N	27153	\N
39824	GENERIC_DAY	18	0	f	2010-09-19	4354	\N	27153	\N
39825	GENERIC_DAY	18	0	f	2010-09-25	4354	\N	27153	\N
39826	GENERIC_DAY	18	4	f	2010-09-23	4352	\N	27153	\N
39827	GENERIC_DAY	18	0	f	2010-09-12	4352	\N	27153	\N
39828	GENERIC_DAY	18	4	f	2010-09-16	4352	\N	27153	\N
39829	GENERIC_DAY	17	4	f	2011-01-12	4354	\N	27154	\N
39830	GENERIC_DAY	17	4	f	2011-01-11	4352	\N	27154	\N
39831	GENERIC_DAY	17	4	f	2011-01-07	4352	\N	27154	\N
39832	GENERIC_DAY	17	4	f	2010-12-13	4352	\N	27154	\N
39833	GENERIC_DAY	17	4	f	2011-01-11	4354	\N	27154	\N
39834	GENERIC_DAY	17	0	f	2010-12-04	4354	\N	27154	\N
39835	GENERIC_DAY	17	4	f	2010-12-13	4354	\N	27154	\N
39836	GENERIC_DAY	17	0	f	2011-01-16	4354	\N	27154	\N
39837	GENERIC_DAY	17	4	f	2010-12-20	4352	\N	27154	\N
39838	GENERIC_DAY	17	0	f	2010-12-19	4354	\N	27154	\N
39839	GENERIC_DAY	17	4	f	2010-12-15	4352	\N	27154	\N
39840	GENERIC_DAY	17	4	f	2011-01-14	4352	\N	27154	\N
39841	GENERIC_DAY	17	4	f	2010-12-23	4354	\N	27154	\N
39842	GENERIC_DAY	17	0	f	2010-11-21	4354	\N	27154	\N
39843	GENERIC_DAY	17	4	f	2010-12-08	4352	\N	27154	\N
39844	GENERIC_DAY	17	4	f	2010-11-19	4354	\N	27154	\N
39845	GENERIC_DAY	17	4	f	2010-12-24	4354	\N	27154	\N
39846	GENERIC_DAY	17	0	f	2010-12-25	4354	\N	27154	\N
39847	GENERIC_DAY	17	4	f	2010-11-16	4352	\N	27154	\N
39848	GENERIC_DAY	17	4	f	2010-12-09	4354	\N	27154	\N
39849	GENERIC_DAY	17	4	f	2010-11-12	4354	\N	27154	\N
39850	GENERIC_DAY	17	0	f	2010-12-12	4354	\N	27154	\N
39851	GENERIC_DAY	17	4	f	2010-11-23	4352	\N	27154	\N
39852	GENERIC_DAY	17	4	f	2010-12-23	4352	\N	27154	\N
39853	GENERIC_DAY	17	0	f	2011-01-01	4354	\N	27154	\N
39854	GENERIC_DAY	17	0	f	2010-11-27	4352	\N	27154	\N
39855	GENERIC_DAY	17	4	f	2010-12-07	4352	\N	27154	\N
39856	GENERIC_DAY	17	4	f	2010-12-01	4352	\N	27154	\N
39857	GENERIC_DAY	17	0	f	2010-11-21	4352	\N	27154	\N
39858	GENERIC_DAY	17	4	f	2011-01-05	4354	\N	27154	\N
39859	GENERIC_DAY	17	0	f	2010-11-14	4352	\N	27154	\N
39860	GENERIC_DAY	17	4	f	2010-11-24	4352	\N	27154	\N
39861	GENERIC_DAY	17	4	f	2010-12-30	4354	\N	27154	\N
39862	GENERIC_DAY	17	4	f	2010-11-24	4354	\N	27154	\N
39863	GENERIC_DAY	17	0	f	2011-01-08	4352	\N	27154	\N
39864	GENERIC_DAY	17	4	f	2010-12-20	4354	\N	27154	\N
39865	GENERIC_DAY	17	0	f	2010-12-12	4352	\N	27154	\N
39866	GENERIC_DAY	17	0	f	2010-12-04	4352	\N	27154	\N
39867	GENERIC_DAY	17	0	f	2010-12-18	4354	\N	27154	\N
39868	GENERIC_DAY	17	4	f	2011-01-07	4354	\N	27154	\N
39869	GENERIC_DAY	17	4	f	2010-11-29	4352	\N	27154	\N
39870	GENERIC_DAY	17	4	f	2011-01-04	4352	\N	27154	\N
39871	GENERIC_DAY	17	4	f	2010-11-30	4354	\N	27154	\N
39872	GENERIC_DAY	17	4	f	2010-12-31	4352	\N	27154	\N
39873	GENERIC_DAY	17	0	f	2010-11-13	4352	\N	27154	\N
39874	GENERIC_DAY	17	4	f	2011-01-12	4352	\N	27154	\N
39875	GENERIC_DAY	17	4	f	2010-11-22	4354	\N	27154	\N
39876	GENERIC_DAY	17	0	f	2011-01-09	4352	\N	27154	\N
39877	GENERIC_DAY	17	0	f	2010-12-26	4352	\N	27154	\N
39878	GENERIC_DAY	17	4	f	2010-12-28	4352	\N	27154	\N
39879	GENERIC_DAY	17	4	f	2010-12-21	4354	\N	27154	\N
39880	GENERIC_DAY	17	4	f	2010-12-09	4352	\N	27154	\N
39881	GENERIC_DAY	17	0	f	2011-01-16	4352	\N	27154	\N
39882	GENERIC_DAY	17	4	f	2010-11-26	4354	\N	27154	\N
39883	GENERIC_DAY	17	4	f	2011-01-06	4352	\N	27154	\N
39884	GENERIC_DAY	17	0	f	2010-12-18	4352	\N	27154	\N
39885	GENERIC_DAY	17	4	f	2010-12-10	4352	\N	27154	\N
39886	GENERIC_DAY	17	4	f	2010-12-17	4354	\N	27154	\N
39887	GENERIC_DAY	17	4	f	2010-12-29	4352	\N	27154	\N
39888	GENERIC_DAY	17	4	f	2011-01-03	4352	\N	27154	\N
39889	GENERIC_DAY	17	4	f	2010-12-16	4354	\N	27154	\N
39890	GENERIC_DAY	17	4	f	2010-11-09	4354	\N	27154	\N
39891	GENERIC_DAY	17	4	f	2010-11-12	4352	\N	27154	\N
39892	GENERIC_DAY	17	0	f	2010-12-19	4352	\N	27154	\N
39893	GENERIC_DAY	17	4	f	2011-01-17	4354	\N	27154	\N
39894	GENERIC_DAY	17	0	f	2010-11-20	4354	\N	27154	\N
39895	GENERIC_DAY	17	0	f	2010-12-05	4352	\N	27154	\N
39896	GENERIC_DAY	17	4	f	2010-11-09	4352	\N	27154	\N
39897	GENERIC_DAY	17	4	f	2010-12-31	4354	\N	27154	\N
39898	GENERIC_DAY	17	4	f	2011-01-06	4354	\N	27154	\N
39899	GENERIC_DAY	17	4	f	2010-11-16	4354	\N	27154	\N
39900	GENERIC_DAY	17	0	f	2011-01-15	4354	\N	27154	\N
39901	GENERIC_DAY	17	0	f	2010-12-26	4354	\N	27154	\N
39902	GENERIC_DAY	17	4	f	2010-11-10	4354	\N	27154	\N
39903	GENERIC_DAY	17	4	f	2010-11-23	4354	\N	27154	\N
39904	GENERIC_DAY	17	4	f	2011-01-13	4352	\N	27154	\N
39905	GENERIC_DAY	17	4	f	2010-12-29	4354	\N	27154	\N
39906	GENERIC_DAY	17	4	f	2010-12-01	4354	\N	27154	\N
39907	GENERIC_DAY	17	0	f	2010-11-27	4354	\N	27154	\N
39908	GENERIC_DAY	17	4	f	2010-12-28	4354	\N	27154	\N
39909	GENERIC_DAY	17	0	f	2010-12-05	4354	\N	27154	\N
39910	GENERIC_DAY	17	4	f	2010-11-18	4352	\N	27154	\N
39911	GENERIC_DAY	17	4	f	2010-11-11	4354	\N	27154	\N
39912	GENERIC_DAY	17	4	f	2010-12-07	4354	\N	27154	\N
39913	GENERIC_DAY	17	4	f	2010-12-16	4352	\N	27154	\N
39914	GENERIC_DAY	17	4	f	2011-01-14	4354	\N	27154	\N
39915	GENERIC_DAY	17	4	f	2010-12-02	4354	\N	27154	\N
39916	GENERIC_DAY	17	4	f	2010-12-30	4352	\N	27154	\N
39917	GENERIC_DAY	17	0	f	2011-01-09	4354	\N	27154	\N
39918	GENERIC_DAY	17	0	f	2010-12-25	4352	\N	27154	\N
39919	GENERIC_DAY	17	4	f	2010-11-29	4354	\N	27154	\N
39920	GENERIC_DAY	17	4	f	2010-12-27	4352	\N	27154	\N
39921	GENERIC_DAY	17	0	f	2011-01-15	4352	\N	27154	\N
39922	GENERIC_DAY	17	4	f	2010-11-15	4354	\N	27154	\N
39923	GENERIC_DAY	17	4	f	2010-11-19	4352	\N	27154	\N
39924	GENERIC_DAY	17	4	f	2010-12-17	4352	\N	27154	\N
39925	GENERIC_DAY	17	4	f	2010-12-15	4354	\N	27154	\N
39926	GENERIC_DAY	17	4	f	2010-12-10	4354	\N	27154	\N
39927	GENERIC_DAY	17	4	f	2010-11-11	4352	\N	27154	\N
39928	GENERIC_DAY	17	4	f	2010-12-24	4352	\N	27154	\N
39929	GENERIC_DAY	17	4	f	2010-12-03	4354	\N	27154	\N
39930	GENERIC_DAY	17	4	f	2010-12-22	4352	\N	27154	\N
39931	GENERIC_DAY	17	4	f	2010-12-06	4352	\N	27154	\N
39932	GENERIC_DAY	17	4	f	2010-11-25	4352	\N	27154	\N
39933	GENERIC_DAY	17	4	f	2010-11-30	4352	\N	27154	\N
39934	GENERIC_DAY	17	4	f	2010-12-08	4354	\N	27154	\N
39935	GENERIC_DAY	17	4	f	2010-12-22	4354	\N	27154	\N
39936	GENERIC_DAY	17	4	f	2010-12-21	4352	\N	27154	\N
39937	GENERIC_DAY	17	4	f	2010-12-02	4352	\N	27154	\N
39938	GENERIC_DAY	17	4	f	2010-11-18	4354	\N	27154	\N
39939	GENERIC_DAY	17	0	f	2010-11-14	4354	\N	27154	\N
39940	GENERIC_DAY	17	0	f	2010-12-11	4354	\N	27154	\N
39941	GENERIC_DAY	17	4	f	2010-11-10	4352	\N	27154	\N
39942	GENERIC_DAY	17	4	f	2010-11-15	4352	\N	27154	\N
39943	GENERIC_DAY	17	4	f	2010-12-06	4354	\N	27154	\N
39944	GENERIC_DAY	17	0	f	2010-11-28	4354	\N	27154	\N
39945	GENERIC_DAY	17	4	f	2010-11-22	4352	\N	27154	\N
39946	GENERIC_DAY	17	0	f	2011-01-02	4354	\N	27154	\N
39947	GENERIC_DAY	17	4	f	2011-01-05	4352	\N	27154	\N
39948	GENERIC_DAY	17	4	f	2011-01-03	4354	\N	27154	\N
39949	GENERIC_DAY	17	4	f	2011-01-10	4352	\N	27154	\N
39950	GENERIC_DAY	17	4	f	2010-11-17	4354	\N	27154	\N
39951	GENERIC_DAY	17	0	f	2010-11-13	4354	\N	27154	\N
39952	GENERIC_DAY	17	4	f	2010-11-25	4354	\N	27154	\N
39953	GENERIC_DAY	17	4	f	2010-12-14	4352	\N	27154	\N
39954	GENERIC_DAY	17	4	f	2011-01-17	4352	\N	27154	\N
39955	GENERIC_DAY	17	4	f	2010-12-03	4352	\N	27154	\N
39956	GENERIC_DAY	17	0	f	2011-01-02	4352	\N	27154	\N
39957	GENERIC_DAY	17	0	f	2010-12-11	4352	\N	27154	\N
39958	GENERIC_DAY	17	4	f	2010-12-14	4354	\N	27154	\N
39959	GENERIC_DAY	17	4	f	2011-01-10	4354	\N	27154	\N
39960	GENERIC_DAY	17	4	f	2010-11-26	4352	\N	27154	\N
39961	GENERIC_DAY	17	4	f	2011-01-13	4354	\N	27154	\N
39962	GENERIC_DAY	17	0	f	2010-11-28	4352	\N	27154	\N
39963	GENERIC_DAY	17	4	f	2011-01-04	4354	\N	27154	\N
39964	GENERIC_DAY	17	4	f	2010-12-27	4354	\N	27154	\N
39965	GENERIC_DAY	17	4	f	2010-11-17	4352	\N	27154	\N
39966	GENERIC_DAY	17	0	f	2011-01-08	4354	\N	27154	\N
39967	GENERIC_DAY	17	0	f	2010-11-20	4352	\N	27154	\N
39968	GENERIC_DAY	17	0	f	2011-01-01	4352	\N	27154	\N
39969	GENERIC_DAY	16	2	f	2010-10-13	4358	\N	27155	\N
39970	GENERIC_DAY	16	0	f	2010-10-31	4344	\N	27155	\N
39971	GENERIC_DAY	16	2	f	2010-10-18	4350	\N	27155	\N
39972	GENERIC_DAY	16	2	f	2010-10-18	4358	\N	27155	\N
39973	GENERIC_DAY	16	0	f	2010-10-17	4344	\N	27155	\N
39974	GENERIC_DAY	16	2	f	2010-10-19	4358	\N	27155	\N
39975	GENERIC_DAY	16	2	f	2010-10-22	4344	\N	27155	\N
39976	GENERIC_DAY	16	0	f	2010-11-07	4344	\N	27155	\N
39977	GENERIC_DAY	16	2	f	2010-11-03	4350	\N	27155	\N
39978	GENERIC_DAY	16	0	f	2010-11-07	4358	\N	27155	\N
39979	GENERIC_DAY	16	2	f	2010-11-04	4358	\N	27155	\N
39980	GENERIC_DAY	16	2	f	2010-10-14	4344	\N	27155	\N
39981	GENERIC_DAY	16	2	f	2010-10-20	4350	\N	27155	\N
39982	GENERIC_DAY	16	0	f	2010-10-30	4350	\N	27155	\N
39983	GENERIC_DAY	16	0	f	2010-10-17	4350	\N	27155	\N
39984	GENERIC_DAY	16	0	f	2010-10-24	4350	\N	27155	\N
39985	GENERIC_DAY	16	2	f	2010-10-20	4358	\N	27155	\N
39986	GENERIC_DAY	16	0	f	2010-11-07	4350	\N	27155	\N
39987	GENERIC_DAY	16	2	f	2010-11-03	4358	\N	27155	\N
39988	GENERIC_DAY	16	0	f	2010-10-31	4348	\N	27155	\N
39989	GENERIC_DAY	16	0	f	2010-10-16	4358	\N	27155	\N
39990	GENERIC_DAY	16	2	f	2010-10-26	4350	\N	27155	\N
39991	GENERIC_DAY	16	2	f	2010-11-05	4348	\N	27155	\N
39992	GENERIC_DAY	16	2	f	2010-10-21	4344	\N	27155	\N
39993	GENERIC_DAY	16	0	f	2010-11-07	4348	\N	27155	\N
39994	GENERIC_DAY	16	2	f	2010-10-18	4348	\N	27155	\N
39995	GENERIC_DAY	16	1	f	2010-11-08	4350	\N	27155	\N
39996	GENERIC_DAY	16	2	f	2010-11-05	4344	\N	27155	\N
39997	GENERIC_DAY	16	0	f	2010-10-31	4358	\N	27155	\N
39998	GENERIC_DAY	16	2	f	2010-10-29	4358	\N	27155	\N
39999	GENERIC_DAY	16	2	f	2010-10-21	4348	\N	27155	\N
40000	GENERIC_DAY	16	2	f	2010-10-22	4348	\N	27155	\N
40001	GENERIC_DAY	16	2	f	2010-10-14	4358	\N	27155	\N
40002	GENERIC_DAY	16	2	f	2010-10-22	4358	\N	27155	\N
40003	GENERIC_DAY	16	2	f	2010-11-04	4348	\N	27155	\N
40004	GENERIC_DAY	16	2	f	2010-10-26	4348	\N	27155	\N
40005	GENERIC_DAY	16	2	f	2010-11-02	4348	\N	27155	\N
40006	GENERIC_DAY	16	2	f	2010-10-19	4344	\N	27155	\N
40007	GENERIC_DAY	16	2	f	2010-10-15	4358	\N	27155	\N
40008	GENERIC_DAY	16	2	f	2010-10-20	4344	\N	27155	\N
40009	GENERIC_DAY	16	2	f	2010-10-29	4344	\N	27155	\N
40010	GENERIC_DAY	16	0	f	2010-11-06	4344	\N	27155	\N
40011	GENERIC_DAY	16	2	f	2010-11-04	4350	\N	27155	\N
40012	GENERIC_DAY	16	2	f	2010-10-27	4358	\N	27155	\N
40013	GENERIC_DAY	16	2	f	2010-10-13	4348	\N	27155	\N
40014	GENERIC_DAY	16	2	f	2010-11-05	4350	\N	27155	\N
40015	GENERIC_DAY	16	0	f	2010-10-30	4348	\N	27155	\N
40016	GENERIC_DAY	16	2	f	2010-10-25	4348	\N	27155	\N
40017	GENERIC_DAY	16	2	f	2010-10-28	4348	\N	27155	\N
40018	GENERIC_DAY	16	2	f	2010-10-15	4344	\N	27155	\N
40019	GENERIC_DAY	16	2	f	2010-10-25	4350	\N	27155	\N
40020	GENERIC_DAY	16	2	f	2010-10-21	4358	\N	27155	\N
40021	GENERIC_DAY	16	1	f	2010-11-08	4358	\N	27155	\N
40022	GENERIC_DAY	16	2	f	2010-10-28	4344	\N	27155	\N
40023	GENERIC_DAY	16	0	f	2010-10-17	4348	\N	27155	\N
40024	GENERIC_DAY	16	2	f	2010-10-14	4348	\N	27155	\N
40025	GENERIC_DAY	16	0	f	2010-10-24	4348	\N	27155	\N
40026	GENERIC_DAY	16	0	f	2010-10-30	4344	\N	27155	\N
40027	GENERIC_DAY	16	2	f	2010-11-02	4344	\N	27155	\N
40028	GENERIC_DAY	16	2	f	2010-10-29	4348	\N	27155	\N
40029	GENERIC_DAY	16	2	f	2010-10-25	4358	\N	27155	\N
40030	GENERIC_DAY	16	2	f	2010-10-15	4348	\N	27155	\N
40031	GENERIC_DAY	16	0	f	2010-10-23	4358	\N	27155	\N
40032	GENERIC_DAY	16	2	f	2010-11-02	4358	\N	27155	\N
40033	GENERIC_DAY	16	0	f	2010-11-06	4348	\N	27155	\N
40034	GENERIC_DAY	16	0	f	2010-11-06	4350	\N	27155	\N
40035	GENERIC_DAY	16	2	f	2010-10-27	4344	\N	27155	\N
40036	GENERIC_DAY	16	2	f	2010-10-26	4358	\N	27155	\N
40037	GENERIC_DAY	16	0	f	2010-10-16	4350	\N	27155	\N
40038	GENERIC_DAY	16	0	f	2010-10-16	4348	\N	27155	\N
40039	GENERIC_DAY	16	0	f	2010-10-17	4358	\N	27155	\N
40040	GENERIC_DAY	16	0	f	2010-10-23	4348	\N	27155	\N
40041	GENERIC_DAY	16	2	f	2010-11-01	4350	\N	27155	\N
40042	GENERIC_DAY	16	2	f	2010-10-27	4348	\N	27155	\N
40043	GENERIC_DAY	16	2	f	2010-10-25	4344	\N	27155	\N
40044	GENERIC_DAY	16	2	f	2010-10-18	4344	\N	27155	\N
40045	GENERIC_DAY	16	2	f	2010-10-22	4350	\N	27155	\N
40046	GENERIC_DAY	16	2	f	2010-11-08	4348	\N	27155	\N
40047	GENERIC_DAY	16	2	f	2010-10-13	4344	\N	27155	\N
40048	GENERIC_DAY	16	2	f	2010-10-20	4348	\N	27155	\N
40049	GENERIC_DAY	16	2	f	2010-11-03	4348	\N	27155	\N
40050	GENERIC_DAY	16	2	f	2010-10-27	4350	\N	27155	\N
40051	GENERIC_DAY	16	2	f	2010-11-05	4358	\N	27155	\N
40052	GENERIC_DAY	16	2	f	2010-10-19	4350	\N	27155	\N
40053	GENERIC_DAY	16	2	f	2010-10-13	4350	\N	27155	\N
40054	GENERIC_DAY	16	2	f	2010-10-15	4350	\N	27155	\N
40055	GENERIC_DAY	16	0	f	2010-10-24	4344	\N	27155	\N
40056	GENERIC_DAY	16	2	f	2010-10-19	4348	\N	27155	\N
40057	GENERIC_DAY	16	2	f	2010-10-28	4358	\N	27155	\N
40058	GENERIC_DAY	16	2	f	2010-11-01	4344	\N	27155	\N
40059	GENERIC_DAY	16	2	f	2010-10-28	4350	\N	27155	\N
40060	GENERIC_DAY	16	0	f	2010-10-31	4350	\N	27155	\N
40061	GENERIC_DAY	16	0	f	2010-10-23	4350	\N	27155	\N
40062	GENERIC_DAY	16	0	f	2010-11-06	4358	\N	27155	\N
40063	GENERIC_DAY	16	2	f	2010-10-14	4350	\N	27155	\N
40064	GENERIC_DAY	16	2	f	2010-10-29	4350	\N	27155	\N
40065	GENERIC_DAY	16	0	f	2010-10-23	4344	\N	27155	\N
40066	GENERIC_DAY	16	2	f	2010-11-04	4344	\N	27155	\N
40067	GENERIC_DAY	16	2	f	2010-11-02	4350	\N	27155	\N
40068	GENERIC_DAY	16	2	f	2010-11-08	4344	\N	27155	\N
40069	GENERIC_DAY	16	2	f	2010-11-03	4344	\N	27155	\N
40070	GENERIC_DAY	16	2	f	2010-11-01	4348	\N	27155	\N
40071	GENERIC_DAY	16	0	f	2010-10-24	4358	\N	27155	\N
40072	GENERIC_DAY	16	0	f	2010-10-16	4344	\N	27155	\N
40073	GENERIC_DAY	16	2	f	2010-10-21	4350	\N	27155	\N
40074	GENERIC_DAY	16	2	f	2010-11-01	4358	\N	27155	\N
40075	GENERIC_DAY	16	2	f	2010-10-26	4344	\N	27155	\N
40076	GENERIC_DAY	16	0	f	2010-10-30	4358	\N	27155	\N
40077	GENERIC_DAY	15	2	f	2010-11-30	4348	\N	27156	\N
40078	GENERIC_DAY	15	0	f	2010-11-28	4348	\N	27156	\N
40079	GENERIC_DAY	15	2	f	2010-12-09	4358	\N	27156	\N
40080	GENERIC_DAY	15	2	f	2010-11-16	4350	\N	27156	\N
40081	GENERIC_DAY	15	0	f	2010-12-11	4344	\N	27156	\N
40082	GENERIC_DAY	15	2	f	2010-11-26	4348	\N	27156	\N
40083	GENERIC_DAY	15	0	f	2010-12-04	4358	\N	27156	\N
40084	GENERIC_DAY	15	2	f	2010-11-18	4348	\N	27156	\N
40085	GENERIC_DAY	15	2	f	2010-11-12	4350	\N	27156	\N
40086	GENERIC_DAY	15	2	f	2010-11-24	4348	\N	27156	\N
40087	GENERIC_DAY	15	0	f	2010-11-13	4344	\N	27156	\N
40088	GENERIC_DAY	15	0	f	2010-11-21	4350	\N	27156	\N
40089	GENERIC_DAY	15	2	f	2010-12-06	4344	\N	27156	\N
40090	GENERIC_DAY	15	2	f	2010-11-15	4350	\N	27156	\N
40091	GENERIC_DAY	15	2	f	2010-11-12	4358	\N	27156	\N
40092	GENERIC_DAY	15	0	f	2010-11-27	4348	\N	27156	\N
40093	GENERIC_DAY	15	0	f	2010-12-05	4358	\N	27156	\N
40094	GENERIC_DAY	15	2	f	2010-12-08	4348	\N	27156	\N
40095	GENERIC_DAY	15	2	f	2010-11-15	4344	\N	27156	\N
40096	GENERIC_DAY	15	2	f	2010-11-23	4350	\N	27156	\N
40097	GENERIC_DAY	15	2	f	2010-11-23	4348	\N	27156	\N
40098	GENERIC_DAY	15	2	f	2010-12-10	4344	\N	27156	\N
40099	GENERIC_DAY	15	2	f	2010-12-08	4358	\N	27156	\N
40100	GENERIC_DAY	15	2	f	2010-11-29	4348	\N	27156	\N
40101	GENERIC_DAY	15	2	f	2010-11-22	4358	\N	27156	\N
40102	GENERIC_DAY	15	2	f	2010-11-22	4350	\N	27156	\N
40103	GENERIC_DAY	15	2	f	2010-11-25	4348	\N	27156	\N
40104	GENERIC_DAY	15	2	f	2010-11-22	4348	\N	27156	\N
40105	GENERIC_DAY	15	0	f	2010-11-21	4358	\N	27156	\N
40106	GENERIC_DAY	15	0	f	2010-11-14	4348	\N	27156	\N
40107	GENERIC_DAY	15	2	f	2010-12-02	4358	\N	27156	\N
40108	GENERIC_DAY	15	2	f	2010-12-01	4348	\N	27156	\N
40109	GENERIC_DAY	15	2	f	2010-12-09	4348	\N	27156	\N
40110	GENERIC_DAY	15	2	f	2010-11-17	4348	\N	27156	\N
40111	GENERIC_DAY	15	0	f	2010-11-13	4348	\N	27156	\N
40112	GENERIC_DAY	15	2	f	2010-11-24	4344	\N	27156	\N
40113	GENERIC_DAY	15	2	f	2010-12-06	4358	\N	27156	\N
40114	GENERIC_DAY	15	2	f	2010-11-24	4350	\N	27156	\N
40115	GENERIC_DAY	15	2	f	2010-12-13	4358	\N	27156	\N
40116	GENERIC_DAY	15	2	f	2010-11-15	4358	\N	27156	\N
40117	GENERIC_DAY	15	0	f	2010-11-20	4358	\N	27156	\N
40118	GENERIC_DAY	15	0	f	2010-11-27	4358	\N	27156	\N
40119	GENERIC_DAY	15	2	f	2010-11-26	4350	\N	27156	\N
40120	GENERIC_DAY	15	2	f	2010-11-10	4348	\N	27156	\N
40121	GENERIC_DAY	15	2	f	2010-12-13	4344	\N	27156	\N
40122	GENERIC_DAY	15	2	f	2010-12-02	4348	\N	27156	\N
40123	GENERIC_DAY	15	2	f	2010-11-19	4358	\N	27156	\N
40124	GENERIC_DAY	15	2	f	2010-11-19	4344	\N	27156	\N
40125	GENERIC_DAY	15	2	f	2010-12-07	4358	\N	27156	\N
40126	GENERIC_DAY	15	2	f	2010-12-06	4350	\N	27156	\N
40127	GENERIC_DAY	15	2	f	2010-11-16	4348	\N	27156	\N
40128	GENERIC_DAY	15	2	f	2010-11-11	4348	\N	27156	\N
40129	GENERIC_DAY	15	0	f	2010-12-12	4348	\N	27156	\N
40130	GENERIC_DAY	15	2	f	2010-11-16	4358	\N	27156	\N
40131	GENERIC_DAY	15	2	f	2010-11-12	4344	\N	27156	\N
40132	GENERIC_DAY	15	2	f	2010-12-07	4344	\N	27156	\N
40133	GENERIC_DAY	15	2	f	2010-11-26	4344	\N	27156	\N
40134	GENERIC_DAY	15	2	f	2010-12-06	4348	\N	27156	\N
40135	GENERIC_DAY	15	2	f	2010-11-30	4358	\N	27156	\N
40136	GENERIC_DAY	15	2	f	2010-11-10	4358	\N	27156	\N
40137	GENERIC_DAY	15	0	f	2010-11-28	4350	\N	27156	\N
40138	GENERIC_DAY	15	0	f	2010-12-05	4344	\N	27156	\N
40139	GENERIC_DAY	15	0	f	2010-12-05	4350	\N	27156	\N
40140	GENERIC_DAY	15	0	f	2010-11-14	4358	\N	27156	\N
40141	GENERIC_DAY	15	2	f	2010-12-03	4358	\N	27156	\N
40142	GENERIC_DAY	15	0	f	2010-11-28	4344	\N	27156	\N
40143	GENERIC_DAY	15	2	f	2010-11-11	4344	\N	27156	\N
40144	GENERIC_DAY	15	2	f	2010-12-08	4350	\N	27156	\N
40145	GENERIC_DAY	15	2	f	2010-11-29	4344	\N	27156	\N
40146	GENERIC_DAY	15	2	f	2010-11-15	4348	\N	27156	\N
40147	GENERIC_DAY	15	2	f	2010-12-07	4350	\N	27156	\N
40148	GENERIC_DAY	15	2	f	2010-11-09	4358	\N	27156	\N
40149	GENERIC_DAY	15	2	f	2010-12-03	4350	\N	27156	\N
40150	GENERIC_DAY	15	0	f	2010-12-05	4348	\N	27156	\N
40151	GENERIC_DAY	15	2	f	2010-11-12	4348	\N	27156	\N
40152	GENERIC_DAY	15	0	f	2010-11-20	4344	\N	27156	\N
40153	GENERIC_DAY	15	0	f	2010-11-20	4350	\N	27156	\N
40154	GENERIC_DAY	15	2	f	2010-12-09	4344	\N	27156	\N
40155	GENERIC_DAY	15	2	f	2010-11-19	4348	\N	27156	\N
40156	GENERIC_DAY	15	2	f	2010-11-18	4344	\N	27156	\N
40157	GENERIC_DAY	15	0	f	2010-12-04	4348	\N	27156	\N
40158	GENERIC_DAY	15	0	f	2010-11-20	4348	\N	27156	\N
40159	GENERIC_DAY	15	2	f	2010-11-22	4344	\N	27156	\N
40160	GENERIC_DAY	15	0	f	2010-12-12	4344	\N	27156	\N
40161	GENERIC_DAY	15	2	f	2010-11-23	4344	\N	27156	\N
40162	GENERIC_DAY	15	0	f	2010-12-11	4350	\N	27156	\N
40163	GENERIC_DAY	15	2	f	2010-11-30	4350	\N	27156	\N
40164	GENERIC_DAY	15	2	f	2010-12-01	4344	\N	27156	\N
40165	GENERIC_DAY	15	2	f	2010-11-09	4350	\N	27156	\N
40166	GENERIC_DAY	15	2	f	2010-11-26	4358	\N	27156	\N
40167	GENERIC_DAY	15	0	f	2010-12-11	4358	\N	27156	\N
40168	GENERIC_DAY	15	0	f	2010-12-12	4350	\N	27156	\N
40169	GENERIC_DAY	15	0	f	2010-11-13	4358	\N	27156	\N
40170	GENERIC_DAY	15	2	f	2010-11-17	4358	\N	27156	\N
40171	GENERIC_DAY	15	2	f	2010-11-19	4350	\N	27156	\N
40172	GENERIC_DAY	15	0	f	2010-11-14	4344	\N	27156	\N
40173	GENERIC_DAY	15	2	f	2010-12-02	4344	\N	27156	\N
40174	GENERIC_DAY	15	2	f	2010-11-17	4350	\N	27156	\N
40175	GENERIC_DAY	15	0	f	2010-12-11	4348	\N	27156	\N
40176	GENERIC_DAY	15	2	f	2010-11-25	4358	\N	27156	\N
40177	GENERIC_DAY	15	0	f	2010-12-04	4344	\N	27156	\N
40178	GENERIC_DAY	15	0	f	2010-12-04	4350	\N	27156	\N
40179	GENERIC_DAY	15	2	f	2010-12-08	4344	\N	27156	\N
40180	GENERIC_DAY	15	2	f	2010-11-11	4350	\N	27156	\N
40181	GENERIC_DAY	15	2	f	2010-12-01	4358	\N	27156	\N
40182	GENERIC_DAY	15	0	f	2010-11-14	4350	\N	27156	\N
40183	GENERIC_DAY	15	2	f	2010-12-03	4344	\N	27156	\N
40184	GENERIC_DAY	15	2	f	2010-11-11	4358	\N	27156	\N
40185	GENERIC_DAY	15	2	f	2010-12-07	4348	\N	27156	\N
40186	GENERIC_DAY	15	2	f	2010-11-30	4344	\N	27156	\N
40187	GENERIC_DAY	15	0	f	2010-12-12	4358	\N	27156	\N
40188	GENERIC_DAY	15	2	f	2010-12-02	4350	\N	27156	\N
40189	GENERIC_DAY	15	2	f	2010-12-09	4350	\N	27156	\N
40190	GENERIC_DAY	15	2	f	2010-12-13	4348	\N	27156	\N
40191	GENERIC_DAY	15	0	f	2010-11-27	4344	\N	27156	\N
40192	GENERIC_DAY	15	2	f	2010-11-25	4350	\N	27156	\N
40193	GENERIC_DAY	15	2	f	2010-11-10	4344	\N	27156	\N
40194	GENERIC_DAY	15	2	f	2010-11-18	4358	\N	27156	\N
40195	GENERIC_DAY	15	2	f	2010-12-01	4350	\N	27156	\N
40196	GENERIC_DAY	15	2	f	2010-11-29	4350	\N	27156	\N
40197	GENERIC_DAY	15	2	f	2010-11-16	4344	\N	27156	\N
40198	GENERIC_DAY	15	2	f	2010-12-10	4350	\N	27156	\N
40199	GENERIC_DAY	15	2	f	2010-11-25	4344	\N	27156	\N
40200	GENERIC_DAY	15	0	f	2010-11-21	4344	\N	27156	\N
40201	GENERIC_DAY	15	2	f	2010-11-09	4344	\N	27156	\N
40202	GENERIC_DAY	15	2	f	2010-12-13	4350	\N	27156	\N
40203	GENERIC_DAY	15	0	f	2010-11-27	4350	\N	27156	\N
40204	GENERIC_DAY	15	2	f	2010-11-23	4358	\N	27156	\N
40205	GENERIC_DAY	15	2	f	2010-11-09	4348	\N	27156	\N
40206	GENERIC_DAY	15	0	f	2010-11-21	4348	\N	27156	\N
40207	GENERIC_DAY	15	2	f	2010-12-03	4348	\N	27156	\N
40208	GENERIC_DAY	15	2	f	2010-12-10	4358	\N	27156	\N
40209	GENERIC_DAY	15	2	f	2010-11-10	4350	\N	27156	\N
40210	GENERIC_DAY	15	2	f	2010-11-18	4350	\N	27156	\N
40211	GENERIC_DAY	15	2	f	2010-12-10	4348	\N	27156	\N
40212	GENERIC_DAY	15	0	f	2010-11-28	4358	\N	27156	\N
40213	GENERIC_DAY	15	0	f	2010-11-13	4350	\N	27156	\N
40214	GENERIC_DAY	15	2	f	2010-11-24	4358	\N	27156	\N
40215	GENERIC_DAY	15	2	f	2010-11-17	4344	\N	27156	\N
40216	GENERIC_DAY	15	2	f	2010-11-29	4358	\N	27156	\N
40217	SPECIFIC_DAY	15	8	f	2010-06-16	4350	31226	\N	\N
40218	SPECIFIC_DAY	15	8	f	2010-06-30	4350	31226	\N	\N
40219	SPECIFIC_DAY	15	0	f	2010-06-27	4350	31226	\N	\N
40220	SPECIFIC_DAY	15	8	f	2010-06-22	4350	31226	\N	\N
40221	SPECIFIC_DAY	15	0	f	2010-07-04	4350	31226	\N	\N
40222	SPECIFIC_DAY	15	8	f	2010-07-07	4350	31226	\N	\N
40223	SPECIFIC_DAY	15	8	f	2010-06-29	4350	31226	\N	\N
40224	SPECIFIC_DAY	15	8	f	2010-07-02	4350	31226	\N	\N
40225	SPECIFIC_DAY	15	8	f	2010-06-18	4350	31226	\N	\N
40226	SPECIFIC_DAY	15	6	f	2010-07-08	4350	31226	\N	\N
40227	SPECIFIC_DAY	15	8	f	2010-06-21	4350	31226	\N	\N
40228	SPECIFIC_DAY	15	0	f	2010-06-20	4350	31226	\N	\N
40229	SPECIFIC_DAY	15	8	f	2010-06-23	4350	31226	\N	\N
40230	SPECIFIC_DAY	15	8	f	2010-06-24	4350	31226	\N	\N
40231	SPECIFIC_DAY	15	8	f	2010-06-28	4350	31226	\N	\N
40232	SPECIFIC_DAY	15	8	f	2010-06-17	4350	31226	\N	\N
40233	SPECIFIC_DAY	15	0	f	2010-06-19	4350	31226	\N	\N
40234	SPECIFIC_DAY	15	8	f	2010-07-05	4350	31226	\N	\N
40235	SPECIFIC_DAY	15	8	f	2010-06-14	4350	31226	\N	\N
40236	SPECIFIC_DAY	15	8	f	2010-07-01	4350	31226	\N	\N
40237	SPECIFIC_DAY	15	8	f	2010-06-25	4350	31226	\N	\N
40238	SPECIFIC_DAY	15	0	f	2010-07-03	4350	31226	\N	\N
40239	SPECIFIC_DAY	15	8	f	2010-06-15	4350	31226	\N	\N
40240	SPECIFIC_DAY	15	8	f	2010-07-06	4350	31226	\N	\N
40241	SPECIFIC_DAY	15	0	f	2010-06-26	4350	31226	\N	\N
40242	SPECIFIC_DAY	15	8	f	2010-06-14	4344	31227	\N	\N
40243	SPECIFIC_DAY	15	8	f	2010-06-17	4344	31227	\N	\N
40244	SPECIFIC_DAY	15	0	f	2010-06-19	4344	31227	\N	\N
40245	SPECIFIC_DAY	15	8	f	2010-06-22	4344	31227	\N	\N
40246	SPECIFIC_DAY	15	0	f	2010-07-10	4344	31227	\N	\N
40247	SPECIFIC_DAY	15	0	f	2010-06-26	4344	31227	\N	\N
40248	SPECIFIC_DAY	15	8	f	2010-06-21	4344	31227	\N	\N
40249	SPECIFIC_DAY	15	8	f	2010-06-16	4344	31227	\N	\N
40250	SPECIFIC_DAY	15	0	f	2010-07-04	4344	31227	\N	\N
40251	SPECIFIC_DAY	15	8	f	2010-06-30	4344	31227	\N	\N
40252	SPECIFIC_DAY	15	8	f	2010-07-14	4344	31227	\N	\N
40253	SPECIFIC_DAY	15	8	f	2010-07-06	4344	31227	\N	\N
40254	SPECIFIC_DAY	15	8	f	2010-06-23	4344	31227	\N	\N
40255	SPECIFIC_DAY	15	8	f	2010-07-05	4344	31227	\N	\N
40256	SPECIFIC_DAY	15	8	f	2010-06-15	4344	31227	\N	\N
40257	SPECIFIC_DAY	15	8	f	2010-07-09	4344	31227	\N	\N
40258	SPECIFIC_DAY	15	0	f	2010-07-03	4344	31227	\N	\N
40259	SPECIFIC_DAY	15	0	f	2010-06-27	4344	31227	\N	\N
40260	SPECIFIC_DAY	15	8	f	2010-06-25	4344	31227	\N	\N
40261	SPECIFIC_DAY	15	8	f	2010-07-12	4344	31227	\N	\N
40262	SPECIFIC_DAY	15	8	f	2010-07-07	4344	31227	\N	\N
40263	SPECIFIC_DAY	15	8	f	2010-06-29	4344	31227	\N	\N
40264	SPECIFIC_DAY	15	0	f	2010-06-20	4344	31227	\N	\N
40265	SPECIFIC_DAY	15	8	f	2010-07-02	4344	31227	\N	\N
40266	SPECIFIC_DAY	15	8	f	2010-07-01	4344	31227	\N	\N
40267	SPECIFIC_DAY	15	8	f	2010-06-28	4344	31227	\N	\N
40268	SPECIFIC_DAY	15	0	f	2010-07-11	4344	31227	\N	\N
40269	SPECIFIC_DAY	15	8	f	2010-07-16	4344	31227	\N	\N
40270	SPECIFIC_DAY	15	8	f	2010-06-24	4344	31227	\N	\N
40271	SPECIFIC_DAY	15	8	f	2010-07-08	4344	31227	\N	\N
40272	SPECIFIC_DAY	15	8	f	2010-07-13	4344	31227	\N	\N
40273	SPECIFIC_DAY	15	8	f	2010-07-15	4344	31227	\N	\N
40274	SPECIFIC_DAY	15	8	f	2010-06-18	4344	31227	\N	\N
40374	GENERIC_DAY	14	0	f	2010-06-20	4350	\N	27157	\N
40375	GENERIC_DAY	14	0	f	2010-06-20	1220	\N	27157	\N
40376	GENERIC_DAY	14	0	f	2010-06-22	4352	\N	27157	\N
40377	GENERIC_DAY	14	0	f	2010-06-17	4344	\N	27157	\N
40378	GENERIC_DAY	14	0	f	2010-06-17	4352	\N	27157	\N
40379	GENERIC_DAY	14	0	f	2010-06-21	21817	\N	27157	\N
40380	GENERIC_DAY	14	0	f	2010-06-22	1220	\N	27157	\N
40381	GENERIC_DAY	14	0	f	2010-06-20	4356	\N	27157	\N
40382	GENERIC_DAY	14	0	f	2010-06-15	1216	\N	27157	\N
40383	GENERIC_DAY	14	2	f	2010-06-16	1214	\N	27157	\N
40384	GENERIC_DAY	14	0	f	2010-06-21	4358	\N	27157	\N
40385	GENERIC_DAY	14	0	f	2010-06-15	4344	\N	27157	\N
40386	GENERIC_DAY	14	1	f	2010-06-18	4354	\N	27157	\N
40387	GENERIC_DAY	14	0	f	2010-06-16	4348	\N	27157	\N
40388	GENERIC_DAY	14	0	f	2010-06-14	4344	\N	27157	\N
40389	GENERIC_DAY	14	3	f	2010-06-18	4356	\N	27157	\N
40390	GENERIC_DAY	14	1	f	2010-06-15	4354	\N	27157	\N
40391	GENERIC_DAY	14	0	f	2010-06-22	4358	\N	27157	\N
40392	GENERIC_DAY	14	0	f	2010-06-21	1216	\N	27157	\N
40393	GENERIC_DAY	14	0	f	2010-06-20	4352	\N	27157	\N
40394	GENERIC_DAY	14	3	f	2010-06-17	4356	\N	27157	\N
40395	GENERIC_DAY	14	1	f	2010-06-22	4356	\N	27157	\N
40396	GENERIC_DAY	14	1	f	2010-06-14	1214	\N	27157	\N
40397	GENERIC_DAY	14	0	f	2010-06-15	21817	\N	27157	\N
40398	GENERIC_DAY	14	0	f	2010-06-20	1214	\N	27157	\N
40399	GENERIC_DAY	14	0	f	2010-06-15	4350	\N	27157	\N
40400	GENERIC_DAY	14	0	f	2010-06-14	4354	\N	27157	\N
40401	GENERIC_DAY	14	0	f	2010-06-15	4348	\N	27157	\N
40402	GENERIC_DAY	14	0	f	2010-06-17	4350	\N	27157	\N
40403	GENERIC_DAY	14	0	f	2010-06-19	1220	\N	27157	\N
40404	GENERIC_DAY	14	0	f	2010-06-22	21817	\N	27157	\N
40405	GENERIC_DAY	14	0	f	2010-06-20	1216	\N	27157	\N
40406	GENERIC_DAY	14	0	f	2010-06-20	4358	\N	27157	\N
40407	GENERIC_DAY	14	3	f	2010-06-15	4356	\N	27157	\N
40408	GENERIC_DAY	14	0	f	2010-06-14	4350	\N	27157	\N
40409	GENERIC_DAY	14	2	f	2010-06-17	1214	\N	27157	\N
40410	GENERIC_DAY	14	0	f	2010-06-14	4348	\N	27157	\N
40411	GENERIC_DAY	14	0	f	2010-06-18	4352	\N	27157	\N
40412	GENERIC_DAY	14	2	f	2010-06-15	1214	\N	27157	\N
40413	GENERIC_DAY	14	1	f	2010-06-16	4354	\N	27157	\N
40414	GENERIC_DAY	14	2	f	2010-06-18	1214	\N	27157	\N
40415	GENERIC_DAY	14	0	f	2010-06-15	4358	\N	27157	\N
40416	GENERIC_DAY	14	3	f	2010-06-21	4356	\N	27157	\N
40417	GENERIC_DAY	14	0	f	2010-06-22	4348	\N	27157	\N
40418	GENERIC_DAY	14	0	f	2010-06-22	1216	\N	27157	\N
40419	GENERIC_DAY	14	0	f	2010-06-19	4348	\N	27157	\N
40420	GENERIC_DAY	14	0	f	2010-06-19	1216	\N	27157	\N
40421	GENERIC_DAY	14	0	f	2010-06-21	4344	\N	27157	\N
40422	GENERIC_DAY	14	0	f	2010-06-14	4358	\N	27157	\N
40423	GENERIC_DAY	14	0	f	2010-06-20	4348	\N	27157	\N
40424	GENERIC_DAY	14	2	f	2010-06-21	1214	\N	27157	\N
40425	GENERIC_DAY	14	0	f	2010-06-17	21817	\N	27157	\N
40426	GENERIC_DAY	14	0	f	2010-06-15	4352	\N	27157	\N
40427	GENERIC_DAY	14	0	f	2010-06-22	4354	\N	27157	\N
40428	GENERIC_DAY	14	0	f	2010-06-19	4350	\N	27157	\N
40429	GENERIC_DAY	14	0	f	2010-06-16	4358	\N	27157	\N
40430	GENERIC_DAY	14	0	f	2010-06-21	4350	\N	27157	\N
40431	GENERIC_DAY	14	0	f	2010-06-14	1216	\N	27157	\N
40432	GENERIC_DAY	14	0	f	2010-06-21	4352	\N	27157	\N
40433	GENERIC_DAY	14	0	f	2010-06-16	4352	\N	27157	\N
40434	GENERIC_DAY	14	0	f	2010-06-16	4344	\N	27157	\N
40435	GENERIC_DAY	14	0	f	2010-06-19	4354	\N	27157	\N
40436	GENERIC_DAY	14	0	f	2010-06-18	1216	\N	27157	\N
40437	GENERIC_DAY	14	0	f	2010-06-19	21817	\N	27157	\N
40438	GENERIC_DAY	14	0	f	2010-06-19	1214	\N	27157	\N
40439	GENERIC_DAY	14	2	f	2010-06-14	4356	\N	27157	\N
40440	GENERIC_DAY	14	2	f	2010-06-18	1220	\N	27157	\N
40441	GENERIC_DAY	14	2	f	2010-06-21	1220	\N	27157	\N
40442	GENERIC_DAY	14	1	f	2010-06-17	4354	\N	27157	\N
40443	GENERIC_DAY	14	1	f	2010-06-14	1220	\N	27157	\N
40444	GENERIC_DAY	14	0	f	2010-06-18	4344	\N	27157	\N
40445	GENERIC_DAY	14	0	f	2010-06-18	4358	\N	27157	\N
40446	GENERIC_DAY	14	0	f	2010-06-20	4354	\N	27157	\N
40447	GENERIC_DAY	14	0	f	2010-06-19	4356	\N	27157	\N
40448	GENERIC_DAY	14	0	f	2010-06-16	1216	\N	27157	\N
40449	GENERIC_DAY	14	1	f	2010-06-21	4354	\N	27157	\N
40450	GENERIC_DAY	14	0	f	2010-06-19	4358	\N	27157	\N
40451	GENERIC_DAY	14	0	f	2010-06-14	4352	\N	27157	\N
40452	GENERIC_DAY	14	2	f	2010-06-16	1220	\N	27157	\N
40453	GENERIC_DAY	14	4	f	2010-06-14	21817	\N	27157	\N
40454	GENERIC_DAY	14	0	f	2010-06-16	4350	\N	27157	\N
40455	GENERIC_DAY	14	0	f	2010-06-18	21817	\N	27157	\N
40456	GENERIC_DAY	14	0	f	2010-06-20	21817	\N	27157	\N
40457	GENERIC_DAY	14	2	f	2010-06-15	1220	\N	27157	\N
40458	GENERIC_DAY	14	0	f	2010-06-22	1214	\N	27157	\N
40459	GENERIC_DAY	14	0	f	2010-06-17	4348	\N	27157	\N
40460	GENERIC_DAY	14	0	f	2010-06-18	4348	\N	27157	\N
40461	GENERIC_DAY	14	0	f	2010-06-17	4358	\N	27157	\N
40462	GENERIC_DAY	14	2	f	2010-06-17	1220	\N	27157	\N
40463	GENERIC_DAY	14	3	f	2010-06-16	4356	\N	27157	\N
40464	GENERIC_DAY	14	0	f	2010-06-19	4352	\N	27157	\N
40465	GENERIC_DAY	14	0	f	2010-06-18	4350	\N	27157	\N
40466	GENERIC_DAY	14	0	f	2010-06-19	4344	\N	27157	\N
40467	GENERIC_DAY	14	0	f	2010-06-21	4348	\N	27157	\N
40468	GENERIC_DAY	14	0	f	2010-06-22	4344	\N	27157	\N
40469	GENERIC_DAY	14	0	f	2010-06-17	1216	\N	27157	\N
40470	GENERIC_DAY	14	0	f	2010-06-22	4350	\N	27157	\N
40471	GENERIC_DAY	14	0	f	2010-06-20	4344	\N	27157	\N
40472	GENERIC_DAY	14	0	f	2010-06-16	21817	\N	27157	\N
40473	SPECIFIC_DAY	14	8	f	2010-06-15	4348	31228	\N	\N
40474	SPECIFIC_DAY	14	8	f	2010-06-17	4348	31228	\N	\N
40475	SPECIFIC_DAY	14	0	f	2010-06-19	4348	31228	\N	\N
40476	SPECIFIC_DAY	14	8	f	2010-06-21	4348	31228	\N	\N
40477	SPECIFIC_DAY	14	8	f	2010-06-14	4348	31228	\N	\N
40478	SPECIFIC_DAY	14	8	f	2010-06-16	4348	31228	\N	\N
40479	SPECIFIC_DAY	14	3	f	2010-06-22	4348	31228	\N	\N
40480	SPECIFIC_DAY	14	8	f	2010-06-18	4348	31228	\N	\N
40481	SPECIFIC_DAY	14	0	f	2010-06-20	4348	31228	\N	\N
40482	SPECIFIC_DAY	14	8	f	2010-10-08	1216	31229	\N	\N
40483	SPECIFIC_DAY	14	8	f	2010-09-29	1216	31229	\N	\N
40484	SPECIFIC_DAY	14	8	f	2010-10-01	1216	31229	\N	\N
40485	SPECIFIC_DAY	14	8	f	2010-09-30	1216	31229	\N	\N
40486	SPECIFIC_DAY	14	8	f	2010-10-07	1216	31229	\N	\N
40487	SPECIFIC_DAY	14	8	f	2010-09-28	1216	31229	\N	\N
40488	SPECIFIC_DAY	14	4	f	2010-09-27	1216	31229	\N	\N
40489	SPECIFIC_DAY	14	8	f	2010-10-13	1216	31229	\N	\N
40490	SPECIFIC_DAY	14	8	f	2010-10-04	1216	31229	\N	\N
40491	SPECIFIC_DAY	14	8	f	2010-10-12	1216	31229	\N	\N
40492	SPECIFIC_DAY	14	8	f	2010-10-11	1216	31229	\N	\N
40493	SPECIFIC_DAY	14	8	f	2010-10-05	1216	31229	\N	\N
40494	SPECIFIC_DAY	14	8	f	2010-10-06	1216	31229	\N	\N
40495	SPECIFIC_DAY	14	0	f	2010-10-30	1220	31230	\N	\N
40496	SPECIFIC_DAY	14	8	f	2010-10-15	1220	31230	\N	\N
40497	SPECIFIC_DAY	14	4	f	2010-11-01	1220	31230	\N	\N
40498	SPECIFIC_DAY	14	0	f	2010-10-16	1220	31230	\N	\N
40499	SPECIFIC_DAY	14	8	f	2010-10-20	1220	31230	\N	\N
40500	SPECIFIC_DAY	14	8	f	2010-10-29	1220	31230	\N	\N
40501	SPECIFIC_DAY	14	0	f	2010-10-31	1220	31230	\N	\N
40502	SPECIFIC_DAY	14	8	f	2010-10-14	1220	31230	\N	\N
40503	SPECIFIC_DAY	14	8	f	2010-10-22	1220	31230	\N	\N
40504	SPECIFIC_DAY	14	0	f	2010-10-24	1220	31230	\N	\N
40505	SPECIFIC_DAY	14	8	f	2010-10-27	1220	31230	\N	\N
40506	SPECIFIC_DAY	14	8	f	2010-10-19	1220	31230	\N	\N
40507	SPECIFIC_DAY	14	0	f	2010-10-13	1220	31230	\N	\N
40508	SPECIFIC_DAY	14	8	f	2010-10-18	1220	31230	\N	\N
40509	SPECIFIC_DAY	14	0	f	2010-10-17	1220	31230	\N	\N
40510	SPECIFIC_DAY	14	8	f	2010-10-21	1220	31230	\N	\N
40511	SPECIFIC_DAY	14	0	f	2010-10-23	1220	31230	\N	\N
40512	SPECIFIC_DAY	14	8	f	2010-10-28	1220	31230	\N	\N
40513	SPECIFIC_DAY	14	8	f	2010-10-26	1220	31230	\N	\N
40514	SPECIFIC_DAY	14	8	f	2010-10-25	1220	31230	\N	\N
40515	SPECIFIC_DAY	14	0	f	2010-09-12	1216	31231	\N	\N
40516	SPECIFIC_DAY	14	8	f	2010-09-09	1216	31231	\N	\N
40517	SPECIFIC_DAY	14	8	f	2010-09-24	1216	31231	\N	\N
40518	SPECIFIC_DAY	14	0	f	2010-09-18	1216	31231	\N	\N
40519	SPECIFIC_DAY	14	8	f	2010-09-16	1216	31231	\N	\N
40520	SPECIFIC_DAY	14	8	f	2010-09-13	1216	31231	\N	\N
40521	SPECIFIC_DAY	14	8	f	2010-09-20	1216	31231	\N	\N
40522	SPECIFIC_DAY	14	8	f	2010-09-17	1216	31231	\N	\N
40523	SPECIFIC_DAY	14	4	f	2010-09-08	1216	31231	\N	\N
40524	SPECIFIC_DAY	14	8	f	2010-09-23	1216	31231	\N	\N
40525	SPECIFIC_DAY	14	8	f	2010-09-14	1216	31231	\N	\N
40526	SPECIFIC_DAY	14	8	f	2010-09-22	1216	31231	\N	\N
40527	SPECIFIC_DAY	14	0	f	2010-09-11	1216	31231	\N	\N
40528	SPECIFIC_DAY	14	8	f	2010-09-10	1216	31231	\N	\N
40529	SPECIFIC_DAY	14	0	f	2010-09-19	1216	31231	\N	\N
40530	SPECIFIC_DAY	14	8	f	2010-09-15	1216	31231	\N	\N
40531	SPECIFIC_DAY	14	8	f	2010-09-21	1216	31231	\N	\N
40532	SPECIFIC_DAY	14	8	f	2010-11-02	1216	31232	\N	\N
40533	SPECIFIC_DAY	14	4	f	2010-10-29	1216	31232	\N	\N
40534	SPECIFIC_DAY	14	8	f	2010-11-01	1216	31232	\N	\N
40535	SPECIFIC_DAY	14	8	f	2010-11-09	1216	31232	\N	\N
40536	SPECIFIC_DAY	14	8	f	2010-11-04	1216	31232	\N	\N
40537	SPECIFIC_DAY	14	8	f	2010-11-16	1216	31232	\N	\N
40538	SPECIFIC_DAY	14	8	f	2010-11-08	1216	31232	\N	\N
40539	SPECIFIC_DAY	14	8	f	2010-11-15	1216	31232	\N	\N
40540	SPECIFIC_DAY	14	8	f	2010-11-12	1216	31232	\N	\N
40541	SPECIFIC_DAY	14	8	f	2010-11-05	1216	31232	\N	\N
40542	SPECIFIC_DAY	14	8	f	2010-11-11	1216	31232	\N	\N
40543	SPECIFIC_DAY	14	8	f	2010-11-10	1216	31232	\N	\N
40544	SPECIFIC_DAY	14	8	f	2010-11-03	1216	31232	\N	\N
40545	SPECIFIC_DAY	14	8	f	2011-01-03	1216	31233	\N	\N
40546	SPECIFIC_DAY	14	8	f	2010-12-02	1216	31233	\N	\N
40547	SPECIFIC_DAY	14	8	f	2010-11-22	1216	31233	\N	\N
40548	SPECIFIC_DAY	14	8	f	2010-12-22	1216	31233	\N	\N
40549	SPECIFIC_DAY	14	0	f	2011-01-02	1216	31233	\N	\N
40550	SPECIFIC_DAY	14	0	f	2010-12-19	1216	31233	\N	\N
40551	SPECIFIC_DAY	14	8	f	2010-12-13	1216	31233	\N	\N
40552	SPECIFIC_DAY	14	0	f	2010-12-18	1216	31233	\N	\N
40553	SPECIFIC_DAY	14	8	f	2010-12-07	1216	31233	\N	\N
40554	SPECIFIC_DAY	14	8	f	2010-12-24	1216	31233	\N	\N
40555	SPECIFIC_DAY	14	8	f	2011-01-04	1216	31233	\N	\N
40556	SPECIFIC_DAY	14	0	f	2010-11-21	1216	31233	\N	\N
40557	SPECIFIC_DAY	14	8	f	2010-12-20	1216	31233	\N	\N
40558	SPECIFIC_DAY	14	8	f	2010-11-26	1216	31233	\N	\N
40559	SPECIFIC_DAY	14	4	f	2011-01-07	1216	31233	\N	\N
40560	SPECIFIC_DAY	14	8	f	2010-12-15	1216	31233	\N	\N
40561	SPECIFIC_DAY	14	8	f	2010-11-24	1216	31233	\N	\N
40562	SPECIFIC_DAY	14	8	f	2011-01-06	1216	31233	\N	\N
40563	SPECIFIC_DAY	14	8	f	2010-12-03	1216	31233	\N	\N
40564	SPECIFIC_DAY	14	8	f	2010-12-10	1216	31233	\N	\N
40565	SPECIFIC_DAY	14	0	f	2010-12-04	1216	31233	\N	\N
40566	SPECIFIC_DAY	14	8	f	2010-12-21	1216	31233	\N	\N
40567	SPECIFIC_DAY	14	8	f	2010-12-17	1216	31233	\N	\N
40568	SPECIFIC_DAY	14	8	f	2010-12-30	1216	31233	\N	\N
40569	SPECIFIC_DAY	14	8	f	2011-01-05	1216	31233	\N	\N
40570	SPECIFIC_DAY	14	0	f	2011-01-01	1216	31233	\N	\N
40571	SPECIFIC_DAY	14	8	f	2010-12-16	1216	31233	\N	\N
40572	SPECIFIC_DAY	14	8	f	2010-11-25	1216	31233	\N	\N
40573	SPECIFIC_DAY	14	0	f	2010-12-25	1216	31233	\N	\N
40574	SPECIFIC_DAY	14	8	f	2010-11-23	1216	31233	\N	\N
40575	SPECIFIC_DAY	14	8	f	2010-11-30	1216	31233	\N	\N
40576	SPECIFIC_DAY	14	8	f	2010-12-14	1216	31233	\N	\N
40577	SPECIFIC_DAY	14	8	f	2010-12-23	1216	31233	\N	\N
40578	SPECIFIC_DAY	14	0	f	2010-11-28	1216	31233	\N	\N
40579	SPECIFIC_DAY	14	0	f	2010-11-27	1216	31233	\N	\N
40580	SPECIFIC_DAY	14	8	f	2010-11-19	1216	31233	\N	\N
40581	SPECIFIC_DAY	14	0	f	2010-12-11	1216	31233	\N	\N
40582	SPECIFIC_DAY	14	0	f	2010-12-05	1216	31233	\N	\N
40583	SPECIFIC_DAY	14	0	f	2010-12-12	1216	31233	\N	\N
40584	SPECIFIC_DAY	14	8	f	2010-11-29	1216	31233	\N	\N
40585	SPECIFIC_DAY	14	8	f	2010-12-27	1216	31233	\N	\N
40586	SPECIFIC_DAY	14	0	f	2010-11-16	1216	31233	\N	\N
40587	SPECIFIC_DAY	14	0	f	2010-12-26	1216	31233	\N	\N
40588	SPECIFIC_DAY	14	8	f	2010-12-31	1216	31233	\N	\N
40589	SPECIFIC_DAY	14	8	f	2010-12-08	1216	31233	\N	\N
40590	SPECIFIC_DAY	14	8	f	2010-12-09	1216	31233	\N	\N
40591	SPECIFIC_DAY	14	8	f	2010-12-06	1216	31233	\N	\N
40592	SPECIFIC_DAY	14	8	f	2010-11-18	1216	31233	\N	\N
40593	SPECIFIC_DAY	14	8	f	2010-12-28	1216	31233	\N	\N
40594	SPECIFIC_DAY	14	8	f	2010-12-01	1216	31233	\N	\N
40595	SPECIFIC_DAY	14	8	f	2010-12-29	1216	31233	\N	\N
40596	SPECIFIC_DAY	14	8	f	2010-11-17	1216	31233	\N	\N
40597	SPECIFIC_DAY	14	0	f	2010-11-20	1216	31233	\N	\N
40763	SPECIFIC_DAY	14	0	f	2010-07-11	1216	31234	\N	\N
40764	SPECIFIC_DAY	14	0	f	2010-07-10	1216	31234	\N	\N
40765	SPECIFIC_DAY	14	0	f	2010-07-04	1216	31234	\N	\N
40766	SPECIFIC_DAY	14	8	f	2010-07-15	1216	31234	\N	\N
40767	SPECIFIC_DAY	14	8	f	2010-07-08	1216	31234	\N	\N
40768	SPECIFIC_DAY	14	8	f	2010-07-07	1216	31234	\N	\N
40769	SPECIFIC_DAY	14	1	f	2010-07-19	1216	31234	\N	\N
40770	SPECIFIC_DAY	14	8	f	2010-07-02	1216	31234	\N	\N
40771	SPECIFIC_DAY	14	8	f	2010-07-01	1216	31234	\N	\N
40772	SPECIFIC_DAY	14	8	f	2010-07-13	1216	31234	\N	\N
40773	SPECIFIC_DAY	14	8	f	2010-07-09	1216	31234	\N	\N
40774	SPECIFIC_DAY	14	0	f	2010-07-03	1216	31234	\N	\N
40775	SPECIFIC_DAY	14	0	f	2010-07-17	1216	31234	\N	\N
40776	SPECIFIC_DAY	14	8	f	2010-07-05	1216	31234	\N	\N
40777	SPECIFIC_DAY	14	0	f	2010-07-18	1216	31234	\N	\N
40778	SPECIFIC_DAY	14	4	f	2010-06-30	1216	31234	\N	\N
40779	SPECIFIC_DAY	14	8	f	2010-07-12	1216	31234	\N	\N
40780	SPECIFIC_DAY	14	8	f	2010-07-16	1216	31234	\N	\N
40781	SPECIFIC_DAY	14	8	f	2010-07-06	1216	31234	\N	\N
40782	SPECIFIC_DAY	14	8	f	2010-07-14	1216	31234	\N	\N
41139	GENERIC_DAY	13	9	f	2010-07-08	4354	\N	27158	\N
41140	GENERIC_DAY	13	8	f	2010-06-28	4354	\N	27158	\N
41141	GENERIC_DAY	13	4	t	2010-06-16	4352	\N	27158	\N
41142	GENERIC_DAY	13	0	f	2010-07-06	4352	\N	27158	\N
41143	GENERIC_DAY	13	0	f	2010-06-26	4354	\N	27158	\N
41144	GENERIC_DAY	13	8	f	2010-07-21	4354	\N	27158	\N
41145	GENERIC_DAY	13	0	f	2010-07-04	4352	\N	27158	\N
41146	GENERIC_DAY	13	0	f	2010-07-31	4354	\N	27158	\N
41147	GENERIC_DAY	13	8	f	2010-07-22	4354	\N	27158	\N
41148	GENERIC_DAY	13	1	f	2010-06-29	4352	\N	27158	\N
41149	GENERIC_DAY	13	0	f	2010-06-27	4354	\N	27158	\N
41150	GENERIC_DAY	13	4	t	2010-06-17	4354	\N	27158	\N
41151	GENERIC_DAY	13	9	f	2010-07-15	4354	\N	27158	\N
41152	GENERIC_DAY	13	1	f	2010-07-01	4352	\N	27158	\N
41153	GENERIC_DAY	13	0	f	2010-07-18	4352	\N	27158	\N
41154	GENERIC_DAY	13	0	f	2010-07-17	4354	\N	27158	\N
41155	GENERIC_DAY	13	0	f	2010-07-15	4352	\N	27158	\N
41156	GENERIC_DAY	13	4	t	2010-06-22	4354	\N	27158	\N
41157	GENERIC_DAY	13	4	t	2010-06-18	4352	\N	27158	\N
41158	GENERIC_DAY	13	4	t	2010-06-22	4352	\N	27158	\N
41159	GENERIC_DAY	13	1	f	2010-07-22	4352	\N	27158	\N
41160	GENERIC_DAY	13	0	f	2010-06-27	4352	\N	27158	\N
41161	GENERIC_DAY	13	4	t	2010-06-18	4354	\N	27158	\N
41162	GENERIC_DAY	13	4	t	2010-06-23	4352	\N	27158	\N
41163	GENERIC_DAY	13	4	t	2010-06-25	4352	\N	27158	\N
41164	GENERIC_DAY	13	0	f	2010-07-25	4352	\N	27158	\N
41165	GENERIC_DAY	13	1	f	2010-07-28	4352	\N	27158	\N
41166	GENERIC_DAY	13	8	f	2010-08-02	4354	\N	27158	\N
41167	GENERIC_DAY	13	0	f	2010-07-11	4354	\N	27158	\N
41168	GENERIC_DAY	13	0	t	2010-06-19	4354	\N	27158	\N
41169	GENERIC_DAY	13	8	f	2010-07-28	4354	\N	27158	\N
41170	GENERIC_DAY	13	4	t	2010-06-24	4352	\N	27158	\N
41171	GENERIC_DAY	13	0	f	2010-07-07	4352	\N	27158	\N
41172	GENERIC_DAY	13	8	f	2010-07-01	4354	\N	27158	\N
41173	GENERIC_DAY	13	0	f	2010-07-18	4354	\N	27158	\N
41174	GENERIC_DAY	13	9	f	2010-07-20	4354	\N	27158	\N
41175	GENERIC_DAY	13	0	f	2010-07-17	4352	\N	27158	\N
41176	GENERIC_DAY	13	8	f	2010-07-23	4354	\N	27158	\N
41177	GENERIC_DAY	13	1	f	2010-07-29	4352	\N	27158	\N
41178	GENERIC_DAY	13	1	f	2010-06-30	4352	\N	27158	\N
41179	GENERIC_DAY	13	1	f	2010-07-21	4352	\N	27158	\N
41180	GENERIC_DAY	13	0	f	2010-08-01	4352	\N	27158	\N
41181	GENERIC_DAY	13	1	f	2010-08-03	4352	\N	27158	\N
41182	GENERIC_DAY	13	8	f	2010-06-30	4354	\N	27158	\N
41183	GENERIC_DAY	13	0	f	2010-07-09	4352	\N	27158	\N
41184	GENERIC_DAY	13	8	f	2010-07-30	4354	\N	27158	\N
41185	GENERIC_DAY	13	4	t	2010-06-16	4354	\N	27158	\N
41186	GENERIC_DAY	13	0	f	2010-07-16	4352	\N	27158	\N
41187	GENERIC_DAY	13	9	f	2010-07-09	4354	\N	27158	\N
41188	GENERIC_DAY	13	0	f	2010-07-19	4352	\N	27158	\N
41189	GENERIC_DAY	13	4	t	2010-06-15	4352	\N	27158	\N
41190	GENERIC_DAY	13	9	f	2010-07-16	4354	\N	27158	\N
41191	GENERIC_DAY	13	9	f	2010-07-19	4354	\N	27158	\N
41192	GENERIC_DAY	13	0	f	2010-08-01	4354	\N	27158	\N
41193	GENERIC_DAY	13	4	f	2010-08-04	4354	\N	27158	\N
41194	GENERIC_DAY	13	0	f	2010-07-10	4352	\N	27158	\N
41195	GENERIC_DAY	13	0	f	2010-07-05	4352	\N	27158	\N
41196	GENERIC_DAY	13	0	f	2010-07-24	4354	\N	27158	\N
41197	GENERIC_DAY	13	1	f	2010-07-23	4352	\N	27158	\N
41198	GENERIC_DAY	13	0	f	2010-06-26	4352	\N	27158	\N
41199	GENERIC_DAY	13	0	f	2010-07-03	4352	\N	27158	\N
41200	GENERIC_DAY	13	8	f	2010-07-29	4354	\N	27158	\N
41201	GENERIC_DAY	13	1	f	2010-07-30	4352	\N	27158	\N
41202	GENERIC_DAY	13	9	f	2010-07-14	4354	\N	27158	\N
41203	GENERIC_DAY	13	8	f	2010-07-27	4354	\N	27158	\N
41204	GENERIC_DAY	13	1	f	2010-07-26	4352	\N	27158	\N
41205	GENERIC_DAY	13	0	f	2010-07-03	4354	\N	27158	\N
41206	GENERIC_DAY	13	4	t	2010-06-23	4354	\N	27158	\N
41207	GENERIC_DAY	13	9	f	2010-07-12	4354	\N	27158	\N
41208	GENERIC_DAY	13	0	f	2010-07-20	4352	\N	27158	\N
41209	GENERIC_DAY	13	8	f	2010-06-29	4354	\N	27158	\N
41210	GENERIC_DAY	13	1	f	2010-07-02	4352	\N	27158	\N
41211	GENERIC_DAY	13	0	f	2010-07-10	4354	\N	27158	\N
41212	GENERIC_DAY	13	8	f	2010-07-26	4354	\N	27158	\N
41213	GENERIC_DAY	13	4	t	2010-06-15	4354	\N	27158	\N
41214	GENERIC_DAY	13	0	f	2010-07-08	4352	\N	27158	\N
41215	GENERIC_DAY	13	9	f	2010-07-06	4354	\N	27158	\N
41216	GENERIC_DAY	13	4	t	2010-06-21	4354	\N	27158	\N
41217	GENERIC_DAY	13	0	f	2010-07-24	4352	\N	27158	\N
41218	GENERIC_DAY	13	4	t	2010-06-21	4352	\N	27158	\N
41219	GENERIC_DAY	13	9	f	2010-07-05	4354	\N	27158	\N
41220	GENERIC_DAY	13	0	t	2010-06-20	4354	\N	27158	\N
41221	GENERIC_DAY	13	1	f	2010-06-28	4352	\N	27158	\N
41222	GENERIC_DAY	13	0	f	2010-07-25	4354	\N	27158	\N
41223	GENERIC_DAY	13	0	f	2010-07-31	4352	\N	27158	\N
41224	GENERIC_DAY	13	1	f	2010-08-02	4352	\N	27158	\N
41225	GENERIC_DAY	13	9	f	2010-07-07	4354	\N	27158	\N
41226	GENERIC_DAY	13	0	f	2010-07-11	4352	\N	27158	\N
41227	GENERIC_DAY	13	0	t	2010-06-19	4352	\N	27158	\N
41228	GENERIC_DAY	13	4	t	2010-06-17	4352	\N	27158	\N
41229	GENERIC_DAY	13	0	f	2010-07-13	4352	\N	27158	\N
41230	GENERIC_DAY	13	9	f	2010-07-13	4354	\N	27158	\N
41231	GENERIC_DAY	13	1	f	2010-08-04	4352	\N	27158	\N
41232	GENERIC_DAY	13	1	f	2010-07-27	4352	\N	27158	\N
41233	GENERIC_DAY	13	8	f	2010-08-03	4354	\N	27158	\N
41234	GENERIC_DAY	13	8	f	2010-07-02	4354	\N	27158	\N
41235	GENERIC_DAY	13	0	f	2010-07-12	4352	\N	27158	\N
41236	GENERIC_DAY	13	4	t	2010-06-25	4354	\N	27158	\N
41237	GENERIC_DAY	13	0	t	2010-06-20	4352	\N	27158	\N
41238	GENERIC_DAY	13	0	f	2010-07-04	4354	\N	27158	\N
41239	GENERIC_DAY	13	0	f	2010-07-14	4352	\N	27158	\N
41240	GENERIC_DAY	13	8	t	2010-06-14	4354	\N	27158	\N
41241	GENERIC_DAY	13	4	t	2010-06-24	4354	\N	27158	\N
41242	GENERIC_DAY	12	3	f	2010-06-28	4348	\N	27159	\N
41243	GENERIC_DAY	12	4	f	2010-06-14	4350	\N	27159	\N
41244	GENERIC_DAY	12	0	f	2010-06-23	4350	\N	27159	\N
41245	GENERIC_DAY	12	0	f	2010-06-26	4350	\N	27159	\N
41246	GENERIC_DAY	12	3	f	2010-06-22	4358	\N	27159	\N
41247	GENERIC_DAY	12	0	f	2010-07-04	4348	\N	27159	\N
41248	GENERIC_DAY	12	4	f	2010-06-15	21817	\N	27159	\N
41249	GENERIC_DAY	12	3	f	2010-07-01	4358	\N	27159	\N
41250	GENERIC_DAY	12	3	f	2010-07-07	4348	\N	27159	\N
41251	GENERIC_DAY	12	0	f	2010-07-04	4344	\N	27159	\N
41252	GENERIC_DAY	12	3	f	2010-06-24	4358	\N	27159	\N
41253	GENERIC_DAY	12	0	f	2010-06-25	4350	\N	27159	\N
41254	GENERIC_DAY	12	3	f	2010-06-28	21817	\N	27159	\N
41255	GENERIC_DAY	12	0	f	2010-06-16	4344	\N	27159	\N
41256	GENERIC_DAY	12	2	f	2010-06-29	4358	\N	27159	\N
41257	GENERIC_DAY	12	3	f	2010-07-01	4348	\N	27159	\N
41258	GENERIC_DAY	12	4	f	2010-06-14	4358	\N	27159	\N
41259	GENERIC_DAY	12	2	f	2010-06-22	21817	\N	27159	\N
41260	GENERIC_DAY	12	0	f	2010-06-23	4344	\N	27159	\N
41261	GENERIC_DAY	12	3	f	2010-07-07	21817	\N	27159	\N
41262	GENERIC_DAY	12	0	f	2010-06-27	4344	\N	27159	\N
41263	GENERIC_DAY	12	0	f	2010-06-16	4348	\N	27159	\N
41264	GENERIC_DAY	12	0	f	2010-07-03	21817	\N	27159	\N
41265	GENERIC_DAY	12	2	f	2010-06-28	4358	\N	27159	\N
41266	GENERIC_DAY	12	4	f	2010-06-15	4358	\N	27159	\N
41267	GENERIC_DAY	12	3	f	2010-07-05	4348	\N	27159	\N
41268	GENERIC_DAY	12	2	f	2010-07-07	4358	\N	27159	\N
41269	GENERIC_DAY	12	1	f	2010-07-08	4350	\N	27159	\N
41270	GENERIC_DAY	12	0	f	2010-06-20	4358	\N	27159	\N
41271	GENERIC_DAY	12	2	f	2010-07-02	4358	\N	27159	\N
41272	GENERIC_DAY	12	0	f	2010-07-06	4350	\N	27159	\N
41273	GENERIC_DAY	12	0	f	2010-06-26	4348	\N	27159	\N
41274	GENERIC_DAY	12	0	f	2010-06-30	4344	\N	27159	\N
41275	GENERIC_DAY	12	0	f	2010-06-27	21817	\N	27159	\N
41276	GENERIC_DAY	12	0	f	2010-06-29	4350	\N	27159	\N
41277	GENERIC_DAY	12	3	f	2010-06-24	4348	\N	27159	\N
41278	GENERIC_DAY	12	0	f	2010-06-20	4350	\N	27159	\N
41279	GENERIC_DAY	12	2	f	2010-06-30	4348	\N	27159	\N
41280	GENERIC_DAY	12	0	f	2010-06-15	4350	\N	27159	\N
41281	GENERIC_DAY	12	0	f	2010-06-29	4344	\N	27159	\N
41282	GENERIC_DAY	12	0	f	2010-06-26	4344	\N	27159	\N
41283	GENERIC_DAY	12	2	f	2010-06-23	21817	\N	27159	\N
41284	GENERIC_DAY	12	3	f	2010-07-06	4348	\N	27159	\N
41285	GENERIC_DAY	12	2	f	2010-07-01	21817	\N	27159	\N
41286	GENERIC_DAY	12	0	f	2010-07-03	4350	\N	27159	\N
41287	GENERIC_DAY	12	0	f	2010-06-22	4344	\N	27159	\N
41288	GENERIC_DAY	12	0	f	2010-06-27	4358	\N	27159	\N
41289	GENERIC_DAY	12	3	f	2010-06-22	4348	\N	27159	\N
41290	GENERIC_DAY	12	3	f	2010-07-02	21817	\N	27159	\N
41291	GENERIC_DAY	12	0	f	2010-07-07	4344	\N	27159	\N
41292	GENERIC_DAY	12	0	f	2010-07-01	4344	\N	27159	\N
41293	GENERIC_DAY	12	0	f	2010-06-15	4344	\N	27159	\N
41294	GENERIC_DAY	12	3	f	2010-06-23	4348	\N	27159	\N
41295	GENERIC_DAY	12	3	f	2010-07-06	21817	\N	27159	\N
41296	GENERIC_DAY	12	0	f	2010-06-19	4350	\N	27159	\N
41297	GENERIC_DAY	12	0	f	2010-06-18	4344	\N	27159	\N
41298	GENERIC_DAY	12	0	f	2010-06-20	21817	\N	27159	\N
41299	GENERIC_DAY	12	0	f	2010-07-02	4350	\N	27159	\N
41300	GENERIC_DAY	12	0	f	2010-06-19	4348	\N	27159	\N
41301	GENERIC_DAY	12	4	f	2010-06-18	4358	\N	27159	\N
41302	GENERIC_DAY	12	0	f	2010-06-17	4348	\N	27159	\N
41303	GENERIC_DAY	12	0	f	2010-07-05	4344	\N	27159	\N
41304	GENERIC_DAY	12	0	f	2010-06-18	4350	\N	27159	\N
41305	GENERIC_DAY	12	4	f	2010-06-16	4358	\N	27159	\N
41306	GENERIC_DAY	12	2	f	2010-07-06	4358	\N	27159	\N
41307	GENERIC_DAY	12	0	f	2010-06-21	4350	\N	27159	\N
41308	GENERIC_DAY	12	3	f	2010-06-25	4348	\N	27159	\N
41309	GENERIC_DAY	12	3	f	2010-07-05	21817	\N	27159	\N
41310	GENERIC_DAY	12	1	f	2010-07-08	4348	\N	27159	\N
41311	GENERIC_DAY	12	0	f	2010-06-21	4348	\N	27159	\N
41312	GENERIC_DAY	12	0	f	2010-07-05	4350	\N	27159	\N
41313	GENERIC_DAY	12	3	f	2010-06-29	21817	\N	27159	\N
41314	GENERIC_DAY	12	0	f	2010-06-26	4358	\N	27159	\N
41315	GENERIC_DAY	12	0	f	2010-06-15	4348	\N	27159	\N
41316	GENERIC_DAY	12	0	f	2010-06-16	4350	\N	27159	\N
41317	GENERIC_DAY	12	0	f	2010-06-24	4350	\N	27159	\N
41318	GENERIC_DAY	12	0	f	2010-07-03	4358	\N	27159	\N
41319	GENERIC_DAY	12	4	f	2010-06-21	21817	\N	27159	\N
41320	GENERIC_DAY	12	0	f	2010-06-28	4344	\N	27159	\N
41321	GENERIC_DAY	12	2	f	2010-06-24	21817	\N	27159	\N
41322	GENERIC_DAY	12	0	f	2010-07-03	4348	\N	27159	\N
41323	GENERIC_DAY	12	0	f	2010-06-20	4344	\N	27159	\N
41324	GENERIC_DAY	12	0	f	2010-07-02	4344	\N	27159	\N
41325	GENERIC_DAY	12	0	f	2010-07-01	4350	\N	27159	\N
41326	GENERIC_DAY	12	0	f	2010-07-04	4358	\N	27159	\N
41327	GENERIC_DAY	12	0	f	2010-06-26	21817	\N	27159	\N
41328	GENERIC_DAY	12	4	f	2010-06-18	21817	\N	27159	\N
41329	GENERIC_DAY	12	0	f	2010-06-17	4350	\N	27159	\N
41330	GENERIC_DAY	12	4	f	2010-06-21	4358	\N	27159	\N
41331	GENERIC_DAY	12	0	f	2010-06-22	4350	\N	27159	\N
41332	GENERIC_DAY	12	0	f	2010-06-30	4350	\N	27159	\N
41333	GENERIC_DAY	12	4	f	2010-06-17	21817	\N	27159	\N
41334	GENERIC_DAY	12	4	f	2010-06-17	4358	\N	27159	\N
41335	GENERIC_DAY	12	0	f	2010-06-21	4344	\N	27159	\N
41336	GENERIC_DAY	12	2	f	2010-07-08	21817	\N	27159	\N
41337	GENERIC_DAY	12	3	f	2010-06-30	21817	\N	27159	\N
41338	GENERIC_DAY	12	0	f	2010-06-24	4344	\N	27159	\N
41339	GENERIC_DAY	12	3	f	2010-06-30	4358	\N	27159	\N
41340	GENERIC_DAY	12	3	f	2010-06-23	4358	\N	27159	\N
41341	GENERIC_DAY	12	3	f	2010-06-29	4348	\N	27159	\N
41342	GENERIC_DAY	12	0	f	2010-06-20	4348	\N	27159	\N
41343	GENERIC_DAY	12	0	f	2010-07-06	4344	\N	27159	\N
41344	GENERIC_DAY	12	0	f	2010-07-08	4344	\N	27159	\N
41345	GENERIC_DAY	12	0	f	2010-06-18	4348	\N	27159	\N
41346	GENERIC_DAY	12	0	f	2010-06-19	21817	\N	27159	\N
41347	GENERIC_DAY	12	0	f	2010-06-25	4344	\N	27159	\N
41348	GENERIC_DAY	12	2	f	2010-07-05	4358	\N	27159	\N
41349	GENERIC_DAY	12	0	f	2010-06-19	4344	\N	27159	\N
41350	GENERIC_DAY	12	0	f	2010-06-27	4348	\N	27159	\N
41351	GENERIC_DAY	12	2	f	2010-06-25	21817	\N	27159	\N
41352	GENERIC_DAY	12	0	f	2010-07-07	4350	\N	27159	\N
41353	GENERIC_DAY	12	0	f	2010-06-27	4350	\N	27159	\N
41354	GENERIC_DAY	12	0	f	2010-06-17	4344	\N	27159	\N
41355	GENERIC_DAY	12	2	f	2010-07-08	4358	\N	27159	\N
41356	GENERIC_DAY	12	0	f	2010-07-04	21817	\N	27159	\N
41357	GENERIC_DAY	12	3	f	2010-07-02	4348	\N	27159	\N
41358	GENERIC_DAY	12	3	f	2010-06-25	4358	\N	27159	\N
41359	GENERIC_DAY	12	4	f	2010-06-16	21817	\N	27159	\N
41360	GENERIC_DAY	12	0	f	2010-06-19	4358	\N	27159	\N
41361	GENERIC_DAY	12	0	f	2010-07-03	4344	\N	27159	\N
41362	GENERIC_DAY	12	0	f	2010-07-04	4350	\N	27159	\N
41363	GENERIC_DAY	12	0	f	2010-06-28	4350	\N	27159	\N
41364	GENERIC_DAY	11	8	f	2010-07-20	4354	\N	27160	\N
41365	GENERIC_DAY	11	0	f	2010-07-10	4352	\N	27160	\N
41366	GENERIC_DAY	11	0	f	2010-07-09	4352	\N	27160	\N
41367	GENERIC_DAY	11	0	f	2010-07-25	4354	\N	27160	\N
41368	GENERIC_DAY	11	0	f	2010-07-17	4352	\N	27160	\N
41369	GENERIC_DAY	11	0	f	2010-07-18	4354	\N	27160	\N
41370	GENERIC_DAY	11	0	f	2010-07-15	4352	\N	27160	\N
41371	GENERIC_DAY	11	0	f	2010-07-27	4352	\N	27160	\N
41372	GENERIC_DAY	11	0	f	2010-07-23	4352	\N	27160	\N
41373	GENERIC_DAY	11	0	f	2010-07-18	4352	\N	27160	\N
41374	GENERIC_DAY	11	8	f	2010-07-12	4354	\N	27160	\N
41375	GENERIC_DAY	11	0	f	2010-07-10	4354	\N	27160	\N
41376	GENERIC_DAY	11	0	f	2010-07-20	4352	\N	27160	\N
41377	GENERIC_DAY	11	0	f	2010-07-19	4352	\N	27160	\N
41378	GENERIC_DAY	11	0	f	2010-07-11	4354	\N	27160	\N
41379	GENERIC_DAY	11	8	f	2010-07-09	4354	\N	27160	\N
41380	GENERIC_DAY	11	0	f	2010-07-24	4352	\N	27160	\N
41381	GENERIC_DAY	11	0	f	2010-07-17	4354	\N	27160	\N
41382	GENERIC_DAY	11	4	f	2010-07-27	4354	\N	27160	\N
41383	GENERIC_DAY	11	0	f	2010-07-14	4352	\N	27160	\N
41384	GENERIC_DAY	11	0	f	2010-07-25	4352	\N	27160	\N
41385	GENERIC_DAY	11	0	f	2010-07-13	4352	\N	27160	\N
41386	GENERIC_DAY	11	8	f	2010-07-14	4354	\N	27160	\N
41387	GENERIC_DAY	11	0	f	2010-07-24	4354	\N	27160	\N
41388	GENERIC_DAY	11	8	f	2010-07-13	4354	\N	27160	\N
41389	GENERIC_DAY	11	8	f	2010-07-23	4354	\N	27160	\N
41390	GENERIC_DAY	11	8	f	2010-07-21	4354	\N	27160	\N
41391	GENERIC_DAY	11	0	f	2010-07-21	4352	\N	27160	\N
41392	GENERIC_DAY	11	0	f	2010-07-16	4352	\N	27160	\N
41393	GENERIC_DAY	11	8	f	2010-07-26	4354	\N	27160	\N
41394	GENERIC_DAY	11	0	f	2010-07-26	4352	\N	27160	\N
41395	GENERIC_DAY	11	8	f	2010-07-16	4354	\N	27160	\N
41396	GENERIC_DAY	11	0	f	2010-07-22	4352	\N	27160	\N
41397	GENERIC_DAY	11	8	f	2010-07-22	4354	\N	27160	\N
41398	GENERIC_DAY	11	8	f	2010-07-19	4354	\N	27160	\N
41399	GENERIC_DAY	11	0	f	2010-07-11	4352	\N	27160	\N
41400	GENERIC_DAY	11	0	f	2010-07-12	4352	\N	27160	\N
41401	GENERIC_DAY	11	8	f	2010-07-15	4354	\N	27160	\N
41402	GENERIC_DAY	10	4	f	2010-08-26	4354	\N	27161	\N
41403	GENERIC_DAY	10	4	f	2010-08-05	4354	\N	27161	\N
41404	GENERIC_DAY	10	0	f	2010-08-03	4352	\N	27161	\N
41405	GENERIC_DAY	10	4	f	2010-08-31	4352	\N	27161	\N
41406	GENERIC_DAY	10	0	f	2010-08-14	4352	\N	27161	\N
41407	GENERIC_DAY	10	4	f	2010-08-24	4352	\N	27161	\N
41408	GENERIC_DAY	10	4	f	2010-08-17	4352	\N	27161	\N
41409	GENERIC_DAY	10	4	f	2010-08-05	4352	\N	27161	\N
41410	GENERIC_DAY	10	4	f	2010-08-12	4352	\N	27161	\N
41411	GENERIC_DAY	10	0	f	2010-08-21	4354	\N	27161	\N
41412	GENERIC_DAY	10	4	f	2010-08-11	4354	\N	27161	\N
41413	GENERIC_DAY	10	4	f	2010-08-12	4354	\N	27161	\N
41414	GENERIC_DAY	10	4	f	2010-08-20	4352	\N	27161	\N
41415	GENERIC_DAY	10	0	f	2010-08-22	4352	\N	27161	\N
41416	GENERIC_DAY	10	0	f	2010-08-14	4354	\N	27161	\N
41417	GENERIC_DAY	10	0	f	2010-08-15	4352	\N	27161	\N
41418	GENERIC_DAY	10	4	f	2010-08-23	4352	\N	27161	\N
41419	GENERIC_DAY	10	4	f	2010-08-30	4354	\N	27161	\N
41420	GENERIC_DAY	10	8	f	2010-08-02	4354	\N	27161	\N
41421	GENERIC_DAY	10	4	f	2010-08-19	4354	\N	27161	\N
41422	GENERIC_DAY	10	4	f	2010-08-13	4352	\N	27161	\N
41423	GENERIC_DAY	10	4	f	2010-08-13	4354	\N	27161	\N
41424	GENERIC_DAY	10	0	f	2010-07-31	4354	\N	27161	\N
41425	GENERIC_DAY	10	4	f	2010-08-18	4352	\N	27161	\N
41426	GENERIC_DAY	10	0	f	2010-07-29	4352	\N	27161	\N
41427	GENERIC_DAY	10	2	f	2010-08-04	4352	\N	27161	\N
41428	GENERIC_DAY	10	0	f	2010-07-30	4352	\N	27161	\N
41429	GENERIC_DAY	10	0	f	2010-07-28	4352	\N	27161	\N
41430	GENERIC_DAY	10	0	f	2010-08-28	4352	\N	27161	\N
41431	GENERIC_DAY	10	4	f	2010-08-20	4354	\N	27161	\N
41432	GENERIC_DAY	10	4	f	2010-08-06	4354	\N	27161	\N
41433	GENERIC_DAY	10	4	f	2010-08-27	4352	\N	27161	\N
41434	GENERIC_DAY	10	8	f	2010-07-30	4354	\N	27161	\N
41435	GENERIC_DAY	10	0	f	2010-08-15	4354	\N	27161	\N
41436	GENERIC_DAY	10	4	f	2010-08-31	4354	\N	27161	\N
41437	GENERIC_DAY	10	4	f	2010-08-30	4352	\N	27161	\N
41438	GENERIC_DAY	10	4	f	2010-08-17	4354	\N	27161	\N
41439	GENERIC_DAY	10	4	f	2010-08-19	4352	\N	27161	\N
41440	GENERIC_DAY	10	4	f	2010-08-16	4354	\N	27161	\N
41441	GENERIC_DAY	10	4	f	2010-08-10	4352	\N	27161	\N
41442	GENERIC_DAY	10	4	f	2010-08-26	4352	\N	27161	\N
41443	GENERIC_DAY	10	0	f	2010-08-07	4354	\N	27161	\N
41444	GENERIC_DAY	10	4	f	2010-08-27	4354	\N	27161	\N
41445	GENERIC_DAY	10	0	f	2010-07-31	4352	\N	27161	\N
41446	GENERIC_DAY	10	8	f	2010-07-28	4354	\N	27161	\N
41447	GENERIC_DAY	10	8	f	2010-08-03	4354	\N	27161	\N
41448	GENERIC_DAY	10	0	f	2010-08-01	4352	\N	27161	\N
41449	GENERIC_DAY	10	4	f	2010-08-09	4352	\N	27161	\N
41450	GENERIC_DAY	10	0	f	2010-08-08	4354	\N	27161	\N
41451	GENERIC_DAY	10	6	f	2010-08-04	4354	\N	27161	\N
41452	GENERIC_DAY	10	4	f	2010-08-25	4354	\N	27161	\N
41453	GENERIC_DAY	10	0	f	2010-08-01	4354	\N	27161	\N
41454	GENERIC_DAY	10	4	f	2010-08-10	4354	\N	27161	\N
41455	GENERIC_DAY	10	0	f	2010-08-07	4352	\N	27161	\N
41456	GENERIC_DAY	10	0	f	2010-08-29	4354	\N	27161	\N
41457	GENERIC_DAY	10	4	f	2010-08-24	4354	\N	27161	\N
41458	GENERIC_DAY	10	4	f	2010-08-18	4354	\N	27161	\N
41459	GENERIC_DAY	10	4	f	2010-08-06	4352	\N	27161	\N
41460	GENERIC_DAY	10	0	f	2010-08-08	4352	\N	27161	\N
41461	GENERIC_DAY	10	4	f	2010-08-25	4352	\N	27161	\N
41462	GENERIC_DAY	10	4	f	2010-08-09	4354	\N	27161	\N
41463	GENERIC_DAY	10	0	f	2010-08-21	4352	\N	27161	\N
41464	GENERIC_DAY	10	4	f	2010-08-11	4352	\N	27161	\N
41465	GENERIC_DAY	10	4	f	2010-08-23	4354	\N	27161	\N
41466	GENERIC_DAY	10	4	f	2010-08-16	4352	\N	27161	\N
41467	GENERIC_DAY	10	0	f	2010-08-22	4354	\N	27161	\N
41468	GENERIC_DAY	10	8	f	2010-07-29	4354	\N	27161	\N
41469	GENERIC_DAY	10	0	f	2010-08-28	4354	\N	27161	\N
41470	GENERIC_DAY	10	0	f	2010-08-29	4352	\N	27161	\N
41471	GENERIC_DAY	10	0	f	2010-08-02	4352	\N	27161	\N
41472	GENERIC_DAY	9	0	f	2010-07-04	4344	\N	27162	\N
41473	GENERIC_DAY	9	0	f	2010-07-10	4344	\N	27162	\N
41474	GENERIC_DAY	9	2	f	2010-07-19	4348	\N	27162	\N
41475	GENERIC_DAY	9	2	f	2010-07-27	4350	\N	27162	\N
41476	GENERIC_DAY	9	0	f	2010-07-15	4344	\N	27162	\N
41477	GENERIC_DAY	9	2	f	2010-07-08	21817	\N	27162	\N
41478	GENERIC_DAY	9	0	f	2010-07-16	4344	\N	27162	\N
41479	GENERIC_DAY	9	2	f	2010-07-09	4350	\N	27162	\N
41480	GENERIC_DAY	9	0	f	2010-07-11	4348	\N	27162	\N
41481	GENERIC_DAY	9	0	f	2010-07-10	4358	\N	27162	\N
41482	GENERIC_DAY	9	0	f	2010-07-25	4358	\N	27162	\N
41483	GENERIC_DAY	9	1	f	2010-07-28	4350	\N	27162	\N
41484	GENERIC_DAY	9	2	f	2010-07-26	4350	\N	27162	\N
41485	GENERIC_DAY	9	3	f	2010-07-15	4358	\N	27162	\N
41486	GENERIC_DAY	9	3	f	2010-07-06	4348	\N	27162	\N
41487	GENERIC_DAY	9	0	f	2010-07-09	4344	\N	27162	\N
41488	GENERIC_DAY	9	2	f	2010-07-21	4348	\N	27162	\N
41489	GENERIC_DAY	9	0	f	2010-07-02	4350	\N	27162	\N
41490	GENERIC_DAY	9	2	f	2010-07-19	4350	\N	27162	\N
41491	GENERIC_DAY	9	0	f	2010-07-07	4344	\N	27162	\N
41492	GENERIC_DAY	9	2	f	2010-07-08	4358	\N	27162	\N
41493	GENERIC_DAY	9	3	f	2010-07-14	4350	\N	27162	\N
41494	GENERIC_DAY	9	0	f	2010-07-03	21817	\N	27162	\N
41495	GENERIC_DAY	9	2	f	2010-07-26	4348	\N	27162	\N
41496	GENERIC_DAY	9	0	f	2010-07-11	4344	\N	27162	\N
41497	GENERIC_DAY	9	0	f	2010-07-24	4344	\N	27162	\N
41498	GENERIC_DAY	9	3	f	2010-07-07	21817	\N	27162	\N
41499	GENERIC_DAY	9	2	f	2010-07-16	4350	\N	27162	\N
41500	GENERIC_DAY	9	3	f	2010-07-16	4348	\N	27162	\N
41501	GENERIC_DAY	9	0	f	2010-07-07	4350	\N	27162	\N
41502	GENERIC_DAY	9	2	f	2010-07-13	4348	\N	27162	\N
41503	GENERIC_DAY	9	0	f	2010-07-25	4348	\N	27162	\N
41504	GENERIC_DAY	9	2	f	2010-07-28	4348	\N	27162	\N
41505	GENERIC_DAY	9	2	f	2010-07-27	4344	\N	27162	\N
41506	GENERIC_DAY	9	0	f	2010-07-18	4348	\N	27162	\N
41507	GENERIC_DAY	9	0	f	2010-07-10	21817	\N	27162	\N
41508	GENERIC_DAY	9	0	f	2010-07-06	4350	\N	27162	\N
41509	GENERIC_DAY	9	0	f	2010-07-12	4344	\N	27162	\N
41510	GENERIC_DAY	9	2	f	2010-07-07	4358	\N	27162	\N
41511	GENERIC_DAY	9	2	f	2010-07-13	4350	\N	27162	\N
41512	GENERIC_DAY	9	1	f	2010-07-28	4344	\N	27162	\N
41513	GENERIC_DAY	9	2	f	2010-07-23	4348	\N	27162	\N
41514	GENERIC_DAY	9	2	f	2010-07-23	4350	\N	27162	\N
41515	GENERIC_DAY	9	3	f	2010-07-14	4348	\N	27162	\N
41516	GENERIC_DAY	9	0	f	2010-07-03	4358	\N	27162	\N
41517	GENERIC_DAY	9	0	f	2010-07-03	4348	\N	27162	\N
41518	GENERIC_DAY	9	0	f	2010-07-17	4350	\N	27162	\N
41519	GENERIC_DAY	9	0	f	2010-07-04	4358	\N	27162	\N
41520	GENERIC_DAY	9	0	f	2010-07-25	4350	\N	27162	\N
41521	GENERIC_DAY	9	3	f	2010-07-07	4348	\N	27162	\N
41522	GENERIC_DAY	9	0	f	2010-07-08	4344	\N	27162	\N
41523	GENERIC_DAY	9	2	f	2010-07-20	4350	\N	27162	\N
41524	GENERIC_DAY	9	2	f	2010-07-12	4358	\N	27162	\N
41525	GENERIC_DAY	9	0	f	2010-07-14	4344	\N	27162	\N
41526	GENERIC_DAY	9	2	f	2010-07-28	4358	\N	27162	\N
41527	GENERIC_DAY	9	0	f	2010-07-02	4344	\N	27162	\N
41528	GENERIC_DAY	9	2	f	2010-07-22	4350	\N	27162	\N
41529	GENERIC_DAY	9	3	f	2010-07-16	4358	\N	27162	\N
41530	GENERIC_DAY	9	0	f	2010-07-04	4350	\N	27162	\N
41531	GENERIC_DAY	9	2	f	2010-07-08	4350	\N	27162	\N
41532	GENERIC_DAY	9	3	f	2010-07-15	4348	\N	27162	\N
41533	GENERIC_DAY	9	0	f	2010-07-25	4344	\N	27162	\N
41534	GENERIC_DAY	9	2	f	2010-07-20	4344	\N	27162	\N
41535	GENERIC_DAY	9	0	f	2010-07-11	4350	\N	27162	\N
41536	GENERIC_DAY	9	2	f	2010-07-21	4350	\N	27162	\N
41537	GENERIC_DAY	9	0	f	2010-07-17	4348	\N	27162	\N
41538	GENERIC_DAY	9	2	f	2010-07-14	4358	\N	27162	\N
41539	GENERIC_DAY	9	2	f	2010-07-13	21817	\N	27162	\N
41540	GENERIC_DAY	9	2	f	2010-07-20	4348	\N	27162	\N
41541	GENERIC_DAY	9	2	f	2010-07-13	4358	\N	27162	\N
41542	GENERIC_DAY	9	3	f	2010-07-02	4348	\N	27162	\N
41543	GENERIC_DAY	9	0	f	2010-07-24	4350	\N	27162	\N
41544	GENERIC_DAY	9	2	f	2010-07-21	4344	\N	27162	\N
41545	GENERIC_DAY	9	0	f	2010-07-05	4344	\N	27162	\N
41546	GENERIC_DAY	9	0	f	2010-07-24	4348	\N	27162	\N
41547	GENERIC_DAY	9	2	f	2010-07-22	4348	\N	27162	\N
41548	GENERIC_DAY	9	2	f	2010-07-26	4344	\N	27162	\N
41549	GENERIC_DAY	9	0	f	2010-07-18	4358	\N	27162	\N
41550	GENERIC_DAY	9	0	f	2010-07-24	4358	\N	27162	\N
41551	GENERIC_DAY	9	0	f	2010-07-06	4344	\N	27162	\N
41552	GENERIC_DAY	9	2	f	2010-07-21	4358	\N	27162	\N
41553	GENERIC_DAY	9	2	f	2010-07-08	4348	\N	27162	\N
41554	GENERIC_DAY	9	0	f	2010-07-13	4344	\N	27162	\N
41555	GENERIC_DAY	9	0	f	2010-07-04	4348	\N	27162	\N
41556	GENERIC_DAY	9	2	f	2010-07-26	4358	\N	27162	\N
41557	GENERIC_DAY	9	2	f	2010-07-19	4344	\N	27162	\N
41558	GENERIC_DAY	9	2	f	2010-07-09	4358	\N	27162	\N
41559	GENERIC_DAY	9	2	f	2010-07-23	4358	\N	27162	\N
41560	GENERIC_DAY	9	0	f	2010-07-17	4358	\N	27162	\N
41561	GENERIC_DAY	9	2	f	2010-07-02	4358	\N	27162	\N
41562	GENERIC_DAY	9	0	f	2010-07-11	21817	\N	27162	\N
41563	GENERIC_DAY	9	2	f	2010-07-12	4350	\N	27162	\N
41564	GENERIC_DAY	9	0	f	2010-07-18	4344	\N	27162	\N
41565	GENERIC_DAY	9	3	f	2010-07-05	21817	\N	27162	\N
41566	GENERIC_DAY	9	2	f	2010-07-22	4344	\N	27162	\N
41567	GENERIC_DAY	9	2	f	2010-07-20	4358	\N	27162	\N
41568	GENERIC_DAY	9	3	f	2010-07-05	4348	\N	27162	\N
41569	GENERIC_DAY	9	3	f	2010-07-02	21817	\N	27162	\N
41570	GENERIC_DAY	9	2	f	2010-07-22	4358	\N	27162	\N
41571	GENERIC_DAY	9	2	f	2010-07-27	4358	\N	27162	\N
41572	GENERIC_DAY	9	2	f	2010-07-19	4358	\N	27162	\N
41573	GENERIC_DAY	9	2	f	2010-07-09	21817	\N	27162	\N
41574	GENERIC_DAY	9	2	f	2010-07-09	4348	\N	27162	\N
41575	GENERIC_DAY	9	2	f	2010-07-23	4344	\N	27162	\N
41576	GENERIC_DAY	9	2	f	2010-07-15	4350	\N	27162	\N
41577	GENERIC_DAY	9	0	f	2010-07-05	4350	\N	27162	\N
41578	GENERIC_DAY	9	2	f	2010-07-05	4358	\N	27162	\N
41579	GENERIC_DAY	9	0	f	2010-07-11	4358	\N	27162	\N
41580	GENERIC_DAY	9	0	f	2010-07-17	4344	\N	27162	\N
41581	GENERIC_DAY	9	3	f	2010-07-06	21817	\N	27162	\N
41582	GENERIC_DAY	9	0	f	2010-07-03	4344	\N	27162	\N
41583	GENERIC_DAY	9	0	f	2010-07-03	4350	\N	27162	\N
41584	GENERIC_DAY	9	0	f	2010-07-18	4350	\N	27162	\N
41585	GENERIC_DAY	9	2	f	2010-07-06	4358	\N	27162	\N
41586	GENERIC_DAY	9	0	f	2010-07-10	4350	\N	27162	\N
41587	GENERIC_DAY	9	2	f	2010-07-12	4348	\N	27162	\N
41588	GENERIC_DAY	9	0	f	2010-07-10	4348	\N	27162	\N
41589	GENERIC_DAY	9	2	f	2010-07-27	4348	\N	27162	\N
41590	GENERIC_DAY	9	0	f	2010-07-04	21817	\N	27162	\N
41591	GENERIC_DAY	9	2	f	2010-07-12	21817	\N	27162	\N
41592	GENERIC_DAY	8	2	f	2010-08-19	4348	\N	27163	\N
41593	GENERIC_DAY	8	2	f	2010-08-23	4348	\N	27163	\N
41594	GENERIC_DAY	8	0	f	2010-08-01	4350	\N	27163	\N
41595	GENERIC_DAY	8	0	f	2010-08-07	4348	\N	27163	\N
41596	GENERIC_DAY	8	2	f	2010-08-05	4358	\N	27163	\N
41597	GENERIC_DAY	8	2	f	2010-08-12	4350	\N	27163	\N
41598	GENERIC_DAY	8	0	f	2010-08-07	4344	\N	27163	\N
41599	GENERIC_DAY	8	0	f	2010-08-14	4348	\N	27163	\N
41600	GENERIC_DAY	8	2	f	2010-08-05	4348	\N	27163	\N
41601	GENERIC_DAY	8	2	f	2010-08-04	4350	\N	27163	\N
41602	GENERIC_DAY	8	2	f	2010-08-16	4348	\N	27163	\N
41603	GENERIC_DAY	8	2	f	2010-08-10	4344	\N	27163	\N
41604	GENERIC_DAY	8	2	f	2010-08-24	4350	\N	27163	\N
41605	GENERIC_DAY	8	2	f	2010-08-09	4348	\N	27163	\N
41606	GENERIC_DAY	8	2	f	2010-08-12	4348	\N	27163	\N
41607	GENERIC_DAY	8	0	f	2010-08-21	4350	\N	27163	\N
41608	GENERIC_DAY	8	0	f	2010-08-29	4348	\N	27163	\N
41609	GENERIC_DAY	8	2	f	2010-09-01	4350	\N	27163	\N
41610	GENERIC_DAY	8	2	f	2010-08-24	4358	\N	27163	\N
41611	GENERIC_DAY	8	2	f	2010-08-18	4350	\N	27163	\N
41612	GENERIC_DAY	8	0	f	2010-08-01	4348	\N	27163	\N
41613	GENERIC_DAY	8	0	f	2010-08-08	4358	\N	27163	\N
41614	GENERIC_DAY	8	2	f	2010-07-29	4350	\N	27163	\N
41615	GENERIC_DAY	8	2	f	2010-08-11	4344	\N	27163	\N
41616	GENERIC_DAY	8	2	f	2010-08-05	4350	\N	27163	\N
41617	GENERIC_DAY	8	2	f	2010-08-31	4358	\N	27163	\N
41618	GENERIC_DAY	8	0	f	2010-08-08	4344	\N	27163	\N
41619	GENERIC_DAY	8	0	f	2010-08-29	4350	\N	27163	\N
41620	GENERIC_DAY	8	2	f	2010-08-31	4350	\N	27163	\N
41621	GENERIC_DAY	8	2	f	2010-08-11	4350	\N	27163	\N
41622	GENERIC_DAY	8	0	f	2010-08-22	4348	\N	27163	\N
41623	GENERIC_DAY	8	2	f	2010-08-20	4358	\N	27163	\N
41624	GENERIC_DAY	8	0	f	2010-08-14	4350	\N	27163	\N
41625	GENERIC_DAY	8	2	f	2010-08-20	4344	\N	27163	\N
41626	GENERIC_DAY	8	2	f	2010-08-12	4358	\N	27163	\N
41627	GENERIC_DAY	8	2	f	2010-08-23	4358	\N	27163	\N
41628	GENERIC_DAY	8	2	f	2010-08-26	4344	\N	27163	\N
41629	GENERIC_DAY	8	2	f	2010-08-26	4358	\N	27163	\N
41630	GENERIC_DAY	8	2	f	2010-07-30	4344	\N	27163	\N
41631	GENERIC_DAY	8	2	f	2010-08-04	4344	\N	27163	\N
41632	GENERIC_DAY	8	0	f	2010-08-28	4350	\N	27163	\N
41633	GENERIC_DAY	8	2	f	2010-08-19	4350	\N	27163	\N
41634	GENERIC_DAY	8	2	f	2010-08-10	4358	\N	27163	\N
41635	GENERIC_DAY	8	0	f	2010-07-31	4348	\N	27163	\N
41636	GENERIC_DAY	8	2	f	2010-08-13	4358	\N	27163	\N
41637	GENERIC_DAY	8	2	f	2010-08-10	4348	\N	27163	\N
41638	GENERIC_DAY	8	2	f	2010-08-17	4358	\N	27163	\N
41639	GENERIC_DAY	8	2	f	2010-08-09	4350	\N	27163	\N
41640	GENERIC_DAY	8	0	f	2010-08-21	4348	\N	27163	\N
41641	GENERIC_DAY	8	2	f	2010-08-06	4350	\N	27163	\N
41642	GENERIC_DAY	8	0	f	2010-07-31	4358	\N	27163	\N
41643	GENERIC_DAY	8	2	f	2010-09-01	4358	\N	27163	\N
41644	GENERIC_DAY	8	2	f	2010-08-16	4350	\N	27163	\N
41645	GENERIC_DAY	8	0	f	2010-08-28	4358	\N	27163	\N
41646	GENERIC_DAY	8	2	f	2010-07-29	4344	\N	27163	\N
41647	GENERIC_DAY	8	0	f	2010-08-07	4350	\N	27163	\N
41648	GENERIC_DAY	8	2	f	2010-07-29	4358	\N	27163	\N
41649	GENERIC_DAY	8	0	f	2010-08-22	4358	\N	27163	\N
41650	GENERIC_DAY	8	0	f	2010-08-01	4358	\N	27163	\N
41651	GENERIC_DAY	8	2	f	2010-08-24	4348	\N	27163	\N
41652	GENERIC_DAY	8	2	f	2010-07-30	4358	\N	27163	\N
41653	GENERIC_DAY	8	2	f	2010-08-23	4344	\N	27163	\N
41654	GENERIC_DAY	8	2	f	2010-08-31	4344	\N	27163	\N
41655	GENERIC_DAY	8	2	f	2010-08-09	4358	\N	27163	\N
41656	GENERIC_DAY	8	2	f	2010-08-17	4344	\N	27163	\N
41657	GENERIC_DAY	8	0	f	2010-08-15	4348	\N	27163	\N
41658	GENERIC_DAY	8	2	f	2010-08-25	4344	\N	27163	\N
41659	GENERIC_DAY	8	2	f	2010-08-17	4350	\N	27163	\N
41660	GENERIC_DAY	8	2	f	2010-08-27	4350	\N	27163	\N
41661	GENERIC_DAY	8	0	f	2010-08-08	4350	\N	27163	\N
41662	GENERIC_DAY	8	2	f	2010-08-04	4358	\N	27163	\N
41663	GENERIC_DAY	8	2	f	2010-08-26	4350	\N	27163	\N
41664	GENERIC_DAY	8	0	f	2010-08-08	4348	\N	27163	\N
41665	GENERIC_DAY	8	0	f	2010-08-15	4358	\N	27163	\N
41666	GENERIC_DAY	8	2	f	2010-08-23	4350	\N	27163	\N
41667	GENERIC_DAY	8	2	f	2010-08-19	4344	\N	27163	\N
41668	GENERIC_DAY	8	0	f	2010-08-29	4358	\N	27163	\N
41669	GENERIC_DAY	8	2	f	2010-08-06	4344	\N	27163	\N
41670	GENERIC_DAY	8	2	f	2010-08-16	4358	\N	27163	\N
41671	GENERIC_DAY	8	2	f	2010-08-31	4348	\N	27163	\N
41672	GENERIC_DAY	8	0	f	2010-08-07	4358	\N	27163	\N
41673	GENERIC_DAY	8	2	f	2010-08-13	4350	\N	27163	\N
41674	GENERIC_DAY	8	2	f	2010-08-18	4358	\N	27163	\N
41675	GENERIC_DAY	8	2	f	2010-08-06	4358	\N	27163	\N
41676	GENERIC_DAY	8	2	f	2010-08-17	4348	\N	27163	\N
41677	GENERIC_DAY	8	0	f	2010-08-28	4344	\N	27163	\N
41678	GENERIC_DAY	8	0	f	2010-07-31	4350	\N	27163	\N
41679	GENERIC_DAY	8	0	f	2010-08-14	4344	\N	27163	\N
41680	GENERIC_DAY	8	2	f	2010-08-02	4344	\N	27163	\N
41681	GENERIC_DAY	8	2	f	2010-08-27	4344	\N	27163	\N
41682	GENERIC_DAY	8	2	f	2010-08-27	4348	\N	27163	\N
41683	GENERIC_DAY	8	0	f	2010-08-21	4344	\N	27163	\N
41684	GENERIC_DAY	8	2	f	2010-08-30	4358	\N	27163	\N
41685	GENERIC_DAY	8	0	f	2010-08-15	4350	\N	27163	\N
41686	GENERIC_DAY	8	2	f	2010-08-05	4344	\N	27163	\N
41687	GENERIC_DAY	8	2	f	2010-08-25	4348	\N	27163	\N
41688	GENERIC_DAY	8	0	f	2010-08-22	4350	\N	27163	\N
41689	GENERIC_DAY	8	2	f	2010-08-26	4348	\N	27163	\N
41690	GENERIC_DAY	8	2	f	2010-08-06	4348	\N	27163	\N
41691	GENERIC_DAY	8	2	f	2010-08-20	4348	\N	27163	\N
41692	GENERIC_DAY	8	2	f	2010-08-10	4350	\N	27163	\N
41693	GENERIC_DAY	8	0	f	2010-08-22	4344	\N	27163	\N
41694	GENERIC_DAY	8	2	f	2010-08-03	4358	\N	27163	\N
41695	GENERIC_DAY	8	2	f	2010-09-01	4344	\N	27163	\N
41696	GENERIC_DAY	8	0	f	2010-07-31	4344	\N	27163	\N
41697	GENERIC_DAY	8	2	f	2010-08-24	4344	\N	27163	\N
41698	GENERIC_DAY	8	2	f	2010-08-02	4350	\N	27163	\N
41699	GENERIC_DAY	8	2	f	2010-08-18	4344	\N	27163	\N
41700	GENERIC_DAY	8	2	f	2010-08-30	4350	\N	27163	\N
41701	GENERIC_DAY	8	2	f	2010-08-25	4350	\N	27163	\N
41702	GENERIC_DAY	8	2	f	2010-08-09	4344	\N	27163	\N
41703	GENERIC_DAY	8	2	f	2010-08-18	4348	\N	27163	\N
41704	GENERIC_DAY	8	0	f	2010-08-15	4344	\N	27163	\N
41705	GENERIC_DAY	8	2	f	2010-08-20	4350	\N	27163	\N
41706	GENERIC_DAY	8	2	f	2010-08-19	4358	\N	27163	\N
41707	GENERIC_DAY	8	2	f	2010-08-12	4344	\N	27163	\N
41708	GENERIC_DAY	8	2	f	2010-08-30	4344	\N	27163	\N
41709	GENERIC_DAY	8	0	f	2010-08-01	4344	\N	27163	\N
41710	GENERIC_DAY	8	2	f	2010-09-01	4348	\N	27163	\N
41711	GENERIC_DAY	8	2	f	2010-08-03	4348	\N	27163	\N
41712	GENERIC_DAY	8	2	f	2010-08-25	4358	\N	27163	\N
41713	GENERIC_DAY	8	2	f	2010-08-13	4348	\N	27163	\N
41714	GENERIC_DAY	8	2	f	2010-08-30	4348	\N	27163	\N
41715	GENERIC_DAY	8	2	f	2010-07-30	4348	\N	27163	\N
41716	GENERIC_DAY	8	0	f	2010-08-21	4358	\N	27163	\N
41717	GENERIC_DAY	8	2	f	2010-08-13	4344	\N	27163	\N
41718	GENERIC_DAY	8	2	f	2010-08-04	4348	\N	27163	\N
41719	GENERIC_DAY	8	0	f	2010-08-14	4358	\N	27163	\N
41720	GENERIC_DAY	8	2	f	2010-08-27	4358	\N	27163	\N
41721	GENERIC_DAY	8	2	f	2010-07-29	4348	\N	27163	\N
41722	GENERIC_DAY	8	0	f	2010-08-28	4348	\N	27163	\N
41723	GENERIC_DAY	8	2	f	2010-08-02	4348	\N	27163	\N
41724	GENERIC_DAY	8	2	f	2010-08-03	4350	\N	27163	\N
41725	GENERIC_DAY	8	2	f	2010-08-16	4344	\N	27163	\N
41726	GENERIC_DAY	8	2	f	2010-07-30	4350	\N	27163	\N
41727	GENERIC_DAY	8	0	f	2010-08-29	4344	\N	27163	\N
41728	GENERIC_DAY	8	2	f	2010-08-02	4358	\N	27163	\N
41729	GENERIC_DAY	8	2	f	2010-08-11	4348	\N	27163	\N
41730	GENERIC_DAY	8	2	f	2010-08-03	4344	\N	27163	\N
41731	GENERIC_DAY	8	2	f	2010-08-11	4358	\N	27163	\N
41732	SPECIFIC_DAY	8	0	f	2010-06-26	1216	31235	\N	\N
41733	SPECIFIC_DAY	8	0	f	2010-06-13	1216	31235	\N	\N
41734	SPECIFIC_DAY	8	8	f	2010-06-15	1216	31235	\N	\N
41735	SPECIFIC_DAY	8	8	f	2010-06-17	1216	31235	\N	\N
41736	SPECIFIC_DAY	8	8	f	2010-06-24	1216	31235	\N	\N
41737	SPECIFIC_DAY	8	8	f	2010-06-25	1216	31235	\N	\N
41738	SPECIFIC_DAY	8	8	f	2010-06-28	1216	31235	\N	\N
41739	SPECIFIC_DAY	8	8	f	2010-06-21	1216	31235	\N	\N
41740	SPECIFIC_DAY	8	8	f	2010-06-29	1216	31235	\N	\N
41741	SPECIFIC_DAY	8	8	f	2010-06-18	1216	31235	\N	\N
41742	SPECIFIC_DAY	8	4	f	2010-06-30	1216	31235	\N	\N
41743	SPECIFIC_DAY	8	0	f	2010-06-19	1216	31235	\N	\N
41744	SPECIFIC_DAY	8	0	f	2010-06-27	1216	31235	\N	\N
41745	SPECIFIC_DAY	8	8	f	2010-06-14	1216	31235	\N	\N
41746	SPECIFIC_DAY	8	8	f	2010-06-22	1216	31235	\N	\N
41747	SPECIFIC_DAY	8	0	f	2010-06-20	1216	31235	\N	\N
41748	SPECIFIC_DAY	8	8	f	2010-06-16	1216	31235	\N	\N
41749	SPECIFIC_DAY	8	8	f	2010-06-23	1216	31235	\N	\N
41750	SPECIFIC_DAY	8	8	f	2010-07-06	1220	31236	\N	\N
41751	SPECIFIC_DAY	8	8	f	2010-07-14	1220	31236	\N	\N
41752	SPECIFIC_DAY	8	0	f	2010-07-03	1220	31236	\N	\N
41753	SPECIFIC_DAY	8	0	f	2010-07-11	1220	31236	\N	\N
41754	SPECIFIC_DAY	8	0	f	2010-07-10	1220	31236	\N	\N
41755	SPECIFIC_DAY	8	8	f	2010-07-15	1220	31236	\N	\N
41756	SPECIFIC_DAY	8	8	f	2010-07-02	1220	31236	\N	\N
41757	SPECIFIC_DAY	8	8	f	2010-07-01	1220	31236	\N	\N
41758	SPECIFIC_DAY	8	8	f	2010-07-07	1220	31236	\N	\N
41759	SPECIFIC_DAY	8	8	f	2010-07-05	1220	31236	\N	\N
41760	SPECIFIC_DAY	8	8	f	2010-07-16	1220	31236	\N	\N
41761	SPECIFIC_DAY	8	8	f	2010-07-13	1220	31236	\N	\N
41762	SPECIFIC_DAY	8	4	f	2010-06-30	1220	31236	\N	\N
41763	SPECIFIC_DAY	8	8	f	2010-07-09	1220	31236	\N	\N
41764	SPECIFIC_DAY	8	8	f	2010-07-12	1220	31236	\N	\N
41765	SPECIFIC_DAY	8	0	f	2010-07-04	1220	31236	\N	\N
41766	SPECIFIC_DAY	8	8	f	2010-07-08	1220	31236	\N	\N
41767	SPECIFIC_DAY	8	0	f	2010-07-17	1220	31237	\N	\N
41768	SPECIFIC_DAY	8	8	f	2010-08-02	1220	31237	\N	\N
41769	SPECIFIC_DAY	8	0	f	2010-07-31	1220	31237	\N	\N
41770	SPECIFIC_DAY	8	8	f	2010-07-30	1220	31237	\N	\N
41771	SPECIFIC_DAY	8	0	f	2010-07-25	1220	31237	\N	\N
41772	SPECIFIC_DAY	8	8	f	2010-08-03	1220	31237	\N	\N
41773	SPECIFIC_DAY	8	8	f	2010-07-22	1220	31237	\N	\N
41774	SPECIFIC_DAY	8	0	f	2010-08-01	1220	31237	\N	\N
41775	SPECIFIC_DAY	8	8	f	2010-07-19	1220	31237	\N	\N
41776	SPECIFIC_DAY	8	0	f	2010-07-18	1220	31237	\N	\N
41777	SPECIFIC_DAY	8	8	f	2010-07-29	1220	31237	\N	\N
41778	SPECIFIC_DAY	8	8	f	2010-07-21	1220	31237	\N	\N
41779	SPECIFIC_DAY	8	8	f	2010-07-27	1220	31237	\N	\N
41780	SPECIFIC_DAY	8	8	f	2010-07-20	1220	31237	\N	\N
41781	SPECIFIC_DAY	8	4	f	2010-08-04	1220	31237	\N	\N
41782	SPECIFIC_DAY	8	0	f	2010-07-24	1220	31237	\N	\N
41783	SPECIFIC_DAY	8	8	f	2010-07-26	1220	31237	\N	\N
41784	SPECIFIC_DAY	8	8	f	2010-07-28	1220	31237	\N	\N
41785	SPECIFIC_DAY	8	0	f	2010-07-16	1220	31237	\N	\N
41786	SPECIFIC_DAY	8	8	f	2010-07-23	1220	31237	\N	\N
41787	SPECIFIC_DAY	8	8	f	2010-08-16	1216	31238	\N	\N
41788	SPECIFIC_DAY	8	8	f	2010-08-11	1216	31238	\N	\N
41789	SPECIFIC_DAY	8	8	f	2010-08-13	1216	31238	\N	\N
41790	SPECIFIC_DAY	8	8	f	2010-08-12	1216	31238	\N	\N
41791	SPECIFIC_DAY	8	8	f	2010-08-24	1216	31238	\N	\N
41792	SPECIFIC_DAY	8	8	f	2010-08-18	1216	31238	\N	\N
41793	SPECIFIC_DAY	8	8	f	2010-08-17	1216	31238	\N	\N
41794	SPECIFIC_DAY	8	8	f	2010-08-20	1216	31238	\N	\N
41795	SPECIFIC_DAY	8	8	f	2010-08-23	1216	31238	\N	\N
41796	SPECIFIC_DAY	8	8	f	2010-08-10	1216	31238	\N	\N
41797	SPECIFIC_DAY	8	8	f	2010-08-09	1216	31238	\N	\N
41798	SPECIFIC_DAY	8	4	f	2010-08-06	1216	31238	\N	\N
41799	SPECIFIC_DAY	8	8	f	2010-08-19	1216	31238	\N	\N
41800	SPECIFIC_DAY	8	8	f	2010-07-27	4352	31239	\N	\N
41801	SPECIFIC_DAY	8	8	f	2010-07-01	4352	31239	\N	\N
41802	SPECIFIC_DAY	8	8	f	2010-07-22	4352	31239	\N	\N
41803	SPECIFIC_DAY	8	8	f	2010-06-18	4352	31239	\N	\N
41804	SPECIFIC_DAY	8	8	f	2010-06-17	4352	31239	\N	\N
41805	SPECIFIC_DAY	8	0	f	2010-07-03	4352	31239	\N	\N
41806	SPECIFIC_DAY	8	8	f	2010-07-30	4352	31239	\N	\N
41807	SPECIFIC_DAY	8	8	f	2010-07-09	4352	31239	\N	\N
41808	SPECIFIC_DAY	8	8	f	2010-06-22	4352	31239	\N	\N
41809	SPECIFIC_DAY	8	0	f	2010-06-20	4352	31239	\N	\N
41810	SPECIFIC_DAY	8	8	f	2010-07-13	4352	31239	\N	\N
41811	SPECIFIC_DAY	8	8	f	2010-07-23	4352	31239	\N	\N
41812	SPECIFIC_DAY	8	0	f	2010-07-24	4352	31239	\N	\N
41813	SPECIFIC_DAY	8	8	f	2010-06-15	4352	31239	\N	\N
41814	SPECIFIC_DAY	8	8	f	2010-07-06	4352	31239	\N	\N
41815	SPECIFIC_DAY	8	8	f	2010-06-25	4352	31239	\N	\N
41816	SPECIFIC_DAY	8	8	f	2010-07-20	4352	31239	\N	\N
41817	SPECIFIC_DAY	8	8	f	2010-07-14	4352	31239	\N	\N
41818	SPECIFIC_DAY	8	0	f	2010-07-18	4352	31239	\N	\N
41819	SPECIFIC_DAY	8	0	f	2010-06-26	4352	31239	\N	\N
41820	SPECIFIC_DAY	8	8	f	2010-06-28	4352	31239	\N	\N
41821	SPECIFIC_DAY	8	0	f	2010-07-17	4352	31239	\N	\N
41822	SPECIFIC_DAY	8	0	f	2010-08-01	4352	31239	\N	\N
41823	SPECIFIC_DAY	8	8	f	2010-06-23	4352	31239	\N	\N
41824	SPECIFIC_DAY	8	0	f	2010-07-10	4352	31239	\N	\N
41825	SPECIFIC_DAY	8	8	f	2010-07-08	4352	31239	\N	\N
41826	SPECIFIC_DAY	8	8	f	2010-08-02	4352	31239	\N	\N
41827	SPECIFIC_DAY	8	8	f	2010-07-19	4352	31239	\N	\N
41828	SPECIFIC_DAY	8	0	f	2010-06-13	4352	31239	\N	\N
41829	SPECIFIC_DAY	8	8	f	2010-06-16	4352	31239	\N	\N
41830	SPECIFIC_DAY	8	4	f	2010-08-04	4352	31239	\N	\N
41831	SPECIFIC_DAY	8	8	f	2010-07-29	4352	31239	\N	\N
41832	SPECIFIC_DAY	8	0	f	2010-07-11	4352	31239	\N	\N
41833	SPECIFIC_DAY	8	8	f	2010-08-03	4352	31239	\N	\N
41834	SPECIFIC_DAY	8	8	f	2010-06-24	4352	31239	\N	\N
41835	SPECIFIC_DAY	8	8	f	2010-06-21	4352	31239	\N	\N
41836	SPECIFIC_DAY	8	0	f	2010-06-19	4352	31239	\N	\N
41837	SPECIFIC_DAY	8	8	f	2010-07-16	4352	31239	\N	\N
41838	SPECIFIC_DAY	8	8	f	2010-06-30	4352	31239	\N	\N
41839	SPECIFIC_DAY	8	8	f	2010-07-15	4352	31239	\N	\N
41840	SPECIFIC_DAY	8	8	f	2010-07-12	4352	31239	\N	\N
41841	SPECIFIC_DAY	8	8	f	2010-06-14	4352	31239	\N	\N
41842	SPECIFIC_DAY	8	8	f	2010-07-05	4352	31239	\N	\N
41843	SPECIFIC_DAY	8	8	f	2010-07-26	4352	31239	\N	\N
41844	SPECIFIC_DAY	8	8	f	2010-06-29	4352	31239	\N	\N
41845	SPECIFIC_DAY	8	0	f	2010-07-25	4352	31239	\N	\N
41846	SPECIFIC_DAY	8	8	f	2010-07-28	4352	31239	\N	\N
41847	SPECIFIC_DAY	8	0	f	2010-06-27	4352	31239	\N	\N
41848	SPECIFIC_DAY	8	0	f	2010-07-31	4352	31239	\N	\N
41849	SPECIFIC_DAY	8	8	f	2010-07-07	4352	31239	\N	\N
41850	SPECIFIC_DAY	8	0	f	2010-07-04	4352	31239	\N	\N
41851	SPECIFIC_DAY	8	8	f	2010-07-02	4352	31239	\N	\N
41852	SPECIFIC_DAY	8	8	f	2010-07-21	4352	31239	\N	\N
42056	GENERIC_DAY	11	0	f	2010-06-30	4344	\N	27164	\N
42054	GENERIC_DAY	11	0	f	2010-06-25	4350	\N	27164	\N
42025	GENERIC_DAY	11	0	f	2010-06-18	4350	\N	27164	\N
42039	GENERIC_DAY	11	0	f	2010-06-26	21817	\N	27164	\N
42051	GENERIC_DAY	11	0	f	2010-06-27	21817	\N	27164	\N
42010	GENERIC_DAY	11	0	f	2010-06-16	4350	\N	27164	\N
42011	GENERIC_DAY	11	0	f	2010-06-26	4348	\N	27164	\N
42086	GENERIC_DAY	11	0	f	2010-06-30	4350	\N	27164	\N
42072	GENERIC_DAY	11	0	f	2010-06-20	4350	\N	27164	\N
42044	GENERIC_DAY	11	4	f	2010-06-14	4350	\N	27164	\N
42049	GENERIC_DAY	11	0	f	2010-06-19	4348	\N	27164	\N
42070	GENERIC_DAY	11	0	f	2010-06-26	4344	\N	27164	\N
42057	GENERIC_DAY	11	3	f	2010-06-22	4348	\N	27164	\N
42085	GENERIC_DAY	11	0	f	2010-06-17	4344	\N	27164	\N
42083	GENERIC_DAY	11	2	f	2010-06-30	4358	\N	27164	\N
42067	GENERIC_DAY	11	0	f	2010-06-25	4344	\N	27164	\N
42050	GENERIC_DAY	11	3	f	2010-06-25	4358	\N	27164	\N
42063	GENERIC_DAY	11	3	f	2010-06-22	4358	\N	27164	\N
42041	GENERIC_DAY	11	0	f	2010-06-28	4344	\N	27164	\N
42047	GENERIC_DAY	11	3	f	2010-06-29	4348	\N	27164	\N
42016	GENERIC_DAY	11	2	f	2010-06-22	21817	\N	27164	\N
42005	GENERIC_DAY	11	4	f	2010-06-16	4358	\N	27164	\N
42031	GENERIC_DAY	11	0	f	2010-06-28	4350	\N	27164	\N
42084	GENERIC_DAY	11	0	f	2010-06-24	4344	\N	27164	\N
42062	GENERIC_DAY	11	4	f	2010-06-18	4358	\N	27164	\N
42018	GENERIC_DAY	11	0	f	2010-06-29	4344	\N	27164	\N
42059	GENERIC_DAY	11	2	f	2010-06-24	21817	\N	27164	\N
42075	GENERIC_DAY	11	0	f	2010-06-18	4344	\N	27164	\N
42022	GENERIC_DAY	11	3	f	2010-06-23	4358	\N	27164	\N
42058	GENERIC_DAY	11	0	f	2010-06-21	4344	\N	27164	\N
42030	GENERIC_DAY	11	0	f	2010-06-22	4350	\N	27164	\N
42036	GENERIC_DAY	11	0	f	2010-06-16	4344	\N	27164	\N
42038	GENERIC_DAY	11	0	f	2010-06-19	4358	\N	27164	\N
42019	GENERIC_DAY	11	0	f	2010-06-20	4348	\N	27164	\N
42076	GENERIC_DAY	11	4	f	2010-06-16	21817	\N	27164	\N
42029	GENERIC_DAY	11	0	f	2010-06-23	4344	\N	27164	\N
42081	GENERIC_DAY	11	3	f	2010-06-24	4348	\N	27164	\N
42316	SPECIFIC_DAY	6	0	f	2010-08-08	1220	31240	\N	\N
42317	SPECIFIC_DAY	6	8	f	2010-08-11	1220	31240	\N	\N
42318	SPECIFIC_DAY	6	4	f	2010-08-04	1220	31240	\N	\N
42319	SPECIFIC_DAY	6	0	f	2010-08-14	1220	31240	\N	\N
42320	SPECIFIC_DAY	6	8	f	2010-08-12	1220	31240	\N	\N
42321	SPECIFIC_DAY	6	8	f	2010-08-05	1220	31240	\N	\N
42322	SPECIFIC_DAY	6	8	f	2010-08-09	1220	31240	\N	\N
42323	SPECIFIC_DAY	6	8	f	2010-08-17	1220	31240	\N	\N
42324	SPECIFIC_DAY	6	8	f	2010-08-18	1220	31240	\N	\N
42325	SPECIFIC_DAY	6	8	f	2010-08-19	1220	31240	\N	\N
42326	SPECIFIC_DAY	6	0	f	2010-08-07	1220	31240	\N	\N
42327	SPECIFIC_DAY	6	8	f	2010-08-16	1220	31240	\N	\N
42328	SPECIFIC_DAY	6	0	f	2010-08-15	1220	31240	\N	\N
42329	SPECIFIC_DAY	6	8	f	2010-08-20	1220	31240	\N	\N
42330	SPECIFIC_DAY	6	8	f	2010-08-06	1220	31240	\N	\N
42331	SPECIFIC_DAY	6	8	f	2010-08-10	1220	31240	\N	\N
42332	SPECIFIC_DAY	6	8	f	2010-08-13	1220	31240	\N	\N
42638	GENERIC_DAY	5	2	f	2010-07-08	4348	\N	27166	\N
42639	GENERIC_DAY	5	0	f	2010-07-10	4348	\N	27166	\N
42640	GENERIC_DAY	5	3	f	2010-07-06	21817	\N	27166	\N
42641	GENERIC_DAY	5	2	f	2010-07-07	4358	\N	27166	\N
42642	GENERIC_DAY	5	0	f	2010-06-28	4350	\N	27166	\N
42643	GENERIC_DAY	5	0	f	2010-06-27	4348	\N	27166	\N
42644	GENERIC_DAY	5	0	f	2010-07-09	4344	\N	27166	\N
42645	GENERIC_DAY	5	0	f	2010-07-03	4358	\N	27166	\N
42646	GENERIC_DAY	5	0	f	2010-07-04	4350	\N	27166	\N
42647	GENERIC_DAY	5	0	f	2010-06-28	4344	\N	27166	\N
42648	GENERIC_DAY	5	0	f	2010-06-29	4350	\N	27166	\N
42649	GENERIC_DAY	5	0	f	2010-07-05	4350	\N	27166	\N
42650	GENERIC_DAY	5	2	f	2010-06-30	4348	\N	27166	\N
42651	GENERIC_DAY	5	2	f	2010-07-09	4348	\N	27166	\N
42652	GENERIC_DAY	5	3	f	2010-06-28	4348	\N	27166	\N
42653	GENERIC_DAY	5	3	f	2010-06-30	4358	\N	27166	\N
42654	GENERIC_DAY	5	2	f	2010-07-12	4350	\N	27166	\N
42655	GENERIC_DAY	5	3	f	2010-07-05	21817	\N	27166	\N
42656	GENERIC_DAY	5	0	f	2010-07-11	4350	\N	27166	\N
42657	GENERIC_DAY	5	0	f	2010-07-10	4350	\N	27166	\N
42109	GENERIC_DAY	10	0	f	2010-07-31	4352	\N	27165	\N
42148	GENERIC_DAY	10	0	f	2010-07-26	4352	\N	27165	\N
42139	GENERIC_DAY	10	0	f	2010-07-16	4352	\N	27165	\N
42142	GENERIC_DAY	10	8	f	2010-07-06	4354	\N	27165	\N
42099	GENERIC_DAY	10	8	f	2010-07-05	4354	\N	27165	\N
42125	GENERIC_DAY	10	0	f	2010-07-24	4354	\N	27165	\N
42105	GENERIC_DAY	10	0	f	2010-07-18	4354	\N	27165	\N
42090	GENERIC_DAY	10	8	f	2010-07-01	4354	\N	27165	\N
42124	GENERIC_DAY	10	0	f	2010-07-23	4352	\N	27165	\N
42117	GENERIC_DAY	10	8	f	2010-07-19	4354	\N	27165	\N
42134	GENERIC_DAY	10	0	f	2010-07-01	4352	\N	27165	\N
42658	GENERIC_DAY	5	0	f	2010-07-01	4344	\N	27166	\N
42659	GENERIC_DAY	5	0	f	2010-07-03	4344	\N	27166	\N
42660	GENERIC_DAY	5	0	f	2010-07-05	4344	\N	27166	\N
42661	GENERIC_DAY	5	2	f	2010-07-01	21817	\N	27166	\N
42662	GENERIC_DAY	5	2	f	2010-07-02	4358	\N	27166	\N
42663	GENERIC_DAY	5	2	f	2010-07-13	4350	\N	27166	\N
42664	GENERIC_DAY	5	0	f	2010-07-03	21817	\N	27166	\N
42665	GENERIC_DAY	5	0	f	2010-07-02	4350	\N	27166	\N
42666	GENERIC_DAY	5	0	f	2010-07-12	4344	\N	27166	\N
42667	GENERIC_DAY	5	0	f	2010-06-27	4358	\N	27166	\N
42668	GENERIC_DAY	5	2	f	2010-07-13	4358	\N	27166	\N
42669	GENERIC_DAY	5	3	f	2010-07-01	4348	\N	27166	\N
42670	GENERIC_DAY	5	3	f	2010-06-29	21817	\N	27166	\N
42671	GENERIC_DAY	5	0	f	2010-07-06	4350	\N	27166	\N
42672	GENERIC_DAY	5	0	f	2010-07-03	4348	\N	27166	\N
42673	GENERIC_DAY	5	1	f	2010-07-14	4358	\N	27166	\N
42674	GENERIC_DAY	5	0	f	2010-07-03	4350	\N	27166	\N
42675	GENERIC_DAY	5	0	f	2010-06-27	4350	\N	27166	\N
42676	GENERIC_DAY	5	0	f	2010-07-02	4344	\N	27166	\N
42677	GENERIC_DAY	5	3	f	2010-07-07	21817	\N	27166	\N
42678	GENERIC_DAY	5	2	f	2010-07-13	4348	\N	27166	\N
42679	GENERIC_DAY	5	0	f	2010-07-04	4348	\N	27166	\N
42680	GENERIC_DAY	5	0	f	2010-07-11	4358	\N	27166	\N
42681	GENERIC_DAY	5	3	f	2010-06-29	4348	\N	27166	\N
42682	GENERIC_DAY	5	2	f	2010-07-08	21817	\N	27166	\N
42683	GENERIC_DAY	5	0	f	2010-06-27	4344	\N	27166	\N
42684	GENERIC_DAY	5	2	f	2010-06-28	4358	\N	27166	\N
42685	GENERIC_DAY	5	3	f	2010-07-07	4348	\N	27166	\N
42686	GENERIC_DAY	5	2	f	2010-07-05	4358	\N	27166	\N
42687	GENERIC_DAY	5	0	f	2010-06-30	4350	\N	27166	\N
42688	GENERIC_DAY	5	0	f	2010-07-07	4350	\N	27166	\N
42689	GENERIC_DAY	5	3	f	2010-06-30	21817	\N	27166	\N
42690	GENERIC_DAY	5	2	f	2010-06-29	4358	\N	27166	\N
42691	GENERIC_DAY	5	2	f	2010-07-09	4358	\N	27166	\N
42692	GENERIC_DAY	5	0	f	2010-07-07	4344	\N	27166	\N
42693	GENERIC_DAY	5	0	f	2010-07-10	21817	\N	27166	\N
42694	GENERIC_DAY	5	3	f	2010-07-05	4348	\N	27166	\N
42695	GENERIC_DAY	5	2	f	2010-07-14	4348	\N	27166	\N
42696	GENERIC_DAY	5	0	f	2010-06-30	4344	\N	27166	\N
42697	GENERIC_DAY	5	0	f	2010-07-13	4344	\N	27166	\N
42698	GENERIC_DAY	5	2	f	2010-07-12	4358	\N	27166	\N
42699	GENERIC_DAY	5	3	f	2010-07-02	21817	\N	27166	\N
42700	GENERIC_DAY	5	3	f	2010-06-28	21817	\N	27166	\N
42701	GENERIC_DAY	5	0	f	2010-06-29	4344	\N	27166	\N
42702	GENERIC_DAY	5	0	f	2010-07-11	4344	\N	27166	\N
42703	GENERIC_DAY	5	3	f	2010-07-02	4348	\N	27166	\N
42704	GENERIC_DAY	5	3	f	2010-07-01	4358	\N	27166	\N
42705	GENERIC_DAY	5	0	f	2010-07-06	4344	\N	27166	\N
42706	GENERIC_DAY	5	2	f	2010-07-06	4358	\N	27166	\N
42707	GENERIC_DAY	5	2	f	2010-07-12	4348	\N	27166	\N
42708	GENERIC_DAY	5	0	f	2010-07-04	21817	\N	27166	\N
42709	GENERIC_DAY	5	2	f	2010-07-08	4350	\N	27166	\N
42710	GENERIC_DAY	5	2	f	2010-07-09	4350	\N	27166	\N
42711	GENERIC_DAY	5	2	f	2010-07-08	4358	\N	27166	\N
42712	GENERIC_DAY	5	0	f	2010-07-11	4348	\N	27166	\N
42713	GENERIC_DAY	5	3	f	2010-07-06	4348	\N	27166	\N
42714	GENERIC_DAY	5	0	f	2010-07-04	4358	\N	27166	\N
42715	GENERIC_DAY	5	0	f	2010-07-08	4344	\N	27166	\N
42716	GENERIC_DAY	5	2	f	2010-07-13	21817	\N	27166	\N
42717	GENERIC_DAY	5	0	f	2010-07-11	21817	\N	27166	\N
42718	GENERIC_DAY	5	1	f	2010-07-14	4350	\N	27166	\N
42719	GENERIC_DAY	5	0	f	2010-07-04	4344	\N	27166	\N
42720	GENERIC_DAY	5	0	f	2010-06-27	21817	\N	27166	\N
42721	GENERIC_DAY	5	2	f	2010-07-12	21817	\N	27166	\N
42722	GENERIC_DAY	5	0	f	2010-07-10	4344	\N	27166	\N
42723	GENERIC_DAY	5	0	f	2010-07-10	4358	\N	27166	\N
42724	GENERIC_DAY	5	0	f	2010-07-14	4344	\N	27166	\N
42725	GENERIC_DAY	5	2	f	2010-07-09	21817	\N	27166	\N
42726	GENERIC_DAY	5	0	f	2010-07-01	4350	\N	27166	\N
42727	GENERIC_DAY	4	4	f	2010-08-10	4354	\N	27167	\N
42728	GENERIC_DAY	4	0	f	2010-07-30	4352	\N	27167	\N
42729	GENERIC_DAY	4	0	f	2010-07-26	4352	\N	27167	\N
42730	GENERIC_DAY	4	0	f	2010-08-07	4354	\N	27167	\N
42731	GENERIC_DAY	4	4	f	2010-08-05	4354	\N	27167	\N
42732	GENERIC_DAY	4	0	f	2010-07-21	4352	\N	27167	\N
42733	GENERIC_DAY	4	0	f	2010-07-24	4354	\N	27167	\N
42734	GENERIC_DAY	4	8	f	2010-07-19	4354	\N	27167	\N
42735	GENERIC_DAY	4	4	f	2010-08-06	4352	\N	27167	\N
42736	GENERIC_DAY	4	0	f	2010-07-24	4352	\N	27167	\N
42737	GENERIC_DAY	4	0	f	2010-08-08	4352	\N	27167	\N
42738	GENERIC_DAY	4	8	f	2010-07-26	4354	\N	27167	\N
42739	GENERIC_DAY	4	8	f	2010-08-02	4354	\N	27167	\N
42740	GENERIC_DAY	4	4	f	2010-08-18	4352	\N	27167	\N
42741	GENERIC_DAY	4	0	f	2010-08-02	4352	\N	27167	\N
42742	GENERIC_DAY	4	8	f	2010-08-03	4354	\N	27167	\N
42743	GENERIC_DAY	4	0	f	2010-07-31	4352	\N	27167	\N
42744	GENERIC_DAY	4	0	f	2010-07-22	4352	\N	27167	\N
42745	GENERIC_DAY	4	0	f	2010-08-15	4352	\N	27167	\N
42746	GENERIC_DAY	4	8	f	2010-07-29	4354	\N	27167	\N
42747	GENERIC_DAY	4	0	f	2010-07-23	4352	\N	27167	\N
42748	GENERIC_DAY	4	0	f	2010-07-29	4352	\N	27167	\N
42749	GENERIC_DAY	4	8	f	2010-07-27	4354	\N	27167	\N
42750	GENERIC_DAY	4	4	f	2010-08-17	4352	\N	27167	\N
42751	GENERIC_DAY	4	8	f	2010-07-30	4354	\N	27167	\N
42752	GENERIC_DAY	4	8	f	2010-07-21	4354	\N	27167	\N
42753	GENERIC_DAY	4	0	f	2010-07-15	4352	\N	27167	\N
42754	GENERIC_DAY	4	8	f	2010-07-28	4354	\N	27167	\N
42755	GENERIC_DAY	4	0	f	2010-07-31	4354	\N	27167	\N
42756	GENERIC_DAY	4	4	f	2010-08-12	4352	\N	27167	\N
42757	GENERIC_DAY	4	4	f	2010-08-09	4354	\N	27167	\N
42758	GENERIC_DAY	4	4	f	2010-08-17	4354	\N	27167	\N
42759	GENERIC_DAY	4	0	f	2010-07-17	4354	\N	27167	\N
42760	GENERIC_DAY	4	0	f	2010-08-01	4354	\N	27167	\N
42761	GENERIC_DAY	4	0	f	2010-07-18	4352	\N	27167	\N
42762	GENERIC_DAY	4	4	f	2010-08-16	4352	\N	27167	\N
42763	GENERIC_DAY	4	0	f	2010-08-03	4352	\N	27167	\N
42764	GENERIC_DAY	4	0	f	2010-07-19	4352	\N	27167	\N
42765	GENERIC_DAY	4	8	f	2010-07-20	4354	\N	27167	\N
42766	GENERIC_DAY	4	0	f	2010-07-16	4352	\N	27167	\N
42767	GENERIC_DAY	4	0	f	2010-08-01	4352	\N	27167	\N
42768	GENERIC_DAY	4	0	f	2010-08-08	4354	\N	27167	\N
42769	GENERIC_DAY	4	4	f	2010-08-05	4352	\N	27167	\N
42770	GENERIC_DAY	4	4	f	2010-08-10	4352	\N	27167	\N
42771	GENERIC_DAY	4	0	f	2010-08-14	4354	\N	27167	\N
42772	GENERIC_DAY	4	2	f	2010-08-04	4352	\N	27167	\N
42773	GENERIC_DAY	4	4	f	2010-08-13	4354	\N	27167	\N
42774	GENERIC_DAY	4	0	f	2010-07-20	4352	\N	27167	\N
42775	GENERIC_DAY	4	8	f	2010-07-22	4354	\N	27167	\N
42776	GENERIC_DAY	4	4	f	2010-08-18	4354	\N	27167	\N
42777	GENERIC_DAY	4	0	f	2010-07-18	4354	\N	27167	\N
42778	GENERIC_DAY	4	4	f	2010-08-09	4352	\N	27167	\N
42779	GENERIC_DAY	4	4	f	2010-08-12	4354	\N	27167	\N
42780	GENERIC_DAY	4	0	f	2010-07-17	4352	\N	27167	\N
42781	GENERIC_DAY	4	0	f	2010-07-25	4354	\N	27167	\N
42782	GENERIC_DAY	4	4	f	2010-08-16	4354	\N	27167	\N
42783	GENERIC_DAY	4	0	f	2010-08-07	4352	\N	27167	\N
42784	GENERIC_DAY	4	4	f	2010-08-06	4354	\N	27167	\N
42785	GENERIC_DAY	4	8	f	2010-07-15	4354	\N	27167	\N
42786	GENERIC_DAY	4	8	f	2010-07-23	4354	\N	27167	\N
42787	GENERIC_DAY	4	0	f	2010-07-28	4352	\N	27167	\N
42788	GENERIC_DAY	4	0	f	2010-08-14	4352	\N	27167	\N
42789	GENERIC_DAY	4	6	f	2010-08-04	4354	\N	27167	\N
42790	GENERIC_DAY	4	0	f	2010-07-27	4352	\N	27167	\N
42791	GENERIC_DAY	4	4	f	2010-08-13	4352	\N	27167	\N
42792	GENERIC_DAY	4	0	f	2010-08-15	4354	\N	27167	\N
42793	GENERIC_DAY	4	4	f	2010-08-11	4352	\N	27167	\N
42794	GENERIC_DAY	4	4	f	2010-08-11	4354	\N	27167	\N
42795	GENERIC_DAY	4	8	f	2010-07-16	4354	\N	27167	\N
42796	GENERIC_DAY	4	0	f	2010-07-25	4352	\N	27167	\N
42797	GENERIC_DAY	3	2	f	2010-08-16	4348	\N	27168	\N
42798	GENERIC_DAY	3	2	f	2010-08-04	4344	\N	27168	\N
42799	GENERIC_DAY	3	2	f	2010-08-05	4358	\N	27168	\N
42800	GENERIC_DAY	3	2	f	2010-08-12	4344	\N	27168	\N
42801	GENERIC_DAY	3	2	f	2010-08-17	4344	\N	27168	\N
42802	GENERIC_DAY	3	2	f	2010-08-17	4348	\N	27168	\N
42803	GENERIC_DAY	3	2	f	2010-08-24	4344	\N	27168	\N
42804	GENERIC_DAY	3	0	f	2010-08-21	4350	\N	27168	\N
42805	GENERIC_DAY	3	2	f	2010-08-20	4344	\N	27168	\N
42806	GENERIC_DAY	3	2	f	2010-08-12	4358	\N	27168	\N
42807	GENERIC_DAY	3	2	f	2010-08-06	4348	\N	27168	\N
42808	GENERIC_DAY	3	0	f	2010-08-22	4348	\N	27168	\N
42809	GENERIC_DAY	3	0	f	2010-08-08	4348	\N	27168	\N
42810	GENERIC_DAY	3	2	f	2010-08-04	4358	\N	27168	\N
42811	GENERIC_DAY	3	2	f	2010-08-11	4350	\N	27168	\N
42812	GENERIC_DAY	3	2	f	2010-08-10	4344	\N	27168	\N
42813	GENERIC_DAY	3	2	f	2010-08-24	4348	\N	27168	\N
42814	GENERIC_DAY	3	2	f	2010-08-25	4344	\N	27168	\N
42815	GENERIC_DAY	3	0	f	2010-08-15	4348	\N	27168	\N
42816	GENERIC_DAY	3	0	f	2010-08-14	4358	\N	27168	\N
42817	GENERIC_DAY	3	0	f	2010-08-08	4344	\N	27168	\N
42818	GENERIC_DAY	3	0	f	2010-08-07	4344	\N	27168	\N
42819	GENERIC_DAY	3	0	f	2010-08-08	4350	\N	27168	\N
42820	GENERIC_DAY	3	0	f	2010-08-22	4344	\N	27168	\N
42821	GENERIC_DAY	3	2	f	2010-08-24	4350	\N	27168	\N
42822	GENERIC_DAY	3	2	f	2010-08-17	4350	\N	27168	\N
42823	GENERIC_DAY	3	2	f	2010-08-12	4348	\N	27168	\N
42824	GENERIC_DAY	3	0	f	2010-08-21	4344	\N	27168	\N
42825	GENERIC_DAY	3	0	f	2010-08-15	4344	\N	27168	\N
42826	GENERIC_DAY	3	2	f	2010-08-23	4344	\N	27168	\N
42827	GENERIC_DAY	3	2	f	2010-08-27	4358	\N	27168	\N
42828	GENERIC_DAY	3	2	f	2010-08-06	4344	\N	27168	\N
42829	GENERIC_DAY	3	2	f	2010-08-03	4350	\N	27168	\N
42830	GENERIC_DAY	3	2	f	2010-08-13	4350	\N	27168	\N
42831	GENERIC_DAY	3	2	f	2010-08-13	4344	\N	27168	\N
42832	GENERIC_DAY	3	2	f	2010-08-25	4350	\N	27168	\N
42833	GENERIC_DAY	3	0	f	2010-08-14	4350	\N	27168	\N
42834	GENERIC_DAY	3	2	f	2010-08-20	4348	\N	27168	\N
42835	GENERIC_DAY	3	2	f	2010-08-18	4348	\N	27168	\N
42836	GENERIC_DAY	3	0	f	2010-08-15	4350	\N	27168	\N
42837	GENERIC_DAY	3	2	f	2010-08-26	4348	\N	27168	\N
42838	GENERIC_DAY	3	0	f	2010-08-22	4358	\N	27168	\N
42839	GENERIC_DAY	3	2	f	2010-08-11	4358	\N	27168	\N
42840	GENERIC_DAY	3	2	f	2010-08-09	4350	\N	27168	\N
42841	GENERIC_DAY	3	2	f	2010-08-16	4344	\N	27168	\N
42842	GENERIC_DAY	3	1	f	2010-08-27	4344	\N	27168	\N
42843	GENERIC_DAY	3	2	f	2010-08-05	4350	\N	27168	\N
42844	GENERIC_DAY	3	2	f	2010-08-09	4344	\N	27168	\N
42845	GENERIC_DAY	3	2	f	2010-08-04	4348	\N	27168	\N
42846	GENERIC_DAY	3	1	f	2010-08-27	4348	\N	27168	\N
42847	GENERIC_DAY	3	0	f	2010-08-21	4358	\N	27168	\N
42848	GENERIC_DAY	3	2	f	2010-08-17	4358	\N	27168	\N
42849	GENERIC_DAY	3	2	f	2010-08-03	4348	\N	27168	\N
42850	GENERIC_DAY	3	2	f	2010-08-05	4344	\N	27168	\N
42851	GENERIC_DAY	3	0	f	2010-08-15	4358	\N	27168	\N
42852	GENERIC_DAY	3	2	f	2010-08-19	4358	\N	27168	\N
42853	GENERIC_DAY	3	2	f	2010-08-27	4350	\N	27168	\N
42854	GENERIC_DAY	3	0	f	2010-08-14	4344	\N	27168	\N
42855	GENERIC_DAY	3	2	f	2010-08-18	4350	\N	27168	\N
42856	GENERIC_DAY	3	2	f	2010-08-05	4348	\N	27168	\N
42857	GENERIC_DAY	3	2	f	2010-08-11	4348	\N	27168	\N
42858	GENERIC_DAY	3	2	f	2010-08-09	4358	\N	27168	\N
42859	GENERIC_DAY	3	2	f	2010-08-06	4350	\N	27168	\N
42860	GENERIC_DAY	3	2	f	2010-08-26	4358	\N	27168	\N
42861	GENERIC_DAY	3	2	f	2010-08-18	4358	\N	27168	\N
42862	GENERIC_DAY	3	2	f	2010-08-13	4358	\N	27168	\N
42863	GENERIC_DAY	3	2	f	2010-08-23	4348	\N	27168	\N
42864	GENERIC_DAY	3	2	f	2010-08-13	4348	\N	27168	\N
42865	GENERIC_DAY	3	2	f	2010-08-19	4344	\N	27168	\N
42866	GENERIC_DAY	3	2	f	2010-08-25	4358	\N	27168	\N
42867	GENERIC_DAY	3	2	f	2010-08-19	4348	\N	27168	\N
42868	GENERIC_DAY	3	0	f	2010-08-07	4348	\N	27168	\N
42869	GENERIC_DAY	3	2	f	2010-08-11	4344	\N	27168	\N
42870	GENERIC_DAY	3	0	f	2010-08-07	4358	\N	27168	\N
42871	GENERIC_DAY	3	2	f	2010-08-20	4350	\N	27168	\N
42872	GENERIC_DAY	3	2	f	2010-08-09	4348	\N	27168	\N
42873	GENERIC_DAY	3	0	f	2010-08-14	4348	\N	27168	\N
42874	GENERIC_DAY	3	2	f	2010-08-10	4348	\N	27168	\N
42875	GENERIC_DAY	3	2	f	2010-08-25	4348	\N	27168	\N
42876	GENERIC_DAY	3	2	f	2010-08-04	4350	\N	27168	\N
42877	GENERIC_DAY	3	0	f	2010-08-22	4350	\N	27168	\N
42878	GENERIC_DAY	3	2	f	2010-08-03	4344	\N	27168	\N
42879	GENERIC_DAY	3	2	f	2010-08-19	4350	\N	27168	\N
42880	GENERIC_DAY	3	2	f	2010-08-20	4358	\N	27168	\N
42881	GENERIC_DAY	3	2	f	2010-08-23	4358	\N	27168	\N
42882	GENERIC_DAY	3	0	f	2010-08-07	4350	\N	27168	\N
42883	GENERIC_DAY	3	2	f	2010-08-10	4358	\N	27168	\N
42884	GENERIC_DAY	3	2	f	2010-08-10	4350	\N	27168	\N
42885	GENERIC_DAY	3	2	f	2010-08-16	4358	\N	27168	\N
42886	GENERIC_DAY	3	2	f	2010-08-23	4350	\N	27168	\N
42887	GENERIC_DAY	3	2	f	2010-08-16	4350	\N	27168	\N
42888	GENERIC_DAY	3	0	f	2010-08-21	4348	\N	27168	\N
42889	GENERIC_DAY	3	2	f	2010-08-06	4358	\N	27168	\N
42890	GENERIC_DAY	3	2	f	2010-08-18	4344	\N	27168	\N
42891	GENERIC_DAY	3	0	f	2010-08-08	4358	\N	27168	\N
42892	GENERIC_DAY	3	2	f	2010-08-03	4358	\N	27168	\N
42893	GENERIC_DAY	3	2	f	2010-08-26	4344	\N	27168	\N
42894	GENERIC_DAY	3	2	f	2010-08-24	4358	\N	27168	\N
42895	GENERIC_DAY	3	2	f	2010-08-12	4350	\N	27168	\N
42896	GENERIC_DAY	3	2	f	2010-08-26	4350	\N	27168	\N
42935	GENERIC_DAY	2	4	f	2010-08-23	4352	\N	42521	\N
42936	GENERIC_DAY	2	0	f	2010-08-29	4354	\N	42521	\N
42937	GENERIC_DAY	2	4	f	2010-08-13	4354	\N	42521	\N
42938	GENERIC_DAY	2	4	f	2010-09-06	4354	\N	42521	\N
42939	GENERIC_DAY	2	4	f	2010-08-16	4354	\N	42521	\N
42940	GENERIC_DAY	2	4	f	2010-08-12	4352	\N	42521	\N
42941	GENERIC_DAY	2	4	f	2010-08-09	4352	\N	42521	\N
42942	GENERIC_DAY	2	0	f	2010-08-07	4354	\N	42521	\N
42943	GENERIC_DAY	2	4	f	2010-08-30	4354	\N	42521	\N
42944	GENERIC_DAY	2	4	f	2010-08-16	4352	\N	42521	\N
42945	GENERIC_DAY	2	4	f	2010-08-31	4354	\N	42521	\N
42946	GENERIC_DAY	2	0	f	2010-08-22	4354	\N	42521	\N
42947	GENERIC_DAY	2	0	f	2010-08-22	4352	\N	42521	\N
42948	GENERIC_DAY	2	0	f	2010-08-03	4352	\N	42521	\N
42949	GENERIC_DAY	2	4	f	2010-08-30	4352	\N	42521	\N
42950	GENERIC_DAY	2	4	f	2010-08-11	4352	\N	42521	\N
42951	GENERIC_DAY	2	0	f	2010-08-14	4352	\N	42521	\N
42952	GENERIC_DAY	2	4	f	2010-09-03	4352	\N	42521	\N
42953	GENERIC_DAY	2	0	f	2010-08-08	4354	\N	42521	\N
42954	GENERIC_DAY	2	0	f	2010-08-29	4352	\N	42521	\N
42955	GENERIC_DAY	2	2	f	2010-08-04	4352	\N	42521	\N
42956	GENERIC_DAY	2	4	f	2010-08-20	4352	\N	42521	\N
42957	GENERIC_DAY	2	4	f	2010-08-05	4354	\N	42521	\N
42958	GENERIC_DAY	2	4	f	2010-08-24	4352	\N	42521	\N
42959	GENERIC_DAY	2	8	f	2010-08-03	4354	\N	42521	\N
42960	GENERIC_DAY	2	4	f	2010-08-10	4352	\N	42521	\N
42961	GENERIC_DAY	2	4	f	2010-08-19	4352	\N	42521	\N
42962	GENERIC_DAY	2	0	f	2010-08-14	4354	\N	42521	\N
42963	GENERIC_DAY	2	4	f	2010-08-26	4354	\N	42521	\N
42964	GENERIC_DAY	2	4	f	2010-08-05	4352	\N	42521	\N
42965	GENERIC_DAY	2	4	f	2010-08-25	4352	\N	42521	\N
42966	GENERIC_DAY	2	4	f	2010-09-01	4352	\N	42521	\N
42967	GENERIC_DAY	2	0	f	2010-09-05	4354	\N	42521	\N
42968	GENERIC_DAY	2	4	f	2010-09-01	4354	\N	42521	\N
42969	GENERIC_DAY	2	4	f	2010-08-27	4354	\N	42521	\N
42970	GENERIC_DAY	2	4	f	2010-08-11	4354	\N	42521	\N
42971	GENERIC_DAY	2	0	f	2010-08-15	4352	\N	42521	\N
42972	GENERIC_DAY	2	0	f	2010-09-04	4354	\N	42521	\N
42973	GENERIC_DAY	2	6	f	2010-08-04	4354	\N	42521	\N
42974	GENERIC_DAY	2	4	f	2010-08-27	4352	\N	42521	\N
42975	GENERIC_DAY	2	0	f	2010-08-21	4352	\N	42521	\N
42976	GENERIC_DAY	2	0	f	2010-09-05	4352	\N	42521	\N
42977	GENERIC_DAY	2	4	f	2010-08-25	4354	\N	42521	\N
42978	GENERIC_DAY	2	4	f	2010-09-06	4352	\N	42521	\N
42979	GENERIC_DAY	2	0	f	2010-08-21	4354	\N	42521	\N
42980	GENERIC_DAY	2	4	f	2010-09-02	4354	\N	42521	\N
42981	GENERIC_DAY	2	4	f	2010-09-03	4354	\N	42521	\N
42982	GENERIC_DAY	2	4	f	2010-08-17	4352	\N	42521	\N
42983	GENERIC_DAY	2	4	f	2010-08-17	4354	\N	42521	\N
42984	GENERIC_DAY	2	4	f	2010-08-26	4352	\N	42521	\N
42985	GENERIC_DAY	2	4	f	2010-08-13	4352	\N	42521	\N
42986	GENERIC_DAY	2	0	f	2010-08-07	4352	\N	42521	\N
42987	GENERIC_DAY	2	4	f	2010-08-18	4354	\N	42521	\N
42988	GENERIC_DAY	2	4	f	2010-09-02	4352	\N	42521	\N
42989	GENERIC_DAY	2	4	f	2010-08-19	4354	\N	42521	\N
42990	GENERIC_DAY	2	4	f	2010-08-10	4354	\N	42521	\N
42991	GENERIC_DAY	2	0	f	2010-08-28	4352	\N	42521	\N
42992	GENERIC_DAY	2	0	f	2010-08-15	4354	\N	42521	\N
42993	GENERIC_DAY	2	4	f	2010-08-31	4352	\N	42521	\N
42994	GENERIC_DAY	2	4	f	2010-08-23	4354	\N	42521	\N
42995	GENERIC_DAY	2	4	f	2010-08-12	4354	\N	42521	\N
42996	GENERIC_DAY	2	4	f	2010-08-18	4352	\N	42521	\N
42997	GENERIC_DAY	2	4	f	2010-08-06	4354	\N	42521	\N
42998	GENERIC_DAY	2	4	f	2010-08-09	4354	\N	42521	\N
42999	GENERIC_DAY	2	0	f	2010-08-28	4354	\N	42521	\N
43000	GENERIC_DAY	2	4	f	2010-08-24	4354	\N	42521	\N
43001	GENERIC_DAY	2	4	f	2010-08-20	4354	\N	42521	\N
43002	GENERIC_DAY	2	0	f	2010-08-08	4352	\N	42521	\N
43003	GENERIC_DAY	2	4	f	2010-08-06	4352	\N	42521	\N
43004	GENERIC_DAY	2	0	f	2010-09-04	4352	\N	42521	\N
43043	GENERIC_DAY	1	0	f	2010-09-25	4352	\N	42522	\N
43044	GENERIC_DAY	1	0	f	2010-09-26	4352	\N	42522	\N
43045	GENERIC_DAY	1	4	f	2010-09-30	4354	\N	42522	\N
43046	GENERIC_DAY	1	0	f	2010-10-10	4352	\N	42522	\N
43047	GENERIC_DAY	1	4	f	2010-10-06	4354	\N	42522	\N
43048	GENERIC_DAY	1	4	f	2010-10-11	4354	\N	42522	\N
43049	GENERIC_DAY	1	4	f	2010-10-01	4354	\N	42522	\N
43050	GENERIC_DAY	1	4	f	2010-09-27	4352	\N	42522	\N
43051	GENERIC_DAY	1	4	f	2010-09-29	4354	\N	42522	\N
43052	GENERIC_DAY	1	0	f	2010-09-26	4354	\N	42522	\N
43053	GENERIC_DAY	1	4	f	2010-09-28	4352	\N	42522	\N
43054	GENERIC_DAY	1	0	f	2010-10-09	4354	\N	42522	\N
43055	GENERIC_DAY	1	0	f	2010-09-25	4354	\N	42522	\N
43056	GENERIC_DAY	1	4	f	2010-10-04	4352	\N	42522	\N
43057	GENERIC_DAY	1	4	f	2010-09-24	4354	\N	42522	\N
43058	GENERIC_DAY	1	4	f	2010-10-08	4352	\N	42522	\N
43059	GENERIC_DAY	1	4	f	2010-10-07	4354	\N	42522	\N
43060	GENERIC_DAY	1	4	f	2010-09-24	4352	\N	42522	\N
43061	GENERIC_DAY	1	4	f	2010-09-29	4352	\N	42522	\N
43062	GENERIC_DAY	1	4	f	2010-10-06	4352	\N	42522	\N
43063	GENERIC_DAY	1	4	f	2010-09-30	4352	\N	42522	\N
43064	GENERIC_DAY	1	4	f	2010-09-28	4354	\N	42522	\N
43065	GENERIC_DAY	1	4	f	2010-09-27	4354	\N	42522	\N
43066	GENERIC_DAY	1	4	f	2010-10-04	4354	\N	42522	\N
43067	GENERIC_DAY	1	4	f	2010-10-11	4352	\N	42522	\N
43068	GENERIC_DAY	1	4	f	2010-10-07	4352	\N	42522	\N
43069	GENERIC_DAY	1	0	f	2010-10-03	4354	\N	42522	\N
43070	GENERIC_DAY	1	0	f	2010-10-02	4352	\N	42522	\N
43071	GENERIC_DAY	1	2	f	2010-10-12	4352	\N	42522	\N
43072	GENERIC_DAY	1	4	f	2010-10-05	4352	\N	42522	\N
43073	GENERIC_DAY	1	0	f	2010-10-03	4352	\N	42522	\N
43074	GENERIC_DAY	1	4	f	2010-10-01	4352	\N	42522	\N
43075	GENERIC_DAY	1	0	f	2010-10-09	4352	\N	42522	\N
43076	GENERIC_DAY	1	4	f	2010-10-08	4354	\N	42522	\N
43077	GENERIC_DAY	1	0	f	2010-10-10	4354	\N	42522	\N
43078	GENERIC_DAY	1	2	f	2010-10-12	4354	\N	42522	\N
43079	GENERIC_DAY	1	4	f	2010-10-05	4354	\N	42522	\N
43080	GENERIC_DAY	1	0	f	2010-10-02	4354	\N	42522	\N
25090	GENERIC_DAY	9	0	f	2010-06-24	4350	\N	16800	\N
25147	GENERIC_DAY	9	0	f	2010-06-27	21817	\N	16800	\N
25129	GENERIC_DAY	9	4	f	2010-06-23	21817	\N	16800	\N
25150	GENERIC_DAY	9	0	f	2010-06-25	4350	\N	16800	\N
25091	GENERIC_DAY	9	0	f	2010-06-19	4350	\N	16800	\N
25156	GENERIC_DAY	9	0	f	2010-06-29	4344	\N	16800	\N
25126	GENERIC_DAY	9	0	f	2010-06-16	4348	\N	16800	\N
25137	GENERIC_DAY	9	0	f	2010-06-19	4348	\N	16800	\N
25159	GENERIC_DAY	9	0	f	2010-06-30	4344	\N	16800	\N
25158	GENERIC_DAY	9	0	f	2010-06-30	4350	\N	16800	\N
25093	GENERIC_DAY	9	0	f	2010-06-26	4344	\N	16800	\N
25122	GENERIC_DAY	9	0	f	2010-06-20	4348	\N	16800	\N
25163	GENERIC_DAY	9	0	f	2010-06-27	4348	\N	16800	\N
25125	GENERIC_DAY	9	0	f	2010-06-16	4350	\N	16800	\N
25124	GENERIC_DAY	9	5	f	2010-06-22	21817	\N	16800	\N
25123	GENERIC_DAY	9	0	f	2010-06-21	4350	\N	16800	\N
25130	GENERIC_DAY	9	0	f	2010-06-22	4348	\N	16800	\N
25084	GENERIC_DAY	9	3	f	2010-06-22	4358	\N	16800	\N
25149	GENERIC_DAY	9	0	f	2010-06-23	4344	\N	16800	\N
25095	GENERIC_DAY	9	0	f	2010-06-26	4358	\N	16800	\N
25103	GENERIC_DAY	9	8	f	2010-06-14	4358	\N	16800	\N
25138	GENERIC_DAY	9	0	f	2010-06-21	4348	\N	16800	\N
25144	GENERIC_DAY	9	3	f	2010-06-18	4358	\N	16800	\N
25108	GENERIC_DAY	9	2	f	2010-06-28	4348	\N	16800	\N
42135	GENERIC_DAY	10	0	f	2010-07-02	4352	\N	27165	\N
42106	GENERIC_DAY	10	0	f	2010-07-11	4352	\N	27165	\N
42123	GENERIC_DAY	10	8	f	2010-07-02	4354	\N	27165	\N
42096	GENERIC_DAY	10	0	f	2010-07-11	4354	\N	27165	\N
42089	GENERIC_DAY	10	6	f	2010-08-04	4354	\N	27165	\N
42151	GENERIC_DAY	10	0	f	2010-07-10	4352	\N	27165	\N
42120	GENERIC_DAY	10	0	f	2010-07-04	4352	\N	27165	\N
42087	GENERIC_DAY	10	8	f	2010-07-20	4354	\N	27165	\N
42153	GENERIC_DAY	10	0	f	2010-07-21	4352	\N	27165	\N
42092	GENERIC_DAY	10	0	f	2010-07-07	4352	\N	27165	\N
42128	GENERIC_DAY	10	0	f	2010-07-10	4354	\N	27165	\N
42088	GENERIC_DAY	10	0	f	2010-07-17	4354	\N	27165	\N
42094	GENERIC_DAY	10	8	f	2010-08-02	4354	\N	27165	\N
42144	GENERIC_DAY	10	0	f	2010-08-01	4354	\N	27165	\N
42129	GENERIC_DAY	10	0	f	2010-07-30	4352	\N	27165	\N
42137	GENERIC_DAY	10	0	f	2010-07-22	4352	\N	27165	\N
42095	GENERIC_DAY	10	8	f	2010-07-30	4354	\N	27165	\N
42107	GENERIC_DAY	10	8	f	2010-07-27	4354	\N	27165	\N
42131	GENERIC_DAY	10	8	f	2010-07-15	4354	\N	27165	\N
42115	GENERIC_DAY	10	0	f	2010-07-25	4354	\N	27165	\N
42147	GENERIC_DAY	10	8	f	2010-07-09	4354	\N	27165	\N
42143	GENERIC_DAY	10	0	f	2010-07-06	4352	\N	27165	\N
42156	GENERIC_DAY	10	0	f	2010-08-02	4352	\N	27165	\N
42127	GENERIC_DAY	10	0	f	2010-07-29	4352	\N	27165	\N
42103	GENERIC_DAY	10	0	f	2010-07-04	4354	\N	27165	\N
42110	GENERIC_DAY	10	8	f	2010-07-14	4354	\N	27165	\N
42133	GENERIC_DAY	10	8	f	2010-07-08	4354	\N	27165	\N
42140	GENERIC_DAY	10	0	f	2010-07-09	4352	\N	27165	\N
50573	GENERIC_DAY	2	2	t	2010-07-08	21817	\N	48384	\N
50589	GENERIC_DAY	2	4	f	2010-07-28	4358	\N	48384	\N
50565	GENERIC_DAY	2	0	t	2010-07-14	4344	\N	48384	\N
50561	GENERIC_DAY	2	0	f	2010-07-18	4350	\N	48384	\N
50590	GENERIC_DAY	2	0	t	2010-07-07	4350	\N	48384	\N
50557	GENERIC_DAY	2	4	f	2010-08-02	4350	\N	48384	\N
50580	GENERIC_DAY	2	4	f	2010-07-27	4348	\N	48384	\N
50559	GENERIC_DAY	2	0	t	2010-07-11	4344	\N	48384	\N
50560	GENERIC_DAY	2	3	t	2010-07-07	21817	\N	48384	\N
50585	GENERIC_DAY	2	4	f	2010-07-22	4350	\N	48384	\N
50582	GENERIC_DAY	2	4	f	2010-07-26	4348	\N	48384	\N
50577	GENERIC_DAY	2	0	f	2010-07-17	4350	\N	48384	\N
50584	GENERIC_DAY	2	0	f	2010-07-31	4358	\N	48384	\N
50572	GENERIC_DAY	2	2	t	2010-07-02	4358	\N	48384	\N
50570	GENERIC_DAY	2	5	f	2010-07-30	4344	\N	48384	\N
50558	GENERIC_DAY	2	2	t	2010-07-09	4350	\N	48384	\N
50555	GENERIC_DAY	2	4	f	2010-07-22	4348	\N	48384	\N
50564	GENERIC_DAY	2	0	t	2010-07-10	4344	\N	48384	\N
50566	GENERIC_DAY	2	5	f	2010-07-21	4344	\N	48384	\N
50578	GENERIC_DAY	2	3	t	2010-07-16	4348	\N	48384	\N
50579	GENERIC_DAY	2	0	t	2010-07-08	4344	\N	48384	\N
50568	GENERIC_DAY	2	0	t	2010-07-04	4344	\N	48384	\N
50554	GENERIC_DAY	2	0	t	2010-07-09	4344	\N	48384	\N
50574	GENERIC_DAY	2	5	f	2010-07-27	4344	\N	48384	\N
50575	GENERIC_DAY	2	0	f	2010-07-24	4348	\N	48384	\N
50576	GENERIC_DAY	2	2	t	2010-07-14	4358	\N	48384	\N
50586	GENERIC_DAY	2	0	t	2010-07-16	4344	\N	48384	\N
50562	GENERIC_DAY	2	2	t	2010-07-13	4350	\N	48384	\N
50556	GENERIC_DAY	2	3	t	2010-07-07	4348	\N	48384	\N
50567	GENERIC_DAY	2	4	f	2010-08-03	4344	\N	48384	\N
50587	GENERIC_DAY	2	4	f	2010-08-02	4358	\N	48384	\N
50588	GENERIC_DAY	2	5	f	2010-07-20	4344	\N	48384	\N
50583	GENERIC_DAY	2	4	f	2010-07-27	4358	\N	48384	\N
50563	GENERIC_DAY	2	2	t	2010-07-13	4348	\N	48384	\N
50569	GENERIC_DAY	2	3	t	2010-07-14	4348	\N	48384	\N
50581	GENERIC_DAY	2	0	f	2010-07-17	4348	\N	48384	\N
50571	GENERIC_DAY	2	4	f	2010-07-21	4348	\N	48384	\N
25110	GENERIC_DAY	9	3	f	2010-06-16	4358	\N	16800	\N
25128	GENERIC_DAY	9	0	f	2010-06-18	4350	\N	16800	\N
25113	GENERIC_DAY	9	2	f	2010-06-24	4348	\N	16800	\N
25119	GENERIC_DAY	9	0	f	2010-06-26	4350	\N	16800	\N
25083	GENERIC_DAY	9	0	f	2010-06-20	4358	\N	16800	\N
25094	GENERIC_DAY	9	0	f	2010-06-15	4348	\N	16800	\N
25092	GENERIC_DAY	9	0	f	2010-06-16	4344	\N	16800	\N
25107	GENERIC_DAY	9	0	f	2010-06-15	4350	\N	16800	\N
25151	GENERIC_DAY	9	1	f	2010-06-30	4348	\N	16800	\N
25115	GENERIC_DAY	9	0	f	2010-06-22	4344	\N	16800	\N
25146	GENERIC_DAY	9	0	f	2010-06-27	4350	\N	16800	\N
25139	GENERIC_DAY	9	0	f	2010-06-18	4348	\N	16800	\N
50691	GENERIC_DAY	2	4	f	2010-07-20	4348	\N	48384	\N
50651	GENERIC_DAY	2	4	f	2010-07-28	4350	\N	48384	\N
50671	GENERIC_DAY	2	0	t	2010-07-10	4358	\N	48384	\N
50676	GENERIC_DAY	2	5	f	2010-07-28	4348	\N	48384	\N
50665	GENERIC_DAY	2	3	t	2010-07-02	4348	\N	48384	\N
50692	GENERIC_DAY	2	0	t	2010-07-04	4348	\N	48384	\N
50662	GENERIC_DAY	2	3	f	2010-08-03	4358	\N	48384	\N
50693	GENERIC_DAY	2	3	t	2010-07-02	21817	\N	48384	\N
50661	GENERIC_DAY	2	0	t	2010-07-10	21817	\N	48384	\N
50687	GENERIC_DAY	2	2	t	2010-07-15	4350	\N	48384	\N
50667	GENERIC_DAY	2	4	f	2010-07-22	4358	\N	48384	\N
50673	GENERIC_DAY	2	0	t	2010-07-04	4358	\N	48384	\N
50685	GENERIC_DAY	2	3	t	2010-07-05	21817	\N	48384	\N
50683	GENERIC_DAY	2	3	t	2010-07-15	4348	\N	48384	\N
50670	GENERIC_DAY	2	0	f	2010-07-18	4358	\N	48384	\N
50668	GENERIC_DAY	2	0	t	2010-07-05	4344	\N	48384	\N
50669	GENERIC_DAY	2	4	f	2010-07-29	4348	\N	48384	\N
50678	GENERIC_DAY	2	0	f	2010-07-25	4350	\N	48384	\N
50652	GENERIC_DAY	2	4	f	2010-07-21	4358	\N	48384	\N
50657	GENERIC_DAY	2	5	f	2010-07-29	4344	\N	48384	\N
50609	GENERIC_DAY	2	0	f	2010-07-25	4344	\N	48384	\N
50612	GENERIC_DAY	2	3	t	2010-07-06	4348	\N	48384	\N
50696	GENERIC_DAY	2	0	t	2010-07-10	4350	\N	48384	\N
50629	GENERIC_DAY	2	0	f	2010-08-01	4344	\N	48384	\N
50634	GENERIC_DAY	2	0	f	2010-07-25	4358	\N	48384	\N
50690	GENERIC_DAY	2	4	f	2010-07-29	4350	\N	48384	\N
50659	GENERIC_DAY	2	0	f	2010-07-18	4348	\N	48384	\N
50658	GENERIC_DAY	2	4	f	2010-07-30	4348	\N	48384	\N
50680	GENERIC_DAY	2	0	t	2010-07-12	4344	\N	48384	\N
50605	GENERIC_DAY	2	0	t	2010-07-11	4348	\N	48384	\N
50664	GENERIC_DAY	2	5	f	2010-07-19	4344	\N	48384	\N
50649	GENERIC_DAY	2	0	f	2010-07-25	4348	\N	48384	\N
50619	GENERIC_DAY	2	0	t	2010-07-03	4344	\N	48384	\N
50684	GENERIC_DAY	2	3	t	2010-07-14	4350	\N	48384	\N
50591	GENERIC_DAY	2	2	t	2010-07-13	4358	\N	48384	\N
50599	GENERIC_DAY	2	5	f	2010-07-22	4344	\N	48384	\N
50677	GENERIC_DAY	2	2	t	2010-07-08	4348	\N	48384	\N
50641	GENERIC_DAY	2	0	t	2010-07-07	4344	\N	48384	\N
50603	GENERIC_DAY	2	5	f	2010-07-26	4344	\N	48384	\N
50660	GENERIC_DAY	2	2	t	2010-07-08	4358	\N	48384	\N
50648	GENERIC_DAY	2	0	t	2010-07-10	4348	\N	48384	\N
50697	GENERIC_DAY	2	0	f	2010-07-31	4344	\N	48384	\N
50666	GENERIC_DAY	2	4	f	2010-07-21	4350	\N	48384	\N
50616	GENERIC_DAY	2	0	t	2010-07-11	4350	\N	48384	\N
50640	GENERIC_DAY	2	0	t	2010-07-04	4350	\N	48384	\N
50650	GENERIC_DAY	2	2	t	2010-07-12	4348	\N	48384	\N
50646	GENERIC_DAY	2	5	f	2010-07-23	4344	\N	48384	\N
50647	GENERIC_DAY	2	0	f	2010-08-01	4350	\N	48384	\N
50633	GENERIC_DAY	2	3	t	2010-07-15	4358	\N	48384	\N
46727	GENERIC_DAY	4	2	t	2010-06-16	1216	\N	45866	\N
46708	GENERIC_DAY	4	0	t	2010-06-20	1220	\N	45866	\N
46732	GENERIC_DAY	4	0	f	2010-06-26	1216	\N	45866	\N
46714	GENERIC_DAY	4	2	t	2010-06-17	1216	\N	45866	\N
46742	GENERIC_DAY	4	0	f	2010-06-27	1220	\N	45866	\N
46729	GENERIC_DAY	4	0	t	2010-06-19	1220	\N	45866	\N
46716	GENERIC_DAY	4	10	f	2010-07-01	1216	\N	45866	\N
46741	GENERIC_DAY	4	8	f	2010-06-30	1216	\N	45866	\N
25152	GENERIC_DAY	9	0	f	2010-06-29	4350	\N	16800	\N
25088	GENERIC_DAY	9	4	f	2010-06-28	21817	\N	16800	\N
25136	GENERIC_DAY	9	0	f	2010-06-19	4358	\N	16800	\N
25097	GENERIC_DAY	9	0	f	2010-06-19	21817	\N	16800	\N
25101	GENERIC_DAY	9	0	f	2010-06-20	4344	\N	16800	\N
25114	GENERIC_DAY	9	2	f	2010-06-25	4358	\N	16800	\N
25160	GENERIC_DAY	9	4	f	2010-06-29	21817	\N	16800	\N
25102	GENERIC_DAY	9	2	f	2010-06-23	4358	\N	16800	\N
25120	GENERIC_DAY	9	0	f	2010-06-24	4344	\N	16800	\N
25121	GENERIC_DAY	9	0	f	2010-06-18	4344	\N	16800	\N
25148	GENERIC_DAY	9	0	f	2010-06-22	4350	\N	16800	\N
25098	GENERIC_DAY	9	5	f	2010-06-15	21817	\N	16800	\N
25133	GENERIC_DAY	9	5	f	2010-06-18	21817	\N	16800	\N
25104	GENERIC_DAY	9	0	f	2010-06-23	4350	\N	16800	\N
25296	GENERIC_DAY	7	5	f	2010-07-07	4352	\N	16802	\N
25278	GENERIC_DAY	7	4	f	2010-07-28	4352	\N	16802	\N
25239	GENERIC_DAY	7	3	f	2010-07-13	4354	\N	16802	\N
25248	GENERIC_DAY	7	0	f	2010-07-24	4352	\N	16802	\N
25269	GENERIC_DAY	7	4	f	2010-08-04	4352	\N	16802	\N
25164	GENERIC_DAY	9	0	f	2010-06-19	4344	\N	16800	\N
25135	GENERIC_DAY	9	0	f	2010-06-28	4350	\N	16800	\N
25086	GENERIC_DAY	9	0	f	2010-06-20	21817	\N	16800	\N
25162	GENERIC_DAY	9	0	f	2010-06-17	4348	\N	16800	\N
25096	GENERIC_DAY	9	0	f	2010-06-27	4344	\N	16800	\N
25141	GENERIC_DAY	9	5	f	2010-06-21	21817	\N	16800	\N
25087	GENERIC_DAY	9	0	f	2010-06-14	4350	\N	16800	\N
25140	GENERIC_DAY	9	2	f	2010-06-23	4348	\N	16800	\N
25085	GENERIC_DAY	9	0	f	2010-06-28	4344	\N	16800	\N
25157	GENERIC_DAY	9	2	f	2010-06-30	21817	\N	16800	\N
25109	GENERIC_DAY	9	3	f	2010-06-15	4358	\N	16800	\N
25111	GENERIC_DAY	9	5	f	2010-06-16	21817	\N	16800	\N
25100	GENERIC_DAY	9	0	f	2010-06-25	4344	\N	16800	\N
25127	GENERIC_DAY	9	3	f	2010-06-21	4358	\N	16800	\N
25145	GENERIC_DAY	9	0	f	2010-06-27	4358	\N	16800	\N
25132	GENERIC_DAY	9	0	f	2010-06-26	21817	\N	16800	\N
25143	GENERIC_DAY	9	2	f	2010-06-24	4358	\N	16800	\N
25134	GENERIC_DAY	9	2	f	2010-06-29	4348	\N	16800	\N
25161	GENERIC_DAY	9	4	f	2010-06-25	21817	\N	16800	\N
25131	GENERIC_DAY	9	0	f	2010-06-20	4350	\N	16800	\N
25117	GENERIC_DAY	9	2	f	2010-06-25	4348	\N	16800	\N
25099	GENERIC_DAY	9	2	f	2010-06-28	4358	\N	16800	\N
25155	GENERIC_DAY	9	0	f	2010-06-15	4344	\N	16800	\N
25116	GENERIC_DAY	9	2	f	2010-06-29	4358	\N	16800	\N
25142	GENERIC_DAY	9	0	f	2010-06-21	4344	\N	16800	\N
25154	GENERIC_DAY	9	5	f	2010-06-17	21817	\N	16800	\N
25118	GENERIC_DAY	9	0	f	2010-06-17	4350	\N	16800	\N
25112	GENERIC_DAY	9	4	f	2010-06-24	21817	\N	16800	\N
25106	GENERIC_DAY	9	3	f	2010-06-17	4358	\N	16800	\N
25153	GENERIC_DAY	9	0	f	2010-06-17	4344	\N	16800	\N
25105	GENERIC_DAY	9	0	f	2010-06-26	4348	\N	16800	\N
25089	GENERIC_DAY	9	1	f	2010-06-30	4358	\N	16800	\N
42080	GENERIC_DAY	11	0	f	2010-06-19	4344	\N	27164	\N
42033	GENERIC_DAY	11	4	f	2010-06-17	21817	\N	27164	\N
42069	GENERIC_DAY	11	2	f	2010-06-25	21817	\N	27164	\N
42035	GENERIC_DAY	11	0	f	2010-06-29	4350	\N	27164	\N
42042	GENERIC_DAY	11	2	f	2010-06-29	4358	\N	27164	\N
42066	GENERIC_DAY	11	0	f	2010-06-21	4350	\N	27164	\N
42024	GENERIC_DAY	11	0	f	2010-06-22	4344	\N	27164	\N
42020	GENERIC_DAY	11	0	f	2010-06-17	4348	\N	27164	\N
42045	GENERIC_DAY	11	2	f	2010-06-28	4358	\N	27164	\N
42006	GENERIC_DAY	11	4	f	2010-06-17	4358	\N	27164	\N
42013	GENERIC_DAY	11	1	f	2010-06-30	21817	\N	27164	\N
42034	GENERIC_DAY	11	0	f	2010-06-26	4358	\N	27164	\N
42027	GENERIC_DAY	11	2	f	2010-06-23	21817	\N	27164	\N
42074	GENERIC_DAY	11	3	f	2010-06-25	4348	\N	27164	\N
42048	GENERIC_DAY	11	0	f	2010-06-27	4358	\N	27164	\N
25265	GENERIC_DAY	7	3	f	2010-07-20	4354	\N	16802	\N
25257	GENERIC_DAY	7	4	f	2010-08-03	4354	\N	16802	\N
25284	GENERIC_DAY	7	0	f	2010-07-10	4352	\N	16802	\N
42146	GENERIC_DAY	10	0	f	2010-07-20	4352	\N	27165	\N
42114	GENERIC_DAY	10	0	f	2010-07-08	4352	\N	27165	\N
42132	GENERIC_DAY	10	0	f	2010-07-24	4352	\N	27165	\N
42145	GENERIC_DAY	10	8	f	2010-07-28	4354	\N	27165	\N
42141	GENERIC_DAY	10	0	f	2010-08-01	4352	\N	27165	\N
42121	GENERIC_DAY	10	0	f	2010-07-05	4352	\N	27165	\N
42098	GENERIC_DAY	10	0	f	2010-07-18	4352	\N	27165	\N
42112	GENERIC_DAY	10	8	f	2010-07-26	4354	\N	27165	\N
42119	GENERIC_DAY	10	0	f	2010-08-03	4352	\N	27165	\N
42126	GENERIC_DAY	10	8	f	2010-07-16	4354	\N	27165	\N
42138	GENERIC_DAY	10	0	f	2010-07-19	4352	\N	27165	\N
42104	GENERIC_DAY	10	0	f	2010-07-12	4352	\N	27165	\N
42155	GENERIC_DAY	10	0	f	2010-07-15	4352	\N	27165	\N
42149	GENERIC_DAY	10	0	f	2010-07-03	4352	\N	27165	\N
50592	GENERIC_DAY	2	3	f	2010-08-03	4350	\N	48384	\N
50655	GENERIC_DAY	2	3	t	2010-07-06	21817	\N	48384	\N
50682	GENERIC_DAY	2	0	f	2010-07-31	4348	\N	48384	\N
50672	GENERIC_DAY	2	0	t	2010-07-13	4344	\N	48384	\N
50663	GENERIC_DAY	2	0	t	2010-07-04	21817	\N	48384	\N
50653	GENERIC_DAY	2	4	f	2010-07-30	4358	\N	48384	\N
50695	GENERIC_DAY	2	3	f	2010-08-03	4348	\N	48384	\N
50625	GENERIC_DAY	2	4	f	2010-07-23	4348	\N	48384	\N
50620	GENERIC_DAY	2	0	f	2010-07-24	4350	\N	48384	\N
50630	GENERIC_DAY	2	2	t	2010-07-05	4358	\N	48384	\N
50645	GENERIC_DAY	2	0	f	2010-07-17	4358	\N	48384	\N
50688	GENERIC_DAY	2	4	f	2010-07-29	4358	\N	48384	\N
50656	GENERIC_DAY	2	2	t	2010-07-09	4358	\N	48384	\N
50694	GENERIC_DAY	2	3	t	2010-07-16	4358	\N	48384	\N
50639	GENERIC_DAY	2	0	t	2010-07-03	4358	\N	48384	\N
50686	GENERIC_DAY	2	0	t	2010-07-02	4350	\N	48384	\N
50607	GENERIC_DAY	2	2	t	2010-07-06	4358	\N	48384	\N
50679	GENERIC_DAY	2	0	f	2010-08-01	4358	\N	48384	\N
50674	GENERIC_DAY	2	0	f	2010-07-31	4350	\N	48384	\N
50681	GENERIC_DAY	2	4	f	2010-07-26	4358	\N	48384	\N
46722	GENERIC_DAY	4	6	t	2010-06-16	1220	\N	45866	\N
46736	GENERIC_DAY	4	0	f	2010-06-27	1216	\N	45866	\N
46731	GENERIC_DAY	4	0	t	2010-06-20	1216	\N	45866	\N
46735	GENERIC_DAY	4	0	t	2010-06-24	1216	\N	45866	\N
46730	GENERIC_DAY	4	12	f	2010-06-30	1220	\N	45866	\N
46728	GENERIC_DAY	4	8	t	2010-06-23	1220	\N	45866	\N
46715	GENERIC_DAY	4	14	f	2010-06-29	1220	\N	45866	\N
46739	GENERIC_DAY	4	8	t	2010-06-22	1220	\N	45866	\N
46734	GENERIC_DAY	4	6	t	2010-06-15	1220	\N	45866	\N
46738	GENERIC_DAY	4	0	t	2010-06-22	1216	\N	45866	\N
46737	GENERIC_DAY	4	0	t	2010-06-23	1216	\N	45866	\N
46724	GENERIC_DAY	4	14	f	2010-06-28	1220	\N	45866	\N
46717	GENERIC_DAY	4	6	f	2010-06-28	1216	\N	45866	\N
52639	GENERIC_DAY	0	0	f	2010-07-20	4352	\N	50806	\N
52640	GENERIC_DAY	0	2	f	2010-08-10	4352	\N	50806	\N
52641	GENERIC_DAY	0	1	f	2010-08-09	4354	\N	50806	\N
52642	GENERIC_DAY	0	3	f	2010-06-18	4354	\N	50806	\N
52643	GENERIC_DAY	0	3	f	2010-07-05	4354	\N	50806	\N
52644	GENERIC_DAY	0	3	f	2010-07-14	4354	\N	50806	\N
52645	GENERIC_DAY	0	3	f	2010-07-23	4354	\N	50806	\N
52646	GENERIC_DAY	0	3	f	2010-07-13	4354	\N	50806	\N
52647	GENERIC_DAY	0	0	f	2010-06-19	4354	\N	50806	\N
52648	GENERIC_DAY	0	3	f	2010-07-27	4354	\N	50806	\N
52649	GENERIC_DAY	0	0	f	2010-07-17	4354	\N	50806	\N
52650	GENERIC_DAY	0	0	f	2010-07-14	4352	\N	50806	\N
52651	GENERIC_DAY	0	1	f	2010-08-05	4354	\N	50806	\N
42055	GENERIC_DAY	11	1	f	2010-06-30	4348	\N	27164	\N
42073	GENERIC_DAY	11	0	f	2010-06-27	4350	\N	27164	\N
42065	GENERIC_DAY	11	0	f	2010-06-15	4348	\N	27164	\N
42040	GENERIC_DAY	11	0	f	2010-06-23	4350	\N	27164	\N
42026	GENERIC_DAY	11	3	f	2010-06-23	4348	\N	27164	\N
42043	GENERIC_DAY	11	0	f	2010-06-16	4348	\N	27164	\N
46725	GENERIC_DAY	4	6	t	2010-06-17	1220	\N	45866	\N
46721	GENERIC_DAY	4	0	t	2010-06-19	1216	\N	45866	\N
46713	GENERIC_DAY	4	14	f	2010-06-25	1220	\N	45866	\N
46709	GENERIC_DAY	4	1	t	2010-06-14	1216	\N	45866	\N
46710	GENERIC_DAY	4	6	f	2010-06-25	1216	\N	45866	\N
46718	GENERIC_DAY	4	2	t	2010-06-18	1216	\N	45866	\N
46740	GENERIC_DAY	4	7	t	2010-06-14	1220	\N	45866	\N
42015	GENERIC_DAY	11	0	f	2010-06-27	4344	\N	27164	\N
42014	GENERIC_DAY	11	0	f	2010-06-24	4350	\N	27164	\N
42060	GENERIC_DAY	11	3	f	2010-06-28	21817	\N	27164	\N
42082	GENERIC_DAY	11	0	f	2010-06-20	4358	\N	27164	\N
42071	GENERIC_DAY	11	0	f	2010-06-27	4348	\N	27164	\N
42046	GENERIC_DAY	11	0	f	2010-06-19	4350	\N	27164	\N
42032	GENERIC_DAY	11	0	f	2010-06-21	4348	\N	27164	\N
42023	GENERIC_DAY	11	3	f	2010-06-24	4358	\N	27164	\N
42008	GENERIC_DAY	11	4	f	2010-06-21	4358	\N	27164	\N
42068	GENERIC_DAY	11	0	f	2010-06-15	4350	\N	27164	\N
42012	GENERIC_DAY	11	3	f	2010-06-28	4348	\N	27164	\N
42079	GENERIC_DAY	11	0	f	2010-06-20	21817	\N	27164	\N
42053	GENERIC_DAY	11	0	f	2010-06-20	4344	\N	27164	\N
42021	GENERIC_DAY	11	0	f	2010-06-18	4348	\N	27164	\N
42017	GENERIC_DAY	11	4	f	2010-06-15	21817	\N	27164	\N
42061	GENERIC_DAY	11	0	f	2010-06-17	4350	\N	27164	\N
42028	GENERIC_DAY	11	4	f	2010-06-14	4358	\N	27164	\N
42077	GENERIC_DAY	11	4	f	2010-06-15	4358	\N	27164	\N
42052	GENERIC_DAY	11	0	f	2010-06-26	4350	\N	27164	\N
42064	GENERIC_DAY	11	4	f	2010-06-21	21817	\N	27164	\N
42078	GENERIC_DAY	11	0	f	2010-06-19	21817	\N	27164	\N
42007	GENERIC_DAY	11	0	f	2010-06-15	4344	\N	27164	\N
42037	GENERIC_DAY	11	4	f	2010-06-18	21817	\N	27164	\N
42009	GENERIC_DAY	11	3	f	2010-06-29	21817	\N	27164	\N
25262	GENERIC_DAY	7	0	f	2010-07-25	4354	\N	16802	\N
25279	GENERIC_DAY	7	0	f	2010-07-10	4354	\N	16802	\N
25272	GENERIC_DAY	7	3	f	2010-07-14	4354	\N	16802	\N
25275	GENERIC_DAY	7	0	f	2010-07-03	4354	\N	16802	\N
25243	GENERIC_DAY	7	4	f	2010-08-02	4352	\N	16802	\N
25304	GENERIC_DAY	7	4	f	2010-07-01	4352	\N	16802	\N
25285	GENERIC_DAY	7	4	f	2010-08-04	4354	\N	16802	\N
25299	GENERIC_DAY	7	0	f	2010-08-01	4352	\N	16802	\N
25297	GENERIC_DAY	7	4	f	2010-07-26	4352	\N	16802	\N
25255	GENERIC_DAY	7	3	f	2010-07-12	4354	\N	16802	\N
25259	GENERIC_DAY	7	3	f	2010-07-19	4354	\N	16802	\N
25273	GENERIC_DAY	7	3	f	2010-07-09	4354	\N	16802	\N
25258	GENERIC_DAY	7	5	f	2010-07-05	4352	\N	16802	\N
25247	GENERIC_DAY	7	4	f	2010-07-02	4354	\N	16802	\N
25295	GENERIC_DAY	7	3	f	2010-07-07	4354	\N	16802	\N
25291	GENERIC_DAY	7	5	f	2010-07-13	4352	\N	16802	\N
25286	GENERIC_DAY	7	0	f	2010-08-01	4354	\N	16802	\N
25280	GENERIC_DAY	7	5	f	2010-07-20	4352	\N	16802	\N
25241	GENERIC_DAY	7	4	f	2010-07-02	4352	\N	16802	\N
25252	GENERIC_DAY	7	4	f	2010-07-21	4352	\N	16802	\N
25289	GENERIC_DAY	7	4	f	2010-07-28	4354	\N	16802	\N
25301	GENERIC_DAY	7	5	f	2010-07-15	4352	\N	16802	\N
25264	GENERIC_DAY	7	4	f	2010-07-27	4354	\N	16802	\N
25242	GENERIC_DAY	7	0	f	2010-07-18	4354	\N	16802	\N
25235	GENERIC_DAY	7	4	f	2010-07-01	4354	\N	16802	\N
25287	GENERIC_DAY	7	5	f	2010-07-14	4352	\N	16802	\N
25253	GENERIC_DAY	7	0	f	2010-07-04	4354	\N	16802	\N
25246	GENERIC_DAY	7	4	f	2010-07-30	4352	\N	16802	\N
25256	GENERIC_DAY	7	4	f	2010-07-27	4352	\N	16802	\N
25249	GENERIC_DAY	7	4	f	2010-07-26	4354	\N	16802	\N
25302	GENERIC_DAY	7	0	f	2010-07-11	4352	\N	16802	\N
25267	GENERIC_DAY	7	0	f	2010-07-18	4352	\N	16802	\N
25281	GENERIC_DAY	7	3	f	2010-07-08	4354	\N	16802	\N
25277	GENERIC_DAY	7	5	f	2010-07-09	4352	\N	16802	\N
25288	GENERIC_DAY	7	4	f	2010-07-23	4354	\N	16802	\N
25240	GENERIC_DAY	7	4	f	2010-07-21	4354	\N	16802	\N
25270	GENERIC_DAY	7	4	f	2010-07-23	4352	\N	16802	\N
25236	GENERIC_DAY	7	4	f	2010-07-29	4354	\N	16802	\N
25293	GENERIC_DAY	7	0	f	2010-07-25	4352	\N	16802	\N
25260	GENERIC_DAY	7	0	f	2010-07-17	4354	\N	16802	\N
25298	GENERIC_DAY	7	0	f	2010-07-04	4352	\N	16802	\N
25303	GENERIC_DAY	7	3	f	2010-07-16	4354	\N	16802	\N
25268	GENERIC_DAY	7	5	f	2010-07-06	4352	\N	16802	\N
25274	GENERIC_DAY	7	5	f	2010-07-19	4352	\N	16802	\N
25290	GENERIC_DAY	7	5	f	2010-07-08	4352	\N	16802	\N
25282	GENERIC_DAY	7	4	f	2010-07-29	4352	\N	16802	\N
25244	GENERIC_DAY	7	0	f	2010-07-31	4352	\N	16802	\N
25271	GENERIC_DAY	7	5	f	2010-07-16	4352	\N	16802	\N
25245	GENERIC_DAY	7	4	f	2010-07-22	4354	\N	16802	\N
25283	GENERIC_DAY	7	3	f	2010-07-05	4354	\N	16802	\N
25251	GENERIC_DAY	7	3	f	2010-07-15	4354	\N	16802	\N
25294	GENERIC_DAY	7	0	f	2010-07-03	4352	\N	16802	\N
25238	GENERIC_DAY	7	0	f	2010-07-31	4354	\N	16802	\N
25254	GENERIC_DAY	7	3	f	2010-07-06	4354	\N	16802	\N
25266	GENERIC_DAY	7	4	f	2010-07-22	4352	\N	16802	\N
25261	GENERIC_DAY	7	4	f	2010-08-02	4354	\N	16802	\N
25292	GENERIC_DAY	7	4	f	2010-08-03	4352	\N	16802	\N
25300	GENERIC_DAY	7	5	f	2010-07-12	4352	\N	16802	\N
25250	GENERIC_DAY	7	4	f	2010-07-30	4354	\N	16802	\N
25263	GENERIC_DAY	7	0	f	2010-07-17	4352	\N	16802	\N
25237	GENERIC_DAY	7	0	f	2010-07-11	4354	\N	16802	\N
25276	GENERIC_DAY	7	0	f	2010-07-24	4354	\N	16802	\N
42113	GENERIC_DAY	10	8	f	2010-07-22	4354	\N	27165	\N
42150	GENERIC_DAY	10	8	f	2010-07-07	4354	\N	27165	\N
42102	GENERIC_DAY	10	0	f	2010-07-14	4352	\N	27165	\N
42108	GENERIC_DAY	10	0	f	2010-07-25	4352	\N	27165	\N
42101	GENERIC_DAY	10	8	f	2010-08-03	4354	\N	27165	\N
42097	GENERIC_DAY	10	8	f	2010-07-12	4354	\N	27165	\N
42118	GENERIC_DAY	10	0	f	2010-07-31	4354	\N	27165	\N
42130	GENERIC_DAY	10	0	f	2010-07-17	4352	\N	27165	\N
42091	GENERIC_DAY	10	2	f	2010-08-04	4352	\N	27165	\N
42111	GENERIC_DAY	10	8	f	2010-07-13	4354	\N	27165	\N
42093	GENERIC_DAY	10	8	f	2010-07-21	4354	\N	27165	\N
42154	GENERIC_DAY	10	0	f	2010-07-03	4354	\N	27165	\N
42152	GENERIC_DAY	10	0	f	2010-07-28	4352	\N	27165	\N
42100	GENERIC_DAY	10	0	f	2010-07-13	4352	\N	27165	\N
42116	GENERIC_DAY	10	8	f	2010-07-29	4354	\N	27165	\N
42122	GENERIC_DAY	10	0	f	2010-07-27	4352	\N	27165	\N
42136	GENERIC_DAY	10	8	f	2010-07-23	4354	\N	27165	\N
50611	GENERIC_DAY	2	4	f	2010-07-23	4358	\N	48384	\N
50600	GENERIC_DAY	2	4	f	2010-07-20	4350	\N	48384	\N
50643	GENERIC_DAY	2	0	t	2010-07-15	4344	\N	48384	\N
50613	GENERIC_DAY	2	2	t	2010-07-13	21817	\N	48384	\N
50614	GENERIC_DAY	2	4	f	2010-08-02	4348	\N	48384	\N
50618	GENERIC_DAY	2	0	t	2010-07-06	4344	\N	48384	\N
50631	GENERIC_DAY	2	2	t	2010-07-12	21817	\N	48384	\N
50624	GENERIC_DAY	2	0	t	2010-07-11	4358	\N	48384	\N
50594	GENERIC_DAY	2	2	t	2010-07-09	21817	\N	48384	\N
50608	GENERIC_DAY	2	5	f	2010-08-02	4344	\N	48384	\N
50626	GENERIC_DAY	2	4	f	2010-07-19	4348	\N	48384	\N
50593	GENERIC_DAY	2	2	t	2010-07-07	4358	\N	48384	\N
50622	GENERIC_DAY	2	4	f	2010-07-28	4344	\N	48384	\N
50638	GENERIC_DAY	2	0	t	2010-07-05	4350	\N	48384	\N
50644	GENERIC_DAY	2	0	f	2010-07-24	4344	\N	48384	\N
50604	GENERIC_DAY	2	0	t	2010-07-03	21817	\N	48384	\N
50632	GENERIC_DAY	2	0	t	2010-07-02	4344	\N	48384	\N
50621	GENERIC_DAY	2	4	f	2010-07-30	4350	\N	48384	\N
50628	GENERIC_DAY	2	2	t	2010-07-12	4358	\N	48384	\N
50610	GENERIC_DAY	2	0	f	2010-07-17	4344	\N	48384	\N
50601	GENERIC_DAY	2	0	t	2010-07-11	21817	\N	48384	\N
50602	GENERIC_DAY	2	4	f	2010-07-23	4350	\N	48384	\N
50617	GENERIC_DAY	2	2	t	2010-07-16	4350	\N	48384	\N
50637	GENERIC_DAY	2	0	t	2010-07-03	4348	\N	48384	\N
50615	GENERIC_DAY	2	0	t	2010-07-06	4350	\N	48384	\N
50598	GENERIC_DAY	2	4	f	2010-07-27	4350	\N	48384	\N
50623	GENERIC_DAY	2	2	t	2010-07-08	4350	\N	48384	\N
50606	GENERIC_DAY	2	4	f	2010-07-20	4358	\N	48384	\N
50636	GENERIC_DAY	2	4	f	2010-07-19	4350	\N	48384	\N
50596	GENERIC_DAY	2	2	t	2010-07-12	4350	\N	48384	\N
50642	GENERIC_DAY	2	0	t	2010-07-03	4350	\N	48384	\N
50635	GENERIC_DAY	2	2	t	2010-07-09	4348	\N	48384	\N
50689	GENERIC_DAY	2	0	f	2010-08-01	4348	\N	48384	\N
50595	GENERIC_DAY	2	4	f	2010-07-26	4350	\N	48384	\N
50675	GENERIC_DAY	2	3	t	2010-07-05	4348	\N	48384	\N
50654	GENERIC_DAY	2	0	f	2010-07-24	4358	\N	48384	\N
50597	GENERIC_DAY	2	4	f	2010-07-19	4358	\N	48384	\N
50627	GENERIC_DAY	2	0	f	2010-07-18	4344	\N	48384	\N
52652	GENERIC_DAY	0	0	f	2010-07-24	4354	\N	50806	\N
52653	GENERIC_DAY	0	3	f	2010-06-17	4354	\N	50806	\N
52654	GENERIC_DAY	0	0	f	2010-07-01	4352	\N	50806	\N
52655	GENERIC_DAY	0	2	f	2010-08-11	4352	\N	50806	\N
52656	GENERIC_DAY	0	3	f	2010-06-29	4354	\N	50806	\N
52657	GENERIC_DAY	0	0	f	2010-07-29	4352	\N	50806	\N
52658	GENERIC_DAY	0	0	f	2010-07-11	4352	\N	50806	\N
52659	GENERIC_DAY	0	3	f	2010-07-30	4354	\N	50806	\N
52660	GENERIC_DAY	0	3	f	2010-08-04	4354	\N	50806	\N
52661	GENERIC_DAY	0	0	f	2010-07-31	4354	\N	50806	\N
52662	GENERIC_DAY	0	0	f	2010-07-11	4354	\N	50806	\N
52663	GENERIC_DAY	0	3	f	2010-07-07	4354	\N	50806	\N
52664	GENERIC_DAY	0	0	f	2010-07-04	4352	\N	50806	\N
52665	GENERIC_DAY	0	0	t	2010-06-15	4352	\N	50806	\N
52666	GENERIC_DAY	0	0	t	2010-06-16	4352	\N	50806	\N
52667	GENERIC_DAY	0	0	f	2010-06-19	4352	\N	50806	\N
52668	GENERIC_DAY	0	8	t	2010-06-16	4354	\N	50806	\N
52669	GENERIC_DAY	0	0	f	2010-06-21	4352	\N	50806	\N
52670	GENERIC_DAY	0	0	f	2010-07-07	4352	\N	50806	\N
52671	GENERIC_DAY	0	0	f	2010-06-30	4352	\N	50806	\N
52672	GENERIC_DAY	0	3	f	2010-07-02	4354	\N	50806	\N
52673	GENERIC_DAY	0	0	f	2010-08-08	4352	\N	50806	\N
52674	GENERIC_DAY	0	0	f	2010-07-22	4352	\N	50806	\N
52675	GENERIC_DAY	0	3	f	2010-06-28	4354	\N	50806	\N
52676	GENERIC_DAY	0	0	f	2010-07-24	4352	\N	50806	\N
52677	GENERIC_DAY	0	2	f	2010-08-05	4352	\N	50806	\N
52678	GENERIC_DAY	0	0	f	2010-07-03	4354	\N	50806	\N
52679	GENERIC_DAY	0	3	f	2010-07-12	4354	\N	50806	\N
52680	GENERIC_DAY	0	0	f	2010-06-26	4354	\N	50806	\N
52681	GENERIC_DAY	0	3	f	2010-07-06	4354	\N	50806	\N
52682	GENERIC_DAY	0	3	f	2010-07-21	4354	\N	50806	\N
52683	GENERIC_DAY	0	3	f	2010-07-20	4354	\N	50806	\N
52684	GENERIC_DAY	0	0	f	2010-06-24	4352	\N	50806	\N
52685	GENERIC_DAY	0	0	f	2010-06-22	4352	\N	50806	\N
52686	GENERIC_DAY	0	0	f	2010-07-05	4352	\N	50806	\N
52687	GENERIC_DAY	0	0	f	2010-07-08	4352	\N	50806	\N
52688	GENERIC_DAY	0	0	f	2010-07-23	4352	\N	50806	\N
52689	GENERIC_DAY	0	0	f	2010-06-29	4352	\N	50806	\N
52690	GENERIC_DAY	0	0	f	2010-06-18	4352	\N	50806	\N
52691	GENERIC_DAY	0	0	f	2010-08-07	4354	\N	50806	\N
52692	GENERIC_DAY	0	2	f	2010-08-09	4352	\N	50806	\N
52693	GENERIC_DAY	0	3	f	2010-07-22	4354	\N	50806	\N
52694	GENERIC_DAY	0	3	f	2010-07-01	4354	\N	50806	\N
52695	GENERIC_DAY	0	0	f	2010-07-28	4352	\N	50806	\N
52696	GENERIC_DAY	0	0	f	2010-06-27	4352	\N	50806	\N
52697	GENERIC_DAY	0	0	f	2010-06-26	4352	\N	50806	\N
52698	GENERIC_DAY	0	3	f	2010-07-26	4354	\N	50806	\N
52699	GENERIC_DAY	0	0	f	2010-07-26	4352	\N	50806	\N
52700	GENERIC_DAY	0	0	f	2010-07-17	4352	\N	50806	\N
52701	GENERIC_DAY	0	0	f	2010-08-01	4354	\N	50806	\N
52702	GENERIC_DAY	0	0	f	2010-08-02	4352	\N	50806	\N
52703	GENERIC_DAY	0	0	f	2010-07-10	4354	\N	50806	\N
52704	GENERIC_DAY	0	0	f	2010-06-20	4354	\N	50806	\N
52705	GENERIC_DAY	0	3	f	2010-07-19	4354	\N	50806	\N
52706	GENERIC_DAY	0	0	f	2010-06-27	4354	\N	50806	\N
52707	GENERIC_DAY	0	0	f	2010-06-17	4352	\N	50806	\N
52708	GENERIC_DAY	0	3	f	2010-07-16	4354	\N	50806	\N
52709	GENERIC_DAY	0	0	f	2010-07-27	4352	\N	50806	\N
52710	GENERIC_DAY	0	1	f	2010-08-11	4354	\N	50806	\N
52711	GENERIC_DAY	0	3	f	2010-06-21	4354	\N	50806	\N
52712	GENERIC_DAY	0	0	f	2010-07-12	4352	\N	50806	\N
52713	GENERIC_DAY	0	0	f	2010-06-20	4352	\N	50806	\N
52714	GENERIC_DAY	0	0	f	2010-08-03	4352	\N	50806	\N
52715	GENERIC_DAY	0	0	f	2010-07-10	4352	\N	50806	\N
52716	GENERIC_DAY	0	0	f	2010-07-25	4354	\N	50806	\N
52717	GENERIC_DAY	0	0	f	2010-06-23	4352	\N	50806	\N
52718	GENERIC_DAY	0	3	f	2010-07-09	4354	\N	50806	\N
52719	GENERIC_DAY	0	8	t	2010-06-14	4354	\N	50806	\N
52720	GENERIC_DAY	0	0	f	2010-07-30	4352	\N	50806	\N
52721	GENERIC_DAY	0	3	f	2010-06-22	4354	\N	50806	\N
52722	GENERIC_DAY	0	0	f	2010-07-02	4352	\N	50806	\N
52723	GENERIC_DAY	0	3	f	2010-08-02	4354	\N	50806	\N
52724	GENERIC_DAY	0	3	f	2010-07-08	4354	\N	50806	\N
52725	GENERIC_DAY	0	0	f	2010-07-16	4352	\N	50806	\N
52726	GENERIC_DAY	0	0	f	2010-07-25	4352	\N	50806	\N
52727	GENERIC_DAY	0	0	f	2010-07-31	4352	\N	50806	\N
52728	GENERIC_DAY	0	0	f	2010-07-09	4352	\N	50806	\N
52729	GENERIC_DAY	0	3	f	2010-06-30	4354	\N	50806	\N
52730	GENERIC_DAY	0	0	f	2010-07-03	4352	\N	50806	\N
52731	GENERIC_DAY	0	3	f	2010-07-29	4354	\N	50806	\N
52732	GENERIC_DAY	0	0	f	2010-07-18	4354	\N	50806	\N
52733	GENERIC_DAY	0	3	f	2010-06-25	4354	\N	50806	\N
52734	GENERIC_DAY	0	0	f	2010-07-18	4352	\N	50806	\N
52735	GENERIC_DAY	0	0	f	2010-07-15	4352	\N	50806	\N
52736	GENERIC_DAY	0	0	f	2010-08-04	4352	\N	50806	\N
52737	GENERIC_DAY	0	0	f	2010-08-08	4354	\N	50806	\N
52738	GENERIC_DAY	0	0	f	2010-07-21	4352	\N	50806	\N
52739	GENERIC_DAY	0	0	f	2010-07-13	4352	\N	50806	\N
52740	GENERIC_DAY	0	3	f	2010-06-24	4354	\N	50806	\N
52741	GENERIC_DAY	0	1	f	2010-08-06	4354	\N	50806	\N
52742	GENERIC_DAY	0	0	f	2010-08-07	4352	\N	50806	\N
52743	GENERIC_DAY	0	0	f	2010-06-28	4352	\N	50806	\N
52744	GENERIC_DAY	0	0	f	2010-07-04	4354	\N	50806	\N
52745	GENERIC_DAY	0	0	f	2010-07-06	4352	\N	50806	\N
52746	GENERIC_DAY	0	0	f	2010-06-25	4352	\N	50806	\N
52747	GENERIC_DAY	0	0	f	2010-08-01	4352	\N	50806	\N
52748	GENERIC_DAY	0	1	f	2010-08-10	4354	\N	50806	\N
52749	GENERIC_DAY	0	3	f	2010-08-03	4354	\N	50806	\N
52750	GENERIC_DAY	0	8	t	2010-06-15	4354	\N	50806	\N
52751	GENERIC_DAY	0	3	f	2010-07-28	4354	\N	50806	\N
52752	GENERIC_DAY	0	3	f	2010-07-15	4354	\N	50806	\N
52753	GENERIC_DAY	0	0	f	2010-07-19	4352	\N	50806	\N
52754	GENERIC_DAY	0	3	f	2010-06-23	4354	\N	50806	\N
52755	GENERIC_DAY	0	2	f	2010-08-06	4352	\N	50806	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
8716297	1	26480	26481	\N	0
8716298	1	26477	26480	\N	0
8716299	1	26470	26475	\N	0
8716300	1	26471	26473	\N	0
8716301	1	26472	26476	\N	0
8716302	1	26473	26478	\N	0
8716332	2	26514	26515	\N	0
8716334	2	26516	26519	\N	0
8716333	2	26516	26517	\N	0
8716335	2	26516	26521	\N	0
8716337	2	26521	26524	\N	0
8716336	2	26519	26520	\N	0
8716291	9	26467	26468	\N	0
8716289	9	26462	26463	\N	0
8716290	10	26464	26467	\N	0
8716288	10	26462	26464	\N	0
8716304	5	26487	26488	38178	0
8716303	5	26484	26490	38180	0
8716305	4	26484	26485	38179	0
786498	13	2124	2125	2528	0
4620297	8	5457	5463	\N	0
4620298	8	5459	5460	\N	0
4620295	8	5455	5456	\N	0
4620296	8	5456	5457	\N	0
5537800	6	5464	5465	\N	0
1310720	4	2122	2124	4141	0
786500	13	2121	2122	2525	0
8716326	1	26497	26498	\N	0
8716327	1	26494	26497	\N	0
8716328	1	26499	26502	\N	0
8716329	1	26494	26499	\N	0
8716330	1	26492	26493	\N	0
8716331	1	26494	26495	\N	0
5537806	10	22830	22832	\N	0
5537804	10	22828	22829	\N	0
5537805	10	22826	22827	\N	0
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
14140	Incidencias	
14141	Incidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
26108	25897	100.00
26109	25898	100.00
26110	25899	100.00
26111	25901	100.00
26112	25902	100.00
26115	25903	100.00
9191	7577	100.00
9192	7585	100.00
9193	7586	100.00
43686	43507	100.00
43679	43501	100.00
43680	43502	100.00
43681	43503	100.00
43682	43505	100.00
43683	43506	100.00
2020	1533	100.00
2021	1534	100.00
2030	1543	100.00
2024	1536	100.00
2025	1537	100.00
5353	4980	100.00
5354	4981	100.00
5355	4982	100.00
5356	4983	100.00
5359	4985	100.00
5360	4986	100.00
5361	4987	100.00
5362	4988	100.00
5365	4990	100.00
5366	4991	100.00
43637	43469	100.00
43638	43470	100.00
43639	43471	100.00
43640	43472	100.00
43643	43474	100.00
43644	43475	100.00
43227	43464	100.00
43632	43465	100.00
31525	25948	100.00
31526	25949	100.00
31527	25950	100.00
43633	43466	100.00
43634	43467	100.00
31528	25951	100.00
31531	25953	100.00
31532	25954	100.00
31533	25955	100.00
31534	25956	100.00
31537	31816	100.00
31538	31817	100.00
31576	31844	100.00
31577	31845	100.00
31584	31849	100.00
43689	43510	100.00
31580	31847	100.00
31581	31848	100.00
48005	47798	100.00
48006	47799	100.00
48007	47800	100.00
48008	47802	100.00
48009	47803	100.00
48012	47804	100.00
22732	22345	100.00
22725	22339	100.00
22726	22340	100.00
22727	22341	100.00
22728	22343	100.00
22729	22344	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1819	1	Navantia	2B	t	f	f	\N	\N	\N	1111
1820	1	Barreras	3C	t	f	f	\N	\N	\N	1111
1818	4	Igalia	COMPANY_CODE	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	1114
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
5861
5863
7892
7904
7908
16672
16673
16699
16701
26970
26972
26973
26974
26989
27040
27041
27042
27043
27044
27045
27046
27047
27048
27049
43936
43941
43943
43944
43945
43946
45765
48283
50705
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
9408	8	7904	707
9412	7	7908	707
5962	17	5861	707
5964	14	5863	707
16773	6	16672	707
16774	6	16673	707
42532	2	43944	38380
27137	0	27040	707
27138	0	27041	707
27139	0	27042	707
27140	0	27043	707
27141	0	27044	707
27142	0	27045	707
9406	7	7892	707
27143	0	27046	707
27144	0	27047	707
27145	0	27048	707
27146	0	27049	707
42533	2	43945	38380
27074	8	26973	707
27075	8	26974	707
27073	8	26972	707
27090	3	26989	707
27071	8	26970	707
42525	1	43936	38380
42595	0	43944	707
42596	1	43945	707
42529	0	43941	38380
42597	1	43946	707
42531	0	43943	38380
27147	25	27042	38380
27148	25	27043	38380
27149	25	27044	38380
27150	25	27045	38380
27151	25	27046	38380
27152	25	27047	38380
27153	25	27048	38380
27154	25	27049	38380
27155	25	27040	38380
27156	25	27041	38380
27157	15	7892	38380
27158	14	5861	38380
27159	14	5863	38380
27160	14	7904	38380
27161	14	7908	38380
27162	14	16672	38380
27163	14	16673	38380
27166	6	26989	38380
27167	6	26970	38380
27168	6	26973	38380
42521	6	26974	38380
42522	6	26972	38380
45866	6	45765	707
16800	9	16699	707
27164	15	16699	38380
16802	7	16701	707
27165	15	16701	38380
48384	3	48283	707
50806	1	50705	707
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
525
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
26362	13	PREFIX-00007-00001-00001	WORKER	100	1.00	f	25897	\N
26363	13	PREFIX-00007-00002-00001	WORKER	200	1.00	f	25898	\N
26458	5	PREFIX-00008-00004-00001	WORKER	210	1.00	f	25948	\N
26459	5	PREFIX-00008-00005-00001	WORKER	70	0.46	f	25949	\N
26364	13	PREFIX-00007-00003-00001	MACHINE	100	1.00	f	25899	\N
26365	13	PREFIX-00007-00006-00001	WORKER	150	1.00	f	25901	\N
26366	13	PREFIX-00007-00007-00001	WORKER	200	1.00	f	25902	\N
26367	13	PREFIX-00007-00005-00001	WORKER	100	1.00	f	25903	\N
5272	28	PREFIX-00003-00004-00001	WORKER	210	1.00	f	4980	\N
5273	28	PREFIX-00003-00005-00001	WORKER	80	1.00	f	4981	\N
9106	14	PREFIX-00003-00005-00002	WORKER	70	0.46	f	4981	\N
5274	28	PREFIX-00003-00006-00001	WORKER	101	1.00	f	4982	\N
5275	28	PREFIX-00003-00007-00001	WORKER	200	1.00	f	4983	\N
9090	12	PREFIX-00005-00001-00001	WORKER	150	1.00	f	7577	\N
9095	12	PREFIX-00005-00003-00001	WORKER	200	1.00	f	7585	\N
9096	12	PREFIX-00005-00004-00001	WORKER	100	1.00	f	7586	\N
26414	1	d4dd6199-87e1-4100-84ce-2fafd72803d6	WORKER	210	1.00	f	\N	26614
26415	1	99b6ff06-2be1-4696-a642-549cd2a4670d	WORKER	70	0.46	f	\N	26615
26416	1	e49031a6-3ec1-4de4-b08a-1df4344e8043	WORKER	80	0.53	f	\N	26615
26417	1	397a6f1c-ce67-4e62-a0cd-1632d509c4c6	WORKER	101	1.00	f	\N	26616
26418	1	0a857d14-ebe2-4b2f-9cef-a7a6ba6a5308	WORKER	200	1.00	f	\N	26617
26419	1	eba58985-d591-4d98-bf04-4bbd76375616	WORKER	100	1.00	f	\N	26619
26420	1	eb0a9aa5-7584-4b1e-9eb0-71acf24ee6e0	WORKER	200	1.00	f	\N	26620
5276	28	PREFIX-00003-00008-00001	WORKER	100	1.00	f	4985	\N
5277	28	PREFIX-00003-00009-00001	WORKER	200	1.00	f	4986	\N
5278	28	PREFIX-00003-00010-00001	WORKER	200	1.00	f	4987	\N
5279	28	PREFIX-00003-00011-00001	WORKER	400	1.00	f	4988	\N
5280	28	PREFIX-00003-00012-00001	WORKER	150	1.00	f	4990	\N
5281	28	PREFIX-00003-00013-00001	WORKER	200	1.00	f	4991	\N
26421	1	93a5a9b6-a15e-44d4-95fb-a0fd5ada3c69	WORKER	200	1.00	f	\N	26621
26422	1	910643dd-deb4-41bb-b738-172989c7cb4b	WORKER	400	1.00	f	\N	26622
26423	1	2ee35234-87fd-4cb7-babf-122bf1e46781	WORKER	150	1.00	f	\N	26624
26424	1	119e0a40-4cf1-4508-968e-c7c13657ca8c	WORKER	200	1.00	f	\N	26625
25720	2	660c29b9-1753-4455-aea5-5ec31036c9ca	WORKER	100	1.00	f	\N	25436
25721	2	ea64a919-5168-4ac0-bee8-69b0f503b92d	WORKER	200	1.00	f	\N	25437
25722	2	1a68a0d8-0270-4b2f-b8e2-9328e57bd510	MACHINE	100	1.00	f	\N	25438
25723	2	4cb59afa-8cc7-4f79-8189-68f6a2b2b847	WORKER	150	1.00	f	\N	25440
25724	2	32760635-b673-4580-ab5d-59217b41ad7c	WORKER	200	1.00	f	\N	25441
25725	2	8deed49b-6563-40e5-be9c-10a078c847d0	WORKER	100	1.00	f	\N	25442
1927	17	PREFIX-00002-00003-00001	WORKER	100	1.00	f	1533	\N
1928	17	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1534	\N
1936	16	PREFIX-00002-00007-00001	WORKER	300	1.00	f	1543	\N
1929	17	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1536	\N
1930	17	PREFIX-00002-00006-00001	WORKER	100	1.00	f	1537	\N
43374	8	PREFIX-00010-00010-00001	WORKER	200	1.00	f	43471	\N
43375	8	PREFIX-00010-00011-00001	WORKER	400	1.00	f	43472	\N
43376	8	PREFIX-00010-00012-00001	WORKER	150	1.00	f	43474	\N
43377	8	PREFIX-00010-00013-00001	WORKER	200	1.00	f	43475	\N
43367	8	PREFIX-00010-00004-00001	WORKER	210	1.00	f	43464	\N
43368	8	PREFIX-00010-00005-00001	WORKER	70	0.46	f	43465	\N
43369	8	PREFIX-00010-00005-00002	WORKER	80	0.53	f	43465	\N
43370	8	PREFIX-00010-00006-00001	WORKER	101	1.00	f	43466	\N
43371	8	PREFIX-00010-00007-00001	WORKER	200	1.00	f	43467	\N
43396	3	PREFIX-00011-00001-00001	WORKER	100	1.00	f	43501	\N
43397	3	PREFIX-00011-00002-00001	WORKER	200	1.00	f	43502	\N
43398	3	PREFIX-00011-00003-00001	MACHINE	100	1.00	f	43503	\N
43399	3	PREFIX-00011-00006-00001	WORKER	150	1.00	f	43505	\N
26460	5	PREFIX-00008-00005-00002	WORKER	80	0.53	f	25949	\N
26461	5	PREFIX-00008-00006-00001	WORKER	101	1.00	f	25950	\N
31714	5	PREFIX-00008-00007-00001	WORKER	200	1.00	f	25951	\N
31715	5	PREFIX-00008-00008-00001	WORKER	100	1.00	f	25953	\N
31716	5	PREFIX-00008-00009-00001	WORKER	200	1.00	f	25954	\N
31717	5	PREFIX-00008-00010-00001	WORKER	200	1.00	f	25955	\N
31718	5	PREFIX-00008-00011-00001	WORKER	400	1.00	f	25956	\N
31719	5	PREFIX-00008-00012-00001	WORKER	150	1.00	f	31816	\N
31720	5	PREFIX-00008-00013-00001	WORKER	200	1.00	f	31817	\N
31736	1	fc19490d-ad1b-4b0a-8c38-83d60e511310	WORKER	100	1.00	f	\N	26652
31737	1	1ac2c837-f52e-45ac-9696-e6f2628792b9	WORKER	100	1.00	f	\N	26653
31738	1	86b4173d-0ef3-40e0-9eca-c7ac726f6828	WORKER	100	1.00	f	\N	26655
31739	1	6e396811-99a6-4aed-aad0-a304dcdc25ec	WORKER	100	1.00	f	\N	26656
31740	1	31bd0579-f473-418c-b793-828086d4a133	WORKER	300	1.00	f	\N	26657
43400	3	PREFIX-00011-00007-00001	WORKER	200	1.00	f	43506	\N
43401	3	PREFIX-00011-00005-00001	WORKER	100	1.00	f	43507	\N
43372	8	PREFIX-00010-00008-00001	WORKER	100	1.00	f	43469	\N
43373	8	PREFIX-00010-00009-00001	WORKER	200	1.00	f	43470	\N
31756	9	PREFIX-00009-00004-00001	WORKER	100	1.00	f	31844	\N
31757	9	PREFIX-00009-00005-00001	WORKER	100	1.00	f	31845	\N
31760	9	PREFIX-00009-00003-00001	WORKER	300	1.00	f	31849	\N
43404	3	PREFIX-00009-00008-00001	WORKER	300	1.00	f	43510	\N
31758	9	PREFIX-00009-00006-00001	WORKER	100	1.00	f	31847	\N
31759	9	PREFIX-00009-00007-00001	WORKER	100	1.00	f	31848	\N
47690	1	7a525937-e609-40ca-8b72-159f9bb0133c	WORKER	100	1.00	f	\N	47394
47691	1	db3958fb-3606-4e43-a351-f00dbde95b87	WORKER	200	1.00	f	\N	47395
47692	1	638d539e-d6ed-4087-9c1c-f8c45a4bea69	MACHINE	100	1.00	f	\N	47396
47693	1	fcade471-9410-47c9-b942-4639a80f8872	WORKER	150	1.00	f	\N	47398
47694	1	a356897d-2692-41fb-acf8-31e07c505dd5	WORKER	200	1.00	f	\N	47399
47695	1	47a17d32-03b8-4f39-81e3-fa2fce15d308	WORKER	100	1.00	f	\N	47400
22636	18	PREFIX-00006-00001-00001	WORKER	100	1.00	f	22339	\N
22637	18	PREFIX-00006-00002-00001	WORKER	200	1.00	f	22340	\N
22638	18	PREFIX-00006-00003-00001	MACHINE	100	1.00	f	22341	\N
22639	18	PREFIX-00006-00006-00001	WORKER	150	1.00	f	22343	\N
22640	18	PREFIX-00006-00007-00001	WORKER	200	1.00	f	22344	\N
22641	18	PREFIX-00006-00005-00001	WORKER	100	1.00	f	22345	\N
47714	2	PREFIX-00012-00001-00001	WORKER	100	1.00	f	47798	\N
47715	2	PREFIX-00012-00002-00001	WORKER	200	1.00	f	47799	\N
47716	2	PREFIX-00012-00003-00001	MACHINE	100	1.00	f	47800	\N
47717	2	PREFIX-00012-00006-00001	WORKER	150	1.00	f	47802	\N
47718	2	PREFIX-00012-00007-00001	WORKER	200	1.00	f	47803	\N
47719	2	PREFIX-00012-00005-00001	WORKER	100	1.00	f	47804	\N
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
101	8	0
101	8	1
101	8	2
101	8	3
101	8	4
101	0	5
101	0	6
52925	8	0
52925	8	1
52925	8	2
52925	8	3
52925	8	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
9196	7576
9197	7576
9195	7584
9194	7584
2023	1532
2022	1532
2029	1531
2028	1531
2027	1535
2026	1535
5358	4979
5357	4979
5364	4984
5363	4984
5367	4989
5368	4989
5370	4952
5369	4952
43636	43463
43635	43463
31530	25947
31529	25947
31535	25952
31536	25952
31542	25946
31541	25946
31540	31815
31539	31815
43641	43468
43642	43468
43646	43473
43645	43473
26114	25900
26113	25900
26117	25896
26116	25896
43648	43462
43647	43462
43684	43504
43685	43504
43687	43500
43688	43500
31579	31843
31578	31843
31582	31846
31583	31846
31585	31842
31586	31842
48010	47801
48011	47801
48013	47797
48014	47797
22730	22342
22731	22342
22733	22338
22734	22338
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
14849	23	ec89906f-369e-4ac3-b6fb-15c64a016bc4	Zona Cubierta	14746
14847	23	9c283fde-f94a-456e-a490-af07e9669a63	Zona Motor	14746
14848	22	86a9a95b-3609-47af-a9e1-5dad1ead1d9a	Zona Bodegas	14746
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
14746	1	62ab1b94-706b-49a8-8618-e4f279f683b3	Zonas	t
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
1414	3	1216
1415	2	1220
\.


--
-- Data for Name: limiting_resource_queue_dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_dependency (id, type, origin_queue_element_id, destiny_queue_element_id) FROM stdin;
4141	1	2327	2388
2525	1	2326	2327
2528	1	2388	2389
38178	1	37989	37990
38180	1	37991	37988
38179	1	37991	37992
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
7979	13	7878	1414	2010-07-09 12:59:30.412	2010-06-14 12:59:30.412	1276514604779	2010-06-30	4	2010-07-19	1
2388	9	2287	1415	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276427087598	2010-07-16	8	2010-08-04	4
2326	11	2225	1414	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276425557107	2010-06-13	0	2010-06-30	4
2327	12	2226	1415	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276425619376	2010-06-30	4	2010-07-16	8
37983	2	27057	1415	2010-07-15 00:00:00	2010-06-15 09:45:17.731	1276591908517	2010-08-04	4	2010-08-20	8
2389	9	2288	1414	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276427111444	2010-08-06	4	2010-08-24	8
37989	3	27063	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597077782	2010-09-08	4	2010-09-24	8
37990	3	27064	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597108509	2010-10-29	0	2010-11-16	8
37988	3	27062	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597131694	2010-11-16	8	2011-01-07	4
37991	3	27065	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597033207	2010-09-27	0	2010-10-13	8
37992	3	27066	1415	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597056978	2010-10-13	8	2010-11-01	4
37994	1	43946	1415	2010-07-01 00:00:00	2010-07-01 00:00:00	1276603010805	2010-08-20	8	2010-10-13	4
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
13837	Incidencias	100	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
1216	Torno 1	Torno para realizar eixes de ata 10 metros.
1220	Torno 2	Torno para realizar eixes de ata 30 m
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
909	1	37e9d60d-43c1-4a2e-93cc-01c505293d45	Imported materials without category	f	\N
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
1113	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f	\N
1114	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f	\N
1112	5	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	707
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
4980	14849
4981	14847
4982	14847
4983	14849
4985	14849
4987	14847
4990	14848
25948	14849
25949	14847
25950	14847
25951	14849
25953	14849
25955	14847
31816	14848
43464	14849
43465	14847
43466	14847
43467	14849
43469	14849
43471	14847
43474	14848
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
26614	14849
26615	14847
26616	14847
26617	14849
26619	14849
26621	14847
26624	14848
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
1531	Javier Moran	\N	t	7	0.00	0.00	700	ref 1	\N	0	1820	1
25946	\N	\N	t	13	30000.00	0.00	1911	\N	\N	0	\N	1
25896	\N	\N	t	7	0.00	0.00	850	\N	\N	0	\N	1
7576	\N	\N	t	4	20000.00	0.00	450	001	\N	5	1818	1
43500	\N	\N	t	7	0.00	0.00	850	\N	\N	0	\N	1
43462	\N	\N	t	13	0.00	0.00	1911	\N	\N	0	\N	1
31842	\N	\N	t	8	0.00	0.00	1000	\N	\N	0	\N	1
4952	Xavi	\N	t	13	0.00	0.00	1911	\N	\N	0	1818	1
47797	\N	\N	t	7	0.00	0.00	850	\N	\N	0	\N	1
22338	\N	\N	t	7	0.00	0.00	850	\N	\N	0	\N	1
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer) FROM stdin;
1543	16	tarefa limitantes 5	\N	PREFIX-00002-00007	\N	\N	0.40	f	1531	\N	\N	2
1536	17	tarefa limitantes 3	\N	PREFIX-00002-00005	\N	\N	0.00	f	1535	\N	\N	0
4980	29	Tarea 1.2	\N	PREFIX-00003-00004	\N	\N	0.20	f	4979	\N	\N	0
4981	29	Tarea 1.1	\N	PREFIX-00003-00005	\N	\N	0.00	f	4979	\N	\N	1
1537	17	tarefa limitantes 4	\N	PREFIX-00002-00006	\N	\N	0.00	f	1535	\N	\N	1
7584	13	Tarea 1.4	\N	PREFIX-00005-00002	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.21	f	7576	\N	PREFIX-00003-00007	0
7576	14	Desarrollo de un proyecto para el cliente.	\N	PREFIX-00005	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.21	f	\N	\N	\N	\N
25900	13	Tarefa 4	\N	PREFIX-00007-00004	\N	\N	0.00	f	25896	25439	\N	3
25901	13	Tarefa 4.2	\N	PREFIX-00007-00006	\N	\N	0.00	f	25900	25440	\N	0
25902	13	Tarefa 4.1	\N	PREFIX-00007-00007	\N	\N	0.00	f	25900	25441	\N	1
25903	13	Tarefa 5	\N	PREFIX-00007-00005	\N	\N	0.00	f	25896	25442	\N	4
25896	14	Pedido 3	\N	PREFIX-00007	2010-06-15 09:45:17.731	2010-09-22 00:00:00	0.05	f	\N	\N	\N	\N
4982	30	Tarea 1.3	\N	PREFIX-00003-00006	\N	\N	0.25	f	4979	\N	\N	2
4983	29	Tarea 1.4	\N	PREFIX-00003-00007	\N	\N	0.00	f	4979	\N	\N	3
4984	29	Tarea2	\N	PREFIX-00003-00002	\N	\N	0.00	f	4952	\N	\N	1
7577	13	Subtarefa 1.4.3	\N	PREFIX-00005-00001	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.25	f	7584	\N	\N	0
4985	29	Tarea 2.2 	\N	PREFIX-00003-00008	\N	\N	0.00	f	4984	\N	\N	0
4986	29	Tarea 2.1	\N	PREFIX-00003-00009	\N	\N	0.00	f	4984	\N	\N	1
7585	13	Subtarefa 1.4.1	\N	PREFIX-00005-00003	\N	\N	0.30	f	7584	\N	\N	1
7586	13	Subtarefa 1.4.2	\N	PREFIX-00005-00004	\N	\N	0.00	f	7584	\N	\N	2
4987	29	Tarea 2.3	\N	PREFIX-00003-00010	\N	\N	0.00	f	4984	\N	\N	2
4988	29	Tarea 2.4	\N	PREFIX-00003-00011	\N	\N	0.00	f	4984	\N	\N	3
4989	29	Tarea 3	\N	PREFIX-00003-00003	\N	\N	0.00	f	4952	\N	\N	2
4990	29	Tarea 3.2	\N	PREFIX-00003-00012	\N	\N	0.00	f	4989	\N	\N	0
4991	29	Tarea 3.1	\N	PREFIX-00003-00013	\N	\N	0.00	f	4989	\N	\N	1
4952	36	Pedido 1	\N	PREFIX-00003	2010-06-14 12:59:30.412	2010-09-23 00:00:00	0.03	f	\N	\N	\N	\N
4979	35	Tarea1	\N	PREFIX-00003-00001	\N	\N	0.10	f	4952	\N	\N	0
1535	17	container 2	\N	PREFIX-00002-00002	\N	\N	0.00	f	1531	\N	\N	1
1531	18	Pedido recursos limitantes	Pedido para proba con recursos limitantes	PREFIX-00002	2010-06-13 12:33:10.77	\N	0.24	f	\N	\N	\N	\N
1532	17	container 1	\N	PREFIX-00002-00001	\N	\N	0.25	f	1531	\N	\N	0
1533	17	tarefa limitantes 1	\N	PREFIX-00002-00003	\N	\N	0.50	f	1532	\N	\N	0
1534	17	tarefa limitantes 2	\N	PREFIX-00002-00004	\N	\N	0.00	f	1532	\N	\N	1
25897	13	Tarefa 1	\N	PREFIX-00007-00001	\N	\N	0.20	f	25896	25436	\N	0
25898	13	Tarefa 2	\N	PREFIX-00007-00002	\N	\N	0.00	f	25896	25437	\N	1
25899	13	Recursos lim Tarefa 3	\N	PREFIX-00007-00003	\N	\N	0.25	f	25896	25438	\N	2
25956	5	Tarea 2.4	\N	PREFIX-00008-00011	\N	\N	0.00	f	25952	26622	\N	3
31816	5	Tarea 3.2	\N	PREFIX-00008-00012	\N	\N	0.00	f	31815	26624	\N	0
31817	5	Tarea 3.1	\N	PREFIX-00008-00013	\N	\N	0.00	f	31815	26625	\N	1
31844	9	tarefa limitantes 1	\N	PREFIX-00009-00004	\N	\N	0.00	f	31843	26652	\N	0
31845	9	tarefa limitantes 2	\N	PREFIX-00009-00005	\N	\N	0.00	f	31843	26653	\N	1
31849	9	tarefa limitantes 5	\N	PREFIX-00009-00003	\N	\N	0.00	f	31842	26657	\N	2
43470	8	Tarea 2.1	\N	PREFIX-00010-00009	\N	\N	0.00	f	43468	26620	\N	1
43507	3	Tarefa 5	\N	PREFIX-00011-00005	\N	\N	0.00	f	43500	25442	\N	4
43500	3	Pedido 2 Escenarios	\N	PREFIX-00011	2010-06-15 13:49:04.771	2010-09-22 00:00:00	0.00	f	\N	\N	\N	\N
43501	3	Tarefa 1	\N	PREFIX-00011-00001	\N	\N	0.00	f	43500	25436	\N	0
43502	3	Tarefa 2	\N	PREFIX-00011-00002	\N	\N	0.00	f	43500	25437	\N	1
43503	3	Tarefa 3	\N	PREFIX-00011-00003	\N	\N	0.00	f	43500	25438	\N	2
43504	3	Tarefa 4	\N	PREFIX-00011-00004	\N	\N	0.00	f	43500	25439	\N	3
43505	3	Tarefa 4.2	\N	PREFIX-00011-00006	\N	\N	0.00	f	43504	25440	\N	0
43471	8	Tarea 2.3	\N	PREFIX-00010-00010	\N	\N	0.00	f	43468	26621	\N	2
43472	8	Tarea 2.4	\N	PREFIX-00010-00011	\N	\N	0.00	f	43468	26622	\N	3
43473	8	Tarea 3	\N	PREFIX-00010-00003	\N	\N	0.00	f	43462	26623	\N	2
43474	8	Tarea 3.2	\N	PREFIX-00010-00012	\N	\N	0.00	f	43473	26624	\N	0
31815	5	Tarea 3	\N	PREFIX-00008-00003	\N	\N	0.00	f	25946	26623	\N	2
25946	5	Pedido 5	\N	PREFIX-00008	2010-09-08 00:00:00	2010-12-31 00:00:00	0.00	f	\N	\N	\N	\N
25947	5	Tarea1	\N	PREFIX-00008-00001	\N	\N	0.00	f	25946	26613	\N	0
25948	5	Tarea 1.2	\N	PREFIX-00008-00004	\N	\N	0.00	f	25947	26614	\N	0
25949	5	Tarea 1.1	\N	PREFIX-00008-00005	\N	\N	0.00	f	25947	26615	\N	1
25950	5	Tarea 1.3	\N	PREFIX-00008-00006	\N	\N	0.00	f	25947	26616	\N	2
25951	5	Tarea 1.4	\N	PREFIX-00008-00007	\N	\N	0.00	f	25947	26617	\N	3
25952	5	Tarea2	\N	PREFIX-00008-00002	\N	\N	0.00	f	25946	26618	\N	1
25953	5	Tarea 2.2 	\N	PREFIX-00008-00008	\N	\N	0.00	f	25952	26619	\N	0
25954	5	Tarea 2.1	\N	PREFIX-00008-00009	\N	\N	0.00	f	25952	26620	\N	1
25955	5	Tarea 2.3	\N	PREFIX-00008-00010	\N	\N	0.00	f	25952	26621	\N	2
43506	3	Tarefa 4.1	\N	PREFIX-00011-00007	\N	\N	0.00	f	43504	25441	\N	1
43475	8	Tarea 3.1	\N	PREFIX-00010-00013	\N	\N	0.00	f	43473	26625	\N	1
43464	8	Tarea 1.2	\N	PREFIX-00010-00004	\N	\N	0.00	f	43463	26614	\N	0
43465	8	Tarea 1.1	\N	PREFIX-00010-00005	\N	\N	0.00	f	43463	26615	\N	1
43466	8	Tarea 1.3	\N	PREFIX-00010-00006	\N	\N	0.00	f	43463	26616	\N	2
43467	8	Tarea 1.4	\N	PREFIX-00010-00007	\N	\N	0.00	f	43463	26617	\N	3
43510	3	Recurso limitante xenérica	\N	PREFIX-00009-00008	\N	\N	0.00	f	31842	\N	\N	3
31847	9	tarefa limitantes 3	\N	PREFIX-00009-00006	\N	\N	0.00	f	31846	26655	\N	0
31848	9	tarefa limitantes 4	\N	PREFIX-00009-00007	\N	\N	0.00	f	31846	26656	\N	1
31846	9	container 2	\N	PREFIX-00009-00002	\N	\N	0.00	f	31842	26654	\N	1
31842	10	Pedido recursos limitantes 2	Pedido para proba con recursos limitantes	PREFIX-00009	2010-07-01 00:00:00	2010-09-01 00:00:00	0.00	f	\N	\N	\N	\N
43463	8	Tarea1	\N	PREFIX-00010-00001	\N	\N	0.00	f	43462	26613	\N	0
43462	8	Pedido Escenario 2	\N	PREFIX-00010	2010-06-15 13:42:02.981	2010-09-23 00:00:00	0.00	f	\N	\N	\N	\N
43468	8	Tarea2	\N	PREFIX-00010-00002	\N	\N	0.00	f	43462	26618	\N	1
43469	8	Tarea 2.2 	\N	PREFIX-00010-00008	\N	\N	0.00	f	43468	26619	\N	0
31843	9	container 1	\N	PREFIX-00009-00001	\N	\N	0.00	f	31842	26651	\N	0
47799	2	Tarefa 2	\N	PREFIX-00012-00002	\N	\N	0.00	f	47797	47395	\N	1
47800	2	Tarefa 3	\N	PREFIX-00012-00003	\N	\N	0.00	f	47797	47396	\N	2
47801	2	Tarefa 4	\N	PREFIX-00012-00004	\N	\N	0.00	f	47797	47397	\N	3
47802	2	Tarefa 4.2	\N	PREFIX-00012-00006	\N	\N	0.00	f	47801	47398	\N	0
47803	2	Tarefa 4.1	\N	PREFIX-00012-00007	\N	\N	0.00	f	47801	47399	\N	1
47804	2	Tarefa 5	\N	PREFIX-00012-00005	\N	\N	0.00	f	47797	47400	\N	4
22345	19	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0.00	f	22338	\N	\N	4
22338	19	Pedido 2	\N	PREFIX-00006	2010-06-14 18:10:13.82	2010-09-22 00:00:00	0.19	t	\N	\N	\N	\N
22339	19	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0.00	f	22338	\N	\N	0
22340	19	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0.00	f	22338	\N	\N	1
22341	19	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0.15	f	22338	\N	\N	2
22342	19	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	0.44	t	22338	\N	\N	3
22343	19	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0.10	f	22342	\N	\N	0
22344	19	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0.70	f	22342	\N	\N	1
47797	2	Aplicacion pedido 2 template	\N	PREFIX-00012	2010-06-16 15:17:27.811	2010-09-23 00:00:00	0.00	f	\N	\N	\N	\N
47798	2	Tarefa 1	\N	PREFIX-00012-00001	\N	\N	0.00	f	47797	47394	\N	0
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
26650	1	Pedido recursos limitantes	Pedido para proba con recursos limitantes	PREFIX-00002	0	\N	3	\N	\N
26651	1	container 1	\N	PREFIX-00002-00001	\N	\N	3	26650	0
26612	1	Pedido 1 Template	\N	PREFIX-00003	0	100	3	\N	\N
26654	1	container 2	\N	PREFIX-00002-00002	\N	\N	3	26650	1
26657	1	tarefa limitantes 5	\N	PREFIX-00002-00007	\N	\N	0	26650	2
26652	1	tarefa limitantes 1	\N	PREFIX-00002-00003	\N	\N	0	26651	0
26653	1	tarefa limitantes 2	\N	PREFIX-00002-00004	\N	\N	0	26651	1
26655	1	tarefa limitantes 3	\N	PREFIX-00002-00005	\N	\N	0	26654	0
26656	1	tarefa limitantes 4	\N	PREFIX-00002-00006	\N	\N	0	26654	1
26613	1	Tarea1	\N	PREFIX-00003-00001	\N	\N	3	26612	0
26618	1	Tarea2	\N	PREFIX-00003-00002	\N	\N	3	26612	1
26623	1	Tarea 3	\N	PREFIX-00003-00003	\N	\N	3	26612	2
26614	1	Tarea 1.2	\N	PREFIX-00003-00004	\N	\N	0	26613	0
26615	1	Tarea 1.1	\N	PREFIX-00003-00005	\N	\N	0	26613	1
26616	1	Tarea 1.3	\N	PREFIX-00003-00006	\N	\N	0	26613	2
26617	1	Tarea 1.4	\N	PREFIX-00003-00007	\N	\N	0	26613	3
26619	1	Tarea 2.2 	\N	PREFIX-00003-00008	\N	\N	0	26618	0
26620	1	Tarea 2.1	\N	PREFIX-00003-00009	\N	\N	0	26618	1
26621	1	Tarea 2.3	\N	PREFIX-00003-00010	\N	\N	0	26618	2
26622	1	Tarea 2.4	\N	PREFIX-00003-00011	\N	\N	0	26618	3
26624	1	Tarea 3.2	\N	PREFIX-00003-00012	\N	\N	0	26623	0
26625	1	Tarea 3.1	\N	PREFIX-00003-00013	\N	\N	0	26623	1
25435	2	Pedido 2 Template	\N	PREFIX-00006	0	99	3	\N	\N
25436	2	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0	25435	0
25437	2	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0	25435	1
25438	2	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0	25435	2
25439	2	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	3	25435	3
25440	2	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0	25439	0
25441	2	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0	25439	1
25442	2	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0	25435	4
47393	1	Pedido 2 - Template	\N	PREFIX-00006	0	99	3	\N	\N
47394	1	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0	47393	0
47395	1	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0	47393	1
47396	1	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0	47393	2
47397	1	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	3	47393	3
47400	1	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0	47393	4
47398	1	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0	47397	0
47399	1	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0	47397	1
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
25897	1
25898	1
25899	1
25901	1
25902	1
25903	1
43507	1
1533	1
1534	1
1543	1
1536	1
7577	1
7585	1
7586	1
43501	1
43502	1
43503	1
43505	1
43506	1
1537	1
4980	1
4981	2
4982	1
4983	1
4985	1
4986	1
4987	1
4988	1
4990	1
4991	1
25948	1
25949	2
25950	1
25951	1
25953	1
25954	1
25955	1
25956	1
31816	1
43469	1
31817	1
43470	1
43471	1
43472	1
43474	1
43475	1
43464	1
43465	2
43466	1
43467	1
31844	1
31845	1
31849	1
43510	1
31847	1
31848	1
47798	1
47799	1
47800	1
47802	1
47803	1
47804	1
22345	1
22339	1
22340	1
22341	1
22343	1
22344	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1531
1532
1535
4952
4979
4984
4989
7576
7584
22338
22342
25896
25900
25946
25947
25952
31815
31842
31843
31846
43462
43463
43468
43473
43500
43504
47797
47801
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
25435
25439
26612
26613
26618
26623
26650
26651
26654
47393
47397
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
26614	0
26615	0
26616	0
26617	0
26619	0
26620	0
26621	0
26622	0
26624	0
26625	0
25436	0
25437	0
25438	0
25440	0
25441	0
25442	0
26652	0
26653	0
26655	0
26656	0
26657	0
47394	0
47395	0
47396	0
47398	0
47399	0
47400	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	14	PREFIX	12	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
26612	1
25435	1
26650	1
47393	1
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
26168	8	2010-06-15 13:37:43.311	707
7778	17	2010-06-15 13:37:44.027	707
1721	23	2010-06-15 13:37:48.045	707
5154	40	2010-06-15 13:37:47.955	707
26164	16	2010-06-15 13:37:54.148	707
26184	3	2010-06-15 13:50:02.701	38380
26185	2	2010-06-15 13:52:46.367	707
26180	9	2010-06-15 13:48:50.068	38380
26172	14	2010-06-15 13:56:54.284	707
48079	2	2010-06-16 15:17:46.642	707
22526	25	2010-06-16 18:58:27.264	707
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
4356	3	2211b5bd-80f0-4f60-a5da-bc8f1de8b94e	t	f	4449
1214	3	5aef0e25-573b-442e-b321-ce6c3be6608b	t	f	2
1216	6	bb5d29ab-e802-4d90-841a-2cc87d937a6d	t	t	3
4352	20	94cf72ff-85f9-4eb0-bb30-2f0518688201	t	f	4447
4354	21	3767394d-4be9-4a09-b7cf-42da82a53b24	t	f	4448
4348	15	62f19cfb-2859-4bbb-91d6-b178cb48eb2f	t	f	4445
4358	15	62dee224-2641-4c34-bbc6-153f98cdf250	t	f	4450
1220	6	d692db0b-e344-467d-8cd5-c746c94ae8f4	t	t	5
4350	15	98a4b590-e399-43f0-a46f-f11358cb6445	t	f	4446
4344	16	e3974c04-4785-407d-bea4-0aa4530f8a02	t	f	4444
21817	8	0b1cfd52-d327-4d01-9bf9-e64626a5ec2d	t	f	21917
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
43946	1	1.00	300	300	26528	\N
2225	12	1.00	100	100	2121	\N
2226	13	1.00	100	100	2122	\N
2287	10	1.00	100	100	2124	\N
2288	10	1.00	100	100	2125	\N
26993	1	1.00	\N	300	2129	\N
26989	4	0.96	\N	100	26462	\N
26970	9	1.00	\N	200	26463	\N
27057	3	1.00	100	100	26464	\N
26973	9	1.00	\N	150	26465	\N
26974	9	1.00	\N	200	26466	\N
26972	9	1.00	\N	100	26468	\N
43936	1	1.00	\N	210	26492	\N
43941	0	1.00	\N	150	26493	\N
43943	0	1.00	\N	100	26506	\N
27042	1	1.00	\N	210	26470	\N
27043	1	1.00	\N	150	26471	\N
27044	1	1.00	\N	101	26472	\N
27045	1	1.00	\N	200	26473	\N
27046	1	1.00	\N	100	26475	\N
27047	1	1.00	\N	200	26476	\N
27048	1	1.00	\N	200	26477	\N
27049	1	1.00	\N	400	26478	\N
27040	1	1.00	\N	150	26480	\N
27041	1	1.00	\N	200	26481	\N
7894	3	0.99	\N	150	9292	\N
7901	1	1.00	\N	200	9293	\N
7892	8	0.96	\N	49	9294	\N
7902	1	1.00	\N	51	9294	\N
5863	15	0.99	\N	150	5455	\N
7878	14	1.00	101	101	5456	\N
7904	9	1.00	\N	100	5459	\N
7908	8	1.00	\N	200	5460	\N
16672	7	1.00	\N	150	5464	\N
16673	7	1.00	\N	200	5465	\N
5861	19	1.15	\N	310	5454	\N
43944	2	1.00	\N	210	26514	\N
43945	2	1.00	\N	150	26515	\N
27063	4	1.00	100	100	26487	\N
27064	4	1.00	100	100	26488	\N
27062	4	1.00	300	300	26490	\N
27065	4	1.00	100	100	26484	\N
27066	4	1.00	100	100	26485	\N
45765	6	1.54	\N	117	22828	\N
16699	10	1.00	\N	100	22826	\N
16701	8	1.00	\N	200	22827	\N
48283	3	2.08	\N	222	22829	\N
50705	1	0.42	\N	400	22830	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
2	1
3	1
5	1
4444	1
4445	1
4446	1
4447	1
4448	1
4449	1
4450	1
21917	1
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
707	0	master	\N	\N	\N
38380	0	Escenario 2	Escenario de proba.	\N	707
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
1531	1721	707
4952	5154	707
7576	7778	707
22338	22526	707
25896	26164	707
25946	26168	707
31842	26172	707
25946	26168	38380
7576	7778	38380
1531	1721	38380
4952	5154	38380
31842	26172	38380
22338	22526	38380
25896	26164	38380
43462	26180	38380
43500	26184	38380
43462	26185	707
47797	48079	707
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
1531	1632	1721
1532	1633	1721
1533	1634	1721
1534	1635	1721
1535	1636	1721
1536	1637	1721
1537	1638	1721
1543	1644	1721
4952	5053	5154
4979	5080	5154
4980	5081	5154
4981	5082	5154
4982	5083	5154
4983	5084	5154
4984	5085	5154
4985	5086	5154
4986	5087	5154
4987	5088	5154
4988	5089	5154
4989	5090	5154
4990	5091	5154
4991	5092	5154
7576	7677	7778
7577	7678	7778
7584	7685	7778
7585	7686	7778
7586	7687	7778
22338	22439	22526
22339	22440	22526
22340	22441	22526
22341	22442	22526
22342	22443	22526
22343	22444	22526
22344	22445	22526
22345	22446	22526
25896	25997	26164
25897	25998	26164
25898	25999	26164
25899	26000	26164
25900	26001	26164
25901	26002	26164
25902	26003	26164
25903	26004	26164
25946	26047	26168
25947	26048	26168
25948	26049	26168
25949	26050	26168
25950	26051	26168
25951	26052	26168
25952	26053	26168
25953	26054	26168
25954	26055	26168
25955	26056	26168
25956	26057	26168
31815	31916	26168
31816	31917	26168
31817	31918	26168
31842	31943	26172
31843	31944	26172
31844	31945	26172
31845	31946	26172
31846	31947	26172
31847	31948	26172
31848	31949	26172
31849	31950	26172
43462	43563	26180
43463	43564	26180
43464	43565	26180
43465	43566	26180
43466	43567	26180
43467	43568	26180
43468	43569	26180
43469	43570	26180
43470	43571	26180
43471	43572	26180
43472	43573	26180
43473	43574	26180
43474	43575	26180
43475	43576	26180
43500	43601	26184
43501	43602	26184
43502	43603	26184
43503	43604	26184
43504	43605	26184
43505	43606	26184
43506	43607	26184
43507	43608	26184
43462	43609	26185
43463	43610	26185
43464	43611	26185
43465	43612	26185
43466	43613	26185
43467	43614	26185
43468	43615	26185
43469	43616	26185
43470	43617	26185
43471	43618	26185
43472	43619	26185
43473	43620	26185
43474	43621	26185
43475	43622	26185
43510	43625	26172
47797	47898	48079
47798	47899	48079
47799	47900	48079
47800	47901	48079
47801	47902	48079
47802	47903	48079
47803	47904	48079
47804	47905	48079
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
26054	5	0	25953
26055	5	0	25954
26056	5	0	25955
26057	5	0	25956
31916	5	3	31815
31917	5	0	31816
31918	5	0	31817
31946	9	0	31845
31950	9	0	31849
25997	13	3	25896
25998	13	0	25897
25999	13	0	25898
26000	13	0	25899
26001	13	3	25900
26002	13	0	25901
26003	13	0	25902
26004	13	0	25903
7677	13	3	7576
7685	13	3	7584
7678	13	0	7577
7686	13	0	7585
7687	13	0	7586
43625	3	0	43510
31943	9	3	31842
31944	9	3	31843
31945	9	0	31844
31947	9	3	31846
31948	9	0	31847
31949	9	0	31848
5053	30	3	4952
5080	29	3	4979
5081	29	0	4980
5082	29	0	4981
5083	29	0	4982
5084	29	0	4983
5085	29	3	4984
5086	29	0	4985
5087	29	0	4986
5088	29	0	4987
5089	29	0	4988
5090	29	3	4989
5091	29	0	4990
5092	29	0	4991
1632	19	3	1531
1633	17	3	1532
1634	17	0	1533
1635	17	0	1534
26047	5	3	25946
26048	5	3	25947
26049	5	0	25948
26050	5	0	25949
26051	5	0	25950
26052	5	0	25951
26053	5	3	25952
1644	18	0	1543
1636	17	3	1535
1637	17	0	1536
1638	17	0	1537
43601	3	3	43500
43602	3	0	43501
43609	2	3	43462
43563	7	3	43462
43603	3	0	43502
43604	3	0	43503
43605	3	3	43504
43606	3	0	43505
43607	3	0	43506
43608	3	0	43507
43615	2	3	43468
43569	7	3	43468
43616	2	0	43469
43570	7	0	43469
43617	2	0	43470
43571	7	0	43470
43618	2	0	43471
43572	7	0	43471
43619	2	0	43472
43573	7	0	43472
43620	2	3	43473
43574	7	3	43473
43621	2	0	43474
43575	7	0	43474
43622	2	0	43475
43576	7	0	43475
43610	2	3	43463
43564	7	3	43463
43611	2	0	43464
43565	7	0	43464
43612	2	0	43465
43566	7	0	43465
43613	2	0	43466
43567	7	0	43466
43614	2	0	43467
43568	7	0	43467
22443	19	3	22342
22444	19	0	22343
22445	19	0	22344
47898	2	3	47797
47899	2	0	47798
47900	2	0	47799
47901	2	0	47800
22446	19	0	22345
22439	19	3	22338
22440	19	0	22339
22441	19	0	22340
22442	19	0	22341
47902	2	3	47801
47903	2	0	47802
47904	2	0	47803
47905	2	0	47804
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
7901	4344
7902	4348
7894	4350
7878	1216
26993	4352
2287	1220
2225	1216
2226	1220
27057	1220
2288	1216
27063	1216
27064	1216
27062	1216
27065	1216
27066	1220
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
31221	3	27063	707
31225	2	27064	707
31224	2	27062	707
31223	3	27065	707
31222	3	27066	707
8082	2	7894	707
8089	0	7901	707
8090	0	7902	707
8080	13	7878	707
2731	8	2287	707
2729	9	2225	707
2730	10	2226	707
31212	0	26993	707
31213	1	27057	707
2732	9	2288	707
31231	15	27063	38380
31232	15	27064	38380
31233	15	27062	38380
31229	15	27065	38380
31230	15	27066	38380
31226	15	7894	38380
31227	15	7901	38380
31228	15	7902	38380
31234	14	7878	38380
31235	8	2225	38380
31236	8	2226	38380
31237	8	2287	38380
31238	8	2288	38380
31239	8	26993	38380
31240	6	27057	38380
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
2916353	20	1818	2010-06-14 15:38:54.504	2010-06-14 15:45:03.801	Desarrollo de un proyecto para el cliente.	20000.00	001	t	t	t	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
26462	1	1	2010-06-27 00:00:00	\N	\N
26463	1	1	2010-07-07 00:00:00	\N	\N
26465	1	0	\N	\N	\N
26466	1	0	\N	\N	\N
26468	1	0	\N	\N	\N
26464	1	1	2010-08-04 00:00:00	\N	5
9292	1	1	2010-06-14 00:00:00	\N	\N
9293	1	1	2010-06-14 00:00:00	\N	\N
9294	1	1	2010-06-14 00:00:00	\N	\N
26512	1	0	\N	\N	\N
26508	1	0	\N	\N	\N
26509	1	0	\N	\N	\N
26510	1	0	\N	\N	\N
26506	1	0	\N	\N	\N
26507	1	0	\N	\N	\N
2124	1	1	2010-07-16 00:00:00	\N	5
2121	1	1	2010-06-13 00:00:00	\N	5
2122	1	1	2010-06-30 00:00:00	\N	5
2129	1	0	\N	\N	\N
5454	1	0	\N	\N	\N
5455	1	0	\N	\N	\N
5456	1	1	2010-06-30 00:00:00	\N	5
5457	1	2	2010-06-14 12:59:30.412	2916353	\N
5459	1	0	\N	\N	\N
5460	1	0	\N	\N	\N
5461	1	0	\N	\N	\N
5462	1	0	\N	\N	\N
5464	1	1	2010-07-02 12:48:00	\N	\N
5465	1	0	\N	\N	\N
26514	1	1	2010-08-25 00:00:00	\N	\N
26515	1	0	\N	\N	5
26516	1	1	2010-09-05 14:08:17.391	\N	\N
26517	1	0	\N	\N	\N
26524	1	0	\N	\N	\N
2125	1	1	2010-08-06 00:00:00	\N	5
26480	1	0	\N	\N	\N
26481	1	0	\N	\N	\N
26470	1	0	\N	\N	\N
26471	1	0	\N	\N	\N
26472	1	0	\N	\N	\N
26473	1	0	\N	\N	\N
26475	1	0	\N	\N	\N
26476	1	0	\N	\N	\N
26477	1	0	\N	\N	\N
26478	1	0	\N	\N	\N
26525	1	1	2010-09-04 18:14:23.937	\N	\N
26519	1	0	\N	\N	\N
26520	1	0	\N	\N	\N
26521	1	0	\N	\N	\N
26522	1	1	2010-08-29 03:03:16.305	\N	\N
26487	1	1	2010-09-08 00:00:00	\N	5
26488	1	1	2010-10-29 00:00:00	\N	5
26490	1	1	2010-11-16 00:00:00	\N	5
26484	1	1	2010-09-27 00:00:00	\N	5
26485	1	1	2010-10-13 00:00:00	\N	5
26528	1	1	2010-08-20 00:00:00	\N	5
26492	1	0	\N	\N	\N
26493	1	0	\N	\N	5
26494	1	0	\N	\N	\N
26495	1	0	\N	\N	\N
26497	1	0	\N	\N	\N
26498	1	0	\N	\N	\N
26499	1	0	\N	\N	\N
26500	1	0	\N	\N	\N
26502	1	0	\N	\N	\N
26503	1	0	\N	\N	\N
48177	1	0	\N	\N	\N
48178	1	0	\N	\N	\N
48179	1	0	\N	\N	\N
48180	1	0	\N	\N	\N
48181	1	0	\N	\N	\N
48183	1	0	\N	\N	\N
22832	1	0	\N	\N	\N
22828	1	0	\N	\N	\N
22826	1	0	\N	\N	\N
22827	1	0	\N	\N	\N
22829	1	0	\N	\N	\N
22830	1	0	\N	\N	\N
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
2121	1927
2122	1928
2124	1929
2125	1930
2129	1936
26462	26362
26463	26363
26464	26364
26465	26365
26466	26366
26468	26367
9292	9090
9293	9095
9294	9096
22826	22636
22827	22637
22828	22638
22829	22639
22830	22640
22832	22641
5454	5272
5455	5273
5455	9106
5456	5274
5457	5275
5459	5276
5460	5277
5461	5278
5462	5279
26492	43367
26493	43369
26493	43368
5464	5280
5465	5281
26494	43370
26495	43371
26497	43372
26498	43373
26499	43374
26500	43375
26502	43376
26503	43377
26506	43396
26507	43397
26508	43398
26470	26458
26471	26460
26471	26459
26472	26461
26473	31714
26475	31715
26476	31716
26477	31717
26478	31718
26480	31719
26481	31720
26509	43399
26510	43400
26512	43401
26514	43367
26515	43369
26515	43368
26516	43370
26517	43371
26519	43372
26520	43373
26521	43374
26522	43375
26524	43376
26525	43377
26484	31756
26485	31757
26487	31758
26488	31759
26490	31760
26528	43404
48177	47714
48178	47715
48179	47716
48180	47717
48181	47718
48183	47719
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent) FROM stdin;
2127	20	Pedido recursos limitantes	\N	2010-06-13 12:33:10.77	2010-08-20 00:00:00	\N	0.24	\N	\N	\N
26471	4	Tarea 1.1	\N	2010-09-08 00:00:00	2010-10-05 00:00:00	\N	0.00	26474	\N	1
26472	4	Tarea 1.3	\N	2010-09-08 00:00:00	2010-09-25 00:00:00	\N	0.00	26474	\N	2
26473	4	Tarea 1.4	\N	2010-10-05 00:00:00	2010-11-09 00:00:00	\N	0.00	26474	\N	3
26475	4	Tarea 2.2 	\N	2010-10-15 00:00:00	2010-11-03 00:00:00	\N	0.00	26479	\N	0
26476	4	Tarea 2.1	\N	2010-09-25 00:00:00	2010-10-30 00:00:00	\N	0.00	26479	\N	1
2125	19	tarefa limitantes 4	\N	2010-08-06 00:00:00	2010-08-24 00:00:00	\N	0.00	2126	\N	1
26483	5	Pedido 5	\N	2010-09-08 00:00:00	2011-01-18 00:00:00	2010-12-31	0.00	\N	\N	\N
5458	34	Tarea1	\N	2010-06-14 12:59:30.412	2010-08-05 12:59:30.412	\N	0.10	5467	\N	0
5454	27	Tarea 1.2	\N	2010-06-14 12:59:30.412	2010-08-05 12:59:30.412	\N	0.20	5458	\N	0
5467	34	Pedido 1	\N	2010-06-14 12:59:30.412	2010-09-02 12:48:00	2010-09-23	0.03	\N	\N	\N
5466	34	Tarea 3	\N	2010-07-02 12:48:00	2010-09-02 12:48:00	\N	0.00	5467	\N	2
5465	27	Tarea 3.1	\N	2010-07-29 12:48:00	2010-09-02 12:48:00	\N	0.00	5466	\N	1
9295	11	Tarea 1.4	\N	2010-06-14 12:59:30.412	2010-07-17 12:59:30.412	2010-07-09	0.21	9296	\N	0
9292	10	Subtarefa 1.4.3	\N	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	2010-07-09	0.25	9295	\N	0
9293	10	Subtarefa 1.4.1	\N	2010-06-14 12:59:30.412	2010-07-17 12:59:30.412	\N	0.30	9295	\N	1
9294	10	Subtarefa 1.4.2	\N	2010-06-14 12:59:30.412	2010-06-23 12:59:30.412	\N	0.00	9295	\N	2
26462	12	Tarefa 1	\N	2010-06-27 00:00:00	2010-07-15 00:00:00	\N	0.20	26469	\N	0
5455	27	Tarea 1.1	\N	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	\N	0.00	5458	\N	1
5456	28	Tarea 1.3	\N	2010-06-30 00:00:00	2010-07-19 00:00:00	\N	0.25	5458	\N	2
5457	26	Tarea 1.4	\N	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	\N	0.00	5458	\N	3
26465	13	Tarefa 4.2	\N	2010-08-20 00:00:00	2010-09-16 00:00:00	\N	0.00	26467	\N	0
2126	20	container 2	\N	2010-07-16 00:00:00	2010-08-20 00:00:00	\N	0.00	2127	\N	1
2124	18	tarefa limitantes 3	\N	2010-07-16 00:00:00	2010-08-04 00:00:00	\N	0.00	2126	\N	0
9296	11	Desarrollo de un proyecto para el cliente.	\N	2010-06-14 12:59:30.412	2010-07-17 12:59:30.412	2010-07-09	0.21	\N	\N	\N
5459	26	Tarea 2.2 	\N	2010-07-09 12:59:30.412	2010-07-28 12:59:30.412	\N	0.00	5463	\N	0
5460	26	Tarea 2.1	\N	2010-07-28 12:59:30.412	2010-09-01 12:59:30.412	\N	0.00	5463	\N	1
2123	20	container 1	\N	2010-06-13 12:33:10.77	2010-07-16 00:00:00	\N	0.25	2127	\N	0
5463	33	Tarea2	\N	2010-07-09 12:59:30.412	2010-09-01 12:59:30.412	\N	0.00	5467	\N	1
5461	26	Tarea 2.3	\N	2010-07-09 12:59:30.412	2010-08-03 12:59:30.412	\N	0.00	5463	\N	2
2121	17	tarefa limitantes 1	\N	2010-06-13 00:00:00	2010-06-30 00:00:00	2010-07-01	0.50	2123	\N	0
5462	26	Tarea 2.4	\N	2010-07-09 12:59:30.412	2010-08-28 12:59:30.412	\N	0.00	5463	\N	3
2122	18	tarefa limitantes 2	\N	2010-06-30 00:00:00	2010-07-16 00:00:00	\N	0.00	2123	\N	1
2129	13	tarefa limitantes 5	\N	2010-06-13 12:33:10.77	2010-08-05 12:33:10.77	\N	0.40	2127	\N	2
5464	26	Tarea 3.2	\N	2010-07-02 12:48:00	2010-07-29 12:48:00	\N	0.00	5466	\N	0
26469	15	Pedido 3	\N	2010-06-27 00:00:00	2010-10-13 00:00:00	2010-09-22	0.05	\N	\N	\N
26467	16	Tarefa 4	\N	2010-08-20 00:00:00	2010-09-24 00:00:00	\N	0.00	26469	\N	3
26466	13	Tarefa 4.1	\N	2010-08-20 00:00:00	2010-09-24 00:00:00	\N	0.00	26467	\N	1
26468	14	Tarefa 5	\N	2010-09-24 00:00:00	2010-10-13 00:00:00	\N	0.00	26469	\N	4
26463	12	Tarefa 2	\N	2010-07-15 00:00:00	2010-08-19 00:00:00	\N	0.00	26469	\N	1
26464	14	Recursos lim Tarefa 3	\N	2010-08-04 00:00:00	2010-08-20 00:00:00	\N	0.25	26469	\N	2
26470	4	Tarea 1.2	\N	2010-09-08 00:00:00	2010-10-15 00:00:00	\N	0.00	26474	\N	0
26486	11	container 1	\N	2010-09-27 00:00:00	2010-11-01 00:00:00	\N	0.00	26491	\N	0
26482	5	Tarea 3	\N	2010-10-13 00:00:00	2010-12-14 00:00:00	\N	0.00	26483	\N	2
26480	4	Tarea 3.2	\N	2010-10-13 00:00:00	2010-11-09 00:00:00	\N	0.00	26482	\N	0
26481	4	Tarea 3.1	\N	2010-11-09 00:00:00	2010-12-14 00:00:00	\N	0.00	26482	\N	1
26474	5	Tarea1	\N	2010-09-08 00:00:00	2010-11-09 00:00:00	\N	0.00	26483	\N	0
26479	5	Tarea2	\N	2010-09-08 00:00:00	2011-01-18 00:00:00	\N	0.00	26483	\N	1
26477	4	Tarea 2.3	\N	2010-09-08 00:00:00	2010-10-13 00:00:00	\N	0.00	26479	\N	2
26478	4	Tarea 2.4	\N	2010-11-09 00:00:00	2011-01-18 00:00:00	\N	0.00	26479	\N	3
26518	2	Tarea1	\N	2010-08-25 00:00:00	2010-10-28 00:00:00	\N	0.00	26527	\N	0
26514	2	Tarea 1.2	\N	2010-08-25 00:00:00	2010-10-01 00:00:00	\N	0.00	26518	\N	0
26515	2	Tarea 1.1	\N	2010-10-01 00:00:00	2010-10-28 00:00:00	\N	0.00	26518	\N	1
26492	5	Tarea 1.2	\N	2010-06-15 13:42:02.981	2010-07-22 13:42:02.981	\N	0.00	26496	\N	0
26493	5	Tarea 1.1	\N	2010-07-22 13:42:02.981	2010-08-18 13:42:02.981	\N	0.00	26496	\N	1
26494	5	Tarea 1.3	\N	2010-06-15 13:42:02.981	2010-06-28 04:42:02.981	\N	0.00	26496	\N	2
26495	5	Tarea 1.4	\N	2010-06-28 04:42:02.981	2010-07-23 04:42:02.981	\N	0.00	26496	\N	3
26516	2	Tarea 1.3	\N	2010-09-05 14:08:17.391	2010-09-18 05:08:17.391	\N	0.00	26518	\N	2
26517	2	Tarea 1.4	\N	2010-09-18 05:08:17.391	2010-10-13 05:08:17.391	\N	0.00	26518	\N	3
26524	2	Tarea 3.2	\N	2010-10-13 05:08:17.391	2010-10-31 22:08:17.391	\N	0.00	26526	\N	0
26525	2	Tarea 3.1	\N	2010-09-04 18:14:23.937	2010-09-29 18:14:23.937	\N	0.00	26526	\N	1
26523	2	Tarea2	\N	2010-06-15 13:42:02.981	2010-10-25 17:08:17.391	\N	0.00	26527	\N	1
26519	2	Tarea 2.2 	\N	2010-09-18 05:08:17.391	2010-09-30 17:08:17.391	\N	0.00	26523	\N	0
26520	2	Tarea 2.1	\N	2010-09-30 17:08:17.391	2010-10-25 17:08:17.391	\N	0.00	26523	\N	1
26521	2	Tarea 2.3	\N	2010-09-18 05:08:17.391	2010-10-13 05:08:17.391	\N	0.00	26523	\N	2
26522	2	Tarea 2.4	\N	2010-08-29 03:03:16.305	2010-10-18 03:03:16.305	\N	0.00	26523	\N	3
26512	2	Tarefa 5	\N	2010-06-15 13:49:04.771	2010-06-28 01:49:04.771	\N	0.00	26513	\N	4
26508	2	Tarefa 3	\N	2010-06-15 13:49:04.771	2010-06-28 01:49:04.771	\N	0.00	26513	\N	2
26511	2	Tarefa 4	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26513	\N	3
26509	2	Tarefa 4.2	\N	2010-06-15 13:49:04.771	2010-07-04 07:49:04.771	\N	0.00	26511	\N	0
26510	2	Tarefa 4.1	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26511	\N	1
26506	2	Tarefa 1	\N	2010-06-15 13:49:04.771	2010-07-02 13:49:04.771	\N	0.00	26513	\N	0
26507	2	Tarefa 2	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26513	\N	1
26513	2	Pedido 2 Escenarios	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	2010-09-22	0.00	\N	\N	\N
26484	10	tarefa limitantes 1	\N	2010-09-27 00:00:00	2010-10-13 00:00:00	\N	0.00	26486	\N	0
26485	9	tarefa limitantes 2	\N	2010-10-13 00:00:00	2010-11-01 00:00:00	\N	0.00	26486	\N	1
26491	11	Pedido recursos limitantes 2	\N	2010-09-08 00:00:00	2011-01-07 00:00:00	2010-09-01	0.00	\N	\N	\N
26497	5	Tarea 2.2 	\N	2010-06-28 04:42:02.981	2010-07-10 16:42:02.981	\N	0.00	26501	\N	0
26498	5	Tarea 2.1	\N	2010-07-10 16:42:02.981	2010-08-04 16:42:02.981	\N	0.00	26501	\N	1
26499	5	Tarea 2.3	\N	2010-06-28 04:42:02.981	2010-07-23 04:42:02.981	\N	0.00	26501	\N	2
26500	5	Tarea 2.4	\N	2010-06-15 13:42:02.981	2010-08-04 13:42:02.981	\N	0.00	26501	\N	3
26502	5	Tarea 3.2	\N	2010-07-23 04:42:02.981	2010-08-10 22:42:02.981	\N	0.00	26504	\N	0
26503	5	Tarea 3.1	\N	2010-06-15 13:42:02.981	2010-07-10 13:42:02.981	\N	0.00	26504	\N	1
26496	7	Tarea1	\N	2010-06-15 13:42:02.981	2010-08-18 13:42:02.981	\N	0.00	26505	\N	0
26501	7	Tarea2	\N	2010-06-15 13:42:02.981	2010-08-04 16:42:02.981	\N	0.00	26505	\N	1
26504	7	Tarea 3	\N	2010-06-15 13:42:02.981	2010-08-10 22:42:02.981	\N	0.00	26505	\N	2
26505	7	Pedido Escenario 2	\N	2010-06-15 13:42:02.981	2010-08-18 13:42:02.981	2010-09-23	0.00	\N	\N	\N
26527	2	Pedido Escenario 2	\N	2010-06-15 13:42:02.981	2010-10-31 22:08:17.391	2010-09-23	0.00	\N	\N	\N
26489	11	container 2	\N	2010-09-08 00:00:00	2010-11-16 00:00:00	\N	0.00	26491	\N	1
26487	9	tarefa limitantes 3	\N	2010-09-08 00:00:00	2010-09-24 00:00:00	\N	0.00	26489	\N	0
26488	9	tarefa limitantes 4	\N	2010-10-29 00:00:00	2010-11-16 00:00:00	\N	0.00	26489	\N	1
26490	9	tarefa limitantes 5	\N	2010-11-16 00:00:00	2011-01-07 00:00:00	\N	0.00	26491	\N	2
26526	2	Tarea 3	\N	2010-06-15 13:42:02.981	2010-10-31 22:08:17.391	\N	0.00	26527	\N	2
26528	3	Recurso limitante xenérica	\N	2010-08-20 00:00:00	2010-10-13 00:00:00	2010-10-21	0.00	26491	\N	3
48178	1	Tarefa 2	\N	2010-06-16 15:17:27.811	2010-07-11 15:17:27.811	\N	0.00	48184	\N	1
48179	1	Tarefa 3	\N	2010-06-16 15:17:27.811	2010-06-29 03:17:27.811	\N	0.00	48184	\N	2
48182	1	Tarefa 4	\N	2010-06-16 15:17:27.811	2010-07-11 15:17:27.811	\N	0.00	48184	\N	3
48183	1	Tarefa 5	\N	2010-06-16 15:17:27.811	2010-06-29 03:17:27.811	\N	0.00	48184	\N	4
22832	16	Tarefa 5	\N	2010-08-12 00:00:00	2010-08-24 12:00:00	\N	0.00	22833	\N	4
22828	16	Tarefa 3	\N	2010-06-14 00:00:00	2010-07-02 00:00:00	\N	0.15	22833	\N	2
48184	1	Aplicacion pedido 2 template	\N	2010-06-16 15:17:27.811	2010-07-11 15:17:27.811	2010-09-23	0.00	\N	\N	\N
48180	1	Tarefa 4.2	\N	2010-06-16 15:17:27.811	2010-07-05 09:17:27.811	\N	0.00	48182	\N	0
48181	1	Tarefa 4.1	\N	2010-06-16 15:17:27.811	2010-07-11 15:17:27.811	\N	0.00	48182	\N	1
48177	1	Tarefa 1	\N	2010-06-16 15:17:27.811	2010-06-29 03:17:27.811	\N	0.00	48184	\N	0
22826	16	Tarefa 1	\N	2010-06-14 18:10:13.82	2010-07-01 18:10:13.82	\N	0.00	22833	\N	0
22827	16	Tarefa 2	\N	2010-07-01 18:10:13.82	2010-08-05 18:10:13.82	\N	0.00	22833	\N	1
22831	20	Tarefa 4	\N	2010-06-14 18:10:13.82	2010-08-12 00:00:00	\N	0.44	22833	\N	3
22829	16	Tarefa 4.2	\N	2010-07-02 00:00:00	2010-08-04 00:00:00	\N	0.10	22831	\N	0
22830	16	Tarefa 4.1	\N	2010-06-14 00:00:00	2010-08-12 00:00:00	\N	0.70	22831	\N	1
22833	20	Pedido 2	\N	2010-06-14 00:00:00	2010-08-24 12:00:00	2010-09-22	0.19	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2123
2126
2127
5458
5463
5466
5467
9295
9296
22831
22833
26467
26469
26474
26479
26482
26483
26486
26489
26491
26496
26501
26504
26505
26511
26513
26518
26523
26526
26527
48182
48184
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
2123	5	1633
2126	5	1636
2127	5	1632
2121	9	1634
2122	9	1635
2124	9	1637
2125	9	1638
2129	3	1644
26483	2	26047
26470	3	26049
26471	3	26050
26472	3	26051
26473	3	26052
26475	3	26054
26476	3	26055
26477	3	26056
26478	3	26057
26480	3	31917
26481	3	31918
26467	2	26001
26469	2	25997
26462	3	25998
26463	3	25999
26464	3	26000
26465	3	26002
26466	3	26003
9295	2	7685
9296	2	7677
9292	3	7678
9293	3	7686
9294	3	7687
26468	3	26004
5458	8	5080
5463	8	5085
26499	5	43572
26500	5	43573
5466	8	5090
5467	8	5053
5454	15	5081
22831	5	22443
5455	15	5082
22833	5	22439
22826	9	22440
22827	9	22441
22828	9	22442
22829	9	22444
26502	5	43575
22830	9	22445
22832	9	22446
26503	5	43576
26506	1	43602
26507	1	43603
26508	1	43604
5456	15	5083
5457	15	5084
5459	15	5086
5460	15	5087
5461	15	5088
5462	15	5089
5464	15	5091
5465	15	5092
26509	1	43606
26510	1	43607
26511	1	43605
26517	1	43614
26512	1	43608
26513	1	43601
26518	1	43610
26519	1	43616
26520	1	43617
26521	1	43618
26522	1	43619
26523	1	43615
26524	1	43621
26525	1	43622
26474	2	26048
26526	1	43620
26527	1	43609
26479	2	26053
26486	4	31944
26482	2	31916
26489	4	31947
26496	3	43564
26491	4	31943
26484	7	31945
26485	7	31946
26501	3	43569
26487	7	31948
26488	7	31949
26504	3	43574
26505	3	43563
26492	5	43565
26493	5	43566
26494	5	43567
26495	5	43568
26497	5	43570
26498	5	43571
26514	1	43611
26515	1	43612
26516	1	43613
26490	7	31950
26528	1	43625
48177	1	47899
48178	1	47900
48179	1	47901
48180	1	47903
48181	1	47904
48182	1	47902
48183	1	47905
48184	1	47898
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
13938	1	EXTRA	f970c975-7dec-426a-8fb6-a4a16c933b7e	12.00	t	t
13939	1	NORMAL	cae21596-0a34-48cd-9631-8c518c8e771d	7.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
1010	1	6ebce9b1-edb0-4aa8-80ba-11110ab2d66d	units	f
1011	1	7f8ae0ce-c0db-4a86-a111-33f9f54f3b0d	kg	f
1012	1	602c5c22-0965-4ac1-a222-c573f7a2a808	km	f
1013	1	d4122110-85f4-414a-a0a5-a8200a1863c1	l	f
1014	1	214f0d77-aea5-4c54-8599-c522487249f9	m	f
1015	1	b2e7552f-bdee-4506-885e-076d0c9168ab	m2	f
1016	1	2a21466d-d5b7-47e5-8ca9-7f72917c937f	m3	f
1017	1	bf517748-e2f1-4710-b5c2-1bbd96f59f91	tn	f
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
1112	ROLE_READ_ALL_ORDERS
1112	ROLE_CREATE_ORDER
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_ADMINISTRATION
1113	ROLE_WS_READER
1114	ROLE_WS_WRITER
1114	ROLE_WS_READER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
21817	Desc.
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, generatecode, work_report_type_id, resource_id, order_element_id) FROM stdin;
14039	1	54569b70-811f-4acb-b885-a088fa0fa1ee	\N	t	13837	\N	\N
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
14140	1	08f228ff-3818-477c-aa17-d46ec755ca03	8	2010-06-15 00:00:00	\N	\N	14039	4344	4980	13939
14141	1	4b970514-ee0c-4f69-a077-864c837cfd29	8	2010-06-14 00:00:00	\N	\N	14039	4344	4982	13939
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
13837	1	Tipo de parte de trabajo	01	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1214	Javier	Moran	78736622D
4344	Carlos	Villa Soldador1	11111111A
4348	Simón	Marchena Soldador2	22222222A
4350	Santiago	Alonso Soldador3	11111111W
4352	Tomás	Del Oro Pintor1	11111111Q
4354	Santiago	Lajos Pintor2	11111111R
4356	Rodrigo	Romero Pintor3	11111111T
4358	Laura	Gómez PintorSoldador	11111111T
21817	Soldadores	---	[Virtual]
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

ALTER TABLE ONLY hoursperday
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

ALTER TABLE ONLY hoursperday
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


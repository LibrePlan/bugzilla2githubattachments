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
    notassignable boolean,
    duration integer
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
    expandresourceloadviewcharts boolean NOT NULL,
    montecarlomethodtabvisible boolean
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
    predefinedcriterioninternalname character varying(255),
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
    predefinedtypeinternalname character varying(255),
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
    resource_allocation_id bigint NOT NULL,
    resourcetype integer
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: genericdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE genericdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint,
    enddate date,
    durationinlastday integer,
    startdate date,
    durationstartinfirstday integer
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
    sum_charged_hours_id bigint,
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
    scenario bigint,
    enddate date,
    durationinlastday integer,
    startdate date,
    durationstartinfirstday integer
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
    constraintdate date,
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
    startdate date NOT NULL,
    startdayduration integer,
    enddate date NOT NULL,
    enddayduration integer,
    deadline date,
    advance_percentage numeric(19,4),
    sumofhoursallocated integer,
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
    task_element_id bigint NOT NULL,
    startconstrainttype integer,
    constraintdate bytea
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
2951	32	t	2
2954	32	t	2
2952	32	t	2
6085	41	t	2
6969	36	t	2
10506	8	f	2
6970	36	t	2
6982	27	t	2
6983	26	t	2
6985	16	f	2
6984	16	t	1
6087	26	t	1
6086	26	f	2
1755	33	f	2
1724	33	t	1
9292	2	t	2
9293	2	t	1
9294	2	f	2
1740	33	t	1
1739	33	f	2
1723	33	f	2
3774	21	t	1
2981	21	t	1
1756	33	t	1
1759	33	f	2
1760	33	t	1
8506	2	t	2
4453	21	f	2
1800	26	t	2
1801	26	t	2
1802	26	t	2
1803	26	t	2
1804	26	t	2
1808	26	t	2
1768	33	f	2
1767	33	t	1
7026	10	t	2
7027	10	t	2
7028	10	t	2
7029	10	t	2
7030	10	t	2
7031	7	t	1
7032	7	f	2
7038	7	f	2
1809	26	t	2
1785	30	t	1
1777	30	t	1
4457	21	f	2
1811	21	f	2
1778	30	f	2
1794	30	f	2
1786	30	f	2
1793	30	t	1
7037	7	t	1
7033	10	t	2
7034	10	t	2
7036	7	t	1
7035	7	f	2
1795	26	t	2
1796	26	t	2
4452	21	t	1
3013	21	t	1
3014	21	f	2
3775	21	f	2
2941	21	t	1
8515	5	t	2
8517	5	t	1
8516	5	f	2
1810	21	t	1
2946	21	f	2
3779	21	f	2
4456	21	t	1
3017	21	t	1
3018	21	f	2
2945	21	t	1
2985	21	t	1
3778	21	t	1
6080	8	t	2
8499	4	t	2
8500	4	t	2
8501	3	f	2
8502	3	t	1
1722	46	t	2
1757	44	t	2
1758	44	t	2
1771	43	t	2
1772	43	t	2
1773	43	t	2
1774	43	t	2
1775	43	t	2
1776	43	t	2
8503	3	t	1
8504	3	f	2
2948	32	t	2
2949	32	t	2
2950	32	t	2
1761	44	t	2
1762	44	t	2
1763	44	t	2
1764	44	t	2
1765	44	t	2
1797	26	t	2
10510	8	f	2
6971	33	t	2
6972	20	f	2
6973	20	t	1
6986	23	t	2
1766	44	t	2
2942	21	f	2
1799	21	f	2
1798	21	t	1
2982	21	f	2
1805	26	t	2
1807	21	f	2
3016	21	f	2
4454	21	t	1
2983	21	t	1
8509	2	t	1
9334	12	t	2
9335	12	t	2
9336	12	t	2
9337	12	t	2
9338	12	t	2
8510	2	f	2
9340	8	t	1
9339	8	f	2
9345	8	f	2
9346	8	t	1
9341	12	t	2
9342	12	t	2
9343	8	t	1
9344	8	f	2
8507	4	t	2
8508	4	t	2
8492	4	t	2
8493	4	t	2
8494	4	t	2
8495	4	t	2
8496	4	t	2
8497	3	t	1
8498	3	f	2
1717	46	t	2
1718	46	t	2
1719	46	t	2
1720	46	t	2
1721	46	t	2
3776	21	t	1
4455	21	f	2
2944	21	f	2
3015	21	t	1
2943	21	t	1
2984	21	f	2
1806	21	t	1
3777	21	f	2
2986	21	f	2
2947	25	t	2
3783	21	t	1
3024	21	f	2
4460	21	f	2
3027	23	t	2
3784	21	t	1
4462	21	t	1
3785	21	f	2
4463	21	f	2
3029	21	t	1
3737	21	f	2
3787	22	t	2
2953	32	t	2
4465	21	f	2
3792	21	f	2
3791	21	t	1
8511	2	t	2
8512	2	t	2
8513	2	t	1
8514	2	f	2
4464	21	t	1
3022	30	t	2
3023	30	t	2
3026	30	t	2
3795	22	t	2
8505	6	t	2
3797	21	f	2
3796	21	t	1
4466	21	t	1
4467	21	f	2
6060	9	t	2
6061	9	t	2
6062	8	t	1
6082	8	f	2
6081	8	t	1
6063	8	f	2
1741	33	t	1
1769	33	t	1
1770	33	f	2
3028	30	t	2
3786	29	t	2
3788	29	t	2
3789	29	t	2
3790	29	t	2
3793	29	t	2
3794	29	t	2
6064	14	t	2
6065	14	t	2
2987	21	f	2
2988	21	t	1
2956	21	t	1
2955	21	f	2
3780	21	f	2
3781	21	t	1
3020	21	t	1
3019	21	f	2
4458	21	f	2
4459	21	t	1
3021	23	t	2
10514	8	f	2
6980	20	f	2
6981	20	t	1
15051	2	t	2
15052	2	f	2
15053	2	t	1
4461	21	t	1
3782	21	f	2
3025	21	t	1
1742	33	f	2
1726	33	f	2
1725	33	t	1
6067	8	t	1
6083	8	f	2
6084	8	t	1
6066	8	f	2
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
8101	1	2	8010	t	100.00
8102	1	2	8011	t	100.00
8103	1	2	8012	t	100.00
8104	1	2	8014	t	100.00
8105	1	2	8015	t	100.00
8106	1	2	8017	t	100.00
8107	1	2	8018	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
12536	2	2010-11-05	40.00	6085	\N
10715	10	2010-10-27	20.00	6085	\N
15462	0	2010-11-10	20.00	9334	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
1	4	children	100.0000	f	0.0100	t	t	f
2	3	percentage	100.0000	f	0.0100	t	t	f
3	2	units	2147483647.0000	f	1.0000	t	f	f
4	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
13235	204
13236	202
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
303	1	b6f36fe1-db52-4fe0-b91c-6376a2539e5c	Default
5151	1	429b93e2-4f29-4e9b-87e9-13f700a85934	\N
12827	1	acdc5746-9055-4104-b110-1f5597b7d0f2	\N
12828	1	f8eafb4c-fd6e-4cf2-9fca-4b7f5890aafb	\N
7374	7	44fdb486-17ab-4c5f-936e-3c69d94b27ff	\N
7373	6	0cfb9bae-eb51-4fc3-82d2-2256ba51a54f	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
5353	1	2010-10-25	\N	5151	0
13029	1	2010-11-09	\N	12827	0
13030	1	2010-11-09	\N	12828	0
7576	7	2010-10-26	\N	7374	0
7575	6	2010-10-26	\N	7373	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
404	1	0acef048-ad8f-4658-b8cf-1a85acd3a59b	\N	\N	303	0
5252	1	19fecfb6-91d6-458e-82ac-70373b7d8a78	303	\N	5151	0
12928	1	fa7f2e34-dd5a-4d49-afa3-6182f764a534	303	\N	12827	0
12929	1	afc400c1-e5b7-45d9-9759-b87160b97650	303	\N	12828	0
7475	7	cfd38c58-c912-4d12-983c-c078fd8e4f4a	303	\N	7374	0
7474	6	9df9f927-4cc6-4c66-b462-3f3599f12be2	303	\N	7373	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, duration, calendar_exception_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable, duration) FROM stdin;
1010	6	HOLIDAY	HOLIDAY	red	t	0
1011	5	SICK_LEAVE	SICK_LEAVE	red	t	0
1012	4	LEAVE	LEAVE	red	t	0
1013	3	STRIKE	STRIKE	red	t	0
1014	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t	0
1015	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f	0
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts, montecarlomethodtabvisible) FROM stdin;
505	2	303	COMPANY_CODE	t	t	t	t	t	t	t	t	t	t	\N
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

COPY criterion (id, version, code, name, predefinedcriterioninternalname, active, id_criterion_type, parent) FROM stdin;
202	19	94939f8e-5779-496f-9839-014b273c495d	medicalLeave	medicalLeave	t	32768	\N
203	17	737c6f99-6662-44ff-a884-973e701e65c6	paternityLeave	paternityLeave	t	32768	\N
204	5	d1f47434-d243-4bc2-8627-1f0eef07c0d2	hiredResourceWorkingRelationship	hiredResourceWorkingRelationship	t	32773	\N
205	3	0e144748-e7ac-49f8-a10f-4c660fcfcaf7	firedResourceWorkingRelationship	firedResourceWorkingRelationship	t	32773	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
13130	1	1e9a4fcf-52ab-4a38-98e2-eeeb8473468b	2010-11-09 10:39:47.232	\N	f	204	12727
13131	1	faef3f0a-e73e-4503-8811-8994d04079c7	2010-11-09 10:40:25.896	\N	f	202	12729
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, predefinedtypeinternalname, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
32768	20	bf03bd11-c36c-46e5-a56a-52f54bc9d4cb	LEAVE	LEAVE	Leave	f	f	t	f	0
32769	15	24902589-c7fd-423b-8aa0-d6741f60a931	MACHINE_LOCATION_GROUP	MACHINE_LOCATION_GROUP	Location where there are machines	t	f	t	f	1
32770	13	018b78a6-b114-4c17-951c-755b58eee860	CATEGORY	CATEGORY	Professional category	t	t	t	f	0
32771	11	065762eb-b55f-4b54-89ae-49bc142e97fe	TRAINING	TRAINING	Training courses and labor training	t	t	t	f	0
32772	9	f437e86b-81d4-4bc8-865c-82844ff33d4e	JOB	JOB	Job	t	t	t	f	0
32773	7	44cf2611-28d8-445e-91c1-9d8304a347ca	WORK_RELATIONSHIP	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	0
32774	1	7a9cea0f-733d-47f5-92f0-27bb17f2bd88	LOCATION_GROUP	LOCATION_GROUP	Location where the workers work	t	f	t	f	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, duration, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
9808	SPECIFIC_DAY	5	28800	f	2010-10-28	7273	9696	\N	\N
12405	GENERIC_DAY	2	0	f	2010-10-29	7273	\N	12236	\N
12402	GENERIC_DAY	2	28800	f	2010-10-28	7275	\N	12236	\N
12404	GENERIC_DAY	2	0	f	2010-10-28	7273	\N	12236	\N
12403	GENERIC_DAY	2	7200	f	2010-10-29	7275	\N	12236	\N
9799	SPECIFIC_DAY	5	28800	f	2010-10-26	7273	9696	\N	\N
9809	SPECIFIC_DAY	5	28800	f	2010-11-05	7273	9696	\N	\N
9803	SPECIFIC_DAY	5	0	f	2010-10-30	7273	9696	\N	\N
9806	SPECIFIC_DAY	5	0	f	2010-11-07	7273	9696	\N	\N
9810	SPECIFIC_DAY	5	28800	f	2010-10-29	7273	9696	\N	\N
9798	SPECIFIC_DAY	5	0	f	2010-10-31	7273	9696	\N	\N
9800	SPECIFIC_DAY	5	14400	f	2010-11-11	7273	9696	\N	\N
9801	SPECIFIC_DAY	5	28800	f	2010-11-09	7273	9696	\N	\N
9813	SPECIFIC_DAY	5	28800	f	2010-10-27	7273	9696	\N	\N
9802	SPECIFIC_DAY	5	28800	f	2010-11-03	7273	9696	\N	\N
9797	SPECIFIC_DAY	5	28800	f	2010-11-10	7273	9696	\N	\N
9807	SPECIFIC_DAY	5	28800	f	2010-11-01	7273	9696	\N	\N
9811	SPECIFIC_DAY	5	28800	f	2010-11-08	7273	9696	\N	\N
9805	SPECIFIC_DAY	5	28800	f	2010-11-04	7273	9696	\N	\N
9804	SPECIFIC_DAY	5	28800	f	2010-11-02	7273	9696	\N	\N
9812	SPECIFIC_DAY	5	0	f	2010-11-06	7273	9696	\N	\N
12480	GENERIC_DAY	1	0	f	2010-11-02	7273	\N	12237	\N
12481	GENERIC_DAY	1	28800	f	2010-11-01	7275	\N	12237	\N
11413	SPECIFIC_DAY	8	0	f	2010-11-07	7273	7777	\N	\N
11414	SPECIFIC_DAY	8	28800	f	2010-10-27	7273	7777	\N	\N
11416	SPECIFIC_DAY	8	0	f	2010-10-31	7273	7777	\N	\N
11412	SPECIFIC_DAY	8	28800	f	2010-11-05	7273	7777	\N	\N
11420	SPECIFIC_DAY	8	0	f	2010-10-25	7273	7777	\N	\N
11422	SPECIFIC_DAY	8	0	f	2010-10-30	7273	7777	\N	\N
11427	SPECIFIC_DAY	8	28800	f	2010-11-10	7273	7777	\N	\N
11418	SPECIFIC_DAY	8	28800	f	2010-11-01	7273	7777	\N	\N
11421	SPECIFIC_DAY	8	28800	f	2010-11-09	7273	7777	\N	\N
11426	SPECIFIC_DAY	8	28800	f	2010-11-08	7273	7777	\N	\N
11419	SPECIFIC_DAY	8	28800	f	2010-10-28	7273	7777	\N	\N
11424	SPECIFIC_DAY	8	28800	f	2010-11-03	7273	7777	\N	\N
11423	SPECIFIC_DAY	8	28800	f	2010-10-29	7273	7777	\N	\N
11411	SPECIFIC_DAY	8	28800	f	2010-11-02	7273	7777	\N	\N
11425	SPECIFIC_DAY	8	28800	f	2010-10-26	7273	7777	\N	\N
11417	SPECIFIC_DAY	8	28800	f	2010-11-04	7273	7777	\N	\N
11410	SPECIFIC_DAY	8	0	f	2010-11-06	7273	7777	\N	\N
11415	SPECIFIC_DAY	8	14400	f	2010-11-11	7273	7777	\N	\N
12483	GENERIC_DAY	1	7200	f	2010-11-02	7275	\N	12237	\N
12482	GENERIC_DAY	1	0	f	2010-11-01	7273	\N	12237	\N
13816	SPECIFIC_DAY	1	10800	f	2010-11-02	7275	11515	\N	\N
13817	SPECIFIC_DAY	1	0	f	2010-11-13	7275	11515	\N	\N
13818	SPECIFIC_DAY	1	14400	f	2010-11-15	7275	11515	\N	\N
13819	SPECIFIC_DAY	1	14400	f	2010-11-05	7275	11515	\N	\N
13820	SPECIFIC_DAY	1	14400	f	2010-11-04	7275	11515	\N	\N
13821	SPECIFIC_DAY	1	14400	f	2010-11-12	7275	11515	\N	\N
13822	SPECIFIC_DAY	1	14400	f	2010-11-11	7275	11515	\N	\N
13823	SPECIFIC_DAY	1	14400	f	2010-11-18	7275	11515	\N	\N
13824	SPECIFIC_DAY	1	14400	f	2010-11-17	7275	11515	\N	\N
13825	SPECIFIC_DAY	1	0	f	2010-11-14	7275	11515	\N	\N
13826	SPECIFIC_DAY	1	14400	f	2010-11-03	7275	11515	\N	\N
13827	SPECIFIC_DAY	1	14400	f	2010-11-08	7275	11515	\N	\N
13828	SPECIFIC_DAY	1	14400	f	2010-11-16	7275	11515	\N	\N
13829	SPECIFIC_DAY	1	14400	f	2010-11-19	7275	11515	\N	\N
13830	SPECIFIC_DAY	1	14400	f	2010-11-09	7275	11515	\N	\N
13831	SPECIFIC_DAY	1	0	f	2010-11-06	7275	11515	\N	\N
13832	SPECIFIC_DAY	1	0	f	2010-11-07	7275	11515	\N	\N
13833	SPECIFIC_DAY	1	14400	f	2010-11-10	7275	11515	\N	\N
13479	GENERIC_DAY	0	28800	f	2010-11-17	12727	\N	13336	\N
13480	GENERIC_DAY	0	28800	f	2010-11-10	12727	\N	13336	\N
13481	GENERIC_DAY	0	28800	f	2010-11-16	12727	\N	13336	\N
13482	GENERIC_DAY	0	28800	f	2010-11-12	12727	\N	13336	\N
13483	GENERIC_DAY	0	28800	f	2010-11-11	12727	\N	13336	\N
13484	GENERIC_DAY	0	28800	f	2010-11-15	12727	\N	13336	\N
13485	GENERIC_DAY	0	7200	f	2010-11-18	12727	\N	13336	\N
13486	GENERIC_DAY	0	0	f	2010-11-14	12727	\N	13336	\N
13487	GENERIC_DAY	0	0	f	2010-11-13	12727	\N	13336	\N
13488	GENERIC_DAY	0	28800	f	2010-12-02	12729	\N	13337	\N
13489	GENERIC_DAY	0	0	f	2010-11-27	12729	\N	13337	\N
13490	GENERIC_DAY	0	0	f	2010-11-28	12729	\N	13337	\N
13491	GENERIC_DAY	0	0	f	2010-11-20	12729	\N	13337	\N
13492	GENERIC_DAY	0	28800	f	2010-12-03	12729	\N	13337	\N
13493	GENERIC_DAY	0	0	f	2010-12-04	12729	\N	13337	\N
13494	GENERIC_DAY	0	0	f	2010-11-21	12729	\N	13337	\N
13495	GENERIC_DAY	0	21600	f	2010-11-18	12729	\N	13337	\N
13496	GENERIC_DAY	0	28800	f	2010-11-24	12729	\N	13337	\N
13497	GENERIC_DAY	0	28800	f	2010-11-22	12729	\N	13337	\N
13498	GENERIC_DAY	0	28800	f	2010-12-01	12729	\N	13337	\N
13499	GENERIC_DAY	0	28800	f	2010-11-19	12729	\N	13337	\N
13500	GENERIC_DAY	0	28800	f	2010-11-29	12729	\N	13337	\N
13501	GENERIC_DAY	0	28800	f	2010-11-25	12729	\N	13337	\N
13502	GENERIC_DAY	0	28800	f	2010-11-30	12729	\N	13337	\N
13503	GENERIC_DAY	0	28800	f	2010-11-23	12729	\N	13337	\N
13504	GENERIC_DAY	0	0	f	2010-12-05	12729	\N	13337	\N
13505	GENERIC_DAY	0	28800	f	2010-11-26	12729	\N	13337	\N
13506	GENERIC_DAY	0	21600	f	2010-12-06	12729	\N	13337	\N
13834	GENERIC_DAY	1	0	f	2010-11-05	7273	\N	10909	\N
13835	GENERIC_DAY	1	28800	f	2010-11-10	7275	\N	10909	\N
13836	GENERIC_DAY	1	28800	f	2010-11-04	7275	\N	10909	\N
13837	GENERIC_DAY	1	0	f	2010-11-11	7273	\N	10909	\N
13838	GENERIC_DAY	1	28800	f	2010-11-01	7275	\N	10909	\N
13839	GENERIC_DAY	1	14400	f	2010-11-16	7273	\N	10909	\N
13840	GENERIC_DAY	1	0	f	2010-11-03	7273	\N	10909	\N
13841	GENERIC_DAY	1	28800	f	2010-11-09	7275	\N	10909	\N
13842	GENERIC_DAY	1	14400	f	2010-12-02	7273	\N	10909	\N
13843	GENERIC_DAY	1	14400	f	2010-11-24	7275	\N	10909	\N
13844	GENERIC_DAY	1	14400	f	2010-11-19	7273	\N	10909	\N
13845	GENERIC_DAY	1	14400	f	2010-11-16	7275	\N	10909	\N
13846	GENERIC_DAY	1	14400	f	2010-11-29	7273	\N	10909	\N
13847	GENERIC_DAY	1	0	f	2010-11-01	7273	\N	10909	\N
13848	GENERIC_DAY	1	0	f	2010-11-21	7275	\N	10909	\N
13849	GENERIC_DAY	1	0	f	2010-11-02	7273	\N	10909	\N
13850	GENERIC_DAY	1	14400	f	2010-11-25	7273	\N	10909	\N
13851	GENERIC_DAY	1	0	f	2010-11-27	7273	\N	10909	\N
13852	GENERIC_DAY	1	14400	f	2010-11-15	7273	\N	10909	\N
13853	GENERIC_DAY	1	0	f	2010-11-07	7275	\N	10909	\N
13854	GENERIC_DAY	1	0	f	2010-11-20	7275	\N	10909	\N
13855	GENERIC_DAY	1	0	f	2010-11-28	7273	\N	10909	\N
13856	GENERIC_DAY	1	0	f	2010-11-06	7273	\N	10909	\N
13857	GENERIC_DAY	1	14400	f	2010-12-01	7275	\N	10909	\N
13858	GENERIC_DAY	1	14400	f	2010-12-03	7273	\N	10909	\N
13859	GENERIC_DAY	1	14400	f	2010-11-17	7275	\N	10909	\N
13860	GENERIC_DAY	1	14400	f	2010-11-25	7275	\N	10909	\N
13861	GENERIC_DAY	1	14400	f	2010-11-23	7273	\N	10909	\N
13862	GENERIC_DAY	1	0	f	2010-11-10	7273	\N	10909	\N
13863	GENERIC_DAY	1	0	f	2010-11-13	7275	\N	10909	\N
13864	GENERIC_DAY	1	14400	f	2010-12-01	7273	\N	10909	\N
13865	GENERIC_DAY	1	0	f	2010-11-27	7275	\N	10909	\N
13866	GENERIC_DAY	1	28800	f	2010-11-02	7275	\N	10909	\N
13867	GENERIC_DAY	1	14400	f	2010-11-15	7275	\N	10909	\N
13868	GENERIC_DAY	1	0	f	2010-11-13	7273	\N	10909	\N
13869	GENERIC_DAY	1	14400	f	2010-11-23	7275	\N	10909	\N
13870	GENERIC_DAY	1	0	f	2010-11-09	7273	\N	10909	\N
13871	GENERIC_DAY	1	28800	f	2010-11-03	7275	\N	10909	\N
13872	GENERIC_DAY	1	14400	f	2010-11-12	7273	\N	10909	\N
13873	GENERIC_DAY	1	14400	f	2010-11-19	7275	\N	10909	\N
13874	GENERIC_DAY	1	28800	f	2010-11-11	7275	\N	10909	\N
13875	GENERIC_DAY	1	14400	f	2010-11-12	7275	\N	10909	\N
13876	GENERIC_DAY	1	28800	f	2010-11-08	7275	\N	10909	\N
13877	GENERIC_DAY	1	14400	f	2010-11-24	7273	\N	10909	\N
13878	GENERIC_DAY	1	14400	f	2010-11-18	7273	\N	10909	\N
13879	GENERIC_DAY	1	14400	f	2010-11-29	7275	\N	10909	\N
13880	GENERIC_DAY	1	14400	f	2010-11-22	7273	\N	10909	\N
13881	GENERIC_DAY	1	14400	f	2010-11-26	7275	\N	10909	\N
13882	GENERIC_DAY	1	28800	f	2010-11-05	7275	\N	10909	\N
13883	GENERIC_DAY	1	0	f	2010-11-07	7273	\N	10909	\N
13884	GENERIC_DAY	1	0	f	2010-11-14	7275	\N	10909	\N
13885	GENERIC_DAY	1	14400	f	2010-11-22	7275	\N	10909	\N
13886	GENERIC_DAY	1	14400	f	2010-11-26	7273	\N	10909	\N
13887	GENERIC_DAY	1	14400	f	2010-11-30	7275	\N	10909	\N
13888	GENERIC_DAY	1	14400	f	2010-11-30	7273	\N	10909	\N
13889	GENERIC_DAY	1	14400	f	2010-12-02	7275	\N	10909	\N
13890	GENERIC_DAY	1	0	f	2010-11-06	7275	\N	10909	\N
13891	GENERIC_DAY	1	0	f	2010-11-04	7273	\N	10909	\N
13892	GENERIC_DAY	1	14400	f	2010-12-03	7275	\N	10909	\N
13893	GENERIC_DAY	1	14400	f	2010-11-17	7273	\N	10909	\N
13894	GENERIC_DAY	1	0	f	2010-11-28	7275	\N	10909	\N
13895	GENERIC_DAY	1	0	f	2010-11-08	7273	\N	10909	\N
13896	GENERIC_DAY	1	0	f	2010-11-21	7273	\N	10909	\N
13897	GENERIC_DAY	1	0	f	2010-11-14	7273	\N	10909	\N
13898	GENERIC_DAY	1	0	f	2010-11-20	7273	\N	10909	\N
13899	GENERIC_DAY	1	14400	f	2010-11-18	7275	\N	10909	\N
13900	GENERIC_DAY	1	0	f	2011-01-16	7273	\N	10911	\N
13901	GENERIC_DAY	1	14400	f	2011-02-10	7273	\N	10911	\N
13902	GENERIC_DAY	1	0	f	2011-01-15	7273	\N	10911	\N
13903	GENERIC_DAY	1	0	f	2011-01-09	7275	\N	10911	\N
13904	GENERIC_DAY	1	0	f	2011-02-06	7275	\N	10911	\N
13905	GENERIC_DAY	1	14400	f	2011-01-05	7275	\N	10911	\N
13906	GENERIC_DAY	1	14400	f	2011-02-08	7273	\N	10911	\N
13907	GENERIC_DAY	1	14400	f	2011-02-01	7275	\N	10911	\N
13908	GENERIC_DAY	1	14400	f	2011-02-09	7275	\N	10911	\N
13909	GENERIC_DAY	1	14400	f	2011-01-10	7275	\N	10911	\N
13910	GENERIC_DAY	1	14400	f	2011-01-17	7275	\N	10911	\N
13911	GENERIC_DAY	1	14400	f	2011-01-31	7273	\N	10911	\N
13912	GENERIC_DAY	1	14400	f	2011-01-12	7273	\N	10911	\N
13913	GENERIC_DAY	1	14400	f	2011-01-27	7273	\N	10911	\N
13914	GENERIC_DAY	1	14400	f	2011-01-14	7273	\N	10911	\N
13915	GENERIC_DAY	1	14400	f	2011-01-28	7275	\N	10911	\N
13916	GENERIC_DAY	1	14400	f	2011-02-01	7273	\N	10911	\N
13917	GENERIC_DAY	1	14400	f	2011-02-02	7273	\N	10911	\N
13918	GENERIC_DAY	1	14400	f	2011-02-07	7273	\N	10911	\N
13919	GENERIC_DAY	1	14400	f	2011-01-07	7273	\N	10911	\N
13920	GENERIC_DAY	1	14400	f	2011-02-03	7273	\N	10911	\N
13921	GENERIC_DAY	1	14400	f	2011-02-04	7275	\N	10911	\N
13922	GENERIC_DAY	1	14400	f	2011-01-17	7273	\N	10911	\N
13923	GENERIC_DAY	1	14400	f	2011-01-25	7275	\N	10911	\N
13924	GENERIC_DAY	1	14400	f	2011-01-21	7275	\N	10911	\N
13925	GENERIC_DAY	1	14400	f	2011-01-07	7275	\N	10911	\N
13926	GENERIC_DAY	1	14400	f	2011-01-26	7275	\N	10911	\N
13927	GENERIC_DAY	1	0	f	2011-02-12	7275	\N	10911	\N
13928	GENERIC_DAY	1	14400	f	2011-01-18	7275	\N	10911	\N
13929	GENERIC_DAY	1	14400	f	2011-01-13	7273	\N	10911	\N
13930	GENERIC_DAY	1	14400	f	2011-01-24	7273	\N	10911	\N
13931	GENERIC_DAY	1	0	f	2011-01-09	7273	\N	10911	\N
13932	GENERIC_DAY	1	0	f	2011-01-16	7275	\N	10911	\N
13933	GENERIC_DAY	1	0	f	2011-02-13	7275	\N	10911	\N
13934	GENERIC_DAY	1	0	f	2011-01-29	7273	\N	10911	\N
13935	GENERIC_DAY	1	14400	f	2011-01-28	7273	\N	10911	\N
13936	GENERIC_DAY	1	14400	f	2011-02-08	7275	\N	10911	\N
13937	GENERIC_DAY	1	0	f	2011-02-06	7273	\N	10911	\N
13938	GENERIC_DAY	1	14400	f	2011-01-04	7273	\N	10911	\N
13939	GENERIC_DAY	1	14400	f	2011-01-20	7275	\N	10911	\N
13940	GENERIC_DAY	1	14400	f	2011-02-11	7275	\N	10911	\N
13941	GENERIC_DAY	1	14400	f	2011-02-03	7275	\N	10911	\N
13942	GENERIC_DAY	1	14400	f	2011-02-09	7273	\N	10911	\N
13943	GENERIC_DAY	1	14400	f	2011-01-04	7275	\N	10911	\N
13944	GENERIC_DAY	1	0	f	2011-01-30	7273	\N	10911	\N
13945	GENERIC_DAY	1	0	f	2011-02-13	7273	\N	10911	\N
13946	GENERIC_DAY	1	0	f	2011-01-08	7273	\N	10911	\N
13947	GENERIC_DAY	1	0	f	2011-01-22	7275	\N	10911	\N
13948	GENERIC_DAY	1	0	f	2011-01-22	7273	\N	10911	\N
13949	GENERIC_DAY	1	14400	f	2011-01-13	7275	\N	10911	\N
13950	GENERIC_DAY	1	14400	f	2011-02-10	7275	\N	10911	\N
13951	GENERIC_DAY	1	14400	f	2011-01-06	7275	\N	10911	\N
13952	GENERIC_DAY	1	0	f	2011-01-23	7273	\N	10911	\N
13953	GENERIC_DAY	1	14400	f	2011-01-05	7273	\N	10911	\N
13954	GENERIC_DAY	1	1800	f	2011-02-14	7275	\N	10911	\N
13955	GENERIC_DAY	1	14400	f	2011-02-02	7275	\N	10911	\N
13956	GENERIC_DAY	1	0	f	2011-01-29	7275	\N	10911	\N
13957	GENERIC_DAY	1	1800	f	2011-02-14	7273	\N	10911	\N
13958	GENERIC_DAY	1	0	f	2011-02-12	7273	\N	10911	\N
13959	GENERIC_DAY	1	14400	f	2011-02-04	7273	\N	10911	\N
13960	GENERIC_DAY	1	14400	f	2011-01-21	7273	\N	10911	\N
13961	GENERIC_DAY	1	14400	f	2011-01-11	7273	\N	10911	\N
13962	GENERIC_DAY	1	0	f	2011-01-23	7275	\N	10911	\N
13963	GENERIC_DAY	1	14400	f	2011-01-10	7273	\N	10911	\N
13964	GENERIC_DAY	1	14400	f	2011-02-07	7275	\N	10911	\N
13965	GENERIC_DAY	1	0	f	2011-02-05	7273	\N	10911	\N
13966	GENERIC_DAY	1	14400	f	2011-01-24	7275	\N	10911	\N
13967	GENERIC_DAY	1	0	f	2011-01-08	7275	\N	10911	\N
13968	GENERIC_DAY	1	14400	f	2011-02-11	7273	\N	10911	\N
13969	GENERIC_DAY	1	14400	f	2011-01-19	7275	\N	10911	\N
13970	GENERIC_DAY	1	14400	f	2011-01-11	7275	\N	10911	\N
13971	GENERIC_DAY	1	14400	f	2011-01-27	7275	\N	10911	\N
13972	GENERIC_DAY	1	14400	f	2011-01-26	7273	\N	10911	\N
13973	GENERIC_DAY	1	14400	f	2011-01-06	7273	\N	10911	\N
13974	GENERIC_DAY	1	0	f	2011-02-05	7275	\N	10911	\N
13975	GENERIC_DAY	1	14400	f	2011-01-25	7273	\N	10911	\N
13976	GENERIC_DAY	1	14400	f	2011-01-20	7273	\N	10911	\N
13977	GENERIC_DAY	1	14400	f	2011-01-14	7275	\N	10911	\N
13978	GENERIC_DAY	1	0	f	2011-01-30	7275	\N	10911	\N
13979	GENERIC_DAY	1	14400	f	2011-01-31	7275	\N	10911	\N
13980	GENERIC_DAY	1	14400	f	2011-01-19	7273	\N	10911	\N
13981	GENERIC_DAY	1	14400	f	2011-01-18	7273	\N	10911	\N
13982	GENERIC_DAY	1	14400	f	2011-01-12	7275	\N	10911	\N
13983	GENERIC_DAY	1	0	f	2011-01-15	7275	\N	10911	\N
14002	SPECIFIC_DAY	1	14400	f	2010-11-09	7275	11515	\N	\N
14003	SPECIFIC_DAY	1	0	f	2010-11-14	7275	11515	\N	\N
14004	SPECIFIC_DAY	1	14400	f	2010-11-04	7275	11515	\N	\N
14005	SPECIFIC_DAY	1	14400	f	2010-11-19	7275	11515	\N	\N
14006	SPECIFIC_DAY	1	14400	f	2010-11-18	7275	11515	\N	\N
14007	SPECIFIC_DAY	1	14400	f	2010-11-16	7275	11515	\N	\N
14008	SPECIFIC_DAY	1	14400	f	2010-11-17	7275	11515	\N	\N
14009	SPECIFIC_DAY	1	0	f	2010-11-13	7275	11515	\N	\N
14010	SPECIFIC_DAY	1	14400	f	2010-11-11	7275	11515	\N	\N
14011	SPECIFIC_DAY	1	10800	f	2010-11-02	7275	11515	\N	\N
14012	SPECIFIC_DAY	1	14400	f	2010-11-08	7275	11515	\N	\N
14013	SPECIFIC_DAY	1	14400	f	2010-11-03	7275	11515	\N	\N
14014	SPECIFIC_DAY	1	14400	f	2010-11-12	7275	11515	\N	\N
14015	SPECIFIC_DAY	1	0	f	2010-11-06	7275	11515	\N	\N
14016	SPECIFIC_DAY	1	14400	f	2010-11-15	7275	11515	\N	\N
14017	SPECIFIC_DAY	1	14400	f	2010-11-05	7275	11515	\N	\N
14018	SPECIFIC_DAY	1	14400	f	2010-11-10	7275	11515	\N	\N
14019	SPECIFIC_DAY	1	0	f	2010-11-07	7275	11515	\N	\N
14086	GENERIC_DAY	1	28800	f	2010-11-04	7275	\N	10909	\N
14087	GENERIC_DAY	1	14400	f	2010-12-02	7275	\N	10909	\N
14088	GENERIC_DAY	1	0	f	2010-11-21	7275	\N	10909	\N
14089	GENERIC_DAY	1	0	f	2010-11-28	7275	\N	10909	\N
14090	GENERIC_DAY	1	0	f	2010-11-27	7273	\N	10909	\N
14091	GENERIC_DAY	1	28800	f	2010-11-02	7275	\N	10909	\N
14092	GENERIC_DAY	1	28800	f	2010-11-03	7275	\N	10909	\N
14093	GENERIC_DAY	1	14400	f	2010-11-26	7275	\N	10909	\N
14094	GENERIC_DAY	1	14400	f	2010-11-15	7275	\N	10909	\N
14095	GENERIC_DAY	1	14400	f	2010-11-18	7273	\N	10909	\N
14096	GENERIC_DAY	1	14400	f	2010-11-25	7273	\N	10909	\N
14097	GENERIC_DAY	1	28800	f	2010-11-05	7275	\N	10909	\N
14098	GENERIC_DAY	1	0	f	2010-11-04	7273	\N	10909	\N
14099	GENERIC_DAY	1	14400	f	2010-11-29	7273	\N	10909	\N
14100	GENERIC_DAY	1	0	f	2010-11-27	7275	\N	10909	\N
14101	GENERIC_DAY	1	0	f	2010-11-08	7273	\N	10909	\N
14102	GENERIC_DAY	1	0	f	2010-11-09	7273	\N	10909	\N
14103	GENERIC_DAY	1	14400	f	2010-11-30	7273	\N	10909	\N
14104	GENERIC_DAY	1	0	f	2010-11-14	7275	\N	10909	\N
14105	GENERIC_DAY	1	0	f	2010-11-21	7273	\N	10909	\N
14106	GENERIC_DAY	1	14400	f	2010-11-19	7275	\N	10909	\N
14107	GENERIC_DAY	1	14400	f	2010-11-16	7273	\N	10909	\N
14108	GENERIC_DAY	1	14400	f	2010-11-15	7273	\N	10909	\N
14109	GENERIC_DAY	1	14400	f	2010-11-19	7273	\N	10909	\N
14110	GENERIC_DAY	1	0	f	2010-11-20	7273	\N	10909	\N
14111	GENERIC_DAY	1	14400	f	2010-11-22	7273	\N	10909	\N
14112	GENERIC_DAY	1	0	f	2010-11-13	7273	\N	10909	\N
14113	GENERIC_DAY	1	0	f	2010-11-03	7273	\N	10909	\N
14114	GENERIC_DAY	1	0	f	2010-11-02	7273	\N	10909	\N
14115	GENERIC_DAY	1	14400	f	2010-11-30	7275	\N	10909	\N
14116	GENERIC_DAY	1	14400	f	2010-11-12	7275	\N	10909	\N
14117	GENERIC_DAY	1	14400	f	2010-11-18	7275	\N	10909	\N
14118	GENERIC_DAY	1	14400	f	2010-11-25	7275	\N	10909	\N
14119	GENERIC_DAY	1	14400	f	2010-12-01	7273	\N	10909	\N
14120	GENERIC_DAY	1	0	f	2010-11-01	7273	\N	10909	\N
14121	GENERIC_DAY	1	14400	f	2010-11-29	7275	\N	10909	\N
14122	GENERIC_DAY	1	0	f	2010-11-10	7273	\N	10909	\N
14123	GENERIC_DAY	1	0	f	2010-11-11	7273	\N	10909	\N
14124	GENERIC_DAY	1	14400	f	2010-12-02	7273	\N	10909	\N
14125	GENERIC_DAY	1	0	f	2010-11-13	7275	\N	10909	\N
14126	GENERIC_DAY	1	0	f	2010-11-07	7275	\N	10909	\N
14127	GENERIC_DAY	1	14400	f	2010-12-03	7275	\N	10909	\N
14128	GENERIC_DAY	1	14400	f	2010-11-24	7275	\N	10909	\N
14129	GENERIC_DAY	1	28800	f	2010-11-10	7275	\N	10909	\N
14130	GENERIC_DAY	1	14400	f	2010-11-17	7275	\N	10909	\N
14131	GENERIC_DAY	1	0	f	2010-11-07	7273	\N	10909	\N
14132	GENERIC_DAY	1	0	f	2010-11-06	7273	\N	10909	\N
14133	GENERIC_DAY	1	14400	f	2010-11-23	7273	\N	10909	\N
14134	GENERIC_DAY	1	28800	f	2010-11-08	7275	\N	10909	\N
14135	GENERIC_DAY	1	0	f	2010-11-14	7273	\N	10909	\N
14136	GENERIC_DAY	1	28800	f	2010-11-11	7275	\N	10909	\N
14137	GENERIC_DAY	1	14400	f	2010-11-12	7273	\N	10909	\N
14138	GENERIC_DAY	1	14400	f	2010-12-01	7275	\N	10909	\N
14139	GENERIC_DAY	1	28800	f	2010-11-09	7275	\N	10909	\N
14140	GENERIC_DAY	1	14400	f	2010-11-26	7273	\N	10909	\N
14141	GENERIC_DAY	1	14400	f	2010-11-23	7275	\N	10909	\N
14142	GENERIC_DAY	1	28800	f	2010-11-01	7275	\N	10909	\N
14143	GENERIC_DAY	1	0	f	2010-11-05	7273	\N	10909	\N
14144	GENERIC_DAY	1	14400	f	2010-11-17	7273	\N	10909	\N
14145	GENERIC_DAY	1	0	f	2010-11-28	7273	\N	10909	\N
14146	GENERIC_DAY	1	0	f	2010-11-06	7275	\N	10909	\N
14147	GENERIC_DAY	1	0	f	2010-11-20	7275	\N	10909	\N
14148	GENERIC_DAY	1	14400	f	2010-11-22	7275	\N	10909	\N
14149	GENERIC_DAY	1	14400	f	2010-12-03	7273	\N	10909	\N
14150	GENERIC_DAY	1	14400	f	2010-11-24	7273	\N	10909	\N
14151	GENERIC_DAY	1	14400	f	2010-11-16	7275	\N	10909	\N
14236	GENERIC_DAY	1	0	f	2011-01-16	7275	\N	10911	\N
14237	GENERIC_DAY	1	14400	f	2011-01-27	7275	\N	10911	\N
14238	GENERIC_DAY	1	14400	f	2011-02-01	7275	\N	10911	\N
14239	GENERIC_DAY	1	14400	f	2011-01-26	7273	\N	10911	\N
14240	GENERIC_DAY	1	14400	f	2011-01-26	7275	\N	10911	\N
14241	GENERIC_DAY	1	14400	f	2011-01-31	7275	\N	10911	\N
14242	GENERIC_DAY	1	14400	f	2011-01-10	7273	\N	10911	\N
14243	GENERIC_DAY	1	14400	f	2011-02-03	7273	\N	10911	\N
14244	GENERIC_DAY	1	14400	f	2011-01-24	7273	\N	10911	\N
14245	GENERIC_DAY	1	0	f	2011-02-05	7275	\N	10911	\N
14246	GENERIC_DAY	1	14400	f	2011-01-31	7273	\N	10911	\N
14247	GENERIC_DAY	1	14400	f	2011-02-10	7275	\N	10911	\N
14248	GENERIC_DAY	1	14400	f	2011-02-02	7273	\N	10911	\N
14249	GENERIC_DAY	1	0	f	2011-01-08	7275	\N	10911	\N
14250	GENERIC_DAY	1	14400	f	2011-02-01	7273	\N	10911	\N
14251	GENERIC_DAY	1	14400	f	2011-02-07	7275	\N	10911	\N
14252	GENERIC_DAY	1	14400	f	2011-01-21	7275	\N	10911	\N
14253	GENERIC_DAY	1	0	f	2011-02-12	7273	\N	10911	\N
14254	GENERIC_DAY	1	14400	f	2011-02-03	7275	\N	10911	\N
14255	GENERIC_DAY	1	14400	f	2011-01-12	7273	\N	10911	\N
14256	GENERIC_DAY	1	0	f	2011-01-15	7275	\N	10911	\N
14257	GENERIC_DAY	1	14400	f	2011-01-24	7275	\N	10911	\N
14258	GENERIC_DAY	1	14400	f	2011-01-07	7275	\N	10911	\N
14259	GENERIC_DAY	1	0	f	2011-01-29	7273	\N	10911	\N
14260	GENERIC_DAY	1	14400	f	2011-01-28	7275	\N	10911	\N
14261	GENERIC_DAY	1	14400	f	2011-01-10	7275	\N	10911	\N
14262	GENERIC_DAY	1	14400	f	2011-02-07	7273	\N	10911	\N
14263	GENERIC_DAY	1	0	f	2011-01-23	7275	\N	10911	\N
14264	GENERIC_DAY	1	14400	f	2011-02-09	7275	\N	10911	\N
14265	GENERIC_DAY	1	0	f	2011-02-12	7275	\N	10911	\N
14266	GENERIC_DAY	1	14400	f	2011-01-27	7273	\N	10911	\N
14267	GENERIC_DAY	1	14400	f	2011-01-11	7275	\N	10911	\N
14268	GENERIC_DAY	1	14400	f	2011-02-02	7275	\N	10911	\N
14269	GENERIC_DAY	1	14400	f	2011-01-19	7275	\N	10911	\N
14270	GENERIC_DAY	1	14400	f	2011-01-04	7275	\N	10911	\N
14271	GENERIC_DAY	1	0	f	2011-01-30	7273	\N	10911	\N
14272	GENERIC_DAY	1	0	f	2011-01-09	7275	\N	10911	\N
14273	GENERIC_DAY	1	0	f	2011-01-23	7273	\N	10911	\N
14274	GENERIC_DAY	1	14400	f	2011-01-28	7273	\N	10911	\N
14275	GENERIC_DAY	1	14400	f	2011-02-09	7273	\N	10911	\N
14276	GENERIC_DAY	1	14400	f	2011-01-13	7275	\N	10911	\N
14277	GENERIC_DAY	1	0	f	2011-02-06	7275	\N	10911	\N
14278	GENERIC_DAY	1	14400	f	2011-01-12	7275	\N	10911	\N
14279	GENERIC_DAY	1	14400	f	2011-01-21	7273	\N	10911	\N
14280	GENERIC_DAY	1	1800	f	2011-02-14	7275	\N	10911	\N
14281	GENERIC_DAY	1	14400	f	2011-01-18	7273	\N	10911	\N
14282	GENERIC_DAY	1	0	f	2011-01-08	7273	\N	10911	\N
14283	GENERIC_DAY	1	14400	f	2011-01-06	7275	\N	10911	\N
14284	GENERIC_DAY	1	14400	f	2011-01-14	7275	\N	10911	\N
14285	GENERIC_DAY	1	14400	f	2011-01-20	7275	\N	10911	\N
14286	GENERIC_DAY	1	14400	f	2011-01-05	7275	\N	10911	\N
14287	GENERIC_DAY	1	14400	f	2011-02-08	7273	\N	10911	\N
14288	GENERIC_DAY	1	0	f	2011-01-29	7275	\N	10911	\N
14289	GENERIC_DAY	1	14400	f	2011-01-25	7273	\N	10911	\N
14290	GENERIC_DAY	1	0	f	2011-01-09	7273	\N	10911	\N
14291	GENERIC_DAY	1	14400	f	2011-01-06	7273	\N	10911	\N
14292	GENERIC_DAY	1	14400	f	2011-01-13	7273	\N	10911	\N
14293	GENERIC_DAY	1	0	f	2011-01-30	7275	\N	10911	\N
14294	GENERIC_DAY	1	14400	f	2011-02-11	7273	\N	10911	\N
14295	GENERIC_DAY	1	0	f	2011-01-16	7273	\N	10911	\N
14296	GENERIC_DAY	1	14400	f	2011-02-11	7275	\N	10911	\N
14297	GENERIC_DAY	1	0	f	2011-02-13	7273	\N	10911	\N
14298	GENERIC_DAY	1	14400	f	2011-02-04	7275	\N	10911	\N
14299	GENERIC_DAY	1	14400	f	2011-01-04	7273	\N	10911	\N
14300	GENERIC_DAY	1	0	f	2011-01-15	7273	\N	10911	\N
14301	GENERIC_DAY	1	14400	f	2011-01-14	7273	\N	10911	\N
14302	GENERIC_DAY	1	14400	f	2011-01-17	7273	\N	10911	\N
14303	GENERIC_DAY	1	14400	f	2011-01-17	7275	\N	10911	\N
14304	GENERIC_DAY	1	14400	f	2011-01-11	7273	\N	10911	\N
14305	GENERIC_DAY	1	0	f	2011-02-05	7273	\N	10911	\N
14306	GENERIC_DAY	1	1800	f	2011-02-14	7273	\N	10911	\N
14307	GENERIC_DAY	1	14400	f	2011-01-19	7273	\N	10911	\N
14308	GENERIC_DAY	1	14400	f	2011-02-08	7275	\N	10911	\N
14309	GENERIC_DAY	1	14400	f	2011-01-25	7275	\N	10911	\N
14310	GENERIC_DAY	1	14400	f	2011-02-04	7273	\N	10911	\N
14311	GENERIC_DAY	1	0	f	2011-02-06	7273	\N	10911	\N
14312	GENERIC_DAY	1	14400	f	2011-01-18	7275	\N	10911	\N
14313	GENERIC_DAY	1	0	f	2011-01-22	7275	\N	10911	\N
14314	GENERIC_DAY	1	14400	f	2011-01-05	7273	\N	10911	\N
14315	GENERIC_DAY	1	14400	f	2011-02-10	7273	\N	10911	\N
14316	GENERIC_DAY	1	0	f	2011-01-22	7273	\N	10911	\N
14317	GENERIC_DAY	1	14400	f	2011-01-20	7273	\N	10911	\N
14318	GENERIC_DAY	1	14400	f	2011-01-07	7273	\N	10911	\N
14319	GENERIC_DAY	1	0	f	2011-02-13	7275	\N	10911	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
3899415	3	7077	7074	\N	2
2326550	19	7075	7082	\N	0
2326561	16	7080	7081	\N	0
2326560	1	7106	7105	\N	0
3244032	6	9399	9403	\N	0
4980737	1	9401	9402	\N	0
4980738	1	9396	9397	\N	0
4980736	1	9395	9396	\N	0
4096011	5	9398	9399	\N	0
1802263	1	6161	6162	\N	0
1802262	1	6164	6165	\N	0
2326563	1	7087	7091	\N	0
2326552	3	7084	7085	\N	0
2326551	6	7083	7084	\N	0
2326562	2	7085	7088	\N	0
2326564	1	7086	7087	\N	0
2326565	0	7089	7090	\N	0
1802256	21	1827	1835	\N	0
1572866	26	1829	1830	\N	0
1572867	26	1830	1831	\N	0
2326554	1	7093	7094	\N	0
2326553	1	7094	7095	\N	0
1802243	22	1831	1832	\N	0
1802244	22	1832	1833	\N	0
1802245	22	1833	1834	\N	0
2326549	4	4949	4950	\N	0
1802257	21	1836	1837	\N	0
1802258	21	1837	1838	\N	0
1802259	21	1838	1839	\N	0
1802260	21	1839	1840	\N	0
1802261	21	1840	1841	\N	0
3637254	2	6168	6169	\N	0
2326545	5	1851	1852	\N	0
2326546	5	1852	1853	\N	0
2326547	5	1853	1854	\N	0
2326548	5	1854	1855	\N	0
1540096	27	1843	1827	\N	0
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
1758	1268	100.00
8506	8593	100.00
6085	5698	100.00
6969	6569	100.00
6970	6570	100.00
6982	6578	100.00
8492	6660	100.00
6971	6579	100.00
6983	6587	100.00
6986	6588	100.00
8493	6661	100.00
8494	6662	100.00
1771	1291	100.00
1772	1292	100.00
1773	1293	100.00
1774	1294	100.00
1775	1295	100.00
1776	1296	100.00
2948	2397	100.00
2949	2398	100.00
2950	2399	100.00
2951	2400	100.00
2954	2403	100.00
2952	2401	100.00
2953	2402	100.00
3022	2423	100.00
3023	3636	100.00
8507	8602	100.00
8508	8603	100.00
1795	2330	100.00
1796	2331	100.00
1797	2332	100.00
1800	2333	100.00
1801	2359	100.00
1802	2360	100.00
8495	6664	100.00
8496	6665	100.00
8499	8586	100.00
9292	8793	100.00
1803	2361	100.00
1804	2362	100.00
1805	2363	100.00
1808	2334	100.00
1809	2371	100.00
2947	2335	100.00
3021	2336	100.00
3026	3638	100.00
9334	8825	100.00
9335	8826	100.00
8500	8587	100.00
8511	8612	100.00
8512	8613	100.00
9336	8827	100.00
9337	8829	100.00
9338	8830	100.00
9341	8832	100.00
9342	8833	100.00
1717	1233	100.00
3028	3639	100.00
3786	3665	100.00
3788	3666	100.00
3789	3667	100.00
3790	3668	100.00
3793	3670	100.00
3794	3671	100.00
1761	1270	100.00
7026	6620	100.00
7027	6621	100.00
7028	6622	100.00
1762	1271	100.00
1763	1272	100.00
1764	1273	100.00
1765	1274	100.00
1766	1275	100.00
7029	6624	100.00
7030	6625	100.00
8505	8590	100.00
7033	6627	100.00
7034	6628	100.00
8515	8620	100.00
1718	1234	100.00
1719	1235	100.00
1720	1236	100.00
1721	1237	100.00
1722	1238	100.00
1757	1239	100.00
3027	2337	100.00
3787	2338	100.00
3795	2339	100.00
6080	5663	100.00
6060	5667	100.00
6061	5687	100.00
6064	5678	100.00
6065	5679	100.00
15051	14650	100.00
\.


--
-- Data for Name: effortperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY effortperday (base_calendar_id, effort, day_id) FROM stdin;
404	28800	0
404	28800	1
404	28800	2
404	28800	3
404	28800	4
404	0	5
404	0	6
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id, resourcetype) FROM stdin;
13235	0
13236	0
12135	0
12136	0
10808	0
10810	0
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario, enddate, durationinlastday, startdate, durationstartinfirstday) FROM stdin;
12236	2	12135	707	2010-10-29	7200	2010-10-28	0
12237	2	12136	707	2010-11-02	7200	2010-11-01	0
13336	0	13235	707	2010-11-18	7200	2010-11-02	7200
13337	0	13236	707	2010-12-06	21600	2010-11-18	7200
10909	5	10808	707	2010-12-04	0	\N	\N
10911	4	10810	707	2011-02-14	3600	2011-01-04	0
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
160
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
1706	31	PREFIX-00001-00026-00001	WORKER	10	1.00	f	2333	\N
8698	4	PREFIX-00005-00002-00001	WORKER	20	1.00	f	8603	\N
2435	30	PREFIX-00001-00037-00001	WORKER	5	1.00	f	2359	\N
2436	30	PREFIX-00001-00038-00001	WORKER	20	1.00	f	2360	\N
2437	30	PREFIX-00001-00039-00001	WORKER	5	1.00	f	2361	\N
1634	46	PREFIX-00001-00007-00001	WORKER	15	1.00	f	1237	\N
2438	30	PREFIX-00001-00040-00001	WORKER	5	1.00	f	2362	\N
5970	12	PREFIX-00001-00068-00001	WORKER	108	1.00	f	5667	\N
5982	10	PREFIX-00001-00073-00001	WORKER	100	1.00	f	5687	\N
5986	5	PREFIX-00001-00074-00001	WORKER	100	1.00	f	5691	\N
1635	46	PREFIX-00001-00008-00001	WORKER	15	1.00	f	1238	\N
1636	46	PREFIX-00001-00002-00001	WORKER	10	1.00	f	1239	\N
1658	44	PREFIX-00001-00011-00001	WORKER	55	1.00	f	1268	\N
1677	43	PREFIX-00001-00019-00001	WORKER	15	1.00	f	1291	\N
1678	43	PREFIX-00001-00020-00001	WORKER	5	1.00	f	1292	\N
9193	2	PREFIX-00008-00001-00001	WORKER	4	1.00	f	8793	\N
10409	9	PREFIX-00002-00012-00001	WORKER	12	1.00	f	10109	\N
1679	43	PREFIX-00001-00021-00001	WORKER	10	1.00	f	1293	\N
6878	34	PREFIX-00002-00005-00001	WORKER	10	1.00	f	6578	\N
6935	10	PREFIX-00003-00001-00001	WORKER	100	1.00	f	6620	\N
6879	34	PREFIX-00002-00006-00001	WORKER	10	1.00	f	6579	\N
6884	26	PREFIX-00002-00008-00001	WORKER	50	1.00	f	6587	\N
6885	26	PREFIX-00002-00009-00001	WORKER	100	1.00	f	6588	\N
14950	2	PREFIX-00002-00015-00001	WORKER	10	1.00	f	14650	\N
6936	10	PREFIX-00003-00002-00001	WORKER	3	1.00	f	6621	\N
6937	10	PREFIX-00003-00003-00001	WORKER	10	1.00	f	6622	\N
1703	31	PREFIX-00001-00033-00001	WORKER	15	1.00	f	2330	\N
6938	10	PREFIX-00003-00006-00001	WORKER	10	1.00	f	6624	\N
1680	43	PREFIX-00001-00022-00001	WORKER	15	1.00	f	1294	\N
1681	43	PREFIX-00001-00023-00001	WORKER	5	1.00	f	1295	\N
9220	12	PREFIX-00009-00008-00001	WORKER	50	1.00	f	8832	\N
9221	12	PREFIX-00009-00009-00001	WORKER	100	1.00	f	8833	\N
1682	43	PREFIX-00001-00024-00001	WORKER	20	1.00	f	1296	\N
6939	10	PREFIX-00003-00007-00001	WORKER	10	1.00	f	6625	\N
8689	6	PREFIX-00003-00010-00001	WORKER	34	1.00	f	8590	\N
1704	31	PREFIX-00001-00034-00001	WORKER	10	1.00	f	2331	\N
1705	31	PREFIX-00001-00035-00001	WORKER	20	1.00	f	2332	\N
1630	46	PREFIX-00001-00003-00001	WORKER	30	1.00	f	1233	\N
6940	10	PREFIX-00003-00008-00001	WORKER	50	1.00	f	6627	\N
6941	10	PREFIX-00003-00009-00001	WORKER	100	1.00	f	6628	\N
1631	46	PREFIX-00001-00004-00001	WORKER	30	1.00	f	1234	\N
1632	46	PREFIX-00001-00005-00001	WORKER	35	1.00	f	1235	\N
1633	46	PREFIX-00001-00006-00001	WORKER	35	1.00	f	1236	\N
8697	4	PREFIX-00005-00001-00001	WORKER	5	1.00	f	8602	\N
8707	5	PREFIX-00007-00001-00001	WORKER	10	1.00	f	8620	\N
10405	15	PREFIX-00002-00011-00001	WORKER	5	1.00	f	10105	\N
10413	13	PREFIX-00002-00013-00001	WORKER	40	1.00	f	10113	\N
1662	44	PREFIX-00001-00015-00001	WORKER	5	1.00	f	1273	\N
1663	44	PREFIX-00001-00016-00001	WORKER	5	1.00	f	1274	\N
1664	44	PREFIX-00001-00017-00001	WORKER	2	1.00	f	1275	\N
5989	41	PREFIX-00002-00001-00001	WORKER	100	1.00	f	5698	\N
6872	36	PREFIX-00002-00002-00001	WORKER	5	1.00	f	6569	\N
6873	36	PREFIX-00002-00003-00001	WORKER	10	1.00	f	6570	\N
1708	40	PREFIX-00001-00028-00001	WORKER	25	1.00	f	2335	\N
2465	36	PREFIX-00001-00045-00001	WORKER	15	1.00	f	2397	\N
2466	36	PREFIX-00001-00046-00001	WORKER	10	1.00	f	2398	\N
2467	36	PREFIX-00001-00047-00001	WORKER	15	1.00	f	2399	\N
6911	1	044fd33e-1455-4d40-8172-509ba195a90b	WORKER	10	1.00	f	\N	8015
6912	1	c6fae1e1-d314-4a57-b9b8-a03794f05cdc	WORKER	50	1.00	f	\N	8017
6913	1	33785d51-31b2-4893-af2f-57f7af3474f1	WORKER	100	1.00	f	\N	8018
2468	36	PREFIX-00001-00048-00001	WORKER	20	1.00	f	2400	\N
2471	36	PREFIX-00001-00051-00001	WORKER	20	1.00	f	2403	\N
2469	36	PREFIX-00001-00049-00001	WORKER	20	1.00	f	2401	\N
8704	2	PREFIX-00006-00002-00001	WORKER	10	1.00	f	8613	\N
1659	44	PREFIX-00001-00012-00001	WORKER	5	1.00	f	1270	\N
1660	44	PREFIX-00001-00013-00001	WORKER	5	1.00	f	1271	\N
2439	30	PREFIX-00001-00041-00001	WORKER	5	1.00	f	2363	\N
1707	31	PREFIX-00001-00027-00001	WORKER	25	1.00	f	2334	\N
2443	29	PREFIX-00001-00043-00001	WORKER	10	1.00	f	2371	\N
1661	44	PREFIX-00001-00014-00001	WORKER	2	1.00	f	1272	\N
9215	12	PREFIX-00009-00001-00001	WORKER	100	1.00	f	8825	\N
9216	12	PREFIX-00009-00002-00001	WORKER	5	1.00	f	8826	\N
9217	12	PREFIX-00009-00003-00001	WORKER	10	1.00	f	8827	\N
9218	12	PREFIX-00009-00006-00001	WORKER	10	1.00	f	8829	\N
9219	12	PREFIX-00009-00007-00001	WORKER	10	1.00	f	8830	\N
6907	1	eca18c3f-6dc2-4712-bb96-3afe9bb9f570	WORKER	100	1.00	f	\N	8010
6908	1	96998447-6d36-480b-ba45-ba8cf061811d	WORKER	5	1.00	f	\N	8011
6909	1	7da5281d-62fd-4f76-89b2-8c19ce4b5b33	WORKER	10	1.00	f	\N	8012
5966	13	PREFIX-00001-00067-00001	WORKER	10	1.00	f	5663	\N
6910	1	185c8209-8bff-4bd7-a324-723a58dc7366	WORKER	10	1.00	f	\N	8014
8692	2	PREFIX-00004-00010-00001	WORKER	8	1.00	f	8593	\N
8703	2	PREFIX-00006-00001-00001	WORKER	10	1.00	f	8612	\N
6963	4	PREFIX-00004-00001-00001	WORKER	100	1.00	f	6660	\N
6964	4	PREFIX-00004-00002-00001	WORKER	5	1.00	f	6661	\N
6965	4	PREFIX-00004-00003-00001	WORKER	10	1.00	f	6662	\N
6966	4	PREFIX-00004-00006-00001	WORKER	10	1.00	f	6664	\N
6967	4	PREFIX-00004-00007-00001	WORKER	10	1.00	f	6665	\N
6968	4	PREFIX-00004-00008-00001	WORKER	50	1.00	f	8586	\N
8686	4	PREFIX-00004-00009-00001	WORKER	100	1.00	f	8587	\N
2470	36	PREFIX-00001-00050-00001	WORKER	30	1.00	f	2402	\N
1709	40	PREFIX-00001-00029-00001	WORKER	25	1.00	f	2336	\N
2484	34	PREFIX-00001-00054-00001	WORKER	10	1.00	f	2423	\N
2485	34	PREFIX-00001-00055-00001	WORKER	20	1.00	f	3636	\N
2486	34	PREFIX-00001-00056-00001	WORKER	20	1.00	f	3638	\N
1710	40	PREFIX-00001-00030-00001	WORKER	20	1.00	f	2337	\N
2487	34	PREFIX-00001-00057-00001	WORKER	20	1.00	f	3639	\N
2506	33	PREFIX-00001-00060-00001	WORKER	10	1.00	f	3665	\N
1711	40	PREFIX-00001-00031-00001	WORKER	15	1.00	f	2338	\N
2507	33	PREFIX-00001-00061-00001	WORKER	20	1.00	f	3666	\N
2508	33	PREFIX-00001-00062-00001	WORKER	5	1.00	f	3667	\N
2509	33	PREFIX-00001-00063-00001	WORKER	30	1.00	f	3668	\N
2510	33	PREFIX-00001-00064-00001	WORKER	15	1.00	f	3670	\N
2511	33	PREFIX-00001-00065-00001	WORKER	10	1.00	f	3671	\N
1712	40	PREFIX-00001-00032-00001	WORKER	15	1.00	f	2339	\N
5977	17	PREFIX-00001-00070-00001	WORKER	200	1.00	f	5678	\N
5978	17	PREFIX-00001-00071-00001	WORKER	233	1.00	f	5679	\N
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
8497	6663
15052	14649
15053	14649
10514	10104
10506	10104
6972	6577
6973	6577
6985	6586
6984	6586
6087	5697
6086	5697
8498	6663
8501	8585
8502	8585
8503	6659
8504	6659
8509	8601
8510	8601
8517	8619
8516	8619
9293	8792
9294	8792
1755	1232
1724	1232
1740	1232
1739	1232
1723	1232
1756	1232
1759	1267
1760	1267
1768	1269
1767	1269
1785	1290
1777	1290
1778	1290
1794	1290
1786	1290
1793	1290
4452	2329
3013	2329
3014	2329
3775	2329
2942	2329
2941	2329
3774	2329
1799	2329
2981	2329
1798	2329
1810	2370
2946	2370
3779	2370
4456	2370
3017	2370
3018	2370
2945	2370
2985	2370
2982	2329
4453	2329
1807	2358
3016	2358
4454	2358
2983	2358
3776	2358
4455	2358
2944	2358
3015	2358
2943	2358
2984	2358
1806	2358
3777	2358
4457	2370
1811	2370
2986	2370
3778	2370
2987	2396
2988	2396
2956	2396
2955	2396
3780	2396
3781	2396
3020	2396
3019	2396
4458	2396
4459	2396
4461	2422
3782	2422
3025	2422
3783	2422
3024	2422
4460	2422
3784	3637
4462	3637
3785	3637
4463	3637
8513	8611
8514	8611
3029	3637
3737	3637
4465	3664
3792	3664
3791	3664
4464	3664
3797	3669
3796	3669
7031	6623
7032	6623
7038	6619
7037	6619
7036	6626
7035	6626
4466	3669
4467	3669
6062	5686
6082	5686
6081	5686
6063	5686
1741	1215
1769	1215
1770	1215
1742	1215
1726	1215
1725	1215
6067	5677
6083	5677
6084	5677
6066	5677
10510	10104
6980	6577
6981	6577
9340	8828
9339	8828
9345	8824
9346	8824
9343	8831
9344	8831
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
5454	1	5051
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
909	1	6314b067-13b1-49d8-89b6-8dd9849b2fa8	Imported materials without category	f	\N
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
9494	USER	1	WRITE_AUTHORIZATION	8792	1112	\N
9495	USER	6	WRITE_AUTHORIZATION	8824	1112	\N
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
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
8611	\N	\N	t	2	0.00	0.00	20	\N	\N	0	\N	303
6619	\N	\N	t	10	0.00	0.00	317	\N	\N	0	\N	303
8619	\N	\N	t	1	0.00	0.00	10	\N	\N	0	\N	303
8792	\N	\N	t	1	0.00	0.00	4	\N	\N	0	\N	303
8601	ahora	\N	t	2	0.00	0.00	25	ref1	\N	0	\N	303
1215	\N	\N	t	74	0.00	0.00	1590	\N	\N	0	\N	303
5697	javier	\N	t	15	0.00	0.00	352	\N	\N	0	\N	303
8824	\N	\N	t	9	0.00	0.00	285	\N	\N	0	\N	303
6659	\N	\N	t	10	0.00	0.00	293	\N	\N	0	\N	303
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, sum_charged_hours_id, positionincontainer) FROM stdin;
8590	6	elem 45	\N	PREFIX-00003-00010	\N	\N	0.00	f	6619	\N	\N	8299	5
10109	14	elem 3	\N	PREFIX-00002-00012	\N	\N	0.00	f	5697	\N	\N	10234	2
8619	5	p8	\N	PREFIX-00007	2010-10-26 12:45:44.823	\N	0.00	f	\N	\N	\N	8328	\N
8620	5	e1	\N	PREFIX-00007-00001	\N	\N	0.00	f	8619	\N	\N	8329	0
8792	2	p10	\N	PREFIX-00008	2010-10-26 18:56:17.063	\N	0.00	f	\N	\N	\N	8893	\N
8793	2	e1	\N	PREFIX-00008-00001	\N	\N	0.00	f	8792	\N	\N	8894	0
2399	36	Generación de gráficas variables de distinto tipo	\N	PREFIX-00001-00047	\N	\N	0.00	f	2396	\N	\N	4646	3
2400	36	Generación de gráficas de variables cruzadas	\N	PREFIX-00001-00048	\N	\N	0.00	f	2396	\N	\N	4647	4
2403	36	Generar informes en HTML y PDF	\N	PREFIX-00001-00051	\N	\N	0.00	f	2396	\N	\N	4648	5
2401	36	Exportación de datos a diversos formatos	\N	PREFIX-00001-00049	\N	\N	0.00	f	2396	\N	\N	4649	6
2402	36	Mostrado de datos sobre el mapa	\N	PREFIX-00001-00050	\N	\N	0.00	f	2396	\N	\N	4650	7
2422	34	Módulo de software de nodos	\N	PREFIX-00001-00052	\N	\N	0.00	f	1215	\N	\N	4651	8
2336	41	Adaptación del software de los nodos al protocolo de Zabbix	\N	PREFIX-00001-00029	\N	\N	0.00	f	2422	\N	\N	4652	0
1269	44	Módulo de usuarios y permisos	\N	PREFIX-00001-00010	\N	\N	0.00	f	1215	\N	\N	1939	2
1267	44	Análisis	\N	PREFIX-00001-00009	\N	\N	0.00	f	1215	\N	\N	1936	1
1239	47	Especificación de requisitos	\N	PREFIX-00001-00002	\N	\N	0.00	f	1267	\N	\N	1937	0
1268	44	Análisis funcional	\N	PREFIX-00001-00011	\N	\N	0.00	f	1267	\N	\N	1938	1
1290	43	Módulo de nodos y sensores	\N	PREFIX-00001-00018	\N	\N	0.00	f	1215	\N	\N	2016	3
1291	43	Gestión de nodos	\N	PREFIX-00001-00019	\N	\N	0.00	f	1290	\N	\N	2017	0
1292	43	Gestión de redes (o grupos) de nodos	\N	PREFIX-00001-00020	\N	\N	0.00	f	1290	\N	\N	2018	1
1293	43	Configuración de nodos	\N	PREFIX-00001-00021	\N	\N	0.00	f	1290	\N	\N	2019	2
1294	43	Gestión de sensores	\N	PREFIX-00001-00022	\N	\N	0.00	f	1290	\N	\N	2222	3
1295	43	Configuración de offset y escalado por sensor	\N	PREFIX-00001-00023	\N	\N	0.00	f	1290	\N	\N	2223	4
1296	43	Exportación de configuración de un nodo	\N	PREFIX-00001-00024	\N	\N	0.00	f	1290	\N	\N	2224	5
2329	41	Módulo de monitorización	\N	PREFIX-00001-00025	\N	\N	0.00	f	1215	\N	\N	4426	4
2330	41	Monitorización bajo demanda	\N	PREFIX-00001-00033	\N	\N	0.00	f	2329	\N	\N	4427	0
2331	41	Localización nodos en un mapa	\N	PREFIX-00001-00034	\N	\N	0.00	f	2329	\N	\N	4428	1
2332	41	Configuración de los mapas y la geolocalización de los sensores	\N	PREFIX-00001-00035	\N	\N	0.00	f	2329	\N	\N	4429	2
2398	36	Generación de gráficas para una o varias variables en el tiempo	\N	PREFIX-00001-00046	\N	\N	0.00	f	2396	\N	\N	4443	2
2423	34	Consulta de la configuración al servidor	\N	PREFIX-00001-00054	\N	\N	0.00	f	2422	\N	\N	4653	1
3636	34	Interfaz para permitir la modificación de la configuración remotamente	\N	PREFIX-00001-00055	\N	\N	0.00	f	2422	\N	\N	4654	2
8593	2	elem c3	\N	PREFIX-00004-00010	\N	\N	0.00	f	6659	\N	\N	8302	5
2359	40	Almacenamiento de datos en una base de datos	\N	PREFIX-00001-00037	\N	\N	0.00	f	2358	\N	\N	4432	1
2360	40	Paso de datos a histórico	\N	PREFIX-00001-00038	\N	\N	0.00	f	2358	\N	\N	4433	2
2361	40	Configuración tiempo de vida de los datos recientes	\N	PREFIX-00001-00039	\N	\N	0.00	f	2358	\N	\N	4434	3
2362	40	Gestión de datos históricos	\N	PREFIX-00001-00040	\N	\N	0.00	f	2358	\N	\N	4435	4
2363	40	Detección de falta de recursos de almacenamiento	\N	PREFIX-00001-00041	\N	\N	0.00	f	2358	\N	\N	4436	5
2370	39	Módulo de alarmas	\N	PREFIX-00001-00042	\N	\N	0.00	f	1215	\N	\N	4437	6
8828	12	elem grande	\N	PREFIX-00009-00004	\N	\N	0.00	f	8824	8013	\N	8929	3
8829	12	elem 3.1	\N	PREFIX-00009-00006	\N	\N	0.00	f	8828	8014	\N	8930	0
2334	41	Gestión de alarmas	\N	PREFIX-00001-00027	\N	\N	0.00	f	2370	\N	\N	4438	0
2371	39	Envío de notificaciones por email y SMS	\N	PREFIX-00001-00043	\N	\N	0.00	f	2370	\N	\N	4439	1
2396	36	Módulo de consulta de datos	\N	PREFIX-00001-00044	\N	\N	0.00	f	1215	\N	\N	4440	7
2335	41	Cálculo y mostrado de estadísticas	\N	PREFIX-00001-00028	\N	\N	0.00	f	2396	\N	\N	4441	0
2397	36	Cálculo del valor real basado en offset y escalado	\N	PREFIX-00001-00045	\N	\N	0.00	f	2396	\N	\N	4442	1
3638	34	Pruebas funcionales del sistema	\N	PREFIX-00001-00056	\N	\N	0.00	f	3637	\N	\N	4656	0
2337	41	Pruebas de aceptación	\N	PREFIX-00001-00030	\N	\N	0.00	f	3637	\N	\N	4657	1
8830	12	elem grande (copy)	\N	PREFIX-00009-00007	\N	\N	0.00	f	8828	8015	\N	8931	1
1215	56	Servidor sens2net	\N	PREFIX-00001	2010-11-01 00:00:00	\N	0.00	f	\N	\N	\N	1316	\N
1232	46	Coordinación	\N	PREFIX-00001-00001	\N	\N	0.00	f	1215	\N	\N	1929	0
1233	46	Planificación semanal	\N	PREFIX-00001-00003	\N	\N	0.00	f	1232	\N	\N	1930	0
1234	46	Informes semanales	\N	PREFIX-00001-00004	\N	\N	0.00	f	1232	\N	\N	1931	1
1235	46	Comunicaciones internas y externas	\N	PREFIX-00001-00005	\N	\N	0.00	f	1232	\N	\N	1932	2
1236	46	Reuniones de coordinación	\N	PREFIX-00001-00006	\N	\N	0.00	f	1232	\N	\N	1933	3
1237	46	Control de calidad	\N	PREFIX-00001-00007	\N	\N	0.00	f	1232	\N	\N	1934	4
1238	46	Seguimiento	\N	PREFIX-00001-00008	\N	\N	0.00	f	1232	\N	\N	1935	5
2358	40	Módulo de gestión de datos	\N	PREFIX-00001-00036	\N	\N	0.00	f	1215	\N	\N	4430	5
2333	41	Importación de datos enviados por los nodos	\N	PREFIX-00001-00026	\N	\N	0.00	f	2358	\N	\N	4431	0
8824	12	pedido 5	\N	PREFIX-00009	2010-10-26 19:02:28.325	\N	0.07	f	\N	8009	\N	8925	\N
3639	34	Corrección de bugs	\N	PREFIX-00001-00057	\N	\N	0.00	f	3637	\N	\N	4658	2
8825	12	elem 1	\N	PREFIX-00009-00001	\N	\N	0.20	f	8824	8010	\N	8926	0
5677	18	dxrxsdrsdxresxuiui	\N	PREFIX-00001-00069	\N	\N	0.00	f	1215	\N	\N	6379	14
8826	12	elem 1	\N	PREFIX-00009-00002	\N	\N	0.00	f	8824	8011	\N	8927	1
8827	12	elem 2	\N	PREFIX-00009-00003	\N	\N	0.00	f	8824	8012	\N	8928	2
3666	33	Puesta en producción	\N	PREFIX-00001-00061	\N	\N	0.00	f	3664	\N	\N	4662	2
3667	33	Soporte de localización (idiomas)	\N	PREFIX-00001-00062	\N	\N	0.00	f	3664	\N	\N	4663	3
3668	33	Redacción del plan de escalabilidad	\N	PREFIX-00001-00063	\N	\N	0.00	f	3664	\N	\N	4664	4
6626	10	elem c2	\N	PREFIX-00003-00005	\N	\N	0.00	f	6619	8016	\N	6739	4
6619	11	pedido 5	\N	PREFIX-00003	2010-10-26 12:17:00.095	\N	0.00	f	\N	8009	\N	6732	\N
6620	10	elem 1	\N	PREFIX-00003-00001	\N	\N	0.00	f	6619	8010	\N	6733	0
6621	10	elem 1	\N	PREFIX-00003-00002	\N	\N	0.00	f	6619	8011	\N	6734	1
6622	10	elem 2	\N	PREFIX-00003-00003	\N	\N	0.00	f	6619	8012	\N	6735	2
6623	10	elem grande	\N	PREFIX-00003-00004	\N	\N	0.00	f	6619	8013	\N	6736	3
6624	10	elem 3.1	\N	PREFIX-00003-00006	\N	\N	0.00	f	6623	8014	\N	6737	0
6625	10	elem grande (copy)	\N	PREFIX-00003-00007	\N	\N	0.00	f	6623	8015	\N	6738	1
6588	27	elem c2 (copy)	\N	PREFIX-00002-00009	\N	\N	0.00	f	6586	\N	\N	6701	1
6570	36	elem 2 (copy)	\N	PREFIX-00002-00003	\N	\N	0.00	f	14649	\N	\N	6671	0
8831	12	elem c2	\N	PREFIX-00009-00005	\N	\N	0.00	f	8824	8016	\N	8932	4
5697	50	pedido 5	\N	PREFIX-00002	2010-10-25 19:41:05.571	\N	0.11	f	\N	\N	\N	6391	\N
8832	12	c1.1	\N	PREFIX-00009-00008	\N	\N	0.00	f	8831	8017	\N	8933	0
8833	12	elem c2 (copy)	\N	PREFIX-00009-00009	\N	\N	0.00	f	8831	8018	\N	8934	1
3669	33	Documentación	\N	PREFIX-00001-00059	\N	\N	0.00	f	1215	\N	\N	4665	11
3670	33	Documentación de usuario	\N	PREFIX-00001-00064	\N	\N	0.00	f	3669	\N	\N	4666	0
3671	33	Documentación de administrador de red	\N	PREFIX-00001-00065	\N	\N	0.00	f	3669	\N	\N	4667	1
8601	4	pedido 6	ahora	PREFIX-00005	2010-10-26 12:35:21.365	\N	0.00	f	\N	\N	\N	8310	\N
8602	4	e1	\N	PREFIX-00005-00001	\N	\N	0.00	f	8601	\N	\N	8311	0
8603	4	e2	\N	PREFIX-00005-00002	\N	\N	0.00	f	8601	\N	\N	8312	1
2339	41	Documentación de administrador de sistema	\N	PREFIX-00001-00032	\N	\N	0.00	f	3669	\N	\N	4668	2
5686	17	elem	\N	PREFIX-00001-00072	\N	\N	0.00	f	1215	\N	\N	6376	13
5667	19	elem (copy)	\N	PREFIX-00001-00068	\N	\N	0.00	f	5686	\N	\N	6377	0
5687	17	jkljlkljkl	\N	PREFIX-00001-00073	\N	\N	0.00	f	5686	\N	\N	6378	1
5679	18	sxezaseswe	\N	PREFIX-00001-00071	\N	\N	0.00	f	5677	\N	\N	6381	1
5691	11	elem ultimo	\N	PREFIX-00001-00074	\N	\N	0.00	f	1215	\N	\N	6385	15
1270	44	Gestión de usuarios	\N	PREFIX-00001-00012	\N	\N	0.00	f	1269	\N	\N	1940	0
5698	41	elem 1	\N	PREFIX-00002-00001	\N	\N	0.40	f	5697	\N	\N	6392	0
6569	36	elem 1 (copy)	\N	PREFIX-00002-00002	\N	\N	0.00	f	10104	\N	\N	6670	0
10113	13	elem tris	\N	PREFIX-00002-00013	\N	\N	0.00	f	10104	\N	\N	10233	2
2338	41	Instalacion y configuración del servidor central con Zabbix	\N	PREFIX-00001-00031	\N	\N	0.00	f	3664	\N	\N	4661	1
1271	44	Gestión de permisos	\N	PREFIX-00001-00013	\N	\N	0.00	f	1269	\N	\N	1941	1
1272	44	Asignación de permisos a usuarios	\N	PREFIX-00001-00014	\N	\N	0.00	f	1269	\N	\N	1942	2
1273	44	Autenticación de usuarios	\N	PREFIX-00001-00015	\N	\N	0.00	f	1269	\N	\N	1943	3
6577	35	elem grande	\N	PREFIX-00002-00004	\N	\N	0.00	f	5697	\N	\N	6690	4
1274	44	Gestión de grupos de usuarios	\N	PREFIX-00001-00016	\N	\N	0.00	f	1269	\N	\N	1944	4
6578	35	elem 3.1	\N	PREFIX-00002-00005	\N	\N	0.00	f	6577	\N	\N	6691	0
6579	34	elem grande (copy)	\N	PREFIX-00002-00006	\N	\N	0.00	f	6577	\N	\N	6692	1
6586	27	elem c2	\N	PREFIX-00002-00007	\N	\N	0.00	f	5697	\N	\N	6699	5
6587	26	c1.1	\N	PREFIX-00002-00008	\N	\N	0.00	f	6586	\N	\N	6700	0
1275	44	Asignación de permisos a grupos de usuarios	\N	PREFIX-00001-00017	\N	\N	0.00	f	1269	\N	\N	1945	5
6627	10	c1.1	\N	PREFIX-00003-00008	\N	\N	0.00	f	6626	8017	\N	6740	0
6628	10	elem c2 (copy)	\N	PREFIX-00003-00009	\N	\N	0.00	f	6626	8018	\N	6741	1
3637	34	Pruebas	\N	PREFIX-00001-00053	\N	\N	0.00	f	1215	\N	\N	4655	9
3664	33	Entorno e intraestrutura	\N	PREFIX-00001-00058	\N	\N	0.00	f	1215	\N	\N	4659	10
3665	33	Montaje de entorno de desarrollo	\N	PREFIX-00001-00060	\N	\N	0.00	f	3664	\N	\N	4660	0
5663	20	hola	\N	PREFIX-00001-00067	\N	\N	0.00	f	1215	\N	\N	6375	12
5678	18	klhjuiohjihjhllhjl	\N	PREFIX-00001-00070	\N	\N	0.00	f	5677	\N	\N	6380	0
10104	15	elem 1	\N	PREFIX-00002-00010	\N	\N	0.00	f	5697	\N	\N	10231	1
10105	15	elem nuevo	\N	PREFIX-00002-00011	\N	\N	0.00	f	10104	\N	\N	10232	1
14649	2	elem 2	\N	PREFIX-00002-00014	\N	\N	0.00	f	5697	\N	\N	14750	3
14650	2	elem hijo	\N	PREFIX-00002-00015	\N	\N	0.00	f	14649	\N	\N	14751	1
6660	4	elem 1	\N	PREFIX-00004-00001	\N	\N	0.00	f	6659	8010	\N	8288	0
6661	4	elem 1	\N	PREFIX-00004-00002	\N	\N	0.00	f	6659	8011	\N	8289	1
6662	4	elem 2	\N	PREFIX-00004-00003	\N	\N	0.00	f	6659	8012	\N	8290	2
6663	4	elem grande	\N	PREFIX-00004-00004	\N	\N	0.00	f	6659	8013	\N	8291	3
6664	4	elem 3.1	\N	PREFIX-00004-00006	\N	\N	0.00	f	6663	8014	\N	8292	0
6665	4	elem grande (copy)	\N	PREFIX-00004-00007	\N	\N	0.00	f	6663	8015	\N	8293	1
8585	4	elem c2	\N	PREFIX-00004-00005	\N	\N	0.00	f	6659	8016	\N	8294	4
8586	4	c1.1	\N	PREFIX-00004-00008	\N	\N	0.00	f	8585	8017	\N	8295	0
8587	4	elem c2 (copy)	\N	PREFIX-00004-00009	\N	\N	0.00	f	8585	8018	\N	8296	1
6659	5	pedido 5	\N	PREFIX-00004	2010-10-26 12:19:27.806	\N	0.00	f	\N	8009	\N	8287	\N
8611	2	p7	\N	PREFIX-00006	2010-10-26 12:37:59.275	\N	0.00	f	\N	\N	\N	8320	\N
8612	2	e1	\N	PREFIX-00006-00001	\N	\N	0.00	f	8611	\N	\N	8321	0
8613	2	e2	\N	PREFIX-00006-00002	\N	\N	0.00	f	8611	\N	\N	8322	1
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
8009	1	pedido 5	\N	PREFIX-00002	0	\N	3	\N	\N
8010	1	elem 1	\N	PREFIX-00002-00001	\N	\N	0	8009	0
8011	1	elem 1	\N	PREFIX-00002-00002	\N	\N	0	8009	1
8012	1	elem 2	\N	PREFIX-00002-00003	\N	\N	0	8009	2
8013	1	elem grande	\N	PREFIX-00002-00004	\N	\N	3	8009	3
8016	1	elem c2	\N	PREFIX-00002-00007	\N	\N	3	8009	4
8014	1	elem 3.1	\N	PREFIX-00002-00005	\N	\N	0	8013	0
8015	1	elem grande (copy)	\N	PREFIX-00002-00006	\N	\N	0	8013	1
8017	1	c1.1	\N	PREFIX-00002-00008	\N	\N	0	8016	0
8018	1	elem c2 (copy)	\N	PREFIX-00002-00009	\N	\N	0	8016	1
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
2333	1
2359	1
2360	1
2361	1
2362	1
2363	1
2334	1
2371	1
2335	1
2397	1
2398	1
2399	1
2400	1
2403	1
2401	1
2402	1
2336	1
2423	1
8602	1
8603	1
1233	1
1234	1
1235	1
1236	1
8593	1
6660	1
6661	1
6662	1
6664	1
1237	1
1238	1
6665	1
1239	1
1268	1
1291	1
8586	1
8587	1
1292	1
1293	1
8612	1
8613	1
1294	1
1295	1
3636	1
3638	1
2337	1
3639	1
3665	1
2338	1
3666	1
14650	1
5698	1
6569	1
10105	1
10113	1
10109	1
6570	1
6578	1
6579	1
6587	1
6588	1
1296	1
2330	1
3667	1
3668	1
3670	1
3671	1
2339	1
5663	1
5667	1
5687	1
5678	1
5679	1
5691	1
1270	1
1271	1
1272	1
1273	1
1274	1
1275	1
6620	1
6621	1
6622	1
6624	1
6625	1
8590	1
6627	1
6628	1
8825	1
8826	1
8827	1
8829	1
8830	1
8832	1
8620	1
8833	1
8793	1
2331	1
2332	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1215
1232
1267
1269
1290
2329
2358
2370
2396
2422
3637
3664
3669
5677
5686
5697
6577
6586
6619
6623
6626
6659
6663
8585
8601
8611
8619
8792
8824
8828
8831
10104
14649
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
8009
8013
8016
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
8010	0
8011	0
8012	0
8014	0
8015	0
8017	0
8018	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	11	PREFIX	9	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
8009	303
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
8200	8	2010-10-26 13:15:53.865	707
9093	2	2010-10-26 18:56:51.941	707
8192	4	2010-11-03 16:34:12.077	707
8188	5	2010-10-26 12:33:58.567	707
8196	2	2010-10-26 12:38:21.193	707
1518	77	2010-11-09 11:18:39.694	707
8184	13	2010-10-26 13:13:18.212	707
6467	62	2010-11-10 18:44:09.055	707
9097	17	2010-11-10 19:50:13.417	707
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
5051	1	47b0c846-a0d8-4018-aa2e-023ebec333d7	t	t	5151
12727	1	eccd44b1-73bb-4d7d-ba14-391cff429f65	t	f	12827
12729	1	91b17f1b-911f-48b4-84db-7b341e8f6bb2	t	f	12828
7275	7	be91f28d-69d9-490f-81a7-3c74091ea792	t	f	7374
7273	6	f21a027f-fbb7-428e-874f-d6c76d5fb89c	t	f	7373
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
12135	2	1.00	\N	10	7077	\N
12136	2	1.00	\N	10	7074	\N
7676	14	1.00	\N	100	6171	\N
13235	0	1.00	\N	50	7080	\N
13236	0	1.00	\N	100	7081	\N
10812	3	0.50	\N	55	1827	\N
10808	5	1.00	\N	200	6168	\N
10810	4	1.00	\N	233	6169	\N
9595	5	1.00	\N	100	9395	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
5151	1
12827	1
12828	1
7374	1
7373	1
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
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
1215	1518	707
5697	6467	707
6619	8184	707
6659	8188	707
8601	8192	707
8611	8196	707
8619	8200	707
8792	9093	707
8824	9097	707
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
1215	1417	1518
1232	1434	1518
1233	1435	1518
1234	1436	1518
1235	1437	1518
1236	1438	1518
1237	1439	1518
1238	1440	1518
1239	1441	1518
1267	2037	1518
1268	2039	1518
1269	2040	1518
1270	2041	1518
1271	2042	1518
1272	2043	1518
1273	2044	1518
1274	2045	1518
1275	2046	1518
1290	2061	1518
1291	2062	1518
1292	2063	1518
1293	2064	1518
1294	2065	1518
1295	2066	1518
1296	2067	1518
2329	2146	1518
2330	2147	1518
2331	2148	1518
2332	2149	1518
2333	2150	1518
2334	2151	1518
2335	2152	1518
2336	2153	1518
2337	2154	1518
2338	2155	1518
2339	2156	1518
2358	2212	1518
2359	2214	1518
2360	2215	1518
2361	2216	1518
2362	2217	1518
2363	2218	1518
2370	2596	1518
2371	2598	1518
2396	3179	1518
2397	3181	1518
2398	3182	1518
2399	3183	1518
2400	3184	1518
2401	3185	1518
2402	3186	1518
2403	3187	1518
2422	3523	1518
2423	3525	1518
3636	3526	1518
3637	3527	1518
3638	3528	1518
3639	3530	1518
3664	4091	1518
3665	4092	1518
3666	4094	1518
3667	4095	1518
3668	4096	1518
3669	4097	1518
3670	4098	1518
3671	4099	1518
5663	5865	1518
5667	5873	1518
5677	5891	1518
5678	5892	1518
5679	5893	1518
5686	5916	1518
5687	5918	1518
5691	6284	1518
5697	6290	6467
5698	6291	6467
6569	6771	6467
6570	6772	6467
6577	6779	6467
6578	6780	6467
6579	6781	6467
6586	6800	6467
6587	6801	6467
6588	6802	6467
6619	6833	8184
6620	6834	8184
6621	6835	8184
6622	6836	8184
6623	6837	8184
6624	6838	8184
6625	6839	8184
6626	6840	8184
6627	6841	8184
6628	6842	8184
6659	8388	8188
6660	8389	8188
6661	8390	8188
6662	8391	8188
6663	8392	8188
6664	8393	8188
6665	8394	8188
8585	8395	8188
8586	8396	8188
8587	8397	8188
8590	8400	8184
8593	8403	8188
8601	8411	8192
8602	8412	8192
8603	8413	8192
8611	8421	8196
8612	8422	8196
8613	8423	8196
8619	8429	8200
8620	8430	8200
8792	8994	9093
8793	8995	9093
8824	9026	9097
8825	9027	9097
8826	9028	9097
8827	9029	9097
8828	9030	9097
8829	9031	9097
8830	9032	9097
8831	9033	9097
8832	9034	9097
8833	9035	9097
10104	10306	6467
10105	10307	6467
10109	10319	6467
10113	10334	6467
14649	14851	6467
14650	14852	6467
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
1466	2	3	1232
1467	2	0	1233
1468	2	0	1234
1469	2	0	1235
1470	2	0	1236
1471	2	0	1237
1472	2	0	1238
1473	2	4	1239
2117	2	3	1290
2118	2	0	1291
2119	2	0	1292
2030	2	3	1232
2031	2	0	1233
2032	2	0	1234
2033	2	0	1235
2034	2	0	1236
2035	2	0	1237
2036	2	0	1238
2120	2	0	1293
2038	2	0	1239
2121	2	0	1294
2122	2	0	1295
2123	2	0	1296
8400	6	0	8590
6290	46	2	5697
5943	2	4	5663
5944	2	3	5686
5945	2	0	5667
5946	2	0	5687
5947	2	3	5677
5948	2	0	5678
5949	2	0	5679
2089	2	3	1290
2090	2	0	1291
2091	2	0	1292
2092	2	0	1293
2093	2	0	1294
2094	2	0	1295
2095	2	0	1296
2208	2	4	2329
2209	2	4	2330
2210	2	4	2331
2211	2	4	2332
2213	2	4	2333
2219	2	4	2334
2220	2	4	2335
2221	2	4	2336
2525	2	4	2337
2526	2	4	2338
2527	2	4	2339
2762	2	3	2329
2763	2	0	2330
2764	2	0	2331
2765	2	0	2332
2766	2	3	2358
2767	2	0	2333
2768	2	0	2359
2769	2	0	2360
2770	2	0	2361
2771	2	0	2362
2772	2	0	2363
2773	2	3	2370
2774	2	0	2334
2775	2	0	2371
2585	2	4	2329
2586	2	4	2330
2587	2	4	2331
2588	2	4	2332
2589	2	4	2358
2590	2	4	2333
2591	2	4	2359
2592	2	4	2360
2593	2	4	2361
2594	2	4	2362
2595	2	4	2363
2597	2	4	2334
2599	2	4	2335
2600	2	4	2336
2601	2	4	2337
2602	2	4	2338
2603	2	4	2339
2776	2	4	2335
2777	2	4	2336
2778	2	4	2337
2779	2	4	2338
2780	2	4	2339
3273	2	3	2329
3274	2	0	2330
3275	2	0	2331
3276	2	0	2332
3277	2	3	2358
3165	2	3	2329
3166	2	0	2330
3167	2	0	2331
3168	2	0	2332
3169	2	3	2358
3170	2	0	2333
3171	2	0	2359
3172	2	0	2360
3173	2	0	2361
3174	2	0	2362
3175	2	0	2363
3176	2	3	2370
3177	2	0	2334
3178	2	0	2371
3180	2	0	2335
3188	2	4	2336
3189	2	4	2337
3190	2	4	2338
3191	2	4	2339
3278	2	0	2333
3279	2	0	2359
3280	2	0	2360
8421	2	3	8611
8422	2	0	8612
8423	2	0	8613
6291	41	0	5698
6771	38	0	6569
6772	36	0	6570
6800	28	3	6586
6801	28	0	6587
6802	27	0	6588
3281	2	0	2361
3282	2	0	2362
3283	2	0	2363
3284	2	3	2370
3285	2	0	2334
3286	2	0	2371
3287	2	3	2396
3288	2	0	2335
3289	2	0	2397
3290	2	0	2398
3291	2	0	2399
3292	2	0	2400
3293	2	0	2403
3294	2	0	2401
3295	2	0	2402
3296	2	4	2336
3297	2	4	2337
3298	2	4	2338
3299	2	4	2339
6274	2	0	5663
6275	2	3	5686
6276	2	0	5667
6277	2	0	5687
6278	2	3	5677
4060	2	3	2329
4061	2	0	2330
3500	2	3	2329
3501	2	0	2330
3502	2	0	2331
3503	2	0	2332
3504	2	3	2358
3505	2	0	2333
3506	2	0	2359
3507	2	0	2360
3508	2	0	2361
3509	2	0	2362
3510	2	0	2363
3511	2	3	2370
3512	2	0	2334
3513	2	0	2371
3514	2	3	2396
3515	2	0	2335
3516	2	0	2397
3517	2	0	2398
3518	2	0	2399
3519	2	0	2400
3520	2	0	2403
3521	2	0	2401
3522	2	0	2402
3524	2	0	2336
3529	2	0	2337
3531	2	4	2338
3532	2	4	2339
4062	2	0	2331
4063	2	0	2332
4064	2	3	2358
4065	2	0	2333
4066	2	0	2359
4067	2	0	2360
4068	2	0	2361
4069	2	0	2362
4070	2	0	2363
4071	2	3	2370
4072	2	0	2334
4073	2	0	2371
4074	2	3	2396
4075	2	0	2335
4076	2	0	2397
4077	2	0	2398
4078	2	0	2399
4079	2	0	2400
4080	2	0	2403
4081	2	0	2401
4082	2	0	2402
4083	2	3	2422
4084	2	0	2336
4085	2	0	2423
4086	2	0	3636
4087	2	3	3637
4088	2	0	3638
4089	2	0	2337
4090	2	0	3639
4093	2	0	2338
4100	2	0	2339
4325	2	3	2329
4326	2	0	2330
4327	2	0	2331
4328	2	0	2332
4329	2	3	2358
4330	2	0	2333
4331	2	0	2359
4332	2	0	2360
4333	2	0	2361
4334	2	0	2362
4335	2	0	2363
4336	2	3	2370
4337	2	0	2334
4338	2	0	2371
4339	2	3	2396
4340	2	0	2335
4341	2	0	2397
4342	2	0	2398
4545	2	0	2399
4546	2	0	2400
4547	2	0	2403
4548	2	0	2401
4549	2	0	2402
4550	2	3	2422
4551	2	0	2336
4552	2	0	2423
4553	2	0	3636
4554	2	3	3637
4555	2	0	3638
4556	2	0	2337
4557	2	0	3639
4558	2	3	3664
4559	2	0	3665
4560	2	0	2338
4561	2	0	3666
4562	2	0	3667
4563	2	0	3668
4564	2	3	3669
4565	2	0	3670
4566	2	0	3671
4567	2	0	2339
1436	44	0	1234
1437	44	0	1235
1438	44	0	1236
1439	44	0	1237
1440	44	0	1238
8403	2	0	8593
2037	44	3	1267
1441	45	0	1239
2039	44	0	1268
2061	41	3	1290
2062	41	0	1291
2063	41	0	1292
2064	41	0	1293
2065	41	0	1294
2066	41	0	1295
2067	41	0	1296
10317	2	2	10104
10318	2	4	10105
6833	10	3	6619
2146	32	4	2329
2147	32	4	2330
2148	32	4	2331
6834	10	0	6620
2149	32	4	2332
2212	32	4	2358
2150	32	4	2333
6835	10	0	6621
6836	10	0	6622
6837	10	3	6623
6838	10	0	6624
6839	10	0	6625
6840	10	3	6626
6841	10	0	6627
6842	10	0	6628
8429	5	3	8619
2214	32	4	2359
10319	13	4	10109
6779	34	3	6577
6780	34	0	6578
6781	33	0	6579
2215	32	4	2360
2216	32	4	2361
8430	5	0	8620
2217	32	4	2362
2040	44	3	1269
2041	44	0	1270
2042	44	0	1271
2043	44	0	1272
2044	44	0	1273
2045	44	0	1274
9026	12	3	8824
9027	12	0	8825
9028	12	0	8826
9029	12	0	8827
9030	12	3	8828
9031	12	0	8829
9032	12	0	8830
9033	12	3	8831
9034	12	0	8832
9035	12	0	8833
1417	52	2	1215
1434	44	3	1232
2046	44	0	1275
6279	2	0	5678
6280	2	0	5679
1435	44	0	1233
4096	32	0	3668
8411	4	3	8601
8412	4	0	8602
8413	4	0	8603
4097	33	2	3669
4098	32	0	3670
4099	32	0	3671
10332	2	2	10104
10333	2	4	10105
2156	32	4	2339
5865	14	4	5663
5916	14	4	5686
5873	14	4	5667
5918	14	4	5687
5891	15	3	5677
5892	15	0	5678
5893	15	0	5679
6284	11	4	5691
2218	32	4	2363
2596	32	4	2370
10335	2	4	10109
14852	2	0	14650
2151	32	4	2334
2598	32	4	2371
3179	33	2	2396
5872	2	4	5663
5889	2	4	5663
5890	2	4	5667
8388	4	3	6659
8389	4	0	6660
8390	4	0	6661
8391	4	0	6662
8392	4	3	6663
8393	4	0	6664
5915	2	4	5663
8394	4	0	6665
5917	2	4	5667
8395	4	3	8585
5919	2	4	5677
5920	2	4	5678
5921	2	4	5679
8396	4	0	8586
8397	4	0	8587
10306	13	2	10104
2152	32	4	2335
3181	32	0	2397
3182	32	0	2398
3183	32	0	2399
6791	2	2	6577
6792	2	4	6578
6793	2	0	6579
8994	2	3	8792
8995	2	0	8793
3184	32	0	2400
3187	32	0	2403
3185	32	0	2401
3186	32	0	2402
3523	33	2	2422
2153	32	4	2336
3525	32	0	2423
3526	32	0	3636
3527	33	2	3637
3528	32	0	3638
2154	32	4	2337
3530	32	0	3639
4091	33	2	3664
4092	32	0	3665
2155	32	4	2338
4094	32	0	3666
4095	32	0	3667
10307	13	4	10105
10334	13	4	10113
14851	2	3	14649
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
7676	7273
10812	7275
9595	7273
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario, enddate, durationinlastday, startdate, durationstartinfirstday) FROM stdin;
7777	14	7676	707	2010-11-11	14400	\N	\N
11515	3	10812	707	2010-11-20	0	\N	\N
9696	5	9595	707	2010-11-11	14400	\N	\N
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
1333	2	0	0
1334	2	0	0
1335	2	0	0
1336	2	0	0
1337	2	0	0
1338	2	0	0
1339	2	0	0
1340	2	0	0
1365	2	0	0
1366	2	0	0
1367	2	0	0
1368	2	0	0
1369	2	0	0
1370	2	0	0
1371	2	0	0
1372	2	0	0
5788	2	0	0
5789	2	0	0
5790	2	0	0
5791	2	0	0
5792	2	0	0
2251	2	0	0
1960	2	0	0
1961	2	0	0
1962	2	0	0
1963	2	0	0
1964	2	0	0
2252	2	0	0
2253	2	0	0
2254	2	0	0
2255	2	0	0
2256	2	0	0
2257	2	0	0
1965	2	0	0
1966	2	0	0
1988	2	0	0
1989	2	0	0
1990	2	0	0
1991	2	0	0
1992	2	0	0
1993	2	0	0
1994	2	0	0
2309	2	0	0
2310	2	0	0
2247	2	0	0
2248	2	0	0
2249	2	0	0
2250	2	0	0
2311	2	0	0
2312	2	0	0
2313	2	0	0
2314	2	0	0
2315	2	0	0
2316	2	0	0
2317	2	0	0
2318	2	0	0
2319	2	0	0
2320	2	0	0
2321	2	0	0
2322	2	0	0
2626	2	0	0
2627	2	0	0
2628	2	0	0
2686	2	0	0
2687	2	0	0
2688	2	0	0
2689	2	0	0
2690	2	0	0
2691	2	0	0
2692	2	0	0
2693	2	0	0
2694	2	0	0
2695	2	0	0
2696	2	0	0
2697	2	0	0
2698	2	0	0
2699	2	0	0
2700	2	0	0
2701	2	0	0
2702	2	0	0
2703	2	0	0
2704	2	0	0
3064	2	0	0
3065	2	0	0
3066	2	0	0
2863	2	0	0
2864	2	0	0
2865	2	0	0
2866	2	0	0
2867	2	0	0
2868	2	0	0
2869	2	0	0
2870	2	0	0
2871	2	0	0
2872	2	0	0
2873	2	0	0
2874	2	0	0
2875	2	0	0
2876	2	0	0
2877	2	0	0
2878	2	0	0
2879	2	0	0
2880	2	0	0
2881	2	0	0
3067	2	0	0
3068	2	0	0
3069	2	0	0
3070	2	0	0
3071	2	0	0
3072	2	0	0
3073	2	0	0
3074	2	0	0
3075	2	0	0
3076	2	0	0
3077	2	0	0
3078	2	0	0
3079	2	0	0
3080	2	0	0
3081	2	0	0
3082	2	0	0
3083	2	0	0
3084	2	0	0
3085	2	0	0
3086	2	0	0
3087	2	0	0
3088	2	0	0
3089	2	0	0
3090	2	0	0
3374	2	0	0
3375	2	0	0
3376	2	0	0
3377	2	0	0
3378	2	0	0
3379	2	0	0
3380	2	0	0
3381	2	0	0
3382	2	0	0
5842	2	0	0
5843	2	0	0
5844	2	0	0
5845	2	0	0
5846	2	0	0
3383	2	0	0
3384	2	0	0
3385	2	0	0
3386	2	0	0
3387	2	0	0
3388	2	0	0
3389	2	0	0
3390	2	0	0
3391	2	0	0
3392	2	0	0
3393	2	0	0
3394	2	0	0
3395	2	0	0
3396	2	0	0
3397	2	0	0
3398	2	0	0
3399	2	0	0
3400	2	0	0
4161	2	0	0
4162	2	0	0
4163	2	0	0
4164	2	0	0
4165	2	0	0
4166	2	0	0
4167	2	0	0
4168	2	0	0
4169	2	0	0
4170	2	0	0
4171	2	0	0
4172	2	0	0
4173	2	0	0
4174	2	0	0
4175	2	0	0
4176	2	0	0
4177	2	0	0
4178	2	0	0
4179	2	0	0
3601	2	0	0
3602	2	0	0
3603	2	0	0
3604	2	0	0
3605	2	0	0
3606	2	0	0
3607	2	0	0
3608	2	0	0
3609	2	0	0
3610	2	0	0
3611	2	0	0
3612	2	0	0
3613	2	0	0
3614	2	0	0
3615	2	0	0
3616	2	0	0
3617	2	0	0
3618	2	0	0
3619	2	0	0
3620	2	0	0
3621	2	0	0
3622	2	0	0
3623	2	0	0
3624	2	0	0
3625	2	0	0
3626	2	0	0
3627	2	0	0
3628	2	0	0
3629	2	0	0
3630	2	0	0
3631	2	0	0
3632	2	0	0
3633	2	0	0
4180	2	0	0
4181	2	0	0
4182	2	0	0
4183	2	0	0
4184	2	0	0
4185	2	0	0
4186	2	0	0
4187	2	0	0
4188	2	0	0
4189	2	0	0
4190	2	0	0
4191	2	0	0
4192	2	0	0
4193	2	0	0
4194	2	0	0
4195	2	0	0
4196	2	0	0
4197	2	0	0
4198	2	0	0
4199	2	0	0
4200	2	0	0
4201	2	0	0
1316	48	0	1000
1929	44	0	0
1930	44	0	0
1931	44	0	0
1932	44	0	0
1933	44	0	0
1934	44	0	0
1935	44	0	0
1936	44	0	0
1937	44	0	0
1938	44	0	0
2016	41	0	0
2017	41	0	0
2018	41	0	0
2019	41	0	0
2222	41	0	0
2223	41	0	0
2224	41	0	0
5764	2	0	0
4426	32	0	0
4427	32	0	0
4428	32	0	0
4429	32	0	0
4430	32	0	0
4431	32	0	0
6680	2	0	0
8293	4	0	0
8294	4	0	0
4441	32	0	0
4442	32	0	0
6732	10	0	0
6733	10	0	0
6734	10	0	0
8934	12	0	0
4648	33	1000	0
4440	33	0	1000
6701	26	0	0
4443	32	0	0
4646	32	0	0
4647	32	0	0
4649	32	0	0
1939	44	0	0
1940	44	0	0
1941	44	0	0
1942	44	0	0
5847	2	0	0
5848	2	0	0
1943	44	0	0
8287	4	0	0
8288	4	0	0
8289	4	0	0
6735	10	0	0
6736	10	0	0
6737	10	0	0
5771	2	0	0
5772	2	0	0
6738	10	0	0
8299	6	0	0
6739	10	0	0
4432	32	0	0
4433	32	0	0
4434	32	0	0
4435	32	0	0
6740	10	0	0
6741	10	0	0
8893	2	0	0
8894	2	0	0
6391	41	0	0
6392	41	0	0
10231	13	0	0
6670	36	0	0
10232	13	0	0
10233	13	0	0
10234	13	0	0
6671	36	0	0
6690	33	0	0
6691	33	0	0
6692	33	0	0
6699	26	0	0
6700	26	0	0
4436	32	0	0
6678	2	0	0
6679	2	0	0
5814	2	0	0
5815	2	0	0
5816	2	0	0
5817	2	0	0
5818	2	0	0
5819	2	0	0
5820	2	0	0
1944	44	0	0
1945	44	0	0
8310	4	0	0
8311	4	0	0
8312	4	0	0
8295	4	0	0
8296	4	0	0
8302	2	0	0
8290	4	0	0
8291	4	0	0
8292	4	0	0
8320	2	0	0
8321	2	0	0
8322	2	0	0
8328	5	0	0
8329	5	0	0
10205	2	0	0
4437	32	0	0
4438	32	0	0
4439	32	0	0
10206	2	0	0
8925	12	0	0
8926	12	0	0
8927	12	0	0
8928	12	0	0
8929	12	0	0
8930	12	0	0
8931	12	0	0
8932	12	0	0
10216	2	0	0
10217	2	0	0
10218	2	0	0
8933	12	0	0
4650	32	0	0
4651	32	0	0
4652	32	0	0
4653	32	0	0
4654	32	0	0
4655	32	0	0
4656	32	0	0
4657	32	0	0
4658	32	0	0
4659	32	0	0
4660	32	0	0
4661	32	0	0
4662	32	0	0
4663	32	0	0
4664	32	0	0
4665	32	0	0
4666	32	0	0
4667	32	0	0
4668	32	0	0
6375	14	0	0
6376	14	0	0
6377	14	0	0
6378	14	0	0
6379	14	0	0
6380	14	0	0
6381	14	0	0
6385	11	0	0
14750	2	0	0
14751	2	0	0
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
1826	1	0	\N	\N	\N
1844	1	0	\N	\N	\N
1845	1	0	\N	\N	\N
1846	1	0	\N	\N	\N
1847	1	0	\N	\N	\N
1848	1	0	\N	\N	\N
1818	1	0	\N	\N	\N
1819	1	0	\N	\N	\N
1820	1	0	\N	\N	\N
1821	1	0	\N	\N	\N
1822	1	0	\N	\N	\N
1823	1	0	\N	\N	\N
1849	1	0	\N	\N	\N
4950	1	0	\N	\N	\N
4951	1	0	\N	\N	\N
4952	1	0	\N	\N	\N
4953	1	0	\N	\N	\N
4954	1	0	\N	\N	\N
4955	1	0	\N	\N	\N
6167	1	0	\N	\N	\N
6161	1	0	\N	\N	\N
6162	1	0	\N	\N	\N
6164	1	0	\N	\N	\N
6165	1	0	\N	\N	\N
1836	1	0	\N	\N	\N
9401	1	0	\N	\N	\N
9402	1	0	\N	\N	\N
9397	1	0	\N	\N	\N
9395	1	0	\N	\N	\N
9398	1	0	\N	\N	\N
9399	1	0	\N	\N	\N
1858	1	0	\N	\N	\N
1859	1	0	\N	\N	\N
1860	1	0	\N	\N	\N
1862	1	0	\N	\N	\N
1863	1	0	\N	\N	\N
1864	1	0	\N	\N	\N
1865	1	0	\N	\N	\N
1866	1	0	\N	\N	\N
1867	1	0	\N	\N	\N
1869	1	0	\N	\N	\N
1870	1	0	\N	\N	\N
1872	1	0	\N	\N	\N
1873	1	0	\N	\N	\N
1874	1	0	\N	\N	\N
1875	1	0	\N	\N	\N
1876	1	0	\N	\N	\N
1879	1	0	\N	\N	\N
1877	1	0	\N	\N	\N
1878	1	0	\N	\N	\N
1881	1	0	\N	\N	\N
1882	1	0	\N	\N	\N
1883	1	0	\N	\N	\N
1885	1	0	\N	\N	\N
1886	1	0	\N	\N	\N
1887	1	0	\N	\N	\N
1889	1	0	\N	\N	\N
1890	1	0	\N	\N	\N
1891	1	0	\N	\N	\N
1892	1	0	\N	\N	\N
1893	1	0	\N	\N	\N
1895	1	0	\N	\N	\N
1896	1	0	\N	\N	\N
1897	1	0	\N	\N	\N
9396	1	0	\N	\N	\N
1829	1	0	\N	\N	\N
7105	1	0	\N	\N	\N
7106	1	1	2010-10-28	\N	\N
1830	1	0	\N	\N	\N
1831	1	0	\N	\N	\N
1832	1	0	\N	\N	\N
1833	1	0	\N	\N	\N
1834	1	0	\N	\N	\N
4949	1	0	\N	\N	\N
1837	1	0	\N	\N	\N
1838	1	0	\N	\N	\N
1839	1	0	\N	\N	\N
1840	1	0	\N	\N	\N
1841	1	0	\N	\N	\N
4968	1	0	\N	\N	\N
4969	1	0	\N	\N	\N
1827	1	0	\N	\N	\N
1851	1	0	\N	\N	\N
1852	1	0	\N	\N	\N
1853	1	0	\N	\N	\N
1854	1	0	\N	\N	\N
1855	1	0	\N	\N	\N
1856	1	0	\N	\N	\N
6168	1	0	\N	\N	\N
6169	1	1	2011-01-04	\N	\N
4957	1	0	\N	\N	\N
4958	1	0	\N	\N	\N
4963	1	0	\N	\N	\N
7093	1	0	\N	\N	\N
7094	1	0	\N	\N	\N
7095	1	0	\N	\N	\N
7096	1	0	\N	\N	\N
7097	1	0	\N	\N	\N
7099	1	0	\N	\N	\N
7089	1	0	\N	\N	\N
7090	1	0	\N	\N	\N
7084	1	0	\N	\N	\N
7103	1	0	\N	\N	\N
7085	1	0	\N	\N	\N
7072	1	0	\N	\N	\N
7100	1	0	\N	\N	\N
7104	1	0	\N	\N	\N
4964	1	0	\N	\N	\N
4965	1	0	\N	\N	\N
7083	1	1	2010-10-28	\N	\N
7086	1	0	\N	\N	\N
7108	1	0	\N	\N	\N
7087	1	0	\N	\N	\N
7109	1	0	\N	\N	\N
4966	1	0	\N	\N	\N
7111	1	0	\N	\N	\N
1843	1	0	\N	\N	\N
4960	1	0	\N	\N	\N
4961	1	0	\N	\N	\N
6171	1	0	\N	\N	\N
7076	1	1	2010-10-25	\N	\N
7071	1	0	\N	\N	\N
7077	1	1	2010-10-28	\N	\N
7074	1	1	2010-11-01	\N	\N
7080	1	0	\N	\N	\N
9393	1	0	\N	\N	\N
7081	1	0	\N	\N	\N
15150	1	0	\N	\N	\N
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
7105	8697
7106	8698
7108	8703
7109	8704
7111	8707
9393	9193
7072	6879
1818	1630
1819	1631
1820	1632
1821	1633
1822	1634
1823	1635
1826	1636
1858	1703
1859	1704
1860	1705
1862	1706
1863	2435
1864	2436
1865	2437
1866	2438
1867	2439
1869	1707
1870	2443
1872	1708
1873	2465
1874	2466
1875	2467
1876	2468
1879	2471
1877	2469
1878	2470
1881	1709
1882	2484
1883	2485
1885	2486
1886	1710
1887	2487
1889	2506
1890	1711
1891	2507
1892	2508
1893	2509
1895	2510
1896	2511
1897	1712
1844	1677
1845	1678
1846	1679
1847	1680
1848	1681
1849	1682
7083	6935
7084	6936
7085	6937
7086	6938
7087	6939
7089	6940
7090	6941
7103	8689
7093	6963
7094	6964
7095	6965
7096	6966
7097	6967
7099	6968
7100	8686
7104	8692
9395	9215
9396	9216
9397	9217
9398	9218
9399	9219
6161	5970
6162	5982
6164	5977
6165	5978
6167	5966
9401	9220
9402	9221
6171	5989
7076	6872
7071	6873
7077	6878
1836	1630
1837	1631
1838	1632
1839	1633
1840	1634
1841	1635
1843	1636
1827	1658
1829	1659
1830	1660
1831	1661
1832	1662
1833	1663
1834	1664
1851	1677
1852	1678
1853	1679
1854	1680
1855	1681
1856	1682
4949	2465
4950	2466
4951	2467
4952	2468
4953	2471
4954	2469
4955	2470
4957	2484
4958	2485
4960	2486
4961	2487
4963	2506
4964	2507
4965	2508
4966	2509
4968	2510
4969	2511
6168	5977
6169	5978
7074	6879
7080	6884
7081	6885
15150	14950
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, startdayduration, enddate, enddayduration, deadline, advance_percentage, sumofhoursallocated, parent, base_calendar_id, positioninparent) FROM stdin;
1818	4	Planificación semanal	\N	2010-10-25	0	2010-10-28	21600	\N	0.0000	0	1824	\N	0
7107	3	pedido 6	\N	2010-10-28	0	2010-11-01	0	\N	0.0000	0	\N	\N	\N
1819	4	Informes semanales	\N	2010-10-25	0	2010-10-28	21600	\N	0.0000	0	1824	\N	1
1820	4	Comunicaciones internas y externas	\N	2010-10-25	0	2010-10-29	10800	\N	0.0000	0	1824	\N	2
1821	4	Reuniones de coordinación	\N	2010-10-25	0	2010-10-29	10800	\N	0.0000	0	1824	\N	3
1822	4	Control de calidad	\N	2010-10-25	0	2010-10-26	25200	\N	0.0000	0	1824	\N	4
1823	4	Seguimiento	\N	2010-10-25	0	2010-10-26	25200	\N	0.0000	0	1824	\N	5
7077	30	elem 3.1	\N	2010-10-28	0	2010-10-29	7200	\N	0.0000	10	7075	\N	0
7105	3	e1	\N	2010-10-31	14400	2010-11-01	32400	\N	0.0000	0	7107	\N	0
1881	10	Adaptación del software de los nodos al protocolo de Zabbix	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1884	\N	0
1882	10	Consulta de la configuración al servidor	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1884	\N	1
1883	10	Interfaz para permitir la modificación de la configuración remotamente	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1884	\N	2
1826	2	Especificación de requisitos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	\N	\N	\N
1824	6	Coordinación	\N	2010-10-25	0	2010-10-29	0	\N	0.0000	0	\N	\N	\N
1844	4	Gestión de nodos	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1850	\N	0
1845	4	Gestión de redes (o grupos) de nodos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1850	\N	1
1846	4	Configuración de nodos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1850	\N	2
1847	4	Gestión de sensores	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1850	\N	3
1848	4	Configuración de offset y escalado por sensor	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1850	\N	4
1849	4	Exportación de configuración de un nodo	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1850	\N	5
1850	6	Módulo de nodos y sensores	\N	2010-11-01	0	2010-11-03	0	\N	0.0000	0	\N	\N	\N
1884	12	Módulo de software de nodos	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	\N	\N	\N
7106	3	e2	\N	2010-10-28	0	2010-10-31	14400	\N	0.0000	0	7107	\N	1
7091	12	elem c2	\N	2010-11-14	18000	2010-12-04	0	\N	0.0000	0	7092	\N	4
4953	24	Generar informes en HTML y PDF	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4956	\N	4
4954	24	Exportación de datos a diversos formatos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4956	\N	5
4955	24	Mostrado de datos sobre el mapa	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	4956	\N	6
1851	39	Gestión de nodos	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1857	\N	0
1852	39	Gestión de redes (o grupos) de nodos	\N	2010-11-02	25200	2010-11-03	14400	\N	0.0000	0	1857	\N	1
9393	1	e1	\N	2010-10-26	0	2010-10-26	14400	\N	0.0000	0	9394	\N	0
7089	9	c1.1	\N	2010-11-14	18000	2010-11-21	25200	\N	0.0000	0	7091	\N	0
7090	9	elem c2 (copy)	\N	2010-11-21	25200	2010-12-04	0	\N	0.0000	0	7091	\N	1
7084	10	elem 1	\N	2010-11-09	14400	2010-11-09	25200	\N	0.0000	0	7092	\N	1
1853	39	Configuración de nodos	\N	2010-11-03	14400	2010-11-04	21600	\N	0.0000	0	1857	\N	2
4957	24	Consulta de la configuración al servidor	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4959	\N	0
6172	63	pedido 5	\N	2010-10-25	0	2010-12-06	0	\N	0.1136	270	\N	\N	\N
7071	43	elem 2 (copy)	\N	2010-10-25	18000	2010-10-26	25200	\N	0.0000	0	15151	\N	0
7085	9	elem 2	\N	2010-11-09	25200	2010-11-11	3600	\N	0.0000	0	7092	\N	2
7083	9	elem 1	\N	2010-10-28	0	2010-11-09	14400	\N	0.0000	0	7092	\N	0
4958	24	Interfaz para permitir la modificación de la configuración remotamente	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4959	\N	1
9394	1	p10	\N	2010-10-26	0	2010-10-26	0	\N	0.0000	0	\N	\N	\N
7088	12	elem grande	\N	2010-11-11	3600	2010-11-14	18000	\N	0.0000	0	7092	\N	3
4960	24	Pruebas funcionales del sistema	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4962	\N	0
4961	24	Corrección de bugs	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4962	\N	1
6171	42	elem 1	\N	2010-10-25	0	2010-11-11	14400	\N	0.4000	100	6172	\N	0
7086	9	elem 3.1	\N	2010-11-11	3600	2010-11-12	10800	\N	0.0000	0	7088	\N	0
7087	9	elem grande (copy)	\N	2010-11-12	10800	2010-11-14	18000	\N	0.0000	0	7088	\N	1
7092	12	pedido 5	\N	2010-10-26	0	2010-12-04	0	\N	0.0000	0	\N	\N	\N
6161	4	elem (copy)	\N	2010-11-01	0	2010-11-14	14400	\N	0.0000	0	6163	\N	0
6162	4	jkljlkljkl	\N	2010-11-14	14400	2010-11-27	0	\N	0.0000	0	6163	\N	1
6164	4	klhjuiohjihjhllhjl	\N	2010-11-01	0	2010-11-26	0	\N	0.0000	0	6166	\N	0
6165	4	sxezaseswe	\N	2010-11-26	0	2010-12-26	3600	\N	0.0000	0	6166	\N	1
6163	5	elem	\N	2010-11-01	0	2010-11-27	0	\N	0.0000	0	\N	\N	\N
6166	5	dxrxsdrsdxresxuiui	\N	2010-11-01	0	2010-12-26	3600	\N	0.0000	0	\N	\N	\N
4970	38	Documentación	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1825	\N	8
1862	13	Importación de datos enviados por los nodos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1868	\N	0
1863	13	Almacenamiento de datos en una base de datos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	1
1864	13	Paso de datos a histórico	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1868	\N	2
1865	13	Configuración tiempo de vida de los datos recientes	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	3
6170	15	dxrxsdrsdxresxuiui	\N	2010-11-01	0	2011-02-14	3600	\N	0.0000	433	1825	\N	11
1872	12	Cálculo y mostrado de estadísticas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1880	\N	0
1873	12	Cálculo del valor real basado en offset y escalado	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1880	\N	1
1874	12	Generación de gráficas para una o varias variables en el tiempo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1880	\N	2
1875	12	Generación de gráficas variables de distinto tipo	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1880	\N	3
1876	12	Generación de gráficas de variables cruzadas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	4
1879	12	Generar informes en HTML y PDF	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	5
1877	12	Exportación de datos a diversos formatos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	6
1878	12	Mostrado de datos sobre el mapa	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1880	\N	7
1895	9	Documentación de usuario	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1898	\N	0
1896	9	Documentación de administrador de red	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1898	\N	1
1897	9	Documentación de administrador de sistema	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1898	\N	2
6168	13	klhjuiohjihjhllhjl	\N	2010-11-01	0	2010-12-04	0	\N	0.0000	200	6170	\N	0
6169	13	sxezaseswe	\N	2011-01-04	0	2011-02-14	3600	\N	0.0000	233	6170	\N	1
7094	4	elem 1	\N	2010-11-07	14400	2010-11-07	32400	\N	0.0000	0	7102	\N	1
7095	4	elem 2	\N	2010-11-08	32400	2010-11-09	39600	\N	0.0000	0	7102	\N	2
7072	5	elem grande (copy)	\N	2010-11-08	39600	2010-11-10	18000	\N	0.0000	0	7073	\N	0
7098	4	elem grande	\N	2010-10-26	0	2010-10-27	0	\N	0.0000	0	7102	\N	3
7073	5	elem grande	\N	2010-11-08	39600	2010-11-10	18000	\N	0.0000	0	\N	\N	\N
7101	4	elem c2	\N	2010-10-26	0	2010-11-07	0	\N	0.0000	0	7102	\N	4
7102	4	pedido 5	\N	2010-10-26	0	2010-11-09	0	\N	0.0000	0	\N	\N	\N
7108	1	e1	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	7110	\N	0
7109	1	e2	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	7110	\N	1
9398	11	elem 3.1	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	9400	\N	0
9401	11	c1.1	\N	2010-10-28	14400	2010-11-03	21600	\N	0.0000	0	9403	\N	0
7082	31	elem c2	\N	2010-11-02	7200	2010-12-06	21600	\N	0.0000	150	6172	\N	4
7093	3	elem 1	\N	2010-10-26	0	2010-11-07	14400	\N	0.0000	0	7102	\N	0
9399	11	elem grande (copy)	\N	2010-10-27	7200	2010-10-28	14400	\N	0.0000	0	9400	\N	1
9396	11	elem 1	\N	2010-11-11	14400	2010-11-12	3600	\N	0.0000	0	9404	\N	1
7096	3	elem 3.1	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	7098	\N	0
7097	3	elem grande (copy)	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	7098	\N	1
7099	3	c1.1	\N	2010-10-26	0	2010-11-01	7200	\N	0.0000	0	7101	\N	0
7100	3	elem c2 (copy)	\N	2010-10-26	0	2010-11-07	14400	\N	0.0000	0	7101	\N	1
7110	1	p7	\N	2010-10-26	0	2010-10-27	0	\N	0.0000	0	\N	\N	\N
9404	16	pedido 5	\N	2010-10-26	0	2010-11-16	0	\N	0.0701	100	\N	\N	\N
1857	62	Módulo de nodos y sensores	\N	2010-11-01	0	2010-11-07	36000	\N	0.0000	0	1825	\N	3
9402	11	elem c2 (copy)	\N	2010-11-03	21600	2010-11-16	7200	\N	0.0000	0	9403	\N	1
1825	74	Servidor sens2net	\N	2010-11-01	0	2011-02-14	0	\N	0.0000	488	\N	\N	\N
9395	11	elem 1	\N	2010-10-26	0	2010-11-11	14400	\N	0.2000	100	9404	\N	0
7080	24	c1.1	\N	2010-11-02	7200	2010-11-18	7200	\N	0.0000	50	7082	\N	0
7081	25	elem c2 (copy)	\N	2010-11-18	7200	2010-12-06	21600	\N	0.0000	100	7082	\N	1
1842	68	Coordinación	\N	2010-11-01	0	2010-11-20	28800	\N	0.0000	0	1825	\N	0
1836	42	Planificación semanal	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1842	\N	0
1837	43	Informes semanales	\N	2010-11-04	21600	2010-11-07	43200	\N	0.0000	0	1842	\N	1
1838	44	Comunicaciones internas y externas	\N	2010-11-07	43200	2010-11-11	54000	\N	0.0000	0	1842	\N	2
1839	44	Reuniones de coordinación	\N	2010-11-11	54000	2010-11-16	36000	\N	0.0000	0	1842	\N	3
1840	44	Control de calidad	\N	2010-11-16	36000	2010-11-18	32400	\N	0.0000	0	1842	\N	4
1841	44	Seguimiento	\N	2010-11-18	32400	2010-11-20	28800	\N	0.0000	0	1842	\N	5
4968	24	Documentación de usuario	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	4970	\N	0
1843	42	Especificación de requisitos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1828	\N	0
4969	24	Documentación de administrador de red	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4970	\N	1
4963	24	Montaje de entorno de desarrollo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4967	\N	0
4964	24	Puesta en producción	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4967	\N	1
6167	3	hola	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	\N	\N	\N
1858	13	Monitorización bajo demanda	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1861	\N	0
1859	13	Localización nodos en un mapa	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1861	\N	1
7074	34	elem grande (copy)	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	10	7075	\N	1
1860	13	Configuración de los mapas y la geolocalización de los sensores	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1861	\N	2
1866	13	Gestión de datos históricos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	4
1867	13	Detección de falta de recursos de almacenamiento	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	5
1885	10	Pruebas funcionales del sistema	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	0
1886	10	Pruebas de aceptación	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	1
1887	10	Corrección de bugs	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	2
7103	5	elem 45	\N	2010-10-26	0	2010-10-30	7200	\N	0.0000	0	7092	\N	5
7075	44	elem grande	\N	2010-10-28	0	2010-11-02	7200	\N	0.0000	20	6172	\N	3
7111	5	e1	\N	2010-10-26	0	2010-10-27	7200	\N	0.0000	0	7112	\N	0
7112	7	p8	\N	2010-10-26	0	2010-10-27	0	\N	0.0000	0	\N	\N	\N
1827	46	Análisis funcional	\N	2010-11-02	7200	2010-11-20	0	\N	0.0000	55	1828	\N	1
1889	9	Montaje de entorno de desarrollo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1894	\N	0
1890	9	Instalacion y configuración del servidor central con Zabbix	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1894	\N	1
1891	9	Puesta en producción	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1894	\N	2
1892	9	Soporte de localización (idiomas)	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1894	\N	3
1893	9	Redacción del plan de escalabilidad	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1894	\N	4
9403	16	elem c2	\N	2010-10-28	14400	2010-11-16	7200	\N	0.0000	0	9404	\N	4
4965	24	Soporte de localización (idiomas)	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	4967	\N	2
4966	24	Redacción del plan de escalabilidad	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	4967	\N	3
1828	70	Análisis	\N	2010-11-01	0	2010-11-20	0	\N	0.0000	55	1825	\N	1
9397	11	elem 2	\N	2010-11-12	3600	2010-11-14	10800	\N	0.0000	0	9404	\N	2
9400	16	elem grande	\N	2010-10-26	0	2010-10-28	14400	\N	0.0000	0	9404	\N	3
11716	10	elem 1	\N	2010-10-25	0	2010-10-25	0	\N	0.0000	0	6172	\N	1
1834	44	Asignación de permisos a grupos de usuarios	\N	2010-12-05	18000	2010-12-09	10800	\N	0.0000	0	1835	\N	5
10605	9	elem 1	\N	2010-10-25	0	2010-10-25	18000	\N	0.0000	0	\N	\N	\N
4956	38	Módulo de consulta de datos	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1825	\N	4
4949	24	Cálculo del valor real basado en offset y escalado	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	4956	\N	0
4950	24	Generación de gráficas para una o varias variables en el tiempo	\N	2010-11-02	25200	2010-11-04	3600	\N	0.0000	0	4956	\N	1
4951	24	Generación de gráficas variables de distinto tipo	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	4956	\N	2
15151	1	elem 2	\N	2010-10-25	0	2010-10-26	0	\N	0.0000	0	6172	\N	2
7104	1	elem c3	\N	2010-10-26	0	2010-10-27	0	\N	0.0000	0	7102	\N	5
15150	1	elem hijo	\N	2010-10-25	0	2010-10-26	7200	\N	0.0000	0	15151	\N	1
4952	24	Generación de gráficas de variables cruzadas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4956	\N	3
11926	0	new milestone	\N	2010-12-01	0	2010-12-01	0	\N	0.0000	0	7107	\N	2
1854	39	Gestión de sensores	\N	2010-11-04	21600	2010-11-06	18000	\N	0.0000	0	1857	\N	3
1855	39	Configuración de offset y escalado por sensor	\N	2010-11-06	18000	2010-11-07	36000	\N	0.0000	0	1857	\N	4
1856	39	Exportación de configuración de un nodo	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1857	\N	5
4959	38	Módulo de software de nodos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1825	\N	5
1869	13	Gestión de alarmas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1871	\N	0
1870	13	Envío de notificaciones por email y SMS	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1871	\N	1
1901	29	Fase I	\N	2010-11-01	0	2010-11-01	0	2010-12-01	0.0000	0	1825	\N	9
4967	38	Entorno e intraestrutura	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1825	\N	7
4962	38	Pruebas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1825	\N	6
1902	29	Fase II	\N	2010-11-05	0	2010-11-05	0	\N	0.0000	0	1825	\N	10
1898	10	Documentación	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	\N	\N	\N
1861	18	Módulo de monitorización	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1868	18	Módulo de gestión de datos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1871	18	Módulo de alarmas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	\N	\N	\N
1880	16	Módulo de consulta de datos	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	\N	\N	\N
1888	12	Pruebas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1894	10	Entorno e intraestrutura	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	\N	\N	\N
1835	70	Módulo de usuarios y permisos	\N	2010-11-20	0	2010-12-09	10800	\N	0.0000	0	1825	\N	2
7076	33	elem 1 (copy)	\N	2010-10-25	0	2010-10-25	18000	\N	0.0000	0	11716	\N	0
1829	44	Gestión de usuarios	\N	2010-11-20	0	2010-11-21	18000	\N	0.0000	0	1835	\N	0
1830	46	Gestión de permisos	\N	2010-11-21	18000	2010-11-24	28800	\N	0.0000	0	1835	\N	1
1831	46	Asignación de permisos a usuarios	\N	2010-11-24	28800	2010-11-29	36000	\N	0.0000	0	1835	\N	2
1832	45	Autenticación de usuarios	\N	2010-11-29	36000	2010-12-02	14400	\N	0.0000	0	1835	\N	3
1833	45	Gestión de grupos de usuarios	\N	2010-12-02	14400	2010-12-05	18000	\N	0.0000	0	1835	\N	4
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
1824
1825
1828
1835
1842
1850
1857
1861
1868
1871
1880
1884
1888
1894
1898
4956
4959
4962
4967
4970
6163
6166
6170
6172
7073
7075
7082
7088
7091
7092
7098
7101
7102
7107
7110
7112
9394
9400
9403
9404
10605
11716
15151
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id, startconstrainttype, constraintdate) FROM stdin;
11926	1	\\254\\355\\000\\005sr\\000\\027org.joda.time.LocalDate\\377\\377\\370\\004\\323\\344\\353\\265\\002\\000\\002J\\000\\014iLocalMillisL\\000\\013iChronologyt\\000\\032Lorg/joda/time/Chronology;xp\\000\\000\\001,\\237:\\200\\000sr\\000'org.joda.time.chrono.ISOChronology$Stub\\251\\310\\021fq7P'\\003\\000\\000xpsr\\000\\037org.joda.time.DateTimeZone$Stub\\246/\\001\\232|2\\032\\343\\003\\000\\000xpw\\005\\000\\003UTCxx
1901	0	\N
1902	2	\\254\\355\\000\\005sr\\000\\027org.joda.time.LocalDate\\377\\377\\370\\004\\323\\344\\353\\265\\002\\000\\002J\\000\\014iLocalMillisL\\000\\013iChronologyt\\000\\032Lorg/joda/time/Chronology;xp\\000\\000\\001,\\031U(\\000sr\\000'org.joda.time.chrono.ISOChronology$Stub\\251\\310\\021fq7P'\\003\\000\\000xpsr\\000\\037org.joda.time.DateTimeZone$Stub\\246/\\001\\232|2\\032\\343\\003\\000\\000xpw\\005\\000\\003UTCxx
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
1824	3	2030
1818	5	2031
1819	5	2032
1820	5	2033
1821	5	2034
1822	5	2035
1823	5	2036
1826	1	2038
1850	3	2117
1844	5	2118
1845	5	2119
1846	5	2120
1847	5	2121
1848	5	2122
1849	5	2123
1861	6	4325
1868	6	4329
1871	6	4336
1880	5	4339
1894	2	4558
1898	2	4564
1858	11	4326
1859	11	4327
1860	11	4328
1862	11	4330
1863	11	4331
1864	11	4332
1865	11	4333
1866	11	4334
1867	11	4335
1869	11	4337
1889	3	4559
1890	3	4560
1891	3	4561
1892	3	4562
1893	3	4563
1895	3	4565
1884	3	4550
1888	3	4554
1870	11	4338
1872	9	4340
1873	9	4341
1874	9	4342
1875	9	4545
1876	9	4546
1879	9	4547
1877	9	4548
1878	9	4549
1881	5	4551
1882	5	4552
1883	5	4553
1885	5	4555
1886	5	4556
1887	5	4557
1896	3	4566
1897	3	4567
7103	1	8400
7075	15	6779
1842	27	1434
1828	28	2037
1835	28	2040
7098	2	8392
1857	24	2061
7112	4	8429
7101	2	8395
7102	2	8388
4956	15	3179
7093	3	8389
6170	5	5891
1825	30	1417
1836	53	1435
1837	53	1436
1838	53	1437
1839	53	1438
1840	53	1439
1841	53	1440
1843	53	1441
1827	55	2039
1829	55	2041
1830	55	2042
1831	55	2043
1832	55	2044
1833	55	2045
1834	55	2046
1851	47	2062
1852	47	2063
1853	47	2064
1854	47	2065
1855	47	2066
1856	47	2067
7111	7	8430
4949	29	3181
4950	29	3182
4951	29	3183
6168	9	5892
6169	9	5893
9393	1	8995
9394	1	8994
11716	3	10306
7082	10	6800
7094	3	8390
7095	3	8391
7096	3	8393
7097	3	8394
7099	3	8396
7100	3	8397
7105	1	8412
7106	1	8413
7107	1	8411
6172	22	6290
6171	43	6291
7071	35	6772
7077	25	6780
7074	29	6781
7080	19	6801
10605	3	10332
7081	19	6802
15150	1	14852
15151	1	14851
7088	4	6837
7091	4	6840
7092	4	6833
7083	7	6834
7084	7	6835
7085	7	6836
7086	7	6838
7087	7	6839
7089	7	6841
7090	7	6842
7104	1	8403
7108	1	8422
7109	1	8423
7110	1	8421
4959	15	3523
4962	15	3527
6163	2	6275
6166	2	6278
4967	15	4091
4970	15	4097
4952	29	3184
4953	29	3187
4954	29	3185
4955	29	3186
4957	29	3525
4958	29	3526
4960	29	3528
4961	29	3530
4963	29	4092
4964	29	4094
6161	3	6276
6162	3	6277
6164	3	6279
6165	3	6280
6167	1	6274
4965	29	4095
4966	29	4096
4968	29	4098
4969	29	4099
7073	2	6791
7072	3	6793
9400	6	9030
9403	6	9033
9404	6	9026
9395	11	9027
9396	11	9028
9397	11	9029
9398	11	9031
9399	11	9032
9401	11	9034
9402	11	9035
7076	27	6771
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
15655	1	NM	255b3f1c-b81d-4972-84b7-ce31efe410d0	10.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
808	1	8a90af0d-fd48-4196-9d53-07497194d390	units	f
809	1	95907910-8fb0-404e-844c-201103ef04ea	kg	f
810	1	4ec967f0-cc68-47c8-ab57-e7bebcd36537	km	f
811	1	75dc3cba-5f0c-484f-8dec-0b831543cf4d	l	f
812	1	9976c916-2135-47a4-bf94-7dac85905422	m	f
813	1	b5e7e876-daf4-47f9-80a4-9230ae63ced3	m2	f
814	1	6ea8be91-8731-4e96-8336-c54b8674a769	m3	f
815	1	572d0957-e992-40f0-a73b-9d2ba239c6b1	tn	f
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
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_CREATE_ORDER
1112	ROLE_ADMINISTRATION
1112	ROLE_READ_ALL_ORDERS
1113	ROLE_WS_READER
1114	ROLE_WS_WRITER
1114	ROLE_WS_READER
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
15958	1	16bfbd99-9790-4b55-9a67-1226cb115ba3	\N	t	15756	\N	\N
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
15857	1	ae9678b6-7435-4128-bd85-287f7f53bf73	1000	2010-11-11 11:17:30.981	\N	\N	15958	7275	2403	15655
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
15756	1	report 1	code1	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
5051	Trabajador Limitante 	U1	8923434
12727	U2	last name	123
12729	U3	lastname	2
7275	Varon	Lopez	9234K
7273	Javier	Moran	898923423L
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
-- Name: effortperday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT effortperday_pkey PRIMARY KEY (base_calendar_id, day_id);


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
-- Name: hoursgroup_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_code_key UNIQUE (code);


--
-- Name: hoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_pkey PRIMARY KEY (id);


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
-- Name: fkc405554bfd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT fkc405554bfd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


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


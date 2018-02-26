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
314601	17	t	405
314602	17	t	405
314603	17	t	405
314604	17	t	405
314605	17	t	405
302703	6	t	405
302704	6	t	405
302705	6	t	405
302706	6	t	405
302707	6	t	405
302709	5	t	404
302708	5	f	405
302710	6	t	405
302711	6	t	405
302712	6	t	405
302713	6	t	405
302714	6	t	405
302716	5	f	405
302715	5	t	404
302717	6	t	405
302718	6	t	405
302719	6	t	405
302720	6	t	405
302721	6	t	405
302722	6	t	405
302723	6	t	405
302725	5	t	404
302724	5	f	405
302727	5	t	404
302726	5	f	405
302728	6	t	405
302729	6	t	405
302730	6	t	405
302731	5	f	405
302732	5	t	404
302733	6	t	405
302734	6	t	405
302735	6	t	405
302736	6	t	405
302737	6	t	405
302739	5	f	405
302738	5	t	404
302741	5	f	405
302740	5	t	404
302697	6	t	405
302698	6	t	405
302699	6	t	405
302700	6	t	405
302701	5	f	405
302702	5	t	404
314606	17	t	405
314607	17	t	405
314608	17	t	405
314609	17	t	405
314610	17	t	405
314612	13	t	404
314611	13	f	405
314614	13	f	405
314613	13	t	404
317545	13	t	404
317544	13	f	405
317547	13	f	405
317546	13	t	404
317548	13	t	404
317549	13	f	405
317551	15	t	405
317550	15	t	405
317552	15	t	405
317553	15	t	405
317554	15	t	405
317555	15	t	405
317556	15	t	405
317557	15	t	405
317558	15	t	405
317559	15	t	405
317560	15	t	405
317561	11	f	405
317562	11	t	404
317564	11	t	404
317563	11	f	405
317566	11	f	405
317565	11	t	404
317567	11	f	405
317568	11	t	404
317569	11	f	405
317570	11	t	404
314599	15	t	404
314514	8	t	405
314515	8	t	405
314516	8	t	405
314517	8	t	405
314518	8	t	405
314519	8	t	405
314520	8	t	405
314521	8	t	405
314522	8	t	405
314523	8	t	405
314525	7	t	404
314524	7	f	405
314526	7	t	404
314527	7	f	405
314529	7	f	405
314528	7	t	404
314530	8	t	405
314531	8	t	405
314532	8	t	405
314533	8	t	405
314534	8	t	405
314535	8	t	405
314536	8	t	405
314537	8	t	405
314538	8	t	405
314540	7	f	405
314539	7	t	404
314541	7	f	405
314542	7	t	404
314543	7	f	405
314544	7	t	404
314545	8	t	405
314546	8	t	405
314587	19	t	405
314588	19	t	405
314547	8	t	405
314548	8	t	405
314549	8	t	405
314550	8	t	405
314551	8	t	405
314552	8	t	405
314590	15	t	404
314589	15	f	405
314592	15	t	404
314591	15	f	405
314553	8	t	405
314554	8	t	405
314555	7	f	405
314556	7	t	404
314558	7	t	404
314557	7	f	405
314560	7	f	405
314559	7	t	404
314577	7	f	405
314578	7	t	404
314561	8	t	405
314562	8	t	405
314563	8	t	405
314564	8	t	405
314565	8	t	405
314566	8	t	405
314567	8	t	405
314568	8	t	405
314569	8	t	405
314570	8	t	405
314572	7	t	404
314571	7	f	405
314573	7	t	404
314574	7	f	405
314576	7	t	404
314575	7	f	405
314593	15	t	404
314594	15	f	405
314595	15	t	404
314596	15	f	405
314597	15	f	405
314598	15	t	404
317593	11	t	405
314579	19	t	405
314580	19	t	405
314581	19	t	405
314582	19	t	405
314583	19	t	405
314584	19	t	405
314585	19	t	405
314586	19	t	405
317571	11	t	404
317572	11	f	405
317584	8	f	405
317583	8	t	404
317586	8	t	404
317585	8	f	405
317587	8	t	404
317588	8	f	405
317589	8	f	405
317590	8	t	404
317591	8	t	404
317592	8	f	405
314600	15	f	405
317573	12	t	405
317574	12	t	405
317575	12	t	405
317576	12	t	405
317577	12	t	405
317578	12	t	405
317579	12	t	405
317580	12	t	405
317581	12	t	405
317582	12	t	405
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
127724	1	405	127637	t	100.00
127725	1	405	127638	t	100.00
127726	1	405	127639	t	100.00
127727	1	405	127640	t	100.00
127728	1	405	127642	t	100.00
127729	1	405	127643	t	100.00
127730	1	405	127644	t	100.00
127731	1	405	127645	t	100.00
127732	1	405	127646	t	100.00
127733	1	405	127647	t	100.00
127734	1	405	127649	t	100.00
127735	1	405	127650	t	100.00
127736	1	405	127651	t	100.00
127737	1	405	127652	t	100.00
127738	1	405	127653	t	100.00
127739	1	405	127654	t	100.00
127740	1	405	127655	t	100.00
127741	1	405	127656	t	100.00
127742	1	405	127657	t	100.00
127743	1	405	127658	t	100.00
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
404	4	children	100.0000	f	0.0100	t	t	f
405	3	percentage	100.0000	f	0.0100	t	t	f
406	2	units	2147483647.0000	f	1.0000	t	f	f
407	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
302899	108
302899	300576
302900	108
302900	300576
302901	108
302901	300576
302902	108
302902	300576
302903	300576
302903	108
302985	300578
302985	109
302986	300578
302986	109
302987	300578
302987	109
302988	300578
302988	109
302989	300578
302989	109
302990	300578
302990	109
302991	300578
302991	109
302992	300578
302992	109
302993	300578
302993	109
302994	300578
302994	109
302995	300578
302995	109
302996	300578
302996	109
302997	300578
302997	109
302998	300578
302998	109
308161	300578
308161	108
308162	300578
308162	108
308163	300578
308163	108
308164	300578
308164	108
308165	108
308165	300578
308166	109
308166	300576
308167	300576
308167	109
308168	109
308168	300576
308169	109
308169	300576
308170	300576
308170	109
314716	300577
314716	108
314717	300577
314717	108
314718	300576
314718	108
314719	300577
314719	108
314720	300577
314720	108
314721	300577
314721	108
314722	108
314722	300577
314723	300577
314723	108
314724	300577
314724	108
314725	300577
314725	108
314726	109
314726	300577
314727	109
314727	300577
314728	109
314728	300577
314729	300577
314729	109
314730	109
314730	300577
314731	300577
314731	109
314732	300577
314732	109
314733	109
314733	300577
314734	300577
314734	109
314741	300576
314741	108
314742	108
314742	300576
314743	108
314743	300576
314744	108
314744	300576
314745	300576
314745	108
314746	108
314746	300576
314747	109
314747	300576
314748	109
314748	300576
314749	109
314749	300576
314750	300576
314750	109
314751	109
314751	300576
314752	300576
314752	109
314753	109
314753	300576
314754	300576
314754	109
314755	300576
314755	109
314756	300576
314756	109
314812	107
314812	108
314813	107
314813	108
314814	107
314814	108
314815	107
314815	108
314816	107
314816	108
322695	107
322695	108
322696	107
322696	108
322697	107
322697	108
328263	108
328263	107
328264	108
328264	107
334543	105
334543	108
334544	105
334544	108
334545	105
334545	108
334546	105
334546	108
334547	105
334547	108
334548	105
334548	108
334549	105
334549	108
334550	105
334550	108
334551	105
334551	108
334552	105
334552	108
341861	109
341861	107
341862	109
341862	107
341863	109
341863	107
341864	109
341864	107
341865	109
341865	107
341866	109
341866	107
341867	109
341867	107
341868	109
341868	107
341869	109
341869	107
341870	109
341870	107
348898	109
348898	105
348899	109
348899	105
348900	109
348900	105
348901	109
348901	105
348902	109
348902	105
348903	109
348903	105
348904	109
348904	105
348905	109
348905	105
348906	109
348906	105
348907	109
348907	105
348908	109
348908	106
348909	106
348909	108
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
506	1	3685c980-1006-4691-9d35-dc3684d0f439	Coruña
505	2	a2957eea-18ba-45e4-af65-b57878f18fce	Default
507	1	687f7478-4ba3-48bc-8f2f-47fbb9a4b87c	Pontevedra
300079	2	b7887e70-7f9c-4a15-b2d7-77b4d474b058	\N
300071	5	e206a338-4058-4552-a1a4-b49bcd0bac48	\N
300072	3	7e144cac-ea03-4431-9e89-95dd2a533cf3	\N
300073	3	bcd6ad14-4908-429e-ab6d-0ba8f828abc8	\N
300074	3	726e3710-2c09-43d3-948c-4e79ee7c081c	\N
300075	3	0e48bd3b-d9c7-4cfd-ae41-5e02b9614150	\N
300076	3	c64788e9-400e-419e-bce2-71900c235597	\N
513	3	975f39aa-d63b-4d12-a327-0383de72ebad	\N
2829	2	pincor2-calendar	\N
2828	2	pincor1-calendar	\N
2830	2	pincor3-calendar	\N
2831	2	pincor4-calendar	\N
2832	2	solcor1-calendar	\N
2833	2	solcor2-calendar	\N
2834	2	solcor3-calendar	\N
2835	2	solcor4-calendar	\N
508	4	9ebb3471-4ea4-4dc4-9ee6-3acb1e030ff5	\N
2121	2	cappon2calendar	\N
2130	2	capcor2calendar	\N
2126	2	esccor1calendar	\N
2127	2	esccor2calendar	\N
2128	2	esccor3calendar	\N
2129	2	esccor4calendar	\N
514	2	85bd3e44-ddd2-4209-822a-28b5ac23e70c	\N
515	2	3e625c59-01c6-4067-aaa2-e90a8a6b5a1a	\N
516	2	88380002-93e7-4af9-97a9-49cce67d8e70	\N
509	2	f693644e-9653-400a-8994-92456bd7affb	\N
510	2	5b04864e-7bdc-451e-a822-a0f89d3d927b	\N
511	2	8f51e287-69b5-4a9e-97e4-7c87f1d67b95	\N
512	2	7e7467f5-84e5-4468-a73a-6154ffe58afb	\N
2122	2	escpon1calendar	\N
2123	2	escpon2calendar	\N
2124	2	escpon3calendar	\N
2125	2	escpon4calendar	\N
300077	3	c59f7bec-be2a-4561-bca8-22ff21fb002b	\N
300078	3	ffc9f94a-ec9f-4078-b27f-ff26ef0538ba	\N
300080	2	5f05e5f3-caea-4f03-b2ff-a83d6ae4464d	\N
300081	2	c8e463c7-aca5-489a-a8d4-c2d02735f568	\N
300082	2	677cca9b-47bd-4096-9368-313207ff8a87	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1718	2	2010-01-01	\N	509	0
1719	2	2010-07-01	\N	510	0
1720	2	2009-01-01	\N	511	0
1721	2	2009-01-01	2010-12-31	512	0
2324	2	2009-01-01	\N	2122	0
2325	2	2009-01-01	2009-12-31	2123	0
2326	2	2010-01-01	\N	2124	0
2327	2	2010-01-01	\N	2125	0
1722	3	2009-01-01	2009-12-31	513	0
3031	2	2010-07-01	\N	2829	0
3030	2	2010-01-01	\N	2828	0
3032	2	2009-01-01	\N	2830	0
3033	2	2009-01-01	2009-12-31	2831	0
3034	2	2009-01-01	2009-12-31	2832	0
3035	2	2009-01-01	\N	2833	0
3036	2	2010-01-01	\N	2834	0
3037	2	2010-07-01	\N	2835	0
1717	4	2010-01-12	\N	508	0
2323	2	2009-01-01	\N	2121	0
2332	2	2009-01-01	\N	2130	0
2328	2	2009-01-01	\N	2126	0
2329	2	2009-01-01	2009-12-31	2127	0
2330	2	2010-01-01	\N	2128	0
2331	2	2010-01-01	\N	2129	0
1723	2	2009-01-01	\N	514	0
1724	2	2010-01-01	\N	515	0
1725	2	2010-07-01	\N	516	0
300281	2	2010-01-01	\N	300079	0
300273	5	2009-01-01	\N	300071	0
300274	3	2009-01-01	\N	300072	0
300275	3	2009-01-01	\N	300073	0
300276	3	2009-01-01	\N	300074	0
300277	3	2009-01-01	\N	300075	0
300278	3	2009-01-01	\N	300076	0
300279	3	2009-01-01	\N	300077	0
300280	3	2009-01-01	\N	300078	0
300282	2	2009-01-01	\N	300080	0
300283	2	2009-01-01	\N	300081	0
300284	2	2010-01-01	\N	300082	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
607	1	322764bb-28a8-49dd-98d9-18a1f61edb69	505	\N	506	0
606	2	97b3fa4e-1e75-4d81-a3d4-c14ec4caacf1	\N	\N	505	0
608	1	e38efe1b-4767-491f-890c-409a85c81d96	505	\N	507	0
2935	2	f11531a2-2ceb-4273-a2da-23082f6ede83	506	\N	2834	0
2936	2	68aed008-3152-4a30-994f-a15f86054727	506	\N	2835	0
609	4	3e2adf2c-2bbd-49f4-ba22-72403ff05910	507	\N	508	0
2222	2	91c9c703-de4b-4941-8a4b-e432367c3a93	507	\N	2121	0
2231	2	6254c5e3-43b2-48f2-bdb2-6fad0afb9e53	506	\N	2130	0
2227	2	09d67d25-7825-4517-b9b6-82f30ace940a	506	\N	2126	0
2228	2	66d04606-a063-40e2-bbf9-2462176ff792	506	\N	2127	0
2229	2	fe77e5f7-cd46-49dc-a32e-20e75097165b	506	\N	2128	0
2230	2	b85e5ea0-6a9c-4252-a881-c82e0a867ef1	506	\N	2129	0
615	2	684cfe4b-abdc-4b95-8b4f-f14f0010a13b	505	\N	514	0
616	2	9219ade6-468f-46de-9a73-ea378267f373	507	\N	515	0
617	2	e2f1eb07-ed0e-451f-b432-7e7eb28da9ea	507	\N	516	0
610	2	742ad580-c08b-441c-a7e3-2be6c32fbdef	507	\N	509	0
611	2	058ef40c-1891-4acb-ad04-cdfb710a99fb	507	\N	510	0
612	2	6ca93742-05de-4eef-97d1-2df17a094579	507	\N	511	0
613	2	c204b9a7-221f-4cef-aee9-1ff813e70242	507	\N	512	0
2223	2	5665c9cc-11a2-4e0a-9b19-d68790889b55	507	\N	2122	0
2224	2	8773ba10-3b08-42a3-bd56-2a91c1fb9fba	507	\N	2123	0
2225	2	5a0de902-5adb-4c32-a9fb-c05394af6e6b	507	\N	2124	0
614	3	4b782780-6be9-4df4-aa4c-fe91f5cbe4ed	507	\N	513	0
2930	2	9a62573f-ebc6-43fa-8830-563afb50320f	506	\N	2829	0
2929	2	f37d654e-e956-428e-8fe6-ac95aaa327f0	506	\N	2828	0
2931	2	fe394177-8114-46df-ba32-8b1fbe5af632	506	\N	2830	0
2932	2	b39d9db8-b931-45c0-b4e9-6e3350dae15e	506	\N	2831	0
2933	2	bd5eec8e-287d-46eb-85b1-93c7ad2b89f1	506	\N	2832	0
2934	2	1900e0b4-393c-42a8-a92a-781612cc956d	506	\N	2833	0
2226	2	16f93021-5b8d-48b3-8eeb-801838b47403	507	\N	2125	0
300182	2	00c4c82b-467e-44fb-b15c-d6f3307bc378	507	\N	300081	0
300183	2	42aad009-ab43-4626-ac57-41c12d84494c	507	\N	300082	0
300180	2	3b250ae7-94b7-4f97-9224-dffebdf2134c	506	\N	300079	0
300172	5	4a79a703-a992-445b-9969-f27998e2abb4	505	\N	300071	0
300173	3	96cc7f6b-1618-4d85-9e34-6dcd6a05b917	505	\N	300072	0
300174	3	1e054a99-ebd3-4948-80db-aec3af82e73e	505	\N	300073	0
300175	3	842f4c08-ad59-4b46-8dd5-5e4123ca66c2	505	\N	300074	0
300176	3	61e467c4-7b50-4acb-8f02-dba9dc727d74	505	\N	300075	0
300177	3	308ecac3-26eb-4f51-94c9-edc3c83c1633	505	\N	300076	0
300178	3	b1852c9e-cf83-4f60-a08f-05e645b1765f	505	\N	300077	0
300179	3	a8efad10-90fb-417c-8cef-336cfbdd1d7a	505	\N	300078	0
300181	2	2fed0415-3557-4947-8afe-524f0d7585e5	506	\N	300080	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1515	1	9f017846-8e68-4aa4-988e-9cfb183f791a	2010-02-19	8	1014	506
1516	1	76d2195a-a186-4c88-910d-9ad3e5db52f4	2010-10-07	8	1014	506
1517	1	20960850-d15a-4298-aafb-a71264df4a7b	2010-12-08	8	1014	505
1518	1	d5ae718b-65e9-45b7-922b-d79b9739e729	2009-03-19	8	1014	505
1519	1	d3e465c6-9bd3-4772-80b1-387647c99ac1	2010-01-06	8	1014	505
1520	1	255e0c62-620b-4a89-bd96-61006bcbf0a2	2009-01-06	8	1014	505
1521	1	2b3a041b-7967-42bf-96d8-ecfe89a350a3	2010-03-19	8	1014	505
1522	1	38a902d2-7902-4cba-bf3f-ee615367800f	2009-01-01	8	1014	505
1523	1	5bec8848-b32a-4a51-a18e-9de5964eb071	2009-12-08	8	1014	505
1524	1	b9eabe20-7e52-4a95-a40f-745b1af5ac12	2010-12-06	8	1014	505
1525	1	c8e14103-b446-4e7f-b520-b441227a49bd	2010-01-01	8	1014	505
1526	1	11dd6cfc-57f4-470c-99e3-ee7be4700d3a	2010-02-23	8	1014	507
1527	1	7710df59-bd8a-4371-8664-94fa4f54576f	2010-08-04	8	1014	507
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable) FROM stdin;
1010	6	HOLIDAY	HOLIDAY	red	t
1011	5	SICK_LEAVE	SICK_LEAVE	red	t
1012	4	LEAVE	LEAVE	red	t
1013	3	STRIKE	STRIKE	red	t
1014	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t
1015	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts) FROM stdin;
707	1	505	COMPANY_CODE	f	f	f	f	f	f	f	t	t	t
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
1313	1	b851f608-b77a-4a27-99da-914ad5eef302	Peón	t
1314	2	aa31a7e2-5c8d-4337-9943-902349ce593d	Oficial	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
101	14	693c96f8-22c5-4d7b-b2a7-7822325f9180	medicalLeave	t	1	\N
102	13	1c6b250d-1012-4cf1-820f-4a37d63aa0c1	paternityLeave	t	1	\N
103	4	30ff3acb-1955-4e61-a79b-68ae688dc441	hiredResourceWorkingRelationship	t	5	\N
104	3	4b39646a-2e5a-4eb0-8d7f-a1a9b1f8010e	firedResourceWorkingRelationship	t	5	\N
108	1	0cb672be-3c2b-406e-b129-4665b2806c29	Coruña	t	6	\N
109	1	f5719466-e0ac-4e03-99c9-752d497532be	Pontevedra	t	6	\N
300576	1	7c4bc37c-72bc-4f2b-8c3d-6e20d3fa07af	Type 1	t	97484800	\N
300577	1	5b1dda32-5827-491d-bc6c-7c859bad9527	Type 2	t	97484800	\N
105	3	081246b0-675c-4dee-8822-113a1378ca9f	Pintor	t	4	\N
107	3	9375b411-4af5-4a9a-b519-9318fef9fae7	Soldador	t	4	\N
106	3	7d265276-0d48-4892-9c1d-e82a8823b2d0	Capataz	t	4	\N
300578	1	255109e5-fdde-4253-9202-8e16372dae27	Decorador	t	4	\N
2626	2	1c9646bf-1366-4fc3-8b51-48a48834d840	Escultor	t	4	\N
300579	1	a0fc6e41-b5ec-4f05-aaeb-b78e52c32e90	Desencapotador	t	4	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
301204	DIRECT	1	\N	\N	301286	300578	\N	\N
301205	DIRECT	1	\N	\N	301286	109	\N	\N
301562	INDIRECT	13	301124	\N	\N	300578	301536	t
302119	INDIRECT	9	301809	\N	\N	300576	302112	t
302116	INDIRECT	9	301809	\N	\N	109	302091	t
302118	INDIRECT	9	301809	\N	\N	300576	301989	t
302117	INDIRECT	9	301809	\N	\N	109	302115	t
312699	INDIRECT	11	\N	311841	\N	300577	312625	t
312968	DIRECT	10	\N	311865	\N	300577	\N	\N
314421	DIRECT	8	\N	313390	\N	108	\N	\N
317855	DIRECT	1	\N	\N	312311	107	\N	\N
317856	DIRECT	1	\N	\N	312311	109	\N	\N
81977	DIRECT	1	\N	\N	127649	109	\N	\N
81978	INDIRECT	1	127821	\N	\N	109	81977	t
81979	DIRECT	1	\N	\N	127650	109	\N	\N
81980	INDIRECT	1	127822	\N	\N	109	81979	t
81981	DIRECT	1	\N	\N	127651	109	\N	\N
81982	INDIRECT	1	127823	\N	\N	109	81981	t
81983	DIRECT	1	\N	\N	127652	109	\N	\N
81984	INDIRECT	1	127824	\N	\N	109	81983	t
81985	DIRECT	1	\N	\N	127653	109	\N	\N
81986	INDIRECT	1	127825	\N	\N	109	81985	t
81987	DIRECT	1	\N	\N	127654	109	\N	\N
81988	INDIRECT	1	127826	\N	\N	109	81987	t
81989	DIRECT	1	\N	\N	127655	109	\N	\N
81990	INDIRECT	1	127827	\N	\N	109	81989	t
81991	DIRECT	1	\N	\N	127656	109	\N	\N
81992	INDIRECT	1	127828	\N	\N	109	81991	t
81993	DIRECT	1	\N	\N	127657	109	\N	\N
81994	INDIRECT	1	127829	\N	\N	109	81993	t
81995	DIRECT	1	\N	\N	127658	109	\N	\N
81996	INDIRECT	1	127830	\N	\N	109	81995	t
301228	DIRECT	1	\N	\N	301290	108	\N	\N
301229	DIRECT	1	\N	\N	301290	300578	\N	\N
302659	INDIRECT	7	301871	\N	\N	108	302641	t
302661	INDIRECT	7	301871	\N	\N	108	302657	t
302660	INDIRECT	7	301871	\N	\N	300576	302655	t
312620	INDIRECT	12	312130	\N	\N	108	312601	t
312621	INDIRECT	12	312130	\N	\N	300577	312600	t
302664	DIRECT	6	\N	301680	\N	300576	\N	\N
302662	INDIRECT	6	\N	301680	\N	108	302641	t
302665	INDIRECT	6	\N	301680	\N	300576	302640	t
302663	DIRECT	6	\N	301680	\N	108	\N	\N
312622	INDIRECT	11	\N	311834	\N	300577	312600	t
312624	INDIRECT	11	\N	311834	\N	108	312601	t
312623	DIRECT	11	\N	311834	\N	108	\N	\N
312701	INDIRECT	11	\N	311841	\N	300577	312649	t
302667	INDIRECT	7	301872	\N	\N	108	302663	t
302668	INDIRECT	7	301872	\N	\N	108	302641	t
302666	INDIRECT	7	301872	\N	\N	300576	302640	t
302669	INDIRECT	7	301872	\N	\N	300576	302664	t
302671	DIRECT	6	\N	301681	\N	108	\N	\N
302670	INDIRECT	6	\N	301681	\N	300576	302640	t
302672	DIRECT	6	\N	301681	\N	300576	\N	\N
302673	INDIRECT	6	\N	301681	\N	108	302641	t
302676	INDIRECT	7	301873	\N	\N	108	302671	t
302677	INDIRECT	7	301873	\N	\N	300576	302672	t
302674	INDIRECT	7	301873	\N	\N	108	302641	t
302675	INDIRECT	7	301873	\N	\N	300576	302640	t
312636	INDIRECT	12	312131	\N	\N	300577	312625	t
301391	DIRECT	15	\N	300805	\N	109	\N	\N
301392	DIRECT	15	\N	300805	\N	300578	\N	\N
302109	INDIRECT	9	301808	\N	\N	109	302091	t
302113	INDIRECT	11	\N	301606	\N	109	302091	t
302112	DIRECT	11	\N	301606	\N	300576	\N	\N
302115	DIRECT	11	\N	301606	\N	109	\N	\N
302114	INDIRECT	11	\N	301606	\N	300576	301989	t
302458	INDIRECT	9	301843	\N	\N	300578	302456	t
302463	INDIRECT	9	301843	\N	\N	109	302454	t
302462	INDIRECT	9	301843	\N	\N	300578	302450	t
302459	INDIRECT	9	301843	\N	\N	109	302451	t
302460	INDIRECT	9	301843	\N	\N	109	302435	t
302467	DIRECT	9	\N	301652	\N	300578	\N	\N
302464	INDIRECT	9	\N	301652	\N	300578	302450	t
302469	DIRECT	9	\N	301652	\N	109	\N	\N
302466	INDIRECT	9	\N	301652	\N	109	302451	t
302465	INDIRECT	9	\N	301652	\N	300578	302434	t
302468	INDIRECT	9	\N	301652	\N	109	302435	t
302474	INDIRECT	9	301844	\N	\N	300578	302434	t
302470	INDIRECT	9	301844	\N	\N	300578	302467	t
302656	INDIRECT	6	\N	301679	\N	300576	302640	t
312637	INDIRECT	12	312131	\N	\N	108	312629	t
312633	INDIRECT	12	312131	\N	\N	108	312623	t
312634	INDIRECT	12	312131	\N	\N	300577	312600	t
312635	INDIRECT	12	312131	\N	\N	108	312601	t
316746	DIRECT	16	\N	316171	\N	107	\N	\N
312638	INDIRECT	11	\N	311836	\N	300577	312625	t
312639	INDIRECT	11	\N	311836	\N	108	312601	t
302657	DIRECT	6	\N	301679	\N	108	\N	\N
302658	INDIRECT	7	301871	\N	\N	300576	302640	t
301395	DIRECT	15	\N	300806	\N	109	\N	\N
301396	DIRECT	15	\N	300806	\N	300578	\N	\N
301394	INDIRECT	15	\N	300806	\N	300578	301392	t
301393	INDIRECT	15	\N	300806	\N	109	301391	t
301397	INDIRECT	15	301107	\N	\N	300578	301396	t
301399	INDIRECT	15	301107	\N	\N	109	301391	t
301400	INDIRECT	15	301107	\N	\N	109	301395	t
301398	INDIRECT	15	301107	\N	\N	300578	301392	t
301402	INDIRECT	15	\N	300790	\N	300578	301392	t
301401	INDIRECT	15	\N	300790	\N	109	301391	t
301404	INDIRECT	15	301086	\N	\N	300578	301392	t
301403	INDIRECT	15	301086	\N	\N	109	301391	t
301405	DIRECT	15	\N	300807	\N	300578	\N	\N
301408	INDIRECT	15	\N	300807	\N	300578	301392	t
301407	INDIRECT	15	\N	300807	\N	109	301391	t
312713	INDIRECT	11	\N	311842	\N	300577	312600	t
314438	INDIRECT	8	\N	313391	\N	108	314385	t
314433	DIRECT	8	\N	313391	\N	300576	\N	\N
314435	INDIRECT	8	\N	313391	\N	300576	314360	t
314434	INDIRECT	8	\N	313391	\N	300576	314386	t
314447	INDIRECT	8	\N	313392	\N	108	314385	t
314448	INDIRECT	8	\N	313392	\N	300576	314360	t
314450	INDIRECT	8	\N	313392	\N	108	314358	t
301406	DIRECT	15	\N	300807	\N	109	\N	\N
314452	INDIRECT	8	\N	313392	\N	300576	314386	t
301535	DIRECT	14	\N	300824	\N	108	\N	\N
301536	DIRECT	14	\N	300824	\N	300578	\N	\N
301539	INDIRECT	14	\N	300825	\N	300578	301536	t
301537	INDIRECT	14	\N	300825	\N	108	301535	t
301538	DIRECT	14	\N	300825	\N	300578	\N	\N
301540	DIRECT	14	\N	300825	\N	108	\N	\N
301542	INDIRECT	13	301122	\N	\N	300578	301536	t
301911	DIRECT	1	\N	\N	301993	300576	\N	\N
301912	DIRECT	1	\N	\N	301993	109	\N	\N
301544	INDIRECT	13	301122	\N	\N	108	301540	t
301543	INDIRECT	13	301122	\N	\N	300578	301538	t
301541	INDIRECT	13	301122	\N	\N	108	301535	t
301546	INDIRECT	14	\N	300796	\N	300578	301536	t
301545	INDIRECT	14	\N	300796	\N	108	301535	t
301547	INDIRECT	13	301096	\N	\N	300578	301536	t
301548	INDIRECT	13	301096	\N	\N	108	301535	t
301550	DIRECT	14	\N	300826	\N	300578	\N	\N
301552	DIRECT	14	\N	300826	\N	108	\N	\N
301549	INDIRECT	14	\N	300826	\N	108	301535	t
301551	INDIRECT	14	\N	300826	\N	300578	301536	t
302482	INDIRECT	9	\N	301654	\N	300578	302450	t
302483	DIRECT	9	\N	301654	\N	300578	\N	\N
302480	INDIRECT	9	\N	301654	\N	109	302451	t
302481	INDIRECT	9	\N	301654	\N	109	302435	t
302488	INDIRECT	9	301845	\N	\N	300578	302450	t
302489	INDIRECT	9	301845	\N	\N	109	302484	t
302487	INDIRECT	9	301845	\N	\N	109	302451	t
302486	INDIRECT	9	301845	\N	\N	300578	302434	t
302490	INDIRECT	9	301845	\N	\N	109	302435	t
301412	INDIRECT	15	301108	\N	\N	109	301406	t
301411	INDIRECT	15	301108	\N	\N	109	301391	t
301409	INDIRECT	15	301108	\N	\N	300578	301405	t
312233	DIRECT	1	\N	\N	312295	108	\N	\N
312234	DIRECT	1	\N	\N	312295	300577	\N	\N
316739	DIRECT	16	\N	316170	\N	108	\N	\N
312663	INDIRECT	12	312133	\N	\N	108	312623	t
312983	DIRECT	10	\N	311867	\N	109	\N	\N
301410	INDIRECT	15	301108	\N	\N	300578	301392	t
301414	INDIRECT	15	\N	300808	\N	109	301391	t
301416	DIRECT	15	\N	300808	\N	300578	\N	\N
301413	INDIRECT	15	\N	300808	\N	300578	301392	t
301415	DIRECT	15	\N	300808	\N	109	\N	\N
301417	INDIRECT	15	301109	\N	\N	109	301391	t
301418	INDIRECT	15	301109	\N	\N	300578	301416	t
301420	INDIRECT	15	301109	\N	\N	109	301415	t
301419	INDIRECT	15	301109	\N	\N	300578	301392	t
302562	DIRECT	1	\N	\N	301997	300576	\N	\N
302563	DIRECT	1	\N	\N	301997	108	\N	\N
301555	INDIRECT	13	301123	\N	\N	300578	301536	t
301553	INDIRECT	13	301123	\N	\N	108	301552	t
301556	INDIRECT	13	301123	\N	\N	108	301535	t
301554	INDIRECT	13	301123	\N	\N	300578	301550	t
301557	DIRECT	14	\N	300827	\N	108	\N	\N
301559	INDIRECT	14	\N	300827	\N	108	301535	t
301560	INDIRECT	14	\N	300827	\N	300578	301536	t
301558	DIRECT	14	\N	300827	\N	300578	\N	\N
301563	INDIRECT	13	301124	\N	\N	300578	301558	t
301561	INDIRECT	13	301124	\N	\N	108	301535	t
301564	INDIRECT	13	301124	\N	\N	108	301557	t
301568	DIRECT	14	\N	300828	\N	108	\N	\N
301565	DIRECT	14	\N	300828	\N	300578	\N	\N
301566	INDIRECT	14	\N	300828	\N	300578	301536	t
301567	INDIRECT	14	\N	300828	\N	108	301535	t
301570	INDIRECT	13	301125	\N	\N	108	301535	t
301569	INDIRECT	13	301125	\N	\N	300578	301565	t
312241	DIRECT	1	\N	\N	312299	109	\N	\N
312242	DIRECT	1	\N	\N	312299	300577	\N	\N
301571	INDIRECT	13	301125	\N	\N	108	301568	t
301572	INDIRECT	13	301125	\N	\N	300578	301536	t
302091	DIRECT	11	\N	301603	\N	109	\N	\N
312600	DIRECT	11	\N	311831	\N	300577	\N	\N
312601	DIRECT	11	\N	311831	\N	108	\N	\N
301989	DIRECT	11	\N	301603	\N	300576	\N	\N
302092	DIRECT	11	\N	301604	\N	109	\N	\N
302095	INDIRECT	11	\N	301604	\N	109	302091	t
302094	INDIRECT	11	\N	301604	\N	300576	301989	t
312604	INDIRECT	11	\N	311832	\N	300577	312600	t
312603	DIRECT	11	\N	311832	\N	300577	\N	\N
312605	INDIRECT	11	\N	311832	\N	108	312601	t
312602	DIRECT	11	\N	311832	\N	108	\N	\N
316661	DIRECT	16	\N	316162	\N	107	\N	\N
317348	DIRECT	13	\N	316218	\N	105	\N	\N
302093	DIRECT	11	\N	301604	\N	300576	\N	\N
302097	INDIRECT	9	301807	\N	\N	300576	301989	t
302098	INDIRECT	9	301807	\N	\N	300576	302093	t
302099	INDIRECT	9	301807	\N	\N	109	302092	t
302096	INDIRECT	9	301807	\N	\N	109	302091	t
302101	INDIRECT	11	\N	301592	\N	109	302091	t
302100	INDIRECT	11	\N	301592	\N	300576	301989	t
317394	INDIRECT	13	\N	316222	\N	108	317386	t
312609	INDIRECT	12	312129	\N	\N	300577	312603	t
312607	INDIRECT	12	312129	\N	\N	300577	312600	t
317395	INDIRECT	13	\N	316222	\N	108	317324	t
312606	INDIRECT	12	312129	\N	\N	108	312601	t
312608	INDIRECT	12	312129	\N	\N	108	312602	t
312611	INDIRECT	11	\N	311799	\N	300577	312600	t
312610	INDIRECT	11	\N	311799	\N	108	312601	t
312612	INDIRECT	12	312095	\N	\N	108	312601	t
312702	INDIRECT	11	\N	311841	\N	300577	312600	t
312703	DIRECT	11	\N	311841	\N	108	\N	\N
317389	DIRECT	13	\N	316222	\N	105	\N	\N
317390	DIRECT	13	\N	316222	\N	108	\N	\N
302103	INDIRECT	9	301794	\N	\N	109	302091	t
302102	INDIRECT	9	301794	\N	\N	300576	301989	t
302105	INDIRECT	11	\N	301605	\N	300576	301989	t
302104	DIRECT	11	\N	301605	\N	109	\N	\N
302107	INDIRECT	11	\N	301605	\N	109	302091	t
302106	DIRECT	11	\N	301605	\N	300576	\N	\N
302111	INDIRECT	9	301808	\N	\N	109	302104	t
302108	INDIRECT	9	301808	\N	\N	300576	302106	t
302110	INDIRECT	9	301808	\N	\N	300576	301989	t
302122	DIRECT	11	\N	301607	\N	300576	\N	\N
302120	INDIRECT	11	\N	301607	\N	300576	301989	t
302123	INDIRECT	11	\N	301607	\N	109	302091	t
302121	DIRECT	11	\N	301607	\N	109	\N	\N
302127	INDIRECT	9	301810	\N	\N	300576	302122	t
302126	INDIRECT	9	301810	\N	\N	109	302091	t
302124	INDIRECT	9	301810	\N	\N	300576	301989	t
302125	INDIRECT	9	301810	\N	\N	109	302121	t
302475	INDIRECT	9	301844	\N	\N	109	302435	t
302472	INDIRECT	9	301844	\N	\N	300578	302450	t
302471	INDIRECT	9	301844	\N	\N	109	302469	t
302473	INDIRECT	9	301844	\N	\N	109	302451	t
302476	INDIRECT	9	\N	301653	\N	300578	302450	t
302477	INDIRECT	9	\N	301653	\N	109	302451	t
302478	INDIRECT	9	\N	301653	\N	300578	302434	t
302479	INDIRECT	9	\N	301653	\N	109	302435	t
302485	INDIRECT	9	\N	301654	\N	300578	302434	t
302484	DIRECT	9	\N	301654	\N	109	\N	\N
302491	INDIRECT	9	301845	\N	\N	300578	302483	t
302494	INDIRECT	9	\N	301655	\N	109	302435	t
302492	INDIRECT	9	\N	301655	\N	300578	302434	t
302493	INDIRECT	9	\N	301655	\N	300578	302450	t
316787	INDIRECT	16	\N	316174	\N	107	316781	t
316795	INDIRECT	16	\N	316174	\N	108	316739	t
316789	INDIRECT	16	\N	316174	\N	108	316678	t
316796	INDIRECT	16	\N	316174	\N	107	316661	t
316793	DIRECT	16	\N	316174	\N	108	\N	\N
316790	INDIRECT	16	\N	316174	\N	107	316740	t
316807	INDIRECT	16	313792	\N	\N	107	316661	t
316802	INDIRECT	16	313792	\N	\N	107	316781	t
316804	INDIRECT	16	313792	\N	\N	107	316788	t
316800	INDIRECT	16	313792	\N	\N	108	316785	t
316810	INDIRECT	16	313792	\N	\N	108	316678	t
316809	INDIRECT	16	313792	\N	\N	108	316739	t
316805	INDIRECT	16	313792	\N	\N	107	316703	t
316740	DIRECT	16	\N	316170	\N	107	\N	\N
302434	DIRECT	9	\N	301647	\N	300578	\N	\N
302435	DIRECT	9	\N	301647	\N	109	\N	\N
302437	DIRECT	9	\N	301648	\N	300578	\N	\N
302439	INDIRECT	9	\N	301648	\N	300578	302434	t
302438	INDIRECT	9	\N	301648	\N	109	302435	t
302436	DIRECT	9	\N	301648	\N	109	\N	\N
302442	INDIRECT	9	301841	\N	\N	300578	302437	t
302443	INDIRECT	9	301841	\N	\N	109	302436	t
302441	INDIRECT	9	301841	\N	\N	300578	302434	t
302440	INDIRECT	9	301841	\N	\N	109	302435	t
302444	INDIRECT	9	\N	301649	\N	300578	302434	t
302445	INDIRECT	9	\N	301649	\N	109	302435	t
302446	INDIRECT	9	301842	\N	\N	300578	302434	t
302447	INDIRECT	9	301842	\N	\N	109	302435	t
302449	INDIRECT	9	\N	301650	\N	109	302435	t
302450	DIRECT	9	\N	301650	\N	300578	\N	\N
302448	INDIRECT	9	\N	301650	\N	300578	302434	t
302451	DIRECT	9	\N	301650	\N	109	\N	\N
302457	INDIRECT	9	\N	301651	\N	300578	302450	t
302455	INDIRECT	9	\N	301651	\N	109	302435	t
302456	DIRECT	9	\N	301651	\N	300578	\N	\N
302454	DIRECT	9	\N	301651	\N	109	\N	\N
302453	INDIRECT	9	\N	301651	\N	300578	302434	t
302452	INDIRECT	9	\N	301651	\N	109	302451	t
302461	INDIRECT	9	301843	\N	\N	300578	302434	t
302640	DIRECT	6	\N	301677	\N	300576	\N	\N
302641	DIRECT	6	\N	301677	\N	108	\N	\N
302644	INDIRECT	6	\N	301678	\N	300576	302640	t
302643	DIRECT	6	\N	301678	\N	108	\N	\N
302642	DIRECT	6	\N	301678	\N	300576	\N	\N
302645	INDIRECT	6	\N	301678	\N	108	302641	t
302647	INDIRECT	7	301870	\N	\N	300576	302640	t
302649	INDIRECT	7	301870	\N	\N	108	302641	t
302646	INDIRECT	7	301870	\N	\N	108	302643	t
302648	INDIRECT	7	301870	\N	\N	300576	302642	t
302651	INDIRECT	6	\N	301666	\N	300576	302640	t
302650	INDIRECT	6	\N	301666	\N	108	302641	t
302652	INDIRECT	7	301857	\N	\N	108	302641	t
302653	INDIRECT	7	301857	\N	\N	300576	302640	t
302654	INDIRECT	6	\N	301679	\N	108	302641	t
302655	DIRECT	6	\N	301679	\N	300576	\N	\N
318402	DIRECT	11	\N	317708	\N	109	\N	\N
302495	INDIRECT	9	\N	301655	\N	109	302451	t
302496	INDIRECT	9	301846	\N	\N	109	302435	t
302498	INDIRECT	9	301846	\N	\N	109	302451	t
302497	INDIRECT	9	301846	\N	\N	300578	302450	t
302499	INDIRECT	9	301846	\N	\N	300578	302434	t
302505	DIRECT	9	\N	301656	\N	300578	\N	\N
302503	INDIRECT	9	\N	301656	\N	300578	302450	t
302502	INDIRECT	9	\N	301656	\N	109	302451	t
302500	INDIRECT	9	\N	301656	\N	300578	302434	t
302501	INDIRECT	9	\N	301656	\N	109	302435	t
302504	DIRECT	9	\N	301656	\N	109	\N	\N
302506	INDIRECT	9	301847	\N	\N	300578	302434	t
302507	INDIRECT	9	301847	\N	\N	300578	302450	t
302511	INDIRECT	9	301847	\N	\N	109	302451	t
302508	INDIRECT	9	301847	\N	\N	300578	302505	t
302509	INDIRECT	9	301847	\N	\N	109	302504	t
302510	INDIRECT	9	301847	\N	\N	109	302435	t
302514	DIRECT	9	\N	301657	\N	109	\N	\N
302513	INDIRECT	9	\N	301657	\N	300578	302434	t
302515	INDIRECT	9	\N	301657	\N	109	302435	t
302512	DIRECT	9	\N	301657	\N	300578	\N	\N
302519	INDIRECT	9	301848	\N	\N	109	302514	t
302518	INDIRECT	9	301848	\N	\N	300578	302434	t
302517	INDIRECT	9	301848	\N	\N	109	302435	t
302516	INDIRECT	9	301848	\N	\N	300578	302512	t
302522	INDIRECT	9	\N	301658	\N	109	302435	t
302521	DIRECT	9	\N	301658	\N	300578	\N	\N
302523	INDIRECT	9	\N	301658	\N	300578	302434	t
302520	DIRECT	9	\N	301658	\N	109	\N	\N
302524	INDIRECT	9	301849	\N	\N	300578	302434	t
302525	INDIRECT	9	301849	\N	\N	300578	302521	t
302526	INDIRECT	9	301849	\N	\N	109	302520	t
302527	INDIRECT	9	301849	\N	\N	109	302435	t
302530	INDIRECT	9	\N	301659	\N	109	302435	t
302529	DIRECT	9	\N	301659	\N	300578	\N	\N
302528	INDIRECT	9	\N	301659	\N	300578	302434	t
302531	DIRECT	9	\N	301659	\N	109	\N	\N
302532	INDIRECT	9	301850	\N	\N	300578	302529	t
302533	INDIRECT	9	301850	\N	\N	300578	302434	t
302535	INDIRECT	9	301850	\N	\N	109	302435	t
302534	INDIRECT	9	301850	\N	\N	109	302531	t
316685	INDIRECT	15	313786	\N	\N	108	316662	t
316689	INDIRECT	15	313786	\N	\N	108	316678	t
316688	INDIRECT	15	313786	\N	\N	107	316675	t
316691	INDIRECT	16	\N	316166	\N	107	316661	t
314454	DIRECT	8	\N	313392	\N	108	\N	\N
314453	INDIRECT	8	\N	313392	\N	300576	314343	t
314458	INDIRECT	6	313755	\N	\N	108	314385	t
314457	INDIRECT	6	313755	\N	\N	300576	314451	t
314462	INDIRECT	6	313755	\N	\N	108	314358	t
314455	INDIRECT	6	313755	\N	\N	300576	314360	t
314460	INDIRECT	6	313755	\N	\N	108	314344	t
314456	INDIRECT	6	313755	\N	\N	300576	314343	t
314459	INDIRECT	6	313755	\N	\N	108	314454	t
314461	INDIRECT	6	313755	\N	\N	300576	314386	t
314463	INDIRECT	8	\N	313393	\N	108	314358	t
314466	DIRECT	8	\N	313393	\N	108	\N	\N
314467	INDIRECT	8	\N	313393	\N	300576	314343	t
314465	INDIRECT	8	\N	313393	\N	300576	314386	t
314468	INDIRECT	8	\N	313393	\N	108	314344	t
314469	DIRECT	8	\N	313393	\N	300576	\N	\N
312613	INDIRECT	12	312095	\N	\N	300577	312600	t
312614	DIRECT	11	\N	311833	\N	108	\N	\N
312616	INDIRECT	11	\N	311833	\N	300577	312600	t
312617	INDIRECT	11	\N	311833	\N	108	312601	t
312615	DIRECT	11	\N	311833	\N	300577	\N	\N
312619	INDIRECT	12	312130	\N	\N	108	312614	t
312618	INDIRECT	12	312130	\N	\N	300577	312615	t
312698	DIRECT	11	\N	311841	\N	300577	\N	\N
312709	INDIRECT	12	312136	\N	\N	300577	312625	t
312706	INDIRECT	12	312136	\N	\N	300577	312600	t
312711	INDIRECT	12	312136	\N	\N	108	312623	t
312710	INDIRECT	12	312136	\N	\N	108	312647	t
312707	INDIRECT	12	312136	\N	\N	300577	312649	t
312704	INDIRECT	12	312136	\N	\N	300577	312698	t
312708	INDIRECT	12	312136	\N	\N	108	312601	t
312705	INDIRECT	12	312136	\N	\N	108	312703	t
312717	INDIRECT	11	\N	311842	\N	300577	312649	t
312715	INDIRECT	11	\N	311842	\N	108	312647	t
316662	DIRECT	16	\N	316162	\N	108	\N	\N
316663	INDIRECT	16	\N	316163	\N	108	316662	t
316665	INDIRECT	16	\N	316163	\N	107	316661	t
316664	DIRECT	16	\N	316163	\N	107	\N	\N
316666	DIRECT	16	\N	316163	\N	108	\N	\N
316668	INDIRECT	15	313785	\N	\N	107	316664	t
312716	INDIRECT	11	\N	311842	\N	108	312623	t
312712	INDIRECT	11	\N	311842	\N	108	312601	t
312718	DIRECT	11	\N	311842	\N	108	\N	\N
312719	DIRECT	11	\N	311842	\N	300577	\N	\N
316670	INDIRECT	15	313785	\N	\N	107	316661	t
312714	INDIRECT	11	\N	311842	\N	300577	312625	t
312721	INDIRECT	12	312137	\N	\N	300577	312600	t
312720	INDIRECT	12	312137	\N	\N	108	312601	t
312724	INDIRECT	12	312137	\N	\N	108	312623	t
312727	INDIRECT	12	312137	\N	\N	108	312647	t
312726	INDIRECT	12	312137	\N	\N	108	312718	t
312722	INDIRECT	12	312137	\N	\N	300577	312649	t
312723	INDIRECT	12	312137	\N	\N	300577	312719	t
312969	DIRECT	10	\N	311865	\N	109	\N	\N
316667	INDIRECT	15	313785	\N	\N	108	316662	t
316669	INDIRECT	15	313785	\N	\N	108	316666	t
316671	INDIRECT	16	\N	316133	\N	107	316661	t
316672	INDIRECT	16	\N	316133	\N	108	316662	t
316674	INDIRECT	15	313762	\N	\N	108	316662	t
316673	INDIRECT	15	313762	\N	\N	107	316661	t
316675	DIRECT	16	\N	316164	\N	107	\N	\N
312625	DIRECT	11	\N	311834	\N	300577	\N	\N
312629	DIRECT	11	\N	311835	\N	108	\N	\N
312626	INDIRECT	11	\N	311835	\N	300577	312625	t
312628	DIRECT	11	\N	311835	\N	300577	\N	\N
312630	INDIRECT	11	\N	311835	\N	300577	312600	t
312631	INDIRECT	11	\N	311835	\N	108	312623	t
312627	INDIRECT	11	\N	311835	\N	108	312601	t
312632	INDIRECT	12	312131	\N	\N	300577	312628	t
312641	INDIRECT	11	\N	311836	\N	108	312623	t
316865	DIRECT	1	\N	\N	312307	108	\N	\N
316866	DIRECT	1	\N	\N	312307	105	\N	\N
316726	INDIRECT	16	\N	316169	\N	107	316675	t
312640	INDIRECT	11	\N	311836	\N	300577	312600	t
312642	INDIRECT	12	312132	\N	\N	108	312601	t
312643	INDIRECT	12	312132	\N	\N	108	312623	t
312645	INDIRECT	12	312132	\N	\N	300577	312625	t
312644	INDIRECT	12	312132	\N	\N	300577	312600	t
312649	DIRECT	11	\N	311837	\N	300577	\N	\N
312647	DIRECT	11	\N	311837	\N	108	\N	\N
312650	INDIRECT	11	\N	311837	\N	300577	312625	t
316722	INDIRECT	16	\N	316169	\N	107	316703	t
313855	INDIRECT	7	313711	\N	\N	300576	313816	t
313858	INDIRECT	7	313711	\N	\N	300576	313838	t
313856	INDIRECT	7	313711	\N	\N	109	313699	t
313857	INDIRECT	7	313711	\N	\N	300576	313698	t
313853	INDIRECT	7	313711	\N	\N	109	313814	t
313854	INDIRECT	7	313711	\N	\N	109	313846	t
313851	INDIRECT	7	313711	\N	\N	300576	313847	t
313852	INDIRECT	7	313711	\N	\N	109	313841	t
319219	INDIRECT	8	\N	318970	\N	105	319189	t
319227	INDIRECT	8	\N	318971	\N	105	318913	t
319228	INDIRECT	8	\N	318971	\N	105	319189	t
319229	INDIRECT	8	\N	318971	\N	109	318911	t
319226	INDIRECT	8	\N	318971	\N	105	318897	t
319231	INDIRECT	8	\N	318971	\N	109	318936	t
319245	INDIRECT	8	\N	318972	\N	109	319190	t
319244	INDIRECT	8	\N	318972	\N	105	319189	t
319242	INDIRECT	8	\N	318972	\N	109	318911	t
319256	INDIRECT	7	318675	\N	\N	109	318936	t
319251	INDIRECT	7	318675	\N	\N	109	318911	t
319254	INDIRECT	7	318675	\N	\N	105	318935	t
319255	INDIRECT	7	318675	\N	\N	109	318896	t
319257	INDIRECT	7	318675	\N	\N	105	318913	t
319383	DIRECT	7	\N	318981	\N	106	\N	\N
312648	INDIRECT	11	\N	311837	\N	108	312623	t
312651	INDIRECT	11	\N	311837	\N	300577	312600	t
312646	INDIRECT	11	\N	311837	\N	108	312601	t
312654	DIRECT	11	\N	311838	\N	108	\N	\N
312655	INDIRECT	11	\N	311838	\N	108	312647	t
312653	INDIRECT	11	\N	311838	\N	108	312623	t
312659	INDIRECT	11	\N	311838	\N	300577	312600	t
312656	INDIRECT	11	\N	311838	\N	108	312601	t
312658	INDIRECT	11	\N	311838	\N	300577	312649	t
312652	INDIRECT	11	\N	311838	\N	300577	312625	t
312657	DIRECT	11	\N	311838	\N	300577	\N	\N
312661	INDIRECT	12	312133	\N	\N	300577	312649	t
312666	INDIRECT	12	312133	\N	\N	108	312601	t
312665	INDIRECT	12	312133	\N	\N	300577	312657	t
312667	INDIRECT	12	312133	\N	\N	300577	312600	t
312662	INDIRECT	12	312133	\N	\N	108	312654	t
312660	INDIRECT	12	312133	\N	\N	108	312647	t
312664	INDIRECT	12	312133	\N	\N	300577	312625	t
312672	INDIRECT	11	\N	311839	\N	300577	312600	t
312668	INDIRECT	11	\N	311839	\N	108	312647	t
312670	INDIRECT	11	\N	311839	\N	108	312601	t
312669	INDIRECT	11	\N	311839	\N	300577	312625	t
312673	INDIRECT	11	\N	311839	\N	300577	312649	t
312671	INDIRECT	11	\N	311839	\N	108	312623	t
318375	INDIRECT	11	\N	317706	\N	107	318281	t
318370	INDIRECT	11	\N	317706	\N	109	318284	t
318374	INDIRECT	11	\N	317706	\N	109	318317	t
318385	INDIRECT	11	\N	317707	\N	109	318317	t
318391	INDIRECT	11	\N	317707	\N	109	318255	t
318389	INDIRECT	11	\N	317707	\N	107	318281	t
312677	INDIRECT	12	312134	\N	\N	300577	312625	t
312674	INDIRECT	12	312134	\N	\N	108	312601	t
312675	INDIRECT	12	312134	\N	\N	108	312647	t
312679	INDIRECT	12	312134	\N	\N	300577	312600	t
312676	INDIRECT	12	312134	\N	\N	300577	312649	t
312678	INDIRECT	12	312134	\N	\N	108	312623	t
312687	DIRECT	11	\N	311840	\N	300577	\N	\N
318392	INDIRECT	11	\N	317707	\N	107	318257	t
318404	DIRECT	11	\N	317708	\N	107	\N	\N
312996	INDIRECT	10	312155	\N	\N	109	312983	t
312992	INDIRECT	10	312155	\N	\N	300577	312985	t
312995	INDIRECT	10	312155	\N	\N	300577	312968	t
312993	INDIRECT	10	312155	\N	\N	109	312986	t
312998	INDIRECT	10	\N	311869	\N	300577	312968	t
313001	INDIRECT	10	\N	311869	\N	109	312969	t
312999	INDIRECT	10	\N	311869	\N	109	312983	t
313021	INDIRECT	10	312157	\N	\N	300577	313017	t
313022	INDIRECT	10	312157	\N	\N	300577	312968	t
313027	INDIRECT	10	312157	\N	\N	109	312983	t
313023	INDIRECT	10	312157	\N	\N	109	312969	t
313020	INDIRECT	10	312157	\N	\N	300577	312985	t
313033	INDIRECT	10	\N	311872	\N	109	312969	t
312685	INDIRECT	11	\N	311840	\N	108	312601	t
312680	INDIRECT	11	\N	311840	\N	108	312647	t
312681	DIRECT	11	\N	311840	\N	108	\N	\N
312686	INDIRECT	11	\N	311840	\N	300577	312649	t
312682	INDIRECT	11	\N	311840	\N	300577	312600	t
312683	INDIRECT	11	\N	311840	\N	108	312623	t
312684	INDIRECT	11	\N	311840	\N	300577	312625	t
318394	DIRECT	11	\N	317707	\N	109	\N	\N
312691	INDIRECT	12	312135	\N	\N	300577	312600	t
312688	INDIRECT	12	312135	\N	\N	300577	312625	t
312689	INDIRECT	12	312135	\N	\N	300577	312649	t
312693	INDIRECT	12	312135	\N	\N	108	312647	t
312695	INDIRECT	12	312135	\N	\N	300577	312687	t
312692	INDIRECT	12	312135	\N	\N	108	312601	t
312694	INDIRECT	12	312135	\N	\N	108	312623	t
312690	INDIRECT	12	312135	\N	\N	108	312681	t
312700	INDIRECT	11	\N	311841	\N	108	312623	t
312696	INDIRECT	11	\N	311841	\N	108	312647	t
313030	INDIRECT	10	\N	311872	\N	300577	313011	t
313031	INDIRECT	10	\N	311872	\N	300577	312968	t
313032	INDIRECT	10	\N	311872	\N	300577	312985	t
313029	INDIRECT	10	\N	311872	\N	109	313009	t
313028	INDIRECT	10	\N	311872	\N	109	312983	t
313037	INDIRECT	10	312158	\N	\N	109	312983	t
313034	INDIRECT	10	312158	\N	\N	109	313009	t
313036	INDIRECT	10	312158	\N	\N	300577	313011	t
313035	INDIRECT	10	312158	\N	\N	109	312969	t
313039	INDIRECT	10	312158	\N	\N	300577	312985	t
313038	INDIRECT	10	312158	\N	\N	300577	312968	t
313042	INDIRECT	10	\N	311873	\N	300577	312968	t
313045	INDIRECT	10	\N	311873	\N	300577	312985	t
313041	INDIRECT	10	\N	311873	\N	109	312969	t
313046	DIRECT	10	\N	311873	\N	109	\N	\N
313043	INDIRECT	10	\N	311873	\N	300577	313011	t
313040	INDIRECT	10	\N	311873	\N	109	313009	t
313044	INDIRECT	10	\N	311873	\N	109	312983	t
313052	INDIRECT	10	312159	\N	\N	109	313009	t
313053	INDIRECT	10	312159	\N	\N	300577	312968	t
313049	INDIRECT	10	312159	\N	\N	109	312983	t
313051	INDIRECT	10	312159	\N	\N	109	313046	t
313055	INDIRECT	10	312159	\N	\N	300577	313011	t
312697	INDIRECT	11	\N	311841	\N	108	312601	t
312725	INDIRECT	12	312137	\N	\N	300577	312625	t
312970	DIRECT	10	\N	311866	\N	300577	\N	\N
312972	INDIRECT	10	\N	311866	\N	109	312969	t
312973	INDIRECT	10	\N	311866	\N	300577	312968	t
312971	DIRECT	10	\N	311866	\N	109	\N	\N
312977	INDIRECT	10	312154	\N	\N	300577	312968	t
312975	INDIRECT	10	312154	\N	\N	300577	312970	t
312976	INDIRECT	10	312154	\N	\N	109	312969	t
316678	DIRECT	16	\N	316164	\N	108	\N	\N
312974	INDIRECT	10	312154	\N	\N	109	312971	t
312979	INDIRECT	10	\N	311806	\N	300577	312968	t
312978	INDIRECT	10	\N	311806	\N	109	312969	t
312981	INDIRECT	10	312102	\N	\N	109	312969	t
312980	INDIRECT	10	312102	\N	\N	300577	312968	t
312982	INDIRECT	10	\N	311867	\N	109	312969	t
312984	INDIRECT	10	\N	311867	\N	300577	312968	t
312985	DIRECT	10	\N	311867	\N	300577	\N	\N
312986	DIRECT	10	\N	311868	\N	109	\N	\N
312990	INDIRECT	10	\N	311868	\N	300577	312968	t
312987	DIRECT	10	\N	311868	\N	300577	\N	\N
312989	INDIRECT	10	\N	311868	\N	300577	312985	t
312988	INDIRECT	10	\N	311868	\N	109	312983	t
312991	INDIRECT	10	\N	311868	\N	109	312969	t
312997	INDIRECT	10	312155	\N	\N	109	312969	t
312994	INDIRECT	10	312155	\N	\N	300577	312987	t
313048	INDIRECT	10	312159	\N	\N	300577	313047	t
313050	INDIRECT	10	312159	\N	\N	300577	312985	t
313054	INDIRECT	10	312159	\N	\N	109	312969	t
313058	INDIRECT	10	\N	311874	\N	109	312983	t
313062	INDIRECT	10	\N	311874	\N	109	313009	t
313056	INDIRECT	10	\N	311874	\N	300577	313011	t
313059	INDIRECT	10	\N	311874	\N	300577	312985	t
313061	INDIRECT	10	\N	311874	\N	300577	312968	t
313063	DIRECT	10	\N	311874	\N	109	\N	\N
313060	DIRECT	10	\N	311874	\N	300577	\N	\N
313057	INDIRECT	10	\N	311874	\N	109	312969	t
313071	INDIRECT	10	312160	\N	\N	300577	312968	t
313066	INDIRECT	10	312160	\N	\N	109	313009	t
313068	INDIRECT	10	312160	\N	\N	300577	312985	t
313065	INDIRECT	10	312160	\N	\N	300577	313011	t
313067	INDIRECT	10	312160	\N	\N	109	312983	t
313064	INDIRECT	10	312160	\N	\N	109	313063	t
313069	INDIRECT	10	312160	\N	\N	300577	313060	t
316676	INDIRECT	16	\N	316164	\N	108	316662	t
316677	INDIRECT	16	\N	316164	\N	107	316661	t
316680	DIRECT	16	\N	316165	\N	108	\N	\N
316679	INDIRECT	16	\N	316165	\N	107	316675	t
316693	INDIRECT	16	\N	316166	\N	107	316675	t
316694	INDIRECT	16	\N	316166	\N	108	316662	t
316692	INDIRECT	16	\N	316166	\N	108	316678	t
313070	INDIRECT	10	312160	\N	\N	109	312969	t
316801	INDIRECT	16	313792	\N	\N	108	316793	t
316803	INDIRECT	16	313792	\N	\N	108	316701	t
316799	INDIRECT	16	313792	\N	\N	108	316662	t
316806	INDIRECT	16	313792	\N	\N	107	316675	t
316808	INDIRECT	16	313792	\N	\N	107	316740	t
316813	INDIRECT	16	\N	316175	\N	107	316740	t
316814	INDIRECT	16	\N	316175	\N	107	316703	t
316818	INDIRECT	16	\N	316175	\N	107	316781	t
316815	INDIRECT	16	\N	316175	\N	107	316661	t
316820	INDIRECT	16	\N	316175	\N	108	316701	t
316811	INDIRECT	16	\N	316175	\N	108	316662	t
316816	INDIRECT	16	\N	316175	\N	107	316675	t
316819	INDIRECT	16	\N	316175	\N	108	316739	t
316817	INDIRECT	16	\N	316175	\N	108	316785	t
316812	INDIRECT	16	\N	316175	\N	108	316678	t
316822	INDIRECT	16	313793	\N	\N	108	316701	t
316828	INDIRECT	16	313793	\N	\N	107	316703	t
316830	INDIRECT	16	313793	\N	\N	107	316661	t
313079	INDIRECT	10	\N	311875	\N	109	312969	t
313072	INDIRECT	10	\N	311875	\N	300577	312985	t
313076	DIRECT	10	\N	311875	\N	109	\N	\N
313077	INDIRECT	10	\N	311875	\N	300577	312968	t
313075	INDIRECT	10	\N	311875	\N	109	313009	t
313074	INDIRECT	10	\N	311875	\N	109	312983	t
313073	INDIRECT	10	\N	311875	\N	300577	313011	t
313000	INDIRECT	10	\N	311869	\N	300577	312985	t
313005	INDIRECT	10	312156	\N	\N	109	312983	t
313004	INDIRECT	10	312156	\N	\N	300577	312968	t
313002	INDIRECT	10	312156	\N	\N	300577	312985	t
313003	INDIRECT	10	312156	\N	\N	109	312969	t
313007	INDIRECT	10	\N	311870	\N	300577	312968	t
313011	DIRECT	10	\N	311870	\N	300577	\N	\N
313008	INDIRECT	10	\N	311870	\N	109	312969	t
313009	DIRECT	10	\N	311870	\N	109	\N	\N
313006	INDIRECT	10	\N	311870	\N	109	312983	t
313010	INDIRECT	10	\N	311870	\N	300577	312985	t
313018	INDIRECT	10	\N	311871	\N	300577	312968	t
313015	INDIRECT	10	\N	311871	\N	109	312969	t
313013	DIRECT	10	\N	311871	\N	109	\N	\N
313016	INDIRECT	10	\N	311871	\N	300577	312985	t
313019	INDIRECT	10	\N	311871	\N	109	313009	t
313014	INDIRECT	10	\N	311871	\N	109	312983	t
313017	DIRECT	10	\N	311871	\N	300577	\N	\N
313012	INDIRECT	10	\N	311871	\N	300577	313011	t
313026	INDIRECT	10	312157	\N	\N	109	313009	t
313025	INDIRECT	10	312157	\N	\N	109	313013	t
313024	INDIRECT	10	312157	\N	\N	300577	313011	t
313078	DIRECT	10	\N	311875	\N	300577	\N	\N
313084	INDIRECT	10	312161	\N	\N	109	312969	t
313080	INDIRECT	10	312161	\N	\N	109	313076	t
313087	INDIRECT	10	312161	\N	\N	109	313009	t
313083	INDIRECT	10	312161	\N	\N	109	312983	t
313081	INDIRECT	10	312161	\N	\N	300577	313078	t
313086	INDIRECT	10	312161	\N	\N	300577	312968	t
313082	INDIRECT	10	312161	\N	\N	300577	312985	t
313085	INDIRECT	10	312161	\N	\N	300577	313011	t
313699	DIRECT	9	\N	313329	\N	109	\N	\N
313698	DIRECT	9	\N	313329	\N	300576	\N	\N
313703	DIRECT	9	\N	313330	\N	109	\N	\N
313702	INDIRECT	9	\N	313330	\N	300576	313698	t
313701	INDIRECT	9	\N	313330	\N	109	313699	t
313700	DIRECT	9	\N	313330	\N	300576	\N	\N
313808	INDIRECT	7	313707	\N	\N	109	313699	t
313704	INDIRECT	7	313707	\N	\N	300576	313700	t
316825	INDIRECT	16	313793	\N	\N	108	316785	t
316829	INDIRECT	16	313793	\N	\N	108	316662	t
317308	DIRECT	13	\N	316213	\N	108	\N	\N
317311	INDIRECT	13	\N	316214	\N	108	317308	t
317312	DIRECT	13	\N	316214	\N	105	\N	\N
317313	DIRECT	13	\N	316214	\N	108	\N	\N
317310	INDIRECT	13	\N	316214	\N	105	317309	t
317350	INDIRECT	13	\N	316218	\N	105	317325	t
317349	INDIRECT	13	\N	316218	\N	108	317324	t
317351	INDIRECT	13	\N	316218	\N	108	317308	t
317355	INDIRECT	13	\N	316219	\N	108	317324	t
317356	INDIRECT	13	\N	316219	\N	108	317308	t
317357	INDIRECT	13	\N	316219	\N	105	317325	t
317359	INDIRECT	13	\N	316219	\N	108	317346	t
317358	INDIRECT	13	\N	316219	\N	105	317309	t
317353	DIRECT	13	\N	316219	\N	105	\N	\N
317352	DIRECT	13	\N	316219	\N	108	\N	\N
317354	INDIRECT	13	\N	316219	\N	105	317348	t
317371	INDIRECT	13	\N	316220	\N	108	317308	t
317369	INDIRECT	13	\N	316220	\N	108	317346	t
317368	INDIRECT	13	\N	316220	\N	108	317324	t
317370	INDIRECT	13	\N	316220	\N	105	317325	t
317373	INDIRECT	13	\N	316220	\N	105	317309	t
317372	INDIRECT	13	\N	316220	\N	105	317348	t
317387	INDIRECT	13	\N	316221	\N	105	317309	t
317381	DIRECT	13	\N	316221	\N	105	\N	\N
317383	INDIRECT	13	\N	316221	\N	108	317324	t
313807	INDIRECT	7	313707	\N	\N	109	313703	t
313705	INDIRECT	7	313707	\N	\N	300576	313698	t
313810	INDIRECT	9	\N	313331	\N	300576	313698	t
313809	INDIRECT	9	\N	313331	\N	109	313699	t
313811	INDIRECT	7	313708	\N	\N	109	313699	t
317384	INDIRECT	13	\N	316221	\N	108	317308	t
317385	INDIRECT	13	\N	316221	\N	105	317325	t
313047	DIRECT	10	\N	311873	\N	300577	\N	\N
313812	INDIRECT	7	313708	\N	\N	300576	313698	t
313815	INDIRECT	9	\N	313332	\N	109	313699	t
313816	DIRECT	9	\N	313332	\N	300576	\N	\N
313813	INDIRECT	9	\N	313332	\N	300576	313698	t
313814	DIRECT	9	\N	313332	\N	109	\N	\N
313821	INDIRECT	9	\N	313333	\N	300576	313698	t
313825	INDIRECT	7	313709	\N	\N	300576	313822	t
313823	INDIRECT	7	313709	\N	\N	109	313814	t
313828	INDIRECT	7	313709	\N	\N	300576	313816	t
313826	INDIRECT	7	313709	\N	\N	109	313817	t
313827	INDIRECT	7	313709	\N	\N	109	313699	t
313824	INDIRECT	7	313709	\N	\N	300576	313698	t
313833	INDIRECT	7	313710	\N	\N	300576	313698	t
313836	INDIRECT	7	313710	\N	\N	109	313814	t
313835	INDIRECT	7	313710	\N	\N	300576	313816	t
313834	INDIRECT	7	313710	\N	\N	109	313699	t
313849	INDIRECT	9	\N	313336	\N	300576	313816	t
313850	INDIRECT	9	\N	313336	\N	300576	313698	t
313848	INDIRECT	9	\N	313336	\N	300576	313838	t
313843	INDIRECT	9	\N	313336	\N	109	313814	t
313845	INDIRECT	9	\N	313336	\N	109	313841	t
313844	INDIRECT	9	\N	313336	\N	109	313699	t
313846	DIRECT	9	\N	313336	\N	109	\N	\N
313859	INDIRECT	9	\N	313337	\N	109	313841	t
313862	INDIRECT	9	\N	313337	\N	300576	313698	t
313864	INDIRECT	9	\N	313337	\N	109	313699	t
313860	INDIRECT	9	\N	313337	\N	109	313814	t
313863	INDIRECT	9	\N	313337	\N	300576	313816	t
313866	INDIRECT	7	313712	\N	\N	109	313841	t
313869	INDIRECT	7	313712	\N	\N	300576	313816	t
313867	INDIRECT	7	313712	\N	\N	109	313814	t
313868	INDIRECT	7	313712	\N	\N	300576	313698	t
313865	INDIRECT	7	313712	\N	\N	109	313699	t
313870	INDIRECT	7	313712	\N	\N	300576	313838	t
313884	INDIRECT	7	313713	\N	\N	300576	313816	t
313886	INDIRECT	7	313713	\N	\N	300576	313875	t
313883	INDIRECT	7	313713	\N	\N	109	313699	t
313880	INDIRECT	7	313713	\N	\N	109	313841	t
313882	INDIRECT	7	313713	\N	\N	109	313814	t
313885	INDIRECT	7	313713	\N	\N	300576	313838	t
313881	INDIRECT	7	313713	\N	\N	300576	313698	t
313879	INDIRECT	7	313713	\N	\N	109	313874	t
313900	INDIRECT	7	313714	\N	\N	300576	313816	t
313901	INDIRECT	7	313714	\N	\N	109	313888	t
313896	INDIRECT	7	313714	\N	\N	109	313841	t
313899	INDIRECT	7	313714	\N	\N	300576	313838	t
313902	INDIRECT	7	313714	\N	\N	109	313699	t
313897	INDIRECT	7	313714	\N	\N	300576	313891	t
313895	INDIRECT	7	313714	\N	\N	109	313814	t
313898	INDIRECT	7	313714	\N	\N	300576	313698	t
313905	INDIRECT	9	\N	313340	\N	300576	313816	t
313908	INDIRECT	9	\N	313340	\N	109	313841	t
313909	INDIRECT	9	\N	313340	\N	109	313814	t
313910	INDIRECT	9	\N	313340	\N	109	313699	t
313906	DIRECT	9	\N	313340	\N	300576	\N	\N
313911	INDIRECT	7	313715	\N	\N	300576	313838	t
313918	INDIRECT	7	313715	\N	\N	109	313903	t
313914	INDIRECT	7	313715	\N	\N	109	313814	t
313913	INDIRECT	7	313715	\N	\N	300576	313698	t
313912	INDIRECT	7	313715	\N	\N	300576	313816	t
313917	INDIRECT	7	313715	\N	\N	109	313699	t
313916	INDIRECT	7	313715	\N	\N	300576	313906	t
313915	INDIRECT	7	313715	\N	\N	109	313841	t
313926	INDIRECT	9	\N	313341	\N	300576	313816	t
313925	INDIRECT	9	\N	313341	\N	109	313814	t
313922	INDIRECT	9	\N	313341	\N	300576	313698	t
313920	INDIRECT	9	\N	313341	\N	300576	313838	t
313924	INDIRECT	9	\N	313341	\N	109	313841	t
313921	DIRECT	9	\N	313341	\N	300576	\N	\N
313919	DIRECT	9	\N	313341	\N	109	\N	\N
313923	INDIRECT	9	\N	313341	\N	109	313699	t
314362	INDIRECT	8	\N	313385	\N	108	314344	t
314363	DIRECT	8	\N	313385	\N	108	\N	\N
314364	INDIRECT	8	\N	313385	\N	300576	314360	t
314366	DIRECT	8	\N	313385	\N	300576	\N	\N
314365	INDIRECT	8	\N	313385	\N	300576	314343	t
314370	INDIRECT	6	313749	\N	\N	108	314358	t
314368	INDIRECT	6	313749	\N	\N	300576	314360	t
314367	INDIRECT	6	313749	\N	\N	108	314344	t
314371	INDIRECT	6	313749	\N	\N	300576	314343	t
314369	INDIRECT	6	313749	\N	\N	300576	314366	t
316684	DIRECT	16	\N	316165	\N	107	\N	\N
316682	INDIRECT	16	\N	316165	\N	108	316678	t
316681	INDIRECT	16	\N	316165	\N	107	316661	t
316683	INDIRECT	16	\N	316165	\N	108	316662	t
313861	INDIRECT	9	\N	313337	\N	300576	313838	t
313875	DIRECT	9	\N	313338	\N	300576	\N	\N
313876	INDIRECT	9	\N	313338	\N	300576	313816	t
313874	DIRECT	9	\N	313338	\N	109	\N	\N
313878	INDIRECT	9	\N	313338	\N	109	313699	t
313871	INDIRECT	9	\N	313338	\N	300576	313838	t
313872	INDIRECT	9	\N	313338	\N	300576	313698	t
313877	INDIRECT	9	\N	313338	\N	109	313841	t
313873	INDIRECT	9	\N	313338	\N	109	313814	t
313893	INDIRECT	9	\N	313339	\N	300576	313838	t
313890	INDIRECT	9	\N	313339	\N	300576	313816	t
313892	INDIRECT	9	\N	313339	\N	109	313841	t
313888	DIRECT	9	\N	313339	\N	109	\N	\N
313887	INDIRECT	9	\N	313339	\N	300576	313698	t
313891	DIRECT	9	\N	313339	\N	300576	\N	\N
313889	INDIRECT	9	\N	313339	\N	109	313814	t
313894	INDIRECT	9	\N	313339	\N	109	313699	t
313904	INDIRECT	9	\N	313340	\N	300576	313838	t
313903	DIRECT	9	\N	313340	\N	109	\N	\N
313907	INDIRECT	9	\N	313340	\N	300576	313698	t
313930	INDIRECT	7	313716	\N	\N	300576	313838	t
313932	INDIRECT	7	313716	\N	\N	300576	313816	t
313934	INDIRECT	7	313716	\N	\N	109	313699	t
313927	INDIRECT	7	313716	\N	\N	109	313919	t
313929	INDIRECT	7	313716	\N	\N	109	313814	t
313931	INDIRECT	7	313716	\N	\N	109	313841	t
313933	INDIRECT	7	313716	\N	\N	300576	313921	t
313928	INDIRECT	7	313716	\N	\N	300576	313698	t
316686	INDIRECT	15	313786	\N	\N	108	316680	t
316690	INDIRECT	15	313786	\N	\N	107	316661	t
316687	INDIRECT	15	313786	\N	\N	107	316684	t
317386	DIRECT	13	\N	316221	\N	108	\N	\N
317380	INDIRECT	13	\N	316221	\N	108	317346	t
317382	INDIRECT	13	\N	316221	\N	105	317348	t
317392	INDIRECT	13	\N	316222	\N	108	317346	t
314372	INDIRECT	6	313749	\N	\N	108	314363	t
314374	INDIRECT	8	\N	313386	\N	300576	314343	t
314376	INDIRECT	8	\N	313386	\N	108	314358	t
314373	INDIRECT	8	\N	313386	\N	300576	314360	t
314375	INDIRECT	8	\N	313386	\N	108	314344	t
314377	INDIRECT	6	313750	\N	\N	108	314358	t
314379	INDIRECT	6	313750	\N	\N	108	314344	t
314380	INDIRECT	6	313750	\N	\N	300576	314360	t
314378	INDIRECT	6	313750	\N	\N	300576	314343	t
314386	DIRECT	8	\N	313387	\N	300576	\N	\N
314382	INDIRECT	8	\N	313387	\N	300576	314360	t
314396	INDIRECT	6	313751	\N	\N	300576	314394	t
317391	INDIRECT	13	\N	316222	\N	108	317308	t
317388	INDIRECT	13	\N	316222	\N	105	317381	t
317397	INDIRECT	13	\N	316222	\N	105	317309	t
317393	INDIRECT	13	\N	316222	\N	105	317348	t
317396	INDIRECT	13	\N	316222	\N	105	317325	t
317413	INDIRECT	13	\N	316223	\N	108	317308	t
317411	INDIRECT	13	\N	316223	\N	105	317381	t
317410	INDIRECT	13	\N	316223	\N	108	317346	t
317415	INDIRECT	13	\N	316223	\N	105	317348	t
317414	INDIRECT	13	\N	316223	\N	108	317386	t
317408	INDIRECT	13	\N	316223	\N	105	317309	t
317409	INDIRECT	13	\N	316223	\N	105	317325	t
317412	INDIRECT	13	\N	316223	\N	108	317324	t
314397	INDIRECT	6	313751	\N	\N	300576	314360	t
314402	INDIRECT	6	313751	\N	\N	108	314358	t
317427	INDIRECT	13	\N	316224	\N	105	317381	t
317433	INDIRECT	13	\N	316224	\N	108	317324	t
316714	INDIRECT	15	313788	\N	\N	108	316678	t
316783	INDIRECT	16	\N	316173	\N	108	316739	t
314343	DIRECT	8	\N	313381	\N	300576	\N	\N
314344	DIRECT	8	\N	313381	\N	108	\N	\N
314347	DIRECT	8	\N	313382	\N	300576	\N	\N
314346	DIRECT	8	\N	313382	\N	108	\N	\N
314345	INDIRECT	8	\N	313382	\N	300576	314343	t
314348	INDIRECT	8	\N	313382	\N	108	314344	t
314349	INDIRECT	6	313747	\N	\N	300576	314347	t
314352	INDIRECT	6	313747	\N	\N	108	314346	t
314350	INDIRECT	6	313747	\N	\N	108	314344	t
314351	INDIRECT	6	313747	\N	\N	300576	314343	t
314353	INDIRECT	8	\N	313383	\N	300576	314343	t
314354	INDIRECT	8	\N	313383	\N	108	314344	t
314356	INDIRECT	6	313748	\N	\N	300576	314343	t
314355	INDIRECT	6	313748	\N	\N	108	314344	t
314358	DIRECT	8	\N	313384	\N	108	\N	\N
314359	INDIRECT	8	\N	313384	\N	108	314344	t
314357	INDIRECT	8	\N	313384	\N	300576	314343	t
314360	DIRECT	8	\N	313384	\N	300576	\N	\N
314361	INDIRECT	8	\N	313385	\N	108	314358	t
316778	INDIRECT	16	\N	316173	\N	108	316678	t
316786	INDIRECT	16	\N	316173	\N	108	316701	t
316779	INDIRECT	16	\N	316173	\N	107	316675	t
316782	INDIRECT	16	\N	316173	\N	108	316662	t
316784	INDIRECT	16	\N	316173	\N	107	316661	t
316777	INDIRECT	16	\N	316173	\N	107	316703	t
316780	INDIRECT	16	\N	316173	\N	107	316740	t
316792	INDIRECT	16	\N	316174	\N	108	316785	t
314381	INDIRECT	8	\N	313387	\N	108	314358	t
314383	INDIRECT	8	\N	313387	\N	108	314344	t
314384	INDIRECT	8	\N	313387	\N	300576	314343	t
314385	DIRECT	8	\N	313387	\N	108	\N	\N
314391	INDIRECT	8	\N	313388	\N	108	314344	t
314387	INDIRECT	8	\N	313388	\N	300576	314343	t
314390	INDIRECT	8	\N	313388	\N	108	314385	t
314389	INDIRECT	8	\N	313388	\N	300576	314360	t
314388	DIRECT	8	\N	313388	\N	108	\N	\N
314394	DIRECT	8	\N	313388	\N	300576	\N	\N
314392	INDIRECT	8	\N	313388	\N	108	314358	t
314393	INDIRECT	8	\N	313388	\N	300576	314386	t
314395	INDIRECT	6	313751	\N	\N	108	314344	t
314398	INDIRECT	6	313751	\N	\N	108	314385	t
314401	INDIRECT	6	313751	\N	\N	300576	314343	t
314400	INDIRECT	6	313751	\N	\N	300576	314386	t
314399	INDIRECT	6	313751	\N	\N	108	314388	t
314403	INDIRECT	8	\N	313389	\N	300576	314386	t
314404	INDIRECT	8	\N	313389	\N	300576	314343	t
314405	INDIRECT	8	\N	313389	\N	108	314385	t
316794	INDIRECT	16	\N	316174	\N	107	316703	t
317424	DIRECT	13	\N	316224	\N	108	\N	\N
317428	INDIRECT	13	\N	316224	\N	108	317346	t
317429	INDIRECT	13	\N	316224	\N	108	317308	t
317430	INDIRECT	13	\N	316224	\N	108	317386	t
317431	INDIRECT	13	\N	316224	\N	105	317348	t
317425	INDIRECT	13	\N	316224	\N	105	317309	t
317426	INDIRECT	13	\N	316224	\N	105	317325	t
317432	DIRECT	13	\N	316224	\N	105	\N	\N
314408	INDIRECT	8	\N	313389	\N	300576	314360	t
314406	INDIRECT	8	\N	313389	\N	108	314344	t
314407	INDIRECT	8	\N	313389	\N	108	314358	t
314409	INDIRECT	6	313752	\N	\N	300576	314386	t
314410	INDIRECT	6	313752	\N	\N	300576	314343	t
314413	INDIRECT	6	313752	\N	\N	108	314344	t
317439	INDIRECT	13	\N	316225	\N	108	317346	t
317435	INDIRECT	13	\N	316225	\N	108	317324	t
317443	INDIRECT	13	\N	316225	\N	108	317308	t
317436	INDIRECT	13	\N	316225	\N	108	317386	t
317445	INDIRECT	13	\N	316225	\N	108	317424	t
317440	INDIRECT	13	\N	316225	\N	105	317381	t
317438	DIRECT	13	\N	316225	\N	108	\N	\N
314412	INDIRECT	6	313752	\N	\N	108	314358	t
314414	INDIRECT	6	313752	\N	\N	300576	314360	t
314411	INDIRECT	6	313752	\N	\N	108	314385	t
314419	INDIRECT	8	\N	313390	\N	300576	314386	t
314418	DIRECT	8	\N	313390	\N	300576	\N	\N
314415	INDIRECT	8	\N	313390	\N	108	314385	t
314422	INDIRECT	8	\N	313390	\N	108	314344	t
314420	INDIRECT	8	\N	313390	\N	300576	314343	t
314416	INDIRECT	8	\N	313390	\N	108	314358	t
314417	INDIRECT	8	\N	313390	\N	300576	314360	t
314430	INDIRECT	6	313753	\N	\N	108	314344	t
314425	INDIRECT	6	313753	\N	\N	300576	314360	t
314427	INDIRECT	6	313753	\N	\N	108	314421	t
314429	INDIRECT	6	313753	\N	\N	108	314358	t
314426	INDIRECT	6	313753	\N	\N	108	314385	t
314424	INDIRECT	6	313753	\N	\N	300576	314386	t
314423	INDIRECT	6	313753	\N	\N	300576	314343	t
314428	INDIRECT	6	313753	\N	\N	300576	314418	t
314431	INDIRECT	8	\N	313391	\N	108	314344	t
314436	INDIRECT	8	\N	313391	\N	108	314358	t
314437	DIRECT	8	\N	313391	\N	108	\N	\N
314432	INDIRECT	8	\N	313391	\N	300576	314343	t
314446	INDIRECT	6	313754	\N	\N	108	314437	t
314442	INDIRECT	6	313754	\N	\N	300576	314343	t
314445	INDIRECT	6	313754	\N	\N	300576	314433	t
314441	INDIRECT	6	313754	\N	\N	108	314344	t
314439	INDIRECT	6	313754	\N	\N	108	314358	t
314440	INDIRECT	6	313754	\N	\N	300576	314386	t
314444	INDIRECT	6	313754	\N	\N	300576	314360	t
314443	INDIRECT	6	313754	\N	\N	108	314385	t
314451	DIRECT	8	\N	313392	\N	300576	\N	\N
314449	INDIRECT	8	\N	313392	\N	108	314344	t
314470	INDIRECT	8	\N	313393	\N	300576	314360	t
314464	INDIRECT	8	\N	313393	\N	108	314385	t
314471	INDIRECT	6	313756	\N	\N	300576	314343	t
314475	INDIRECT	6	313756	\N	\N	300576	314386	t
314473	INDIRECT	6	313756	\N	\N	300576	314360	t
314476	INDIRECT	6	313756	\N	\N	108	314358	t
314477	INDIRECT	6	313756	\N	\N	108	314385	t
314474	INDIRECT	6	313756	\N	\N	108	314466	t
314478	INDIRECT	6	313756	\N	\N	108	314344	t
314472	INDIRECT	6	313756	\N	\N	300576	314469	t
314501	DIRECT	1	\N	\N	312303	108	\N	\N
314502	DIRECT	1	\N	\N	312303	107	\N	\N
317444	INDIRECT	13	\N	316225	\N	105	317309	t
317442	INDIRECT	13	\N	316225	\N	105	317325	t
317437	DIRECT	13	\N	316225	\N	105	\N	\N
317434	INDIRECT	13	\N	316225	\N	105	317432	t
317441	INDIRECT	13	\N	316225	\N	105	317348	t
317467	INDIRECT	13	\N	316226	\N	105	317381	t
317462	INDIRECT	13	\N	316226	\N	105	317348	t
317464	INDIRECT	13	\N	316226	\N	105	317309	t
317460	INDIRECT	13	\N	316226	\N	108	317324	t
317465	INDIRECT	13	\N	316226	\N	108	317424	t
317461	INDIRECT	13	\N	316226	\N	108	317308	t
317463	INDIRECT	13	\N	316226	\N	105	317432	t
317459	INDIRECT	13	\N	316226	\N	105	317325	t
317466	INDIRECT	13	\N	316226	\N	108	317386	t
317458	INDIRECT	13	\N	316226	\N	108	317346	t
317542	DIRECT	12	\N	317664	\N	107	\N	\N
317543	DIRECT	12	\N	317664	\N	109	\N	\N
318255	DIRECT	11	\N	317696	\N	109	\N	\N
318257	DIRECT	11	\N	317696	\N	107	\N	\N
318261	INDIRECT	11	\N	317697	\N	109	318255	t
318259	DIRECT	11	\N	317697	\N	107	\N	\N
318263	DIRECT	11	\N	317697	\N	109	\N	\N
318260	INDIRECT	11	\N	317697	\N	107	318257	t
318279	INDIRECT	11	\N	317699	\N	109	318255	t
318284	DIRECT	11	\N	317699	\N	109	\N	\N
318281	DIRECT	11	\N	317699	\N	107	\N	\N
318280	INDIRECT	11	\N	317699	\N	107	318257	t
318286	INDIRECT	11	\N	317700	\N	109	318255	t
318292	INDIRECT	11	\N	317700	\N	107	318257	t
318289	INDIRECT	11	\N	317700	\N	109	318284	t
318290	DIRECT	11	\N	317700	\N	109	\N	\N
318285	INDIRECT	11	\N	317700	\N	107	318281	t
318287	DIRECT	11	\N	317700	\N	107	\N	\N
318314	INDIRECT	11	\N	317702	\N	109	318284	t
318318	INDIRECT	11	\N	317702	\N	109	318255	t
318317	DIRECT	11	\N	317702	\N	109	\N	\N
318316	INDIRECT	11	\N	317702	\N	107	318257	t
318325	DIRECT	11	\N	317703	\N	107	\N	\N
313819	INDIRECT	9	\N	313333	\N	109	313699	t
313822	DIRECT	9	\N	313333	\N	300576	\N	\N
313818	INDIRECT	9	\N	313333	\N	109	313814	t
313817	DIRECT	9	\N	313333	\N	109	\N	\N
313820	INDIRECT	9	\N	313333	\N	300576	313816	t
313830	INDIRECT	9	\N	313334	\N	300576	313816	t
313831	INDIRECT	9	\N	313334	\N	109	313699	t
313829	INDIRECT	9	\N	313334	\N	300576	313698	t
313832	INDIRECT	9	\N	313334	\N	109	313814	t
316730	INDIRECT	15	313789	\N	\N	107	316675	t
316728	INDIRECT	15	313789	\N	\N	108	316701	t
313840	INDIRECT	9	\N	313335	\N	109	313699	t
313838	DIRECT	9	\N	313335	\N	300576	\N	\N
313842	INDIRECT	9	\N	313335	\N	300576	313816	t
313837	INDIRECT	9	\N	313335	\N	300576	313698	t
313839	INDIRECT	9	\N	313335	\N	109	313814	t
313841	DIRECT	9	\N	313335	\N	109	\N	\N
313847	DIRECT	9	\N	313336	\N	300576	\N	\N
316727	INDIRECT	15	313789	\N	\N	107	316661	t
316736	INDIRECT	16	\N	316170	\N	108	316678	t
316737	INDIRECT	16	\N	316170	\N	107	316703	t
316735	INDIRECT	16	\N	316170	\N	107	316661	t
316733	INDIRECT	16	\N	316170	\N	108	316701	t
316738	INDIRECT	16	\N	316170	\N	107	316675	t
316734	INDIRECT	16	\N	316170	\N	108	316662	t
316745	INDIRECT	16	\N	316171	\N	107	316675	t
316749	INDIRECT	16	\N	316171	\N	108	316678	t
316741	INDIRECT	16	\N	316171	\N	107	316661	t
316748	INDIRECT	16	\N	316171	\N	108	316701	t
316742	DIRECT	16	\N	316171	\N	108	\N	\N
316750	INDIRECT	16	\N	316171	\N	108	316662	t
316743	INDIRECT	16	\N	316171	\N	108	316739	t
316747	INDIRECT	16	\N	316171	\N	107	316740	t
316744	INDIRECT	16	\N	316171	\N	107	316703	t
316755	INDIRECT	15	313790	\N	\N	107	316746	t
316753	INDIRECT	15	313790	\N	\N	108	316739	t
316757	INDIRECT	15	313790	\N	\N	108	316742	t
316756	INDIRECT	15	313790	\N	\N	108	316662	t
316751	INDIRECT	15	313790	\N	\N	107	316675	t
316759	INDIRECT	15	313790	\N	\N	108	316701	t
316760	INDIRECT	15	313790	\N	\N	108	316678	t
316754	INDIRECT	15	313790	\N	\N	107	316740	t
316758	INDIRECT	15	313790	\N	\N	107	316661	t
316752	INDIRECT	15	313790	\N	\N	107	316703	t
316767	INDIRECT	16	\N	316172	\N	107	316703	t
316768	INDIRECT	16	\N	316172	\N	108	316701	t
316764	INDIRECT	16	\N	316172	\N	107	316740	t
316766	INDIRECT	16	\N	316172	\N	108	316739	t
318322	INDIRECT	11	\N	317703	\N	107	318257	t
318473	DIRECT	1	\N	\N	312315	105	\N	\N
316763	INDIRECT	16	\N	316172	\N	108	316662	t
316785	DIRECT	16	\N	316173	\N	108	\N	\N
317315	INDIRECT	12	316956	\N	\N	105	317309	t
317317	INDIRECT	12	316956	\N	\N	108	317313	t
317316	INDIRECT	12	316956	\N	\N	108	317308	t
317319	INDIRECT	13	\N	316184	\N	105	317309	t
317318	INDIRECT	13	\N	316184	\N	108	317308	t
317321	INDIRECT	12	313802	\N	\N	105	317309	t
317320	INDIRECT	12	313802	\N	\N	108	317308	t
317323	INDIRECT	13	\N	316215	\N	108	317308	t
317324	DIRECT	13	\N	316215	\N	108	\N	\N
317325	DIRECT	13	\N	316215	\N	105	\N	\N
317322	INDIRECT	13	\N	316215	\N	105	317309	t
317330	INDIRECT	13	\N	316216	\N	105	317325	t
317331	INDIRECT	13	\N	316216	\N	108	317308	t
317328	INDIRECT	13	\N	316216	\N	105	317309	t
317327	DIRECT	13	\N	316216	\N	108	\N	\N
317329	INDIRECT	13	\N	316216	\N	108	317324	t
317336	INDIRECT	12	316957	\N	\N	105	317326	t
317332	INDIRECT	12	316957	\N	\N	108	317324	t
317335	INDIRECT	12	316957	\N	\N	105	317325	t
317334	INDIRECT	12	316957	\N	\N	105	317309	t
317333	INDIRECT	12	316957	\N	\N	108	317308	t
317337	INDIRECT	12	316957	\N	\N	108	317327	t
317341	INDIRECT	13	\N	316217	\N	105	317309	t
317340	INDIRECT	13	\N	316217	\N	108	317308	t
317339	INDIRECT	13	\N	316217	\N	105	317325	t
317338	INDIRECT	13	\N	316217	\N	108	317324	t
318474	DIRECT	1	\N	\N	312315	109	\N	\N
317345	INDIRECT	12	316958	\N	\N	105	317309	t
317342	INDIRECT	12	316958	\N	\N	108	317308	t
317344	INDIRECT	12	316958	\N	\N	108	317324	t
317343	INDIRECT	12	316958	\N	\N	105	317325	t
317346	DIRECT	13	\N	316218	\N	108	\N	\N
317347	INDIRECT	13	\N	316218	\N	105	317309	t
318342	INDIRECT	11	\N	317704	\N	109	318255	t
318344	INDIRECT	11	\N	317704	\N	107	318313	t
318345	INDIRECT	11	\N	317704	\N	107	318257	t
318348	INDIRECT	11	\N	317704	\N	107	318281	t
318346	INDIRECT	11	\N	317704	\N	109	318317	t
318347	INDIRECT	11	\N	317704	\N	109	318284	t
318353	INDIRECT	11	\N	317705	\N	107	318257	t
318349	DIRECT	11	\N	317705	\N	109	\N	\N
318355	INDIRECT	11	\N	317705	\N	107	318313	t
318356	INDIRECT	11	\N	317705	\N	109	318317	t
318350	INDIRECT	11	\N	317705	\N	109	318255	t
318351	DIRECT	11	\N	317705	\N	107	\N	\N
318352	INDIRECT	11	\N	317705	\N	109	318284	t
318357	INDIRECT	11	\N	317705	\N	107	318281	t
318369	INDIRECT	11	\N	317706	\N	107	318257	t
318371	INDIRECT	11	\N	317706	\N	107	318313	t
318372	INDIRECT	11	\N	317706	\N	109	318255	t
318387	INDIRECT	11	\N	317707	\N	107	318313	t
318386	INDIRECT	11	\N	317707	\N	109	318284	t
318390	DIRECT	11	\N	317707	\N	107	\N	\N
318406	INDIRECT	11	\N	317708	\N	109	318284	t
318405	INDIRECT	11	\N	317708	\N	107	318390	t
318401	INDIRECT	11	\N	317708	\N	109	318394	t
318397	INDIRECT	11	\N	317708	\N	107	318313	t
318398	INDIRECT	11	\N	317708	\N	107	318257	t
318403	INDIRECT	11	\N	317708	\N	107	318281	t
318395	INDIRECT	11	\N	317708	\N	109	318255	t
318400	INDIRECT	11	\N	317708	\N	109	318317	t
318422	INDIRECT	11	\N	317709	\N	107	318313	t
318423	INDIRECT	11	\N	317709	\N	109	318284	t
318426	INDIRECT	11	\N	317709	\N	107	318281	t
318421	INDIRECT	11	\N	317709	\N	109	318255	t
318428	INDIRECT	11	\N	317709	\N	109	318317	t
318419	INDIRECT	11	\N	317709	\N	107	318390	t
318427	INDIRECT	11	\N	317709	\N	109	318394	t
318424	INDIRECT	11	\N	317709	\N	107	318257	t
318429	INDIRECT	11	317019	\N	\N	107	318313	t
318431	INDIRECT	11	317019	\N	\N	107	318390	t
318896	DIRECT	8	\N	318959	\N	109	\N	\N
318897	DIRECT	8	\N	318959	\N	105	\N	\N
318899	DIRECT	8	\N	318960	\N	105	\N	\N
318898	INDIRECT	8	\N	318960	\N	109	318896	t
318901	DIRECT	8	\N	318960	\N	109	\N	\N
318900	INDIRECT	8	\N	318960	\N	105	318897	t
318904	INDIRECT	7	318667	\N	\N	105	318897	t
318903	INDIRECT	7	318667	\N	\N	109	318896	t
318902	INDIRECT	7	318667	\N	\N	105	318899	t
318905	INDIRECT	7	318667	\N	\N	109	318901	t
318906	INDIRECT	8	\N	317718	\N	109	318896	t
318907	INDIRECT	8	\N	317718	\N	105	318897	t
318909	INDIRECT	7	317028	\N	\N	109	318896	t
318908	INDIRECT	7	317028	\N	\N	105	318897	t
318910	INDIRECT	8	\N	318961	\N	109	318896	t
318911	DIRECT	8	\N	318961	\N	109	\N	\N
318912	INDIRECT	8	\N	318961	\N	105	318897	t
318913	DIRECT	8	\N	318961	\N	105	\N	\N
318914	INDIRECT	8	\N	318962	\N	105	318913	t
318917	INDIRECT	8	\N	318962	\N	105	318897	t
318915	DIRECT	8	\N	318962	\N	105	\N	\N
318918	INDIRECT	8	\N	318962	\N	109	318911	t
318919	INDIRECT	8	\N	318962	\N	109	318896	t
318916	DIRECT	8	\N	318962	\N	109	\N	\N
318929	INDIRECT	8	\N	318963	\N	109	318896	t
318928	INDIRECT	8	\N	318963	\N	109	318911	t
318926	INDIRECT	8	\N	318963	\N	105	318913	t
318927	INDIRECT	8	\N	318963	\N	105	318897	t
318939	INDIRECT	8	\N	318964	\N	109	318911	t
318937	INDIRECT	8	\N	318964	\N	105	318897	t
318935	DIRECT	8	\N	318964	\N	105	\N	\N
318936	DIRECT	8	\N	318964	\N	109	\N	\N
318938	INDIRECT	8	\N	318964	\N	109	318896	t
318934	INDIRECT	8	\N	318964	\N	105	318913	t
318947	INDIRECT	8	\N	318965	\N	105	318935	t
318940	INDIRECT	8	\N	318965	\N	109	318936	t
318945	DIRECT	8	\N	318965	\N	109	\N	\N
318944	INDIRECT	8	\N	318965	\N	105	318897	t
318942	INDIRECT	8	\N	318965	\N	105	318913	t
318946	INDIRECT	8	\N	318965	\N	109	318896	t
318943	DIRECT	8	\N	318965	\N	105	\N	\N
319177	INDIRECT	8	\N	318967	\N	105	318897	t
319172	DIRECT	8	\N	318967	\N	105	\N	\N
319174	INDIRECT	8	\N	318967	\N	109	318936	t
319176	INDIRECT	8	\N	318967	\N	109	318896	t
319171	INDIRECT	8	\N	318967	\N	105	318935	t
319173	INDIRECT	8	\N	318967	\N	109	318911	t
319188	INDIRECT	8	\N	318968	\N	105	318913	t
319191	INDIRECT	8	\N	318968	\N	109	318936	t
319186	INDIRECT	8	\N	318968	\N	105	318935	t
319193	INDIRECT	8	\N	318968	\N	109	318911	t
319192	INDIRECT	8	\N	318968	\N	109	318896	t
319187	INDIRECT	8	\N	318968	\N	105	318897	t
319190	DIRECT	8	\N	318968	\N	109	\N	\N
319203	INDIRECT	8	\N	318969	\N	109	318911	t
319201	INDIRECT	8	\N	318969	\N	109	318896	t
319194	DIRECT	8	\N	318969	\N	105	\N	\N
319198	INDIRECT	8	\N	318969	\N	109	318936	t
319200	INDIRECT	8	\N	318969	\N	105	319189	t
319217	INDIRECT	8	\N	318970	\N	109	318911	t
317848	INDIRECT	12	316988	\N	\N	109	317543	t
317847	INDIRECT	12	316988	\N	\N	107	317542	t
318267	INDIRECT	11	317011	\N	\N	109	318263	t
318275	INDIRECT	11	317012	\N	\N	109	318255	t
318278	INDIRECT	11	317012	\N	\N	107	318257	t
318296	INDIRECT	11	317013	\N	\N	109	318290	t
338077	INDIRECT	3	316987	\N	\N	106	338076	t
338078	INDIRECT	3	316987	\N	\N	108	338075	t
319220	INDIRECT	8	\N	318970	\N	105	318935	t
319221	INDIRECT	8	\N	318970	\N	109	318896	t
319214	INDIRECT	8	\N	318970	\N	109	319190	t
319223	DIRECT	8	\N	318971	\N	105	\N	\N
319230	DIRECT	8	\N	318971	\N	109	\N	\N
319224	INDIRECT	8	\N	318971	\N	109	318896	t
319222	INDIRECT	8	\N	318971	\N	109	319190	t
319225	INDIRECT	8	\N	318971	\N	105	318935	t
338075	DIRECT	2	\N	317663	\N	108	\N	\N
338076	DIRECT	2	\N	317663	\N	106	\N	\N
316771	INDIRECT	15	313791	\N	\N	107	316740	t
316774	INDIRECT	15	313791	\N	\N	108	316662	t
316773	INDIRECT	15	313791	\N	\N	107	316703	t
316769	INDIRECT	15	313791	\N	\N	108	316678	t
316788	DIRECT	16	\N	316174	\N	107	\N	\N
316791	INDIRECT	16	\N	316174	\N	107	316675	t
316798	INDIRECT	16	\N	316174	\N	108	316662	t
316797	INDIRECT	16	\N	316174	\N	108	316701	t
316823	INDIRECT	16	313793	\N	\N	107	316740	t
316821	INDIRECT	16	313793	\N	\N	107	316675	t
316827	INDIRECT	16	313793	\N	\N	108	316739	t
316826	INDIRECT	16	313793	\N	\N	107	316781	t
316824	INDIRECT	16	313793	\N	\N	108	316678	t
317309	DIRECT	13	\N	316213	\N	105	\N	\N
317314	INDIRECT	12	316956	\N	\N	105	317312	t
317366	INDIRECT	12	316959	\N	\N	108	317308	t
317363	INDIRECT	12	316959	\N	\N	105	317325	t
317360	INDIRECT	12	316959	\N	\N	105	317353	t
317367	INDIRECT	12	316959	\N	\N	105	317309	t
317364	INDIRECT	12	316959	\N	\N	108	317324	t
317365	INDIRECT	12	316959	\N	\N	108	317352	t
317362	INDIRECT	12	316959	\N	\N	105	317348	t
317361	INDIRECT	12	316959	\N	\N	108	317346	t
317377	INDIRECT	12	316960	\N	\N	105	317348	t
317378	INDIRECT	12	316960	\N	\N	108	317324	t
317375	INDIRECT	12	316960	\N	\N	108	317308	t
317374	INDIRECT	12	316960	\N	\N	105	317325	t
317376	INDIRECT	12	316960	\N	\N	105	317309	t
317379	INDIRECT	12	316960	\N	\N	108	317346	t
317404	INDIRECT	12	316961	\N	\N	108	317390	t
317406	INDIRECT	12	316961	\N	\N	108	317386	t
317407	INDIRECT	12	316961	\N	\N	105	317325	t
317403	INDIRECT	12	316961	\N	\N	105	317309	t
317400	INDIRECT	12	316961	\N	\N	105	317389	t
317398	INDIRECT	12	316961	\N	\N	108	317346	t
317405	INDIRECT	12	316961	\N	\N	108	317308	t
317402	INDIRECT	12	316961	\N	\N	105	317381	t
317401	INDIRECT	12	316961	\N	\N	105	317348	t
317399	INDIRECT	12	316961	\N	\N	108	317324	t
317419	INDIRECT	12	316962	\N	\N	105	317381	t
317420	INDIRECT	12	316962	\N	\N	108	317346	t
317416	INDIRECT	12	316962	\N	\N	105	317309	t
317423	INDIRECT	12	316962	\N	\N	105	317325	t
317421	INDIRECT	12	316962	\N	\N	108	317324	t
317417	INDIRECT	12	316962	\N	\N	108	317308	t
317422	INDIRECT	12	316962	\N	\N	108	317386	t
317418	INDIRECT	12	316962	\N	\N	105	317348	t
317455	INDIRECT	12	316963	\N	\N	105	317325	t
317454	INDIRECT	12	316963	\N	\N	108	317308	t
317447	INDIRECT	12	316963	\N	\N	105	317432	t
317449	INDIRECT	12	316963	\N	\N	105	317437	t
317452	INDIRECT	12	316963	\N	\N	108	317324	t
317451	INDIRECT	12	316963	\N	\N	108	317438	t
317446	INDIRECT	12	316963	\N	\N	108	317424	t
317457	INDIRECT	12	316963	\N	\N	108	317386	t
317450	INDIRECT	12	316963	\N	\N	108	317346	t
317456	INDIRECT	12	316963	\N	\N	105	317309	t
317448	INDIRECT	12	316963	\N	\N	105	317381	t
317453	INDIRECT	12	316963	\N	\N	105	317348	t
317476	INDIRECT	12	316964	\N	\N	105	317309	t
317475	INDIRECT	12	316964	\N	\N	108	317324	t
317469	INDIRECT	12	316964	\N	\N	108	317424	t
317477	INDIRECT	12	316964	\N	\N	108	317386	t
317473	INDIRECT	12	316964	\N	\N	108	317346	t
317474	INDIRECT	12	316964	\N	\N	108	317308	t
317471	INDIRECT	12	316964	\N	\N	105	317432	t
317472	INDIRECT	12	316964	\N	\N	105	317325	t
317470	INDIRECT	12	316964	\N	\N	105	317381	t
317468	INDIRECT	12	316964	\N	\N	105	317348	t
318326	INDIRECT	11	\N	317703	\N	109	318255	t
318329	INDIRECT	11	\N	317703	\N	107	318313	t
318323	INDIRECT	11	\N	317703	\N	109	318284	t
318321	INDIRECT	11	\N	317703	\N	107	318281	t
318330	INDIRECT	11	\N	317703	\N	109	318317	t
318324	DIRECT	11	\N	317703	\N	109	\N	\N
316698	INDIRECT	15	313787	\N	\N	107	316661	t
316696	INDIRECT	15	313787	\N	\N	108	316678	t
316697	INDIRECT	15	313787	\N	\N	107	316675	t
316695	INDIRECT	15	313787	\N	\N	108	316662	t
316699	INDIRECT	16	\N	316167	\N	108	316662	t
316704	INDIRECT	16	\N	316167	\N	107	316661	t
316700	INDIRECT	16	\N	316167	\N	107	316675	t
316701	DIRECT	16	\N	316167	\N	108	\N	\N
316702	INDIRECT	16	\N	316167	\N	108	316678	t
316703	DIRECT	16	\N	316167	\N	107	\N	\N
316712	INDIRECT	16	\N	316168	\N	107	316675	t
316708	INDIRECT	16	\N	316168	\N	107	316703	t
316710	INDIRECT	16	\N	316168	\N	108	316701	t
316705	DIRECT	16	\N	316168	\N	108	\N	\N
316706	INDIRECT	16	\N	316168	\N	108	316662	t
316709	DIRECT	16	\N	316168	\N	107	\N	\N
316707	INDIRECT	16	\N	316168	\N	107	316661	t
316711	INDIRECT	16	\N	316168	\N	108	316678	t
316713	INDIRECT	15	313788	\N	\N	108	316662	t
316720	INDIRECT	15	313788	\N	\N	108	316701	t
316717	INDIRECT	15	313788	\N	\N	107	316703	t
316716	INDIRECT	15	313788	\N	\N	107	316675	t
316719	INDIRECT	15	313788	\N	\N	107	316709	t
318941	INDIRECT	8	\N	318965	\N	109	318911	t
318956	INDIRECT	8	\N	318966	\N	105	318897	t
319161	INDIRECT	8	\N	318966	\N	105	318935	t
318957	INDIRECT	8	\N	318966	\N	105	318913	t
319163	INDIRECT	8	\N	318966	\N	109	318911	t
319160	INDIRECT	8	\N	318966	\N	109	318896	t
319162	INDIRECT	8	\N	318966	\N	109	318936	t
319170	DIRECT	8	\N	318967	\N	109	\N	\N
319175	INDIRECT	8	\N	318967	\N	105	318913	t
319189	DIRECT	8	\N	318968	\N	105	\N	\N
316715	INDIRECT	15	313788	\N	\N	107	316661	t
316718	INDIRECT	15	313788	\N	\N	108	316705	t
316724	INDIRECT	16	\N	316169	\N	107	316661	t
316723	INDIRECT	16	\N	316169	\N	108	316662	t
316725	INDIRECT	16	\N	316169	\N	108	316701	t
316721	INDIRECT	16	\N	316169	\N	108	316678	t
316732	INDIRECT	15	313789	\N	\N	108	316662	t
316731	INDIRECT	15	313789	\N	\N	108	316678	t
316729	INDIRECT	15	313789	\N	\N	107	316703	t
316762	INDIRECT	16	\N	316172	\N	108	316678	t
316765	INDIRECT	16	\N	316172	\N	107	316661	t
316761	INDIRECT	16	\N	316172	\N	107	316675	t
316775	INDIRECT	15	313791	\N	\N	108	316701	t
316776	INDIRECT	15	313791	\N	\N	107	316661	t
316770	INDIRECT	15	313791	\N	\N	107	316675	t
316772	INDIRECT	15	313791	\N	\N	108	316739	t
316781	DIRECT	16	\N	316173	\N	107	\N	\N
318294	INDIRECT	11	317013	\N	\N	109	318255	t
318297	INDIRECT	11	317013	\N	\N	109	318284	t
318298	INDIRECT	11	317013	\N	\N	107	318257	t
318299	INDIRECT	11	317013	\N	\N	107	318281	t
318300	INDIRECT	11	317013	\N	\N	107	318287	t
318301	INDIRECT	11	\N	317701	\N	109	318284	t
318302	INDIRECT	11	\N	317701	\N	107	318257	t
318303	INDIRECT	11	\N	317701	\N	109	318255	t
318305	INDIRECT	11	\N	317701	\N	107	318281	t
318311	INDIRECT	11	317014	\N	\N	107	318281	t
318308	INDIRECT	11	317014	\N	\N	109	318284	t
318310	INDIRECT	11	317014	\N	\N	109	318255	t
318309	INDIRECT	11	317014	\N	\N	107	318257	t
318320	INDIRECT	11	\N	317702	\N	107	318281	t
318313	DIRECT	11	\N	317702	\N	107	\N	\N
318336	INDIRECT	11	317015	\N	\N	109	318324	t
318331	INDIRECT	11	317015	\N	\N	109	318317	t
317326	DIRECT	13	\N	316216	\N	105	\N	\N
318361	INDIRECT	11	317016	\N	\N	107	318313	t
318368	INDIRECT	11	317016	\N	\N	109	318317	t
318364	INDIRECT	11	317016	\N	\N	109	318284	t
318359	INDIRECT	11	317016	\N	\N	107	318257	t
318362	INDIRECT	11	317016	\N	\N	107	318351	t
318366	INDIRECT	11	317016	\N	\N	109	318349	t
318360	INDIRECT	11	317016	\N	\N	107	318281	t
318365	INDIRECT	11	317016	\N	\N	109	318255	t
318381	INDIRECT	11	317017	\N	\N	107	318257	t
318384	INDIRECT	11	317017	\N	\N	109	318284	t
318383	INDIRECT	11	317017	\N	\N	107	318313	t
318379	INDIRECT	11	317017	\N	\N	109	318255	t
318377	INDIRECT	11	317017	\N	\N	109	318317	t
318378	INDIRECT	11	317017	\N	\N	107	318281	t
318410	INDIRECT	11	317018	\N	\N	107	318313	t
318411	INDIRECT	11	317018	\N	\N	107	318257	t
318415	INDIRECT	11	317018	\N	\N	109	318394	t
318408	INDIRECT	11	317018	\N	\N	109	318402	t
318412	INDIRECT	11	317018	\N	\N	109	318255	t
318417	INDIRECT	11	317018	\N	\N	109	318317	t
318416	INDIRECT	11	317018	\N	\N	107	318281	t
318407	INDIRECT	11	317018	\N	\N	107	318390	t
318409	INDIRECT	11	317018	\N	\N	109	318284	t
318418	INDIRECT	11	317018	\N	\N	107	318404	t
318438	INDIRECT	11	317019	\N	\N	109	318394	t
318435	INDIRECT	11	317019	\N	\N	109	318317	t
318432	INDIRECT	11	317019	\N	\N	109	318284	t
318433	INDIRECT	11	317019	\N	\N	107	318281	t
318434	INDIRECT	11	317019	\N	\N	109	318255	t
318437	INDIRECT	11	317019	\N	\N	107	318257	t
319243	INDIRECT	8	\N	318972	\N	105	318935	t
319246	INDIRECT	8	\N	318972	\N	109	318936	t
319248	INDIRECT	8	\N	318972	\N	105	318913	t
319247	INDIRECT	8	\N	318972	\N	105	318897	t
319249	INDIRECT	8	\N	318972	\N	109	318896	t
318925	INDIRECT	7	318668	\N	\N	109	318916	t
318921	INDIRECT	7	318668	\N	\N	105	318897	t
318920	INDIRECT	7	318668	\N	\N	105	318913	t
318922	INDIRECT	7	318668	\N	\N	109	318911	t
318923	INDIRECT	7	318668	\N	\N	105	318915	t
318924	INDIRECT	7	318668	\N	\N	109	318896	t
318932	INDIRECT	7	318669	\N	\N	105	318913	t
318931	INDIRECT	7	318669	\N	\N	105	318897	t
318930	INDIRECT	7	318669	\N	\N	109	318911	t
318933	INDIRECT	7	318669	\N	\N	109	318896	t
318953	INDIRECT	7	318670	\N	\N	109	318896	t
318955	INDIRECT	7	318670	\N	\N	105	318935	t
318948	INDIRECT	7	318670	\N	\N	109	318911	t
318951	INDIRECT	7	318670	\N	\N	105	318913	t
318950	INDIRECT	7	318670	\N	\N	109	318945	t
318952	INDIRECT	7	318670	\N	\N	109	318936	t
318954	INDIRECT	7	318670	\N	\N	105	318897	t
318949	INDIRECT	7	318670	\N	\N	105	318943	t
319169	INDIRECT	7	318671	\N	\N	105	318913	t
319166	INDIRECT	7	318671	\N	\N	109	318936	t
319168	INDIRECT	7	318671	\N	\N	105	318897	t
319165	INDIRECT	7	318671	\N	\N	105	318935	t
319164	INDIRECT	7	318671	\N	\N	109	318911	t
319167	INDIRECT	7	318671	\N	\N	109	318896	t
319179	INDIRECT	7	318672	\N	\N	105	318935	t
319178	INDIRECT	7	318672	\N	\N	109	319170	t
319182	INDIRECT	7	318672	\N	\N	109	318936	t
319184	INDIRECT	7	318672	\N	\N	105	319172	t
319180	INDIRECT	7	318672	\N	\N	105	318913	t
319181	INDIRECT	7	318672	\N	\N	105	318897	t
319183	INDIRECT	7	318672	\N	\N	109	318911	t
319185	INDIRECT	7	318672	\N	\N	109	318896	t
319253	INDIRECT	7	318675	\N	\N	105	319189	t
319252	INDIRECT	7	318675	\N	\N	105	318897	t
319384	DIRECT	7	\N	318981	\N	109	\N	\N
319385	INDIRECT	6	318684	\N	\N	109	319384	t
319386	INDIRECT	6	318684	\N	\N	106	319383	t
318268	INDIRECT	11	317011	\N	\N	109	318255	t
318269	INDIRECT	11	317011	\N	\N	107	318257	t
318266	INDIRECT	11	317011	\N	\N	107	318259	t
318271	INDIRECT	11	\N	317698	\N	107	318257	t
318274	INDIRECT	11	\N	317698	\N	109	318255	t
318338	INDIRECT	11	317015	\N	\N	107	318257	t
318334	INDIRECT	11	317015	\N	\N	109	318284	t
318332	INDIRECT	11	317015	\N	\N	107	318325	t
318335	INDIRECT	11	317015	\N	\N	107	318281	t
318340	INDIRECT	11	317015	\N	\N	107	318313	t
318339	INDIRECT	11	317015	\N	\N	109	318255	t
319199	INDIRECT	8	\N	318969	\N	105	318897	t
319195	INDIRECT	8	\N	318969	\N	105	318935	t
319196	INDIRECT	8	\N	318969	\N	105	318913	t
319197	INDIRECT	8	\N	318969	\N	109	319190	t
319202	DIRECT	8	\N	318969	\N	109	\N	\N
319211	INDIRECT	7	318673	\N	\N	105	318913	t
319204	INDIRECT	7	318673	\N	\N	109	319190	t
319210	INDIRECT	7	318673	\N	\N	109	318896	t
319206	INDIRECT	7	318673	\N	\N	105	319194	t
319212	INDIRECT	7	318673	\N	\N	109	319202	t
319207	INDIRECT	7	318673	\N	\N	105	318935	t
319208	INDIRECT	7	318673	\N	\N	109	318936	t
319205	INDIRECT	7	318673	\N	\N	109	318911	t
319213	INDIRECT	7	318673	\N	\N	105	319189	t
319209	INDIRECT	7	318673	\N	\N	105	318897	t
319218	INDIRECT	8	\N	318970	\N	105	318897	t
319215	INDIRECT	8	\N	318970	\N	105	318913	t
319216	INDIRECT	8	\N	318970	\N	109	318936	t
319237	INDIRECT	7	318674	\N	\N	109	318911	t
319232	INDIRECT	7	318674	\N	\N	109	318896	t
319236	INDIRECT	7	318674	\N	\N	105	318935	t
319233	INDIRECT	7	318674	\N	\N	105	319189	t
319241	INDIRECT	7	318674	\N	\N	109	318936	t
319234	INDIRECT	7	318674	\N	\N	105	318913	t
319235	INDIRECT	7	318674	\N	\N	109	319190	t
319238	INDIRECT	7	318674	\N	\N	105	318897	t
319240	INDIRECT	7	318674	\N	\N	105	319223	t
319239	INDIRECT	7	318674	\N	\N	109	319230	t
319250	INDIRECT	7	318675	\N	\N	109	319190	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2437	2	esccor2-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	108	2026
2436	2	esccor2-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	2626	2026
300681	3	0ae4f672-e137-4e7d-ae67-1efe1eb1557c	2009-01-01 00:00:00	\N	f	300576	299975
300682	3	da1c2403-7eb5-41a6-9ec3-63a298fd31aa	2009-01-01 00:00:00	\N	f	109	299975
2438	2	esccor3-c2	2010-01-01 00:00:00	\N	f	108	2027
2439	2	esccor3-c1	2010-01-01 00:00:00	\N	f	2626	2027
1824	2	d6b041ca-84c7-4e07-a6e9-1dca7784960a	2009-01-01 00:00:00	\N	f	105	1623
1825	2	2b280a26-aa30-4457-a72a-fdefe98091ee	2009-01-01 00:00:00	\N	f	109	1623
1827	2	ad4624d0-9ca3-4f5a-9982-1869075446ae	2009-01-01 00:00:00	2010-12-31 00:00:00	f	109	1625
1826	2	5f3a3b0c-223b-4d9f-a38d-84be398d236b	2009-01-01 00:00:00	2010-12-31 00:00:00	f	105	1625
2427	2	escpon1-c1	2009-01-01 00:00:00	\N	f	2626	2021
2426	2	escpon1-c2	2009-01-01 00:00:00	\N	f	109	2021
2441	2	esccor4-c2	2010-01-01 00:00:00	\N	f	108	2028
2440	2	esccor4-c1	2010-01-01 00:00:00	\N	f	2626	2028
3137	2	pincor4-c2	2009-01-01 00:00:00	2010-12-31 00:00:00	f	108	2730
3138	2	pincor4-c1	2009-01-01 00:00:00	2010-12-31 00:00:00	f	105	2730
3139	2	solcor1-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	107	2731
3140	2	solcor1-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	108	2731
3141	2	solcor2-c1	2009-01-01 00:00:00	\N	f	107	2732
3142	2	solcor2-c2	2009-01-01 00:00:00	\N	f	108	2732
1831	2	e17af40b-a1d8-445d-918b-a5791f5c6577	2009-01-01 00:00:00	\N	f	107	1629
1830	2	5d5ee6cc-10f4-4d89-893d-568aa0f627a0	2009-01-01 00:00:00	\N	f	109	1629
1833	2	fa7198dc-47e4-40fc-89c5-309bce23497d	2010-01-01 00:00:00	\N	f	107	1631
1832	2	621ad988-f19c-4843-9756-b9f125e97819	2010-01-01 00:00:00	\N	f	109	1631
1835	2	23e67b60-9508-41a6-ba22-4a877b9a9b79	2010-07-01 00:00:00	\N	f	107	1633
1834	2	ab9d5be4-0d89-4efc-96a1-144d2c4f1b03	2010-07-01 00:00:00	\N	f	109	1633
1820	2	c09d65cf-9b86-4f09-8ac1-52f25d1288b6	2010-01-01 00:00:00	\N	f	109	1619
1821	2	21b9b92f-6209-4321-9672-600c5c93661a	2010-01-01 00:00:00	\N	f	105	1619
1822	2	a62d7acb-aedd-42f9-8b59-1a302ba83236	2010-07-01 00:00:00	\N	f	105	1621
1823	2	21f16db3-c723-4ca0-8045-1722cb0ad708	2010-07-01 00:00:00	\N	f	109	1621
3144	2	solcor3-c2	2010-01-01 00:00:00	\N	f	107	2733
3143	2	solcor3-c1	2010-01-01 00:00:00	\N	f	108	2733
1828	3	680d44b3-57f4-4c3b-b576-dc7609f2cedd	2009-01-01 00:00:00	2009-12-31 00:00:00	f	107	1627
1829	3	39d358f0-1460-4474-9e45-7bf39b69c125	2009-01-01 00:00:00	2009-12-31 00:00:00	f	109	1627
3134	2	pincor2-c1	2010-07-01 00:00:00	\N	f	105	2728
3133	2	pincor2-c2	2010-07-01 00:00:00	\N	f	108	2728
3131	2	pincor1-c2	2010-01-01 00:00:00	\N	f	105	2727
3132	2	pincor1-c1	2010-01-01 00:00:00	\N	f	108	2727
3135	2	pincor3-c2	2009-01-01 00:00:00	\N	f	105	2729
3136	2	pincor3-c1	2009-01-01 00:00:00	\N	f	108	2729
3146	2	solcor4-c1	2010-07-01 00:00:00	\N	f	108	2734
3145	2	solcor4-c2	2010-07-01 00:00:00	\N	f	107	2734
1818	4	6af403e8-5db6-4345-a6b3-554af44ab8c7	2010-01-12 00:00:00	\N	f	106	1617
1819	4	1fc00e6d-304e-459b-8fd2-42aa698f0489	2010-01-12 00:00:00	\N	f	109	1617
2424	2	cappon2-c2	2009-01-01 00:00:00	\N	f	109	2020
2425	2	cappon2-c1	2009-01-01 00:00:00	\N	f	106	2020
2442	2	capcor2-c2	2009-01-01 00:00:00	\N	f	108	2029
2443	2	capcor2-c1	2009-01-01 00:00:00	\N	f	106	2029
2434	2	esccor1-c1	2009-01-01 00:00:00	\N	f	2626	2025
2435	2	esccor1-c2	2009-01-01 00:00:00	\N	f	108	2025
2429	2	escpon2-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	2626	2022
2428	2	escpon2-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	109	2022
2430	2	escpon3-c2	2010-01-01 00:00:00	\N	f	109	2023
2431	2	escpon3-c1	2010-01-01 00:00:00	\N	f	2626	2023
2432	2	escpon4-c2	2010-01-01 00:00:00	\N	f	109	2024
2433	2	escpon4-c1	2010-01-01 00:00:00	\N	f	2626	2024
300680	3	ea440e04-8cd6-4759-af68-a9fbc87b3ba6	2009-01-01 00:00:00	\N	f	108	299973
300679	3	5f3c66ec-09bd-4a2a-aae0-f73de88f8ef9	2009-01-01 00:00:00	\N	f	300576	299973
300685	3	fee99f10-2d38-449b-91b4-53bf9798f4ff	2009-01-01 00:00:00	\N	f	300577	299979
300686	3	83cabb72-183e-4d80-b53e-967f0495ab8f	2009-01-01 00:00:00	\N	f	108	299979
300683	3	17ac2687-4864-49d7-958d-2d1b78d0d2cf	2009-01-01 00:00:00	\N	f	109	299977
300684	3	53d9e583-9e9f-4a6d-88a7-810befae8045	2009-01-01 00:00:00	\N	f	300576	299977
300688	3	93cdf7e2-678a-4de1-84c0-bc17e9c6a408	2009-01-01 00:00:00	\N	f	300577	299981
300687	3	61e2756c-46d3-4b56-a1d4-96b51067aff4	2009-01-01 00:00:00	\N	f	108	299981
300690	3	9108901f-deb4-49f3-b763-65dd0c1cd4b7	2009-01-01 00:00:00	\N	f	300577	299983
300689	3	6f926ed2-6cec-4325-a1cd-ae2186d7a04a	2009-01-01 00:00:00	\N	f	109	299983
300691	3	f59e40b9-2506-441e-ae20-8ca50e5b445d	2009-01-01 00:00:00	\N	f	109	299985
300692	3	cb785185-4826-4347-88a0-fe9ea9bdf97b	2009-01-01 00:00:00	\N	f	300577	299985
300678	2	4af75492-70e5-420b-8055-1b78c399f44d	2009-01-01 00:00:00	\N	f	300576	299971
300677	2	46e1be36-19e4-4552-b83a-b1c6444af6c3	2009-01-01 00:00:00	\N	f	108	299971
300693	2	c7205eb3-17a2-4feb-ae59-317320ac1ddf	2010-01-01 00:00:00	\N	f	108	299987
300694	2	f415f372-f67e-4c39-93d5-6b434650ebec	2010-01-01 00:00:00	\N	f	300578	299987
300696	2	a234790d-fd42-47ba-adcf-fa6e91690e9a	2009-01-01 00:00:00	\N	f	300578	299989
300695	2	e7e85d38-aadb-4adf-8f0e-a889af0b230a	2009-01-01 00:00:00	\N	f	108	299989
300697	2	247f477e-95c4-4a2a-b59f-59bc0ea7950f	2009-01-01 00:00:00	\N	f	300578	299991
300698	2	466d0042-5bb5-431e-bdd0-12ab35ff403a	2009-01-01 00:00:00	\N	f	109	299991
300699	2	c56dfb24-dc5a-4a1d-9b14-3817ddde7aed	2010-01-01 00:00:00	\N	f	300578	299993
300700	2	009da056-cfa9-4ff4-b811-ef358e29d2e4	2010-01-01 00:00:00	\N	f	109	299993
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
1	15	b65ae3c8-46dd-4272-8229-48e18d2f1d94	LEAVE	Leave	f	f	t	f	1
2	11	c6caaf5f-c991-49c0-a6d0-df60a8b626a4	CATEGORY	Professional category	t	t	t	f	1
3	9	2a491f98-9502-4231-9173-dc72bdd722b7	TRAINING	Training courses and labor training	t	t	t	f	1
5	5	d90a5adf-d687-4279-9f51-1df8b2c816a4	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
6	2	ef4d832a-f4b0-47c3-84ea-06fd7f5ebb24	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
97484800	1	3d8d188d-17c9-406c-8fc3-49bb9ec42d1e	MACHINE	\N	t	t	t	t	2
4	10	4974aafc-0893-4737-b466-e5af8994fcac	JOB	Job	t	t	t	f	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
322434	GENERIC_DAY	5	0	f	2010-01-03	2732	\N	315008	\N
322453	GENERIC_DAY	5	0	f	2010-01-17	2733	\N	315008	\N
322435	GENERIC_DAY	5	0	f	2010-01-16	2732	\N	315008	\N
322436	GENERIC_DAY	5	7	f	2010-01-12	2733	\N	315008	\N
322442	GENERIC_DAY	5	0	f	2010-01-09	2732	\N	315008	\N
322429	GENERIC_DAY	5	7	f	2010-01-14	2732	\N	315008	\N
322438	GENERIC_DAY	5	7	f	2010-01-15	2733	\N	315008	\N
322448	GENERIC_DAY	5	7	f	2010-01-07	2732	\N	315008	\N
322437	GENERIC_DAY	5	4	f	2010-01-01	2732	\N	315008	\N
322439	GENERIC_DAY	5	7	f	2010-01-07	2733	\N	315008	\N
322452	GENERIC_DAY	5	0	f	2010-01-10	2733	\N	315008	\N
322446	GENERIC_DAY	5	7	f	2010-01-08	2733	\N	315008	\N
322432	GENERIC_DAY	5	7	f	2010-01-08	2732	\N	315008	\N
322422	GENERIC_DAY	5	7	f	2010-01-15	2732	\N	315008	\N
322451	GENERIC_DAY	5	4	f	2010-01-18	2733	\N	315008	\N
322449	GENERIC_DAY	5	0	f	2010-01-16	2733	\N	315008	\N
322428	GENERIC_DAY	5	7	f	2010-01-04	2732	\N	315008	\N
322425	GENERIC_DAY	5	7	f	2010-01-13	2733	\N	315008	\N
322440	GENERIC_DAY	5	7	f	2010-01-11	2733	\N	315008	\N
322455	GENERIC_DAY	5	4	f	2010-01-01	2733	\N	315008	\N
322457	GENERIC_DAY	5	0	f	2010-01-03	2733	\N	315008	\N
322430	GENERIC_DAY	5	7	f	2010-01-12	2732	\N	315008	\N
322427	GENERIC_DAY	5	4	f	2010-01-06	2732	\N	315008	\N
322424	GENERIC_DAY	5	0	f	2010-01-02	2733	\N	315008	\N
322433	GENERIC_DAY	5	7	f	2010-01-05	2733	\N	315008	\N
322456	GENERIC_DAY	5	0	f	2010-01-09	2733	\N	315008	\N
322447	GENERIC_DAY	5	7	f	2010-01-14	2733	\N	315008	\N
322443	GENERIC_DAY	5	7	f	2010-01-05	2732	\N	315008	\N
322441	GENERIC_DAY	5	7	f	2010-01-04	2733	\N	315008	\N
322444	GENERIC_DAY	5	0	f	2010-01-02	2732	\N	315008	\N
322431	GENERIC_DAY	5	4	f	2010-01-18	2732	\N	315008	\N
322445	GENERIC_DAY	5	0	f	2010-01-17	2732	\N	315008	\N
322423	GENERIC_DAY	5	0	f	2010-01-10	2732	\N	315008	\N
322454	GENERIC_DAY	5	7	f	2010-01-11	2732	\N	315008	\N
322450	GENERIC_DAY	5	7	f	2010-01-13	2732	\N	315008	\N
322426	GENERIC_DAY	5	4	f	2010-01-06	2733	\N	315008	\N
322476	GENERIC_DAY	5	4	f	2010-02-03	2732	\N	315009	\N
322506	GENERIC_DAY	5	4	f	2010-01-27	2733	\N	315009	\N
322503	GENERIC_DAY	5	0	f	2010-02-07	2733	\N	315009	\N
322485	GENERIC_DAY	5	4	f	2010-02-08	2733	\N	315009	\N
322465	GENERIC_DAY	5	4	f	2010-02-10	2732	\N	315009	\N
322492	GENERIC_DAY	5	4	f	2010-01-22	2732	\N	315009	\N
322475	GENERIC_DAY	5	4	f	2010-02-09	2732	\N	315009	\N
322493	GENERIC_DAY	5	0	f	2010-01-24	2733	\N	315009	\N
322466	GENERIC_DAY	5	0	f	2010-01-30	2732	\N	315009	\N
322482	GENERIC_DAY	5	4	f	2010-01-21	2733	\N	315009	\N
322468	GENERIC_DAY	5	4	f	2010-01-28	2733	\N	315009	\N
322478	GENERIC_DAY	5	4	f	2010-01-27	2732	\N	315009	\N
322473	GENERIC_DAY	5	4	f	2010-01-29	2732	\N	315009	\N
322464	GENERIC_DAY	5	4	f	2010-01-20	2733	\N	315009	\N
322496	GENERIC_DAY	5	4	f	2010-01-19	2732	\N	315009	\N
322484	GENERIC_DAY	5	4	f	2010-01-21	2732	\N	315009	\N
322483	GENERIC_DAY	5	0	f	2010-02-06	2732	\N	315009	\N
322491	GENERIC_DAY	5	4	f	2010-01-28	2732	\N	315009	\N
322487	GENERIC_DAY	5	4	f	2010-02-08	2732	\N	315009	\N
322463	GENERIC_DAY	5	4	f	2010-02-10	2733	\N	315009	\N
322480	GENERIC_DAY	5	4	f	2010-01-29	2733	\N	315009	\N
322460	GENERIC_DAY	5	4	f	2010-02-01	2733	\N	315009	\N
322474	GENERIC_DAY	5	0	f	2010-02-06	2733	\N	315009	\N
322481	GENERIC_DAY	5	0	f	2010-01-31	2732	\N	315009	\N
322469	GENERIC_DAY	5	4	f	2010-02-05	2733	\N	315009	\N
322507	GENERIC_DAY	5	0	f	2010-01-31	2733	\N	315009	\N
322500	GENERIC_DAY	5	4	f	2010-01-22	2733	\N	315009	\N
322502	GENERIC_DAY	5	4	f	2010-02-03	2733	\N	315009	\N
322486	GENERIC_DAY	5	3	f	2010-02-12	2733	\N	315009	\N
322495	GENERIC_DAY	5	4	f	2010-02-04	2733	\N	315009	\N
322543	GENERIC_DAY	5	4	f	2010-01-18	2733	\N	315010	\N
322539	GENERIC_DAY	5	4	f	2010-01-26	2733	\N	315010	\N
322516	GENERIC_DAY	5	4	f	2010-01-05	2732	\N	315010	\N
322532	GENERIC_DAY	5	0	f	2010-01-03	2732	\N	315010	\N
322552	GENERIC_DAY	5	0	f	2010-01-02	2733	\N	315010	\N
322530	GENERIC_DAY	5	4	f	2010-01-25	2733	\N	315010	\N
322556	GENERIC_DAY	5	4	f	2010-01-14	2732	\N	315010	\N
322508	GENERIC_DAY	5	4	f	2010-01-21	2732	\N	315010	\N
322554	GENERIC_DAY	5	4	f	2010-01-19	2732	\N	315010	\N
322528	GENERIC_DAY	5	0	f	2010-01-09	2733	\N	315010	\N
322512	GENERIC_DAY	5	0	f	2010-01-10	2733	\N	315010	\N
322520	GENERIC_DAY	5	4	f	2010-01-22	2733	\N	315010	\N
322509	GENERIC_DAY	5	4	f	2010-01-20	2733	\N	315010	\N
322510	GENERIC_DAY	5	0	f	2010-01-17	2733	\N	315010	\N
322533	GENERIC_DAY	5	0	f	2010-01-02	2732	\N	315010	\N
322550	GENERIC_DAY	5	4	f	2010-01-15	2732	\N	315010	\N
322561	GENERIC_DAY	5	4	f	2010-01-19	2733	\N	315010	\N
322542	GENERIC_DAY	5	4	f	2010-01-22	2732	\N	315010	\N
322522	GENERIC_DAY	5	4	f	2010-01-14	2733	\N	315010	\N
322560	GENERIC_DAY	5	4	f	2010-01-13	2732	\N	315010	\N
322513	GENERIC_DAY	5	0	f	2010-01-16	2732	\N	315010	\N
322525	GENERIC_DAY	5	4	f	2010-01-01	2732	\N	315010	\N
322541	GENERIC_DAY	5	4	f	2010-01-13	2733	\N	315010	\N
322555	GENERIC_DAY	5	4	f	2010-01-25	2732	\N	315010	\N
322545	GENERIC_DAY	5	4	f	2010-01-11	2733	\N	315010	\N
322531	GENERIC_DAY	5	3	f	2010-01-27	2733	\N	315010	\N
322553	GENERIC_DAY	5	4	f	2010-01-04	2732	\N	315010	\N
322534	GENERIC_DAY	5	4	f	2010-01-01	2733	\N	315010	\N
322544	GENERIC_DAY	5	4	f	2010-01-12	2732	\N	315010	\N
322557	GENERIC_DAY	5	4	f	2010-01-06	2732	\N	315010	\N
322518	GENERIC_DAY	5	4	f	2010-01-18	2732	\N	315010	\N
322549	GENERIC_DAY	5	4	f	2010-01-07	2733	\N	315010	\N
322514	GENERIC_DAY	5	0	f	2010-01-23	2733	\N	315010	\N
322537	GENERIC_DAY	5	4	f	2010-01-11	2732	\N	315010	\N
322529	GENERIC_DAY	5	4	f	2010-01-08	2732	\N	315010	\N
322521	GENERIC_DAY	5	0	f	2010-01-24	2733	\N	315010	\N
322517	GENERIC_DAY	5	0	f	2010-01-03	2733	\N	315010	\N
322523	GENERIC_DAY	5	4	f	2010-01-26	2732	\N	315010	\N
322511	GENERIC_DAY	5	0	f	2010-01-23	2732	\N	315010	\N
322524	GENERIC_DAY	5	4	f	2010-01-20	2732	\N	315010	\N
322547	GENERIC_DAY	5	4	f	2010-01-06	2733	\N	315010	\N
322519	GENERIC_DAY	5	4	f	2010-01-05	2733	\N	315010	\N
322527	GENERIC_DAY	5	4	f	2010-01-12	2733	\N	315010	\N
322540	GENERIC_DAY	5	4	f	2010-01-07	2732	\N	315010	\N
322559	GENERIC_DAY	5	4	f	2010-01-04	2733	\N	315010	\N
322585	GENERIC_DAY	5	0	f	2010-02-20	2733	\N	315011	\N
322595	GENERIC_DAY	5	4	f	2010-02-22	2733	\N	315011	\N
322584	GENERIC_DAY	5	0	f	2010-01-30	2733	\N	315011	\N
322562	GENERIC_DAY	5	4	f	2010-02-16	2732	\N	315011	\N
322582	GENERIC_DAY	5	4	f	2010-02-19	2733	\N	315011	\N
322594	GENERIC_DAY	5	0	f	2010-02-07	2732	\N	315011	\N
322611	GENERIC_DAY	5	4	f	2010-02-02	2732	\N	315011	\N
322580	GENERIC_DAY	5	4	f	2010-02-08	2733	\N	315011	\N
322599	GENERIC_DAY	5	4	f	2010-02-10	2733	\N	315011	\N
322603	GENERIC_DAY	5	0	f	2010-02-14	2732	\N	315011	\N
322605	GENERIC_DAY	5	4	f	2010-02-03	2733	\N	315011	\N
322601	GENERIC_DAY	5	4	f	2010-02-18	2733	\N	315011	\N
322593	GENERIC_DAY	5	4	f	2010-02-12	2733	\N	315011	\N
322591	GENERIC_DAY	5	4	f	2010-02-16	2733	\N	315011	\N
322583	GENERIC_DAY	5	0	f	2010-01-31	2732	\N	315011	\N
322589	GENERIC_DAY	5	3	f	2010-02-23	2733	\N	315011	\N
322615	GENERIC_DAY	5	4	f	2010-02-19	2732	\N	315011	\N
322586	GENERIC_DAY	5	4	f	2010-02-04	2732	\N	315011	\N
322565	GENERIC_DAY	5	4	f	2010-02-18	2732	\N	315011	\N
322607	GENERIC_DAY	5	4	f	2010-02-01	2733	\N	315011	\N
322609	GENERIC_DAY	5	4	f	2010-02-12	2732	\N	315011	\N
322600	GENERIC_DAY	5	4	f	2010-02-22	2732	\N	315011	\N
322610	GENERIC_DAY	5	4	f	2010-02-10	2732	\N	315011	\N
322613	GENERIC_DAY	5	4	f	2010-01-29	2733	\N	315011	\N
322571	GENERIC_DAY	5	4	f	2010-02-01	2732	\N	315011	\N
322566	GENERIC_DAY	5	4	f	2010-02-11	2732	\N	315011	\N
322574	GENERIC_DAY	5	4	f	2010-02-15	2733	\N	315011	\N
322612	GENERIC_DAY	5	4	f	2010-01-29	2732	\N	315011	\N
322568	GENERIC_DAY	5	0	f	2010-02-21	2733	\N	315011	\N
322598	GENERIC_DAY	5	4	f	2010-02-02	2733	\N	315011	\N
322597	GENERIC_DAY	5	4	f	2010-02-05	2732	\N	315011	\N
322602	GENERIC_DAY	5	0	f	2010-02-20	2732	\N	315011	\N
322588	GENERIC_DAY	5	0	f	2010-02-14	2733	\N	315011	\N
322604	GENERIC_DAY	5	4	f	2010-02-09	2732	\N	315011	\N
322575	GENERIC_DAY	5	4	f	2010-02-15	2732	\N	315011	\N
322573	GENERIC_DAY	5	4	f	2010-02-11	2733	\N	315011	\N
322581	GENERIC_DAY	5	4	f	2010-02-03	2732	\N	315011	\N
322596	GENERIC_DAY	5	0	f	2010-02-13	2733	\N	315011	\N
322563	GENERIC_DAY	5	4	f	2010-02-08	2732	\N	315011	\N
322572	GENERIC_DAY	5	4	f	2010-01-28	2733	\N	315011	\N
322570	GENERIC_DAY	5	0	f	2010-02-06	2732	\N	315011	\N
322576	GENERIC_DAY	5	0	f	2010-01-30	2732	\N	315011	\N
322567	GENERIC_DAY	5	4	f	2010-02-04	2733	\N	315011	\N
322578	GENERIC_DAY	5	4	f	2010-02-05	2733	\N	315011	\N
322614	GENERIC_DAY	5	0	f	2010-02-13	2732	\N	315011	\N
322606	GENERIC_DAY	5	4	f	2010-02-17	2733	\N	315011	\N
322590	GENERIC_DAY	5	0	f	2010-01-31	2733	\N	315011	\N
322592	GENERIC_DAY	5	4	f	2010-02-17	2732	\N	315011	\N
322564	GENERIC_DAY	5	4	f	2010-02-09	2733	\N	315011	\N
322587	GENERIC_DAY	5	0	f	2010-02-21	2732	\N	315011	\N
322608	GENERIC_DAY	5	0	f	2010-02-07	2733	\N	315011	\N
322569	GENERIC_DAY	5	0	f	2010-02-06	2733	\N	315011	\N
322577	GENERIC_DAY	5	3	f	2010-02-23	2732	\N	315011	\N
322579	GENERIC_DAY	5	4	f	2010-01-28	2732	\N	315011	\N
322625	GENERIC_DAY	5	4	f	2010-02-24	2732	\N	315012	\N
322645	GENERIC_DAY	5	4	f	2010-03-16	2732	\N	315012	\N
322623	GENERIC_DAY	5	0	f	2010-02-28	2733	\N	315012	\N
322651	GENERIC_DAY	5	4	f	2010-03-05	2733	\N	315012	\N
322655	GENERIC_DAY	5	3	f	2010-03-22	2733	\N	315012	\N
322657	GENERIC_DAY	5	4	f	2010-03-10	2733	\N	315012	\N
322638	GENERIC_DAY	5	4	f	2010-02-26	2732	\N	315012	\N
322641	GENERIC_DAY	5	4	f	2010-03-01	2732	\N	315012	\N
322644	GENERIC_DAY	5	4	f	2010-03-12	2732	\N	315012	\N
322650	GENERIC_DAY	5	4	f	2010-03-09	2733	\N	315012	\N
322654	GENERIC_DAY	5	4	f	2010-03-02	2732	\N	315012	\N
322663	GENERIC_DAY	5	0	f	2010-03-14	2732	\N	315012	\N
322635	GENERIC_DAY	5	4	f	2010-03-18	2733	\N	315012	\N
322618	GENERIC_DAY	5	4	f	2010-03-17	2732	\N	315012	\N
322659	GENERIC_DAY	5	0	f	2010-02-27	2733	\N	315012	\N
322649	GENERIC_DAY	5	0	f	2010-03-13	2733	\N	315012	\N
322642	GENERIC_DAY	5	0	f	2010-03-13	2732	\N	315012	\N
322660	GENERIC_DAY	5	0	f	2010-02-27	2732	\N	315012	\N
322669	GENERIC_DAY	5	0	f	2010-03-14	2733	\N	315012	\N
322619	GENERIC_DAY	5	4	f	2010-02-26	2733	\N	315012	\N
322622	GENERIC_DAY	5	4	f	2010-03-18	2732	\N	315012	\N
322616	GENERIC_DAY	5	0	f	2010-03-21	2732	\N	315012	\N
322646	GENERIC_DAY	5	4	f	2010-03-19	2732	\N	315012	\N
322627	GENERIC_DAY	5	4	f	2010-03-05	2732	\N	315012	\N
322662	GENERIC_DAY	5	4	f	2010-03-09	2732	\N	315012	\N
322617	GENERIC_DAY	5	0	f	2010-03-07	2732	\N	315012	\N
322667	GENERIC_DAY	5	4	f	2010-03-10	2732	\N	315012	\N
322636	GENERIC_DAY	5	4	f	2010-03-11	2733	\N	315012	\N
322628	GENERIC_DAY	5	0	f	2010-03-06	2732	\N	315012	\N
322629	GENERIC_DAY	5	4	f	2010-03-03	2733	\N	315012	\N
322647	GENERIC_DAY	5	0	f	2010-03-20	2733	\N	315012	\N
322658	GENERIC_DAY	5	4	f	2010-02-25	2733	\N	315012	\N
322656	GENERIC_DAY	5	0	f	2010-03-06	2733	\N	315012	\N
322665	GENERIC_DAY	5	0	f	2010-03-20	2732	\N	315012	\N
322630	GENERIC_DAY	5	4	f	2010-03-16	2733	\N	315012	\N
322640	GENERIC_DAY	5	4	f	2010-02-24	2733	\N	315012	\N
322631	GENERIC_DAY	5	4	f	2010-03-17	2733	\N	315012	\N
322632	GENERIC_DAY	5	4	f	2010-03-12	2733	\N	315012	\N
322626	GENERIC_DAY	5	4	f	2010-03-01	2733	\N	315012	\N
322653	GENERIC_DAY	5	4	f	2010-03-15	2732	\N	315012	\N
322668	GENERIC_DAY	5	0	f	2010-02-28	2732	\N	315012	\N
322661	GENERIC_DAY	5	4	f	2010-03-11	2732	\N	315012	\N
322666	GENERIC_DAY	5	4	f	2010-03-04	2732	\N	315012	\N
322648	GENERIC_DAY	5	0	f	2010-03-21	2733	\N	315012	\N
322664	GENERIC_DAY	5	4	f	2010-03-08	2732	\N	315012	\N
322633	GENERIC_DAY	5	4	f	2010-03-08	2733	\N	315012	\N
322624	GENERIC_DAY	5	3	f	2010-03-22	2732	\N	315012	\N
322637	GENERIC_DAY	5	4	f	2010-03-03	2732	\N	315012	\N
322621	GENERIC_DAY	5	4	f	2010-03-04	2733	\N	315012	\N
322620	GENERIC_DAY	5	0	f	2010-03-07	2733	\N	315012	\N
322643	GENERIC_DAY	5	4	f	2010-03-19	2733	\N	315012	\N
322634	GENERIC_DAY	5	4	f	2010-03-02	2733	\N	315012	\N
322639	GENERIC_DAY	5	4	f	2010-02-25	2732	\N	315012	\N
322652	GENERIC_DAY	5	4	f	2010-03-15	2733	\N	315012	\N
329422	GENERIC_DAY	4	0	f	2010-04-24	2733	\N	315013	\N
329400	GENERIC_DAY	4	4	f	2010-04-22	2732	\N	315013	\N
329432	GENERIC_DAY	4	4	f	2010-04-20	2733	\N	315013	\N
329447	GENERIC_DAY	4	4	f	2010-05-07	2732	\N	315013	\N
329445	GENERIC_DAY	4	4	f	2010-05-03	2732	\N	315013	\N
329417	GENERIC_DAY	4	4	f	2010-05-04	2732	\N	315013	\N
329449	GENERIC_DAY	4	4	f	2010-04-16	2732	\N	315013	\N
329439	GENERIC_DAY	4	0	f	2010-05-08	2733	\N	315013	\N
329402	GENERIC_DAY	4	4	f	2010-05-05	2733	\N	315013	\N
329444	GENERIC_DAY	4	4	f	2010-04-28	2732	\N	315013	\N
329426	GENERIC_DAY	4	4	f	2010-05-03	2733	\N	315013	\N
329406	GENERIC_DAY	4	4	f	2010-04-21	2733	\N	315013	\N
329421	GENERIC_DAY	4	4	f	2010-05-05	2732	\N	315013	\N
329412	GENERIC_DAY	4	4	f	2010-04-28	2733	\N	315013	\N
329437	GENERIC_DAY	4	0	f	2010-04-18	2733	\N	315013	\N
329428	GENERIC_DAY	4	4	f	2010-04-26	2733	\N	315013	\N
329443	GENERIC_DAY	4	0	f	2010-05-09	2733	\N	315013	\N
329425	GENERIC_DAY	4	4	f	2010-04-15	2733	\N	315013	\N
329438	GENERIC_DAY	4	0	f	2010-04-17	2733	\N	315013	\N
329423	GENERIC_DAY	4	4	f	2010-04-16	2733	\N	315013	\N
329435	GENERIC_DAY	4	0	f	2010-04-17	2732	\N	315013	\N
329433	GENERIC_DAY	4	4	f	2010-04-27	2733	\N	315013	\N
329413	GENERIC_DAY	4	4	f	2010-04-19	2732	\N	315013	\N
329431	GENERIC_DAY	4	0	f	2010-05-02	2733	\N	315013	\N
329419	GENERIC_DAY	4	0	f	2010-04-25	2733	\N	315013	\N
329401	GENERIC_DAY	4	4	f	2010-05-04	2733	\N	315013	\N
329424	GENERIC_DAY	4	4	f	2010-04-29	2732	\N	315013	\N
329410	GENERIC_DAY	4	4	f	2010-04-27	2732	\N	315013	\N
329408	GENERIC_DAY	4	0	f	2010-05-09	2732	\N	315013	\N
329450	GENERIC_DAY	4	4	f	2010-04-23	2733	\N	315013	\N
329403	GENERIC_DAY	4	0	f	2010-04-18	2732	\N	315013	\N
329418	GENERIC_DAY	4	4	f	2010-04-30	2732	\N	315013	\N
329427	GENERIC_DAY	4	4	f	2010-04-23	2732	\N	315013	\N
329414	GENERIC_DAY	4	4	f	2010-05-06	2732	\N	315013	\N
329430	GENERIC_DAY	4	4	f	2010-04-21	2732	\N	315013	\N
329451	GENERIC_DAY	4	3	f	2010-05-10	2733	\N	315013	\N
329448	GENERIC_DAY	4	0	f	2010-05-01	2732	\N	315013	\N
329420	GENERIC_DAY	4	4	f	2010-04-14	2733	\N	315013	\N
329404	GENERIC_DAY	4	0	f	2010-05-08	2732	\N	315013	\N
329407	GENERIC_DAY	4	0	f	2010-04-24	2732	\N	315013	\N
329405	GENERIC_DAY	4	4	f	2010-04-26	2732	\N	315013	\N
329416	GENERIC_DAY	4	4	f	2010-04-22	2733	\N	315013	\N
329442	GENERIC_DAY	4	0	f	2010-05-01	2733	\N	315013	\N
329434	GENERIC_DAY	4	4	f	2010-04-29	2733	\N	315013	\N
329441	GENERIC_DAY	4	0	f	2010-04-25	2732	\N	315013	\N
329452	GENERIC_DAY	4	4	f	2010-04-15	2732	\N	315013	\N
329453	GENERIC_DAY	4	4	f	2010-04-14	2732	\N	315013	\N
329409	GENERIC_DAY	4	4	f	2010-05-07	2733	\N	315013	\N
329446	GENERIC_DAY	4	0	f	2010-05-02	2732	\N	315013	\N
329436	GENERIC_DAY	4	4	f	2010-05-06	2733	\N	315013	\N
329415	GENERIC_DAY	4	4	f	2010-04-30	2733	\N	315013	\N
329411	GENERIC_DAY	4	4	f	2010-04-20	2732	\N	315013	\N
329429	GENERIC_DAY	4	4	f	2010-04-19	2733	\N	315013	\N
329440	GENERIC_DAY	4	3	f	2010-05-10	2732	\N	315013	\N
322876	GENERIC_DAY	5	0	f	2010-02-28	2733	\N	315014	\N
322829	GENERIC_DAY	5	4	f	2010-03-18	2733	\N	315014	\N
322862	GENERIC_DAY	5	4	f	2010-03-08	2732	\N	315014	\N
322872	GENERIC_DAY	5	3	f	2010-03-22	2732	\N	315014	\N
322844	GENERIC_DAY	5	4	f	2010-02-25	2733	\N	315014	\N
322859	GENERIC_DAY	5	4	f	2010-02-24	2732	\N	315014	\N
322832	GENERIC_DAY	5	4	f	2010-03-12	2733	\N	315014	\N
322836	GENERIC_DAY	5	0	f	2010-03-21	2732	\N	315014	\N
322867	GENERIC_DAY	5	4	f	2010-03-01	2732	\N	315014	\N
322830	GENERIC_DAY	5	4	f	2010-03-16	2732	\N	315014	\N
322846	GENERIC_DAY	5	0	f	2010-02-27	2732	\N	315014	\N
322842	GENERIC_DAY	5	4	f	2010-03-08	2733	\N	315014	\N
322870	GENERIC_DAY	5	4	f	2010-03-17	2733	\N	315014	\N
322874	GENERIC_DAY	5	4	f	2010-03-15	2732	\N	315014	\N
322860	GENERIC_DAY	5	4	f	2010-03-01	2733	\N	315014	\N
322869	GENERIC_DAY	5	4	f	2010-02-26	2733	\N	315014	\N
322871	GENERIC_DAY	5	4	f	2010-03-03	2732	\N	315014	\N
322833	GENERIC_DAY	5	0	f	2010-03-07	2732	\N	315014	\N
322852	GENERIC_DAY	5	0	f	2010-03-13	2733	\N	315014	\N
322873	GENERIC_DAY	5	0	f	2010-03-20	2732	\N	315014	\N
322840	GENERIC_DAY	5	4	f	2010-03-03	2733	\N	315014	\N
322849	GENERIC_DAY	5	4	f	2010-03-15	2733	\N	315014	\N
322826	GENERIC_DAY	5	4	f	2010-03-09	2732	\N	315014	\N
322850	GENERIC_DAY	5	4	f	2010-03-10	2733	\N	315014	\N
322825	GENERIC_DAY	5	0	f	2010-03-14	2733	\N	315014	\N
322875	GENERIC_DAY	5	4	f	2010-03-10	2732	\N	315014	\N
322843	GENERIC_DAY	5	4	f	2010-03-04	2732	\N	315014	\N
322863	GENERIC_DAY	5	4	f	2010-02-24	2733	\N	315014	\N
322857	GENERIC_DAY	5	0	f	2010-02-27	2733	\N	315014	\N
322828	GENERIC_DAY	5	0	f	2010-03-13	2732	\N	315014	\N
322856	GENERIC_DAY	5	4	f	2010-02-25	2732	\N	315014	\N
322855	GENERIC_DAY	5	4	f	2010-03-16	2733	\N	315014	\N
322838	GENERIC_DAY	5	4	f	2010-03-09	2733	\N	315014	\N
322861	GENERIC_DAY	5	4	f	2010-02-26	2732	\N	315014	\N
322866	GENERIC_DAY	5	0	f	2010-03-21	2733	\N	315014	\N
322865	GENERIC_DAY	5	4	f	2010-03-04	2733	\N	315014	\N
322834	GENERIC_DAY	5	0	f	2010-03-07	2733	\N	315014	\N
322831	GENERIC_DAY	5	3	f	2010-03-22	2733	\N	315014	\N
322868	GENERIC_DAY	5	4	f	2010-03-19	2733	\N	315014	\N
322845	GENERIC_DAY	5	4	f	2010-03-18	2732	\N	315014	\N
322848	GENERIC_DAY	5	4	f	2010-03-19	2732	\N	315014	\N
322835	GENERIC_DAY	5	4	f	2010-03-11	2733	\N	315014	\N
322877	GENERIC_DAY	5	4	f	2010-03-17	2732	\N	315014	\N
322878	GENERIC_DAY	5	4	f	2010-03-11	2732	\N	315014	\N
322841	GENERIC_DAY	5	0	f	2010-03-14	2732	\N	315014	\N
322854	GENERIC_DAY	5	0	f	2010-03-06	2732	\N	315014	\N
322847	GENERIC_DAY	5	4	f	2010-03-02	2733	\N	315014	\N
322839	GENERIC_DAY	5	0	f	2010-02-28	2732	\N	315014	\N
322853	GENERIC_DAY	5	4	f	2010-03-05	2732	\N	315014	\N
322827	GENERIC_DAY	5	4	f	2010-03-12	2732	\N	315014	\N
322864	GENERIC_DAY	5	0	f	2010-03-06	2733	\N	315014	\N
322858	GENERIC_DAY	5	4	f	2010-03-02	2732	\N	315014	\N
322837	GENERIC_DAY	5	0	f	2010-03-20	2733	\N	315014	\N
322851	GENERIC_DAY	5	4	f	2010-03-05	2733	\N	315014	\N
329475	GENERIC_DAY	4	4	f	2010-03-30	2733	\N	328762	\N
329484	GENERIC_DAY	4	4	f	2010-04-12	2732	\N	328762	\N
329492	GENERIC_DAY	4	0	f	2010-04-10	2733	\N	328762	\N
329455	GENERIC_DAY	4	4	f	2010-04-12	2733	\N	328762	\N
329489	GENERIC_DAY	4	4	f	2010-04-07	2733	\N	328762	\N
329458	GENERIC_DAY	4	4	f	2010-04-09	2733	\N	328762	\N
329456	GENERIC_DAY	4	4	f	2010-03-23	2732	\N	328762	\N
329460	GENERIC_DAY	4	4	f	2010-04-05	2733	\N	328762	\N
329482	GENERIC_DAY	4	0	f	2010-04-04	2732	\N	328762	\N
329462	GENERIC_DAY	4	0	f	2010-03-28	2733	\N	328762	\N
329491	GENERIC_DAY	4	4	f	2010-04-15	2732	\N	328762	\N
329487	GENERIC_DAY	4	4	f	2010-04-08	2732	\N	328762	\N
329503	GENERIC_DAY	4	4	f	2010-03-23	2733	\N	328762	\N
329465	GENERIC_DAY	4	4	f	2010-04-13	2733	\N	328762	\N
329478	GENERIC_DAY	4	4	f	2010-03-24	2732	\N	328762	\N
329466	GENERIC_DAY	4	4	f	2010-03-29	2732	\N	328762	\N
329477	GENERIC_DAY	4	0	f	2010-03-27	2733	\N	328762	\N
329497	GENERIC_DAY	4	4	f	2010-04-07	2732	\N	328762	\N
329488	GENERIC_DAY	4	4	f	2010-03-25	2732	\N	328762	\N
329472	GENERIC_DAY	4	4	f	2010-04-13	2732	\N	328762	\N
329479	GENERIC_DAY	4	4	f	2010-04-14	2733	\N	328762	\N
329485	GENERIC_DAY	4	4	f	2010-04-09	2732	\N	328762	\N
329468	GENERIC_DAY	4	4	f	2010-03-24	2733	\N	328762	\N
329498	GENERIC_DAY	4	4	f	2010-03-31	2733	\N	328762	\N
329459	GENERIC_DAY	4	3	f	2010-04-16	2732	\N	328762	\N
329481	GENERIC_DAY	4	3	f	2010-04-16	2733	\N	328762	\N
329500	GENERIC_DAY	4	4	f	2010-04-08	2733	\N	328762	\N
329463	GENERIC_DAY	4	4	f	2010-04-01	2733	\N	328762	\N
329461	GENERIC_DAY	4	4	f	2010-03-29	2733	\N	328762	\N
329469	GENERIC_DAY	4	4	f	2010-04-01	2732	\N	328762	\N
329480	GENERIC_DAY	4	4	f	2010-03-26	2733	\N	328762	\N
329501	GENERIC_DAY	4	0	f	2010-04-03	2732	\N	328762	\N
329499	GENERIC_DAY	4	4	f	2010-03-25	2733	\N	328762	\N
329457	GENERIC_DAY	4	0	f	2010-04-11	2732	\N	328762	\N
329494	GENERIC_DAY	4	4	f	2010-04-02	2732	\N	328762	\N
329454	GENERIC_DAY	4	0	f	2010-04-03	2733	\N	328762	\N
329486	GENERIC_DAY	4	4	f	2010-04-06	2733	\N	328762	\N
329476	GENERIC_DAY	4	0	f	2010-04-04	2733	\N	328762	\N
329464	GENERIC_DAY	4	4	f	2010-04-02	2733	\N	328762	\N
329483	GENERIC_DAY	4	4	f	2010-04-15	2733	\N	328762	\N
329493	GENERIC_DAY	4	4	f	2010-03-31	2732	\N	328762	\N
329496	GENERIC_DAY	4	0	f	2010-03-27	2732	\N	328762	\N
329471	GENERIC_DAY	4	4	f	2010-04-14	2732	\N	328762	\N
329490	GENERIC_DAY	4	4	f	2010-03-30	2732	\N	328762	\N
329502	GENERIC_DAY	4	0	f	2010-04-10	2732	\N	328762	\N
329495	GENERIC_DAY	4	0	f	2010-03-28	2732	\N	328762	\N
329473	GENERIC_DAY	4	4	f	2010-04-05	2732	\N	328762	\N
329470	GENERIC_DAY	4	4	f	2010-03-26	2732	\N	328762	\N
329467	GENERIC_DAY	4	0	f	2010-04-11	2733	\N	328762	\N
329474	GENERIC_DAY	4	4	f	2010-04-06	2732	\N	328762	\N
346859	GENERIC_DAY	2	0	f	2010-01-10	1629	\N	342360	\N
346851	GENERIC_DAY	2	8	f	2010-01-08	1629	\N	342360	\N
346848	GENERIC_DAY	2	3	f	2010-01-15	1629	\N	342360	\N
346846	GENERIC_DAY	2	8	f	2010-01-07	1631	\N	342360	\N
346843	GENERIC_DAY	2	8	f	2010-01-08	1631	\N	342360	\N
346862	GENERIC_DAY	2	8	f	2010-01-07	1629	\N	342360	\N
346839	GENERIC_DAY	2	0	f	2010-01-02	1631	\N	342360	\N
346855	GENERIC_DAY	2	4	f	2010-01-06	1631	\N	342360	\N
346860	GENERIC_DAY	2	8	f	2010-01-12	1631	\N	342360	\N
346841	GENERIC_DAY	2	0	f	2010-01-03	1629	\N	342360	\N
346852	GENERIC_DAY	2	8	f	2010-01-04	1629	\N	342360	\N
346840	GENERIC_DAY	2	0	f	2010-01-09	1629	\N	342360	\N
346844	GENERIC_DAY	2	4	f	2010-01-06	1629	\N	342360	\N
346865	GENERIC_DAY	2	8	f	2010-01-14	1629	\N	342360	\N
346863	GENERIC_DAY	2	8	f	2010-01-11	1631	\N	342360	\N
346857	GENERIC_DAY	2	4	f	2010-01-01	1629	\N	342360	\N
346864	GENERIC_DAY	2	8	f	2010-01-05	1629	\N	342360	\N
346850	GENERIC_DAY	2	0	f	2010-01-02	1629	\N	342360	\N
346858	GENERIC_DAY	2	3	f	2010-01-15	1631	\N	342360	\N
346861	GENERIC_DAY	2	8	f	2010-01-14	1631	\N	342360	\N
346849	GENERIC_DAY	2	0	f	2010-01-03	1631	\N	342360	\N
346856	GENERIC_DAY	2	0	f	2010-01-10	1631	\N	342360	\N
346842	GENERIC_DAY	2	8	f	2010-01-11	1629	\N	342360	\N
346866	GENERIC_DAY	2	8	f	2010-01-04	1631	\N	342360	\N
346854	GENERIC_DAY	2	4	f	2010-01-01	1631	\N	342360	\N
346845	GENERIC_DAY	2	0	f	2010-01-09	1631	\N	342360	\N
346847	GENERIC_DAY	2	8	f	2010-01-05	1631	\N	342360	\N
346838	GENERIC_DAY	2	8	f	2010-01-13	1631	\N	342360	\N
346853	GENERIC_DAY	2	8	f	2010-01-12	1629	\N	342360	\N
346867	GENERIC_DAY	2	8	f	2010-01-13	1629	\N	342360	\N
346872	GENERIC_DAY	2	4	f	2010-01-20	1631	\N	342361	\N
346894	GENERIC_DAY	2	0	f	2010-01-30	1629	\N	342361	\N
346912	GENERIC_DAY	2	4	f	2010-02-01	1631	\N	342361	\N
346891	GENERIC_DAY	2	0	f	2010-02-06	1631	\N	342361	\N
346901	GENERIC_DAY	2	0	f	2010-01-17	1629	\N	342361	\N
346875	GENERIC_DAY	2	4	f	2010-02-02	1631	\N	342361	\N
346902	GENERIC_DAY	2	4	f	2010-01-22	1631	\N	342361	\N
346874	GENERIC_DAY	2	4	f	2010-02-05	1631	\N	342361	\N
346910	GENERIC_DAY	2	4	f	2010-02-08	1629	\N	342361	\N
346899	GENERIC_DAY	2	0	f	2010-01-31	1629	\N	342361	\N
346876	GENERIC_DAY	2	4	f	2010-01-26	1631	\N	342361	\N
346907	GENERIC_DAY	2	0	f	2010-01-31	1631	\N	342361	\N
346909	GENERIC_DAY	2	4	f	2010-01-26	1629	\N	342361	\N
346916	GENERIC_DAY	2	4	f	2010-01-21	1629	\N	342361	\N
346911	GENERIC_DAY	2	4	f	2010-02-09	1631	\N	342361	\N
346889	GENERIC_DAY	2	0	f	2010-01-30	1631	\N	342361	\N
346914	GENERIC_DAY	2	4	f	2010-02-05	1629	\N	342361	\N
346878	GENERIC_DAY	2	4	f	2010-02-09	1629	\N	342361	\N
346892	GENERIC_DAY	2	4	f	2010-02-04	1631	\N	342361	\N
346868	GENERIC_DAY	2	0	f	2010-02-06	1629	\N	342361	\N
346895	GENERIC_DAY	2	4	f	2010-01-29	1631	\N	342361	\N
346904	GENERIC_DAY	2	4	f	2010-01-27	1629	\N	342361	\N
346881	GENERIC_DAY	2	0	f	2010-01-17	1631	\N	342361	\N
346893	GENERIC_DAY	2	0	f	2010-01-23	1629	\N	342361	\N
346886	GENERIC_DAY	2	4	f	2010-01-18	1631	\N	342361	\N
346890	GENERIC_DAY	2	4	f	2010-02-10	1631	\N	342361	\N
346915	GENERIC_DAY	2	4	f	2010-01-19	1629	\N	342361	\N
346877	GENERIC_DAY	2	0	f	2010-01-24	1629	\N	342361	\N
346871	GENERIC_DAY	2	4	f	2010-02-03	1629	\N	342361	\N
346903	GENERIC_DAY	2	4	f	2010-01-28	1631	\N	342361	\N
346921	GENERIC_DAY	2	4	f	2010-02-03	1631	\N	342361	\N
346908	GENERIC_DAY	2	0	f	2010-02-07	1629	\N	342361	\N
346917	GENERIC_DAY	2	0	f	2010-01-16	1631	\N	342361	\N
346898	GENERIC_DAY	2	4	f	2010-01-21	1631	\N	342361	\N
346918	GENERIC_DAY	2	4	f	2010-01-27	1631	\N	342361	\N
346888	GENERIC_DAY	2	4	f	2010-02-02	1629	\N	342361	\N
346887	GENERIC_DAY	2	4	f	2010-01-19	1631	\N	342361	\N
346885	GENERIC_DAY	2	3	f	2010-02-11	1629	\N	342361	\N
346882	GENERIC_DAY	2	0	f	2010-01-23	1631	\N	342361	\N
346896	GENERIC_DAY	2	4	f	2010-02-10	1629	\N	342361	\N
346900	GENERIC_DAY	2	0	f	2010-02-07	1631	\N	342361	\N
346883	GENERIC_DAY	2	4	f	2010-02-01	1629	\N	342361	\N
346870	GENERIC_DAY	2	4	f	2010-01-25	1629	\N	342361	\N
346873	GENERIC_DAY	2	4	f	2010-01-22	1629	\N	342361	\N
346920	GENERIC_DAY	2	3	f	2010-02-11	1631	\N	342361	\N
346919	GENERIC_DAY	2	4	f	2010-01-28	1629	\N	342361	\N
346913	GENERIC_DAY	2	4	f	2010-02-04	1629	\N	342361	\N
346906	GENERIC_DAY	2	0	f	2010-01-16	1629	\N	342361	\N
346884	GENERIC_DAY	2	4	f	2010-01-20	1629	\N	342361	\N
346880	GENERIC_DAY	2	4	f	2010-01-18	1629	\N	342361	\N
346869	GENERIC_DAY	2	0	f	2010-01-24	1631	\N	342361	\N
346879	GENERIC_DAY	2	4	f	2010-01-25	1631	\N	342361	\N
346897	GENERIC_DAY	2	4	f	2010-01-29	1629	\N	342361	\N
346905	GENERIC_DAY	2	4	f	2010-02-08	1631	\N	342361	\N
346955	GENERIC_DAY	2	4	f	2010-01-20	1631	\N	342362	\N
346964	GENERIC_DAY	2	4	f	2010-02-08	1631	\N	342362	\N
346954	GENERIC_DAY	2	0	f	2010-01-24	1629	\N	342362	\N
346933	GENERIC_DAY	2	4	f	2010-02-03	1629	\N	342362	\N
346922	GENERIC_DAY	2	4	f	2010-02-02	1631	\N	342362	\N
346938	GENERIC_DAY	2	4	f	2010-01-22	1631	\N	342362	\N
346927	GENERIC_DAY	2	4	f	2010-02-04	1629	\N	342362	\N
346940	GENERIC_DAY	2	0	f	2010-02-06	1631	\N	342362	\N
346953	GENERIC_DAY	2	0	f	2010-01-17	1631	\N	342362	\N
346971	GENERIC_DAY	2	0	f	2010-01-23	1631	\N	342362	\N
346957	GENERIC_DAY	2	0	f	2010-01-16	1631	\N	342362	\N
346967	GENERIC_DAY	2	4	f	2010-02-08	1629	\N	342362	\N
346968	GENERIC_DAY	2	4	f	2010-02-05	1631	\N	342362	\N
346941	GENERIC_DAY	2	4	f	2010-01-29	1631	\N	342362	\N
346924	GENERIC_DAY	2	4	f	2010-01-27	1629	\N	342362	\N
346956	GENERIC_DAY	2	0	f	2010-01-30	1629	\N	342362	\N
346928	GENERIC_DAY	2	4	f	2010-01-28	1631	\N	342362	\N
346963	GENERIC_DAY	2	4	f	2010-01-20	1629	\N	342362	\N
346972	GENERIC_DAY	2	4	f	2010-02-02	1629	\N	342362	\N
346961	GENERIC_DAY	2	4	f	2010-02-05	1629	\N	342362	\N
346974	GENERIC_DAY	2	0	f	2010-02-07	1629	\N	342362	\N
346959	GENERIC_DAY	2	0	f	2010-01-17	1629	\N	342362	\N
346949	GENERIC_DAY	2	4	f	2010-02-09	1631	\N	342362	\N
346952	GENERIC_DAY	2	0	f	2010-01-30	1631	\N	342362	\N
346970	GENERIC_DAY	2	4	f	2010-01-26	1631	\N	342362	\N
346962	GENERIC_DAY	2	4	f	2010-01-26	1629	\N	342362	\N
346931	GENERIC_DAY	2	4	f	2010-02-09	1629	\N	342362	\N
346926	GENERIC_DAY	2	3	f	2010-02-11	1631	\N	342362	\N
346945	GENERIC_DAY	2	3	f	2010-02-11	1629	\N	342362	\N
346951	GENERIC_DAY	2	0	f	2010-01-23	1629	\N	342362	\N
346975	GENERIC_DAY	2	4	f	2010-01-28	1629	\N	342362	\N
346973	GENERIC_DAY	2	4	f	2010-02-10	1629	\N	342362	\N
322494	GENERIC_DAY	5	4	f	2010-02-11	2733	\N	315009	\N
322490	GENERIC_DAY	5	0	f	2010-01-23	2732	\N	315009	\N
322467	GENERIC_DAY	5	4	f	2010-02-05	2732	\N	315009	\N
322498	GENERIC_DAY	5	4	f	2010-02-04	2732	\N	315009	\N
322497	GENERIC_DAY	5	4	f	2010-01-25	2733	\N	315009	\N
322458	GENERIC_DAY	5	4	f	2010-01-20	2732	\N	315009	\N
322505	GENERIC_DAY	5	4	f	2010-01-26	2733	\N	315009	\N
322501	GENERIC_DAY	5	0	f	2010-01-30	2733	\N	315009	\N
322462	GENERIC_DAY	5	4	f	2010-01-26	2732	\N	315009	\N
322472	GENERIC_DAY	5	0	f	2010-02-07	2732	\N	315009	\N
322488	GENERIC_DAY	5	4	f	2010-02-11	2732	\N	315009	\N
322499	GENERIC_DAY	5	4	f	2010-02-01	2732	\N	315009	\N
322461	GENERIC_DAY	5	0	f	2010-01-23	2733	\N	315009	\N
322489	GENERIC_DAY	5	4	f	2010-02-09	2733	\N	315009	\N
322471	GENERIC_DAY	5	3	f	2010-02-12	2732	\N	315009	\N
322504	GENERIC_DAY	5	0	f	2010-01-24	2732	\N	315009	\N
322470	GENERIC_DAY	5	4	f	2010-02-02	2732	\N	315009	\N
322479	GENERIC_DAY	5	4	f	2010-02-02	2733	\N	315009	\N
322459	GENERIC_DAY	5	4	f	2010-01-19	2733	\N	315009	\N
322477	GENERIC_DAY	5	4	f	2010-01-25	2732	\N	315009	\N
322526	GENERIC_DAY	5	4	f	2010-01-15	2733	\N	315010	\N
322536	GENERIC_DAY	5	0	f	2010-01-10	2732	\N	315010	\N
322515	GENERIC_DAY	5	0	f	2010-01-09	2732	\N	315010	\N
322535	GENERIC_DAY	5	3	f	2010-01-27	2732	\N	315010	\N
322548	GENERIC_DAY	5	0	f	2010-01-16	2733	\N	315010	\N
322546	GENERIC_DAY	5	0	f	2010-01-24	2732	\N	315010	\N
322551	GENERIC_DAY	5	4	f	2010-01-08	2733	\N	315010	\N
322558	GENERIC_DAY	5	0	f	2010-01-17	2732	\N	315010	\N
322538	GENERIC_DAY	5	4	f	2010-01-21	2733	\N	315010	\N
346942	GENERIC_DAY	2	0	f	2010-02-07	1631	\N	342362	\N
346929	GENERIC_DAY	2	0	f	2010-01-31	1631	\N	342362	\N
346948	GENERIC_DAY	2	4	f	2010-01-29	1629	\N	342362	\N
346935	GENERIC_DAY	2	4	f	2010-01-25	1629	\N	342362	\N
307309	GENERIC_DAY	2	0	f	2010-08-08	299993	\N	303182	\N
307310	GENERIC_DAY	2	0	f	2010-08-21	299993	\N	303182	\N
307311	GENERIC_DAY	2	4	f	2010-08-13	299991	\N	303182	\N
307312	GENERIC_DAY	2	4	f	2010-08-23	299993	\N	303182	\N
307313	GENERIC_DAY	2	3	f	2010-08-26	299993	\N	303182	\N
307314	GENERIC_DAY	2	4	f	2010-08-20	299991	\N	303182	\N
307315	GENERIC_DAY	2	4	f	2010-08-20	299993	\N	303182	\N
307316	GENERIC_DAY	2	4	f	2010-08-12	299993	\N	303182	\N
307317	GENERIC_DAY	2	4	f	2010-08-03	299993	\N	303182	\N
307318	GENERIC_DAY	2	4	f	2010-08-16	299991	\N	303182	\N
307319	GENERIC_DAY	2	4	f	2010-08-09	299991	\N	303182	\N
307320	GENERIC_DAY	2	3	f	2010-08-26	299991	\N	303182	\N
307321	GENERIC_DAY	2	4	f	2010-08-24	299993	\N	303182	\N
307322	GENERIC_DAY	2	4	f	2010-08-24	299991	\N	303182	\N
307323	GENERIC_DAY	2	4	f	2010-08-18	299993	\N	303182	\N
307324	GENERIC_DAY	2	4	f	2010-08-17	299993	\N	303182	\N
346932	GENERIC_DAY	2	0	f	2010-01-16	1629	\N	342362	\N
346969	GENERIC_DAY	2	4	f	2010-01-21	1629	\N	342362	\N
346925	GENERIC_DAY	2	4	f	2010-02-04	1631	\N	342362	\N
346934	GENERIC_DAY	2	4	f	2010-01-18	1631	\N	342362	\N
346923	GENERIC_DAY	2	4	f	2010-02-03	1631	\N	342362	\N
346930	GENERIC_DAY	2	4	f	2010-01-25	1631	\N	342362	\N
346944	GENERIC_DAY	2	4	f	2010-02-01	1631	\N	342362	\N
346965	GENERIC_DAY	2	4	f	2010-01-19	1629	\N	342362	\N
346943	GENERIC_DAY	2	4	f	2010-01-19	1631	\N	342362	\N
346960	GENERIC_DAY	2	4	f	2010-01-27	1631	\N	342362	\N
346939	GENERIC_DAY	2	4	f	2010-01-18	1629	\N	342362	\N
346958	GENERIC_DAY	2	4	f	2010-02-10	1631	\N	342362	\N
346937	GENERIC_DAY	2	0	f	2010-02-06	1629	\N	342362	\N
346947	GENERIC_DAY	2	0	f	2010-01-31	1629	\N	342362	\N
346950	GENERIC_DAY	2	4	f	2010-01-22	1629	\N	342362	\N
346946	GENERIC_DAY	2	4	f	2010-02-01	1629	\N	342362	\N
346936	GENERIC_DAY	2	0	f	2010-01-24	1631	\N	342362	\N
346966	GENERIC_DAY	2	4	f	2010-01-21	1631	\N	342362	\N
336395	GENERIC_DAY	3	0	f	2010-01-10	2729	\N	334941	\N
336392	GENERIC_DAY	3	0	f	2010-01-09	2729	\N	334941	\N
336389	GENERIC_DAY	3	8	f	2010-01-13	2727	\N	334941	\N
336386	GENERIC_DAY	3	8	f	2010-01-12	2729	\N	334941	\N
336410	GENERIC_DAY	3	3	f	2010-01-15	2727	\N	334941	\N
336398	GENERIC_DAY	3	8	f	2010-01-14	2729	\N	334941	\N
336403	GENERIC_DAY	3	0	f	2010-01-02	2729	\N	334941	\N
336400	GENERIC_DAY	3	8	f	2010-01-05	2729	\N	334941	\N
336390	GENERIC_DAY	3	8	f	2010-01-11	2729	\N	334941	\N
336401	GENERIC_DAY	3	4	f	2010-01-01	2727	\N	334941	\N
336391	GENERIC_DAY	3	4	f	2010-01-06	2729	\N	334941	\N
336388	GENERIC_DAY	3	8	f	2010-01-13	2729	\N	334941	\N
336393	GENERIC_DAY	3	4	f	2010-01-01	2729	\N	334941	\N
336411	GENERIC_DAY	3	0	f	2010-01-09	2727	\N	334941	\N
336413	GENERIC_DAY	3	4	f	2010-01-06	2727	\N	334941	\N
336404	GENERIC_DAY	3	0	f	2010-01-03	2727	\N	334941	\N
336405	GENERIC_DAY	3	8	f	2010-01-12	2727	\N	334941	\N
336396	GENERIC_DAY	3	0	f	2010-01-03	2729	\N	334941	\N
336384	GENERIC_DAY	3	8	f	2010-01-05	2727	\N	334941	\N
336406	GENERIC_DAY	3	3	f	2010-01-15	2729	\N	334941	\N
336408	GENERIC_DAY	3	8	f	2010-01-08	2727	\N	334941	\N
336399	GENERIC_DAY	3	8	f	2010-01-07	2729	\N	334941	\N
336402	GENERIC_DAY	3	0	f	2010-01-10	2727	\N	334941	\N
336409	GENERIC_DAY	3	8	f	2010-01-14	2727	\N	334941	\N
336385	GENERIC_DAY	3	8	f	2010-01-07	2727	\N	334941	\N
336407	GENERIC_DAY	3	0	f	2010-01-02	2727	\N	334941	\N
336394	GENERIC_DAY	3	8	f	2010-01-04	2729	\N	334941	\N
336397	GENERIC_DAY	3	8	f	2010-01-11	2727	\N	334941	\N
336412	GENERIC_DAY	3	8	f	2010-01-08	2729	\N	334941	\N
336387	GENERIC_DAY	3	8	f	2010-01-04	2727	\N	334941	\N
336446	GENERIC_DAY	3	7	f	2010-01-22	2727	\N	334942	\N
336426	GENERIC_DAY	3	7	f	2010-01-25	2727	\N	334942	\N
336441	GENERIC_DAY	3	7	f	2010-01-19	2727	\N	334942	\N
336424	GENERIC_DAY	3	0	f	2010-01-23	2729	\N	334942	\N
336438	GENERIC_DAY	3	0	f	2010-01-31	2729	\N	334942	\N
336436	GENERIC_DAY	3	0	f	2010-01-31	2727	\N	334942	\N
336425	GENERIC_DAY	3	5	f	2010-02-01	2727	\N	334942	\N
336429	GENERIC_DAY	3	0	f	2010-01-23	2727	\N	334942	\N
336414	GENERIC_DAY	3	0	f	2010-01-17	2727	\N	334942	\N
336418	GENERIC_DAY	3	7	f	2010-01-18	2727	\N	334942	\N
336442	GENERIC_DAY	3	7	f	2010-01-22	2729	\N	334942	\N
336422	GENERIC_DAY	3	0	f	2010-01-24	2727	\N	334942	\N
336444	GENERIC_DAY	3	5	f	2010-02-01	2729	\N	334942	\N
336435	GENERIC_DAY	3	7	f	2010-01-20	2727	\N	334942	\N
336420	GENERIC_DAY	3	0	f	2010-01-24	2729	\N	334942	\N
336439	GENERIC_DAY	3	7	f	2010-01-19	2729	\N	334942	\N
336445	GENERIC_DAY	3	7	f	2010-01-21	2727	\N	334942	\N
336428	GENERIC_DAY	3	7	f	2010-01-26	2729	\N	334942	\N
336417	GENERIC_DAY	3	7	f	2010-01-25	2729	\N	334942	\N
336443	GENERIC_DAY	3	7	f	2010-01-21	2729	\N	334942	\N
336419	GENERIC_DAY	3	7	f	2010-01-27	2727	\N	334942	\N
336415	GENERIC_DAY	3	7	f	2010-01-26	2727	\N	334942	\N
336427	GENERIC_DAY	3	7	f	2010-01-28	2727	\N	334942	\N
336447	GENERIC_DAY	3	0	f	2010-01-16	2729	\N	334942	\N
336431	GENERIC_DAY	3	7	f	2010-01-18	2729	\N	334942	\N
336416	GENERIC_DAY	3	7	f	2010-01-27	2729	\N	334942	\N
336423	GENERIC_DAY	3	0	f	2010-01-17	2729	\N	334942	\N
336430	GENERIC_DAY	3	7	f	2010-01-20	2729	\N	334942	\N
336433	GENERIC_DAY	3	7	f	2010-01-29	2729	\N	334942	\N
336440	GENERIC_DAY	3	0	f	2010-01-30	2727	\N	334942	\N
336434	GENERIC_DAY	3	7	f	2010-01-29	2727	\N	334942	\N
336432	GENERIC_DAY	3	7	f	2010-01-28	2729	\N	334942	\N
336437	GENERIC_DAY	3	0	f	2010-01-16	2727	\N	334942	\N
336421	GENERIC_DAY	3	0	f	2010-01-30	2729	\N	334942	\N
336473	GENERIC_DAY	3	4	f	2010-02-23	2727	\N	334943	\N
336492	GENERIC_DAY	3	4	f	2010-02-08	2729	\N	334943	\N
336484	GENERIC_DAY	3	4	f	2010-02-10	2727	\N	334943	\N
336474	GENERIC_DAY	3	4	f	2010-02-08	2727	\N	334943	\N
336456	GENERIC_DAY	3	4	f	2010-02-10	2729	\N	334943	\N
336450	GENERIC_DAY	3	0	f	2010-02-13	2727	\N	334943	\N
336460	GENERIC_DAY	3	0	f	2010-02-07	2729	\N	334943	\N
336466	GENERIC_DAY	3	4	f	2010-02-03	2729	\N	334943	\N
336485	GENERIC_DAY	3	4	f	2010-02-12	2727	\N	334943	\N
336461	GENERIC_DAY	3	4	f	2010-02-25	2727	\N	334943	\N
336471	GENERIC_DAY	3	4	f	2010-02-04	2729	\N	334943	\N
336467	GENERIC_DAY	3	4	f	2010-02-18	2727	\N	334943	\N
336463	GENERIC_DAY	3	0	f	2010-02-06	2729	\N	334943	\N
336468	GENERIC_DAY	3	4	f	2010-02-22	2727	\N	334943	\N
336491	GENERIC_DAY	3	4	f	2010-02-23	2729	\N	334943	\N
336475	GENERIC_DAY	3	4	f	2010-02-12	2729	\N	334943	\N
336490	GENERIC_DAY	3	0	f	2010-02-07	2727	\N	334943	\N
336480	GENERIC_DAY	3	4	f	2010-02-19	2727	\N	334943	\N
336477	GENERIC_DAY	3	3	f	2010-02-26	2729	\N	334943	\N
336464	GENERIC_DAY	3	4	f	2010-02-18	2729	\N	334943	\N
336478	GENERIC_DAY	3	4	f	2010-02-17	2727	\N	334943	\N
336470	GENERIC_DAY	3	4	f	2010-02-24	2727	\N	334943	\N
336462	GENERIC_DAY	3	0	f	2010-02-20	2729	\N	334943	\N
336476	GENERIC_DAY	3	0	f	2010-02-06	2727	\N	334943	\N
336481	GENERIC_DAY	3	4	f	2010-02-16	2729	\N	334943	\N
336449	GENERIC_DAY	3	0	f	2010-02-13	2729	\N	334943	\N
336487	GENERIC_DAY	3	4	f	2010-02-16	2727	\N	334943	\N
336458	GENERIC_DAY	3	4	f	2010-02-03	2727	\N	334943	\N
336451	GENERIC_DAY	3	0	f	2010-02-21	2727	\N	334943	\N
336496	GENERIC_DAY	3	0	f	2010-02-14	2727	\N	334943	\N
336493	GENERIC_DAY	3	4	f	2010-02-22	2729	\N	334943	\N
336472	GENERIC_DAY	3	4	f	2010-02-09	2727	\N	334943	\N
336483	GENERIC_DAY	3	4	f	2010-02-02	2729	\N	334943	\N
336455	GENERIC_DAY	3	0	f	2010-02-14	2729	\N	334943	\N
336469	GENERIC_DAY	3	4	f	2010-02-09	2729	\N	334943	\N
336479	GENERIC_DAY	3	4	f	2010-02-04	2727	\N	334943	\N
336454	GENERIC_DAY	3	4	f	2010-02-05	2727	\N	334943	\N
336465	GENERIC_DAY	3	4	f	2010-02-05	2729	\N	334943	\N
336494	GENERIC_DAY	3	0	f	2010-02-21	2729	\N	334943	\N
336452	GENERIC_DAY	3	4	f	2010-02-17	2729	\N	334943	\N
336489	GENERIC_DAY	3	4	f	2010-02-15	2729	\N	334943	\N
336457	GENERIC_DAY	3	4	f	2010-02-02	2727	\N	334943	\N
336453	GENERIC_DAY	3	4	f	2010-02-11	2727	\N	334943	\N
336486	GENERIC_DAY	3	0	f	2010-02-20	2727	\N	334943	\N
336497	GENERIC_DAY	3	4	f	2010-02-15	2727	\N	334943	\N
336459	GENERIC_DAY	3	4	f	2010-02-24	2729	\N	334943	\N
336488	GENERIC_DAY	3	4	f	2010-02-19	2729	\N	334943	\N
336495	GENERIC_DAY	3	4	f	2010-02-25	2729	\N	334943	\N
336482	GENERIC_DAY	3	4	f	2010-02-11	2729	\N	334943	\N
336448	GENERIC_DAY	3	3	f	2010-02-26	2727	\N	334943	\N
336519	GENERIC_DAY	3	4	f	2010-02-17	2727	\N	334944	\N
336505	GENERIC_DAY	3	4	f	2010-02-11	2729	\N	334944	\N
336514	GENERIC_DAY	3	0	f	2010-02-07	2729	\N	334944	\N
336529	GENERIC_DAY	3	4	f	2010-02-25	2727	\N	334944	\N
336542	GENERIC_DAY	3	4	f	2010-02-11	2727	\N	334944	\N
336536	GENERIC_DAY	3	0	f	2010-02-14	2729	\N	334944	\N
336500	GENERIC_DAY	3	4	f	2010-02-19	2727	\N	334944	\N
336547	GENERIC_DAY	3	4	f	2010-02-04	2727	\N	334944	\N
336510	GENERIC_DAY	3	4	f	2010-02-23	2727	\N	334944	\N
336512	GENERIC_DAY	3	4	f	2010-02-15	2729	\N	334944	\N
336527	GENERIC_DAY	3	4	f	2010-02-12	2727	\N	334944	\N
336528	GENERIC_DAY	3	3	f	2010-02-26	2727	\N	334944	\N
336526	GENERIC_DAY	3	4	f	2010-02-05	2727	\N	334944	\N
336499	GENERIC_DAY	3	4	f	2010-02-04	2729	\N	334944	\N
336524	GENERIC_DAY	3	4	f	2010-02-17	2729	\N	334944	\N
336533	GENERIC_DAY	3	4	f	2010-02-25	2729	\N	334944	\N
336546	GENERIC_DAY	3	4	f	2010-02-10	2729	\N	334944	\N
336509	GENERIC_DAY	3	4	f	2010-02-05	2729	\N	334944	\N
336520	GENERIC_DAY	3	0	f	2010-02-21	2727	\N	334944	\N
336521	GENERIC_DAY	3	4	f	2010-02-03	2729	\N	334944	\N
336504	GENERIC_DAY	3	0	f	2010-02-06	2729	\N	334944	\N
336511	GENERIC_DAY	3	0	f	2010-02-13	2729	\N	334944	\N
336517	GENERIC_DAY	3	4	f	2010-02-03	2727	\N	334944	\N
336545	GENERIC_DAY	3	4	f	2010-02-02	2729	\N	334944	\N
336538	GENERIC_DAY	3	4	f	2010-02-16	2729	\N	334944	\N
336541	GENERIC_DAY	3	4	f	2010-02-09	2729	\N	334944	\N
336522	GENERIC_DAY	3	0	f	2010-02-06	2727	\N	334944	\N
336544	GENERIC_DAY	3	4	f	2010-02-16	2727	\N	334944	\N
336531	GENERIC_DAY	3	4	f	2010-02-23	2729	\N	334944	\N
336543	GENERIC_DAY	3	0	f	2010-02-20	2729	\N	334944	\N
336535	GENERIC_DAY	3	4	f	2010-02-24	2729	\N	334944	\N
336532	GENERIC_DAY	3	4	f	2010-02-08	2727	\N	334944	\N
336518	GENERIC_DAY	3	4	f	2010-02-12	2729	\N	334944	\N
336523	GENERIC_DAY	3	0	f	2010-02-13	2727	\N	334944	\N
336516	GENERIC_DAY	3	4	f	2010-02-18	2729	\N	334944	\N
336534	GENERIC_DAY	3	4	f	2010-02-22	2729	\N	334944	\N
336508	GENERIC_DAY	3	0	f	2010-02-14	2727	\N	334944	\N
336498	GENERIC_DAY	3	0	f	2010-02-21	2729	\N	334944	\N
336502	GENERIC_DAY	3	4	f	2010-02-08	2729	\N	334944	\N
336537	GENERIC_DAY	3	3	f	2010-02-26	2729	\N	334944	\N
336525	GENERIC_DAY	3	4	f	2010-02-18	2727	\N	334944	\N
336506	GENERIC_DAY	3	4	f	2010-02-24	2727	\N	334944	\N
336540	GENERIC_DAY	3	0	f	2010-02-07	2727	\N	334944	\N
336513	GENERIC_DAY	3	0	f	2010-02-20	2727	\N	334944	\N
336515	GENERIC_DAY	3	4	f	2010-02-09	2727	\N	334944	\N
336501	GENERIC_DAY	3	4	f	2010-02-22	2727	\N	334944	\N
336530	GENERIC_DAY	3	4	f	2010-02-10	2727	\N	334944	\N
336539	GENERIC_DAY	3	4	f	2010-02-02	2727	\N	334944	\N
336507	GENERIC_DAY	3	4	f	2010-02-15	2727	\N	334944	\N
336503	GENERIC_DAY	3	4	f	2010-02-19	2729	\N	334944	\N
336573	GENERIC_DAY	3	2	f	2010-03-01	2729	\N	334945	\N
336600	GENERIC_DAY	3	2	f	2010-03-09	2727	\N	334945	\N
336608	GENERIC_DAY	3	2	f	2010-03-22	2727	\N	334945	\N
336571	GENERIC_DAY	3	0	f	2010-02-27	2729	\N	334945	\N
336602	GENERIC_DAY	3	2	f	2010-02-17	2727	\N	334945	\N
336633	GENERIC_DAY	3	2	f	2010-03-09	2729	\N	334945	\N
336582	GENERIC_DAY	3	0	f	2010-03-14	2729	\N	334945	\N
336622	GENERIC_DAY	3	2	f	2010-02-09	2727	\N	334945	\N
336567	GENERIC_DAY	3	2	f	2010-02-10	2727	\N	334945	\N
336621	GENERIC_DAY	3	2	f	2010-03-01	2727	\N	334945	\N
336565	GENERIC_DAY	3	2	f	2010-03-04	2729	\N	334945	\N
336637	GENERIC_DAY	3	2	f	2010-02-26	2727	\N	334945	\N
336569	GENERIC_DAY	3	2	f	2010-03-15	2729	\N	334945	\N
336630	GENERIC_DAY	3	2	f	2010-02-08	2729	\N	334945	\N
336635	GENERIC_DAY	3	0	f	2010-02-28	2727	\N	334945	\N
336651	GENERIC_DAY	3	2	f	2010-02-03	2729	\N	334945	\N
336611	GENERIC_DAY	3	0	f	2010-02-14	2729	\N	334945	\N
336577	GENERIC_DAY	3	2	f	2010-02-19	2729	\N	334945	\N
336645	GENERIC_DAY	3	2	f	2010-02-10	2729	\N	334945	\N
336640	GENERIC_DAY	3	2	f	2010-02-25	2727	\N	334945	\N
336642	GENERIC_DAY	3	2	f	2010-02-03	2727	\N	334945	\N
336598	GENERIC_DAY	3	2	f	2010-03-15	2727	\N	334945	\N
336587	GENERIC_DAY	3	0	f	2010-03-06	2727	\N	334945	\N
336557	GENERIC_DAY	3	0	f	2010-02-28	2729	\N	334945	\N
336563	GENERIC_DAY	3	1	f	2010-03-25	2727	\N	334945	\N
336579	GENERIC_DAY	3	0	f	2010-02-06	2727	\N	334945	\N
336631	GENERIC_DAY	3	2	f	2010-03-23	2729	\N	334945	\N
336562	GENERIC_DAY	3	2	f	2010-03-24	2727	\N	334945	\N
336625	GENERIC_DAY	3	2	f	2010-02-18	2729	\N	334945	\N
336606	GENERIC_DAY	3	0	f	2010-02-14	2727	\N	334945	\N
336593	GENERIC_DAY	3	2	f	2010-03-11	2727	\N	334945	\N
336561	GENERIC_DAY	3	2	f	2010-03-10	2727	\N	334945	\N
336578	GENERIC_DAY	3	0	f	2010-03-06	2729	\N	334945	\N
336639	GENERIC_DAY	3	2	f	2010-03-12	2727	\N	334945	\N
336592	GENERIC_DAY	3	2	f	2010-03-10	2729	\N	334945	\N
336588	GENERIC_DAY	3	2	f	2010-02-23	2729	\N	334945	\N
336613	GENERIC_DAY	3	0	f	2010-02-27	2727	\N	334945	\N
336595	GENERIC_DAY	3	2	f	2010-03-24	2729	\N	334945	\N
336586	GENERIC_DAY	3	0	f	2010-03-21	2729	\N	334945	\N
336585	GENERIC_DAY	3	2	f	2010-03-16	2729	\N	334945	\N
336646	GENERIC_DAY	3	0	f	2010-03-20	2729	\N	334945	\N
336647	GENERIC_DAY	3	2	f	2010-02-22	2729	\N	334945	\N
336556	GENERIC_DAY	3	2	f	2010-03-08	2729	\N	334945	\N
336623	GENERIC_DAY	3	2	f	2010-02-16	2727	\N	334945	\N
336649	GENERIC_DAY	3	0	f	2010-02-06	2729	\N	334945	\N
336629	GENERIC_DAY	3	2	f	2010-03-17	2729	\N	334945	\N
336553	GENERIC_DAY	3	0	f	2010-02-13	2729	\N	334945	\N
336583	GENERIC_DAY	3	2	f	2010-02-11	2729	\N	334945	\N
336618	GENERIC_DAY	3	2	f	2010-03-18	2729	\N	334945	\N
336564	GENERIC_DAY	3	2	f	2010-02-02	2729	\N	334945	\N
336548	GENERIC_DAY	3	2	f	2010-03-16	2727	\N	334945	\N
336605	GENERIC_DAY	3	0	f	2010-02-21	2727	\N	334945	\N
336615	GENERIC_DAY	3	0	f	2010-02-13	2727	\N	334945	\N
336555	GENERIC_DAY	3	2	f	2010-03-18	2727	\N	334945	\N
336566	GENERIC_DAY	3	2	f	2010-03-08	2727	\N	334945	\N
336581	GENERIC_DAY	3	2	f	2010-03-17	2727	\N	334945	\N
336644	GENERIC_DAY	3	0	f	2010-02-20	2727	\N	334945	\N
336638	GENERIC_DAY	3	2	f	2010-02-11	2727	\N	334945	\N
336597	GENERIC_DAY	3	2	f	2010-02-16	2729	\N	334945	\N
336570	GENERIC_DAY	3	0	f	2010-03-20	2727	\N	334945	\N
336604	GENERIC_DAY	3	0	f	2010-03-14	2727	\N	334945	\N
336641	GENERIC_DAY	3	0	f	2010-02-07	2729	\N	334945	\N
336603	GENERIC_DAY	3	2	f	2010-03-19	2727	\N	334945	\N
336572	GENERIC_DAY	3	0	f	2010-03-21	2727	\N	334945	\N
336552	GENERIC_DAY	3	2	f	2010-03-03	2727	\N	334945	\N
336601	GENERIC_DAY	3	2	f	2010-03-02	2727	\N	334945	\N
336628	GENERIC_DAY	3	2	f	2010-02-19	2727	\N	334945	\N
336632	GENERIC_DAY	3	2	f	2010-02-02	2727	\N	334945	\N
336574	GENERIC_DAY	3	2	f	2010-02-05	2729	\N	334945	\N
336558	GENERIC_DAY	3	2	f	2010-02-09	2729	\N	334945	\N
336636	GENERIC_DAY	3	0	f	2010-02-21	2729	\N	334945	\N
336626	GENERIC_DAY	3	2	f	2010-03-23	2727	\N	334945	\N
336584	GENERIC_DAY	3	2	f	2010-02-23	2727	\N	334945	\N
336549	GENERIC_DAY	3	2	f	2010-03-03	2729	\N	334945	\N
336550	GENERIC_DAY	3	2	f	2010-03-04	2727	\N	334945	\N
336589	GENERIC_DAY	3	2	f	2010-02-24	2729	\N	334945	\N
336609	GENERIC_DAY	3	0	f	2010-02-20	2729	\N	334945	\N
336568	GENERIC_DAY	3	2	f	2010-03-05	2729	\N	334945	\N
336590	GENERIC_DAY	3	2	f	2010-03-19	2729	\N	334945	\N
336607	GENERIC_DAY	3	2	f	2010-02-22	2727	\N	334945	\N
336559	GENERIC_DAY	3	2	f	2010-02-15	2727	\N	334945	\N
336620	GENERIC_DAY	3	2	f	2010-02-18	2727	\N	334945	\N
336616	GENERIC_DAY	3	0	f	2010-03-07	2727	\N	334945	\N
336627	GENERIC_DAY	3	2	f	2010-02-04	2727	\N	334945	\N
336551	GENERIC_DAY	3	2	f	2010-02-08	2727	\N	334945	\N
336619	GENERIC_DAY	3	2	f	2010-03-12	2729	\N	334945	\N
336580	GENERIC_DAY	3	2	f	2010-03-05	2727	\N	334945	\N
336596	GENERIC_DAY	3	2	f	2010-03-22	2729	\N	334945	\N
336554	GENERIC_DAY	3	0	f	2010-03-13	2729	\N	334945	\N
336594	GENERIC_DAY	3	2	f	2010-02-04	2729	\N	334945	\N
352520	GENERIC_DAY	1	5	f	2010-01-04	1623	\N	349498	\N
352518	GENERIC_DAY	1	0	f	2010-01-03	1619	\N	349498	\N
352508	GENERIC_DAY	1	6	f	2010-01-08	1619	\N	349498	\N
352505	GENERIC_DAY	1	3	f	2010-01-01	1623	\N	349498	\N
352481	GENERIC_DAY	1	0	f	2010-01-02	1619	\N	349498	\N
352496	GENERIC_DAY	1	0	f	2010-01-02	1625	\N	349498	\N
352500	GENERIC_DAY	1	5	f	2010-01-04	1625	\N	349498	\N
352491	GENERIC_DAY	1	0	f	2010-01-09	1623	\N	349498	\N
352488	GENERIC_DAY	1	3	f	2010-01-06	1623	\N	349498	\N
352485	GENERIC_DAY	1	5	f	2010-01-05	1623	\N	349498	\N
352497	GENERIC_DAY	1	0	f	2010-01-03	1623	\N	349498	\N
352489	GENERIC_DAY	1	6	f	2010-01-13	1619	\N	349498	\N
352493	GENERIC_DAY	1	2	f	2010-01-15	1623	\N	349498	\N
352486	GENERIC_DAY	1	5	f	2010-01-12	1623	\N	349498	\N
352487	GENERIC_DAY	1	5	f	2010-01-13	1623	\N	349498	\N
352521	GENERIC_DAY	1	0	f	2010-01-02	1623	\N	349498	\N
352483	GENERIC_DAY	1	5	f	2010-01-05	1625	\N	349498	\N
352499	GENERIC_DAY	1	0	f	2010-01-10	1625	\N	349498	\N
352514	GENERIC_DAY	1	5	f	2010-01-08	1623	\N	349498	\N
352494	GENERIC_DAY	1	5	f	2010-01-07	1625	\N	349498	\N
352504	GENERIC_DAY	1	2	f	2010-01-15	1625	\N	349498	\N
352519	GENERIC_DAY	1	0	f	2010-01-10	1619	\N	349498	\N
352510	GENERIC_DAY	1	2	f	2010-01-01	1625	\N	349498	\N
352517	GENERIC_DAY	1	0	f	2010-01-09	1625	\N	349498	\N
352498	GENERIC_DAY	1	0	f	2010-01-10	1623	\N	349498	\N
352522	GENERIC_DAY	1	0	f	2010-01-09	1619	\N	349498	\N
352515	GENERIC_DAY	1	5	f	2010-01-11	1625	\N	349498	\N
352507	GENERIC_DAY	1	5	f	2010-01-08	1625	\N	349498	\N
352484	GENERIC_DAY	1	6	f	2010-01-12	1619	\N	349498	\N
352490	GENERIC_DAY	1	2	f	2010-01-15	1619	\N	349498	\N
352480	GENERIC_DAY	1	5	f	2010-01-07	1623	\N	349498	\N
352503	GENERIC_DAY	1	5	f	2010-01-14	1623	\N	349498	\N
352509	GENERIC_DAY	1	3	f	2010-01-06	1619	\N	349498	\N
352512	GENERIC_DAY	1	6	f	2010-01-04	1619	\N	349498	\N
352523	GENERIC_DAY	1	6	f	2010-01-14	1619	\N	349498	\N
352513	GENERIC_DAY	1	3	f	2010-01-01	1619	\N	349498	\N
352482	GENERIC_DAY	1	5	f	2010-01-13	1625	\N	349498	\N
352511	GENERIC_DAY	1	5	f	2010-01-14	1625	\N	349498	\N
352524	GENERIC_DAY	1	6	f	2010-01-07	1619	\N	349498	\N
352492	GENERIC_DAY	1	5	f	2010-01-12	1625	\N	349498	\N
352502	GENERIC_DAY	1	6	f	2010-01-05	1619	\N	349498	\N
352516	GENERIC_DAY	1	2	f	2010-01-06	1625	\N	349498	\N
352506	GENERIC_DAY	1	0	f	2010-01-03	1625	\N	349498	\N
352501	GENERIC_DAY	1	6	f	2010-01-11	1619	\N	349498	\N
352495	GENERIC_DAY	1	5	f	2010-01-11	1623	\N	349498	\N
352592	GENERIC_DAY	1	0	f	2010-01-17	1623	\N	349499	\N
352549	GENERIC_DAY	1	3	f	2010-01-13	1623	\N	349499	\N
352532	GENERIC_DAY	1	3	f	2010-01-20	1619	\N	349499	\N
352589	GENERIC_DAY	1	2	f	2010-01-15	1625	\N	349499	\N
352545	GENERIC_DAY	1	3	f	2010-01-25	1623	\N	349499	\N
352600	GENERIC_DAY	1	3	f	2010-01-19	1623	\N	349499	\N
352602	GENERIC_DAY	1	0	f	2010-01-10	1625	\N	349499	\N
352562	GENERIC_DAY	1	3	f	2010-01-21	1619	\N	349499	\N
352582	GENERIC_DAY	1	2	f	2010-01-07	1619	\N	349499	\N
352583	GENERIC_DAY	1	3	f	2010-01-20	1623	\N	349499	\N
352538	GENERIC_DAY	1	3	f	2010-01-18	1619	\N	349499	\N
352558	GENERIC_DAY	1	3	f	2010-01-11	1623	\N	349499	\N
352578	GENERIC_DAY	1	3	f	2010-01-26	1619	\N	349499	\N
352599	GENERIC_DAY	1	3	f	2010-01-18	1623	\N	349499	\N
352581	GENERIC_DAY	1	0	f	2010-01-17	1625	\N	349499	\N
352577	GENERIC_DAY	1	3	f	2010-01-07	1623	\N	349499	\N
352548	GENERIC_DAY	1	2	f	2010-01-04	1619	\N	349499	\N
352528	GENERIC_DAY	1	3	f	2010-01-15	1619	\N	349499	\N
352574	GENERIC_DAY	1	3	f	2010-01-06	1625	\N	349499	\N
352586	GENERIC_DAY	1	0	f	2010-01-23	1625	\N	349499	\N
352559	GENERIC_DAY	1	3	f	2010-01-12	1623	\N	349499	\N
352563	GENERIC_DAY	1	0	f	2010-01-09	1625	\N	349499	\N
352580	GENERIC_DAY	1	0	f	2010-01-24	1625	\N	349499	\N
352529	GENERIC_DAY	1	2	f	2010-01-11	1619	\N	349499	\N
352535	GENERIC_DAY	1	2	f	2010-01-01	1623	\N	349499	\N
352526	GENERIC_DAY	1	2	f	2010-01-19	1625	\N	349499	\N
352554	GENERIC_DAY	1	0	f	2010-01-09	1623	\N	349499	\N
352527	GENERIC_DAY	1	3	f	2010-01-07	1625	\N	349499	\N
352566	GENERIC_DAY	1	0	f	2010-01-02	1619	\N	349499	\N
352603	GENERIC_DAY	1	3	f	2010-01-05	1623	\N	349499	\N
352568	GENERIC_DAY	1	2	f	2010-01-20	1625	\N	349499	\N
352598	GENERIC_DAY	1	2	f	2010-01-08	1619	\N	349499	\N
352573	GENERIC_DAY	1	2	f	2010-01-26	1625	\N	349499	\N
352587	GENERIC_DAY	1	2	f	2010-01-21	1625	\N	349499	\N
352534	GENERIC_DAY	1	3	f	2010-01-11	1625	\N	349499	\N
352556	GENERIC_DAY	1	3	f	2010-01-21	1623	\N	349499	\N
352553	GENERIC_DAY	1	2	f	2010-01-06	1623	\N	349499	\N
352584	GENERIC_DAY	1	3	f	2010-01-08	1625	\N	349499	\N
352537	GENERIC_DAY	1	0	f	2010-01-17	1619	\N	349499	\N
352590	GENERIC_DAY	1	3	f	2010-01-08	1623	\N	349499	\N
352539	GENERIC_DAY	1	2	f	2010-01-14	1619	\N	349499	\N
352543	GENERIC_DAY	1	2	f	2010-01-27	1619	\N	349499	\N
352571	GENERIC_DAY	1	0	f	2010-01-24	1623	\N	349499	\N
352595	GENERIC_DAY	1	0	f	2010-01-09	1619	\N	349499	\N
352542	GENERIC_DAY	1	2	f	2010-01-27	1623	\N	349499	\N
352593	GENERIC_DAY	1	2	f	2010-01-05	1619	\N	349499	\N
352579	GENERIC_DAY	1	2	f	2010-01-27	1625	\N	349499	\N
352544	GENERIC_DAY	1	3	f	2010-01-06	1619	\N	349499	\N
352547	GENERIC_DAY	1	0	f	2010-01-23	1623	\N	349499	\N
352525	GENERIC_DAY	1	3	f	2010-01-01	1625	\N	349499	\N
352597	GENERIC_DAY	1	0	f	2010-01-16	1625	\N	349499	\N
352531	GENERIC_DAY	1	0	f	2010-01-03	1625	\N	349499	\N
352561	GENERIC_DAY	1	3	f	2010-01-14	1625	\N	349499	\N
352530	GENERIC_DAY	1	3	f	2010-01-19	1619	\N	349499	\N
352605	GENERIC_DAY	1	2	f	2010-01-12	1619	\N	349499	\N
352572	GENERIC_DAY	1	3	f	2010-01-15	1623	\N	349499	\N
352588	GENERIC_DAY	1	3	f	2010-01-04	1623	\N	349499	\N
352550	GENERIC_DAY	1	3	f	2010-01-14	1623	\N	349499	\N
352536	GENERIC_DAY	1	0	f	2010-01-10	1619	\N	349499	\N
352555	GENERIC_DAY	1	0	f	2010-01-03	1623	\N	349499	\N
352570	GENERIC_DAY	1	2	f	2010-01-18	1625	\N	349499	\N
352541	GENERIC_DAY	1	0	f	2010-01-24	1619	\N	349499	\N
352533	GENERIC_DAY	1	3	f	2010-01-01	1619	\N	349499	\N
352564	GENERIC_DAY	1	3	f	2010-01-26	1623	\N	349499	\N
352594	GENERIC_DAY	1	3	f	2010-01-12	1625	\N	349499	\N
352604	GENERIC_DAY	1	3	f	2010-01-04	1625	\N	349499	\N
352540	GENERIC_DAY	1	3	f	2010-01-22	1619	\N	349499	\N
352575	GENERIC_DAY	1	0	f	2010-01-23	1619	\N	349499	\N
352551	GENERIC_DAY	1	2	f	2010-01-25	1625	\N	349499	\N
352567	GENERIC_DAY	1	0	f	2010-01-03	1619	\N	349499	\N
352552	GENERIC_DAY	1	3	f	2010-01-05	1625	\N	349499	\N
352560	GENERIC_DAY	1	0	f	2010-01-16	1623	\N	349499	\N
352569	GENERIC_DAY	1	3	f	2010-01-13	1625	\N	349499	\N
352585	GENERIC_DAY	1	3	f	2010-01-25	1619	\N	349499	\N
352557	GENERIC_DAY	1	3	f	2010-01-22	1623	\N	349499	\N
352565	GENERIC_DAY	1	0	f	2010-01-02	1623	\N	349499	\N
352576	GENERIC_DAY	1	2	f	2010-01-13	1619	\N	349499	\N
352601	GENERIC_DAY	1	0	f	2010-01-02	1625	\N	349499	\N
352596	GENERIC_DAY	1	0	f	2010-01-16	1619	\N	349499	\N
352546	GENERIC_DAY	1	2	f	2010-01-22	1625	\N	349499	\N
352591	GENERIC_DAY	1	0	f	2010-01-10	1623	\N	349499	\N
352680	GENERIC_DAY	1	3	f	2010-02-05	1619	\N	349500	\N
352679	GENERIC_DAY	1	0	f	2010-02-06	1623	\N	349500	\N
352628	GENERIC_DAY	1	2	f	2010-02-03	1625	\N	349500	\N
352684	GENERIC_DAY	1	2	f	2010-02-04	1625	\N	349500	\N
352664	GENERIC_DAY	1	2	f	2010-01-21	1623	\N	349500	\N
352641	GENERIC_DAY	1	3	f	2010-01-28	1619	\N	349500	\N
352613	GENERIC_DAY	1	3	f	2010-02-02	1623	\N	349500	\N
352653	GENERIC_DAY	1	3	f	2010-01-19	1619	\N	349500	\N
352677	GENERIC_DAY	1	0	f	2010-01-17	1619	\N	349500	\N
352650	GENERIC_DAY	1	3	f	2010-02-08	1623	\N	349500	\N
352652	GENERIC_DAY	1	2	f	2010-02-11	1619	\N	349500	\N
352667	GENERIC_DAY	1	2	f	2010-01-27	1625	\N	349500	\N
352656	GENERIC_DAY	1	0	f	2010-01-30	1623	\N	349500	\N
352636	GENERIC_DAY	1	2	f	2010-01-18	1623	\N	349500	\N
352674	GENERIC_DAY	1	3	f	2010-02-08	1619	\N	349500	\N
352671	GENERIC_DAY	1	3	f	2010-01-25	1619	\N	349500	\N
352645	GENERIC_DAY	1	3	f	2010-01-20	1625	\N	349500	\N
352625	GENERIC_DAY	1	0	f	2010-02-06	1625	\N	349500	\N
352662	GENERIC_DAY	1	0	f	2010-01-31	1625	\N	349500	\N
352616	GENERIC_DAY	1	0	f	2010-02-07	1625	\N	349500	\N
352647	GENERIC_DAY	1	3	f	2010-01-26	1625	\N	349500	\N
352668	GENERIC_DAY	1	0	f	2010-02-06	1619	\N	349500	\N
352621	GENERIC_DAY	1	3	f	2010-02-10	1619	\N	349500	\N
352607	GENERIC_DAY	1	3	f	2010-02-03	1619	\N	349500	\N
352643	GENERIC_DAY	1	0	f	2010-01-23	1625	\N	349500	\N
352658	GENERIC_DAY	1	3	f	2010-02-09	1619	\N	349500	\N
352627	GENERIC_DAY	1	2	f	2010-02-02	1625	\N	349500	\N
352610	GENERIC_DAY	1	3	f	2010-02-09	1623	\N	349500	\N
352676	GENERIC_DAY	1	2	f	2010-01-20	1623	\N	349500	\N
352675	GENERIC_DAY	1	0	f	2010-01-30	1619	\N	349500	\N
352626	GENERIC_DAY	1	3	f	2010-01-29	1619	\N	349500	\N
352609	GENERIC_DAY	1	3	f	2010-01-25	1625	\N	349500	\N
352678	GENERIC_DAY	1	0	f	2010-01-31	1619	\N	349500	\N
352670	GENERIC_DAY	1	0	f	2010-02-07	1619	\N	349500	\N
352655	GENERIC_DAY	1	0	f	2010-01-24	1619	\N	349500	\N
352683	GENERIC_DAY	1	0	f	2010-01-17	1623	\N	349500	\N
352642	GENERIC_DAY	1	3	f	2010-02-10	1623	\N	349500	\N
352646	GENERIC_DAY	1	3	f	2010-02-02	1619	\N	349500	\N
352630	GENERIC_DAY	1	3	f	2010-01-27	1623	\N	349500	\N
352615	GENERIC_DAY	1	2	f	2010-02-01	1625	\N	349500	\N
352635	GENERIC_DAY	1	0	f	2010-01-31	1623	\N	349500	\N
352663	GENERIC_DAY	1	3	f	2010-01-18	1619	\N	349500	\N
352631	GENERIC_DAY	1	3	f	2010-01-21	1619	\N	349500	\N
352644	GENERIC_DAY	1	0	f	2010-01-30	1625	\N	349500	\N
352666	GENERIC_DAY	1	0	f	2010-01-24	1625	\N	349500	\N
352637	GENERIC_DAY	1	3	f	2010-01-18	1625	\N	349500	\N
352665	GENERIC_DAY	1	3	f	2010-02-03	1623	\N	349500	\N
352686	GENERIC_DAY	1	3	f	2010-01-28	1623	\N	349500	\N
352624	GENERIC_DAY	1	3	f	2010-01-20	1619	\N	349500	\N
352619	GENERIC_DAY	1	2	f	2010-01-22	1623	\N	349500	\N
352672	GENERIC_DAY	1	0	f	2010-01-16	1625	\N	349500	\N
352618	GENERIC_DAY	1	0	f	2010-01-16	1619	\N	349500	\N
352681	GENERIC_DAY	1	3	f	2010-01-29	1623	\N	349500	\N
352622	GENERIC_DAY	1	2	f	2010-02-11	1625	\N	349500	\N
352638	GENERIC_DAY	1	3	f	2010-01-27	1619	\N	349500	\N
352640	GENERIC_DAY	1	3	f	2010-02-05	1623	\N	349500	\N
352659	GENERIC_DAY	1	3	f	2010-02-04	1619	\N	349500	\N
352657	GENERIC_DAY	1	2	f	2010-01-25	1623	\N	349500	\N
352648	GENERIC_DAY	1	3	f	2010-01-21	1625	\N	349500	\N
352620	GENERIC_DAY	1	0	f	2010-01-23	1623	\N	349500	\N
352669	GENERIC_DAY	1	0	f	2010-01-23	1619	\N	349500	\N
352661	GENERIC_DAY	1	2	f	2010-02-08	1625	\N	349500	\N
352634	GENERIC_DAY	1	2	f	2010-01-26	1623	\N	349500	\N
352685	GENERIC_DAY	1	3	f	2010-01-19	1625	\N	349500	\N
352633	GENERIC_DAY	1	0	f	2010-01-17	1625	\N	349500	\N
352606	GENERIC_DAY	1	2	f	2010-01-28	1625	\N	349500	\N
352614	GENERIC_DAY	1	2	f	2010-02-09	1625	\N	349500	\N
352617	GENERIC_DAY	1	0	f	2010-02-07	1623	\N	349500	\N
352654	GENERIC_DAY	1	0	f	2010-01-16	1623	\N	349500	\N
352649	GENERIC_DAY	1	0	f	2010-01-24	1623	\N	349500	\N
352612	GENERIC_DAY	1	2	f	2010-02-10	1625	\N	349500	\N
352623	GENERIC_DAY	1	3	f	2010-01-22	1619	\N	349500	\N
352660	GENERIC_DAY	1	3	f	2010-01-26	1619	\N	349500	\N
352611	GENERIC_DAY	1	3	f	2010-02-01	1619	\N	349500	\N
352608	GENERIC_DAY	1	3	f	2010-02-01	1623	\N	349500	\N
352629	GENERIC_DAY	1	2	f	2010-02-05	1625	\N	349500	\N
352639	GENERIC_DAY	1	2	f	2010-01-19	1623	\N	349500	\N
352682	GENERIC_DAY	1	3	f	2010-02-04	1623	\N	349500	\N
352673	GENERIC_DAY	1	2	f	2010-02-11	1623	\N	349500	\N
352632	GENERIC_DAY	1	2	f	2010-01-29	1625	\N	349500	\N
352651	GENERIC_DAY	1	3	f	2010-01-22	1625	\N	349500	\N
352758	GENERIC_DAY	1	0	f	2010-02-07	1619	\N	349501	\N
352766	GENERIC_DAY	1	3	f	2010-01-19	1623	\N	349501	\N
352717	GENERIC_DAY	1	0	f	2010-01-17	1619	\N	349501	\N
352714	GENERIC_DAY	1	0	f	2010-01-31	1623	\N	349501	\N
352724	GENERIC_DAY	1	2	f	2010-01-20	1619	\N	349501	\N
352755	GENERIC_DAY	1	3	f	2010-02-05	1625	\N	349501	\N
352737	GENERIC_DAY	1	3	f	2010-01-18	1623	\N	349501	\N
352748	GENERIC_DAY	1	3	f	2010-01-26	1623	\N	349501	\N
352754	GENERIC_DAY	1	2	f	2010-01-18	1619	\N	349501	\N
352687	GENERIC_DAY	1	0	f	2010-01-31	1619	\N	349501	\N
352728	GENERIC_DAY	1	3	f	2010-02-03	1623	\N	349501	\N
352726	GENERIC_DAY	1	2	f	2010-01-22	1619	\N	349501	\N
352718	GENERIC_DAY	1	0	f	2010-01-17	1623	\N	349501	\N
352716	GENERIC_DAY	1	0	f	2010-01-30	1619	\N	349501	\N
352715	GENERIC_DAY	1	2	f	2010-01-25	1619	\N	349501	\N
352753	GENERIC_DAY	1	2	f	2010-02-05	1619	\N	349501	\N
352733	GENERIC_DAY	1	0	f	2010-01-16	1625	\N	349501	\N
352765	GENERIC_DAY	1	3	f	2010-01-27	1623	\N	349501	\N
352751	GENERIC_DAY	1	3	f	2010-01-20	1625	\N	349501	\N
352694	GENERIC_DAY	1	2	f	2010-01-28	1619	\N	349501	\N
352722	GENERIC_DAY	1	0	f	2010-02-06	1619	\N	349501	\N
352725	GENERIC_DAY	1	3	f	2010-01-25	1623	\N	349501	\N
352690	GENERIC_DAY	1	3	f	2010-01-29	1625	\N	349501	\N
352743	GENERIC_DAY	1	3	f	2010-01-20	1623	\N	349501	\N
352711	GENERIC_DAY	1	2	f	2010-02-11	1625	\N	349501	\N
352764	GENERIC_DAY	1	3	f	2010-01-19	1625	\N	349501	\N
352721	GENERIC_DAY	1	3	f	2010-01-21	1623	\N	349501	\N
352752	GENERIC_DAY	1	0	f	2010-01-16	1623	\N	349501	\N
352738	GENERIC_DAY	1	3	f	2010-01-28	1623	\N	349501	\N
352729	GENERIC_DAY	1	2	f	2010-02-11	1619	\N	349501	\N
352739	GENERIC_DAY	1	3	f	2010-02-04	1625	\N	349501	\N
352706	GENERIC_DAY	1	3	f	2010-01-28	1625	\N	349501	\N
352701	GENERIC_DAY	1	2	f	2010-01-21	1619	\N	349501	\N
352713	GENERIC_DAY	1	3	f	2010-02-01	1625	\N	349501	\N
352746	GENERIC_DAY	1	3	f	2010-02-03	1625	\N	349501	\N
352707	GENERIC_DAY	1	0	f	2010-01-23	1619	\N	349501	\N
352695	GENERIC_DAY	1	0	f	2010-01-24	1625	\N	349501	\N
352740	GENERIC_DAY	1	2	f	2010-02-04	1619	\N	349501	\N
352761	GENERIC_DAY	1	3	f	2010-01-26	1625	\N	349501	\N
352763	GENERIC_DAY	1	2	f	2010-01-19	1619	\N	349501	\N
352689	GENERIC_DAY	1	0	f	2010-01-31	1625	\N	349501	\N
352734	GENERIC_DAY	1	0	f	2010-02-06	1625	\N	349501	\N
352762	GENERIC_DAY	1	3	f	2010-01-18	1625	\N	349501	\N
352749	GENERIC_DAY	1	3	f	2010-02-05	1623	\N	349501	\N
352732	GENERIC_DAY	1	2	f	2010-01-26	1619	\N	349501	\N
352719	GENERIC_DAY	1	0	f	2010-01-17	1625	\N	349501	\N
352760	GENERIC_DAY	1	2	f	2010-02-11	1623	\N	349501	\N
352742	GENERIC_DAY	1	2	f	2010-02-09	1619	\N	349501	\N
352693	GENERIC_DAY	1	3	f	2010-01-29	1623	\N	349501	\N
352759	GENERIC_DAY	1	3	f	2010-01-22	1623	\N	349501	\N
352750	GENERIC_DAY	1	3	f	2010-02-08	1623	\N	349501	\N
352731	GENERIC_DAY	1	3	f	2010-02-02	1625	\N	349501	\N
352736	GENERIC_DAY	1	3	f	2010-01-21	1625	\N	349501	\N
352705	GENERIC_DAY	1	2	f	2010-01-27	1619	\N	349501	\N
352720	GENERIC_DAY	1	3	f	2010-02-01	1623	\N	349501	\N
352712	GENERIC_DAY	1	3	f	2010-02-09	1625	\N	349501	\N
352692	GENERIC_DAY	1	2	f	2010-02-08	1619	\N	349501	\N
352730	GENERIC_DAY	1	2	f	2010-01-29	1619	\N	349501	\N
352702	GENERIC_DAY	1	0	f	2010-02-07	1625	\N	349501	\N
352703	GENERIC_DAY	1	0	f	2010-01-16	1619	\N	349501	\N
352697	GENERIC_DAY	1	0	f	2010-01-24	1623	\N	349501	\N
352698	GENERIC_DAY	1	3	f	2010-02-10	1623	\N	349501	\N
352723	GENERIC_DAY	1	3	f	2010-01-27	1625	\N	349501	\N
352691	GENERIC_DAY	1	3	f	2010-01-22	1625	\N	349501	\N
352735	GENERIC_DAY	1	2	f	2010-02-03	1619	\N	349501	\N
352747	GENERIC_DAY	1	3	f	2010-02-04	1623	\N	349501	\N
352699	GENERIC_DAY	1	0	f	2010-01-30	1623	\N	349501	\N
352708	GENERIC_DAY	1	3	f	2010-01-25	1625	\N	349501	\N
352700	GENERIC_DAY	1	0	f	2010-02-07	1623	\N	349501	\N
352767	GENERIC_DAY	1	3	f	2010-02-10	1625	\N	349501	\N
352756	GENERIC_DAY	1	3	f	2010-02-09	1623	\N	349501	\N
352710	GENERIC_DAY	1	3	f	2010-02-08	1625	\N	349501	\N
352696	GENERIC_DAY	1	2	f	2010-02-02	1619	\N	349501	\N
352744	GENERIC_DAY	1	0	f	2010-01-30	1625	\N	349501	\N
352741	GENERIC_DAY	1	0	f	2010-02-06	1623	\N	349501	\N
352757	GENERIC_DAY	1	0	f	2010-01-23	1625	\N	349501	\N
352709	GENERIC_DAY	1	2	f	2010-02-01	1619	\N	349501	\N
352688	GENERIC_DAY	1	0	f	2010-01-24	1619	\N	349501	\N
352745	GENERIC_DAY	1	0	f	2010-01-23	1623	\N	349501	\N
352704	GENERIC_DAY	1	2	f	2010-02-10	1619	\N	349501	\N
352727	GENERIC_DAY	1	3	f	2010-02-02	1623	\N	349501	\N
353358	GENERIC_DAY	1	1	f	2010-03-29	1617	\N	349508	\N
353260	GENERIC_DAY	1	1	f	2010-02-08	2020	\N	349508	\N
353277	GENERIC_DAY	1	1	f	2010-02-03	1617	\N	349508	\N
353323	GENERIC_DAY	1	2	f	2010-01-05	2020	\N	349508	\N
353300	GENERIC_DAY	1	1	f	2010-03-12	1617	\N	349508	\N
353324	GENERIC_DAY	1	1	f	2010-02-19	1617	\N	349508	\N
353371	GENERIC_DAY	1	1	f	2010-02-05	2020	\N	349508	\N
353297	GENERIC_DAY	1	1	f	2010-03-02	2020	\N	349508	\N
353258	GENERIC_DAY	1	1	f	2010-01-12	1617	\N	349508	\N
353317	GENERIC_DAY	1	1	f	2010-02-15	1617	\N	349508	\N
353321	GENERIC_DAY	1	1	f	2010-03-18	1617	\N	349508	\N
353315	GENERIC_DAY	1	1	f	2010-01-22	1617	\N	349508	\N
353333	GENERIC_DAY	1	1	f	2010-01-21	1617	\N	349508	\N
353345	GENERIC_DAY	1	1	f	2010-01-14	1617	\N	349508	\N
353359	GENERIC_DAY	1	1	f	2010-04-14	1617	\N	349508	\N
353278	GENERIC_DAY	1	1	f	2010-01-20	2020	\N	349508	\N
353284	GENERIC_DAY	1	1	f	2010-01-26	1617	\N	349508	\N
353310	GENERIC_DAY	1	1	f	2010-02-25	2020	\N	349508	\N
353255	GENERIC_DAY	1	1	f	2010-04-07	1617	\N	349508	\N
353274	GENERIC_DAY	1	1	f	2010-01-27	2020	\N	349508	\N
353308	GENERIC_DAY	1	1	f	2010-04-26	1617	\N	349508	\N
353372	GENERIC_DAY	1	1	f	2010-02-15	2020	\N	349508	\N
353335	GENERIC_DAY	1	1	f	2010-04-12	1617	\N	349508	\N
353350	GENERIC_DAY	1	1	f	2010-04-13	1617	\N	349508	\N
353385	GENERIC_DAY	1	1	f	2010-01-18	2020	\N	349508	\N
353380	GENERIC_DAY	1	1	f	2010-02-01	1617	\N	349508	\N
353373	GENERIC_DAY	1	1	f	2010-03-30	1617	\N	349508	\N
353279	GENERIC_DAY	1	1	f	2010-02-09	1617	\N	349508	\N
353262	GENERIC_DAY	1	1	f	2010-02-26	2020	\N	349508	\N
353287	GENERIC_DAY	1	1	f	2010-02-16	2020	\N	349508	\N
353266	GENERIC_DAY	1	1	f	2010-01-25	1617	\N	349508	\N
353264	GENERIC_DAY	1	1	f	2010-05-11	1617	\N	349508	\N
353273	GENERIC_DAY	1	1	f	2010-04-28	1617	\N	349508	\N
353298	GENERIC_DAY	1	1	f	2010-01-13	2020	\N	349508	\N
353374	GENERIC_DAY	1	1	f	2010-05-21	1617	\N	349508	\N
353360	GENERIC_DAY	1	1	f	2010-04-30	1617	\N	349508	\N
353303	GENERIC_DAY	1	1	f	2010-05-26	1617	\N	349508	\N
353389	GENERIC_DAY	1	1	f	2010-01-29	2020	\N	349508	\N
353334	GENERIC_DAY	1	1	f	2010-02-05	1617	\N	349508	\N
353370	GENERIC_DAY	1	1	f	2010-04-09	1617	\N	349508	\N
353365	GENERIC_DAY	1	1	f	2010-05-07	1617	\N	349508	\N
353259	GENERIC_DAY	1	1	f	2010-05-28	1617	\N	349508	\N
353341	GENERIC_DAY	1	1	f	2010-03-03	2020	\N	349508	\N
353368	GENERIC_DAY	1	1	f	2010-05-14	1617	\N	349508	\N
353366	GENERIC_DAY	1	1	f	2010-02-16	1617	\N	349508	\N
353272	GENERIC_DAY	1	1	f	2010-03-10	1617	\N	349508	\N
353283	GENERIC_DAY	1	1	f	2010-03-05	1617	\N	349508	\N
353338	GENERIC_DAY	1	1	f	2010-01-27	1617	\N	349508	\N
353391	GENERIC_DAY	1	1	f	2010-03-08	1617	\N	349508	\N
353270	GENERIC_DAY	1	1	f	2010-02-17	2020	\N	349508	\N
353355	GENERIC_DAY	1	1	f	2010-02-24	2020	\N	349508	\N
353302	GENERIC_DAY	1	1	f	2010-01-21	2020	\N	349508	\N
353327	GENERIC_DAY	1	1	f	2010-02-04	2020	\N	349508	\N
353393	GENERIC_DAY	1	1	f	2010-04-01	1617	\N	349508	\N
353377	GENERIC_DAY	1	1	f	2010-02-12	1617	\N	349508	\N
353339	GENERIC_DAY	1	1	f	2010-05-10	1617	\N	349508	\N
353392	GENERIC_DAY	1	1	f	2010-02-25	1617	\N	349508	\N
353296	GENERIC_DAY	1	1	f	2010-03-01	1617	\N	349508	\N
353386	GENERIC_DAY	1	1	f	2010-04-08	1617	\N	349508	\N
353319	GENERIC_DAY	1	1	f	2010-01-22	2020	\N	349508	\N
353356	GENERIC_DAY	1	1	f	2010-03-23	1617	\N	349508	\N
353271	GENERIC_DAY	1	1	f	2010-03-19	1617	\N	349508	\N
353309	GENERIC_DAY	1	1	f	2010-02-18	2020	\N	349508	\N
353390	GENERIC_DAY	1	1	f	2010-01-26	2020	\N	349508	\N
353396	GENERIC_DAY	1	2	f	2010-01-01	2020	\N	349508	\N
353267	GENERIC_DAY	1	1	f	2010-02-04	1617	\N	349508	\N
353363	GENERIC_DAY	1	1	f	2010-04-29	1617	\N	349508	\N
353352	GENERIC_DAY	1	1	f	2010-01-15	2020	\N	349508	\N
353384	GENERIC_DAY	1	1	f	2010-03-22	1617	\N	349508	\N
353362	GENERIC_DAY	1	1	f	2010-01-12	2020	\N	349508	\N
353316	GENERIC_DAY	1	1	f	2010-04-27	1617	\N	349508	\N
353331	GENERIC_DAY	1	1	f	2010-01-19	1617	\N	349508	\N
353293	GENERIC_DAY	1	1	f	2010-02-09	2020	\N	349508	\N
353328	GENERIC_DAY	1	1	f	2010-03-04	1617	\N	349508	\N
353340	GENERIC_DAY	1	1	f	2010-05-27	1617	\N	349508	\N
353342	GENERIC_DAY	1	1	f	2010-05-12	1617	\N	349508	\N
353261	GENERIC_DAY	1	1	f	2010-02-23	2020	\N	349508	\N
353343	GENERIC_DAY	1	1	f	2010-03-11	1617	\N	349508	\N
353332	GENERIC_DAY	1	1	f	2010-05-03	1617	\N	349508	\N
353381	GENERIC_DAY	1	2	f	2010-01-06	2020	\N	349508	\N
353276	GENERIC_DAY	1	1	f	2010-02-10	2020	\N	349508	\N
353326	GENERIC_DAY	1	1	f	2010-02-02	1617	\N	349508	\N
353378	GENERIC_DAY	1	1	f	2010-03-26	1617	\N	349508	\N
353330	GENERIC_DAY	1	2	f	2010-01-11	2020	\N	349508	\N
353292	GENERIC_DAY	1	1	f	2010-02-22	2020	\N	349508	\N
353375	GENERIC_DAY	1	1	f	2010-05-19	1617	\N	349508	\N
353351	GENERIC_DAY	1	1	f	2010-05-04	1617	\N	349508	\N
353387	GENERIC_DAY	1	1	f	2010-04-22	1617	\N	349508	\N
353268	GENERIC_DAY	1	1	f	2010-01-28	2020	\N	349508	\N
353395	GENERIC_DAY	1	1	f	2010-02-17	1617	\N	349508	\N
353285	GENERIC_DAY	1	1	f	2010-02-02	2020	\N	349508	\N
353280	GENERIC_DAY	1	1	f	2010-02-18	1617	\N	349508	\N
353346	GENERIC_DAY	1	1	f	2010-04-16	1617	\N	349508	\N
353325	GENERIC_DAY	1	1	f	2010-03-02	1617	\N	349508	\N
353394	GENERIC_DAY	1	1	f	2010-05-25	1617	\N	349508	\N
353388	GENERIC_DAY	1	1	f	2010-02-26	1617	\N	349508	\N
353291	GENERIC_DAY	1	1	f	2010-03-24	1617	\N	349508	\N
353275	GENERIC_DAY	1	1	f	2010-02-03	2020	\N	349508	\N
353312	GENERIC_DAY	1	1	f	2010-02-11	1617	\N	349508	\N
353265	GENERIC_DAY	1	1	f	2010-01-25	2020	\N	349508	\N
353254	GENERIC_DAY	1	1	f	2010-02-19	2020	\N	349508	\N
353256	GENERIC_DAY	1	1	f	2010-03-25	1617	\N	349508	\N
353376	GENERIC_DAY	1	1	f	2010-01-13	1617	\N	349508	\N
353364	GENERIC_DAY	1	1	f	2010-01-18	1617	\N	349508	\N
353263	GENERIC_DAY	1	1	f	2010-04-15	1617	\N	349508	\N
353348	GENERIC_DAY	1	1	f	2010-02-22	1617	\N	349508	\N
353357	GENERIC_DAY	1	1	f	2010-02-24	1617	\N	349508	\N
353329	GENERIC_DAY	1	1	f	2010-04-05	1617	\N	349508	\N
353311	GENERIC_DAY	1	1	f	2010-05-17	1617	\N	349508	\N
353354	GENERIC_DAY	1	1	f	2010-03-16	1617	\N	349508	\N
353322	GENERIC_DAY	1	1	f	2010-02-08	1617	\N	349508	\N
353344	GENERIC_DAY	1	1	f	2010-04-06	1617	\N	349508	\N
353349	GENERIC_DAY	1	1	f	2010-02-11	2020	\N	349508	\N
353369	GENERIC_DAY	1	1	f	2010-03-31	1617	\N	349508	\N
353299	GENERIC_DAY	1	1	f	2010-04-21	1617	\N	349508	\N
353313	GENERIC_DAY	1	1	f	2010-01-29	1617	\N	349508	\N
353288	GENERIC_DAY	1	1	f	2010-02-23	1617	\N	349508	\N
353290	GENERIC_DAY	1	1	f	2010-03-17	1617	\N	349508	\N
353286	GENERIC_DAY	1	1	f	2010-03-01	2020	\N	349508	\N
353306	GENERIC_DAY	1	2	f	2010-01-07	2020	\N	349508	\N
353383	GENERIC_DAY	1	1	f	2010-05-18	1617	\N	349508	\N
353367	GENERIC_DAY	1	2	f	2010-01-04	2020	\N	349508	\N
353307	GENERIC_DAY	1	1	f	2010-01-20	1617	\N	349508	\N
353337	GENERIC_DAY	1	1	f	2010-05-20	1617	\N	349508	\N
353347	GENERIC_DAY	1	1	f	2010-05-06	1617	\N	349508	\N
353379	GENERIC_DAY	1	1	f	2010-05-24	1617	\N	349508	\N
353301	GENERIC_DAY	1	1	f	2010-04-02	1617	\N	349508	\N
353289	GENERIC_DAY	1	1	f	2010-03-03	1617	\N	349508	\N
353353	GENERIC_DAY	1	1	f	2010-01-28	1617	\N	349508	\N
353361	GENERIC_DAY	1	1	f	2010-03-09	1617	\N	349508	\N
353257	GENERIC_DAY	1	1	f	2010-02-10	1617	\N	349508	\N
353320	GENERIC_DAY	1	1	f	2010-01-14	2020	\N	349508	\N
353305	GENERIC_DAY	1	2	f	2010-01-08	2020	\N	349508	\N
353318	GENERIC_DAY	1	1	f	2010-05-13	1617	\N	349508	\N
353304	GENERIC_DAY	1	1	f	2010-04-23	1617	\N	349508	\N
353336	GENERIC_DAY	1	1	f	2010-01-19	2020	\N	349508	\N
353295	GENERIC_DAY	1	1	f	2010-02-12	2020	\N	349508	\N
353269	GENERIC_DAY	1	1	f	2010-05-05	1617	\N	349508	\N
353281	GENERIC_DAY	1	1	f	2010-02-01	2020	\N	349508	\N
353314	GENERIC_DAY	1	1	f	2010-04-20	1617	\N	349508	\N
353382	GENERIC_DAY	1	1	f	2010-03-15	1617	\N	349508	\N
353294	GENERIC_DAY	1	1	f	2010-04-19	1617	\N	349508	\N
353282	GENERIC_DAY	1	1	f	2010-01-15	1617	\N	349508	\N
354735	GENERIC_DAY	0	4	f	2010-04-05	2733	\N	315015	\N
354736	GENERIC_DAY	0	0	f	2010-04-04	2732	\N	315015	\N
354737	GENERIC_DAY	0	4	f	2010-03-30	2732	\N	315015	\N
354738	GENERIC_DAY	0	0	f	2010-04-11	2733	\N	315015	\N
354739	GENERIC_DAY	0	4	f	2010-04-08	2733	\N	315015	\N
354740	GENERIC_DAY	0	4	f	2010-04-13	2732	\N	315015	\N
354741	GENERIC_DAY	0	4	f	2010-03-30	2733	\N	315015	\N
354742	GENERIC_DAY	0	0	f	2010-04-03	2732	\N	315015	\N
354743	GENERIC_DAY	0	4	f	2010-04-14	2732	\N	315015	\N
354744	GENERIC_DAY	0	0	f	2010-03-27	2733	\N	315015	\N
354745	GENERIC_DAY	0	4	f	2010-04-06	2733	\N	315015	\N
354746	GENERIC_DAY	0	4	f	2010-04-15	2733	\N	315015	\N
354747	GENERIC_DAY	0	0	f	2010-04-10	2732	\N	315015	\N
354748	GENERIC_DAY	0	4	f	2010-04-01	2732	\N	315015	\N
354749	GENERIC_DAY	0	4	f	2010-04-02	2733	\N	315015	\N
354750	GENERIC_DAY	0	0	f	2010-03-28	2733	\N	315015	\N
354751	GENERIC_DAY	0	4	f	2010-03-24	2733	\N	315015	\N
354752	GENERIC_DAY	0	0	f	2010-04-03	2733	\N	315015	\N
354753	GENERIC_DAY	0	4	f	2010-04-06	2732	\N	315015	\N
354754	GENERIC_DAY	0	4	f	2010-04-15	2732	\N	315015	\N
354755	GENERIC_DAY	0	4	f	2010-03-23	2732	\N	315015	\N
354756	GENERIC_DAY	0	3	f	2010-04-16	2733	\N	315015	\N
354757	GENERIC_DAY	0	4	f	2010-03-23	2733	\N	315015	\N
354758	GENERIC_DAY	0	4	f	2010-04-09	2732	\N	315015	\N
354759	GENERIC_DAY	0	4	f	2010-03-25	2732	\N	315015	\N
354760	GENERIC_DAY	0	0	f	2010-03-28	2732	\N	315015	\N
354761	GENERIC_DAY	0	4	f	2010-03-31	2733	\N	315015	\N
354762	GENERIC_DAY	0	0	f	2010-04-04	2733	\N	315015	\N
354763	GENERIC_DAY	0	4	f	2010-04-08	2732	\N	315015	\N
354764	GENERIC_DAY	0	0	f	2010-04-10	2733	\N	315015	\N
354765	GENERIC_DAY	0	4	f	2010-03-25	2733	\N	315015	\N
354766	GENERIC_DAY	0	4	f	2010-04-14	2733	\N	315015	\N
354767	GENERIC_DAY	0	4	f	2010-04-01	2733	\N	315015	\N
354768	GENERIC_DAY	0	4	f	2010-03-29	2733	\N	315015	\N
354769	GENERIC_DAY	0	4	f	2010-03-26	2733	\N	315015	\N
354770	GENERIC_DAY	0	4	f	2010-04-12	2732	\N	315015	\N
354771	GENERIC_DAY	0	0	f	2010-03-27	2732	\N	315015	\N
354772	GENERIC_DAY	0	4	f	2010-04-09	2733	\N	315015	\N
354773	GENERIC_DAY	0	4	f	2010-04-07	2732	\N	315015	\N
354774	GENERIC_DAY	0	4	f	2010-04-13	2733	\N	315015	\N
354775	GENERIC_DAY	0	4	f	2010-03-31	2732	\N	315015	\N
354776	GENERIC_DAY	0	4	f	2010-03-26	2732	\N	315015	\N
354777	GENERIC_DAY	0	0	f	2010-04-11	2732	\N	315015	\N
354778	GENERIC_DAY	0	4	f	2010-04-07	2733	\N	315015	\N
354779	GENERIC_DAY	0	4	f	2010-03-29	2732	\N	315015	\N
354780	GENERIC_DAY	0	3	f	2010-04-16	2732	\N	315015	\N
354781	GENERIC_DAY	0	4	f	2010-04-12	2733	\N	315015	\N
354782	GENERIC_DAY	0	4	f	2010-04-02	2732	\N	315015	\N
354783	GENERIC_DAY	0	4	f	2010-04-05	2732	\N	315015	\N
354784	GENERIC_DAY	0	4	f	2010-03-24	2732	\N	315015	\N
354785	GENERIC_DAY	0	4	f	2010-04-28	2732	\N	328763	\N
354786	GENERIC_DAY	0	4	f	2010-04-19	2732	\N	328763	\N
354787	GENERIC_DAY	0	4	f	2010-05-06	2732	\N	328763	\N
354788	GENERIC_DAY	0	4	f	2010-05-03	2733	\N	328763	\N
354789	GENERIC_DAY	0	4	f	2010-04-26	2733	\N	328763	\N
354790	GENERIC_DAY	0	4	f	2010-05-04	2733	\N	328763	\N
354791	GENERIC_DAY	0	0	f	2010-05-09	2733	\N	328763	\N
354792	GENERIC_DAY	0	4	f	2010-04-30	2732	\N	328763	\N
354793	GENERIC_DAY	0	0	f	2010-04-17	2732	\N	328763	\N
354794	GENERIC_DAY	0	0	f	2010-04-18	2733	\N	328763	\N
354795	GENERIC_DAY	0	0	f	2010-05-02	2732	\N	328763	\N
354796	GENERIC_DAY	0	0	f	2010-04-17	2733	\N	328763	\N
354797	GENERIC_DAY	0	4	f	2010-05-10	2732	\N	328763	\N
354798	GENERIC_DAY	0	4	f	2010-04-23	2733	\N	328763	\N
354799	GENERIC_DAY	0	0	f	2010-05-01	2733	\N	328763	\N
354800	GENERIC_DAY	0	4	f	2010-05-06	2733	\N	328763	\N
354801	GENERIC_DAY	0	0	f	2010-04-25	2732	\N	328763	\N
354802	GENERIC_DAY	0	4	f	2010-05-07	2733	\N	328763	\N
354803	GENERIC_DAY	0	4	f	2010-05-05	2732	\N	328763	\N
354804	GENERIC_DAY	0	4	f	2010-04-20	2733	\N	328763	\N
354805	GENERIC_DAY	0	4	f	2010-05-04	2732	\N	328763	\N
354806	GENERIC_DAY	0	4	f	2010-05-11	2732	\N	328763	\N
354807	GENERIC_DAY	0	4	f	2010-05-12	2732	\N	328763	\N
354808	GENERIC_DAY	0	4	f	2010-04-29	2732	\N	328763	\N
354809	GENERIC_DAY	0	4	f	2010-04-26	2732	\N	328763	\N
354810	GENERIC_DAY	0	4	f	2010-05-11	2733	\N	328763	\N
354811	GENERIC_DAY	0	0	f	2010-04-24	2732	\N	328763	\N
354812	GENERIC_DAY	0	4	f	2010-04-23	2732	\N	328763	\N
354813	GENERIC_DAY	0	4	f	2010-05-07	2732	\N	328763	\N
354814	GENERIC_DAY	0	4	f	2010-04-27	2733	\N	328763	\N
354815	GENERIC_DAY	0	0	f	2010-05-02	2733	\N	328763	\N
354816	GENERIC_DAY	0	0	f	2010-04-24	2733	\N	328763	\N
354817	GENERIC_DAY	0	0	f	2010-05-08	2732	\N	328763	\N
354818	GENERIC_DAY	0	4	f	2010-04-22	2733	\N	328763	\N
354819	GENERIC_DAY	0	4	f	2010-05-12	2733	\N	328763	\N
354820	GENERIC_DAY	0	4	f	2010-04-27	2732	\N	328763	\N
354821	GENERIC_DAY	0	4	f	2010-04-21	2733	\N	328763	\N
354822	GENERIC_DAY	0	3	f	2010-05-13	2732	\N	328763	\N
354823	GENERIC_DAY	0	4	f	2010-04-21	2732	\N	328763	\N
354824	GENERIC_DAY	0	4	f	2010-04-22	2732	\N	328763	\N
354825	GENERIC_DAY	0	0	f	2010-05-09	2732	\N	328763	\N
354826	GENERIC_DAY	0	4	f	2010-04-28	2733	\N	328763	\N
354827	GENERIC_DAY	0	4	f	2010-04-19	2733	\N	328763	\N
354828	GENERIC_DAY	0	3	f	2010-05-13	2733	\N	328763	\N
354829	GENERIC_DAY	0	4	f	2010-05-03	2732	\N	328763	\N
354830	GENERIC_DAY	0	4	f	2010-05-05	2733	\N	328763	\N
354831	GENERIC_DAY	0	4	f	2010-04-29	2733	\N	328763	\N
354832	GENERIC_DAY	0	0	f	2010-05-08	2733	\N	328763	\N
354833	GENERIC_DAY	0	0	f	2010-04-25	2733	\N	328763	\N
354834	GENERIC_DAY	0	4	f	2010-04-20	2732	\N	328763	\N
354835	GENERIC_DAY	0	0	f	2010-04-18	2732	\N	328763	\N
354836	GENERIC_DAY	0	4	f	2010-05-10	2733	\N	328763	\N
354837	GENERIC_DAY	0	0	f	2010-05-01	2732	\N	328763	\N
354838	GENERIC_DAY	0	4	f	2010-04-30	2733	\N	328763	\N
354839	GENERIC_DAY	0	0	f	2010-03-06	1631	\N	342363	\N
354840	GENERIC_DAY	0	0	f	2010-02-28	1629	\N	342363	\N
354841	GENERIC_DAY	0	4	f	2010-03-04	1629	\N	342363	\N
354842	GENERIC_DAY	0	4	f	2010-02-26	1631	\N	342363	\N
354843	GENERIC_DAY	0	4	f	2010-02-17	1629	\N	342363	\N
354844	GENERIC_DAY	0	0	f	2010-02-14	1631	\N	342363	\N
354845	GENERIC_DAY	0	4	f	2010-02-16	1631	\N	342363	\N
354846	GENERIC_DAY	0	0	f	2010-02-20	1629	\N	342363	\N
354847	GENERIC_DAY	0	4	f	2010-03-09	1629	\N	342363	\N
354848	GENERIC_DAY	0	4	f	2010-03-03	1629	\N	342363	\N
354849	GENERIC_DAY	0	4	f	2010-02-12	1631	\N	342363	\N
354850	GENERIC_DAY	0	4	f	2010-02-22	1631	\N	342363	\N
354851	GENERIC_DAY	0	3	f	2010-03-10	1631	\N	342363	\N
354852	GENERIC_DAY	0	4	f	2010-03-05	1629	\N	342363	\N
354853	GENERIC_DAY	0	4	f	2010-02-24	1631	\N	342363	\N
354854	GENERIC_DAY	0	4	f	2010-03-09	1631	\N	342363	\N
354855	GENERIC_DAY	0	4	f	2010-02-15	1629	\N	342363	\N
354856	GENERIC_DAY	0	4	f	2010-03-01	1629	\N	342363	\N
354857	GENERIC_DAY	0	4	f	2010-03-01	1631	\N	342363	\N
354858	GENERIC_DAY	0	4	f	2010-02-15	1631	\N	342363	\N
354859	GENERIC_DAY	0	0	f	2010-03-07	1629	\N	342363	\N
354860	GENERIC_DAY	0	0	f	2010-03-06	1629	\N	342363	\N
354861	GENERIC_DAY	0	4	f	2010-02-24	1629	\N	342363	\N
354862	GENERIC_DAY	0	4	f	2010-03-05	1631	\N	342363	\N
354863	GENERIC_DAY	0	4	f	2010-02-16	1629	\N	342363	\N
354864	GENERIC_DAY	0	3	f	2010-03-10	1629	\N	342363	\N
354865	GENERIC_DAY	0	0	f	2010-02-27	1629	\N	342363	\N
354866	GENERIC_DAY	0	4	f	2010-03-04	1631	\N	342363	\N
354867	GENERIC_DAY	0	0	f	2010-03-07	1631	\N	342363	\N
354868	GENERIC_DAY	0	4	f	2010-03-02	1629	\N	342363	\N
354869	GENERIC_DAY	0	4	f	2010-02-19	1629	\N	342363	\N
354870	GENERIC_DAY	0	4	f	2010-02-18	1629	\N	342363	\N
354871	GENERIC_DAY	0	0	f	2010-02-20	1631	\N	342363	\N
354872	GENERIC_DAY	0	0	f	2010-02-28	1631	\N	342363	\N
354873	GENERIC_DAY	0	0	f	2010-02-27	1631	\N	342363	\N
354874	GENERIC_DAY	0	4	f	2010-02-18	1631	\N	342363	\N
354875	GENERIC_DAY	0	4	f	2010-03-08	1629	\N	342363	\N
354876	GENERIC_DAY	0	4	f	2010-02-26	1629	\N	342363	\N
354877	GENERIC_DAY	0	4	f	2010-02-25	1629	\N	342363	\N
354878	GENERIC_DAY	0	4	f	2010-03-03	1631	\N	342363	\N
354879	GENERIC_DAY	0	4	f	2010-02-23	1631	\N	342363	\N
354880	GENERIC_DAY	0	0	f	2010-02-14	1629	\N	342363	\N
354881	GENERIC_DAY	0	4	f	2010-02-12	1629	\N	342363	\N
354882	GENERIC_DAY	0	0	f	2010-02-21	1631	\N	342363	\N
354883	GENERIC_DAY	0	0	f	2010-02-13	1629	\N	342363	\N
354884	GENERIC_DAY	0	4	f	2010-02-22	1629	\N	342363	\N
354885	GENERIC_DAY	0	4	f	2010-02-17	1631	\N	342363	\N
354886	GENERIC_DAY	0	4	f	2010-02-23	1629	\N	342363	\N
354887	GENERIC_DAY	0	4	f	2010-03-02	1631	\N	342363	\N
354888	GENERIC_DAY	0	4	f	2010-02-25	1631	\N	342363	\N
354889	GENERIC_DAY	0	0	f	2010-02-21	1629	\N	342363	\N
354890	GENERIC_DAY	0	0	f	2010-02-13	1631	\N	342363	\N
354891	GENERIC_DAY	0	4	f	2010-02-19	1631	\N	342363	\N
354892	GENERIC_DAY	0	4	f	2010-03-08	1631	\N	342363	\N
354893	GENERIC_DAY	0	0	f	2010-03-14	1629	\N	342364	\N
354894	GENERIC_DAY	0	2	f	2010-03-17	1629	\N	342364	\N
354895	GENERIC_DAY	0	2	f	2010-03-23	1631	\N	342364	\N
354896	GENERIC_DAY	0	2	f	2010-03-02	1631	\N	342364	\N
354897	GENERIC_DAY	0	0	f	2010-03-20	1631	\N	342364	\N
354898	GENERIC_DAY	0	0	f	2010-03-27	1631	\N	342364	\N
354899	GENERIC_DAY	0	2	f	2010-03-26	1631	\N	342364	\N
354900	GENERIC_DAY	0	0	f	2010-02-13	1631	\N	342364	\N
354901	GENERIC_DAY	0	0	f	2010-02-14	1631	\N	342364	\N
354902	GENERIC_DAY	0	0	f	2010-03-20	1629	\N	342364	\N
354903	GENERIC_DAY	0	0	f	2010-02-28	1631	\N	342364	\N
354904	GENERIC_DAY	0	2	f	2010-03-26	1629	\N	342364	\N
354905	GENERIC_DAY	0	2	f	2010-03-30	1631	\N	342364	\N
354906	GENERIC_DAY	0	2	f	2010-03-12	1629	\N	342364	\N
354907	GENERIC_DAY	0	2	f	2010-03-10	1631	\N	342364	\N
354908	GENERIC_DAY	0	2	f	2010-03-05	1631	\N	342364	\N
354909	GENERIC_DAY	0	2	f	2010-03-03	1629	\N	342364	\N
354910	GENERIC_DAY	0	2	f	2010-04-05	1629	\N	342364	\N
354911	GENERIC_DAY	0	2	f	2010-03-16	1631	\N	342364	\N
354912	GENERIC_DAY	0	2	f	2010-02-25	1629	\N	342364	\N
354913	GENERIC_DAY	0	2	f	2010-03-08	1629	\N	342364	\N
354914	GENERIC_DAY	0	2	f	2010-02-19	1629	\N	342364	\N
354915	GENERIC_DAY	0	2	f	2010-03-25	1631	\N	342364	\N
354916	GENERIC_DAY	0	0	f	2010-03-27	1629	\N	342364	\N
354917	GENERIC_DAY	0	2	f	2010-03-04	1629	\N	342364	\N
354918	GENERIC_DAY	0	2	f	2010-02-24	1629	\N	342364	\N
354919	GENERIC_DAY	0	2	f	2010-03-24	1629	\N	342364	\N
354920	GENERIC_DAY	0	0	f	2010-03-21	1629	\N	342364	\N
354921	GENERIC_DAY	0	0	f	2010-03-13	1629	\N	342364	\N
354922	GENERIC_DAY	0	2	f	2010-02-23	1629	\N	342364	\N
354923	GENERIC_DAY	0	0	f	2010-02-21	1629	\N	342364	\N
354924	GENERIC_DAY	0	2	f	2010-03-25	1629	\N	342364	\N
354925	GENERIC_DAY	0	2	f	2010-03-22	1631	\N	342364	\N
354926	GENERIC_DAY	0	2	f	2010-02-26	1631	\N	342364	\N
354927	GENERIC_DAY	0	2	f	2010-03-22	1629	\N	342364	\N
354928	GENERIC_DAY	0	0	f	2010-02-27	1631	\N	342364	\N
354929	GENERIC_DAY	0	2	f	2010-04-01	1629	\N	342364	\N
354930	GENERIC_DAY	0	2	f	2010-02-17	1629	\N	342364	\N
354931	GENERIC_DAY	0	0	f	2010-03-07	1631	\N	342364	\N
354932	GENERIC_DAY	0	2	f	2010-02-25	1631	\N	342364	\N
354933	GENERIC_DAY	0	2	f	2010-02-26	1629	\N	342364	\N
354934	GENERIC_DAY	0	0	f	2010-03-06	1631	\N	342364	\N
354935	GENERIC_DAY	0	2	f	2010-03-10	1629	\N	342364	\N
354936	GENERIC_DAY	0	2	f	2010-03-31	1629	\N	342364	\N
354937	GENERIC_DAY	0	2	f	2010-03-19	1629	\N	342364	\N
354938	GENERIC_DAY	0	0	f	2010-04-03	1629	\N	342364	\N
354939	GENERIC_DAY	0	2	f	2010-02-24	1631	\N	342364	\N
354940	GENERIC_DAY	0	0	f	2010-02-14	1629	\N	342364	\N
354941	GENERIC_DAY	0	2	f	2010-03-02	1629	\N	342364	\N
354942	GENERIC_DAY	0	2	f	2010-03-04	1631	\N	342364	\N
354943	GENERIC_DAY	0	2	f	2010-03-30	1629	\N	342364	\N
354944	GENERIC_DAY	0	2	f	2010-02-22	1631	\N	342364	\N
354945	GENERIC_DAY	0	0	f	2010-03-13	1631	\N	342364	\N
354946	GENERIC_DAY	0	2	f	2010-02-18	1629	\N	342364	\N
354947	GENERIC_DAY	0	2	f	2010-02-15	1629	\N	342364	\N
354948	GENERIC_DAY	0	2	f	2010-02-17	1631	\N	342364	\N
354949	GENERIC_DAY	0	1	f	2010-04-06	1631	\N	342364	\N
354950	GENERIC_DAY	0	2	f	2010-03-17	1631	\N	342364	\N
354951	GENERIC_DAY	0	0	f	2010-04-04	1631	\N	342364	\N
354952	GENERIC_DAY	0	2	f	2010-03-18	1629	\N	342364	\N
354953	GENERIC_DAY	0	2	f	2010-03-09	1631	\N	342364	\N
354954	GENERIC_DAY	0	2	f	2010-03-19	1631	\N	342364	\N
354955	GENERIC_DAY	0	0	f	2010-04-04	1629	\N	342364	\N
354956	GENERIC_DAY	0	0	f	2010-02-20	1631	\N	342364	\N
354957	GENERIC_DAY	0	0	f	2010-02-28	1629	\N	342364	\N
354958	GENERIC_DAY	0	0	f	2010-03-28	1629	\N	342364	\N
354959	GENERIC_DAY	0	2	f	2010-03-29	1629	\N	342364	\N
354960	GENERIC_DAY	0	0	f	2010-03-21	1631	\N	342364	\N
354961	GENERIC_DAY	0	2	f	2010-03-15	1629	\N	342364	\N
354962	GENERIC_DAY	0	2	f	2010-03-16	1629	\N	342364	\N
354963	GENERIC_DAY	0	2	f	2010-03-15	1631	\N	342364	\N
354964	GENERIC_DAY	0	0	f	2010-02-13	1629	\N	342364	\N
354965	GENERIC_DAY	0	2	f	2010-03-31	1631	\N	342364	\N
354966	GENERIC_DAY	0	0	f	2010-04-03	1631	\N	342364	\N
354967	GENERIC_DAY	0	2	f	2010-03-12	1631	\N	342364	\N
354968	GENERIC_DAY	0	2	f	2010-03-11	1629	\N	342364	\N
354969	GENERIC_DAY	0	0	f	2010-03-14	1631	\N	342364	\N
354970	GENERIC_DAY	0	2	f	2010-02-18	1631	\N	342364	\N
354971	GENERIC_DAY	0	0	f	2010-02-27	1629	\N	342364	\N
354972	GENERIC_DAY	0	2	f	2010-04-05	1631	\N	342364	\N
354973	GENERIC_DAY	0	2	f	2010-03-01	1631	\N	342364	\N
354974	GENERIC_DAY	0	2	f	2010-04-01	1631	\N	342364	\N
354975	GENERIC_DAY	0	2	f	2010-02-19	1631	\N	342364	\N
354976	GENERIC_DAY	0	2	f	2010-02-15	1631	\N	342364	\N
354977	GENERIC_DAY	0	2	f	2010-02-22	1629	\N	342364	\N
354978	GENERIC_DAY	0	2	f	2010-03-18	1631	\N	342364	\N
354979	GENERIC_DAY	0	0	f	2010-03-06	1629	\N	342364	\N
354980	GENERIC_DAY	0	2	f	2010-03-11	1631	\N	342364	\N
354981	GENERIC_DAY	0	2	f	2010-02-23	1631	\N	342364	\N
354982	GENERIC_DAY	0	2	f	2010-03-23	1629	\N	342364	\N
354983	GENERIC_DAY	0	0	f	2010-02-21	1631	\N	342364	\N
354984	GENERIC_DAY	0	2	f	2010-02-12	1629	\N	342364	\N
354985	GENERIC_DAY	0	2	f	2010-03-29	1631	\N	342364	\N
354986	GENERIC_DAY	0	2	f	2010-03-05	1629	\N	342364	\N
354987	GENERIC_DAY	0	0	f	2010-03-28	1631	\N	342364	\N
354988	GENERIC_DAY	0	2	f	2010-02-16	1631	\N	342364	\N
354989	GENERIC_DAY	0	1	f	2010-04-06	1629	\N	342364	\N
354990	GENERIC_DAY	0	2	f	2010-02-12	1631	\N	342364	\N
354991	GENERIC_DAY	0	0	f	2010-03-07	1629	\N	342364	\N
354992	GENERIC_DAY	0	2	f	2010-02-16	1629	\N	342364	\N
354993	GENERIC_DAY	0	2	f	2010-03-24	1631	\N	342364	\N
354994	GENERIC_DAY	0	2	f	2010-04-02	1629	\N	342364	\N
354995	GENERIC_DAY	0	2	f	2010-03-08	1631	\N	342364	\N
354996	GENERIC_DAY	0	0	f	2010-02-20	1629	\N	342364	\N
354997	GENERIC_DAY	0	2	f	2010-04-02	1631	\N	342364	\N
354998	GENERIC_DAY	0	2	f	2010-03-09	1629	\N	342364	\N
354999	GENERIC_DAY	0	2	f	2010-03-03	1631	\N	342364	\N
355000	GENERIC_DAY	0	2	f	2010-03-01	1629	\N	342364	\N
307325	GENERIC_DAY	2	0	f	2010-08-15	299993	\N	303182	\N
307326	GENERIC_DAY	2	4	f	2010-08-16	299993	\N	303182	\N
307327	GENERIC_DAY	2	4	f	2010-08-17	299991	\N	303182	\N
307328	GENERIC_DAY	2	4	f	2010-08-19	299991	\N	303182	\N
307329	GENERIC_DAY	2	4	f	2010-08-04	299993	\N	303182	\N
307330	GENERIC_DAY	2	4	f	2010-08-02	299993	\N	303182	\N
307331	GENERIC_DAY	2	4	f	2010-08-09	299993	\N	303182	\N
307332	GENERIC_DAY	2	4	f	2010-08-04	299991	\N	303182	\N
307333	GENERIC_DAY	2	0	f	2010-08-07	299993	\N	303182	\N
307334	GENERIC_DAY	2	0	f	2010-08-08	299991	\N	303182	\N
307335	GENERIC_DAY	2	4	f	2010-08-03	299991	\N	303182	\N
307336	GENERIC_DAY	2	4	f	2010-08-05	299991	\N	303182	\N
307337	GENERIC_DAY	2	4	f	2010-08-05	299993	\N	303182	\N
307338	GENERIC_DAY	2	4	f	2010-08-12	299991	\N	303182	\N
307339	GENERIC_DAY	2	4	f	2010-08-10	299993	\N	303182	\N
307340	GENERIC_DAY	2	0	f	2010-08-07	299991	\N	303182	\N
307341	GENERIC_DAY	2	4	f	2010-08-11	299993	\N	303182	\N
307342	GENERIC_DAY	2	4	f	2010-08-06	299991	\N	303182	\N
307343	GENERIC_DAY	2	4	f	2010-08-25	299991	\N	303182	\N
307344	GENERIC_DAY	2	4	f	2010-08-02	299991	\N	303182	\N
307345	GENERIC_DAY	2	4	f	2010-08-19	299993	\N	303182	\N
307346	GENERIC_DAY	2	4	f	2010-08-06	299993	\N	303182	\N
307347	GENERIC_DAY	2	0	f	2010-08-15	299991	\N	303182	\N
307348	GENERIC_DAY	2	4	f	2010-08-13	299993	\N	303182	\N
307349	GENERIC_DAY	2	0	f	2010-08-22	299993	\N	303182	\N
307350	GENERIC_DAY	2	4	f	2010-08-10	299991	\N	303182	\N
307351	GENERIC_DAY	2	0	f	2010-08-14	299993	\N	303182	\N
355001	GENERIC_DAY	0	2	f	2010-03-23	1629	\N	342365	\N
355002	GENERIC_DAY	0	2	f	2010-03-19	1629	\N	342365	\N
355003	GENERIC_DAY	0	0	f	2010-02-27	1629	\N	342365	\N
355004	GENERIC_DAY	0	2	f	2010-03-16	1629	\N	342365	\N
355005	GENERIC_DAY	0	2	f	2010-03-10	1631	\N	342365	\N
355006	GENERIC_DAY	0	2	f	2010-02-24	1631	\N	342365	\N
355007	GENERIC_DAY	0	0	f	2010-03-06	1631	\N	342365	\N
355008	GENERIC_DAY	0	2	f	2010-03-26	1631	\N	342365	\N
355009	GENERIC_DAY	0	2	f	2010-03-30	1631	\N	342365	\N
355010	GENERIC_DAY	0	2	f	2010-02-17	1629	\N	342365	\N
355011	GENERIC_DAY	0	2	f	2010-03-08	1629	\N	342365	\N
355012	GENERIC_DAY	0	2	f	2010-02-22	1629	\N	342365	\N
355013	GENERIC_DAY	0	2	f	2010-02-15	1629	\N	342365	\N
355014	GENERIC_DAY	0	2	f	2010-02-24	1629	\N	342365	\N
355015	GENERIC_DAY	0	2	f	2010-03-09	1629	\N	342365	\N
355016	GENERIC_DAY	0	0	f	2010-03-06	1629	\N	342365	\N
355017	GENERIC_DAY	0	2	f	2010-03-26	1629	\N	342365	\N
355018	GENERIC_DAY	0	2	f	2010-03-25	1629	\N	342365	\N
355019	GENERIC_DAY	0	2	f	2010-03-11	1629	\N	342365	\N
355020	GENERIC_DAY	0	0	f	2010-04-04	1629	\N	342365	\N
355021	GENERIC_DAY	0	2	f	2010-02-23	1631	\N	342365	\N
355022	GENERIC_DAY	0	2	f	2010-02-25	1631	\N	342365	\N
355023	GENERIC_DAY	0	2	f	2010-03-29	1631	\N	342365	\N
355024	GENERIC_DAY	0	2	f	2010-02-22	1631	\N	342365	\N
355025	GENERIC_DAY	0	2	f	2010-03-09	1631	\N	342365	\N
355026	GENERIC_DAY	0	2	f	2010-04-01	1629	\N	342365	\N
355027	GENERIC_DAY	0	2	f	2010-03-11	1631	\N	342365	\N
355028	GENERIC_DAY	0	0	f	2010-02-14	1629	\N	342365	\N
355029	GENERIC_DAY	0	2	f	2010-02-19	1631	\N	342365	\N
355030	GENERIC_DAY	0	0	f	2010-03-14	1631	\N	342365	\N
355031	GENERIC_DAY	0	2	f	2010-03-17	1631	\N	342365	\N
355032	GENERIC_DAY	0	0	f	2010-03-13	1629	\N	342365	\N
355033	GENERIC_DAY	0	2	f	2010-03-01	1631	\N	342365	\N
355034	GENERIC_DAY	0	0	f	2010-02-20	1629	\N	342365	\N
355035	GENERIC_DAY	0	0	f	2010-03-28	1629	\N	342365	\N
355036	GENERIC_DAY	0	0	f	2010-03-21	1631	\N	342365	\N
355037	GENERIC_DAY	0	2	f	2010-03-18	1629	\N	342365	\N
355038	GENERIC_DAY	0	2	f	2010-03-30	1629	\N	342365	\N
355039	GENERIC_DAY	0	0	f	2010-02-14	1631	\N	342365	\N
355040	GENERIC_DAY	0	2	f	2010-03-15	1629	\N	342365	\N
355041	GENERIC_DAY	0	2	f	2010-02-18	1631	\N	342365	\N
355042	GENERIC_DAY	0	2	f	2010-03-19	1631	\N	342365	\N
355043	GENERIC_DAY	0	2	f	2010-03-01	1629	\N	342365	\N
355044	GENERIC_DAY	0	2	f	2010-02-26	1629	\N	342365	\N
355045	GENERIC_DAY	0	2	f	2010-02-16	1631	\N	342365	\N
355046	GENERIC_DAY	0	2	f	2010-03-05	1631	\N	342365	\N
355047	GENERIC_DAY	0	2	f	2010-02-25	1629	\N	342365	\N
355048	GENERIC_DAY	0	0	f	2010-02-21	1631	\N	342365	\N
355049	GENERIC_DAY	0	0	f	2010-04-04	1631	\N	342365	\N
355050	GENERIC_DAY	0	0	f	2010-03-28	1631	\N	342365	\N
355051	GENERIC_DAY	0	0	f	2010-03-13	1631	\N	342365	\N
355052	GENERIC_DAY	0	2	f	2010-04-02	1631	\N	342365	\N
355053	GENERIC_DAY	0	0	f	2010-04-03	1631	\N	342365	\N
355054	GENERIC_DAY	0	2	f	2010-03-29	1629	\N	342365	\N
355055	GENERIC_DAY	0	2	f	2010-03-12	1631	\N	342365	\N
355056	GENERIC_DAY	0	0	f	2010-03-27	1631	\N	342365	\N
355057	GENERIC_DAY	0	2	f	2010-03-24	1631	\N	342365	\N
355058	GENERIC_DAY	0	2	f	2010-03-08	1631	\N	342365	\N
355059	GENERIC_DAY	0	2	f	2010-03-22	1629	\N	342365	\N
355060	GENERIC_DAY	0	2	f	2010-02-16	1629	\N	342365	\N
355061	GENERIC_DAY	0	0	f	2010-03-07	1631	\N	342365	\N
355062	GENERIC_DAY	0	2	f	2010-03-25	1631	\N	342365	\N
355063	GENERIC_DAY	0	2	f	2010-02-19	1629	\N	342365	\N
355064	GENERIC_DAY	0	2	f	2010-04-02	1629	\N	342365	\N
355065	GENERIC_DAY	0	2	f	2010-03-16	1631	\N	342365	\N
355066	GENERIC_DAY	0	2	f	2010-03-31	1631	\N	342365	\N
355067	GENERIC_DAY	0	2	f	2010-03-15	1631	\N	342365	\N
355068	GENERIC_DAY	0	2	f	2010-04-01	1631	\N	342365	\N
355069	GENERIC_DAY	0	2	f	2010-03-04	1629	\N	342365	\N
355070	GENERIC_DAY	0	0	f	2010-03-27	1629	\N	342365	\N
355071	GENERIC_DAY	0	0	f	2010-04-03	1629	\N	342365	\N
355072	GENERIC_DAY	0	2	f	2010-03-03	1631	\N	342365	\N
355073	GENERIC_DAY	0	2	f	2010-03-04	1631	\N	342365	\N
355074	GENERIC_DAY	0	2	f	2010-02-23	1629	\N	342365	\N
355075	GENERIC_DAY	0	0	f	2010-03-07	1629	\N	342365	\N
355076	GENERIC_DAY	0	0	f	2010-02-13	1629	\N	342365	\N
355077	GENERIC_DAY	0	2	f	2010-03-02	1629	\N	342365	\N
355078	GENERIC_DAY	0	2	f	2010-03-24	1629	\N	342365	\N
355079	GENERIC_DAY	0	2	f	2010-04-05	1629	\N	342365	\N
355080	GENERIC_DAY	0	1	f	2010-04-06	1629	\N	342365	\N
355081	GENERIC_DAY	0	2	f	2010-02-15	1631	\N	342365	\N
355082	GENERIC_DAY	0	0	f	2010-02-28	1629	\N	342365	\N
355083	GENERIC_DAY	0	1	f	2010-04-06	1631	\N	342365	\N
355084	GENERIC_DAY	0	0	f	2010-02-20	1631	\N	342365	\N
355085	GENERIC_DAY	0	0	f	2010-02-13	1631	\N	342365	\N
355086	GENERIC_DAY	0	0	f	2010-03-21	1629	\N	342365	\N
355087	GENERIC_DAY	0	2	f	2010-02-17	1631	\N	342365	\N
355088	GENERIC_DAY	0	2	f	2010-02-12	1631	\N	342365	\N
355089	GENERIC_DAY	0	2	f	2010-03-02	1631	\N	342365	\N
355090	GENERIC_DAY	0	2	f	2010-02-12	1629	\N	342365	\N
355091	GENERIC_DAY	0	0	f	2010-03-20	1629	\N	342365	\N
355092	GENERIC_DAY	0	0	f	2010-03-20	1631	\N	342365	\N
355093	GENERIC_DAY	0	2	f	2010-03-17	1629	\N	342365	\N
355094	GENERIC_DAY	0	2	f	2010-02-18	1629	\N	342365	\N
355095	GENERIC_DAY	0	2	f	2010-03-18	1631	\N	342365	\N
355096	GENERIC_DAY	0	2	f	2010-03-03	1629	\N	342365	\N
355097	GENERIC_DAY	0	2	f	2010-03-05	1629	\N	342365	\N
355098	GENERIC_DAY	0	0	f	2010-02-28	1631	\N	342365	\N
355099	GENERIC_DAY	0	2	f	2010-03-12	1629	\N	342365	\N
355100	GENERIC_DAY	0	2	f	2010-03-23	1631	\N	342365	\N
355101	GENERIC_DAY	0	2	f	2010-03-10	1629	\N	342365	\N
355102	GENERIC_DAY	0	0	f	2010-02-21	1629	\N	342365	\N
355103	GENERIC_DAY	0	2	f	2010-02-26	1631	\N	342365	\N
355104	GENERIC_DAY	0	2	f	2010-03-22	1631	\N	342365	\N
355105	GENERIC_DAY	0	0	f	2010-03-14	1629	\N	342365	\N
355106	GENERIC_DAY	0	2	f	2010-03-31	1629	\N	342365	\N
355107	GENERIC_DAY	0	0	f	2010-02-27	1631	\N	342365	\N
355108	GENERIC_DAY	0	2	f	2010-04-05	1631	\N	342365	\N
355109	GENERIC_DAY	0	0	f	2010-04-18	1631	\N	342366	\N
355110	GENERIC_DAY	0	0	f	2010-04-11	1631	\N	342366	\N
355111	GENERIC_DAY	0	4	f	2010-04-15	1631	\N	342366	\N
355112	GENERIC_DAY	0	4	f	2010-04-21	1631	\N	342366	\N
355113	GENERIC_DAY	0	4	f	2010-04-16	1629	\N	342366	\N
355114	GENERIC_DAY	0	4	f	2010-04-27	1631	\N	342366	\N
355115	GENERIC_DAY	0	0	f	2010-04-10	1631	\N	342366	\N
355116	GENERIC_DAY	0	4	f	2010-04-22	1631	\N	342366	\N
355117	GENERIC_DAY	0	4	f	2010-04-14	1631	\N	342366	\N
355118	GENERIC_DAY	0	4	f	2010-04-19	1631	\N	342366	\N
355119	GENERIC_DAY	0	4	f	2010-04-19	1629	\N	342366	\N
355120	GENERIC_DAY	0	4	f	2010-04-22	1629	\N	342366	\N
355121	GENERIC_DAY	0	4	f	2010-04-20	1629	\N	342366	\N
355122	GENERIC_DAY	0	4	f	2010-04-12	1631	\N	342366	\N
355123	GENERIC_DAY	0	4	f	2010-04-30	1631	\N	342366	\N
355124	GENERIC_DAY	0	4	f	2010-04-07	1629	\N	342366	\N
355125	GENERIC_DAY	0	4	f	2010-04-23	1629	\N	342366	\N
355126	GENERIC_DAY	0	4	f	2010-04-26	1629	\N	342366	\N
355127	GENERIC_DAY	0	4	f	2010-04-08	1629	\N	342366	\N
355128	GENERIC_DAY	0	0	f	2010-04-10	1629	\N	342366	\N
355129	GENERIC_DAY	0	4	f	2010-04-29	1629	\N	342366	\N
355130	GENERIC_DAY	0	0	f	2010-05-01	1631	\N	342366	\N
355131	GENERIC_DAY	0	0	f	2010-04-24	1629	\N	342366	\N
355132	GENERIC_DAY	0	3	f	2010-05-03	1629	\N	342366	\N
355133	GENERIC_DAY	0	4	f	2010-04-27	1629	\N	342366	\N
355134	GENERIC_DAY	0	4	f	2010-04-21	1629	\N	342366	\N
355135	GENERIC_DAY	0	0	f	2010-04-11	1629	\N	342366	\N
355136	GENERIC_DAY	0	0	f	2010-04-25	1629	\N	342366	\N
355137	GENERIC_DAY	0	4	f	2010-04-12	1629	\N	342366	\N
355138	GENERIC_DAY	0	4	f	2010-04-29	1631	\N	342366	\N
355139	GENERIC_DAY	0	4	f	2010-04-09	1631	\N	342366	\N
355140	GENERIC_DAY	0	4	f	2010-04-30	1629	\N	342366	\N
355141	GENERIC_DAY	0	0	f	2010-04-24	1631	\N	342366	\N
355142	GENERIC_DAY	0	4	f	2010-04-13	1629	\N	342366	\N
355143	GENERIC_DAY	0	0	f	2010-04-18	1629	\N	342366	\N
355144	GENERIC_DAY	0	4	f	2010-04-28	1629	\N	342366	\N
355145	GENERIC_DAY	0	4	f	2010-04-08	1631	\N	342366	\N
355146	GENERIC_DAY	0	0	f	2010-05-02	1629	\N	342366	\N
355147	GENERIC_DAY	0	4	f	2010-04-20	1631	\N	342366	\N
355148	GENERIC_DAY	0	0	f	2010-04-25	1631	\N	342366	\N
355149	GENERIC_DAY	0	4	f	2010-04-26	1631	\N	342366	\N
355150	GENERIC_DAY	0	0	f	2010-05-01	1629	\N	342366	\N
355151	GENERIC_DAY	0	4	f	2010-04-13	1631	\N	342366	\N
355152	GENERIC_DAY	0	4	f	2010-04-15	1629	\N	342366	\N
355153	GENERIC_DAY	0	4	f	2010-04-09	1629	\N	342366	\N
355154	GENERIC_DAY	0	4	f	2010-04-07	1631	\N	342366	\N
355155	GENERIC_DAY	0	4	f	2010-04-28	1631	\N	342366	\N
355156	GENERIC_DAY	0	0	f	2010-04-17	1631	\N	342366	\N
355157	GENERIC_DAY	0	4	f	2010-04-23	1631	\N	342366	\N
355158	GENERIC_DAY	0	4	f	2010-04-16	1631	\N	342366	\N
355159	GENERIC_DAY	0	0	f	2010-04-17	1629	\N	342366	\N
355160	GENERIC_DAY	0	0	f	2010-05-02	1631	\N	342366	\N
355161	GENERIC_DAY	0	4	f	2010-04-14	1629	\N	342366	\N
355162	GENERIC_DAY	0	3	f	2010-05-03	1631	\N	342366	\N
355163	GENERIC_DAY	0	4	f	2010-04-29	1631	\N	342367	\N
355164	GENERIC_DAY	0	4	f	2010-04-07	1629	\N	342367	\N
355165	GENERIC_DAY	0	4	f	2010-04-26	1629	\N	342367	\N
355166	GENERIC_DAY	0	4	f	2010-04-22	1631	\N	342367	\N
355167	GENERIC_DAY	0	0	f	2010-04-18	1631	\N	342367	\N
355168	GENERIC_DAY	0	0	f	2010-04-17	1631	\N	342367	\N
355169	GENERIC_DAY	0	4	f	2010-04-28	1629	\N	342367	\N
355170	GENERIC_DAY	0	4	f	2010-04-27	1631	\N	342367	\N
355171	GENERIC_DAY	0	4	f	2010-04-30	1629	\N	342367	\N
355172	GENERIC_DAY	0	0	f	2010-04-10	1629	\N	342367	\N
355173	GENERIC_DAY	0	4	f	2010-04-08	1629	\N	342367	\N
355174	GENERIC_DAY	0	4	f	2010-04-28	1631	\N	342367	\N
355175	GENERIC_DAY	0	0	f	2010-04-11	1631	\N	342367	\N
355176	GENERIC_DAY	0	0	f	2010-04-18	1629	\N	342367	\N
355177	GENERIC_DAY	0	4	f	2010-04-12	1631	\N	342367	\N
355178	GENERIC_DAY	0	4	f	2010-04-27	1629	\N	342367	\N
355179	GENERIC_DAY	0	0	f	2010-04-24	1629	\N	342367	\N
355180	GENERIC_DAY	0	4	f	2010-04-12	1629	\N	342367	\N
355181	GENERIC_DAY	0	0	f	2010-05-01	1631	\N	342367	\N
355182	GENERIC_DAY	0	0	f	2010-04-10	1631	\N	342367	\N
355183	GENERIC_DAY	0	4	f	2010-04-16	1629	\N	342367	\N
355184	GENERIC_DAY	0	4	f	2010-04-26	1631	\N	342367	\N
355185	GENERIC_DAY	0	4	f	2010-04-13	1631	\N	342367	\N
355186	GENERIC_DAY	0	4	f	2010-04-14	1629	\N	342367	\N
355187	GENERIC_DAY	0	0	f	2010-04-24	1631	\N	342367	\N
355188	GENERIC_DAY	0	4	f	2010-04-20	1631	\N	342367	\N
355189	GENERIC_DAY	0	4	f	2010-04-22	1629	\N	342367	\N
355190	GENERIC_DAY	0	4	f	2010-04-07	1631	\N	342367	\N
355191	GENERIC_DAY	0	4	f	2010-04-23	1629	\N	342367	\N
355192	GENERIC_DAY	0	4	f	2010-04-20	1629	\N	342367	\N
355193	GENERIC_DAY	0	4	f	2010-04-30	1631	\N	342367	\N
355194	GENERIC_DAY	0	0	f	2010-04-25	1631	\N	342367	\N
355195	GENERIC_DAY	0	4	f	2010-04-19	1629	\N	342367	\N
355196	GENERIC_DAY	0	0	f	2010-04-25	1629	\N	342367	\N
355197	GENERIC_DAY	0	4	f	2010-04-13	1629	\N	342367	\N
355198	GENERIC_DAY	0	0	f	2010-05-02	1629	\N	342367	\N
355199	GENERIC_DAY	0	4	f	2010-04-15	1629	\N	342367	\N
355200	GENERIC_DAY	0	0	f	2010-04-17	1629	\N	342367	\N
355201	GENERIC_DAY	0	0	f	2010-04-11	1629	\N	342367	\N
355202	GENERIC_DAY	0	4	f	2010-04-09	1631	\N	342367	\N
355203	GENERIC_DAY	0	4	f	2010-04-09	1629	\N	342367	\N
355204	GENERIC_DAY	0	4	f	2010-04-21	1629	\N	342367	\N
355205	GENERIC_DAY	0	4	f	2010-04-15	1631	\N	342367	\N
355206	GENERIC_DAY	0	4	f	2010-04-16	1631	\N	342367	\N
355207	GENERIC_DAY	0	0	f	2010-05-02	1631	\N	342367	\N
355208	GENERIC_DAY	0	3	f	2010-05-03	1629	\N	342367	\N
355209	GENERIC_DAY	0	4	f	2010-04-19	1631	\N	342367	\N
355210	GENERIC_DAY	0	4	f	2010-04-21	1631	\N	342367	\N
355211	GENERIC_DAY	0	4	f	2010-04-29	1629	\N	342367	\N
355212	GENERIC_DAY	0	3	f	2010-05-03	1631	\N	342367	\N
355213	GENERIC_DAY	0	4	f	2010-04-23	1631	\N	342367	\N
355214	GENERIC_DAY	0	4	f	2010-04-08	1631	\N	342367	\N
355215	GENERIC_DAY	0	0	f	2010-05-01	1629	\N	342367	\N
355216	GENERIC_DAY	0	4	f	2010-04-14	1631	\N	342367	\N
355217	GENERIC_DAY	0	0	f	2010-05-08	1629	\N	342368	\N
355218	GENERIC_DAY	0	4	f	2010-05-21	1631	\N	342368	\N
355219	GENERIC_DAY	0	4	f	2010-05-07	1629	\N	342368	\N
355220	GENERIC_DAY	0	4	f	2010-05-11	1629	\N	342368	\N
355221	GENERIC_DAY	0	4	f	2010-05-25	1631	\N	342368	\N
355222	GENERIC_DAY	0	4	f	2010-05-17	1631	\N	342368	\N
355223	GENERIC_DAY	0	0	f	2010-05-16	1629	\N	342368	\N
355224	GENERIC_DAY	0	4	f	2010-05-07	1631	\N	342368	\N
355225	GENERIC_DAY	0	0	f	2010-05-22	1631	\N	342368	\N
355226	GENERIC_DAY	0	4	f	2010-05-19	1629	\N	342368	\N
355227	GENERIC_DAY	0	0	f	2010-05-08	1631	\N	342368	\N
355228	GENERIC_DAY	0	4	f	2010-05-06	1631	\N	342368	\N
355229	GENERIC_DAY	0	4	f	2010-05-10	1631	\N	342368	\N
355230	GENERIC_DAY	0	4	f	2010-05-27	1631	\N	342368	\N
355231	GENERIC_DAY	0	0	f	2010-05-16	1631	\N	342368	\N
355232	GENERIC_DAY	0	4	f	2010-05-20	1631	\N	342368	\N
355233	GENERIC_DAY	0	0	f	2010-05-23	1631	\N	342368	\N
355234	GENERIC_DAY	0	4	f	2010-05-06	1629	\N	342368	\N
355235	GENERIC_DAY	0	4	f	2010-05-04	1629	\N	342368	\N
355236	GENERIC_DAY	0	4	f	2010-05-12	1631	\N	342368	\N
355237	GENERIC_DAY	0	4	f	2010-05-18	1631	\N	342368	\N
355238	GENERIC_DAY	0	4	f	2010-05-14	1629	\N	342368	\N
355239	GENERIC_DAY	0	4	f	2010-05-05	1631	\N	342368	\N
355240	GENERIC_DAY	0	0	f	2010-05-15	1629	\N	342368	\N
355241	GENERIC_DAY	0	0	f	2010-05-15	1631	\N	342368	\N
355242	GENERIC_DAY	0	4	f	2010-05-13	1629	\N	342368	\N
355243	GENERIC_DAY	0	4	f	2010-05-10	1629	\N	342368	\N
355244	GENERIC_DAY	0	4	f	2010-05-24	1631	\N	342368	\N
355245	GENERIC_DAY	0	4	f	2010-05-13	1631	\N	342368	\N
355246	GENERIC_DAY	0	0	f	2010-05-09	1631	\N	342368	\N
355247	GENERIC_DAY	0	0	f	2010-05-22	1629	\N	342368	\N
355248	GENERIC_DAY	0	4	f	2010-05-11	1631	\N	342368	\N
355249	GENERIC_DAY	0	4	f	2010-05-17	1629	\N	342368	\N
355250	GENERIC_DAY	0	4	f	2010-05-04	1631	\N	342368	\N
355251	GENERIC_DAY	0	4	f	2010-05-21	1629	\N	342368	\N
355252	GENERIC_DAY	0	3	f	2010-05-28	1631	\N	342368	\N
355253	GENERIC_DAY	0	4	f	2010-05-12	1629	\N	342368	\N
355254	GENERIC_DAY	0	4	f	2010-05-24	1629	\N	342368	\N
355255	GENERIC_DAY	0	4	f	2010-05-26	1631	\N	342368	\N
355256	GENERIC_DAY	0	4	f	2010-05-05	1629	\N	342368	\N
355257	GENERIC_DAY	0	3	f	2010-05-28	1629	\N	342368	\N
355258	GENERIC_DAY	0	4	f	2010-05-27	1629	\N	342368	\N
355259	GENERIC_DAY	0	0	f	2010-05-23	1629	\N	342368	\N
355260	GENERIC_DAY	0	4	f	2010-05-19	1631	\N	342368	\N
355261	GENERIC_DAY	0	4	f	2010-05-26	1629	\N	342368	\N
355262	GENERIC_DAY	0	4	f	2010-05-25	1629	\N	342368	\N
355263	GENERIC_DAY	0	4	f	2010-05-20	1629	\N	342368	\N
355264	GENERIC_DAY	0	4	f	2010-05-18	1629	\N	342368	\N
355265	GENERIC_DAY	0	4	f	2010-05-14	1631	\N	342368	\N
355266	GENERIC_DAY	0	0	f	2010-05-09	1629	\N	342368	\N
355267	GENERIC_DAY	0	4	f	2010-05-14	1631	\N	342369	\N
355268	GENERIC_DAY	0	4	f	2010-05-04	1629	\N	342369	\N
355269	GENERIC_DAY	0	4	f	2010-05-27	1631	\N	342369	\N
355270	GENERIC_DAY	0	4	f	2010-05-04	1631	\N	342369	\N
355271	GENERIC_DAY	0	4	f	2010-05-20	1629	\N	342369	\N
355272	GENERIC_DAY	0	4	f	2010-05-12	1629	\N	342369	\N
355273	GENERIC_DAY	0	4	f	2010-05-10	1629	\N	342369	\N
355274	GENERIC_DAY	0	4	f	2010-05-13	1629	\N	342369	\N
355275	GENERIC_DAY	0	0	f	2010-05-22	1629	\N	342369	\N
355276	GENERIC_DAY	0	4	f	2010-05-25	1629	\N	342369	\N
355277	GENERIC_DAY	0	0	f	2010-05-22	1631	\N	342369	\N
355278	GENERIC_DAY	0	0	f	2010-05-16	1629	\N	342369	\N
355279	GENERIC_DAY	0	0	f	2010-05-08	1629	\N	342369	\N
355280	GENERIC_DAY	0	4	f	2010-05-05	1629	\N	342369	\N
355281	GENERIC_DAY	0	4	f	2010-05-07	1629	\N	342369	\N
355282	GENERIC_DAY	0	4	f	2010-05-25	1631	\N	342369	\N
355283	GENERIC_DAY	0	0	f	2010-05-23	1629	\N	342369	\N
355284	GENERIC_DAY	0	0	f	2010-05-16	1631	\N	342369	\N
355285	GENERIC_DAY	0	0	f	2010-05-15	1631	\N	342369	\N
355286	GENERIC_DAY	0	4	f	2010-05-17	1629	\N	342369	\N
355287	GENERIC_DAY	0	4	f	2010-05-11	1631	\N	342369	\N
355288	GENERIC_DAY	0	3	f	2010-05-28	1631	\N	342369	\N
355289	GENERIC_DAY	0	4	f	2010-05-13	1631	\N	342369	\N
355290	GENERIC_DAY	0	4	f	2010-05-10	1631	\N	342369	\N
355291	GENERIC_DAY	0	4	f	2010-05-19	1631	\N	342369	\N
355292	GENERIC_DAY	0	4	f	2010-05-05	1631	\N	342369	\N
355293	GENERIC_DAY	0	0	f	2010-05-08	1631	\N	342369	\N
355294	GENERIC_DAY	0	4	f	2010-05-14	1629	\N	342369	\N
355295	GENERIC_DAY	0	4	f	2010-05-24	1629	\N	342369	\N
355296	GENERIC_DAY	0	0	f	2010-05-09	1629	\N	342369	\N
355297	GENERIC_DAY	0	4	f	2010-05-06	1631	\N	342369	\N
355298	GENERIC_DAY	0	4	f	2010-05-19	1629	\N	342369	\N
355299	GENERIC_DAY	0	4	f	2010-05-24	1631	\N	342369	\N
355300	GENERIC_DAY	0	4	f	2010-05-21	1629	\N	342369	\N
355301	GENERIC_DAY	0	4	f	2010-05-18	1629	\N	342369	\N
355302	GENERIC_DAY	0	4	f	2010-05-27	1629	\N	342369	\N
355303	GENERIC_DAY	0	4	f	2010-05-07	1631	\N	342369	\N
355304	GENERIC_DAY	0	4	f	2010-05-17	1631	\N	342369	\N
355305	GENERIC_DAY	0	4	f	2010-05-20	1631	\N	342369	\N
355306	GENERIC_DAY	0	0	f	2010-05-23	1631	\N	342369	\N
355307	GENERIC_DAY	0	4	f	2010-05-21	1631	\N	342369	\N
355308	GENERIC_DAY	0	0	f	2010-05-15	1629	\N	342369	\N
355309	GENERIC_DAY	0	3	f	2010-05-28	1629	\N	342369	\N
355310	GENERIC_DAY	0	4	f	2010-05-26	1629	\N	342369	\N
355311	GENERIC_DAY	0	0	f	2010-05-09	1631	\N	342369	\N
355312	GENERIC_DAY	0	4	f	2010-05-12	1631	\N	342369	\N
355313	GENERIC_DAY	0	4	f	2010-05-11	1629	\N	342369	\N
355314	GENERIC_DAY	0	4	f	2010-05-26	1631	\N	342369	\N
355315	GENERIC_DAY	0	4	f	2010-05-18	1631	\N	342369	\N
355316	GENERIC_DAY	0	4	f	2010-05-06	1629	\N	342369	\N
355434	GENERIC_DAY	0	4	f	2010-04-06	2727	\N	334946	\N
355435	GENERIC_DAY	0	0	f	2010-04-17	2727	\N	334946	\N
355436	GENERIC_DAY	0	4	f	2010-04-16	2727	\N	334946	\N
355437	GENERIC_DAY	0	0	f	2010-04-18	2729	\N	334946	\N
355438	GENERIC_DAY	0	4	f	2010-04-09	2727	\N	334946	\N
355439	GENERIC_DAY	0	4	f	2010-03-31	2727	\N	334946	\N
355440	GENERIC_DAY	0	4	f	2010-04-01	2729	\N	334946	\N
355441	GENERIC_DAY	0	4	f	2010-03-30	2727	\N	334946	\N
355442	GENERIC_DAY	0	4	f	2010-04-06	2729	\N	334946	\N
355443	GENERIC_DAY	0	4	f	2010-04-12	2727	\N	334946	\N
355444	GENERIC_DAY	0	4	f	2010-04-20	2729	\N	334946	\N
355445	GENERIC_DAY	0	0	f	2010-04-03	2727	\N	334946	\N
355446	GENERIC_DAY	0	4	f	2010-04-19	2729	\N	334946	\N
355447	GENERIC_DAY	0	4	f	2010-04-13	2727	\N	334946	\N
355448	GENERIC_DAY	0	4	f	2010-04-08	2729	\N	334946	\N
355449	GENERIC_DAY	0	4	f	2010-04-14	2727	\N	334946	\N
355450	GENERIC_DAY	0	0	f	2010-04-18	2727	\N	334946	\N
355451	GENERIC_DAY	0	0	f	2010-03-28	2727	\N	334946	\N
355452	GENERIC_DAY	0	0	f	2010-04-04	2729	\N	334946	\N
355453	GENERIC_DAY	0	4	f	2010-03-29	2729	\N	334946	\N
355454	GENERIC_DAY	0	4	f	2010-04-02	2727	\N	334946	\N
355455	GENERIC_DAY	0	4	f	2010-03-31	2729	\N	334946	\N
355456	GENERIC_DAY	0	4	f	2010-04-07	2729	\N	334946	\N
355457	GENERIC_DAY	0	4	f	2010-04-05	2727	\N	334946	\N
355458	GENERIC_DAY	0	4	f	2010-04-15	2727	\N	334946	\N
355459	GENERIC_DAY	0	4	f	2010-04-13	2729	\N	334946	\N
355460	GENERIC_DAY	0	4	f	2010-03-30	2729	\N	334946	\N
355461	GENERIC_DAY	0	3	f	2010-04-21	2727	\N	334946	\N
355462	GENERIC_DAY	0	4	f	2010-04-07	2727	\N	334946	\N
355463	GENERIC_DAY	0	0	f	2010-04-10	2727	\N	334946	\N
355464	GENERIC_DAY	0	4	f	2010-04-08	2727	\N	334946	\N
355465	GENERIC_DAY	0	0	f	2010-04-17	2729	\N	334946	\N
355466	GENERIC_DAY	0	4	f	2010-03-26	2729	\N	334946	\N
355467	GENERIC_DAY	0	4	f	2010-04-15	2729	\N	334946	\N
355468	GENERIC_DAY	0	4	f	2010-03-29	2727	\N	334946	\N
355469	GENERIC_DAY	0	0	f	2010-04-10	2729	\N	334946	\N
355470	GENERIC_DAY	0	0	f	2010-04-11	2729	\N	334946	\N
355471	GENERIC_DAY	0	4	f	2010-04-05	2729	\N	334946	\N
355472	GENERIC_DAY	0	0	f	2010-03-27	2727	\N	334946	\N
355473	GENERIC_DAY	0	4	f	2010-04-16	2729	\N	334946	\N
355474	GENERIC_DAY	0	4	f	2010-04-02	2729	\N	334946	\N
355475	GENERIC_DAY	0	4	f	2010-04-14	2729	\N	334946	\N
355476	GENERIC_DAY	0	4	f	2010-04-19	2727	\N	334946	\N
355477	GENERIC_DAY	0	4	f	2010-04-12	2729	\N	334946	\N
355478	GENERIC_DAY	0	0	f	2010-04-03	2729	\N	334946	\N
355479	GENERIC_DAY	0	0	f	2010-04-04	2727	\N	334946	\N
355480	GENERIC_DAY	0	4	f	2010-04-01	2727	\N	334946	\N
355481	GENERIC_DAY	0	3	f	2010-04-21	2729	\N	334946	\N
355482	GENERIC_DAY	0	4	f	2010-04-09	2729	\N	334946	\N
355483	GENERIC_DAY	0	4	f	2010-03-26	2727	\N	334946	\N
355484	GENERIC_DAY	0	4	f	2010-04-20	2727	\N	334946	\N
355485	GENERIC_DAY	0	0	f	2010-03-28	2729	\N	334946	\N
355486	GENERIC_DAY	0	0	f	2010-03-27	2729	\N	334946	\N
355487	GENERIC_DAY	0	0	f	2010-04-11	2727	\N	334946	\N
355488	GENERIC_DAY	0	0	f	2010-04-17	2729	\N	334947	\N
355489	GENERIC_DAY	0	0	f	2010-04-17	2727	\N	334947	\N
355490	GENERIC_DAY	0	4	f	2010-04-01	2729	\N	334947	\N
355491	GENERIC_DAY	0	4	f	2010-04-05	2729	\N	334947	\N
355492	GENERIC_DAY	0	4	f	2010-04-16	2727	\N	334947	\N
355493	GENERIC_DAY	0	4	f	2010-04-08	2727	\N	334947	\N
355494	GENERIC_DAY	0	0	f	2010-04-10	2729	\N	334947	\N
355495	GENERIC_DAY	0	4	f	2010-03-31	2729	\N	334947	\N
355496	GENERIC_DAY	0	4	f	2010-04-14	2729	\N	334947	\N
355497	GENERIC_DAY	0	4	f	2010-04-06	2729	\N	334947	\N
355498	GENERIC_DAY	0	4	f	2010-03-30	2727	\N	334947	\N
355499	GENERIC_DAY	0	0	f	2010-04-11	2729	\N	334947	\N
355500	GENERIC_DAY	0	4	f	2010-04-20	2729	\N	334947	\N
355501	GENERIC_DAY	0	4	f	2010-04-07	2729	\N	334947	\N
355502	GENERIC_DAY	0	0	f	2010-04-04	2727	\N	334947	\N
355503	GENERIC_DAY	0	4	f	2010-04-02	2729	\N	334947	\N
355504	GENERIC_DAY	0	3	f	2010-04-21	2727	\N	334947	\N
355505	GENERIC_DAY	0	0	f	2010-03-28	2729	\N	334947	\N
355506	GENERIC_DAY	0	4	f	2010-04-06	2727	\N	334947	\N
355507	GENERIC_DAY	0	0	f	2010-04-11	2727	\N	334947	\N
355508	GENERIC_DAY	0	4	f	2010-04-08	2729	\N	334947	\N
355509	GENERIC_DAY	0	0	f	2010-04-03	2727	\N	334947	\N
355510	GENERIC_DAY	0	0	f	2010-04-18	2727	\N	334947	\N
355511	GENERIC_DAY	0	4	f	2010-03-26	2727	\N	334947	\N
355512	GENERIC_DAY	0	4	f	2010-04-05	2727	\N	334947	\N
355513	GENERIC_DAY	0	4	f	2010-04-02	2727	\N	334947	\N
355514	GENERIC_DAY	0	4	f	2010-04-16	2729	\N	334947	\N
355515	GENERIC_DAY	0	4	f	2010-04-13	2727	\N	334947	\N
355516	GENERIC_DAY	0	4	f	2010-04-19	2727	\N	334947	\N
355517	GENERIC_DAY	0	0	f	2010-04-04	2729	\N	334947	\N
355518	GENERIC_DAY	0	4	f	2010-04-20	2727	\N	334947	\N
355519	GENERIC_DAY	0	4	f	2010-04-15	2727	\N	334947	\N
355520	GENERIC_DAY	0	4	f	2010-04-09	2727	\N	334947	\N
355521	GENERIC_DAY	0	4	f	2010-03-31	2727	\N	334947	\N
355522	GENERIC_DAY	0	4	f	2010-04-09	2729	\N	334947	\N
355523	GENERIC_DAY	0	3	f	2010-04-21	2729	\N	334947	\N
355524	GENERIC_DAY	0	0	f	2010-04-18	2729	\N	334947	\N
355525	GENERIC_DAY	0	4	f	2010-04-13	2729	\N	334947	\N
355526	GENERIC_DAY	0	4	f	2010-03-29	2729	\N	334947	\N
355527	GENERIC_DAY	0	4	f	2010-04-01	2727	\N	334947	\N
355528	GENERIC_DAY	0	4	f	2010-04-12	2727	\N	334947	\N
355529	GENERIC_DAY	0	4	f	2010-03-30	2729	\N	334947	\N
355530	GENERIC_DAY	0	4	f	2010-03-29	2727	\N	334947	\N
355531	GENERIC_DAY	0	0	f	2010-04-03	2729	\N	334947	\N
355532	GENERIC_DAY	0	0	f	2010-04-10	2727	\N	334947	\N
355533	GENERIC_DAY	0	0	f	2010-03-27	2727	\N	334947	\N
355534	GENERIC_DAY	0	4	f	2010-04-19	2729	\N	334947	\N
355535	GENERIC_DAY	0	0	f	2010-03-28	2727	\N	334947	\N
355536	GENERIC_DAY	0	0	f	2010-03-27	2729	\N	334947	\N
355537	GENERIC_DAY	0	4	f	2010-04-12	2729	\N	334947	\N
355538	GENERIC_DAY	0	4	f	2010-03-26	2729	\N	334947	\N
355539	GENERIC_DAY	0	4	f	2010-04-07	2727	\N	334947	\N
355540	GENERIC_DAY	0	4	f	2010-04-15	2729	\N	334947	\N
355541	GENERIC_DAY	0	4	f	2010-04-14	2727	\N	334947	\N
355542	GENERIC_DAY	0	4	f	2010-04-23	2729	\N	334948	\N
355543	GENERIC_DAY	0	4	f	2010-04-30	2729	\N	334948	\N
355544	GENERIC_DAY	0	4	f	2010-05-10	2729	\N	334948	\N
355545	GENERIC_DAY	0	4	f	2010-04-28	2727	\N	334948	\N
355546	GENERIC_DAY	0	4	f	2010-04-28	2729	\N	334948	\N
355547	GENERIC_DAY	0	0	f	2010-05-01	2729	\N	334948	\N
355548	GENERIC_DAY	0	0	f	2010-05-09	2727	\N	334948	\N
355549	GENERIC_DAY	0	4	f	2010-04-22	2727	\N	334948	\N
355550	GENERIC_DAY	0	4	f	2010-04-26	2729	\N	334948	\N
355551	GENERIC_DAY	0	4	f	2010-04-27	2727	\N	334948	\N
355552	GENERIC_DAY	0	4	f	2010-05-03	2729	\N	334948	\N
355553	GENERIC_DAY	0	0	f	2010-05-15	2727	\N	334948	\N
355554	GENERIC_DAY	0	4	f	2010-05-10	2727	\N	334948	\N
355555	GENERIC_DAY	0	0	f	2010-04-24	2727	\N	334948	\N
355556	GENERIC_DAY	0	0	f	2010-05-16	2729	\N	334948	\N
355557	GENERIC_DAY	0	0	f	2010-04-24	2729	\N	334948	\N
355558	GENERIC_DAY	0	4	f	2010-05-07	2729	\N	334948	\N
355559	GENERIC_DAY	0	4	f	2010-05-13	2727	\N	334948	\N
355560	GENERIC_DAY	0	4	f	2010-04-29	2727	\N	334948	\N
355561	GENERIC_DAY	0	4	f	2010-05-17	2729	\N	334948	\N
355562	GENERIC_DAY	0	4	f	2010-05-12	2729	\N	334948	\N
355563	GENERIC_DAY	0	0	f	2010-05-08	2729	\N	334948	\N
355564	GENERIC_DAY	0	4	f	2010-04-29	2729	\N	334948	\N
355565	GENERIC_DAY	0	0	f	2010-05-01	2727	\N	334948	\N
355566	GENERIC_DAY	0	4	f	2010-05-12	2727	\N	334948	\N
355567	GENERIC_DAY	0	0	f	2010-05-09	2729	\N	334948	\N
355568	GENERIC_DAY	0	4	f	2010-04-22	2729	\N	334948	\N
355569	GENERIC_DAY	0	4	f	2010-05-03	2727	\N	334948	\N
355570	GENERIC_DAY	0	4	f	2010-04-23	2727	\N	334948	\N
355571	GENERIC_DAY	0	4	f	2010-05-17	2727	\N	334948	\N
355572	GENERIC_DAY	0	4	f	2010-04-26	2727	\N	334948	\N
355573	GENERIC_DAY	0	0	f	2010-05-15	2729	\N	334948	\N
355574	GENERIC_DAY	0	0	f	2010-04-25	2729	\N	334948	\N
355575	GENERIC_DAY	0	4	f	2010-05-06	2727	\N	334948	\N
355576	GENERIC_DAY	0	4	f	2010-05-05	2727	\N	334948	\N
355577	GENERIC_DAY	0	0	f	2010-05-16	2727	\N	334948	\N
355578	GENERIC_DAY	0	3	f	2010-05-18	2729	\N	334948	\N
355579	GENERIC_DAY	0	4	f	2010-05-13	2729	\N	334948	\N
355580	GENERIC_DAY	0	0	f	2010-05-02	2727	\N	334948	\N
355581	GENERIC_DAY	0	4	f	2010-05-05	2729	\N	334948	\N
355582	GENERIC_DAY	0	4	f	2010-05-07	2727	\N	334948	\N
355583	GENERIC_DAY	0	4	f	2010-05-11	2729	\N	334948	\N
355584	GENERIC_DAY	0	4	f	2010-05-11	2727	\N	334948	\N
355585	GENERIC_DAY	0	4	f	2010-05-14	2729	\N	334948	\N
355586	GENERIC_DAY	0	4	f	2010-05-04	2729	\N	334948	\N
355587	GENERIC_DAY	0	4	f	2010-04-27	2729	\N	334948	\N
355588	GENERIC_DAY	0	0	f	2010-05-08	2727	\N	334948	\N
355589	GENERIC_DAY	0	0	f	2010-04-25	2727	\N	334948	\N
355590	GENERIC_DAY	0	0	f	2010-05-02	2729	\N	334948	\N
355591	GENERIC_DAY	0	3	f	2010-05-18	2727	\N	334948	\N
355592	GENERIC_DAY	0	4	f	2010-05-04	2727	\N	334948	\N
355593	GENERIC_DAY	0	4	f	2010-05-14	2727	\N	334948	\N
355594	GENERIC_DAY	0	4	f	2010-05-06	2729	\N	334948	\N
355595	GENERIC_DAY	0	4	f	2010-04-30	2727	\N	334948	\N
355596	GENERIC_DAY	0	4	f	2010-05-19	2727	\N	334949	\N
355597	GENERIC_DAY	0	4	f	2010-06-01	2729	\N	334949	\N
355598	GENERIC_DAY	0	4	f	2010-06-09	2729	\N	334949	\N
355599	GENERIC_DAY	0	4	f	2010-05-31	2727	\N	334949	\N
355600	GENERIC_DAY	0	4	f	2010-05-27	2729	\N	334949	\N
355601	GENERIC_DAY	0	4	f	2010-06-10	2729	\N	334949	\N
355602	GENERIC_DAY	0	4	f	2010-05-28	2727	\N	334949	\N
355603	GENERIC_DAY	0	4	f	2010-06-08	2729	\N	334949	\N
355604	GENERIC_DAY	0	4	f	2010-05-27	2727	\N	334949	\N
355605	GENERIC_DAY	0	4	f	2010-05-20	2729	\N	334949	\N
355606	GENERIC_DAY	0	4	f	2010-06-08	2727	\N	334949	\N
355607	GENERIC_DAY	0	0	f	2010-05-22	2729	\N	334949	\N
355608	GENERIC_DAY	0	4	f	2010-05-19	2729	\N	334949	\N
355609	GENERIC_DAY	0	4	f	2010-05-25	2727	\N	334949	\N
355610	GENERIC_DAY	0	4	f	2010-06-03	2729	\N	334949	\N
355611	GENERIC_DAY	0	4	f	2010-05-20	2727	\N	334949	\N
355612	GENERIC_DAY	0	4	f	2010-05-26	2727	\N	334949	\N
355613	GENERIC_DAY	0	0	f	2010-05-29	2729	\N	334949	\N
355614	GENERIC_DAY	0	0	f	2010-05-23	2729	\N	334949	\N
355615	GENERIC_DAY	0	4	f	2010-06-04	2729	\N	334949	\N
355616	GENERIC_DAY	0	4	f	2010-05-21	2729	\N	334949	\N
355617	GENERIC_DAY	0	4	f	2010-05-26	2729	\N	334949	\N
355618	GENERIC_DAY	0	4	f	2010-05-28	2729	\N	334949	\N
355619	GENERIC_DAY	0	4	f	2010-06-11	2729	\N	334949	\N
355620	GENERIC_DAY	0	4	f	2010-05-21	2727	\N	334949	\N
355621	GENERIC_DAY	0	0	f	2010-06-05	2729	\N	334949	\N
355622	GENERIC_DAY	0	0	f	2010-06-05	2727	\N	334949	\N
355623	GENERIC_DAY	0	4	f	2010-06-03	2727	\N	334949	\N
355624	GENERIC_DAY	0	4	f	2010-06-10	2727	\N	334949	\N
355625	GENERIC_DAY	0	0	f	2010-06-06	2729	\N	334949	\N
355626	GENERIC_DAY	0	4	f	2010-06-02	2727	\N	334949	\N
355627	GENERIC_DAY	0	3	f	2010-06-14	2729	\N	334949	\N
355628	GENERIC_DAY	0	4	f	2010-06-07	2729	\N	334949	\N
355629	GENERIC_DAY	0	4	f	2010-06-04	2727	\N	334949	\N
355630	GENERIC_DAY	0	0	f	2010-05-29	2727	\N	334949	\N
355631	GENERIC_DAY	0	4	f	2010-06-02	2729	\N	334949	\N
355632	GENERIC_DAY	0	4	f	2010-05-25	2729	\N	334949	\N
355633	GENERIC_DAY	0	4	f	2010-05-24	2727	\N	334949	\N
355634	GENERIC_DAY	0	0	f	2010-06-13	2727	\N	334949	\N
355635	GENERIC_DAY	0	0	f	2010-06-12	2727	\N	334949	\N
355636	GENERIC_DAY	0	0	f	2010-06-13	2729	\N	334949	\N
355637	GENERIC_DAY	0	0	f	2010-06-12	2729	\N	334949	\N
355638	GENERIC_DAY	0	4	f	2010-06-09	2727	\N	334949	\N
355639	GENERIC_DAY	0	4	f	2010-06-01	2727	\N	334949	\N
355640	GENERIC_DAY	0	0	f	2010-05-30	2729	\N	334949	\N
355641	GENERIC_DAY	0	0	f	2010-05-30	2727	\N	334949	\N
355642	GENERIC_DAY	0	4	f	2010-06-11	2727	\N	334949	\N
355643	GENERIC_DAY	0	0	f	2010-05-23	2727	\N	334949	\N
355644	GENERIC_DAY	0	3	f	2010-06-14	2727	\N	334949	\N
355645	GENERIC_DAY	0	0	f	2010-05-22	2727	\N	334949	\N
355646	GENERIC_DAY	0	4	f	2010-05-31	2729	\N	334949	\N
355647	GENERIC_DAY	0	4	f	2010-06-07	2727	\N	334949	\N
355648	GENERIC_DAY	0	4	f	2010-05-24	2729	\N	334949	\N
355649	GENERIC_DAY	0	0	f	2010-06-06	2727	\N	334949	\N
355650	GENERIC_DAY	0	4	f	2010-05-28	2727	\N	334950	\N
355651	GENERIC_DAY	0	4	f	2010-05-20	2729	\N	334950	\N
355652	GENERIC_DAY	0	0	f	2010-05-29	2729	\N	334950	\N
355653	GENERIC_DAY	0	4	f	2010-06-04	2729	\N	334950	\N
355654	GENERIC_DAY	0	0	f	2010-05-23	2727	\N	334950	\N
355655	GENERIC_DAY	0	4	f	2010-06-02	2727	\N	334950	\N
355656	GENERIC_DAY	0	0	f	2010-06-05	2729	\N	334950	\N
355657	GENERIC_DAY	0	0	f	2010-06-12	2729	\N	334950	\N
355658	GENERIC_DAY	0	4	f	2010-05-24	2729	\N	334950	\N
355659	GENERIC_DAY	0	4	f	2010-06-09	2727	\N	334950	\N
355660	GENERIC_DAY	0	3	f	2010-06-14	2727	\N	334950	\N
355661	GENERIC_DAY	0	0	f	2010-05-22	2729	\N	334950	\N
355662	GENERIC_DAY	0	4	f	2010-06-09	2729	\N	334950	\N
355663	GENERIC_DAY	0	4	f	2010-06-08	2729	\N	334950	\N
355664	GENERIC_DAY	0	4	f	2010-05-21	2729	\N	334950	\N
355665	GENERIC_DAY	0	4	f	2010-06-01	2727	\N	334950	\N
355666	GENERIC_DAY	0	4	f	2010-05-26	2729	\N	334950	\N
355667	GENERIC_DAY	0	4	f	2010-06-01	2729	\N	334950	\N
355668	GENERIC_DAY	0	0	f	2010-06-06	2729	\N	334950	\N
355669	GENERIC_DAY	0	0	f	2010-05-29	2727	\N	334950	\N
355670	GENERIC_DAY	0	4	f	2010-05-19	2729	\N	334950	\N
355671	GENERIC_DAY	0	0	f	2010-06-13	2727	\N	334950	\N
355672	GENERIC_DAY	0	0	f	2010-06-06	2727	\N	334950	\N
355673	GENERIC_DAY	0	4	f	2010-05-25	2727	\N	334950	\N
355674	GENERIC_DAY	0	4	f	2010-05-19	2727	\N	334950	\N
355675	GENERIC_DAY	0	4	f	2010-06-10	2727	\N	334950	\N
355676	GENERIC_DAY	0	0	f	2010-05-30	2727	\N	334950	\N
355677	GENERIC_DAY	0	0	f	2010-06-13	2729	\N	334950	\N
355678	GENERIC_DAY	0	4	f	2010-06-11	2727	\N	334950	\N
355679	GENERIC_DAY	0	4	f	2010-06-11	2729	\N	334950	\N
355680	GENERIC_DAY	0	4	f	2010-05-26	2727	\N	334950	\N
355681	GENERIC_DAY	0	4	f	2010-05-21	2727	\N	334950	\N
355682	GENERIC_DAY	0	4	f	2010-06-03	2729	\N	334950	\N
355683	GENERIC_DAY	0	0	f	2010-05-22	2727	\N	334950	\N
355684	GENERIC_DAY	0	0	f	2010-05-23	2729	\N	334950	\N
355685	GENERIC_DAY	0	4	f	2010-05-31	2727	\N	334950	\N
355686	GENERIC_DAY	0	4	f	2010-06-07	2727	\N	334950	\N
355687	GENERIC_DAY	0	0	f	2010-05-30	2729	\N	334950	\N
355688	GENERIC_DAY	0	4	f	2010-05-20	2727	\N	334950	\N
355689	GENERIC_DAY	0	0	f	2010-06-12	2727	\N	334950	\N
355690	GENERIC_DAY	0	4	f	2010-06-08	2727	\N	334950	\N
355691	GENERIC_DAY	0	4	f	2010-05-25	2729	\N	334950	\N
355692	GENERIC_DAY	0	4	f	2010-06-10	2729	\N	334950	\N
355693	GENERIC_DAY	0	4	f	2010-05-27	2729	\N	334950	\N
355694	GENERIC_DAY	0	4	f	2010-06-02	2729	\N	334950	\N
355695	GENERIC_DAY	0	4	f	2010-06-03	2727	\N	334950	\N
355696	GENERIC_DAY	0	4	f	2010-06-04	2727	\N	334950	\N
355697	GENERIC_DAY	0	4	f	2010-05-24	2727	\N	334950	\N
355698	GENERIC_DAY	0	4	f	2010-05-27	2727	\N	334950	\N
355699	GENERIC_DAY	0	4	f	2010-05-28	2729	\N	334950	\N
355700	GENERIC_DAY	0	3	f	2010-06-14	2729	\N	334950	\N
355701	GENERIC_DAY	0	4	f	2010-06-07	2729	\N	334950	\N
355702	GENERIC_DAY	0	0	f	2010-06-05	2727	\N	334950	\N
355703	GENERIC_DAY	0	4	f	2010-05-31	2729	\N	334950	\N
355704	GENERIC_DAY	0	2	f	2010-02-26	1619	\N	349502	\N
355705	GENERIC_DAY	0	2	f	2010-02-24	1619	\N	349502	\N
355706	GENERIC_DAY	0	3	f	2010-02-15	1625	\N	349502	\N
355707	GENERIC_DAY	0	0	f	2010-02-27	1625	\N	349502	\N
355708	GENERIC_DAY	0	3	f	2010-03-01	1623	\N	349502	\N
355709	GENERIC_DAY	0	2	f	2010-03-04	1619	\N	349502	\N
355710	GENERIC_DAY	0	0	f	2010-03-07	1619	\N	349502	\N
355711	GENERIC_DAY	0	0	f	2010-02-21	1619	\N	349502	\N
355712	GENERIC_DAY	0	3	f	2010-02-17	1623	\N	349502	\N
355713	GENERIC_DAY	0	2	f	2010-03-10	1619	\N	349502	\N
355714	GENERIC_DAY	0	3	f	2010-02-26	1623	\N	349502	\N
355715	GENERIC_DAY	0	3	f	2010-02-17	1625	\N	349502	\N
355716	GENERIC_DAY	0	3	f	2010-02-18	1625	\N	349502	\N
355717	GENERIC_DAY	0	0	f	2010-02-28	1625	\N	349502	\N
355718	GENERIC_DAY	0	3	f	2010-02-23	1623	\N	349502	\N
355719	GENERIC_DAY	0	0	f	2010-02-20	1619	\N	349502	\N
355720	GENERIC_DAY	0	3	f	2010-02-22	1623	\N	349502	\N
355721	GENERIC_DAY	0	3	f	2010-03-05	1623	\N	349502	\N
355722	GENERIC_DAY	0	2	f	2010-03-08	1619	\N	349502	\N
355723	GENERIC_DAY	0	3	f	2010-03-08	1625	\N	349502	\N
355724	GENERIC_DAY	0	2	f	2010-03-02	1619	\N	349502	\N
355725	GENERIC_DAY	0	0	f	2010-03-07	1625	\N	349502	\N
355726	GENERIC_DAY	0	3	f	2010-02-24	1625	\N	349502	\N
355727	GENERIC_DAY	0	3	f	2010-02-12	1623	\N	349502	\N
355728	GENERIC_DAY	0	3	f	2010-03-02	1625	\N	349502	\N
355729	GENERIC_DAY	0	2	f	2010-03-10	1625	\N	349502	\N
355730	GENERIC_DAY	0	0	f	2010-03-06	1623	\N	349502	\N
355731	GENERIC_DAY	0	3	f	2010-03-03	1625	\N	349502	\N
355732	GENERIC_DAY	0	0	f	2010-02-14	1625	\N	349502	\N
355733	GENERIC_DAY	0	3	f	2010-02-19	1623	\N	349502	\N
355734	GENERIC_DAY	0	3	f	2010-02-25	1625	\N	349502	\N
355735	GENERIC_DAY	0	0	f	2010-02-20	1623	\N	349502	\N
355736	GENERIC_DAY	0	2	f	2010-03-01	1619	\N	349502	\N
355737	GENERIC_DAY	0	3	f	2010-02-22	1625	\N	349502	\N
355738	GENERIC_DAY	0	2	f	2010-03-10	1623	\N	349502	\N
355739	GENERIC_DAY	0	3	f	2010-02-16	1623	\N	349502	\N
355740	GENERIC_DAY	0	0	f	2010-03-06	1619	\N	349502	\N
355741	GENERIC_DAY	0	2	f	2010-03-03	1619	\N	349502	\N
355742	GENERIC_DAY	0	2	f	2010-02-23	1619	\N	349502	\N
355743	GENERIC_DAY	0	0	f	2010-03-07	1623	\N	349502	\N
355744	GENERIC_DAY	0	3	f	2010-03-04	1625	\N	349502	\N
355745	GENERIC_DAY	0	2	f	2010-02-15	1619	\N	349502	\N
355746	GENERIC_DAY	0	0	f	2010-02-13	1623	\N	349502	\N
355747	GENERIC_DAY	0	3	f	2010-02-18	1623	\N	349502	\N
355748	GENERIC_DAY	0	2	f	2010-02-25	1619	\N	349502	\N
355749	GENERIC_DAY	0	3	f	2010-02-23	1625	\N	349502	\N
355750	GENERIC_DAY	0	0	f	2010-02-13	1625	\N	349502	\N
355751	GENERIC_DAY	0	2	f	2010-02-17	1619	\N	349502	\N
355752	GENERIC_DAY	0	3	f	2010-03-09	1623	\N	349502	\N
355753	GENERIC_DAY	0	3	f	2010-02-16	1625	\N	349502	\N
355754	GENERIC_DAY	0	3	f	2010-03-08	1623	\N	349502	\N
355755	GENERIC_DAY	0	0	f	2010-02-14	1619	\N	349502	\N
355756	GENERIC_DAY	0	0	f	2010-02-13	1619	\N	349502	\N
355757	GENERIC_DAY	0	2	f	2010-02-16	1619	\N	349502	\N
355758	GENERIC_DAY	0	3	f	2010-02-25	1623	\N	349502	\N
355759	GENERIC_DAY	0	2	f	2010-03-05	1619	\N	349502	\N
355760	GENERIC_DAY	0	2	f	2010-02-18	1619	\N	349502	\N
355761	GENERIC_DAY	0	3	f	2010-02-19	1625	\N	349502	\N
355762	GENERIC_DAY	0	3	f	2010-03-04	1623	\N	349502	\N
355763	GENERIC_DAY	0	3	f	2010-02-26	1625	\N	349502	\N
355764	GENERIC_DAY	0	0	f	2010-02-20	1625	\N	349502	\N
355765	GENERIC_DAY	0	2	f	2010-02-12	1619	\N	349502	\N
355766	GENERIC_DAY	0	3	f	2010-03-05	1625	\N	349502	\N
355767	GENERIC_DAY	0	0	f	2010-02-21	1625	\N	349502	\N
355768	GENERIC_DAY	0	2	f	2010-02-22	1619	\N	349502	\N
355769	GENERIC_DAY	0	3	f	2010-02-24	1623	\N	349502	\N
355770	GENERIC_DAY	0	3	f	2010-03-01	1625	\N	349502	\N
355771	GENERIC_DAY	0	3	f	2010-03-09	1625	\N	349502	\N
355772	GENERIC_DAY	0	0	f	2010-02-14	1623	\N	349502	\N
355773	GENERIC_DAY	0	3	f	2010-02-12	1625	\N	349502	\N
355774	GENERIC_DAY	0	0	f	2010-02-28	1623	\N	349502	\N
355775	GENERIC_DAY	0	0	f	2010-03-06	1625	\N	349502	\N
355776	GENERIC_DAY	0	2	f	2010-03-09	1619	\N	349502	\N
355777	GENERIC_DAY	0	0	f	2010-02-27	1623	\N	349502	\N
355778	GENERIC_DAY	0	3	f	2010-03-02	1623	\N	349502	\N
355779	GENERIC_DAY	0	0	f	2010-02-27	1619	\N	349502	\N
355780	GENERIC_DAY	0	2	f	2010-02-19	1619	\N	349502	\N
355781	GENERIC_DAY	0	3	f	2010-02-15	1623	\N	349502	\N
355782	GENERIC_DAY	0	3	f	2010-03-03	1623	\N	349502	\N
355783	GENERIC_DAY	0	0	f	2010-02-21	1623	\N	349502	\N
355784	GENERIC_DAY	0	0	f	2010-02-28	1619	\N	349502	\N
355785	GENERIC_DAY	0	0	f	2010-02-13	1623	\N	349503	\N
355786	GENERIC_DAY	0	0	f	2010-02-28	1619	\N	349503	\N
355787	GENERIC_DAY	0	3	f	2010-03-04	1619	\N	349503	\N
355788	GENERIC_DAY	0	2	f	2010-02-22	1623	\N	349503	\N
355789	GENERIC_DAY	0	0	f	2010-02-21	1625	\N	349503	\N
355790	GENERIC_DAY	0	2	f	2010-02-23	1623	\N	349503	\N
355791	GENERIC_DAY	0	2	f	2010-03-10	1619	\N	349503	\N
355792	GENERIC_DAY	0	3	f	2010-02-18	1625	\N	349503	\N
355793	GENERIC_DAY	0	3	f	2010-02-19	1619	\N	349503	\N
355794	GENERIC_DAY	0	3	f	2010-02-26	1625	\N	349503	\N
355795	GENERIC_DAY	0	2	f	2010-02-24	1623	\N	349503	\N
355796	GENERIC_DAY	0	0	f	2010-02-27	1619	\N	349503	\N
355797	GENERIC_DAY	0	0	f	2010-03-07	1619	\N	349503	\N
355798	GENERIC_DAY	0	0	f	2010-02-27	1625	\N	349503	\N
355799	GENERIC_DAY	0	2	f	2010-03-09	1623	\N	349503	\N
355800	GENERIC_DAY	0	2	f	2010-03-10	1623	\N	349503	\N
355801	GENERIC_DAY	0	0	f	2010-02-20	1619	\N	349503	\N
355802	GENERIC_DAY	0	3	f	2010-03-03	1619	\N	349503	\N
355803	GENERIC_DAY	0	3	f	2010-03-05	1619	\N	349503	\N
355804	GENERIC_DAY	0	3	f	2010-03-08	1619	\N	349503	\N
355805	GENERIC_DAY	0	2	f	2010-03-10	1625	\N	349503	\N
355806	GENERIC_DAY	0	3	f	2010-02-22	1625	\N	349503	\N
355807	GENERIC_DAY	0	3	f	2010-03-01	1619	\N	349503	\N
355808	GENERIC_DAY	0	3	f	2010-02-26	1619	\N	349503	\N
355809	GENERIC_DAY	0	0	f	2010-02-21	1623	\N	349503	\N
355810	GENERIC_DAY	0	0	f	2010-02-28	1625	\N	349503	\N
355811	GENERIC_DAY	0	0	f	2010-02-13	1625	\N	349503	\N
355812	GENERIC_DAY	0	0	f	2010-03-06	1623	\N	349503	\N
355813	GENERIC_DAY	0	3	f	2010-03-08	1625	\N	349503	\N
355814	GENERIC_DAY	0	2	f	2010-02-26	1623	\N	349503	\N
355815	GENERIC_DAY	0	0	f	2010-02-14	1619	\N	349503	\N
355816	GENERIC_DAY	0	0	f	2010-02-20	1623	\N	349503	\N
355817	GENERIC_DAY	0	2	f	2010-02-16	1623	\N	349503	\N
355818	GENERIC_DAY	0	3	f	2010-03-04	1625	\N	349503	\N
355819	GENERIC_DAY	0	2	f	2010-03-04	1623	\N	349503	\N
355820	GENERIC_DAY	0	3	f	2010-02-16	1619	\N	349503	\N
355821	GENERIC_DAY	0	2	f	2010-02-25	1623	\N	349503	\N
355822	GENERIC_DAY	0	0	f	2010-02-14	1625	\N	349503	\N
355823	GENERIC_DAY	0	3	f	2010-03-09	1625	\N	349503	\N
355824	GENERIC_DAY	0	3	f	2010-02-12	1619	\N	349503	\N
355825	GENERIC_DAY	0	3	f	2010-03-09	1619	\N	349503	\N
355826	GENERIC_DAY	0	3	f	2010-02-16	1625	\N	349503	\N
355827	GENERIC_DAY	0	2	f	2010-02-18	1623	\N	349503	\N
355828	GENERIC_DAY	0	3	f	2010-02-17	1619	\N	349503	\N
355829	GENERIC_DAY	0	2	f	2010-03-03	1623	\N	349503	\N
355830	GENERIC_DAY	0	3	f	2010-02-25	1625	\N	349503	\N
355831	GENERIC_DAY	0	0	f	2010-03-06	1619	\N	349503	\N
355832	GENERIC_DAY	0	0	f	2010-03-07	1623	\N	349503	\N
355833	GENERIC_DAY	0	0	f	2010-02-20	1625	\N	349503	\N
355834	GENERIC_DAY	0	3	f	2010-02-22	1619	\N	349503	\N
355835	GENERIC_DAY	0	2	f	2010-02-12	1623	\N	349503	\N
355836	GENERIC_DAY	0	2	f	2010-02-19	1623	\N	349503	\N
355837	GENERIC_DAY	0	3	f	2010-03-02	1619	\N	349503	\N
355838	GENERIC_DAY	0	3	f	2010-02-19	1625	\N	349503	\N
355839	GENERIC_DAY	0	2	f	2010-03-05	1623	\N	349503	\N
355840	GENERIC_DAY	0	0	f	2010-03-07	1625	\N	349503	\N
355841	GENERIC_DAY	0	0	f	2010-02-14	1623	\N	349503	\N
355842	GENERIC_DAY	0	0	f	2010-02-27	1623	\N	349503	\N
355843	GENERIC_DAY	0	0	f	2010-02-21	1619	\N	349503	\N
355844	GENERIC_DAY	0	2	f	2010-03-01	1623	\N	349503	\N
355845	GENERIC_DAY	0	3	f	2010-03-03	1625	\N	349503	\N
355846	GENERIC_DAY	0	0	f	2010-03-06	1625	\N	349503	\N
355847	GENERIC_DAY	0	3	f	2010-02-24	1625	\N	349503	\N
355848	GENERIC_DAY	0	3	f	2010-02-23	1619	\N	349503	\N
355849	GENERIC_DAY	0	3	f	2010-02-18	1619	\N	349503	\N
355850	GENERIC_DAY	0	3	f	2010-02-25	1619	\N	349503	\N
355851	GENERIC_DAY	0	3	f	2010-02-15	1619	\N	349503	\N
355852	GENERIC_DAY	0	3	f	2010-02-23	1625	\N	349503	\N
355853	GENERIC_DAY	0	2	f	2010-02-15	1623	\N	349503	\N
355854	GENERIC_DAY	0	3	f	2010-02-15	1625	\N	349503	\N
355855	GENERIC_DAY	0	3	f	2010-03-05	1625	\N	349503	\N
355856	GENERIC_DAY	0	2	f	2010-02-17	1623	\N	349503	\N
355857	GENERIC_DAY	0	0	f	2010-02-13	1619	\N	349503	\N
355858	GENERIC_DAY	0	3	f	2010-02-17	1625	\N	349503	\N
355859	GENERIC_DAY	0	0	f	2010-02-28	1623	\N	349503	\N
355860	GENERIC_DAY	0	2	f	2010-03-02	1623	\N	349503	\N
307352	GENERIC_DAY	2	0	f	2010-08-14	299991	\N	303182	\N
307353	GENERIC_DAY	2	4	f	2010-08-11	299991	\N	303182	\N
307354	GENERIC_DAY	2	4	f	2010-08-18	299991	\N	303182	\N
307355	GENERIC_DAY	2	0	f	2010-08-22	299991	\N	303182	\N
307356	GENERIC_DAY	2	0	f	2010-08-21	299991	\N	303182	\N
307357	GENERIC_DAY	2	4	f	2010-08-23	299991	\N	303182	\N
307358	GENERIC_DAY	2	4	f	2010-08-25	299993	\N	303182	\N
307359	GENERIC_DAY	2	4	f	2010-08-06	299991	\N	303183	\N
307360	GENERIC_DAY	2	4	f	2010-08-02	299991	\N	303183	\N
307361	GENERIC_DAY	2	3	f	2010-08-26	299993	\N	303183	\N
307362	GENERIC_DAY	2	0	f	2010-08-22	299993	\N	303183	\N
307363	GENERIC_DAY	2	4	f	2010-08-03	299991	\N	303183	\N
307364	GENERIC_DAY	2	4	f	2010-08-16	299991	\N	303183	\N
307365	GENERIC_DAY	2	4	f	2010-08-17	299991	\N	303183	\N
307366	GENERIC_DAY	2	0	f	2010-08-08	299993	\N	303183	\N
307367	GENERIC_DAY	2	4	f	2010-08-25	299991	\N	303183	\N
307368	GENERIC_DAY	2	4	f	2010-08-04	299991	\N	303183	\N
307369	GENERIC_DAY	2	4	f	2010-08-23	299991	\N	303183	\N
307370	GENERIC_DAY	2	4	f	2010-08-13	299991	\N	303183	\N
307371	GENERIC_DAY	2	4	f	2010-08-04	299993	\N	303183	\N
307372	GENERIC_DAY	2	4	f	2010-08-05	299991	\N	303183	\N
307373	GENERIC_DAY	2	4	f	2010-08-17	299993	\N	303183	\N
307374	GENERIC_DAY	2	4	f	2010-08-02	299993	\N	303183	\N
307375	GENERIC_DAY	2	0	f	2010-08-21	299993	\N	303183	\N
307376	GENERIC_DAY	2	4	f	2010-08-10	299993	\N	303183	\N
307377	GENERIC_DAY	2	0	f	2010-08-08	299991	\N	303183	\N
307378	GENERIC_DAY	2	4	f	2010-08-19	299993	\N	303183	\N
307379	GENERIC_DAY	2	4	f	2010-08-24	299993	\N	303183	\N
307380	GENERIC_DAY	2	4	f	2010-08-13	299993	\N	303183	\N
307381	GENERIC_DAY	2	4	f	2010-08-25	299993	\N	303183	\N
307382	GENERIC_DAY	2	4	f	2010-08-18	299993	\N	303183	\N
307383	GENERIC_DAY	2	4	f	2010-08-12	299991	\N	303183	\N
307384	GENERIC_DAY	2	4	f	2010-08-11	299991	\N	303183	\N
307385	GENERIC_DAY	2	4	f	2010-08-20	299991	\N	303183	\N
307386	GENERIC_DAY	2	0	f	2010-08-22	299991	\N	303183	\N
307387	GENERIC_DAY	2	4	f	2010-08-20	299993	\N	303183	\N
307388	GENERIC_DAY	2	0	f	2010-08-07	299993	\N	303183	\N
307389	GENERIC_DAY	2	4	f	2010-08-23	299993	\N	303183	\N
307390	GENERIC_DAY	2	4	f	2010-08-05	299993	\N	303183	\N
307391	GENERIC_DAY	2	0	f	2010-08-15	299993	\N	303183	\N
307392	GENERIC_DAY	2	0	f	2010-08-14	299993	\N	303183	\N
307393	GENERIC_DAY	2	4	f	2010-08-16	299993	\N	303183	\N
307394	GENERIC_DAY	2	4	f	2010-08-03	299993	\N	303183	\N
307395	GENERIC_DAY	2	4	f	2010-08-11	299993	\N	303183	\N
307396	GENERIC_DAY	2	4	f	2010-08-09	299993	\N	303183	\N
307397	GENERIC_DAY	2	0	f	2010-08-07	299991	\N	303183	\N
307398	GENERIC_DAY	2	3	f	2010-08-26	299991	\N	303183	\N
307399	GENERIC_DAY	2	4	f	2010-08-24	299991	\N	303183	\N
307400	GENERIC_DAY	2	4	f	2010-08-10	299991	\N	303183	\N
307401	GENERIC_DAY	2	0	f	2010-08-21	299991	\N	303183	\N
307402	GENERIC_DAY	2	0	f	2010-08-15	299991	\N	303183	\N
307403	GENERIC_DAY	2	4	f	2010-08-18	299991	\N	303183	\N
307404	GENERIC_DAY	2	4	f	2010-08-19	299991	\N	303183	\N
307405	GENERIC_DAY	2	4	f	2010-08-09	299991	\N	303183	\N
307406	GENERIC_DAY	2	4	f	2010-08-06	299993	\N	303183	\N
307407	GENERIC_DAY	2	4	f	2010-08-12	299993	\N	303183	\N
307408	GENERIC_DAY	2	0	f	2010-08-14	299991	\N	303183	\N
307409	GENERIC_DAY	2	0	f	2010-08-28	299993	\N	303184	\N
307410	GENERIC_DAY	2	4	f	2010-09-02	299991	\N	303184	\N
307411	GENERIC_DAY	2	4	f	2010-09-10	299993	\N	303184	\N
307412	GENERIC_DAY	2	0	f	2010-08-28	299991	\N	303184	\N
307413	GENERIC_DAY	2	4	f	2010-09-02	299993	\N	303184	\N
307414	GENERIC_DAY	2	4	f	2010-09-16	299993	\N	303184	\N
307415	GENERIC_DAY	2	0	f	2010-08-29	299991	\N	303184	\N
307416	GENERIC_DAY	2	4	f	2010-09-06	299991	\N	303184	\N
307417	GENERIC_DAY	2	4	f	2010-08-30	299991	\N	303184	\N
307418	GENERIC_DAY	2	4	f	2010-09-13	299993	\N	303184	\N
307419	GENERIC_DAY	2	4	f	2010-09-09	299993	\N	303184	\N
307420	GENERIC_DAY	2	4	f	2010-09-14	299993	\N	303184	\N
307421	GENERIC_DAY	2	4	f	2010-08-27	299991	\N	303184	\N
307422	GENERIC_DAY	2	4	f	2010-09-03	299991	\N	303184	\N
307423	GENERIC_DAY	2	4	f	2010-09-17	299993	\N	303184	\N
307424	GENERIC_DAY	2	4	f	2010-09-07	299993	\N	303184	\N
307425	GENERIC_DAY	2	4	f	2010-08-30	299993	\N	303184	\N
307426	GENERIC_DAY	2	0	f	2010-09-04	299991	\N	303184	\N
307427	GENERIC_DAY	2	4	f	2010-09-08	299993	\N	303184	\N
307428	GENERIC_DAY	2	4	f	2010-09-13	299991	\N	303184	\N
307429	GENERIC_DAY	2	4	f	2010-09-01	299993	\N	303184	\N
307430	GENERIC_DAY	2	4	f	2010-09-01	299991	\N	303184	\N
307431	GENERIC_DAY	2	4	f	2010-09-10	299991	\N	303184	\N
307432	GENERIC_DAY	2	0	f	2010-08-29	299993	\N	303184	\N
307433	GENERIC_DAY	2	4	f	2010-09-15	299993	\N	303184	\N
307434	GENERIC_DAY	2	4	f	2010-08-31	299993	\N	303184	\N
307435	GENERIC_DAY	2	4	f	2010-09-20	299993	\N	303184	\N
307436	GENERIC_DAY	2	0	f	2010-09-11	299991	\N	303184	\N
307437	GENERIC_DAY	2	0	f	2010-09-05	299991	\N	303184	\N
307438	GENERIC_DAY	2	0	f	2010-09-18	299993	\N	303184	\N
307439	GENERIC_DAY	2	4	f	2010-09-16	299991	\N	303184	\N
307440	GENERIC_DAY	2	4	f	2010-09-06	299993	\N	303184	\N
307441	GENERIC_DAY	2	3	f	2010-09-22	299993	\N	303184	\N
307442	GENERIC_DAY	2	4	f	2010-09-08	299991	\N	303184	\N
307443	GENERIC_DAY	2	0	f	2010-09-18	299991	\N	303184	\N
307444	GENERIC_DAY	2	4	f	2010-09-07	299991	\N	303184	\N
307445	GENERIC_DAY	2	0	f	2010-09-12	299991	\N	303184	\N
307446	GENERIC_DAY	2	0	f	2010-09-19	299991	\N	303184	\N
307447	GENERIC_DAY	2	0	f	2010-09-12	299993	\N	303184	\N
307448	GENERIC_DAY	2	0	f	2010-09-04	299993	\N	303184	\N
307449	GENERIC_DAY	2	4	f	2010-08-31	299991	\N	303184	\N
307450	GENERIC_DAY	2	4	f	2010-08-27	299993	\N	303184	\N
307451	GENERIC_DAY	2	4	f	2010-09-15	299991	\N	303184	\N
307452	GENERIC_DAY	2	0	f	2010-09-11	299993	\N	303184	\N
307453	GENERIC_DAY	2	4	f	2010-09-03	299993	\N	303184	\N
307454	GENERIC_DAY	2	3	f	2010-09-22	299991	\N	303184	\N
307455	GENERIC_DAY	2	0	f	2010-09-19	299993	\N	303184	\N
307456	GENERIC_DAY	2	4	f	2010-09-17	299991	\N	303184	\N
307457	GENERIC_DAY	2	4	f	2010-09-14	299991	\N	303184	\N
307458	GENERIC_DAY	2	4	f	2010-09-21	299993	\N	303184	\N
307459	GENERIC_DAY	2	0	f	2010-09-05	299993	\N	303184	\N
307460	GENERIC_DAY	2	4	f	2010-09-09	299991	\N	303184	\N
307461	GENERIC_DAY	2	4	f	2010-09-21	299991	\N	303184	\N
307462	GENERIC_DAY	2	4	f	2010-09-20	299991	\N	303184	\N
307463	GENERIC_DAY	2	4	f	2010-09-06	299993	\N	303185	\N
307464	GENERIC_DAY	2	4	f	2010-08-25	299993	\N	303185	\N
307465	GENERIC_DAY	2	4	f	2010-09-09	299993	\N	303185	\N
307466	GENERIC_DAY	2	4	f	2010-09-14	299993	\N	303185	\N
307467	GENERIC_DAY	2	0	f	2010-08-28	299991	\N	303185	\N
307468	GENERIC_DAY	2	4	f	2010-09-03	299991	\N	303185	\N
307469	GENERIC_DAY	2	4	f	2010-09-14	299991	\N	303185	\N
307470	GENERIC_DAY	2	4	f	2010-08-30	299991	\N	303185	\N
307471	GENERIC_DAY	2	0	f	2010-09-18	299993	\N	303185	\N
307472	GENERIC_DAY	2	0	f	2010-09-19	299991	\N	303185	\N
307473	GENERIC_DAY	2	0	f	2010-09-04	299991	\N	303185	\N
307474	GENERIC_DAY	2	0	f	2010-09-12	299991	\N	303185	\N
307475	GENERIC_DAY	2	0	f	2010-08-29	299993	\N	303185	\N
307476	GENERIC_DAY	2	4	f	2010-08-26	299993	\N	303185	\N
307477	GENERIC_DAY	2	4	f	2010-09-15	299993	\N	303185	\N
307478	GENERIC_DAY	2	4	f	2010-08-31	299993	\N	303185	\N
307479	GENERIC_DAY	2	4	f	2010-09-10	299991	\N	303185	\N
307480	GENERIC_DAY	2	0	f	2010-09-18	299991	\N	303185	\N
307481	GENERIC_DAY	2	0	f	2010-09-05	299991	\N	303185	\N
307482	GENERIC_DAY	2	0	f	2010-09-12	299993	\N	303185	\N
307483	GENERIC_DAY	2	4	f	2010-09-17	299993	\N	303185	\N
307484	GENERIC_DAY	2	4	f	2010-09-16	299991	\N	303185	\N
307485	GENERIC_DAY	2	4	f	2010-09-02	299991	\N	303185	\N
307486	GENERIC_DAY	2	4	f	2010-09-08	299993	\N	303185	\N
307487	GENERIC_DAY	2	4	f	2010-08-31	299991	\N	303185	\N
307488	GENERIC_DAY	2	0	f	2010-09-11	299991	\N	303185	\N
307489	GENERIC_DAY	2	4	f	2010-09-13	299991	\N	303185	\N
307490	GENERIC_DAY	2	4	f	2010-09-02	299993	\N	303185	\N
307491	GENERIC_DAY	2	3	f	2010-09-20	299991	\N	303185	\N
307492	GENERIC_DAY	2	0	f	2010-08-28	299993	\N	303185	\N
307493	GENERIC_DAY	2	4	f	2010-09-15	299991	\N	303185	\N
307494	GENERIC_DAY	2	4	f	2010-09-07	299991	\N	303185	\N
307495	GENERIC_DAY	2	4	f	2010-08-27	299993	\N	303185	\N
307496	GENERIC_DAY	2	4	f	2010-08-25	299991	\N	303185	\N
307497	GENERIC_DAY	2	4	f	2010-09-13	299993	\N	303185	\N
307498	GENERIC_DAY	2	4	f	2010-09-08	299991	\N	303185	\N
307499	GENERIC_DAY	2	4	f	2010-09-07	299993	\N	303185	\N
307500	GENERIC_DAY	2	0	f	2010-09-19	299993	\N	303185	\N
307501	GENERIC_DAY	2	4	f	2010-08-30	299993	\N	303185	\N
307502	GENERIC_DAY	2	4	f	2010-08-27	299991	\N	303185	\N
307503	GENERIC_DAY	2	4	f	2010-09-01	299993	\N	303185	\N
307504	GENERIC_DAY	2	4	f	2010-09-10	299993	\N	303185	\N
307505	GENERIC_DAY	2	4	f	2010-09-06	299991	\N	303185	\N
307506	GENERIC_DAY	2	0	f	2010-09-11	299993	\N	303185	\N
307507	GENERIC_DAY	2	4	f	2010-09-16	299993	\N	303185	\N
307508	GENERIC_DAY	2	4	f	2010-08-26	299991	\N	303185	\N
307509	GENERIC_DAY	2	0	f	2010-08-29	299991	\N	303185	\N
307510	GENERIC_DAY	2	4	f	2010-09-01	299991	\N	303185	\N
307511	GENERIC_DAY	2	3	f	2010-09-20	299993	\N	303185	\N
307512	GENERIC_DAY	2	0	f	2010-09-04	299993	\N	303185	\N
307513	GENERIC_DAY	2	0	f	2010-09-05	299993	\N	303185	\N
307514	GENERIC_DAY	2	4	f	2010-09-03	299993	\N	303185	\N
307515	GENERIC_DAY	2	4	f	2010-09-17	299991	\N	303185	\N
307516	GENERIC_DAY	2	4	f	2010-09-09	299991	\N	303185	\N
307517	GENERIC_DAY	2	8	f	2010-09-27	299993	\N	303186	\N
307518	GENERIC_DAY	2	8	f	2010-09-30	299993	\N	303186	\N
307519	GENERIC_DAY	2	8	f	2010-09-27	299991	\N	303186	\N
307520	GENERIC_DAY	2	8	f	2010-09-29	299991	\N	303186	\N
307521	GENERIC_DAY	2	0	f	2010-10-02	299991	\N	303186	\N
307522	GENERIC_DAY	2	8	f	2010-09-23	299993	\N	303186	\N
307523	GENERIC_DAY	2	0	f	2010-09-25	299993	\N	303186	\N
307524	GENERIC_DAY	2	8	f	2010-09-28	299991	\N	303186	\N
307525	GENERIC_DAY	2	0	f	2010-10-03	299993	\N	303186	\N
307526	GENERIC_DAY	2	8	f	2010-09-24	299991	\N	303186	\N
307527	GENERIC_DAY	2	8	f	2010-09-30	299991	\N	303186	\N
307528	GENERIC_DAY	2	8	f	2010-10-04	299991	\N	303186	\N
307529	GENERIC_DAY	2	8	f	2010-09-24	299993	\N	303186	\N
307530	GENERIC_DAY	2	3	f	2010-10-06	299991	\N	303186	\N
307531	GENERIC_DAY	2	0	f	2010-09-25	299991	\N	303186	\N
307532	GENERIC_DAY	2	8	f	2010-10-01	299993	\N	303186	\N
307533	GENERIC_DAY	2	3	f	2010-10-06	299993	\N	303186	\N
307534	GENERIC_DAY	2	0	f	2010-10-02	299993	\N	303186	\N
307535	GENERIC_DAY	2	8	f	2010-09-23	299991	\N	303186	\N
307536	GENERIC_DAY	2	8	f	2010-10-04	299993	\N	303186	\N
307537	GENERIC_DAY	2	8	f	2010-10-01	299991	\N	303186	\N
307538	GENERIC_DAY	2	0	f	2010-09-26	299991	\N	303186	\N
307539	GENERIC_DAY	2	0	f	2010-09-26	299993	\N	303186	\N
307540	GENERIC_DAY	2	8	f	2010-09-29	299993	\N	303186	\N
307541	GENERIC_DAY	2	8	f	2010-10-05	299993	\N	303186	\N
307542	GENERIC_DAY	2	8	f	2010-10-05	299991	\N	303186	\N
307543	GENERIC_DAY	2	8	f	2010-09-28	299993	\N	303186	\N
307544	GENERIC_DAY	2	0	f	2010-10-03	299991	\N	303186	\N
307545	GENERIC_DAY	2	8	f	2010-10-07	299991	\N	303187	\N
307546	GENERIC_DAY	2	7	f	2010-10-19	299993	\N	303187	\N
307547	GENERIC_DAY	2	0	f	2010-10-16	299991	\N	303187	\N
307548	GENERIC_DAY	2	7	f	2010-10-13	299993	\N	303187	\N
307549	GENERIC_DAY	2	0	f	2010-10-17	299993	\N	303187	\N
307550	GENERIC_DAY	2	8	f	2010-10-11	299991	\N	303187	\N
307551	GENERIC_DAY	2	0	f	2010-10-10	299993	\N	303187	\N
307552	GENERIC_DAY	2	7	f	2010-10-18	299993	\N	303187	\N
307553	GENERIC_DAY	2	7	f	2010-10-20	299993	\N	303187	\N
307554	GENERIC_DAY	2	7	f	2010-10-07	299993	\N	303187	\N
307555	GENERIC_DAY	2	8	f	2010-10-12	299991	\N	303187	\N
307556	GENERIC_DAY	2	0	f	2010-10-16	299993	\N	303187	\N
307557	GENERIC_DAY	2	8	f	2010-10-20	299991	\N	303187	\N
307558	GENERIC_DAY	2	0	f	2010-10-10	299991	\N	303187	\N
307559	GENERIC_DAY	2	7	f	2010-10-12	299993	\N	303187	\N
307560	GENERIC_DAY	2	8	f	2010-10-13	299991	\N	303187	\N
307561	GENERIC_DAY	2	8	f	2010-10-08	299991	\N	303187	\N
307562	GENERIC_DAY	2	8	f	2010-10-15	299991	\N	303187	\N
307563	GENERIC_DAY	2	0	f	2010-10-09	299991	\N	303187	\N
307564	GENERIC_DAY	2	0	f	2010-10-17	299991	\N	303187	\N
307565	GENERIC_DAY	2	7	f	2010-10-14	299993	\N	303187	\N
307566	GENERIC_DAY	2	7	f	2010-10-08	299993	\N	303187	\N
307567	GENERIC_DAY	2	8	f	2010-10-18	299991	\N	303187	\N
307568	GENERIC_DAY	2	8	f	2010-10-19	299991	\N	303187	\N
307569	GENERIC_DAY	2	7	f	2010-10-15	299993	\N	303187	\N
307570	GENERIC_DAY	2	8	f	2010-10-14	299991	\N	303187	\N
307571	GENERIC_DAY	2	0	f	2010-10-09	299993	\N	303187	\N
307572	GENERIC_DAY	2	7	f	2010-10-11	299993	\N	303187	\N
307573	GENERIC_DAY	2	4	f	2010-11-04	299991	\N	303188	\N
307574	GENERIC_DAY	2	4	f	2010-10-22	299991	\N	303188	\N
307575	GENERIC_DAY	2	4	f	2010-11-12	299993	\N	303188	\N
307576	GENERIC_DAY	2	0	f	2010-10-23	299991	\N	303188	\N
307577	GENERIC_DAY	2	4	f	2010-11-01	299991	\N	303188	\N
307578	GENERIC_DAY	2	0	f	2010-11-07	299993	\N	303188	\N
307579	GENERIC_DAY	2	0	f	2010-11-06	299991	\N	303188	\N
307580	GENERIC_DAY	2	3	f	2010-11-16	299991	\N	303188	\N
307581	GENERIC_DAY	2	4	f	2010-11-01	299993	\N	303188	\N
307582	GENERIC_DAY	2	0	f	2010-10-30	299993	\N	303188	\N
307583	GENERIC_DAY	2	0	f	2010-11-06	299993	\N	303188	\N
307584	GENERIC_DAY	2	4	f	2010-10-28	299991	\N	303188	\N
307585	GENERIC_DAY	2	4	f	2010-11-05	299991	\N	303188	\N
307586	GENERIC_DAY	2	4	f	2010-10-22	299993	\N	303188	\N
307587	GENERIC_DAY	2	4	f	2010-10-29	299991	\N	303188	\N
307588	GENERIC_DAY	2	0	f	2010-11-13	299991	\N	303188	\N
307589	GENERIC_DAY	2	4	f	2010-11-02	299991	\N	303188	\N
307590	GENERIC_DAY	2	0	f	2010-10-24	299993	\N	303188	\N
307591	GENERIC_DAY	2	4	f	2010-11-08	299991	\N	303188	\N
307592	GENERIC_DAY	2	0	f	2010-11-13	299993	\N	303188	\N
307593	GENERIC_DAY	2	4	f	2010-11-09	299991	\N	303188	\N
307594	GENERIC_DAY	2	4	f	2010-11-03	299993	\N	303188	\N
307595	GENERIC_DAY	2	4	f	2010-11-11	299993	\N	303188	\N
307596	GENERIC_DAY	2	4	f	2010-10-27	299991	\N	303188	\N
307597	GENERIC_DAY	2	4	f	2010-10-26	299993	\N	303188	\N
307598	GENERIC_DAY	2	4	f	2010-11-02	299993	\N	303188	\N
307599	GENERIC_DAY	2	0	f	2010-10-31	299993	\N	303188	\N
307600	GENERIC_DAY	2	0	f	2010-11-14	299993	\N	303188	\N
307601	GENERIC_DAY	2	0	f	2010-11-07	299991	\N	303188	\N
307602	GENERIC_DAY	2	0	f	2010-10-31	299991	\N	303188	\N
307603	GENERIC_DAY	2	4	f	2010-11-10	299991	\N	303188	\N
307604	GENERIC_DAY	2	4	f	2010-11-15	299991	\N	303188	\N
307605	GENERIC_DAY	2	4	f	2010-11-05	299993	\N	303188	\N
307606	GENERIC_DAY	2	4	f	2010-10-27	299993	\N	303188	\N
307607	GENERIC_DAY	2	0	f	2010-11-14	299991	\N	303188	\N
307608	GENERIC_DAY	2	4	f	2010-11-15	299993	\N	303188	\N
307609	GENERIC_DAY	2	4	f	2010-11-11	299991	\N	303188	\N
307610	GENERIC_DAY	2	0	f	2010-10-24	299991	\N	303188	\N
307611	GENERIC_DAY	2	4	f	2010-11-10	299993	\N	303188	\N
307612	GENERIC_DAY	2	4	f	2010-10-29	299993	\N	303188	\N
307613	GENERIC_DAY	2	4	f	2010-11-04	299993	\N	303188	\N
307614	GENERIC_DAY	2	4	f	2010-10-21	299993	\N	303188	\N
307615	GENERIC_DAY	2	4	f	2010-10-25	299991	\N	303188	\N
307616	GENERIC_DAY	2	4	f	2010-10-28	299993	\N	303188	\N
307617	GENERIC_DAY	2	4	f	2010-11-03	299991	\N	303188	\N
307618	GENERIC_DAY	2	0	f	2010-10-23	299993	\N	303188	\N
307619	GENERIC_DAY	2	4	f	2010-11-08	299993	\N	303188	\N
307620	GENERIC_DAY	2	4	f	2010-10-26	299991	\N	303188	\N
307621	GENERIC_DAY	2	4	f	2010-11-12	299991	\N	303188	\N
307622	GENERIC_DAY	2	4	f	2010-11-09	299993	\N	303188	\N
307623	GENERIC_DAY	2	4	f	2010-10-25	299993	\N	303188	\N
307624	GENERIC_DAY	2	0	f	2010-10-30	299991	\N	303188	\N
307625	GENERIC_DAY	2	4	f	2010-10-21	299991	\N	303188	\N
307626	GENERIC_DAY	2	3	f	2010-11-16	299993	\N	303188	\N
307627	GENERIC_DAY	2	4	f	2010-10-21	299991	\N	303189	\N
307628	GENERIC_DAY	2	4	f	2010-10-28	299991	\N	303189	\N
307629	GENERIC_DAY	2	4	f	2010-11-11	299991	\N	303189	\N
307630	GENERIC_DAY	2	4	f	2010-11-08	299991	\N	303189	\N
307631	GENERIC_DAY	2	4	f	2010-11-09	299993	\N	303189	\N
307632	GENERIC_DAY	2	4	f	2010-11-02	299991	\N	303189	\N
307633	GENERIC_DAY	2	0	f	2010-10-30	299993	\N	303189	\N
307634	GENERIC_DAY	2	4	f	2010-11-15	299991	\N	303189	\N
307635	GENERIC_DAY	2	4	f	2010-11-01	299991	\N	303189	\N
307636	GENERIC_DAY	2	0	f	2010-11-14	299991	\N	303189	\N
307637	GENERIC_DAY	2	0	f	2010-10-24	299993	\N	303189	\N
307638	GENERIC_DAY	2	4	f	2010-11-10	299991	\N	303189	\N
307639	GENERIC_DAY	2	0	f	2010-11-07	299991	\N	303189	\N
307640	GENERIC_DAY	2	3	f	2010-11-16	299991	\N	303189	\N
307641	GENERIC_DAY	2	4	f	2010-10-26	299993	\N	303189	\N
307642	GENERIC_DAY	2	4	f	2010-10-29	299991	\N	303189	\N
307643	GENERIC_DAY	2	4	f	2010-10-25	299993	\N	303189	\N
307644	GENERIC_DAY	2	4	f	2010-11-03	299993	\N	303189	\N
307645	GENERIC_DAY	2	0	f	2010-11-14	299993	\N	303189	\N
307646	GENERIC_DAY	2	0	f	2010-10-24	299991	\N	303189	\N
307647	GENERIC_DAY	2	0	f	2010-10-23	299991	\N	303189	\N
307648	GENERIC_DAY	2	0	f	2010-11-06	299993	\N	303189	\N
307649	GENERIC_DAY	2	4	f	2010-11-10	299993	\N	303189	\N
307650	GENERIC_DAY	2	4	f	2010-11-04	299991	\N	303189	\N
307651	GENERIC_DAY	2	0	f	2010-11-13	299991	\N	303189	\N
307652	GENERIC_DAY	2	4	f	2010-11-15	299993	\N	303189	\N
307653	GENERIC_DAY	2	4	f	2010-11-05	299991	\N	303189	\N
307654	GENERIC_DAY	2	4	f	2010-11-12	299993	\N	303189	\N
307655	GENERIC_DAY	2	4	f	2010-10-27	299993	\N	303189	\N
307656	GENERIC_DAY	2	4	f	2010-11-11	299993	\N	303189	\N
307657	GENERIC_DAY	2	4	f	2010-10-21	299993	\N	303189	\N
307658	GENERIC_DAY	2	0	f	2010-11-07	299993	\N	303189	\N
307659	GENERIC_DAY	2	4	f	2010-11-12	299991	\N	303189	\N
307660	GENERIC_DAY	2	4	f	2010-10-22	299993	\N	303189	\N
307661	GENERIC_DAY	2	4	f	2010-11-04	299993	\N	303189	\N
307662	GENERIC_DAY	2	4	f	2010-11-09	299991	\N	303189	\N
307663	GENERIC_DAY	2	4	f	2010-11-05	299993	\N	303189	\N
307664	GENERIC_DAY	2	4	f	2010-10-25	299991	\N	303189	\N
307665	GENERIC_DAY	2	4	f	2010-10-29	299993	\N	303189	\N
307666	GENERIC_DAY	2	4	f	2010-10-22	299991	\N	303189	\N
307667	GENERIC_DAY	2	0	f	2010-10-30	299991	\N	303189	\N
307668	GENERIC_DAY	2	4	f	2010-10-26	299991	\N	303189	\N
307669	GENERIC_DAY	2	4	f	2010-10-28	299993	\N	303189	\N
307670	GENERIC_DAY	2	3	f	2010-11-16	299993	\N	303189	\N
307671	GENERIC_DAY	2	4	f	2010-10-27	299991	\N	303189	\N
307672	GENERIC_DAY	2	4	f	2010-11-08	299993	\N	303189	\N
307673	GENERIC_DAY	2	0	f	2010-11-06	299991	\N	303189	\N
307674	GENERIC_DAY	2	4	f	2010-11-02	299993	\N	303189	\N
307675	GENERIC_DAY	2	4	f	2010-11-01	299993	\N	303189	\N
307676	GENERIC_DAY	2	0	f	2010-11-13	299993	\N	303189	\N
307677	GENERIC_DAY	2	0	f	2010-10-31	299993	\N	303189	\N
307678	GENERIC_DAY	2	0	f	2010-10-31	299991	\N	303189	\N
307679	GENERIC_DAY	2	4	f	2010-11-03	299991	\N	303189	\N
307680	GENERIC_DAY	2	0	f	2010-10-23	299993	\N	303189	\N
307681	GENERIC_DAY	2	2	f	2010-12-02	299993	\N	303190	\N
307682	GENERIC_DAY	2	2	f	2010-12-02	299991	\N	303190	\N
307683	GENERIC_DAY	2	2	f	2010-12-22	299993	\N	303190	\N
307684	GENERIC_DAY	2	2	f	2010-12-23	299991	\N	303190	\N
307685	GENERIC_DAY	2	2	f	2011-01-05	299991	\N	303190	\N
307686	GENERIC_DAY	2	2	f	2010-12-17	299991	\N	303190	\N
307687	GENERIC_DAY	2	2	f	2011-01-04	299993	\N	303190	\N
307688	GENERIC_DAY	2	0	f	2011-01-02	299993	\N	303190	\N
307689	GENERIC_DAY	2	0	f	2010-12-04	299993	\N	303190	\N
307690	GENERIC_DAY	2	2	f	2010-11-30	299993	\N	303190	\N
307691	GENERIC_DAY	2	2	f	2010-12-03	299993	\N	303190	\N
307692	GENERIC_DAY	2	2	f	2010-11-23	299993	\N	303190	\N
307693	GENERIC_DAY	2	0	f	2010-12-26	299993	\N	303190	\N
307694	GENERIC_DAY	2	2	f	2010-12-15	299993	\N	303190	\N
307695	GENERIC_DAY	2	0	f	2010-12-04	299991	\N	303190	\N
307696	GENERIC_DAY	2	2	f	2010-11-17	299991	\N	303190	\N
307697	GENERIC_DAY	2	0	f	2010-12-12	299993	\N	303190	\N
307698	GENERIC_DAY	2	2	f	2010-12-24	299993	\N	303190	\N
307699	GENERIC_DAY	2	2	f	2010-12-13	299991	\N	303190	\N
307700	GENERIC_DAY	2	2	f	2010-12-21	299993	\N	303190	\N
307701	GENERIC_DAY	2	0	f	2010-12-26	299991	\N	303190	\N
307702	GENERIC_DAY	2	0	f	2010-12-19	299991	\N	303190	\N
307703	GENERIC_DAY	2	0	f	2010-12-05	299993	\N	303190	\N
307704	GENERIC_DAY	2	0	f	2010-11-27	299993	\N	303190	\N
307705	GENERIC_DAY	2	2	f	2011-01-04	299991	\N	303190	\N
307706	GENERIC_DAY	2	0	f	2010-12-25	299991	\N	303190	\N
307707	GENERIC_DAY	2	2	f	2010-11-26	299991	\N	303190	\N
307708	GENERIC_DAY	2	2	f	2010-12-24	299991	\N	303190	\N
307709	GENERIC_DAY	2	0	f	2010-11-27	299991	\N	303190	\N
307710	GENERIC_DAY	2	2	f	2010-11-29	299993	\N	303190	\N
307711	GENERIC_DAY	2	2	f	2011-01-05	299993	\N	303190	\N
307712	GENERIC_DAY	2	2	f	2011-01-03	299991	\N	303190	\N
307713	GENERIC_DAY	2	2	f	2010-12-08	299993	\N	303190	\N
307714	GENERIC_DAY	2	2	f	2010-11-26	299993	\N	303190	\N
307715	GENERIC_DAY	2	2	f	2010-12-06	299993	\N	303190	\N
307716	GENERIC_DAY	2	0	f	2010-12-18	299991	\N	303190	\N
307717	GENERIC_DAY	2	0	f	2010-12-11	299991	\N	303190	\N
307718	GENERIC_DAY	2	2	f	2010-12-22	299991	\N	303190	\N
307719	GENERIC_DAY	2	2	f	2010-11-22	299991	\N	303190	\N
307720	GENERIC_DAY	2	2	f	2010-12-20	299991	\N	303190	\N
307721	GENERIC_DAY	2	2	f	2010-12-09	299991	\N	303190	\N
307722	GENERIC_DAY	2	2	f	2010-12-14	299991	\N	303190	\N
307723	GENERIC_DAY	2	2	f	2010-12-09	299993	\N	303190	\N
307724	GENERIC_DAY	2	0	f	2010-12-11	299993	\N	303190	\N
307725	GENERIC_DAY	2	2	f	2010-12-03	299991	\N	303190	\N
307726	GENERIC_DAY	2	2	f	2010-12-31	299993	\N	303190	\N
307727	GENERIC_DAY	2	0	f	2010-11-20	299991	\N	303190	\N
307728	GENERIC_DAY	2	2	f	2010-12-13	299993	\N	303190	\N
307729	GENERIC_DAY	2	2	f	2010-12-08	299991	\N	303190	\N
307730	GENERIC_DAY	2	2	f	2010-11-30	299991	\N	303190	\N
307731	GENERIC_DAY	2	0	f	2011-01-01	299991	\N	303190	\N
307732	GENERIC_DAY	2	2	f	2010-12-10	299993	\N	303190	\N
307733	GENERIC_DAY	2	2	f	2010-11-25	299993	\N	303190	\N
307734	GENERIC_DAY	2	2	f	2010-11-18	299993	\N	303190	\N
307735	GENERIC_DAY	2	2	f	2010-11-24	299993	\N	303190	\N
307736	GENERIC_DAY	2	2	f	2010-11-25	299991	\N	303190	\N
307737	GENERIC_DAY	2	2	f	2010-12-27	299991	\N	303190	\N
307738	GENERIC_DAY	2	2	f	2011-01-06	299991	\N	303190	\N
307739	GENERIC_DAY	2	2	f	2010-12-15	299991	\N	303190	\N
307740	GENERIC_DAY	2	2	f	2010-12-23	299993	\N	303190	\N
307741	GENERIC_DAY	2	2	f	2010-12-01	299991	\N	303190	\N
307742	GENERIC_DAY	2	0	f	2010-11-20	299993	\N	303190	\N
307743	GENERIC_DAY	2	2	f	2010-11-17	299993	\N	303190	\N
307744	GENERIC_DAY	2	2	f	2010-12-07	299991	\N	303190	\N
307745	GENERIC_DAY	2	0	f	2010-11-21	299993	\N	303190	\N
307746	GENERIC_DAY	2	2	f	2010-12-29	299993	\N	303190	\N
307747	GENERIC_DAY	2	2	f	2010-11-23	299991	\N	303190	\N
307748	GENERIC_DAY	2	2	f	2010-12-17	299993	\N	303190	\N
307749	GENERIC_DAY	2	2	f	2010-12-14	299993	\N	303190	\N
307750	GENERIC_DAY	2	2	f	2011-01-03	299993	\N	303190	\N
307751	GENERIC_DAY	2	2	f	2011-01-06	299993	\N	303190	\N
307752	GENERIC_DAY	2	2	f	2010-12-21	299991	\N	303190	\N
307753	GENERIC_DAY	2	2	f	2010-12-10	299991	\N	303190	\N
307754	GENERIC_DAY	2	0	f	2010-12-19	299993	\N	303190	\N
307755	GENERIC_DAY	2	2	f	2010-11-19	299991	\N	303190	\N
307756	GENERIC_DAY	2	2	f	2010-12-07	299993	\N	303190	\N
307757	GENERIC_DAY	2	0	f	2010-12-25	299993	\N	303190	\N
307758	GENERIC_DAY	2	2	f	2010-12-16	299993	\N	303190	\N
307759	GENERIC_DAY	2	0	f	2011-01-02	299991	\N	303190	\N
307760	GENERIC_DAY	2	0	f	2010-11-21	299991	\N	303190	\N
307761	GENERIC_DAY	2	2	f	2010-12-20	299993	\N	303190	\N
307762	GENERIC_DAY	2	0	f	2010-11-28	299991	\N	303190	\N
307763	GENERIC_DAY	2	2	f	2010-12-01	299993	\N	303190	\N
307764	GENERIC_DAY	2	2	f	2010-11-29	299991	\N	303190	\N
307765	GENERIC_DAY	2	2	f	2010-12-06	299991	\N	303190	\N
307766	GENERIC_DAY	2	2	f	2010-12-28	299991	\N	303190	\N
307767	GENERIC_DAY	2	2	f	2010-11-24	299991	\N	303190	\N
307768	GENERIC_DAY	2	0	f	2010-12-12	299991	\N	303190	\N
307769	GENERIC_DAY	2	0	f	2011-01-01	299993	\N	303190	\N
307770	GENERIC_DAY	2	0	f	2010-12-05	299991	\N	303190	\N
307771	GENERIC_DAY	2	2	f	2010-12-27	299993	\N	303190	\N
307772	GENERIC_DAY	2	0	f	2010-11-28	299993	\N	303190	\N
307773	GENERIC_DAY	2	1	f	2011-01-07	299993	\N	303190	\N
307774	GENERIC_DAY	2	2	f	2010-11-22	299993	\N	303190	\N
307775	GENERIC_DAY	2	2	f	2010-11-18	299991	\N	303190	\N
307776	GENERIC_DAY	2	2	f	2010-12-16	299991	\N	303190	\N
307777	GENERIC_DAY	2	2	f	2010-11-19	299993	\N	303190	\N
307778	GENERIC_DAY	2	1	f	2011-01-07	299991	\N	303190	\N
307779	GENERIC_DAY	2	2	f	2010-12-30	299991	\N	303190	\N
307780	GENERIC_DAY	2	2	f	2010-12-31	299991	\N	303190	\N
307781	GENERIC_DAY	2	2	f	2010-12-28	299993	\N	303190	\N
307782	GENERIC_DAY	2	2	f	2010-12-30	299993	\N	303190	\N
307783	GENERIC_DAY	2	2	f	2010-12-29	299991	\N	303190	\N
307784	GENERIC_DAY	2	0	f	2010-12-18	299993	\N	303190	\N
307785	GENERIC_DAY	2	0	f	2011-01-02	299991	\N	303191	\N
307786	GENERIC_DAY	2	2	f	2010-12-31	299991	\N	303191	\N
307787	GENERIC_DAY	2	0	f	2010-11-20	299993	\N	303191	\N
307788	GENERIC_DAY	2	2	f	2010-11-25	299991	\N	303191	\N
307789	GENERIC_DAY	2	2	f	2010-11-29	299991	\N	303191	\N
307790	GENERIC_DAY	2	2	f	2011-01-04	299993	\N	303191	\N
307791	GENERIC_DAY	2	2	f	2010-11-17	299993	\N	303191	\N
307792	GENERIC_DAY	2	0	f	2011-01-01	299993	\N	303191	\N
307793	GENERIC_DAY	2	2	f	2011-01-06	299993	\N	303191	\N
307794	GENERIC_DAY	2	0	f	2010-11-28	299993	\N	303191	\N
307795	GENERIC_DAY	2	2	f	2010-11-22	299991	\N	303191	\N
307796	GENERIC_DAY	2	2	f	2010-12-28	299991	\N	303191	\N
307797	GENERIC_DAY	2	2	f	2010-11-18	299993	\N	303191	\N
307798	GENERIC_DAY	2	2	f	2010-12-28	299993	\N	303191	\N
307799	GENERIC_DAY	2	0	f	2010-12-26	299993	\N	303191	\N
307800	GENERIC_DAY	2	2	f	2010-12-24	299991	\N	303191	\N
307801	GENERIC_DAY	2	2	f	2010-12-21	299991	\N	303191	\N
307802	GENERIC_DAY	2	2	f	2011-01-03	299991	\N	303191	\N
307803	GENERIC_DAY	2	2	f	2010-11-25	299993	\N	303191	\N
307804	GENERIC_DAY	2	2	f	2010-12-02	299993	\N	303191	\N
307805	GENERIC_DAY	2	2	f	2010-12-03	299993	\N	303191	\N
307806	GENERIC_DAY	2	2	f	2010-12-06	299993	\N	303191	\N
307807	GENERIC_DAY	2	2	f	2010-12-13	299991	\N	303191	\N
307808	GENERIC_DAY	2	0	f	2010-12-26	299991	\N	303191	\N
307809	GENERIC_DAY	2	2	f	2010-12-01	299993	\N	303191	\N
307810	GENERIC_DAY	2	1	f	2011-01-07	299991	\N	303191	\N
307811	GENERIC_DAY	2	2	f	2010-12-13	299993	\N	303191	\N
307812	GENERIC_DAY	2	2	f	2010-11-18	299991	\N	303191	\N
307813	GENERIC_DAY	2	0	f	2010-12-25	299991	\N	303191	\N
307814	GENERIC_DAY	2	0	f	2010-12-12	299991	\N	303191	\N
307815	GENERIC_DAY	2	2	f	2010-11-24	299993	\N	303191	\N
307816	GENERIC_DAY	2	0	f	2010-12-18	299991	\N	303191	\N
307817	GENERIC_DAY	2	0	f	2010-12-18	299993	\N	303191	\N
307818	GENERIC_DAY	2	0	f	2010-12-11	299991	\N	303191	\N
307819	GENERIC_DAY	2	0	f	2010-11-21	299993	\N	303191	\N
307820	GENERIC_DAY	2	2	f	2010-12-16	299991	\N	303191	\N
307821	GENERIC_DAY	2	2	f	2010-12-10	299991	\N	303191	\N
307822	GENERIC_DAY	2	2	f	2010-12-20	299991	\N	303191	\N
307823	GENERIC_DAY	2	0	f	2010-11-27	299991	\N	303191	\N
307824	GENERIC_DAY	2	2	f	2010-12-23	299991	\N	303191	\N
307825	GENERIC_DAY	2	0	f	2010-12-05	299991	\N	303191	\N
307826	GENERIC_DAY	2	0	f	2010-12-12	299993	\N	303191	\N
307827	GENERIC_DAY	2	2	f	2010-11-30	299993	\N	303191	\N
307828	GENERIC_DAY	2	2	f	2010-11-30	299991	\N	303191	\N
307829	GENERIC_DAY	2	1	f	2011-01-07	299993	\N	303191	\N
307830	GENERIC_DAY	2	0	f	2010-11-20	299991	\N	303191	\N
307831	GENERIC_DAY	2	2	f	2010-12-27	299991	\N	303191	\N
307832	GENERIC_DAY	2	2	f	2010-12-01	299991	\N	303191	\N
307833	GENERIC_DAY	2	2	f	2010-12-29	299991	\N	303191	\N
307834	GENERIC_DAY	2	2	f	2010-12-31	299993	\N	303191	\N
307835	GENERIC_DAY	2	2	f	2010-11-17	299991	\N	303191	\N
307836	GENERIC_DAY	2	2	f	2010-12-17	299993	\N	303191	\N
307837	GENERIC_DAY	2	2	f	2010-11-23	299991	\N	303191	\N
307838	GENERIC_DAY	2	0	f	2010-12-04	299993	\N	303191	\N
307839	GENERIC_DAY	2	0	f	2010-11-28	299991	\N	303191	\N
307840	GENERIC_DAY	2	0	f	2011-01-02	299993	\N	303191	\N
307841	GENERIC_DAY	2	2	f	2010-12-08	299991	\N	303191	\N
307842	GENERIC_DAY	2	2	f	2011-01-03	299993	\N	303191	\N
307843	GENERIC_DAY	2	0	f	2010-12-05	299993	\N	303191	\N
307844	GENERIC_DAY	2	2	f	2010-12-02	299991	\N	303191	\N
307845	GENERIC_DAY	2	2	f	2010-12-16	299993	\N	303191	\N
307846	GENERIC_DAY	2	2	f	2011-01-04	299991	\N	303191	\N
307847	GENERIC_DAY	2	2	f	2010-12-27	299993	\N	303191	\N
307848	GENERIC_DAY	2	2	f	2010-12-20	299993	\N	303191	\N
307849	GENERIC_DAY	2	0	f	2010-12-04	299991	\N	303191	\N
307850	GENERIC_DAY	2	2	f	2010-12-15	299993	\N	303191	\N
307851	GENERIC_DAY	2	2	f	2010-12-22	299993	\N	303191	\N
307852	GENERIC_DAY	2	2	f	2011-01-05	299993	\N	303191	\N
307853	GENERIC_DAY	2	2	f	2011-01-06	299991	\N	303191	\N
307854	GENERIC_DAY	2	2	f	2010-12-30	299991	\N	303191	\N
307855	GENERIC_DAY	2	2	f	2010-12-09	299991	\N	303191	\N
307856	GENERIC_DAY	2	2	f	2010-11-22	299993	\N	303191	\N
307857	GENERIC_DAY	2	2	f	2010-12-22	299991	\N	303191	\N
307858	GENERIC_DAY	2	0	f	2011-01-01	299991	\N	303191	\N
307859	GENERIC_DAY	2	2	f	2010-12-15	299991	\N	303191	\N
307860	GENERIC_DAY	2	2	f	2010-12-30	299993	\N	303191	\N
307861	GENERIC_DAY	2	2	f	2010-12-14	299991	\N	303191	\N
307862	GENERIC_DAY	2	2	f	2010-12-23	299993	\N	303191	\N
307863	GENERIC_DAY	2	0	f	2010-12-19	299991	\N	303191	\N
307864	GENERIC_DAY	2	2	f	2011-01-05	299991	\N	303191	\N
307865	GENERIC_DAY	2	2	f	2010-12-07	299991	\N	303191	\N
307866	GENERIC_DAY	2	2	f	2010-12-08	299993	\N	303191	\N
307867	GENERIC_DAY	2	2	f	2010-12-03	299991	\N	303191	\N
307868	GENERIC_DAY	2	2	f	2010-12-14	299993	\N	303191	\N
307869	GENERIC_DAY	2	2	f	2010-12-17	299991	\N	303191	\N
307870	GENERIC_DAY	2	2	f	2010-11-26	299991	\N	303191	\N
307871	GENERIC_DAY	2	2	f	2010-12-10	299993	\N	303191	\N
307872	GENERIC_DAY	2	2	f	2010-11-29	299993	\N	303191	\N
307873	GENERIC_DAY	2	2	f	2010-12-09	299993	\N	303191	\N
307874	GENERIC_DAY	2	2	f	2010-11-19	299993	\N	303191	\N
307875	GENERIC_DAY	2	2	f	2010-12-07	299993	\N	303191	\N
307876	GENERIC_DAY	2	2	f	2010-11-24	299991	\N	303191	\N
307877	GENERIC_DAY	2	2	f	2010-11-19	299991	\N	303191	\N
307878	GENERIC_DAY	2	2	f	2010-11-23	299993	\N	303191	\N
307879	GENERIC_DAY	2	0	f	2010-12-11	299993	\N	303191	\N
307880	GENERIC_DAY	2	2	f	2010-12-06	299991	\N	303191	\N
307881	GENERIC_DAY	2	0	f	2010-11-21	299991	\N	303191	\N
307882	GENERIC_DAY	2	2	f	2010-12-29	299993	\N	303191	\N
307883	GENERIC_DAY	2	0	f	2010-12-25	299993	\N	303191	\N
307884	GENERIC_DAY	2	2	f	2010-12-24	299993	\N	303191	\N
307885	GENERIC_DAY	2	2	f	2010-11-26	299993	\N	303191	\N
307886	GENERIC_DAY	2	0	f	2010-11-27	299993	\N	303191	\N
307887	GENERIC_DAY	2	0	f	2010-12-19	299993	\N	303191	\N
307888	GENERIC_DAY	2	2	f	2010-12-21	299993	\N	303191	\N
307889	GENERIC_DAY	2	4	f	2010-11-24	299991	\N	303192	\N
307890	GENERIC_DAY	2	4	f	2010-11-22	299993	\N	303192	\N
307891	GENERIC_DAY	2	4	f	2010-11-29	299991	\N	303192	\N
307892	GENERIC_DAY	2	0	f	2010-11-20	299993	\N	303192	\N
307893	GENERIC_DAY	2	4	f	2010-12-08	299991	\N	303192	\N
307894	GENERIC_DAY	2	0	f	2010-11-27	299993	\N	303192	\N
307895	GENERIC_DAY	2	4	f	2010-11-22	299991	\N	303192	\N
307896	GENERIC_DAY	2	4	f	2010-12-10	299991	\N	303192	\N
307897	GENERIC_DAY	2	0	f	2010-11-28	299993	\N	303192	\N
307898	GENERIC_DAY	2	4	f	2010-12-02	299993	\N	303192	\N
307899	GENERIC_DAY	2	4	f	2010-11-17	299991	\N	303192	\N
307900	GENERIC_DAY	2	4	f	2010-12-10	299993	\N	303192	\N
307901	GENERIC_DAY	2	4	f	2010-12-06	299993	\N	303192	\N
307902	GENERIC_DAY	2	4	f	2010-12-02	299991	\N	303192	\N
307903	GENERIC_DAY	2	0	f	2010-12-11	299993	\N	303192	\N
307904	GENERIC_DAY	2	3	f	2010-12-13	299993	\N	303192	\N
307905	GENERIC_DAY	2	0	f	2010-11-20	299991	\N	303192	\N
307906	GENERIC_DAY	2	4	f	2010-12-09	299991	\N	303192	\N
307907	GENERIC_DAY	2	4	f	2010-11-30	299991	\N	303192	\N
307908	GENERIC_DAY	2	4	f	2010-11-24	299993	\N	303192	\N
307909	GENERIC_DAY	2	0	f	2010-11-21	299993	\N	303192	\N
307910	GENERIC_DAY	2	0	f	2010-12-12	299993	\N	303192	\N
307911	GENERIC_DAY	2	4	f	2010-12-09	299993	\N	303192	\N
307912	GENERIC_DAY	2	4	f	2010-11-17	299993	\N	303192	\N
307913	GENERIC_DAY	2	0	f	2010-11-21	299991	\N	303192	\N
307914	GENERIC_DAY	2	0	f	2010-12-04	299993	\N	303192	\N
307915	GENERIC_DAY	2	4	f	2010-12-01	299991	\N	303192	\N
307916	GENERIC_DAY	2	4	f	2010-11-26	299991	\N	303192	\N
307917	GENERIC_DAY	2	4	f	2010-12-03	299991	\N	303192	\N
307918	GENERIC_DAY	2	0	f	2010-11-28	299991	\N	303192	\N
307919	GENERIC_DAY	2	0	f	2010-12-05	299993	\N	303192	\N
307920	GENERIC_DAY	2	4	f	2010-11-23	299993	\N	303192	\N
307921	GENERIC_DAY	2	4	f	2010-12-07	299993	\N	303192	\N
307922	GENERIC_DAY	2	4	f	2010-11-26	299993	\N	303192	\N
307923	GENERIC_DAY	2	0	f	2010-11-27	299991	\N	303192	\N
307924	GENERIC_DAY	2	4	f	2010-12-01	299993	\N	303192	\N
307925	GENERIC_DAY	2	0	f	2010-12-12	299991	\N	303192	\N
307926	GENERIC_DAY	2	4	f	2010-12-06	299991	\N	303192	\N
307927	GENERIC_DAY	2	4	f	2010-11-18	299991	\N	303192	\N
307928	GENERIC_DAY	2	0	f	2010-12-04	299991	\N	303192	\N
307929	GENERIC_DAY	2	4	f	2010-11-19	299991	\N	303192	\N
307930	GENERIC_DAY	2	3	f	2010-12-13	299991	\N	303192	\N
307931	GENERIC_DAY	2	4	f	2010-12-08	299993	\N	303192	\N
307932	GENERIC_DAY	2	4	f	2010-11-30	299993	\N	303192	\N
307933	GENERIC_DAY	2	4	f	2010-11-25	299993	\N	303192	\N
307934	GENERIC_DAY	2	0	f	2010-12-11	299991	\N	303192	\N
307935	GENERIC_DAY	2	4	f	2010-11-29	299993	\N	303192	\N
307936	GENERIC_DAY	2	4	f	2010-11-18	299993	\N	303192	\N
307937	GENERIC_DAY	2	4	f	2010-11-19	299993	\N	303192	\N
307938	GENERIC_DAY	2	4	f	2010-11-25	299991	\N	303192	\N
307939	GENERIC_DAY	2	4	f	2010-12-03	299993	\N	303192	\N
307940	GENERIC_DAY	2	0	f	2010-12-05	299991	\N	303192	\N
307941	GENERIC_DAY	2	4	f	2010-11-23	299991	\N	303192	\N
307942	GENERIC_DAY	2	4	f	2010-12-07	299991	\N	303192	\N
307943	GENERIC_DAY	2	8	f	2011-01-11	299991	\N	303193	\N
307944	GENERIC_DAY	2	8	f	2011-01-20	299993	\N	303193	\N
307945	GENERIC_DAY	2	8	f	2011-01-18	299991	\N	303193	\N
307946	GENERIC_DAY	2	0	f	2011-01-15	299991	\N	303193	\N
307947	GENERIC_DAY	2	3	f	2011-01-21	299993	\N	303193	\N
307948	GENERIC_DAY	2	8	f	2011-01-19	299993	\N	303193	\N
307949	GENERIC_DAY	2	8	f	2011-01-14	299993	\N	303193	\N
307950	GENERIC_DAY	2	8	f	2011-01-12	299991	\N	303193	\N
307951	GENERIC_DAY	2	8	f	2011-01-18	299993	\N	303193	\N
307952	GENERIC_DAY	2	0	f	2011-01-16	299993	\N	303193	\N
307953	GENERIC_DAY	2	0	f	2011-01-08	299991	\N	303193	\N
307954	GENERIC_DAY	2	8	f	2011-01-13	299993	\N	303193	\N
307955	GENERIC_DAY	2	3	f	2011-01-21	299991	\N	303193	\N
307956	GENERIC_DAY	2	8	f	2011-01-11	299993	\N	303193	\N
307957	GENERIC_DAY	2	8	f	2011-01-19	299991	\N	303193	\N
307958	GENERIC_DAY	2	0	f	2011-01-15	299993	\N	303193	\N
307959	GENERIC_DAY	2	8	f	2011-01-12	299993	\N	303193	\N
307960	GENERIC_DAY	2	8	f	2011-01-20	299991	\N	303193	\N
307961	GENERIC_DAY	2	0	f	2011-01-08	299993	\N	303193	\N
307962	GENERIC_DAY	2	8	f	2011-01-10	299991	\N	303193	\N
307963	GENERIC_DAY	2	8	f	2011-01-14	299991	\N	303193	\N
307964	GENERIC_DAY	2	8	f	2011-01-13	299991	\N	303193	\N
307965	GENERIC_DAY	2	8	f	2011-01-17	299993	\N	303193	\N
307966	GENERIC_DAY	2	0	f	2011-01-09	299991	\N	303193	\N
307967	GENERIC_DAY	2	0	f	2011-01-16	299991	\N	303193	\N
307968	GENERIC_DAY	2	0	f	2011-01-09	299993	\N	303193	\N
307969	GENERIC_DAY	2	8	f	2011-01-10	299993	\N	303193	\N
307970	GENERIC_DAY	2	8	f	2011-01-17	299991	\N	303193	\N
307971	GENERIC_DAY	2	0	f	2011-01-23	299991	\N	303194	\N
307972	GENERIC_DAY	2	8	f	2011-02-02	299993	\N	303194	\N
307973	GENERIC_DAY	2	0	f	2011-01-30	299991	\N	303194	\N
307974	GENERIC_DAY	2	0	f	2011-01-22	299993	\N	303194	\N
307975	GENERIC_DAY	2	8	f	2011-02-03	299993	\N	303194	\N
307976	GENERIC_DAY	2	8	f	2011-01-31	299991	\N	303194	\N
307977	GENERIC_DAY	2	8	f	2011-02-01	299991	\N	303194	\N
307978	GENERIC_DAY	2	8	f	2011-01-26	299993	\N	303194	\N
307979	GENERIC_DAY	2	8	f	2011-01-24	299991	\N	303194	\N
307980	GENERIC_DAY	2	8	f	2011-01-25	299993	\N	303194	\N
307981	GENERIC_DAY	2	8	f	2011-01-26	299991	\N	303194	\N
307982	GENERIC_DAY	2	8	f	2011-01-25	299991	\N	303194	\N
307983	GENERIC_DAY	2	8	f	2011-02-03	299991	\N	303194	\N
307984	GENERIC_DAY	2	8	f	2011-02-02	299991	\N	303194	\N
307985	GENERIC_DAY	2	8	f	2011-01-24	299993	\N	303194	\N
307986	GENERIC_DAY	2	0	f	2011-01-29	299991	\N	303194	\N
307987	GENERIC_DAY	2	8	f	2011-01-27	299991	\N	303194	\N
307988	GENERIC_DAY	2	8	f	2011-01-28	299993	\N	303194	\N
307989	GENERIC_DAY	2	0	f	2011-01-22	299991	\N	303194	\N
307990	GENERIC_DAY	2	8	f	2011-02-01	299993	\N	303194	\N
307991	GENERIC_DAY	2	3	f	2011-02-04	299991	\N	303194	\N
307992	GENERIC_DAY	2	0	f	2011-01-30	299993	\N	303194	\N
307993	GENERIC_DAY	2	0	f	2011-01-29	299993	\N	303194	\N
307994	GENERIC_DAY	2	8	f	2011-01-27	299993	\N	303194	\N
307995	GENERIC_DAY	2	8	f	2011-01-31	299993	\N	303194	\N
307996	GENERIC_DAY	2	8	f	2011-01-28	299991	\N	303194	\N
307997	GENERIC_DAY	2	3	f	2011-02-04	299993	\N	303194	\N
307998	GENERIC_DAY	2	0	f	2011-01-23	299993	\N	303194	\N
307999	GENERIC_DAY	2	8	f	2011-02-17	299993	\N	303195	\N
308000	GENERIC_DAY	2	0	f	2011-02-06	299991	\N	303195	\N
308001	GENERIC_DAY	2	8	f	2011-02-11	299993	\N	303195	\N
308002	GENERIC_DAY	2	8	f	2011-02-14	299993	\N	303195	\N
308003	GENERIC_DAY	2	8	f	2011-02-09	299993	\N	303195	\N
308004	GENERIC_DAY	2	8	f	2011-02-07	299991	\N	303195	\N
308005	GENERIC_DAY	2	8	f	2011-02-11	299991	\N	303195	\N
308006	GENERIC_DAY	2	8	f	2011-02-15	299993	\N	303195	\N
308007	GENERIC_DAY	2	8	f	2011-02-08	299991	\N	303195	\N
308008	GENERIC_DAY	2	8	f	2011-02-08	299993	\N	303195	\N
308009	GENERIC_DAY	2	0	f	2011-02-12	299993	\N	303195	\N
308010	GENERIC_DAY	2	0	f	2011-02-06	299993	\N	303195	\N
308011	GENERIC_DAY	2	8	f	2011-02-10	299991	\N	303195	\N
308012	GENERIC_DAY	2	3	f	2011-02-18	299991	\N	303195	\N
308013	GENERIC_DAY	2	0	f	2011-02-13	299993	\N	303195	\N
308014	GENERIC_DAY	2	0	f	2011-02-05	299993	\N	303195	\N
308015	GENERIC_DAY	2	8	f	2011-02-15	299991	\N	303195	\N
308016	GENERIC_DAY	2	3	f	2011-02-18	299993	\N	303195	\N
308017	GENERIC_DAY	2	8	f	2011-02-14	299991	\N	303195	\N
308018	GENERIC_DAY	2	8	f	2011-02-07	299993	\N	303195	\N
308019	GENERIC_DAY	2	8	f	2011-02-09	299991	\N	303195	\N
308020	GENERIC_DAY	2	8	f	2011-02-16	299993	\N	303195	\N
308021	GENERIC_DAY	2	8	f	2011-02-16	299991	\N	303195	\N
308022	GENERIC_DAY	2	0	f	2011-02-05	299991	\N	303195	\N
308023	GENERIC_DAY	2	8	f	2011-02-17	299991	\N	303195	\N
308024	GENERIC_DAY	2	8	f	2011-02-10	299993	\N	303195	\N
308025	GENERIC_DAY	2	0	f	2011-02-12	299991	\N	303195	\N
308026	GENERIC_DAY	2	0	f	2011-02-13	299991	\N	303195	\N
309577	GENERIC_DAY	1	2	f	2010-09-16	299987	\N	308863	\N
309578	GENERIC_DAY	1	2	f	2010-08-25	299987	\N	308863	\N
309579	GENERIC_DAY	1	0	f	2010-08-29	299989	\N	308863	\N
309580	GENERIC_DAY	1	2	f	2010-08-31	299987	\N	308863	\N
309581	GENERIC_DAY	1	2	f	2010-09-02	299989	\N	308863	\N
309582	GENERIC_DAY	1	2	f	2010-08-16	299989	\N	308863	\N
309583	GENERIC_DAY	1	2	f	2010-09-16	299989	\N	308863	\N
309584	GENERIC_DAY	1	2	f	2010-08-06	299987	\N	308863	\N
309585	GENERIC_DAY	1	0	f	2010-08-07	299989	\N	308863	\N
309586	GENERIC_DAY	1	0	f	2010-09-05	299989	\N	308863	\N
309587	GENERIC_DAY	1	0	f	2010-09-19	299989	\N	308863	\N
309588	GENERIC_DAY	1	2	f	2010-08-05	299987	\N	308863	\N
309589	GENERIC_DAY	1	0	f	2010-09-11	299987	\N	308863	\N
309590	GENERIC_DAY	1	2	f	2010-09-06	299987	\N	308863	\N
309591	GENERIC_DAY	1	2	f	2010-09-21	299989	\N	308863	\N
309592	GENERIC_DAY	1	2	f	2010-08-16	299987	\N	308863	\N
309593	GENERIC_DAY	1	2	f	2010-08-31	299989	\N	308863	\N
309594	GENERIC_DAY	1	0	f	2010-08-08	299987	\N	308863	\N
309595	GENERIC_DAY	1	0	f	2010-08-14	299989	\N	308863	\N
309596	GENERIC_DAY	1	2	f	2010-09-13	299989	\N	308863	\N
309597	GENERIC_DAY	1	2	f	2010-08-27	299987	\N	308863	\N
309598	GENERIC_DAY	1	2	f	2010-08-11	299987	\N	308863	\N
309599	GENERIC_DAY	1	2	f	2010-08-02	299987	\N	308863	\N
309600	GENERIC_DAY	1	2	f	2010-09-10	299989	\N	308863	\N
309601	GENERIC_DAY	1	2	f	2010-09-03	299989	\N	308863	\N
309602	GENERIC_DAY	1	2	f	2010-08-23	299989	\N	308863	\N
309603	GENERIC_DAY	1	2	f	2010-08-13	299987	\N	308863	\N
309604	GENERIC_DAY	1	2	f	2010-09-01	299987	\N	308863	\N
309605	GENERIC_DAY	1	0	f	2010-09-12	299987	\N	308863	\N
309606	GENERIC_DAY	1	2	f	2010-08-05	299989	\N	308863	\N
309607	GENERIC_DAY	1	2	f	2010-08-19	299989	\N	308863	\N
309608	GENERIC_DAY	1	0	f	2010-08-15	299989	\N	308863	\N
309609	GENERIC_DAY	1	2	f	2010-08-09	299989	\N	308863	\N
309610	GENERIC_DAY	1	2	f	2010-08-26	299989	\N	308863	\N
309611	GENERIC_DAY	1	2	f	2010-08-20	299989	\N	308863	\N
309612	GENERIC_DAY	1	2	f	2010-08-02	299989	\N	308863	\N
309613	GENERIC_DAY	1	2	f	2010-09-13	299987	\N	308863	\N
309614	GENERIC_DAY	1	2	f	2010-09-14	299987	\N	308863	\N
309615	GENERIC_DAY	1	2	f	2010-08-13	299989	\N	308863	\N
309616	GENERIC_DAY	1	0	f	2010-08-21	299989	\N	308863	\N
309617	GENERIC_DAY	1	2	f	2010-08-09	299987	\N	308863	\N
309618	GENERIC_DAY	1	0	f	2010-09-04	299989	\N	308863	\N
309619	GENERIC_DAY	1	2	f	2010-08-30	299989	\N	308863	\N
309620	GENERIC_DAY	1	2	f	2010-08-12	299989	\N	308863	\N
309621	GENERIC_DAY	1	0	f	2010-09-18	299987	\N	308863	\N
309622	GENERIC_DAY	1	2	f	2010-08-20	299987	\N	308863	\N
309623	GENERIC_DAY	1	0	f	2010-09-19	299987	\N	308863	\N
309624	GENERIC_DAY	1	2	f	2010-09-21	299987	\N	308863	\N
309625	GENERIC_DAY	1	2	f	2010-09-09	299989	\N	308863	\N
309626	GENERIC_DAY	1	0	f	2010-09-12	299989	\N	308863	\N
309627	GENERIC_DAY	1	2	f	2010-08-03	299987	\N	308863	\N
309628	GENERIC_DAY	1	2	f	2010-09-20	299987	\N	308863	\N
309629	GENERIC_DAY	1	2	f	2010-08-10	299987	\N	308863	\N
309630	GENERIC_DAY	1	0	f	2010-08-21	299987	\N	308863	\N
309631	GENERIC_DAY	1	2	f	2010-09-07	299989	\N	308863	\N
309632	GENERIC_DAY	1	2	f	2010-08-30	299987	\N	308863	\N
309633	GENERIC_DAY	1	2	f	2010-09-02	299987	\N	308863	\N
309634	GENERIC_DAY	1	2	f	2010-08-25	299989	\N	308863	\N
309635	GENERIC_DAY	1	1	f	2010-09-22	299989	\N	308863	\N
309636	GENERIC_DAY	1	0	f	2010-08-29	299987	\N	308863	\N
309637	GENERIC_DAY	1	2	f	2010-08-27	299989	\N	308863	\N
309638	GENERIC_DAY	1	0	f	2010-08-22	299989	\N	308863	\N
309639	GENERIC_DAY	1	0	f	2010-08-28	299989	\N	308863	\N
309640	GENERIC_DAY	1	2	f	2010-08-04	299989	\N	308863	\N
309641	GENERIC_DAY	1	2	f	2010-08-19	299987	\N	308863	\N
309642	GENERIC_DAY	1	1	f	2010-09-22	299987	\N	308863	\N
309643	GENERIC_DAY	1	0	f	2010-08-08	299989	\N	308863	\N
309644	GENERIC_DAY	1	2	f	2010-08-11	299989	\N	308863	\N
309645	GENERIC_DAY	1	2	f	2010-09-06	299989	\N	308863	\N
309646	GENERIC_DAY	1	2	f	2010-09-14	299989	\N	308863	\N
309647	GENERIC_DAY	1	2	f	2010-09-01	299989	\N	308863	\N
309648	GENERIC_DAY	1	2	f	2010-08-24	299987	\N	308863	\N
309649	GENERIC_DAY	1	2	f	2010-09-17	299989	\N	308863	\N
309650	GENERIC_DAY	1	2	f	2010-08-10	299989	\N	308863	\N
309651	GENERIC_DAY	1	2	f	2010-08-04	299987	\N	308863	\N
309652	GENERIC_DAY	1	2	f	2010-09-15	299987	\N	308863	\N
309653	GENERIC_DAY	1	2	f	2010-09-07	299987	\N	308863	\N
309654	GENERIC_DAY	1	2	f	2010-08-17	299987	\N	308863	\N
309655	GENERIC_DAY	1	0	f	2010-08-28	299987	\N	308863	\N
309656	GENERIC_DAY	1	0	f	2010-09-05	299987	\N	308863	\N
309657	GENERIC_DAY	1	0	f	2010-08-14	299987	\N	308863	\N
309658	GENERIC_DAY	1	2	f	2010-09-08	299989	\N	308863	\N
309659	GENERIC_DAY	1	2	f	2010-09-20	299989	\N	308863	\N
309660	GENERIC_DAY	1	0	f	2010-08-15	299987	\N	308863	\N
309661	GENERIC_DAY	1	0	f	2010-09-04	299987	\N	308863	\N
309662	GENERIC_DAY	1	0	f	2010-08-07	299987	\N	308863	\N
309663	GENERIC_DAY	1	2	f	2010-08-12	299987	\N	308863	\N
309664	GENERIC_DAY	1	2	f	2010-09-08	299987	\N	308863	\N
309665	GENERIC_DAY	1	2	f	2010-09-09	299987	\N	308863	\N
309666	GENERIC_DAY	1	2	f	2010-08-18	299989	\N	308863	\N
309667	GENERIC_DAY	1	2	f	2010-09-17	299987	\N	308863	\N
309668	GENERIC_DAY	1	2	f	2010-08-06	299989	\N	308863	\N
309669	GENERIC_DAY	1	2	f	2010-08-24	299989	\N	308863	\N
309670	GENERIC_DAY	1	2	f	2010-08-18	299987	\N	308863	\N
309671	GENERIC_DAY	1	0	f	2010-08-22	299987	\N	308863	\N
309672	GENERIC_DAY	1	2	f	2010-09-15	299989	\N	308863	\N
309673	GENERIC_DAY	1	2	f	2010-09-10	299987	\N	308863	\N
309674	GENERIC_DAY	1	2	f	2010-08-26	299987	\N	308863	\N
309675	GENERIC_DAY	1	0	f	2010-09-18	299989	\N	308863	\N
309676	GENERIC_DAY	1	2	f	2010-09-03	299987	\N	308863	\N
309677	GENERIC_DAY	1	2	f	2010-08-03	299989	\N	308863	\N
309678	GENERIC_DAY	1	2	f	2010-08-23	299987	\N	308863	\N
309679	GENERIC_DAY	1	2	f	2010-08-17	299989	\N	308863	\N
309680	GENERIC_DAY	1	0	f	2010-09-11	299989	\N	308863	\N
309681	GENERIC_DAY	1	2	f	2010-09-02	299987	\N	308864	\N
309682	GENERIC_DAY	1	2	f	2010-08-27	299989	\N	308864	\N
309683	GENERIC_DAY	1	2	f	2010-09-16	299989	\N	308864	\N
309684	GENERIC_DAY	1	0	f	2010-08-07	299987	\N	308864	\N
309685	GENERIC_DAY	1	2	f	2010-08-05	299989	\N	308864	\N
309686	GENERIC_DAY	1	0	f	2010-08-14	299989	\N	308864	\N
309687	GENERIC_DAY	1	2	f	2010-08-17	299987	\N	308864	\N
309688	GENERIC_DAY	1	2	f	2010-09-09	299987	\N	308864	\N
309689	GENERIC_DAY	1	2	f	2010-09-20	299987	\N	308864	\N
309690	GENERIC_DAY	1	2	f	2010-09-01	299987	\N	308864	\N
309691	GENERIC_DAY	1	2	f	2010-09-14	299987	\N	308864	\N
309692	GENERIC_DAY	1	0	f	2010-09-04	299987	\N	308864	\N
309693	GENERIC_DAY	1	2	f	2010-09-07	299987	\N	308864	\N
309694	GENERIC_DAY	1	2	f	2010-08-03	299987	\N	308864	\N
309695	GENERIC_DAY	1	2	f	2010-08-04	299989	\N	308864	\N
309696	GENERIC_DAY	1	2	f	2010-08-31	299987	\N	308864	\N
309697	GENERIC_DAY	1	0	f	2010-08-08	299987	\N	308864	\N
309698	GENERIC_DAY	1	2	f	2010-08-06	299987	\N	308864	\N
309699	GENERIC_DAY	1	2	f	2010-09-10	299989	\N	308864	\N
309700	GENERIC_DAY	1	2	f	2010-08-03	299989	\N	308864	\N
309701	GENERIC_DAY	1	2	f	2010-08-26	299989	\N	308864	\N
309702	GENERIC_DAY	1	2	f	2010-08-10	299989	\N	308864	\N
309703	GENERIC_DAY	1	2	f	2010-09-02	299989	\N	308864	\N
309704	GENERIC_DAY	1	2	f	2010-09-15	299987	\N	308864	\N
309705	GENERIC_DAY	1	2	f	2010-08-17	299989	\N	308864	\N
309706	GENERIC_DAY	1	2	f	2010-09-13	299989	\N	308864	\N
309707	GENERIC_DAY	1	2	f	2010-08-25	299987	\N	308864	\N
309708	GENERIC_DAY	1	2	f	2010-09-16	299987	\N	308864	\N
309709	GENERIC_DAY	1	2	f	2010-09-08	299989	\N	308864	\N
309710	GENERIC_DAY	1	0	f	2010-08-15	299989	\N	308864	\N
309711	GENERIC_DAY	1	2	f	2010-09-09	299989	\N	308864	\N
309712	GENERIC_DAY	1	0	f	2010-08-15	299987	\N	308864	\N
309713	GENERIC_DAY	1	2	f	2010-08-27	299987	\N	308864	\N
309714	GENERIC_DAY	1	2	f	2010-09-20	299989	\N	308864	\N
309715	GENERIC_DAY	1	2	f	2010-09-15	299989	\N	308864	\N
309716	GENERIC_DAY	1	0	f	2010-09-11	299987	\N	308864	\N
309717	GENERIC_DAY	1	2	f	2010-08-06	299989	\N	308864	\N
309718	GENERIC_DAY	1	2	f	2010-09-03	299987	\N	308864	\N
309719	GENERIC_DAY	1	2	f	2010-08-23	299987	\N	308864	\N
309720	GENERIC_DAY	1	2	f	2010-08-24	299987	\N	308864	\N
309721	GENERIC_DAY	1	0	f	2010-09-18	299987	\N	308864	\N
309722	GENERIC_DAY	1	0	f	2010-09-05	299987	\N	308864	\N
309723	GENERIC_DAY	1	2	f	2010-08-19	299989	\N	308864	\N
309724	GENERIC_DAY	1	2	f	2010-08-18	299989	\N	308864	\N
309725	GENERIC_DAY	1	2	f	2010-09-06	299989	\N	308864	\N
309726	GENERIC_DAY	1	2	f	2010-08-04	299987	\N	308864	\N
309727	GENERIC_DAY	1	1	f	2010-09-22	299989	\N	308864	\N
309728	GENERIC_DAY	1	0	f	2010-09-04	299989	\N	308864	\N
309729	GENERIC_DAY	1	2	f	2010-09-14	299989	\N	308864	\N
309730	GENERIC_DAY	1	0	f	2010-08-14	299987	\N	308864	\N
309731	GENERIC_DAY	1	2	f	2010-08-09	299989	\N	308864	\N
309732	GENERIC_DAY	1	2	f	2010-08-10	299987	\N	308864	\N
309733	GENERIC_DAY	1	2	f	2010-08-12	299987	\N	308864	\N
309734	GENERIC_DAY	1	0	f	2010-08-29	299989	\N	308864	\N
309735	GENERIC_DAY	1	2	f	2010-08-25	299989	\N	308864	\N
309736	GENERIC_DAY	1	0	f	2010-09-12	299987	\N	308864	\N
309737	GENERIC_DAY	1	1	f	2010-09-22	299987	\N	308864	\N
309738	GENERIC_DAY	1	0	f	2010-09-18	299989	\N	308864	\N
309739	GENERIC_DAY	1	2	f	2010-08-09	299987	\N	308864	\N
309740	GENERIC_DAY	1	2	f	2010-08-13	299987	\N	308864	\N
309741	GENERIC_DAY	1	2	f	2010-09-13	299987	\N	308864	\N
309742	GENERIC_DAY	1	0	f	2010-09-11	299989	\N	308864	\N
309743	GENERIC_DAY	1	0	f	2010-09-19	299989	\N	308864	\N
309744	GENERIC_DAY	1	2	f	2010-08-26	299987	\N	308864	\N
309745	GENERIC_DAY	1	0	f	2010-09-12	299989	\N	308864	\N
309746	GENERIC_DAY	1	0	f	2010-08-22	299989	\N	308864	\N
309747	GENERIC_DAY	1	0	f	2010-08-07	299989	\N	308864	\N
309748	GENERIC_DAY	1	2	f	2010-09-06	299987	\N	308864	\N
309749	GENERIC_DAY	1	0	f	2010-08-21	299989	\N	308864	\N
309750	GENERIC_DAY	1	2	f	2010-08-20	299987	\N	308864	\N
309751	GENERIC_DAY	1	2	f	2010-09-01	299989	\N	308864	\N
309752	GENERIC_DAY	1	0	f	2010-08-22	299987	\N	308864	\N
309753	GENERIC_DAY	1	2	f	2010-08-16	299989	\N	308864	\N
309754	GENERIC_DAY	1	0	f	2010-09-19	299987	\N	308864	\N
309755	GENERIC_DAY	1	2	f	2010-08-18	299987	\N	308864	\N
309756	GENERIC_DAY	1	0	f	2010-08-08	299989	\N	308864	\N
309757	GENERIC_DAY	1	2	f	2010-09-08	299987	\N	308864	\N
309758	GENERIC_DAY	1	2	f	2010-09-17	299989	\N	308864	\N
309759	GENERIC_DAY	1	2	f	2010-08-30	299987	\N	308864	\N
309760	GENERIC_DAY	1	2	f	2010-09-03	299989	\N	308864	\N
309761	GENERIC_DAY	1	2	f	2010-08-02	299987	\N	308864	\N
309762	GENERIC_DAY	1	0	f	2010-08-28	299987	\N	308864	\N
309763	GENERIC_DAY	1	2	f	2010-08-31	299989	\N	308864	\N
309764	GENERIC_DAY	1	2	f	2010-08-30	299989	\N	308864	\N
309765	GENERIC_DAY	1	2	f	2010-08-19	299987	\N	308864	\N
309766	GENERIC_DAY	1	2	f	2010-08-24	299989	\N	308864	\N
309767	GENERIC_DAY	1	0	f	2010-08-28	299989	\N	308864	\N
309768	GENERIC_DAY	1	2	f	2010-08-23	299989	\N	308864	\N
309769	GENERIC_DAY	1	2	f	2010-09-17	299987	\N	308864	\N
309770	GENERIC_DAY	1	2	f	2010-08-13	299989	\N	308864	\N
309771	GENERIC_DAY	1	2	f	2010-08-05	299987	\N	308864	\N
309772	GENERIC_DAY	1	2	f	2010-09-21	299987	\N	308864	\N
309773	GENERIC_DAY	1	0	f	2010-09-05	299989	\N	308864	\N
309774	GENERIC_DAY	1	2	f	2010-08-20	299989	\N	308864	\N
309775	GENERIC_DAY	1	2	f	2010-08-02	299989	\N	308864	\N
309776	GENERIC_DAY	1	0	f	2010-08-21	299987	\N	308864	\N
309777	GENERIC_DAY	1	2	f	2010-08-12	299989	\N	308864	\N
309778	GENERIC_DAY	1	0	f	2010-08-29	299987	\N	308864	\N
309779	GENERIC_DAY	1	2	f	2010-08-16	299987	\N	308864	\N
309780	GENERIC_DAY	1	2	f	2010-09-21	299989	\N	308864	\N
309781	GENERIC_DAY	1	2	f	2010-09-07	299989	\N	308864	\N
309782	GENERIC_DAY	1	2	f	2010-08-11	299989	\N	308864	\N
309783	GENERIC_DAY	1	2	f	2010-09-10	299987	\N	308864	\N
309784	GENERIC_DAY	1	2	f	2010-08-11	299987	\N	308864	\N
309785	GENERIC_DAY	1	2	f	2010-08-25	299987	\N	308865	\N
309786	GENERIC_DAY	1	2	f	2010-08-17	299989	\N	308865	\N
309787	GENERIC_DAY	1	2	f	2010-09-02	299989	\N	308865	\N
309788	GENERIC_DAY	1	2	f	2010-09-21	299989	\N	308865	\N
309789	GENERIC_DAY	1	2	f	2010-09-07	299989	\N	308865	\N
309790	GENERIC_DAY	1	2	f	2010-09-14	299989	\N	308865	\N
309791	GENERIC_DAY	1	2	f	2010-09-09	299987	\N	308865	\N
309792	GENERIC_DAY	1	2	f	2010-08-11	299989	\N	308865	\N
309793	GENERIC_DAY	1	0	f	2010-09-19	299987	\N	308865	\N
309794	GENERIC_DAY	1	0	f	2010-09-11	299987	\N	308865	\N
309795	GENERIC_DAY	1	2	f	2010-08-16	299989	\N	308865	\N
309796	GENERIC_DAY	1	2	f	2010-08-09	299987	\N	308865	\N
309797	GENERIC_DAY	1	2	f	2010-08-09	299989	\N	308865	\N
309798	GENERIC_DAY	1	2	f	2010-08-31	299989	\N	308865	\N
309799	GENERIC_DAY	1	0	f	2010-08-08	299987	\N	308865	\N
309800	GENERIC_DAY	1	2	f	2010-08-02	299987	\N	308865	\N
309801	GENERIC_DAY	1	0	f	2010-09-11	299989	\N	308865	\N
309802	GENERIC_DAY	1	2	f	2010-08-26	299987	\N	308865	\N
309803	GENERIC_DAY	1	2	f	2010-09-17	299987	\N	308865	\N
309804	GENERIC_DAY	1	0	f	2010-08-29	299987	\N	308865	\N
309805	GENERIC_DAY	1	0	f	2010-08-29	299989	\N	308865	\N
309806	GENERIC_DAY	1	0	f	2010-08-28	299987	\N	308865	\N
309807	GENERIC_DAY	1	2	f	2010-08-02	299989	\N	308865	\N
309808	GENERIC_DAY	1	2	f	2010-08-10	299989	\N	308865	\N
309809	GENERIC_DAY	1	2	f	2010-08-13	299989	\N	308865	\N
309810	GENERIC_DAY	1	1	f	2010-09-22	299987	\N	308865	\N
309811	GENERIC_DAY	1	2	f	2010-08-25	299989	\N	308865	\N
309812	GENERIC_DAY	1	0	f	2010-08-07	299989	\N	308865	\N
309813	GENERIC_DAY	1	2	f	2010-08-20	299989	\N	308865	\N
309814	GENERIC_DAY	1	2	f	2010-08-23	299989	\N	308865	\N
309815	GENERIC_DAY	1	0	f	2010-08-07	299987	\N	308865	\N
309816	GENERIC_DAY	1	2	f	2010-09-21	299987	\N	308865	\N
309817	GENERIC_DAY	1	2	f	2010-08-12	299987	\N	308865	\N
309818	GENERIC_DAY	1	0	f	2010-08-21	299989	\N	308865	\N
309819	GENERIC_DAY	1	2	f	2010-09-08	299989	\N	308865	\N
309820	GENERIC_DAY	1	0	f	2010-09-12	299989	\N	308865	\N
309821	GENERIC_DAY	1	0	f	2010-08-14	299987	\N	308865	\N
309822	GENERIC_DAY	1	2	f	2010-08-12	299989	\N	308865	\N
309823	GENERIC_DAY	1	2	f	2010-09-08	299987	\N	308865	\N
309824	GENERIC_DAY	1	2	f	2010-08-16	299987	\N	308865	\N
309825	GENERIC_DAY	1	2	f	2010-09-03	299989	\N	308865	\N
309826	GENERIC_DAY	1	2	f	2010-08-31	299987	\N	308865	\N
309827	GENERIC_DAY	1	2	f	2010-08-18	299987	\N	308865	\N
309828	GENERIC_DAY	1	2	f	2010-08-26	299989	\N	308865	\N
309829	GENERIC_DAY	1	2	f	2010-08-05	299987	\N	308865	\N
309830	GENERIC_DAY	1	0	f	2010-08-22	299987	\N	308865	\N
309831	GENERIC_DAY	1	2	f	2010-09-20	299987	\N	308865	\N
309832	GENERIC_DAY	1	2	f	2010-08-24	299989	\N	308865	\N
309833	GENERIC_DAY	1	1	f	2010-09-22	299989	\N	308865	\N
309834	GENERIC_DAY	1	0	f	2010-09-05	299987	\N	308865	\N
309835	GENERIC_DAY	1	0	f	2010-08-28	299989	\N	308865	\N
309836	GENERIC_DAY	1	0	f	2010-09-18	299989	\N	308865	\N
309837	GENERIC_DAY	1	2	f	2010-08-03	299989	\N	308865	\N
309838	GENERIC_DAY	1	0	f	2010-08-08	299989	\N	308865	\N
309839	GENERIC_DAY	1	2	f	2010-08-03	299987	\N	308865	\N
309840	GENERIC_DAY	1	2	f	2010-08-05	299989	\N	308865	\N
309841	GENERIC_DAY	1	2	f	2010-08-19	299987	\N	308865	\N
309842	GENERIC_DAY	1	2	f	2010-09-14	299987	\N	308865	\N
309843	GENERIC_DAY	1	2	f	2010-08-20	299987	\N	308865	\N
309844	GENERIC_DAY	1	0	f	2010-08-15	299987	\N	308865	\N
309845	GENERIC_DAY	1	2	f	2010-09-13	299987	\N	308865	\N
309846	GENERIC_DAY	1	2	f	2010-08-13	299987	\N	308865	\N
309847	GENERIC_DAY	1	2	f	2010-08-04	299989	\N	308865	\N
309848	GENERIC_DAY	1	2	f	2010-09-16	299989	\N	308865	\N
309849	GENERIC_DAY	1	2	f	2010-09-06	299987	\N	308865	\N
309850	GENERIC_DAY	1	2	f	2010-08-27	299989	\N	308865	\N
309851	GENERIC_DAY	1	2	f	2010-08-06	299987	\N	308865	\N
309852	GENERIC_DAY	1	2	f	2010-08-06	299989	\N	308865	\N
309853	GENERIC_DAY	1	0	f	2010-08-14	299989	\N	308865	\N
309854	GENERIC_DAY	1	2	f	2010-08-10	299987	\N	308865	\N
309855	GENERIC_DAY	1	0	f	2010-09-05	299989	\N	308865	\N
309856	GENERIC_DAY	1	2	f	2010-09-02	299987	\N	308865	\N
309857	GENERIC_DAY	1	2	f	2010-09-06	299989	\N	308865	\N
309858	GENERIC_DAY	1	2	f	2010-08-04	299987	\N	308865	\N
309859	GENERIC_DAY	1	2	f	2010-09-17	299989	\N	308865	\N
309860	GENERIC_DAY	1	2	f	2010-08-24	299987	\N	308865	\N
309861	GENERIC_DAY	1	0	f	2010-09-04	299989	\N	308865	\N
309862	GENERIC_DAY	1	0	f	2010-08-22	299989	\N	308865	\N
309863	GENERIC_DAY	1	2	f	2010-09-01	299989	\N	308865	\N
309864	GENERIC_DAY	1	2	f	2010-08-18	299989	\N	308865	\N
309865	GENERIC_DAY	1	2	f	2010-08-23	299987	\N	308865	\N
309866	GENERIC_DAY	1	2	f	2010-09-15	299987	\N	308865	\N
309867	GENERIC_DAY	1	2	f	2010-09-15	299989	\N	308865	\N
309868	GENERIC_DAY	1	2	f	2010-09-10	299987	\N	308865	\N
309869	GENERIC_DAY	1	2	f	2010-09-20	299989	\N	308865	\N
309870	GENERIC_DAY	1	2	f	2010-08-27	299987	\N	308865	\N
309871	GENERIC_DAY	1	2	f	2010-08-19	299989	\N	308865	\N
309872	GENERIC_DAY	1	0	f	2010-09-04	299987	\N	308865	\N
309873	GENERIC_DAY	1	0	f	2010-09-12	299987	\N	308865	\N
309874	GENERIC_DAY	1	2	f	2010-09-07	299987	\N	308865	\N
309875	GENERIC_DAY	1	2	f	2010-08-11	299987	\N	308865	\N
309876	GENERIC_DAY	1	2	f	2010-09-10	299989	\N	308865	\N
309877	GENERIC_DAY	1	2	f	2010-09-09	299989	\N	308865	\N
309878	GENERIC_DAY	1	2	f	2010-09-01	299987	\N	308865	\N
309879	GENERIC_DAY	1	2	f	2010-08-17	299987	\N	308865	\N
309880	GENERIC_DAY	1	2	f	2010-09-03	299987	\N	308865	\N
309881	GENERIC_DAY	1	2	f	2010-09-13	299989	\N	308865	\N
309882	GENERIC_DAY	1	0	f	2010-09-19	299989	\N	308865	\N
309883	GENERIC_DAY	1	0	f	2010-08-15	299989	\N	308865	\N
309884	GENERIC_DAY	1	0	f	2010-09-18	299987	\N	308865	\N
309885	GENERIC_DAY	1	2	f	2010-08-30	299989	\N	308865	\N
309886	GENERIC_DAY	1	2	f	2010-08-30	299987	\N	308865	\N
309887	GENERIC_DAY	1	0	f	2010-08-21	299987	\N	308865	\N
309888	GENERIC_DAY	1	2	f	2010-09-16	299987	\N	308865	\N
309889	GENERIC_DAY	1	0	f	2010-09-12	299989	\N	308866	\N
309890	GENERIC_DAY	1	2	f	2010-09-10	299987	\N	308866	\N
309891	GENERIC_DAY	1	2	f	2010-09-16	299989	\N	308866	\N
309892	GENERIC_DAY	1	2	f	2010-09-06	299987	\N	308866	\N
309893	GENERIC_DAY	1	2	f	2010-08-20	299987	\N	308866	\N
309894	GENERIC_DAY	1	2	f	2010-09-10	299989	\N	308866	\N
309895	GENERIC_DAY	1	2	f	2010-08-09	299987	\N	308866	\N
309896	GENERIC_DAY	1	2	f	2010-09-02	299989	\N	308866	\N
309897	GENERIC_DAY	1	2	f	2010-09-02	299987	\N	308866	\N
309898	GENERIC_DAY	1	2	f	2010-09-03	299987	\N	308866	\N
309899	GENERIC_DAY	1	2	f	2010-09-17	299989	\N	308866	\N
309900	GENERIC_DAY	1	0	f	2010-09-05	299987	\N	308866	\N
309901	GENERIC_DAY	1	2	f	2010-08-24	299989	\N	308866	\N
309902	GENERIC_DAY	1	2	f	2010-09-20	299987	\N	308866	\N
309903	GENERIC_DAY	1	2	f	2010-08-20	299989	\N	308866	\N
309904	GENERIC_DAY	1	2	f	2010-08-10	299987	\N	308866	\N
309905	GENERIC_DAY	1	2	f	2010-09-09	299989	\N	308866	\N
309906	GENERIC_DAY	1	2	f	2010-08-05	299989	\N	308866	\N
309907	GENERIC_DAY	1	2	f	2010-08-23	299987	\N	308866	\N
309908	GENERIC_DAY	1	2	f	2010-09-16	299987	\N	308866	\N
309909	GENERIC_DAY	1	2	f	2010-09-07	299989	\N	308866	\N
309910	GENERIC_DAY	1	2	f	2010-08-13	299989	\N	308866	\N
309911	GENERIC_DAY	1	0	f	2010-09-19	299987	\N	308866	\N
309912	GENERIC_DAY	1	0	f	2010-09-19	299989	\N	308866	\N
309913	GENERIC_DAY	1	0	f	2010-09-18	299989	\N	308866	\N
309914	GENERIC_DAY	1	2	f	2010-08-25	299987	\N	308866	\N
309915	GENERIC_DAY	1	0	f	2010-08-21	299987	\N	308866	\N
309916	GENERIC_DAY	1	2	f	2010-09-14	299989	\N	308866	\N
309917	GENERIC_DAY	1	2	f	2010-08-31	299987	\N	308866	\N
309918	GENERIC_DAY	1	2	f	2010-08-26	299987	\N	308866	\N
309919	GENERIC_DAY	1	0	f	2010-09-12	299987	\N	308866	\N
309920	GENERIC_DAY	1	2	f	2010-09-21	299989	\N	308866	\N
309921	GENERIC_DAY	1	2	f	2010-09-17	299987	\N	308866	\N
309922	GENERIC_DAY	1	0	f	2010-08-29	299989	\N	308866	\N
309923	GENERIC_DAY	1	2	f	2010-08-18	299989	\N	308866	\N
309924	GENERIC_DAY	1	0	f	2010-08-28	299989	\N	308866	\N
309925	GENERIC_DAY	1	2	f	2010-08-06	299989	\N	308866	\N
309926	GENERIC_DAY	1	0	f	2010-08-28	299987	\N	308866	\N
309927	GENERIC_DAY	1	2	f	2010-09-15	299989	\N	308866	\N
309928	GENERIC_DAY	1	0	f	2010-09-18	299987	\N	308866	\N
309929	GENERIC_DAY	1	0	f	2010-08-21	299989	\N	308866	\N
309930	GENERIC_DAY	1	2	f	2010-08-27	299989	\N	308866	\N
309931	GENERIC_DAY	1	2	f	2010-08-19	299987	\N	308866	\N
309932	GENERIC_DAY	1	0	f	2010-08-15	299989	\N	308866	\N
309933	GENERIC_DAY	1	0	f	2010-09-04	299989	\N	308866	\N
309934	GENERIC_DAY	1	0	f	2010-08-08	299989	\N	308866	\N
309935	GENERIC_DAY	1	2	f	2010-09-07	299987	\N	308866	\N
309936	GENERIC_DAY	1	0	f	2010-08-07	299989	\N	308866	\N
309937	GENERIC_DAY	1	2	f	2010-08-05	299987	\N	308866	\N
309938	GENERIC_DAY	1	2	f	2010-09-01	299987	\N	308866	\N
309939	GENERIC_DAY	1	2	f	2010-09-15	299987	\N	308866	\N
309940	GENERIC_DAY	1	1	f	2010-09-22	299989	\N	308866	\N
309941	GENERIC_DAY	1	2	f	2010-08-03	299987	\N	308866	\N
309942	GENERIC_DAY	1	2	f	2010-09-13	299987	\N	308866	\N
309943	GENERIC_DAY	1	2	f	2010-08-18	299987	\N	308866	\N
309944	GENERIC_DAY	1	2	f	2010-08-17	299989	\N	308866	\N
309945	GENERIC_DAY	1	2	f	2010-09-21	299987	\N	308866	\N
309946	GENERIC_DAY	1	2	f	2010-09-06	299989	\N	308866	\N
309947	GENERIC_DAY	1	0	f	2010-08-15	299987	\N	308866	\N
309948	GENERIC_DAY	1	2	f	2010-09-01	299989	\N	308866	\N
309949	GENERIC_DAY	1	0	f	2010-09-05	299989	\N	308866	\N
309950	GENERIC_DAY	1	2	f	2010-08-04	299989	\N	308866	\N
309951	GENERIC_DAY	1	1	f	2010-09-22	299987	\N	308866	\N
309952	GENERIC_DAY	1	2	f	2010-08-30	299989	\N	308866	\N
309953	GENERIC_DAY	1	2	f	2010-08-04	299987	\N	308866	\N
309954	GENERIC_DAY	1	2	f	2010-08-27	299987	\N	308866	\N
309955	GENERIC_DAY	1	0	f	2010-09-11	299987	\N	308866	\N
309956	GENERIC_DAY	1	2	f	2010-08-12	299989	\N	308866	\N
309957	GENERIC_DAY	1	0	f	2010-09-04	299987	\N	308866	\N
309958	GENERIC_DAY	1	2	f	2010-08-31	299989	\N	308866	\N
309959	GENERIC_DAY	1	0	f	2010-08-22	299987	\N	308866	\N
309960	GENERIC_DAY	1	2	f	2010-08-13	299987	\N	308866	\N
309961	GENERIC_DAY	1	2	f	2010-09-03	299989	\N	308866	\N
309962	GENERIC_DAY	1	2	f	2010-08-24	299987	\N	308866	\N
309963	GENERIC_DAY	1	0	f	2010-08-14	299989	\N	308866	\N
309964	GENERIC_DAY	1	2	f	2010-09-13	299989	\N	308866	\N
309965	GENERIC_DAY	1	2	f	2010-08-10	299989	\N	308866	\N
309966	GENERIC_DAY	1	0	f	2010-08-14	299987	\N	308866	\N
309967	GENERIC_DAY	1	2	f	2010-09-09	299987	\N	308866	\N
309968	GENERIC_DAY	1	0	f	2010-08-07	299987	\N	308866	\N
309969	GENERIC_DAY	1	0	f	2010-09-11	299989	\N	308866	\N
309970	GENERIC_DAY	1	2	f	2010-08-12	299987	\N	308866	\N
309971	GENERIC_DAY	1	2	f	2010-08-30	299987	\N	308866	\N
309972	GENERIC_DAY	1	2	f	2010-08-03	299989	\N	308866	\N
309973	GENERIC_DAY	1	2	f	2010-09-08	299987	\N	308866	\N
309974	GENERIC_DAY	1	2	f	2010-08-23	299989	\N	308866	\N
309975	GENERIC_DAY	1	2	f	2010-08-06	299987	\N	308866	\N
309976	GENERIC_DAY	1	0	f	2010-08-22	299989	\N	308866	\N
309977	GENERIC_DAY	1	2	f	2010-08-11	299989	\N	308866	\N
309978	GENERIC_DAY	1	2	f	2010-08-16	299989	\N	308866	\N
309979	GENERIC_DAY	1	0	f	2010-08-08	299987	\N	308866	\N
309980	GENERIC_DAY	1	2	f	2010-08-16	299987	\N	308866	\N
309981	GENERIC_DAY	1	2	f	2010-08-09	299989	\N	308866	\N
309982	GENERIC_DAY	1	2	f	2010-08-26	299989	\N	308866	\N
309983	GENERIC_DAY	1	2	f	2010-08-02	299987	\N	308866	\N
309984	GENERIC_DAY	1	2	f	2010-08-25	299989	\N	308866	\N
309985	GENERIC_DAY	1	2	f	2010-08-17	299987	\N	308866	\N
309986	GENERIC_DAY	1	2	f	2010-09-14	299987	\N	308866	\N
309987	GENERIC_DAY	1	2	f	2010-09-20	299989	\N	308866	\N
309988	GENERIC_DAY	1	2	f	2010-08-02	299989	\N	308866	\N
309989	GENERIC_DAY	1	2	f	2010-08-19	299989	\N	308866	\N
309990	GENERIC_DAY	1	2	f	2010-08-11	299987	\N	308866	\N
309991	GENERIC_DAY	1	0	f	2010-08-29	299987	\N	308866	\N
309992	GENERIC_DAY	1	2	f	2010-09-08	299989	\N	308866	\N
309993	GENERIC_DAY	1	1	f	2010-10-07	299987	\N	308867	\N
309994	GENERIC_DAY	1	1	f	2010-08-18	299987	\N	308867	\N
309995	GENERIC_DAY	1	1	f	2010-09-17	299987	\N	308867	\N
309996	GENERIC_DAY	1	1	f	2010-08-11	299987	\N	308867	\N
309997	GENERIC_DAY	1	1	f	2010-09-15	299989	\N	308867	\N
309998	GENERIC_DAY	1	1	f	2010-08-17	299987	\N	308867	\N
309999	GENERIC_DAY	1	1	f	2010-09-14	299989	\N	308867	\N
310000	GENERIC_DAY	1	1	f	2010-10-29	299987	\N	308867	\N
310001	GENERIC_DAY	1	1	f	2010-09-06	299987	\N	308867	\N
310002	GENERIC_DAY	1	1	f	2010-09-20	299989	\N	308867	\N
310003	GENERIC_DAY	1	1	f	2010-09-09	299989	\N	308867	\N
310004	GENERIC_DAY	1	0	f	2010-10-03	299989	\N	308867	\N
310005	GENERIC_DAY	1	0	f	2010-09-26	299989	\N	308867	\N
310006	GENERIC_DAY	1	0	f	2010-08-21	299987	\N	308867	\N
310007	GENERIC_DAY	1	1	f	2010-08-17	299989	\N	308867	\N
310008	GENERIC_DAY	1	1	f	2010-11-11	299987	\N	308867	\N
310009	GENERIC_DAY	1	0	f	2010-11-06	299987	\N	308867	\N
310010	GENERIC_DAY	1	1	f	2010-09-20	299987	\N	308867	\N
310011	GENERIC_DAY	1	0	f	2010-09-11	299987	\N	308867	\N
310012	GENERIC_DAY	1	1	f	2010-10-12	299989	\N	308867	\N
310013	GENERIC_DAY	1	0	f	2010-09-05	299987	\N	308867	\N
310014	GENERIC_DAY	1	1	f	2010-08-19	299989	\N	308867	\N
310015	GENERIC_DAY	1	1	f	2010-08-09	299987	\N	308867	\N
310016	GENERIC_DAY	1	1	f	2010-09-10	299987	\N	308867	\N
310017	GENERIC_DAY	1	1	f	2010-10-27	299989	\N	308867	\N
310018	GENERIC_DAY	1	1	f	2010-10-18	299987	\N	308867	\N
310019	GENERIC_DAY	1	1	f	2010-09-15	299987	\N	308867	\N
310020	GENERIC_DAY	1	0	f	2010-10-09	299989	\N	308867	\N
310021	GENERIC_DAY	1	0	f	2010-10-16	299987	\N	308867	\N
310022	GENERIC_DAY	1	1	f	2010-09-21	299987	\N	308867	\N
310023	GENERIC_DAY	1	1	f	2010-08-05	299987	\N	308867	\N
310024	GENERIC_DAY	1	1	f	2010-09-03	299987	\N	308867	\N
310025	GENERIC_DAY	1	1	f	2010-10-06	299989	\N	308867	\N
310026	GENERIC_DAY	1	1	f	2010-10-19	299989	\N	308867	\N
310027	GENERIC_DAY	1	0	f	2010-09-19	299987	\N	308867	\N
310028	GENERIC_DAY	1	1	f	2010-09-29	299987	\N	308867	\N
310029	GENERIC_DAY	1	1	f	2010-10-05	299987	\N	308867	\N
310030	GENERIC_DAY	1	1	f	2010-10-15	299989	\N	308867	\N
310031	GENERIC_DAY	1	1	f	2010-09-30	299989	\N	308867	\N
310032	GENERIC_DAY	1	1	f	2010-10-29	299989	\N	308867	\N
310033	GENERIC_DAY	1	1	f	2010-08-12	299987	\N	308867	\N
310034	GENERIC_DAY	1	0	f	2010-08-14	299989	\N	308867	\N
310035	GENERIC_DAY	1	1	f	2010-10-18	299989	\N	308867	\N
310036	GENERIC_DAY	1	1	f	2010-10-12	299987	\N	308867	\N
310037	GENERIC_DAY	1	1	f	2010-09-24	299989	\N	308867	\N
310038	GENERIC_DAY	1	1	f	2010-10-13	299987	\N	308867	\N
310039	GENERIC_DAY	1	1	f	2010-10-01	299987	\N	308867	\N
310040	GENERIC_DAY	1	1	f	2010-08-02	299987	\N	308867	\N
310041	GENERIC_DAY	1	1	f	2010-09-10	299989	\N	308867	\N
310042	GENERIC_DAY	1	1	f	2010-10-01	299989	\N	308867	\N
310043	GENERIC_DAY	1	0	f	2010-11-07	299989	\N	308867	\N
310044	GENERIC_DAY	1	1	f	2010-08-03	299989	\N	308867	\N
310045	GENERIC_DAY	1	0	f	2010-10-17	299989	\N	308867	\N
310046	GENERIC_DAY	1	0	f	2010-09-04	299987	\N	308867	\N
310047	GENERIC_DAY	1	1	f	2010-09-21	299989	\N	308867	\N
310048	GENERIC_DAY	1	1	f	2010-08-23	299989	\N	308867	\N
310049	GENERIC_DAY	1	1	f	2010-11-03	299989	\N	308867	\N
310050	GENERIC_DAY	1	0	f	2010-08-08	299989	\N	308867	\N
310051	GENERIC_DAY	1	1	f	2010-08-24	299987	\N	308867	\N
310052	GENERIC_DAY	1	1	f	2010-10-27	299987	\N	308867	\N
310053	GENERIC_DAY	1	0	f	2010-10-31	299987	\N	308867	\N
310054	GENERIC_DAY	1	0	f	2010-10-03	299987	\N	308867	\N
310055	GENERIC_DAY	1	1	f	2010-08-10	299989	\N	308867	\N
310056	GENERIC_DAY	1	1	f	2010-08-30	299987	\N	308867	\N
310057	GENERIC_DAY	1	1	f	2010-09-09	299987	\N	308867	\N
310058	GENERIC_DAY	1	0	f	2010-08-28	299989	\N	308867	\N
310059	GENERIC_DAY	1	1	f	2010-09-22	299989	\N	308867	\N
310060	GENERIC_DAY	1	1	f	2010-09-27	299989	\N	308867	\N
310061	GENERIC_DAY	1	1	f	2010-08-06	299987	\N	308867	\N
310062	GENERIC_DAY	1	1	f	2010-09-24	299987	\N	308867	\N
310063	GENERIC_DAY	1	1	f	2010-11-08	299989	\N	308867	\N
310064	GENERIC_DAY	1	0	f	2010-10-24	299989	\N	308867	\N
310065	GENERIC_DAY	1	0	f	2010-10-10	299989	\N	308867	\N
310066	GENERIC_DAY	1	1	f	2010-10-22	299989	\N	308867	\N
310067	GENERIC_DAY	1	1	f	2010-08-09	299989	\N	308867	\N
310068	GENERIC_DAY	1	0	f	2010-09-25	299989	\N	308867	\N
310069	GENERIC_DAY	1	1	f	2010-08-30	299989	\N	308867	\N
310070	GENERIC_DAY	1	1	f	2010-08-20	299989	\N	308867	\N
310071	GENERIC_DAY	1	1	f	2010-10-28	299987	\N	308867	\N
310072	GENERIC_DAY	1	0	f	2010-10-17	299987	\N	308867	\N
310073	GENERIC_DAY	1	1	f	2010-11-02	299989	\N	308867	\N
310074	GENERIC_DAY	1	1	f	2010-08-12	299989	\N	308867	\N
310075	GENERIC_DAY	1	0	f	2010-09-04	299989	\N	308867	\N
310076	GENERIC_DAY	1	1	f	2010-10-04	299989	\N	308867	\N
310077	GENERIC_DAY	1	1	f	2010-09-07	299987	\N	308867	\N
310078	GENERIC_DAY	1	1	f	2010-09-23	299987	\N	308867	\N
310079	GENERIC_DAY	1	0	f	2010-10-02	299987	\N	308867	\N
310080	GENERIC_DAY	1	1	f	2010-10-11	299989	\N	308867	\N
310081	GENERIC_DAY	1	0	f	2010-09-18	299989	\N	308867	\N
310082	GENERIC_DAY	1	1	f	2010-10-04	299987	\N	308867	\N
310083	GENERIC_DAY	1	1	f	2010-08-26	299987	\N	308867	\N
310084	GENERIC_DAY	1	1	f	2010-11-05	299989	\N	308867	\N
310085	GENERIC_DAY	1	1	f	2010-08-04	299989	\N	308867	\N
310086	GENERIC_DAY	1	1	f	2010-11-04	299987	\N	308867	\N
310087	GENERIC_DAY	1	1	f	2010-10-13	299989	\N	308867	\N
310088	GENERIC_DAY	1	0	f	2010-08-07	299989	\N	308867	\N
310089	GENERIC_DAY	1	1	f	2010-11-10	299987	\N	308867	\N
310090	GENERIC_DAY	1	1	f	2010-10-08	299989	\N	308867	\N
310091	GENERIC_DAY	1	1	f	2010-09-28	299989	\N	308867	\N
310092	GENERIC_DAY	1	1	f	2010-09-06	299989	\N	308867	\N
310093	GENERIC_DAY	1	1	f	2010-08-23	299987	\N	308867	\N
310094	GENERIC_DAY	1	0	f	2010-10-09	299987	\N	308867	\N
310095	GENERIC_DAY	1	0	f	2010-10-23	299987	\N	308867	\N
310096	GENERIC_DAY	1	1	f	2010-11-02	299987	\N	308867	\N
310097	GENERIC_DAY	1	1	f	2010-09-13	299987	\N	308867	\N
310098	GENERIC_DAY	1	1	f	2010-11-01	299989	\N	308867	\N
310099	GENERIC_DAY	1	1	f	2010-10-07	299989	\N	308867	\N
310100	GENERIC_DAY	1	1	f	2010-08-31	299989	\N	308867	\N
310101	GENERIC_DAY	1	1	f	2010-10-14	299987	\N	308867	\N
310102	GENERIC_DAY	1	1	f	2010-09-29	299989	\N	308867	\N
310103	GENERIC_DAY	1	1	f	2010-09-03	299989	\N	308867	\N
310104	GENERIC_DAY	1	1	f	2010-08-27	299989	\N	308867	\N
310105	GENERIC_DAY	1	1	f	2010-10-06	299987	\N	308867	\N
310106	GENERIC_DAY	1	1	f	2010-08-05	299989	\N	308867	\N
310107	GENERIC_DAY	1	0	f	2010-08-15	299987	\N	308867	\N
310108	GENERIC_DAY	1	1	f	2010-09-01	299987	\N	308867	\N
310109	GENERIC_DAY	1	1	f	2010-11-03	299987	\N	308867	\N
310110	GENERIC_DAY	1	1	f	2010-11-05	299987	\N	308867	\N
310111	GENERIC_DAY	1	1	f	2010-10-15	299987	\N	308867	\N
310112	GENERIC_DAY	1	1	f	2010-09-22	299987	\N	308867	\N
310113	GENERIC_DAY	1	1	f	2010-09-02	299987	\N	308867	\N
310114	GENERIC_DAY	1	0	f	2010-10-30	299987	\N	308867	\N
310115	GENERIC_DAY	1	0	f	2010-08-29	299989	\N	308867	\N
310116	GENERIC_DAY	1	1	f	2010-10-20	299987	\N	308867	\N
310117	GENERIC_DAY	1	1	f	2010-10-19	299987	\N	308867	\N
310118	GENERIC_DAY	1	1	f	2010-08-27	299987	\N	308867	\N
310119	GENERIC_DAY	1	1	f	2010-09-23	299989	\N	308867	\N
310120	GENERIC_DAY	1	1	f	2010-09-16	299987	\N	308867	\N
310121	GENERIC_DAY	1	1	f	2010-11-12	299989	\N	308867	\N
310122	GENERIC_DAY	1	0	f	2010-10-23	299989	\N	308867	\N
310123	GENERIC_DAY	1	1	f	2010-09-17	299989	\N	308867	\N
310124	GENERIC_DAY	1	0	f	2010-08-07	299987	\N	308867	\N
310125	GENERIC_DAY	1	1	f	2010-10-05	299989	\N	308867	\N
310126	GENERIC_DAY	1	0	f	2010-11-07	299987	\N	308867	\N
310127	GENERIC_DAY	1	0	f	2010-08-14	299987	\N	308867	\N
310128	GENERIC_DAY	1	0	f	2010-08-21	299989	\N	308867	\N
310129	GENERIC_DAY	1	1	f	2010-10-21	299987	\N	308867	\N
310130	GENERIC_DAY	1	1	f	2010-09-30	299987	\N	308867	\N
310131	GENERIC_DAY	1	1	f	2010-10-26	299989	\N	308867	\N
310132	GENERIC_DAY	1	0	f	2010-10-16	299989	\N	308867	\N
310133	GENERIC_DAY	1	0	f	2010-10-02	299989	\N	308867	\N
310134	GENERIC_DAY	1	1	f	2010-08-13	299989	\N	308867	\N
310135	GENERIC_DAY	1	1	f	2010-10-26	299987	\N	308867	\N
310136	GENERIC_DAY	1	1	f	2010-09-07	299989	\N	308867	\N
310137	GENERIC_DAY	1	1	f	2010-09-08	299987	\N	308867	\N
310138	GENERIC_DAY	1	1	f	2010-10-11	299987	\N	308867	\N
310139	GENERIC_DAY	1	1	f	2010-08-02	299989	\N	308867	\N
310140	GENERIC_DAY	1	1	f	2010-08-16	299987	\N	308867	\N
310141	GENERIC_DAY	1	0	f	2010-10-30	299989	\N	308867	\N
310142	GENERIC_DAY	1	0	f	2010-08-22	299987	\N	308867	\N
310143	GENERIC_DAY	1	1	f	2010-08-31	299987	\N	308867	\N
310144	GENERIC_DAY	1	1	f	2010-08-26	299989	\N	308867	\N
310145	GENERIC_DAY	1	1	f	2010-08-25	299987	\N	308867	\N
310146	GENERIC_DAY	1	1	f	2010-08-19	299987	\N	308867	\N
310147	GENERIC_DAY	1	1	f	2010-11-11	299989	\N	308867	\N
310148	GENERIC_DAY	1	0	f	2010-09-19	299989	\N	308867	\N
310149	GENERIC_DAY	1	0	f	2010-10-24	299987	\N	308867	\N
310150	GENERIC_DAY	1	1	f	2010-10-14	299989	\N	308867	\N
310151	GENERIC_DAY	1	1	f	2010-10-08	299987	\N	308867	\N
310152	GENERIC_DAY	1	0	f	2010-08-28	299987	\N	308867	\N
310153	GENERIC_DAY	1	1	f	2010-11-12	299987	\N	308867	\N
310154	GENERIC_DAY	1	1	f	2010-09-28	299987	\N	308867	\N
310155	GENERIC_DAY	1	0	f	2010-09-26	299987	\N	308867	\N
310156	GENERIC_DAY	1	0	f	2010-11-06	299989	\N	308867	\N
310157	GENERIC_DAY	1	0	f	2010-08-29	299987	\N	308867	\N
310158	GENERIC_DAY	1	1	f	2010-09-08	299989	\N	308867	\N
310159	GENERIC_DAY	1	1	f	2010-11-09	299987	\N	308867	\N
310160	GENERIC_DAY	1	1	f	2010-08-11	299989	\N	308867	\N
310161	GENERIC_DAY	1	1	f	2010-11-08	299987	\N	308867	\N
310162	GENERIC_DAY	1	0	f	2010-09-18	299987	\N	308867	\N
310163	GENERIC_DAY	1	0	f	2010-08-08	299987	\N	308867	\N
310164	GENERIC_DAY	1	0	f	2010-09-12	299989	\N	308867	\N
310165	GENERIC_DAY	1	1	f	2010-09-13	299989	\N	308867	\N
310166	GENERIC_DAY	1	1	f	2010-10-22	299987	\N	308867	\N
310167	GENERIC_DAY	1	0	f	2010-09-12	299987	\N	308867	\N
310168	GENERIC_DAY	1	1	f	2010-10-25	299987	\N	308867	\N
310169	GENERIC_DAY	1	1	f	2010-11-01	299987	\N	308867	\N
310170	GENERIC_DAY	1	1	f	2010-08-24	299989	\N	308867	\N
310171	GENERIC_DAY	1	1	f	2010-08-10	299987	\N	308867	\N
310172	GENERIC_DAY	1	1	f	2010-11-04	299989	\N	308867	\N
310173	GENERIC_DAY	1	1	f	2010-09-16	299989	\N	308867	\N
310174	GENERIC_DAY	1	1	f	2010-08-03	299987	\N	308867	\N
310175	GENERIC_DAY	1	1	f	2010-11-09	299989	\N	308867	\N
310176	GENERIC_DAY	1	1	f	2010-08-20	299987	\N	308867	\N
310177	GENERIC_DAY	1	0	f	2010-10-10	299987	\N	308867	\N
310178	GENERIC_DAY	1	1	f	2010-09-01	299989	\N	308867	\N
310179	GENERIC_DAY	1	1	f	2010-08-06	299989	\N	308867	\N
310180	GENERIC_DAY	1	1	f	2010-08-18	299989	\N	308867	\N
310181	GENERIC_DAY	1	0	f	2010-08-15	299989	\N	308867	\N
310182	GENERIC_DAY	1	1	f	2010-09-27	299987	\N	308867	\N
310183	GENERIC_DAY	1	0	f	2010-10-31	299989	\N	308867	\N
310184	GENERIC_DAY	1	1	f	2010-09-02	299989	\N	308867	\N
310185	GENERIC_DAY	1	1	f	2010-10-21	299989	\N	308867	\N
310186	GENERIC_DAY	1	0	f	2010-09-11	299989	\N	308867	\N
310187	GENERIC_DAY	1	1	f	2010-08-16	299989	\N	308867	\N
310188	GENERIC_DAY	1	1	f	2010-08-13	299987	\N	308867	\N
310189	GENERIC_DAY	1	1	f	2010-11-10	299989	\N	308867	\N
310190	GENERIC_DAY	1	1	f	2010-10-28	299989	\N	308867	\N
310191	GENERIC_DAY	1	1	f	2010-08-04	299987	\N	308867	\N
310192	GENERIC_DAY	1	0	f	2010-09-25	299987	\N	308867	\N
310193	GENERIC_DAY	1	1	f	2010-08-25	299989	\N	308867	\N
310194	GENERIC_DAY	1	1	f	2010-10-20	299989	\N	308867	\N
310195	GENERIC_DAY	1	1	f	2010-10-25	299989	\N	308867	\N
310196	GENERIC_DAY	1	0	f	2010-08-22	299989	\N	308867	\N
310197	GENERIC_DAY	1	0	f	2010-09-05	299989	\N	308867	\N
310198	GENERIC_DAY	1	1	f	2010-09-14	299987	\N	308867	\N
355861	GENERIC_DAY	0	2	f	2010-03-08	1623	\N	349503	\N
355862	GENERIC_DAY	0	3	f	2010-02-12	1625	\N	349503	\N
355863	GENERIC_DAY	0	3	f	2010-03-01	1625	\N	349503	\N
355864	GENERIC_DAY	0	3	f	2010-02-24	1619	\N	349503	\N
355865	GENERIC_DAY	0	3	f	2010-03-02	1625	\N	349503	\N
355866	GENERIC_DAY	0	0	f	2010-02-21	1623	\N	349504	\N
355867	GENERIC_DAY	0	0	f	2010-02-20	1619	\N	349504	\N
355868	GENERIC_DAY	0	0	f	2010-02-27	1619	\N	349504	\N
355869	GENERIC_DAY	0	2	f	2010-03-09	1625	\N	349504	\N
355870	GENERIC_DAY	0	3	f	2010-03-02	1623	\N	349504	\N
355871	GENERIC_DAY	0	0	f	2010-02-27	1625	\N	349504	\N
355872	GENERIC_DAY	0	0	f	2010-02-13	1625	\N	349504	\N
355873	GENERIC_DAY	0	2	f	2010-02-22	1625	\N	349504	\N
355874	GENERIC_DAY	0	0	f	2010-03-07	1625	\N	349504	\N
355875	GENERIC_DAY	0	3	f	2010-02-25	1619	\N	349504	\N
355876	GENERIC_DAY	0	0	f	2010-02-28	1625	\N	349504	\N
355877	GENERIC_DAY	0	3	f	2010-02-12	1623	\N	349504	\N
355878	GENERIC_DAY	0	3	f	2010-02-26	1623	\N	349504	\N
355879	GENERIC_DAY	0	0	f	2010-02-14	1623	\N	349504	\N
355880	GENERIC_DAY	0	0	f	2010-02-28	1623	\N	349504	\N
355881	GENERIC_DAY	0	3	f	2010-02-12	1619	\N	349504	\N
355882	GENERIC_DAY	0	3	f	2010-02-22	1619	\N	349504	\N
355883	GENERIC_DAY	0	3	f	2010-03-09	1619	\N	349504	\N
355884	GENERIC_DAY	0	0	f	2010-02-13	1619	\N	349504	\N
355885	GENERIC_DAY	0	2	f	2010-02-23	1625	\N	349504	\N
355886	GENERIC_DAY	0	2	f	2010-02-26	1625	\N	349504	\N
355887	GENERIC_DAY	0	3	f	2010-02-26	1619	\N	349504	\N
355888	GENERIC_DAY	0	2	f	2010-02-25	1625	\N	349504	\N
355889	GENERIC_DAY	0	3	f	2010-03-05	1619	\N	349504	\N
355890	GENERIC_DAY	0	0	f	2010-02-20	1625	\N	349504	\N
355891	GENERIC_DAY	0	2	f	2010-03-04	1625	\N	349504	\N
355892	GENERIC_DAY	0	2	f	2010-03-10	1619	\N	349504	\N
355893	GENERIC_DAY	0	0	f	2010-03-07	1619	\N	349504	\N
355894	GENERIC_DAY	0	0	f	2010-03-06	1623	\N	349504	\N
355895	GENERIC_DAY	0	2	f	2010-03-08	1625	\N	349504	\N
355896	GENERIC_DAY	0	3	f	2010-03-03	1619	\N	349504	\N
355897	GENERIC_DAY	0	3	f	2010-03-02	1619	\N	349504	\N
355898	GENERIC_DAY	0	2	f	2010-03-02	1625	\N	349504	\N
355899	GENERIC_DAY	0	2	f	2010-02-24	1625	\N	349504	\N
355900	GENERIC_DAY	0	3	f	2010-02-16	1619	\N	349504	\N
355901	GENERIC_DAY	0	3	f	2010-02-18	1623	\N	349504	\N
355902	GENERIC_DAY	0	3	f	2010-03-01	1623	\N	349504	\N
355903	GENERIC_DAY	0	3	f	2010-03-08	1619	\N	349504	\N
355904	GENERIC_DAY	0	2	f	2010-03-05	1625	\N	349504	\N
355905	GENERIC_DAY	0	3	f	2010-02-23	1619	\N	349504	\N
355906	GENERIC_DAY	0	3	f	2010-03-08	1623	\N	349504	\N
355907	GENERIC_DAY	0	2	f	2010-03-03	1625	\N	349504	\N
355908	GENERIC_DAY	0	0	f	2010-02-28	1619	\N	349504	\N
355909	GENERIC_DAY	0	3	f	2010-02-24	1623	\N	349504	\N
355910	GENERIC_DAY	0	3	f	2010-03-03	1623	\N	349504	\N
355911	GENERIC_DAY	0	3	f	2010-03-05	1623	\N	349504	\N
355912	GENERIC_DAY	0	0	f	2010-02-21	1619	\N	349504	\N
355913	GENERIC_DAY	0	3	f	2010-03-09	1623	\N	349504	\N
355914	GENERIC_DAY	0	3	f	2010-02-18	1619	\N	349504	\N
355915	GENERIC_DAY	0	2	f	2010-03-10	1623	\N	349504	\N
355916	GENERIC_DAY	0	3	f	2010-02-23	1623	\N	349504	\N
355917	GENERIC_DAY	0	3	f	2010-02-15	1623	\N	349504	\N
355918	GENERIC_DAY	0	3	f	2010-02-25	1623	\N	349504	\N
355919	GENERIC_DAY	0	0	f	2010-02-27	1623	\N	349504	\N
355920	GENERIC_DAY	0	2	f	2010-02-19	1625	\N	349504	\N
355921	GENERIC_DAY	0	3	f	2010-03-01	1619	\N	349504	\N
355922	GENERIC_DAY	0	3	f	2010-02-19	1619	\N	349504	\N
355923	GENERIC_DAY	0	2	f	2010-02-17	1625	\N	349504	\N
355924	GENERIC_DAY	0	0	f	2010-03-07	1623	\N	349504	\N
355925	GENERIC_DAY	0	3	f	2010-02-24	1619	\N	349504	\N
355926	GENERIC_DAY	0	2	f	2010-02-12	1625	\N	349504	\N
355927	GENERIC_DAY	0	0	f	2010-02-20	1623	\N	349504	\N
355928	GENERIC_DAY	0	3	f	2010-02-17	1619	\N	349504	\N
355929	GENERIC_DAY	0	3	f	2010-02-15	1619	\N	349504	\N
355930	GENERIC_DAY	0	2	f	2010-03-10	1625	\N	349504	\N
355931	GENERIC_DAY	0	0	f	2010-02-14	1625	\N	349504	\N
355932	GENERIC_DAY	0	3	f	2010-03-04	1619	\N	349504	\N
355933	GENERIC_DAY	0	0	f	2010-03-06	1625	\N	349504	\N
355934	GENERIC_DAY	0	2	f	2010-02-18	1625	\N	349504	\N
355935	GENERIC_DAY	0	3	f	2010-02-19	1623	\N	349504	\N
355936	GENERIC_DAY	0	0	f	2010-02-14	1619	\N	349504	\N
355937	GENERIC_DAY	0	2	f	2010-03-01	1625	\N	349504	\N
355938	GENERIC_DAY	0	2	f	2010-02-15	1625	\N	349504	\N
355939	GENERIC_DAY	0	3	f	2010-02-17	1623	\N	349504	\N
355940	GENERIC_DAY	0	3	f	2010-03-04	1623	\N	349504	\N
355941	GENERIC_DAY	0	0	f	2010-03-06	1619	\N	349504	\N
355942	GENERIC_DAY	0	2	f	2010-02-16	1625	\N	349504	\N
355943	GENERIC_DAY	0	3	f	2010-02-16	1623	\N	349504	\N
355944	GENERIC_DAY	0	3	f	2010-02-22	1623	\N	349504	\N
355945	GENERIC_DAY	0	0	f	2010-02-21	1625	\N	349504	\N
355946	GENERIC_DAY	0	0	f	2010-02-13	1623	\N	349504	\N
336624	GENERIC_DAY	3	0	f	2010-02-07	2727	\N	334945	\N
336643	GENERIC_DAY	3	2	f	2010-02-17	2729	\N	334945	\N
336617	GENERIC_DAY	3	2	f	2010-02-24	2727	\N	334945	\N
336576	GENERIC_DAY	3	2	f	2010-02-05	2727	\N	334945	\N
336634	GENERIC_DAY	3	0	f	2010-03-13	2727	\N	334945	\N
336648	GENERIC_DAY	3	2	f	2010-02-25	2729	\N	334945	\N
336614	GENERIC_DAY	3	2	f	2010-02-12	2727	\N	334945	\N
336612	GENERIC_DAY	3	2	f	2010-02-12	2729	\N	334945	\N
336591	GENERIC_DAY	3	2	f	2010-03-11	2729	\N	334945	\N
336599	GENERIC_DAY	3	2	f	2010-02-15	2729	\N	334945	\N
336575	GENERIC_DAY	3	0	f	2010-03-07	2729	\N	334945	\N
336650	GENERIC_DAY	3	2	f	2010-02-26	2729	\N	334945	\N
336610	GENERIC_DAY	3	2	f	2010-03-02	2729	\N	334945	\N
336560	GENERIC_DAY	3	1	f	2010-03-25	2729	\N	334945	\N
310199	GENERIC_DAY	0	8	f	2010-08-10	299977	\N	308868	\N
310200	GENERIC_DAY	0	8	f	2010-08-20	299977	\N	308868	\N
310201	GENERIC_DAY	0	0	f	2010-08-07	299977	\N	308868	\N
310202	GENERIC_DAY	0	0	f	2010-08-14	299977	\N	308868	\N
310203	GENERIC_DAY	0	8	f	2010-08-19	299977	\N	308868	\N
310204	GENERIC_DAY	0	8	f	2010-08-18	299977	\N	308868	\N
310205	GENERIC_DAY	0	8	f	2010-08-13	299977	\N	308868	\N
310206	GENERIC_DAY	0	8	f	2010-08-05	299977	\N	308868	\N
310207	GENERIC_DAY	0	0	f	2010-08-08	299977	\N	308868	\N
310208	GENERIC_DAY	0	8	f	2010-08-04	299977	\N	308868	\N
310209	GENERIC_DAY	0	8	f	2010-08-06	299977	\N	308868	\N
310210	GENERIC_DAY	0	8	f	2010-08-11	299977	\N	308868	\N
310211	GENERIC_DAY	0	0	f	2010-08-15	299977	\N	308868	\N
310212	GENERIC_DAY	0	8	f	2010-08-12	299977	\N	308868	\N
310213	GENERIC_DAY	0	8	f	2010-08-09	299977	\N	308868	\N
310214	GENERIC_DAY	0	8	f	2010-08-17	299977	\N	308868	\N
310215	GENERIC_DAY	0	8	f	2010-08-03	299977	\N	308868	\N
310216	GENERIC_DAY	0	8	f	2010-08-02	299977	\N	308868	\N
310217	GENERIC_DAY	0	8	f	2010-08-16	299977	\N	308868	\N
310218	GENERIC_DAY	0	0	f	2010-09-26	299971	\N	308869	\N
310219	GENERIC_DAY	0	8	f	2010-10-15	299971	\N	308869	\N
310220	GENERIC_DAY	0	4	f	2010-09-22	299971	\N	308869	\N
310221	GENERIC_DAY	0	8	f	2010-10-18	299971	\N	308869	\N
310222	GENERIC_DAY	0	8	f	2010-10-08	299971	\N	308869	\N
310223	GENERIC_DAY	0	8	f	2010-09-27	299971	\N	308869	\N
310224	GENERIC_DAY	0	8	f	2010-10-06	299971	\N	308869	\N
310225	GENERIC_DAY	0	0	f	2010-10-17	299971	\N	308869	\N
310226	GENERIC_DAY	0	2	f	2010-10-19	299971	\N	308869	\N
310227	GENERIC_DAY	0	8	f	2010-10-14	299971	\N	308869	\N
310228	GENERIC_DAY	0	8	f	2010-10-07	299971	\N	308869	\N
310229	GENERIC_DAY	0	0	f	2010-10-02	299971	\N	308869	\N
310230	GENERIC_DAY	0	0	f	2010-10-16	299971	\N	308869	\N
310231	GENERIC_DAY	0	0	f	2010-10-10	299971	\N	308869	\N
310232	GENERIC_DAY	0	8	f	2010-09-28	299971	\N	308869	\N
310233	GENERIC_DAY	0	0	f	2010-10-03	299971	\N	308869	\N
310234	GENERIC_DAY	0	8	f	2010-10-12	299971	\N	308869	\N
310235	GENERIC_DAY	0	8	f	2010-10-13	299971	\N	308869	\N
310236	GENERIC_DAY	0	8	f	2010-09-24	299971	\N	308869	\N
310237	GENERIC_DAY	0	8	f	2010-10-05	299971	\N	308869	\N
310238	GENERIC_DAY	0	0	f	2010-10-09	299971	\N	308869	\N
310239	GENERIC_DAY	0	8	f	2010-10-11	299971	\N	308869	\N
310240	GENERIC_DAY	0	8	f	2010-09-30	299971	\N	308869	\N
310241	GENERIC_DAY	0	0	f	2010-09-25	299971	\N	308869	\N
310242	GENERIC_DAY	0	8	f	2010-10-04	299971	\N	308869	\N
310243	GENERIC_DAY	0	8	f	2010-09-23	299971	\N	308869	\N
310244	GENERIC_DAY	0	8	f	2010-09-29	299971	\N	308869	\N
310245	GENERIC_DAY	0	8	f	2010-10-01	299971	\N	308869	\N
310246	GENERIC_DAY	0	0	f	2010-08-28	299971	\N	308870	\N
310247	GENERIC_DAY	0	8	f	2010-09-15	299971	\N	308870	\N
310248	GENERIC_DAY	0	8	f	2010-09-07	299971	\N	308870	\N
310249	GENERIC_DAY	0	4	f	2010-09-22	299971	\N	308870	\N
310250	GENERIC_DAY	0	0	f	2010-09-11	299971	\N	308870	\N
310251	GENERIC_DAY	0	0	f	2010-09-19	299971	\N	308870	\N
310252	GENERIC_DAY	0	8	f	2010-08-27	299971	\N	308870	\N
310253	GENERIC_DAY	0	8	f	2010-09-03	299971	\N	308870	\N
310254	GENERIC_DAY	0	8	f	2010-08-31	299971	\N	308870	\N
310255	GENERIC_DAY	0	8	f	2010-08-30	299971	\N	308870	\N
310256	GENERIC_DAY	0	8	f	2010-09-20	299971	\N	308870	\N
310257	GENERIC_DAY	0	0	f	2010-09-12	299971	\N	308870	\N
310258	GENERIC_DAY	0	0	f	2010-08-29	299971	\N	308870	\N
310259	GENERIC_DAY	0	8	f	2010-09-10	299971	\N	308870	\N
310260	GENERIC_DAY	0	8	f	2010-09-09	299971	\N	308870	\N
310261	GENERIC_DAY	0	0	f	2010-09-04	299971	\N	308870	\N
310262	GENERIC_DAY	0	8	f	2010-09-08	299971	\N	308870	\N
310263	GENERIC_DAY	0	0	f	2010-09-05	299971	\N	308870	\N
310264	GENERIC_DAY	0	8	f	2010-09-17	299971	\N	308870	\N
310265	GENERIC_DAY	0	8	f	2010-09-06	299971	\N	308870	\N
310266	GENERIC_DAY	0	8	f	2010-09-14	299971	\N	308870	\N
310267	GENERIC_DAY	0	8	f	2010-09-01	299971	\N	308870	\N
310268	GENERIC_DAY	0	0	f	2010-09-18	299971	\N	308870	\N
310269	GENERIC_DAY	0	2	f	2010-08-26	299971	\N	308870	\N
310270	GENERIC_DAY	0	8	f	2010-09-21	299971	\N	308870	\N
310271	GENERIC_DAY	0	8	f	2010-09-13	299971	\N	308870	\N
310272	GENERIC_DAY	0	8	f	2010-09-02	299971	\N	308870	\N
310273	GENERIC_DAY	0	8	f	2010-09-16	299971	\N	308870	\N
310274	GENERIC_DAY	0	0	f	2010-09-19	299973	\N	308871	\N
310275	GENERIC_DAY	0	8	f	2010-09-15	299973	\N	308871	\N
310276	GENERIC_DAY	0	8	f	2010-09-03	299973	\N	308871	\N
310277	GENERIC_DAY	0	4	f	2010-09-22	299973	\N	308871	\N
310278	GENERIC_DAY	0	2	f	2010-08-26	299973	\N	308871	\N
310279	GENERIC_DAY	0	0	f	2010-08-28	299973	\N	308871	\N
310280	GENERIC_DAY	0	8	f	2010-09-21	299973	\N	308871	\N
310281	GENERIC_DAY	0	0	f	2010-09-11	299973	\N	308871	\N
310282	GENERIC_DAY	0	8	f	2010-09-20	299973	\N	308871	\N
310283	GENERIC_DAY	0	0	f	2010-09-18	299973	\N	308871	\N
310284	GENERIC_DAY	0	8	f	2010-09-01	299973	\N	308871	\N
310285	GENERIC_DAY	0	8	f	2010-09-16	299973	\N	308871	\N
310286	GENERIC_DAY	0	8	f	2010-09-13	299973	\N	308871	\N
310287	GENERIC_DAY	0	8	f	2010-09-08	299973	\N	308871	\N
310288	GENERIC_DAY	0	0	f	2010-09-04	299973	\N	308871	\N
310289	GENERIC_DAY	0	8	f	2010-09-10	299973	\N	308871	\N
310290	GENERIC_DAY	0	8	f	2010-09-02	299973	\N	308871	\N
310291	GENERIC_DAY	0	8	f	2010-09-14	299973	\N	308871	\N
310292	GENERIC_DAY	0	8	f	2010-09-17	299973	\N	308871	\N
310293	GENERIC_DAY	0	8	f	2010-08-27	299973	\N	308871	\N
310294	GENERIC_DAY	0	0	f	2010-09-05	299973	\N	308871	\N
310295	GENERIC_DAY	0	8	f	2010-09-07	299973	\N	308871	\N
310296	GENERIC_DAY	0	8	f	2010-08-31	299973	\N	308871	\N
310297	GENERIC_DAY	0	8	f	2010-08-30	299973	\N	308871	\N
310298	GENERIC_DAY	0	8	f	2010-09-09	299973	\N	308871	\N
310299	GENERIC_DAY	0	0	f	2010-09-12	299973	\N	308871	\N
310300	GENERIC_DAY	0	0	f	2010-08-29	299973	\N	308871	\N
310301	GENERIC_DAY	0	8	f	2010-09-06	299973	\N	308871	\N
310302	GENERIC_DAY	0	0	f	2010-09-04	299975	\N	308872	\N
310303	GENERIC_DAY	0	0	f	2010-08-20	299975	\N	308872	\N
310304	GENERIC_DAY	0	8	f	2010-08-27	299975	\N	308872	\N
310305	GENERIC_DAY	0	8	f	2010-08-26	299975	\N	308872	\N
310306	GENERIC_DAY	0	0	f	2010-08-21	299975	\N	308872	\N
310307	GENERIC_DAY	0	8	f	2010-08-23	299975	\N	308872	\N
310308	GENERIC_DAY	0	8	f	2010-09-06	299975	\N	308872	\N
310309	GENERIC_DAY	0	0	f	2010-08-29	299975	\N	308872	\N
310310	GENERIC_DAY	0	8	f	2010-08-30	299975	\N	308872	\N
310311	GENERIC_DAY	0	0	f	2010-08-22	299975	\N	308872	\N
310312	GENERIC_DAY	0	8	f	2010-09-01	299975	\N	308872	\N
310313	GENERIC_DAY	0	8	f	2010-09-09	299975	\N	308872	\N
310314	GENERIC_DAY	0	8	f	2010-09-03	299975	\N	308872	\N
310315	GENERIC_DAY	0	8	f	2010-09-07	299975	\N	308872	\N
310316	GENERIC_DAY	0	8	f	2010-09-02	299975	\N	308872	\N
310317	GENERIC_DAY	0	8	f	2010-09-10	299975	\N	308872	\N
310318	GENERIC_DAY	0	8	f	2010-09-08	299975	\N	308872	\N
310319	GENERIC_DAY	0	8	f	2010-08-31	299975	\N	308872	\N
310320	GENERIC_DAY	0	0	f	2010-08-28	299975	\N	308872	\N
310321	GENERIC_DAY	0	8	f	2010-08-25	299975	\N	308872	\N
310322	GENERIC_DAY	0	8	f	2010-08-24	299975	\N	308872	\N
310323	GENERIC_DAY	0	0	f	2010-09-05	299975	\N	308872	\N
310324	GENERIC_DAY	0	8	f	2010-08-13	299973	\N	308873	\N
310325	GENERIC_DAY	0	0	f	2010-08-21	299973	\N	308873	\N
310326	GENERIC_DAY	0	8	f	2010-08-20	299973	\N	308873	\N
310327	GENERIC_DAY	0	8	f	2010-08-04	299973	\N	308873	\N
310328	GENERIC_DAY	0	8	f	2010-08-10	299973	\N	308873	\N
310329	GENERIC_DAY	0	8	f	2010-08-19	299973	\N	308873	\N
310330	GENERIC_DAY	0	8	f	2010-08-11	299973	\N	308873	\N
310331	GENERIC_DAY	0	0	f	2010-08-07	299973	\N	308873	\N
310332	GENERIC_DAY	0	6	f	2010-08-26	299973	\N	308873	\N
310333	GENERIC_DAY	0	0	f	2010-08-14	299973	\N	308873	\N
310334	GENERIC_DAY	0	8	f	2010-08-25	299973	\N	308873	\N
310335	GENERIC_DAY	0	8	f	2010-08-18	299973	\N	308873	\N
310336	GENERIC_DAY	0	8	f	2010-08-05	299973	\N	308873	\N
310337	GENERIC_DAY	0	8	f	2010-08-09	299973	\N	308873	\N
310338	GENERIC_DAY	0	8	f	2010-08-23	299973	\N	308873	\N
310339	GENERIC_DAY	0	8	f	2010-08-06	299973	\N	308873	\N
310340	GENERIC_DAY	0	8	f	2010-08-03	299973	\N	308873	\N
310341	GENERIC_DAY	0	8	f	2010-08-02	299973	\N	308873	\N
310342	GENERIC_DAY	0	8	f	2010-08-16	299973	\N	308873	\N
310343	GENERIC_DAY	0	8	f	2010-08-24	299973	\N	308873	\N
310344	GENERIC_DAY	0	8	f	2010-08-12	299973	\N	308873	\N
310345	GENERIC_DAY	0	0	f	2010-08-15	299973	\N	308873	\N
310346	GENERIC_DAY	0	8	f	2010-08-17	299973	\N	308873	\N
310347	GENERIC_DAY	0	0	f	2010-08-22	299973	\N	308873	\N
310348	GENERIC_DAY	0	0	f	2010-08-08	299973	\N	308873	\N
310349	GENERIC_DAY	0	8	f	2010-08-04	299971	\N	308874	\N
310350	GENERIC_DAY	0	8	f	2010-08-18	299971	\N	308874	\N
310351	GENERIC_DAY	0	0	f	2010-08-15	299971	\N	308874	\N
310352	GENERIC_DAY	0	0	f	2010-08-14	299971	\N	308874	\N
310353	GENERIC_DAY	0	6	f	2010-08-26	299971	\N	308874	\N
310354	GENERIC_DAY	0	0	f	2010-08-08	299971	\N	308874	\N
310355	GENERIC_DAY	0	8	f	2010-08-19	299971	\N	308874	\N
310356	GENERIC_DAY	0	8	f	2010-08-23	299971	\N	308874	\N
310357	GENERIC_DAY	0	8	f	2010-08-25	299971	\N	308874	\N
310358	GENERIC_DAY	0	8	f	2010-08-05	299971	\N	308874	\N
310359	GENERIC_DAY	0	8	f	2010-08-09	299971	\N	308874	\N
310360	GENERIC_DAY	0	8	f	2010-08-10	299971	\N	308874	\N
310361	GENERIC_DAY	0	8	f	2010-08-20	299971	\N	308874	\N
310362	GENERIC_DAY	0	8	f	2010-08-03	299971	\N	308874	\N
310363	GENERIC_DAY	0	8	f	2010-08-11	299971	\N	308874	\N
310364	GENERIC_DAY	0	0	f	2010-08-21	299971	\N	308874	\N
310365	GENERIC_DAY	0	8	f	2010-08-06	299971	\N	308874	\N
310366	GENERIC_DAY	0	8	f	2010-08-16	299971	\N	308874	\N
310367	GENERIC_DAY	0	8	f	2010-08-12	299971	\N	308874	\N
310368	GENERIC_DAY	0	8	f	2010-08-17	299971	\N	308874	\N
310369	GENERIC_DAY	0	8	f	2010-08-13	299971	\N	308874	\N
310370	GENERIC_DAY	0	8	f	2010-08-02	299971	\N	308874	\N
310371	GENERIC_DAY	0	0	f	2010-08-07	299971	\N	308874	\N
310372	GENERIC_DAY	0	8	f	2010-08-24	299971	\N	308874	\N
310373	GENERIC_DAY	0	0	f	2010-08-22	299971	\N	308874	\N
310374	GENERIC_DAY	0	8	f	2010-08-04	299975	\N	308875	\N
310375	GENERIC_DAY	0	8	f	2010-08-19	299975	\N	308875	\N
310376	GENERIC_DAY	0	0	f	2010-08-08	299975	\N	308875	\N
310377	GENERIC_DAY	0	8	f	2010-08-11	299975	\N	308875	\N
310378	GENERIC_DAY	0	0	f	2010-08-14	299975	\N	308875	\N
310379	GENERIC_DAY	0	8	f	2010-08-03	299975	\N	308875	\N
310380	GENERIC_DAY	0	8	f	2010-08-16	299975	\N	308875	\N
310381	GENERIC_DAY	0	8	f	2010-08-20	299975	\N	308875	\N
310382	GENERIC_DAY	0	8	f	2010-08-02	299975	\N	308875	\N
310383	GENERIC_DAY	0	8	f	2010-08-06	299975	\N	308875	\N
310384	GENERIC_DAY	0	8	f	2010-08-17	299975	\N	308875	\N
310385	GENERIC_DAY	0	8	f	2010-08-09	299975	\N	308875	\N
310386	GENERIC_DAY	0	8	f	2010-08-10	299975	\N	308875	\N
310387	GENERIC_DAY	0	0	f	2010-08-07	299975	\N	308875	\N
310388	GENERIC_DAY	0	0	f	2010-08-15	299975	\N	308875	\N
310389	GENERIC_DAY	0	8	f	2010-08-12	299975	\N	308875	\N
310390	GENERIC_DAY	0	8	f	2010-08-13	299975	\N	308875	\N
310391	GENERIC_DAY	0	8	f	2010-08-05	299975	\N	308875	\N
310392	GENERIC_DAY	0	8	f	2010-08-18	299975	\N	308875	\N
310393	GENERIC_DAY	0	8	f	2010-09-14	299975	\N	308876	\N
310394	GENERIC_DAY	0	8	f	2010-09-27	299975	\N	308876	\N
310395	GENERIC_DAY	0	0	f	2010-09-11	299975	\N	308876	\N
310396	GENERIC_DAY	0	8	f	2010-09-17	299975	\N	308876	\N
310397	GENERIC_DAY	0	8	f	2010-09-15	299975	\N	308876	\N
310398	GENERIC_DAY	0	8	f	2010-09-21	299975	\N	308876	\N
310399	GENERIC_DAY	0	8	f	2010-09-24	299975	\N	308876	\N
310400	GENERIC_DAY	0	8	f	2010-09-23	299975	\N	308876	\N
310401	GENERIC_DAY	0	8	f	2010-09-16	299975	\N	308876	\N
310402	GENERIC_DAY	0	8	f	2010-10-01	299975	\N	308876	\N
310403	GENERIC_DAY	0	8	f	2010-09-30	299975	\N	308876	\N
310404	GENERIC_DAY	0	8	f	2010-09-28	299975	\N	308876	\N
310405	GENERIC_DAY	0	0	f	2010-09-26	299975	\N	308876	\N
310406	GENERIC_DAY	0	8	f	2010-09-22	299975	\N	308876	\N
310407	GENERIC_DAY	0	0	f	2010-09-12	299975	\N	308876	\N
310408	GENERIC_DAY	0	8	f	2010-09-29	299975	\N	308876	\N
310409	GENERIC_DAY	0	0	f	2010-09-19	299975	\N	308876	\N
310410	GENERIC_DAY	0	0	f	2010-09-25	299975	\N	308876	\N
310411	GENERIC_DAY	0	0	f	2010-09-10	299975	\N	308876	\N
310412	GENERIC_DAY	0	0	f	2010-09-18	299975	\N	308876	\N
310413	GENERIC_DAY	0	8	f	2010-09-20	299975	\N	308876	\N
310414	GENERIC_DAY	0	8	f	2010-09-13	299975	\N	308876	\N
310415	GENERIC_DAY	0	0	f	2010-08-29	299977	\N	308877	\N
310416	GENERIC_DAY	0	8	f	2010-08-26	299977	\N	308877	\N
310417	GENERIC_DAY	0	8	f	2010-08-25	299977	\N	308877	\N
310418	GENERIC_DAY	0	8	f	2010-08-30	299977	\N	308877	\N
310419	GENERIC_DAY	0	8	f	2010-09-06	299977	\N	308877	\N
310420	GENERIC_DAY	0	8	f	2010-09-09	299977	\N	308877	\N
310421	GENERIC_DAY	0	8	f	2010-09-01	299977	\N	308877	\N
310422	GENERIC_DAY	0	0	f	2010-08-20	299977	\N	308877	\N
310423	GENERIC_DAY	0	8	f	2010-09-02	299977	\N	308877	\N
310424	GENERIC_DAY	0	8	f	2010-08-27	299977	\N	308877	\N
310425	GENERIC_DAY	0	0	f	2010-08-22	299977	\N	308877	\N
310426	GENERIC_DAY	0	8	f	2010-08-23	299977	\N	308877	\N
310427	GENERIC_DAY	0	0	f	2010-08-21	299977	\N	308877	\N
310428	GENERIC_DAY	0	8	f	2010-08-31	299977	\N	308877	\N
310429	GENERIC_DAY	0	8	f	2010-09-07	299977	\N	308877	\N
310430	GENERIC_DAY	0	8	f	2010-09-08	299977	\N	308877	\N
310431	GENERIC_DAY	0	8	f	2010-08-24	299977	\N	308877	\N
310432	GENERIC_DAY	0	0	f	2010-09-04	299977	\N	308877	\N
310433	GENERIC_DAY	0	8	f	2010-09-03	299977	\N	308877	\N
310434	GENERIC_DAY	0	8	f	2010-09-10	299977	\N	308877	\N
310435	GENERIC_DAY	0	0	f	2010-09-05	299977	\N	308877	\N
310436	GENERIC_DAY	0	0	f	2010-08-28	299977	\N	308877	\N
355947	GENERIC_DAY	0	2	f	2010-03-26	1623	\N	349505	\N
355948	GENERIC_DAY	0	2	f	2010-03-23	1623	\N	349505	\N
355949	GENERIC_DAY	0	3	f	2010-03-30	1625	\N	349505	\N
355950	GENERIC_DAY	0	2	f	2010-04-06	1623	\N	349505	\N
355951	GENERIC_DAY	0	0	f	2010-03-28	1623	\N	349505	\N
355952	GENERIC_DAY	0	0	f	2010-03-21	1619	\N	349505	\N
355953	GENERIC_DAY	0	3	f	2010-03-22	1619	\N	349505	\N
355954	GENERIC_DAY	0	3	f	2010-04-01	1625	\N	349505	\N
355955	GENERIC_DAY	0	3	f	2010-03-11	1625	\N	349505	\N
355956	GENERIC_DAY	0	2	f	2010-03-19	1623	\N	349505	\N
355957	GENERIC_DAY	0	2	f	2010-03-15	1623	\N	349505	\N
355958	GENERIC_DAY	0	3	f	2010-03-19	1619	\N	349505	\N
355959	GENERIC_DAY	0	0	f	2010-03-21	1623	\N	349505	\N
355960	GENERIC_DAY	0	0	f	2010-03-13	1619	\N	349505	\N
355961	GENERIC_DAY	0	2	f	2010-04-01	1623	\N	349505	\N
355962	GENERIC_DAY	0	3	f	2010-03-18	1619	\N	349505	\N
355963	GENERIC_DAY	0	3	f	2010-03-25	1625	\N	349505	\N
355964	GENERIC_DAY	0	3	f	2010-03-19	1625	\N	349505	\N
355965	GENERIC_DAY	0	2	f	2010-03-12	1623	\N	349505	\N
355966	GENERIC_DAY	0	0	f	2010-04-04	1619	\N	349505	\N
355967	GENERIC_DAY	0	3	f	2010-03-24	1625	\N	349505	\N
355968	GENERIC_DAY	0	3	f	2010-03-18	1625	\N	349505	\N
355969	GENERIC_DAY	0	0	f	2010-04-03	1625	\N	349505	\N
355970	GENERIC_DAY	0	0	f	2010-04-04	1623	\N	349505	\N
355971	GENERIC_DAY	0	2	f	2010-03-18	1623	\N	349505	\N
355972	GENERIC_DAY	0	0	f	2010-03-28	1625	\N	349505	\N
355973	GENERIC_DAY	0	3	f	2010-03-29	1619	\N	349505	\N
355974	GENERIC_DAY	0	2	f	2010-04-06	1619	\N	349505	\N
355975	GENERIC_DAY	0	2	f	2010-03-11	1623	\N	349505	\N
355976	GENERIC_DAY	0	2	f	2010-03-16	1623	\N	349505	\N
355977	GENERIC_DAY	0	3	f	2010-04-05	1619	\N	349505	\N
355978	GENERIC_DAY	0	0	f	2010-04-03	1619	\N	349505	\N
355979	GENERIC_DAY	0	0	f	2010-03-14	1625	\N	349505	\N
355980	GENERIC_DAY	0	3	f	2010-03-17	1619	\N	349505	\N
355981	GENERIC_DAY	0	2	f	2010-03-17	1623	\N	349505	\N
355982	GENERIC_DAY	0	3	f	2010-04-02	1619	\N	349505	\N
355983	GENERIC_DAY	0	0	f	2010-03-14	1619	\N	349505	\N
355984	GENERIC_DAY	0	0	f	2010-03-13	1623	\N	349505	\N
355985	GENERIC_DAY	0	0	f	2010-03-20	1623	\N	349505	\N
355986	GENERIC_DAY	0	0	f	2010-03-20	1625	\N	349505	\N
355987	GENERIC_DAY	0	3	f	2010-03-29	1625	\N	349505	\N
355988	GENERIC_DAY	0	3	f	2010-03-12	1625	\N	349505	\N
355989	GENERIC_DAY	0	3	f	2010-03-25	1619	\N	349505	\N
355990	GENERIC_DAY	0	3	f	2010-03-22	1625	\N	349505	\N
355991	GENERIC_DAY	0	3	f	2010-03-31	1625	\N	349505	\N
355992	GENERIC_DAY	0	3	f	2010-03-23	1619	\N	349505	\N
355993	GENERIC_DAY	0	3	f	2010-03-16	1625	\N	349505	\N
355994	GENERIC_DAY	0	3	f	2010-04-01	1619	\N	349505	\N
355995	GENERIC_DAY	0	2	f	2010-04-02	1623	\N	349505	\N
355996	GENERIC_DAY	0	3	f	2010-03-11	1619	\N	349505	\N
355997	GENERIC_DAY	0	2	f	2010-03-31	1623	\N	349505	\N
355998	GENERIC_DAY	0	2	f	2010-04-06	1625	\N	349505	\N
355999	GENERIC_DAY	0	0	f	2010-03-14	1623	\N	349505	\N
356000	GENERIC_DAY	0	0	f	2010-03-13	1625	\N	349505	\N
356001	GENERIC_DAY	0	3	f	2010-03-15	1625	\N	349505	\N
356002	GENERIC_DAY	0	3	f	2010-03-24	1619	\N	349505	\N
356003	GENERIC_DAY	0	3	f	2010-03-23	1625	\N	349505	\N
356004	GENERIC_DAY	0	3	f	2010-03-16	1619	\N	349505	\N
356005	GENERIC_DAY	0	0	f	2010-04-03	1623	\N	349505	\N
356006	GENERIC_DAY	0	3	f	2010-03-17	1625	\N	349505	\N
356007	GENERIC_DAY	0	2	f	2010-03-25	1623	\N	349505	\N
356008	GENERIC_DAY	0	0	f	2010-03-21	1625	\N	349505	\N
356009	GENERIC_DAY	0	0	f	2010-03-27	1625	\N	349505	\N
356010	GENERIC_DAY	0	3	f	2010-03-31	1619	\N	349505	\N
356011	GENERIC_DAY	0	2	f	2010-03-24	1623	\N	349505	\N
356012	GENERIC_DAY	0	0	f	2010-03-27	1623	\N	349505	\N
356013	GENERIC_DAY	0	3	f	2010-03-12	1619	\N	349505	\N
356014	GENERIC_DAY	0	0	f	2010-03-20	1619	\N	349505	\N
356015	GENERIC_DAY	0	2	f	2010-03-30	1623	\N	349505	\N
356016	GENERIC_DAY	0	3	f	2010-03-30	1619	\N	349505	\N
356017	GENERIC_DAY	0	2	f	2010-04-05	1623	\N	349505	\N
356018	GENERIC_DAY	0	3	f	2010-03-26	1625	\N	349505	\N
356019	GENERIC_DAY	0	2	f	2010-03-29	1623	\N	349505	\N
356020	GENERIC_DAY	0	3	f	2010-04-02	1625	\N	349505	\N
356021	GENERIC_DAY	0	3	f	2010-04-05	1625	\N	349505	\N
356022	GENERIC_DAY	0	0	f	2010-04-04	1625	\N	349505	\N
356023	GENERIC_DAY	0	0	f	2010-03-27	1619	\N	349505	\N
356024	GENERIC_DAY	0	0	f	2010-03-28	1619	\N	349505	\N
356025	GENERIC_DAY	0	3	f	2010-03-15	1619	\N	349505	\N
356026	GENERIC_DAY	0	2	f	2010-03-22	1623	\N	349505	\N
356027	GENERIC_DAY	0	3	f	2010-03-26	1619	\N	349505	\N
315019	GENERIC_DAY	0	8	f	2010-02-19	299985	\N	314918	\N
315020	GENERIC_DAY	0	0	f	2010-02-07	299985	\N	314918	\N
315021	GENERIC_DAY	0	8	f	2010-02-04	299985	\N	314918	\N
315022	GENERIC_DAY	0	8	f	2010-02-10	299985	\N	314918	\N
315023	GENERIC_DAY	0	8	f	2010-02-15	299985	\N	314918	\N
315024	GENERIC_DAY	0	8	f	2010-02-18	299985	\N	314918	\N
315025	GENERIC_DAY	0	8	f	2010-02-05	299985	\N	314918	\N
315026	GENERIC_DAY	0	8	f	2010-01-28	299985	\N	314918	\N
315027	GENERIC_DAY	0	0	f	2010-01-31	299985	\N	314918	\N
315028	GENERIC_DAY	0	8	f	2010-02-03	299985	\N	314918	\N
315029	GENERIC_DAY	0	2	f	2010-01-27	299985	\N	314918	\N
315030	GENERIC_DAY	0	8	f	2010-02-02	299985	\N	314918	\N
315031	GENERIC_DAY	0	8	f	2010-02-12	299985	\N	314918	\N
315032	GENERIC_DAY	0	8	f	2010-02-01	299985	\N	314918	\N
315033	GENERIC_DAY	0	0	f	2010-02-13	299985	\N	314918	\N
315034	GENERIC_DAY	0	8	f	2010-02-16	299985	\N	314918	\N
315035	GENERIC_DAY	0	8	f	2010-02-08	299985	\N	314918	\N
315036	GENERIC_DAY	0	0	f	2010-02-14	299985	\N	314918	\N
315037	GENERIC_DAY	0	8	f	2010-01-29	299985	\N	314918	\N
315038	GENERIC_DAY	0	8	f	2010-02-09	299985	\N	314918	\N
315039	GENERIC_DAY	0	0	f	2010-02-06	299985	\N	314918	\N
315040	GENERIC_DAY	0	8	f	2010-02-22	299985	\N	314918	\N
315041	GENERIC_DAY	0	4	f	2010-02-23	299985	\N	314918	\N
315042	GENERIC_DAY	0	0	f	2010-01-30	299985	\N	314918	\N
315043	GENERIC_DAY	0	8	f	2010-02-11	299985	\N	314918	\N
315044	GENERIC_DAY	0	8	f	2010-02-17	299985	\N	314918	\N
315045	GENERIC_DAY	0	0	f	2010-02-20	299985	\N	314918	\N
315046	GENERIC_DAY	0	0	f	2010-02-21	299985	\N	314918	\N
315047	GENERIC_DAY	0	0	f	2010-03-14	299979	\N	314919	\N
315048	GENERIC_DAY	0	8	f	2010-03-02	299979	\N	314919	\N
315049	GENERIC_DAY	0	8	f	2010-03-05	299979	\N	314919	\N
315050	GENERIC_DAY	0	8	f	2010-03-16	299979	\N	314919	\N
315051	GENERIC_DAY	0	8	f	2010-03-15	299979	\N	314919	\N
315052	GENERIC_DAY	0	8	f	2010-03-12	299979	\N	314919	\N
315053	GENERIC_DAY	0	0	f	2010-03-20	299979	\N	314919	\N
315054	GENERIC_DAY	0	8	f	2010-03-04	299979	\N	314919	\N
315055	GENERIC_DAY	0	0	f	2010-03-13	299979	\N	314919	\N
315056	GENERIC_DAY	0	8	f	2010-03-17	299979	\N	314919	\N
315057	GENERIC_DAY	0	8	f	2010-02-26	299979	\N	314919	\N
315058	GENERIC_DAY	0	2	f	2010-03-22	299979	\N	314919	\N
315059	GENERIC_DAY	0	8	f	2010-03-18	299979	\N	314919	\N
315060	GENERIC_DAY	0	0	f	2010-03-06	299979	\N	314919	\N
315061	GENERIC_DAY	0	8	f	2010-03-09	299979	\N	314919	\N
315062	GENERIC_DAY	0	8	f	2010-02-25	299979	\N	314919	\N
315063	GENERIC_DAY	0	0	f	2010-03-07	299979	\N	314919	\N
315064	GENERIC_DAY	0	8	f	2010-03-10	299979	\N	314919	\N
315065	GENERIC_DAY	0	8	f	2010-03-11	299979	\N	314919	\N
315066	GENERIC_DAY	0	0	f	2010-02-28	299979	\N	314919	\N
315067	GENERIC_DAY	0	8	f	2010-03-08	299979	\N	314919	\N
315068	GENERIC_DAY	0	0	f	2010-03-21	299979	\N	314919	\N
315069	GENERIC_DAY	0	0	f	2010-02-27	299979	\N	314919	\N
315070	GENERIC_DAY	0	8	f	2010-02-24	299979	\N	314919	\N
315071	GENERIC_DAY	0	8	f	2010-03-03	299979	\N	314919	\N
315072	GENERIC_DAY	0	4	f	2010-02-23	299979	\N	314919	\N
315073	GENERIC_DAY	0	8	f	2010-03-01	299979	\N	314919	\N
315074	GENERIC_DAY	0	8	f	2010-03-19	299979	\N	314919	\N
315075	GENERIC_DAY	0	8	f	2010-04-26	299979	\N	314920	\N
315076	GENERIC_DAY	0	8	f	2010-05-10	299979	\N	314920	\N
315077	GENERIC_DAY	0	8	f	2010-04-16	299979	\N	314920	\N
315078	GENERIC_DAY	0	8	f	2010-04-21	299979	\N	314920	\N
315079	GENERIC_DAY	0	8	f	2010-05-04	299979	\N	314920	\N
315080	GENERIC_DAY	0	8	f	2010-04-20	299979	\N	314920	\N
315081	GENERIC_DAY	0	0	f	2010-05-01	299979	\N	314920	\N
315082	GENERIC_DAY	0	0	f	2010-05-08	299979	\N	314920	\N
315083	GENERIC_DAY	0	8	f	2010-05-06	299979	\N	314920	\N
315084	GENERIC_DAY	0	8	f	2010-04-23	299979	\N	314920	\N
315085	GENERIC_DAY	0	0	f	2010-05-09	299979	\N	314920	\N
315086	GENERIC_DAY	0	0	f	2010-04-24	299979	\N	314920	\N
315087	GENERIC_DAY	0	0	f	2010-04-25	299979	\N	314920	\N
315088	GENERIC_DAY	0	8	f	2010-04-29	299979	\N	314920	\N
315089	GENERIC_DAY	0	0	f	2010-04-17	299979	\N	314920	\N
315090	GENERIC_DAY	0	8	f	2010-05-03	299979	\N	314920	\N
315091	GENERIC_DAY	0	0	f	2010-04-18	299979	\N	314920	\N
315092	GENERIC_DAY	0	8	f	2010-05-07	299979	\N	314920	\N
315093	GENERIC_DAY	0	8	f	2010-04-19	299979	\N	314920	\N
315094	GENERIC_DAY	0	0	f	2010-04-15	299979	\N	314920	\N
315095	GENERIC_DAY	0	8	f	2010-04-27	299979	\N	314920	\N
315096	GENERIC_DAY	0	8	f	2010-05-11	299979	\N	314920	\N
315097	GENERIC_DAY	0	8	f	2010-04-28	299979	\N	314920	\N
315098	GENERIC_DAY	0	8	f	2010-04-30	299979	\N	314920	\N
315099	GENERIC_DAY	0	6	f	2010-05-12	299979	\N	314920	\N
315100	GENERIC_DAY	0	8	f	2010-04-22	299979	\N	314920	\N
315101	GENERIC_DAY	0	0	f	2010-05-02	299979	\N	314920	\N
315102	GENERIC_DAY	0	8	f	2010-05-05	299979	\N	314920	\N
315103	GENERIC_DAY	0	0	f	2010-01-16	299979	\N	314921	\N
315104	GENERIC_DAY	0	0	f	2010-01-03	299979	\N	314921	\N
315105	GENERIC_DAY	0	8	f	2010-01-15	299979	\N	314921	\N
315106	GENERIC_DAY	0	8	f	2010-01-21	299979	\N	314921	\N
315107	GENERIC_DAY	0	8	f	2010-01-22	299979	\N	314921	\N
315108	GENERIC_DAY	0	0	f	2010-01-09	299979	\N	314921	\N
315109	GENERIC_DAY	0	8	f	2010-01-04	299979	\N	314921	\N
315110	GENERIC_DAY	0	8	f	2010-01-26	299979	\N	314921	\N
315111	GENERIC_DAY	0	0	f	2010-01-23	299979	\N	314921	\N
315112	GENERIC_DAY	0	8	f	2010-01-08	299979	\N	314921	\N
315113	GENERIC_DAY	0	8	f	2010-01-06	299979	\N	314921	\N
315114	GENERIC_DAY	0	8	f	2010-01-20	299979	\N	314921	\N
315115	GENERIC_DAY	0	8	f	2010-01-12	299979	\N	314921	\N
315116	GENERIC_DAY	0	8	f	2010-01-13	299979	\N	314921	\N
315117	GENERIC_DAY	0	6	f	2010-01-27	299979	\N	314921	\N
315118	GENERIC_DAY	0	8	f	2010-01-05	299979	\N	314921	\N
315119	GENERIC_DAY	0	0	f	2010-01-10	299979	\N	314921	\N
315120	GENERIC_DAY	0	8	f	2010-01-01	299979	\N	314921	\N
315121	GENERIC_DAY	0	8	f	2010-01-07	299979	\N	314921	\N
315122	GENERIC_DAY	0	8	f	2010-01-14	299979	\N	314921	\N
315123	GENERIC_DAY	0	8	f	2010-01-25	299979	\N	314921	\N
315124	GENERIC_DAY	0	0	f	2010-01-02	299979	\N	314921	\N
315125	GENERIC_DAY	0	8	f	2010-01-19	299979	\N	314921	\N
315126	GENERIC_DAY	0	8	f	2010-01-18	299979	\N	314921	\N
315127	GENERIC_DAY	0	0	f	2010-01-24	299979	\N	314921	\N
315128	GENERIC_DAY	0	8	f	2010-01-11	299979	\N	314921	\N
315129	GENERIC_DAY	0	0	f	2010-01-17	299979	\N	314921	\N
315130	GENERIC_DAY	0	8	f	2010-01-15	299983	\N	314922	\N
315131	GENERIC_DAY	0	8	f	2010-01-08	299983	\N	314922	\N
315132	GENERIC_DAY	0	0	f	2010-01-10	299983	\N	314922	\N
315133	GENERIC_DAY	0	8	f	2010-01-26	299983	\N	314922	\N
315134	GENERIC_DAY	0	0	f	2010-01-17	299983	\N	314922	\N
315135	GENERIC_DAY	0	0	f	2010-01-09	299983	\N	314922	\N
315136	GENERIC_DAY	0	8	f	2010-01-05	299983	\N	314922	\N
315137	GENERIC_DAY	0	8	f	2010-01-22	299983	\N	314922	\N
315138	GENERIC_DAY	0	8	f	2010-01-14	299983	\N	314922	\N
315139	GENERIC_DAY	0	8	f	2010-01-25	299983	\N	314922	\N
315140	GENERIC_DAY	0	8	f	2010-01-19	299983	\N	314922	\N
315141	GENERIC_DAY	0	8	f	2010-01-06	299983	\N	314922	\N
315142	GENERIC_DAY	0	8	f	2010-01-07	299983	\N	314922	\N
315143	GENERIC_DAY	0	0	f	2010-01-02	299983	\N	314922	\N
315144	GENERIC_DAY	0	0	f	2010-01-16	299983	\N	314922	\N
315145	GENERIC_DAY	0	8	f	2010-01-13	299983	\N	314922	\N
315146	GENERIC_DAY	0	6	f	2010-01-27	299983	\N	314922	\N
315147	GENERIC_DAY	0	0	f	2010-01-23	299983	\N	314922	\N
315148	GENERIC_DAY	0	8	f	2010-01-12	299983	\N	314922	\N
315149	GENERIC_DAY	0	8	f	2010-01-18	299983	\N	314922	\N
315150	GENERIC_DAY	0	0	f	2010-01-03	299983	\N	314922	\N
315151	GENERIC_DAY	0	8	f	2010-01-01	299983	\N	314922	\N
315152	GENERIC_DAY	0	8	f	2010-01-04	299983	\N	314922	\N
315153	GENERIC_DAY	0	8	f	2010-01-11	299983	\N	314922	\N
315154	GENERIC_DAY	0	8	f	2010-01-21	299983	\N	314922	\N
315155	GENERIC_DAY	0	8	f	2010-01-20	299983	\N	314922	\N
315156	GENERIC_DAY	0	0	f	2010-01-24	299983	\N	314922	\N
315157	GENERIC_DAY	0	8	f	2010-02-19	299983	\N	314923	\N
315158	GENERIC_DAY	0	0	f	2010-02-07	299983	\N	314923	\N
315159	GENERIC_DAY	0	4	f	2010-02-23	299983	\N	314923	\N
315160	GENERIC_DAY	0	0	f	2010-02-13	299983	\N	314923	\N
315161	GENERIC_DAY	0	0	f	2010-01-31	299983	\N	314923	\N
315162	GENERIC_DAY	0	8	f	2010-01-28	299983	\N	314923	\N
315163	GENERIC_DAY	0	0	f	2010-02-06	299983	\N	314923	\N
315164	GENERIC_DAY	0	8	f	2010-02-09	299983	\N	314923	\N
315165	GENERIC_DAY	0	0	f	2010-02-20	299983	\N	314923	\N
315166	GENERIC_DAY	0	8	f	2010-02-04	299983	\N	314923	\N
315167	GENERIC_DAY	0	0	f	2010-02-14	299983	\N	314923	\N
315168	GENERIC_DAY	0	8	f	2010-02-16	299983	\N	314923	\N
315169	GENERIC_DAY	0	0	f	2010-02-21	299983	\N	314923	\N
315170	GENERIC_DAY	0	8	f	2010-01-29	299983	\N	314923	\N
315171	GENERIC_DAY	0	8	f	2010-02-02	299983	\N	314923	\N
315172	GENERIC_DAY	0	8	f	2010-02-15	299983	\N	314923	\N
315173	GENERIC_DAY	0	8	f	2010-02-18	299983	\N	314923	\N
315174	GENERIC_DAY	0	8	f	2010-02-05	299983	\N	314923	\N
315175	GENERIC_DAY	0	2	f	2010-01-27	299983	\N	314923	\N
315176	GENERIC_DAY	0	8	f	2010-02-22	299983	\N	314923	\N
315177	GENERIC_DAY	0	8	f	2010-02-08	299983	\N	314923	\N
315178	GENERIC_DAY	0	8	f	2010-02-17	299983	\N	314923	\N
315179	GENERIC_DAY	0	8	f	2010-02-10	299983	\N	314923	\N
315180	GENERIC_DAY	0	8	f	2010-02-12	299983	\N	314923	\N
315181	GENERIC_DAY	0	8	f	2010-02-01	299983	\N	314923	\N
315182	GENERIC_DAY	0	0	f	2010-01-30	299983	\N	314923	\N
315183	GENERIC_DAY	0	8	f	2010-02-11	299983	\N	314923	\N
315184	GENERIC_DAY	0	8	f	2010-02-03	299983	\N	314923	\N
315185	GENERIC_DAY	0	0	f	2010-01-16	299981	\N	314924	\N
315186	GENERIC_DAY	0	0	f	2010-01-03	299981	\N	314924	\N
315187	GENERIC_DAY	0	8	f	2010-01-25	299981	\N	314924	\N
315188	GENERIC_DAY	0	8	f	2010-01-21	299981	\N	314924	\N
315189	GENERIC_DAY	0	8	f	2010-01-08	299981	\N	314924	\N
315190	GENERIC_DAY	0	0	f	2010-01-10	299981	\N	314924	\N
315191	GENERIC_DAY	0	8	f	2010-01-11	299981	\N	314924	\N
315192	GENERIC_DAY	0	8	f	2010-01-06	299981	\N	314924	\N
315193	GENERIC_DAY	0	8	f	2010-01-19	299981	\N	314924	\N
315194	GENERIC_DAY	0	8	f	2010-01-13	299981	\N	314924	\N
315195	GENERIC_DAY	0	0	f	2010-01-17	299981	\N	314924	\N
315196	GENERIC_DAY	0	8	f	2010-01-26	299981	\N	314924	\N
315197	GENERIC_DAY	0	6	f	2010-01-27	299981	\N	314924	\N
315198	GENERIC_DAY	0	0	f	2010-01-09	299981	\N	314924	\N
315199	GENERIC_DAY	0	8	f	2010-01-22	299981	\N	314924	\N
315200	GENERIC_DAY	0	8	f	2010-01-01	299981	\N	314924	\N
315201	GENERIC_DAY	0	0	f	2010-01-23	299981	\N	314924	\N
315202	GENERIC_DAY	0	8	f	2010-01-18	299981	\N	314924	\N
315203	GENERIC_DAY	0	0	f	2010-01-24	299981	\N	314924	\N
315204	GENERIC_DAY	0	8	f	2010-01-04	299981	\N	314924	\N
315205	GENERIC_DAY	0	8	f	2010-01-20	299981	\N	314924	\N
315206	GENERIC_DAY	0	8	f	2010-01-14	299981	\N	314924	\N
315207	GENERIC_DAY	0	8	f	2010-01-07	299981	\N	314924	\N
315208	GENERIC_DAY	0	8	f	2010-01-12	299981	\N	314924	\N
315209	GENERIC_DAY	0	0	f	2010-01-02	299981	\N	314924	\N
315210	GENERIC_DAY	0	8	f	2010-01-05	299981	\N	314924	\N
315211	GENERIC_DAY	0	8	f	2010-01-15	299981	\N	314924	\N
315212	GENERIC_DAY	0	0	f	2010-01-24	299971	\N	314925	\N
315213	GENERIC_DAY	0	8	f	2010-01-20	299971	\N	314925	\N
315214	GENERIC_DAY	0	0	f	2010-01-09	299971	\N	314925	\N
315215	GENERIC_DAY	0	8	f	2010-01-06	299971	\N	314925	\N
315216	GENERIC_DAY	0	8	f	2010-01-14	299971	\N	314925	\N
315217	GENERIC_DAY	0	8	f	2010-01-11	299971	\N	314925	\N
315218	GENERIC_DAY	0	0	f	2010-01-10	299971	\N	314925	\N
315219	GENERIC_DAY	0	6	f	2010-01-27	299971	\N	314925	\N
315220	GENERIC_DAY	0	8	f	2010-01-18	299971	\N	314925	\N
315221	GENERIC_DAY	0	0	f	2010-01-17	299971	\N	314925	\N
315222	GENERIC_DAY	0	8	f	2010-01-04	299971	\N	314925	\N
315223	GENERIC_DAY	0	8	f	2010-01-21	299971	\N	314925	\N
315224	GENERIC_DAY	0	0	f	2010-01-23	299971	\N	314925	\N
315225	GENERIC_DAY	0	8	f	2010-01-13	299971	\N	314925	\N
315226	GENERIC_DAY	0	8	f	2010-01-08	299971	\N	314925	\N
315227	GENERIC_DAY	0	0	f	2010-01-03	299971	\N	314925	\N
315228	GENERIC_DAY	0	8	f	2010-01-01	299971	\N	314925	\N
315229	GENERIC_DAY	0	8	f	2010-01-25	299971	\N	314925	\N
315230	GENERIC_DAY	0	8	f	2010-01-26	299971	\N	314925	\N
315231	GENERIC_DAY	0	8	f	2010-01-12	299971	\N	314925	\N
315232	GENERIC_DAY	0	8	f	2010-01-19	299971	\N	314925	\N
315233	GENERIC_DAY	0	8	f	2010-01-15	299971	\N	314925	\N
315234	GENERIC_DAY	0	8	f	2010-01-05	299971	\N	314925	\N
315235	GENERIC_DAY	0	0	f	2010-01-16	299971	\N	314925	\N
315236	GENERIC_DAY	0	8	f	2010-01-07	299971	\N	314925	\N
315237	GENERIC_DAY	0	8	f	2010-01-22	299971	\N	314925	\N
315238	GENERIC_DAY	0	0	f	2010-01-02	299971	\N	314925	\N
315239	GENERIC_DAY	0	0	f	2010-03-14	299981	\N	314926	\N
315240	GENERIC_DAY	0	8	f	2010-03-10	299981	\N	314926	\N
315241	GENERIC_DAY	0	8	f	2010-03-08	299981	\N	314926	\N
315242	GENERIC_DAY	0	8	f	2010-03-16	299981	\N	314926	\N
315243	GENERIC_DAY	0	8	f	2010-03-12	299981	\N	314926	\N
315244	GENERIC_DAY	0	8	f	2010-03-17	299981	\N	314926	\N
315245	GENERIC_DAY	0	8	f	2010-02-25	299981	\N	314926	\N
315246	GENERIC_DAY	0	8	f	2010-03-01	299981	\N	314926	\N
315247	GENERIC_DAY	0	8	f	2010-03-02	299981	\N	314926	\N
315248	GENERIC_DAY	0	0	f	2010-02-28	299981	\N	314926	\N
315249	GENERIC_DAY	0	0	f	2010-03-06	299981	\N	314926	\N
315250	GENERIC_DAY	0	4	f	2010-02-23	299981	\N	314926	\N
315251	GENERIC_DAY	0	8	f	2010-02-24	299981	\N	314926	\N
315252	GENERIC_DAY	0	8	f	2010-03-11	299981	\N	314926	\N
315253	GENERIC_DAY	0	8	f	2010-03-03	299981	\N	314926	\N
315254	GENERIC_DAY	0	8	f	2010-03-15	299981	\N	314926	\N
315255	GENERIC_DAY	0	8	f	2010-03-09	299981	\N	314926	\N
315256	GENERIC_DAY	0	8	f	2010-02-26	299981	\N	314926	\N
315257	GENERIC_DAY	0	0	f	2010-03-20	299981	\N	314926	\N
315258	GENERIC_DAY	0	8	f	2010-03-04	299981	\N	314926	\N
315259	GENERIC_DAY	0	0	f	2010-02-27	299981	\N	314926	\N
315260	GENERIC_DAY	0	0	f	2010-03-21	299981	\N	314926	\N
315261	GENERIC_DAY	0	8	f	2010-03-18	299981	\N	314926	\N
315262	GENERIC_DAY	0	8	f	2010-03-05	299981	\N	314926	\N
315263	GENERIC_DAY	0	0	f	2010-03-13	299981	\N	314926	\N
315264	GENERIC_DAY	0	8	f	2010-03-19	299981	\N	314926	\N
315265	GENERIC_DAY	0	0	f	2010-03-07	299981	\N	314926	\N
315266	GENERIC_DAY	0	2	f	2010-03-22	299981	\N	314926	\N
315267	GENERIC_DAY	0	8	f	2010-02-09	299981	\N	314927	\N
315268	GENERIC_DAY	0	8	f	2010-02-18	299981	\N	314927	\N
315269	GENERIC_DAY	0	8	f	2010-02-10	299981	\N	314927	\N
315270	GENERIC_DAY	0	0	f	2010-01-31	299981	\N	314927	\N
315271	GENERIC_DAY	0	8	f	2010-02-12	299981	\N	314927	\N
315272	GENERIC_DAY	0	8	f	2010-02-02	299981	\N	314927	\N
315273	GENERIC_DAY	0	8	f	2010-02-15	299981	\N	314927	\N
315274	GENERIC_DAY	0	8	f	2010-02-19	299981	\N	314927	\N
315275	GENERIC_DAY	0	8	f	2010-02-01	299981	\N	314927	\N
315276	GENERIC_DAY	0	8	f	2010-02-17	299981	\N	314927	\N
315277	GENERIC_DAY	0	0	f	2010-02-14	299981	\N	314927	\N
315278	GENERIC_DAY	0	0	f	2010-02-07	299981	\N	314927	\N
315279	GENERIC_DAY	0	8	f	2010-02-03	299981	\N	314927	\N
315280	GENERIC_DAY	0	8	f	2010-01-28	299981	\N	314927	\N
315281	GENERIC_DAY	0	8	f	2010-02-22	299981	\N	314927	\N
315282	GENERIC_DAY	0	8	f	2010-02-11	299981	\N	314927	\N
315283	GENERIC_DAY	0	0	f	2010-02-06	299981	\N	314927	\N
315284	GENERIC_DAY	0	0	f	2010-02-13	299981	\N	314927	\N
315285	GENERIC_DAY	0	4	f	2010-02-23	299981	\N	314927	\N
315286	GENERIC_DAY	0	8	f	2010-02-04	299981	\N	314927	\N
315287	GENERIC_DAY	0	2	f	2010-01-27	299981	\N	314927	\N
315288	GENERIC_DAY	0	0	f	2010-02-20	299981	\N	314927	\N
315289	GENERIC_DAY	0	0	f	2010-01-30	299981	\N	314927	\N
315290	GENERIC_DAY	0	8	f	2010-02-16	299981	\N	314927	\N
315291	GENERIC_DAY	0	8	f	2010-01-29	299981	\N	314927	\N
315292	GENERIC_DAY	0	8	f	2010-02-05	299981	\N	314927	\N
315293	GENERIC_DAY	0	8	f	2010-02-08	299981	\N	314927	\N
315294	GENERIC_DAY	0	0	f	2010-02-21	299981	\N	314927	\N
315295	GENERIC_DAY	0	0	f	2010-02-06	299979	\N	314928	\N
315296	GENERIC_DAY	0	8	f	2010-02-16	299979	\N	314928	\N
315297	GENERIC_DAY	0	0	f	2010-02-21	299979	\N	314928	\N
315298	GENERIC_DAY	0	4	f	2010-02-23	299979	\N	314928	\N
315299	GENERIC_DAY	0	8	f	2010-02-03	299979	\N	314928	\N
315300	GENERIC_DAY	0	8	f	2010-02-19	299979	\N	314928	\N
315301	GENERIC_DAY	0	8	f	2010-01-29	299979	\N	314928	\N
315302	GENERIC_DAY	0	0	f	2010-01-31	299979	\N	314928	\N
315303	GENERIC_DAY	0	0	f	2010-02-13	299979	\N	314928	\N
315304	GENERIC_DAY	0	0	f	2010-02-14	299979	\N	314928	\N
315305	GENERIC_DAY	0	0	f	2010-02-07	299979	\N	314928	\N
315306	GENERIC_DAY	0	8	f	2010-02-10	299979	\N	314928	\N
315307	GENERIC_DAY	0	8	f	2010-01-28	299979	\N	314928	\N
315308	GENERIC_DAY	0	8	f	2010-02-12	299979	\N	314928	\N
315309	GENERIC_DAY	0	8	f	2010-02-22	299979	\N	314928	\N
315310	GENERIC_DAY	0	0	f	2010-01-30	299979	\N	314928	\N
315311	GENERIC_DAY	0	8	f	2010-02-18	299979	\N	314928	\N
315312	GENERIC_DAY	0	8	f	2010-02-17	299979	\N	314928	\N
315313	GENERIC_DAY	0	8	f	2010-02-08	299979	\N	314928	\N
315314	GENERIC_DAY	0	8	f	2010-02-04	299979	\N	314928	\N
315315	GENERIC_DAY	0	8	f	2010-02-09	299979	\N	314928	\N
315316	GENERIC_DAY	0	8	f	2010-02-15	299979	\N	314928	\N
315317	GENERIC_DAY	0	8	f	2010-02-02	299979	\N	314928	\N
315318	GENERIC_DAY	0	0	f	2010-02-20	299979	\N	314928	\N
315319	GENERIC_DAY	0	8	f	2010-02-11	299979	\N	314928	\N
315320	GENERIC_DAY	0	8	f	2010-02-05	299979	\N	314928	\N
315321	GENERIC_DAY	0	2	f	2010-01-27	299979	\N	314928	\N
315322	GENERIC_DAY	0	8	f	2010-02-01	299979	\N	314928	\N
315323	GENERIC_DAY	0	0	f	2010-04-11	299981	\N	314929	\N
315324	GENERIC_DAY	0	8	f	2010-03-24	299981	\N	314929	\N
315325	GENERIC_DAY	0	8	f	2010-03-23	299981	\N	314929	\N
315326	GENERIC_DAY	0	8	f	2010-04-08	299981	\N	314929	\N
315327	GENERIC_DAY	0	8	f	2010-03-31	299981	\N	314929	\N
315328	GENERIC_DAY	0	0	f	2010-03-28	299981	\N	314929	\N
315329	GENERIC_DAY	0	8	f	2010-03-25	299981	\N	314929	\N
315330	GENERIC_DAY	0	8	f	2010-04-13	299981	\N	314929	\N
315331	GENERIC_DAY	0	8	f	2010-04-05	299981	\N	314929	\N
315332	GENERIC_DAY	0	8	f	2010-04-07	299981	\N	314929	\N
315333	GENERIC_DAY	0	8	f	2010-04-12	299981	\N	314929	\N
315334	GENERIC_DAY	0	0	f	2010-04-10	299981	\N	314929	\N
315335	GENERIC_DAY	0	0	f	2010-04-03	299981	\N	314929	\N
315336	GENERIC_DAY	0	8	f	2010-03-26	299981	\N	314929	\N
315337	GENERIC_DAY	0	8	f	2010-04-06	299981	\N	314929	\N
315338	GENERIC_DAY	0	8	f	2010-04-14	299981	\N	314929	\N
315339	GENERIC_DAY	0	8	f	2010-03-29	299981	\N	314929	\N
315340	GENERIC_DAY	0	8	f	2010-04-09	299981	\N	314929	\N
315341	GENERIC_DAY	0	0	f	2010-04-04	299981	\N	314929	\N
315342	GENERIC_DAY	0	8	f	2010-04-15	299981	\N	314929	\N
315343	GENERIC_DAY	0	8	f	2010-03-30	299981	\N	314929	\N
315344	GENERIC_DAY	0	0	f	2010-03-27	299981	\N	314929	\N
315345	GENERIC_DAY	0	8	f	2010-04-02	299981	\N	314929	\N
315346	GENERIC_DAY	0	8	f	2010-04-01	299981	\N	314929	\N
315347	GENERIC_DAY	0	6	f	2010-03-22	299981	\N	314929	\N
315348	GENERIC_DAY	0	0	f	2010-01-24	299985	\N	314930	\N
315349	GENERIC_DAY	0	8	f	2010-01-06	299985	\N	314930	\N
315350	GENERIC_DAY	0	0	f	2010-01-23	299985	\N	314930	\N
315351	GENERIC_DAY	0	8	f	2010-01-14	299985	\N	314930	\N
315352	GENERIC_DAY	0	0	f	2010-01-17	299985	\N	314930	\N
315353	GENERIC_DAY	0	8	f	2010-01-07	299985	\N	314930	\N
315354	GENERIC_DAY	0	0	f	2010-01-16	299985	\N	314930	\N
315355	GENERIC_DAY	0	8	f	2010-01-13	299985	\N	314930	\N
315356	GENERIC_DAY	0	8	f	2010-01-20	299985	\N	314930	\N
315357	GENERIC_DAY	0	8	f	2010-01-19	299985	\N	314930	\N
315358	GENERIC_DAY	0	8	f	2010-01-15	299985	\N	314930	\N
315359	GENERIC_DAY	0	8	f	2010-01-18	299985	\N	314930	\N
315360	GENERIC_DAY	0	8	f	2010-01-22	299985	\N	314930	\N
315361	GENERIC_DAY	0	8	f	2010-01-05	299985	\N	314930	\N
315362	GENERIC_DAY	0	8	f	2010-01-01	299985	\N	314930	\N
315363	GENERIC_DAY	0	8	f	2010-01-26	299985	\N	314930	\N
315364	GENERIC_DAY	0	0	f	2010-01-03	299985	\N	314930	\N
315365	GENERIC_DAY	0	0	f	2010-01-09	299985	\N	314930	\N
315366	GENERIC_DAY	0	8	f	2010-01-08	299985	\N	314930	\N
315367	GENERIC_DAY	0	8	f	2010-01-21	299985	\N	314930	\N
315368	GENERIC_DAY	0	8	f	2010-01-04	299985	\N	314930	\N
315369	GENERIC_DAY	0	6	f	2010-01-27	299985	\N	314930	\N
315370	GENERIC_DAY	0	8	f	2010-01-11	299985	\N	314930	\N
315371	GENERIC_DAY	0	0	f	2010-01-10	299985	\N	314930	\N
315372	GENERIC_DAY	0	0	f	2010-01-02	299985	\N	314930	\N
315373	GENERIC_DAY	0	8	f	2010-01-25	299985	\N	314930	\N
315374	GENERIC_DAY	0	8	f	2010-01-12	299985	\N	314930	\N
315375	GENERIC_DAY	0	0	f	2010-04-04	299979	\N	314931	\N
315376	GENERIC_DAY	0	8	f	2010-03-24	299979	\N	314931	\N
315377	GENERIC_DAY	0	0	f	2010-03-28	299979	\N	314931	\N
315378	GENERIC_DAY	0	8	f	2010-04-15	299979	\N	314931	\N
315379	GENERIC_DAY	0	8	f	2010-03-29	299979	\N	314931	\N
315380	GENERIC_DAY	0	8	f	2010-03-26	299979	\N	314931	\N
315381	GENERIC_DAY	0	0	f	2010-04-11	299979	\N	314931	\N
315382	GENERIC_DAY	0	8	f	2010-04-05	299979	\N	314931	\N
315383	GENERIC_DAY	0	8	f	2010-04-07	299979	\N	314931	\N
315384	GENERIC_DAY	0	0	f	2010-03-27	299979	\N	314931	\N
315385	GENERIC_DAY	0	0	f	2010-04-10	299979	\N	314931	\N
315386	GENERIC_DAY	0	8	f	2010-04-06	299979	\N	314931	\N
315387	GENERIC_DAY	0	8	f	2010-04-02	299979	\N	314931	\N
315388	GENERIC_DAY	0	8	f	2010-04-08	299979	\N	314931	\N
315389	GENERIC_DAY	0	8	f	2010-03-31	299979	\N	314931	\N
315390	GENERIC_DAY	0	8	f	2010-04-14	299979	\N	314931	\N
315391	GENERIC_DAY	0	8	f	2010-04-09	299979	\N	314931	\N
315392	GENERIC_DAY	0	6	f	2010-03-22	299979	\N	314931	\N
315393	GENERIC_DAY	0	8	f	2010-03-30	299979	\N	314931	\N
315394	GENERIC_DAY	0	8	f	2010-04-12	299979	\N	314931	\N
315395	GENERIC_DAY	0	8	f	2010-03-23	299979	\N	314931	\N
315396	GENERIC_DAY	0	8	f	2010-04-13	299979	\N	314931	\N
315397	GENERIC_DAY	0	8	f	2010-04-01	299979	\N	314931	\N
315398	GENERIC_DAY	0	8	f	2010-03-25	299979	\N	314931	\N
315399	GENERIC_DAY	0	0	f	2010-04-03	299979	\N	314931	\N
356028	GENERIC_DAY	0	0	f	2010-03-13	1625	\N	349506	\N
356029	GENERIC_DAY	0	0	f	2010-04-04	1625	\N	349506	\N
356030	GENERIC_DAY	0	3	f	2010-03-18	1623	\N	349506	\N
356031	GENERIC_DAY	0	2	f	2010-04-01	1625	\N	349506	\N
356032	GENERIC_DAY	0	3	f	2010-03-12	1619	\N	349506	\N
356033	GENERIC_DAY	0	0	f	2010-03-14	1623	\N	349506	\N
356034	GENERIC_DAY	0	0	f	2010-04-03	1623	\N	349506	\N
356035	GENERIC_DAY	0	3	f	2010-03-17	1619	\N	349506	\N
356036	GENERIC_DAY	0	3	f	2010-03-31	1619	\N	349506	\N
356037	GENERIC_DAY	0	3	f	2010-03-24	1619	\N	349506	\N
356038	GENERIC_DAY	0	3	f	2010-03-19	1619	\N	349506	\N
356039	GENERIC_DAY	0	3	f	2010-03-15	1623	\N	349506	\N
356040	GENERIC_DAY	0	2	f	2010-03-24	1625	\N	349506	\N
356041	GENERIC_DAY	0	3	f	2010-03-16	1619	\N	349506	\N
356042	GENERIC_DAY	0	2	f	2010-03-25	1625	\N	349506	\N
356043	GENERIC_DAY	0	3	f	2010-03-25	1623	\N	349506	\N
356044	GENERIC_DAY	0	3	f	2010-04-01	1623	\N	349506	\N
356045	GENERIC_DAY	0	3	f	2010-04-02	1623	\N	349506	\N
356046	GENERIC_DAY	0	2	f	2010-04-06	1619	\N	349506	\N
356047	GENERIC_DAY	0	2	f	2010-04-06	1625	\N	349506	\N
356048	GENERIC_DAY	0	3	f	2010-03-22	1619	\N	349506	\N
356049	GENERIC_DAY	0	0	f	2010-04-04	1623	\N	349506	\N
356050	GENERIC_DAY	0	0	f	2010-03-27	1619	\N	349506	\N
356051	GENERIC_DAY	0	3	f	2010-03-17	1623	\N	349506	\N
356052	GENERIC_DAY	0	2	f	2010-03-19	1625	\N	349506	\N
356053	GENERIC_DAY	0	3	f	2010-03-29	1623	\N	349506	\N
356054	GENERIC_DAY	0	3	f	2010-03-26	1619	\N	349506	\N
356055	GENERIC_DAY	0	3	f	2010-03-23	1623	\N	349506	\N
356056	GENERIC_DAY	0	0	f	2010-03-14	1619	\N	349506	\N
356057	GENERIC_DAY	0	0	f	2010-03-13	1623	\N	349506	\N
356058	GENERIC_DAY	0	3	f	2010-03-11	1619	\N	349506	\N
356059	GENERIC_DAY	0	2	f	2010-04-05	1625	\N	349506	\N
356060	GENERIC_DAY	0	0	f	2010-04-04	1619	\N	349506	\N
356061	GENERIC_DAY	0	3	f	2010-03-31	1623	\N	349506	\N
356062	GENERIC_DAY	0	3	f	2010-03-22	1623	\N	349506	\N
356063	GENERIC_DAY	0	2	f	2010-03-26	1625	\N	349506	\N
356064	GENERIC_DAY	0	0	f	2010-04-03	1625	\N	349506	\N
356065	GENERIC_DAY	0	2	f	2010-04-06	1623	\N	349506	\N
356066	GENERIC_DAY	0	0	f	2010-03-28	1625	\N	349506	\N
356067	GENERIC_DAY	0	3	f	2010-03-15	1619	\N	349506	\N
356068	GENERIC_DAY	0	3	f	2010-03-18	1619	\N	349506	\N
356069	GENERIC_DAY	0	3	f	2010-03-11	1623	\N	349506	\N
356070	GENERIC_DAY	0	3	f	2010-03-12	1623	\N	349506	\N
356071	GENERIC_DAY	0	3	f	2010-04-05	1619	\N	349506	\N
356072	GENERIC_DAY	0	2	f	2010-03-15	1625	\N	349506	\N
356073	GENERIC_DAY	0	2	f	2010-03-31	1625	\N	349506	\N
356074	GENERIC_DAY	0	2	f	2010-03-17	1625	\N	349506	\N
356075	GENERIC_DAY	0	2	f	2010-03-16	1625	\N	349506	\N
356076	GENERIC_DAY	0	3	f	2010-03-19	1623	\N	349506	\N
356077	GENERIC_DAY	0	3	f	2010-04-05	1623	\N	349506	\N
356078	GENERIC_DAY	0	2	f	2010-03-23	1625	\N	349506	\N
356079	GENERIC_DAY	0	0	f	2010-03-20	1623	\N	349506	\N
356080	GENERIC_DAY	0	3	f	2010-03-26	1623	\N	349506	\N
356081	GENERIC_DAY	0	2	f	2010-03-22	1625	\N	349506	\N
356082	GENERIC_DAY	0	0	f	2010-03-21	1619	\N	349506	\N
356083	GENERIC_DAY	0	3	f	2010-03-30	1623	\N	349506	\N
356084	GENERIC_DAY	0	3	f	2010-04-02	1619	\N	349506	\N
356085	GENERIC_DAY	0	3	f	2010-03-25	1619	\N	349506	\N
356086	GENERIC_DAY	0	0	f	2010-03-20	1625	\N	349506	\N
356087	GENERIC_DAY	0	2	f	2010-03-30	1625	\N	349506	\N
356088	GENERIC_DAY	0	3	f	2010-04-01	1619	\N	349506	\N
356089	GENERIC_DAY	0	2	f	2010-03-11	1625	\N	349506	\N
356090	GENERIC_DAY	0	0	f	2010-03-28	1623	\N	349506	\N
356091	GENERIC_DAY	0	3	f	2010-03-23	1619	\N	349506	\N
356092	GENERIC_DAY	0	2	f	2010-03-18	1625	\N	349506	\N
356093	GENERIC_DAY	0	3	f	2010-03-30	1619	\N	349506	\N
356094	GENERIC_DAY	0	0	f	2010-03-13	1619	\N	349506	\N
356095	GENERIC_DAY	0	0	f	2010-03-27	1623	\N	349506	\N
356096	GENERIC_DAY	0	0	f	2010-04-03	1619	\N	349506	\N
356097	GENERIC_DAY	0	3	f	2010-03-24	1623	\N	349506	\N
356098	GENERIC_DAY	0	0	f	2010-03-21	1623	\N	349506	\N
356099	GENERIC_DAY	0	2	f	2010-03-29	1625	\N	349506	\N
356100	GENERIC_DAY	0	0	f	2010-03-20	1619	\N	349506	\N
356101	GENERIC_DAY	0	3	f	2010-03-16	1623	\N	349506	\N
356102	GENERIC_DAY	0	3	f	2010-03-29	1619	\N	349506	\N
356103	GENERIC_DAY	0	2	f	2010-04-02	1625	\N	349506	\N
356104	GENERIC_DAY	0	0	f	2010-03-21	1625	\N	349506	\N
356105	GENERIC_DAY	0	0	f	2010-03-14	1625	\N	349506	\N
356106	GENERIC_DAY	0	0	f	2010-03-27	1625	\N	349506	\N
356107	GENERIC_DAY	0	0	f	2010-03-28	1619	\N	349506	\N
356108	GENERIC_DAY	0	2	f	2010-03-12	1625	\N	349506	\N
356109	GENERIC_DAY	0	0	f	2010-03-27	1625	\N	349507	\N
356110	GENERIC_DAY	0	3	f	2010-03-18	1623	\N	349507	\N
356111	GENERIC_DAY	0	3	f	2010-03-23	1623	\N	349507	\N
356112	GENERIC_DAY	0	3	f	2010-03-11	1623	\N	349507	\N
356113	GENERIC_DAY	0	2	f	2010-04-06	1625	\N	349507	\N
356114	GENERIC_DAY	0	3	f	2010-03-24	1625	\N	349507	\N
356115	GENERIC_DAY	0	3	f	2010-03-12	1625	\N	349507	\N
356116	GENERIC_DAY	0	3	f	2010-03-16	1623	\N	349507	\N
356117	GENERIC_DAY	0	2	f	2010-04-06	1623	\N	349507	\N
356118	GENERIC_DAY	0	2	f	2010-04-01	1619	\N	349507	\N
356119	GENERIC_DAY	0	3	f	2010-04-05	1623	\N	349507	\N
356120	GENERIC_DAY	0	3	f	2010-03-29	1623	\N	349507	\N
356121	GENERIC_DAY	0	0	f	2010-03-21	1623	\N	349507	\N
356122	GENERIC_DAY	0	0	f	2010-03-20	1625	\N	349507	\N
356123	GENERIC_DAY	0	0	f	2010-03-28	1623	\N	349507	\N
356124	GENERIC_DAY	0	2	f	2010-03-12	1619	\N	349507	\N
356125	GENERIC_DAY	0	0	f	2010-03-13	1623	\N	349507	\N
356126	GENERIC_DAY	0	2	f	2010-04-06	1619	\N	349507	\N
356127	GENERIC_DAY	0	2	f	2010-03-17	1619	\N	349507	\N
356128	GENERIC_DAY	0	0	f	2010-03-13	1625	\N	349507	\N
356129	GENERIC_DAY	0	2	f	2010-03-26	1619	\N	349507	\N
356130	GENERIC_DAY	0	2	f	2010-03-24	1619	\N	349507	\N
356131	GENERIC_DAY	0	2	f	2010-03-16	1619	\N	349507	\N
356132	GENERIC_DAY	0	3	f	2010-03-25	1625	\N	349507	\N
356133	GENERIC_DAY	0	3	f	2010-03-15	1623	\N	349507	\N
356134	GENERIC_DAY	0	2	f	2010-04-05	1619	\N	349507	\N
356135	GENERIC_DAY	0	3	f	2010-03-12	1623	\N	349507	\N
356136	GENERIC_DAY	0	0	f	2010-03-28	1625	\N	349507	\N
356137	GENERIC_DAY	0	3	f	2010-03-19	1623	\N	349507	\N
356138	GENERIC_DAY	0	3	f	2010-03-25	1623	\N	349507	\N
356139	GENERIC_DAY	0	2	f	2010-03-23	1619	\N	349507	\N
356140	GENERIC_DAY	0	2	f	2010-03-15	1619	\N	349507	\N
356141	GENERIC_DAY	0	3	f	2010-04-01	1623	\N	349507	\N
356142	GENERIC_DAY	0	0	f	2010-04-03	1619	\N	349507	\N
356143	GENERIC_DAY	0	0	f	2010-03-14	1623	\N	349507	\N
356144	GENERIC_DAY	0	0	f	2010-03-28	1619	\N	349507	\N
356145	GENERIC_DAY	0	3	f	2010-03-16	1625	\N	349507	\N
356146	GENERIC_DAY	0	3	f	2010-03-17	1623	\N	349507	\N
356147	GENERIC_DAY	0	0	f	2010-04-03	1623	\N	349507	\N
356148	GENERIC_DAY	0	2	f	2010-03-19	1619	\N	349507	\N
356149	GENERIC_DAY	0	3	f	2010-03-11	1625	\N	349507	\N
356150	GENERIC_DAY	0	2	f	2010-03-29	1619	\N	349507	\N
356151	GENERIC_DAY	0	2	f	2010-03-22	1619	\N	349507	\N
356152	GENERIC_DAY	0	0	f	2010-03-21	1619	\N	349507	\N
356153	GENERIC_DAY	0	0	f	2010-04-04	1619	\N	349507	\N
356154	GENERIC_DAY	0	3	f	2010-03-26	1625	\N	349507	\N
356155	GENERIC_DAY	0	0	f	2010-03-14	1619	\N	349507	\N
356156	GENERIC_DAY	0	0	f	2010-03-27	1623	\N	349507	\N
356157	GENERIC_DAY	0	2	f	2010-03-30	1619	\N	349507	\N
356158	GENERIC_DAY	0	3	f	2010-03-22	1625	\N	349507	\N
356159	GENERIC_DAY	0	3	f	2010-03-17	1625	\N	349507	\N
356160	GENERIC_DAY	0	3	f	2010-03-26	1623	\N	349507	\N
356161	GENERIC_DAY	0	3	f	2010-03-19	1625	\N	349507	\N
356162	GENERIC_DAY	0	3	f	2010-03-18	1625	\N	349507	\N
356163	GENERIC_DAY	0	3	f	2010-03-31	1625	\N	349507	\N
356164	GENERIC_DAY	0	0	f	2010-03-27	1619	\N	349507	\N
356165	GENERIC_DAY	0	3	f	2010-04-01	1625	\N	349507	\N
356166	GENERIC_DAY	0	0	f	2010-04-03	1625	\N	349507	\N
356167	GENERIC_DAY	0	0	f	2010-03-20	1619	\N	349507	\N
356168	GENERIC_DAY	0	0	f	2010-04-04	1625	\N	349507	\N
356169	GENERIC_DAY	0	3	f	2010-03-24	1623	\N	349507	\N
356170	GENERIC_DAY	0	2	f	2010-03-31	1619	\N	349507	\N
356171	GENERIC_DAY	0	0	f	2010-03-13	1619	\N	349507	\N
356172	GENERIC_DAY	0	0	f	2010-04-04	1623	\N	349507	\N
356173	GENERIC_DAY	0	3	f	2010-03-31	1623	\N	349507	\N
356174	GENERIC_DAY	0	3	f	2010-04-05	1625	\N	349507	\N
356175	GENERIC_DAY	0	3	f	2010-03-22	1623	\N	349507	\N
356176	GENERIC_DAY	0	3	f	2010-03-15	1625	\N	349507	\N
356177	GENERIC_DAY	0	0	f	2010-03-20	1623	\N	349507	\N
356178	GENERIC_DAY	0	2	f	2010-03-18	1619	\N	349507	\N
356179	GENERIC_DAY	0	2	f	2010-04-02	1619	\N	349507	\N
356180	GENERIC_DAY	0	2	f	2010-03-11	1619	\N	349507	\N
356181	GENERIC_DAY	0	3	f	2010-03-30	1625	\N	349507	\N
356182	GENERIC_DAY	0	3	f	2010-04-02	1623	\N	349507	\N
356183	GENERIC_DAY	0	3	f	2010-04-02	1625	\N	349507	\N
356184	GENERIC_DAY	0	2	f	2010-03-25	1619	\N	349507	\N
356185	GENERIC_DAY	0	3	f	2010-03-23	1625	\N	349507	\N
356186	GENERIC_DAY	0	0	f	2010-03-21	1625	\N	349507	\N
356187	GENERIC_DAY	0	0	f	2010-03-14	1625	\N	349507	\N
356188	GENERIC_DAY	0	3	f	2010-03-29	1625	\N	349507	\N
356189	GENERIC_DAY	0	3	f	2010-03-30	1623	\N	349507	\N
355317	GENERIC_DAY	0	1	f	2010-04-29	2029	\N	349509	\N
355318	GENERIC_DAY	0	1	f	2010-03-24	2029	\N	349509	\N
355319	GENERIC_DAY	0	1	f	2010-05-04	2029	\N	349509	\N
355320	GENERIC_DAY	0	2	f	2010-01-18	2029	\N	349509	\N
355321	GENERIC_DAY	0	1	f	2010-03-25	2029	\N	349509	\N
355322	GENERIC_DAY	0	1	f	2010-05-03	2029	\N	349509	\N
355323	GENERIC_DAY	0	1	f	2010-05-27	2029	\N	349509	\N
355324	GENERIC_DAY	0	1	f	2010-03-12	2029	\N	349509	\N
355325	GENERIC_DAY	0	1	f	2010-03-31	2029	\N	349509	\N
355326	GENERIC_DAY	0	2	f	2010-02-03	2029	\N	349509	\N
355327	GENERIC_DAY	0	1	f	2010-04-08	2029	\N	349509	\N
355328	GENERIC_DAY	0	1	f	2010-04-05	2029	\N	349509	\N
355329	GENERIC_DAY	0	1	f	2010-03-11	2029	\N	349509	\N
355330	GENERIC_DAY	0	2	f	2010-01-27	2029	\N	349509	\N
355331	GENERIC_DAY	0	1	f	2010-05-06	2029	\N	349509	\N
355332	GENERIC_DAY	0	1	f	2010-02-17	2029	\N	349509	\N
355333	GENERIC_DAY	0	2	f	2010-01-25	2029	\N	349509	\N
355334	GENERIC_DAY	0	1	f	2010-06-14	2029	\N	349509	\N
355335	GENERIC_DAY	0	1	f	2010-04-06	2029	\N	349509	\N
355336	GENERIC_DAY	0	1	f	2010-04-21	2029	\N	349509	\N
355337	GENERIC_DAY	0	1	f	2010-05-11	2029	\N	349509	\N
355338	GENERIC_DAY	0	1	f	2010-03-01	2029	\N	349509	\N
355339	GENERIC_DAY	0	1	f	2010-04-13	2029	\N	349509	\N
355340	GENERIC_DAY	0	1	f	2010-03-26	2029	\N	349509	\N
355341	GENERIC_DAY	0	1	f	2010-03-05	2029	\N	349509	\N
355342	GENERIC_DAY	0	1	f	2010-04-12	2029	\N	349509	\N
355343	GENERIC_DAY	0	2	f	2010-02-12	2029	\N	349509	\N
355344	GENERIC_DAY	0	1	f	2010-04-28	2029	\N	349509	\N
355345	GENERIC_DAY	0	1	f	2010-03-19	2029	\N	349509	\N
355346	GENERIC_DAY	0	1	f	2010-02-18	2029	\N	349509	\N
355347	GENERIC_DAY	0	2	f	2010-01-04	2029	\N	349509	\N
355348	GENERIC_DAY	0	1	f	2010-03-30	2029	\N	349509	\N
355349	GENERIC_DAY	0	1	f	2010-05-05	2029	\N	349509	\N
355350	GENERIC_DAY	0	2	f	2010-01-28	2029	\N	349509	\N
355351	GENERIC_DAY	0	1	f	2010-05-12	2029	\N	349509	\N
355352	GENERIC_DAY	0	1	f	2010-04-26	2029	\N	349509	\N
355353	GENERIC_DAY	0	2	f	2010-01-29	2029	\N	349509	\N
355354	GENERIC_DAY	0	2	f	2010-02-16	2029	\N	349509	\N
355355	GENERIC_DAY	0	1	f	2010-04-22	2029	\N	349509	\N
355356	GENERIC_DAY	0	2	f	2010-02-08	2029	\N	349509	\N
355357	GENERIC_DAY	0	2	f	2010-02-15	2029	\N	349509	\N
355358	GENERIC_DAY	0	1	f	2010-06-08	2029	\N	349509	\N
355359	GENERIC_DAY	0	1	f	2010-06-01	2029	\N	349509	\N
355360	GENERIC_DAY	0	1	f	2010-05-31	2029	\N	349509	\N
355361	GENERIC_DAY	0	2	f	2010-01-12	2029	\N	349509	\N
355362	GENERIC_DAY	0	1	f	2010-03-29	2029	\N	349509	\N
355363	GENERIC_DAY	0	2	f	2010-02-11	2029	\N	349509	\N
355364	GENERIC_DAY	0	2	f	2010-01-11	2029	\N	349509	\N
355365	GENERIC_DAY	0	1	f	2010-05-21	2029	\N	349509	\N
355366	GENERIC_DAY	0	1	f	2010-05-18	2029	\N	349509	\N
355367	GENERIC_DAY	0	2	f	2010-01-22	2029	\N	349509	\N
355368	GENERIC_DAY	0	1	f	2010-03-03	2029	\N	349509	\N
355369	GENERIC_DAY	0	1	f	2010-06-10	2029	\N	349509	\N
355370	GENERIC_DAY	0	1	f	2010-02-25	2029	\N	349509	\N
355371	GENERIC_DAY	0	1	f	2010-02-22	2029	\N	349509	\N
355372	GENERIC_DAY	0	1	f	2010-05-26	2029	\N	349509	\N
355373	GENERIC_DAY	0	1	f	2010-03-17	2029	\N	349509	\N
355374	GENERIC_DAY	0	2	f	2010-02-01	2029	\N	349509	\N
355375	GENERIC_DAY	0	1	f	2010-04-02	2029	\N	349509	\N
355376	GENERIC_DAY	0	1	f	2010-04-30	2029	\N	349509	\N
355377	GENERIC_DAY	0	2	f	2010-01-13	2029	\N	349509	\N
355378	GENERIC_DAY	0	1	f	2010-04-20	2029	\N	349509	\N
355379	GENERIC_DAY	0	1	f	2010-04-09	2029	\N	349509	\N
355380	GENERIC_DAY	0	2	f	2010-02-05	2029	\N	349509	\N
355381	GENERIC_DAY	0	2	f	2010-01-07	2029	\N	349509	\N
355382	GENERIC_DAY	0	2	f	2010-01-08	2029	\N	349509	\N
355383	GENERIC_DAY	0	1	f	2010-05-19	2029	\N	349509	\N
355384	GENERIC_DAY	0	1	f	2010-05-25	2029	\N	349509	\N
355385	GENERIC_DAY	0	1	f	2010-05-28	2029	\N	349509	\N
355386	GENERIC_DAY	0	1	f	2010-03-23	2029	\N	349509	\N
355387	GENERIC_DAY	0	1	f	2010-03-10	2029	\N	349509	\N
355388	GENERIC_DAY	0	2	f	2010-01-15	2029	\N	349509	\N
355389	GENERIC_DAY	0	1	f	2010-02-23	2029	\N	349509	\N
355390	GENERIC_DAY	0	1	f	2010-06-09	2029	\N	349509	\N
355391	GENERIC_DAY	0	2	f	2010-01-06	2029	\N	349509	\N
355392	GENERIC_DAY	0	1	f	2010-04-14	2029	\N	349509	\N
355393	GENERIC_DAY	0	2	f	2010-02-04	2029	\N	349509	\N
355394	GENERIC_DAY	0	1	f	2010-05-13	2029	\N	349509	\N
355395	GENERIC_DAY	0	1	f	2010-06-03	2029	\N	349509	\N
355396	GENERIC_DAY	0	1	f	2010-06-07	2029	\N	349509	\N
355397	GENERIC_DAY	0	1	f	2010-03-02	2029	\N	349509	\N
355398	GENERIC_DAY	0	1	f	2010-03-15	2029	\N	349509	\N
355399	GENERIC_DAY	0	1	f	2010-06-02	2029	\N	349509	\N
355400	GENERIC_DAY	0	1	f	2010-03-09	2029	\N	349509	\N
355401	GENERIC_DAY	0	1	f	2010-03-22	2029	\N	349509	\N
355402	GENERIC_DAY	0	1	f	2010-04-15	2029	\N	349509	\N
355403	GENERIC_DAY	0	1	f	2010-04-27	2029	\N	349509	\N
355404	GENERIC_DAY	0	1	f	2010-04-01	2029	\N	349509	\N
355405	GENERIC_DAY	0	2	f	2010-01-21	2029	\N	349509	\N
355406	GENERIC_DAY	0	2	f	2010-01-20	2029	\N	349509	\N
355407	GENERIC_DAY	0	1	f	2010-03-18	2029	\N	349509	\N
355408	GENERIC_DAY	0	1	f	2010-05-07	2029	\N	349509	\N
355409	GENERIC_DAY	0	2	f	2010-01-14	2029	\N	349509	\N
355410	GENERIC_DAY	0	2	f	2010-01-05	2029	\N	349509	\N
355411	GENERIC_DAY	0	1	f	2010-04-16	2029	\N	349509	\N
355412	GENERIC_DAY	0	1	f	2010-05-24	2029	\N	349509	\N
355413	GENERIC_DAY	0	1	f	2010-02-19	2029	\N	349509	\N
355414	GENERIC_DAY	0	1	f	2010-05-10	2029	\N	349509	\N
355415	GENERIC_DAY	0	1	f	2010-02-26	2029	\N	349509	\N
355416	GENERIC_DAY	0	1	f	2010-06-11	2029	\N	349509	\N
355417	GENERIC_DAY	0	1	f	2010-05-14	2029	\N	349509	\N
355418	GENERIC_DAY	0	1	f	2010-03-16	2029	\N	349509	\N
355419	GENERIC_DAY	0	2	f	2010-02-10	2029	\N	349509	\N
355420	GENERIC_DAY	0	1	f	2010-03-04	2029	\N	349509	\N
355421	GENERIC_DAY	0	2	f	2010-02-09	2029	\N	349509	\N
355422	GENERIC_DAY	0	1	f	2010-03-08	2029	\N	349509	\N
355423	GENERIC_DAY	0	1	f	2010-04-23	2029	\N	349509	\N
355424	GENERIC_DAY	0	1	f	2010-04-07	2029	\N	349509	\N
355425	GENERIC_DAY	0	2	f	2010-01-19	2029	\N	349509	\N
355426	GENERIC_DAY	0	2	f	2010-01-26	2029	\N	349509	\N
355427	GENERIC_DAY	0	1	f	2010-02-24	2029	\N	349509	\N
355428	GENERIC_DAY	0	1	f	2010-05-17	2029	\N	349509	\N
355429	GENERIC_DAY	0	1	f	2010-05-20	2029	\N	349509	\N
355430	GENERIC_DAY	0	1	f	2010-04-19	2029	\N	349509	\N
355431	GENERIC_DAY	0	1	f	2010-06-04	2029	\N	349509	\N
355432	GENERIC_DAY	0	2	f	2010-01-01	2029	\N	349509	\N
355433	GENERIC_DAY	0	2	f	2010-02-02	2029	\N	349509	\N
315400	GENERIC_DAY	0	8	f	2010-03-15	299971	\N	314932	\N
315401	GENERIC_DAY	0	8	f	2010-03-10	299971	\N	314932	\N
315402	GENERIC_DAY	0	8	f	2010-03-01	299971	\N	314932	\N
315403	GENERIC_DAY	0	0	f	2010-03-06	299971	\N	314932	\N
315404	GENERIC_DAY	0	8	f	2010-03-11	299971	\N	314932	\N
315405	GENERIC_DAY	0	8	f	2010-03-04	299971	\N	314932	\N
315406	GENERIC_DAY	0	8	f	2010-03-19	299971	\N	314932	\N
315407	GENERIC_DAY	0	8	f	2010-03-02	299971	\N	314932	\N
315408	GENERIC_DAY	0	8	f	2010-02-24	299971	\N	314932	\N
315409	GENERIC_DAY	0	0	f	2010-02-28	299971	\N	314932	\N
315410	GENERIC_DAY	0	8	f	2010-03-03	299971	\N	314932	\N
315411	GENERIC_DAY	0	0	f	2010-03-07	299971	\N	314932	\N
315412	GENERIC_DAY	0	0	f	2010-03-21	299971	\N	314932	\N
315413	GENERIC_DAY	0	8	f	2010-03-08	299971	\N	314932	\N
315414	GENERIC_DAY	0	0	f	2010-03-20	299971	\N	314932	\N
315415	GENERIC_DAY	0	8	f	2010-02-26	299971	\N	314932	\N
315416	GENERIC_DAY	0	0	f	2010-03-13	299971	\N	314932	\N
315417	GENERIC_DAY	0	8	f	2010-03-18	299971	\N	314932	\N
315418	GENERIC_DAY	0	8	f	2010-03-05	299971	\N	314932	\N
315419	GENERIC_DAY	0	4	f	2010-02-23	299971	\N	314932	\N
315420	GENERIC_DAY	0	8	f	2010-02-25	299971	\N	314932	\N
315421	GENERIC_DAY	0	8	f	2010-03-17	299971	\N	314932	\N
315422	GENERIC_DAY	0	0	f	2010-02-27	299971	\N	314932	\N
315423	GENERIC_DAY	0	8	f	2010-03-12	299971	\N	314932	\N
315424	GENERIC_DAY	0	8	f	2010-03-16	299971	\N	314932	\N
315425	GENERIC_DAY	0	8	f	2010-03-09	299971	\N	314932	\N
315426	GENERIC_DAY	0	2	f	2010-03-22	299971	\N	314932	\N
315427	GENERIC_DAY	0	0	f	2010-03-14	299971	\N	314932	\N
315428	GENERIC_DAY	0	8	f	2010-02-09	299977	\N	314933	\N
315429	GENERIC_DAY	0	8	f	2010-01-25	299977	\N	314933	\N
315430	GENERIC_DAY	0	8	f	2010-02-10	299977	\N	314933	\N
315431	GENERIC_DAY	0	0	f	2010-02-06	299977	\N	314933	\N
315432	GENERIC_DAY	0	0	f	2010-01-21	299977	\N	314933	\N
315433	GENERIC_DAY	0	8	f	2010-02-11	299977	\N	314933	\N
315434	GENERIC_DAY	0	8	f	2010-02-05	299977	\N	314933	\N
315435	GENERIC_DAY	0	0	f	2010-01-30	299977	\N	314933	\N
315436	GENERIC_DAY	0	8	f	2010-01-26	299977	\N	314933	\N
315437	GENERIC_DAY	0	8	f	2010-01-22	299977	\N	314933	\N
315438	GENERIC_DAY	0	0	f	2010-01-23	299977	\N	314933	\N
315439	GENERIC_DAY	0	8	f	2010-02-04	299977	\N	314933	\N
315440	GENERIC_DAY	0	8	f	2010-02-02	299977	\N	314933	\N
315441	GENERIC_DAY	0	8	f	2010-01-29	299977	\N	314933	\N
315442	GENERIC_DAY	0	8	f	2010-01-27	299977	\N	314933	\N
315443	GENERIC_DAY	0	0	f	2010-01-24	299977	\N	314933	\N
315444	GENERIC_DAY	0	8	f	2010-02-01	299977	\N	314933	\N
315445	GENERIC_DAY	0	8	f	2010-02-08	299977	\N	314933	\N
315446	GENERIC_DAY	0	8	f	2010-01-28	299977	\N	314933	\N
315447	GENERIC_DAY	0	8	f	2010-02-03	299977	\N	314933	\N
315448	GENERIC_DAY	0	0	f	2010-02-07	299977	\N	314933	\N
315449	GENERIC_DAY	0	0	f	2010-01-31	299977	\N	314933	\N
315450	GENERIC_DAY	0	0	f	2010-05-23	299971	\N	314934	\N
315451	GENERIC_DAY	0	8	f	2010-05-13	299971	\N	314934	\N
315452	GENERIC_DAY	0	8	f	2010-05-21	299971	\N	314934	\N
315453	GENERIC_DAY	0	4	f	2010-06-08	299971	\N	314934	\N
315454	GENERIC_DAY	0	8	f	2010-05-31	299971	\N	314934	\N
315455	GENERIC_DAY	0	8	f	2010-05-14	299971	\N	314934	\N
315456	GENERIC_DAY	0	8	f	2010-05-18	299971	\N	314934	\N
315457	GENERIC_DAY	0	0	f	2010-05-15	299971	\N	314934	\N
315458	GENERIC_DAY	0	8	f	2010-06-07	299971	\N	314934	\N
315459	GENERIC_DAY	0	2	f	2010-05-12	299971	\N	314934	\N
315460	GENERIC_DAY	0	0	f	2010-06-06	299971	\N	314934	\N
315461	GENERIC_DAY	0	8	f	2010-05-20	299971	\N	314934	\N
315462	GENERIC_DAY	0	8	f	2010-05-24	299971	\N	314934	\N
315463	GENERIC_DAY	0	8	f	2010-05-19	299971	\N	314934	\N
315464	GENERIC_DAY	0	8	f	2010-05-28	299971	\N	314934	\N
315465	GENERIC_DAY	0	0	f	2010-05-29	299971	\N	314934	\N
315466	GENERIC_DAY	0	8	f	2010-06-03	299971	\N	314934	\N
315467	GENERIC_DAY	0	8	f	2010-05-25	299971	\N	314934	\N
315468	GENERIC_DAY	0	8	f	2010-05-27	299971	\N	314934	\N
315469	GENERIC_DAY	0	0	f	2010-05-16	299971	\N	314934	\N
315470	GENERIC_DAY	0	8	f	2010-06-01	299971	\N	314934	\N
315471	GENERIC_DAY	0	8	f	2010-05-26	299971	\N	314934	\N
315472	GENERIC_DAY	0	0	f	2010-05-22	299971	\N	314934	\N
315473	GENERIC_DAY	0	8	f	2010-06-02	299971	\N	314934	\N
315474	GENERIC_DAY	0	8	f	2010-06-04	299971	\N	314934	\N
315475	GENERIC_DAY	0	0	f	2010-05-30	299971	\N	314934	\N
315476	GENERIC_DAY	0	8	f	2010-05-17	299971	\N	314934	\N
315477	GENERIC_DAY	0	0	f	2010-06-05	299971	\N	314934	\N
315478	GENERIC_DAY	0	0	f	2010-03-13	299985	\N	314935	\N
315479	GENERIC_DAY	0	8	f	2010-02-24	299985	\N	314935	\N
315480	GENERIC_DAY	0	2	f	2010-03-22	299985	\N	314935	\N
315481	GENERIC_DAY	0	8	f	2010-03-04	299985	\N	314935	\N
315482	GENERIC_DAY	0	8	f	2010-03-02	299985	\N	314935	\N
315483	GENERIC_DAY	0	8	f	2010-03-17	299985	\N	314935	\N
315484	GENERIC_DAY	0	0	f	2010-03-21	299985	\N	314935	\N
315485	GENERIC_DAY	0	0	f	2010-02-27	299985	\N	314935	\N
315486	GENERIC_DAY	0	8	f	2010-03-12	299985	\N	314935	\N
315487	GENERIC_DAY	0	0	f	2010-02-28	299985	\N	314935	\N
315488	GENERIC_DAY	0	0	f	2010-03-20	299985	\N	314935	\N
315489	GENERIC_DAY	0	0	f	2010-03-14	299985	\N	314935	\N
315490	GENERIC_DAY	0	8	f	2010-03-18	299985	\N	314935	\N
315491	GENERIC_DAY	0	8	f	2010-03-08	299985	\N	314935	\N
315492	GENERIC_DAY	0	8	f	2010-03-16	299985	\N	314935	\N
315493	GENERIC_DAY	0	0	f	2010-03-06	299985	\N	314935	\N
315494	GENERIC_DAY	0	8	f	2010-02-25	299985	\N	314935	\N
315495	GENERIC_DAY	0	8	f	2010-03-10	299985	\N	314935	\N
315496	GENERIC_DAY	0	8	f	2010-03-09	299985	\N	314935	\N
315497	GENERIC_DAY	0	8	f	2010-03-19	299985	\N	314935	\N
315498	GENERIC_DAY	0	8	f	2010-03-05	299985	\N	314935	\N
315499	GENERIC_DAY	0	4	f	2010-02-23	299985	\N	314935	\N
315500	GENERIC_DAY	0	8	f	2010-03-15	299985	\N	314935	\N
315501	GENERIC_DAY	0	8	f	2010-03-11	299985	\N	314935	\N
315502	GENERIC_DAY	0	0	f	2010-03-07	299985	\N	314935	\N
315503	GENERIC_DAY	0	8	f	2010-02-26	299985	\N	314935	\N
315504	GENERIC_DAY	0	8	f	2010-03-01	299985	\N	314935	\N
315505	GENERIC_DAY	0	8	f	2010-03-03	299985	\N	314935	\N
315506	GENERIC_DAY	0	8	f	2010-04-05	299983	\N	314936	\N
315507	GENERIC_DAY	0	0	f	2010-04-03	299983	\N	314936	\N
315508	GENERIC_DAY	0	8	f	2010-04-01	299983	\N	314936	\N
315509	GENERIC_DAY	0	0	f	2010-04-04	299983	\N	314936	\N
315510	GENERIC_DAY	0	8	f	2010-04-12	299983	\N	314936	\N
315511	GENERIC_DAY	0	8	f	2010-04-08	299983	\N	314936	\N
315512	GENERIC_DAY	0	6	f	2010-03-22	299983	\N	314936	\N
315513	GENERIC_DAY	0	8	f	2010-03-25	299983	\N	314936	\N
315514	GENERIC_DAY	0	0	f	2010-04-10	299983	\N	314936	\N
315515	GENERIC_DAY	0	8	f	2010-04-13	299983	\N	314936	\N
315516	GENERIC_DAY	0	8	f	2010-04-09	299983	\N	314936	\N
315517	GENERIC_DAY	0	8	f	2010-03-24	299983	\N	314936	\N
315518	GENERIC_DAY	0	8	f	2010-04-14	299983	\N	314936	\N
315519	GENERIC_DAY	0	8	f	2010-04-07	299983	\N	314936	\N
315520	GENERIC_DAY	0	0	f	2010-03-28	299983	\N	314936	\N
315521	GENERIC_DAY	0	8	f	2010-03-30	299983	\N	314936	\N
315522	GENERIC_DAY	0	0	f	2010-03-27	299983	\N	314936	\N
315523	GENERIC_DAY	0	8	f	2010-04-06	299983	\N	314936	\N
315524	GENERIC_DAY	0	8	f	2010-03-31	299983	\N	314936	\N
315525	GENERIC_DAY	0	0	f	2010-04-11	299983	\N	314936	\N
315526	GENERIC_DAY	0	8	f	2010-03-23	299983	\N	314936	\N
315527	GENERIC_DAY	0	8	f	2010-04-15	299983	\N	314936	\N
315528	GENERIC_DAY	0	8	f	2010-03-29	299983	\N	314936	\N
315529	GENERIC_DAY	0	8	f	2010-04-02	299983	\N	314936	\N
315530	GENERIC_DAY	0	8	f	2010-03-26	299983	\N	314936	\N
315531	GENERIC_DAY	0	8	f	2010-03-10	299975	\N	314937	\N
315532	GENERIC_DAY	0	0	f	2010-03-20	299975	\N	314937	\N
315533	GENERIC_DAY	0	8	f	2010-03-17	299975	\N	314937	\N
315534	GENERIC_DAY	0	8	f	2010-03-25	299975	\N	314937	\N
315535	GENERIC_DAY	0	8	f	2010-03-19	299975	\N	314937	\N
315536	GENERIC_DAY	0	0	f	2010-03-04	299975	\N	314937	\N
315537	GENERIC_DAY	0	0	f	2010-03-13	299975	\N	314937	\N
315538	GENERIC_DAY	0	0	f	2010-03-21	299975	\N	314937	\N
315539	GENERIC_DAY	0	8	f	2010-03-24	299975	\N	314937	\N
315540	GENERIC_DAY	0	8	f	2010-03-15	299975	\N	314937	\N
315541	GENERIC_DAY	0	8	f	2010-03-16	299975	\N	314937	\N
315542	GENERIC_DAY	0	8	f	2010-03-23	299975	\N	314937	\N
315543	GENERIC_DAY	0	8	f	2010-03-09	299975	\N	314937	\N
315544	GENERIC_DAY	0	8	f	2010-03-11	299975	\N	314937	\N
315545	GENERIC_DAY	0	8	f	2010-03-05	299975	\N	314937	\N
315546	GENERIC_DAY	0	8	f	2010-03-12	299975	\N	314937	\N
315547	GENERIC_DAY	0	8	f	2010-03-22	299975	\N	314937	\N
315548	GENERIC_DAY	0	8	f	2010-03-08	299975	\N	314937	\N
315549	GENERIC_DAY	0	0	f	2010-03-07	299975	\N	314937	\N
315550	GENERIC_DAY	0	0	f	2010-03-14	299975	\N	314937	\N
315551	GENERIC_DAY	0	0	f	2010-03-06	299975	\N	314937	\N
315552	GENERIC_DAY	0	8	f	2010-03-18	299975	\N	314937	\N
315553	SPECIFIC_DAY	0	8	f	2010-02-01	299973	315625	\N	\N
315554	SPECIFIC_DAY	0	0	f	2010-02-20	299973	315625	\N	\N
315555	SPECIFIC_DAY	0	8	f	2010-01-29	299973	315625	\N	\N
315556	SPECIFIC_DAY	0	0	f	2010-02-13	299973	315625	\N	\N
315557	SPECIFIC_DAY	0	8	f	2010-02-10	299973	315625	\N	\N
315558	SPECIFIC_DAY	0	0	f	2010-02-21	299973	315625	\N	\N
315559	SPECIFIC_DAY	0	8	f	2010-02-15	299973	315625	\N	\N
315560	SPECIFIC_DAY	0	2	f	2010-01-27	299973	315625	\N	\N
315561	SPECIFIC_DAY	0	0	f	2010-01-30	299973	315625	\N	\N
315562	SPECIFIC_DAY	0	0	f	2010-02-06	299973	315625	\N	\N
315563	SPECIFIC_DAY	0	8	f	2010-02-08	299973	315625	\N	\N
315564	SPECIFIC_DAY	0	0	f	2010-02-14	299973	315625	\N	\N
315565	SPECIFIC_DAY	0	8	f	2010-02-04	299973	315625	\N	\N
315566	SPECIFIC_DAY	0	4	f	2010-02-23	299973	315625	\N	\N
315567	SPECIFIC_DAY	0	8	f	2010-02-11	299973	315625	\N	\N
315568	SPECIFIC_DAY	0	0	f	2010-02-07	299973	315625	\N	\N
315569	SPECIFIC_DAY	0	8	f	2010-02-05	299973	315625	\N	\N
315570	SPECIFIC_DAY	0	0	f	2010-01-31	299973	315625	\N	\N
315571	SPECIFIC_DAY	0	8	f	2010-02-02	299973	315625	\N	\N
315572	SPECIFIC_DAY	0	8	f	2010-02-19	299973	315625	\N	\N
315573	SPECIFIC_DAY	0	8	f	2010-02-18	299973	315625	\N	\N
315574	SPECIFIC_DAY	0	8	f	2010-02-22	299973	315625	\N	\N
315575	SPECIFIC_DAY	0	8	f	2010-02-12	299973	315625	\N	\N
315576	SPECIFIC_DAY	0	8	f	2010-02-09	299973	315625	\N	\N
315577	SPECIFIC_DAY	0	8	f	2010-01-28	299973	315625	\N	\N
315578	SPECIFIC_DAY	0	8	f	2010-02-03	299973	315625	\N	\N
315579	SPECIFIC_DAY	0	8	f	2010-02-16	299973	315625	\N	\N
315580	SPECIFIC_DAY	0	8	f	2010-02-17	299973	315625	\N	\N
315581	SPECIFIC_DAY	0	8	f	2010-04-06	299973	315626	\N	\N
315582	SPECIFIC_DAY	0	8	f	2010-04-15	299973	315626	\N	\N
315583	SPECIFIC_DAY	0	0	f	2010-04-11	299973	315626	\N	\N
315584	SPECIFIC_DAY	0	8	f	2010-04-08	299973	315626	\N	\N
315585	SPECIFIC_DAY	0	8	f	2010-03-30	299973	315626	\N	\N
315586	SPECIFIC_DAY	0	0	f	2010-03-27	299973	315626	\N	\N
315587	SPECIFIC_DAY	0	0	f	2010-04-03	299973	315626	\N	\N
315588	SPECIFIC_DAY	0	0	f	2010-04-04	299973	315626	\N	\N
315589	SPECIFIC_DAY	0	8	f	2010-04-05	299973	315626	\N	\N
315590	SPECIFIC_DAY	0	8	f	2010-03-25	299973	315626	\N	\N
315591	SPECIFIC_DAY	0	8	f	2010-03-31	299973	315626	\N	\N
315592	SPECIFIC_DAY	0	8	f	2010-04-07	299973	315626	\N	\N
315593	SPECIFIC_DAY	0	0	f	2010-03-28	299973	315626	\N	\N
315594	SPECIFIC_DAY	0	8	f	2010-04-02	299973	315626	\N	\N
315595	SPECIFIC_DAY	0	8	f	2010-03-26	299973	315626	\N	\N
315596	SPECIFIC_DAY	0	8	f	2010-04-13	299973	315626	\N	\N
315597	SPECIFIC_DAY	0	8	f	2010-03-24	299973	315626	\N	\N
315598	SPECIFIC_DAY	0	8	f	2010-04-01	299973	315626	\N	\N
315599	SPECIFIC_DAY	0	8	f	2010-04-12	299973	315626	\N	\N
315600	SPECIFIC_DAY	0	8	f	2010-03-23	299973	315626	\N	\N
315601	SPECIFIC_DAY	0	8	f	2010-04-09	299973	315626	\N	\N
315602	SPECIFIC_DAY	0	8	f	2010-03-29	299973	315626	\N	\N
315603	SPECIFIC_DAY	0	0	f	2010-04-10	299973	315626	\N	\N
315604	SPECIFIC_DAY	0	6	f	2010-03-22	299973	315626	\N	\N
315605	SPECIFIC_DAY	0	8	f	2010-04-14	299973	315626	\N	\N
315606	GENERIC_DAY	0	8	f	2010-04-29	299973	\N	314938	\N
315607	GENERIC_DAY	0	8	f	2010-04-26	299973	\N	314938	\N
315608	GENERIC_DAY	0	0	f	2010-05-08	299973	\N	314938	\N
315609	GENERIC_DAY	0	8	f	2010-05-04	299973	\N	314938	\N
315610	GENERIC_DAY	0	0	f	2010-04-24	299973	\N	314938	\N
315611	GENERIC_DAY	0	0	f	2010-05-01	299973	\N	314938	\N
315612	GENERIC_DAY	0	8	f	2010-04-30	299973	\N	314938	\N
315613	GENERIC_DAY	0	0	f	2010-05-09	299973	\N	314938	\N
315614	GENERIC_DAY	0	6	f	2010-05-12	299973	\N	314938	\N
315615	GENERIC_DAY	0	8	f	2010-04-19	299973	\N	314938	\N
315616	GENERIC_DAY	0	8	f	2010-04-16	299973	\N	314938	\N
315617	GENERIC_DAY	0	8	f	2010-05-10	299973	\N	314938	\N
315618	GENERIC_DAY	0	0	f	2010-05-02	299973	\N	314938	\N
315619	GENERIC_DAY	0	8	f	2010-04-22	299973	\N	314938	\N
315620	GENERIC_DAY	0	8	f	2010-05-03	299973	\N	314938	\N
315621	GENERIC_DAY	0	0	f	2010-04-17	299973	\N	314938	\N
315622	GENERIC_DAY	0	0	f	2010-04-15	299973	\N	314938	\N
315623	GENERIC_DAY	0	8	f	2010-04-23	299973	\N	314938	\N
315624	GENERIC_DAY	0	8	f	2010-04-20	299973	\N	314938	\N
315726	GENERIC_DAY	0	8	f	2010-05-06	299973	\N	314938	\N
315727	GENERIC_DAY	0	0	f	2010-04-18	299973	\N	314938	\N
315728	GENERIC_DAY	0	8	f	2010-05-07	299973	\N	314938	\N
315729	GENERIC_DAY	0	8	f	2010-05-11	299973	\N	314938	\N
315730	GENERIC_DAY	0	8	f	2010-05-05	299973	\N	314938	\N
315731	GENERIC_DAY	0	8	f	2010-04-21	299973	\N	314938	\N
315732	GENERIC_DAY	0	8	f	2010-04-27	299973	\N	314938	\N
315733	GENERIC_DAY	0	8	f	2010-04-28	299973	\N	314938	\N
315734	GENERIC_DAY	0	0	f	2010-04-25	299973	\N	314938	\N
315735	SPECIFIC_DAY	0	8	f	2010-03-17	299973	315627	\N	\N
315736	SPECIFIC_DAY	0	8	f	2010-02-26	299973	315627	\N	\N
315737	SPECIFIC_DAY	0	8	f	2010-03-01	299973	315627	\N	\N
315738	SPECIFIC_DAY	0	8	f	2010-03-12	299973	315627	\N	\N
315739	SPECIFIC_DAY	0	8	f	2010-03-02	299973	315627	\N	\N
315740	SPECIFIC_DAY	0	0	f	2010-03-07	299973	315627	\N	\N
315741	SPECIFIC_DAY	0	8	f	2010-02-24	299973	315627	\N	\N
315742	SPECIFIC_DAY	0	8	f	2010-02-25	299973	315627	\N	\N
315743	SPECIFIC_DAY	0	8	f	2010-03-04	299973	315627	\N	\N
315744	SPECIFIC_DAY	0	8	f	2010-03-08	299973	315627	\N	\N
315745	SPECIFIC_DAY	0	8	f	2010-03-09	299973	315627	\N	\N
315746	SPECIFIC_DAY	0	8	f	2010-03-03	299973	315627	\N	\N
315747	SPECIFIC_DAY	0	0	f	2010-02-28	299973	315627	\N	\N
315748	SPECIFIC_DAY	0	0	f	2010-03-21	299973	315627	\N	\N
315749	SPECIFIC_DAY	0	8	f	2010-03-10	299973	315627	\N	\N
315750	SPECIFIC_DAY	0	0	f	2010-03-20	299973	315627	\N	\N
315751	SPECIFIC_DAY	0	2	f	2010-03-22	299973	315627	\N	\N
315752	SPECIFIC_DAY	0	4	f	2010-02-23	299973	315627	\N	\N
315753	SPECIFIC_DAY	0	0	f	2010-03-14	299973	315627	\N	\N
315754	SPECIFIC_DAY	0	0	f	2010-03-13	299973	315627	\N	\N
315755	SPECIFIC_DAY	0	8	f	2010-03-15	299973	315627	\N	\N
315756	SPECIFIC_DAY	0	8	f	2010-03-16	299973	315627	\N	\N
315757	SPECIFIC_DAY	0	0	f	2010-03-06	299973	315627	\N	\N
315758	SPECIFIC_DAY	0	8	f	2010-03-11	299973	315627	\N	\N
315759	SPECIFIC_DAY	0	8	f	2010-03-18	299973	315627	\N	\N
315760	SPECIFIC_DAY	0	8	f	2010-03-05	299973	315627	\N	\N
315761	SPECIFIC_DAY	0	0	f	2010-02-27	299973	315627	\N	\N
315762	SPECIFIC_DAY	0	8	f	2010-03-19	299973	315627	\N	\N
315763	GENERIC_DAY	0	6	f	2010-05-12	299971	\N	314939	\N
315764	GENERIC_DAY	0	8	f	2010-04-16	299971	\N	314939	\N
315765	GENERIC_DAY	0	8	f	2010-04-21	299971	\N	314939	\N
315766	GENERIC_DAY	0	8	f	2010-05-03	299971	\N	314939	\N
315767	GENERIC_DAY	0	0	f	2010-05-02	299971	\N	314939	\N
315768	GENERIC_DAY	0	8	f	2010-04-28	299971	\N	314939	\N
315769	GENERIC_DAY	0	0	f	2010-04-25	299971	\N	314939	\N
315770	GENERIC_DAY	0	8	f	2010-04-29	299971	\N	314939	\N
315771	GENERIC_DAY	0	8	f	2010-04-26	299971	\N	314939	\N
315772	GENERIC_DAY	0	0	f	2010-04-17	299971	\N	314939	\N
315773	GENERIC_DAY	0	8	f	2010-04-19	299971	\N	314939	\N
315774	GENERIC_DAY	0	8	f	2010-05-06	299971	\N	314939	\N
315775	GENERIC_DAY	0	0	f	2010-04-24	299971	\N	314939	\N
315776	GENERIC_DAY	0	8	f	2010-05-10	299971	\N	314939	\N
315777	GENERIC_DAY	0	8	f	2010-05-05	299971	\N	314939	\N
315778	GENERIC_DAY	0	8	f	2010-04-22	299971	\N	314939	\N
315779	GENERIC_DAY	0	0	f	2010-05-09	299971	\N	314939	\N
315780	GENERIC_DAY	0	8	f	2010-05-04	299971	\N	314939	\N
315781	GENERIC_DAY	0	8	f	2010-05-07	299971	\N	314939	\N
315782	GENERIC_DAY	0	8	f	2010-04-23	299971	\N	314939	\N
315783	GENERIC_DAY	0	8	f	2010-04-30	299971	\N	314939	\N
315784	GENERIC_DAY	0	0	f	2010-05-08	299971	\N	314939	\N
315785	GENERIC_DAY	0	0	f	2010-04-18	299971	\N	314939	\N
315786	GENERIC_DAY	0	0	f	2010-04-15	299971	\N	314939	\N
315787	GENERIC_DAY	0	0	f	2010-05-01	299971	\N	314939	\N
315788	GENERIC_DAY	0	8	f	2010-04-20	299971	\N	314939	\N
315789	GENERIC_DAY	0	8	f	2010-04-27	299971	\N	314939	\N
315790	GENERIC_DAY	0	8	f	2010-05-11	299971	\N	314939	\N
315791	GENERIC_DAY	0	8	f	2010-01-01	299977	\N	314940	\N
315792	GENERIC_DAY	0	8	f	2010-01-04	299977	\N	314940	\N
315793	GENERIC_DAY	0	8	f	2010-01-12	299977	\N	314940	\N
315794	GENERIC_DAY	0	8	f	2010-01-13	299977	\N	314940	\N
315795	GENERIC_DAY	0	0	f	2010-01-03	299977	\N	314940	\N
315796	GENERIC_DAY	0	8	f	2010-01-05	299977	\N	314940	\N
315797	GENERIC_DAY	0	0	f	2010-01-02	299977	\N	314940	\N
315798	GENERIC_DAY	0	8	f	2010-01-18	299977	\N	314940	\N
315799	GENERIC_DAY	0	8	f	2010-01-15	299977	\N	314940	\N
315800	GENERIC_DAY	0	8	f	2010-01-14	299977	\N	314940	\N
315801	GENERIC_DAY	0	0	f	2010-01-16	299977	\N	314940	\N
315802	GENERIC_DAY	0	8	f	2010-01-11	299977	\N	314940	\N
315803	GENERIC_DAY	0	8	f	2010-01-08	299977	\N	314940	\N
315804	GENERIC_DAY	0	8	f	2010-01-06	299977	\N	314940	\N
315805	GENERIC_DAY	0	0	f	2010-01-10	299977	\N	314940	\N
315806	GENERIC_DAY	0	0	f	2010-01-17	299977	\N	314940	\N
315807	GENERIC_DAY	0	8	f	2010-01-20	299977	\N	314940	\N
315808	GENERIC_DAY	0	8	f	2010-01-19	299977	\N	314940	\N
315809	GENERIC_DAY	0	0	f	2010-01-09	299977	\N	314940	\N
315810	GENERIC_DAY	0	8	f	2010-01-21	299977	\N	314940	\N
315811	GENERIC_DAY	0	8	f	2010-01-07	299977	\N	314940	\N
315812	GENERIC_DAY	0	8	f	2010-04-05	299985	\N	314941	\N
315813	GENERIC_DAY	0	8	f	2010-04-12	299985	\N	314941	\N
315814	GENERIC_DAY	0	8	f	2010-04-09	299985	\N	314941	\N
315815	GENERIC_DAY	0	8	f	2010-04-08	299985	\N	314941	\N
315816	GENERIC_DAY	0	8	f	2010-03-29	299985	\N	314941	\N
315817	GENERIC_DAY	0	0	f	2010-03-28	299985	\N	314941	\N
315818	GENERIC_DAY	0	8	f	2010-04-02	299985	\N	314941	\N
315819	GENERIC_DAY	0	0	f	2010-04-04	299985	\N	314941	\N
315820	GENERIC_DAY	0	8	f	2010-04-06	299985	\N	314941	\N
315821	GENERIC_DAY	0	0	f	2010-04-03	299985	\N	314941	\N
315822	GENERIC_DAY	0	8	f	2010-04-13	299985	\N	314941	\N
315823	GENERIC_DAY	0	8	f	2010-04-07	299985	\N	314941	\N
315824	GENERIC_DAY	0	8	f	2010-03-26	299985	\N	314941	\N
315825	GENERIC_DAY	0	8	f	2010-04-14	299985	\N	314941	\N
315826	GENERIC_DAY	0	0	f	2010-03-27	299985	\N	314941	\N
315827	GENERIC_DAY	0	8	f	2010-03-30	299985	\N	314941	\N
315828	GENERIC_DAY	0	6	f	2010-03-22	299985	\N	314941	\N
315829	GENERIC_DAY	0	0	f	2010-04-10	299985	\N	314941	\N
315830	GENERIC_DAY	0	0	f	2010-04-11	299985	\N	314941	\N
315831	GENERIC_DAY	0	8	f	2010-03-25	299985	\N	314941	\N
315832	GENERIC_DAY	0	8	f	2010-03-31	299985	\N	314941	\N
315833	GENERIC_DAY	0	8	f	2010-04-01	299985	\N	314941	\N
315834	GENERIC_DAY	0	8	f	2010-03-24	299985	\N	314941	\N
315835	GENERIC_DAY	0	8	f	2010-04-15	299985	\N	314941	\N
315836	GENERIC_DAY	0	8	f	2010-03-23	299985	\N	314941	\N
315837	GENERIC_DAY	0	8	f	2010-03-31	299971	\N	314942	\N
315838	GENERIC_DAY	0	8	f	2010-03-25	299971	\N	314942	\N
315839	GENERIC_DAY	0	0	f	2010-03-28	299971	\N	314942	\N
315840	GENERIC_DAY	0	0	f	2010-04-10	299971	\N	314942	\N
315841	GENERIC_DAY	0	8	f	2010-04-02	299971	\N	314942	\N
315842	GENERIC_DAY	0	8	f	2010-04-15	299971	\N	314942	\N
315843	GENERIC_DAY	0	0	f	2010-04-11	299971	\N	314942	\N
315844	GENERIC_DAY	0	8	f	2010-03-24	299971	\N	314942	\N
315845	GENERIC_DAY	0	8	f	2010-03-26	299971	\N	314942	\N
315846	GENERIC_DAY	0	8	f	2010-03-29	299971	\N	314942	\N
315847	GENERIC_DAY	0	8	f	2010-04-09	299971	\N	314942	\N
315848	GENERIC_DAY	0	8	f	2010-04-06	299971	\N	314942	\N
315849	GENERIC_DAY	0	8	f	2010-04-08	299971	\N	314942	\N
315850	GENERIC_DAY	0	0	f	2010-04-04	299971	\N	314942	\N
315851	GENERIC_DAY	0	8	f	2010-04-05	299971	\N	314942	\N
315852	GENERIC_DAY	0	8	f	2010-04-12	299971	\N	314942	\N
315853	GENERIC_DAY	0	6	f	2010-03-22	299971	\N	314942	\N
315854	GENERIC_DAY	0	8	f	2010-04-01	299971	\N	314942	\N
315855	GENERIC_DAY	0	0	f	2010-03-27	299971	\N	314942	\N
315856	GENERIC_DAY	0	8	f	2010-04-07	299971	\N	314942	\N
315857	GENERIC_DAY	0	0	f	2010-04-03	299971	\N	314942	\N
315858	GENERIC_DAY	0	8	f	2010-03-23	299971	\N	314942	\N
315859	GENERIC_DAY	0	8	f	2010-04-14	299971	\N	314942	\N
315860	GENERIC_DAY	0	8	f	2010-04-13	299971	\N	314942	\N
315861	GENERIC_DAY	0	8	f	2010-03-30	299971	\N	314942	\N
315862	GENERIC_DAY	0	8	f	2010-01-06	299975	\N	314943	\N
315863	GENERIC_DAY	0	8	f	2010-01-01	299975	\N	314943	\N
315864	GENERIC_DAY	0	8	f	2010-01-19	299975	\N	314943	\N
315865	GENERIC_DAY	0	8	f	2010-01-15	299975	\N	314943	\N
315866	GENERIC_DAY	0	8	f	2010-01-08	299975	\N	314943	\N
315867	GENERIC_DAY	0	0	f	2010-01-09	299975	\N	314943	\N
315868	GENERIC_DAY	0	0	f	2010-01-10	299975	\N	314943	\N
315869	GENERIC_DAY	0	0	f	2010-01-16	299975	\N	314943	\N
315870	GENERIC_DAY	0	8	f	2010-01-11	299975	\N	314943	\N
315871	GENERIC_DAY	0	8	f	2010-01-18	299975	\N	314943	\N
315872	GENERIC_DAY	0	0	f	2010-01-17	299975	\N	314943	\N
315873	GENERIC_DAY	0	8	f	2010-01-14	299975	\N	314943	\N
315874	GENERIC_DAY	0	8	f	2010-01-05	299975	\N	314943	\N
315875	GENERIC_DAY	0	8	f	2010-01-13	299975	\N	314943	\N
315876	GENERIC_DAY	0	8	f	2010-01-12	299975	\N	314943	\N
315877	GENERIC_DAY	0	8	f	2010-01-20	299975	\N	314943	\N
315878	GENERIC_DAY	0	8	f	2010-01-04	299975	\N	314943	\N
315879	GENERIC_DAY	0	0	f	2010-01-03	299975	\N	314943	\N
315880	GENERIC_DAY	0	8	f	2010-01-21	299975	\N	314943	\N
315881	GENERIC_DAY	0	8	f	2010-01-07	299975	\N	314943	\N
315882	GENERIC_DAY	0	0	f	2010-01-02	299975	\N	314943	\N
315883	GENERIC_DAY	0	8	f	2010-02-17	299977	\N	314944	\N
315884	GENERIC_DAY	0	0	f	2010-02-28	299977	\N	314944	\N
315885	GENERIC_DAY	0	8	f	2010-02-25	299977	\N	314944	\N
315886	GENERIC_DAY	0	8	f	2010-02-15	299977	\N	314944	\N
315887	GENERIC_DAY	0	8	f	2010-02-22	299977	\N	314944	\N
315888	GENERIC_DAY	0	0	f	2010-02-20	299977	\N	314944	\N
315889	GENERIC_DAY	0	0	f	2010-02-27	299977	\N	314944	\N
315890	GENERIC_DAY	0	8	f	2010-03-04	299977	\N	314944	\N
315891	GENERIC_DAY	0	8	f	2010-02-18	299977	\N	314944	\N
315892	GENERIC_DAY	0	8	f	2010-03-01	299977	\N	314944	\N
315893	GENERIC_DAY	0	8	f	2010-02-26	299977	\N	314944	\N
315894	GENERIC_DAY	0	8	f	2010-03-02	299977	\N	314944	\N
315895	GENERIC_DAY	0	0	f	2010-02-11	299977	\N	314944	\N
315896	GENERIC_DAY	0	0	f	2010-02-13	299977	\N	314944	\N
315897	GENERIC_DAY	0	8	f	2010-02-23	299977	\N	314944	\N
315898	GENERIC_DAY	0	0	f	2010-02-21	299977	\N	314944	\N
315899	GENERIC_DAY	0	8	f	2010-03-03	299977	\N	314944	\N
315900	GENERIC_DAY	0	0	f	2010-02-14	299977	\N	314944	\N
315901	GENERIC_DAY	0	8	f	2010-02-12	299977	\N	314944	\N
315902	GENERIC_DAY	0	8	f	2010-02-24	299977	\N	314944	\N
315903	GENERIC_DAY	0	8	f	2010-02-19	299977	\N	314944	\N
315904	GENERIC_DAY	0	8	f	2010-02-16	299977	\N	314944	\N
315905	GENERIC_DAY	0	8	f	2010-04-13	299977	\N	314945	\N
315906	GENERIC_DAY	0	8	f	2010-03-30	299977	\N	314945	\N
315907	GENERIC_DAY	0	8	f	2010-04-15	299977	\N	314945	\N
315908	GENERIC_DAY	0	0	f	2010-03-27	299977	\N	314945	\N
315909	GENERIC_DAY	0	8	f	2010-04-07	299977	\N	314945	\N
315910	GENERIC_DAY	0	8	f	2010-03-26	299977	\N	314945	\N
315911	GENERIC_DAY	0	8	f	2010-04-12	299977	\N	314945	\N
315912	GENERIC_DAY	0	0	f	2010-04-11	299977	\N	314945	\N
315913	GENERIC_DAY	0	8	f	2010-04-06	299977	\N	314945	\N
315914	GENERIC_DAY	0	8	f	2010-03-29	299977	\N	314945	\N
315915	GENERIC_DAY	0	0	f	2010-04-03	299977	\N	314945	\N
315916	GENERIC_DAY	0	8	f	2010-04-14	299977	\N	314945	\N
315917	GENERIC_DAY	0	8	f	2010-04-02	299977	\N	314945	\N
315918	GENERIC_DAY	0	8	f	2010-04-01	299977	\N	314945	\N
315919	GENERIC_DAY	0	0	f	2010-04-04	299977	\N	314945	\N
315920	GENERIC_DAY	0	8	f	2010-04-08	299977	\N	314945	\N
315921	GENERIC_DAY	0	0	f	2010-04-10	299977	\N	314945	\N
315922	GENERIC_DAY	0	8	f	2010-04-05	299977	\N	314945	\N
315923	GENERIC_DAY	0	0	f	2010-03-25	299977	\N	314945	\N
315924	GENERIC_DAY	0	8	f	2010-03-31	299977	\N	314945	\N
315925	GENERIC_DAY	0	0	f	2010-03-28	299977	\N	314945	\N
315926	GENERIC_DAY	0	8	f	2010-04-09	299977	\N	314945	\N
315927	GENERIC_DAY	0	8	f	2010-03-30	299975	\N	314946	\N
315928	GENERIC_DAY	0	8	f	2010-04-14	299975	\N	314946	\N
315929	GENERIC_DAY	0	8	f	2010-04-13	299975	\N	314946	\N
315930	GENERIC_DAY	0	0	f	2010-04-03	299975	\N	314946	\N
315931	GENERIC_DAY	0	8	f	2010-04-01	299975	\N	314946	\N
315932	GENERIC_DAY	0	0	f	2010-03-28	299975	\N	314946	\N
315933	GENERIC_DAY	0	8	f	2010-03-29	299975	\N	314946	\N
315934	GENERIC_DAY	0	8	f	2010-03-31	299975	\N	314946	\N
315935	GENERIC_DAY	0	8	f	2010-04-07	299975	\N	314946	\N
315936	GENERIC_DAY	0	8	f	2010-03-26	299975	\N	314946	\N
315937	GENERIC_DAY	0	0	f	2010-04-04	299975	\N	314946	\N
315938	GENERIC_DAY	0	8	f	2010-04-09	299975	\N	314946	\N
315939	GENERIC_DAY	0	0	f	2010-03-27	299975	\N	314946	\N
315940	GENERIC_DAY	0	8	f	2010-04-15	299975	\N	314946	\N
315941	GENERIC_DAY	0	8	f	2010-04-06	299975	\N	314946	\N
315942	GENERIC_DAY	0	0	f	2010-04-11	299975	\N	314946	\N
315943	GENERIC_DAY	0	0	f	2010-03-25	299975	\N	314946	\N
315944	GENERIC_DAY	0	8	f	2010-04-02	299975	\N	314946	\N
315945	GENERIC_DAY	0	8	f	2010-04-12	299975	\N	314946	\N
315946	GENERIC_DAY	0	8	f	2010-04-05	299975	\N	314946	\N
315947	GENERIC_DAY	0	0	f	2010-04-10	299975	\N	314946	\N
315948	GENERIC_DAY	0	8	f	2010-04-08	299975	\N	314946	\N
315949	GENERIC_DAY	0	8	f	2010-02-18	299971	\N	314947	\N
315950	GENERIC_DAY	0	0	f	2010-02-07	299971	\N	314947	\N
315951	GENERIC_DAY	0	8	f	2010-02-02	299971	\N	314947	\N
315952	GENERIC_DAY	0	0	f	2010-02-06	299971	\N	314947	\N
315953	GENERIC_DAY	0	8	f	2010-02-04	299971	\N	314947	\N
315954	GENERIC_DAY	0	8	f	2010-02-19	299971	\N	314947	\N
315955	GENERIC_DAY	0	0	f	2010-01-30	299971	\N	314947	\N
315956	GENERIC_DAY	0	8	f	2010-02-16	299971	\N	314947	\N
315957	GENERIC_DAY	0	8	f	2010-02-03	299971	\N	314947	\N
315958	GENERIC_DAY	0	2	f	2010-01-27	299971	\N	314947	\N
315959	GENERIC_DAY	0	0	f	2010-02-14	299971	\N	314947	\N
315960	GENERIC_DAY	0	0	f	2010-02-20	299971	\N	314947	\N
315961	GENERIC_DAY	0	8	f	2010-02-10	299971	\N	314947	\N
315962	GENERIC_DAY	0	0	f	2010-02-13	299971	\N	314947	\N
315963	GENERIC_DAY	0	8	f	2010-02-22	299971	\N	314947	\N
315964	GENERIC_DAY	0	0	f	2010-01-31	299971	\N	314947	\N
315965	GENERIC_DAY	0	0	f	2010-02-21	299971	\N	314947	\N
315966	GENERIC_DAY	0	8	f	2010-02-08	299971	\N	314947	\N
315967	GENERIC_DAY	0	8	f	2010-02-15	299971	\N	314947	\N
315968	GENERIC_DAY	0	8	f	2010-02-09	299971	\N	314947	\N
315969	GENERIC_DAY	0	8	f	2010-02-11	299971	\N	314947	\N
315970	GENERIC_DAY	0	8	f	2010-02-12	299971	\N	314947	\N
315971	GENERIC_DAY	0	4	f	2010-02-23	299971	\N	314947	\N
315972	GENERIC_DAY	0	8	f	2010-02-05	299971	\N	314947	\N
315973	GENERIC_DAY	0	8	f	2010-01-29	299971	\N	314947	\N
315974	GENERIC_DAY	0	8	f	2010-01-28	299971	\N	314947	\N
315975	GENERIC_DAY	0	8	f	2010-02-01	299971	\N	314947	\N
315976	GENERIC_DAY	0	8	f	2010-02-17	299971	\N	314947	\N
315977	GENERIC_DAY	0	8	f	2010-02-24	299975	\N	314948	\N
315978	GENERIC_DAY	0	8	f	2010-02-18	299975	\N	314948	\N
315979	GENERIC_DAY	0	0	f	2010-02-27	299975	\N	314948	\N
315980	GENERIC_DAY	0	8	f	2010-02-23	299975	\N	314948	\N
315981	GENERIC_DAY	0	8	f	2010-02-12	299975	\N	314948	\N
315982	GENERIC_DAY	0	8	f	2010-03-03	299975	\N	314948	\N
315983	GENERIC_DAY	0	8	f	2010-03-01	299975	\N	314948	\N
315984	GENERIC_DAY	0	0	f	2010-02-13	299975	\N	314948	\N
315985	GENERIC_DAY	0	8	f	2010-02-16	299975	\N	314948	\N
315986	GENERIC_DAY	0	8	f	2010-02-15	299975	\N	314948	\N
315987	GENERIC_DAY	0	8	f	2010-03-02	299975	\N	314948	\N
315988	GENERIC_DAY	0	8	f	2010-03-04	299975	\N	314948	\N
315989	GENERIC_DAY	0	8	f	2010-02-22	299975	\N	314948	\N
315990	GENERIC_DAY	0	0	f	2010-02-20	299975	\N	314948	\N
315991	GENERIC_DAY	0	0	f	2010-02-11	299975	\N	314948	\N
315992	GENERIC_DAY	0	8	f	2010-02-25	299975	\N	314948	\N
315993	GENERIC_DAY	0	0	f	2010-02-21	299975	\N	314948	\N
315994	GENERIC_DAY	0	8	f	2010-02-19	299975	\N	314948	\N
315995	GENERIC_DAY	0	0	f	2010-02-28	299975	\N	314948	\N
315996	GENERIC_DAY	0	8	f	2010-02-26	299975	\N	314948	\N
315997	GENERIC_DAY	0	8	f	2010-02-17	299975	\N	314948	\N
315998	GENERIC_DAY	0	0	f	2010-02-14	299975	\N	314948	\N
315999	GENERIC_DAY	0	8	f	2010-04-21	299983	\N	314949	\N
316000	GENERIC_DAY	0	0	f	2010-04-18	299983	\N	314949	\N
316001	GENERIC_DAY	0	8	f	2010-04-22	299983	\N	314949	\N
316002	GENERIC_DAY	0	0	f	2010-04-25	299983	\N	314949	\N
316003	GENERIC_DAY	0	0	f	2010-05-09	299983	\N	314949	\N
316004	GENERIC_DAY	0	8	f	2010-05-05	299983	\N	314949	\N
316005	GENERIC_DAY	0	8	f	2010-04-29	299983	\N	314949	\N
316006	GENERIC_DAY	0	8	f	2010-05-03	299983	\N	314949	\N
316007	GENERIC_DAY	0	8	f	2010-04-20	299983	\N	314949	\N
316008	GENERIC_DAY	0	8	f	2010-05-07	299983	\N	314949	\N
316009	GENERIC_DAY	0	0	f	2010-04-15	299983	\N	314949	\N
316010	GENERIC_DAY	0	6	f	2010-05-12	299983	\N	314949	\N
316011	GENERIC_DAY	0	0	f	2010-05-02	299983	\N	314949	\N
316012	GENERIC_DAY	0	8	f	2010-04-19	299983	\N	314949	\N
316013	GENERIC_DAY	0	8	f	2010-05-06	299983	\N	314949	\N
316014	GENERIC_DAY	0	0	f	2010-05-08	299983	\N	314949	\N
316015	GENERIC_DAY	0	8	f	2010-04-30	299983	\N	314949	\N
316016	GENERIC_DAY	0	0	f	2010-05-01	299983	\N	314949	\N
316017	GENERIC_DAY	0	8	f	2010-04-16	299983	\N	314949	\N
316018	GENERIC_DAY	0	0	f	2010-04-24	299983	\N	314949	\N
316019	GENERIC_DAY	0	8	f	2010-05-11	299983	\N	314949	\N
316020	GENERIC_DAY	0	8	f	2010-04-23	299983	\N	314949	\N
316021	GENERIC_DAY	0	8	f	2010-05-04	299983	\N	314949	\N
316022	GENERIC_DAY	0	0	f	2010-04-17	299983	\N	314949	\N
316023	GENERIC_DAY	0	8	f	2010-04-28	299983	\N	314949	\N
316024	GENERIC_DAY	0	8	f	2010-04-26	299983	\N	314949	\N
316025	GENERIC_DAY	0	8	f	2010-05-10	299983	\N	314949	\N
316026	GENERIC_DAY	0	8	f	2010-04-27	299983	\N	314949	\N
316027	GENERIC_DAY	0	0	f	2010-03-21	299983	\N	314950	\N
316028	GENERIC_DAY	0	8	f	2010-03-08	299983	\N	314950	\N
316029	GENERIC_DAY	0	8	f	2010-03-03	299983	\N	314950	\N
316030	GENERIC_DAY	0	8	f	2010-02-25	299983	\N	314950	\N
316031	GENERIC_DAY	0	8	f	2010-03-16	299983	\N	314950	\N
316032	GENERIC_DAY	0	0	f	2010-03-20	299983	\N	314950	\N
316033	GENERIC_DAY	0	8	f	2010-03-12	299983	\N	314950	\N
316034	GENERIC_DAY	0	0	f	2010-02-27	299983	\N	314950	\N
316035	GENERIC_DAY	0	8	f	2010-02-26	299983	\N	314950	\N
316036	GENERIC_DAY	0	8	f	2010-03-11	299983	\N	314950	\N
316037	GENERIC_DAY	0	2	f	2010-03-22	299983	\N	314950	\N
316038	GENERIC_DAY	0	0	f	2010-03-07	299983	\N	314950	\N
316039	GENERIC_DAY	0	8	f	2010-03-02	299983	\N	314950	\N
316040	GENERIC_DAY	0	8	f	2010-03-09	299983	\N	314950	\N
316041	GENERIC_DAY	0	0	f	2010-03-14	299983	\N	314950	\N
316042	GENERIC_DAY	0	8	f	2010-03-18	299983	\N	314950	\N
316043	GENERIC_DAY	0	8	f	2010-03-05	299983	\N	314950	\N
316044	GENERIC_DAY	0	8	f	2010-02-24	299983	\N	314950	\N
316045	GENERIC_DAY	0	8	f	2010-03-17	299983	\N	314950	\N
316046	GENERIC_DAY	0	8	f	2010-03-19	299983	\N	314950	\N
316047	GENERIC_DAY	0	8	f	2010-03-04	299983	\N	314950	\N
316048	GENERIC_DAY	0	0	f	2010-03-13	299983	\N	314950	\N
316049	GENERIC_DAY	0	0	f	2010-02-28	299983	\N	314950	\N
316050	GENERIC_DAY	0	4	f	2010-02-23	299983	\N	314950	\N
316051	GENERIC_DAY	0	0	f	2010-03-06	299983	\N	314950	\N
316052	GENERIC_DAY	0	8	f	2010-03-10	299983	\N	314950	\N
316053	GENERIC_DAY	0	8	f	2010-03-01	299983	\N	314950	\N
316054	GENERIC_DAY	0	8	f	2010-03-15	299983	\N	314950	\N
316055	GENERIC_DAY	0	8	f	2010-01-27	299975	\N	314951	\N
316056	GENERIC_DAY	0	8	f	2010-02-10	299975	\N	314951	\N
316057	GENERIC_DAY	0	0	f	2010-01-21	299975	\N	314951	\N
316058	GENERIC_DAY	0	0	f	2010-01-24	299975	\N	314951	\N
316059	GENERIC_DAY	0	8	f	2010-02-03	299975	\N	314951	\N
316060	GENERIC_DAY	0	8	f	2010-01-28	299975	\N	314951	\N
316061	GENERIC_DAY	0	0	f	2010-02-07	299975	\N	314951	\N
316062	GENERIC_DAY	0	8	f	2010-02-08	299975	\N	314951	\N
316063	GENERIC_DAY	0	8	f	2010-02-11	299975	\N	314951	\N
316064	GENERIC_DAY	0	8	f	2010-01-29	299975	\N	314951	\N
316065	GENERIC_DAY	0	0	f	2010-02-06	299975	\N	314951	\N
316066	GENERIC_DAY	0	0	f	2010-01-23	299975	\N	314951	\N
316067	GENERIC_DAY	0	8	f	2010-01-22	299975	\N	314951	\N
316068	GENERIC_DAY	0	8	f	2010-01-26	299975	\N	314951	\N
316069	GENERIC_DAY	0	8	f	2010-02-09	299975	\N	314951	\N
316070	GENERIC_DAY	0	8	f	2010-02-02	299975	\N	314951	\N
316071	GENERIC_DAY	0	8	f	2010-02-04	299975	\N	314951	\N
316072	GENERIC_DAY	0	8	f	2010-01-25	299975	\N	314951	\N
316073	GENERIC_DAY	0	8	f	2010-02-01	299975	\N	314951	\N
316074	GENERIC_DAY	0	0	f	2010-01-31	299975	\N	314951	\N
316075	GENERIC_DAY	0	0	f	2010-01-30	299975	\N	314951	\N
316076	GENERIC_DAY	0	8	f	2010-02-05	299975	\N	314951	\N
316077	GENERIC_DAY	0	8	f	2010-03-19	299977	\N	314952	\N
316078	GENERIC_DAY	0	0	f	2010-03-14	299977	\N	314952	\N
316079	GENERIC_DAY	0	8	f	2010-03-23	299977	\N	314952	\N
316080	GENERIC_DAY	0	0	f	2010-03-21	299977	\N	314952	\N
316081	GENERIC_DAY	0	8	f	2010-03-11	299977	\N	314952	\N
316082	GENERIC_DAY	0	8	f	2010-03-17	299977	\N	314952	\N
316083	GENERIC_DAY	0	0	f	2010-03-13	299977	\N	314952	\N
316084	GENERIC_DAY	0	8	f	2010-03-22	299977	\N	314952	\N
316085	GENERIC_DAY	0	8	f	2010-03-15	299977	\N	314952	\N
316086	GENERIC_DAY	0	0	f	2010-03-20	299977	\N	314952	\N
316087	GENERIC_DAY	0	8	f	2010-03-09	299977	\N	314952	\N
316088	GENERIC_DAY	0	0	f	2010-03-07	299977	\N	314952	\N
316089	GENERIC_DAY	0	8	f	2010-03-18	299977	\N	314952	\N
316090	GENERIC_DAY	0	8	f	2010-03-24	299977	\N	314952	\N
316091	GENERIC_DAY	0	8	f	2010-03-05	299977	\N	314952	\N
316092	GENERIC_DAY	0	0	f	2010-03-04	299977	\N	314952	\N
316093	GENERIC_DAY	0	8	f	2010-03-25	299977	\N	314952	\N
316094	GENERIC_DAY	0	8	f	2010-03-10	299977	\N	314952	\N
316095	GENERIC_DAY	0	8	f	2010-03-16	299977	\N	314952	\N
316096	GENERIC_DAY	0	8	f	2010-03-08	299977	\N	314952	\N
316097	GENERIC_DAY	0	8	f	2010-03-12	299977	\N	314952	\N
316098	GENERIC_DAY	0	0	f	2010-03-06	299977	\N	314952	\N
316099	SPECIFIC_DAY	0	0	f	2010-01-10	299973	315628	\N	\N
316100	SPECIFIC_DAY	0	0	f	2010-01-02	299973	315628	\N	\N
316101	SPECIFIC_DAY	0	0	f	2010-01-24	299973	315628	\N	\N
316102	SPECIFIC_DAY	0	8	f	2010-01-18	299973	315628	\N	\N
316103	SPECIFIC_DAY	0	8	f	2010-01-25	299973	315628	\N	\N
316104	SPECIFIC_DAY	0	8	f	2010-01-07	299973	315628	\N	\N
316105	SPECIFIC_DAY	0	0	f	2010-01-09	299973	315628	\N	\N
316106	SPECIFIC_DAY	0	8	f	2010-01-06	299973	315628	\N	\N
316107	SPECIFIC_DAY	0	8	f	2010-01-08	299973	315628	\N	\N
316108	SPECIFIC_DAY	0	6	f	2010-01-27	299973	315628	\N	\N
316109	SPECIFIC_DAY	0	8	f	2010-01-15	299973	315628	\N	\N
316110	SPECIFIC_DAY	0	8	f	2010-01-21	299973	315628	\N	\N
316111	SPECIFIC_DAY	0	0	f	2010-01-03	299973	315628	\N	\N
316112	SPECIFIC_DAY	0	8	f	2010-01-04	299973	315628	\N	\N
316113	SPECIFIC_DAY	0	8	f	2010-01-22	299973	315628	\N	\N
316114	SPECIFIC_DAY	0	8	f	2010-01-05	299973	315628	\N	\N
316115	SPECIFIC_DAY	0	8	f	2010-01-01	299973	315628	\N	\N
316116	SPECIFIC_DAY	0	8	f	2010-01-11	299973	315628	\N	\N
316117	SPECIFIC_DAY	0	8	f	2010-01-26	299973	315628	\N	\N
316118	SPECIFIC_DAY	0	0	f	2010-01-16	299973	315628	\N	\N
316119	SPECIFIC_DAY	0	8	f	2010-01-14	299973	315628	\N	\N
316120	SPECIFIC_DAY	0	8	f	2010-01-13	299973	315628	\N	\N
316121	SPECIFIC_DAY	0	0	f	2010-01-17	299973	315628	\N	\N
316122	SPECIFIC_DAY	0	8	f	2010-01-19	299973	315628	\N	\N
316123	SPECIFIC_DAY	0	8	f	2010-01-12	299973	315628	\N	\N
316124	SPECIFIC_DAY	0	8	f	2010-01-20	299973	315628	\N	\N
316125	SPECIFIC_DAY	0	0	f	2010-01-23	299973	315628	\N	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
103809036	5	314667	314668	\N	0
103809037	5	314669	314670	\N	0
103809038	5	314670	314679	\N	0
103809039	5	314673	314674	\N	0
103809073	4	314675	314676	\N	0
103809143	2	314698	314713	\N	0
103809144	2	314701	314712	\N	0
103809145	2	314704	314710	\N	0
103809146	2	314706	314709	\N	0
98861170	2	302802	302827	\N	0
98861171	2	302815	302816	\N	0
98861172	2	302816	302823	\N	0
98861173	2	302823	302824	\N	0
98861174	2	302818	302822	\N	0
98861175	2	302824	302825	\N	0
98861176	2	302825	302826	\N	0
103809115	3	314683	314684	\N	0
103809116	3	314684	314696	\N	0
103809118	3	314687	314694	\N	0
103809117	3	314687	314688	\N	0
103809119	3	314689	314690	\N	0
103809120	3	314690	314693	\N	0
103809154	1	314715	319273	\N	0
103809155	1	319263	319272	\N	0
103809156	1	319266	319271	\N	0
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
317573	318960	100.00
302703	300825	100.00
302704	300796	100.00
302705	300826	100.00
302706	300827	100.00
302707	300828	100.00
302710	301604	100.00
302711	301592	100.00
302712	301605	100.00
302713	301606	100.00
302714	301607	100.00
302717	301648	100.00
302718	301649	100.00
302719	301651	100.00
302720	301652	100.00
302721	301654	100.00
302722	301655	100.00
302723	301656	100.00
302728	301657	100.00
302729	301658	100.00
302730	301659	100.00
302733	301678	100.00
302734	301666	100.00
302735	301679	100.00
302736	301680	100.00
302737	301681	100.00
302697	300806	100.00
302698	300790	100.00
302699	300807	100.00
302700	300808	100.00
314579	316163	100.00
314580	316133	100.00
314581	316165	100.00
314582	316166	100.00
314583	316168	100.00
314584	316169	100.00
314585	316171	100.00
314586	316172	100.00
314587	316174	100.00
314588	316175	100.00
314548	313334	100.00
314549	313336	100.00
314550	313337	100.00
314551	313338	100.00
314552	313339	100.00
314553	313340	100.00
314554	313341	100.00
314561	313382	100.00
314562	313383	100.00
314563	313385	100.00
314564	313386	100.00
314565	313388	100.00
314566	313389	100.00
314567	313390	100.00
314568	313391	100.00
314569	313392	100.00
314570	313393	100.00
314605	316219	100.00
314606	316220	100.00
314607	316222	100.00
314608	316223	100.00
314609	316225	100.00
314610	316226	100.00
317551	317663	100.00
317550	317664	100.00
317552	317697	100.00
317553	317698	100.00
317554	317700	100.00
317555	317701	100.00
317556	317703	100.00
317557	317705	100.00
317558	317706	100.00
317559	317708	100.00
317560	317709	100.00
317574	317718	100.00
317575	318962	100.00
317576	318963	100.00
317577	318965	100.00
317578	318966	100.00
317579	318967	100.00
317580	318969	100.00
317581	318971	100.00
317582	318972	100.00
317593	318981	100.00
314514	311832	100.00
314515	311799	100.00
314516	311833	100.00
314517	311835	100.00
314518	311836	100.00
314519	311838	100.00
314520	311839	100.00
314521	311840	100.00
314522	311841	100.00
314523	311842	100.00
314530	311866	100.00
314531	311806	100.00
314532	311868	100.00
314533	311869	100.00
314534	311871	100.00
314535	311872	100.00
314536	311873	100.00
314537	311874	100.00
314538	311875	100.00
314545	313330	100.00
314546	313331	100.00
314547	313333	100.00
314601	316214	100.00
314602	316184	100.00
314603	316216	100.00
314604	316217	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
302899
302900
302901
302902
302903
302985
302986
302987
302988
302989
302990
302991
302992
302993
302994
302995
302996
302997
302998
308161
308162
308163
308164
308165
308166
308167
308168
308169
308170
314716
314717
314718
314719
314720
314721
314722
314723
314724
314725
314726
314727
314728
314729
314730
314731
314732
314733
314734
314741
314742
314743
314744
314745
314746
314747
314748
314749
314750
314751
314752
314753
314754
314755
314756
314812
314813
314814
314815
314816
322695
322696
322697
328263
328264
334543
334544
334545
334546
334547
334548
334549
334550
334551
334552
341861
341862
341863
341864
341865
341866
341867
341868
341869
341870
348898
348899
348900
348901
348902
348903
348904
348905
348906
348907
348908
348909
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
303182	2	302985	909
303183	2	302986	909
303184	2	302987	909
303185	2	302988	909
303186	2	302989	909
303187	2	302990	909
303188	2	302991	909
303189	2	302992	909
303190	2	302993	909
303191	2	302994	909
303192	2	302995	909
303193	2	302996	909
303194	2	302997	909
303195	2	302998	909
308868	0	308167	909
308869	0	302903	909
308870	0	302901	909
308871	0	302902	909
308872	0	308168	909
308873	0	302900	909
308874	0	302899	909
308875	0	308166	909
308876	0	308170	909
308863	1	308161	909
308864	1	308162	909
308865	1	308163	909
308866	1	308164	909
308867	1	308165	909
308877	0	308169	909
314918	0	314729	909
314919	0	314721	909
314920	0	314725	909
314921	0	314716	909
314922	0	314726	909
314923	0	314728	909
314924	0	314717	909
314925	0	314718	909
314926	0	314722	909
314927	0	314720	909
314928	0	314719	909
314929	0	314724	909
314930	0	314727	909
314931	0	314723	909
314932	0	314742	909
314933	0	314750	909
314934	0	314746	909
314935	0	314731	909
314936	0	314733	909
314937	0	314752	909
314938	0	314743	909
314939	0	314745	909
314940	0	314748	909
314941	0	314732	909
314942	0	314744	909
314943	0	314747	909
314944	0	314753	909
314945	0	314756	909
314946	0	314755	909
314947	0	314741	909
314948	0	314751	909
314949	0	314734	909
314950	0	314730	909
314951	0	314749	909
314952	0	314754	909
315008	5	314812	909
315009	5	314813	909
315010	5	314814	909
315011	5	314815	909
315012	5	314816	909
315013	5	322695	909
315014	5	322696	909
315015	5	322697	909
328762	4	328263	909
328763	4	328264	909
342360	2	341861	909
342361	2	341862	909
342362	2	341863	909
342363	2	341864	909
342364	2	341865	909
342365	2	341866	909
342366	2	341867	909
342367	2	341868	909
342368	2	341869	909
342369	2	341870	909
334941	3	334543	909
334942	3	334544	909
334943	3	334545	909
334944	3	334546	909
334945	3	334547	909
334946	3	334548	909
334947	3	334549	909
334948	3	334550	909
334949	3	334551	909
334950	3	334552	909
349498	1	348898	909
349499	1	348899	909
349500	1	348900	909
349501	1	348901	909
349502	1	348902	909
349503	1	348903	909
349504	1	348904	909
349505	1	348905	909
349506	1	348906	909
349507	1	348907	909
349508	1	348908	909
349509	0	348909	909
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
3527
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
1414	1	5a97a149-4210-40e1-8231-9884a8917163	9.00	2009-01-01	2009-12-31	1212	1313
1415	1	b8b87f1f-decf-4b4f-877d-8e7453c512d7	10.00	2010-01-01	\N	1212	1313
1416	1	a3f684d6-fab0-4216-b80a-8c54ce77f431	15.00	2010-01-12	\N	1213	1313
1417	1	a3f32c1c-9101-4be1-a88e-fe49acea18bd	14.00	2009-01-01	2009-12-31	1213	1313
1420	1	cb5465c4-2a83-4e35-9b93-81c2cadd5aef	15.00	2010-01-01	\N	1212	1314
1421	1	ece08593-a215-466c-a29e-c8e1bdfcacfb	20.00	2010-01-01	\N	1213	1314
1418	2	ce075cec-5a1d-48b3-917c-3a4db46063ec	19.00	2009-01-01	2009-12-31	1213	1314
1419	2	ca604069-fc0c-469b-b3bb-2b4b0dfb73da	14.00	2009-01-01	2009-12-31	1212	1314
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
317028	13	PREFIX-00038-00048-00001	WORKER	150	1.00	f	317718	\N
127811	1	73da2d5f-0cff-4754-a4a9-fa68d8925554	WORKER	160	1.00	f	\N	127637
127812	1	f1e9cc35-c732-46a9-9cb3-a273024179c1	WORKER	160	1.00	f	\N	127638
127813	1	580238d4-4cec-40a5-bd28-49eb90366dfc	WORKER	120	1.00	f	\N	127639
127814	1	cd35c4e2-02fe-4df6-a647-14f2f881e2d0	WORKER	200	1.00	f	\N	127640
127815	1	c3ed344b-67d3-4d48-b84b-2debeac96ded	WORKER	120	1.00	f	\N	127642
127816	1	49f3b274-7e6e-4528-8b07-e72109f63436	WORKER	80	1.00	f	\N	127643
127817	1	bdf87375-9d45-4116-bdc4-06143b8fe991	WORKER	80	1.00	f	\N	127644
301090	1	2d48325e-1ae4-4f80-9e45-7d91b3b62aea	WORKER	150	1.00	f	\N	301286
127821	1	76c7162e-4df5-45f0-90d5-c45c83df421b	WORKER	80	1.00	f	\N	127649
127822	1	17f6b080-a64e-4546-a289-9e387cdde8a4	WORKER	200	1.00	f	\N	127650
127823	1	a9083d0b-a931-475a-aa0f-2c96b021eb41	WORKER	160	1.00	f	\N	127651
127824	1	305029f7-8092-4e3e-bc3f-cc1a4f421857	WORKER	160	1.00	f	\N	127652
127825	1	b4948fd7-7d50-4d98-a87e-9aa4fc54d1ac	WORKER	200	1.00	f	\N	127653
127826	1	1bb6eb67-1763-4e34-9b01-60a7c6837f2c	WORKER	200	1.00	f	\N	127654
127827	1	bb6356d4-0d52-425e-a0be-2f9ed70c5615	WORKER	200	1.00	f	\N	127655
127828	1	bd2f2719-fbbf-454f-a864-d8bbfa9ac335	WORKER	160	1.00	f	\N	127656
127829	1	88e2d257-a63a-49a0-9975-42ee432c872d	WORKER	200	1.00	f	\N	127657
127830	1	85af047d-89f1-432c-bbd7-524358ea5e78	WORKER	160	1.00	f	\N	127658
317032	1	38876123-4362-4fa3-b421-450a10d9dd53	WORKER	150	1.00	f	\N	312315
127818	1	39d40d10-d438-46d2-886d-45cd57cb0c15	WORKER	80	1.00	f	\N	127645
127819	1	e918a81d-827d-485f-81b9-a9ac1109f536	WORKER	80	1.00	f	\N	127646
127820	1	7dcb1e41-0d3f-4326-9106-ae775e6b620c	WORKER	80	1.00	f	\N	127647
301100	1	107a2afa-59ae-4fd9-84fa-6e5e8cc09834	WORKER	150	1.00	f	\N	301290
301808	12	PREFIX-00036-00015-00001	MACHINE	120	1.00	f	301605	\N
301798	1	c89d289a-6338-47fe-a1b4-53fda92e67f3	MACHINE	120	1.00	f	\N	301993
301809	12	PREFIX-00036-00016-00001	MACHINE	120	1.00	f	301606	\N
301810	12	PREFIX-00036-00017-00001	MACHINE	120	1.00	f	301607	\N
301841	10	PREFIX-00036-00019-00001	WORKER	150	1.00	f	301648	\N
301842	10	PREFIX-00036-00020-00001	WORKER	150	1.00	f	301649	\N
312106	1	072c79cf-2f49-447f-9cb5-af990f717936	MACHINE	150	1.00	f	\N	312295
312110	1	cff337fd-df8c-4ffb-9b7a-c027aeaeb4e3	MACHINE	150	1.00	f	\N	312299
301843	10	PREFIX-00036-00022-00001	WORKER	150	1.00	f	301651	\N
301844	10	PREFIX-00036-00023-00001	WORKER	150	1.00	f	301652	\N
301845	10	PREFIX-00036-00025-00001	WORKER	150	1.00	f	301654	\N
312135	12	PREFIX-00037-00012-00001	MACHINE	150	1.00	f	311840	\N
301846	10	PREFIX-00036-00026-00001	WORKER	150	1.00	f	301655	\N
301847	10	PREFIX-00036-00027-00001	WORKER	150	1.00	f	301656	\N
301848	10	PREFIX-00036-00028-00001	WORKER	150	1.00	f	301657	\N
301849	10	PREFIX-00036-00029-00001	WORKER	150	1.00	f	301658	\N
301850	10	PREFIX-00036-00030-00001	WORKER	150	1.00	f	301659	\N
301870	7	PREFIX-00036-00033-00001	MACHINE	150	1.00	f	301678	\N
301857	8	PREFIX-00036-00031-00001	MACHINE	150	1.00	f	301666	\N
301871	7	PREFIX-00036-00034-00001	MACHINE	150	1.00	f	301679	\N
301872	7	PREFIX-00036-00035-00001	MACHINE	150	1.00	f	301680	\N
301861	1	738d4a38-88cd-4570-8891-88c24aced2e2	MACHINE	150	1.00	f	\N	301997
312136	12	PREFIX-00037-00013-00001	MACHINE	150	1.00	f	311841	\N
301873	7	PREFIX-00036-00036-00001	MACHINE	150	1.00	f	301681	\N
301107	16	PREFIX-00036-00004-00001	WORKER	150	1.00	f	300806	\N
301086	18	PREFIX-00036-00001-00001	WORKER	150	1.00	f	300790	\N
301108	16	PREFIX-00036-00005-00001	WORKER	150	1.00	f	300807	\N
301109	16	PREFIX-00036-00006-00001	WORKER	150	1.00	f	300808	\N
312137	12	PREFIX-00037-00014-00001	MACHINE	150	1.00	f	311842	\N
312154	11	PREFIX-00037-00016-00001	MACHINE	150	1.00	f	311866	\N
312102	13	PREFIX-00037-00002-00001	MACHINE	150	1.00	f	311806	\N
312155	11	PREFIX-00037-00018-00001	MACHINE	150	1.00	f	311868	\N
301122	15	PREFIX-00036-00008-00001	WORKER	150	1.00	f	300825	\N
301096	17	PREFIX-00036-00002-00001	WORKER	150	1.00	f	300796	\N
301123	15	PREFIX-00036-00009-00001	WORKER	150	1.00	f	300826	\N
301124	15	PREFIX-00036-00010-00001	WORKER	150	1.00	f	300827	\N
301125	15	PREFIX-00036-00011-00001	WORKER	150	1.00	f	300828	\N
301807	12	PREFIX-00036-00014-00001	MACHINE	120	1.00	f	301604	\N
301794	13	PREFIX-00036-00012-00001	MACHINE	120	1.00	f	301592	\N
318669	12	PREFIX-00038-00053-00001	WORKER	150	1.00	f	318963	\N
312129	12	PREFIX-00037-00004-00001	MACHINE	150	1.00	f	311832	\N
312095	14	PREFIX-00037-00001-00001	MACHINE	150	1.00	f	311799	\N
312130	12	PREFIX-00037-00005-00001	MACHINE	150	1.00	f	311833	\N
312131	12	PREFIX-00037-00007-00001	MACHINE	150	1.00	f	311835	\N
318670	12	PREFIX-00038-00055-00001	WORKER	150	1.00	f	318965	\N
312132	12	PREFIX-00037-00008-00001	MACHINE	150	1.00	f	311836	\N
318671	12	PREFIX-00038-00056-00001	WORKER	150	1.00	f	318966	\N
318672	12	PREFIX-00038-00057-00001	WORKER	150	1.00	f	318967	\N
318673	12	PREFIX-00038-00059-00001	WORKER	150	1.00	f	318969	\N
318674	12	PREFIX-00038-00061-00001	WORKER	150	1.00	f	318971	\N
318675	12	PREFIX-00038-00062-00001	WORKER	150	1.00	f	318972	\N
318667	12	PREFIX-00038-00050-00001	WORKER	150	1.00	f	318960	\N
318668	12	PREFIX-00038-00052-00001	WORKER	150	1.00	f	318962	\N
312133	12	PREFIX-00037-00010-00001	MACHINE	150	1.00	f	311838	\N
312134	12	PREFIX-00037-00011-00001	MACHINE	150	1.00	f	311839	\N
313747	9	PREFIX-00037-00040-00001	MACHINE	150	1.00	f	313382	\N
313748	9	PREFIX-00037-00041-00001	MACHINE	150	1.00	f	313383	\N
313749	9	PREFIX-00037-00043-00001	MACHINE	150	1.00	f	313385	\N
313750	9	PREFIX-00037-00044-00001	MACHINE	150	1.00	f	313386	\N
313751	9	PREFIX-00037-00046-00001	MACHINE	150	1.00	f	313388	\N
313752	9	PREFIX-00037-00047-00001	MACHINE	150	1.00	f	313389	\N
313753	9	PREFIX-00037-00048-00001	MACHINE	150	1.00	f	313390	\N
313754	9	PREFIX-00037-00049-00001	MACHINE	150	1.00	f	313391	\N
313755	9	PREFIX-00037-00050-00001	MACHINE	150	1.00	f	313392	\N
313756	9	PREFIX-00037-00051-00001	MACHINE	150	1.00	f	313393	\N
316958	17	PREFIX-00038-00021-00001	WORKER	150	1.00	f	316217	\N
316959	17	PREFIX-00038-00023-00001	WORKER	150	1.00	f	316219	\N
316960	17	PREFIX-00038-00024-00001	WORKER	150	1.00	f	316220	\N
316961	17	PREFIX-00038-00026-00001	WORKER	150	1.00	f	316222	\N
318684	11	PREFIX-00038-00063-00001	WORKER	150	1.00	f	318981	\N
313785	20	PREFIX-00038-00003-00001	WORKER	150	1.00	f	316163	\N
313762	21	PREFIX-00038-00001-00001	WORKER	150	1.00	f	316133	\N
313786	20	PREFIX-00038-00005-00001	WORKER	150	1.00	f	316165	\N
313787	20	PREFIX-00038-00006-00001	WORKER	150	1.00	f	316166	\N
313788	20	PREFIX-00038-00008-00001	WORKER	150	1.00	f	316168	\N
312156	11	PREFIX-00037-00019-00001	MACHINE	150	1.00	f	311869	\N
312157	11	PREFIX-00037-00021-00001	MACHINE	150	1.00	f	311871	\N
312158	11	PREFIX-00037-00022-00001	MACHINE	150	1.00	f	311872	\N
312159	11	PREFIX-00037-00023-00001	MACHINE	150	1.00	f	311873	\N
312160	11	PREFIX-00037-00024-00001	MACHINE	150	1.00	f	311874	\N
312161	11	PREFIX-00037-00025-00001	MACHINE	150	1.00	f	311875	\N
313707	10	PREFIX-00037-00027-00001	MACHINE	120	1.00	f	313330	\N
313708	10	PREFIX-00037-00028-00001	MACHINE	120	1.00	f	313331	\N
313709	10	PREFIX-00037-00030-00001	MACHINE	120	1.00	f	313333	\N
313710	10	PREFIX-00037-00031-00001	MACHINE	120	1.00	f	313334	\N
313789	20	PREFIX-00038-00009-00001	WORKER	150	1.00	f	316169	\N
313766	1	a5d82687-9a1c-4e11-9313-933d9985bf5c	WORKER	150	1.00	f	\N	312303
313806	1	d0422151-1b8b-4894-9253-3643f7584d89	WORKER	150	1.00	f	\N	312307
313790	20	PREFIX-00038-00011-00001	WORKER	150	1.00	f	316171	\N
313711	10	PREFIX-00037-00033-00001	MACHINE	120	1.00	f	313336	\N
313712	10	PREFIX-00037-00034-00001	MACHINE	120	1.00	f	313337	\N
313713	10	PREFIX-00037-00035-00001	MACHINE	120	1.00	f	313338	\N
313714	10	PREFIX-00037-00036-00001	MACHINE	120	1.00	f	313339	\N
313715	10	PREFIX-00037-00037-00001	MACHINE	120	1.00	f	313340	\N
313716	10	PREFIX-00037-00038-00001	MACHINE	120	1.00	f	313341	\N
313791	20	PREFIX-00038-00012-00001	WORKER	150	1.00	f	316172	\N
313792	20	PREFIX-00038-00014-00001	WORKER	150	1.00	f	316174	\N
313793	20	PREFIX-00038-00015-00001	WORKER	150	1.00	f	316175	\N
316956	17	PREFIX-00038-00018-00001	WORKER	150	1.00	f	316214	\N
313802	18	PREFIX-00038-00016-00001	WORKER	150	1.00	f	316184	\N
316957	17	PREFIX-00038-00020-00001	WORKER	150	1.00	f	316216	\N
316992	1	f602f7a5-bbec-45bd-97d3-947c6b2ccc58	WORKER	150	1.00	f	\N	312311
316962	17	PREFIX-00038-00027-00001	WORKER	150	1.00	f	316223	\N
316963	17	PREFIX-00038-00029-00001	WORKER	150	1.00	f	316225	\N
316964	17	PREFIX-00038-00030-00001	WORKER	150	1.00	f	316226	\N
316987	16	PREFIX-00038-00031-00001	WORKER	150	1.00	f	317663	\N
316988	16	PREFIX-00038-00032-00001	WORKER	150	1.00	f	317664	\N
317011	15	PREFIX-00038-00035-00001	WORKER	150	1.00	f	317697	\N
317012	15	PREFIX-00038-00036-00001	WORKER	150	1.00	f	317698	\N
317013	15	PREFIX-00038-00038-00001	WORKER	150	1.00	f	317700	\N
317014	15	PREFIX-00038-00039-00001	WORKER	150	1.00	f	317701	\N
317015	15	PREFIX-00038-00041-00001	WORKER	150	1.00	f	317703	\N
317016	15	PREFIX-00038-00043-00001	WORKER	150	1.00	f	317705	\N
317017	15	PREFIX-00038-00044-00001	WORKER	150	1.00	f	317706	\N
317018	15	PREFIX-00038-00046-00001	WORKER	150	1.00	f	317708	\N
317019	15	PREFIX-00038-00047-00001	WORKER	150	1.00	f	317709	\N
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
606	8	0
606	8	1
606	8	2
606	8	3
606	8	4
606	0	5
606	0	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
314525	311837
314524	311837
314526	311834
314527	311834
314529	311831
314528	311831
314540	311870
314539	311870
314541	311867
314542	311867
314543	311865
314544	311865
314555	313335
314556	313335
314558	313332
314557	313332
314560	313329
314559	313329
314577	311798
314578	311798
314572	313387
314571	313387
314573	313384
314574	313384
314576	313381
314575	313381
302709	300824
302708	300824
302716	301603
302715	301603
302725	301653
302724	301653
302727	301650
302726	301650
302731	301647
302732	301647
302739	301677
302738	301677
302741	300789
302740	300789
302701	300805
302702	300805
314596	316164
314597	316162
314598	316162
314612	316224
314611	316224
314614	316221
314613	316221
317545	316218
317544	316218
317547	316215
317546	316215
317548	316213
317549	316213
317561	317707
317562	317707
317564	317704
317563	317704
317566	317702
317565	317702
317567	317699
317568	317699
317569	317696
317570	317696
317571	317695
317572	317695
317584	318970
317583	318970
317586	318968
317585	318968
317587	318964
317588	318964
317589	318961
317590	318961
317591	318959
317592	318959
314599	316132
314600	316132
314590	316173
314589	316173
314592	316170
314591	316170
314593	316167
314594	316167
314595	316164
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
300374	5	299971
300375	3	299973
300376	3	299975
300377	3	299977
300378	3	299979
300379	3	299981
300380	3	299983
300381	3	299985
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
314857	2	314756	300377	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765865671	2010-03-25	8	2010-04-15	8
314856	2	314755	300376	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765838346	2010-03-25	8	2010-04-15	8
314842	2	314741	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766007056	2010-01-27	6	2010-02-23	4
314852	2	314751	300376	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765688286	2010-02-11	8	2010-03-04	8
303006	1	308167	300377	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280753222605	2010-08-02	0	2010-08-20	8
303004	4	302903	300374	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280752413870	2010-09-22	4	2010-10-19	2
303002	4	302901	300374	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280752319923	2010-08-26	6	2010-09-22	4
303003	4	302902	300375	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280752360416	2010-08-26	6	2010-09-22	4
303007	1	308168	300376	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280753254847	2010-08-20	8	2010-09-10	8
303001	4	302900	300375	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280752286162	2010-08-02	0	2010-08-26	6
303000	4	302899	300374	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280752186548	2010-08-02	0	2010-08-26	6
303005	1	308166	300376	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280753198681	2010-08-02	0	2010-08-20	8
303009	1	308170	300376	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280753296329	2010-09-10	8	2010-10-01	8
303008	1	308169	300377	2010-08-02 13:13:34.554	2010-08-02 13:13:34.554	1280753274844	2010-08-20	8	2010-09-10	8
314830	4	314729	300381	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765213895	2010-01-27	6	2010-02-23	4
314822	5	314721	300378	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764983208	2010-02-23	4	2010-03-22	2
314817	5	314716	300378	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764670923	2010-01-01	0	2010-01-27	6
314827	4	314726	300380	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765146529	2010-01-01	0	2010-01-27	6
314829	4	314728	300380	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765189691	2010-01-27	6	2010-02-23	4
314818	5	314717	300379	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764694257	2010-01-01	0	2010-01-27	6
314819	5	314718	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764741515	2010-01-01	0	2010-01-27	6
314823	5	314722	300379	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765004948	2010-02-23	4	2010-03-22	2
314821	5	314720	300379	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764946170	2010-01-27	6	2010-02-23	4
314820	5	314719	300378	2010-01-01 00:00:00	2010-01-01 00:00:00	1280764858499	2010-01-27	6	2010-02-23	4
314828	4	314727	300381	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765166060	2010-01-01	0	2010-01-27	6
314824	5	314723	300378	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765022299	2010-03-22	2	2010-04-15	8
314843	2	314742	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766051014	2010-02-23	4	2010-03-22	2
314851	2	314750	300377	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765645768	2010-01-21	8	2010-02-11	8
314847	2	314746	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766165230	2010-05-12	6	2010-06-08	4
314832	4	314731	300381	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765285311	2010-02-23	4	2010-03-22	2
314834	4	314733	300380	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765445471	2010-03-22	2	2010-04-15	8
314853	2	314752	300376	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765709486	2010-03-04	8	2010-03-25	8
314838	2	314737	300375	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765907943	2010-01-27	6	2010-02-23	4
314835	4	314734	300380	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765464663	2010-04-15	8	2010-05-12	6
314831	4	314730	300380	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765243639	2010-02-23	4	2010-03-22	2
314850	2	314749	300376	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765583958	2010-01-21	8	2010-02-11	8
314855	2	314754	300377	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765802526	2010-03-04	8	2010-03-25	8
314839	2	314738	300375	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765937505	2010-01-01	0	2010-01-27	6
314841	2	314740	300375	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765983533	2010-03-22	2	2010-04-15	8
314844	2	314743	300375	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766071183	2010-04-15	8	2010-05-12	6
314840	2	314739	300375	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765959722	2010-02-23	4	2010-03-22	2
314846	2	314745	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766144667	2010-04-15	8	2010-05-12	6
314849	2	314748	300377	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765553504	2010-01-01	0	2010-01-21	8
314833	4	314732	300381	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765333707	2010-03-22	2	2010-04-15	8
314845	2	314744	300374	2010-01-01 00:00:00	2010-01-01 00:00:00	1280766093015	2010-03-22	2	2010-04-15	8
314848	2	314747	300376	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765532489	2010-01-01	0	2010-01-21	8
314854	2	314753	300377	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765751748	2010-02-11	8	2010-03-04	8
314826	5	314725	300378	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765073887	2010-04-15	8	2010-05-12	6
314825	5	314724	300379	2010-01-01 00:00:00	2010-01-01 00:00:00	1280765042790	2010-03-22	2	2010-04-15	8
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
299971	Máquina limitante 1	Máquina limitante 1
299973	Máquina limitante 2	Máquina limitante 2
299975	Máquina limitante 3	Máquina limitante 3
299977	Máquina limitante 4	Máquina limitante 4
299979	Máquina limitante 5	Máquina limitante 5
299981	Máquina limitante 6	Máquina limitante 6
299983	Máquina limitante 7	Máquina limitante 7
299985	Máquina limitante 8	Máquina limitante 8
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
202	1	0ac1e6a6-02ee-4e51-9f7d-b90c64b49f04	Imported materials without category	f	\N
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
300789	\N	\N	t	36	0.00	0.00	4200	\N	\N	0	\N	505
311798	\N	\N	t	51	0.00	0.00	5550	\N	\N	0	\N	505
316132	\N	\N	t	63	0.00	0.00	6300	\N	\N	0	\N	505
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer) FROM stdin;
317718	14	tarea de pintor pontevedrés (copy)	\N	PREFIX-00038-00048	\N	\N	0.00	f	318959	\N	\N	1
316170	21	tarea de soldador coruñés	\N	PREFIX-00038-00010	\N	\N	0.00	f	316167	\N	\N	2
316171	21	tarea de soldador coruñés	\N	PREFIX-00038-00011	\N	\N	0.00	f	316170	312303	\N	0
316172	21	tarea de soldador coruñés (copy)	\N	PREFIX-00038-00012	\N	\N	0.00	f	316170	312303	\N	1
316173	21	tarea de soldador coruñés	\N	PREFIX-00038-00013	\N	\N	0.00	f	316170	\N	\N	2
316174	21	tarea de soldador coruñés	\N	PREFIX-00038-00014	\N	\N	0.00	f	316173	312303	\N	0
316175	21	tarea de soldador coruñés (copy)	\N	PREFIX-00038-00015	\N	\N	0.00	f	316173	312303	\N	1
300805	17	4 tareas de decorador pontevedrés	\N	PREFIX-00036-00003	\N	\N	0.00	f	300789	\N	\N	0
300789	19	Pedido 3	\N	PREFIX-00036	2010-08-02 13:13:34.554	\N	0.00	f	\N	\N	\N	\N
311831	13	10 tareas máquina tipo 2, coruña	\N	PREFIX-00037-00003	\N	\N	0.00	f	311798	\N	\N	0
311832	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00004	\N	\N	0.00	f	311831	312295	\N	0
311833	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00005	\N	\N	0.00	f	311831	312295	\N	2
311834	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00006	\N	\N	0.00	f	311831	\N	\N	3
311835	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00007	\N	\N	0.00	f	311834	312295	\N	0
311836	13	tarea de máquina tipo 2, coruña (copy)	\N	PREFIX-00037-00008	\N	\N	0.00	f	311834	312295	\N	1
311837	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00009	\N	\N	0.00	f	311834	\N	\N	2
300824	16	5 tareas de decorador coruñés	\N	PREFIX-00036-00007	\N	\N	0.00	f	300789	\N	\N	1
300825	16	tarea de decorador coruñés	\N	PREFIX-00036-00008	\N	\N	0.00	f	300824	301290	\N	0
300796	18	tarea de decorador coruñés (copy)	\N	PREFIX-00036-00002	\N	\N	0.00	f	300824	\N	\N	1
300826	16	tarea de decorador coruñés	\N	PREFIX-00036-00009	\N	\N	0.00	f	300824	301290	\N	2
300827	16	tarea de decorador coruñés	\N	PREFIX-00036-00010	\N	\N	0.00	f	300824	301290	\N	3
300828	16	tarea de decorador coruñés	\N	PREFIX-00036-00011	\N	\N	0.00	f	300824	301290	\N	4
301603	13	5 tareas máquina tipo 1 pontevedra	\N	PREFIX-00036-00013	\N	\N	0.00	f	300789	\N	\N	2
301604	13	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00014	\N	\N	0.00	f	301603	301993	\N	0
301592	14	tarea máquina tipo 1 pontevedra (copy)	\N	PREFIX-00036-00012	\N	\N	0.00	f	301603	\N	\N	1
301605	13	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00015	\N	\N	0.00	f	301603	301993	\N	2
301606	13	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00016	\N	\N	0.00	f	301603	301993	\N	3
301607	13	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00017	\N	\N	0.00	f	301603	301993	\N	4
300806	17	tarea de decorador pontevedrés	\N	PREFIX-00036-00004	\N	\N	0.00	f	300805	301286	\N	0
300790	19	tarea de decorador pontevedrés (copy)	\N	PREFIX-00036-00001	\N	\N	0.00	f	300805	\N	\N	1
300807	17	tarea de decorador pontevedrés	\N	PREFIX-00036-00005	\N	\N	0.00	f	300805	301286	\N	2
300808	17	tarea de decorador pontevedrés	\N	PREFIX-00036-00006	\N	\N	0.00	f	300805	301286	\N	3
301647	11	10 tareas de decorador pontevedrés	\N	PREFIX-00036-00018	\N	\N	0.00	f	300789	\N	\N	3
301648	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00019	\N	\N	0.00	f	301647	301286	\N	0
301649	11	tarea de decorador pontevedrés (copy)	\N	PREFIX-00036-00020	\N	\N	0.00	f	301647	301286	\N	1
301650	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00021	\N	\N	0.00	f	301647	\N	\N	2
301651	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00022	\N	\N	0.00	f	301650	301286	\N	0
301652	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00023	\N	\N	0.00	f	301650	301286	\N	1
301653	11	tarea de decorador pontevedrés (copy)	\N	PREFIX-00036-00024	\N	\N	0.00	f	301650	\N	\N	2
301654	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00025	\N	\N	0.00	f	301653	301286	\N	0
301655	11	tarea de decorador pontevedrés (copy) (copy)	\N	PREFIX-00036-00026	\N	\N	0.00	f	301653	301286	\N	1
301656	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00027	\N	\N	0.00	f	301653	301286	\N	2
301657	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00028	\N	\N	0.00	f	301647	301286	\N	3
301658	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00029	\N	\N	0.00	f	301647	301286	\N	4
301659	11	tarea de decorador pontevedrés	\N	PREFIX-00036-00030	\N	\N	0.00	f	301647	301286	\N	5
301677	8	5 tareas máquina tipo 1 coruña	\N	PREFIX-00036-00032	\N	\N	0.00	f	300789	\N	\N	4
301678	8	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00033	\N	\N	0.00	f	301677	301997	\N	0
301666	9	tarea máquina tipo 1 coruña (copy)	\N	PREFIX-00036-00031	\N	\N	0.00	f	301677	\N	\N	1
301679	8	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00034	\N	\N	0.00	f	301677	301997	\N	2
301680	8	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00035	\N	\N	0.00	f	301677	301997	\N	3
301681	8	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00036	\N	\N	0.00	f	301677	301997	\N	4
311798	15	Pedido 4	\N	PREFIX-00037	2010-01-01 00:00:00	\N	0.00	f	\N	\N	\N	\N
311799	15	tarea de máquina tipo 2, coruña (copy)	\N	PREFIX-00037-00001	\N	\N	0.00	f	311831	\N	\N	1
311838	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00010	\N	\N	0.00	f	311837	312295	\N	0
311839	13	tarea de máquina tipo 2, coruña (copy)	\N	PREFIX-00037-00011	\N	\N	0.00	f	311837	312295	\N	1
311840	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00012	\N	\N	0.00	f	311837	312295	\N	2
311841	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00013	\N	\N	0.00	f	311837	312295	\N	3
311842	13	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00014	\N	\N	0.00	f	311837	312295	\N	4
311806	14	tarea de máquina tipo 2, pontevedra (copy)	\N	PREFIX-00037-00002	\N	\N	0.00	f	311865	\N	\N	1
316213	17	tarea de pintor coruñés	\N	PREFIX-00038-00017	\N	\N	0.00	f	316132	\N	\N	1
316214	17	tarea de pintor coruñés	\N	PREFIX-00038-00018	\N	\N	0.00	f	316213	312307	\N	0
316184	19	tarea de pintor coruñés (copy)	\N	PREFIX-00038-00016	\N	\N	0.00	f	316213	\N	\N	1
316215	17	tarea de pintor coruñés	\N	PREFIX-00038-00019	\N	\N	0.00	f	316213	\N	\N	2
316216	17	tarea de pintor coruñés	\N	PREFIX-00038-00020	\N	\N	0.00	f	316215	312307	\N	0
316217	17	tarea de pintor coruñés (copy)	\N	PREFIX-00038-00021	\N	\N	0.00	f	316215	312307	\N	1
316218	17	tarea de pintor coruñés	\N	PREFIX-00038-00022	\N	\N	0.00	f	316215	\N	\N	2
316219	17	tarea de pintor coruñés	\N	PREFIX-00038-00023	\N	\N	0.00	f	316218	312307	\N	0
316220	17	tarea de pintor coruñés (copy)	\N	PREFIX-00038-00024	\N	\N	0.00	f	316218	312307	\N	1
316221	17	tarea de pintor coruñés	\N	PREFIX-00038-00025	\N	\N	0.00	f	316218	\N	\N	2
316222	17	tarea de pintor coruñés	\N	PREFIX-00038-00026	\N	\N	0.00	f	316221	312307	\N	0
316223	17	tarea de pintor coruñés (copy)	\N	PREFIX-00038-00027	\N	\N	0.00	f	316221	312307	\N	1
316224	17	tarea de pintor coruñés	\N	PREFIX-00038-00028	\N	\N	0.00	f	316221	\N	\N	2
316225	17	tarea de pintor coruñés	\N	PREFIX-00038-00029	\N	\N	0.00	f	316224	312307	\N	0
316226	17	tarea de pintor coruñés (copy)	\N	PREFIX-00038-00030	\N	\N	0.00	f	316224	312307	\N	1
318968	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00058	\N	\N	0.00	f	318964	\N	\N	3
318969	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00059	\N	\N	0.00	f	318968	312315	\N	0
318970	12	tarea de pintor pontevedrés (copy)	\N	PREFIX-00038-00060	\N	\N	0.00	f	318968	\N	\N	1
318971	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00061	\N	\N	0.00	f	318970	312315	\N	0
318972	12	tarea de pintor pontevedrés (copy) (copy)	\N	PREFIX-00038-00062	\N	\N	0.00	f	318970	312315	\N	1
311865	12	10 tareas máquina tipo 2, pontevedra	\N	PREFIX-00037-00015	\N	\N	0.00	f	311798	\N	\N	1
311866	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00016	\N	\N	0.00	f	311865	312299	\N	0
311867	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00017	\N	\N	0.00	f	311865	\N	\N	2
311868	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00018	\N	\N	0.00	f	311867	312299	\N	0
311869	12	tarea máquina tipo 2 pontevedra (copy)	\N	PREFIX-00037-00019	\N	\N	0.00	f	311867	312299	\N	1
311870	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00020	\N	\N	0.00	f	311867	\N	\N	2
311871	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00021	\N	\N	0.00	f	311870	312299	\N	0
311872	12	tarea máquina tipo 2 pontevedra (copy)	\N	PREFIX-00037-00022	\N	\N	0.00	f	311870	312299	\N	1
311873	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00023	\N	\N	0.00	f	311870	312299	\N	2
311874	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00024	\N	\N	0.00	f	311870	312299	\N	3
311875	12	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00025	\N	\N	0.00	f	311870	312299	\N	4
313329	11	10 tareas máquina tipo 1 pontevedra	\N	PREFIX-00037-00026	\N	\N	0.00	f	311798	\N	\N	2
317663	17	tarea de capataz coruñés	\N	PREFIX-00038-00031	\N	\N	0.00	f	316132	\N	\N	2
317664	17	tarea de soldador pontevedrés	\N	PREFIX-00038-00032	\N	\N	0.00	f	317695	\N	\N	0
318959	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00049	\N	\N	0.00	f	316132	\N	\N	4
318960	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00050	\N	\N	0.00	f	318959	312315	\N	0
318961	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00051	\N	\N	0.00	f	318959	\N	\N	2
318962	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00052	\N	\N	0.00	f	318961	312315	\N	0
318963	12	tarea de pintor pontevedrés (copy)	\N	PREFIX-00038-00053	\N	\N	0.00	f	318961	312315	\N	1
318964	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00054	\N	\N	0.00	f	318961	\N	\N	2
318965	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00055	\N	\N	0.00	f	318964	312315	\N	0
318966	12	tarea de pintor pontevedrés (copy)	\N	PREFIX-00038-00056	\N	\N	0.00	f	318964	312315	\N	1
318967	12	tarea de pintor pontevedrés	\N	PREFIX-00038-00057	\N	\N	0.00	f	318964	312315	\N	2
313330	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00027	\N	\N	0.00	f	313329	301993	\N	0
313331	11	tarea máquina tipo 1 pontevedra (copy)	\N	PREFIX-00037-00028	\N	\N	0.00	f	313329	301993	\N	1
313332	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00029	\N	\N	0.00	f	313329	\N	\N	2
313333	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00030	\N	\N	0.00	f	313332	301993	\N	0
313334	11	tarea máquina tipo 1 pontevedra (copy)	\N	PREFIX-00037-00031	\N	\N	0.00	f	313332	301993	\N	1
313335	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00032	\N	\N	0.00	f	313332	\N	\N	2
313336	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00033	\N	\N	0.00	f	313335	301993	\N	0
313337	11	tarea máquina tipo 1 pontevedra (copy)	\N	PREFIX-00037-00034	\N	\N	0.00	f	313335	301993	\N	1
313338	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00035	\N	\N	0.00	f	313335	301993	\N	2
313339	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00036	\N	\N	0.00	f	313335	301993	\N	3
313340	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00037	\N	\N	0.00	f	313335	301993	\N	4
313341	11	tarea máquina tipo 1 pontevedra	\N	PREFIX-00037-00038	\N	\N	0.00	f	313335	301993	\N	5
316132	26	Pedido 2	\N	PREFIX-00038	2010-01-01 00:00:00	\N	0.00	f	\N	\N	\N	\N
317695	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00033	\N	\N	0.00	f	316132	\N	\N	3
316133	22	tarea de soldador coruñés (copy)	\N	PREFIX-00038-00001	\N	\N	0.00	f	316162	\N	\N	1
316162	21	tarea de soldador coruñés	\N	PREFIX-00038-00002	\N	\N	0.00	f	316132	\N	\N	0
317696	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00034	\N	\N	0.00	f	317695	\N	\N	1
313381	10	10 tareas máquina tipo 1 coruña	\N	PREFIX-00037-00039	\N	\N	0.00	f	311798	\N	\N	3
313382	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00040	\N	\N	0.00	f	313381	301997	\N	0
317697	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00035	\N	\N	0.00	f	317696	312311	\N	0
317698	15	tarea de soldador pontevedrés (copy)	\N	PREFIX-00038-00036	\N	\N	0.00	f	317696	312311	\N	1
317699	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00037	\N	\N	0.00	f	317696	\N	\N	2
317700	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00038	\N	\N	0.00	f	317699	312311	\N	0
317701	15	tarea de soldador pontevedrés (copy)	\N	PREFIX-00038-00039	\N	\N	0.00	f	317699	312311	\N	1
317702	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00040	\N	\N	0.00	f	317699	\N	\N	2
317703	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00041	\N	\N	0.00	f	317702	312311	\N	0
317704	15	tarea de soldador pontevedrés (copy)	\N	PREFIX-00038-00042	\N	\N	0.00	f	317702	\N	\N	1
317705	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00043	\N	\N	0.00	f	317704	312311	\N	0
317706	15	tarea de soldador pontevedrés (copy) (copy)	\N	PREFIX-00038-00044	\N	\N	0.00	f	317704	312311	\N	1
317707	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00045	\N	\N	0.00	f	317704	\N	\N	2
313383	10	tarea máquina tipo 1 coruña (copy)	\N	PREFIX-00037-00041	\N	\N	0.00	f	313381	301997	\N	1
313384	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00042	\N	\N	0.00	f	313381	\N	\N	2
313385	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00043	\N	\N	0.00	f	313384	301997	\N	0
313386	10	tarea máquina tipo 1 coruña (copy)	\N	PREFIX-00037-00044	\N	\N	0.00	f	313384	301997	\N	1
313387	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00045	\N	\N	0.00	f	313384	\N	\N	2
313388	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00046	\N	\N	0.00	f	313387	301997	\N	0
313389	10	tarea máquina tipo 1 coruña (copy)	\N	PREFIX-00037-00047	\N	\N	0.00	f	313387	301997	\N	1
313390	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00048	\N	\N	0.00	f	313387	301997	\N	2
313391	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00049	\N	\N	0.00	f	313387	301997	\N	3
313392	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00050	\N	\N	0.00	f	313387	301997	\N	4
313393	10	tarea máquina tipo 1 coruña	\N	PREFIX-00037-00051	\N	\N	0.00	f	313387	301997	\N	5
317708	15	tarea de soldador pontevedrés	\N	PREFIX-00038-00046	\N	\N	0.00	f	317707	312311	\N	0
317709	15	tarea de soldador pontevedrés (copy)	\N	PREFIX-00038-00047	\N	\N	0.00	f	317707	312311	\N	1
318981	11	tarea de capataz pontevedrés	\N	PREFIX-00038-00063	\N	\N	0.00	f	316132	\N	\N	5
316163	21	tarea de soldador coruñés	\N	PREFIX-00038-00003	\N	\N	0.00	f	316162	312303	\N	0
316164	21	tarea de soldador coruñés	\N	PREFIX-00038-00004	\N	\N	0.00	f	316162	\N	\N	2
316165	21	tarea de soldador coruñés	\N	PREFIX-00038-00005	\N	\N	0.00	f	316164	312303	\N	0
316166	21	tarea de soldador coruñés (copy)	\N	PREFIX-00038-00006	\N	\N	0.00	f	316164	312303	\N	1
316167	21	tarea de soldador coruñés	\N	PREFIX-00038-00007	\N	\N	0.00	f	316164	\N	\N	2
316168	21	tarea de soldador coruñés	\N	PREFIX-00038-00008	\N	\N	0.00	f	316167	312303	\N	0
316169	21	tarea de soldador coruñés (copy)	\N	PREFIX-00038-00009	\N	\N	0.00	f	316167	312303	\N	1
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
127635	1	elemento con múltiples hijos	\N	PREFIX-00002-00060	\N	\N	3	\N	\N
301286	1	tarea de decorador pontevedrés	\N	PREFIX-00036-00001	\N	\N	4	\N	\N
301290	1	tarea de decorador coruñés	\N	PREFIX-00036-00002	\N	\N	4	\N	\N
127636	1	elemento 52	\N	PREFIX-00002-00061	\N	\N	3	127635	0
127639	1	elemento 51 (copy)	\N	PREFIX-00002-00064	\N	\N	0	127635	1
127640	1	elemento 54	\N	PREFIX-00002-00065	\N	\N	0	127635	2
127641	1	elemento 55	\N	PREFIX-00002-00066	\N	\N	3	127635	3
127645	1	elemento 58	\N	PREFIX-00002-00070	\N	\N	0	127635	4
127646	1	elemento 59	\N	PREFIX-00002-00071	\N	\N	0	127635	5
127647	1	elemento 60	\N	PREFIX-00002-00072	\N	\N	0	127635	6
127648	1	elemento 61	\N	PREFIX-00002-00073	\N	\N	3	127635	7
127637	1	elemento 52 (copy)	\N	PREFIX-00002-00062	\N	\N	0	127636	0
127638	1	elemento 53	\N	PREFIX-00002-00063	\N	\N	0	127636	1
127642	1	elemento 55 (copy)	\N	PREFIX-00002-00067	\N	\N	0	127641	0
127643	1	elemento 56	\N	PREFIX-00002-00068	\N	\N	0	127641	1
127644	1	elemento 57	\N	PREFIX-00002-00069	\N	\N	0	127641	2
127649	1	elemento 61 (copy)	\N	PREFIX-00002-00074	\N	\N	0	127648	0
127650	1	elemento 62	\N	PREFIX-00002-00075	\N	\N	0	127648	1
127651	1	elemento 63	\N	PREFIX-00002-00076	\N	\N	0	127648	2
127652	1	elemento 64	\N	PREFIX-00002-00077	\N	\N	0	127648	3
127653	1	elemento 65	\N	PREFIX-00002-00078	\N	\N	0	127648	4
127654	1	elemento 66	\N	PREFIX-00002-00079	\N	\N	0	127648	5
127655	1	elemento 67	\N	PREFIX-00002-00080	\N	\N	0	127648	6
127656	1	elemento 68	\N	PREFIX-00002-00081	\N	\N	0	127648	7
127657	1	elemento 69	\N	PREFIX-00002-00082	\N	\N	0	127648	8
127658	1	elemento 70	\N	PREFIX-00002-00083	\N	\N	0	127648	9
301993	1	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00012	\N	\N	4	\N	\N
301997	1	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00031	\N	\N	4	\N	\N
312295	1	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00001	\N	\N	4	\N	\N
312299	1	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00002	\N	\N	4	\N	\N
312303	1	tarea de soldador coruñés	\N	PREFIX-00038-00001	\N	\N	4	\N	\N
312307	1	tarea de pintor coruñés	\N	PREFIX-00038-00016	\N	\N	4	\N	\N
312311	1	tarea de soldador pontevedrés	\N	PREFIX-00038-00032	\N	\N	4	\N	\N
312315	1	tarea de pintor pontevedrés	\N	PREFIX-00038-00048	\N	\N	4	\N	\N
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
316184	1
317663	1
316133	1
317664	1
317718	1
318981	1
300825	1
300796	1
300826	1
300827	1
300828	1
301604	1
301592	1
301605	1
301606	1
301607	1
301648	1
301649	1
301651	1
301652	1
301654	1
301655	1
301656	1
301657	1
301658	1
301659	1
301678	1
301666	1
301679	1
301680	1
301681	1
300806	1
300790	1
300807	1
300808	1
311832	1
311799	1
311833	1
311835	1
311836	1
311838	1
311839	1
311840	1
313330	1
313331	1
313333	1
313334	1
313336	1
313337	1
313338	1
313339	1
313340	1
316171	1
316172	1
316174	1
316175	1
311841	1
311842	1
311866	1
311806	1
311868	1
311869	1
311871	1
311872	1
311873	1
311874	1
311875	1
313341	1
313382	1
313383	1
313385	1
313386	1
313388	1
313389	1
313390	1
313391	1
313392	1
313393	1
316214	1
316216	1
316217	1
316219	1
316220	1
316222	1
316223	1
316225	1
316226	1
317697	1
317698	1
317700	1
317701	1
317703	1
317705	1
317706	1
317708	1
317709	1
318960	1
318962	1
318963	1
318965	1
318966	1
318967	1
318969	1
318971	1
318972	1
316163	1
316165	1
316166	1
316168	1
316169	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
300789
300805
300824
301603
301647
301650
301653
301677
311798
311831
311834
311837
311865
311867
311870
313329
313332
313335
313381
313384
313387
316132
316162
316164
316167
316170
316173
316213
316215
316218
316221
316224
317695
317696
317699
317702
317704
317707
318959
318961
318964
318968
318970
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
127635
127636
127641
127648
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
127637	0
127638	0
127639	0
127640	0
127642	0
127643	0
127644	0
127645	0
127646	0
127647	0
127649	0
127650	0
127651	0
127652	0
127653	0
127654	0
127655	0
127656	0
127657	0
127658	0
301286	0
301290	0
301993	0
301997	0
312295	0
312299	0
312303	0
312307	0
312311	0
312315	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
808	40	PREFIX	39	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
300986	30	2010-08-02 14:48:22.695	909
312002	34	2010-08-02 20:18:49.053	909
311995	21	2010-08-02 18:24:10.357	909
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
299987	2	deccor1	f	f	300079
299971	5	8b5c5e0e-bc50-4e2d-b97f-c8c3e181dcf7	t	t	300071
299973	3	a5ab3941-8cce-47e4-bef4-7f8a70109bcf	t	t	300072
299975	3	8bece01f-75b3-4319-81f5-5d6744e380d8	t	t	300073
299977	3	810b486b-18a7-45be-b0a0-1a8b0210f65a	t	t	300074
299979	3	565ef437-e034-45b2-8204-62c7c6717542	t	t	300075
299981	3	3b634508-7f41-40f6-a1db-ddaf43bb6346	t	t	300076
1627	3	1849779f-4419-44dd-98a0-3612d34743e3	t	f	513
2728	2	pincor2	f	f	2829
2727	2	pincor1	f	f	2828
2729	2	pincor3	f	f	2830
2730	2	pincor4	f	f	2831
2731	2	solcor1	f	f	2832
2732	2	solcor2	f	f	2833
2733	2	solcor3	f	f	2834
2734	2	solcor4	f	f	2835
1617	4	166106cf-5fce-4a4a-bd1f-249029b3b565	t	f	508
2020	2	cappon2	f	f	2121
2029	2	capcor2	f	f	2130
2025	2	esccor1	f	f	2126
2026	2	esccor2	f	f	2127
2027	2	esccor3	f	f	2128
2028	2	esccor4	f	f	2129
1629	2	c02f823a-a30c-4dae-af8d-3d978ac3c6d2	t	f	514
1631	2	2d3f15fc-8c78-41d6-81fa-2ca777a3e908	t	f	515
1633	2	c4180e03-c387-4d38-b216-f0cbee9250ae	t	f	516
1619	2	3d74c082-2c65-4ecf-95e8-5e631b45d35e	t	f	509
1621	2	0e516c97-8345-4091-8a0a-d9ad456c2fdd	t	f	510
1623	2	5d577cbe-be59-4f8f-b4af-5d15d958dc4e	t	f	511
1625	2	eac99541-ed3b-401d-8794-9b160f7ff8cc	t	f	512
2021	2	escpon1	f	f	2122
2022	2	escpon2	f	f	2123
2023	2	escpon3	f	f	2124
2024	2	escpon4	f	f	2125
299983	3	6433ea76-6595-4a73-8c21-3e08eadaca9a	t	t	300077
299985	3	2f8b7eb8-7f57-4ab7-ba3b-797d22439366	t	t	300078
299989	2	deccor2	f	f	300080
299991	2	decpon1	f	f	300081
299993	2	decpon2	f	f	300082
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
302899	4	1.00	150	150	302828	\N
314729	4	1.00	150	150	314631	\N
314726	4	1.00	150	150	314628	\N
314728	4	1.00	150	150	314630	\N
314727	4	1.00	150	150	314629	\N
314731	4	1.00	150	150	314633	\N
314733	4	1.00	150	150	314635	\N
314732	4	1.00	150	150	314634	\N
314734	4	1.00	150	150	314636	\N
314730	4	1.00	150	150	314632	\N
302901	4	1.00	150	150	302830	\N
302902	4	1.00	150	150	302831	\N
302900	4	1.00	150	150	302829	\N
314812	5	1.56	\N	150	314667	\N
314813	5	0.99	\N	150	314668	\N
314744	2	1.00	150	150	314660	\N
302985	2	0.99	\N	150	302798	\N
302986	2	0.99	\N	150	302799	\N
302987	2	0.99	\N	150	302800	\N
302988	2	0.99	\N	150	302801	\N
302989	2	1.88	\N	150	302815	\N
302990	2	1.88	\N	150	302816	\N
302991	2	0.99	\N	150	302817	\N
302992	2	0.99	\N	150	302818	\N
302993	2	0.49	\N	150	302819	\N
302994	2	0.49	\N	150	302820	\N
302995	2	0.99	\N	150	302821	\N
302996	2	1.88	\N	150	302824	\N
302997	2	1.88	\N	150	302825	\N
302998	2	1.88	\N	150	302826	\N
308161	1	0.49	\N	150	302803	\N
308162	1	0.49	\N	150	302804	\N
308163	1	0.49	\N	150	302805	\N
308164	1	0.49	\N	150	302806	\N
308165	1	0.25	\N	150	302807	\N
308167	1	1.00	120	120	302810	\N
302903	4	1.00	150	150	302832	\N
308168	1	1.00	120	120	302811	\N
308166	1	1.00	120	120	302809	\N
308170	1	1.00	120	120	302813	\N
308169	1	1.00	120	120	302812	\N
314747	2	1.00	120	120	314640	\N
314753	2	1.00	120	120	314646	\N
314756	2	1.00	120	120	314649	\N
314755	2	1.00	120	120	314648	\N
314741	2	1.00	150	150	314657	\N
314751	2	1.00	120	120	314644	\N
314749	2	1.00	120	120	314642	\N
314754	2	1.00	120	120	314647	\N
314738	2	1.00	150	150	314654	\N
314721	5	1.00	150	150	314620	\N
314814	5	0.99	\N	150	314669	\N
314815	5	0.99	\N	150	314670	\N
314816	5	0.99	\N	150	314671	\N
322695	5	0.99	\N	150	314672	\N
322696	5	0.99	\N	150	314673	\N
322697	5	0.99	\N	150	314674	\N
328263	4	0.99	\N	150	314675	\N
328264	4	0.99	\N	150	314676	\N
314725	5	1.00	150	150	314624	\N
314716	5	1.00	150	150	314615	\N
314717	5	1.00	150	150	314616	\N
314718	5	1.00	150	150	314617	\N
314722	5	1.00	150	150	314621	\N
314720	5	1.00	150	150	314619	\N
314719	5	1.00	150	150	314618	\N
314724	5	1.00	150	150	314623	\N
314723	5	1.00	150	150	314622	\N
314742	2	1.00	150	150	314658	\N
314750	2	1.00	120	120	314643	\N
314746	2	1.00	150	150	314662	\N
314752	2	1.00	120	120	314645	\N
314737	2	1.00	150	150	314653	\N
314740	2	1.00	150	150	314656	\N
314743	2	1.00	150	150	314659	\N
314739	2	1.00	150	150	314655	\N
314745	2	1.00	150	150	314661	\N
314748	2	1.00	120	120	314641	\N
341861	2	1.70	\N	150	314698	\N
341862	2	0.99	\N	150	314700	\N
341863	2	0.99	\N	150	314701	\N
341864	2	0.99	\N	150	314702	\N
341865	2	0.49	\N	150	314703	\N
341866	2	0.49	\N	150	314704	\N
341867	2	0.99	\N	150	314705	\N
341868	2	0.99	\N	150	314706	\N
341869	2	0.99	\N	150	314707	\N
341870	2	0.99	\N	150	314708	\N
334543	3	1.70	\N	150	314683	\N
334544	3	1.70	\N	150	314684	\N
334545	3	0.99	\N	150	314685	\N
334546	3	0.99	\N	150	314686	\N
334547	3	0.49	\N	150	314687	\N
334548	3	0.99	\N	150	314688	\N
334549	3	0.99	\N	150	314689	\N
334550	3	0.99	\N	150	314690	\N
334551	3	0.99	\N	150	314691	\N
334552	3	0.99	\N	150	314692	\N
348898	1	1.70	\N	150	314715	\N
348899	1	0.99	\N	150	319261	\N
348900	1	0.99	\N	150	319262	\N
348901	1	0.99	\N	150	319263	\N
348902	1	0.99	\N	150	319264	\N
348903	1	0.99	\N	150	319265	\N
348904	1	0.99	\N	150	319266	\N
348905	1	0.99	\N	150	319267	\N
348906	1	0.99	\N	150	319268	\N
348907	1	0.99	\N	150	319269	\N
348908	1	0.18	\N	150	319275	\N
348909	0	0.16	\N	150	314699	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
513	1
2829	1
2828	1
2830	1
2831	1
2832	1
2833	1
2834	1
2835	1
508	1
2121	1
2130	1
2126	1
2127	1
2128	1
2129	1
514	1
515	1
516	1
509	1
510	1
511	1
512	1
2122	1
2123	1
2124	1
2125	1
300079	1
300071	1
300072	1
300073	1
300074	1
300075	1
300076	1
300077	1
300078	1
300080	1
300081	1
300082	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
1924	3	9ccfbe1c-3101-4bb1-ab9d-54ddafb93dba	2009-01-01	2009-12-31	1313	1627
3233	2	pincor2-r1	2010-07-01	\N	1313	2728
3232	2	pincor1-r1	2010-01-01	\N	1313	2727
3234	2	pincor3-r1	2009-01-01	\N	1313	2729
3235	2	pincor4-r1	2009-01-01	2009-12-31	1313	2730
3236	2	solcor1-r1	2009-01-01	2009-12-31	1313	2731
3237	2	solcor2-r1	2009-01-01	\N	1313	2732
3238	2	solcor3-r1	2010-01-01	\N	1313	2733
3239	2	solcor4-r1	2010-07-01	\N	1313	2734
1919	3	99727b20-ab7a-4eab-a4da-b501fa288928	2010-01-12	\N	1314	1617
2525	2	cappon2-a1	2009-01-01	\N	1314	2020
2534	2	capcor2-a1	2009-01-01	\N	1314	2029
2530	2	esccor1-a1	2009-01-01	\N	1313	2025
2531	2	esccor2-a1	2009-01-01	2009-12-31	1313	2026
2532	2	esccor3-a1	2010-01-01	\N	1313	2027
2533	2	esccor4-a1	2010-01-01	\N	1313	2028
1925	2	ceb97381-5921-48d4-b395-2d76fd5e8a70	2009-01-01	\N	1313	1629
1926	2	d6bc3bc8-cb0a-493b-9c2e-e8d300053a61	2010-01-01	\N	1313	1631
1927	2	fd2b6257-c3df-4b43-b821-ab5015d4a8b3	2010-07-01	\N	1313	1633
1920	2	051ebe17-84e7-4989-8879-e246654d5338	2010-01-01	\N	1313	1619
1921	2	c2552ab2-1eaf-4f9a-a842-e9e4d44a2a8d	2010-07-01	\N	1313	1621
1922	2	98a2b0f1-2f53-4b7e-92d2-c257e6fb9fba	2009-01-01	\N	1313	1623
1923	2	3a7db51d-fc3f-41dd-82be-fbf1f22efdb8	2009-01-01	2010-12-31	1313	1625
2526	2	escpon1-a1	2009-01-01	\N	1313	2021
2527	2	escpon2-a1	2009-01-01	2009-12-31	1313	2022
2528	2	escpon3-a1	2010-01-01	\N	1313	2023
2529	2	escpon4-a1	2010-01-01	\N	1313	2024
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario (id, version, name, description, lastnotownedreassignationstimestamp, predecessor) FROM stdin;
909	3	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
300789	300986	909
311798	311995	909
316132	312002	909
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
300789	300890	300986
300790	300891	300986
300796	300897	300986
300805	300906	300986
300806	300907	300986
300807	300908	300986
300808	300909	300986
300824	300925	300986
300825	300926	300986
300826	300927	300986
300827	300928	300986
300828	300929	300986
301592	301693	300986
301603	301704	300986
301604	301705	300986
301605	301706	300986
301606	301707	300986
301607	301708	300986
301647	301748	300986
301648	301749	300986
301649	301750	300986
301650	301751	300986
301651	301752	300986
301652	301753	300986
301653	301754	300986
301654	301755	300986
301655	301756	300986
301656	301757	300986
301657	301758	300986
301658	301759	300986
301659	301760	300986
301666	301767	300986
301677	301778	300986
301678	301779	300986
301679	301780	300986
301680	301781	300986
301681	301782	300986
311798	311899	311995
311799	311900	311995
311806	311907	311995
311831	311932	311995
311832	311933	311995
311833	311934	311995
311834	311935	311995
311835	311936	311995
311836	311937	311995
311837	311938	311995
311838	311939	311995
311839	311940	311995
311840	311941	311995
311841	311942	311995
311842	311943	311995
311865	311966	311995
311866	311967	311995
311867	311968	311995
311868	311969	311995
311869	311970	311995
311870	311971	311995
311871	311972	311995
311872	311973	311995
311873	311974	311995
311874	311975	311995
311875	311976	311995
313329	313430	311995
313330	313431	311995
313331	313432	311995
313332	313433	311995
313333	313434	311995
313334	313435	311995
313335	313436	311995
313336	313437	311995
313337	313438	311995
313338	313439	311995
313339	313440	311995
313340	313441	311995
313341	313442	311995
313381	313482	311995
313382	313483	311995
313383	313484	311995
313384	313485	311995
313385	313486	311995
313386	313487	311995
313387	313488	311995
313388	313489	311995
313389	313490	311995
313390	313491	311995
313391	313492	311995
313392	313493	311995
313393	313494	311995
316132	316233	312002
316133	316234	312002
316162	316263	312002
316163	316264	312002
316164	316265	312002
316165	316266	312002
316166	316267	312002
316167	316268	312002
316168	316269	312002
316169	316270	312002
316170	316271	312002
316171	316272	312002
316172	316273	312002
316173	316274	312002
316174	316275	312002
316175	316276	312002
316184	316285	312002
316213	316314	312002
316214	316315	312002
316215	316316	312002
316216	316317	312002
316217	316318	312002
316218	316319	312002
316219	316320	312002
316220	316321	312002
316221	316322	312002
316222	316323	312002
316223	316324	312002
316224	316325	312002
316225	316326	312002
316226	316327	312002
317663	317764	312002
317664	317765	312002
317695	317796	312002
317696	317797	312002
317697	317798	312002
317698	317799	312002
317699	317800	312002
317700	317801	312002
317701	317802	312002
317702	317803	312002
317703	317804	312002
317704	317805	312002
317705	317806	312002
317706	317807	312002
317707	317808	312002
317708	317809	312002
317709	317810	312002
317718	317819	312002
318959	319060	312002
318960	319061	312002
318961	319062	312002
318962	319063	312002
318963	319064	312002
318964	319065	312002
318965	319066	312002
318966	319067	312002
318967	319068	312002
318968	319069	312002
318969	319070	312002
318970	319071	312002
318971	319072	312002
318972	319073	312002
318981	319082	312002
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
317819	14	0	317718
319082	11	0	318981
311899	15	3	311798
311932	13	3	311831
311933	13	0	311832
311900	15	0	311799
311934	13	0	311833
311935	13	3	311834
311936	13	0	311835
311937	13	0	311836
311938	13	3	311837
311939	13	0	311838
311940	13	0	311839
311941	13	0	311840
311942	13	0	311841
311943	13	0	311842
311966	12	3	311865
300890	19	3	300789
300925	16	3	300824
300926	16	0	300825
300897	18	0	300796
300927	16	0	300826
300928	16	0	300827
300929	16	0	300828
301704	13	3	301603
301705	13	0	301604
301693	14	0	301592
301706	13	0	301605
301707	13	0	301606
301708	13	0	301607
301748	11	3	301647
301749	11	0	301648
301750	11	0	301649
301751	11	3	301650
301752	11	0	301651
301753	11	0	301652
301754	11	3	301653
301755	11	0	301654
301756	11	0	301655
301757	11	0	301656
301758	11	0	301657
301759	11	0	301658
301760	11	0	301659
301778	8	3	301677
301779	8	0	301678
301767	9	0	301666
301780	8	0	301679
301781	8	0	301680
301782	8	0	301681
300906	17	3	300805
300907	17	0	300806
300891	19	0	300790
300908	17	0	300807
300909	17	0	300808
316322	17	3	316221
316323	17	0	316222
316324	17	0	316223
316325	17	3	316224
316326	17	0	316225
316327	17	0	316226
316263	21	3	316162
316264	21	0	316163
316265	21	3	316164
316266	21	0	316165
316267	21	0	316166
316268	21	3	316167
316269	21	0	316168
316270	21	0	316169
316271	21	3	316170
316272	21	0	316171
316273	21	0	316172
316274	21	3	316173
316275	21	0	316174
316276	21	0	316175
316314	17	3	316213
316315	17	0	316214
316316	17	3	316215
316317	17	0	316216
316318	17	0	316217
316319	17	3	316218
316320	17	0	316219
316321	17	0	316220
311967	12	0	311866
311907	14	0	311806
311968	12	3	311867
311969	12	0	311868
311970	12	0	311869
311971	12	3	311870
311972	12	0	311871
311973	12	0	311872
311974	12	0	311873
311975	12	0	311874
311976	12	0	311875
313430	11	3	313329
313431	11	0	313330
313432	11	0	313331
313433	11	3	313332
313434	11	0	313333
313435	11	0	313334
313436	11	3	313335
313437	11	0	313336
313438	11	0	313337
313439	11	0	313338
313440	11	0	313339
313441	11	0	313340
313442	11	0	313341
313482	10	3	313381
313483	10	0	313382
313484	10	0	313383
313485	10	3	313384
313486	10	0	313385
313487	10	0	313386
313488	10	3	313387
313489	10	0	313388
313490	10	0	313389
313491	10	0	313390
313492	10	0	313391
313493	10	0	313392
313494	10	0	313393
317804	15	0	317703
317805	15	3	317704
317806	15	0	317705
317807	15	0	317706
317808	15	3	317707
317809	15	0	317708
316233	28	3	316132
317810	15	0	317709
319060	12	3	318959
319061	12	0	318960
319062	12	3	318961
319063	12	0	318962
319064	12	0	318963
316285	19	0	316184
317764	17	0	317663
317796	15	3	317695
317765	17	0	317664
317797	15	3	317696
317798	15	0	317697
317799	15	0	317698
317800	15	3	317699
319065	12	3	318964
319066	12	0	318965
319067	12	0	318966
319068	12	0	318967
319069	12	3	318968
319070	12	0	318969
319071	12	3	318970
319072	12	0	318971
319073	12	0	318972
316234	22	0	316133
317801	15	0	317700
317802	15	0	317701
317803	15	3	317702
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
314737	299973
314740	299973
314739	299973
314738	299973
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
315625	0	314737	909
315626	0	314740	909
315627	0	314739	909
315628	0	314738	909
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
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
302828	1	1	2010-08-02 00:00:00	\N	5
302809	1	1	2010-08-02 00:00:00	\N	5
302813	1	1	2010-09-10 00:00:00	\N	5
302812	1	1	2010-08-20 00:00:00	\N	5
314632	1	1	2010-02-23 00:00:00	\N	5
302798	1	0	\N	\N	\N
302799	1	0	\N	\N	\N
302800	1	1	2010-08-27 05:36:00	\N	\N
302801	1	1	2010-08-25 01:39:08.78	\N	\N
314631	1	1	2010-01-27 00:00:00	\N	5
314620	1	1	2010-02-23 00:00:00	\N	5
314624	1	1	2010-04-15 00:00:00	\N	5
314615	1	1	2010-01-01 00:00:00	\N	5
314628	1	1	2010-01-01 00:00:00	\N	5
302815	1	0	\N	\N	\N
302816	1	0	\N	\N	\N
302817	1	0	\N	\N	\N
302818	1	0	\N	\N	\N
302819	1	0	\N	\N	\N
302820	1	0	\N	\N	\N
302821	1	0	\N	\N	\N
302824	1	0	\N	\N	\N
302825	1	0	\N	\N	\N
302826	1	0	\N	\N	\N
302803	1	0	\N	\N	\N
302804	1	0	\N	\N	\N
302805	1	0	\N	\N	\N
302806	1	0	\N	\N	\N
302807	1	0	\N	\N	\N
314630	1	1	2010-01-27 00:00:00	\N	5
314616	1	1	2010-01-01 00:00:00	\N	5
314617	1	1	2010-01-01 00:00:00	\N	5
314621	1	1	2010-02-23 00:00:00	\N	5
314619	1	1	2010-01-27 00:00:00	\N	5
302810	1	1	2010-08-02 00:00:00	\N	5
302832	1	1	2010-09-22 00:00:00	\N	5
302830	1	1	2010-08-26 00:00:00	\N	5
302831	1	1	2010-08-26 00:00:00	\N	5
302811	1	1	2010-08-20 00:00:00	\N	5
302829	1	1	2010-08-02 00:00:00	\N	5
314667	1	0	\N	\N	\N
314668	1	0	\N	\N	\N
314669	1	0	\N	\N	\N
314670	1	0	\N	\N	\N
314618	1	1	2010-01-27 00:00:00	\N	5
314623	1	1	2010-03-22 00:00:00	\N	5
314629	1	1	2010-01-01 00:00:00	\N	5
314622	1	1	2010-03-22 00:00:00	\N	5
314671	1	0	\N	\N	\N
314672	1	1	2010-04-14 00:13:04.80	\N	\N
314673	1	1	2010-02-08 01:24:51.768	\N	\N
314674	1	0	\N	\N	\N
314675	1	1	2010-03-23 15:21:16.80	\N	\N
314676	1	1	2010-04-02 10:20:57.60	\N	\N
314658	1	1	2010-02-23 00:00:00	\N	5
314643	1	1	2010-01-21 00:00:00	\N	5
314662	1	1	2010-05-12 00:00:00	\N	5
314633	1	1	2010-02-23 00:00:00	\N	5
314635	1	1	2010-03-22 00:00:00	\N	5
314645	1	1	2010-03-04 00:00:00	\N	5
314653	1	1	2010-01-27 00:00:00	\N	5
314656	1	1	2010-03-22 00:00:00	\N	5
314659	1	1	2010-04-15 00:00:00	\N	5
314655	1	1	2010-02-23 00:00:00	\N	5
314661	1	1	2010-04-15 00:00:00	\N	5
314641	1	1	2010-01-01 00:00:00	\N	5
314634	1	1	2010-03-22 00:00:00	\N	5
314660	1	1	2010-03-22 00:00:00	\N	5
314640	1	1	2010-01-01 00:00:00	\N	5
314646	1	1	2010-02-11 00:00:00	\N	5
314649	1	1	2010-03-25 00:00:00	\N	5
314648	1	1	2010-03-25 00:00:00	\N	5
314657	1	1	2010-01-27 00:00:00	\N	5
314644	1	1	2010-02-11 00:00:00	\N	5
314636	1	1	2010-04-15 00:00:00	\N	5
314642	1	1	2010-01-21 00:00:00	\N	5
314647	1	1	2010-03-04 00:00:00	\N	5
314654	1	1	2010-01-01 00:00:00	\N	5
314698	1	0	\N	\N	\N
314700	1	1	2010-01-11 14:00:46.656	\N	\N
314701	1	0	\N	\N	\N
314702	1	0	\N	\N	\N
314703	1	0	\N	\N	\N
314704	1	0	\N	\N	\N
314705	1	0	\N	\N	\N
314706	1	0	\N	\N	\N
314707	1	0	\N	\N	\N
314708	1	0	\N	\N	\N
314699	2	0	\N	\N	\N
314683	1	0	\N	\N	\N
314684	1	0	\N	\N	\N
314685	1	0	\N	\N	\N
314686	1	0	\N	\N	\N
314687	1	0	\N	\N	\N
314688	1	0	\N	\N	\N
314689	1	0	\N	\N	\N
314690	1	0	\N	\N	\N
314691	1	0	\N	\N	\N
314692	1	0	\N	\N	\N
314715	1	0	\N	\N	\N
319261	1	0	\N	\N	\N
319262	1	0	\N	\N	\N
319263	1	0	\N	\N	\N
319264	1	0	\N	\N	\N
319265	1	0	\N	\N	\N
319266	1	0	\N	\N	\N
319267	1	0	\N	\N	\N
319268	1	0	\N	\N	\N
319269	1	0	\N	\N	\N
319275	2	0	\N	\N	\N
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
302798	301107
302799	301086
302800	301108
302801	301109
302803	301122
302804	301096
302805	301123
302806	301124
302807	301125
302809	301807
302810	301794
302811	301808
302812	301809
302813	301810
302815	301841
302816	301842
302817	301843
302818	301844
302819	301845
302820	301846
302821	301847
302824	301848
302825	301849
302826	301850
302828	301870
302829	301857
302830	301871
302831	301872
302832	301873
314615	312129
314616	312095
314617	312130
314618	312131
314619	312132
314620	312133
314621	312134
314622	312135
314623	312136
314624	312137
314628	312154
314629	312102
314630	312155
314631	312156
314632	312157
314633	312158
314634	312159
314635	312160
314636	312161
314640	313707
314641	313708
314642	313709
314643	313710
314644	313711
314645	313712
314646	313713
314647	313714
314648	313715
314649	313716
314653	313747
314654	313748
314655	313749
314656	313750
314657	313751
314658	313752
314659	313753
314660	313754
314661	313755
314662	313756
314667	313785
314668	313762
314669	313786
314670	313787
314671	313788
314672	313789
314673	313790
314674	313791
314675	313792
314676	313793
314683	316956
314684	313802
314685	316957
314686	316958
314687	316959
314688	316960
314689	316961
314690	316962
314691	316963
314692	316964
314699	316987
314698	316988
314700	317011
314701	317012
314702	317013
314703	317014
314704	317015
314705	317016
314706	317017
314707	317018
314708	317019
314715	318667
319261	317028
319262	318668
319263	318669
319264	318670
319265	318671
319266	318672
319267	318673
319268	318674
319269	318675
319275	318684
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent) FROM stdin;
314679	29	tarea de soldador coruñés	\N	2010-02-24 00:00:00	2010-05-14 15:21:16.80	\N	0.00	314680	\N	2
314687	16	tarea de pintor coruñés	\N	2010-02-02 00:00:00	2010-03-26 00:00:00	\N	0.00	314695	\N	0
314688	16	tarea de pintor coruñés (copy)	\N	2010-03-26 00:00:00	2010-04-22 00:00:00	\N	0.00	314695	\N	1
314694	25	tarea de pintor coruñés	\N	2010-03-26 00:00:00	2010-06-15 00:00:00	\N	0.00	314695	\N	2
314689	16	tarea de pintor coruñés	\N	2010-03-26 00:00:00	2010-04-22 00:00:00	\N	0.00	314694	\N	0
314690	16	tarea de pintor coruñés (copy)	\N	2010-04-22 00:00:00	2010-05-19 00:00:00	\N	0.00	314694	\N	1
314693	25	tarea de pintor coruñés	\N	2010-05-19 00:00:00	2010-06-15 00:00:00	\N	0.00	314694	\N	2
314691	16	tarea de pintor coruñés	\N	2010-05-19 00:00:00	2010-06-15 00:00:00	\N	0.00	314693	\N	0
314692	16	tarea de pintor coruñés (copy)	\N	2010-05-19 00:00:00	2010-06-15 00:00:00	\N	0.00	314693	\N	1
314665	9	10 tareas máquina tipo 1 coruña	\N	2010-01-01 00:00:00	2010-06-08 00:00:00	\N	0.00	314666	\N	3
314664	9	tarea máquina tipo 1 coruña	\N	2010-01-01 00:00:00	2010-06-08 00:00:00	\N	0.00	314665	\N	2
314666	10	Pedido 4	\N	2010-01-01 00:00:00	2010-06-08 00:00:00	\N	0.00	\N	\N	\N
314663	9	tarea máquina tipo 1 coruña	\N	2010-01-01 00:00:00	2010-06-08 00:00:00	\N	0.00	314664	\N	2
314681	29	tarea de soldador coruñés	\N	2010-01-01 00:00:00	2010-05-14 15:21:16.80	\N	0.00	314682	\N	0
314680	29	tarea de soldador coruñés	\N	2010-01-01 00:00:00	2010-05-14 15:21:16.80	\N	0.00	314681	\N	2
314703	14	tarea de soldador pontevedrés (copy)	\N	2010-02-12 00:00:00	2010-04-07 00:00:00	\N	0.00	314712	\N	1
314625	9	tarea de máquina tipo 2, coruña	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314626	\N	2
314704	14	tarea de soldador pontevedrés	\N	2010-02-12 00:00:00	2010-04-07 00:00:00	\N	0.00	314711	\N	0
302827	5	10 tareas de decorador pontevedrés	\N	2010-09-23 05:36:00	2011-02-19 00:00:00	\N	0.00	302834	\N	3
302815	5	tarea de decorador pontevedrés	\N	2010-09-23 05:36:00	2010-10-07 05:36:00	\N	0.00	302827	\N	0
302816	5	tarea de decorador pontevedrés (copy)	\N	2010-10-07 00:00:00	2010-10-21 00:00:00	\N	0.00	302827	\N	1
302823	5	tarea de decorador pontevedrés	\N	2010-10-21 00:00:00	2011-01-08 00:00:00	\N	0.00	302827	\N	2
302817	5	tarea de decorador pontevedrés	\N	2010-10-21 00:00:00	2010-11-17 00:00:00	\N	0.00	302823	\N	0
302818	5	tarea de decorador pontevedrés	\N	2010-10-21 00:00:00	2010-11-17 00:00:00	\N	0.00	302823	\N	1
302822	5	tarea de decorador pontevedrés (copy)	\N	2010-11-17 00:00:00	2011-01-08 00:00:00	\N	0.00	302823	\N	2
302819	5	tarea de decorador pontevedrés	\N	2010-11-17 00:00:00	2011-01-08 00:00:00	\N	0.00	302822	\N	0
302820	5	tarea de decorador pontevedrés (copy) (copy)	\N	2010-11-17 00:00:00	2011-01-08 00:00:00	\N	0.00	302822	\N	1
302821	5	tarea de decorador pontevedrés	\N	2010-11-17 00:00:00	2010-12-14 00:00:00	\N	0.00	302822	\N	2
302824	5	tarea de decorador pontevedrés	\N	2011-01-08 00:00:00	2011-01-22 00:00:00	\N	0.00	302827	\N	3
302825	5	tarea de decorador pontevedrés	\N	2011-01-22 00:00:00	2011-02-05 00:00:00	\N	0.00	302827	\N	4
302826	5	tarea de decorador pontevedrés	\N	2011-02-05 00:00:00	2011-02-19 00:00:00	\N	0.00	302827	\N	5
302808	5	5 tareas de decorador coruñés	\N	2010-08-02 13:13:34.554	2010-11-13 13:13:34.554	\N	0.00	302834	\N	1
302803	5	tarea de decorador coruñés	\N	2010-08-02 13:13:34.554	2010-09-23 13:13:34.554	\N	0.00	302808	\N	0
302832	6	tarea máquina tipo 1 coruña	\N	2010-09-22 00:00:00	2010-10-19 00:00:00	\N	0.00	302833	\N	4
302830	6	tarea máquina tipo 1 coruña	\N	2010-08-26 00:00:00	2010-09-22 00:00:00	\N	0.00	302833	\N	2
302831	6	tarea máquina tipo 1 coruña	\N	2010-08-26 00:00:00	2010-09-22 00:00:00	\N	0.00	302833	\N	3
302829	6	tarea máquina tipo 1 coruña (copy)	\N	2010-08-02 00:00:00	2010-08-26 00:00:00	\N	0.00	302833	\N	1
302828	6	tarea máquina tipo 1 coruña	\N	2010-08-02 00:00:00	2010-08-26 00:00:00	\N	0.00	302833	\N	0
302833	6	5 tareas máquina tipo 1 coruña	\N	2010-08-02 13:13:34.554	2010-10-19 00:00:00	\N	0.00	302834	\N	4
314697	25	tarea de pintor coruñés	\N	2010-01-01 00:00:00	2010-06-15 00:00:00	\N	0.00	314682	\N	1
314683	16	tarea de pintor coruñés	\N	2010-01-01 00:00:00	2010-01-16 00:00:00	\N	0.00	314697	\N	0
314684	16	tarea de pintor coruñés (copy)	\N	2010-01-16 00:00:00	2010-02-02 00:00:00	\N	0.00	314697	\N	1
314685	16	tarea de pintor coruñés	\N	2010-02-02 00:00:00	2010-02-27 00:00:00	\N	0.00	314696	\N	0
314686	16	tarea de pintor coruñés (copy)	\N	2010-02-02 00:00:00	2010-02-27 00:00:00	\N	0.00	314696	\N	1
314695	25	tarea de pintor coruñés	\N	2010-02-02 00:00:00	2010-06-15 00:00:00	\N	0.00	314696	\N	2
302802	5	4 tareas de decorador pontevedrés	\N	2010-08-02 13:13:34.554	2010-09-23 05:36:00	\N	0.00	302834	\N	0
302798	5	tarea de decorador pontevedrés	\N	2010-08-02 13:13:34.554	2010-08-27 13:13:34.554	\N	0.00	302802	\N	0
302799	5	tarea de decorador pontevedrés (copy)	\N	2010-08-02 13:13:34.554	2010-08-27 13:13:34.554	\N	0.00	302802	\N	1
302800	5	tarea de decorador pontevedrés	\N	2010-08-27 05:36:00	2010-09-23 05:36:00	\N	0.00	302802	\N	2
302801	5	tarea de decorador pontevedrés	\N	2010-08-25 01:39:08.78	2010-09-21 01:39:08.78	\N	0.00	302802	\N	3
314698	14	tarea de soldador pontevedrés	\N	2010-01-01 00:00:00	2010-01-16 00:00:00	\N	0.00	314714	\N	0
314700	14	tarea de soldador pontevedrés	\N	2010-01-16 00:00:00	2010-02-12 00:00:00	\N	0.00	314713	\N	0
314701	14	tarea de soldador pontevedrés (copy)	\N	2010-01-16 00:00:00	2010-02-12 00:00:00	\N	0.00	314713	\N	1
314702	14	tarea de soldador pontevedrés	\N	2010-02-12 00:00:00	2010-03-11 00:00:00	\N	0.00	314712	\N	0
314618	8	tarea de máquina tipo 2, coruña	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314626	\N	0
314623	8	tarea de máquina tipo 2, coruña	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314625	\N	3
314629	8	tarea de máquina tipo 2, pontevedra (copy)	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314639	\N	1
314622	8	tarea de máquina tipo 2, coruña	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314625	\N	2
314633	8	tarea máquina tipo 2 pontevedra (copy)	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314637	\N	1
314634	8	tarea máquina tipo 2 pontevedra	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314637	\N	2
314632	8	tarea máquina tipo 2 pontevedra	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314637	\N	0
314673	18	tarea de soldador coruñés	\N	2010-02-24 00:00:00	2010-03-23 00:00:00	\N	0.00	314678	\N	0
314674	18	tarea de soldador coruñés (copy)	\N	2010-03-23 00:00:00	2010-04-17 00:00:00	\N	0.00	314678	\N	1
302804	5	tarea de decorador coruñés (copy)	\N	2010-08-02 13:13:34.554	2010-09-23 13:13:34.554	\N	0.00	302808	\N	1
302805	5	tarea de decorador coruñés	\N	2010-08-02 13:13:34.554	2010-09-23 13:13:34.554	\N	0.00	302808	\N	2
302806	5	tarea de decorador coruñés	\N	2010-08-02 13:13:34.554	2010-09-23 13:13:34.554	\N	0.00	302808	\N	3
302807	5	tarea de decorador coruñés	\N	2010-08-02 13:13:34.554	2010-11-13 13:13:34.554	\N	0.00	302808	\N	4
302834	5	Pedido 3	\N	2010-08-02 13:13:34.554	2011-02-19 00:00:00	\N	0.00	\N	\N	\N
302810	6	tarea máquina tipo 1 pontevedra (copy)	\N	2010-08-02 00:00:00	2010-08-20 00:00:00	\N	0.00	302814	\N	1
302811	6	tarea máquina tipo 1 pontevedra	\N	2010-08-20 00:00:00	2010-09-10 00:00:00	\N	0.00	302814	\N	2
302809	6	tarea máquina tipo 1 pontevedra	\N	2010-08-02 00:00:00	2010-08-20 00:00:00	\N	0.00	302814	\N	0
302813	6	tarea máquina tipo 1 pontevedra	\N	2010-09-10 00:00:00	2010-10-01 00:00:00	\N	0.00	302814	\N	4
302812	6	tarea máquina tipo 1 pontevedra	\N	2010-08-20 00:00:00	2010-09-10 00:00:00	\N	0.00	302814	\N	3
302814	6	5 tareas máquina tipo 1 pontevedra	\N	2010-08-02 13:13:34.554	2010-10-01 00:00:00	\N	0.00	302834	\N	2
314675	18	tarea de soldador coruñés	\N	2010-03-23 15:21:16.80	2010-04-17 15:21:16.80	\N	0.00	314677	\N	0
314676	18	tarea de soldador coruñés (copy)	\N	2010-04-17 15:21:16.80	2010-05-14 15:21:16.80	\N	0.00	314677	\N	1
314705	14	tarea de soldador pontevedrés	\N	2010-04-07 00:00:00	2010-05-04 00:00:00	\N	0.00	314710	\N	0
314706	14	tarea de soldador pontevedrés (copy) (copy)	\N	2010-04-07 00:00:00	2010-05-04 00:00:00	\N	0.00	314710	\N	1
314708	14	tarea de soldador pontevedrés (copy)	\N	2010-05-04 00:00:00	2010-05-29 00:00:00	\N	0.00	314709	\N	1
314715	11	tarea de pintor pontevedrés	\N	2010-01-01 00:00:00	2010-01-16 00:00:00	\N	0.00	319274	\N	0
319261	11	tarea de pintor pontevedrés (copy)	\N	2010-01-01 00:00:00	2010-01-28 00:00:00	\N	0.00	319274	\N	1
314631	8	tarea máquina tipo 2 pontevedra (copy)	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314638	\N	1
314620	8	tarea de máquina tipo 2, coruña	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314625	\N	0
314624	8	tarea de máquina tipo 2, coruña	\N	2010-04-15 00:00:00	2010-05-12 00:00:00	\N	0.00	314625	\N	4
314615	8	tarea de máquina tipo 2, coruña	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314627	\N	0
314628	8	tarea máquina tipo 2 pontevedra	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314639	\N	0
314630	8	tarea máquina tipo 2 pontevedra	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314638	\N	0
314616	8	tarea de máquina tipo 2, coruña (copy)	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314627	\N	1
314617	8	tarea de máquina tipo 2, coruña	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314627	\N	2
314621	8	tarea de máquina tipo 2, coruña (copy)	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314625	\N	1
314619	8	tarea de máquina tipo 2, coruña (copy)	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314626	\N	1
314707	14	tarea de soldador pontevedrés	\N	2010-05-04 00:00:00	2010-05-29 00:00:00	\N	0.00	314709	\N	0
314626	9	tarea de máquina tipo 2, coruña	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314627	\N	3
314627	9	10 tareas máquina tipo 2, coruña	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314666	\N	0
314671	18	tarea de soldador coruñés	\N	2010-02-24 00:00:00	2010-03-23 00:00:00	\N	0.00	314679	\N	0
314672	18	tarea de soldador coruñés (copy)	\N	2010-04-14 00:13:04.80	2010-05-11 00:13:04.80	\N	0.00	314679	\N	1
314658	8	tarea máquina tipo 1 coruña (copy)	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314663	\N	1
314643	8	tarea máquina tipo 1 pontevedra (copy)	\N	2010-01-21 00:00:00	2010-02-11 00:00:00	\N	0.00	314651	\N	1
314662	8	tarea máquina tipo 1 coruña	\N	2010-05-12 00:00:00	2010-06-08 00:00:00	\N	0.00	314663	\N	5
314635	8	tarea máquina tipo 2 pontevedra	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314637	\N	3
314645	8	tarea máquina tipo 1 pontevedra (copy)	\N	2010-03-04 00:00:00	2010-03-25 00:00:00	\N	0.00	314650	\N	1
314653	8	tarea máquina tipo 1 coruña	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314665	\N	0
314656	8	tarea máquina tipo 1 coruña (copy)	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314664	\N	1
314659	8	tarea máquina tipo 1 coruña	\N	2010-04-15 00:00:00	2010-05-12 00:00:00	\N	0.00	314663	\N	2
314655	8	tarea máquina tipo 1 coruña	\N	2010-02-23 00:00:00	2010-03-22 00:00:00	\N	0.00	314664	\N	0
314667	18	tarea de soldador coruñés	\N	2010-01-01 00:00:00	2010-01-19 00:00:00	\N	0.00	314681	\N	0
314678	29	tarea de soldador coruñés	\N	2010-02-24 00:00:00	2010-05-14 15:21:16.80	\N	0.00	314679	\N	2
314661	8	tarea máquina tipo 1 coruña	\N	2010-04-15 00:00:00	2010-05-12 00:00:00	\N	0.00	314663	\N	4
314641	8	tarea máquina tipo 1 pontevedra (copy)	\N	2010-01-01 00:00:00	2010-01-21 00:00:00	\N	0.00	314652	\N	1
314660	8	tarea máquina tipo 1 coruña	\N	2010-03-22 00:00:00	2010-04-15 00:00:00	\N	0.00	314663	\N	3
314640	8	tarea máquina tipo 1 pontevedra	\N	2010-01-01 00:00:00	2010-01-21 00:00:00	\N	0.00	314652	\N	0
314646	8	tarea máquina tipo 1 pontevedra	\N	2010-02-11 00:00:00	2010-03-04 00:00:00	\N	0.00	314650	\N	2
314649	8	tarea máquina tipo 1 pontevedra	\N	2010-03-25 00:00:00	2010-04-15 00:00:00	\N	0.00	314650	\N	5
314648	8	tarea máquina tipo 1 pontevedra	\N	2010-03-25 00:00:00	2010-04-15 00:00:00	\N	0.00	314650	\N	4
314677	29	tarea de soldador coruñés	\N	2010-03-23 15:21:16.80	2010-04-17 00:00:00	\N	0.00	314678	\N	2
314699	15	tarea de capataz coruñés	\N	2010-01-01 00:00:00	2010-06-15 00:00:00	\N	0.00	314682	\N	2
314639	10	10 tareas máquina tipo 2, pontevedra	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314666	\N	1
314652	9	10 tareas máquina tipo 1 pontevedra	\N	2010-01-01 00:00:00	2010-04-15 00:00:00	\N	0.00	314666	\N	2
314682	29	Pedido 2	\N	2010-01-01 00:00:00	2010-06-15 00:00:00	\N	0.00	\N	\N	\N
314637	9	tarea máquina tipo 2 pontevedra	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314638	\N	2
314638	10	tarea máquina tipo 2 pontevedra	\N	2010-01-01 00:00:00	2010-05-12 00:00:00	\N	0.00	314639	\N	2
314657	8	tarea máquina tipo 1 coruña	\N	2010-01-27 00:00:00	2010-02-23 00:00:00	\N	0.00	314663	\N	0
314644	8	tarea máquina tipo 1 pontevedra	\N	2010-02-11 00:00:00	2010-03-04 00:00:00	\N	0.00	314650	\N	0
314636	8	tarea máquina tipo 2 pontevedra	\N	2010-04-15 00:00:00	2010-05-12 00:00:00	\N	0.00	314637	\N	4
314642	8	tarea máquina tipo 1 pontevedra	\N	2010-01-21 00:00:00	2010-02-11 00:00:00	\N	0.00	314651	\N	0
314647	8	tarea máquina tipo 1 pontevedra	\N	2010-03-04 00:00:00	2010-03-25 00:00:00	\N	0.00	314650	\N	3
314654	8	tarea máquina tipo 1 coruña (copy)	\N	2010-01-01 00:00:00	2010-01-27 00:00:00	\N	0.00	314665	\N	1
314650	9	tarea máquina tipo 1 pontevedra	\N	2010-01-01 00:00:00	2010-04-15 00:00:00	\N	0.00	314651	\N	2
314651	9	tarea máquina tipo 1 pontevedra	\N	2010-01-01 00:00:00	2010-04-15 00:00:00	\N	0.00	314652	\N	2
314668	18	tarea de soldador coruñés (copy)	\N	2010-01-19 00:00:00	2010-02-13 00:00:00	\N	0.00	314681	\N	1
314669	18	tarea de soldador coruñés	\N	2010-01-01 00:00:00	2010-01-28 00:00:00	\N	0.00	314680	\N	0
314670	18	tarea de soldador coruñés (copy)	\N	2010-01-28 00:00:00	2010-02-24 00:00:00	\N	0.00	314680	\N	1
314710	21	tarea de soldador pontevedrés (copy)	\N	2010-04-07 00:00:00	2010-05-29 00:00:00	\N	0.00	314711	\N	1
314709	21	tarea de soldador pontevedrés	\N	2010-05-04 00:00:00	2010-05-29 00:00:00	\N	0.00	314710	\N	2
314696	25	tarea de pintor coruñés	\N	2010-02-02 00:00:00	2010-06-15 00:00:00	\N	0.00	314697	\N	2
319274	15	tarea de pintor pontevedrés	\N	2010-01-01 00:00:00	2010-04-07 00:00:00	\N	0.00	314682	\N	4
319273	15	tarea de pintor pontevedrés	\N	2010-01-16 00:00:00	2010-04-07 00:00:00	\N	0.00	319274	\N	2
319262	11	tarea de pintor pontevedrés	\N	2010-01-16 00:00:00	2010-02-12 00:00:00	\N	0.00	319273	\N	0
319263	11	tarea de pintor pontevedrés (copy)	\N	2010-01-16 00:00:00	2010-02-12 00:00:00	\N	0.00	319273	\N	1
319272	15	tarea de pintor pontevedrés	\N	2010-02-12 00:00:00	2010-04-07 00:00:00	\N	0.00	319273	\N	2
319264	11	tarea de pintor pontevedrés	\N	2010-02-12 00:00:00	2010-03-11 00:00:00	\N	0.00	319272	\N	0
319265	11	tarea de pintor pontevedrés (copy)	\N	2010-02-12 00:00:00	2010-03-11 00:00:00	\N	0.00	319272	\N	1
319266	11	tarea de pintor pontevedrés	\N	2010-02-12 00:00:00	2010-03-11 00:00:00	\N	0.00	319272	\N	2
319271	15	tarea de pintor pontevedrés	\N	2010-03-11 00:00:00	2010-04-07 00:00:00	\N	0.00	319272	\N	3
319267	11	tarea de pintor pontevedrés	\N	2010-03-11 00:00:00	2010-04-07 00:00:00	\N	0.00	319271	\N	0
319270	15	tarea de pintor pontevedrés (copy)	\N	2010-03-11 00:00:00	2010-04-07 00:00:00	\N	0.00	319271	\N	1
319268	11	tarea de pintor pontevedrés	\N	2010-03-11 00:00:00	2010-04-07 00:00:00	\N	0.00	319270	\N	0
314714	21	tarea de soldador pontevedrés	\N	2010-01-01 00:00:00	2010-05-29 00:00:00	\N	0.00	314682	\N	3
314713	21	tarea de soldador pontevedrés	\N	2010-01-16 00:00:00	2010-05-29 00:00:00	\N	0.00	314714	\N	1
314712	21	tarea de soldador pontevedrés	\N	2010-02-12 00:00:00	2010-05-29 00:00:00	\N	0.00	314713	\N	2
319269	11	tarea de pintor pontevedrés (copy) (copy)	\N	2010-03-11 00:00:00	2010-04-07 00:00:00	\N	0.00	319270	\N	1
319275	10	tarea de capataz pontevedrés	\N	2010-01-01 00:00:00	2010-05-29 00:00:00	\N	0.00	314682	\N	5
314711	21	tarea de soldador pontevedrés	\N	2010-02-12 00:00:00	2010-05-29 00:00:00	\N	0.00	314712	\N	2
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
302802
302808
302814
302822
302823
302827
302833
302834
314625
314626
314627
314637
314638
314639
314650
314651
314652
314663
314664
314665
314666
314677
314678
314679
314680
314681
314682
314693
314694
314695
314696
314697
314709
314710
314711
314712
314713
314714
319270
319271
319272
319273
319274
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
314649	3	313442
314653	3	313483
314654	3	313484
314655	3	313486
314656	3	313487
314657	3	313489
314658	3	313490
314659	3	313491
314660	3	313492
314661	3	313493
314662	3	313494
302798	1	300907
302799	1	300891
302800	1	300908
302801	1	300909
302802	1	300906
302803	1	300926
302804	1	300897
302805	1	300927
302806	1	300928
302807	1	300929
302808	1	300925
302809	1	301705
302810	1	301693
302811	1	301706
302812	1	301707
302813	1	301708
314683	19	316315
314684	19	316285
314685	19	316317
314686	19	316318
314687	19	316320
302814	1	301704
302815	1	301749
302816	1	301750
302817	1	301752
302818	1	301753
302819	1	301755
302820	1	301756
302821	1	301757
302822	1	301754
302823	1	301751
302824	1	301758
302825	1	301759
302826	1	301760
302827	1	301748
302828	1	301779
302829	1	301767
302830	1	301780
302831	1	301781
302832	1	301782
302833	1	301778
302834	1	300890
314677	12	316274
314678	12	316271
314679	12	316268
314680	12	316265
314681	12	316263
314693	10	316325
314694	10	316322
314695	10	316319
314696	10	316316
314697	10	316314
314625	2	311938
314626	2	311935
314627	2	311932
314637	2	311971
314638	2	311968
314639	2	311966
314650	2	313436
314651	2	313433
314652	2	313430
314682	12	316233
314667	23	316264
314668	23	316234
314669	23	316266
314670	23	316267
314671	23	316269
314672	23	316270
314673	23	316272
314674	23	316273
314675	23	316275
314663	2	313488
314664	2	313485
314665	2	313482
314666	2	311899
314615	3	311933
314616	3	311900
314617	3	311934
314618	3	311936
314619	3	311937
314620	3	311939
314621	3	311940
314622	3	311941
314623	3	311942
314624	3	311943
314628	3	311967
314629	3	311907
314630	3	311969
314631	3	311970
314632	3	311972
314633	3	311973
314634	3	311974
314635	3	311975
314636	3	311976
314640	3	313431
314641	3	313432
314642	3	313434
314643	3	313435
314644	3	313437
314645	3	313438
314646	3	313439
314647	3	313440
314648	3	313441
314676	23	316276
314688	19	316321
314689	19	316323
314690	19	316324
314691	19	316326
314692	19	316327
314699	15	317764
314698	15	317765
314700	15	317798
314701	15	317799
314702	15	317801
314709	8	317808
314710	8	317805
314711	8	317803
314712	8	317800
314713	8	317797
314714	8	317796
319270	5	319071
319271	5	319069
319272	5	319065
319273	5	319062
319274	5	319060
314703	15	317802
314704	15	317804
314705	15	317806
314706	15	317807
314707	15	317809
314708	15	317810
314715	9	319061
319261	9	317819
319262	9	319063
319263	9	319064
319264	9	319066
319265	9	319067
319266	9	319068
319267	9	319070
319268	9	319072
319269	9	319073
319275	7	319082
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
1212	1	ordinaria	9788e5d7-f09b-4d9e-a899-3424cd87c61b	10.00	t	t
1213	1	extra	127c91d7-4c88-49b7-8964-c07bd4ae5e73	15.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
303	1	74e270ce-6726-499c-9246-74d69199a5d9	units	f
304	1	2e32f5d2-9825-45b8-a938-b497ea9059e6	kg	f
305	1	3d20afc2-c98b-40c5-bd30-46fbfb72d5c9	km	f
306	1	21c95559-268e-418e-9a5a-1a99dc88bda7	l	f
307	1	33b3f555-08bf-455a-a674-7fdc18e28d63	m	f
308	1	d1c68031-ae71-4c5a-8ea7-33f90c9a75b2	m2	f
309	1	15b80125-7d86-4cfd-8e7a-f8afcbccd3bd	m3	f
310	1	3a10ea04-42ee-452f-b7ba-b7c61d15d806	tn	f
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
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_ADMINISTRATION
1112	ROLE_CREATE_ORDER
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
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1627	Soldador	Pontevedrés 1	721456271
2728	Pintor	Coruñés 2	pincor2
2727	Pintor	Coruñés 1	pincor1
2729	Pintor	Coruñés 3	pincor3
2730	Pintor	Coruñés 4	pincor4
2731	Soldador	Coruñés 1	solcor1
2732	Soldador	Coruñés 2	solcor2
2733	Soldador	Coruñés 3	solcor3
2734	Soldador	Coruñés 4	solcor4
1617	Capataz	Pontevedrés 1	12341234
2020	Capataz	Pontevedrés 2	cappon2
2029	Capataz	Coruñés 2	capcor2
2025	Escultor	Coruñés 1	esccor1
2026	Escultor	Coruñés 2	esccor2
2027	Escultor	Coruñés 3	esccor3
2028	Escultor	Coruñés 4	esccor4
1629	Soldador	Pontevedrés 2	8123046
1631	Soldador	Pontevedrés 3	61272828
1633	Soldador	Pontevedrés 4	167182899
1619	Pintor	Pontevedrés 1	1234651345
1621	Pintor	Pontevedrés 2	62345154
1623	Pintor	Pontevedrés 3	123415
1625	Pintor	Pontevedrés 4	123451261
2021	Escultor	Pontevedrés 1	escpon1
2022	Escultor	Pontevedrés 2	escpon2
2023	Escultor	Pontevedrés 3	escpon3
2024	Escultor	Pontevedrés 4	escpon4
299987	Decorador	Coruñés 1	deccor1
299989	Decorador	Coruñés 2	deccor2
299991	Decorador	Pontevedrés 1	decpon1
299993	Decorador	Pontevedrés 2	decpon2
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
-- Name: idx_advanceassigmenttemplate_on_template; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_advanceassigmenttemplate_on_template ON advanceassignmenttemplate USING btree (order_element_template_id);


--
-- Name: idx_calculatedconsolidatedvalue_on_calculatedconsolidation; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calculatedconsolidatedvalue_on_calculatedconsolidation ON consolidatedvalue USING btree (consolidation_id);


--
-- Name: idx_calendardata_on_basecalendar; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calendardata_on_basecalendar ON calendardata USING btree (base_calendar_id);


--
-- Name: idx_calendarexception_on_basecalendar; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calendarexception_on_basecalendar ON calendarexception USING btree (base_calendar_id);


--
-- Name: idx_criterion_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterion_on_parent ON criterion USING btree (parent);


--
-- Name: idx_criterionrequirement_on_hoursgroup; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionrequirement_on_hoursgroup ON criterionrequirement USING btree (hours_group_id);


--
-- Name: idx_criterionrequirement_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionrequirement_on_orderelement ON criterionrequirement USING btree (order_element_id);


--
-- Name: idx_criterionsatisfaction_on_resource; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionsatisfaction_on_resource ON criterionsatisfaction USING btree (resource);


--
-- Name: idx_dependency_on_taskelement_origin; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_dependency_on_taskelement_origin ON dependency USING btree (origin);


--
-- Name: idx_directadvanceassigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_directadvanceassigment_on_orderelement ON directadvanceassignment USING btree (direct_order_element_id);


--
-- Name: idx_hourcost_on_category; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hourcost_on_category ON hour_cost USING btree (cost_category_id);


--
-- Name: idx_hoursgroup_on_orderlinetemplate; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hoursgroup_on_orderlinetemplate ON hoursgroup USING btree (order_line_template);


--
-- Name: idx_hoursgroup_on_parentorderline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hoursgroup_on_parentorderline ON hoursgroup USING btree (parent_order_line);


--
-- Name: idx_indirectadvanceassigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_indirectadvanceassigment_on_orderelement ON indirectadvanceassignment USING btree (indirect_order_element_id);


--
-- Name: idx_label_on_labeltype; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_label_on_labeltype ON label USING btree (label_type_id);


--
-- Name: idx_material_assigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_material_assigment_on_orderelement ON material_assigment USING btree (order_element_id);


--
-- Name: idx_material_on_category; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_material_on_category ON material USING btree (category_id);


--
-- Name: idx_materialassigmenttemplate_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_materialassigmenttemplate_on_orderelement ON material_assigment_template USING btree (order_element_template_id);


--
-- Name: idx_materialcategory_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_materialcategory_on_parent ON material_category USING btree (parent_id);


--
-- Name: idx_noncalculatedconsolidatedvalue_on_noncalculatedconsolidatio; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_noncalculatedconsolidatedvalue_on_noncalculatedconsolidatio ON consolidatedvalue USING btree (consolidation_id);


--
-- Name: idx_orderelement_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_parent ON orderelement USING btree (parent);


--
-- Name: idx_orderelement_on_template; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_template ON orderelement USING btree (template);


--
-- Name: idx_orderelement_on_workreport; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_workreport ON work_report USING btree (order_element_id);


--
-- Name: idx_orderelement_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_workreportline ON work_report_line USING btree (order_element_id);


--
-- Name: idx_orderelementtemplate_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelementtemplate_on_parent ON orderelementtemplate USING btree (parent);


--
-- Name: idx_profile_on_profileroles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_profile_on_profileroles ON profile_roles USING btree (profileid);


--
-- Name: idx_qualityform_on_qualityformitems; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_qualityform_on_qualityformitems ON quality_form_items USING btree (quality_form_id);


--
-- Name: idx_queuedependency_on_destinyqueue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_queuedependency_on_destinyqueue ON limiting_resource_queue_dependency USING btree (destiny_queue_element_id);


--
-- Name: idx_queuedependency_on_originqueue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_queuedependency_on_originqueue ON limiting_resource_queue_dependency USING btree (origin_queue_element_id);


--
-- Name: idx_resource_on_workreport; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resource_on_workreport ON work_report USING btree (resource_id);


--
-- Name: idx_resource_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resource_on_workreportline ON work_report_line USING btree (resource_id);


--
-- Name: idx_resourceallocation_on_task; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourceallocation_on_task ON resourceallocation USING btree (task);


--
-- Name: idx_resourcecostcategoryassigment_on_resource; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourcecostcategoryassigment_on_resource ON resources_cost_category_assignment USING btree (resource_id);


--
-- Name: idx_resourcequeueelement_on_resourcequeue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourcequeueelement_on_resourcequeue ON limiting_resource_queue_element USING btree (limiting_resource_queue_id);


--
-- Name: idx_taskelement_on_taskgroup; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskelement_on_taskgroup ON taskelement USING btree (parent);


--
-- Name: idx_taskqualityform_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskqualityform_on_orderelement ON task_quality_form USING btree (order_element_id);


--
-- Name: idx_taskqualityform_on_taskqualityformitems; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskqualityform_on_taskqualityformitems ON task_quality_form_items USING btree (task_quality_form_id);


--
-- Name: idx_typeofworkhours_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_typeofworkhours_on_workreportline ON work_report_line USING btree (type_work_hours_id);


--
-- Name: idx_user_on_userprofiles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_user_on_userprofiles ON user_profiles USING btree (user_id);


--
-- Name: idx_user_on_userroles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_user_on_userroles ON user_roles USING btree (userid);


--
-- Name: idx_workreport_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_workreport_on_workreportline ON work_report_line USING btree (work_report_id);


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


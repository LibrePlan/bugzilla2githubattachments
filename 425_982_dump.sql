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
    name character varying(255),
    code character varying(255)
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
    parent bigint,
    expiringdate date,
    base_calendar_id bigint,
    position_in_calendar integer,
    code character varying(255)
);


ALTER TABLE public.calendardata OWNER TO naval;

--
-- Name: calendarexception; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexception (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    hours integer,
    calendar_exception_id bigint,
    base_calendar_id bigint,
    code character varying(255)
);


ALTER TABLE public.calendarexception OWNER TO naval;

--
-- Name: calendarexceptiontype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexceptiontype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    color character varying(255),
    notassignable boolean,
    code character varying(255)
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
    generatecodeforcriterion boolean,
    generatecodeforlabel boolean,
    generatecodeforworkreport boolean,
    generatecodeforresources boolean,
    generatecodefortypesofworkhours boolean,
    generatecodeformaterialcategories boolean,
    generatecodeforunittypes boolean,
    expandcompanyplanningviewcharts boolean,
    expandorderplanningviewcharts boolean
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
    value integer,
    advance_measurement_id bigint,
    consolidation_id bigint
);


ALTER TABLE public.consolidatedvalue OWNER TO naval;

--
-- Name: consolidation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE consolidation (
    id bigint NOT NULL,
    consolidation_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    advance_assignment_id bigint,
    inadvance_assignment_id bigint
);


ALTER TABLE public.consolidation OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    enabled boolean,
    code character varying(255)
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
    resource integer,
    generatecode boolean
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
    generic_resource_allocation_id bigint,
    derived_allocation_id bigint,
    consolidated boolean
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
    pricecost numeric(19,2),
    initdate date,
    enddate date,
    type_of_work_hours_id bigint,
    cost_category_id bigint,
    code character varying(255)
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
    generatecode boolean
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
-- Name: limiting_resource_queue_element; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    limiting_resource_queue_id bigint,
    earlier_start_date_because_of_gantt timestamp without time zone,
    start_date bytea,
    start_hour integer,
    end_date bytea,
    end_hour integer,
    creation_timestamp bigint
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
    unit_type integer,
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
    name character varying(255),
    parent_id bigint,
    code character varying(255),
    generatecode boolean
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
    disabled boolean
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
    schedulingstatetype integer,
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
    base_calendar_id bigint,
    limited_resource boolean,
    generatecode boolean
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
    assignment_function bigint,
    intendedtotalhours integer,
    intended_total_hours integer,
    originaltotalassignment integer
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
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO naval;

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
    orderelement bigint
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
    generatecode boolean
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
    generatecode boolean
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
    work_report_type_id bigint NOT NULL,
    resource_id bigint,
    order_element_id bigint,
    generatecode boolean
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
23742	5	t	707
23743	5	t	707
23744	5	t	707
23741	6	t	707
23737	5	t	707
23738	5	t	707
23739	5	t	707
23736	6	t	707
23747	5	t	707
23748	5	t	707
23749	5	t	707
23746	6	t	707
23752	5	t	707
23753	5	t	707
23754	5	t	707
23751	6	t	707
82719	1	t	707
82720	1	t	707
58387	2	t	707
58388	2	t	709
58389	2	t	709
58390	2	t	709
58391	2	f	709
58392	2	t	707
58393	2	t	707
58394	2	t	707
58395	2	f	709
18808	16	t	708
1719	22	f	707
18605	17	t	709
18606	17	t	709
18607	17	t	709
18608	17	f	709
1720	22	t	707
18809	16	t	708
88779	3	t	709
88780	3	f	709
1721	22	f	707
67671	3	t	707
74639	5	t	707
18810	16	f	708
1722	22	t	707
18609	17	f	709
102820	3	t	707
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
57989	1	708	57842	t	100.00
57990	1	709	57846	t	5.00
57991	1	709	57847	t	10.00
57992	1	709	57848	t	15.00
57993	1	708	57849	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
18754	16	2010-03-15	25.00	18808	\N
18700	17	2010-03-30	2.00	18605	\N
18701	17	2010-03-02	1.00	18605	\N
18702	17	2010-04-02	3.00	18606	\N
18703	17	2010-03-31	5.00	18607	\N
18755	16	2010-03-16	5.00	18809	\N
88880	3	2010-04-20	10.00	88779	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
707	4	children	100.0000	f	0.0100	t	t	f
708	3	percentage	100.0000	f	0.0100	t	t	f
709	2	units	2147483647.0000	f	1.0000	t	f	f
710	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
20210	513
20210	542
20240	513
20240	542
20241	513
20241	542
20274	514
20274	541
20275	514
20275	541
20276	514
20276	541
20279	541
20279	511
20290	541
20290	511
30421	540
30421	514
30422	540
30422	514
30423	540
30423	514
30466	540
30466	509
30467	540
30467	509
30468	540
30468	509
30498	513
30498	538
30499	513
30499	538
30500	513
30500	538
36161	538
36161	509
36164	509
36164	538
36167	509
36167	538
36197	514
36197	539
36198	514
36198	539
36199	514
36199	539
36215	511
36215	539
36216	511
36216	539
36219	511
36219	539
55957	540
82822	542
92417	511
94343	511
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name, code) FROM stdin;
1	1	Default	1
3	3	Galicia	3
2	4	España	2
4	3	Galicia media xornada	4
8	1	Andalucía media xornada	8
7	2	Andalucia	7
10	1	Asturias	10
21	5	\N	21
19	1	\N	19
20	1	\N	20
11	2	\N	11
12	2	\N	12
13	2	\N	13
14	2	\N	14
15	2	\N	15
16	2	\N	16
17	2	\N	17
18	2	\N	18
28	4	\N	28
27	1	\N	27
25	6	\N	25
19595	3	\N	19595
19596	3	\N	19596
22	6	\N	22
26	7	\N	26
30	5	\N	30
19597	4	\N	19597
2828	4	\N	2828
19594	5	\N	19594
29	6	\N	29
23	6	\N	23
40299	3	\N	0983a313-b2b6-40ac-81d0-bb4f8c72b30f
61408	2	\N	9fe784c4-cecb-4c05-970f-a9c0082bda75
85143	1	\N	b4dc1e38-2725-4933-ac7e-3fc1ce6d6f23
93628	3	Javier	469dff66-9bab-4901-8278-493640c79d02
50500	3	\N	695fef22-9614-4c6d-bbdf-b3edb5bfed2b
24	9	\N	24
31	7	\N	31
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1422	1	2010-03-01	\N	19	0
1423	1	2010-03-01	\N	20	0
1414	2	2010-03-08	\N	11	0
1415	2	2010-03-15	2010-09-15	12	0
1416	2	2010-03-22	\N	13	0
1417	2	2010-03-29	2010-09-29	14	0
1418	2	2010-03-08	\N	15	0
1419	2	2010-03-15	2010-09-15	16	0
1420	2	2010-03-22	\N	17	0
1421	2	2010-03-29	2010-09-29	18	0
1424	5	2010-03-08	\N	21	0
1431	4	2010-03-22	\N	28	0
1430	1	2010-03-01	\N	27	0
1428	6	2010-03-08	\N	25	0
19797	3	2010-03-01	\N	19595	0
19798	3	2010-03-01	\N	19596	0
1425	6	2010-03-15	2011-09-15	22	0
1429	7	2010-03-15	2011-09-09	26	0
1433	5	2010-03-22	\N	30	0
19799	4	2010-03-01	\N	19597	0
3030	4	2010-03-01	\N	2828	0
19796	5	2010-03-01	\N	19594	0
1432	6	2010-03-29	2011-09-29	29	0
1426	6	2010-03-01	\N	23	0
40501	3	2010-04-07	\N	40299	0
61610	2	2010-04-15	\N	61408	0
85345	1	2010-04-20	\N	85143	0
50702	3	2010-04-12	\N	50500	0
1427	9	2010-03-29	2011-09-29	24	0
1434	7	2010-03-29	2011-09-29	31	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar, code) FROM stdin;
117	2	1	\N	17	0	117
101	1	\N	\N	1	0	101
118	2	1	\N	18	0	118
125	6	10	\N	25	0	125
103	3	2	\N	3	0	103
102	4	\N	\N	2	0	102
104	3	2	\N	4	0	104
108	1	2	\N	8	0	108
107	2	2	\N	7	0	107
110	1	2	\N	10	0	110
127	1	4	\N	27	0	127
119	1	1	\N	19	0	119
120	1	1	\N	20	0	120
111	2	1	\N	11	0	111
112	2	1	\N	12	0	112
113	2	1	\N	13	0	113
114	2	1	\N	14	0	114
115	2	1	\N	15	0	115
116	2	1	\N	16	0	116
121	5	3	\N	21	0	121
128	4	4	\N	28	0	128
19696	3	10	\N	19595	0	19696
19697	3	4	\N	19596	0	19697
122	6	4	2010-03-08	22	0	122
19699	1	4	\N	22	1	19699
126	7	3	\N	26	0	126
130	5	8	\N	30	0	130
19698	4	8	\N	19597	0	19698
2929	4	3	\N	2828	0	2929
19695	5	7	\N	19594	0	19695
129	6	7	\N	29	0	129
123	6	7	\N	23	0	123
40400	3	1	\N	40299	0	989ca2f6-86ac-42f2-87c9-e3a84a916029
61509	2	1	\N	61408	0	db849135-0b7d-4e10-9663-d06525333a56
85244	1	1	\N	85143	0	cf23e3e8-8055-4ed5-bc47-ed9f7ceb42d6
93729	3	7	2011-04-27	93628	0	c980a8fd-e8ee-454d-b949-0b5c46a1bfbc
93731	1	7	\N	93628	1	ce100a7e-fbbc-4e65-b379-cbceb89758e5
50601	3	1	\N	50500	0	0da73ea4-3a94-4f7b-adbd-845f605c33e6
124	9	8	\N	24	0	124
131	7	10	\N	31	0	131
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id, code) FROM stdin;
1035	1	2010-12-31	4	611	10	1035
1036	1	2010-12-24	4	611	10	1036
1037	1	2010-09-08	0	610	10	1037
1012	2	2010-05-17	0	610	3	1012
1043	2	2010-04-11	0	606	21	1043
1016	1	2010-12-24	4	610	3	1016
1017	1	2010-12-31	4	610	3	1017
1042	2	2010-04-10	0	606	21	1042
1015	3	2010-12-31	0	610	2	1015
1040	2	2010-04-09	0	606	21	1040
1018	1	2010-12-24	0	610	2	1018
1078	2	2010-07-10	0	606	28	1078
1079	2	2010-07-08	0	606	28	1079
1013	2	2010-05-17	0	610	4	1013
1019	1	2010-12-24	4	610	4	1019
1020	1	2010-12-31	4	610	4	1020
1076	2	2010-07-11	0	606	28	1076
1074	2	2010-07-05	0	606	28	1074
1038	2	2010-04-08	0	606	21	1038
1044	2	2010-04-05	0	606	21	1044
1039	2	2010-04-06	0	606	21	1039
1041	2	2010-04-07	0	606	21	1041
1028	1	2010-12-24	4	611	8	1028
1029	1	2010-05-03	0	610	8	1029
1030	1	2010-12-31	4	611	8	1030
1027	2	2010-12-24	4	611	7	1027
1026	2	2010-12-31	4	611	7	1026
1031	1	2010-05-03	0	610	7	1031
1075	2	2010-07-06	0	606	28	1075
1073	2	2010-07-07	0	606	28	1073
1077	2	2010-07-09	0	606	28	1077
1059	4	2010-06-26	0	606	25	1059
1064	4	2010-06-21	0	606	25	1064
1065	4	2010-06-22	0	606	25	1065
1060	4	2010-06-23	0	606	25	1060
1061	4	2010-06-24	0	606	25	1061
1063	4	2010-06-27	0	606	25	1063
1062	4	2010-06-25	0	606	25	1062
1048	4	2010-05-08	0	606	22	1048
1051	4	2010-05-09	0	606	22	1051
1047	4	2010-05-06	0	606	22	1047
1045	4	2010-05-07	0	606	22	1045
1050	4	2010-05-03	0	606	22	1050
1046	4	2010-05-04	0	606	22	1046
1049	4	2010-05-05	0	606	22	1049
1069	5	2010-06-30	0	606	26	1069
1066	5	2010-07-04	0	606	26	1066
1068	5	2010-06-29	0	606	26	1068
1072	5	2010-07-01	0	606	26	1072
1071	5	2010-07-03	0	606	26	1071
1070	5	2010-06-28	0	606	26	1070
1067	5	2010-07-02	0	606	26	1067
1092	3	2010-07-21	0	606	30	1092
1093	3	2010-07-19	0	606	30	1093
1087	3	2010-07-23	0	606	30	1087
1088	3	2010-07-22	0	606	30	1088
1090	3	2010-07-24	0	606	30	1090
1091	3	2010-07-20	0	606	30	1091
1089	3	2010-07-25	0	606	30	1089
1081	4	2010-07-13	0	606	29	1081
1082	4	2010-07-18	0	606	29	1082
1080	4	2010-07-14	0	606	29	1080
1086	4	2010-07-17	0	606	29	1086
1083	4	2010-07-12	0	606	29	1083
1084	4	2010-07-16	0	606	29	1084
1085	4	2010-07-15	0	606	29	1085
1054	4	2010-06-10	0	606	23	1054
1058	4	2010-06-07	0	606	23	1058
1056	4	2010-06-12	0	606	23	1056
1053	4	2010-06-09	0	606	23	1053
1055	4	2010-06-13	0	606	23	1055
1052	4	2010-06-11	0	606	23	1052
1057	4	2010-06-08	0	606	23	1057
1094	5	2010-07-26	0	606	31	1094
1095	5	2010-08-01	0	606	31	1095
1099	5	2010-07-29	0	606	31	1099
1096	5	2010-07-30	0	606	31	1096
1098	5	2010-07-31	0	606	31	1098
1097	5	2010-07-27	0	606	31	1097
1100	5	2010-07-28	0	606	31	1100
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable, code) FROM stdin;
606	6	HOLIDAY	red	t	\N
607	5	SICK_LEAVE	red	t	\N
608	4	LEAVE	red	t	\N
609	3	STRIKE	red	t	\N
610	2	BANK_HOLIDAY	red	t	\N
611	1	WORKABLE_BANK_HOLIDAY	orange	f	\N
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts) FROM stdin;
202	15	1	1A	t	f	t	t	t	f	f	f	f
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, advance_measurement_id, consolidation_id) FROM stdin;
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, advance_assignment_id, inadvance_assignment_id) FROM stdin;
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled, code) FROM stdin;
59893	2	Categoria 1	t	e36c8cef-f6da-44dd-a928-ef3422ea50e8
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
538	1	7f15e574-3324-4619-ad13-e9d489df39bd	Grupo 4	t	131083	\N
539	1	4ff7f40d-fd87-4951-afdc-12d592fb932a	Grupo 5	t	131083	\N
540	1	96cad611-2f5f-42c2-97d8-206f7e11426f	Grupo 3	t	131083	\N
516	1	951f9e26-af79-4a9c-86bb-ac600de6c060	Galicia	t	131079	515
519	1	5d6c356a-1402-4021-80e5-edfa6e44d905	Asturias	t	131079	515
521	1	37eded8b-6d1c-4943-afc4-993e22d3710c	Andalucia	t	131079	515
523	1	befa200d-3357-4bd2-972a-8bea2deec57b	País Vasco	t	131079	515
517	1	6504edc6-b1bb-4608-a35a-f54b39568f11	Ferrol	t	131079	516
518	1	36dfe095-76cc-40a9-acf2-e36cf5700358	Vigo	t	131079	516
520	1	fd5aca42-3628-42b0-af37-0b48d0eabe8c	Gijon	t	131079	519
522	1	07e6ed2f-d8f6-4ce9-b18d-befda9750d51	Cádiz	t	131079	521
524	1	f2b1ba01-e77d-4ba5-b9bb-ff873005ef32	San Sebastián	t	131079	523
525	1	c89d53f1-9cfd-4b4c-b07a-b0979efc66b3	Soldadura primeiro nivel	t	131080	\N
526	1	66d2facc-8844-4b70-bfe6-ea7f8c113ec0	Soldadura segundo nivel	t	131080	\N
527	1	069b0e09-37cc-4e82-ba98-926f3a237ccf	Soldadura terceiro nivel	t	131080	\N
528	1	77bef919-a2de-43d1-8cb1-c10060e6b0e8	Practicas segundo ano	t	131081	\N
529	1	c9f1be55-2f20-4cee-abb1-db7f39cf734c	Practicas primeiro ano	t	131081	\N
530	1	19577ea6-672f-415e-a0a7-32185e0e359a	Por obra	t	131081	\N
531	1	c5877b00-cab7-4d1e-a0e1-048c8094ea12	Indefinido	t	131081	\N
532	1	07f99679-ca00-4028-bb94-2996a1e502b1	Temporal	t	131081	\N
505	14	07508303-5089-407b-8fe9-f5806e36affa	medicalLeave	t	131072	\N
506	13	ba745a87-7f56-4104-bd95-1ca311277e06	paternityLeave	t	131072	\N
507	4	00dd4e65-2fea-46ec-a4ce-2c0aa01da7fd	hiredResourceWorkingRelationship	t	131076	\N
508	3	c27ca63f-c4cb-46c1-a9d5-d055a725913c	firedResourceWorkingRelationship	t	131076	\N
515	1	c12c9ade-1a33-4256-988d-36123a06e63d	España	t	131079	\N
541	1	8a6f0c8c-85e9-441f-a8e9-7775411042b5	Grupo 2	t	131083	\N
542	1	2ae840f0-0292-4d12-a774-76cf31298872	Grupo 1	t	131083	\N
533	1	b22867b4-d952-4b3d-9451-fbd24b041a87	Certificado medico 2010	t	131082	\N
534	1	0583346a-ee5b-48d6-9a19-54791d0ce077	Certificado medico 2009	t	131082	\N
535	1	63f30986-f717-42fe-96aa-5d690a97f628	Pase entrada astillero Barreras	t	131082	\N
536	1	280e7e3f-bdc8-4611-84a6-7f626351f3e7	Pase entrada astillero Navalia	t	131082	\N
537	1	234cd3e9-61c2-4689-afb7-13b80ac3f539	Pase entrada astillero Vulcano	t	131082	\N
511	3	99887ae2-8bb7-4275-a427-d920c361fc4d	Califugador	t	131078	\N
513	3	8669109d-8d86-4ac1-89cd-9541f7fc4d53	Soldador	t	131078	\N
509	3	321d79f1-ffb3-4a88-aeb6-4ae4959354bd	Carpinteiro	t	131078	\N
514	3	d1933e2d-2aa9-4ba2-8911-f7dabb0b5995	Pintor	t	131078	\N
512	3	5ef81e42-223e-4f01-99c5-500849e55024	Electricista	t	131078	\N
510	3	9321f46a-6901-448f-8997-ccd3e204d160	Soldador Submarino	t	131078	\N
41715	2	6fdb7933-2072-4bb9-abfc-c62e2e20b798	salud muy buena	t	13500416	\N
41714	2	c6cd46cb-fdae-4626-920a-39a9df4f8976	salud mala	t	13500416	\N
41713	2	127d6d50-282b-4e2f-97e1-df10bd0b1980	salud media	t	13500416	\N
51409	1	22f67a6d-5ade-4693-89eb-12363980232e	caracola	t	131074	\N
51410	1	13f9928d-870b-41e1-85b0-fd4cee6855ed	hola	t	131074	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
24108	DIRECT	4	\N	23636	\N	541	\N	\N
24109	INDIRECT	4	\N	23637	\N	541	24108	t
24110	INDIRECT	4	23937	\N	\N	541	24108	t
24111	INDIRECT	4	\N	23638	\N	541	24108	t
24112	INDIRECT	4	23938	\N	\N	541	24108	t
24113	DIRECT	4	\N	23639	\N	541	\N	\N
24114	INDIRECT	4	\N	23640	\N	541	24113	t
24115	INDIRECT	4	23939	\N	\N	541	24113	t
24116	INDIRECT	4	\N	23641	\N	541	24113	t
24117	INDIRECT	4	23940	\N	\N	541	24113	t
24118	INDIRECT	4	\N	23642	\N	541	24113	t
24119	INDIRECT	4	23941	\N	\N	541	24113	t
24120	DIRECT	4	\N	23643	\N	541	\N	\N
24121	INDIRECT	4	\N	23644	\N	541	24120	t
24122	INDIRECT	4	23942	\N	\N	541	24120	t
24301	DIRECT	3	\N	23640	\N	514	\N	\N
24302	INDIRECT	3	23939	\N	\N	514	24301	t
24303	DIRECT	3	\N	23641	\N	514	\N	\N
24304	INDIRECT	3	23940	\N	\N	514	24303	t
24305	DIRECT	3	\N	23642	\N	514	\N	\N
24306	INDIRECT	3	23941	\N	\N	514	24305	t
24307	DIRECT	3	\N	23644	\N	511	\N	\N
24308	INDIRECT	3	23942	\N	\N	511	24307	t
24123	INDIRECT	4	\N	23645	\N	541	24120	t
24309	DIRECT	3	\N	23645	\N	511	\N	\N
24310	INDIRECT	3	23943	\N	\N	511	24309	t
24124	INDIRECT	4	23943	\N	\N	541	24120	t
24125	INDIRECT	4	\N	23646	\N	541	24120	t
24311	DIRECT	3	\N	23646	\N	511	\N	\N
24126	INDIRECT	4	23944	\N	\N	541	24120	t
24312	INDIRECT	3	23944	\N	\N	511	24311	t
27817	DIRECT	3	\N	23649	\N	540	\N	\N
27818	INDIRECT	3	\N	23650	\N	540	27817	t
27819	INDIRECT	3	23945	\N	\N	540	27817	t
27820	INDIRECT	3	\N	23651	\N	540	27817	t
27821	INDIRECT	3	23946	\N	\N	540	27817	t
27822	DIRECT	3	\N	23652	\N	540	\N	\N
27823	INDIRECT	3	\N	23653	\N	540	27822	t
27824	INDIRECT	3	23947	\N	\N	540	27822	t
27825	INDIRECT	3	\N	23654	\N	540	27822	t
27826	INDIRECT	3	23948	\N	\N	540	27822	t
27827	INDIRECT	3	\N	23655	\N	540	27822	t
27828	INDIRECT	3	23949	\N	\N	540	27822	t
27829	DIRECT	3	\N	23656	\N	540	\N	\N
27830	INDIRECT	3	\N	23657	\N	540	27829	t
27831	INDIRECT	3	23950	\N	\N	540	27829	t
27832	INDIRECT	3	\N	23658	\N	540	27829	t
27833	INDIRECT	3	23951	\N	\N	540	27829	t
27834	INDIRECT	3	\N	23659	\N	540	27829	t
27835	INDIRECT	3	23952	\N	\N	540	27829	t
27938	DIRECT	2	\N	23653	\N	514	\N	\N
27939	INDIRECT	2	23947	\N	\N	514	27938	t
27940	DIRECT	2	\N	23654	\N	514	\N	\N
27941	INDIRECT	2	23948	\N	\N	514	27940	t
27942	DIRECT	2	\N	23655	\N	514	\N	\N
27943	INDIRECT	2	23949	\N	\N	514	27942	t
27944	DIRECT	2	\N	23657	\N	509	\N	\N
27945	INDIRECT	2	23950	\N	\N	509	27944	t
27946	DIRECT	2	\N	23658	\N	509	\N	\N
27947	INDIRECT	2	23951	\N	\N	509	27946	t
27948	DIRECT	2	\N	23659	\N	509	\N	\N
27949	INDIRECT	2	23952	\N	\N	509	27948	t
33955	INDIRECT	3	23955	\N	\N	538	33953	t
36891	DIRECT	3	\N	23675	\N	539	\N	\N
33956	INDIRECT	3	\N	23667	\N	538	33953	t
36892	INDIRECT	3	\N	23676	\N	539	36891	t
33957	INDIRECT	3	23956	\N	\N	538	33953	t
33958	INDIRECT	3	\N	23668	\N	538	33953	t
36893	INDIRECT	3	23961	\N	\N	539	36891	t
33959	INDIRECT	3	23957	\N	\N	538	33953	t
36894	INDIRECT	3	\N	23677	\N	539	36891	t
33960	DIRECT	3	\N	23669	\N	538	\N	\N
33961	INDIRECT	3	\N	23670	\N	538	33960	t
36895	INDIRECT	3	23962	\N	\N	539	36891	t
36896	DIRECT	3	\N	23678	\N	539	\N	\N
33962	INDIRECT	3	23958	\N	\N	538	33960	t
33963	INDIRECT	3	\N	23671	\N	538	33960	t
33964	INDIRECT	3	23959	\N	\N	538	33960	t
33965	INDIRECT	3	\N	23672	\N	538	33960	t
36897	INDIRECT	3	\N	23679	\N	539	36896	t
36898	INDIRECT	3	23963	\N	\N	539	36896	t
36899	INDIRECT	3	\N	23680	\N	539	36896	t
33948	DIRECT	3	\N	23662	\N	538	\N	\N
33949	INDIRECT	3	\N	23663	\N	538	33948	t
33950	INDIRECT	3	23953	\N	\N	538	33948	t
33951	INDIRECT	3	\N	23664	\N	538	33948	t
33952	INDIRECT	3	23954	\N	\N	538	33948	t
33953	DIRECT	3	\N	23665	\N	538	\N	\N
33954	INDIRECT	3	\N	23666	\N	538	33953	t
33966	INDIRECT	3	23960	\N	\N	538	33960	t
34091	DIRECT	2	\N	23666	\N	513	\N	\N
34092	INDIRECT	2	23955	\N	\N	513	34091	t
34093	DIRECT	2	\N	23667	\N	513	\N	\N
34094	INDIRECT	2	23956	\N	\N	513	34093	t
34095	DIRECT	2	\N	23668	\N	513	\N	\N
34096	INDIRECT	2	23957	\N	\N	513	34095	t
34097	DIRECT	2	\N	23670	\N	509	\N	\N
34098	INDIRECT	2	23958	\N	\N	509	34097	t
34099	DIRECT	2	\N	23672	\N	509	\N	\N
34100	INDIRECT	2	23960	\N	\N	509	34099	t
36900	INDIRECT	3	23964	\N	\N	539	36896	t
36901	INDIRECT	3	\N	23681	\N	539	36896	t
36902	INDIRECT	3	23965	\N	\N	539	36896	t
37162	DIRECT	2	\N	23679	\N	514	\N	\N
37163	INDIRECT	2	23963	\N	\N	514	37162	t
37164	DIRECT	2	\N	23680	\N	514	\N	\N
37165	INDIRECT	2	23964	\N	\N	514	37164	t
37166	DIRECT	2	\N	23681	\N	514	\N	\N
37167	INDIRECT	2	23965	\N	\N	514	37166	t
37168	DIRECT	2	\N	23682	\N	539	\N	\N
37169	DIRECT	2	\N	23683	\N	511	\N	\N
37170	INDIRECT	2	\N	23683	\N	539	37168	t
37171	INDIRECT	2	23966	\N	\N	511	37169	t
37172	INDIRECT	2	23966	\N	\N	539	37168	t
37173	INDIRECT	2	\N	23684	\N	539	37168	t
37174	DIRECT	2	\N	23684	\N	511	\N	\N
37175	INDIRECT	2	23967	\N	\N	511	37174	t
37176	INDIRECT	2	23967	\N	\N	539	37168	t
37177	DIRECT	2	\N	23685	\N	511	\N	\N
37178	INDIRECT	2	\N	23685	\N	539	37168	t
37179	INDIRECT	2	23968	\N	\N	511	37177	t
37180	INDIRECT	2	23968	\N	\N	539	37168	t
2307	DIRECT	20	\N	1622	\N	542	\N	\N
2308	INDIRECT	20	\N	1623	\N	542	2307	t
2423	DIRECT	19	\N	1623	\N	513	\N	\N
2424	INDIRECT	19	1921	\N	\N	513	2423	t
2302	DIRECT	20	\N	1619	\N	542	\N	\N
2303	INDIRECT	20	\N	1620	\N	542	2302	t
2304	INDIRECT	20	1919	\N	\N	542	2302	t
2305	INDIRECT	20	\N	1621	\N	542	2302	t
2306	INDIRECT	20	1920	\N	\N	542	2302	t
57966	DIRECT	1	\N	\N	57842	542	\N	\N
57967	INDIRECT	1	\N	\N	57843	542	57966	t
57968	INDIRECT	1	58132	\N	\N	542	57966	t
57969	INDIRECT	1	\N	\N	57844	542	57966	t
57970	INDIRECT	1	58133	\N	\N	542	57966	t
57971	DIRECT	1	\N	\N	57845	542	\N	\N
57972	DIRECT	1	\N	\N	57846	513	\N	\N
57973	INDIRECT	1	\N	\N	57846	542	57971	t
58176	INDIRECT	1	58134	\N	\N	513	57972	t
58177	INDIRECT	1	58134	\N	\N	542	57971	t
58178	INDIRECT	1	\N	\N	57847	542	57971	t
58179	DIRECT	1	\N	\N	57847	513	\N	\N
58180	INDIRECT	1	58135	\N	\N	542	57971	t
58181	INDIRECT	1	58135	\N	\N	513	58179	t
58182	INDIRECT	1	\N	\N	57848	542	57971	t
58183	DIRECT	1	\N	\N	57848	513	\N	\N
58184	INDIRECT	1	58136	\N	\N	513	58183	t
58185	INDIRECT	1	58136	\N	\N	542	57971	t
58186	DIRECT	1	\N	\N	57849	542	\N	\N
58187	DIRECT	1	\N	\N	57850	509	\N	\N
58188	INDIRECT	1	\N	\N	57850	542	58186	t
58189	INDIRECT	1	58137	\N	\N	509	58187	t
58190	INDIRECT	1	58137	\N	\N	542	58186	t
58191	INDIRECT	1	\N	\N	57851	542	58186	t
58192	DIRECT	1	\N	\N	57851	509	\N	\N
58230	DIRECT	2	\N	58301	\N	542	\N	\N
58231	INDIRECT	2	\N	58302	\N	542	58230	t
58232	INDIRECT	2	58170	\N	\N	542	58230	t
58233	INDIRECT	2	\N	58303	\N	542	58230	t
58234	INDIRECT	2	58171	\N	\N	542	58230	t
58235	DIRECT	2	\N	58304	\N	542	\N	\N
58236	INDIRECT	2	\N	58305	\N	542	58235	t
58237	DIRECT	2	\N	58305	\N	513	\N	\N
58238	INDIRECT	2	58172	\N	\N	513	58237	t
58239	INDIRECT	2	58172	\N	\N	542	58235	t
58240	INDIRECT	2	\N	58306	\N	542	58235	t
58241	DIRECT	2	\N	58306	\N	513	\N	\N
58242	INDIRECT	2	58173	\N	\N	513	58241	t
58243	INDIRECT	2	58173	\N	\N	542	58235	t
58244	DIRECT	2	\N	58307	\N	513	\N	\N
58245	INDIRECT	2	\N	58307	\N	542	58235	t
58246	INDIRECT	2	58174	\N	\N	542	58235	t
58247	INDIRECT	2	58174	\N	\N	513	58244	t
58248	DIRECT	2	\N	58308	\N	542	\N	\N
58249	INDIRECT	2	\N	58309	\N	542	58248	t
58250	DIRECT	2	\N	58309	\N	509	\N	\N
58193	INDIRECT	1	58138	\N	\N	509	58192	t
58194	INDIRECT	1	58138	\N	\N	542	58186	t
58195	DIRECT	1	\N	\N	57852	509	\N	\N
58196	INDIRECT	1	\N	\N	57852	542	58186	t
58197	INDIRECT	1	58139	\N	\N	509	58195	t
58198	INDIRECT	1	58139	\N	\N	542	58186	t
58251	INDIRECT	2	58175	\N	\N	509	58250	t
58252	INDIRECT	2	58175	\N	\N	542	58248	t
58253	INDIRECT	2	\N	58310	\N	542	58248	t
58254	DIRECT	2	\N	58310	\N	509	\N	\N
58255	INDIRECT	2	58479	\N	\N	509	58254	t
58256	INDIRECT	2	58479	\N	\N	542	58248	t
58257	INDIRECT	2	\N	58311	\N	542	58248	t
58258	DIRECT	2	\N	58311	\N	509	\N	\N
58259	INDIRECT	2	58480	\N	\N	509	58258	t
58260	INDIRECT	2	58480	\N	\N	542	58248	t
2318	INDIRECT	20	1925	\N	\N	542	2314	t
2432	INDIRECT	19	1925	\N	\N	509	2431	t
2309	INDIRECT	20	1921	\N	\N	542	2307	t
2425	DIRECT	19	\N	1624	\N	513	\N	\N
2310	INDIRECT	20	\N	1624	\N	542	2307	t
2426	INDIRECT	19	1922	\N	\N	513	2425	t
2311	INDIRECT	20	1922	\N	\N	542	2307	t
2312	INDIRECT	20	\N	1625	\N	542	2307	t
2427	DIRECT	19	\N	1625	\N	513	\N	\N
2428	INDIRECT	19	1923	\N	\N	513	2427	t
61712	DIRECT	6	1923	\N	\N	41714	\N	\N
2313	INDIRECT	20	1923	\N	\N	542	2307	t
2314	DIRECT	20	\N	1626	\N	542	\N	\N
2429	DIRECT	19	\N	1627	\N	509	\N	\N
2315	INDIRECT	20	\N	1627	\N	542	2314	t
2316	INDIRECT	20	1924	\N	\N	542	2314	t
2430	INDIRECT	19	1924	\N	\N	509	2429	t
2431	DIRECT	19	\N	1628	\N	509	\N	\N
2317	INDIRECT	20	\N	1628	\N	542	2314	t
2319	INDIRECT	20	\N	1629	\N	542	2314	t
2433	DIRECT	19	\N	1629	\N	509	\N	\N
2320	INDIRECT	20	1926	\N	\N	542	2314	t
2434	INDIRECT	19	1926	\N	\N	509	2433	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
1515	1	033bd704-c76d-4f45-8c64-f729c8b663e1	2010-03-01 20:35:51.726	\N	f	513	1314
1516	1	6ab18f95-8b6a-4908-8bd1-ff1ac3d1f52b	2010-03-01 20:35:37.915	\N	f	542	1314
1527	1	099e4093-753c-4951-b36b-0f33facd28ac	2010-03-01 00:00:00	\N	f	513	1326
1528	1	2acffe07-9b00-4bea-80b6-71dc32334334	2010-03-01 21:22:20.06	\N	f	538	1326
1532	1	5d23e9f0-afd1-4613-817f-8f01e663e0dd	2010-03-01 22:36:47.756	\N	f	540	1322
1524	3	2d762b09-3ed4-4f28-adb2-a203b0c07353	2010-03-01 20:57:54.107	\N	t	512	1322
1525	2	4858a83e-1260-4afe-b46d-bda5e3ea29fd	2010-03-01 20:59:16.882	\N	t	510	1322
1533	1	0db2812f-d58a-4bbf-a89f-98a25741fbc4	2010-03-01 22:37:01.009	\N	f	509	1322
19898	1	ac0403bf-8d59-4305-99a4-a5658162a55e	2010-03-01 00:00:00	\N	f	540	19496
19899	1	61222007-0330-484f-b7ae-24456d3ec46b	2010-03-01 00:00:00	\N	f	538	19498
1517	3	c5a26834-165a-4a3b-9d5c-b7aadb225eb6	2010-03-01 20:52:20.246	\N	f	509	1316
1518	3	ea42cb76-331e-4d6d-bcbb-33ad348ec4f0	2010-03-01 20:52:03.961	\N	f	542	1316
1526	4	c3bff800-bb69-40d8-977a-126c4ac2df5e	2010-03-01 20:59:50.035	\N	t	512	1324
1534	3	9b31b2ae-a812-4b6e-b282-551d4144c75d	2010-03-01 00:00:00	\N	f	514	1324
19900	1	579ff199-438f-4bc2-8cd3-9e4773c7617e	2010-03-01 00:00:00	\N	f	540	1324
19901	1	ebd1970e-f0c6-42eb-9b0b-cd4b98fad5ff	2010-03-07 19:49:50.619	\N	f	514	1330
19902	1	6ca93ec4-6ae8-4857-9ef5-6f8aa11a7415	2010-03-07 19:49:15.944	\N	f	539	1330
19904	1	c8bae97d-3915-4f73-aadd-5a18bcf795b0	2010-03-07 19:50:58.538	\N	f	539	19500
3131	4	08368b54-72fd-4006-b028-4e23db681fde	2010-03-02 11:41:44.278	\N	f	542	2728
19897	2	df4796f7-4be6-49bf-8144-3ed291d910eb	2010-03-01 00:00:00	\N	f	541	19494
1530	3	2d581c81-0b35-40aa-bd73-110f338e3c31	2010-03-01 21:23:05.92	\N	f	509	1328
1529	3	e74e278e-55db-46c3-b97d-d499f08d061f	2010-03-01 21:22:57.304	\N	f	538	1328
1520	3	cf997d10-1194-4060-bc0c-ea291cff6c73	2010-03-01 20:52:53.72	\N	f	541	1318
1519	3	3d1dbdeb-1fbc-4d45-b703-7c807be10327	2010-03-01 20:53:11.604	\N	f	514	1318
61206	1	ad5bf1fb-695c-46bd-9ba1-b4ee2f2d34e1	2010-04-15 12:09:28.346	\N	f	542	40199
61207	2	b18c20cb-67ff-4889-86e5-355d7e7b9bd1	2010-04-15 12:33:17.534	\N	f	511	61308
97465	1	16d328f4-fc8e-40ef-ab39-05420871bf93	2010-04-29 22:58:33.042	\N	f	531	50401
1523	4	ed5617c1-ee60-4aaa-91d0-01bb170e23f4	2010-03-01 20:56:23.745	\N	f	541	1320
1522	6	cca09834-192c-4c1d-b394-c586b87682d2	2010-03-01 20:54:37.921	\N	f	511	1320
1521	6	d0c67f28-d9e2-4022-af62-6f3a6b1d3351	2010-02-28 00:00:00	\N	t	541	1320
97466	1	2ca2b0a7-8fc2-413e-b82c-e22daa6d7104	2010-04-29 22:58:44.389	\N	f	530	1320
1531	4	62c3e29b-a10b-4b25-8ce4-64f0deaa9f17	2010-03-01 21:24:44.421	\N	f	511	1332
97467	1	434eb85b-ddfe-463b-850e-61d0d892a4c6	2010-04-29 22:58:58.318	\N	f	518	1332
19903	2	c433c844-21bb-477d-bf69-dc5fdcf28be0	2010-03-07 00:00:00	\N	f	539	1332
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource, generatecode) FROM stdin;
131081	1	f2a1c236-8bcc-416e-97aa-39c6429f9897	Contrato laboral	tipo de contrato	t	t	t	0	t
131082	1	781a074c-0755-45d0-987e-37061d5e77fb	Documentación	\N	t	f	t	0	t
131083	1	51d107fc-66a3-466a-9f61-b8c9edacf2c2	Grupo	Grupo de pertenza do traballador	f	f	t	1	t
131072	15	cc665415-4ba7-4c8e-ac75-d01cab17f073	LEAVE	Leave	f	f	t	1	t
131073	11	900f947e-4227-44a9-8f93-2412aa0528af	CATEGORY	Professional category	t	t	t	1	t
131075	7	e990dc33-37c0-43ab-8e6e-3f4dbdafb6f0	JOB	Job	t	t	t	1	t
131076	5	a28da058-2ed6-4508-99ef-6ead99194953	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1	t
131077	1	113a187d-cff8-48eb-9973-73ba721b9034	LOCATION_GROUP	Location where the resource work	t	f	t	0	t
131079	1	b91be904-0c35-42b4-b7ad-4c6e097651ba	Localización	\N	f	t	t	1	t
131080	1	86093247-798f-4a9f-8b53-9d7ade8ef74c	Capacitacións de soldadura	Habilidades para soldar	f	f	t	0	t
131078	3	66f8f0e3-0e7f-4195-8bf6-9918235443f3	Tipo de traballo	Tipo de traballo	t	f	t	1	t
13500416	2	4362058d-e5dc-40dd-909a-3ccac7731a01	salud	criterio de lo saludable o no que esta un trabajador	t	t	t	0	t
131074	10	0082936b-0115-4dca-87e2-b5e021d33e30	TRAINING	Training courses and labor training	t	t	t	1	t
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id, consolidated) FROM stdin;
86351	GENERIC_DAY	1	6	2010-10-26	19496	\N	55957	\N	\N
86352	GENERIC_DAY	1	5	2010-11-01	1324	\N	55957	\N	\N
86353	GENERIC_DAY	1	6	2010-10-18	1324	\N	55957	\N	\N
86354	GENERIC_DAY	1	0	2010-10-16	19496	\N	55957	\N	\N
86355	GENERIC_DAY	1	0	2010-10-30	19496	\N	55957	\N	\N
86356	GENERIC_DAY	1	0	2010-10-23	1322	\N	55957	\N	\N
86357	GENERIC_DAY	1	6	2010-10-14	1324	\N	55957	\N	\N
86358	GENERIC_DAY	1	2	2010-10-15	19496	\N	55957	\N	\N
86359	GENERIC_DAY	1	3	2010-10-29	1322	\N	55957	\N	\N
86360	GENERIC_DAY	1	0	2010-10-24	1324	\N	55957	\N	\N
86361	GENERIC_DAY	1	6	2010-10-27	1324	\N	55957	\N	\N
86362	GENERIC_DAY	1	6	2010-10-21	19496	\N	55957	\N	\N
86363	GENERIC_DAY	1	0	2010-10-31	1322	\N	55957	\N	\N
86364	GENERIC_DAY	1	0	2010-10-23	1324	\N	55957	\N	\N
86365	GENERIC_DAY	1	3	2010-10-15	1322	\N	55957	\N	\N
86366	GENERIC_DAY	1	3	2010-10-29	1324	\N	55957	\N	\N
86367	GENERIC_DAY	1	0	2010-10-17	19496	\N	55957	\N	\N
86368	GENERIC_DAY	1	6	2010-10-14	1322	\N	55957	\N	\N
86369	GENERIC_DAY	1	6	2010-10-27	19496	\N	55957	\N	\N
86370	GENERIC_DAY	1	2	2010-10-22	19496	\N	55957	\N	\N
86371	GENERIC_DAY	1	6	2010-10-25	1324	\N	55957	\N	\N
86372	GENERIC_DAY	1	5	2010-11-01	1322	\N	55957	\N	\N
86373	GENERIC_DAY	1	6	2010-10-20	19496	\N	55957	\N	\N
86374	GENERIC_DAY	1	2	2010-10-29	19496	\N	55957	\N	\N
86375	GENERIC_DAY	1	6	2010-10-20	1324	\N	55957	\N	\N
86376	GENERIC_DAY	1	0	2010-10-16	1324	\N	55957	\N	\N
86377	GENERIC_DAY	1	6	2010-10-20	1322	\N	55957	\N	\N
86378	GENERIC_DAY	1	0	2010-10-31	19496	\N	55957	\N	\N
86379	GENERIC_DAY	1	6	2010-10-28	1322	\N	55957	\N	\N
86380	GENERIC_DAY	1	0	2010-10-16	1322	\N	55957	\N	\N
86381	GENERIC_DAY	1	4	2010-11-01	19496	\N	55957	\N	\N
86382	GENERIC_DAY	1	0	2010-10-24	19496	\N	55957	\N	\N
86383	GENERIC_DAY	1	6	2010-10-26	1322	\N	55957	\N	\N
86384	GENERIC_DAY	1	6	2010-10-19	1322	\N	55957	\N	\N
86385	GENERIC_DAY	1	0	2010-10-17	1322	\N	55957	\N	\N
86386	GENERIC_DAY	1	3	2010-10-22	1322	\N	55957	\N	\N
86387	GENERIC_DAY	1	6	2010-10-28	1324	\N	55957	\N	\N
86388	GENERIC_DAY	1	0	2010-10-30	1324	\N	55957	\N	\N
86389	GENERIC_DAY	1	6	2010-10-19	1324	\N	55957	\N	\N
86390	GENERIC_DAY	1	6	2010-10-26	1324	\N	55957	\N	\N
86391	GENERIC_DAY	1	6	2010-10-19	19496	\N	55957	\N	\N
86392	GENERIC_DAY	1	0	2010-10-23	19496	\N	55957	\N	\N
86393	GENERIC_DAY	1	4	2010-05-28	1318	\N	20275	\N	\N
86394	GENERIC_DAY	1	0	2010-06-06	1318	\N	20275	\N	\N
86395	GENERIC_DAY	1	9	2010-05-12	1318	\N	20275	\N	\N
86396	GENERIC_DAY	1	0	2010-05-08	1318	\N	20275	\N	\N
86397	GENERIC_DAY	1	0	2010-05-17	1318	\N	20275	\N	\N
86398	GENERIC_DAY	1	0	2010-05-15	1318	\N	20275	\N	\N
86399	GENERIC_DAY	1	4	2010-05-14	1318	\N	20275	\N	\N
86400	GENERIC_DAY	1	0	2010-06-05	1318	\N	20275	\N	\N
86401	GENERIC_DAY	1	9	2010-06-14	1318	\N	20275	\N	\N
86402	GENERIC_DAY	1	9	2010-06-15	1318	\N	20275	\N	\N
86403	GENERIC_DAY	1	9	2010-05-26	1318	\N	20275	\N	\N
86404	GENERIC_DAY	1	9	2010-05-25	1318	\N	20275	\N	\N
86405	GENERIC_DAY	1	9	2010-05-31	1318	\N	20275	\N	\N
86406	GENERIC_DAY	1	9	2010-06-01	1318	\N	20275	\N	\N
86407	GENERIC_DAY	1	4	2010-06-18	1318	\N	20275	\N	\N
86408	GENERIC_DAY	1	4	2010-06-04	1318	\N	20275	\N	\N
86409	GENERIC_DAY	1	9	2010-06-02	1318	\N	20275	\N	\N
86410	GENERIC_DAY	1	9	2010-06-16	1318	\N	20275	\N	\N
86411	GENERIC_DAY	1	0	2010-05-16	1318	\N	20275	\N	\N
86412	GENERIC_DAY	1	0	2010-05-23	1318	\N	20275	\N	\N
86413	GENERIC_DAY	1	4	2010-05-21	1318	\N	20275	\N	\N
86414	GENERIC_DAY	1	0	2010-06-20	1318	\N	20275	\N	\N
86415	GENERIC_DAY	1	9	2010-06-03	1318	\N	20275	\N	\N
86416	GENERIC_DAY	1	9	2010-05-11	1318	\N	20275	\N	\N
86417	GENERIC_DAY	1	9	2010-06-21	1318	\N	20275	\N	\N
86418	GENERIC_DAY	1	0	2010-05-29	1318	\N	20275	\N	\N
86419	GENERIC_DAY	1	9	2010-05-24	1318	\N	20275	\N	\N
86420	GENERIC_DAY	1	9	2010-05-18	1318	\N	20275	\N	\N
86421	GENERIC_DAY	1	0	2010-05-22	1318	\N	20275	\N	\N
86422	GENERIC_DAY	1	0	2010-05-30	1318	\N	20275	\N	\N
86423	GENERIC_DAY	1	9	2010-05-19	1318	\N	20275	\N	\N
86424	GENERIC_DAY	1	9	2010-06-17	1318	\N	20275	\N	\N
86425	GENERIC_DAY	1	9	2010-05-10	1318	\N	20275	\N	\N
86426	GENERIC_DAY	1	0	2010-05-09	1318	\N	20275	\N	\N
44061	GENERIC_DAY	33	0	2010-03-27	1314	\N	20210	\N	\N
44069	GENERIC_DAY	33	8	2010-03-22	1314	\N	20210	\N	\N
44081	GENERIC_DAY	33	8	2010-03-29	1314	\N	20210	\N	\N
44054	GENERIC_DAY	33	0	2010-04-03	1314	\N	20210	\N	\N
44071	GENERIC_DAY	33	8	2010-03-10	1314	\N	20210	\N	\N
44076	GENERIC_DAY	33	8	2010-03-23	1314	\N	20210	\N	\N
44080	GENERIC_DAY	33	8	2010-03-25	1314	\N	20210	\N	\N
86427	GENERIC_DAY	1	0	2010-06-19	1318	\N	20275	\N	\N
86428	GENERIC_DAY	1	9	2010-05-20	1318	\N	20275	\N	\N
86429	GENERIC_DAY	1	9	2010-05-13	1318	\N	20275	\N	\N
86430	GENERIC_DAY	1	9	2010-05-27	1318	\N	20275	\N	\N
86431	GENERIC_DAY	1	2	2010-07-08	1318	\N	20276	\N	\N
86432	GENERIC_DAY	1	9	2010-07-06	1318	\N	20276	\N	\N
86433	GENERIC_DAY	1	9	2010-07-05	1318	\N	20276	\N	\N
86434	GENERIC_DAY	1	0	2010-07-04	1318	\N	20276	\N	\N
86435	GENERIC_DAY	1	0	2010-06-27	1318	\N	20276	\N	\N
86436	GENERIC_DAY	1	9	2010-06-29	1318	\N	20276	\N	\N
86437	GENERIC_DAY	1	9	2010-06-24	1318	\N	20276	\N	\N
86438	GENERIC_DAY	1	9	2010-06-28	1318	\N	20276	\N	\N
86439	GENERIC_DAY	1	9	2010-07-07	1318	\N	20276	\N	\N
86440	GENERIC_DAY	1	9	2010-06-30	1318	\N	20276	\N	\N
86441	GENERIC_DAY	1	4	2010-07-02	1318	\N	20276	\N	\N
83095	GENERIC_DAY	13	4	2010-04-05	1316	\N	82822	\N	\N
83108	GENERIC_DAY	13	0	2010-03-08	1314	\N	82822	\N	\N
83075	GENERIC_DAY	13	0	2010-03-24	1314	\N	82822	\N	\N
83079	GENERIC_DAY	13	8	2010-03-05	2728	\N	82822	\N	\N
83082	GENERIC_DAY	13	4	2010-03-31	1316	\N	82822	\N	\N
83084	GENERIC_DAY	13	4	2010-03-17	1316	\N	82822	\N	\N
83132	GENERIC_DAY	13	4	2010-03-30	1316	\N	82822	\N	\N
83099	GENERIC_DAY	13	0	2010-03-31	1314	\N	82822	\N	\N
83088	GENERIC_DAY	13	8	2010-03-11	2728	\N	82822	\N	\N
83069	GENERIC_DAY	13	4	2010-04-05	2728	\N	82822	\N	\N
83115	GENERIC_DAY	13	0	2010-03-28	1314	\N	82822	\N	\N
83128	GENERIC_DAY	13	8	2010-03-08	2728	\N	82822	\N	\N
83137	GENERIC_DAY	13	4	2010-03-23	2728	\N	82822	\N	\N
83089	GENERIC_DAY	13	0	2010-03-20	1316	\N	82822	\N	\N
83078	GENERIC_DAY	13	0	2010-04-04	1316	\N	82822	\N	\N
83135	GENERIC_DAY	13	0	2010-03-25	1314	\N	82822	\N	\N
83062	GENERIC_DAY	13	0	2010-03-19	1314	\N	82822	\N	\N
83102	GENERIC_DAY	13	0	2010-03-21	1316	\N	82822	\N	\N
83129	GENERIC_DAY	13	2	2010-03-19	2728	\N	82822	\N	\N
83141	GENERIC_DAY	13	0	2010-03-29	1314	\N	82822	\N	\N
83106	GENERIC_DAY	13	8	2010-03-10	2728	\N	82822	\N	\N
83077	GENERIC_DAY	13	0	2010-04-01	1314	\N	82822	\N	\N
83100	GENERIC_DAY	13	0	2010-03-13	1314	\N	82822	\N	\N
83124	GENERIC_DAY	13	0	2010-03-22	1314	\N	82822	\N	\N
83076	GENERIC_DAY	13	0	2010-03-10	1314	\N	82822	\N	\N
83144	GENERIC_DAY	13	0	2010-03-07	2728	\N	82822	\N	\N
25758	GENERIC_DAY	12	9	2010-03-09	1318	\N	20274	\N	\N
25804	GENERIC_DAY	12	9	2010-03-08	1318	\N	20274	\N	\N
25796	GENERIC_DAY	12	9	2010-03-25	1318	\N	20274	\N	\N
94302	GENERIC_DAY	3	0	2010-05-16	1314	\N	20240	\N	\N
94303	GENERIC_DAY	3	8	2010-05-11	1314	\N	20240	\N	\N
94304	GENERIC_DAY	3	0	2010-05-22	1314	\N	20240	\N	\N
94305	GENERIC_DAY	3	0	2010-04-18	1314	\N	20240	\N	\N
94306	GENERIC_DAY	3	8	2010-05-05	1314	\N	20240	\N	\N
94307	GENERIC_DAY	3	8	2010-05-14	1314	\N	20240	\N	\N
94308	GENERIC_DAY	3	0	2010-04-25	1314	\N	20240	\N	\N
94309	GENERIC_DAY	3	8	2010-05-07	1314	\N	20240	\N	\N
94310	GENERIC_DAY	3	0	2010-05-15	1314	\N	20240	\N	\N
83134	GENERIC_DAY	13	8	2010-03-09	2728	\N	82822	\N	\N
83142	GENERIC_DAY	13	6	2010-03-26	1316	\N	82822	\N	\N
83086	GENERIC_DAY	13	0	2010-04-04	1314	\N	82822	\N	\N
83092	GENERIC_DAY	13	0	2010-03-23	1314	\N	82822	\N	\N
83140	GENERIC_DAY	13	4	2010-03-15	1316	\N	82822	\N	\N
83064	GENERIC_DAY	13	2	2010-04-02	2728	\N	82822	\N	\N
94287	GENERIC_DAY	3	0	2010-05-01	1314	\N	20240	\N	\N
94288	GENERIC_DAY	3	8	2010-04-21	1314	\N	20240	\N	\N
94289	GENERIC_DAY	3	8	2010-05-12	1314	\N	20240	\N	\N
94290	GENERIC_DAY	3	8	2010-04-27	1314	\N	20240	\N	\N
94291	GENERIC_DAY	3	8	2010-05-10	1314	\N	20240	\N	\N
94292	GENERIC_DAY	3	0	2010-05-23	1314	\N	20240	\N	\N
94293	GENERIC_DAY	3	8	2010-05-04	1314	\N	20240	\N	\N
94294	GENERIC_DAY	3	0	2010-04-24	1314	\N	20240	\N	\N
94295	GENERIC_DAY	3	8	2010-05-06	1314	\N	20240	\N	\N
94296	GENERIC_DAY	3	8	2010-05-21	1314	\N	20240	\N	\N
94297	GENERIC_DAY	3	8	2010-04-29	1314	\N	20240	\N	\N
94298	GENERIC_DAY	3	8	2010-04-30	1314	\N	20240	\N	\N
94299	GENERIC_DAY	3	0	2010-05-09	1314	\N	20240	\N	\N
94300	GENERIC_DAY	3	8	2010-04-20	1314	\N	20240	\N	\N
94301	GENERIC_DAY	3	8	2010-04-22	1314	\N	20240	\N	\N
29884	SPECIFIC_DAY	8	5	2010-05-04	19496	20292	\N	\N	\N
29865	SPECIFIC_DAY	8	0	2010-04-10	19496	20292	\N	\N	\N
29839	SPECIFIC_DAY	8	5	2010-04-19	19496	20292	\N	\N	\N
29859	SPECIFIC_DAY	8	5	2010-03-31	19496	20292	\N	\N	\N
29877	SPECIFIC_DAY	8	5	2010-03-11	19496	20292	\N	\N	\N
29838	SPECIFIC_DAY	8	5	2010-04-12	19496	20292	\N	\N	\N
29835	SPECIFIC_DAY	8	0	2010-04-24	19496	20292	\N	\N	\N
29885	SPECIFIC_DAY	8	0	2010-04-25	19496	20292	\N	\N	\N
29841	SPECIFIC_DAY	8	0	2010-04-04	19496	20292	\N	\N	\N
29847	SPECIFIC_DAY	8	2	2010-04-30	19496	20292	\N	\N	\N
29848	SPECIFIC_DAY	8	0	2010-04-18	19496	20292	\N	\N	\N
29870	SPECIFIC_DAY	8	0	2010-03-20	19496	20292	\N	\N	\N
29871	SPECIFIC_DAY	8	0	2010-03-13	19496	20292	\N	\N	\N
29874	SPECIFIC_DAY	8	0	2010-03-28	19496	20292	\N	\N	\N
29889	SPECIFIC_DAY	8	5	2010-04-27	19496	20292	\N	\N	\N
29853	SPECIFIC_DAY	8	5	2010-03-10	19496	20292	\N	\N	\N
29867	SPECIFIC_DAY	8	5	2010-03-23	19496	20292	\N	\N	\N
29849	SPECIFIC_DAY	8	5	2010-04-28	19496	20292	\N	\N	\N
29843	SPECIFIC_DAY	8	5	2010-04-21	19496	20292	\N	\N	\N
29856	SPECIFIC_DAY	8	5	2010-04-14	19496	20292	\N	\N	\N
29880	SPECIFIC_DAY	8	2	2010-04-09	19496	20292	\N	\N	\N
29855	SPECIFIC_DAY	8	5	2010-03-16	19496	20292	\N	\N	\N
29861	SPECIFIC_DAY	8	5	2010-04-29	19496	20292	\N	\N	\N
29836	SPECIFIC_DAY	8	5	2010-04-13	19496	20292	\N	\N	\N
29846	SPECIFIC_DAY	8	2	2010-05-10	19496	20292	\N	\N	\N
29844	SPECIFIC_DAY	8	0	2010-05-08	19496	20292	\N	\N	\N
29830	SPECIFIC_DAY	8	5	2010-04-06	19496	20292	\N	\N	\N
29873	SPECIFIC_DAY	8	0	2010-05-01	19496	20292	\N	\N	\N
29866	SPECIFIC_DAY	8	5	2010-05-03	19496	20292	\N	\N	\N
29888	SPECIFIC_DAY	8	2	2010-03-12	19496	20292	\N	\N	\N
29837	SPECIFIC_DAY	8	5	2010-04-22	19496	20292	\N	\N	\N
29862	SPECIFIC_DAY	8	5	2010-05-05	19496	20292	\N	\N	\N
29834	SPECIFIC_DAY	8	5	2010-03-30	19496	20292	\N	\N	\N
29868	SPECIFIC_DAY	8	5	2010-03-24	19496	20292	\N	\N	\N
29883	SPECIFIC_DAY	8	5	2010-03-29	19496	20292	\N	\N	\N
29864	SPECIFIC_DAY	8	0	2010-04-17	19496	20292	\N	\N	\N
29869	SPECIFIC_DAY	8	5	2010-05-06	19496	20292	\N	\N	\N
29831	SPECIFIC_DAY	8	5	2010-03-08	19496	20292	\N	\N	\N
29857	SPECIFIC_DAY	8	5	2010-04-20	19496	20292	\N	\N	\N
29854	SPECIFIC_DAY	8	2	2010-03-26	19496	20292	\N	\N	\N
29852	SPECIFIC_DAY	8	0	2010-05-02	19496	20292	\N	\N	\N
29878	SPECIFIC_DAY	8	2	2010-04-16	19496	20292	\N	\N	\N
29886	SPECIFIC_DAY	8	5	2010-03-15	19496	20292	\N	\N	\N
71038	GENERIC_DAY	2	4	2010-04-23	1324	\N	30421	\N	\N
71059	GENERIC_DAY	2	0	2010-04-11	1324	\N	30421	\N	\N
71054	GENERIC_DAY	2	0	2010-04-24	1324	\N	30421	\N	\N
71040	GENERIC_DAY	2	9	2010-03-30	1324	\N	30421	\N	\N
71029	GENERIC_DAY	2	0	2010-05-08	1324	\N	30421	\N	\N
71076	GENERIC_DAY	2	9	2010-03-29	1324	\N	30421	\N	\N
71030	GENERIC_DAY	2	9	2010-04-22	1324	\N	30421	\N	\N
71036	GENERIC_DAY	2	9	2010-03-18	1324	\N	30421	\N	\N
71032	GENERIC_DAY	2	0	2010-03-20	1324	\N	30421	\N	\N
71027	GENERIC_DAY	2	0	2010-03-28	1324	\N	30421	\N	\N
71078	GENERIC_DAY	2	0	2010-05-02	1324	\N	30421	\N	\N
71068	GENERIC_DAY	2	4	2010-04-16	1324	\N	30421	\N	\N
71037	GENERIC_DAY	2	9	2010-04-21	1324	\N	30421	\N	\N
71063	GENERIC_DAY	2	4	2010-04-02	1324	\N	30421	\N	\N
71031	GENERIC_DAY	2	4	2010-04-30	1324	\N	30421	\N	\N
71020	GENERIC_DAY	2	9	2010-04-05	1324	\N	30421	\N	\N
71056	GENERIC_DAY	2	9	2010-04-28	1324	\N	30421	\N	\N
71034	GENERIC_DAY	2	9	2010-05-10	1324	\N	30421	\N	\N
71024	GENERIC_DAY	2	0	2010-04-04	1324	\N	30421	\N	\N
71060	GENERIC_DAY	2	9	2010-04-15	1324	\N	30421	\N	\N
71077	GENERIC_DAY	2	9	2010-04-06	1324	\N	30421	\N	\N
71035	GENERIC_DAY	2	9	2010-04-19	1324	\N	30421	\N	\N
71039	GENERIC_DAY	2	9	2010-04-14	1324	\N	30421	\N	\N
71071	GENERIC_DAY	2	9	2010-04-07	1324	\N	30421	\N	\N
71045	GENERIC_DAY	2	4	2010-05-07	1324	\N	30421	\N	\N
71066	GENERIC_DAY	2	9	2010-05-06	1324	\N	30421	\N	\N
71052	GENERIC_DAY	2	9	2010-04-20	1324	\N	30421	\N	\N
71075	GENERIC_DAY	2	9	2010-04-26	1324	\N	30421	\N	\N
71022	GENERIC_DAY	2	9	2010-05-03	1324	\N	30421	\N	\N
71046	GENERIC_DAY	2	9	2010-04-27	1324	\N	30421	\N	\N
71019	GENERIC_DAY	2	0	2010-04-18	1324	\N	30421	\N	\N
71074	GENERIC_DAY	2	9	2010-05-04	1324	\N	30421	\N	\N
71067	GENERIC_DAY	2	4	2010-04-09	1324	\N	30421	\N	\N
71021	GENERIC_DAY	2	0	2010-04-03	1324	\N	30421	\N	\N
71048	GENERIC_DAY	2	4	2010-03-26	1324	\N	30421	\N	\N
71026	GENERIC_DAY	2	9	2010-04-01	1324	\N	30421	\N	\N
71051	GENERIC_DAY	2	9	2010-04-13	1324	\N	30421	\N	\N
71061	GENERIC_DAY	2	0	2010-05-09	1324	\N	30421	\N	\N
94539	GENERIC_DAY	3	4	2010-06-10	1314	\N	20241	\N	\N
94540	GENERIC_DAY	3	8	2010-05-31	1314	\N	20241	\N	\N
94541	GENERIC_DAY	3	8	2010-06-03	1314	\N	20241	\N	\N
94542	GENERIC_DAY	3	8	2010-05-28	1314	\N	20241	\N	\N
44060	GENERIC_DAY	33	8	2010-04-13	1314	\N	20210	\N	\N
38745	GENERIC_DAY	3	9	2010-04-13	1330	\N	36197	\N	\N
38746	GENERIC_DAY	3	9	2010-04-12	1330	\N	36197	\N	\N
38747	GENERIC_DAY	3	0	2010-05-17	1330	\N	36197	\N	\N
38748	GENERIC_DAY	3	9	2010-03-23	1330	\N	36197	\N	\N
38749	GENERIC_DAY	3	4	2010-05-14	1330	\N	36197	\N	\N
25760	GENERIC_DAY	12	0	2010-04-04	1318	\N	20274	\N	\N
25768	GENERIC_DAY	12	9	2010-03-24	1318	\N	20274	\N	\N
25769	GENERIC_DAY	12	0	2010-03-13	1318	\N	20274	\N	\N
25782	GENERIC_DAY	12	9	2010-04-26	1318	\N	20274	\N	\N
25788	GENERIC_DAY	12	9	2010-04-07	1318	\N	20274	\N	\N
25797	GENERIC_DAY	12	4	2010-03-12	1318	\N	20274	\N	\N
25803	GENERIC_DAY	12	9	2010-03-10	1318	\N	20274	\N	\N
25783	GENERIC_DAY	12	9	2010-04-14	1318	\N	20274	\N	\N
25791	GENERIC_DAY	12	9	2010-03-30	1318	\N	20274	\N	\N
25757	GENERIC_DAY	12	4	2010-03-19	1318	\N	20274	\N	\N
25753	GENERIC_DAY	12	9	2010-04-12	1318	\N	20274	\N	\N
25789	GENERIC_DAY	12	9	2010-04-20	1318	\N	20274	\N	\N
25800	GENERIC_DAY	12	0	2010-03-21	1318	\N	20274	\N	\N
25809	GENERIC_DAY	12	9	2010-04-19	1318	\N	20274	\N	\N
25767	GENERIC_DAY	12	9	2010-03-23	1318	\N	20274	\N	\N
25771	GENERIC_DAY	12	9	2010-03-31	1318	\N	20274	\N	\N
25799	GENERIC_DAY	12	0	2010-03-20	1318	\N	20274	\N	\N
25754	GENERIC_DAY	12	0	2010-03-28	1318	\N	20274	\N	\N
25770	GENERIC_DAY	12	9	2010-03-15	1318	\N	20274	\N	\N
25755	GENERIC_DAY	12	0	2010-04-18	1318	\N	20274	\N	\N
25776	GENERIC_DAY	12	0	2010-05-01	1318	\N	20274	\N	\N
25794	GENERIC_DAY	12	9	2010-05-04	1318	\N	20274	\N	\N
25774	GENERIC_DAY	12	9	2010-05-06	1318	\N	20274	\N	\N
25808	GENERIC_DAY	12	9	2010-04-13	1318	\N	20274	\N	\N
25784	GENERIC_DAY	12	4	2010-04-30	1318	\N	20274	\N	\N
25806	GENERIC_DAY	12	9	2010-04-27	1318	\N	20274	\N	\N
25793	GENERIC_DAY	12	4	2010-04-09	1318	\N	20274	\N	\N
25764	GENERIC_DAY	12	0	2010-04-24	1318	\N	20274	\N	\N
25781	GENERIC_DAY	12	9	2010-04-05	1318	\N	20274	\N	\N
25772	GENERIC_DAY	12	0	2010-04-17	1318	\N	20274	\N	\N
25790	GENERIC_DAY	12	9	2010-05-05	1318	\N	20274	\N	\N
25795	GENERIC_DAY	12	9	2010-04-06	1318	\N	20274	\N	\N
25759	GENERIC_DAY	12	0	2010-04-25	1318	\N	20274	\N	\N
25780	GENERIC_DAY	12	4	2010-03-26	1318	\N	20274	\N	\N
25807	GENERIC_DAY	12	9	2010-04-01	1318	\N	20274	\N	\N
25765	GENERIC_DAY	12	9	2010-03-29	1318	\N	20274	\N	\N
25773	GENERIC_DAY	12	9	2010-03-16	1318	\N	20274	\N	\N
25779	GENERIC_DAY	12	9	2010-04-28	1318	\N	20274	\N	\N
25801	GENERIC_DAY	12	0	2010-04-03	1318	\N	20274	\N	\N
25786	GENERIC_DAY	12	3	2010-05-07	1318	\N	20274	\N	\N
25777	GENERIC_DAY	12	0	2010-04-10	1318	\N	20274	\N	\N
25792	GENERIC_DAY	12	4	2010-04-23	1318	\N	20274	\N	\N
83133	GENERIC_DAY	13	0	2010-04-03	2728	\N	82822	\N	\N
83116	GENERIC_DAY	13	8	2010-03-03	2728	\N	82822	\N	\N
83107	GENERIC_DAY	13	0	2010-04-04	2728	\N	82822	\N	\N
83061	GENERIC_DAY	13	4	2010-03-25	1316	\N	82822	\N	\N
83109	GENERIC_DAY	13	0	2010-03-09	1314	\N	82822	\N	\N
83117	GENERIC_DAY	13	4	2010-03-15	2728	\N	82822	\N	\N
88476	GENERIC_DAY	0	7	2010-08-19	1322	\N	30466	\N	\N
88477	GENERIC_DAY	0	7	2010-08-04	1322	\N	30466	\N	\N
88478	GENERIC_DAY	0	8	2010-07-14	1322	\N	30466	\N	\N
88479	GENERIC_DAY	0	7	2010-08-23	1322	\N	30466	\N	\N
88480	GENERIC_DAY	0	8	2010-07-13	1322	\N	30466	\N	\N
88481	GENERIC_DAY	0	7	2010-07-22	1322	\N	30466	\N	\N
88482	GENERIC_DAY	0	8	2010-07-20	1322	\N	30466	\N	\N
88483	GENERIC_DAY	0	2	2010-07-23	1322	\N	30466	\N	\N
88484	GENERIC_DAY	0	2	2010-08-20	1322	\N	30466	\N	\N
88485	GENERIC_DAY	0	7	2010-07-26	1322	\N	30466	\N	\N
88486	GENERIC_DAY	0	7	2010-08-17	1322	\N	30466	\N	\N
88487	GENERIC_DAY	0	7	2010-08-11	1322	\N	30466	\N	\N
88488	GENERIC_DAY	0	8	2010-06-30	1322	\N	30466	\N	\N
88489	GENERIC_DAY	0	7	2010-08-18	1322	\N	30466	\N	\N
88490	GENERIC_DAY	0	8	2010-07-05	1322	\N	30466	\N	\N
88491	GENERIC_DAY	0	7	2010-08-12	1322	\N	30466	\N	\N
88492	GENERIC_DAY	0	7	2010-08-24	1322	\N	30466	\N	\N
88493	GENERIC_DAY	0	2	2010-07-30	1322	\N	30466	\N	\N
88494	GENERIC_DAY	0	7	2010-08-10	1322	\N	30466	\N	\N
88495	GENERIC_DAY	0	7	2010-08-03	1322	\N	30466	\N	\N
88496	GENERIC_DAY	0	8	2010-06-28	1322	\N	30466	\N	\N
88497	GENERIC_DAY	0	8	2010-07-08	1322	\N	30466	\N	\N
88498	GENERIC_DAY	0	8	2010-06-29	1322	\N	30466	\N	\N
88499	GENERIC_DAY	0	7	2010-08-25	1322	\N	30466	\N	\N
88500	GENERIC_DAY	0	8	2010-07-15	1322	\N	30466	\N	\N
88501	GENERIC_DAY	0	8	2010-07-01	1322	\N	30466	\N	\N
88502	GENERIC_DAY	0	7	2010-07-28	1322	\N	30466	\N	\N
88503	GENERIC_DAY	0	7	2010-08-05	1322	\N	30466	\N	\N
88504	GENERIC_DAY	0	8	2010-07-06	1322	\N	30466	\N	\N
88505	GENERIC_DAY	0	7	2010-08-09	1322	\N	30466	\N	\N
88506	GENERIC_DAY	0	8	2010-07-07	1322	\N	30466	\N	\N
88507	GENERIC_DAY	0	8	2010-07-12	1322	\N	30466	\N	\N
88508	GENERIC_DAY	0	7	2010-07-27	1322	\N	30466	\N	\N
88509	GENERIC_DAY	0	2	2010-08-13	1322	\N	30466	\N	\N
88510	GENERIC_DAY	0	8	2010-07-19	1322	\N	30466	\N	\N
88511	GENERIC_DAY	0	7	2010-08-16	1322	\N	30466	\N	\N
88512	GENERIC_DAY	0	7	2010-08-26	1322	\N	30466	\N	\N
88513	GENERIC_DAY	0	3	2010-07-16	1322	\N	30466	\N	\N
88514	GENERIC_DAY	0	8	2010-07-21	1322	\N	30466	\N	\N
88515	GENERIC_DAY	0	3	2010-07-09	1322	\N	30466	\N	\N
88516	GENERIC_DAY	0	7	2010-08-02	1322	\N	30466	\N	\N
88517	GENERIC_DAY	0	3	2010-07-02	1322	\N	30466	\N	\N
88518	GENERIC_DAY	0	7	2010-07-29	1322	\N	30466	\N	\N
88519	GENERIC_DAY	0	2	2010-08-06	1322	\N	30466	\N	\N
88520	GENERIC_DAY	0	0	2010-07-11	1322	\N	30467	\N	\N
88521	GENERIC_DAY	0	5	2010-07-14	1322	\N	30467	\N	\N
88522	GENERIC_DAY	0	5	2010-07-12	1322	\N	30467	\N	\N
88523	GENERIC_DAY	0	5	2010-06-30	1322	\N	30467	\N	\N
88524	GENERIC_DAY	0	5	2010-06-28	1322	\N	30467	\N	\N
88525	GENERIC_DAY	0	5	2010-07-05	1322	\N	30467	\N	\N
88526	GENERIC_DAY	0	0	2010-07-03	1322	\N	30467	\N	\N
88527	GENERIC_DAY	0	5	2010-07-08	1322	\N	30467	\N	\N
88528	GENERIC_DAY	0	0	2010-07-04	1322	\N	30467	\N	\N
88529	GENERIC_DAY	0	5	2010-07-06	1322	\N	30467	\N	\N
88530	GENERIC_DAY	0	5	2010-07-15	1322	\N	30467	\N	\N
88531	GENERIC_DAY	0	5	2010-06-29	1322	\N	30467	\N	\N
88532	GENERIC_DAY	0	5	2010-07-07	1322	\N	30467	\N	\N
88533	GENERIC_DAY	0	0	2010-07-10	1322	\N	30467	\N	\N
88534	GENERIC_DAY	0	5	2010-07-01	1322	\N	30467	\N	\N
88535	GENERIC_DAY	0	2	2010-07-09	1322	\N	30467	\N	\N
88536	GENERIC_DAY	0	5	2010-07-13	1322	\N	30467	\N	\N
88537	GENERIC_DAY	0	2	2010-07-02	1322	\N	30467	\N	\N
88538	GENERIC_DAY	0	9	2010-12-15	1322	\N	30468	\N	\N
88539	GENERIC_DAY	0	9	2010-11-23	1322	\N	30468	\N	\N
88540	GENERIC_DAY	0	4	2010-12-03	1322	\N	30468	\N	\N
88541	GENERIC_DAY	0	9	2010-12-08	1322	\N	30468	\N	\N
88542	GENERIC_DAY	0	4	2010-11-26	1322	\N	30468	\N	\N
88543	GENERIC_DAY	0	9	2010-12-02	1322	\N	30468	\N	\N
88544	GENERIC_DAY	0	9	2010-12-06	1322	\N	30468	\N	\N
88545	GENERIC_DAY	0	9	2010-11-17	1322	\N	30468	\N	\N
88546	GENERIC_DAY	0	0	2010-12-05	1322	\N	30468	\N	\N
88547	GENERIC_DAY	0	4	2010-12-17	1322	\N	30468	\N	\N
88548	GENERIC_DAY	0	9	2010-11-24	1322	\N	30468	\N	\N
88549	GENERIC_DAY	0	9	2010-12-14	1322	\N	30468	\N	\N
88550	GENERIC_DAY	0	4	2010-11-19	1322	\N	30468	\N	\N
88551	GENERIC_DAY	0	9	2010-12-13	1322	\N	30468	\N	\N
88552	GENERIC_DAY	0	4	2010-12-10	1322	\N	30468	\N	\N
88553	GENERIC_DAY	0	9	2010-11-15	1322	\N	30468	\N	\N
88554	GENERIC_DAY	0	0	2010-11-20	1322	\N	30468	\N	\N
88555	GENERIC_DAY	0	0	2010-11-28	1322	\N	30468	\N	\N
88556	GENERIC_DAY	0	0	2010-12-11	1322	\N	30468	\N	\N
88557	GENERIC_DAY	0	9	2010-11-18	1322	\N	30468	\N	\N
88558	GENERIC_DAY	0	9	2010-12-01	1322	\N	30468	\N	\N
88559	GENERIC_DAY	0	0	2010-12-12	1322	\N	30468	\N	\N
88560	GENERIC_DAY	0	9	2010-11-16	1322	\N	30468	\N	\N
88561	GENERIC_DAY	0	0	2010-12-04	1322	\N	30468	\N	\N
88562	GENERIC_DAY	0	0	2010-11-27	1322	\N	30468	\N	\N
88563	GENERIC_DAY	0	9	2010-11-25	1322	\N	30468	\N	\N
88564	GENERIC_DAY	0	0	2010-11-14	1322	\N	30468	\N	\N
88565	GENERIC_DAY	0	9	2010-11-22	1322	\N	30468	\N	\N
88566	GENERIC_DAY	0	9	2010-12-07	1322	\N	30468	\N	\N
88567	GENERIC_DAY	0	0	2010-11-21	1322	\N	30468	\N	\N
88568	GENERIC_DAY	0	9	2010-12-16	1322	\N	30468	\N	\N
88569	GENERIC_DAY	0	9	2010-12-09	1322	\N	30468	\N	\N
88570	GENERIC_DAY	0	9	2010-11-29	1322	\N	30468	\N	\N
88571	GENERIC_DAY	0	9	2010-11-30	1322	\N	30468	\N	\N
88572	GENERIC_DAY	0	18	2010-06-03	1324	\N	30422	\N	\N
88573	GENERIC_DAY	0	18	2010-05-19	1324	\N	30422	\N	\N
76818	SPECIFIC_DAY	2	18	2010-03-16	19494	20247	\N	\N	\N
76805	SPECIFIC_DAY	2	0	2010-03-21	19494	20247	\N	\N	\N
76814	SPECIFIC_DAY	2	0	2010-03-20	19494	20247	\N	\N	\N
76813	SPECIFIC_DAY	2	18	2010-03-15	19494	20247	\N	\N	\N
76806	SPECIFIC_DAY	2	18	2010-03-22	19494	20247	\N	\N	\N
76817	SPECIFIC_DAY	2	4	2010-03-24	19494	20247	\N	\N	\N
76816	SPECIFIC_DAY	2	18	2010-03-23	19494	20247	\N	\N	\N
76807	SPECIFIC_DAY	2	0	2010-03-14	19494	20247	\N	\N	\N
76811	SPECIFIC_DAY	2	18	2010-03-17	19494	20247	\N	\N	\N
76803	SPECIFIC_DAY	2	18	2010-03-18	19494	20247	\N	\N	\N
76808	SPECIFIC_DAY	2	8	2010-03-12	19494	20247	\N	\N	\N
76810	SPECIFIC_DAY	2	18	2010-03-09	19494	20247	\N	\N	\N
76815	SPECIFIC_DAY	2	8	2010-03-19	19494	20247	\N	\N	\N
76809	SPECIFIC_DAY	2	18	2010-03-10	19494	20247	\N	\N	\N
76812	SPECIFIC_DAY	2	18	2010-03-08	19494	20247	\N	\N	\N
76804	SPECIFIC_DAY	2	18	2010-03-11	19494	20247	\N	\N	\N
76819	SPECIFIC_DAY	2	0	2010-03-13	19494	20247	\N	\N	\N
88574	GENERIC_DAY	0	18	2010-05-31	1324	\N	30422	\N	\N
88575	GENERIC_DAY	0	0	2010-06-06	1324	\N	30422	\N	\N
88576	GENERIC_DAY	0	0	2010-05-16	1324	\N	30422	\N	\N
88577	GENERIC_DAY	0	18	2010-06-01	1324	\N	30422	\N	\N
88578	GENERIC_DAY	0	0	2010-05-22	1324	\N	30422	\N	\N
88579	GENERIC_DAY	0	18	2010-05-24	1324	\N	30422	\N	\N
88580	GENERIC_DAY	0	18	2010-05-26	1324	\N	30422	\N	\N
88581	GENERIC_DAY	0	18	2010-05-20	1324	\N	30422	\N	\N
88582	GENERIC_DAY	0	18	2010-05-27	1324	\N	30422	\N	\N
88583	GENERIC_DAY	0	18	2010-06-07	1324	\N	30422	\N	\N
88584	GENERIC_DAY	0	0	2010-05-15	1324	\N	30422	\N	\N
88585	GENERIC_DAY	0	0	2010-05-23	1324	\N	30422	\N	\N
88586	GENERIC_DAY	0	0	2010-05-30	1324	\N	30422	\N	\N
88587	GENERIC_DAY	0	0	2010-05-29	1324	\N	30422	\N	\N
88588	GENERIC_DAY	0	8	2010-05-28	1324	\N	30422	\N	\N
88589	GENERIC_DAY	0	18	2010-05-25	1324	\N	30422	\N	\N
88590	GENERIC_DAY	0	18	2010-05-18	1324	\N	30422	\N	\N
88591	GENERIC_DAY	0	8	2010-06-04	1324	\N	30422	\N	\N
88592	GENERIC_DAY	0	8	2010-05-21	1324	\N	30422	\N	\N
88593	GENERIC_DAY	0	0	2010-06-05	1324	\N	30422	\N	\N
88594	GENERIC_DAY	0	2	2010-06-08	1324	\N	30422	\N	\N
88595	GENERIC_DAY	0	8	2010-05-14	1324	\N	30422	\N	\N
88596	GENERIC_DAY	0	18	2010-06-02	1324	\N	30422	\N	\N
88597	GENERIC_DAY	0	18	2010-06-09	1324	\N	30423	\N	\N
88598	GENERIC_DAY	0	18	2010-06-14	1324	\N	30423	\N	\N
88599	GENERIC_DAY	0	8	2010-06-18	1324	\N	30423	\N	\N
88600	GENERIC_DAY	0	0	2010-06-19	1324	\N	30423	\N	\N
88601	GENERIC_DAY	0	18	2010-06-23	1324	\N	30423	\N	\N
88602	GENERIC_DAY	0	0	2010-06-20	1324	\N	30423	\N	\N
88603	GENERIC_DAY	0	18	2010-06-10	1324	\N	30423	\N	\N
88604	GENERIC_DAY	0	4	2010-06-25	1324	\N	30423	\N	\N
88605	GENERIC_DAY	0	18	2010-06-22	1324	\N	30423	\N	\N
88606	GENERIC_DAY	0	18	2010-06-24	1324	\N	30423	\N	\N
38794	GENERIC_DAY	3	9	2010-04-05	1330	\N	36197	\N	\N
38795	GENERIC_DAY	3	4	2010-03-26	1330	\N	36197	\N	\N
38796	GENERIC_DAY	3	0	2010-05-02	1330	\N	36197	\N	\N
38797	GENERIC_DAY	3	0	2010-04-04	1330	\N	36197	\N	\N
88607	GENERIC_DAY	0	0	2010-06-13	1324	\N	30423	\N	\N
88608	GENERIC_DAY	0	18	2010-06-21	1324	\N	30423	\N	\N
88609	GENERIC_DAY	0	0	2010-06-12	1324	\N	30423	\N	\N
88610	GENERIC_DAY	0	18	2010-06-17	1324	\N	30423	\N	\N
88611	GENERIC_DAY	0	18	2010-06-16	1324	\N	30423	\N	\N
88612	GENERIC_DAY	0	18	2010-06-15	1324	\N	30423	\N	\N
88613	GENERIC_DAY	0	8	2010-06-11	1324	\N	30423	\N	\N
38798	GENERIC_DAY	3	0	2010-04-24	1330	\N	36197	\N	\N
38799	GENERIC_DAY	3	9	2010-05-18	1330	\N	36197	\N	\N
38800	GENERIC_DAY	3	0	2010-04-18	1330	\N	36197	\N	\N
38801	GENERIC_DAY	3	9	2010-04-08	1330	\N	36197	\N	\N
36814	SPECIFIC_DAY	4	0	2010-04-18	19500	36168	\N	\N	\N
36815	SPECIFIC_DAY	4	0	2010-04-04	19500	36168	\N	\N	\N
36816	SPECIFIC_DAY	4	0	2010-05-01	19500	36168	\N	\N	\N
36817	SPECIFIC_DAY	4	4	2010-04-21	19500	36168	\N	\N	\N
36818	SPECIFIC_DAY	4	2	2010-03-19	19500	36168	\N	\N	\N
36819	SPECIFIC_DAY	4	2	2010-04-02	19500	36168	\N	\N	\N
36820	SPECIFIC_DAY	4	4	2010-05-05	19500	36168	\N	\N	\N
36821	SPECIFIC_DAY	4	0	2010-04-25	19500	36168	\N	\N	\N
36822	SPECIFIC_DAY	4	4	2010-05-06	19500	36168	\N	\N	\N
36823	SPECIFIC_DAY	4	0	2010-03-28	19500	36168	\N	\N	\N
36824	SPECIFIC_DAY	4	0	2010-05-03	19500	36168	\N	\N	\N
36825	SPECIFIC_DAY	4	4	2010-03-10	19500	36168	\N	\N	\N
36826	SPECIFIC_DAY	4	4	2010-05-11	19500	36168	\N	\N	\N
36827	SPECIFIC_DAY	4	4	2010-04-28	19500	36168	\N	\N	\N
36828	SPECIFIC_DAY	4	0	2010-03-14	19500	36168	\N	\N	\N
36829	SPECIFIC_DAY	4	4	2010-03-02	19500	36168	\N	\N	\N
36830	SPECIFIC_DAY	4	2	2010-04-30	19500	36168	\N	\N	\N
36831	SPECIFIC_DAY	4	4	2010-03-17	19500	36168	\N	\N	\N
36832	SPECIFIC_DAY	4	4	2010-05-04	19500	36168	\N	\N	\N
36833	SPECIFIC_DAY	4	4	2010-04-19	19500	36168	\N	\N	\N
36834	SPECIFIC_DAY	4	4	2010-05-13	19500	36168	\N	\N	\N
36835	SPECIFIC_DAY	4	2	2010-05-07	19500	36168	\N	\N	\N
36836	SPECIFIC_DAY	4	0	2010-05-02	19500	36168	\N	\N	\N
36837	SPECIFIC_DAY	4	2	2010-03-05	19500	36168	\N	\N	\N
36838	SPECIFIC_DAY	4	0	2010-05-16	19500	36168	\N	\N	\N
36839	SPECIFIC_DAY	4	2	2010-04-09	19500	36168	\N	\N	\N
36840	SPECIFIC_DAY	4	4	2010-03-09	19500	36168	\N	\N	\N
36841	SPECIFIC_DAY	4	4	2010-03-31	19500	36168	\N	\N	\N
36842	SPECIFIC_DAY	4	4	2010-04-27	19500	36168	\N	\N	\N
36843	SPECIFIC_DAY	4	2	2010-04-16	19500	36168	\N	\N	\N
36844	SPECIFIC_DAY	4	2	2010-05-14	19500	36168	\N	\N	\N
36845	SPECIFIC_DAY	4	2	2010-05-19	19500	36168	\N	\N	\N
36846	SPECIFIC_DAY	4	0	2010-05-08	19500	36168	\N	\N	\N
36847	SPECIFIC_DAY	4	0	2010-03-13	19500	36168	\N	\N	\N
36848	SPECIFIC_DAY	4	4	2010-03-01	19500	36168	\N	\N	\N
36849	SPECIFIC_DAY	4	4	2010-03-16	19500	36168	\N	\N	\N
36850	SPECIFIC_DAY	4	4	2010-03-25	19500	36168	\N	\N	\N
36851	SPECIFIC_DAY	4	4	2010-04-06	19500	36168	\N	\N	\N
39566	GENERIC_DAY	2	2	2010-08-20	1332	\N	36216	\N	\N
39567	GENERIC_DAY	2	5	2010-08-24	1332	\N	36216	\N	\N
39568	GENERIC_DAY	2	5	2010-08-05	1332	\N	36216	\N	\N
39569	GENERIC_DAY	2	5	2010-08-26	1332	\N	36216	\N	\N
39570	GENERIC_DAY	2	5	2010-08-12	1332	\N	36216	\N	\N
39571	GENERIC_DAY	2	0	2010-07-24	1332	\N	36216	\N	\N
39572	GENERIC_DAY	2	5	2010-08-11	1332	\N	36216	\N	\N
39573	GENERIC_DAY	2	5	2010-08-16	1332	\N	36216	\N	\N
39574	GENERIC_DAY	2	5	2010-08-23	1332	\N	36216	\N	\N
39575	GENERIC_DAY	2	5	2010-08-19	1332	\N	36216	\N	\N
39576	GENERIC_DAY	2	0	2010-08-22	1332	\N	36216	\N	\N
39577	GENERIC_DAY	2	2	2010-08-13	1332	\N	36216	\N	\N
39578	GENERIC_DAY	2	5	2010-08-09	1332	\N	36216	\N	\N
39579	GENERIC_DAY	2	5	2010-08-17	1332	\N	36216	\N	\N
39580	GENERIC_DAY	2	5	2010-08-03	1332	\N	36216	\N	\N
39581	GENERIC_DAY	2	5	2010-08-18	1332	\N	36216	\N	\N
39582	GENERIC_DAY	2	0	2010-08-28	1332	\N	36216	\N	\N
39583	GENERIC_DAY	2	5	2010-07-19	1332	\N	36216	\N	\N
39584	GENERIC_DAY	2	2	2010-07-23	1332	\N	36216	\N	\N
39585	GENERIC_DAY	2	5	2010-07-21	1332	\N	36216	\N	\N
39586	GENERIC_DAY	2	0	2010-08-21	1332	\N	36216	\N	\N
39587	GENERIC_DAY	2	0	2010-08-15	1332	\N	36216	\N	\N
39588	GENERIC_DAY	2	0	2010-08-07	1332	\N	36216	\N	\N
39589	GENERIC_DAY	2	0	2010-07-25	1332	\N	36216	\N	\N
39590	GENERIC_DAY	2	5	2010-08-02	1332	\N	36216	\N	\N
39591	GENERIC_DAY	2	2	2010-07-16	1332	\N	36216	\N	\N
39592	GENERIC_DAY	2	0	2010-08-08	1332	\N	36216	\N	\N
39593	GENERIC_DAY	2	0	2010-08-29	1332	\N	36216	\N	\N
39594	GENERIC_DAY	2	5	2010-08-31	1332	\N	36216	\N	\N
39595	GENERIC_DAY	2	0	2010-07-17	1332	\N	36216	\N	\N
39596	GENERIC_DAY	2	0	2010-08-14	1332	\N	36216	\N	\N
39597	GENERIC_DAY	2	5	2010-08-10	1332	\N	36216	\N	\N
39598	GENERIC_DAY	2	5	2010-07-20	1332	\N	36216	\N	\N
39599	GENERIC_DAY	2	5	2010-08-25	1332	\N	36216	\N	\N
39600	GENERIC_DAY	2	5	2010-07-22	1332	\N	36216	\N	\N
39601	GENERIC_DAY	2	2	2010-08-27	1332	\N	36216	\N	\N
39602	GENERIC_DAY	2	5	2010-08-30	1332	\N	36216	\N	\N
39603	GENERIC_DAY	2	0	2010-07-18	1332	\N	36216	\N	\N
38750	GENERIC_DAY	3	0	2010-04-10	1330	\N	36197	\N	\N
38751	GENERIC_DAY	3	8	2010-05-24	1330	\N	36197	\N	\N
38752	GENERIC_DAY	3	0	2010-04-11	1330	\N	36197	\N	\N
38753	GENERIC_DAY	3	9	2010-04-21	1330	\N	36197	\N	\N
38754	GENERIC_DAY	3	0	2010-03-27	1330	\N	36197	\N	\N
38755	GENERIC_DAY	3	9	2010-03-29	1330	\N	36197	\N	\N
38756	GENERIC_DAY	3	0	2010-04-17	1330	\N	36197	\N	\N
38757	GENERIC_DAY	3	0	2010-04-25	1330	\N	36197	\N	\N
38758	GENERIC_DAY	3	9	2010-05-05	1330	\N	36197	\N	\N
38759	GENERIC_DAY	3	9	2010-04-20	1330	\N	36197	\N	\N
38760	GENERIC_DAY	3	0	2010-05-23	1330	\N	36197	\N	\N
38761	GENERIC_DAY	3	0	2010-05-22	1330	\N	36197	\N	\N
38762	GENERIC_DAY	3	9	2010-03-22	1330	\N	36197	\N	\N
38763	GENERIC_DAY	3	9	2010-05-04	1330	\N	36197	\N	\N
38764	GENERIC_DAY	3	4	2010-05-21	1330	\N	36197	\N	\N
38765	GENERIC_DAY	3	9	2010-03-30	1330	\N	36197	\N	\N
38766	GENERIC_DAY	3	9	2010-04-19	1330	\N	36197	\N	\N
38767	GENERIC_DAY	3	9	2010-05-12	1330	\N	36197	\N	\N
38768	GENERIC_DAY	3	9	2010-04-06	1330	\N	36197	\N	\N
38769	GENERIC_DAY	3	9	2010-04-22	1330	\N	36197	\N	\N
38770	GENERIC_DAY	3	9	2010-05-10	1330	\N	36197	\N	\N
38771	GENERIC_DAY	3	9	2010-04-07	1330	\N	36197	\N	\N
38772	GENERIC_DAY	3	9	2010-04-01	1330	\N	36197	\N	\N
38773	GENERIC_DAY	3	0	2010-05-16	1330	\N	36197	\N	\N
38774	GENERIC_DAY	3	0	2010-04-03	1330	\N	36197	\N	\N
38775	GENERIC_DAY	3	4	2010-04-23	1330	\N	36197	\N	\N
38776	GENERIC_DAY	3	9	2010-03-24	1330	\N	36197	\N	\N
38777	GENERIC_DAY	3	0	2010-05-08	1330	\N	36197	\N	\N
38778	GENERIC_DAY	3	9	2010-04-29	1330	\N	36197	\N	\N
38779	GENERIC_DAY	3	0	2010-05-09	1330	\N	36197	\N	\N
38780	GENERIC_DAY	3	0	2010-03-28	1330	\N	36197	\N	\N
38781	GENERIC_DAY	3	9	2010-04-26	1330	\N	36197	\N	\N
38782	GENERIC_DAY	3	9	2010-05-20	1330	\N	36197	\N	\N
38783	GENERIC_DAY	3	4	2010-04-02	1330	\N	36197	\N	\N
38784	GENERIC_DAY	3	4	2010-04-30	1330	\N	36197	\N	\N
38785	GENERIC_DAY	3	9	2010-04-15	1330	\N	36197	\N	\N
38786	GENERIC_DAY	3	9	2010-04-28	1330	\N	36197	\N	\N
38787	GENERIC_DAY	3	4	2010-04-16	1330	\N	36197	\N	\N
38788	GENERIC_DAY	3	9	2010-04-14	1330	\N	36197	\N	\N
38789	GENERIC_DAY	3	0	2010-05-01	1330	\N	36197	\N	\N
38790	GENERIC_DAY	3	4	2010-04-09	1330	\N	36197	\N	\N
38791	GENERIC_DAY	3	9	2010-05-19	1330	\N	36197	\N	\N
38792	GENERIC_DAY	3	0	2010-05-15	1330	\N	36197	\N	\N
38793	GENERIC_DAY	3	9	2010-05-13	1330	\N	36197	\N	\N
38802	GENERIC_DAY	3	9	2010-04-27	1330	\N	36197	\N	\N
38803	GENERIC_DAY	3	9	2010-03-25	1330	\N	36197	\N	\N
38804	GENERIC_DAY	3	4	2010-05-07	1330	\N	36197	\N	\N
38805	GENERIC_DAY	3	9	2010-05-11	1330	\N	36197	\N	\N
38806	GENERIC_DAY	3	9	2010-03-31	1330	\N	36197	\N	\N
38807	GENERIC_DAY	3	9	2010-05-06	1330	\N	36197	\N	\N
38808	GENERIC_DAY	3	4	2010-06-25	1330	\N	36198	\N	\N
38809	GENERIC_DAY	3	9	2010-06-17	1330	\N	36198	\N	\N
38810	GENERIC_DAY	3	0	2010-06-26	1330	\N	36198	\N	\N
38811	GENERIC_DAY	3	0	2010-06-12	1330	\N	36198	\N	\N
38812	GENERIC_DAY	3	0	2010-06-13	1330	\N	36198	\N	\N
38813	GENERIC_DAY	3	9	2010-06-21	1330	\N	36198	\N	\N
38814	GENERIC_DAY	3	4	2010-06-04	1330	\N	36198	\N	\N
38815	GENERIC_DAY	3	9	2010-06-08	1330	\N	36198	\N	\N
38816	GENERIC_DAY	3	9	2010-06-14	1330	\N	36198	\N	\N
38817	GENERIC_DAY	3	4	2010-06-18	1330	\N	36198	\N	\N
38818	GENERIC_DAY	3	0	2010-06-27	1330	\N	36198	\N	\N
38819	GENERIC_DAY	3	9	2010-05-25	1330	\N	36198	\N	\N
38820	GENERIC_DAY	3	9	2010-06-03	1330	\N	36198	\N	\N
38821	GENERIC_DAY	3	9	2010-05-27	1330	\N	36198	\N	\N
38822	GENERIC_DAY	3	9	2010-05-26	1330	\N	36198	\N	\N
38823	GENERIC_DAY	3	0	2010-05-30	1330	\N	36198	\N	\N
38824	GENERIC_DAY	3	9	2010-06-28	1330	\N	36198	\N	\N
38825	GENERIC_DAY	3	9	2010-06-23	1330	\N	36198	\N	\N
38826	GENERIC_DAY	3	9	2010-06-09	1330	\N	36198	\N	\N
38827	GENERIC_DAY	3	9	2010-06-01	1330	\N	36198	\N	\N
38828	GENERIC_DAY	3	9	2010-06-22	1330	\N	36198	\N	\N
38829	GENERIC_DAY	3	0	2010-06-06	1330	\N	36198	\N	\N
38830	GENERIC_DAY	3	9	2010-06-02	1330	\N	36198	\N	\N
38831	GENERIC_DAY	3	9	2010-06-10	1330	\N	36198	\N	\N
38832	GENERIC_DAY	3	9	2010-06-24	1330	\N	36198	\N	\N
38833	GENERIC_DAY	3	0	2010-05-29	1330	\N	36198	\N	\N
38834	GENERIC_DAY	3	9	2010-06-07	1330	\N	36198	\N	\N
38835	GENERIC_DAY	3	0	2010-06-20	1330	\N	36198	\N	\N
38836	GENERIC_DAY	3	0	2010-06-19	1330	\N	36198	\N	\N
38837	GENERIC_DAY	3	9	2010-05-31	1330	\N	36198	\N	\N
38838	GENERIC_DAY	3	9	2010-06-16	1330	\N	36198	\N	\N
38839	GENERIC_DAY	3	4	2010-05-28	1330	\N	36198	\N	\N
38840	GENERIC_DAY	3	4	2010-06-11	1330	\N	36198	\N	\N
38841	GENERIC_DAY	3	9	2010-06-15	1330	\N	36198	\N	\N
38842	GENERIC_DAY	3	0	2010-06-05	1330	\N	36198	\N	\N
38843	GENERIC_DAY	3	9	2010-07-06	1330	\N	36199	\N	\N
38844	GENERIC_DAY	3	9	2010-07-08	1330	\N	36199	\N	\N
38845	GENERIC_DAY	3	9	2010-07-14	1330	\N	36199	\N	\N
38846	GENERIC_DAY	3	0	2010-07-04	1330	\N	36199	\N	\N
38847	GENERIC_DAY	3	0	2010-07-11	1330	\N	36199	\N	\N
38848	GENERIC_DAY	3	9	2010-07-13	1330	\N	36199	\N	\N
38849	GENERIC_DAY	3	4	2010-07-09	1330	\N	36199	\N	\N
38850	GENERIC_DAY	3	9	2010-07-07	1330	\N	36199	\N	\N
38851	GENERIC_DAY	3	9	2010-06-29	1330	\N	36199	\N	\N
38852	GENERIC_DAY	3	0	2010-07-10	1330	\N	36199	\N	\N
38853	GENERIC_DAY	3	9	2010-06-30	1330	\N	36199	\N	\N
38854	GENERIC_DAY	3	2	2010-07-15	1330	\N	36199	\N	\N
38855	GENERIC_DAY	3	9	2010-07-12	1330	\N	36199	\N	\N
38856	GENERIC_DAY	3	9	2010-07-05	1330	\N	36199	\N	\N
38857	GENERIC_DAY	3	4	2010-07-02	1330	\N	36199	\N	\N
38858	GENERIC_DAY	3	0	2010-07-03	1330	\N	36199	\N	\N
38859	GENERIC_DAY	3	9	2010-07-01	1330	\N	36199	\N	\N
39521	GENERIC_DAY	2	5	2010-07-21	1332	\N	36215	\N	\N
39522	GENERIC_DAY	2	5	2010-09-13	1332	\N	36215	\N	\N
39523	GENERIC_DAY	2	5	2010-09-16	1332	\N	36215	\N	\N
39524	GENERIC_DAY	2	5	2010-09-27	1332	\N	36215	\N	\N
39525	GENERIC_DAY	2	5	2010-09-02	1332	\N	36215	\N	\N
39526	GENERIC_DAY	2	5	2010-09-06	1332	\N	36215	\N	\N
39527	GENERIC_DAY	2	5	2010-08-02	1332	\N	36215	\N	\N
39528	GENERIC_DAY	2	5	2010-08-18	1332	\N	36215	\N	\N
39529	GENERIC_DAY	2	5	2010-08-26	1332	\N	36215	\N	\N
39530	GENERIC_DAY	2	5	2010-08-16	1332	\N	36215	\N	\N
39531	GENERIC_DAY	2	5	2010-10-04	1332	\N	36215	\N	\N
39532	GENERIC_DAY	2	5	2010-08-24	1332	\N	36215	\N	\N
39533	GENERIC_DAY	2	5	2010-08-11	1332	\N	36215	\N	\N
39534	GENERIC_DAY	2	5	2010-08-04	1332	\N	36215	\N	\N
39535	GENERIC_DAY	2	5	2010-08-10	1332	\N	36215	\N	\N
39536	GENERIC_DAY	2	4	2010-10-06	1332	\N	36215	\N	\N
39537	GENERIC_DAY	2	5	2010-08-25	1332	\N	36215	\N	\N
39538	GENERIC_DAY	2	5	2010-07-20	1332	\N	36215	\N	\N
39539	GENERIC_DAY	2	5	2010-09-07	1332	\N	36215	\N	\N
39540	GENERIC_DAY	2	4	2010-10-07	1332	\N	36215	\N	\N
39541	GENERIC_DAY	2	5	2010-08-05	1332	\N	36215	\N	\N
39542	GENERIC_DAY	2	5	2010-08-09	1332	\N	36215	\N	\N
39543	GENERIC_DAY	2	5	2010-09-09	1332	\N	36215	\N	\N
39544	GENERIC_DAY	2	5	2010-08-23	1332	\N	36215	\N	\N
39545	GENERIC_DAY	2	5	2010-09-23	1332	\N	36215	\N	\N
39546	GENERIC_DAY	2	5	2010-07-19	1332	\N	36215	\N	\N
39547	GENERIC_DAY	2	5	2010-09-20	1332	\N	36215	\N	\N
39548	GENERIC_DAY	2	5	2010-08-12	1332	\N	36215	\N	\N
39549	GENERIC_DAY	2	5	2010-08-31	1332	\N	36215	\N	\N
39550	GENERIC_DAY	2	5	2010-08-03	1332	\N	36215	\N	\N
39551	GENERIC_DAY	2	5	2010-08-17	1332	\N	36215	\N	\N
39552	GENERIC_DAY	2	5	2010-08-19	1332	\N	36215	\N	\N
39553	GENERIC_DAY	2	5	2010-09-28	1332	\N	36215	\N	\N
39554	GENERIC_DAY	2	5	2010-09-29	1332	\N	36215	\N	\N
39555	GENERIC_DAY	2	5	2010-09-30	1332	\N	36215	\N	\N
39556	GENERIC_DAY	2	5	2010-09-14	1332	\N	36215	\N	\N
39557	GENERIC_DAY	2	4	2010-10-11	1332	\N	36215	\N	\N
39558	GENERIC_DAY	2	5	2010-09-01	1332	\N	36215	\N	\N
39559	GENERIC_DAY	2	5	2010-08-30	1332	\N	36215	\N	\N
39560	GENERIC_DAY	2	5	2010-09-22	1332	\N	36215	\N	\N
39561	GENERIC_DAY	2	5	2010-07-22	1332	\N	36215	\N	\N
39562	GENERIC_DAY	2	5	2010-09-21	1332	\N	36215	\N	\N
39563	GENERIC_DAY	2	4	2010-10-05	1332	\N	36215	\N	\N
39564	GENERIC_DAY	2	5	2010-09-15	1332	\N	36215	\N	\N
39565	GENERIC_DAY	2	5	2010-08-04	1332	\N	36216	\N	\N
39604	GENERIC_DAY	2	2	2010-08-06	1332	\N	36216	\N	\N
36813	SPECIFIC_DAY	4	4	2010-04-13	19500	36168	\N	\N	\N
36852	SPECIFIC_DAY	4	4	2010-04-22	19500	36168	\N	\N	\N
36853	SPECIFIC_DAY	4	0	2010-04-10	19500	36168	\N	\N	\N
36854	SPECIFIC_DAY	4	0	2010-05-09	19500	36168	\N	\N	\N
36855	SPECIFIC_DAY	4	4	2010-04-15	19500	36168	\N	\N	\N
36856	SPECIFIC_DAY	4	2	2010-04-23	19500	36168	\N	\N	\N
36857	SPECIFIC_DAY	4	4	2010-05-12	19500	36168	\N	\N	\N
36858	SPECIFIC_DAY	4	0	2010-04-03	19500	36168	\N	\N	\N
36859	SPECIFIC_DAY	4	2	2010-03-12	19500	36168	\N	\N	\N
36860	SPECIFIC_DAY	4	4	2010-03-04	19500	36168	\N	\N	\N
36861	SPECIFIC_DAY	4	0	2010-03-06	19500	36168	\N	\N	\N
36862	SPECIFIC_DAY	4	4	2010-03-29	19500	36168	\N	\N	\N
36863	SPECIFIC_DAY	4	4	2010-03-30	19500	36168	\N	\N	\N
36864	SPECIFIC_DAY	4	4	2010-04-20	19500	36168	\N	\N	\N
37269	SPECIFIC_DAY	4	4	2010-03-08	19500	36168	\N	\N	\N
37270	SPECIFIC_DAY	4	4	2010-03-15	19500	36168	\N	\N	\N
37271	SPECIFIC_DAY	4	4	2010-05-10	19500	36168	\N	\N	\N
37272	SPECIFIC_DAY	4	4	2010-04-26	19500	36168	\N	\N	\N
37273	SPECIFIC_DAY	4	0	2010-05-15	19500	36168	\N	\N	\N
37274	SPECIFIC_DAY	4	4	2010-04-14	19500	36168	\N	\N	\N
37275	SPECIFIC_DAY	4	0	2010-04-11	19500	36168	\N	\N	\N
37276	SPECIFIC_DAY	4	0	2010-03-20	19500	36168	\N	\N	\N
37277	SPECIFIC_DAY	4	4	2010-03-23	19500	36168	\N	\N	\N
37278	SPECIFIC_DAY	4	4	2010-03-11	19500	36168	\N	\N	\N
37279	SPECIFIC_DAY	4	0	2010-03-21	19500	36168	\N	\N	\N
37280	SPECIFIC_DAY	4	0	2010-04-17	19500	36168	\N	\N	\N
37281	SPECIFIC_DAY	4	4	2010-04-08	19500	36168	\N	\N	\N
37282	SPECIFIC_DAY	4	4	2010-04-29	19500	36168	\N	\N	\N
37283	SPECIFIC_DAY	4	0	2010-03-07	19500	36168	\N	\N	\N
37284	SPECIFIC_DAY	4	4	2010-05-18	19500	36168	\N	\N	\N
37285	SPECIFIC_DAY	4	4	2010-04-01	19500	36168	\N	\N	\N
37286	SPECIFIC_DAY	4	4	2010-03-22	19500	36168	\N	\N	\N
37287	SPECIFIC_DAY	4	4	2010-03-18	19500	36168	\N	\N	\N
37288	SPECIFIC_DAY	4	4	2010-04-05	19500	36168	\N	\N	\N
37289	SPECIFIC_DAY	4	2	2010-03-26	19500	36168	\N	\N	\N
37290	SPECIFIC_DAY	4	0	2010-04-24	19500	36168	\N	\N	\N
37291	SPECIFIC_DAY	4	4	2010-04-07	19500	36168	\N	\N	\N
37292	SPECIFIC_DAY	4	4	2010-03-24	19500	36168	\N	\N	\N
37293	SPECIFIC_DAY	4	0	2010-03-27	19500	36168	\N	\N	\N
37294	SPECIFIC_DAY	4	4	2010-04-12	19500	36168	\N	\N	\N
37295	SPECIFIC_DAY	4	4	2010-03-03	19500	36168	\N	\N	\N
37296	SPECIFIC_DAY	4	0	2010-05-17	19500	36168	\N	\N	\N
39989	GENERIC_DAY	0	5	2010-11-29	1332	\N	36219	\N	\N
39990	GENERIC_DAY	0	0	2010-12-11	1332	\N	36219	\N	\N
39991	GENERIC_DAY	0	5	2010-10-28	1332	\N	36219	\N	\N
39992	GENERIC_DAY	0	5	2010-10-18	1332	\N	36219	\N	\N
39993	GENERIC_DAY	0	0	2010-11-07	1332	\N	36219	\N	\N
39994	GENERIC_DAY	0	5	2010-11-09	1332	\N	36219	\N	\N
39995	GENERIC_DAY	0	5	2010-11-25	1332	\N	36219	\N	\N
39996	GENERIC_DAY	0	0	2010-11-13	1332	\N	36219	\N	\N
39997	GENERIC_DAY	0	5	2010-11-23	1332	\N	36219	\N	\N
39998	GENERIC_DAY	0	5	2010-10-20	1332	\N	36219	\N	\N
39999	GENERIC_DAY	0	0	2010-10-31	1332	\N	36219	\N	\N
40000	GENERIC_DAY	0	2	2010-11-19	1332	\N	36219	\N	\N
40001	GENERIC_DAY	0	5	2010-12-16	1332	\N	36219	\N	\N
40002	GENERIC_DAY	0	0	2010-10-23	1332	\N	36219	\N	\N
40003	GENERIC_DAY	0	5	2010-12-06	1332	\N	36219	\N	\N
40004	GENERIC_DAY	0	0	2010-11-14	1332	\N	36219	\N	\N
40005	GENERIC_DAY	0	0	2010-10-30	1332	\N	36219	\N	\N
40006	GENERIC_DAY	0	5	2010-11-15	1332	\N	36219	\N	\N
40007	GENERIC_DAY	0	5	2010-10-26	1332	\N	36219	\N	\N
40008	GENERIC_DAY	0	5	2010-10-27	1332	\N	36219	\N	\N
40009	GENERIC_DAY	0	5	2010-11-18	1332	\N	36219	\N	\N
40010	GENERIC_DAY	0	5	2010-12-02	1332	\N	36219	\N	\N
40011	GENERIC_DAY	0	0	2010-11-21	1332	\N	36219	\N	\N
40012	GENERIC_DAY	0	0	2010-10-24	1332	\N	36219	\N	\N
40013	GENERIC_DAY	0	0	2010-11-28	1332	\N	36219	\N	\N
40014	GENERIC_DAY	0	2	2010-12-17	1332	\N	36219	\N	\N
40015	GENERIC_DAY	0	5	2010-11-22	1332	\N	36219	\N	\N
40016	GENERIC_DAY	0	5	2010-12-14	1332	\N	36219	\N	\N
40017	GENERIC_DAY	0	5	2010-11-17	1332	\N	36219	\N	\N
40018	GENERIC_DAY	0	2	2010-12-10	1332	\N	36219	\N	\N
40019	GENERIC_DAY	0	5	2010-12-08	1332	\N	36219	\N	\N
40020	GENERIC_DAY	0	0	2010-12-05	1332	\N	36219	\N	\N
40021	GENERIC_DAY	0	5	2010-10-19	1332	\N	36219	\N	\N
40022	GENERIC_DAY	0	2	2010-10-15	1332	\N	36219	\N	\N
40023	GENERIC_DAY	0	2	2010-11-12	1332	\N	36219	\N	\N
40024	GENERIC_DAY	0	5	2010-10-25	1332	\N	36219	\N	\N
40025	GENERIC_DAY	0	5	2010-12-15	1332	\N	36219	\N	\N
40026	GENERIC_DAY	0	0	2010-11-06	1332	\N	36219	\N	\N
40027	GENERIC_DAY	0	5	2010-11-10	1332	\N	36219	\N	\N
40028	GENERIC_DAY	0	2	2010-10-22	1332	\N	36219	\N	\N
40029	GENERIC_DAY	0	5	2010-11-24	1332	\N	36219	\N	\N
40030	GENERIC_DAY	0	2	2010-11-05	1332	\N	36219	\N	\N
40031	GENERIC_DAY	0	0	2010-12-12	1332	\N	36219	\N	\N
40032	GENERIC_DAY	0	5	2010-11-04	1332	\N	36219	\N	\N
40033	GENERIC_DAY	0	5	2010-11-01	1332	\N	36219	\N	\N
40034	GENERIC_DAY	0	0	2010-10-17	1332	\N	36219	\N	\N
40035	GENERIC_DAY	0	0	2010-11-27	1332	\N	36219	\N	\N
40036	GENERIC_DAY	0	5	2010-12-09	1332	\N	36219	\N	\N
40037	GENERIC_DAY	0	5	2010-11-02	1332	\N	36219	\N	\N
40038	GENERIC_DAY	0	5	2010-12-01	1332	\N	36219	\N	\N
40039	GENERIC_DAY	0	5	2010-11-08	1332	\N	36219	\N	\N
40040	GENERIC_DAY	0	2	2010-12-03	1332	\N	36219	\N	\N
40041	GENERIC_DAY	0	5	2010-11-30	1332	\N	36219	\N	\N
40042	GENERIC_DAY	0	0	2010-10-16	1332	\N	36219	\N	\N
40043	GENERIC_DAY	0	5	2010-11-16	1332	\N	36219	\N	\N
40044	GENERIC_DAY	0	5	2010-12-07	1332	\N	36219	\N	\N
40045	GENERIC_DAY	0	2	2010-11-26	1332	\N	36219	\N	\N
40046	GENERIC_DAY	0	0	2010-12-04	1332	\N	36219	\N	\N
40047	GENERIC_DAY	0	5	2010-12-13	1332	\N	36219	\N	\N
40048	GENERIC_DAY	0	5	2010-10-21	1332	\N	36219	\N	\N
40049	GENERIC_DAY	0	2	2010-10-29	1332	\N	36219	\N	\N
40050	GENERIC_DAY	0	5	2010-11-03	1332	\N	36219	\N	\N
40051	GENERIC_DAY	0	0	2010-11-20	1332	\N	36219	\N	\N
40052	GENERIC_DAY	0	5	2010-11-11	1332	\N	36219	\N	\N
83073	GENERIC_DAY	13	4	2010-04-01	1316	\N	82822	\N	\N
94311	GENERIC_DAY	3	8	2010-04-28	1314	\N	20240	\N	\N
94312	GENERIC_DAY	3	0	2010-05-02	1314	\N	20240	\N	\N
94313	GENERIC_DAY	3	8	2010-05-03	1314	\N	20240	\N	\N
94314	GENERIC_DAY	3	8	2010-05-20	1314	\N	20240	\N	\N
94315	GENERIC_DAY	3	8	2010-05-24	1314	\N	20240	\N	\N
94316	GENERIC_DAY	3	8	2010-04-19	1314	\N	20240	\N	\N
68897	SPECIFIC_DAY	2	0	2010-05-17	1326	68075	\N	\N	\N
94317	GENERIC_DAY	3	0	2010-05-08	1314	\N	20240	\N	\N
94318	GENERIC_DAY	3	8	2010-05-19	1314	\N	20240	\N	\N
94319	GENERIC_DAY	3	8	2010-04-26	1314	\N	20240	\N	\N
94320	GENERIC_DAY	3	8	2010-05-13	1314	\N	20240	\N	\N
94321	GENERIC_DAY	3	0	2010-04-17	1314	\N	20240	\N	\N
94322	GENERIC_DAY	3	8	2010-05-18	1314	\N	20240	\N	\N
94323	GENERIC_DAY	3	8	2010-04-23	1314	\N	20240	\N	\N
94324	GENERIC_DAY	3	0	2010-06-05	1314	\N	20241	\N	\N
94325	GENERIC_DAY	3	8	2010-06-04	1314	\N	20241	\N	\N
94326	GENERIC_DAY	3	0	2010-05-30	1314	\N	20241	\N	\N
94327	GENERIC_DAY	3	0	2010-05-29	1314	\N	20241	\N	\N
94328	GENERIC_DAY	3	0	2010-06-06	1314	\N	20241	\N	\N
94329	GENERIC_DAY	3	8	2010-06-01	1314	\N	20241	\N	\N
94330	GENERIC_DAY	3	8	2010-06-02	1314	\N	20241	\N	\N
94331	GENERIC_DAY	3	8	2010-06-07	1314	\N	20241	\N	\N
94332	GENERIC_DAY	3	8	2010-06-09	1314	\N	20241	\N	\N
94333	GENERIC_DAY	3	8	2010-05-25	1314	\N	20241	\N	\N
94536	GENERIC_DAY	3	8	2010-05-27	1314	\N	20241	\N	\N
94537	GENERIC_DAY	3	8	2010-05-26	1314	\N	20241	\N	\N
94538	GENERIC_DAY	3	8	2010-06-08	1314	\N	20241	\N	\N
83130	GENERIC_DAY	13	0	2010-03-27	1314	\N	82822	\N	\N
83060	GENERIC_DAY	13	4	2010-03-22	1316	\N	82822	\N	\N
83120	GENERIC_DAY	13	4	2010-04-01	2728	\N	82822	\N	\N
83090	GENERIC_DAY	13	4	2010-03-18	1316	\N	82822	\N	\N
83110	GENERIC_DAY	13	4	2010-03-22	2728	\N	82822	\N	\N
83104	GENERIC_DAY	13	8	2010-03-04	2728	\N	82822	\N	\N
83080	GENERIC_DAY	13	4	2010-03-31	2728	\N	82822	\N	\N
83127	GENERIC_DAY	13	0	2010-03-21	1314	\N	82822	\N	\N
83143	GENERIC_DAY	13	0	2010-03-27	2728	\N	82822	\N	\N
83098	GENERIC_DAY	13	0	2010-03-28	1316	\N	82822	\N	\N
83063	GENERIC_DAY	13	0	2010-03-15	1314	\N	82822	\N	\N
83118	GENERIC_DAY	13	4	2010-03-29	1316	\N	82822	\N	\N
83096	GENERIC_DAY	13	4	2010-04-06	2728	\N	82822	\N	\N
83070	GENERIC_DAY	13	0	2010-03-06	2728	\N	82822	\N	\N
83105	GENERIC_DAY	13	4	2010-04-06	1316	\N	82822	\N	\N
83085	GENERIC_DAY	13	6	2010-04-02	1316	\N	82822	\N	\N
83094	GENERIC_DAY	13	0	2010-03-14	2728	\N	82822	\N	\N
68916	SPECIFIC_DAY	2	0	2010-05-16	1326	68075	\N	\N	\N
68918	SPECIFIC_DAY	2	2	2010-05-03	1326	68075	\N	\N	\N
68919	SPECIFIC_DAY	2	2	2010-04-22	1326	68075	\N	\N	\N
68921	SPECIFIC_DAY	2	0	2010-05-01	1326	68075	\N	\N	\N
68923	SPECIFIC_DAY	2	0	2010-06-06	1326	68075	\N	\N	\N
68932	SPECIFIC_DAY	2	2	2010-06-01	1326	68075	\N	\N	\N
68929	SPECIFIC_DAY	2	2	2010-06-09	1326	68075	\N	\N	\N
68922	SPECIFIC_DAY	2	2	2010-05-18	1326	68075	\N	\N	\N
68924	SPECIFIC_DAY	2	0	2010-05-09	1326	68075	\N	\N	\N
68915	SPECIFIC_DAY	2	0	2010-05-22	1326	68075	\N	\N	\N
68931	SPECIFIC_DAY	2	2	2010-05-05	1326	68075	\N	\N	\N
68928	SPECIFIC_DAY	2	2	2010-04-21	1326	68075	\N	\N	\N
68933	SPECIFIC_DAY	2	2	2010-04-30	1326	68075	\N	\N	\N
68927	SPECIFIC_DAY	2	2	2010-05-11	1326	68075	\N	\N	\N
68920	SPECIFIC_DAY	2	2	2010-05-12	1326	68075	\N	\N	\N
68913	SPECIFIC_DAY	2	0	2010-04-25	1326	68075	\N	\N	\N
68914	SPECIFIC_DAY	2	2	2010-04-20	1326	68075	\N	\N	\N
68917	SPECIFIC_DAY	2	2	2010-05-10	1326	68075	\N	\N	\N
68930	SPECIFIC_DAY	2	2	2010-05-25	1326	68075	\N	\N	\N
68925	SPECIFIC_DAY	2	2	2010-06-14	1326	68075	\N	\N	\N
68926	SPECIFIC_DAY	2	2	2010-05-07	1326	68075	\N	\N	\N
71070	GENERIC_DAY	2	4	2010-03-19	1324	\N	30421	\N	\N
71057	GENERIC_DAY	2	0	2010-05-01	1324	\N	30421	\N	\N
71043	GENERIC_DAY	2	9	2010-03-23	1324	\N	30421	\N	\N
71053	GENERIC_DAY	2	9	2010-03-31	1324	\N	30421	\N	\N
71069	GENERIC_DAY	2	9	2010-05-11	1324	\N	30421	\N	\N
71025	GENERIC_DAY	2	0	2010-04-10	1324	\N	30421	\N	\N
71047	GENERIC_DAY	2	9	2010-04-12	1324	\N	30421	\N	\N
71042	GENERIC_DAY	2	9	2010-05-05	1324	\N	30421	\N	\N
71033	GENERIC_DAY	2	9	2010-03-16	1324	\N	30421	\N	\N
71073	GENERIC_DAY	2	0	2010-04-25	1324	\N	30421	\N	\N
71072	GENERIC_DAY	2	9	2010-04-08	1324	\N	30421	\N	\N
71064	GENERIC_DAY	2	9	2010-03-15	1324	\N	30421	\N	\N
71044	GENERIC_DAY	2	9	2010-03-17	1324	\N	30421	\N	\N
71055	GENERIC_DAY	2	9	2010-03-22	1324	\N	30421	\N	\N
71058	GENERIC_DAY	2	9	2010-04-29	1324	\N	30421	\N	\N
71049	GENERIC_DAY	2	0	2010-04-17	1324	\N	30421	\N	\N
71028	GENERIC_DAY	2	9	2010-05-12	1324	\N	30421	\N	\N
71050	GENERIC_DAY	2	9	2010-03-25	1324	\N	30421	\N	\N
71041	GENERIC_DAY	2	9	2010-03-24	1324	\N	30421	\N	\N
71023	GENERIC_DAY	2	0	2010-03-21	1324	\N	30421	\N	\N
76192	GENERIC_DAY	1	1	2010-08-06	1328	\N	36161	\N	\N
76193	GENERIC_DAY	1	1	2010-10-08	1328	\N	36161	\N	\N
76194	GENERIC_DAY	1	6	2010-07-28	1328	\N	36161	\N	\N
76195	GENERIC_DAY	1	6	2010-09-09	1328	\N	36161	\N	\N
76196	GENERIC_DAY	1	6	2010-07-27	1328	\N	36161	\N	\N
76197	GENERIC_DAY	1	6	2010-10-12	1328	\N	36161	\N	\N
76198	GENERIC_DAY	1	1	2010-10-01	1328	\N	36161	\N	\N
76199	GENERIC_DAY	1	6	2010-09-21	1328	\N	36161	\N	\N
76200	GENERIC_DAY	1	6	2010-08-19	1328	\N	36161	\N	\N
76201	GENERIC_DAY	1	6	2010-08-12	1328	\N	36161	\N	\N
76202	GENERIC_DAY	1	6	2010-09-23	1328	\N	36161	\N	\N
76203	GENERIC_DAY	1	6	2010-07-26	1328	\N	36161	\N	\N
76204	GENERIC_DAY	1	6	2010-08-17	1328	\N	36161	\N	\N
76205	GENERIC_DAY	1	1	2010-09-03	1328	\N	36161	\N	\N
76206	GENERIC_DAY	1	6	2010-09-08	1328	\N	36161	\N	\N
76207	GENERIC_DAY	1	1	2010-09-24	1328	\N	36161	\N	\N
76208	GENERIC_DAY	1	6	2010-08-04	1328	\N	36161	\N	\N
76209	GENERIC_DAY	1	6	2010-08-31	1328	\N	36161	\N	\N
68905	SPECIFIC_DAY	2	2	2010-05-27	1326	68075	\N	\N	\N
68901	SPECIFIC_DAY	2	0	2010-06-05	1326	68075	\N	\N	\N
68911	SPECIFIC_DAY	2	0	2010-06-20	1326	68075	\N	\N	\N
68900	SPECIFIC_DAY	2	2	2010-06-23	1326	68075	\N	\N	\N
68909	SPECIFIC_DAY	2	0	2010-05-23	1326	68075	\N	\N	\N
68910	SPECIFIC_DAY	2	2	2010-05-04	1326	68075	\N	\N	\N
68904	SPECIFIC_DAY	2	2	2010-04-27	1326	68075	\N	\N	\N
86249	GENERIC_DAY	1	5	2010-09-20	1320	\N	20279	\N	\N
86250	GENERIC_DAY	1	6	2010-08-18	1320	\N	20279	\N	\N
86251	GENERIC_DAY	1	6	2010-08-30	1320	\N	20279	\N	\N
86252	GENERIC_DAY	1	6	2010-07-28	1320	\N	20279	\N	\N
86253	GENERIC_DAY	1	5	2010-09-15	1320	\N	20279	\N	\N
86254	GENERIC_DAY	1	1	2010-07-30	1320	\N	20279	\N	\N
86255	GENERIC_DAY	1	6	2010-08-26	1320	\N	20279	\N	\N
86256	GENERIC_DAY	1	6	2010-07-15	1320	\N	20279	\N	\N
86257	GENERIC_DAY	1	1	2010-08-06	1320	\N	20279	\N	\N
86258	GENERIC_DAY	1	6	2010-08-09	1320	\N	20279	\N	\N
86259	GENERIC_DAY	1	6	2010-08-05	1320	\N	20279	\N	\N
86260	GENERIC_DAY	1	5	2010-09-27	1320	\N	20279	\N	\N
86261	GENERIC_DAY	1	5	2010-09-23	1320	\N	20279	\N	\N
86262	GENERIC_DAY	1	6	2010-08-03	1320	\N	20279	\N	\N
86263	GENERIC_DAY	1	5	2010-09-06	1320	\N	20279	\N	\N
86264	GENERIC_DAY	1	5	2010-09-08	1320	\N	20279	\N	\N
76210	GENERIC_DAY	1	6	2010-09-07	1328	\N	36161	\N	\N
76211	GENERIC_DAY	1	6	2010-10-05	1328	\N	36161	\N	\N
76212	GENERIC_DAY	1	1	2010-07-30	1328	\N	36161	\N	\N
76213	GENERIC_DAY	1	6	2010-08-18	1328	\N	36161	\N	\N
76214	GENERIC_DAY	1	6	2010-10-06	1328	\N	36161	\N	\N
76215	GENERIC_DAY	1	6	2010-08-02	1328	\N	36161	\N	\N
76216	GENERIC_DAY	1	6	2010-08-25	1328	\N	36161	\N	\N
76217	GENERIC_DAY	1	6	2010-08-10	1328	\N	36161	\N	\N
76218	GENERIC_DAY	1	6	2010-09-29	1328	\N	36161	\N	\N
76219	GENERIC_DAY	1	6	2010-08-23	1328	\N	36161	\N	\N
76220	GENERIC_DAY	1	6	2010-07-22	1328	\N	36161	\N	\N
76221	GENERIC_DAY	1	6	2010-08-11	1328	\N	36161	\N	\N
76222	GENERIC_DAY	1	6	2010-08-05	1328	\N	36161	\N	\N
76223	GENERIC_DAY	1	1	2010-07-23	1328	\N	36161	\N	\N
76224	GENERIC_DAY	1	6	2010-10-11	1328	\N	36161	\N	\N
76225	GENERIC_DAY	1	1	2010-08-27	1328	\N	36161	\N	\N
76226	GENERIC_DAY	1	6	2010-08-16	1328	\N	36161	\N	\N
76227	GENERIC_DAY	1	6	2010-08-09	1328	\N	36161	\N	\N
76228	GENERIC_DAY	1	6	2010-08-30	1328	\N	36161	\N	\N
76229	GENERIC_DAY	1	6	2010-09-27	1328	\N	36161	\N	\N
76230	GENERIC_DAY	1	6	2010-09-14	1328	\N	36161	\N	\N
76231	GENERIC_DAY	1	6	2010-08-26	1328	\N	36161	\N	\N
76232	GENERIC_DAY	1	1	2010-08-20	1328	\N	36161	\N	\N
76233	GENERIC_DAY	1	6	2010-09-16	1328	\N	36161	\N	\N
76234	GENERIC_DAY	1	6	2010-08-03	1328	\N	36161	\N	\N
76235	GENERIC_DAY	1	6	2010-10-04	1328	\N	36161	\N	\N
76236	GENERIC_DAY	1	6	2010-10-13	1328	\N	36161	\N	\N
76237	GENERIC_DAY	1	6	2010-09-01	1328	\N	36161	\N	\N
76238	GENERIC_DAY	1	6	2010-09-13	1328	\N	36161	\N	\N
76239	GENERIC_DAY	1	6	2010-09-30	1328	\N	36161	\N	\N
76240	GENERIC_DAY	1	6	2010-09-22	1328	\N	36161	\N	\N
76241	GENERIC_DAY	1	6	2010-09-06	1328	\N	36161	\N	\N
76242	GENERIC_DAY	1	6	2010-09-20	1328	\N	36161	\N	\N
76243	GENERIC_DAY	1	6	2010-07-29	1328	\N	36161	\N	\N
76244	GENERIC_DAY	1	6	2010-09-28	1328	\N	36161	\N	\N
76245	GENERIC_DAY	1	1	2010-08-13	1328	\N	36161	\N	\N
76246	GENERIC_DAY	1	6	2010-08-24	1328	\N	36161	\N	\N
76247	GENERIC_DAY	1	1	2010-09-17	1328	\N	36161	\N	\N
71065	GENERIC_DAY	2	3	2010-05-13	1324	\N	30421	\N	\N
71062	GENERIC_DAY	2	0	2010-03-27	1324	\N	30421	\N	\N
76248	GENERIC_DAY	1	6	2010-09-02	1328	\N	36161	\N	\N
76249	GENERIC_DAY	1	6	2010-10-07	1328	\N	36161	\N	\N
76250	GENERIC_DAY	1	6	2010-09-15	1328	\N	36161	\N	\N
76251	GENERIC_DAY	1	1	2010-09-10	1328	\N	36161	\N	\N
76252	GENERIC_DAY	1	5	2010-08-03	1328	\N	36164	\N	\N
76253	GENERIC_DAY	1	0	2010-07-24	1328	\N	36164	\N	\N
76254	GENERIC_DAY	1	0	2010-08-14	1328	\N	36164	\N	\N
76255	GENERIC_DAY	1	0	2010-07-31	1328	\N	36164	\N	\N
76256	GENERIC_DAY	1	5	2010-08-02	1328	\N	36164	\N	\N
76257	GENERIC_DAY	1	0	2010-08-28	1328	\N	36164	\N	\N
76258	GENERIC_DAY	1	5	2010-08-19	1328	\N	36164	\N	\N
76259	GENERIC_DAY	1	0	2010-08-29	1328	\N	36164	\N	\N
76260	GENERIC_DAY	1	0	2010-08-15	1328	\N	36164	\N	\N
76261	GENERIC_DAY	1	5	2010-08-24	1328	\N	36164	\N	\N
76262	GENERIC_DAY	1	2	2010-07-30	1328	\N	36164	\N	\N
76263	GENERIC_DAY	1	0	2010-08-07	1328	\N	36164	\N	\N
76264	GENERIC_DAY	1	5	2010-07-27	1328	\N	36164	\N	\N
76265	GENERIC_DAY	1	0	2010-08-01	1328	\N	36164	\N	\N
76266	GENERIC_DAY	1	2	2010-08-20	1328	\N	36164	\N	\N
76267	GENERIC_DAY	1	5	2010-08-09	1328	\N	36164	\N	\N
76268	GENERIC_DAY	1	5	2010-08-25	1328	\N	36164	\N	\N
76269	GENERIC_DAY	1	5	2010-08-30	1328	\N	36164	\N	\N
76270	GENERIC_DAY	1	5	2010-08-05	1328	\N	36164	\N	\N
76271	GENERIC_DAY	1	5	2010-07-22	1328	\N	36164	\N	\N
76272	GENERIC_DAY	1	0	2010-08-08	1328	\N	36164	\N	\N
76273	GENERIC_DAY	1	0	2010-08-22	1328	\N	36164	\N	\N
76274	GENERIC_DAY	1	5	2010-08-16	1328	\N	36164	\N	\N
76275	GENERIC_DAY	1	2	2010-08-06	1328	\N	36164	\N	\N
76276	GENERIC_DAY	1	5	2010-08-11	1328	\N	36164	\N	\N
76277	GENERIC_DAY	1	2	2010-08-13	1328	\N	36164	\N	\N
76278	GENERIC_DAY	1	5	2010-07-28	1328	\N	36164	\N	\N
76279	GENERIC_DAY	1	5	2010-08-17	1328	\N	36164	\N	\N
76280	GENERIC_DAY	1	5	2010-07-29	1328	\N	36164	\N	\N
76281	GENERIC_DAY	1	2	2010-08-27	1328	\N	36164	\N	\N
76282	GENERIC_DAY	1	5	2010-08-26	1328	\N	36164	\N	\N
76283	GENERIC_DAY	1	5	2010-08-18	1328	\N	36164	\N	\N
76284	GENERIC_DAY	1	2	2010-07-23	1328	\N	36164	\N	\N
76285	GENERIC_DAY	1	0	2010-08-21	1328	\N	36164	\N	\N
76286	GENERIC_DAY	1	5	2010-07-26	1328	\N	36164	\N	\N
76287	GENERIC_DAY	1	5	2010-08-12	1328	\N	36164	\N	\N
29882	SPECIFIC_DAY	8	5	2010-03-22	19496	20292	\N	\N	\N
29851	SPECIFIC_DAY	8	0	2010-04-03	19496	20292	\N	\N	\N
29881	SPECIFIC_DAY	8	2	2010-04-02	19496	20292	\N	\N	\N
29858	SPECIFIC_DAY	8	5	2010-04-15	19496	20292	\N	\N	\N
29850	SPECIFIC_DAY	8	5	2010-04-26	19496	20292	\N	\N	\N
29826	SPECIFIC_DAY	8	2	2010-04-23	19496	20292	\N	\N	\N
29832	SPECIFIC_DAY	8	0	2010-03-27	19496	20292	\N	\N	\N
29876	SPECIFIC_DAY	8	5	2010-03-18	19496	20292	\N	\N	\N
29860	SPECIFIC_DAY	8	2	2010-03-19	19496	20292	\N	\N	\N
29845	SPECIFIC_DAY	8	5	2010-03-17	19496	20292	\N	\N	\N
29875	SPECIFIC_DAY	8	0	2010-03-14	19496	20292	\N	\N	\N
29840	SPECIFIC_DAY	8	5	2010-04-07	19496	20292	\N	\N	\N
29879	SPECIFIC_DAY	8	5	2010-03-25	19496	20292	\N	\N	\N
29863	SPECIFIC_DAY	8	0	2010-04-11	19496	20292	\N	\N	\N
29829	SPECIFIC_DAY	8	5	2010-03-09	19496	20292	\N	\N	\N
29842	SPECIFIC_DAY	8	5	2010-04-01	19496	20292	\N	\N	\N
29872	SPECIFIC_DAY	8	2	2010-05-07	19496	20292	\N	\N	\N
29887	SPECIFIC_DAY	8	5	2010-04-05	19496	20292	\N	\N	\N
29833	SPECIFIC_DAY	8	5	2010-04-08	19496	20292	\N	\N	\N
29827	SPECIFIC_DAY	8	0	2010-05-09	19496	20292	\N	\N	\N
29828	SPECIFIC_DAY	8	0	2010-03-21	19496	20292	\N	\N	\N
76288	GENERIC_DAY	1	0	2010-07-25	1328	\N	36164	\N	\N
76289	GENERIC_DAY	1	5	2010-08-04	1328	\N	36164	\N	\N
76290	GENERIC_DAY	1	5	2010-08-10	1328	\N	36164	\N	\N
76291	GENERIC_DAY	1	5	2010-08-23	1328	\N	36164	\N	\N
76292	GENERIC_DAY	1	0	2010-10-23	1328	\N	36167	\N	\N
76293	GENERIC_DAY	1	5	2010-11-22	1328	\N	36167	\N	\N
76294	GENERIC_DAY	1	5	2010-10-28	1328	\N	36167	\N	\N
76295	GENERIC_DAY	1	2	2010-10-15	1328	\N	36167	\N	\N
76296	GENERIC_DAY	1	5	2010-11-16	1328	\N	36167	\N	\N
76297	GENERIC_DAY	1	5	2010-12-07	1328	\N	36167	\N	\N
76298	GENERIC_DAY	1	5	2010-10-19	1328	\N	36167	\N	\N
76299	GENERIC_DAY	1	5	2010-11-08	1328	\N	36167	\N	\N
76300	GENERIC_DAY	1	0	2010-11-20	1328	\N	36167	\N	\N
76301	GENERIC_DAY	1	5	2010-11-01	1328	\N	36167	\N	\N
76302	GENERIC_DAY	1	0	2010-10-31	1328	\N	36167	\N	\N
76303	GENERIC_DAY	1	5	2010-12-02	1328	\N	36167	\N	\N
76304	GENERIC_DAY	1	5	2010-10-26	1328	\N	36167	\N	\N
76305	GENERIC_DAY	1	0	2010-11-13	1328	\N	36167	\N	\N
76306	GENERIC_DAY	1	5	2010-11-15	1328	\N	36167	\N	\N
76307	GENERIC_DAY	1	5	2010-12-13	1328	\N	36167	\N	\N
76308	GENERIC_DAY	1	5	2010-11-18	1328	\N	36167	\N	\N
76309	GENERIC_DAY	1	5	2010-12-09	1328	\N	36167	\N	\N
76310	GENERIC_DAY	1	5	2010-10-27	1328	\N	36167	\N	\N
76311	GENERIC_DAY	1	2	2010-10-22	1328	\N	36167	\N	\N
76312	GENERIC_DAY	1	5	2010-11-25	1328	\N	36167	\N	\N
76313	GENERIC_DAY	1	2	2010-12-16	1328	\N	36167	\N	\N
76314	GENERIC_DAY	1	5	2010-12-14	1328	\N	36167	\N	\N
76315	GENERIC_DAY	1	5	2010-11-17	1328	\N	36167	\N	\N
76316	GENERIC_DAY	1	0	2010-11-07	1328	\N	36167	\N	\N
76317	GENERIC_DAY	1	5	2010-10-21	1328	\N	36167	\N	\N
76318	GENERIC_DAY	1	2	2010-12-10	1328	\N	36167	\N	\N
76319	GENERIC_DAY	1	2	2010-11-26	1328	\N	36167	\N	\N
76320	GENERIC_DAY	1	0	2010-11-21	1328	\N	36167	\N	\N
76321	GENERIC_DAY	1	0	2010-12-05	1328	\N	36167	\N	\N
76322	GENERIC_DAY	1	0	2010-11-14	1328	\N	36167	\N	\N
76323	GENERIC_DAY	1	5	2010-11-30	1328	\N	36167	\N	\N
76324	GENERIC_DAY	1	0	2010-10-16	1328	\N	36167	\N	\N
76325	GENERIC_DAY	1	0	2010-12-04	1328	\N	36167	\N	\N
76326	GENERIC_DAY	1	5	2010-11-29	1328	\N	36167	\N	\N
76327	GENERIC_DAY	1	2	2010-11-05	1328	\N	36167	\N	\N
76328	GENERIC_DAY	1	0	2010-12-12	1328	\N	36167	\N	\N
76329	GENERIC_DAY	1	5	2010-10-20	1328	\N	36167	\N	\N
76330	GENERIC_DAY	1	2	2010-11-19	1328	\N	36167	\N	\N
76331	GENERIC_DAY	1	5	2010-12-15	1328	\N	36167	\N	\N
76332	GENERIC_DAY	1	5	2010-10-25	1328	\N	36167	\N	\N
76333	GENERIC_DAY	1	5	2010-11-11	1328	\N	36167	\N	\N
76334	GENERIC_DAY	1	5	2010-11-04	1328	\N	36167	\N	\N
76335	GENERIC_DAY	1	2	2010-11-12	1328	\N	36167	\N	\N
76336	GENERIC_DAY	1	5	2010-10-18	1328	\N	36167	\N	\N
76337	GENERIC_DAY	1	5	2010-11-09	1328	\N	36167	\N	\N
76338	GENERIC_DAY	1	2	2010-12-03	1328	\N	36167	\N	\N
76339	GENERIC_DAY	1	5	2010-11-23	1328	\N	36167	\N	\N
76340	GENERIC_DAY	1	5	2010-10-14	1328	\N	36167	\N	\N
76341	GENERIC_DAY	1	2	2010-10-29	1328	\N	36167	\N	\N
76342	GENERIC_DAY	1	0	2010-10-24	1328	\N	36167	\N	\N
76343	GENERIC_DAY	1	0	2010-10-30	1328	\N	36167	\N	\N
76344	GENERIC_DAY	1	0	2010-11-27	1328	\N	36167	\N	\N
76345	GENERIC_DAY	1	0	2010-11-06	1328	\N	36167	\N	\N
76346	GENERIC_DAY	1	0	2010-11-28	1328	\N	36167	\N	\N
76347	GENERIC_DAY	1	5	2010-12-06	1328	\N	36167	\N	\N
76348	GENERIC_DAY	1	0	2010-10-17	1328	\N	36167	\N	\N
76349	GENERIC_DAY	1	0	2010-12-11	1328	\N	36167	\N	\N
76350	GENERIC_DAY	1	5	2010-11-24	1328	\N	36167	\N	\N
76351	GENERIC_DAY	1	5	2010-12-08	1328	\N	36167	\N	\N
76352	GENERIC_DAY	1	5	2010-11-02	1328	\N	36167	\N	\N
76353	GENERIC_DAY	1	5	2010-11-10	1328	\N	36167	\N	\N
76354	GENERIC_DAY	1	5	2010-11-03	1328	\N	36167	\N	\N
76355	GENERIC_DAY	1	5	2010-12-01	1328	\N	36167	\N	\N
76356	GENERIC_DAY	1	9	2010-05-10	1326	\N	30498	\N	\N
76357	GENERIC_DAY	1	0	2010-05-15	1326	\N	30498	\N	\N
76358	GENERIC_DAY	1	9	2010-04-22	1326	\N	30498	\N	\N
76359	GENERIC_DAY	1	9	2010-05-18	1326	\N	30498	\N	\N
76360	GENERIC_DAY	1	9	2010-03-22	1326	\N	30498	\N	\N
76361	GENERIC_DAY	1	4	2010-04-09	1326	\N	30498	\N	\N
76362	GENERIC_DAY	1	0	2010-05-02	1326	\N	30498	\N	\N
76363	GENERIC_DAY	1	0	2010-04-10	1326	\N	30498	\N	\N
76364	GENERIC_DAY	1	0	2010-04-25	1326	\N	30498	\N	\N
76365	GENERIC_DAY	1	9	2010-04-28	1326	\N	30498	\N	\N
76366	GENERIC_DAY	1	0	2010-05-09	1326	\N	30498	\N	\N
76367	GENERIC_DAY	1	0	2010-05-16	1326	\N	30498	\N	\N
76368	GENERIC_DAY	1	0	2010-03-27	1326	\N	30498	\N	\N
76369	GENERIC_DAY	1	9	2010-04-19	1326	\N	30498	\N	\N
76370	GENERIC_DAY	1	9	2010-04-05	1326	\N	30498	\N	\N
76371	GENERIC_DAY	1	9	2010-04-21	1326	\N	30498	\N	\N
76372	GENERIC_DAY	1	9	2010-03-31	1326	\N	30498	\N	\N
76373	GENERIC_DAY	1	9	2010-04-14	1326	\N	30498	\N	\N
76374	GENERIC_DAY	1	4	2010-03-26	1326	\N	30498	\N	\N
76375	GENERIC_DAY	1	9	2010-05-04	1326	\N	30498	\N	\N
76376	GENERIC_DAY	1	9	2010-03-25	1326	\N	30498	\N	\N
76377	GENERIC_DAY	1	4	2010-04-23	1326	\N	30498	\N	\N
76378	GENERIC_DAY	1	4	2010-04-16	1326	\N	30498	\N	\N
76379	GENERIC_DAY	1	9	2010-03-29	1326	\N	30498	\N	\N
76380	GENERIC_DAY	1	0	2010-04-18	1326	\N	30498	\N	\N
76381	GENERIC_DAY	1	9	2010-05-19	1326	\N	30498	\N	\N
76382	GENERIC_DAY	1	3	2010-05-21	1326	\N	30498	\N	\N
76383	GENERIC_DAY	1	9	2010-04-20	1326	\N	30498	\N	\N
76384	GENERIC_DAY	1	9	2010-05-11	1326	\N	30498	\N	\N
76385	GENERIC_DAY	1	4	2010-05-07	1326	\N	30498	\N	\N
76386	GENERIC_DAY	1	0	2010-04-24	1326	\N	30498	\N	\N
76387	GENERIC_DAY	1	4	2010-04-02	1326	\N	30498	\N	\N
76388	GENERIC_DAY	1	9	2010-03-23	1326	\N	30498	\N	\N
76389	GENERIC_DAY	1	9	2010-04-08	1326	\N	30498	\N	\N
76390	GENERIC_DAY	1	0	2010-05-01	1326	\N	30498	\N	\N
76391	GENERIC_DAY	1	9	2010-04-07	1326	\N	30498	\N	\N
76392	GENERIC_DAY	1	9	2010-05-03	1326	\N	30498	\N	\N
76393	GENERIC_DAY	1	9	2010-04-13	1326	\N	30498	\N	\N
76394	GENERIC_DAY	1	4	2010-04-30	1326	\N	30498	\N	\N
76395	GENERIC_DAY	1	0	2010-04-11	1326	\N	30498	\N	\N
76396	GENERIC_DAY	1	9	2010-05-12	1326	\N	30498	\N	\N
76397	GENERIC_DAY	1	9	2010-04-01	1326	\N	30498	\N	\N
76398	GENERIC_DAY	1	9	2010-04-15	1326	\N	30498	\N	\N
76399	GENERIC_DAY	1	9	2010-05-20	1326	\N	30498	\N	\N
76400	GENERIC_DAY	1	9	2010-05-13	1326	\N	30498	\N	\N
76401	GENERIC_DAY	1	9	2010-04-29	1326	\N	30498	\N	\N
76402	GENERIC_DAY	1	9	2010-05-06	1326	\N	30498	\N	\N
76403	GENERIC_DAY	1	0	2010-04-03	1326	\N	30498	\N	\N
76404	GENERIC_DAY	1	0	2010-03-28	1326	\N	30498	\N	\N
76405	GENERIC_DAY	1	0	2010-05-08	1326	\N	30498	\N	\N
76406	GENERIC_DAY	1	9	2010-04-06	1326	\N	30498	\N	\N
76407	GENERIC_DAY	1	9	2010-04-26	1326	\N	30498	\N	\N
76408	GENERIC_DAY	1	9	2010-03-30	1326	\N	30498	\N	\N
76409	GENERIC_DAY	1	0	2010-04-04	1326	\N	30498	\N	\N
76410	GENERIC_DAY	1	4	2010-05-14	1326	\N	30498	\N	\N
76411	GENERIC_DAY	1	9	2010-04-27	1326	\N	30498	\N	\N
76412	GENERIC_DAY	1	9	2010-03-24	1326	\N	30498	\N	\N
76413	GENERIC_DAY	1	9	2010-05-05	1326	\N	30498	\N	\N
76414	GENERIC_DAY	1	9	2010-04-12	1326	\N	30498	\N	\N
76415	GENERIC_DAY	1	0	2010-04-17	1326	\N	30498	\N	\N
76416	GENERIC_DAY	1	9	2010-06-01	1326	\N	30499	\N	\N
76417	GENERIC_DAY	1	4	2010-06-25	1326	\N	30499	\N	\N
76418	GENERIC_DAY	1	4	2010-06-18	1326	\N	30499	\N	\N
76419	GENERIC_DAY	1	9	2010-06-22	1326	\N	30499	\N	\N
76420	GENERIC_DAY	1	9	2010-06-21	1326	\N	30499	\N	\N
76421	GENERIC_DAY	1	9	2010-06-07	1326	\N	30499	\N	\N
76422	GENERIC_DAY	1	9	2010-06-16	1326	\N	30499	\N	\N
76423	GENERIC_DAY	1	0	2010-06-20	1326	\N	30499	\N	\N
76424	GENERIC_DAY	1	0	2010-06-12	1326	\N	30499	\N	\N
76425	GENERIC_DAY	1	0	2010-05-29	1326	\N	30499	\N	\N
76426	GENERIC_DAY	1	9	2010-06-24	1326	\N	30499	\N	\N
76427	GENERIC_DAY	1	0	2010-06-13	1326	\N	30499	\N	\N
76428	GENERIC_DAY	1	9	2010-05-26	1326	\N	30499	\N	\N
76429	GENERIC_DAY	1	9	2010-05-25	1326	\N	30499	\N	\N
76430	GENERIC_DAY	1	0	2010-06-05	1326	\N	30499	\N	\N
76431	GENERIC_DAY	1	9	2010-06-02	1326	\N	30499	\N	\N
76432	GENERIC_DAY	1	0	2010-06-19	1326	\N	30499	\N	\N
76433	GENERIC_DAY	1	0	2010-05-30	1326	\N	30499	\N	\N
76434	GENERIC_DAY	1	9	2010-06-10	1326	\N	30499	\N	\N
76435	GENERIC_DAY	1	9	2010-06-14	1326	\N	30499	\N	\N
76436	GENERIC_DAY	1	0	2010-06-06	1326	\N	30499	\N	\N
76437	GENERIC_DAY	1	9	2010-06-15	1326	\N	30499	\N	\N
76438	GENERIC_DAY	1	0	2010-05-22	1326	\N	30499	\N	\N
76439	GENERIC_DAY	1	9	2010-06-23	1326	\N	30499	\N	\N
76440	GENERIC_DAY	1	9	2010-06-09	1326	\N	30499	\N	\N
76441	GENERIC_DAY	1	4	2010-05-28	1326	\N	30499	\N	\N
76442	GENERIC_DAY	1	9	2010-06-17	1326	\N	30499	\N	\N
76443	GENERIC_DAY	1	0	2010-05-23	1326	\N	30499	\N	\N
76444	GENERIC_DAY	1	4	2010-06-11	1326	\N	30499	\N	\N
76445	GENERIC_DAY	1	9	2010-05-24	1326	\N	30499	\N	\N
76446	GENERIC_DAY	1	9	2010-05-27	1326	\N	30499	\N	\N
76447	GENERIC_DAY	1	9	2010-06-03	1326	\N	30499	\N	\N
76448	GENERIC_DAY	1	9	2010-05-31	1326	\N	30499	\N	\N
76449	GENERIC_DAY	1	4	2010-06-04	1326	\N	30499	\N	\N
44072	GENERIC_DAY	33	8	2010-04-12	1314	\N	20210	\N	\N
44057	GENERIC_DAY	33	8	2010-03-24	1314	\N	20210	\N	\N
44066	GENERIC_DAY	33	8	2010-03-11	1314	\N	20210	\N	\N
44058	GENERIC_DAY	33	8	2010-04-02	1314	\N	20210	\N	\N
44077	GENERIC_DAY	33	8	2010-03-30	1314	\N	20210	\N	\N
76450	GENERIC_DAY	1	9	2010-06-08	1326	\N	30499	\N	\N
76451	GENERIC_DAY	1	9	2010-06-30	1326	\N	30500	\N	\N
76452	GENERIC_DAY	1	0	2010-06-26	1326	\N	30500	\N	\N
76453	GENERIC_DAY	1	4	2010-07-16	1326	\N	30500	\N	\N
76454	GENERIC_DAY	1	4	2010-07-02	1326	\N	30500	\N	\N
25785	GENERIC_DAY	12	9	2010-04-08	1318	\N	20274	\N	\N
25761	GENERIC_DAY	12	0	2010-03-14	1318	\N	20274	\N	\N
25766	GENERIC_DAY	12	9	2010-04-29	1318	\N	20274	\N	\N
25751	GENERIC_DAY	12	9	2010-04-22	1318	\N	20274	\N	\N
25750	GENERIC_DAY	12	0	2010-04-11	1318	\N	20274	\N	\N
25756	GENERIC_DAY	12	9	2010-03-11	1318	\N	20274	\N	\N
25775	GENERIC_DAY	12	9	2010-03-17	1318	\N	20274	\N	\N
25763	GENERIC_DAY	12	0	2010-05-02	1318	\N	20274	\N	\N
25778	GENERIC_DAY	12	9	2010-04-21	1318	\N	20274	\N	\N
25805	GENERIC_DAY	12	9	2010-03-18	1318	\N	20274	\N	\N
25798	GENERIC_DAY	12	9	2010-04-15	1318	\N	20274	\N	\N
25787	GENERIC_DAY	12	0	2010-03-27	1318	\N	20274	\N	\N
25752	GENERIC_DAY	12	9	2010-03-22	1318	\N	20274	\N	\N
25762	GENERIC_DAY	12	4	2010-04-02	1318	\N	20274	\N	\N
25802	GENERIC_DAY	12	4	2010-04-16	1318	\N	20274	\N	\N
44075	GENERIC_DAY	33	8	2010-04-01	1314	\N	20210	\N	\N
44067	GENERIC_DAY	33	8	2010-04-14	1314	\N	20210	\N	\N
44084	GENERIC_DAY	33	0	2010-03-20	1314	\N	20210	\N	\N
44079	GENERIC_DAY	33	8	2010-03-26	1314	\N	20210	\N	\N
44056	GENERIC_DAY	33	8	2010-03-18	1314	\N	20210	\N	\N
44082	GENERIC_DAY	33	8	2010-03-16	1314	\N	20210	\N	\N
44064	GENERIC_DAY	33	8	2010-03-17	1314	\N	20210	\N	\N
44070	GENERIC_DAY	33	0	2010-03-14	1314	\N	20210	\N	\N
44062	GENERIC_DAY	33	8	2010-03-09	1314	\N	20210	\N	\N
44083	GENERIC_DAY	33	8	2010-03-15	1314	\N	20210	\N	\N
44074	GENERIC_DAY	33	8	2010-04-16	1314	\N	20210	\N	\N
44065	GENERIC_DAY	33	0	2010-04-04	1314	\N	20210	\N	\N
44055	GENERIC_DAY	33	8	2010-03-08	1314	\N	20210	\N	\N
44073	GENERIC_DAY	33	8	2010-04-15	1314	\N	20210	\N	\N
44068	GENERIC_DAY	33	0	2010-03-13	1314	\N	20210	\N	\N
44086	GENERIC_DAY	33	0	2010-03-21	1314	\N	20210	\N	\N
86442	GENERIC_DAY	1	0	2010-07-03	1318	\N	20276	\N	\N
86443	GENERIC_DAY	1	4	2010-06-25	1318	\N	20276	\N	\N
86444	GENERIC_DAY	1	9	2010-06-22	1318	\N	20276	\N	\N
86445	GENERIC_DAY	1	0	2010-06-26	1318	\N	20276	\N	\N
86446	GENERIC_DAY	1	9	2010-06-23	1318	\N	20276	\N	\N
86447	GENERIC_DAY	1	9	2010-07-01	1318	\N	20276	\N	\N
44085	GENERIC_DAY	33	8	2010-03-31	1314	\N	20210	\N	\N
44078	GENERIC_DAY	33	0	2010-03-28	1314	\N	20210	\N	\N
44063	GENERIC_DAY	33	8	2010-03-12	1314	\N	20210	\N	\N
44059	GENERIC_DAY	33	8	2010-03-19	1314	\N	20210	\N	\N
76470	SPECIFIC_DAY	0	8	2010-03-24	19498	30469	\N	\N	\N
76471	SPECIFIC_DAY	0	16	2010-03-08	19498	30469	\N	\N	\N
76472	SPECIFIC_DAY	0	16	2010-03-16	19498	30469	\N	\N	\N
76473	SPECIFIC_DAY	0	16	2010-03-18	19498	30469	\N	\N	\N
76474	SPECIFIC_DAY	0	0	2010-03-13	19498	30469	\N	\N	\N
76475	SPECIFIC_DAY	0	0	2010-03-21	19498	30469	\N	\N	\N
76476	SPECIFIC_DAY	0	16	2010-03-19	19498	30469	\N	\N	\N
76477	SPECIFIC_DAY	0	0	2010-03-20	19498	30469	\N	\N	\N
76478	SPECIFIC_DAY	0	16	2010-03-09	19498	30469	\N	\N	\N
76479	SPECIFIC_DAY	0	16	2010-03-11	19498	30469	\N	\N	\N
76480	SPECIFIC_DAY	0	16	2010-03-22	19498	30469	\N	\N	\N
76481	SPECIFIC_DAY	0	16	2010-03-23	19498	30469	\N	\N	\N
76482	SPECIFIC_DAY	0	16	2010-03-10	19498	30469	\N	\N	\N
76483	SPECIFIC_DAY	0	16	2010-03-17	19498	30469	\N	\N	\N
76484	SPECIFIC_DAY	0	16	2010-03-15	19498	30469	\N	\N	\N
76485	SPECIFIC_DAY	0	16	2010-03-12	19498	30469	\N	\N	\N
76486	SPECIFIC_DAY	0	0	2010-03-14	19498	30469	\N	\N	\N
68885	SPECIFIC_DAY	2	2	2010-05-28	1326	68075	\N	\N	\N
68863	SPECIFIC_DAY	2	0	2010-06-12	1326	68075	\N	\N	\N
68866	SPECIFIC_DAY	2	0	2010-06-13	1326	68075	\N	\N	\N
68891	SPECIFIC_DAY	2	2	2010-06-21	1326	68075	\N	\N	\N
68874	SPECIFIC_DAY	2	2	2010-06-04	1326	68075	\N	\N	\N
68889	SPECIFIC_DAY	2	2	2010-06-24	1326	68075	\N	\N	\N
68892	SPECIFIC_DAY	2	2	2010-06-25	1326	68075	\N	\N	\N
68884	SPECIFIC_DAY	2	2	2010-06-08	1326	68075	\N	\N	\N
68880	SPECIFIC_DAY	2	2	2010-05-20	1326	68075	\N	\N	\N
68873	SPECIFIC_DAY	2	2	2010-05-24	1326	68075	\N	\N	\N
68867	SPECIFIC_DAY	2	2	2010-06-18	1326	68075	\N	\N	\N
68872	SPECIFIC_DAY	2	0	2010-05-15	1326	68075	\N	\N	\N
68869	SPECIFIC_DAY	2	2	2010-04-29	1326	68075	\N	\N	\N
68890	SPECIFIC_DAY	2	2	2010-05-26	1326	68075	\N	\N	\N
83081	GENERIC_DAY	13	0	2010-03-21	2728	\N	82822	\N	\N
83114	GENERIC_DAY	13	0	2010-03-27	1316	\N	82822	\N	\N
83074	GENERIC_DAY	13	0	2010-03-16	1314	\N	82822	\N	\N
83103	GENERIC_DAY	13	0	2010-04-03	1316	\N	82822	\N	\N
83112	GENERIC_DAY	13	0	2010-03-12	1314	\N	82822	\N	\N
83087	GENERIC_DAY	13	6	2010-03-19	1316	\N	82822	\N	\N
83065	GENERIC_DAY	13	4	2010-03-23	1316	\N	82822	\N	\N
83066	GENERIC_DAY	13	4	2010-03-24	2728	\N	82822	\N	\N
83111	GENERIC_DAY	13	4	2010-03-17	2728	\N	82822	\N	\N
83072	GENERIC_DAY	13	4	2010-03-18	2728	\N	82822	\N	\N
83097	GENERIC_DAY	13	4	2010-03-25	2728	\N	82822	\N	\N
83071	GENERIC_DAY	13	0	2010-03-11	1314	\N	82822	\N	\N
83067	GENERIC_DAY	13	4	2010-03-16	1316	\N	82822	\N	\N
83091	GENERIC_DAY	13	0	2010-03-30	1314	\N	82822	\N	\N
83083	GENERIC_DAY	13	0	2010-03-20	1314	\N	82822	\N	\N
83113	GENERIC_DAY	13	4	2010-03-30	2728	\N	82822	\N	\N
83068	GENERIC_DAY	13	8	2010-03-12	2728	\N	82822	\N	\N
83121	GENERIC_DAY	13	4	2010-03-16	2728	\N	82822	\N	\N
83122	GENERIC_DAY	13	0	2010-03-26	1314	\N	82822	\N	\N
83125	GENERIC_DAY	13	0	2010-03-14	1314	\N	82822	\N	\N
83119	GENERIC_DAY	13	0	2010-03-18	1314	\N	82822	\N	\N
83126	GENERIC_DAY	13	0	2010-03-17	1314	\N	82822	\N	\N
83136	GENERIC_DAY	13	0	2010-04-02	1314	\N	82822	\N	\N
83139	GENERIC_DAY	13	2	2010-03-26	2728	\N	82822	\N	\N
83131	GENERIC_DAY	13	4	2010-03-24	1316	\N	82822	\N	\N
83138	GENERIC_DAY	13	4	2010-03-29	2728	\N	82822	\N	\N
83145	GENERIC_DAY	13	0	2010-03-20	2728	\N	82822	\N	\N
83093	GENERIC_DAY	13	0	2010-03-13	2728	\N	82822	\N	\N
68886	SPECIFIC_DAY	2	0	2010-04-18	1326	68075	\N	\N	\N
68883	SPECIFIC_DAY	2	0	2010-06-19	1326	68075	\N	\N	\N
68894	SPECIFIC_DAY	2	0	2010-04-24	1326	68075	\N	\N	\N
68875	SPECIFIC_DAY	2	2	2010-05-06	1326	68075	\N	\N	\N
68899	SPECIFIC_DAY	2	2	2010-06-10	1326	68075	\N	\N	\N
68893	SPECIFIC_DAY	2	2	2010-04-16	1326	68075	\N	\N	\N
68887	SPECIFIC_DAY	2	2	2010-04-28	1326	68075	\N	\N	\N
68912	SPECIFIC_DAY	2	2	2010-05-21	1326	68075	\N	\N	\N
68908	SPECIFIC_DAY	2	0	2010-04-17	1326	68075	\N	\N	\N
68879	SPECIFIC_DAY	2	2	2010-06-16	1326	68075	\N	\N	\N
68864	SPECIFIC_DAY	2	2	2010-05-19	1326	68075	\N	\N	\N
68907	SPECIFIC_DAY	2	2	2010-06-11	1326	68075	\N	\N	\N
68881	SPECIFIC_DAY	2	2	2010-05-13	1326	68075	\N	\N	\N
68876	SPECIFIC_DAY	2	2	2010-04-23	1326	68075	\N	\N	\N
68902	SPECIFIC_DAY	2	2	2010-06-15	1326	68075	\N	\N	\N
68895	SPECIFIC_DAY	2	2	2010-06-22	1326	68075	\N	\N	\N
68906	SPECIFIC_DAY	2	2	2010-04-26	1326	68075	\N	\N	\N
68878	SPECIFIC_DAY	2	2	2010-05-31	1326	68075	\N	\N	\N
68896	SPECIFIC_DAY	2	0	2010-05-08	1326	68075	\N	\N	\N
68903	SPECIFIC_DAY	2	2	2010-05-14	1326	68075	\N	\N	\N
68871	SPECIFIC_DAY	2	2	2010-06-03	1326	68075	\N	\N	\N
68877	SPECIFIC_DAY	2	0	2010-05-02	1326	68075	\N	\N	\N
68898	SPECIFIC_DAY	2	2	2010-04-19	1326	68075	\N	\N	\N
68870	SPECIFIC_DAY	2	2	2010-06-17	1326	68075	\N	\N	\N
68888	SPECIFIC_DAY	2	0	2010-05-30	1326	68075	\N	\N	\N
68868	SPECIFIC_DAY	2	2	2010-06-07	1326	68075	\N	\N	\N
68882	SPECIFIC_DAY	2	2	2010-06-02	1326	68075	\N	\N	\N
68865	SPECIFIC_DAY	2	0	2010-05-29	1326	68075	\N	\N	\N
86265	GENERIC_DAY	1	6	2010-08-12	1320	\N	20279	\N	\N
86266	GENERIC_DAY	1	5	2010-09-30	1320	\N	20279	\N	\N
86267	GENERIC_DAY	1	6	2010-07-12	1320	\N	20279	\N	\N
86268	GENERIC_DAY	1	5	2010-09-29	1320	\N	20279	\N	\N
86269	GENERIC_DAY	1	1	2010-07-16	1320	\N	20279	\N	\N
86270	GENERIC_DAY	1	5	2010-09-14	1320	\N	20279	\N	\N
86271	GENERIC_DAY	1	6	2010-08-19	1320	\N	20279	\N	\N
86272	GENERIC_DAY	1	6	2010-07-20	1320	\N	20279	\N	\N
86273	GENERIC_DAY	1	5	2010-10-04	1320	\N	20279	\N	\N
86274	GENERIC_DAY	1	6	2010-09-01	1320	\N	20279	\N	\N
86275	GENERIC_DAY	1	6	2010-07-22	1320	\N	20279	\N	\N
86276	GENERIC_DAY	1	6	2010-08-16	1320	\N	20279	\N	\N
86277	GENERIC_DAY	1	6	2010-07-14	1320	\N	20279	\N	\N
86278	GENERIC_DAY	1	5	2010-09-07	1320	\N	20279	\N	\N
86279	GENERIC_DAY	1	6	2010-09-02	1320	\N	20279	\N	\N
86280	GENERIC_DAY	1	6	2010-07-26	1320	\N	20279	\N	\N
86281	GENERIC_DAY	1	1	2010-07-09	1320	\N	20279	\N	\N
86282	GENERIC_DAY	1	6	2010-08-17	1320	\N	20279	\N	\N
86283	GENERIC_DAY	1	5	2010-09-21	1320	\N	20279	\N	\N
86284	GENERIC_DAY	1	6	2010-08-25	1320	\N	20279	\N	\N
86285	GENERIC_DAY	1	6	2010-08-04	1320	\N	20279	\N	\N
86286	GENERIC_DAY	1	5	2010-10-05	1320	\N	20279	\N	\N
86287	GENERIC_DAY	1	5	2010-09-09	1320	\N	20279	\N	\N
86288	GENERIC_DAY	1	6	2010-07-21	1320	\N	20279	\N	\N
86289	GENERIC_DAY	1	5	2010-09-28	1320	\N	20279	\N	\N
86290	GENERIC_DAY	1	6	2010-08-02	1320	\N	20279	\N	\N
86291	GENERIC_DAY	1	6	2010-07-19	1320	\N	20279	\N	\N
86292	GENERIC_DAY	1	6	2010-07-29	1320	\N	20279	\N	\N
86293	GENERIC_DAY	1	6	2010-08-23	1320	\N	20279	\N	\N
86294	GENERIC_DAY	1	1	2010-08-27	1320	\N	20279	\N	\N
86295	GENERIC_DAY	1	5	2010-09-22	1320	\N	20279	\N	\N
86296	GENERIC_DAY	1	6	2010-08-24	1320	\N	20279	\N	\N
86297	GENERIC_DAY	1	1	2010-08-20	1320	\N	20279	\N	\N
86298	GENERIC_DAY	1	5	2010-09-13	1320	\N	20279	\N	\N
86299	GENERIC_DAY	1	6	2010-07-13	1320	\N	20279	\N	\N
86300	GENERIC_DAY	1	6	2010-08-11	1320	\N	20279	\N	\N
86301	GENERIC_DAY	1	6	2010-08-31	1320	\N	20279	\N	\N
86302	GENERIC_DAY	1	6	2010-07-27	1320	\N	20279	\N	\N
86303	GENERIC_DAY	1	1	2010-08-13	1320	\N	20279	\N	\N
86304	GENERIC_DAY	1	5	2010-10-07	1320	\N	20279	\N	\N
86305	GENERIC_DAY	1	5	2010-10-06	1320	\N	20279	\N	\N
86306	GENERIC_DAY	1	1	2010-07-23	1320	\N	20279	\N	\N
86307	GENERIC_DAY	1	5	2010-09-16	1320	\N	20279	\N	\N
86308	GENERIC_DAY	1	6	2010-08-10	1320	\N	20279	\N	\N
86309	GENERIC_DAY	1	5	2010-07-28	1320	\N	20290	\N	\N
86310	GENERIC_DAY	1	0	2010-07-11	1320	\N	20290	\N	\N
86311	GENERIC_DAY	1	0	2010-07-31	1320	\N	20290	\N	\N
86312	GENERIC_DAY	1	5	2010-07-26	1320	\N	20290	\N	\N
86313	GENERIC_DAY	1	0	2010-07-10	1320	\N	20290	\N	\N
86314	GENERIC_DAY	1	2	2010-07-16	1320	\N	20290	\N	\N
86315	GENERIC_DAY	1	5	2010-08-04	1320	\N	20290	\N	\N
86316	GENERIC_DAY	1	5	2010-07-20	1320	\N	20290	\N	\N
86317	GENERIC_DAY	1	5	2010-07-15	1320	\N	20290	\N	\N
86318	GENERIC_DAY	1	5	2010-07-22	1320	\N	20290	\N	\N
86319	GENERIC_DAY	1	2	2010-07-09	1320	\N	20290	\N	\N
86320	GENERIC_DAY	1	5	2010-07-12	1320	\N	20290	\N	\N
86321	GENERIC_DAY	1	5	2010-07-27	1320	\N	20290	\N	\N
86322	GENERIC_DAY	1	5	2010-08-03	1320	\N	20290	\N	\N
83123	GENERIC_DAY	13	0	2010-03-28	2728	\N	82822	\N	\N
83101	GENERIC_DAY	13	0	2010-04-03	1314	\N	82822	\N	\N
76455	GENERIC_DAY	1	9	2010-07-19	1326	\N	30500	\N	\N
76456	GENERIC_DAY	1	9	2010-07-14	1326	\N	30500	\N	\N
76457	GENERIC_DAY	1	9	2010-07-13	1326	\N	30500	\N	\N
76458	GENERIC_DAY	1	0	2010-07-18	1326	\N	30500	\N	\N
76459	GENERIC_DAY	1	2	2010-07-21	1326	\N	30500	\N	\N
76460	GENERIC_DAY	1	9	2010-07-20	1326	\N	30500	\N	\N
76461	GENERIC_DAY	1	0	2010-07-03	1326	\N	30500	\N	\N
76462	GENERIC_DAY	1	0	2010-06-27	1326	\N	30500	\N	\N
76463	GENERIC_DAY	1	9	2010-06-29	1326	\N	30500	\N	\N
76464	GENERIC_DAY	1	9	2010-06-28	1326	\N	30500	\N	\N
76465	GENERIC_DAY	1	9	2010-07-15	1326	\N	30500	\N	\N
76466	GENERIC_DAY	1	9	2010-07-12	1326	\N	30500	\N	\N
76467	GENERIC_DAY	1	0	2010-07-17	1326	\N	30500	\N	\N
76468	GENERIC_DAY	1	9	2010-07-01	1326	\N	30500	\N	\N
76469	GENERIC_DAY	1	0	2010-07-04	1326	\N	30500	\N	\N
86323	GENERIC_DAY	1	0	2010-07-17	1320	\N	20290	\N	\N
86324	GENERIC_DAY	1	5	2010-08-02	1320	\N	20290	\N	\N
86325	GENERIC_DAY	1	0	2010-07-24	1320	\N	20290	\N	\N
86326	GENERIC_DAY	1	5	2010-07-21	1320	\N	20290	\N	\N
86327	GENERIC_DAY	1	0	2010-08-01	1320	\N	20290	\N	\N
86328	GENERIC_DAY	1	2	2010-07-30	1320	\N	20290	\N	\N
86329	GENERIC_DAY	1	5	2010-07-13	1320	\N	20290	\N	\N
86330	GENERIC_DAY	1	0	2010-07-25	1320	\N	20290	\N	\N
86331	GENERIC_DAY	1	0	2010-07-18	1320	\N	20290	\N	\N
86332	GENERIC_DAY	1	2	2010-07-23	1320	\N	20290	\N	\N
86333	GENERIC_DAY	1	5	2010-07-29	1320	\N	20290	\N	\N
86334	GENERIC_DAY	1	5	2010-07-19	1320	\N	20290	\N	\N
86335	GENERIC_DAY	1	5	2010-07-14	1320	\N	20290	\N	\N
86336	GENERIC_DAY	1	6	2010-10-18	19496	\N	55957	\N	\N
86337	GENERIC_DAY	1	0	2010-10-30	1322	\N	55957	\N	\N
86338	GENERIC_DAY	1	0	2010-10-24	1322	\N	55957	\N	\N
86339	GENERIC_DAY	1	6	2010-10-25	1322	\N	55957	\N	\N
86340	GENERIC_DAY	1	3	2010-10-15	1324	\N	55957	\N	\N
86341	GENERIC_DAY	1	6	2010-10-21	1322	\N	55957	\N	\N
86342	GENERIC_DAY	1	0	2010-10-31	1324	\N	55957	\N	\N
86343	GENERIC_DAY	1	6	2010-10-18	1322	\N	55957	\N	\N
86344	GENERIC_DAY	1	6	2010-10-28	19496	\N	55957	\N	\N
86345	GENERIC_DAY	1	6	2010-10-21	1324	\N	55957	\N	\N
86346	GENERIC_DAY	1	6	2010-10-14	19496	\N	55957	\N	\N
86347	GENERIC_DAY	1	3	2010-10-22	1324	\N	55957	\N	\N
86348	GENERIC_DAY	1	0	2010-10-17	1324	\N	55957	\N	\N
86349	GENERIC_DAY	1	6	2010-10-27	1322	\N	55957	\N	\N
86350	GENERIC_DAY	1	6	2010-10-25	19496	\N	55957	\N	\N
99683	GENERIC_DAY	2	0	2010-05-13	1330	\N	97569	\N	\N
99679	GENERIC_DAY	2	1	2010-04-21	1322	\N	97569	\N	\N
99516	GENERIC_DAY	2	0	2010-04-23	1330	\N	97569	\N	\N
100010	GENERIC_DAY	2	0	2010-04-17	19494	\N	97569	\N	\N
99970	GENERIC_DAY	2	0	2010-05-14	19494	\N	97569	\N	\N
99682	GENERIC_DAY	2	0	2010-05-13	19500	\N	97569	\N	\N
99740	GENERIC_DAY	2	0	2010-04-30	1332	\N	97569	\N	\N
99981	GENERIC_DAY	2	0	2010-04-22	1320	\N	97569	\N	\N
99529	GENERIC_DAY	2	0	2010-05-14	1320	\N	97569	\N	\N
99655	GENERIC_DAY	2	0	2010-04-24	1330	\N	97569	\N	\N
99875	GENERIC_DAY	2	0	2010-05-05	1330	\N	97569	\N	\N
99813	GENERIC_DAY	2	1	2010-04-29	2728	\N	97569	\N	\N
99594	GENERIC_DAY	2	0	2010-04-17	1326	\N	97569	\N	\N
101262	GENERIC_DAY	1	0	2010-04-23	1318	\N	97571	\N	\N
101263	GENERIC_DAY	1	0	2010-04-17	1314	\N	97571	\N	\N
101264	GENERIC_DAY	1	1	2010-05-14	61308	\N	97571	\N	\N
101265	GENERIC_DAY	1	0	2010-05-05	61308	\N	97571	\N	\N
101266	GENERIC_DAY	1	0	2010-04-13	19500	\N	97571	\N	\N
101267	GENERIC_DAY	1	1	2010-04-16	61308	\N	97571	\N	\N
101268	GENERIC_DAY	1	0	2010-04-23	1332	\N	97571	\N	\N
101269	GENERIC_DAY	1	0	2010-04-19	19498	\N	97571	\N	\N
101270	GENERIC_DAY	1	0	2010-05-16	1326	\N	97571	\N	\N
101271	GENERIC_DAY	1	0	2010-04-21	1326	\N	97571	\N	\N
101272	GENERIC_DAY	1	0	2010-04-14	19500	\N	97571	\N	\N
101273	GENERIC_DAY	1	0	2010-05-16	1320	\N	97571	\N	\N
101274	GENERIC_DAY	1	0	2010-04-22	1316	\N	97571	\N	\N
101275	GENERIC_DAY	1	0	2010-04-24	1314	\N	97571	\N	\N
101276	GENERIC_DAY	1	0	2010-04-22	1320	\N	97571	\N	\N
101277	GENERIC_DAY	1	0	2010-05-02	19494	\N	97571	\N	\N
101278	GENERIC_DAY	1	0	2010-05-06	1332	\N	97571	\N	\N
101279	GENERIC_DAY	1	0	2010-05-01	19496	\N	97571	\N	\N
101280	GENERIC_DAY	1	0	2010-05-09	1326	\N	97571	\N	\N
101281	GENERIC_DAY	1	0	2010-04-28	19500	\N	97571	\N	\N
101282	GENERIC_DAY	1	0	2010-04-29	1324	\N	97571	\N	\N
101283	GENERIC_DAY	1	0	2010-04-26	1330	\N	97571	\N	\N
101284	GENERIC_DAY	1	0	2010-05-15	1322	\N	97571	\N	\N
101285	GENERIC_DAY	1	0	2010-05-07	2728	\N	97571	\N	\N
101286	GENERIC_DAY	1	1	2010-04-13	19494	\N	97571	\N	\N
101287	GENERIC_DAY	1	0	2010-05-12	1320	\N	97571	\N	\N
101288	GENERIC_DAY	1	0	2010-04-20	1318	\N	97571	\N	\N
101289	GENERIC_DAY	1	0	2010-05-13	1330	\N	97571	\N	\N
101290	GENERIC_DAY	1	0	2010-05-04	1326	\N	97571	\N	\N
101291	GENERIC_DAY	1	0	2010-05-06	1314	\N	97571	\N	\N
101292	GENERIC_DAY	1	0	2010-05-11	50401	\N	97571	\N	\N
101293	GENERIC_DAY	1	0	2010-04-26	1318	\N	97571	\N	\N
101294	GENERIC_DAY	1	0	2010-04-24	1328	\N	97571	\N	\N
101295	GENERIC_DAY	1	1	2010-05-14	40199	\N	97571	\N	\N
101296	GENERIC_DAY	1	0	2010-05-05	1326	\N	97571	\N	\N
101297	GENERIC_DAY	1	0	2010-05-15	1318	\N	97571	\N	\N
101298	GENERIC_DAY	1	0	2010-05-14	1314	\N	97571	\N	\N
101299	GENERIC_DAY	1	1	2010-04-14	2728	\N	97571	\N	\N
101300	GENERIC_DAY	1	0	2010-05-02	1314	\N	97571	\N	\N
101301	GENERIC_DAY	1	0	2010-05-05	50401	\N	97571	\N	\N
101302	GENERIC_DAY	1	0	2010-04-25	19498	\N	97571	\N	\N
101303	GENERIC_DAY	1	1	2010-04-26	2728	\N	97571	\N	\N
101304	GENERIC_DAY	1	0	2010-04-20	1316	\N	97571	\N	\N
101305	GENERIC_DAY	1	1	2010-05-11	2728	\N	97571	\N	\N
101306	GENERIC_DAY	1	0	2010-04-14	40199	\N	97571	\N	\N
101307	GENERIC_DAY	1	0	2010-05-16	85043	\N	97571	\N	\N
101308	GENERIC_DAY	1	0	2010-05-05	1332	\N	97571	\N	\N
101309	GENERIC_DAY	1	0	2010-04-23	1314	\N	97571	\N	\N
101310	GENERIC_DAY	1	0	2010-04-14	1318	\N	97571	\N	\N
101311	GENERIC_DAY	1	0	2010-04-20	1324	\N	97571	\N	\N
99919	GENERIC_DAY	2	0	2010-04-26	1324	\N	97569	\N	\N
99945	GENERIC_DAY	2	0	2010-05-16	1322	\N	97569	\N	\N
99895	GENERIC_DAY	2	0	2010-05-12	19494	\N	97569	\N	\N
99515	GENERIC_DAY	2	0	2010-05-04	1328	\N	97569	\N	\N
99726	GENERIC_DAY	2	0	2010-04-29	85043	\N	97569	\N	\N
99556	GENERIC_DAY	2	0	2010-04-24	19498	\N	97569	\N	\N
99508	GENERIC_DAY	2	0	2010-04-15	19496	\N	97569	\N	\N
99558	GENERIC_DAY	2	0	2010-05-04	1330	\N	97569	\N	\N
101312	GENERIC_DAY	1	0	2010-04-15	19498	\N	97571	\N	\N
101313	GENERIC_DAY	1	0	2010-05-07	1314	\N	97571	\N	\N
101314	GENERIC_DAY	1	1	2010-04-16	1316	\N	97571	\N	\N
101315	GENERIC_DAY	1	0	2010-04-28	1316	\N	97571	\N	\N
101316	GENERIC_DAY	1	0	2010-04-26	19500	\N	97571	\N	\N
101317	GENERIC_DAY	1	0	2010-05-11	1324	\N	97571	\N	\N
101318	GENERIC_DAY	1	0	2010-04-23	1320	\N	97571	\N	\N
101319	GENERIC_DAY	1	0	2010-04-19	1326	\N	97571	\N	\N
101320	GENERIC_DAY	1	0	2010-04-27	1326	\N	97571	\N	\N
101321	GENERIC_DAY	1	0	2010-05-12	1330	\N	97571	\N	\N
101322	GENERIC_DAY	1	0	2010-05-01	19494	\N	97571	\N	\N
101323	GENERIC_DAY	1	0	2010-05-05	85043	\N	97571	\N	\N
101324	GENERIC_DAY	1	0	2010-04-23	2728	\N	97571	\N	\N
101325	GENERIC_DAY	1	0	2010-04-18	1322	\N	97571	\N	\N
101326	GENERIC_DAY	1	1	2010-04-13	1328	\N	97571	\N	\N
101327	GENERIC_DAY	1	1	2010-05-03	1332	\N	97571	\N	\N
101328	GENERIC_DAY	1	0	2010-05-02	19496	\N	97571	\N	\N
101329	GENERIC_DAY	1	0	2010-05-02	1326	\N	97571	\N	\N
101330	GENERIC_DAY	1	0	2010-05-08	1332	\N	97571	\N	\N
101331	GENERIC_DAY	1	0	2010-05-11	1330	\N	97571	\N	\N
101332	GENERIC_DAY	1	0	2010-05-09	19494	\N	97571	\N	\N
101333	GENERIC_DAY	1	0	2010-04-17	2728	\N	97571	\N	\N
101334	GENERIC_DAY	1	0	2010-04-28	1320	\N	97571	\N	\N
101335	GENERIC_DAY	1	0	2010-04-16	1332	\N	97571	\N	\N
101336	GENERIC_DAY	1	1	2010-05-07	85043	\N	97571	\N	\N
101337	GENERIC_DAY	1	0	2010-04-13	1326	\N	97571	\N	\N
101338	GENERIC_DAY	1	0	2010-04-25	50401	\N	97571	\N	\N
101339	GENERIC_DAY	1	1	2010-04-28	2728	\N	97571	\N	\N
101340	GENERIC_DAY	1	1	2010-04-29	1322	\N	97571	\N	\N
101341	GENERIC_DAY	1	0	2010-04-29	50401	\N	97571	\N	\N
101342	GENERIC_DAY	1	1	2010-05-12	19494	\N	97571	\N	\N
101343	GENERIC_DAY	1	0	2010-05-15	19500	\N	97571	\N	\N
101344	GENERIC_DAY	1	0	2010-05-13	1314	\N	97571	\N	\N
101345	GENERIC_DAY	1	0	2010-05-09	1318	\N	97571	\N	\N
101346	GENERIC_DAY	1	0	2010-05-05	40199	\N	97571	\N	\N
101347	GENERIC_DAY	1	0	2010-04-17	1316	\N	97571	\N	\N
101348	GENERIC_DAY	1	1	2010-04-21	1328	\N	97571	\N	\N
101349	GENERIC_DAY	1	0	2010-04-22	1324	\N	97571	\N	\N
101350	GENERIC_DAY	1	1	2010-05-12	1322	\N	97571	\N	\N
101351	GENERIC_DAY	1	0	2010-04-27	1316	\N	97571	\N	\N
101352	GENERIC_DAY	1	0	2010-05-08	1326	\N	97571	\N	\N
101353	GENERIC_DAY	1	0	2010-04-18	19500	\N	97571	\N	\N
101354	GENERIC_DAY	1	0	2010-04-20	1330	\N	97571	\N	\N
101355	GENERIC_DAY	1	0	2010-05-05	1324	\N	97571	\N	\N
101356	GENERIC_DAY	1	1	2010-05-14	85043	\N	97571	\N	\N
101357	GENERIC_DAY	1	0	2010-05-01	1316	\N	97571	\N	\N
101358	GENERIC_DAY	1	0	2010-04-13	1314	\N	97571	\N	\N
101359	GENERIC_DAY	1	0	2010-04-14	50401	\N	97571	\N	\N
101360	GENERIC_DAY	1	0	2010-04-30	1332	\N	97571	\N	\N
101361	GENERIC_DAY	1	0	2010-05-14	1328	\N	97571	\N	\N
101362	GENERIC_DAY	1	0	2010-05-14	1318	\N	97571	\N	\N
101363	GENERIC_DAY	1	1	2010-04-21	19494	\N	97571	\N	\N
101364	GENERIC_DAY	1	0	2010-05-11	1332	\N	97571	\N	\N
101365	GENERIC_DAY	1	1	2010-05-10	19494	\N	97571	\N	\N
101366	GENERIC_DAY	1	1	2010-04-19	19494	\N	97571	\N	\N
101367	GENERIC_DAY	1	0	2010-04-27	1320	\N	97571	\N	\N
101368	GENERIC_DAY	1	0	2010-05-08	2728	\N	97571	\N	\N
101369	GENERIC_DAY	1	0	2010-05-16	1330	\N	97571	\N	\N
101370	GENERIC_DAY	1	0	2010-04-24	50401	\N	97571	\N	\N
101371	GENERIC_DAY	1	0	2010-05-01	1324	\N	97571	\N	\N
101372	GENERIC_DAY	1	0	2010-05-07	1322	\N	97571	\N	\N
101373	GENERIC_DAY	1	0	2010-04-25	1328	\N	97571	\N	\N
101374	GENERIC_DAY	1	0	2010-04-13	1316	\N	97571	\N	\N
101375	GENERIC_DAY	1	0	2010-04-27	50401	\N	97571	\N	\N
101376	GENERIC_DAY	1	0	2010-04-28	85043	\N	97571	\N	\N
101377	GENERIC_DAY	1	0	2010-04-20	1314	\N	97571	\N	\N
101378	GENERIC_DAY	1	1	2010-04-15	1322	\N	97571	\N	\N
101379	GENERIC_DAY	1	0	2010-05-16	40199	\N	97571	\N	\N
101380	GENERIC_DAY	1	0	2010-05-14	1324	\N	97571	\N	\N
101381	GENERIC_DAY	1	0	2010-05-07	19500	\N	97571	\N	\N
101382	GENERIC_DAY	1	1	2010-04-22	1328	\N	97571	\N	\N
101383	GENERIC_DAY	1	0	2010-05-07	1332	\N	97571	\N	\N
101384	GENERIC_DAY	1	1	2010-05-11	19494	\N	97571	\N	\N
101385	GENERIC_DAY	1	0	2010-04-17	1328	\N	97571	\N	\N
101386	GENERIC_DAY	1	0	2010-05-06	19498	\N	97571	\N	\N
101387	GENERIC_DAY	1	0	2010-05-03	19496	\N	97571	\N	\N
101388	GENERIC_DAY	1	0	2010-04-16	19498	\N	97571	\N	\N
101389	GENERIC_DAY	1	0	2010-05-03	1314	\N	97571	\N	\N
101390	GENERIC_DAY	1	0	2010-04-23	1324	\N	97571	\N	\N
101391	GENERIC_DAY	1	0	2010-04-13	40199	\N	97571	\N	\N
101392	GENERIC_DAY	1	1	2010-04-28	1322	\N	97571	\N	\N
101393	GENERIC_DAY	1	0	2010-05-04	19498	\N	97571	\N	\N
101394	GENERIC_DAY	1	0	2010-04-24	1324	\N	97571	\N	\N
101395	GENERIC_DAY	1	0	2010-04-25	1324	\N	97571	\N	\N
101396	GENERIC_DAY	1	0	2010-05-15	1316	\N	97571	\N	\N
101397	GENERIC_DAY	1	0	2010-04-18	1314	\N	97571	\N	\N
101398	GENERIC_DAY	1	0	2010-05-10	19498	\N	97571	\N	\N
101399	GENERIC_DAY	1	0	2010-04-25	1316	\N	97571	\N	\N
101400	GENERIC_DAY	1	0	2010-05-08	1322	\N	97571	\N	\N
101401	GENERIC_DAY	1	0	2010-04-14	19498	\N	97571	\N	\N
101402	GENERIC_DAY	1	0	2010-04-23	1328	\N	97571	\N	\N
101403	GENERIC_DAY	1	0	2010-04-20	19500	\N	97571	\N	\N
101404	GENERIC_DAY	1	0	2010-05-03	61308	\N	97571	\N	\N
101405	GENERIC_DAY	1	0	2010-05-04	1320	\N	97571	\N	\N
101406	GENERIC_DAY	1	0	2010-04-27	1330	\N	97571	\N	\N
101407	GENERIC_DAY	1	0	2010-04-29	1330	\N	97571	\N	\N
101408	GENERIC_DAY	1	1	2010-04-23	61308	\N	97571	\N	\N
101409	GENERIC_DAY	1	0	2010-05-16	1314	\N	97571	\N	\N
101410	GENERIC_DAY	1	0	2010-04-15	61308	\N	97571	\N	\N
101411	GENERIC_DAY	1	0	2010-05-01	1322	\N	97571	\N	\N
101412	GENERIC_DAY	1	0	2010-04-15	40199	\N	97571	\N	\N
102050	GENERIC_DAY	0	0	2010-04-25	2728	\N	97573	\N	\N
102051	GENERIC_DAY	0	0	2010-05-09	1314	\N	97573	\N	\N
102052	GENERIC_DAY	0	0	2010-05-14	1318	\N	97573	\N	\N
102053	GENERIC_DAY	0	1	2010-05-11	1316	\N	97573	\N	\N
102054	GENERIC_DAY	0	0	2010-05-15	1324	\N	97573	\N	\N
102055	GENERIC_DAY	0	0	2010-04-19	1318	\N	97573	\N	\N
102056	GENERIC_DAY	0	0	2010-04-21	50401	\N	97573	\N	\N
102057	GENERIC_DAY	0	0	2010-05-14	19496	\N	97573	\N	\N
102058	GENERIC_DAY	0	0	2010-05-03	1326	\N	97573	\N	\N
102059	GENERIC_DAY	0	0	2010-05-16	1316	\N	97573	\N	\N
102060	GENERIC_DAY	0	0	2010-04-29	1326	\N	97573	\N	\N
102061	GENERIC_DAY	0	0	2010-04-29	2728	\N	97573	\N	\N
102062	GENERIC_DAY	0	0	2010-05-09	1330	\N	97573	\N	\N
102063	GENERIC_DAY	0	0	2010-05-16	1332	\N	97573	\N	\N
102064	GENERIC_DAY	0	0	2010-05-07	1320	\N	97573	\N	\N
102065	GENERIC_DAY	0	0	2010-04-14	1330	\N	97573	\N	\N
102066	GENERIC_DAY	0	0	2010-04-21	1326	\N	97573	\N	\N
102067	GENERIC_DAY	0	0	2010-05-01	50401	\N	97573	\N	\N
102068	GENERIC_DAY	0	0	2010-04-19	2728	\N	97573	\N	\N
102069	GENERIC_DAY	0	0	2010-04-18	1318	\N	97573	\N	\N
102070	GENERIC_DAY	0	0	2010-04-28	1322	\N	97573	\N	\N
102071	GENERIC_DAY	0	0	2010-04-26	19496	\N	97573	\N	\N
102072	GENERIC_DAY	0	1	2010-04-20	61308	\N	97573	\N	\N
102073	GENERIC_DAY	0	0	2010-05-10	2728	\N	97573	\N	\N
102074	GENERIC_DAY	0	0	2010-05-08	1330	\N	97573	\N	\N
102075	GENERIC_DAY	0	0	2010-05-04	1318	\N	97573	\N	\N
102076	GENERIC_DAY	0	0	2010-05-11	1324	\N	97573	\N	\N
102077	GENERIC_DAY	0	0	2010-05-08	61308	\N	97573	\N	\N
102078	GENERIC_DAY	0	0	2010-05-01	19496	\N	97573	\N	\N
102079	GENERIC_DAY	0	0	2010-05-14	1326	\N	97573	\N	\N
102080	GENERIC_DAY	0	1	2010-05-13	19494	\N	97573	\N	\N
102081	GENERIC_DAY	0	0	2010-05-03	19498	\N	97573	\N	\N
102082	GENERIC_DAY	0	0	2010-05-05	1330	\N	97573	\N	\N
102083	GENERIC_DAY	0	1	2010-05-04	85043	\N	97573	\N	\N
102084	GENERIC_DAY	0	0	2010-05-08	19498	\N	97573	\N	\N
102085	GENERIC_DAY	0	0	2010-05-16	1326	\N	97573	\N	\N
102086	GENERIC_DAY	0	1	2010-04-22	1328	\N	97573	\N	\N
102087	GENERIC_DAY	0	1	2010-05-07	85043	\N	97573	\N	\N
102088	GENERIC_DAY	0	1	2010-05-06	85043	\N	97573	\N	\N
102089	GENERIC_DAY	0	0	2010-04-20	1332	\N	97573	\N	\N
102090	GENERIC_DAY	0	1	2010-05-12	19494	\N	97573	\N	\N
102091	GENERIC_DAY	0	0	2010-04-24	1314	\N	97573	\N	\N
102092	GENERIC_DAY	0	0	2010-05-01	1322	\N	97573	\N	\N
102093	GENERIC_DAY	0	0	2010-04-13	1332	\N	97573	\N	\N
102094	GENERIC_DAY	0	0	2010-04-15	1318	\N	97573	\N	\N
102095	GENERIC_DAY	0	0	2010-04-26	1322	\N	97573	\N	\N
102096	GENERIC_DAY	0	0	2010-05-01	2728	\N	97573	\N	\N
102097	GENERIC_DAY	0	0	2010-05-12	1318	\N	97573	\N	\N
102098	GENERIC_DAY	0	0	2010-05-15	1330	\N	97573	\N	\N
102099	GENERIC_DAY	0	0	2010-05-14	1328	\N	97573	\N	\N
102100	GENERIC_DAY	0	0	2010-05-11	1318	\N	97573	\N	\N
102101	GENERIC_DAY	0	0	2010-04-24	1328	\N	97573	\N	\N
102102	GENERIC_DAY	0	0	2010-05-08	2728	\N	97573	\N	\N
102103	GENERIC_DAY	0	0	2010-04-22	1316	\N	97573	\N	\N
102104	GENERIC_DAY	0	1	2010-04-23	50401	\N	97573	\N	\N
102105	GENERIC_DAY	0	0	2010-04-21	1324	\N	97573	\N	\N
102106	GENERIC_DAY	0	0	2010-04-15	19496	\N	97573	\N	\N
102107	GENERIC_DAY	0	0	2010-05-04	1322	\N	97573	\N	\N
102108	GENERIC_DAY	0	0	2010-05-13	1326	\N	97573	\N	\N
102109	GENERIC_DAY	0	0	2010-04-16	1322	\N	97573	\N	\N
102110	GENERIC_DAY	0	0	2010-04-19	1330	\N	97573	\N	\N
102111	GENERIC_DAY	0	0	2010-04-18	19496	\N	97573	\N	\N
102112	GENERIC_DAY	0	0	2010-04-28	1326	\N	97573	\N	\N
102113	GENERIC_DAY	0	1	2010-05-14	1316	\N	97573	\N	\N
102114	GENERIC_DAY	0	0	2010-04-28	19498	\N	97573	\N	\N
102115	GENERIC_DAY	0	0	2010-05-01	61308	\N	97573	\N	\N
102116	GENERIC_DAY	0	0	2010-04-13	1326	\N	97573	\N	\N
102117	GENERIC_DAY	0	0	2010-04-26	50401	\N	97573	\N	\N
102118	GENERIC_DAY	0	0	2010-04-25	1328	\N	97573	\N	\N
102119	GENERIC_DAY	0	0	2010-05-12	61308	\N	97573	\N	\N
102120	GENERIC_DAY	0	0	2010-05-05	50401	\N	97573	\N	\N
102121	GENERIC_DAY	0	0	2010-05-05	1324	\N	97573	\N	\N
102122	GENERIC_DAY	0	0	2010-05-04	19494	\N	97573	\N	\N
102123	GENERIC_DAY	0	0	2010-05-04	1314	\N	97573	\N	\N
102124	GENERIC_DAY	0	0	2010-04-20	85043	\N	97573	\N	\N
102125	GENERIC_DAY	0	0	2010-04-17	19498	\N	97573	\N	\N
102126	GENERIC_DAY	0	0	2010-05-07	19494	\N	97573	\N	\N
102127	GENERIC_DAY	0	0	2010-05-07	1326	\N	97573	\N	\N
102128	GENERIC_DAY	0	0	2010-05-13	19496	\N	97573	\N	\N
102129	GENERIC_DAY	0	0	2010-05-07	19498	\N	97573	\N	\N
102130	GENERIC_DAY	0	0	2010-04-18	61308	\N	97573	\N	\N
102131	GENERIC_DAY	0	0	2010-04-24	19500	\N	97573	\N	\N
102132	GENERIC_DAY	0	1	2010-04-22	19494	\N	97573	\N	\N
102133	GENERIC_DAY	0	0	2010-04-19	1322	\N	97573	\N	\N
102134	GENERIC_DAY	0	1	2010-04-16	1316	\N	97573	\N	\N
102135	GENERIC_DAY	0	0	2010-05-12	1332	\N	97573	\N	\N
102136	GENERIC_DAY	0	0	2010-04-25	1320	\N	97573	\N	\N
102137	GENERIC_DAY	0	0	2010-05-02	19500	\N	97573	\N	\N
102138	GENERIC_DAY	0	1	2010-05-10	1328	\N	97573	\N	\N
102139	GENERIC_DAY	0	1	2010-04-16	40199	\N	97573	\N	\N
102140	GENERIC_DAY	0	0	2010-04-13	1322	\N	97573	\N	\N
102141	GENERIC_DAY	0	0	2010-05-06	50401	\N	97573	\N	\N
102142	GENERIC_DAY	0	0	2010-04-26	1326	\N	97573	\N	\N
102143	GENERIC_DAY	0	0	2010-04-27	2728	\N	97573	\N	\N
102144	GENERIC_DAY	0	0	2010-04-19	50401	\N	97573	\N	\N
102145	GENERIC_DAY	0	0	2010-05-06	1318	\N	97573	\N	\N
102146	GENERIC_DAY	0	0	2010-05-11	1320	\N	97573	\N	\N
102147	GENERIC_DAY	0	0	2010-05-08	85043	\N	97573	\N	\N
102148	GENERIC_DAY	0	0	2010-05-15	1326	\N	97573	\N	\N
102149	GENERIC_DAY	0	0	2010-04-13	19496	\N	97573	\N	\N
102150	GENERIC_DAY	0	0	2010-05-11	85043	\N	97573	\N	\N
102151	GENERIC_DAY	0	0	2010-04-22	19496	\N	97573	\N	\N
102152	GENERIC_DAY	0	0	2010-05-12	19498	\N	97573	\N	\N
102153	GENERIC_DAY	0	0	2010-05-10	50401	\N	97573	\N	\N
102154	GENERIC_DAY	0	0	2010-04-19	1324	\N	97573	\N	\N
102155	GENERIC_DAY	0	0	2010-04-26	1330	\N	97573	\N	\N
102156	GENERIC_DAY	0	0	2010-04-23	1332	\N	97573	\N	\N
102157	GENERIC_DAY	0	0	2010-04-18	1330	\N	97573	\N	\N
102158	GENERIC_DAY	0	0	2010-05-07	1324	\N	97573	\N	\N
102159	GENERIC_DAY	0	0	2010-04-14	1320	\N	97573	\N	\N
102160	GENERIC_DAY	0	0	2010-04-27	50401	\N	97573	\N	\N
102161	GENERIC_DAY	0	0	2010-05-15	19494	\N	97573	\N	\N
102162	GENERIC_DAY	0	0	2010-05-15	1316	\N	97573	\N	\N
102163	GENERIC_DAY	0	1	2010-05-10	19494	\N	97573	\N	\N
102164	GENERIC_DAY	0	0	2010-05-10	19500	\N	97573	\N	\N
102165	GENERIC_DAY	0	1	2010-04-19	61308	\N	97573	\N	\N
102166	GENERIC_DAY	0	1	2010-04-21	61308	\N	97573	\N	\N
102167	GENERIC_DAY	0	0	2010-05-15	1332	\N	97573	\N	\N
102168	GENERIC_DAY	0	0	2010-05-06	2728	\N	97573	\N	\N
102169	GENERIC_DAY	0	0	2010-05-16	1322	\N	97573	\N	\N
102170	GENERIC_DAY	0	0	2010-05-16	1318	\N	97573	\N	\N
102171	GENERIC_DAY	0	0	2010-04-21	85043	\N	97573	\N	\N
102172	GENERIC_DAY	0	0	2010-05-14	19500	\N	97573	\N	\N
102173	GENERIC_DAY	0	0	2010-05-17	61308	\N	97573	\N	\N
102174	GENERIC_DAY	0	0	2010-05-09	19494	\N	97573	\N	\N
102175	GENERIC_DAY	0	0	2010-05-17	50401	\N	97573	\N	\N
102176	GENERIC_DAY	0	0	2010-05-05	1314	\N	97573	\N	\N
102177	GENERIC_DAY	0	0	2010-04-25	19494	\N	97573	\N	\N
102178	GENERIC_DAY	0	1	2010-05-07	50401	\N	97573	\N	\N
102179	GENERIC_DAY	0	0	2010-05-07	1330	\N	97573	\N	\N
102180	GENERIC_DAY	0	0	2010-05-06	1332	\N	97573	\N	\N
102181	GENERIC_DAY	0	0	2010-04-30	1326	\N	97573	\N	\N
102182	GENERIC_DAY	0	0	2010-04-17	1318	\N	97573	\N	\N
102183	GENERIC_DAY	0	0	2010-05-08	40199	\N	97573	\N	\N
102184	GENERIC_DAY	0	0	2010-05-08	1324	\N	97573	\N	\N
102185	GENERIC_DAY	0	1	2010-04-26	19494	\N	97573	\N	\N
102186	GENERIC_DAY	0	0	2010-05-17	1332	\N	97573	\N	\N
102187	GENERIC_DAY	0	0	2010-04-18	19500	\N	97573	\N	\N
102188	GENERIC_DAY	0	0	2010-05-04	1330	\N	97573	\N	\N
102189	GENERIC_DAY	0	1	2010-04-26	1328	\N	97573	\N	\N
102190	GENERIC_DAY	0	0	2010-05-01	1326	\N	97573	\N	\N
102191	GENERIC_DAY	0	0	2010-05-07	1318	\N	97573	\N	\N
102192	GENERIC_DAY	0	0	2010-04-26	85043	\N	97573	\N	\N
102193	GENERIC_DAY	0	0	2010-04-29	19496	\N	97573	\N	\N
102194	GENERIC_DAY	0	0	2010-04-21	19498	\N	97573	\N	\N
102195	GENERIC_DAY	0	1	2010-04-13	19494	\N	97573	\N	\N
102196	GENERIC_DAY	0	0	2010-04-18	1328	\N	97573	\N	\N
102197	GENERIC_DAY	0	1	2010-04-13	40199	\N	97573	\N	\N
102198	GENERIC_DAY	0	1	2010-05-13	1328	\N	97573	\N	\N
102199	GENERIC_DAY	0	0	2010-05-06	1322	\N	97573	\N	\N
102200	GENERIC_DAY	0	0	2010-04-16	1324	\N	97573	\N	\N
102201	GENERIC_DAY	0	0	2010-05-11	40199	\N	97573	\N	\N
102202	GENERIC_DAY	0	0	2010-05-09	1322	\N	97573	\N	\N
102203	GENERIC_DAY	0	0	2010-04-14	1324	\N	97573	\N	\N
102204	GENERIC_DAY	0	0	2010-05-08	19496	\N	97573	\N	\N
102205	GENERIC_DAY	0	0	2010-04-24	1332	\N	97573	\N	\N
102206	GENERIC_DAY	0	0	2010-04-30	19500	\N	97573	\N	\N
102207	GENERIC_DAY	0	0	2010-04-21	1318	\N	97573	\N	\N
102208	GENERIC_DAY	0	0	2010-04-18	1324	\N	97573	\N	\N
102209	GENERIC_DAY	0	0	2010-04-13	19498	\N	97573	\N	\N
102210	GENERIC_DAY	0	0	2010-05-13	85043	\N	97573	\N	\N
102211	GENERIC_DAY	0	0	2010-05-05	19494	\N	97573	\N	\N
102212	GENERIC_DAY	0	0	2010-05-16	19496	\N	97573	\N	\N
102213	GENERIC_DAY	0	0	2010-05-08	1322	\N	97573	\N	\N
102214	GENERIC_DAY	0	1	2010-04-21	40199	\N	97573	\N	\N
102215	GENERIC_DAY	0	0	2010-05-10	19498	\N	97573	\N	\N
102216	GENERIC_DAY	0	1	2010-04-22	40199	\N	97573	\N	\N
102217	GENERIC_DAY	0	0	2010-05-16	50401	\N	97573	\N	\N
102218	GENERIC_DAY	0	0	2010-05-13	1324	\N	97573	\N	\N
102219	GENERIC_DAY	0	0	2010-04-20	1314	\N	97573	\N	\N
102220	GENERIC_DAY	0	0	2010-04-26	2728	\N	97573	\N	\N
102221	GENERIC_DAY	0	0	2010-05-10	1318	\N	97573	\N	\N
102222	GENERIC_DAY	0	1	2010-05-11	1328	\N	97573	\N	\N
102223	GENERIC_DAY	0	0	2010-05-06	1320	\N	97573	\N	\N
102224	GENERIC_DAY	0	0	2010-04-21	1322	\N	97573	\N	\N
102225	GENERIC_DAY	0	0	2010-04-20	50401	\N	97573	\N	\N
102226	GENERIC_DAY	0	0	2010-04-13	1330	\N	97573	\N	\N
102227	GENERIC_DAY	0	1	2010-04-14	19494	\N	97573	\N	\N
102228	GENERIC_DAY	0	0	2010-05-12	1326	\N	97573	\N	\N
102229	GENERIC_DAY	0	0	2010-05-06	19496	\N	97573	\N	\N
102230	GENERIC_DAY	0	0	2010-04-18	1322	\N	97573	\N	\N
102231	GENERIC_DAY	0	1	2010-05-03	2728	\N	97573	\N	\N
102232	GENERIC_DAY	0	0	2010-05-08	1326	\N	97573	\N	\N
102233	GENERIC_DAY	0	0	2010-05-13	61308	\N	97573	\N	\N
102234	GENERIC_DAY	0	0	2010-05-02	19496	\N	97573	\N	\N
102235	GENERIC_DAY	0	1	2010-04-30	85043	\N	97573	\N	\N
102236	GENERIC_DAY	0	0	2010-04-15	19500	\N	97573	\N	\N
102237	GENERIC_DAY	0	0	2010-04-28	19500	\N	97573	\N	\N
102238	GENERIC_DAY	0	0	2010-04-28	2728	\N	97573	\N	\N
102239	GENERIC_DAY	0	0	2010-05-07	1332	\N	97573	\N	\N
102240	GENERIC_DAY	0	0	2010-04-15	1322	\N	97573	\N	\N
102241	GENERIC_DAY	0	0	2010-04-24	19494	\N	97573	\N	\N
102242	GENERIC_DAY	0	0	2010-05-16	19498	\N	97573	\N	\N
102243	GENERIC_DAY	0	0	2010-05-01	1316	\N	97573	\N	\N
102244	GENERIC_DAY	0	0	2010-04-17	1328	\N	97573	\N	\N
102245	GENERIC_DAY	0	0	2010-04-18	2728	\N	97573	\N	\N
102246	GENERIC_DAY	0	0	2010-04-30	19494	\N	97573	\N	\N
102247	GENERIC_DAY	0	0	2010-04-22	1322	\N	97573	\N	\N
102248	GENERIC_DAY	0	0	2010-05-04	19496	\N	97573	\N	\N
102249	GENERIC_DAY	0	0	2010-04-25	1324	\N	97573	\N	\N
102250	GENERIC_DAY	0	0	2010-04-28	1332	\N	97573	\N	\N
102251	GENERIC_DAY	0	0	2010-04-20	1322	\N	97573	\N	\N
102252	GENERIC_DAY	0	0	2010-05-11	1326	\N	97573	\N	\N
102253	GENERIC_DAY	0	0	2010-04-22	1326	\N	97573	\N	\N
102254	GENERIC_DAY	0	0	2010-04-22	19498	\N	97573	\N	\N
102255	GENERIC_DAY	0	0	2010-05-16	2728	\N	97573	\N	\N
102256	GENERIC_DAY	0	0	2010-04-28	1314	\N	97573	\N	\N
102257	GENERIC_DAY	0	0	2010-05-11	50401	\N	97573	\N	\N
102258	GENERIC_DAY	0	1	2010-04-29	19494	\N	97573	\N	\N
102259	GENERIC_DAY	0	0	2010-05-04	2728	\N	97573	\N	\N
102260	GENERIC_DAY	0	0	2010-05-04	19500	\N	97573	\N	\N
102261	GENERIC_DAY	0	0	2010-04-15	1320	\N	97573	\N	\N
102262	GENERIC_DAY	0	0	2010-04-23	19496	\N	97573	\N	\N
102263	GENERIC_DAY	0	0	2010-04-27	1332	\N	97573	\N	\N
102264	GENERIC_DAY	0	0	2010-05-04	19498	\N	97573	\N	\N
102265	GENERIC_DAY	0	0	2010-05-09	1324	\N	97573	\N	\N
102266	GENERIC_DAY	0	0	2010-04-20	19498	\N	97573	\N	\N
102267	GENERIC_DAY	0	0	2010-04-17	1324	\N	97573	\N	\N
102268	GENERIC_DAY	0	0	2010-05-17	1322	\N	97573	\N	\N
102269	GENERIC_DAY	0	0	2010-05-02	1328	\N	97573	\N	\N
102270	GENERIC_DAY	0	0	2010-05-10	85043	\N	97573	\N	\N
102271	GENERIC_DAY	0	0	2010-04-22	2728	\N	97573	\N	\N
102272	GENERIC_DAY	0	0	2010-05-02	40199	\N	97573	\N	\N
102273	GENERIC_DAY	0	0	2010-05-06	19494	\N	97573	\N	\N
102274	GENERIC_DAY	0	0	2010-04-23	19500	\N	97573	\N	\N
102275	GENERIC_DAY	0	0	2010-05-09	1332	\N	97573	\N	\N
102276	GENERIC_DAY	0	0	2010-04-23	1320	\N	97573	\N	\N
102277	GENERIC_DAY	0	0	2010-05-13	1330	\N	97573	\N	\N
102278	GENERIC_DAY	0	0	2010-05-01	19500	\N	97573	\N	\N
102279	GENERIC_DAY	0	0	2010-05-15	1328	\N	97573	\N	\N
102280	GENERIC_DAY	0	0	2010-05-08	19494	\N	97573	\N	\N
102281	GENERIC_DAY	0	0	2010-05-05	1326	\N	97573	\N	\N
102282	GENERIC_DAY	0	1	2010-04-16	50401	\N	97573	\N	\N
102283	GENERIC_DAY	0	0	2010-05-05	19496	\N	97573	\N	\N
102284	GENERIC_DAY	0	1	2010-05-03	1322	\N	97573	\N	\N
102285	GENERIC_DAY	0	0	2010-05-09	1326	\N	97573	\N	\N
102286	GENERIC_DAY	0	0	2010-05-11	19496	\N	97573	\N	\N
102287	GENERIC_DAY	0	0	2010-04-15	1330	\N	97573	\N	\N
102288	GENERIC_DAY	0	0	2010-05-06	1326	\N	97573	\N	\N
102289	GENERIC_DAY	0	1	2010-05-05	1328	\N	97573	\N	\N
102290	GENERIC_DAY	0	1	2010-04-22	61308	\N	97573	\N	\N
102291	GENERIC_DAY	0	0	2010-04-30	61308	\N	97573	\N	\N
102292	GENERIC_DAY	0	0	2010-05-16	1330	\N	97573	\N	\N
102293	GENERIC_DAY	0	1	2010-05-14	85043	\N	97573	\N	\N
102294	GENERIC_DAY	0	0	2010-05-09	1320	\N	97573	\N	\N
102295	GENERIC_DAY	0	0	2010-04-21	19500	\N	97573	\N	\N
102296	GENERIC_DAY	0	1	2010-04-15	1328	\N	97573	\N	\N
102297	GENERIC_DAY	0	0	2010-04-16	1320	\N	97573	\N	\N
102298	GENERIC_DAY	0	1	2010-04-19	40199	\N	97573	\N	\N
102299	GENERIC_DAY	0	0	2010-05-11	1322	\N	97573	\N	\N
102300	GENERIC_DAY	0	0	2010-05-11	19498	\N	97573	\N	\N
102301	GENERIC_DAY	0	0	2010-04-30	19496	\N	97573	\N	\N
102302	GENERIC_DAY	0	1	2010-05-17	40199	\N	97573	\N	\N
102303	GENERIC_DAY	0	1	2010-05-11	2728	\N	97573	\N	\N
102304	GENERIC_DAY	0	0	2010-05-14	19494	\N	97573	\N	\N
102305	GENERIC_DAY	0	0	2010-05-04	1320	\N	97573	\N	\N
102306	GENERIC_DAY	0	0	2010-04-27	1318	\N	97573	\N	\N
102307	GENERIC_DAY	0	1	2010-05-12	1316	\N	97573	\N	\N
102308	GENERIC_DAY	0	0	2010-05-06	19498	\N	97573	\N	\N
102309	GENERIC_DAY	0	0	2010-05-01	1330	\N	97573	\N	\N
102310	GENERIC_DAY	0	0	2010-04-24	50401	\N	97573	\N	\N
102311	GENERIC_DAY	0	0	2010-05-12	85043	\N	97573	\N	\N
102312	GENERIC_DAY	0	0	2010-05-08	1320	\N	97573	\N	\N
102313	GENERIC_DAY	0	1	2010-04-15	61308	\N	97573	\N	\N
102314	GENERIC_DAY	0	0	2010-04-30	2728	\N	97573	\N	\N
102315	GENERIC_DAY	0	0	2010-04-19	19500	\N	97573	\N	\N
102316	GENERIC_DAY	0	0	2010-04-18	1320	\N	97573	\N	\N
102317	GENERIC_DAY	0	0	2010-05-09	19496	\N	97573	\N	\N
102318	GENERIC_DAY	0	0	2010-04-29	50401	\N	97573	\N	\N
102319	GENERIC_DAY	0	0	2010-04-23	1326	\N	97573	\N	\N
102320	GENERIC_DAY	0	1	2010-04-28	40199	\N	97573	\N	\N
102321	GENERIC_DAY	0	0	2010-04-29	1320	\N	97573	\N	\N
102322	GENERIC_DAY	0	0	2010-04-14	2728	\N	97573	\N	\N
102323	GENERIC_DAY	0	0	2010-04-27	1320	\N	97573	\N	\N
102324	GENERIC_DAY	0	0	2010-04-20	1318	\N	97573	\N	\N
102325	GENERIC_DAY	0	0	2010-05-14	61308	\N	97573	\N	\N
102326	GENERIC_DAY	0	0	2010-05-02	50401	\N	97573	\N	\N
102327	GENERIC_DAY	0	1	2010-05-07	40199	\N	97573	\N	\N
102328	GENERIC_DAY	0	0	2010-05-04	1324	\N	97573	\N	\N
102329	GENERIC_DAY	0	0	2010-04-16	2728	\N	97573	\N	\N
102330	GENERIC_DAY	0	0	2010-05-03	1324	\N	97573	\N	\N
102331	GENERIC_DAY	0	0	2010-05-14	1330	\N	97573	\N	\N
102332	GENERIC_DAY	0	0	2010-04-29	1332	\N	97573	\N	\N
102333	GENERIC_DAY	0	0	2010-05-02	19498	\N	97573	\N	\N
102334	GENERIC_DAY	0	0	2010-05-12	19496	\N	97573	\N	\N
102335	GENERIC_DAY	0	1	2010-05-06	61308	\N	97573	\N	\N
102336	GENERIC_DAY	0	0	2010-04-26	19498	\N	97573	\N	\N
102337	GENERIC_DAY	0	0	2010-04-13	1324	\N	97573	\N	\N
102338	GENERIC_DAY	0	0	2010-04-28	1320	\N	97573	\N	\N
102339	GENERIC_DAY	0	1	2010-05-03	50401	\N	97573	\N	\N
102340	GENERIC_DAY	0	0	2010-04-22	1330	\N	97573	\N	\N
102341	GENERIC_DAY	0	1	2010-05-05	85043	\N	97573	\N	\N
102342	GENERIC_DAY	0	0	2010-04-28	50401	\N	97573	\N	\N
102343	GENERIC_DAY	0	0	2010-05-10	1316	\N	97573	\N	\N
102344	GENERIC_DAY	0	1	2010-05-04	61308	\N	97573	\N	\N
102345	GENERIC_DAY	0	1	2010-04-13	1328	\N	97573	\N	\N
102346	GENERIC_DAY	0	0	2010-05-13	1320	\N	97573	\N	\N
102347	GENERIC_DAY	0	0	2010-04-25	1318	\N	97573	\N	\N
102348	GENERIC_DAY	0	0	2010-04-25	19498	\N	97573	\N	\N
102349	GENERIC_DAY	0	0	2010-04-25	1330	\N	97573	\N	\N
102350	GENERIC_DAY	0	1	2010-04-14	1328	\N	97573	\N	\N
102351	GENERIC_DAY	0	0	2010-04-13	19500	\N	97573	\N	\N
102352	GENERIC_DAY	0	0	2010-04-14	1318	\N	97573	\N	\N
102353	GENERIC_DAY	0	0	2010-05-09	2728	\N	97573	\N	\N
102354	GENERIC_DAY	0	0	2010-04-20	1330	\N	97573	\N	\N
102355	GENERIC_DAY	0	0	2010-04-13	1314	\N	97573	\N	\N
102356	GENERIC_DAY	0	0	2010-04-23	19494	\N	97573	\N	\N
102357	GENERIC_DAY	0	0	2010-05-14	1320	\N	97573	\N	\N
102358	GENERIC_DAY	0	0	2010-05-08	1328	\N	97573	\N	\N
102359	GENERIC_DAY	0	0	2010-04-26	1318	\N	97573	\N	\N
102360	GENERIC_DAY	0	0	2010-05-14	1332	\N	97573	\N	\N
102361	GENERIC_DAY	0	1	2010-05-07	61308	\N	97573	\N	\N
102362	GENERIC_DAY	0	0	2010-05-05	1320	\N	97573	\N	\N
102363	GENERIC_DAY	0	0	2010-05-15	1318	\N	97573	\N	\N
102364	GENERIC_DAY	0	0	2010-04-16	19500	\N	97573	\N	\N
102365	GENERIC_DAY	0	0	2010-04-26	1320	\N	97573	\N	\N
102366	GENERIC_DAY	0	0	2010-04-25	1326	\N	97573	\N	\N
102367	GENERIC_DAY	0	0	2010-05-12	40199	\N	97573	\N	\N
102368	GENERIC_DAY	0	0	2010-05-05	2728	\N	97573	\N	\N
102369	GENERIC_DAY	0	1	2010-05-12	2728	\N	97573	\N	\N
102370	GENERIC_DAY	0	0	2010-05-01	85043	\N	97573	\N	\N
102371	GENERIC_DAY	0	0	2010-05-17	19496	\N	97573	\N	\N
102372	GENERIC_DAY	0	0	2010-05-08	50401	\N	97573	\N	\N
102373	GENERIC_DAY	0	0	2010-05-06	1314	\N	97573	\N	\N
102374	GENERIC_DAY	0	0	2010-05-02	1326	\N	97573	\N	\N
102375	GENERIC_DAY	0	0	2010-04-20	2728	\N	97573	\N	\N
102376	GENERIC_DAY	0	0	2010-04-18	19494	\N	97573	\N	\N
102377	GENERIC_DAY	0	0	2010-04-22	1324	\N	97573	\N	\N
102378	GENERIC_DAY	0	0	2010-05-08	19500	\N	97573	\N	\N
102379	GENERIC_DAY	0	0	2010-04-17	19494	\N	97573	\N	\N
102380	GENERIC_DAY	0	0	2010-04-14	19498	\N	97573	\N	\N
102381	GENERIC_DAY	0	0	2010-05-08	1332	\N	97573	\N	\N
102382	GENERIC_DAY	0	1	2010-05-17	19494	\N	97573	\N	\N
102383	GENERIC_DAY	0	0	2010-05-02	1316	\N	97573	\N	\N
102384	GENERIC_DAY	0	0	2010-05-02	85043	\N	97573	\N	\N
102385	GENERIC_DAY	0	1	2010-04-30	1316	\N	97573	\N	\N
102386	GENERIC_DAY	0	0	2010-05-07	2728	\N	97573	\N	\N
102387	GENERIC_DAY	0	0	2010-05-04	1326	\N	97573	\N	\N
102388	GENERIC_DAY	0	0	2010-05-06	19500	\N	97573	\N	\N
102389	GENERIC_DAY	0	0	2010-04-25	19500	\N	97573	\N	\N
102390	GENERIC_DAY	0	0	2010-05-13	1318	\N	97573	\N	\N
102391	GENERIC_DAY	0	0	2010-04-20	1326	\N	97573	\N	\N
102392	GENERIC_DAY	0	0	2010-04-28	1330	\N	97573	\N	\N
102393	GENERIC_DAY	0	1	2010-04-21	1328	\N	97573	\N	\N
102394	GENERIC_DAY	0	0	2010-04-24	19498	\N	97573	\N	\N
102395	GENERIC_DAY	0	0	2010-04-27	1324	\N	97573	\N	\N
102396	GENERIC_DAY	0	0	2010-05-06	1330	\N	97573	\N	\N
102397	GENERIC_DAY	0	0	2010-05-02	1318	\N	97573	\N	\N
102398	GENERIC_DAY	0	1	2010-05-05	61308	\N	97573	\N	\N
102399	GENERIC_DAY	0	0	2010-04-29	19500	\N	97573	\N	\N
102400	GENERIC_DAY	0	0	2010-05-08	1318	\N	97573	\N	\N
102401	GENERIC_DAY	0	0	2010-04-30	1332	\N	97573	\N	\N
102402	GENERIC_DAY	0	0	2010-05-16	85043	\N	97573	\N	\N
102403	GENERIC_DAY	0	0	2010-05-16	1314	\N	97573	\N	\N
102404	GENERIC_DAY	0	0	2010-04-22	85043	\N	97573	\N	\N
102405	GENERIC_DAY	0	0	2010-05-15	50401	\N	97573	\N	\N
102406	GENERIC_DAY	0	0	2010-05-05	1332	\N	97573	\N	\N
102407	GENERIC_DAY	0	0	2010-05-02	1332	\N	97573	\N	\N
102408	GENERIC_DAY	0	0	2010-05-16	1320	\N	97573	\N	\N
102409	GENERIC_DAY	0	0	2010-04-14	19500	\N	97573	\N	\N
102410	GENERIC_DAY	0	0	2010-05-03	19496	\N	97573	\N	\N
102411	GENERIC_DAY	0	0	2010-04-14	1332	\N	97573	\N	\N
102412	GENERIC_DAY	0	0	2010-04-17	2728	\N	97573	\N	\N
102413	GENERIC_DAY	0	0	2010-04-22	50401	\N	97573	\N	\N
102414	GENERIC_DAY	0	0	2010-05-12	1330	\N	97573	\N	\N
102415	GENERIC_DAY	0	0	2010-05-13	1322	\N	97573	\N	\N
102416	GENERIC_DAY	0	0	2010-05-11	61308	\N	97573	\N	\N
102417	GENERIC_DAY	0	0	2010-05-15	1320	\N	97573	\N	\N
102418	GENERIC_DAY	0	0	2010-04-29	85043	\N	97573	\N	\N
102419	GENERIC_DAY	0	0	2010-05-16	1324	\N	97573	\N	\N
102420	GENERIC_DAY	0	1	2010-05-11	19494	\N	97573	\N	\N
102421	GENERIC_DAY	0	0	2010-04-25	1314	\N	97573	\N	\N
102422	GENERIC_DAY	0	0	2010-05-10	1326	\N	97573	\N	\N
102423	GENERIC_DAY	0	0	2010-04-21	1314	\N	97573	\N	\N
102424	GENERIC_DAY	0	0	2010-04-21	19496	\N	97573	\N	\N
102425	GENERIC_DAY	0	0	2010-04-17	1330	\N	97573	\N	\N
102426	GENERIC_DAY	0	0	2010-05-09	19500	\N	97573	\N	\N
102427	GENERIC_DAY	0	0	2010-04-14	19496	\N	97573	\N	\N
102428	GENERIC_DAY	0	0	2010-04-23	61308	\N	97573	\N	\N
102429	GENERIC_DAY	0	0	2010-05-02	2728	\N	97573	\N	\N
102430	GENERIC_DAY	0	0	2010-04-29	1330	\N	97573	\N	\N
102431	GENERIC_DAY	0	0	2010-05-11	1332	\N	97573	\N	\N
102432	GENERIC_DAY	0	1	2010-04-21	19494	\N	97573	\N	\N
102433	GENERIC_DAY	0	0	2010-04-17	1320	\N	97573	\N	\N
102434	GENERIC_DAY	0	0	2010-04-30	1320	\N	97573	\N	\N
102435	GENERIC_DAY	0	0	2010-04-15	2728	\N	97573	\N	\N
102436	GENERIC_DAY	0	0	2010-05-14	2728	\N	97573	\N	\N
102437	GENERIC_DAY	0	0	2010-04-21	1330	\N	97573	\N	\N
102438	GENERIC_DAY	0	0	2010-05-16	1328	\N	97573	\N	\N
102439	GENERIC_DAY	0	1	2010-05-14	50401	\N	97573	\N	\N
102440	GENERIC_DAY	0	1	2010-05-06	40199	\N	97573	\N	\N
102441	GENERIC_DAY	0	0	2010-05-03	40199	\N	97573	\N	\N
102442	GENERIC_DAY	0	0	2010-04-20	1320	\N	97573	\N	\N
102443	GENERIC_DAY	0	0	2010-05-05	1318	\N	97573	\N	\N
102444	GENERIC_DAY	0	0	2010-05-02	1324	\N	97573	\N	\N
102445	GENERIC_DAY	0	0	2010-04-18	1314	\N	97573	\N	\N
102446	GENERIC_DAY	0	1	2010-04-26	61308	\N	97573	\N	\N
102447	GENERIC_DAY	0	0	2010-04-22	1320	\N	97573	\N	\N
102448	GENERIC_DAY	0	0	2010-05-01	1332	\N	97573	\N	\N
102449	GENERIC_DAY	0	0	2010-04-18	40199	\N	97573	\N	\N
102450	GENERIC_DAY	0	0	2010-04-25	19496	\N	97573	\N	\N
102451	GENERIC_DAY	0	0	2010-04-16	19494	\N	97573	\N	\N
102452	GENERIC_DAY	0	0	2010-04-15	1332	\N	97573	\N	\N
102453	GENERIC_DAY	0	0	2010-04-16	1314	\N	97573	\N	\N
102454	GENERIC_DAY	0	0	2010-04-24	40199	\N	97573	\N	\N
102455	GENERIC_DAY	0	0	2010-04-19	1326	\N	97573	\N	\N
102456	GENERIC_DAY	0	0	2010-04-25	61308	\N	97573	\N	\N
102457	GENERIC_DAY	0	1	2010-04-30	50401	\N	97573	\N	\N
102458	GENERIC_DAY	0	1	2010-04-23	1316	\N	97573	\N	\N
102459	GENERIC_DAY	0	0	2010-04-17	19496	\N	97573	\N	\N
102460	GENERIC_DAY	0	0	2010-04-16	19498	\N	97573	\N	\N
102461	GENERIC_DAY	0	0	2010-04-24	1316	\N	97573	\N	\N
102462	GENERIC_DAY	0	0	2010-04-26	1332	\N	97573	\N	\N
102463	GENERIC_DAY	0	0	2010-05-10	1324	\N	97573	\N	\N
102464	GENERIC_DAY	0	0	2010-05-14	1322	\N	97573	\N	\N
102465	GENERIC_DAY	0	1	2010-05-13	1316	\N	97573	\N	\N
102466	GENERIC_DAY	0	1	2010-05-06	1328	\N	97573	\N	\N
102467	GENERIC_DAY	0	0	2010-04-17	1326	\N	97573	\N	\N
102468	GENERIC_DAY	0	0	2010-04-22	1318	\N	97573	\N	\N
102469	GENERIC_DAY	0	0	2010-04-28	1316	\N	97573	\N	\N
102470	GENERIC_DAY	0	0	2010-05-12	1320	\N	97573	\N	\N
102471	GENERIC_DAY	0	0	2010-04-28	1318	\N	97573	\N	\N
102472	GENERIC_DAY	0	0	2010-04-25	1322	\N	97573	\N	\N
102473	GENERIC_DAY	0	1	2010-04-28	61308	\N	97573	\N	\N
102474	GENERIC_DAY	0	0	2010-04-18	1316	\N	97573	\N	\N
102475	GENERIC_DAY	0	0	2010-05-15	2728	\N	97573	\N	\N
102476	GENERIC_DAY	0	0	2010-05-09	1318	\N	97573	\N	\N
102477	GENERIC_DAY	0	0	2010-05-07	1328	\N	97573	\N	\N
102478	GENERIC_DAY	0	1	2010-04-23	40199	\N	97573	\N	\N
102479	GENERIC_DAY	0	0	2010-05-12	1322	\N	97573	\N	\N
102480	GENERIC_DAY	0	1	2010-05-04	40199	\N	97573	\N	\N
102481	GENERIC_DAY	0	0	2010-04-23	19498	\N	97573	\N	\N
102482	GENERIC_DAY	0	0	2010-04-15	1326	\N	97573	\N	\N
102483	GENERIC_DAY	0	0	2010-04-16	1318	\N	97573	\N	\N
102484	GENERIC_DAY	0	0	2010-05-03	85043	\N	97573	\N	\N
102485	GENERIC_DAY	0	0	2010-04-27	19496	\N	97573	\N	\N
102486	GENERIC_DAY	0	0	2010-05-01	1328	\N	97573	\N	\N
102487	GENERIC_DAY	0	0	2010-05-13	40199	\N	97573	\N	\N
102488	GENERIC_DAY	0	0	2010-04-19	19496	\N	97573	\N	\N
102489	GENERIC_DAY	0	0	2010-05-02	61308	\N	97573	\N	\N
102490	GENERIC_DAY	0	0	2010-04-20	19496	\N	97573	\N	\N
102491	GENERIC_DAY	0	0	2010-04-19	1314	\N	97573	\N	\N
102492	GENERIC_DAY	0	0	2010-05-03	1314	\N	97573	\N	\N
102493	GENERIC_DAY	0	0	2010-04-13	1316	\N	97573	\N	\N
102494	GENERIC_DAY	0	0	2010-04-14	1326	\N	97573	\N	\N
102495	GENERIC_DAY	0	1	2010-04-29	40199	\N	97573	\N	\N
102496	GENERIC_DAY	0	0	2010-05-09	1328	\N	97573	\N	\N
102497	GENERIC_DAY	0	0	2010-04-29	19498	\N	97573	\N	\N
102498	GENERIC_DAY	0	0	2010-04-29	1316	\N	97573	\N	\N
102499	GENERIC_DAY	0	0	2010-04-15	19498	\N	97573	\N	\N
102500	GENERIC_DAY	0	0	2010-04-17	40199	\N	97573	\N	\N
102501	GENERIC_DAY	0	0	2010-04-27	1330	\N	97573	\N	\N
102502	GENERIC_DAY	0	1	2010-04-28	19494	\N	97573	\N	\N
102503	GENERIC_DAY	0	0	2010-05-04	50401	\N	97573	\N	\N
102504	GENERIC_DAY	0	0	2010-05-09	50401	\N	97573	\N	\N
102505	GENERIC_DAY	0	0	2010-05-07	19496	\N	97573	\N	\N
102506	GENERIC_DAY	0	0	2010-05-09	40199	\N	97573	\N	\N
102507	GENERIC_DAY	0	0	2010-05-12	1324	\N	97573	\N	\N
102508	GENERIC_DAY	0	0	2010-04-25	85043	\N	97573	\N	\N
102509	GENERIC_DAY	0	1	2010-05-12	1328	\N	97573	\N	\N
102510	GENERIC_DAY	0	0	2010-04-16	19496	\N	97573	\N	\N
102511	GENERIC_DAY	0	0	2010-05-05	1322	\N	97573	\N	\N
102512	GENERIC_DAY	0	0	2010-05-11	1314	\N	97573	\N	\N
102513	GENERIC_DAY	0	0	2010-04-14	1314	\N	97573	\N	\N
102514	GENERIC_DAY	0	0	2010-04-22	1314	\N	97573	\N	\N
102515	GENERIC_DAY	0	0	2010-04-17	61308	\N	97573	\N	\N
102516	GENERIC_DAY	0	0	2010-04-16	1328	\N	97573	\N	\N
102517	GENERIC_DAY	0	1	2010-04-27	1328	\N	97573	\N	\N
102518	GENERIC_DAY	0	0	2010-04-21	2728	\N	97573	\N	\N
102519	GENERIC_DAY	0	0	2010-04-30	1328	\N	97573	\N	\N
102520	GENERIC_DAY	0	0	2010-04-17	1316	\N	97573	\N	\N
102521	GENERIC_DAY	0	1	2010-05-05	40199	\N	97573	\N	\N
102522	GENERIC_DAY	0	1	2010-05-13	2728	\N	97573	\N	\N
102523	GENERIC_DAY	0	0	2010-05-16	61308	\N	97573	\N	\N
102524	GENERIC_DAY	0	0	2010-04-16	1326	\N	97573	\N	\N
102525	GENERIC_DAY	0	1	2010-04-16	61308	\N	97573	\N	\N
102526	GENERIC_DAY	0	0	2010-04-26	19500	\N	97573	\N	\N
102527	GENERIC_DAY	0	1	2010-04-28	1328	\N	97573	\N	\N
102528	GENERIC_DAY	0	1	2010-04-19	1328	\N	97573	\N	\N
102529	GENERIC_DAY	0	0	2010-05-10	1330	\N	97573	\N	\N
102530	GENERIC_DAY	0	0	2010-05-10	1332	\N	97573	\N	\N
102531	GENERIC_DAY	0	0	2010-05-12	50401	\N	97573	\N	\N
102532	GENERIC_DAY	0	0	2010-05-04	1332	\N	97573	\N	\N
102533	GENERIC_DAY	0	0	2010-05-15	1322	\N	97573	\N	\N
102534	GENERIC_DAY	0	0	2010-04-21	1316	\N	97573	\N	\N
102535	GENERIC_DAY	0	1	2010-04-19	19494	\N	97573	\N	\N
102536	GENERIC_DAY	0	0	2010-05-09	61308	\N	97573	\N	\N
102537	GENERIC_DAY	0	1	2010-04-13	50401	\N	97573	\N	\N
102538	GENERIC_DAY	0	0	2010-04-24	1320	\N	97573	\N	\N
102539	GENERIC_DAY	0	0	2010-04-17	50401	\N	97573	\N	\N
102540	GENERIC_DAY	0	0	2010-05-15	61308	\N	97573	\N	\N
102541	GENERIC_DAY	0	1	2010-04-14	50401	\N	97573	\N	\N
102542	GENERIC_DAY	0	0	2010-04-23	1328	\N	97573	\N	\N
102543	GENERIC_DAY	0	0	2010-04-16	1330	\N	97573	\N	\N
102544	GENERIC_DAY	0	1	2010-04-23	85043	\N	97573	\N	\N
102545	GENERIC_DAY	0	1	2010-04-20	40199	\N	97573	\N	\N
102546	GENERIC_DAY	0	0	2010-05-01	1318	\N	97573	\N	\N
102547	GENERIC_DAY	0	0	2010-05-13	1332	\N	97573	\N	\N
102548	GENERIC_DAY	0	0	2010-04-24	1324	\N	97573	\N	\N
102549	GENERIC_DAY	0	1	2010-05-17	1318	\N	97573	\N	\N
102550	GENERIC_DAY	0	0	2010-05-15	19500	\N	97573	\N	\N
102551	GENERIC_DAY	0	0	2010-04-15	1314	\N	97573	\N	\N
102552	GENERIC_DAY	0	1	2010-05-04	1328	\N	97573	\N	\N
102553	GENERIC_DAY	0	0	2010-05-07	1322	\N	97573	\N	\N
102554	GENERIC_DAY	0	1	2010-04-20	1328	\N	97573	\N	\N
102555	GENERIC_DAY	0	0	2010-04-18	50401	\N	97573	\N	\N
102556	GENERIC_DAY	0	0	2010-05-15	1314	\N	97573	\N	\N
102557	GENERIC_DAY	0	0	2010-05-07	19500	\N	97573	\N	\N
102558	GENERIC_DAY	0	0	2010-04-22	19500	\N	97573	\N	\N
102559	GENERIC_DAY	0	0	2010-05-11	19500	\N	97573	\N	\N
102560	GENERIC_DAY	0	0	2010-05-16	40199	\N	97573	\N	\N
102561	GENERIC_DAY	0	0	2010-04-18	1326	\N	97573	\N	\N
102562	GENERIC_DAY	0	0	2010-04-28	19496	\N	97573	\N	\N
102563	GENERIC_DAY	0	1	2010-05-03	1332	\N	97573	\N	\N
102564	GENERIC_DAY	0	0	2010-04-20	19500	\N	97573	\N	\N
102565	GENERIC_DAY	0	0	2010-05-16	19500	\N	97573	\N	\N
102566	GENERIC_DAY	0	0	2010-04-19	1320	\N	97573	\N	\N
102567	GENERIC_DAY	0	0	2010-05-13	50401	\N	97573	\N	\N
102568	GENERIC_DAY	0	0	2010-04-18	19498	\N	97573	\N	\N
102569	GENERIC_DAY	0	0	2010-04-25	50401	\N	97573	\N	\N
102570	GENERIC_DAY	0	0	2010-05-13	19500	\N	97573	\N	\N
102571	GENERIC_DAY	0	1	2010-04-29	1328	\N	97573	\N	\N
102572	GENERIC_DAY	0	0	2010-04-13	2728	\N	97573	\N	\N
102573	GENERIC_DAY	0	0	2010-04-24	61308	\N	97573	\N	\N
102574	GENERIC_DAY	0	0	2010-04-18	1332	\N	97573	\N	\N
102575	GENERIC_DAY	0	0	2010-04-27	85043	\N	97573	\N	\N
102576	GENERIC_DAY	0	0	2010-05-08	1314	\N	97573	\N	\N
102577	GENERIC_DAY	0	0	2010-05-01	1324	\N	97573	\N	\N
102578	GENERIC_DAY	0	1	2010-04-20	19494	\N	97573	\N	\N
102579	GENERIC_DAY	0	0	2010-04-21	1332	\N	97573	\N	\N
102580	GENERIC_DAY	0	0	2010-04-22	1332	\N	97573	\N	\N
102581	GENERIC_DAY	0	0	2010-04-25	1332	\N	97573	\N	\N
102582	GENERIC_DAY	0	1	2010-04-29	61308	\N	97573	\N	\N
102583	GENERIC_DAY	0	0	2010-04-14	1322	\N	97573	\N	\N
102584	GENERIC_DAY	0	0	2010-04-17	1322	\N	97573	\N	\N
102585	GENERIC_DAY	0	0	2010-04-30	1314	\N	97573	\N	\N
102586	GENERIC_DAY	0	1	2010-04-15	40199	\N	97573	\N	\N
102587	GENERIC_DAY	0	0	2010-05-13	1314	\N	97573	\N	\N
102588	GENERIC_DAY	0	1	2010-05-17	1328	\N	97573	\N	\N
102589	GENERIC_DAY	0	1	2010-05-10	61308	\N	97573	\N	\N
102590	GENERIC_DAY	0	1	2010-04-27	40199	\N	97573	\N	\N
102591	GENERIC_DAY	0	0	2010-04-24	1330	\N	97573	\N	\N
102592	GENERIC_DAY	0	0	2010-04-29	1324	\N	97573	\N	\N
102593	GENERIC_DAY	0	0	2010-04-24	2728	\N	97573	\N	\N
102594	GENERIC_DAY	0	0	2010-04-30	1330	\N	97573	\N	\N
102595	GENERIC_DAY	0	0	2010-04-19	1316	\N	97573	\N	\N
102596	GENERIC_DAY	0	0	2010-05-17	1330	\N	97573	\N	\N
102597	GENERIC_DAY	0	0	2010-04-21	1320	\N	97573	\N	\N
102598	GENERIC_DAY	0	0	2010-05-05	19500	\N	97573	\N	\N
102599	GENERIC_DAY	0	0	2010-04-17	1332	\N	97573	\N	\N
102600	GENERIC_DAY	0	0	2010-05-01	40199	\N	97573	\N	\N
102601	GENERIC_DAY	0	0	2010-04-27	1316	\N	97573	\N	\N
102602	GENERIC_DAY	0	0	2010-04-30	1322	\N	97573	\N	\N
102603	GENERIC_DAY	0	0	2010-04-30	1318	\N	97573	\N	\N
102604	GENERIC_DAY	0	0	2010-05-09	19498	\N	97573	\N	\N
102605	GENERIC_DAY	0	0	2010-04-15	50401	\N	97573	\N	\N
102606	GENERIC_DAY	0	0	2010-04-23	1318	\N	97573	\N	\N
102607	GENERIC_DAY	0	0	2010-05-14	19498	\N	97573	\N	\N
102608	GENERIC_DAY	0	0	2010-04-27	19500	\N	97573	\N	\N
102609	GENERIC_DAY	0	1	2010-05-14	40199	\N	97573	\N	\N
102610	GENERIC_DAY	0	0	2010-05-17	19500	\N	97573	\N	\N
102611	GENERIC_DAY	0	0	2010-05-01	19494	\N	97573	\N	\N
102612	GENERIC_DAY	0	0	2010-04-23	1322	\N	97573	\N	\N
102613	GENERIC_DAY	0	0	2010-05-17	85043	\N	97573	\N	\N
102614	GENERIC_DAY	0	0	2010-05-06	1324	\N	97573	\N	\N
102615	GENERIC_DAY	0	0	2010-04-24	85043	\N	97573	\N	\N
102616	GENERIC_DAY	0	0	2010-04-17	1314	\N	97573	\N	\N
102617	GENERIC_DAY	0	0	2010-05-03	61308	\N	97573	\N	\N
102618	GENERIC_DAY	0	1	2010-05-10	40199	\N	97573	\N	\N
102619	GENERIC_DAY	0	0	2010-05-10	1322	\N	97573	\N	\N
102620	GENERIC_DAY	0	0	2010-04-19	1332	\N	97573	\N	\N
102621	GENERIC_DAY	0	0	2010-05-14	1324	\N	97573	\N	\N
102622	GENERIC_DAY	0	0	2010-04-23	1324	\N	97573	\N	\N
102623	GENERIC_DAY	0	0	2010-04-20	1316	\N	97573	\N	\N
102624	GENERIC_DAY	0	0	2010-05-02	1314	\N	97573	\N	\N
102625	GENERIC_DAY	0	0	2010-05-14	1314	\N	97573	\N	\N
102626	GENERIC_DAY	0	0	2010-05-16	19494	\N	97573	\N	\N
102627	GENERIC_DAY	0	0	2010-04-29	1318	\N	97573	\N	\N
102628	GENERIC_DAY	0	0	2010-05-17	1320	\N	97573	\N	\N
102629	GENERIC_DAY	0	0	2010-05-13	19498	\N	97573	\N	\N
102630	GENERIC_DAY	0	0	2010-04-13	1318	\N	97573	\N	\N
102631	GENERIC_DAY	0	0	2010-04-25	40199	\N	97573	\N	\N
102632	GENERIC_DAY	0	0	2010-04-28	85043	\N	97573	\N	\N
102633	GENERIC_DAY	0	0	2010-04-16	1332	\N	97573	\N	\N
102634	GENERIC_DAY	0	0	2010-04-15	1324	\N	97573	\N	\N
102635	GENERIC_DAY	0	0	2010-05-02	19494	\N	97573	\N	\N
102636	GENERIC_DAY	0	0	2010-04-29	1314	\N	97573	\N	\N
99619	GENERIC_DAY	2	0	2010-05-08	19500	\N	97569	\N	\N
99906	GENERIC_DAY	2	0	2010-05-14	1318	\N	97569	\N	\N
99802	GENERIC_DAY	2	1	2010-05-17	19496	\N	97569	\N	\N
100031	GENERIC_DAY	2	0	2010-04-18	19494	\N	97569	\N	\N
99897	GENERIC_DAY	2	1	2010-05-04	1332	\N	97569	\N	\N
100129	GENERIC_DAY	2	0	2010-04-27	1318	\N	97569	\N	\N
100003	GENERIC_DAY	2	1	2010-04-29	1316	\N	97569	\N	\N
99759	GENERIC_DAY	2	0	2010-05-05	19496	\N	97569	\N	\N
99991	GENERIC_DAY	2	0	2010-04-18	19500	\N	97569	\N	\N
99559	GENERIC_DAY	2	0	2010-04-29	1326	\N	97569	\N	\N
99824	GENERIC_DAY	2	1	2010-05-06	19494	\N	97569	\N	\N
100006	GENERIC_DAY	2	0	2010-05-02	1314	\N	97569	\N	\N
99650	GENERIC_DAY	2	0	2010-04-29	19498	\N	97569	\N	\N
100040	GENERIC_DAY	2	0	2010-05-10	50401	\N	97569	\N	\N
99771	GENERIC_DAY	2	0	2010-05-13	1324	\N	97569	\N	\N
99557	GENERIC_DAY	2	0	2010-04-29	40199	\N	97569	\N	\N
99658	GENERIC_DAY	2	1	2010-04-23	61308	\N	97569	\N	\N
99567	GENERIC_DAY	2	0	2010-04-27	61308	\N	97569	\N	\N
99756	GENERIC_DAY	2	0	2010-05-09	1330	\N	97569	\N	\N
99882	GENERIC_DAY	2	0	2010-04-27	19494	\N	97569	\N	\N
99969	GENERIC_DAY	2	1	2010-04-16	40199	\N	97569	\N	\N
99662	GENERIC_DAY	2	0	2010-04-26	1318	\N	97569	\N	\N
100111	GENERIC_DAY	2	0	2010-05-09	1324	\N	97569	\N	\N
99848	GENERIC_DAY	2	0	2010-05-07	1322	\N	97569	\N	\N
99972	GENERIC_DAY	2	0	2010-05-16	1328	\N	97569	\N	\N
99927	GENERIC_DAY	2	0	2010-04-15	40199	\N	97569	\N	\N
99743	GENERIC_DAY	2	1	2010-05-03	61308	\N	97569	\N	\N
99812	GENERIC_DAY	2	1	2010-04-27	1332	\N	97569	\N	\N
100101	GENERIC_DAY	2	0	2010-05-06	40199	\N	97569	\N	\N
99808	GENERIC_DAY	2	0	2010-04-13	50401	\N	97569	\N	\N
99807	GENERIC_DAY	2	0	2010-04-17	1316	\N	97569	\N	\N
100118	GENERIC_DAY	2	0	2010-04-30	1328	\N	97569	\N	\N
99834	GENERIC_DAY	2	1	2010-04-13	1316	\N	97569	\N	\N
100028	GENERIC_DAY	2	0	2010-04-13	1318	\N	97569	\N	\N
99502	GENERIC_DAY	2	0	2010-04-17	1328	\N	97569	\N	\N
99584	GENERIC_DAY	2	0	2010-04-17	19498	\N	97569	\N	\N
99547	GENERIC_DAY	2	1	2010-05-05	1322	\N	97569	\N	\N
99571	GENERIC_DAY	2	0	2010-04-15	61308	\N	97569	\N	\N
99644	GENERIC_DAY	2	0	2010-05-16	1314	\N	97569	\N	\N
100017	GENERIC_DAY	2	0	2010-05-02	19494	\N	97569	\N	\N
99980	GENERIC_DAY	2	0	2010-05-08	40199	\N	97569	\N	\N
99735	GENERIC_DAY	2	1	2010-04-14	1332	\N	97569	\N	\N
100021	GENERIC_DAY	2	0	2010-05-10	19500	\N	97569	\N	\N
100073	GENERIC_DAY	2	1	2010-04-19	1322	\N	97569	\N	\N
99708	GENERIC_DAY	2	0	2010-04-19	19500	\N	97569	\N	\N
99667	GENERIC_DAY	2	0	2010-04-19	1326	\N	97569	\N	\N
99635	GENERIC_DAY	2	0	2010-05-13	40199	\N	97569	\N	\N
99781	GENERIC_DAY	2	0	2010-05-01	50401	\N	97569	\N	\N
99956	GENERIC_DAY	2	0	2010-04-29	1330	\N	97569	\N	\N
100071	GENERIC_DAY	2	1	2010-04-26	1316	\N	97569	\N	\N
99544	GENERIC_DAY	2	1	2010-04-20	1322	\N	97569	\N	\N
99539	GENERIC_DAY	2	0	2010-04-22	61308	\N	97569	\N	\N
99935	GENERIC_DAY	2	0	2010-05-09	40199	\N	97569	\N	\N
99799	GENERIC_DAY	2	0	2010-04-27	19500	\N	97569	\N	\N
100095	GENERIC_DAY	2	0	2010-04-15	1324	\N	97569	\N	\N
99974	GENERIC_DAY	2	1	2010-05-12	1322	\N	97569	\N	\N
99636	GENERIC_DAY	2	0	2010-04-22	1326	\N	97569	\N	\N
100062	GENERIC_DAY	2	1	2010-04-27	2728	\N	97569	\N	\N
100106	GENERIC_DAY	2	0	2010-05-13	2728	\N	97569	\N	\N
99958	GENERIC_DAY	2	0	2010-05-09	85043	\N	97569	\N	\N
100014	GENERIC_DAY	2	0	2010-04-17	2728	\N	97569	\N	\N
99604	GENERIC_DAY	2	0	2010-05-09	1328	\N	97569	\N	\N
99888	GENERIC_DAY	2	0	2010-05-06	1328	\N	97569	\N	\N
99695	GENERIC_DAY	2	0	2010-05-01	1318	\N	97569	\N	\N
99752	GENERIC_DAY	2	0	2010-05-08	1332	\N	97569	\N	\N
99785	GENERIC_DAY	2	0	2010-04-14	19496	\N	97569	\N	\N
99915	GENERIC_DAY	2	0	2010-04-20	50401	\N	97569	\N	\N
99646	GENERIC_DAY	2	0	2010-05-15	19494	\N	97569	\N	\N
99563	GENERIC_DAY	2	0	2010-04-26	19496	\N	97569	\N	\N
99929	GENERIC_DAY	2	0	2010-05-13	1316	\N	97569	\N	\N
99653	GENERIC_DAY	2	0	2010-05-08	1324	\N	97569	\N	\N
99868	GENERIC_DAY	2	0	2010-04-24	19496	\N	97569	\N	\N
99959	GENERIC_DAY	2	0	2010-05-07	1326	\N	97569	\N	\N
99902	GENERIC_DAY	2	0	2010-05-03	19498	\N	97569	\N	\N
99827	GENERIC_DAY	2	0	2010-05-15	1328	\N	97569	\N	\N
99637	GENERIC_DAY	2	0	2010-04-28	1314	\N	97569	\N	\N
99545	GENERIC_DAY	2	0	2010-04-13	1328	\N	97569	\N	\N
99821	GENERIC_DAY	2	0	2010-04-29	61308	\N	97569	\N	\N
100015	GENERIC_DAY	2	0	2010-05-09	1314	\N	97569	\N	\N
99734	GENERIC_DAY	2	0	2010-05-05	40199	\N	97569	\N	\N
99768	GENERIC_DAY	2	0	2010-05-06	1314	\N	97569	\N	\N
100122	GENERIC_DAY	2	0	2010-04-27	1324	\N	97569	\N	\N
99966	GENERIC_DAY	2	0	2010-05-02	1318	\N	97569	\N	\N
99993	GENERIC_DAY	2	0	2010-04-30	1322	\N	97569	\N	\N
99988	GENERIC_DAY	2	0	2010-04-14	1326	\N	97569	\N	\N
99680	GENERIC_DAY	2	1	2010-04-19	1316	\N	97569	\N	\N
99790	GENERIC_DAY	2	0	2010-04-25	1314	\N	97569	\N	\N
99570	GENERIC_DAY	2	0	2010-04-21	1326	\N	97569	\N	\N
99540	GENERIC_DAY	2	0	2010-04-22	40199	\N	97569	\N	\N
99739	GENERIC_DAY	2	0	2010-04-21	19494	\N	97569	\N	\N
99976	GENERIC_DAY	2	0	2010-05-17	61308	\N	97569	\N	\N
99862	GENERIC_DAY	2	0	2010-05-06	19498	\N	97569	\N	\N
99737	GENERIC_DAY	2	0	2010-04-19	61308	\N	97569	\N	\N
99642	GENERIC_DAY	2	0	2010-05-08	1314	\N	97569	\N	\N
99527	GENERIC_DAY	2	1	2010-04-29	1322	\N	97569	\N	\N
99506	GENERIC_DAY	2	0	2010-05-01	1328	\N	97569	\N	\N
99952	GENERIC_DAY	2	0	2010-04-28	19500	\N	97569	\N	\N
100112	GENERIC_DAY	2	0	2010-04-17	1318	\N	97569	\N	\N
99607	GENERIC_DAY	2	0	2010-05-15	85043	\N	97569	\N	\N
99977	GENERIC_DAY	2	0	2010-05-12	19498	\N	97569	\N	\N
99714	GENERIC_DAY	2	0	2010-05-11	2728	\N	97569	\N	\N
99507	GENERIC_DAY	2	0	2010-05-11	19498	\N	97569	\N	\N
99590	GENERIC_DAY	2	0	2010-04-30	2728	\N	97569	\N	\N
99727	GENERIC_DAY	2	0	2010-05-06	1318	\N	97569	\N	\N
99767	GENERIC_DAY	2	0	2010-05-16	40199	\N	97569	\N	\N
100051	GENERIC_DAY	2	0	2010-05-07	19496	\N	97569	\N	\N
99792	GENERIC_DAY	2	0	2010-04-23	19496	\N	97569	\N	\N
99688	GENERIC_DAY	2	1	2010-05-04	19494	\N	97569	\N	\N
99616	GENERIC_DAY	2	0	2010-04-21	1314	\N	97569	\N	\N
100060	GENERIC_DAY	2	1	2010-04-19	1332	\N	97569	\N	\N
99837	GENERIC_DAY	2	0	2010-05-15	1324	\N	97569	\N	\N
99854	GENERIC_DAY	2	0	2010-04-30	1324	\N	97569	\N	\N
99624	GENERIC_DAY	2	0	2010-04-19	19494	\N	97569	\N	\N
99776	GENERIC_DAY	2	0	2010-04-23	19498	\N	97569	\N	\N
99504	GENERIC_DAY	2	0	2010-05-16	1320	\N	97569	\N	\N
99830	GENERIC_DAY	2	0	2010-05-05	1326	\N	97569	\N	\N
99595	GENERIC_DAY	2	0	2010-05-11	1320	\N	97569	\N	\N
100030	GENERIC_DAY	2	0	2010-05-03	50401	\N	97569	\N	\N
99519	GENERIC_DAY	2	0	2010-04-27	19498	\N	97569	\N	\N
99566	GENERIC_DAY	2	0	2010-05-15	1326	\N	97569	\N	\N
100007	GENERIC_DAY	2	0	2010-05-16	19498	\N	97569	\N	\N
99511	GENERIC_DAY	2	0	2010-04-29	1328	\N	97569	\N	\N
99891	GENERIC_DAY	2	0	2010-04-23	1326	\N	97569	\N	\N
99955	GENERIC_DAY	2	1	2010-04-28	1322	\N	97569	\N	\N
100100	GENERIC_DAY	2	0	2010-04-25	1326	\N	97569	\N	\N
99815	GENERIC_DAY	2	0	2010-05-05	61308	\N	97569	\N	\N
99817	GENERIC_DAY	2	0	2010-04-27	1314	\N	97569	\N	\N
99793	GENERIC_DAY	2	0	2010-04-19	1324	\N	97569	\N	\N
99663	GENERIC_DAY	2	0	2010-05-01	1316	\N	97569	\N	\N
99534	GENERIC_DAY	2	0	2010-04-30	1330	\N	97569	\N	\N
99634	GENERIC_DAY	2	0	2010-05-16	2728	\N	97569	\N	\N
99789	GENERIC_DAY	2	0	2010-04-15	1314	\N	97569	\N	\N
99668	GENERIC_DAY	2	0	2010-05-16	19500	\N	97569	\N	\N
100121	GENERIC_DAY	2	0	2010-05-08	19496	\N	97569	\N	\N
99975	GENERIC_DAY	2	0	2010-05-02	1320	\N	97569	\N	\N
99909	GENERIC_DAY	2	0	2010-04-23	19500	\N	97569	\N	\N
99693	GENERIC_DAY	2	0	2010-04-13	19496	\N	97569	\N	\N
100090	GENERIC_DAY	2	0	2010-04-20	1326	\N	97569	\N	\N
99550	GENERIC_DAY	2	0	2010-05-07	1320	\N	97569	\N	\N
99823	GENERIC_DAY	2	1	2010-05-06	1332	\N	97569	\N	\N
99801	GENERIC_DAY	2	0	2010-04-28	1318	\N	97569	\N	\N
99762	GENERIC_DAY	2	0	2010-05-01	19494	\N	97569	\N	\N
100096	GENERIC_DAY	2	0	2010-04-14	1324	\N	97569	\N	\N
99592	GENERIC_DAY	2	0	2010-05-15	1322	\N	97569	\N	\N
100138	GENERIC_DAY	2	0	2010-05-03	1332	\N	97569	\N	\N
99939	GENERIC_DAY	2	0	2010-05-05	19498	\N	97569	\N	\N
99941	GENERIC_DAY	2	0	2010-05-16	1316	\N	97569	\N	\N
99514	GENERIC_DAY	2	0	2010-05-15	1314	\N	97569	\N	\N
99577	GENERIC_DAY	2	0	2010-04-25	40199	\N	97569	\N	\N
99779	GENERIC_DAY	2	0	2010-04-16	1328	\N	97569	\N	\N
99685	GENERIC_DAY	2	0	2010-04-22	85043	\N	97569	\N	\N
99903	GENERIC_DAY	2	0	2010-04-20	19494	\N	97569	\N	\N
99780	GENERIC_DAY	2	0	2010-04-25	85043	\N	97569	\N	\N
100117	GENERIC_DAY	2	1	2010-04-20	2728	\N	97569	\N	\N
99596	GENERIC_DAY	2	0	2010-04-24	1314	\N	97569	\N	\N
99669	GENERIC_DAY	2	1	2010-04-23	40199	\N	97569	\N	\N
99537	GENERIC_DAY	2	0	2010-05-09	19494	\N	97569	\N	\N
99730	GENERIC_DAY	2	0	2010-04-20	1320	\N	97569	\N	\N
99894	GENERIC_DAY	2	0	2010-05-09	1326	\N	97569	\N	\N
99618	GENERIC_DAY	2	0	2010-04-15	1320	\N	97569	\N	\N
99712	GENERIC_DAY	2	0	2010-04-28	19498	\N	97569	\N	\N
100083	GENERIC_DAY	2	0	2010-05-15	50401	\N	97569	\N	\N
99951	GENERIC_DAY	2	1	2010-05-03	40199	\N	97569	\N	\N
99585	GENERIC_DAY	2	1	2010-04-26	1322	\N	97569	\N	\N
99769	GENERIC_DAY	2	0	2010-04-15	19500	\N	97569	\N	\N
99819	GENERIC_DAY	2	0	2010-05-14	85043	\N	97569	\N	\N
99647	GENERIC_DAY	2	1	2010-05-13	1328	\N	97569	\N	\N
100018	GENERIC_DAY	2	0	2010-05-06	1330	\N	97569	\N	\N
99782	GENERIC_DAY	2	0	2010-04-21	19500	\N	97569	\N	\N
99753	GENERIC_DAY	2	0	2010-04-23	2728	\N	97569	\N	\N
99838	GENERIC_DAY	2	1	2010-05-05	19494	\N	97569	\N	\N
100036	GENERIC_DAY	2	0	2010-05-01	1322	\N	97569	\N	\N
99703	GENERIC_DAY	2	0	2010-04-14	1318	\N	97569	\N	\N
99572	GENERIC_DAY	2	0	2010-05-07	19494	\N	97569	\N	\N
99601	GENERIC_DAY	2	1	2010-04-29	1332	\N	97569	\N	\N
100130	GENERIC_DAY	2	0	2010-04-22	1328	\N	97569	\N	\N
100086	GENERIC_DAY	2	0	2010-04-26	1328	\N	97569	\N	\N
99609	GENERIC_DAY	2	0	2010-05-05	1328	\N	97569	\N	\N
100048	GENERIC_DAY	2	0	2010-04-17	1330	\N	97569	\N	\N
100085	GENERIC_DAY	2	1	2010-05-13	1322	\N	97569	\N	\N
99610	GENERIC_DAY	2	0	2010-05-11	1330	\N	97569	\N	\N
100064	GENERIC_DAY	2	0	2010-05-03	1324	\N	97569	\N	\N
99864	GENERIC_DAY	2	0	2010-04-25	1332	\N	97569	\N	\N
99828	GENERIC_DAY	2	0	2010-05-11	85043	\N	97569	\N	\N
99826	GENERIC_DAY	2	1	2010-05-04	2728	\N	97569	\N	\N
99627	GENERIC_DAY	2	0	2010-04-25	61308	\N	97569	\N	\N
99798	GENERIC_DAY	2	0	2010-05-06	1320	\N	97569	\N	\N
99640	GENERIC_DAY	2	0	2010-04-25	50401	\N	97569	\N	\N
99852	GENERIC_DAY	2	0	2010-05-02	2728	\N	97569	\N	\N
99722	GENERIC_DAY	2	0	2010-04-15	1330	\N	97569	\N	\N
99763	GENERIC_DAY	2	0	2010-04-18	1328	\N	97569	\N	\N
99588	GENERIC_DAY	2	0	2010-05-11	19494	\N	97569	\N	\N
100039	GENERIC_DAY	2	0	2010-05-12	85043	\N	97569	\N	\N
99603	GENERIC_DAY	2	0	2010-05-15	1330	\N	97569	\N	\N
99587	GENERIC_DAY	2	1	2010-05-14	50401	\N	97569	\N	\N
99643	GENERIC_DAY	2	0	2010-04-15	19494	\N	97569	\N	\N
99525	GENERIC_DAY	2	0	2010-04-16	1332	\N	97569	\N	\N
100077	GENERIC_DAY	2	0	2010-04-20	85043	\N	97569	\N	\N
99853	GENERIC_DAY	2	0	2010-05-10	1314	\N	97569	\N	\N
100066	GENERIC_DAY	2	0	2010-05-13	50401	\N	97569	\N	\N
99942	GENERIC_DAY	2	0	2010-05-15	19500	\N	97569	\N	\N
99632	GENERIC_DAY	2	1	2010-04-15	1322	\N	97569	\N	\N
99861	GENERIC_DAY	2	0	2010-05-01	19496	\N	97569	\N	\N
99554	GENERIC_DAY	2	0	2010-04-17	1322	\N	97569	\N	\N
99694	GENERIC_DAY	2	1	2010-05-14	61308	\N	97569	\N	\N
100065	GENERIC_DAY	2	0	2010-05-12	61308	\N	97569	\N	\N
99628	GENERIC_DAY	2	0	2010-04-25	1322	\N	97569	\N	\N
99648	GENERIC_DAY	2	0	2010-04-25	2728	\N	97569	\N	\N
100008	GENERIC_DAY	2	0	2010-04-25	1316	\N	97569	\N	\N
99742	GENERIC_DAY	2	0	2010-04-22	1330	\N	97569	\N	\N
99871	GENERIC_DAY	2	0	2010-04-23	1322	\N	97569	\N	\N
100037	GENERIC_DAY	2	1	2010-05-03	85043	\N	97569	\N	\N
99901	GENERIC_DAY	2	0	2010-05-12	50401	\N	97569	\N	\N
100134	GENERIC_DAY	2	0	2010-05-08	1318	\N	97569	\N	\N
99697	GENERIC_DAY	2	1	2010-05-11	1322	\N	97569	\N	\N
99731	GENERIC_DAY	2	0	2010-04-16	19498	\N	97569	\N	\N
100068	GENERIC_DAY	2	0	2010-05-12	1320	\N	97569	\N	\N
100013	GENERIC_DAY	2	0	2010-05-10	1326	\N	97569	\N	\N
99625	GENERIC_DAY	2	0	2010-05-07	1332	\N	97569	\N	\N
99614	GENERIC_DAY	2	0	2010-04-15	50401	\N	97569	\N	\N
99857	GENERIC_DAY	2	0	2010-05-09	61308	\N	97569	\N	\N
99865	GENERIC_DAY	2	0	2010-04-19	19496	\N	97569	\N	\N
100067	GENERIC_DAY	2	0	2010-04-27	1320	\N	97569	\N	\N
99961	GENERIC_DAY	2	1	2010-05-05	2728	\N	97569	\N	\N
99620	GENERIC_DAY	2	0	2010-05-07	19498	\N	97569	\N	\N
99733	GENERIC_DAY	2	0	2010-05-08	50401	\N	97569	\N	\N
99936	GENERIC_DAY	2	1	2010-05-07	61308	\N	97569	\N	\N
99660	GENERIC_DAY	2	0	2010-05-02	85043	\N	97569	\N	\N
99800	GENERIC_DAY	2	0	2010-05-02	1328	\N	97569	\N	\N
99774	GENERIC_DAY	2	0	2010-04-28	19496	\N	97569	\N	\N
99523	GENERIC_DAY	2	0	2010-04-26	61308	\N	97569	\N	\N
99576	GENERIC_DAY	2	0	2010-04-14	1328	\N	97569	\N	\N
99775	GENERIC_DAY	2	0	2010-05-02	19498	\N	97569	\N	\N
99911	GENERIC_DAY	2	0	2010-04-15	1328	\N	97569	\N	\N
99983	GENERIC_DAY	2	0	2010-05-12	1330	\N	97569	\N	\N
99994	GENERIC_DAY	2	0	2010-05-09	19498	\N	97569	\N	\N
99546	GENERIC_DAY	2	0	2010-05-03	1314	\N	97569	\N	\N
99926	GENERIC_DAY	2	0	2010-05-04	1324	\N	97569	\N	\N
99987	GENERIC_DAY	2	0	2010-04-13	19494	\N	97569	\N	\N
99933	GENERIC_DAY	2	0	2010-04-17	61308	\N	97569	\N	\N
99831	GENERIC_DAY	2	1	2010-04-21	2728	\N	97569	\N	\N
100033	GENERIC_DAY	2	0	2010-05-16	1330	\N	97569	\N	\N
99672	GENERIC_DAY	2	0	2010-04-27	40199	\N	97569	\N	\N
99692	GENERIC_DAY	2	0	2010-04-26	1330	\N	97569	\N	\N
100133	GENERIC_DAY	2	1	2010-04-23	50401	\N	97569	\N	\N
99684	GENERIC_DAY	2	0	2010-04-13	1320	\N	97569	\N	\N
99579	GENERIC_DAY	2	0	2010-05-17	1330	\N	97569	\N	\N
99724	GENERIC_DAY	2	0	2010-05-06	1326	\N	97569	\N	\N
99666	GENERIC_DAY	2	0	2010-05-11	50401	\N	97569	\N	\N
99867	GENERIC_DAY	2	0	2010-04-24	19500	\N	97569	\N	\N
99574	GENERIC_DAY	2	0	2010-05-05	1320	\N	97569	\N	\N
99715	GENERIC_DAY	2	0	2010-04-19	1320	\N	97569	\N	\N
99677	GENERIC_DAY	2	0	2010-04-14	1320	\N	97569	\N	\N
99764	GENERIC_DAY	2	0	2010-05-06	19500	\N	97569	\N	\N
99835	GENERIC_DAY	2	0	2010-04-16	1330	\N	97569	\N	\N
99876	GENERIC_DAY	2	1	2010-04-20	1332	\N	97569	\N	\N
100105	GENERIC_DAY	2	0	2010-04-21	1328	\N	97569	\N	\N
100059	GENERIC_DAY	2	0	2010-05-07	1324	\N	97569	\N	\N
99814	GENERIC_DAY	2	0	2010-04-18	1316	\N	97569	\N	\N
99999	GENERIC_DAY	2	0	2010-04-24	1322	\N	97569	\N	\N
100107	GENERIC_DAY	2	0	2010-04-17	19500	\N	97569	\N	\N
100046	GENERIC_DAY	2	0	2010-04-18	1332	\N	97569	\N	\N
99542	GENERIC_DAY	2	0	2010-04-19	50401	\N	97569	\N	\N
99839	GENERIC_DAY	2	0	2010-04-13	1324	\N	97569	\N	\N
99889	GENERIC_DAY	2	0	2010-04-28	19494	\N	97569	\N	\N
99553	GENERIC_DAY	2	0	2010-05-15	1332	\N	97569	\N	\N
99717	GENERIC_DAY	2	0	2010-04-19	1328	\N	97569	\N	\N
99757	GENERIC_DAY	2	0	2010-05-01	1330	\N	97569	\N	\N
100072	GENERIC_DAY	2	0	2010-05-14	1314	\N	97569	\N	\N
100034	GENERIC_DAY	2	0	2010-05-05	1318	\N	97569	\N	\N
100123	GENERIC_DAY	2	0	2010-04-15	1318	\N	97569	\N	\N
99538	GENERIC_DAY	2	0	2010-04-16	1324	\N	97569	\N	\N
99820	GENERIC_DAY	2	0	2010-04-21	1330	\N	97569	\N	\N
99910	GENERIC_DAY	2	0	2010-04-23	1314	\N	97569	\N	\N
99885	GENERIC_DAY	2	0	2010-05-11	61308	\N	97569	\N	\N
100044	GENERIC_DAY	2	0	2010-05-02	19500	\N	97569	\N	\N
99617	GENERIC_DAY	2	0	2010-04-23	19494	\N	97569	\N	\N
99922	GENERIC_DAY	2	0	2010-05-02	50401	\N	97569	\N	\N
99748	GENERIC_DAY	2	0	2010-04-18	61308	\N	97569	\N	\N
100076	GENERIC_DAY	2	0	2010-04-19	1314	\N	97569	\N	\N
100020	GENERIC_DAY	2	0	2010-05-17	50401	\N	97569	\N	\N
99716	GENERIC_DAY	2	0	2010-04-26	1326	\N	97569	\N	\N
99732	GENERIC_DAY	2	0	2010-05-16	1324	\N	97569	\N	\N
100049	GENERIC_DAY	2	0	2010-05-15	61308	\N	97569	\N	\N
100016	GENERIC_DAY	2	0	2010-05-07	1314	\N	97569	\N	\N
99599	GENERIC_DAY	2	0	2010-04-21	50401	\N	97569	\N	\N
99549	GENERIC_DAY	2	0	2010-04-24	19494	\N	97569	\N	\N
99778	GENERIC_DAY	2	0	2010-04-15	1326	\N	97569	\N	\N
100070	GENERIC_DAY	2	0	2010-05-01	1314	\N	97569	\N	\N
99673	GENERIC_DAY	2	0	2010-05-07	2728	\N	97569	\N	\N
99575	GENERIC_DAY	2	0	2010-04-30	1318	\N	97569	\N	\N
99796	GENERIC_DAY	2	0	2010-05-16	1318	\N	97569	\N	\N
99670	GENERIC_DAY	2	0	2010-04-19	1330	\N	97569	\N	\N
99989	GENERIC_DAY	2	1	2010-04-26	1332	\N	97569	\N	\N
99564	GENERIC_DAY	2	1	2010-05-07	50401	\N	97569	\N	\N
99984	GENERIC_DAY	2	0	2010-05-09	2728	\N	97569	\N	\N
99699	GENERIC_DAY	2	1	2010-04-13	2728	\N	97569	\N	\N
99806	GENERIC_DAY	2	0	2010-05-15	1318	\N	97569	\N	\N
100080	GENERIC_DAY	2	0	2010-04-23	1320	\N	97569	\N	\N
99818	GENERIC_DAY	2	1	2010-04-20	1316	\N	97569	\N	\N
99773	GENERIC_DAY	2	0	2010-04-16	1322	\N	97569	\N	\N
99678	GENERIC_DAY	2	0	2010-04-24	61308	\N	97569	\N	\N
100108	GENERIC_DAY	2	0	2010-05-02	1316	\N	97569	\N	\N
99580	GENERIC_DAY	2	0	2010-05-14	1324	\N	97569	\N	\N
99631	GENERIC_DAY	2	0	2010-04-24	85043	\N	97569	\N	\N
100088	GENERIC_DAY	2	1	2010-04-14	1316	\N	97569	\N	\N
99661	GENERIC_DAY	2	0	2010-04-16	19494	\N	97569	\N	\N
99996	GENERIC_DAY	2	0	2010-04-18	50401	\N	97569	\N	\N
99833	GENERIC_DAY	2	1	2010-04-28	1316	\N	97569	\N	\N
100004	GENERIC_DAY	2	0	2010-05-05	85043	\N	97569	\N	\N
99612	GENERIC_DAY	2	0	2010-04-22	1318	\N	97569	\N	\N
100115	GENERIC_DAY	2	0	2010-04-14	1330	\N	97569	\N	\N
99937	GENERIC_DAY	2	0	2010-04-20	1328	\N	97569	\N	\N
100081	GENERIC_DAY	2	0	2010-05-13	1318	\N	97569	\N	\N
99709	GENERIC_DAY	2	0	2010-05-15	1316	\N	97569	\N	\N
99947	GENERIC_DAY	2	0	2010-04-17	1324	\N	97569	\N	\N
99638	GENERIC_DAY	2	0	2010-05-14	1328	\N	97569	\N	\N
100005	GENERIC_DAY	2	0	2010-04-20	1314	\N	97569	\N	\N
99613	GENERIC_DAY	2	0	2010-04-14	19498	\N	97569	\N	\N
100019	GENERIC_DAY	2	0	2010-04-20	61308	\N	97569	\N	\N
99997	GENERIC_DAY	2	1	2010-04-16	61308	\N	97569	\N	\N
99869	GENERIC_DAY	2	0	2010-05-06	19496	\N	97569	\N	\N
99873	GENERIC_DAY	2	0	2010-04-27	50401	\N	97569	\N	\N
100137	GENERIC_DAY	2	0	2010-04-28	50401	\N	97569	\N	\N
100094	GENERIC_DAY	2	0	2010-04-21	1318	\N	97569	\N	\N
99822	GENERIC_DAY	2	1	2010-05-11	1332	\N	97569	\N	\N
99946	GENERIC_DAY	2	0	2010-05-10	1320	\N	97569	\N	\N
99513	GENERIC_DAY	2	0	2010-05-12	1314	\N	97569	\N	\N
99845	GENERIC_DAY	2	0	2010-05-14	2728	\N	97569	\N	\N
99990	GENERIC_DAY	2	1	2010-04-19	2728	\N	97569	\N	\N
99804	GENERIC_DAY	2	0	2010-05-11	1316	\N	97569	\N	\N
99718	GENERIC_DAY	2	0	2010-05-11	19500	\N	97569	\N	\N
99866	GENERIC_DAY	2	0	2010-04-16	1320	\N	97569	\N	\N
99934	GENERIC_DAY	2	0	2010-05-04	1318	\N	97569	\N	\N
99562	GENERIC_DAY	2	0	2010-04-23	85043	\N	97569	\N	\N
99923	GENERIC_DAY	2	0	2010-05-12	1318	\N	97569	\N	\N
99681	GENERIC_DAY	2	0	2010-04-19	19498	\N	97569	\N	\N
99593	GENERIC_DAY	2	0	2010-05-13	1314	\N	97569	\N	\N
99536	GENERIC_DAY	2	0	2010-04-19	40199	\N	97569	\N	\N
99509	GENERIC_DAY	2	0	2010-04-24	1328	\N	97569	\N	\N
99750	GENERIC_DAY	2	0	2010-05-08	2728	\N	97569	\N	\N
99794	GENERIC_DAY	2	0	2010-04-17	40199	\N	97569	\N	\N
99809	GENERIC_DAY	2	1	2010-04-21	1332	\N	97569	\N	\N
99905	GENERIC_DAY	2	0	2010-04-21	40199	\N	97569	\N	\N
99711	GENERIC_DAY	2	0	2010-04-17	1320	\N	97569	\N	\N
100001	GENERIC_DAY	2	0	2010-04-28	1326	\N	97569	\N	\N
99586	GENERIC_DAY	2	0	2010-04-16	19500	\N	97569	\N	\N
99850	GENERIC_DAY	2	0	2010-04-13	40199	\N	97569	\N	\N
100057	GENERIC_DAY	2	0	2010-05-11	1324	\N	97569	\N	\N
99887	GENERIC_DAY	2	0	2010-04-22	1324	\N	97569	\N	\N
99883	GENERIC_DAY	2	0	2010-05-01	61308	\N	97569	\N	\N
99543	GENERIC_DAY	2	0	2010-05-07	1328	\N	97569	\N	\N
100113	GENERIC_DAY	2	1	2010-04-30	61308	\N	97569	\N	\N
99551	GENERIC_DAY	2	1	2010-04-14	1322	\N	97569	\N	\N
99621	GENERIC_DAY	2	0	2010-05-05	50401	\N	97569	\N	\N
99729	GENERIC_DAY	2	0	2010-05-13	1326	\N	97569	\N	\N
99530	GENERIC_DAY	2	0	2010-05-08	19494	\N	97569	\N	\N
99832	GENERIC_DAY	2	0	2010-04-25	19494	\N	97569	\N	\N
99982	GENERIC_DAY	2	0	2010-05-11	1314	\N	97569	\N	\N
100069	GENERIC_DAY	2	0	2010-04-14	19500	\N	97569	\N	\N
99920	GENERIC_DAY	2	0	2010-05-12	1316	\N	97569	\N	\N
99745	GENERIC_DAY	2	0	2010-05-02	1322	\N	97569	\N	\N
99573	GENERIC_DAY	2	0	2010-04-22	19498	\N	97569	\N	\N
100035	GENERIC_DAY	2	0	2010-05-02	61308	\N	97569	\N	\N
100026	GENERIC_DAY	2	1	2010-04-28	1332	\N	97569	\N	\N
99918	GENERIC_DAY	2	0	2010-05-17	1320	\N	97569	\N	\N
99690	GENERIC_DAY	2	1	2010-05-06	2728	\N	97569	\N	\N
99841	GENERIC_DAY	2	0	2010-05-06	85043	\N	97569	\N	\N
99652	GENERIC_DAY	2	0	2010-04-25	1320	\N	97569	\N	\N
100131	GENERIC_DAY	2	0	2010-05-04	1320	\N	97569	\N	\N
99860	GENERIC_DAY	2	0	2010-04-28	85043	\N	97569	\N	\N
99783	GENERIC_DAY	2	0	2010-04-28	40199	\N	97569	\N	\N
99611	GENERIC_DAY	2	1	2010-05-14	1316	\N	97569	\N	\N
100104	GENERIC_DAY	2	0	2010-04-16	2728	\N	97569	\N	\N
99578	GENERIC_DAY	2	0	2010-04-26	1320	\N	97569	\N	\N
99917	GENERIC_DAY	2	0	2010-05-09	19496	\N	97569	\N	\N
99675	GENERIC_DAY	2	0	2010-05-02	40199	\N	97569	\N	\N
100029	GENERIC_DAY	2	0	2010-05-14	1322	\N	97569	\N	\N
99921	GENERIC_DAY	2	1	2010-04-15	2728	\N	97569	\N	\N
99689	GENERIC_DAY	2	1	2010-04-16	1316	\N	97569	\N	\N
99705	GENERIC_DAY	2	0	2010-04-27	19496	\N	97569	\N	\N
100022	GENERIC_DAY	2	0	2010-05-02	1324	\N	97569	\N	\N
100124	GENERIC_DAY	2	0	2010-05-08	19498	\N	97569	\N	\N
99931	GENERIC_DAY	2	0	2010-05-11	1326	\N	97569	\N	\N
99698	GENERIC_DAY	2	0	2010-04-24	1326	\N	97569	\N	\N
99535	GENERIC_DAY	2	0	2010-05-06	61308	\N	97569	\N	\N
99760	GENERIC_DAY	2	0	2010-04-17	19496	\N	97569	\N	\N
99686	GENERIC_DAY	2	0	2010-04-25	19496	\N	97569	\N	\N
99591	GENERIC_DAY	2	0	2010-05-16	61308	\N	97569	\N	\N
99938	GENERIC_DAY	2	0	2010-05-01	85043	\N	97569	\N	\N
99967	GENERIC_DAY	2	0	2010-04-24	1316	\N	97569	\N	\N
99701	GENERIC_DAY	2	0	2010-04-22	1314	\N	97569	\N	\N
99973	GENERIC_DAY	2	1	2010-05-04	1322	\N	97569	\N	\N
99968	GENERIC_DAY	2	0	2010-05-15	1320	\N	97569	\N	\N
99943	GENERIC_DAY	2	0	2010-04-18	1326	\N	97569	\N	\N
99754	GENERIC_DAY	2	1	2010-04-14	2728	\N	97569	\N	\N
100126	GENERIC_DAY	2	0	2010-04-25	1318	\N	97569	\N	\N
100024	GENERIC_DAY	2	0	2010-04-30	1326	\N	97569	\N	\N
99569	GENERIC_DAY	2	0	2010-05-10	61308	\N	97569	\N	\N
99721	GENERIC_DAY	2	0	2010-04-25	1324	\N	97569	\N	\N
99736	GENERIC_DAY	2	0	2010-04-27	1326	\N	97569	\N	\N
99930	GENERIC_DAY	2	0	2010-05-11	40199	\N	97569	\N	\N
99965	GENERIC_DAY	2	0	2010-05-04	1314	\N	97569	\N	\N
99598	GENERIC_DAY	2	1	2010-05-12	1332	\N	97569	\N	\N
99676	GENERIC_DAY	2	0	2010-04-20	1330	\N	97569	\N	\N
100074	GENERIC_DAY	2	0	2010-04-29	19500	\N	97569	\N	\N
99772	GENERIC_DAY	2	0	2010-05-01	1332	\N	97569	\N	\N
99505	GENERIC_DAY	2	1	2010-05-13	1332	\N	97569	\N	\N
99687	GENERIC_DAY	2	0	2010-04-14	1314	\N	97569	\N	\N
99851	GENERIC_DAY	2	0	2010-05-17	19494	\N	97569	\N	\N
100063	GENERIC_DAY	2	0	2010-04-20	1324	\N	97569	\N	\N
99641	GENERIC_DAY	2	0	2010-05-14	19496	\N	97569	\N	\N
99651	GENERIC_DAY	2	0	2010-04-24	50401	\N	97569	\N	\N
100078	GENERIC_DAY	2	0	2010-04-29	50401	\N	97569	\N	\N
99803	GENERIC_DAY	2	0	2010-04-20	40199	\N	97569	\N	\N
100056	GENERIC_DAY	2	0	2010-05-15	2728	\N	97569	\N	\N
99710	GENERIC_DAY	2	0	2010-05-15	19498	\N	97569	\N	\N
100082	GENERIC_DAY	2	0	2010-05-14	1332	\N	97569	\N	\N
100120	GENERIC_DAY	2	0	2010-04-18	19498	\N	97569	\N	\N
100000	GENERIC_DAY	2	0	2010-04-29	1320	\N	97569	\N	\N
99654	GENERIC_DAY	2	1	2010-04-22	2728	\N	97569	\N	\N
99639	GENERIC_DAY	2	0	2010-04-16	19496	\N	97569	\N	\N
99615	GENERIC_DAY	2	0	2010-04-17	1332	\N	97569	\N	\N
99738	GENERIC_DAY	2	0	2010-04-21	85043	\N	97569	\N	\N
99788	GENERIC_DAY	2	0	2010-05-15	19496	\N	97569	\N	\N
100054	GENERIC_DAY	2	0	2010-05-04	19498	\N	97569	\N	\N
100053	GENERIC_DAY	2	1	2010-05-03	2728	\N	97569	\N	\N
99843	GENERIC_DAY	2	0	2010-05-04	1326	\N	97569	\N	\N
99849	GENERIC_DAY	2	0	2010-05-12	1326	\N	97569	\N	\N
99899	GENERIC_DAY	2	0	2010-05-05	19500	\N	97569	\N	\N
99761	GENERIC_DAY	2	0	2010-04-25	19498	\N	97569	\N	\N
99847	GENERIC_DAY	2	0	2010-05-16	1332	\N	97569	\N	\N
100043	GENERIC_DAY	2	0	2010-05-03	19496	\N	97569	\N	\N
99656	GENERIC_DAY	2	0	2010-05-04	40199	\N	97569	\N	\N
100011	GENERIC_DAY	2	0	2010-05-02	19496	\N	97569	\N	\N
99904	GENERIC_DAY	2	0	2010-04-20	19500	\N	97569	\N	\N
99856	GENERIC_DAY	2	0	2010-05-12	19500	\N	97569	\N	\N
99985	GENERIC_DAY	2	0	2010-05-07	19500	\N	97569	\N	\N
100027	GENERIC_DAY	2	0	2010-04-21	19496	\N	97569	\N	\N
99784	GENERIC_DAY	2	0	2010-04-16	1326	\N	97569	\N	\N
99589	GENERIC_DAY	2	0	2010-05-07	1318	\N	97569	\N	\N
99881	GENERIC_DAY	2	0	2010-04-16	1318	\N	97569	\N	\N
99510	GENERIC_DAY	2	0	2010-04-25	1328	\N	97569	\N	\N
99560	GENERIC_DAY	2	0	2010-04-19	1318	\N	97569	\N	\N
99797	GENERIC_DAY	2	1	2010-05-12	1328	\N	97569	\N	\N
99664	GENERIC_DAY	2	0	2010-05-09	19500	\N	97569	\N	\N
99979	GENERIC_DAY	2	0	2010-05-09	1318	\N	97569	\N	\N
99842	GENERIC_DAY	2	0	2010-04-29	1318	\N	97569	\N	\N
99844	GENERIC_DAY	2	0	2010-05-05	1314	\N	97569	\N	\N
99659	GENERIC_DAY	2	1	2010-05-10	1332	\N	97569	\N	\N
100012	GENERIC_DAY	2	0	2010-05-10	1328	\N	97569	\N	\N
99940	GENERIC_DAY	2	0	2010-05-06	50401	\N	97569	\N	\N
99629	GENERIC_DAY	2	0	2010-05-13	19498	\N	97569	\N	\N
99900	GENERIC_DAY	2	0	2010-05-10	1318	\N	97569	\N	\N
100038	GENERIC_DAY	2	0	2010-04-22	19496	\N	97569	\N	\N
99719	GENERIC_DAY	2	0	2010-04-26	19500	\N	97569	\N	\N
99526	GENERIC_DAY	2	0	2010-04-20	19496	\N	97569	\N	\N
99691	GENERIC_DAY	2	0	2010-05-04	61308	\N	97569	\N	\N
100128	GENERIC_DAY	2	1	2010-04-30	1316	\N	97569	\N	\N
100125	GENERIC_DAY	2	0	2010-04-24	1318	\N	97569	\N	\N
100087	GENERIC_DAY	2	0	2010-05-01	2728	\N	97569	\N	\N
99741	GENERIC_DAY	2	0	2010-04-29	19496	\N	97569	\N	\N
99863	GENERIC_DAY	2	0	2010-05-08	1322	\N	97569	\N	\N
99657	GENERIC_DAY	2	0	2010-04-18	1314	\N	97569	\N	\N
99561	GENERIC_DAY	2	0	2010-04-17	1314	\N	97569	\N	\N
99728	GENERIC_DAY	2	0	2010-04-28	1328	\N	97569	\N	\N
99521	GENERIC_DAY	2	1	2010-04-27	1322	\N	97569	\N	\N
99531	GENERIC_DAY	2	0	2010-04-13	19500	\N	97569	\N	\N
99747	GENERIC_DAY	2	0	2010-05-03	1326	\N	97569	\N	\N
99744	GENERIC_DAY	2	1	2010-05-10	2728	\N	97569	\N	\N
99608	GENERIC_DAY	2	0	2010-05-04	19500	\N	97569	\N	\N
99532	GENERIC_DAY	2	0	2010-04-26	85043	\N	97569	\N	\N
99896	GENERIC_DAY	2	0	2010-04-30	85043	\N	97569	\N	\N
99859	GENERIC_DAY	2	0	2010-05-10	1324	\N	97569	\N	\N
99746	GENERIC_DAY	2	1	2010-05-11	1328	\N	97569	\N	\N
99893	GENERIC_DAY	2	0	2010-04-15	19498	\N	97569	\N	\N
99960	GENERIC_DAY	2	0	2010-04-18	40199	\N	97569	\N	\N
99890	GENERIC_DAY	2	0	2010-05-09	1320	\N	97569	\N	\N
99898	GENERIC_DAY	2	0	2010-05-04	85043	\N	97569	\N	\N
99649	GENERIC_DAY	2	1	2010-05-07	85043	\N	97569	\N	\N
99928	GENERIC_DAY	2	0	2010-05-13	61308	\N	97569	\N	\N
100136	GENERIC_DAY	2	1	2010-04-26	2728	\N	97569	\N	\N
99766	GENERIC_DAY	2	0	2010-05-12	40199	\N	97569	\N	\N
99912	GENERIC_DAY	2	0	2010-05-07	1330	\N	97569	\N	\N
99597	GENERIC_DAY	2	0	2010-04-29	19494	\N	97569	\N	\N
99884	GENERIC_DAY	2	0	2010-04-23	1318	\N	97569	\N	\N
99858	GENERIC_DAY	2	0	2010-04-27	1328	\N	97569	\N	\N
99829	GENERIC_DAY	2	1	2010-04-30	40199	\N	97569	\N	\N
99503	GENERIC_DAY	2	0	2010-05-17	85043	\N	97569	\N	\N
99805	GENERIC_DAY	2	0	2010-05-02	1326	\N	97569	\N	\N
99986	GENERIC_DAY	2	0	2010-05-02	1330	\N	97569	\N	\N
99995	GENERIC_DAY	2	0	2010-04-13	19498	\N	97569	\N	\N
99916	GENERIC_DAY	2	1	2010-04-15	1332	\N	97569	\N	\N
99581	GENERIC_DAY	2	0	2010-04-21	1320	\N	97569	\N	\N
100009	GENERIC_DAY	2	0	2010-05-08	1320	\N	97569	\N	\N
99816	GENERIC_DAY	2	0	2010-05-04	50401	\N	97569	\N	\N
99886	GENERIC_DAY	2	0	2010-05-10	1330	\N	97569	\N	\N
99948	GENERIC_DAY	2	0	2010-04-13	1330	\N	97569	\N	\N
99568	GENERIC_DAY	2	0	2010-05-11	1318	\N	97569	\N	\N
99978	GENERIC_DAY	2	0	2010-04-14	40199	\N	97569	\N	\N
99758	GENERIC_DAY	2	0	2010-05-16	19494	\N	97569	\N	\N
99795	GENERIC_DAY	2	0	2010-04-26	19494	\N	97569	\N	\N
99533	GENERIC_DAY	2	0	2010-04-18	1318	\N	97569	\N	\N
99953	GENERIC_DAY	2	0	2010-04-23	1332	\N	97569	\N	\N
99528	GENERIC_DAY	2	0	2010-05-09	1332	\N	97569	\N	\N
99517	GENERIC_DAY	2	0	2010-04-13	1326	\N	97569	\N	\N
100116	GENERIC_DAY	2	0	2010-05-01	40199	\N	97569	\N	\N
100110	GENERIC_DAY	2	0	2010-04-30	19498	\N	97569	\N	\N
100092	GENERIC_DAY	2	0	2010-05-03	1322	\N	97569	\N	\N
99600	GENERIC_DAY	2	0	2010-04-27	1330	\N	97569	\N	\N
100091	GENERIC_DAY	2	0	2010-05-10	40199	\N	97569	\N	\N
99755	GENERIC_DAY	2	0	2010-05-15	40199	\N	97569	\N	\N
99878	GENERIC_DAY	2	0	2010-05-13	1320	\N	97569	\N	\N
99713	GENERIC_DAY	2	0	2010-04-23	1328	\N	97569	\N	\N
99998	GENERIC_DAY	2	0	2010-04-18	2728	\N	97569	\N	\N
99874	GENERIC_DAY	2	0	2010-04-18	19496	\N	97569	\N	\N
100058	GENERIC_DAY	2	1	2010-05-12	19496	\N	97569	\N	\N
100109	GENERIC_DAY	2	0	2010-05-12	2728	\N	97569	\N	\N
99880	GENERIC_DAY	2	1	2010-05-10	1322	\N	97569	\N	\N
99992	GENERIC_DAY	2	0	2010-04-28	61308	\N	97569	\N	\N
99520	GENERIC_DAY	2	0	2010-05-01	19498	\N	97569	\N	\N
100102	GENERIC_DAY	2	1	2010-04-15	1316	\N	97569	\N	\N
100098	GENERIC_DAY	2	0	2010-04-18	1320	\N	97569	\N	\N
100042	GENERIC_DAY	2	0	2010-05-10	19498	\N	97569	\N	\N
100047	GENERIC_DAY	2	0	2010-04-13	1314	\N	97569	\N	\N
99583	GENERIC_DAY	2	0	2010-04-28	1320	\N	97569	\N	\N
100050	GENERIC_DAY	2	0	2010-05-13	85043	\N	97569	\N	\N
99907	GENERIC_DAY	2	0	2010-05-14	1330	\N	97569	\N	\N
99512	GENERIC_DAY	2	0	2010-04-21	1324	\N	97569	\N	\N
99944	GENERIC_DAY	2	0	2010-04-26	50401	\N	97569	\N	\N
99908	GENERIC_DAY	2	0	2010-05-08	85043	\N	97569	\N	\N
99846	GENERIC_DAY	2	0	2010-04-30	19494	\N	97569	\N	\N
100084	GENERIC_DAY	2	0	2010-05-01	1326	\N	97569	\N	\N
99870	GENERIC_DAY	2	0	2010-04-22	50401	\N	97569	\N	\N
100093	GENERIC_DAY	2	0	2010-05-08	1326	\N	97569	\N	\N
99622	GENERIC_DAY	2	1	2010-05-17	1318	\N	97569	\N	\N
100079	GENERIC_DAY	2	1	2010-04-13	1322	\N	97569	\N	\N
99645	GENERIC_DAY	2	0	2010-04-23	1324	\N	97569	\N	\N
100052	GENERIC_DAY	2	0	2010-04-27	85043	\N	97569	\N	\N
100127	GENERIC_DAY	2	0	2010-05-14	19498	\N	97569	\N	\N
99626	GENERIC_DAY	2	0	2010-05-09	1322	\N	97569	\N	\N
100075	GENERIC_DAY	2	0	2010-04-20	1318	\N	97569	\N	\N
100025	GENERIC_DAY	2	0	2010-05-10	19494	\N	97569	\N	\N
99777	GENERIC_DAY	2	0	2010-04-26	19498	\N	97569	\N	\N
100103	GENERIC_DAY	2	0	2010-05-16	50401	\N	97569	\N	\N
99879	GENERIC_DAY	2	0	2010-05-17	19500	\N	97569	\N	\N
99630	GENERIC_DAY	2	1	2010-04-27	1316	\N	97569	\N	\N
99725	GENERIC_DAY	2	1	2010-05-17	1332	\N	97569	\N	\N
99964	GENERIC_DAY	2	0	2010-05-10	85043	\N	97569	\N	\N
99962	GENERIC_DAY	2	0	2010-05-12	1324	\N	97569	\N	\N
99633	GENERIC_DAY	2	0	2010-04-28	1324	\N	97569	\N	\N
99606	GENERIC_DAY	2	0	2010-04-24	40199	\N	97569	\N	\N
99791	GENERIC_DAY	2	0	2010-04-26	40199	\N	97569	\N	\N
99786	GENERIC_DAY	2	1	2010-04-22	1316	\N	97569	\N	\N
99855	GENERIC_DAY	2	1	2010-04-30	50401	\N	97569	\N	\N
99671	GENERIC_DAY	2	0	2010-04-30	1314	\N	97569	\N	\N
99770	GENERIC_DAY	2	0	2010-05-04	19496	\N	97569	\N	\N
99665	GENERIC_DAY	2	0	2010-05-06	1324	\N	97569	\N	\N
99914	GENERIC_DAY	2	0	2010-04-24	1320	\N	97569	\N	\N
99720	GENERIC_DAY	2	0	2010-05-08	61308	\N	97569	\N	\N
100032	GENERIC_DAY	2	1	2010-04-28	2728	\N	97569	\N	\N
99522	GENERIC_DAY	2	0	2010-04-24	1332	\N	97569	\N	\N
100045	GENERIC_DAY	2	0	2010-05-09	50401	\N	97569	\N	\N
99963	GENERIC_DAY	2	1	2010-05-11	19496	\N	97569	\N	\N
99548	GENERIC_DAY	2	1	2010-05-06	1322	\N	97569	\N	\N
99810	GENERIC_DAY	2	0	2010-04-18	1322	\N	97569	\N	\N
100119	GENERIC_DAY	2	0	2010-05-05	1324	\N	97569	\N	\N
99925	GENERIC_DAY	2	1	2010-04-21	1316	\N	97569	\N	\N
99913	GENERIC_DAY	2	0	2010-04-22	19494	\N	97569	\N	\N
99950	GENERIC_DAY	2	1	2010-05-14	40199	\N	97569	\N	\N
100114	GENERIC_DAY	2	1	2010-05-17	1322	\N	97569	\N	\N
99605	GENERIC_DAY	2	0	2010-05-16	1326	\N	97569	\N	\N
99836	GENERIC_DAY	2	1	2010-05-13	19496	\N	97569	\N	\N
100135	GENERIC_DAY	2	0	2010-05-17	40199	\N	97569	\N	\N
100061	GENERIC_DAY	2	0	2010-04-24	2728	\N	97569	\N	\N
99674	GENERIC_DAY	2	0	2010-04-28	1330	\N	97569	\N	\N
100099	GENERIC_DAY	2	0	2010-04-18	1330	\N	97569	\N	\N
100002	GENERIC_DAY	2	1	2010-04-22	1322	\N	97569	\N	\N
99765	GENERIC_DAY	2	0	2010-05-16	19496	\N	97569	\N	\N
99932	GENERIC_DAY	2	0	2010-05-08	1330	\N	97569	\N	\N
99602	GENERIC_DAY	2	0	2010-04-24	1324	\N	97569	\N	\N
100023	GENERIC_DAY	2	0	2010-04-20	19498	\N	97569	\N	\N
99892	GENERIC_DAY	2	0	2010-04-21	61308	\N	97569	\N	\N
99518	GENERIC_DAY	2	0	2010-05-02	1332	\N	97569	\N	\N
99706	GENERIC_DAY	2	0	2010-04-18	1324	\N	97569	\N	\N
99565	GENERIC_DAY	2	0	2010-04-25	19500	\N	97569	\N	\N
100097	GENERIC_DAY	2	0	2010-05-10	19496	\N	97569	\N	\N
99623	GENERIC_DAY	2	1	2010-04-13	1332	\N	97569	\N	\N
99524	GENERIC_DAY	2	1	2010-04-22	1332	\N	97569	\N	\N
99971	GENERIC_DAY	2	0	2010-04-14	19494	\N	97569	\N	\N
99751	GENERIC_DAY	2	0	2010-04-21	19498	\N	97569	\N	\N
99840	GENERIC_DAY	2	0	2010-05-01	1320	\N	97569	\N	\N
99700	GENERIC_DAY	2	0	2010-05-14	19500	\N	97569	\N	\N
99552	GENERIC_DAY	2	0	2010-04-30	1320	\N	97569	\N	\N
99877	GENERIC_DAY	2	0	2010-04-25	1330	\N	97569	\N	\N
99957	GENERIC_DAY	2	0	2010-05-01	19500	\N	97569	\N	\N
99787	GENERIC_DAY	2	1	2010-05-07	40199	\N	97569	\N	\N
99924	GENERIC_DAY	2	1	2010-05-10	1316	\N	97569	\N	\N
99825	GENERIC_DAY	2	0	2010-05-01	1324	\N	97569	\N	\N
100055	GENERIC_DAY	2	0	2010-04-17	50401	\N	97569	\N	\N
99872	GENERIC_DAY	2	1	2010-05-05	1332	\N	97569	\N	\N
99582	GENERIC_DAY	2	1	2010-04-23	1316	\N	97569	\N	\N
99696	GENERIC_DAY	2	0	2010-05-13	19494	\N	97569	\N	\N
100089	GENERIC_DAY	2	0	2010-04-29	1324	\N	97569	\N	\N
99949	GENERIC_DAY	2	0	2010-04-26	1314	\N	97569	\N	\N
100041	GENERIC_DAY	2	0	2010-04-16	1314	\N	97569	\N	\N
99555	GENERIC_DAY	2	0	2010-04-30	19500	\N	97569	\N	\N
99723	GENERIC_DAY	2	1	2010-04-16	50401	\N	97569	\N	\N
99749	GENERIC_DAY	2	0	2010-05-16	85043	\N	97569	\N	\N
99541	GENERIC_DAY	2	0	2010-04-30	19496	\N	97569	\N	\N
99702	GENERIC_DAY	2	0	2010-04-14	50401	\N	97569	\N	\N
100132	GENERIC_DAY	2	0	2010-05-17	1328	\N	97569	\N	\N
99704	GENERIC_DAY	2	0	2010-05-14	1326	\N	97569	\N	\N
99954	GENERIC_DAY	2	0	2010-04-22	19500	\N	97569	\N	\N
99707	GENERIC_DAY	2	0	2010-05-08	1328	\N	97569	\N	\N
99811	GENERIC_DAY	2	0	2010-04-29	1314	\N	97569	\N	\N
100806	GENERIC_DAY	1	0	2010-05-12	1316	\N	97571	\N	\N
100807	GENERIC_DAY	1	0	2010-04-20	1332	\N	97571	\N	\N
100808	GENERIC_DAY	1	0	2010-04-18	50401	\N	97571	\N	\N
100809	GENERIC_DAY	1	0	2010-05-16	1332	\N	97571	\N	\N
100810	GENERIC_DAY	1	0	2010-05-10	61308	\N	97571	\N	\N
100811	GENERIC_DAY	1	0	2010-04-27	61308	\N	97571	\N	\N
100812	GENERIC_DAY	1	0	2010-05-16	19500	\N	97571	\N	\N
100813	GENERIC_DAY	1	0	2010-04-18	19496	\N	97571	\N	\N
100814	GENERIC_DAY	1	0	2010-04-26	1314	\N	97571	\N	\N
100815	GENERIC_DAY	1	0	2010-04-28	19498	\N	97571	\N	\N
100816	GENERIC_DAY	1	0	2010-05-12	1328	\N	97571	\N	\N
100817	GENERIC_DAY	1	2	2010-05-03	1322	\N	97571	\N	\N
100818	GENERIC_DAY	1	0	2010-04-17	19496	\N	97571	\N	\N
100819	GENERIC_DAY	1	0	2010-04-27	1318	\N	97571	\N	\N
100820	GENERIC_DAY	1	0	2010-05-13	1320	\N	97571	\N	\N
100821	GENERIC_DAY	1	0	2010-05-10	1320	\N	97571	\N	\N
100822	GENERIC_DAY	1	0	2010-04-23	1322	\N	97571	\N	\N
100823	GENERIC_DAY	1	1	2010-04-13	2728	\N	97571	\N	\N
100824	GENERIC_DAY	1	0	2010-05-07	19496	\N	97571	\N	\N
100825	GENERIC_DAY	1	1	2010-05-17	1322	\N	97571	\N	\N
100826	GENERIC_DAY	1	1	2010-04-15	1328	\N	97571	\N	\N
100827	GENERIC_DAY	1	0	2010-04-30	1330	\N	97571	\N	\N
100828	GENERIC_DAY	1	0	2010-05-01	1332	\N	97571	\N	\N
100829	GENERIC_DAY	1	1	2010-04-20	1328	\N	97571	\N	\N
100830	GENERIC_DAY	1	0	2010-05-01	1326	\N	97571	\N	\N
100831	GENERIC_DAY	1	0	2010-05-06	1330	\N	97571	\N	\N
100832	GENERIC_DAY	1	0	2010-04-24	2728	\N	97571	\N	\N
100833	GENERIC_DAY	1	0	2010-05-01	1314	\N	97571	\N	\N
100834	GENERIC_DAY	1	0	2010-04-18	40199	\N	97571	\N	\N
100835	GENERIC_DAY	1	1	2010-05-10	1322	\N	97571	\N	\N
100836	GENERIC_DAY	1	0	2010-05-11	1320	\N	97571	\N	\N
100837	GENERIC_DAY	1	0	2010-04-23	19496	\N	97571	\N	\N
100838	GENERIC_DAY	1	0	2010-05-14	1332	\N	97571	\N	\N
100839	GENERIC_DAY	1	0	2010-05-01	2728	\N	97571	\N	\N
100840	GENERIC_DAY	1	0	2010-05-17	1332	\N	97571	\N	\N
100841	GENERIC_DAY	1	0	2010-05-11	40199	\N	97571	\N	\N
100842	GENERIC_DAY	1	0	2010-05-13	1324	\N	97571	\N	\N
100843	GENERIC_DAY	1	0	2010-04-21	19496	\N	97571	\N	\N
100844	GENERIC_DAY	1	0	2010-04-13	19496	\N	97571	\N	\N
100845	GENERIC_DAY	1	1	2010-05-06	1322	\N	97571	\N	\N
100846	GENERIC_DAY	1	1	2010-05-05	2728	\N	97571	\N	\N
100847	GENERIC_DAY	1	0	2010-04-29	85043	\N	97571	\N	\N
100848	GENERIC_DAY	1	1	2010-04-21	1322	\N	97571	\N	\N
100849	GENERIC_DAY	1	0	2010-04-22	50401	\N	97571	\N	\N
100850	GENERIC_DAY	1	0	2010-04-15	1314	\N	97571	\N	\N
100851	GENERIC_DAY	1	1	2010-04-26	1328	\N	97571	\N	\N
100852	GENERIC_DAY	1	0	2010-05-13	1326	\N	97571	\N	\N
100853	GENERIC_DAY	1	0	2010-04-15	1316	\N	97571	\N	\N
100854	GENERIC_DAY	1	0	2010-05-15	1324	\N	97571	\N	\N
100855	GENERIC_DAY	1	0	2010-05-08	19498	\N	97571	\N	\N
100856	GENERIC_DAY	1	1	2010-05-11	19496	\N	97571	\N	\N
100857	GENERIC_DAY	1	0	2010-04-19	1320	\N	97571	\N	\N
100858	GENERIC_DAY	1	0	2010-05-07	1330	\N	97571	\N	\N
100859	GENERIC_DAY	1	1	2010-05-13	19496	\N	97571	\N	\N
100860	GENERIC_DAY	1	1	2010-04-23	1316	\N	97571	\N	\N
100861	GENERIC_DAY	1	0	2010-05-02	1332	\N	97571	\N	\N
100862	GENERIC_DAY	1	0	2010-04-26	19498	\N	97571	\N	\N
100863	GENERIC_DAY	1	0	2010-04-22	19498	\N	97571	\N	\N
100864	GENERIC_DAY	1	0	2010-04-25	1330	\N	97571	\N	\N
100865	GENERIC_DAY	1	0	2010-04-30	19500	\N	97571	\N	\N
100866	GENERIC_DAY	1	0	2010-04-14	1324	\N	97571	\N	\N
100867	GENERIC_DAY	1	1	2010-05-04	1328	\N	97571	\N	\N
100868	GENERIC_DAY	1	0	2010-04-13	1320	\N	97571	\N	\N
100869	GENERIC_DAY	1	1	2010-05-05	19494	\N	97571	\N	\N
100870	GENERIC_DAY	1	0	2010-05-05	19496	\N	97571	\N	\N
100871	GENERIC_DAY	1	0	2010-04-25	61308	\N	97571	\N	\N
100872	GENERIC_DAY	1	1	2010-04-27	2728	\N	97571	\N	\N
100873	GENERIC_DAY	1	0	2010-04-21	1332	\N	97571	\N	\N
100874	GENERIC_DAY	1	0	2010-04-24	1320	\N	97571	\N	\N
100875	GENERIC_DAY	1	0	2010-05-02	40199	\N	97571	\N	\N
100876	GENERIC_DAY	1	0	2010-05-10	1332	\N	97571	\N	\N
100877	GENERIC_DAY	1	0	2010-04-16	1326	\N	97571	\N	\N
100878	GENERIC_DAY	1	0	2010-04-21	1314	\N	97571	\N	\N
100879	GENERIC_DAY	1	1	2010-04-29	2728	\N	97571	\N	\N
100880	GENERIC_DAY	1	0	2010-04-28	1314	\N	97571	\N	\N
100881	GENERIC_DAY	1	0	2010-05-01	1330	\N	97571	\N	\N
100882	GENERIC_DAY	1	0	2010-05-17	40199	\N	97571	\N	\N
100883	GENERIC_DAY	1	1	2010-05-05	1328	\N	97571	\N	\N
100884	GENERIC_DAY	1	0	2010-05-14	1320	\N	97571	\N	\N
100885	GENERIC_DAY	1	0	2010-05-12	61308	\N	97571	\N	\N
100886	GENERIC_DAY	1	0	2010-04-13	19498	\N	97571	\N	\N
100887	GENERIC_DAY	1	0	2010-05-08	19494	\N	97571	\N	\N
100888	GENERIC_DAY	1	0	2010-05-11	1328	\N	97571	\N	\N
100889	GENERIC_DAY	1	1	2010-05-10	1328	\N	97571	\N	\N
100890	GENERIC_DAY	1	0	2010-05-10	1330	\N	97571	\N	\N
100891	GENERIC_DAY	1	0	2010-05-11	19500	\N	97571	\N	\N
100892	GENERIC_DAY	1	0	2010-05-17	61308	\N	97571	\N	\N
100893	GENERIC_DAY	1	1	2010-04-14	1322	\N	97571	\N	\N
100894	GENERIC_DAY	1	0	2010-04-25	40199	\N	97571	\N	\N
100895	GENERIC_DAY	1	0	2010-05-12	50401	\N	97571	\N	\N
100896	GENERIC_DAY	1	0	2010-04-30	1322	\N	97571	\N	\N
100897	GENERIC_DAY	1	0	2010-04-21	85043	\N	97571	\N	\N
100898	GENERIC_DAY	1	0	2010-04-29	40199	\N	97571	\N	\N
100899	GENERIC_DAY	1	0	2010-05-16	19496	\N	97571	\N	\N
100900	GENERIC_DAY	1	0	2010-05-09	50401	\N	97571	\N	\N
100901	GENERIC_DAY	1	0	2010-04-15	1332	\N	97571	\N	\N
100902	GENERIC_DAY	1	0	2010-05-06	61308	\N	97571	\N	\N
100903	GENERIC_DAY	1	0	2010-04-26	1320	\N	97571	\N	\N
100904	GENERIC_DAY	1	0	2010-04-30	1318	\N	97571	\N	\N
100905	GENERIC_DAY	1	0	2010-04-30	2728	\N	97571	\N	\N
100906	GENERIC_DAY	1	0	2010-05-12	1332	\N	97571	\N	\N
100907	GENERIC_DAY	1	0	2010-04-17	61308	\N	97571	\N	\N
100908	GENERIC_DAY	1	0	2010-04-17	1320	\N	97571	\N	\N
100909	GENERIC_DAY	1	0	2010-04-18	19498	\N	97571	\N	\N
100910	GENERIC_DAY	1	0	2010-05-05	19500	\N	97571	\N	\N
100911	GENERIC_DAY	1	0	2010-05-15	61308	\N	97571	\N	\N
100912	GENERIC_DAY	1	0	2010-05-09	1324	\N	97571	\N	\N
100913	GENERIC_DAY	1	0	2010-04-18	1326	\N	97571	\N	\N
100914	GENERIC_DAY	1	0	2010-04-27	85043	\N	97571	\N	\N
100915	GENERIC_DAY	1	0	2010-05-15	19498	\N	97571	\N	\N
100916	GENERIC_DAY	1	1	2010-05-17	19496	\N	97571	\N	\N
100917	GENERIC_DAY	1	0	2010-04-16	2728	\N	97571	\N	\N
100918	GENERIC_DAY	1	1	2010-05-06	19494	\N	97571	\N	\N
100919	GENERIC_DAY	1	0	2010-05-13	1316	\N	97571	\N	\N
100920	GENERIC_DAY	1	0	2010-05-12	1324	\N	97571	\N	\N
100921	GENERIC_DAY	1	1	2010-04-20	19494	\N	97571	\N	\N
100922	GENERIC_DAY	1	0	2010-05-12	1326	\N	97571	\N	\N
100923	GENERIC_DAY	1	0	2010-04-21	50401	\N	97571	\N	\N
100924	GENERIC_DAY	1	0	2010-05-01	19498	\N	97571	\N	\N
100925	GENERIC_DAY	1	0	2010-04-15	1326	\N	97571	\N	\N
100926	GENERIC_DAY	1	0	2010-04-18	1324	\N	97571	\N	\N
100927	GENERIC_DAY	1	1	2010-04-29	19494	\N	97571	\N	\N
100928	GENERIC_DAY	1	0	2010-05-06	1318	\N	97571	\N	\N
100929	GENERIC_DAY	1	0	2010-05-10	40199	\N	97571	\N	\N
100930	GENERIC_DAY	1	0	2010-04-16	19500	\N	97571	\N	\N
100931	GENERIC_DAY	1	0	2010-04-25	1314	\N	97571	\N	\N
100932	GENERIC_DAY	1	0	2010-05-15	19494	\N	97571	\N	\N
100933	GENERIC_DAY	1	0	2010-04-17	1322	\N	97571	\N	\N
100934	GENERIC_DAY	1	0	2010-05-01	1328	\N	97571	\N	\N
100935	GENERIC_DAY	1	0	2010-04-14	19496	\N	97571	\N	\N
100936	GENERIC_DAY	1	0	2010-04-19	1314	\N	97571	\N	\N
100937	GENERIC_DAY	1	0	2010-04-20	19496	\N	97571	\N	\N
100938	GENERIC_DAY	1	0	2010-05-09	1320	\N	97571	\N	\N
100939	GENERIC_DAY	1	1	2010-05-13	19494	\N	97571	\N	\N
100940	GENERIC_DAY	1	0	2010-04-28	50401	\N	97571	\N	\N
100941	GENERIC_DAY	1	0	2010-05-13	19500	\N	97571	\N	\N
100942	GENERIC_DAY	1	0	2010-05-07	1328	\N	97571	\N	\N
100943	GENERIC_DAY	1	0	2010-04-18	1316	\N	97571	\N	\N
100944	GENERIC_DAY	1	0	2010-05-11	1326	\N	97571	\N	\N
100945	GENERIC_DAY	1	0	2010-05-09	1332	\N	97571	\N	\N
100946	GENERIC_DAY	1	0	2010-04-25	1326	\N	97571	\N	\N
100947	GENERIC_DAY	1	0	2010-05-02	85043	\N	97571	\N	\N
100948	GENERIC_DAY	1	0	2010-04-19	19496	\N	97571	\N	\N
100949	GENERIC_DAY	1	0	2010-05-06	85043	\N	97571	\N	\N
100950	GENERIC_DAY	1	0	2010-04-18	1320	\N	97571	\N	\N
100951	GENERIC_DAY	1	0	2010-04-17	40199	\N	97571	\N	\N
100952	GENERIC_DAY	1	0	2010-05-16	50401	\N	97571	\N	\N
100953	GENERIC_DAY	1	1	2010-05-13	2728	\N	97571	\N	\N
100954	GENERIC_DAY	1	0	2010-04-28	1332	\N	97571	\N	\N
100955	GENERIC_DAY	1	0	2010-05-11	1314	\N	97571	\N	\N
100956	GENERIC_DAY	1	0	2010-04-17	1332	\N	97571	\N	\N
100957	GENERIC_DAY	1	1	2010-04-26	19494	\N	97571	\N	\N
100958	GENERIC_DAY	1	0	2010-05-06	40199	\N	97571	\N	\N
100959	GENERIC_DAY	1	0	2010-05-05	1320	\N	97571	\N	\N
100960	GENERIC_DAY	1	0	2010-04-23	19500	\N	97571	\N	\N
100961	GENERIC_DAY	1	0	2010-04-23	50401	\N	97571	\N	\N
100962	GENERIC_DAY	1	1	2010-04-26	1322	\N	97571	\N	\N
100963	GENERIC_DAY	1	0	2010-04-30	50401	\N	97571	\N	\N
100964	GENERIC_DAY	1	0	2010-04-30	1314	\N	97571	\N	\N
100965	GENERIC_DAY	1	0	2010-05-03	1324	\N	97571	\N	\N
100966	GENERIC_DAY	1	0	2010-05-08	40199	\N	97571	\N	\N
100967	GENERIC_DAY	1	0	2010-04-22	85043	\N	97571	\N	\N
100968	GENERIC_DAY	1	1	2010-04-14	19494	\N	97571	\N	\N
100969	GENERIC_DAY	1	0	2010-05-04	50401	\N	97571	\N	\N
100970	GENERIC_DAY	1	0	2010-05-06	19496	\N	97571	\N	\N
100971	GENERIC_DAY	1	0	2010-05-04	40199	\N	97571	\N	\N
100972	GENERIC_DAY	1	0	2010-04-21	1318	\N	97571	\N	\N
100973	GENERIC_DAY	1	0	2010-05-01	50401	\N	97571	\N	\N
100974	GENERIC_DAY	1	0	2010-05-08	1318	\N	97571	\N	\N
100975	GENERIC_DAY	1	0	2010-05-14	19498	\N	97571	\N	\N
100976	GENERIC_DAY	1	0	2010-04-18	2728	\N	97571	\N	\N
100977	GENERIC_DAY	1	0	2010-05-16	1328	\N	97571	\N	\N
100978	GENERIC_DAY	1	0	2010-04-21	19500	\N	97571	\N	\N
100979	GENERIC_DAY	1	0	2010-05-08	50401	\N	97571	\N	\N
100980	GENERIC_DAY	1	0	2010-05-06	1320	\N	97571	\N	\N
100981	GENERIC_DAY	1	0	2010-04-17	1318	\N	97571	\N	\N
100982	GENERIC_DAY	1	0	2010-04-24	1322	\N	97571	\N	\N
100983	GENERIC_DAY	1	0	2010-05-09	40199	\N	97571	\N	\N
100984	GENERIC_DAY	1	0	2010-04-27	1324	\N	97571	\N	\N
100985	GENERIC_DAY	1	0	2010-05-10	19496	\N	97571	\N	\N
100986	GENERIC_DAY	1	1	2010-04-23	85043	\N	97571	\N	\N
100987	GENERIC_DAY	1	0	2010-04-29	19498	\N	97571	\N	\N
100988	GENERIC_DAY	1	0	2010-04-15	1320	\N	97571	\N	\N
100989	GENERIC_DAY	1	0	2010-05-10	1326	\N	97571	\N	\N
100990	GENERIC_DAY	1	0	2010-05-09	85043	\N	97571	\N	\N
100991	GENERIC_DAY	1	0	2010-04-17	50401	\N	97571	\N	\N
100992	GENERIC_DAY	1	0	2010-05-17	85043	\N	97571	\N	\N
100993	GENERIC_DAY	1	0	2010-04-13	1330	\N	97571	\N	\N
100994	GENERIC_DAY	1	0	2010-04-20	50401	\N	97571	\N	\N
100995	GENERIC_DAY	1	0	2010-04-25	2728	\N	97571	\N	\N
100996	GENERIC_DAY	1	0	2010-04-21	40199	\N	97571	\N	\N
100997	GENERIC_DAY	1	0	2010-04-27	19500	\N	97571	\N	\N
100998	GENERIC_DAY	1	0	2010-05-04	85043	\N	97571	\N	\N
100999	GENERIC_DAY	1	0	2010-04-19	40199	\N	97571	\N	\N
101000	GENERIC_DAY	1	1	2010-04-16	50401	\N	97571	\N	\N
101001	GENERIC_DAY	1	0	2010-05-09	19498	\N	97571	\N	\N
101002	GENERIC_DAY	1	0	2010-04-21	1320	\N	97571	\N	\N
101003	GENERIC_DAY	1	1	2010-04-27	19494	\N	97571	\N	\N
101004	GENERIC_DAY	1	0	2010-04-28	61308	\N	97571	\N	\N
101005	GENERIC_DAY	1	0	2010-05-01	85043	\N	97571	\N	\N
101006	GENERIC_DAY	1	0	2010-05-15	50401	\N	97571	\N	\N
101007	GENERIC_DAY	1	0	2010-04-14	1320	\N	97571	\N	\N
101008	GENERIC_DAY	1	1	2010-05-06	1328	\N	97571	\N	\N
101009	GENERIC_DAY	1	0	2010-04-26	50401	\N	97571	\N	\N
101010	GENERIC_DAY	1	0	2010-04-19	1316	\N	97571	\N	\N
101011	GENERIC_DAY	1	0	2010-04-29	1316	\N	97571	\N	\N
101012	GENERIC_DAY	1	0	2010-05-14	19496	\N	97571	\N	\N
101013	GENERIC_DAY	1	0	2010-04-24	19494	\N	97571	\N	\N
101014	GENERIC_DAY	1	0	2010-05-01	1320	\N	97571	\N	\N
101015	GENERIC_DAY	1	0	2010-04-30	1320	\N	97571	\N	\N
101016	GENERIC_DAY	1	1	2010-04-27	1322	\N	97571	\N	\N
101017	GENERIC_DAY	1	0	2010-05-05	1330	\N	97571	\N	\N
101018	GENERIC_DAY	1	0	2010-05-13	1328	\N	97571	\N	\N
101019	GENERIC_DAY	1	0	2010-05-06	1326	\N	97571	\N	\N
101020	GENERIC_DAY	1	0	2010-05-11	1316	\N	97571	\N	\N
101021	GENERIC_DAY	1	0	2010-05-13	40199	\N	97571	\N	\N
101022	GENERIC_DAY	1	0	2010-05-04	1324	\N	97571	\N	\N
101023	GENERIC_DAY	1	0	2010-04-22	1330	\N	97571	\N	\N
101024	GENERIC_DAY	1	0	2010-04-13	1324	\N	97571	\N	\N
101025	GENERIC_DAY	1	1	2010-05-12	2728	\N	97571	\N	\N
101026	GENERIC_DAY	1	0	2010-05-13	1332	\N	97571	\N	\N
101027	GENERIC_DAY	1	0	2010-04-18	1318	\N	97571	\N	\N
101028	GENERIC_DAY	1	0	2010-04-28	1330	\N	97571	\N	\N
101029	GENERIC_DAY	1	0	2010-05-08	19496	\N	97571	\N	\N
101030	GENERIC_DAY	1	0	2010-04-18	1328	\N	97571	\N	\N
101031	GENERIC_DAY	1	0	2010-05-02	19498	\N	97571	\N	\N
101032	GENERIC_DAY	1	0	2010-05-02	1324	\N	97571	\N	\N
101033	GENERIC_DAY	1	0	2010-04-15	1324	\N	97571	\N	\N
101034	GENERIC_DAY	1	0	2010-05-15	19496	\N	97571	\N	\N
101035	GENERIC_DAY	1	0	2010-04-26	61308	\N	97571	\N	\N
101036	GENERIC_DAY	1	0	2010-05-15	1330	\N	97571	\N	\N
101037	GENERIC_DAY	1	0	2010-05-14	2728	\N	97571	\N	\N
101038	GENERIC_DAY	1	0	2010-05-06	50401	\N	97571	\N	\N
101039	GENERIC_DAY	1	0	2010-05-02	1328	\N	97571	\N	\N
101040	GENERIC_DAY	1	1	2010-04-22	2728	\N	97571	\N	\N
101041	GENERIC_DAY	1	0	2010-05-14	1330	\N	97571	\N	\N
101042	GENERIC_DAY	1	0	2010-05-09	19500	\N	97571	\N	\N
101043	GENERIC_DAY	1	0	2010-04-16	19496	\N	97571	\N	\N
101044	GENERIC_DAY	1	1	2010-05-03	2728	\N	97571	\N	\N
101045	GENERIC_DAY	1	0	2010-05-05	1314	\N	97571	\N	\N
101046	GENERIC_DAY	1	0	2010-04-17	19494	\N	97571	\N	\N
101047	GENERIC_DAY	1	0	2010-05-09	19496	\N	97571	\N	\N
101048	GENERIC_DAY	1	0	2010-05-02	50401	\N	97571	\N	\N
101049	GENERIC_DAY	1	1	2010-05-17	1328	\N	97571	\N	\N
101050	GENERIC_DAY	1	0	2010-05-13	85043	\N	97571	\N	\N
101051	GENERIC_DAY	1	0	2010-04-27	40199	\N	97571	\N	\N
101052	GENERIC_DAY	1	0	2010-05-11	85043	\N	97571	\N	\N
101053	GENERIC_DAY	1	0	2010-05-10	50401	\N	97571	\N	\N
101054	GENERIC_DAY	1	0	2010-04-14	1332	\N	97571	\N	\N
101055	GENERIC_DAY	1	1	2010-05-04	1322	\N	97571	\N	\N
101056	GENERIC_DAY	1	0	2010-04-24	1332	\N	97571	\N	\N
101057	GENERIC_DAY	1	0	2010-05-11	19498	\N	97571	\N	\N
101058	GENERIC_DAY	1	0	2010-04-24	19498	\N	97571	\N	\N
101059	GENERIC_DAY	1	0	2010-04-26	19496	\N	97571	\N	\N
101060	GENERIC_DAY	1	1	2010-05-17	19494	\N	97571	\N	\N
101061	GENERIC_DAY	1	1	2010-04-27	1328	\N	97571	\N	\N
101062	GENERIC_DAY	1	0	2010-05-03	1326	\N	97571	\N	\N
101063	GENERIC_DAY	1	0	2010-05-04	19496	\N	97571	\N	\N
101064	GENERIC_DAY	1	0	2010-04-17	1326	\N	97571	\N	\N
101065	GENERIC_DAY	1	0	2010-05-06	1324	\N	97571	\N	\N
101066	GENERIC_DAY	1	0	2010-04-24	1330	\N	97571	\N	\N
101067	GENERIC_DAY	1	1	2010-05-06	2728	\N	97571	\N	\N
101068	GENERIC_DAY	1	0	2010-04-28	1324	\N	97571	\N	\N
101069	GENERIC_DAY	1	0	2010-05-15	1332	\N	97571	\N	\N
101070	GENERIC_DAY	1	0	2010-04-14	1330	\N	97571	\N	\N
101071	GENERIC_DAY	1	0	2010-05-11	61308	\N	97571	\N	\N
101072	GENERIC_DAY	1	0	2010-05-04	1330	\N	97571	\N	\N
101073	GENERIC_DAY	1	0	2010-04-14	1316	\N	97571	\N	\N
101074	GENERIC_DAY	1	0	2010-04-20	85043	\N	97571	\N	\N
101075	GENERIC_DAY	1	1	2010-04-15	19494	\N	97571	\N	\N
101076	GENERIC_DAY	1	0	2010-05-01	40199	\N	97571	\N	\N
101077	GENERIC_DAY	1	0	2010-04-14	1326	\N	97571	\N	\N
101078	GENERIC_DAY	1	0	2010-05-07	1326	\N	97571	\N	\N
101079	GENERIC_DAY	1	0	2010-05-15	40199	\N	97571	\N	\N
101080	GENERIC_DAY	1	0	2010-05-13	19498	\N	97571	\N	\N
101081	GENERIC_DAY	1	0	2010-04-21	1330	\N	97571	\N	\N
101082	GENERIC_DAY	1	0	2010-04-22	40199	\N	97571	\N	\N
101083	GENERIC_DAY	1	0	2010-05-14	19494	\N	97571	\N	\N
101084	GENERIC_DAY	1	1	2010-04-23	40199	\N	97571	\N	\N
101085	GENERIC_DAY	1	0	2010-04-24	1318	\N	97571	\N	\N
101086	GENERIC_DAY	1	1	2010-05-10	2728	\N	97571	\N	\N
101087	GENERIC_DAY	1	0	2010-05-16	2728	\N	97571	\N	\N
101088	GENERIC_DAY	1	0	2010-04-28	1326	\N	97571	\N	\N
101089	GENERIC_DAY	1	1	2010-04-19	1328	\N	97571	\N	\N
101090	GENERIC_DAY	1	0	2010-05-07	19498	\N	97571	\N	\N
101091	GENERIC_DAY	1	0	2010-04-25	85043	\N	97571	\N	\N
101092	GENERIC_DAY	1	0	2010-04-29	1314	\N	97571	\N	\N
101093	GENERIC_DAY	1	0	2010-05-02	1322	\N	97571	\N	\N
101094	GENERIC_DAY	1	1	2010-04-16	40199	\N	97571	\N	\N
101095	GENERIC_DAY	1	0	2010-05-16	19498	\N	97571	\N	\N
101096	GENERIC_DAY	1	0	2010-04-13	1318	\N	97571	\N	\N
101097	GENERIC_DAY	1	0	2010-04-17	19498	\N	97571	\N	\N
101098	GENERIC_DAY	1	0	2010-05-10	1324	\N	97571	\N	\N
101099	GENERIC_DAY	1	0	2010-05-17	1320	\N	97571	\N	\N
101100	GENERIC_DAY	1	0	2010-05-08	1330	\N	97571	\N	\N
101101	GENERIC_DAY	1	0	2010-05-03	50401	\N	97571	\N	\N
101102	GENERIC_DAY	1	0	2010-05-08	1314	\N	97571	\N	\N
101103	GENERIC_DAY	1	1	2010-04-30	85043	\N	97571	\N	\N
101104	GENERIC_DAY	1	0	2010-05-09	61308	\N	97571	\N	\N
101105	GENERIC_DAY	1	0	2010-05-08	1320	\N	97571	\N	\N
101106	GENERIC_DAY	1	0	2010-04-27	19496	\N	97571	\N	\N
101107	GENERIC_DAY	1	0	2010-05-15	1326	\N	97571	\N	\N
101108	GENERIC_DAY	1	0	2010-04-18	19494	\N	97571	\N	\N
101109	GENERIC_DAY	1	0	2010-04-16	1324	\N	97571	\N	\N
101110	GENERIC_DAY	1	0	2010-05-12	19498	\N	97571	\N	\N
101111	GENERIC_DAY	1	0	2010-05-10	1318	\N	97571	\N	\N
101112	GENERIC_DAY	1	0	2010-04-17	19500	\N	97571	\N	\N
101113	GENERIC_DAY	1	0	2010-04-29	1332	\N	97571	\N	\N
101114	GENERIC_DAY	1	0	2010-05-12	85043	\N	97571	\N	\N
101115	GENERIC_DAY	1	0	2010-04-23	1330	\N	97571	\N	\N
101116	GENERIC_DAY	1	0	2010-04-25	1322	\N	97571	\N	\N
101117	GENERIC_DAY	1	0	2010-04-21	19498	\N	97571	\N	\N
101118	GENERIC_DAY	1	0	2010-04-28	19496	\N	97571	\N	\N
101119	GENERIC_DAY	1	0	2010-04-20	1320	\N	97571	\N	\N
101120	GENERIC_DAY	1	0	2010-04-29	1326	\N	97571	\N	\N
101121	GENERIC_DAY	1	0	2010-05-01	61308	\N	97571	\N	\N
101122	GENERIC_DAY	1	0	2010-04-24	19500	\N	97571	\N	\N
101123	GENERIC_DAY	1	0	2010-05-16	1318	\N	97571	\N	\N
101124	GENERIC_DAY	1	0	2010-04-30	1324	\N	97571	\N	\N
101125	GENERIC_DAY	1	0	2010-04-24	61308	\N	97571	\N	\N
101126	GENERIC_DAY	1	0	2010-04-20	40199	\N	97571	\N	\N
101127	GENERIC_DAY	1	1	2010-04-21	2728	\N	97571	\N	\N
101128	GENERIC_DAY	1	0	2010-04-23	1326	\N	97571	\N	\N
101129	GENERIC_DAY	1	1	2010-04-20	1322	\N	97571	\N	\N
101130	GENERIC_DAY	1	0	2010-05-04	61308	\N	97571	\N	\N
101131	GENERIC_DAY	1	0	2010-04-30	1328	\N	97571	\N	\N
101132	GENERIC_DAY	1	0	2010-04-29	61308	\N	97571	\N	\N
101133	GENERIC_DAY	1	0	2010-05-02	19500	\N	97571	\N	\N
101134	GENERIC_DAY	1	0	2010-04-20	1326	\N	97571	\N	\N
101135	GENERIC_DAY	1	0	2010-04-19	61308	\N	97571	\N	\N
101136	GENERIC_DAY	1	0	2010-04-26	1332	\N	97571	\N	\N
101137	GENERIC_DAY	1	0	2010-05-15	1328	\N	97571	\N	\N
101138	GENERIC_DAY	1	0	2010-04-19	1332	\N	97571	\N	\N
101139	GENERIC_DAY	1	1	2010-04-29	1328	\N	97571	\N	\N
101140	GENERIC_DAY	1	0	2010-04-22	19500	\N	97571	\N	\N
101141	GENERIC_DAY	1	0	2010-04-19	1318	\N	97571	\N	\N
101142	GENERIC_DAY	1	0	2010-05-17	19500	\N	97571	\N	\N
101143	GENERIC_DAY	1	0	2010-04-24	40199	\N	97571	\N	\N
101144	GENERIC_DAY	1	0	2010-04-18	1332	\N	97571	\N	\N
101145	GENERIC_DAY	1	1	2010-04-19	1322	\N	97571	\N	\N
101146	GENERIC_DAY	1	0	2010-05-01	19500	\N	97571	\N	\N
101147	GENERIC_DAY	1	0	2010-05-12	1318	\N	97571	\N	\N
101148	GENERIC_DAY	1	0	2010-04-22	1314	\N	97571	\N	\N
101149	GENERIC_DAY	1	0	2010-05-15	85043	\N	97571	\N	\N
101150	GENERIC_DAY	1	0	2010-04-20	19498	\N	97571	\N	\N
101151	GENERIC_DAY	1	0	2010-05-07	1320	\N	97571	\N	\N
101152	GENERIC_DAY	1	0	2010-04-16	1318	\N	97571	\N	\N
101153	GENERIC_DAY	1	0	2010-04-24	19496	\N	97571	\N	\N
101154	GENERIC_DAY	1	0	2010-05-02	1320	\N	97571	\N	\N
101155	GENERIC_DAY	1	0	2010-05-15	1320	\N	97571	\N	\N
101156	GENERIC_DAY	1	0	2010-04-15	1318	\N	97571	\N	\N
101157	GENERIC_DAY	1	0	2010-04-15	19496	\N	97571	\N	\N
101158	GENERIC_DAY	1	0	2010-04-24	1316	\N	97571	\N	\N
101159	GENERIC_DAY	1	0	2010-05-12	19500	\N	97571	\N	\N
101160	GENERIC_DAY	1	0	2010-04-28	40199	\N	97571	\N	\N
101161	GENERIC_DAY	1	0	2010-05-12	1314	\N	97571	\N	\N
101162	GENERIC_DAY	1	0	2010-05-08	1324	\N	97571	\N	\N
101163	GENERIC_DAY	1	0	2010-05-15	1314	\N	97571	\N	\N
101164	GENERIC_DAY	1	1	2010-05-07	50401	\N	97571	\N	\N
101165	GENERIC_DAY	1	0	2010-05-02	2728	\N	97571	\N	\N
101166	GENERIC_DAY	1	0	2010-04-27	1332	\N	97571	\N	\N
101167	GENERIC_DAY	1	0	2010-05-17	50401	\N	97571	\N	\N
101168	GENERIC_DAY	1	0	2010-05-02	1330	\N	97571	\N	\N
101169	GENERIC_DAY	1	0	2010-05-02	1318	\N	97571	\N	\N
101170	GENERIC_DAY	1	0	2010-05-07	1324	\N	97571	\N	\N
101171	GENERIC_DAY	1	0	2010-05-17	1330	\N	97571	\N	\N
101172	GENERIC_DAY	1	0	2010-04-29	1318	\N	97571	\N	\N
101173	GENERIC_DAY	1	0	2010-04-25	19500	\N	97571	\N	\N
101174	GENERIC_DAY	1	0	2010-05-13	1318	\N	97571	\N	\N
101175	GENERIC_DAY	1	0	2010-04-22	61308	\N	97571	\N	\N
101176	GENERIC_DAY	1	0	2010-04-13	1332	\N	97571	\N	\N
101177	GENERIC_DAY	1	0	2010-05-03	40199	\N	97571	\N	\N
101178	GENERIC_DAY	1	0	2010-05-16	1322	\N	97571	\N	\N
101179	GENERIC_DAY	1	0	2010-04-27	19498	\N	97571	\N	\N
101180	GENERIC_DAY	1	1	2010-04-30	1316	\N	97571	\N	\N
101181	GENERIC_DAY	1	0	2010-04-26	85043	\N	97571	\N	\N
101182	GENERIC_DAY	1	0	2010-04-21	61308	\N	97571	\N	\N
101183	GENERIC_DAY	1	0	2010-04-25	1318	\N	97571	\N	\N
101184	GENERIC_DAY	1	0	2010-04-18	1330	\N	97571	\N	\N
101185	GENERIC_DAY	1	0	2010-04-25	1320	\N	97571	\N	\N
101186	GENERIC_DAY	1	0	2010-05-05	1318	\N	97571	\N	\N
101187	GENERIC_DAY	1	0	2010-04-19	19500	\N	97571	\N	\N
101188	GENERIC_DAY	1	0	2010-05-03	19498	\N	97571	\N	\N
101189	GENERIC_DAY	1	0	2010-04-15	1330	\N	97571	\N	\N
101190	GENERIC_DAY	1	0	2010-05-05	19498	\N	97571	\N	\N
101191	GENERIC_DAY	1	0	2010-04-13	50401	\N	97571	\N	\N
101192	GENERIC_DAY	1	1	2010-05-14	1316	\N	97571	\N	\N
101193	GENERIC_DAY	1	0	2010-05-16	19494	\N	97571	\N	\N
101194	GENERIC_DAY	1	0	2010-04-15	50401	\N	97571	\N	\N
101195	GENERIC_DAY	1	0	2010-04-18	61308	\N	97571	\N	\N
101196	GENERIC_DAY	1	0	2010-04-26	1316	\N	97571	\N	\N
101197	GENERIC_DAY	1	0	2010-04-24	1326	\N	97571	\N	\N
101198	GENERIC_DAY	1	0	2010-04-29	19500	\N	97571	\N	\N
101199	GENERIC_DAY	1	0	2010-05-07	1318	\N	97571	\N	\N
101200	GENERIC_DAY	1	0	2010-05-02	1316	\N	97571	\N	\N
101201	GENERIC_DAY	1	1	2010-05-07	61308	\N	97571	\N	\N
101202	GENERIC_DAY	1	0	2010-04-17	1324	\N	97571	\N	\N
101203	GENERIC_DAY	1	0	2010-05-16	1324	\N	97571	\N	\N
101204	GENERIC_DAY	1	0	2010-04-25	19496	\N	97571	\N	\N
101205	GENERIC_DAY	1	0	2010-05-17	1318	\N	97571	\N	\N
101206	GENERIC_DAY	1	0	2010-04-20	61308	\N	97571	\N	\N
101207	GENERIC_DAY	1	0	2010-04-26	40199	\N	97571	\N	\N
101208	GENERIC_DAY	1	0	2010-05-09	1322	\N	97571	\N	\N
101209	GENERIC_DAY	1	0	2010-04-27	1314	\N	97571	\N	\N
101210	GENERIC_DAY	1	0	2010-04-19	50401	\N	97571	\N	\N
101211	GENERIC_DAY	1	0	2010-04-22	1332	\N	97571	\N	\N
101212	GENERIC_DAY	1	0	2010-04-25	1332	\N	97571	\N	\N
101213	GENERIC_DAY	1	0	2010-05-06	19500	\N	97571	\N	\N
101214	GENERIC_DAY	1	0	2010-05-09	2728	\N	97571	\N	\N
101215	GENERIC_DAY	1	1	2010-04-15	2728	\N	97571	\N	\N
101216	GENERIC_DAY	1	0	2010-04-29	1320	\N	97571	\N	\N
101217	GENERIC_DAY	1	0	2010-05-03	85043	\N	97571	\N	\N
101218	GENERIC_DAY	1	0	2010-04-21	1324	\N	97571	\N	\N
101219	GENERIC_DAY	1	0	2010-05-09	1328	\N	97571	\N	\N
101220	GENERIC_DAY	1	0	2010-05-13	50401	\N	97571	\N	\N
101221	GENERIC_DAY	1	0	2010-04-30	19494	\N	97571	\N	\N
101222	GENERIC_DAY	1	0	2010-04-16	1320	\N	97571	\N	\N
101223	GENERIC_DAY	1	1	2010-05-04	19494	\N	97571	\N	\N
101224	GENERIC_DAY	1	0	2010-05-08	19500	\N	97571	\N	\N
100776	GENERIC_DAY	1	0	2010-05-04	1314	\N	97571	\N	\N
100777	GENERIC_DAY	1	1	2010-04-14	1328	\N	97571	\N	\N
100778	GENERIC_DAY	1	0	2010-05-15	2728	\N	97571	\N	\N
100779	GENERIC_DAY	1	0	2010-05-08	85043	\N	97571	\N	\N
100780	GENERIC_DAY	1	0	2010-04-15	19500	\N	97571	\N	\N
100781	GENERIC_DAY	1	0	2010-04-19	1330	\N	97571	\N	\N
100782	GENERIC_DAY	1	0	2010-04-16	1322	\N	97571	\N	\N
100783	GENERIC_DAY	1	0	2010-04-19	1324	\N	97571	\N	\N
100784	GENERIC_DAY	1	0	2010-04-26	1326	\N	97571	\N	\N
100785	GENERIC_DAY	1	0	2010-05-14	1322	\N	97571	\N	\N
100786	GENERIC_DAY	1	1	2010-05-13	1322	\N	97571	\N	\N
100787	GENERIC_DAY	1	0	2010-05-10	85043	\N	97571	\N	\N
100788	GENERIC_DAY	1	0	2010-04-14	1314	\N	97571	\N	\N
100789	GENERIC_DAY	1	0	2010-04-22	1318	\N	97571	\N	\N
100790	GENERIC_DAY	1	1	2010-04-28	1328	\N	97571	\N	\N
100791	GENERIC_DAY	1	1	2010-05-07	40199	\N	97571	\N	\N
100792	GENERIC_DAY	1	0	2010-05-04	1318	\N	97571	\N	\N
100793	GENERIC_DAY	1	0	2010-04-30	1326	\N	97571	\N	\N
100794	GENERIC_DAY	1	0	2010-04-29	19496	\N	97571	\N	\N
100795	GENERIC_DAY	1	0	2010-05-13	61308	\N	97571	\N	\N
100796	GENERIC_DAY	1	0	2010-04-16	19494	\N	97571	\N	\N
100797	GENERIC_DAY	1	1	2010-04-19	2728	\N	97571	\N	\N
100798	GENERIC_DAY	1	0	2010-05-02	61308	\N	97571	\N	\N
100799	GENERIC_DAY	1	0	2010-04-23	19498	\N	97571	\N	\N
100800	GENERIC_DAY	1	0	2010-04-30	19496	\N	97571	\N	\N
100801	GENERIC_DAY	1	0	2010-04-26	1324	\N	97571	\N	\N
100802	GENERIC_DAY	1	1	2010-04-13	1322	\N	97571	\N	\N
100803	GENERIC_DAY	1	0	2010-05-09	1330	\N	97571	\N	\N
100804	GENERIC_DAY	1	1	2010-04-22	19494	\N	97571	\N	\N
100805	GENERIC_DAY	1	0	2010-05-10	19500	\N	97571	\N	\N
101225	GENERIC_DAY	1	0	2010-04-22	19496	\N	97571	\N	\N
101226	GENERIC_DAY	1	0	2010-05-14	50401	\N	97571	\N	\N
101227	GENERIC_DAY	1	0	2010-05-08	61308	\N	97571	\N	\N
101228	GENERIC_DAY	1	0	2010-04-16	1314	\N	97571	\N	\N
101229	GENERIC_DAY	1	1	2010-05-12	19496	\N	97571	\N	\N
101230	GENERIC_DAY	1	1	2010-04-28	19494	\N	97571	\N	\N
101231	GENERIC_DAY	1	1	2010-04-22	1322	\N	97571	\N	\N
101232	GENERIC_DAY	1	0	2010-05-07	19494	\N	97571	\N	\N
101233	GENERIC_DAY	1	0	2010-05-11	1318	\N	97571	\N	\N
101234	GENERIC_DAY	1	1	2010-04-20	2728	\N	97571	\N	\N
101235	GENERIC_DAY	1	0	2010-05-10	1314	\N	97571	\N	\N
101236	GENERIC_DAY	1	0	2010-04-17	1330	\N	97571	\N	\N
101237	GENERIC_DAY	1	0	2010-04-24	85043	\N	97571	\N	\N
101238	GENERIC_DAY	1	0	2010-05-16	1316	\N	97571	\N	\N
101239	GENERIC_DAY	1	0	2010-05-14	1326	\N	97571	\N	\N
101240	GENERIC_DAY	1	0	2010-05-04	1332	\N	97571	\N	\N
101241	GENERIC_DAY	1	1	2010-05-04	2728	\N	97571	\N	\N
101242	GENERIC_DAY	1	0	2010-04-16	1330	\N	97571	\N	\N
101243	GENERIC_DAY	1	0	2010-04-16	1328	\N	97571	\N	\N
101244	GENERIC_DAY	1	0	2010-05-04	19500	\N	97571	\N	\N
101245	GENERIC_DAY	1	0	2010-05-12	40199	\N	97571	\N	\N
101246	GENERIC_DAY	1	0	2010-04-28	1318	\N	97571	\N	\N
101247	GENERIC_DAY	1	0	2010-04-30	19498	\N	97571	\N	\N
101248	GENERIC_DAY	1	0	2010-04-21	1316	\N	97571	\N	\N
101249	GENERIC_DAY	1	0	2010-04-25	19494	\N	97571	\N	\N
101250	GENERIC_DAY	1	0	2010-04-22	1326	\N	97571	\N	\N
101251	GENERIC_DAY	1	0	2010-04-23	19494	\N	97571	\N	\N
101252	GENERIC_DAY	1	0	2010-05-01	1318	\N	97571	\N	\N
101253	GENERIC_DAY	1	0	2010-05-09	1314	\N	97571	\N	\N
101254	GENERIC_DAY	1	0	2010-05-08	1328	\N	97571	\N	\N
101255	GENERIC_DAY	1	0	2010-05-14	19500	\N	97571	\N	\N
101256	GENERIC_DAY	1	0	2010-05-10	1316	\N	97571	\N	\N
101257	GENERIC_DAY	1	0	2010-05-16	61308	\N	97571	\N	\N
101258	GENERIC_DAY	1	1	2010-05-11	1322	\N	97571	\N	\N
101259	GENERIC_DAY	1	1	2010-05-05	1322	\N	97571	\N	\N
101260	GENERIC_DAY	1	1	2010-04-30	40199	\N	97571	\N	\N
101261	GENERIC_DAY	1	1	2010-04-30	61308	\N	97571	\N	\N
102637	GENERIC_DAY	0	1	2010-04-15	19494	\N	97573	\N	\N
102638	GENERIC_DAY	0	0	2010-05-02	1320	\N	97573	\N	\N
102639	GENERIC_DAY	0	0	2010-04-13	1320	\N	97573	\N	\N
102640	GENERIC_DAY	0	0	2010-05-12	1314	\N	97573	\N	\N
102641	GENERIC_DAY	0	0	2010-04-27	1322	\N	97573	\N	\N
102642	GENERIC_DAY	0	0	2010-04-26	1324	\N	97573	\N	\N
102643	GENERIC_DAY	0	0	2010-05-10	1320	\N	97573	\N	\N
102644	GENERIC_DAY	0	0	2010-05-15	40199	\N	97573	\N	\N
102645	GENERIC_DAY	0	0	2010-04-23	1314	\N	97573	\N	\N
102646	GENERIC_DAY	0	1	2010-04-30	40199	\N	97573	\N	\N
102647	GENERIC_DAY	0	0	2010-04-27	1326	\N	97573	\N	\N
102648	GENERIC_DAY	0	0	2010-05-10	1314	\N	97573	\N	\N
102649	GENERIC_DAY	0	0	2010-04-30	19498	\N	97573	\N	\N
102650	GENERIC_DAY	0	0	2010-05-12	19500	\N	97573	\N	\N
102651	GENERIC_DAY	0	0	2010-04-19	19498	\N	97573	\N	\N
102652	GENERIC_DAY	0	0	2010-04-24	19496	\N	97573	\N	\N
102653	GENERIC_DAY	0	0	2010-05-02	1322	\N	97573	\N	\N
102654	GENERIC_DAY	0	0	2010-05-07	1314	\N	97573	\N	\N
102655	GENERIC_DAY	0	0	2010-04-23	1330	\N	97573	\N	\N
102656	GENERIC_DAY	0	1	2010-04-14	40199	\N	97573	\N	\N
102657	GENERIC_DAY	0	0	2010-04-24	1322	\N	97573	\N	\N
102658	GENERIC_DAY	0	0	2010-05-15	19498	\N	97573	\N	\N
102659	GENERIC_DAY	0	0	2010-04-24	1318	\N	97573	\N	\N
102660	GENERIC_DAY	0	0	2010-05-01	1320	\N	97573	\N	\N
102661	GENERIC_DAY	0	0	2010-05-09	85043	\N	97573	\N	\N
102662	GENERIC_DAY	0	0	2010-04-27	1314	\N	97573	\N	\N
102663	GENERIC_DAY	0	0	2010-05-01	1314	\N	97573	\N	\N
102664	GENERIC_DAY	0	1	2010-04-26	40199	\N	97573	\N	\N
102665	GENERIC_DAY	0	0	2010-04-15	1316	\N	97573	\N	\N
102666	GENERIC_DAY	0	0	2010-04-29	1322	\N	97573	\N	\N
102667	GENERIC_DAY	0	0	2010-04-14	1316	\N	97573	\N	\N
102668	GENERIC_DAY	0	0	2010-04-24	1326	\N	97573	\N	\N
102669	GENERIC_DAY	0	0	2010-05-11	1330	\N	97573	\N	\N
102670	GENERIC_DAY	0	0	2010-04-30	1324	\N	97573	\N	\N
102671	GENERIC_DAY	0	0	2010-05-05	19498	\N	97573	\N	\N
102672	GENERIC_DAY	0	0	2010-04-20	1324	\N	97573	\N	\N
102673	GENERIC_DAY	0	0	2010-05-15	19496	\N	97573	\N	\N
102674	GENERIC_DAY	0	0	2010-04-27	19498	\N	97573	\N	\N
102675	GENERIC_DAY	0	0	2010-04-28	1324	\N	97573	\N	\N
102676	GENERIC_DAY	0	0	2010-05-01	19498	\N	97573	\N	\N
102677	GENERIC_DAY	0	1	2010-04-27	61308	\N	97573	\N	\N
102678	GENERIC_DAY	0	0	2010-04-23	2728	\N	97573	\N	\N
102679	GENERIC_DAY	0	0	2010-04-25	1316	\N	97573	\N	\N
102680	GENERIC_DAY	0	0	2010-05-10	19496	\N	97573	\N	\N
102681	GENERIC_DAY	0	0	2010-05-15	85043	\N	97573	\N	\N
102682	GENERIC_DAY	0	0	2010-04-26	1314	\N	97573	\N	\N
102683	GENERIC_DAY	0	0	2010-04-26	1316	\N	97573	\N	\N
102684	GENERIC_DAY	0	0	2010-05-02	1330	\N	97573	\N	\N
102685	GENERIC_DAY	0	1	2010-04-27	19494	\N	97573	\N	\N
102686	GENERIC_DAY	0	0	2010-04-17	19500	\N	97573	\N	\N
106446	GENERIC_DAY	0	1	2010-07-23	50401	\N	97575	\N	\N
106447	GENERIC_DAY	0	0	2010-06-24	19500	\N	97575	\N	\N
106448	GENERIC_DAY	0	0	2010-05-08	1320	\N	97575	\N	\N
106449	GENERIC_DAY	0	0	2010-07-29	1322	\N	97575	\N	\N
106450	GENERIC_DAY	0	0	2010-06-09	50401	\N	97575	\N	\N
106451	GENERIC_DAY	0	0	2010-09-04	40199	\N	97575	\N	\N
106452	GENERIC_DAY	0	1	2010-09-08	1316	\N	97575	\N	\N
106453	GENERIC_DAY	0	0	2010-07-25	1320	\N	97575	\N	\N
106454	GENERIC_DAY	0	0	2010-07-17	1318	\N	97575	\N	\N
106455	GENERIC_DAY	0	0	2010-05-28	19500	\N	97575	\N	\N
106456	GENERIC_DAY	0	0	2010-06-20	1314	\N	97575	\N	\N
106457	GENERIC_DAY	0	0	2010-09-02	1316	\N	97575	\N	\N
106458	GENERIC_DAY	0	0	2010-05-23	19498	\N	97575	\N	\N
106459	GENERIC_DAY	0	0	2010-09-16	61308	\N	97575	\N	\N
106460	GENERIC_DAY	0	0	2010-07-13	19498	\N	97575	\N	\N
106461	GENERIC_DAY	0	1	2010-06-14	2728	\N	97575	\N	\N
106462	GENERIC_DAY	0	0	2010-08-08	1320	\N	97575	\N	\N
106463	GENERIC_DAY	0	2	2010-05-18	1322	\N	97575	\N	\N
106464	GENERIC_DAY	0	0	2010-08-16	1332	\N	97575	\N	\N
106465	GENERIC_DAY	0	0	2010-07-06	1322	\N	97575	\N	\N
106466	GENERIC_DAY	0	0	2010-06-06	19498	\N	97575	\N	\N
106467	GENERIC_DAY	0	0	2010-10-09	1322	\N	97575	\N	\N
106468	GENERIC_DAY	0	0	2010-08-17	1326	\N	97575	\N	\N
106469	GENERIC_DAY	0	0	2010-08-27	1324	\N	97575	\N	\N
106470	GENERIC_DAY	0	2	2010-09-10	40199	\N	97575	\N	\N
106471	GENERIC_DAY	0	0	2010-09-16	1326	\N	97575	\N	\N
106472	GENERIC_DAY	0	0	2010-09-26	1318	\N	97575	\N	\N
106473	GENERIC_DAY	0	0	2010-06-02	1316	\N	97575	\N	\N
106474	GENERIC_DAY	0	1	2010-08-16	2728	\N	97575	\N	\N
106475	GENERIC_DAY	0	0	2010-07-08	40199	\N	97575	\N	\N
106476	GENERIC_DAY	0	0	2010-06-06	61308	\N	97575	\N	\N
106477	GENERIC_DAY	0	0	2010-06-09	1326	\N	97575	\N	\N
106478	GENERIC_DAY	0	2	2010-08-09	19496	\N	97575	\N	\N
106479	GENERIC_DAY	0	1	2010-07-09	50401	\N	97575	\N	\N
106480	GENERIC_DAY	0	1	2010-08-18	1324	\N	97575	\N	\N
106481	GENERIC_DAY	0	0	2010-08-07	1314	\N	97575	\N	\N
106482	GENERIC_DAY	0	1	2010-09-27	1318	\N	97575	\N	\N
106483	GENERIC_DAY	0	0	2010-09-03	1330	\N	97575	\N	\N
106484	GENERIC_DAY	0	0	2010-06-27	1330	\N	97575	\N	\N
106485	GENERIC_DAY	0	1	2010-05-03	2728	\N	97575	\N	\N
106486	GENERIC_DAY	0	1	2010-05-28	50401	\N	97575	\N	\N
106487	GENERIC_DAY	0	0	2010-08-05	61308	\N	97575	\N	\N
106488	GENERIC_DAY	0	0	2010-05-02	2728	\N	97575	\N	\N
106489	GENERIC_DAY	0	0	2010-06-03	1314	\N	97575	\N	\N
106490	GENERIC_DAY	0	0	2010-06-27	1324	\N	97575	\N	\N
106491	GENERIC_DAY	0	0	2010-10-03	19496	\N	97575	\N	\N
106492	GENERIC_DAY	0	0	2010-08-11	1322	\N	97575	\N	\N
106493	GENERIC_DAY	0	0	2010-10-16	1322	\N	97575	\N	\N
106494	GENERIC_DAY	0	0	2010-09-08	1330	\N	97575	\N	\N
106495	GENERIC_DAY	0	2	2010-07-23	61308	\N	97575	\N	\N
106496	GENERIC_DAY	0	1	2010-10-18	1318	\N	97575	\N	\N
106497	GENERIC_DAY	0	0	2010-06-09	19500	\N	97575	\N	\N
106498	GENERIC_DAY	0	1	2010-08-30	2728	\N	97575	\N	\N
106499	GENERIC_DAY	0	0	2010-06-12	19498	\N	97575	\N	\N
106500	GENERIC_DAY	0	0	2010-08-31	1316	\N	97575	\N	\N
106501	GENERIC_DAY	0	1	2010-06-10	19494	\N	97575	\N	\N
106502	GENERIC_DAY	0	0	2010-06-11	1314	\N	97575	\N	\N
106503	GENERIC_DAY	0	0	2010-09-11	1314	\N	97575	\N	\N
106504	GENERIC_DAY	0	0	2010-07-06	1320	\N	97575	\N	\N
106505	GENERIC_DAY	0	0	2010-06-11	1330	\N	97575	\N	\N
106506	GENERIC_DAY	0	1	2010-08-16	19494	\N	97575	\N	\N
106507	GENERIC_DAY	0	0	2010-05-13	19500	\N	97575	\N	\N
106508	GENERIC_DAY	0	0	2010-07-22	19498	\N	97575	\N	\N
106509	GENERIC_DAY	0	0	2010-09-19	19496	\N	97575	\N	\N
106510	GENERIC_DAY	0	0	2010-10-12	1316	\N	97575	\N	\N
106511	GENERIC_DAY	0	0	2010-06-13	19500	\N	97575	\N	\N
106512	GENERIC_DAY	0	0	2010-10-17	2728	\N	97575	\N	\N
106513	GENERIC_DAY	0	0	2010-07-30	1324	\N	97575	\N	\N
106514	GENERIC_DAY	0	0	2010-05-27	61308	\N	97575	\N	\N
106515	GENERIC_DAY	0	1	2010-06-22	1332	\N	97575	\N	\N
106516	GENERIC_DAY	0	0	2010-06-14	85043	\N	97575	\N	\N
106517	GENERIC_DAY	0	0	2010-05-20	1326	\N	97575	\N	\N
106518	GENERIC_DAY	0	0	2010-05-16	1324	\N	97575	\N	\N
106519	GENERIC_DAY	0	0	2010-09-04	1324	\N	97575	\N	\N
106520	GENERIC_DAY	0	0	2010-09-07	1330	\N	97575	\N	\N
106521	GENERIC_DAY	0	0	2010-10-18	1332	\N	97575	\N	\N
106522	GENERIC_DAY	0	0	2010-09-10	19500	\N	97575	\N	\N
106523	GENERIC_DAY	0	0	2010-05-31	61308	\N	97575	\N	\N
106524	GENERIC_DAY	0	0	2010-07-22	1328	\N	97575	\N	\N
106525	GENERIC_DAY	0	0	2010-07-31	2728	\N	97575	\N	\N
106526	GENERIC_DAY	0	1	2010-06-17	1328	\N	97575	\N	\N
106527	GENERIC_DAY	0	1	2010-09-02	1314	\N	97575	\N	\N
106528	GENERIC_DAY	0	0	2010-08-27	1328	\N	97575	\N	\N
106529	GENERIC_DAY	0	0	2010-06-30	1330	\N	97575	\N	\N
106530	GENERIC_DAY	0	1	2010-08-10	19494	\N	97575	\N	\N
106531	GENERIC_DAY	0	0	2010-08-08	19496	\N	97575	\N	\N
106532	GENERIC_DAY	0	0	2010-09-02	19498	\N	97575	\N	\N
106533	GENERIC_DAY	0	0	2010-05-21	1332	\N	97575	\N	\N
106534	GENERIC_DAY	0	2	2010-07-01	1314	\N	97575	\N	\N
106535	GENERIC_DAY	0	1	2010-07-22	1318	\N	97575	\N	\N
106536	GENERIC_DAY	0	0	2010-06-10	40199	\N	97575	\N	\N
106537	GENERIC_DAY	0	2	2010-09-24	40199	\N	97575	\N	\N
106538	GENERIC_DAY	0	1	2010-05-07	85043	\N	97575	\N	\N
106539	GENERIC_DAY	0	0	2010-08-14	2728	\N	97575	\N	\N
106540	GENERIC_DAY	0	1	2010-05-26	19494	\N	97575	\N	\N
106541	GENERIC_DAY	0	1	2010-09-23	19494	\N	97575	\N	\N
106542	GENERIC_DAY	0	1	2010-09-01	1318	\N	97575	\N	\N
106543	GENERIC_DAY	0	0	2010-05-27	1324	\N	97575	\N	\N
106544	GENERIC_DAY	0	1	2010-07-19	1324	\N	97575	\N	\N
106545	GENERIC_DAY	0	0	2010-09-27	1316	\N	97575	\N	\N
106546	GENERIC_DAY	0	0	2010-06-21	1318	\N	97575	\N	\N
106547	GENERIC_DAY	0	0	2010-09-13	1326	\N	97575	\N	\N
106548	GENERIC_DAY	0	0	2010-05-29	1332	\N	97575	\N	\N
106549	GENERIC_DAY	0	0	2010-08-06	1322	\N	97575	\N	\N
106550	GENERIC_DAY	0	0	2010-10-04	1326	\N	97575	\N	\N
106551	GENERIC_DAY	0	1	2010-06-08	1328	\N	97575	\N	\N
106552	GENERIC_DAY	0	0	2010-08-15	1318	\N	97575	\N	\N
106553	GENERIC_DAY	0	1	2010-08-05	1318	\N	97575	\N	\N
106554	GENERIC_DAY	0	0	2010-09-30	1328	\N	97575	\N	\N
106555	GENERIC_DAY	0	0	2010-10-04	61308	\N	97575	\N	\N
106556	GENERIC_DAY	0	0	2010-09-15	1316	\N	97575	\N	\N
106557	GENERIC_DAY	0	0	2010-08-21	1326	\N	97575	\N	\N
106558	GENERIC_DAY	0	0	2010-09-13	19500	\N	97575	\N	\N
106559	GENERIC_DAY	0	0	2010-07-18	1332	\N	97575	\N	\N
106560	GENERIC_DAY	0	0	2010-06-09	1314	\N	97575	\N	\N
106561	GENERIC_DAY	0	0	2010-07-10	19494	\N	97575	\N	\N
106562	GENERIC_DAY	0	0	2010-05-01	1322	\N	97575	\N	\N
106563	GENERIC_DAY	0	0	2010-06-17	1320	\N	97575	\N	\N
106564	GENERIC_DAY	0	0	2010-08-11	1316	\N	97575	\N	\N
106565	GENERIC_DAY	0	0	2010-10-16	1328	\N	97575	\N	\N
106566	GENERIC_DAY	0	1	2010-07-27	1318	\N	97575	\N	\N
106567	GENERIC_DAY	0	0	2010-09-17	2728	\N	97575	\N	\N
106568	GENERIC_DAY	0	0	2010-05-06	1330	\N	97575	\N	\N
106569	GENERIC_DAY	0	0	2010-10-02	1314	\N	97575	\N	\N
106570	GENERIC_DAY	0	0	2010-08-21	85043	\N	97575	\N	\N
106571	GENERIC_DAY	0	0	2010-06-19	19494	\N	97575	\N	\N
106572	GENERIC_DAY	0	0	2010-05-07	19496	\N	97575	\N	\N
106573	GENERIC_DAY	0	0	2010-07-27	1330	\N	97575	\N	\N
106574	GENERIC_DAY	0	0	2010-06-05	61308	\N	97575	\N	\N
106575	GENERIC_DAY	0	1	2010-10-20	1316	\N	97575	\N	\N
106576	GENERIC_DAY	0	0	2010-10-15	19498	\N	97575	\N	\N
106577	GENERIC_DAY	0	0	2010-06-01	1316	\N	97575	\N	\N
106578	GENERIC_DAY	0	0	2010-06-05	2728	\N	97575	\N	\N
106579	GENERIC_DAY	0	0	2010-09-19	19498	\N	97575	\N	\N
106580	GENERIC_DAY	0	0	2010-07-01	1330	\N	97575	\N	\N
106581	GENERIC_DAY	0	0	2010-06-22	1326	\N	97575	\N	\N
106582	GENERIC_DAY	0	0	2010-10-07	19500	\N	97575	\N	\N
106583	GENERIC_DAY	0	0	2010-08-29	1314	\N	97575	\N	\N
106584	GENERIC_DAY	0	0	2010-08-10	1322	\N	97575	\N	\N
106585	GENERIC_DAY	0	0	2010-07-28	50401	\N	97575	\N	\N
106586	GENERIC_DAY	0	2	2010-09-01	1322	\N	97575	\N	\N
106587	GENERIC_DAY	0	0	2010-10-01	1318	\N	97575	\N	\N
106588	GENERIC_DAY	0	0	2010-05-03	1326	\N	97575	\N	\N
106589	GENERIC_DAY	0	0	2010-09-22	40199	\N	97575	\N	\N
106590	GENERIC_DAY	0	0	2010-07-10	1324	\N	97575	\N	\N
106591	GENERIC_DAY	0	0	2010-09-12	50401	\N	97575	\N	\N
106592	GENERIC_DAY	0	0	2010-06-10	1314	\N	97575	\N	\N
106593	GENERIC_DAY	0	0	2010-07-04	2728	\N	97575	\N	\N
106594	GENERIC_DAY	0	0	2010-10-07	19498	\N	97575	\N	\N
106595	GENERIC_DAY	0	1	2010-05-05	50401	\N	97575	\N	\N
106596	GENERIC_DAY	0	0	2010-05-08	2728	\N	97575	\N	\N
106597	GENERIC_DAY	0	0	2010-05-30	40199	\N	97575	\N	\N
106598	GENERIC_DAY	0	0	2010-06-08	19500	\N	97575	\N	\N
106599	GENERIC_DAY	0	0	2010-06-20	85043	\N	97575	\N	\N
106600	GENERIC_DAY	0	0	2010-10-09	19498	\N	97575	\N	\N
106601	GENERIC_DAY	0	0	2010-06-07	1320	\N	97575	\N	\N
106602	GENERIC_DAY	0	0	2010-08-24	19498	\N	97575	\N	\N
106603	GENERIC_DAY	0	0	2010-07-16	1322	\N	97575	\N	\N
106604	GENERIC_DAY	0	0	2010-09-06	1316	\N	97575	\N	\N
106605	GENERIC_DAY	0	0	2010-06-18	1314	\N	97575	\N	\N
106606	GENERIC_DAY	0	0	2010-06-03	40199	\N	97575	\N	\N
106607	GENERIC_DAY	0	0	2010-09-09	85043	\N	97575	\N	\N
106608	GENERIC_DAY	0	0	2010-08-04	19500	\N	97575	\N	\N
106609	GENERIC_DAY	0	0	2010-08-21	1332	\N	97575	\N	\N
106610	GENERIC_DAY	0	2	2010-07-02	1316	\N	97575	\N	\N
106611	GENERIC_DAY	0	1	2010-08-30	1318	\N	97575	\N	\N
106612	GENERIC_DAY	0	0	2010-07-18	1330	\N	97575	\N	\N
106613	GENERIC_DAY	0	0	2010-09-09	19500	\N	97575	\N	\N
106614	GENERIC_DAY	0	0	2010-07-07	19498	\N	97575	\N	\N
106615	GENERIC_DAY	0	0	2010-06-24	40199	\N	97575	\N	\N
106616	GENERIC_DAY	0	0	2010-10-09	1314	\N	97575	\N	\N
106617	GENERIC_DAY	0	0	2010-05-15	50401	\N	97575	\N	\N
106618	GENERIC_DAY	0	0	2010-07-18	19494	\N	97575	\N	\N
106619	GENERIC_DAY	0	1	2010-06-17	19496	\N	97575	\N	\N
106620	GENERIC_DAY	0	1	2010-06-11	50401	\N	97575	\N	\N
106621	GENERIC_DAY	0	0	2010-08-07	61308	\N	97575	\N	\N
106622	GENERIC_DAY	0	0	2010-05-16	19498	\N	97575	\N	\N
106623	GENERIC_DAY	0	2	2010-09-07	1322	\N	97575	\N	\N
106624	GENERIC_DAY	0	0	2010-10-17	85043	\N	97575	\N	\N
106625	GENERIC_DAY	0	0	2010-06-20	19494	\N	97575	\N	\N
106626	GENERIC_DAY	0	0	2010-09-09	1328	\N	97575	\N	\N
106627	GENERIC_DAY	0	1	2010-09-20	19496	\N	97575	\N	\N
106628	GENERIC_DAY	0	0	2010-05-23	1316	\N	97575	\N	\N
106629	GENERIC_DAY	0	0	2010-06-10	1330	\N	97575	\N	\N
106630	GENERIC_DAY	0	0	2010-09-05	19498	\N	97575	\N	\N
106631	GENERIC_DAY	0	0	2010-10-17	61308	\N	97575	\N	\N
106632	GENERIC_DAY	0	0	2010-07-03	19496	\N	97575	\N	\N
106633	GENERIC_DAY	0	0	2010-07-07	61308	\N	97575	\N	\N
106634	GENERIC_DAY	0	0	2010-08-01	19496	\N	97575	\N	\N
106635	GENERIC_DAY	0	0	2010-07-03	1326	\N	97575	\N	\N
106636	GENERIC_DAY	0	0	2010-08-07	1326	\N	97575	\N	\N
106637	GENERIC_DAY	0	0	2010-05-19	1320	\N	97575	\N	\N
106638	GENERIC_DAY	0	0	2010-06-22	61308	\N	97575	\N	\N
106639	GENERIC_DAY	0	0	2010-06-25	2728	\N	97575	\N	\N
106640	GENERIC_DAY	0	0	2010-08-14	19496	\N	97575	\N	\N
106641	GENERIC_DAY	0	0	2010-06-05	1332	\N	97575	\N	\N
106642	GENERIC_DAY	0	0	2010-07-24	40199	\N	97575	\N	\N
106643	GENERIC_DAY	0	0	2010-09-17	1332	\N	97575	\N	\N
106644	GENERIC_DAY	0	0	2010-06-27	1316	\N	97575	\N	\N
106645	GENERIC_DAY	0	0	2010-10-01	1324	\N	97575	\N	\N
106646	GENERIC_DAY	0	1	2010-07-13	2728	\N	97575	\N	\N
106647	GENERIC_DAY	0	0	2010-08-25	19498	\N	97575	\N	\N
106648	GENERIC_DAY	0	0	2010-08-24	61308	\N	97575	\N	\N
106649	GENERIC_DAY	0	0	2010-06-15	1330	\N	97575	\N	\N
106650	GENERIC_DAY	0	0	2010-10-14	1320	\N	97575	\N	\N
106651	GENERIC_DAY	0	0	2010-08-21	50401	\N	97575	\N	\N
106652	GENERIC_DAY	0	0	2010-09-05	1314	\N	97575	\N	\N
106653	GENERIC_DAY	0	0	2010-05-12	1326	\N	97575	\N	\N
106654	GENERIC_DAY	0	1	2010-08-03	2728	\N	97575	\N	\N
106655	GENERIC_DAY	0	0	2010-09-28	61308	\N	97575	\N	\N
106656	GENERIC_DAY	0	0	2010-07-02	1326	\N	97575	\N	\N
106657	GENERIC_DAY	0	1	2010-05-06	1332	\N	97575	\N	\N
106658	GENERIC_DAY	0	0	2010-07-27	50401	\N	97575	\N	\N
106659	GENERIC_DAY	0	0	2010-06-08	19498	\N	97575	\N	\N
106660	GENERIC_DAY	0	0	2010-08-07	1318	\N	97575	\N	\N
106661	GENERIC_DAY	0	2	2010-06-16	1322	\N	97575	\N	\N
106662	GENERIC_DAY	0	0	2010-05-01	40199	\N	97575	\N	\N
106663	GENERIC_DAY	0	0	2010-05-24	1326	\N	97575	\N	\N
106664	GENERIC_DAY	0	0	2010-10-19	19498	\N	97575	\N	\N
106665	GENERIC_DAY	0	0	2010-05-01	1326	\N	97575	\N	\N
106666	GENERIC_DAY	0	1	2010-10-07	19494	\N	97575	\N	\N
106667	GENERIC_DAY	0	0	2010-10-03	50401	\N	97575	\N	\N
106668	GENERIC_DAY	0	0	2010-07-06	19498	\N	97575	\N	\N
106669	GENERIC_DAY	0	0	2010-07-03	1332	\N	97575	\N	\N
106670	GENERIC_DAY	0	0	2010-10-04	85043	\N	97575	\N	\N
106671	GENERIC_DAY	0	0	2010-09-06	50401	\N	97575	\N	\N
106672	GENERIC_DAY	0	1	2010-07-07	2728	\N	97575	\N	\N
106673	GENERIC_DAY	0	0	2010-06-12	19494	\N	97575	\N	\N
106674	GENERIC_DAY	0	0	2010-08-03	19498	\N	97575	\N	\N
106675	GENERIC_DAY	0	0	2010-07-05	85043	\N	97575	\N	\N
106676	GENERIC_DAY	0	0	2010-08-06	1318	\N	97575	\N	\N
106677	GENERIC_DAY	0	0	2010-06-24	19498	\N	97575	\N	\N
106678	GENERIC_DAY	0	0	2010-07-06	61308	\N	97575	\N	\N
106679	GENERIC_DAY	0	0	2010-06-29	1320	\N	97575	\N	\N
106680	GENERIC_DAY	0	0	2010-07-19	1316	\N	97575	\N	\N
106681	GENERIC_DAY	0	0	2010-05-27	1314	\N	97575	\N	\N
106682	GENERIC_DAY	0	0	2010-09-10	1314	\N	97575	\N	\N
106683	GENERIC_DAY	0	0	2010-05-21	19494	\N	97575	\N	\N
106684	GENERIC_DAY	0	0	2010-07-06	1330	\N	97575	\N	\N
106685	GENERIC_DAY	0	0	2010-04-29	61308	\N	97575	\N	\N
106686	GENERIC_DAY	0	0	2010-08-31	1328	\N	97575	\N	\N
106687	GENERIC_DAY	0	0	2010-07-04	1314	\N	97575	\N	\N
106688	GENERIC_DAY	0	0	2010-06-16	19500	\N	97575	\N	\N
106689	GENERIC_DAY	0	0	2010-09-11	19494	\N	97575	\N	\N
106690	GENERIC_DAY	0	2	2010-09-13	1322	\N	97575	\N	\N
106691	GENERIC_DAY	0	0	2010-08-28	1332	\N	97575	\N	\N
106692	GENERIC_DAY	0	0	2010-07-09	1320	\N	97575	\N	\N
106693	GENERIC_DAY	0	0	2010-09-21	1332	\N	97575	\N	\N
106694	GENERIC_DAY	0	0	2010-06-10	61308	\N	97575	\N	\N
106695	GENERIC_DAY	0	1	2010-06-01	2728	\N	97575	\N	\N
106696	GENERIC_DAY	0	1	2010-09-16	19494	\N	97575	\N	\N
106697	GENERIC_DAY	0	0	2010-07-19	50401	\N	97575	\N	\N
106698	GENERIC_DAY	0	0	2010-09-21	85043	\N	97575	\N	\N
106699	GENERIC_DAY	0	0	2010-07-17	19494	\N	97575	\N	\N
106700	GENERIC_DAY	0	1	2010-05-05	1328	\N	97575	\N	\N
106701	GENERIC_DAY	0	0	2010-08-13	19500	\N	97575	\N	\N
106702	GENERIC_DAY	0	2	2010-05-19	19496	\N	97575	\N	\N
106703	GENERIC_DAY	0	2	2010-08-10	1314	\N	97575	\N	\N
106704	GENERIC_DAY	0	2	2010-06-01	1322	\N	97575	\N	\N
106705	GENERIC_DAY	0	1	2010-05-20	1328	\N	97575	\N	\N
106706	GENERIC_DAY	0	0	2010-08-08	61308	\N	97575	\N	\N
106707	GENERIC_DAY	0	0	2010-05-23	1326	\N	97575	\N	\N
106708	GENERIC_DAY	0	0	2010-08-27	1314	\N	97575	\N	\N
106709	GENERIC_DAY	0	0	2010-07-18	1318	\N	97575	\N	\N
106710	GENERIC_DAY	0	2	2010-05-27	19496	\N	97575	\N	\N
106711	GENERIC_DAY	0	2	2010-08-06	61308	\N	97575	\N	\N
106712	GENERIC_DAY	0	0	2010-10-13	1316	\N	97575	\N	\N
106713	GENERIC_DAY	0	0	2010-08-15	1322	\N	97575	\N	\N
106714	GENERIC_DAY	0	0	2010-10-19	50401	\N	97575	\N	\N
106715	GENERIC_DAY	0	0	2010-09-28	1316	\N	97575	\N	\N
106716	GENERIC_DAY	0	0	2010-06-21	1326	\N	97575	\N	\N
106717	GENERIC_DAY	0	0	2010-08-28	2728	\N	97575	\N	\N
106718	GENERIC_DAY	0	0	2010-10-02	19494	\N	97575	\N	\N
106719	GENERIC_DAY	0	0	2010-09-25	50401	\N	97575	\N	\N
106720	GENERIC_DAY	0	0	2010-07-01	19500	\N	97575	\N	\N
106721	GENERIC_DAY	0	0	2010-10-07	1328	\N	97575	\N	\N
106722	GENERIC_DAY	0	0	2010-07-11	1330	\N	97575	\N	\N
106723	GENERIC_DAY	0	0	2010-09-18	1316	\N	97575	\N	\N
106724	GENERIC_DAY	0	0	2010-05-30	1322	\N	97575	\N	\N
106725	GENERIC_DAY	0	0	2010-09-16	1320	\N	97575	\N	\N
106726	GENERIC_DAY	0	0	2010-05-15	1326	\N	97575	\N	\N
106727	GENERIC_DAY	0	1	2010-05-26	1332	\N	97575	\N	\N
106728	GENERIC_DAY	0	1	2010-08-18	2728	\N	97575	\N	\N
106729	GENERIC_DAY	0	0	2010-07-02	19494	\N	97575	\N	\N
106730	GENERIC_DAY	0	0	2010-08-14	19500	\N	97575	\N	\N
106731	GENERIC_DAY	0	0	2010-05-11	1314	\N	97575	\N	\N
106732	GENERIC_DAY	0	0	2010-05-23	1318	\N	97575	\N	\N
106733	GENERIC_DAY	0	2	2010-08-23	1314	\N	97575	\N	\N
106734	GENERIC_DAY	0	0	2010-09-09	1320	\N	97575	\N	\N
106735	GENERIC_DAY	0	2	2010-05-20	19496	\N	97575	\N	\N
106736	GENERIC_DAY	0	0	2010-08-01	1318	\N	97575	\N	\N
106737	GENERIC_DAY	0	0	2010-10-10	40199	\N	97575	\N	\N
106738	GENERIC_DAY	0	0	2010-06-18	19496	\N	97575	\N	\N
106739	GENERIC_DAY	0	1	2010-05-04	40199	\N	97575	\N	\N
106740	GENERIC_DAY	0	0	2010-07-30	1330	\N	97575	\N	\N
106741	GENERIC_DAY	0	0	2010-08-16	1316	\N	97575	\N	\N
106742	GENERIC_DAY	0	0	2010-09-17	1324	\N	97575	\N	\N
106743	GENERIC_DAY	0	0	2010-06-22	1320	\N	97575	\N	\N
106744	GENERIC_DAY	0	0	2010-05-04	19498	\N	97575	\N	\N
106745	GENERIC_DAY	0	0	2010-08-18	1330	\N	97575	\N	\N
106746	GENERIC_DAY	0	0	2010-05-22	1318	\N	97575	\N	\N
106747	GENERIC_DAY	0	0	2010-09-07	40199	\N	97575	\N	\N
106748	GENERIC_DAY	0	0	2010-05-02	40199	\N	97575	\N	\N
106749	GENERIC_DAY	0	0	2010-07-31	1322	\N	97575	\N	\N
106750	GENERIC_DAY	0	0	2010-07-16	19498	\N	97575	\N	\N
106751	GENERIC_DAY	0	0	2010-10-20	85043	\N	97575	\N	\N
106752	GENERIC_DAY	0	1	2010-04-30	40199	\N	97575	\N	\N
106753	GENERIC_DAY	0	2	2010-06-01	19496	\N	97575	\N	\N
106754	GENERIC_DAY	0	1	2010-06-07	1328	\N	97575	\N	\N
106755	GENERIC_DAY	0	0	2010-06-19	50401	\N	97575	\N	\N
106756	GENERIC_DAY	0	0	2010-08-29	85043	\N	97575	\N	\N
106757	GENERIC_DAY	0	1	2010-06-15	19494	\N	97575	\N	\N
106758	GENERIC_DAY	0	0	2010-09-11	85043	\N	97575	\N	\N
106759	GENERIC_DAY	0	0	2010-07-31	19496	\N	97575	\N	\N
106760	GENERIC_DAY	0	0	2010-06-24	50401	\N	97575	\N	\N
106761	GENERIC_DAY	0	0	2010-09-10	1326	\N	97575	\N	\N
106762	GENERIC_DAY	0	0	2010-10-12	61308	\N	97575	\N	\N
106763	GENERIC_DAY	0	0	2010-08-26	1328	\N	97575	\N	\N
106764	GENERIC_DAY	0	0	2010-10-12	40199	\N	97575	\N	\N
106765	GENERIC_DAY	0	0	2010-08-29	19496	\N	97575	\N	\N
106766	GENERIC_DAY	0	0	2010-10-16	1332	\N	97575	\N	\N
106767	GENERIC_DAY	0	0	2010-08-29	1332	\N	97575	\N	\N
106768	GENERIC_DAY	0	0	2010-09-12	19494	\N	97575	\N	\N
106769	GENERIC_DAY	0	0	2010-10-17	1326	\N	97575	\N	\N
106770	GENERIC_DAY	0	0	2010-08-02	85043	\N	97575	\N	\N
106771	GENERIC_DAY	0	2	2010-08-12	19496	\N	97575	\N	\N
106772	GENERIC_DAY	0	0	2010-09-07	1316	\N	97575	\N	\N
106773	GENERIC_DAY	0	0	2010-08-08	1316	\N	97575	\N	\N
106774	GENERIC_DAY	0	0	2010-06-15	1318	\N	97575	\N	\N
106775	GENERIC_DAY	0	1	2010-09-16	1318	\N	97575	\N	\N
106776	GENERIC_DAY	0	0	2010-06-28	1322	\N	97575	\N	\N
106777	GENERIC_DAY	0	0	2010-09-15	61308	\N	97575	\N	\N
106778	GENERIC_DAY	0	0	2010-05-26	40199	\N	97575	\N	\N
106779	GENERIC_DAY	0	0	2010-09-05	1318	\N	97575	\N	\N
106780	GENERIC_DAY	0	0	2010-08-11	19498	\N	97575	\N	\N
106781	GENERIC_DAY	0	0	2010-07-28	1316	\N	97575	\N	\N
106782	GENERIC_DAY	0	0	2010-07-17	19498	\N	97575	\N	\N
106783	GENERIC_DAY	0	0	2010-09-11	19500	\N	97575	\N	\N
106784	GENERIC_DAY	0	0	2010-07-14	19500	\N	97575	\N	\N
106785	GENERIC_DAY	0	1	2010-08-26	19494	\N	97575	\N	\N
106786	GENERIC_DAY	0	0	2010-10-16	61308	\N	97575	\N	\N
106787	GENERIC_DAY	0	1	2010-08-11	2728	\N	97575	\N	\N
106788	GENERIC_DAY	0	0	2010-08-15	1324	\N	97575	\N	\N
106789	GENERIC_DAY	0	0	2010-09-27	1332	\N	97575	\N	\N
106790	GENERIC_DAY	0	0	2010-07-26	19500	\N	97575	\N	\N
106791	GENERIC_DAY	0	0	2010-08-02	1330	\N	97575	\N	\N
106792	GENERIC_DAY	0	0	2010-06-25	19494	\N	97575	\N	\N
106793	GENERIC_DAY	0	2	2010-06-03	19496	\N	97575	\N	\N
106794	GENERIC_DAY	0	0	2010-07-06	50401	\N	97575	\N	\N
106795	GENERIC_DAY	0	0	2010-06-04	1322	\N	97575	\N	\N
106796	GENERIC_DAY	0	0	2010-05-29	1316	\N	97575	\N	\N
106797	GENERIC_DAY	0	0	2010-07-01	1316	\N	97575	\N	\N
106798	GENERIC_DAY	0	0	2010-05-06	1314	\N	97575	\N	\N
106799	GENERIC_DAY	0	2	2010-10-08	1316	\N	97575	\N	\N
106800	GENERIC_DAY	0	1	2010-10-05	1324	\N	97575	\N	\N
106801	GENERIC_DAY	0	0	2010-07-15	19500	\N	97575	\N	\N
106802	GENERIC_DAY	0	0	2010-05-17	19500	\N	97575	\N	\N
106803	GENERIC_DAY	0	0	2010-06-08	1316	\N	97575	\N	\N
106804	GENERIC_DAY	0	0	2010-06-08	1324	\N	97575	\N	\N
106805	GENERIC_DAY	0	1	2010-07-14	1332	\N	97575	\N	\N
106806	GENERIC_DAY	0	2	2010-07-23	40199	\N	97575	\N	\N
106807	GENERIC_DAY	0	0	2010-08-29	19500	\N	97575	\N	\N
106808	GENERIC_DAY	0	1	2010-09-09	1314	\N	97575	\N	\N
106809	GENERIC_DAY	0	1	2010-10-06	2728	\N	97575	\N	\N
106810	GENERIC_DAY	0	0	2010-10-01	19496	\N	97575	\N	\N
106811	GENERIC_DAY	0	0	2010-06-13	1332	\N	97575	\N	\N
106812	GENERIC_DAY	0	1	2010-09-10	50401	\N	97575	\N	\N
106813	GENERIC_DAY	0	0	2010-05-25	1318	\N	97575	\N	\N
106814	GENERIC_DAY	0	0	2010-08-18	1328	\N	97575	\N	\N
106815	GENERIC_DAY	0	1	2010-09-01	19496	\N	97575	\N	\N
106816	GENERIC_DAY	0	2	2010-06-30	1314	\N	97575	\N	\N
106817	GENERIC_DAY	0	0	2010-08-17	1332	\N	97575	\N	\N
106818	GENERIC_DAY	0	0	2010-09-09	1326	\N	97575	\N	\N
106819	GENERIC_DAY	0	2	2010-10-07	1322	\N	97575	\N	\N
106820	GENERIC_DAY	0	2	2010-07-22	1314	\N	97575	\N	\N
106821	GENERIC_DAY	0	0	2010-07-29	1330	\N	97575	\N	\N
106822	GENERIC_DAY	0	0	2010-07-23	1314	\N	97575	\N	\N
106823	GENERIC_DAY	0	1	2010-06-24	1328	\N	97575	\N	\N
106824	GENERIC_DAY	0	0	2010-06-30	1316	\N	97575	\N	\N
106825	GENERIC_DAY	0	0	2010-09-30	61308	\N	97575	\N	\N
106826	GENERIC_DAY	0	0	2010-07-22	1326	\N	97575	\N	\N
106827	GENERIC_DAY	0	1	2010-08-23	1318	\N	97575	\N	\N
106828	GENERIC_DAY	0	0	2010-06-15	61308	\N	97575	\N	\N
106829	GENERIC_DAY	0	0	2010-05-06	1326	\N	97575	\N	\N
106830	GENERIC_DAY	0	0	2010-05-29	85043	\N	97575	\N	\N
106831	GENERIC_DAY	0	1	2010-10-15	85043	\N	97575	\N	\N
106832	GENERIC_DAY	0	0	2010-06-07	1314	\N	97575	\N	\N
106833	GENERIC_DAY	0	0	2010-05-01	1320	\N	97575	\N	\N
106834	GENERIC_DAY	0	0	2010-08-07	50401	\N	97575	\N	\N
106835	GENERIC_DAY	0	0	2010-06-29	61308	\N	97575	\N	\N
106836	GENERIC_DAY	0	0	2010-06-10	1324	\N	97575	\N	\N
106837	GENERIC_DAY	0	1	2010-05-17	50401	\N	97575	\N	\N
106838	GENERIC_DAY	0	0	2010-05-29	1320	\N	97575	\N	\N
106839	GENERIC_DAY	0	1	2010-07-19	2728	\N	97575	\N	\N
106840	GENERIC_DAY	0	0	2010-07-10	19500	\N	97575	\N	\N
106841	GENERIC_DAY	0	1	2010-05-20	1332	\N	97575	\N	\N
106842	GENERIC_DAY	0	0	2010-05-23	19496	\N	97575	\N	\N
106843	GENERIC_DAY	0	0	2010-08-19	1320	\N	97575	\N	\N
106844	GENERIC_DAY	0	0	2010-06-15	19500	\N	97575	\N	\N
106845	GENERIC_DAY	0	0	2010-07-11	19500	\N	97575	\N	\N
106846	GENERIC_DAY	0	0	2010-08-27	1320	\N	97575	\N	\N
106847	GENERIC_DAY	0	0	2010-08-21	19500	\N	97575	\N	\N
106848	GENERIC_DAY	0	0	2010-08-16	40199	\N	97575	\N	\N
106849	GENERIC_DAY	0	0	2010-06-04	1318	\N	97575	\N	\N
106850	GENERIC_DAY	0	1	2010-08-12	2728	\N	97575	\N	\N
106851	GENERIC_DAY	0	0	2010-07-20	19498	\N	97575	\N	\N
106852	GENERIC_DAY	0	1	2010-07-29	2728	\N	97575	\N	\N
106853	GENERIC_DAY	0	2	2010-07-09	61308	\N	97575	\N	\N
106854	GENERIC_DAY	0	0	2010-06-08	50401	\N	97575	\N	\N
106855	GENERIC_DAY	0	0	2010-06-12	50401	\N	97575	\N	\N
106856	GENERIC_DAY	0	1	2010-09-09	1318	\N	97575	\N	\N
106857	GENERIC_DAY	0	0	2010-06-25	1314	\N	97575	\N	\N
106858	GENERIC_DAY	0	0	2010-10-10	1330	\N	97575	\N	\N
106859	GENERIC_DAY	0	0	2010-06-22	40199	\N	97575	\N	\N
106860	GENERIC_DAY	0	0	2010-08-16	19500	\N	97575	\N	\N
106861	GENERIC_DAY	0	2	2010-06-02	19496	\N	97575	\N	\N
106862	GENERIC_DAY	0	2	2010-09-21	1322	\N	97575	\N	\N
106863	GENERIC_DAY	0	0	2010-05-06	19496	\N	97575	\N	\N
106864	GENERIC_DAY	0	0	2010-05-27	1330	\N	97575	\N	\N
106865	GENERIC_DAY	0	0	2010-07-25	1328	\N	97575	\N	\N
106866	GENERIC_DAY	0	0	2010-07-13	85043	\N	97575	\N	\N
106867	GENERIC_DAY	0	0	2010-05-09	85043	\N	97575	\N	\N
106868	GENERIC_DAY	0	0	2010-06-20	1328	\N	97575	\N	\N
106869	GENERIC_DAY	0	0	2010-05-28	1326	\N	97575	\N	\N
106870	GENERIC_DAY	0	0	2010-05-30	1328	\N	97575	\N	\N
106871	GENERIC_DAY	0	1	2010-08-03	19494	\N	97575	\N	\N
106872	GENERIC_DAY	0	1	2010-07-07	1332	\N	97575	\N	\N
106873	GENERIC_DAY	0	0	2010-06-30	19500	\N	97575	\N	\N
106874	GENERIC_DAY	0	0	2010-05-23	1330	\N	97575	\N	\N
106875	GENERIC_DAY	0	1	2010-07-15	1318	\N	97575	\N	\N
106876	GENERIC_DAY	0	0	2010-07-16	2728	\N	97575	\N	\N
106877	GENERIC_DAY	0	0	2010-10-07	1330	\N	97575	\N	\N
106878	GENERIC_DAY	0	0	2010-07-25	19498	\N	97575	\N	\N
106879	GENERIC_DAY	0	0	2010-08-28	1324	\N	97575	\N	\N
106880	GENERIC_DAY	0	1	2010-09-27	1324	\N	97575	\N	\N
106881	GENERIC_DAY	0	0	2010-05-25	40199	\N	97575	\N	\N
106882	GENERIC_DAY	0	1	2010-06-18	50401	\N	97575	\N	\N
106883	GENERIC_DAY	0	1	2010-05-17	1328	\N	97575	\N	\N
106884	GENERIC_DAY	0	1	2010-06-21	1328	\N	97575	\N	\N
106885	GENERIC_DAY	0	0	2010-08-03	50401	\N	97575	\N	\N
106886	GENERIC_DAY	0	1	2010-07-22	19494	\N	97575	\N	\N
106887	GENERIC_DAY	0	1	2010-06-03	1332	\N	97575	\N	\N
106888	GENERIC_DAY	0	1	2010-05-12	50401	\N	97575	\N	\N
106889	GENERIC_DAY	0	0	2010-09-04	19498	\N	97575	\N	\N
106890	GENERIC_DAY	0	0	2010-05-21	1318	\N	97575	\N	\N
106891	GENERIC_DAY	0	0	2010-05-29	2728	\N	97575	\N	\N
106892	GENERIC_DAY	0	0	2010-05-05	19496	\N	97575	\N	\N
106893	GENERIC_DAY	0	0	2010-06-06	2728	\N	97575	\N	\N
106894	GENERIC_DAY	0	0	2010-06-12	85043	\N	97575	\N	\N
106895	GENERIC_DAY	0	0	2010-06-06	19496	\N	97575	\N	\N
106896	GENERIC_DAY	0	0	2010-10-12	85043	\N	97575	\N	\N
106897	GENERIC_DAY	0	0	2010-07-11	40199	\N	97575	\N	\N
106898	GENERIC_DAY	0	0	2010-07-24	1314	\N	97575	\N	\N
106899	GENERIC_DAY	0	1	2010-09-07	2728	\N	97575	\N	\N
106900	GENERIC_DAY	0	0	2010-10-10	1320	\N	97575	\N	\N
106901	GENERIC_DAY	0	0	2010-09-07	61308	\N	97575	\N	\N
106902	GENERIC_DAY	0	0	2010-05-19	1330	\N	97575	\N	\N
106903	GENERIC_DAY	0	0	2010-09-26	1332	\N	97575	\N	\N
106904	GENERIC_DAY	0	0	2010-05-31	85043	\N	97575	\N	\N
106905	GENERIC_DAY	0	0	2010-08-09	1332	\N	97575	\N	\N
106906	GENERIC_DAY	0	0	2010-09-07	1326	\N	97575	\N	\N
106907	GENERIC_DAY	0	0	2010-08-05	1326	\N	97575	\N	\N
106908	GENERIC_DAY	0	0	2010-08-08	85043	\N	97575	\N	\N
106909	GENERIC_DAY	0	1	2010-06-10	1328	\N	97575	\N	\N
106910	GENERIC_DAY	0	0	2010-06-16	50401	\N	97575	\N	\N
106911	GENERIC_DAY	0	0	2010-09-28	1320	\N	97575	\N	\N
106912	GENERIC_DAY	0	0	2010-08-02	1316	\N	97575	\N	\N
106913	GENERIC_DAY	0	0	2010-09-26	1320	\N	97575	\N	\N
106914	GENERIC_DAY	0	2	2010-07-13	1314	\N	97575	\N	\N
106915	GENERIC_DAY	0	0	2010-05-30	50401	\N	97575	\N	\N
106916	GENERIC_DAY	0	0	2010-09-19	1314	\N	97575	\N	\N
106917	GENERIC_DAY	0	0	2010-09-24	1324	\N	97575	\N	\N
106918	GENERIC_DAY	0	0	2010-07-24	19498	\N	97575	\N	\N
106919	GENERIC_DAY	0	0	2010-08-04	1326	\N	97575	\N	\N
106920	GENERIC_DAY	0	1	2010-10-12	1314	\N	97575	\N	\N
106921	GENERIC_DAY	0	0	2010-07-02	1318	\N	97575	\N	\N
106922	GENERIC_DAY	0	0	2010-05-10	19498	\N	97575	\N	\N
106923	GENERIC_DAY	0	2	2010-05-21	1316	\N	97575	\N	\N
106924	GENERIC_DAY	0	0	2010-08-09	19500	\N	97575	\N	\N
106925	GENERIC_DAY	0	0	2010-05-13	19494	\N	97575	\N	\N
106926	GENERIC_DAY	0	0	2010-09-20	1316	\N	97575	\N	\N
106927	GENERIC_DAY	0	0	2010-10-08	19494	\N	97575	\N	\N
106928	GENERIC_DAY	0	0	2010-05-05	19498	\N	97575	\N	\N
106929	GENERIC_DAY	0	0	2010-10-14	85043	\N	97575	\N	\N
106930	GENERIC_DAY	0	0	2010-09-26	2728	\N	97575	\N	\N
106931	GENERIC_DAY	0	0	2010-05-19	1324	\N	97575	\N	\N
106932	GENERIC_DAY	0	2	2010-06-22	1314	\N	97575	\N	\N
106933	GENERIC_DAY	0	0	2010-09-13	19498	\N	97575	\N	\N
106934	GENERIC_DAY	0	0	2010-10-09	19496	\N	97575	\N	\N
106935	GENERIC_DAY	0	0	2010-09-24	1328	\N	97575	\N	\N
106936	GENERIC_DAY	0	0	2010-10-03	1326	\N	97575	\N	\N
106937	GENERIC_DAY	0	0	2010-07-11	2728	\N	97575	\N	\N
106938	GENERIC_DAY	0	0	2010-05-02	1324	\N	97575	\N	\N
106939	GENERIC_DAY	0	1	2010-09-21	19496	\N	97575	\N	\N
106940	GENERIC_DAY	0	1	2010-06-11	85043	\N	97575	\N	\N
106941	GENERIC_DAY	0	0	2010-05-16	1314	\N	97575	\N	\N
106942	GENERIC_DAY	0	1	2010-05-06	61308	\N	97575	\N	\N
106943	GENERIC_DAY	0	0	2010-06-09	1316	\N	97575	\N	\N
106944	GENERIC_DAY	0	1	2010-06-17	2728	\N	97575	\N	\N
106945	GENERIC_DAY	0	0	2010-05-15	19494	\N	97575	\N	\N
106946	GENERIC_DAY	0	0	2010-05-29	1328	\N	97575	\N	\N
106947	GENERIC_DAY	0	0	2010-08-18	1332	\N	97575	\N	\N
106948	GENERIC_DAY	0	2	2010-07-26	1314	\N	97575	\N	\N
106949	GENERIC_DAY	0	0	2010-10-02	1326	\N	97575	\N	\N
106950	GENERIC_DAY	0	0	2010-05-14	19498	\N	97575	\N	\N
106951	GENERIC_DAY	0	0	2010-09-26	19500	\N	97575	\N	\N
106952	GENERIC_DAY	0	0	2010-06-12	1328	\N	97575	\N	\N
106953	GENERIC_DAY	0	0	2010-10-11	1330	\N	97575	\N	\N
106954	GENERIC_DAY	0	1	2010-09-14	1318	\N	97575	\N	\N
106955	GENERIC_DAY	0	0	2010-06-10	1326	\N	97575	\N	\N
106956	GENERIC_DAY	0	0	2010-06-27	61308	\N	97575	\N	\N
106957	GENERIC_DAY	0	0	2010-06-08	40199	\N	97575	\N	\N
106958	GENERIC_DAY	0	0	2010-05-12	1318	\N	97575	\N	\N
106959	GENERIC_DAY	0	2	2010-06-18	1316	\N	97575	\N	\N
106960	GENERIC_DAY	0	0	2010-07-02	19500	\N	97575	\N	\N
106961	GENERIC_DAY	0	0	2010-06-21	1320	\N	97575	\N	\N
106962	GENERIC_DAY	0	0	2010-07-23	19498	\N	97575	\N	\N
106963	GENERIC_DAY	0	1	2010-05-06	2728	\N	97575	\N	\N
106964	GENERIC_DAY	0	0	2010-09-24	19498	\N	97575	\N	\N
106965	GENERIC_DAY	0	1	2010-10-19	1316	\N	97575	\N	\N
106966	GENERIC_DAY	0	0	2010-06-24	85043	\N	97575	\N	\N
106967	GENERIC_DAY	0	0	2010-05-21	1330	\N	97575	\N	\N
106968	GENERIC_DAY	0	0	2010-10-14	61308	\N	97575	\N	\N
106969	GENERIC_DAY	0	0	2010-08-26	85043	\N	97575	\N	\N
106970	GENERIC_DAY	0	0	2010-06-19	1322	\N	97575	\N	\N
106971	GENERIC_DAY	0	2	2010-10-14	1314	\N	97575	\N	\N
106972	GENERIC_DAY	0	0	2010-06-19	19500	\N	97575	\N	\N
106973	GENERIC_DAY	0	1	2010-09-22	19494	\N	97575	\N	\N
106974	GENERIC_DAY	0	0	2010-06-06	19500	\N	97575	\N	\N
106975	GENERIC_DAY	0	0	2010-08-09	19498	\N	97575	\N	\N
106976	GENERIC_DAY	0	1	2010-08-23	1324	\N	97575	\N	\N
106977	GENERIC_DAY	0	0	2010-09-06	1330	\N	97575	\N	\N
106978	GENERIC_DAY	0	0	2010-05-11	19498	\N	97575	\N	\N
106979	GENERIC_DAY	0	0	2010-09-12	40199	\N	97575	\N	\N
106980	GENERIC_DAY	0	1	2010-05-13	19496	\N	97575	\N	\N
106981	GENERIC_DAY	0	0	2010-07-21	85043	\N	97575	\N	\N
106982	GENERIC_DAY	0	1	2010-07-28	2728	\N	97575	\N	\N
106983	GENERIC_DAY	0	0	2010-10-14	1328	\N	97575	\N	\N
106984	GENERIC_DAY	0	0	2010-07-08	1316	\N	97575	\N	\N
106985	GENERIC_DAY	0	0	2010-07-05	1316	\N	97575	\N	\N
106986	GENERIC_DAY	0	0	2010-08-22	1326	\N	97575	\N	\N
106987	GENERIC_DAY	0	0	2010-08-08	19494	\N	97575	\N	\N
106988	GENERIC_DAY	0	0	2010-09-11	50401	\N	97575	\N	\N
106989	GENERIC_DAY	0	0	2010-07-16	1318	\N	97575	\N	\N
106990	GENERIC_DAY	0	0	2010-06-21	19500	\N	97575	\N	\N
106991	GENERIC_DAY	0	0	2010-06-10	1320	\N	97575	\N	\N
106992	GENERIC_DAY	0	0	2010-09-25	1322	\N	97575	\N	\N
106993	GENERIC_DAY	0	0	2010-06-11	19500	\N	97575	\N	\N
106994	GENERIC_DAY	0	0	2010-08-01	1326	\N	97575	\N	\N
106995	GENERIC_DAY	0	0	2010-08-16	1328	\N	97575	\N	\N
106996	GENERIC_DAY	0	0	2010-08-30	40199	\N	97575	\N	\N
106997	GENERIC_DAY	0	0	2010-07-02	1314	\N	97575	\N	\N
106998	GENERIC_DAY	0	0	2010-06-05	40199	\N	97575	\N	\N
106999	GENERIC_DAY	0	0	2010-09-15	1330	\N	97575	\N	\N
107000	GENERIC_DAY	0	0	2010-09-08	40199	\N	97575	\N	\N
107001	GENERIC_DAY	0	0	2010-07-11	1324	\N	97575	\N	\N
107002	GENERIC_DAY	0	0	2010-05-23	61308	\N	97575	\N	\N
107003	GENERIC_DAY	0	0	2010-09-06	1328	\N	97575	\N	\N
107004	GENERIC_DAY	0	0	2010-08-17	19500	\N	97575	\N	\N
107005	GENERIC_DAY	0	0	2010-09-26	19496	\N	97575	\N	\N
107006	GENERIC_DAY	0	0	2010-08-27	19500	\N	97575	\N	\N
107007	GENERIC_DAY	0	0	2010-06-18	19500	\N	97575	\N	\N
107008	GENERIC_DAY	0	0	2010-09-29	61308	\N	97575	\N	\N
107009	GENERIC_DAY	0	0	2010-06-21	50401	\N	97575	\N	\N
107010	GENERIC_DAY	0	0	2010-07-10	19496	\N	97575	\N	\N
107011	GENERIC_DAY	0	1	2010-09-13	1318	\N	97575	\N	\N
107012	GENERIC_DAY	0	0	2010-05-27	1316	\N	97575	\N	\N
107013	GENERIC_DAY	0	0	2010-09-27	1326	\N	97575	\N	\N
107014	GENERIC_DAY	0	1	2010-10-11	2728	\N	97575	\N	\N
107015	GENERIC_DAY	0	0	2010-06-09	85043	\N	97575	\N	\N
107016	GENERIC_DAY	0	0	2010-05-08	19496	\N	97575	\N	\N
107017	GENERIC_DAY	0	0	2010-07-30	1320	\N	97575	\N	\N
107018	GENERIC_DAY	0	0	2010-10-06	1320	\N	97575	\N	\N
107019	GENERIC_DAY	0	2	2010-10-01	40199	\N	97575	\N	\N
107020	GENERIC_DAY	0	0	2010-10-01	1332	\N	97575	\N	\N
107021	GENERIC_DAY	0	0	2010-09-20	85043	\N	97575	\N	\N
107022	GENERIC_DAY	0	1	2010-08-02	1324	\N	97575	\N	\N
107023	GENERIC_DAY	0	0	2010-06-02	40199	\N	97575	\N	\N
107024	GENERIC_DAY	0	0	2010-08-31	19498	\N	97575	\N	\N
107025	GENERIC_DAY	0	0	2010-08-30	61308	\N	97575	\N	\N
107026	GENERIC_DAY	0	0	2010-06-11	19494	\N	97575	\N	\N
107027	GENERIC_DAY	0	0	2010-06-01	1318	\N	97575	\N	\N
107028	GENERIC_DAY	0	0	2010-05-25	1316	\N	97575	\N	\N
107029	GENERIC_DAY	0	1	2010-08-26	1318	\N	97575	\N	\N
107030	GENERIC_DAY	0	0	2010-06-02	85043	\N	97575	\N	\N
107031	GENERIC_DAY	0	1	2010-09-30	1324	\N	97575	\N	\N
107032	GENERIC_DAY	0	1	2010-07-06	1332	\N	97575	\N	\N
107033	GENERIC_DAY	0	0	2010-06-19	1330	\N	97575	\N	\N
107034	GENERIC_DAY	0	0	2010-08-25	1322	\N	97575	\N	\N
107035	GENERIC_DAY	0	0	2010-07-08	50401	\N	97575	\N	\N
107036	GENERIC_DAY	0	0	2010-07-16	1314	\N	97575	\N	\N
107037	GENERIC_DAY	0	0	2010-07-31	19498	\N	97575	\N	\N
107038	GENERIC_DAY	0	0	2010-08-13	1332	\N	97575	\N	\N
107039	GENERIC_DAY	0	2	2010-06-04	1316	\N	97575	\N	\N
107040	GENERIC_DAY	0	0	2010-09-19	1320	\N	97575	\N	\N
107041	GENERIC_DAY	0	2	2010-10-20	2728	\N	97575	\N	\N
107042	GENERIC_DAY	0	0	2010-09-01	1316	\N	97575	\N	\N
107043	GENERIC_DAY	0	1	2010-10-13	1322	\N	97575	\N	\N
107044	GENERIC_DAY	0	0	2010-09-01	85043	\N	97575	\N	\N
107045	GENERIC_DAY	0	0	2010-09-05	1316	\N	97575	\N	\N
107046	GENERIC_DAY	0	1	2010-10-04	1318	\N	97575	\N	\N
107047	GENERIC_DAY	0	1	2010-09-13	1314	\N	97575	\N	\N
107048	GENERIC_DAY	0	2	2010-10-20	19494	\N	97575	\N	\N
107049	GENERIC_DAY	0	0	2010-07-14	61308	\N	97575	\N	\N
107050	GENERIC_DAY	0	0	2010-06-20	40199	\N	97575	\N	\N
107051	GENERIC_DAY	0	0	2010-10-16	1330	\N	97575	\N	\N
107052	GENERIC_DAY	0	0	2010-09-05	1330	\N	97575	\N	\N
107053	GENERIC_DAY	0	0	2010-10-10	1324	\N	97575	\N	\N
107054	GENERIC_DAY	0	0	2010-07-07	19500	\N	97575	\N	\N
107055	GENERIC_DAY	0	0	2010-07-19	40199	\N	97575	\N	\N
107056	GENERIC_DAY	0	2	2010-07-08	1314	\N	97575	\N	\N
107057	GENERIC_DAY	0	0	2010-06-27	1332	\N	97575	\N	\N
107058	GENERIC_DAY	0	0	2010-05-02	1320	\N	97575	\N	\N
107059	GENERIC_DAY	0	0	2010-08-04	19498	\N	97575	\N	\N
107060	GENERIC_DAY	0	0	2010-07-05	50401	\N	97575	\N	\N
107061	GENERIC_DAY	0	1	2010-07-19	19496	\N	97575	\N	\N
107062	GENERIC_DAY	0	0	2010-08-21	1324	\N	97575	\N	\N
107063	GENERIC_DAY	0	0	2010-09-14	19500	\N	97575	\N	\N
107064	GENERIC_DAY	0	0	2010-06-04	1314	\N	97575	\N	\N
107065	GENERIC_DAY	0	2	2010-10-15	40199	\N	97575	\N	\N
107066	GENERIC_DAY	0	0	2010-08-06	1328	\N	97575	\N	\N
107067	GENERIC_DAY	0	0	2010-05-01	1328	\N	97575	\N	\N
107068	GENERIC_DAY	0	0	2010-06-06	1330	\N	97575	\N	\N
107069	GENERIC_DAY	0	0	2010-08-07	19500	\N	97575	\N	\N
107070	GENERIC_DAY	0	1	2010-10-07	1318	\N	97575	\N	\N
107071	GENERIC_DAY	0	0	2010-09-19	1328	\N	97575	\N	\N
107072	GENERIC_DAY	0	0	2010-08-10	61308	\N	97575	\N	\N
107073	GENERIC_DAY	0	1	2010-10-12	2728	\N	97575	\N	\N
107074	GENERIC_DAY	0	0	2010-05-19	50401	\N	97575	\N	\N
107075	GENERIC_DAY	0	0	2010-10-16	40199	\N	97575	\N	\N
107076	GENERIC_DAY	0	0	2010-08-29	1320	\N	97575	\N	\N
107077	GENERIC_DAY	0	1	2010-07-13	19496	\N	97575	\N	\N
107078	GENERIC_DAY	0	0	2010-10-17	1332	\N	97575	\N	\N
107079	GENERIC_DAY	0	0	2010-10-01	1314	\N	97575	\N	\N
107080	GENERIC_DAY	0	1	2010-05-05	1322	\N	97575	\N	\N
107081	GENERIC_DAY	0	0	2010-10-08	1324	\N	97575	\N	\N
107082	GENERIC_DAY	0	0	2010-09-17	1328	\N	97575	\N	\N
107083	GENERIC_DAY	0	1	2010-09-23	1318	\N	97575	\N	\N
107084	GENERIC_DAY	0	0	2010-07-09	1322	\N	97575	\N	\N
107085	GENERIC_DAY	0	1	2010-07-20	2728	\N	97575	\N	\N
107086	GENERIC_DAY	0	0	2010-06-08	85043	\N	97575	\N	\N
107087	GENERIC_DAY	0	0	2010-05-28	1322	\N	97575	\N	\N
107088	GENERIC_DAY	0	0	2010-06-30	40199	\N	97575	\N	\N
107089	GENERIC_DAY	0	0	2010-08-10	85043	\N	97575	\N	\N
107090	GENERIC_DAY	0	0	2010-08-15	1328	\N	97575	\N	\N
107091	GENERIC_DAY	0	1	2010-05-24	2728	\N	97575	\N	\N
107092	GENERIC_DAY	0	2	2010-08-10	19496	\N	97575	\N	\N
107093	GENERIC_DAY	0	1	2010-05-17	19494	\N	97575	\N	\N
107094	GENERIC_DAY	0	0	2010-05-14	1330	\N	97575	\N	\N
107095	GENERIC_DAY	0	2	2010-09-17	40199	\N	97575	\N	\N
107096	GENERIC_DAY	0	0	2010-05-08	85043	\N	97575	\N	\N
107097	GENERIC_DAY	0	0	2010-09-22	50401	\N	97575	\N	\N
107098	GENERIC_DAY	0	0	2010-07-09	1332	\N	97575	\N	\N
107099	GENERIC_DAY	0	1	2010-10-13	1324	\N	97575	\N	\N
107100	GENERIC_DAY	0	0	2010-05-02	1326	\N	97575	\N	\N
107101	GENERIC_DAY	0	0	2010-08-04	1332	\N	97575	\N	\N
107102	GENERIC_DAY	0	0	2010-06-26	1318	\N	97575	\N	\N
107103	GENERIC_DAY	0	1	2010-07-21	1328	\N	97575	\N	\N
107104	GENERIC_DAY	0	0	2010-06-07	1326	\N	97575	\N	\N
107105	GENERIC_DAY	0	0	2010-06-04	1324	\N	97575	\N	\N
107106	GENERIC_DAY	0	0	2010-10-02	1324	\N	97575	\N	\N
107107	GENERIC_DAY	0	0	2010-10-03	19498	\N	97575	\N	\N
107108	GENERIC_DAY	0	1	2010-06-01	19494	\N	97575	\N	\N
107109	GENERIC_DAY	0	2	2010-08-11	19496	\N	97575	\N	\N
107110	GENERIC_DAY	0	0	2010-08-02	1328	\N	97575	\N	\N
107111	GENERIC_DAY	0	0	2010-08-08	2728	\N	97575	\N	\N
107112	GENERIC_DAY	0	0	2010-05-02	50401	\N	97575	\N	\N
107113	GENERIC_DAY	0	0	2010-05-28	1318	\N	97575	\N	\N
107114	GENERIC_DAY	0	0	2010-06-13	1322	\N	97575	\N	\N
107115	GENERIC_DAY	0	0	2010-10-03	1314	\N	97575	\N	\N
107116	GENERIC_DAY	0	0	2010-10-15	1322	\N	97575	\N	\N
107117	GENERIC_DAY	0	0	2010-07-30	19498	\N	97575	\N	\N
107118	GENERIC_DAY	0	0	2010-05-07	1326	\N	97575	\N	\N
107119	GENERIC_DAY	0	2	2010-06-30	19496	\N	97575	\N	\N
107120	GENERIC_DAY	0	0	2010-09-11	61308	\N	97575	\N	\N
107121	GENERIC_DAY	0	0	2010-06-30	1320	\N	97575	\N	\N
107122	GENERIC_DAY	0	0	2010-08-15	1314	\N	97575	\N	\N
107123	GENERIC_DAY	0	1	2010-08-24	19494	\N	97575	\N	\N
107124	GENERIC_DAY	0	0	2010-06-26	1320	\N	97575	\N	\N
107125	GENERIC_DAY	0	1	2010-09-02	19494	\N	97575	\N	\N
107126	GENERIC_DAY	0	0	2010-10-06	1332	\N	97575	\N	\N
107127	GENERIC_DAY	0	1	2010-06-17	1314	\N	97575	\N	\N
107128	GENERIC_DAY	0	0	2010-09-24	19500	\N	97575	\N	\N
107129	GENERIC_DAY	0	0	2010-07-02	19498	\N	97575	\N	\N
107130	GENERIC_DAY	0	0	2010-07-25	2728	\N	97575	\N	\N
107131	GENERIC_DAY	0	0	2010-10-05	40199	\N	97575	\N	\N
107132	GENERIC_DAY	0	0	2010-06-09	61308	\N	97575	\N	\N
107133	GENERIC_DAY	0	0	2010-05-14	2728	\N	97575	\N	\N
107134	GENERIC_DAY	0	2	2010-08-19	1314	\N	97575	\N	\N
107135	GENERIC_DAY	0	0	2010-09-26	1324	\N	97575	\N	\N
107136	GENERIC_DAY	0	0	2010-08-22	19500	\N	97575	\N	\N
107137	GENERIC_DAY	0	0	2010-06-23	1326	\N	97575	\N	\N
107138	GENERIC_DAY	0	1	2010-04-29	19494	\N	97575	\N	\N
107139	GENERIC_DAY	0	1	2010-09-23	2728	\N	97575	\N	\N
107140	GENERIC_DAY	0	0	2010-07-22	61308	\N	97575	\N	\N
107141	GENERIC_DAY	0	0	2010-09-04	1320	\N	97575	\N	\N
107142	GENERIC_DAY	0	0	2010-07-04	85043	\N	97575	\N	\N
107143	GENERIC_DAY	0	0	2010-09-19	40199	\N	97575	\N	\N
107144	GENERIC_DAY	0	1	2010-05-07	19498	\N	97575	\N	\N
107145	GENERIC_DAY	0	1	2010-08-09	1324	\N	97575	\N	\N
107146	GENERIC_DAY	0	0	2010-08-01	85043	\N	97575	\N	\N
107147	GENERIC_DAY	0	2	2010-05-31	19496	\N	97575	\N	\N
107148	GENERIC_DAY	0	0	2010-05-26	85043	\N	97575	\N	\N
107149	GENERIC_DAY	0	1	2010-09-09	19496	\N	97575	\N	\N
107150	GENERIC_DAY	0	0	2010-07-19	1332	\N	97575	\N	\N
107151	GENERIC_DAY	0	0	2010-06-23	19500	\N	97575	\N	\N
107152	GENERIC_DAY	0	0	2010-06-21	1316	\N	97575	\N	\N
107153	GENERIC_DAY	0	0	2010-08-01	1324	\N	97575	\N	\N
107154	GENERIC_DAY	0	0	2010-07-10	85043	\N	97575	\N	\N
107155	GENERIC_DAY	0	0	2010-07-23	1322	\N	97575	\N	\N
107156	GENERIC_DAY	0	0	2010-10-17	19498	\N	97575	\N	\N
107157	GENERIC_DAY	0	1	2010-06-16	1328	\N	97575	\N	\N
107158	GENERIC_DAY	0	0	2010-08-14	1322	\N	97575	\N	\N
107159	GENERIC_DAY	0	0	2010-10-09	1326	\N	97575	\N	\N
107160	GENERIC_DAY	0	0	2010-09-05	1324	\N	97575	\N	\N
107161	GENERIC_DAY	0	0	2010-09-18	19494	\N	97575	\N	\N
107162	GENERIC_DAY	0	0	2010-05-22	1324	\N	97575	\N	\N
107163	GENERIC_DAY	0	0	2010-08-01	19494	\N	97575	\N	\N
107164	GENERIC_DAY	0	1	2010-09-06	1324	\N	97575	\N	\N
107165	GENERIC_DAY	0	0	2010-07-15	85043	\N	97575	\N	\N
107166	GENERIC_DAY	0	0	2010-10-20	19500	\N	97575	\N	\N
107167	GENERIC_DAY	0	0	2010-05-08	1318	\N	97575	\N	\N
107168	GENERIC_DAY	0	0	2010-10-11	1320	\N	97575	\N	\N
107169	GENERIC_DAY	0	0	2010-06-14	19498	\N	97575	\N	\N
107170	GENERIC_DAY	0	0	2010-05-25	1326	\N	97575	\N	\N
107171	GENERIC_DAY	0	0	2010-08-01	40199	\N	97575	\N	\N
107172	GENERIC_DAY	0	0	2010-10-15	19494	\N	97575	\N	\N
107173	GENERIC_DAY	0	0	2010-07-01	85043	\N	97575	\N	\N
107174	GENERIC_DAY	0	0	2010-07-16	19496	\N	97575	\N	\N
107175	GENERIC_DAY	0	0	2010-05-30	1332	\N	97575	\N	\N
107176	GENERIC_DAY	0	1	2010-10-11	1314	\N	97575	\N	\N
107177	GENERIC_DAY	0	2	2010-07-21	1314	\N	97575	\N	\N
107178	GENERIC_DAY	0	0	2010-09-21	40199	\N	97575	\N	\N
107179	GENERIC_DAY	0	0	2010-06-13	2728	\N	97575	\N	\N
107180	GENERIC_DAY	0	0	2010-05-14	1318	\N	97575	\N	\N
107181	GENERIC_DAY	0	0	2010-08-09	1328	\N	97575	\N	\N
107182	GENERIC_DAY	0	0	2010-08-29	1326	\N	97575	\N	\N
107183	GENERIC_DAY	0	0	2010-09-24	1326	\N	97575	\N	\N
107184	GENERIC_DAY	0	0	2010-05-25	85043	\N	97575	\N	\N
107185	GENERIC_DAY	0	0	2010-07-20	1316	\N	97575	\N	\N
107186	GENERIC_DAY	0	0	2010-08-21	1322	\N	97575	\N	\N
107187	GENERIC_DAY	0	1	2010-05-07	50401	\N	97575	\N	\N
107188	GENERIC_DAY	0	0	2010-08-25	1328	\N	97575	\N	\N
107189	GENERIC_DAY	0	0	2010-09-28	50401	\N	97575	\N	\N
107190	GENERIC_DAY	0	0	2010-10-12	1320	\N	97575	\N	\N
107191	GENERIC_DAY	0	1	2010-07-12	1318	\N	97575	\N	\N
107192	GENERIC_DAY	0	0	2010-06-18	1320	\N	97575	\N	\N
107193	GENERIC_DAY	0	0	2010-07-28	1328	\N	97575	\N	\N
107194	GENERIC_DAY	0	0	2010-07-12	1320	\N	97575	\N	\N
107195	GENERIC_DAY	0	2	2010-07-28	1314	\N	97575	\N	\N
107196	GENERIC_DAY	0	1	2010-07-15	1332	\N	97575	\N	\N
107197	GENERIC_DAY	0	0	2010-07-11	85043	\N	97575	\N	\N
107198	GENERIC_DAY	0	1	2010-05-12	1316	\N	97575	\N	\N
107199	GENERIC_DAY	0	0	2010-07-26	1328	\N	97575	\N	\N
107200	GENERIC_DAY	0	0	2010-05-24	1330	\N	97575	\N	\N
107201	GENERIC_DAY	0	0	2010-07-20	1332	\N	97575	\N	\N
107202	GENERIC_DAY	0	0	2010-08-19	1332	\N	97575	\N	\N
107203	GENERIC_DAY	0	0	2010-07-30	1328	\N	97575	\N	\N
107204	GENERIC_DAY	0	0	2010-08-11	1328	\N	97575	\N	\N
107205	GENERIC_DAY	0	1	2010-07-05	2728	\N	97575	\N	\N
107206	GENERIC_DAY	0	0	2010-10-06	1330	\N	97575	\N	\N
107207	GENERIC_DAY	0	0	2010-08-06	1326	\N	97575	\N	\N
107208	GENERIC_DAY	0	2	2010-05-18	19496	\N	97575	\N	\N
107209	GENERIC_DAY	0	0	2010-08-25	1330	\N	97575	\N	\N
107210	GENERIC_DAY	0	0	2010-07-04	1330	\N	97575	\N	\N
107211	GENERIC_DAY	0	0	2010-08-30	19500	\N	97575	\N	\N
107212	GENERIC_DAY	0	0	2010-05-30	1318	\N	97575	\N	\N
107213	GENERIC_DAY	0	0	2010-10-03	1330	\N	97575	\N	\N
107214	GENERIC_DAY	0	0	2010-05-11	1324	\N	97575	\N	\N
107215	GENERIC_DAY	0	1	2010-05-17	19496	\N	97575	\N	\N
107216	GENERIC_DAY	0	1	2010-09-21	2728	\N	97575	\N	\N
107217	GENERIC_DAY	0	0	2010-07-18	1314	\N	97575	\N	\N
107218	GENERIC_DAY	0	0	2010-07-17	61308	\N	97575	\N	\N
107219	GENERIC_DAY	0	1	2010-07-19	19494	\N	97575	\N	\N
107220	GENERIC_DAY	0	0	2010-07-05	61308	\N	97575	\N	\N
107221	GENERIC_DAY	0	0	2010-06-27	19498	\N	97575	\N	\N
107222	GENERIC_DAY	0	2	2010-08-16	19496	\N	97575	\N	\N
107223	GENERIC_DAY	0	0	2010-06-06	1328	\N	97575	\N	\N
107224	GENERIC_DAY	0	0	2010-08-03	40199	\N	97575	\N	\N
107225	GENERIC_DAY	0	0	2010-05-05	85043	\N	97575	\N	\N
107226	GENERIC_DAY	0	0	2010-06-27	19500	\N	97575	\N	\N
107227	GENERIC_DAY	0	1	2010-08-04	1324	\N	97575	\N	\N
107228	GENERIC_DAY	0	0	2010-08-17	50401	\N	97575	\N	\N
107229	GENERIC_DAY	0	0	2010-06-26	1332	\N	97575	\N	\N
107230	GENERIC_DAY	0	1	2010-05-06	50401	\N	97575	\N	\N
107231	GENERIC_DAY	0	0	2010-09-19	1318	\N	97575	\N	\N
107232	GENERIC_DAY	0	0	2010-10-16	19498	\N	97575	\N	\N
107233	GENERIC_DAY	0	0	2010-07-08	19498	\N	97575	\N	\N
107234	GENERIC_DAY	0	2	2010-06-07	1322	\N	97575	\N	\N
107235	GENERIC_DAY	0	0	2010-09-07	19498	\N	97575	\N	\N
107236	GENERIC_DAY	0	0	2010-08-30	85043	\N	97575	\N	\N
107237	GENERIC_DAY	0	0	2010-08-19	40199	\N	97575	\N	\N
107238	GENERIC_DAY	0	1	2010-09-07	1318	\N	97575	\N	\N
107239	GENERIC_DAY	0	1	2010-10-19	1318	\N	97575	\N	\N
107240	GENERIC_DAY	0	1	2010-07-29	19494	\N	97575	\N	\N
107241	GENERIC_DAY	0	0	2010-07-14	85043	\N	97575	\N	\N
107242	GENERIC_DAY	0	0	2010-06-30	1318	\N	97575	\N	\N
107243	GENERIC_DAY	0	1	2010-08-17	2728	\N	97575	\N	\N
107244	GENERIC_DAY	0	1	2010-07-12	19496	\N	97575	\N	\N
107245	GENERIC_DAY	0	0	2010-05-07	1330	\N	97575	\N	\N
107246	GENERIC_DAY	0	1	2010-08-06	50401	\N	97575	\N	\N
107247	GENERIC_DAY	0	0	2010-07-18	2728	\N	97575	\N	\N
107248	GENERIC_DAY	0	0	2010-10-16	2728	\N	97575	\N	\N
107249	GENERIC_DAY	0	0	2010-07-04	40199	\N	97575	\N	\N
107250	GENERIC_DAY	0	0	2010-07-21	1316	\N	97575	\N	\N
107251	GENERIC_DAY	0	0	2010-06-08	1320	\N	97575	\N	\N
107252	GENERIC_DAY	0	1	2010-09-07	19494	\N	97575	\N	\N
107253	GENERIC_DAY	0	0	2010-05-26	50401	\N	97575	\N	\N
107254	GENERIC_DAY	0	2	2010-07-30	61308	\N	97575	\N	\N
107255	GENERIC_DAY	0	0	2010-07-01	1318	\N	97575	\N	\N
107256	GENERIC_DAY	0	0	2010-06-17	50401	\N	97575	\N	\N
107257	GENERIC_DAY	0	0	2010-07-31	19500	\N	97575	\N	\N
107258	GENERIC_DAY	0	0	2010-07-09	19494	\N	97575	\N	\N
107259	GENERIC_DAY	0	2	2010-06-04	61308	\N	97575	\N	\N
107260	GENERIC_DAY	0	1	2010-06-24	1332	\N	97575	\N	\N
107261	GENERIC_DAY	0	0	2010-06-03	1320	\N	97575	\N	\N
107262	GENERIC_DAY	0	1	2010-05-26	1328	\N	97575	\N	\N
107263	GENERIC_DAY	0	1	2010-05-04	19494	\N	97575	\N	\N
107264	GENERIC_DAY	0	0	2010-09-12	1330	\N	97575	\N	\N
107265	GENERIC_DAY	0	0	2010-10-20	19496	\N	97575	\N	\N
107266	GENERIC_DAY	0	2	2010-09-14	1322	\N	97575	\N	\N
107267	GENERIC_DAY	0	1	2010-05-10	19496	\N	97575	\N	\N
107268	GENERIC_DAY	0	0	2010-07-28	1330	\N	97575	\N	\N
107269	GENERIC_DAY	0	0	2010-09-05	19500	\N	97575	\N	\N
107270	GENERIC_DAY	0	1	2010-10-05	1314	\N	97575	\N	\N
107271	GENERIC_DAY	0	0	2010-06-18	1318	\N	97575	\N	\N
107272	GENERIC_DAY	0	0	2010-05-27	1320	\N	97575	\N	\N
107273	GENERIC_DAY	0	0	2010-08-06	1332	\N	97575	\N	\N
107274	GENERIC_DAY	0	1	2010-09-15	19494	\N	97575	\N	\N
107275	GENERIC_DAY	0	0	2010-05-02	61308	\N	97575	\N	\N
107276	GENERIC_DAY	0	0	2010-05-08	1324	\N	97575	\N	\N
107277	GENERIC_DAY	0	0	2010-08-09	61308	\N	97575	\N	\N
107278	GENERIC_DAY	0	1	2010-07-07	19494	\N	97575	\N	\N
107279	GENERIC_DAY	0	0	2010-08-31	1330	\N	97575	\N	\N
107280	GENERIC_DAY	0	0	2010-05-04	1324	\N	97575	\N	\N
107281	GENERIC_DAY	0	0	2010-10-18	1328	\N	97575	\N	\N
107282	GENERIC_DAY	0	1	2010-06-04	85043	\N	97575	\N	\N
107283	GENERIC_DAY	0	0	2010-09-13	50401	\N	97575	\N	\N
107284	GENERIC_DAY	0	0	2010-10-13	19498	\N	97575	\N	\N
107285	GENERIC_DAY	0	1	2010-07-14	19496	\N	97575	\N	\N
107286	GENERIC_DAY	0	1	2010-08-31	19496	\N	97575	\N	\N
107287	GENERIC_DAY	0	0	2010-09-04	1318	\N	97575	\N	\N
107288	GENERIC_DAY	0	0	2010-07-10	40199	\N	97575	\N	\N
107289	GENERIC_DAY	0	1	2010-05-03	61308	\N	97575	\N	\N
107290	GENERIC_DAY	0	0	2010-07-01	1326	\N	97575	\N	\N
107291	GENERIC_DAY	0	0	2010-10-15	1320	\N	97575	\N	\N
107292	GENERIC_DAY	0	0	2010-05-13	1314	\N	97575	\N	\N
107293	GENERIC_DAY	0	0	2010-09-17	1326	\N	97575	\N	\N
107294	GENERIC_DAY	0	0	2010-06-05	1330	\N	97575	\N	\N
107295	GENERIC_DAY	0	0	2010-07-15	1320	\N	97575	\N	\N
107296	GENERIC_DAY	0	0	2010-10-05	85043	\N	97575	\N	\N
107297	GENERIC_DAY	0	0	2010-06-26	19496	\N	97575	\N	\N
107298	GENERIC_DAY	0	1	2010-08-27	85043	\N	97575	\N	\N
107299	GENERIC_DAY	0	0	2010-05-27	19500	\N	97575	\N	\N
107300	GENERIC_DAY	0	2	2010-07-30	1316	\N	97575	\N	\N
107301	GENERIC_DAY	0	2	2010-09-17	1316	\N	97575	\N	\N
107302	GENERIC_DAY	0	0	2010-10-11	61308	\N	97575	\N	\N
107303	GENERIC_DAY	0	1	2010-05-10	1332	\N	97575	\N	\N
107304	GENERIC_DAY	0	2	2010-07-28	19496	\N	97575	\N	\N
107305	GENERIC_DAY	0	1	2010-06-25	85043	\N	97575	\N	\N
107306	GENERIC_DAY	0	0	2010-07-10	1316	\N	97575	\N	\N
107307	GENERIC_DAY	0	0	2010-09-19	19494	\N	97575	\N	\N
107308	GENERIC_DAY	0	0	2010-06-04	19498	\N	97575	\N	\N
107309	GENERIC_DAY	0	0	2010-07-31	85043	\N	97575	\N	\N
107310	GENERIC_DAY	0	0	2010-09-04	50401	\N	97575	\N	\N
107311	GENERIC_DAY	0	0	2010-07-28	19498	\N	97575	\N	\N
107312	GENERIC_DAY	0	0	2010-08-07	19498	\N	97575	\N	\N
107313	GENERIC_DAY	0	0	2010-09-03	1314	\N	97575	\N	\N
107314	GENERIC_DAY	0	0	2010-10-07	1316	\N	97575	\N	\N
107315	GENERIC_DAY	0	0	2010-09-28	85043	\N	97575	\N	\N
107316	GENERIC_DAY	0	0	2010-05-01	19498	\N	97575	\N	\N
107317	GENERIC_DAY	0	0	2010-06-07	1330	\N	97575	\N	\N
107318	GENERIC_DAY	0	0	2010-10-16	19500	\N	97575	\N	\N
107319	GENERIC_DAY	0	2	2010-06-25	40199	\N	97575	\N	\N
107320	GENERIC_DAY	0	1	2010-07-27	2728	\N	97575	\N	\N
107321	GENERIC_DAY	0	0	2010-08-18	40199	\N	97575	\N	\N
107322	GENERIC_DAY	0	0	2010-07-09	1324	\N	97575	\N	\N
107323	GENERIC_DAY	0	0	2010-09-27	40199	\N	97575	\N	\N
107324	GENERIC_DAY	0	0	2010-10-18	85043	\N	97575	\N	\N
107325	GENERIC_DAY	0	0	2010-08-08	19500	\N	97575	\N	\N
107326	GENERIC_DAY	0	0	2010-05-08	1326	\N	97575	\N	\N
107327	GENERIC_DAY	0	0	2010-09-23	1320	\N	97575	\N	\N
107328	GENERIC_DAY	0	0	2010-07-28	1322	\N	97575	\N	\N
107329	GENERIC_DAY	0	0	2010-09-23	85043	\N	97575	\N	\N
107330	GENERIC_DAY	0	0	2010-05-17	40199	\N	97575	\N	\N
107331	GENERIC_DAY	0	1	2010-08-19	19494	\N	97575	\N	\N
107332	GENERIC_DAY	0	1	2010-09-29	1318	\N	97575	\N	\N
107333	GENERIC_DAY	0	1	2010-08-20	50401	\N	97575	\N	\N
107334	GENERIC_DAY	0	0	2010-07-18	1324	\N	97575	\N	\N
107335	GENERIC_DAY	0	1	2010-08-31	1314	\N	97575	\N	\N
107336	GENERIC_DAY	0	0	2010-08-26	61308	\N	97575	\N	\N
107337	GENERIC_DAY	0	0	2010-06-16	1330	\N	97575	\N	\N
107338	GENERIC_DAY	0	0	2010-09-25	61308	\N	97575	\N	\N
107339	GENERIC_DAY	0	0	2010-08-20	1332	\N	97575	\N	\N
107340	GENERIC_DAY	0	1	2010-05-07	61308	\N	97575	\N	\N
107341	GENERIC_DAY	0	0	2010-08-24	1320	\N	97575	\N	\N
107342	GENERIC_DAY	0	0	2010-05-11	2728	\N	97575	\N	\N
107343	GENERIC_DAY	0	1	2010-08-25	1318	\N	97575	\N	\N
107344	GENERIC_DAY	0	0	2010-05-19	40199	\N	97575	\N	\N
107345	GENERIC_DAY	0	0	2010-10-15	1326	\N	97575	\N	\N
107346	GENERIC_DAY	0	0	2010-08-10	19498	\N	97575	\N	\N
107347	GENERIC_DAY	0	0	2010-08-30	1328	\N	97575	\N	\N
107348	GENERIC_DAY	0	0	2010-08-25	19500	\N	97575	\N	\N
107349	GENERIC_DAY	0	0	2010-06-13	19496	\N	97575	\N	\N
107350	GENERIC_DAY	0	0	2010-10-03	1316	\N	97575	\N	\N
107351	GENERIC_DAY	0	2	2010-07-16	40199	\N	97575	\N	\N
107352	GENERIC_DAY	0	0	2010-06-23	1316	\N	97575	\N	\N
107353	GENERIC_DAY	0	0	2010-09-06	19500	\N	97575	\N	\N
107354	GENERIC_DAY	0	0	2010-10-19	19496	\N	97575	\N	\N
107355	GENERIC_DAY	0	0	2010-09-30	1320	\N	97575	\N	\N
107356	GENERIC_DAY	0	0	2010-09-05	61308	\N	97575	\N	\N
107357	GENERIC_DAY	0	1	2010-10-07	1324	\N	97575	\N	\N
107358	GENERIC_DAY	0	0	2010-07-17	40199	\N	97575	\N	\N
107359	GENERIC_DAY	0	0	2010-05-18	1314	\N	97575	\N	\N
107360	GENERIC_DAY	0	0	2010-05-10	19500	\N	97575	\N	\N
107361	GENERIC_DAY	0	0	2010-04-29	1330	\N	97575	\N	\N
107362	GENERIC_DAY	0	0	2010-08-04	50401	\N	97575	\N	\N
107363	GENERIC_DAY	0	1	2010-05-25	1328	\N	97575	\N	\N
107364	GENERIC_DAY	0	0	2010-05-31	1324	\N	97575	\N	\N
107365	GENERIC_DAY	0	2	2010-08-31	1322	\N	97575	\N	\N
107366	GENERIC_DAY	0	1	2010-09-20	19494	\N	97575	\N	\N
107367	GENERIC_DAY	0	0	2010-05-27	1318	\N	97575	\N	\N
107368	GENERIC_DAY	0	0	2010-05-24	1324	\N	97575	\N	\N
107369	GENERIC_DAY	0	0	2010-07-06	19500	\N	97575	\N	\N
107370	GENERIC_DAY	0	1	2010-08-17	19494	\N	97575	\N	\N
107371	GENERIC_DAY	0	1	2010-06-03	19494	\N	97575	\N	\N
107372	GENERIC_DAY	0	0	2010-06-03	1324	\N	97575	\N	\N
107373	GENERIC_DAY	0	0	2010-09-30	50401	\N	97575	\N	\N
107374	GENERIC_DAY	0	0	2010-05-20	19500	\N	97575	\N	\N
107375	GENERIC_DAY	0	0	2010-05-25	1324	\N	97575	\N	\N
107376	GENERIC_DAY	0	2	2010-08-13	61308	\N	97575	\N	\N
107377	GENERIC_DAY	0	0	2010-06-27	1320	\N	97575	\N	\N
107378	GENERIC_DAY	0	0	2010-06-11	2728	\N	97575	\N	\N
107379	GENERIC_DAY	0	0	2010-08-23	19498	\N	97575	\N	\N
107380	GENERIC_DAY	0	0	2010-07-11	19498	\N	97575	\N	\N
107381	GENERIC_DAY	0	2	2010-08-05	1314	\N	97575	\N	\N
107382	GENERIC_DAY	0	0	2010-09-06	19498	\N	97575	\N	\N
107383	GENERIC_DAY	0	0	2010-05-10	1326	\N	97575	\N	\N
107384	GENERIC_DAY	0	0	2010-10-15	1314	\N	97575	\N	\N
107385	GENERIC_DAY	0	0	2010-06-05	1326	\N	97575	\N	\N
107386	GENERIC_DAY	0	0	2010-10-15	1330	\N	97575	\N	\N
107387	GENERIC_DAY	0	0	2010-05-14	1326	\N	97575	\N	\N
107388	GENERIC_DAY	0	0	2010-08-20	1320	\N	97575	\N	\N
107389	GENERIC_DAY	0	0	2010-09-23	19500	\N	97575	\N	\N
107390	GENERIC_DAY	0	0	2010-09-15	50401	\N	97575	\N	\N
107391	GENERIC_DAY	0	0	2010-08-05	19500	\N	97575	\N	\N
107392	GENERIC_DAY	0	0	2010-06-06	1322	\N	97575	\N	\N
107393	GENERIC_DAY	0	0	2010-08-23	50401	\N	97575	\N	\N
107394	GENERIC_DAY	0	0	2010-08-22	1318	\N	97575	\N	\N
107395	GENERIC_DAY	0	1	2010-09-02	19496	\N	97575	\N	\N
107396	GENERIC_DAY	0	2	2010-09-03	61308	\N	97575	\N	\N
107397	GENERIC_DAY	0	2	2010-05-21	61308	\N	97575	\N	\N
107398	GENERIC_DAY	0	0	2010-05-12	1324	\N	97575	\N	\N
107399	GENERIC_DAY	0	2	2010-06-11	40199	\N	97575	\N	\N
107400	GENERIC_DAY	0	2	2010-09-30	1322	\N	97575	\N	\N
107401	GENERIC_DAY	0	2	2010-06-02	1322	\N	97575	\N	\N
107402	GENERIC_DAY	0	0	2010-08-04	40199	\N	97575	\N	\N
107403	GENERIC_DAY	0	0	2010-08-21	1316	\N	97575	\N	\N
107404	GENERIC_DAY	0	0	2010-07-14	40199	\N	97575	\N	\N
107405	GENERIC_DAY	0	0	2010-05-19	61308	\N	97575	\N	\N
107406	GENERIC_DAY	0	0	2010-10-19	19500	\N	97575	\N	\N
107407	GENERIC_DAY	0	0	2010-05-14	19496	\N	97575	\N	\N
107408	GENERIC_DAY	0	0	2010-09-29	85043	\N	97575	\N	\N
107409	GENERIC_DAY	0	0	2010-05-16	19500	\N	97575	\N	\N
107410	GENERIC_DAY	0	1	2010-07-14	19494	\N	97575	\N	\N
107411	GENERIC_DAY	0	2	2010-09-06	1322	\N	97575	\N	\N
107412	GENERIC_DAY	0	0	2010-06-26	1330	\N	97575	\N	\N
107413	GENERIC_DAY	0	1	2010-05-11	61308	\N	97575	\N	\N
107414	GENERIC_DAY	0	0	2010-05-15	61308	\N	97575	\N	\N
107415	GENERIC_DAY	0	0	2010-09-25	1320	\N	97575	\N	\N
107416	GENERIC_DAY	0	0	2010-08-25	1332	\N	97575	\N	\N
107417	GENERIC_DAY	0	0	2010-05-16	1316	\N	97575	\N	\N
107418	GENERIC_DAY	0	0	2010-05-28	2728	\N	97575	\N	\N
107419	GENERIC_DAY	0	0	2010-10-10	85043	\N	97575	\N	\N
107420	GENERIC_DAY	0	0	2010-05-18	19498	\N	97575	\N	\N
107421	GENERIC_DAY	0	0	2010-09-26	1330	\N	97575	\N	\N
107422	GENERIC_DAY	0	0	2010-05-19	1314	\N	97575	\N	\N
107423	GENERIC_DAY	0	0	2010-09-26	1326	\N	97575	\N	\N
107424	GENERIC_DAY	0	1	2010-07-27	1324	\N	97575	\N	\N
107425	GENERIC_DAY	0	0	2010-05-22	85043	\N	97575	\N	\N
107426	GENERIC_DAY	0	2	2010-07-07	1314	\N	97575	\N	\N
107427	GENERIC_DAY	0	0	2010-09-06	1326	\N	97575	\N	\N
107428	GENERIC_DAY	0	0	2010-05-01	1318	\N	97575	\N	\N
107429	GENERIC_DAY	0	1	2010-06-15	19496	\N	97575	\N	\N
107430	GENERIC_DAY	0	0	2010-06-19	85043	\N	97575	\N	\N
107431	GENERIC_DAY	0	0	2010-08-07	19496	\N	97575	\N	\N
107432	GENERIC_DAY	0	0	2010-08-26	1322	\N	97575	\N	\N
107433	GENERIC_DAY	0	0	2010-07-03	50401	\N	97575	\N	\N
107434	GENERIC_DAY	0	2	2010-09-10	61308	\N	97575	\N	\N
107435	GENERIC_DAY	0	1	2010-09-17	50401	\N	97575	\N	\N
107436	GENERIC_DAY	0	0	2010-04-29	40199	\N	97575	\N	\N
107437	GENERIC_DAY	0	1	2010-05-04	1332	\N	97575	\N	\N
107438	GENERIC_DAY	0	0	2010-05-21	19498	\N	97575	\N	\N
107439	GENERIC_DAY	0	0	2010-06-07	50401	\N	97575	\N	\N
107440	GENERIC_DAY	0	1	2010-07-08	2728	\N	97575	\N	\N
107441	GENERIC_DAY	0	0	2010-07-17	1330	\N	97575	\N	\N
107442	GENERIC_DAY	0	0	2010-05-11	1326	\N	97575	\N	\N
107443	GENERIC_DAY	0	0	2010-09-08	61308	\N	97575	\N	\N
107444	GENERIC_DAY	0	0	2010-07-03	61308	\N	97575	\N	\N
107445	GENERIC_DAY	0	0	2010-07-23	19500	\N	97575	\N	\N
107446	GENERIC_DAY	0	0	2010-05-24	1316	\N	97575	\N	\N
107447	GENERIC_DAY	0	0	2010-05-09	19498	\N	97575	\N	\N
107448	GENERIC_DAY	0	0	2010-08-18	50401	\N	97575	\N	\N
107449	GENERIC_DAY	0	0	2010-09-17	1320	\N	97575	\N	\N
107450	GENERIC_DAY	0	0	2010-10-04	1330	\N	97575	\N	\N
107451	GENERIC_DAY	0	0	2010-08-24	19500	\N	97575	\N	\N
107452	GENERIC_DAY	0	0	2010-07-19	1320	\N	97575	\N	\N
107453	GENERIC_DAY	0	1	2010-05-24	1332	\N	97575	\N	\N
107454	GENERIC_DAY	0	0	2010-09-13	1330	\N	97575	\N	\N
107455	GENERIC_DAY	0	0	2010-05-16	19496	\N	97575	\N	\N
107456	GENERIC_DAY	0	0	2010-10-20	1326	\N	97575	\N	\N
107457	GENERIC_DAY	0	0	2010-05-30	1316	\N	97575	\N	\N
107458	GENERIC_DAY	0	1	2010-09-21	1314	\N	97575	\N	\N
107459	GENERIC_DAY	0	0	2010-09-07	85043	\N	97575	\N	\N
107460	GENERIC_DAY	0	2	2010-08-25	1314	\N	97575	\N	\N
107461	GENERIC_DAY	0	0	2010-05-20	50401	\N	97575	\N	\N
107462	GENERIC_DAY	0	0	2010-07-05	1322	\N	97575	\N	\N
107463	GENERIC_DAY	0	0	2010-10-14	19500	\N	97575	\N	\N
107464	GENERIC_DAY	0	0	2010-06-17	1316	\N	97575	\N	\N
107465	GENERIC_DAY	0	0	2010-07-16	19494	\N	97575	\N	\N
107466	GENERIC_DAY	0	0	2010-06-30	1322	\N	97575	\N	\N
107467	GENERIC_DAY	0	1	2010-06-25	50401	\N	97575	\N	\N
107468	GENERIC_DAY	0	0	2010-09-19	2728	\N	97575	\N	\N
107469	GENERIC_DAY	0	0	2010-09-20	19500	\N	97575	\N	\N
107470	GENERIC_DAY	0	1	2010-06-03	2728	\N	97575	\N	\N
107471	GENERIC_DAY	0	1	2010-06-22	2728	\N	97575	\N	\N
107472	GENERIC_DAY	0	1	2010-07-30	85043	\N	97575	\N	\N
107473	GENERIC_DAY	0	0	2010-10-19	1328	\N	97575	\N	\N
107474	GENERIC_DAY	0	0	2010-07-29	1316	\N	97575	\N	\N
107475	GENERIC_DAY	0	0	2010-05-18	1318	\N	97575	\N	\N
107476	GENERIC_DAY	0	0	2010-06-02	1320	\N	97575	\N	\N
107477	GENERIC_DAY	0	0	2010-05-15	1320	\N	97575	\N	\N
107478	GENERIC_DAY	0	0	2010-06-20	1326	\N	97575	\N	\N
107479	GENERIC_DAY	0	0	2010-07-08	61308	\N	97575	\N	\N
107480	GENERIC_DAY	0	0	2010-06-05	1314	\N	97575	\N	\N
107481	GENERIC_DAY	0	0	2010-10-06	19500	\N	97575	\N	\N
107482	GENERIC_DAY	0	0	2010-06-01	19500	\N	97575	\N	\N
107483	GENERIC_DAY	0	0	2010-07-04	1332	\N	97575	\N	\N
107484	GENERIC_DAY	0	0	2010-07-04	1328	\N	97575	\N	\N
107485	GENERIC_DAY	0	2	2010-08-20	1316	\N	97575	\N	\N
107486	GENERIC_DAY	0	0	2010-06-30	61308	\N	97575	\N	\N
107487	GENERIC_DAY	0	0	2010-07-23	1328	\N	97575	\N	\N
107488	GENERIC_DAY	0	0	2010-07-26	1320	\N	97575	\N	\N
107489	GENERIC_DAY	0	1	2010-07-22	2728	\N	97575	\N	\N
107490	GENERIC_DAY	0	1	2010-08-30	19494	\N	97575	\N	\N
107491	GENERIC_DAY	0	0	2010-09-26	1322	\N	97575	\N	\N
107492	GENERIC_DAY	0	0	2010-05-31	1314	\N	97575	\N	\N
107493	GENERIC_DAY	0	1	2010-09-09	1324	\N	97575	\N	\N
107494	GENERIC_DAY	0	0	2010-09-16	1328	\N	97575	\N	\N
107495	GENERIC_DAY	0	0	2010-06-23	19498	\N	97575	\N	\N
107496	GENERIC_DAY	0	0	2010-08-22	61308	\N	97575	\N	\N
107497	GENERIC_DAY	0	0	2010-06-17	40199	\N	97575	\N	\N
107498	GENERIC_DAY	0	0	2010-08-15	19500	\N	97575	\N	\N
107499	GENERIC_DAY	0	0	2010-09-24	1314	\N	97575	\N	\N
107500	GENERIC_DAY	0	0	2010-05-12	19500	\N	97575	\N	\N
107501	GENERIC_DAY	0	0	2010-09-06	1320	\N	97575	\N	\N
107502	GENERIC_DAY	0	1	2010-09-13	1324	\N	97575	\N	\N
107503	GENERIC_DAY	0	0	2010-05-25	1330	\N	97575	\N	\N
107504	GENERIC_DAY	0	1	2010-09-29	19496	\N	97575	\N	\N
107505	GENERIC_DAY	0	1	2010-10-06	1318	\N	97575	\N	\N
107506	GENERIC_DAY	0	0	2010-09-26	1328	\N	97575	\N	\N
107507	GENERIC_DAY	0	0	2010-09-19	1316	\N	97575	\N	\N
107508	GENERIC_DAY	0	0	2010-06-14	40199	\N	97575	\N	\N
107509	GENERIC_DAY	0	0	2010-06-16	1324	\N	97575	\N	\N
107510	GENERIC_DAY	0	0	2010-06-16	85043	\N	97575	\N	\N
107511	GENERIC_DAY	0	0	2010-08-24	50401	\N	97575	\N	\N
107512	GENERIC_DAY	0	0	2010-08-28	1320	\N	97575	\N	\N
107513	GENERIC_DAY	0	1	2010-05-10	1316	\N	97575	\N	\N
107514	GENERIC_DAY	0	1	2010-07-21	1318	\N	97575	\N	\N
107515	GENERIC_DAY	0	0	2010-05-16	40199	\N	97575	\N	\N
107516	GENERIC_DAY	0	0	2010-06-29	50401	\N	97575	\N	\N
107517	GENERIC_DAY	0	0	2010-08-01	61308	\N	97575	\N	\N
107518	GENERIC_DAY	0	0	2010-07-21	19498	\N	97575	\N	\N
107519	GENERIC_DAY	0	0	2010-09-03	1318	\N	97575	\N	\N
107520	GENERIC_DAY	0	1	2010-09-16	1314	\N	97575	\N	\N
107521	GENERIC_DAY	0	2	2010-05-25	19496	\N	97575	\N	\N
107522	GENERIC_DAY	0	0	2010-10-11	50401	\N	97575	\N	\N
107523	GENERIC_DAY	0	0	2010-09-14	50401	\N	97575	\N	\N
107524	GENERIC_DAY	0	0	2010-10-09	1316	\N	97575	\N	\N
107525	GENERIC_DAY	0	1	2010-05-03	1332	\N	97575	\N	\N
107526	GENERIC_DAY	0	0	2010-09-20	40199	\N	97575	\N	\N
107527	GENERIC_DAY	0	0	2010-10-05	50401	\N	97575	\N	\N
107528	GENERIC_DAY	0	0	2010-08-15	19496	\N	97575	\N	\N
107529	GENERIC_DAY	0	0	2010-10-08	1332	\N	97575	\N	\N
107530	GENERIC_DAY	0	0	2010-07-08	1330	\N	97575	\N	\N
107531	GENERIC_DAY	0	1	2010-10-18	1316	\N	97575	\N	\N
107532	GENERIC_DAY	0	0	2010-09-08	1328	\N	97575	\N	\N
107533	GENERIC_DAY	0	0	2010-06-28	1318	\N	97575	\N	\N
107534	GENERIC_DAY	0	0	2010-07-18	19500	\N	97575	\N	\N
107535	GENERIC_DAY	0	0	2010-07-16	19500	\N	97575	\N	\N
107536	GENERIC_DAY	0	2	2010-05-24	1322	\N	97575	\N	\N
107537	GENERIC_DAY	0	0	2010-08-22	1330	\N	97575	\N	\N
107538	GENERIC_DAY	0	0	2010-09-28	1328	\N	97575	\N	\N
107539	GENERIC_DAY	0	0	2010-10-16	1318	\N	97575	\N	\N
107540	GENERIC_DAY	0	2	2010-07-01	19496	\N	97575	\N	\N
107541	GENERIC_DAY	0	1	2010-05-11	1316	\N	97575	\N	\N
107542	GENERIC_DAY	0	1	2010-09-23	1314	\N	97575	\N	\N
107543	GENERIC_DAY	0	0	2010-09-05	19496	\N	97575	\N	\N
107544	GENERIC_DAY	0	0	2010-08-30	1316	\N	97575	\N	\N
107545	GENERIC_DAY	0	0	2010-09-05	1320	\N	97575	\N	\N
107546	GENERIC_DAY	0	0	2010-07-13	19500	\N	97575	\N	\N
107547	GENERIC_DAY	0	0	2010-10-05	1326	\N	97575	\N	\N
107548	GENERIC_DAY	0	1	2010-04-29	1328	\N	97575	\N	\N
107549	GENERIC_DAY	0	0	2010-07-03	2728	\N	97575	\N	\N
107550	GENERIC_DAY	0	1	2010-07-08	1324	\N	97575	\N	\N
107551	GENERIC_DAY	0	0	2010-06-20	1320	\N	97575	\N	\N
107552	GENERIC_DAY	0	0	2010-05-04	19496	\N	97575	\N	\N
107553	GENERIC_DAY	0	0	2010-05-22	2728	\N	97575	\N	\N
107554	GENERIC_DAY	0	0	2010-05-31	50401	\N	97575	\N	\N
107555	GENERIC_DAY	0	1	2010-07-08	1332	\N	97575	\N	\N
107556	GENERIC_DAY	0	2	2010-07-15	1314	\N	97575	\N	\N
107557	GENERIC_DAY	0	0	2010-10-18	61308	\N	97575	\N	\N
107558	GENERIC_DAY	0	1	2010-09-13	19496	\N	97575	\N	\N
107559	GENERIC_DAY	0	0	2010-10-13	1328	\N	97575	\N	\N
107560	GENERIC_DAY	0	0	2010-05-28	1332	\N	97575	\N	\N
107561	GENERIC_DAY	0	0	2010-07-18	50401	\N	97575	\N	\N
107562	GENERIC_DAY	0	1	2010-10-07	2728	\N	97575	\N	\N
107563	GENERIC_DAY	0	0	2010-08-25	50401	\N	97575	\N	\N
107564	GENERIC_DAY	0	0	2010-06-12	1324	\N	97575	\N	\N
107565	GENERIC_DAY	0	1	2010-09-21	19494	\N	97575	\N	\N
107566	GENERIC_DAY	0	0	2010-07-08	1318	\N	97575	\N	\N
107567	GENERIC_DAY	0	0	2010-05-29	19500	\N	97575	\N	\N
107568	GENERIC_DAY	0	1	2010-08-24	1324	\N	97575	\N	\N
107569	GENERIC_DAY	0	0	2010-07-30	1322	\N	97575	\N	\N
107570	GENERIC_DAY	0	0	2010-09-01	1320	\N	97575	\N	\N
107571	GENERIC_DAY	0	0	2010-08-29	1324	\N	97575	\N	\N
107572	GENERIC_DAY	0	0	2010-06-23	1330	\N	97575	\N	\N
107573	GENERIC_DAY	0	1	2010-05-07	40199	\N	97575	\N	\N
107574	GENERIC_DAY	0	0	2010-07-30	19496	\N	97575	\N	\N
107575	GENERIC_DAY	0	0	2010-05-05	1318	\N	97575	\N	\N
107576	GENERIC_DAY	0	1	2010-10-04	19494	\N	97575	\N	\N
107577	GENERIC_DAY	0	1	2010-06-09	1332	\N	97575	\N	\N
107578	GENERIC_DAY	0	0	2010-10-10	19496	\N	97575	\N	\N
107579	GENERIC_DAY	0	0	2010-07-15	50401	\N	97575	\N	\N
107580	GENERIC_DAY	0	1	2010-05-18	19494	\N	97575	\N	\N
107581	GENERIC_DAY	0	1	2010-08-09	2728	\N	97575	\N	\N
107582	GENERIC_DAY	0	0	2010-09-11	40199	\N	97575	\N	\N
107583	GENERIC_DAY	0	0	2010-07-10	1320	\N	97575	\N	\N
107584	GENERIC_DAY	0	0	2010-08-25	1326	\N	97575	\N	\N
107585	GENERIC_DAY	0	0	2010-09-14	1330	\N	97575	\N	\N
107586	GENERIC_DAY	0	0	2010-09-03	2728	\N	97575	\N	\N
107587	GENERIC_DAY	0	0	2010-10-01	19498	\N	97575	\N	\N
107588	GENERIC_DAY	0	0	2010-10-03	19500	\N	97575	\N	\N
107589	GENERIC_DAY	0	0	2010-07-13	61308	\N	97575	\N	\N
107590	GENERIC_DAY	0	0	2010-05-13	1328	\N	97575	\N	\N
107591	GENERIC_DAY	0	0	2010-08-19	1330	\N	97575	\N	\N
107592	GENERIC_DAY	0	0	2010-06-18	1326	\N	97575	\N	\N
107593	GENERIC_DAY	0	0	2010-09-08	1320	\N	97575	\N	\N
107594	GENERIC_DAY	0	1	2010-05-18	2728	\N	97575	\N	\N
107595	GENERIC_DAY	0	2	2010-06-25	1316	\N	97575	\N	\N
107596	GENERIC_DAY	0	0	2010-07-09	1330	\N	97575	\N	\N
107597	GENERIC_DAY	0	2	2010-07-27	19496	\N	97575	\N	\N
107598	GENERIC_DAY	0	0	2010-07-04	19498	\N	97575	\N	\N
107599	GENERIC_DAY	0	2	2010-05-24	19496	\N	97575	\N	\N
107600	GENERIC_DAY	0	1	2010-07-20	1318	\N	97575	\N	\N
107601	GENERIC_DAY	0	1	2010-09-22	19496	\N	97575	\N	\N
107602	GENERIC_DAY	0	0	2010-06-14	61308	\N	97575	\N	\N
107603	GENERIC_DAY	0	2	2010-08-17	1314	\N	97575	\N	\N
107604	GENERIC_DAY	0	0	2010-08-20	19498	\N	97575	\N	\N
107605	GENERIC_DAY	0	0	2010-05-01	1330	\N	97575	\N	\N
107606	GENERIC_DAY	0	1	2010-08-04	2728	\N	97575	\N	\N
107607	GENERIC_DAY	0	0	2010-08-10	50401	\N	97575	\N	\N
107608	GENERIC_DAY	0	0	2010-05-16	85043	\N	97575	\N	\N
107609	GENERIC_DAY	0	1	2010-10-13	1332	\N	97575	\N	\N
107610	GENERIC_DAY	0	0	2010-09-25	19494	\N	97575	\N	\N
107611	GENERIC_DAY	0	0	2010-07-22	50401	\N	97575	\N	\N
107612	GENERIC_DAY	0	0	2010-08-14	50401	\N	97575	\N	\N
107613	GENERIC_DAY	0	0	2010-08-07	1322	\N	97575	\N	\N
107614	GENERIC_DAY	0	0	2010-08-15	1316	\N	97575	\N	\N
107615	GENERIC_DAY	0	0	2010-06-20	61308	\N	97575	\N	\N
107616	GENERIC_DAY	0	2	2010-08-02	1314	\N	97575	\N	\N
107617	GENERIC_DAY	0	0	2010-07-29	1326	\N	97575	\N	\N
107618	GENERIC_DAY	0	0	2010-10-14	1326	\N	97575	\N	\N
107619	GENERIC_DAY	0	0	2010-08-31	19500	\N	97575	\N	\N
107620	GENERIC_DAY	0	0	2010-07-05	1330	\N	97575	\N	\N
107621	GENERIC_DAY	0	0	2010-09-04	85043	\N	97575	\N	\N
107622	GENERIC_DAY	0	2	2010-04-30	61308	\N	97575	\N	\N
107623	GENERIC_DAY	0	1	2010-06-02	1332	\N	97575	\N	\N
107624	GENERIC_DAY	0	0	2010-08-14	1328	\N	97575	\N	\N
107625	GENERIC_DAY	0	0	2010-06-13	1328	\N	97575	\N	\N
107626	GENERIC_DAY	0	0	2010-05-15	19500	\N	97575	\N	\N
107627	GENERIC_DAY	0	1	2010-06-21	2728	\N	97575	\N	\N
107628	GENERIC_DAY	0	0	2010-09-27	1328	\N	97575	\N	\N
107629	GENERIC_DAY	0	0	2010-04-30	19498	\N	97575	\N	\N
107630	GENERIC_DAY	0	1	2010-09-23	1324	\N	97575	\N	\N
107631	GENERIC_DAY	0	0	2010-04-29	1320	\N	97575	\N	\N
107632	GENERIC_DAY	0	1	2010-07-28	1324	\N	97575	\N	\N
107633	GENERIC_DAY	0	0	2010-08-06	1324	\N	97575	\N	\N
107634	GENERIC_DAY	0	0	2010-07-24	1326	\N	97575	\N	\N
107635	GENERIC_DAY	0	1	2010-09-08	1318	\N	97575	\N	\N
107636	GENERIC_DAY	0	0	2010-08-23	1328	\N	97575	\N	\N
107637	GENERIC_DAY	0	0	2010-09-20	19498	\N	97575	\N	\N
107638	GENERIC_DAY	0	0	2010-05-24	40199	\N	97575	\N	\N
107639	GENERIC_DAY	0	0	2010-05-25	50401	\N	97575	\N	\N
107640	GENERIC_DAY	0	0	2010-06-10	1316	\N	97575	\N	\N
107641	GENERIC_DAY	0	0	2010-06-28	40199	\N	97575	\N	\N
107642	GENERIC_DAY	0	0	2010-06-28	1330	\N	97575	\N	\N
107643	GENERIC_DAY	0	0	2010-08-07	1320	\N	97575	\N	\N
107644	GENERIC_DAY	0	0	2010-08-14	19498	\N	97575	\N	\N
107645	GENERIC_DAY	0	1	2010-07-07	19496	\N	97575	\N	\N
107646	GENERIC_DAY	0	0	2010-09-15	85043	\N	97575	\N	\N
107647	GENERIC_DAY	0	0	2010-08-03	1322	\N	97575	\N	\N
107648	GENERIC_DAY	0	0	2010-10-17	1318	\N	97575	\N	\N
107649	GENERIC_DAY	0	0	2010-10-20	1330	\N	97575	\N	\N
107650	GENERIC_DAY	0	0	2010-08-07	19494	\N	97575	\N	\N
107651	GENERIC_DAY	0	0	2010-07-14	1322	\N	97575	\N	\N
107652	GENERIC_DAY	0	0	2010-07-29	50401	\N	97575	\N	\N
107653	GENERIC_DAY	0	0	2010-05-07	1318	\N	97575	\N	\N
107654	GENERIC_DAY	0	1	2010-05-06	1328	\N	97575	\N	\N
107655	GENERIC_DAY	0	1	2010-05-13	1322	\N	97575	\N	\N
107656	GENERIC_DAY	0	0	2010-08-27	19498	\N	97575	\N	\N
107657	GENERIC_DAY	0	0	2010-08-19	61308	\N	97575	\N	\N
107658	GENERIC_DAY	0	0	2010-06-13	19498	\N	97575	\N	\N
107659	GENERIC_DAY	0	0	2010-05-26	1330	\N	97575	\N	\N
107660	GENERIC_DAY	0	0	2010-09-18	19496	\N	97575	\N	\N
107661	GENERIC_DAY	0	0	2010-07-08	1320	\N	97575	\N	\N
107662	GENERIC_DAY	0	0	2010-08-13	19496	\N	97575	\N	\N
107663	GENERIC_DAY	0	0	2010-06-24	1326	\N	97575	\N	\N
107664	GENERIC_DAY	0	2	2010-08-16	1314	\N	97575	\N	\N
107665	GENERIC_DAY	0	0	2010-07-12	1326	\N	97575	\N	\N
107666	GENERIC_DAY	0	2	2010-06-28	19496	\N	97575	\N	\N
107667	GENERIC_DAY	0	0	2010-06-14	1326	\N	97575	\N	\N
107668	GENERIC_DAY	0	0	2010-05-08	19498	\N	97575	\N	\N
107669	GENERIC_DAY	0	0	2010-05-31	1320	\N	97575	\N	\N
107670	GENERIC_DAY	0	0	2010-07-19	19498	\N	97575	\N	\N
107671	GENERIC_DAY	0	0	2010-08-03	1316	\N	97575	\N	\N
107672	GENERIC_DAY	0	0	2010-08-18	19500	\N	97575	\N	\N
107673	GENERIC_DAY	0	0	2010-08-09	50401	\N	97575	\N	\N
107674	GENERIC_DAY	0	0	2010-08-01	19498	\N	97575	\N	\N
107675	GENERIC_DAY	0	0	2010-09-10	19494	\N	97575	\N	\N
107676	GENERIC_DAY	0	0	2010-05-08	1314	\N	97575	\N	\N
107677	GENERIC_DAY	0	0	2010-06-14	1330	\N	97575	\N	\N
107678	GENERIC_DAY	0	0	2010-07-01	61308	\N	97575	\N	\N
107679	GENERIC_DAY	0	0	2010-07-12	40199	\N	97575	\N	\N
107680	GENERIC_DAY	0	0	2010-05-26	1326	\N	97575	\N	\N
107681	GENERIC_DAY	0	0	2010-05-02	1330	\N	97575	\N	\N
107682	GENERIC_DAY	0	0	2010-06-03	1316	\N	97575	\N	\N
107683	GENERIC_DAY	0	1	2010-09-14	19496	\N	97575	\N	\N
107684	GENERIC_DAY	0	1	2010-05-31	19494	\N	97575	\N	\N
107685	GENERIC_DAY	0	0	2010-07-20	50401	\N	97575	\N	\N
107686	GENERIC_DAY	0	1	2010-07-26	1318	\N	97575	\N	\N
107687	GENERIC_DAY	0	0	2010-06-12	1330	\N	97575	\N	\N
107688	GENERIC_DAY	0	0	2010-07-20	40199	\N	97575	\N	\N
107689	GENERIC_DAY	0	0	2010-10-04	1332	\N	97575	\N	\N
107690	GENERIC_DAY	0	0	2010-05-18	1316	\N	97575	\N	\N
107691	GENERIC_DAY	0	0	2010-10-15	19500	\N	97575	\N	\N
107692	GENERIC_DAY	0	1	2010-05-03	1322	\N	97575	\N	\N
107693	GENERIC_DAY	0	0	2010-05-07	19500	\N	97575	\N	\N
107694	GENERIC_DAY	0	1	2010-08-04	1318	\N	97575	\N	\N
107695	GENERIC_DAY	0	0	2010-08-23	1326	\N	97575	\N	\N
107696	GENERIC_DAY	0	2	2010-08-06	1316	\N	97575	\N	\N
107697	GENERIC_DAY	0	2	2010-08-23	19496	\N	97575	\N	\N
107698	GENERIC_DAY	0	0	2010-10-14	19496	\N	97575	\N	\N
107699	GENERIC_DAY	0	0	2010-09-01	1328	\N	97575	\N	\N
107700	GENERIC_DAY	0	2	2010-06-14	1322	\N	97575	\N	\N
107701	GENERIC_DAY	0	0	2010-06-27	1314	\N	97575	\N	\N
107702	GENERIC_DAY	0	0	2010-04-30	1314	\N	97575	\N	\N
107703	GENERIC_DAY	0	1	2010-04-29	1322	\N	97575	\N	\N
107704	GENERIC_DAY	0	0	2010-05-06	19500	\N	97575	\N	\N
107705	GENERIC_DAY	0	0	2010-06-23	40199	\N	97575	\N	\N
107706	GENERIC_DAY	0	0	2010-08-29	2728	\N	97575	\N	\N
107707	GENERIC_DAY	0	1	2010-06-24	2728	\N	97575	\N	\N
107708	GENERIC_DAY	0	1	2010-09-22	2728	\N	97575	\N	\N
107709	GENERIC_DAY	0	2	2010-10-15	1316	\N	97575	\N	\N
107710	GENERIC_DAY	0	2	2010-07-16	61308	\N	97575	\N	\N
107711	GENERIC_DAY	0	0	2010-09-10	2728	\N	97575	\N	\N
107712	GENERIC_DAY	0	0	2010-10-05	1316	\N	97575	\N	\N
107713	GENERIC_DAY	0	1	2010-06-22	19494	\N	97575	\N	\N
107714	GENERIC_DAY	0	0	2010-08-24	1328	\N	97575	\N	\N
107715	GENERIC_DAY	0	0	2010-09-25	85043	\N	97575	\N	\N
107716	GENERIC_DAY	0	0	2010-09-10	1324	\N	97575	\N	\N
107717	GENERIC_DAY	0	0	2010-07-15	19498	\N	97575	\N	\N
107718	GENERIC_DAY	0	0	2010-05-12	1314	\N	97575	\N	\N
107719	GENERIC_DAY	0	0	2010-07-19	85043	\N	97575	\N	\N
107720	GENERIC_DAY	0	0	2010-07-04	19496	\N	97575	\N	\N
107721	GENERIC_DAY	0	0	2010-05-28	1330	\N	97575	\N	\N
107722	GENERIC_DAY	0	0	2010-07-11	1322	\N	97575	\N	\N
107723	GENERIC_DAY	0	0	2010-07-23	19494	\N	97575	\N	\N
107724	GENERIC_DAY	0	0	2010-09-11	1324	\N	97575	\N	\N
107725	GENERIC_DAY	0	1	2010-06-02	2728	\N	97575	\N	\N
107726	GENERIC_DAY	0	1	2010-08-26	2728	\N	97575	\N	\N
107727	GENERIC_DAY	0	0	2010-10-20	40199	\N	97575	\N	\N
107728	GENERIC_DAY	0	1	2010-06-14	1314	\N	97575	\N	\N
107729	GENERIC_DAY	0	0	2010-07-24	1332	\N	97575	\N	\N
107730	GENERIC_DAY	0	0	2010-07-16	1324	\N	97575	\N	\N
107731	GENERIC_DAY	0	0	2010-05-13	1326	\N	97575	\N	\N
107732	GENERIC_DAY	0	0	2010-08-28	1318	\N	97575	\N	\N
107733	GENERIC_DAY	0	1	2010-08-19	1324	\N	97575	\N	\N
107734	GENERIC_DAY	0	0	2010-06-20	1318	\N	97575	\N	\N
107735	GENERIC_DAY	0	0	2010-09-19	1330	\N	97575	\N	\N
107736	GENERIC_DAY	0	1	2010-10-06	19496	\N	97575	\N	\N
107737	GENERIC_DAY	0	0	2010-07-05	19500	\N	97575	\N	\N
107738	GENERIC_DAY	0	0	2010-09-16	19500	\N	97575	\N	\N
107739	GENERIC_DAY	0	0	2010-09-13	61308	\N	97575	\N	\N
107740	GENERIC_DAY	0	0	2010-07-24	1320	\N	97575	\N	\N
107741	GENERIC_DAY	0	1	2010-07-15	19496	\N	97575	\N	\N
107742	GENERIC_DAY	0	1	2010-06-16	19496	\N	97575	\N	\N
107743	GENERIC_DAY	0	0	2010-05-10	1324	\N	97575	\N	\N
107744	GENERIC_DAY	0	0	2010-09-05	85043	\N	97575	\N	\N
107745	GENERIC_DAY	0	1	2010-09-23	19496	\N	97575	\N	\N
107746	GENERIC_DAY	0	1	2010-09-14	1324	\N	97575	\N	\N
107747	GENERIC_DAY	0	0	2010-06-20	19498	\N	97575	\N	\N
107748	GENERIC_DAY	0	0	2010-05-10	1314	\N	97575	\N	\N
107749	GENERIC_DAY	0	0	2010-07-16	1330	\N	97575	\N	\N
107750	GENERIC_DAY	0	2	2010-07-14	1314	\N	97575	\N	\N
107751	GENERIC_DAY	0	0	2010-06-24	1324	\N	97575	\N	\N
107752	GENERIC_DAY	0	0	2010-05-25	19500	\N	97575	\N	\N
107753	GENERIC_DAY	0	0	2010-08-07	1330	\N	97575	\N	\N
107754	GENERIC_DAY	0	0	2010-10-08	1326	\N	97575	\N	\N
107755	GENERIC_DAY	0	0	2010-08-18	85043	\N	97575	\N	\N
107756	GENERIC_DAY	0	0	2010-09-03	19494	\N	97575	\N	\N
107757	GENERIC_DAY	0	0	2010-05-20	1330	\N	97575	\N	\N
107758	GENERIC_DAY	0	0	2010-09-12	1322	\N	97575	\N	\N
107759	GENERIC_DAY	0	1	2010-05-14	40199	\N	97575	\N	\N
107760	GENERIC_DAY	0	0	2010-09-30	1330	\N	97575	\N	\N
107761	GENERIC_DAY	0	2	2010-10-14	2728	\N	97575	\N	\N
107762	GENERIC_DAY	0	1	2010-06-07	19494	\N	97575	\N	\N
107763	GENERIC_DAY	0	0	2010-08-12	40199	\N	97575	\N	\N
107764	GENERIC_DAY	0	0	2010-07-19	19500	\N	97575	\N	\N
107765	GENERIC_DAY	0	0	2010-06-03	61308	\N	97575	\N	\N
107766	GENERIC_DAY	0	0	2010-07-27	19500	\N	97575	\N	\N
107767	GENERIC_DAY	0	0	2010-06-29	1318	\N	97575	\N	\N
107768	GENERIC_DAY	0	1	2010-06-30	19494	\N	97575	\N	\N
107769	GENERIC_DAY	0	0	2010-06-29	19498	\N	97575	\N	\N
107770	GENERIC_DAY	0	0	2010-08-20	19496	\N	97575	\N	\N
107771	GENERIC_DAY	0	0	2010-10-15	1318	\N	97575	\N	\N
107772	GENERIC_DAY	0	0	2010-05-15	1328	\N	97575	\N	\N
107773	GENERIC_DAY	0	0	2010-09-27	19498	\N	97575	\N	\N
107774	GENERIC_DAY	0	0	2010-06-12	1316	\N	97575	\N	\N
107775	GENERIC_DAY	0	0	2010-09-08	85043	\N	97575	\N	\N
107776	GENERIC_DAY	0	0	2010-10-19	1332	\N	97575	\N	\N
107777	GENERIC_DAY	0	2	2010-06-18	61308	\N	97575	\N	\N
107778	GENERIC_DAY	0	0	2010-05-26	1314	\N	97575	\N	\N
107779	GENERIC_DAY	0	0	2010-10-18	1324	\N	97575	\N	\N
107780	GENERIC_DAY	0	1	2010-07-06	19494	\N	97575	\N	\N
107781	GENERIC_DAY	0	1	2010-09-29	2728	\N	97575	\N	\N
107782	GENERIC_DAY	0	0	2010-06-18	1328	\N	97575	\N	\N
107783	GENERIC_DAY	0	0	2010-10-17	1324	\N	97575	\N	\N
107784	GENERIC_DAY	0	1	2010-08-02	2728	\N	97575	\N	\N
107785	GENERIC_DAY	0	0	2010-06-09	19498	\N	97575	\N	\N
107786	GENERIC_DAY	0	1	2010-06-21	19494	\N	97575	\N	\N
107787	GENERIC_DAY	0	0	2010-10-05	1320	\N	97575	\N	\N
107788	GENERIC_DAY	0	0	2010-09-16	1316	\N	97575	\N	\N
107789	GENERIC_DAY	0	0	2010-10-10	50401	\N	97575	\N	\N
107790	GENERIC_DAY	0	0	2010-05-06	19498	\N	97575	\N	\N
107791	GENERIC_DAY	0	0	2010-08-10	1316	\N	97575	\N	\N
107792	GENERIC_DAY	0	0	2010-09-03	1322	\N	97575	\N	\N
107793	GENERIC_DAY	0	0	2010-05-18	40199	\N	97575	\N	\N
107794	GENERIC_DAY	0	0	2010-07-31	1330	\N	97575	\N	\N
107795	GENERIC_DAY	0	0	2010-09-17	1330	\N	97575	\N	\N
107796	GENERIC_DAY	0	0	2010-06-19	2728	\N	97575	\N	\N
107797	GENERIC_DAY	0	0	2010-09-17	19500	\N	97575	\N	\N
107798	GENERIC_DAY	0	0	2010-06-04	1328	\N	97575	\N	\N
107799	GENERIC_DAY	0	1	2010-09-16	19496	\N	97575	\N	\N
107800	GENERIC_DAY	0	0	2010-05-30	61308	\N	97575	\N	\N
107801	GENERIC_DAY	0	2	2010-08-20	40199	\N	97575	\N	\N
107802	GENERIC_DAY	0	1	2010-06-09	1328	\N	97575	\N	\N
107803	GENERIC_DAY	0	1	2010-05-10	2728	\N	97575	\N	\N
107804	GENERIC_DAY	0	0	2010-06-10	19498	\N	97575	\N	\N
107805	GENERIC_DAY	0	0	2010-07-23	1326	\N	97575	\N	\N
107806	GENERIC_DAY	0	1	2010-07-01	1332	\N	97575	\N	\N
107807	GENERIC_DAY	0	0	2010-10-02	1328	\N	97575	\N	\N
107808	GENERIC_DAY	0	0	2010-05-29	50401	\N	97575	\N	\N
107809	GENERIC_DAY	0	2	2010-09-22	1322	\N	97575	\N	\N
107810	GENERIC_DAY	0	0	2010-06-20	1316	\N	97575	\N	\N
107811	GENERIC_DAY	0	0	2010-08-22	19498	\N	97575	\N	\N
107812	GENERIC_DAY	0	0	2010-05-16	1318	\N	97575	\N	\N
107813	GENERIC_DAY	0	0	2010-09-08	19500	\N	97575	\N	\N
107814	GENERIC_DAY	0	1	2010-05-13	40199	\N	97575	\N	\N
107815	GENERIC_DAY	0	0	2010-08-31	1320	\N	97575	\N	\N
107816	GENERIC_DAY	0	0	2010-06-26	1326	\N	97575	\N	\N
107817	GENERIC_DAY	0	2	2010-09-02	1322	\N	97575	\N	\N
107818	GENERIC_DAY	0	1	2010-08-05	19494	\N	97575	\N	\N
107819	GENERIC_DAY	0	1	2010-04-29	1332	\N	97575	\N	\N
107820	GENERIC_DAY	0	0	2010-09-18	50401	\N	97575	\N	\N
107821	GENERIC_DAY	0	1	2010-05-14	1316	\N	97575	\N	\N
107822	GENERIC_DAY	0	0	2010-09-11	1326	\N	97575	\N	\N
107823	GENERIC_DAY	0	0	2010-08-20	19494	\N	97575	\N	\N
107824	GENERIC_DAY	0	0	2010-06-05	1316	\N	97575	\N	\N
107825	GENERIC_DAY	0	0	2010-07-10	1330	\N	97575	\N	\N
107826	GENERIC_DAY	0	0	2010-06-05	50401	\N	97575	\N	\N
107827	GENERIC_DAY	0	0	2010-07-26	61308	\N	97575	\N	\N
107828	GENERIC_DAY	0	0	2010-10-06	50401	\N	97575	\N	\N
107829	GENERIC_DAY	0	0	2010-05-24	61308	\N	97575	\N	\N
107830	GENERIC_DAY	0	2	2010-08-26	1314	\N	97575	\N	\N
107831	GENERIC_DAY	0	0	2010-05-12	19494	\N	97575	\N	\N
107832	GENERIC_DAY	0	0	2010-09-16	85043	\N	97575	\N	\N
107833	GENERIC_DAY	0	0	2010-10-07	50401	\N	97575	\N	\N
107834	GENERIC_DAY	0	1	2010-08-30	1314	\N	97575	\N	\N
107835	GENERIC_DAY	0	0	2010-08-07	85043	\N	97575	\N	\N
107836	GENERIC_DAY	0	0	2010-10-16	50401	\N	97575	\N	\N
107837	GENERIC_DAY	0	2	2010-05-25	1322	\N	97575	\N	\N
107838	GENERIC_DAY	0	0	2010-09-12	19498	\N	97575	\N	\N
107839	GENERIC_DAY	0	2	2010-06-29	1314	\N	97575	\N	\N
107840	GENERIC_DAY	0	0	2010-07-18	1316	\N	97575	\N	\N
107841	GENERIC_DAY	0	0	2010-05-30	19496	\N	97575	\N	\N
107842	GENERIC_DAY	0	0	2010-08-29	1322	\N	97575	\N	\N
107843	GENERIC_DAY	0	0	2010-06-08	61308	\N	97575	\N	\N
107844	GENERIC_DAY	0	1	2010-10-11	1324	\N	97575	\N	\N
107845	GENERIC_DAY	0	0	2010-10-20	1322	\N	97575	\N	\N
107846	GENERIC_DAY	0	0	2010-07-24	19500	\N	97575	\N	\N
107847	GENERIC_DAY	0	0	2010-06-14	19500	\N	97575	\N	\N
107848	GENERIC_DAY	0	0	2010-06-06	50401	\N	97575	\N	\N
107849	GENERIC_DAY	0	0	2010-07-28	1320	\N	97575	\N	\N
107850	GENERIC_DAY	0	2	2010-10-08	61308	\N	97575	\N	\N
107851	GENERIC_DAY	0	0	2010-06-26	1328	\N	97575	\N	\N
107852	GENERIC_DAY	0	0	2010-10-17	1316	\N	97575	\N	\N
107853	GENERIC_DAY	0	0	2010-10-06	1328	\N	97575	\N	\N
107854	GENERIC_DAY	0	0	2010-09-20	1332	\N	97575	\N	\N
107855	GENERIC_DAY	0	0	2010-08-02	19500	\N	97575	\N	\N
107856	GENERIC_DAY	0	0	2010-08-25	40199	\N	97575	\N	\N
107857	GENERIC_DAY	0	0	2010-05-23	85043	\N	97575	\N	\N
107858	GENERIC_DAY	0	0	2010-09-11	1316	\N	97575	\N	\N
107859	GENERIC_DAY	0	0	2010-08-17	85043	\N	97575	\N	\N
107860	GENERIC_DAY	0	0	2010-09-07	1332	\N	97575	\N	\N
107861	GENERIC_DAY	0	0	2010-06-21	19498	\N	97575	\N	\N
107862	GENERIC_DAY	0	0	2010-08-11	1326	\N	97575	\N	\N
107863	GENERIC_DAY	0	0	2010-05-16	1328	\N	97575	\N	\N
107864	GENERIC_DAY	0	1	2010-06-28	2728	\N	97575	\N	\N
107865	GENERIC_DAY	0	0	2010-07-23	1318	\N	97575	\N	\N
107866	GENERIC_DAY	0	0	2010-05-09	1314	\N	97575	\N	\N
107867	GENERIC_DAY	0	1	2010-09-02	1318	\N	97575	\N	\N
107868	GENERIC_DAY	0	0	2010-06-06	40199	\N	97575	\N	\N
107869	GENERIC_DAY	0	0	2010-08-15	61308	\N	97575	\N	\N
107870	GENERIC_DAY	0	0	2010-08-14	1318	\N	97575	\N	\N
107871	GENERIC_DAY	0	0	2010-06-20	2728	\N	97575	\N	\N
107872	GENERIC_DAY	0	0	2010-08-09	1322	\N	97575	\N	\N
107873	GENERIC_DAY	0	0	2010-07-07	40199	\N	97575	\N	\N
107874	GENERIC_DAY	0	0	2010-07-09	2728	\N	97575	\N	\N
107875	GENERIC_DAY	0	0	2010-09-22	1332	\N	97575	\N	\N
107876	GENERIC_DAY	0	0	2010-10-20	1328	\N	97575	\N	\N
107877	GENERIC_DAY	0	0	2010-10-19	1324	\N	97575	\N	\N
107878	GENERIC_DAY	0	0	2010-06-23	1324	\N	97575	\N	\N
107879	GENERIC_DAY	0	0	2010-07-03	1318	\N	97575	\N	\N
107880	GENERIC_DAY	0	1	2010-05-13	1332	\N	97575	\N	\N
107881	GENERIC_DAY	0	0	2010-06-12	19500	\N	97575	\N	\N
107882	GENERIC_DAY	0	0	2010-05-27	40199	\N	97575	\N	\N
107883	GENERIC_DAY	0	1	2010-10-04	1324	\N	97575	\N	\N
107884	GENERIC_DAY	0	0	2010-06-20	1332	\N	97575	\N	\N
107885	GENERIC_DAY	0	0	2010-06-04	1320	\N	97575	\N	\N
107886	GENERIC_DAY	0	0	2010-08-10	19500	\N	97575	\N	\N
107887	GENERIC_DAY	0	2	2010-08-25	19496	\N	97575	\N	\N
107888	GENERIC_DAY	0	0	2010-08-14	1324	\N	97575	\N	\N
107889	GENERIC_DAY	0	0	2010-05-14	1328	\N	97575	\N	\N
107890	GENERIC_DAY	0	1	2010-10-01	85043	\N	97575	\N	\N
107891	GENERIC_DAY	0	1	2010-08-16	1324	\N	97575	\N	\N
107892	GENERIC_DAY	0	0	2010-09-18	1314	\N	97575	\N	\N
107893	GENERIC_DAY	0	0	2010-07-03	85043	\N	97575	\N	\N
107894	GENERIC_DAY	0	2	2010-08-27	40199	\N	97575	\N	\N
107895	GENERIC_DAY	0	0	2010-09-20	1330	\N	97575	\N	\N
107896	GENERIC_DAY	0	0	2010-06-09	1320	\N	97575	\N	\N
107897	GENERIC_DAY	0	0	2010-07-31	1316	\N	97575	\N	\N
107898	GENERIC_DAY	0	0	2010-08-19	1326	\N	97575	\N	\N
107899	GENERIC_DAY	0	0	2010-10-10	1316	\N	97575	\N	\N
107900	GENERIC_DAY	0	0	2010-09-30	1332	\N	97575	\N	\N
107901	GENERIC_DAY	0	0	2010-08-24	1322	\N	97575	\N	\N
107902	GENERIC_DAY	0	1	2010-07-05	1328	\N	97575	\N	\N
107903	GENERIC_DAY	0	0	2010-05-21	1322	\N	97575	\N	\N
107904	GENERIC_DAY	0	0	2010-07-17	19500	\N	97575	\N	\N
107905	GENERIC_DAY	0	0	2010-09-15	1326	\N	97575	\N	\N
107906	GENERIC_DAY	0	0	2010-10-06	85043	\N	97575	\N	\N
107907	GENERIC_DAY	0	0	2010-09-18	19500	\N	97575	\N	\N
107908	GENERIC_DAY	0	0	2010-08-04	1322	\N	97575	\N	\N
107909	GENERIC_DAY	0	0	2010-06-19	1326	\N	97575	\N	\N
107910	GENERIC_DAY	0	1	2010-06-16	19494	\N	97575	\N	\N
107911	GENERIC_DAY	0	1	2010-09-07	19496	\N	97575	\N	\N
107912	GENERIC_DAY	0	0	2010-10-13	40199	\N	97575	\N	\N
107913	GENERIC_DAY	0	0	2010-09-16	1332	\N	97575	\N	\N
107914	GENERIC_DAY	0	0	2010-09-28	1332	\N	97575	\N	\N
107915	GENERIC_DAY	0	0	2010-07-31	1326	\N	97575	\N	\N
107916	GENERIC_DAY	0	0	2010-06-25	1330	\N	97575	\N	\N
107917	GENERIC_DAY	0	0	2010-07-01	1320	\N	97575	\N	\N
107918	GENERIC_DAY	0	1	2010-08-24	1318	\N	97575	\N	\N
107919	GENERIC_DAY	0	0	2010-06-10	19500	\N	97575	\N	\N
107920	GENERIC_DAY	0	2	2010-05-14	61308	\N	97575	\N	\N
107921	GENERIC_DAY	0	0	2010-08-12	1332	\N	97575	\N	\N
107922	GENERIC_DAY	0	0	2010-07-25	1324	\N	97575	\N	\N
107923	GENERIC_DAY	0	0	2010-06-30	85043	\N	97575	\N	\N
107924	GENERIC_DAY	0	2	2010-08-18	19496	\N	97575	\N	\N
107925	GENERIC_DAY	0	1	2010-08-25	2728	\N	97575	\N	\N
107926	GENERIC_DAY	0	0	2010-07-03	1320	\N	97575	\N	\N
107927	GENERIC_DAY	0	2	2010-07-30	40199	\N	97575	\N	\N
107928	GENERIC_DAY	0	0	2010-05-29	1324	\N	97575	\N	\N
107929	GENERIC_DAY	0	0	2010-09-29	1326	\N	97575	\N	\N
107930	GENERIC_DAY	0	1	2010-07-01	1328	\N	97575	\N	\N
107931	GENERIC_DAY	0	0	2010-10-01	1320	\N	97575	\N	\N
107932	GENERIC_DAY	0	1	2010-05-25	2728	\N	97575	\N	\N
107933	GENERIC_DAY	0	0	2010-09-15	19500	\N	97575	\N	\N
107934	GENERIC_DAY	0	0	2010-08-05	85043	\N	97575	\N	\N
107935	GENERIC_DAY	0	0	2010-09-12	1324	\N	97575	\N	\N
107936	GENERIC_DAY	0	0	2010-08-11	1330	\N	97575	\N	\N
107937	GENERIC_DAY	0	1	2010-05-17	1322	\N	97575	\N	\N
107938	GENERIC_DAY	0	0	2010-05-09	19496	\N	97575	\N	\N
107939	GENERIC_DAY	0	0	2010-06-19	1316	\N	97575	\N	\N
107940	GENERIC_DAY	0	0	2010-05-01	61308	\N	97575	\N	\N
107941	GENERIC_DAY	0	0	2010-09-11	1322	\N	97575	\N	\N
107942	GENERIC_DAY	0	1	2010-07-29	1318	\N	97575	\N	\N
107943	GENERIC_DAY	0	0	2010-07-01	1322	\N	97575	\N	\N
107944	GENERIC_DAY	0	0	2010-05-13	1330	\N	97575	\N	\N
107945	GENERIC_DAY	0	0	2010-07-29	61308	\N	97575	\N	\N
107946	GENERIC_DAY	0	0	2010-08-23	1322	\N	97575	\N	\N
107947	GENERIC_DAY	0	0	2010-09-02	50401	\N	97575	\N	\N
107948	GENERIC_DAY	0	0	2010-06-25	19498	\N	97575	\N	\N
107949	GENERIC_DAY	0	2	2010-09-24	1316	\N	97575	\N	\N
107950	GENERIC_DAY	0	1	2010-10-05	1318	\N	97575	\N	\N
107951	GENERIC_DAY	0	1	2010-07-13	1324	\N	97575	\N	\N
107952	GENERIC_DAY	0	0	2010-07-02	2728	\N	97575	\N	\N
107953	GENERIC_DAY	0	0	2010-05-30	1326	\N	97575	\N	\N
107954	GENERIC_DAY	0	0	2010-06-06	1320	\N	97575	\N	\N
107955	GENERIC_DAY	0	0	2010-05-01	1316	\N	97575	\N	\N
107956	GENERIC_DAY	0	0	2010-09-29	1316	\N	97575	\N	\N
107957	GENERIC_DAY	0	0	2010-07-14	1320	\N	97575	\N	\N
107958	GENERIC_DAY	0	0	2010-09-02	1320	\N	97575	\N	\N
107959	GENERIC_DAY	0	1	2010-07-21	19496	\N	97575	\N	\N
107960	GENERIC_DAY	0	0	2010-08-10	1320	\N	97575	\N	\N
107961	GENERIC_DAY	0	0	2010-08-03	85043	\N	97575	\N	\N
107962	GENERIC_DAY	0	0	2010-08-07	2728	\N	97575	\N	\N
107963	GENERIC_DAY	0	0	2010-09-26	50401	\N	97575	\N	\N
107964	GENERIC_DAY	0	0	2010-05-26	1320	\N	97575	\N	\N
107965	GENERIC_DAY	0	0	2010-07-15	1330	\N	97575	\N	\N
107966	GENERIC_DAY	0	0	2010-06-17	1330	\N	97575	\N	\N
107967	GENERIC_DAY	0	0	2010-10-06	61308	\N	97575	\N	\N
107968	GENERIC_DAY	0	0	2010-07-12	50401	\N	97575	\N	\N
107969	GENERIC_DAY	0	0	2010-09-03	19496	\N	97575	\N	\N
107970	GENERIC_DAY	0	0	2010-08-05	40199	\N	97575	\N	\N
107971	GENERIC_DAY	0	0	2010-07-06	85043	\N	97575	\N	\N
107972	GENERIC_DAY	0	0	2010-10-14	50401	\N	97575	\N	\N
107973	GENERIC_DAY	0	0	2010-06-28	50401	\N	97575	\N	\N
107974	GENERIC_DAY	0	0	2010-06-15	85043	\N	97575	\N	\N
107975	GENERIC_DAY	0	0	2010-08-17	1330	\N	97575	\N	\N
107976	GENERIC_DAY	0	0	2010-07-26	1322	\N	97575	\N	\N
107977	GENERIC_DAY	0	0	2010-07-06	40199	\N	97575	\N	\N
107978	GENERIC_DAY	0	0	2010-07-30	19500	\N	97575	\N	\N
107979	GENERIC_DAY	0	0	2010-10-09	2728	\N	97575	\N	\N
107980	GENERIC_DAY	0	1	2010-07-20	19496	\N	97575	\N	\N
107981	GENERIC_DAY	0	0	2010-05-20	1320	\N	97575	\N	\N
107982	GENERIC_DAY	0	0	2010-06-14	1318	\N	97575	\N	\N
107983	GENERIC_DAY	0	0	2010-08-23	19500	\N	97575	\N	\N
107984	GENERIC_DAY	0	0	2010-09-06	1332	\N	97575	\N	\N
107985	GENERIC_DAY	0	0	2010-09-17	19496	\N	97575	\N	\N
107986	GENERIC_DAY	0	0	2010-05-14	19494	\N	97575	\N	\N
107987	GENERIC_DAY	0	0	2010-06-05	19494	\N	97575	\N	\N
107988	GENERIC_DAY	0	0	2010-08-14	19494	\N	97575	\N	\N
107989	GENERIC_DAY	0	0	2010-08-20	1326	\N	97575	\N	\N
107990	GENERIC_DAY	0	0	2010-09-20	1320	\N	97575	\N	\N
107991	GENERIC_DAY	0	0	2010-09-02	1332	\N	97575	\N	\N
107992	GENERIC_DAY	0	0	2010-06-02	61308	\N	97575	\N	\N
107993	GENERIC_DAY	0	2	2010-09-09	1322	\N	97575	\N	\N
107994	GENERIC_DAY	0	1	2010-06-14	19496	\N	97575	\N	\N
107995	GENERIC_DAY	0	0	2010-08-19	1316	\N	97575	\N	\N
107996	GENERIC_DAY	0	1	2010-06-09	19494	\N	97575	\N	\N
107997	GENERIC_DAY	0	0	2010-10-20	50401	\N	97575	\N	\N
107998	GENERIC_DAY	0	2	2010-07-12	1314	\N	97575	\N	\N
107999	GENERIC_DAY	0	0	2010-08-02	19498	\N	97575	\N	\N
108000	GENERIC_DAY	0	0	2010-09-18	85043	\N	97575	\N	\N
108001	GENERIC_DAY	0	0	2010-10-12	1330	\N	97575	\N	\N
108002	GENERIC_DAY	0	0	2010-07-27	1316	\N	97575	\N	\N
108003	GENERIC_DAY	0	0	2010-09-17	19498	\N	97575	\N	\N
108004	GENERIC_DAY	0	0	2010-07-18	40199	\N	97575	\N	\N
108005	GENERIC_DAY	0	2	2010-05-28	40199	\N	97575	\N	\N
108006	GENERIC_DAY	0	1	2010-06-07	1332	\N	97575	\N	\N
108007	GENERIC_DAY	0	0	2010-08-07	1332	\N	97575	\N	\N
108008	GENERIC_DAY	0	0	2010-05-15	19498	\N	97575	\N	\N
108009	GENERIC_DAY	0	1	2010-10-12	19494	\N	97575	\N	\N
108010	GENERIC_DAY	0	0	2010-08-10	1330	\N	97575	\N	\N
108011	GENERIC_DAY	0	0	2010-09-19	1324	\N	97575	\N	\N
108012	GENERIC_DAY	0	0	2010-06-12	40199	\N	97575	\N	\N
108013	GENERIC_DAY	0	0	2010-08-23	1316	\N	97575	\N	\N
108014	GENERIC_DAY	0	0	2010-09-12	1320	\N	97575	\N	\N
108015	GENERIC_DAY	0	0	2010-09-23	61308	\N	97575	\N	\N
108016	GENERIC_DAY	0	0	2010-05-30	1324	\N	97575	\N	\N
108017	GENERIC_DAY	0	0	2010-08-16	19498	\N	97575	\N	\N
108018	GENERIC_DAY	0	0	2010-06-14	1324	\N	97575	\N	\N
108019	GENERIC_DAY	0	0	2010-07-13	40199	\N	97575	\N	\N
108020	GENERIC_DAY	0	0	2010-05-21	19500	\N	97575	\N	\N
108021	GENERIC_DAY	0	0	2010-05-21	1314	\N	97575	\N	\N
108022	GENERIC_DAY	0	1	2010-05-05	40199	\N	97575	\N	\N
108023	GENERIC_DAY	0	0	2010-10-15	1332	\N	97575	\N	\N
108024	GENERIC_DAY	0	0	2010-06-10	50401	\N	97575	\N	\N
108025	GENERIC_DAY	0	0	2010-07-31	50401	\N	97575	\N	\N
108026	GENERIC_DAY	0	1	2010-07-13	1332	\N	97575	\N	\N
108027	GENERIC_DAY	0	0	2010-05-18	1324	\N	97575	\N	\N
108028	GENERIC_DAY	0	0	2010-08-04	61308	\N	97575	\N	\N
108029	GENERIC_DAY	0	0	2010-09-17	1322	\N	97575	\N	\N
108030	GENERIC_DAY	0	1	2010-09-06	19496	\N	97575	\N	\N
108031	GENERIC_DAY	0	0	2010-05-29	40199	\N	97575	\N	\N
108032	GENERIC_DAY	0	0	2010-07-10	1314	\N	97575	\N	\N
108033	GENERIC_DAY	0	0	2010-05-09	1318	\N	97575	\N	\N
108034	GENERIC_DAY	0	2	2010-05-27	1322	\N	97575	\N	\N
108035	GENERIC_DAY	0	0	2010-08-14	61308	\N	97575	\N	\N
108036	GENERIC_DAY	0	0	2010-07-28	1326	\N	97575	\N	\N
108037	GENERIC_DAY	0	0	2010-08-22	19496	\N	97575	\N	\N
108038	GENERIC_DAY	0	0	2010-10-03	1322	\N	97575	\N	\N
108039	GENERIC_DAY	0	0	2010-06-07	85043	\N	97575	\N	\N
108040	GENERIC_DAY	0	1	2010-04-30	1316	\N	97575	\N	\N
108041	GENERIC_DAY	0	1	2010-10-13	19496	\N	97575	\N	\N
108042	GENERIC_DAY	0	0	2010-06-04	19496	\N	97575	\N	\N
108043	GENERIC_DAY	0	0	2010-05-31	1330	\N	97575	\N	\N
108044	GENERIC_DAY	0	0	2010-09-01	1332	\N	97575	\N	\N
108045	GENERIC_DAY	0	1	2010-07-29	1324	\N	97575	\N	\N
108046	GENERIC_DAY	0	0	2010-05-01	1332	\N	97575	\N	\N
108047	GENERIC_DAY	0	0	2010-10-14	1322	\N	97575	\N	\N
108048	GENERIC_DAY	0	0	2010-05-19	19500	\N	97575	\N	\N
108049	GENERIC_DAY	0	0	2010-08-07	1324	\N	97575	\N	\N
108050	GENERIC_DAY	0	0	2010-04-30	1320	\N	97575	\N	\N
108051	GENERIC_DAY	0	0	2010-06-16	1326	\N	97575	\N	\N
108052	GENERIC_DAY	0	0	2010-07-29	85043	\N	97575	\N	\N
108053	GENERIC_DAY	0	0	2010-09-14	61308	\N	97575	\N	\N
108054	GENERIC_DAY	0	0	2010-10-19	1330	\N	97575	\N	\N
108055	GENERIC_DAY	0	0	2010-08-20	2728	\N	97575	\N	\N
108056	GENERIC_DAY	0	0	2010-07-02	1320	\N	97575	\N	\N
108057	GENERIC_DAY	0	0	2010-08-24	1316	\N	97575	\N	\N
108058	GENERIC_DAY	0	0	2010-09-25	19500	\N	97575	\N	\N
108059	GENERIC_DAY	0	1	2010-08-23	19494	\N	97575	\N	\N
108060	GENERIC_DAY	0	0	2010-07-04	1320	\N	97575	\N	\N
108061	GENERIC_DAY	0	1	2010-08-19	2728	\N	97575	\N	\N
108062	GENERIC_DAY	0	0	2010-07-22	1322	\N	97575	\N	\N
108063	GENERIC_DAY	0	0	2010-07-21	1332	\N	97575	\N	\N
108064	GENERIC_DAY	0	0	2010-07-27	1322	\N	97575	\N	\N
108065	GENERIC_DAY	0	2	2010-09-15	1322	\N	97575	\N	\N
108066	GENERIC_DAY	0	0	2010-05-14	1332	\N	97575	\N	\N
108067	GENERIC_DAY	0	0	2010-08-03	1330	\N	97575	\N	\N
108068	GENERIC_DAY	0	0	2010-08-17	40199	\N	97575	\N	\N
108069	GENERIC_DAY	0	0	2010-06-22	19500	\N	97575	\N	\N
108070	GENERIC_DAY	0	0	2010-09-13	85043	\N	97575	\N	\N
108071	GENERIC_DAY	0	0	2010-10-09	1318	\N	97575	\N	\N
108072	GENERIC_DAY	0	0	2010-05-12	2728	\N	97575	\N	\N
108073	GENERIC_DAY	0	0	2010-08-13	2728	\N	97575	\N	\N
108074	GENERIC_DAY	0	0	2010-08-28	40199	\N	97575	\N	\N
108075	GENERIC_DAY	0	1	2010-05-06	1322	\N	97575	\N	\N
108076	GENERIC_DAY	0	0	2010-05-18	19500	\N	97575	\N	\N
108077	GENERIC_DAY	0	1	2010-09-06	2728	\N	97575	\N	\N
108078	GENERIC_DAY	0	0	2010-07-26	19498	\N	97575	\N	\N
108079	GENERIC_DAY	0	0	2010-05-08	1330	\N	97575	\N	\N
108080	GENERIC_DAY	0	0	2010-06-13	1316	\N	97575	\N	\N
108081	GENERIC_DAY	0	0	2010-07-31	1328	\N	97575	\N	\N
108082	GENERIC_DAY	0	0	2010-09-30	85043	\N	97575	\N	\N
108083	GENERIC_DAY	0	1	2010-09-20	1318	\N	97575	\N	\N
108084	GENERIC_DAY	0	1	2010-05-13	1316	\N	97575	\N	\N
108085	GENERIC_DAY	0	0	2010-09-22	1320	\N	97575	\N	\N
108086	GENERIC_DAY	0	0	2010-08-15	1330	\N	97575	\N	\N
108087	GENERIC_DAY	0	1	2010-05-28	85043	\N	97575	\N	\N
108088	GENERIC_DAY	0	0	2010-08-27	1326	\N	97575	\N	\N
108089	GENERIC_DAY	0	0	2010-08-16	85043	\N	97575	\N	\N
108090	GENERIC_DAY	0	0	2010-07-03	40199	\N	97575	\N	\N
108091	GENERIC_DAY	0	0	2010-08-18	1320	\N	97575	\N	\N
108092	GENERIC_DAY	0	0	2010-10-01	2728	\N	97575	\N	\N
108093	GENERIC_DAY	0	0	2010-07-25	19494	\N	97575	\N	\N
108094	GENERIC_DAY	0	0	2010-06-11	19496	\N	97575	\N	\N
108095	GENERIC_DAY	0	0	2010-06-01	1324	\N	97575	\N	\N
108096	GENERIC_DAY	0	0	2010-10-11	1332	\N	97575	\N	\N
108097	GENERIC_DAY	0	0	2010-08-04	1328	\N	97575	\N	\N
108098	GENERIC_DAY	0	0	2010-08-06	2728	\N	97575	\N	\N
108099	GENERIC_DAY	0	0	2010-04-29	19500	\N	97575	\N	\N
108100	GENERIC_DAY	0	0	2010-05-20	40199	\N	97575	\N	\N
108101	GENERIC_DAY	0	0	2010-06-06	1314	\N	97575	\N	\N
108102	GENERIC_DAY	0	0	2010-08-31	61308	\N	97575	\N	\N
108103	GENERIC_DAY	0	0	2010-07-28	40199	\N	97575	\N	\N
108104	GENERIC_DAY	0	0	2010-08-14	1330	\N	97575	\N	\N
108105	GENERIC_DAY	0	0	2010-08-03	1326	\N	97575	\N	\N
108106	GENERIC_DAY	0	1	2010-09-24	85043	\N	97575	\N	\N
108107	GENERIC_DAY	0	0	2010-07-31	19494	\N	97575	\N	\N
108108	GENERIC_DAY	0	1	2010-09-30	19494	\N	97575	\N	\N
108109	GENERIC_DAY	0	0	2010-06-13	40199	\N	97575	\N	\N
108110	GENERIC_DAY	0	0	2010-06-07	1324	\N	97575	\N	\N
108111	GENERIC_DAY	0	1	2010-07-30	50401	\N	97575	\N	\N
108112	GENERIC_DAY	0	0	2010-10-08	1322	\N	97575	\N	\N
108113	GENERIC_DAY	0	0	2010-05-07	1332	\N	97575	\N	\N
108114	GENERIC_DAY	0	0	2010-07-28	61308	\N	97575	\N	\N
108115	GENERIC_DAY	0	0	2010-09-28	1330	\N	97575	\N	\N
108116	GENERIC_DAY	0	1	2010-06-04	50401	\N	97575	\N	\N
108117	GENERIC_DAY	0	0	2010-04-29	19498	\N	97575	\N	\N
108118	GENERIC_DAY	0	0	2010-06-13	1330	\N	97575	\N	\N
108119	GENERIC_DAY	0	0	2010-05-21	2728	\N	97575	\N	\N
108120	GENERIC_DAY	0	1	2010-08-25	19494	\N	97575	\N	\N
108121	GENERIC_DAY	0	0	2010-10-18	1326	\N	97575	\N	\N
108122	GENERIC_DAY	0	0	2010-10-09	1332	\N	97575	\N	\N
108123	GENERIC_DAY	0	1	2010-10-05	19494	\N	97575	\N	\N
108124	GENERIC_DAY	0	1	2010-08-02	1318	\N	97575	\N	\N
108125	GENERIC_DAY	0	0	2010-10-16	19496	\N	97575	\N	\N
108126	GENERIC_DAY	0	0	2010-10-08	1330	\N	97575	\N	\N
108127	GENERIC_DAY	0	0	2010-08-14	85043	\N	97575	\N	\N
108128	GENERIC_DAY	0	0	2010-09-01	61308	\N	97575	\N	\N
108129	GENERIC_DAY	0	0	2010-07-11	1328	\N	97575	\N	\N
108130	GENERIC_DAY	0	0	2010-08-13	1314	\N	97575	\N	\N
108131	GENERIC_DAY	0	2	2010-07-09	1316	\N	97575	\N	\N
108132	GENERIC_DAY	0	0	2010-10-06	19498	\N	97575	\N	\N
108133	GENERIC_DAY	0	0	2010-10-07	1332	\N	97575	\N	\N
108134	GENERIC_DAY	0	0	2010-10-13	1330	\N	97575	\N	\N
108135	GENERIC_DAY	0	1	2010-09-27	2728	\N	97575	\N	\N
108136	GENERIC_DAY	0	0	2010-09-02	40199	\N	97575	\N	\N
108137	GENERIC_DAY	0	1	2010-09-27	1314	\N	97575	\N	\N
108138	GENERIC_DAY	0	0	2010-06-02	1314	\N	97575	\N	\N
108139	GENERIC_DAY	0	0	2010-09-01	1326	\N	97575	\N	\N
108140	GENERIC_DAY	0	2	2010-09-03	1316	\N	97575	\N	\N
108141	GENERIC_DAY	0	2	2010-05-14	85043	\N	97575	\N	\N
108142	GENERIC_DAY	0	1	2010-08-06	85043	\N	97575	\N	\N
108143	GENERIC_DAY	0	0	2010-05-09	19494	\N	97575	\N	\N
108144	GENERIC_DAY	0	1	2010-06-23	1332	\N	97575	\N	\N
108145	GENERIC_DAY	0	0	2010-06-03	50401	\N	97575	\N	\N
108146	GENERIC_DAY	0	0	2010-08-27	1322	\N	97575	\N	\N
108147	GENERIC_DAY	0	2	2010-09-20	1322	\N	97575	\N	\N
108148	GENERIC_DAY	0	0	2010-08-01	2728	\N	97575	\N	\N
108149	GENERIC_DAY	0	0	2010-08-10	1328	\N	97575	\N	\N
108150	GENERIC_DAY	0	0	2010-07-10	50401	\N	97575	\N	\N
108151	GENERIC_DAY	0	0	2010-06-27	50401	\N	97575	\N	\N
108152	GENERIC_DAY	0	1	2010-09-30	1314	\N	97575	\N	\N
108153	GENERIC_DAY	0	0	2010-06-16	1318	\N	97575	\N	\N
108154	GENERIC_DAY	0	0	2010-05-20	85043	\N	97575	\N	\N
108155	GENERIC_DAY	0	0	2010-10-07	85043	\N	97575	\N	\N
108156	GENERIC_DAY	0	0	2010-05-13	19498	\N	97575	\N	\N
108157	GENERIC_DAY	0	0	2010-10-06	40199	\N	97575	\N	\N
108158	GENERIC_DAY	0	1	2010-05-13	61308	\N	97575	\N	\N
108159	GENERIC_DAY	0	0	2010-08-28	1328	\N	97575	\N	\N
108160	GENERIC_DAY	0	0	2010-06-15	1320	\N	97575	\N	\N
108161	GENERIC_DAY	0	1	2010-09-15	2728	\N	97575	\N	\N
108162	GENERIC_DAY	0	0	2010-09-23	1328	\N	97575	\N	\N
108163	GENERIC_DAY	0	0	2010-07-03	19494	\N	97575	\N	\N
108164	GENERIC_DAY	0	0	2010-06-26	1314	\N	97575	\N	\N
108165	GENERIC_DAY	0	0	2010-05-15	40199	\N	97575	\N	\N
108166	GENERIC_DAY	0	0	2010-08-18	1316	\N	97575	\N	\N
108167	GENERIC_DAY	0	0	2010-05-30	85043	\N	97575	\N	\N
108168	GENERIC_DAY	0	0	2010-07-24	2728	\N	97575	\N	\N
108169	GENERIC_DAY	0	0	2010-08-25	1320	\N	97575	\N	\N
108170	GENERIC_DAY	0	0	2010-06-02	19500	\N	97575	\N	\N
108171	GENERIC_DAY	0	0	2010-10-13	85043	\N	97575	\N	\N
108172	GENERIC_DAY	0	0	2010-05-22	40199	\N	97575	\N	\N
108173	GENERIC_DAY	0	0	2010-07-04	1326	\N	97575	\N	\N
108174	GENERIC_DAY	0	1	2010-08-12	19494	\N	97575	\N	\N
108175	GENERIC_DAY	0	1	2010-09-20	1314	\N	97575	\N	\N
108176	GENERIC_DAY	0	0	2010-08-15	1326	\N	97575	\N	\N
108177	GENERIC_DAY	0	0	2010-08-28	1316	\N	97575	\N	\N
108178	GENERIC_DAY	0	0	2010-07-17	1324	\N	97575	\N	\N
108179	GENERIC_DAY	0	1	2010-09-29	19494	\N	97575	\N	\N
108180	GENERIC_DAY	0	0	2010-06-05	19498	\N	97575	\N	\N
108181	GENERIC_DAY	0	0	2010-05-25	19498	\N	97575	\N	\N
108182	GENERIC_DAY	0	0	2010-07-25	1326	\N	97575	\N	\N
108183	GENERIC_DAY	0	1	2010-09-20	1324	\N	97575	\N	\N
108184	GENERIC_DAY	0	0	2010-10-09	1330	\N	97575	\N	\N
108185	GENERIC_DAY	0	1	2010-10-14	1318	\N	97575	\N	\N
108186	GENERIC_DAY	0	0	2010-05-13	1320	\N	97575	\N	\N
108187	GENERIC_DAY	0	0	2010-08-09	1326	\N	97575	\N	\N
108188	GENERIC_DAY	0	2	2010-06-23	1314	\N	97575	\N	\N
108189	GENERIC_DAY	0	0	2010-09-20	61308	\N	97575	\N	\N
108190	GENERIC_DAY	0	0	2010-06-22	85043	\N	97575	\N	\N
108191	GENERIC_DAY	0	1	2010-09-30	1318	\N	97575	\N	\N
108192	GENERIC_DAY	0	0	2010-09-24	1330	\N	97575	\N	\N
108193	GENERIC_DAY	0	0	2010-09-25	19498	\N	97575	\N	\N
108194	GENERIC_DAY	0	0	2010-08-09	40199	\N	97575	\N	\N
108195	GENERIC_DAY	0	0	2010-06-29	1326	\N	97575	\N	\N
108196	GENERIC_DAY	0	0	2010-08-21	19496	\N	97575	\N	\N
108197	GENERIC_DAY	0	0	2010-05-25	1314	\N	97575	\N	\N
108198	GENERIC_DAY	0	0	2010-05-11	1318	\N	97575	\N	\N
108199	GENERIC_DAY	0	1	2010-08-12	1324	\N	97575	\N	\N
108200	GENERIC_DAY	0	0	2010-06-22	1330	\N	97575	\N	\N
108201	GENERIC_DAY	0	0	2010-06-24	1330	\N	97575	\N	\N
108202	GENERIC_DAY	0	0	2010-08-12	1326	\N	97575	\N	\N
108203	GENERIC_DAY	0	0	2010-08-23	61308	\N	97575	\N	\N
108204	GENERIC_DAY	0	0	2010-05-26	1316	\N	97575	\N	\N
108205	GENERIC_DAY	0	0	2010-07-31	1314	\N	97575	\N	\N
108206	GENERIC_DAY	0	0	2010-09-01	19498	\N	97575	\N	\N
108207	GENERIC_DAY	0	0	2010-06-06	19494	\N	97575	\N	\N
108208	GENERIC_DAY	0	0	2010-06-23	85043	\N	97575	\N	\N
108209	GENERIC_DAY	0	0	2010-10-03	1318	\N	97575	\N	\N
108210	GENERIC_DAY	0	0	2010-05-19	85043	\N	97575	\N	\N
108211	GENERIC_DAY	0	0	2010-08-27	1332	\N	97575	\N	\N
108212	GENERIC_DAY	0	0	2010-08-20	1314	\N	97575	\N	\N
108213	GENERIC_DAY	0	0	2010-07-03	1330	\N	97575	\N	\N
108214	GENERIC_DAY	0	1	2010-09-13	2728	\N	97575	\N	\N
108215	GENERIC_DAY	0	0	2010-07-24	85043	\N	97575	\N	\N
108216	GENERIC_DAY	0	0	2010-06-18	1330	\N	97575	\N	\N
108217	GENERIC_DAY	0	0	2010-05-25	61308	\N	97575	\N	\N
108218	GENERIC_DAY	0	0	2010-05-26	19498	\N	97575	\N	\N
108219	GENERIC_DAY	0	1	2010-07-20	1328	\N	97575	\N	\N
108220	GENERIC_DAY	0	0	2010-08-16	61308	\N	97575	\N	\N
108221	GENERIC_DAY	0	0	2010-08-21	61308	\N	97575	\N	\N
108222	GENERIC_DAY	0	1	2010-08-31	1318	\N	97575	\N	\N
108223	GENERIC_DAY	0	0	2010-05-16	1322	\N	97575	\N	\N
108224	GENERIC_DAY	0	0	2010-09-18	1330	\N	97575	\N	\N
108225	GENERIC_DAY	0	0	2010-05-09	2728	\N	97575	\N	\N
108226	GENERIC_DAY	0	0	2010-05-21	1328	\N	97575	\N	\N
108227	GENERIC_DAY	0	0	2010-09-14	1326	\N	97575	\N	\N
108228	GENERIC_DAY	0	0	2010-07-17	1314	\N	97575	\N	\N
108229	GENERIC_DAY	0	0	2010-08-24	1326	\N	97575	\N	\N
108230	GENERIC_DAY	0	0	2010-08-22	85043	\N	97575	\N	\N
108231	GENERIC_DAY	0	0	2010-09-25	1324	\N	97575	\N	\N
108232	GENERIC_DAY	0	0	2010-10-03	85043	\N	97575	\N	\N
108233	GENERIC_DAY	0	0	2010-08-03	1328	\N	97575	\N	\N
108234	GENERIC_DAY	0	0	2010-09-25	1332	\N	97575	\N	\N
108235	GENERIC_DAY	0	0	2010-05-26	1324	\N	97575	\N	\N
108236	GENERIC_DAY	0	2	2010-08-03	19496	\N	97575	\N	\N
108237	GENERIC_DAY	0	0	2010-09-21	19500	\N	97575	\N	\N
108238	GENERIC_DAY	0	0	2010-08-15	2728	\N	97575	\N	\N
108239	GENERIC_DAY	0	0	2010-07-14	1316	\N	97575	\N	\N
108240	GENERIC_DAY	0	0	2010-07-18	1320	\N	97575	\N	\N
108241	GENERIC_DAY	0	1	2010-09-24	50401	\N	97575	\N	\N
108242	GENERIC_DAY	0	1	2010-05-11	85043	\N	97575	\N	\N
108243	GENERIC_DAY	0	0	2010-08-29	40199	\N	97575	\N	\N
108244	GENERIC_DAY	0	0	2010-09-11	2728	\N	97575	\N	\N
108245	GENERIC_DAY	0	0	2010-07-07	85043	\N	97575	\N	\N
108246	GENERIC_DAY	0	1	2010-07-02	85043	\N	97575	\N	\N
108247	GENERIC_DAY	0	0	2010-10-08	1318	\N	97575	\N	\N
108248	GENERIC_DAY	0	0	2010-06-22	1318	\N	97575	\N	\N
108249	GENERIC_DAY	0	0	2010-09-25	1318	\N	97575	\N	\N
108250	GENERIC_DAY	0	0	2010-07-17	19496	\N	97575	\N	\N
108251	GENERIC_DAY	0	0	2010-07-15	61308	\N	97575	\N	\N
108252	GENERIC_DAY	0	2	2010-06-17	1322	\N	97575	\N	\N
108253	GENERIC_DAY	0	2	2010-08-04	19496	\N	97575	\N	\N
108254	GENERIC_DAY	0	1	2010-08-03	1324	\N	97575	\N	\N
108255	GENERIC_DAY	0	0	2010-05-14	19500	\N	97575	\N	\N
108256	GENERIC_DAY	0	0	2010-08-10	1326	\N	97575	\N	\N
108257	GENERIC_DAY	0	0	2010-10-17	1328	\N	97575	\N	\N
108258	GENERIC_DAY	0	1	2010-06-23	1328	\N	97575	\N	\N
108259	GENERIC_DAY	0	0	2010-08-28	1322	\N	97575	\N	\N
108260	GENERIC_DAY	0	0	2010-05-22	1328	\N	97575	\N	\N
108261	GENERIC_DAY	0	0	2010-08-29	1316	\N	97575	\N	\N
108262	GENERIC_DAY	0	1	2010-09-15	1318	\N	97575	\N	\N
108263	GENERIC_DAY	0	1	2010-07-09	85043	\N	97575	\N	\N
108264	GENERIC_DAY	0	1	2010-05-11	40199	\N	97575	\N	\N
108265	GENERIC_DAY	0	0	2010-06-08	1330	\N	97575	\N	\N
108266	GENERIC_DAY	0	0	2010-05-22	1326	\N	97575	\N	\N
108267	GENERIC_DAY	0	0	2010-08-13	1322	\N	97575	\N	\N
108268	GENERIC_DAY	0	1	2010-09-13	19494	\N	97575	\N	\N
108269	GENERIC_DAY	0	1	2010-05-12	1332	\N	97575	\N	\N
108270	GENERIC_DAY	0	0	2010-07-25	1314	\N	97575	\N	\N
108271	GENERIC_DAY	0	1	2010-10-06	19494	\N	97575	\N	\N
108272	GENERIC_DAY	0	0	2010-10-06	1316	\N	97575	\N	\N
108273	GENERIC_DAY	0	0	2010-04-29	1326	\N	97575	\N	\N
108274	GENERIC_DAY	0	0	2010-07-26	1326	\N	97575	\N	\N
108275	GENERIC_DAY	0	1	2010-07-20	1324	\N	97575	\N	\N
108276	GENERIC_DAY	0	1	2010-05-06	19494	\N	97575	\N	\N
108277	GENERIC_DAY	0	0	2010-07-21	50401	\N	97575	\N	\N
108278	GENERIC_DAY	0	0	2010-06-19	1314	\N	97575	\N	\N
108279	GENERIC_DAY	0	0	2010-07-10	1322	\N	97575	\N	\N
108280	GENERIC_DAY	0	0	2010-06-01	40199	\N	97575	\N	\N
108281	GENERIC_DAY	0	0	2010-06-19	1332	\N	97575	\N	\N
108282	GENERIC_DAY	0	0	2010-10-17	1330	\N	97575	\N	\N
108283	GENERIC_DAY	0	0	2010-09-27	50401	\N	97575	\N	\N
108284	GENERIC_DAY	0	1	2010-07-15	1324	\N	97575	\N	\N
108285	GENERIC_DAY	0	1	2010-07-12	2728	\N	97575	\N	\N
108286	GENERIC_DAY	0	0	2010-09-28	19498	\N	97575	\N	\N
108287	GENERIC_DAY	0	1	2010-08-23	2728	\N	97575	\N	\N
108288	GENERIC_DAY	0	0	2010-05-23	19500	\N	97575	\N	\N
108289	GENERIC_DAY	0	2	2010-07-02	61308	\N	97575	\N	\N
108290	GENERIC_DAY	0	1	2010-10-15	50401	\N	97575	\N	\N
108291	GENERIC_DAY	0	0	2010-07-09	19496	\N	97575	\N	\N
108292	GENERIC_DAY	0	1	2010-05-12	40199	\N	97575	\N	\N
108293	GENERIC_DAY	0	0	2010-09-05	50401	\N	97575	\N	\N
108294	GENERIC_DAY	0	0	2010-09-24	1332	\N	97575	\N	\N
108295	GENERIC_DAY	0	0	2010-07-28	19500	\N	97575	\N	\N
108296	GENERIC_DAY	0	0	2010-06-25	1320	\N	97575	\N	\N
108297	GENERIC_DAY	0	0	2010-09-01	40199	\N	97575	\N	\N
108298	GENERIC_DAY	0	0	2010-08-02	61308	\N	97575	\N	\N
108299	GENERIC_DAY	0	0	2010-10-04	40199	\N	97575	\N	\N
108300	GENERIC_DAY	0	0	2010-04-30	1318	\N	97575	\N	\N
108301	GENERIC_DAY	0	0	2010-08-21	19494	\N	97575	\N	\N
108302	GENERIC_DAY	0	2	2010-10-18	19494	\N	97575	\N	\N
108303	GENERIC_DAY	0	0	2010-07-22	1332	\N	97575	\N	\N
108304	GENERIC_DAY	0	0	2010-06-04	1330	\N	97575	\N	\N
108305	GENERIC_DAY	0	0	2010-05-10	61308	\N	97575	\N	\N
108306	GENERIC_DAY	0	0	2010-07-11	1318	\N	97575	\N	\N
108307	GENERIC_DAY	0	0	2010-09-11	19496	\N	97575	\N	\N
108308	GENERIC_DAY	0	0	2010-05-10	1318	\N	97575	\N	\N
108309	GENERIC_DAY	0	0	2010-08-24	1330	\N	97575	\N	\N
108310	GENERIC_DAY	0	0	2010-08-21	2728	\N	97575	\N	\N
108311	GENERIC_DAY	0	0	2010-09-14	85043	\N	97575	\N	\N
108312	GENERIC_DAY	0	0	2010-07-06	1316	\N	97575	\N	\N
108313	GENERIC_DAY	0	0	2010-07-21	19500	\N	97575	\N	\N
108314	GENERIC_DAY	0	1	2010-08-12	1318	\N	97575	\N	\N
108315	GENERIC_DAY	0	0	2010-05-12	1320	\N	97575	\N	\N
108316	GENERIC_DAY	0	0	2010-09-16	50401	\N	97575	\N	\N
108317	GENERIC_DAY	0	1	2010-09-02	1324	\N	97575	\N	\N
108318	GENERIC_DAY	0	0	2010-09-23	40199	\N	97575	\N	\N
108319	GENERIC_DAY	0	2	2010-05-26	19496	\N	97575	\N	\N
108320	GENERIC_DAY	0	0	2010-07-23	1324	\N	97575	\N	\N
108321	GENERIC_DAY	0	1	2010-08-24	2728	\N	97575	\N	\N
108322	GENERIC_DAY	0	0	2010-10-16	1320	\N	97575	\N	\N
108323	GENERIC_DAY	0	1	2010-06-08	2728	\N	97575	\N	\N
108324	GENERIC_DAY	0	0	2010-05-19	1326	\N	97575	\N	\N
108325	GENERIC_DAY	0	0	2010-05-07	1328	\N	97575	\N	\N
108326	GENERIC_DAY	0	0	2010-05-06	1318	\N	97575	\N	\N
108327	GENERIC_DAY	0	1	2010-07-20	19494	\N	97575	\N	\N
108328	GENERIC_DAY	0	0	2010-06-13	19494	\N	97575	\N	\N
108329	GENERIC_DAY	0	0	2010-09-22	19500	\N	97575	\N	\N
108330	GENERIC_DAY	0	0	2010-10-04	1328	\N	97575	\N	\N
108331	GENERIC_DAY	0	0	2010-08-11	61308	\N	97575	\N	\N
108332	GENERIC_DAY	0	0	2010-07-13	50401	\N	97575	\N	\N
108333	GENERIC_DAY	0	0	2010-08-23	85043	\N	97575	\N	\N
108334	GENERIC_DAY	0	0	2010-07-03	19500	\N	97575	\N	\N
108335	GENERIC_DAY	0	0	2010-05-11	1320	\N	97575	\N	\N
108336	GENERIC_DAY	0	0	2010-07-23	1320	\N	97575	\N	\N
108337	GENERIC_DAY	0	1	2010-05-13	85043	\N	97575	\N	\N
108338	GENERIC_DAY	0	2	2010-06-23	19496	\N	97575	\N	\N
108339	GENERIC_DAY	0	0	2010-08-12	1322	\N	97575	\N	\N
108340	GENERIC_DAY	0	0	2010-09-19	1326	\N	97575	\N	\N
108341	GENERIC_DAY	0	0	2010-10-10	1314	\N	97575	\N	\N
108342	GENERIC_DAY	0	0	2010-10-17	19496	\N	97575	\N	\N
108343	GENERIC_DAY	0	0	2010-09-10	1332	\N	97575	\N	\N
108344	GENERIC_DAY	0	0	2010-09-25	19496	\N	97575	\N	\N
108345	GENERIC_DAY	0	1	2010-05-21	85043	\N	97575	\N	\N
108346	GENERIC_DAY	0	0	2010-09-04	19500	\N	97575	\N	\N
108347	GENERIC_DAY	0	0	2010-05-10	1320	\N	97575	\N	\N
108348	GENERIC_DAY	0	0	2010-06-09	1324	\N	97575	\N	\N
108349	GENERIC_DAY	0	0	2010-07-23	1332	\N	97575	\N	\N
108350	GENERIC_DAY	0	0	2010-08-22	1332	\N	97575	\N	\N
108351	GENERIC_DAY	0	1	2010-06-15	1332	\N	97575	\N	\N
108352	GENERIC_DAY	0	2	2010-06-10	19496	\N	97575	\N	\N
108353	GENERIC_DAY	0	0	2010-08-19	1322	\N	97575	\N	\N
108354	GENERIC_DAY	0	1	2010-06-28	1332	\N	97575	\N	\N
108355	GENERIC_DAY	0	1	2010-10-12	1324	\N	97575	\N	\N
108356	GENERIC_DAY	0	0	2010-08-05	50401	\N	97575	\N	\N
108357	GENERIC_DAY	0	0	2010-09-04	1322	\N	97575	\N	\N
108358	GENERIC_DAY	0	0	2010-09-22	19498	\N	97575	\N	\N
108359	GENERIC_DAY	0	0	2010-06-02	1324	\N	97575	\N	\N
108360	GENERIC_DAY	0	0	2010-05-04	19500	\N	97575	\N	\N
108361	GENERIC_DAY	0	0	2010-06-11	1332	\N	97575	\N	\N
108362	GENERIC_DAY	0	0	2010-08-19	50401	\N	97575	\N	\N
108363	GENERIC_DAY	0	0	2010-05-30	19500	\N	97575	\N	\N
108364	GENERIC_DAY	0	0	2010-10-14	1324	\N	97575	\N	\N
108365	GENERIC_DAY	0	1	2010-10-05	19496	\N	97575	\N	\N
108366	GENERIC_DAY	0	0	2010-09-27	19500	\N	97575	\N	\N
108367	GENERIC_DAY	0	0	2010-08-29	1318	\N	97575	\N	\N
108368	GENERIC_DAY	0	0	2010-09-30	40199	\N	97575	\N	\N
108369	GENERIC_DAY	0	1	2010-09-10	85043	\N	97575	\N	\N
108370	GENERIC_DAY	0	0	2010-06-26	2728	\N	97575	\N	\N
108371	GENERIC_DAY	0	1	2010-10-04	2728	\N	97575	\N	\N
108372	GENERIC_DAY	0	0	2010-07-24	1318	\N	97575	\N	\N
108373	GENERIC_DAY	0	0	2010-07-19	61308	\N	97575	\N	\N
108374	GENERIC_DAY	0	0	2010-06-12	1314	\N	97575	\N	\N
108375	GENERIC_DAY	0	1	2010-05-10	85043	\N	97575	\N	\N
108376	GENERIC_DAY	0	0	2010-09-21	1316	\N	97575	\N	\N
108377	GENERIC_DAY	0	0	2010-08-10	1332	\N	97575	\N	\N
108378	GENERIC_DAY	0	0	2010-07-07	1330	\N	97575	\N	\N
108379	GENERIC_DAY	0	1	2010-07-21	1324	\N	97575	\N	\N
108380	GENERIC_DAY	0	1	2010-10-06	1324	\N	97575	\N	\N
108381	GENERIC_DAY	0	0	2010-05-21	1326	\N	97575	\N	\N
108382	GENERIC_DAY	0	0	2010-10-19	40199	\N	97575	\N	\N
108383	GENERIC_DAY	0	2	2010-08-12	1314	\N	97575	\N	\N
108384	GENERIC_DAY	0	0	2010-08-06	19496	\N	97575	\N	\N
108385	GENERIC_DAY	0	0	2010-08-27	19496	\N	97575	\N	\N
108386	GENERIC_DAY	0	0	2010-05-02	1322	\N	97575	\N	\N
108387	GENERIC_DAY	0	0	2010-08-21	19498	\N	97575	\N	\N
108388	GENERIC_DAY	0	0	2010-07-02	1322	\N	97575	\N	\N
108389	GENERIC_DAY	0	0	2010-09-21	1320	\N	97575	\N	\N
108390	GENERIC_DAY	0	2	2010-07-26	19496	\N	97575	\N	\N
108391	GENERIC_DAY	0	0	2010-07-26	85043	\N	97575	\N	\N
108392	GENERIC_DAY	0	1	2010-05-06	40199	\N	97575	\N	\N
108393	GENERIC_DAY	0	1	2010-08-18	19494	\N	97575	\N	\N
108394	GENERIC_DAY	0	0	2010-07-30	1318	\N	97575	\N	\N
108395	GENERIC_DAY	0	0	2010-08-18	19498	\N	97575	\N	\N
108396	GENERIC_DAY	0	0	2010-08-21	1320	\N	97575	\N	\N
108397	GENERIC_DAY	0	0	2010-08-01	1316	\N	97575	\N	\N
108398	GENERIC_DAY	0	0	2010-08-21	40199	\N	97575	\N	\N
108399	GENERIC_DAY	0	0	2010-08-04	1320	\N	97575	\N	\N
108400	GENERIC_DAY	0	1	2010-09-06	19494	\N	97575	\N	\N
108401	GENERIC_DAY	0	1	2010-10-07	1314	\N	97575	\N	\N
108402	GENERIC_DAY	0	0	2010-08-23	1320	\N	97575	\N	\N
108403	GENERIC_DAY	0	2	2010-06-04	40199	\N	97575	\N	\N
108404	GENERIC_DAY	0	0	2010-08-26	50401	\N	97575	\N	\N
108405	GENERIC_DAY	0	0	2010-08-15	50401	\N	97575	\N	\N
108406	GENERIC_DAY	0	0	2010-04-30	1330	\N	97575	\N	\N
108407	GENERIC_DAY	0	1	2010-07-12	1332	\N	97575	\N	\N
108408	GENERIC_DAY	0	0	2010-06-13	61308	\N	97575	\N	\N
108409	GENERIC_DAY	0	0	2010-05-28	19498	\N	97575	\N	\N
108410	GENERIC_DAY	0	0	2010-05-02	19496	\N	97575	\N	\N
108411	GENERIC_DAY	0	0	2010-08-26	19498	\N	97575	\N	\N
108412	GENERIC_DAY	0	0	2010-06-12	61308	\N	97575	\N	\N
108413	GENERIC_DAY	0	0	2010-05-06	85043	\N	97575	\N	\N
108414	GENERIC_DAY	0	0	2010-09-25	1328	\N	97575	\N	\N
108415	GENERIC_DAY	0	0	2010-08-06	1314	\N	97575	\N	\N
108416	GENERIC_DAY	0	1	2010-09-28	1324	\N	97575	\N	\N
108417	GENERIC_DAY	0	0	2010-08-11	19500	\N	97575	\N	\N
108418	GENERIC_DAY	0	0	2010-09-29	40199	\N	97575	\N	\N
108419	GENERIC_DAY	0	1	2010-08-03	1318	\N	97575	\N	\N
108420	GENERIC_DAY	0	0	2010-09-10	1330	\N	97575	\N	\N
108421	GENERIC_DAY	0	0	2010-05-09	40199	\N	97575	\N	\N
108422	GENERIC_DAY	0	0	2010-08-14	40199	\N	97575	\N	\N
108423	GENERIC_DAY	0	0	2010-07-30	19494	\N	97575	\N	\N
108424	GENERIC_DAY	0	0	2010-07-10	19498	\N	97575	\N	\N
108425	GENERIC_DAY	0	0	2010-05-09	1328	\N	97575	\N	\N
108426	GENERIC_DAY	0	0	2010-10-02	19500	\N	97575	\N	\N
108427	GENERIC_DAY	0	0	2010-09-21	1328	\N	97575	\N	\N
108428	GENERIC_DAY	0	0	2010-10-02	50401	\N	97575	\N	\N
108429	GENERIC_DAY	0	0	2010-08-29	61308	\N	97575	\N	\N
108430	GENERIC_DAY	0	0	2010-06-29	85043	\N	97575	\N	\N
108431	GENERIC_DAY	0	2	2010-08-03	1314	\N	97575	\N	\N
108432	GENERIC_DAY	0	1	2010-07-27	19494	\N	97575	\N	\N
108433	GENERIC_DAY	0	0	2010-08-07	1328	\N	97575	\N	\N
108434	GENERIC_DAY	0	0	2010-09-29	19498	\N	97575	\N	\N
108435	GENERIC_DAY	0	0	2010-06-16	1316	\N	97575	\N	\N
108436	GENERIC_DAY	0	0	2010-07-07	1320	\N	97575	\N	\N
108437	GENERIC_DAY	0	0	2010-09-04	61308	\N	97575	\N	\N
108438	GENERIC_DAY	0	0	2010-08-29	19498	\N	97575	\N	\N
108439	GENERIC_DAY	0	0	2010-09-28	1326	\N	97575	\N	\N
108440	GENERIC_DAY	0	0	2010-06-23	1320	\N	97575	\N	\N
108441	GENERIC_DAY	0	0	2010-05-15	1322	\N	97575	\N	\N
108442	GENERIC_DAY	0	2	2010-04-30	85043	\N	97575	\N	\N
108443	GENERIC_DAY	0	0	2010-06-22	1316	\N	97575	\N	\N
108444	GENERIC_DAY	0	1	2010-08-11	19494	\N	97575	\N	\N
108445	GENERIC_DAY	0	1	2010-07-26	19494	\N	97575	\N	\N
108446	GENERIC_DAY	0	0	2010-07-13	1322	\N	97575	\N	\N
108447	GENERIC_DAY	0	0	2010-06-21	40199	\N	97575	\N	\N
108448	GENERIC_DAY	0	0	2010-08-02	40199	\N	97575	\N	\N
108449	GENERIC_DAY	0	0	2010-06-19	19496	\N	97575	\N	\N
108450	GENERIC_DAY	0	0	2010-10-19	1326	\N	97575	\N	\N
108451	GENERIC_DAY	0	0	2010-05-16	50401	\N	97575	\N	\N
108452	GENERIC_DAY	0	0	2010-07-13	1330	\N	97575	\N	\N
108453	GENERIC_DAY	0	0	2010-10-12	19500	\N	97575	\N	\N
108454	GENERIC_DAY	0	0	2010-05-08	61308	\N	97575	\N	\N
108455	GENERIC_DAY	0	0	2010-09-14	1316	\N	97575	\N	\N
108456	GENERIC_DAY	0	1	2010-10-14	1332	\N	97575	\N	\N
108457	GENERIC_DAY	0	2	2010-07-29	1314	\N	97575	\N	\N
108458	GENERIC_DAY	0	0	2010-09-06	40199	\N	97575	\N	\N
108459	GENERIC_DAY	0	0	2010-06-04	19494	\N	97575	\N	\N
108460	GENERIC_DAY	0	0	2010-10-01	19500	\N	97575	\N	\N
108461	GENERIC_DAY	0	0	2010-09-09	40199	\N	97575	\N	\N
108462	GENERIC_DAY	0	1	2010-10-01	50401	\N	97575	\N	\N
108463	GENERIC_DAY	0	0	2010-09-19	19500	\N	97575	\N	\N
108464	GENERIC_DAY	0	0	2010-10-09	50401	\N	97575	\N	\N
108465	GENERIC_DAY	0	1	2010-09-28	19496	\N	97575	\N	\N
108466	GENERIC_DAY	0	1	2010-07-14	2728	\N	97575	\N	\N
108467	GENERIC_DAY	0	0	2010-07-03	1316	\N	97575	\N	\N
108468	GENERIC_DAY	0	0	2010-08-25	85043	\N	97575	\N	\N
108469	GENERIC_DAY	0	0	2010-09-26	1316	\N	97575	\N	\N
108470	GENERIC_DAY	0	0	2010-05-29	1326	\N	97575	\N	\N
108471	GENERIC_DAY	0	0	2010-08-27	2728	\N	97575	\N	\N
108472	GENERIC_DAY	0	0	2010-05-19	19498	\N	97575	\N	\N
108473	GENERIC_DAY	0	0	2010-10-16	1326	\N	97575	\N	\N
108474	GENERIC_DAY	0	0	2010-06-25	1324	\N	97575	\N	\N
108475	GENERIC_DAY	0	0	2010-05-31	19498	\N	97575	\N	\N
108476	GENERIC_DAY	0	0	2010-09-29	50401	\N	97575	\N	\N
108477	GENERIC_DAY	0	1	2010-09-20	2728	\N	97575	\N	\N
108478	GENERIC_DAY	0	0	2010-09-09	50401	\N	97575	\N	\N
108479	GENERIC_DAY	0	0	2010-08-31	1332	\N	97575	\N	\N
108480	GENERIC_DAY	0	0	2010-06-19	1318	\N	97575	\N	\N
108481	GENERIC_DAY	0	0	2010-06-26	19494	\N	97575	\N	\N
108482	GENERIC_DAY	0	2	2010-10-18	2728	\N	97575	\N	\N
108483	GENERIC_DAY	0	0	2010-07-06	1318	\N	97575	\N	\N
108484	GENERIC_DAY	0	0	2010-10-18	19498	\N	97575	\N	\N
108485	GENERIC_DAY	0	0	2010-08-19	1328	\N	97575	\N	\N
108486	GENERIC_DAY	0	0	2010-05-04	85043	\N	97575	\N	\N
108487	GENERIC_DAY	0	0	2010-07-02	1332	\N	97575	\N	\N
108488	GENERIC_DAY	0	1	2010-07-21	19494	\N	97575	\N	\N
108489	GENERIC_DAY	0	0	2010-07-15	1322	\N	97575	\N	\N
108490	GENERIC_DAY	0	1	2010-05-05	2728	\N	97575	\N	\N
108491	GENERIC_DAY	0	0	2010-10-02	1316	\N	97575	\N	\N
108492	GENERIC_DAY	0	0	2010-06-06	1326	\N	97575	\N	\N
108493	GENERIC_DAY	0	0	2010-06-12	19496	\N	97575	\N	\N
108494	GENERIC_DAY	0	0	2010-07-14	1326	\N	97575	\N	\N
108495	GENERIC_DAY	0	0	2010-08-09	1320	\N	97575	\N	\N
108496	GENERIC_DAY	0	0	2010-07-18	85043	\N	97575	\N	\N
108497	GENERIC_DAY	0	0	2010-08-30	1320	\N	97575	\N	\N
108498	GENERIC_DAY	0	2	2010-07-27	1314	\N	97575	\N	\N
108499	GENERIC_DAY	0	0	2010-10-08	1328	\N	97575	\N	\N
108500	GENERIC_DAY	0	0	2010-05-08	1328	\N	97575	\N	\N
108501	GENERIC_DAY	0	0	2010-05-24	85043	\N	97575	\N	\N
108502	GENERIC_DAY	0	0	2010-10-09	61308	\N	97575	\N	\N
108503	GENERIC_DAY	0	1	2010-08-11	1324	\N	97575	\N	\N
108504	GENERIC_DAY	0	0	2010-09-03	1326	\N	97575	\N	\N
108505	GENERIC_DAY	0	1	2010-09-09	2728	\N	97575	\N	\N
108506	GENERIC_DAY	0	0	2010-06-03	1326	\N	97575	\N	\N
108507	GENERIC_DAY	0	0	2010-06-27	2728	\N	97575	\N	\N
108508	GENERIC_DAY	0	0	2010-08-21	1330	\N	97575	\N	\N
108509	GENERIC_DAY	0	0	2010-08-26	1326	\N	97575	\N	\N
108510	GENERIC_DAY	0	0	2010-10-12	50401	\N	97575	\N	\N
108511	GENERIC_DAY	0	1	2010-07-12	19494	\N	97575	\N	\N
108512	GENERIC_DAY	0	0	2010-08-13	19494	\N	97575	\N	\N
108513	GENERIC_DAY	0	0	2010-07-27	61308	\N	97575	\N	\N
108514	GENERIC_DAY	0	1	2010-06-14	1328	\N	97575	\N	\N
108515	GENERIC_DAY	0	2	2010-08-17	19496	\N	97575	\N	\N
108516	GENERIC_DAY	0	0	2010-08-20	1328	\N	97575	\N	\N
108517	GENERIC_DAY	0	0	2010-07-23	19496	\N	97575	\N	\N
108518	GENERIC_DAY	0	0	2010-10-16	1316	\N	97575	\N	\N
108519	GENERIC_DAY	0	1	2010-05-10	1322	\N	97575	\N	\N
108520	GENERIC_DAY	0	1	2010-06-22	1328	\N	97575	\N	\N
108521	GENERIC_DAY	0	0	2010-05-27	50401	\N	97575	\N	\N
108522	GENERIC_DAY	0	1	2010-08-09	1318	\N	97575	\N	\N
108523	GENERIC_DAY	0	0	2010-06-06	85043	\N	97575	\N	\N
108524	GENERIC_DAY	0	0	2010-10-09	19500	\N	97575	\N	\N
108525	GENERIC_DAY	0	2	2010-10-19	1314	\N	97575	\N	\N
108526	GENERIC_DAY	0	0	2010-08-26	1316	\N	97575	\N	\N
108527	GENERIC_DAY	0	0	2010-05-23	1314	\N	97575	\N	\N
108528	GENERIC_DAY	0	0	2010-07-21	40199	\N	97575	\N	\N
108529	GENERIC_DAY	0	0	2010-10-08	19496	\N	97575	\N	\N
108530	GENERIC_DAY	0	0	2010-08-08	1332	\N	97575	\N	\N
108531	GENERIC_DAY	0	1	2010-05-19	19494	\N	97575	\N	\N
108532	GENERIC_DAY	0	0	2010-09-27	1320	\N	97575	\N	\N
108533	GENERIC_DAY	0	1	2010-08-18	1318	\N	97575	\N	\N
108534	GENERIC_DAY	0	0	2010-05-29	19496	\N	97575	\N	\N
108535	GENERIC_DAY	0	0	2010-06-19	19498	\N	97575	\N	\N
108536	GENERIC_DAY	0	0	2010-06-01	61308	\N	97575	\N	\N
108537	GENERIC_DAY	0	0	2010-05-15	1316	\N	97575	\N	\N
108538	GENERIC_DAY	0	0	2010-05-29	1314	\N	97575	\N	\N
108539	GENERIC_DAY	0	0	2010-06-18	19494	\N	97575	\N	\N
108540	GENERIC_DAY	0	0	2010-09-09	1330	\N	97575	\N	\N
108541	GENERIC_DAY	0	0	2010-08-14	1320	\N	97575	\N	\N
108542	GENERIC_DAY	0	0	2010-05-07	1314	\N	97575	\N	\N
108543	GENERIC_DAY	0	1	2010-07-14	1318	\N	97575	\N	\N
108544	GENERIC_DAY	0	0	2010-08-13	1326	\N	97575	\N	\N
108545	GENERIC_DAY	0	0	2010-10-11	19500	\N	97575	\N	\N
108546	GENERIC_DAY	0	0	2010-07-10	61308	\N	97575	\N	\N
108547	GENERIC_DAY	0	0	2010-05-07	1324	\N	97575	\N	\N
108548	GENERIC_DAY	0	0	2010-06-19	1320	\N	97575	\N	\N
108549	GENERIC_DAY	0	0	2010-09-22	1316	\N	97575	\N	\N
108550	GENERIC_DAY	0	0	2010-08-03	1320	\N	97575	\N	\N
108551	GENERIC_DAY	0	0	2010-05-30	1330	\N	97575	\N	\N
108552	GENERIC_DAY	0	0	2010-06-04	19500	\N	97575	\N	\N
108553	GENERIC_DAY	0	0	2010-05-30	1320	\N	97575	\N	\N
108554	GENERIC_DAY	0	2	2010-10-01	1316	\N	97575	\N	\N
108555	GENERIC_DAY	0	0	2010-07-04	1316	\N	97575	\N	\N
108556	GENERIC_DAY	0	1	2010-09-01	1324	\N	97575	\N	\N
108557	GENERIC_DAY	0	0	2010-10-17	40199	\N	97575	\N	\N
108558	GENERIC_DAY	0	0	2010-08-05	1316	\N	97575	\N	\N
108559	GENERIC_DAY	0	1	2010-09-08	19494	\N	97575	\N	\N
108560	GENERIC_DAY	0	0	2010-10-02	1330	\N	97575	\N	\N
108561	GENERIC_DAY	0	0	2010-06-03	1330	\N	97575	\N	\N
108562	GENERIC_DAY	0	0	2010-05-23	1328	\N	97575	\N	\N
108563	GENERIC_DAY	0	0	2010-06-05	19500	\N	97575	\N	\N
108564	GENERIC_DAY	0	0	2010-06-01	19498	\N	97575	\N	\N
108565	GENERIC_DAY	0	0	2010-09-04	1326	\N	97575	\N	\N
108566	GENERIC_DAY	0	0	2010-10-02	19498	\N	97575	\N	\N
108567	GENERIC_DAY	0	0	2010-04-29	19496	\N	97575	\N	\N
108568	GENERIC_DAY	0	0	2010-05-18	1326	\N	97575	\N	\N
108569	GENERIC_DAY	0	1	2010-06-29	2728	\N	97575	\N	\N
108570	GENERIC_DAY	0	0	2010-08-31	40199	\N	97575	\N	\N
108571	GENERIC_DAY	0	0	2010-08-24	40199	\N	97575	\N	\N
108572	GENERIC_DAY	0	0	2010-08-26	1320	\N	97575	\N	\N
108573	GENERIC_DAY	0	1	2010-07-22	1324	\N	97575	\N	\N
108574	GENERIC_DAY	0	0	2010-07-09	1314	\N	97575	\N	\N
108575	GENERIC_DAY	0	0	2010-07-26	1316	\N	97575	\N	\N
108576	GENERIC_DAY	0	1	2010-10-13	1314	\N	97575	\N	\N
108577	GENERIC_DAY	0	0	2010-08-28	85043	\N	97575	\N	\N
108578	GENERIC_DAY	0	1	2010-09-28	1314	\N	97575	\N	\N
108579	GENERIC_DAY	0	0	2010-07-27	1328	\N	97575	\N	\N
108580	GENERIC_DAY	0	0	2010-08-27	1330	\N	97575	\N	\N
108581	GENERIC_DAY	0	0	2010-06-14	1320	\N	97575	\N	\N
108582	GENERIC_DAY	0	2	2010-08-20	61308	\N	97575	\N	\N
108583	GENERIC_DAY	0	0	2010-07-31	1320	\N	97575	\N	\N
108584	GENERIC_DAY	0	0	2010-09-14	1320	\N	97575	\N	\N
108585	GENERIC_DAY	0	0	2010-09-27	85043	\N	97575	\N	\N
108586	GENERIC_DAY	0	0	2010-06-22	50401	\N	97575	\N	\N
108587	GENERIC_DAY	0	0	2010-09-15	1320	\N	97575	\N	\N
108588	GENERIC_DAY	0	0	2010-06-27	19496	\N	97575	\N	\N
108589	GENERIC_DAY	0	1	2010-05-27	2728	\N	97575	\N	\N
108590	GENERIC_DAY	0	0	2010-09-11	1328	\N	97575	\N	\N
108591	GENERIC_DAY	0	1	2010-10-20	1318	\N	97575	\N	\N
108592	GENERIC_DAY	0	1	2010-05-12	85043	\N	97575	\N	\N
108593	GENERIC_DAY	0	0	2010-05-01	1324	\N	97575	\N	\N
108594	GENERIC_DAY	0	2	2010-10-11	1322	\N	97575	\N	\N
108595	GENERIC_DAY	0	0	2010-08-25	61308	\N	97575	\N	\N
108596	GENERIC_DAY	0	0	2010-07-10	1332	\N	97575	\N	\N
108597	GENERIC_DAY	0	1	2010-05-24	1328	\N	97575	\N	\N
108598	GENERIC_DAY	0	0	2010-10-15	1328	\N	97575	\N	\N
108599	GENERIC_DAY	0	1	2010-09-29	1314	\N	97575	\N	\N
108600	GENERIC_DAY	0	0	2010-07-23	2728	\N	97575	\N	\N
108601	GENERIC_DAY	0	1	2010-07-05	19494	\N	97575	\N	\N
108602	GENERIC_DAY	0	1	2010-05-04	61308	\N	97575	\N	\N
108603	GENERIC_DAY	0	0	2010-10-18	40199	\N	97575	\N	\N
108604	GENERIC_DAY	0	0	2010-05-02	19494	\N	97575	\N	\N
108605	GENERIC_DAY	0	1	2010-07-28	19494	\N	97575	\N	\N
108606	GENERIC_DAY	0	0	2010-10-06	1326	\N	97575	\N	\N
108607	GENERIC_DAY	0	0	2010-07-24	50401	\N	97575	\N	\N
108608	GENERIC_DAY	0	1	2010-09-22	1314	\N	97575	\N	\N
108609	GENERIC_DAY	0	0	2010-06-20	19500	\N	97575	\N	\N
108610	GENERIC_DAY	0	1	2010-05-24	19494	\N	97575	\N	\N
108611	GENERIC_DAY	0	0	2010-09-18	1322	\N	97575	\N	\N
108612	GENERIC_DAY	0	0	2010-09-24	1318	\N	97575	\N	\N
108613	GENERIC_DAY	0	0	2010-08-15	40199	\N	97575	\N	\N
108614	GENERIC_DAY	0	0	2010-07-04	19500	\N	97575	\N	\N
108615	GENERIC_DAY	0	0	2010-08-12	1316	\N	97575	\N	\N
108616	GENERIC_DAY	0	0	2010-06-18	19498	\N	97575	\N	\N
108617	GENERIC_DAY	0	1	2010-05-07	1322	\N	97575	\N	\N
108618	GENERIC_DAY	0	0	2010-05-26	61308	\N	97575	\N	\N
108619	GENERIC_DAY	0	0	2010-09-17	19494	\N	97575	\N	\N
108620	GENERIC_DAY	0	0	2010-09-26	1314	\N	97575	\N	\N
108621	GENERIC_DAY	0	0	2010-09-25	1326	\N	97575	\N	\N
108622	GENERIC_DAY	0	0	2010-07-24	19496	\N	97575	\N	\N
108623	GENERIC_DAY	0	1	2010-05-04	1328	\N	97575	\N	\N
108624	GENERIC_DAY	0	0	2010-07-11	50401	\N	97575	\N	\N
108625	GENERIC_DAY	0	1	2010-10-13	1318	\N	97575	\N	\N
108626	GENERIC_DAY	0	0	2010-09-02	1328	\N	97575	\N	\N
108627	GENERIC_DAY	0	0	2010-08-08	1324	\N	97575	\N	\N
108628	GENERIC_DAY	0	1	2010-05-05	1332	\N	97575	\N	\N
108629	GENERIC_DAY	0	0	2010-07-29	1320	\N	97575	\N	\N
108630	GENERIC_DAY	0	0	2010-09-12	1316	\N	97575	\N	\N
108631	GENERIC_DAY	0	0	2010-07-24	1316	\N	97575	\N	\N
108632	GENERIC_DAY	0	0	2010-05-01	19496	\N	97575	\N	\N
108633	GENERIC_DAY	0	0	2010-05-23	1332	\N	97575	\N	\N
108634	GENERIC_DAY	0	0	2010-07-25	85043	\N	97575	\N	\N
108635	GENERIC_DAY	0	0	2010-09-02	19500	\N	97575	\N	\N
108636	GENERIC_DAY	0	0	2010-07-03	19498	\N	97575	\N	\N
108637	GENERIC_DAY	0	1	2010-06-10	2728	\N	97575	\N	\N
108638	GENERIC_DAY	0	0	2010-08-20	1322	\N	97575	\N	\N
108639	GENERIC_DAY	0	1	2010-08-26	1324	\N	97575	\N	\N
108640	GENERIC_DAY	0	0	2010-06-17	61308	\N	97575	\N	\N
108641	GENERIC_DAY	0	0	2010-06-13	50401	\N	97575	\N	\N
108642	GENERIC_DAY	0	0	2010-07-20	85043	\N	97575	\N	\N
108643	GENERIC_DAY	0	0	2010-08-04	85043	\N	97575	\N	\N
108644	GENERIC_DAY	0	0	2010-08-08	19498	\N	97575	\N	\N
108645	GENERIC_DAY	0	0	2010-08-22	1320	\N	97575	\N	\N
108646	GENERIC_DAY	0	0	2010-08-13	1318	\N	97575	\N	\N
108647	GENERIC_DAY	0	0	2010-10-02	1322	\N	97575	\N	\N
108648	GENERIC_DAY	0	0	2010-07-13	1320	\N	97575	\N	\N
108649	GENERIC_DAY	0	0	2010-06-26	1316	\N	97575	\N	\N
108650	GENERIC_DAY	0	1	2010-06-02	19494	\N	97575	\N	\N
108651	GENERIC_DAY	0	0	2010-08-12	61308	\N	97575	\N	\N
108652	GENERIC_DAY	0	0	2010-08-28	19500	\N	97575	\N	\N
108653	GENERIC_DAY	0	0	2010-09-24	2728	\N	97575	\N	\N
108654	GENERIC_DAY	0	0	2010-08-27	1318	\N	97575	\N	\N
108655	GENERIC_DAY	0	0	2010-06-26	61308	\N	97575	\N	\N
108656	GENERIC_DAY	0	1	2010-05-07	2728	\N	97575	\N	\N
108657	GENERIC_DAY	0	0	2010-08-20	1318	\N	97575	\N	\N
108658	GENERIC_DAY	0	0	2010-05-29	1330	\N	97575	\N	\N
108659	GENERIC_DAY	0	1	2010-08-13	50401	\N	97575	\N	\N
108660	GENERIC_DAY	0	1	2010-09-16	2728	\N	97575	\N	\N
108661	GENERIC_DAY	0	0	2010-05-16	1332	\N	97575	\N	\N
108662	GENERIC_DAY	0	0	2010-05-10	1328	\N	97575	\N	\N
108663	GENERIC_DAY	0	1	2010-06-23	2728	\N	97575	\N	\N
108664	GENERIC_DAY	0	1	2010-06-14	19494	\N	97575	\N	\N
108665	GENERIC_DAY	0	0	2010-05-09	61308	\N	97575	\N	\N
108666	GENERIC_DAY	0	0	2010-10-09	19494	\N	97575	\N	\N
108667	GENERIC_DAY	0	0	2010-07-17	1332	\N	97575	\N	\N
108668	GENERIC_DAY	0	0	2010-08-07	40199	\N	97575	\N	\N
108669	GENERIC_DAY	0	0	2010-05-27	1326	\N	97575	\N	\N
108670	GENERIC_DAY	0	0	2010-04-30	1322	\N	97575	\N	\N
108671	GENERIC_DAY	0	2	2010-08-27	1316	\N	97575	\N	\N
108672	GENERIC_DAY	0	0	2010-08-13	19498	\N	97575	\N	\N
108673	GENERIC_DAY	0	0	2010-05-01	19500	\N	97575	\N	\N
108674	GENERIC_DAY	0	0	2010-05-05	1320	\N	97575	\N	\N
108675	GENERIC_DAY	0	2	2010-07-23	1316	\N	97575	\N	\N
108676	GENERIC_DAY	0	0	2010-08-16	1326	\N	97575	\N	\N
108677	GENERIC_DAY	0	0	2010-09-09	19498	\N	97575	\N	\N
108678	GENERIC_DAY	0	0	2010-05-31	19500	\N	97575	\N	\N
108679	GENERIC_DAY	0	0	2010-09-12	1332	\N	97575	\N	\N
108680	GENERIC_DAY	0	0	2010-05-05	1326	\N	97575	\N	\N
108681	GENERIC_DAY	0	0	2010-10-09	40199	\N	97575	\N	\N
108682	GENERIC_DAY	0	2	2010-06-10	1322	\N	97575	\N	\N
108683	GENERIC_DAY	0	0	2010-06-05	1328	\N	97575	\N	\N
108684	GENERIC_DAY	0	0	2010-05-06	1320	\N	97575	\N	\N
108685	GENERIC_DAY	0	0	2010-05-14	1314	\N	97575	\N	\N
108686	GENERIC_DAY	0	1	2010-05-21	50401	\N	97575	\N	\N
108687	GENERIC_DAY	0	0	2010-05-05	19500	\N	97575	\N	\N
108688	GENERIC_DAY	0	0	2010-05-23	40199	\N	97575	\N	\N
108689	GENERIC_DAY	0	0	2010-05-26	19500	\N	97575	\N	\N
108690	GENERIC_DAY	0	0	2010-07-31	1318	\N	97575	\N	\N
108691	GENERIC_DAY	0	0	2010-07-03	1322	\N	97575	\N	\N
108692	GENERIC_DAY	0	0	2010-09-15	40199	\N	97575	\N	\N
108693	GENERIC_DAY	0	0	2010-07-24	1324	\N	97575	\N	\N
108694	GENERIC_DAY	0	0	2010-07-30	1326	\N	97575	\N	\N
108695	GENERIC_DAY	0	0	2010-06-22	19498	\N	97575	\N	\N
108696	GENERIC_DAY	0	0	2010-09-25	40199	\N	97575	\N	\N
108697	GENERIC_DAY	0	1	2010-07-01	2728	\N	97575	\N	\N
108698	GENERIC_DAY	0	0	2010-05-16	2728	\N	97575	\N	\N
108699	GENERIC_DAY	0	1	2010-08-10	1324	\N	97575	\N	\N
108700	GENERIC_DAY	0	0	2010-09-26	85043	\N	97575	\N	\N
108701	GENERIC_DAY	0	1	2010-09-14	2728	\N	97575	\N	\N
108702	GENERIC_DAY	0	0	2010-10-20	1332	\N	97575	\N	\N
108703	GENERIC_DAY	0	0	2010-07-26	50401	\N	97575	\N	\N
108704	GENERIC_DAY	0	0	2010-09-04	19494	\N	97575	\N	\N
108705	GENERIC_DAY	0	0	2010-09-18	1326	\N	97575	\N	\N
108706	GENERIC_DAY	0	0	2010-05-28	19494	\N	97575	\N	\N
108707	GENERIC_DAY	0	0	2010-08-10	40199	\N	97575	\N	\N
108708	GENERIC_DAY	0	0	2010-05-11	1328	\N	97575	\N	\N
108709	GENERIC_DAY	0	1	2010-05-05	19494	\N	97575	\N	\N
108710	GENERIC_DAY	0	0	2010-06-01	85043	\N	97575	\N	\N
108711	GENERIC_DAY	0	0	2010-06-26	19500	\N	97575	\N	\N
108712	GENERIC_DAY	0	0	2010-05-21	19496	\N	97575	\N	\N
108713	GENERIC_DAY	0	0	2010-05-18	85043	\N	97575	\N	\N
108714	GENERIC_DAY	0	1	2010-09-08	2728	\N	97575	\N	\N
108715	GENERIC_DAY	0	0	2010-05-08	40199	\N	97575	\N	\N
108716	GENERIC_DAY	0	2	2010-08-26	19496	\N	97575	\N	\N
108717	GENERIC_DAY	0	0	2010-10-01	1328	\N	97575	\N	\N
108718	GENERIC_DAY	0	0	2010-10-16	1324	\N	97575	\N	\N
108719	GENERIC_DAY	0	0	2010-06-15	1324	\N	97575	\N	\N
108720	GENERIC_DAY	0	0	2010-08-14	1314	\N	97575	\N	\N
108721	GENERIC_DAY	0	0	2010-08-22	19494	\N	97575	\N	\N
108722	GENERIC_DAY	0	0	2010-09-10	19498	\N	97575	\N	\N
108723	GENERIC_DAY	0	0	2010-06-17	1318	\N	97575	\N	\N
108724	GENERIC_DAY	0	0	2010-09-26	19494	\N	97575	\N	\N
108725	GENERIC_DAY	0	2	2010-10-08	40199	\N	97575	\N	\N
108726	GENERIC_DAY	0	0	2010-07-27	1320	\N	97575	\N	\N
108727	GENERIC_DAY	0	1	2010-06-16	1314	\N	97575	\N	\N
108728	GENERIC_DAY	0	1	2010-08-13	85043	\N	97575	\N	\N
108729	GENERIC_DAY	0	0	2010-10-09	1324	\N	97575	\N	\N
108730	GENERIC_DAY	0	0	2010-08-24	85043	\N	97575	\N	\N
108731	GENERIC_DAY	0	0	2010-06-29	19500	\N	97575	\N	\N
108732	GENERIC_DAY	0	0	2010-08-27	19494	\N	97575	\N	\N
108733	GENERIC_DAY	0	0	2010-06-29	1330	\N	97575	\N	\N
108734	GENERIC_DAY	0	1	2010-08-02	19494	\N	97575	\N	\N
108735	GENERIC_DAY	0	0	2010-06-10	85043	\N	97575	\N	\N
108736	GENERIC_DAY	0	0	2010-10-16	1314	\N	97575	\N	\N
108737	GENERIC_DAY	0	1	2010-05-18	1328	\N	97575	\N	\N
108738	GENERIC_DAY	0	0	2010-10-20	1324	\N	97575	\N	\N
108739	GENERIC_DAY	0	0	2010-06-17	19500	\N	97575	\N	\N
108740	GENERIC_DAY	0	1	2010-09-07	1314	\N	97575	\N	\N
108741	GENERIC_DAY	0	1	2010-10-12	1322	\N	97575	\N	\N
108742	GENERIC_DAY	0	2	2010-06-03	1322	\N	97575	\N	\N
108743	GENERIC_DAY	0	0	2010-06-13	1326	\N	97575	\N	\N
108744	GENERIC_DAY	0	0	2010-09-18	19498	\N	97575	\N	\N
108745	GENERIC_DAY	0	0	2010-10-17	19500	\N	97575	\N	\N
108746	GENERIC_DAY	0	0	2010-05-30	19498	\N	97575	\N	\N
108747	GENERIC_DAY	0	0	2010-09-10	1318	\N	97575	\N	\N
108748	GENERIC_DAY	0	0	2010-07-12	1322	\N	97575	\N	\N
108749	GENERIC_DAY	0	0	2010-05-02	1332	\N	97575	\N	\N
108750	GENERIC_DAY	0	0	2010-09-05	40199	\N	97575	\N	\N
108751	GENERIC_DAY	0	0	2010-06-25	19500	\N	97575	\N	\N
108752	GENERIC_DAY	0	0	2010-06-15	50401	\N	97575	\N	\N
108753	GENERIC_DAY	0	0	2010-06-01	1330	\N	97575	\N	\N
108754	GENERIC_DAY	0	0	2010-07-19	1322	\N	97575	\N	\N
108755	GENERIC_DAY	0	0	2010-10-04	50401	\N	97575	\N	\N
108756	GENERIC_DAY	0	2	2010-06-18	40199	\N	97575	\N	\N
108757	GENERIC_DAY	0	0	2010-06-02	1330	\N	97575	\N	\N
108758	GENERIC_DAY	0	0	2010-06-26	85043	\N	97575	\N	\N
108759	GENERIC_DAY	0	2	2010-05-28	1316	\N	97575	\N	\N
108760	GENERIC_DAY	0	0	2010-08-06	1330	\N	97575	\N	\N
108761	GENERIC_DAY	0	0	2010-07-16	1320	\N	97575	\N	\N
108762	GENERIC_DAY	0	0	2010-10-17	19494	\N	97575	\N	\N
108763	GENERIC_DAY	0	2	2010-07-22	19496	\N	97575	\N	\N
108764	GENERIC_DAY	0	0	2010-09-01	19500	\N	97575	\N	\N
108765	GENERIC_DAY	0	0	2010-10-02	61308	\N	97575	\N	\N
108766	GENERIC_DAY	0	0	2010-09-16	1330	\N	97575	\N	\N
108767	GENERIC_DAY	0	0	2010-07-18	1322	\N	97575	\N	\N
108768	GENERIC_DAY	0	2	2010-05-03	40199	\N	97575	\N	\N
108769	GENERIC_DAY	0	0	2010-07-13	1326	\N	97575	\N	\N
108770	GENERIC_DAY	0	1	2010-07-19	1328	\N	97575	\N	\N
108771	GENERIC_DAY	0	0	2010-08-21	1314	\N	97575	\N	\N
108772	GENERIC_DAY	0	0	2010-05-23	1324	\N	97575	\N	\N
108773	GENERIC_DAY	0	0	2010-08-04	1330	\N	97575	\N	\N
108774	GENERIC_DAY	0	0	2010-07-17	1316	\N	97575	\N	\N
108775	GENERIC_DAY	0	0	2010-08-08	1314	\N	97575	\N	\N
108776	GENERIC_DAY	0	0	2010-09-23	1332	\N	97575	\N	\N
108777	GENERIC_DAY	0	0	2010-10-07	1326	\N	97575	\N	\N
108778	GENERIC_DAY	0	0	2010-10-02	40199	\N	97575	\N	\N
108779	GENERIC_DAY	0	0	2010-10-05	61308	\N	97575	\N	\N
108780	GENERIC_DAY	0	1	2010-10-11	19496	\N	97575	\N	\N
108781	GENERIC_DAY	0	0	2010-09-02	1326	\N	97575	\N	\N
108782	GENERIC_DAY	0	0	2010-05-24	1314	\N	97575	\N	\N
108783	GENERIC_DAY	0	1	2010-05-17	61308	\N	97575	\N	\N
108784	GENERIC_DAY	0	0	2010-06-05	85043	\N	97575	\N	\N
108785	GENERIC_DAY	0	0	2010-08-03	19500	\N	97575	\N	\N
108786	GENERIC_DAY	0	0	2010-09-26	61308	\N	97575	\N	\N
108787	GENERIC_DAY	0	0	2010-05-04	1314	\N	97575	\N	\N
108788	GENERIC_DAY	0	0	2010-08-21	1318	\N	97575	\N	\N
108789	GENERIC_DAY	0	0	2010-06-23	1318	\N	97575	\N	\N
108790	GENERIC_DAY	0	0	2010-08-08	40199	\N	97575	\N	\N
108791	GENERIC_DAY	0	0	2010-05-01	1314	\N	97575	\N	\N
108792	GENERIC_DAY	0	1	2010-04-29	1316	\N	97575	\N	\N
108793	GENERIC_DAY	0	1	2010-07-28	1318	\N	97575	\N	\N
108794	GENERIC_DAY	0	0	2010-05-22	1332	\N	97575	\N	\N
108795	GENERIC_DAY	0	0	2010-10-02	1332	\N	97575	\N	\N
108796	GENERIC_DAY	0	1	2010-05-19	2728	\N	97575	\N	\N
108797	GENERIC_DAY	0	0	2010-08-09	1330	\N	97575	\N	\N
108798	GENERIC_DAY	0	0	2010-09-03	1324	\N	97575	\N	\N
108799	GENERIC_DAY	0	0	2010-08-29	1328	\N	97575	\N	\N
108800	GENERIC_DAY	0	1	2010-07-12	1324	\N	97575	\N	\N
108801	GENERIC_DAY	0	0	2010-08-19	19498	\N	97575	\N	\N
108802	GENERIC_DAY	0	0	2010-05-13	1324	\N	97575	\N	\N
108803	GENERIC_DAY	0	0	2010-06-07	40199	\N	97575	\N	\N
108804	GENERIC_DAY	0	1	2010-07-13	1318	\N	97575	\N	\N
108805	GENERIC_DAY	0	0	2010-06-29	1322	\N	97575	\N	\N
108806	GENERIC_DAY	0	0	2010-06-21	85043	\N	97575	\N	\N
108807	GENERIC_DAY	0	0	2010-05-16	1326	\N	97575	\N	\N
108808	GENERIC_DAY	0	2	2010-07-06	1314	\N	97575	\N	\N
108809	GENERIC_DAY	0	1	2010-06-24	19494	\N	97575	\N	\N
108810	GENERIC_DAY	0	0	2010-06-12	1332	\N	97575	\N	\N
108811	GENERIC_DAY	0	1	2010-05-12	19496	\N	97575	\N	\N
108812	GENERIC_DAY	0	0	2010-08-17	1322	\N	97575	\N	\N
108813	GENERIC_DAY	0	2	2010-05-31	1322	\N	97575	\N	\N
108814	GENERIC_DAY	0	0	2010-09-18	1324	\N	97575	\N	\N
108815	GENERIC_DAY	0	0	2010-06-04	1332	\N	97575	\N	\N
108816	GENERIC_DAY	0	0	2010-07-29	19498	\N	97575	\N	\N
108817	GENERIC_DAY	0	0	2010-09-14	1332	\N	97575	\N	\N
108818	GENERIC_DAY	0	0	2010-07-02	19496	\N	97575	\N	\N
108819	GENERIC_DAY	0	0	2010-09-10	1320	\N	97575	\N	\N
108820	GENERIC_DAY	0	1	2010-08-30	1324	\N	97575	\N	\N
108821	GENERIC_DAY	0	1	2010-05-25	19494	\N	97575	\N	\N
108822	GENERIC_DAY	0	0	2010-09-03	1328	\N	97575	\N	\N
108823	GENERIC_DAY	0	0	2010-09-27	61308	\N	97575	\N	\N
108824	GENERIC_DAY	0	0	2010-08-13	1328	\N	97575	\N	\N
108825	GENERIC_DAY	0	0	2010-08-15	1332	\N	97575	\N	\N
108826	GENERIC_DAY	0	0	2010-07-01	19498	\N	97575	\N	\N
108827	GENERIC_DAY	0	0	2010-09-04	19496	\N	97575	\N	\N
108828	GENERIC_DAY	0	0	2010-08-22	40199	\N	97575	\N	\N
108829	GENERIC_DAY	0	0	2010-06-05	1324	\N	97575	\N	\N
108830	GENERIC_DAY	0	0	2010-07-07	50401	\N	97575	\N	\N
108831	GENERIC_DAY	0	0	2010-09-17	1318	\N	97575	\N	\N
108832	GENERIC_DAY	0	0	2010-05-12	1328	\N	97575	\N	\N
108833	GENERIC_DAY	0	1	2010-06-08	19494	\N	97575	\N	\N
108834	GENERIC_DAY	0	0	2010-07-25	40199	\N	97575	\N	\N
108835	GENERIC_DAY	0	1	2010-05-27	1328	\N	97575	\N	\N
108836	GENERIC_DAY	0	2	2010-09-23	1322	\N	97575	\N	\N
108837	GENERIC_DAY	0	0	2010-10-18	50401	\N	97575	\N	\N
108838	GENERIC_DAY	0	0	2010-06-23	61308	\N	97575	\N	\N
108839	GENERIC_DAY	0	1	2010-05-11	50401	\N	97575	\N	\N
108840	GENERIC_DAY	0	0	2010-08-23	1330	\N	97575	\N	\N
108841	GENERIC_DAY	0	0	2010-08-03	1332	\N	97575	\N	\N
108842	GENERIC_DAY	0	2	2010-10-05	1322	\N	97575	\N	\N
108843	GENERIC_DAY	0	0	2010-09-04	1330	\N	97575	\N	\N
108844	GENERIC_DAY	0	0	2010-10-11	1326	\N	97575	\N	\N
108845	GENERIC_DAY	0	0	2010-06-28	1326	\N	97575	\N	\N
108846	GENERIC_DAY	0	0	2010-09-12	19500	\N	97575	\N	\N
108847	GENERIC_DAY	0	0	2010-06-28	19498	\N	97575	\N	\N
108848	GENERIC_DAY	0	0	2010-09-03	19500	\N	97575	\N	\N
108849	GENERIC_DAY	0	0	2010-09-24	1322	\N	97575	\N	\N
108850	GENERIC_DAY	0	0	2010-10-04	19500	\N	97575	\N	\N
108851	GENERIC_DAY	0	0	2010-05-09	1330	\N	97575	\N	\N
108852	GENERIC_DAY	0	0	2010-10-11	19498	\N	97575	\N	\N
108853	GENERIC_DAY	0	0	2010-10-03	61308	\N	97575	\N	\N
108854	GENERIC_DAY	0	0	2010-10-17	1314	\N	97575	\N	\N
108855	GENERIC_DAY	0	0	2010-05-12	19498	\N	97575	\N	\N
108856	GENERIC_DAY	0	0	2010-10-20	19498	\N	97575	\N	\N
108857	GENERIC_DAY	0	0	2010-08-12	1328	\N	97575	\N	\N
108858	GENERIC_DAY	0	1	2010-05-11	19496	\N	97575	\N	\N
108859	GENERIC_DAY	0	0	2010-09-12	1326	\N	97575	\N	\N
108860	GENERIC_DAY	0	0	2010-07-04	50401	\N	97575	\N	\N
108861	GENERIC_DAY	0	0	2010-07-15	40199	\N	97575	\N	\N
108862	GENERIC_DAY	0	0	2010-06-11	1324	\N	97575	\N	\N
108863	GENERIC_DAY	0	0	2010-08-11	1332	\N	97575	\N	\N
108864	GENERIC_DAY	0	0	2010-07-29	19500	\N	97575	\N	\N
108865	GENERIC_DAY	0	2	2010-08-02	19496	\N	97575	\N	\N
108866	GENERIC_DAY	0	0	2010-05-27	19498	\N	97575	\N	\N
108867	GENERIC_DAY	0	0	2010-07-30	2728	\N	97575	\N	\N
108868	GENERIC_DAY	0	0	2010-06-20	1324	\N	97575	\N	\N
108869	GENERIC_DAY	0	0	2010-08-08	1318	\N	97575	\N	\N
108870	GENERIC_DAY	0	0	2010-05-09	1320	\N	97575	\N	\N
108871	GENERIC_DAY	0	1	2010-09-03	50401	\N	97575	\N	\N
108872	GENERIC_DAY	0	0	2010-06-21	61308	\N	97575	\N	\N
108873	GENERIC_DAY	0	0	2010-06-15	1326	\N	97575	\N	\N
108874	GENERIC_DAY	0	0	2010-09-10	1328	\N	97575	\N	\N
108875	GENERIC_DAY	0	0	2010-10-15	2728	\N	97575	\N	\N
108876	GENERIC_DAY	0	0	2010-06-15	19498	\N	97575	\N	\N
108877	GENERIC_DAY	0	0	2010-09-19	1332	\N	97575	\N	\N
108878	GENERIC_DAY	0	0	2010-07-25	1318	\N	97575	\N	\N
108879	GENERIC_DAY	0	0	2010-05-22	19498	\N	97575	\N	\N
108880	GENERIC_DAY	0	1	2010-07-05	1324	\N	97575	\N	\N
108881	GENERIC_DAY	0	0	2010-10-10	1332	\N	97575	\N	\N
108882	GENERIC_DAY	0	0	2010-05-13	2728	\N	97575	\N	\N
108883	GENERIC_DAY	0	0	2010-06-19	1328	\N	97575	\N	\N
108884	GENERIC_DAY	0	0	2010-08-29	50401	\N	97575	\N	\N
108885	GENERIC_DAY	0	0	2010-06-12	1320	\N	97575	\N	\N
108886	GENERIC_DAY	0	0	2010-06-06	1332	\N	97575	\N	\N
108887	GENERIC_DAY	0	1	2010-06-30	2728	\N	97575	\N	\N
108888	GENERIC_DAY	0	1	2010-05-17	85043	\N	97575	\N	\N
108889	GENERIC_DAY	0	0	2010-08-11	1320	\N	97575	\N	\N
108890	GENERIC_DAY	0	1	2010-06-18	85043	\N	97575	\N	\N
108891	GENERIC_DAY	0	0	2010-08-09	1316	\N	97575	\N	\N
108892	GENERIC_DAY	0	0	2010-10-05	1330	\N	97575	\N	\N
108893	GENERIC_DAY	0	0	2010-06-13	85043	\N	97575	\N	\N
108894	GENERIC_DAY	0	1	2010-08-10	1318	\N	97575	\N	\N
108895	GENERIC_DAY	0	0	2010-05-15	1318	\N	97575	\N	\N
108896	GENERIC_DAY	0	0	2010-07-27	85043	\N	97575	\N	\N
108897	GENERIC_DAY	0	0	2010-06-18	1332	\N	97575	\N	\N
108898	GENERIC_DAY	0	0	2010-08-05	1322	\N	97575	\N	\N
108899	GENERIC_DAY	0	0	2010-05-23	1320	\N	97575	\N	\N
108900	GENERIC_DAY	0	0	2010-05-08	1322	\N	97575	\N	\N
108901	GENERIC_DAY	0	0	2010-09-28	19500	\N	97575	\N	\N
108902	GENERIC_DAY	0	0	2010-06-15	1316	\N	97575	\N	\N
108903	GENERIC_DAY	0	0	2010-06-17	1326	\N	97575	\N	\N
108904	GENERIC_DAY	0	0	2010-07-20	61308	\N	97575	\N	\N
108905	GENERIC_DAY	0	0	2010-09-04	2728	\N	97575	\N	\N
108906	GENERIC_DAY	0	0	2010-07-17	1322	\N	97575	\N	\N
108907	GENERIC_DAY	0	1	2010-08-05	2728	\N	97575	\N	\N
108908	GENERIC_DAY	0	0	2010-08-12	19500	\N	97575	\N	\N
108909	GENERIC_DAY	0	0	2010-08-21	1328	\N	97575	\N	\N
108910	GENERIC_DAY	0	2	2010-05-14	50401	\N	97575	\N	\N
108911	GENERIC_DAY	0	0	2010-07-08	85043	\N	97575	\N	\N
108912	GENERIC_DAY	0	1	2010-10-13	19494	\N	97575	\N	\N
108913	GENERIC_DAY	0	2	2010-07-02	40199	\N	97575	\N	\N
108914	GENERIC_DAY	0	1	2010-05-27	1332	\N	97575	\N	\N
108915	GENERIC_DAY	0	0	2010-05-22	61308	\N	97575	\N	\N
108916	GENERIC_DAY	0	0	2010-10-10	19500	\N	97575	\N	\N
108917	GENERIC_DAY	0	0	2010-05-09	1324	\N	97575	\N	\N
108918	GENERIC_DAY	0	0	2010-10-02	1318	\N	97575	\N	\N
108919	GENERIC_DAY	0	0	2010-05-05	1330	\N	97575	\N	\N
108920	GENERIC_DAY	0	0	2010-09-16	40199	\N	97575	\N	\N
108921	GENERIC_DAY	0	0	2010-09-24	19496	\N	97575	\N	\N
108922	GENERIC_DAY	0	0	2010-08-02	1320	\N	97575	\N	\N
108923	GENERIC_DAY	0	0	2010-05-14	1324	\N	97575	\N	\N
108924	GENERIC_DAY	0	0	2010-10-03	19494	\N	97575	\N	\N
108925	GENERIC_DAY	0	1	2010-05-27	19494	\N	97575	\N	\N
108926	GENERIC_DAY	0	0	2010-09-26	40199	\N	97575	\N	\N
108927	GENERIC_DAY	0	0	2010-10-12	1326	\N	97575	\N	\N
108928	GENERIC_DAY	0	0	2010-09-12	1328	\N	97575	\N	\N
108929	GENERIC_DAY	0	0	2010-07-11	61308	\N	97575	\N	\N
108930	GENERIC_DAY	0	0	2010-06-28	1320	\N	97575	\N	\N
108931	GENERIC_DAY	0	1	2010-05-17	1332	\N	97575	\N	\N
108932	GENERIC_DAY	0	1	2010-07-16	50401	\N	97575	\N	\N
108933	GENERIC_DAY	0	0	2010-05-04	1320	\N	97575	\N	\N
108934	GENERIC_DAY	0	0	2010-09-30	19498	\N	97575	\N	\N
108935	GENERIC_DAY	0	0	2010-08-08	1330	\N	97575	\N	\N
108936	GENERIC_DAY	0	0	2010-06-16	61308	\N	97575	\N	\N
108937	GENERIC_DAY	0	0	2010-09-16	19498	\N	97575	\N	\N
108938	GENERIC_DAY	0	1	2010-10-13	2728	\N	97575	\N	\N
108939	GENERIC_DAY	0	0	2010-05-29	1318	\N	97575	\N	\N
108940	GENERIC_DAY	0	0	2010-06-12	2728	\N	97575	\N	\N
108941	GENERIC_DAY	0	0	2010-05-03	19496	\N	97575	\N	\N
108942	GENERIC_DAY	0	0	2010-05-23	1322	\N	97575	\N	\N
108943	GENERIC_DAY	0	1	2010-08-10	2728	\N	97575	\N	\N
108944	GENERIC_DAY	0	0	2010-08-22	1324	\N	97575	\N	\N
108945	GENERIC_DAY	0	0	2010-08-26	1332	\N	97575	\N	\N
108946	GENERIC_DAY	0	0	2010-08-16	1320	\N	97575	\N	\N
108947	GENERIC_DAY	0	1	2010-08-30	19496	\N	97575	\N	\N
108948	GENERIC_DAY	0	1	2010-10-05	2728	\N	97575	\N	\N
108949	GENERIC_DAY	0	0	2010-10-11	40199	\N	97575	\N	\N
108950	GENERIC_DAY	0	1	2010-05-18	1332	\N	97575	\N	\N
108951	GENERIC_DAY	0	0	2010-06-24	1316	\N	97575	\N	\N
108952	GENERIC_DAY	0	0	2010-07-22	85043	\N	97575	\N	\N
108953	GENERIC_DAY	0	0	2010-09-18	1328	\N	97575	\N	\N
108954	GENERIC_DAY	0	0	2010-10-19	1320	\N	97575	\N	\N
108955	GENERIC_DAY	0	1	2010-07-21	2728	\N	97575	\N	\N
108956	GENERIC_DAY	0	0	2010-07-12	85043	\N	97575	\N	\N
108957	GENERIC_DAY	0	0	2010-07-05	1318	\N	97575	\N	\N
108958	GENERIC_DAY	0	2	2010-06-11	1316	\N	97575	\N	\N
108959	GENERIC_DAY	0	0	2010-08-14	1316	\N	97575	\N	\N
108960	GENERIC_DAY	0	1	2010-10-12	1318	\N	97575	\N	\N
108961	GENERIC_DAY	0	0	2010-05-20	61308	\N	97575	\N	\N
108962	GENERIC_DAY	0	0	2010-10-10	1318	\N	97575	\N	\N
108963	GENERIC_DAY	0	1	2010-08-19	1318	\N	97575	\N	\N
108964	GENERIC_DAY	0	0	2010-06-20	50401	\N	97575	\N	\N
108965	GENERIC_DAY	0	1	2010-08-17	1324	\N	97575	\N	\N
108966	GENERIC_DAY	0	0	2010-09-18	61308	\N	97575	\N	\N
108967	GENERIC_DAY	0	1	2010-09-07	1324	\N	97575	\N	\N
108968	GENERIC_DAY	0	0	2010-09-07	50401	\N	97575	\N	\N
108969	GENERIC_DAY	0	0	2010-07-15	1326	\N	97575	\N	\N
108970	GENERIC_DAY	0	0	2010-07-12	61308	\N	97575	\N	\N
108971	GENERIC_DAY	0	0	2010-09-09	1316	\N	97575	\N	\N
108972	GENERIC_DAY	0	0	2010-05-18	1330	\N	97575	\N	\N
108973	GENERIC_DAY	0	0	2010-08-09	85043	\N	97575	\N	\N
108974	GENERIC_DAY	0	0	2010-05-18	1320	\N	97575	\N	\N
108975	GENERIC_DAY	0	0	2010-06-16	19498	\N	97575	\N	\N
108976	GENERIC_DAY	0	0	2010-05-28	1320	\N	97575	\N	\N
108977	GENERIC_DAY	0	0	2010-09-01	1330	\N	97575	\N	\N
108978	GENERIC_DAY	0	0	2010-06-18	2728	\N	97575	\N	\N
108979	GENERIC_DAY	0	0	2010-08-18	61308	\N	97575	\N	\N
108980	GENERIC_DAY	0	0	2010-09-25	1314	\N	97575	\N	\N
108981	GENERIC_DAY	0	1	2010-06-10	1332	\N	97575	\N	\N
108982	GENERIC_DAY	0	0	2010-05-15	2728	\N	97575	\N	\N
108983	GENERIC_DAY	0	0	2010-10-14	40199	\N	97575	\N	\N
108984	GENERIC_DAY	0	2	2010-05-26	1322	\N	97575	\N	\N
108985	GENERIC_DAY	0	1	2010-05-04	1322	\N	97575	\N	\N
108986	GENERIC_DAY	0	0	2010-10-01	1326	\N	97575	\N	\N
108987	GENERIC_DAY	0	0	2010-07-19	1326	\N	97575	\N	\N
108988	GENERIC_DAY	0	0	2010-09-19	1322	\N	97575	\N	\N
108989	GENERIC_DAY	0	0	2010-10-08	19500	\N	97575	\N	\N
108990	GENERIC_DAY	0	0	2010-05-11	19494	\N	97575	\N	\N
108991	GENERIC_DAY	0	0	2010-09-25	1330	\N	97575	\N	\N
108992	GENERIC_DAY	0	0	2010-05-09	1322	\N	97575	\N	\N
108993	GENERIC_DAY	0	0	2010-07-03	1314	\N	97575	\N	\N
108994	GENERIC_DAY	0	2	2010-08-04	1314	\N	97575	\N	\N
108995	GENERIC_DAY	0	0	2010-08-13	1330	\N	97575	\N	\N
108996	GENERIC_DAY	0	0	2010-09-05	1328	\N	97575	\N	\N
108997	GENERIC_DAY	0	2	2010-06-25	61308	\N	97575	\N	\N
108998	GENERIC_DAY	0	0	2010-08-14	1326	\N	97575	\N	\N
108999	GENERIC_DAY	0	0	2010-08-23	40199	\N	97575	\N	\N
109000	GENERIC_DAY	0	1	2010-09-14	19494	\N	97575	\N	\N
109001	GENERIC_DAY	0	2	2010-09-29	1322	\N	97575	\N	\N
109002	GENERIC_DAY	0	1	2010-07-06	19496	\N	97575	\N	\N
109003	GENERIC_DAY	0	0	2010-05-20	1314	\N	97575	\N	\N
109004	GENERIC_DAY	0	0	2010-06-19	40199	\N	97575	\N	\N
109005	GENERIC_DAY	0	0	2010-06-18	1324	\N	97575	\N	\N
109006	GENERIC_DAY	0	0	2010-09-24	1320	\N	97575	\N	\N
109007	GENERIC_DAY	0	0	2010-07-22	40199	\N	97575	\N	\N
109008	GENERIC_DAY	0	1	2010-10-14	19494	\N	97575	\N	\N
109009	GENERIC_DAY	0	0	2010-09-24	19494	\N	97575	\N	\N
109010	GENERIC_DAY	0	0	2010-05-09	1332	\N	97575	\N	\N
109011	GENERIC_DAY	0	0	2010-10-10	1326	\N	97575	\N	\N
109012	GENERIC_DAY	0	1	2010-10-04	19496	\N	97575	\N	\N
109013	GENERIC_DAY	0	0	2010-06-25	1328	\N	97575	\N	\N
109014	GENERIC_DAY	0	0	2010-09-22	1328	\N	97575	\N	\N
109015	GENERIC_DAY	0	0	2010-05-21	1320	\N	97575	\N	\N
109016	GENERIC_DAY	0	1	2010-09-22	1324	\N	97575	\N	\N
109017	GENERIC_DAY	0	0	2010-06-20	19496	\N	97575	\N	\N
109018	GENERIC_DAY	0	0	2010-05-17	1320	\N	97575	\N	\N
109019	GENERIC_DAY	0	0	2010-07-27	19498	\N	97575	\N	\N
109020	GENERIC_DAY	0	0	2010-05-10	40199	\N	97575	\N	\N
109021	GENERIC_DAY	0	1	2010-07-14	1324	\N	97575	\N	\N
109022	GENERIC_DAY	0	0	2010-07-09	19500	\N	97575	\N	\N
109023	GENERIC_DAY	0	0	2010-10-18	1322	\N	97575	\N	\N
109024	GENERIC_DAY	0	0	2010-05-15	1324	\N	97575	\N	\N
109025	GENERIC_DAY	0	0	2010-05-01	85043	\N	97575	\N	\N
109026	GENERIC_DAY	0	0	2010-06-05	19496	\N	97575	\N	\N
109027	GENERIC_DAY	0	0	2010-05-29	61308	\N	97575	\N	\N
109028	GENERIC_DAY	0	0	2010-07-21	1322	\N	97575	\N	\N
109029	GENERIC_DAY	0	1	2010-07-07	1324	\N	97575	\N	\N
109030	GENERIC_DAY	0	0	2010-05-15	19496	\N	97575	\N	\N
109031	GENERIC_DAY	0	0	2010-09-21	1326	\N	97575	\N	\N
109032	GENERIC_DAY	0	0	2010-10-10	61308	\N	97575	\N	\N
109033	GENERIC_DAY	0	1	2010-06-14	1332	\N	97575	\N	\N
109034	GENERIC_DAY	0	0	2010-06-27	1318	\N	97575	\N	\N
109035	GENERIC_DAY	0	0	2010-06-24	1320	\N	97575	\N	\N
109036	GENERIC_DAY	0	2	2010-10-06	1322	\N	97575	\N	\N
109037	GENERIC_DAY	0	0	2010-09-14	19498	\N	97575	\N	\N
109038	GENERIC_DAY	0	1	2010-06-21	1332	\N	97575	\N	\N
109039	GENERIC_DAY	0	0	2010-05-15	1330	\N	97575	\N	\N
109040	GENERIC_DAY	0	0	2010-09-05	2728	\N	97575	\N	\N
109041	GENERIC_DAY	0	1	2010-10-07	19496	\N	97575	\N	\N
109042	GENERIC_DAY	0	1	2010-06-30	1328	\N	97575	\N	\N
109043	GENERIC_DAY	0	1	2010-10-08	85043	\N	97575	\N	\N
109044	GENERIC_DAY	0	0	2010-09-12	2728	\N	97575	\N	\N
109045	GENERIC_DAY	0	0	2010-06-11	1320	\N	97575	\N	\N
109046	GENERIC_DAY	0	0	2010-04-30	19494	\N	97575	\N	\N
109047	GENERIC_DAY	0	0	2010-06-12	1322	\N	97575	\N	\N
109048	GENERIC_DAY	0	0	2010-08-05	19498	\N	97575	\N	\N
109049	GENERIC_DAY	0	0	2010-08-23	1332	\N	97575	\N	\N
109050	GENERIC_DAY	0	0	2010-05-27	85043	\N	97575	\N	\N
109051	GENERIC_DAY	0	0	2010-09-15	1332	\N	97575	\N	\N
109052	GENERIC_DAY	0	0	2010-05-24	19500	\N	97575	\N	\N
109053	GENERIC_DAY	0	0	2010-06-22	1324	\N	97575	\N	\N
109054	GENERIC_DAY	0	1	2010-08-27	50401	\N	97575	\N	\N
109055	GENERIC_DAY	0	0	2010-06-24	61308	\N	97575	\N	\N
109056	GENERIC_DAY	0	0	2010-10-03	2728	\N	97575	\N	\N
109057	GENERIC_DAY	0	0	2010-05-05	1314	\N	97575	\N	\N
109058	GENERIC_DAY	0	2	2010-07-16	1316	\N	97575	\N	\N
109059	GENERIC_DAY	0	0	2010-09-30	1316	\N	97575	\N	\N
109060	GENERIC_DAY	0	0	2010-10-11	1316	\N	97575	\N	\N
109061	GENERIC_DAY	0	0	2010-08-05	1328	\N	97575	\N	\N
109062	GENERIC_DAY	0	0	2010-05-26	1318	\N	97575	\N	\N
109063	GENERIC_DAY	0	1	2010-09-21	1318	\N	97575	\N	\N
109064	GENERIC_DAY	0	0	2010-08-02	1326	\N	97575	\N	\N
109065	GENERIC_DAY	0	0	2010-07-11	19496	\N	97575	\N	\N
109066	GENERIC_DAY	0	0	2010-10-17	1320	\N	97575	\N	\N
109067	GENERIC_DAY	0	0	2010-09-13	1316	\N	97575	\N	\N
109068	GENERIC_DAY	0	2	2010-08-11	1314	\N	97575	\N	\N
109069	GENERIC_DAY	0	2	2010-06-29	19496	\N	97575	\N	\N
109070	GENERIC_DAY	0	0	2010-05-02	1328	\N	97575	\N	\N
109071	GENERIC_DAY	0	0	2010-09-06	85043	\N	97575	\N	\N
109072	GENERIC_DAY	0	2	2010-06-15	1322	\N	97575	\N	\N
109073	GENERIC_DAY	0	0	2010-05-30	19494	\N	97575	\N	\N
109074	GENERIC_DAY	0	1	2010-08-20	85043	\N	97575	\N	\N
109075	GENERIC_DAY	0	0	2010-07-21	1320	\N	97575	\N	\N
109076	GENERIC_DAY	0	0	2010-06-02	50401	\N	97575	\N	\N
109077	GENERIC_DAY	0	0	2010-06-11	19498	\N	97575	\N	\N
109078	GENERIC_DAY	0	0	2010-05-13	1318	\N	97575	\N	\N
109079	GENERIC_DAY	0	0	2010-10-08	19498	\N	97575	\N	\N
109080	GENERIC_DAY	0	0	2010-05-21	1324	\N	97575	\N	\N
109081	GENERIC_DAY	0	0	2010-08-29	1330	\N	97575	\N	\N
109082	GENERIC_DAY	0	1	2010-05-07	19494	\N	97575	\N	\N
109083	GENERIC_DAY	0	0	2010-08-03	61308	\N	97575	\N	\N
109084	GENERIC_DAY	0	2	2010-06-21	19496	\N	97575	\N	\N
109085	GENERIC_DAY	0	0	2010-06-26	1324	\N	97575	\N	\N
109086	GENERIC_DAY	0	0	2010-08-22	1328	\N	97575	\N	\N
109087	GENERIC_DAY	0	0	2010-09-09	1332	\N	97575	\N	\N
109088	GENERIC_DAY	0	0	2010-05-16	61308	\N	97575	\N	\N
109089	GENERIC_DAY	0	0	2010-10-02	19496	\N	97575	\N	\N
109090	GENERIC_DAY	0	0	2010-08-05	1320	\N	97575	\N	\N
109091	GENERIC_DAY	0	0	2010-08-31	1326	\N	97575	\N	\N
109092	GENERIC_DAY	0	0	2010-06-19	61308	\N	97575	\N	\N
109093	GENERIC_DAY	0	1	2010-10-06	1314	\N	97575	\N	\N
109094	GENERIC_DAY	0	1	2010-07-07	1328	\N	97575	\N	\N
109095	GENERIC_DAY	0	0	2010-05-11	19500	\N	97575	\N	\N
109096	GENERIC_DAY	0	0	2010-07-14	19498	\N	97575	\N	\N
109097	GENERIC_DAY	0	0	2010-05-02	85043	\N	97575	\N	\N
109098	GENERIC_DAY	0	0	2010-07-20	1326	\N	97575	\N	\N
109099	GENERIC_DAY	0	0	2010-05-22	50401	\N	97575	\N	\N
109100	GENERIC_DAY	0	0	2010-06-20	1330	\N	97575	\N	\N
109101	GENERIC_DAY	0	0	2010-08-16	1322	\N	97575	\N	\N
109102	GENERIC_DAY	0	0	2010-09-22	1326	\N	97575	\N	\N
109103	GENERIC_DAY	0	0	2010-05-03	1324	\N	97575	\N	\N
109104	GENERIC_DAY	0	2	2010-06-07	19496	\N	97575	\N	\N
109105	GENERIC_DAY	0	0	2010-08-05	1332	\N	97575	\N	\N
109106	GENERIC_DAY	0	0	2010-10-08	2728	\N	97575	\N	\N
109107	GENERIC_DAY	0	0	2010-05-20	19498	\N	97575	\N	\N
109108	GENERIC_DAY	0	0	2010-09-18	1320	\N	97575	\N	\N
109109	GENERIC_DAY	0	0	2010-06-21	1324	\N	97575	\N	\N
109110	GENERIC_DAY	0	0	2010-06-03	19498	\N	97575	\N	\N
109111	GENERIC_DAY	0	0	2010-05-01	19494	\N	97575	\N	\N
109112	GENERIC_DAY	0	0	2010-07-01	40199	\N	97575	\N	\N
109113	GENERIC_DAY	0	2	2010-08-24	1314	\N	97575	\N	\N
109114	GENERIC_DAY	0	1	2010-08-31	19494	\N	97575	\N	\N
109115	GENERIC_DAY	0	0	2010-05-17	1330	\N	97575	\N	\N
109116	GENERIC_DAY	0	0	2010-08-22	1322	\N	97575	\N	\N
109117	GENERIC_DAY	0	0	2010-05-22	1320	\N	97575	\N	\N
109118	GENERIC_DAY	0	1	2010-10-12	19496	\N	97575	\N	\N
109119	GENERIC_DAY	0	0	2010-10-13	61308	\N	97575	\N	\N
109120	GENERIC_DAY	0	0	2010-05-19	1318	\N	97575	\N	\N
109121	GENERIC_DAY	0	0	2010-05-16	1330	\N	97575	\N	\N
109122	GENERIC_DAY	0	0	2010-06-16	40199	\N	97575	\N	\N
109123	GENERIC_DAY	0	0	2010-06-03	19500	\N	97575	\N	\N
109124	GENERIC_DAY	0	0	2010-10-18	1320	\N	97575	\N	\N
109125	GENERIC_DAY	0	1	2010-06-17	1332	\N	97575	\N	\N
109126	GENERIC_DAY	0	1	2010-09-28	1318	\N	97575	\N	\N
109127	GENERIC_DAY	0	0	2010-06-30	19498	\N	97575	\N	\N
109128	GENERIC_DAY	0	0	2010-06-03	85043	\N	97575	\N	\N
109129	GENERIC_DAY	0	0	2010-10-03	1320	\N	97575	\N	\N
109130	GENERIC_DAY	0	1	2010-08-31	1324	\N	97575	\N	\N
109131	GENERIC_DAY	0	0	2010-10-19	85043	\N	97575	\N	\N
109132	GENERIC_DAY	0	1	2010-09-01	2728	\N	97575	\N	\N
109133	GENERIC_DAY	0	1	2010-07-15	19494	\N	97575	\N	\N
109134	GENERIC_DAY	0	2	2010-05-20	1322	\N	97575	\N	\N
109135	GENERIC_DAY	0	0	2010-05-22	19494	\N	97575	\N	\N
109136	GENERIC_DAY	0	2	2010-06-22	19496	\N	97575	\N	\N
109137	GENERIC_DAY	0	0	2010-06-08	1326	\N	97575	\N	\N
109138	GENERIC_DAY	0	0	2010-08-15	1320	\N	97575	\N	\N
109139	GENERIC_DAY	0	0	2010-07-21	61308	\N	97575	\N	\N
109140	GENERIC_DAY	0	0	2010-07-04	1318	\N	97575	\N	\N
109141	GENERIC_DAY	0	0	2010-08-06	19494	\N	97575	\N	\N
109142	GENERIC_DAY	0	0	2010-09-11	1318	\N	97575	\N	\N
109143	GENERIC_DAY	0	0	2010-07-17	1326	\N	97575	\N	\N
109144	GENERIC_DAY	0	0	2010-06-06	1316	\N	97575	\N	\N
109145	GENERIC_DAY	0	0	2010-07-31	40199	\N	97575	\N	\N
109146	GENERIC_DAY	0	0	2010-10-16	19494	\N	97575	\N	\N
109147	GENERIC_DAY	0	1	2010-06-29	1328	\N	97575	\N	\N
109148	GENERIC_DAY	0	1	2010-10-08	50401	\N	97575	\N	\N
109149	GENERIC_DAY	0	0	2010-06-13	1314	\N	97575	\N	\N
109150	GENERIC_DAY	0	0	2010-05-17	1318	\N	97575	\N	\N
109151	GENERIC_DAY	0	0	2010-10-01	1322	\N	97575	\N	\N
109152	GENERIC_DAY	0	0	2010-06-30	50401	\N	97575	\N	\N
109153	GENERIC_DAY	0	0	2010-05-11	1330	\N	97575	\N	\N
109154	GENERIC_DAY	0	0	2010-06-07	1316	\N	97575	\N	\N
109155	GENERIC_DAY	0	1	2010-06-15	1314	\N	97575	\N	\N
109156	GENERIC_DAY	0	0	2010-09-03	1320	\N	97575	\N	\N
109157	GENERIC_DAY	0	0	2010-08-17	19498	\N	97575	\N	\N
109158	GENERIC_DAY	0	0	2010-09-21	61308	\N	97575	\N	\N
109159	GENERIC_DAY	0	0	2010-09-14	40199	\N	97575	\N	\N
109160	GENERIC_DAY	0	2	2010-08-13	40199	\N	97575	\N	\N
109161	GENERIC_DAY	0	0	2010-06-24	1318	\N	97575	\N	\N
109162	GENERIC_DAY	0	0	2010-05-12	1330	\N	97575	\N	\N
109163	GENERIC_DAY	0	1	2010-09-22	1318	\N	97575	\N	\N
109164	GENERIC_DAY	0	1	2010-07-06	1328	\N	97575	\N	\N
109165	GENERIC_DAY	0	0	2010-09-05	1332	\N	97575	\N	\N
109166	GENERIC_DAY	0	0	2010-05-24	50401	\N	97575	\N	\N
109167	GENERIC_DAY	0	0	2010-08-11	50401	\N	97575	\N	\N
109168	GENERIC_DAY	0	0	2010-05-15	1314	\N	97575	\N	\N
109169	GENERIC_DAY	0	0	2010-07-22	1316	\N	97575	\N	\N
109170	GENERIC_DAY	0	0	2010-06-05	1318	\N	97575	\N	\N
109171	GENERIC_DAY	0	2	2010-09-27	1322	\N	97575	\N	\N
109172	GENERIC_DAY	0	2	2010-05-28	61308	\N	97575	\N	\N
109173	GENERIC_DAY	0	0	2010-09-29	1332	\N	97575	\N	\N
109174	GENERIC_DAY	0	0	2010-08-28	19496	\N	97575	\N	\N
109175	GENERIC_DAY	0	0	2010-07-24	61308	\N	97575	\N	\N
109176	GENERIC_DAY	0	0	2010-08-17	1316	\N	97575	\N	\N
109177	GENERIC_DAY	0	0	2010-06-14	50401	\N	97575	\N	\N
109178	GENERIC_DAY	0	1	2010-06-01	1328	\N	97575	\N	\N
109179	GENERIC_DAY	0	0	2010-07-10	1328	\N	97575	\N	\N
109180	GENERIC_DAY	0	0	2010-10-04	1320	\N	97575	\N	\N
109181	GENERIC_DAY	0	0	2010-07-11	1314	\N	97575	\N	\N
109182	GENERIC_DAY	0	0	2010-08-15	19494	\N	97575	\N	\N
109183	GENERIC_DAY	0	0	2010-07-20	1320	\N	97575	\N	\N
109184	GENERIC_DAY	0	1	2010-07-08	19494	\N	97575	\N	\N
109185	GENERIC_DAY	0	0	2010-08-29	19494	\N	97575	\N	\N
109186	GENERIC_DAY	0	0	2010-06-29	40199	\N	97575	\N	\N
109187	GENERIC_DAY	0	0	2010-05-01	50401	\N	97575	\N	\N
109188	GENERIC_DAY	0	0	2010-06-25	1332	\N	97575	\N	\N
109189	GENERIC_DAY	0	2	2010-07-29	19496	\N	97575	\N	\N
109190	GENERIC_DAY	0	0	2010-08-01	50401	\N	97575	\N	\N
109191	GENERIC_DAY	0	0	2010-07-14	50401	\N	97575	\N	\N
109192	GENERIC_DAY	0	0	2010-04-30	1332	\N	97575	\N	\N
109193	GENERIC_DAY	0	0	2010-05-31	1326	\N	97575	\N	\N
109194	GENERIC_DAY	0	2	2010-08-27	61308	\N	97575	\N	\N
109195	GENERIC_DAY	0	0	2010-07-09	1328	\N	97575	\N	\N
109196	GENERIC_DAY	0	0	2010-09-15	1328	\N	97575	\N	\N
109197	GENERIC_DAY	0	0	2010-06-04	1326	\N	97575	\N	\N
109198	GENERIC_DAY	0	0	2010-06-15	40199	\N	97575	\N	\N
109199	GENERIC_DAY	0	0	2010-05-22	1314	\N	97575	\N	\N
109200	GENERIC_DAY	0	0	2010-06-30	1326	\N	97575	\N	\N
109201	GENERIC_DAY	0	0	2010-08-15	19498	\N	97575	\N	\N
109202	GENERIC_DAY	0	0	2010-10-04	19498	\N	97575	\N	\N
109203	GENERIC_DAY	0	1	2010-04-29	85043	\N	97575	\N	\N
109204	GENERIC_DAY	0	0	2010-05-09	1326	\N	97575	\N	\N
109205	GENERIC_DAY	0	0	2010-06-25	1318	\N	97575	\N	\N
109206	GENERIC_DAY	0	0	2010-07-26	40199	\N	97575	\N	\N
109207	GENERIC_DAY	0	0	2010-08-08	1322	\N	97575	\N	\N
109208	GENERIC_DAY	0	0	2010-05-19	1316	\N	97575	\N	\N
109209	GENERIC_DAY	0	0	2010-08-04	1316	\N	97575	\N	\N
109210	GENERIC_DAY	0	1	2010-09-15	1324	\N	97575	\N	\N
109211	GENERIC_DAY	0	0	2010-09-22	1330	\N	97575	\N	\N
109212	GENERIC_DAY	0	0	2010-07-27	1326	\N	97575	\N	\N
109213	GENERIC_DAY	0	0	2010-09-02	85043	\N	97575	\N	\N
109214	GENERIC_DAY	0	1	2010-06-01	1332	\N	97575	\N	\N
109215	GENERIC_DAY	0	0	2010-07-17	2728	\N	97575	\N	\N
109216	GENERIC_DAY	0	0	2010-08-06	19498	\N	97575	\N	\N
109217	GENERIC_DAY	0	0	2010-08-28	19498	\N	97575	\N	\N
109218	GENERIC_DAY	0	0	2010-08-30	1332	\N	97575	\N	\N
109219	GENERIC_DAY	0	0	2010-09-18	40199	\N	97575	\N	\N
109220	GENERIC_DAY	0	0	2010-09-21	1330	\N	97575	\N	\N
109221	GENERIC_DAY	0	1	2010-05-20	19494	\N	97575	\N	\N
109222	GENERIC_DAY	0	1	2010-08-04	19494	\N	97575	\N	\N
109223	GENERIC_DAY	0	0	2010-06-19	1324	\N	97575	\N	\N
109224	GENERIC_DAY	0	0	2010-06-08	1314	\N	97575	\N	\N
109225	GENERIC_DAY	0	0	2010-07-10	2728	\N	97575	\N	\N
109226	GENERIC_DAY	0	0	2010-05-20	1318	\N	97575	\N	\N
109227	GENERIC_DAY	0	0	2010-08-01	1314	\N	97575	\N	\N
109228	GENERIC_DAY	0	0	2010-08-13	1324	\N	97575	\N	\N
109229	GENERIC_DAY	0	2	2010-09-03	40199	\N	97575	\N	\N
109230	GENERIC_DAY	0	0	2010-08-18	1322	\N	97575	\N	\N
109231	GENERIC_DAY	0	0	2010-09-17	1314	\N	97575	\N	\N
109232	GENERIC_DAY	0	1	2010-10-11	1318	\N	97575	\N	\N
109233	GENERIC_DAY	0	2	2010-09-10	1316	\N	97575	\N	\N
109234	GENERIC_DAY	0	0	2010-07-25	1316	\N	97575	\N	\N
109235	GENERIC_DAY	0	0	2010-09-12	19496	\N	97575	\N	\N
109236	GENERIC_DAY	0	0	2010-08-20	1324	\N	97575	\N	\N
109237	GENERIC_DAY	0	2	2010-07-19	1314	\N	97575	\N	\N
109238	GENERIC_DAY	0	0	2010-07-02	1328	\N	97575	\N	\N
109239	GENERIC_DAY	0	2	2010-07-20	1314	\N	97575	\N	\N
109240	GENERIC_DAY	0	0	2010-05-04	1326	\N	97575	\N	\N
109241	GENERIC_DAY	0	0	2010-09-05	1326	\N	97575	\N	\N
109242	GENERIC_DAY	0	0	2010-06-17	1324	\N	97575	\N	\N
109243	GENERIC_DAY	0	0	2010-10-13	1326	\N	97575	\N	\N
109244	GENERIC_DAY	0	1	2010-07-05	1332	\N	97575	\N	\N
109245	GENERIC_DAY	0	0	2010-08-19	85043	\N	97575	\N	\N
109246	GENERIC_DAY	0	0	2010-07-16	1326	\N	97575	\N	\N
109247	GENERIC_DAY	0	2	2010-09-08	1314	\N	97575	\N	\N
109248	GENERIC_DAY	0	0	2010-08-18	1326	\N	97575	\N	\N
109249	GENERIC_DAY	0	1	2010-06-29	1332	\N	97575	\N	\N
109250	GENERIC_DAY	0	0	2010-07-08	19500	\N	97575	\N	\N
109251	GENERIC_DAY	0	1	2010-09-21	1324	\N	97575	\N	\N
109252	GENERIC_DAY	0	0	2010-09-09	61308	\N	97575	\N	\N
109253	GENERIC_DAY	0	0	2010-10-13	50401	\N	97575	\N	\N
109254	GENERIC_DAY	0	0	2010-05-29	1322	\N	97575	\N	\N
109255	GENERIC_DAY	0	1	2010-05-31	2728	\N	97575	\N	\N
109256	GENERIC_DAY	0	0	2010-08-06	19500	\N	97575	\N	\N
109257	GENERIC_DAY	0	0	2010-06-07	61308	\N	97575	\N	\N
109258	GENERIC_DAY	0	0	2010-09-12	1318	\N	97575	\N	\N
109259	GENERIC_DAY	0	0	2010-06-09	40199	\N	97575	\N	\N
109260	GENERIC_DAY	0	0	2010-04-29	1324	\N	97575	\N	\N
109261	GENERIC_DAY	0	0	2010-06-27	19494	\N	97575	\N	\N
109262	GENERIC_DAY	0	1	2010-05-10	50401	\N	97575	\N	\N
109263	GENERIC_DAY	0	2	2010-08-19	19496	\N	97575	\N	\N
109264	GENERIC_DAY	0	0	2010-07-29	40199	\N	97575	\N	\N
109265	GENERIC_DAY	0	0	2010-05-10	1330	\N	97575	\N	\N
109266	GENERIC_DAY	0	0	2010-06-14	1316	\N	97575	\N	\N
109267	GENERIC_DAY	0	0	2010-07-12	19498	\N	97575	\N	\N
109268	GENERIC_DAY	0	1	2010-05-03	85043	\N	97575	\N	\N
109269	GENERIC_DAY	0	0	2010-09-23	1330	\N	97575	\N	\N
109270	GENERIC_DAY	0	0	2010-08-26	1330	\N	97575	\N	\N
109271	GENERIC_DAY	0	0	2010-05-20	1316	\N	97575	\N	\N
109272	GENERIC_DAY	0	0	2010-06-28	85043	\N	97575	\N	\N
109273	GENERIC_DAY	0	0	2010-09-07	19500	\N	97575	\N	\N
109274	GENERIC_DAY	0	1	2010-09-28	2728	\N	97575	\N	\N
109275	GENERIC_DAY	0	0	2010-07-04	61308	\N	97575	\N	\N
109276	GENERIC_DAY	0	0	2010-07-14	1330	\N	97575	\N	\N
109277	GENERIC_DAY	0	0	2010-05-14	1322	\N	97575	\N	\N
109278	GENERIC_DAY	0	1	2010-09-30	2728	\N	97575	\N	\N
109279	GENERIC_DAY	0	2	2010-08-24	19496	\N	97575	\N	\N
109280	GENERIC_DAY	0	0	2010-05-02	19498	\N	97575	\N	\N
109281	GENERIC_DAY	0	1	2010-05-12	1322	\N	97575	\N	\N
109282	GENERIC_DAY	0	2	2010-08-18	1314	\N	97575	\N	\N
109283	GENERIC_DAY	0	0	2010-09-12	1314	\N	97575	\N	\N
109284	GENERIC_DAY	0	0	2010-10-10	1328	\N	97575	\N	\N
109285	GENERIC_DAY	0	0	2010-10-15	19496	\N	97575	\N	\N
109286	GENERIC_DAY	0	0	2010-10-08	1320	\N	97575	\N	\N
109287	GENERIC_DAY	0	0	2010-07-24	1322	\N	97575	\N	\N
109288	GENERIC_DAY	0	0	2010-08-31	50401	\N	97575	\N	\N
109289	GENERIC_DAY	0	0	2010-09-08	19498	\N	97575	\N	\N
109290	GENERIC_DAY	0	1	2010-09-15	1314	\N	97575	\N	\N
109291	GENERIC_DAY	0	1	2010-09-30	19496	\N	97575	\N	\N
109292	GENERIC_DAY	0	1	2010-06-15	1328	\N	97575	\N	\N
109293	GENERIC_DAY	0	0	2010-07-20	19500	\N	97575	\N	\N
109294	GENERIC_DAY	0	1	2010-05-11	1332	\N	97575	\N	\N
109295	GENERIC_DAY	0	0	2010-07-15	1316	\N	97575	\N	\N
109296	GENERIC_DAY	0	0	2010-05-22	1316	\N	97575	\N	\N
109297	GENERIC_DAY	0	2	2010-10-15	61308	\N	97575	\N	\N
109298	GENERIC_DAY	0	1	2010-08-31	2728	\N	97575	\N	\N
109299	GENERIC_DAY	0	2	2010-06-09	19496	\N	97575	\N	\N
109300	GENERIC_DAY	0	0	2010-09-08	1326	\N	97575	\N	\N
109301	GENERIC_DAY	0	2	2010-09-08	1324	\N	97575	\N	\N
109302	GENERIC_DAY	0	0	2010-10-03	1324	\N	97575	\N	\N
109303	GENERIC_DAY	0	0	2010-07-10	1318	\N	97575	\N	\N
109304	GENERIC_DAY	0	0	2010-09-23	1326	\N	97575	\N	\N
109305	GENERIC_DAY	0	0	2010-09-29	19500	\N	97575	\N	\N
109306	GENERIC_DAY	0	0	2010-06-21	1330	\N	97575	\N	\N
109307	GENERIC_DAY	0	0	2010-05-31	1318	\N	97575	\N	\N
109308	GENERIC_DAY	0	0	2010-08-08	1326	\N	97575	\N	\N
109309	GENERIC_DAY	0	1	2010-06-17	19494	\N	97575	\N	\N
109310	GENERIC_DAY	0	0	2010-05-16	19494	\N	97575	\N	\N
109311	GENERIC_DAY	0	0	2010-09-20	1326	\N	97575	\N	\N
109312	GENERIC_DAY	0	0	2010-06-26	19498	\N	97575	\N	\N
109313	GENERIC_DAY	0	0	2010-07-18	1326	\N	97575	\N	\N
109314	GENERIC_DAY	0	0	2010-09-18	1318	\N	97575	\N	\N
109315	GENERIC_DAY	0	0	2010-10-14	19498	\N	97575	\N	\N
109316	GENERIC_DAY	0	0	2010-04-30	19496	\N	97575	\N	\N
109317	GENERIC_DAY	0	0	2010-04-29	1314	\N	97575	\N	\N
109318	GENERIC_DAY	0	0	2010-07-25	50401	\N	97575	\N	\N
109319	GENERIC_DAY	0	0	2010-06-28	19500	\N	97575	\N	\N
109320	GENERIC_DAY	0	0	2010-05-01	2728	\N	97575	\N	\N
109321	GENERIC_DAY	0	1	2010-07-02	50401	\N	97575	\N	\N
109322	GENERIC_DAY	0	2	2010-10-18	1314	\N	97575	\N	\N
109323	GENERIC_DAY	0	0	2010-06-01	1314	\N	97575	\N	\N
109324	GENERIC_DAY	0	1	2010-08-11	1318	\N	97575	\N	\N
109325	GENERIC_DAY	0	0	2010-07-22	1320	\N	97575	\N	\N
109326	GENERIC_DAY	0	0	2010-09-19	85043	\N	97575	\N	\N
109327	GENERIC_DAY	0	0	2010-10-07	61308	\N	97575	\N	\N
109328	GENERIC_DAY	0	0	2010-07-24	19494	\N	97575	\N	\N
109329	GENERIC_DAY	0	0	2010-09-05	1322	\N	97575	\N	\N
109330	GENERIC_DAY	0	0	2010-05-15	85043	\N	97575	\N	\N
109331	GENERIC_DAY	0	0	2010-06-17	85043	\N	97575	\N	\N
109332	GENERIC_DAY	0	2	2010-07-09	40199	\N	97575	\N	\N
109333	GENERIC_DAY	0	2	2010-06-24	1314	\N	97575	\N	\N
109334	GENERIC_DAY	0	0	2010-09-11	1320	\N	97575	\N	\N
109335	GENERIC_DAY	0	1	2010-05-25	1332	\N	97575	\N	\N
109336	GENERIC_DAY	0	0	2010-05-22	19496	\N	97575	\N	\N
109337	GENERIC_DAY	0	2	2010-07-05	1314	\N	97575	\N	\N
109338	GENERIC_DAY	0	0	2010-05-16	1320	\N	97575	\N	\N
109339	GENERIC_DAY	0	0	2010-09-26	19498	\N	97575	\N	\N
109340	GENERIC_DAY	0	0	2010-08-01	1330	\N	97575	\N	\N
109341	GENERIC_DAY	0	0	2010-08-30	1330	\N	97575	\N	\N
109342	GENERIC_DAY	0	0	2010-10-01	19494	\N	97575	\N	\N
109343	GENERIC_DAY	0	0	2010-09-03	1332	\N	97575	\N	\N
109344	GENERIC_DAY	0	0	2010-10-07	40199	\N	97575	\N	\N
109345	GENERIC_DAY	0	0	2010-06-17	19498	\N	97575	\N	\N
109346	GENERIC_DAY	0	1	2010-09-14	1314	\N	97575	\N	\N
109347	GENERIC_DAY	0	0	2010-07-13	1316	\N	97575	\N	\N
109348	GENERIC_DAY	0	0	2010-06-05	1320	\N	97575	\N	\N
109349	GENERIC_DAY	0	0	2010-04-29	1318	\N	97575	\N	\N
109350	GENERIC_DAY	0	0	2010-06-12	1326	\N	97575	\N	\N
109351	GENERIC_DAY	0	0	2010-08-24	1332	\N	97575	\N	\N
109352	GENERIC_DAY	0	0	2010-07-05	1320	\N	97575	\N	\N
109353	GENERIC_DAY	0	0	2010-05-23	2728	\N	97575	\N	\N
109354	GENERIC_DAY	0	1	2010-06-23	19494	\N	97575	\N	\N
109355	GENERIC_DAY	0	0	2010-09-20	1328	\N	97575	\N	\N
109356	GENERIC_DAY	0	0	2010-08-02	1332	\N	97575	\N	\N
109357	GENERIC_DAY	0	0	2010-08-28	19494	\N	97575	\N	\N
109358	GENERIC_DAY	0	0	2010-08-22	1316	\N	97575	\N	\N
109359	GENERIC_DAY	0	1	2010-09-27	19496	\N	97575	\N	\N
109360	GENERIC_DAY	0	0	2010-09-13	1328	\N	97575	\N	\N
109361	GENERIC_DAY	0	0	2010-05-15	1332	\N	97575	\N	\N
109362	GENERIC_DAY	0	0	2010-08-17	1328	\N	97575	\N	\N
109363	GENERIC_DAY	0	1	2010-09-15	19496	\N	97575	\N	\N
109364	GENERIC_DAY	0	0	2010-05-18	50401	\N	97575	\N	\N
109365	GENERIC_DAY	0	0	2010-09-23	50401	\N	97575	\N	\N
109366	GENERIC_DAY	0	1	2010-05-11	1322	\N	97575	\N	\N
109367	GENERIC_DAY	0	0	2010-06-11	1326	\N	97575	\N	\N
109368	GENERIC_DAY	0	0	2010-08-01	1322	\N	97575	\N	\N
109369	GENERIC_DAY	0	0	2010-07-25	1322	\N	97575	\N	\N
109370	GENERIC_DAY	0	0	2010-07-07	1316	\N	97575	\N	\N
109371	GENERIC_DAY	0	0	2010-06-01	1326	\N	97575	\N	\N
109372	GENERIC_DAY	0	0	2010-05-03	19498	\N	97575	\N	\N
109373	GENERIC_DAY	0	0	2010-07-25	61308	\N	97575	\N	\N
109374	GENERIC_DAY	0	1	2010-05-10	19494	\N	97575	\N	\N
109375	GENERIC_DAY	0	2	2010-06-24	19496	\N	97575	\N	\N
109376	GENERIC_DAY	0	0	2010-09-25	2728	\N	97575	\N	\N
109377	GENERIC_DAY	0	0	2010-07-25	19496	\N	97575	\N	\N
109378	GENERIC_DAY	0	0	2010-05-08	19494	\N	97575	\N	\N
109379	GENERIC_DAY	0	0	2010-08-01	1328	\N	97575	\N	\N
109380	GENERIC_DAY	0	0	2010-09-18	2728	\N	97575	\N	\N
109381	GENERIC_DAY	0	0	2010-09-28	40199	\N	97575	\N	\N
109382	GENERIC_DAY	0	0	2010-05-30	1314	\N	97575	\N	\N
109383	GENERIC_DAY	0	1	2010-09-06	1314	\N	97575	\N	\N
109384	GENERIC_DAY	0	1	2010-05-03	50401	\N	97575	\N	\N
109385	GENERIC_DAY	0	1	2010-07-06	1324	\N	97575	\N	\N
109386	GENERIC_DAY	0	0	2010-10-17	50401	\N	97575	\N	\N
109387	GENERIC_DAY	0	0	2010-10-16	85043	\N	97575	\N	\N
109388	GENERIC_DAY	0	0	2010-09-04	1316	\N	97575	\N	\N
109389	GENERIC_DAY	0	1	2010-07-23	85043	\N	97575	\N	\N
109390	GENERIC_DAY	0	1	2010-05-04	2728	\N	97575	\N	\N
109391	GENERIC_DAY	0	1	2010-08-09	19494	\N	97575	\N	\N
109392	GENERIC_DAY	0	1	2010-06-28	1328	\N	97575	\N	\N
109393	GENERIC_DAY	0	0	2010-05-02	1318	\N	97575	\N	\N
109394	GENERIC_DAY	0	0	2010-10-11	1328	\N	97575	\N	\N
109395	GENERIC_DAY	0	0	2010-05-24	19498	\N	97575	\N	\N
109396	GENERIC_DAY	0	2	2010-08-06	40199	\N	97575	\N	\N
109397	GENERIC_DAY	0	0	2010-05-02	19500	\N	97575	\N	\N
109398	GENERIC_DAY	0	0	2010-06-06	1318	\N	97575	\N	\N
109399	GENERIC_DAY	0	2	2010-08-05	19496	\N	97575	\N	\N
109400	GENERIC_DAY	0	0	2010-10-19	1322	\N	97575	\N	\N
109401	GENERIC_DAY	0	0	2010-05-28	1328	\N	97575	\N	\N
109402	GENERIC_DAY	0	2	2010-06-21	1314	\N	97575	\N	\N
109403	GENERIC_DAY	0	0	2010-09-20	50401	\N	97575	\N	\N
109404	GENERIC_DAY	0	2	2010-05-19	1322	\N	97575	\N	\N
109405	GENERIC_DAY	0	0	2010-08-12	19498	\N	97575	\N	\N
109406	GENERIC_DAY	0	0	2010-09-29	1328	\N	97575	\N	\N
109407	GENERIC_DAY	0	2	2010-10-20	1314	\N	97575	\N	\N
109408	GENERIC_DAY	0	0	2010-04-30	1326	\N	97575	\N	\N
109409	GENERIC_DAY	0	0	2010-07-21	1326	\N	97575	\N	\N
109410	GENERIC_DAY	0	1	2010-07-08	1328	\N	97575	\N	\N
109411	GENERIC_DAY	0	0	2010-06-27	1326	\N	97575	\N	\N
109412	GENERIC_DAY	0	0	2010-10-08	1314	\N	97575	\N	\N
109413	GENERIC_DAY	0	2	2010-06-09	1322	\N	97575	\N	\N
109414	GENERIC_DAY	0	1	2010-09-28	19494	\N	97575	\N	\N
109415	GENERIC_DAY	0	0	2010-09-11	19498	\N	97575	\N	\N
109416	GENERIC_DAY	0	0	2010-05-14	1320	\N	97575	\N	\N
109417	GENERIC_DAY	0	1	2010-06-15	2728	\N	97575	\N	\N
109418	GENERIC_DAY	0	1	2010-06-07	2728	\N	97575	\N	\N
109419	GENERIC_DAY	0	0	2010-10-01	1330	\N	97575	\N	\N
109420	GENERIC_DAY	0	0	2010-09-04	1328	\N	97575	\N	\N
109421	GENERIC_DAY	0	1	2010-07-15	2728	\N	97575	\N	\N
109422	GENERIC_DAY	0	0	2010-08-02	50401	\N	97575	\N	\N
109423	GENERIC_DAY	0	0	2010-05-02	1314	\N	97575	\N	\N
109424	GENERIC_DAY	0	0	2010-09-30	1326	\N	97575	\N	\N
109425	GENERIC_DAY	0	2	2010-10-01	61308	\N	97575	\N	\N
109426	GENERIC_DAY	0	0	2010-06-02	19498	\N	97575	\N	\N
109427	GENERIC_DAY	0	0	2010-09-07	1320	\N	97575	\N	\N
109428	GENERIC_DAY	0	0	2010-09-03	19498	\N	97575	\N	\N
109429	GENERIC_DAY	0	0	2010-05-29	19498	\N	97575	\N	\N
109430	GENERIC_DAY	0	0	2010-09-12	61308	\N	97575	\N	\N
109431	GENERIC_DAY	0	0	2010-08-01	1320	\N	97575	\N	\N
109432	GENERIC_DAY	0	0	2010-07-28	85043	\N	97575	\N	\N
109433	GENERIC_DAY	0	0	2010-10-10	1322	\N	97575	\N	\N
109434	GENERIC_DAY	0	0	2010-08-28	1326	\N	97575	\N	\N
109435	GENERIC_DAY	0	1	2010-07-05	19496	\N	97575	\N	\N
109436	GENERIC_DAY	0	2	2010-06-28	1314	\N	97575	\N	\N
109437	GENERIC_DAY	0	0	2010-08-17	61308	\N	97575	\N	\N
109438	GENERIC_DAY	0	2	2010-09-17	61308	\N	97575	\N	\N
109439	GENERIC_DAY	0	1	2010-05-31	1328	\N	97575	\N	\N
109440	GENERIC_DAY	0	0	2010-06-02	1326	\N	97575	\N	\N
109441	GENERIC_DAY	0	0	2010-07-07	1322	\N	97575	\N	\N
109442	GENERIC_DAY	0	0	2010-07-22	19500	\N	97575	\N	\N
109443	GENERIC_DAY	0	0	2010-06-27	1328	\N	97575	\N	\N
109444	GENERIC_DAY	0	0	2010-09-23	1316	\N	97575	\N	\N
109445	GENERIC_DAY	0	0	2010-10-20	1320	\N	97575	\N	\N
109446	GENERIC_DAY	0	0	2010-08-16	50401	\N	97575	\N	\N
109447	GENERIC_DAY	0	0	2010-05-28	1314	\N	97575	\N	\N
109448	GENERIC_DAY	0	1	2010-06-16	2728	\N	97575	\N	\N
109449	GENERIC_DAY	0	0	2010-06-11	1322	\N	97575	\N	\N
109450	GENERIC_DAY	0	2	2010-10-04	1322	\N	97575	\N	\N
109451	GENERIC_DAY	0	2	2010-05-21	40199	\N	97575	\N	\N
109452	GENERIC_DAY	0	0	2010-08-22	1314	\N	97575	\N	\N
109453	GENERIC_DAY	0	0	2010-08-14	1332	\N	97575	\N	\N
109454	GENERIC_DAY	0	0	2010-08-26	40199	\N	97575	\N	\N
109455	GENERIC_DAY	0	0	2010-06-16	1320	\N	97575	\N	\N
109456	GENERIC_DAY	0	0	2010-09-07	1328	\N	97575	\N	\N
109457	GENERIC_DAY	0	0	2010-06-25	1326	\N	97575	\N	\N
109458	GENERIC_DAY	0	0	2010-09-13	1320	\N	97575	\N	\N
109459	GENERIC_DAY	0	0	2010-09-19	61308	\N	97575	\N	\N
109460	GENERIC_DAY	0	0	2010-07-17	50401	\N	97575	\N	\N
109461	GENERIC_DAY	0	0	2010-08-05	1330	\N	97575	\N	\N
109462	GENERIC_DAY	0	0	2010-10-03	40199	\N	97575	\N	\N
109463	GENERIC_DAY	0	0	2010-08-28	1330	\N	97575	\N	\N
109464	GENERIC_DAY	0	0	2010-08-31	85043	\N	97575	\N	\N
109465	GENERIC_DAY	0	0	2010-10-09	85043	\N	97575	\N	\N
109466	GENERIC_DAY	0	0	2010-08-19	19500	\N	97575	\N	\N
109467	GENERIC_DAY	0	2	2010-10-19	2728	\N	97575	\N	\N
109468	GENERIC_DAY	0	0	2010-07-30	1314	\N	97575	\N	\N
109469	GENERIC_DAY	0	0	2010-05-06	1324	\N	97575	\N	\N
109470	GENERIC_DAY	0	0	2010-05-29	19494	\N	97575	\N	\N
109471	GENERIC_DAY	0	0	2010-07-02	1330	\N	97575	\N	\N
109472	GENERIC_DAY	0	0	2010-09-30	19500	\N	97575	\N	\N
109473	GENERIC_DAY	0	0	2010-10-05	1328	\N	97575	\N	\N
109474	GENERIC_DAY	0	0	2010-09-01	50401	\N	97575	\N	\N
109475	GENERIC_DAY	0	0	2010-07-18	19498	\N	97575	\N	\N
109476	GENERIC_DAY	0	0	2010-05-31	40199	\N	97575	\N	\N
109477	GENERIC_DAY	0	0	2010-07-11	1316	\N	97575	\N	\N
109478	GENERIC_DAY	0	1	2010-09-01	1314	\N	97575	\N	\N
109479	GENERIC_DAY	0	0	2010-08-01	19500	\N	97575	\N	\N
109480	GENERIC_DAY	0	0	2010-09-29	1320	\N	97575	\N	\N
109481	GENERIC_DAY	0	0	2010-05-18	61308	\N	97575	\N	\N
109482	GENERIC_DAY	0	0	2010-07-16	1332	\N	97575	\N	\N
109483	GENERIC_DAY	0	0	2010-05-04	1330	\N	97575	\N	\N
109484	GENERIC_DAY	0	0	2010-09-29	1330	\N	97575	\N	\N
109485	GENERIC_DAY	0	0	2010-06-04	2728	\N	97575	\N	\N
109486	GENERIC_DAY	0	0	2010-08-08	1328	\N	97575	\N	\N
109487	GENERIC_DAY	0	0	2010-08-07	1316	\N	97575	\N	\N
109488	GENERIC_DAY	0	0	2010-09-02	61308	\N	97575	\N	\N
109489	GENERIC_DAY	0	0	2010-07-11	1320	\N	97575	\N	\N
109490	GENERIC_DAY	0	0	2010-05-24	1318	\N	97575	\N	\N
109491	GENERIC_DAY	0	0	2010-06-07	19498	\N	97575	\N	\N
109492	GENERIC_DAY	0	0	2010-08-17	1320	\N	97575	\N	\N
109493	GENERIC_DAY	0	0	2010-09-13	40199	\N	97575	\N	\N
109494	GENERIC_DAY	0	0	2010-07-11	1332	\N	97575	\N	\N
109495	GENERIC_DAY	0	0	2010-08-12	85043	\N	97575	\N	\N
109496	GENERIC_DAY	0	0	2010-07-18	61308	\N	97575	\N	\N
109497	GENERIC_DAY	0	2	2010-10-19	19494	\N	97575	\N	\N
109498	GENERIC_DAY	0	1	2010-06-16	1332	\N	97575	\N	\N
109499	GENERIC_DAY	0	0	2010-08-13	1320	\N	97575	\N	\N
109500	GENERIC_DAY	0	0	2010-09-14	1328	\N	97575	\N	\N
109501	GENERIC_DAY	0	1	2010-09-02	2728	\N	97575	\N	\N
109502	GENERIC_DAY	0	0	2010-07-12	1330	\N	97575	\N	\N
109503	GENERIC_DAY	0	0	2010-08-12	1330	\N	97575	\N	\N
109504	GENERIC_DAY	0	0	2010-07-17	85043	\N	97575	\N	\N
109505	GENERIC_DAY	0	1	2010-04-29	2728	\N	97575	\N	\N
109506	GENERIC_DAY	0	0	2010-09-19	50401	\N	97575	\N	\N
109507	GENERIC_DAY	0	0	2010-07-09	1318	\N	97575	\N	\N
109508	GENERIC_DAY	0	0	2010-07-31	61308	\N	97575	\N	\N
109509	GENERIC_DAY	0	0	2010-09-11	1330	\N	97575	\N	\N
109510	GENERIC_DAY	0	1	2010-09-16	1324	\N	97575	\N	\N
109511	GENERIC_DAY	0	0	2010-06-25	19496	\N	97575	\N	\N
109512	GENERIC_DAY	0	1	2010-10-12	1332	\N	97575	\N	\N
109513	GENERIC_DAY	0	0	2010-05-07	1320	\N	97575	\N	\N
109514	GENERIC_DAY	0	0	2010-07-03	1328	\N	97575	\N	\N
109515	GENERIC_DAY	0	0	2010-06-06	1324	\N	97575	\N	\N
109516	GENERIC_DAY	0	0	2010-06-26	50401	\N	97575	\N	\N
109517	GENERIC_DAY	0	0	2010-09-15	19498	\N	97575	\N	\N
109518	GENERIC_DAY	0	0	2010-10-04	1316	\N	97575	\N	\N
109519	GENERIC_DAY	0	1	2010-07-13	19494	\N	97575	\N	\N
109520	GENERIC_DAY	0	0	2010-07-07	1318	\N	97575	\N	\N
109521	GENERIC_DAY	0	0	2010-10-05	19500	\N	97575	\N	\N
109522	GENERIC_DAY	0	1	2010-09-09	19494	\N	97575	\N	\N
109523	GENERIC_DAY	0	0	2010-05-30	2728	\N	97575	\N	\N
109524	GENERIC_DAY	0	1	2010-09-17	85043	\N	97575	\N	\N
109525	GENERIC_DAY	0	0	2010-07-27	40199	\N	97575	\N	\N
109526	GENERIC_DAY	0	0	2010-07-08	1322	\N	97575	\N	\N
109527	GENERIC_DAY	0	0	2010-10-05	1332	\N	97575	\N	\N
109528	GENERIC_DAY	0	0	2010-05-08	1332	\N	97575	\N	\N
109529	GENERIC_DAY	0	1	2010-10-04	1314	\N	97575	\N	\N
109530	GENERIC_DAY	0	0	2010-07-01	50401	\N	97575	\N	\N
109531	GENERIC_DAY	0	2	2010-06-08	1322	\N	97575	\N	\N
109532	GENERIC_DAY	0	0	2010-10-13	1320	\N	97575	\N	\N
109533	GENERIC_DAY	0	2	2010-08-13	1316	\N	97575	\N	\N
109534	GENERIC_DAY	0	0	2010-06-09	1330	\N	97575	\N	\N
109535	GENERIC_DAY	0	0	2010-05-09	19500	\N	97575	\N	\N
109536	GENERIC_DAY	0	0	2010-08-30	19498	\N	97575	\N	\N
109537	GENERIC_DAY	0	0	2010-06-01	50401	\N	97575	\N	\N
109538	GENERIC_DAY	0	1	2010-07-16	85043	\N	97575	\N	\N
109539	GENERIC_DAY	0	0	2010-05-24	1320	\N	97575	\N	\N
109540	GENERIC_DAY	0	0	2010-10-10	19494	\N	97575	\N	\N
109541	GENERIC_DAY	0	0	2010-08-28	61308	\N	97575	\N	\N
109542	GENERIC_DAY	0	0	2010-07-31	1324	\N	97575	\N	\N
109543	GENERIC_DAY	0	0	2010-08-20	1330	\N	97575	\N	\N
109544	GENERIC_DAY	0	0	2010-07-04	19494	\N	97575	\N	\N
109545	GENERIC_DAY	0	0	2010-08-22	2728	\N	97575	\N	\N
109546	GENERIC_DAY	0	1	2010-09-27	19494	\N	97575	\N	\N
109547	GENERIC_DAY	0	0	2010-06-20	1322	\N	97575	\N	\N
109548	GENERIC_DAY	0	1	2010-05-26	2728	\N	97575	\N	\N
109549	GENERIC_DAY	0	0	2010-08-28	50401	\N	97575	\N	\N
109550	GENERIC_DAY	0	1	2010-06-29	19494	\N	97575	\N	\N
109551	GENERIC_DAY	0	0	2010-09-04	1314	\N	97575	\N	\N
109552	GENERIC_DAY	0	0	2010-10-18	1330	\N	97575	\N	\N
109553	GENERIC_DAY	0	0	2010-09-21	50401	\N	97575	\N	\N
109554	GENERIC_DAY	0	2	2010-06-11	61308	\N	97575	\N	\N
109555	GENERIC_DAY	0	0	2010-05-02	1316	\N	97575	\N	\N
109556	GENERIC_DAY	0	0	2010-09-04	1332	\N	97575	\N	\N
109557	GENERIC_DAY	0	0	2010-09-22	61308	\N	97575	\N	\N
109558	GENERIC_DAY	0	0	2010-07-05	19498	\N	97575	\N	\N
109559	GENERIC_DAY	0	0	2010-09-25	1316	\N	97575	\N	\N
109560	GENERIC_DAY	0	1	2010-05-13	50401	\N	97575	\N	\N
109561	GENERIC_DAY	0	1	2010-05-20	2728	\N	97575	\N	\N
109562	GENERIC_DAY	0	0	2010-08-25	1316	\N	97575	\N	\N
109563	GENERIC_DAY	0	0	2010-06-03	1318	\N	97575	\N	\N
109564	GENERIC_DAY	0	0	2010-10-10	2728	\N	97575	\N	\N
109565	GENERIC_DAY	0	0	2010-10-11	85043	\N	97575	\N	\N
109566	GENERIC_DAY	0	0	2010-07-04	1322	\N	97575	\N	\N
109567	GENERIC_DAY	0	0	2010-08-28	1314	\N	97575	\N	\N
109568	GENERIC_DAY	0	0	2010-10-09	1328	\N	97575	\N	\N
109569	GENERIC_DAY	0	0	2010-10-20	61308	\N	97575	\N	\N
109570	GENERIC_DAY	0	0	2010-06-01	1320	\N	97575	\N	\N
109571	GENERIC_DAY	0	0	2010-10-10	19498	\N	97575	\N	\N
109572	GENERIC_DAY	0	0	2010-06-13	1320	\N	97575	\N	\N
109573	GENERIC_DAY	0	0	2010-08-08	50401	\N	97575	\N	\N
109574	GENERIC_DAY	0	0	2010-07-25	1332	\N	97575	\N	\N
109575	GENERIC_DAY	0	2	2010-09-24	61308	\N	97575	\N	\N
109576	GENERIC_DAY	0	0	2010-07-29	1328	\N	97575	\N	\N
109577	GENERIC_DAY	0	0	2010-09-10	19496	\N	97575	\N	\N
109578	GENERIC_DAY	0	0	2010-09-18	1332	\N	97575	\N	\N
109579	GENERIC_DAY	0	0	2010-06-18	1322	\N	97575	\N	\N
109580	GENERIC_DAY	0	0	2010-08-15	85043	\N	97575	\N	\N
109581	GENERIC_DAY	0	0	2010-06-28	1316	\N	97575	\N	\N
109582	GENERIC_DAY	0	2	2010-08-09	1314	\N	97575	\N	\N
109583	GENERIC_DAY	0	0	2010-06-27	85043	\N	97575	\N	\N
109584	GENERIC_DAY	0	0	2010-09-02	1330	\N	97575	\N	\N
109585	GENERIC_DAY	0	0	2010-10-02	85043	\N	97575	\N	\N
109586	GENERIC_DAY	0	0	2010-06-02	1318	\N	97575	\N	\N
109587	GENERIC_DAY	0	0	2010-06-29	1316	\N	97575	\N	\N
109588	GENERIC_DAY	0	1	2010-08-17	1318	\N	97575	\N	\N
109589	GENERIC_DAY	0	1	2010-10-14	1316	\N	97575	\N	\N
109590	GENERIC_DAY	0	0	2010-07-26	1330	\N	97575	\N	\N
109591	GENERIC_DAY	0	0	2010-04-30	2728	\N	97575	\N	\N
109592	GENERIC_DAY	0	0	2010-09-13	1332	\N	97575	\N	\N
109593	GENERIC_DAY	0	0	2010-08-11	40199	\N	97575	\N	\N
109594	GENERIC_DAY	0	0	2010-10-14	1330	\N	97575	\N	\N
109595	GENERIC_DAY	0	0	2010-10-13	19500	\N	97575	\N	\N
109596	GENERIC_DAY	0	0	2010-05-20	1324	\N	97575	\N	\N
109597	GENERIC_DAY	0	0	2010-07-24	1328	\N	97575	\N	\N
109598	GENERIC_DAY	0	0	2010-09-10	1322	\N	97575	\N	\N
109599	GENERIC_DAY	0	0	2010-07-09	19498	\N	97575	\N	\N
109600	GENERIC_DAY	0	0	2010-06-11	1328	\N	97575	\N	\N
109601	GENERIC_DAY	0	0	2010-05-28	19496	\N	97575	\N	\N
109602	GENERIC_DAY	0	0	2010-07-20	1322	\N	97575	\N	\N
109603	GENERIC_DAY	0	0	2010-07-12	1316	\N	97575	\N	\N
109604	GENERIC_DAY	0	0	2010-10-02	1320	\N	97575	\N	\N
109605	GENERIC_DAY	0	1	2010-06-28	19494	\N	97575	\N	\N
109606	GENERIC_DAY	0	0	2010-06-07	19500	\N	97575	\N	\N
109607	GENERIC_DAY	0	0	2010-09-23	19498	\N	97575	\N	\N
109608	GENERIC_DAY	0	0	2010-08-30	1326	\N	97575	\N	\N
109609	GENERIC_DAY	0	0	2010-08-12	1320	\N	97575	\N	\N
109610	GENERIC_DAY	0	0	2010-09-21	19498	\N	97575	\N	\N
109611	GENERIC_DAY	0	1	2010-07-26	2728	\N	97575	\N	\N
109612	GENERIC_DAY	0	0	2010-08-02	1322	\N	97575	\N	\N
109613	GENERIC_DAY	0	0	2010-10-12	1328	\N	97575	\N	\N
109614	GENERIC_DAY	0	0	2010-05-04	1318	\N	97575	\N	\N
109615	GENERIC_DAY	0	0	2010-05-09	50401	\N	97575	\N	\N
109616	GENERIC_DAY	0	1	2010-06-02	1328	\N	97575	\N	\N
109617	GENERIC_DAY	0	2	2010-09-28	1322	\N	97575	\N	\N
109618	GENERIC_DAY	0	0	2010-09-27	1330	\N	97575	\N	\N
109619	GENERIC_DAY	0	1	2010-09-06	1318	\N	97575	\N	\N
109620	GENERIC_DAY	0	0	2010-06-27	40199	\N	97575	\N	\N
109621	GENERIC_DAY	0	0	2010-09-05	19494	\N	97575	\N	\N
109622	GENERIC_DAY	0	1	2010-10-11	19494	\N	97575	\N	\N
109623	GENERIC_DAY	0	0	2010-05-22	19500	\N	97575	\N	\N
109624	GENERIC_DAY	0	0	2010-08-11	85043	\N	97575	\N	\N
109625	GENERIC_DAY	0	0	2010-05-05	1324	\N	97575	\N	\N
109626	GENERIC_DAY	0	1	2010-04-29	50401	\N	97575	\N	\N
109627	GENERIC_DAY	0	0	2010-05-28	1324	\N	97575	\N	\N
109628	GENERIC_DAY	0	0	2010-09-06	61308	\N	97575	\N	\N
109629	GENERIC_DAY	0	0	2010-08-22	50401	\N	97575	\N	\N
109630	GENERIC_DAY	0	0	2010-10-03	1332	\N	97575	\N	\N
109631	GENERIC_DAY	0	1	2010-06-30	1332	\N	97575	\N	\N
109632	GENERIC_DAY	0	1	2010-05-19	1328	\N	97575	\N	\N
109633	GENERIC_DAY	0	0	2010-09-08	50401	\N	97575	\N	\N
109634	GENERIC_DAY	0	1	2010-06-03	1328	\N	97575	\N	\N
109635	GENERIC_DAY	0	1	2010-05-04	50401	\N	97575	\N	\N
109636	GENERIC_DAY	0	0	2010-10-19	61308	\N	97575	\N	\N
109637	GENERIC_DAY	0	0	2010-10-18	19496	\N	97575	\N	\N
109638	GENERIC_DAY	0	1	2010-05-19	1332	\N	97575	\N	\N
109639	GENERIC_DAY	0	2	2010-09-16	1322	\N	97575	\N	\N
109640	GENERIC_DAY	0	0	2010-08-20	19500	\N	97575	\N	\N
109641	GENERIC_DAY	0	1	2010-07-08	19496	\N	97575	\N	\N
109642	GENERIC_DAY	0	0	2010-06-13	1324	\N	97575	\N	\N
109643	GENERIC_DAY	0	1	2010-08-05	1324	\N	97575	\N	\N
109644	GENERIC_DAY	0	0	2010-05-22	1330	\N	97575	\N	\N
109645	GENERIC_DAY	0	0	2010-10-12	19498	\N	97575	\N	\N
109646	GENERIC_DAY	0	2	2010-06-08	19496	\N	97575	\N	\N
109647	GENERIC_DAY	0	0	2010-04-30	1324	\N	97575	\N	\N
109648	GENERIC_DAY	0	0	2010-05-31	1316	\N	97575	\N	\N
109649	GENERIC_DAY	0	1	2010-07-26	1324	\N	97575	\N	\N
109650	GENERIC_DAY	0	0	2010-07-25	19500	\N	97575	\N	\N
109651	GENERIC_DAY	0	0	2010-06-26	40199	\N	97575	\N	\N
109652	GENERIC_DAY	0	1	2010-09-29	1324	\N	97575	\N	\N
109653	GENERIC_DAY	0	0	2010-08-12	50401	\N	97575	\N	\N
109654	GENERIC_DAY	0	0	2010-09-12	85043	\N	97575	\N	\N
109655	GENERIC_DAY	0	0	2010-10-07	1320	\N	97575	\N	\N
109656	GENERIC_DAY	0	1	2010-07-01	19494	\N	97575	\N	\N
109657	GENERIC_DAY	0	0	2010-07-11	19494	\N	97575	\N	\N
109658	GENERIC_DAY	0	0	2010-10-05	19498	\N	97575	\N	\N
109659	GENERIC_DAY	0	0	2010-05-22	1322	\N	97575	\N	\N
109660	GENERIC_DAY	0	1	2010-07-19	1318	\N	97575	\N	\N
109661	GENERIC_DAY	0	2	2010-08-30	1322	\N	97575	\N	\N
109662	GENERIC_DAY	0	0	2010-05-23	19494	\N	97575	\N	\N
109663	GENERIC_DAY	0	0	2010-09-11	1332	\N	97575	\N	\N
109664	GENERIC_DAY	0	0	2010-05-25	1320	\N	97575	\N	\N
109665	GENERIC_DAY	0	0	2010-04-30	19500	\N	97575	\N	\N
109666	GENERIC_DAY	0	0	2010-05-08	19500	\N	97575	\N	\N
109667	GENERIC_DAY	0	1	2010-06-09	2728	\N	97575	\N	\N
109668	GENERIC_DAY	0	0	2010-05-03	1314	\N	97575	\N	\N
109669	GENERIC_DAY	0	1	2010-05-31	1332	\N	97575	\N	\N
109670	GENERIC_DAY	0	1	2010-07-06	2728	\N	97575	\N	\N
109671	GENERIC_DAY	0	1	2010-08-25	1324	\N	97575	\N	\N
109672	GENERIC_DAY	0	0	2010-10-03	1328	\N	97575	\N	\N
109673	GENERIC_DAY	0	1	2010-06-08	1332	\N	97575	\N	\N
109674	GENERIC_DAY	0	1	2010-09-01	19494	\N	97575	\N	\N
109675	GENERIC_DAY	0	0	2010-10-18	19500	\N	97575	\N	\N
109676	GENERIC_DAY	0	0	2010-06-28	61308	\N	97575	\N	\N
109677	GENERIC_DAY	0	1	2010-09-03	85043	\N	97575	\N	\N
109678	GENERIC_DAY	0	0	2010-07-12	19500	\N	97575	\N	\N
109679	GENERIC_DAY	0	0	2010-06-23	50401	\N	97575	\N	\N
109680	GENERIC_DAY	0	0	2010-04-30	1328	\N	97575	\N	\N
109681	GENERIC_DAY	0	1	2010-08-16	1318	\N	97575	\N	\N
109682	GENERIC_DAY	0	0	2010-07-18	19496	\N	97575	\N	\N
109683	GENERIC_DAY	0	0	2010-08-06	1320	\N	97575	\N	\N
109684	GENERIC_DAY	0	0	2010-07-05	40199	\N	97575	\N	\N
109685	GENERIC_DAY	0	0	2010-08-30	50401	\N	97575	\N	\N
109686	GENERIC_DAY	0	1	2010-05-05	61308	\N	97575	\N	\N
109687	GENERIC_DAY	0	0	2010-05-23	50401	\N	97575	\N	\N
109688	GENERIC_DAY	0	0	2010-10-09	1320	\N	97575	\N	\N
109689	GENERIC_DAY	0	0	2010-06-05	1322	\N	97575	\N	\N
109690	GENERIC_DAY	0	2	2010-04-30	50401	\N	97575	\N	\N
109691	GENERIC_DAY	0	0	2010-08-26	19500	\N	97575	\N	\N
109692	GENERIC_DAY	0	0	2010-07-17	1320	\N	97575	\N	\N
109693	GENERIC_DAY	0	1	2010-05-12	61308	\N	97575	\N	\N
109694	GENERIC_DAY	0	0	2010-10-02	2728	\N	97575	\N	\N
109695	GENERIC_DAY	0	0	2010-09-22	85043	\N	97575	\N	\N
109696	GENERIC_DAY	0	0	2010-10-17	1322	\N	97575	\N	\N
109697	GENERIC_DAY	0	0	2010-10-15	1324	\N	97575	\N	\N
109698	GENERIC_DAY	0	0	2010-05-08	50401	\N	97575	\N	\N
109699	GENERIC_DAY	0	0	2010-08-16	1330	\N	97575	\N	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
819228	13	\N	\N	1
819230	14	\N	\N	0
819229	14	\N	\N	0
6521371	6	20059	20061	0
6521291	3	\N	\N	0
6521370	6	20058	20062	0
6521360	6	20058	20062	0
6521363	6	20055	20056	0
6521361	6	20059	20061	0
6521372	6	20059	20060	1
6521373	6	20055	20056	0
6521374	6	20056	20057	0
6521364	6	20056	20057	0
6521362	6	20059	20060	1
6521375	2	20064	20061	0
29261824	12	57370	57371	1
6520943	41	19999	20000	0
6520872	41	19999	20000	0
6521294	5	20042	20025	0
6521295	5	20042	20025	0
6521287	10	20022	20026	0
6521293	7	20023	20025	0
6521290	10	20023	20024	1
6521292	7	20023	20025	0
6521288	10	20019	20020	0
6521289	10	20020	20021	0
6520867	40	19999	20000	0
6520868	40	20000	20001	0
6520944	41	20000	20001	0
6520873	41	20000	20001	0
19169281	25	57368	57369	0
19169282	25	57368	57369	0
19169280	25	57368	57369	0
6520969	11	20012	20016	0
6521152	12	20012	20016	0
6520980	11	20012	20016	0
6521349	4	20053	20050	0
6521333	9	20047	20051	0
6521338	10	20047	20051	0
6521343	10	20047	20051	0
6521335	9	20048	20050	0
6521339	10	20048	20049	1
6521344	10	20048	20049	1
6521174	12	20012	20016	0
6521334	9	20048	20049	1
6521242	12	20012	20016	0
6520985	12	20012	20016	0
6520983	11	20013	20014	1
6521177	12	20013	20014	1
6521155	12	20013	20014	1
6520988	12	20013	20014	1
6521245	12	20013	20014	1
6521340	10	20048	20050	0
6521156	12	20014	20015	0
6520984	11	20014	20015	0
6520989	12	20014	20015	0
6521246	12	20014	20015	0
6521178	12	20014	20015	0
6521252	10	20029	20015	0
6521348	4	20053	20050	0
6521345	10	20048	20050	0
6521346	10	20044	20045	0
6521336	9	20044	20045	0
6521341	10	20044	20045	0
6521337	9	20045	20046	0
6521347	10	20045	20046	0
6521342	10	20045	20046	0
6521251	10	20029	20015	0
6521153	12	20009	20010	0
6521175	12	20009	20010	0
6521243	12	20009	20010	0
6520986	12	20009	20010	0
6520970	11	20009	20010	0
6520981	11	20009	20010	0
6521154	12	20010	20011	0
6521176	12	20010	20011	0
6520987	12	20010	20011	0
6520982	11	20010	20011	0
6521244	12	20010	20011	0
6520971	11	20010	20011	0
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
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
58388	58305	5.00
58389	58306	10.00
58390	58307	15.00
18808	1619	100.00
18605	1623	5.00
18606	1624	10.00
18607	1625	15.00
18809	1626	100.00
88779	1627	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1819	1	Barreras	A36600971	t	f	f	\N	\N	\N	\N
1820	1	Factoria Naval de Marin	B81998841	t	f	f	\N	\N	\N	\N
1821	1	Navantia	B84076397	t	f	f	\N	\N	\N	\N
1818	2	Vulcano	A36600740	t	t	f	\N	\N	\N	\N
82315	1	Igalia	1A	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	912
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
20210
20240
20241
20274
20275
20276
20279
20290
30421
30422
30423
30466
30467
30468
30498
30499
30500
36161
36164
36167
36197
36198
36199
36215
36216
36219
55957
82822
92417
94343
97569
97571
97573
97575
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
1087
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id, code) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
23942	5	PREFIX-00003-00009-00001	WORKER	300	1.00	f	23644	\N
23943	5	PREFIX-00003-00010-00001	WORKER	250	1.00	f	23645	\N
23944	5	PREFIX-00003-00011-00001	WORKER	200	1.00	f	23646	\N
23949	5	PREFIX-00004-00008-00001	WORKER	200	1.00	f	23655	\N
23950	5	PREFIX-00004-00009-00001	WORKER	300	1.00	f	23657	\N
23951	5	PREFIX-00004-00010-00001	WORKER	250	1.00	f	23658	\N
23952	5	PREFIX-00004-00011-00001	WORKER	200	1.00	f	23659	\N
23953	5	PREFIX-00005-00004-00001	WORKER	100	1.00	f	23663	\N
23954	5	PREFIX-00005-00005-00001	WORKER	100	1.00	f	23664	\N
23955	5	PREFIX-00005-00006-00001	WORKER	350	1.00	f	23666	\N
23956	5	PREFIX-00005-00007-00001	WORKER	200	1.00	f	23667	\N
23957	5	PREFIX-00005-00008-00001	WORKER	100	1.00	f	23668	\N
23958	5	PREFIX-00005-00009-00001	WORKER	300	1.00	f	23670	\N
23959	5	PREFIX-00005-00010-00001	WORKER	250	1.00	f	23671	\N
23960	5	PREFIX-00005-00011-00001	WORKER	200	1.00	f	23672	\N
23937	5	PREFIX-00003-00004-00001	WORKER	100	1.00	f	23637	\N
23938	5	PREFIX-00003-00005-00001	WORKER	100	1.00	f	23638	\N
23939	5	PREFIX-00003-00006-00001	WORKER	350	1.00	f	23640	\N
23940	5	PREFIX-00003-00007-00001	WORKER	200	1.00	f	23641	\N
23941	5	PREFIX-00003-00008-00001	WORKER	100	1.00	f	23642	\N
23961	5	PREFIX-00006-00004-00001	WORKER	100	1.00	f	23676	\N
23962	5	PREFIX-00006-00005-00001	WORKER	100	1.00	f	23677	\N
23963	5	PREFIX-00006-00006-00001	WORKER	350	1.00	f	23679	\N
23964	5	PREFIX-00006-00007-00001	WORKER	200	1.00	f	23680	\N
23945	5	PREFIX-00004-00004-00001	WORKER	100	1.00	f	23650	\N
23946	5	PREFIX-00004-00005-00001	WORKER	100	1.00	f	23651	\N
23947	5	PREFIX-00004-00006-00001	WORKER	350	1.00	f	23653	\N
23948	5	PREFIX-00004-00007-00001	WORKER	250	1.00	f	23654	\N
23965	5	PREFIX-00006-00008-00001	WORKER	100	1.00	f	23681	\N
23966	5	PREFIX-00006-00009-00001	WORKER	300	1.00	f	23683	\N
23967	5	PREFIX-00006-00010-00001	WORKER	250	1.00	f	23684	\N
23968	5	PREFIX-00006-00011-00001	WORKER	200	1.00	f	23685	\N
57270	7	PREFIX-00002-00015-00001	WORKER	100	1.00	f	56968	\N
57267	7	PREFIX-00002-00012-00001	WORKER	100	1.00	f	56965	\N
57271	7	PREFIX-00002-00016-00001	WORKER	100	1.00	f	56969	\N
1919	22	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1620	\N
1920	22	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1621	\N
1921	22	PREFIX-00002-00006-00001	WORKER	200	1.00	f	1623	\N
1922	22	PREFIX-00002-00007-00001	WORKER	200	1.00	f	1624	\N
1923	22	PREFIX-00002-00008-00001	WORKER	100	1.00	f	1625	\N
1924	22	PREFIX-00002-00009-00001	WORKER	300	1.00	f	1627	\N
1925	22	PREFIX-00002-00010-00001	WORKER	250	1.00	f	1628	\N
1926	22	PREFIX-00002-00011-00001	WORKER	200	1.00	f	1629	\N
57268	7	PREFIX-00002-00013-00001	WORKER	100	1.00	f	56966	\N
57269	7	PREFIX-00002-00014-00001	WORKER	100	1.00	f	56967	\N
58132	1	b9db6693-8bd9-45c0-9412-88dbe021a49a	WORKER	100	1.00	f	\N	57843
58133	1	89d92e1f-f3b5-4d17-9032-bbfdab387dc8	WORKER	100	1.00	f	\N	57844
58134	1	b466694d-2d3d-4253-af80-c2cf4df39168	WORKER	200	1.00	f	\N	57846
58135	1	c1793a89-3f15-4eaf-bcfb-0d62ac7fa0a9	WORKER	200	1.00	f	\N	57847
58136	1	3f7f8085-a75c-448b-a0b6-ff04b4599f42	WORKER	100	1.00	f	\N	57848
58137	1	1ba2c332-b077-452e-a55f-3a69b0d04e17	WORKER	300	1.00	f	\N	57850
58138	1	6f796a9a-b5a3-47f2-a5fb-ff782ea2f162	WORKER	250	1.00	f	\N	57851
58139	1	7086d0fe-de4c-458f-b606-4625cf0189fb	WORKER	200	1.00	f	\N	57852
58140	1	75b90066-b448-4ca8-9fdf-aedef6288eff	WORKER	100	1.00	f	\N	57853
58141	1	48411391-ecd9-4b9a-b420-117a21fd54fa	WORKER	100	1.00	f	\N	57854
58142	1	db4b8209-f53b-4571-b3b0-511b2fe6e036	WORKER	100	1.00	f	\N	57855
58143	1	a1e4b9a7-893b-403e-9ef9-9fc98e43b5a5	WORKER	100	1.00	f	\N	57856
58144	1	daca7619-32dd-45ba-9129-72609d0964ce	WORKER	100	1.00	f	\N	57857
58145	1	2ea72ccb-16e1-4b62-bb31-1b25e1de8355	WORKER	100	1.00	f	\N	57858
58146	1	0fcf8356-b746-49d5-8ffe-dacbd78b6597	WORKER	100	1.00	f	\N	57859
58147	1	a88020ce-63a4-4a85-b2a3-c3256cc23a47	WORKER	100	1.00	f	\N	57860
58148	1	3dcf287f-36a5-4d2f-a1b9-b96b684825fa	WORKER	100	1.00	f	\N	57861
58149	1	86296093-2b61-4d77-80ac-cb8da87f2981	WORKER	100	1.00	f	\N	57862
58150	1	2392312a-b2dd-4135-8eb1-80383de82d4b	WORKER	100	1.00	f	\N	57863
58170	2	PREFIX-00009-00015-00001	WORKER	100	1.00	f	58302	\N
58171	2	PREFIX-00009-00016-00001	WORKER	100	1.00	f	58303	\N
58172	2	PREFIX-00009-00017-00001	WORKER	200	1.00	f	58305	\N
58173	2	PREFIX-00009-00018-00001	WORKER	200	1.00	f	58306	\N
58174	2	PREFIX-00009-00019-00001	WORKER	100	1.00	f	58307	\N
58175	2	PREFIX-00009-00020-00001	WORKER	300	1.00	f	58309	\N
58479	2	PREFIX-00009-00021-00001	WORKER	250	1.00	f	58310	\N
58480	2	PREFIX-00009-00022-00001	WORKER	200	1.00	f	58311	\N
58481	2	PREFIX-00009-00004-00001	WORKER	100	1.00	f	58312	\N
58482	2	PREFIX-00009-00005-00001	WORKER	100	1.00	f	58313	\N
57272	7	PREFIX-00002-00017-00001	WORKER	100	1.00	f	56970	\N
57273	7	PREFIX-00002-00018-00001	WORKER	100	1.00	f	56971	\N
57274	7	PREFIX-00002-00019-00001	WORKER	100	1.00	f	56972	\N
57275	7	PREFIX-00002-00020-00001	WORKER	100	1.00	f	56973	\N
57276	7	PREFIX-00002-00021-00001	WORKER	100	1.00	f	56974	\N
57277	7	PREFIX-00002-00022-00001	WORKER	100	1.00	f	56975	\N
58483	2	PREFIX-00009-00006-00001	WORKER	100	1.00	f	58314	\N
58484	2	PREFIX-00009-00007-00001	WORKER	100	1.00	f	58315	\N
58485	2	PREFIX-00009-00008-00001	WORKER	100	1.00	f	58316	\N
58486	2	PREFIX-00009-00009-00001	WORKER	100	1.00	f	58317	\N
58487	2	PREFIX-00009-00010-00001	WORKER	100	1.00	f	58318	\N
58488	2	PREFIX-00009-00011-00001	WORKER	100	1.00	f	58319	\N
58489	2	PREFIX-00009-00012-00001	WORKER	100	1.00	f	58320	\N
58490	2	PREFIX-00009-00013-00001	WORKER	100	1.00	f	58321	\N
58491	2	PREFIX-00009-00014-00001	WORKER	100	1.00	f	58322	\N
67771	3	PREFIX-00010-00001-00001	WORKER	100	1.00	f	67571	\N
67772	3	PREFIX-00010-00002-00001	WORKER	200	1.00	f	67572	\N
82618	1	PREFIX-00011-00002-00001	WORKER	0	1.00	f	82519	\N
82619	1	PREFIX-00011-00003-00001	WORKER	0	1.00	f	82520	\N
102919	3	PREFIX-00013-00001-00001	WORKER	1000	1.00	f	102720	\N
102920	3	PREFIX-00013-00002-00001	WORKER	1000	1.00	f	102721	\N
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
102	8	0
102	8	1
102	8	2
102	8	3
102	8	4
103	9	0
103	9	1
103	9	2
103	9	3
103	4	4
104	4	0
104	4	1
104	4	2
104	4	3
104	4	4
107	9	0
107	9	1
107	9	2
107	9	3
107	4	4
108	4	0
108	4	1
108	4	2
108	4	3
108	4	4
110	9	0
110	9	1
110	9	2
110	9	3
110	4	4
19699	8	0
19699	8	1
19699	8	2
19699	8	3
19699	8	4
93729	6	2
93729	6	3
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
23752	23675
23753	23678
23754	23682
23751	23674
23737	23636
23738	23639
23739	23643
23736	23635
23742	23649
23743	23652
23744	23656
23741	23648
23747	23662
23748	23665
23749	23669
23746	23661
58387	58301
58391	58304
58392	58304
58393	58308
58394	58300
58395	58300
67671	67570
82719	82518
82720	82517
1719	1619
18608	1622
1720	1622
88780	1626
1721	1626
74639	74538
18810	1618
1722	1618
18609	1618
102820	102719
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1212	1	21c56bf5-015f-4382-8ecd-321c2d3fc63d	Media	1111
1213	1	5b859874-e535-4ddb-89d1-36979c7c941f	Urxente	1111
1214	1	6dc2a575-684a-4f2b-8322-c6c4c7b9cdf5	Baixa	1111
1215	1	7aca4595-6e0d-4ac9-8313-4d11aa93f219	Moi urxente	1111
1220	1	d88a6ab9-c489-4b0a-81c7-be478548fbe2	Brasil	1113
1221	1	c676fc92-2a6c-4322-81c6-699f2ba10e6f	España	1113
1222	1	81a9aae2-97c9-4e5b-9f1e-794dc6157e65	Estados Unidos	1113
1223	1	0f84b89d-ac9d-4106-9a3d-d23c4a15cda4	Reino Unido	1113
1224	1	52cafd32-a26d-4a27-a440-b9275327f844	Portugal	1113
1225	1	063fc563-4718-4a03-92ee-f7208c548984	Peligrosidade baixa	1114
1226	1	d9f0d726-c972-4a2f-9529-01c619988db6	Peligrosidade media	1114
1227	1	26e88186-f363-4a41-8a33-0311f9c70871	Peligrosidade alta	1114
1228	1	8370a178-1e52-45fe-b092-a7e57ca7fd87	Media probabilidade de retraso	1115
1229	1	e5f260eb-feb5-496b-976d-f1dc97948627	Alta probabilidade de retraso	1115
1230	1	367cbb06-ae13-446a-a139-91dc97572a7d	Baixa probabilidade de retraso	1115
1217	2	50cd216d-59bf-4e8e-8b16-0fc23878553f	centro de coste 2	1112
1218	2	5d278674-9d8f-41d9-9797-944ca2198334	centro de coste 4	1112
1216	2	dbeb9835-2ede-4a4b-b25b-b0d35d50672e	centro de coste 3	1112
1219	2	253c6726-02ad-4032-9ef1-ebf534bc52ae	centro de coste 1	1112
41511	1	0936dd01-b7f9-4cfc-850f-cf7a6fd6ed3a	bueno	41410
41512	1	6cbe5720-9237-43eb-b9b0-58924c408e0d	malo	41410
41513	1	dabfd214-b117-4468-8c55-ed915241812b	regular	41410
52015	1	uno-c	uno	51914
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
1111	1	dbc01881-4cff-4a53-ae52-4ae8e28dbbc7	Prioridade	\N
1113	1	d0cca5f0-bf4c-4456-b91c-3e26b6a9e584	Nacionalidade cliente	\N
1114	1	2fc375cd-d6d1-43c9-91fc-9f197bcb4d9a	Peligrosidade traballo	\N
1115	1	637b38d1-b64a-4171-a3e4-4e076924a657	Posibilidade de retraso	\N
1112	2	7b93c698-9c2c-4fca-a400-005cb0aa2740	Centro de custe	t
41410	1	d15343cb-4b64-442d-a9ae-9bd9cd6817e9	tiempo	t
51914	1	uno	gravedad	f
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
84941	1	61308
84942	1	85043
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, start_date, start_hour, end_date, end_hour, creation_timestamp) FROM stdin;
92518	7	92417	\N	2010-04-02 00:00:00	\N	\N	\N	\N	0
94444	3	94343	\N	2011-02-07 02:36:00	\N	\N	\N	\N	0
92516	9	92415	\N	2010-04-27 00:00:00	\N	\N	\N	\N	0
92517	8	92416	\N	2010-04-28 00:00:00	\N	\N	\N	\N	0
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
42925	4	m1	material 1	10.00	40097	\N	42824
74437	4	M2	TORNILLO DE MADERA	10.00	40097	\N	42824
74438	3	c1	caixa1	10.00	40097	\N	74942
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
90395	2	10	10.00	74437	\N	1	1626
\.


--
-- Data for Name: material_assigment_template; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment_template (id, version, units, unit_price, material_id, order_element_template_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_category (id, version, name, parent_id, code, generatecode) FROM stdin;
808	6	Imported materials without category	\N	808	t
42824	5	tornillos	808	42824	t
74942	3	caixas	\N	700c1417-0f9c-414d-926d-91004380bc95	t
74943	2	ramon	\N	aqui	f
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled) FROM stdin;
909	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f
910	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
23836	USER	5	WRITE_AUTHORIZATION	23635	910	\N
23837	USER	5	WRITE_AUTHORIZATION	23648	910	\N
23838	USER	5	WRITE_AUTHORIZATION	23661	910	\N
23839	USER	5	WRITE_AUTHORIZATION	23674	910	\N
58681	USER	1	WRITE_AUTHORIZATION	58300	910	\N
67872	USER	2	WRITE_AUTHORIZATION	67570	910	\N
2020	USER	21	WRITE_AUTHORIZATION	1618	910	\N
103020	USER	2	WRITE_AUTHORIZATION	102719	910	\N
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
23635	Alumno grupo 2	\N	t	11	100000.00	0.00	1600	\N	\N	0	1819	3
23648	Usuario grupo 3	\N	t	11	200000.00	0.00	1750	\N	\N	0	1819	3
23661	Usuario Grupo 4	\N	t	11	150000.00	0.00	1600	\N	\N	0	1820	3
23674	Usuario grupo 5	\N	t	11	250000.00	0.00	1600	\N	\N	0	1820	3
58300	\N	\N	t	22	0.00	0.00	2550	\N	\N	0	\N	2
67570	javier moran	\N	t	2	0.00	0.00	300	referencia 1	\N	0	\N	1
82517	\N	\N	t	3	10000.00	0.00	0	cd1201	\N	5	82315	1
1618	Usuario grupo 1	\N	t	23	10000.00	0.00	2550	\N	\N	0	1818	2
102719	javier moran	\N	t	2	0.00	0.00	2000	adsf	\N	0	1819	1
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
23651	5	Reunións con traballadores	\N	PREFIX-00004-00005	\N	\N	1	23649	\N	\N	1
23652	5	Bloque 1	\N	PREFIX-00004-00002	\N	\N	3	23648	\N	\N	1
23653	5	Pintar camarotes A e B	\N	PREFIX-00004-00006	\N	\N	0	23652	\N	\N	0
23654	5	Pintar sá de máquinas	\N	PREFIX-00004-00007	\N	\N	0	23652	\N	\N	1
1618	25	Pedido grupo 1	Pedido de proba	PREFIX-00002	2010-03-01 22:40:25.505	2011-02-01 00:00:00	3	\N	\N	\N	\N
23655	5	Pintar cociñas de buque	\N	PREFIX-00004-00008	\N	\N	0	23652	\N	\N	2
23656	5	Bloque 2	\N	PREFIX-00004-00003	\N	\N	3	23648	\N	\N	2
23657	5	Teito de madeira de camarote A	\N	PREFIX-00004-00009	\N	\N	0	23656	\N	\N	0
23658	5	Cama e mesillas de camarote A	\N	PREFIX-00004-00010	\N	\N	0	23656	\N	\N	1
23659	5	Poñer escotillas camarote A	\N	PREFIX-00004-00011	\N	\N	0	23656	\N	\N	2
23636	5	Coordinacion	\N	PREFIX-00003-00001	\N	\N	0	23635	\N	\N	0
23637	5	Reunions con cliente	\N	PREFIX-00003-00004	\N	\N	1	23636	\N	\N	0
23638	5	Reunions con traballadores	\N	PREFIX-00003-00005	\N	\N	1	23636	\N	\N	1
23639	5	Bloque 1	\N	PREFIX-00003-00002	\N	\N	3	23635	\N	\N	1
23640	5	Pintar camarotes A e B	\N	PREFIX-00003-00006	\N	\N	0	23639	\N	\N	0
23641	5	Pintar sá de máquinas	\N	PREFIX-00003-00007	\N	\N	0	23639	\N	\N	1
23661	7	Pedido Grupo 4	\N	PREFIX-00005	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23662	5	Coordinacion	\N	PREFIX-00005-00001	\N	\N	0	23661	\N	\N	0
23642	5	Pintar cociñas de buque	\N	PREFIX-00003-00008	\N	\N	0	23639	\N	\N	2
23643	5	Bloque 2	\N	PREFIX-00003-00003	\N	\N	3	23635	\N	\N	2
23644	5	Aillar camarote A	\N	PREFIX-00003-00009	\N	\N	0	23643	\N	\N	0
23645	5	Aillar camarote B	\N	PREFIX-00003-00010	\N	\N	0	23643	\N	\N	1
23646	5	Aillar camarote C	\N	PREFIX-00003-00011	\N	\N	0	23643	\N	\N	2
23635	7	Pedido Grupo 2	\N	PREFIX-00003	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23648	7	Pedido Grupo 3	\N	PREFIX-00004	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23649	5	Coordinacion	\N	PREFIX-00004-00001	\N	\N	0	23648	\N	\N	0
23650	5	Reunións con cliente	\N	PREFIX-00004-00004	\N	\N	1	23649	\N	\N	0
23663	5	Reunions con cliente	\N	PREFIX-00005-00004	\N	\N	1	23662	\N	\N	0
23664	5	Reuncion con traballadores	\N	PREFIX-00005-00005	\N	\N	1	23662	\N	\N	1
23665	5	Bloque 1	\N	PREFIX-00005-00002	\N	\N	3	23661	\N	\N	1
23666	5	Soldar cuberta A	\N	PREFIX-00005-00006	\N	\N	0	23665	\N	\N	0
23667	5	Soldar cuberta B	\N	PREFIX-00005-00007	\N	\N	0	23665	\N	\N	1
23668	5	Soldar cuberta C	\N	PREFIX-00005-00008	\N	\N	0	23665	\N	\N	2
23669	5	Bloque 2	\N	PREFIX-00005-00003	\N	\N	3	23661	\N	\N	2
23670	5	Teito de madeira camarote A	\N	PREFIX-00005-00009	\N	\N	0	23669	\N	\N	0
23671	5	Cama e mesilla camarote A	\N	PREFIX-00005-00010	\N	\N	0	23669	\N	\N	1
23672	5	Poñer escotillas camarote A	\N	PREFIX-00005-00011	\N	\N	0	23669	\N	\N	2
23674	7	Pedido Grupo 5	\N	PREFIX-00006	2010-03-01 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23675	5	Coordinacion	\N	PREFIX-00006-00001	\N	\N	0	23674	\N	\N	0
23676	5	Reunions con traballadores	\N	PREFIX-00006-00004	\N	\N	1	23675	\N	\N	0
23677	5	Reunions cliente	\N	PREFIX-00006-00005	\N	\N	1	23675	\N	\N	1
23678	5	Bloque 1	\N	PREFIX-00006-00002	\N	\N	3	23674	\N	\N	1
23679	5	Pintar camarotes A e B	\N	PREFIX-00006-00006	\N	\N	0	23678	\N	\N	0
23680	5	Pintar sá de máquinas	\N	PREFIX-00006-00007	\N	\N	0	23678	\N	\N	1
23681	5	Pintar cociñas de buque	\N	PREFIX-00006-00008	\N	\N	0	23678	\N	\N	2
23682	5	Bloque 2	\N	PREFIX-00006-00003	\N	\N	3	23674	\N	\N	2
23683	5	Aillar camarote A	\N	PREFIX-00006-00009	\N	\N	0	23682	\N	\N	0
23684	5	Aillar camarote B	\N	PREFIX-00006-00010	\N	\N	0	23682	\N	\N	1
23685	5	Aillar camarote C	\N	PREFIX-00006-00011	\N	\N	0	23682	\N	\N	2
1619	22	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	1618	\N	\N	0
1620	22	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	1619	\N	\N	0
1621	22	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	1619	\N	\N	1
1622	22	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	1618	\N	\N	1
1623	22	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	1622	\N	\N	0
1624	22	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	1622	\N	\N	1
1625	22	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	1622	\N	\N	2
1626	22	Bloque 2	\N	PREFIX-00002-00003	\N	\N	0	1618	\N	\N	2
82517	1	subcontratacion 1	\N	PREFIX-00011	2010-03-01 22:40:25.505	2010-05-07 22:40:25.505	4	\N	\N	\N	\N
82518	1	Coordinación	\N	PREFIX-00011-00001	2010-03-01 22:40:25.505	2010-05-07 22:40:25.505	4	82517	\N	PREFIX-00002-00001	0
82519	1	Reunións con cliente	\N	PREFIX-00011-00002	\N	\N	4	82518	\N	PREFIX-00002-00004	0
82520	1	Reunions con traballadores	\N	PREFIX-00011-00003	\N	\N	4	82518	\N	PREFIX-00002-00005	1
1629	22	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	1	1626	\N	\N	2
56966	7	task2	\N	PREFIX-00002-00013	\N	\N	0	1618	\N	\N	3
56967	7	task3	\N	PREFIX-00002-00014	\N	\N	0	1618	\N	\N	4
56968	7	tsak4	\N	PREFIX-00002-00015	\N	\N	0	1618	\N	\N	5
56970	7	task6	\N	PREFIX-00002-00017	\N	\N	0	1618	\N	\N	6
56965	7	task1	\N	PREFIX-00002-00012	\N	\N	0	74538	\N	\N	0
56971	7	task7 (copy)	\N	PREFIX-00002-00018	\N	\N	0	74538	\N	\N	1
56969	7	task5	\N	PREFIX-00002-00016	\N	\N	0	74538	\N	\N	2
56972	7	task8	\N	PREFIX-00002-00019	\N	\N	0	1618	\N	\N	8
56973	7	task9	\N	PREFIX-00002-00020	\N	\N	0	1618	\N	\N	9
56974	7	task10	\N	PREFIX-00002-00021	\N	\N	0	1618	\N	\N	10
56975	7	task11	\N	PREFIX-00002-00022	\N	\N	0	1618	\N	\N	11
58300	2	Template grupo 1	Pedido de proba	PREFIX-00009	2010-04-13 14:05:22.622	2011-03-15 00:00:00	3	\N	\N	\N	\N
58301	2	Coordinación	\N	PREFIX-00009-00001	\N	\N	0	58300	57842	\N	0
58302	2	Reunións con cliente	\N	PREFIX-00009-00015	\N	\N	1	58301	57843	\N	0
58303	2	Reunions con traballadores	\N	PREFIX-00009-00016	\N	\N	1	58301	57844	\N	1
58304	2	Bloque 1	\N	PREFIX-00009-00002	\N	\N	3	58300	57845	\N	1
58305	2	Soldar unions do teito	\N	PREFIX-00009-00017	\N	\N	0	58304	57846	\N	0
58306	2	Soldar unions do chan	\N	PREFIX-00009-00018	\N	\N	0	58304	57847	\N	1
58307	2	Repasar soldadura ocos	\N	PREFIX-00009-00019	\N	\N	0	58304	57848	\N	2
58308	2	Bloque 2	\N	PREFIX-00009-00003	\N	\N	0	58300	57849	\N	2
58309	2	Teito madeira camarote A	\N	PREFIX-00009-00020	\N	\N	1	58308	57850	\N	0
58310	2	Cama e mesilla camarote A	\N	PREFIX-00009-00021	\N	\N	1	58308	57851	\N	1
58311	2	Escotillas camarote	\N	PREFIX-00009-00022	\N	\N	1	58308	57852	\N	2
58312	2	task1	\N	PREFIX-00009-00004	\N	\N	0	58300	57853	\N	3
58313	2	task2	\N	PREFIX-00009-00005	\N	\N	0	58300	57854	\N	4
58314	2	task3	\N	PREFIX-00009-00006	\N	\N	0	58300	57855	\N	5
58315	2	tsak4	\N	PREFIX-00009-00007	\N	\N	0	58300	57856	\N	6
58316	2	task5	\N	PREFIX-00009-00008	\N	\N	0	58300	57857	\N	7
58317	2	task6	\N	PREFIX-00009-00009	\N	\N	0	58300	57858	\N	8
58318	2	task7	\N	PREFIX-00009-00010	\N	\N	0	58300	57859	\N	9
58319	2	task8	\N	PREFIX-00009-00011	\N	\N	0	58300	57860	\N	10
58320	2	task9	\N	PREFIX-00009-00012	\N	\N	0	58300	57861	\N	11
58321	2	task10	\N	PREFIX-00009-00013	\N	\N	0	58300	57862	\N	12
58322	2	task11	\N	PREFIX-00009-00014	\N	\N	0	58300	57863	\N	13
1627	22	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	1	1626	\N	\N	0
1628	22	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	1	1626	\N	\N	1
74538	5	task7	\N	PREFIX-00002-00023	2010-04-19 00:00:00	\N	3	1618	\N	\N	7
67571	3	Jamon serrano	\N	PREFIX-00010-00001	\N	\N	0	67570	\N	\N	0
67572	3	Chorizo	\N	PREFIX-00010-00002	\N	\N	0	67570	\N	\N	1
67570	4	pedido 6	referencia 22	PREFIX-00010	2010-04-16 13:39:05.961	\N	3	\N	\N	\N	\N
102720	3	elem1	\N	PREFIX-00013-00001	\N	\N	0	102719	\N	\N	0
102721	3	elem2	\N	PREFIX-00013-00002	\N	\N	0	102719	\N	\N	1
102719	4	pedido proba	\N	PREFIX-00013	2010-04-29 23:04:42.356	\N	3	\N	\N	\N	\N
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
57841	1	Template grupo 1	Pedido de proba	PREFIX-00002	0	336	3	\N	\N
57842	1	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	57841	0
57845	1	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	57841	1
57849	1	Bloque 2	\N	PREFIX-00002-00003	\N	\N	0	57841	2
57853	1	task1	\N	PREFIX-00002-00012	\N	\N	0	57841	3
57854	1	task2	\N	PREFIX-00002-00013	\N	\N	0	57841	4
57855	1	task3	\N	PREFIX-00002-00014	\N	\N	0	57841	5
57856	1	tsak4	\N	PREFIX-00002-00015	\N	\N	0	57841	6
57857	1	task5	\N	PREFIX-00002-00016	\N	\N	0	57841	7
57858	1	task6	\N	PREFIX-00002-00017	\N	\N	0	57841	8
57859	1	task7	\N	PREFIX-00002-00018	\N	\N	0	57841	9
57860	1	task8	\N	PREFIX-00002-00019	\N	\N	0	57841	10
57861	1	task9	\N	PREFIX-00002-00020	\N	\N	0	57841	11
57862	1	task10	\N	PREFIX-00002-00021	\N	\N	0	57841	12
57863	1	task11	\N	PREFIX-00002-00022	\N	\N	0	57841	13
57843	1	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	57842	0
57844	1	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	57842	1
57846	1	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	57845	0
57847	1	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	57845	1
57848	1	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	57845	2
57850	1	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	1	57849	0
57851	1	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	1	57849	1
57852	1	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	1	57849	2
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
23650	1
23651	1
23653	1
23654	1
23655	1
23657	1
23658	1
23659	1
23637	1
23638	1
23640	1
23641	1
23642	1
23644	1
23645	1
23646	1
23663	1
23664	1
23666	1
23667	1
23668	1
23670	1
23671	1
23672	1
23676	1
23677	1
23679	1
23680	1
23681	1
23683	1
23684	1
23685	1
82519	1
82520	1
58302	1
58303	1
58305	1
58306	1
58307	1
58309	1
58310	1
58311	1
58312	1
58313	1
58314	1
58315	1
58316	1
58317	1
58318	1
58319	1
58320	1
58321	1
58322	1
1620	1
1621	1
1623	1
1624	1
1625	1
1627	1
1628	1
1629	1
56966	1
56967	1
56968	1
56970	1
56965	1
56971	1
67571	1
67572	1
56969	1
56972	1
56973	1
56974	1
56975	1
102720	1
102721	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1618
1619
1622
1626
23635
23636
23639
23643
23648
23649
23652
23656
23661
23662
23665
23669
23674
23675
23678
23682
58300
58301
58304
58308
67570
74538
82517
82518
102719
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
57841
57842
57845
57849
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
57843	0
57844	0
57846	0
57847	0
57848	0
57850	0
57851	0
57852	0
57853	0
57854	0
57855	0
57856	0
57857	0
57858	0
57859	0
57860	0
57861	0
57862	0
57863	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	28	PREFIX	13	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
57841	2
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

COPY resource (id, version, code, base_calendar_id, limited_resource, generatecode) FROM stdin;
1326	7	957da07c-acbb-46fd-8c3e-b5ac5cea484c	28	\N	f
1322	8	b7e4edea-e931-4102-88d3-962be706b466	25	\N	f
1314	7	56f6adc6-0bd2-43f6-916f-c31b6b1e9b3a	21	\N	f
19496	3	fa2bfc09-457e-45c4-ba94-ef0b6fb01ad6	19595	\N	f
19498	3	711a6f7d-dff3-4ed0-83ed-5f39f16b78eb	19596	\N	f
1316	8	39971158-b905-4ab6-80f1-ce7ef1c35c2f	22	\N	f
1324	9	ef90a026-8a24-4057-b62f-527c96e31703	26	\N	f
1330	6	f690462b-f214-472d-9e2b-46c1a4331c10	30	\N	f
19500	4	1a33e076-82ba-4111-93bb-227178d352bb	19597	\N	f
2728	4	4514cc7a-2994-4ce1-a030-187bb7428930	2828	f	f
19494	5	be8d0725-0e03-47ef-bfbb-db2f1c112886	19594	f	f
1328	8	d74f0b01-ddd8-4b95-8f95-5dfa03c79546	29	f	f
1318	8	7fd7e451-a5b9-4c92-8e98-8c3d02a1c704	23	f	f
40199	3	72767588-8f72-46dc-b034-9be92f8a8353	40299	t	f
61308	2	3da84978-15c8-4669-8fa2-fa8c5b951492	61408	t	t
85043	1	3b93134e-576b-4316-9d7c-8cb197c7153f	85143	t	t
50401	3	471541db-1426-4c78-ba58-b7b4742e4a75	50500	f	f
1320	11	769eaabf-19fb-49db-a1f3-316b10ce927a	24	f	f
1332	8	405854ff-894b-43a4-9790-d330c25eb2a4	31	f	f
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function, intendedtotalhours, intended_total_hours, originaltotalassignment) FROM stdin;
36161	6	0.63	20048	\N	\N	\N	0
36197	3	1.00	20055	\N	\N	\N	0
36198	3	1.00	20056	\N	\N	\N	0
36199	3	1.00	20057	\N	\N	\N	0
36215	2	0.55	20059	\N	\N	\N	0
36216	2	0.55	20060	\N	\N	\N	0
36219	1	0.50	20061	\N	\N	\N	0
36168	4	0.60	20054	\N	\N	\N	0
36164	5	0.55	20049	\N	\N	\N	0
36167	4	0.50	20050	\N	\N	\N	0
30498	7	1.00	20044	\N	\N	\N	0
30499	7	1.00	20045	\N	\N	\N	0
30500	7	1.00	20046	\N	\N	\N	0
30469	9	4.00	20043	\N	\N	\N	0
68075	4	0.50	67973	\N	\N	\N	0
20247	13	2.00	20008	\N	\N	\N	0
20279	11	0.60	20013	\N	\N	\N	0
20290	10	0.55	20014	\N	\N	\N	0
55957	5	2.00	20015	\N	\N	\N	0
20274	12	1.00	20009	\N	\N	\N	0
20275	12	1.00	20010	\N	\N	\N	0
20276	12	1.00	20011	\N	\N	\N	0
20292	8	0.60	20018	\N	\N	\N	0
30466	6	0.80	20023	\N	\N	\N	0
30467	6	0.55	20024	\N	\N	\N	0
30468	6	1.00	20025	\N	\N	\N	0
30421	7	1.00	20019	\N	\N	\N	0
30422	7	2.00	20020	\N	\N	\N	0
30423	7	2.00	20021	\N	\N	\N	0
92417	7	\N	57370	\N	\N	\N	0
94343	3	\N	57373	\N	\N	\N	0
20210	39	1.00	19999	\N	\N	\N	0
20240	38	1.00	20000	\N	\N	\N	0
20241	38	1.00	20001	\N	\N	\N	0
92415	9	\N	50096	\N	\N	\N	0
92416	8	\N	57369	\N	\N	\N	0
82822	13	1.00	19998	\N	\N	\N	0
97569	2	0.50	58589	\N	\N	\N	0
97571	1	0.50	58588	\N	\N	\N	0
97573	0	0.50	58594	\N	\N	\N	0
97575	0	1.00	103121	\N	\N	\N	0
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
19	1
20	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
27	1
21	1
28	1
25	1
19595	1
19596	1
22	1
26	1
30	1
19597	1
2828	1
19594	1
29	1
23	1
40299	1
61408	1
85143	1
50500	1
24	1
31	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
60095	2	81ae3188-ee7e-4dd7-97b4-47f7bc7d5cab	2010-04-14	\N	59893	50401
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
36168	19500
30469	19498
68075	1326
20247	19494
20292	19496
92415	61308
92416	40199
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
20055	1	0	\N	\N	\N
20056	1	0	\N	\N	\N
20057	1	0	\N	\N	\N
20059	2	0	\N	\N	\N
20060	0	0	\N	\N	\N
20061	1	0	\N	\N	\N
20054	1	0	\N	\N	\N
20008	1	0	\N	\N	\N
20013	2	0	\N	\N	\N
20014	0	0	\N	\N	\N
20015	1	2	2010-10-14 00:00:00	\N	\N
20009	1	0	\N	\N	\N
20010	1	0	\N	\N	\N
20011	1	0	\N	\N	\N
20018	1	0	\N	\N	\N
20023	2	0	\N	\N	\N
20024	0	0	\N	\N	\N
20025	1	0	\N	\N	\N
20019	1	0	\N	\N	\N
20020	1	0	\N	\N	\N
20021	1	0	\N	\N	\N
57375	1	0	\N	\N	\N
57370	1	1	2010-04-02 00:00:00	\N	5
57373	1	1	2011-02-07 02:36:00	\N	5
19999	1	0	\N	\N	\N
20000	1	0	\N	\N	\N
20001	1	0	\N	\N	\N
57371	1	0	\N	\N	\N
50096	1	1	2010-04-27 00:00:00	\N	5
57376	1	0	\N	\N	\N
57378	1	0	\N	\N	\N
57368	1	1	2010-03-22 07:12:00	\N	\N
57374	1	0	\N	\N	\N
57372	1	0	\N	\N	\N
57369	1	1	2011-02-19 06:36:00	\N	5
19998	1	2	2010-03-01 00:00:00	\N	\N
57377	1	0	\N	\N	\N
20048	2	0	\N	\N	\N
20049	0	0	\N	\N	\N
20050	1	0	\N	\N	\N
20044	1	0	\N	\N	\N
20045	1	0	\N	\N	\N
20046	1	0	\N	\N	\N
20043	1	0	\N	\N	\N
67973	1	0	\N	\N	\N
67974	1	0	\N	\N	\N
103122	1	0	\N	\N	\N
103121	1	0	\N	\N	\N
58587	1	0	\N	\N	\N
58591	1	0	\N	\N	\N
58580	1	0	\N	\N	\N
58590	1	0	\N	\N	\N
58593	1	0	\N	\N	\N
58596	1	0	\N	\N	\N
58589	1	0	\N	\N	\N
58588	1	0	\N	\N	\N
58595	1	0	\N	\N	\N
58594	1	0	\N	\N	\N
58586	1	0	\N	\N	\N
58585	1	0	\N	\N	\N
58592	1	0	\N	\N	\N
58581	1	0	\N	\N	\N
58582	1	0	\N	\N	\N
58583	1	0	\N	\N	\N
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
20008	23938
20008	23937
20009	23939
20010	23940
20011	23941
20013	23942
20014	23943
20015	23944
20018	23946
20018	23945
20019	23947
20020	23948
20021	23949
20023	23950
20024	23951
20025	23952
20043	23953
20043	23954
20044	23955
20045	23956
20046	23957
20048	23958
20049	23959
20050	23960
20054	23962
20054	23961
20055	23963
20056	23964
20057	23965
20059	23966
20060	23967
20061	23968
19998	1919
19998	1920
19999	1921
20000	1922
20001	1923
50096	1924
50096	1925
50096	1926
57369	57268
57370	57269
57371	57270
57373	57272
57368	57267
57374	57273
57372	57271
57375	57274
58580	58170
58580	58171
58581	58172
58582	58173
58583	58174
58585	58479
58585	58480
58585	58175
58586	58481
58587	58482
58588	58483
58589	58484
58590	58485
58591	58486
58592	58487
58593	58488
58594	58489
58595	58490
58596	58491
57376	57275
57377	57276
57378	57277
67973	67771
67974	67772
103121	102919
103122	102920
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
20058	12	Bloque 1	\N	2010-03-22 00:00:00	2010-07-16 00:00:00	\N	20063	\N	1
20055	10	Pintar camarotes A e B	\N	2010-03-22 00:00:00	2010-05-25 00:00:00	\N	20058	\N	0
20056	10	Pintar sá de máquinas	\N	2010-05-25 00:00:00	2010-06-29 00:00:00	\N	20058	\N	1
20057	10	Pintar cociñas de buque	\N	2010-06-29 00:00:00	2010-07-16 00:00:00	\N	20058	\N	2
20062	12	Bloque 2	\N	2010-07-16 00:00:00	2010-12-18 00:00:00	\N	20063	\N	2
20059	10	Aillar camarote A	\N	2010-07-16 00:00:00	2010-10-12 00:00:00	\N	20062	\N	0
20060	10	Aillar camarote B	\N	2010-07-16 00:00:00	2010-09-01 00:00:00	\N	20062	\N	1
20061	10	Aillar camarote C	\N	2010-10-15 00:00:00	2010-12-18 00:00:00	\N	20062	\N	2
20054	10	Coordinacion	\N	2010-03-01 00:00:00	2010-05-20 00:00:00	\N	20063	\N	0
20063	12	Pedido Grupo 5	\N	2010-03-01 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N
20064	5	Fito recepcion de materias	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20063	\N	3
20040	35	Fito recepcion de materiais	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20007	\N	3
67973	6	Jamon serrano	\N	2010-04-16 13:39:05.961	2010-06-26 13:39:05.961	\N	67975	\N	0
20026	15	Bloque 2	\N	2010-06-26 00:00:00	2010-12-18 00:00:00	\N	20027	\N	2
67974	6	Chorizo	\N	2010-04-16 13:39:05.961	2010-05-11 13:39:05.961	\N	67975	\N	1
67975	6	pedido 6	\N	2010-04-16 13:39:05.961	2010-06-26 13:39:05.961	\N	\N	\N	\N
50096	34	Bloque 2	\N	2010-04-27 00:00:00	2010-09-14 00:00:00	\N	20007	\N	2
20023	13	Teito de madeira de camarote A	\N	2010-06-26 00:00:00	2010-08-27 00:00:00	\N	20026	\N	0
74740	28	task7	\N	2010-03-01 22:40:25.505	2010-04-03 20:12:00	\N	20007	\N	8
19998	50	Coordinación	\N	2010-03-01 22:40:25.505	2010-04-07 22:40:25.505	\N	20007	\N	0
20007	57	Pedido grupo 1	\N	2010-03-01 22:40:25.505	2011-03-03 18:36:00	2011-02-01	\N	\N	\N
20024	13	Cama e mesillas de camarote A	\N	2010-06-26 00:00:00	2010-07-16 00:00:00	\N	20026	\N	1
20013	17	Aillar camarote A	\N	2010-07-09 00:00:00	2010-10-10 00:00:00	\N	20016	\N	0
20025	13	Poñer escotillas camarote A	\N	2010-11-14 00:00:00	2010-12-18 00:00:00	\N	20026	\N	2
20022	15	Bloque 1	\N	2010-03-08 00:00:00	2010-06-26 00:00:00	\N	20027	\N	1
20002	57	Bloque 1	\N	2010-03-01 22:40:25.505	2010-06-11 22:40:25.505	\N	20007	\N	1
19999	50	Soldar unions do teito	\N	2010-03-01 22:40:25.505	2010-04-17 22:40:25.505	\N	20002	\N	0
20014	17	Aillar camarote B	\N	2010-07-09 00:00:00	2010-08-05 00:00:00	\N	20016	\N	1
20015	17	Aillar camarote C	\N	2010-10-14 00:00:00	2010-11-02 00:00:00	\N	20016	\N	2
20000	50	Soldar unions do chan	\N	2010-04-17 22:40:25.505	2010-05-25 22:40:25.505	\N	20002	\N	1
20019	13	Pintar camarotes A e B	\N	2010-03-08 00:00:00	2010-05-14 00:00:00	\N	20022	\N	0
20020	13	Pintar sá de máquinas	\N	2010-05-14 00:00:00	2010-06-09 00:00:00	\N	20022	\N	1
20021	13	Pintar cociñas de buque	\N	2010-06-09 00:00:00	2010-06-26 00:00:00	\N	20022	\N	2
20012	17	Bloque 1	\N	2010-03-08 00:00:00	2010-07-09 00:00:00	\N	20017	\N	1
20027	15	Pedido Grupo 3	\N	2010-03-08 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N
20009	17	Pintar camarotes A e B	\N	2010-03-08 00:00:00	2010-05-08 00:00:00	\N	20012	\N	0
20010	17	Pintar sá de máquinas	\N	2010-05-08 00:00:00	2010-06-22 00:00:00	\N	20012	\N	1
20001	50	Repasar soldadura ocos	\N	2010-05-25 22:40:25.505	2010-06-11 22:40:25.505	\N	20002	\N	2
20011	17	Pintar cociñas de buque	\N	2010-06-22 00:00:00	2010-07-09 00:00:00	\N	20012	\N	2
20053	10	Fito recepcion de materiais	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	20052	\N	3
20008	17	Coordinacion	\N	2010-03-08 00:00:00	2010-03-25 00:00:00	\N	20017	\N	0
20029	9	Fito recepcion de materiais	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	20017	\N	3
20017	17	Pedido Grupo 2	\N	2010-03-08 00:00:00	2010-11-02 00:00:00	2011-06-01	\N	\N	\N
20018	13	Coordinacion	\N	2010-03-08 00:00:00	2010-05-11 00:00:00	\N	20027	\N	0
20016	17	Bloque 2	\N	2010-07-09 00:00:00	2010-11-02 00:00:00	\N	20017	\N	2
20051	16	Bloque 2	\N	2010-07-22 00:00:00	2010-12-17 00:00:00	\N	20052	\N	2
20048	14	Teito de madeira camarote A	\N	2010-07-22 00:00:00	2010-10-14 00:00:00	\N	20051	\N	0
20049	14	Cama e mesilla camarote A	\N	2010-07-22 00:00:00	2010-08-31 00:00:00	\N	20051	\N	1
20050	14	Poñer escotillas camarote A	\N	2010-10-14 00:00:00	2010-12-17 00:00:00	\N	20051	\N	2
20047	16	Bloque 1	\N	2010-03-08 00:00:00	2010-07-22 00:00:00	\N	20052	\N	1
20044	14	Soldar cuberta A	\N	2010-03-08 00:00:00	2010-05-22 00:00:00	\N	20047	\N	0
20045	14	Soldar cuberta B	\N	2010-05-22 00:00:00	2010-06-26 00:00:00	\N	20047	\N	1
20046	14	Soldar cuberta C	\N	2010-06-26 00:00:00	2010-07-22 00:00:00	\N	20047	\N	2
20043	14	Coordinacion	\N	2010-03-08 00:00:00	2010-03-25 00:00:00	\N	20052	\N	0
20052	16	Pedido Grupo 4	\N	2010-03-08 00:00:00	2010-12-17 00:00:00	2011-06-01	\N	\N	\N
20042	4	Fito recepcion de materiais	\N	2010-11-14 00:00:00	2010-11-14 00:00:00	\N	20027	\N	3
57375	32	task8	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	9
57370	32	task3	\N	2010-04-02 00:00:00	2010-04-14 12:00:00	\N	20007	\N	5
57373	32	task6	\N	2011-02-07 02:36:00	2011-02-19 14:36:00	\N	20007	\N	7
57371	32	tsak4	\N	2010-04-02 00:00:00	2010-04-14 12:00:00	\N	20007	\N	6
57376	32	task9	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	10
57378	32	task11	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	12
57368	33	task1	\N	2010-03-22 07:12:00	2010-04-03 20:12:00	\N	74740	\N	0
57374	33	task7 (copy)	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	74740	\N	1
57372	33	task5	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	74740	\N	2
57369	32	task2	\N	2011-02-19 06:36:00	2011-03-03 18:36:00	\N	20007	\N	4
57377	32	task10	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	11
58597	5	Template grupo 1	\N	2010-04-13 14:05:22.622	2010-07-16 08:05:22.622	2011-03-15	\N	\N	\N
103122	2	elem2	\N	2010-04-29 23:04:42.356	2010-09-01 23:04:42.356	\N	103123	\N	1
103121	2	elem1	\N	2010-04-29 23:04:42.356	2010-10-21 23:04:42.356	\N	103123	\N	0
103123	2	pedido proba	\N	2010-04-29 23:04:42.356	2010-10-21 23:04:42.356	\N	\N	\N	\N
58587	5	task2	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	4
58591	5	task6	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	8
58580	5	Coordinación	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58597	\N	0
58590	5	task5	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	7
58593	5	task8	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	10
58596	5	task11	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	13
58589	5	tsak4	\N	2010-04-13 14:05:22.622	2010-05-18 14:05:22.622	\N	58597	\N	6
58588	5	task3	\N	2010-04-13 14:05:22.622	2010-05-18 14:05:22.622	\N	58597	\N	5
58595	5	task10	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	12
58594	5	task9	\N	2010-04-13 14:05:22.622	2010-05-18 14:05:22.622	\N	58597	\N	11
58586	5	task1	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	3
58585	5	Bloque 2	\N	2010-04-13 14:05:22.622	2010-07-16 08:05:22.622	\N	58597	\N	2
58592	5	task7	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	9
58584	5	Bloque 1	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58597	\N	1
58581	5	Soldar unions do teito	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58584	\N	0
58582	5	Soldar unions do chan	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58584	\N	1
58583	5	Repasar soldadura ocos	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58584	\N	2
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
20002
20007
20012
20016
20017
20022
20026
20027
20047
20051
20052
20058
20062
20063
58584
58597
67975
74740
103123
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
20029
20040
20042
20053
20064
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
20022	3	23652
20026	3	23656
20027	3	23648
20018	5	23649
20019	5	23653
20020	5	23654
20021	5	23655
20023	5	23657
20024	5	23658
20025	5	23659
20008	1	23636
20009	1	23640
20010	1	23641
20011	1	23642
20012	1	23639
20013	1	23644
20014	1	23645
20015	1	23646
20016	1	23643
20017	1	23635
20058	3	23678
20062	3	23682
20063	3	23674
20054	5	23675
20047	3	23665
20055	5	23679
20056	5	23680
20057	5	23681
20051	3	23669
20052	3	23661
20043	5	23662
20044	5	23666
20045	5	23667
20046	5	23668
20048	5	23670
20049	5	23671
20050	5	23672
20059	5	23683
20060	5	23684
20061	5	23685
57369	11	56966
20002	8	1622
57370	11	56967
57371	11	56968
57373	11	56970
57368	11	56965
57374	11	56971
57372	11	56969
57375	11	56972
57376	11	56973
74740	4	74538
57377	11	56974
57378	11	56975
58580	1	58301
58581	1	58305
58582	1	58306
58583	1	58307
58584	1	58304
58585	1	58308
58586	1	58312
58587	1	58313
58588	1	58314
58589	1	58315
58590	1	58316
58591	1	58317
58592	1	58318
58593	1	58319
58594	1	58320
58595	1	58321
58596	1	58322
58597	1	58300
67973	1	67571
67974	1	67572
67975	1	67570
20007	8	1618
19998	15	1619
19999	15	1623
20000	15	1624
20001	15	1625
50096	13	1626
103121	1	102720
103122	1	102721
103123	1	102719
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
56762	1	jai	a	10.00	t	\N
72215	1	categoria 1	e0b46b07-a797-4b38-8410-da2d4d806d2b	\N	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
40097	1	26fea83a-f705-45b8-874b-db90477a645c	units	\N
40098	1	3f4947e9-8fc9-46b0-9fbf-7b043466f10d	kg	\N
40099	1	51df0d54-0853-43f1-a0b1-2450dd21461a	km	\N
40101	1	e60e972f-5ac5-4cab-9540-edcaac3cf636	m	\N
40103	1	bd88aba0-64ac-4a34-9273-e5fffe5ae809	m3	\N
40104	2	28964100-c982-4122-9da1-d57315c4c65c	tn	\N
63024	1	096cb48f-1b61-4a72-b7f9-8e8fa98c511a	toneladas	\N
40100	2	5445ee82-5e94-47e4-8a7f-9432834ad646	l	t
40102	5	d3caaa86-9843-439a-af4e-c6743ebd1f26	m2	t
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
910	ROLE_EDIT_ALL_ORDERS
910	ROLE_READ_ALL_ORDERS
910	ROLE_ADMINISTRATION
910	ROLE_CREATE_ORDER
911	ROLE_WS_READER
912	ROLE_WS_READER
912	ROLE_WS_WRITER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id, generatecode) FROM stdin;
90496	1	88393b63-835e-42c2-aca8-f5e6880b9917	\N	51510	\N	\N	t
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
51611	1	f	0	1114	1226	51510
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
90597	1	e00ed9ba-d2f1-42bf-8f35-3e97254b2fe6	10	2010-04-21 00:00:00	\N	\N	90496	1314	23652	72215
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
51510	1	Tipo 1	c1	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1322	Alfonso 	Domínguez Baúl	55555555E
1314	Javier	Martinez Alvarez	11111111F
1326	Félix	González López	77777777G
19496	Elias	Baeza Robles	11234567L
19498	Elena	Boluda Ferrer	99999999B
1316	María	Pérez Mariño	22222222D
1324	Alicia	Muñoz Lages	66666666D
1330	Manuel	Rodríguez Fernández	99999999F
19500	Damian	Pintos Abogado	23232323B
2728	Javier	Perez Campos	32323232L
19494	Laura	Menendez Gomez	89876562L
1328	Oscar	Iraola Sáez	88888888B
1318	Luis	Amado  Montes	33333333A
40199	Javier	Montes	78736622D
61308	Laura	Ponce	123456X
85043	Ramon 	Dominguez	78722312
50401	javie	moran	8989234
1320	Raúl 	Cisneros Díaz	44444444H
1332	Raquel	Tilve Moreno	12121212B
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
90597	1226
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
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


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
-- Name: tasksource_orderelement_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_orderelement_key UNIQUE (orderelement);


--
-- Name: tasksource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_pkey PRIMARY KEY (id);


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
-- Name: fkb05e6e2067faf86e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e2067faf86e FOREIGN KEY (orderelement) REFERENCES orderelement(id);


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
-- Name: fkbb493f501b8e7cf2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f501b8e7cf2 FOREIGN KEY (derived_allocation_id) REFERENCES derivedallocation(id);


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
-- Name: fkd3056ef7ddc82952; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT fkd3056ef7ddc82952 FOREIGN KEY (group_template_id) REFERENCES orderelementtemplate(id);


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
-- Name: fkf8df3e0c17619639; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0c17619639 FOREIGN KEY (inadvance_assignment_id) REFERENCES indirectadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0ca9e53843; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0ca9e53843 FOREIGN KEY (advance_assignment_id) REFERENCES directadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0cdb938a3e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0cdb938a3e FOREIGN KEY (advance_assignment_id) REFERENCES indirectadvanceassignment(advance_assignment_id);


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


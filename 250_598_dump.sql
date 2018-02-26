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
    position_in_calendar integer
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
    base_calendar_id bigint
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
    companycode character varying(255)
);


ALTER TABLE public.configuration OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
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
    generic_resource_allocation_id bigint,
    derived_allocation_id bigint
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
    resourcetype bytea,
    workinghours integer NOT NULL,
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
    customer character varying(255),
    dependenciesconstraintshavepriority boolean,
    codeautogenerated boolean,
    lastorderelementsequencecode integer,
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
    mandatoryinit boolean,
    mandatoryend boolean,
    schedulingstatetype integer,
    parent bigint,
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
    order_line_template_id bigint NOT NULL
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
    qualityformtype integer
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
    assignment_function_id bigint NOT NULL
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
    criterionrequirementsexported boolean
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
    subcontrated_task_data_id bigint
);


ALTER TABLE public.task OWNER TO naval;

--
-- Name: task_quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    quality_form_id bigint,
    order_element_id bigint
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
    startdate timestamp without time zone,
    enddate timestamp without time zone,
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
    enabled boolean
);


ALTER TABLE public.type_of_work_hours OWNER TO naval;

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
    date timestamp without time zone,
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
    numhours integer,
    date timestamp without time zone,
    clockstart timestamp without time zone,
    clockfinish timestamp without time zone,
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
40724	6	t	808
17523	7	t	809
17524	7	t	809
17525	7	t	809
17526	7	t	809
17527	7	t	809
2356	23	f	808
17738	6	t	809
17739	6	t	809
17740	6	t	809
17741	6	t	809
2357	23	f	808
17742	6	t	809
17743	6	t	809
17744	6	t	809
2358	23	f	808
24655	5	t	809
24656	5	f	809
2379	22	t	808
24657	5	t	809
24658	5	f	809
2380	22	t	808
24659	5	t	809
2381	22	f	808
24660	5	t	809
24661	5	t	809
24662	5	t	809
24663	5	t	809
2382	22	f	808
24664	5	t	809
24665	5	t	809
24666	5	t	809
24667	5	t	809
2383	22	f	808
24668	5	t	809
24669	5	t	809
24670	5	t	809
2384	22	f	808
24671	5	t	809
24672	5	t	809
24673	5	t	809
2385	22	f	808
2386	22	t	808
2387	22	t	808
24674	5	t	809
24675	5	t	809
24676	5	t	809
24677	5	t	809
24678	5	t	809
24679	5	t	809
2388	22	f	808
24680	5	t	809
24681	5	t	809
24682	5	t	809
24683	5	t	809
24684	5	t	809
2391	17	f	808
24685	5	t	809
24729	14	t	808
24730	14	t	808
24731	14	t	808
26167	13	t	808
26168	13	t	808
26169	13	t	808
26170	13	t	808
26171	13	t	808
26172	13	t	808
26173	13	t	808
42830	3	t	809
42831	3	t	809
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id) FROM stdin;
17581	7	2010-01-15	100.00	17523
17582	7	2010-01-15	100.00	17524
17583	7	2010-01-15	100.00	17525
17584	7	2010-01-15	100.00	17526
17645	6	2010-01-15	100.00	17738
17646	6	2010-01-15	100.00	17740
17647	6	2010-01-15	100.00	17741
17648	6	2010-01-15	100.00	17743
24748	5	2010-01-15	100.00	24655
24749	5	2010-01-15	100.00	24657
24750	5	2010-01-15	100.00	24659
24751	5	2010-01-15	100.00	24661
24752	5	2010-01-15	100.00	24662
24753	5	2010-01-15	50.00	24664
24754	5	2010-01-15	100.00	24665
24755	5	2010-01-15	100.00	24666
24756	5	2010-01-15	100.00	24667
24757	5	2010-01-15	25.00	24669
24758	5	2010-01-15	100.00	24671
24759	5	2010-01-15	50.00	24672
24760	5	2010-01-15	100.00	24674
24761	5	2010-01-15	100.00	24675
24762	5	2010-01-15	100.00	24676
24763	5	2010-01-15	100.00	24677
24764	5	2010-01-15	100.00	24678
24765	5	2010-01-15	100.00	24679
24766	5	2010-01-15	75.00	24681
24767	5	2010-01-15	75.00	24682
24768	5	2010-01-15	100.00	24683
24769	5	2010-01-15	50.00	24684
42928	3	2010-01-19	20.00	42830
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage) FROM stdin;
808	4	children	100.0000	f	0.0100	t	t
809	3	percentage	100.0000	f	0.0100	t	t
810	2	units	2147483647.0000	f	1.0000	t	f
811	1	subcontractor	100.0000	f	0.0100	t	t
1920	1	Toneladas	100000.0000	t	1.0000	t	f
1919	2	Porcentaje pactado	100.0000	t	0.0000	t	t
1921	1	Importe facturado	5000000.0000	t	100.0000	t	f
1922	1	Importe facturado (pactado)	5000000.0000	t	100.0000	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
29550	1278
29550	1281
29551	1279
29551	1278
29552	1278
29552	1279
29553	1279
29553	1278
29554	1279
29554	1278
29555	1278
29555	1279
29556	1278
29556	1279
29557	1279
29557	1278
29558	1279
29558	1278
29559	1278
29559	1280
29560	1279
29560	1278
29561	1279
29561	1278
29562	1279
29562	1278
29563	1278
29563	1279
29564	1279
29564	1278
29565	1279
29565	1278
29566	1279
29566	1278
29567	1279
29567	1278
29568	1279
29568	1278
29569	1278
29569	1279
29570	1278
29570	1279
29571	1278
29571	1279
29573	1279
29573	1278
41107	1235
41108	1280
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
303	3	España (por defecto)
1417	1	Galicia
1418	1	Pontevedra
1419	1	Vigo
1423	3	\N
1426	3	\N
1424	4	\N
1414	5	\N
1427	3	\N
1420	4	\N
1425	3	\N
1428	2	\N
1429	2	\N
1430	2	\N
1431	1	\N
1432	1	Máquinas
1433	2	\N
1434	1	\N
1435	2	\N
1436	2	\N
1437	2	\N
1422	2	Ferrol
40198	2	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1631	2	2009-01-01	\N	1436	0
1632	2	2009-01-01	\N	1437	0
1618	3	2009-01-01	\N	1423	0
1621	3	2009-01-01	\N	1426	0
1619	4	2009-01-01	\N	1424	0
1616	5	2009-01-01	\N	1414	0
1622	3	2009-01-01	\N	1427	0
1617	4	2010-01-15	\N	1420	0
1620	3	2009-01-01	\N	1425	0
1623	2	2009-01-15	\N	1428	0
1624	2	2009-01-15	\N	1429	0
1625	2	2009-01-15	\N	1430	0
1626	1	2010-01-15	\N	1431	0
1627	2	2010-01-15	\N	1433	0
1628	1	2010-01-15	\N	1434	0
1629	2	2009-01-01	2009-01-01	1435	0
1630	1	2009-01-02	\N	1435	1
40400	2	2010-01-18	\N	40198	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
1531	2	303	\N	1430	0
1532	1	1422	\N	1431	0
1533	1	\N	\N	1432	0
404	3	\N	\N	303	0
1534	2	1432	\N	1433	0
1518	1	303	\N	1417	0
1519	1	1417	\N	1418	0
1520	1	1417	\N	1419	0
1535	1	1432	\N	1434	0
1536	2	303	\N	1435	0
1537	2	303	\N	1436	0
1538	2	303	\N	1437	0
1524	3	1418	\N	1423	0
1527	3	303	\N	1426	0
1525	4	303	\N	1424	0
1515	5	303	\N	1414	0
1528	3	303	\N	1427	0
1521	4	1418	\N	1420	0
1526	3	303	\N	1425	0
1529	2	1422	\N	1428	0
1530	2	303	\N	1429	0
1523	2	1417	\N	1422	0
40299	2	303	\N	40198	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1826	1	2010-12-08	0	711	303
1827	1	2010-12-06	0	711	303
1828	1	2010-04-01	0	711	303
1829	1	2010-11-01	0	711	303
1830	1	2010-05-17	0	711	1417
1831	1	2010-10-07	0	711	1417
1832	1	2010-04-02	0	711	1417
1833	1	2010-03-19	0	711	1417
1834	1	2010-04-05	0	711	1418
1835	1	2010-02-17	0	711	1418
1836	1	2010-03-29	0	711	1419
1837	1	2010-08-16	0	711	1419
39895	1	2010-04-12	0	711	1422
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable) FROM stdin;
707	6	HOLIDAY	red	t
708	5	SICK_LEAVE	red	t
709	4	LEAVE	red	t
710	3	STRIKE	red	t
711	2	BANK_HOLIDAY	red	t
712	1	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode) FROM stdin;
505	1	303	COMPANY_CODE
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled) FROM stdin;
2727	2	Oficial 1º	t
2728	1	Peon	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, name, active, id_criterion_type, parent) FROM stdin;
1257	1	Xefe de Área ou Servizo	t	327681	\N
1259	1	Delineante proxectista	t	327681	\N
1260	1	Aprendiz maior de 18 anos	t	327681	\N
1261	1	Xefe de Taller	t	327681	\N
1262	1	Persoal de Buques	t	327681	\N
1263	1	Chofer de turismo	t	327681	\N
1264	1	Licenciado	t	327681	\N
1265	1	Profesional de siderúrxico de 2ª	t	327681	\N
1266	1	Viaxante	t	327681	\N
1267	1	Técnico de laboratorio	t	327681	\N
1268	1	Auxiliar	t	327681	\N
1269	1	Camareiro	t	327681	\N
1270	1	Técnico de organización	t	327681	\N
1271	1	Listeiro	t	327681	\N
1272	1	Debuxante proxectista	t	327681	\N
1273	1	Mestre Industrial	t	327681	\N
1274	1	Enxeñeiro	t	327681	\N
1275	1	Profesional de oficio de 3ª	t	327681	\N
1276	1	Dependente	t	327681	\N
1277	1	Telefonista	t	327681	\N
1130	3	Enxeñeiro electrónico	t	327680	\N
1118	3	Matemático	t	327680	\N
1122	3	Mecánico de instrumentos de precisión	t	327680	\N
1129	3	Desenvolvedor web e multimedia	t	327680	\N
1278	1	Enxeñeiro en informática	t	327680	\N
1125	3	Operador de máquinas pulidoras, galvanizadoras e recubridoras de metais	t	327680	\N
1154	3	Laminador	t	327680	\N
1134	3	Técnico en control de procesos	t	327680	\N
1145	3	Cortador	t	327680	\N
101	14	medicalLeave	t	1	\N
102	13	paternityLeave	t	1	\N
103	4	hiredResourceWorkingRelationship	t	5	\N
104	3	firedResourceWorkingRelationship	t	5	\N
1141	3	Enxeñeiro medioambiental	t	327680	\N
1119	3	Cristaleiro	t	327680	\N
1246	1	Especialista	t	327681	\N
1247	1	Ordenanza	t	327681	\N
1248	1	Arquitecto	t	327681	\N
1249	1	Pesador	t	327681	\N
1250	1	Titulado superior de entrada	t	327681	\N
1251	1	Profesional de siderúrxico de 3ª	t	327681	\N
1252	1	Delineante de 1ª	t	327681	\N
1253	1	Delineante de 2ª	t	327681	\N
1254	1	Director de Área o Servizo	t	327681	\N
1255	1	Condutor de máquina	t	327681	\N
1256	1	Aprendiz de 17 anos	t	327681	\N
1160	3	Técnico da Web	t	327680	\N
1124	3	Moldeador	t	327680	\N
1163	3	Técnico en electrónica e telecomunicacións	t	327680	\N
1128	3	Carpinteiro	t	327680	\N
1132	3	Enxeñeiro técnico medioambiental	t	327680	\N
1111	3	Técnico en ciencias físicas e químicas	t	327680	\N
1126	3	Soldador	t	327680	\N
1113	3	Sondista	t	327680	\N
1114	3	Técnico en electromedicina	t	327680	\N
1123	3	Montador de cubertas	t	327680	\N
1133	3	Xerente	t	327680	\N
1183	3	Técnico en mecánica	t	327680	\N
1282	1	Torno	t	327683	\N
1283	1	Pulidora	t	327683	\N
1284	1	Galvanizadora	t	327683	\N
1170	3	Enxeñeiro en telecomunicacións	t	327680	\N
1190	3	Electricista	t	327680	\N
1142	3	Enxeñeiro de caminos, canles e portos	t	327680	\N
1153	3	Enxeñeiro técnico non clasificado	t	327680	\N
1158	3	Operador de fornos	t	327680	\N
1189	3	Administradores de sistemas	t	327680	\N
1193	3	Chapista	t	327680	\N
1149	3	Reparador	t	327680	\N
1150	3	Parqueteiro	t	327680	\N
1146	3	Axustador	t	327680	\N
1187	3	Xefe de almacén	t	327680	\N
1143	3	Enxeñeiro técnico en electricidade	t	327680	\N
1192	3	Enxeñeiro agrónomo, técnico agrícolas e afíns	t	327680	\N
1151	3	Xefe de taller	t	327680	\N
1162	3	Montador estrutura metálica	t	327680	\N
1155	3	Operador de máquinas de embalaxe, embotellamento e etiquetado	t	327680	\N
1144	3	Enxeñeiro técnico de obras públicas	t	327680	\N
1157	3	Enxeñeiro electricista	t	327680	\N
1182	3	Técnico en metalurxia e minas	t	327680	\N
1166	3	Escaiolista	t	327680	\N
1194	3	Operador en instalacións para a obtención e transformación de metais	t	327680	\N
1164	3	Supervisor	t	327680	\N
1191	3	Operador de grúas, camións montacargas e outros	t	327680	\N
1174	3	Fontaneiros	t	327680	\N
1148	3	Operador de caldeira	t	327680	\N
1161	3	Enxeñeiro técnico mecánico	t	327680	\N
1177	3	Analista de sistemas	t	327680	\N
1188	3	Enxeñeiro químico	t	327680	\N
1152	3	Operador de carretiñas elevadoras	t	327680	\N
1179	3	Pegador	t	327680	\N
1147	3	Químico	t	327680	\N
1167	3	Modelador	t	327680	\N
1195	3	Aplicador de revestimentos	t	327680	\N
1176	3	Delineante e deseñador técnico	t	327680	\N
1181	3	Técnico en electricidade	t	327680	\N
1196	3	Enxeñeiros geógrafos	t	327680	\N
1173	3	Enxeñeiro de produción	t	327680	\N
1168	3	Montadores-instaladores de placas de enerxía solar	t	327680	\N
1180	3	Desenvolvedor de software	t	327680	\N
1169	3	Modelista	t	327680	\N
1156	3	Diseñador de produtos	t	327680	\N
1159	3	Oxicortador	t	327680	\N
1175	3	Empregado de loxística e transportes	t	327680	\N
1165	3	Arquitecto	t	327680	\N
1221	1	Profesional de oficio especial	t	327681	\N
1222	1	Graduado social	t	327681	\N
1223	1	Chofer de camión	t	327681	\N
1224	1	Profesional de siderúrxico de 1ª	t	327681	\N
1225	1	Encargado	t	327681	\N
1226	1	Encargado de pequeno taller	t	327681	\N
1227	1	Profesional de oficio de 1ª	t	327681	\N
1228	1	Cociñeiro	t	327681	\N
1229	1	Arquitecto técnico	t	327681	\N
1230	1	Xefe de Grupo ou Capataces	t	327681	\N
1231	1	Aprendiz de 16 anos	t	327681	\N
1232	1	Enxeñeiro técnico	t	327681	\N
1233	1	ATS	t	327681	\N
1234	1	Profesional de oficio de 2ª	t	327681	\N
1235	1	Titulado de Grao Medio	t	327681	\N
1236	1	Analista programador	t	327681	\N
1237	1	Almaceneiro	t	327681	\N
1238	1	Conserxe	t	327681	\N
1239	1	Persoal de Diques	t	327681	\N
1240	1	Analista de sistemas	t	327681	\N
1241	1	Porteiro	t	327681	\N
1242	1	Caixeiro	t	327681	\N
1243	1	Contramestre	t	327681	\N
1244	1	Operador de ordenador	t	327681	\N
1245	1	Técnico administrativo	t	327681	\N
1258	1	Peón	t	327681	\N
1211	3	Físico	t	327680	\N
1212	3	Empregado de control de abastecemento e inventario	t	327680	\N
1202	3	Técnico de montaxe de instalacións	t	327680	\N
1210	3	Montador	t	327680	\N
1218	3	Ferreiro	t	327680	\N
1220	3	Instaladores de cerramentos metálicos	t	327680	\N
1203	3	Técnico en construción	t	327680	\N
1208	3	Montador-instalador de gas	t	327680	\N
1204	3	Ordeanza	t	327680	\N
1213	3	Enxeñeiro técnico en electrónica	t	327680	\N
1200	3	Pintor	t	327680	\N
1209	3	Enxeñeiro técnico químico	t	327680	\N
1197	3	Enxeñeiro técnico de minas, metalúrxicos e afíns	t	327680	\N
1215	3	Biólogo	t	327680	\N
1201	3	Enxeñeiro técnico en telecomunicacións	t	327680	\N
1214	3	Enxeñeiro superior non clasificado	t	327680	\N
1217	3	Mecánico	t	327680	\N
1219	3	Técnico e analista de laboratorio en química industrial	t	327680	\N
1199	3	Ebanista	t	327680	\N
1207	3	Caldereiro	t	327680	\N
1198	3	Director	t	327680	\N
1205	3	Empregado de oficina de servizos de produción	t	327680	\N
1216	3	Técnico en operacións de TIC e as comunicaciones	t	327680	\N
1206	3	Operador de serrerías, máquinas de contrachapado e outras	t	327680	\N
1172	3	Ensamblador	t	327680	\N
1171	3	Enxeñeiro mecánico	t	327680	\N
1135	3	Xeofísico	t	327680	\N
1116	3	Macheiro	t	327680	\N
1112	3	Meteorólogo	t	327680	\N
1186	3	Enxeñeiro técnico industrial e de produción	t	327680	\N
1137	3	Artesán	t	327680	\N
1184	3	Enxeñeiro técnico en topografía	t	327680	\N
1117	3	Xeólogo	t	327680	\N
1185	3	Matriceiro	t	327680	\N
1115	3	Arquitecto técnico	t	327680	\N
1131	3	Buceador	t	327680	\N
1178	3	Técnico en redes e sistemas informáticos	t	327680	\N
1138	3	Diseñador gráfico e multimedia	t	327680	\N
1139	3	Forxador	t	327680	\N
1140	3	Enxeñeiro industrial	t	327680	\N
1136	3	Instalador	t	327680	\N
1127	3	Enxeñeiros de minas, metalúrgicos e afíns	t	327680	\N
1121	3	Operador de máquina	t	327680	\N
1120	3	Pulidor	t	327680	\N
1279	1	Desarrollador	t	327682	\N
1280	1	Analista	t	327682	\N
1281	1	Coordinador	t	327682	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid) FROM stdin;
27690	INDIRECT	9	\N	25934	1278	27679	t
27691	INDIRECT	9	25990	\N	1278	27679	t
27699	INDIRECT	9	26045	\N	1279	27680	t
27702	INDIRECT	9	\N	26120	1279	27680	t
27701	INDIRECT	9	\N	26120	1278	27679	t
27704	INDIRECT	9	26046	\N	1279	27680	t
27703	INDIRECT	9	26046	\N	1278	27679	t
27705	DIRECT	9	\N	25936	1278	\N	\N
27708	INDIRECT	9	\N	25937	1279	27706	t
27707	INDIRECT	9	\N	25937	1278	27705	t
27709	INDIRECT	9	25992	\N	1278	27705	t
27710	INDIRECT	9	25992	\N	1279	27706	t
27712	INDIRECT	9	\N	25938	1279	27706	t
27711	INDIRECT	9	\N	25938	1278	27705	t
27713	INDIRECT	9	25993	\N	1279	27706	t
27714	INDIRECT	9	25993	\N	1278	27705	t
27715	INDIRECT	9	\N	25939	1278	27705	t
27716	INDIRECT	9	\N	25939	1279	27706	t
27717	INDIRECT	9	25994	\N	1278	27705	t
27718	INDIRECT	9	25994	\N	1279	27706	t
27720	INDIRECT	9	\N	25940	1278	27705	t
27719	INDIRECT	9	\N	25940	1279	27706	t
27721	INDIRECT	9	25995	\N	1278	27705	t
27722	INDIRECT	9	25995	\N	1279	27706	t
27723	INDIRECT	9	\N	25941	1279	27706	t
27724	INDIRECT	9	\N	25941	1278	27705	t
27725	INDIRECT	9	25996	\N	1279	27706	t
27726	INDIRECT	9	25996	\N	1278	27705	t
29080	INDIRECT	7	\N	26101	1279	29077	t
29079	INDIRECT	7	\N	26101	1278	29078	t
29081	INDIRECT	7	26029	\N	1278	29078	t
29082	INDIRECT	7	26029	\N	1279	29077	t
29083	DIRECT	7	\N	26102	1278	\N	\N
29085	INDIRECT	7	\N	26103	1279	29084	t
29086	INDIRECT	7	\N	26103	1278	29083	t
29089	DIRECT	7	\N	26104	1278	\N	\N
28462	DIRECT	8	\N	26091	1278	\N	\N
28461	DIRECT	8	\N	26091	1279	\N	\N
28464	INDIRECT	8	\N	26092	1279	28461	t
28463	INDIRECT	8	\N	26092	1278	28462	t
28466	INDIRECT	8	26024	\N	1279	28461	t
28465	INDIRECT	8	26024	\N	1278	28462	t
28467	INDIRECT	8	\N	26093	1278	28462	t
28468	INDIRECT	8	\N	26093	1279	28461	t
28470	INDIRECT	8	26025	\N	1279	28461	t
28469	INDIRECT	8	26025	\N	1278	28462	t
28472	DIRECT	8	\N	26094	1278	\N	\N
28471	DIRECT	8	\N	26094	1279	\N	\N
28474	INDIRECT	8	\N	26095	1278	28472	t
28473	INDIRECT	8	\N	26095	1279	28471	t
28476	INDIRECT	8	26026	\N	1279	28471	t
28475	INDIRECT	8	26026	\N	1278	28472	t
28478	DIRECT	8	\N	26096	1278	\N	\N
28477	DIRECT	8	\N	26096	1279	\N	\N
28480	INDIRECT	8	\N	26097	1279	28477	t
29088	INDIRECT	7	26030	\N	1279	29084	t
29087	INDIRECT	7	26030	\N	1278	29083	t
29090	DIRECT	7	\N	26104	1279	\N	\N
29092	INDIRECT	7	\N	26105	1279	29090	t
29091	INDIRECT	7	\N	26105	1278	29089	t
29094	INDIRECT	7	26031	\N	1278	29089	t
29093	INDIRECT	7	26031	\N	1279	29090	t
29240	DIRECT	6	\N	26106	1278	\N	\N
29239	DIRECT	6	\N	26106	1279	\N	\N
29242	INDIRECT	6	26032	\N	1278	29240	t
29241	INDIRECT	6	26032	\N	1279	29239	t
29244	DIRECT	6	\N	26121	1280	\N	\N
29243	DIRECT	6	\N	26121	1278	\N	\N
29245	INDIRECT	6	26047	\N	1280	29244	t
29246	INDIRECT	6	26047	\N	1278	29243	t
29247	DIRECT	6	\N	26122	1281	\N	\N
29248	DIRECT	6	\N	26122	1278	\N	\N
29250	INDIRECT	6	26048	\N	1278	29248	t
29249	INDIRECT	6	26048	\N	1281	29247	t
27674	DIRECT	9	\N	25929	1279	\N	\N
27673	DIRECT	9	\N	25929	1278	\N	\N
27676	INDIRECT	9	\N	25930	1279	27674	t
27675	INDIRECT	9	\N	25930	1278	27673	t
27677	INDIRECT	9	25987	\N	1278	27673	t
27678	INDIRECT	9	25987	\N	1279	27674	t
27680	DIRECT	9	\N	25931	1279	\N	\N
27679	DIRECT	9	\N	25931	1278	\N	\N
27681	INDIRECT	9	\N	25932	1278	27679	t
27682	INDIRECT	9	\N	25932	1279	27680	t
27684	INDIRECT	9	25988	\N	1279	27680	t
27683	INDIRECT	9	25988	\N	1278	27679	t
27685	INDIRECT	9	\N	25933	1278	27679	t
27686	INDIRECT	9	\N	25933	1279	27680	t
27688	INDIRECT	9	25989	\N	1278	27679	t
27687	INDIRECT	9	25989	\N	1279	27680	t
27689	INDIRECT	9	\N	25934	1279	27680	t
28479	INDIRECT	8	\N	26097	1278	28478	t
28482	INDIRECT	8	26027	\N	1279	28477	t
28481	INDIRECT	8	26027	\N	1278	28478	t
29072	DIRECT	7	\N	26098	1278	\N	\N
29071	DIRECT	7	\N	26098	1279	\N	\N
29073	INDIRECT	7	\N	26099	1279	29071	t
29074	INDIRECT	7	\N	26099	1278	29072	t
29075	INDIRECT	7	26028	\N	1278	29072	t
29076	INDIRECT	7	26028	\N	1279	29071	t
29078	DIRECT	7	\N	26100	1278	\N	\N
29077	DIRECT	7	\N	26100	1279	\N	\N
29084	DIRECT	7	\N	26102	1279	\N	\N
10308	DIRECT	19	\N	3209	1279	\N	\N
40916	DIRECT	4	40833	\N	1235	\N	\N
40915	DIRECT	4	40826	\N	1280	\N	\N
40927	DIRECT	3	\N	40647	1279	\N	\N
40928	INDIRECT	3	40827	\N	1279	40927	t
4191	DIRECT	21	\N	2297	1279	\N	\N
4190	DIRECT	21	\N	2297	1278	\N	\N
4193	INDIRECT	21	\N	2298	1279	4191	t
4192	INDIRECT	21	\N	2298	1278	4190	t
4194	INDIRECT	21	3069	\N	1279	4191	t
4195	INDIRECT	21	3069	\N	1278	4190	t
4196	INDIRECT	21	\N	2299	1279	4191	t
4197	INDIRECT	21	\N	2299	1278	4190	t
4199	INDIRECT	21	3070	\N	1278	4190	t
4198	INDIRECT	21	3070	\N	1279	4191	t
4200	INDIRECT	21	\N	2300	1278	4190	t
4201	INDIRECT	21	\N	2300	1279	4191	t
4202	INDIRECT	21	3071	\N	1278	4190	t
4203	INDIRECT	21	3071	\N	1279	4191	t
4205	INDIRECT	21	\N	2301	1278	4190	t
4204	INDIRECT	21	\N	2301	1279	4191	t
4207	INDIRECT	21	3072	\N	1278	4190	t
4206	INDIRECT	21	3072	\N	1279	4191	t
4208	DIRECT	21	\N	2302	1278	\N	\N
4209	DIRECT	21	\N	2302	1279	\N	\N
4210	INDIRECT	21	\N	2303	1279	4209	t
4211	INDIRECT	21	\N	2303	1278	4208	t
4213	INDIRECT	21	3073	\N	1279	4209	t
4212	INDIRECT	21	3073	\N	1278	4208	t
4215	INDIRECT	21	\N	2304	1279	4209	t
4214	INDIRECT	21	\N	2304	1278	4208	t
4216	INDIRECT	21	3074	\N	1278	4208	t
4217	INDIRECT	21	3074	\N	1279	4209	t
4219	INDIRECT	21	\N	2305	1279	4209	t
4218	INDIRECT	21	\N	2305	1278	4208	t
4220	INDIRECT	21	3075	\N	1278	4208	t
4221	INDIRECT	21	3075	\N	1279	4209	t
4222	DIRECT	21	\N	2306	1279	\N	\N
4223	DIRECT	21	\N	2306	1278	\N	\N
4225	INDIRECT	21	\N	2307	1278	4223	t
4224	INDIRECT	21	\N	2307	1279	4222	t
4227	INDIRECT	21	3076	\N	1279	4222	t
4226	INDIRECT	21	3076	\N	1278	4223	t
4228	INDIRECT	21	\N	2308	1279	4222	t
27692	INDIRECT	9	25990	\N	1279	27680	t
27694	INDIRECT	9	\N	25935	1279	27680	t
27693	INDIRECT	9	\N	25935	1278	27679	t
27696	INDIRECT	9	25991	\N	1278	27679	t
27695	INDIRECT	9	25991	\N	1279	27680	t
27698	INDIRECT	9	\N	26119	1278	27679	t
27697	INDIRECT	9	\N	26119	1279	27680	t
27700	INDIRECT	9	26045	\N	1278	27679	t
27706	DIRECT	9	\N	25936	1279	\N	\N
4229	INDIRECT	21	\N	2308	1278	4223	t
4230	INDIRECT	21	3077	\N	1278	4223	t
4231	INDIRECT	21	3077	\N	1279	4222	t
5472	DIRECT	20	\N	2309	1278	\N	\N
5473	DIRECT	20	\N	2309	1279	\N	\N
5474	INDIRECT	20	\N	2310	1279	5473	t
5475	INDIRECT	20	\N	2310	1278	5472	t
5476	INDIRECT	20	3078	\N	1278	5472	t
5477	INDIRECT	20	3078	\N	1279	5473	t
5478	INDIRECT	20	\N	2311	1279	5473	t
5479	INDIRECT	20	\N	2311	1278	5472	t
5480	INDIRECT	20	3079	\N	1278	5472	t
5481	INDIRECT	20	3079	\N	1279	5473	t
5483	INDIRECT	20	\N	2312	1279	5473	t
5482	INDIRECT	20	\N	2312	1278	5472	t
5485	INDIRECT	20	3080	\N	1278	5472	t
5484	INDIRECT	20	3080	\N	1279	5473	t
5486	INDIRECT	20	\N	2313	1278	5472	t
5487	INDIRECT	20	\N	2313	1279	5473	t
5488	INDIRECT	20	3081	\N	1279	5473	t
5489	INDIRECT	20	3081	\N	1278	5472	t
5490	DIRECT	20	\N	3202	1278	\N	\N
5491	DIRECT	20	\N	3202	1279	\N	\N
5492	INDIRECT	20	\N	3203	1278	5490	t
5493	INDIRECT	20	\N	3203	1279	5491	t
5495	INDIRECT	20	3243	\N	1278	5490	t
5494	INDIRECT	20	3243	\N	1279	5491	t
5496	INDIRECT	20	\N	3204	1279	5491	t
5497	INDIRECT	20	\N	3204	1278	5490	t
5499	INDIRECT	20	3244	\N	1279	5491	t
5498	INDIRECT	20	3244	\N	1278	5490	t
5501	DIRECT	20	\N	3205	1279	\N	\N
5500	DIRECT	20	\N	3205	1278	\N	\N
5503	INDIRECT	20	\N	3206	1279	5501	t
5502	INDIRECT	20	\N	3206	1278	5500	t
5505	INDIRECT	20	3245	\N	1278	5500	t
5504	INDIRECT	20	3245	\N	1279	5501	t
5507	DIRECT	20	\N	3207	1279	\N	\N
5506	DIRECT	20	\N	3207	1278	\N	\N
5509	INDIRECT	20	\N	3208	1278	5506	t
5508	INDIRECT	20	\N	3208	1279	5507	t
5511	INDIRECT	20	3246	\N	1278	5506	t
5510	INDIRECT	20	3246	\N	1279	5507	t
10307	DIRECT	19	\N	3209	1278	\N	\N
10310	INDIRECT	19	\N	3210	1278	10307	t
10309	INDIRECT	19	\N	3210	1279	10308	t
10312	INDIRECT	19	3247	\N	1278	10307	t
10311	INDIRECT	19	3247	\N	1279	10308	t
10314	INDIRECT	19	\N	3211	1279	10308	t
10313	INDIRECT	19	\N	3211	1278	10307	t
10316	INDIRECT	19	3248	\N	1278	10307	t
10315	INDIRECT	19	3248	\N	1279	10308	t
10317	INDIRECT	19	\N	3212	1278	10307	t
10318	INDIRECT	19	\N	3212	1279	10308	t
10319	INDIRECT	19	3249	\N	1278	10307	t
10320	INDIRECT	19	3249	\N	1279	10308	t
10321	DIRECT	19	\N	3213	1279	\N	\N
10322	DIRECT	19	\N	3213	1278	\N	\N
10324	INDIRECT	19	\N	3214	1279	10321	t
10323	INDIRECT	19	\N	3214	1278	10322	t
10325	INDIRECT	19	3250	\N	1278	10322	t
10326	INDIRECT	19	3250	\N	1279	10321	t
10328	INDIRECT	19	\N	3215	1279	10321	t
10327	INDIRECT	19	\N	3215	1278	10322	t
10330	INDIRECT	19	3251	\N	1278	10322	t
10329	INDIRECT	19	3251	\N	1279	10321	t
10332	INDIRECT	19	\N	3216	1279	10321	t
10331	INDIRECT	19	\N	3216	1278	10322	t
10333	INDIRECT	19	3252	\N	1279	10321	t
10334	INDIRECT	19	3252	\N	1278	10322	t
10335	INDIRECT	19	\N	3217	1279	10321	t
10336	INDIRECT	19	\N	3217	1278	10322	t
10338	INDIRECT	19	3253	\N	1279	10321	t
10337	INDIRECT	19	3253	\N	1278	10322	t
10340	INDIRECT	19	\N	3218	1279	10321	t
10339	INDIRECT	19	\N	3218	1278	10322	t
10342	INDIRECT	19	3254	\N	1278	10322	t
10341	INDIRECT	19	3254	\N	1279	10321	t
10344	DIRECT	19	\N	3219	1279	\N	\N
10343	DIRECT	19	\N	3219	1278	\N	\N
10346	INDIRECT	19	\N	3220	1279	10344	t
10345	INDIRECT	19	\N	3220	1278	10343	t
10347	INDIRECT	19	3255	\N	1279	10344	t
10348	INDIRECT	19	3255	\N	1278	10343	t
10349	INDIRECT	19	\N	3221	1278	10343	t
10350	INDIRECT	19	\N	3221	1279	10344	t
10351	INDIRECT	19	3256	\N	1278	10343	t
10352	INDIRECT	19	3256	\N	1279	10344	t
10353	DIRECT	19	\N	3222	1278	\N	\N
10354	INDIRECT	19	\N	3223	1278	10353	t
10355	INDIRECT	19	3257	\N	1278	10353	t
10356	INDIRECT	19	\N	3224	1278	10353	t
10357	INDIRECT	19	3258	\N	1278	10353	t
10358	DIRECT	19	\N	3225	1280	\N	\N
10359	DIRECT	19	\N	3225	1278	\N	\N
10361	INDIRECT	19	\N	3226	1278	10359	t
10360	INDIRECT	19	\N	3226	1280	10358	t
10363	INDIRECT	19	3259	\N	1280	10358	t
10362	INDIRECT	19	3259	\N	1278	10359	t
10364	DIRECT	19	\N	3229	1279	\N	\N
10365	DIRECT	19	\N	3229	1278	\N	\N
10366	INDIRECT	19	\N	3230	1279	10364	t
10367	INDIRECT	19	\N	3230	1278	10365	t
10369	INDIRECT	19	3261	\N	1278	10365	t
10368	INDIRECT	19	3261	\N	1279	10364	t
10370	INDIRECT	19	\N	3231	1279	10364	t
10371	INDIRECT	19	\N	3231	1278	10365	t
10372	INDIRECT	19	3262	\N	1278	10365	t
10373	INDIRECT	19	3262	\N	1279	10364	t
10375	INDIRECT	19	\N	3333	1278	10365	t
10374	INDIRECT	19	\N	3333	1279	10364	t
10376	INDIRECT	19	3263	\N	1279	10364	t
10377	INDIRECT	19	3263	\N	1278	10365	t
10379	INDIRECT	19	\N	3334	1279	10364	t
10378	INDIRECT	19	\N	3334	1278	10365	t
10381	INDIRECT	19	3264	\N	1279	10364	t
10380	INDIRECT	19	3264	\N	1278	10365	t
10382	INDIRECT	19	\N	3335	1278	10365	t
10383	INDIRECT	19	\N	3335	1279	10364	t
10384	INDIRECT	19	3265	\N	1278	10365	t
10385	INDIRECT	19	3265	\N	1279	10364	t
10386	INDIRECT	19	\N	3336	1278	10365	t
10387	INDIRECT	19	\N	3336	1279	10364	t
10389	INDIRECT	19	3266	\N	1278	10365	t
10388	INDIRECT	19	3266	\N	1279	10364	t
10390	INDIRECT	19	\N	3337	1278	10365	t
10391	INDIRECT	19	\N	3337	1279	10364	t
10392	INDIRECT	19	3267	\N	1279	10364	t
10393	INDIRECT	19	3267	\N	1278	10365	t
10394	INDIRECT	19	\N	3338	1278	10365	t
10395	INDIRECT	19	\N	3338	1279	10364	t
10397	INDIRECT	19	3268	\N	1278	10365	t
10396	INDIRECT	19	3268	\N	1279	10364	t
10399	INDIRECT	19	\N	3339	1278	10365	t
10398	INDIRECT	19	\N	3339	1279	10364	t
10400	INDIRECT	19	3269	\N	1278	10365	t
10401	INDIRECT	19	3269	\N	1279	10364	t
10402	INDIRECT	19	\N	3340	1279	10364	t
10403	INDIRECT	19	\N	3340	1278	10365	t
10405	INDIRECT	19	3270	\N	1278	10365	t
10404	INDIRECT	19	3270	\N	1279	10364	t
10407	DIRECT	19	\N	3341	1281	\N	\N
10406	DIRECT	19	\N	3341	1278	\N	\N
10409	INDIRECT	19	3271	\N	1278	10406	t
10408	INDIRECT	19	3271	\N	1281	10407	t
10411	DIRECT	19	\N	3342	1281	\N	\N
10410	DIRECT	19	\N	3342	1278	\N	\N
10412	INDIRECT	19	3272	\N	1281	10411	t
10413	INDIRECT	19	3272	\N	1278	10410	t
10948	DIRECT	16	\N	3357	1278	\N	\N
10949	DIRECT	16	\N	3357	1279	\N	\N
10950	INDIRECT	16	\N	3358	1279	10949	t
10951	INDIRECT	16	\N	3358	1278	10948	t
10952	INDIRECT	16	3285	\N	1278	10948	t
10953	INDIRECT	16	3285	\N	1279	10949	t
10954	INDIRECT	16	\N	3359	1279	10949	t
10955	INDIRECT	16	\N	3359	1278	10948	t
10957	INDIRECT	16	3286	\N	1279	10949	t
10956	INDIRECT	16	3286	\N	1278	10948	t
10959	INDIRECT	16	\N	3360	1278	10948	t
10958	INDIRECT	16	\N	3360	1279	10949	t
10961	INDIRECT	16	3287	\N	1279	10949	t
10960	INDIRECT	16	3287	\N	1278	10948	t
10963	INDIRECT	16	\N	3361	1278	10948	t
10962	INDIRECT	16	\N	3361	1279	10949	t
10965	INDIRECT	16	3288	\N	1278	10948	t
10964	INDIRECT	16	3288	\N	1279	10949	t
10967	INDIRECT	16	\N	3362	1278	10948	t
10966	INDIRECT	16	\N	3362	1279	10949	t
10968	INDIRECT	16	3289	\N	1279	10949	t
10969	INDIRECT	16	3289	\N	1278	10948	t
10970	INDIRECT	16	\N	3363	1279	10949	t
10971	INDIRECT	16	\N	3363	1278	10948	t
10973	INDIRECT	16	3290	\N	1278	10948	t
10972	INDIRECT	16	3290	\N	1279	10949	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
1736	3	2010-01-15 13:50:42.661	\N	f	1282	1337
1737	2	2010-01-15 13:51:12.305	\N	f	1284	1339
1738	2	2010-01-15 17:17:12.701	\N	f	1278	1341
1739	2	2010-01-15 17:17:12.037	\N	f	1279	1341
1740	2	2010-01-15 17:47:00.839	\N	f	1278	1343
1742	2	2010-01-15 18:03:14.494	\N	f	1278	1345
1741	2	2010-01-15 18:03:11.25	\N	f	1280	1345
1722	3	2009-01-15 00:00:00	\N	f	1278	1320
1723	3	2009-01-15 00:00:00	\N	f	1281	1320
1728	3	2009-01-15 00:00:00	\N	f	1279	1328
1729	3	2009-01-15 00:00:00	\N	f	1278	1328
1725	4	2009-01-15 00:00:00	\N	f	1279	1322
1724	4	2009-01-15 00:00:00	\N	f	1278	1322
1721	2	2009-01-15 00:00:00	\N	f	1279	1314
1717	4	2009-01-15 00:00:00	\N	f	1278	1314
1730	3	2009-01-15 00:00:00	\N	f	1279	1330
1731	3	2009-01-15 00:00:00	\N	f	1278	1330
1718	4	2009-01-15 00:00:00	\N	f	1278	1316
1719	2	2009-01-15 00:00:00	\N	f	1281	1316
1720	2	2009-01-15 00:00:00	\N	f	1280	1316
1727	3	2009-01-15 00:00:00	\N	f	1278	1326
1726	3	2009-01-15 00:00:00	\N	f	1279	1326
1733	2	2010-01-15 13:46:33.82	\N	f	1234	1333
1732	2	2010-01-15 13:46:48.578	\N	f	1121	1333
1735	2	2010-01-15 13:48:17.108	\N	f	1212	1335
1734	2	2010-01-15 13:49:06.382	\N	f	1227	1335
40501	2	2010-01-18 18:49:08.342	2010-03-25 00:00:00	f	1235	40098
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
327682	1	Rol proyecto	\N	t	t	t	1
327683	1	Tipos de máquina	\N	t	f	t	0
1	15	LEAVE	Leave	f	f	t	1
2	11	CATEGORY	Professional category	t	t	t	1
3	9	TRAINING	Training courses and labor training	t	t	t	1
4	7	JOB	Job	t	t	t	1
5	5	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
6	1	LOCATION_GROUP	Location where the resource work	t	f	t	0
327681	1	Clasificación de traballo	Clasificación de traballo	t	t	t	1
327680	3	Tipo de traballo	Tipo de traballo	t	t	t	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
13593	SPECIFIC_DAY	2	2	2009-12-14	1316	11900	\N	\N
13589	SPECIFIC_DAY	2	2	2009-12-18	1316	11900	\N	\N
13574	SPECIFIC_DAY	2	2	2010-01-15	1316	11900	\N	\N
13561	SPECIFIC_DAY	2	0	2010-01-03	1316	11900	\N	\N
13501	SPECIFIC_DAY	2	2	2010-01-04	1345	11898	\N	\N
13505	SPECIFIC_DAY	2	0	2010-01-16	1345	11898	\N	\N
13490	SPECIFIC_DAY	2	2	2010-01-13	1345	11898	\N	\N
13492	SPECIFIC_DAY	2	0	2009-12-27	1345	11898	\N	\N
13469	SPECIFIC_DAY	2	2	2010-01-12	1345	11898	\N	\N
13503	SPECIFIC_DAY	2	2	2010-01-21	1345	11898	\N	\N
13496	SPECIFIC_DAY	2	2	2010-01-01	1345	11898	\N	\N
13502	SPECIFIC_DAY	2	2	2009-12-29	1345	11898	\N	\N
13464	SPECIFIC_DAY	2	2	2009-12-22	1345	11898	\N	\N
13465	SPECIFIC_DAY	2	2	2010-01-11	1345	11898	\N	\N
13484	SPECIFIC_DAY	2	0	2010-01-10	1345	11898	\N	\N
13482	SPECIFIC_DAY	2	2	2009-12-30	1345	11898	\N	\N
25721	SPECIFIC_DAY	0	0	2009-12-20	1341	10646	\N	\N
25722	SPECIFIC_DAY	0	8	2009-12-21	1341	10646	\N	\N
25723	SPECIFIC_DAY	0	0	2009-12-19	1341	10646	\N	\N
25724	SPECIFIC_DAY	0	8	2009-12-22	1322	10694	\N	\N
25725	SPECIFIC_DAY	0	8	2009-12-24	1322	10694	\N	\N
25726	SPECIFIC_DAY	0	8	2009-12-23	1322	10694	\N	\N
25727	SPECIFIC_DAY	0	0	2010-01-17	1328	10683	\N	\N
25728	SPECIFIC_DAY	0	8	2010-01-18	1328	10683	\N	\N
25729	SPECIFIC_DAY	0	8	2010-01-12	1328	10683	\N	\N
25730	SPECIFIC_DAY	0	0	2010-01-10	1328	10683	\N	\N
25731	SPECIFIC_DAY	0	8	2010-01-11	1328	10683	\N	\N
25732	SPECIFIC_DAY	0	0	2010-01-09	1328	10683	\N	\N
25733	SPECIFIC_DAY	0	8	2010-01-15	1328	10683	\N	\N
25734	SPECIFIC_DAY	0	8	2010-01-19	1328	10683	\N	\N
25735	SPECIFIC_DAY	0	0	2010-01-16	1328	10683	\N	\N
25736	SPECIFIC_DAY	0	8	2010-01-14	1328	10683	\N	\N
25737	SPECIFIC_DAY	0	8	2010-01-13	1328	10683	\N	\N
25738	SPECIFIC_DAY	0	8	2010-01-29	1341	10670	\N	\N
25739	SPECIFIC_DAY	0	8	2009-12-28	1322	10693	\N	\N
25740	SPECIFIC_DAY	0	8	2009-12-29	1322	10693	\N	\N
25741	SPECIFIC_DAY	0	8	2009-12-30	1322	10693	\N	\N
25742	SPECIFIC_DAY	0	8	2009-12-25	1322	10693	\N	\N
25743	SPECIFIC_DAY	0	0	2009-12-26	1322	10693	\N	\N
25744	SPECIFIC_DAY	0	8	2009-12-31	1322	10693	\N	\N
25745	SPECIFIC_DAY	0	0	2009-12-27	1322	10693	\N	\N
25746	SPECIFIC_DAY	0	0	2010-01-17	1343	11840	\N	\N
25747	SPECIFIC_DAY	0	0	2010-01-16	1343	11840	\N	\N
25748	SPECIFIC_DAY	0	2	2010-01-19	1343	11840	\N	\N
25749	SPECIFIC_DAY	0	2	2010-01-15	1343	11840	\N	\N
25750	SPECIFIC_DAY	0	2	2010-01-07	1343	11840	\N	\N
25751	SPECIFIC_DAY	0	2	2010-01-13	1343	11840	\N	\N
25752	SPECIFIC_DAY	0	2	2010-01-05	1343	11840	\N	\N
25753	SPECIFIC_DAY	0	2	2010-01-06	1343	11840	\N	\N
25754	SPECIFIC_DAY	0	0	2010-01-03	1343	11840	\N	\N
25755	SPECIFIC_DAY	0	0	2010-01-09	1343	11840	\N	\N
25756	SPECIFIC_DAY	0	2	2010-01-18	1343	11840	\N	\N
25757	SPECIFIC_DAY	0	2	2009-12-31	1343	11840	\N	\N
25758	SPECIFIC_DAY	0	2	2010-01-20	1343	11840	\N	\N
25759	SPECIFIC_DAY	0	0	2010-01-02	1343	11840	\N	\N
25760	SPECIFIC_DAY	0	2	2010-01-12	1343	11840	\N	\N
25761	SPECIFIC_DAY	0	2	2010-01-08	1343	11840	\N	\N
25762	SPECIFIC_DAY	0	2	2010-01-11	1343	11840	\N	\N
25763	SPECIFIC_DAY	0	2	2010-01-01	1343	11840	\N	\N
25764	SPECIFIC_DAY	0	2	2009-12-30	1343	11840	\N	\N
25765	SPECIFIC_DAY	0	2	2010-01-14	1343	11840	\N	\N
25766	SPECIFIC_DAY	0	0	2010-01-10	1343	11840	\N	\N
25767	SPECIFIC_DAY	0	2	2010-01-04	1343	11840	\N	\N
25768	SPECIFIC_DAY	0	3	2010-01-14	1314	10641	\N	\N
25769	SPECIFIC_DAY	0	3	2010-01-26	1314	10641	\N	\N
25770	SPECIFIC_DAY	0	0	2010-01-16	1314	10641	\N	\N
25771	SPECIFIC_DAY	0	3	2010-01-13	1314	10641	\N	\N
25772	SPECIFIC_DAY	0	3	2009-12-30	1314	10641	\N	\N
25773	SPECIFIC_DAY	0	3	2010-01-20	1314	10641	\N	\N
25774	SPECIFIC_DAY	0	0	2010-01-17	1314	10641	\N	\N
25775	SPECIFIC_DAY	0	3	2009-12-31	1314	10641	\N	\N
39522	GENERIC_DAY	1	1	2010-03-01	1341	\N	29567	\N
39523	GENERIC_DAY	1	1	2010-02-24	1322	\N	29567	\N
39524	GENERIC_DAY	1	1	2010-03-03	1326	\N	29567	\N
39525	GENERIC_DAY	1	1	2010-03-08	1341	\N	29567	\N
39526	GENERIC_DAY	1	2	2010-02-09	1328	\N	29567	\N
39527	GENERIC_DAY	1	2	2010-03-05	1330	\N	29567	\N
39528	GENERIC_DAY	1	0	2010-02-17	1314	\N	29567	\N
39529	GENERIC_DAY	1	1	2010-02-22	1341	\N	29567	\N
39530	GENERIC_DAY	1	0	2010-03-06	1314	\N	29567	\N
39531	GENERIC_DAY	1	1	2010-02-19	1322	\N	29567	\N
39532	GENERIC_DAY	1	2	2010-02-11	1322	\N	29567	\N
39533	GENERIC_DAY	1	0	2010-03-06	1322	\N	29567	\N
39534	GENERIC_DAY	1	2	2010-02-26	1322	\N	29567	\N
39535	GENERIC_DAY	1	1	2010-05-18	1314	\N	29568	\N
39536	GENERIC_DAY	1	1	2010-05-27	1314	\N	29568	\N
39537	GENERIC_DAY	1	1	2010-05-25	1314	\N	29568	\N
39538	GENERIC_DAY	1	2	2010-05-26	1326	\N	29568	\N
39539	GENERIC_DAY	1	2	2010-05-20	1328	\N	29568	\N
39540	GENERIC_DAY	1	0	2010-05-23	1328	\N	29568	\N
39541	GENERIC_DAY	1	0	2010-05-23	1314	\N	29568	\N
39542	GENERIC_DAY	1	0	2010-05-23	1341	\N	29568	\N
39543	GENERIC_DAY	1	0	2010-05-15	1322	\N	29568	\N
39544	GENERIC_DAY	1	0	2010-05-17	1341	\N	29568	\N
39545	GENERIC_DAY	1	1	2010-05-25	1322	\N	29568	\N
39546	GENERIC_DAY	1	2	2010-05-19	1328	\N	29568	\N
39547	GENERIC_DAY	1	0	2010-05-23	1326	\N	29568	\N
39548	GENERIC_DAY	1	0	2010-05-16	1341	\N	29568	\N
39549	GENERIC_DAY	1	1	2010-05-20	1330	\N	29568	\N
39550	GENERIC_DAY	1	1	2010-05-26	1322	\N	29568	\N
39551	GENERIC_DAY	1	1	2010-05-19	1341	\N	29568	\N
39552	GENERIC_DAY	1	1	2010-05-21	1341	\N	29568	\N
39553	GENERIC_DAY	1	2	2010-05-18	1328	\N	29568	\N
39554	GENERIC_DAY	1	0	2010-05-22	1330	\N	29568	\N
39555	GENERIC_DAY	1	1	2010-05-27	1330	\N	29568	\N
39556	GENERIC_DAY	1	1	2010-05-24	1322	\N	29568	\N
39557	GENERIC_DAY	1	0	2010-05-15	1326	\N	29568	\N
39558	GENERIC_DAY	1	1	2010-05-25	1341	\N	29568	\N
39559	GENERIC_DAY	1	2	2010-05-24	1328	\N	29568	\N
39560	GENERIC_DAY	1	2	2010-05-25	1326	\N	29568	\N
39561	GENERIC_DAY	1	1	2010-05-18	1322	\N	29568	\N
39562	GENERIC_DAY	1	0	2010-05-22	1322	\N	29568	\N
39563	GENERIC_DAY	1	1	2010-05-26	1330	\N	29568	\N
39564	GENERIC_DAY	1	1	2010-05-21	1330	\N	29568	\N
39565	GENERIC_DAY	1	0	2010-05-15	1314	\N	29568	\N
39566	GENERIC_DAY	1	1	2010-05-27	1322	\N	29568	\N
39567	GENERIC_DAY	1	1	2010-05-24	1341	\N	29568	\N
39568	GENERIC_DAY	1	0	2010-05-16	1322	\N	29568	\N
39569	GENERIC_DAY	1	1	2010-05-20	1322	\N	29568	\N
39570	GENERIC_DAY	1	1	2010-05-21	1314	\N	29568	\N
39571	GENERIC_DAY	1	0	2010-05-22	1341	\N	29568	\N
39572	GENERIC_DAY	1	0	2010-05-22	1328	\N	29568	\N
39573	GENERIC_DAY	1	2	2010-05-27	1326	\N	29568	\N
39574	GENERIC_DAY	1	1	2010-05-19	1330	\N	29568	\N
39575	GENERIC_DAY	1	1	2010-05-25	1330	\N	29568	\N
39576	GENERIC_DAY	1	2	2010-05-21	1328	\N	29568	\N
39577	GENERIC_DAY	1	1	2010-05-27	1328	\N	29568	\N
39578	GENERIC_DAY	1	2	2010-05-24	1326	\N	29568	\N
39579	GENERIC_DAY	1	2	2010-05-26	1328	\N	29568	\N
39580	GENERIC_DAY	1	0	2010-05-16	1326	\N	29568	\N
39581	GENERIC_DAY	1	1	2010-05-26	1314	\N	29568	\N
39582	GENERIC_DAY	1	0	2010-05-17	1322	\N	29568	\N
39583	GENERIC_DAY	1	1	2010-05-19	1314	\N	29568	\N
39584	GENERIC_DAY	1	0	2010-05-17	1330	\N	29568	\N
39585	GENERIC_DAY	1	0	2010-05-16	1330	\N	29568	\N
39586	GENERIC_DAY	1	0	2010-05-22	1326	\N	29568	\N
39587	GENERIC_DAY	1	0	2010-05-23	1330	\N	29568	\N
39588	GENERIC_DAY	1	2	2010-05-20	1326	\N	29568	\N
39589	GENERIC_DAY	1	1	2010-05-24	1330	\N	29568	\N
39590	GENERIC_DAY	1	1	2010-05-18	1341	\N	29568	\N
39591	GENERIC_DAY	1	1	2010-05-20	1341	\N	29568	\N
39592	GENERIC_DAY	1	0	2010-05-23	1322	\N	29568	\N
39593	GENERIC_DAY	1	2	2010-05-18	1326	\N	29568	\N
39594	GENERIC_DAY	1	0	2010-05-17	1326	\N	29568	\N
39595	GENERIC_DAY	1	1	2010-05-20	1314	\N	29568	\N
39596	GENERIC_DAY	1	0	2010-05-15	1330	\N	29568	\N
39597	GENERIC_DAY	1	1	2010-05-19	1322	\N	29568	\N
39598	GENERIC_DAY	1	1	2010-05-27	1341	\N	29568	\N
39599	GENERIC_DAY	1	1	2010-05-18	1330	\N	29568	\N
39600	GENERIC_DAY	1	0	2010-05-15	1341	\N	29568	\N
39601	GENERIC_DAY	1	0	2010-05-22	1314	\N	29568	\N
39602	GENERIC_DAY	1	0	2010-05-16	1314	\N	29568	\N
39603	GENERIC_DAY	1	0	2010-05-17	1328	\N	29568	\N
39604	GENERIC_DAY	1	2	2010-05-19	1326	\N	29568	\N
39605	GENERIC_DAY	1	1	2010-05-26	1341	\N	29568	\N
39606	GENERIC_DAY	1	1	2010-05-24	1314	\N	29568	\N
39607	GENERIC_DAY	1	2	2010-05-25	1328	\N	29568	\N
39608	GENERIC_DAY	1	0	2010-05-15	1328	\N	29568	\N
39609	GENERIC_DAY	1	2	2010-05-21	1326	\N	29568	\N
39610	GENERIC_DAY	1	0	2010-05-17	1314	\N	29568	\N
39611	GENERIC_DAY	1	1	2010-05-21	1322	\N	29568	\N
39612	GENERIC_DAY	1	0	2010-05-16	1328	\N	29568	\N
39613	GENERIC_DAY	1	0	2010-02-08	1341	\N	29569	\N
39614	GENERIC_DAY	1	0	2010-02-07	1330	\N	29569	\N
39615	GENERIC_DAY	1	0	2010-02-06	1330	\N	29569	\N
39616	GENERIC_DAY	1	0	2010-02-02	1341	\N	29569	\N
39617	GENERIC_DAY	1	2	2010-02-01	1330	\N	29569	\N
39618	GENERIC_DAY	1	0	2010-02-06	1328	\N	29569	\N
39619	GENERIC_DAY	1	1	2010-02-01	1322	\N	29569	\N
39620	GENERIC_DAY	1	0	2010-02-07	1322	\N	29569	\N
39621	GENERIC_DAY	1	0	2010-02-06	1322	\N	29569	\N
39622	GENERIC_DAY	1	1	2010-02-05	1314	\N	29569	\N
39623	GENERIC_DAY	1	1	2010-02-08	1328	\N	29569	\N
39624	GENERIC_DAY	1	0	2010-02-07	1341	\N	29569	\N
10730	SPECIFIC_DAY	19	8	2009-12-14	1330	10618	\N	\N
13605	SPECIFIC_DAY	2	0	2010-01-17	1316	11901	\N	\N
13631	SPECIFIC_DAY	2	0	2010-01-09	1316	11901	\N	\N
13629	SPECIFIC_DAY	2	4	2009-12-17	1316	11901	\N	\N
13620	SPECIFIC_DAY	2	4	2010-01-08	1316	11901	\N	\N
13634	SPECIFIC_DAY	2	4	2009-12-23	1316	11901	\N	\N
13636	SPECIFIC_DAY	2	4	2010-01-13	1316	11901	\N	\N
13618	SPECIFIC_DAY	2	4	2009-12-15	1316	11901	\N	\N
13599	SPECIFIC_DAY	2	4	2010-01-26	1316	11901	\N	\N
13619	SPECIFIC_DAY	2	4	2010-01-20	1316	11901	\N	\N
12748	SPECIFIC_DAY	5	0	2010-01-03	1316	11838	\N	\N
12744	SPECIFIC_DAY	5	0	2010-01-17	1316	11838	\N	\N
12761	SPECIFIC_DAY	5	2	2009-12-14	1316	11838	\N	\N
39625	GENERIC_DAY	1	1	2010-02-04	1322	\N	29569	\N
39626	GENERIC_DAY	1	0	2010-02-06	1314	\N	29569	\N
39627	GENERIC_DAY	1	0	2010-02-08	1314	\N	29569	\N
39628	GENERIC_DAY	1	2	2010-02-02	1328	\N	29569	\N
39629	GENERIC_DAY	1	2	2010-02-03	1328	\N	29569	\N
39630	GENERIC_DAY	1	2	2010-02-04	1330	\N	29569	\N
39631	GENERIC_DAY	1	2	2010-02-05	1341	\N	29569	\N
39632	GENERIC_DAY	1	0	2010-02-08	1326	\N	29569	\N
39633	GENERIC_DAY	1	2	2010-02-03	1330	\N	29569	\N
39634	GENERIC_DAY	1	1	2010-02-04	1314	\N	29569	\N
39635	GENERIC_DAY	1	1	2010-02-05	1322	\N	29569	\N
39636	GENERIC_DAY	1	1	2010-02-04	1341	\N	29569	\N
39637	GENERIC_DAY	1	0	2010-02-06	1326	\N	29569	\N
39638	GENERIC_DAY	1	0	2010-02-08	1322	\N	29569	\N
39639	GENERIC_DAY	1	1	2010-02-01	1314	\N	29569	\N
39640	GENERIC_DAY	1	0	2010-02-07	1314	\N	29569	\N
39641	GENERIC_DAY	1	1	2010-02-08	1330	\N	29569	\N
39642	GENERIC_DAY	1	0	2010-02-06	1341	\N	29569	\N
39643	GENERIC_DAY	1	0	2010-02-07	1326	\N	29569	\N
39644	GENERIC_DAY	1	1	2010-02-03	1314	\N	29569	\N
39645	GENERIC_DAY	1	1	2010-02-03	1322	\N	29569	\N
39646	GENERIC_DAY	1	0	2010-02-07	1328	\N	29569	\N
39647	GENERIC_DAY	1	2	2010-02-02	1326	\N	29569	\N
39648	GENERIC_DAY	1	2	2010-02-01	1326	\N	29569	\N
39649	GENERIC_DAY	1	0	2010-02-03	1341	\N	29569	\N
39650	GENERIC_DAY	1	1	2010-02-05	1326	\N	29569	\N
39651	GENERIC_DAY	1	2	2010-02-04	1328	\N	29569	\N
39652	GENERIC_DAY	1	2	2010-02-05	1330	\N	29569	\N
39653	GENERIC_DAY	1	0	2010-02-01	1341	\N	29569	\N
39654	GENERIC_DAY	1	1	2010-02-02	1314	\N	29569	\N
39655	GENERIC_DAY	1	1	2010-02-05	1328	\N	29569	\N
39656	GENERIC_DAY	1	2	2010-02-03	1326	\N	29569	\N
39657	GENERIC_DAY	1	2	2010-02-02	1330	\N	29569	\N
39658	GENERIC_DAY	1	1	2010-02-04	1326	\N	29569	\N
39659	GENERIC_DAY	1	1	2010-02-02	1322	\N	29569	\N
39660	GENERIC_DAY	1	2	2010-02-01	1328	\N	29569	\N
39661	GENERIC_DAY	1	1	2010-02-26	1328	\N	29570	\N
39662	GENERIC_DAY	1	1	2010-02-26	1326	\N	29570	\N
39663	GENERIC_DAY	1	1	2010-03-01	1314	\N	29570	\N
39664	GENERIC_DAY	1	1	2010-03-02	1330	\N	29570	\N
39665	GENERIC_DAY	1	2	2010-03-02	1322	\N	29570	\N
39666	GENERIC_DAY	1	2	2010-03-01	1322	\N	29570	\N
39667	GENERIC_DAY	1	1	2010-03-02	1314	\N	29570	\N
39668	GENERIC_DAY	1	0	2010-02-28	1328	\N	29570	\N
39669	GENERIC_DAY	1	0	2010-02-27	1322	\N	29570	\N
39670	GENERIC_DAY	1	1	2010-03-02	1341	\N	29570	\N
39671	GENERIC_DAY	1	0	2010-02-28	1322	\N	29570	\N
39672	GENERIC_DAY	1	2	2010-02-26	1314	\N	29570	\N
39673	GENERIC_DAY	1	1	2010-03-03	1322	\N	29570	\N
39674	GENERIC_DAY	1	1	2010-03-03	1326	\N	29570	\N
39675	GENERIC_DAY	1	0	2010-02-27	1341	\N	29570	\N
39676	GENERIC_DAY	1	2	2010-02-26	1341	\N	29570	\N
39677	GENERIC_DAY	1	1	2010-03-01	1341	\N	29570	\N
39678	GENERIC_DAY	1	0	2010-02-28	1314	\N	29570	\N
39679	GENERIC_DAY	1	0	2010-03-03	1314	\N	29570	\N
39680	GENERIC_DAY	1	0	2010-02-28	1330	\N	29570	\N
39681	GENERIC_DAY	1	1	2010-02-26	1330	\N	29570	\N
39682	GENERIC_DAY	1	1	2010-03-01	1328	\N	29570	\N
39683	GENERIC_DAY	1	2	2010-03-02	1326	\N	29570	\N
39684	GENERIC_DAY	1	0	2010-02-27	1326	\N	29570	\N
39685	GENERIC_DAY	1	0	2010-02-27	1330	\N	29570	\N
39686	GENERIC_DAY	1	1	2010-02-26	1322	\N	29570	\N
39687	GENERIC_DAY	1	1	2010-03-01	1330	\N	29570	\N
39688	GENERIC_DAY	1	0	2010-03-03	1341	\N	29570	\N
39689	GENERIC_DAY	1	0	2010-02-27	1328	\N	29570	\N
39690	GENERIC_DAY	1	2	2010-03-01	1326	\N	29570	\N
39691	GENERIC_DAY	1	0	2010-02-28	1326	\N	29570	\N
39692	GENERIC_DAY	1	0	2010-02-27	1314	\N	29570	\N
39693	GENERIC_DAY	1	0	2010-02-28	1341	\N	29570	\N
39694	GENERIC_DAY	1	1	2010-03-03	1330	\N	29570	\N
39695	GENERIC_DAY	1	1	2010-03-02	1328	\N	29570	\N
39696	GENERIC_DAY	1	1	2010-03-03	1328	\N	29570	\N
39697	GENERIC_DAY	1	0	2010-03-07	1326	\N	29571	\N
36778	GENERIC_DAY	1	3	2010-06-01	1320	\N	29550	\N
36779	GENERIC_DAY	1	2	2010-02-12	1316	\N	29550	\N
36780	GENERIC_DAY	1	0	2010-03-14	1320	\N	29550	\N
36781	GENERIC_DAY	1	2	2010-02-19	1316	\N	29550	\N
36782	GENERIC_DAY	1	2	2010-03-10	1316	\N	29550	\N
36783	GENERIC_DAY	1	1	2010-05-05	1316	\N	29550	\N
36784	GENERIC_DAY	1	1	2010-05-18	1316	\N	29550	\N
36785	GENERIC_DAY	1	5	2010-03-15	1320	\N	29550	\N
36786	GENERIC_DAY	1	0	2010-04-02	1320	\N	29550	\N
36787	GENERIC_DAY	1	5	2010-02-02	1320	\N	29550	\N
36788	GENERIC_DAY	1	5	2010-05-18	1320	\N	29550	\N
36789	GENERIC_DAY	1	5	2010-03-12	1320	\N	29550	\N
36790	GENERIC_DAY	1	5	2010-03-02	1320	\N	29550	\N
36791	GENERIC_DAY	1	0	2010-04-11	1316	\N	29550	\N
36792	GENERIC_DAY	1	2	2010-04-12	1316	\N	29550	\N
36793	GENERIC_DAY	1	5	2010-05-31	1320	\N	29550	\N
13045	SPECIFIC_DAY	4	0	2010-01-02	1316	11847	\N	\N
13039	SPECIFIC_DAY	4	2	2010-01-01	1316	11847	\N	\N
13042	SPECIFIC_DAY	4	2	2009-12-16	1316	11847	\N	\N
13034	SPECIFIC_DAY	4	2	2010-01-08	1316	11847	\N	\N
13041	SPECIFIC_DAY	4	2	2009-12-31	1316	11847	\N	\N
13047	SPECIFIC_DAY	4	0	2009-12-27	1316	11847	\N	\N
13050	SPECIFIC_DAY	4	2	2009-12-30	1316	11847	\N	\N
13030	SPECIFIC_DAY	4	2	2009-12-21	1316	11847	\N	\N
13046	SPECIFIC_DAY	4	2	2009-12-28	1316	11847	\N	\N
13036	SPECIFIC_DAY	4	2	2009-12-18	1316	11847	\N	\N
13031	SPECIFIC_DAY	4	2	2010-01-07	1316	11847	\N	\N
13029	SPECIFIC_DAY	4	2	2010-01-06	1316	11847	\N	\N
13035	SPECIFIC_DAY	4	2	2009-12-25	1316	11847	\N	\N
13027	SPECIFIC_DAY	4	0	2009-12-20	1316	11847	\N	\N
13037	SPECIFIC_DAY	4	2	2009-12-17	1316	11847	\N	\N
13033	SPECIFIC_DAY	4	2	2009-12-15	1316	11847	\N	\N
13040	SPECIFIC_DAY	4	0	2009-12-26	1316	11847	\N	\N
13048	SPECIFIC_DAY	4	2	2009-12-23	1316	11847	\N	\N
12701	SPECIFIC_DAY	5	2	2010-01-05	1345	11837	\N	\N
25776	SPECIFIC_DAY	0	3	2010-01-06	1314	10641	\N	\N
25777	SPECIFIC_DAY	0	3	2010-01-25	1314	10641	\N	\N
25778	SPECIFIC_DAY	0	3	2010-01-11	1314	10641	\N	\N
25779	SPECIFIC_DAY	0	0	2010-01-09	1314	10641	\N	\N
25780	SPECIFIC_DAY	0	1	2010-01-27	1314	10641	\N	\N
25781	SPECIFIC_DAY	0	3	2010-01-08	1314	10641	\N	\N
25782	SPECIFIC_DAY	0	3	2010-01-07	1314	10641	\N	\N
25783	SPECIFIC_DAY	0	3	2010-01-12	1314	10641	\N	\N
25784	SPECIFIC_DAY	0	3	2010-01-01	1314	10641	\N	\N
25785	SPECIFIC_DAY	0	3	2010-01-18	1314	10641	\N	\N
25786	SPECIFIC_DAY	0	3	2010-01-15	1314	10641	\N	\N
25787	SPECIFIC_DAY	0	0	2010-01-24	1314	10641	\N	\N
25788	SPECIFIC_DAY	0	3	2010-01-04	1314	10641	\N	\N
25789	SPECIFIC_DAY	0	0	2010-01-10	1314	10641	\N	\N
25790	SPECIFIC_DAY	0	0	2010-01-02	1314	10641	\N	\N
25791	SPECIFIC_DAY	0	3	2010-01-22	1314	10641	\N	\N
25792	SPECIFIC_DAY	0	0	2010-01-03	1314	10641	\N	\N
25793	SPECIFIC_DAY	0	3	2010-01-19	1314	10641	\N	\N
25794	SPECIFIC_DAY	0	3	2010-01-05	1314	10641	\N	\N
25795	SPECIFIC_DAY	0	3	2009-12-29	1314	10641	\N	\N
25796	SPECIFIC_DAY	0	3	2010-01-21	1314	10641	\N	\N
25797	SPECIFIC_DAY	0	0	2010-01-23	1314	10641	\N	\N
25798	SPECIFIC_DAY	0	2	2009-12-28	1314	10642	\N	\N
25799	SPECIFIC_DAY	0	0	2009-12-27	1314	10642	\N	\N
25800	SPECIFIC_DAY	0	0	2009-12-26	1314	10642	\N	\N
25801	SPECIFIC_DAY	0	0	2009-12-20	1314	10642	\N	\N
25802	SPECIFIC_DAY	0	6	2009-12-21	1314	10642	\N	\N
25803	SPECIFIC_DAY	0	0	2009-12-19	1314	10642	\N	\N
25804	SPECIFIC_DAY	0	6	2009-12-23	1314	10642	\N	\N
25805	SPECIFIC_DAY	0	6	2009-12-24	1314	10642	\N	\N
25806	SPECIFIC_DAY	0	6	2009-12-25	1314	10642	\N	\N
25807	SPECIFIC_DAY	0	6	2009-12-22	1314	10642	\N	\N
36794	GENERIC_DAY	1	2	2010-03-29	1316	\N	29550	\N
36795	GENERIC_DAY	1	5	2010-03-31	1320	\N	29550	\N
36796	GENERIC_DAY	1	2	2010-02-03	1316	\N	29550	\N
36797	GENERIC_DAY	1	2	2010-04-30	1316	\N	29550	\N
36798	GENERIC_DAY	1	2	2010-03-25	1316	\N	29550	\N
36799	GENERIC_DAY	1	2	2010-03-17	1316	\N	29550	\N
36800	GENERIC_DAY	1	2	2010-05-03	1316	\N	29550	\N
36801	GENERIC_DAY	1	2	2010-04-28	1316	\N	29550	\N
36802	GENERIC_DAY	1	1	2010-05-14	1316	\N	29550	\N
36803	GENERIC_DAY	1	1	2010-05-13	1316	\N	29550	\N
36804	GENERIC_DAY	1	2	2010-02-18	1316	\N	29550	\N
36805	GENERIC_DAY	1	0	2010-02-17	1320	\N	29550	\N
36806	GENERIC_DAY	1	0	2010-03-28	1316	\N	29550	\N
36807	GENERIC_DAY	1	0	2010-02-27	1320	\N	29550	\N
36808	GENERIC_DAY	1	5	2010-02-09	1320	\N	29550	\N
36809	GENERIC_DAY	1	5	2010-03-01	1320	\N	29550	\N
36810	GENERIC_DAY	1	5	2010-05-11	1320	\N	29550	\N
36811	GENERIC_DAY	1	0	2010-03-28	1320	\N	29550	\N
36812	GENERIC_DAY	1	0	2010-02-13	1320	\N	29550	\N
36813	GENERIC_DAY	1	0	2010-05-29	1316	\N	29550	\N
36814	GENERIC_DAY	1	2	2010-03-03	1316	\N	29550	\N
36815	GENERIC_DAY	1	5	2010-05-20	1320	\N	29550	\N
36816	GENERIC_DAY	1	2	2010-03-09	1316	\N	29550	\N
36817	GENERIC_DAY	1	5	2010-03-04	1320	\N	29550	\N
36818	GENERIC_DAY	1	2	2010-02-10	1316	\N	29550	\N
36819	GENERIC_DAY	1	5	2010-05-26	1320	\N	29550	\N
36820	GENERIC_DAY	1	1	2010-05-19	1316	\N	29550	\N
36821	GENERIC_DAY	1	5	2010-04-06	1320	\N	29550	\N
36822	GENERIC_DAY	1	5	2010-04-15	1320	\N	29550	\N
36823	GENERIC_DAY	1	2	2010-04-21	1316	\N	29550	\N
36824	GENERIC_DAY	1	2	2010-04-26	1316	\N	29550	\N
36825	GENERIC_DAY	1	5	2010-04-13	1320	\N	29550	\N
36826	GENERIC_DAY	1	5	2010-05-04	1320	\N	29550	\N
36827	GENERIC_DAY	1	5	2010-04-19	1320	\N	29550	\N
36828	GENERIC_DAY	1	5	2010-05-13	1320	\N	29550	\N
36829	GENERIC_DAY	1	5	2010-03-22	1320	\N	29550	\N
36830	GENERIC_DAY	1	0	2010-04-02	1316	\N	29550	\N
36831	GENERIC_DAY	1	5	2010-05-03	1320	\N	29550	\N
36832	GENERIC_DAY	1	5	2010-05-27	1320	\N	29550	\N
36833	GENERIC_DAY	1	2	2010-03-24	1316	\N	29550	\N
36834	GENERIC_DAY	1	5	2010-03-25	1320	\N	29550	\N
36835	GENERIC_DAY	1	2	2010-02-15	1316	\N	29550	\N
36836	GENERIC_DAY	1	0	2010-04-24	1320	\N	29550	\N
36837	GENERIC_DAY	1	0	2010-04-18	1320	\N	29550	\N
36838	GENERIC_DAY	1	0	2010-05-01	1316	\N	29550	\N
36839	GENERIC_DAY	1	5	2010-03-10	1320	\N	29550	\N
36840	GENERIC_DAY	1	0	2010-02-17	1316	\N	29550	\N
36841	GENERIC_DAY	1	0	2010-05-30	1320	\N	29550	\N
36842	GENERIC_DAY	1	2	2010-03-18	1316	\N	29550	\N
36843	GENERIC_DAY	1	2	2010-04-06	1316	\N	29550	\N
36844	GENERIC_DAY	1	2	2010-05-04	1316	\N	29550	\N
36845	GENERIC_DAY	1	2	2010-02-09	1316	\N	29550	\N
36846	GENERIC_DAY	1	0	2010-05-15	1320	\N	29550	\N
36847	GENERIC_DAY	1	0	2010-04-03	1316	\N	29550	\N
36848	GENERIC_DAY	1	2	2010-04-20	1316	\N	29550	\N
36849	GENERIC_DAY	1	0	2010-03-21	1316	\N	29550	\N
36850	GENERIC_DAY	1	0	2010-04-01	1320	\N	29550	\N
36851	GENERIC_DAY	1	0	2010-05-23	1320	\N	29550	\N
36852	GENERIC_DAY	1	2	2010-02-01	1316	\N	29550	\N
36853	GENERIC_DAY	1	0	2010-05-23	1316	\N	29550	\N
36854	GENERIC_DAY	1	0	2010-02-20	1316	\N	29550	\N
36855	GENERIC_DAY	1	5	2010-04-30	1320	\N	29550	\N
36856	GENERIC_DAY	1	5	2010-03-03	1320	\N	29550	\N
36857	GENERIC_DAY	1	5	2010-05-10	1320	\N	29550	\N
36858	GENERIC_DAY	1	5	2010-03-18	1320	\N	29550	\N
36859	GENERIC_DAY	1	5	2010-04-12	1320	\N	29550	\N
36860	GENERIC_DAY	1	0	2010-03-27	1316	\N	29550	\N
36861	GENERIC_DAY	1	0	2010-04-05	1320	\N	29550	\N
36862	GENERIC_DAY	1	0	2010-05-02	1320	\N	29550	\N
36863	GENERIC_DAY	1	1	2010-05-24	1316	\N	29550	\N
36864	GENERIC_DAY	1	5	2010-05-05	1320	\N	29550	\N
36865	GENERIC_DAY	1	1	2010-05-07	1316	\N	29550	\N
36866	GENERIC_DAY	1	2	2010-04-27	1316	\N	29550	\N
36867	GENERIC_DAY	1	0	2010-05-15	1316	\N	29550	\N
36868	GENERIC_DAY	1	5	2010-03-11	1320	\N	29550	\N
36869	GENERIC_DAY	1	0	2010-02-27	1316	\N	29550	\N
36870	GENERIC_DAY	1	0	2010-04-01	1316	\N	29550	\N
36871	GENERIC_DAY	1	0	2010-02-07	1320	\N	29550	\N
36872	GENERIC_DAY	1	2	2010-03-02	1316	\N	29550	\N
36873	GENERIC_DAY	1	0	2010-04-24	1316	\N	29550	\N
36874	GENERIC_DAY	1	0	2010-03-19	1320	\N	29550	\N
36875	GENERIC_DAY	1	5	2010-03-24	1320	\N	29550	\N
36876	GENERIC_DAY	1	5	2010-04-07	1320	\N	29550	\N
36877	GENERIC_DAY	1	2	2010-04-19	1316	\N	29550	\N
36878	GENERIC_DAY	1	1	2010-05-31	1316	\N	29550	\N
36879	GENERIC_DAY	1	0	2010-03-06	1316	\N	29550	\N
36880	GENERIC_DAY	1	5	2010-02-08	1320	\N	29550	\N
36881	GENERIC_DAY	1	0	2010-05-16	1320	\N	29550	\N
36882	GENERIC_DAY	1	0	2010-04-05	1316	\N	29550	\N
36883	GENERIC_DAY	1	5	2010-04-29	1320	\N	29550	\N
36884	GENERIC_DAY	1	2	2010-03-01	1316	\N	29550	\N
36885	GENERIC_DAY	1	5	2010-02-16	1320	\N	29550	\N
36886	GENERIC_DAY	1	5	2010-05-25	1320	\N	29550	\N
36887	GENERIC_DAY	1	2	2010-02-26	1316	\N	29550	\N
36888	GENERIC_DAY	1	2	2010-02-25	1316	\N	29550	\N
36889	GENERIC_DAY	1	2	2010-04-07	1316	\N	29550	\N
36890	GENERIC_DAY	1	0	2010-02-21	1320	\N	29550	\N
36891	GENERIC_DAY	1	2	2010-02-08	1316	\N	29550	\N
36892	GENERIC_DAY	1	0	2010-04-03	1320	\N	29550	\N
36893	GENERIC_DAY	1	0	2010-03-20	1320	\N	29550	\N
36894	GENERIC_DAY	1	0	2010-05-01	1320	\N	29550	\N
36895	GENERIC_DAY	1	5	2010-02-18	1320	\N	29550	\N
36896	GENERIC_DAY	1	0	2010-04-17	1320	\N	29550	\N
36897	GENERIC_DAY	1	0	2010-02-28	1316	\N	29550	\N
36898	GENERIC_DAY	1	0	2010-02-13	1316	\N	29550	\N
36899	GENERIC_DAY	1	0	2010-03-19	1316	\N	29550	\N
36900	GENERIC_DAY	1	5	2010-03-16	1320	\N	29550	\N
36901	GENERIC_DAY	1	0	2010-04-04	1320	\N	29550	\N
36902	GENERIC_DAY	1	0	2010-05-17	1316	\N	29550	\N
36903	GENERIC_DAY	1	5	2010-03-29	1320	\N	29550	\N
36904	GENERIC_DAY	1	5	2010-02-05	1320	\N	29550	\N
36905	GENERIC_DAY	1	0	2010-02-14	1320	\N	29550	\N
36906	GENERIC_DAY	1	5	2010-02-23	1320	\N	29550	\N
36907	GENERIC_DAY	1	0	2010-03-07	1320	\N	29550	\N
36908	GENERIC_DAY	1	5	2010-05-24	1320	\N	29550	\N
36909	GENERIC_DAY	1	0	2010-02-21	1316	\N	29550	\N
36910	GENERIC_DAY	1	0	2010-04-18	1316	\N	29550	\N
36911	GENERIC_DAY	1	5	2010-04-22	1320	\N	29550	\N
36912	GENERIC_DAY	1	1	2010-05-06	1316	\N	29550	\N
36913	GENERIC_DAY	1	0	2010-02-28	1320	\N	29550	\N
36914	GENERIC_DAY	1	2	2010-02-11	1316	\N	29550	\N
36915	GENERIC_DAY	1	5	2010-02-12	1320	\N	29550	\N
36916	GENERIC_DAY	1	5	2010-03-17	1320	\N	29550	\N
36917	GENERIC_DAY	1	0	2010-03-07	1316	\N	29550	\N
36918	GENERIC_DAY	1	2	2010-04-15	1316	\N	29550	\N
36919	GENERIC_DAY	1	5	2010-05-19	1320	\N	29550	\N
36920	GENERIC_DAY	1	2	2010-03-23	1316	\N	29550	\N
36921	GENERIC_DAY	1	5	2010-03-26	1320	\N	29550	\N
36922	GENERIC_DAY	1	0	2010-05-09	1316	\N	29550	\N
36923	GENERIC_DAY	1	2	2010-03-16	1316	\N	29550	\N
36924	GENERIC_DAY	1	0	2010-02-06	1320	\N	29550	\N
36925	GENERIC_DAY	1	1	2010-05-10	1316	\N	29550	\N
36926	GENERIC_DAY	1	0	2010-04-11	1320	\N	29550	\N
36927	GENERIC_DAY	1	2	2010-04-23	1316	\N	29550	\N
36928	GENERIC_DAY	1	5	2010-05-07	1320	\N	29550	\N
36929	GENERIC_DAY	1	0	2010-05-29	1320	\N	29550	\N
36930	GENERIC_DAY	1	2	2010-04-09	1316	\N	29550	\N
36931	GENERIC_DAY	1	0	2010-05-22	1320	\N	29550	\N
36932	GENERIC_DAY	1	2	2010-03-12	1316	\N	29550	\N
36933	GENERIC_DAY	1	2	2010-04-16	1316	\N	29550	\N
36934	GENERIC_DAY	1	0	2010-04-17	1316	\N	29550	\N
36935	GENERIC_DAY	1	1	2010-05-28	1316	\N	29550	\N
36936	GENERIC_DAY	1	0	2010-03-20	1316	\N	29550	\N
36937	GENERIC_DAY	1	5	2010-03-08	1320	\N	29550	\N
36938	GENERIC_DAY	1	2	2010-04-29	1316	\N	29550	\N
36939	GENERIC_DAY	1	2	2010-03-26	1316	\N	29550	\N
36940	GENERIC_DAY	1	3	2010-06-03	1320	\N	29550	\N
36941	GENERIC_DAY	1	5	2010-04-28	1320	\N	29550	\N
36942	GENERIC_DAY	1	5	2010-03-30	1320	\N	29550	\N
36943	GENERIC_DAY	1	5	2010-05-28	1320	\N	29550	\N
36944	GENERIC_DAY	1	5	2010-04-20	1320	\N	29550	\N
36945	GENERIC_DAY	1	2	2010-03-30	1316	\N	29550	\N
36946	GENERIC_DAY	1	5	2010-05-06	1320	\N	29550	\N
36947	GENERIC_DAY	1	1	2010-05-25	1316	\N	29550	\N
36948	GENERIC_DAY	1	5	2010-05-21	1320	\N	29550	\N
36949	GENERIC_DAY	1	3	2010-06-03	1316	\N	29550	\N
36950	GENERIC_DAY	1	1	2010-05-26	1316	\N	29550	\N
36951	GENERIC_DAY	1	0	2010-05-17	1320	\N	29550	\N
36952	GENERIC_DAY	1	5	2010-03-23	1320	\N	29550	\N
36953	GENERIC_DAY	1	2	2010-04-14	1316	\N	29550	\N
36954	GENERIC_DAY	1	2	2010-04-13	1316	\N	29550	\N
36955	GENERIC_DAY	1	3	2010-06-02	1316	\N	29550	\N
36956	GENERIC_DAY	1	0	2010-05-09	1320	\N	29550	\N
36957	GENERIC_DAY	1	2	2010-02-16	1316	\N	29550	\N
36958	GENERIC_DAY	1	0	2010-02-14	1316	\N	29550	\N
36959	GENERIC_DAY	1	2	2010-02-24	1316	\N	29550	\N
36960	GENERIC_DAY	1	5	2010-02-10	1320	\N	29550	\N
36961	GENERIC_DAY	1	0	2010-02-06	1316	\N	29550	\N
36962	GENERIC_DAY	1	0	2010-05-30	1316	\N	29550	\N
36963	GENERIC_DAY	1	5	2010-03-05	1320	\N	29550	\N
36964	GENERIC_DAY	1	0	2010-02-20	1320	\N	29550	\N
36965	GENERIC_DAY	1	5	2010-05-12	1320	\N	29550	\N
36966	GENERIC_DAY	1	1	2010-05-12	1316	\N	29550	\N
36967	GENERIC_DAY	1	5	2010-04-21	1320	\N	29550	\N
36968	GENERIC_DAY	1	0	2010-04-10	1316	\N	29550	\N
36969	GENERIC_DAY	1	5	2010-05-14	1320	\N	29550	\N
36970	GENERIC_DAY	1	5	2010-02-04	1320	\N	29550	\N
36971	GENERIC_DAY	1	2	2010-03-31	1316	\N	29550	\N
36972	GENERIC_DAY	1	0	2010-05-08	1316	\N	29550	\N
36973	GENERIC_DAY	1	0	2010-03-06	1320	\N	29550	\N
36974	GENERIC_DAY	1	0	2010-05-16	1316	\N	29550	\N
36975	GENERIC_DAY	1	0	2010-03-14	1316	\N	29550	\N
36976	GENERIC_DAY	1	2	2010-02-02	1316	\N	29550	\N
36977	GENERIC_DAY	1	5	2010-02-01	1320	\N	29550	\N
36978	GENERIC_DAY	1	2	2010-04-22	1316	\N	29550	\N
36979	GENERIC_DAY	1	0	2010-03-13	1316	\N	29550	\N
36980	GENERIC_DAY	1	5	2010-02-15	1320	\N	29550	\N
36981	GENERIC_DAY	1	5	2010-02-11	1320	\N	29550	\N
36982	GENERIC_DAY	1	3	2010-06-01	1316	\N	29550	\N
36983	GENERIC_DAY	1	5	2010-03-09	1320	\N	29550	\N
36984	GENERIC_DAY	1	1	2010-05-20	1316	\N	29550	\N
36985	GENERIC_DAY	1	2	2010-03-05	1316	\N	29550	\N
36986	GENERIC_DAY	1	2	2010-03-04	1316	\N	29550	\N
36987	GENERIC_DAY	1	5	2010-02-24	1320	\N	29550	\N
36988	GENERIC_DAY	1	0	2010-03-13	1320	\N	29550	\N
36989	GENERIC_DAY	1	5	2010-04-27	1320	\N	29550	\N
36990	GENERIC_DAY	1	5	2010-02-19	1320	\N	29550	\N
36991	GENERIC_DAY	1	2	2010-02-22	1316	\N	29550	\N
36992	GENERIC_DAY	1	0	2010-03-21	1320	\N	29550	\N
36993	GENERIC_DAY	1	0	2010-03-27	1320	\N	29550	\N
36994	GENERIC_DAY	1	0	2010-04-04	1316	\N	29550	\N
36995	GENERIC_DAY	1	1	2010-05-11	1316	\N	29550	\N
36996	GENERIC_DAY	1	5	2010-02-26	1320	\N	29550	\N
36997	GENERIC_DAY	1	2	2010-03-22	1316	\N	29550	\N
36998	GENERIC_DAY	1	2	2010-02-04	1316	\N	29550	\N
36999	GENERIC_DAY	1	0	2010-02-07	1316	\N	29550	\N
37000	GENERIC_DAY	1	0	2010-04-25	1316	\N	29550	\N
37001	GENERIC_DAY	1	1	2010-05-27	1316	\N	29550	\N
37002	GENERIC_DAY	1	0	2010-05-08	1320	\N	29550	\N
37003	GENERIC_DAY	1	2	2010-02-05	1316	\N	29550	\N
37004	GENERIC_DAY	1	2	2010-03-15	1316	\N	29550	\N
37005	GENERIC_DAY	1	1	2010-05-21	1316	\N	29550	\N
37006	GENERIC_DAY	1	5	2010-04-26	1320	\N	29550	\N
37007	GENERIC_DAY	1	5	2010-02-22	1320	\N	29550	\N
37008	GENERIC_DAY	1	5	2010-04-14	1320	\N	29550	\N
37009	GENERIC_DAY	1	5	2010-02-25	1320	\N	29550	\N
37010	GENERIC_DAY	1	0	2010-05-22	1316	\N	29550	\N
37011	GENERIC_DAY	1	2	2010-03-11	1316	\N	29550	\N
37012	GENERIC_DAY	1	0	2010-04-10	1320	\N	29550	\N
37013	GENERIC_DAY	1	5	2010-04-09	1320	\N	29550	\N
37014	GENERIC_DAY	1	5	2010-04-08	1320	\N	29550	\N
37015	GENERIC_DAY	1	0	2010-02-21	1314	\N	29551	\N
37016	GENERIC_DAY	1	2	2010-02-10	1341	\N	29551	\N
37017	GENERIC_DAY	1	0	2010-02-07	1341	\N	29551	\N
37018	GENERIC_DAY	1	0	2010-02-06	1314	\N	29551	\N
37019	GENERIC_DAY	1	1	2010-02-05	1328	\N	29551	\N
37020	GENERIC_DAY	1	0	2010-02-01	1341	\N	29551	\N
37021	GENERIC_DAY	1	1	2010-02-11	1322	\N	29551	\N
37022	GENERIC_DAY	1	2	2010-02-01	1322	\N	29551	\N
37023	GENERIC_DAY	1	0	2010-02-17	1322	\N	29551	\N
37024	GENERIC_DAY	1	1	2010-02-26	1326	\N	29551	\N
37025	GENERIC_DAY	1	1	2010-02-09	1328	\N	29551	\N
37026	GENERIC_DAY	1	0	2010-02-14	1330	\N	29551	\N
37027	GENERIC_DAY	1	2	2010-02-18	1314	\N	29551	\N
37028	GENERIC_DAY	1	0	2010-02-14	1314	\N	29551	\N
37029	GENERIC_DAY	1	1	2010-02-19	1326	\N	29551	\N
37030	GENERIC_DAY	1	0	2010-02-17	1330	\N	29551	\N
37031	GENERIC_DAY	1	1	2010-02-04	1326	\N	29551	\N
37032	GENERIC_DAY	1	1	2010-02-24	1330	\N	29551	\N
37033	GENERIC_DAY	1	1	2010-02-25	1326	\N	29551	\N
37034	GENERIC_DAY	1	2	2010-02-16	1314	\N	29551	\N
37035	GENERIC_DAY	1	1	2010-02-26	1330	\N	29551	\N
37036	GENERIC_DAY	1	1	2010-02-26	1314	\N	29551	\N
37037	GENERIC_DAY	1	2	2010-02-12	1314	\N	29551	\N
37038	GENERIC_DAY	1	1	2010-02-15	1328	\N	29551	\N
37039	GENERIC_DAY	1	1	2010-02-11	1326	\N	29551	\N
37040	GENERIC_DAY	1	1	2010-02-22	1322	\N	29551	\N
37041	GENERIC_DAY	1	1	2010-02-24	1328	\N	29551	\N
37042	GENERIC_DAY	1	1	2010-02-16	1330	\N	29551	\N
37043	GENERIC_DAY	1	0	2010-02-20	1328	\N	29551	\N
37044	GENERIC_DAY	1	0	2010-02-06	1328	\N	29551	\N
37045	GENERIC_DAY	1	0	2010-02-06	1326	\N	29551	\N
37046	GENERIC_DAY	1	1	2010-02-15	1326	\N	29551	\N
37047	GENERIC_DAY	1	1	2010-02-03	1314	\N	29551	\N
37048	GENERIC_DAY	1	1	2010-02-10	1328	\N	29551	\N
37049	GENERIC_DAY	1	2	2010-02-22	1314	\N	29551	\N
37050	GENERIC_DAY	1	0	2010-02-07	1322	\N	29551	\N
37051	GENERIC_DAY	1	1	2010-02-12	1322	\N	29551	\N
37052	GENERIC_DAY	1	1	2010-02-19	1330	\N	29551	\N
37053	GENERIC_DAY	1	1	2010-02-23	1330	\N	29551	\N
37054	GENERIC_DAY	1	0	2010-02-06	1322	\N	29551	\N
37055	GENERIC_DAY	1	2	2010-02-11	1341	\N	29551	\N
37056	GENERIC_DAY	1	1	2010-02-18	1330	\N	29551	\N
37057	GENERIC_DAY	1	1	2010-02-18	1328	\N	29551	\N
37058	GENERIC_DAY	1	0	2010-02-13	1330	\N	29551	\N
37059	GENERIC_DAY	1	0	2010-02-14	1326	\N	29551	\N
37060	GENERIC_DAY	1	1	2010-02-16	1328	\N	29551	\N
37061	GENERIC_DAY	1	2	2010-02-03	1322	\N	29551	\N
37062	GENERIC_DAY	1	1	2010-02-26	1322	\N	29551	\N
37063	GENERIC_DAY	1	0	2010-02-14	1322	\N	29551	\N
37064	GENERIC_DAY	1	1	2010-02-25	1328	\N	29551	\N
37065	GENERIC_DAY	1	1	2010-02-09	1326	\N	29551	\N
37066	GENERIC_DAY	1	1	2010-02-09	1322	\N	29551	\N
37067	GENERIC_DAY	1	1	2010-02-04	1330	\N	29551	\N
37068	GENERIC_DAY	1	2	2010-02-04	1314	\N	29551	\N
37069	GENERIC_DAY	1	0	2010-02-17	1341	\N	29551	\N
37070	GENERIC_DAY	1	1	2010-02-04	1328	\N	29551	\N
37071	GENERIC_DAY	1	0	2010-02-21	1322	\N	29551	\N
37072	GENERIC_DAY	1	2	2010-02-25	1341	\N	29551	\N
37073	GENERIC_DAY	1	1	2010-02-04	1322	\N	29551	\N
37074	GENERIC_DAY	1	1	2010-02-09	1330	\N	29551	\N
37075	GENERIC_DAY	1	0	2010-02-17	1326	\N	29551	\N
37076	GENERIC_DAY	1	1	2010-02-12	1326	\N	29551	\N
37077	GENERIC_DAY	1	0	2010-02-20	1341	\N	29551	\N
37078	GENERIC_DAY	1	1	2010-02-16	1322	\N	29551	\N
37079	GENERIC_DAY	1	0	2010-02-17	1328	\N	29551	\N
37080	GENERIC_DAY	1	1	2010-02-02	1330	\N	29551	\N
37081	GENERIC_DAY	1	1	2010-02-12	1328	\N	29551	\N
37082	GENERIC_DAY	1	1	2010-02-11	1328	\N	29551	\N
37083	GENERIC_DAY	1	1	2010-02-23	1328	\N	29551	\N
37084	GENERIC_DAY	1	1	2010-02-01	1314	\N	29551	\N
37085	GENERIC_DAY	1	1	2010-02-19	1328	\N	29551	\N
37086	GENERIC_DAY	1	2	2010-02-15	1341	\N	29551	\N
37087	GENERIC_DAY	1	0	2010-02-06	1330	\N	29551	\N
37088	GENERIC_DAY	1	1	2010-02-10	1330	\N	29551	\N
37089	GENERIC_DAY	1	0	2010-02-21	1330	\N	29551	\N
37090	GENERIC_DAY	1	1	2010-02-18	1326	\N	29551	\N
37091	GENERIC_DAY	1	2	2010-02-02	1328	\N	29551	\N
37092	GENERIC_DAY	1	1	2010-02-15	1330	\N	29551	\N
37093	GENERIC_DAY	1	1	2010-02-10	1322	\N	29551	\N
37094	GENERIC_DAY	1	1	2010-02-08	1328	\N	29551	\N
37095	GENERIC_DAY	1	2	2010-02-02	1326	\N	29551	\N
13592	SPECIFIC_DAY	2	2	2009-12-15	1316	11900	\N	\N
13569	SPECIFIC_DAY	2	2	2009-12-29	1316	11900	\N	\N
13594	SPECIFIC_DAY	2	2	2010-01-01	1316	11900	\N	\N
13559	SPECIFIC_DAY	2	2	2010-01-05	1316	11900	\N	\N
13567	SPECIFIC_DAY	2	2	2009-12-31	1316	11900	\N	\N
13570	SPECIFIC_DAY	2	0	2010-01-02	1316	11900	\N	\N
13562	SPECIFIC_DAY	2	2	2010-01-18	1316	11900	\N	\N
13557	SPECIFIC_DAY	2	2	2009-12-21	1316	11900	\N	\N
13566	SPECIFIC_DAY	2	2	2010-01-26	1316	11900	\N	\N
13583	SPECIFIC_DAY	2	2	2010-01-22	1316	11900	\N	\N
13585	SPECIFIC_DAY	2	0	2010-01-17	1316	11900	\N	\N
13571	SPECIFIC_DAY	2	0	2009-12-19	1316	11900	\N	\N
13554	SPECIFIC_DAY	2	2	2010-01-11	1316	11900	\N	\N
13576	SPECIFIC_DAY	2	2	2010-01-19	1316	11900	\N	\N
13565	SPECIFIC_DAY	2	2	2009-12-30	1316	11900	\N	\N
13558	SPECIFIC_DAY	2	2	2009-12-23	1316	11900	\N	\N
13582	SPECIFIC_DAY	2	0	2010-01-10	1316	11900	\N	\N
13577	SPECIFIC_DAY	2	2	2010-01-13	1316	11900	\N	\N
13591	SPECIFIC_DAY	2	0	2010-01-23	1316	11900	\N	\N
13524	SPECIFIC_DAY	2	0	2010-01-02	1320	11899	\N	\N
13548	SPECIFIC_DAY	2	4	2009-12-28	1320	11899	\N	\N
13529	SPECIFIC_DAY	2	4	2009-12-29	1320	11899	\N	\N
13534	SPECIFIC_DAY	2	4	2010-01-25	1320	11899	\N	\N
13538	SPECIFIC_DAY	2	4	2010-01-12	1320	11899	\N	\N
13539	SPECIFIC_DAY	2	4	2010-01-18	1320	11899	\N	\N
13528	SPECIFIC_DAY	2	4	2010-01-21	1320	11899	\N	\N
13541	SPECIFIC_DAY	2	4	2010-01-01	1320	11899	\N	\N
13551	SPECIFIC_DAY	2	0	2010-01-24	1320	11899	\N	\N
13540	SPECIFIC_DAY	2	4	2009-12-16	1320	11899	\N	\N
13543	SPECIFIC_DAY	2	4	2010-01-06	1320	11899	\N	\N
13516	SPECIFIC_DAY	2	0	2009-12-27	1320	11899	\N	\N
13531	SPECIFIC_DAY	2	4	2009-12-23	1320	11899	\N	\N
13536	SPECIFIC_DAY	2	4	2010-01-14	1320	11899	\N	\N
13537	SPECIFIC_DAY	2	4	2010-01-07	1320	11899	\N	\N
13549	SPECIFIC_DAY	2	4	2010-01-20	1320	11899	\N	\N
13527	SPECIFIC_DAY	2	4	2010-01-11	1320	11899	\N	\N
13550	SPECIFIC_DAY	2	4	2009-12-15	1320	11899	\N	\N
13530	SPECIFIC_DAY	2	4	2009-12-30	1320	11899	\N	\N
13546	SPECIFIC_DAY	2	0	2009-12-20	1320	11899	\N	\N
13526	SPECIFIC_DAY	2	4	2010-01-19	1320	11899	\N	\N
13519	SPECIFIC_DAY	2	0	2010-01-03	1320	11899	\N	\N
13545	SPECIFIC_DAY	2	4	2009-12-14	1320	11899	\N	\N
13521	SPECIFIC_DAY	2	4	2010-01-05	1320	11899	\N	\N
13515	SPECIFIC_DAY	2	4	2009-12-18	1320	11899	\N	\N
13523	SPECIFIC_DAY	2	4	2010-01-13	1320	11899	\N	\N
13535	SPECIFIC_DAY	2	4	2009-12-31	1320	11899	\N	\N
13466	SPECIFIC_DAY	2	0	2009-12-19	1345	11898	\N	\N
13472	SPECIFIC_DAY	2	2	2010-01-20	1345	11898	\N	\N
13483	SPECIFIC_DAY	2	2	2010-01-25	1345	11898	\N	\N
13473	SPECIFIC_DAY	2	0	2009-12-20	1345	11898	\N	\N
13493	SPECIFIC_DAY	2	0	2010-01-17	1345	11898	\N	\N
13498	SPECIFIC_DAY	2	2	2009-12-15	1345	11898	\N	\N
13477	SPECIFIC_DAY	2	2	2010-01-06	1345	11898	\N	\N
13500	SPECIFIC_DAY	2	2	2009-12-31	1345	11898	\N	\N
13485	SPECIFIC_DAY	2	0	2010-01-03	1345	11898	\N	\N
13489	SPECIFIC_DAY	2	2	2009-12-25	1345	11898	\N	\N
13471	SPECIFIC_DAY	2	2	2009-12-17	1345	11898	\N	\N
13467	SPECIFIC_DAY	2	2	2010-01-08	1345	11898	\N	\N
13495	SPECIFIC_DAY	2	2	2010-01-19	1345	11898	\N	\N
13499	SPECIFIC_DAY	2	0	2010-01-02	1345	11898	\N	\N
13487	SPECIFIC_DAY	2	2	2009-12-18	1345	11898	\N	\N
13506	SPECIFIC_DAY	2	2	2010-01-26	1345	11898	\N	\N
13470	SPECIFIC_DAY	2	0	2010-01-24	1345	11898	\N	\N
13507	SPECIFIC_DAY	2	2	2010-01-14	1345	11898	\N	\N
13494	SPECIFIC_DAY	2	0	2010-01-23	1345	11898	\N	\N
13478	SPECIFIC_DAY	2	2	2009-12-23	1345	11898	\N	\N
13491	SPECIFIC_DAY	2	2	2010-01-15	1345	11898	\N	\N
13488	SPECIFIC_DAY	2	2	2009-12-14	1345	11898	\N	\N
13476	SPECIFIC_DAY	2	0	2010-01-09	1345	11898	\N	\N
13479	SPECIFIC_DAY	2	2	2009-12-16	1345	11898	\N	\N
13480	SPECIFIC_DAY	2	2	2010-01-05	1345	11898	\N	\N
13481	SPECIFIC_DAY	2	2	2009-12-24	1345	11898	\N	\N
13504	SPECIFIC_DAY	2	2	2010-01-22	1345	11898	\N	\N
13475	SPECIFIC_DAY	2	2	2010-01-07	1345	11898	\N	\N
13468	SPECIFIC_DAY	2	2	2010-01-18	1345	11898	\N	\N
13474	SPECIFIC_DAY	2	2	2009-12-28	1345	11898	\N	\N
13486	SPECIFIC_DAY	2	2	2009-12-21	1345	11898	\N	\N
13497	SPECIFIC_DAY	2	0	2009-12-26	1345	11898	\N	\N
13684	SPECIFIC_DAY	2	8	2009-12-15	1326	11903	\N	\N
13685	SPECIFIC_DAY	2	8	2009-12-14	1326	11903	\N	\N
13632	SPECIFIC_DAY	2	4	2010-01-22	1316	11901	\N	\N
13637	SPECIFIC_DAY	2	4	2009-12-30	1316	11901	\N	\N
13613	SPECIFIC_DAY	2	4	2009-12-22	1316	11901	\N	\N
13600	SPECIFIC_DAY	2	4	2009-12-25	1316	11901	\N	\N
13626	SPECIFIC_DAY	2	4	2010-01-01	1316	11901	\N	\N
13597	SPECIFIC_DAY	2	0	2010-01-03	1316	11901	\N	\N
13625	SPECIFIC_DAY	2	4	2010-01-14	1316	11901	\N	\N
13617	SPECIFIC_DAY	2	4	2009-12-14	1316	11901	\N	\N
13627	SPECIFIC_DAY	2	4	2010-01-19	1316	11901	\N	\N
13612	SPECIFIC_DAY	2	4	2009-12-31	1316	11901	\N	\N
13607	SPECIFIC_DAY	2	4	2010-01-11	1316	11901	\N	\N
13611	SPECIFIC_DAY	2	4	2010-01-04	1316	11901	\N	\N
13606	SPECIFIC_DAY	2	0	2009-12-19	1316	11901	\N	\N
13623	SPECIFIC_DAY	2	4	2010-01-12	1316	11901	\N	\N
13635	SPECIFIC_DAY	2	4	2010-01-05	1316	11901	\N	\N
13624	SPECIFIC_DAY	2	4	2010-01-21	1316	11901	\N	\N
13610	SPECIFIC_DAY	2	4	2010-01-06	1316	11901	\N	\N
13609	SPECIFIC_DAY	2	4	2010-01-18	1316	11901	\N	\N
13616	SPECIFIC_DAY	2	4	2009-12-18	1316	11901	\N	\N
13630	SPECIFIC_DAY	2	4	2010-01-25	1316	11901	\N	\N
13622	SPECIFIC_DAY	2	0	2009-12-27	1316	11901	\N	\N
13608	SPECIFIC_DAY	2	0	2010-01-10	1316	11901	\N	\N
13603	SPECIFIC_DAY	2	0	2009-12-20	1316	11901	\N	\N
13601	SPECIFIC_DAY	2	0	2010-01-24	1316	11901	\N	\N
13638	SPECIFIC_DAY	2	0	2010-01-02	1316	11901	\N	\N
13604	SPECIFIC_DAY	2	4	2009-12-28	1316	11901	\N	\N
13615	SPECIFIC_DAY	2	4	2009-12-29	1316	11901	\N	\N
13628	SPECIFIC_DAY	2	4	2009-12-21	1316	11901	\N	\N
13602	SPECIFIC_DAY	2	4	2010-01-15	1316	11901	\N	\N
13596	SPECIFIC_DAY	2	0	2009-12-26	1316	11901	\N	\N
13639	SPECIFIC_DAY	2	0	2010-01-16	1316	11901	\N	\N
13633	SPECIFIC_DAY	2	0	2010-01-23	1316	11901	\N	\N
13598	SPECIFIC_DAY	2	4	2009-12-24	1316	11901	\N	\N
13621	SPECIFIC_DAY	2	4	2009-12-16	1316	11901	\N	\N
13614	SPECIFIC_DAY	2	4	2010-01-07	1316	11901	\N	\N
13678	SPECIFIC_DAY	2	0	2010-01-03	1345	11902	\N	\N
13640	SPECIFIC_DAY	2	4	2010-01-22	1345	11902	\N	\N
13669	SPECIFIC_DAY	2	0	2010-01-24	1345	11902	\N	\N
13649	SPECIFIC_DAY	2	4	2010-01-12	1345	11902	\N	\N
13680	SPECIFIC_DAY	2	4	2010-01-21	1345	11902	\N	\N
13641	SPECIFIC_DAY	2	4	2009-12-18	1345	11902	\N	\N
13666	SPECIFIC_DAY	2	4	2009-12-14	1345	11902	\N	\N
13675	SPECIFIC_DAY	2	0	2010-01-17	1345	11902	\N	\N
13668	SPECIFIC_DAY	2	4	2009-12-17	1345	11902	\N	\N
13671	SPECIFIC_DAY	2	4	2009-12-31	1345	11902	\N	\N
13670	SPECIFIC_DAY	2	4	2010-01-19	1345	11902	\N	\N
13645	SPECIFIC_DAY	2	4	2010-01-06	1345	11902	\N	\N
13652	SPECIFIC_DAY	2	0	2010-01-16	1345	11902	\N	\N
13683	SPECIFIC_DAY	2	4	2009-12-23	1345	11902	\N	\N
13653	SPECIFIC_DAY	2	4	2009-12-15	1345	11902	\N	\N
13658	SPECIFIC_DAY	2	4	2010-01-07	1345	11902	\N	\N
13647	SPECIFIC_DAY	2	0	2009-12-20	1345	11902	\N	\N
13679	SPECIFIC_DAY	2	0	2010-01-10	1345	11902	\N	\N
13677	SPECIFIC_DAY	2	4	2009-12-22	1345	11902	\N	\N
13682	SPECIFIC_DAY	2	0	2009-12-26	1345	11902	\N	\N
13676	SPECIFIC_DAY	2	4	2009-12-25	1345	11902	\N	\N
13656	SPECIFIC_DAY	2	4	2010-01-04	1345	11902	\N	\N
13673	SPECIFIC_DAY	2	0	2010-01-23	1345	11902	\N	\N
13681	SPECIFIC_DAY	2	0	2010-01-09	1345	11902	\N	\N
13654	SPECIFIC_DAY	2	4	2009-12-30	1345	11902	\N	\N
13667	SPECIFIC_DAY	2	0	2009-12-27	1345	11902	\N	\N
13664	SPECIFIC_DAY	2	4	2010-01-18	1345	11902	\N	\N
13660	SPECIFIC_DAY	2	4	2010-01-14	1345	11902	\N	\N
13672	SPECIFIC_DAY	2	4	2010-01-13	1345	11902	\N	\N
13643	SPECIFIC_DAY	2	4	2010-01-26	1345	11902	\N	\N
13644	SPECIFIC_DAY	2	4	2009-12-28	1345	11902	\N	\N
13642	SPECIFIC_DAY	2	4	2010-01-01	1345	11902	\N	\N
13655	SPECIFIC_DAY	2	4	2010-01-05	1345	11902	\N	\N
13651	SPECIFIC_DAY	2	0	2010-01-02	1345	11902	\N	\N
13662	SPECIFIC_DAY	2	4	2009-12-29	1345	11902	\N	\N
13659	SPECIFIC_DAY	2	4	2009-12-24	1345	11902	\N	\N
13650	SPECIFIC_DAY	2	4	2010-01-11	1345	11902	\N	\N
13646	SPECIFIC_DAY	2	4	2010-01-20	1345	11902	\N	\N
13665	SPECIFIC_DAY	2	4	2009-12-21	1345	11902	\N	\N
13648	SPECIFIC_DAY	2	4	2009-12-16	1345	11902	\N	\N
13657	SPECIFIC_DAY	2	4	2010-01-15	1345	11902	\N	\N
13661	SPECIFIC_DAY	2	0	2009-12-19	1345	11902	\N	\N
13674	SPECIFIC_DAY	2	4	2010-01-25	1345	11902	\N	\N
13663	SPECIFIC_DAY	2	4	2010-01-08	1345	11902	\N	\N
11610	SPECIFIC_DAY	9	0	2009-12-19	1328	10680	\N	\N
11611	SPECIFIC_DAY	9	0	2009-12-20	1328	10680	\N	\N
11607	SPECIFIC_DAY	9	8	2009-12-18	1328	10680	\N	\N
11612	SPECIFIC_DAY	9	8	2009-12-16	1328	10680	\N	\N
11609	SPECIFIC_DAY	9	8	2009-12-21	1328	10680	\N	\N
11613	SPECIFIC_DAY	9	8	2009-12-14	1328	10680	\N	\N
11614	SPECIFIC_DAY	9	8	2009-12-17	1328	10680	\N	\N
11608	SPECIFIC_DAY	9	8	2009-12-15	1328	10680	\N	\N
11341	SPECIFIC_DAY	12	8	2009-12-16	1341	10645	\N	\N
11343	SPECIFIC_DAY	12	8	2009-12-18	1341	10645	\N	\N
11340	SPECIFIC_DAY	12	8	2009-12-17	1341	10645	\N	\N
11342	SPECIFIC_DAY	12	8	2009-12-14	1341	10645	\N	\N
11339	SPECIFIC_DAY	12	8	2009-12-15	1341	10645	\N	\N
13026	SPECIFIC_DAY	4	2	2009-12-22	1316	11847	\N	\N
13032	SPECIFIC_DAY	4	2	2009-12-14	1316	11847	\N	\N
13043	SPECIFIC_DAY	4	2	2009-12-24	1316	11847	\N	\N
37096	GENERIC_DAY	1	0	2010-02-13	1328	\N	29551	\N
37097	GENERIC_DAY	1	2	2010-02-15	1314	\N	29551	\N
37098	GENERIC_DAY	1	1	2010-02-08	1322	\N	29551	\N
37099	GENERIC_DAY	1	2	2010-02-04	1341	\N	29551	\N
37100	GENERIC_DAY	1	0	2010-02-13	1322	\N	29551	\N
37101	GENERIC_DAY	1	1	2010-02-23	1341	\N	29551	\N
37102	GENERIC_DAY	1	2	2010-02-19	1341	\N	29551	\N
37103	GENERIC_DAY	1	1	2010-02-05	1326	\N	29551	\N
37104	GENERIC_DAY	1	1	2010-02-05	1341	\N	29551	\N
37105	GENERIC_DAY	1	1	2010-02-25	1330	\N	29551	\N
37106	GENERIC_DAY	1	0	2010-02-13	1326	\N	29551	\N
37107	GENERIC_DAY	1	2	2010-02-25	1314	\N	29551	\N
37108	GENERIC_DAY	1	1	2010-02-01	1330	\N	29551	\N
37109	GENERIC_DAY	1	2	2010-02-11	1314	\N	29551	\N
37110	GENERIC_DAY	1	0	2010-02-21	1328	\N	29551	\N
37111	GENERIC_DAY	1	2	2010-02-01	1328	\N	29551	\N
37112	GENERIC_DAY	1	1	2010-02-23	1326	\N	29551	\N
37113	GENERIC_DAY	1	2	2010-02-23	1322	\N	29551	\N
13025	SPECIFIC_DAY	4	2	2010-01-05	1316	11847	\N	\N
13028	SPECIFIC_DAY	4	0	2009-12-19	1316	11847	\N	\N
13049	SPECIFIC_DAY	4	0	2010-01-03	1316	11847	\N	\N
13044	SPECIFIC_DAY	4	2	2010-01-04	1316	11847	\N	\N
13038	SPECIFIC_DAY	4	2	2009-12-29	1316	11847	\N	\N
12971	SPECIFIC_DAY	4	2	2009-12-25	1320	11845	\N	\N
12977	SPECIFIC_DAY	4	2	2010-01-01	1320	11845	\N	\N
12963	SPECIFIC_DAY	4	2	2009-12-22	1320	11845	\N	\N
12975	SPECIFIC_DAY	4	2	2009-12-29	1320	11845	\N	\N
12974	SPECIFIC_DAY	4	0	2009-12-27	1320	11845	\N	\N
12979	SPECIFIC_DAY	4	2	2010-01-05	1320	11845	\N	\N
12968	SPECIFIC_DAY	4	2	2009-12-14	1320	11845	\N	\N
12972	SPECIFIC_DAY	4	0	2009-12-20	1320	11845	\N	\N
12970	SPECIFIC_DAY	4	2	2009-12-18	1320	11845	\N	\N
12967	SPECIFIC_DAY	4	2	2010-01-07	1320	11845	\N	\N
12962	SPECIFIC_DAY	4	2	2010-01-08	1320	11845	\N	\N
12978	SPECIFIC_DAY	4	2	2010-01-04	1320	11845	\N	\N
12965	SPECIFIC_DAY	4	2	2009-12-15	1320	11845	\N	\N
12976	SPECIFIC_DAY	4	2	2009-12-21	1320	11845	\N	\N
12964	SPECIFIC_DAY	4	0	2009-12-19	1320	11845	\N	\N
12969	SPECIFIC_DAY	4	0	2010-01-02	1320	11845	\N	\N
12973	SPECIFIC_DAY	4	2	2010-01-06	1320	11845	\N	\N
12966	SPECIFIC_DAY	4	0	2009-12-26	1320	11845	\N	\N
12995	SPECIFIC_DAY	4	1	2010-01-26	1345	11846	\N	\N
12997	SPECIFIC_DAY	4	1	2009-12-17	1345	11846	\N	\N
13002	SPECIFIC_DAY	4	1	2009-12-23	1345	11846	\N	\N
13011	SPECIFIC_DAY	4	1	2010-01-15	1345	11846	\N	\N
13024	SPECIFIC_DAY	4	1	2009-12-22	1345	11846	\N	\N
12992	SPECIFIC_DAY	4	0	2010-01-17	1345	11846	\N	\N
13009	SPECIFIC_DAY	4	1	2010-01-22	1345	11846	\N	\N
13010	SPECIFIC_DAY	4	0	2010-01-10	1345	11846	\N	\N
13007	SPECIFIC_DAY	4	1	2009-12-16	1345	11846	\N	\N
12985	SPECIFIC_DAY	4	1	2010-01-21	1345	11846	\N	\N
13023	SPECIFIC_DAY	4	1	2009-12-31	1345	11846	\N	\N
13020	SPECIFIC_DAY	4	1	2009-12-18	1345	11846	\N	\N
12988	SPECIFIC_DAY	4	0	2009-12-26	1345	11846	\N	\N
13001	SPECIFIC_DAY	4	0	2010-01-24	1345	11846	\N	\N
12710	SPECIFIC_DAY	5	0	2010-01-10	1345	11837	\N	\N
12690	SPECIFIC_DAY	5	2	2010-01-18	1345	11837	\N	\N
12724	SPECIFIC_DAY	5	2	2010-01-13	1345	11837	\N	\N
12717	SPECIFIC_DAY	5	0	2010-01-16	1345	11837	\N	\N
12718	SPECIFIC_DAY	5	0	2009-12-27	1345	11837	\N	\N
12721	SPECIFIC_DAY	5	2	2010-01-11	1345	11837	\N	\N
12687	SPECIFIC_DAY	5	2	2010-01-19	1345	11837	\N	\N
12696	SPECIFIC_DAY	5	2	2009-12-14	1345	11837	\N	\N
12706	SPECIFIC_DAY	5	2	2009-12-25	1345	11837	\N	\N
12699	SPECIFIC_DAY	5	2	2009-12-16	1345	11837	\N	\N
12694	SPECIFIC_DAY	5	2	2010-01-01	1345	11837	\N	\N
12686	SPECIFIC_DAY	5	2	2009-12-15	1345	11837	\N	\N
12703	SPECIFIC_DAY	5	0	2010-01-09	1345	11837	\N	\N
37114	GENERIC_DAY	1	0	2010-02-03	1341	\N	29551	\N
37115	GENERIC_DAY	1	2	2010-02-08	1314	\N	29551	\N
37116	GENERIC_DAY	1	1	2010-02-03	1330	\N	29551	\N
37117	GENERIC_DAY	1	2	2010-02-09	1341	\N	29551	\N
37118	GENERIC_DAY	1	0	2010-02-07	1328	\N	29551	\N
37119	GENERIC_DAY	1	1	2010-02-24	1326	\N	29551	\N
37120	GENERIC_DAY	1	1	2010-02-24	1322	\N	29551	\N
37121	GENERIC_DAY	1	2	2010-02-22	1341	\N	29551	\N
37122	GENERIC_DAY	1	1	2010-02-18	1322	\N	29551	\N
37123	GENERIC_DAY	1	2	2010-02-08	1341	\N	29551	\N
37124	GENERIC_DAY	1	1	2010-02-02	1314	\N	29551	\N
37125	GENERIC_DAY	1	2	2010-02-23	1314	\N	29551	\N
37126	GENERIC_DAY	1	2	2010-02-02	1322	\N	29551	\N
37127	GENERIC_DAY	1	0	2010-02-13	1341	\N	29551	\N
37128	GENERIC_DAY	1	1	2010-02-25	1322	\N	29551	\N
37129	GENERIC_DAY	1	0	2010-02-02	1341	\N	29551	\N
37130	GENERIC_DAY	1	1	2010-02-11	1330	\N	29551	\N
37131	GENERIC_DAY	1	0	2010-02-20	1330	\N	29551	\N
37132	GENERIC_DAY	1	0	2010-02-07	1330	\N	29551	\N
37133	GENERIC_DAY	1	1	2010-02-16	1326	\N	29551	\N
37134	GENERIC_DAY	1	0	2010-02-14	1341	\N	29551	\N
37135	GENERIC_DAY	1	0	2010-02-17	1314	\N	29551	\N
37136	GENERIC_DAY	1	1	2010-02-22	1330	\N	29551	\N
37137	GENERIC_DAY	1	2	2010-02-05	1322	\N	29551	\N
37138	GENERIC_DAY	1	2	2010-02-19	1314	\N	29551	\N
37139	GENERIC_DAY	1	0	2010-02-07	1326	\N	29551	\N
12957	SPECIFIC_DAY	4	2	2009-12-24	1320	11845	\N	\N
12955	SPECIFIC_DAY	4	2	2009-12-16	1320	11845	\N	\N
12980	SPECIFIC_DAY	4	2	2009-12-23	1320	11845	\N	\N
12960	SPECIFIC_DAY	4	2	2009-12-17	1320	11845	\N	\N
12959	SPECIFIC_DAY	4	2	2009-12-28	1320	11845	\N	\N
12961	SPECIFIC_DAY	4	2	2009-12-30	1320	11845	\N	\N
12958	SPECIFIC_DAY	4	2	2009-12-31	1320	11845	\N	\N
12956	SPECIFIC_DAY	4	0	2010-01-03	1320	11845	\N	\N
13018	SPECIFIC_DAY	4	1	2010-01-07	1345	11846	\N	\N
13017	SPECIFIC_DAY	4	1	2010-01-14	1345	11846	\N	\N
13000	SPECIFIC_DAY	4	1	2010-01-01	1345	11846	\N	\N
13006	SPECIFIC_DAY	4	1	2009-12-28	1345	11846	\N	\N
12982	SPECIFIC_DAY	4	1	2009-12-25	1345	11846	\N	\N
12990	SPECIFIC_DAY	4	0	2009-12-20	1345	11846	\N	\N
13004	SPECIFIC_DAY	4	0	2010-01-02	1345	11846	\N	\N
13019	SPECIFIC_DAY	4	1	2009-12-29	1345	11846	\N	\N
13008	SPECIFIC_DAY	4	1	2010-01-06	1345	11846	\N	\N
13014	SPECIFIC_DAY	4	1	2009-12-30	1345	11846	\N	\N
13015	SPECIFIC_DAY	4	1	2010-01-12	1345	11846	\N	\N
12998	SPECIFIC_DAY	4	1	2010-01-19	1345	11846	\N	\N
12707	SPECIFIC_DAY	5	2	2009-12-24	1345	11837	\N	\N
12723	SPECIFIC_DAY	5	2	2009-12-18	1345	11837	\N	\N
12691	SPECIFIC_DAY	5	2	2010-01-14	1345	11837	\N	\N
12704	SPECIFIC_DAY	5	2	2009-12-17	1345	11837	\N	\N
12700	SPECIFIC_DAY	5	2	2010-01-07	1345	11837	\N	\N
12714	SPECIFIC_DAY	5	0	2009-12-20	1345	11837	\N	\N
12716	SPECIFIC_DAY	5	2	2009-12-21	1345	11837	\N	\N
12711	SPECIFIC_DAY	5	0	2009-12-26	1345	11837	\N	\N
12722	SPECIFIC_DAY	5	0	2009-12-19	1345	11837	\N	\N
12697	SPECIFIC_DAY	5	2	2010-01-12	1345	11837	\N	\N
12695	SPECIFIC_DAY	5	2	2010-01-22	1345	11837	\N	\N
12708	SPECIFIC_DAY	5	2	2010-01-20	1345	11837	\N	\N
12715	SPECIFIC_DAY	5	2	2010-01-06	1345	11837	\N	\N
12725	SPECIFIC_DAY	5	0	2010-01-03	1345	11837	\N	\N
12720	SPECIFIC_DAY	5	2	2009-12-30	1345	11837	\N	\N
37140	GENERIC_DAY	1	2	2010-02-03	1326	\N	29551	\N
37141	GENERIC_DAY	1	2	2010-02-03	1328	\N	29551	\N
37142	GENERIC_DAY	1	0	2010-02-21	1341	\N	29551	\N
37143	GENERIC_DAY	1	0	2010-02-07	1314	\N	29551	\N
37144	GENERIC_DAY	1	1	2010-02-05	1330	\N	29551	\N
37145	GENERIC_DAY	1	1	2010-02-15	1322	\N	29551	\N
37146	GENERIC_DAY	1	0	2010-02-21	1326	\N	29551	\N
12688	SPECIFIC_DAY	5	0	2010-01-17	1345	11837	\N	\N
12712	SPECIFIC_DAY	5	2	2010-01-21	1345	11837	\N	\N
12689	SPECIFIC_DAY	5	2	2010-01-04	1345	11837	\N	\N
12698	SPECIFIC_DAY	5	2	2009-12-22	1345	11837	\N	\N
12702	SPECIFIC_DAY	5	2	2009-12-23	1345	11837	\N	\N
12709	SPECIFIC_DAY	5	2	2009-12-29	1345	11837	\N	\N
12692	SPECIFIC_DAY	5	2	2009-12-31	1345	11837	\N	\N
12693	SPECIFIC_DAY	5	2	2010-01-08	1345	11837	\N	\N
12713	SPECIFIC_DAY	5	2	2009-12-28	1345	11837	\N	\N
12719	SPECIFIC_DAY	5	2	2010-01-15	1345	11837	\N	\N
12705	SPECIFIC_DAY	5	0	2010-01-02	1345	11837	\N	\N
12756	SPECIFIC_DAY	5	0	2010-01-10	1316	11838	\N	\N
12741	SPECIFIC_DAY	5	2	2009-12-15	1316	11838	\N	\N
12751	SPECIFIC_DAY	5	2	2010-01-20	1316	11838	\N	\N
12753	SPECIFIC_DAY	5	2	2010-01-19	1316	11838	\N	\N
12728	SPECIFIC_DAY	5	2	2010-01-08	1316	11838	\N	\N
12762	SPECIFIC_DAY	5	0	2010-01-02	1316	11838	\N	\N
12729	SPECIFIC_DAY	5	2	2010-01-22	1316	11838	\N	\N
12740	SPECIFIC_DAY	5	0	2009-12-20	1316	11838	\N	\N
12734	SPECIFIC_DAY	5	2	2009-12-31	1316	11838	\N	\N
12752	SPECIFIC_DAY	5	2	2009-12-22	1316	11838	\N	\N
12750	SPECIFIC_DAY	5	2	2009-12-29	1316	11838	\N	\N
12739	SPECIFIC_DAY	5	2	2009-12-28	1316	11838	\N	\N
12763	SPECIFIC_DAY	5	2	2010-01-04	1316	11838	\N	\N
12736	SPECIFIC_DAY	5	2	2009-12-23	1316	11838	\N	\N
12747	SPECIFIC_DAY	5	0	2009-12-19	1316	11838	\N	\N
12764	SPECIFIC_DAY	5	2	2009-12-25	1316	11838	\N	\N
12755	SPECIFIC_DAY	5	2	2010-01-05	1316	11838	\N	\N
12754	SPECIFIC_DAY	5	2	2010-01-01	1316	11838	\N	\N
12765	SPECIFIC_DAY	5	2	2010-01-13	1316	11838	\N	\N
12759	SPECIFIC_DAY	5	2	2009-12-17	1316	11838	\N	\N
12732	SPECIFIC_DAY	5	2	2010-01-14	1316	11838	\N	\N
12742	SPECIFIC_DAY	5	2	2010-01-11	1316	11838	\N	\N
12743	SPECIFIC_DAY	5	0	2010-01-09	1316	11838	\N	\N
12738	SPECIFIC_DAY	5	2	2010-01-12	1316	11838	\N	\N
12749	SPECIFIC_DAY	5	2	2009-12-18	1316	11838	\N	\N
12735	SPECIFIC_DAY	5	2	2010-01-06	1316	11838	\N	\N
12745	SPECIFIC_DAY	5	0	2010-01-16	1316	11838	\N	\N
12727	SPECIFIC_DAY	5	2	2010-01-15	1316	11838	\N	\N
12758	SPECIFIC_DAY	5	2	2009-12-30	1316	11838	\N	\N
12737	SPECIFIC_DAY	5	2	2010-01-21	1316	11838	\N	\N
12733	SPECIFIC_DAY	5	0	2009-12-26	1316	11838	\N	\N
12730	SPECIFIC_DAY	5	2	2010-01-07	1316	11838	\N	\N
12726	SPECIFIC_DAY	5	2	2009-12-21	1316	11838	\N	\N
12746	SPECIFIC_DAY	5	2	2009-12-16	1316	11838	\N	\N
12731	SPECIFIC_DAY	5	2	2010-01-18	1316	11838	\N	\N
12757	SPECIFIC_DAY	5	2	2009-12-24	1316	11838	\N	\N
12760	SPECIFIC_DAY	5	0	2009-12-27	1316	11838	\N	\N
11692	SPECIFIC_DAY	8	0	2009-12-20	1322	10692	\N	\N
11693	SPECIFIC_DAY	8	8	2009-12-21	1322	10692	\N	\N
11698	SPECIFIC_DAY	8	0	2009-12-19	1322	10692	\N	\N
11697	SPECIFIC_DAY	8	8	2009-12-15	1322	10692	\N	\N
11696	SPECIFIC_DAY	8	8	2009-12-17	1322	10692	\N	\N
11699	SPECIFIC_DAY	8	8	2009-12-18	1322	10692	\N	\N
11695	SPECIFIC_DAY	8	8	2009-12-14	1322	10692	\N	\N
11694	SPECIFIC_DAY	8	8	2009-12-16	1322	10692	\N	\N
12777	SPECIFIC_DAY	5	2	2009-12-21	1343	11839	\N	\N
12783	SPECIFIC_DAY	5	2	2009-12-17	1343	11839	\N	\N
12781	SPECIFIC_DAY	5	2	2009-12-25	1343	11839	\N	\N
12786	SPECIFIC_DAY	5	2	2009-12-16	1343	11839	\N	\N
12773	SPECIFIC_DAY	5	2	2009-12-23	1343	11839	\N	\N
12780	SPECIFIC_DAY	5	2	2009-12-28	1343	11839	\N	\N
12779	SPECIFIC_DAY	5	0	2009-12-19	1343	11839	\N	\N
12785	SPECIFIC_DAY	5	2	2009-12-14	1343	11839	\N	\N
12787	SPECIFIC_DAY	5	2	2009-12-18	1343	11839	\N	\N
12774	SPECIFIC_DAY	5	0	2009-12-20	1343	11839	\N	\N
12784	SPECIFIC_DAY	5	0	2009-12-26	1343	11839	\N	\N
12782	SPECIFIC_DAY	5	2	2009-12-24	1343	11839	\N	\N
12776	SPECIFIC_DAY	5	2	2009-12-15	1343	11839	\N	\N
12788	SPECIFIC_DAY	5	0	2009-12-27	1343	11839	\N	\N
12775	SPECIFIC_DAY	5	2	2009-12-22	1343	11839	\N	\N
12778	SPECIFIC_DAY	5	2	2009-12-29	1343	11839	\N	\N
37147	GENERIC_DAY	1	0	2010-02-20	1322	\N	29551	\N
37148	GENERIC_DAY	1	1	2010-02-26	1328	\N	29551	\N
37149	GENERIC_DAY	1	1	2010-02-26	1341	\N	29551	\N
37150	GENERIC_DAY	1	2	2010-02-09	1314	\N	29551	\N
37151	GENERIC_DAY	1	2	2010-02-12	1341	\N	29551	\N
37152	GENERIC_DAY	1	0	2010-02-13	1314	\N	29551	\N
37153	GENERIC_DAY	1	2	2010-02-16	1341	\N	29551	\N
37154	GENERIC_DAY	1	1	2010-02-22	1328	\N	29551	\N
37155	GENERIC_DAY	1	0	2010-02-06	1341	\N	29551	\N
37156	GENERIC_DAY	1	2	2010-02-05	1314	\N	29551	\N
37157	GENERIC_DAY	1	0	2010-02-20	1326	\N	29551	\N
37158	GENERIC_DAY	1	2	2010-02-24	1341	\N	29551	\N
37159	GENERIC_DAY	1	0	2010-02-20	1314	\N	29551	\N
37160	GENERIC_DAY	1	2	2010-02-10	1314	\N	29551	\N
37161	GENERIC_DAY	1	0	2010-02-14	1328	\N	29551	\N
37162	GENERIC_DAY	1	1	2010-02-19	1322	\N	29551	\N
37163	GENERIC_DAY	1	2	2010-02-18	1341	\N	29551	\N
37164	GENERIC_DAY	1	2	2010-02-01	1326	\N	29551	\N
37165	GENERIC_DAY	1	2	2010-02-24	1314	\N	29551	\N
37166	GENERIC_DAY	1	1	2010-02-08	1330	\N	29551	\N
37167	GENERIC_DAY	1	1	2010-02-12	1330	\N	29551	\N
37168	GENERIC_DAY	1	1	2010-02-10	1326	\N	29551	\N
37169	GENERIC_DAY	1	1	2010-02-22	1326	\N	29551	\N
37170	GENERIC_DAY	1	1	2010-02-08	1326	\N	29551	\N
37171	GENERIC_DAY	1	2	2010-03-16	1314	\N	29552	\N
37172	GENERIC_DAY	1	0	2010-03-14	1326	\N	29552	\N
37173	GENERIC_DAY	1	0	2010-03-13	1328	\N	29552	\N
37174	GENERIC_DAY	1	1	2010-03-16	1326	\N	29552	\N
37175	GENERIC_DAY	1	2	2010-03-15	1341	\N	29552	\N
37176	GENERIC_DAY	1	0	2010-03-14	1328	\N	29552	\N
37177	GENERIC_DAY	1	1	2010-03-16	1328	\N	29552	\N
37178	GENERIC_DAY	1	1	2010-03-12	1322	\N	29552	\N
37179	GENERIC_DAY	1	0	2010-03-14	1330	\N	29552	\N
37180	GENERIC_DAY	1	1	2010-03-11	1326	\N	29552	\N
37181	GENERIC_DAY	1	1	2010-03-16	1322	\N	29552	\N
37182	GENERIC_DAY	1	2	2010-03-11	1341	\N	29552	\N
37183	GENERIC_DAY	1	0	2010-03-14	1322	\N	29552	\N
37184	GENERIC_DAY	1	0	2010-03-17	1328	\N	29552	\N
37185	GENERIC_DAY	1	1	2010-03-15	1322	\N	29552	\N
37186	GENERIC_DAY	1	1	2010-03-15	1328	\N	29552	\N
37187	GENERIC_DAY	1	2	2010-03-11	1314	\N	29552	\N
37188	GENERIC_DAY	1	0	2010-03-13	1314	\N	29552	\N
37189	GENERIC_DAY	1	1	2010-03-15	1330	\N	29552	\N
37190	GENERIC_DAY	1	0	2010-03-17	1326	\N	29552	\N
37191	GENERIC_DAY	1	1	2010-03-11	1322	\N	29552	\N
37192	GENERIC_DAY	1	0	2010-03-14	1314	\N	29552	\N
37193	GENERIC_DAY	1	1	2010-03-12	1330	\N	29552	\N
37194	GENERIC_DAY	1	2	2010-03-12	1341	\N	29552	\N
37195	GENERIC_DAY	1	0	2010-03-13	1326	\N	29552	\N
37196	GENERIC_DAY	1	0	2010-03-17	1330	\N	29552	\N
37197	GENERIC_DAY	1	1	2010-03-11	1328	\N	29552	\N
37198	GENERIC_DAY	1	0	2010-03-13	1322	\N	29552	\N
37199	GENERIC_DAY	1	1	2010-03-15	1326	\N	29552	\N
37200	GENERIC_DAY	1	2	2010-03-10	1341	\N	29552	\N
37201	GENERIC_DAY	1	1	2010-03-10	1326	\N	29552	\N
37202	GENERIC_DAY	1	0	2010-03-17	1322	\N	29552	\N
37203	GENERIC_DAY	1	2	2010-03-10	1314	\N	29552	\N
37204	GENERIC_DAY	1	0	2010-03-13	1341	\N	29552	\N
37205	GENERIC_DAY	1	1	2010-03-10	1322	\N	29552	\N
37206	GENERIC_DAY	1	2	2010-03-15	1314	\N	29552	\N
37207	GENERIC_DAY	1	1	2010-03-10	1330	\N	29552	\N
37208	GENERIC_DAY	1	0	2010-03-13	1330	\N	29552	\N
37209	GENERIC_DAY	1	0	2010-03-14	1341	\N	29552	\N
37210	GENERIC_DAY	1	2	2010-03-12	1314	\N	29552	\N
37211	GENERIC_DAY	1	1	2010-03-16	1330	\N	29552	\N
37212	GENERIC_DAY	1	1	2010-03-11	1330	\N	29552	\N
37213	GENERIC_DAY	1	2	2010-03-16	1341	\N	29552	\N
37214	GENERIC_DAY	1	1	2010-03-17	1341	\N	29552	\N
37215	GENERIC_DAY	1	1	2010-03-17	1314	\N	29552	\N
37216	GENERIC_DAY	1	1	2010-03-12	1326	\N	29552	\N
37217	GENERIC_DAY	1	1	2010-03-12	1328	\N	29552	\N
37218	GENERIC_DAY	1	1	2010-03-10	1328	\N	29552	\N
37219	GENERIC_DAY	1	1	2010-03-23	1322	\N	29553	\N
37220	GENERIC_DAY	1	0	2010-03-20	1322	\N	29553	\N
37221	GENERIC_DAY	1	1	2010-03-22	1330	\N	29553	\N
37222	GENERIC_DAY	1	0	2010-03-28	1328	\N	29553	\N
37223	GENERIC_DAY	1	0	2010-03-27	1341	\N	29553	\N
37224	GENERIC_DAY	1	1	2010-03-26	1326	\N	29553	\N
37225	GENERIC_DAY	1	1	2010-03-26	1322	\N	29553	\N
37226	GENERIC_DAY	1	2	2010-03-26	1341	\N	29553	\N
37227	GENERIC_DAY	1	0	2010-03-19	1330	\N	29553	\N
37228	GENERIC_DAY	1	2	2010-03-22	1314	\N	29553	\N
37229	GENERIC_DAY	1	1	2010-03-24	1328	\N	29553	\N
37230	GENERIC_DAY	1	1	2010-03-25	1314	\N	29553	\N
37231	GENERIC_DAY	1	1	2010-03-25	1326	\N	29553	\N
37232	GENERIC_DAY	1	1	2010-03-25	1328	\N	29553	\N
37233	GENERIC_DAY	1	0	2010-03-20	1330	\N	29553	\N
37234	GENERIC_DAY	1	2	2010-03-25	1330	\N	29553	\N
37235	GENERIC_DAY	1	0	2010-03-20	1341	\N	29553	\N
37236	GENERIC_DAY	1	2	2010-03-29	1341	\N	29553	\N
37237	GENERIC_DAY	1	1	2010-03-22	1326	\N	29553	\N
37238	GENERIC_DAY	1	2	2010-03-22	1341	\N	29553	\N
37239	GENERIC_DAY	1	1	2010-03-23	1326	\N	29553	\N
37240	GENERIC_DAY	1	1	2010-03-23	1314	\N	29553	\N
37241	GENERIC_DAY	1	2	2010-03-18	1341	\N	29553	\N
37242	GENERIC_DAY	1	1	2010-03-22	1322	\N	29553	\N
37243	GENERIC_DAY	1	1	2010-03-29	1328	\N	29553	\N
37244	GENERIC_DAY	1	0	2010-03-21	1330	\N	29553	\N
37245	GENERIC_DAY	1	2	2010-03-18	1314	\N	29553	\N
37246	GENERIC_DAY	1	1	2010-03-18	1326	\N	29553	\N
37247	GENERIC_DAY	1	2	2010-03-26	1330	\N	29553	\N
37248	GENERIC_DAY	1	1	2010-03-29	1314	\N	29553	\N
37249	GENERIC_DAY	1	0	2010-03-28	1322	\N	29553	\N
37250	GENERIC_DAY	1	0	2010-03-19	1314	\N	29553	\N
37251	GENERIC_DAY	1	0	2010-03-19	1322	\N	29553	\N
37252	GENERIC_DAY	1	1	2010-03-29	1326	\N	29553	\N
37253	GENERIC_DAY	1	0	2010-03-19	1341	\N	29553	\N
37254	GENERIC_DAY	1	1	2010-03-24	1326	\N	29553	\N
37255	GENERIC_DAY	1	2	2010-03-24	1341	\N	29553	\N
37256	GENERIC_DAY	1	1	2010-03-26	1314	\N	29553	\N
37257	GENERIC_DAY	1	0	2010-03-27	1326	\N	29553	\N
37258	GENERIC_DAY	1	1	2010-03-29	1322	\N	29553	\N
37259	GENERIC_DAY	1	2	2010-03-25	1341	\N	29553	\N
37260	GENERIC_DAY	1	0	2010-03-28	1341	\N	29553	\N
37261	GENERIC_DAY	1	0	2010-03-27	1322	\N	29553	\N
37262	GENERIC_DAY	1	0	2010-03-27	1330	\N	29553	\N
37263	GENERIC_DAY	1	0	2010-03-28	1326	\N	29553	\N
37264	GENERIC_DAY	1	2	2010-03-29	1330	\N	29553	\N
37265	GENERIC_DAY	1	1	2010-03-18	1328	\N	29553	\N
37266	GENERIC_DAY	1	0	2010-03-19	1328	\N	29553	\N
37267	GENERIC_DAY	1	0	2010-03-21	1328	\N	29553	\N
37268	GENERIC_DAY	1	1	2010-03-24	1322	\N	29553	\N
37269	GENERIC_DAY	1	2	2010-03-24	1330	\N	29553	\N
37270	GENERIC_DAY	1	1	2010-03-18	1330	\N	29553	\N
37271	GENERIC_DAY	1	1	2010-03-22	1328	\N	29553	\N
37272	GENERIC_DAY	1	0	2010-03-28	1314	\N	29553	\N
37273	GENERIC_DAY	1	0	2010-03-21	1341	\N	29553	\N
37274	GENERIC_DAY	1	2	2010-03-23	1330	\N	29553	\N
37275	GENERIC_DAY	1	1	2010-03-24	1314	\N	29553	\N
37276	GENERIC_DAY	1	1	2010-03-25	1322	\N	29553	\N
37277	GENERIC_DAY	1	0	2010-03-27	1328	\N	29553	\N
37278	GENERIC_DAY	1	0	2010-03-28	1330	\N	29553	\N
37279	GENERIC_DAY	1	2	2010-03-23	1341	\N	29553	\N
37280	GENERIC_DAY	1	1	2010-03-18	1322	\N	29553	\N
37281	GENERIC_DAY	1	0	2010-03-20	1326	\N	29553	\N
37282	GENERIC_DAY	1	1	2010-03-26	1328	\N	29553	\N
13532	SPECIFIC_DAY	2	4	2010-01-15	1320	11899	\N	\N
13542	SPECIFIC_DAY	2	4	2009-12-17	1320	11899	\N	\N
13517	SPECIFIC_DAY	2	4	2010-01-08	1320	11899	\N	\N
13512	SPECIFIC_DAY	2	4	2009-12-25	1320	11899	\N	\N
13508	SPECIFIC_DAY	2	4	2009-12-21	1320	11899	\N	\N
13525	SPECIFIC_DAY	2	0	2010-01-10	1320	11899	\N	\N
13518	SPECIFIC_DAY	2	4	2010-01-04	1320	11899	\N	\N
13522	SPECIFIC_DAY	2	0	2010-01-09	1320	11899	\N	\N
13533	SPECIFIC_DAY	2	4	2010-01-22	1320	11899	\N	\N
13511	SPECIFIC_DAY	2	4	2009-12-22	1320	11899	\N	\N
13547	SPECIFIC_DAY	2	0	2010-01-16	1320	11899	\N	\N
13509	SPECIFIC_DAY	2	4	2010-01-26	1320	11899	\N	\N
13513	SPECIFIC_DAY	2	0	2010-01-23	1320	11899	\N	\N
13510	SPECIFIC_DAY	2	0	2010-01-17	1320	11899	\N	\N
13544	SPECIFIC_DAY	2	0	2009-12-19	1320	11899	\N	\N
13514	SPECIFIC_DAY	2	4	2009-12-24	1320	11899	\N	\N
13520	SPECIFIC_DAY	2	0	2009-12-26	1320	11899	\N	\N
11108	SPECIFIC_DAY	16	8	2009-12-15	1314	10633	\N	\N
11110	SPECIFIC_DAY	16	8	2009-12-16	1314	10633	\N	\N
11107	SPECIFIC_DAY	16	8	2009-12-18	1314	10633	\N	\N
11106	SPECIFIC_DAY	16	8	2009-12-14	1314	10633	\N	\N
11109	SPECIFIC_DAY	16	8	2009-12-17	1314	10633	\N	\N
12994	SPECIFIC_DAY	4	1	2010-01-11	1345	11846	\N	\N
13003	SPECIFIC_DAY	4	0	2009-12-27	1345	11846	\N	\N
12989	SPECIFIC_DAY	4	1	2010-01-08	1345	11846	\N	\N
12987	SPECIFIC_DAY	4	1	2009-12-24	1345	11846	\N	\N
13005	SPECIFIC_DAY	4	0	2010-01-16	1345	11846	\N	\N
13013	SPECIFIC_DAY	4	1	2010-01-04	1345	11846	\N	\N
12991	SPECIFIC_DAY	4	0	2010-01-23	1345	11846	\N	\N
12984	SPECIFIC_DAY	4	1	2010-01-20	1345	11846	\N	\N
13022	SPECIFIC_DAY	4	0	2010-01-09	1345	11846	\N	\N
13021	SPECIFIC_DAY	4	1	2010-01-13	1345	11846	\N	\N
12981	SPECIFIC_DAY	4	1	2010-01-05	1345	11846	\N	\N
12996	SPECIFIC_DAY	4	1	2009-12-15	1345	11846	\N	\N
12993	SPECIFIC_DAY	4	1	2009-12-14	1345	11846	\N	\N
12999	SPECIFIC_DAY	4	0	2009-12-19	1345	11846	\N	\N
13016	SPECIFIC_DAY	4	1	2010-01-18	1345	11846	\N	\N
13012	SPECIFIC_DAY	4	0	2010-01-03	1345	11846	\N	\N
12983	SPECIFIC_DAY	4	1	2010-01-25	1345	11846	\N	\N
12986	SPECIFIC_DAY	4	1	2009-12-21	1345	11846	\N	\N
37283	GENERIC_DAY	1	0	2010-03-27	1314	\N	29553	\N
37284	GENERIC_DAY	1	0	2010-03-20	1328	\N	29553	\N
37285	GENERIC_DAY	1	0	2010-03-20	1314	\N	29553	\N
37286	GENERIC_DAY	1	0	2010-03-21	1322	\N	29553	\N
37287	GENERIC_DAY	1	1	2010-03-23	1328	\N	29553	\N
37288	GENERIC_DAY	1	0	2010-03-21	1326	\N	29553	\N
37289	GENERIC_DAY	1	0	2010-03-19	1326	\N	29553	\N
37290	GENERIC_DAY	1	0	2010-03-21	1314	\N	29553	\N
37291	GENERIC_DAY	1	1	2010-03-05	1322	\N	29554	\N
37292	GENERIC_DAY	1	1	2010-04-15	1314	\N	29554	\N
37293	GENERIC_DAY	1	0	2010-04-24	1314	\N	29554	\N
37294	GENERIC_DAY	1	1	2010-04-29	1341	\N	29554	\N
37295	GENERIC_DAY	1	1	2010-03-24	1322	\N	29554	\N
37296	GENERIC_DAY	1	0	2010-03-14	1326	\N	29554	\N
37297	GENERIC_DAY	1	0	2010-02-27	1341	\N	29554	\N
37298	GENERIC_DAY	1	1	2010-04-22	1322	\N	29554	\N
37299	GENERIC_DAY	1	0	2010-03-19	1326	\N	29554	\N
37300	GENERIC_DAY	1	0	2010-02-28	1322	\N	29554	\N
37301	GENERIC_DAY	1	0	2010-03-28	1314	\N	29554	\N
37302	GENERIC_DAY	1	1	2010-05-13	1322	\N	29554	\N
37303	GENERIC_DAY	1	2	2010-04-23	1328	\N	29554	\N
37304	GENERIC_DAY	1	0	2010-03-27	1328	\N	29554	\N
37305	GENERIC_DAY	1	2	2010-03-03	1341	\N	29554	\N
37306	GENERIC_DAY	1	1	2010-04-14	1314	\N	29554	\N
37307	GENERIC_DAY	1	1	2010-05-06	1322	\N	29554	\N
37308	GENERIC_DAY	1	1	2010-04-13	1322	\N	29554	\N
37309	GENERIC_DAY	1	2	2010-03-17	1330	\N	29554	\N
37310	GENERIC_DAY	1	1	2010-04-22	1314	\N	29554	\N
37311	GENERIC_DAY	1	1	2010-05-04	1322	\N	29554	\N
37312	GENERIC_DAY	1	0	2010-04-01	1328	\N	29554	\N
37313	GENERIC_DAY	1	1	2010-05-11	1341	\N	29554	\N
37314	GENERIC_DAY	1	1	2010-04-23	1314	\N	29554	\N
37315	GENERIC_DAY	1	2	2010-05-13	1326	\N	29554	\N
37316	GENERIC_DAY	1	0	2010-05-02	1330	\N	29554	\N
37317	GENERIC_DAY	1	1	2010-03-23	1330	\N	29554	\N
37318	GENERIC_DAY	1	0	2010-04-02	1326	\N	29554	\N
37319	GENERIC_DAY	1	0	2010-02-28	1328	\N	29554	\N
37320	GENERIC_DAY	1	0	2010-04-04	1328	\N	29554	\N
37321	GENERIC_DAY	1	0	2010-04-03	1341	\N	29554	\N
37322	GENERIC_DAY	1	2	2010-05-11	1328	\N	29554	\N
37323	GENERIC_DAY	1	1	2010-05-10	1330	\N	29554	\N
37324	GENERIC_DAY	1	1	2010-03-23	1314	\N	29554	\N
37325	GENERIC_DAY	1	0	2010-05-02	1326	\N	29554	\N
37326	GENERIC_DAY	1	1	2010-05-03	1314	\N	29554	\N
37327	GENERIC_DAY	1	2	2010-05-04	1328	\N	29554	\N
37328	GENERIC_DAY	1	0	2010-04-24	1328	\N	29554	\N
37329	GENERIC_DAY	1	0	2010-03-19	1322	\N	29554	\N
37330	GENERIC_DAY	1	1	2010-05-12	1314	\N	29554	\N
37331	GENERIC_DAY	1	1	2010-04-06	1330	\N	29554	\N
37332	GENERIC_DAY	1	1	2010-04-09	1322	\N	29554	\N
37333	GENERIC_DAY	1	0	2010-04-11	1341	\N	29554	\N
37334	GENERIC_DAY	1	1	2010-05-11	1314	\N	29554	\N
37335	GENERIC_DAY	1	0	2010-04-03	1314	\N	29554	\N
37336	GENERIC_DAY	1	1	2010-03-10	1322	\N	29554	\N
37337	GENERIC_DAY	1	0	2010-04-04	1326	\N	29554	\N
37338	GENERIC_DAY	1	0	2010-03-07	1326	\N	29554	\N
37339	GENERIC_DAY	1	1	2010-04-28	1322	\N	29554	\N
37340	GENERIC_DAY	1	1	2010-03-22	1326	\N	29554	\N
37341	GENERIC_DAY	1	0	2010-04-11	1326	\N	29554	\N
37342	GENERIC_DAY	1	0	2010-04-04	1322	\N	29554	\N
37343	GENERIC_DAY	1	2	2010-04-13	1328	\N	29554	\N
37344	GENERIC_DAY	1	2	2010-05-03	1326	\N	29554	\N
37345	GENERIC_DAY	1	0	2010-05-09	1314	\N	29554	\N
37346	GENERIC_DAY	1	1	2010-04-07	1314	\N	29554	\N
37347	GENERIC_DAY	1	2	2010-04-27	1328	\N	29554	\N
37348	GENERIC_DAY	1	1	2010-03-08	1328	\N	29554	\N
37349	GENERIC_DAY	1	1	2010-03-16	1314	\N	29554	\N
37350	GENERIC_DAY	1	1	2010-03-17	1326	\N	29554	\N
37351	GENERIC_DAY	1	1	2010-03-03	1328	\N	29554	\N
37352	GENERIC_DAY	1	2	2010-03-08	1314	\N	29554	\N
37353	GENERIC_DAY	1	1	2010-05-13	1330	\N	29554	\N
37354	GENERIC_DAY	1	1	2010-03-16	1341	\N	29554	\N
37355	GENERIC_DAY	1	2	2010-03-11	1330	\N	29554	\N
37356	GENERIC_DAY	1	1	2010-04-19	1314	\N	29554	\N
37357	GENERIC_DAY	1	1	2010-04-15	1330	\N	29554	\N
37358	GENERIC_DAY	1	0	2010-03-14	1322	\N	29554	\N
37359	GENERIC_DAY	1	0	2010-04-17	1326	\N	29554	\N
37360	GENERIC_DAY	1	0	2010-05-01	1322	\N	29554	\N
37361	GENERIC_DAY	1	0	2010-04-17	1322	\N	29554	\N
37362	GENERIC_DAY	1	1	2010-04-20	1322	\N	29554	\N
37363	GENERIC_DAY	1	1	2010-04-26	1330	\N	29554	\N
37364	GENERIC_DAY	1	1	2010-04-27	1330	\N	29554	\N
37365	GENERIC_DAY	1	1	2010-03-26	1322	\N	29554	\N
37366	GENERIC_DAY	1	1	2010-04-23	1341	\N	29554	\N
37367	GENERIC_DAY	1	1	2010-03-04	1330	\N	29554	\N
37368	GENERIC_DAY	1	0	2010-03-07	1341	\N	29554	\N
37369	GENERIC_DAY	1	1	2010-04-09	1314	\N	29554	\N
37370	GENERIC_DAY	1	2	2010-04-07	1326	\N	29554	\N
37371	GENERIC_DAY	1	0	2010-04-03	1322	\N	29554	\N
37372	GENERIC_DAY	1	1	2010-04-08	1341	\N	29554	\N
37373	GENERIC_DAY	1	1	2010-03-22	1322	\N	29554	\N
37374	GENERIC_DAY	1	0	2010-03-19	1328	\N	29554	\N
37375	GENERIC_DAY	1	0	2010-04-24	1341	\N	29554	\N
37376	GENERIC_DAY	1	0	2010-03-21	1322	\N	29554	\N
37377	GENERIC_DAY	1	1	2010-03-02	1326	\N	29554	\N
37378	GENERIC_DAY	1	1	2010-04-30	1341	\N	29554	\N
37379	GENERIC_DAY	1	1	2010-03-04	1328	\N	29554	\N
37380	GENERIC_DAY	1	2	2010-04-06	1328	\N	29554	\N
37381	GENERIC_DAY	1	0	2010-05-01	1328	\N	29554	\N
37382	GENERIC_DAY	1	0	2010-02-27	1326	\N	29554	\N
37383	GENERIC_DAY	1	1	2010-04-08	1314	\N	29554	\N
37384	GENERIC_DAY	1	0	2010-04-01	1341	\N	29554	\N
37385	GENERIC_DAY	1	2	2010-03-29	1328	\N	29554	\N
37386	GENERIC_DAY	1	0	2010-04-02	1322	\N	29554	\N
37387	GENERIC_DAY	1	1	2010-03-15	1326	\N	29554	\N
37388	GENERIC_DAY	1	0	2010-04-02	1330	\N	29554	\N
37389	GENERIC_DAY	1	0	2010-03-20	1341	\N	29554	\N
37390	GENERIC_DAY	1	2	2010-03-05	1341	\N	29554	\N
37391	GENERIC_DAY	1	1	2010-04-07	1322	\N	29554	\N
37392	GENERIC_DAY	1	0	2010-03-20	1330	\N	29554	\N
37393	GENERIC_DAY	1	2	2010-04-14	1328	\N	29554	\N
37394	GENERIC_DAY	1	0	2010-05-01	1326	\N	29554	\N
37395	GENERIC_DAY	1	0	2010-03-28	1341	\N	29554	\N
37396	GENERIC_DAY	1	1	2010-03-02	1328	\N	29554	\N
37397	GENERIC_DAY	1	1	2010-04-20	1330	\N	29554	\N
37398	GENERIC_DAY	1	2	2010-03-02	1341	\N	29554	\N
37399	GENERIC_DAY	1	0	2010-03-20	1314	\N	29554	\N
37400	GENERIC_DAY	1	1	2010-04-06	1322	\N	29554	\N
37401	GENERIC_DAY	1	1	2010-04-30	1322	\N	29554	\N
37402	GENERIC_DAY	1	0	2010-04-04	1314	\N	29554	\N
37403	GENERIC_DAY	1	2	2010-04-22	1328	\N	29554	\N
37404	GENERIC_DAY	1	1	2010-03-05	1326	\N	29554	\N
37405	GENERIC_DAY	1	2	2010-04-29	1326	\N	29554	\N
37406	GENERIC_DAY	1	1	2010-04-12	1330	\N	29554	\N
37407	GENERIC_DAY	1	2	2010-04-07	1328	\N	29554	\N
37408	GENERIC_DAY	1	1	2010-03-31	1341	\N	29554	\N
37409	GENERIC_DAY	1	0	2010-05-02	1322	\N	29554	\N
37410	GENERIC_DAY	1	1	2010-04-29	1314	\N	29554	\N
37411	GENERIC_DAY	1	0	2010-05-09	1322	\N	29554	\N
37412	GENERIC_DAY	1	2	2010-03-05	1314	\N	29554	\N
37413	GENERIC_DAY	1	1	2010-03-30	1314	\N	29554	\N
37414	GENERIC_DAY	1	0	2010-04-03	1330	\N	29554	\N
37415	GENERIC_DAY	1	1	2010-03-26	1330	\N	29554	\N
37416	GENERIC_DAY	1	2	2010-04-06	1326	\N	29554	\N
37417	GENERIC_DAY	1	1	2010-05-14	1330	\N	29554	\N
13579	SPECIFIC_DAY	2	2	2009-12-28	1316	11900	\N	\N
13568	SPECIFIC_DAY	2	2	2010-01-04	1316	11900	\N	\N
13588	SPECIFIC_DAY	2	2	2010-01-14	1316	11900	\N	\N
13572	SPECIFIC_DAY	2	2	2010-01-07	1316	11900	\N	\N
13586	SPECIFIC_DAY	2	2	2009-12-22	1316	11900	\N	\N
13555	SPECIFIC_DAY	2	0	2009-12-27	1316	11900	\N	\N
13584	SPECIFIC_DAY	2	2	2010-01-20	1316	11900	\N	\N
13573	SPECIFIC_DAY	2	2	2009-12-16	1316	11900	\N	\N
13560	SPECIFIC_DAY	2	2	2010-01-08	1316	11900	\N	\N
13595	SPECIFIC_DAY	2	2	2010-01-12	1316	11900	\N	\N
13581	SPECIFIC_DAY	2	0	2009-12-20	1316	11900	\N	\N
13564	SPECIFIC_DAY	2	0	2009-12-26	1316	11900	\N	\N
13587	SPECIFIC_DAY	2	2	2010-01-21	1316	11900	\N	\N
13553	SPECIFIC_DAY	2	0	2010-01-24	1316	11900	\N	\N
13556	SPECIFIC_DAY	2	2	2009-12-24	1316	11900	\N	\N
13590	SPECIFIC_DAY	2	2	2009-12-17	1316	11900	\N	\N
13563	SPECIFIC_DAY	2	2	2010-01-06	1316	11900	\N	\N
13552	SPECIFIC_DAY	2	2	2009-12-25	1316	11900	\N	\N
13575	SPECIFIC_DAY	2	0	2010-01-16	1316	11900	\N	\N
13578	SPECIFIC_DAY	2	2	2010-01-25	1316	11900	\N	\N
13580	SPECIFIC_DAY	2	0	2010-01-09	1316	11900	\N	\N
37418	GENERIC_DAY	1	1	2010-03-03	1330	\N	29554	\N
37419	GENERIC_DAY	1	2	2010-04-12	1328	\N	29554	\N
37420	GENERIC_DAY	1	0	2010-03-28	1322	\N	29554	\N
37421	GENERIC_DAY	1	0	2010-02-28	1314	\N	29554	\N
37422	GENERIC_DAY	1	1	2010-04-12	1314	\N	29554	\N
37423	GENERIC_DAY	1	1	2010-04-30	1330	\N	29554	\N
37424	GENERIC_DAY	1	1	2010-05-07	1314	\N	29554	\N
37425	GENERIC_DAY	1	2	2010-03-10	1328	\N	29554	\N
37426	GENERIC_DAY	1	1	2010-03-12	1341	\N	29554	\N
37427	GENERIC_DAY	1	2	2010-03-15	1330	\N	29554	\N
37428	GENERIC_DAY	1	1	2010-03-15	1322	\N	29554	\N
37429	GENERIC_DAY	1	0	2010-02-28	1326	\N	29554	\N
37430	GENERIC_DAY	1	1	2010-04-19	1330	\N	29554	\N
37431	GENERIC_DAY	1	0	2010-03-13	1322	\N	29554	\N
37432	GENERIC_DAY	1	1	2010-04-12	1341	\N	29554	\N
37433	GENERIC_DAY	1	0	2010-03-21	1328	\N	29554	\N
37434	GENERIC_DAY	1	2	2010-04-14	1326	\N	29554	\N
37435	GENERIC_DAY	1	0	2010-04-11	1322	\N	29554	\N
37436	GENERIC_DAY	1	0	2010-05-09	1328	\N	29554	\N
37437	GENERIC_DAY	1	1	2010-03-30	1341	\N	29554	\N
37438	GENERIC_DAY	1	2	2010-04-28	1328	\N	29554	\N
37439	GENERIC_DAY	1	2	2010-03-25	1326	\N	29554	\N
37440	GENERIC_DAY	1	2	2010-04-08	1328	\N	29554	\N
37441	GENERIC_DAY	1	0	2010-04-01	1322	\N	29554	\N
37442	GENERIC_DAY	1	1	2010-05-06	1314	\N	29554	\N
37443	GENERIC_DAY	1	1	2010-05-06	1341	\N	29554	\N
37444	GENERIC_DAY	1	0	2010-04-02	1314	\N	29554	\N
37445	GENERIC_DAY	1	0	2010-04-18	1341	\N	29554	\N
37446	GENERIC_DAY	1	1	2010-03-12	1322	\N	29554	\N
37447	GENERIC_DAY	1	0	2010-04-25	1322	\N	29554	\N
37448	GENERIC_DAY	1	2	2010-04-28	1326	\N	29554	\N
37449	GENERIC_DAY	1	1	2010-04-22	1341	\N	29554	\N
37450	GENERIC_DAY	1	1	2010-04-16	1314	\N	29554	\N
37451	GENERIC_DAY	1	2	2010-03-18	1328	\N	29554	\N
37452	GENERIC_DAY	1	0	2010-03-06	1314	\N	29554	\N
37453	GENERIC_DAY	1	0	2010-03-13	1330	\N	29554	\N
37454	GENERIC_DAY	1	0	2010-04-05	1322	\N	29554	\N
37455	GENERIC_DAY	1	2	2010-03-11	1328	\N	29554	\N
37456	GENERIC_DAY	1	1	2010-03-09	1326	\N	29554	\N
37457	GENERIC_DAY	1	0	2010-04-25	1341	\N	29554	\N
37458	GENERIC_DAY	1	0	2010-04-18	1330	\N	29554	\N
37459	GENERIC_DAY	1	0	2010-03-06	1330	\N	29554	\N
37460	GENERIC_DAY	1	1	2010-05-07	1341	\N	29554	\N
37461	GENERIC_DAY	1	2	2010-03-04	1341	\N	29554	\N
37462	GENERIC_DAY	1	2	2010-05-06	1328	\N	29554	\N
37463	GENERIC_DAY	1	0	2010-03-19	1314	\N	29554	\N
37464	GENERIC_DAY	1	2	2010-03-17	1328	\N	29554	\N
37465	GENERIC_DAY	1	2	2010-05-07	1328	\N	29554	\N
37466	GENERIC_DAY	1	2	2010-05-05	1328	\N	29554	\N
37467	GENERIC_DAY	1	1	2010-04-26	1341	\N	29554	\N
37468	GENERIC_DAY	1	0	2010-02-27	1314	\N	29554	\N
37469	GENERIC_DAY	1	0	2010-03-14	1341	\N	29554	\N
37470	GENERIC_DAY	1	1	2010-04-06	1341	\N	29554	\N
37471	GENERIC_DAY	1	0	2010-05-08	1322	\N	29554	\N
37472	GENERIC_DAY	1	0	2010-04-11	1314	\N	29554	\N
37473	GENERIC_DAY	1	0	2010-04-10	1326	\N	29554	\N
37474	GENERIC_DAY	1	2	2010-04-19	1326	\N	29554	\N
37475	GENERIC_DAY	1	1	2010-03-29	1322	\N	29554	\N
37476	GENERIC_DAY	1	2	2010-03-09	1322	\N	29554	\N
37477	GENERIC_DAY	1	0	2010-02-28	1341	\N	29554	\N
37478	GENERIC_DAY	1	1	2010-05-10	1314	\N	29554	\N
37479	GENERIC_DAY	1	1	2010-05-04	1314	\N	29554	\N
37480	GENERIC_DAY	1	0	2010-04-10	1341	\N	29554	\N
37481	GENERIC_DAY	1	1	2010-03-23	1341	\N	29554	\N
37482	GENERIC_DAY	1	2	2010-03-26	1328	\N	29554	\N
37483	GENERIC_DAY	1	0	2010-03-06	1322	\N	29554	\N
37484	GENERIC_DAY	1	2	2010-03-04	1314	\N	29554	\N
37485	GENERIC_DAY	1	2	2010-04-22	1326	\N	29554	\N
37486	GENERIC_DAY	1	1	2010-04-15	1341	\N	29554	\N
37487	GENERIC_DAY	1	1	2010-03-11	1341	\N	29554	\N
37488	GENERIC_DAY	1	2	2010-04-15	1328	\N	29554	\N
37489	GENERIC_DAY	1	0	2010-04-10	1330	\N	29554	\N
37490	GENERIC_DAY	1	1	2010-03-18	1326	\N	29554	\N
37491	GENERIC_DAY	1	2	2010-03-01	1341	\N	29554	\N
37492	GENERIC_DAY	1	0	2010-04-24	1322	\N	29554	\N
37493	GENERIC_DAY	1	1	2010-05-14	1314	\N	29554	\N
37494	GENERIC_DAY	1	1	2010-03-01	1330	\N	29554	\N
37495	GENERIC_DAY	1	0	2010-04-05	1330	\N	29554	\N
37496	GENERIC_DAY	1	2	2010-04-30	1328	\N	29554	\N
37497	GENERIC_DAY	1	1	2010-04-14	1330	\N	29554	\N
37498	GENERIC_DAY	1	2	2010-03-22	1328	\N	29554	\N
37499	GENERIC_DAY	1	0	2010-05-01	1330	\N	29554	\N
37500	GENERIC_DAY	1	0	2010-03-07	1330	\N	29554	\N
37501	GENERIC_DAY	1	1	2010-05-14	1328	\N	29554	\N
37502	GENERIC_DAY	1	0	2010-04-02	1341	\N	29554	\N
37503	GENERIC_DAY	1	1	2010-04-29	1330	\N	29554	\N
37504	GENERIC_DAY	1	0	2010-04-10	1322	\N	29554	\N
37505	GENERIC_DAY	1	0	2010-02-27	1322	\N	29554	\N
37506	GENERIC_DAY	1	2	2010-04-08	1326	\N	29554	\N
37507	GENERIC_DAY	1	1	2010-03-05	1328	\N	29554	\N
37508	GENERIC_DAY	1	2	2010-03-30	1328	\N	29554	\N
37509	GENERIC_DAY	1	1	2010-03-04	1326	\N	29554	\N
37510	GENERIC_DAY	1	0	2010-04-10	1328	\N	29554	\N
37511	GENERIC_DAY	1	2	2010-04-15	1326	\N	29554	\N
37512	GENERIC_DAY	1	0	2010-03-07	1322	\N	29554	\N
37513	GENERIC_DAY	1	1	2010-03-11	1314	\N	29554	\N
37514	GENERIC_DAY	1	1	2010-03-10	1314	\N	29554	\N
37515	GENERIC_DAY	1	0	2010-04-01	1326	\N	29554	\N
37516	GENERIC_DAY	1	1	2010-05-03	1322	\N	29554	\N
37517	GENERIC_DAY	1	1	2010-04-09	1330	\N	29554	\N
37518	GENERIC_DAY	1	1	2010-04-16	1341	\N	29554	\N
37519	GENERIC_DAY	1	0	2010-04-24	1326	\N	29554	\N
37520	GENERIC_DAY	1	1	2010-05-07	1330	\N	29554	\N
37521	GENERIC_DAY	1	2	2010-05-07	1326	\N	29554	\N
37522	GENERIC_DAY	1	1	2010-04-21	1314	\N	29554	\N
37523	GENERIC_DAY	1	1	2010-03-30	1330	\N	29554	\N
37524	GENERIC_DAY	1	1	2010-03-05	1330	\N	29554	\N
37525	GENERIC_DAY	1	1	2010-05-14	1322	\N	29554	\N
37526	GENERIC_DAY	1	1	2010-03-01	1322	\N	29554	\N
37527	GENERIC_DAY	1	2	2010-03-01	1314	\N	29554	\N
37528	GENERIC_DAY	1	2	2010-03-03	1314	\N	29554	\N
37529	GENERIC_DAY	1	1	2010-03-30	1322	\N	29554	\N
37530	GENERIC_DAY	1	1	2010-03-29	1341	\N	29554	\N
37531	GENERIC_DAY	1	1	2010-05-12	1341	\N	29554	\N
37532	GENERIC_DAY	1	1	2010-05-10	1322	\N	29554	\N
37533	GENERIC_DAY	1	0	2010-04-10	1314	\N	29554	\N
37534	GENERIC_DAY	1	0	2010-05-09	1341	\N	29554	\N
37535	GENERIC_DAY	1	1	2010-05-05	1341	\N	29554	\N
37536	GENERIC_DAY	1	1	2010-04-28	1314	\N	29554	\N
37537	GENERIC_DAY	1	1	2010-03-24	1341	\N	29554	\N
37538	GENERIC_DAY	1	0	2010-03-06	1326	\N	29554	\N
37539	GENERIC_DAY	1	0	2010-02-27	1330	\N	29554	\N
37540	GENERIC_DAY	1	2	2010-03-18	1330	\N	29554	\N
37541	GENERIC_DAY	1	0	2010-03-21	1314	\N	29554	\N
37542	GENERIC_DAY	1	0	2010-03-27	1341	\N	29554	\N
37543	GENERIC_DAY	1	1	2010-03-09	1328	\N	29554	\N
37544	GENERIC_DAY	1	0	2010-04-18	1326	\N	29554	\N
37545	GENERIC_DAY	1	2	2010-04-21	1326	\N	29554	\N
37546	GENERIC_DAY	1	2	2010-04-09	1326	\N	29554	\N
37547	GENERIC_DAY	1	1	2010-05-05	1314	\N	29554	\N
37548	GENERIC_DAY	1	1	2010-03-17	1341	\N	29554	\N
37549	GENERIC_DAY	1	0	2010-04-01	1330	\N	29554	\N
37550	GENERIC_DAY	1	0	2010-04-03	1326	\N	29554	\N
37551	GENERIC_DAY	1	1	2010-03-25	1322	\N	29554	\N
37552	GENERIC_DAY	1	1	2010-05-12	1330	\N	29554	\N
37553	GENERIC_DAY	1	0	2010-04-18	1314	\N	29554	\N
37554	GENERIC_DAY	1	0	2010-04-02	1328	\N	29554	\N
37555	GENERIC_DAY	1	1	2010-03-31	1330	\N	29554	\N
37556	GENERIC_DAY	1	1	2010-05-14	1341	\N	29554	\N
37557	GENERIC_DAY	1	0	2010-04-25	1328	\N	29554	\N
37558	GENERIC_DAY	1	1	2010-03-26	1314	\N	29554	\N
37559	GENERIC_DAY	1	2	2010-03-22	1330	\N	29554	\N
37560	GENERIC_DAY	1	1	2010-03-22	1314	\N	29554	\N
37561	GENERIC_DAY	1	2	2010-04-21	1328	\N	29554	\N
37562	GENERIC_DAY	1	1	2010-05-04	1341	\N	29554	\N
37563	GENERIC_DAY	1	0	2010-03-21	1341	\N	29554	\N
37564	GENERIC_DAY	1	2	2010-04-29	1328	\N	29554	\N
37565	GENERIC_DAY	1	1	2010-03-26	1341	\N	29554	\N
37566	GENERIC_DAY	1	1	2010-03-11	1326	\N	29554	\N
37567	GENERIC_DAY	1	1	2010-04-27	1341	\N	29554	\N
37568	GENERIC_DAY	1	1	2010-04-15	1322	\N	29554	\N
37569	GENERIC_DAY	1	0	2010-03-27	1326	\N	29554	\N
37570	GENERIC_DAY	1	1	2010-04-08	1330	\N	29554	\N
37571	GENERIC_DAY	1	1	2010-04-13	1341	\N	29554	\N
37572	GENERIC_DAY	1	2	2010-04-13	1326	\N	29554	\N
37573	GENERIC_DAY	1	0	2010-05-09	1330	\N	29554	\N
37574	GENERIC_DAY	1	0	2010-04-17	1314	\N	29554	\N
37575	GENERIC_DAY	1	1	2010-04-21	1322	\N	29554	\N
37576	GENERIC_DAY	1	1	2010-03-23	1322	\N	29554	\N
37577	GENERIC_DAY	1	0	2010-03-07	1314	\N	29554	\N
37578	GENERIC_DAY	1	1	2010-04-07	1330	\N	29554	\N
37579	GENERIC_DAY	1	1	2010-04-09	1341	\N	29554	\N
37580	GENERIC_DAY	1	1	2010-05-11	1322	\N	29554	\N
37581	GENERIC_DAY	1	0	2010-03-28	1326	\N	29554	\N
37582	GENERIC_DAY	1	0	2010-03-27	1314	\N	29554	\N
37583	GENERIC_DAY	1	0	2010-05-08	1341	\N	29554	\N
37584	GENERIC_DAY	1	2	2010-05-04	1326	\N	29554	\N
37585	GENERIC_DAY	1	1	2010-04-07	1341	\N	29554	\N
37586	GENERIC_DAY	1	0	2010-04-17	1341	\N	29554	\N
37587	GENERIC_DAY	1	2	2010-04-20	1326	\N	29554	\N
37588	GENERIC_DAY	1	1	2010-03-29	1314	\N	29554	\N
37589	GENERIC_DAY	1	2	2010-03-10	1330	\N	29554	\N
37590	GENERIC_DAY	1	0	2010-03-13	1341	\N	29554	\N
37591	GENERIC_DAY	1	0	2010-03-19	1330	\N	29554	\N
37592	GENERIC_DAY	1	0	2010-03-06	1328	\N	29554	\N
37593	GENERIC_DAY	1	1	2010-04-28	1341	\N	29554	\N
37594	GENERIC_DAY	1	1	2010-04-23	1330	\N	29554	\N
37595	GENERIC_DAY	1	1	2010-03-09	1341	\N	29554	\N
37596	GENERIC_DAY	1	1	2010-03-10	1326	\N	29554	\N
37597	GENERIC_DAY	1	1	2010-03-17	1314	\N	29554	\N
37598	GENERIC_DAY	1	0	2010-04-05	1326	\N	29554	\N
37599	GENERIC_DAY	1	0	2010-05-09	1326	\N	29554	\N
37600	GENERIC_DAY	1	0	2010-04-18	1322	\N	29554	\N
37601	GENERIC_DAY	1	1	2010-04-21	1341	\N	29554	\N
37602	GENERIC_DAY	1	0	2010-04-25	1326	\N	29554	\N
37603	GENERIC_DAY	1	1	2010-04-28	1330	\N	29554	\N
37604	GENERIC_DAY	1	0	2010-04-05	1328	\N	29554	\N
37605	GENERIC_DAY	1	1	2010-03-25	1314	\N	29554	\N
37606	GENERIC_DAY	1	1	2010-03-03	1326	\N	29554	\N
37607	GENERIC_DAY	1	1	2010-03-31	1314	\N	29554	\N
37608	GENERIC_DAY	1	2	2010-03-09	1314	\N	29554	\N
37609	GENERIC_DAY	1	1	2010-05-12	1322	\N	29554	\N
37610	GENERIC_DAY	1	2	2010-04-19	1328	\N	29554	\N
37611	GENERIC_DAY	1	2	2010-04-23	1326	\N	29554	\N
37612	GENERIC_DAY	1	2	2010-05-11	1326	\N	29554	\N
37613	GENERIC_DAY	1	1	2010-03-08	1326	\N	29554	\N
37614	GENERIC_DAY	1	2	2010-03-23	1326	\N	29554	\N
37615	GENERIC_DAY	1	2	2010-05-03	1328	\N	29554	\N
37616	GENERIC_DAY	1	0	2010-03-28	1328	\N	29554	\N
37617	GENERIC_DAY	1	1	2010-04-21	1330	\N	29554	\N
37618	GENERIC_DAY	1	2	2010-03-25	1328	\N	29554	\N
37619	GENERIC_DAY	1	1	2010-05-05	1322	\N	29554	\N
37620	GENERIC_DAY	1	1	2010-04-20	1314	\N	29554	\N
37621	GENERIC_DAY	1	2	2010-05-06	1326	\N	29554	\N
37622	GENERIC_DAY	1	1	2010-04-13	1314	\N	29554	\N
37623	GENERIC_DAY	1	0	2010-02-27	1328	\N	29554	\N
37624	GENERIC_DAY	1	0	2010-02-28	1330	\N	29554	\N
37625	GENERIC_DAY	1	0	2010-03-21	1326	\N	29554	\N
37626	GENERIC_DAY	1	1	2010-04-06	1314	\N	29554	\N
37627	GENERIC_DAY	1	2	2010-03-16	1328	\N	29554	\N
37628	GENERIC_DAY	1	1	2010-03-24	1330	\N	29554	\N
37629	GENERIC_DAY	1	1	2010-03-31	1322	\N	29554	\N
37630	GENERIC_DAY	1	0	2010-05-01	1314	\N	29554	\N
37631	GENERIC_DAY	1	1	2010-03-12	1314	\N	29554	\N
37632	GENERIC_DAY	1	0	2010-05-08	1328	\N	29554	\N
37633	GENERIC_DAY	1	1	2010-04-16	1330	\N	29554	\N
37634	GENERIC_DAY	1	0	2010-05-02	1341	\N	29554	\N
37635	GENERIC_DAY	1	2	2010-04-26	1326	\N	29554	\N
37636	GENERIC_DAY	1	1	2010-04-23	1322	\N	29554	\N
37637	GENERIC_DAY	1	2	2010-05-12	1326	\N	29554	\N
37638	GENERIC_DAY	1	0	2010-03-19	1341	\N	29554	\N
37639	GENERIC_DAY	1	0	2010-04-01	1314	\N	29554	\N
37640	GENERIC_DAY	1	1	2010-04-14	1341	\N	29554	\N
37641	GENERIC_DAY	1	0	2010-03-20	1326	\N	29554	\N
37642	GENERIC_DAY	1	2	2010-03-26	1326	\N	29554	\N
37643	GENERIC_DAY	1	1	2010-03-04	1322	\N	29554	\N
37644	GENERIC_DAY	1	0	2010-04-25	1330	\N	29554	\N
37645	GENERIC_DAY	1	1	2010-03-01	1326	\N	29554	\N
37646	GENERIC_DAY	1	1	2010-03-08	1322	\N	29554	\N
37647	GENERIC_DAY	1	1	2010-03-12	1326	\N	29554	\N
37648	GENERIC_DAY	1	0	2010-04-17	1330	\N	29554	\N
37649	GENERIC_DAY	1	1	2010-03-17	1322	\N	29554	\N
37650	GENERIC_DAY	1	2	2010-03-02	1314	\N	29554	\N
37651	GENERIC_DAY	1	1	2010-03-25	1330	\N	29554	\N
37652	GENERIC_DAY	1	1	2010-04-26	1322	\N	29554	\N
37653	GENERIC_DAY	1	0	2010-04-24	1330	\N	29554	\N
37654	GENERIC_DAY	1	0	2010-03-13	1314	\N	29554	\N
37655	GENERIC_DAY	1	1	2010-04-27	1314	\N	29554	\N
37656	GENERIC_DAY	1	0	2010-04-04	1341	\N	29554	\N
37657	GENERIC_DAY	1	1	2010-03-18	1322	\N	29554	\N
37658	GENERIC_DAY	1	0	2010-04-18	1328	\N	29554	\N
37659	GENERIC_DAY	1	2	2010-03-29	1326	\N	29554	\N
37660	GENERIC_DAY	1	0	2010-03-28	1330	\N	29554	\N
37661	GENERIC_DAY	1	0	2010-03-13	1328	\N	29554	\N
37662	GENERIC_DAY	1	1	2010-04-19	1341	\N	29554	\N
37663	GENERIC_DAY	1	1	2010-05-10	1341	\N	29554	\N
37664	GENERIC_DAY	1	0	2010-05-02	1314	\N	29554	\N
37665	GENERIC_DAY	1	1	2010-04-12	1322	\N	29554	\N
37666	GENERIC_DAY	1	2	2010-03-12	1328	\N	29554	\N
37667	GENERIC_DAY	1	0	2010-05-08	1330	\N	29554	\N
37668	GENERIC_DAY	1	1	2010-03-22	1341	\N	29554	\N
37669	GENERIC_DAY	1	1	2010-05-13	1314	\N	29554	\N
37670	GENERIC_DAY	1	1	2010-03-29	1330	\N	29554	\N
37671	GENERIC_DAY	1	2	2010-03-12	1330	\N	29554	\N
37672	GENERIC_DAY	1	0	2010-03-07	1328	\N	29554	\N
37673	GENERIC_DAY	1	1	2010-03-09	1330	\N	29554	\N
37674	GENERIC_DAY	1	2	2010-03-24	1328	\N	29554	\N
37675	GENERIC_DAY	1	2	2010-03-31	1326	\N	29554	\N
37676	GENERIC_DAY	1	0	2010-04-25	1314	\N	29554	\N
37677	GENERIC_DAY	1	2	2010-05-12	1328	\N	29554	\N
37678	GENERIC_DAY	1	2	2010-03-16	1330	\N	29554	\N
37679	GENERIC_DAY	1	1	2010-03-16	1322	\N	29554	\N
37680	GENERIC_DAY	1	1	2010-03-03	1322	\N	29554	\N
37681	GENERIC_DAY	1	1	2010-04-19	1322	\N	29554	\N
37682	GENERIC_DAY	1	1	2010-05-06	1330	\N	29554	\N
37683	GENERIC_DAY	1	0	2010-04-11	1328	\N	29554	\N
37684	GENERIC_DAY	1	1	2010-03-02	1330	\N	29554	\N
37685	GENERIC_DAY	1	2	2010-05-10	1328	\N	29554	\N
37686	GENERIC_DAY	1	1	2010-05-03	1341	\N	29554	\N
37687	GENERIC_DAY	1	0	2010-03-14	1328	\N	29554	\N
37688	GENERIC_DAY	1	1	2010-05-11	1330	\N	29554	\N
37689	GENERIC_DAY	1	0	2010-03-21	1330	\N	29554	\N
37690	GENERIC_DAY	1	1	2010-03-15	1314	\N	29554	\N
37691	GENERIC_DAY	1	1	2010-05-13	1341	\N	29554	\N
37692	GENERIC_DAY	1	1	2010-03-25	1341	\N	29554	\N
37693	GENERIC_DAY	1	0	2010-03-14	1314	\N	29554	\N
37694	GENERIC_DAY	1	1	2010-04-13	1330	\N	29554	\N
37695	GENERIC_DAY	1	1	2010-05-14	1326	\N	29554	\N
37696	GENERIC_DAY	1	2	2010-03-08	1341	\N	29554	\N
37697	GENERIC_DAY	1	2	2010-05-13	1328	\N	29554	\N
37698	GENERIC_DAY	1	1	2010-03-11	1322	\N	29554	\N
25136	SPECIFIC_DAY	0	0	2010-01-17	1326	11904	\N	\N
25137	SPECIFIC_DAY	0	6	2010-01-15	1326	11904	\N	\N
25138	SPECIFIC_DAY	0	6	2010-01-13	1326	11904	\N	\N
25139	SPECIFIC_DAY	0	0	2010-01-16	1326	11904	\N	\N
25140	SPECIFIC_DAY	0	6	2010-01-14	1326	11904	\N	\N
25141	SPECIFIC_DAY	0	6	2010-01-18	1326	11904	\N	\N
25142	SPECIFIC_DAY	0	6	2010-01-19	1326	11905	\N	\N
25143	SPECIFIC_DAY	0	6	2010-01-20	1326	11905	\N	\N
25144	SPECIFIC_DAY	0	6	2010-01-21	1326	11905	\N	\N
25145	SPECIFIC_DAY	0	6	2010-01-22	1326	11905	\N	\N
25146	SPECIFIC_DAY	0	0	2009-12-20	1326	11906	\N	\N
25147	SPECIFIC_DAY	0	6	2009-12-16	1326	11906	\N	\N
25148	SPECIFIC_DAY	0	6	2009-12-18	1326	11906	\N	\N
25553	SPECIFIC_DAY	0	0	2009-12-19	1326	11906	\N	\N
25554	SPECIFIC_DAY	0	6	2009-12-21	1326	11906	\N	\N
25555	SPECIFIC_DAY	0	6	2009-12-17	1326	11906	\N	\N
25556	SPECIFIC_DAY	0	6	2010-01-01	1326	11907	\N	\N
25557	SPECIFIC_DAY	0	6	2010-01-06	1326	11907	\N	\N
25558	SPECIFIC_DAY	0	0	2010-01-03	1326	11907	\N	\N
25559	SPECIFIC_DAY	0	6	2010-01-05	1326	11907	\N	\N
25560	SPECIFIC_DAY	0	6	2010-01-04	1326	11907	\N	\N
25561	SPECIFIC_DAY	0	0	2010-01-02	1326	11907	\N	\N
25562	SPECIFIC_DAY	0	6	2009-12-24	1326	11908	\N	\N
25563	SPECIFIC_DAY	0	6	2009-12-25	1326	11908	\N	\N
25564	SPECIFIC_DAY	0	6	2009-12-23	1326	11908	\N	\N
25565	SPECIFIC_DAY	0	6	2009-12-22	1326	11908	\N	\N
25566	SPECIFIC_DAY	0	0	2009-12-26	1326	11909	\N	\N
25567	SPECIFIC_DAY	0	0	2009-12-27	1326	11909	\N	\N
25568	SPECIFIC_DAY	0	6	2009-12-31	1326	11909	\N	\N
25569	SPECIFIC_DAY	0	6	2009-12-30	1326	11909	\N	\N
25570	SPECIFIC_DAY	0	6	2009-12-29	1326	11909	\N	\N
25571	SPECIFIC_DAY	0	6	2009-12-28	1326	11909	\N	\N
25572	SPECIFIC_DAY	0	6	2010-01-07	1326	11910	\N	\N
25573	SPECIFIC_DAY	0	6	2010-01-12	1326	11910	\N	\N
25574	SPECIFIC_DAY	0	0	2010-01-09	1326	11910	\N	\N
25575	SPECIFIC_DAY	0	0	2010-01-10	1326	11910	\N	\N
25576	SPECIFIC_DAY	0	6	2010-01-11	1326	11910	\N	\N
25577	SPECIFIC_DAY	0	6	2010-01-08	1326	11910	\N	\N
25578	SPECIFIC_DAY	0	2	2010-01-11	1314	10634	\N	\N
25579	SPECIFIC_DAY	0	2	2010-01-06	1314	10634	\N	\N
25580	SPECIFIC_DAY	0	2	2010-01-21	1314	10634	\N	\N
25581	SPECIFIC_DAY	0	0	2010-01-16	1314	10634	\N	\N
25582	SPECIFIC_DAY	0	0	2010-01-09	1314	10634	\N	\N
25583	SPECIFIC_DAY	0	2	2010-01-15	1314	10634	\N	\N
25584	SPECIFIC_DAY	0	0	2010-01-17	1314	10634	\N	\N
25585	SPECIFIC_DAY	0	2	2010-01-19	1314	10634	\N	\N
25586	SPECIFIC_DAY	0	2	2010-01-13	1314	10634	\N	\N
25587	SPECIFIC_DAY	0	0	2010-01-10	1314	10634	\N	\N
25588	SPECIFIC_DAY	0	2	2010-01-14	1314	10634	\N	\N
25589	SPECIFIC_DAY	0	2	2010-01-12	1314	10634	\N	\N
25590	SPECIFIC_DAY	0	2	2010-01-08	1314	10634	\N	\N
25591	SPECIFIC_DAY	0	2	2010-01-18	1314	10634	\N	\N
25592	SPECIFIC_DAY	0	2	2010-01-20	1314	10634	\N	\N
25593	SPECIFIC_DAY	0	2	2010-01-07	1314	10634	\N	\N
25594	SPECIFIC_DAY	0	2	2009-12-30	1314	10635	\N	\N
25595	SPECIFIC_DAY	0	2	2009-12-25	1314	10635	\N	\N
25596	SPECIFIC_DAY	0	0	2010-01-02	1314	10635	\N	\N
25597	SPECIFIC_DAY	0	2	2009-12-24	1314	10635	\N	\N
25598	SPECIFIC_DAY	0	2	2009-12-29	1314	10635	\N	\N
25599	SPECIFIC_DAY	0	0	2010-01-03	1314	10635	\N	\N
25600	SPECIFIC_DAY	0	0	2009-12-27	1314	10635	\N	\N
25601	SPECIFIC_DAY	0	2	2009-12-22	1314	10635	\N	\N
25602	SPECIFIC_DAY	0	0	2009-12-26	1314	10635	\N	\N
25603	SPECIFIC_DAY	0	2	2009-12-23	1314	10635	\N	\N
25604	SPECIFIC_DAY	0	0	2009-12-19	1314	10635	\N	\N
25605	SPECIFIC_DAY	0	2	2010-01-04	1314	10635	\N	\N
25606	SPECIFIC_DAY	0	2	2009-12-31	1314	10635	\N	\N
25607	SPECIFIC_DAY	0	2	2010-01-05	1314	10635	\N	\N
25608	SPECIFIC_DAY	0	2	2009-12-21	1314	10635	\N	\N
25609	SPECIFIC_DAY	0	2	2009-12-28	1314	10635	\N	\N
25610	SPECIFIC_DAY	0	0	2009-12-20	1314	10635	\N	\N
25611	SPECIFIC_DAY	0	2	2010-01-01	1314	10635	\N	\N
25612	SPECIFIC_DAY	0	8	2009-12-16	1330	10619	\N	\N
25613	SPECIFIC_DAY	0	8	2009-12-15	1330	10619	\N	\N
25614	SPECIFIC_DAY	0	8	2009-12-18	1330	10620	\N	\N
25615	SPECIFIC_DAY	0	8	2009-12-17	1330	10620	\N	\N
25616	SPECIFIC_DAY	0	0	2009-12-20	1330	10621	\N	\N
25617	SPECIFIC_DAY	0	8	2009-12-22	1330	10621	\N	\N
25618	SPECIFIC_DAY	0	8	2009-12-25	1330	10621	\N	\N
25619	SPECIFIC_DAY	0	8	2009-12-24	1330	10621	\N	\N
25620	SPECIFIC_DAY	0	0	2009-12-19	1330	10621	\N	\N
25621	SPECIFIC_DAY	0	8	2009-12-21	1330	10621	\N	\N
25622	SPECIFIC_DAY	0	8	2009-12-23	1330	10621	\N	\N
25623	SPECIFIC_DAY	0	8	2010-02-02	1341	10665	\N	\N
25624	SPECIFIC_DAY	0	8	2010-02-03	1341	10665	\N	\N
25625	SPECIFIC_DAY	0	0	2010-01-30	1341	10665	\N	\N
25626	SPECIFIC_DAY	0	8	2010-02-01	1341	10665	\N	\N
25627	SPECIFIC_DAY	0	0	2010-01-31	1341	10665	\N	\N
25628	SPECIFIC_DAY	0	0	2010-01-10	1341	10666	\N	\N
25629	SPECIFIC_DAY	0	8	2010-01-08	1341	10666	\N	\N
25630	SPECIFIC_DAY	0	8	2010-01-12	1341	10666	\N	\N
25631	SPECIFIC_DAY	0	0	2010-01-09	1341	10666	\N	\N
25632	SPECIFIC_DAY	0	8	2010-01-07	1341	10666	\N	\N
25633	SPECIFIC_DAY	0	8	2010-01-13	1341	10666	\N	\N
25634	SPECIFIC_DAY	0	8	2010-01-06	1341	10666	\N	\N
25635	SPECIFIC_DAY	0	8	2010-01-11	1341	10666	\N	\N
25636	SPECIFIC_DAY	0	0	2010-01-23	1341	10667	\N	\N
25637	SPECIFIC_DAY	0	8	2010-01-25	1341	10667	\N	\N
25638	SPECIFIC_DAY	0	0	2010-01-24	1341	10667	\N	\N
25639	SPECIFIC_DAY	0	4	2010-01-28	1341	10667	\N	\N
25640	SPECIFIC_DAY	0	8	2010-01-27	1341	10667	\N	\N
25641	SPECIFIC_DAY	0	8	2010-01-26	1341	10667	\N	\N
25642	SPECIFIC_DAY	0	8	2009-12-24	1341	10649	\N	\N
25643	SPECIFIC_DAY	0	8	2009-12-25	1341	10649	\N	\N
25644	SPECIFIC_DAY	0	0	2009-12-26	1341	10649	\N	\N
25645	SPECIFIC_DAY	0	8	2009-12-28	1341	10649	\N	\N
25646	SPECIFIC_DAY	0	8	2009-12-29	1341	10649	\N	\N
25647	SPECIFIC_DAY	0	8	2009-12-23	1341	10649	\N	\N
25648	SPECIFIC_DAY	0	8	2009-12-22	1341	10649	\N	\N
25649	SPECIFIC_DAY	0	0	2009-12-27	1341	10649	\N	\N
25650	SPECIFIC_DAY	0	8	2009-12-30	1341	10649	\N	\N
25651	SPECIFIC_DAY	0	8	2009-12-31	1328	10684	\N	\N
25652	SPECIFIC_DAY	0	0	2009-12-27	1328	10684	\N	\N
25653	SPECIFIC_DAY	0	8	2009-12-28	1328	10684	\N	\N
25654	SPECIFIC_DAY	0	0	2009-12-26	1328	10684	\N	\N
25655	SPECIFIC_DAY	0	8	2010-01-01	1328	10684	\N	\N
25656	SPECIFIC_DAY	0	8	2009-12-30	1328	10684	\N	\N
25657	SPECIFIC_DAY	0	8	2009-12-29	1328	10684	\N	\N
25658	SPECIFIC_DAY	0	0	2010-01-03	1328	10682	\N	\N
25659	SPECIFIC_DAY	0	8	2010-01-08	1328	10682	\N	\N
25660	SPECIFIC_DAY	0	8	2010-01-04	1328	10682	\N	\N
25661	SPECIFIC_DAY	0	0	2010-01-02	1328	10682	\N	\N
25662	SPECIFIC_DAY	0	8	2010-01-07	1328	10682	\N	\N
25663	SPECIFIC_DAY	0	8	2010-01-05	1328	10682	\N	\N
25664	SPECIFIC_DAY	0	8	2010-01-06	1328	10682	\N	\N
25665	SPECIFIC_DAY	0	8	2010-01-06	1330	10623	\N	\N
25666	SPECIFIC_DAY	0	8	2009-12-29	1330	10623	\N	\N
25667	SPECIFIC_DAY	0	8	2010-01-01	1330	10623	\N	\N
25668	SPECIFIC_DAY	0	0	2009-12-26	1330	10623	\N	\N
25669	SPECIFIC_DAY	0	8	2009-12-28	1330	10623	\N	\N
25670	SPECIFIC_DAY	0	0	2010-01-02	1330	10623	\N	\N
25671	SPECIFIC_DAY	0	8	2010-01-04	1330	10623	\N	\N
25672	SPECIFIC_DAY	0	8	2009-12-31	1330	10623	\N	\N
25673	SPECIFIC_DAY	0	0	2009-12-27	1330	10623	\N	\N
25674	SPECIFIC_DAY	0	8	2009-12-30	1330	10623	\N	\N
25675	SPECIFIC_DAY	0	8	2010-01-05	1330	10623	\N	\N
25676	SPECIFIC_DAY	0	0	2010-01-03	1330	10623	\N	\N
37699	GENERIC_DAY	1	1	2010-03-18	1314	\N	29554	\N
37700	GENERIC_DAY	1	1	2010-04-16	1322	\N	29554	\N
37701	GENERIC_DAY	1	0	2010-03-14	1330	\N	29554	\N
37702	GENERIC_DAY	1	2	2010-04-30	1326	\N	29554	\N
37703	GENERIC_DAY	1	0	2010-03-27	1322	\N	29554	\N
37704	GENERIC_DAY	1	0	2010-04-17	1328	\N	29554	\N
37705	GENERIC_DAY	1	2	2010-04-27	1326	\N	29554	\N
37706	GENERIC_DAY	1	1	2010-05-07	1322	\N	29554	\N
37707	GENERIC_DAY	1	2	2010-03-31	1328	\N	29554	\N
37708	GENERIC_DAY	1	2	2010-03-15	1328	\N	29554	\N
37709	GENERIC_DAY	1	1	2010-04-14	1322	\N	29554	\N
37710	GENERIC_DAY	1	1	2010-04-22	1330	\N	29554	\N
37711	GENERIC_DAY	1	0	2010-05-08	1326	\N	29554	\N
37712	GENERIC_DAY	1	1	2010-03-02	1322	\N	29554	\N
37713	GENERIC_DAY	1	1	2010-05-03	1330	\N	29554	\N
37714	GENERIC_DAY	1	2	2010-04-09	1328	\N	29554	\N
37715	GENERIC_DAY	1	1	2010-04-26	1314	\N	29554	\N
37716	GENERIC_DAY	1	0	2010-03-06	1341	\N	29554	\N
37717	GENERIC_DAY	1	1	2010-04-08	1322	\N	29554	\N
37718	GENERIC_DAY	1	0	2010-03-27	1330	\N	29554	\N
37719	GENERIC_DAY	1	0	2010-05-02	1328	\N	29554	\N
37720	GENERIC_DAY	1	2	2010-04-12	1326	\N	29554	\N
37721	GENERIC_DAY	1	2	2010-04-16	1328	\N	29554	\N
25677	SPECIFIC_DAY	0	8	2010-01-04	1322	11821	\N	\N
25678	SPECIFIC_DAY	0	0	2010-01-03	1322	11821	\N	\N
25679	SPECIFIC_DAY	0	8	2010-01-01	1322	11821	\N	\N
25680	SPECIFIC_DAY	0	0	2010-01-02	1322	11821	\N	\N
25681	SPECIFIC_DAY	0	8	2010-01-07	1322	11822	\N	\N
25682	SPECIFIC_DAY	0	8	2010-01-05	1322	11822	\N	\N
25683	SPECIFIC_DAY	0	8	2010-01-06	1322	11822	\N	\N
25684	SPECIFIC_DAY	0	8	2010-01-08	1322	11822	\N	\N
25685	SPECIFIC_DAY	0	8	2010-01-12	1322	11823	\N	\N
25686	SPECIFIC_DAY	0	8	2010-01-11	1322	11823	\N	\N
25687	SPECIFIC_DAY	0	8	2010-01-15	1322	11823	\N	\N
25688	SPECIFIC_DAY	0	8	2010-01-14	1322	11823	\N	\N
25689	SPECIFIC_DAY	0	0	2010-01-10	1322	11823	\N	\N
25690	SPECIFIC_DAY	0	0	2010-01-09	1322	11823	\N	\N
25691	SPECIFIC_DAY	0	8	2010-01-13	1322	11823	\N	\N
25692	SPECIFIC_DAY	0	8	2010-01-19	1322	11824	\N	\N
25693	SPECIFIC_DAY	0	0	2010-01-16	1322	11824	\N	\N
25694	SPECIFIC_DAY	0	8	2010-01-18	1322	11824	\N	\N
25695	SPECIFIC_DAY	0	0	2010-01-17	1322	11824	\N	\N
25696	SPECIFIC_DAY	0	8	2010-01-20	1322	11825	\N	\N
25697	SPECIFIC_DAY	0	0	2010-01-24	1322	11825	\N	\N
25698	SPECIFIC_DAY	0	8	2010-01-21	1322	11825	\N	\N
25699	SPECIFIC_DAY	0	8	2010-01-25	1322	11825	\N	\N
25700	SPECIFIC_DAY	0	0	2010-01-23	1322	11825	\N	\N
25701	SPECIFIC_DAY	0	8	2010-01-22	1322	11825	\N	\N
25702	SPECIFIC_DAY	0	8	2009-12-23	1328	10681	\N	\N
25703	SPECIFIC_DAY	0	8	2009-12-24	1328	10681	\N	\N
25704	SPECIFIC_DAY	0	8	2009-12-22	1328	10681	\N	\N
25705	SPECIFIC_DAY	0	8	2009-12-25	1328	10681	\N	\N
25706	SPECIFIC_DAY	0	8	2010-01-04	1341	10650	\N	\N
25707	SPECIFIC_DAY	0	0	2010-01-03	1341	10650	\N	\N
25708	SPECIFIC_DAY	0	8	2010-01-01	1341	10650	\N	\N
25709	SPECIFIC_DAY	0	8	2010-01-05	1341	10650	\N	\N
25710	SPECIFIC_DAY	0	8	2009-12-31	1341	10650	\N	\N
25711	SPECIFIC_DAY	0	0	2010-01-02	1341	10650	\N	\N
25712	SPECIFIC_DAY	0	8	2010-01-14	1341	10668	\N	\N
25713	SPECIFIC_DAY	0	8	2010-01-19	1341	10668	\N	\N
25714	SPECIFIC_DAY	0	0	2010-01-17	1341	10668	\N	\N
25715	SPECIFIC_DAY	0	8	2010-01-18	1341	10668	\N	\N
25716	SPECIFIC_DAY	0	0	2010-01-16	1341	10668	\N	\N
25717	SPECIFIC_DAY	0	8	2010-01-15	1341	10668	\N	\N
25718	SPECIFIC_DAY	0	8	2010-01-20	1341	10669	\N	\N
25719	SPECIFIC_DAY	0	8	2010-01-21	1341	10669	\N	\N
25720	SPECIFIC_DAY	0	8	2010-01-22	1341	10669	\N	\N
37722	GENERIC_DAY	1	0	2010-04-11	1330	\N	29554	\N
37723	GENERIC_DAY	1	0	2010-04-05	1314	\N	29554	\N
37724	GENERIC_DAY	1	2	2010-04-20	1328	\N	29554	\N
37725	GENERIC_DAY	1	0	2010-03-13	1326	\N	29554	\N
37726	GENERIC_DAY	1	2	2010-03-24	1326	\N	29554	\N
37727	GENERIC_DAY	1	1	2010-03-08	1330	\N	29554	\N
37728	GENERIC_DAY	1	1	2010-03-10	1341	\N	29554	\N
37729	GENERIC_DAY	1	0	2010-03-20	1328	\N	29554	\N
37730	GENERIC_DAY	1	2	2010-03-30	1326	\N	29554	\N
37731	GENERIC_DAY	1	1	2010-03-16	1326	\N	29554	\N
37732	GENERIC_DAY	1	1	2010-03-15	1341	\N	29554	\N
37733	GENERIC_DAY	1	1	2010-03-18	1341	\N	29554	\N
37734	GENERIC_DAY	1	1	2010-04-27	1322	\N	29554	\N
37735	GENERIC_DAY	1	0	2010-05-01	1341	\N	29554	\N
37736	GENERIC_DAY	1	2	2010-03-23	1328	\N	29554	\N
37737	GENERIC_DAY	1	1	2010-04-20	1341	\N	29554	\N
37738	GENERIC_DAY	1	2	2010-05-05	1326	\N	29554	\N
37739	GENERIC_DAY	1	2	2010-05-10	1326	\N	29554	\N
37740	GENERIC_DAY	1	0	2010-04-03	1328	\N	29554	\N
37741	GENERIC_DAY	1	1	2010-05-05	1330	\N	29554	\N
37742	GENERIC_DAY	1	0	2010-04-04	1330	\N	29554	\N
37743	GENERIC_DAY	1	1	2010-03-24	1314	\N	29554	\N
37744	GENERIC_DAY	1	0	2010-05-08	1314	\N	29554	\N
37745	GENERIC_DAY	1	2	2010-04-26	1328	\N	29554	\N
37746	GENERIC_DAY	1	1	2010-04-30	1314	\N	29554	\N
37747	GENERIC_DAY	1	2	2010-04-16	1326	\N	29554	\N
37748	GENERIC_DAY	1	1	2010-05-04	1330	\N	29554	\N
37749	GENERIC_DAY	1	1	2010-03-01	1328	\N	29554	\N
37750	GENERIC_DAY	1	0	2010-03-20	1322	\N	29554	\N
37751	GENERIC_DAY	1	0	2010-04-05	1341	\N	29554	\N
37752	GENERIC_DAY	1	1	2010-04-29	1322	\N	29554	\N
37753	GENERIC_DAY	1	1	2010-02-11	1341	\N	29555	\N
37754	GENERIC_DAY	1	0	2010-02-07	1322	\N	29555	\N
37755	GENERIC_DAY	1	1	2010-02-08	1314	\N	29555	\N
37756	GENERIC_DAY	1	2	2010-02-03	1322	\N	29555	\N
37757	GENERIC_DAY	1	1	2010-02-08	1341	\N	29555	\N
37758	GENERIC_DAY	1	1	2010-02-03	1328	\N	29555	\N
37759	GENERIC_DAY	1	0	2010-02-06	1322	\N	29555	\N
37760	GENERIC_DAY	1	1	2010-02-05	1322	\N	29555	\N
37761	GENERIC_DAY	1	0	2010-02-06	1326	\N	29555	\N
37762	GENERIC_DAY	1	1	2010-02-08	1328	\N	29555	\N
37763	GENERIC_DAY	1	1	2010-02-02	1328	\N	29555	\N
37764	GENERIC_DAY	1	1	2010-02-09	1328	\N	29555	\N
37765	GENERIC_DAY	1	2	2010-02-08	1322	\N	29555	\N
37766	GENERIC_DAY	1	1	2010-02-10	1330	\N	29555	\N
37767	GENERIC_DAY	1	2	2010-02-10	1322	\N	29555	\N
37768	GENERIC_DAY	1	1	2010-02-10	1341	\N	29555	\N
37769	GENERIC_DAY	1	2	2010-02-03	1330	\N	29555	\N
37770	GENERIC_DAY	1	1	2010-02-04	1330	\N	29555	\N
37771	GENERIC_DAY	1	1	2010-02-10	1328	\N	29555	\N
37772	GENERIC_DAY	1	1	2010-02-04	1328	\N	29555	\N
37773	GENERIC_DAY	1	2	2010-02-02	1322	\N	29555	\N
37774	GENERIC_DAY	1	2	2010-02-09	1326	\N	29555	\N
37775	GENERIC_DAY	1	1	2010-02-01	1326	\N	29555	\N
37776	GENERIC_DAY	1	2	2010-02-08	1326	\N	29555	\N
37777	GENERIC_DAY	1	1	2010-02-08	1330	\N	29555	\N
37778	GENERIC_DAY	1	2	2010-02-02	1330	\N	29555	\N
37779	GENERIC_DAY	1	0	2010-02-07	1330	\N	29555	\N
37780	GENERIC_DAY	1	0	2010-02-06	1328	\N	29555	\N
37781	GENERIC_DAY	1	1	2010-02-11	1330	\N	29555	\N
37782	GENERIC_DAY	1	2	2010-02-09	1322	\N	29555	\N
37783	GENERIC_DAY	1	1	2010-02-09	1341	\N	29555	\N
37784	GENERIC_DAY	1	2	2010-02-05	1328	\N	29555	\N
37785	GENERIC_DAY	1	2	2010-02-01	1330	\N	29555	\N
37786	GENERIC_DAY	1	1	2010-02-09	1330	\N	29555	\N
37787	GENERIC_DAY	1	1	2010-02-10	1314	\N	29555	\N
37788	GENERIC_DAY	1	0	2010-02-06	1341	\N	29555	\N
37789	GENERIC_DAY	1	1	2010-02-03	1326	\N	29555	\N
37790	GENERIC_DAY	1	0	2010-02-06	1314	\N	29555	\N
37791	GENERIC_DAY	1	1	2010-02-05	1341	\N	29555	\N
37792	GENERIC_DAY	1	2	2010-02-01	1322	\N	29555	\N
37793	GENERIC_DAY	1	1	2010-02-05	1330	\N	29555	\N
37794	GENERIC_DAY	1	0	2010-02-06	1330	\N	29555	\N
37795	GENERIC_DAY	1	2	2010-02-05	1326	\N	29555	\N
37796	GENERIC_DAY	1	1	2010-02-02	1326	\N	29555	\N
37797	GENERIC_DAY	1	2	2010-02-10	1326	\N	29555	\N
37798	GENERIC_DAY	1	2	2010-02-04	1322	\N	29555	\N
37799	GENERIC_DAY	1	0	2010-02-07	1314	\N	29555	\N
37800	GENERIC_DAY	1	2	2010-02-02	1314	\N	29555	\N
37801	GENERIC_DAY	1	0	2010-02-03	1341	\N	29555	\N
37802	GENERIC_DAY	1	0	2010-02-07	1328	\N	29555	\N
37803	GENERIC_DAY	1	1	2010-02-04	1314	\N	29555	\N
37804	GENERIC_DAY	1	1	2010-02-04	1341	\N	29555	\N
37805	GENERIC_DAY	1	1	2010-02-01	1328	\N	29555	\N
37806	GENERIC_DAY	1	2	2010-02-04	1326	\N	29555	\N
37807	GENERIC_DAY	1	1	2010-02-11	1328	\N	29555	\N
37808	GENERIC_DAY	1	2	2010-02-01	1314	\N	29555	\N
37809	GENERIC_DAY	1	0	2010-02-02	1341	\N	29555	\N
37810	GENERIC_DAY	1	1	2010-02-05	1314	\N	29555	\N
37811	GENERIC_DAY	1	0	2010-02-07	1341	\N	29555	\N
37812	GENERIC_DAY	1	1	2010-02-09	1314	\N	29555	\N
37813	GENERIC_DAY	1	0	2010-02-01	1341	\N	29555	\N
37814	GENERIC_DAY	1	1	2010-02-11	1314	\N	29555	\N
37815	GENERIC_DAY	1	2	2010-02-03	1314	\N	29555	\N
37816	GENERIC_DAY	1	0	2010-02-07	1326	\N	29555	\N
37817	GENERIC_DAY	1	1	2010-02-11	1326	\N	29555	\N
37818	GENERIC_DAY	1	1	2010-02-11	1322	\N	29555	\N
37819	GENERIC_DAY	1	0	2010-02-20	1328	\N	29556	\N
37820	GENERIC_DAY	1	1	2010-02-12	1314	\N	29556	\N
37821	GENERIC_DAY	1	1	2010-02-12	1328	\N	29556	\N
37822	GENERIC_DAY	1	0	2010-02-13	1322	\N	29556	\N
37823	GENERIC_DAY	1	0	2010-02-20	1314	\N	29556	\N
37824	GENERIC_DAY	1	1	2010-02-18	1328	\N	29556	\N
37825	GENERIC_DAY	1	0	2010-02-17	1328	\N	29556	\N
37826	GENERIC_DAY	1	0	2010-02-13	1341	\N	29556	\N
37827	GENERIC_DAY	1	0	2010-02-21	1326	\N	29556	\N
37828	GENERIC_DAY	1	1	2010-02-19	1330	\N	29556	\N
37829	GENERIC_DAY	1	1	2010-02-18	1341	\N	29556	\N
37830	GENERIC_DAY	1	0	2010-02-20	1341	\N	29556	\N
37831	GENERIC_DAY	1	2	2010-02-22	1322	\N	29556	\N
37832	GENERIC_DAY	1	1	2010-02-18	1330	\N	29556	\N
37833	GENERIC_DAY	1	2	2010-02-16	1326	\N	29556	\N
37834	GENERIC_DAY	1	0	2010-02-14	1330	\N	29556	\N
37835	GENERIC_DAY	1	0	2010-02-21	1322	\N	29556	\N
37836	GENERIC_DAY	1	0	2010-02-17	1322	\N	29556	\N
37837	GENERIC_DAY	1	1	2010-02-24	1341	\N	29556	\N
37838	GENERIC_DAY	1	1	2010-02-16	1314	\N	29556	\N
37839	GENERIC_DAY	1	2	2010-02-24	1326	\N	29556	\N
37840	GENERIC_DAY	1	1	2010-02-15	1328	\N	29556	\N
37841	GENERIC_DAY	1	0	2010-02-14	1326	\N	29556	\N
37842	GENERIC_DAY	1	1	2010-02-23	1322	\N	29556	\N
37843	GENERIC_DAY	1	0	2010-02-21	1330	\N	29556	\N
37844	GENERIC_DAY	1	1	2010-02-16	1330	\N	29556	\N
37845	GENERIC_DAY	1	2	2010-02-19	1322	\N	29556	\N
37846	GENERIC_DAY	1	1	2010-02-12	1341	\N	29556	\N
37847	GENERIC_DAY	1	0	2010-02-13	1326	\N	29556	\N
37848	GENERIC_DAY	1	1	2010-02-22	1314	\N	29556	\N
37849	GENERIC_DAY	1	0	2010-02-17	1326	\N	29556	\N
37850	GENERIC_DAY	1	2	2010-02-23	1328	\N	29556	\N
37851	GENERIC_DAY	1	1	2010-02-25	1341	\N	29556	\N
37852	GENERIC_DAY	1	1	2010-02-12	1330	\N	29556	\N
37853	GENERIC_DAY	1	1	2010-02-22	1341	\N	29556	\N
37854	GENERIC_DAY	1	1	2010-02-15	1314	\N	29556	\N
37855	GENERIC_DAY	1	0	2010-02-13	1314	\N	29556	\N
37856	GENERIC_DAY	1	1	2010-02-19	1328	\N	29556	\N
37857	GENERIC_DAY	1	1	2010-02-25	1330	\N	29556	\N
37858	GENERIC_DAY	1	2	2010-02-18	1326	\N	29556	\N
37859	GENERIC_DAY	1	1	2010-02-15	1341	\N	29556	\N
37860	GENERIC_DAY	1	2	2010-02-18	1322	\N	29556	\N
37861	GENERIC_DAY	1	1	2010-02-22	1328	\N	29556	\N
37862	GENERIC_DAY	1	0	2010-02-14	1341	\N	29556	\N
37863	GENERIC_DAY	1	0	2010-02-14	1314	\N	29556	\N
37864	GENERIC_DAY	1	1	2010-02-19	1341	\N	29556	\N
37865	GENERIC_DAY	1	1	2010-02-23	1330	\N	29556	\N
37866	GENERIC_DAY	1	2	2010-02-12	1322	\N	29556	\N
37867	GENERIC_DAY	1	0	2010-02-14	1322	\N	29556	\N
37868	GENERIC_DAY	1	0	2010-02-13	1330	\N	29556	\N
37869	GENERIC_DAY	1	1	2010-02-19	1314	\N	29556	\N
37870	GENERIC_DAY	1	0	2010-02-20	1330	\N	29556	\N
37871	GENERIC_DAY	1	0	2010-02-20	1322	\N	29556	\N
37872	GENERIC_DAY	1	2	2010-02-19	1326	\N	29556	\N
37873	GENERIC_DAY	1	1	2010-02-16	1328	\N	29556	\N
37874	GENERIC_DAY	1	1	2010-02-25	1326	\N	29556	\N
37875	GENERIC_DAY	1	1	2010-02-15	1330	\N	29556	\N
37876	GENERIC_DAY	1	0	2010-02-17	1330	\N	29556	\N
37877	GENERIC_DAY	1	2	2010-02-22	1326	\N	29556	\N
37878	GENERIC_DAY	1	1	2010-02-25	1314	\N	29556	\N
37879	GENERIC_DAY	1	1	2010-02-23	1341	\N	29556	\N
37880	GENERIC_DAY	1	0	2010-02-21	1314	\N	29556	\N
37881	GENERIC_DAY	1	0	2010-02-13	1328	\N	29556	\N
37882	GENERIC_DAY	1	2	2010-02-12	1326	\N	29556	\N
37883	GENERIC_DAY	1	2	2010-02-15	1326	\N	29556	\N
37884	GENERIC_DAY	1	1	2010-02-16	1341	\N	29556	\N
37885	GENERIC_DAY	1	1	2010-02-22	1330	\N	29556	\N
37886	GENERIC_DAY	1	0	2010-02-21	1328	\N	29556	\N
37887	GENERIC_DAY	1	1	2010-02-18	1314	\N	29556	\N
37888	GENERIC_DAY	1	1	2010-02-24	1314	\N	29556	\N
37889	GENERIC_DAY	1	0	2010-02-14	1328	\N	29556	\N
37890	GENERIC_DAY	1	0	2010-02-20	1326	\N	29556	\N
37891	GENERIC_DAY	1	2	2010-02-16	1322	\N	29556	\N
37892	GENERIC_DAY	1	0	2010-02-17	1341	\N	29556	\N
37893	GENERIC_DAY	1	1	2010-02-24	1330	\N	29556	\N
37894	GENERIC_DAY	1	1	2010-02-23	1314	\N	29556	\N
37895	GENERIC_DAY	1	1	2010-02-24	1328	\N	29556	\N
37896	GENERIC_DAY	1	0	2010-02-17	1314	\N	29556	\N
37897	GENERIC_DAY	1	1	2010-02-25	1328	\N	29556	\N
37898	GENERIC_DAY	1	2	2010-02-24	1322	\N	29556	\N
37899	GENERIC_DAY	1	2	2010-02-23	1326	\N	29556	\N
37900	GENERIC_DAY	1	2	2010-02-15	1322	\N	29556	\N
37901	GENERIC_DAY	1	0	2010-02-21	1341	\N	29556	\N
37902	GENERIC_DAY	1	1	2010-02-25	1322	\N	29556	\N
37903	GENERIC_DAY	1	1	2010-02-05	1322	\N	29557	\N
37904	GENERIC_DAY	1	2	2010-02-02	1322	\N	29557	\N
37905	GENERIC_DAY	1	2	2010-02-04	1322	\N	29557	\N
37906	GENERIC_DAY	1	0	2010-02-01	1341	\N	29557	\N
37907	GENERIC_DAY	1	2	2010-02-03	1314	\N	29557	\N
37908	GENERIC_DAY	1	1	2010-02-02	1328	\N	29557	\N
37909	GENERIC_DAY	1	2	2010-02-04	1314	\N	29557	\N
37910	GENERIC_DAY	1	2	2010-02-01	1326	\N	29557	\N
37911	GENERIC_DAY	1	1	2010-02-04	1330	\N	29557	\N
37912	GENERIC_DAY	1	2	2010-02-01	1314	\N	29557	\N
37913	GENERIC_DAY	1	1	2010-02-05	1314	\N	29557	\N
37914	GENERIC_DAY	1	0	2010-02-05	1328	\N	29557	\N
37915	GENERIC_DAY	1	2	2010-02-03	1322	\N	29557	\N
37916	GENERIC_DAY	1	1	2010-02-01	1328	\N	29557	\N
37917	GENERIC_DAY	1	2	2010-02-03	1326	\N	29557	\N
37918	GENERIC_DAY	1	1	2010-02-04	1326	\N	29557	\N
37919	GENERIC_DAY	1	2	2010-02-02	1314	\N	29557	\N
37920	GENERIC_DAY	1	2	2010-02-02	1326	\N	29557	\N
37921	GENERIC_DAY	1	1	2010-02-03	1328	\N	29557	\N
37922	GENERIC_DAY	1	0	2010-02-05	1330	\N	29557	\N
37923	GENERIC_DAY	1	1	2010-02-01	1330	\N	29557	\N
37924	GENERIC_DAY	1	2	2010-02-01	1322	\N	29557	\N
37925	GENERIC_DAY	1	1	2010-02-02	1330	\N	29557	\N
37926	GENERIC_DAY	1	1	2010-02-03	1330	\N	29557	\N
37927	GENERIC_DAY	1	0	2010-02-03	1341	\N	29557	\N
37928	GENERIC_DAY	1	0	2010-02-02	1341	\N	29557	\N
37929	GENERIC_DAY	1	1	2010-02-04	1328	\N	29557	\N
37930	GENERIC_DAY	1	1	2010-02-05	1326	\N	29557	\N
37931	GENERIC_DAY	1	0	2010-02-05	1341	\N	29557	\N
37932	GENERIC_DAY	1	1	2010-02-04	1341	\N	29557	\N
37933	GENERIC_DAY	1	0	2010-05-15	1341	\N	29558	\N
37934	GENERIC_DAY	1	1	2010-05-12	1322	\N	29558	\N
37935	GENERIC_DAY	1	1	2010-03-11	1314	\N	29558	\N
37936	GENERIC_DAY	1	0	2010-02-20	1328	\N	29558	\N
37937	GENERIC_DAY	1	0	2010-02-06	1314	\N	29558	\N
37938	GENERIC_DAY	1	0	2010-03-28	1330	\N	29558	\N
37939	GENERIC_DAY	1	1	2010-05-14	1314	\N	29558	\N
37940	GENERIC_DAY	1	0	2010-03-08	1341	\N	29558	\N
37941	GENERIC_DAY	1	0	2010-02-17	1326	\N	29558	\N
37942	GENERIC_DAY	1	0	2010-04-24	1322	\N	29558	\N
37943	GENERIC_DAY	1	0	2010-02-13	1328	\N	29558	\N
37944	GENERIC_DAY	1	0	2010-04-01	1330	\N	29558	\N
37945	GENERIC_DAY	1	0	2010-04-04	1326	\N	29558	\N
37946	GENERIC_DAY	1	0	2010-05-24	1330	\N	29558	\N
37947	GENERIC_DAY	1	0	2010-05-31	1328	\N	29558	\N
37948	GENERIC_DAY	1	0	2010-03-03	1328	\N	29558	\N
37949	GENERIC_DAY	1	1	2010-03-29	1322	\N	29558	\N
37950	GENERIC_DAY	1	0	2010-05-15	1314	\N	29558	\N
37951	GENERIC_DAY	1	0	2010-02-17	1322	\N	29558	\N
37952	GENERIC_DAY	1	0	2010-04-30	1330	\N	29558	\N
37953	GENERIC_DAY	1	0	2010-05-10	1328	\N	29558	\N
37954	GENERIC_DAY	1	0	2010-05-08	1328	\N	29558	\N
37955	GENERIC_DAY	1	1	2010-02-09	1322	\N	29558	\N
37956	GENERIC_DAY	1	1	2010-02-10	1326	\N	29558	\N
37957	GENERIC_DAY	1	0	2010-04-25	1341	\N	29558	\N
37958	GENERIC_DAY	1	0	2010-02-02	1322	\N	29558	\N
37959	GENERIC_DAY	1	0	2010-03-28	1341	\N	29558	\N
37960	GENERIC_DAY	1	0	2010-04-12	1341	\N	29558	\N
37961	GENERIC_DAY	1	1	2010-04-22	1322	\N	29558	\N
37962	GENERIC_DAY	1	1	2010-02-11	1326	\N	29558	\N
37963	GENERIC_DAY	1	0	2010-02-27	1330	\N	29558	\N
37964	GENERIC_DAY	1	0	2010-05-12	1328	\N	29558	\N
37965	GENERIC_DAY	1	0	2010-02-21	1328	\N	29558	\N
37966	GENERIC_DAY	1	0	2010-05-29	1341	\N	29558	\N
37967	GENERIC_DAY	1	0	2010-05-07	1328	\N	29558	\N
37968	GENERIC_DAY	1	0	2010-04-05	1322	\N	29558	\N
37969	GENERIC_DAY	1	0	2010-05-30	1326	\N	29558	\N
37970	GENERIC_DAY	1	0	2010-03-06	1314	\N	29558	\N
37971	GENERIC_DAY	1	0	2010-06-02	1330	\N	29558	\N
37972	GENERIC_DAY	1	0	2010-04-17	1322	\N	29558	\N
37973	GENERIC_DAY	1	1	2010-03-08	1314	\N	29558	\N
37974	GENERIC_DAY	1	1	2010-02-18	1314	\N	29558	\N
37975	GENERIC_DAY	1	0	2010-05-26	1326	\N	29558	\N
37976	GENERIC_DAY	1	0	2010-05-25	1341	\N	29558	\N
37977	GENERIC_DAY	1	1	2010-04-15	1322	\N	29558	\N
37978	GENERIC_DAY	1	1	2010-04-26	1314	\N	29558	\N
37979	GENERIC_DAY	1	0	2010-02-04	1341	\N	29558	\N
37980	GENERIC_DAY	1	1	2010-02-01	1330	\N	29558	\N
37981	GENERIC_DAY	1	0	2010-05-31	1330	\N	29558	\N
37982	GENERIC_DAY	1	0	2010-04-06	1328	\N	29558	\N
37983	GENERIC_DAY	1	0	2010-03-05	1330	\N	29558	\N
37984	GENERIC_DAY	1	0	2010-03-21	1328	\N	29558	\N
37985	GENERIC_DAY	1	1	2010-02-12	1322	\N	29558	\N
37986	GENERIC_DAY	1	0	2010-05-14	1330	\N	29558	\N
37987	GENERIC_DAY	1	0	2010-04-17	1330	\N	29558	\N
37988	GENERIC_DAY	1	0	2010-03-20	1341	\N	29558	\N
37989	GENERIC_DAY	1	0	2010-04-18	1314	\N	29558	\N
37990	GENERIC_DAY	1	0	2010-03-06	1341	\N	29558	\N
37991	GENERIC_DAY	1	0	2010-04-01	1341	\N	29558	\N
37992	GENERIC_DAY	1	0	2010-03-14	1341	\N	29558	\N
37993	GENERIC_DAY	1	0	2010-03-30	1328	\N	29558	\N
37994	GENERIC_DAY	1	0	2010-02-20	1314	\N	29558	\N
37995	GENERIC_DAY	1	0	2010-03-19	1341	\N	29558	\N
37996	GENERIC_DAY	1	0	2010-04-27	1326	\N	29558	\N
37997	GENERIC_DAY	1	1	2010-04-12	1322	\N	29558	\N
37998	GENERIC_DAY	1	0	2010-02-15	1341	\N	29558	\N
37999	GENERIC_DAY	1	1	2010-04-23	1314	\N	29558	\N
38000	GENERIC_DAY	1	0	2010-02-18	1341	\N	29558	\N
38001	GENERIC_DAY	1	0	2010-04-28	1328	\N	29558	\N
38002	GENERIC_DAY	1	0	2010-05-16	1322	\N	29558	\N
38003	GENERIC_DAY	1	0	2010-05-19	1328	\N	29558	\N
38004	GENERIC_DAY	1	0	2010-05-15	1326	\N	29558	\N
38005	GENERIC_DAY	1	0	2010-02-04	1322	\N	29558	\N
38006	GENERIC_DAY	1	0	2010-06-03	1330	\N	29558	\N
38007	GENERIC_DAY	1	1	2010-05-21	1314	\N	29558	\N
38008	GENERIC_DAY	1	0	2010-04-11	1314	\N	29558	\N
38009	GENERIC_DAY	1	0	2010-03-08	1330	\N	29558	\N
38010	GENERIC_DAY	1	1	2010-04-19	1322	\N	29558	\N
38011	GENERIC_DAY	1	1	2010-02-19	1326	\N	29558	\N
38012	GENERIC_DAY	1	0	2010-03-28	1326	\N	29558	\N
38013	GENERIC_DAY	1	0	2010-06-03	1328	\N	29558	\N
38014	GENERIC_DAY	1	0	2010-04-16	1328	\N	29558	\N
38015	GENERIC_DAY	1	0	2010-05-11	1330	\N	29558	\N
38016	GENERIC_DAY	1	0	2010-04-01	1326	\N	29558	\N
38017	GENERIC_DAY	1	0	2010-02-26	1328	\N	29558	\N
38018	GENERIC_DAY	1	0	2010-03-27	1330	\N	29558	\N
38019	GENERIC_DAY	1	0	2010-03-29	1330	\N	29558	\N
38020	GENERIC_DAY	1	0	2010-03-01	1330	\N	29558	\N
38021	GENERIC_DAY	1	0	2010-05-22	1330	\N	29558	\N
38022	GENERIC_DAY	1	1	2010-05-14	1322	\N	29558	\N
38023	GENERIC_DAY	1	0	2010-04-10	1326	\N	29558	\N
38024	GENERIC_DAY	1	1	2010-05-05	1314	\N	29558	\N
38025	GENERIC_DAY	1	0	2010-02-02	1326	\N	29558	\N
38026	GENERIC_DAY	1	0	2010-04-20	1341	\N	29558	\N
38027	GENERIC_DAY	1	1	2010-02-09	1326	\N	29558	\N
38028	GENERIC_DAY	1	0	2010-05-13	1326	\N	29558	\N
38029	GENERIC_DAY	1	0	2010-06-02	1328	\N	29558	\N
38030	GENERIC_DAY	1	0	2010-05-06	1330	\N	29558	\N
38031	GENERIC_DAY	1	0	2010-03-13	1330	\N	29558	\N
38032	GENERIC_DAY	1	0	2010-03-20	1322	\N	29558	\N
38033	GENERIC_DAY	1	0	2010-04-12	1326	\N	29558	\N
38034	GENERIC_DAY	1	0	2010-04-27	1341	\N	29558	\N
38035	GENERIC_DAY	1	0	2010-03-13	1322	\N	29558	\N
38036	GENERIC_DAY	1	0	2010-04-02	1341	\N	29558	\N
38037	GENERIC_DAY	1	0	2010-05-09	1328	\N	29558	\N
38038	GENERIC_DAY	1	0	2010-03-06	1326	\N	29558	\N
38039	GENERIC_DAY	1	1	2010-04-08	1314	\N	29558	\N
38040	GENERIC_DAY	1	1	2010-02-03	1330	\N	29558	\N
38041	GENERIC_DAY	1	0	2010-02-13	1322	\N	29558	\N
38042	GENERIC_DAY	1	1	2010-03-17	1314	\N	29558	\N
38043	GENERIC_DAY	1	0	2010-05-29	1330	\N	29558	\N
38044	GENERIC_DAY	1	0	2010-02-24	1330	\N	29558	\N
38045	GENERIC_DAY	1	0	2010-02-27	1341	\N	29558	\N
38046	GENERIC_DAY	1	0	2010-03-04	1341	\N	29558	\N
38047	GENERIC_DAY	1	0	2010-03-13	1341	\N	29558	\N
38048	GENERIC_DAY	1	1	2010-05-10	1322	\N	29558	\N
38049	GENERIC_DAY	1	0	2010-03-09	1330	\N	29558	\N
38050	GENERIC_DAY	1	0	2010-04-04	1328	\N	29558	\N
38051	GENERIC_DAY	1	0	2010-02-14	1326	\N	29558	\N
38052	GENERIC_DAY	1	0	2010-04-18	1341	\N	29558	\N
38053	GENERIC_DAY	1	0	2010-04-03	1326	\N	29558	\N
38054	GENERIC_DAY	1	0	2010-02-24	1328	\N	29558	\N
38055	GENERIC_DAY	1	1	2010-04-15	1314	\N	29558	\N
38056	GENERIC_DAY	1	0	2010-03-26	1341	\N	29558	\N
38057	GENERIC_DAY	1	0	2010-04-21	1341	\N	29558	\N
38058	GENERIC_DAY	1	0	2010-05-30	1341	\N	29558	\N
38059	GENERIC_DAY	1	0	2010-05-15	1328	\N	29558	\N
38060	GENERIC_DAY	1	0	2010-04-24	1341	\N	29558	\N
38061	GENERIC_DAY	1	0	2010-02-22	1341	\N	29558	\N
38062	GENERIC_DAY	1	0	2010-03-10	1341	\N	29558	\N
38063	GENERIC_DAY	1	0	2010-03-18	1328	\N	29558	\N
38064	GENERIC_DAY	1	1	2010-03-10	1326	\N	29558	\N
38065	GENERIC_DAY	1	1	2010-05-21	1322	\N	29558	\N
38066	GENERIC_DAY	1	0	2010-02-21	1341	\N	29558	\N
38067	GENERIC_DAY	1	0	2010-04-22	1330	\N	29558	\N
38068	GENERIC_DAY	1	0	2010-02-14	1314	\N	29558	\N
38069	GENERIC_DAY	1	1	2010-03-04	1322	\N	29558	\N
38070	GENERIC_DAY	1	1	2010-03-18	1326	\N	29558	\N
38071	GENERIC_DAY	1	0	2010-03-29	1328	\N	29558	\N
38072	GENERIC_DAY	1	0	2010-02-17	1341	\N	29558	\N
38073	GENERIC_DAY	1	0	2010-02-06	1341	\N	29558	\N
38074	GENERIC_DAY	1	0	2010-03-30	1341	\N	29558	\N
38075	GENERIC_DAY	1	1	2010-05-28	1314	\N	29558	\N
38076	GENERIC_DAY	1	1	2010-02-11	1322	\N	29558	\N
38077	GENERIC_DAY	1	0	2010-03-27	1322	\N	29558	\N
38078	GENERIC_DAY	1	0	2010-03-21	1326	\N	29558	\N
38079	GENERIC_DAY	1	1	2010-03-22	1314	\N	29558	\N
38080	GENERIC_DAY	1	0	2010-03-21	1341	\N	29558	\N
38081	GENERIC_DAY	1	0	2010-04-23	1328	\N	29558	\N
38082	GENERIC_DAY	1	1	2010-03-02	1322	\N	29558	\N
38083	GENERIC_DAY	1	0	2010-02-05	1326	\N	29558	\N
38084	GENERIC_DAY	1	0	2010-05-04	1326	\N	29558	\N
38085	GENERIC_DAY	1	0	2010-02-15	1328	\N	29558	\N
38086	GENERIC_DAY	1	0	2010-05-05	1328	\N	29558	\N
38087	GENERIC_DAY	1	1	2010-03-17	1326	\N	29558	\N
38088	GENERIC_DAY	1	0	2010-04-10	1322	\N	29558	\N
38089	GENERIC_DAY	1	0	2010-02-21	1314	\N	29558	\N
38090	GENERIC_DAY	1	0	2010-04-03	1330	\N	29558	\N
38091	GENERIC_DAY	1	1	2010-05-24	1314	\N	29558	\N
38092	GENERIC_DAY	1	0	2010-03-06	1322	\N	29558	\N
38093	GENERIC_DAY	1	0	2010-05-12	1330	\N	29558	\N
38094	GENERIC_DAY	1	0	2010-05-09	1322	\N	29558	\N
38095	GENERIC_DAY	1	1	2010-02-09	1314	\N	29558	\N
38096	GENERIC_DAY	1	0	2010-04-05	1330	\N	29558	\N
38097	GENERIC_DAY	1	1	2010-05-25	1322	\N	29558	\N
38098	GENERIC_DAY	1	1	2010-03-24	1314	\N	29558	\N
38099	GENERIC_DAY	1	0	2010-05-02	1322	\N	29558	\N
38100	GENERIC_DAY	1	0	2010-03-07	1314	\N	29558	\N
38101	GENERIC_DAY	1	0	2010-06-01	1326	\N	29558	\N
38102	GENERIC_DAY	1	0	2010-03-25	1341	\N	29558	\N
38103	GENERIC_DAY	1	0	2010-05-27	1341	\N	29558	\N
38104	GENERIC_DAY	1	0	2010-06-02	1341	\N	29558	\N
38105	GENERIC_DAY	1	0	2010-05-20	1330	\N	29558	\N
38106	GENERIC_DAY	1	1	2010-04-22	1314	\N	29558	\N
38107	GENERIC_DAY	1	0	2010-02-18	1328	\N	29558	\N
38108	GENERIC_DAY	1	0	2010-04-29	1326	\N	29558	\N
38109	GENERIC_DAY	1	0	2010-02-05	1314	\N	29558	\N
38110	GENERIC_DAY	1	0	2010-04-30	1328	\N	29558	\N
38111	GENERIC_DAY	1	1	2010-04-29	1314	\N	29558	\N
38112	GENERIC_DAY	1	0	2010-05-29	1328	\N	29558	\N
38113	GENERIC_DAY	1	0	2010-02-03	1322	\N	29558	\N
38114	GENERIC_DAY	1	0	2010-02-22	1328	\N	29558	\N
38115	GENERIC_DAY	1	0	2010-03-19	1326	\N	29558	\N
38116	GENERIC_DAY	1	0	2010-03-18	1330	\N	29558	\N
38117	GENERIC_DAY	1	0	2010-02-26	1341	\N	29558	\N
38118	GENERIC_DAY	1	0	2010-03-02	1341	\N	29558	\N
38119	GENERIC_DAY	1	0	2010-04-18	1328	\N	29558	\N
38120	GENERIC_DAY	1	0	2010-02-28	1326	\N	29558	\N
38121	GENERIC_DAY	1	0	2010-03-24	1330	\N	29558	\N
38122	GENERIC_DAY	1	1	2010-03-30	1314	\N	29558	\N
38123	GENERIC_DAY	1	0	2010-04-22	1328	\N	29558	\N
38124	GENERIC_DAY	1	0	2010-04-03	1314	\N	29558	\N
38125	GENERIC_DAY	1	1	2010-03-04	1326	\N	29558	\N
38126	GENERIC_DAY	1	0	2010-02-08	1328	\N	29558	\N
38127	GENERIC_DAY	1	1	2010-03-05	1322	\N	29558	\N
38128	GENERIC_DAY	1	0	2010-05-26	1328	\N	29558	\N
38129	GENERIC_DAY	1	1	2010-04-13	1322	\N	29558	\N
38130	GENERIC_DAY	1	1	2010-02-12	1314	\N	29558	\N
38131	GENERIC_DAY	1	0	2010-04-09	1330	\N	29558	\N
38132	GENERIC_DAY	1	0	2010-03-14	1322	\N	29558	\N
38133	GENERIC_DAY	1	0	2010-04-18	1330	\N	29558	\N
38134	GENERIC_DAY	1	1	2010-05-06	1314	\N	29558	\N
38135	GENERIC_DAY	1	0	2010-04-25	1322	\N	29558	\N
38136	GENERIC_DAY	1	0	2010-02-06	1326	\N	29558	\N
38137	GENERIC_DAY	1	0	2010-04-13	1341	\N	29558	\N
38138	GENERIC_DAY	1	1	2010-04-27	1322	\N	29558	\N
38139	GENERIC_DAY	1	0	2010-04-23	1326	\N	29558	\N
38140	GENERIC_DAY	1	0	2010-03-04	1328	\N	29558	\N
38141	GENERIC_DAY	1	1	2010-03-02	1314	\N	29558	\N
38142	GENERIC_DAY	1	0	2010-05-15	1330	\N	29558	\N
38143	GENERIC_DAY	1	0	2010-04-05	1341	\N	29558	\N
38144	GENERIC_DAY	1	0	2010-05-28	1326	\N	29558	\N
38145	GENERIC_DAY	1	0	2010-02-13	1341	\N	29558	\N
38146	GENERIC_DAY	1	0	2010-04-11	1326	\N	29558	\N
38147	GENERIC_DAY	1	1	2010-03-09	1314	\N	29558	\N
38148	GENERIC_DAY	1	0	2010-05-30	1330	\N	29558	\N
38149	GENERIC_DAY	1	0	2010-04-21	1328	\N	29558	\N
38150	GENERIC_DAY	1	0	2010-05-16	1328	\N	29558	\N
38151	GENERIC_DAY	1	0	2010-02-13	1314	\N	29558	\N
38152	GENERIC_DAY	1	0	2010-04-19	1328	\N	29558	\N
38153	GENERIC_DAY	1	1	2010-02-15	1314	\N	29558	\N
38154	GENERIC_DAY	1	0	2010-03-04	1330	\N	29558	\N
38155	GENERIC_DAY	1	1	2010-02-24	1322	\N	29558	\N
38156	GENERIC_DAY	1	0	2010-02-27	1322	\N	29558	\N
38157	GENERIC_DAY	1	1	2010-02-04	1326	\N	29558	\N
38158	GENERIC_DAY	1	0	2010-05-01	1322	\N	29558	\N
38159	GENERIC_DAY	1	0	2010-05-24	1341	\N	29558	\N
38160	GENERIC_DAY	1	0	2010-02-17	1330	\N	29558	\N
38161	GENERIC_DAY	1	0	2010-04-28	1326	\N	29558	\N
38162	GENERIC_DAY	1	0	2010-03-22	1330	\N	29558	\N
38163	GENERIC_DAY	1	0	2010-04-16	1341	\N	29558	\N
38164	GENERIC_DAY	1	0	2010-02-19	1341	\N	29558	\N
38165	GENERIC_DAY	1	0	2010-05-09	1330	\N	29558	\N
38166	GENERIC_DAY	1	1	2010-02-04	1328	\N	29558	\N
38167	GENERIC_DAY	1	0	2010-04-18	1322	\N	29558	\N
38168	GENERIC_DAY	1	0	2010-02-28	1328	\N	29558	\N
38169	GENERIC_DAY	1	0	2010-03-13	1328	\N	29558	\N
38170	GENERIC_DAY	1	0	2010-04-02	1328	\N	29558	\N
38171	GENERIC_DAY	1	0	2010-02-08	1330	\N	29558	\N
38172	GENERIC_DAY	1	0	2010-04-22	1326	\N	29558	\N
38173	GENERIC_DAY	1	1	2010-05-31	1314	\N	29558	\N
38174	GENERIC_DAY	1	0	2010-02-16	1341	\N	29558	\N
38175	GENERIC_DAY	1	0	2010-03-19	1314	\N	29558	\N
38176	GENERIC_DAY	1	1	2010-03-04	1314	\N	29558	\N
38177	GENERIC_DAY	1	1	2010-03-16	1322	\N	29558	\N
38178	GENERIC_DAY	1	0	2010-05-11	1341	\N	29558	\N
38179	GENERIC_DAY	1	1	2010-06-03	1314	\N	29558	\N
38180	GENERIC_DAY	1	0	2010-02-01	1326	\N	29558	\N
38181	GENERIC_DAY	1	0	2010-05-20	1341	\N	29558	\N
38182	GENERIC_DAY	1	1	2010-06-03	1322	\N	29558	\N
38183	GENERIC_DAY	1	0	2010-03-12	1330	\N	29558	\N
38184	GENERIC_DAY	1	0	2010-02-21	1330	\N	29558	\N
38185	GENERIC_DAY	1	0	2010-02-02	1341	\N	29558	\N
38186	GENERIC_DAY	1	1	2010-02-19	1322	\N	29558	\N
38187	GENERIC_DAY	1	0	2010-04-25	1314	\N	29558	\N
38188	GENERIC_DAY	1	0	2010-04-02	1330	\N	29558	\N
38189	GENERIC_DAY	1	0	2010-02-23	1330	\N	29558	\N
38190	GENERIC_DAY	1	0	2010-02-19	1330	\N	29558	\N
38191	GENERIC_DAY	1	1	2010-02-08	1326	\N	29558	\N
38192	GENERIC_DAY	1	1	2010-03-16	1326	\N	29558	\N
38193	GENERIC_DAY	1	0	2010-04-13	1328	\N	29558	\N
38194	GENERIC_DAY	1	1	2010-03-12	1314	\N	29558	\N
38195	GENERIC_DAY	1	1	2010-03-08	1326	\N	29558	\N
38196	GENERIC_DAY	1	1	2010-02-03	1314	\N	29558	\N
38197	GENERIC_DAY	1	0	2010-05-17	1326	\N	29558	\N
38198	GENERIC_DAY	1	0	2010-02-22	1330	\N	29558	\N
38199	GENERIC_DAY	1	0	2010-02-21	1326	\N	29558	\N
38200	GENERIC_DAY	1	0	2010-05-16	1314	\N	29558	\N
38201	GENERIC_DAY	1	0	2010-05-22	1328	\N	29558	\N
38202	GENERIC_DAY	1	0	2010-02-28	1341	\N	29558	\N
38203	GENERIC_DAY	1	0	2010-04-10	1314	\N	29558	\N
38204	GENERIC_DAY	1	0	2010-03-19	1330	\N	29558	\N
38205	GENERIC_DAY	1	0	2010-05-01	1314	\N	29558	\N
38206	GENERIC_DAY	1	0	2010-04-09	1328	\N	29558	\N
38207	GENERIC_DAY	1	1	2010-05-07	1322	\N	29558	\N
38208	GENERIC_DAY	1	1	2010-02-23	1314	\N	29558	\N
38209	GENERIC_DAY	1	0	2010-05-13	1330	\N	29558	\N
38210	GENERIC_DAY	1	1	2010-04-30	1322	\N	29558	\N
38211	GENERIC_DAY	1	0	2010-04-01	1314	\N	29558	\N
38212	GENERIC_DAY	1	1	2010-02-01	1328	\N	29558	\N
38213	GENERIC_DAY	1	0	2010-04-25	1326	\N	29558	\N
38214	GENERIC_DAY	1	0	2010-04-05	1326	\N	29558	\N
38215	GENERIC_DAY	1	1	2010-05-11	1322	\N	29558	\N
38216	GENERIC_DAY	1	1	2010-02-26	1314	\N	29558	\N
38217	GENERIC_DAY	1	0	2010-04-29	1328	\N	29558	\N
38218	GENERIC_DAY	1	1	2010-04-20	1314	\N	29558	\N
38219	GENERIC_DAY	1	1	2010-04-19	1314	\N	29558	\N
38220	GENERIC_DAY	1	0	2010-04-24	1328	\N	29558	\N
38221	GENERIC_DAY	1	0	2010-04-19	1330	\N	29558	\N
38222	GENERIC_DAY	1	0	2010-04-19	1341	\N	29558	\N
38223	GENERIC_DAY	1	1	2010-03-08	1322	\N	29558	\N
38224	GENERIC_DAY	1	0	2010-02-14	1328	\N	29558	\N
38225	GENERIC_DAY	1	1	2010-03-16	1314	\N	29558	\N
38226	GENERIC_DAY	1	0	2010-05-29	1322	\N	29558	\N
38227	GENERIC_DAY	1	1	2010-02-08	1322	\N	29558	\N
38228	GENERIC_DAY	1	0	2010-03-12	1328	\N	29558	\N
38229	GENERIC_DAY	1	0	2010-03-21	1330	\N	29558	\N
38230	GENERIC_DAY	1	0	2010-05-27	1326	\N	29558	\N
38231	GENERIC_DAY	1	0	2010-05-23	1328	\N	29558	\N
38232	GENERIC_DAY	1	0	2010-04-29	1341	\N	29558	\N
38233	GENERIC_DAY	1	0	2010-03-07	1326	\N	29558	\N
38234	GENERIC_DAY	1	0	2010-03-23	1330	\N	29558	\N
38235	GENERIC_DAY	1	0	2010-05-13	1328	\N	29558	\N
38236	GENERIC_DAY	1	1	2010-04-16	1322	\N	29558	\N
38237	GENERIC_DAY	1	0	2010-03-10	1330	\N	29558	\N
38238	GENERIC_DAY	1	0	2010-05-29	1326	\N	29558	\N
38239	GENERIC_DAY	1	0	2010-05-20	1328	\N	29558	\N
38240	GENERIC_DAY	1	0	2010-04-07	1328	\N	29558	\N
38241	GENERIC_DAY	1	0	2010-05-17	1314	\N	29558	\N
38242	GENERIC_DAY	1	0	2010-04-03	1328	\N	29558	\N
38243	GENERIC_DAY	1	0	2010-05-08	1330	\N	29558	\N
38244	GENERIC_DAY	1	1	2010-04-16	1314	\N	29558	\N
38245	GENERIC_DAY	1	1	2010-02-24	1326	\N	29558	\N
38246	GENERIC_DAY	1	0	2010-02-10	1341	\N	29558	\N
38247	GENERIC_DAY	1	1	2010-05-28	1322	\N	29558	\N
38248	GENERIC_DAY	1	0	2010-02-27	1326	\N	29558	\N
38249	GENERIC_DAY	1	1	2010-04-14	1314	\N	29558	\N
38250	GENERIC_DAY	1	0	2010-03-25	1328	\N	29558	\N
38251	GENERIC_DAY	1	1	2010-03-26	1322	\N	29558	\N
38252	GENERIC_DAY	1	0	2010-02-07	1322	\N	29558	\N
38253	GENERIC_DAY	1	0	2010-03-21	1314	\N	29558	\N
38254	GENERIC_DAY	1	0	2010-04-08	1330	\N	29558	\N
38255	GENERIC_DAY	1	0	2010-02-16	1328	\N	29558	\N
38256	GENERIC_DAY	1	0	2010-04-07	1330	\N	29558	\N
38257	GENERIC_DAY	1	0	2010-02-06	1330	\N	29558	\N
38258	GENERIC_DAY	1	1	2010-03-26	1314	\N	29558	\N
38259	GENERIC_DAY	1	0	2010-05-14	1326	\N	29558	\N
38260	GENERIC_DAY	1	0	2010-02-08	1341	\N	29558	\N
38261	GENERIC_DAY	1	0	2010-03-17	1330	\N	29558	\N
38262	GENERIC_DAY	1	1	2010-05-27	1322	\N	29558	\N
38263	GENERIC_DAY	1	0	2010-05-23	1314	\N	29558	\N
38264	GENERIC_DAY	1	0	2010-05-19	1341	\N	29558	\N
38265	GENERIC_DAY	1	0	2010-04-29	1330	\N	29558	\N
38266	GENERIC_DAY	1	0	2010-04-26	1328	\N	29558	\N
38267	GENERIC_DAY	1	0	2010-05-22	1341	\N	29558	\N
38268	GENERIC_DAY	1	0	2010-02-06	1328	\N	29558	\N
38269	GENERIC_DAY	1	1	2010-02-15	1326	\N	29558	\N
38270	GENERIC_DAY	1	0	2010-05-01	1326	\N	29558	\N
38271	GENERIC_DAY	1	1	2010-02-25	1322	\N	29558	\N
38272	GENERIC_DAY	1	0	2010-03-16	1328	\N	29558	\N
38273	GENERIC_DAY	1	1	2010-03-05	1314	\N	29558	\N
38274	GENERIC_DAY	1	1	2010-02-18	1322	\N	29558	\N
38275	GENERIC_DAY	1	1	2010-02-11	1314	\N	29558	\N
38276	GENERIC_DAY	1	1	2010-05-27	1314	\N	29558	\N
38277	GENERIC_DAY	1	0	2010-04-26	1341	\N	29558	\N
38278	GENERIC_DAY	1	0	2010-03-20	1326	\N	29558	\N
38279	GENERIC_DAY	1	0	2010-05-16	1330	\N	29558	\N
38280	GENERIC_DAY	1	0	2010-05-16	1341	\N	29558	\N
38281	GENERIC_DAY	1	0	2010-03-06	1330	\N	29558	\N
38282	GENERIC_DAY	1	0	2010-03-28	1328	\N	29558	\N
38283	GENERIC_DAY	1	0	2010-04-10	1328	\N	29558	\N
38284	GENERIC_DAY	1	1	2010-04-28	1322	\N	29558	\N
38285	GENERIC_DAY	1	0	2010-05-22	1326	\N	29558	\N
38286	GENERIC_DAY	1	0	2010-04-19	1326	\N	29558	\N
38287	GENERIC_DAY	1	0	2010-05-20	1326	\N	29558	\N
38288	GENERIC_DAY	1	0	2010-05-17	1322	\N	29558	\N
38289	GENERIC_DAY	1	1	2010-04-28	1314	\N	29558	\N
38290	GENERIC_DAY	1	0	2010-05-23	1322	\N	29558	\N
38291	GENERIC_DAY	1	0	2010-05-18	1326	\N	29558	\N
38292	GENERIC_DAY	1	0	2010-03-01	1341	\N	29558	\N
38293	GENERIC_DAY	1	0	2010-05-26	1330	\N	29558	\N
38294	GENERIC_DAY	1	1	2010-03-01	1326	\N	29558	\N
38295	GENERIC_DAY	1	0	2010-02-12	1328	\N	29558	\N
38296	GENERIC_DAY	1	0	2010-03-21	1322	\N	29558	\N
38297	GENERIC_DAY	1	0	2010-03-17	1328	\N	29558	\N
38298	GENERIC_DAY	1	0	2010-05-13	1341	\N	29558	\N
38299	GENERIC_DAY	1	0	2010-05-10	1330	\N	29558	\N
38300	GENERIC_DAY	1	0	2010-02-20	1330	\N	29558	\N
38301	GENERIC_DAY	1	0	2010-04-02	1326	\N	29558	\N
38302	GENERIC_DAY	1	0	2010-02-11	1341	\N	29558	\N
38303	GENERIC_DAY	1	0	2010-05-29	1314	\N	29558	\N
38304	GENERIC_DAY	1	0	2010-04-04	1314	\N	29558	\N
38305	GENERIC_DAY	1	1	2010-05-24	1322	\N	29558	\N
38306	GENERIC_DAY	1	0	2010-04-26	1326	\N	29558	\N
38307	GENERIC_DAY	1	1	2010-04-07	1322	\N	29558	\N
38308	GENERIC_DAY	1	0	2010-03-15	1328	\N	29558	\N
38309	GENERIC_DAY	1	1	2010-03-18	1322	\N	29558	\N
38310	GENERIC_DAY	1	0	2010-03-01	1328	\N	29558	\N
38311	GENERIC_DAY	1	0	2010-04-13	1326	\N	29558	\N
38312	GENERIC_DAY	1	0	2010-04-11	1322	\N	29558	\N
38313	GENERIC_DAY	1	0	2010-03-07	1322	\N	29558	\N
38314	GENERIC_DAY	1	0	2010-06-01	1328	\N	29558	\N
38315	GENERIC_DAY	1	0	2010-03-29	1326	\N	29558	\N
38316	GENERIC_DAY	1	1	2010-05-07	1314	\N	29558	\N
38317	GENERIC_DAY	1	0	2010-05-16	1326	\N	29558	\N
38318	GENERIC_DAY	1	0	2010-05-18	1341	\N	29558	\N
38319	GENERIC_DAY	1	0	2010-04-25	1330	\N	29558	\N
38320	GENERIC_DAY	1	0	2010-05-05	1330	\N	29558	\N
38321	GENERIC_DAY	1	0	2010-05-11	1328	\N	29558	\N
38322	GENERIC_DAY	1	0	2010-04-21	1326	\N	29558	\N
38323	GENERIC_DAY	1	0	2010-02-14	1341	\N	29558	\N
38324	GENERIC_DAY	1	0	2010-06-03	1326	\N	29558	\N
38325	GENERIC_DAY	1	1	2010-04-26	1322	\N	29558	\N
38326	GENERIC_DAY	1	1	2010-04-27	1314	\N	29558	\N
38327	GENERIC_DAY	1	0	2010-05-22	1322	\N	29558	\N
38328	GENERIC_DAY	1	0	2010-04-13	1330	\N	29558	\N
38329	GENERIC_DAY	1	1	2010-04-21	1322	\N	29558	\N
38330	GENERIC_DAY	1	1	2010-03-18	1314	\N	29558	\N
38331	GENERIC_DAY	1	0	2010-04-30	1341	\N	29558	\N
38332	GENERIC_DAY	1	0	2010-05-28	1330	\N	29558	\N
38333	GENERIC_DAY	1	0	2010-05-09	1326	\N	29558	\N
38334	GENERIC_DAY	1	1	2010-03-11	1322	\N	29558	\N
38335	GENERIC_DAY	1	1	2010-05-03	1322	\N	29558	\N
38336	GENERIC_DAY	1	0	2010-03-13	1326	\N	29558	\N
38337	GENERIC_DAY	1	0	2010-05-11	1326	\N	29558	\N
38338	GENERIC_DAY	1	1	2010-04-13	1314	\N	29558	\N
38339	GENERIC_DAY	1	1	2010-02-26	1326	\N	29558	\N
38340	GENERIC_DAY	1	1	2010-02-05	1341	\N	29558	\N
38341	GENERIC_DAY	1	0	2010-05-28	1341	\N	29558	\N
38342	GENERIC_DAY	1	1	2010-03-15	1326	\N	29558	\N
38343	GENERIC_DAY	1	1	2010-05-20	1314	\N	29558	\N
38344	GENERIC_DAY	1	0	2010-02-01	1341	\N	29558	\N
38345	GENERIC_DAY	1	1	2010-03-12	1326	\N	29558	\N
38346	GENERIC_DAY	1	0	2010-04-14	1328	\N	29558	\N
38347	GENERIC_DAY	1	0	2010-04-21	1330	\N	29558	\N
38348	GENERIC_DAY	1	1	2010-05-18	1314	\N	29558	\N
38349	GENERIC_DAY	1	0	2010-03-15	1341	\N	29558	\N
38350	GENERIC_DAY	1	0	2010-02-27	1328	\N	29558	\N
38351	GENERIC_DAY	1	0	2010-05-12	1326	\N	29558	\N
38352	GENERIC_DAY	1	1	2010-02-25	1314	\N	29558	\N
38353	GENERIC_DAY	1	0	2010-03-30	1326	\N	29558	\N
38354	GENERIC_DAY	1	0	2010-04-11	1341	\N	29558	\N
38355	GENERIC_DAY	1	0	2010-02-14	1322	\N	29558	\N
38356	GENERIC_DAY	1	0	2010-04-14	1326	\N	29558	\N
38357	GENERIC_DAY	1	0	2010-05-25	1328	\N	29558	\N
38358	GENERIC_DAY	1	0	2010-04-09	1341	\N	29558	\N
38359	GENERIC_DAY	1	1	2010-02-08	1314	\N	29558	\N
38360	GENERIC_DAY	1	0	2010-04-05	1314	\N	29558	\N
38361	GENERIC_DAY	1	0	2010-02-20	1326	\N	29558	\N
38362	GENERIC_DAY	1	0	2010-02-03	1341	\N	29558	\N
38363	GENERIC_DAY	1	0	2010-05-21	1326	\N	29558	\N
38364	GENERIC_DAY	1	0	2010-05-08	1322	\N	29558	\N
38365	GENERIC_DAY	1	0	2010-04-09	1326	\N	29558	\N
38366	GENERIC_DAY	1	1	2010-03-11	1326	\N	29558	\N
38367	GENERIC_DAY	1	0	2010-02-27	1314	\N	29558	\N
38368	GENERIC_DAY	1	0	2010-04-20	1326	\N	29558	\N
38369	GENERIC_DAY	1	1	2010-02-10	1322	\N	29558	\N
38370	GENERIC_DAY	1	1	2010-02-05	1328	\N	29558	\N
38371	GENERIC_DAY	1	0	2010-04-08	1326	\N	29558	\N
38372	GENERIC_DAY	1	1	2010-02-02	1330	\N	29558	\N
38373	GENERIC_DAY	1	1	2010-03-12	1322	\N	29558	\N
38374	GENERIC_DAY	1	0	2010-03-27	1328	\N	29558	\N
38375	GENERIC_DAY	1	1	2010-03-09	1322	\N	29558	\N
38376	GENERIC_DAY	1	0	2010-04-10	1330	\N	29558	\N
38377	GENERIC_DAY	1	0	2010-05-27	1328	\N	29558	\N
38378	GENERIC_DAY	1	1	2010-02-15	1322	\N	29558	\N
38379	GENERIC_DAY	1	0	2010-03-03	1330	\N	29558	\N
38380	GENERIC_DAY	1	1	2010-06-02	1322	\N	29558	\N
38381	GENERIC_DAY	1	0	2010-05-05	1341	\N	29558	\N
38382	GENERIC_DAY	1	0	2010-02-05	1322	\N	29558	\N
38383	GENERIC_DAY	1	1	2010-03-15	1322	\N	29558	\N
38384	GENERIC_DAY	1	0	2010-04-12	1330	\N	29558	\N
38385	GENERIC_DAY	1	0	2010-03-26	1330	\N	29558	\N
38386	GENERIC_DAY	1	0	2010-04-03	1322	\N	29558	\N
38387	GENERIC_DAY	1	0	2010-02-04	1314	\N	29558	\N
38388	GENERIC_DAY	1	1	2010-03-31	1314	\N	29558	\N
38389	GENERIC_DAY	1	1	2010-02-04	1330	\N	29558	\N
38390	GENERIC_DAY	1	1	2010-04-08	1322	\N	29558	\N
38391	GENERIC_DAY	1	0	2010-05-14	1341	\N	29558	\N
38392	GENERIC_DAY	1	0	2010-05-03	1326	\N	29558	\N
38393	GENERIC_DAY	1	0	2010-05-08	1341	\N	29558	\N
38394	GENERIC_DAY	1	0	2010-04-08	1328	\N	29558	\N
38395	GENERIC_DAY	1	0	2010-02-12	1330	\N	29558	\N
38396	GENERIC_DAY	1	1	2010-03-03	1326	\N	29558	\N
38397	GENERIC_DAY	1	0	2010-05-25	1326	\N	29558	\N
38398	GENERIC_DAY	1	0	2010-04-22	1341	\N	29558	\N
38399	GENERIC_DAY	1	0	2010-04-15	1330	\N	29558	\N
38400	GENERIC_DAY	1	1	2010-03-23	1322	\N	29558	\N
38401	GENERIC_DAY	1	0	2010-03-06	1328	\N	29558	\N
38402	GENERIC_DAY	1	1	2010-02-23	1326	\N	29558	\N
38403	GENERIC_DAY	1	0	2010-03-02	1330	\N	29558	\N
38404	GENERIC_DAY	1	1	2010-03-05	1326	\N	29558	\N
38405	GENERIC_DAY	1	0	2010-02-25	1341	\N	29558	\N
38406	GENERIC_DAY	1	0	2010-03-13	1314	\N	29558	\N
38407	GENERIC_DAY	1	0	2010-04-30	1326	\N	29558	\N
38408	GENERIC_DAY	1	0	2010-03-03	1341	\N	29558	\N
38409	GENERIC_DAY	1	0	2010-03-02	1328	\N	29558	\N
38410	GENERIC_DAY	1	1	2010-03-25	1314	\N	29558	\N
38411	GENERIC_DAY	1	1	2010-04-07	1314	\N	29558	\N
38412	GENERIC_DAY	1	0	2010-04-04	1322	\N	29558	\N
38413	GENERIC_DAY	1	0	2010-05-17	1330	\N	29558	\N
38414	GENERIC_DAY	1	1	2010-04-30	1314	\N	29558	\N
38415	GENERIC_DAY	1	0	2010-02-10	1330	\N	29558	\N
38416	GENERIC_DAY	1	0	2010-04-17	1314	\N	29558	\N
38417	GENERIC_DAY	1	0	2010-05-03	1330	\N	29558	\N
38418	GENERIC_DAY	1	0	2010-02-11	1330	\N	29558	\N
38419	GENERIC_DAY	1	0	2010-05-21	1330	\N	29558	\N
38420	GENERIC_DAY	1	0	2010-02-07	1330	\N	29558	\N
38421	GENERIC_DAY	1	1	2010-03-03	1314	\N	29558	\N
38422	GENERIC_DAY	1	1	2010-03-25	1322	\N	29558	\N
38423	GENERIC_DAY	1	0	2010-03-30	1330	\N	29558	\N
38424	GENERIC_DAY	1	1	2010-05-26	1314	\N	29558	\N
38425	GENERIC_DAY	1	0	2010-04-04	1330	\N	29558	\N
38426	GENERIC_DAY	1	1	2010-05-04	1314	\N	29558	\N
38427	GENERIC_DAY	1	0	2010-03-22	1341	\N	29558	\N
38428	GENERIC_DAY	1	0	2010-03-31	1330	\N	29558	\N
38429	GENERIC_DAY	1	0	2010-03-14	1328	\N	29558	\N
38430	GENERIC_DAY	1	0	2010-03-24	1328	\N	29558	\N
38431	GENERIC_DAY	1	0	2010-03-27	1314	\N	29558	\N
38432	GENERIC_DAY	1	0	2010-05-06	1328	\N	29558	\N
38433	GENERIC_DAY	1	0	2010-04-08	1341	\N	29558	\N
38434	GENERIC_DAY	1	1	2010-02-10	1314	\N	29558	\N
38435	GENERIC_DAY	1	0	2010-03-26	1328	\N	29558	\N
38436	GENERIC_DAY	1	0	2010-05-27	1330	\N	29558	\N
38437	GENERIC_DAY	1	0	2010-05-28	1328	\N	29558	\N
38438	GENERIC_DAY	1	0	2010-02-15	1330	\N	29558	\N
38439	GENERIC_DAY	1	0	2010-02-20	1322	\N	29558	\N
38440	GENERIC_DAY	1	0	2010-04-17	1341	\N	29558	\N
38441	GENERIC_DAY	1	0	2010-03-19	1328	\N	29558	\N
38442	GENERIC_DAY	1	1	2010-05-03	1314	\N	29558	\N
38443	GENERIC_DAY	1	0	2010-04-28	1341	\N	29558	\N
38444	GENERIC_DAY	1	1	2010-02-22	1322	\N	29558	\N
38445	GENERIC_DAY	1	0	2010-03-05	1328	\N	29558	\N
38446	GENERIC_DAY	1	1	2010-04-09	1314	\N	29558	\N
38447	GENERIC_DAY	1	0	2010-05-09	1341	\N	29558	\N
38448	GENERIC_DAY	1	0	2010-03-17	1341	\N	29558	\N
38449	GENERIC_DAY	1	1	2010-05-18	1322	\N	29558	\N
38450	GENERIC_DAY	1	1	2010-04-14	1322	\N	29558	\N
38451	GENERIC_DAY	1	0	2010-02-13	1330	\N	29558	\N
38452	GENERIC_DAY	1	1	2010-05-04	1322	\N	29558	\N
38453	GENERIC_DAY	1	0	2010-03-20	1330	\N	29558	\N
38454	GENERIC_DAY	1	1	2010-05-10	1314	\N	29558	\N
38455	GENERIC_DAY	1	0	2010-04-07	1326	\N	29558	\N
38456	GENERIC_DAY	1	0	2010-04-02	1322	\N	29558	\N
38457	GENERIC_DAY	1	0	2010-05-21	1328	\N	29558	\N
38458	GENERIC_DAY	1	0	2010-04-15	1341	\N	29558	\N
38459	GENERIC_DAY	1	1	2010-02-16	1314	\N	29558	\N
38460	GENERIC_DAY	1	0	2010-04-06	1341	\N	29558	\N
38461	GENERIC_DAY	1	1	2010-04-06	1322	\N	29558	\N
38462	GENERIC_DAY	1	0	2010-05-22	1314	\N	29558	\N
38463	GENERIC_DAY	1	0	2010-05-19	1330	\N	29558	\N
38464	GENERIC_DAY	1	0	2010-03-31	1328	\N	29558	\N
38465	GENERIC_DAY	1	0	2010-04-27	1330	\N	29558	\N
38466	GENERIC_DAY	1	0	2010-05-01	1330	\N	29558	\N
38467	GENERIC_DAY	1	0	2010-05-30	1322	\N	29558	\N
38468	GENERIC_DAY	1	0	2010-05-24	1328	\N	29558	\N
38469	GENERIC_DAY	1	0	2010-05-09	1314	\N	29558	\N
38470	GENERIC_DAY	1	0	2010-04-01	1322	\N	29558	\N
38471	GENERIC_DAY	1	0	2010-05-02	1328	\N	29558	\N
38472	GENERIC_DAY	1	0	2010-02-07	1326	\N	29558	\N
38473	GENERIC_DAY	1	1	2010-02-16	1326	\N	29558	\N
38474	GENERIC_DAY	1	0	2010-03-12	1341	\N	29558	\N
38475	GENERIC_DAY	1	0	2010-05-04	1328	\N	29558	\N
38476	GENERIC_DAY	1	1	2010-05-13	1322	\N	29558	\N
38477	GENERIC_DAY	1	0	2010-05-01	1328	\N	29558	\N
38478	GENERIC_DAY	1	1	2010-02-23	1322	\N	29558	\N
38479	GENERIC_DAY	1	0	2010-05-10	1326	\N	29558	\N
38480	GENERIC_DAY	1	0	2010-04-25	1328	\N	29558	\N
38481	GENERIC_DAY	1	0	2010-02-28	1330	\N	29558	\N
38482	GENERIC_DAY	1	0	2010-04-26	1330	\N	29558	\N
38483	GENERIC_DAY	1	0	2010-03-22	1328	\N	29558	\N
38484	GENERIC_DAY	1	1	2010-05-31	1322	\N	29558	\N
38485	GENERIC_DAY	1	0	2010-04-17	1326	\N	29558	\N
38486	GENERIC_DAY	1	0	2010-05-08	1314	\N	29558	\N
38487	GENERIC_DAY	1	0	2010-02-23	1341	\N	29558	\N
38488	GENERIC_DAY	1	0	2010-05-30	1314	\N	29558	\N
38489	GENERIC_DAY	1	0	2010-04-28	1330	\N	29558	\N
38490	GENERIC_DAY	1	0	2010-05-30	1328	\N	29558	\N
38491	GENERIC_DAY	1	1	2010-03-15	1314	\N	29558	\N
38492	GENERIC_DAY	1	0	2010-05-25	1330	\N	29558	\N
38493	GENERIC_DAY	1	0	2010-02-17	1328	\N	29558	\N
38494	GENERIC_DAY	1	0	2010-05-31	1341	\N	29558	\N
38495	GENERIC_DAY	1	1	2010-02-02	1328	\N	29558	\N
38496	GENERIC_DAY	1	1	2010-02-01	1314	\N	29558	\N
38497	GENERIC_DAY	1	0	2010-03-27	1341	\N	29558	\N
38498	GENERIC_DAY	1	0	2010-03-14	1314	\N	29558	\N
38499	GENERIC_DAY	1	1	2010-05-05	1322	\N	29558	\N
38500	GENERIC_DAY	1	0	2010-04-23	1330	\N	29558	\N
38501	GENERIC_DAY	1	0	2010-05-17	1341	\N	29558	\N
38502	GENERIC_DAY	1	1	2010-03-22	1326	\N	29558	\N
38503	GENERIC_DAY	1	1	2010-03-23	1314	\N	29558	\N
38504	GENERIC_DAY	1	0	2010-05-18	1330	\N	29558	\N
38505	GENERIC_DAY	1	0	2010-02-26	1330	\N	29558	\N
38506	GENERIC_DAY	1	0	2010-05-06	1326	\N	29558	\N
38507	GENERIC_DAY	1	0	2010-05-07	1330	\N	29558	\N
38508	GENERIC_DAY	1	0	2010-06-03	1341	\N	29558	\N
38509	GENERIC_DAY	1	0	2010-05-02	1326	\N	29558	\N
38510	GENERIC_DAY	1	0	2010-02-28	1322	\N	29558	\N
38511	GENERIC_DAY	1	1	2010-05-26	1322	\N	29558	\N
38512	GENERIC_DAY	1	0	2010-05-31	1326	\N	29558	\N
38513	GENERIC_DAY	1	0	2010-05-21	1341	\N	29558	\N
38514	GENERIC_DAY	1	0	2010-02-01	1322	\N	29558	\N
38515	GENERIC_DAY	1	0	2010-03-05	1341	\N	29558	\N
38516	GENERIC_DAY	1	1	2010-06-02	1314	\N	29558	\N
38517	GENERIC_DAY	1	0	2010-02-19	1328	\N	29558	\N
38518	GENERIC_DAY	1	0	2010-02-24	1341	\N	29558	\N
38519	GENERIC_DAY	1	0	2010-05-06	1341	\N	29558	\N
38520	GENERIC_DAY	1	0	2010-05-23	1341	\N	29558	\N
38521	GENERIC_DAY	1	1	2010-05-06	1322	\N	29558	\N
38522	GENERIC_DAY	1	0	2010-04-12	1328	\N	29558	\N
38523	GENERIC_DAY	1	0	2010-02-09	1341	\N	29558	\N
38524	GENERIC_DAY	1	0	2010-02-13	1326	\N	29558	\N
38525	GENERIC_DAY	1	0	2010-03-25	1330	\N	29558	\N
38526	GENERIC_DAY	1	0	2010-04-17	1328	\N	29558	\N
38527	GENERIC_DAY	1	1	2010-06-01	1322	\N	29558	\N
38528	GENERIC_DAY	1	0	2010-04-04	1341	\N	29558	\N
38529	GENERIC_DAY	1	0	2010-03-20	1328	\N	29558	\N
38530	GENERIC_DAY	1	0	2010-04-20	1330	\N	29558	\N
38531	GENERIC_DAY	1	0	2010-03-28	1322	\N	29558	\N
38532	GENERIC_DAY	1	0	2010-05-02	1314	\N	29558	\N
38533	GENERIC_DAY	1	0	2010-02-14	1330	\N	29558	\N
38534	GENERIC_DAY	1	0	2010-03-25	1326	\N	29558	\N
38535	GENERIC_DAY	1	1	2010-03-02	1326	\N	29558	\N
38536	GENERIC_DAY	1	0	2010-05-04	1341	\N	29558	\N
38537	GENERIC_DAY	1	0	2010-02-03	1326	\N	29558	\N
38538	GENERIC_DAY	1	0	2010-04-05	1328	\N	29558	\N
38539	GENERIC_DAY	1	0	2010-06-01	1330	\N	29558	\N
38540	GENERIC_DAY	1	1	2010-05-19	1314	\N	29558	\N
38541	GENERIC_DAY	1	0	2010-04-11	1330	\N	29558	\N
38542	GENERIC_DAY	1	0	2010-05-07	1341	\N	29558	\N
38543	GENERIC_DAY	1	0	2010-03-24	1326	\N	29558	\N
38544	GENERIC_DAY	1	0	2010-04-24	1330	\N	29558	\N
38545	GENERIC_DAY	1	1	2010-02-03	1328	\N	29558	\N
38546	GENERIC_DAY	1	0	2010-03-27	1326	\N	29558	\N
38547	GENERIC_DAY	1	0	2010-02-25	1328	\N	29558	\N
38548	GENERIC_DAY	1	0	2010-05-23	1326	\N	29558	\N
38549	GENERIC_DAY	1	0	2010-05-03	1341	\N	29558	\N
38550	GENERIC_DAY	1	1	2010-02-25	1326	\N	29558	\N
38551	GENERIC_DAY	1	1	2010-02-22	1326	\N	29558	\N
38552	GENERIC_DAY	1	0	2010-03-14	1326	\N	29558	\N
38553	GENERIC_DAY	1	0	2010-02-18	1330	\N	29558	\N
38554	GENERIC_DAY	1	1	2010-02-16	1322	\N	29558	\N
38555	GENERIC_DAY	1	0	2010-03-31	1326	\N	29558	\N
38556	GENERIC_DAY	1	0	2010-03-29	1341	\N	29558	\N
38557	GENERIC_DAY	1	0	2010-05-01	1341	\N	29558	\N
38558	GENERIC_DAY	1	0	2010-03-08	1328	\N	29558	\N
38559	GENERIC_DAY	1	0	2010-03-23	1328	\N	29558	\N
38560	GENERIC_DAY	1	0	2010-04-24	1326	\N	29558	\N
38561	GENERIC_DAY	1	1	2010-03-22	1322	\N	29558	\N
38562	GENERIC_DAY	1	0	2010-05-17	1328	\N	29558	\N
38563	GENERIC_DAY	1	0	2010-04-23	1341	\N	29558	\N
38564	GENERIC_DAY	1	1	2010-05-13	1314	\N	29558	\N
38565	GENERIC_DAY	1	1	2010-06-01	1314	\N	29558	\N
38566	GENERIC_DAY	1	0	2010-04-15	1328	\N	29558	\N
38567	GENERIC_DAY	1	1	2010-04-12	1314	\N	29558	\N
38568	GENERIC_DAY	1	0	2010-05-07	1326	\N	29558	\N
38569	GENERIC_DAY	1	0	2010-03-19	1322	\N	29558	\N
38570	GENERIC_DAY	1	0	2010-05-02	1341	\N	29558	\N
38571	GENERIC_DAY	1	0	2010-03-10	1328	\N	29558	\N
38572	GENERIC_DAY	1	0	2010-05-15	1322	\N	29558	\N
38573	GENERIC_DAY	1	1	2010-04-29	1322	\N	29558	\N
38574	GENERIC_DAY	1	1	2010-02-24	1314	\N	29558	\N
38575	GENERIC_DAY	1	1	2010-03-29	1314	\N	29558	\N
38576	GENERIC_DAY	1	0	2010-02-23	1328	\N	29558	\N
38577	GENERIC_DAY	1	1	2010-02-12	1326	\N	29558	\N
38578	GENERIC_DAY	1	0	2010-02-12	1341	\N	29558	\N
38579	GENERIC_DAY	1	0	2010-03-09	1341	\N	29558	\N
38580	GENERIC_DAY	1	1	2010-02-22	1314	\N	29558	\N
38581	GENERIC_DAY	1	1	2010-02-26	1322	\N	29558	\N
38582	GENERIC_DAY	1	1	2010-04-23	1322	\N	29558	\N
38583	GENERIC_DAY	1	0	2010-02-21	1322	\N	29558	\N
38584	GENERIC_DAY	1	0	2010-04-15	1326	\N	29558	\N
38585	GENERIC_DAY	1	0	2010-02-09	1328	\N	29558	\N
38586	GENERIC_DAY	1	0	2010-03-07	1341	\N	29558	\N
38587	GENERIC_DAY	1	0	2010-04-03	1341	\N	29558	\N
38588	GENERIC_DAY	1	1	2010-04-09	1322	\N	29558	\N
38589	GENERIC_DAY	1	0	2010-02-20	1341	\N	29558	\N
38590	GENERIC_DAY	1	0	2010-02-07	1341	\N	29558	\N
38591	GENERIC_DAY	1	0	2010-05-18	1328	\N	29558	\N
38592	GENERIC_DAY	1	0	2010-04-24	1314	\N	29558	\N
38593	GENERIC_DAY	1	0	2010-02-28	1314	\N	29558	\N
38594	GENERIC_DAY	1	0	2010-05-10	1341	\N	29558	\N
38595	GENERIC_DAY	1	0	2010-06-02	1326	\N	29558	\N
38596	GENERIC_DAY	1	0	2010-03-31	1341	\N	29558	\N
38597	GENERIC_DAY	1	0	2010-03-07	1328	\N	29558	\N
38598	GENERIC_DAY	1	0	2010-03-23	1341	\N	29558	\N
38599	GENERIC_DAY	1	1	2010-04-20	1322	\N	29558	\N
38600	GENERIC_DAY	1	1	2010-03-30	1322	\N	29558	\N
38601	GENERIC_DAY	1	0	2010-02-09	1330	\N	29558	\N
38602	GENERIC_DAY	1	0	2010-03-20	1314	\N	29558	\N
38603	GENERIC_DAY	1	0	2010-05-14	1328	\N	29558	\N
38604	GENERIC_DAY	1	0	2010-03-28	1314	\N	29558	\N
38605	GENERIC_DAY	1	0	2010-04-27	1328	\N	29558	\N
38606	GENERIC_DAY	1	0	2010-02-11	1328	\N	29558	\N
38607	GENERIC_DAY	1	0	2010-02-16	1330	\N	29558	\N
38608	GENERIC_DAY	1	0	2010-04-18	1326	\N	29558	\N
38609	GENERIC_DAY	1	0	2010-04-06	1330	\N	29558	\N
38610	GENERIC_DAY	1	0	2010-05-23	1330	\N	29558	\N
38611	GENERIC_DAY	1	0	2010-04-14	1330	\N	29558	\N
38612	GENERIC_DAY	1	0	2010-02-06	1322	\N	29558	\N
38613	GENERIC_DAY	1	0	2010-03-15	1330	\N	29558	\N
38614	GENERIC_DAY	1	0	2010-04-16	1326	\N	29558	\N
38615	GENERIC_DAY	1	1	2010-04-21	1314	\N	29558	\N
38616	GENERIC_DAY	1	0	2010-03-11	1341	\N	29558	\N
38617	GENERIC_DAY	1	0	2010-02-17	1314	\N	29558	\N
38618	GENERIC_DAY	1	1	2010-03-09	1326	\N	29558	\N
38619	GENERIC_DAY	1	1	2010-03-31	1322	\N	29558	\N
38620	GENERIC_DAY	1	1	2010-03-24	1322	\N	29558	\N
38621	GENERIC_DAY	1	1	2010-05-12	1314	\N	29558	\N
38622	GENERIC_DAY	1	1	2010-03-01	1322	\N	29558	\N
38623	GENERIC_DAY	1	0	2010-05-05	1326	\N	29558	\N
38624	GENERIC_DAY	1	1	2010-03-17	1322	\N	29558	\N
38625	GENERIC_DAY	1	0	2010-06-01	1341	\N	29558	\N
38626	GENERIC_DAY	1	0	2010-05-04	1330	\N	29558	\N
38627	GENERIC_DAY	1	0	2010-04-06	1326	\N	29558	\N
38628	GENERIC_DAY	1	0	2010-02-25	1330	\N	29558	\N
38629	GENERIC_DAY	1	0	2010-02-10	1328	\N	29558	\N
38630	GENERIC_DAY	1	0	2010-04-10	1341	\N	29558	\N
38631	GENERIC_DAY	1	1	2010-02-02	1314	\N	29558	\N
38632	GENERIC_DAY	1	1	2010-05-19	1322	\N	29558	\N
38633	GENERIC_DAY	1	1	2010-05-20	1322	\N	29558	\N
38634	GENERIC_DAY	1	0	2010-05-08	1326	\N	29558	\N
38635	GENERIC_DAY	1	0	2010-05-03	1328	\N	29558	\N
38636	GENERIC_DAY	1	0	2010-04-20	1328	\N	29558	\N
38637	GENERIC_DAY	1	0	2010-03-16	1341	\N	29558	\N
38638	GENERIC_DAY	1	0	2010-02-07	1314	\N	29558	\N
38639	GENERIC_DAY	1	0	2010-03-14	1330	\N	29558	\N
38640	GENERIC_DAY	1	0	2010-05-26	1341	\N	29558	\N
38641	GENERIC_DAY	1	1	2010-05-25	1314	\N	29558	\N
38642	GENERIC_DAY	1	0	2010-04-01	1328	\N	29558	\N
38643	GENERIC_DAY	1	0	2010-03-16	1330	\N	29558	\N
38644	GENERIC_DAY	1	0	2010-05-24	1326	\N	29558	\N
38645	GENERIC_DAY	1	0	2010-04-11	1328	\N	29558	\N
38646	GENERIC_DAY	1	1	2010-03-03	1322	\N	29558	\N
38647	GENERIC_DAY	1	1	2010-02-18	1326	\N	29558	\N
38648	GENERIC_DAY	1	0	2010-03-07	1330	\N	29558	\N
38649	GENERIC_DAY	1	1	2010-02-05	1330	\N	29558	\N
38650	GENERIC_DAY	1	1	2010-04-06	1314	\N	29558	\N
38651	GENERIC_DAY	1	0	2010-03-11	1328	\N	29558	\N
38652	GENERIC_DAY	1	0	2010-04-16	1330	\N	29558	\N
38653	GENERIC_DAY	1	0	2010-05-19	1326	\N	29558	\N
38654	GENERIC_DAY	1	0	2010-03-24	1341	\N	29558	\N
38655	GENERIC_DAY	1	0	2010-05-02	1330	\N	29558	\N
38656	GENERIC_DAY	1	0	2010-03-09	1328	\N	29558	\N
38657	GENERIC_DAY	1	0	2010-03-26	1326	\N	29558	\N
38658	GENERIC_DAY	1	0	2010-04-07	1341	\N	29558	\N
38659	GENERIC_DAY	1	0	2010-05-12	1341	\N	29558	\N
38660	GENERIC_DAY	1	1	2010-02-19	1314	\N	29558	\N
38661	GENERIC_DAY	1	0	2010-03-11	1330	\N	29558	\N
38662	GENERIC_DAY	1	0	2010-03-23	1326	\N	29558	\N
38663	GENERIC_DAY	1	0	2010-04-14	1341	\N	29558	\N
38664	GENERIC_DAY	1	1	2010-03-01	1314	\N	29558	\N
38665	GENERIC_DAY	1	0	2010-02-07	1328	\N	29558	\N
38666	GENERIC_DAY	1	1	2010-03-10	1322	\N	29558	\N
38667	GENERIC_DAY	1	0	2010-03-18	1341	\N	29558	\N
38668	GENERIC_DAY	1	1	2010-05-11	1314	\N	29558	\N
38669	GENERIC_DAY	1	0	2010-04-02	1314	\N	29558	\N
38670	GENERIC_DAY	1	1	2010-03-10	1314	\N	29558	\N
38671	GENERIC_DAY	1	4	2010-02-02	1316	\N	29559	\N
38672	GENERIC_DAY	1	0	2010-05-01	1345	\N	29559	\N
38673	GENERIC_DAY	1	0	2010-02-21	1345	\N	29559	\N
38674	GENERIC_DAY	1	3	2010-03-31	1345	\N	29559	\N
38675	GENERIC_DAY	1	4	2010-02-24	1316	\N	29559	\N
38676	GENERIC_DAY	1	0	2010-04-05	1316	\N	29559	\N
38677	GENERIC_DAY	1	0	2010-03-19	1316	\N	29559	\N
38678	GENERIC_DAY	1	3	2010-04-21	1345	\N	29559	\N
38679	GENERIC_DAY	1	4	2010-05-25	1316	\N	29559	\N
38680	GENERIC_DAY	1	0	2010-05-16	1316	\N	29559	\N
38681	GENERIC_DAY	1	4	2010-04-07	1316	\N	29559	\N
38682	GENERIC_DAY	1	3	2010-03-15	1345	\N	29559	\N
38683	GENERIC_DAY	1	0	2010-02-14	1316	\N	29559	\N
38684	GENERIC_DAY	1	0	2010-02-27	1345	\N	29559	\N
38685	GENERIC_DAY	1	4	2010-03-04	1316	\N	29559	\N
38686	GENERIC_DAY	1	0	2010-05-29	1316	\N	29559	\N
38687	GENERIC_DAY	1	0	2010-04-03	1345	\N	29559	\N
38688	GENERIC_DAY	1	0	2010-03-06	1316	\N	29559	\N
38689	GENERIC_DAY	1	3	2010-04-13	1345	\N	29559	\N
38690	GENERIC_DAY	1	0	2010-05-30	1316	\N	29559	\N
38691	GENERIC_DAY	1	4	2010-03-02	1316	\N	29559	\N
38692	GENERIC_DAY	1	3	2010-05-18	1345	\N	29559	\N
38693	GENERIC_DAY	1	4	2010-05-28	1316	\N	29559	\N
38694	GENERIC_DAY	1	4	2010-02-12	1316	\N	29559	\N
38695	GENERIC_DAY	1	3	2010-03-11	1345	\N	29559	\N
38696	GENERIC_DAY	1	4	2010-03-23	1316	\N	29559	\N
38697	GENERIC_DAY	1	3	2010-03-22	1345	\N	29559	\N
38698	GENERIC_DAY	1	0	2010-04-11	1316	\N	29559	\N
38699	GENERIC_DAY	1	0	2010-03-21	1345	\N	29559	\N
38700	GENERIC_DAY	1	3	2010-02-10	1345	\N	29559	\N
38701	GENERIC_DAY	1	0	2010-05-17	1316	\N	29559	\N
38702	GENERIC_DAY	1	0	2010-03-13	1345	\N	29559	\N
38703	GENERIC_DAY	1	3	2010-05-03	1345	\N	29559	\N
38704	GENERIC_DAY	1	0	2010-03-28	1316	\N	29559	\N
38705	GENERIC_DAY	1	3	2010-05-28	1345	\N	29559	\N
38706	GENERIC_DAY	1	4	2010-05-21	1316	\N	29559	\N
38707	GENERIC_DAY	1	4	2010-03-05	1316	\N	29559	\N
38708	GENERIC_DAY	1	0	2010-04-25	1316	\N	29559	\N
38709	GENERIC_DAY	1	4	2010-04-23	1316	\N	29559	\N
38710	GENERIC_DAY	1	0	2010-04-01	1345	\N	29559	\N
38711	GENERIC_DAY	1	4	2010-04-13	1316	\N	29559	\N
38712	GENERIC_DAY	1	0	2010-03-20	1316	\N	29559	\N
38713	GENERIC_DAY	1	0	2010-05-01	1316	\N	29559	\N
38714	GENERIC_DAY	1	4	2010-02-16	1316	\N	29559	\N
38715	GENERIC_DAY	1	3	2010-02-15	1345	\N	29559	\N
38716	GENERIC_DAY	1	3	2010-04-26	1345	\N	29559	\N
38717	GENERIC_DAY	1	4	2010-05-05	1316	\N	29559	\N
38718	GENERIC_DAY	1	4	2010-04-15	1316	\N	29559	\N
38719	GENERIC_DAY	1	0	2010-05-08	1316	\N	29559	\N
38720	GENERIC_DAY	1	3	2010-05-20	1345	\N	29559	\N
38721	GENERIC_DAY	1	3	2010-04-16	1345	\N	29559	\N
38722	GENERIC_DAY	1	3	2010-05-19	1345	\N	29559	\N
38723	GENERIC_DAY	1	3	2010-05-06	1345	\N	29559	\N
38724	GENERIC_DAY	1	0	2010-03-13	1316	\N	29559	\N
38725	GENERIC_DAY	1	3	2010-02-04	1345	\N	29559	\N
38726	GENERIC_DAY	1	4	2010-04-19	1316	\N	29559	\N
38727	GENERIC_DAY	1	0	2010-02-14	1345	\N	29559	\N
38728	GENERIC_DAY	1	0	2010-05-02	1345	\N	29559	\N
38729	GENERIC_DAY	1	4	2010-03-08	1316	\N	29559	\N
38730	GENERIC_DAY	1	4	2010-03-22	1316	\N	29559	\N
38731	GENERIC_DAY	1	0	2010-05-22	1316	\N	29559	\N
38732	GENERIC_DAY	1	0	2010-04-10	1345	\N	29559	\N
38733	GENERIC_DAY	1	4	2010-03-03	1316	\N	29559	\N
38734	GENERIC_DAY	1	3	2010-04-09	1345	\N	29559	\N
38735	GENERIC_DAY	1	4	2010-05-14	1316	\N	29559	\N
38736	GENERIC_DAY	1	4	2010-02-05	1316	\N	29559	\N
38737	GENERIC_DAY	1	3	2010-05-04	1345	\N	29559	\N
38738	GENERIC_DAY	1	4	2010-05-20	1316	\N	29559	\N
38739	GENERIC_DAY	1	0	2010-05-23	1345	\N	29559	\N
38740	GENERIC_DAY	1	4	2010-04-08	1316	\N	29559	\N
38741	GENERIC_DAY	1	3	2010-02-05	1345	\N	29559	\N
38742	GENERIC_DAY	1	4	2010-03-10	1316	\N	29559	\N
38743	GENERIC_DAY	1	3	2010-03-17	1345	\N	29559	\N
38744	GENERIC_DAY	1	0	2010-05-17	1345	\N	29559	\N
38745	GENERIC_DAY	1	3	2010-02-16	1345	\N	29559	\N
38746	GENERIC_DAY	1	4	2010-04-21	1316	\N	29559	\N
38747	GENERIC_DAY	1	3	2010-04-27	1345	\N	29559	\N
38748	GENERIC_DAY	1	0	2010-04-17	1316	\N	29559	\N
38749	GENERIC_DAY	1	4	2010-02-01	1316	\N	29559	\N
38750	GENERIC_DAY	1	3	2010-05-25	1345	\N	29559	\N
38751	GENERIC_DAY	1	3	2010-04-20	1345	\N	29559	\N
38752	GENERIC_DAY	1	4	2010-02-18	1316	\N	29559	\N
38753	GENERIC_DAY	1	0	2010-02-20	1316	\N	29559	\N
38754	GENERIC_DAY	1	0	2010-05-15	1316	\N	29559	\N
38755	GENERIC_DAY	1	0	2010-02-17	1316	\N	29559	\N
38756	GENERIC_DAY	1	0	2010-02-07	1345	\N	29559	\N
38757	GENERIC_DAY	1	4	2010-02-11	1316	\N	29559	\N
38758	GENERIC_DAY	1	0	2010-05-22	1345	\N	29559	\N
38759	GENERIC_DAY	1	3	2010-03-18	1345	\N	29559	\N
38760	GENERIC_DAY	1	3	2010-04-28	1345	\N	29559	\N
38761	GENERIC_DAY	1	3	2010-03-12	1345	\N	29559	\N
38762	GENERIC_DAY	1	3	2010-02-03	1345	\N	29559	\N
38763	GENERIC_DAY	1	3	2010-04-12	1345	\N	29559	\N
38764	GENERIC_DAY	1	4	2010-02-09	1316	\N	29559	\N
38765	GENERIC_DAY	1	0	2010-04-24	1345	\N	29559	\N
38766	GENERIC_DAY	1	0	2010-04-04	1316	\N	29559	\N
38767	GENERIC_DAY	1	4	2010-03-16	1316	\N	29559	\N
38768	GENERIC_DAY	1	4	2010-03-24	1316	\N	29559	\N
38769	GENERIC_DAY	1	4	2010-04-06	1316	\N	29559	\N
38770	GENERIC_DAY	1	3	2010-02-12	1345	\N	29559	\N
38771	GENERIC_DAY	1	4	2010-02-26	1316	\N	29559	\N
38772	GENERIC_DAY	1	0	2010-02-13	1316	\N	29559	\N
38773	GENERIC_DAY	1	0	2010-03-28	1345	\N	29559	\N
38774	GENERIC_DAY	1	4	2010-05-04	1316	\N	29559	\N
38775	GENERIC_DAY	1	0	2010-03-19	1345	\N	29559	\N
38776	GENERIC_DAY	1	0	2010-02-13	1345	\N	29559	\N
38777	GENERIC_DAY	1	0	2010-02-28	1345	\N	29559	\N
38778	GENERIC_DAY	1	0	2010-04-11	1345	\N	29559	\N
38779	GENERIC_DAY	1	3	2010-03-08	1345	\N	29559	\N
38780	GENERIC_DAY	1	4	2010-03-15	1316	\N	29559	\N
38781	GENERIC_DAY	1	3	2010-03-24	1345	\N	29559	\N
38782	GENERIC_DAY	1	3	2010-04-14	1345	\N	29559	\N
38783	GENERIC_DAY	1	3	2010-04-19	1345	\N	29559	\N
38784	GENERIC_DAY	1	3	2010-03-09	1345	\N	29559	\N
38785	GENERIC_DAY	1	0	2010-04-24	1316	\N	29559	\N
38786	GENERIC_DAY	1	0	2010-04-01	1316	\N	29559	\N
38787	GENERIC_DAY	1	0	2010-02-06	1316	\N	29559	\N
38788	GENERIC_DAY	1	0	2010-03-27	1316	\N	29559	\N
38789	GENERIC_DAY	1	0	2010-05-23	1316	\N	29559	\N
38790	GENERIC_DAY	1	0	2010-05-29	1345	\N	29559	\N
38791	GENERIC_DAY	1	4	2010-05-24	1316	\N	29559	\N
38792	GENERIC_DAY	1	4	2010-03-12	1316	\N	29559	\N
38793	GENERIC_DAY	1	3	2010-04-22	1345	\N	29559	\N
38794	GENERIC_DAY	1	3	2010-04-23	1345	\N	29559	\N
38795	GENERIC_DAY	1	0	2010-04-02	1316	\N	29559	\N
38796	GENERIC_DAY	1	3	2010-02-24	1345	\N	29559	\N
38797	GENERIC_DAY	1	3	2010-05-11	1345	\N	29559	\N
38798	GENERIC_DAY	1	0	2010-02-21	1316	\N	29559	\N
38799	GENERIC_DAY	1	0	2010-03-06	1345	\N	29559	\N
38800	GENERIC_DAY	1	4	2010-04-22	1316	\N	29559	\N
38801	GENERIC_DAY	1	3	2010-03-10	1345	\N	29559	\N
38802	GENERIC_DAY	1	4	2010-03-31	1316	\N	29559	\N
38803	GENERIC_DAY	1	0	2010-05-09	1345	\N	29559	\N
38804	GENERIC_DAY	1	3	2010-05-13	1345	\N	29559	\N
38805	GENERIC_DAY	1	0	2010-03-07	1345	\N	29559	\N
38806	GENERIC_DAY	1	0	2010-04-10	1316	\N	29559	\N
38807	GENERIC_DAY	1	0	2010-03-27	1345	\N	29559	\N
38808	GENERIC_DAY	1	4	2010-05-11	1316	\N	29559	\N
38809	GENERIC_DAY	1	0	2010-05-16	1345	\N	29559	\N
38810	GENERIC_DAY	1	4	2010-02-25	1316	\N	29559	\N
38811	GENERIC_DAY	1	4	2010-03-11	1316	\N	29559	\N
38812	GENERIC_DAY	1	3	2010-03-01	1345	\N	29559	\N
38813	GENERIC_DAY	1	4	2010-04-29	1316	\N	29559	\N
38814	GENERIC_DAY	1	0	2010-04-04	1345	\N	29559	\N
38815	GENERIC_DAY	1	3	2010-02-26	1345	\N	29559	\N
38816	GENERIC_DAY	1	4	2010-03-26	1316	\N	29559	\N
38817	GENERIC_DAY	1	3	2010-04-06	1345	\N	29559	\N
38818	GENERIC_DAY	1	3	2010-02-18	1345	\N	29559	\N
38819	GENERIC_DAY	1	0	2010-04-25	1345	\N	29559	\N
38820	GENERIC_DAY	1	4	2010-02-04	1316	\N	29559	\N
38821	GENERIC_DAY	1	4	2010-03-09	1316	\N	29559	\N
38822	GENERIC_DAY	1	4	2010-05-27	1316	\N	29559	\N
38823	GENERIC_DAY	1	3	2010-05-26	1345	\N	29559	\N
38824	GENERIC_DAY	1	0	2010-05-15	1345	\N	29559	\N
38825	GENERIC_DAY	1	3	2010-03-03	1345	\N	29559	\N
38826	GENERIC_DAY	1	0	2010-03-21	1316	\N	29559	\N
38827	GENERIC_DAY	1	3	2010-03-04	1345	\N	29559	\N
38828	GENERIC_DAY	1	0	2010-04-17	1345	\N	29559	\N
38829	GENERIC_DAY	1	3	2010-03-02	1345	\N	29559	\N
38830	GENERIC_DAY	1	3	2010-05-07	1345	\N	29559	\N
38831	GENERIC_DAY	1	3	2010-05-21	1345	\N	29559	\N
38832	GENERIC_DAY	1	4	2010-04-16	1316	\N	29559	\N
38833	GENERIC_DAY	1	3	2010-02-23	1345	\N	29559	\N
38834	GENERIC_DAY	1	4	2010-05-06	1316	\N	29559	\N
38835	GENERIC_DAY	1	0	2010-04-05	1345	\N	29559	\N
38836	GENERIC_DAY	1	3	2010-02-19	1345	\N	29559	\N
38837	GENERIC_DAY	1	0	2010-05-09	1316	\N	29559	\N
38838	GENERIC_DAY	1	3	2010-02-22	1345	\N	29559	\N
38839	GENERIC_DAY	1	0	2010-05-30	1345	\N	29559	\N
38840	GENERIC_DAY	1	0	2010-03-14	1345	\N	29559	\N
38841	GENERIC_DAY	1	3	2010-02-02	1345	\N	29559	\N
38842	GENERIC_DAY	1	3	2010-02-25	1345	\N	29559	\N
38843	GENERIC_DAY	1	4	2010-05-19	1316	\N	29559	\N
38844	GENERIC_DAY	1	0	2010-02-27	1316	\N	29559	\N
38845	GENERIC_DAY	1	3	2010-04-15	1345	\N	29559	\N
38846	GENERIC_DAY	1	4	2010-05-12	1316	\N	29559	\N
38847	GENERIC_DAY	1	3	2010-02-08	1345	\N	29559	\N
38848	GENERIC_DAY	1	4	2010-05-07	1316	\N	29559	\N
38849	GENERIC_DAY	1	3	2010-05-10	1345	\N	29559	\N
38850	GENERIC_DAY	1	4	2010-05-10	1316	\N	29559	\N
38851	GENERIC_DAY	1	3	2010-04-30	1345	\N	29559	\N
38852	GENERIC_DAY	1	4	2010-02-19	1316	\N	29559	\N
38853	GENERIC_DAY	1	4	2010-02-08	1316	\N	29559	\N
38854	GENERIC_DAY	1	4	2010-03-01	1316	\N	29559	\N
38855	GENERIC_DAY	1	4	2010-04-14	1316	\N	29559	\N
38856	GENERIC_DAY	1	4	2010-03-25	1316	\N	29559	\N
38857	GENERIC_DAY	1	0	2010-04-18	1345	\N	29559	\N
38858	GENERIC_DAY	1	4	2010-03-30	1316	\N	29559	\N
38859	GENERIC_DAY	1	3	2010-03-23	1345	\N	29559	\N
38860	GENERIC_DAY	1	4	2010-04-12	1316	\N	29559	\N
38861	GENERIC_DAY	1	3	2010-03-26	1345	\N	29559	\N
38862	GENERIC_DAY	1	3	2010-02-09	1345	\N	29559	\N
38863	GENERIC_DAY	1	3	2010-04-08	1345	\N	29559	\N
38864	GENERIC_DAY	1	4	2010-05-31	1316	\N	29559	\N
38865	GENERIC_DAY	1	4	2010-04-09	1316	\N	29559	\N
38866	GENERIC_DAY	1	0	2010-05-08	1345	\N	29559	\N
38867	GENERIC_DAY	1	3	2010-03-16	1345	\N	29559	\N
38868	GENERIC_DAY	1	4	2010-02-23	1316	\N	29559	\N
38869	GENERIC_DAY	1	3	2010-03-29	1345	\N	29559	\N
38870	GENERIC_DAY	1	0	2010-04-18	1316	\N	29559	\N
38871	GENERIC_DAY	1	4	2010-05-26	1316	\N	29559	\N
38872	GENERIC_DAY	1	4	2010-03-17	1316	\N	29559	\N
38873	GENERIC_DAY	1	3	2010-03-25	1345	\N	29559	\N
38874	GENERIC_DAY	1	0	2010-03-20	1345	\N	29559	\N
38875	GENERIC_DAY	1	4	2010-02-10	1316	\N	29559	\N
38876	GENERIC_DAY	1	4	2010-04-28	1316	\N	29559	\N
38877	GENERIC_DAY	1	0	2010-05-02	1316	\N	29559	\N
38878	GENERIC_DAY	1	4	2010-04-30	1316	\N	29559	\N
38879	GENERIC_DAY	1	4	2010-04-20	1316	\N	29559	\N
38880	GENERIC_DAY	1	3	2010-03-05	1345	\N	29559	\N
38881	GENERIC_DAY	1	4	2010-04-27	1316	\N	29559	\N
38882	GENERIC_DAY	1	4	2010-02-22	1316	\N	29559	\N
38883	GENERIC_DAY	1	3	2010-04-29	1345	\N	29559	\N
38884	GENERIC_DAY	1	0	2010-02-17	1345	\N	29559	\N
38885	GENERIC_DAY	1	4	2010-02-03	1316	\N	29559	\N
38886	GENERIC_DAY	1	4	2010-03-18	1316	\N	29559	\N
38887	GENERIC_DAY	1	0	2010-02-06	1345	\N	29559	\N
38888	GENERIC_DAY	1	4	2010-05-03	1316	\N	29559	\N
38889	GENERIC_DAY	1	0	2010-04-02	1345	\N	29559	\N
38890	GENERIC_DAY	1	3	2010-03-30	1345	\N	29559	\N
38891	GENERIC_DAY	1	3	2010-02-01	1345	\N	29559	\N
38892	GENERIC_DAY	1	0	2010-03-14	1316	\N	29559	\N
38893	GENERIC_DAY	1	0	2010-03-07	1316	\N	29559	\N
38894	GENERIC_DAY	1	3	2010-05-12	1345	\N	29559	\N
38895	GENERIC_DAY	1	3	2010-05-31	1345	\N	29559	\N
38896	GENERIC_DAY	1	3	2010-04-07	1345	\N	29559	\N
38897	GENERIC_DAY	1	3	2010-05-24	1345	\N	29559	\N
38898	GENERIC_DAY	1	4	2010-05-13	1316	\N	29559	\N
38899	GENERIC_DAY	1	0	2010-02-07	1316	\N	29559	\N
38900	GENERIC_DAY	1	4	2010-04-26	1316	\N	29559	\N
38901	GENERIC_DAY	1	4	2010-02-15	1316	\N	29559	\N
38902	GENERIC_DAY	1	4	2010-05-18	1316	\N	29559	\N
38903	GENERIC_DAY	1	0	2010-02-28	1316	\N	29559	\N
38904	GENERIC_DAY	1	3	2010-05-05	1345	\N	29559	\N
38905	GENERIC_DAY	1	3	2010-05-14	1345	\N	29559	\N
38906	GENERIC_DAY	1	3	2010-05-27	1345	\N	29559	\N
38907	GENERIC_DAY	1	3	2010-02-11	1345	\N	29559	\N
38908	GENERIC_DAY	1	0	2010-02-20	1345	\N	29559	\N
38909	GENERIC_DAY	1	4	2010-03-29	1316	\N	29559	\N
38910	GENERIC_DAY	1	0	2010-04-03	1316	\N	29559	\N
38911	GENERIC_DAY	1	0	2010-02-06	1328	\N	29560	\N
38912	GENERIC_DAY	1	0	2010-02-06	1326	\N	29560	\N
38913	GENERIC_DAY	1	1	2010-02-10	1326	\N	29560	\N
38914	GENERIC_DAY	1	1	2010-02-15	1328	\N	29560	\N
38915	GENERIC_DAY	1	0	2010-02-13	1328	\N	29560	\N
38916	GENERIC_DAY	1	0	2010-02-13	1314	\N	29560	\N
38917	GENERIC_DAY	1	1	2010-02-10	1314	\N	29560	\N
38918	GENERIC_DAY	1	2	2010-02-11	1330	\N	29560	\N
38919	GENERIC_DAY	1	0	2010-02-14	1341	\N	29560	\N
38920	GENERIC_DAY	1	1	2010-02-12	1341	\N	29560	\N
38921	GENERIC_DAY	1	2	2010-02-08	1328	\N	29560	\N
38922	GENERIC_DAY	1	0	2010-02-07	1328	\N	29560	\N
38923	GENERIC_DAY	1	1	2010-02-09	1326	\N	29560	\N
38924	GENERIC_DAY	1	0	2010-02-06	1341	\N	29560	\N
38925	GENERIC_DAY	1	1	2010-02-11	1326	\N	29560	\N
38926	GENERIC_DAY	1	0	2010-02-15	1326	\N	29560	\N
38927	GENERIC_DAY	1	2	2010-02-12	1328	\N	29560	\N
38928	GENERIC_DAY	1	2	2010-02-11	1328	\N	29560	\N
38929	GENERIC_DAY	1	0	2010-02-07	1326	\N	29560	\N
38930	GENERIC_DAY	1	1	2010-02-08	1314	\N	29560	\N
38931	GENERIC_DAY	1	0	2010-02-14	1330	\N	29560	\N
38932	GENERIC_DAY	1	1	2010-02-08	1341	\N	29560	\N
38933	GENERIC_DAY	1	1	2010-02-12	1326	\N	29560	\N
38934	GENERIC_DAY	1	0	2010-02-15	1314	\N	29560	\N
38935	GENERIC_DAY	1	0	2010-02-07	1314	\N	29560	\N
38936	GENERIC_DAY	1	1	2010-02-09	1322	\N	29560	\N
38937	GENERIC_DAY	1	2	2010-02-09	1330	\N	29560	\N
38938	GENERIC_DAY	1	0	2010-02-14	1314	\N	29560	\N
38939	GENERIC_DAY	1	2	2010-02-10	1330	\N	29560	\N
38940	GENERIC_DAY	1	1	2010-02-12	1322	\N	29560	\N
38941	GENERIC_DAY	1	1	2010-02-09	1341	\N	29560	\N
38942	GENERIC_DAY	1	0	2010-02-15	1341	\N	29560	\N
38943	GENERIC_DAY	1	0	2010-02-15	1322	\N	29560	\N
38944	GENERIC_DAY	1	0	2010-02-14	1326	\N	29560	\N
38945	GENERIC_DAY	1	1	2010-02-11	1314	\N	29560	\N
38946	GENERIC_DAY	1	1	2010-02-08	1326	\N	29560	\N
38947	GENERIC_DAY	1	0	2010-02-13	1330	\N	29560	\N
38948	GENERIC_DAY	1	1	2010-02-08	1322	\N	29560	\N
38949	GENERIC_DAY	1	0	2010-02-06	1330	\N	29560	\N
38950	GENERIC_DAY	1	0	2010-02-06	1314	\N	29560	\N
38951	GENERIC_DAY	1	1	2010-02-12	1314	\N	29560	\N
38952	GENERIC_DAY	1	0	2010-02-13	1326	\N	29560	\N
38953	GENERIC_DAY	1	1	2010-02-10	1341	\N	29560	\N
38954	GENERIC_DAY	1	0	2010-02-14	1328	\N	29560	\N
38955	GENERIC_DAY	1	2	2010-02-08	1330	\N	29560	\N
38956	GENERIC_DAY	1	0	2010-02-07	1341	\N	29560	\N
38957	GENERIC_DAY	1	1	2010-02-15	1330	\N	29560	\N
38958	GENERIC_DAY	1	2	2010-02-10	1328	\N	29560	\N
38959	GENERIC_DAY	1	2	2010-02-09	1328	\N	29560	\N
38960	GENERIC_DAY	1	1	2010-02-10	1322	\N	29560	\N
38961	GENERIC_DAY	1	0	2010-02-13	1341	\N	29560	\N
38962	GENERIC_DAY	1	0	2010-02-07	1322	\N	29560	\N
38963	GENERIC_DAY	1	2	2010-02-12	1330	\N	29560	\N
38964	GENERIC_DAY	1	1	2010-02-09	1314	\N	29560	\N
38965	GENERIC_DAY	1	0	2010-02-14	1322	\N	29560	\N
38966	GENERIC_DAY	1	1	2010-02-11	1341	\N	29560	\N
38967	GENERIC_DAY	1	0	2010-02-06	1322	\N	29560	\N
38968	GENERIC_DAY	1	0	2010-02-07	1330	\N	29560	\N
38969	GENERIC_DAY	1	0	2010-02-13	1322	\N	29560	\N
38970	GENERIC_DAY	1	1	2010-02-11	1322	\N	29560	\N
38971	GENERIC_DAY	1	1	2010-02-23	1341	\N	29561	\N
38972	GENERIC_DAY	1	1	2010-02-22	1341	\N	29561	\N
38973	GENERIC_DAY	1	1	2010-02-16	1322	\N	29561	\N
38974	GENERIC_DAY	1	2	2010-02-16	1330	\N	29561	\N
38975	GENERIC_DAY	1	0	2010-02-20	1326	\N	29561	\N
38976	GENERIC_DAY	1	0	2010-02-21	1330	\N	29561	\N
38977	GENERIC_DAY	1	1	2010-02-22	1326	\N	29561	\N
38978	GENERIC_DAY	1	0	2010-02-21	1322	\N	29561	\N
38979	GENERIC_DAY	1	1	2010-02-19	1326	\N	29561	\N
38980	GENERIC_DAY	1	0	2010-02-21	1314	\N	29561	\N
38981	GENERIC_DAY	1	2	2010-02-19	1328	\N	29561	\N
38982	GENERIC_DAY	1	0	2010-02-23	1326	\N	29561	\N
38983	GENERIC_DAY	1	2	2010-02-19	1330	\N	29561	\N
38984	GENERIC_DAY	1	1	2010-02-23	1330	\N	29561	\N
38985	GENERIC_DAY	1	1	2010-02-16	1326	\N	29561	\N
38986	GENERIC_DAY	1	1	2010-02-22	1314	\N	29561	\N
38987	GENERIC_DAY	1	0	2010-02-17	1314	\N	29561	\N
38988	GENERIC_DAY	1	1	2010-02-23	1328	\N	29561	\N
38989	GENERIC_DAY	1	0	2010-02-21	1326	\N	29561	\N
38990	GENERIC_DAY	1	0	2010-02-20	1314	\N	29561	\N
38991	GENERIC_DAY	1	2	2010-02-16	1328	\N	29561	\N
38992	GENERIC_DAY	1	1	2010-02-18	1322	\N	29561	\N
38993	GENERIC_DAY	1	1	2010-02-19	1341	\N	29561	\N
38994	GENERIC_DAY	1	0	2010-02-20	1322	\N	29561	\N
38995	GENERIC_DAY	1	1	2010-02-19	1314	\N	29561	\N
38996	GENERIC_DAY	1	1	2010-02-16	1341	\N	29561	\N
38997	GENERIC_DAY	1	2	2010-02-22	1330	\N	29561	\N
38998	GENERIC_DAY	1	0	2010-02-17	1341	\N	29561	\N
38999	GENERIC_DAY	1	1	2010-02-18	1314	\N	29561	\N
39000	GENERIC_DAY	1	0	2010-02-20	1341	\N	29561	\N
39001	GENERIC_DAY	1	0	2010-02-20	1330	\N	29561	\N
39002	GENERIC_DAY	1	0	2010-02-20	1328	\N	29561	\N
39003	GENERIC_DAY	1	1	2010-02-16	1314	\N	29561	\N
39004	GENERIC_DAY	1	1	2010-02-18	1326	\N	29561	\N
39005	GENERIC_DAY	1	1	2010-02-22	1322	\N	29561	\N
39006	GENERIC_DAY	1	2	2010-02-22	1328	\N	29561	\N
39007	GENERIC_DAY	1	0	2010-02-21	1341	\N	29561	\N
39008	GENERIC_DAY	1	0	2010-02-17	1326	\N	29561	\N
39009	GENERIC_DAY	1	0	2010-02-21	1328	\N	29561	\N
39010	GENERIC_DAY	1	0	2010-02-23	1322	\N	29561	\N
39011	GENERIC_DAY	1	0	2010-02-23	1314	\N	29561	\N
39012	GENERIC_DAY	1	0	2010-02-17	1328	\N	29561	\N
39013	GENERIC_DAY	1	1	2010-02-18	1341	\N	29561	\N
39014	GENERIC_DAY	1	1	2010-02-19	1322	\N	29561	\N
39015	GENERIC_DAY	1	0	2010-02-17	1330	\N	29561	\N
39016	GENERIC_DAY	1	2	2010-02-18	1328	\N	29561	\N
39017	GENERIC_DAY	1	0	2010-02-17	1322	\N	29561	\N
39018	GENERIC_DAY	1	2	2010-02-18	1330	\N	29561	\N
39019	GENERIC_DAY	1	3	2010-05-24	1322	\N	29562	\N
39020	GENERIC_DAY	1	3	2010-05-19	1341	\N	29562	\N
39021	GENERIC_DAY	1	3	2010-05-25	1322	\N	29562	\N
39022	GENERIC_DAY	1	2	2010-05-27	1322	\N	29562	\N
39023	GENERIC_DAY	1	0	2010-05-22	1341	\N	29562	\N
39024	GENERIC_DAY	1	3	2010-05-20	1341	\N	29562	\N
39025	GENERIC_DAY	1	3	2010-05-21	1330	\N	29562	\N
39026	GENERIC_DAY	1	2	2010-05-28	1330	\N	29562	\N
39027	GENERIC_DAY	1	3	2010-05-26	1314	\N	29562	\N
39028	GENERIC_DAY	1	3	2010-05-24	1330	\N	29562	\N
39029	GENERIC_DAY	1	2	2010-05-20	1326	\N	29562	\N
39030	GENERIC_DAY	1	0	2010-05-22	1328	\N	29562	\N
39031	GENERIC_DAY	1	0	2010-05-16	1341	\N	29562	\N
39032	GENERIC_DAY	1	0	2010-05-15	1341	\N	29562	\N
39033	GENERIC_DAY	1	3	2010-05-26	1341	\N	29562	\N
39034	GENERIC_DAY	1	0	2010-05-22	1330	\N	29562	\N
39035	GENERIC_DAY	1	3	2010-05-25	1341	\N	29562	\N
39036	GENERIC_DAY	1	2	2010-05-25	1328	\N	29562	\N
39037	GENERIC_DAY	1	0	2010-05-23	1328	\N	29562	\N
39038	GENERIC_DAY	1	2	2010-05-25	1326	\N	29562	\N
39039	GENERIC_DAY	1	2	2010-05-19	1326	\N	29562	\N
39040	GENERIC_DAY	1	3	2010-05-18	1341	\N	29562	\N
39041	GENERIC_DAY	1	3	2010-05-21	1314	\N	29562	\N
39042	GENERIC_DAY	1	3	2010-05-20	1322	\N	29562	\N
39043	GENERIC_DAY	1	2	2010-05-18	1328	\N	29562	\N
39044	GENERIC_DAY	1	3	2010-05-20	1314	\N	29562	\N
39045	GENERIC_DAY	1	0	2010-05-17	1322	\N	29562	\N
39046	GENERIC_DAY	1	2	2010-05-21	1328	\N	29562	\N
39047	GENERIC_DAY	1	0	2010-05-23	1330	\N	29562	\N
39048	GENERIC_DAY	1	3	2010-05-27	1341	\N	29562	\N
39049	GENERIC_DAY	1	3	2010-05-27	1314	\N	29562	\N
39050	GENERIC_DAY	1	3	2010-05-18	1322	\N	29562	\N
39051	GENERIC_DAY	1	3	2010-05-18	1314	\N	29562	\N
39052	GENERIC_DAY	1	0	2010-05-15	1330	\N	29562	\N
39053	GENERIC_DAY	1	3	2010-05-20	1330	\N	29562	\N
39054	GENERIC_DAY	1	2	2010-05-26	1326	\N	29562	\N
39055	GENERIC_DAY	1	0	2010-05-16	1314	\N	29562	\N
39056	GENERIC_DAY	1	3	2010-05-24	1314	\N	29562	\N
39057	GENERIC_DAY	1	3	2010-05-19	1314	\N	29562	\N
39058	GENERIC_DAY	1	2	2010-05-27	1326	\N	29562	\N
39059	GENERIC_DAY	1	0	2010-05-16	1326	\N	29562	\N
39060	GENERIC_DAY	1	3	2010-05-24	1341	\N	29562	\N
39061	GENERIC_DAY	1	0	2010-05-23	1322	\N	29562	\N
39062	GENERIC_DAY	1	2	2010-05-28	1328	\N	29562	\N
39063	GENERIC_DAY	1	3	2010-05-21	1341	\N	29562	\N
39064	GENERIC_DAY	1	0	2010-05-23	1314	\N	29562	\N
39065	GENERIC_DAY	1	2	2010-05-19	1328	\N	29562	\N
39066	GENERIC_DAY	1	2	2010-05-28	1314	\N	29562	\N
39067	GENERIC_DAY	1	0	2010-05-16	1322	\N	29562	\N
39068	GENERIC_DAY	1	3	2010-05-19	1330	\N	29562	\N
39069	GENERIC_DAY	1	0	2010-05-22	1322	\N	29562	\N
39070	GENERIC_DAY	1	2	2010-05-24	1326	\N	29562	\N
39071	GENERIC_DAY	1	0	2010-05-15	1326	\N	29562	\N
39072	GENERIC_DAY	1	0	2010-05-17	1314	\N	29562	\N
39073	GENERIC_DAY	1	2	2010-05-28	1341	\N	29562	\N
39074	GENERIC_DAY	1	2	2010-05-28	1326	\N	29562	\N
39075	GENERIC_DAY	1	3	2010-05-26	1322	\N	29562	\N
39076	GENERIC_DAY	1	0	2010-05-15	1322	\N	29562	\N
39077	GENERIC_DAY	1	0	2010-05-22	1314	\N	29562	\N
39078	GENERIC_DAY	1	0	2010-05-17	1328	\N	29562	\N
39079	GENERIC_DAY	1	0	2010-05-15	1328	\N	29562	\N
39080	GENERIC_DAY	1	0	2010-05-23	1326	\N	29562	\N
39081	GENERIC_DAY	1	0	2010-05-22	1326	\N	29562	\N
39082	GENERIC_DAY	1	3	2010-05-27	1330	\N	29562	\N
39083	GENERIC_DAY	1	2	2010-05-21	1326	\N	29562	\N
39084	GENERIC_DAY	1	3	2010-05-27	1328	\N	29562	\N
39085	GENERIC_DAY	1	0	2010-05-17	1341	\N	29562	\N
39086	GENERIC_DAY	1	0	2010-05-17	1326	\N	29562	\N
39087	GENERIC_DAY	1	0	2010-05-17	1330	\N	29562	\N
39088	GENERIC_DAY	1	0	2010-05-15	1314	\N	29562	\N
39089	GENERIC_DAY	1	2	2010-05-26	1328	\N	29562	\N
39090	GENERIC_DAY	1	2	2010-05-28	1322	\N	29562	\N
39091	GENERIC_DAY	1	2	2010-05-20	1328	\N	29562	\N
39092	GENERIC_DAY	1	0	2010-05-16	1328	\N	29562	\N
39093	GENERIC_DAY	1	3	2010-05-19	1322	\N	29562	\N
39094	GENERIC_DAY	1	2	2010-05-24	1328	\N	29562	\N
39095	GENERIC_DAY	1	3	2010-05-25	1314	\N	29562	\N
39096	GENERIC_DAY	1	0	2010-05-16	1330	\N	29562	\N
39097	GENERIC_DAY	1	2	2010-05-18	1326	\N	29562	\N
39098	GENERIC_DAY	1	3	2010-05-25	1330	\N	29562	\N
39099	GENERIC_DAY	1	0	2010-05-23	1341	\N	29562	\N
39100	GENERIC_DAY	1	3	2010-05-21	1322	\N	29562	\N
39101	GENERIC_DAY	1	3	2010-05-18	1330	\N	29562	\N
39102	GENERIC_DAY	1	3	2010-05-26	1330	\N	29562	\N
39103	GENERIC_DAY	1	0	2010-03-07	1326	\N	29563	\N
39104	GENERIC_DAY	1	0	2010-03-06	1314	\N	29563	\N
39105	GENERIC_DAY	1	2	2010-03-08	1328	\N	29563	\N
39106	GENERIC_DAY	1	0	2010-03-06	1326	\N	29563	\N
39107	GENERIC_DAY	1	0	2010-03-06	1328	\N	29563	\N
39108	GENERIC_DAY	1	1	2010-03-05	1322	\N	29563	\N
39109	GENERIC_DAY	1	0	2010-03-09	1314	\N	29563	\N
39110	GENERIC_DAY	1	1	2010-03-08	1314	\N	29563	\N
39111	GENERIC_DAY	1	0	2010-03-09	1322	\N	29563	\N
39112	GENERIC_DAY	1	0	2010-03-07	1314	\N	29563	\N
39113	GENERIC_DAY	1	1	2010-03-09	1330	\N	29563	\N
39114	GENERIC_DAY	1	1	2010-03-05	1326	\N	29563	\N
39115	GENERIC_DAY	1	2	2010-03-04	1328	\N	29563	\N
39116	GENERIC_DAY	1	1	2010-03-09	1341	\N	29563	\N
39117	GENERIC_DAY	1	1	2010-03-05	1314	\N	29563	\N
39118	GENERIC_DAY	1	0	2010-03-07	1330	\N	29563	\N
39119	GENERIC_DAY	1	1	2010-03-04	1322	\N	29563	\N
39120	GENERIC_DAY	1	1	2010-03-08	1326	\N	29563	\N
39121	GENERIC_DAY	1	0	2010-03-06	1330	\N	29563	\N
39122	GENERIC_DAY	1	0	2010-03-06	1322	\N	29563	\N
39123	GENERIC_DAY	1	0	2010-03-09	1326	\N	29563	\N
39124	GENERIC_DAY	1	1	2010-03-05	1341	\N	29563	\N
39125	GENERIC_DAY	1	1	2010-03-08	1341	\N	29563	\N
39126	GENERIC_DAY	1	2	2010-03-05	1330	\N	29563	\N
39127	GENERIC_DAY	1	1	2010-03-08	1322	\N	29563	\N
39128	GENERIC_DAY	1	0	2010-03-07	1322	\N	29563	\N
39129	GENERIC_DAY	1	1	2010-03-04	1326	\N	29563	\N
39130	GENERIC_DAY	1	2	2010-03-04	1330	\N	29563	\N
39131	GENERIC_DAY	1	0	2010-03-07	1328	\N	29563	\N
39132	GENERIC_DAY	1	2	2010-03-08	1330	\N	29563	\N
39133	GENERIC_DAY	1	1	2010-03-04	1341	\N	29563	\N
39134	GENERIC_DAY	1	1	2010-03-09	1328	\N	29563	\N
39135	GENERIC_DAY	1	1	2010-03-04	1314	\N	29563	\N
39136	GENERIC_DAY	1	0	2010-03-06	1341	\N	29563	\N
39137	GENERIC_DAY	1	0	2010-03-07	1341	\N	29563	\N
39138	GENERIC_DAY	1	2	2010-03-05	1328	\N	29563	\N
39139	GENERIC_DAY	1	0	2010-04-03	1314	\N	29564	\N
39140	GENERIC_DAY	1	0	2010-03-28	1341	\N	29564	\N
39141	GENERIC_DAY	1	1	2010-03-29	1326	\N	29564	\N
39142	GENERIC_DAY	1	1	2010-04-06	1328	\N	29564	\N
39143	GENERIC_DAY	1	0	2010-04-04	1314	\N	29564	\N
39144	GENERIC_DAY	1	0	2010-04-01	1330	\N	29564	\N
39145	GENERIC_DAY	1	2	2010-03-26	1322	\N	29564	\N
39146	GENERIC_DAY	1	1	2010-04-07	1314	\N	29564	\N
39147	GENERIC_DAY	1	2	2010-03-24	1322	\N	29564	\N
39148	GENERIC_DAY	1	1	2010-03-26	1330	\N	29564	\N
39149	GENERIC_DAY	1	2	2010-03-25	1314	\N	29564	\N
39150	GENERIC_DAY	1	1	2010-03-25	1330	\N	29564	\N
39151	GENERIC_DAY	1	0	2010-03-28	1330	\N	29564	\N
39152	GENERIC_DAY	1	2	2010-04-07	1330	\N	29564	\N
39153	GENERIC_DAY	1	0	2010-03-27	1328	\N	29564	\N
39154	GENERIC_DAY	1	1	2010-03-25	1326	\N	29564	\N
39155	GENERIC_DAY	1	1	2010-04-07	1341	\N	29564	\N
39156	GENERIC_DAY	1	0	2010-03-27	1322	\N	29564	\N
39157	GENERIC_DAY	1	0	2010-04-02	1314	\N	29564	\N
39158	GENERIC_DAY	1	1	2010-03-30	1322	\N	29564	\N
39159	GENERIC_DAY	1	0	2010-04-02	1328	\N	29564	\N
39160	GENERIC_DAY	1	0	2010-04-05	1328	\N	29564	\N
39161	GENERIC_DAY	1	0	2010-04-05	1326	\N	29564	\N
39162	GENERIC_DAY	1	2	2010-03-29	1314	\N	29564	\N
39163	GENERIC_DAY	1	0	2010-04-01	1314	\N	29564	\N
39164	GENERIC_DAY	1	0	2010-04-03	1326	\N	29564	\N
39165	GENERIC_DAY	1	0	2010-04-05	1341	\N	29564	\N
39166	GENERIC_DAY	1	0	2010-04-05	1322	\N	29564	\N
39167	GENERIC_DAY	1	0	2010-03-28	1326	\N	29564	\N
39168	GENERIC_DAY	1	2	2010-03-31	1330	\N	29564	\N
39169	GENERIC_DAY	1	0	2010-04-04	1330	\N	29564	\N
39170	GENERIC_DAY	1	0	2010-04-02	1330	\N	29564	\N
39171	GENERIC_DAY	1	2	2010-03-25	1322	\N	29564	\N
39172	GENERIC_DAY	1	2	2010-03-30	1341	\N	29564	\N
39173	GENERIC_DAY	1	0	2010-04-04	1341	\N	29564	\N
39174	GENERIC_DAY	1	1	2010-04-07	1326	\N	29564	\N
39175	GENERIC_DAY	1	1	2010-03-30	1328	\N	29564	\N
39176	GENERIC_DAY	1	1	2010-03-31	1326	\N	29564	\N
39177	GENERIC_DAY	1	0	2010-04-01	1341	\N	29564	\N
39178	GENERIC_DAY	1	0	2010-04-05	1314	\N	29564	\N
39179	GENERIC_DAY	1	0	2010-03-27	1341	\N	29564	\N
39180	GENERIC_DAY	1	0	2010-04-03	1328	\N	29564	\N
39181	GENERIC_DAY	1	0	2010-04-01	1326	\N	29564	\N
39182	GENERIC_DAY	1	1	2010-04-07	1322	\N	29564	\N
39183	GENERIC_DAY	1	0	2010-04-04	1328	\N	29564	\N
39184	GENERIC_DAY	1	0	2010-03-28	1314	\N	29564	\N
39185	GENERIC_DAY	1	1	2010-03-25	1341	\N	29564	\N
39186	GENERIC_DAY	1	0	2010-04-02	1341	\N	29564	\N
39187	GENERIC_DAY	1	0	2010-04-02	1322	\N	29564	\N
39188	GENERIC_DAY	1	0	2010-03-27	1314	\N	29564	\N
39189	GENERIC_DAY	1	0	2010-04-03	1322	\N	29564	\N
39190	GENERIC_DAY	1	1	2010-03-24	1341	\N	29564	\N
39191	GENERIC_DAY	1	2	2010-04-06	1341	\N	29564	\N
39192	GENERIC_DAY	1	1	2010-04-06	1322	\N	29564	\N
39193	GENERIC_DAY	1	0	2010-04-02	1326	\N	29564	\N
39194	GENERIC_DAY	1	0	2010-03-27	1330	\N	29564	\N
39195	GENERIC_DAY	1	2	2010-03-24	1314	\N	29564	\N
39196	GENERIC_DAY	1	0	2010-04-03	1330	\N	29564	\N
39197	GENERIC_DAY	1	2	2010-03-26	1314	\N	29564	\N
39198	GENERIC_DAY	1	1	2010-03-31	1314	\N	29564	\N
39199	GENERIC_DAY	1	1	2010-03-31	1322	\N	29564	\N
39200	GENERIC_DAY	1	0	2010-04-04	1326	\N	29564	\N
39201	GENERIC_DAY	1	0	2010-03-28	1322	\N	29564	\N
39202	GENERIC_DAY	1	1	2010-03-26	1326	\N	29564	\N
39203	GENERIC_DAY	1	0	2010-04-01	1322	\N	29564	\N
39204	GENERIC_DAY	1	1	2010-03-29	1341	\N	29564	\N
39205	GENERIC_DAY	1	1	2010-03-29	1330	\N	29564	\N
39206	GENERIC_DAY	1	1	2010-03-26	1328	\N	29564	\N
39207	GENERIC_DAY	1	0	2010-03-28	1328	\N	29564	\N
39208	GENERIC_DAY	1	2	2010-03-29	1322	\N	29564	\N
39209	GENERIC_DAY	1	1	2010-03-30	1314	\N	29564	\N
39210	GENERIC_DAY	1	1	2010-04-06	1314	\N	29564	\N
39211	GENERIC_DAY	1	1	2010-03-29	1328	\N	29564	\N
39212	GENERIC_DAY	1	0	2010-04-05	1330	\N	29564	\N
39213	GENERIC_DAY	1	2	2010-04-06	1330	\N	29564	\N
39214	GENERIC_DAY	1	1	2010-03-24	1326	\N	29564	\N
39215	GENERIC_DAY	1	1	2010-03-24	1330	\N	29564	\N
39216	GENERIC_DAY	1	1	2010-03-31	1328	\N	29564	\N
39217	GENERIC_DAY	1	2	2010-03-31	1341	\N	29564	\N
39218	GENERIC_DAY	1	2	2010-03-30	1330	\N	29564	\N
39219	GENERIC_DAY	1	1	2010-04-07	1328	\N	29564	\N
39220	GENERIC_DAY	1	1	2010-04-06	1326	\N	29564	\N
39221	GENERIC_DAY	1	0	2010-04-03	1341	\N	29564	\N
39222	GENERIC_DAY	1	0	2010-03-27	1326	\N	29564	\N
39223	GENERIC_DAY	1	1	2010-03-24	1328	\N	29564	\N
39224	GENERIC_DAY	1	1	2010-03-30	1326	\N	29564	\N
39225	GENERIC_DAY	1	0	2010-04-01	1328	\N	29564	\N
39226	GENERIC_DAY	1	0	2010-04-04	1322	\N	29564	\N
39227	GENERIC_DAY	1	1	2010-03-25	1328	\N	29564	\N
39228	GENERIC_DAY	1	1	2010-03-26	1341	\N	29564	\N
39229	GENERIC_DAY	1	0	2010-03-13	1326	\N	29565	\N
39230	GENERIC_DAY	1	1	2010-03-23	1341	\N	29565	\N
39231	GENERIC_DAY	1	1	2010-03-17	1328	\N	29565	\N
39232	GENERIC_DAY	1	1	2010-03-11	1314	\N	29565	\N
39233	GENERIC_DAY	1	1	2010-03-12	1341	\N	29565	\N
39234	GENERIC_DAY	1	2	2010-03-10	1326	\N	29565	\N
39235	GENERIC_DAY	1	1	2010-03-12	1314	\N	29565	\N
39236	GENERIC_DAY	1	1	2010-03-16	1328	\N	29565	\N
39237	GENERIC_DAY	1	1	2010-03-17	1330	\N	29565	\N
39238	GENERIC_DAY	1	1	2010-03-16	1330	\N	29565	\N
39239	GENERIC_DAY	1	1	2010-03-18	1341	\N	29565	\N
39240	GENERIC_DAY	1	1	2010-03-18	1328	\N	29565	\N
39241	GENERIC_DAY	1	1	2010-03-23	1330	\N	29565	\N
39242	GENERIC_DAY	1	0	2010-03-14	1330	\N	29565	\N
39243	GENERIC_DAY	1	2	2010-03-17	1326	\N	29565	\N
39244	GENERIC_DAY	1	0	2010-03-21	1322	\N	29565	\N
39245	GENERIC_DAY	1	1	2010-03-17	1341	\N	29565	\N
39246	GENERIC_DAY	1	0	2010-03-14	1341	\N	29565	\N
39247	GENERIC_DAY	1	1	2010-03-11	1330	\N	29565	\N
39248	GENERIC_DAY	1	0	2010-03-21	1330	\N	29565	\N
39249	GENERIC_DAY	1	1	2010-03-12	1328	\N	29565	\N
39250	GENERIC_DAY	1	0	2010-03-14	1322	\N	29565	\N
39251	GENERIC_DAY	1	2	2010-03-16	1322	\N	29565	\N
39252	GENERIC_DAY	1	1	2010-03-12	1330	\N	29565	\N
39253	GENERIC_DAY	1	2	2010-03-16	1326	\N	29565	\N
39254	GENERIC_DAY	1	2	2010-03-22	1322	\N	29565	\N
39255	GENERIC_DAY	1	2	2010-03-18	1326	\N	29565	\N
39256	GENERIC_DAY	1	0	2010-03-13	1322	\N	29565	\N
39257	GENERIC_DAY	1	1	2010-03-10	1314	\N	29565	\N
39258	GENERIC_DAY	1	1	2010-03-18	1330	\N	29565	\N
39259	GENERIC_DAY	1	1	2010-03-17	1314	\N	29565	\N
39260	GENERIC_DAY	1	1	2010-03-22	1341	\N	29565	\N
39261	GENERIC_DAY	1	2	2010-03-11	1322	\N	29565	\N
39262	GENERIC_DAY	1	0	2010-03-19	1326	\N	29565	\N
39263	GENERIC_DAY	1	2	2010-03-12	1322	\N	29565	\N
39264	GENERIC_DAY	1	0	2010-03-13	1328	\N	29565	\N
39265	GENERIC_DAY	1	0	2010-03-21	1326	\N	29565	\N
39266	GENERIC_DAY	1	1	2010-03-15	1314	\N	29565	\N
39267	GENERIC_DAY	1	1	2010-03-23	1326	\N	29565	\N
39268	GENERIC_DAY	1	1	2010-03-10	1328	\N	29565	\N
39269	GENERIC_DAY	1	1	2010-03-10	1341	\N	29565	\N
39270	GENERIC_DAY	1	0	2010-03-14	1328	\N	29565	\N
39271	GENERIC_DAY	1	0	2010-03-20	1341	\N	29565	\N
39272	GENERIC_DAY	1	1	2010-03-15	1341	\N	29565	\N
39273	GENERIC_DAY	1	0	2010-03-20	1322	\N	29565	\N
39274	GENERIC_DAY	1	0	2010-03-19	1330	\N	29565	\N
39275	GENERIC_DAY	1	0	2010-03-20	1330	\N	29565	\N
39276	GENERIC_DAY	1	2	2010-03-10	1322	\N	29565	\N
39277	GENERIC_DAY	1	1	2010-03-23	1322	\N	29565	\N
39278	GENERIC_DAY	1	0	2010-03-19	1322	\N	29565	\N
39279	GENERIC_DAY	1	0	2010-03-19	1314	\N	29565	\N
39280	GENERIC_DAY	1	0	2010-03-21	1341	\N	29565	\N
39281	GENERIC_DAY	1	1	2010-03-23	1328	\N	29565	\N
39282	GENERIC_DAY	1	1	2010-03-10	1330	\N	29565	\N
39283	GENERIC_DAY	1	2	2010-03-12	1326	\N	29565	\N
39284	GENERIC_DAY	1	0	2010-03-21	1328	\N	29565	\N
39285	GENERIC_DAY	1	0	2010-03-14	1314	\N	29565	\N
39286	GENERIC_DAY	1	0	2010-03-14	1326	\N	29565	\N
39287	GENERIC_DAY	1	1	2010-03-23	1314	\N	29565	\N
39288	GENERIC_DAY	1	2	2010-03-15	1322	\N	29565	\N
39289	GENERIC_DAY	1	1	2010-03-18	1314	\N	29565	\N
39290	GENERIC_DAY	1	2	2010-03-11	1326	\N	29565	\N
39291	GENERIC_DAY	1	0	2010-03-21	1314	\N	29565	\N
39292	GENERIC_DAY	1	1	2010-03-15	1330	\N	29565	\N
39293	GENERIC_DAY	1	1	2010-03-16	1341	\N	29565	\N
39294	GENERIC_DAY	1	2	2010-03-17	1322	\N	29565	\N
39295	GENERIC_DAY	1	0	2010-03-19	1328	\N	29565	\N
39296	GENERIC_DAY	1	0	2010-03-13	1341	\N	29565	\N
39297	GENERIC_DAY	1	0	2010-03-13	1314	\N	29565	\N
39298	GENERIC_DAY	1	1	2010-03-22	1314	\N	29565	\N
39299	GENERIC_DAY	1	0	2010-03-20	1326	\N	29565	\N
39300	GENERIC_DAY	1	1	2010-03-16	1314	\N	29565	\N
39301	GENERIC_DAY	1	0	2010-03-20	1328	\N	29565	\N
39302	GENERIC_DAY	1	2	2010-03-18	1322	\N	29565	\N
39303	GENERIC_DAY	1	0	2010-03-20	1314	\N	29565	\N
39304	GENERIC_DAY	1	1	2010-03-22	1328	\N	29565	\N
39305	GENERIC_DAY	1	1	2010-03-11	1328	\N	29565	\N
39306	GENERIC_DAY	1	0	2010-03-13	1330	\N	29565	\N
39307	GENERIC_DAY	1	2	2010-03-22	1326	\N	29565	\N
39308	GENERIC_DAY	1	1	2010-03-11	1341	\N	29565	\N
39309	GENERIC_DAY	1	2	2010-03-15	1326	\N	29565	\N
39310	GENERIC_DAY	1	1	2010-03-22	1330	\N	29565	\N
39311	GENERIC_DAY	1	0	2010-03-19	1341	\N	29565	\N
39312	GENERIC_DAY	1	1	2010-03-15	1328	\N	29565	\N
39313	GENERIC_DAY	1	1	2010-02-25	1326	\N	29566	\N
39314	GENERIC_DAY	1	1	2010-03-02	1314	\N	29566	\N
39315	GENERIC_DAY	1	1	2010-02-26	1322	\N	29566	\N
39316	GENERIC_DAY	1	1	2010-02-26	1326	\N	29566	\N
39317	GENERIC_DAY	1	0	2010-02-28	1330	\N	29566	\N
39318	GENERIC_DAY	1	2	2010-03-02	1328	\N	29566	\N
39319	GENERIC_DAY	1	0	2010-02-27	1330	\N	29566	\N
39320	GENERIC_DAY	1	1	2010-02-26	1341	\N	29566	\N
39321	GENERIC_DAY	1	1	2010-03-01	1314	\N	29566	\N
39322	GENERIC_DAY	1	0	2010-02-28	1326	\N	29566	\N
39323	GENERIC_DAY	1	0	2010-02-28	1328	\N	29566	\N
39324	GENERIC_DAY	1	1	2010-03-02	1322	\N	29566	\N
39325	GENERIC_DAY	1	1	2010-03-01	1322	\N	29566	\N
39326	GENERIC_DAY	1	1	2010-02-24	1341	\N	29566	\N
39327	GENERIC_DAY	1	1	2010-03-03	1328	\N	29566	\N
39328	GENERIC_DAY	1	1	2010-03-02	1341	\N	29566	\N
39329	GENERIC_DAY	1	1	2010-02-24	1314	\N	29566	\N
39330	GENERIC_DAY	1	2	2010-02-26	1328	\N	29566	\N
39331	GENERIC_DAY	1	1	2010-03-03	1330	\N	29566	\N
39332	GENERIC_DAY	1	0	2010-03-03	1322	\N	29566	\N
39333	GENERIC_DAY	1	1	2010-02-24	1326	\N	29566	\N
39334	GENERIC_DAY	1	2	2010-02-25	1328	\N	29566	\N
39335	GENERIC_DAY	1	1	2010-02-25	1322	\N	29566	\N
39336	GENERIC_DAY	1	0	2010-02-27	1328	\N	29566	\N
39337	GENERIC_DAY	1	0	2010-02-28	1314	\N	29566	\N
39338	GENERIC_DAY	1	2	2010-03-02	1330	\N	29566	\N
39339	GENERIC_DAY	1	1	2010-03-02	1326	\N	29566	\N
39340	GENERIC_DAY	1	1	2010-02-25	1341	\N	29566	\N
39341	GENERIC_DAY	1	0	2010-02-27	1314	\N	29566	\N
39342	GENERIC_DAY	1	2	2010-02-24	1328	\N	29566	\N
39343	GENERIC_DAY	1	0	2010-03-03	1326	\N	29566	\N
39344	GENERIC_DAY	1	2	2010-03-01	1328	\N	29566	\N
39345	GENERIC_DAY	1	1	2010-02-26	1314	\N	29566	\N
39346	GENERIC_DAY	1	2	2010-02-25	1330	\N	29566	\N
39347	GENERIC_DAY	1	0	2010-02-28	1322	\N	29566	\N
39348	GENERIC_DAY	1	2	2010-02-24	1330	\N	29566	\N
39349	GENERIC_DAY	1	0	2010-03-03	1314	\N	29566	\N
39350	GENERIC_DAY	1	1	2010-03-01	1341	\N	29566	\N
39351	GENERIC_DAY	1	1	2010-02-24	1322	\N	29566	\N
39352	GENERIC_DAY	1	0	2010-02-28	1341	\N	29566	\N
39353	GENERIC_DAY	1	2	2010-02-26	1330	\N	29566	\N
39354	GENERIC_DAY	1	0	2010-02-27	1341	\N	29566	\N
39355	GENERIC_DAY	1	0	2010-02-27	1326	\N	29566	\N
39356	GENERIC_DAY	1	2	2010-03-01	1330	\N	29566	\N
39357	GENERIC_DAY	1	1	2010-03-01	1326	\N	29566	\N
39358	GENERIC_DAY	1	0	2010-03-03	1341	\N	29566	\N
39359	GENERIC_DAY	1	1	2010-02-25	1314	\N	29566	\N
39360	GENERIC_DAY	1	0	2010-02-27	1322	\N	29566	\N
39361	GENERIC_DAY	1	1	2010-03-03	1330	\N	29567	\N
39362	GENERIC_DAY	1	2	2010-03-08	1330	\N	29567	\N
39363	GENERIC_DAY	1	2	2010-02-23	1330	\N	29567	\N
39364	GENERIC_DAY	1	1	2010-02-09	1341	\N	29567	\N
39365	GENERIC_DAY	1	1	2010-02-23	1326	\N	29567	\N
39366	GENERIC_DAY	1	1	2010-02-23	1322	\N	29567	\N
39367	GENERIC_DAY	1	0	2010-03-07	1330	\N	29567	\N
39368	GENERIC_DAY	1	2	2010-02-16	1328	\N	29567	\N
39369	GENERIC_DAY	1	2	2010-02-12	1330	\N	29567	\N
39370	GENERIC_DAY	1	0	2010-02-14	1326	\N	29567	\N
39371	GENERIC_DAY	1	2	2010-02-19	1328	\N	29567	\N
39372	GENERIC_DAY	1	0	2010-02-13	1314	\N	29567	\N
39373	GENERIC_DAY	1	1	2010-02-16	1326	\N	29567	\N
39374	GENERIC_DAY	1	2	2010-02-12	1328	\N	29567	\N
39375	GENERIC_DAY	1	0	2010-02-17	1341	\N	29567	\N
39376	GENERIC_DAY	1	1	2010-02-26	1314	\N	29567	\N
39377	GENERIC_DAY	1	2	2010-02-09	1330	\N	29567	\N
39378	GENERIC_DAY	1	0	2010-02-14	1341	\N	29567	\N
39379	GENERIC_DAY	1	1	2010-02-11	1328	\N	29567	\N
39380	GENERIC_DAY	1	2	2010-02-18	1330	\N	29567	\N
39381	GENERIC_DAY	1	1	2010-02-25	1314	\N	29567	\N
39382	GENERIC_DAY	1	1	2010-03-09	1314	\N	29567	\N
39383	GENERIC_DAY	1	2	2010-02-15	1328	\N	29567	\N
39384	GENERIC_DAY	1	1	2010-02-22	1326	\N	29567	\N
39385	GENERIC_DAY	1	1	2010-03-02	1341	\N	29567	\N
39386	GENERIC_DAY	1	0	2010-03-09	1326	\N	29567	\N
39387	GENERIC_DAY	1	1	2010-02-19	1341	\N	29567	\N
39388	GENERIC_DAY	1	2	2010-02-26	1326	\N	29567	\N
39389	GENERIC_DAY	1	1	2010-03-08	1322	\N	29567	\N
39390	GENERIC_DAY	1	0	2010-02-27	1326	\N	29567	\N
39391	GENERIC_DAY	1	1	2010-03-01	1314	\N	29567	\N
39392	GENERIC_DAY	1	1	2010-03-04	1314	\N	29567	\N
39393	GENERIC_DAY	1	0	2010-02-20	1322	\N	29567	\N
39394	GENERIC_DAY	1	0	2010-03-09	1328	\N	29567	\N
39395	GENERIC_DAY	1	1	2010-02-25	1328	\N	29567	\N
39396	GENERIC_DAY	1	0	2010-02-14	1322	\N	29567	\N
39397	GENERIC_DAY	1	1	2010-02-24	1341	\N	29567	\N
39398	GENERIC_DAY	1	1	2010-02-12	1326	\N	29567	\N
39399	GENERIC_DAY	1	0	2010-02-21	1322	\N	29567	\N
39400	GENERIC_DAY	1	1	2010-03-04	1326	\N	29567	\N
39401	GENERIC_DAY	1	0	2010-02-21	1341	\N	29567	\N
39402	GENERIC_DAY	1	2	2010-02-24	1330	\N	29567	\N
39403	GENERIC_DAY	1	0	2010-03-06	1326	\N	29567	\N
39404	GENERIC_DAY	1	1	2010-03-08	1326	\N	29567	\N
39405	GENERIC_DAY	1	2	2010-03-04	1328	\N	29567	\N
39406	GENERIC_DAY	1	2	2010-03-05	1328	\N	29567	\N
39407	GENERIC_DAY	1	1	2010-02-12	1322	\N	29567	\N
39408	GENERIC_DAY	1	1	2010-03-03	1322	\N	29567	\N
39409	GENERIC_DAY	1	0	2010-02-28	1322	\N	29567	\N
39410	GENERIC_DAY	1	1	2010-02-09	1322	\N	29567	\N
39411	GENERIC_DAY	1	0	2010-02-20	1314	\N	29567	\N
39412	GENERIC_DAY	1	0	2010-02-27	1322	\N	29567	\N
39413	GENERIC_DAY	1	0	2010-02-28	1326	\N	29567	\N
39414	GENERIC_DAY	1	0	2010-02-14	1328	\N	29567	\N
36769	GENERIC_DAY	1	2	2010-02-23	1316	\N	29550	\N
36770	GENERIC_DAY	1	5	2010-02-03	1320	\N	29550	\N
36771	GENERIC_DAY	1	2	2010-03-08	1316	\N	29550	\N
36772	GENERIC_DAY	1	0	2010-04-25	1320	\N	29550	\N
36773	GENERIC_DAY	1	0	2010-05-02	1316	\N	29550	\N
36774	GENERIC_DAY	1	2	2010-04-08	1316	\N	29550	\N
36775	GENERIC_DAY	1	5	2010-04-23	1320	\N	29550	\N
36776	GENERIC_DAY	1	5	2010-04-16	1320	\N	29550	\N
36777	GENERIC_DAY	1	3	2010-06-02	1320	\N	29550	\N
39415	GENERIC_DAY	1	0	2010-02-13	1341	\N	29567	\N
39416	GENERIC_DAY	1	1	2010-02-16	1314	\N	29567	\N
39417	GENERIC_DAY	1	1	2010-03-05	1322	\N	29567	\N
39418	GENERIC_DAY	1	0	2010-02-27	1314	\N	29567	\N
39419	GENERIC_DAY	1	1	2010-02-15	1341	\N	29567	\N
39420	GENERIC_DAY	1	1	2010-03-02	1314	\N	29567	\N
39421	GENERIC_DAY	1	1	2010-02-25	1341	\N	29567	\N
39422	GENERIC_DAY	1	1	2010-03-09	1322	\N	29567	\N
39423	GENERIC_DAY	1	1	2010-02-16	1322	\N	29567	\N
39424	GENERIC_DAY	1	2	2010-02-25	1322	\N	29567	\N
39425	GENERIC_DAY	1	1	2010-03-01	1322	\N	29567	\N
39426	GENERIC_DAY	1	1	2010-02-18	1322	\N	29567	\N
39427	GENERIC_DAY	1	1	2010-02-26	1328	\N	29567	\N
39428	GENERIC_DAY	1	1	2010-02-10	1322	\N	29567	\N
39429	GENERIC_DAY	1	0	2010-02-17	1326	\N	29567	\N
39430	GENERIC_DAY	1	1	2010-02-25	1330	\N	29567	\N
39431	GENERIC_DAY	1	1	2010-02-10	1326	\N	29567	\N
39432	GENERIC_DAY	1	1	2010-03-05	1326	\N	29567	\N
39433	GENERIC_DAY	1	1	2010-02-12	1314	\N	29567	\N
39434	GENERIC_DAY	1	2	2010-03-03	1314	\N	29567	\N
39435	GENERIC_DAY	1	0	2010-02-14	1314	\N	29567	\N
39436	GENERIC_DAY	1	0	2010-02-28	1341	\N	29567	\N
39437	GENERIC_DAY	1	1	2010-03-04	1322	\N	29567	\N
39438	GENERIC_DAY	1	1	2010-02-15	1322	\N	29567	\N
39439	GENERIC_DAY	1	1	2010-02-10	1314	\N	29567	\N
39440	GENERIC_DAY	1	0	2010-02-27	1328	\N	29567	\N
39441	GENERIC_DAY	1	0	2010-02-13	1326	\N	29567	\N
39442	GENERIC_DAY	1	2	2010-03-01	1328	\N	29567	\N
39443	GENERIC_DAY	1	1	2010-02-18	1341	\N	29567	\N
39444	GENERIC_DAY	1	1	2010-02-22	1314	\N	29567	\N
39445	GENERIC_DAY	1	0	2010-02-20	1330	\N	29567	\N
39446	GENERIC_DAY	1	0	2010-02-17	1328	\N	29567	\N
39447	GENERIC_DAY	1	1	2010-03-01	1326	\N	29567	\N
39448	GENERIC_DAY	1	2	2010-02-10	1328	\N	29567	\N
39449	GENERIC_DAY	1	0	2010-02-13	1322	\N	29567	\N
39450	GENERIC_DAY	1	2	2010-03-04	1330	\N	29567	\N
39451	GENERIC_DAY	1	2	2010-02-10	1330	\N	29567	\N
39452	GENERIC_DAY	1	0	2010-03-07	1326	\N	29567	\N
39453	GENERIC_DAY	1	2	2010-02-11	1326	\N	29567	\N
39454	GENERIC_DAY	1	0	2010-03-09	1330	\N	29567	\N
39455	GENERIC_DAY	1	0	2010-02-21	1328	\N	29567	\N
39456	GENERIC_DAY	1	0	2010-02-21	1330	\N	29567	\N
39457	GENERIC_DAY	1	1	2010-02-09	1326	\N	29567	\N
39458	GENERIC_DAY	1	1	2010-02-12	1341	\N	29567	\N
39459	GENERIC_DAY	1	2	2010-03-03	1341	\N	29567	\N
39460	GENERIC_DAY	1	0	2010-03-06	1341	\N	29567	\N
39461	GENERIC_DAY	1	1	2010-03-02	1326	\N	29567	\N
39462	GENERIC_DAY	1	0	2010-02-17	1330	\N	29567	\N
39463	GENERIC_DAY	1	0	2010-03-07	1341	\N	29567	\N
39464	GENERIC_DAY	1	0	2010-02-28	1328	\N	29567	\N
39465	GENERIC_DAY	1	2	2010-02-22	1328	\N	29567	\N
39466	GENERIC_DAY	1	0	2010-02-13	1328	\N	29567	\N
39467	GENERIC_DAY	1	1	2010-02-11	1314	\N	29567	\N
39468	GENERIC_DAY	1	0	2010-03-07	1322	\N	29567	\N
39469	GENERIC_DAY	1	0	2010-02-14	1330	\N	29567	\N
39470	GENERIC_DAY	1	1	2010-02-18	1326	\N	29567	\N
39471	GENERIC_DAY	1	1	2010-02-23	1328	\N	29567	\N
39472	GENERIC_DAY	1	1	2010-02-09	1314	\N	29567	\N
39473	GENERIC_DAY	1	0	2010-02-21	1314	\N	29567	\N
39474	GENERIC_DAY	1	2	2010-02-15	1330	\N	29567	\N
39475	GENERIC_DAY	1	0	2010-02-28	1330	\N	29567	\N
39476	GENERIC_DAY	1	1	2010-02-22	1322	\N	29567	\N
39477	GENERIC_DAY	1	0	2010-02-20	1326	\N	29567	\N
39478	GENERIC_DAY	1	1	2010-02-23	1314	\N	29567	\N
39479	GENERIC_DAY	1	2	2010-03-08	1328	\N	29567	\N
39480	GENERIC_DAY	1	0	2010-02-13	1330	\N	29567	\N
39481	GENERIC_DAY	1	2	2010-02-19	1330	\N	29567	\N
39482	GENERIC_DAY	1	0	2010-03-09	1341	\N	29567	\N
39483	GENERIC_DAY	1	0	2010-02-27	1330	\N	29567	\N
39484	GENERIC_DAY	1	1	2010-02-16	1341	\N	29567	\N
39485	GENERIC_DAY	1	1	2010-02-18	1314	\N	29567	\N
39486	GENERIC_DAY	1	2	2010-02-25	1326	\N	29567	\N
39487	GENERIC_DAY	1	0	2010-02-21	1326	\N	29567	\N
39488	GENERIC_DAY	1	0	2010-02-27	1341	\N	29567	\N
39489	GENERIC_DAY	1	2	2010-02-18	1328	\N	29567	\N
39490	GENERIC_DAY	1	2	2010-02-22	1330	\N	29567	\N
39491	GENERIC_DAY	1	0	2010-03-07	1314	\N	29567	\N
39492	GENERIC_DAY	1	2	2010-02-23	1341	\N	29567	\N
39493	GENERIC_DAY	1	1	2010-02-11	1341	\N	29567	\N
39494	GENERIC_DAY	1	1	2010-02-11	1330	\N	29567	\N
39495	GENERIC_DAY	1	1	2010-03-03	1328	\N	29567	\N
39496	GENERIC_DAY	1	1	2010-02-15	1314	\N	29567	\N
39497	GENERIC_DAY	1	0	2010-02-20	1328	\N	29567	\N
39498	GENERIC_DAY	1	1	2010-03-02	1322	\N	29567	\N
39499	GENERIC_DAY	1	2	2010-03-02	1330	\N	29567	\N
39500	GENERIC_DAY	1	1	2010-02-19	1326	\N	29567	\N
39501	GENERIC_DAY	1	0	2010-02-20	1341	\N	29567	\N
39502	GENERIC_DAY	1	2	2010-03-01	1330	\N	29567	\N
39503	GENERIC_DAY	1	2	2010-03-02	1328	\N	29567	\N
39504	GENERIC_DAY	1	0	2010-03-06	1330	\N	29567	\N
39505	GENERIC_DAY	1	1	2010-02-15	1326	\N	29567	\N
39506	GENERIC_DAY	1	0	2010-03-07	1328	\N	29567	\N
39507	GENERIC_DAY	1	1	2010-03-04	1341	\N	29567	\N
39508	GENERIC_DAY	1	1	2010-02-26	1341	\N	29567	\N
39509	GENERIC_DAY	1	0	2010-03-06	1328	\N	29567	\N
39510	GENERIC_DAY	1	1	2010-02-19	1314	\N	29567	\N
39511	GENERIC_DAY	1	0	2010-02-17	1322	\N	29567	\N
39512	GENERIC_DAY	1	1	2010-02-26	1330	\N	29567	\N
39513	GENERIC_DAY	1	1	2010-03-05	1314	\N	29567	\N
39514	GENERIC_DAY	1	1	2010-03-05	1341	\N	29567	\N
39515	GENERIC_DAY	1	1	2010-03-08	1314	\N	29567	\N
39516	GENERIC_DAY	1	1	2010-02-10	1341	\N	29567	\N
39517	GENERIC_DAY	1	1	2010-02-24	1326	\N	29567	\N
39518	GENERIC_DAY	1	2	2010-02-16	1330	\N	29567	\N
39519	GENERIC_DAY	1	0	2010-02-28	1314	\N	29567	\N
39520	GENERIC_DAY	1	2	2010-02-24	1328	\N	29567	\N
39521	GENERIC_DAY	1	1	2010-02-24	1314	\N	29567	\N
39698	GENERIC_DAY	1	1	2010-03-05	1328	\N	29571	\N
39699	GENERIC_DAY	1	1	2010-03-04	1341	\N	29571	\N
39700	GENERIC_DAY	1	1	2010-03-09	1326	\N	29571	\N
39701	GENERIC_DAY	1	1	2010-03-04	1314	\N	29571	\N
39702	GENERIC_DAY	1	0	2010-03-06	1330	\N	29571	\N
39703	GENERIC_DAY	1	2	2010-03-08	1322	\N	29571	\N
39704	GENERIC_DAY	1	0	2010-03-06	1341	\N	29571	\N
39705	GENERIC_DAY	1	1	2010-03-04	1328	\N	29571	\N
39706	GENERIC_DAY	1	1	2010-03-08	1330	\N	29571	\N
39707	GENERIC_DAY	1	2	2010-03-05	1326	\N	29571	\N
39708	GENERIC_DAY	1	0	2010-03-06	1328	\N	29571	\N
39709	GENERIC_DAY	1	0	2010-03-06	1314	\N	29571	\N
39710	GENERIC_DAY	1	0	2010-03-07	1330	\N	29571	\N
39711	GENERIC_DAY	1	2	2010-03-05	1322	\N	29571	\N
39712	GENERIC_DAY	1	0	2010-03-07	1322	\N	29571	\N
39713	GENERIC_DAY	1	1	2010-03-05	1341	\N	29571	\N
39714	GENERIC_DAY	1	0	2010-03-09	1314	\N	29571	\N
39715	GENERIC_DAY	1	0	2010-03-06	1326	\N	29571	\N
39716	GENERIC_DAY	1	2	2010-03-04	1322	\N	29571	\N
39717	GENERIC_DAY	1	0	2010-03-07	1314	\N	29571	\N
39718	GENERIC_DAY	1	0	2010-03-09	1322	\N	29571	\N
39719	GENERIC_DAY	1	2	2010-03-08	1326	\N	29571	\N
39720	GENERIC_DAY	1	0	2010-03-07	1341	\N	29571	\N
39721	GENERIC_DAY	1	1	2010-03-08	1328	\N	29571	\N
39722	GENERIC_DAY	1	1	2010-03-09	1328	\N	29571	\N
39723	GENERIC_DAY	1	1	2010-03-05	1314	\N	29571	\N
39724	GENERIC_DAY	1	1	2010-03-05	1330	\N	29571	\N
39725	GENERIC_DAY	1	0	2010-03-06	1322	\N	29571	\N
39726	GENERIC_DAY	1	1	2010-03-09	1330	\N	29571	\N
39727	GENERIC_DAY	1	2	2010-03-04	1326	\N	29571	\N
39728	GENERIC_DAY	1	1	2010-03-04	1330	\N	29571	\N
39729	GENERIC_DAY	1	1	2010-03-09	1341	\N	29571	\N
39730	GENERIC_DAY	1	1	2010-03-08	1314	\N	29571	\N
39731	GENERIC_DAY	1	1	2010-03-08	1341	\N	29571	\N
39732	GENERIC_DAY	1	0	2010-03-07	1328	\N	29571	\N
39805	GENERIC_DAY	0	1	2010-04-12	1322	\N	29573	\N
39806	GENERIC_DAY	0	1	2010-04-15	1326	\N	29573	\N
39807	GENERIC_DAY	0	0	2010-04-18	1326	\N	29573	\N
39808	GENERIC_DAY	0	0	2010-04-17	1328	\N	29573	\N
39809	GENERIC_DAY	0	1	2010-04-16	1322	\N	29573	\N
39810	GENERIC_DAY	0	0	2010-04-10	1326	\N	29573	\N
39811	GENERIC_DAY	0	0	2010-04-11	1326	\N	29573	\N
39812	GENERIC_DAY	0	0	2010-04-18	1322	\N	29573	\N
39813	GENERIC_DAY	0	1	2010-04-08	1326	\N	29573	\N
39814	GENERIC_DAY	0	0	2010-04-18	1328	\N	29573	\N
39815	GENERIC_DAY	0	1	2010-04-09	1314	\N	29573	\N
39816	GENERIC_DAY	0	1	2010-04-14	1328	\N	29573	\N
39817	GENERIC_DAY	0	1	2010-04-15	1328	\N	29573	\N
39818	GENERIC_DAY	0	0	2010-04-17	1330	\N	29573	\N
39819	GENERIC_DAY	0	1	2010-04-16	1328	\N	29573	\N
39820	GENERIC_DAY	0	1	2010-04-14	1322	\N	29573	\N
39821	GENERIC_DAY	0	0	2010-04-17	1341	\N	29573	\N
39822	GENERIC_DAY	0	0	2010-04-11	1341	\N	29573	\N
39823	GENERIC_DAY	0	1	2010-04-14	1314	\N	29573	\N
39824	GENERIC_DAY	0	1	2010-04-19	1328	\N	29573	\N
39825	GENERIC_DAY	0	0	2010-04-10	1314	\N	29573	\N
39826	GENERIC_DAY	0	2	2010-04-13	1330	\N	29573	\N
39827	GENERIC_DAY	0	1	2010-04-16	1314	\N	29573	\N
39828	GENERIC_DAY	0	1	2010-04-19	1322	\N	29573	\N
39829	GENERIC_DAY	0	2	2010-04-16	1341	\N	29573	\N
39830	GENERIC_DAY	0	1	2010-04-12	1314	\N	29573	\N
39831	GENERIC_DAY	0	0	2010-04-10	1322	\N	29573	\N
39832	GENERIC_DAY	0	1	2010-04-15	1322	\N	29573	\N
39833	GENERIC_DAY	0	1	2010-04-19	1314	\N	29573	\N
39834	GENERIC_DAY	0	0	2010-04-17	1314	\N	29573	\N
39835	GENERIC_DAY	0	0	2010-04-11	1322	\N	29573	\N
39836	GENERIC_DAY	0	1	2010-04-09	1328	\N	29573	\N
39837	GENERIC_DAY	0	0	2010-04-10	1341	\N	29573	\N
39838	GENERIC_DAY	0	1	2010-04-08	1322	\N	29573	\N
39839	GENERIC_DAY	0	2	2010-04-16	1330	\N	29573	\N
39840	GENERIC_DAY	0	0	2010-04-17	1322	\N	29573	\N
39841	GENERIC_DAY	0	1	2010-04-13	1328	\N	29573	\N
39842	GENERIC_DAY	0	0	2010-04-11	1328	\N	29573	\N
39843	GENERIC_DAY	0	2	2010-04-08	1341	\N	29573	\N
39844	GENERIC_DAY	0	2	2010-04-08	1330	\N	29573	\N
39845	GENERIC_DAY	0	1	2010-04-13	1326	\N	29573	\N
39846	GENERIC_DAY	0	1	2010-04-13	1322	\N	29573	\N
39847	GENERIC_DAY	0	1	2010-04-12	1326	\N	29573	\N
39848	GENERIC_DAY	0	0	2010-04-18	1341	\N	29573	\N
39849	GENERIC_DAY	0	2	2010-04-09	1330	\N	29573	\N
39850	GENERIC_DAY	0	2	2010-04-13	1341	\N	29573	\N
39851	GENERIC_DAY	0	1	2010-04-14	1326	\N	29573	\N
39852	GENERIC_DAY	0	1	2010-04-13	1314	\N	29573	\N
39853	GENERIC_DAY	0	1	2010-04-19	1341	\N	29573	\N
39854	GENERIC_DAY	0	1	2010-04-08	1328	\N	29573	\N
39855	GENERIC_DAY	0	1	2010-04-09	1326	\N	29573	\N
39856	GENERIC_DAY	0	0	2010-04-11	1330	\N	29573	\N
39857	GENERIC_DAY	0	1	2010-04-12	1328	\N	29573	\N
39858	GENERIC_DAY	0	1	2010-04-19	1326	\N	29573	\N
39859	GENERIC_DAY	0	0	2010-04-17	1326	\N	29573	\N
39860	GENERIC_DAY	0	2	2010-04-15	1330	\N	29573	\N
39861	GENERIC_DAY	0	0	2010-04-11	1314	\N	29573	\N
39862	GENERIC_DAY	0	0	2010-04-10	1330	\N	29573	\N
39863	GENERIC_DAY	0	0	2010-04-18	1330	\N	29573	\N
39864	GENERIC_DAY	0	1	2010-04-09	1322	\N	29573	\N
39865	GENERIC_DAY	0	1	2010-04-08	1314	\N	29573	\N
39866	GENERIC_DAY	0	2	2010-04-14	1341	\N	29573	\N
39867	GENERIC_DAY	0	2	2010-04-12	1341	\N	29573	\N
39868	GENERIC_DAY	0	2	2010-04-14	1330	\N	29573	\N
39869	GENERIC_DAY	0	2	2010-04-12	1330	\N	29573	\N
39870	GENERIC_DAY	0	2	2010-04-15	1341	\N	29573	\N
39871	GENERIC_DAY	0	0	2010-04-10	1328	\N	29573	\N
39872	GENERIC_DAY	0	1	2010-04-16	1326	\N	29573	\N
39873	GENERIC_DAY	0	1	2010-04-15	1314	\N	29573	\N
39874	GENERIC_DAY	0	2	2010-04-09	1341	\N	29573	\N
39875	GENERIC_DAY	0	2	2010-04-19	1330	\N	29573	\N
39876	GENERIC_DAY	0	0	2010-04-18	1314	\N	29573	\N
41208	GENERIC_DAY	0	3	2010-01-21	40098	\N	41107	\N
41209	GENERIC_DAY	0	3	2010-01-20	40098	\N	41107	\N
41210	GENERIC_DAY	0	3	2010-01-26	40098	\N	41107	\N
41211	GENERIC_DAY	0	0	2010-01-24	40098	\N	41107	\N
41212	GENERIC_DAY	0	3	2010-01-22	40098	\N	41107	\N
41213	GENERIC_DAY	0	3	2010-01-28	40098	\N	41107	\N
41214	GENERIC_DAY	0	1	2010-01-29	40098	\N	41107	\N
41215	GENERIC_DAY	0	3	2010-01-27	40098	\N	41107	\N
41216	GENERIC_DAY	0	3	2010-01-25	40098	\N	41107	\N
41217	GENERIC_DAY	0	0	2010-01-23	40098	\N	41107	\N
41218	GENERIC_DAY	0	1	2010-01-29	1345	\N	41108	\N
41219	GENERIC_DAY	0	0	2010-01-24	1316	\N	41108	\N
41220	GENERIC_DAY	0	0	2010-01-23	1345	\N	41108	\N
41221	GENERIC_DAY	0	2	2010-01-26	1345	\N	41108	\N
41222	GENERIC_DAY	0	0	2010-01-24	1345	\N	41108	\N
41223	GENERIC_DAY	0	3	2010-01-28	1316	\N	41108	\N
41224	GENERIC_DAY	0	2	2010-01-27	1345	\N	41108	\N
41225	GENERIC_DAY	0	3	2010-01-21	1316	\N	41108	\N
41226	GENERIC_DAY	0	3	2010-01-22	1316	\N	41108	\N
41227	GENERIC_DAY	0	2	2010-01-21	1345	\N	41108	\N
41228	GENERIC_DAY	0	2	2010-01-28	1345	\N	41108	\N
41229	GENERIC_DAY	0	2	2010-01-22	1345	\N	41108	\N
41230	GENERIC_DAY	0	2	2010-01-25	1345	\N	41108	\N
41231	GENERIC_DAY	0	2	2010-01-20	1345	\N	41108	\N
41232	GENERIC_DAY	0	2	2010-01-29	1316	\N	41108	\N
41233	GENERIC_DAY	0	0	2010-01-23	1316	\N	41108	\N
41234	GENERIC_DAY	0	3	2010-01-25	1316	\N	41108	\N
41235	GENERIC_DAY	0	3	2010-01-27	1316	\N	41108	\N
41236	GENERIC_DAY	0	3	2010-01-20	1316	\N	41108	\N
41237	GENERIC_DAY	0	3	2010-01-26	1316	\N	41108	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
3506652	4	10548	10551	0
3506653	4	10549	10550	0
3506654	4	10555	10549	0
3506655	4	10551	10553	0
3506255	15	10557	10556	0
3506269	15	10557	10556	0
3506264	15	10557	10556	0
3506223	15	10557	10556	0
3506253	15	10513	10557	0
3506221	15	10513	10557	0
3506262	15	10513	10557	0
3506267	15	10513	10557	0
3506198	21	10504	10505	0
3506199	21	10505	10506	0
3506200	21	10506	10507	0
3506254	15	10507	10562	0
3506263	15	10507	10562	0
3506222	15	10507	10562	0
3506268	15	10507	10562	0
3506206	15	10507	10562	0
3506346	9	10511	10516	0
3506379	9	10511	10516	0
3506347	9	10517	10546	0
3506380	9	10517	10546	0
3506348	9	10530	10517	0
3506381	9	10530	10517	0
3506349	9	10518	10511	0
3506382	9	10518	10511	0
3506383	9	10521	10518	0
3506350	9	10521	10518	0
3506384	9	10519	10530	0
3506281	9	10519	10530	0
3506351	9	10519	10530	0
3506282	9	10514	10519	0
3506385	9	10514	10519	0
3506352	9	10514	10519	0
3506389	9	10524	10526	0
3506387	9	10529	10524	0
3506388	9	10526	10510	0
3506386	9	10528	10529	0
9535504	3	29292	29295	0
9535505	3	29293	29294	0
9535506	3	29303	29293	0
9535507	3	29295	29300	0
3506390	9	10546	10521	0
3506353	9	10546	10521	0
3506354	9	10522	10514	0
9535508	3	29296	29297	0
9535509	3	29297	29302	0
9535513	3	29290	29305	0
3506391	9	10522	10514	0
3506274	9	10522	10514	0
3506283	9	10522	10514	0
3506266	15	10513	10539	0
9535512	3	29305	29306	0
3506261	15	10513	10539	0
9535514	3	29306	29310	0
9535516	3	29310	29318	0
3506252	15	10513	10539	0
3506520	4	10535	10536	0
3506265	15	10539	10538	0
3506256	15	10539	10538	0
3506270	15	10539	10538	0
9535510	3	29312	29316	0
9535511	3	29308	29312	0
9535515	3	29302	29303	0
9535538	2	29295	29314	0
9535539	2	29299	29308	0
9535540	2	29301	29299	0
3506551	4	10548	10551	0
3506552	4	10549	10550	0
3506553	4	10555	10549	0
3506554	4	10551	10553	0
3506656	4	10552	10555	0
3506555	4	10552	10555	0
3506556	4	10554	10552	0
3506657	4	10554	10552	0
3506658	4	10553	10554	0
3506557	4	10553	10554	0
3506436	9	10511	10516	0
9535535	2	29295	29314	0
9535536	2	29299	29308	0
9535537	2	29301	29299	0
3506499	9	10511	10516	0
3506437	9	10517	10546	0
3506500	9	10517	10546	0
3506438	9	10530	10517	0
3506501	9	10530	10517	0
3506502	9	10518	10511	0
3506439	9	10518	10511	0
3506440	9	10521	10518	0
3506503	9	10521	10518	0
3506441	9	10519	10530	0
3506504	9	10519	10530	0
3506505	9	10514	10519	0
3506442	9	10514	10519	0
3506448	9	10524	10526	0
3506511	9	10524	10526	0
3506507	9	10529	10524	0
3506444	9	10529	10524	0
3506510	9	10526	10510	0
3506447	9	10526	10510	0
3506494	9	10563	10564	0
3506431	9	10563	10564	0
3506495	9	10534	10563	0
3506432	9	10534	10563	0
3506433	9	10564	10565	0
3506496	9	10564	10565	0
3506434	9	10565	10566	0
3506497	9	10565	10566	0
3506498	9	10566	10567	0
3506435	9	10566	10567	0
3506506	9	10528	10529	0
3506443	9	10528	10529	0
3506449	9	10546	10521	0
3506512	9	10546	10521	0
3506513	9	10522	10514	0
3506450	9	10522	10514	0
3506509	9	10509	10534	0
3506446	9	10509	10534	0
3506508	9	10533	10509	0
3506445	9	10533	10509	0
3506558	4	10535	10536	0
3506524	4	10535	10536	0
3506659	4	10535	10536	0
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
17523	2298	100.00
17524	2299	100.00
17525	2300	100.00
17526	2301	100.00
17738	2303	100.00
17740	2307	100.00
17741	2308	100.00
17743	2313	100.00
24655	3204	100.00
24657	3206	100.00
24659	3208	100.00
24661	3210	100.00
24662	3211	100.00
24664	3214	100.00
24665	3215	100.00
24666	3216	100.00
24667	3217	100.00
24669	3221	100.00
24671	3223	100.00
24672	3224	100.00
24674	3230	100.00
24675	3334	100.00
24676	3335	100.00
24677	3336	100.00
24678	3337	100.00
24679	3338	100.00
24681	3341	100.00
24682	3342	100.00
24683	3358	100.00
24684	3360	100.00
42830	26122	100.00
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
29550
29551
29552
29553
29554
29555
29556
29557
29558
29559
29560
29561
29562
29563
29564
29565
29566
29567
29568
29569
29570
29571
29573
41107
41108
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
426
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
2828	2	10.00	2010-01-15	\N	2626	2727
2829	1	14.00	2010-01-15	\N	2627	2727
2830	1	12.00	2009-01-15	\N	2627	2728
2831	1	9.00	2009-01-15	\N	2626	2728
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
25987	14	PREFIX-00005-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	35	1.00	f	25930
26024	13	PREFIX-00005-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	26092
26025	13	PREFIX-00005-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	35	1.00	f	26093
26026	13	PREFIX-00005-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	70	1.00	f	26095
26027	13	PREFIX-00005-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	26097
26028	13	PREFIX-00005-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	63	1.00	f	26099
26029	13	PREFIX-00005-00027-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	140	1.00	f	26101
26030	13	PREFIX-00005-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	63	1.00	f	26103
26031	13	PREFIX-00005-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	27	1.00	f	26105
26032	13	PREFIX-00005-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	200	1.00	f	26106
26047	12	PREFIX-00005-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	560	1.00	f	26121
26048	12	PREFIX-00005-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	560	1.00	f	26122
25988	14	PREFIX-00005-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	150	1.00	f	25932
25989	14	PREFIX-00005-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	25933
25990	14	PREFIX-00005-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	25934
25991	14	PREFIX-00005-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	406	1.00	f	25935
26045	12	PREFIX-00005-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	70	1.00	f	26119
26046	12	PREFIX-00005-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	70	1.00	f	26120
25992	14	PREFIX-00005-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	154	1.00	f	25937
25993	14	PREFIX-00005-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	63	1.00	f	25938
25994	14	PREFIX-00005-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	25939
25995	14	PREFIX-00005-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	25940
25996	14	PREFIX-00005-00013-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	25941
40826	6	PREFIX-00006-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	0.66	f	40646
40827	6	PREFIX-00006-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	40647
40833	4	PREFIX-00006-00001-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	20	0.33	f	40646
3069	23	PREFIX-00002-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	2298
3070	23	PREFIX-00002-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	2299
3071	23	PREFIX-00002-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	2300
3072	23	PREFIX-00002-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	2301
3073	23	PREFIX-00002-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	2303
3074	23	PREFIX-00002-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	2304
3075	23	PREFIX-00002-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	2305
3076	23	PREFIX-00002-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	2307
3077	23	PREFIX-00002-00013-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	2308
3078	23	PREFIX-00002-00014-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	2310
3079	23	PREFIX-00002-00015-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	2311
3080	23	PREFIX-00002-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	2312
3081	23	PREFIX-00002-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	2313
3243	22	PREFIX-00002-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3203
3244	22	PREFIX-00002-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3204
3245	22	PREFIX-00002-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3206
3246	22	PREFIX-00002-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3208
3247	22	PREFIX-00002-00034-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	3210
3248	22	PREFIX-00002-00035-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3211
3249	22	PREFIX-00002-00036-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3212
3250	22	PREFIX-00002-00037-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	3214
3251	22	PREFIX-00002-00038-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	3215
3252	22	PREFIX-00002-00039-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3216
3253	22	PREFIX-00002-00040-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3217
3254	22	PREFIX-00002-00041-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3218
3255	22	PREFIX-00002-00042-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	3220
3256	22	PREFIX-00002-00043-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3221
3257	22	PREFIX-00002-00044-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3223
3258	22	PREFIX-00002-00045-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3224
3259	22	PREFIX-00002-00046-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3226
3260	22	PREFIX-00002-00047-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3228
3261	22	PREFIX-00002-00048-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	3230
3262	22	PREFIX-00002-00049-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3231
3263	22	PREFIX-00002-00050-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3333
3264	22	PREFIX-00002-00051-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3334
3265	22	PREFIX-00002-00052-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3335
3266	22	PREFIX-00002-00053-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3336
3267	22	PREFIX-00002-00054-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3337
3268	22	PREFIX-00002-00055-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3338
3269	22	PREFIX-00002-00056-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3339
3270	22	PREFIX-00002-00057-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3340
3271	22	PREFIX-00002-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	3341
3272	22	PREFIX-00002-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	3342
3285	17	PREFIX-00002-00059-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	3358
3286	17	PREFIX-00002-00060-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	3359
3287	17	PREFIX-00002-00061-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3360
3288	17	PREFIX-00002-00062-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3361
3289	17	PREFIX-00002-00063-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	3362
3290	17	PREFIX-00002-00064-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3363
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
404	8	0
404	8	1
404	8	2
404	8	3
404	8	4
404	0	5
404	0	6
1533	16	0
1533	16	1
1533	16	2
1533	16	3
1533	16	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
40724	40645
17527	2297
2356	2297
17739	2302
2357	2306
17742	2306
17744	2309
2358	2309
24656	3202
2379	3202
24658	3205
2380	3205
2381	3207
24660	3207
24663	3209
2382	3209
2383	3213
24668	3213
24670	3219
2384	3219
24673	3222
2385	3222
2386	3225
2387	3227
2388	3229
24680	3229
2391	3357
24685	3357
24729	25929
24730	25931
24731	25936
26167	26091
26168	26094
26169	26096
26170	26098
26171	26100
26172	26102
26173	26104
42831	25889
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, name, label_type_id) FROM stdin;
39996	1	CECO	16766
16874	14	Medio (2)	16766
17036	10	Alta (3)	16766
17107	9	Muy Alto (4)	16766
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, name) FROM stdin;
16766	2	Riesgo
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
1337	Torno1	Torno	Desc. Torno
1339	Galvanizadora1	Galvanizadora	Desc.
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
2424	3	440-TX-25X	1/4" DRIVE T-25 TORX BIT	1.00	2	f	202
2426	2	cod	3/4" 1.65mm	21.00	\N	f	2526
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

COPY material_category (id, version, name, parent_id) FROM stdin;
202	4	Tornillos	\N
2525	3	Tubos	\N
2526	2	Acero	2525
2528	2	Acero inoxidable	2526
2527	2	Cemento	2525
16665	1	Imported materials without category	\N
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
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
2297	16874
2309	17036
3202	17107
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

COPY order_table (orderelementid, responsible, customer, dependenciesconstraintshavepriority, codeautogenerated, lastorderelementsequencecode, base_calendar_id) FROM stdin;
40645	ANTONIO ROMAN GOMEZ	NAVANTIA	\N	t	2	1422
2245	Resp.	Navantia	t	t	64	1418
25889	Xavi.	Cliente	t	t	33	1418
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, mandatoryinit, mandatoryend, schedulingstatetype, parent, positionincontainer) FROM stdin;
25929	14	Xestion de usuarios	\N	PREFIX-00005-00001	\N	\N	f	f	3	25889	0
25930	14	Xestión de Roles e información sensible	\N	PREFIX-00005-00004	\N	\N	f	f	0	25929	0
25931	14	Módulo de planificación	\N	PREFIX-00005-00002	\N	\N	f	f	3	25889	1
25932	14	Técnica de consolidación de avances	\N	PREFIX-00005-00005	\N	\N	f	f	0	25931	0
25933	14	Reorganización vertical de tarefas Gantt	\N	PREFIX-00005-00006	\N	\N	f	f	0	25931	1
25934	14	Vista aplanada reordenable de tarefas Gantt	\N	PREFIX-00005-00007	\N	\N	f	f	0	25931	2
25935	14	Escenarios de planificación	\N	PREFIX-00005-00008	\N	\N	f	f	0	25931	3
26119	12	Melloras na pantalla de planificación	\N	PREFIX-00005-00032	\N	\N	f	f	0	25931	4
26120	12	Melloras na pantalla de carga de recursos 	\N	PREFIX-00005-00033	\N	\N	f	f	0	25931	5
25936	14	Módulo de asignación de recursos	\N	PREFIX-00005-00003	\N	\N	f	f	3	25889	2
25937	14	Vista de asignación de recursos limitantes	\N	PREFIX-00005-00009	\N	\N	f	f	0	25936	0
25938	14	Melloras no sistema e pantalla de asignación	\N	PREFIX-00005-00010	\N	\N	f	f	0	25936	1
25939	14	Modificación da unidade mínima de tempo asignable	\N	PREFIX-00005-00011	\N	\N	f	f	0	25936	2
25940	14	Gráfica de carga de recursos diferenciada máquina-humano	\N	PREFIX-00005-00012	\N	\N	f	f	0	25936	3
25941	14	Gráfico de uso de recursos filtrada por criterio 	\N	PREFIX-00005-00013	\N	\N	f	f	0	25936	4
26121	12	Análise	\N	PREFIX-00005-00030	\N	\N	f	f	0	25889	11
26122	12	Coordinación	\N	PREFIX-00005-00031	\N	\N	f	f	0	25889	12
2297	23	Módulo de Xestión de Usuarios	\N	PREFIX-00002-00001	\N	\N	f	f	3	2245	0
25889	16	5º release devenvolvemento aplicación xestión produción	Desc.	PREFIX-00005	2010-02-01 00:00:00	2010-06-07 00:00:00	f	f	3	\N	\N
26091	13	Módulo de control de avance	\N	PREFIX-00005-00014	\N	\N	f	f	3	25889	3
26092	13	Revisión de usabilidade da pantalla de asignación de avances	\N	PREFIX-00005-00022	\N	\N	f	f	0	26091	0
26093	13	Acceso directo dende planificación a xestión de avances	\N	PREFIX-00005-00023	\N	\N	f	f	0	26091	1
26094	13	Módulo de control de custos	\N	PREFIX-00005-00015	\N	\N	f	f	3	25889	4
26095	13	Técnica de valor gañado con información económica	\N	PREFIX-00005-00024	\N	\N	f	f	0	26094	0
26096	13	Módulo de xestión da calidade	\N	PREFIX-00005-00016	\N	\N	f	f	3	25889	5
26097	13	Asociar lista de chequeo a tipo de avance 	\N	PREFIX-00005-00025	\N	\N	f	f	0	26096	0
26098	13	Módulo de integración con subcontratas	\N	PREFIX-00005-00017	\N	\N	f	f	3	25889	6
26099	13	Consulta da información subcontratada na aplicación	\N	PREFIX-00005-00026	\N	\N	f	f	0	26098	0
26100	13	Módulo de arquitectura	\N	PREFIX-00005-00018	\N	\N	f	f	3	25889	7
26101	13	Rendimento e melloras xerais en eficiencia	\N	PREFIX-00005-00027	\N	\N	f	f	0	26100	0
26102	13	Módulo de arquivo histórico	\N	PREFIX-00005-00019	\N	\N	f	f	3	25889	8
26103	13	Consulta información histórica dos modelos de planificación	\N	PREFIX-00005-00028	\N	\N	f	f	0	26102	0
26104	13	Módulo de informes	\N	PREFIX-00005-00020	\N	\N	f	f	3	25889	9
26105	13	3 informes definidos polas empresas	\N	PREFIX-00005-00029	\N	\N	f	f	0	26104	0
26106	13	Resolución de bugs	\N	PREFIX-00005-00021	\N	\N	f	f	0	25889	10
40646	6	HITO PRIMERO	PRIMERA PARTE DEL PROYECTO	PREFIX-00006-00001	2010-01-20 00:00:00	2010-02-02 00:00:00	t	t	0	40645	0
40647	6	HITO SEGUNDO	\N	PREFIX-00006-00002	2010-02-18 00:00:00	2010-03-25 00:00:00	f	f	0	40645	1
40645	7	PRUEBA	PROYECTO SW	PREFIX-00006	2010-01-18 18:51:43.074	2011-03-31 00:00:00	f	f	3	\N	\N
2245	26	4º release devenvolvemento aplicación xestión produción	Desc.	PREFIX-00002	2009-12-14 00:00:00	2010-01-29 00:00:00	f	f	3	\N	\N
2298	23	Xestión de usuarios	\N	PREFIX-00002-00005	\N	\N	f	f	0	2297	0
2299	23	Xestión de roles	\N	PREFIX-00002-00006	\N	\N	f	f	0	2297	1
2300	23	Xestión de perfiles	\N	PREFIX-00002-00007	\N	\N	f	f	0	2297	2
2301	23	Xestión de roles e pedidos	\N	PREFIX-00002-00008	\N	\N	f	f	0	2297	3
2302	23	Módulo de organización do traballo	\N	PREFIX-00002-00002	\N	\N	f	f	3	2245	1
2303	23	Xestión de código único	\N	PREFIX-00002-00009	\N	\N	f	f	0	2302	0
2304	23	Revisión de formulario de pedidos	\N	PREFIX-00002-00010	\N	\N	f	f	0	2302	1
2305	23	Filtrado no listado de pedidos	\N	PREFIX-00002-00011	\N	\N	f	f	0	2302	2
2306	23	Módulo de recursos	\N	PREFIX-00002-00003	\N	\N	f	f	3	2245	2
2307	23	Recursos Virtuais	\N	PREFIX-00002-00012	\N	\N	f	f	0	2306	0
2308	23	Recursos Virtuais (Cont.)	\N	PREFIX-00002-00013	\N	\N	f	f	0	2306	1
2309	23	Módulo de planificación	\N	PREFIX-00002-00004	\N	\N	f	f	3	2245	3
2310	23	Compartir estado entre pestañas de planificación	\N	PREFIX-00002-00014	\N	\N	f	f	0	2309	0
2311	23	Técnica de recálculo de asignacións	\N	PREFIX-00002-00015	\N	\N	f	f	0	2309	1
2312	23	Filtrado de pedidos e tarefas de un pedido	\N	PREFIX-00002-00016	\N	\N	f	f	0	2309	2
2313	23	Modelos de pedidos e planificación	\N	PREFIX-00002-00017	\N	\N	f	f	0	2309	3
3202	22	Módulo de asignación de recursos	\N	PREFIX-00002-00018	\N	\N	f	f	3	2245	4
3203	22	Interpolación polinómica na asignación	\N	PREFIX-00002-00030	\N	\N	f	f	0	3202	0
3204	22	Asignación avanzada asignación automática	\N	PREFIX-00002-00031	\N	\N	f	f	0	3202	1
3205	22	Módulo de Partes de Traballo	\N	PREFIX-00002-00019	\N	\N	f	f	3	2245	5
3206	22	Procura de partes de traballo	\N	PREFIX-00002-00032	\N	\N	f	f	0	3205	0
3207	22	Módulo de materiais	\N	PREFIX-00002-00020	\N	\N	f	f	3	2245	6
3208	22	Informe de necesidades de materiais	\N	PREFIX-00002-00033	\N	\N	f	f	0	3207	0
3209	22	Módulo de xestión da calidade	\N	PREFIX-00002-00021	\N	\N	f	f	3	2245	7
3210	22	Administración de checklists	\N	PREFIX-00002-00034	\N	\N	f	f	0	3209	0
3211	22	Cubrir formularios de calidade en planificación	\N	PREFIX-00002-00035	\N	\N	f	f	0	3209	1
3212	22	Incorporar as listas de chequeo nos modelos de planificación	\N	PREFIX-00002-00036	\N	\N	f	f	0	3209	2
3213	22	Módulo de Importación-Exportación	\N	PREFIX-00002-00022	\N	\N	f	f	3	2245	8
3214	22	Definir workflow ERP pedidos	\N	PREFIX-00002-00037	\N	\N	f	f	0	3213	0
3215	22	Formato de intercambio de pedidos e elementos de pedidos	\N	PREFIX-00002-00038	\N	\N	f	f	0	3213	1
3216	22	Formato de intercambio de información de avances	\N	PREFIX-00002-00039	\N	\N	f	f	0	3213	2
3217	22	Formato de intercambio de recursos	\N	PREFIX-00002-00040	\N	\N	f	f	0	3213	3
3218	22	Formato de intercambio de materiais	\N	PREFIX-00002-00041	\N	\N	f	f	0	3213	4
3219	22	Módulo de Presentación	\N	PREFIX-00002-00023	\N	\N	f	f	3	2245	9
3220	22	Imprimir o diagrama de Gantt en varias páxinas	\N	PREFIX-00002-00042	\N	\N	f	f	0	3219	0
3221	22	Imprimir información pantalla do planificador	\N	PREFIX-00002-00043	\N	\N	f	f	0	3219	1
3222	22	Módulo de arquitectura tecnolóxica	\N	PREFIX-00002-00024	\N	\N	f	f	3	2245	10
3223	22	Enlazar a axuda de usuario	\N	PREFIX-00002-00044	\N	\N	f	f	0	3222	0
3224	22	Desenvolvemento de paquetes Debian	\N	PREFIX-00002-00045	\N	\N	f	f	0	3222	1
3225	22	Módulo de Documentación de API	\N	PREFIX-00002-00025	\N	\N	f	f	3	2245	11
3226	22	Documentación das APIs públicas da aplicación	\N	PREFIX-00002-00046	\N	\N	f	f	0	3225	0
3227	22	Módulo de Arquivo Histórico	\N	PREFIX-00002-00026	\N	\N	f	f	3	2245	12
3228	22	Pasar pedidos a Histórico	\N	PREFIX-00002-00047	\N	\N	f	f	0	3227	0
3229	22	Módulo de Extracción de Informes	\N	PREFIX-00002-00027	\N	\N	f	f	3	2245	13
3230	22	Integración con Jasper Reports	\N	PREFIX-00002-00048	\N	\N	f	f	0	3229	0
3231	22	Informes sobre organizacións de traballo	\N	PREFIX-00002-00049	\N	\N	f	f	0	3229	1
3333	22	Informes sobre partes de traballo	\N	PREFIX-00002-00050	\N	\N	f	f	0	3229	2
3334	22	Informes de horas traballadas por un traballador	\N	PREFIX-00002-00051	\N	\N	f	f	0	3229	3
3335	22	Lista de avances de planificación da empresa	\N	PREFIX-00002-00052	\N	\N	f	f	0	3229	4
3336	22	Lista de avances de traballo da empresa	\N	PREFIX-00002-00053	\N	\N	f	f	0	3229	5
3337	22	Informe de horas estimadas/horas realies	\N	PREFIX-00002-00054	\N	\N	f	f	0	3229	6
3338	22	Horas realizadas organizadas por tipo de traballo	\N	PREFIX-00002-00055	\N	\N	f	f	0	3229	7
3339	22	Horas estimadas/horas realizadas por tipo de traballo	\N	PREFIX-00002-00056	\N	\N	f	f	0	3229	8
3340	22	Informe de traballador indicando custos por hora	\N	PREFIX-00002-00057	\N	\N	f	f	0	3229	9
3341	22	Coordinación	\N	PREFIX-00002-00028	\N	\N	f	f	0	2245	14
3342	22	Análise	\N	PREFIX-00002-00029	\N	\N	f	f	0	2245	15
3357	17	Módulo de integración con subcontratas	\N	PREFIX-00002-00058	\N	\N	f	f	3	2245	16
3358	17	Administración das subcontratas	\N	PREFIX-00002-00059	\N	\N	f	f	0	3357	0
3359	17	Formato de intercambio	\N	PREFIX-00002-00060	\N	\N	f	f	0	3357	1
3360	17	Fluxo de importación/exportación	\N	PREFIX-00002-00061	\N	\N	f	f	0	3357	2
3361	17	Interfaz de xestión de subcontratas	\N	PREFIX-00002-00062	\N	\N	f	f	0	3357	3
3362	17	Convertir en fitos subcontratacións	\N	PREFIX-00002-00063	\N	\N	f	f	0	3357	4
3363	17	Avance e custo de subcontratas en Técnica VG	\N	PREFIX-00002-00064	\N	\N	f	f	0	3357	5
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, parent, positionincontainer) FROM stdin;
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
40646	2
40647	1
2298	1
2299	1
2300	1
2301	1
2303	1
2304	1
2305	1
2307	1
2308	1
2310	1
2311	1
2312	1
2313	1
3203	1
3204	1
3206	1
3208	1
3210	1
3211	1
3212	1
3214	1
3215	1
3216	1
3217	1
3218	1
3220	1
3221	1
3223	1
3224	1
3226	1
3228	1
3230	1
3231	1
3333	1
3334	1
3335	1
3336	1
3337	1
3338	1
3339	1
3340	1
3341	1
3342	1
3358	1
3359	1
3360	1
3361	1
3362	1
3363	1
25930	1
25932	1
25933	1
25934	1
25935	1
26119	1
26120	1
25937	1
25938	1
25939	1
25940	1
25941	1
26092	1
26093	1
26095	1
26097	1
26099	1
26101	1
26103	1
26105	1
26106	1
26121	1
26122	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
2245
2297
2302
2306
2309
3202
3205
3207
3209
3213
3219
3222
3225
3227
3229
3357
25889
25929
25931
25936
26091
26094
26096
26098
26100
26102
26104
40645
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id) FROM stdin;
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	7	PREFIX	6	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype) FROM stdin;
2929	1	Exemplo de formulario de calidade	Formulario de calidade de exemplo.	0
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
2929	¿Realizouse a primeira comprobación?	15.00	0	0
2929	¿Realizouse a segunda comprobación?	40.00	1	1
2929	¿Realizouse a terceira comprobación?	60.00	2	2
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, base_calendar_id) FROM stdin;
1320	3	1423
1328	3	1426
1322	4	1424
1314	5	1414
1330	3	1427
1316	4	1420
1326	3	1425
1333	2	1428
1335	2	1429
1337	4	1433
1339	2	1434
1341	2	1435
1343	2	1436
1345	2	1437
40098	2	40198
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
10618	19	1.00	10504	\N
10619	19	1.00	10505	\N
10620	19	1.00	10506	\N
10621	19	1.00	10507	\N
10665	10	1.00	10516	\N
10666	10	1.00	10517	\N
10667	10	1.00	10518	\N
10649	11	1.00	10519	\N
10684	9	1.00	10524	\N
11901	2	0.50	10560	\N
11902	2	0.50	10560	\N
10682	9	1.00	10526	\N
10623	17	1.00	10562	\N
11821	7	1.00	10563	\N
11822	7	1.00	10564	\N
11823	7	1.00	10565	\N
11824	7	1.00	10566	\N
11825	7	1.00	10567	\N
10680	9	1.00	10528	\N
10681	9	1.00	10529	\N
10650	11	1.00	10530	\N
10668	10	1.00	10546	\N
10669	10	1.00	10521	\N
10645	12	1.00	10522	\N
11847	4	0.25	10544	\N
10633	16	1.00	10513	\N
10646	12	1.00	10514	\N
11845	4	0.25	10541	\N
11846	4	0.15	10542	\N
10694	8	1.00	10509	\N
10683	9	1.00	10510	\N
10670	10	1.00	10511	\N
11837	5	0.25	10532	\N
11838	5	0.25	10532	\N
10692	8	1.00	10533	\N
10693	8	1.00	10534	\N
11839	5	0.25	10535	\N
11840	5	0.25	10536	\N
10641	15	0.40	10538	\N
10642	15	0.70	10539	\N
29550	1	0.84	29322	\N
29551	1	1.00	29292	\N
29552	1	1.00	29293	\N
29553	1	1.00	29294	\N
29554	1	1.00	29295	\N
29555	1	1.00	29296	\N
29556	1	1.00	29297	\N
29557	1	1.00	29290	\N
29558	1	0.30	29320	\N
29559	1	0.88	29321	\N
29560	1	1.00	29305	\N
29561	1	1.00	29306	\N
29562	1	2.00	29314	\N
29563	1	1.00	29318	\N
29564	1	1.00	29312	\N
29565	1	1.00	29308	\N
29566	1	1.00	29310	\N
29567	1	1.00	29299	\N
11900	2	0.25	10559	\N
29568	1	1.00	29300	\N
29569	1	1.00	29301	\N
29570	1	1.00	29302	\N
11899	2	0.50	10559	\N
11898	2	0.25	10559	\N
11903	2	1.00	10548	\N
11904	2	0.75	10549	\N
11905	2	0.75	10550	\N
11906	2	0.75	10551	\N
11907	2	0.75	10552	\N
11908	2	0.75	10553	\N
11909	2	0.75	10554	\N
11910	2	0.75	10555	\N
10634	16	0.25	10556	\N
10635	16	0.30	10557	\N
29571	1	1.00	29303	\N
29573	0	1.00	29316	\N
41107	0	0.33	41006	\N
41108	0	0.67	41006	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
1423	1
1426	1
1424	1
1414	1
1427	1
1420	1
1425	1
1428	1
1429	1
1430	1
1431	1
1433	1
1434	1
1435	1
1436	1
1437	1
40198	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, initdate, enddate, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
11900	1316
11899	1320
11898	1345
11903	1326
11904	1326
11905	1326
11906	1326
11907	1326
11908	1326
11909	1326
11910	1326
10634	1314
10635	1314
10618	1330
10619	1330
10620	1330
10621	1330
10665	1341
10666	1341
10667	1341
10649	1341
10684	1328
11901	1316
11902	1345
10682	1328
10623	1330
11821	1322
11822	1322
11823	1322
11824	1322
11825	1322
10680	1328
10681	1328
10650	1341
10668	1341
10669	1341
10645	1341
11847	1316
10633	1314
10646	1341
11845	1320
11846	1345
10694	1322
10683	1328
10670	1341
11837	1345
11838	1316
10692	1322
10693	1322
11839	1343
11840	1343
10641	1314
10642	1314
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id) FROM stdin;
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, criterionrequirementsexported) FROM stdin;
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
41007	1	1	2010-02-18 00:00:00	\N
41006	1	1	2010-01-20 00:00:00	\N
10504	1	0	\N	\N
10505	1	0	\N	\N
10506	1	0	\N	\N
10507	1	0	\N	\N
10509	1	0	\N	\N
10510	1	0	\N	\N
10511	1	0	\N	\N
10513	1	0	\N	\N
10514	1	0	\N	\N
10516	1	0	\N	\N
10517	1	0	\N	\N
10518	1	0	\N	\N
10519	1	0	\N	\N
10521	1	0	\N	\N
10522	1	0	\N	\N
10524	1	0	\N	\N
10526	1	0	\N	\N
10528	1	0	\N	\N
10529	1	0	\N	\N
10530	1	0	\N	\N
10532	1	0	\N	\N
10533	1	0	\N	\N
10534	1	0	\N	\N
10535	1	0	\N	\N
10536	1	0	\N	\N
10538	1	0	\N	\N
10539	1	0	\N	\N
10541	1	0	\N	\N
10542	1	0	\N	\N
10544	1	0	\N	\N
10546	1	0	\N	\N
10548	1	0	\N	\N
10549	1	0	\N	\N
10550	1	0	\N	\N
10551	1	0	\N	\N
10552	1	0	\N	\N
10553	1	0	\N	\N
10554	1	0	\N	\N
10555	1	0	\N	\N
10556	1	0	\N	\N
10557	1	0	\N	\N
10559	1	0	\N	\N
10560	1	0	\N	\N
10562	1	0	\N	\N
10563	1	0	\N	\N
10564	1	0	\N	\N
10565	1	0	\N	\N
10566	1	0	\N	\N
10567	1	0	\N	\N
29290	1	0	\N	\N
29292	1	0	\N	\N
29293	1	0	\N	\N
29294	1	0	\N	\N
29295	1	0	\N	\N
29296	1	0	\N	\N
29297	1	0	\N	\N
29299	1	0	\N	\N
29300	1	0	\N	\N
29301	1	0	\N	\N
29302	1	0	\N	\N
29303	1	0	\N	\N
29305	1	0	\N	\N
29306	1	0	\N	\N
29308	1	0	\N	\N
29310	1	0	\N	\N
29312	1	0	\N	\N
29314	1	0	\N	\N
29316	1	0	\N	\N
29318	1	0	\N	\N
29320	2	0	\N	\N
29321	2	0	\N	\N
29322	2	0	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id) FROM stdin;
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
29290	25987
29292	25988
29293	25989
29294	25990
29295	25991
29296	26045
29297	26046
29299	25992
29300	25993
29301	25994
29302	25995
29303	25996
29305	26024
29306	26025
29308	26026
29310	26027
29312	26028
29314	26029
29316	26030
29318	26031
29320	26032
29321	26047
29322	26048
41006	40833
41006	40826
41007	40827
10504	3069
10505	3070
10506	3071
10507	3072
10509	3073
10510	3074
10511	3075
10513	3076
10514	3077
10516	3078
10517	3079
10518	3080
10519	3081
10521	3243
10522	3244
10524	3245
10526	3246
10528	3247
10529	3248
10530	3249
10532	3250
10533	3251
10534	3252
10535	3253
10536	3254
10538	3255
10539	3256
10541	3257
10542	3258
10544	3259
10546	3260
10548	3261
10549	3262
10550	3263
10551	3264
10552	3265
10553	3266
10554	3267
10555	3268
10556	3269
10557	3270
10559	3271
10560	3272
10562	3285
10563	3286
10564	3287
10565	3288
10566	3289
10567	3290
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
29294	6	Vista aplanada reordenable de tarefas Gantt	\N	2010-03-18 00:00:00	2010-03-30 00:00:00	\N	29298	\N	2
29295	6	Escenarios de planificación	\N	2010-02-27 00:00:00	2010-05-15 00:00:00	\N	29298	\N	3
29296	6	Melloras na pantalla de planificación	\N	2010-02-01 00:00:00	2010-02-12 00:00:00	\N	29298	\N	4
29297	6	Melloras na pantalla de carga de recursos 	\N	2010-02-12 00:00:00	2010-02-26 00:00:00	\N	29298	\N	5
29299	6	Vista de asignación de recursos limitantes	\N	2010-02-09 00:00:00	2010-03-10 00:00:00	\N	29304	\N	0
29300	6	Melloras no sistema e pantalla de asignación	\N	2010-05-15 00:00:00	2010-05-28 00:00:00	\N	29304	\N	1
29301	6	Modificación da unidade mínima de tempo asignable	\N	2010-02-01 00:00:00	2010-02-09 00:00:00	\N	29304	\N	2
29292	6	Técnica de consolidación de avances	\N	2010-02-01 00:00:00	2010-02-27 00:00:00	\N	29298	\N	0
29293	6	Reorganización vertical de tarefas Gantt	\N	2010-03-10 00:00:00	2010-03-18 00:00:00	\N	29298	\N	1
29302	6	Gráfica de carga de recursos diferenciada máquina-humano	\N	2010-02-26 00:00:00	2010-03-04 00:00:00	\N	29304	\N	3
29303	6	Gráfico de uso de recursos filtrada por criterio 	\N	2010-03-04 00:00:00	2010-03-10 00:00:00	\N	29304	\N	4
29308	6	Técnica de valor gañado con información económica	\N	2010-03-10 00:00:00	2010-03-24 00:00:00	\N	29309	\N	0
29310	6	Asociar lista de chequeo a tipo de avance 	\N	2010-02-24 00:00:00	2010-03-04 00:00:00	\N	29311	\N	0
29312	6	Consulta da información subcontratada na aplicación	\N	2010-03-24 00:00:00	2010-04-08 00:00:00	\N	29313	\N	0
29316	6	Consulta información histórica dos modelos de planificación	\N	2010-04-08 00:00:00	2010-04-20 00:00:00	\N	29317	\N	0
29318	6	3 informes definidos polas empresas	\N	2010-03-04 00:00:00	2010-03-10 00:00:00	\N	29319	\N	0
29298	8	Módulo de planificación	\N	2010-02-01 00:00:00	2010-05-15 00:00:00	\N	29323	\N	1
29304	8	Módulo de asignación de recursos	\N	2010-02-01 00:00:00	2010-05-28 00:00:00	\N	29323	\N	2
29309	8	Módulo de control de custos	\N	2010-02-01 00:00:00	2010-03-24 00:00:00	\N	29323	\N	4
29311	8	Módulo de xestión da calidade	\N	2010-02-01 00:00:00	2010-03-04 00:00:00	\N	29323	\N	5
29313	8	Módulo de integración con subcontratas	\N	2010-02-01 00:00:00	2010-04-08 00:00:00	\N	29323	\N	6
29317	8	Módulo de arquivo histórico	\N	2010-02-01 00:00:00	2010-04-20 00:00:00	\N	29323	\N	8
29319	8	Módulo de informes	\N	2010-02-01 00:00:00	2010-03-10 00:00:00	\N	29323	\N	9
29323	8	5º release devenvolvemento aplicación xestión produción	\N	2010-02-01 00:00:00	2010-06-04 00:00:00	2010-06-07	\N	\N	\N
29290	6	Xestión de Roles e información sensible	\N	2010-02-01 00:00:00	2010-02-06 00:00:00	\N	29291	\N	0
29305	6	Revisión de usabilidade da pantalla de asignación de avances	\N	2010-02-06 00:00:00	2010-02-16 00:00:00	\N	29307	\N	0
29306	6	Acceso directo dende planificación a xestión de avances	\N	2010-02-16 00:00:00	2010-02-24 00:00:00	\N	29307	\N	1
29314	6	Rendimento e melloras xerais en eficiencia	\N	2010-05-15 00:00:00	2010-05-29 00:00:00	\N	29315	\N	0
29320	6	Resolución de bugs	\N	2010-02-01 00:00:00	2010-06-04 00:00:00	\N	29323	\N	10
29321	6	Análise	\N	2010-02-01 00:00:00	2010-06-01 00:00:00	\N	29323	\N	11
29322	6	Coordinación	\N	2010-02-01 00:00:00	2010-06-04 00:00:00	\N	29323	\N	12
29291	8	Xestion de usuarios	\N	2010-02-01 00:00:00	2010-02-06 00:00:00	\N	29323	\N	0
41007	2	HITO SEGUNDO	\N	2010-02-18 00:00:00	2010-02-20 12:00:00	2010-03-25	41008	\N	1
41006	2	HITO PRIMERO	\N	2010-01-20 00:00:00	2010-01-30 00:00:00	2010-02-02	41008	\N	0
41008	2	PRUEBA	\N	2010-01-20 00:00:00	2010-02-20 12:00:00	2011-03-31	\N	\N	\N
10504	37	Xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-15 00:00:00	\N	10508	\N	0
10505	37	Xestión de roles	\N	2009-12-15 00:00:00	2009-12-17 00:00:00	\N	10508	\N	1
10506	37	Xestión de perfiles	\N	2009-12-17 00:00:00	2009-12-19 00:00:00	\N	10508	\N	2
10507	37	Xestión de roles e pedidos	\N	2009-12-19 00:00:00	2009-12-26 00:00:00	\N	10508	\N	3
29307	8	Módulo de control de avance	\N	2010-02-01 00:00:00	2010-02-24 00:00:00	\N	29323	\N	3
10509	37	Xestión de código único	\N	2009-12-22 00:00:00	2009-12-25 00:00:00	\N	10512	\N	0
10510	37	Revisión de formulario de pedidos	\N	2010-01-09 00:00:00	2010-01-20 00:00:00	\N	10512	\N	1
10511	37	Filtrado no listado de pedidos	\N	2010-01-29 00:00:00	2010-01-30 00:00:00	\N	10512	\N	2
29315	8	Módulo de arquitectura	\N	2010-02-01 00:00:00	2010-05-29 00:00:00	\N	29323	\N	7
10513	37	Recursos Virtuais	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	10515	\N	0
10514	37	Recursos Virtuais (Cont.)	\N	2009-12-19 00:00:00	2009-12-22 00:00:00	\N	10515	\N	1
10516	37	Compartir estado entre pestañas de planificación	\N	2010-01-30 00:00:00	2010-02-04 00:00:00	\N	10520	\N	0
10517	37	Técnica de recálculo de asignacións	\N	2010-01-06 00:00:00	2010-01-14 00:00:00	\N	10520	\N	1
10518	37	Filtrado de pedidos e tarefas de un pedido	\N	2010-01-23 00:00:00	2010-01-29 00:00:00	\N	10520	\N	2
10519	37	Modelos de pedidos e planificación	\N	2009-12-22 00:00:00	2009-12-31 00:00:00	\N	10520	\N	3
10521	37	Interpolación polinómica na asignación	\N	2010-01-20 00:00:00	2010-01-23 00:00:00	\N	10523	\N	0
10522	37	Asignación avanzada asignación automática	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	10523	\N	1
10524	37	Procura de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	10525	\N	0
10526	37	Informe de necesidades de materiais	\N	2010-01-02 00:00:00	2010-01-09 00:00:00	\N	10527	\N	0
10528	37	Administración de checklists	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	10531	\N	0
10529	37	Cubrir formularios de calidade en planificación	\N	2009-12-22 00:00:00	2009-12-26 00:00:00	\N	10531	\N	1
10530	37	Incorporar as listas de chequeo nos modelos de planificación	\N	2009-12-31 00:00:00	2010-01-06 00:00:00	\N	10531	\N	2
10532	37	Definir workflow ERP pedidos	\N	2009-12-14 00:00:00	2010-01-23 00:00:00	\N	10537	\N	0
10533	37	Formato de intercambio de pedidos e elementos de pedidos	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	10537	\N	1
10534	37	Formato de intercambio de información de avances	\N	2009-12-25 00:00:00	2010-01-01 00:00:00	\N	10537	\N	2
10535	37	Formato de intercambio de recursos	\N	2009-12-14 00:00:00	2009-12-30 00:00:00	\N	10537	\N	3
10536	37	Formato de intercambio de materiais	\N	2009-12-30 00:00:00	2010-01-21 00:00:00	\N	10537	\N	4
10538	37	Imprimir o diagrama de Gantt en varias páxinas	\N	2009-12-29 00:00:00	2010-01-28 00:00:00	\N	10540	\N	0
10539	37	Imprimir información pantalla do planificador	\N	2009-12-19 00:00:00	2009-12-29 00:00:00	\N	10540	\N	1
10541	37	Enlazar a axuda de usuario	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	10543	\N	0
10542	37	Desenvolvemento de paquetes Debian	\N	2009-12-14 00:00:00	2010-01-27 00:00:00	\N	10543	\N	1
10544	37	Documentación das APIs públicas da aplicación	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	10545	\N	0
10546	37	Pasar pedidos a Histórico	\N	2010-01-14 00:00:00	2010-01-20 00:00:00	\N	10547	\N	0
10548	37	Integración con Jasper Reports	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	10558	\N	0
10549	37	Informes sobre organizacións de traballo	\N	2010-01-13 00:00:00	2010-01-19 00:00:00	\N	10558	\N	1
10550	37	Informes sobre partes de traballo	\N	2010-01-19 00:00:00	2010-01-23 00:00:00	\N	10558	\N	2
10551	37	Informes de horas traballadas por un traballador	\N	2009-12-16 00:00:00	2009-12-22 00:00:00	\N	10558	\N	3
10552	37	Lista de avances de planificación da empresa	\N	2010-01-01 00:00:00	2010-01-07 00:00:00	\N	10558	\N	4
10553	37	Lista de avances de traballo da empresa	\N	2009-12-22 00:00:00	2009-12-26 00:00:00	\N	10558	\N	5
10554	37	Informe de horas estimadas/horas realies	\N	2009-12-26 00:00:00	2010-01-01 00:00:00	\N	10558	\N	6
10555	37	Horas realizadas organizadas por tipo de traballo	\N	2010-01-07 00:00:00	2010-01-13 00:00:00	\N	10558	\N	7
10556	37	Horas estimadas/horas realizadas por tipo de traballo	\N	2010-01-06 00:00:00	2010-01-22 00:00:00	\N	10558	\N	8
10557	37	Informe de traballador indicando custos por hora	\N	2009-12-19 00:00:00	2010-01-06 00:00:00	\N	10558	\N	9
10559	37	Coordinación	\N	2009-12-14 00:00:00	2010-01-27 00:00:00	\N	10561	\N	14
10560	37	Análise	\N	2009-12-14 00:00:00	2010-01-27 00:00:00	\N	10561	\N	15
10562	33	Administración das subcontratas	\N	2009-12-26 00:00:00	2010-01-07 00:00:00	\N	10568	\N	0
10563	33	Formato de intercambio	\N	2010-01-01 00:00:00	2010-01-05 00:00:00	\N	10568	\N	1
10564	33	Fluxo de importación/exportación	\N	2010-01-05 00:00:00	2010-01-09 00:00:00	\N	10568	\N	2
10565	33	Interfaz de xestión de subcontratas	\N	2010-01-09 00:00:00	2010-01-16 00:00:00	\N	10568	\N	3
10566	33	Convertir en fitos subcontratacións	\N	2010-01-16 00:00:00	2010-01-20 00:00:00	\N	10568	\N	4
10567	33	Avance e custo de subcontratas en Técnica VG	\N	2010-01-20 00:00:00	2010-01-26 00:00:00	\N	10568	\N	5
10508	53	Módulo de Xestión de Usuarios	\N	2009-12-14 00:00:00	2009-12-26 00:00:00	\N	10561	\N	0
10512	53	Módulo de organización do traballo	\N	2009-12-14 00:00:00	2010-01-30 00:00:00	\N	10561	\N	1
10515	53	Módulo de recursos	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	10561	\N	2
10520	53	Módulo de planificación	\N	2009-12-14 00:00:00	2010-02-04 00:00:00	\N	10561	\N	3
10523	53	Módulo de asignación de recursos	\N	2009-12-14 00:00:00	2010-01-23 00:00:00	\N	10561	\N	4
10525	53	Módulo de Partes de Traballo	\N	2009-12-14 00:00:00	2010-01-02 00:00:00	\N	10561	\N	5
10527	53	Módulo de materiais	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	10561	\N	6
10531	53	Módulo de xestión da calidade	\N	2009-12-14 00:00:00	2010-01-06 00:00:00	\N	10561	\N	7
10537	53	Módulo de Importación-Exportación	\N	2009-12-14 00:00:00	2010-01-23 00:00:00	\N	10561	\N	8
10540	53	Módulo de Presentación	\N	2009-12-14 00:00:00	2010-01-28 00:00:00	\N	10561	\N	9
10543	53	Módulo de arquitectura tecnolóxica	\N	2009-12-14 00:00:00	2010-01-27 00:00:00	\N	10561	\N	10
10545	53	Módulo de Documentación de API	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	10561	\N	11
10547	53	Módulo de Arquivo Histórico	\N	2009-12-14 00:00:00	2010-01-20 00:00:00	\N	10561	\N	12
10558	53	Módulo de Extracción de Informes	\N	2009-12-14 00:00:00	2010-01-23 00:00:00	\N	10561	\N	13
10568	47	Módulo de integración con subcontratas	\N	2009-12-14 00:00:00	2010-01-26 00:00:00	\N	10561	\N	16
10561	53	4º release devenvolvemento aplicación xestión produción	\N	2009-12-14 00:00:00	2010-02-04 00:00:00	2010-01-29	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
10508
10512
10515
10520
10523
10525
10527
10531
10537
10540
10543
10545
10547
10558
10561
10568
29291
29298
29304
29307
29309
29311
29313
29315
29317
29319
29323
41008
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
29291	3	25929
29298	3	25931
29304	3	25936
29307	3	26091
29309	3	26094
29311	3	26096
29313	3	26098
29315	3	26100
29317	3	26102
29319	3	26104
29323	3	25889
29290	5	25930
29292	5	25932
29293	5	25933
29294	5	25934
29295	5	25935
29296	5	26119
29297	5	26120
29299	5	25937
29300	5	25938
29301	5	25939
29302	5	25940
29303	5	25941
29305	5	26092
29306	5	26093
29308	5	26095
29310	5	26097
29312	5	26099
41006	1	40646
41007	1	40647
41008	1	40645
29314	5	26101
29316	5	26103
29318	5	26105
10508	17	2297
29320	5	26106
29321	5	26121
29322	5	26122
10512	17	2302
10515	17	2306
10520	17	2309
10523	17	3202
10525	17	3205
10527	17	3207
10531	17	3209
10537	17	3213
10540	17	3219
10543	17	3222
10545	17	3225
10547	17	3227
10558	17	3229
10568	15	3357
10561	17	2245
10504	33	2298
10505	33	2299
10506	33	2300
10507	33	2301
10509	33	2303
10510	33	2304
10511	33	2305
10513	33	2307
10514	33	2308
10516	33	2310
10517	33	2311
10518	33	2312
10519	33	2313
10521	33	3203
10522	33	3204
10524	33	3206
10526	33	3208
10528	33	3210
10529	33	3211
10530	33	3212
10532	33	3214
10533	33	3215
10534	33	3216
10535	33	3217
10536	33	3218
10538	33	3220
10539	33	3221
10541	33	3223
10542	33	3224
10544	33	3226
10546	33	3228
10548	33	3230
10549	33	3231
10550	33	3333
10551	33	3334
10552	33	3335
10553	33	3336
10554	33	3337
10555	33	3338
10556	33	3339
10557	33	3340
10559	33	3341
10560	33	3342
10562	29	3358
10563	29	3359
10564	29	3360
10565	29	3361
10566	29	3362
10567	29	3363
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
2626	1	NORMAL	1	9.00	t
2627	1	EXTRAORDINARIA	2	12.00	t
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
910	ROLE_ADMINISTRATION
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

COPY work_report (id, version, date, work_report_type_id, resource_id, order_element_id) FROM stdin;
25250	1	\N	25149	1330	\N
25251	1	\N	25149	1330	\N
25252	1	\N	25149	1314	\N
25257	1	\N	25149	1314	\N
25258	1	\N	25149	1314	\N
25259	1	\N	25149	1341	\N
25260	1	\N	25149	1341	\N
25262	1	\N	25149	1341	\N
25264	1	\N	25149	1341	\N
25265	1	\N	25149	1341	\N
25267	1	\N	25149	1328	\N
25268	1	\N	25149	1322	\N
25269	1	\N	25149	1322	\N
25270	1	\N	25149	1335	\N
25272	1	\N	25149	1326	\N
25273	1	\N	25149	1326	\N
25275	1	\N	25149	1345	\N
25276	1	\N	25149	1345	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
25351	1	9	2009-12-24 00:00:00	\N	\N	25250	1330	2301	2626
25352	1	8	2009-12-17 00:00:00	\N	\N	25250	1330	2300	2626
25353	1	8	2009-12-18 00:00:00	\N	\N	25250	1330	2300	2626
25354	1	9	2009-12-23 00:00:00	\N	\N	25250	1330	2301	2626
25355	1	8	2009-12-22 00:00:00	\N	\N	25250	1330	2301	2626
25356	1	7	2009-12-16 00:00:00	\N	\N	25250	1330	2299	2626
25357	1	8	2009-12-15 00:00:00	\N	\N	25250	1330	2299	2626
25358	1	8	2009-12-21 00:00:00	\N	\N	25250	1330	2301	2626
25359	1	9	2009-12-14 00:00:00	\N	\N	25250	1330	2298	2626
25360	1	9	2009-12-28 00:00:00	\N	\N	25250	1330	2301	2626
25361	1	8	2010-01-15 00:00:00	\N	\N	25251	1330	3358	2626
25362	1	8	2010-01-13 00:00:00	\N	\N	25251	1330	3358	2626
25363	1	7	2010-01-12 00:00:00	\N	\N	25251	1330	3358	2626
25364	1	7	2010-01-11 00:00:00	\N	\N	25251	1330	3358	2626
25365	1	8	2009-12-30 00:00:00	\N	\N	25251	1330	3358	2626
25366	1	8	2010-01-14 00:00:00	\N	\N	25251	1330	3358	2626
25367	1	8	2010-01-08 00:00:00	\N	\N	25251	1330	3358	2626
25368	1	7	2010-01-07 00:00:00	\N	\N	25251	1330	3358	2626
25369	1	7	2009-12-29 00:00:00	\N	\N	25251	1330	3358	2626
25370	1	7	2010-01-05 00:00:00	\N	\N	25251	1330	3358	2626
25371	1	8	2010-01-04 00:00:00	\N	\N	25251	1330	3358	2626
25372	1	8	2009-12-31 00:00:00	\N	\N	25251	1330	3358	2626
25373	1	7	2009-12-14 00:00:00	\N	\N	25252	1314	2307	2626
25374	1	8	2009-12-15 00:00:00	\N	\N	25252	1314	2307	2626
25375	1	8	2009-12-16 00:00:00	\N	\N	25252	1314	2307	2626
25376	1	7	2009-12-18 00:00:00	\N	\N	25252	1314	2307	2626
25377	1	9	2009-12-19 00:00:00	\N	\N	25252	1314	2307	2626
25382	1	8	2010-01-04 00:00:00	\N	\N	25257	1314	3221	2626
25383	1	9	2009-12-21 00:00:00	\N	\N	25257	1314	3221	2626
25384	1	9	2010-01-05 00:00:00	\N	\N	25257	1314	3221	2626
25385	1	9	2009-12-22 00:00:00	\N	\N	25257	1314	3221	2626
25386	1	9	2009-12-23 00:00:00	\N	\N	25257	1314	3221	2626
25387	1	8	2009-12-31 00:00:00	\N	\N	25257	1314	3221	2626
25388	1	9	2009-12-24 00:00:00	\N	\N	25257	1314	3221	2626
25389	1	9	2009-12-30 00:00:00	\N	\N	25257	1314	3221	2626
25390	1	9	2009-12-28 00:00:00	\N	\N	25257	1314	3221	2626
25391	1	9	2009-12-29 00:00:00	\N	\N	25257	1314	3221	2626
25392	1	8	2009-12-21 00:00:00	\N	\N	25258	1314	3340	2626
25393	1	8	2009-12-23 00:00:00	\N	\N	25258	1314	3340	2626
25394	1	8	2009-12-28 00:00:00	\N	\N	25258	1314	3340	2626
25395	1	8	2009-12-29 00:00:00	\N	\N	25258	1314	3340	2626
25396	1	8	2010-01-05 00:00:00	\N	\N	25258	1314	3340	2626
25397	1	10	2009-12-14 00:00:00	\N	\N	25259	1341	3204	2626
25398	1	10	2009-12-15 00:00:00	\N	\N	25259	1341	3204	2626
25399	1	10	2009-12-16 00:00:00	\N	\N	25259	1341	3204	2626
25400	1	9	2009-12-17 00:00:00	\N	\N	25259	1341	3204	2626
25401	1	10	2009-12-18 00:00:00	\N	\N	25259	1341	3204	2626
25402	1	10	2009-12-24 00:00:00	\N	\N	25260	1341	2313	2626
25403	1	10	2009-12-23 00:00:00	\N	\N	25260	1341	2313	2626
25404	1	10	2009-12-22 00:00:00	\N	\N	25260	1341	2313	2626
25405	1	8	2009-12-21 00:00:00	\N	\N	25260	1341	2308	2626
25406	1	10	2009-12-31 00:00:00	\N	\N	25260	1341	2313	2626
25407	1	10	2009-12-30 00:00:00	\N	\N	25260	1341	2313	2626
25408	1	10	2009-12-29 00:00:00	\N	\N	25260	1341	2313	2626
25410	1	8	2010-01-15 00:00:00	\N	\N	25262	1341	2313	2626
25411	1	8	2010-01-14 00:00:00	\N	\N	25262	1341	2313	2627
25412	1	8	2010-01-04 00:00:00	\N	\N	25262	1341	2313	2626
25413	1	8	2010-01-05 00:00:00	\N	\N	25262	1341	2313	2626
25414	1	8	2010-01-07 00:00:00	\N	\N	25262	1341	2313	2626
25415	1	8	2010-01-12 00:00:00	\N	\N	25262	1341	2313	2626
25416	1	8	2010-01-08 00:00:00	\N	\N	25262	1341	2313	2626
25417	1	8	2010-01-13 00:00:00	\N	\N	25262	1341	2313	2626
25418	1	8	2010-01-11 00:00:00	\N	\N	25262	1341	2313	2626
25420	1	8	2009-12-14 00:00:00	\N	\N	25264	1341	3210	2626
25421	1	8	2009-12-15 00:00:00	\N	\N	25264	1341	3210	2626
25422	1	8	2009-12-16 00:00:00	\N	\N	25264	1341	3210	2626
25423	1	8	2009-12-21 00:00:00	\N	\N	25264	1341	3210	2626
25424	1	8	2009-12-17 00:00:00	\N	\N	25264	1341	3210	2626
25425	1	8	2009-12-18 00:00:00	\N	\N	25264	1341	3210	2626
25426	1	8	2009-12-22 00:00:00	\N	\N	25265	1341	3211	2626
25427	1	8	2009-12-23 00:00:00	\N	\N	25265	1341	3211	2626
25428	1	8	2009-12-24 00:00:00	\N	\N	25265	1341	3211	2626
25429	1	8	2009-12-28 00:00:00	\N	\N	25265	1341	3211	2626
25440	1	8	2009-12-29 00:00:00	\N	\N	25267	1328	3206	2626
25441	1	8	2010-01-07 00:00:00	\N	\N	25267	1328	3208	2626
25442	1	8	2010-01-08 00:00:00	\N	\N	25267	1328	3208	2626
25443	1	8	2010-01-11 00:00:00	\N	\N	25267	1328	3208	2626
25444	1	8	2010-01-12 00:00:00	\N	\N	25267	1328	3208	2626
25445	1	8	2009-12-30 00:00:00	\N	\N	25267	1328	3206	2626
25446	1	8	2009-12-31 00:00:00	\N	\N	25267	1328	3206	2626
25447	1	8	2010-01-13 00:00:00	\N	\N	25267	1328	3208	2626
25448	1	8	2010-01-04 00:00:00	\N	\N	25267	1328	3206	2626
25449	1	8	2010-01-05 00:00:00	\N	\N	25267	1328	3206	2626
25450	1	8	2009-12-14 00:00:00	\N	\N	25268	1322	3215	2626
25451	1	8	2009-12-15 00:00:00	\N	\N	25268	1322	3215	2626
25452	1	8	2009-12-16 00:00:00	\N	\N	25268	1322	3215	2626
25453	1	8	2009-12-17 00:00:00	\N	\N	25268	1322	3215	2626
25454	1	8	2009-12-18 00:00:00	\N	\N	25268	1322	3215	2626
25455	1	8	2009-12-21 00:00:00	\N	\N	25268	1322	3215	2626
25456	1	8	2009-12-22 00:00:00	\N	\N	25269	1322	2303	2626
25457	1	9	2010-01-04 00:00:00	\N	\N	25269	1322	3216	2626
25458	1	9	2009-12-30 00:00:00	\N	\N	25269	1322	3216	2626
25459	1	9	2010-01-15 00:00:00	\N	\N	25269	1322	3361	2626
25460	1	9	2009-12-23 00:00:00	\N	\N	25269	1322	2303	2626
25461	1	7	2010-01-12 00:00:00	\N	\N	25269	1322	3216	2626
25462	1	9	2009-12-28 00:00:00	\N	\N	25269	1322	3216	2626
25463	1	8	2009-12-24 00:00:00	\N	\N	25269	1322	2303	2626
25464	1	8	2010-01-14 00:00:00	\N	\N	25269	1322	3361	2626
25465	1	9	2009-12-31 00:00:00	\N	\N	25269	1322	3216	2626
25466	1	7	2010-01-11 00:00:00	\N	\N	25269	1322	3216	2626
25467	1	7	2010-01-08 00:00:00	\N	\N	25269	1322	3216	2626
25468	1	9	2009-12-29 00:00:00	\N	\N	25269	1322	3216	2626
25469	1	8	2010-01-05 00:00:00	\N	\N	25269	1322	3216	2626
25470	1	8	2010-01-13 00:00:00	\N	\N	25269	1322	3361	2626
25471	1	8	2010-01-07 00:00:00	\N	\N	25269	1322	3216	2626
25472	1	4	2009-12-14 00:00:00	\N	\N	25270	1335	3217	2626
25473	1	4	2009-12-15 00:00:00	\N	\N	25270	1335	3217	2626
25474	1	4	2009-12-16 00:00:00	\N	\N	25270	1335	3217	2626
25475	1	3	2009-12-17 00:00:00	\N	\N	25270	1335	3217	2626
25476	1	4	2009-12-18 00:00:00	\N	\N	25270	1335	3217	2626
25477	1	8	2009-12-30 00:00:00	\N	\N	25270	1335	3217	2626
25479	1	8	2009-12-14 00:00:00	\N	\N	25272	1326	3230	2626
25480	1	8	2009-12-15 00:00:00	\N	\N	25272	1326	3230	2626
25481	1	8	2009-12-16 00:00:00	\N	\N	25272	1326	3334	2626
25482	1	8	2009-12-17 00:00:00	\N	\N	25272	1326	3334	2626
25483	1	8	2009-12-18 00:00:00	\N	\N	25272	1326	3334	2626
25484	1	8	2009-12-31 00:00:00	\N	\N	25273	1326	3337	2626
25485	1	8	2009-12-21 00:00:00	\N	\N	25273	1326	3336	2626
25486	1	8	2010-01-04 00:00:00	\N	\N	25273	1326	3337	2626
25487	1	8	2009-12-22 00:00:00	\N	\N	25273	1326	3336	2626
25488	1	8	2009-12-23 00:00:00	\N	\N	25273	1326	3336	2626
25489	1	8	2009-12-24 00:00:00	\N	\N	25273	1326	3337	2626
25490	1	8	2009-12-28 00:00:00	\N	\N	25273	1326	3337	2627
25491	1	8	2010-01-05 00:00:00	\N	\N	25273	1326	3337	2626
25492	1	8	2009-12-29 00:00:00	\N	\N	25273	1326	3337	2626
25493	1	8	2009-12-30 00:00:00	\N	\N	25273	1326	3335	2626
25495	1	8	2009-12-14 00:00:00	\N	\N	25275	1345	3214	2626
25496	1	8	2009-12-15 00:00:00	\N	\N	25275	1345	3214	2626
25497	1	8	2009-12-16 00:00:00	\N	\N	25275	1345	3214	2626
25498	1	8	2009-12-17 00:00:00	\N	\N	25275	1345	3214	2627
25499	1	8	2009-12-18 00:00:00	\N	\N	25275	1345	3214	2626
25500	1	8	2009-12-23 00:00:00	\N	\N	25275	1345	3223	2626
25501	1	8	2009-12-23 00:00:00	\N	\N	25276	1345	3223	2626
25502	1	8	2010-12-04 00:00:00	\N	\N	25276	1345	3223	2626
25503	1	8	2010-12-05 00:00:00	\N	\N	25276	1345	3223	2626
25504	1	8	2009-12-24 00:00:00	\N	\N	25276	1345	3223	2626
25505	1	8	2010-12-06 00:00:00	\N	\N	25276	1345	3223	2626
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
25149	1	Tipo1	cod1	f	t	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1320	Xavier	Contra Gonzalez	33333333C
1328	Susana	Maneiro Garcia	66666666F
1322	Moncho	Ramirez Correa	44444444D
1314	Luis	Tome Alvarez	11111111A
1330	Jose	Armendariz Pino	77777777H
1316	Javier	Machado Romero	22222222B
1326	Daniel	Paz Gonzalez	55555555E
1333	Suso	Ramirez Ramirez	9999999R
1335	Santiago	Solla Sobrino	10000000V
1341	Oscar	Garcia Ferreira	11111111C
1343	Francisco	Baamonde	22222222G
1345	Chema	Castiñeira Castro	33333333T
40098	ANTONIO	ROMAN GOMEZ	52359709W
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
-- Name: calendardata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_pkey PRIMARY KEY (id);


--
-- Name: calendarexception_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_pkey PRIMARY KEY (id);


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
-- Name: work_report_label_type_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT work_report_label_type_assigment_pkey PRIMARY KEY (id);


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


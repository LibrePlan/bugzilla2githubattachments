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
    criterion_id bigint,
    parent bigint,
    isvalid boolean,
    valid boolean
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
    resource bigint NOT NULL,
    code character varying(255)
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
    workhours integer
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
    base_calendar_id bigint,
    code character varying(255)
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
    resource_id bigint,
    code character varying(255)
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
    task_element_id bigint,
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
    code character varying(255) NOT NULL,
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
25620	4	t	204
25621	4	t	204
2865	7	t	202
25622	4	f	204
2866	7	t	202
2867	7	t	202
25623	4	f	204
138789	5	t	203
138790	5	t	203
60612	12	t	203
60613	12	f	203
45806	15	t	202
60614	12	f	203
138775	7	t	202
138791	5	f	203
138792	5	f	203
138776	7	t	202
85873	4	t	205
85874	4	t	205
85851	5	f	202
85875	4	t	205
85876	4	f	205
85850	5	t	202
65120	7	f	204
65121	7	f	203
62046	14	t	202
65122	7	t	203
244728	2	t	203
244729	2	f	203
244730	2	t	202
244731	2	f	203
86371	15	t	205
86372	15	t	205
86373	15	f	205
244732	2	t	202
206561	3	t	205
206562	3	t	205
45782	8	t	203
45781	8	f	204
45783	8	f	203
45784	8	f	204
25649	11	t	202
25645	15	t	202
25641	16	t	202
45786	8	f	203
45785	8	f	204
45788	8	t	203
45787	8	f	204
206563	3	f	205
206564	3	t	202
206565	3	f	205
86374	15	t	202
86355	15	t	202
86375	15	f	205
206545	3	t	202
244734	3	t	202
206566	3	t	205
138795	5	t	202
86403	1	t	205
86404	1	f	205
206567	3	f	205
86398	6	t	205
86399	6	t	205
86405	1	f	205
86401	6	t	202
86400	6	f	205
86377	6	t	202
86402	6	f	205
25576	8	t	203
25577	8	t	203
25578	8	t	203
135340	3	t	202
2845	14	t	202
25579	8	t	203
135341	3	f	202
86376	2	t	205
85877	2	t	205
84852	5	t	202
85878	2	f	205
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
61410	1	203	61337	t	100.00
135039	1	205	134944	t	100.00
135544	1	205	135443	t	100.00
135545	1	205	135443	t	100.00
135546	1	205	135443	t	100.00
135547	1	205	135443	t	100.00
135548	1	205	135443	t	100.00
135549	1	205	135443	t	100.00
135550	1	205	135443	t	100.00
135551	1	205	135443	t	100.00
135552	1	205	135443	t	100.00
135553	1	205	135443	t	100.00
207052	1	205	206951	t	100.00
207053	1	205	206951	t	100.00
207056	1	205	206954	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
25497	4	2010-02-01	300.00	25620	\N
25498	4	2010-02-01	200.00	25621	\N
86469	1	2010-02-16	16.66	86403	\N
86459	15	2010-02-16	10.00	86371	\N
65183	7	2010-02-15	30.00	65120	\N
65184	7	2010-02-15	20.00	65121	\N
86460	15	2010-02-16	15.00	86372	\N
25508	8	2010-02-04	20.00	45782	\N
25507	8	2010-02-04	500.00	45781	\N
85960	4	2010-02-16	10.00	85873	2010-02-16 13:10:08.636
85961	4	2010-02-16	30.00	85874	\N
206649	3	2010-02-16	20.00	206561	2010-02-16 20:25:32.484
206650	3	2010-02-16	32.00	206562	2010-02-16 20:25:32.484
206651	3	2010-02-16	21.08	206566	\N
86467	6	2010-02-16	20.00	86398	\N
86468	6	2010-02-16	15.00	86399	\N
25478	8	2010-02-08	20.00	25576	\N
25479	8	2010-02-17	60.00	25577	\N
25480	8	2010-02-05	30.00	25577	\N
86461	2	2010-02-16	12.50	86376	\N
85962	2	2010-02-16	10.00	85877	\N
139384	5	2010-02-16	10.00	138789	\N
139385	5	2010-02-16	20.00	138790	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
202	4	children	100.0000	f	0.0100	t	t	\N
203	3	percentage	100.0000	f	0.0100	t	t	\N
204	2	units	2147483647.0000	f	1.0000	t	f	\N
205	1	subcontractor	100.0000	f	0.0100	t	t	\N
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
3641	2528
3642	2528
3689	2530
3692	2530
3694	2530
99081	2528
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
34958	3
34966	2
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
303	1	Default
1732	2	\N
1720	1	\N
1719	2	\N
1718	2	\N
1721	1	\N
1722	1	\N
1733	2	\N
1725	9	\N
1727	6	\N
1728	6	\N
1717	5	GALICIA
1724	2	VIGO
1730	5	\N
1726	7	\N
1729	7	\N
1731	3	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
2333	5	2010-02-04	\N	1730	0
2329	7	2010-01-01	\N	1726	0
2332	7	2010-01-01	\N	1729	0
2334	3	2010-02-04	\N	1731	0
2325	1	2010-02-01	\N	1720	0
2324	2	2010-02-01	\N	1719	0
2323	2	2010-02-01	\N	1718	0
2326	1	2010-02-01	\N	1721	0
2327	1	2010-02-01	\N	1722	0
2335	2	2010-02-12	\N	1732	0
2336	2	2010-02-12	\N	1733	0
2328	9	2010-01-01	\N	1725	0
2330	6	2010-01-01	\N	1727	0
2331	6	2010-01-01	\N	1728	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
404	1	\N	\N	303	0
1919	5	303	2010-02-05	1717	0
1925	4	303	\N	1717	1
1927	2	1717	\N	1724	0
1922	1	1717	\N	1720	0
1921	2	1717	\N	1719	0
1920	2	1717	\N	1718	0
1923	1	1717	\N	1721	0
1924	1	1717	\N	1722	0
1933	5	1717	\N	1730	0
1929	7	1724	\N	1726	0
1932	7	1717	\N	1729	0
1934	3	1717	\N	1731	0
1935	2	1724	\N	1732	0
1936	2	1717	\N	1733	0
1928	9	1717	\N	1725	0
1930	6	1717	\N	1727	0
1931	6	1717	\N	1728	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1819	5	2010-05-01	0	5	1717
1818	5	2010-07-15	8	5	1717
1826	1	2010-12-25	0	1	1717
1827	1	2010-10-12	0	1	1717
1828	1	2010-11-01	0	1	1717
1829	1	2010-05-17	0	1	1717
1830	1	2010-12-08	0	1	1717
1831	1	2010-12-06	0	1	1717
1832	1	2010-04-02	0	1	1717
1833	1	2010-04-01	0	1	1717
1834	1	2010-03-19	0	1	1717
1824	2	2010-03-09	0	5	1724
1825	2	2010-03-08	0	5	1724
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable) FROM stdin;
1	6	HOLIDAY	red	t
2	5	SICK_LEAVE	red	t
3	4	LEAVE	red	t
4	3	STRIKE	red	t
5	2	BANK_HOLIDAY	red	t
6	1	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode) FROM stdin;
505	2	1717	G12342321
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled) FROM stdin;
1516	3	Peon	f
1517	3	Oficial de Primera	f
1519	3	COORDINADOR	t
1518	5	TECNICO	t
1521	1	ADMINISTRATIVO	t
1520	3	DIRECTOR	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
2531	3	5f01f633-ec89-4280-9759-25a11f69e02d	FERROL	t	229381	\N
2533	3	bb13a7b2-9197-4976-862b-ae9548f07d86	SANTIAGO	t	229381	\N
2532	3	eae914fa-0d47-4af3-ac0c-6dc7d520d7a0	VIGO	t	229381	\N
60701	1	ca76c07b-6aa1-4e57-be7b-694f5872aafb	GERENTE	t	229377	\N
808	14	f9888755-bde9-4d0b-b89d-71c623852e7d	medicalLeave	t	229376	\N
809	13	025f9aef-7e59-472a-8a64-03da4c9af030	paternityLeave	t	229376	\N
810	4	c8dbc675-69f4-4bfd-ba9f-5424bcf39840	hiredResourceWorkingRelationship	t	229380	\N
811	3	b314fbeb-9b98-49ec-b093-97da6261fdf2	firedResourceWorkingRelationship	t	229380	\N
2525	3	bf81e6ce-139a-44a4-b4d5-73ad13ebf1ef	Pintor	t	229379	\N
2526	3	b83309a1-b46d-475d-9911-9cf597f62ee4	Carpintero	t	229379	\N
2527	3	523648d1-e43b-4522-97db-101819cd1b32	Calderero	t	229379	\N
2529	2	f0b67a29-8df4-4107-972e-97d08aa1bd10	TECNICO	t	229379	\N
2528	3	2aaae89b-6cf7-4458-9607-03a586a772d0	Soldador	t	229379	\N
2530	2	181913d5-6262-4664-b076-67b019fb6427	COORDINADOR	t	229379	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid, valid) FROM stdin;
3403	DIRECT	11	\N	33249	2530	\N	\N	\N
59969	INDIRECT	13	\N	33310	2529	59937	t	t
59970	INDIRECT	13	3128	\N	2529	59937	t	t
59973	INDIRECT	13	\N	33311	2529	59937	t	t
59974	INDIRECT	13	3129	\N	2529	59937	t	t
59977	INDIRECT	13	\N	33312	2529	59937	t	t
59979	INDIRECT	13	3130	\N	2529	59937	t	t
59980	INDIRECT	13	\N	33313	2529	59937	t	t
66839	DIRECT	6	\N	62983	2526	\N	\N	\N
66840	INDIRECT	6	\N	62984	2526	66839	\N	t
66842	INDIRECT	6	63061	\N	2526	66839	\N	t
66841	INDIRECT	6	63062	\N	2526	66839	\N	t
66843	INDIRECT	6	\N	62985	2526	66839	\N	t
66844	INDIRECT	6	63063	\N	2526	66839	\N	t
66845	INDIRECT	6	\N	62986	2526	66839	\N	t
66846	INDIRECT	6	63064	\N	2526	66839	\N	t
66847	INDIRECT	6	\N	62987	2526	66839	\N	t
66848	INDIRECT	6	63065	\N	2526	66839	\N	t
59983	INDIRECT	13	59691	\N	2529	59937	t	t
59985	INDIRECT	13	\N	33314	2529	59937	t	t
59986	INDIRECT	13	59692	\N	2529	59937	t	t
59988	INDIRECT	13	\N	33315	2529	59937	t	t
59990	INDIRECT	13	59693	\N	2529	59937	t	t
3344	DIRECT	12	\N	2760	2526	\N	\N	\N
3345	INDIRECT	12	3042	\N	2526	3344	t	t
3346	DIRECT	12	\N	2761	2525	\N	\N	\N
3347	INDIRECT	12	3043	\N	2525	3346	t	t
3348	DIRECT	12	3044	\N	2526	\N	\N	\N
3349	DIRECT	12	3045	\N	2525	\N	\N	\N
3368	DIRECT	5	3058	\N	2528	\N	\N	\N
3369	DIRECT	5	3059	\N	2528	\N	\N	\N
63151	DIRECT	14	\N	62983	2529	\N	\N	\N
63152	INDIRECT	14	\N	62984	2529	63151	f	f
63153	INDIRECT	14	63061	\N	2529	63151	f	f
63155	DIRECT	14	63062	\N	2530	\N	\N	\N
63154	INDIRECT	14	63062	\N	2529	63151	f	f
3404	INDIRECT	11	\N	33244	2530	3403	t	t
3405	INDIRECT	11	3080	\N	2530	3403	t	t
3406	INDIRECT	11	\N	33229	2530	3403	t	t
3407	INDIRECT	11	3069	\N	2530	3403	t	t
3408	INDIRECT	11	\N	33245	2530	3403	t	t
3409	INDIRECT	11	3081	\N	2530	3403	t	t
59937	DIRECT	13	\N	33263	2529	\N	\N	\N
59938	INDIRECT	13	\N	33319	2529	59937	t	t
59940	INDIRECT	13	\N	33304	2529	59937	f	f
61100	DIRECT	7	61239	\N	2530	\N	\N	\N
61099	INDIRECT	7	61239	\N	2529	59937	f	f
59942	INDIRECT	13	3122	\N	2529	59937	t	t
59948	INDIRECT	13	\N	33305	2529	59937	t	t
59950	INDIRECT	13	3123	\N	2529	59937	t	t
59953	INDIRECT	13	\N	33306	2529	59937	t	t
59955	INDIRECT	13	3124	\N	2529	59937	t	t
59956	INDIRECT	13	\N	33307	2529	59937	t	t
63156	INDIRECT	14	\N	62985	2529	63151	t	t
63157	INDIRECT	14	63063	\N	2529	63151	t	t
63158	INDIRECT	14	\N	62986	2529	63151	t	t
63159	INDIRECT	14	63064	\N	2529	63151	t	t
63160	INDIRECT	14	\N	62987	2529	63151	t	t
63161	INDIRECT	14	63065	\N	2529	63151	t	t
63162	INDIRECT	14	\N	62988	2529	63151	t	t
66849	INDIRECT	6	\N	62988	2526	66839	\N	t
66850	INDIRECT	6	63066	\N	2526	66839	\N	t
63163	INDIRECT	14	63066	\N	2529	63151	t	t
66851	INDIRECT	6	\N	62989	2526	66839	\N	t
63164	INDIRECT	14	\N	62989	2529	63151	t	t
63165	INDIRECT	14	63067	\N	2529	63151	t	t
66852	INDIRECT	6	63067	\N	2526	66839	\N	t
66853	INDIRECT	6	\N	62990	2526	66839	\N	t
63166	INDIRECT	14	\N	62990	2529	63151	t	t
63167	INDIRECT	14	63068	\N	2529	63151	t	t
63168	INDIRECT	14	\N	62991	2529	63151	t	t
63169	INDIRECT	14	63069	\N	2529	63151	t	t
63170	INDIRECT	14	\N	62992	2529	63151	t	t
63171	INDIRECT	14	63070	\N	2529	63151	t	t
63172	INDIRECT	14	\N	62993	2529	63151	t	t
59958	INDIRECT	13	3125	\N	2529	59937	t	t
59961	INDIRECT	13	\N	33308	2529	59937	t	t
59962	INDIRECT	13	3126	\N	2529	59937	t	t
59965	INDIRECT	13	\N	33309	2529	59937	t	t
59967	INDIRECT	13	3127	\N	2529	59937	t	t
66975	DIRECT	5	67068	\N	808	\N	\N	\N
66974	INDIRECT	5	67068	\N	2525	3346	\N	t
66973	DIRECT	5	3043	\N	809	\N	\N	\N
66976	DIRECT	5	67069	\N	2526	\N	\N	\N
66977	INDIRECT	5	67069	\N	2525	3346	\N	t
66854	INDIRECT	6	63068	\N	2526	66839	\N	t
66855	INDIRECT	6	\N	62991	2526	66839	\N	t
66856	INDIRECT	6	63069	\N	2526	66839	\N	t
66857	INDIRECT	6	\N	62992	2526	66839	\N	t
66858	INDIRECT	6	63070	\N	2526	66839	\N	t
66859	INDIRECT	6	\N	62993	2526	66839	\N	t
63173	INDIRECT	14	63071	\N	2529	63151	t	t
66860	INDIRECT	6	63071	\N	2526	66839	\N	t
63174	INDIRECT	14	\N	62994	2529	63151	t	t
66861	INDIRECT	6	\N	62994	2526	66839	\N	t
66862	INDIRECT	6	63072	\N	2526	66839	\N	t
63175	INDIRECT	14	63072	\N	2529	63151	t	t
66863	INDIRECT	6	\N	62995	2526	66839	\N	t
63176	INDIRECT	14	\N	62995	2529	63151	t	t
63177	INDIRECT	14	63073	\N	2529	63151	t	t
66864	INDIRECT	6	63073	\N	2526	66839	\N	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource, code) FROM stdin;
2626	1	2010-02-01 18:04:52.122	\N	f	2525	2229	2626
2627	1	2010-02-01 18:05:27.227	\N	f	2528	2225	2627
2628	1	2010-02-01 18:05:40.46	\N	f	2526	2223	2628
2629	1	2010-02-01 18:06:19.721	\N	f	2526	2231	2629
2630	1	2010-02-01 18:07:07.697	\N	f	2527	2233	2630
2645	5	2010-02-04 20:22:22.428	\N	f	2533	2245	2645
2644	5	2010-02-04 20:22:16.581	\N	f	2529	2245	2644
2632	7	2010-02-04 16:36:09.521	\N	f	2529	2237	2632
2642	4	2010-02-04 20:21:35.491	\N	f	2532	2237	2642
2635	7	2010-02-04 16:43:24.941	\N	f	2529	2243	2635
2643	4	2010-02-04 20:21:49.706	\N	f	2531	2243	2643
2651	1	2010-02-04 20:43:40.767	\N	f	2529	2247	2651
2646	3	2010-02-04 20:23:13.589	\N	f	2533	2247	2646
2647	3	2010-02-04 20:23:08.833	\N	t	2529	2247	2647
2652	2	2010-02-12 12:45:06.151	\N	f	2532	2249	2652
2653	2	2010-02-12 12:45:23.684	\N	f	2529	2249	2653
2654	1	2010-02-12 13:04:32.316	\N	f	2531	2251	2654
2639	5	2010-02-04 20:21:02.655	\N	f	2532	2235	2639
2640	5	2010-02-04 20:21:15.369	\N	f	2531	2235	2640
2641	5	2010-02-04 20:21:08.291	\N	f	2533	2235	2641
2631	9	2010-02-04 16:31:42.204	\N	t	2530	2235	2631
60802	1	2010-02-12 16:34:26.127	\N	f	60701	2235	60802
2637	3	2010-02-04 20:20:12.025	\N	f	2532	2239	2637
2638	3	2010-02-04 20:20:36.384	\N	f	2533	2239	2638
2636	3	2010-02-04 20:20:45.641	\N	f	2531	2239	2636
2633	6	2010-02-04 16:41:17.16	\N	f	2530	2239	2633
2648	2	2010-02-04 20:43:12.21	\N	f	2531	2241	2648
2634	5	2010-02-04 16:42:48.609	\N	f	2529	2241	2634
2649	2	2010-02-04 20:43:02.139	\N	f	2533	2241	2649
2650	2	2010-02-04 20:43:07.503	\N	f	2532	2241	2650
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
229381	4	5e94740f-8493-48bb-aaa0-ea621689e03d	LOCATION_GROUP	Location where the resource work	t	f	t	0
19464192	9	6b86f5c5-f218-48bc-9031-fd0f1ee1ed96	JOB	Job	t	t	t	1
229377	13	3d5317d6-9d7b-47fd-b0ae-77ba054b2fd5	CATEGORY	Professional category	t	t	t	1
229376	15	3b93d38c-fb2b-480c-b828-682eb8f40a34	LEAVE	Leave	f	f	t	1
229378	9	3945271d-1919-477e-b05e-d17a87ab87f4	TRAINING	Training courses and labor training	t	t	t	1
229380	5	13c37654-b3ac-450d-93d8-d7d75eff0782	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
229379	10	7c6e5f2f-a3b6-4a37-8666-099adaf8cb7e	tipo trabajo	Job	t	t	t	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
95576	SPECIFIC_DAY	3	1	2010-02-04	2229	93091	\N	\N
95790	SPECIFIC_DAY	3	0	2010-02-06	2243	93097	\N	\N
95770	SPECIFIC_DAY	3	8	2010-02-16	2243	93097	\N	\N
95780	SPECIFIC_DAY	3	8	2010-03-31	2243	93097	\N	\N
95794	SPECIFIC_DAY	3	8	2010-03-02	2243	93097	\N	\N
95771	SPECIFIC_DAY	3	8	2010-02-22	2243	93097	\N	\N
95789	SPECIFIC_DAY	3	0	2010-04-02	2243	93097	\N	\N
95776	SPECIFIC_DAY	3	0	2010-03-21	2243	93097	\N	\N
95784	SPECIFIC_DAY	3	8	2010-03-23	2243	93097	\N	\N
95778	SPECIFIC_DAY	3	8	2010-03-10	2243	93097	\N	\N
95774	SPECIFIC_DAY	3	8	2010-02-17	2243	93097	\N	\N
95795	SPECIFIC_DAY	3	2	2010-04-05	2243	93097	\N	\N
95781	SPECIFIC_DAY	3	0	2010-02-21	2243	93097	\N	\N
95793	SPECIFIC_DAY	3	8	2010-02-15	2243	93097	\N	\N
95775	SPECIFIC_DAY	3	0	2010-03-19	2243	93097	\N	\N
95769	SPECIFIC_DAY	3	8	2010-02-04	2243	93097	\N	\N
95796	SPECIFIC_DAY	3	0	2010-02-13	2243	93097	\N	\N
95785	SPECIFIC_DAY	3	8	2010-03-09	2243	93097	\N	\N
95797	SPECIFIC_DAY	3	0	2010-03-06	2243	93097	\N	\N
95786	SPECIFIC_DAY	3	0	2010-02-14	2243	93097	\N	\N
95788	SPECIFIC_DAY	3	0	2010-02-28	2243	93097	\N	\N
95800	SPECIFIC_DAY	3	8	2010-03-30	2243	93097	\N	\N
95801	SPECIFIC_DAY	3	8	2010-02-08	2243	93097	\N	\N
95772	SPECIFIC_DAY	3	6	2010-03-05	2243	93097	\N	\N
95802	SPECIFIC_DAY	3	6	2010-02-19	2243	93097	\N	\N
95779	SPECIFIC_DAY	3	0	2010-03-20	2243	93097	\N	\N
95787	SPECIFIC_DAY	3	8	2010-03-08	2243	93097	\N	\N
95777	SPECIFIC_DAY	3	0	2010-04-03	2243	93097	\N	\N
95792	SPECIFIC_DAY	3	8	2010-03-24	2243	93097	\N	\N
95798	SPECIFIC_DAY	3	0	2010-03-28	2243	93097	\N	\N
95773	SPECIFIC_DAY	3	8	2010-02-18	2243	93097	\N	\N
95782	SPECIFIC_DAY	3	8	2010-03-29	2243	93097	\N	\N
95799	SPECIFIC_DAY	3	8	2010-02-09	2243	93097	\N	\N
95783	SPECIFIC_DAY	3	0	2010-02-27	2243	93097	\N	\N
95791	SPECIFIC_DAY	3	8	2010-03-17	2243	93097	\N	\N
97909	SPECIFIC_DAY	2	6	2010-02-12	2249	97182	\N	\N
97900	SPECIFIC_DAY	2	6	2010-02-26	2249	97182	\N	\N
97914	SPECIFIC_DAY	2	8	2010-04-05	2249	97182	\N	\N
97906	SPECIFIC_DAY	2	8	2010-04-06	2249	97182	\N	\N
97882	SPECIFIC_DAY	2	0	2010-03-07	2249	97182	\N	\N
97895	SPECIFIC_DAY	2	8	2010-02-22	2249	97182	\N	\N
97889	SPECIFIC_DAY	2	8	2010-03-11	2249	97182	\N	\N
97902	SPECIFIC_DAY	2	8	2010-02-16	2249	97182	\N	\N
97894	SPECIFIC_DAY	2	8	2010-02-25	2249	97182	\N	\N
97896	SPECIFIC_DAY	2	8	2010-04-14	2249	97182	\N	\N
97893	SPECIFIC_DAY	2	6	2010-03-12	2249	97182	\N	\N
97913	SPECIFIC_DAY	2	0	2010-02-21	2249	97182	\N	\N
97899	SPECIFIC_DAY	2	0	2010-02-28	2249	97182	\N	\N
97904	SPECIFIC_DAY	2	0	2010-02-06	2249	97182	\N	\N
97897	SPECIFIC_DAY	2	0	2010-04-11	2249	97182	\N	\N
97885	SPECIFIC_DAY	2	0	2010-04-04	2249	97182	\N	\N
97912	SPECIFIC_DAY	2	8	2010-03-17	2249	97182	\N	\N
97888	SPECIFIC_DAY	2	0	2010-02-11	2249	97182	\N	\N
97886	SPECIFIC_DAY	2	0	2010-03-28	2249	97182	\N	\N
97901	SPECIFIC_DAY	2	8	2010-03-04	2249	97182	\N	\N
97883	SPECIFIC_DAY	2	0	2010-02-05	2249	97182	\N	\N
97911	SPECIFIC_DAY	2	8	2010-03-29	2249	97182	\N	\N
97903	SPECIFIC_DAY	2	0	2010-03-13	2249	97182	\N	\N
97892	SPECIFIC_DAY	2	8	2010-03-18	2249	97182	\N	\N
97907	SPECIFIC_DAY	2	8	2010-02-24	2249	97182	\N	\N
97905	SPECIFIC_DAY	2	0	2010-03-14	2249	97182	\N	\N
97887	SPECIFIC_DAY	2	8	2010-03-30	2249	97182	\N	\N
97880	SPECIFIC_DAY	2	0	2010-03-21	2249	97182	\N	\N
97884	SPECIFIC_DAY	2	8	2010-03-10	2249	97182	\N	\N
97910	SPECIFIC_DAY	2	0	2010-02-08	2249	97182	\N	\N
97881	SPECIFIC_DAY	2	8	2010-02-18	2249	97182	\N	\N
97891	SPECIFIC_DAY	2	0	2010-02-14	2249	97182	\N	\N
97898	SPECIFIC_DAY	2	0	2010-02-10	2249	97182	\N	\N
97890	SPECIFIC_DAY	2	8	2010-03-23	2249	97182	\N	\N
97908	SPECIFIC_DAY	2	8	2010-04-12	2249	97182	\N	\N
97919	SPECIFIC_DAY	2	0	2010-02-09	2251	97183	\N	\N
97915	SPECIFIC_DAY	2	0	2010-02-08	2251	97183	\N	\N
97918	SPECIFIC_DAY	2	0	2010-02-10	2251	97183	\N	\N
95684	SPECIFIC_DAY	3	0	2010-02-13	2231	93093	\N	\N
95694	SPECIFIC_DAY	3	8	2010-03-24	2231	93093	\N	\N
95663	SPECIFIC_DAY	3	0	2010-02-28	2231	93093	\N	\N
95667	SPECIFIC_DAY	3	8	2010-02-17	2231	93093	\N	\N
95671	SPECIFIC_DAY	3	8	2010-02-08	2231	93093	\N	\N
95655	SPECIFIC_DAY	3	8	2010-02-23	2231	93093	\N	\N
95689	SPECIFIC_DAY	3	8	2010-03-03	2231	93093	\N	\N
95675	SPECIFIC_DAY	3	0	2010-03-06	2231	93093	\N	\N
95692	SPECIFIC_DAY	3	0	2010-03-27	2231	93093	\N	\N
95697	SPECIFIC_DAY	3	8	2010-02-04	2231	93093	\N	\N
95672	SPECIFIC_DAY	3	8	2010-02-10	2231	93093	\N	\N
95642	SPECIFIC_DAY	3	0	2010-04-02	2231	93093	\N	\N
95645	SPECIFIC_DAY	3	8	2010-03-10	2231	93093	\N	\N
95693	SPECIFIC_DAY	3	8	2010-03-29	2231	93093	\N	\N
95679	SPECIFIC_DAY	3	6	2010-02-19	2231	93093	\N	\N
95696	SPECIFIC_DAY	3	8	2010-03-18	2231	93093	\N	\N
95673	SPECIFIC_DAY	3	6	2010-03-05	2231	93093	\N	\N
95659	SPECIFIC_DAY	3	8	2010-03-30	2231	93093	\N	\N
95648	SPECIFIC_DAY	3	8	2010-02-15	2231	93093	\N	\N
95640	SPECIFIC_DAY	3	8	2010-03-22	2231	93093	\N	\N
95674	SPECIFIC_DAY	3	0	2010-03-14	2231	93093	\N	\N
95647	SPECIFIC_DAY	3	0	2010-02-20	2231	93093	\N	\N
95656	SPECIFIC_DAY	3	0	2010-02-27	2231	93093	\N	\N
95657	SPECIFIC_DAY	3	6	2010-02-05	2231	93093	\N	\N
95646	SPECIFIC_DAY	3	8	2010-03-04	2231	93093	\N	\N
95658	SPECIFIC_DAY	3	0	2010-04-04	2231	93093	\N	\N
95638	SPECIFIC_DAY	3	8	2010-02-25	2231	93093	\N	\N
97787	SPECIFIC_DAY	2	8	2010-03-10	2247	97181	\N	\N
97812	SPECIFIC_DAY	2	8	2010-03-03	2247	97181	\N	\N
97823	SPECIFIC_DAY	2	0	2010-04-04	2247	97181	\N	\N
97802	SPECIFIC_DAY	2	8	2010-02-08	2247	97181	\N	\N
97788	SPECIFIC_DAY	2	8	2010-02-11	2247	97181	\N	\N
97817	SPECIFIC_DAY	2	0	2010-03-13	2247	97181	\N	\N
97820	SPECIFIC_DAY	2	0	2010-04-01	2247	97181	\N	\N
97789	SPECIFIC_DAY	2	6	2010-02-19	2247	97181	\N	\N
97808	SPECIFIC_DAY	2	8	2010-03-15	2247	97181	\N	\N
97844	SPECIFIC_DAY	2	8	2010-03-25	2249	97182	\N	\N
97856	SPECIFIC_DAY	2	0	2010-02-20	2249	97182	\N	\N
97850	SPECIFIC_DAY	2	8	2010-02-17	2249	97182	\N	\N
97859	SPECIFIC_DAY	2	8	2010-03-03	2249	97182	\N	\N
97860	SPECIFIC_DAY	2	0	2010-02-07	2249	97182	\N	\N
97868	SPECIFIC_DAY	2	0	2010-03-08	2249	97182	\N	\N
97866	SPECIFIC_DAY	2	0	2010-03-19	2249	97182	\N	\N
97854	SPECIFIC_DAY	2	8	2010-03-22	2249	97182	\N	\N
97871	SPECIFIC_DAY	2	0	2010-04-10	2249	97182	\N	\N
97853	SPECIFIC_DAY	2	8	2010-03-01	2249	97182	\N	\N
97865	SPECIFIC_DAY	2	0	2010-03-09	2249	97182	\N	\N
97873	SPECIFIC_DAY	2	0	2010-03-06	2249	97182	\N	\N
97851	SPECIFIC_DAY	2	0	2010-03-20	2249	97182	\N	\N
97852	SPECIFIC_DAY	2	8	2010-04-08	2249	97182	\N	\N
97867	SPECIFIC_DAY	2	8	2010-02-23	2249	97182	\N	\N
97863	SPECIFIC_DAY	2	6	2010-04-09	2249	97182	\N	\N
97845	SPECIFIC_DAY	2	0	2010-04-01	2249	97182	\N	\N
97862	SPECIFIC_DAY	2	0	2010-04-03	2249	97182	\N	\N
97875	SPECIFIC_DAY	2	0	2010-02-13	2249	97182	\N	\N
97876	SPECIFIC_DAY	2	0	2010-04-02	2249	97182	\N	\N
97861	SPECIFIC_DAY	2	8	2010-02-15	2249	97182	\N	\N
97848	SPECIFIC_DAY	2	8	2010-04-07	2249	97182	\N	\N
98821	SPECIFIC_DAY	1	8	2010-05-04	2225	93092	\N	\N
98822	SPECIFIC_DAY	1	8	2010-04-06	2225	93092	\N	\N
98823	SPECIFIC_DAY	1	0	2010-05-23	2225	93092	\N	\N
98824	SPECIFIC_DAY	1	8	2010-04-05	2225	93092	\N	\N
98825	SPECIFIC_DAY	1	0	2010-05-29	2225	93092	\N	\N
98826	SPECIFIC_DAY	1	6	2010-04-09	2225	93092	\N	\N
98827	SPECIFIC_DAY	1	8	2010-04-08	2225	93092	\N	\N
98828	SPECIFIC_DAY	1	8	2010-05-05	2225	93092	\N	\N
98829	SPECIFIC_DAY	1	4	2010-05-31	2225	93092	\N	\N
98830	SPECIFIC_DAY	1	6	2010-05-21	2225	93092	\N	\N
98831	SPECIFIC_DAY	1	0	2010-04-11	2225	93092	\N	\N
98832	SPECIFIC_DAY	1	6	2010-05-07	2225	93092	\N	\N
98833	SPECIFIC_DAY	1	8	2010-04-15	2225	93092	\N	\N
98834	SPECIFIC_DAY	1	0	2010-05-01	2225	93092	\N	\N
98835	SPECIFIC_DAY	1	8	2010-04-27	2225	93092	\N	\N
98836	SPECIFIC_DAY	1	0	2010-05-02	2225	93092	\N	\N
98837	SPECIFIC_DAY	1	0	2010-04-01	2225	93092	\N	\N
98838	SPECIFIC_DAY	1	6	2010-04-23	2225	93092	\N	\N
98839	SPECIFIC_DAY	1	8	2010-05-24	2225	93092	\N	\N
98840	SPECIFIC_DAY	1	8	2010-05-26	2225	93092	\N	\N
98841	SPECIFIC_DAY	1	8	2010-05-19	2225	93092	\N	\N
98842	SPECIFIC_DAY	1	8	2010-05-13	2225	93092	\N	\N
98843	SPECIFIC_DAY	1	0	2010-05-17	2225	93092	\N	\N
98844	SPECIFIC_DAY	1	8	2010-04-28	2225	93092	\N	\N
98845	SPECIFIC_DAY	1	6	2010-04-30	2225	93092	\N	\N
98846	SPECIFIC_DAY	1	0	2010-05-15	2225	93092	\N	\N
98847	SPECIFIC_DAY	1	0	2010-05-08	2225	93092	\N	\N
98848	SPECIFIC_DAY	1	8	2010-04-29	2225	93092	\N	\N
98849	SPECIFIC_DAY	1	6	2010-05-14	2225	93092	\N	\N
98850	SPECIFIC_DAY	1	6	2010-04-16	2225	93092	\N	\N
98851	SPECIFIC_DAY	1	0	2010-04-18	2225	93092	\N	\N
98852	SPECIFIC_DAY	1	0	2010-04-17	2225	93092	\N	\N
98853	SPECIFIC_DAY	1	8	2010-04-13	2225	93092	\N	\N
98854	SPECIFIC_DAY	1	8	2010-04-26	2225	93092	\N	\N
98855	SPECIFIC_DAY	1	0	2010-05-30	2225	93092	\N	\N
98856	SPECIFIC_DAY	1	0	2010-04-03	2225	93092	\N	\N
98857	SPECIFIC_DAY	1	8	2010-04-22	2225	93092	\N	\N
98858	SPECIFIC_DAY	1	8	2010-04-20	2225	93092	\N	\N
98870	SPECIFIC_DAY	1	8	2010-05-03	2225	93092	\N	\N
98871	SPECIFIC_DAY	1	0	2010-05-22	2225	93092	\N	\N
98872	SPECIFIC_DAY	1	8	2010-05-18	2225	93092	\N	\N
98873	SPECIFIC_DAY	1	8	2010-05-06	2225	93092	\N	\N
98874	SPECIFIC_DAY	1	8	2010-05-25	2225	93092	\N	\N
98875	SPECIFIC_DAY	1	0	2010-05-09	2225	93092	\N	\N
98876	SPECIFIC_DAY	1	6	2010-05-28	2225	93092	\N	\N
98877	SPECIFIC_DAY	1	8	2010-05-20	2225	93092	\N	\N
98878	SPECIFIC_DAY	1	0	2010-04-04	2225	93092	\N	\N
98879	SPECIFIC_DAY	1	0	2010-05-16	2225	93092	\N	\N
98880	SPECIFIC_DAY	1	8	2010-04-07	2225	93092	\N	\N
98881	SPECIFIC_DAY	1	8	2010-04-21	2225	93092	\N	\N
98859	SPECIFIC_DAY	1	8	2010-05-27	2225	93092	\N	\N
98860	SPECIFIC_DAY	1	8	2010-05-10	2225	93092	\N	\N
98861	SPECIFIC_DAY	1	8	2010-04-14	2225	93092	\N	\N
98862	SPECIFIC_DAY	1	8	2010-04-12	2225	93092	\N	\N
98863	SPECIFIC_DAY	1	8	2010-05-12	2225	93092	\N	\N
98864	SPECIFIC_DAY	1	0	2010-04-10	2225	93092	\N	\N
98865	SPECIFIC_DAY	1	0	2010-04-24	2225	93092	\N	\N
98866	SPECIFIC_DAY	1	0	2010-04-25	2225	93092	\N	\N
98867	SPECIFIC_DAY	1	0	2010-04-02	2225	93092	\N	\N
98868	SPECIFIC_DAY	1	8	2010-05-11	2225	93092	\N	\N
98869	SPECIFIC_DAY	1	8	2010-04-19	2225	93092	\N	\N
95682	SPECIFIC_DAY	3	8	2010-02-22	2231	93093	\N	\N
95665	SPECIFIC_DAY	3	0	2010-03-07	2231	93093	\N	\N
95680	SPECIFIC_DAY	3	6	2010-02-26	2231	93093	\N	\N
95641	SPECIFIC_DAY	3	8	2010-03-11	2231	93093	\N	\N
95651	SPECIFIC_DAY	3	0	2010-04-03	2231	93093	\N	\N
95644	SPECIFIC_DAY	3	8	2010-03-25	2231	93093	\N	\N
95666	SPECIFIC_DAY	3	8	2010-03-08	2231	93093	\N	\N
95681	SPECIFIC_DAY	3	0	2010-03-19	2231	93093	\N	\N
95683	SPECIFIC_DAY	3	8	2010-03-17	2231	93093	\N	\N
95660	SPECIFIC_DAY	3	0	2010-02-21	2231	93093	\N	\N
95653	SPECIFIC_DAY	3	6	2010-02-12	2231	93093	\N	\N
95677	SPECIFIC_DAY	3	0	2010-02-14	2231	93093	\N	\N
95691	SPECIFIC_DAY	3	0	2010-03-21	2231	93093	\N	\N
95688	SPECIFIC_DAY	3	8	2010-03-09	2231	93093	\N	\N
95662	SPECIFIC_DAY	3	0	2010-03-13	2231	93093	\N	\N
95664	SPECIFIC_DAY	3	8	2010-03-16	2231	93093	\N	\N
95687	SPECIFIC_DAY	3	8	2010-03-15	2231	93093	\N	\N
95654	SPECIFIC_DAY	3	8	2010-02-18	2231	93093	\N	\N
95649	SPECIFIC_DAY	3	0	2010-04-01	2231	93093	\N	\N
95650	SPECIFIC_DAY	3	8	2010-03-23	2231	93093	\N	\N
95690	SPECIFIC_DAY	3	8	2010-02-24	2231	93093	\N	\N
95639	SPECIFIC_DAY	3	8	2010-02-09	2231	93093	\N	\N
95643	SPECIFIC_DAY	3	8	2010-03-01	2231	93093	\N	\N
95670	SPECIFIC_DAY	3	2	2010-04-05	2231	93093	\N	\N
95652	SPECIFIC_DAY	3	8	2010-02-11	2231	93093	\N	\N
95676	SPECIFIC_DAY	3	8	2010-03-31	2231	93093	\N	\N
95695	SPECIFIC_DAY	3	0	2010-03-20	2231	93093	\N	\N
95668	SPECIFIC_DAY	3	0	2010-02-07	2231	93093	\N	\N
95661	SPECIFIC_DAY	3	0	2010-03-28	2231	93093	\N	\N
95698	SPECIFIC_DAY	3	8	2010-03-02	2231	93093	\N	\N
95669	SPECIFIC_DAY	3	6	2010-03-26	2231	93093	\N	\N
95685	SPECIFIC_DAY	3	6	2010-03-12	2231	93093	\N	\N
95686	SPECIFIC_DAY	3	0	2010-02-06	2231	93093	\N	\N
95678	SPECIFIC_DAY	3	8	2010-02-16	2231	93093	\N	\N
95760	SPECIFIC_DAY	3	1	2010-02-04	2245	93095	\N	\N
95761	SPECIFIC_DAY	3	1	2010-02-04	2237	93096	\N	\N
95809	SPECIFIC_DAY	3	8	2010-03-16	2243	93097	\N	\N
95807	SPECIFIC_DAY	3	0	2010-03-14	2243	93097	\N	\N
95762	SPECIFIC_DAY	3	0	2010-03-13	2243	93097	\N	\N
95767	SPECIFIC_DAY	3	8	2010-03-22	2243	93097	\N	\N
95815	SPECIFIC_DAY	3	8	2010-02-11	2243	93097	\N	\N
95764	SPECIFIC_DAY	3	0	2010-04-04	2243	93097	\N	\N
95804	SPECIFIC_DAY	3	6	2010-02-12	2243	93097	\N	\N
95817	SPECIFIC_DAY	3	0	2010-03-07	2243	93097	\N	\N
95765	SPECIFIC_DAY	3	8	2010-02-10	2243	93097	\N	\N
95820	SPECIFIC_DAY	3	6	2010-03-26	2243	93097	\N	\N
95816	SPECIFIC_DAY	3	6	2010-02-05	2243	93097	\N	\N
95768	SPECIFIC_DAY	3	8	2010-03-03	2243	93097	\N	\N
95810	SPECIFIC_DAY	3	8	2010-03-04	2243	93097	\N	\N
95822	SPECIFIC_DAY	3	8	2010-03-11	2243	93097	\N	\N
95808	SPECIFIC_DAY	3	0	2010-03-27	2243	93097	\N	\N
95819	SPECIFIC_DAY	3	8	2010-03-15	2243	93097	\N	\N
95763	SPECIFIC_DAY	3	8	2010-03-18	2243	93097	\N	\N
95811	SPECIFIC_DAY	3	8	2010-03-25	2243	93097	\N	\N
95766	SPECIFIC_DAY	3	8	2010-03-01	2243	93097	\N	\N
95813	SPECIFIC_DAY	3	0	2010-02-07	2243	93097	\N	\N
95818	SPECIFIC_DAY	3	0	2010-02-20	2243	93097	\N	\N
95805	SPECIFIC_DAY	3	8	2010-02-23	2243	93097	\N	\N
95806	SPECIFIC_DAY	3	0	2010-04-01	2243	93097	\N	\N
95803	SPECIFIC_DAY	3	6	2010-02-26	2243	93097	\N	\N
95814	SPECIFIC_DAY	3	8	2010-02-24	2243	93097	\N	\N
95821	SPECIFIC_DAY	3	6	2010-03-12	2243	93097	\N	\N
95812	SPECIFIC_DAY	3	8	2010-02-25	2243	93097	\N	\N
97833	SPECIFIC_DAY	2	0	2010-03-19	2247	97181	\N	\N
97797	SPECIFIC_DAY	2	8	2010-02-10	2247	97181	\N	\N
97831	SPECIFIC_DAY	2	0	2010-04-03	2247	97181	\N	\N
97841	SPECIFIC_DAY	2	8	2010-03-17	2247	97181	\N	\N
97826	SPECIFIC_DAY	2	0	2010-03-27	2247	97181	\N	\N
97813	SPECIFIC_DAY	2	8	2010-03-09	2247	97181	\N	\N
97839	SPECIFIC_DAY	2	0	2010-02-14	2247	97181	\N	\N
97810	SPECIFIC_DAY	2	8	2010-03-08	2247	97181	\N	\N
97784	SPECIFIC_DAY	2	8	2010-02-18	2247	97181	\N	\N
97795	SPECIFIC_DAY	2	8	2010-02-23	2247	97181	\N	\N
97806	SPECIFIC_DAY	2	0	2010-03-06	2247	97181	\N	\N
97790	SPECIFIC_DAY	2	0	2010-02-07	2247	97181	\N	\N
97842	SPECIFIC_DAY	2	8	2010-03-31	2247	97181	\N	\N
97791	SPECIFIC_DAY	2	8	2010-03-11	2247	97181	\N	\N
97837	SPECIFIC_DAY	2	8	2010-03-22	2247	97181	\N	\N
97836	SPECIFIC_DAY	2	8	2010-02-04	2247	97181	\N	\N
97783	SPECIFIC_DAY	2	8	2010-02-25	2247	97181	\N	\N
97834	SPECIFIC_DAY	2	8	2010-03-01	2247	97181	\N	\N
97785	SPECIFIC_DAY	2	6	2010-03-26	2247	97181	\N	\N
97809	SPECIFIC_DAY	2	2	2010-04-05	2247	97181	\N	\N
97805	SPECIFIC_DAY	2	8	2010-03-23	2247	97181	\N	\N
97827	SPECIFIC_DAY	2	8	2010-02-17	2247	97181	\N	\N
97835	SPECIFIC_DAY	2	0	2010-02-21	2247	97181	\N	\N
97829	SPECIFIC_DAY	2	8	2010-02-22	2247	97181	\N	\N
97843	SPECIFIC_DAY	2	0	2010-04-02	2247	97181	\N	\N
97792	SPECIFIC_DAY	2	6	2010-02-05	2247	97181	\N	\N
97819	SPECIFIC_DAY	2	8	2010-03-24	2247	97181	\N	\N
97828	SPECIFIC_DAY	2	0	2010-02-28	2247	97181	\N	\N
97811	SPECIFIC_DAY	2	8	2010-03-16	2247	97181	\N	\N
97832	SPECIFIC_DAY	2	8	2010-03-25	2247	97181	\N	\N
97803	SPECIFIC_DAY	2	0	2010-03-14	2247	97181	\N	\N
97807	SPECIFIC_DAY	2	0	2010-02-20	2247	97181	\N	\N
97793	SPECIFIC_DAY	2	0	2010-03-28	2247	97181	\N	\N
97838	SPECIFIC_DAY	2	6	2010-03-12	2247	97181	\N	\N
97824	SPECIFIC_DAY	2	8	2010-02-15	2247	97181	\N	\N
97800	SPECIFIC_DAY	2	0	2010-03-07	2247	97181	\N	\N
97786	SPECIFIC_DAY	2	8	2010-03-18	2247	97181	\N	\N
97799	SPECIFIC_DAY	2	8	2010-02-24	2247	97181	\N	\N
97798	SPECIFIC_DAY	2	6	2010-02-26	2247	97181	\N	\N
97804	SPECIFIC_DAY	2	6	2010-02-12	2247	97181	\N	\N
97794	SPECIFIC_DAY	2	0	2010-02-13	2247	97181	\N	\N
97815	SPECIFIC_DAY	2	8	2010-03-02	2247	97181	\N	\N
97830	SPECIFIC_DAY	2	8	2010-03-29	2247	97181	\N	\N
97814	SPECIFIC_DAY	2	6	2010-03-05	2247	97181	\N	\N
97822	SPECIFIC_DAY	2	0	2010-02-27	2247	97181	\N	\N
97840	SPECIFIC_DAY	2	0	2010-03-21	2247	97181	\N	\N
97796	SPECIFIC_DAY	2	0	2010-02-06	2247	97181	\N	\N
97816	SPECIFIC_DAY	2	8	2010-02-16	2247	97181	\N	\N
97801	SPECIFIC_DAY	2	0	2010-03-20	2247	97181	\N	\N
97818	SPECIFIC_DAY	2	8	2010-02-09	2247	97181	\N	\N
97821	SPECIFIC_DAY	2	8	2010-03-04	2247	97181	\N	\N
97825	SPECIFIC_DAY	2	8	2010-03-30	2247	97181	\N	\N
97849	SPECIFIC_DAY	2	2	2010-04-15	2249	97182	\N	\N
97874	SPECIFIC_DAY	2	0	2010-02-04	2249	97182	\N	\N
97857	SPECIFIC_DAY	2	8	2010-04-13	2249	97182	\N	\N
97877	SPECIFIC_DAY	2	6	2010-03-26	2249	97182	\N	\N
97869	SPECIFIC_DAY	2	8	2010-03-31	2249	97182	\N	\N
97855	SPECIFIC_DAY	2	0	2010-03-27	2249	97182	\N	\N
97864	SPECIFIC_DAY	2	8	2010-03-02	2249	97182	\N	\N
97858	SPECIFIC_DAY	2	6	2010-02-19	2249	97182	\N	\N
97870	SPECIFIC_DAY	2	0	2010-02-27	2249	97182	\N	\N
97846	SPECIFIC_DAY	2	6	2010-03-05	2249	97182	\N	\N
97879	SPECIFIC_DAY	2	8	2010-03-15	2249	97182	\N	\N
97872	SPECIFIC_DAY	2	0	2010-02-09	2249	97182	\N	\N
97878	SPECIFIC_DAY	2	8	2010-03-16	2249	97182	\N	\N
97847	SPECIFIC_DAY	2	8	2010-03-24	2249	97182	\N	\N
97917	SPECIFIC_DAY	2	0	2010-02-07	2251	97183	\N	\N
97923	SPECIFIC_DAY	2	0	2010-02-11	2251	97183	\N	\N
97921	SPECIFIC_DAY	2	0	2010-02-04	2251	97183	\N	\N
97920	SPECIFIC_DAY	2	0	2010-02-06	2251	97183	\N	\N
97916	SPECIFIC_DAY	2	1	2010-02-12	2251	97183	\N	\N
97922	SPECIFIC_DAY	2	0	2010-02-05	2251	97183	\N	\N
97924	SPECIFIC_DAY	2	1	2010-02-04	2239	97184	\N	\N
97926	SPECIFIC_DAY	2	0	2010-02-06	2241	97185	\N	\N
97928	SPECIFIC_DAY	2	8	2010-02-04	2241	97185	\N	\N
97929	SPECIFIC_DAY	2	6	2010-02-05	2241	97185	\N	\N
97927	SPECIFIC_DAY	2	6	2010-02-08	2241	97185	\N	\N
97925	SPECIFIC_DAY	2	0	2010-02-07	2241	97185	\N	\N
98943	SPECIFIC_DAY	0	8	2010-03-22	2233	93094	\N	\N
98944	SPECIFIC_DAY	0	6	2010-02-26	2233	93094	\N	\N
98945	SPECIFIC_DAY	0	8	2010-03-24	2233	93094	\N	\N
98946	SPECIFIC_DAY	0	0	2010-04-03	2233	93094	\N	\N
98947	SPECIFIC_DAY	0	0	2010-04-02	2233	93094	\N	\N
98948	SPECIFIC_DAY	0	0	2010-03-28	2233	93094	\N	\N
98949	SPECIFIC_DAY	0	8	2010-03-09	2233	93094	\N	\N
98950	SPECIFIC_DAY	0	0	2010-02-27	2233	93094	\N	\N
98951	SPECIFIC_DAY	0	0	2010-04-01	2233	93094	\N	\N
98952	SPECIFIC_DAY	0	8	2010-03-15	2233	93094	\N	\N
98953	SPECIFIC_DAY	0	8	2010-02-23	2233	93094	\N	\N
98954	SPECIFIC_DAY	0	0	2010-03-14	2233	93094	\N	\N
98955	SPECIFIC_DAY	0	0	2010-03-07	2233	93094	\N	\N
98956	SPECIFIC_DAY	0	0	2010-02-06	2233	93094	\N	\N
98957	SPECIFIC_DAY	0	0	2010-03-06	2233	93094	\N	\N
98958	SPECIFIC_DAY	0	8	2010-03-08	2233	93094	\N	\N
98959	SPECIFIC_DAY	0	2	2010-04-05	2233	93094	\N	\N
98960	SPECIFIC_DAY	0	8	2010-03-30	2233	93094	\N	\N
98961	SPECIFIC_DAY	0	0	2010-02-21	2233	93094	\N	\N
98962	SPECIFIC_DAY	0	8	2010-02-15	2233	93094	\N	\N
98963	SPECIFIC_DAY	0	8	2010-02-18	2233	93094	\N	\N
98964	SPECIFIC_DAY	0	8	2010-03-31	2233	93094	\N	\N
98965	SPECIFIC_DAY	0	8	2010-02-16	2233	93094	\N	\N
98966	SPECIFIC_DAY	0	8	2010-02-25	2233	93094	\N	\N
98967	SPECIFIC_DAY	0	8	2010-02-10	2233	93094	\N	\N
98968	SPECIFIC_DAY	0	8	2010-03-01	2233	93094	\N	\N
98969	SPECIFIC_DAY	0	6	2010-03-12	2233	93094	\N	\N
98970	SPECIFIC_DAY	0	8	2010-03-03	2233	93094	\N	\N
98971	SPECIFIC_DAY	0	8	2010-03-17	2233	93094	\N	\N
98972	SPECIFIC_DAY	0	0	2010-03-19	2233	93094	\N	\N
98973	SPECIFIC_DAY	0	8	2010-03-10	2233	93094	\N	\N
98974	SPECIFIC_DAY	0	0	2010-02-28	2233	93094	\N	\N
98975	SPECIFIC_DAY	0	8	2010-03-23	2233	93094	\N	\N
98976	SPECIFIC_DAY	0	8	2010-03-16	2233	93094	\N	\N
98977	SPECIFIC_DAY	0	8	2010-02-22	2233	93094	\N	\N
98978	SPECIFIC_DAY	0	0	2010-03-20	2233	93094	\N	\N
98979	SPECIFIC_DAY	0	8	2010-02-08	2233	93094	\N	\N
98980	SPECIFIC_DAY	0	0	2010-02-07	2233	93094	\N	\N
98981	SPECIFIC_DAY	0	8	2010-02-04	2233	93094	\N	\N
98982	SPECIFIC_DAY	0	0	2010-02-20	2233	93094	\N	\N
98983	SPECIFIC_DAY	0	6	2010-02-05	2233	93094	\N	\N
98984	SPECIFIC_DAY	0	6	2010-03-26	2233	93094	\N	\N
98985	SPECIFIC_DAY	0	6	2010-02-12	2233	93094	\N	\N
98986	SPECIFIC_DAY	0	6	2010-02-19	2233	93094	\N	\N
98987	SPECIFIC_DAY	0	0	2010-03-27	2233	93094	\N	\N
98988	SPECIFIC_DAY	0	6	2010-03-05	2233	93094	\N	\N
98989	SPECIFIC_DAY	0	8	2010-03-18	2233	93094	\N	\N
98990	SPECIFIC_DAY	0	0	2010-03-13	2233	93094	\N	\N
98991	SPECIFIC_DAY	0	0	2010-04-04	2233	93094	\N	\N
98992	SPECIFIC_DAY	0	8	2010-02-11	2233	93094	\N	\N
98993	SPECIFIC_DAY	0	8	2010-02-17	2233	93094	\N	\N
98994	SPECIFIC_DAY	0	8	2010-03-29	2233	93094	\N	\N
98995	SPECIFIC_DAY	0	0	2010-02-13	2233	93094	\N	\N
98996	SPECIFIC_DAY	0	8	2010-03-04	2233	93094	\N	\N
98997	SPECIFIC_DAY	0	8	2010-03-25	2233	93094	\N	\N
98998	SPECIFIC_DAY	0	0	2010-03-21	2233	93094	\N	\N
98999	SPECIFIC_DAY	0	0	2010-02-14	2233	93094	\N	\N
99000	SPECIFIC_DAY	0	8	2010-03-02	2233	93094	\N	\N
99001	SPECIFIC_DAY	0	8	2010-02-24	2233	93094	\N	\N
99002	SPECIFIC_DAY	0	8	2010-02-09	2233	93094	\N	\N
99003	SPECIFIC_DAY	0	8	2010-03-11	2233	93094	\N	\N
243558	GENERIC_DAY	0	8	2011-07-20	2225	\N	99081	\N
243559	GENERIC_DAY	0	6	2010-12-24	2225	\N	99081	\N
243560	GENERIC_DAY	0	8	2011-02-09	2225	\N	99081	\N
243561	GENERIC_DAY	0	0	2010-11-07	2225	\N	99081	\N
243562	GENERIC_DAY	0	8	2010-05-27	2225	\N	99081	\N
243563	GENERIC_DAY	0	0	2010-11-20	2225	\N	99081	\N
243564	GENERIC_DAY	0	0	2010-12-12	2225	\N	99081	\N
243565	GENERIC_DAY	0	6	2010-08-27	2225	\N	99081	\N
243566	GENERIC_DAY	0	8	2011-02-07	2225	\N	99081	\N
243567	GENERIC_DAY	0	8	2011-01-19	2225	\N	99081	\N
243568	GENERIC_DAY	0	0	2011-06-25	2225	\N	99081	\N
243569	GENERIC_DAY	0	8	2011-02-17	2225	\N	99081	\N
243570	GENERIC_DAY	0	8	2011-04-13	2225	\N	99081	\N
243571	GENERIC_DAY	0	0	2010-04-24	2225	\N	99081	\N
243572	GENERIC_DAY	0	8	2010-11-15	2225	\N	99081	\N
243573	GENERIC_DAY	0	6	2010-10-01	2225	\N	99081	\N
243574	GENERIC_DAY	0	8	2010-07-27	2225	\N	99081	\N
243575	GENERIC_DAY	0	6	2010-04-30	2225	\N	99081	\N
243576	GENERIC_DAY	0	0	2010-08-22	2225	\N	99081	\N
243577	GENERIC_DAY	0	8	2011-04-14	2225	\N	99081	\N
243578	GENERIC_DAY	0	0	2010-10-10	2225	\N	99081	\N
243579	GENERIC_DAY	0	0	2011-06-04	2225	\N	99081	\N
243580	GENERIC_DAY	0	8	2011-04-25	2225	\N	99081	\N
243581	GENERIC_DAY	0	8	2010-08-31	2225	\N	99081	\N
243582	GENERIC_DAY	0	8	2011-07-25	2225	\N	99081	\N
243583	GENERIC_DAY	0	8	2010-06-24	2225	\N	99081	\N
243584	GENERIC_DAY	0	8	2011-03-23	2225	\N	99081	\N
243585	GENERIC_DAY	0	8	2011-08-25	2225	\N	99081	\N
243586	GENERIC_DAY	0	8	2010-08-18	2225	\N	99081	\N
33493	SPECIFIC_DAY	6	5	2010-02-08	2243	3687	\N	\N
33495	SPECIFIC_DAY	6	0	2010-02-07	2243	3687	\N	\N
33497	SPECIFIC_DAY	6	5	2010-02-09	2243	3687	\N	\N
33496	SPECIFIC_DAY	6	1	2010-02-10	2243	3687	\N	\N
33498	SPECIFIC_DAY	6	4	2010-02-05	2243	3687	\N	\N
33494	SPECIFIC_DAY	6	0	2010-02-06	2243	3687	\N	\N
36542	GENERIC_DAY	0	2	2010-02-14	2235	\N	3692	\N
36543	GENERIC_DAY	0	6	2010-02-11	2235	\N	3692	\N
36544	GENERIC_DAY	0	2	2010-02-13	2235	\N	3692	\N
36545	GENERIC_DAY	0	2	2010-02-14	2239	\N	3692	\N
36546	GENERIC_DAY	0	5	2010-02-12	2235	\N	3692	\N
36547	GENERIC_DAY	0	5	2010-02-12	2239	\N	3692	\N
36548	GENERIC_DAY	0	2	2010-02-13	2239	\N	3692	\N
36549	GENERIC_DAY	0	6	2010-02-11	2239	\N	3692	\N
36550	GENERIC_DAY	0	27	2010-02-16	2235	\N	3689	\N
36551	GENERIC_DAY	0	3	2010-03-05	2235	\N	3689	\N
36552	GENERIC_DAY	0	26	2010-02-12	2235	\N	3689	\N
36553	GENERIC_DAY	0	4	2010-04-01	2239	\N	3689	\N
36554	GENERIC_DAY	0	4	2010-03-09	2235	\N	3689	\N
36555	GENERIC_DAY	0	4	2010-03-01	2235	\N	3689	\N
36556	GENERIC_DAY	0	4	2010-03-08	2239	\N	3689	\N
36557	GENERIC_DAY	0	23	2010-02-13	2235	\N	3689	\N
36558	GENERIC_DAY	0	4	2010-02-25	2239	\N	3689	\N
36559	GENERIC_DAY	0	0	2010-02-28	2235	\N	3689	\N
36560	GENERIC_DAY	0	0	2010-03-11	2235	\N	3689	\N
36561	GENERIC_DAY	0	4	2010-02-22	2239	\N	3689	\N
36562	GENERIC_DAY	0	3	2010-02-19	2235	\N	3689	\N
36563	GENERIC_DAY	0	0	2010-02-27	2239	\N	3689	\N
36564	GENERIC_DAY	0	0	2010-03-10	2235	\N	3689	\N
36565	GENERIC_DAY	0	4	2010-04-08	2235	\N	3689	\N
36566	GENERIC_DAY	0	4	2010-03-04	2235	\N	3689	\N
36567	GENERIC_DAY	0	0	2010-02-27	2235	\N	3689	\N
36568	GENERIC_DAY	0	4	2010-03-04	2239	\N	3689	\N
36569	GENERIC_DAY	0	0	2010-03-06	2239	\N	3689	\N
36570	GENERIC_DAY	0	4	2010-03-23	2235	\N	3689	\N
36571	GENERIC_DAY	0	3	2010-03-26	2239	\N	3689	\N
36572	GENERIC_DAY	0	0	2010-04-03	2235	\N	3689	\N
36573	GENERIC_DAY	0	4	2010-03-18	2235	\N	3689	\N
36574	GENERIC_DAY	0	0	2010-02-28	2239	\N	3689	\N
36575	GENERIC_DAY	0	3	2010-02-26	2239	\N	3689	\N
36576	GENERIC_DAY	0	4	2010-03-09	2239	\N	3689	\N
36577	GENERIC_DAY	0	0	2010-04-03	2239	\N	3689	\N
36578	GENERIC_DAY	0	3	2010-03-12	2235	\N	3689	\N
36579	GENERIC_DAY	0	4	2010-03-30	2235	\N	3689	\N
36580	GENERIC_DAY	0	27	2010-02-11	2235	\N	3689	\N
36581	GENERIC_DAY	0	4	2010-03-03	2239	\N	3689	\N
36582	GENERIC_DAY	0	0	2010-03-21	2235	\N	3689	\N
36583	GENERIC_DAY	0	4	2010-02-24	2239	\N	3689	\N
36584	GENERIC_DAY	0	4	2010-04-05	2239	\N	3689	\N
36585	GENERIC_DAY	0	4	2010-03-23	2239	\N	3689	\N
36586	GENERIC_DAY	0	0	2010-03-20	2239	\N	3689	\N
36587	GENERIC_DAY	0	2	2010-04-09	2235	\N	3689	\N
36588	GENERIC_DAY	0	3	2010-03-12	2239	\N	3689	\N
36589	GENERIC_DAY	0	0	2010-03-13	2235	\N	3689	\N
36590	GENERIC_DAY	0	4	2010-03-08	2235	\N	3689	\N
36591	GENERIC_DAY	0	23	2010-02-14	2235	\N	3689	\N
36592	GENERIC_DAY	0	4	2010-03-17	2235	\N	3689	\N
36593	GENERIC_DAY	0	26	2010-02-15	2239	\N	3689	\N
36594	GENERIC_DAY	0	4	2010-03-01	2239	\N	3689	\N
36595	GENERIC_DAY	0	26	2010-02-11	2239	\N	3689	\N
36596	GENERIC_DAY	0	0	2010-03-27	2239	\N	3689	\N
36597	GENERIC_DAY	0	26	2010-02-16	2239	\N	3689	\N
36598	GENERIC_DAY	0	4	2010-03-15	2235	\N	3689	\N
36599	GENERIC_DAY	0	0	2010-04-04	2235	\N	3689	\N
36600	GENERIC_DAY	0	3	2010-02-19	2239	\N	3689	\N
36601	GENERIC_DAY	0	4	2010-03-29	2235	\N	3689	\N
36602	GENERIC_DAY	0	0	2010-03-11	2239	\N	3689	\N
36603	GENERIC_DAY	0	4	2010-02-17	2235	\N	3689	\N
36604	GENERIC_DAY	0	4	2010-02-18	2235	\N	3689	\N
36605	GENERIC_DAY	0	2	2010-04-09	2239	\N	3689	\N
36606	GENERIC_DAY	0	4	2010-03-18	2239	\N	3689	\N
36607	GENERIC_DAY	0	3	2010-04-02	2235	\N	3689	\N
36608	GENERIC_DAY	0	0	2010-03-07	2239	\N	3689	\N
36609	GENERIC_DAY	0	4	2010-03-22	2235	\N	3689	\N
36610	GENERIC_DAY	0	4	2010-02-17	2239	\N	3689	\N
36611	GENERIC_DAY	0	0	2010-02-21	2235	\N	3689	\N
36612	GENERIC_DAY	0	4	2010-03-22	2239	\N	3689	\N
36613	GENERIC_DAY	0	4	2010-02-24	2235	\N	3689	\N
36614	GENERIC_DAY	0	4	2010-04-07	2239	\N	3689	\N
36615	GENERIC_DAY	0	0	2010-03-21	2239	\N	3689	\N
36616	GENERIC_DAY	0	3	2010-03-19	2235	\N	3689	\N
36617	GENERIC_DAY	0	4	2010-04-06	2235	\N	3689	\N
36618	GENERIC_DAY	0	4	2010-03-25	2239	\N	3689	\N
36619	GENERIC_DAY	0	4	2010-04-07	2235	\N	3689	\N
36620	GENERIC_DAY	0	3	2010-03-19	2239	\N	3689	\N
36621	GENERIC_DAY	0	0	2010-03-14	2235	\N	3689	\N
36622	GENERIC_DAY	0	4	2010-03-17	2239	\N	3689	\N
36623	GENERIC_DAY	0	0	2010-02-20	2239	\N	3689	\N
36624	GENERIC_DAY	0	3	2010-03-26	2235	\N	3689	\N
36625	GENERIC_DAY	0	22	2010-02-13	2239	\N	3689	\N
36626	GENERIC_DAY	0	4	2010-03-31	2235	\N	3689	\N
36627	GENERIC_DAY	0	4	2010-03-31	2239	\N	3689	\N
36628	GENERIC_DAY	0	4	2010-04-01	2235	\N	3689	\N
36629	GENERIC_DAY	0	3	2010-04-02	2239	\N	3689	\N
36630	GENERIC_DAY	0	4	2010-03-24	2239	\N	3689	\N
36631	GENERIC_DAY	0	4	2010-03-30	2239	\N	3689	\N
36632	GENERIC_DAY	0	27	2010-02-15	2235	\N	3689	\N
36633	GENERIC_DAY	0	4	2010-03-02	2235	\N	3689	\N
36634	GENERIC_DAY	0	4	2010-04-06	2239	\N	3689	\N
36635	GENERIC_DAY	0	0	2010-03-07	2235	\N	3689	\N
36636	GENERIC_DAY	0	4	2010-03-16	2239	\N	3689	\N
36637	GENERIC_DAY	0	4	2010-04-05	2235	\N	3689	\N
36638	GENERIC_DAY	0	0	2010-02-20	2235	\N	3689	\N
36639	GENERIC_DAY	0	4	2010-03-03	2235	\N	3689	\N
36640	GENERIC_DAY	0	4	2010-03-29	2239	\N	3689	\N
36641	GENERIC_DAY	0	4	2010-03-24	2235	\N	3689	\N
36642	GENERIC_DAY	0	0	2010-03-27	2235	\N	3689	\N
36643	GENERIC_DAY	0	22	2010-02-14	2239	\N	3689	\N
36644	GENERIC_DAY	0	0	2010-03-20	2235	\N	3689	\N
36645	GENERIC_DAY	0	3	2010-03-05	2239	\N	3689	\N
36646	GENERIC_DAY	0	0	2010-02-21	2239	\N	3689	\N
36647	GENERIC_DAY	0	4	2010-02-22	2235	\N	3689	\N
36648	GENERIC_DAY	0	0	2010-03-28	2239	\N	3689	\N
36649	GENERIC_DAY	0	4	2010-03-25	2235	\N	3689	\N
36650	GENERIC_DAY	0	3	2010-02-26	2235	\N	3689	\N
36651	GENERIC_DAY	0	4	2010-03-15	2239	\N	3689	\N
36652	GENERIC_DAY	0	0	2010-03-13	2239	\N	3689	\N
36653	GENERIC_DAY	0	0	2010-03-28	2235	\N	3689	\N
36654	GENERIC_DAY	0	25	2010-02-12	2239	\N	3689	\N
36655	GENERIC_DAY	0	0	2010-03-14	2239	\N	3689	\N
36656	GENERIC_DAY	0	4	2010-03-02	2239	\N	3689	\N
36657	GENERIC_DAY	0	0	2010-04-04	2239	\N	3689	\N
36658	GENERIC_DAY	0	4	2010-04-08	2239	\N	3689	\N
36659	GENERIC_DAY	0	4	2010-02-23	2235	\N	3689	\N
36660	GENERIC_DAY	0	4	2010-02-18	2239	\N	3689	\N
36661	GENERIC_DAY	0	4	2010-03-16	2235	\N	3689	\N
36662	GENERIC_DAY	0	0	2010-03-06	2235	\N	3689	\N
36663	GENERIC_DAY	0	4	2010-02-25	2235	\N	3689	\N
36664	GENERIC_DAY	0	0	2010-03-10	2239	\N	3689	\N
36665	GENERIC_DAY	0	4	2010-02-23	2239	\N	3689	\N
36666	GENERIC_DAY	0	3	2010-02-12	2235	\N	3694	\N
36667	GENERIC_DAY	0	4	2010-02-11	2239	\N	3694	\N
36668	GENERIC_DAY	0	0	2010-02-14	2239	\N	3694	\N
36669	GENERIC_DAY	0	0	2010-02-13	2239	\N	3694	\N
36670	GENERIC_DAY	0	4	2010-02-15	2235	\N	3694	\N
36671	GENERIC_DAY	0	4	2010-02-16	2235	\N	3694	\N
36672	GENERIC_DAY	0	3	2010-02-12	2239	\N	3694	\N
36673	GENERIC_DAY	0	0	2010-02-13	2235	\N	3694	\N
36674	GENERIC_DAY	0	4	2010-02-16	2239	\N	3694	\N
36675	GENERIC_DAY	0	4	2010-02-15	2239	\N	3694	\N
36676	GENERIC_DAY	0	4	2010-02-11	2235	\N	3694	\N
36677	GENERIC_DAY	0	0	2010-02-14	2235	\N	3694	\N
243587	GENERIC_DAY	0	0	2010-07-03	2225	\N	99081	\N
243588	GENERIC_DAY	0	0	2011-03-12	2225	\N	99081	\N
243589	GENERIC_DAY	0	0	2011-06-12	2225	\N	99081	\N
243590	GENERIC_DAY	0	6	2010-11-12	2225	\N	99081	\N
243591	GENERIC_DAY	0	6	2010-07-09	2225	\N	99081	\N
243592	GENERIC_DAY	0	8	2010-10-21	2225	\N	99081	\N
243593	GENERIC_DAY	0	8	2011-08-03	2225	\N	99081	\N
243594	GENERIC_DAY	0	8	2011-09-21	2225	\N	99081	\N
243595	GENERIC_DAY	0	8	2011-05-23	2225	\N	99081	\N
243596	GENERIC_DAY	0	0	2011-05-28	2225	\N	99081	\N
243597	GENERIC_DAY	0	0	2011-04-16	2225	\N	99081	\N
243598	GENERIC_DAY	0	0	2011-05-01	2225	\N	99081	\N
243599	GENERIC_DAY	0	8	2011-08-08	2225	\N	99081	\N
243600	GENERIC_DAY	0	8	2011-01-26	2225	\N	99081	\N
243601	GENERIC_DAY	0	8	2010-06-17	2225	\N	99081	\N
243602	GENERIC_DAY	0	8	2011-06-09	2225	\N	99081	\N
243603	GENERIC_DAY	0	0	2011-03-19	2225	\N	99081	\N
243604	GENERIC_DAY	0	0	2010-03-20	2225	\N	99081	\N
243605	GENERIC_DAY	0	6	2011-09-02	2225	\N	99081	\N
243606	GENERIC_DAY	0	8	2010-06-29	2225	\N	99081	\N
243607	GENERIC_DAY	0	8	2010-04-26	2225	\N	99081	\N
243608	GENERIC_DAY	0	8	2011-09-26	2225	\N	99081	\N
243609	GENERIC_DAY	0	8	2011-05-05	2225	\N	99081	\N
243610	GENERIC_DAY	0	0	2011-07-09	2225	\N	99081	\N
243611	GENERIC_DAY	0	8	2010-06-14	2225	\N	99081	\N
243713	GENERIC_DAY	0	6	2011-07-01	2225	\N	99081	\N
243714	GENERIC_DAY	0	8	2011-05-25	2225	\N	99081	\N
243715	GENERIC_DAY	0	0	2011-01-02	2225	\N	99081	\N
243716	GENERIC_DAY	0	8	2010-08-30	2225	\N	99081	\N
243717	GENERIC_DAY	0	0	2010-08-01	2225	\N	99081	\N
243718	GENERIC_DAY	0	0	2010-11-01	2225	\N	99081	\N
243719	GENERIC_DAY	0	0	2010-06-12	2225	\N	99081	\N
243720	GENERIC_DAY	0	8	2011-04-19	2225	\N	99081	\N
243721	GENERIC_DAY	0	0	2010-12-25	2225	\N	99081	\N
243722	GENERIC_DAY	0	6	2011-07-22	2225	\N	99081	\N
243723	GENERIC_DAY	0	6	2011-05-20	2225	\N	99081	\N
243724	GENERIC_DAY	0	8	2010-08-11	2225	\N	99081	\N
243725	GENERIC_DAY	0	6	2010-09-17	2225	\N	99081	\N
243726	GENERIC_DAY	0	8	2011-03-01	2225	\N	99081	\N
243727	GENERIC_DAY	0	0	2011-09-03	2225	\N	99081	\N
243728	GENERIC_DAY	0	0	2010-10-03	2225	\N	99081	\N
243729	GENERIC_DAY	0	0	2010-10-12	2225	\N	99081	\N
243730	GENERIC_DAY	0	8	2010-11-23	2225	\N	99081	\N
243731	GENERIC_DAY	0	8	2011-01-10	2225	\N	99081	\N
243732	GENERIC_DAY	0	8	2010-12-02	2225	\N	99081	\N
243733	GENERIC_DAY	0	8	2010-11-11	2225	\N	99081	\N
243734	GENERIC_DAY	0	8	2010-10-14	2225	\N	99081	\N
243735	GENERIC_DAY	0	6	2010-08-06	2225	\N	99081	\N
243736	GENERIC_DAY	0	6	2010-04-09	2225	\N	99081	\N
243737	GENERIC_DAY	0	8	2011-01-12	2225	\N	99081	\N
243738	GENERIC_DAY	0	0	2011-08-06	2225	\N	99081	\N
243739	GENERIC_DAY	0	8	2010-12-13	2225	\N	99081	\N
243740	GENERIC_DAY	0	0	2011-04-23	2225	\N	99081	\N
243741	GENERIC_DAY	0	0	2011-07-16	2225	\N	99081	\N
243742	GENERIC_DAY	0	0	2010-05-17	2225	\N	99081	\N
243743	GENERIC_DAY	0	8	2011-06-08	2225	\N	99081	\N
243744	GENERIC_DAY	0	6	2011-09-16	2225	\N	99081	\N
243745	GENERIC_DAY	0	0	2010-05-30	2225	\N	99081	\N
243746	GENERIC_DAY	0	6	2011-04-15	2225	\N	99081	\N
243747	GENERIC_DAY	0	8	2011-02-01	2225	\N	99081	\N
243748	GENERIC_DAY	0	8	2010-04-27	2225	\N	99081	\N
243749	GENERIC_DAY	0	6	2011-04-22	2225	\N	99081	\N
243750	GENERIC_DAY	0	0	2010-04-25	2225	\N	99081	\N
243751	GENERIC_DAY	0	0	2011-01-22	2225	\N	99081	\N
243752	GENERIC_DAY	0	8	2011-08-23	2225	\N	99081	\N
243753	GENERIC_DAY	0	8	2011-03-10	2225	\N	99081	\N
243754	GENERIC_DAY	0	0	2010-06-19	2225	\N	99081	\N
243755	GENERIC_DAY	0	8	2011-07-27	2225	\N	99081	\N
243756	GENERIC_DAY	0	8	2010-09-22	2225	\N	99081	\N
243757	GENERIC_DAY	0	0	2010-11-27	2225	\N	99081	\N
243758	GENERIC_DAY	0	0	2010-07-11	2225	\N	99081	\N
243759	GENERIC_DAY	0	0	2010-09-18	2225	\N	99081	\N
243760	GENERIC_DAY	0	0	2011-07-10	2225	\N	99081	\N
243761	GENERIC_DAY	0	6	2010-03-26	2225	\N	99081	\N
243762	GENERIC_DAY	0	6	2010-08-20	2225	\N	99081	\N
243763	GENERIC_DAY	0	8	2010-04-15	2225	\N	99081	\N
243764	GENERIC_DAY	0	8	2011-09-13	2225	\N	99081	\N
243765	GENERIC_DAY	0	8	2010-10-11	2225	\N	99081	\N
243766	GENERIC_DAY	0	8	2010-09-16	2225	\N	99081	\N
243767	GENERIC_DAY	0	0	2011-02-12	2225	\N	99081	\N
243768	GENERIC_DAY	0	0	2011-05-29	2225	\N	99081	\N
243769	GENERIC_DAY	0	8	2010-03-23	2225	\N	99081	\N
243770	GENERIC_DAY	0	8	2010-03-30	2225	\N	99081	\N
243771	GENERIC_DAY	0	8	2011-09-12	2225	\N	99081	\N
243772	GENERIC_DAY	0	8	2011-03-02	2225	\N	99081	\N
243773	GENERIC_DAY	0	8	2011-06-22	2225	\N	99081	\N
243774	GENERIC_DAY	0	8	2010-06-03	2225	\N	99081	\N
243775	GENERIC_DAY	0	0	2010-11-06	2225	\N	99081	\N
243776	GENERIC_DAY	0	6	2010-05-07	2225	\N	99081	\N
243777	GENERIC_DAY	0	8	2010-11-29	2225	\N	99081	\N
243778	GENERIC_DAY	0	8	2011-09-20	2225	\N	99081	\N
243779	GENERIC_DAY	0	8	2010-05-12	2225	\N	99081	\N
243780	GENERIC_DAY	0	8	2011-02-02	2225	\N	99081	\N
243781	GENERIC_DAY	0	0	2011-03-20	2225	\N	99081	\N
243782	GENERIC_DAY	0	8	2010-05-24	2225	\N	99081	\N
243783	GENERIC_DAY	0	8	2010-09-07	2225	\N	99081	\N
243784	GENERIC_DAY	0	0	2010-06-20	2225	\N	99081	\N
243785	GENERIC_DAY	0	0	2011-08-14	2225	\N	99081	\N
243786	GENERIC_DAY	0	6	2010-07-02	2225	\N	99081	\N
243787	GENERIC_DAY	0	8	2011-01-17	2225	\N	99081	\N
243788	GENERIC_DAY	0	8	2010-05-19	2225	\N	99081	\N
243789	GENERIC_DAY	0	6	2011-03-11	2225	\N	99081	\N
243790	GENERIC_DAY	0	8	2010-07-19	2225	\N	99081	\N
243791	GENERIC_DAY	0	8	2010-07-06	2225	\N	99081	\N
243792	GENERIC_DAY	0	8	2010-07-13	2225	\N	99081	\N
243793	GENERIC_DAY	0	8	2011-04-05	2225	\N	99081	\N
243794	GENERIC_DAY	0	8	2010-03-24	2225	\N	99081	\N
243795	GENERIC_DAY	0	0	2010-08-28	2225	\N	99081	\N
243796	GENERIC_DAY	0	8	2011-05-03	2225	\N	99081	\N
243797	GENERIC_DAY	0	0	2011-07-23	2225	\N	99081	\N
243798	GENERIC_DAY	0	0	2011-04-03	2225	\N	99081	\N
243799	GENERIC_DAY	0	6	2011-05-13	2225	\N	99081	\N
243800	GENERIC_DAY	0	8	2010-08-02	2225	\N	99081	\N
243801	GENERIC_DAY	0	8	2010-12-22	2225	\N	99081	\N
243802	GENERIC_DAY	0	8	2011-08-16	2225	\N	99081	\N
243803	GENERIC_DAY	0	0	2010-05-23	2225	\N	99081	\N
243804	GENERIC_DAY	0	8	2010-08-24	2225	\N	99081	\N
243805	GENERIC_DAY	0	0	2010-12-11	2225	\N	99081	\N
243806	GENERIC_DAY	0	8	2010-09-09	2225	\N	99081	\N
243807	GENERIC_DAY	0	0	2010-03-21	2225	\N	99081	\N
243808	GENERIC_DAY	0	8	2010-05-06	2225	\N	99081	\N
243809	GENERIC_DAY	0	0	2011-09-17	2225	\N	99081	\N
243810	GENERIC_DAY	0	8	2011-05-04	2225	\N	99081	\N
243811	GENERIC_DAY	0	8	2011-05-17	2225	\N	99081	\N
243812	GENERIC_DAY	0	6	2011-09-09	2225	\N	99081	\N
243813	GENERIC_DAY	0	6	2011-08-26	2225	\N	99081	\N
243814	GENERIC_DAY	0	8	2010-04-12	2225	\N	99081	\N
243815	GENERIC_DAY	0	8	2010-12-21	2225	\N	99081	\N
243816	GENERIC_DAY	0	6	2010-10-08	2225	\N	99081	\N
243817	GENERIC_DAY	0	8	2010-05-20	2225	\N	99081	\N
243818	GENERIC_DAY	0	0	2010-10-24	2225	\N	99081	\N
243819	GENERIC_DAY	0	6	2011-01-14	2225	\N	99081	\N
243820	GENERIC_DAY	0	8	2010-09-30	2225	\N	99081	\N
243821	GENERIC_DAY	0	0	2010-06-05	2225	\N	99081	\N
243822	GENERIC_DAY	0	0	2010-05-09	2225	\N	99081	\N
243823	GENERIC_DAY	0	6	2010-06-25	2225	\N	99081	\N
243824	GENERIC_DAY	0	8	2011-04-11	2225	\N	99081	\N
243825	GENERIC_DAY	0	8	2011-04-07	2225	\N	99081	\N
243826	GENERIC_DAY	0	8	2011-04-27	2225	\N	99081	\N
243827	GENERIC_DAY	0	8	2010-06-08	2225	\N	99081	\N
243828	GENERIC_DAY	0	8	2010-07-29	2225	\N	99081	\N
243829	GENERIC_DAY	0	8	2011-09-07	2225	\N	99081	\N
243830	GENERIC_DAY	0	8	2010-09-21	2225	\N	99081	\N
243831	GENERIC_DAY	0	8	2010-07-05	2225	\N	99081	\N
243832	GENERIC_DAY	0	8	2010-03-31	2225	\N	99081	\N
243833	GENERIC_DAY	0	8	2011-02-28	2225	\N	99081	\N
243834	GENERIC_DAY	0	6	2010-09-24	2225	\N	99081	\N
243835	GENERIC_DAY	0	8	2011-01-06	2225	\N	99081	\N
243836	GENERIC_DAY	0	0	2011-05-22	2225	\N	99081	\N
243837	GENERIC_DAY	0	8	2010-06-02	2225	\N	99081	\N
243838	GENERIC_DAY	0	6	2011-02-18	2225	\N	99081	\N
243839	GENERIC_DAY	0	0	2011-08-27	2225	\N	99081	\N
243840	GENERIC_DAY	0	0	2010-12-18	2225	\N	99081	\N
243841	GENERIC_DAY	0	8	2010-04-21	2225	\N	99081	\N
243842	GENERIC_DAY	0	0	2011-02-26	2225	\N	99081	\N
243843	GENERIC_DAY	0	8	2011-04-06	2225	\N	99081	\N
243844	GENERIC_DAY	0	8	2011-06-20	2225	\N	99081	\N
243845	GENERIC_DAY	0	0	2011-06-05	2225	\N	99081	\N
243846	GENERIC_DAY	0	8	2011-07-07	2225	\N	99081	\N
243847	GENERIC_DAY	0	8	2010-06-07	2225	\N	99081	\N
243848	GENERIC_DAY	0	8	2010-12-30	2225	\N	99081	\N
243849	GENERIC_DAY	0	8	2011-04-12	2225	\N	99081	\N
243850	GENERIC_DAY	0	8	2010-08-09	2225	\N	99081	\N
243851	GENERIC_DAY	0	8	2010-12-28	2225	\N	99081	\N
243852	GENERIC_DAY	0	8	2011-05-12	2225	\N	99081	\N
243853	GENERIC_DAY	0	8	2011-03-30	2225	\N	99081	\N
243854	GENERIC_DAY	0	6	2011-04-01	2225	\N	99081	\N
243855	GENERIC_DAY	0	8	2011-02-08	2225	\N	99081	\N
243856	GENERIC_DAY	0	0	2011-01-30	2225	\N	99081	\N
243857	GENERIC_DAY	0	6	2011-02-11	2225	\N	99081	\N
243858	GENERIC_DAY	0	0	2010-04-02	2225	\N	99081	\N
243859	GENERIC_DAY	0	6	2010-09-10	2225	\N	99081	\N
243860	GENERIC_DAY	0	6	2011-07-08	2225	\N	99081	\N
243861	GENERIC_DAY	0	0	2011-02-06	2225	\N	99081	\N
243862	GENERIC_DAY	0	0	2010-08-29	2225	\N	99081	\N
243863	GENERIC_DAY	0	8	2011-03-17	2225	\N	99081	\N
243864	GENERIC_DAY	0	8	2011-02-14	2225	\N	99081	\N
243865	GENERIC_DAY	0	8	2011-04-26	2225	\N	99081	\N
243866	GENERIC_DAY	0	8	2011-09-08	2225	\N	99081	\N
243867	GENERIC_DAY	0	8	2011-09-19	2225	\N	99081	\N
243868	GENERIC_DAY	0	8	2010-03-22	2225	\N	99081	\N
243869	GENERIC_DAY	0	0	2011-05-08	2225	\N	99081	\N
243870	GENERIC_DAY	0	6	2010-12-03	2225	\N	99081	\N
243871	GENERIC_DAY	0	8	2011-07-13	2225	\N	99081	\N
243872	GENERIC_DAY	0	8	2010-05-18	2225	\N	99081	\N
243873	GENERIC_DAY	0	8	2011-08-18	2225	\N	99081	\N
243874	GENERIC_DAY	0	0	2010-10-31	2225	\N	99081	\N
243875	GENERIC_DAY	0	8	2010-10-19	2225	\N	99081	\N
243876	GENERIC_DAY	0	8	2010-11-16	2225	\N	99081	\N
243877	GENERIC_DAY	0	6	2011-08-12	2225	\N	99081	\N
243878	GENERIC_DAY	0	8	2011-01-27	2225	\N	99081	\N
243879	GENERIC_DAY	0	4	2011-09-28	2225	\N	99081	\N
243880	GENERIC_DAY	0	0	2011-07-30	2225	\N	99081	\N
243881	GENERIC_DAY	0	8	2011-03-14	2225	\N	99081	\N
243882	GENERIC_DAY	0	0	2010-05-29	2225	\N	99081	\N
243883	GENERIC_DAY	0	0	2010-07-04	2225	\N	99081	\N
243884	GENERIC_DAY	0	6	2011-01-28	2225	\N	99081	\N
243885	GENERIC_DAY	0	0	2011-09-25	2225	\N	99081	\N
243886	GENERIC_DAY	0	0	2010-06-13	2225	\N	99081	\N
243887	GENERIC_DAY	0	6	2011-01-21	2225	\N	99081	\N
243888	GENERIC_DAY	0	8	2010-06-21	2225	\N	99081	\N
243889	GENERIC_DAY	0	6	2010-04-16	2225	\N	99081	\N
243890	GENERIC_DAY	0	8	2010-07-28	2225	\N	99081	\N
243891	GENERIC_DAY	0	8	2010-12-01	2225	\N	99081	\N
243892	GENERIC_DAY	0	0	2010-06-06	2225	\N	99081	\N
243893	GENERIC_DAY	0	6	2010-07-23	2225	\N	99081	\N
243894	GENERIC_DAY	0	0	2011-04-30	2225	\N	99081	\N
243895	GENERIC_DAY	0	8	2011-06-15	2225	\N	99081	\N
243896	GENERIC_DAY	0	6	2011-03-18	2225	\N	99081	\N
243897	GENERIC_DAY	0	8	2011-04-04	2225	\N	99081	\N
243898	GENERIC_DAY	0	8	2011-08-10	2225	\N	99081	\N
243899	GENERIC_DAY	0	8	2011-03-03	2225	\N	99081	\N
243900	GENERIC_DAY	0	0	2011-09-10	2225	\N	99081	\N
243901	GENERIC_DAY	0	8	2010-07-15	2225	\N	99081	\N
243902	GENERIC_DAY	0	0	2011-01-01	2225	\N	99081	\N
243903	GENERIC_DAY	0	0	2010-12-19	2225	\N	99081	\N
243904	GENERIC_DAY	0	0	2010-10-16	2225	\N	99081	\N
243905	GENERIC_DAY	0	6	2010-12-10	2225	\N	99081	\N
243906	GENERIC_DAY	0	0	2010-07-18	2225	\N	99081	\N
243907	GENERIC_DAY	0	0	2010-11-13	2225	\N	99081	\N
243908	GENERIC_DAY	0	0	2011-01-08	2225	\N	99081	\N
243909	GENERIC_DAY	0	8	2011-08-17	2225	\N	99081	\N
243910	GENERIC_DAY	0	8	2011-03-08	2225	\N	99081	\N
243911	GENERIC_DAY	0	8	2010-07-22	2225	\N	99081	\N
243912	GENERIC_DAY	0	8	2010-12-16	2225	\N	99081	\N
243913	GENERIC_DAY	0	8	2010-11-17	2225	\N	99081	\N
243914	GENERIC_DAY	0	8	2011-07-06	2225	\N	99081	\N
243915	GENERIC_DAY	0	8	2010-11-18	2225	\N	99081	\N
243916	GENERIC_DAY	0	8	2010-04-19	2225	\N	99081	\N
243917	GENERIC_DAY	0	8	2010-03-25	2225	\N	99081	\N
243918	GENERIC_DAY	0	6	2011-04-08	2225	\N	99081	\N
243919	GENERIC_DAY	0	8	2010-04-14	2225	\N	99081	\N
243920	GENERIC_DAY	0	8	2011-06-21	2225	\N	99081	\N
243921	GENERIC_DAY	0	8	2010-10-25	2225	\N	99081	\N
243922	GENERIC_DAY	0	8	2010-11-30	2225	\N	99081	\N
243923	GENERIC_DAY	0	0	2010-12-08	2225	\N	99081	\N
243924	GENERIC_DAY	0	8	2010-10-28	2225	\N	99081	\N
243925	GENERIC_DAY	0	8	2011-08-15	2225	\N	99081	\N
243926	GENERIC_DAY	0	8	2011-03-21	2225	\N	99081	\N
243927	GENERIC_DAY	0	8	2010-12-07	2225	\N	99081	\N
243928	GENERIC_DAY	0	8	2011-08-22	2225	\N	99081	\N
243929	GENERIC_DAY	0	0	2010-09-04	2225	\N	99081	\N
243930	GENERIC_DAY	0	0	2010-09-12	2225	\N	99081	\N
243931	GENERIC_DAY	0	8	2011-03-22	2225	\N	99081	\N
243932	GENERIC_DAY	0	8	2011-03-28	2225	\N	99081	\N
243933	GENERIC_DAY	0	8	2010-10-04	2225	\N	99081	\N
243934	GENERIC_DAY	0	0	2010-06-27	2225	\N	99081	\N
243935	GENERIC_DAY	0	0	2011-04-24	2225	\N	99081	\N
243936	GENERIC_DAY	0	8	2010-10-07	2225	\N	99081	\N
243937	GENERIC_DAY	0	8	2011-05-24	2225	\N	99081	\N
243938	GENERIC_DAY	0	0	2010-11-14	2225	\N	99081	\N
243939	GENERIC_DAY	0	0	2011-02-27	2225	\N	99081	\N
243940	GENERIC_DAY	0	0	2010-04-04	2225	\N	99081	\N
243941	GENERIC_DAY	0	8	2011-02-21	2225	\N	99081	\N
243942	GENERIC_DAY	0	8	2010-11-09	2225	\N	99081	\N
243943	GENERIC_DAY	0	0	2010-09-05	2225	\N	99081	\N
243944	GENERIC_DAY	0	8	2010-05-11	2225	\N	99081	\N
243945	GENERIC_DAY	0	8	2010-04-08	2225	\N	99081	\N
243946	GENERIC_DAY	0	0	2010-04-01	2225	\N	99081	\N
243947	GENERIC_DAY	0	8	2010-09-08	2225	\N	99081	\N
243948	GENERIC_DAY	0	6	2010-05-21	2225	\N	99081	\N
243949	GENERIC_DAY	0	8	2010-09-06	2225	\N	99081	\N
243950	GENERIC_DAY	0	8	2011-08-02	2225	\N	99081	\N
243951	GENERIC_DAY	0	8	2010-06-28	2225	\N	99081	\N
243952	GENERIC_DAY	0	8	2010-06-30	2225	\N	99081	\N
243953	GENERIC_DAY	0	6	2011-05-27	2225	\N	99081	\N
243954	GENERIC_DAY	0	0	2010-08-21	2225	\N	99081	\N
243955	GENERIC_DAY	0	8	2011-01-11	2225	\N	99081	\N
243956	GENERIC_DAY	0	0	2011-09-18	2225	\N	99081	\N
243957	GENERIC_DAY	0	0	2011-02-19	2225	\N	99081	\N
243958	GENERIC_DAY	0	0	2011-07-24	2225	\N	99081	\N
243959	GENERIC_DAY	0	8	2010-06-16	2225	\N	99081	\N
243960	GENERIC_DAY	0	8	2010-09-02	2225	\N	99081	\N
243961	GENERIC_DAY	0	8	2010-03-16	2225	\N	99081	\N
243962	GENERIC_DAY	0	8	2010-11-02	2225	\N	99081	\N
243963	GENERIC_DAY	0	8	2010-08-23	2225	\N	99081	\N
243964	GENERIC_DAY	0	8	2010-10-18	2225	\N	99081	\N
243965	GENERIC_DAY	0	8	2011-04-28	2225	\N	99081	\N
243966	GENERIC_DAY	0	0	2010-06-26	2225	\N	99081	\N
243967	GENERIC_DAY	0	8	2010-12-27	2225	\N	99081	\N
243968	GENERIC_DAY	0	8	2010-08-19	2225	\N	99081	\N
243969	GENERIC_DAY	0	0	2010-12-04	2225	\N	99081	\N
243970	GENERIC_DAY	0	6	2010-10-15	2225	\N	99081	\N
187624	GENERIC_DAY	1	0	2010-07-04	2223	\N	139499	\N
189757	GENERIC_DAY	1	1	2010-08-17	2233	\N	139499	\N
189258	GENERIC_DAY	1	0	2010-06-02	2239	\N	139499	\N
187834	GENERIC_DAY	1	0	2010-02-27	2235	\N	139499	\N
188282	GENERIC_DAY	1	0	2010-07-04	2233	\N	139499	\N
188499	GENERIC_DAY	1	1	2010-03-10	2235	\N	139499	\N
189590	GENERIC_DAY	1	1	2010-05-12	2249	\N	139499	\N
188023	GENERIC_DAY	1	1	2010-05-25	2237	\N	139499	\N
187829	GENERIC_DAY	1	0	2010-04-30	2243	\N	139499	\N
188944	GENERIC_DAY	1	1	2010-08-05	2237	\N	139499	\N
189344	GENERIC_DAY	1	1	2010-02-23	2237	\N	139499	\N
189826	GENERIC_DAY	1	0	2010-03-22	2231	\N	139499	\N
187579	GENERIC_DAY	1	0	2010-07-31	2247	\N	139499	\N
187981	GENERIC_DAY	1	0	2010-05-09	2249	\N	139499	\N
188227	GENERIC_DAY	1	0	2010-08-03	2241	\N	139499	\N
189558	GENERIC_DAY	1	0	2010-07-28	2229	\N	139499	\N
189939	GENERIC_DAY	1	0	2010-08-07	2249	\N	139499	\N
189650	GENERIC_DAY	1	0	2010-06-20	2233	\N	139499	\N
189646	GENERIC_DAY	1	0	2010-05-09	2243	\N	139499	\N
187584	GENERIC_DAY	1	0	2010-03-27	2235	\N	139499	\N
189684	GENERIC_DAY	1	0	2010-04-05	2233	\N	139499	\N
189049	GENERIC_DAY	1	0	2010-03-12	2235	\N	139499	\N
189892	GENERIC_DAY	1	0	2010-03-07	2243	\N	139499	\N
190015	GENERIC_DAY	1	0	2010-04-10	2233	\N	139499	\N
189706	GENERIC_DAY	1	0	2010-04-25	2229	\N	139499	\N
188003	GENERIC_DAY	1	0	2010-03-15	2231	\N	139499	\N
188876	GENERIC_DAY	1	1	2010-06-21	2243	\N	139499	\N
188191	GENERIC_DAY	1	0	2010-07-07	2241	\N	139499	\N
189828	GENERIC_DAY	1	1	2010-07-08	2247	\N	139499	\N
189760	GENERIC_DAY	1	0	2010-07-02	2235	\N	139499	\N
189932	GENERIC_DAY	1	0	2010-04-27	2231	\N	139499	\N
189216	GENERIC_DAY	1	0	2010-03-08	2237	\N	139499	\N
188640	GENERIC_DAY	1	0	2010-06-10	2241	\N	139499	\N
188818	GENERIC_DAY	1	0	2010-04-02	2239	\N	139499	\N
189363	GENERIC_DAY	1	1	2010-03-11	2239	\N	139499	\N
189013	GENERIC_DAY	1	1	2010-07-12	2251	\N	139499	\N
188215	GENERIC_DAY	1	0	2010-05-08	2237	\N	139499	\N
188206	GENERIC_DAY	1	0	2010-03-12	2247	\N	139499	\N
188009	GENERIC_DAY	1	0	2010-05-22	2237	\N	139499	\N
188839	GENERIC_DAY	1	0	2010-05-19	2239	\N	139499	\N
189453	GENERIC_DAY	1	0	2010-03-26	2235	\N	139499	\N
189561	GENERIC_DAY	1	1	2010-08-11	2239	\N	139499	\N
188106	GENERIC_DAY	1	0	2010-06-13	2223	\N	139499	\N
189707	GENERIC_DAY	1	0	2010-06-13	2235	\N	139499	\N
188454	GENERIC_DAY	1	0	2010-07-11	2223	\N	139499	\N
188092	GENERIC_DAY	1	0	2010-08-16	2225	\N	139499	\N
188197	GENERIC_DAY	1	1	2010-06-02	2237	\N	139499	\N
187817	GENERIC_DAY	1	0	2010-03-24	2247	\N	139499	\N
187554	GENERIC_DAY	1	1	2010-07-06	2235	\N	139499	\N
189817	GENERIC_DAY	1	0	2010-07-06	2241	\N	139499	\N
189965	GENERIC_DAY	1	1	2010-04-23	2245	\N	139499	\N
189017	GENERIC_DAY	1	0	2010-03-09	2235	\N	139499	\N
188958	GENERIC_DAY	1	0	2010-08-01	2233	\N	139499	\N
188250	GENERIC_DAY	1	1	2010-07-16	2245	\N	139499	\N
187940	GENERIC_DAY	1	0	2010-05-22	2245	\N	139499	\N
189129	GENERIC_DAY	1	1	2010-04-08	2229	\N	139499	\N
188082	GENERIC_DAY	1	0	2010-04-24	2233	\N	139499	\N
188505	GENERIC_DAY	1	0	2010-08-06	2249	\N	139499	\N
188337	GENERIC_DAY	1	1	2010-06-24	2249	\N	139499	\N
188332	GENERIC_DAY	1	0	2010-05-30	2235	\N	139499	\N
190013	GENERIC_DAY	1	0	2010-08-12	2243	\N	139499	\N
189175	GENERIC_DAY	1	1	2010-05-27	2237	\N	139499	\N
188952	GENERIC_DAY	1	1	2010-07-27	2243	\N	139499	\N
189065	GENERIC_DAY	1	1	2010-05-04	2251	\N	139499	\N
187635	GENERIC_DAY	1	0	2010-04-26	2223	\N	139499	\N
188405	GENERIC_DAY	1	0	2010-02-27	2223	\N	139499	\N
189969	GENERIC_DAY	1	0	2010-05-22	2223	\N	139499	\N
189566	GENERIC_DAY	1	0	2010-08-17	2225	\N	139499	\N
189197	GENERIC_DAY	1	0	2010-07-20	2229	\N	139499	\N
189701	GENERIC_DAY	1	1	2010-02-22	2245	\N	139499	\N
189073	GENERIC_DAY	1	0	2010-05-14	2247	\N	139499	\N
187737	GENERIC_DAY	1	1	2010-07-01	2249	\N	139499	\N
188617	GENERIC_DAY	1	1	2010-06-28	2249	\N	139499	\N
189835	GENERIC_DAY	1	0	2010-05-12	2241	\N	139499	\N
189495	GENERIC_DAY	1	0	2010-06-26	2223	\N	139499	\N
189214	GENERIC_DAY	1	1	2010-07-06	2243	\N	139499	\N
189441	GENERIC_DAY	1	0	2010-04-05	2239	\N	139499	\N
189616	GENERIC_DAY	1	1	2010-06-04	2231	\N	139499	\N
189024	GENERIC_DAY	1	1	2010-07-16	2233	\N	139499	\N
188963	GENERIC_DAY	1	0	2010-03-26	2249	\N	139499	\N
189001	GENERIC_DAY	1	0	2010-07-24	2223	\N	139499	\N
188881	GENERIC_DAY	1	1	2010-04-07	2233	\N	139499	\N
189602	GENERIC_DAY	1	0	2010-05-02	2233	\N	139499	\N
189321	GENERIC_DAY	1	0	2010-03-07	2229	\N	139499	\N
188911	GENERIC_DAY	1	0	2010-07-24	2235	\N	139499	\N
189061	GENERIC_DAY	1	0	2010-06-06	2233	\N	139499	\N
189139	GENERIC_DAY	1	0	2010-07-12	2231	\N	139499	\N
126232	GENERIC_DAY	0	7	2010-06-18	2225	\N	3642	\N
126233	GENERIC_DAY	0	10	2010-06-09	2225	\N	3642	\N
126234	GENERIC_DAY	0	7	2010-04-23	2225	\N	3642	\N
126235	GENERIC_DAY	0	10	2010-06-02	2225	\N	3642	\N
126236	GENERIC_DAY	0	10	2010-05-06	2225	\N	3642	\N
126237	GENERIC_DAY	0	10	2010-06-16	2225	\N	3642	\N
126238	GENERIC_DAY	0	10	2010-04-12	2225	\N	3642	\N
126239	GENERIC_DAY	0	7	2010-05-21	2225	\N	3642	\N
126240	GENERIC_DAY	0	0	2010-05-30	2225	\N	3642	\N
126241	GENERIC_DAY	0	7	2010-04-30	2225	\N	3642	\N
126242	GENERIC_DAY	0	7	2010-04-09	2225	\N	3642	\N
126243	GENERIC_DAY	0	0	2010-04-03	2225	\N	3642	\N
126244	GENERIC_DAY	0	10	2010-04-20	2225	\N	3642	\N
126245	GENERIC_DAY	0	10	2010-06-21	2225	\N	3642	\N
126246	GENERIC_DAY	0	10	2010-06-10	2225	\N	3642	\N
126247	GENERIC_DAY	0	0	2010-06-13	2225	\N	3642	\N
126248	GENERIC_DAY	0	0	2010-05-22	2225	\N	3642	\N
126249	GENERIC_DAY	0	10	2010-04-13	2225	\N	3642	\N
126250	GENERIC_DAY	0	10	2010-04-14	2225	\N	3642	\N
126251	GENERIC_DAY	0	10	2010-03-29	2225	\N	3642	\N
126252	GENERIC_DAY	0	7	2010-04-16	2225	\N	3642	\N
126253	GENERIC_DAY	0	10	2010-06-03	2225	\N	3642	\N
126254	GENERIC_DAY	0	10	2010-05-19	2225	\N	3642	\N
126255	GENERIC_DAY	0	10	2010-05-25	2225	\N	3642	\N
126256	GENERIC_DAY	0	10	2010-05-24	2225	\N	3642	\N
126257	GENERIC_DAY	0	10	2010-04-08	2225	\N	3642	\N
126258	GENERIC_DAY	0	0	2010-05-16	2225	\N	3642	\N
126259	GENERIC_DAY	0	10	2010-05-04	2225	\N	3642	\N
126260	GENERIC_DAY	0	10	2010-04-06	2225	\N	3642	\N
126261	GENERIC_DAY	0	10	2010-04-19	2225	\N	3642	\N
126262	GENERIC_DAY	0	10	2010-05-18	2225	\N	3642	\N
126263	GENERIC_DAY	0	0	2010-05-01	2225	\N	3642	\N
126264	GENERIC_DAY	0	10	2010-04-26	2225	\N	3642	\N
126265	GENERIC_DAY	0	10	2010-04-05	2225	\N	3642	\N
126266	GENERIC_DAY	0	10	2010-06-23	2225	\N	3642	\N
126267	GENERIC_DAY	0	10	2010-05-27	2225	\N	3642	\N
126268	GENERIC_DAY	0	10	2010-05-10	2225	\N	3642	\N
126269	GENERIC_DAY	0	0	2010-06-20	2225	\N	3642	\N
126270	GENERIC_DAY	0	10	2010-04-15	2225	\N	3642	\N
126271	GENERIC_DAY	0	10	2010-05-26	2225	\N	3642	\N
126272	GENERIC_DAY	0	0	2010-05-08	2225	\N	3642	\N
126273	GENERIC_DAY	0	10	2010-06-01	2225	\N	3642	\N
126274	GENERIC_DAY	0	10	2010-05-05	2225	\N	3642	\N
126275	GENERIC_DAY	0	0	2010-04-04	2225	\N	3642	\N
126276	GENERIC_DAY	0	0	2010-04-25	2225	\N	3642	\N
126277	GENERIC_DAY	0	10	2010-06-08	2225	\N	3642	\N
126278	GENERIC_DAY	0	10	2010-06-24	2225	\N	3642	\N
126279	GENERIC_DAY	0	0	2010-06-12	2225	\N	3642	\N
126280	GENERIC_DAY	0	10	2010-06-07	2225	\N	3642	\N
126281	GENERIC_DAY	0	10	2010-03-25	2225	\N	3642	\N
126282	GENERIC_DAY	0	0	2010-05-15	2225	\N	3642	\N
126283	GENERIC_DAY	0	10	2010-04-21	2225	\N	3642	\N
126284	GENERIC_DAY	0	0	2010-06-05	2225	\N	3642	\N
126285	GENERIC_DAY	0	0	2010-05-17	2225	\N	3642	\N
126286	GENERIC_DAY	0	0	2010-03-28	2225	\N	3642	\N
126287	GENERIC_DAY	0	6	2010-06-25	2225	\N	3642	\N
126288	GENERIC_DAY	0	10	2010-04-28	2225	\N	3642	\N
126289	GENERIC_DAY	0	0	2010-04-02	2225	\N	3642	\N
126290	GENERIC_DAY	0	7	2010-05-28	2225	\N	3642	\N
126291	GENERIC_DAY	0	0	2010-04-01	2225	\N	3642	\N
126292	GENERIC_DAY	0	0	2010-04-24	2225	\N	3642	\N
126293	GENERIC_DAY	0	0	2010-03-27	2225	\N	3642	\N
126294	GENERIC_DAY	0	10	2010-05-13	2225	\N	3642	\N
126295	GENERIC_DAY	0	10	2010-03-30	2225	\N	3642	\N
126296	GENERIC_DAY	0	10	2010-04-29	2225	\N	3642	\N
126297	GENERIC_DAY	0	7	2010-06-04	2225	\N	3642	\N
126298	GENERIC_DAY	0	0	2010-05-29	2225	\N	3642	\N
126299	GENERIC_DAY	0	0	2010-04-11	2225	\N	3642	\N
126300	GENERIC_DAY	0	0	2010-05-23	2225	\N	3642	\N
126301	GENERIC_DAY	0	10	2010-05-11	2225	\N	3642	\N
126302	GENERIC_DAY	0	7	2010-05-14	2225	\N	3642	\N
126303	GENERIC_DAY	0	10	2010-03-31	2225	\N	3642	\N
126304	GENERIC_DAY	0	0	2010-06-19	2225	\N	3642	\N
126305	GENERIC_DAY	0	7	2010-05-07	2225	\N	3642	\N
189356	GENERIC_DAY	1	0	2010-04-08	2237	\N	139499	\N
189003	GENERIC_DAY	1	0	2010-05-11	2231	\N	139499	\N
188891	GENERIC_DAY	1	1	2010-07-08	2245	\N	139499	\N
187912	GENERIC_DAY	1	1	2010-07-21	2235	\N	139499	\N
188801	GENERIC_DAY	1	0	2010-06-05	2233	\N	139499	\N
189330	GENERIC_DAY	1	1	2010-08-16	2233	\N	139499	\N
188109	GENERIC_DAY	1	0	2010-04-01	2243	\N	139499	\N
188635	GENERIC_DAY	1	2	2010-02-22	2241	\N	139499	\N
188983	GENERIC_DAY	1	1	2010-04-26	2245	\N	139499	\N
187675	GENERIC_DAY	1	1	2010-08-18	2229	\N	139499	\N
188601	GENERIC_DAY	1	1	2010-08-23	2239	\N	139499	\N
188992	GENERIC_DAY	1	0	2010-03-27	2237	\N	139499	\N
188829	GENERIC_DAY	1	1	2010-07-13	2235	\N	139499	\N
188836	GENERIC_DAY	1	1	2010-03-22	2245	\N	139499	\N
188052	GENERIC_DAY	1	0	2010-03-18	2233	\N	139499	\N
188409	GENERIC_DAY	1	0	2010-03-07	2225	\N	139499	\N
189095	GENERIC_DAY	1	1	2010-07-30	2223	\N	139499	\N
188083	GENERIC_DAY	1	0	2010-08-14	2225	\N	139499	\N
187972	GENERIC_DAY	1	0	2010-03-26	2247	\N	139499	\N
188927	GENERIC_DAY	1	0	2010-06-02	2229	\N	139499	\N
188392	GENERIC_DAY	1	1	2010-07-22	2243	\N	139499	\N
189058	GENERIC_DAY	1	0	2010-03-29	2239	\N	139499	\N
189815	GENERIC_DAY	1	1	2010-08-10	2251	\N	139499	\N
188436	GENERIC_DAY	1	1	2010-07-01	2247	\N	139499	\N
187674	GENERIC_DAY	1	1	2010-04-13	2243	\N	139499	\N
188312	GENERIC_DAY	1	0	2010-06-22	2239	\N	139499	\N
189054	GENERIC_DAY	1	1	2010-06-16	2237	\N	139499	\N
188838	GENERIC_DAY	1	0	2010-05-04	2223	\N	139499	\N
187741	GENERIC_DAY	1	0	2010-03-30	2247	\N	139499	\N
188304	GENERIC_DAY	1	0	2010-03-23	2225	\N	139499	\N
188662	GENERIC_DAY	1	0	2010-05-14	2225	\N	139499	\N
188943	GENERIC_DAY	1	0	2010-08-14	2233	\N	139499	\N
189039	GENERIC_DAY	1	0	2010-04-16	2237	\N	139499	\N
188729	GENERIC_DAY	1	1	2010-03-18	2245	\N	139499	\N
189519	GENERIC_DAY	1	1	2010-08-13	2247	\N	139499	\N
188641	GENERIC_DAY	1	1	2010-07-06	2245	\N	139499	\N
188014	GENERIC_DAY	1	0	2010-08-08	2235	\N	139499	\N
188514	GENERIC_DAY	1	1	2010-04-29	2249	\N	139499	\N
188374	GENERIC_DAY	1	0	2010-03-03	2249	\N	139499	\N
189623	GENERIC_DAY	1	1	2010-07-02	2223	\N	139499	\N
188695	GENERIC_DAY	1	0	2010-05-07	2249	\N	139499	\N
187612	GENERIC_DAY	1	0	2010-05-17	2245	\N	139499	\N
188341	GENERIC_DAY	1	0	2010-06-24	2225	\N	139499	\N
189370	GENERIC_DAY	1	0	2010-06-28	2229	\N	139499	\N
189979	GENERIC_DAY	1	0	2010-03-07	2231	\N	139499	\N
187908	GENERIC_DAY	1	0	2010-02-17	2231	\N	139499	\N
188879	GENERIC_DAY	1	0	2010-06-24	2229	\N	139499	\N
189045	GENERIC_DAY	1	1	2010-07-02	2229	\N	139499	\N
189018	GENERIC_DAY	1	0	2010-04-03	2245	\N	139499	\N
188946	GENERIC_DAY	1	0	2010-03-14	2231	\N	139499	\N
189944	GENERIC_DAY	1	0	2010-03-14	2233	\N	139499	\N
187555	GENERIC_DAY	1	0	2010-05-22	2243	\N	139499	\N
189582	GENERIC_DAY	1	0	2010-05-15	2241	\N	139499	\N
188548	GENERIC_DAY	1	0	2010-04-11	2229	\N	139499	\N
188408	GENERIC_DAY	1	1	2010-05-10	2247	\N	139499	\N
188051	GENERIC_DAY	1	0	2010-04-04	2223	\N	139499	\N
188298	GENERIC_DAY	1	0	2010-06-07	2223	\N	139499	\N
189990	GENERIC_DAY	1	0	2010-05-06	2225	\N	139499	\N
187961	GENERIC_DAY	1	0	2010-04-01	2229	\N	139499	\N
189786	GENERIC_DAY	1	0	2010-07-07	2231	\N	139499	\N
188473	GENERIC_DAY	1	0	2010-04-24	2237	\N	139499	\N
188541	GENERIC_DAY	1	1	2010-07-16	2231	\N	139499	\N
189683	GENERIC_DAY	1	1	2010-03-17	2229	\N	139499	\N
187614	GENERIC_DAY	1	0	2010-02-19	2239	\N	139499	\N
188373	GENERIC_DAY	1	0	2010-07-04	2225	\N	139499	\N
189610	GENERIC_DAY	1	0	2010-04-07	2237	\N	139499	\N
189542	GENERIC_DAY	1	0	2010-04-20	2225	\N	139499	\N
187720	GENERIC_DAY	1	1	2010-07-14	2243	\N	139499	\N
188511	GENERIC_DAY	1	1	2010-06-24	2247	\N	139499	\N
188697	GENERIC_DAY	1	1	2010-06-01	2247	\N	139499	\N
188936	GENERIC_DAY	1	0	2010-05-16	2237	\N	139499	\N
189928	GENERIC_DAY	1	0	2010-07-24	2225	\N	139499	\N
189381	GENERIC_DAY	1	1	2010-08-19	2223	\N	139499	\N
187422	GENERIC_DAY	1	1	2010-06-01	2249	\N	139499	\N
189955	GENERIC_DAY	1	1	2010-04-13	2241	\N	139499	\N
187605	GENERIC_DAY	1	0	2010-04-22	2223	\N	139499	\N
189746	GENERIC_DAY	1	1	2010-07-15	2247	\N	139499	\N
187736	GENERIC_DAY	1	0	2010-02-22	2225	\N	139499	\N
189900	GENERIC_DAY	1	0	2010-03-25	2235	\N	139499	\N
187435	GENERIC_DAY	1	1	2010-05-10	2237	\N	139499	\N
190049	GENERIC_DAY	1	1	2010-04-26	2237	\N	139499	\N
189470	GENERIC_DAY	1	0	2010-08-19	2243	\N	139499	\N
187482	GENERIC_DAY	1	0	2010-06-09	2239	\N	139499	\N
189795	GENERIC_DAY	1	0	2010-04-03	2249	\N	139499	\N
189692	GENERIC_DAY	1	1	2010-05-05	2233	\N	139499	\N
188666	GENERIC_DAY	1	0	2010-08-21	2251	\N	139499	\N
188244	GENERIC_DAY	1	0	2010-06-16	2229	\N	139499	\N
189958	GENERIC_DAY	1	0	2010-02-20	2229	\N	139499	\N
189804	GENERIC_DAY	1	0	2010-05-02	2231	\N	139499	\N
189072	GENERIC_DAY	1	0	2010-06-19	2229	\N	139499	\N
187918	GENERIC_DAY	1	1	2010-06-15	2237	\N	139499	\N
187636	GENERIC_DAY	1	0	2010-08-04	2225	\N	139499	\N
187661	GENERIC_DAY	1	1	2010-06-24	2233	\N	139499	\N
188323	GENERIC_DAY	1	0	2010-07-11	2235	\N	139499	\N
187695	GENERIC_DAY	1	0	2010-08-12	2231	\N	139499	\N
188168	GENERIC_DAY	1	1	2010-05-28	2233	\N	139499	\N
188609	GENERIC_DAY	1	0	2010-08-16	2243	\N	139499	\N
189639	GENERIC_DAY	1	1	2010-04-08	2233	\N	139499	\N
188737	GENERIC_DAY	1	1	2010-07-05	2247	\N	139499	\N
189044	GENERIC_DAY	1	2	2010-03-16	2241	\N	139499	\N
189231	GENERIC_DAY	1	1	2010-06-24	2235	\N	139499	\N
187845	GENERIC_DAY	1	0	2010-05-14	2251	\N	139499	\N
188585	GENERIC_DAY	1	0	2010-06-15	2225	\N	139499	\N
187909	GENERIC_DAY	1	0	2010-02-22	2235	\N	139499	\N
188686	GENERIC_DAY	1	0	2010-05-23	2223	\N	139499	\N
187657	GENERIC_DAY	1	1	2010-04-21	2243	\N	139499	\N
187803	GENERIC_DAY	1	0	2010-04-28	2225	\N	139499	\N
187933	GENERIC_DAY	1	0	2010-07-31	2239	\N	139499	\N
188710	GENERIC_DAY	1	1	2010-05-18	2235	\N	139499	\N
188158	GENERIC_DAY	1	1	2010-08-04	2243	\N	139499	\N
188532	GENERIC_DAY	1	1	2010-07-21	2237	\N	139499	\N
189339	GENERIC_DAY	1	0	2010-07-21	2231	\N	139499	\N
188289	GENERIC_DAY	1	0	2010-05-10	2241	\N	139499	\N
188988	GENERIC_DAY	1	0	2010-07-18	2243	\N	139499	\N
189379	GENERIC_DAY	1	0	2010-04-10	2243	\N	139499	\N
189335	GENERIC_DAY	1	0	2010-05-17	2235	\N	139499	\N
187552	GENERIC_DAY	1	1	2010-07-08	2249	\N	139499	\N
188400	GENERIC_DAY	1	0	2010-07-25	2235	\N	139499	\N
187859	GENERIC_DAY	1	1	2010-07-05	2235	\N	139499	\N
187730	GENERIC_DAY	1	0	2010-03-30	2239	\N	139499	\N
188451	GENERIC_DAY	1	0	2010-06-20	2239	\N	139499	\N
188379	GENERIC_DAY	1	0	2010-05-03	2229	\N	139499	\N
187623	GENERIC_DAY	1	0	2010-02-27	2237	\N	139499	\N
187642	GENERIC_DAY	1	0	2010-06-06	2231	\N	139499	\N
187759	GENERIC_DAY	1	0	2010-03-14	2245	\N	139499	\N
189451	GENERIC_DAY	1	1	2010-06-03	2243	\N	139499	\N
188320	GENERIC_DAY	1	1	2010-04-08	2243	\N	139499	\N
188864	GENERIC_DAY	1	0	2010-08-23	2247	\N	139499	\N
189962	GENERIC_DAY	1	0	2010-05-29	2247	\N	139499	\N
188627	GENERIC_DAY	1	1	2010-07-21	2249	\N	139499	\N
189477	GENERIC_DAY	1	0	2010-05-25	2223	\N	139499	\N
188048	GENERIC_DAY	1	0	2010-08-11	2247	\N	139499	\N
190008	GENERIC_DAY	1	0	2010-03-10	2243	\N	139499	\N
188185	GENERIC_DAY	1	0	2010-06-13	2233	\N	139499	\N
187586	GENERIC_DAY	1	0	2010-05-23	2233	\N	139499	\N
188825	GENERIC_DAY	1	1	2010-03-11	2241	\N	139499	\N
189110	GENERIC_DAY	1	0	2010-05-16	2235	\N	139499	\N
187561	GENERIC_DAY	1	1	2010-05-20	2243	\N	139499	\N
189997	GENERIC_DAY	1	1	2010-06-07	2243	\N	139499	\N
189228	GENERIC_DAY	1	0	2010-05-13	2225	\N	139499	\N
189585	GENERIC_DAY	1	1	2010-02-24	2245	\N	139499	\N
187518	GENERIC_DAY	1	0	2010-07-04	2231	\N	139499	\N
189360	GENERIC_DAY	1	1	2010-03-03	2245	\N	139499	\N
187988	GENERIC_DAY	1	0	2010-05-22	2249	\N	139499	\N
189367	GENERIC_DAY	1	0	2010-07-01	2225	\N	139499	\N
187470	GENERIC_DAY	1	0	2010-05-02	2235	\N	139499	\N
190036	GENERIC_DAY	1	0	2010-07-16	2243	\N	139499	\N
187438	GENERIC_DAY	1	0	2010-03-01	2243	\N	139499	\N
189233	GENERIC_DAY	1	1	2010-05-05	2247	\N	139499	\N
190062	GENERIC_DAY	1	1	2010-03-10	2239	\N	139499	\N
188096	GENERIC_DAY	1	0	2010-06-06	2251	\N	139499	\N
188146	GENERIC_DAY	1	1	2010-03-11	2251	\N	139499	\N
188921	GENERIC_DAY	1	0	2010-03-14	2241	\N	139499	\N
189100	GENERIC_DAY	1	1	2010-02-26	2245	\N	139499	\N
188947	GENERIC_DAY	1	1	2010-04-19	2235	\N	139499	\N
187916	GENERIC_DAY	1	0	2010-08-06	2237	\N	139499	\N
188463	GENERIC_DAY	1	0	2010-07-01	2229	\N	139499	\N
189940	GENERIC_DAY	1	0	2010-04-12	2231	\N	139499	\N
187639	GENERIC_DAY	1	1	2010-06-25	2245	\N	139499	\N
188931	GENERIC_DAY	1	0	2010-06-01	2223	\N	139499	\N
189619	GENERIC_DAY	1	1	2010-03-03	2237	\N	139499	\N
189527	GENERIC_DAY	1	1	2010-05-24	2251	\N	139499	\N
188413	GENERIC_DAY	1	0	2010-05-09	2241	\N	139499	\N
189897	GENERIC_DAY	1	0	2010-02-21	2235	\N	139499	\N
189862	GENERIC_DAY	1	0	2010-08-08	2223	\N	139499	\N
189264	GENERIC_DAY	1	0	2010-03-02	2235	\N	139499	\N
188717	GENERIC_DAY	1	0	2010-05-09	2245	\N	139499	\N
188743	GENERIC_DAY	1	0	2010-07-17	2247	\N	139499	\N
188038	GENERIC_DAY	1	0	2010-08-02	2241	\N	139499	\N
187784	GENERIC_DAY	1	0	2010-05-23	2235	\N	139499	\N
189984	GENERIC_DAY	1	0	2010-07-18	2239	\N	139499	\N
188746	GENERIC_DAY	1	0	2010-08-09	2223	\N	139499	\N
187567	GENERIC_DAY	1	0	2010-08-09	2241	\N	139499	\N
188439	GENERIC_DAY	1	1	2010-04-12	2245	\N	139499	\N
189357	GENERIC_DAY	1	0	2010-08-19	2247	\N	139499	\N
188492	GENERIC_DAY	1	0	2010-05-20	2223	\N	139499	\N
188093	GENERIC_DAY	1	0	2010-07-23	2239	\N	139499	\N
189916	GENERIC_DAY	1	1	2010-02-25	2229	\N	139499	\N
188631	GENERIC_DAY	1	1	2010-08-12	2237	\N	139499	\N
189635	GENERIC_DAY	1	0	2010-07-31	2241	\N	139499	\N
188679	GENERIC_DAY	1	1	2010-04-19	2233	\N	139499	\N
188066	GENERIC_DAY	1	0	2010-06-05	2251	\N	139499	\N
189816	GENERIC_DAY	1	1	2010-06-29	2247	\N	139499	\N
189389	GENERIC_DAY	1	1	2010-06-09	2249	\N	139499	\N
190044	GENERIC_DAY	1	0	2010-06-27	2223	\N	139499	\N
187787	GENERIC_DAY	1	0	2010-07-25	2237	\N	139499	\N
187739	GENERIC_DAY	1	1	2010-07-22	2247	\N	139499	\N
188116	GENERIC_DAY	1	1	2010-08-05	2235	\N	139499	\N
188827	GENERIC_DAY	1	0	2010-07-16	2237	\N	139499	\N
189923	GENERIC_DAY	1	0	2010-03-18	2235	\N	139499	\N
189182	GENERIC_DAY	1	1	2010-05-14	2231	\N	139499	\N
189086	GENERIC_DAY	1	1	2010-03-26	2241	\N	139499	\N
190034	GENERIC_DAY	1	0	2010-07-03	2235	\N	139499	\N
188013	GENERIC_DAY	1	0	2010-06-20	2243	\N	139499	\N
189963	GENERIC_DAY	1	0	2010-03-21	2235	\N	139499	\N
187647	GENERIC_DAY	1	0	2010-02-25	2231	\N	139499	\N
188355	GENERIC_DAY	1	0	2010-02-22	2233	\N	139499	\N
188707	GENERIC_DAY	1	0	2010-08-22	2223	\N	139499	\N
189583	GENERIC_DAY	1	1	2010-07-22	2251	\N	139499	\N
189121	GENERIC_DAY	1	0	2010-02-23	2243	\N	139499	\N
188663	GENERIC_DAY	1	0	2010-05-24	2223	\N	139499	\N
187655	GENERIC_DAY	1	0	2010-06-01	2239	\N	139499	\N
188127	GENERIC_DAY	1	1	2010-07-21	2233	\N	139499	\N
189503	GENERIC_DAY	1	0	2010-04-17	2249	\N	139499	\N
189957	GENERIC_DAY	1	0	2010-03-07	2237	\N	139499	\N
188901	GENERIC_DAY	1	0	2010-05-09	2223	\N	139499	\N
188615	GENERIC_DAY	1	0	2010-03-20	2233	\N	139499	\N
189905	GENERIC_DAY	1	1	2010-06-09	2233	\N	139499	\N
189114	GENERIC_DAY	1	1	2010-07-29	2247	\N	139499	\N
187712	GENERIC_DAY	1	0	2010-05-18	2225	\N	139499	\N
188484	GENERIC_DAY	1	1	2010-07-26	2249	\N	139499	\N
188977	GENERIC_DAY	1	0	2010-07-31	2249	\N	139499	\N
189891	GENERIC_DAY	1	0	2010-03-06	2239	\N	139499	\N
189696	GENERIC_DAY	1	0	2010-06-20	2231	\N	139499	\N
188920	GENERIC_DAY	1	0	2010-08-21	2233	\N	139499	\N
188676	GENERIC_DAY	1	0	2010-03-27	2229	\N	139499	\N
188889	GENERIC_DAY	1	1	2010-05-13	2233	\N	139499	\N
189317	GENERIC_DAY	1	0	2010-07-27	2225	\N	139499	\N
189135	GENERIC_DAY	1	1	2010-06-03	2237	\N	139499	\N
187535	GENERIC_DAY	1	0	2010-04-29	2229	\N	139499	\N
189223	GENERIC_DAY	1	1	2010-04-30	2223	\N	139499	\N
189852	GENERIC_DAY	1	1	2010-07-27	2237	\N	139499	\N
189010	GENERIC_DAY	1	1	2010-05-06	2247	\N	139499	\N
189967	GENERIC_DAY	1	0	2010-05-14	2249	\N	139499	\N
189911	GENERIC_DAY	1	0	2010-05-20	2225	\N	139499	\N
188672	GENERIC_DAY	1	0	2010-06-06	2243	\N	139499	\N
188756	GENERIC_DAY	1	1	2010-06-29	2233	\N	139499	\N
189263	GENERIC_DAY	1	0	2010-07-09	2247	\N	139499	\N
187814	GENERIC_DAY	1	0	2010-06-11	2235	\N	139499	\N
189971	GENERIC_DAY	1	0	2010-02-19	2231	\N	139499	\N
188241	GENERIC_DAY	1	1	2010-06-30	2251	\N	139499	\N
187931	GENERIC_DAY	1	0	2010-03-24	2243	\N	139499	\N
188398	GENERIC_DAY	1	0	2010-08-21	2247	\N	139499	\N
189531	GENERIC_DAY	1	0	2010-05-08	2251	\N	139499	\N
188419	GENERIC_DAY	1	0	2010-04-16	2225	\N	139499	\N
187715	GENERIC_DAY	1	0	2010-04-05	2235	\N	139499	\N
187815	GENERIC_DAY	1	0	2010-02-28	2231	\N	139499	\N
188311	GENERIC_DAY	1	0	2010-05-08	2229	\N	139499	\N
187920	GENERIC_DAY	1	0	2010-07-04	2251	\N	139499	\N
187437	GENERIC_DAY	1	0	2010-04-27	2239	\N	139499	\N
189025	GENERIC_DAY	1	0	2010-06-19	2247	\N	139499	\N
188004	GENERIC_DAY	1	1	2010-03-26	2223	\N	139499	\N
188253	GENERIC_DAY	1	0	2010-04-04	2251	\N	139499	\N
188552	GENERIC_DAY	1	0	2010-08-14	2251	\N	139499	\N
189029	GENERIC_DAY	1	1	2010-03-09	2229	\N	139499	\N
188401	GENERIC_DAY	1	1	2010-03-25	2223	\N	139499	\N
188711	GENERIC_DAY	1	0	2010-03-01	2233	\N	139499	\N
189752	GENERIC_DAY	1	0	2010-05-23	2241	\N	139499	\N
188435	GENERIC_DAY	1	0	2010-07-28	2231	\N	139499	\N
189840	GENERIC_DAY	1	0	2010-03-14	2237	\N	139499	\N
187922	GENERIC_DAY	1	0	2010-02-23	2235	\N	139499	\N
188077	GENERIC_DAY	1	0	2010-04-25	2237	\N	139499	\N
189347	GENERIC_DAY	1	0	2010-05-24	2229	\N	139499	\N
189094	GENERIC_DAY	1	2	2010-03-24	2251	\N	139499	\N
187587	GENERIC_DAY	1	0	2010-03-13	2249	\N	139499	\N
189474	GENERIC_DAY	1	0	2010-08-14	2245	\N	139499	\N
188420	GENERIC_DAY	1	0	2010-06-12	2229	\N	139499	\N
187669	GENERIC_DAY	1	1	2010-02-17	2229	\N	139499	\N
189000	GENERIC_DAY	1	1	2010-08-19	2239	\N	139499	\N
188989	GENERIC_DAY	1	1	2010-07-14	2245	\N	139499	\N
189888	GENERIC_DAY	1	1	2010-06-08	2235	\N	139499	\N
188814	GENERIC_DAY	1	1	2010-08-09	2251	\N	139499	\N
188985	GENERIC_DAY	1	1	2010-07-22	2245	\N	139499	\N
189662	GENERIC_DAY	1	0	2010-06-14	2241	\N	139499	\N
188719	GENERIC_DAY	1	1	2010-06-02	2247	\N	139499	\N
189755	GENERIC_DAY	1	0	2010-04-14	2231	\N	139499	\N
189458	GENERIC_DAY	1	0	2010-03-29	2235	\N	139499	\N
188577	GENERIC_DAY	1	0	2010-05-27	2239	\N	139499	\N
189748	GENERIC_DAY	1	0	2010-02-26	2225	\N	139499	\N
189430	GENERIC_DAY	1	0	2010-04-15	2229	\N	139499	\N
189004	GENERIC_DAY	1	0	2010-07-29	2223	\N	139499	\N
188497	GENERIC_DAY	1	1	2010-07-08	2243	\N	139499	\N
188652	GENERIC_DAY	1	1	2010-05-10	2235	\N	139499	\N
189661	GENERIC_DAY	1	0	2010-03-15	2247	\N	139499	\N
189207	GENERIC_DAY	1	1	2010-04-28	2243	\N	139499	\N
189274	GENERIC_DAY	1	1	2010-08-20	2251	\N	139499	\N
189865	GENERIC_DAY	1	0	2010-08-16	2249	\N	139499	\N
188982	GENERIC_DAY	1	0	2010-06-28	2239	\N	139499	\N
189745	GENERIC_DAY	1	1	2010-08-13	2243	\N	139499	\N
188094	GENERIC_DAY	1	1	2010-08-05	2233	\N	139499	\N
187776	GENERIC_DAY	1	1	2010-02-24	2237	\N	139499	\N
188732	GENERIC_DAY	1	0	2010-08-11	2251	\N	139499	\N
188327	GENERIC_DAY	1	1	2010-07-22	2235	\N	139499	\N
187896	GENERIC_DAY	1	1	2010-03-24	2245	\N	139499	\N
189708	GENERIC_DAY	1	0	2010-06-19	2239	\N	139499	\N
189376	GENERIC_DAY	1	0	2010-05-24	2225	\N	139499	\N
187706	GENERIC_DAY	1	0	2010-04-29	2241	\N	139499	\N
188044	GENERIC_DAY	1	0	2010-06-20	2235	\N	139499	\N
189987	GENERIC_DAY	1	1	2010-08-16	2241	\N	139499	\N
189276	GENERIC_DAY	1	0	2010-05-01	2231	\N	139499	\N
187530	GENERIC_DAY	1	0	2010-05-26	2229	\N	139499	\N
189243	GENERIC_DAY	1	0	2010-06-27	2243	\N	139499	\N
188022	GENERIC_DAY	1	0	2010-06-27	2233	\N	139499	\N
189763	GENERIC_DAY	1	1	2010-05-19	2243	\N	139499	\N
189697	GENERIC_DAY	1	0	2010-07-17	2223	\N	139499	\N
189502	GENERIC_DAY	1	0	2010-05-04	2231	\N	139499	\N
189621	GENERIC_DAY	1	0	2010-02-17	2243	\N	139499	\N
189515	GENERIC_DAY	1	1	2010-05-06	2245	\N	139499	\N
188736	GENERIC_DAY	1	0	2010-06-12	2225	\N	139499	\N
188578	GENERIC_DAY	1	0	2010-08-22	2225	\N	139499	\N
189769	GENERIC_DAY	1	1	2010-05-21	2223	\N	139499	\N
188645	GENERIC_DAY	1	0	2010-05-03	2223	\N	139499	\N
187740	GENERIC_DAY	1	2	2010-03-22	2241	\N	139499	\N
188220	GENERIC_DAY	1	1	2010-05-03	2249	\N	139499	\N
189149	GENERIC_DAY	1	1	2010-04-06	2243	\N	139499	\N
190014	GENERIC_DAY	1	0	2010-07-24	2231	\N	139499	\N
188530	GENERIC_DAY	1	0	2010-05-22	2251	\N	139499	\N
188841	GENERIC_DAY	1	1	2010-08-09	2245	\N	139499	\N
189272	GENERIC_DAY	1	1	2010-05-31	2245	\N	139499	\N
189884	GENERIC_DAY	1	0	2010-07-20	2225	\N	139499	\N
189777	GENERIC_DAY	1	0	2010-08-21	2239	\N	139499	\N
189523	GENERIC_DAY	1	0	2010-05-18	2223	\N	139499	\N
187696	GENERIC_DAY	1	0	2010-08-09	2229	\N	139499	\N
188894	GENERIC_DAY	1	0	2010-07-16	2251	\N	139499	\N
188638	GENERIC_DAY	1	0	2010-08-14	2241	\N	139499	\N
189936	GENERIC_DAY	1	1	2010-06-14	2251	\N	139499	\N
189306	GENERIC_DAY	1	0	2010-04-08	2225	\N	139499	\N
189403	GENERIC_DAY	1	1	2010-07-07	2249	\N	139499	\N
189968	GENERIC_DAY	1	0	2010-08-21	2241	\N	139499	\N
189642	GENERIC_DAY	1	0	2010-04-04	2231	\N	139499	\N
188175	GENERIC_DAY	1	1	2010-05-19	2249	\N	139499	\N
188067	GENERIC_DAY	1	0	2010-02-20	2251	\N	139499	\N
188622	GENERIC_DAY	1	1	2010-05-26	2251	\N	139499	\N
189630	GENERIC_DAY	1	1	2010-03-01	2245	\N	139499	\N
189033	GENERIC_DAY	1	0	2010-08-15	2243	\N	139499	\N
187548	GENERIC_DAY	1	0	2010-04-18	2247	\N	139499	\N
189270	GENERIC_DAY	1	1	2010-04-09	2231	\N	139499	\N
188299	GENERIC_DAY	1	0	2010-03-12	2239	\N	139499	\N
187622	GENERIC_DAY	1	0	2010-07-24	2233	\N	139499	\N
188441	GENERIC_DAY	1	1	2010-03-18	2229	\N	139499	\N
189598	GENERIC_DAY	1	1	2010-08-09	2249	\N	139499	\N
189016	GENERIC_DAY	1	0	2010-06-15	2239	\N	139499	\N
189747	GENERIC_DAY	1	0	2010-06-28	2231	\N	139499	\N
187608	GENERIC_DAY	1	0	2010-05-02	2243	\N	139499	\N
188406	GENERIC_DAY	1	0	2010-08-04	2223	\N	139499	\N
189676	GENERIC_DAY	1	0	2010-03-11	2225	\N	139499	\N
187488	GENERIC_DAY	1	0	2010-06-29	2225	\N	139499	\N
188088	GENERIC_DAY	1	0	2010-02-25	2243	\N	139499	\N
188563	GENERIC_DAY	1	0	2010-04-20	2229	\N	139499	\N
187828	GENERIC_DAY	1	1	2010-05-20	2251	\N	139499	\N
189845	GENERIC_DAY	1	0	2010-05-29	2233	\N	139499	\N
189449	GENERIC_DAY	1	1	2010-06-23	2245	\N	139499	\N
189212	GENERIC_DAY	1	1	2010-05-07	2233	\N	139499	\N
187798	GENERIC_DAY	1	0	2010-07-12	2229	\N	139499	\N
188673	GENERIC_DAY	1	0	2010-04-25	2223	\N	139499	\N
188308	GENERIC_DAY	1	0	2010-08-06	2239	\N	139499	\N
189517	GENERIC_DAY	1	0	2010-08-11	2225	\N	139499	\N
188811	GENERIC_DAY	1	1	2010-05-31	2247	\N	139499	\N
189275	GENERIC_DAY	1	0	2010-07-31	2225	\N	139499	\N
187879	GENERIC_DAY	1	0	2010-07-18	2251	\N	139499	\N
189048	GENERIC_DAY	1	1	2010-05-26	2235	\N	139499	\N
188180	GENERIC_DAY	1	1	2010-05-05	2237	\N	139499	\N
187832	GENERIC_DAY	1	1	2010-04-23	2233	\N	139499	\N
188967	GENERIC_DAY	1	0	2010-04-26	2241	\N	139499	\N
187462	GENERIC_DAY	1	1	2010-05-27	2245	\N	139499	\N
189689	GENERIC_DAY	1	2	2010-03-02	2241	\N	139499	\N
189417	GENERIC_DAY	1	0	2010-08-08	2245	\N	139499	\N
189342	GENERIC_DAY	1	0	2010-03-25	2247	\N	139499	\N
187463	GENERIC_DAY	1	0	2010-07-24	2249	\N	139499	\N
189524	GENERIC_DAY	1	0	2010-03-28	2247	\N	139499	\N
188955	GENERIC_DAY	1	0	2010-04-10	2239	\N	139499	\N
188246	GENERIC_DAY	1	0	2010-03-07	2239	\N	139499	\N
189514	GENERIC_DAY	1	1	2010-02-19	2229	\N	139499	\N
188564	GENERIC_DAY	1	1	2010-04-27	2237	\N	139499	\N
188703	GENERIC_DAY	1	0	2010-05-08	2241	\N	139499	\N
189617	GENERIC_DAY	1	0	2010-07-19	2239	\N	139499	\N
187665	GENERIC_DAY	1	0	2010-05-20	2231	\N	139499	\N
188062	GENERIC_DAY	1	1	2010-06-10	2233	\N	139499	\N
187590	GENERIC_DAY	1	1	2010-07-19	2243	\N	139499	\N
187439	GENERIC_DAY	1	1	2010-05-20	2249	\N	139499	\N
188516	GENERIC_DAY	1	0	2010-08-13	2231	\N	139499	\N
187995	GENERIC_DAY	1	1	2010-04-06	2241	\N	139499	\N
189904	GENERIC_DAY	1	0	2010-02-18	2233	\N	139499	\N
189396	GENERIC_DAY	1	0	2010-07-22	2241	\N	139499	\N
189082	GENERIC_DAY	1	0	2010-05-09	2247	\N	139499	\N
189246	GENERIC_DAY	1	1	2010-07-21	2245	\N	139499	\N
188754	GENERIC_DAY	1	0	2010-05-04	2225	\N	139499	\N
187797	GENERIC_DAY	1	1	2010-04-22	2249	\N	139499	\N
188771	GENERIC_DAY	1	1	2010-03-25	2237	\N	139499	\N
189076	GENERIC_DAY	1	1	2010-06-04	2229	\N	139499	\N
187487	GENERIC_DAY	1	0	2010-03-23	2247	\N	139499	\N
189462	GENERIC_DAY	1	0	2010-03-13	2235	\N	139499	\N
187809	GENERIC_DAY	1	0	2010-03-14	2225	\N	139499	\N
188646	GENERIC_DAY	1	0	2010-04-22	2241	\N	139499	\N
187760	GENERIC_DAY	1	1	2010-06-01	2233	\N	139499	\N
189102	GENERIC_DAY	1	0	2010-03-06	2243	\N	139499	\N
189511	GENERIC_DAY	1	0	2010-03-18	2247	\N	139499	\N
188010	GENERIC_DAY	1	0	2010-07-18	2235	\N	139499	\N
187774	GENERIC_DAY	1	0	2010-06-04	2243	\N	139499	\N
189271	GENERIC_DAY	1	0	2010-05-02	2239	\N	139499	\N
188321	GENERIC_DAY	1	0	2010-06-18	2251	\N	139499	\N
190048	GENERIC_DAY	1	0	2010-02-22	2243	\N	139499	\N
188546	GENERIC_DAY	1	1	2010-06-21	2237	\N	139499	\N
188362	GENERIC_DAY	1	1	2010-08-10	2247	\N	139499	\N
188655	GENERIC_DAY	1	0	2010-03-15	2249	\N	139499	\N
189544	GENERIC_DAY	1	0	2010-08-17	2231	\N	139499	\N
189794	GENERIC_DAY	1	1	2010-07-07	2251	\N	139499	\N
189529	GENERIC_DAY	1	0	2010-08-24	2225	\N	139499	\N
189469	GENERIC_DAY	1	0	2010-04-12	2233	\N	139499	\N
187464	GENERIC_DAY	1	1	2010-07-23	2245	\N	139499	\N
188813	GENERIC_DAY	1	1	2010-05-20	2233	\N	139499	\N
189349	GENERIC_DAY	1	1	2010-05-28	2223	\N	139499	\N
189179	GENERIC_DAY	1	0	2010-03-19	2243	\N	139499	\N
188152	GENERIC_DAY	1	0	2010-05-12	2225	\N	139499	\N
189946	GENERIC_DAY	1	1	2010-08-17	2229	\N	139499	\N
189882	GENERIC_DAY	1	0	2010-03-02	2225	\N	139499	\N
187871	GENERIC_DAY	1	0	2010-08-07	2233	\N	139499	\N
188285	GENERIC_DAY	1	1	2010-02-18	2229	\N	139499	\N
189796	GENERIC_DAY	1	0	2010-04-18	2231	\N	139499	\N
189411	GENERIC_DAY	1	1	2010-06-08	2249	\N	139499	\N
188029	GENERIC_DAY	1	1	2010-05-25	2245	\N	139499	\N
187493	GENERIC_DAY	1	1	2010-06-21	2249	\N	139499	\N
189966	GENERIC_DAY	1	0	2010-04-24	2243	\N	139499	\N
189543	GENERIC_DAY	1	1	2010-06-18	2233	\N	139499	\N
187428	GENERIC_DAY	1	0	2010-03-05	2225	\N	139499	\N
187942	GENERIC_DAY	1	1	2010-08-06	2231	\N	139499	\N
187890	GENERIC_DAY	1	0	2010-03-02	2233	\N	139499	\N
187722	GENERIC_DAY	1	0	2010-03-31	2233	\N	139499	\N
187769	GENERIC_DAY	1	1	2010-08-09	2237	\N	139499	\N
188623	GENERIC_DAY	1	0	2010-08-01	2243	\N	139499	\N
188687	GENERIC_DAY	1	0	2010-06-10	2239	\N	139499	\N
189883	GENERIC_DAY	1	1	2010-05-24	2245	\N	139499	\N
189229	GENERIC_DAY	1	1	2010-04-09	2243	\N	139499	\N
187735	GENERIC_DAY	1	1	2010-06-16	2249	\N	139499	\N
188975	GENERIC_DAY	1	1	2010-07-20	2247	\N	139499	\N
187478	GENERIC_DAY	1	1	2010-03-25	2229	\N	139499	\N
189318	GENERIC_DAY	1	1	2010-06-29	2249	\N	139499	\N
189205	GENERIC_DAY	1	0	2010-04-19	2239	\N	139499	\N
188012	GENERIC_DAY	1	1	2010-04-13	2251	\N	139499	\N
188065	GENERIC_DAY	1	0	2010-05-23	2251	\N	139499	\N
188780	GENERIC_DAY	1	0	2010-06-12	2249	\N	139499	\N
187573	GENERIC_DAY	1	0	2010-06-26	2251	\N	139499	\N
188058	GENERIC_DAY	1	0	2010-07-17	2235	\N	139499	\N
188744	GENERIC_DAY	1	1	2010-05-11	2245	\N	139499	\N
189405	GENERIC_DAY	1	0	2010-07-24	2247	\N	139499	\N
188834	GENERIC_DAY	1	1	2010-05-13	2237	\N	139499	\N
187738	GENERIC_DAY	1	1	2010-04-27	2243	\N	139499	\N
189113	GENERIC_DAY	1	0	2010-05-01	2241	\N	139499	\N
187455	GENERIC_DAY	1	0	2010-03-31	2231	\N	139499	\N
187631	GENERIC_DAY	1	0	2010-03-12	2231	\N	139499	\N
187878	GENERIC_DAY	1	1	2010-07-16	2229	\N	139499	\N
189077	GENERIC_DAY	1	1	2010-07-16	2241	\N	139499	\N
189350	GENERIC_DAY	1	1	2010-03-11	2245	\N	139499	\N
187895	GENERIC_DAY	1	0	2010-02-20	2249	\N	139499	\N
187842	GENERIC_DAY	1	0	2010-05-24	2231	\N	139499	\N
187788	GENERIC_DAY	1	0	2010-07-15	2223	\N	139499	\N
189579	GENERIC_DAY	1	0	2010-06-28	2241	\N	139499	\N
189055	GENERIC_DAY	1	0	2010-06-13	2237	\N	139499	\N
187756	GENERIC_DAY	1	0	2010-02-16	2233	\N	139499	\N
189591	GENERIC_DAY	1	1	2010-03-08	2229	\N	139499	\N
190007	GENERIC_DAY	1	0	2010-05-31	2239	\N	139499	\N
187978	GENERIC_DAY	1	0	2010-05-23	2225	\N	139499	\N
189671	GENERIC_DAY	1	1	2010-08-17	2239	\N	139499	\N
188599	GENERIC_DAY	1	1	2010-07-15	2245	\N	139499	\N
189663	GENERIC_DAY	1	0	2010-04-22	2229	\N	139499	\N
188284	GENERIC_DAY	1	0	2010-03-03	2247	\N	139499	\N
188657	GENERIC_DAY	1	1	2010-06-16	2247	\N	139499	\N
190057	GENERIC_DAY	1	1	2010-06-29	2235	\N	139499	\N
189907	GENERIC_DAY	1	0	2010-03-14	2251	\N	139499	\N
188624	GENERIC_DAY	1	0	2010-05-30	2239	\N	139499	\N
188661	GENERIC_DAY	1	0	2010-06-02	2231	\N	139499	\N
189262	GENERIC_DAY	1	1	2010-06-25	2241	\N	139499	\N
188639	GENERIC_DAY	1	0	2010-07-08	2229	\N	139499	\N
187558	GENERIC_DAY	1	1	2010-02-19	2237	\N	139499	\N
189741	GENERIC_DAY	1	0	2010-02-21	2243	\N	139499	\N
187823	GENERIC_DAY	1	0	2010-06-16	2231	\N	139499	\N
188926	GENERIC_DAY	1	0	2010-04-25	2225	\N	139499	\N
188026	GENERIC_DAY	1	0	2010-03-19	2239	\N	139499	\N
189242	GENERIC_DAY	1	0	2010-05-30	2249	\N	139499	\N
189002	GENERIC_DAY	1	0	2010-06-12	2223	\N	139499	\N
188283	GENERIC_DAY	1	0	2010-03-21	2247	\N	139499	\N
187724	GENERIC_DAY	1	0	2010-07-09	2239	\N	139499	\N
188279	GENERIC_DAY	1	0	2010-07-10	2245	\N	139499	\N
187693	GENERIC_DAY	1	1	2010-03-01	2237	\N	139499	\N
189742	GENERIC_DAY	1	1	2010-07-28	2243	\N	139499	\N
188303	GENERIC_DAY	1	0	2010-07-04	2241	\N	139499	\N
187682	GENERIC_DAY	1	0	2010-04-05	2225	\N	139499	\N
188684	GENERIC_DAY	1	1	2010-07-09	2229	\N	139499	\N
187444	GENERIC_DAY	1	0	2010-06-16	2241	\N	139499	\N
188395	GENERIC_DAY	1	0	2010-04-11	2235	\N	139499	\N
189494	GENERIC_DAY	1	1	2010-07-07	2237	\N	139499	\N
188079	GENERIC_DAY	1	0	2010-08-18	2249	\N	139499	\N
189225	GENERIC_DAY	1	1	2010-08-23	2237	\N	139499	\N
188938	GENERIC_DAY	1	1	2010-03-31	2245	\N	139499	\N
187822	GENERIC_DAY	1	1	2010-08-18	2239	\N	139499	\N
188234	GENERIC_DAY	1	0	2010-04-26	2229	\N	139499	\N
189665	GENERIC_DAY	1	0	2010-03-16	2247	\N	139499	\N
187748	GENERIC_DAY	1	0	2010-04-03	2241	\N	139499	\N
187441	GENERIC_DAY	1	2	2010-02-18	2241	\N	139499	\N
187858	GENERIC_DAY	1	0	2010-07-05	2229	\N	139499	\N
189111	GENERIC_DAY	1	1	2010-05-03	2233	\N	139499	\N
187606	GENERIC_DAY	1	0	2010-08-17	2249	\N	139499	\N
189725	GENERIC_DAY	1	0	2010-06-01	2229	\N	139499	\N
188273	GENERIC_DAY	1	1	2010-03-09	2241	\N	139499	\N
190056	GENERIC_DAY	1	0	2010-04-18	2251	\N	139499	\N
189189	GENERIC_DAY	1	1	2010-06-11	2245	\N	139499	\N
187468	GENERIC_DAY	1	1	2010-03-26	2245	\N	139499	\N
188123	GENERIC_DAY	1	0	2010-04-14	2233	\N	139499	\N
187837	GENERIC_DAY	1	0	2010-05-23	2247	\N	139499	\N
187758	GENERIC_DAY	1	1	2010-07-05	2251	\N	139499	\N
188291	GENERIC_DAY	1	0	2010-08-11	2243	\N	139499	\N
189112	GENERIC_DAY	1	0	2010-04-10	2249	\N	139499	\N
189484	GENERIC_DAY	1	0	2010-04-03	2223	\N	139499	\N
189618	GENERIC_DAY	1	0	2010-07-11	2233	\N	139499	\N
187873	GENERIC_DAY	1	1	2010-04-22	2251	\N	139499	\N
189827	GENERIC_DAY	1	0	2010-07-29	2231	\N	139499	\N
188708	GENERIC_DAY	1	0	2010-07-22	2239	\N	139499	\N
189694	GENERIC_DAY	1	0	2010-05-31	2229	\N	139499	\N
188848	GENERIC_DAY	1	0	2010-07-10	2249	\N	139499	\N
189890	GENERIC_DAY	1	0	2010-06-30	2225	\N	139499	\N
188415	GENERIC_DAY	1	1	2010-07-30	2231	\N	139499	\N
188479	GENERIC_DAY	1	0	2010-02-24	2239	\N	139499	\N
189498	GENERIC_DAY	1	0	2010-03-23	2235	\N	139499	\N
189444	GENERIC_DAY	1	0	2010-03-20	2239	\N	139499	\N
188870	GENERIC_DAY	1	0	2010-08-18	2243	\N	139499	\N
189778	GENERIC_DAY	1	0	2010-07-26	2225	\N	139499	\N
187914	GENERIC_DAY	1	0	2010-06-16	2225	\N	139499	\N
187893	GENERIC_DAY	1	0	2010-06-26	2241	\N	139499	\N
188531	GENERIC_DAY	1	1	2010-08-03	2233	\N	139499	\N
187489	GENERIC_DAY	1	1	2010-06-23	2247	\N	139499	\N
189290	GENERIC_DAY	1	0	2010-06-02	2241	\N	139499	\N
188157	GENERIC_DAY	1	1	2010-08-05	2249	\N	139499	\N
188831	GENERIC_DAY	1	0	2010-07-11	2231	\N	139499	\N
189227	GENERIC_DAY	1	1	2010-04-06	2251	\N	139499	\N
187678	GENERIC_DAY	1	0	2010-08-10	2239	\N	139499	\N
189011	GENERIC_DAY	1	0	2010-07-07	2239	\N	139499	\N
187583	GENERIC_DAY	1	0	2010-04-17	2239	\N	139499	\N
187841	GENERIC_DAY	1	1	2010-04-22	2233	\N	139499	\N
190030	GENERIC_DAY	1	0	2010-02-25	2239	\N	139499	\N
189261	GENERIC_DAY	1	2	2010-03-08	2223	\N	139499	\N
188747	GENERIC_DAY	1	1	2010-05-05	2249	\N	139499	\N
189279	GENERIC_DAY	1	0	2010-03-09	2233	\N	139499	\N
188854	GENERIC_DAY	1	1	2010-06-07	2245	\N	139499	\N
188941	GENERIC_DAY	1	0	2010-05-18	2241	\N	139499	\N
189042	GENERIC_DAY	1	0	2010-04-29	2225	\N	139499	\N
187786	GENERIC_DAY	1	0	2010-04-09	2225	\N	139499	\N
188628	GENERIC_DAY	1	1	2010-03-12	2241	\N	139499	\N
187416	GENERIC_DAY	1	0	2010-04-17	2231	\N	139499	\N
187789	GENERIC_DAY	1	0	2010-06-21	2223	\N	139499	\N
190010	GENERIC_DAY	1	0	2010-05-26	2231	\N	139499	\N
190028	GENERIC_DAY	1	0	2010-07-02	2225	\N	139499	\N
188167	GENERIC_DAY	1	0	2010-06-28	2223	\N	139499	\N
189185	GENERIC_DAY	1	0	2010-05-15	2245	\N	139499	\N
189787	GENERIC_DAY	1	0	2010-05-29	2237	\N	139499	\N
188151	GENERIC_DAY	1	0	2010-06-26	2233	\N	139499	\N
188452	GENERIC_DAY	1	0	2010-04-02	2233	\N	139499	\N
189942	GENERIC_DAY	1	0	2010-04-01	2225	\N	139499	\N
188620	GENERIC_DAY	1	1	2010-06-17	2251	\N	139499	\N
189636	GENERIC_DAY	1	0	2010-06-26	2229	\N	139499	\N
187818	GENERIC_DAY	1	0	2010-03-11	2233	\N	139499	\N
188502	GENERIC_DAY	1	0	2010-03-04	2243	\N	139499	\N
188785	GENERIC_DAY	1	0	2010-06-27	2247	\N	139499	\N
188586	GENERIC_DAY	1	0	2010-07-05	2223	\N	139499	\N
189066	GENERIC_DAY	1	0	2010-05-06	2241	\N	139499	\N
188242	GENERIC_DAY	1	0	2010-08-15	2239	\N	139499	\N
189584	GENERIC_DAY	1	0	2010-07-28	2241	\N	139499	\N
188124	GENERIC_DAY	1	0	2010-06-05	2235	\N	139499	\N
187507	GENERIC_DAY	1	0	2010-04-24	2249	\N	139499	\N
189107	GENERIC_DAY	1	0	2010-05-17	2237	\N	139499	\N
188482	GENERIC_DAY	1	2	2010-03-08	2245	\N	139499	\N
187490	GENERIC_DAY	1	1	2010-04-08	2223	\N	139499	\N
187975	GENERIC_DAY	1	0	2010-06-07	2231	\N	139499	\N
188115	GENERIC_DAY	1	1	2010-08-10	2235	\N	139499	\N
189535	GENERIC_DAY	1	1	2010-07-09	2241	\N	139499	\N
189976	GENERIC_DAY	1	0	2010-04-15	2225	\N	139499	\N
188041	GENERIC_DAY	1	0	2010-02-25	2249	\N	139499	\N
188046	GENERIC_DAY	1	0	2010-04-03	2237	\N	139499	\N
188562	GENERIC_DAY	1	0	2010-03-29	2249	\N	139499	\N
187827	GENERIC_DAY	1	0	2010-07-01	2231	\N	139499	\N
188457	GENERIC_DAY	1	1	2010-06-03	2235	\N	139499	\N
188489	GENERIC_DAY	1	1	2010-02-24	2229	\N	139499	\N
189059	GENERIC_DAY	1	0	2010-07-17	2237	\N	139499	\N
188769	GENERIC_DAY	1	1	2010-03-12	2251	\N	139499	\N
188964	GENERIC_DAY	1	0	2010-06-08	2225	\N	139499	\N
189540	GENERIC_DAY	1	1	2010-03-10	2241	\N	139499	\N
188128	GENERIC_DAY	1	1	2010-04-29	2237	\N	139499	\N
188588	GENERIC_DAY	1	0	2010-04-30	2249	\N	139499	\N
189959	GENERIC_DAY	1	0	2010-03-05	2249	\N	139499	\N
189570	GENERIC_DAY	1	1	2010-04-22	2247	\N	139499	\N
189355	GENERIC_DAY	1	0	2010-06-11	2243	\N	139499	\N
189050	GENERIC_DAY	1	0	2010-08-10	2231	\N	139499	\N
189951	GENERIC_DAY	1	1	2010-07-21	2247	\N	139499	\N
188208	GENERIC_DAY	1	0	2010-05-18	2231	\N	139499	\N
188348	GENERIC_DAY	1	0	2010-05-30	2229	\N	139499	\N
188159	GENERIC_DAY	1	1	2010-06-30	2243	\N	139499	\N
190027	GENERIC_DAY	1	0	2010-08-16	2247	\N	139499	\N
187578	GENERIC_DAY	1	1	2010-07-22	2249	\N	139499	\N
188773	GENERIC_DAY	1	0	2010-08-22	2241	\N	139499	\N
189596	GENERIC_DAY	1	1	2010-05-26	2233	\N	139499	\N
188148	GENERIC_DAY	1	0	2010-06-08	2223	\N	139499	\N
187705	GENERIC_DAY	1	0	2010-06-07	2239	\N	139499	\N
187447	GENERIC_DAY	1	0	2010-08-14	2223	\N	139499	\N
189301	GENERIC_DAY	1	2	2010-02-23	2241	\N	139499	\N
187672	GENERIC_DAY	1	0	2010-04-04	2247	\N	139499	\N
188554	GENERIC_DAY	1	1	2010-04-30	2229	\N	139499	\N
187919	GENERIC_DAY	1	1	2010-03-10	2229	\N	139499	\N
188205	GENERIC_DAY	1	1	2010-03-16	2237	\N	139499	\N
190002	GENERIC_DAY	1	0	2010-07-03	2251	\N	139499	\N
189536	GENERIC_DAY	1	0	2010-06-21	2239	\N	139499	\N
189184	GENERIC_DAY	1	1	2010-06-18	2231	\N	139499	\N
187686	GENERIC_DAY	1	0	2010-05-21	2235	\N	139499	\N
189902	GENERIC_DAY	1	0	2010-04-07	2245	\N	139499	\N
187870	GENERIC_DAY	1	1	2010-07-09	2233	\N	139499	\N
188245	GENERIC_DAY	1	0	2010-06-05	2231	\N	139499	\N
188644	GENERIC_DAY	1	1	2010-05-27	2249	\N	139499	\N
187744	GENERIC_DAY	1	0	2010-03-16	2233	\N	139499	\N
187824	GENERIC_DAY	1	0	2010-07-09	2251	\N	139499	\N
188460	GENERIC_DAY	1	1	2010-05-12	2245	\N	139499	\N
188822	GENERIC_DAY	1	1	2010-04-19	2249	\N	139499	\N
189457	GENERIC_DAY	1	1	2010-07-12	2235	\N	139499	\N
187591	GENERIC_DAY	1	0	2010-03-06	2245	\N	139499	\N
189771	GENERIC_DAY	1	1	2010-04-28	2245	\N	139499	\N
189260	GENERIC_DAY	1	0	2010-05-30	2251	\N	139499	\N
189597	GENERIC_DAY	1	0	2010-08-13	2239	\N	139499	\N
189722	GENERIC_DAY	1	0	2010-07-18	2225	\N	139499	\N
189611	GENERIC_DAY	1	0	2010-05-24	2239	\N	139499	\N
188892	GENERIC_DAY	1	1	2010-07-30	2233	\N	139499	\N
188074	GENERIC_DAY	1	0	2010-06-30	2231	\N	139499	\N
189652	GENERIC_DAY	1	1	2010-05-20	2235	\N	139499	\N
189437	GENERIC_DAY	1	0	2010-07-14	2231	\N	139499	\N
189143	GENERIC_DAY	1	0	2010-07-31	2233	\N	139499	\N
187989	GENERIC_DAY	1	0	2010-02-23	2239	\N	139499	\N
187830	GENERIC_DAY	1	0	2010-08-07	2235	\N	139499	\N
188045	GENERIC_DAY	1	0	2010-06-03	2223	\N	139499	\N
187825	GENERIC_DAY	1	2	2010-02-22	2251	\N	139499	\N
188459	GENERIC_DAY	1	0	2010-05-29	2251	\N	139499	\N
188169	GENERIC_DAY	1	0	2010-02-24	2235	\N	139499	\N
189927	GENERIC_DAY	1	1	2010-04-21	2237	\N	139499	\N
187861	GENERIC_DAY	1	0	2010-03-14	2243	\N	139499	\N
187681	GENERIC_DAY	1	0	2010-07-29	2241	\N	139499	\N
190055	GENERIC_DAY	1	1	2010-07-26	2233	\N	139499	\N
190037	GENERIC_DAY	1	0	2010-03-13	2245	\N	139499	\N
188059	GENERIC_DAY	1	1	2010-08-09	2243	\N	139499	\N
189026	GENERIC_DAY	1	0	2010-03-10	2231	\N	139499	\N
187577	GENERIC_DAY	1	0	2010-08-05	2239	\N	139499	\N
189288	GENERIC_DAY	1	0	2010-04-18	2239	\N	139499	\N
188032	GENERIC_DAY	1	1	2010-07-01	2235	\N	139499	\N
188177	GENERIC_DAY	1	0	2010-03-27	2233	\N	139499	\N
189390	GENERIC_DAY	1	0	2010-03-21	2231	\N	139499	\N
187952	GENERIC_DAY	1	0	2010-03-05	2235	\N	139499	\N
188071	GENERIC_DAY	1	1	2010-04-23	2241	\N	139499	\N
188942	GENERIC_DAY	1	0	2010-08-09	2225	\N	139499	\N
187746	GENERIC_DAY	1	0	2010-08-01	2249	\N	139499	\N
189861	GENERIC_DAY	1	0	2010-08-08	2233	\N	139499	\N
188325	GENERIC_DAY	1	1	2010-07-21	2243	\N	139499	\N
189358	GENERIC_DAY	1	0	2010-03-17	2249	\N	139499	\N
188749	GENERIC_DAY	1	0	2010-05-18	2239	\N	139499	\N
187844	GENERIC_DAY	1	0	2010-07-26	2239	\N	139499	\N
188310	GENERIC_DAY	1	0	2010-06-14	2239	\N	139499	\N
187963	GENERIC_DAY	1	1	2010-06-04	2233	\N	139499	\N
188721	GENERIC_DAY	1	0	2010-07-22	2225	\N	139499	\N
187570	GENERIC_DAY	1	0	2010-04-11	2239	\N	139499	\N
187569	GENERIC_DAY	1	0	2010-02-28	2247	\N	139499	\N
189834	GENERIC_DAY	1	1	2010-03-22	2223	\N	139499	\N
188316	GENERIC_DAY	1	0	2010-06-25	2251	\N	139499	\N
188173	GENERIC_DAY	1	1	2010-06-22	2237	\N	139499	\N
188683	GENERIC_DAY	1	1	2010-02-16	2229	\N	139499	\N
189415	GENERIC_DAY	1	0	2010-03-13	2251	\N	139499	\N
188097	GENERIC_DAY	1	0	2010-06-06	2239	\N	139499	\N
188567	GENERIC_DAY	1	0	2010-07-17	2245	\N	139499	\N
189037	GENERIC_DAY	1	1	2010-04-05	2245	\N	139499	\N
189586	GENERIC_DAY	1	0	2010-05-27	2231	\N	139499	\N
189284	GENERIC_DAY	1	0	2010-04-18	2235	\N	139499	\N
187634	GENERIC_DAY	1	1	2010-07-19	2237	\N	139499	\N
189123	GENERIC_DAY	1	0	2010-05-16	2247	\N	139499	\N
189422	GENERIC_DAY	1	0	2010-06-17	2241	\N	139499	\N
187685	GENERIC_DAY	1	1	2010-08-02	2251	\N	139499	\N
188024	GENERIC_DAY	1	0	2010-07-13	2223	\N	139499	\N
188851	GENERIC_DAY	1	1	2010-08-04	2237	\N	139499	\N
189709	GENERIC_DAY	1	0	2010-05-06	2231	\N	139499	\N
187708	GENERIC_DAY	1	1	2010-06-01	2237	\N	139499	\N
189513	GENERIC_DAY	1	0	2010-06-06	2241	\N	139499	\N
189081	GENERIC_DAY	1	0	2010-08-08	2237	\N	139499	\N
188057	GENERIC_DAY	1	0	2010-08-13	2223	\N	139499	\N
188553	GENERIC_DAY	1	0	2010-07-14	2225	\N	139499	\N
188772	GENERIC_DAY	1	0	2010-07-02	2239	\N	139499	\N
189109	GENERIC_DAY	1	0	2010-04-25	2241	\N	139499	\N
189194	GENERIC_DAY	1	0	2010-07-31	2235	\N	139499	\N
188142	GENERIC_DAY	1	0	2010-03-15	2235	\N	139499	\N
188131	GENERIC_DAY	1	0	2010-06-11	2251	\N	139499	\N
188072	GENERIC_DAY	1	0	2010-07-19	2231	\N	139499	\N
188122	GENERIC_DAY	1	0	2010-06-26	2239	\N	139499	\N
187833	GENERIC_DAY	1	0	2010-07-28	2223	\N	139499	\N
188501	GENERIC_DAY	1	0	2010-06-14	2229	\N	139499	\N
189986	GENERIC_DAY	1	1	2010-05-25	2251	\N	139499	\N
188193	GENERIC_DAY	1	1	2010-07-05	2233	\N	139499	\N
187610	GENERIC_DAY	1	0	2010-06-24	2223	\N	139499	\N
189075	GENERIC_DAY	1	0	2010-03-19	2251	\N	139499	\N
188216	GENERIC_DAY	1	0	2010-03-24	2231	\N	139499	\N
189120	GENERIC_DAY	1	1	2010-02-26	2241	\N	139499	\N
188255	GENERIC_DAY	1	0	2010-08-07	2237	\N	139499	\N
187802	GENERIC_DAY	1	1	2010-05-03	2237	\N	139499	\N
187926	GENERIC_DAY	1	0	2010-03-28	2231	\N	139499	\N
187649	GENERIC_DAY	1	1	2010-05-12	2237	\N	139499	\N
188288	GENERIC_DAY	1	1	2010-02-22	2237	\N	139499	\N
190040	GENERIC_DAY	1	0	2010-07-30	2247	\N	139499	\N
189839	GENERIC_DAY	1	0	2010-07-14	2239	\N	139499	\N
187448	GENERIC_DAY	1	1	2010-06-11	2229	\N	139499	\N
188783	GENERIC_DAY	1	1	2010-08-16	2229	\N	139499	\N
189634	GENERIC_DAY	1	0	2010-08-10	2223	\N	139499	\N
189326	GENERIC_DAY	1	0	2010-08-06	2247	\N	139499	\N
187556	GENERIC_DAY	1	1	2010-08-20	2247	\N	139499	\N
189128	GENERIC_DAY	1	0	2010-06-10	2229	\N	139499	\N
188011	GENERIC_DAY	1	1	2010-03-10	2223	\N	139499	\N
187732	GENERIC_DAY	1	1	2010-06-23	2243	\N	139499	\N
188207	GENERIC_DAY	1	1	2010-05-26	2237	\N	139499	\N
188824	GENERIC_DAY	1	0	2010-03-09	2225	\N	139499	\N
190023	GENERIC_DAY	1	0	2010-03-06	2249	\N	139499	\N
189753	GENERIC_DAY	1	0	2010-07-03	2241	\N	139499	\N
189538	GENERIC_DAY	1	1	2010-05-13	2251	\N	139499	\N
187785	GENERIC_DAY	1	0	2010-03-16	2249	\N	139499	\N
189234	GENERIC_DAY	1	0	2010-06-03	2225	\N	139499	\N
188132	GENERIC_DAY	1	1	2010-03-31	2223	\N	139499	\N
189169	GENERIC_DAY	1	1	2010-05-14	2229	\N	139499	\N
188738	GENERIC_DAY	1	0	2010-03-03	2235	\N	139499	\N
189685	GENERIC_DAY	1	1	2010-02-25	2237	\N	139499	\N
188421	GENERIC_DAY	1	1	2010-04-14	2243	\N	139499	\N
189837	GENERIC_DAY	1	0	2010-04-24	2247	\N	139499	\N
189972	GENERIC_DAY	1	0	2010-05-23	2239	\N	139499	\N
189368	GENERIC_DAY	1	0	2010-03-09	2247	\N	139499	\N
189283	GENERIC_DAY	1	1	2010-04-26	2247	\N	139499	\N
243971	GENERIC_DAY	0	8	2010-12-14	2225	\N	99081	\N
243972	GENERIC_DAY	0	8	2011-06-13	2225	\N	99081	\N
243973	GENERIC_DAY	0	8	2010-07-21	2225	\N	99081	\N
243974	GENERIC_DAY	0	0	2011-06-18	2225	\N	99081	\N
243975	GENERIC_DAY	0	8	2011-08-24	2225	\N	99081	\N
243976	GENERIC_DAY	0	8	2010-04-06	2225	\N	99081	\N
243977	GENERIC_DAY	0	8	2010-08-10	2225	\N	99081	\N
243978	GENERIC_DAY	0	8	2010-05-31	2225	\N	99081	\N
243979	GENERIC_DAY	0	8	2011-05-19	2225	\N	99081	\N
243980	GENERIC_DAY	0	8	2010-06-22	2225	\N	99081	\N
243981	GENERIC_DAY	0	8	2010-09-28	2225	\N	99081	\N
243982	GENERIC_DAY	0	8	2010-09-27	2225	\N	99081	\N
243983	GENERIC_DAY	0	8	2010-09-13	2225	\N	99081	\N
243984	GENERIC_DAY	0	8	2010-05-13	2225	\N	99081	\N
243985	GENERIC_DAY	0	8	2011-05-11	2225	\N	99081	\N
243986	GENERIC_DAY	0	0	2011-01-29	2225	\N	99081	\N
243987	GENERIC_DAY	0	6	2011-07-15	2225	\N	99081	\N
243988	GENERIC_DAY	0	8	2010-07-26	2225	\N	99081	\N
243989	GENERIC_DAY	0	6	2011-04-29	2225	\N	99081	\N
243990	GENERIC_DAY	0	8	2010-05-25	2225	\N	99081	\N
243991	GENERIC_DAY	0	8	2011-01-13	2225	\N	99081	\N
243992	GENERIC_DAY	0	8	2010-05-26	2225	\N	99081	\N
243993	GENERIC_DAY	0	8	2011-09-22	2225	\N	99081	\N
243994	GENERIC_DAY	0	0	2011-06-26	2225	\N	99081	\N
243995	GENERIC_DAY	0	6	2010-07-16	2225	\N	99081	\N
243996	GENERIC_DAY	0	8	2010-11-08	2225	\N	99081	\N
243997	GENERIC_DAY	0	8	2010-09-01	2225	\N	99081	\N
243998	GENERIC_DAY	0	0	2010-08-15	2225	\N	99081	\N
243999	GENERIC_DAY	0	6	2010-06-11	2225	\N	99081	\N
244000	GENERIC_DAY	0	0	2011-05-21	2225	\N	99081	\N
244001	GENERIC_DAY	0	8	2011-03-07	2225	\N	99081	\N
244002	GENERIC_DAY	0	8	2011-07-11	2225	\N	99081	\N
244003	GENERIC_DAY	0	0	2010-12-26	2225	\N	99081	\N
244004	GENERIC_DAY	0	6	2011-01-07	2225	\N	99081	\N
244005	GENERIC_DAY	0	8	2010-07-14	2225	\N	99081	\N
244006	GENERIC_DAY	0	8	2011-06-01	2225	\N	99081	\N
244007	GENERIC_DAY	0	0	2010-10-23	2225	\N	99081	\N
244008	GENERIC_DAY	0	0	2011-04-09	2225	\N	99081	\N
244009	GENERIC_DAY	0	8	2011-01-31	2225	\N	99081	\N
244010	GENERIC_DAY	0	6	2010-04-23	2225	\N	99081	\N
244011	GENERIC_DAY	0	0	2011-01-16	2225	\N	99081	\N
244012	GENERIC_DAY	0	0	2010-04-11	2225	\N	99081	\N
244013	GENERIC_DAY	0	8	2011-07-26	2225	\N	99081	\N
244014	GENERIC_DAY	0	8	2010-10-05	2225	\N	99081	\N
244015	GENERIC_DAY	0	0	2010-07-31	2225	\N	99081	\N
244016	GENERIC_DAY	0	0	2011-05-14	2225	\N	99081	\N
244017	GENERIC_DAY	0	6	2011-02-04	2225	\N	99081	\N
244018	GENERIC_DAY	0	8	2010-08-17	2225	\N	99081	\N
244019	GENERIC_DAY	0	0	2011-01-23	2225	\N	99081	\N
244020	GENERIC_DAY	0	8	2010-08-16	2225	\N	99081	\N
244021	GENERIC_DAY	0	8	2010-10-20	2225	\N	99081	\N
244022	GENERIC_DAY	0	6	2010-11-05	2225	\N	99081	\N
244023	GENERIC_DAY	0	8	2011-03-31	2225	\N	99081	\N
244024	GENERIC_DAY	0	8	2011-03-29	2225	\N	99081	\N
244025	GENERIC_DAY	0	0	2011-05-07	2225	\N	99081	\N
244026	GENERIC_DAY	0	8	2010-06-01	2225	\N	99081	\N
244027	GENERIC_DAY	0	6	2010-10-29	2225	\N	99081	\N
244028	GENERIC_DAY	0	0	2010-07-24	2225	\N	99081	\N
244029	GENERIC_DAY	0	8	2010-11-10	2225	\N	99081	\N
244030	GENERIC_DAY	0	6	2011-08-19	2225	\N	99081	\N
244031	GENERIC_DAY	0	6	2011-07-29	2225	\N	99081	\N
244032	GENERIC_DAY	0	0	2011-08-13	2225	\N	99081	\N
244033	GENERIC_DAY	0	8	2011-07-18	2225	\N	99081	\N
244034	GENERIC_DAY	0	0	2011-07-17	2225	\N	99081	\N
244035	GENERIC_DAY	0	0	2010-07-25	2225	\N	99081	\N
244036	GENERIC_DAY	0	8	2010-04-29	2225	\N	99081	\N
244037	GENERIC_DAY	0	0	2011-03-26	2225	\N	99081	\N
244038	GENERIC_DAY	0	8	2011-08-29	2225	\N	99081	\N
244039	GENERIC_DAY	0	6	2010-08-13	2225	\N	99081	\N
244040	GENERIC_DAY	0	8	2011-03-16	2225	\N	99081	\N
244041	GENERIC_DAY	0	8	2010-07-08	2225	\N	99081	\N
244042	GENERIC_DAY	0	8	2011-01-18	2225	\N	99081	\N
244043	GENERIC_DAY	0	8	2010-11-25	2225	\N	99081	\N
244044	GENERIC_DAY	0	0	2010-05-01	2225	\N	99081	\N
244045	GENERIC_DAY	0	8	2011-01-24	2225	\N	99081	\N
244046	GENERIC_DAY	0	8	2010-06-10	2225	\N	99081	\N
244047	GENERIC_DAY	0	6	2011-06-24	2225	\N	99081	\N
244048	GENERIC_DAY	0	8	2010-04-07	2225	\N	99081	\N
244049	GENERIC_DAY	0	0	2011-08-20	2225	\N	99081	\N
244050	GENERIC_DAY	0	8	2011-06-30	2225	\N	99081	\N
244051	GENERIC_DAY	0	0	2010-08-14	2225	\N	99081	\N
244052	GENERIC_DAY	0	8	2010-11-03	2225	\N	99081	\N
244053	GENERIC_DAY	0	0	2010-05-15	2225	\N	99081	\N
244054	GENERIC_DAY	0	8	2010-06-15	2225	\N	99081	\N
244055	GENERIC_DAY	0	8	2011-06-02	2225	\N	99081	\N
244056	GENERIC_DAY	0	0	2010-03-27	2225	\N	99081	\N
244057	GENERIC_DAY	0	0	2011-05-15	2225	\N	99081	\N
244058	GENERIC_DAY	0	8	2010-10-13	2225	\N	99081	\N
244059	GENERIC_DAY	0	8	2010-10-27	2225	\N	99081	\N
244060	GENERIC_DAY	0	8	2011-06-23	2225	\N	99081	\N
244061	GENERIC_DAY	0	0	2010-05-22	2225	\N	99081	\N
244062	GENERIC_DAY	0	8	2010-09-29	2225	\N	99081	\N
244063	GENERIC_DAY	0	8	2010-07-07	2225	\N	99081	\N
244064	GENERIC_DAY	0	8	2011-08-04	2225	\N	99081	\N
244065	GENERIC_DAY	0	8	2010-04-28	2225	\N	99081	\N
244066	GENERIC_DAY	0	8	2011-08-31	2225	\N	99081	\N
244067	GENERIC_DAY	0	8	2010-09-23	2225	\N	99081	\N
244068	GENERIC_DAY	0	0	2011-03-13	2225	\N	99081	\N
244069	GENERIC_DAY	0	8	2010-09-14	2225	\N	99081	\N
244070	GENERIC_DAY	0	8	2010-10-26	2225	\N	99081	\N
244071	GENERIC_DAY	0	8	2011-04-20	2225	\N	99081	\N
244072	GENERIC_DAY	0	0	2011-04-02	2225	\N	99081	\N
244073	GENERIC_DAY	0	0	2011-02-05	2225	\N	99081	\N
244074	GENERIC_DAY	0	0	2011-08-07	2225	\N	99081	\N
244075	GENERIC_DAY	0	8	2011-06-14	2225	\N	99081	\N
244076	GENERIC_DAY	0	8	2010-08-04	2225	\N	99081	\N
244077	GENERIC_DAY	0	6	2010-09-03	2225	\N	99081	\N
244078	GENERIC_DAY	0	8	2011-05-30	2225	\N	99081	\N
244079	GENERIC_DAY	0	0	2010-09-11	2225	\N	99081	\N
244080	GENERIC_DAY	0	8	2011-09-14	2225	\N	99081	\N
244081	GENERIC_DAY	0	0	2011-02-13	2225	\N	99081	\N
244082	GENERIC_DAY	0	6	2011-09-23	2225	\N	99081	\N
244083	GENERIC_DAY	0	0	2010-12-06	2225	\N	99081	\N
244084	GENERIC_DAY	0	0	2011-07-02	2225	\N	99081	\N
244085	GENERIC_DAY	0	6	2010-06-04	2225	\N	99081	\N
244086	GENERIC_DAY	0	8	2010-12-20	2225	\N	99081	\N
244087	GENERIC_DAY	0	6	2010-10-22	2225	\N	99081	\N
244088	GENERIC_DAY	0	8	2011-05-26	2225	\N	99081	\N
244089	GENERIC_DAY	0	8	2011-05-10	2225	\N	99081	\N
244090	GENERIC_DAY	0	8	2011-01-04	2225	\N	99081	\N
244091	GENERIC_DAY	0	8	2010-11-24	2225	\N	99081	\N
244092	GENERIC_DAY	0	0	2010-05-02	2225	\N	99081	\N
244093	GENERIC_DAY	0	0	2011-01-09	2225	\N	99081	\N
244094	GENERIC_DAY	0	8	2011-05-16	2225	\N	99081	\N
244095	GENERIC_DAY	0	8	2010-09-15	2225	\N	99081	\N
244096	GENERIC_DAY	0	8	2011-04-21	2225	\N	99081	\N
244097	GENERIC_DAY	0	8	2011-02-23	2225	\N	99081	\N
244098	GENERIC_DAY	0	8	2010-10-06	2225	\N	99081	\N
244099	GENERIC_DAY	0	8	2011-06-16	2225	\N	99081	\N
244100	GENERIC_DAY	0	8	2011-02-15	2225	\N	99081	\N
244101	GENERIC_DAY	0	8	2010-08-05	2225	\N	99081	\N
244102	GENERIC_DAY	0	0	2010-08-08	2225	\N	99081	\N
244103	GENERIC_DAY	0	8	2011-01-20	2225	\N	99081	\N
244104	GENERIC_DAY	0	0	2010-11-21	2225	\N	99081	\N
244105	GENERIC_DAY	0	8	2010-04-05	2225	\N	99081	\N
244106	GENERIC_DAY	0	8	2011-03-09	2225	\N	99081	\N
244107	GENERIC_DAY	0	8	2011-01-03	2225	\N	99081	\N
244108	GENERIC_DAY	0	0	2010-04-10	2225	\N	99081	\N
244109	GENERIC_DAY	0	8	2011-02-22	2225	\N	99081	\N
244110	GENERIC_DAY	0	0	2011-06-11	2225	\N	99081	\N
244111	GENERIC_DAY	0	8	2010-06-09	2225	\N	99081	\N
244112	GENERIC_DAY	0	6	2011-02-25	2225	\N	99081	\N
244113	GENERIC_DAY	0	8	2011-06-29	2225	\N	99081	\N
244114	GENERIC_DAY	0	6	2010-11-19	2225	\N	99081	\N
244115	GENERIC_DAY	0	6	2010-12-17	2225	\N	99081	\N
244116	GENERIC_DAY	0	8	2010-03-17	2225	\N	99081	\N
244117	GENERIC_DAY	0	6	2011-03-25	2225	\N	99081	\N
244118	GENERIC_DAY	0	0	2010-07-10	2225	\N	99081	\N
244119	GENERIC_DAY	0	8	2011-07-28	2225	\N	99081	\N
244120	GENERIC_DAY	0	8	2010-12-23	2225	\N	99081	\N
244121	GENERIC_DAY	0	0	2010-09-19	2225	\N	99081	\N
244122	GENERIC_DAY	0	8	2011-09-06	2225	\N	99081	\N
244123	GENERIC_DAY	0	8	2010-05-03	2225	\N	99081	\N
244124	GENERIC_DAY	0	8	2010-03-15	2225	\N	99081	\N
244125	GENERIC_DAY	0	6	2011-03-04	2225	\N	99081	\N
244126	GENERIC_DAY	0	8	2011-03-15	2225	\N	99081	\N
244127	GENERIC_DAY	0	8	2011-09-15	2225	\N	99081	\N
244128	GENERIC_DAY	0	8	2010-12-15	2225	\N	99081	\N
244129	GENERIC_DAY	0	8	2010-03-18	2225	\N	99081	\N
244130	GENERIC_DAY	0	0	2010-12-05	2225	\N	99081	\N
244131	GENERIC_DAY	0	0	2010-09-25	2225	\N	99081	\N
244132	GENERIC_DAY	0	8	2011-06-07	2225	\N	99081	\N
244133	GENERIC_DAY	0	6	2011-06-03	2225	\N	99081	\N
244134	GENERIC_DAY	0	8	2011-06-27	2225	\N	99081	\N
244135	GENERIC_DAY	0	0	2010-04-18	2225	\N	99081	\N
244136	GENERIC_DAY	0	8	2011-01-05	2225	\N	99081	\N
244137	GENERIC_DAY	0	6	2010-07-30	2225	\N	99081	\N
244138	GENERIC_DAY	0	8	2011-07-14	2225	\N	99081	\N
244139	GENERIC_DAY	0	0	2010-08-07	2225	\N	99081	\N
244140	GENERIC_DAY	0	0	2011-08-28	2225	\N	99081	\N
244141	GENERIC_DAY	0	0	2010-10-17	2225	\N	99081	\N
244142	GENERIC_DAY	0	0	2011-07-31	2225	\N	99081	\N
244143	GENERIC_DAY	0	8	2011-06-28	2225	\N	99081	\N
244144	GENERIC_DAY	0	8	2010-04-13	2225	\N	99081	\N
244145	GENERIC_DAY	0	6	2011-06-17	2225	\N	99081	\N
244146	GENERIC_DAY	0	6	2010-05-28	2225	\N	99081	\N
244147	GENERIC_DAY	0	8	2011-02-24	2225	\N	99081	\N
244148	GENERIC_DAY	0	0	2011-09-04	2225	\N	99081	\N
244149	GENERIC_DAY	0	0	2010-04-17	2225	\N	99081	\N
244150	GENERIC_DAY	0	8	2011-02-16	2225	\N	99081	\N
244151	GENERIC_DAY	0	8	2011-07-19	2225	\N	99081	\N
244152	GENERIC_DAY	0	8	2010-08-12	2225	\N	99081	\N
244153	GENERIC_DAY	0	8	2011-09-01	2225	\N	99081	\N
244154	GENERIC_DAY	0	0	2011-04-10	2225	\N	99081	\N
244155	GENERIC_DAY	0	8	2011-07-21	2225	\N	99081	\N
244156	GENERIC_DAY	0	8	2010-12-09	2225	\N	99081	\N
244157	GENERIC_DAY	0	8	2011-08-11	2225	\N	99081	\N
244158	GENERIC_DAY	0	0	2010-09-26	2225	\N	99081	\N
244159	GENERIC_DAY	0	8	2010-09-20	2225	\N	99081	\N
244160	GENERIC_DAY	0	8	2011-06-06	2225	\N	99081	\N
244161	GENERIC_DAY	0	0	2010-10-02	2225	\N	99081	\N
244162	GENERIC_DAY	0	0	2010-05-16	2225	\N	99081	\N
244163	GENERIC_DAY	0	6	2010-06-18	2225	\N	99081	\N
244164	GENERIC_DAY	0	0	2011-09-11	2225	\N	99081	\N
244165	GENERIC_DAY	0	8	2010-05-04	2225	\N	99081	\N
244166	GENERIC_DAY	0	8	2010-05-05	2225	\N	99081	\N
244167	GENERIC_DAY	0	8	2010-12-29	2225	\N	99081	\N
244168	GENERIC_DAY	0	8	2010-07-01	2225	\N	99081	\N
244169	GENERIC_DAY	0	0	2010-10-30	2225	\N	99081	\N
244170	GENERIC_DAY	0	8	2011-05-31	2225	\N	99081	\N
244171	GENERIC_DAY	0	0	2011-09-24	2225	\N	99081	\N
244172	GENERIC_DAY	0	0	2011-04-17	2225	\N	99081	\N
244173	GENERIC_DAY	0	0	2011-01-15	2225	\N	99081	\N
244174	GENERIC_DAY	0	0	2010-03-19	2225	\N	99081	\N
244175	GENERIC_DAY	0	8	2010-03-29	2225	\N	99081	\N
244176	GENERIC_DAY	0	0	2011-06-19	2225	\N	99081	\N
244177	GENERIC_DAY	0	8	2010-08-26	2225	\N	99081	\N
244178	GENERIC_DAY	0	8	2011-07-05	2225	\N	99081	\N
244179	GENERIC_DAY	0	0	2011-03-27	2225	\N	99081	\N
244180	GENERIC_DAY	0	8	2011-09-27	2225	\N	99081	\N
244181	GENERIC_DAY	0	8	2010-07-20	2225	\N	99081	\N
244182	GENERIC_DAY	0	8	2010-08-03	2225	\N	99081	\N
244183	GENERIC_DAY	0	8	2010-11-04	2225	\N	99081	\N
244184	GENERIC_DAY	0	0	2011-02-20	2225	\N	99081	\N
244185	GENERIC_DAY	0	8	2011-07-12	2225	\N	99081	\N
244186	GENERIC_DAY	0	0	2011-03-06	2225	\N	99081	\N
244187	GENERIC_DAY	0	8	2011-05-18	2225	\N	99081	\N
244188	GENERIC_DAY	0	0	2010-07-17	2225	\N	99081	\N
244189	GENERIC_DAY	0	8	2010-08-25	2225	\N	99081	\N
244190	GENERIC_DAY	0	8	2011-05-02	2225	\N	99081	\N
244191	GENERIC_DAY	0	8	2011-04-18	2225	\N	99081	\N
244192	GENERIC_DAY	0	0	2010-03-28	2225	\N	99081	\N
244193	GENERIC_DAY	0	8	2011-02-10	2225	\N	99081	\N
244194	GENERIC_DAY	0	8	2011-05-09	2225	\N	99081	\N
244195	GENERIC_DAY	0	8	2011-08-01	2225	\N	99081	\N
244196	GENERIC_DAY	0	8	2010-06-23	2225	\N	99081	\N
244197	GENERIC_DAY	0	8	2010-05-10	2225	\N	99081	\N
244198	GENERIC_DAY	0	8	2010-04-20	2225	\N	99081	\N
244199	GENERIC_DAY	0	0	2010-04-03	2225	\N	99081	\N
244200	GENERIC_DAY	0	6	2011-05-06	2225	\N	99081	\N
244201	GENERIC_DAY	0	0	2011-03-05	2225	\N	99081	\N
244202	GENERIC_DAY	0	6	2010-05-14	2225	\N	99081	\N
244203	GENERIC_DAY	0	8	2011-08-09	2225	\N	99081	\N
244204	GENERIC_DAY	0	8	2011-08-30	2225	\N	99081	\N
244205	GENERIC_DAY	0	8	2011-07-04	2225	\N	99081	\N
244206	GENERIC_DAY	0	8	2010-11-22	2225	\N	99081	\N
244207	GENERIC_DAY	0	0	2010-10-09	2225	\N	99081	\N
244208	GENERIC_DAY	0	8	2010-07-12	2225	\N	99081	\N
244209	GENERIC_DAY	0	8	2011-02-03	2225	\N	99081	\N
244210	GENERIC_DAY	0	8	2011-09-05	2225	\N	99081	\N
244211	GENERIC_DAY	0	6	2010-11-26	2225	\N	99081	\N
244212	GENERIC_DAY	0	8	2011-03-24	2225	\N	99081	\N
244213	GENERIC_DAY	0	6	2010-12-31	2225	\N	99081	\N
244214	GENERIC_DAY	0	6	2011-08-05	2225	\N	99081	\N
244215	GENERIC_DAY	0	0	2010-11-28	2225	\N	99081	\N
244216	GENERIC_DAY	0	0	2010-05-08	2225	\N	99081	\N
244217	GENERIC_DAY	0	8	2011-01-25	2225	\N	99081	\N
244218	GENERIC_DAY	0	8	2010-04-22	2225	\N	99081	\N
244219	GENERIC_DAY	0	0	2011-08-21	2225	\N	99081	\N
244220	GENERIC_DAY	0	6	2011-06-10	2225	\N	99081	\N
244221	GENERIC_DAY	0	0	2011-07-03	2225	\N	99081	\N
189007	GENERIC_DAY	1	1	2010-06-03	2245	\N	139499	\N
189593	GENERIC_DAY	1	2	2010-03-17	2241	\N	139499	\N
189245	GENERIC_DAY	1	0	2010-02-16	2249	\N	139499	\N
189877	GENERIC_DAY	1	1	2010-05-10	2245	\N	139499	\N
187677	GENERIC_DAY	1	0	2010-05-15	2239	\N	139499	\N
188536	GENERIC_DAY	1	0	2010-02-17	2235	\N	139499	\N
188233	GENERIC_DAY	1	1	2010-04-06	2229	\N	139499	\N
188307	GENERIC_DAY	1	0	2010-05-12	2231	\N	139499	\N
187777	GENERIC_DAY	1	1	2010-06-30	2237	\N	139499	\N
188089	GENERIC_DAY	1	1	2010-08-06	2245	\N	139499	\N
187508	GENERIC_DAY	1	0	2010-02-19	2233	\N	139499	\N
189028	GENERIC_DAY	1	0	2010-03-25	2239	\N	139499	\N
187540	GENERIC_DAY	1	2	2010-03-03	2251	\N	139499	\N
187773	GENERIC_DAY	1	1	2010-07-19	2235	\N	139499	\N
189698	GENERIC_DAY	1	1	2010-06-30	2235	\N	139499	\N
187847	GENERIC_DAY	1	0	2010-04-08	2239	\N	139499	\N
188915	GENERIC_DAY	1	1	2010-04-30	2231	\N	139499	\N
187982	GENERIC_DAY	1	0	2010-05-17	2229	\N	139499	\N
188351	GENERIC_DAY	1	0	2010-07-27	2239	\N	139499	\N
189412	GENERIC_DAY	1	2	2010-03-31	2241	\N	139499	\N
188108	GENERIC_DAY	1	0	2010-07-20	2231	\N	139499	\N
187499	GENERIC_DAY	1	0	2010-05-21	2239	\N	139499	\N
187728	GENERIC_DAY	1	0	2010-04-25	2231	\N	139499	\N
188006	GENERIC_DAY	1	0	2010-04-01	2251	\N	139499	\N
188025	GENERIC_DAY	1	0	2010-03-31	2249	\N	139499	\N
189398	GENERIC_DAY	1	0	2010-04-23	2237	\N	139499	\N
187652	GENERIC_DAY	1	1	2010-06-30	2247	\N	139499	\N
189253	GENERIC_DAY	1	1	2010-07-19	2251	\N	139499	\N
189280	GENERIC_DAY	1	0	2010-04-17	2243	\N	139499	\N
188139	GENERIC_DAY	1	1	2010-06-14	2249	\N	139499	\N
189880	GENERIC_DAY	1	1	2010-07-13	2237	\N	139499	\N
189186	GENERIC_DAY	1	0	2010-07-04	2249	\N	139499	\N
187853	GENERIC_DAY	1	0	2010-03-09	2243	\N	139499	\N
189758	GENERIC_DAY	1	0	2010-08-13	2225	\N	139499	\N
189912	GENERIC_DAY	1	1	2010-07-12	2245	\N	139499	\N
188610	GENERIC_DAY	1	0	2010-06-18	2249	\N	139499	\N
188653	GENERIC_DAY	1	0	2010-07-11	2247	\N	139499	\N
189103	GENERIC_DAY	1	1	2010-07-23	2223	\N	139499	\N
188110	GENERIC_DAY	1	0	2010-03-07	2223	\N	139499	\N
188897	GENERIC_DAY	1	1	2010-05-28	2241	\N	139499	\N
188345	GENERIC_DAY	1	0	2010-02-21	2237	\N	139499	\N
189612	GENERIC_DAY	1	0	2010-08-12	2225	\N	139499	\N
187888	GENERIC_DAY	1	1	2010-07-26	2237	\N	139499	\N
189735	GENERIC_DAY	1	1	2010-08-10	2245	\N	139499	\N
188561	GENERIC_DAY	1	2	2010-03-29	2241	\N	139499	\N
188632	GENERIC_DAY	1	1	2010-04-14	2241	\N	139499	\N
188692	GENERIC_DAY	1	2	2010-03-22	2251	\N	139499	\N
189874	GENERIC_DAY	1	0	2010-07-12	2225	\N	139499	\N
189871	GENERIC_DAY	1	0	2010-03-13	2229	\N	139499	\N
188333	GENERIC_DAY	1	0	2010-06-25	2237	\N	139499	\N
189600	GENERIC_DAY	1	0	2010-03-31	2239	\N	139499	\N
189067	GENERIC_DAY	1	0	2010-05-27	2223	\N	139499	\N
188087	GENERIC_DAY	1	0	2010-04-02	2235	\N	139499	\N
188618	GENERIC_DAY	1	0	2010-07-17	2233	\N	139499	\N
189673	GENERIC_DAY	1	1	2010-06-21	2235	\N	139499	\N
189092	GENERIC_DAY	1	0	2010-03-21	2249	\N	139499	\N
189328	GENERIC_DAY	1	0	2010-06-06	2229	\N	139499	\N
189215	GENERIC_DAY	1	0	2010-06-06	2245	\N	139499	\N
189222	GENERIC_DAY	1	0	2010-02-27	2249	\N	139499	\N
188418	GENERIC_DAY	1	0	2010-03-16	2243	\N	139499	\N
189823	GENERIC_DAY	1	1	2010-06-08	2247	\N	139499	\N
189448	GENERIC_DAY	1	2	2010-03-24	2241	\N	139499	\N
187821	GENERIC_DAY	1	2	2010-03-09	2251	\N	139499	\N
187415	GENERIC_DAY	1	0	2010-07-06	2229	\N	139499	\N
188512	GENERIC_DAY	1	1	2010-04-06	2233	\N	139499	\N
189922	GENERIC_DAY	1	1	2010-05-12	2233	\N	139499	\N
188547	GENERIC_DAY	1	1	2010-05-21	2241	\N	139499	\N
189934	GENERIC_DAY	1	0	2010-08-15	2223	\N	139499	\N
190020	GENERIC_DAY	1	0	2010-06-18	2247	\N	139499	\N
188925	GENERIC_DAY	1	1	2010-08-04	2235	\N	139499	\N
188816	GENERIC_DAY	1	1	2010-04-06	2247	\N	139499	\N
188156	GENERIC_DAY	1	0	2010-08-21	2225	\N	139499	\N
189781	GENERIC_DAY	1	1	2010-04-23	2231	\N	139499	\N
187524	GENERIC_DAY	1	0	2010-05-04	2241	\N	139499	\N
187992	GENERIC_DAY	1	0	2010-08-14	2243	\N	139499	\N
187469	GENERIC_DAY	1	0	2010-04-13	2231	\N	139499	\N
187602	GENERIC_DAY	1	0	2010-07-12	2223	\N	139499	\N
189814	GENERIC_DAY	1	1	2010-04-19	2251	\N	139499	\N
189282	GENERIC_DAY	1	1	2010-08-16	2237	\N	139499	\N
188658	GENERIC_DAY	1	0	2010-06-17	2231	\N	139499	\N
188954	GENERIC_DAY	1	1	2010-02-24	2223	\N	139499	\N
188117	GENERIC_DAY	1	0	2010-06-15	2241	\N	139499	\N
187941	GENERIC_DAY	1	1	2010-07-19	2249	\N	139499	\N
187596	GENERIC_DAY	1	0	2010-02-28	2239	\N	139499	\N
187618	GENERIC_DAY	1	0	2010-02-26	2243	\N	139499	\N
189948	GENERIC_DAY	1	1	2010-06-15	2251	\N	139499	\N
190016	GENERIC_DAY	1	0	2010-05-05	2223	\N	139499	\N
188555	GENERIC_DAY	1	0	2010-04-27	2225	\N	139499	\N
189064	GENERIC_DAY	1	0	2010-07-23	2235	\N	139499	\N
188329	GENERIC_DAY	1	0	2010-08-08	2241	\N	139499	\N
188382	GENERIC_DAY	1	0	2010-08-05	2225	\N	139499	\N
188880	GENERIC_DAY	1	0	2010-08-09	2239	\N	139499	\N
189365	GENERIC_DAY	1	1	2010-05-24	2249	\N	139499	\N
187646	GENERIC_DAY	1	1	2010-04-13	2245	\N	139499	\N
189217	GENERIC_DAY	1	0	2010-06-22	2225	\N	139499	\N
188095	GENERIC_DAY	1	0	2010-04-24	2225	\N	139499	\N
188269	GENERIC_DAY	1	0	2010-05-21	2243	\N	139499	\N
189475	GENERIC_DAY	1	0	2010-04-01	2223	\N	139499	\N
189447	GENERIC_DAY	1	0	2010-08-05	2231	\N	139499	\N
187501	GENERIC_DAY	1	0	2010-04-03	2225	\N	139499	\N
188098	GENERIC_DAY	1	0	2010-02-16	2231	\N	139499	\N
188040	GENERIC_DAY	1	0	2010-03-23	2233	\N	139499	\N
187734	GENERIC_DAY	1	0	2010-03-19	2231	\N	139499	\N
188359	GENERIC_DAY	1	0	2010-04-03	2243	\N	139499	\N
188251	GENERIC_DAY	1	1	2010-04-30	2245	\N	139499	\N
187436	GENERIC_DAY	1	0	2010-05-13	2223	\N	139499	\N
189322	GENERIC_DAY	1	1	2010-05-21	2229	\N	139499	\N
189682	GENERIC_DAY	1	0	2010-03-30	2233	\N	139499	\N
189657	GENERIC_DAY	1	0	2010-08-01	2251	\N	139499	\N
189168	GENERIC_DAY	1	1	2010-05-24	2237	\N	139499	\N
189303	GENERIC_DAY	1	0	2010-03-25	2233	\N	139499	\N
188637	GENERIC_DAY	1	0	2010-04-09	2239	\N	139499	\N
187684	GENERIC_DAY	1	1	2010-07-02	2231	\N	139499	\N
188189	GENERIC_DAY	1	0	2010-08-21	2223	\N	139499	\N
189354	GENERIC_DAY	1	0	2010-04-16	2249	\N	139499	\N
190009	GENERIC_DAY	1	0	2010-06-26	2237	\N	139499	\N
188543	GENERIC_DAY	1	0	2010-06-13	2243	\N	139499	\N
188309	GENERIC_DAY	1	0	2010-08-14	2231	\N	139499	\N
189803	GENERIC_DAY	1	0	2010-04-17	2235	\N	139499	\N
189313	GENERIC_DAY	1	0	2010-08-06	2243	\N	139499	\N
188625	GENERIC_DAY	1	1	2010-07-26	2251	\N	139499	\N
188809	GENERIC_DAY	1	1	2010-08-03	2245	\N	139499	\N
190019	GENERIC_DAY	1	1	2010-06-24	2237	\N	139499	\N
189633	GENERIC_DAY	1	0	2010-03-31	2235	\N	139499	\N
187553	GENERIC_DAY	1	0	2010-03-24	2239	\N	139499	\N
187731	GENERIC_DAY	1	0	2010-04-01	2241	\N	139499	\N
189208	GENERIC_DAY	1	1	2010-05-03	2245	\N	139499	\N
189378	GENERIC_DAY	1	0	2010-06-21	2231	\N	139499	\N
188630	GENERIC_DAY	1	0	2010-02-17	2225	\N	139499	\N
189705	GENERIC_DAY	1	1	2010-03-18	2237	\N	139499	\N
189867	GENERIC_DAY	1	0	2010-07-21	2229	\N	139499	\N
188394	GENERIC_DAY	1	0	2010-04-03	2229	\N	139499	\N
189455	GENERIC_DAY	1	0	2010-05-01	2245	\N	139499	\N
187719	GENERIC_DAY	1	1	2010-08-20	2237	\N	139499	\N
189213	GENERIC_DAY	1	1	2010-05-10	2233	\N	139499	\N
188144	GENERIC_DAY	1	0	2010-05-01	2229	\N	139499	\N
189105	GENERIC_DAY	1	1	2010-05-10	2243	\N	139499	\N
189563	GENERIC_DAY	1	2	2010-03-15	2241	\N	139499	\N
188356	GENERIC_DAY	1	1	2010-07-01	2251	\N	139499	\N
188587	GENERIC_DAY	1	0	2010-03-06	2247	\N	139499	\N
188300	GENERIC_DAY	1	0	2010-05-29	2231	\N	139499	\N
189750	GENERIC_DAY	1	1	2010-05-31	2233	\N	139499	\N
187954	GENERIC_DAY	1	1	2010-05-18	2243	\N	139499	\N
188581	GENERIC_DAY	1	1	2010-08-04	2249	\N	139499	\N
189434	GENERIC_DAY	1	1	2010-06-10	2247	\N	139499	\N
188126	GENERIC_DAY	1	1	2010-07-20	2243	\N	139499	\N
189693	GENERIC_DAY	1	1	2010-03-11	2229	\N	139499	\N
188984	GENERIC_DAY	1	1	2010-08-20	2235	\N	139499	\N
188961	GENERIC_DAY	1	1	2010-06-24	2251	\N	139499	\N
189956	GENERIC_DAY	1	0	2010-03-11	2231	\N	139499	\N
188775	GENERIC_DAY	1	1	2010-03-16	2223	\N	139499	\N
189012	GENERIC_DAY	1	0	2010-04-04	2245	\N	139499	\N
188270	GENERIC_DAY	1	0	2010-05-01	2235	\N	139499	\N
189445	GENERIC_DAY	1	1	2010-03-16	2245	\N	139499	\N
188828	GENERIC_DAY	1	1	2010-04-28	2247	\N	139499	\N
188432	GENERIC_DAY	1	0	2010-03-30	2249	\N	139499	\N
189770	GENERIC_DAY	1	0	2010-04-10	2241	\N	139499	\N
189764	GENERIC_DAY	1	1	2010-06-29	2251	\N	139499	\N
189089	GENERIC_DAY	1	0	2010-06-17	2229	\N	139499	\N
189833	GENERIC_DAY	1	0	2010-07-08	2225	\N	139499	\N
187999	GENERIC_DAY	1	0	2010-06-01	2241	\N	139499	\N
188763	GENERIC_DAY	1	0	2010-08-24	2231	\N	139499	\N
189797	GENERIC_DAY	1	0	2010-05-08	2239	\N	139499	\N
187697	GENERIC_DAY	1	0	2010-04-07	2225	\N	139499	\N
189141	GENERIC_DAY	1	0	2010-04-23	2225	\N	139499	\N
188896	GENERIC_DAY	1	1	2010-07-06	2247	\N	139499	\N
189945	GENERIC_DAY	1	0	2010-03-03	2239	\N	139499	\N
189575	GENERIC_DAY	1	0	2010-05-26	2225	\N	139499	\N
188874	GENERIC_DAY	1	0	2010-05-19	2241	\N	139499	\N
189151	GENERIC_DAY	1	1	2010-02-25	2223	\N	139499	\N
188076	GENERIC_DAY	1	1	2010-02-16	2245	\N	139499	\N
188494	GENERIC_DAY	1	1	2010-05-07	2245	\N	139499	\N
188560	GENERIC_DAY	1	1	2010-07-14	2237	\N	139499	\N
189844	GENERIC_DAY	1	0	2010-06-06	2235	\N	139499	\N
189236	GENERIC_DAY	1	1	2010-06-30	2245	\N	139499	\N
189408	GENERIC_DAY	1	0	2010-02-23	2233	\N	139499	\N
187990	GENERIC_DAY	1	0	2010-07-17	2243	\N	139499	\N
188433	GENERIC_DAY	1	1	2010-06-22	2235	\N	139499	\N
187510	GENERIC_DAY	1	0	2010-08-24	2241	\N	139499	\N
187615	GENERIC_DAY	1	0	2010-02-17	2247	\N	139499	\N
188188	GENERIC_DAY	1	0	2010-06-08	2241	\N	139499	\N
188706	GENERIC_DAY	1	0	2010-04-01	2239	\N	139499	\N
187892	GENERIC_DAY	1	0	2010-08-19	2249	\N	139499	\N
187915	GENERIC_DAY	1	0	2010-05-09	2233	\N	139499	\N
189122	GENERIC_DAY	1	0	2010-05-09	2237	\N	139499	\N
187471	GENERIC_DAY	1	0	2010-05-11	2223	\N	139499	\N
188464	GENERIC_DAY	1	0	2010-08-24	2233	\N	139499	\N
188042	GENERIC_DAY	1	0	2010-07-04	2239	\N	139499	\N
188606	GENERIC_DAY	1	0	2010-05-28	2249	\N	139499	\N
189413	GENERIC_DAY	1	1	2010-04-27	2247	\N	139499	\N
189899	GENERIC_DAY	1	0	2010-03-17	2233	\N	139499	\N
187710	GENERIC_DAY	1	0	2010-05-16	2249	\N	139499	\N
190012	GENERIC_DAY	1	0	2010-03-08	2231	\N	139499	\N
188425	GENERIC_DAY	1	0	2010-05-10	2225	\N	139499	\N
189732	GENERIC_DAY	1	0	2010-03-07	2247	\N	139499	\N
188566	GENERIC_DAY	1	0	2010-07-30	2249	\N	139499	\N
188063	GENERIC_DAY	1	1	2010-07-16	2223	\N	139499	\N
189885	GENERIC_DAY	1	1	2010-05-04	2233	\N	139499	\N
189842	GENERIC_DAY	1	0	2010-05-30	2225	\N	139499	\N
189537	GENERIC_DAY	1	0	2010-02-28	2233	\N	139499	\N
189999	GENERIC_DAY	1	0	2010-03-31	2247	\N	139499	\N
188950	GENERIC_DAY	1	0	2010-05-08	2223	\N	139499	\N
188868	GENERIC_DAY	1	0	2010-06-29	2241	\N	139499	\N
188603	GENERIC_DAY	1	1	2010-07-08	2235	\N	139499	\N
189594	GENERIC_DAY	1	0	2010-06-12	2245	\N	139499	\N
189863	GENERIC_DAY	1	1	2010-06-15	2245	\N	139499	\N
189977	GENERIC_DAY	1	1	2010-07-27	2247	\N	139499	\N
189487	GENERIC_DAY	1	1	2010-07-27	2249	\N	139499	\N
189992	GENERIC_DAY	1	0	2010-05-22	2247	\N	139499	\N
188608	GENERIC_DAY	1	0	2010-08-18	2247	\N	139499	\N
189906	GENERIC_DAY	1	1	2010-03-10	2237	\N	139499	\N
188493	GENERIC_DAY	1	0	2010-02-21	2245	\N	139499	\N
187872	GENERIC_DAY	1	1	2010-05-27	2233	\N	139499	\N
189960	GENERIC_DAY	1	0	2010-05-30	2233	\N	139499	\N
189377	GENERIC_DAY	1	1	2010-08-03	2249	\N	139499	\N
187541	GENERIC_DAY	1	1	2010-07-21	2251	\N	139499	\N
187645	GENERIC_DAY	1	0	2010-02-20	2235	\N	139499	\N
187762	GENERIC_DAY	1	0	2010-03-11	2249	\N	139499	\N
187625	GENERIC_DAY	1	0	2010-07-03	2231	\N	139499	\N
188317	GENERIC_DAY	1	0	2010-06-13	2231	\N	139499	\N
187806	GENERIC_DAY	1	2	2010-03-29	2251	\N	139499	\N
189130	GENERIC_DAY	1	1	2010-07-06	2249	\N	139499	\N
188523	GENERIC_DAY	1	0	2010-03-23	2239	\N	139499	\N
189047	GENERIC_DAY	1	0	2010-04-25	2251	\N	139499	\N
187766	GENERIC_DAY	1	1	2010-07-13	2233	\N	139499	\N
189645	GENERIC_DAY	1	0	2010-03-05	2239	\N	139499	\N
189481	GENERIC_DAY	1	1	2010-03-01	2223	\N	139499	\N
189670	GENERIC_DAY	1	0	2010-05-09	2251	\N	139499	\N
188138	GENERIC_DAY	1	1	2010-06-15	2247	\N	139499	\N
188550	GENERIC_DAY	1	1	2010-08-16	2223	\N	139499	\N
189703	GENERIC_DAY	1	1	2010-06-22	2243	\N	139499	\N
188766	GENERIC_DAY	1	1	2010-05-31	2243	\N	139499	\N
188252	GENERIC_DAY	1	1	2010-04-09	2237	\N	139499	\N
189789	GENERIC_DAY	1	0	2010-04-24	2235	\N	139499	\N
189281	GENERIC_DAY	1	0	2010-08-22	2233	\N	139499	\N
187994	GENERIC_DAY	1	1	2010-02-23	2223	\N	139499	\N
187504	GENERIC_DAY	1	1	2010-06-09	2235	\N	139499	\N
189981	GENERIC_DAY	1	0	2010-02-24	2231	\N	139499	\N
189078	GENERIC_DAY	1	1	2010-07-13	2247	\N	139499	\N
188734	GENERIC_DAY	1	1	2010-02-23	2245	\N	139499	\N
189297	GENERIC_DAY	1	0	2010-04-10	2229	\N	139499	\N
189196	GENERIC_DAY	1	0	2010-02-21	2247	\N	139499	\N
188671	GENERIC_DAY	1	1	2010-03-02	2237	\N	139499	\N
188788	GENERIC_DAY	1	1	2010-05-27	2251	\N	139499	\N
188872	GENERIC_DAY	1	0	2010-05-12	2229	\N	139499	\N
189806	GENERIC_DAY	1	0	2010-03-21	2223	\N	139499	\N
188203	GENERIC_DAY	1	0	2010-06-30	2223	\N	139499	\N
188384	GENERIC_DAY	1	1	2010-05-06	2251	\N	139499	\N
187539	GENERIC_DAY	1	1	2010-06-30	2233	\N	139499	\N
188589	GENERIC_DAY	1	0	2010-07-02	2251	\N	139499	\N
188602	GENERIC_DAY	1	1	2010-04-05	2241	\N	139499	\N
189893	GENERIC_DAY	1	0	2010-06-06	2237	\N	139499	\N
189320	GENERIC_DAY	1	0	2010-07-11	2243	\N	139499	\N
189252	GENERIC_DAY	1	0	2010-07-06	2231	\N	139499	\N
188456	GENERIC_DAY	1	0	2010-02-28	2251	\N	139499	\N
189127	GENERIC_DAY	1	0	2010-07-20	2223	\N	139499	\N
188260	GENERIC_DAY	1	0	2010-08-21	2249	\N	139499	\N
188726	GENERIC_DAY	1	0	2010-04-03	2247	\N	139499	\N
187839	GENERIC_DAY	1	0	2010-05-29	2235	\N	139499	\N
188945	GENERIC_DAY	1	1	2010-05-26	2247	\N	139499	\N
188389	GENERIC_DAY	1	1	2010-04-26	2243	\N	139499	\N
189998	GENERIC_DAY	1	0	2010-06-26	2231	\N	139499	\N
188842	GENERIC_DAY	1	1	2010-07-02	2241	\N	139499	\N
189188	GENERIC_DAY	1	1	2010-03-12	2245	\N	139499	\N
187592	GENERIC_DAY	1	0	2010-03-15	2233	\N	139499	\N
187855	GENERIC_DAY	1	0	2010-05-08	2233	\N	139499	\N
189361	GENERIC_DAY	1	0	2010-05-27	2225	\N	139499	\N
189352	GENERIC_DAY	1	0	2010-02-27	2229	\N	139499	\N
188178	GENERIC_DAY	1	1	2010-04-13	2239	\N	139499	\N
188423	GENERIC_DAY	1	1	2010-05-20	2245	\N	139499	\N
189402	GENERIC_DAY	1	0	2010-05-23	2237	\N	139499	\N
189399	GENERIC_DAY	1	0	2010-08-20	2229	\N	139499	\N
189433	GENERIC_DAY	1	0	2010-04-09	2249	\N	139499	\N
188162	GENERIC_DAY	1	0	2010-08-16	2231	\N	139499	\N
188806	GENERIC_DAY	1	1	2010-06-02	2249	\N	139499	\N
189265	GENERIC_DAY	1	0	2010-05-03	2241	\N	139499	\N
188533	GENERIC_DAY	1	0	2010-03-07	2233	\N	139499	\N
189854	GENERIC_DAY	1	0	2010-05-16	2231	\N	139499	\N
188213	GENERIC_DAY	1	0	2010-08-15	2241	\N	139499	\N
189164	GENERIC_DAY	1	0	2010-06-11	2249	\N	139499	\N
187934	GENERIC_DAY	1	0	2010-03-13	2239	\N	139499	\N
187865	GENERIC_DAY	1	1	2010-06-11	2241	\N	139499	\N
188557	GENERIC_DAY	1	0	2010-03-01	2225	\N	139499	\N
188991	GENERIC_DAY	1	0	2010-04-24	2245	\N	139499	\N
187717	GENERIC_DAY	1	1	2010-03-25	2245	\N	139499	\N
188803	GENERIC_DAY	1	0	2010-05-06	2239	\N	139499	\N
188315	GENERIC_DAY	1	0	2010-03-28	2251	\N	139499	\N
188305	GENERIC_DAY	1	1	2010-05-05	2235	\N	139499	\N
188104	GENERIC_DAY	1	0	2010-03-19	2223	\N	139499	\N
189793	GENERIC_DAY	1	1	2010-06-21	2247	\N	139499	\N
188237	GENERIC_DAY	1	1	2010-04-19	2245	\N	139499	\N
188161	GENERIC_DAY	1	0	2010-03-15	2225	\N	139499	\N
187702	GENERIC_DAY	1	0	2010-03-31	2225	\N	139499	\N
188981	GENERIC_DAY	1	0	2010-05-31	2223	\N	139499	\N
188582	GENERIC_DAY	1	0	2010-06-27	2237	\N	139499	\N
188853	GENERIC_DAY	1	0	2010-02-20	2237	\N	139499	\N
188713	GENERIC_DAY	1	0	2010-07-19	2223	\N	139499	\N
187838	GENERIC_DAY	1	0	2010-07-06	2223	\N	139499	\N
189307	GENERIC_DAY	1	1	2010-03-05	2241	\N	139499	\N
188909	GENERIC_DAY	1	0	2010-07-05	2231	\N	139499	\N
189201	GENERIC_DAY	1	0	2010-02-16	2235	\N	139499	\N
189460	GENERIC_DAY	1	1	2010-06-17	2237	\N	139499	\N
189841	GENERIC_DAY	1	1	2010-05-04	2249	\N	139499	\N
189022	GENERIC_DAY	1	0	2010-08-24	2243	\N	139499	\N
188724	GENERIC_DAY	1	1	2010-04-20	2235	\N	139499	\N
187454	GENERIC_DAY	1	1	2010-04-12	2239	\N	139499	\N
189162	GENERIC_DAY	1	0	2010-06-25	2247	\N	139499	\N
188121	GENERIC_DAY	1	0	2010-05-15	2251	\N	139499	\N
188064	GENERIC_DAY	1	0	2010-02-16	2225	\N	139499	\N
188576	GENERIC_DAY	1	0	2010-03-11	2243	\N	139499	\N
188972	GENERIC_DAY	1	0	2010-03-20	2241	\N	139499	\N
189118	GENERIC_DAY	1	0	2010-07-26	2229	\N	139499	\N
188369	GENERIC_DAY	1	0	2010-04-10	2231	\N	139499	\N
188654	GENERIC_DAY	1	0	2010-06-14	2225	\N	139499	\N
188371	GENERIC_DAY	1	0	2010-06-19	2225	\N	139499	\N
189772	GENERIC_DAY	1	0	2010-05-24	2241	\N	139499	\N
189717	GENERIC_DAY	1	1	2010-04-26	2235	\N	139499	\N
188027	GENERIC_DAY	1	0	2010-04-24	2239	\N	139499	\N
188476	GENERIC_DAY	1	0	2010-07-16	2247	\N	139499	\N
189083	GENERIC_DAY	1	0	2010-04-17	2225	\N	139499	\N
188596	GENERIC_DAY	1	0	2010-03-28	2239	\N	139499	\N
187626	GENERIC_DAY	1	0	2010-08-03	2239	\N	139499	\N
189438	GENERIC_DAY	1	0	2010-05-16	2229	\N	139499	\N
187593	GENERIC_DAY	1	0	2010-06-29	2239	\N	139499	\N
187753	GENERIC_DAY	1	0	2010-07-25	2251	\N	139499	\N
188593	GENERIC_DAY	1	0	2010-07-02	2249	\N	139499	\N
189257	GENERIC_DAY	1	0	2010-02-25	2235	\N	139499	\N
187854	GENERIC_DAY	1	0	2010-07-22	2231	\N	139499	\N
188194	GENERIC_DAY	1	0	2010-03-20	2237	\N	139499	\N
187453	GENERIC_DAY	1	0	2010-08-22	2229	\N	139499	\N
188261	GENERIC_DAY	1	0	2010-04-12	2225	\N	139499	\N
187956	GENERIC_DAY	1	0	2010-08-22	2251	\N	139499	\N
188728	GENERIC_DAY	1	0	2010-03-08	2247	\N	139499	\N
189622	GENERIC_DAY	1	1	2010-06-08	2243	\N	139499	\N
188486	GENERIC_DAY	1	1	2010-06-17	2243	\N	139499	\N
188731	GENERIC_DAY	1	0	2010-06-10	2225	\N	139499	\N
187476	GENERIC_DAY	1	1	2010-05-19	2251	\N	139499	\N
188186	GENERIC_DAY	1	0	2010-06-24	2231	\N	139499	\N
189425	GENERIC_DAY	1	0	2010-04-08	2249	\N	139499	\N
189140	GENERIC_DAY	1	1	2010-08-11	2241	\N	139499	\N
188529	GENERIC_DAY	1	0	2010-07-05	2239	\N	139499	\N
187962	GENERIC_DAY	1	0	2010-07-04	2237	\N	139499	\N
187925	GENERIC_DAY	1	1	2010-05-19	2247	\N	139499	\N
188699	GENERIC_DAY	1	0	2010-03-01	2239	\N	139499	\N
189218	GENERIC_DAY	1	0	2010-05-07	2251	\N	139499	\N
188600	GENERIC_DAY	1	0	2010-04-23	2247	\N	139499	\N
189392	GENERIC_DAY	1	1	2010-06-23	2237	\N	139499	\N
188978	GENERIC_DAY	1	0	2010-03-17	2247	\N	139499	\N
188125	GENERIC_DAY	1	0	2010-05-15	2249	\N	139499	\N
189459	GENERIC_DAY	1	0	2010-08-15	2235	\N	139499	\N
189678	GENERIC_DAY	1	0	2010-07-06	2225	\N	139499	\N
188231	GENERIC_DAY	1	1	2010-08-12	2245	\N	139499	\N
188293	GENERIC_DAY	1	0	2010-06-13	2251	\N	139499	\N
189832	GENERIC_DAY	1	0	2010-04-18	2233	\N	139499	\N
189314	GENERIC_DAY	1	0	2010-05-20	2239	\N	139499	\N
187603	GENERIC_DAY	1	0	2010-03-27	2239	\N	139499	\N
187761	GENERIC_DAY	1	1	2010-04-08	2251	\N	139499	\N
188607	GENERIC_DAY	1	0	2010-04-11	2251	\N	139499	\N
189908	GENERIC_DAY	1	0	2010-05-28	2237	\N	139499	\N
187864	GENERIC_DAY	1	0	2010-02-20	2233	\N	139499	\N
188668	GENERIC_DAY	1	1	2010-02-26	2223	\N	139499	\N
187601	GENERIC_DAY	1	0	2010-05-11	2239	\N	139499	\N
188388	GENERIC_DAY	1	2	2010-03-16	2251	\N	139499	\N
188440	GENERIC_DAY	1	1	2010-03-17	2245	\N	139499	\N
188604	GENERIC_DAY	1	1	2010-06-28	2233	\N	139499	\N
188478	GENERIC_DAY	1	0	2010-04-10	2223	\N	139499	\N
188597	GENERIC_DAY	1	0	2010-06-27	2249	\N	139499	\N
188865	GENERIC_DAY	1	1	2010-08-18	2235	\N	139499	\N
189334	GENERIC_DAY	1	0	2010-07-11	2251	\N	139499	\N
187660	GENERIC_DAY	1	0	2010-07-10	2239	\N	139499	\N
187903	GENERIC_DAY	1	0	2010-03-14	2229	\N	139499	\N
188263	GENERIC_DAY	1	0	2010-05-31	2225	\N	139499	\N
189568	GENERIC_DAY	1	0	2010-04-15	2223	\N	139499	\N
187998	GENERIC_DAY	1	1	2010-08-04	2247	\N	139499	\N
187486	GENERIC_DAY	1	1	2010-08-19	2235	\N	139499	\N
189739	GENERIC_DAY	1	0	2010-06-26	2243	\N	139499	\N
187632	GENERIC_DAY	1	1	2010-02-25	2245	\N	139499	\N
189418	GENERIC_DAY	1	0	2010-06-12	2247	\N	139499	\N
189371	GENERIC_DAY	1	0	2010-06-22	2231	\N	139499	\N
188525	GENERIC_DAY	1	0	2010-06-08	2229	\N	139499	\N
189036	GENERIC_DAY	1	1	2010-04-05	2247	\N	139499	\N
189170	GENERIC_DAY	1	0	2010-05-02	2247	\N	139499	\N
188134	GENERIC_DAY	1	0	2010-07-16	2249	\N	139499	\N
188832	GENERIC_DAY	1	1	2010-05-27	2243	\N	139499	\N
189961	GENERIC_DAY	1	0	2010-06-05	2223	\N	139499	\N
189327	GENERIC_DAY	1	0	2010-03-05	2243	\N	139499	\N
187898	GENERIC_DAY	1	0	2010-02-26	2239	\N	139499	\N
189202	GENERIC_DAY	1	2	2010-02-17	2251	\N	139499	\N
188751	GENERIC_DAY	1	0	2010-03-20	2245	\N	139499	\N
187709	GENERIC_DAY	1	0	2010-07-10	2243	\N	139499	\N
187589	GENERIC_DAY	1	1	2010-04-20	2237	\N	139499	\N
187745	GENERIC_DAY	1	0	2010-03-10	2233	\N	139499	\N
189254	GENERIC_DAY	1	0	2010-03-17	2243	\N	139499	\N
188565	GENERIC_DAY	1	0	2010-04-20	2239	\N	139499	\N
189714	GENERIC_DAY	1	2	2010-03-09	2223	\N	139499	\N
187889	GENERIC_DAY	1	0	2010-04-02	2249	\N	139499	\N
187594	GENERIC_DAY	1	0	2010-05-17	2231	\N	139499	\N
189649	GENERIC_DAY	1	0	2010-03-02	2231	\N	139499	\N
187595	GENERIC_DAY	1	0	2010-06-27	2239	\N	139499	\N
189465	GENERIC_DAY	1	0	2010-06-04	2237	\N	139499	\N
188091	GENERIC_DAY	1	0	2010-03-21	2229	\N	139499	\N
189853	GENERIC_DAY	1	2	2010-03-30	2251	\N	139499	\N
189518	GENERIC_DAY	1	0	2010-08-19	2225	\N	139499	\N
189715	GENERIC_DAY	1	0	2010-06-11	2247	\N	139499	\N
188590	GENERIC_DAY	1	0	2010-04-06	2249	\N	139499	\N
188681	GENERIC_DAY	1	1	2010-08-02	2249	\N	139499	\N
188033	GENERIC_DAY	1	0	2010-04-28	2241	\N	139499	\N
187544	GENERIC_DAY	1	0	2010-04-18	2243	\N	139499	\N
188286	GENERIC_DAY	1	0	2010-03-13	2223	\N	139499	\N
189407	GENERIC_DAY	1	1	2010-06-04	2223	\N	139499	\N
187659	GENERIC_DAY	1	0	2010-05-01	2237	\N	139499	\N
189131	GENERIC_DAY	1	1	2010-04-29	2251	\N	139499	\N
188474	GENERIC_DAY	1	0	2010-08-23	2231	\N	139499	\N
188694	GENERIC_DAY	1	0	2010-04-04	2241	\N	139499	\N
188718	GENERIC_DAY	1	1	2010-07-12	2249	\N	139499	\N
187810	GENERIC_DAY	1	0	2010-07-30	2235	\N	139499	\N
188817	GENERIC_DAY	1	0	2010-06-04	2239	\N	139499	\N
187793	GENERIC_DAY	1	1	2010-08-12	2233	\N	139499	\N
187609	GENERIC_DAY	1	0	2010-07-31	2231	\N	139499	\N
188160	GENERIC_DAY	1	0	2010-03-29	2233	\N	139499	\N
189974	GENERIC_DAY	1	2	2010-03-08	2251	\N	139499	\N
188629	GENERIC_DAY	1	1	2010-07-13	2245	\N	139499	\N
189973	GENERIC_DAY	1	1	2010-05-07	2229	\N	139499	\N
187633	GENERIC_DAY	1	0	2010-03-08	2243	\N	139499	\N
188574	GENERIC_DAY	1	0	2010-03-20	2251	\N	139499	\N
188885	GENERIC_DAY	1	1	2010-06-08	2251	\N	139499	\N
189800	GENERIC_DAY	1	1	2010-07-26	2243	\N	139499	\N
189431	GENERIC_DAY	1	0	2010-07-05	2241	\N	139499	\N
188228	GENERIC_DAY	1	0	2010-07-25	2223	\N	139499	\N
189312	GENERIC_DAY	1	0	2010-05-04	2239	\N	139499	\N
187764	GENERIC_DAY	1	1	2010-08-23	2235	\N	139499	\N
188908	GENERIC_DAY	1	1	2010-04-30	2241	\N	139499	\N
188913	GENERIC_DAY	1	1	2010-08-11	2245	\N	139499	\N
189782	GENERIC_DAY	1	1	2010-08-02	2233	\N	139499	\N
189464	GENERIC_DAY	1	1	2010-04-22	2235	\N	139499	\N
187779	GENERIC_DAY	1	0	2010-03-20	2225	\N	139499	\N
189851	GENERIC_DAY	1	0	2010-06-01	2231	\N	139499	\N
188906	GENERIC_DAY	1	1	2010-04-07	2229	\N	139499	\N
189505	GENERIC_DAY	1	1	2010-07-20	2251	\N	139499	\N
189975	GENERIC_DAY	1	0	2010-07-25	2245	\N	139499	\N
189338	GENERIC_DAY	1	0	2010-04-01	2231	\N	139499	\N
188130	GENERIC_DAY	1	0	2010-08-24	2229	\N	139499	\N
188254	GENERIC_DAY	1	0	2010-02-27	2225	\N	139499	\N
188199	GENERIC_DAY	1	1	2010-07-19	2233	\N	139499	\N
188575	GENERIC_DAY	1	0	2010-05-30	2245	\N	139499	\N
189941	GENERIC_DAY	1	0	2010-06-05	2225	\N	139499	\N
188810	GENERIC_DAY	1	0	2010-05-22	2231	\N	139499	\N
189651	GENERIC_DAY	1	1	2010-05-31	2251	\N	139499	\N
189393	GENERIC_DAY	1	0	2010-02-21	2225	\N	139499	\N
187714	GENERIC_DAY	1	0	2010-06-13	2249	\N	139499	\N
187835	GENERIC_DAY	1	0	2010-02-27	2245	\N	139499	\N
189731	GENERIC_DAY	1	0	2010-04-11	2233	\N	139499	\N
188370	GENERIC_DAY	1	0	2010-06-27	2245	\N	139499	\N
189490	GENERIC_DAY	1	1	2010-08-18	2233	\N	139499	\N
189191	GENERIC_DAY	1	0	2010-04-06	2237	\N	139499	\N
189167	GENERIC_DAY	1	1	2010-03-04	2229	\N	139499	\N
188757	GENERIC_DAY	1	1	2010-06-25	2231	\N	139499	\N
189019	GENERIC_DAY	1	0	2010-02-28	2225	\N	139499	\N
187668	GENERIC_DAY	1	0	2010-05-28	2251	\N	139499	\N
188986	GENERIC_DAY	1	1	2010-05-21	2245	\N	139499	\N
188559	GENERIC_DAY	1	2	2010-03-09	2245	\N	139499	\N
187564	GENERIC_DAY	1	0	2010-03-16	2225	\N	139499	\N
188380	GENERIC_DAY	1	1	2010-05-04	2243	\N	139499	\N
189539	GENERIC_DAY	1	0	2010-03-31	2243	\N	139499	\N
188256	GENERIC_DAY	1	0	2010-04-19	2241	\N	139499	\N
187725	GENERIC_DAY	1	0	2010-06-18	2235	\N	139499	\N
188431	GENERIC_DAY	1	0	2010-06-26	2235	\N	139499	\N
190021	GENERIC_DAY	1	0	2010-06-12	2239	\N	139499	\N
187939	GENERIC_DAY	1	1	2010-05-06	2233	\N	139499	\N
189142	GENERIC_DAY	1	0	2010-03-15	2239	\N	139499	\N
189762	GENERIC_DAY	1	0	2010-03-09	2239	\N	139499	\N
188503	GENERIC_DAY	1	0	2010-05-10	2223	\N	139499	\N
189400	GENERIC_DAY	1	0	2010-07-24	2245	\N	139499	\N
187477	GENERIC_DAY	1	1	2010-07-05	2237	\N	139499	\N
188368	GENERIC_DAY	1	0	2010-07-14	2241	\N	139499	\N
187867	GENERIC_DAY	1	0	2010-05-29	2245	\N	139499	\N
189221	GENERIC_DAY	1	0	2010-05-01	2247	\N	139499	\N
188787	GENERIC_DAY	1	1	2010-06-08	2245	\N	139499	\N
189021	GENERIC_DAY	1	0	2010-08-01	2231	\N	139499	\N
187799	GENERIC_DAY	1	1	2010-06-18	2229	\N	139499	\N
189716	GENERIC_DAY	1	2	2010-03-15	2251	\N	139499	\N
188481	GENERIC_DAY	1	0	2010-04-08	2245	\N	139499	\N
187546	GENERIC_DAY	1	0	2010-04-13	2223	\N	139499	\N
188898	GENERIC_DAY	1	0	2010-06-12	2251	\N	139499	\N
188571	GENERIC_DAY	1	0	2010-06-09	2231	\N	139499	\N
188916	GENERIC_DAY	1	1	2010-04-12	2247	\N	139499	\N
188667	GENERIC_DAY	1	0	2010-06-19	2235	\N	139499	\N
188411	GENERIC_DAY	1	1	2010-08-04	2251	\N	139499	\N
187935	GENERIC_DAY	1	0	2010-03-13	2231	\N	139499	\N
189587	GENERIC_DAY	1	0	2010-07-17	2249	\N	139499	\N
189559	GENERIC_DAY	1	0	2010-06-27	2231	\N	139499	\N
189486	GENERIC_DAY	1	1	2010-06-01	2245	\N	139499	\N
187955	GENERIC_DAY	1	0	2010-06-20	2237	\N	139499	\N
187927	GENERIC_DAY	1	0	2010-04-30	2247	\N	139499	\N
188996	GENERIC_DAY	1	0	2010-07-31	2245	\N	139499	\N
187946	GENERIC_DAY	1	0	2010-07-18	2231	\N	139499	\N
188198	GENERIC_DAY	1	0	2010-03-26	2239	\N	139499	\N
189736	GENERIC_DAY	1	0	2010-05-17	2251	\N	139499	\N
188214	GENERIC_DAY	1	2	2010-03-03	2241	\N	139499	\N
187427	GENERIC_DAY	1	0	2010-03-28	2245	\N	139499	\N
189353	GENERIC_DAY	1	1	2010-04-28	2249	\N	139499	\N
187565	GENERIC_DAY	1	0	2010-03-04	2225	\N	139499	\N
188847	GENERIC_DAY	1	0	2010-05-02	2241	\N	139499	\N
189809	GENERIC_DAY	1	1	2010-03-10	2245	\N	139499	\N
189147	GENERIC_DAY	1	1	2010-07-26	2245	\N	139499	\N
189345	GENERIC_DAY	1	0	2010-07-26	2231	\N	139499	\N
189383	GENERIC_DAY	1	0	2010-06-12	2237	\N	139499	\N
188396	GENERIC_DAY	1	1	2010-02-19	2241	\N	139499	\N
187440	GENERIC_DAY	1	1	2010-07-07	2235	\N	139499	\N
189896	GENERIC_DAY	1	0	2010-03-27	2223	\N	139499	\N
189848	GENERIC_DAY	1	0	2010-07-18	2233	\N	139499	\N
188297	GENERIC_DAY	1	0	2010-08-11	2249	\N	139499	\N
188905	GENERIC_DAY	1	0	2010-03-03	2225	\N	139499	\N
189384	GENERIC_DAY	1	1	2010-06-07	2251	\N	139499	\N
189166	GENERIC_DAY	1	0	2010-07-27	2229	\N	139499	\N
188823	GENERIC_DAY	1	0	2010-08-07	2245	\N	139499	\N
187887	GENERIC_DAY	1	0	2010-08-01	2223	\N	139499	\N
188922	GENERIC_DAY	1	1	2010-04-22	2245	\N	139499	\N
189950	GENERIC_DAY	1	0	2010-04-23	2249	\N	139499	\N
189172	GENERIC_DAY	1	0	2010-05-31	2231	\N	139499	\N
189592	GENERIC_DAY	1	0	2010-04-03	2235	\N	139499	\N
188322	GENERIC_DAY	1	0	2010-08-03	2223	\N	139499	\N
187417	GENERIC_DAY	1	0	2010-08-07	2229	\N	139499	\N
188850	GENERIC_DAY	1	0	2010-03-18	2239	\N	139499	\N
189366	GENERIC_DAY	1	0	2010-04-30	2235	\N	139499	\N
189416	GENERIC_DAY	1	0	2010-06-01	2225	\N	139499	\N
188923	GENERIC_DAY	1	1	2010-04-28	2233	\N	139499	\N
188472	GENERIC_DAY	1	0	2010-06-30	2241	\N	139499	\N
188366	GENERIC_DAY	1	0	2010-07-31	2229	\N	139499	\N
188714	GENERIC_DAY	1	0	2010-06-10	2231	\N	139499	\N
188709	GENERIC_DAY	1	0	2010-08-14	2229	\N	139499	\N
188319	GENERIC_DAY	1	1	2010-07-27	2235	\N	139499	\N
187515	GENERIC_DAY	1	1	2010-04-05	2229	\N	139499	\N
188249	GENERIC_DAY	1	0	2010-07-03	2229	\N	139499	\N
189868	GENERIC_DAY	1	0	2010-03-07	2251	\N	139499	\N
188265	GENERIC_DAY	1	0	2010-06-19	2245	\N	139499	\N
188855	GENERIC_DAY	1	1	2010-04-21	2233	\N	139499	\N
187727	GENERIC_DAY	1	0	2010-04-29	2239	\N	139499	\N
189240	GENERIC_DAY	1	0	2010-06-04	2225	\N	139499	\N
189269	GENERIC_DAY	1	1	2010-06-28	2243	\N	139499	\N
188007	GENERIC_DAY	1	0	2010-05-01	2251	\N	139499	\N
190022	GENERIC_DAY	1	0	2010-05-11	2225	\N	139499	\N
189875	GENERIC_DAY	1	0	2010-04-25	2239	\N	139499	\N
187897	GENERIC_DAY	1	0	2010-03-08	2233	\N	139499	\N
188835	GENERIC_DAY	1	1	2010-08-12	2223	\N	139499	\N
189917	GENERIC_DAY	1	1	2010-06-07	2249	\N	139499	\N
187723	GENERIC_DAY	1	1	2010-05-04	2237	\N	139499	\N
189250	GENERIC_DAY	1	0	2010-04-24	2229	\N	139499	\N
189163	GENERIC_DAY	1	0	2010-07-01	2239	\N	139499	\N
188934	GENERIC_DAY	1	0	2010-05-17	2243	\N	139499	\N
187936	GENERIC_DAY	1	1	2010-07-26	2235	\N	139499	\N
187913	GENERIC_DAY	1	0	2010-07-12	2241	\N	139499	\N
189331	GENERIC_DAY	1	0	2010-06-14	2223	\N	139499	\N
189248	GENERIC_DAY	1	1	2010-04-20	2245	\N	139499	\N
188039	GENERIC_DAY	1	0	2010-02-28	2245	\N	139499	\N
188099	GENERIC_DAY	1	0	2010-08-15	2237	\N	139499	\N
187574	GENERIC_DAY	1	0	2010-06-22	2223	\N	139499	\N
189200	GENERIC_DAY	1	0	2010-05-30	2243	\N	139499	\N
188376	GENERIC_DAY	1	0	2010-03-05	2231	\N	139499	\N
188830	GENERIC_DAY	1	1	2010-07-14	2233	\N	139499	\N
188910	GENERIC_DAY	1	0	2010-05-22	2233	\N	139499	\N
189038	GENERIC_DAY	1	0	2010-08-16	2251	\N	139499	\N
187588	GENERIC_DAY	1	1	2010-04-16	2245	\N	139499	\N
189873	GENERIC_DAY	1	1	2010-06-28	2235	\N	139499	\N
189710	GENERIC_DAY	1	0	2010-08-20	2223	\N	139499	\N
189369	GENERIC_DAY	1	0	2010-04-17	2251	\N	139499	\N
188970	GENERIC_DAY	1	1	2010-03-05	2237	\N	139499	\N
187752	GENERIC_DAY	1	0	2010-03-18	2225	\N	139499	\N
188364	GENERIC_DAY	1	1	2010-07-29	2251	\N	139499	\N
187505	GENERIC_DAY	1	0	2010-06-06	2247	\N	139499	\N
187475	GENERIC_DAY	1	1	2010-05-05	2243	\N	139499	\N
189501	GENERIC_DAY	1	1	2010-04-13	2237	\N	139499	\N
188055	GENERIC_DAY	1	0	2010-06-09	2225	\N	139499	\N
187667	GENERIC_DAY	1	0	2010-04-13	2229	\N	139499	\N
188939	GENERIC_DAY	1	0	2010-03-12	2225	\N	139499	\N
189626	GENERIC_DAY	1	0	2010-08-21	2245	\N	139499	\N
189009	GENERIC_DAY	1	1	2010-03-12	2229	\N	139499	\N
187467	GENERIC_DAY	1	1	2010-05-18	2249	\N	139499	\N
187923	GENERIC_DAY	1	0	2010-02-20	2225	\N	139499	\N
187924	GENERIC_DAY	1	0	2010-04-01	2249	\N	139499	\N
188551	GENERIC_DAY	1	0	2010-04-02	2245	\N	139499	\N
188740	GENERIC_DAY	1	1	2010-06-09	2243	\N	139499	\N
187958	GENERIC_DAY	1	1	2010-08-17	2223	\N	139499	\N
188397	GENERIC_DAY	1	0	2010-06-12	2231	\N	139499	\N
188211	GENERIC_DAY	1	1	2010-03-22	2237	\N	139499	\N
188471	GENERIC_DAY	1	1	2010-03-04	2237	\N	139499	\N
188650	GENERIC_DAY	1	1	2010-02-18	2237	\N	139499	\N
188949	GENERIC_DAY	1	1	2010-05-18	2233	\N	139499	\N
189869	GENERIC_DAY	1	0	2010-08-18	2251	\N	139499	\N
188140	GENERIC_DAY	1	0	2010-06-21	2241	\N	139499	\N
189894	GENERIC_DAY	1	0	2010-03-19	2233	\N	139499	\N
187582	GENERIC_DAY	1	1	2010-02-16	2237	\N	139499	\N
188873	GENERIC_DAY	1	0	2010-05-28	2243	\N	139499	\N
187479	GENERIC_DAY	1	0	2010-04-25	2245	\N	139499	\N
187527	GENERIC_DAY	1	1	2010-06-28	2237	\N	139499	\N
188797	GENERIC_DAY	1	0	2010-07-29	2239	\N	139499	\N
187850	GENERIC_DAY	1	1	2010-04-16	2223	\N	139499	\N
187568	GENERIC_DAY	1	0	2010-05-15	2223	\N	139499	\N
189811	GENERIC_DAY	1	0	2010-05-17	2241	\N	139499	\N
189658	GENERIC_DAY	1	0	2010-03-10	2247	\N	139499	\N
188475	GENERIC_DAY	1	0	2010-08-04	2231	\N	139499	\N
189564	GENERIC_DAY	1	1	2010-05-03	2247	\N	139499	\N
188491	GENERIC_DAY	1	0	2010-04-02	2225	\N	139499	\N
189192	GENERIC_DAY	1	0	2010-08-22	2235	\N	139499	\N
189198	GENERIC_DAY	1	1	2010-06-14	2233	\N	139499	\N
188294	GENERIC_DAY	1	0	2010-02-28	2229	\N	139499	\N
189768	GENERIC_DAY	1	1	2010-08-13	2251	\N	139499	\N
188626	GENERIC_DAY	1	0	2010-03-04	2247	\N	139499	\N
189193	GENERIC_DAY	1	1	2010-04-07	2241	\N	139499	\N
189729	GENERIC_DAY	1	0	2010-07-14	2223	\N	139499	\N
188774	GENERIC_DAY	1	1	2010-08-24	2251	\N	139499	\N
189525	GENERIC_DAY	1	1	2010-03-31	2237	\N	139499	\N
188852	GENERIC_DAY	1	0	2010-03-27	2243	\N	139499	\N
188882	GENERIC_DAY	1	1	2010-08-04	2233	\N	139499	\N
189084	GENERIC_DAY	1	1	2010-05-20	2237	\N	139499	\N
188722	GENERIC_DAY	1	0	2010-05-19	2225	\N	139499	\N
188871	GENERIC_DAY	1	0	2010-06-20	2241	\N	139499	\N
189450	GENERIC_DAY	1	1	2010-07-07	2233	\N	139499	\N
187951	GENERIC_DAY	1	0	2010-08-10	2229	\N	139499	\N
189286	GENERIC_DAY	1	0	2010-08-15	2229	\N	139499	\N
188904	GENERIC_DAY	1	1	2010-04-29	2245	\N	139499	\N
189669	GENERIC_DAY	1	0	2010-05-22	2229	\N	139499	\N
189177	GENERIC_DAY	1	1	2010-03-23	2245	\N	139499	\N
189910	GENERIC_DAY	1	1	2010-07-02	2245	\N	139499	\N
188690	GENERIC_DAY	1	1	2010-05-19	2233	\N	139499	\N
188758	GENERIC_DAY	1	1	2010-05-18	2247	\N	139499	\N
189744	GENERIC_DAY	1	0	2010-04-12	2249	\N	139499	\N
189226	GENERIC_DAY	1	1	2010-07-23	2241	\N	139499	\N
188363	GENERIC_DAY	1	1	2010-05-26	2245	\N	139499	\N
188165	GENERIC_DAY	1	0	2010-02-18	2247	\N	139499	\N
189340	GENERIC_DAY	1	1	2010-05-11	2249	\N	139499	\N
189268	GENERIC_DAY	1	0	2010-04-25	2243	\N	139499	\N
189792	GENERIC_DAY	1	1	2010-05-11	2251	\N	139499	\N
188223	GENERIC_DAY	1	1	2010-03-23	2237	\N	139499	\N
189299	GENERIC_DAY	1	0	2010-08-14	2237	\N	139499	\N
189443	GENERIC_DAY	1	1	2010-07-28	2247	\N	139499	\N
189427	GENERIC_DAY	1	1	2010-07-15	2235	\N	139499	\N
187902	GENERIC_DAY	1	0	2010-06-03	2229	\N	139499	\N
187485	GENERIC_DAY	1	2	2010-02-18	2251	\N	139499	\N
188344	GENERIC_DAY	1	0	2010-03-03	2243	\N	139499	\N
188742	GENERIC_DAY	1	0	2010-05-30	2247	\N	139499	\N
188723	GENERIC_DAY	1	1	2010-07-12	2237	\N	139499	\N
189724	GENERIC_DAY	1	0	2010-07-16	2235	\N	139499	\N
188453	GENERIC_DAY	1	0	2010-03-21	2251	\N	139499	\N
187522	GENERIC_DAY	1	1	2010-07-08	2237	\N	139499	\N
188733	GENERIC_DAY	1	0	2010-05-16	2225	\N	139499	\N
188994	GENERIC_DAY	1	0	2010-07-24	2239	\N	139499	\N
188210	GENERIC_DAY	1	0	2010-07-01	2241	\N	139499	\N
189850	GENERIC_DAY	1	1	2010-04-29	2233	\N	139499	\N
189644	GENERIC_DAY	1	0	2010-06-29	2231	\N	139499	\N
188594	GENERIC_DAY	1	0	2010-06-27	2225	\N	139499	\N
189203	GENERIC_DAY	1	1	2010-06-22	2245	\N	139499	\N
187983	GENERIC_DAY	1	0	2010-07-04	2229	\N	139499	\N
189964	GENERIC_DAY	1	1	2010-03-24	2223	\N	139499	\N
188346	GENERIC_DAY	1	1	2010-08-10	2243	\N	139499	\N
189756	GENERIC_DAY	1	1	2010-04-14	2235	\N	139499	\N
188748	GENERIC_DAY	1	0	2010-04-14	2225	\N	139499	\N
187532	GENERIC_DAY	1	1	2010-08-03	2243	\N	139499	\N
188276	GENERIC_DAY	1	0	2010-05-29	2229	\N	139499	\N
188402	GENERIC_DAY	1	1	2010-04-15	2251	\N	139499	\N
187775	GENERIC_DAY	1	0	2010-03-22	2225	\N	139499	\N
188155	GENERIC_DAY	1	1	2010-05-28	2231	\N	139499	\N
189426	GENERIC_DAY	1	0	2010-03-08	2235	\N	139499	\N
189308	GENERIC_DAY	1	0	2010-04-20	2241	\N	139499	\N
189232	GENERIC_DAY	1	0	2010-05-07	2247	\N	139499	\N
188815	GENERIC_DAY	1	0	2010-07-14	2229	\N	139499	\N
189919	GENERIC_DAY	1	0	2010-06-23	2239	\N	139499	\N
188862	GENERIC_DAY	1	0	2010-05-14	2239	\N	139499	\N
189209	GENERIC_DAY	1	0	2010-07-08	2223	\N	139499	\N
187692	GENERIC_DAY	1	0	2010-03-23	2249	\N	139499	\N
189557	GENERIC_DAY	1	0	2010-05-02	2225	\N	139499	\N
189898	GENERIC_DAY	1	0	2010-04-05	2249	\N	139499	\N
188350	GENERIC_DAY	1	0	2010-05-02	2237	\N	139499	\N
187523	GENERIC_DAY	1	0	2010-06-23	2229	\N	139499	\N
189668	GENERIC_DAY	1	0	2010-02-25	2233	\N	139499	\N
187446	GENERIC_DAY	1	1	2010-03-17	2223	\N	139499	\N
187805	GENERIC_DAY	1	0	2010-08-01	2239	\N	139499	\N
188226	GENERIC_DAY	1	0	2010-06-20	2251	\N	139499	\N
187656	GENERIC_DAY	1	0	2010-05-08	2245	\N	139499	\N
188741	GENERIC_DAY	1	0	2010-04-17	2241	\N	139499	\N
189199	GENERIC_DAY	1	2	2010-02-16	2251	\N	139499	\N
189895	GENERIC_DAY	1	1	2010-04-13	2247	\N	139499	\N
189461	GENERIC_DAY	1	0	2010-04-03	2251	\N	139499	\N
188670	GENERIC_DAY	1	0	2010-06-18	2225	\N	139499	\N
187790	GENERIC_DAY	1	1	2010-07-29	2249	\N	139499	\N
189115	GENERIC_DAY	1	0	2010-03-22	2235	\N	139499	\N
187831	GENERIC_DAY	1	1	2010-03-24	2229	\N	139499	\N
188230	GENERIC_DAY	1	1	2010-02-22	2223	\N	139499	\N
187683	GENERIC_DAY	1	0	2010-07-25	2231	\N	139499	\N
189424	GENERIC_DAY	1	1	2010-05-25	2247	\N	139499	\N
188508	GENERIC_DAY	1	1	2010-08-19	2245	\N	139499	\N
189098	GENERIC_DAY	1	0	2010-04-25	2247	\N	139499	\N
189070	GENERIC_DAY	1	0	2010-05-09	2231	\N	139499	\N
187449	GENERIC_DAY	1	0	2010-03-19	2247	\N	139499	\N
187585	GENERIC_DAY	1	0	2010-08-24	2245	\N	139499	\N
188760	GENERIC_DAY	1	0	2010-07-17	2239	\N	139499	\N
188336	GENERIC_DAY	1	1	2010-08-03	2251	\N	139499	\N
187576	GENERIC_DAY	1	0	2010-05-14	2235	\N	139499	\N
188647	GENERIC_DAY	1	1	2010-06-04	2241	\N	139499	\N
187782	GENERIC_DAY	1	0	2010-03-12	2243	\N	139499	\N
187617	GENERIC_DAY	1	0	2010-04-06	2245	\N	139499	\N
189309	GENERIC_DAY	1	0	2010-03-29	2231	\N	139499	\N
189106	GENERIC_DAY	1	0	2010-07-18	2245	\N	139499	\N
187973	GENERIC_DAY	1	0	2010-04-17	2237	\N	139499	\N
187860	GENERIC_DAY	1	0	2010-06-16	2223	\N	139499	\N
188935	GENERIC_DAY	1	0	2010-03-21	2237	\N	139499	\N
189813	GENERIC_DAY	1	0	2010-08-14	2247	\N	139499	\N
189589	GENERIC_DAY	1	0	2010-03-26	2233	\N	139499	\N
187967	GENERIC_DAY	1	0	2010-08-20	2241	\N	139499	\N
187459	GENERIC_DAY	1	0	2010-05-09	2225	\N	139499	\N
188278	GENERIC_DAY	1	2	2010-02-24	2251	\N	139499	\N
189820	GENERIC_DAY	1	0	2010-05-19	2231	\N	139499	\N
189695	GENERIC_DAY	1	1	2010-08-11	2235	\N	139499	\N
188017	GENERIC_DAY	1	0	2010-05-01	2239	\N	139499	\N
187599	GENERIC_DAY	1	0	2010-05-16	2241	\N	139499	\N
188951	GENERIC_DAY	1	2	2010-03-02	2251	\N	139499	\N
187654	GENERIC_DAY	1	0	2010-02-16	2239	\N	139499	\N
188219	GENERIC_DAY	1	0	2010-08-08	2243	\N	139499	\N
187597	GENERIC_DAY	1	1	2010-06-14	2235	\N	139499	\N
188410	GENERIC_DAY	1	1	2010-05-31	2249	\N	139499	\N
188105	GENERIC_DAY	1	0	2010-05-05	2241	\N	139499	\N
188705	GENERIC_DAY	1	0	2010-06-13	2229	\N	139499	\N
188102	GENERIC_DAY	1	0	2010-04-14	2229	\N	139499	\N
188434	GENERIC_DAY	1	0	2010-07-27	2231	\N	139499	\N
189776	GENERIC_DAY	1	0	2010-04-29	2231	\N	139499	\N
189734	GENERIC_DAY	1	0	2010-02-16	2247	\N	139499	\N
189134	GENERIC_DAY	1	0	2010-08-03	2225	\N	139499	\N
187884	GENERIC_DAY	1	0	2010-07-24	2229	\N	139499	\N
189440	GENERIC_DAY	1	1	2010-06-02	2233	\N	139499	\N
187498	GENERIC_DAY	1	0	2010-05-21	2251	\N	139499	\N
187575	GENERIC_DAY	1	0	2010-04-25	2233	\N	139499	\N
187796	GENERIC_DAY	1	0	2010-07-13	2225	\N	139499	\N
188752	GENERIC_DAY	1	1	2010-08-18	2223	\N	139499	\N
187947	GENERIC_DAY	1	1	2010-04-14	2245	\N	139499	\N
188765	GENERIC_DAY	1	1	2010-07-15	2237	\N	139499	\N
187547	GENERIC_DAY	1	1	2010-02-17	2237	\N	139499	\N
188883	GENERIC_DAY	1	0	2010-08-03	2229	\N	139499	\N
188856	GENERIC_DAY	1	0	2010-06-19	2231	\N	139499	\N
188204	GENERIC_DAY	1	2	2010-03-04	2241	\N	139499	\N
189386	GENERIC_DAY	1	1	2010-02-19	2251	\N	139499	\N
188446	GENERIC_DAY	1	1	2010-02-19	2245	\N	139499	\N
189954	GENERIC_DAY	1	0	2010-02-27	2241	\N	139499	\N
187763	GENERIC_DAY	1	0	2010-05-07	2225	\N	139499	\N
187976	GENERIC_DAY	1	1	2010-07-28	2251	\N	139499	\N
187795	GENERIC_DAY	1	0	2010-07-17	2229	\N	139499	\N
188634	GENERIC_DAY	1	0	2010-03-20	2231	\N	139499	\N
188112	GENERIC_DAY	1	0	2010-05-14	2237	\N	139499	\N
188296	GENERIC_DAY	1	0	2010-04-04	2237	\N	139499	\N
189285	GENERIC_DAY	1	0	2010-03-12	2233	\N	139499	\N
187644	GENERIC_DAY	1	2	2010-02-25	2241	\N	139499	\N
189085	GENERIC_DAY	1	0	2010-07-31	2251	\N	139499	\N
188061	GENERIC_DAY	1	2	2010-02-24	2241	\N	139499	\N
187628	GENERIC_DAY	1	0	2010-08-04	2229	\N	139499	\N
189006	GENERIC_DAY	1	1	2010-02-23	2229	\N	139499	\N
188111	GENERIC_DAY	1	1	2010-06-21	2251	\N	139499	\N
189329	GENERIC_DAY	1	0	2010-03-25	2249	\N	139499	\N
189062	GENERIC_DAY	1	0	2010-03-19	2241	\N	139499	\N
187768	GENERIC_DAY	1	0	2010-03-24	2233	\N	139499	\N
188795	GENERIC_DAY	1	0	2010-07-07	2225	\N	139499	\N
187551	GENERIC_DAY	1	0	2010-06-11	2225	\N	139499	\N
189180	GENERIC_DAY	1	0	2010-08-15	2249	\N	139499	\N
189060	GENERIC_DAY	1	0	2010-06-25	2243	\N	139499	\N
189791	GENERIC_DAY	1	0	2010-04-27	2241	\N	139499	\N
188997	GENERIC_DAY	1	0	2010-02-28	2249	\N	139499	\N
187869	GENERIC_DAY	1	1	2010-05-04	2235	\N	139499	\N
188468	GENERIC_DAY	1	1	2010-04-20	2243	\N	139499	\N
189935	GENERIC_DAY	1	1	2010-08-11	2223	\N	139499	\N
188678	GENERIC_DAY	1	0	2010-08-01	2245	\N	139499	\N
188301	GENERIC_DAY	1	0	2010-04-30	2251	\N	139499	\N
188893	GENERIC_DAY	1	0	2010-06-28	2225	\N	139499	\N
189603	GENERIC_DAY	1	0	2010-07-24	2241	\N	139499	\N
189310	GENERIC_DAY	1	0	2010-03-22	2233	\N	139499	\N
187492	GENERIC_DAY	1	0	2010-02-27	2239	\N	139499	\N
189346	GENERIC_DAY	1	0	2010-07-23	2237	\N	139499	\N
187750	GENERIC_DAY	1	1	2010-07-22	2237	\N	139499	\N
188651	GENERIC_DAY	1	1	2010-07-13	2249	\N	139499	\N
189858	GENERIC_DAY	1	0	2010-03-23	2231	\N	139499	\N
189887	GENERIC_DAY	1	0	2010-05-23	2243	\N	139499	\N
188930	GENERIC_DAY	1	0	2010-04-16	2239	\N	139499	\N
189599	GENERIC_DAY	1	0	2010-07-11	2229	\N	139499	\N
189533	GENERIC_DAY	1	0	2010-04-07	2235	\N	139499	\N
187520	GENERIC_DAY	1	1	2010-04-15	2243	\N	139499	\N
189970	GENERIC_DAY	1	0	2010-08-22	2243	\N	139499	\N
188275	GENERIC_DAY	1	0	2010-03-01	2247	\N	139499	\N
188043	GENERIC_DAY	1	1	2010-06-22	2233	\N	139499	\N
188619	GENERIC_DAY	1	1	2010-04-28	2251	\N	139499	\N
189743	GENERIC_DAY	1	1	2010-03-31	2229	\N	139499	\N
189653	GENERIC_DAY	1	0	2010-06-17	2223	\N	139499	\N
187481	GENERIC_DAY	1	0	2010-07-25	2239	\N	139499	\N
188573	GENERIC_DAY	1	0	2010-08-08	2249	\N	139499	\N
187600	GENERIC_DAY	1	1	2010-06-14	2245	\N	139499	\N
188426	GENERIC_DAY	1	1	2010-03-03	2223	\N	139499	\N
188919	GENERIC_DAY	1	1	2010-03-22	2229	\N	139499	\N
189553	GENERIC_DAY	1	0	2010-07-16	2239	\N	139499	\N
188569	GENERIC_DAY	1	0	2010-02-20	2247	\N	139499	\N
188907	GENERIC_DAY	1	0	2010-05-17	2233	\N	139499	\N
188727	GENERIC_DAY	1	0	2010-02-17	2249	\N	139499	\N
189497	GENERIC_DAY	1	0	2010-06-19	2243	\N	139499	\N
187894	GENERIC_DAY	1	0	2010-04-12	2229	\N	139499	\N
189578	GENERIC_DAY	1	0	2010-04-21	2241	\N	139499	\N
188386	GENERIC_DAY	1	0	2010-07-17	2225	\N	139499	\N
189008	GENERIC_DAY	1	0	2010-02-22	2247	\N	139499	\N
188793	GENERIC_DAY	1	0	2010-05-21	2247	\N	139499	\N
189473	GENERIC_DAY	1	0	2010-05-25	2239	\N	139499	\N
189359	GENERIC_DAY	1	1	2010-05-12	2251	\N	139499	\N
187886	GENERIC_DAY	1	0	2010-06-04	2249	\N	139499	\N
189171	GENERIC_DAY	1	0	2010-03-02	2247	\N	139499	\N
188267	GENERIC_DAY	1	1	2010-05-14	2223	\N	139499	\N
189471	GENERIC_DAY	1	1	2010-03-05	2229	\N	139499	\N
188378	GENERIC_DAY	1	0	2010-03-16	2239	\N	139499	\N
187666	GENERIC_DAY	1	1	2010-08-19	2229	\N	139499	\N
189666	GENERIC_DAY	1	0	2010-08-13	2229	\N	139499	\N
189720	GENERIC_DAY	1	0	2010-07-02	2243	\N	139499	\N
188509	GENERIC_DAY	1	1	2010-08-18	2241	\N	139499	\N
188354	GENERIC_DAY	1	0	2010-04-02	2251	\N	139499	\N
189870	GENERIC_DAY	1	1	2010-03-01	2229	\N	139499	\N
189362	GENERIC_DAY	1	0	2010-04-13	2249	\N	139499	\N
187997	GENERIC_DAY	1	1	2010-06-30	2249	\N	139499	\N
188461	GENERIC_DAY	1	0	2010-03-28	2243	\N	139499	\N
189569	GENERIC_DAY	1	1	2010-04-20	2247	\N	139499	\N
188940	GENERIC_DAY	1	1	2010-07-29	2243	\N	139499	\N
189674	GENERIC_DAY	1	0	2010-04-24	2231	\N	139499	\N
189138	GENERIC_DAY	1	0	2010-04-23	2235	\N	139499	\N
187965	GENERIC_DAY	1	1	2010-07-14	2251	\N	139499	\N
188863	GENERIC_DAY	1	0	2010-07-17	2231	\N	139499	\N
189686	GENERIC_DAY	1	0	2010-08-01	2241	\N	139499	\N
189204	GENERIC_DAY	1	0	2010-07-23	2249	\N	139499	\N
190005	GENERIC_DAY	1	1	2010-05-13	2247	\N	139499	\N
188867	GENERIC_DAY	1	0	2010-03-28	2249	\N	139499	\N
187767	GENERIC_DAY	1	1	2010-04-08	2231	\N	139499	\N
189937	GENERIC_DAY	1	0	2010-04-10	2237	\N	139499	\N
188993	GENERIC_DAY	1	1	2010-04-14	2237	\N	139499	\N
188968	GENERIC_DAY	1	0	2010-07-25	2249	\N	139499	\N
189374	GENERIC_DAY	1	0	2010-06-19	2223	\N	139499	\N
187531	GENERIC_DAY	1	1	2010-03-02	2229	\N	139499	\N
188498	GENERIC_DAY	1	1	2010-05-24	2233	\N	139499	\N
189925	GENERIC_DAY	1	0	2010-08-06	2251	\N	139499	\N
189846	GENERIC_DAY	1	1	2010-06-16	2245	\N	139499	\N
189876	GENERIC_DAY	1	0	2010-03-14	2247	\N	139499	\N
189251	GENERIC_DAY	1	0	2010-05-05	2231	\N	139499	\N
188528	GENERIC_DAY	1	0	2010-05-17	2239	\N	139499	\N
189702	GENERIC_DAY	1	0	2010-05-19	2229	\N	139499	\N
188247	GENERIC_DAY	1	0	2010-07-31	2237	\N	139499	\N
188924	GENERIC_DAY	1	0	2010-05-15	2233	\N	139499	\N
190000	GENERIC_DAY	1	0	2010-05-01	2243	\N	139499	\N
187560	GENERIC_DAY	1	0	2010-07-10	2235	\N	139499	\N
187629	GENERIC_DAY	1	0	2010-04-19	2229	\N	139499	\N
189838	GENERIC_DAY	1	0	2010-05-02	2223	\N	139499	\N
189629	GENERIC_DAY	1	0	2010-03-20	2243	\N	139499	\N
189790	GENERIC_DAY	1	0	2010-02-21	2241	\N	139499	\N
189728	GENERIC_DAY	1	0	2010-03-09	2231	\N	139499	\N
188965	GENERIC_DAY	1	0	2010-07-11	2249	\N	139499	\N
188070	GENERIC_DAY	1	1	2010-03-30	2223	\N	139499	\N
187450	GENERIC_DAY	1	1	2010-08-05	2247	\N	139499	\N
188235	GENERIC_DAY	1	0	2010-08-08	2239	\N	139499	\N
187986	GENERIC_DAY	1	0	2010-06-10	2223	\N	139499	\N
188504	GENERIC_DAY	1	1	2010-06-25	2223	\N	139499	\N
189775	GENERIC_DAY	1	1	2010-06-16	2251	\N	139499	\N
189640	GENERIC_DAY	1	0	2010-03-28	2241	\N	139499	\N
189510	GENERIC_DAY	1	0	2010-08-15	2247	\N	139499	\N
189119	GENERIC_DAY	1	0	2010-08-01	2225	\N	139499	\N
189300	GENERIC_DAY	1	1	2010-05-13	2249	\N	139499	\N
187875	GENERIC_DAY	1	0	2010-03-21	2241	\N	139499	\N
187704	GENERIC_DAY	1	1	2010-03-26	2229	\N	139499	\N
189069	GENERIC_DAY	1	1	2010-07-29	2237	\N	139499	\N
188549	GENERIC_DAY	1	0	2010-04-24	2251	\N	139499	\N
189638	GENERIC_DAY	1	1	2010-04-09	2245	\N	139499	\N
189552	GENERIC_DAY	1	0	2010-03-10	2225	\N	139499	\N
190003	GENERIC_DAY	1	0	2010-03-02	2249	\N	139499	\N
189847	GENERIC_DAY	1	1	2010-08-23	2223	\N	139499	\N
187413	GENERIC_DAY	1	1	2010-06-18	2223	\N	139499	\N
188381	GENERIC_DAY	1	1	2010-08-06	2223	\N	139499	\N
189468	GENERIC_DAY	1	0	2010-07-29	2229	\N	139499	\N
188976	GENERIC_DAY	1	0	2010-04-06	2235	\N	139499	\N
188660	GENERIC_DAY	1	0	2010-07-08	2231	\N	139499	\N
187754	GENERIC_DAY	1	0	2010-03-26	2243	\N	139499	\N
187571	GENERIC_DAY	1	1	2010-02-18	2223	\N	139499	\N
189664	GENERIC_DAY	1	0	2010-02-19	2235	\N	139499	\N
189273	GENERIC_DAY	1	0	2010-04-07	2239	\N	139499	\N
190024	GENERIC_DAY	1	1	2010-07-20	2249	\N	139499	\N
187772	GENERIC_DAY	1	0	2010-07-24	2251	\N	139499	\N
189766	GENERIC_DAY	1	0	2010-02-16	2243	\N	139499	\N
188688	GENERIC_DAY	1	0	2010-07-09	2235	\N	139499	\N
187699	GENERIC_DAY	1	0	2010-07-28	2239	\N	139499	\N
189173	GENERIC_DAY	1	1	2010-04-05	2243	\N	139499	\N
189311	GENERIC_DAY	1	1	2010-04-21	2235	\N	139499	\N
187820	GENERIC_DAY	1	0	2010-06-12	2241	\N	139499	\N
189530	GENERIC_DAY	1	0	2010-07-30	2251	\N	139499	\N
188595	GENERIC_DAY	1	0	2010-04-11	2243	\N	139499	\N
189647	GENERIC_DAY	1	0	2010-03-20	2249	\N	139499	\N
189324	GENERIC_DAY	1	0	2010-03-28	2235	\N	139499	\N
189857	GENERIC_DAY	1	0	2010-07-25	2247	\N	139499	\N
189428	GENERIC_DAY	1	0	2010-04-07	2249	\N	139499	\N
189864	GENERIC_DAY	1	0	2010-03-21	2225	\N	139499	\N
189687	GENERIC_DAY	1	0	2010-03-28	2223	\N	139499	\N
187638	GENERIC_DAY	1	0	2010-08-24	2247	\N	139499	\N
187985	GENERIC_DAY	1	1	2010-06-07	2247	\N	139499	\N
187874	GENERIC_DAY	1	0	2010-08-15	2225	\N	139499	\N
188225	GENERIC_DAY	1	0	2010-03-06	2235	\N	139499	\N
189774	GENERIC_DAY	1	1	2010-06-07	2237	\N	139499	\N
189555	GENERIC_DAY	1	0	2010-03-18	2231	\N	139499	\N
189237	GENERIC_DAY	1	0	2010-07-30	2243	\N	139499	\N
188799	GENERIC_DAY	1	0	2010-05-22	2241	\N	139499	\N
188948	GENERIC_DAY	1	0	2010-02-24	2243	\N	139499	\N
189014	GENERIC_DAY	1	0	2010-02-28	2235	\N	139499	\N
187680	GENERIC_DAY	1	0	2010-04-02	2241	\N	139499	\N
189493	GENERIC_DAY	1	1	2010-04-19	2243	\N	139499	\N
188020	GENERIC_DAY	1	0	2010-04-15	2231	\N	139499	\N
188090	GENERIC_DAY	1	2	2010-02-25	2251	\N	139499	\N
187484	GENERIC_DAY	1	0	2010-05-07	2239	\N	139499	\N
189577	GENERIC_DAY	1	0	2010-06-13	2225	\N	139499	\N
187513	GENERIC_DAY	1	1	2010-04-16	2231	\N	139499	\N
187480	GENERIC_DAY	1	0	2010-08-07	2243	\N	139499	\N
189325	GENERIC_DAY	1	1	2010-08-23	2245	\N	139499	\N
188973	GENERIC_DAY	1	0	2010-06-09	2241	\N	139499	\N
187876	GENERIC_DAY	1	0	2010-02-19	2247	\N	139499	\N
189491	GENERIC_DAY	1	0	2010-07-23	2247	\N	139499	\N
188353	GENERIC_DAY	1	0	2010-08-07	2223	\N	139499	\N
189562	GENERIC_DAY	1	0	2010-04-19	2223	\N	139499	\N
189489	GENERIC_DAY	1	1	2010-06-22	2249	\N	139499	\N
188998	GENERIC_DAY	1	0	2010-08-07	2247	\N	139499	\N
188174	GENERIC_DAY	1	0	2010-02-25	2225	\N	139499	\N
189125	GENERIC_DAY	1	1	2010-04-23	2223	\N	139499	\N
189920	GENERIC_DAY	1	0	2010-07-25	2229	\N	139499	\N
189467	GENERIC_DAY	1	0	2010-06-26	2225	\N	139499	\N
189889	GENERIC_DAY	1	0	2010-08-04	2239	\N	139499	\N
189810	GENERIC_DAY	1	1	2010-05-26	2249	\N	139499	\N
188383	GENERIC_DAY	1	0	2010-08-14	2249	\N	139499	\N
188675	GENERIC_DAY	1	1	2010-06-03	2251	\N	139499	\N
188745	GENERIC_DAY	1	0	2010-06-03	2239	\N	139499	\N
188149	GENERIC_DAY	1	0	2010-04-02	2231	\N	139499	\N
188081	GENERIC_DAY	1	0	2010-03-11	2247	\N	139499	\N
188613	GENERIC_DAY	1	0	2010-03-17	2239	\N	139499	\N
188750	GENERIC_DAY	1	0	2010-02-19	2243	\N	139499	\N
189293	GENERIC_DAY	1	1	2010-04-06	2223	\N	139499	\N
188995	GENERIC_DAY	1	1	2010-05-20	2247	\N	139499	\N
187549	GENERIC_DAY	1	1	2010-05-03	2235	\N	139499	\N
188999	GENERIC_DAY	1	0	2010-06-07	2229	\N	139499	\N
188656	GENERIC_DAY	1	0	2010-02-27	2231	\N	139499	\N
188422	GENERIC_DAY	1	0	2010-06-26	2247	\N	139499	\N
187671	GENERIC_DAY	1	0	2010-03-06	2233	\N	139499	\N
189005	GENERIC_DAY	1	0	2010-04-11	2225	\N	139499	\N
189429	GENERIC_DAY	1	0	2010-03-04	2233	\N	139499	\N
189843	GENERIC_DAY	1	0	2010-07-29	2225	\N	139499	\N
188135	GENERIC_DAY	1	1	2010-06-11	2223	\N	139499	\N
188701	GENERIC_DAY	1	0	2010-05-05	2239	\N	139499	\N
188176	GENERIC_DAY	1	0	2010-07-21	2241	\N	139499	\N
187466	GENERIC_DAY	1	0	2010-04-28	2229	\N	139499	\N
187690	GENERIC_DAY	1	0	2010-04-09	2223	\N	139499	\N
188266	GENERIC_DAY	1	0	2010-03-29	2243	\N	139499	\N
189606	GENERIC_DAY	1	0	2010-07-13	2239	\N	139499	\N
188153	GENERIC_DAY	1	0	2010-05-26	2223	\N	139499	\N
188792	GENERIC_DAY	1	0	2010-04-03	2231	\N	139499	\N
189336	GENERIC_DAY	1	0	2010-05-16	2223	\N	139499	\N
187781	GENERIC_DAY	1	1	2010-08-12	2235	\N	139499	\N
188427	GENERIC_DAY	1	0	2010-04-22	2231	\N	139499	\N
187662	GENERIC_DAY	1	0	2010-07-02	2237	\N	139499	\N
188513	GENERIC_DAY	1	0	2010-03-07	2245	\N	139499	\N
189074	GENERIC_DAY	1	0	2010-03-21	2243	\N	139499	\N
187559	GENERIC_DAY	1	0	2010-05-23	2231	\N	139499	\N
187742	GENERIC_DAY	1	1	2010-04-28	2237	\N	139499	\N
189679	GENERIC_DAY	1	0	2010-07-10	2241	\N	139499	\N
189351	GENERIC_DAY	1	1	2010-05-06	2249	\N	139499	\N
189516	GENERIC_DAY	1	0	2010-05-15	2247	\N	139499	\N
189721	GENERIC_DAY	1	0	2010-08-24	2223	\N	139499	\N
189442	GENERIC_DAY	1	1	2010-04-16	2241	\N	139499	\N
187550	GENERIC_DAY	1	0	2010-07-11	2237	\N	139499	\N
188791	GENERIC_DAY	1	0	2010-07-26	2223	\N	139499	\N
188857	GENERIC_DAY	1	0	2010-03-30	2243	\N	139499	\N
188826	GENERIC_DAY	1	1	2010-07-14	2235	\N	139499	\N
188558	GENERIC_DAY	1	0	2010-07-21	2225	\N	139499	\N
188669	GENERIC_DAY	1	0	2010-04-15	2233	\N	139499	\N
189195	GENERIC_DAY	1	0	2010-04-30	2237	\N	139499	\N
188442	GENERIC_DAY	1	0	2010-04-04	2225	\N	139499	\N
188869	GENERIC_DAY	1	0	2010-07-10	2237	\N	139499	\N
189783	GENERIC_DAY	1	1	2010-07-20	2237	\N	139499	\N
188470	GENERIC_DAY	1	0	2010-03-06	2225	\N	139499	\N
189093	GENERIC_DAY	1	0	2010-07-02	2247	\N	139499	\N
188107	GENERIC_DAY	1	1	2010-05-11	2237	\N	139499	\N
189849	GENERIC_DAY	1	0	2010-08-05	2229	\N	139499	\N
188584	GENERIC_DAY	1	1	2010-06-28	2251	\N	139499	\N
187621	GENERIC_DAY	1	0	2010-08-13	2233	\N	139499	\N
187794	GENERIC_DAY	1	0	2010-07-18	2241	\N	139499	\N
189991	GENERIC_DAY	1	0	2010-02-27	2243	\N	139499	\N
188805	GENERIC_DAY	1	1	2010-08-10	2233	\N	139499	\N
189079	GENERIC_DAY	1	0	2010-03-01	2249	\N	139499	\N
188407	GENERIC_DAY	1	0	2010-06-08	2231	\N	139499	\N
189479	GENERIC_DAY	1	1	2010-07-07	2247	\N	139499	\N
187658	GENERIC_DAY	1	0	2010-07-04	2235	\N	139499	\N
187791	GENERIC_DAY	1	1	2010-07-02	2233	\N	139499	\N
188900	GENERIC_DAY	1	0	2010-07-15	2241	\N	139499	\N
189161	GENERIC_DAY	1	0	2010-07-03	2243	\N	139499	\N
189691	GENERIC_DAY	1	1	2010-07-27	2245	\N	139499	\N
188166	GENERIC_DAY	1	0	2010-04-29	2223	\N	139499	\N
188182	GENERIC_DAY	1	1	2010-04-26	2251	\N	139499	\N
187430	GENERIC_DAY	1	0	2010-07-30	2237	\N	139499	\N
189436	GENERIC_DAY	1	0	2010-03-25	2225	\N	139499	\N
187743	GENERIC_DAY	1	1	2010-04-19	2237	\N	139499	\N
189754	GENERIC_DAY	1	1	2010-03-26	2251	\N	139499	\N
188068	GENERIC_DAY	1	0	2010-06-04	2251	\N	139499	\N
189343	GENERIC_DAY	1	0	2010-07-18	2223	\N	139499	\N
189316	GENERIC_DAY	1	0	2010-08-23	2249	\N	139499	\N
189015	GENERIC_DAY	1	0	2010-07-03	2239	\N	139499	\N
189737	GENERIC_DAY	1	0	2010-06-26	2249	\N	139499	\N
188259	GENERIC_DAY	1	0	2010-06-19	2237	\N	139499	\N
189027	GENERIC_DAY	1	1	2010-06-09	2245	\N	139499	\N
188469	GENERIC_DAY	1	0	2010-06-07	2241	\N	139499	\N
188786	GENERIC_DAY	1	0	2010-05-30	2231	\N	139499	\N
189476	GENERIC_DAY	1	0	2010-05-07	2237	\N	139499	\N
188257	GENERIC_DAY	1	0	2010-05-12	2239	\N	139499	\N
188621	GENERIC_DAY	1	1	2010-05-14	2245	\N	139499	\N
189373	GENERIC_DAY	1	1	2010-04-22	2237	\N	139499	\N
188455	GENERIC_DAY	1	1	2010-08-05	2243	\N	139499	\N
188860	GENERIC_DAY	1	0	2010-07-16	2225	\N	139499	\N
188918	GENERIC_DAY	1	0	2010-04-02	2243	\N	139499	\N
187445	GENERIC_DAY	1	1	2010-03-16	2229	\N	139499	\N
188633	GENERIC_DAY	1	1	2010-06-07	2235	\N	139499	\N
188702	GENERIC_DAY	1	1	2010-04-09	2247	\N	139499	\N
188804	GENERIC_DAY	1	0	2010-02-27	2247	\N	139499	\N
188465	GENERIC_DAY	1	0	2010-06-13	2241	\N	139499	\N
188314	GENERIC_DAY	1	1	2010-07-01	2237	\N	139499	\N
189435	GENERIC_DAY	1	0	2010-04-19	2231	\N	139499	\N
187620	GENERIC_DAY	1	0	2010-05-30	2237	\N	139499	\N
188443	GENERIC_DAY	1	1	2010-08-17	2245	\N	139499	\N
188902	GENERIC_DAY	1	0	2010-08-07	2239	\N	139499	\N
187509	GENERIC_DAY	1	0	2010-03-06	2241	\N	139499	\N
187811	GENERIC_DAY	1	0	2010-06-22	2229	\N	139499	\N
187949	GENERIC_DAY	1	0	2010-03-02	2239	\N	139499	\N
187716	GENERIC_DAY	1	0	2010-06-23	2225	\N	139499	\N
189541	GENERIC_DAY	1	0	2010-05-02	2249	\N	139499	\N
188914	GENERIC_DAY	1	0	2010-03-08	2249	\N	139499	\N
187472	GENERIC_DAY	1	1	2010-08-11	2237	\N	139499	\N
188556	GENERIC_DAY	1	1	2010-07-01	2245	\N	139499	\N
189521	GENERIC_DAY	1	1	2010-06-17	2245	\N	139499	\N
187751	GENERIC_DAY	1	0	2010-03-21	2245	\N	139499	\N
188928	GENERIC_DAY	1	1	2010-03-29	2245	\N	139499	\N
188150	GENERIC_DAY	1	1	2010-08-23	2229	\N	139499	\N
189829	GENERIC_DAY	1	0	2010-04-04	2233	\N	139499	\N
189554	GENERIC_DAY	1	1	2010-07-06	2233	\N	139499	\N
188762	GENERIC_DAY	1	1	2010-02-17	2223	\N	139499	\N
188583	GENERIC_DAY	1	0	2010-04-11	2231	\N	139499	\N
187968	GENERIC_DAY	1	1	2010-06-08	2233	\N	139499	\N
187877	GENERIC_DAY	1	0	2010-07-03	2247	\N	139499	\N
188262	GENERIC_DAY	1	0	2010-07-11	2239	\N	139499	\N
188339	GENERIC_DAY	1	0	2010-04-16	2243	\N	139499	\N
189157	GENERIC_DAY	1	0	2010-06-19	2241	\N	139499	\N
187423	GENERIC_DAY	1	0	2010-04-27	2223	\N	139499	\N
188349	GENERIC_DAY	1	1	2010-07-19	2247	\N	139499	\N
188591	GENERIC_DAY	1	0	2010-03-21	2239	\N	139499	\N
187414	GENERIC_DAY	1	0	2010-05-29	2249	\N	139499	\N
187689	GENERIC_DAY	1	0	2010-03-28	2237	\N	139499	\N
190018	GENERIC_DAY	1	0	2010-07-15	2225	\N	139499	\N
188047	GENERIC_DAY	1	0	2010-04-01	2245	\N	139499	\N
189713	GENERIC_DAY	1	0	2010-02-22	2231	\N	139499	\N
187707	GENERIC_DAY	1	0	2010-07-25	2225	\N	139499	\N
189909	GENERIC_DAY	1	1	2010-06-23	2249	\N	139499	\N
189628	GENERIC_DAY	1	0	2010-04-22	2239	\N	139499	\N
188789	GENERIC_DAY	1	0	2010-03-27	2231	\N	139499	\N
189090	GENERIC_DAY	1	0	2010-04-09	2235	\N	139499	\N
189480	GENERIC_DAY	1	1	2010-06-15	2243	\N	139499	\N
188845	GENERIC_DAY	1	1	2010-04-15	2241	\N	139499	\N
189595	GENERIC_DAY	1	0	2010-06-05	2243	\N	139499	\N
189508	GENERIC_DAY	1	1	2010-07-15	2243	\N	139499	\N
188858	GENERIC_DAY	1	1	2010-06-29	2237	\N	139499	\N
188886	GENERIC_DAY	1	0	2010-02-24	2225	\N	139499	\N
188866	GENERIC_DAY	1	1	2010-06-02	2243	\N	139499	\N
187857	GENERIC_DAY	1	0	2010-05-10	2229	\N	139499	\N
188884	GENERIC_DAY	1	0	2010-03-07	2249	\N	139499	\N
190006	GENERIC_DAY	1	0	2010-07-30	2239	\N	139499	\N
190011	GENERIC_DAY	1	0	2010-05-29	2243	\N	139499	\N
187670	GENERIC_DAY	1	0	2010-04-18	2249	\N	139499	\N
188790	GENERIC_DAY	1	0	2010-05-03	2225	\N	139499	\N
189989	GENERIC_DAY	1	1	2010-04-21	2245	\N	139499	\N
188755	GENERIC_DAY	1	1	2010-08-13	2235	\N	139499	\N
188016	GENERIC_DAY	1	0	2010-05-09	2229	\N	139499	\N
187452	GENERIC_DAY	1	1	2010-03-05	2251	\N	139499	\N
188243	GENERIC_DAY	1	1	2010-04-15	2237	\N	139499	\N
188759	GENERIC_DAY	1	1	2010-03-12	2237	\N	139499	\N
187653	GENERIC_DAY	1	1	2010-08-12	2239	\N	139499	\N
188019	GENERIC_DAY	1	0	2010-07-22	2223	\N	139499	\N
187904	GENERIC_DAY	1	1	2010-04-27	2251	\N	139499	\N
187424	GENERIC_DAY	1	0	2010-05-02	2229	\N	139499	\N
187921	GENERIC_DAY	1	0	2010-08-03	2231	\N	139499	\N
187713	GENERIC_DAY	1	0	2010-03-14	2235	\N	139499	\N
189387	GENERIC_DAY	1	0	2010-04-02	2237	\N	139499	\N
188119	GENERIC_DAY	1	0	2010-02-21	2239	\N	139499	\N
187826	GENERIC_DAY	1	0	2010-03-13	2241	\N	139499	\N
188917	GENERIC_DAY	1	0	2010-04-21	2229	\N	139499	\N
190017	GENERIC_DAY	1	1	2010-08-02	2245	\N	139499	\N
189255	GENERIC_DAY	1	1	2010-08-03	2235	\N	139499	\N
188776	GENERIC_DAY	1	0	2010-04-18	2225	\N	139499	\N
189406	GENERIC_DAY	1	0	2010-07-03	2249	\N	139499	\N
189247	GENERIC_DAY	1	0	2010-05-22	2235	\N	139499	\N
187959	GENERIC_DAY	1	0	2010-06-08	2239	\N	139499	\N
188689	GENERIC_DAY	1	1	2010-07-28	2233	\N	139499	\N
189931	GENERIC_DAY	1	0	2010-03-01	2231	\N	139499	\N
187979	GENERIC_DAY	1	1	2010-05-28	2245	\N	139499	\N
188324	GENERIC_DAY	1	0	2010-05-15	2237	\N	139499	\N
189641	GENERIC_DAY	1	1	2010-07-05	2249	\N	139499	\N
187536	GENERIC_DAY	1	0	2010-04-04	2235	\N	139499	\N
188318	GENERIC_DAY	1	0	2010-02-28	2223	\N	139499	\N
189949	GENERIC_DAY	1	2	2010-03-25	2241	\N	139499	\N
189625	GENERIC_DAY	1	1	2010-03-15	2237	\N	139499	\N
188330	GENERIC_DAY	1	0	2010-05-29	2223	\N	139499	\N
187970	GENERIC_DAY	1	1	2010-07-23	2231	\N	139499	\N
188295	GENERIC_DAY	1	1	2010-07-19	2245	\N	139499	\N
187580	GENERIC_DAY	1	1	2010-06-09	2247	\N	139499	\N
187980	GENERIC_DAY	1	0	2010-04-10	2247	\N	139499	\N
188877	GENERIC_DAY	1	1	2010-08-20	2249	\N	139499	\N
189767	GENERIC_DAY	1	0	2010-02-18	2231	\N	139499	\N
188808	GENERIC_DAY	1	0	2010-06-06	2225	\N	139499	\N
189881	GENERIC_DAY	1	1	2010-06-03	2249	\N	139499	\N
189680	GENERIC_DAY	1	0	2010-06-21	2229	\N	139499	\N
188515	GENERIC_DAY	1	0	2010-08-21	2235	\N	139499	\N
188844	GENERIC_DAY	1	1	2010-04-19	2247	\N	139499	\N
188643	GENERIC_DAY	1	0	2010-06-18	2243	\N	139499	\N
188377	GENERIC_DAY	1	0	2010-06-16	2239	\N	139499	\N
188238	GENERIC_DAY	1	0	2010-07-04	2243	\N	139499	\N
188912	GENERIC_DAY	1	0	2010-08-22	2245	\N	139499	\N
187542	GENERIC_DAY	1	0	2010-06-15	2223	\N	139499	\N
188704	GENERIC_DAY	1	0	2010-05-03	2239	\N	139499	\N
187572	GENERIC_DAY	1	1	2010-08-24	2249	\N	139499	\N
187971	GENERIC_DAY	1	0	2010-06-19	2249	\N	139499	\N
188616	GENERIC_DAY	1	0	2010-03-19	2229	\N	139499	\N
189096	GENERIC_DAY	1	1	2010-07-13	2243	\N	139499	\N
187851	GENERIC_DAY	1	1	2010-08-18	2237	\N	139499	\N
187537	GENERIC_DAY	1	0	2010-02-26	2231	\N	139499	\N
187964	GENERIC_DAY	1	0	2010-08-22	2237	\N	139499	\N
189780	GENERIC_DAY	1	0	2010-03-06	2231	\N	139499	\N
189688	GENERIC_DAY	1	1	2010-03-12	2223	\N	139499	\N
188290	GENERIC_DAY	1	0	2010-03-22	2249	\N	139499	\N
188794	GENERIC_DAY	1	0	2010-08-10	2241	\N	139499	\N
189615	GENERIC_DAY	1	0	2010-04-17	2229	\N	139499	\N
187953	GENERIC_DAY	1	0	2010-03-12	2249	\N	139499	\N
188685	GENERIC_DAY	1	1	2010-03-26	2237	\N	139499	\N
189333	GENERIC_DAY	1	0	2010-02-27	2233	\N	139499	\N
188715	GENERIC_DAY	1	1	2010-07-01	2243	\N	139499	\N
188192	GENERIC_DAY	1	1	2010-07-13	2251	\N	139499	\N
188572	GENERIC_DAY	1	1	2010-02-19	2223	\N	139499	\N
187812	GENERIC_DAY	1	1	2010-03-23	2223	\N	139499	\N
189512	GENERIC_DAY	1	0	2010-02-23	2225	\N	139499	\N
188953	GENERIC_DAY	1	1	2010-06-16	2233	\N	139499	\N
187943	GENERIC_DAY	1	0	2010-02-23	2247	\N	139499	\N
187792	GENERIC_DAY	1	0	2010-02-22	2239	\N	139499	\N
187901	GENERIC_DAY	1	0	2010-05-08	2225	\N	139499	\N
188527	GENERIC_DAY	1	0	2010-03-20	2247	\N	139499	\N
189607	GENERIC_DAY	1	0	2010-07-10	2247	\N	139499	\N
189305	GENERIC_DAY	1	1	2010-03-24	2237	\N	139499	\N
189738	GENERIC_DAY	1	0	2010-07-26	2241	\N	139499	\N
187648	GENERIC_DAY	1	0	2010-03-27	2251	\N	139499	\N
189144	GENERIC_DAY	1	0	2010-06-06	2223	\N	139499	\N
188956	GENERIC_DAY	1	1	2010-08-09	2247	\N	139499	\N
187891	GENERIC_DAY	1	1	2010-05-12	2243	\N	139499	\N
189068	GENERIC_DAY	1	1	2010-03-02	2245	\N	139499	\N
187862	GENERIC_DAY	1	0	2010-04-15	2249	\N	139499	\N
187528	GENERIC_DAY	1	1	2010-03-10	2251	\N	139499	\N
188399	GENERIC_DAY	1	1	2010-06-29	2245	\N	139499	\N
187801	GENERIC_DAY	1	0	2010-04-13	2225	\N	139499	\N
189099	GENERIC_DAY	1	1	2010-08-03	2247	\N	139499	\N
188221	GENERIC_DAY	1	0	2010-06-29	2229	\N	139499	\N
189241	GENERIC_DAY	1	0	2010-06-03	2241	\N	139499	\N
189995	GENERIC_DAY	1	1	2010-07-12	2243	\N	139499	\N
188184	GENERIC_DAY	1	0	2010-06-25	2225	\N	139499	\N
188664	GENERIC_DAY	1	0	2010-03-24	2235	\N	139499	\N
189020	GENERIC_DAY	1	1	2010-02-17	2245	\N	139499	\N
188050	GENERIC_DAY	1	0	2010-05-08	2235	\N	139499	\N
189601	GENERIC_DAY	1	0	2010-04-28	2231	\N	139499	\N
188367	GENERIC_DAY	1	0	2010-05-09	2239	\N	139499	\N
189627	GENERIC_DAY	1	0	2010-04-09	2241	\N	139499	\N
187700	GENERIC_DAY	1	0	2010-07-23	2243	\N	139499	\N
189023	GENERIC_DAY	1	0	2010-07-25	2233	\N	139499	\N
187747	GENERIC_DAY	1	0	2010-08-01	2237	\N	139499	\N
189404	GENERIC_DAY	1	1	2010-06-21	2245	\N	139499	\N
189046	GENERIC_DAY	1	2	2010-02-17	2241	\N	139499	\N
187598	GENERIC_DAY	1	0	2010-06-12	2233	\N	139499	\N
189148	GENERIC_DAY	1	1	2010-02-26	2251	\N	139499	\N
190026	GENERIC_DAY	1	0	2010-05-03	2231	\N	139499	\N
189206	GENERIC_DAY	1	0	2010-07-28	2225	\N	139499	\N
189556	GENERIC_DAY	1	0	2010-03-17	2235	\N	139499	\N
188331	GENERIC_DAY	1	0	2010-04-09	2251	\N	139499	\N
189499	GENERIC_DAY	1	0	2010-07-18	2249	\N	139499	\N
189711	GENERIC_DAY	1	0	2010-08-01	2235	\N	139499	\N
189117	GENERIC_DAY	1	0	2010-07-15	2229	\N	139499	\N
187765	GENERIC_DAY	1	1	2010-04-23	2229	\N	139499	\N
188034	GENERIC_DAY	1	0	2010-03-17	2231	\N	139499	\N
187433	GENERIC_DAY	1	1	2010-07-23	2233	\N	139499	\N
187483	GENERIC_DAY	1	0	2010-08-21	2229	\N	139499	\N
189982	GENERIC_DAY	1	0	2010-08-19	2231	\N	139499	\N
187643	GENERIC_DAY	1	0	2010-08-05	2223	\N	139499	\N
189560	GENERIC_DAY	1	0	2010-05-21	2249	\N	139499	\N
188466	GENERIC_DAY	1	0	2010-08-18	2231	\N	139499	\N
188833	GENERIC_DAY	1	0	2010-05-25	2241	\N	139499	\N
189032	GENERIC_DAY	1	1	2010-06-17	2233	\N	139499	\N
189478	GENERIC_DAY	1	1	2010-04-29	2247	\N	139499	\N
189277	GENERIC_DAY	1	0	2010-08-12	2251	\N	139499	\N
187521	GENERIC_DAY	1	0	2010-05-31	2241	\N	139499	\N
188903	GENERIC_DAY	1	1	2010-07-06	2237	\N	139499	\N
188636	GENERIC_DAY	1	0	2010-07-22	2229	\N	139499	\N
188485	GENERIC_DAY	1	0	2010-02-20	2239	\N	139499	\N
189385	GENERIC_DAY	1	0	2010-08-02	2225	\N	139499	\N
187804	GENERIC_DAY	1	0	2010-04-01	2237	\N	139499	\N
188520	GENERIC_DAY	1	1	2010-05-12	2247	\N	139499	\N
187465	GENERIC_DAY	1	0	2010-05-27	2229	\N	139499	\N
189153	GENERIC_DAY	1	0	2010-05-26	2241	\N	139499	\N
189432	GENERIC_DAY	1	1	2010-05-04	2245	\N	139499	\N
189993	GENERIC_DAY	1	0	2010-03-30	2235	\N	139499	\N
189574	GENERIC_DAY	1	0	2010-03-28	2233	\N	139499	\N
187611	GENERIC_DAY	1	0	2010-02-28	2243	\N	139499	\N
187783	GENERIC_DAY	1	0	2010-05-15	2229	\N	139499	\N
189733	GENERIC_DAY	1	0	2010-05-06	2223	\N	139499	\N
189704	GENERIC_DAY	1	0	2010-05-17	2247	\N	139499	\N
188129	GENERIC_DAY	1	0	2010-03-05	2233	\N	139499	\N
188163	GENERIC_DAY	1	1	2010-08-02	2243	\N	139499	\N
187566	GENERIC_DAY	1	0	2010-04-30	2225	\N	139499	\N
189137	GENERIC_DAY	1	0	2010-06-18	2239	\N	139499	\N
188802	GENERIC_DAY	1	1	2010-05-07	2231	\N	139499	\N
188507	GENERIC_DAY	1	0	2010-03-05	2247	\N	139499	\N
187966	GENERIC_DAY	1	1	2010-04-15	2235	\N	139499	\N
188287	GENERIC_DAY	1	1	2010-04-13	2235	\N	139499	\N
188136	GENERIC_DAY	1	0	2010-08-02	2239	\N	139499	\N
189730	GENERIC_DAY	1	0	2010-05-28	2225	\N	139499	\N
188209	GENERIC_DAY	1	0	2010-06-23	2241	\N	139499	\N
189549	GENERIC_DAY	1	0	2010-07-17	2241	\N	139499	\N
188698	GENERIC_DAY	1	0	2010-06-27	2251	\N	139499	\N
187755	GENERIC_DAY	1	1	2010-06-11	2231	\N	139499	\N
189088	GENERIC_DAY	1	1	2010-08-12	2241	\N	139499	\N
188537	GENERIC_DAY	1	0	2010-05-10	2231	\N	139499	\N
189759	GENERIC_DAY	1	0	2010-04-20	2223	\N	139499	\N
190031	GENERIC_DAY	1	2	2010-02-23	2251	\N	139499	\N
189812	GENERIC_DAY	1	0	2010-04-26	2239	\N	139499	\N
189220	GENERIC_DAY	1	1	2010-05-27	2235	\N	139499	\N
189648	GENERIC_DAY	1	0	2010-07-06	2239	\N	139499	\N
187664	GENERIC_DAY	1	0	2010-03-04	2239	\N	139499	\N
187687	GENERIC_DAY	1	0	2010-06-11	2239	\N	139499	\N
188073	GENERIC_DAY	1	1	2010-08-02	2235	\N	139499	\N
188028	GENERIC_DAY	1	0	2010-05-09	2235	\N	139499	\N
188393	GENERIC_DAY	1	0	2010-05-08	2243	\N	139499	\N
188036	GENERIC_DAY	1	1	2010-07-28	2249	\N	139499	\N
189528	GENERIC_DAY	1	0	2010-07-13	2229	\N	139499	\N
189727	GENERIC_DAY	1	0	2010-05-15	2235	\N	139499	\N
189723	GENERIC_DAY	1	0	2010-08-08	2251	\N	139499	\N
188821	GENERIC_DAY	1	2	2010-02-16	2241	\N	139499	\N
188890	GENERIC_DAY	1	1	2010-08-16	2239	\N	139499	\N
188819	GENERIC_DAY	1	0	2010-03-09	2249	\N	139499	\N
188118	GENERIC_DAY	1	0	2010-04-01	2247	\N	139499	\N
187721	GENERIC_DAY	1	0	2010-05-01	2223	\N	139499	\N
187491	GENERIC_DAY	1	0	2010-02-26	2235	\N	139499	\N
188002	GENERIC_DAY	1	2	2010-03-30	2241	\N	139499	\N
189866	GENERIC_DAY	1	1	2010-02-22	2229	\N	139499	\N
189158	GENERIC_DAY	1	1	2010-07-27	2233	\N	139499	\N
188495	GENERIC_DAY	1	0	2010-07-07	2229	\N	139499	\N
189921	GENERIC_DAY	1	1	2010-04-28	2235	\N	139499	\N
188959	GENERIC_DAY	1	0	2010-05-30	2241	\N	139499	\N
189051	GENERIC_DAY	1	1	2010-04-12	2251	\N	139499	\N
187474	GENERIC_DAY	1	0	2010-04-26	2231	\N	139499	\N
188691	GENERIC_DAY	1	0	2010-06-05	2239	\N	139499	\N
189492	GENERIC_DAY	1	0	2010-03-19	2225	\N	139499	\N
187418	GENERIC_DAY	1	0	2010-04-01	2233	\N	139499	\N
189056	GENERIC_DAY	1	1	2010-04-12	2243	\N	139499	\N
189588	GENERIC_DAY	1	1	2010-05-10	2251	\N	139499	\N
189401	GENERIC_DAY	1	1	2010-07-12	2247	\N	139499	\N
188292	GENERIC_DAY	1	1	2010-04-15	2245	\N	139499	\N
187640	GENERIC_DAY	1	1	2010-06-24	2245	\N	139499	\N
188240	GENERIC_DAY	1	1	2010-04-27	2235	\N	139499	\N
188281	GENERIC_DAY	1	0	2010-05-21	2225	\N	139499	\N
189681	GENERIC_DAY	1	1	2010-08-13	2237	\N	139499	\N
187905	GENERIC_DAY	1	0	2010-08-08	2231	\N	139499	\N
188761	GENERIC_DAY	1	1	2010-06-10	2243	\N	139499	\N
189315	GENERIC_DAY	1	1	2010-06-17	2235	\N	139499	\N
189267	GENERIC_DAY	1	0	2010-08-05	2241	\N	139499	\N
188200	GENERIC_DAY	1	0	2010-06-27	2229	\N	139499	\N
189546	GENERIC_DAY	1	1	2010-08-09	2233	\N	139499	\N
188229	GENERIC_DAY	1	0	2010-08-15	2251	\N	139499	\N
189613	GENERIC_DAY	1	0	2010-06-04	2235	\N	139499	\N
189631	GENERIC_DAY	1	1	2010-06-03	2247	\N	139499	\N
188195	GENERIC_DAY	1	0	2010-02-18	2249	\N	139499	\N
187663	GENERIC_DAY	1	0	2010-07-19	2225	\N	139499	\N
188202	GENERIC_DAY	1	1	2010-08-12	2229	\N	139499	\N
188779	GENERIC_DAY	1	1	2010-08-19	2233	\N	139499	\N
189420	GENERIC_DAY	1	1	2010-05-05	2245	\N	139499	\N
188696	GENERIC_DAY	1	0	2010-07-03	2237	\N	139499	\N
189156	GENERIC_DAY	1	1	2010-06-08	2237	\N	139499	\N
188450	GENERIC_DAY	1	1	2010-04-07	2223	\N	139499	\N
188113	GENERIC_DAY	1	0	2010-08-10	2225	\N	139499	\N
189609	GENERIC_DAY	1	0	2010-02-18	2243	\N	139499	\N
189548	GENERIC_DAY	1	1	2010-08-10	2237	\N	139499	\N
189414	GENERIC_DAY	1	0	2010-04-20	2231	\N	139499	\N
187461	GENERIC_DAY	1	0	2010-05-20	2241	\N	139499	\N
187432	GENERIC_DAY	1	1	2010-04-12	2237	\N	139499	\N
189421	GENERIC_DAY	1	0	2010-04-04	2239	\N	139499	\N
188183	GENERIC_DAY	1	1	2010-05-24	2235	\N	139499	\N
189855	GENERIC_DAY	1	0	2010-05-08	2247	\N	139499	\N
189278	GENERIC_DAY	1	1	2010-03-04	2245	\N	139499	\N
187627	GENERIC_DAY	1	0	2010-08-15	2245	\N	139499	\N
188648	GENERIC_DAY	1	0	2010-04-26	2225	\N	139499	\N
188969	GENERIC_DAY	1	0	2010-07-03	2225	\N	139499	\N
189190	GENERIC_DAY	1	0	2010-07-23	2225	\N	139499	\N
189041	GENERIC_DAY	1	1	2010-04-20	2233	\N	139499	\N
187977	GENERIC_DAY	1	1	2010-08-16	2235	\N	139499	\N
188101	GENERIC_DAY	1	0	2010-04-25	2249	\N	139499	\N
187538	GENERIC_DAY	1	0	2010-04-06	2225	\N	139499	\N
187534	GENERIC_DAY	1	0	2010-08-13	2241	\N	139499	\N
189712	GENERIC_DAY	1	1	2010-07-20	2245	\N	139499	\N
189504	GENERIC_DAY	1	0	2010-07-11	2241	\N	139499	\N
188784	GENERIC_DAY	1	0	2010-08-13	2245	\N	139499	\N
189380	GENERIC_DAY	1	1	2010-04-27	2233	\N	139499	\N
187843	GENERIC_DAY	1	0	2010-03-13	2243	\N	139499	\N
187543	GENERIC_DAY	1	1	2010-03-02	2223	\N	139499	\N
188403	GENERIC_DAY	1	0	2010-05-15	2225	\N	139499	\N
189913	GENERIC_DAY	1	0	2010-05-22	2239	\N	139499	\N
189719	GENERIC_DAY	1	1	2010-06-10	2235	\N	139499	\N
187458	GENERIC_DAY	1	1	2010-07-09	2245	\N	139499	\N
188598	GENERIC_DAY	1	0	2010-06-13	2245	\N	139499	\N
188739	GENERIC_DAY	1	0	2010-05-11	2229	\N	139499	\N
188887	GENERIC_DAY	1	1	2010-08-17	2235	\N	139499	\N
187426	GENERIC_DAY	1	0	2010-06-25	2239	\N	139499	\N
187906	GENERIC_DAY	1	0	2010-07-15	2231	\N	139499	\N
189249	GENERIC_DAY	1	0	2010-03-08	2225	\N	139499	\N
188187	GENERIC_DAY	1	0	2010-04-08	2235	\N	139499	\N
187691	GENERIC_DAY	1	0	2010-03-14	2223	\N	139499	\N
188222	GENERIC_DAY	1	0	2010-07-03	2233	\N	139499	\N
189040	GENERIC_DAY	1	1	2010-06-24	2243	\N	139499	\N
188957	GENERIC_DAY	1	1	2010-05-18	2237	\N	139499	\N
189244	GENERIC_DAY	1	1	2010-07-01	2233	\N	139499	\N
189637	GENERIC_DAY	1	0	2010-03-25	2243	\N	139499	\N
189667	GENERIC_DAY	1	1	2010-02-16	2223	\N	139499	\N
188272	GENERIC_DAY	1	0	2010-04-23	2243	\N	139499	\N
188438	GENERIC_DAY	1	0	2010-07-19	2241	\N	139499	\N
188777	GENERIC_DAY	1	1	2010-03-03	2229	\N	139499	\N
189292	GENERIC_DAY	1	0	2010-06-20	2249	\N	139499	\N
189287	GENERIC_DAY	1	1	2010-04-15	2247	\N	139499	\N
188015	GENERIC_DAY	1	2	2010-03-18	2251	\N	139499	\N
189807	GENERIC_DAY	1	1	2010-06-11	2233	\N	139499	\N
189996	GENERIC_DAY	1	0	2010-05-28	2247	\N	139499	\N
189136	GENERIC_DAY	1	1	2010-04-07	2247	\N	139499	\N
189210	GENERIC_DAY	1	0	2010-02-20	2223	\N	139499	\N
189886	GENERIC_DAY	1	1	2010-08-16	2245	\N	139499	\N
187944	GENERIC_DAY	1	0	2010-05-13	2239	\N	139499	\N
188429	GENERIC_DAY	1	1	2010-07-29	2235	\N	139499	\N
187676	GENERIC_DAY	1	0	2010-04-16	2247	\N	139499	\N
188078	GENERIC_DAY	1	0	2010-06-02	2225	\N	139499	\N
187984	GENERIC_DAY	1	0	2010-07-03	2223	\N	139499	\N
188535	GENERIC_DAY	1	1	2010-07-05	2245	\N	139499	\N
188143	GENERIC_DAY	1	0	2010-04-02	2247	\N	139499	\N
187698	GENERIC_DAY	1	0	2010-02-27	2251	\N	139499	\N
189341	GENERIC_DAY	1	0	2010-07-30	2225	\N	139499	\N
187419	GENERIC_DAY	1	0	2010-05-15	2243	\N	139499	\N
188659	GENERIC_DAY	1	0	2010-02-21	2229	\N	139499	\N
188568	GENERIC_DAY	1	0	2010-06-05	2249	\N	139499	\N
187557	GENERIC_DAY	1	0	2010-04-11	2245	\N	139499	\N
189929	GENERIC_DAY	1	1	2010-06-18	2241	\N	139499	\N
187911	GENERIC_DAY	1	1	2010-07-30	2229	\N	139499	\N
188424	GENERIC_DAY	1	1	2010-03-15	2245	\N	139499	\N
189483	GENERIC_DAY	1	0	2010-05-13	2231	\N	139499	\N
189439	GENERIC_DAY	1	0	2010-03-15	2243	\N	139499	\N
188313	GENERIC_DAY	1	1	2010-06-22	2247	\N	139499	\N
188218	GENERIC_DAY	1	1	2010-07-28	2235	\N	139499	\N
188248	GENERIC_DAY	1	0	2010-04-23	2251	\N	139499	\N
188338	GENERIC_DAY	1	0	2010-05-17	2249	\N	139499	\N
188614	GENERIC_DAY	1	0	2010-05-23	2229	\N	139499	\N
189454	GENERIC_DAY	1	0	2010-08-08	2229	\N	139499	\N
189063	GENERIC_DAY	1	0	2010-06-19	2233	\N	139499	\N
189181	GENERIC_DAY	1	0	2010-07-10	2233	\N	139499	\N
187514	GENERIC_DAY	1	0	2010-05-16	2239	\N	139499	\N
187456	GENERIC_DAY	1	0	2010-04-17	2247	\N	139499	\N
188693	GENERIC_DAY	1	0	2010-02-18	2225	\N	139499	\N
189165	GENERIC_DAY	1	0	2010-02-28	2241	\N	139499	\N
189230	GENERIC_DAY	1	1	2010-04-07	2251	\N	139499	\N
188347	GENERIC_DAY	1	0	2010-04-18	2223	\N	139499	\N
189348	GENERIC_DAY	1	1	2010-08-18	2245	\N	139499	\N
187974	GENERIC_DAY	1	0	2010-04-28	2239	\N	139499	\N
187688	GENERIC_DAY	1	0	2010-03-19	2245	\N	139499	\N
189160	GENERIC_DAY	1	0	2010-02-20	2241	\N	139499	\N
188075	GENERIC_DAY	1	0	2010-06-04	2247	\N	139499	\N
188385	GENERIC_DAY	1	0	2010-02-20	2245	\N	139499	\N
188141	GENERIC_DAY	1	1	2010-05-31	2237	\N	139499	\N
188037	GENERIC_DAY	1	1	2010-06-15	2233	\N	139499	\N
188592	GENERIC_DAY	1	1	2010-04-21	2249	\N	139499	\N
189761	GENERIC_DAY	1	0	2010-04-09	2229	\N	139499	\N
189509	GENERIC_DAY	1	1	2010-02-26	2237	\N	139499	\N
188335	GENERIC_DAY	1	1	2010-05-10	2249	\N	139499	\N
189604	GENERIC_DAY	1	1	2010-06-01	2235	\N	139499	\N
189319	GENERIC_DAY	1	0	2010-08-17	2251	\N	139499	\N
187991	GENERIC_DAY	1	1	2010-07-08	2233	\N	139499	\N
189859	GENERIC_DAY	1	0	2010-05-01	2249	\N	139499	\N
190004	GENERIC_DAY	1	0	2010-07-05	2225	\N	139499	\N
188467	GENERIC_DAY	1	0	2010-08-23	2251	\N	139499	\N
188725	GENERIC_DAY	1	1	2010-07-30	2241	\N	139499	\N
188179	GENERIC_DAY	1	0	2010-03-03	2231	\N	139499	\N
189159	GENERIC_DAY	1	1	2010-03-29	2237	\N	139499	\N
188843	GENERIC_DAY	1	0	2010-05-02	2251	\N	139499	\N
188544	GENERIC_DAY	1	0	2010-08-21	2243	\N	139499	\N
189409	GENERIC_DAY	1	1	2010-04-12	2241	\N	139499	\N
188458	GENERIC_DAY	1	0	2010-06-03	2231	\N	139499	\N
188306	GENERIC_DAY	1	0	2010-07-08	2241	\N	139499	\N
189034	GENERIC_DAY	1	1	2010-06-28	2247	\N	139499	\N
189101	GENERIC_DAY	1	0	2010-06-29	2223	\N	139499	\N
188517	GENERIC_DAY	1	0	2010-04-19	2225	\N	139499	\N
187780	GENERIC_DAY	1	0	2010-08-23	2243	\N	139499	\N
189825	GENERIC_DAY	1	1	2010-07-07	2245	\N	139499	\N
189567	GENERIC_DAY	1	0	2010-07-04	2245	\N	139499	\N
188352	GENERIC_DAY	1	1	2010-06-15	2249	\N	139499	\N
188820	GENERIC_DAY	1	1	2010-05-07	2241	\N	139499	\N
188932	GENERIC_DAY	1	0	2010-08-23	2225	\N	139499	\N
188060	GENERIC_DAY	1	1	2010-04-12	2235	\N	139499	\N
188357	GENERIC_DAY	1	1	2010-07-05	2243	\N	139499	\N
188526	GENERIC_DAY	1	1	2010-06-23	2251	\N	139499	\N
189545	GENERIC_DAY	1	0	2010-03-04	2249	\N	139499	\N
188190	GENERIC_DAY	1	0	2010-02-23	2249	\N	139499	\N
189289	GENERIC_DAY	1	1	2010-05-05	2251	\N	139499	\N
188753	GENERIC_DAY	1	0	2010-06-20	2229	\N	139499	\N
189947	GENERIC_DAY	1	0	2010-08-17	2243	\N	139499	\N
187770	GENERIC_DAY	1	0	2010-03-19	2237	\N	139499	\N
188365	GENERIC_DAY	1	0	2010-03-07	2235	\N	139499	\N
189397	GENERIC_DAY	1	0	2010-06-30	2239	\N	139499	\N
188506	GENERIC_DAY	1	0	2010-04-11	2247	\N	139499	\N
188796	GENERIC_DAY	1	1	2010-05-04	2247	\N	139499	\N
187819	GENERIC_DAY	1	0	2010-06-20	2247	\N	139499	\N
188444	GENERIC_DAY	1	0	2010-03-24	2225	\N	139499	\N
189614	GENERIC_DAY	1	0	2010-02-23	2231	\N	139499	\N
189914	GENERIC_DAY	1	1	2010-05-25	2243	\N	139499	\N
188782	GENERIC_DAY	1	0	2010-05-15	2231	\N	139499	\N
188510	GENERIC_DAY	1	1	2010-05-13	2243	\N	139499	\N
188767	GENERIC_DAY	1	0	2010-03-23	2243	\N	139499	\N
189388	GENERIC_DAY	1	1	2010-06-18	2245	\N	139499	\N
189337	GENERIC_DAY	1	1	2010-07-07	2243	\N	139499	\N
189091	GENERIC_DAY	1	0	2010-08-06	2235	\N	139499	\N
189933	GENERIC_DAY	1	1	2010-05-18	2245	\N	139499	\N
188840	GENERIC_DAY	1	1	2010-05-27	2247	\N	139499	\N
189526	GENERIC_DAY	1	1	2010-06-02	2245	\N	139499	\N
188328	GENERIC_DAY	1	0	2010-03-16	2231	\N	139499	\N
187503	GENERIC_DAY	1	0	2010-06-02	2223	\N	139499	\N
189298	GENERIC_DAY	1	1	2010-06-16	2235	\N	139499	\N
189672	GENERIC_DAY	1	0	2010-07-17	2251	\N	139499	\N
188000	GENERIC_DAY	1	0	2010-07-11	2245	\N	139499	\N
189773	GENERIC_DAY	1	1	2010-06-14	2243	\N	139499	\N
189302	GENERIC_DAY	1	0	2010-05-17	2223	\N	139499	\N
187460	GENERIC_DAY	1	0	2010-07-10	2223	\N	139499	\N
189830	GENERIC_DAY	1	0	2010-04-10	2225	\N	139499	\N
188271	GENERIC_DAY	1	1	2010-07-09	2223	\N	139499	\N
189391	GENERIC_DAY	1	0	2010-06-05	2247	\N	139499	\N
189030	GENERIC_DAY	1	1	2010-07-30	2245	\N	139499	\N
189573	GENERIC_DAY	1	0	2010-06-05	2229	\N	139499	\N
187563	GENERIC_DAY	1	0	2010-06-17	2239	\N	139499	\N
187852	GENERIC_DAY	1	1	2010-07-27	2251	\N	139499	\N
189856	GENERIC_DAY	1	1	2010-04-22	2243	\N	139499	\N
189043	GENERIC_DAY	1	1	2010-05-14	2233	\N	139499	\N
188239	GENERIC_DAY	1	1	2010-03-15	2223	\N	139499	\N
189410	GENERIC_DAY	1	0	2010-04-04	2249	\N	139499	\N
188224	GENERIC_DAY	1	1	2010-05-19	2245	\N	139499	\N
189677	GENERIC_DAY	1	0	2010-04-17	2245	\N	139499	\N
188100	GENERIC_DAY	1	0	2010-08-12	2247	\N	139499	\N
187425	GENERIC_DAY	1	1	2010-05-13	2245	\N	139499	\N
188483	GENERIC_DAY	1	0	2010-08-02	2223	\N	139499	\N
189924	GENERIC_DAY	1	1	2010-05-19	2235	\N	139499	\N
189983	GENERIC_DAY	1	0	2010-07-27	2241	\N	139499	\N
188358	GENERIC_DAY	1	1	2010-06-17	2249	\N	139499	\N
187613	GENERIC_DAY	1	0	2010-04-02	2223	\N	139499	\N
188280	GENERIC_DAY	1	0	2010-02-21	2251	\N	139499	\N
189482	GENERIC_DAY	1	0	2010-03-21	2233	\N	139499	\N
187718	GENERIC_DAY	1	0	2010-08-07	2251	\N	139499	\N
189872	GENERIC_DAY	1	0	2010-06-19	2251	\N	139499	\N
189154	GENERIC_DAY	1	1	2010-06-03	2233	\N	139499	\N
187938	GENERIC_DAY	1	0	2010-03-06	2237	\N	139499	\N
189802	GENERIC_DAY	1	1	2010-08-17	2237	\N	139499	\N
187881	GENERIC_DAY	1	0	2010-06-20	2223	\N	139499	\N
188649	GENERIC_DAY	1	1	2010-04-16	2233	\N	139499	\N
188372	GENERIC_DAY	1	1	2010-06-10	2237	\N	139499	\N
187429	GENERIC_DAY	1	0	2010-03-28	2229	\N	139499	\N
189903	GENERIC_DAY	1	0	2010-07-13	2241	\N	139499	\N
188875	GENERIC_DAY	1	0	2010-03-06	2229	\N	139499	\N
189187	GENERIC_DAY	1	1	2010-06-25	2229	\N	139499	\N
188268	GENERIC_DAY	1	0	2010-03-19	2235	\N	139499	\N
187996	GENERIC_DAY	1	0	2010-03-22	2243	\N	139499	\N
188682	GENERIC_DAY	1	0	2010-07-09	2225	\N	139499	\N
189395	GENERIC_DAY	1	0	2010-07-31	2223	\N	139499	\N
187771	GENERIC_DAY	1	0	2010-03-06	2223	\N	139499	\N
188545	GENERIC_DAY	1	1	2010-03-11	2237	\N	139499	\N
188974	GENERIC_DAY	1	1	2010-08-06	2229	\N	139499	\N
187907	GENERIC_DAY	1	0	2010-07-31	2243	\N	139499	\N
188084	GENERIC_DAY	1	1	2010-03-04	2223	\N	139499	\N
189485	GENERIC_DAY	1	1	2010-04-26	2233	\N	139499	\N
189654	GENERIC_DAY	1	0	2010-04-10	2235	\N	139499	\N
188181	GENERIC_DAY	1	0	2010-08-15	2231	\N	139499	\N
189978	GENERIC_DAY	1	0	2010-03-18	2249	\N	139499	\N
188164	GENERIC_DAY	1	1	2010-06-01	2251	\N	139499	\N
190029	GENERIC_DAY	1	1	2010-03-29	2223	\N	139499	\N
188171	GENERIC_DAY	1	0	2010-06-23	2231	\N	139499	\N
187703	GENERIC_DAY	1	0	2010-08-02	2231	\N	139499	\N
189382	GENERIC_DAY	1	0	2010-04-21	2223	\N	139499	\N
189785	GENERIC_DAY	1	1	2010-06-01	2243	\N	139499	\N
187434	GENERIC_DAY	1	1	2010-05-03	2251	\N	139499	\N
188971	GENERIC_DAY	1	0	2010-07-07	2223	\N	139499	\N
189620	GENERIC_DAY	1	1	2010-05-25	2233	\N	139499	\N
188487	GENERIC_DAY	1	1	2010-04-07	2231	\N	139499	\N
189146	GENERIC_DAY	1	0	2010-08-11	2231	\N	139499	\N
188054	GENERIC_DAY	1	0	2010-05-21	2237	\N	139499	\N
188008	GENERIC_DAY	1	1	2010-04-21	2247	\N	139499	\N
188605	GENERIC_DAY	1	0	2010-04-18	2245	\N	139499	\N
189822	GENERIC_DAY	1	1	2010-05-13	2235	\N	139499	\N
188080	GENERIC_DAY	1	1	2010-03-23	2229	\N	139499	\N
188334	GENERIC_DAY	1	2	2010-03-01	2241	\N	139499	\N
187930	GENERIC_DAY	1	0	2010-06-13	2247	\N	139499	\N
188730	GENERIC_DAY	1	0	2010-06-20	2225	\N	139499	\N
188990	GENERIC_DAY	1	2	2010-03-23	2251	\N	139499	\N
187932	GENERIC_DAY	1	0	2010-08-22	2231	\N	139499	\N
189878	GENERIC_DAY	1	1	2010-08-09	2235	\N	139499	\N
189879	GENERIC_DAY	1	0	2010-03-27	2241	\N	139499	\N
189718	GENERIC_DAY	1	0	2010-06-26	2245	\N	139499	\N
189488	GENERIC_DAY	1	1	2010-04-27	2249	\N	139499	\N
187950	GENERIC_DAY	1	0	2010-05-14	2243	\N	139499	\N
188849	GENERIC_DAY	1	1	2010-05-14	2241	\N	139499	\N
189547	GENERIC_DAY	1	2	2010-03-25	2251	\N	139499	\N
188859	GENERIC_DAY	1	1	2010-07-23	2229	\N	139499	\N
189765	GENERIC_DAY	1	0	2010-04-05	2231	\N	139499	\N
188781	GENERIC_DAY	1	1	2010-05-11	2233	\N	139499	\N
189266	GENERIC_DAY	1	0	2010-08-15	2233	\N	139499	\N
187945	GENERIC_DAY	1	0	2010-03-29	2225	\N	139499	\N
188137	GENERIC_DAY	1	0	2010-03-07	2241	\N	139499	\N
189901	GENERIC_DAY	1	1	2010-08-23	2241	\N	139499	\N
189104	GENERIC_DAY	1	1	2010-07-09	2231	\N	139499	\N
188962	GENERIC_DAY	1	0	2010-05-28	2235	\N	139499	\N
188521	GENERIC_DAY	1	1	2010-08-04	2245	\N	139499	\N
187846	GENERIC_DAY	1	0	2010-06-22	2241	\N	139499	\N
189801	GENERIC_DAY	1	1	2010-03-11	2235	\N	139499	\N
189259	GENERIC_DAY	1	0	2010-06-25	2249	\N	139499	\N
188170	GENERIC_DAY	1	0	2010-03-30	2225	\N	139499	\N
187529	GENERIC_DAY	1	0	2010-03-08	2239	\N	139499	\N
187849	GENERIC_DAY	1	0	2010-05-25	2231	\N	139499	\N
187512	GENERIC_DAY	1	0	2010-07-21	2223	\N	139499	\N
189985	GENERIC_DAY	1	1	2010-06-09	2251	\N	139499	\N
188053	GENERIC_DAY	1	0	2010-06-27	2241	\N	139499	\N
187525	GENERIC_DAY	1	1	2010-05-06	2243	\N	139499	\N
187431	GENERIC_DAY	1	0	2010-06-09	2223	\N	139499	\N
188899	GENERIC_DAY	1	0	2010-08-09	2231	\N	139499	\N
189239	GENERIC_DAY	1	1	2010-08-06	2241	\N	139499	\N
188846	GENERIC_DAY	1	1	2010-04-08	2247	\N	139499	\N
187516	GENERIC_DAY	1	0	2010-03-22	2247	\N	139499	\N
189071	GENERIC_DAY	1	0	2010-05-16	2233	\N	139499	\N
188236	GENERIC_DAY	1	0	2010-07-10	2231	\N	139499	\N
189466	GENERIC_DAY	1	1	2010-06-29	2243	\N	139499	\N
187882	GENERIC_DAY	1	0	2010-03-03	2233	\N	139499	\N
188145	GENERIC_DAY	1	1	2010-06-25	2233	\N	139499	\N
187749	GENERIC_DAY	1	0	2010-02-24	2233	\N	139499	\N
189655	GENERIC_DAY	1	0	2010-03-27	2249	\N	139499	\N
188343	GENERIC_DAY	1	0	2010-02-25	2247	\N	139499	\N
188448	GENERIC_DAY	1	0	2010-07-20	2241	\N	139499	\N
188035	GENERIC_DAY	1	0	2010-04-06	2239	\N	139499	\N
187473	GENERIC_DAY	1	1	2010-06-07	2233	\N	139499	\N
189784	GENERIC_DAY	1	1	2010-07-12	2233	\N	139499	\N
189988	GENERIC_DAY	1	0	2010-02-17	2239	\N	139499	\N
189108	GENERIC_DAY	1	0	2010-02-24	2249	\N	139499	\N
187497	GENERIC_DAY	1	1	2010-05-24	2247	\N	139499	\N
187883	GENERIC_DAY	1	0	2010-04-02	2229	\N	139499	\N
187880	GENERIC_DAY	1	1	2010-07-20	2235	\N	139499	\N
187807	GENERIC_DAY	1	0	2010-03-04	2235	\N	139499	\N
188154	GENERIC_DAY	1	0	2010-07-01	2223	\N	139499	\N
188021	GENERIC_DAY	1	1	2010-07-29	2233	\N	139499	\N
189256	GENERIC_DAY	1	0	2010-07-04	2247	\N	139499	\N
187457	GENERIC_DAY	1	0	2010-04-16	2235	\N	139499	\N
188524	GENERIC_DAY	1	1	2010-05-19	2237	\N	139499	\N
187711	GENERIC_DAY	1	0	2010-05-25	2229	\N	139499	\N
189500	GENERIC_DAY	1	0	2010-05-17	2225	\N	139499	\N
188895	GENERIC_DAY	1	1	2010-08-10	2249	\N	139499	\N
189565	GENERIC_DAY	1	0	2010-04-04	2229	\N	139499	\N
189643	GENERIC_DAY	1	2	2010-03-01	2251	\N	139499	\N
189372	GENERIC_DAY	1	0	2010-04-30	2239	\N	139499	\N
188196	GENERIC_DAY	1	0	2010-03-13	2237	\N	139499	\N
189788	GENERIC_DAY	1	1	2010-06-14	2237	\N	139499	\N
189133	GENERIC_DAY	1	1	2010-03-08	2241	\N	139499	\N
189943	GENERIC_DAY	1	0	2010-05-29	2239	\N	139499	\N
187519	GENERIC_DAY	1	1	2010-08-05	2251	\N	139499	\N
189980	GENERIC_DAY	1	1	2010-04-05	2237	\N	139499	\N
187502	GENERIC_DAY	1	0	2010-04-14	2223	\N	139499	\N
189836	GENERIC_DAY	1	1	2010-05-21	2233	\N	139499	\N
187726	GENERIC_DAY	1	0	2010-03-18	2243	\N	139499	\N
189183	GENERIC_DAY	1	0	2010-03-27	2245	\N	139499	\N
187840	GENERIC_DAY	1	0	2010-06-05	2241	\N	139499	\N
189930	GENERIC_DAY	1	0	2010-04-18	2237	\N	139499	\N
189446	GENERIC_DAY	1	0	2010-03-27	2247	\N	139499	\N
189915	GENERIC_DAY	1	0	2010-04-10	2245	\N	139499	\N
187443	GENERIC_DAY	1	0	2010-03-13	2225	\N	139499	\N
188342	GENERIC_DAY	1	0	2010-06-21	2225	\N	139499	\N
188542	GENERIC_DAY	1	0	2010-06-24	2239	\N	139499	\N
187813	GENERIC_DAY	1	0	2010-03-24	2249	\N	139499	\N
188417	GENERIC_DAY	1	1	2010-05-11	2235	\N	139499	\N
187679	GENERIC_DAY	1	0	2010-02-21	2233	\N	139499	\N
189506	GENERIC_DAY	1	0	2010-05-27	2241	\N	139499	\N
187848	GENERIC_DAY	1	0	2010-04-28	2223	\N	139499	\N
188929	GENERIC_DAY	1	0	2010-08-17	2247	\N	139499	\N
188375	GENERIC_DAY	1	0	2010-06-17	2225	\N	139499	\N
187969	GENERIC_DAY	1	0	2010-07-18	2229	\N	139499	\N
187900	GENERIC_DAY	1	0	2010-07-15	2239	\N	139499	\N
188888	GENERIC_DAY	1	0	2010-04-17	2233	\N	139499	\N
187545	GENERIC_DAY	1	1	2010-07-14	2247	\N	139499	\N
187729	GENERIC_DAY	1	0	2010-05-16	2251	\N	139499	\N
188030	GENERIC_DAY	1	0	2010-03-27	2225	\N	139499	\N
189174	GENERIC_DAY	1	0	2010-07-09	2249	\N	139499	\N
187987	GENERIC_DAY	1	1	2010-04-29	2235	\N	139499	\N
187641	GENERIC_DAY	1	1	2010-06-10	2249	\N	139499	\N
189726	GENERIC_DAY	1	0	2010-03-17	2225	\N	139499	\N
188837	GENERIC_DAY	1	0	2010-04-18	2229	\N	139499	\N
187420	GENERIC_DAY	1	0	2010-03-10	2249	\N	139499	\N
187562	GENERIC_DAY	1	0	2010-04-24	2223	\N	139499	\N
188798	GENERIC_DAY	1	1	2010-04-27	2245	\N	139499	\N
188212	GENERIC_DAY	1	1	2010-05-06	2235	\N	139499	\N
189452	GENERIC_DAY	1	0	2010-04-24	2241	\N	139499	\N
187494	GENERIC_DAY	1	0	2010-06-15	2229	\N	139499	\N
188133	GENERIC_DAY	1	0	2010-08-08	2247	\N	139499	\N
188522	GENERIC_DAY	1	1	2010-07-06	2251	\N	139499	\N
189699	GENERIC_DAY	1	0	2010-04-23	2239	\N	139499	\N
189952	GENERIC_DAY	1	0	2010-07-25	2243	\N	139499	\N
189808	GENERIC_DAY	1	0	2010-05-05	2225	\N	139499	\N
187604	GENERIC_DAY	1	1	2010-07-26	2247	\N	139499	\N
188716	GENERIC_DAY	1	0	2010-03-04	2231	\N	139499	\N
189581	GENERIC_DAY	1	0	2010-03-14	2249	\N	139499	\N
189463	GENERIC_DAY	1	0	2010-06-05	2245	\N	139499	\N
188340	GENERIC_DAY	1	1	2010-05-24	2243	\N	139499	\N
189155	GENERIC_DAY	1	1	2010-08-20	2243	\N	139499	\N
187517	GENERIC_DAY	1	0	2010-08-18	2225	\N	139499	\N
188764	GENERIC_DAY	1	0	2010-08-12	2249	\N	139499	\N
188966	GENERIC_DAY	1	2	2010-03-18	2241	\N	139499	\N
189953	GENERIC_DAY	1	1	2010-04-06	2231	\N	139499	\N
188172	GENERIC_DAY	1	0	2010-08-08	2225	\N	139499	\N
189624	GENERIC_DAY	1	0	2010-03-25	2231	\N	139499	\N
187651	GENERIC_DAY	1	0	2010-08-24	2239	\N	139499	\N
188258	GENERIC_DAY	1	0	2010-07-25	2241	\N	139499	\N
188778	GENERIC_DAY	1	0	2010-02-26	2233	\N	139499	\N
188980	GENERIC_DAY	1	0	2010-03-09	2237	\N	139499	\N
187757	GENERIC_DAY	1	0	2010-06-11	2237	\N	139499	\N
188539	GENERIC_DAY	1	0	2010-07-10	2225	\N	139499	\N
187533	GENERIC_DAY	1	0	2010-06-27	2235	\N	139499	\N
188412	GENERIC_DAY	1	1	2010-03-05	2245	\N	139499	\N
189700	GENERIC_DAY	1	0	2010-05-22	2225	\N	139499	\N
189580	GENERIC_DAY	1	0	2010-03-28	2225	\N	139499	\N
187910	GENERIC_DAY	1	0	2010-06-06	2249	\N	139499	\N
189052	GENERIC_DAY	1	0	2010-03-22	2239	\N	139499	\N
189211	GENERIC_DAY	1	1	2010-07-15	2249	\N	139499	\N
189178	GENERIC_DAY	1	0	2010-03-20	2229	\N	139499	\N
189053	GENERIC_DAY	1	1	2010-06-28	2245	\N	139499	\N
189994	GENERIC_DAY	1	0	2010-04-10	2251	\N	139499	\N
189632	GENERIC_DAY	1	0	2010-08-20	2233	\N	139499	\N
188462	GENERIC_DAY	1	0	2010-08-06	2225	\N	139499	\N
187856	GENERIC_DAY	1	0	2010-07-24	2237	\N	139499	\N
189571	GENERIC_DAY	1	1	2010-04-26	2249	\N	139499	\N
189031	GENERIC_DAY	1	0	2010-05-07	2235	\N	139499	\N
189145	GENERIC_DAY	1	1	2010-05-21	2231	\N	139499	\N
188361	GENERIC_DAY	1	1	2010-07-29	2245	\N	139499	\N
188611	GENERIC_DAY	1	0	2010-08-21	2231	\N	139499	\N
187816	GENERIC_DAY	1	0	2010-03-13	2233	\N	139499	\N
188665	GENERIC_DAY	1	0	2010-04-11	2237	\N	139499	\N
188277	GENERIC_DAY	1	1	2010-04-29	2243	\N	139499	\N
189375	GENERIC_DAY	1	0	2010-05-07	2243	\N	139499	\N
187630	GENERIC_DAY	1	0	2010-03-26	2225	\N	139499	\N
189740	GENERIC_DAY	1	0	2010-06-05	2237	\N	139499	\N
189799	GENERIC_DAY	1	0	2010-07-10	2251	\N	139499	\N
188518	GENERIC_DAY	1	0	2010-05-23	2249	\N	139499	\N
189824	GENERIC_DAY	1	0	2010-06-07	2225	\N	139499	\N
187899	GENERIC_DAY	1	0	2010-05-29	2241	\N	139499	\N
188416	GENERIC_DAY	1	0	2010-04-22	2225	\N	139499	\N
188519	GENERIC_DAY	1	0	2010-07-11	2225	\N	139499	\N
189296	GENERIC_DAY	1	1	2010-04-14	2247	\N	139499	\N
189219	GENERIC_DAY	1	1	2010-08-23	2233	\N	139499	\N
188570	GENERIC_DAY	1	0	2010-06-18	2237	\N	139499	\N
188488	GENERIC_DAY	1	1	2010-06-14	2247	\N	139499	\N
187993	GENERIC_DAY	1	1	2010-07-28	2237	\N	139499	\N
189496	GENERIC_DAY	1	0	2010-04-11	2223	\N	139499	\N
188232	GENERIC_DAY	1	0	2010-08-24	2235	\N	139499	\N
189821	GENERIC_DAY	1	0	2010-03-01	2235	\N	139499	\N
188540	GENERIC_DAY	1	0	2010-05-23	2245	\N	139499	\N
189116	GENERIC_DAY	1	0	2010-04-13	2233	\N	139499	\N
187885	GENERIC_DAY	1	0	2010-07-27	2223	\N	139499	\N
188933	GENERIC_DAY	1	0	2010-02-26	2249	\N	139499	\N
189534	GENERIC_DAY	1	0	2010-06-25	2235	\N	139499	\N
189749	GENERIC_DAY	1	0	2010-02-19	2225	\N	139499	\N
188979	GENERIC_DAY	1	0	2010-02-20	2243	\N	139499	\N
188085	GENERIC_DAY	1	0	2010-05-08	2249	\N	139499	\N
189572	GENERIC_DAY	1	1	2010-05-12	2235	\N	139499	\N
188147	GENERIC_DAY	1	0	2010-05-10	2239	\N	139499	\N
188500	GENERIC_DAY	1	1	2010-04-14	2251	\N	139499	\N
189132	GENERIC_DAY	1	1	2010-03-05	2223	\N	139499	\N
187960	GENERIC_DAY	1	2	2010-03-31	2251	\N	139499	\N
189522	GENERIC_DAY	1	0	2010-04-21	2239	\N	139499	\N
189660	GENERIC_DAY	1	0	2010-02-19	2249	\N	139499	\N
188680	GENERIC_DAY	1	0	2010-04-27	2229	\N	139499	\N
188807	GENERIC_DAY	1	0	2010-07-19	2229	\N	139499	\N
188800	GENERIC_DAY	1	0	2010-06-30	2229	\N	139499	\N
188720	GENERIC_DAY	1	1	2010-05-07	2223	\N	139499	\N
188001	GENERIC_DAY	1	1	2010-04-07	2243	\N	139499	\N
189224	GENERIC_DAY	1	0	2010-05-13	2241	\N	139499	\N
189860	GENERIC_DAY	1	1	2010-07-15	2233	\N	139499	\N
189124	GENERIC_DAY	1	0	2010-02-21	2249	\N	139499	\N
188987	GENERIC_DAY	1	0	2010-07-21	2239	\N	139499	\N
187868	GENERIC_DAY	1	0	2010-06-24	2241	\N	139499	\N
189926	GENERIC_DAY	1	1	2010-07-15	2251	\N	139499	\N
187937	GENERIC_DAY	1	1	2010-03-17	2237	\N	139499	\N
188390	GENERIC_DAY	1	0	2010-04-25	2235	\N	139499	\N
189235	GENERIC_DAY	1	0	2010-07-08	2239	\N	139499	\N
188960	GENERIC_DAY	1	0	2010-04-11	2241	\N	139499	\N
188700	GENERIC_DAY	1	0	2010-04-03	2239	\N	139499	\N
188302	GENERIC_DAY	1	1	2010-08-02	2247	\N	139499	\N
189150	GENERIC_DAY	1	1	2010-03-30	2237	\N	139499	\N
188937	GENERIC_DAY	1	1	2010-08-19	2237	\N	139499	\N
189323	GENERIC_DAY	1	1	2010-04-15	2239	\N	139499	\N
189087	GENERIC_DAY	1	0	2010-05-26	2239	\N	139499	\N
189097	GENERIC_DAY	1	1	2010-05-06	2237	\N	139499	\N
189152	GENERIC_DAY	1	0	2010-02-21	2223	\N	139499	\N
188642	GENERIC_DAY	1	0	2010-08-14	2239	\N	139499	\N
189364	GENERIC_DAY	1	0	2010-05-19	2223	\N	139499	\N
189520	GENERIC_DAY	1	0	2010-07-18	2237	\N	139499	\N
188496	GENERIC_DAY	1	0	2010-02-20	2231	\N	139499	\N
187500	GENERIC_DAY	1	1	2010-04-08	2241	\N	139499	\N
189779	GENERIC_DAY	1	1	2010-06-22	2251	\N	139499	\N
187778	GENERIC_DAY	1	1	2010-07-22	2233	\N	139499	\N
189608	GENERIC_DAY	1	0	2010-06-23	2223	\N	139499	\N
188735	GENERIC_DAY	1	0	2010-06-20	2245	\N	139499	\N
187800	GENERIC_DAY	1	0	2010-05-16	2245	\N	139499	\N
189818	GENERIC_DAY	1	1	2010-06-02	2235	\N	139499	\N
189798	GENERIC_DAY	1	1	2010-08-03	2237	\N	139499	\N
187673	GENERIC_DAY	1	1	2010-02-26	2229	\N	139499	\N
188712	GENERIC_DAY	1	0	2010-08-20	2239	\N	139499	\N
189419	GENERIC_DAY	1	0	2010-06-09	2229	\N	139499	\N
188018	GENERIC_DAY	1	0	2010-04-18	2241	\N	139499	\N
188005	GENERIC_DAY	1	1	2010-06-21	2233	\N	139499	\N
189576	GENERIC_DAY	1	0	2010-07-10	2229	\N	139499	\N
188274	GENERIC_DAY	1	1	2010-06-16	2243	\N	139499	\N
189819	GENERIC_DAY	1	1	2010-05-11	2247	\N	139499	\N
188768	GENERIC_DAY	1	1	2010-06-15	2235	\N	139499	\N
187929	GENERIC_DAY	1	0	2010-07-18	2247	\N	139499	\N
188103	GENERIC_DAY	1	1	2010-05-26	2243	\N	139499	\N
187451	GENERIC_DAY	1	2	2010-03-17	2251	\N	139499	\N
189423	GENERIC_DAY	1	0	2010-05-25	2225	\N	139499	\N
188049	GENERIC_DAY	1	0	2010-07-03	2245	\N	139499	\N
189918	GENERIC_DAY	1	0	2010-07-09	2237	\N	139499	\N
187619	GENERIC_DAY	1	0	2010-05-01	2233	\N	139499	\N
189035	GENERIC_DAY	1	1	2010-06-23	2235	\N	139499	\N
189126	GENERIC_DAY	1	1	2010-05-03	2243	\N	139499	\N
188404	GENERIC_DAY	1	0	2010-06-13	2239	\N	139499	\N
188490	GENERIC_DAY	1	1	2010-08-19	2241	\N	139499	\N
188534	GENERIC_DAY	1	1	2010-04-16	2229	\N	139499	\N
188538	GENERIC_DAY	1	0	2010-05-29	2225	\N	139499	\N
189294	GENERIC_DAY	1	1	2010-06-02	2251	\N	139499	\N
188477	GENERIC_DAY	1	1	2010-04-21	2251	\N	139499	\N
189507	GENERIC_DAY	1	0	2010-06-14	2231	\N	139499	\N
187607	GENERIC_DAY	1	0	2010-08-22	2249	\N	139499	\N
188674	GENERIC_DAY	1	1	2010-05-18	2251	\N	139499	\N
190025	GENERIC_DAY	1	0	2010-07-13	2231	\N	139499	\N
189304	GENERIC_DAY	1	0	2010-07-20	2239	\N	139499	\N
188387	GENERIC_DAY	1	0	2010-07-09	2243	\N	139499	\N
188612	GENERIC_DAY	1	1	2010-08-11	2229	\N	139499	\N
187836	GENERIC_DAY	1	0	2010-04-12	2223	\N	139499	\N
188201	GENERIC_DAY	1	1	2010-06-10	2245	\N	139499	\N
187863	GENERIC_DAY	1	0	2010-03-14	2239	\N	139499	\N
187650	GENERIC_DAY	1	1	2010-04-14	2239	\N	139499	\N
187511	GENERIC_DAY	1	0	2010-05-12	2223	\N	139499	\N
187421	GENERIC_DAY	1	1	2010-07-20	2233	\N	139499	\N
188437	GENERIC_DAY	1	0	2010-04-03	2233	\N	139499	\N
189675	GENERIC_DAY	1	0	2010-03-19	2249	\N	139499	\N
189659	GENERIC_DAY	1	0	2010-05-04	2229	\N	139499	\N
188069	GENERIC_DAY	1	0	2010-08-20	2231	\N	139499	\N
188579	GENERIC_DAY	1	0	2010-04-01	2235	\N	139499	\N
187694	GENERIC_DAY	1	0	2010-05-18	2229	\N	139499	\N
188360	GENERIC_DAY	1	1	2010-03-18	2223	\N	139499	\N
187526	GENERIC_DAY	1	0	2010-08-20	2245	\N	139499	\N
187616	GENERIC_DAY	1	1	2010-05-25	2249	\N	139499	\N
187733	GENERIC_DAY	1	0	2010-03-16	2235	\N	139499	\N
188264	GENERIC_DAY	1	0	2010-04-21	2225	\N	139499	\N
187496	GENERIC_DAY	1	0	2010-08-22	2239	\N	139499	\N
188120	GENERIC_DAY	1	0	2010-03-13	2247	\N	139499	\N
189057	GENERIC_DAY	1	0	2010-08-04	2241	\N	139499	\N
187808	GENERIC_DAY	1	0	2010-07-23	2251	\N	139499	\N
188480	GENERIC_DAY	1	0	2010-05-28	2239	\N	139499	\N
189456	GENERIC_DAY	1	0	2010-05-30	2223	\N	139499	\N
188114	GENERIC_DAY	1	0	2010-08-07	2225	\N	139499	\N
189656	GENERIC_DAY	1	0	2010-08-07	2241	\N	139499	\N
188861	GENERIC_DAY	1	0	2010-05-13	2229	\N	139499	\N
189176	GENERIC_DAY	1	0	2010-08-19	2251	\N	139499	\N
189238	GENERIC_DAY	1	0	2010-06-12	2243	\N	139499	\N
187581	GENERIC_DAY	1	0	2010-03-20	2235	\N	139499	\N
187866	GENERIC_DAY	1	0	2010-07-12	2239	\N	139499	\N
189472	GENERIC_DAY	1	1	2010-04-30	2233	\N	139499	\N
188580	GENERIC_DAY	1	0	2010-08-07	2231	\N	139499	\N
188056	GENERIC_DAY	1	2	2010-03-04	2251	\N	139499	\N
189295	GENERIC_DAY	1	0	2010-03-30	2231	\N	139499	\N
188447	GENERIC_DAY	1	1	2010-08-13	2249	\N	139499	\N
189690	GENERIC_DAY	1	1	2010-07-28	2245	\N	139499	\N
189532	GENERIC_DAY	1	0	2010-04-17	2223	\N	139499	\N
188031	GENERIC_DAY	1	1	2010-08-17	2241	\N	139499	\N
188445	GENERIC_DAY	1	0	2010-03-06	2251	\N	139499	\N
189805	GENERIC_DAY	1	1	2010-05-25	2235	\N	139499	\N
188086	GENERIC_DAY	1	1	2010-07-08	2251	\N	139499	\N
187917	GENERIC_DAY	1	0	2010-05-02	2245	\N	139499	\N
189291	GENERIC_DAY	1	0	2010-08-24	2237	\N	139499	\N
187495	GENERIC_DAY	1	0	2010-05-05	2229	\N	139499	\N
187506	GENERIC_DAY	1	2	2010-03-23	2241	\N	139499	\N
189938	GENERIC_DAY	1	1	2010-03-30	2229	\N	139499	\N
189080	GENERIC_DAY	1	0	2010-08-22	2247	\N	139499	\N
188770	GENERIC_DAY	1	0	2010-08-01	2229	\N	139499	\N
190001	GENERIC_DAY	1	1	2010-03-11	2223	\N	139499	\N
188217	GENERIC_DAY	1	0	2010-03-26	2231	\N	139499	\N
188812	GENERIC_DAY	1	0	2010-02-17	2233	\N	139499	\N
188430	GENERIC_DAY	1	1	2010-07-14	2249	\N	139499	\N
189831	GENERIC_DAY	1	0	2010-02-26	2247	\N	139499	\N
188391	GENERIC_DAY	1	1	2010-08-05	2245	\N	139499	\N
189332	GENERIC_DAY	1	1	2010-05-31	2235	\N	139499	\N
4043	GENERIC_DAY	4	0	2010-03-06	2225	\N	3641	\N
4033	GENERIC_DAY	4	0	2010-02-14	2225	\N	3641	\N
4030	GENERIC_DAY	4	16	2010-03-23	2225	\N	3641	\N
4037	GENERIC_DAY	4	16	2010-03-19	2225	\N	3641	\N
4032	GENERIC_DAY	4	16	2010-03-22	2225	\N	3641	\N
4052	GENERIC_DAY	4	16	2010-03-12	2225	\N	3641	\N
4074	GENERIC_DAY	4	16	2010-03-16	2225	\N	3641	\N
4049	GENERIC_DAY	4	16	2010-02-02	2225	\N	3641	\N
4056	GENERIC_DAY	4	16	2010-02-16	2225	\N	3641	\N
4065	GENERIC_DAY	4	16	2010-02-11	2225	\N	3641	\N
4054	GENERIC_DAY	4	0	2010-02-27	2225	\N	3641	\N
4050	GENERIC_DAY	4	16	2010-02-08	2225	\N	3641	\N
4069	GENERIC_DAY	4	16	2010-03-03	2225	\N	3641	\N
4042	GENERIC_DAY	4	16	2010-02-25	2225	\N	3641	\N
4041	GENERIC_DAY	4	0	2010-02-06	2225	\N	3641	\N
4066	GENERIC_DAY	4	8	2010-03-24	2225	\N	3641	\N
4071	GENERIC_DAY	4	16	2010-02-26	2225	\N	3641	\N
4064	GENERIC_DAY	4	0	2010-03-20	2225	\N	3641	\N
4031	GENERIC_DAY	4	16	2010-03-15	2225	\N	3641	\N
4051	GENERIC_DAY	4	0	2010-02-20	2225	\N	3641	\N
4039	GENERIC_DAY	4	16	2010-03-11	2225	\N	3641	\N
4047	GENERIC_DAY	4	0	2010-03-14	2225	\N	3641	\N
4062	GENERIC_DAY	4	16	2010-02-22	2225	\N	3641	\N
4060	GENERIC_DAY	4	0	2010-02-28	2225	\N	3641	\N
4034	GENERIC_DAY	4	16	2010-02-05	2225	\N	3641	\N
4044	GENERIC_DAY	4	0	2010-02-21	2225	\N	3641	\N
4057	GENERIC_DAY	4	16	2010-03-05	2225	\N	3641	\N
4075	GENERIC_DAY	4	16	2010-02-17	2225	\N	3641	\N
4067	GENERIC_DAY	4	16	2010-02-24	2225	\N	3641	\N
4046	GENERIC_DAY	4	16	2010-03-02	2225	\N	3641	\N
4040	GENERIC_DAY	4	16	2010-03-04	2225	\N	3641	\N
4079	GENERIC_DAY	4	16	2010-03-18	2225	\N	3641	\N
4061	GENERIC_DAY	4	16	2010-02-10	2225	\N	3641	\N
4078	GENERIC_DAY	4	16	2010-03-09	2225	\N	3641	\N
4080	GENERIC_DAY	4	16	2010-02-03	2225	\N	3641	\N
4076	GENERIC_DAY	4	0	2010-03-07	2225	\N	3641	\N
4053	GENERIC_DAY	4	0	2010-02-13	2225	\N	3641	\N
4055	GENERIC_DAY	4	16	2010-02-19	2225	\N	3641	\N
4048	GENERIC_DAY	4	0	2010-03-13	2225	\N	3641	\N
4072	GENERIC_DAY	4	16	2010-03-17	2225	\N	3641	\N
4070	GENERIC_DAY	4	16	2010-02-04	2225	\N	3641	\N
4036	GENERIC_DAY	4	0	2010-02-07	2225	\N	3641	\N
4029	GENERIC_DAY	4	16	2010-02-09	2225	\N	3641	\N
4038	GENERIC_DAY	4	16	2010-02-23	2225	\N	3641	\N
4059	GENERIC_DAY	4	16	2010-02-01	2225	\N	3641	\N
4068	GENERIC_DAY	4	16	2010-02-15	2225	\N	3641	\N
4045	GENERIC_DAY	4	0	2010-03-21	2225	\N	3641	\N
4077	GENERIC_DAY	4	16	2010-02-12	2225	\N	3641	\N
4073	GENERIC_DAY	4	16	2010-03-10	2225	\N	3641	\N
4035	GENERIC_DAY	4	16	2010-03-08	2225	\N	3641	\N
4063	GENERIC_DAY	4	16	2010-03-01	2225	\N	3641	\N
4058	GENERIC_DAY	4	16	2010-02-18	2225	\N	3641	\N
247686	GENERIC_DAY	0	7	2010-02-23	2251	\N	244926	\N
247687	GENERIC_DAY	0	0	2010-03-08	2249	\N	244926	\N
247688	GENERIC_DAY	0	0	2010-02-20	2247	\N	244926	\N
247689	GENERIC_DAY	0	0	2010-03-08	2237	\N	244926	\N
247690	GENERIC_DAY	0	0	2010-02-25	2225	\N	244926	\N
247691	GENERIC_DAY	0	0	2010-02-28	2243	\N	244926	\N
247692	GENERIC_DAY	0	0	2010-02-20	2233	\N	244926	\N
247693	GENERIC_DAY	0	7	2010-02-17	2251	\N	244926	\N
247694	GENERIC_DAY	0	0	2010-03-06	2233	\N	244926	\N
247695	GENERIC_DAY	0	3	2010-03-05	2249	\N	244926	\N
247696	GENERIC_DAY	0	4	2010-03-04	2247	\N	244926	\N
247697	GENERIC_DAY	0	0	2010-03-08	2233	\N	244926	\N
247698	GENERIC_DAY	0	0	2010-02-21	2243	\N	244926	\N
247699	GENERIC_DAY	0	0	2010-02-27	2233	\N	244926	\N
247700	GENERIC_DAY	0	4	2010-02-18	2243	\N	244926	\N
247701	GENERIC_DAY	0	8	2010-02-25	2245	\N	244926	\N
247702	GENERIC_DAY	0	0	2010-03-06	2225	\N	244926	\N
247703	GENERIC_DAY	0	0	2010-03-07	2237	\N	244926	\N
247704	GENERIC_DAY	0	8	2010-03-02	2223	\N	244926	\N
247705	GENERIC_DAY	0	0	2010-03-06	2247	\N	244926	\N
247706	GENERIC_DAY	0	0	2010-03-06	2243	\N	244926	\N
247707	GENERIC_DAY	0	0	2010-03-06	2235	\N	244926	\N
247708	GENERIC_DAY	0	4	2010-03-04	2233	\N	244926	\N
247709	GENERIC_DAY	0	7	2010-02-18	2235	\N	244926	\N
247710	GENERIC_DAY	0	0	2010-02-20	2237	\N	244926	\N
247711	GENERIC_DAY	0	7	2010-02-23	2237	\N	244926	\N
247712	GENERIC_DAY	0	8	2010-02-17	2239	\N	244926	\N
247713	GENERIC_DAY	0	7	2010-02-24	2235	\N	244926	\N
247714	GENERIC_DAY	0	0	2010-03-03	2225	\N	244926	\N
247715	GENERIC_DAY	0	0	2010-02-28	2237	\N	244926	\N
247716	GENERIC_DAY	0	3	2010-02-26	2231	\N	244926	\N
247717	GENERIC_DAY	0	0	2010-02-27	2251	\N	244926	\N
247718	GENERIC_DAY	0	4	2010-02-25	2231	\N	244926	\N
247719	GENERIC_DAY	0	8	2010-02-24	2245	\N	244926	\N
247720	GENERIC_DAY	0	0	2010-02-21	2235	\N	244926	\N
247721	GENERIC_DAY	0	0	2010-02-20	2239	\N	244926	\N
247722	GENERIC_DAY	0	3	2010-03-08	2229	\N	244926	\N
247723	GENERIC_DAY	0	7	2010-02-17	2229	\N	244926	\N
247724	GENERIC_DAY	0	2	2010-03-08	2235	\N	244926	\N
247725	GENERIC_DAY	0	7	2010-02-24	2251	\N	244926	\N
247726	GENERIC_DAY	0	7	2010-03-02	2235	\N	244926	\N
247727	GENERIC_DAY	0	6	2010-02-26	2239	\N	244926	\N
247728	GENERIC_DAY	0	8	2010-02-24	2223	\N	244926	\N
247729	GENERIC_DAY	0	7	2010-02-19	2245	\N	244926	\N
247730	GENERIC_DAY	0	0	2010-03-04	2225	\N	244926	\N
247731	GENERIC_DAY	0	7	2010-03-05	2245	\N	244926	\N
247732	GENERIC_DAY	0	0	2010-02-28	2249	\N	244926	\N
247733	GENERIC_DAY	0	4	2010-03-02	2247	\N	244926	\N
247734	GENERIC_DAY	0	0	2010-02-20	2235	\N	244926	\N
247735	GENERIC_DAY	0	8	2010-02-17	2223	\N	244926	\N
247736	GENERIC_DAY	0	0	2010-02-27	2243	\N	244926	\N
247737	GENERIC_DAY	0	4	2010-02-25	2233	\N	244926	\N
247738	GENERIC_DAY	0	7	2010-03-02	2237	\N	244926	\N
247739	GENERIC_DAY	0	7	2010-02-25	2251	\N	244926	\N
247740	GENERIC_DAY	0	3	2010-03-05	2231	\N	244926	\N
247741	GENERIC_DAY	0	0	2010-02-18	2225	\N	244926	\N
247742	GENERIC_DAY	0	4	2010-02-18	2233	\N	244926	\N
247743	GENERIC_DAY	0	4	2010-02-22	2233	\N	244926	\N
247744	GENERIC_DAY	0	4	2010-02-24	2243	\N	244926	\N
247745	GENERIC_DAY	0	4	2010-02-24	2233	\N	244926	\N
247746	GENERIC_DAY	0	4	2010-03-04	2249	\N	244926	\N
247747	GENERIC_DAY	0	0	2010-02-21	2231	\N	244926	\N
247748	GENERIC_DAY	0	0	2010-03-05	2225	\N	244926	\N
247749	GENERIC_DAY	0	6	2010-02-19	2239	\N	244926	\N
247750	GENERIC_DAY	0	0	2010-03-07	2245	\N	244926	\N
247751	GENERIC_DAY	0	0	2010-02-28	2233	\N	244926	\N
247752	GENERIC_DAY	0	8	2010-03-04	2223	\N	244926	\N
247753	GENERIC_DAY	0	4	2010-03-02	2249	\N	244926	\N
247754	GENERIC_DAY	0	8	2010-02-18	2239	\N	244926	\N
247755	GENERIC_DAY	0	0	2010-03-07	2239	\N	244926	\N
247756	GENERIC_DAY	0	0	2010-02-20	2241	\N	244926	\N
247757	GENERIC_DAY	0	8	2010-02-25	2223	\N	244926	\N
247758	GENERIC_DAY	0	0	2010-02-17	2225	\N	244926	\N
247759	GENERIC_DAY	0	8	2010-02-18	2223	\N	244926	\N
247760	GENERIC_DAY	0	0	2010-02-27	2247	\N	244926	\N
247761	GENERIC_DAY	0	6	2010-02-19	2229	\N	244926	\N
247762	GENERIC_DAY	0	0	2010-03-06	2223	\N	244926	\N
247763	GENERIC_DAY	0	0	2010-02-21	2225	\N	244926	\N
247764	GENERIC_DAY	0	3	2010-03-05	2233	\N	244926	\N
247765	GENERIC_DAY	0	8	2010-02-23	2223	\N	244926	\N
247766	GENERIC_DAY	0	7	2010-02-22	2237	\N	244926	\N
247767	GENERIC_DAY	0	8	2010-03-01	2223	\N	244926	\N
247768	GENERIC_DAY	0	8	2010-03-04	2241	\N	244926	\N
247769	GENERIC_DAY	0	8	2010-02-25	2239	\N	244926	\N
247770	GENERIC_DAY	0	3	2010-02-19	2247	\N	244926	\N
247771	GENERIC_DAY	0	8	2010-03-01	2245	\N	244926	\N
247772	GENERIC_DAY	0	4	2010-02-23	2247	\N	244926	\N
247773	GENERIC_DAY	0	0	2010-02-21	2229	\N	244926	\N
247774	GENERIC_DAY	0	0	2010-02-20	2225	\N	244926	\N
247775	GENERIC_DAY	0	4	2010-03-03	2231	\N	244926	\N
247776	GENERIC_DAY	0	5	2010-03-05	2237	\N	244926	\N
247777	GENERIC_DAY	0	0	2010-02-28	2231	\N	244926	\N
247778	GENERIC_DAY	0	0	2010-02-27	2225	\N	244926	\N
247779	GENERIC_DAY	0	0	2010-02-28	2229	\N	244926	\N
247780	GENERIC_DAY	0	8	2010-02-23	2241	\N	244926	\N
247781	GENERIC_DAY	0	0	2010-03-07	2249	\N	244926	\N
247782	GENERIC_DAY	0	8	2010-03-01	2239	\N	244926	\N
247783	GENERIC_DAY	0	0	2010-02-27	2229	\N	244926	\N
247784	GENERIC_DAY	0	0	2010-03-06	2241	\N	244926	\N
247785	GENERIC_DAY	0	5	2010-02-19	2251	\N	244926	\N
247786	GENERIC_DAY	0	8	2010-03-04	2239	\N	244926	\N
247787	GENERIC_DAY	0	4	2010-02-23	2243	\N	244926	\N
247788	GENERIC_DAY	0	4	2010-02-24	2249	\N	244926	\N
247789	GENERIC_DAY	0	2	2010-03-08	2251	\N	244926	\N
247790	GENERIC_DAY	0	4	2010-02-17	2249	\N	244926	\N
247791	GENERIC_DAY	0	0	2010-02-28	2235	\N	244926	\N
247792	GENERIC_DAY	0	8	2010-02-18	2241	\N	244926	\N
247793	GENERIC_DAY	0	4	2010-02-17	2231	\N	244926	\N
247794	GENERIC_DAY	0	0	2010-03-07	2223	\N	244926	\N
247795	GENERIC_DAY	0	4	2010-03-02	2231	\N	244926	\N
247796	GENERIC_DAY	0	0	2010-03-08	2243	\N	244926	\N
247797	GENERIC_DAY	0	0	2010-02-23	2225	\N	244926	\N
247798	GENERIC_DAY	0	7	2010-03-02	2251	\N	244926	\N
247799	GENERIC_DAY	0	8	2010-03-02	2245	\N	244926	\N
247800	GENERIC_DAY	0	0	2010-03-06	2231	\N	244926	\N
247801	GENERIC_DAY	0	5	2010-03-05	2223	\N	244926	\N
247802	GENERIC_DAY	0	4	2010-03-04	2243	\N	244926	\N
247803	GENERIC_DAY	0	8	2010-03-03	2223	\N	244926	\N
247804	GENERIC_DAY	0	0	2010-02-21	2241	\N	244926	\N
247805	GENERIC_DAY	0	7	2010-02-23	2229	\N	244926	\N
247806	GENERIC_DAY	0	5	2010-03-05	2251	\N	244926	\N
247807	GENERIC_DAY	0	7	2010-03-03	2251	\N	244926	\N
247808	GENERIC_DAY	0	0	2010-03-06	2239	\N	244926	\N
247809	GENERIC_DAY	0	0	2010-03-06	2237	\N	244926	\N
247810	GENERIC_DAY	0	7	2010-02-25	2237	\N	244926	\N
247811	GENERIC_DAY	0	8	2010-03-04	2245	\N	244926	\N
247812	GENERIC_DAY	0	0	2010-03-02	2225	\N	244926	\N
247813	GENERIC_DAY	0	8	2010-03-03	2245	\N	244926	\N
247814	GENERIC_DAY	0	8	2010-03-03	2239	\N	244926	\N
247815	GENERIC_DAY	0	0	2010-02-21	2251	\N	244926	\N
247816	GENERIC_DAY	0	4	2010-03-01	2247	\N	244926	\N
247817	GENERIC_DAY	0	7	2010-02-18	2229	\N	244926	\N
247818	GENERIC_DAY	0	0	2010-03-07	2241	\N	244926	\N
247819	GENERIC_DAY	0	0	2010-02-20	2229	\N	244926	\N
247820	GENERIC_DAY	0	5	2010-02-26	2251	\N	244926	\N
247821	GENERIC_DAY	0	0	2010-02-20	2243	\N	244926	\N
247822	GENERIC_DAY	0	0	2010-02-27	2249	\N	244926	\N
247823	GENERIC_DAY	0	8	2010-02-25	2241	\N	244926	\N
247824	GENERIC_DAY	0	3	2010-03-05	2247	\N	244926	\N
247825	GENERIC_DAY	0	4	2010-03-01	2249	\N	244926	\N
247826	GENERIC_DAY	0	0	2010-03-06	2251	\N	244926	\N
247827	GENERIC_DAY	0	3	2010-02-26	2247	\N	244926	\N
247828	GENERIC_DAY	0	4	2010-02-22	2231	\N	244926	\N
247829	GENERIC_DAY	0	7	2010-03-04	2229	\N	244926	\N
247830	GENERIC_DAY	0	6	2010-03-05	2241	\N	244926	\N
247831	GENERIC_DAY	0	0	2010-03-06	2229	\N	244926	\N
247832	GENERIC_DAY	0	7	2010-03-01	2237	\N	244926	\N
247833	GENERIC_DAY	0	0	2010-02-28	2223	\N	244926	\N
247834	GENERIC_DAY	0	8	2010-02-22	2239	\N	244926	\N
247835	GENERIC_DAY	0	3	2010-03-05	2243	\N	244926	\N
247836	GENERIC_DAY	0	4	2010-03-02	2243	\N	244926	\N
247837	GENERIC_DAY	0	0	2010-03-08	2231	\N	244926	\N
247838	GENERIC_DAY	0	7	2010-02-22	2229	\N	244926	\N
247839	GENERIC_DAY	0	8	2010-02-22	2223	\N	244926	\N
247840	GENERIC_DAY	0	0	2010-02-27	2245	\N	244926	\N
247841	GENERIC_DAY	0	7	2010-02-25	2235	\N	244926	\N
247842	GENERIC_DAY	0	0	2010-02-27	2237	\N	244926	\N
247843	GENERIC_DAY	0	0	2010-02-20	2251	\N	244926	\N
247844	GENERIC_DAY	0	0	2010-03-06	2245	\N	244926	\N
247845	GENERIC_DAY	0	0	2010-02-28	2225	\N	244926	\N
247846	GENERIC_DAY	0	3	2010-03-08	2223	\N	244926	\N
247847	GENERIC_DAY	0	8	2010-02-24	2239	\N	244926	\N
247848	GENERIC_DAY	0	0	2010-03-07	2235	\N	244926	\N
247849	GENERIC_DAY	0	3	2010-02-19	2231	\N	244926	\N
247850	GENERIC_DAY	0	3	2010-02-19	2243	\N	244926	\N
247851	GENERIC_DAY	0	7	2010-03-01	2229	\N	244926	\N
247852	GENERIC_DAY	0	4	2010-02-23	2233	\N	244926	\N
247853	GENERIC_DAY	0	4	2010-02-22	2243	\N	244926	\N
247854	GENERIC_DAY	0	0	2010-03-07	2233	\N	244926	\N
247855	GENERIC_DAY	0	0	2010-02-27	2231	\N	244926	\N
247856	GENERIC_DAY	0	4	2010-02-18	2249	\N	244926	\N
247857	GENERIC_DAY	0	3	2010-02-26	2233	\N	244926	\N
247858	GENERIC_DAY	0	4	2010-02-18	2247	\N	244926	\N
247859	GENERIC_DAY	0	3	2010-02-26	2249	\N	244926	\N
247860	GENERIC_DAY	0	8	2010-02-17	2241	\N	244926	\N
247861	GENERIC_DAY	0	0	2010-03-06	2249	\N	244926	\N
247862	GENERIC_DAY	0	6	2010-03-05	2229	\N	244926	\N
247863	GENERIC_DAY	0	0	2010-02-21	2233	\N	244926	\N
247864	GENERIC_DAY	0	4	2010-03-01	2243	\N	244926	\N
247865	GENERIC_DAY	0	7	2010-03-04	2251	\N	244926	\N
247866	GENERIC_DAY	0	7	2010-03-04	2237	\N	244926	\N
247867	GENERIC_DAY	0	8	2010-02-17	2245	\N	244926	\N
247868	GENERIC_DAY	0	8	2010-02-23	2239	\N	244926	\N
247869	GENERIC_DAY	0	0	2010-03-07	2251	\N	244926	\N
247870	GENERIC_DAY	0	0	2010-02-27	2239	\N	244926	\N
247871	GENERIC_DAY	0	0	2010-02-27	2235	\N	244926	\N
247872	GENERIC_DAY	0	5	2010-02-19	2223	\N	244926	\N
247873	GENERIC_DAY	0	4	2010-03-03	2243	\N	244926	\N
247874	GENERIC_DAY	0	8	2010-02-23	2245	\N	244926	\N
247875	GENERIC_DAY	0	4	2010-03-08	2245	\N	244926	\N
247876	GENERIC_DAY	0	3	2010-02-19	2233	\N	244926	\N
247877	GENERIC_DAY	0	0	2010-03-07	2229	\N	244926	\N
247878	GENERIC_DAY	0	0	2010-02-28	2247	\N	244926	\N
247879	GENERIC_DAY	0	0	2010-02-21	2237	\N	244926	\N
247880	GENERIC_DAY	0	4	2010-03-03	2249	\N	244926	\N
247881	GENERIC_DAY	0	6	2010-02-26	2229	\N	244926	\N
247882	GENERIC_DAY	0	6	2010-02-19	2241	\N	244926	\N
247883	GENERIC_DAY	0	4	2010-02-24	2247	\N	244926	\N
247884	GENERIC_DAY	0	7	2010-02-25	2229	\N	244926	\N
247885	GENERIC_DAY	0	4	2010-03-03	2247	\N	244926	\N
247886	GENERIC_DAY	0	0	2010-02-21	2247	\N	244926	\N
247887	GENERIC_DAY	0	4	2010-02-25	2243	\N	244926	\N
247888	GENERIC_DAY	0	7	2010-02-22	2251	\N	244926	\N
247889	GENERIC_DAY	0	4	2010-02-23	2249	\N	244926	\N
247890	GENERIC_DAY	0	8	2010-02-24	2241	\N	244926	\N
247891	GENERIC_DAY	0	7	2010-03-03	2237	\N	244926	\N
247892	GENERIC_DAY	0	7	2010-03-04	2235	\N	244926	\N
247893	GENERIC_DAY	0	6	2010-02-26	2241	\N	244926	\N
247894	GENERIC_DAY	0	8	2010-02-18	2245	\N	244926	\N
247895	GENERIC_DAY	0	5	2010-02-19	2237	\N	244926	\N
247896	GENERIC_DAY	0	8	2010-03-01	2241	\N	244926	\N
247897	GENERIC_DAY	0	4	2010-02-22	2249	\N	244926	\N
247898	GENERIC_DAY	0	7	2010-02-22	2235	\N	244926	\N
247899	GENERIC_DAY	0	0	2010-02-28	2245	\N	244926	\N
247900	GENERIC_DAY	0	5	2010-02-19	2235	\N	244926	\N
247901	GENERIC_DAY	0	0	2010-03-07	2225	\N	244926	\N
247902	GENERIC_DAY	0	7	2010-02-18	2251	\N	244926	\N
247903	GENERIC_DAY	0	3	2010-02-19	2249	\N	244926	\N
247904	GENERIC_DAY	0	0	2010-02-26	2225	\N	244926	\N
247905	GENERIC_DAY	0	0	2010-02-24	2225	\N	244926	\N
247906	GENERIC_DAY	0	5	2010-02-26	2235	\N	244926	\N
247907	GENERIC_DAY	0	0	2010-02-21	2239	\N	244926	\N
247908	GENERIC_DAY	0	0	2010-02-20	2231	\N	244926	\N
247909	GENERIC_DAY	0	5	2010-02-26	2237	\N	244926	\N
247910	GENERIC_DAY	0	8	2010-02-22	2241	\N	244926	\N
247911	GENERIC_DAY	0	0	2010-03-08	2247	\N	244926	\N
247912	GENERIC_DAY	0	4	2010-02-25	2247	\N	244926	\N
247913	GENERIC_DAY	0	7	2010-02-18	2237	\N	244926	\N
247914	GENERIC_DAY	0	8	2010-02-22	2245	\N	244926	\N
247915	GENERIC_DAY	0	0	2010-02-21	2249	\N	244926	\N
247916	GENERIC_DAY	0	7	2010-02-17	2237	\N	244926	\N
247917	GENERIC_DAY	0	7	2010-03-01	2235	\N	244926	\N
247918	GENERIC_DAY	0	0	2010-02-21	2245	\N	244926	\N
247919	GENERIC_DAY	0	4	2010-02-24	2231	\N	244926	\N
247920	GENERIC_DAY	0	0	2010-03-07	2231	\N	244926	\N
247921	GENERIC_DAY	0	0	2010-02-28	2239	\N	244926	\N
247922	GENERIC_DAY	0	4	2010-02-22	2247	\N	244926	\N
247923	GENERIC_DAY	0	0	2010-03-08	2225	\N	244926	\N
247924	GENERIC_DAY	0	4	2010-02-17	2243	\N	244926	\N
247925	GENERIC_DAY	0	8	2010-03-02	2241	\N	244926	\N
247926	GENERIC_DAY	0	3	2010-03-08	2241	\N	244926	\N
247927	GENERIC_DAY	0	0	2010-02-27	2241	\N	244926	\N
247928	GENERIC_DAY	0	7	2010-03-02	2229	\N	244926	\N
247929	GENERIC_DAY	0	0	2010-03-01	2225	\N	244926	\N
247930	GENERIC_DAY	0	0	2010-02-19	2225	\N	244926	\N
247931	GENERIC_DAY	0	0	2010-02-20	2245	\N	244926	\N
247932	GENERIC_DAY	0	0	2010-02-28	2241	\N	244926	\N
247933	GENERIC_DAY	0	7	2010-03-03	2229	\N	244926	\N
247934	GENERIC_DAY	0	0	2010-02-20	2223	\N	244926	\N
247935	GENERIC_DAY	0	0	2010-02-27	2223	\N	244926	\N
247936	GENERIC_DAY	0	5	2010-02-26	2223	\N	244926	\N
247937	GENERIC_DAY	0	4	2010-03-01	2231	\N	244926	\N
247938	GENERIC_DAY	0	0	2010-02-28	2251	\N	244926	\N
247939	GENERIC_DAY	0	7	2010-02-26	2245	\N	244926	\N
247940	GENERIC_DAY	0	7	2010-02-23	2235	\N	244926	\N
247941	GENERIC_DAY	0	7	2010-02-24	2229	\N	244926	\N
247942	GENERIC_DAY	0	3	2010-02-26	2243	\N	244926	\N
247943	GENERIC_DAY	0	3	2010-03-08	2239	\N	244926	\N
247944	GENERIC_DAY	0	4	2010-03-03	2233	\N	244926	\N
247945	GENERIC_DAY	0	4	2010-02-17	2233	\N	244926	\N
247946	GENERIC_DAY	0	0	2010-02-20	2249	\N	244926	\N
247947	GENERIC_DAY	0	5	2010-03-05	2235	\N	244926	\N
247948	GENERIC_DAY	0	8	2010-03-02	2239	\N	244926	\N
247949	GENERIC_DAY	0	8	2010-03-03	2241	\N	244926	\N
247950	GENERIC_DAY	0	4	2010-03-01	2233	\N	244926	\N
247951	GENERIC_DAY	0	4	2010-02-25	2249	\N	244926	\N
247952	GENERIC_DAY	0	0	2010-03-07	2243	\N	244926	\N
247953	GENERIC_DAY	0	7	2010-02-24	2237	\N	244926	\N
247954	GENERIC_DAY	0	4	2010-03-02	2233	\N	244926	\N
247955	GENERIC_DAY	0	4	2010-02-23	2231	\N	244926	\N
247956	GENERIC_DAY	0	7	2010-02-17	2235	\N	244926	\N
247957	GENERIC_DAY	0	4	2010-02-18	2231	\N	244926	\N
247958	GENERIC_DAY	0	7	2010-03-03	2235	\N	244926	\N
247959	GENERIC_DAY	0	4	2010-03-04	2231	\N	244926	\N
247960	GENERIC_DAY	0	0	2010-03-07	2247	\N	244926	\N
247961	GENERIC_DAY	0	6	2010-03-05	2239	\N	244926	\N
247962	GENERIC_DAY	0	4	2010-02-17	2247	\N	244926	\N
247963	GENERIC_DAY	0	0	2010-02-22	2225	\N	244926	\N
247964	GENERIC_DAY	0	0	2010-02-21	2223	\N	244926	\N
247965	GENERIC_DAY	0	7	2010-03-01	2251	\N	244926	\N
126306	GENERIC_DAY	0	0	2010-04-17	2225	\N	3642	\N
126307	GENERIC_DAY	0	10	2010-06-15	2225	\N	3642	\N
126308	GENERIC_DAY	0	7	2010-03-26	2225	\N	3642	\N
126309	GENERIC_DAY	0	10	2010-05-20	2225	\N	3642	\N
126310	GENERIC_DAY	0	10	2010-05-03	2225	\N	3642	\N
126311	GENERIC_DAY	0	7	2010-06-11	2225	\N	3642	\N
126312	GENERIC_DAY	0	10	2010-06-17	2225	\N	3642	\N
126313	GENERIC_DAY	0	10	2010-06-14	2225	\N	3642	\N
126314	GENERIC_DAY	0	0	2010-06-06	2225	\N	3642	\N
126315	GENERIC_DAY	0	10	2010-04-07	2225	\N	3642	\N
126316	GENERIC_DAY	0	0	2010-05-09	2225	\N	3642	\N
126317	GENERIC_DAY	0	0	2010-04-10	2225	\N	3642	\N
126318	GENERIC_DAY	0	0	2010-05-02	2225	\N	3642	\N
126319	GENERIC_DAY	0	10	2010-04-27	2225	\N	3642	\N
126320	GENERIC_DAY	0	10	2010-04-22	2225	\N	3642	\N
126321	GENERIC_DAY	0	10	2010-06-22	2225	\N	3642	\N
126322	GENERIC_DAY	0	10	2010-05-12	2225	\N	3642	\N
126323	GENERIC_DAY	0	10	2010-05-31	2225	\N	3642	\N
126324	GENERIC_DAY	0	0	2010-04-18	2225	\N	3642	\N
126325	GENERIC_DAY	0	3	2011-01-06	2231	\N	3650	\N
126326	GENERIC_DAY	0	2	2011-12-22	2231	\N	3650	\N
126327	GENERIC_DAY	0	1	2011-09-09	2233	\N	3650	\N
126328	GENERIC_DAY	0	2	2010-10-07	2229	\N	3650	\N
126329	GENERIC_DAY	0	2	2011-09-07	2225	\N	3650	\N
126330	GENERIC_DAY	0	2	2011-07-14	2229	\N	3650	\N
126331	GENERIC_DAY	0	1	2011-01-10	2223	\N	3650	\N
126332	GENERIC_DAY	0	2	2011-11-03	2231	\N	3650	\N
126333	GENERIC_DAY	0	1	2012-02-13	2223	\N	3650	\N
126334	GENERIC_DAY	0	0	2011-12-18	2223	\N	3650	\N
126335	GENERIC_DAY	0	0	2011-08-06	2231	\N	3650	\N
126336	GENERIC_DAY	0	2	2011-10-26	2225	\N	3650	\N
126337	GENERIC_DAY	0	1	2012-01-27	2223	\N	3650	\N
126338	GENERIC_DAY	0	1	2011-09-30	2225	\N	3650	\N
126339	GENERIC_DAY	0	2	2011-02-25	2233	\N	3650	\N
126340	GENERIC_DAY	0	1	2011-12-23	2223	\N	3650	\N
126341	GENERIC_DAY	0	2	2012-01-27	2231	\N	3650	\N
126342	GENERIC_DAY	0	1	2011-07-22	2233	\N	3650	\N
126343	GENERIC_DAY	0	2	2012-01-16	2231	\N	3650	\N
126344	GENERIC_DAY	0	0	2010-12-05	2225	\N	3650	\N
126345	GENERIC_DAY	0	0	2012-01-28	2225	\N	3650	\N
126346	GENERIC_DAY	0	0	2012-01-29	2229	\N	3650	\N
126347	GENERIC_DAY	0	1	2011-12-02	2223	\N	3650	\N
126348	GENERIC_DAY	0	0	2010-10-13	2225	\N	3650	\N
126349	GENERIC_DAY	0	0	2011-05-21	2225	\N	3650	\N
126350	GENERIC_DAY	0	2	2011-02-15	2229	\N	3650	\N
126351	GENERIC_DAY	0	0	2011-08-13	2233	\N	3650	\N
126352	GENERIC_DAY	0	0	2012-02-04	2233	\N	3650	\N
126353	GENERIC_DAY	0	1	2011-05-16	2223	\N	3650	\N
126354	GENERIC_DAY	0	0	2010-08-18	2225	\N	3650	\N
126355	GENERIC_DAY	0	0	2011-12-10	2233	\N	3650	\N
126356	GENERIC_DAY	0	1	2011-10-27	2223	\N	3650	\N
126357	GENERIC_DAY	0	0	2011-04-26	2225	\N	3650	\N
126358	GENERIC_DAY	0	2	2011-06-14	2229	\N	3650	\N
126359	GENERIC_DAY	0	2	2011-02-10	2229	\N	3650	\N
126360	GENERIC_DAY	0	2	2011-02-15	2233	\N	3650	\N
126361	GENERIC_DAY	0	2	2012-01-04	2229	\N	3650	\N
126362	GENERIC_DAY	0	2	2012-01-09	2229	\N	3650	\N
126363	GENERIC_DAY	0	2	2012-02-08	2231	\N	3650	\N
126364	GENERIC_DAY	0	0	2011-06-26	2225	\N	3650	\N
126365	GENERIC_DAY	0	2	2010-11-10	2233	\N	3650	\N
126366	GENERIC_DAY	0	0	2010-10-24	2233	\N	3650	\N
126367	GENERIC_DAY	0	0	2011-01-29	2223	\N	3650	\N
126368	GENERIC_DAY	0	2	2011-09-28	2231	\N	3650	\N
126369	GENERIC_DAY	0	0	2011-11-20	2223	\N	3650	\N
126370	GENERIC_DAY	0	0	2010-12-05	2233	\N	3650	\N
126371	GENERIC_DAY	0	1	2011-10-07	2233	\N	3650	\N
126372	GENERIC_DAY	0	0	2011-05-12	2225	\N	3650	\N
126373	GENERIC_DAY	0	0	2011-10-02	2225	\N	3650	\N
126374	GENERIC_DAY	0	2	2012-01-26	2225	\N	3650	\N
126375	GENERIC_DAY	0	1	2010-09-17	2229	\N	3650	\N
126376	GENERIC_DAY	0	0	2010-12-26	2223	\N	3650	\N
126377	GENERIC_DAY	0	0	2011-03-05	2231	\N	3650	\N
126378	GENERIC_DAY	0	0	2010-11-06	2231	\N	3650	\N
126379	GENERIC_DAY	0	0	2010-11-07	2231	\N	3650	\N
126380	GENERIC_DAY	0	3	2010-10-14	2231	\N	3650	\N
126381	GENERIC_DAY	0	1	2011-09-02	2233	\N	3650	\N
126382	GENERIC_DAY	0	0	2010-12-06	2231	\N	3650	\N
126383	GENERIC_DAY	0	3	2010-08-26	2231	\N	3650	\N
126384	GENERIC_DAY	0	0	2010-10-31	2225	\N	3650	\N
126385	GENERIC_DAY	0	2	2011-12-15	2231	\N	3650	\N
126386	GENERIC_DAY	0	2	2011-10-04	2231	\N	3650	\N
126387	GENERIC_DAY	0	1	2012-01-25	2233	\N	3650	\N
126388	GENERIC_DAY	0	1	2010-08-19	2223	\N	3650	\N
126389	GENERIC_DAY	0	0	2012-02-05	2229	\N	3650	\N
126390	GENERIC_DAY	0	1	2011-06-07	2223	\N	3650	\N
126391	GENERIC_DAY	0	3	2011-06-02	2231	\N	3650	\N
126392	GENERIC_DAY	0	0	2010-11-21	2231	\N	3650	\N
126393	GENERIC_DAY	0	1	2010-12-31	2223	\N	3650	\N
126394	GENERIC_DAY	0	2	2011-08-24	2231	\N	3650	\N
126395	GENERIC_DAY	0	0	2011-09-18	2231	\N	3650	\N
126396	GENERIC_DAY	0	0	2011-05-14	2233	\N	3650	\N
126397	GENERIC_DAY	0	2	2010-11-30	2233	\N	3650	\N
126398	GENERIC_DAY	0	1	2011-06-13	2223	\N	3650	\N
126399	GENERIC_DAY	0	0	2011-04-10	2229	\N	3650	\N
126400	GENERIC_DAY	0	2	2010-10-19	2233	\N	3650	\N
126401	GENERIC_DAY	0	0	2011-04-09	2231	\N	3650	\N
126402	GENERIC_DAY	0	0	2011-03-20	2231	\N	3650	\N
126403	GENERIC_DAY	0	2	2011-11-22	2225	\N	3650	\N
126404	GENERIC_DAY	0	1	2012-02-03	2223	\N	3650	\N
126405	GENERIC_DAY	0	1	2010-11-17	2223	\N	3650	\N
126406	GENERIC_DAY	0	0	2011-04-20	2225	\N	3650	\N
126407	GENERIC_DAY	0	0	2010-08-26	2225	\N	3650	\N
126408	GENERIC_DAY	0	0	2011-05-21	2231	\N	3650	\N
126409	GENERIC_DAY	0	0	2011-02-26	2233	\N	3650	\N
126410	GENERIC_DAY	0	2	2010-10-28	2233	\N	3650	\N
126411	GENERIC_DAY	0	2	2010-09-20	2233	\N	3650	\N
126412	GENERIC_DAY	0	2	2011-05-09	2229	\N	3650	\N
126413	GENERIC_DAY	0	0	2011-04-30	2223	\N	3650	\N
126414	GENERIC_DAY	0	0	2011-04-02	2225	\N	3650	\N
126415	GENERIC_DAY	0	2	2011-08-03	2233	\N	3650	\N
126416	GENERIC_DAY	0	0	2011-11-26	2233	\N	3650	\N
126417	GENERIC_DAY	0	2	2010-08-26	2229	\N	3650	\N
126418	GENERIC_DAY	0	0	2010-11-06	2233	\N	3650	\N
126419	GENERIC_DAY	0	0	2011-03-27	2231	\N	3650	\N
126420	GENERIC_DAY	0	0	2011-11-12	2223	\N	3650	\N
126421	GENERIC_DAY	0	3	2011-05-26	2231	\N	3650	\N
126422	GENERIC_DAY	0	2	2010-11-08	2233	\N	3650	\N
126423	GENERIC_DAY	0	2	2011-12-26	2229	\N	3650	\N
126424	GENERIC_DAY	0	2	2011-06-02	2229	\N	3650	\N
126425	GENERIC_DAY	0	2	2011-10-28	2231	\N	3650	\N
126426	GENERIC_DAY	0	0	2012-01-07	2233	\N	3650	\N
126427	GENERIC_DAY	0	3	2011-02-22	2231	\N	3650	\N
126428	GENERIC_DAY	0	0	2011-02-06	2229	\N	3650	\N
126429	GENERIC_DAY	0	0	2011-11-19	2225	\N	3650	\N
126430	GENERIC_DAY	0	0	2010-10-03	2225	\N	3650	\N
126431	GENERIC_DAY	0	1	2010-12-27	2223	\N	3650	\N
126432	GENERIC_DAY	0	0	2011-07-20	2225	\N	3650	\N
126433	GENERIC_DAY	0	1	2011-04-22	2229	\N	3650	\N
126434	GENERIC_DAY	0	0	2012-01-15	2225	\N	3650	\N
126435	GENERIC_DAY	0	0	2010-08-14	2225	\N	3650	\N
126436	GENERIC_DAY	0	1	2011-04-06	2223	\N	3650	\N
126437	GENERIC_DAY	0	3	2010-09-06	2231	\N	3650	\N
126438	GENERIC_DAY	0	2	2010-08-30	2229	\N	3650	\N
126439	GENERIC_DAY	0	1	2011-11-17	2233	\N	3650	\N
126440	GENERIC_DAY	0	2	2011-11-15	2225	\N	3650	\N
126441	GENERIC_DAY	0	2	2011-03-08	2229	\N	3650	\N
126442	GENERIC_DAY	0	2	2011-11-23	2231	\N	3650	\N
126443	GENERIC_DAY	0	1	2011-08-31	2223	\N	3650	\N
126444	GENERIC_DAY	0	0	2010-11-20	2225	\N	3650	\N
126445	GENERIC_DAY	0	1	2011-02-04	2229	\N	3650	\N
126446	GENERIC_DAY	0	0	2011-10-30	2231	\N	3650	\N
126447	GENERIC_DAY	0	0	2011-04-09	2229	\N	3650	\N
126448	GENERIC_DAY	0	0	2011-03-27	2225	\N	3650	\N
126449	GENERIC_DAY	0	0	2010-11-01	2231	\N	3650	\N
126450	GENERIC_DAY	0	2	2011-12-21	2225	\N	3650	\N
126451	GENERIC_DAY	0	0	2011-09-25	2225	\N	3650	\N
126452	GENERIC_DAY	0	0	2011-01-30	2225	\N	3650	\N
126453	GENERIC_DAY	0	1	2012-01-11	2233	\N	3650	\N
126454	GENERIC_DAY	0	0	2010-11-06	2223	\N	3650	\N
126455	GENERIC_DAY	0	1	2011-01-13	2223	\N	3650	\N
126456	GENERIC_DAY	0	2	2010-12-24	2231	\N	3650	\N
126457	GENERIC_DAY	0	0	2011-02-27	2223	\N	3650	\N
126458	GENERIC_DAY	0	2	2011-12-08	2231	\N	3650	\N
126459	GENERIC_DAY	0	1	2011-06-28	2223	\N	3650	\N
126460	GENERIC_DAY	0	1	2011-06-10	2229	\N	3650	\N
126461	GENERIC_DAY	0	2	2011-07-29	2231	\N	3650	\N
126462	GENERIC_DAY	0	3	2011-02-10	2231	\N	3650	\N
126463	GENERIC_DAY	0	2	2010-11-25	2229	\N	3650	\N
126464	GENERIC_DAY	0	2	2010-09-06	2233	\N	3650	\N
126465	GENERIC_DAY	0	1	2012-02-02	2233	\N	3650	\N
126466	GENERIC_DAY	0	1	2011-12-30	2223	\N	3650	\N
126467	GENERIC_DAY	0	2	2011-01-25	2233	\N	3650	\N
126468	GENERIC_DAY	0	2	2011-01-13	2229	\N	3650	\N
126469	GENERIC_DAY	0	1	2011-06-03	2229	\N	3650	\N
126470	GENERIC_DAY	0	0	2011-07-30	2225	\N	3650	\N
126471	GENERIC_DAY	0	0	2011-01-02	2233	\N	3650	\N
126472	GENERIC_DAY	0	2	2011-09-27	2225	\N	3650	\N
126473	GENERIC_DAY	0	3	2011-01-31	2231	\N	3650	\N
126474	GENERIC_DAY	0	2	2011-07-25	2233	\N	3650	\N
126475	GENERIC_DAY	0	0	2011-07-30	2231	\N	3650	\N
126476	GENERIC_DAY	0	1	2011-08-26	2229	\N	3650	\N
126477	GENERIC_DAY	0	1	2012-01-27	2225	\N	3650	\N
126478	GENERIC_DAY	0	0	2011-07-17	2231	\N	3650	\N
126479	GENERIC_DAY	0	1	2010-12-28	2223	\N	3650	\N
126480	GENERIC_DAY	0	2	2011-08-03	2223	\N	3650	\N
126481	GENERIC_DAY	0	0	2011-01-24	2225	\N	3650	\N
126482	GENERIC_DAY	0	0	2010-11-20	2223	\N	3650	\N
126483	GENERIC_DAY	0	2	2011-12-13	2231	\N	3650	\N
126484	GENERIC_DAY	0	0	2010-08-12	2225	\N	3650	\N
126485	GENERIC_DAY	0	2	2011-07-21	2223	\N	3650	\N
126486	GENERIC_DAY	0	2	2011-09-01	2225	\N	3650	\N
126487	GENERIC_DAY	0	0	2010-09-24	2225	\N	3650	\N
126488	GENERIC_DAY	0	2	2011-07-28	2231	\N	3650	\N
126489	GENERIC_DAY	0	0	2011-02-09	2225	\N	3650	\N
126490	GENERIC_DAY	0	1	2011-04-22	2223	\N	3650	\N
126491	GENERIC_DAY	0	1	2011-03-18	2229	\N	3650	\N
126492	GENERIC_DAY	0	1	2010-08-25	2223	\N	3650	\N
126493	GENERIC_DAY	0	0	2011-08-28	2231	\N	3650	\N
126494	GENERIC_DAY	0	2	2011-06-22	2229	\N	3650	\N
126495	GENERIC_DAY	0	0	2011-10-15	2229	\N	3650	\N
126496	GENERIC_DAY	0	0	2011-01-14	2225	\N	3650	\N
126497	GENERIC_DAY	0	0	2010-08-29	2229	\N	3650	\N
126498	GENERIC_DAY	0	0	2011-10-29	2229	\N	3650	\N
126499	GENERIC_DAY	0	0	2011-07-10	2229	\N	3650	\N
126500	GENERIC_DAY	0	1	2011-06-01	2223	\N	3650	\N
126501	GENERIC_DAY	0	2	2011-09-26	2231	\N	3650	\N
126502	GENERIC_DAY	0	0	2010-11-28	2231	\N	3650	\N
126503	GENERIC_DAY	0	0	2010-10-10	2233	\N	3650	\N
126504	GENERIC_DAY	0	0	2010-10-10	2223	\N	3650	\N
126505	GENERIC_DAY	0	3	2011-03-10	2231	\N	3650	\N
126506	GENERIC_DAY	0	2	2011-08-17	2233	\N	3650	\N
126507	GENERIC_DAY	0	2	2011-04-11	2233	\N	3650	\N
126508	GENERIC_DAY	0	1	2011-03-25	2223	\N	3650	\N
126509	GENERIC_DAY	0	2	2011-03-11	2231	\N	3650	\N
126510	GENERIC_DAY	0	0	2011-03-07	2225	\N	3650	\N
126511	GENERIC_DAY	0	2	2011-07-25	2223	\N	3650	\N
126512	GENERIC_DAY	0	1	2010-10-22	2223	\N	3650	\N
126513	GENERIC_DAY	0	2	2010-09-23	2233	\N	3650	\N
126514	GENERIC_DAY	0	0	2011-04-05	2225	\N	3650	\N
126515	GENERIC_DAY	0	2	2011-08-11	2229	\N	3650	\N
126516	GENERIC_DAY	0	1	2011-10-18	2233	\N	3650	\N
126517	GENERIC_DAY	0	2	2011-10-25	2231	\N	3650	\N
126518	GENERIC_DAY	0	1	2011-05-10	2223	\N	3650	\N
126519	GENERIC_DAY	0	2	2011-08-18	2231	\N	3650	\N
126520	GENERIC_DAY	0	0	2011-06-12	2231	\N	3650	\N
126521	GENERIC_DAY	0	0	2011-01-12	2225	\N	3650	\N
126522	GENERIC_DAY	0	1	2011-11-18	2229	\N	3650	\N
126523	GENERIC_DAY	0	2	2011-04-15	2231	\N	3650	\N
126524	GENERIC_DAY	0	1	2011-01-06	2223	\N	3650	\N
126525	GENERIC_DAY	0	0	2011-07-09	2223	\N	3650	\N
126526	GENERIC_DAY	0	0	2010-12-02	2225	\N	3650	\N
126527	GENERIC_DAY	0	1	2011-01-19	2223	\N	3650	\N
126528	GENERIC_DAY	0	0	2011-01-29	2233	\N	3650	\N
126529	GENERIC_DAY	0	1	2011-12-07	2233	\N	3650	\N
126530	GENERIC_DAY	0	0	2011-04-03	2233	\N	3650	\N
126531	GENERIC_DAY	0	1	2011-12-12	2223	\N	3650	\N
126532	GENERIC_DAY	0	0	2011-02-06	2231	\N	3650	\N
126533	GENERIC_DAY	0	0	2010-12-18	2229	\N	3650	\N
126534	GENERIC_DAY	0	3	2011-07-06	2231	\N	3650	\N
126535	GENERIC_DAY	0	0	2011-07-22	2225	\N	3650	\N
126536	GENERIC_DAY	0	0	2011-04-13	2225	\N	3650	\N
126537	GENERIC_DAY	0	3	2010-09-20	2231	\N	3650	\N
126538	GENERIC_DAY	0	1	2011-09-22	2233	\N	3650	\N
126539	GENERIC_DAY	0	1	2011-12-16	2233	\N	3650	\N
126540	GENERIC_DAY	0	0	2011-08-08	2225	\N	3650	\N
126541	GENERIC_DAY	0	0	2011-03-17	2225	\N	3650	\N
126542	GENERIC_DAY	0	0	2011-10-16	2231	\N	3650	\N
126543	GENERIC_DAY	0	0	2011-03-18	2225	\N	3650	\N
126544	GENERIC_DAY	0	1	2010-09-29	2223	\N	3650	\N
126545	GENERIC_DAY	0	1	2011-01-03	2223	\N	3650	\N
126546	GENERIC_DAY	0	0	2011-12-10	2223	\N	3650	\N
126547	GENERIC_DAY	0	2	2011-04-29	2233	\N	3650	\N
126548	GENERIC_DAY	0	3	2011-06-08	2231	\N	3650	\N
126549	GENERIC_DAY	0	2	2010-12-15	2233	\N	3650	\N
126550	GENERIC_DAY	0	1	2011-11-09	2233	\N	3650	\N
126551	GENERIC_DAY	0	2	2012-02-20	2229	\N	3650	\N
126552	GENERIC_DAY	0	1	2011-04-27	2223	\N	3650	\N
126553	GENERIC_DAY	0	2	2010-10-13	2233	\N	3650	\N
126554	GENERIC_DAY	0	1	2010-11-02	2223	\N	3650	\N
126555	GENERIC_DAY	0	2	2012-01-23	2231	\N	3650	\N
126556	GENERIC_DAY	0	2	2011-12-08	2225	\N	3650	\N
126557	GENERIC_DAY	0	0	2011-01-11	2225	\N	3650	\N
126558	GENERIC_DAY	0	0	2011-10-09	2231	\N	3650	\N
126559	GENERIC_DAY	0	2	2010-12-24	2233	\N	3650	\N
126560	GENERIC_DAY	0	2	2011-02-04	2231	\N	3650	\N
126561	GENERIC_DAY	0	0	2011-09-10	2223	\N	3650	\N
126562	GENERIC_DAY	0	0	2011-08-16	2225	\N	3650	\N
126563	GENERIC_DAY	0	2	2011-08-17	2223	\N	3650	\N
126564	GENERIC_DAY	0	3	2011-01-17	2231	\N	3650	\N
126565	GENERIC_DAY	0	0	2011-01-08	2231	\N	3650	\N
126566	GENERIC_DAY	0	1	2012-01-20	2229	\N	3650	\N
126567	GENERIC_DAY	0	1	2011-09-26	2233	\N	3650	\N
126568	GENERIC_DAY	0	1	2010-10-15	2223	\N	3650	\N
126569	GENERIC_DAY	0	1	2011-11-18	2223	\N	3650	\N
126570	GENERIC_DAY	0	0	2010-12-04	2229	\N	3650	\N
126571	GENERIC_DAY	0	2	2010-12-20	2229	\N	3650	\N
126572	GENERIC_DAY	0	0	2011-11-05	2231	\N	3650	\N
126573	GENERIC_DAY	0	0	2011-12-03	2225	\N	3650	\N
126574	GENERIC_DAY	0	1	2012-01-10	2223	\N	3650	\N
126575	GENERIC_DAY	0	0	2011-08-14	2223	\N	3650	\N
126576	GENERIC_DAY	0	1	2011-08-23	2223	\N	3650	\N
126577	GENERIC_DAY	0	2	2010-09-02	2233	\N	3650	\N
126578	GENERIC_DAY	0	0	2010-08-24	2225	\N	3650	\N
126579	GENERIC_DAY	0	1	2011-11-22	2233	\N	3650	\N
126580	GENERIC_DAY	0	2	2011-04-25	2233	\N	3650	\N
126581	GENERIC_DAY	0	1	2011-11-11	2233	\N	3650	\N
126582	GENERIC_DAY	0	2	2011-04-12	2229	\N	3650	\N
126583	GENERIC_DAY	0	1	2010-10-08	2229	\N	3650	\N
126584	GENERIC_DAY	0	2	2012-01-02	2229	\N	3650	\N
126585	GENERIC_DAY	0	0	2011-01-28	2225	\N	3650	\N
126586	GENERIC_DAY	0	2	2011-12-15	2229	\N	3650	\N
126587	GENERIC_DAY	0	0	2011-04-18	2225	\N	3650	\N
126588	GENERIC_DAY	0	2	2011-09-14	2229	\N	3650	\N
126589	GENERIC_DAY	0	0	2012-02-18	2229	\N	3650	\N
126590	GENERIC_DAY	0	0	2010-09-05	2225	\N	3650	\N
126591	GENERIC_DAY	0	0	2011-08-12	2225	\N	3650	\N
126592	GENERIC_DAY	0	1	2011-10-14	2223	\N	3650	\N
126593	GENERIC_DAY	0	2	2011-02-09	2233	\N	3650	\N
126594	GENERIC_DAY	0	2	2011-10-13	2231	\N	3650	\N
126595	GENERIC_DAY	0	0	2011-01-16	2225	\N	3650	\N
126596	GENERIC_DAY	0	0	2011-04-16	2223	\N	3650	\N
126597	GENERIC_DAY	0	1	2011-11-30	2223	\N	3650	\N
126598	GENERIC_DAY	0	0	2011-08-14	2229	\N	3650	\N
126599	GENERIC_DAY	0	0	2011-08-06	2233	\N	3650	\N
126600	GENERIC_DAY	0	0	2010-08-15	2229	\N	3650	\N
126601	GENERIC_DAY	0	1	2011-07-01	2223	\N	3650	\N
126602	GENERIC_DAY	0	2	2010-11-23	2229	\N	3650	\N
126603	GENERIC_DAY	0	0	2011-12-25	2233	\N	3650	\N
126604	GENERIC_DAY	0	2	2010-12-14	2229	\N	3650	\N
126605	GENERIC_DAY	0	0	2011-10-30	2229	\N	3650	\N
126606	GENERIC_DAY	0	0	2011-03-12	2233	\N	3650	\N
126607	GENERIC_DAY	0	1	2011-12-02	2225	\N	3650	\N
126608	GENERIC_DAY	0	2	2011-09-26	2229	\N	3650	\N
126609	GENERIC_DAY	0	3	2011-03-24	2231	\N	3650	\N
126610	GENERIC_DAY	0	1	2010-11-30	2223	\N	3650	\N
126611	GENERIC_DAY	0	0	2011-01-08	2229	\N	3650	\N
126612	GENERIC_DAY	0	2	2010-08-12	2233	\N	3650	\N
126613	GENERIC_DAY	0	1	2011-11-11	2225	\N	3650	\N
126614	GENERIC_DAY	0	0	2010-09-19	2223	\N	3650	\N
126615	GENERIC_DAY	0	2	2010-11-16	2229	\N	3650	\N
126616	GENERIC_DAY	0	2	2012-02-01	2231	\N	3650	\N
126617	GENERIC_DAY	0	0	2010-10-09	2233	\N	3650	\N
126618	GENERIC_DAY	0	0	2010-10-18	2225	\N	3650	\N
126619	GENERIC_DAY	0	0	2011-03-20	2223	\N	3650	\N
126620	GENERIC_DAY	0	1	2012-01-06	2225	\N	3650	\N
126621	GENERIC_DAY	0	0	2011-07-06	2225	\N	3650	\N
126622	GENERIC_DAY	0	1	2010-10-25	2223	\N	3650	\N
126623	GENERIC_DAY	0	0	2011-06-18	2229	\N	3650	\N
126624	GENERIC_DAY	0	2	2011-05-13	2231	\N	3650	\N
126625	GENERIC_DAY	0	2	2011-08-09	2231	\N	3650	\N
126626	GENERIC_DAY	0	2	2011-11-09	2231	\N	3650	\N
126627	GENERIC_DAY	0	2	2010-09-09	2233	\N	3650	\N
126628	GENERIC_DAY	0	1	2011-06-14	2223	\N	3650	\N
126629	GENERIC_DAY	0	0	2011-09-03	2223	\N	3650	\N
126630	GENERIC_DAY	0	1	2011-08-31	2233	\N	3650	\N
126631	GENERIC_DAY	0	0	2010-12-19	2225	\N	3650	\N
126632	GENERIC_DAY	0	3	2011-07-07	2231	\N	3650	\N
126633	GENERIC_DAY	0	1	2011-10-20	2233	\N	3650	\N
126634	GENERIC_DAY	0	0	2010-11-20	2233	\N	3650	\N
126635	GENERIC_DAY	0	1	2012-02-01	2223	\N	3650	\N
126636	GENERIC_DAY	0	3	2010-12-07	2231	\N	3650	\N
126637	GENERIC_DAY	0	1	2011-09-20	2223	\N	3650	\N
126638	GENERIC_DAY	0	3	2010-08-30	2231	\N	3650	\N
126639	GENERIC_DAY	0	0	2011-05-07	2223	\N	3650	\N
126640	GENERIC_DAY	0	0	2011-12-31	2223	\N	3650	\N
126641	GENERIC_DAY	0	1	2010-12-31	2229	\N	3650	\N
126642	GENERIC_DAY	0	0	2012-02-18	2231	\N	3650	\N
126643	GENERIC_DAY	0	0	2011-07-30	2223	\N	3650	\N
126644	GENERIC_DAY	0	2	2010-08-25	2233	\N	3650	\N
126645	GENERIC_DAY	0	2	2011-05-03	2229	\N	3650	\N
126646	GENERIC_DAY	0	2	2012-01-30	2225	\N	3650	\N
126647	GENERIC_DAY	0	0	2011-05-15	2233	\N	3650	\N
126648	GENERIC_DAY	0	2	2011-05-16	2229	\N	3650	\N
126649	GENERIC_DAY	0	1	2011-09-23	2233	\N	3650	\N
126650	GENERIC_DAY	0	1	2011-09-30	2223	\N	3650	\N
126651	GENERIC_DAY	0	2	2011-02-23	2229	\N	3650	\N
126652	GENERIC_DAY	0	0	2011-06-18	2233	\N	3650	\N
126653	GENERIC_DAY	0	1	2011-12-16	2225	\N	3650	\N
126654	GENERIC_DAY	0	1	2011-09-23	2229	\N	3650	\N
126655	GENERIC_DAY	0	0	2010-11-27	2233	\N	3650	\N
126656	GENERIC_DAY	0	1	2011-09-02	2225	\N	3650	\N
126657	GENERIC_DAY	0	2	2011-03-15	2233	\N	3650	\N
126658	GENERIC_DAY	0	0	2012-02-19	2225	\N	3650	\N
126659	GENERIC_DAY	0	2	2011-06-23	2233	\N	3650	\N
126660	GENERIC_DAY	0	2	2010-11-11	2233	\N	3650	\N
126661	GENERIC_DAY	0	0	2011-01-07	2225	\N	3650	\N
126662	GENERIC_DAY	0	2	2011-01-11	2229	\N	3650	\N
126663	GENERIC_DAY	0	0	2011-01-15	2229	\N	3650	\N
126664	GENERIC_DAY	0	2	2010-12-28	2229	\N	3650	\N
126665	GENERIC_DAY	0	2	2011-03-10	2229	\N	3650	\N
126666	GENERIC_DAY	0	0	2011-04-08	2225	\N	3650	\N
126667	GENERIC_DAY	0	0	2011-02-23	2225	\N	3650	\N
126668	GENERIC_DAY	0	0	2010-09-15	2225	\N	3650	\N
126669	GENERIC_DAY	0	1	2011-11-15	2233	\N	3650	\N
126670	GENERIC_DAY	0	3	2010-12-14	2231	\N	3650	\N
126671	GENERIC_DAY	0	0	2011-01-02	2225	\N	3650	\N
126672	GENERIC_DAY	0	2	2011-09-15	2225	\N	3650	\N
126673	GENERIC_DAY	0	0	2012-02-05	2223	\N	3650	\N
126674	GENERIC_DAY	0	2	2010-11-08	2229	\N	3650	\N
126675	GENERIC_DAY	0	0	2011-04-30	2231	\N	3650	\N
126676	GENERIC_DAY	0	3	2011-05-02	2231	\N	3650	\N
126677	GENERIC_DAY	0	2	2011-02-25	2231	\N	3650	\N
126678	GENERIC_DAY	0	3	2011-03-08	2231	\N	3650	\N
126679	GENERIC_DAY	0	0	2010-10-23	2229	\N	3650	\N
126680	GENERIC_DAY	0	2	2011-10-11	2225	\N	3650	\N
126681	GENERIC_DAY	0	0	2010-09-11	2223	\N	3650	\N
126682	GENERIC_DAY	0	0	2011-12-04	2231	\N	3650	\N
126683	GENERIC_DAY	0	0	2010-12-05	2231	\N	3650	\N
126684	GENERIC_DAY	0	0	2011-12-18	2233	\N	3650	\N
126685	GENERIC_DAY	0	0	2010-08-28	2225	\N	3650	\N
126686	GENERIC_DAY	0	0	2011-06-19	2229	\N	3650	\N
126687	GENERIC_DAY	0	2	2011-01-17	2229	\N	3650	\N
126688	GENERIC_DAY	0	2	2010-09-21	2229	\N	3650	\N
126689	GENERIC_DAY	0	2	2011-01-31	2229	\N	3650	\N
126690	GENERIC_DAY	0	0	2011-12-10	2229	\N	3650	\N
126691	GENERIC_DAY	0	3	2011-05-03	2231	\N	3650	\N
126692	GENERIC_DAY	0	0	2011-05-08	2233	\N	3650	\N
126693	GENERIC_DAY	0	2	2010-08-31	2229	\N	3650	\N
126694	GENERIC_DAY	0	0	2010-10-30	2225	\N	3650	\N
126695	GENERIC_DAY	0	1	2011-11-25	2225	\N	3650	\N
126696	GENERIC_DAY	0	0	2011-09-03	2231	\N	3650	\N
126697	GENERIC_DAY	0	1	2010-09-22	2223	\N	3650	\N
126698	GENERIC_DAY	0	0	2010-11-07	2233	\N	3650	\N
126699	GENERIC_DAY	0	1	2011-09-07	2233	\N	3650	\N
126700	GENERIC_DAY	0	1	2010-10-22	2229	\N	3650	\N
126701	GENERIC_DAY	0	3	2010-12-27	2231	\N	3650	\N
126702	GENERIC_DAY	0	2	2011-07-14	2233	\N	3650	\N
126703	GENERIC_DAY	0	2	2010-09-27	2229	\N	3650	\N
126704	GENERIC_DAY	0	0	2011-05-01	2223	\N	3650	\N
126705	GENERIC_DAY	0	0	2011-04-10	2223	\N	3650	\N
126706	GENERIC_DAY	0	2	2011-10-27	2231	\N	3650	\N
126707	GENERIC_DAY	0	2	2012-02-20	2225	\N	3650	\N
126708	GENERIC_DAY	0	0	2010-09-19	2233	\N	3650	\N
126709	GENERIC_DAY	0	0	2011-06-04	2233	\N	3650	\N
126710	GENERIC_DAY	0	1	2011-10-06	2223	\N	3650	\N
126711	GENERIC_DAY	0	0	2011-05-26	2225	\N	3650	\N
126712	GENERIC_DAY	0	3	2010-09-14	2231	\N	3650	\N
126713	GENERIC_DAY	0	0	2011-05-20	2225	\N	3650	\N
126714	GENERIC_DAY	0	2	2012-02-01	2229	\N	3650	\N
126715	GENERIC_DAY	0	2	2011-09-28	2229	\N	3650	\N
126716	GENERIC_DAY	0	0	2011-09-17	2233	\N	3650	\N
126717	GENERIC_DAY	0	0	2011-08-28	2229	\N	3650	\N
126718	GENERIC_DAY	0	1	2011-02-01	2223	\N	3650	\N
126719	GENERIC_DAY	0	0	2011-02-19	2233	\N	3650	\N
126720	GENERIC_DAY	0	0	2011-06-17	2225	\N	3650	\N
126721	GENERIC_DAY	0	2	2011-09-08	2229	\N	3650	\N
126722	GENERIC_DAY	0	0	2011-11-06	2229	\N	3650	\N
126723	GENERIC_DAY	0	2	2011-12-28	2225	\N	3650	\N
126724	GENERIC_DAY	0	0	2011-06-11	2223	\N	3650	\N
126725	GENERIC_DAY	0	2	2011-01-17	2233	\N	3650	\N
126726	GENERIC_DAY	0	2	2011-07-27	2223	\N	3650	\N
126727	GENERIC_DAY	0	0	2010-11-01	2223	\N	3650	\N
126728	GENERIC_DAY	0	2	2010-11-26	2233	\N	3650	\N
126729	GENERIC_DAY	0	0	2011-01-30	2231	\N	3650	\N
126730	GENERIC_DAY	0	1	2011-12-06	2223	\N	3650	\N
126731	GENERIC_DAY	0	0	2011-04-28	2225	\N	3650	\N
126732	GENERIC_DAY	0	1	2011-02-25	2223	\N	3650	\N
126733	GENERIC_DAY	0	0	2011-01-23	2223	\N	3650	\N
126734	GENERIC_DAY	0	0	2011-12-03	2231	\N	3650	\N
126735	GENERIC_DAY	0	2	2011-07-21	2229	\N	3650	\N
126736	GENERIC_DAY	0	2	2011-08-30	2229	\N	3650	\N
126737	GENERIC_DAY	0	2	2011-01-03	2233	\N	3650	\N
126738	GENERIC_DAY	0	2	2011-10-19	2229	\N	3650	\N
126739	GENERIC_DAY	0	1	2011-12-20	2223	\N	3650	\N
126740	GENERIC_DAY	0	1	2011-09-21	2223	\N	3650	\N
126741	GENERIC_DAY	0	3	2010-09-29	2231	\N	3650	\N
126742	GENERIC_DAY	0	1	2011-06-20	2223	\N	3650	\N
126743	GENERIC_DAY	0	0	2011-11-26	2231	\N	3650	\N
126744	GENERIC_DAY	0	1	2011-10-12	2233	\N	3650	\N
126745	GENERIC_DAY	0	0	2010-09-10	2225	\N	3650	\N
126746	GENERIC_DAY	0	1	2012-02-20	2233	\N	3650	\N
126747	GENERIC_DAY	0	0	2011-07-17	2233	\N	3650	\N
126748	GENERIC_DAY	0	0	2010-08-27	2225	\N	3650	\N
126749	GENERIC_DAY	0	0	2011-06-02	2225	\N	3650	\N
126750	GENERIC_DAY	0	0	2010-09-11	2231	\N	3650	\N
126751	GENERIC_DAY	0	0	2010-11-25	2225	\N	3650	\N
126752	GENERIC_DAY	0	0	2011-09-11	2225	\N	3650	\N
126753	GENERIC_DAY	0	2	2010-09-14	2229	\N	3650	\N
126754	GENERIC_DAY	0	0	2011-02-13	2231	\N	3650	\N
126755	GENERIC_DAY	0	2	2012-02-09	2225	\N	3650	\N
126756	GENERIC_DAY	0	2	2011-08-11	2223	\N	3650	\N
126757	GENERIC_DAY	0	2	2012-01-19	2225	\N	3650	\N
126758	GENERIC_DAY	0	0	2010-08-22	2233	\N	3650	\N
126759	GENERIC_DAY	0	2	2011-05-02	2233	\N	3650	\N
126760	GENERIC_DAY	0	1	2011-11-23	2233	\N	3650	\N
126761	GENERIC_DAY	0	1	2011-08-26	2233	\N	3650	\N
126762	GENERIC_DAY	0	2	2011-02-08	2233	\N	3650	\N
126763	GENERIC_DAY	0	1	2011-12-08	2233	\N	3650	\N
126764	GENERIC_DAY	0	2	2010-08-19	2229	\N	3650	\N
126765	GENERIC_DAY	0	0	2011-05-29	2223	\N	3650	\N
126766	GENERIC_DAY	0	3	2010-09-21	2231	\N	3650	\N
126767	GENERIC_DAY	0	2	2011-09-02	2231	\N	3650	\N
126768	GENERIC_DAY	0	2	2011-11-14	2231	\N	3650	\N
126769	GENERIC_DAY	0	0	2010-12-28	2225	\N	3650	\N
126770	GENERIC_DAY	0	3	2011-05-24	2231	\N	3650	\N
126771	GENERIC_DAY	0	1	2012-01-05	2233	\N	3650	\N
126772	GENERIC_DAY	0	2	2011-01-06	2233	\N	3650	\N
126773	GENERIC_DAY	0	0	2011-12-17	2233	\N	3650	\N
126774	GENERIC_DAY	0	2	2011-07-27	2231	\N	3650	\N
126775	GENERIC_DAY	0	1	2011-04-13	2223	\N	3650	\N
126776	GENERIC_DAY	0	0	2010-11-21	2229	\N	3650	\N
126777	GENERIC_DAY	0	0	2010-12-04	2231	\N	3650	\N
126778	GENERIC_DAY	0	0	2011-03-04	2225	\N	3650	\N
126779	GENERIC_DAY	0	0	2010-12-21	2225	\N	3650	\N
126780	GENERIC_DAY	0	0	2011-07-30	2233	\N	3650	\N
126781	GENERIC_DAY	0	1	2011-12-26	2223	\N	3650	\N
126782	GENERIC_DAY	0	0	2010-10-24	2225	\N	3650	\N
126783	GENERIC_DAY	0	0	2011-04-29	2225	\N	3650	\N
126784	GENERIC_DAY	0	1	2011-02-23	2223	\N	3650	\N
126785	GENERIC_DAY	0	0	2011-03-27	2223	\N	3650	\N
126786	GENERIC_DAY	0	2	2011-06-15	2229	\N	3650	\N
126787	GENERIC_DAY	0	0	2011-11-13	2225	\N	3650	\N
126788	GENERIC_DAY	0	0	2011-10-02	2231	\N	3650	\N
126789	GENERIC_DAY	0	3	2010-12-16	2231	\N	3650	\N
126790	GENERIC_DAY	0	2	2010-11-12	2231	\N	3650	\N
126791	GENERIC_DAY	0	2	2012-01-16	2229	\N	3650	\N
126792	GENERIC_DAY	0	3	2010-11-03	2231	\N	3650	\N
126793	GENERIC_DAY	0	0	2011-01-26	2225	\N	3650	\N
126794	GENERIC_DAY	0	1	2011-04-04	2223	\N	3650	\N
126795	GENERIC_DAY	0	1	2011-03-18	2223	\N	3650	\N
126796	GENERIC_DAY	0	2	2012-02-06	2231	\N	3650	\N
126797	GENERIC_DAY	0	0	2011-08-20	2231	\N	3650	\N
126798	GENERIC_DAY	0	2	2012-01-06	2231	\N	3650	\N
126799	GENERIC_DAY	0	2	2012-01-19	2229	\N	3650	\N
126800	GENERIC_DAY	0	2	2011-12-13	2229	\N	3650	\N
126801	GENERIC_DAY	0	0	2011-12-04	2229	\N	3650	\N
126802	GENERIC_DAY	0	2	2011-03-24	2233	\N	3650	\N
126803	GENERIC_DAY	0	0	2010-11-01	2229	\N	3650	\N
126804	GENERIC_DAY	0	1	2011-12-09	2233	\N	3650	\N
126805	GENERIC_DAY	0	2	2012-01-11	2231	\N	3650	\N
126806	GENERIC_DAY	0	2	2011-05-31	2229	\N	3650	\N
126807	GENERIC_DAY	0	0	2011-04-10	2225	\N	3650	\N
126808	GENERIC_DAY	0	2	2011-10-03	2229	\N	3650	\N
126809	GENERIC_DAY	0	2	2012-01-16	2225	\N	3650	\N
126810	GENERIC_DAY	0	1	2012-01-23	2233	\N	3650	\N
126811	GENERIC_DAY	0	0	2011-09-25	2223	\N	3650	\N
126812	GENERIC_DAY	0	0	2011-01-02	2231	\N	3650	\N
126813	GENERIC_DAY	0	0	2011-10-29	2223	\N	3650	\N
126814	GENERIC_DAY	0	2	2011-11-10	2225	\N	3650	\N
126815	GENERIC_DAY	0	2	2012-01-04	2225	\N	3650	\N
126816	GENERIC_DAY	0	1	2011-06-22	2223	\N	3650	\N
126817	GENERIC_DAY	0	3	2011-01-20	2231	\N	3650	\N
126818	GENERIC_DAY	0	0	2011-11-12	2225	\N	3650	\N
126819	GENERIC_DAY	0	2	2011-01-12	2233	\N	3650	\N
126820	GENERIC_DAY	0	0	2011-11-26	2223	\N	3650	\N
126821	GENERIC_DAY	0	3	2011-02-23	2231	\N	3650	\N
126822	GENERIC_DAY	0	0	2011-06-25	2225	\N	3650	\N
126823	GENERIC_DAY	0	2	2011-10-05	2225	\N	3650	\N
126824	GENERIC_DAY	0	0	2010-10-31	2233	\N	3650	\N
126825	GENERIC_DAY	0	2	2010-12-21	2229	\N	3650	\N
126826	GENERIC_DAY	0	1	2011-06-03	2223	\N	3650	\N
126827	GENERIC_DAY	0	0	2011-01-29	2229	\N	3650	\N
126828	GENERIC_DAY	0	0	2011-01-30	2233	\N	3650	\N
126829	GENERIC_DAY	0	0	2011-01-01	2223	\N	3650	\N
126830	GENERIC_DAY	0	1	2012-02-06	2223	\N	3650	\N
126831	GENERIC_DAY	0	0	2011-05-21	2233	\N	3650	\N
126832	GENERIC_DAY	0	3	2010-10-20	2231	\N	3650	\N
126833	GENERIC_DAY	0	1	2011-09-27	2223	\N	3650	\N
126834	GENERIC_DAY	0	0	2012-01-29	2233	\N	3650	\N
126835	GENERIC_DAY	0	2	2011-10-21	2231	\N	3650	\N
126836	GENERIC_DAY	0	1	2011-12-09	2229	\N	3650	\N
126837	GENERIC_DAY	0	2	2011-11-14	2225	\N	3650	\N
126838	GENERIC_DAY	0	0	2011-01-15	2233	\N	3650	\N
126839	GENERIC_DAY	0	0	2011-04-09	2225	\N	3650	\N
126840	GENERIC_DAY	0	0	2011-03-24	2225	\N	3650	\N
126841	GENERIC_DAY	0	2	2011-02-24	2229	\N	3650	\N
126842	GENERIC_DAY	0	0	2011-07-02	2225	\N	3650	\N
126843	GENERIC_DAY	0	0	2011-07-31	2233	\N	3650	\N
126844	GENERIC_DAY	0	0	2011-03-30	2225	\N	3650	\N
126845	GENERIC_DAY	0	2	2010-12-16	2229	\N	3650	\N
126846	GENERIC_DAY	0	2	2011-10-25	2229	\N	3650	\N
126847	GENERIC_DAY	0	0	2011-12-03	2233	\N	3650	\N
126848	GENERIC_DAY	0	2	2011-06-21	2229	\N	3650	\N
126849	GENERIC_DAY	0	2	2011-07-01	2233	\N	3650	\N
126850	GENERIC_DAY	0	1	2011-12-13	2233	\N	3650	\N
126851	GENERIC_DAY	0	2	2011-01-05	2229	\N	3650	\N
126852	GENERIC_DAY	0	2	2010-08-30	2233	\N	3650	\N
126853	GENERIC_DAY	0	0	2011-06-26	2233	\N	3650	\N
126854	GENERIC_DAY	0	2	2011-09-14	2225	\N	3650	\N
126855	GENERIC_DAY	0	3	2010-08-25	2231	\N	3650	\N
126856	GENERIC_DAY	0	0	2011-08-07	2233	\N	3650	\N
126857	GENERIC_DAY	0	2	2011-09-05	2229	\N	3650	\N
126858	GENERIC_DAY	0	1	2011-01-05	2223	\N	3650	\N
126859	GENERIC_DAY	0	1	2011-11-30	2233	\N	3650	\N
126860	GENERIC_DAY	0	2	2011-02-23	2233	\N	3650	\N
126861	GENERIC_DAY	0	1	2011-05-06	2223	\N	3650	\N
126862	GENERIC_DAY	0	1	2012-01-24	2223	\N	3650	\N
126863	GENERIC_DAY	0	2	2011-08-25	2225	\N	3650	\N
126864	GENERIC_DAY	0	3	2011-07-05	2231	\N	3650	\N
126865	GENERIC_DAY	0	0	2011-11-19	2229	\N	3650	\N
126866	GENERIC_DAY	0	1	2010-12-21	2223	\N	3650	\N
126867	GENERIC_DAY	0	0	2011-01-20	2225	\N	3650	\N
126868	GENERIC_DAY	0	0	2011-03-05	2225	\N	3650	\N
126869	GENERIC_DAY	0	2	2011-08-29	2225	\N	3650	\N
126870	GENERIC_DAY	0	3	2010-09-13	2231	\N	3650	\N
126871	GENERIC_DAY	0	0	2010-11-14	2233	\N	3650	\N
126872	GENERIC_DAY	0	0	2010-08-22	2225	\N	3650	\N
126873	GENERIC_DAY	0	2	2011-03-08	2233	\N	3650	\N
126874	GENERIC_DAY	0	0	2011-02-04	2225	\N	3650	\N
126875	GENERIC_DAY	0	0	2010-10-17	2233	\N	3650	\N
126876	GENERIC_DAY	0	1	2011-11-02	2223	\N	3650	\N
126877	GENERIC_DAY	0	2	2011-02-08	2229	\N	3650	\N
126878	GENERIC_DAY	0	0	2010-08-21	2231	\N	3650	\N
126879	GENERIC_DAY	0	0	2010-12-04	2223	\N	3650	\N
126880	GENERIC_DAY	0	2	2011-08-04	2229	\N	3650	\N
126881	GENERIC_DAY	0	0	2010-09-19	2229	\N	3650	\N
126882	GENERIC_DAY	0	2	2010-10-04	2233	\N	3650	\N
126883	GENERIC_DAY	0	1	2011-03-16	2223	\N	3650	\N
126884	GENERIC_DAY	0	1	2011-10-19	2233	\N	3650	\N
126885	GENERIC_DAY	0	3	2011-01-04	2231	\N	3650	\N
126886	GENERIC_DAY	0	2	2011-08-17	2231	\N	3650	\N
126887	GENERIC_DAY	0	0	2011-09-17	2223	\N	3650	\N
126888	GENERIC_DAY	0	0	2011-12-11	2229	\N	3650	\N
126889	GENERIC_DAY	0	2	2011-04-26	2233	\N	3650	\N
126890	GENERIC_DAY	0	2	2011-05-05	2229	\N	3650	\N
126891	GENERIC_DAY	0	2	2010-08-13	2231	\N	3650	\N
126892	GENERIC_DAY	0	1	2011-07-05	2223	\N	3650	\N
126893	GENERIC_DAY	0	3	2011-06-20	2231	\N	3650	\N
126894	GENERIC_DAY	0	0	2012-02-05	2231	\N	3650	\N
126895	GENERIC_DAY	0	0	2011-06-25	2229	\N	3650	\N
126896	GENERIC_DAY	0	0	2011-07-31	2225	\N	3650	\N
126897	GENERIC_DAY	0	1	2011-11-04	2233	\N	3650	\N
126898	GENERIC_DAY	0	0	2011-02-28	2225	\N	3650	\N
126899	GENERIC_DAY	0	2	2011-09-14	2231	\N	3650	\N
126900	GENERIC_DAY	0	2	2010-12-07	2229	\N	3650	\N
126901	GENERIC_DAY	0	1	2011-09-06	2223	\N	3650	\N
126902	GENERIC_DAY	0	1	2011-03-04	2223	\N	3650	\N
126903	GENERIC_DAY	0	0	2011-02-18	2225	\N	3650	\N
126904	GENERIC_DAY	0	1	2012-01-18	2233	\N	3650	\N
126905	GENERIC_DAY	0	0	2011-03-25	2225	\N	3650	\N
126906	GENERIC_DAY	0	0	2010-09-27	2225	\N	3650	\N
126907	GENERIC_DAY	0	1	2012-01-26	2233	\N	3650	\N
126908	GENERIC_DAY	0	2	2011-08-02	2223	\N	3650	\N
126909	GENERIC_DAY	0	0	2011-01-25	2225	\N	3650	\N
126910	GENERIC_DAY	0	0	2011-03-05	2233	\N	3650	\N
126911	GENERIC_DAY	0	0	2011-06-19	2223	\N	3650	\N
126912	GENERIC_DAY	0	3	2011-03-31	2231	\N	3650	\N
126913	GENERIC_DAY	0	2	2010-09-13	2233	\N	3650	\N
126914	GENERIC_DAY	0	2	2011-12-27	2231	\N	3650	\N
126915	GENERIC_DAY	0	0	2010-10-31	2229	\N	3650	\N
126916	GENERIC_DAY	0	2	2011-11-23	2229	\N	3650	\N
126917	GENERIC_DAY	0	1	2011-05-27	2223	\N	3650	\N
126918	GENERIC_DAY	0	0	2011-11-20	2231	\N	3650	\N
126919	GENERIC_DAY	0	0	2011-04-24	2229	\N	3650	\N
126920	GENERIC_DAY	0	2	2011-03-31	2233	\N	3650	\N
126921	GENERIC_DAY	0	0	2011-05-08	2229	\N	3650	\N
126922	GENERIC_DAY	0	1	2011-07-29	2223	\N	3650	\N
126923	GENERIC_DAY	0	1	2010-09-13	2223	\N	3650	\N
126924	GENERIC_DAY	0	1	2011-11-01	2233	\N	3650	\N
126925	GENERIC_DAY	0	2	2010-11-19	2231	\N	3650	\N
126926	GENERIC_DAY	0	0	2011-08-06	2223	\N	3650	\N
126927	GENERIC_DAY	0	2	2011-07-15	2231	\N	3650	\N
126928	GENERIC_DAY	0	0	2011-05-28	2225	\N	3650	\N
126929	GENERIC_DAY	0	2	2010-08-23	2229	\N	3650	\N
126930	GENERIC_DAY	0	3	2011-03-22	2231	\N	3650	\N
126931	GENERIC_DAY	0	1	2012-01-31	2223	\N	3650	\N
126932	GENERIC_DAY	0	0	2011-02-02	2225	\N	3650	\N
126933	GENERIC_DAY	0	0	2010-10-23	2225	\N	3650	\N
126934	GENERIC_DAY	0	2	2011-01-04	2233	\N	3650	\N
126935	GENERIC_DAY	0	2	2011-07-27	2229	\N	3650	\N
126936	GENERIC_DAY	0	0	2010-12-26	2231	\N	3650	\N
126937	GENERIC_DAY	0	2	2011-08-09	2229	\N	3650	\N
126938	GENERIC_DAY	0	0	2011-06-24	2225	\N	3650	\N
126939	GENERIC_DAY	0	3	2010-11-10	2231	\N	3650	\N
126940	GENERIC_DAY	0	0	2011-09-25	2231	\N	3650	\N
126941	GENERIC_DAY	0	2	2011-07-13	2223	\N	3650	\N
126942	GENERIC_DAY	0	1	2011-12-14	2233	\N	3650	\N
126943	GENERIC_DAY	0	0	2011-08-04	2225	\N	3650	\N
126944	GENERIC_DAY	0	0	2011-09-04	2233	\N	3650	\N
126945	GENERIC_DAY	0	0	2011-02-27	2229	\N	3650	\N
126946	GENERIC_DAY	0	1	2011-10-21	2225	\N	3650	\N
126947	GENERIC_DAY	0	0	2010-10-28	2225	\N	3650	\N
126948	GENERIC_DAY	0	0	2011-02-13	2223	\N	3650	\N
126949	GENERIC_DAY	0	2	2010-08-24	2229	\N	3650	\N
126950	GENERIC_DAY	0	2	2010-12-01	2233	\N	3650	\N
126951	GENERIC_DAY	0	0	2010-12-07	2225	\N	3650	\N
126952	GENERIC_DAY	0	3	2010-09-30	2231	\N	3650	\N
126953	GENERIC_DAY	0	2	2010-10-05	2229	\N	3650	\N
126954	GENERIC_DAY	0	1	2011-06-17	2223	\N	3650	\N
126955	GENERIC_DAY	0	0	2010-08-23	2225	\N	3650	\N
126956	GENERIC_DAY	0	1	2010-10-07	2223	\N	3650	\N
126957	GENERIC_DAY	0	2	2011-02-16	2233	\N	3650	\N
126958	GENERIC_DAY	0	2	2011-03-03	2229	\N	3650	\N
126959	GENERIC_DAY	0	0	2011-11-13	2229	\N	3650	\N
126960	GENERIC_DAY	0	2	2011-05-09	2233	\N	3650	\N
126961	GENERIC_DAY	0	2	2012-02-14	2231	\N	3650	\N
126962	GENERIC_DAY	0	2	2011-06-17	2231	\N	3650	\N
126963	GENERIC_DAY	0	2	2011-04-01	2233	\N	3650	\N
126964	GENERIC_DAY	0	1	2012-02-10	2225	\N	3650	\N
126965	GENERIC_DAY	0	1	2010-12-30	2223	\N	3650	\N
126966	GENERIC_DAY	0	2	2011-08-16	2231	\N	3650	\N
126967	GENERIC_DAY	0	3	2011-06-16	2231	\N	3650	\N
126968	GENERIC_DAY	0	1	2011-09-01	2233	\N	3650	\N
126969	GENERIC_DAY	0	2	2010-11-04	2233	\N	3650	\N
126970	GENERIC_DAY	0	0	2011-10-22	2225	\N	3650	\N
126971	GENERIC_DAY	0	0	2011-10-09	2233	\N	3650	\N
126972	GENERIC_DAY	0	2	2012-02-15	2229	\N	3650	\N
126973	GENERIC_DAY	0	1	2012-01-16	2223	\N	3650	\N
126974	GENERIC_DAY	0	1	2011-09-09	2223	\N	3650	\N
126975	GENERIC_DAY	0	2	2011-05-23	2229	\N	3650	\N
126976	GENERIC_DAY	0	3	2010-08-12	2231	\N	3650	\N
126977	GENERIC_DAY	0	2	2010-09-15	2229	\N	3650	\N
126978	GENERIC_DAY	0	0	2011-07-17	2229	\N	3650	\N
126979	GENERIC_DAY	0	0	2012-01-15	2223	\N	3650	\N
126980	GENERIC_DAY	0	1	2011-11-16	2233	\N	3650	\N
126981	GENERIC_DAY	0	0	2010-10-20	2225	\N	3650	\N
126982	GENERIC_DAY	0	0	2010-11-27	2229	\N	3650	\N
126983	GENERIC_DAY	0	1	2010-09-07	2223	\N	3650	\N
126984	GENERIC_DAY	0	2	2011-11-08	2225	\N	3650	\N
126985	GENERIC_DAY	0	3	2011-04-12	2231	\N	3650	\N
126986	GENERIC_DAY	0	2	2010-11-17	2233	\N	3650	\N
126987	GENERIC_DAY	0	0	2010-11-28	2225	\N	3650	\N
126988	GENERIC_DAY	0	0	2011-06-21	2225	\N	3650	\N
126989	GENERIC_DAY	0	0	2011-05-18	2225	\N	3650	\N
126990	GENERIC_DAY	0	3	2011-01-18	2231	\N	3650	\N
126991	GENERIC_DAY	0	2	2010-11-05	2231	\N	3650	\N
126992	GENERIC_DAY	0	0	2011-02-07	2225	\N	3650	\N
126993	GENERIC_DAY	0	0	2011-12-18	2229	\N	3650	\N
126994	GENERIC_DAY	0	1	2010-11-09	2223	\N	3650	\N
126995	GENERIC_DAY	0	1	2012-02-10	2223	\N	3650	\N
126996	GENERIC_DAY	0	2	2011-07-12	2229	\N	3650	\N
126997	GENERIC_DAY	0	2	2010-09-16	2233	\N	3650	\N
126998	GENERIC_DAY	0	0	2010-11-14	2223	\N	3650	\N
126999	GENERIC_DAY	0	2	2011-03-09	2229	\N	3650	\N
127000	GENERIC_DAY	0	0	2011-10-16	2229	\N	3650	\N
127001	GENERIC_DAY	0	1	2011-06-10	2223	\N	3650	\N
127002	GENERIC_DAY	0	0	2011-08-03	2225	\N	3650	\N
127003	GENERIC_DAY	0	0	2010-09-06	2225	\N	3650	\N
127004	GENERIC_DAY	0	0	2010-12-11	2233	\N	3650	\N
127005	GENERIC_DAY	0	2	2011-11-01	2229	\N	3650	\N
127006	GENERIC_DAY	0	1	2011-10-20	2223	\N	3650	\N
127007	GENERIC_DAY	0	2	2012-02-01	2225	\N	3650	\N
127008	GENERIC_DAY	0	2	2010-10-21	2233	\N	3650	\N
127009	GENERIC_DAY	0	1	2011-10-13	2233	\N	3650	\N
127010	GENERIC_DAY	0	2	2011-06-07	2229	\N	3650	\N
127011	GENERIC_DAY	0	0	2010-12-18	2231	\N	3650	\N
127012	GENERIC_DAY	0	2	2011-10-12	2231	\N	3650	\N
127013	GENERIC_DAY	0	2	2012-02-02	2229	\N	3650	\N
127014	GENERIC_DAY	0	1	2011-10-28	2229	\N	3650	\N
127015	GENERIC_DAY	0	0	2010-12-12	2229	\N	3650	\N
127016	GENERIC_DAY	0	2	2011-05-04	2229	\N	3650	\N
127017	GENERIC_DAY	0	1	2011-04-19	2223	\N	3650	\N
127018	GENERIC_DAY	0	1	2011-02-09	2223	\N	3650	\N
127019	GENERIC_DAY	0	0	2011-06-06	2225	\N	3650	\N
127020	GENERIC_DAY	0	1	2011-07-15	2223	\N	3650	\N
127021	GENERIC_DAY	0	3	2010-10-28	2231	\N	3650	\N
127022	GENERIC_DAY	0	0	2011-02-12	2231	\N	3650	\N
127023	GENERIC_DAY	0	1	2011-07-08	2223	\N	3650	\N
127024	GENERIC_DAY	0	1	2011-05-19	2223	\N	3650	\N
127025	GENERIC_DAY	0	0	2011-01-10	2225	\N	3650	\N
127026	GENERIC_DAY	0	0	2011-04-19	2225	\N	3650	\N
127027	GENERIC_DAY	0	0	2011-10-02	2223	\N	3650	\N
127028	GENERIC_DAY	0	2	2011-11-17	2229	\N	3650	\N
127029	GENERIC_DAY	0	2	2011-11-15	2229	\N	3650	\N
127030	GENERIC_DAY	0	0	2011-01-09	2229	\N	3650	\N
127031	GENERIC_DAY	0	1	2012-02-08	2233	\N	3650	\N
127032	GENERIC_DAY	0	0	2011-07-24	2233	\N	3650	\N
127033	GENERIC_DAY	0	0	2010-10-10	2231	\N	3650	\N
127034	GENERIC_DAY	0	0	2010-10-02	2229	\N	3650	\N
127035	GENERIC_DAY	0	2	2011-10-24	2229	\N	3650	\N
127036	GENERIC_DAY	0	0	2010-10-24	2223	\N	3650	\N
127037	GENERIC_DAY	0	3	2011-05-10	2231	\N	3650	\N
127038	GENERIC_DAY	0	0	2011-01-18	2225	\N	3650	\N
127039	GENERIC_DAY	0	0	2011-07-16	2231	\N	3650	\N
127040	GENERIC_DAY	0	2	2011-08-09	2233	\N	3650	\N
127041	GENERIC_DAY	0	2	2010-11-17	2229	\N	3650	\N
127042	GENERIC_DAY	0	2	2011-08-31	2225	\N	3650	\N
127043	GENERIC_DAY	0	0	2010-12-18	2233	\N	3650	\N
127044	GENERIC_DAY	0	0	2010-09-25	2225	\N	3650	\N
127045	GENERIC_DAY	0	0	2010-10-23	2223	\N	3650	\N
127046	GENERIC_DAY	0	0	2011-03-05	2229	\N	3650	\N
127047	GENERIC_DAY	0	0	2010-10-09	2223	\N	3650	\N
127048	GENERIC_DAY	0	0	2010-10-10	2229	\N	3650	\N
127049	GENERIC_DAY	0	2	2011-04-13	2229	\N	3650	\N
127050	GENERIC_DAY	0	2	2010-09-01	2229	\N	3650	\N
127051	GENERIC_DAY	0	2	2011-06-09	2229	\N	3650	\N
127052	GENERIC_DAY	0	2	2010-09-22	2233	\N	3650	\N
127053	GENERIC_DAY	0	0	2011-11-19	2233	\N	3650	\N
127054	GENERIC_DAY	0	0	2011-01-09	2225	\N	3650	\N
127055	GENERIC_DAY	0	0	2010-09-19	2231	\N	3650	\N
127056	GENERIC_DAY	0	0	2012-01-22	2233	\N	3650	\N
127057	GENERIC_DAY	0	0	2010-11-17	2225	\N	3650	\N
127058	GENERIC_DAY	0	2	2011-09-08	2225	\N	3650	\N
127059	GENERIC_DAY	0	0	2011-12-17	2223	\N	3650	\N
127060	GENERIC_DAY	0	2	2011-11-24	2225	\N	3650	\N
127061	GENERIC_DAY	0	1	2011-09-05	2223	\N	3650	\N
127062	GENERIC_DAY	0	2	2011-05-10	2233	\N	3650	\N
127063	GENERIC_DAY	0	0	2011-06-09	2225	\N	3650	\N
127064	GENERIC_DAY	0	3	2010-10-21	2231	\N	3650	\N
127065	GENERIC_DAY	0	0	2011-03-12	2231	\N	3650	\N
127066	GENERIC_DAY	0	2	2010-11-18	2229	\N	3650	\N
127067	GENERIC_DAY	0	0	2011-04-11	2225	\N	3650	\N
127068	GENERIC_DAY	0	0	2011-02-06	2233	\N	3650	\N
127069	GENERIC_DAY	0	0	2010-12-30	2225	\N	3650	\N
127070	GENERIC_DAY	0	2	2010-09-16	2229	\N	3650	\N
127071	GENERIC_DAY	0	1	2011-10-17	2233	\N	3650	\N
127072	GENERIC_DAY	0	1	2010-10-13	2223	\N	3650	\N
127073	GENERIC_DAY	0	3	2010-11-11	2231	\N	3650	\N
127074	GENERIC_DAY	0	1	2010-11-04	2223	\N	3650	\N
127075	GENERIC_DAY	0	0	2010-09-01	2225	\N	3650	\N
127076	GENERIC_DAY	0	3	2010-11-17	2231	\N	3650	\N
127077	GENERIC_DAY	0	1	2012-01-23	2223	\N	3650	\N
127078	GENERIC_DAY	0	2	2012-01-03	2225	\N	3650	\N
127079	GENERIC_DAY	0	2	2011-12-20	2229	\N	3650	\N
127080	GENERIC_DAY	0	0	2011-05-01	2233	\N	3650	\N
127081	GENERIC_DAY	0	3	2011-03-09	2231	\N	3650	\N
127082	GENERIC_DAY	0	0	2012-02-12	2233	\N	3650	\N
127083	GENERIC_DAY	0	0	2011-11-05	2223	\N	3650	\N
127084	GENERIC_DAY	0	1	2010-11-23	2223	\N	3650	\N
127085	GENERIC_DAY	0	1	2011-12-07	2223	\N	3650	\N
127086	GENERIC_DAY	0	2	2012-02-09	2229	\N	3650	\N
127087	GENERIC_DAY	0	0	2011-06-05	2229	\N	3650	\N
127088	GENERIC_DAY	0	0	2011-02-24	2225	\N	3650	\N
127089	GENERIC_DAY	0	0	2011-01-17	2225	\N	3650	\N
127090	GENERIC_DAY	0	1	2011-04-11	2223	\N	3650	\N
127091	GENERIC_DAY	0	2	2011-08-09	2223	\N	3650	\N
127092	GENERIC_DAY	0	1	2010-11-05	2229	\N	3650	\N
127093	GENERIC_DAY	0	1	2010-11-11	2223	\N	3650	\N
127094	GENERIC_DAY	0	2	2011-12-20	2225	\N	3650	\N
127095	GENERIC_DAY	0	2	2010-09-13	2229	\N	3650	\N
127096	GENERIC_DAY	0	0	2011-06-11	2233	\N	3650	\N
127097	GENERIC_DAY	0	0	2011-02-05	2223	\N	3650	\N
127098	GENERIC_DAY	0	2	2011-10-12	2225	\N	3650	\N
127099	GENERIC_DAY	0	2	2011-10-05	2229	\N	3650	\N
127100	GENERIC_DAY	0	2	2011-12-06	2225	\N	3650	\N
127101	GENERIC_DAY	0	1	2011-07-22	2223	\N	3650	\N
127102	GENERIC_DAY	0	1	2010-12-22	2223	\N	3650	\N
127103	GENERIC_DAY	0	0	2010-11-14	2225	\N	3650	\N
127104	GENERIC_DAY	0	1	2012-02-14	2223	\N	3650	\N
127105	GENERIC_DAY	0	1	2010-09-24	2229	\N	3650	\N
127106	GENERIC_DAY	0	0	2011-05-21	2223	\N	3650	\N
127107	GENERIC_DAY	0	0	2011-02-19	2231	\N	3650	\N
127108	GENERIC_DAY	0	1	2010-11-24	2223	\N	3650	\N
127109	GENERIC_DAY	0	0	2011-03-06	2229	\N	3650	\N
127110	GENERIC_DAY	0	3	2011-01-03	2231	\N	3650	\N
127111	GENERIC_DAY	0	0	2011-01-16	2233	\N	3650	\N
127112	GENERIC_DAY	0	0	2011-02-13	2229	\N	3650	\N
127113	GENERIC_DAY	0	2	2011-08-08	2223	\N	3650	\N
127114	GENERIC_DAY	0	0	2011-07-16	2223	\N	3650	\N
127115	GENERIC_DAY	0	0	2011-01-30	2223	\N	3650	\N
127116	GENERIC_DAY	0	1	2011-09-12	2223	\N	3650	\N
127117	GENERIC_DAY	0	0	2011-05-21	2229	\N	3650	\N
127118	GENERIC_DAY	0	0	2010-11-07	2223	\N	3650	\N
127119	GENERIC_DAY	0	2	2011-05-18	2233	\N	3650	\N
127120	GENERIC_DAY	0	0	2010-08-14	2229	\N	3650	\N
127121	GENERIC_DAY	0	3	2010-10-26	2231	\N	3650	\N
127122	GENERIC_DAY	0	0	2011-10-08	2223	\N	3650	\N
127123	GENERIC_DAY	0	1	2011-12-01	2233	\N	3650	\N
127124	GENERIC_DAY	0	1	2011-05-03	2223	\N	3650	\N
127125	GENERIC_DAY	0	2	2012-01-24	2225	\N	3650	\N
127126	GENERIC_DAY	0	0	2011-07-05	2225	\N	3650	\N
127127	GENERIC_DAY	0	0	2010-11-18	2225	\N	3650	\N
127128	GENERIC_DAY	0	2	2011-04-08	2231	\N	3650	\N
127129	GENERIC_DAY	0	0	2011-08-09	2225	\N	3650	\N
127130	GENERIC_DAY	0	2	2012-01-03	2229	\N	3650	\N
127131	GENERIC_DAY	0	0	2012-01-22	2225	\N	3650	\N
127132	GENERIC_DAY	0	0	2011-04-03	2223	\N	3650	\N
127133	GENERIC_DAY	0	2	2011-07-19	2231	\N	3650	\N
127134	GENERIC_DAY	0	0	2011-04-15	2225	\N	3650	\N
127135	GENERIC_DAY	0	0	2011-05-22	2233	\N	3650	\N
127136	GENERIC_DAY	0	2	2010-11-03	2229	\N	3650	\N
127137	GENERIC_DAY	0	1	2010-11-16	2223	\N	3650	\N
127138	GENERIC_DAY	0	0	2011-07-08	2225	\N	3650	\N
127139	GENERIC_DAY	0	2	2011-12-29	2231	\N	3650	\N
127140	GENERIC_DAY	0	3	2011-04-19	2231	\N	3650	\N
127141	GENERIC_DAY	0	0	2011-04-02	2231	\N	3650	\N
127142	GENERIC_DAY	0	1	2011-10-05	2233	\N	3650	\N
127143	GENERIC_DAY	0	0	2010-10-31	2231	\N	3650	\N
127144	GENERIC_DAY	0	2	2011-09-22	2229	\N	3650	\N
127145	GENERIC_DAY	0	2	2010-12-17	2233	\N	3650	\N
127146	GENERIC_DAY	0	2	2011-01-24	2233	\N	3650	\N
127147	GENERIC_DAY	0	0	2011-12-25	2225	\N	3650	\N
127148	GENERIC_DAY	0	0	2010-08-21	2225	\N	3650	\N
127149	GENERIC_DAY	0	0	2010-11-23	2225	\N	3650	\N
127150	GENERIC_DAY	0	3	2010-09-02	2231	\N	3650	\N
127151	GENERIC_DAY	0	1	2011-12-29	2223	\N	3650	\N
127152	GENERIC_DAY	0	2	2011-05-25	2229	\N	3650	\N
127153	GENERIC_DAY	0	3	2010-10-18	2231	\N	3650	\N
127154	GENERIC_DAY	0	1	2012-02-06	2233	\N	3650	\N
127155	GENERIC_DAY	0	2	2010-12-10	2231	\N	3650	\N
127156	GENERIC_DAY	0	3	2010-10-07	2231	\N	3650	\N
127157	GENERIC_DAY	0	0	2011-07-09	2229	\N	3650	\N
127158	GENERIC_DAY	0	2	2011-07-11	2229	\N	3650	\N
127159	GENERIC_DAY	0	2	2011-09-20	2231	\N	3650	\N
127160	GENERIC_DAY	0	0	2010-08-15	2223	\N	3650	\N
127161	GENERIC_DAY	0	1	2011-05-20	2223	\N	3650	\N
127162	GENERIC_DAY	0	2	2011-08-11	2233	\N	3650	\N
127163	GENERIC_DAY	0	2	2011-11-10	2229	\N	3650	\N
127164	GENERIC_DAY	0	2	2011-10-20	2225	\N	3650	\N
127165	GENERIC_DAY	0	0	2010-12-06	2233	\N	3650	\N
127166	GENERIC_DAY	0	3	2011-01-13	2231	\N	3650	\N
127167	GENERIC_DAY	0	0	2010-11-24	2225	\N	3650	\N
127168	GENERIC_DAY	0	2	2010-11-22	2229	\N	3650	\N
127169	GENERIC_DAY	0	0	2010-11-02	2225	\N	3650	\N
127170	GENERIC_DAY	0	2	2011-02-02	2233	\N	3650	\N
127171	GENERIC_DAY	0	2	2012-01-19	2231	\N	3650	\N
127172	GENERIC_DAY	0	0	2011-03-06	2233	\N	3650	\N
127173	GENERIC_DAY	0	0	2011-02-05	2225	\N	3650	\N
127174	GENERIC_DAY	0	0	2011-12-17	2231	\N	3650	\N
127175	GENERIC_DAY	0	0	2011-04-06	2225	\N	3650	\N
127176	GENERIC_DAY	0	1	2010-12-23	2223	\N	3650	\N
127177	GENERIC_DAY	0	0	2010-12-25	2231	\N	3650	\N
127178	GENERIC_DAY	0	2	2010-09-03	2231	\N	3650	\N
127179	GENERIC_DAY	0	1	2012-01-19	2223	\N	3650	\N
127180	GENERIC_DAY	0	2	2012-01-17	2231	\N	3650	\N
127181	GENERIC_DAY	0	0	2011-11-27	2223	\N	3650	\N
127182	GENERIC_DAY	0	2	2011-09-20	2225	\N	3650	\N
127183	GENERIC_DAY	0	2	2011-04-18	2233	\N	3650	\N
127184	GENERIC_DAY	0	0	2010-08-29	2223	\N	3650	\N
127185	GENERIC_DAY	0	0	2011-10-30	2225	\N	3650	\N
127186	GENERIC_DAY	0	2	2011-08-12	2231	\N	3650	\N
127187	GENERIC_DAY	0	1	2011-12-05	2233	\N	3650	\N
127188	GENERIC_DAY	0	1	2010-11-03	2223	\N	3650	\N
127189	GENERIC_DAY	0	1	2012-01-09	2223	\N	3650	\N
127190	GENERIC_DAY	0	1	2011-03-04	2229	\N	3650	\N
127191	GENERIC_DAY	0	0	2011-03-08	2225	\N	3650	\N
127192	GENERIC_DAY	0	3	2010-08-18	2231	\N	3650	\N
127193	GENERIC_DAY	0	1	2010-12-15	2223	\N	3650	\N
127194	GENERIC_DAY	0	0	2011-05-29	2233	\N	3650	\N
127195	GENERIC_DAY	0	2	2010-10-14	2229	\N	3650	\N
127196	GENERIC_DAY	0	1	2010-09-10	2223	\N	3650	\N
127197	GENERIC_DAY	0	0	2011-11-20	2229	\N	3650	\N
127198	GENERIC_DAY	0	0	2012-02-12	2223	\N	3650	\N
127199	GENERIC_DAY	0	1	2012-01-17	2233	\N	3650	\N
127200	GENERIC_DAY	0	0	2011-12-24	2225	\N	3650	\N
127201	GENERIC_DAY	0	2	2011-02-11	2231	\N	3650	\N
127202	GENERIC_DAY	0	0	2011-02-05	2229	\N	3650	\N
127203	GENERIC_DAY	0	0	2011-10-08	2233	\N	3650	\N
127204	GENERIC_DAY	0	3	2011-03-15	2231	\N	3650	\N
127205	GENERIC_DAY	0	2	2011-12-26	2225	\N	3650	\N
127206	GENERIC_DAY	0	2	2010-10-28	2229	\N	3650	\N
127207	GENERIC_DAY	0	1	2011-10-21	2229	\N	3650	\N
127208	GENERIC_DAY	0	2	2011-03-29	2229	\N	3650	\N
127209	GENERIC_DAY	0	2	2011-12-30	2231	\N	3650	\N
127210	GENERIC_DAY	0	0	2010-12-25	2225	\N	3650	\N
127211	GENERIC_DAY	0	2	2010-12-03	2233	\N	3650	\N
127212	GENERIC_DAY	0	0	2011-03-19	2225	\N	3650	\N
127213	GENERIC_DAY	0	2	2011-09-07	2231	\N	3650	\N
127214	GENERIC_DAY	0	0	2010-08-28	2231	\N	3650	\N
127215	GENERIC_DAY	0	0	2011-02-26	2229	\N	3650	\N
127216	GENERIC_DAY	0	2	2011-03-31	2229	\N	3650	\N
127217	GENERIC_DAY	0	0	2011-03-26	2233	\N	3650	\N
127218	GENERIC_DAY	0	2	2011-09-09	2231	\N	3650	\N
127219	GENERIC_DAY	0	0	2011-02-06	2225	\N	3650	\N
127220	GENERIC_DAY	0	3	2011-04-27	2231	\N	3650	\N
127221	GENERIC_DAY	0	2	2011-06-30	2233	\N	3650	\N
127222	GENERIC_DAY	0	2	2011-07-13	2233	\N	3650	\N
127223	GENERIC_DAY	0	2	2011-01-21	2233	\N	3650	\N
127224	GENERIC_DAY	0	2	2011-04-27	2233	\N	3650	\N
127225	GENERIC_DAY	0	0	2011-05-16	2225	\N	3650	\N
127226	GENERIC_DAY	0	2	2011-03-30	2229	\N	3650	\N
127227	GENERIC_DAY	0	0	2011-09-18	2229	\N	3650	\N
127228	GENERIC_DAY	0	0	2010-10-30	2223	\N	3650	\N
127229	GENERIC_DAY	0	0	2011-06-13	2225	\N	3650	\N
127230	GENERIC_DAY	0	2	2011-06-20	2233	\N	3650	\N
127231	GENERIC_DAY	0	2	2011-07-20	2233	\N	3650	\N
127232	GENERIC_DAY	0	2	2010-09-07	2233	\N	3650	\N
127233	GENERIC_DAY	0	0	2011-10-23	2229	\N	3650	\N
127234	GENERIC_DAY	0	0	2010-10-03	2233	\N	3650	\N
127235	GENERIC_DAY	0	2	2011-12-13	2225	\N	3650	\N
127236	GENERIC_DAY	0	2	2011-04-22	2231	\N	3650	\N
127237	GENERIC_DAY	0	0	2011-08-21	2231	\N	3650	\N
127238	GENERIC_DAY	0	2	2011-03-07	2233	\N	3650	\N
127239	GENERIC_DAY	0	3	2010-09-08	2231	\N	3650	\N
127240	GENERIC_DAY	0	0	2010-09-26	2223	\N	3650	\N
127241	GENERIC_DAY	0	2	2011-08-15	2229	\N	3650	\N
127242	GENERIC_DAY	0	2	2011-05-27	2233	\N	3650	\N
127243	GENERIC_DAY	0	1	2010-08-24	2223	\N	3650	\N
127244	GENERIC_DAY	0	1	2011-05-26	2223	\N	3650	\N
127245	GENERIC_DAY	0	2	2010-08-11	2233	\N	3650	\N
127246	GENERIC_DAY	0	2	2011-10-24	2231	\N	3650	\N
127247	GENERIC_DAY	0	0	2011-07-24	2229	\N	3650	\N
127248	GENERIC_DAY	0	2	2011-11-22	2229	\N	3650	\N
127249	GENERIC_DAY	0	0	2011-04-27	2225	\N	3650	\N
127250	GENERIC_DAY	0	0	2011-04-22	2225	\N	3650	\N
127251	GENERIC_DAY	0	3	2010-10-04	2231	\N	3650	\N
127252	GENERIC_DAY	0	2	2011-09-28	2225	\N	3650	\N
127253	GENERIC_DAY	0	0	2011-04-23	2229	\N	3650	\N
127254	GENERIC_DAY	0	2	2010-12-29	2233	\N	3650	\N
127255	GENERIC_DAY	0	0	2010-10-12	2233	\N	3650	\N
127256	GENERIC_DAY	0	0	2011-11-27	2233	\N	3650	\N
127257	GENERIC_DAY	0	2	2011-03-15	2229	\N	3650	\N
127258	GENERIC_DAY	0	0	2011-09-18	2233	\N	3650	\N
127259	GENERIC_DAY	0	3	2010-09-07	2231	\N	3650	\N
127260	GENERIC_DAY	0	2	2010-09-28	2233	\N	3650	\N
127261	GENERIC_DAY	0	0	2011-08-06	2229	\N	3650	\N
127262	GENERIC_DAY	0	1	2010-09-14	2223	\N	3650	\N
127263	GENERIC_DAY	0	0	2011-06-18	2225	\N	3650	\N
127264	GENERIC_DAY	0	0	2011-03-09	2225	\N	3650	\N
127265	GENERIC_DAY	0	2	2011-11-30	2225	\N	3650	\N
127266	GENERIC_DAY	0	1	2011-01-26	2223	\N	3650	\N
127267	GENERIC_DAY	0	2	2010-11-29	2229	\N	3650	\N
127268	GENERIC_DAY	0	0	2011-05-02	2225	\N	3650	\N
127269	GENERIC_DAY	0	0	2011-07-16	2225	\N	3650	\N
127270	GENERIC_DAY	0	0	2011-11-27	2229	\N	3650	\N
127271	GENERIC_DAY	0	2	2011-11-11	2231	\N	3650	\N
127272	GENERIC_DAY	0	1	2011-02-22	2223	\N	3650	\N
127273	GENERIC_DAY	0	2	2010-12-09	2233	\N	3650	\N
127274	GENERIC_DAY	0	0	2011-08-27	2231	\N	3650	\N
127275	GENERIC_DAY	0	1	2011-12-09	2223	\N	3650	\N
127276	GENERIC_DAY	0	1	2011-11-28	2223	\N	3650	\N
127277	GENERIC_DAY	0	2	2011-08-10	2223	\N	3650	\N
127278	GENERIC_DAY	0	0	2011-08-07	2225	\N	3650	\N
127279	GENERIC_DAY	0	0	2011-04-17	2225	\N	3650	\N
127280	GENERIC_DAY	0	1	2011-12-23	2229	\N	3650	\N
127281	GENERIC_DAY	0	0	2011-04-16	2233	\N	3650	\N
127282	GENERIC_DAY	0	1	2010-11-12	2229	\N	3650	\N
127283	GENERIC_DAY	0	2	2012-01-31	2231	\N	3650	\N
127284	GENERIC_DAY	0	2	2011-05-30	2233	\N	3650	\N
127285	GENERIC_DAY	0	0	2011-06-16	2225	\N	3650	\N
127286	GENERIC_DAY	0	0	2011-05-11	2225	\N	3650	\N
127287	GENERIC_DAY	0	0	2012-02-11	2231	\N	3650	\N
127288	GENERIC_DAY	0	2	2011-11-09	2229	\N	3650	\N
127289	GENERIC_DAY	0	0	2011-04-03	2229	\N	3650	\N
127290	GENERIC_DAY	0	2	2011-04-01	2231	\N	3650	\N
127291	GENERIC_DAY	0	2	2010-09-30	2229	\N	3650	\N
127292	GENERIC_DAY	0	0	2010-12-08	2233	\N	3650	\N
127293	GENERIC_DAY	0	2	2011-01-12	2229	\N	3650	\N
127294	GENERIC_DAY	0	0	2011-05-24	2225	\N	3650	\N
127295	GENERIC_DAY	0	1	2011-11-29	2223	\N	3650	\N
127296	GENERIC_DAY	0	1	2011-04-01	2223	\N	3650	\N
127297	GENERIC_DAY	0	1	2011-10-25	2233	\N	3650	\N
127298	GENERIC_DAY	0	0	2011-06-08	2225	\N	3650	\N
127299	GENERIC_DAY	0	0	2011-06-20	2225	\N	3650	\N
127300	GENERIC_DAY	0	0	2012-01-07	2231	\N	3650	\N
127301	GENERIC_DAY	0	0	2011-01-02	2223	\N	3650	\N
127302	GENERIC_DAY	0	0	2012-01-29	2225	\N	3650	\N
127303	GENERIC_DAY	0	2	2011-09-05	2231	\N	3650	\N
127304	GENERIC_DAY	0	1	2011-03-11	2223	\N	3650	\N
127305	GENERIC_DAY	0	0	2012-01-29	2231	\N	3650	\N
127306	GENERIC_DAY	0	0	2010-09-03	2225	\N	3650	\N
127307	GENERIC_DAY	0	2	2011-02-22	2229	\N	3650	\N
127308	GENERIC_DAY	0	0	2011-12-25	2229	\N	3650	\N
127309	GENERIC_DAY	0	1	2010-12-01	2223	\N	3650	\N
127310	GENERIC_DAY	0	2	2011-03-16	2233	\N	3650	\N
127311	GENERIC_DAY	0	0	2011-03-27	2229	\N	3650	\N
127312	GENERIC_DAY	0	2	2010-10-26	2233	\N	3650	\N
127313	GENERIC_DAY	0	0	2011-04-24	2231	\N	3650	\N
127314	GENERIC_DAY	0	1	2012-02-03	2233	\N	3650	\N
127315	GENERIC_DAY	0	0	2012-02-05	2233	\N	3650	\N
127316	GENERIC_DAY	0	2	2011-09-05	2225	\N	3650	\N
127317	GENERIC_DAY	0	0	2010-10-16	2231	\N	3650	\N
127318	GENERIC_DAY	0	0	2010-09-28	2225	\N	3650	\N
127319	GENERIC_DAY	0	1	2010-12-13	2223	\N	3650	\N
127320	GENERIC_DAY	0	0	2010-10-03	2223	\N	3650	\N
127321	GENERIC_DAY	0	1	2012-01-02	2223	\N	3650	\N
127322	GENERIC_DAY	0	2	2011-06-17	2233	\N	3650	\N
127323	GENERIC_DAY	0	0	2011-06-18	2231	\N	3650	\N
127324	GENERIC_DAY	0	0	2011-03-06	2223	\N	3650	\N
127325	GENERIC_DAY	0	3	2011-05-18	2231	\N	3650	\N
127326	GENERIC_DAY	0	2	2010-10-01	2231	\N	3650	\N
127327	GENERIC_DAY	0	2	2011-08-22	2231	\N	3650	\N
127328	GENERIC_DAY	0	0	2011-06-25	2233	\N	3650	\N
127329	GENERIC_DAY	0	1	2011-07-07	2223	\N	3650	\N
127330	GENERIC_DAY	0	2	2011-05-13	2233	\N	3650	\N
127331	GENERIC_DAY	0	3	2011-06-15	2231	\N	3650	\N
127332	GENERIC_DAY	0	2	2011-12-05	2231	\N	3650	\N
127333	GENERIC_DAY	0	2	2010-10-20	2233	\N	3650	\N
127334	GENERIC_DAY	0	2	2011-07-07	2229	\N	3650	\N
127335	GENERIC_DAY	0	1	2011-09-02	2223	\N	3650	\N
127336	GENERIC_DAY	0	1	2011-12-01	2223	\N	3650	\N
127337	GENERIC_DAY	0	2	2012-01-12	2231	\N	3650	\N
127338	GENERIC_DAY	0	2	2011-07-20	2231	\N	3650	\N
127339	GENERIC_DAY	0	0	2011-08-27	2225	\N	3650	\N
127340	GENERIC_DAY	0	1	2011-08-19	2225	\N	3650	\N
127341	GENERIC_DAY	0	2	2010-09-29	2233	\N	3650	\N
127342	GENERIC_DAY	0	1	2010-09-23	2223	\N	3650	\N
127343	GENERIC_DAY	0	0	2011-12-10	2225	\N	3650	\N
127344	GENERIC_DAY	0	0	2012-02-04	2231	\N	3650	\N
127345	GENERIC_DAY	0	2	2011-03-04	2231	\N	3650	\N
127346	GENERIC_DAY	0	2	2012-02-06	2225	\N	3650	\N
127347	GENERIC_DAY	0	2	2011-08-05	2229	\N	3650	\N
127348	GENERIC_DAY	0	0	2011-02-10	2225	\N	3650	\N
127349	GENERIC_DAY	0	0	2011-09-17	2225	\N	3650	\N
127350	GENERIC_DAY	0	1	2012-02-15	2223	\N	3650	\N
127351	GENERIC_DAY	0	0	2011-07-01	2225	\N	3650	\N
127352	GENERIC_DAY	0	0	2010-09-18	2229	\N	3650	\N
127353	GENERIC_DAY	0	2	2011-02-22	2233	\N	3650	\N
127354	GENERIC_DAY	0	0	2011-03-13	2223	\N	3650	\N
127355	GENERIC_DAY	0	2	2011-08-12	2229	\N	3650	\N
127356	GENERIC_DAY	0	0	2011-03-19	2233	\N	3650	\N
127357	GENERIC_DAY	0	2	2011-07-12	2223	\N	3650	\N
127358	GENERIC_DAY	0	2	2011-04-19	2233	\N	3650	\N
127359	GENERIC_DAY	0	2	2011-03-02	2229	\N	3650	\N
127360	GENERIC_DAY	0	0	2010-11-28	2229	\N	3650	\N
127361	GENERIC_DAY	0	0	2011-05-01	2231	\N	3650	\N
127362	GENERIC_DAY	0	2	2011-03-28	2229	\N	3650	\N
127363	GENERIC_DAY	0	2	2012-02-16	2225	\N	3650	\N
127364	GENERIC_DAY	0	1	2011-08-24	2233	\N	3650	\N
127365	GENERIC_DAY	0	2	2011-04-28	2233	\N	3650	\N
127366	GENERIC_DAY	0	0	2011-05-14	2225	\N	3650	\N
127367	GENERIC_DAY	0	2	2010-11-04	2229	\N	3650	\N
127368	GENERIC_DAY	0	2	2011-04-29	2231	\N	3650	\N
127369	GENERIC_DAY	0	1	2010-09-06	2223	\N	3650	\N
127370	GENERIC_DAY	0	0	2011-09-18	2223	\N	3650	\N
127371	GENERIC_DAY	0	2	2011-01-14	2233	\N	3650	\N
127372	GENERIC_DAY	0	1	2012-02-03	2225	\N	3650	\N
127373	GENERIC_DAY	0	1	2011-11-25	2223	\N	3650	\N
127374	GENERIC_DAY	0	2	2010-08-16	2229	\N	3650	\N
127375	GENERIC_DAY	0	2	2011-04-14	2233	\N	3650	\N
127376	GENERIC_DAY	0	2	2010-12-27	2233	\N	3650	\N
127377	GENERIC_DAY	0	1	2011-03-17	2223	\N	3650	\N
127378	GENERIC_DAY	0	0	2010-12-25	2229	\N	3650	\N
127379	GENERIC_DAY	0	2	2011-07-04	2233	\N	3650	\N
127380	GENERIC_DAY	0	0	2011-05-01	2229	\N	3650	\N
127381	GENERIC_DAY	0	0	2011-10-02	2233	\N	3650	\N
127382	GENERIC_DAY	0	0	2010-11-20	2231	\N	3650	\N
127383	GENERIC_DAY	0	0	2010-09-18	2233	\N	3650	\N
127384	GENERIC_DAY	0	3	2011-03-28	2231	\N	3650	\N
127385	GENERIC_DAY	0	0	2011-02-20	2225	\N	3650	\N
127386	GENERIC_DAY	0	0	2010-10-10	2225	\N	3650	\N
127387	GENERIC_DAY	0	1	2012-01-02	2233	\N	3650	\N
127388	GENERIC_DAY	0	0	2011-07-07	2225	\N	3650	\N
127389	GENERIC_DAY	0	0	2011-03-20	2233	\N	3650	\N
127390	GENERIC_DAY	0	1	2011-12-15	2233	\N	3650	\N
127391	GENERIC_DAY	0	0	2011-02-14	2225	\N	3650	\N
127392	GENERIC_DAY	0	0	2011-08-21	2229	\N	3650	\N
127393	GENERIC_DAY	0	0	2010-10-19	2225	\N	3650	\N
127394	GENERIC_DAY	0	1	2011-05-30	2223	\N	3650	\N
127395	GENERIC_DAY	0	0	2011-12-31	2225	\N	3650	\N
127396	GENERIC_DAY	0	0	2010-10-31	2223	\N	3650	\N
127397	GENERIC_DAY	0	1	2011-10-11	2223	\N	3650	\N
127398	GENERIC_DAY	0	1	2010-08-12	2223	\N	3650	\N
127399	GENERIC_DAY	0	2	2011-12-27	2229	\N	3650	\N
127400	GENERIC_DAY	0	2	2011-08-15	2223	\N	3650	\N
127401	GENERIC_DAY	0	2	2011-05-20	2233	\N	3650	\N
127402	GENERIC_DAY	0	2	2011-05-26	2233	\N	3650	\N
127403	GENERIC_DAY	0	1	2011-11-21	2223	\N	3650	\N
127404	GENERIC_DAY	0	2	2011-10-18	2225	\N	3650	\N
127405	GENERIC_DAY	0	0	2010-12-04	2225	\N	3650	\N
127406	GENERIC_DAY	0	2	2010-12-22	2233	\N	3650	\N
127407	GENERIC_DAY	0	0	2010-09-25	2231	\N	3650	\N
127408	GENERIC_DAY	0	0	2010-12-12	2225	\N	3650	\N
127409	GENERIC_DAY	0	1	2011-12-27	2223	\N	3650	\N
127410	GENERIC_DAY	0	2	2011-08-16	2233	\N	3650	\N
127411	GENERIC_DAY	0	0	2011-04-09	2223	\N	3650	\N
127412	GENERIC_DAY	0	1	2012-01-06	2233	\N	3650	\N
127413	GENERIC_DAY	0	0	2011-03-12	2225	\N	3650	\N
127414	GENERIC_DAY	0	2	2012-01-03	2231	\N	3650	\N
127415	GENERIC_DAY	0	0	2010-09-05	2231	\N	3650	\N
127416	GENERIC_DAY	0	2	2011-02-02	2229	\N	3650	\N
127417	GENERIC_DAY	0	0	2011-03-06	2231	\N	3650	\N
127418	GENERIC_DAY	0	2	2010-09-07	2229	\N	3650	\N
127419	GENERIC_DAY	0	0	2010-09-18	2223	\N	3650	\N
127420	GENERIC_DAY	0	2	2011-03-07	2229	\N	3650	\N
127421	GENERIC_DAY	0	0	2011-04-17	2229	\N	3650	\N
127422	GENERIC_DAY	0	1	2010-10-05	2223	\N	3650	\N
127423	GENERIC_DAY	0	2	2011-06-01	2233	\N	3650	\N
127424	GENERIC_DAY	0	1	2011-02-16	2223	\N	3650	\N
127425	GENERIC_DAY	0	3	2011-03-17	2231	\N	3650	\N
127426	GENERIC_DAY	0	0	2011-12-25	2231	\N	3650	\N
127427	GENERIC_DAY	0	2	2010-12-28	2233	\N	3650	\N
127428	GENERIC_DAY	0	1	2011-11-21	2233	\N	3650	\N
127429	GENERIC_DAY	0	0	2011-03-19	2229	\N	3650	\N
127430	GENERIC_DAY	0	3	2011-01-26	2231	\N	3650	\N
127431	GENERIC_DAY	0	0	2011-01-05	2225	\N	3650	\N
127432	GENERIC_DAY	0	0	2010-10-02	2233	\N	3650	\N
127433	GENERIC_DAY	0	1	2012-02-09	2233	\N	3650	\N
127434	GENERIC_DAY	0	0	2011-03-13	2225	\N	3650	\N
127435	GENERIC_DAY	0	0	2012-02-18	2225	\N	3650	\N
127436	GENERIC_DAY	0	0	2011-09-24	2225	\N	3650	\N
127437	GENERIC_DAY	0	2	2010-08-12	2229	\N	3650	\N
127438	GENERIC_DAY	0	3	2011-01-05	2231	\N	3650	\N
127439	GENERIC_DAY	0	2	2011-06-23	2229	\N	3650	\N
127440	GENERIC_DAY	0	1	2011-10-11	2233	\N	3650	\N
127441	GENERIC_DAY	0	0	2010-12-16	2225	\N	3650	\N
127442	GENERIC_DAY	0	1	2011-02-02	2223	\N	3650	\N
127443	GENERIC_DAY	0	0	2011-01-22	2229	\N	3650	\N
127444	GENERIC_DAY	0	1	2011-10-31	2223	\N	3650	\N
127445	GENERIC_DAY	0	2	2011-06-28	2233	\N	3650	\N
127446	GENERIC_DAY	0	1	2011-10-10	2233	\N	3650	\N
127447	GENERIC_DAY	0	2	2011-10-17	2231	\N	3650	\N
127448	GENERIC_DAY	0	2	2011-04-04	2233	\N	3650	\N
127449	GENERIC_DAY	0	0	2010-09-20	2225	\N	3650	\N
127450	GENERIC_DAY	0	2	2011-09-16	2231	\N	3650	\N
127451	GENERIC_DAY	0	0	2010-10-30	2229	\N	3650	\N
127452	GENERIC_DAY	0	1	2010-11-10	2223	\N	3650	\N
127453	GENERIC_DAY	0	1	2011-09-21	2233	\N	3650	\N
127454	GENERIC_DAY	0	0	2011-04-07	2225	\N	3650	\N
127455	GENERIC_DAY	0	3	2011-06-29	2231	\N	3650	\N
127456	GENERIC_DAY	0	0	2011-03-01	2225	\N	3650	\N
127457	GENERIC_DAY	0	1	2011-12-27	2233	\N	3650	\N
127458	GENERIC_DAY	0	0	2011-05-14	2231	\N	3650	\N
127459	GENERIC_DAY	0	2	2011-02-17	2229	\N	3650	\N
127460	GENERIC_DAY	0	1	2011-12-22	2223	\N	3650	\N
127461	GENERIC_DAY	0	1	2012-01-30	2233	\N	3650	\N
127462	GENERIC_DAY	0	3	2010-09-22	2231	\N	3650	\N
127463	GENERIC_DAY	0	2	2011-04-06	2233	\N	3650	\N
127464	GENERIC_DAY	0	2	2011-04-28	2229	\N	3650	\N
127465	GENERIC_DAY	0	1	2010-10-26	2223	\N	3650	\N
127466	GENERIC_DAY	0	2	2011-12-12	2231	\N	3650	\N
127467	GENERIC_DAY	0	1	2010-12-10	2223	\N	3650	\N
127468	GENERIC_DAY	0	2	2011-01-07	2233	\N	3650	\N
127469	GENERIC_DAY	0	1	2011-10-13	2223	\N	3650	\N
127470	GENERIC_DAY	0	0	2011-12-03	2223	\N	3650	\N
127471	GENERIC_DAY	0	2	2011-03-21	2229	\N	3650	\N
127472	GENERIC_DAY	0	2	2010-11-15	2233	\N	3650	\N
127473	GENERIC_DAY	0	1	2011-09-20	2233	\N	3650	\N
127474	GENERIC_DAY	0	1	2011-03-08	2223	\N	3650	\N
127475	GENERIC_DAY	0	1	2011-09-30	2229	\N	3650	\N
127476	GENERIC_DAY	0	0	2010-11-28	2233	\N	3650	\N
127477	GENERIC_DAY	0	0	2011-04-12	2225	\N	3650	\N
127478	GENERIC_DAY	0	2	2010-12-31	2231	\N	3650	\N
127479	GENERIC_DAY	0	0	2011-10-15	2225	\N	3650	\N
127480	GENERIC_DAY	0	1	2011-10-21	2233	\N	3650	\N
127481	GENERIC_DAY	0	0	2011-07-12	2225	\N	3650	\N
127482	GENERIC_DAY	0	1	2011-09-13	2233	\N	3650	\N
127483	GENERIC_DAY	0	2	2011-08-16	2223	\N	3650	\N
127484	GENERIC_DAY	0	2	2011-06-28	2229	\N	3650	\N
127485	GENERIC_DAY	0	0	2011-08-20	2233	\N	3650	\N
127486	GENERIC_DAY	0	0	2011-03-19	2231	\N	3650	\N
127487	GENERIC_DAY	0	1	2010-12-07	2223	\N	3650	\N
127488	GENERIC_DAY	0	0	2010-12-19	2229	\N	3650	\N
127489	GENERIC_DAY	0	2	2011-12-14	2225	\N	3650	\N
127490	GENERIC_DAY	0	1	2011-05-13	2223	\N	3650	\N
127491	GENERIC_DAY	0	2	2011-08-19	2231	\N	3650	\N
127492	GENERIC_DAY	0	1	2011-10-28	2225	\N	3650	\N
127493	GENERIC_DAY	0	2	2010-09-08	2233	\N	3650	\N
127494	GENERIC_DAY	0	2	2011-01-18	2229	\N	3650	\N
127495	GENERIC_DAY	0	0	2011-06-07	2225	\N	3650	\N
127496	GENERIC_DAY	0	2	2011-11-16	2225	\N	3650	\N
127497	GENERIC_DAY	0	2	2011-06-13	2229	\N	3650	\N
127498	GENERIC_DAY	0	0	2011-12-24	2231	\N	3650	\N
127499	GENERIC_DAY	0	0	2011-08-13	2231	\N	3650	\N
127500	GENERIC_DAY	0	0	2011-05-25	2225	\N	3650	\N
127501	GENERIC_DAY	0	0	2011-01-01	2233	\N	3650	\N
127502	GENERIC_DAY	0	3	2010-12-20	2231	\N	3650	\N
127503	GENERIC_DAY	0	2	2011-02-17	2233	\N	3650	\N
127504	GENERIC_DAY	0	3	2011-04-13	2231	\N	3650	\N
127505	GENERIC_DAY	0	2	2012-01-05	2225	\N	3650	\N
127506	GENERIC_DAY	0	0	2011-06-29	2225	\N	3650	\N
127507	GENERIC_DAY	0	0	2012-01-21	2231	\N	3650	\N
127508	GENERIC_DAY	0	2	2011-01-07	2231	\N	3650	\N
127509	GENERIC_DAY	0	2	2011-09-23	2231	\N	3650	\N
127510	GENERIC_DAY	0	3	2010-11-29	2231	\N	3650	\N
127511	GENERIC_DAY	0	2	2010-11-05	2233	\N	3650	\N
127512	GENERIC_DAY	0	2	2012-02-13	2231	\N	3650	\N
127513	GENERIC_DAY	0	0	2012-02-11	2229	\N	3650	\N
127514	GENERIC_DAY	0	0	2011-07-19	2225	\N	3650	\N
127515	GENERIC_DAY	0	3	2011-02-03	2231	\N	3650	\N
127516	GENERIC_DAY	0	0	2011-06-19	2233	\N	3650	\N
127517	GENERIC_DAY	0	2	2011-11-15	2231	\N	3650	\N
127518	GENERIC_DAY	0	1	2011-06-02	2223	\N	3650	\N
127519	GENERIC_DAY	0	3	2010-12-21	2231	\N	3650	\N
127520	GENERIC_DAY	0	1	2011-09-19	2223	\N	3650	\N
127521	GENERIC_DAY	0	3	2011-01-24	2231	\N	3650	\N
127522	GENERIC_DAY	0	2	2010-09-20	2229	\N	3650	\N
127523	GENERIC_DAY	0	2	2011-07-25	2231	\N	3650	\N
127524	GENERIC_DAY	0	2	2012-01-10	2231	\N	3650	\N
127525	GENERIC_DAY	0	2	2011-08-15	2233	\N	3650	\N
127526	GENERIC_DAY	0	0	2011-05-14	2229	\N	3650	\N
127527	GENERIC_DAY	0	0	2010-11-09	2225	\N	3650	\N
127528	GENERIC_DAY	0	2	2011-01-11	2233	\N	3650	\N
127529	GENERIC_DAY	0	2	2010-10-27	2233	\N	3650	\N
127530	GENERIC_DAY	0	0	2011-05-22	2231	\N	3650	\N
127531	GENERIC_DAY	0	2	2012-01-18	2231	\N	3650	\N
127532	GENERIC_DAY	0	1	2011-10-03	2223	\N	3650	\N
127533	GENERIC_DAY	0	1	2011-09-05	2233	\N	3650	\N
127534	GENERIC_DAY	0	1	2011-12-21	2233	\N	3650	\N
127535	GENERIC_DAY	0	0	2011-08-21	2223	\N	3650	\N
127536	GENERIC_DAY	0	1	2011-12-26	2233	\N	3650	\N
127537	GENERIC_DAY	0	2	2011-10-17	2229	\N	3650	\N
127538	GENERIC_DAY	0	2	2011-12-12	2229	\N	3650	\N
127539	GENERIC_DAY	0	3	2011-06-06	2231	\N	3650	\N
127540	GENERIC_DAY	0	2	2011-11-29	2231	\N	3650	\N
127541	GENERIC_DAY	0	1	2011-10-31	2233	\N	3650	\N
127542	GENERIC_DAY	0	0	2011-10-09	2225	\N	3650	\N
127543	GENERIC_DAY	0	2	2011-05-27	2231	\N	3650	\N
127544	GENERIC_DAY	0	0	2010-10-17	2223	\N	3650	\N
127545	GENERIC_DAY	0	0	2011-04-24	2223	\N	3650	\N
127546	GENERIC_DAY	0	0	2011-07-30	2229	\N	3650	\N
127547	GENERIC_DAY	0	1	2011-01-04	2223	\N	3650	\N
127548	GENERIC_DAY	0	2	2011-11-03	2229	\N	3650	\N
127549	GENERIC_DAY	0	2	2011-04-07	2229	\N	3650	\N
127550	GENERIC_DAY	0	2	2011-12-19	2231	\N	3650	\N
127551	GENERIC_DAY	0	2	2011-11-24	2229	\N	3650	\N
127552	GENERIC_DAY	0	0	2011-07-31	2223	\N	3650	\N
127553	GENERIC_DAY	0	2	2011-03-30	2233	\N	3650	\N
127554	GENERIC_DAY	0	1	2011-05-12	2223	\N	3650	\N
127555	GENERIC_DAY	0	0	2011-01-31	2225	\N	3650	\N
127556	GENERIC_DAY	0	1	2011-08-18	2223	\N	3650	\N
127557	GENERIC_DAY	0	0	2010-11-08	2225	\N	3650	\N
127558	GENERIC_DAY	0	1	2011-04-29	2223	\N	3650	\N
127559	GENERIC_DAY	0	0	2011-06-11	2225	\N	3650	\N
127560	GENERIC_DAY	0	0	2011-03-26	2225	\N	3650	\N
127561	GENERIC_DAY	0	1	2010-12-24	2229	\N	3650	\N
127562	GENERIC_DAY	0	3	2011-02-02	2231	\N	3650	\N
127563	GENERIC_DAY	0	0	2011-09-17	2231	\N	3650	\N
127564	GENERIC_DAY	0	1	2011-11-03	2223	\N	3650	\N
127565	GENERIC_DAY	0	0	2011-05-28	2223	\N	3650	\N
127566	GENERIC_DAY	0	0	2011-01-08	2225	\N	3650	\N
127567	GENERIC_DAY	0	3	2010-12-13	2231	\N	3650	\N
127568	GENERIC_DAY	0	1	2010-10-01	2223	\N	3650	\N
127569	GENERIC_DAY	0	0	2010-09-25	2223	\N	3650	\N
127570	GENERIC_DAY	0	0	2011-08-13	2229	\N	3650	\N
127571	GENERIC_DAY	0	2	2011-09-12	2225	\N	3650	\N
127572	GENERIC_DAY	0	2	2010-10-25	2229	\N	3650	\N
127573	GENERIC_DAY	0	0	2012-01-07	2223	\N	3650	\N
127574	GENERIC_DAY	0	2	2011-11-18	2231	\N	3650	\N
127575	GENERIC_DAY	0	2	2011-02-21	2229	\N	3650	\N
127576	GENERIC_DAY	0	0	2011-12-31	2233	\N	3650	\N
127577	GENERIC_DAY	0	0	2012-01-14	2233	\N	3650	\N
127578	GENERIC_DAY	0	2	2011-08-04	2223	\N	3650	\N
127579	GENERIC_DAY	0	1	2011-03-14	2223	\N	3650	\N
127580	GENERIC_DAY	0	2	2011-04-07	2233	\N	3650	\N
127581	GENERIC_DAY	0	0	2010-09-18	2231	\N	3650	\N
127582	GENERIC_DAY	0	3	2010-12-28	2231	\N	3650	\N
127583	GENERIC_DAY	0	2	2011-05-24	2229	\N	3650	\N
127584	GENERIC_DAY	0	1	2011-10-26	2233	\N	3650	\N
127585	GENERIC_DAY	0	0	2012-02-12	2225	\N	3650	\N
127586	GENERIC_DAY	0	0	2011-01-02	2229	\N	3650	\N
127587	GENERIC_DAY	0	0	2011-08-17	2225	\N	3650	\N
127588	GENERIC_DAY	0	1	2010-11-29	2223	\N	3650	\N
127589	GENERIC_DAY	0	3	2010-11-15	2231	\N	3650	\N
127590	GENERIC_DAY	0	0	2011-01-01	2229	\N	3650	\N
127591	GENERIC_DAY	0	2	2011-08-18	2225	\N	3650	\N
127592	GENERIC_DAY	0	2	2010-10-07	2233	\N	3650	\N
127593	GENERIC_DAY	0	2	2010-12-17	2231	\N	3650	\N
127594	GENERIC_DAY	0	2	2011-07-04	2229	\N	3650	\N
127595	GENERIC_DAY	0	2	2011-01-26	2233	\N	3650	\N
127596	GENERIC_DAY	0	2	2010-10-06	2229	\N	3650	\N
127597	GENERIC_DAY	0	0	2010-10-24	2229	\N	3650	\N
127598	GENERIC_DAY	0	1	2012-01-24	2233	\N	3650	\N
127599	GENERIC_DAY	0	1	2012-01-10	2233	\N	3650	\N
127600	GENERIC_DAY	0	2	2011-08-29	2231	\N	3650	\N
127601	GENERIC_DAY	0	2	2011-02-11	2233	\N	3650	\N
127602	GENERIC_DAY	0	0	2010-11-27	2223	\N	3650	\N
127603	GENERIC_DAY	0	2	2011-07-28	2223	\N	3650	\N
127604	GENERIC_DAY	0	2	2011-11-25	2231	\N	3650	\N
127605	GENERIC_DAY	0	2	2012-02-15	2225	\N	3650	\N
127606	GENERIC_DAY	0	2	2011-05-20	2231	\N	3650	\N
127607	GENERIC_DAY	0	2	2011-06-29	2229	\N	3650	\N
127608	GENERIC_DAY	0	0	2011-05-14	2223	\N	3650	\N
127609	GENERIC_DAY	0	2	2011-10-18	2231	\N	3650	\N
127610	GENERIC_DAY	0	2	2011-04-13	2233	\N	3650	\N
127611	GENERIC_DAY	0	1	2011-08-19	2223	\N	3650	\N
127612	GENERIC_DAY	0	1	2011-01-12	2223	\N	3650	\N
127613	GENERIC_DAY	0	2	2011-01-20	2233	\N	3650	\N
127614	GENERIC_DAY	0	0	2011-10-23	2225	\N	3650	\N
127615	GENERIC_DAY	0	2	2011-11-04	2231	\N	3650	\N
127616	GENERIC_DAY	0	0	2010-10-17	2231	\N	3650	\N
127617	GENERIC_DAY	0	2	2011-08-02	2233	\N	3650	\N
127618	GENERIC_DAY	0	0	2011-05-06	2225	\N	3650	\N
127619	GENERIC_DAY	0	2	2010-11-03	2233	\N	3650	\N
127620	GENERIC_DAY	0	0	2012-01-21	2233	\N	3650	\N
127621	GENERIC_DAY	0	0	2011-01-09	2223	\N	3650	\N
127622	GENERIC_DAY	0	1	2010-09-17	2223	\N	3650	\N
127623	GENERIC_DAY	0	0	2011-03-13	2231	\N	3650	\N
127624	GENERIC_DAY	0	3	2011-06-30	2231	\N	3650	\N
127625	GENERIC_DAY	0	2	2011-07-12	2233	\N	3650	\N
127626	GENERIC_DAY	0	3	2010-08-24	2231	\N	3650	\N
127627	GENERIC_DAY	0	2	2011-07-28	2233	\N	3650	\N
127628	GENERIC_DAY	0	3	2011-06-13	2231	\N	3650	\N
127629	GENERIC_DAY	0	1	2010-11-19	2223	\N	3650	\N
127630	GENERIC_DAY	0	3	2011-05-19	2231	\N	3650	\N
127631	GENERIC_DAY	0	2	2011-09-21	2231	\N	3650	\N
127632	GENERIC_DAY	0	2	2010-08-25	2229	\N	3650	\N
127633	GENERIC_DAY	0	0	2012-01-15	2233	\N	3650	\N
127634	GENERIC_DAY	0	0	2010-12-08	2225	\N	3650	\N
127635	GENERIC_DAY	0	2	2012-01-25	2231	\N	3650	\N
127636	GENERIC_DAY	0	3	2011-05-04	2231	\N	3650	\N
127637	GENERIC_DAY	0	1	2011-04-28	2223	\N	3650	\N
127638	GENERIC_DAY	0	2	2010-12-02	2233	\N	3650	\N
127639	GENERIC_DAY	0	2	2010-09-24	2231	\N	3650	\N
127640	GENERIC_DAY	0	2	2011-05-12	2229	\N	3650	\N
127641	GENERIC_DAY	0	0	2011-11-06	2233	\N	3650	\N
127642	GENERIC_DAY	0	0	2011-05-29	2231	\N	3650	\N
127643	GENERIC_DAY	0	0	2011-02-13	2225	\N	3650	\N
127644	GENERIC_DAY	0	2	2011-03-22	2229	\N	3650	\N
127645	GENERIC_DAY	0	2	2011-11-07	2229	\N	3650	\N
127646	GENERIC_DAY	0	2	2010-10-14	2233	\N	3650	\N
127647	GENERIC_DAY	0	2	2011-05-24	2233	\N	3650	\N
127648	GENERIC_DAY	0	2	2011-07-26	2231	\N	3650	\N
127649	GENERIC_DAY	0	2	2011-07-18	2223	\N	3650	\N
127650	GENERIC_DAY	0	1	2012-01-19	2233	\N	3650	\N
127651	GENERIC_DAY	0	3	2011-03-01	2231	\N	3650	\N
127652	GENERIC_DAY	0	0	2011-07-02	2231	\N	3650	\N
127653	GENERIC_DAY	0	3	2011-05-12	2231	\N	3650	\N
127654	GENERIC_DAY	0	2	2011-08-24	2229	\N	3650	\N
127655	GENERIC_DAY	0	1	2011-05-20	2229	\N	3650	\N
127656	GENERIC_DAY	0	2	2011-05-02	2229	\N	3650	\N
127657	GENERIC_DAY	0	1	2012-02-16	2233	\N	3650	\N
127658	GENERIC_DAY	0	1	2012-01-18	2223	\N	3650	\N
127659	GENERIC_DAY	0	1	2012-02-14	2233	\N	3650	\N
127660	GENERIC_DAY	0	1	2011-09-23	2223	\N	3650	\N
127661	GENERIC_DAY	0	1	2012-01-20	2223	\N	3650	\N
127662	GENERIC_DAY	0	2	2011-05-10	2229	\N	3650	\N
127663	GENERIC_DAY	0	3	2010-12-29	2231	\N	3650	\N
127664	GENERIC_DAY	0	2	2011-06-27	2229	\N	3650	\N
127665	GENERIC_DAY	0	2	2010-11-24	2233	\N	3650	\N
127666	GENERIC_DAY	0	0	2010-12-11	2231	\N	3650	\N
127667	GENERIC_DAY	0	1	2010-08-20	2229	\N	3650	\N
127668	GENERIC_DAY	0	0	2011-06-12	2223	\N	3650	\N
127669	GENERIC_DAY	0	1	2011-12-30	2233	\N	3650	\N
127670	GENERIC_DAY	0	2	2010-12-23	2233	\N	3650	\N
127671	GENERIC_DAY	0	0	2012-02-04	2229	\N	3650	\N
127672	GENERIC_DAY	0	1	2012-01-30	2223	\N	3650	\N
127673	GENERIC_DAY	0	2	2010-09-10	2231	\N	3650	\N
127674	GENERIC_DAY	0	1	2012-01-13	2229	\N	3650	\N
127675	GENERIC_DAY	0	2	2011-03-03	2233	\N	3650	\N
127676	GENERIC_DAY	0	1	2011-06-16	2223	\N	3650	\N
127677	GENERIC_DAY	0	0	2011-05-30	2225	\N	3650	\N
127678	GENERIC_DAY	0	0	2011-06-26	2223	\N	3650	\N
127679	GENERIC_DAY	0	1	2011-02-24	2223	\N	3650	\N
127680	GENERIC_DAY	0	3	2011-03-03	2231	\N	3650	\N
127681	GENERIC_DAY	0	1	2011-06-24	2229	\N	3650	\N
127682	GENERIC_DAY	0	0	2011-07-16	2233	\N	3650	\N
127683	GENERIC_DAY	0	0	2011-03-16	2225	\N	3650	\N
127684	GENERIC_DAY	0	0	2011-02-01	2225	\N	3650	\N
127685	GENERIC_DAY	0	0	2010-11-01	2225	\N	3650	\N
127686	GENERIC_DAY	0	0	2011-10-02	2229	\N	3650	\N
127687	GENERIC_DAY	0	2	2010-10-04	2229	\N	3650	\N
127688	GENERIC_DAY	0	0	2011-12-11	2233	\N	3650	\N
127689	GENERIC_DAY	0	1	2011-05-13	2229	\N	3650	\N
127690	GENERIC_DAY	0	0	2010-12-23	2225	\N	3650	\N
127691	GENERIC_DAY	0	2	2012-01-18	2225	\N	3650	\N
127692	GENERIC_DAY	0	3	2011-02-28	2231	\N	3650	\N
127693	GENERIC_DAY	0	1	2011-01-31	2223	\N	3650	\N
127694	GENERIC_DAY	0	0	2011-03-13	2233	\N	3650	\N
127695	GENERIC_DAY	0	0	2012-01-15	2231	\N	3650	\N
127696	GENERIC_DAY	0	1	2010-08-13	2229	\N	3650	\N
127697	GENERIC_DAY	0	2	2011-02-18	2233	\N	3650	\N
127698	GENERIC_DAY	0	0	2012-01-22	2231	\N	3650	\N
127699	GENERIC_DAY	0	0	2011-03-06	2225	\N	3650	\N
127700	GENERIC_DAY	0	0	2011-01-22	2233	\N	3650	\N
127701	GENERIC_DAY	0	2	2011-08-02	2229	\N	3650	\N
127702	GENERIC_DAY	0	2	2011-10-27	2229	\N	3650	\N
127703	GENERIC_DAY	0	0	2010-11-21	2225	\N	3650	\N
127704	GENERIC_DAY	0	3	2011-04-11	2231	\N	3650	\N
127705	GENERIC_DAY	0	2	2011-01-28	2231	\N	3650	\N
127706	GENERIC_DAY	0	1	2011-11-10	2223	\N	3650	\N
127707	GENERIC_DAY	0	3	2011-06-14	2231	\N	3650	\N
127708	GENERIC_DAY	0	2	2010-12-01	2229	\N	3650	\N
127709	GENERIC_DAY	0	1	2012-01-06	2229	\N	3650	\N
127710	GENERIC_DAY	0	3	2011-01-19	2231	\N	3650	\N
127711	GENERIC_DAY	0	1	2011-04-08	2229	\N	3650	\N
127712	GENERIC_DAY	0	1	2011-08-25	2223	\N	3650	\N
127713	GENERIC_DAY	0	1	2012-01-03	2223	\N	3650	\N
127714	GENERIC_DAY	0	0	2010-10-29	2225	\N	3650	\N
127715	GENERIC_DAY	0	0	2011-02-20	2231	\N	3650	\N
127716	GENERIC_DAY	0	0	2011-08-28	2233	\N	3650	\N
127717	GENERIC_DAY	0	2	2012-01-26	2231	\N	3650	\N
127718	GENERIC_DAY	0	0	2011-06-05	2225	\N	3650	\N
127719	GENERIC_DAY	0	0	2011-08-02	2225	\N	3650	\N
127720	GENERIC_DAY	0	1	2010-10-14	2223	\N	3650	\N
127721	GENERIC_DAY	0	0	2011-11-26	2225	\N	3650	\N
127722	GENERIC_DAY	0	2	2011-01-19	2233	\N	3650	\N
127723	GENERIC_DAY	0	0	2010-11-27	2231	\N	3650	\N
127724	GENERIC_DAY	0	2	2011-09-01	2231	\N	3650	\N
127725	GENERIC_DAY	0	2	2011-04-05	2233	\N	3650	\N
127726	GENERIC_DAY	0	2	2011-08-04	2231	\N	3650	\N
127727	GENERIC_DAY	0	2	2011-12-19	2229	\N	3650	\N
127728	GENERIC_DAY	0	1	2011-06-17	2229	\N	3650	\N
127729	GENERIC_DAY	0	0	2010-08-28	2233	\N	3650	\N
127730	GENERIC_DAY	0	2	2012-02-13	2225	\N	3650	\N
127731	GENERIC_DAY	0	0	2011-02-25	2225	\N	3650	\N
127732	GENERIC_DAY	0	2	2010-09-17	2231	\N	3650	\N
127733	GENERIC_DAY	0	1	2011-06-09	2223	\N	3650	\N
127734	GENERIC_DAY	0	0	2011-09-24	2231	\N	3650	\N
127735	GENERIC_DAY	0	1	2011-12-29	2233	\N	3650	\N
127736	GENERIC_DAY	0	0	2011-05-27	2225	\N	3650	\N
127737	GENERIC_DAY	0	0	2010-12-12	2233	\N	3650	\N
127738	GENERIC_DAY	0	2	2011-05-05	2233	\N	3650	\N
127739	GENERIC_DAY	0	0	2011-01-23	2225	\N	3650	\N
127740	GENERIC_DAY	0	2	2010-08-11	2229	\N	3650	\N
127741	GENERIC_DAY	0	2	2010-10-15	2233	\N	3650	\N
127742	GENERIC_DAY	0	2	2012-02-02	2231	\N	3650	\N
127743	GENERIC_DAY	0	0	2011-07-17	2223	\N	3650	\N
127744	GENERIC_DAY	0	0	2011-05-10	2225	\N	3650	\N
127745	GENERIC_DAY	0	1	2012-02-03	2229	\N	3650	\N
127746	GENERIC_DAY	0	3	2010-10-27	2231	\N	3650	\N
127747	GENERIC_DAY	0	3	2011-03-29	2231	\N	3650	\N
127748	GENERIC_DAY	0	0	2011-05-07	2233	\N	3650	\N
127749	GENERIC_DAY	0	0	2011-05-08	2231	\N	3650	\N
127750	GENERIC_DAY	0	1	2011-01-27	2223	\N	3650	\N
127751	GENERIC_DAY	0	2	2011-05-12	2233	\N	3650	\N
127752	GENERIC_DAY	0	3	2011-04-18	2231	\N	3650	\N
127753	GENERIC_DAY	0	2	2011-09-12	2229	\N	3650	\N
127754	GENERIC_DAY	0	2	2011-12-19	2225	\N	3650	\N
127755	GENERIC_DAY	0	2	2011-09-29	2231	\N	3650	\N
127756	GENERIC_DAY	0	3	2011-04-07	2231	\N	3650	\N
127757	GENERIC_DAY	0	0	2011-03-12	2223	\N	3650	\N
127758	GENERIC_DAY	0	0	2012-02-11	2223	\N	3650	\N
127759	GENERIC_DAY	0	0	2010-12-06	2223	\N	3650	\N
127760	GENERIC_DAY	0	0	2011-07-03	2223	\N	3650	\N
127761	GENERIC_DAY	0	3	2010-08-23	2231	\N	3650	\N
127762	GENERIC_DAY	0	1	2011-03-30	2223	\N	3650	\N
127763	GENERIC_DAY	0	0	2011-01-29	2231	\N	3650	\N
127764	GENERIC_DAY	0	2	2010-09-10	2233	\N	3650	\N
127765	GENERIC_DAY	0	3	2010-10-13	2231	\N	3650	\N
127766	GENERIC_DAY	0	3	2010-09-09	2231	\N	3650	\N
127767	GENERIC_DAY	0	3	2011-01-25	2231	\N	3650	\N
127768	GENERIC_DAY	0	2	2011-09-12	2231	\N	3650	\N
127769	GENERIC_DAY	0	0	2011-08-20	2225	\N	3650	\N
127770	GENERIC_DAY	0	1	2011-12-02	2229	\N	3650	\N
127771	GENERIC_DAY	0	0	2010-12-08	2229	\N	3650	\N
127772	GENERIC_DAY	0	1	2011-10-25	2223	\N	3650	\N
127773	GENERIC_DAY	0	0	2010-11-21	2223	\N	3650	\N
127774	GENERIC_DAY	0	1	2011-07-08	2229	\N	3650	\N
127775	GENERIC_DAY	0	2	2012-02-08	2225	\N	3650	\N
127776	GENERIC_DAY	0	3	2011-06-21	2231	\N	3650	\N
127777	GENERIC_DAY	0	0	2012-01-28	2233	\N	3650	\N
127778	GENERIC_DAY	0	0	2010-08-29	2231	\N	3650	\N
127779	GENERIC_DAY	0	0	2010-10-14	2225	\N	3650	\N
127780	GENERIC_DAY	0	1	2011-11-01	2223	\N	3650	\N
127781	GENERIC_DAY	0	0	2010-10-30	2233	\N	3650	\N
127782	GENERIC_DAY	0	2	2010-08-17	2229	\N	3650	\N
127783	GENERIC_DAY	0	0	2010-08-17	2225	\N	3650	\N
127784	GENERIC_DAY	0	0	2010-08-21	2223	\N	3650	\N
127785	GENERIC_DAY	0	2	2012-01-05	2229	\N	3650	\N
127786	GENERIC_DAY	0	2	2010-11-16	2233	\N	3650	\N
127787	GENERIC_DAY	0	2	2012-01-18	2229	\N	3650	\N
127788	GENERIC_DAY	0	0	2011-11-05	2225	\N	3650	\N
127789	GENERIC_DAY	0	1	2011-09-16	2223	\N	3650	\N
127790	GENERIC_DAY	0	0	2010-10-02	2225	\N	3650	\N
127791	GENERIC_DAY	0	1	2012-01-13	2223	\N	3650	\N
127792	GENERIC_DAY	0	2	2010-10-22	2231	\N	3650	\N
127793	GENERIC_DAY	0	2	2011-09-07	2229	\N	3650	\N
127794	GENERIC_DAY	0	0	2011-07-21	2225	\N	3650	\N
127795	GENERIC_DAY	0	0	2010-08-28	2223	\N	3650	\N
127796	GENERIC_DAY	0	2	2010-08-23	2233	\N	3650	\N
127797	GENERIC_DAY	0	1	2011-10-26	2223	\N	3650	\N
127798	GENERIC_DAY	0	0	2012-02-12	2229	\N	3650	\N
127799	GENERIC_DAY	0	1	2010-11-12	2223	\N	3650	\N
127800	GENERIC_DAY	0	1	2011-10-24	2233	\N	3650	\N
127801	GENERIC_DAY	0	1	2012-01-05	2223	\N	3650	\N
127802	GENERIC_DAY	0	0	2010-11-07	2225	\N	3650	\N
127803	GENERIC_DAY	0	0	2011-01-15	2223	\N	3650	\N
127804	GENERIC_DAY	0	1	2011-04-07	2223	\N	3650	\N
127805	GENERIC_DAY	0	2	2011-02-14	2229	\N	3650	\N
127806	GENERIC_DAY	0	2	2011-04-12	2233	\N	3650	\N
127807	GENERIC_DAY	0	0	2011-05-28	2231	\N	3650	\N
127808	GENERIC_DAY	0	0	2010-08-20	2225	\N	3650	\N
127809	GENERIC_DAY	0	0	2010-11-14	2229	\N	3650	\N
127810	GENERIC_DAY	0	3	2010-11-18	2231	\N	3650	\N
127811	GENERIC_DAY	0	0	2011-04-02	2223	\N	3650	\N
127812	GENERIC_DAY	0	0	2012-01-21	2229	\N	3650	\N
127813	GENERIC_DAY	0	2	2011-08-22	2229	\N	3650	\N
127814	GENERIC_DAY	0	2	2010-08-27	2233	\N	3650	\N
127815	GENERIC_DAY	0	2	2010-08-16	2233	\N	3650	\N
127816	GENERIC_DAY	0	1	2011-08-05	2223	\N	3650	\N
127817	GENERIC_DAY	0	0	2010-10-12	2229	\N	3650	\N
127818	GENERIC_DAY	0	0	2010-09-30	2225	\N	3650	\N
127819	GENERIC_DAY	0	2	2011-10-26	2231	\N	3650	\N
127820	GENERIC_DAY	0	0	2011-04-25	2225	\N	3650	\N
127821	GENERIC_DAY	0	0	2011-08-01	2225	\N	3650	\N
127822	GENERIC_DAY	0	1	2011-04-12	2223	\N	3650	\N
127823	GENERIC_DAY	0	0	2012-01-08	2229	\N	3650	\N
127824	GENERIC_DAY	0	0	2011-03-26	2231	\N	3650	\N
127825	GENERIC_DAY	0	2	2011-02-09	2229	\N	3650	\N
127826	GENERIC_DAY	0	0	2011-06-10	2225	\N	3650	\N
127827	GENERIC_DAY	0	2	2011-08-10	2231	\N	3650	\N
127828	GENERIC_DAY	0	3	2011-04-14	2231	\N	3650	\N
127829	GENERIC_DAY	0	3	2010-08-19	2231	\N	3650	\N
127830	GENERIC_DAY	0	2	2011-10-06	2229	\N	3650	\N
127831	GENERIC_DAY	0	0	2011-09-03	2233	\N	3650	\N
127832	GENERIC_DAY	0	1	2012-01-25	2223	\N	3650	\N
127833	GENERIC_DAY	0	0	2011-04-23	2225	\N	3650	\N
127834	GENERIC_DAY	0	0	2010-09-12	2225	\N	3650	\N
127835	GENERIC_DAY	0	1	2011-05-27	2229	\N	3650	\N
127836	GENERIC_DAY	0	0	2010-11-16	2225	\N	3650	\N
127837	GENERIC_DAY	0	2	2010-10-08	2231	\N	3650	\N
127838	GENERIC_DAY	0	2	2011-04-21	2233	\N	3650	\N
127839	GENERIC_DAY	0	3	2011-02-09	2231	\N	3650	\N
127840	GENERIC_DAY	0	2	2010-09-03	2233	\N	3650	\N
127841	GENERIC_DAY	0	3	2011-06-01	2231	\N	3650	\N
127842	GENERIC_DAY	0	1	2011-03-22	2223	\N	3650	\N
127843	GENERIC_DAY	0	2	2011-10-20	2231	\N	3650	\N
127844	GENERIC_DAY	0	2	2011-11-07	2231	\N	3650	\N
127845	GENERIC_DAY	0	0	2011-09-04	2225	\N	3650	\N
127846	GENERIC_DAY	0	2	2011-05-11	2229	\N	3650	\N
127847	GENERIC_DAY	0	2	2011-07-07	2233	\N	3650	\N
127848	GENERIC_DAY	0	0	2011-02-13	2233	\N	3650	\N
127849	GENERIC_DAY	0	3	2010-11-02	2231	\N	3650	\N
127850	GENERIC_DAY	0	1	2011-02-03	2223	\N	3650	\N
127851	GENERIC_DAY	0	1	2011-11-14	2223	\N	3650	\N
127852	GENERIC_DAY	0	1	2011-12-06	2233	\N	3650	\N
127853	GENERIC_DAY	0	1	2012-02-10	2229	\N	3650	\N
127854	GENERIC_DAY	0	1	2011-10-18	2223	\N	3650	\N
127855	GENERIC_DAY	0	1	2012-02-07	2233	\N	3650	\N
127856	GENERIC_DAY	0	2	2011-06-16	2229	\N	3650	\N
127857	GENERIC_DAY	0	2	2011-11-28	2225	\N	3650	\N
127858	GENERIC_DAY	0	0	2011-10-29	2231	\N	3650	\N
127859	GENERIC_DAY	0	0	2011-11-05	2229	\N	3650	\N
127860	GENERIC_DAY	0	1	2011-11-09	2223	\N	3650	\N
127861	GENERIC_DAY	0	0	2011-06-12	2225	\N	3650	\N
127862	GENERIC_DAY	0	3	2011-06-07	2231	\N	3650	\N
127863	GENERIC_DAY	0	1	2011-11-24	2223	\N	3650	\N
127864	GENERIC_DAY	0	1	2011-05-25	2223	\N	3650	\N
127865	GENERIC_DAY	0	1	2011-09-08	2223	\N	3650	\N
127866	GENERIC_DAY	0	1	2010-12-09	2223	\N	3650	\N
127867	GENERIC_DAY	0	0	2011-04-23	2233	\N	3650	\N
127868	GENERIC_DAY	0	0	2010-09-08	2225	\N	3650	\N
127869	GENERIC_DAY	0	0	2010-10-21	2225	\N	3650	\N
127870	GENERIC_DAY	0	1	2010-09-20	2223	\N	3650	\N
127871	GENERIC_DAY	0	1	2011-05-05	2223	\N	3650	\N
127872	GENERIC_DAY	0	2	2012-02-14	2225	\N	3650	\N
127873	GENERIC_DAY	0	3	2010-11-22	2231	\N	3650	\N
127874	GENERIC_DAY	0	2	2011-09-06	2231	\N	3650	\N
127875	GENERIC_DAY	0	0	2012-02-19	2223	\N	3650	\N
127876	GENERIC_DAY	0	1	2010-09-28	2223	\N	3650	\N
127877	GENERIC_DAY	0	3	2010-11-25	2231	\N	3650	\N
127878	GENERIC_DAY	0	0	2011-04-01	2225	\N	3650	\N
127879	GENERIC_DAY	0	2	2011-02-28	2229	\N	3650	\N
127880	GENERIC_DAY	0	3	2011-01-10	2231	\N	3650	\N
127881	GENERIC_DAY	0	0	2010-11-26	2225	\N	3650	\N
127882	GENERIC_DAY	0	0	2011-12-24	2233	\N	3650	\N
127883	GENERIC_DAY	0	2	2011-11-17	2225	\N	3650	\N
127884	GENERIC_DAY	0	0	2010-09-02	2225	\N	3650	\N
127885	GENERIC_DAY	0	1	2011-10-14	2229	\N	3650	\N
127886	GENERIC_DAY	0	0	2011-10-29	2233	\N	3650	\N
127887	GENERIC_DAY	0	1	2011-01-21	2223	\N	3650	\N
127888	GENERIC_DAY	0	0	2010-08-22	2223	\N	3650	\N
127889	GENERIC_DAY	0	0	2011-02-26	2231	\N	3650	\N
127890	GENERIC_DAY	0	2	2011-07-11	2231	\N	3650	\N
127891	GENERIC_DAY	0	2	2010-10-27	2229	\N	3650	\N
127892	GENERIC_DAY	0	3	2010-10-25	2231	\N	3650	\N
127893	GENERIC_DAY	0	1	2010-11-26	2229	\N	3650	\N
127894	GENERIC_DAY	0	2	2011-07-12	2231	\N	3650	\N
127895	GENERIC_DAY	0	1	2010-12-10	2229	\N	3650	\N
127896	GENERIC_DAY	0	2	2011-10-27	2225	\N	3650	\N
127897	GENERIC_DAY	0	1	2011-12-19	2223	\N	3650	\N
127898	GENERIC_DAY	0	0	2011-09-10	2231	\N	3650	\N
127899	GENERIC_DAY	0	0	2010-10-09	2225	\N	3650	\N
127900	GENERIC_DAY	0	2	2011-10-18	2229	\N	3650	\N
127901	GENERIC_DAY	0	1	2011-11-11	2229	\N	3650	\N
127902	GENERIC_DAY	0	0	2011-08-07	2231	\N	3650	\N
127903	GENERIC_DAY	0	2	2010-11-26	2231	\N	3650	\N
127904	GENERIC_DAY	0	1	2010-12-14	2223	\N	3650	\N
127905	GENERIC_DAY	0	2	2012-02-17	2231	\N	3650	\N
127906	GENERIC_DAY	0	2	2010-11-15	2229	\N	3650	\N
127907	GENERIC_DAY	0	3	2011-04-26	2231	\N	3650	\N
127908	GENERIC_DAY	0	0	2010-09-11	2229	\N	3650	\N
127909	GENERIC_DAY	0	1	2010-12-24	2223	\N	3650	\N
127910	GENERIC_DAY	0	1	2011-01-28	2223	\N	3650	\N
127911	GENERIC_DAY	0	0	2010-10-24	2231	\N	3650	\N
127912	GENERIC_DAY	0	1	2010-09-16	2223	\N	3650	\N
127913	GENERIC_DAY	0	2	2010-08-24	2233	\N	3650	\N
127914	GENERIC_DAY	0	2	2010-12-21	2233	\N	3650	\N
127915	GENERIC_DAY	0	2	2011-07-26	2233	\N	3650	\N
127916	GENERIC_DAY	0	3	2011-04-04	2231	\N	3650	\N
127917	GENERIC_DAY	0	0	2011-10-22	2223	\N	3650	\N
127918	GENERIC_DAY	0	2	2012-01-09	2225	\N	3650	\N
127919	GENERIC_DAY	0	1	2011-12-23	2233	\N	3650	\N
127920	GENERIC_DAY	0	0	2011-05-29	2229	\N	3650	\N
127921	GENERIC_DAY	0	0	2010-10-05	2225	\N	3650	\N
127922	GENERIC_DAY	0	0	2012-01-14	2225	\N	3650	\N
127923	GENERIC_DAY	0	1	2011-04-05	2223	\N	3650	\N
127924	GENERIC_DAY	0	0	2010-12-04	2233	\N	3650	\N
127925	GENERIC_DAY	0	0	2011-10-01	2223	\N	3650	\N
127926	GENERIC_DAY	0	3	2011-04-25	2231	\N	3650	\N
127927	GENERIC_DAY	0	0	2010-11-13	2233	\N	3650	\N
127928	GENERIC_DAY	0	0	2011-02-27	2231	\N	3650	\N
127929	GENERIC_DAY	0	1	2011-09-06	2233	\N	3650	\N
127930	GENERIC_DAY	0	1	2010-08-30	2223	\N	3650	\N
127931	GENERIC_DAY	0	2	2011-08-25	2229	\N	3650	\N
127932	GENERIC_DAY	0	0	2012-01-22	2223	\N	3650	\N
127933	GENERIC_DAY	0	3	2010-09-28	2231	\N	3650	\N
127934	GENERIC_DAY	0	1	2011-12-12	2233	\N	3650	\N
127935	GENERIC_DAY	0	2	2011-08-08	2229	\N	3650	\N
127936	GENERIC_DAY	0	2	2011-11-30	2231	\N	3650	\N
127937	GENERIC_DAY	0	1	2011-10-07	2223	\N	3650	\N
127938	GENERIC_DAY	0	3	2011-01-11	2231	\N	3650	\N
127939	GENERIC_DAY	0	0	2011-12-03	2229	\N	3650	\N
127940	GENERIC_DAY	0	1	2011-07-06	2223	\N	3650	\N
127941	GENERIC_DAY	0	0	2011-02-20	2229	\N	3650	\N
127942	GENERIC_DAY	0	3	2010-08-16	2231	\N	3650	\N
127943	GENERIC_DAY	0	2	2011-04-22	2233	\N	3650	\N
127944	GENERIC_DAY	0	2	2011-02-03	2229	\N	3650	\N
127945	GENERIC_DAY	0	2	2011-12-16	2231	\N	3650	\N
127946	GENERIC_DAY	0	1	2010-09-03	2223	\N	3650	\N
127947	GENERIC_DAY	0	2	2012-01-30	2231	\N	3650	\N
127948	GENERIC_DAY	0	0	2011-07-29	2225	\N	3650	\N
127949	GENERIC_DAY	0	2	2011-01-19	2229	\N	3650	\N
127950	GENERIC_DAY	0	0	2010-12-11	2223	\N	3650	\N
127951	GENERIC_DAY	0	2	2011-04-19	2229	\N	3650	\N
127952	GENERIC_DAY	0	0	2011-03-14	2225	\N	3650	\N
127953	GENERIC_DAY	0	0	2010-09-17	2225	\N	3650	\N
127954	GENERIC_DAY	0	0	2011-07-10	2223	\N	3650	\N
127955	GENERIC_DAY	0	0	2011-07-31	2229	\N	3650	\N
127956	GENERIC_DAY	0	0	2011-01-16	2229	\N	3650	\N
127957	GENERIC_DAY	0	1	2011-12-15	2223	\N	3650	\N
127958	GENERIC_DAY	0	1	2011-10-10	2223	\N	3650	\N
127959	GENERIC_DAY	0	1	2011-01-07	2223	\N	3650	\N
127960	GENERIC_DAY	0	0	2012-01-08	2233	\N	3650	\N
127961	GENERIC_DAY	0	1	2012-01-04	2223	\N	3650	\N
127962	GENERIC_DAY	0	2	2010-10-20	2229	\N	3650	\N
127963	GENERIC_DAY	0	0	2011-10-09	2229	\N	3650	\N
127964	GENERIC_DAY	0	2	2011-06-22	2233	\N	3650	\N
127965	GENERIC_DAY	0	1	2010-08-11	2223	\N	3650	\N
127966	GENERIC_DAY	0	0	2010-08-16	2225	\N	3650	\N
127967	GENERIC_DAY	0	2	2011-06-06	2229	\N	3650	\N
127968	GENERIC_DAY	0	2	2011-03-09	2233	\N	3650	\N
127969	GENERIC_DAY	0	0	2011-06-12	2233	\N	3650	\N
127970	GENERIC_DAY	0	1	2011-10-28	2223	\N	3650	\N
127971	GENERIC_DAY	0	2	2011-08-03	2231	\N	3650	\N
127972	GENERIC_DAY	0	2	2011-08-05	2231	\N	3650	\N
127973	GENERIC_DAY	0	0	2010-09-12	2223	\N	3650	\N
127974	GENERIC_DAY	0	0	2010-12-26	2225	\N	3650	\N
127975	GENERIC_DAY	0	0	2011-11-19	2223	\N	3650	\N
127976	GENERIC_DAY	0	2	2011-06-03	2231	\N	3650	\N
127977	GENERIC_DAY	0	0	2011-05-07	2231	\N	3650	\N
127978	GENERIC_DAY	0	2	2011-01-18	2233	\N	3650	\N
127979	GENERIC_DAY	0	2	2011-12-07	2225	\N	3650	\N
127980	GENERIC_DAY	0	2	2011-08-15	2231	\N	3650	\N
127981	GENERIC_DAY	0	1	2011-08-19	2229	\N	3650	\N
127982	GENERIC_DAY	0	0	2011-02-19	2225	\N	3650	\N
127983	GENERIC_DAY	0	2	2012-01-09	2231	\N	3650	\N
127984	GENERIC_DAY	0	0	2010-12-06	2225	\N	3650	\N
127985	GENERIC_DAY	0	2	2010-12-23	2229	\N	3650	\N
127986	GENERIC_DAY	0	2	2012-01-02	2225	\N	3650	\N
127987	GENERIC_DAY	0	2	2012-02-13	2229	\N	3650	\N
127988	GENERIC_DAY	0	2	2012-01-11	2225	\N	3650	\N
127989	GENERIC_DAY	0	1	2010-11-15	2223	\N	3650	\N
127990	GENERIC_DAY	0	0	2011-07-24	2231	\N	3650	\N
127991	GENERIC_DAY	0	0	2011-09-10	2233	\N	3650	\N
127992	GENERIC_DAY	0	0	2011-09-25	2233	\N	3650	\N
127993	GENERIC_DAY	0	2	2010-12-30	2229	\N	3650	\N
127994	GENERIC_DAY	0	2	2011-10-31	2231	\N	3650	\N
127995	GENERIC_DAY	0	2	2011-09-21	2229	\N	3650	\N
127996	GENERIC_DAY	0	2	2011-02-24	2233	\N	3650	\N
127997	GENERIC_DAY	0	0	2011-10-22	2233	\N	3650	\N
127998	GENERIC_DAY	0	0	2010-12-18	2225	\N	3650	\N
127999	GENERIC_DAY	0	2	2011-10-31	2225	\N	3650	\N
128000	GENERIC_DAY	0	0	2012-01-15	2229	\N	3650	\N
128001	GENERIC_DAY	0	2	2011-02-04	2233	\N	3650	\N
128002	GENERIC_DAY	0	2	2011-05-26	2229	\N	3650	\N
128003	GENERIC_DAY	0	0	2010-12-14	2225	\N	3650	\N
128004	GENERIC_DAY	0	0	2010-11-07	2229	\N	3650	\N
128005	GENERIC_DAY	0	2	2011-08-10	2233	\N	3650	\N
128006	GENERIC_DAY	0	0	2010-11-12	2225	\N	3650	\N
128007	GENERIC_DAY	0	2	2011-06-10	2233	\N	3650	\N
128008	GENERIC_DAY	0	0	2010-10-26	2225	\N	3650	\N
128009	GENERIC_DAY	0	1	2010-10-15	2229	\N	3650	\N
128010	GENERIC_DAY	0	2	2011-05-04	2233	\N	3650	\N
128011	GENERIC_DAY	0	2	2012-01-31	2229	\N	3650	\N
128012	GENERIC_DAY	0	1	2010-11-26	2223	\N	3650	\N
128013	GENERIC_DAY	0	2	2011-07-22	2229	\N	3650	\N
128014	GENERIC_DAY	0	2	2012-02-07	2225	\N	3650	\N
128015	GENERIC_DAY	0	2	2011-01-14	2231	\N	3650	\N
128016	GENERIC_DAY	0	2	2010-12-31	2233	\N	3650	\N
128017	GENERIC_DAY	0	3	2010-09-15	2231	\N	3650	\N
128018	GENERIC_DAY	0	2	2010-09-08	2229	\N	3650	\N
128019	GENERIC_DAY	0	0	2011-05-13	2225	\N	3650	\N
128020	GENERIC_DAY	0	0	2011-07-18	2225	\N	3650	\N
128021	GENERIC_DAY	0	0	2010-09-23	2225	\N	3650	\N
128022	GENERIC_DAY	0	2	2011-02-18	2231	\N	3650	\N
128023	GENERIC_DAY	0	2	2011-02-28	2233	\N	3650	\N
128024	GENERIC_DAY	0	1	2011-04-01	2229	\N	3650	\N
128025	GENERIC_DAY	0	2	2010-09-29	2229	\N	3650	\N
128026	GENERIC_DAY	0	2	2011-05-11	2233	\N	3650	\N
128027	GENERIC_DAY	0	0	2012-02-18	2233	\N	3650	\N
128028	GENERIC_DAY	0	2	2011-05-23	2233	\N	3650	\N
128029	GENERIC_DAY	0	1	2011-01-20	2223	\N	3650	\N
128030	GENERIC_DAY	0	0	2011-12-04	2223	\N	3650	\N
128031	GENERIC_DAY	0	2	2011-07-15	2229	\N	3650	\N
128032	GENERIC_DAY	0	0	2011-03-05	2223	\N	3650	\N
128033	GENERIC_DAY	0	2	2011-10-26	2229	\N	3650	\N
128034	GENERIC_DAY	0	2	2010-11-12	2233	\N	3650	\N
128035	GENERIC_DAY	0	0	2010-09-05	2229	\N	3650	\N
128036	GENERIC_DAY	0	0	2011-07-23	2233	\N	3650	\N
128037	GENERIC_DAY	0	1	2011-12-16	2229	\N	3650	\N
128038	GENERIC_DAY	0	2	2011-10-05	2231	\N	3650	\N
128039	GENERIC_DAY	0	2	2011-01-20	2229	\N	3650	\N
128040	GENERIC_DAY	0	2	2011-09-19	2225	\N	3650	\N
128041	GENERIC_DAY	0	0	2011-11-06	2225	\N	3650	\N
128042	GENERIC_DAY	0	2	2011-06-13	2233	\N	3650	\N
128043	GENERIC_DAY	0	2	2011-07-14	2223	\N	3650	\N
128044	GENERIC_DAY	0	2	2010-12-30	2233	\N	3650	\N
128045	GENERIC_DAY	0	2	2011-09-27	2229	\N	3650	\N
128046	GENERIC_DAY	0	1	2011-02-25	2229	\N	3650	\N
128047	GENERIC_DAY	0	0	2011-11-13	2233	\N	3650	\N
128048	GENERIC_DAY	0	1	2011-01-25	2223	\N	3650	\N
128049	GENERIC_DAY	0	1	2011-05-09	2223	\N	3650	\N
128050	GENERIC_DAY	0	0	2011-05-23	2225	\N	3650	\N
128051	GENERIC_DAY	0	1	2012-01-16	2233	\N	3650	\N
128052	GENERIC_DAY	0	2	2011-06-09	2233	\N	3650	\N
128053	GENERIC_DAY	0	1	2010-10-06	2223	\N	3650	\N
128054	GENERIC_DAY	0	2	2011-07-19	2223	\N	3650	\N
128055	GENERIC_DAY	0	1	2011-09-07	2223	\N	3650	\N
128056	GENERIC_DAY	0	3	2010-10-05	2231	\N	3650	\N
128057	GENERIC_DAY	0	1	2011-12-09	2225	\N	3650	\N
128058	GENERIC_DAY	0	2	2011-03-28	2233	\N	3650	\N
128059	GENERIC_DAY	0	2	2010-11-23	2233	\N	3650	\N
128060	GENERIC_DAY	0	2	2012-02-07	2231	\N	3650	\N
128061	GENERIC_DAY	0	2	2011-03-18	2231	\N	3650	\N
128062	GENERIC_DAY	0	0	2011-07-11	2225	\N	3650	\N
128063	GENERIC_DAY	0	3	2010-10-11	2231	\N	3650	\N
128064	GENERIC_DAY	0	0	2011-02-08	2225	\N	3650	\N
128065	GENERIC_DAY	0	1	2011-10-05	2223	\N	3650	\N
128066	GENERIC_DAY	0	2	2011-03-17	2229	\N	3650	\N
128067	GENERIC_DAY	0	2	2011-07-11	2233	\N	3650	\N
128068	GENERIC_DAY	0	0	2011-07-10	2231	\N	3650	\N
128069	GENERIC_DAY	0	1	2011-09-28	2223	\N	3650	\N
128070	GENERIC_DAY	0	1	2010-10-29	2229	\N	3650	\N
128071	GENERIC_DAY	0	1	2010-08-20	2223	\N	3650	\N
128072	GENERIC_DAY	0	0	2010-11-15	2225	\N	3650	\N
128073	GENERIC_DAY	0	3	2011-06-28	2231	\N	3650	\N
128074	GENERIC_DAY	0	0	2011-12-24	2223	\N	3650	\N
128075	GENERIC_DAY	0	0	2010-11-06	2229	\N	3650	\N
128076	GENERIC_DAY	0	2	2011-10-10	2225	\N	3650	\N
128077	GENERIC_DAY	0	1	2011-05-02	2223	\N	3650	\N
128078	GENERIC_DAY	0	2	2012-01-25	2225	\N	3650	\N
128079	GENERIC_DAY	0	0	2011-06-22	2225	\N	3650	\N
128080	GENERIC_DAY	0	2	2012-01-24	2231	\N	3650	\N
128081	GENERIC_DAY	0	0	2011-02-11	2225	\N	3650	\N
128082	GENERIC_DAY	0	2	2011-01-27	2229	\N	3650	\N
128083	GENERIC_DAY	0	0	2010-08-14	2231	\N	3650	\N
128084	GENERIC_DAY	0	1	2012-01-12	2223	\N	3650	\N
128085	GENERIC_DAY	0	0	2011-04-16	2229	\N	3650	\N
128086	GENERIC_DAY	0	0	2010-10-27	2225	\N	3650	\N
128087	GENERIC_DAY	0	2	2011-05-19	2229	\N	3650	\N
128088	GENERIC_DAY	0	0	2011-04-02	2233	\N	3650	\N
128089	GENERIC_DAY	0	0	2012-01-01	2231	\N	3650	\N
128090	GENERIC_DAY	0	2	2011-01-05	2233	\N	3650	\N
128091	GENERIC_DAY	0	1	2012-01-27	2229	\N	3650	\N
128092	GENERIC_DAY	0	1	2011-03-24	2223	\N	3650	\N
128093	GENERIC_DAY	0	0	2011-09-24	2223	\N	3650	\N
128094	GENERIC_DAY	0	0	2010-10-03	2229	\N	3650	\N
128095	GENERIC_DAY	0	2	2012-01-04	2231	\N	3650	\N
128096	GENERIC_DAY	0	1	2012-01-13	2225	\N	3650	\N
128097	GENERIC_DAY	0	1	2011-12-28	2233	\N	3650	\N
128098	GENERIC_DAY	0	2	2011-05-03	2233	\N	3650	\N
128099	GENERIC_DAY	0	0	2012-01-28	2229	\N	3650	\N
128100	GENERIC_DAY	0	2	2011-06-20	2229	\N	3650	\N
128101	GENERIC_DAY	0	2	2011-01-03	2229	\N	3650	\N
128102	GENERIC_DAY	0	1	2012-01-26	2223	\N	3650	\N
128103	GENERIC_DAY	0	3	2011-01-12	2231	\N	3650	\N
128104	GENERIC_DAY	0	2	2011-06-14	2233	\N	3650	\N
128105	GENERIC_DAY	0	0	2011-04-21	2225	\N	3650	\N
128106	GENERIC_DAY	0	0	2011-05-19	2225	\N	3650	\N
128107	GENERIC_DAY	0	0	2010-11-14	2231	\N	3650	\N
128108	GENERIC_DAY	0	2	2010-09-24	2233	\N	3650	\N
128109	GENERIC_DAY	0	2	2011-07-01	2231	\N	3650	\N
128110	GENERIC_DAY	0	1	2010-11-05	2223	\N	3650	\N
128111	GENERIC_DAY	0	2	2011-04-15	2233	\N	3650	\N
128112	GENERIC_DAY	0	1	2011-02-17	2223	\N	3650	\N
128113	GENERIC_DAY	0	3	2010-08-11	2231	\N	3650	\N
128114	GENERIC_DAY	0	0	2012-02-04	2225	\N	3650	\N
128115	GENERIC_DAY	0	3	2011-05-25	2231	\N	3650	\N
128116	GENERIC_DAY	0	2	2011-09-01	2229	\N	3650	\N
128117	GENERIC_DAY	0	0	2011-02-16	2225	\N	3650	\N
128118	GENERIC_DAY	0	1	2012-02-02	2223	\N	3650	\N
128119	GENERIC_DAY	0	2	2011-11-30	2229	\N	3650	\N
128120	GENERIC_DAY	0	1	2011-10-28	2233	\N	3650	\N
128121	GENERIC_DAY	0	0	2010-11-27	2225	\N	3650	\N
128122	GENERIC_DAY	0	0	2011-11-13	2231	\N	3650	\N
128123	GENERIC_DAY	0	0	2011-06-03	2225	\N	3650	\N
128124	GENERIC_DAY	0	2	2012-01-11	2229	\N	3650	\N
128125	GENERIC_DAY	0	2	2011-04-26	2229	\N	3650	\N
128126	GENERIC_DAY	0	2	2011-11-22	2231	\N	3650	\N
128127	GENERIC_DAY	0	0	2011-01-22	2225	\N	3650	\N
128128	GENERIC_DAY	0	3	2011-05-23	2231	\N	3650	\N
128129	GENERIC_DAY	0	2	2011-09-22	2231	\N	3650	\N
128130	GENERIC_DAY	0	0	2011-03-22	2225	\N	3650	\N
128131	GENERIC_DAY	0	2	2011-03-14	2233	\N	3650	\N
128132	GENERIC_DAY	0	2	2011-11-29	2229	\N	3650	\N
128133	GENERIC_DAY	0	1	2011-02-11	2229	\N	3650	\N
128134	GENERIC_DAY	0	3	2011-06-27	2231	\N	3650	\N
128135	GENERIC_DAY	0	2	2011-03-17	2233	\N	3650	\N
128136	GENERIC_DAY	0	0	2011-04-23	2223	\N	3650	\N
128137	GENERIC_DAY	0	0	2011-10-15	2233	\N	3650	\N
128138	GENERIC_DAY	0	0	2011-08-28	2223	\N	3650	\N
128139	GENERIC_DAY	0	0	2012-01-14	2231	\N	3650	\N
128140	GENERIC_DAY	0	1	2011-01-28	2229	\N	3650	\N
128141	GENERIC_DAY	0	0	2010-11-13	2225	\N	3650	\N
128142	GENERIC_DAY	0	0	2010-10-16	2225	\N	3650	\N
128143	GENERIC_DAY	0	1	2011-02-11	2223	\N	3650	\N
128144	GENERIC_DAY	0	0	2010-12-25	2233	\N	3650	\N
128145	GENERIC_DAY	0	1	2011-02-21	2223	\N	3650	\N
128146	GENERIC_DAY	0	0	2010-10-01	2225	\N	3650	\N
128147	GENERIC_DAY	0	2	2011-12-05	2229	\N	3650	\N
128148	GENERIC_DAY	0	0	2011-09-24	2233	\N	3650	\N
128149	GENERIC_DAY	0	0	2011-04-17	2233	\N	3650	\N
128150	GENERIC_DAY	0	2	2011-12-06	2231	\N	3650	\N
128151	GENERIC_DAY	0	1	2011-09-16	2229	\N	3650	\N
128152	GENERIC_DAY	0	2	2011-12-07	2231	\N	3650	\N
128153	GENERIC_DAY	0	0	2011-08-27	2233	\N	3650	\N
128154	GENERIC_DAY	0	3	2010-11-08	2231	\N	3650	\N
128155	GENERIC_DAY	0	2	2011-11-28	2231	\N	3650	\N
128156	GENERIC_DAY	0	1	2011-11-29	2233	\N	3650	\N
128157	GENERIC_DAY	0	2	2011-06-30	2229	\N	3650	\N
128158	GENERIC_DAY	0	3	2010-11-23	2231	\N	3650	\N
128159	GENERIC_DAY	0	2	2011-04-11	2229	\N	3650	\N
128160	GENERIC_DAY	0	1	2012-01-31	2233	\N	3650	\N
128161	GENERIC_DAY	0	0	2010-12-26	2233	\N	3650	\N
128162	GENERIC_DAY	0	2	2010-08-27	2231	\N	3650	\N
128163	GENERIC_DAY	0	0	2011-10-16	2233	\N	3650	\N
128164	GENERIC_DAY	0	0	2011-07-17	2225	\N	3650	\N
128165	GENERIC_DAY	0	2	2011-07-08	2231	\N	3650	\N
128166	GENERIC_DAY	0	0	2012-01-01	2229	\N	3650	\N
128167	GENERIC_DAY	0	2	2011-04-27	2229	\N	3650	\N
128168	GENERIC_DAY	0	0	2011-11-06	2231	\N	3650	\N
128169	GENERIC_DAY	0	1	2011-04-18	2223	\N	3650	\N
128170	GENERIC_DAY	0	0	2010-10-09	2229	\N	3650	\N
128171	GENERIC_DAY	0	0	2011-07-26	2225	\N	3650	\N
128172	GENERIC_DAY	0	1	2010-12-16	2223	\N	3650	\N
128173	GENERIC_DAY	0	3	2010-12-09	2231	\N	3650	\N
128174	GENERIC_DAY	0	0	2011-07-13	2225	\N	3650	\N
128175	GENERIC_DAY	0	1	2011-10-07	2225	\N	3650	\N
128176	GENERIC_DAY	0	2	2011-04-05	2229	\N	3650	\N
128177	GENERIC_DAY	0	0	2011-10-22	2229	\N	3650	\N
128178	GENERIC_DAY	0	2	2011-06-08	2229	\N	3650	\N
128179	GENERIC_DAY	0	0	2011-04-14	2225	\N	3650	\N
128180	GENERIC_DAY	0	2	2011-05-06	2231	\N	3650	\N
128181	GENERIC_DAY	0	0	2011-03-10	2225	\N	3650	\N
128182	GENERIC_DAY	0	2	2012-02-16	2229	\N	3650	\N
128183	GENERIC_DAY	0	2	2011-10-19	2231	\N	3650	\N
128184	GENERIC_DAY	0	0	2011-06-18	2223	\N	3650	\N
128185	GENERIC_DAY	0	3	2011-04-21	2231	\N	3650	\N
128186	GENERIC_DAY	0	2	2011-12-08	2229	\N	3650	\N
128187	GENERIC_DAY	0	2	2011-08-11	2231	\N	3650	\N
128188	GENERIC_DAY	0	1	2011-10-27	2233	\N	3650	\N
128189	GENERIC_DAY	0	3	2011-04-06	2231	\N	3650	\N
128190	GENERIC_DAY	0	2	2012-02-20	2231	\N	3650	\N
128191	GENERIC_DAY	0	3	2010-12-23	2231	\N	3650	\N
128192	GENERIC_DAY	0	0	2010-11-01	2233	\N	3650	\N
128193	GENERIC_DAY	0	1	2011-12-23	2225	\N	3650	\N
128194	GENERIC_DAY	0	0	2011-10-08	2231	\N	3650	\N
128195	GENERIC_DAY	0	2	2011-02-07	2229	\N	3650	\N
128196	GENERIC_DAY	0	2	2011-12-20	2231	\N	3650	\N
128197	GENERIC_DAY	0	3	2011-02-07	2231	\N	3650	\N
128198	GENERIC_DAY	0	0	2010-09-09	2225	\N	3650	\N
128199	GENERIC_DAY	0	2	2011-09-13	2225	\N	3650	\N
128200	GENERIC_DAY	0	1	2010-09-10	2229	\N	3650	\N
128201	GENERIC_DAY	0	2	2011-06-03	2233	\N	3650	\N
128202	GENERIC_DAY	0	0	2010-12-26	2229	\N	3650	\N
128203	GENERIC_DAY	0	1	2011-08-24	2223	\N	3650	\N
128204	GENERIC_DAY	0	0	2010-08-15	2233	\N	3650	\N
128205	GENERIC_DAY	0	0	2011-08-13	2225	\N	3650	\N
128206	GENERIC_DAY	0	0	2010-10-17	2229	\N	3650	\N
128207	GENERIC_DAY	0	2	2010-11-22	2233	\N	3650	\N
128208	GENERIC_DAY	0	0	2011-08-06	2225	\N	3650	\N
128209	GENERIC_DAY	0	1	2011-01-24	2223	\N	3650	\N
128210	GENERIC_DAY	0	2	2011-11-01	2225	\N	3650	\N
128211	GENERIC_DAY	0	1	2012-02-10	2233	\N	3650	\N
128212	GENERIC_DAY	0	1	2011-09-19	2233	\N	3650	\N
128213	GENERIC_DAY	0	2	2011-08-17	2229	\N	3650	\N
128214	GENERIC_DAY	0	0	2010-12-29	2225	\N	3650	\N
128215	GENERIC_DAY	0	0	2011-12-11	2231	\N	3650	\N
128216	GENERIC_DAY	0	0	2010-10-06	2225	\N	3650	\N
128217	GENERIC_DAY	0	2	2012-01-31	2225	\N	3650	\N
128218	GENERIC_DAY	0	1	2011-08-25	2233	\N	3650	\N
128219	GENERIC_DAY	0	2	2011-03-16	2229	\N	3650	\N
128220	GENERIC_DAY	0	1	2011-10-17	2223	\N	3650	\N
128221	GENERIC_DAY	0	1	2010-09-09	2223	\N	3650	\N
128222	GENERIC_DAY	0	0	2012-02-19	2231	\N	3650	\N
128223	GENERIC_DAY	0	0	2010-10-15	2225	\N	3650	\N
128224	GENERIC_DAY	0	0	2010-09-04	2231	\N	3650	\N
128225	GENERIC_DAY	0	1	2010-08-16	2223	\N	3650	\N
128226	GENERIC_DAY	0	2	2011-06-01	2229	\N	3650	\N
128227	GENERIC_DAY	0	1	2011-06-29	2223	\N	3650	\N
128228	GENERIC_DAY	0	1	2011-06-24	2223	\N	3650	\N
128229	GENERIC_DAY	0	1	2012-01-27	2233	\N	3650	\N
128230	GENERIC_DAY	0	0	2010-12-01	2225	\N	3650	\N
128231	GENERIC_DAY	0	2	2011-07-26	2229	\N	3650	\N
128232	GENERIC_DAY	0	0	2012-02-18	2223	\N	3650	\N
128233	GENERIC_DAY	0	2	2012-02-03	2231	\N	3650	\N
128234	GENERIC_DAY	0	2	2011-07-06	2233	\N	3650	\N
128235	GENERIC_DAY	0	1	2011-12-16	2223	\N	3650	\N
128236	GENERIC_DAY	0	2	2011-07-18	2229	\N	3650	\N
128237	GENERIC_DAY	0	0	2010-12-27	2225	\N	3650	\N
128238	GENERIC_DAY	0	0	2010-10-12	2223	\N	3650	\N
128239	GENERIC_DAY	0	0	2010-10-16	2229	\N	3650	\N
128240	GENERIC_DAY	0	2	2011-10-20	2229	\N	3650	\N
128241	GENERIC_DAY	0	0	2011-04-17	2231	\N	3650	\N
128242	GENERIC_DAY	0	1	2010-10-04	2223	\N	3650	\N
128243	GENERIC_DAY	0	2	2011-07-18	2233	\N	3650	\N
128244	GENERIC_DAY	0	0	2011-04-30	2225	\N	3650	\N
128245	GENERIC_DAY	0	0	2011-02-03	2225	\N	3650	\N
128246	GENERIC_DAY	0	1	2011-10-14	2225	\N	3650	\N
128247	GENERIC_DAY	0	0	2010-12-19	2231	\N	3650	\N
128248	GENERIC_DAY	0	3	2011-02-15	2231	\N	3650	\N
128249	GENERIC_DAY	0	0	2010-11-21	2233	\N	3650	\N
128250	GENERIC_DAY	0	1	2012-01-04	2233	\N	3650	\N
128251	GENERIC_DAY	0	2	2010-10-21	2229	\N	3650	\N
128252	GENERIC_DAY	0	2	2011-06-15	2233	\N	3650	\N
128253	GENERIC_DAY	0	1	2011-03-29	2223	\N	3650	\N
128254	GENERIC_DAY	0	0	2011-04-09	2233	\N	3650	\N
128255	GENERIC_DAY	0	2	2011-01-13	2233	\N	3650	\N
128256	GENERIC_DAY	0	0	2011-12-18	2225	\N	3650	\N
128257	GENERIC_DAY	0	1	2011-11-15	2223	\N	3650	\N
128258	GENERIC_DAY	0	2	2011-03-04	2233	\N	3650	\N
128259	GENERIC_DAY	0	0	2010-10-08	2225	\N	3650	\N
128260	GENERIC_DAY	0	0	2011-11-12	2231	\N	3650	\N
128261	GENERIC_DAY	0	0	2011-02-20	2223	\N	3650	\N
128262	GENERIC_DAY	0	3	2010-09-27	2231	\N	3650	\N
128263	GENERIC_DAY	0	1	2011-10-14	2233	\N	3650	\N
128264	GENERIC_DAY	0	1	2011-10-03	2233	\N	3650	\N
128265	GENERIC_DAY	0	1	2011-08-18	2233	\N	3650	\N
128266	GENERIC_DAY	0	1	2011-11-08	2233	\N	3650	\N
128267	GENERIC_DAY	0	0	2010-09-12	2229	\N	3650	\N
128268	GENERIC_DAY	0	0	2011-01-08	2233	\N	3650	\N
128269	GENERIC_DAY	0	2	2011-12-01	2229	\N	3650	\N
128270	GENERIC_DAY	0	1	2011-09-26	2223	\N	3650	\N
128271	GENERIC_DAY	0	1	2011-02-18	2223	\N	3650	\N
128272	GENERIC_DAY	0	0	2011-05-15	2223	\N	3650	\N
128273	GENERIC_DAY	0	1	2011-11-14	2233	\N	3650	\N
128274	GENERIC_DAY	0	1	2011-09-08	2233	\N	3650	\N
128275	GENERIC_DAY	0	2	2010-08-13	2233	\N	3650	\N
128276	GENERIC_DAY	0	1	2011-12-22	2233	\N	3650	\N
128277	GENERIC_DAY	0	1	2011-05-31	2223	\N	3650	\N
128278	GENERIC_DAY	0	2	2011-08-18	2229	\N	3650	\N
128279	GENERIC_DAY	0	1	2010-11-19	2229	\N	3650	\N
128280	GENERIC_DAY	0	0	2010-11-13	2223	\N	3650	\N
128281	GENERIC_DAY	0	2	2011-10-11	2231	\N	3650	\N
128282	GENERIC_DAY	0	2	2011-07-13	2229	\N	3650	\N
128283	GENERIC_DAY	0	1	2011-03-03	2223	\N	3650	\N
128284	GENERIC_DAY	0	1	2011-01-17	2223	\N	3650	\N
128285	GENERIC_DAY	0	2	2011-07-14	2231	\N	3650	\N
128286	GENERIC_DAY	0	1	2010-11-25	2223	\N	3650	\N
128287	GENERIC_DAY	0	2	2011-01-27	2233	\N	3650	\N
128288	GENERIC_DAY	0	0	2011-06-05	2223	\N	3650	\N
128289	GENERIC_DAY	0	2	2011-10-12	2229	\N	3650	\N
128290	GENERIC_DAY	0	0	2011-01-23	2229	\N	3650	\N
128291	GENERIC_DAY	0	2	2011-07-19	2229	\N	3650	\N
128292	GENERIC_DAY	0	2	2011-08-08	2231	\N	3650	\N
128293	GENERIC_DAY	0	1	2011-09-14	2223	\N	3650	\N
128294	GENERIC_DAY	0	0	2011-07-09	2233	\N	3650	\N
128295	GENERIC_DAY	0	2	2011-07-06	2229	\N	3650	\N
128296	GENERIC_DAY	0	0	2011-11-27	2231	\N	3650	\N
128297	GENERIC_DAY	0	3	2010-09-23	2231	\N	3650	\N
128298	GENERIC_DAY	0	0	2010-12-22	2225	\N	3650	\N
128299	GENERIC_DAY	0	2	2011-07-20	2229	\N	3650	\N
128300	GENERIC_DAY	0	1	2010-08-27	2229	\N	3650	\N
128301	GENERIC_DAY	0	0	2011-01-15	2225	\N	3650	\N
128302	GENERIC_DAY	0	0	2010-09-11	2225	\N	3650	\N
128303	GENERIC_DAY	0	0	2011-01-16	2231	\N	3650	\N
128304	GENERIC_DAY	0	2	2012-02-07	2229	\N	3650	\N
128305	GENERIC_DAY	0	0	2011-05-22	2223	\N	3650	\N
128306	GENERIC_DAY	0	0	2012-02-19	2233	\N	3650	\N
128307	GENERIC_DAY	0	2	2012-02-09	2231	\N	3650	\N
128308	GENERIC_DAY	0	1	2011-07-01	2229	\N	3650	\N
128309	GENERIC_DAY	0	1	2011-12-02	2233	\N	3650	\N
128310	GENERIC_DAY	0	2	2011-02-14	2233	\N	3650	\N
128311	GENERIC_DAY	0	2	2011-07-27	2233	\N	3650	\N
128312	GENERIC_DAY	0	0	2011-05-04	2225	\N	3650	\N
128313	GENERIC_DAY	0	2	2010-09-09	2229	\N	3650	\N
128314	GENERIC_DAY	0	1	2010-11-08	2223	\N	3650	\N
128315	GENERIC_DAY	0	0	2010-09-21	2225	\N	3650	\N
128316	GENERIC_DAY	0	2	2010-12-07	2233	\N	3650	\N
128317	GENERIC_DAY	0	0	2011-04-16	2231	\N	3650	\N
128318	GENERIC_DAY	0	3	2010-09-01	2231	\N	3650	\N
128319	GENERIC_DAY	0	2	2012-01-05	2231	\N	3650	\N
128320	GENERIC_DAY	0	1	2011-11-16	2223	\N	3650	\N
128321	GENERIC_DAY	0	0	2011-01-03	2225	\N	3650	\N
128322	GENERIC_DAY	0	0	2011-08-27	2229	\N	3650	\N
128323	GENERIC_DAY	0	0	2011-09-03	2229	\N	3650	\N
128324	GENERIC_DAY	0	2	2011-09-26	2225	\N	3650	\N
128325	GENERIC_DAY	0	3	2011-02-08	2231	\N	3650	\N
128326	GENERIC_DAY	0	2	2010-09-22	2229	\N	3650	\N
128327	GENERIC_DAY	0	0	2010-08-21	2233	\N	3650	\N
128328	GENERIC_DAY	0	2	2011-08-01	2223	\N	3650	\N
128329	GENERIC_DAY	0	0	2011-01-09	2233	\N	3650	\N
128330	GENERIC_DAY	0	2	2011-07-05	2233	\N	3650	\N
128331	GENERIC_DAY	0	0	2011-02-12	2225	\N	3650	\N
128332	GENERIC_DAY	0	1	2010-10-19	2223	\N	3650	\N
128333	GENERIC_DAY	0	0	2010-11-13	2229	\N	3650	\N
128334	GENERIC_DAY	0	1	2011-02-10	2223	\N	3650	\N
128335	GENERIC_DAY	0	2	2010-10-29	2233	\N	3650	\N
128336	GENERIC_DAY	0	0	2011-05-09	2225	\N	3650	\N
128337	GENERIC_DAY	0	2	2010-08-18	2229	\N	3650	\N
128338	GENERIC_DAY	0	1	2010-09-03	2229	\N	3650	\N
128339	GENERIC_DAY	0	0	2011-01-30	2229	\N	3650	\N
128340	GENERIC_DAY	0	1	2011-02-14	2223	\N	3650	\N
128341	GENERIC_DAY	0	2	2011-09-13	2229	\N	3650	\N
128342	GENERIC_DAY	0	0	2011-02-19	2229	\N	3650	\N
128343	GENERIC_DAY	0	2	2011-11-21	2225	\N	3650	\N
128344	GENERIC_DAY	0	0	2012-02-11	2233	\N	3650	\N
128345	GENERIC_DAY	0	1	2010-10-08	2223	\N	3650	\N
128346	GENERIC_DAY	0	2	2010-12-03	2231	\N	3650	\N
128347	GENERIC_DAY	0	2	2010-09-02	2229	\N	3650	\N
128348	GENERIC_DAY	0	2	2011-06-21	2233	\N	3650	\N
128349	GENERIC_DAY	0	0	2011-02-15	2225	\N	3650	\N
128350	GENERIC_DAY	0	1	2010-10-28	2223	\N	3650	\N
128351	GENERIC_DAY	0	2	2011-12-14	2231	\N	3650	\N
128352	GENERIC_DAY	0	1	2011-01-18	2223	\N	3650	\N
128353	GENERIC_DAY	0	0	2010-10-12	2231	\N	3650	\N
128354	GENERIC_DAY	0	1	2012-01-20	2233	\N	3650	\N
128355	GENERIC_DAY	0	2	2011-09-15	2229	\N	3650	\N
128356	GENERIC_DAY	0	0	2011-02-20	2233	\N	3650	\N
128357	GENERIC_DAY	0	2	2010-10-13	2229	\N	3650	\N
128358	GENERIC_DAY	0	2	2012-01-12	2225	\N	3650	\N
128359	GENERIC_DAY	0	0	2011-04-02	2229	\N	3650	\N
128360	GENERIC_DAY	0	1	2011-09-23	2225	\N	3650	\N
128361	GENERIC_DAY	0	1	2011-10-06	2233	\N	3650	\N
128362	GENERIC_DAY	0	0	2011-08-14	2225	\N	3650	\N
128363	GENERIC_DAY	0	0	2011-12-17	2229	\N	3650	\N
128364	GENERIC_DAY	0	2	2011-11-23	2225	\N	3650	\N
128365	GENERIC_DAY	0	2	2011-06-16	2233	\N	3650	\N
128366	GENERIC_DAY	0	0	2011-07-14	2225	\N	3650	\N
128367	GENERIC_DAY	0	2	2010-10-26	2229	\N	3650	\N
128368	GENERIC_DAY	0	2	2012-01-23	2229	\N	3650	\N
128369	GENERIC_DAY	0	2	2011-12-14	2229	\N	3650	\N
128370	GENERIC_DAY	0	1	2011-02-07	2223	\N	3650	\N
128371	GENERIC_DAY	0	2	2010-11-29	2233	\N	3650	\N
128372	GENERIC_DAY	0	2	2011-02-01	2233	\N	3650	\N
128373	GENERIC_DAY	0	2	2011-11-10	2231	\N	3650	\N
128374	GENERIC_DAY	0	2	2011-02-01	2229	\N	3650	\N
128375	GENERIC_DAY	0	2	2011-08-24	2225	\N	3650	\N
128376	GENERIC_DAY	0	1	2011-11-10	2233	\N	3650	\N
128377	GENERIC_DAY	0	0	2010-09-04	2229	\N	3650	\N
128378	GENERIC_DAY	0	0	2011-07-03	2229	\N	3650	\N
128379	GENERIC_DAY	0	0	2011-09-25	2229	\N	3650	\N
128380	GENERIC_DAY	0	0	2011-07-24	2223	\N	3650	\N
128381	GENERIC_DAY	0	0	2011-12-11	2225	\N	3650	\N
128382	GENERIC_DAY	0	2	2011-10-10	2231	\N	3650	\N
128383	GENERIC_DAY	0	0	2011-10-23	2231	\N	3650	\N
128384	GENERIC_DAY	0	3	2011-04-28	2231	\N	3650	\N
128385	GENERIC_DAY	0	2	2012-01-12	2229	\N	3650	\N
128386	GENERIC_DAY	0	0	2011-02-17	2225	\N	3650	\N
128387	GENERIC_DAY	0	1	2011-09-01	2223	\N	3650	\N
128388	GENERIC_DAY	0	3	2011-03-07	2231	\N	3650	\N
128389	GENERIC_DAY	0	0	2011-08-20	2229	\N	3650	\N
128390	GENERIC_DAY	0	2	2011-01-24	2229	\N	3650	\N
128391	GENERIC_DAY	0	2	2011-12-27	2225	\N	3650	\N
128392	GENERIC_DAY	0	2	2010-09-01	2233	\N	3650	\N
128393	GENERIC_DAY	0	1	2011-08-29	2223	\N	3650	\N
128394	GENERIC_DAY	0	2	2011-09-13	2231	\N	3650	\N
128395	GENERIC_DAY	0	0	2011-12-04	2233	\N	3650	\N
128396	GENERIC_DAY	0	2	2011-03-14	2229	\N	3650	\N
128397	GENERIC_DAY	0	0	2011-07-27	2225	\N	3650	\N
128398	GENERIC_DAY	0	2	2011-11-16	2229	\N	3650	\N
128399	GENERIC_DAY	0	2	2010-11-19	2233	\N	3650	\N
128400	GENERIC_DAY	0	2	2011-01-10	2233	\N	3650	\N
128401	GENERIC_DAY	0	3	2010-11-16	2231	\N	3650	\N
128402	GENERIC_DAY	0	0	2012-01-21	2223	\N	3650	\N
128403	GENERIC_DAY	0	1	2011-11-11	2223	\N	3650	\N
128404	GENERIC_DAY	0	2	2010-11-18	2233	\N	3650	\N
128405	GENERIC_DAY	0	0	2011-09-11	2233	\N	3650	\N
128406	GENERIC_DAY	0	2	2012-01-30	2229	\N	3650	\N
128407	GENERIC_DAY	0	2	2010-10-29	2231	\N	3650	\N
128408	GENERIC_DAY	0	0	2010-09-12	2233	\N	3650	\N
128409	GENERIC_DAY	0	0	2012-02-05	2225	\N	3650	\N
128410	GENERIC_DAY	0	2	2010-09-27	2233	\N	3650	\N
128411	GENERIC_DAY	0	0	2011-10-08	2225	\N	3650	\N
128412	GENERIC_DAY	0	2	2012-02-10	2231	\N	3650	\N
128413	GENERIC_DAY	0	3	2010-11-30	2231	\N	3650	\N
128414	GENERIC_DAY	0	0	2011-08-07	2229	\N	3650	\N
128415	GENERIC_DAY	0	1	2011-03-28	2223	\N	3650	\N
128416	GENERIC_DAY	0	1	2010-12-17	2223	\N	3650	\N
128417	GENERIC_DAY	0	0	2011-07-02	2229	\N	3650	\N
128418	GENERIC_DAY	0	1	2011-03-09	2223	\N	3650	\N
128419	GENERIC_DAY	0	0	2011-12-31	2231	\N	3650	\N
128420	GENERIC_DAY	0	2	2011-12-09	2231	\N	3650	\N
128421	GENERIC_DAY	0	2	2011-07-13	2231	\N	3650	\N
128422	GENERIC_DAY	0	2	2011-09-29	2229	\N	3650	\N
128423	GENERIC_DAY	0	0	2011-05-15	2231	\N	3650	\N
128424	GENERIC_DAY	0	0	2010-09-26	2229	\N	3650	\N
128425	GENERIC_DAY	0	0	2011-02-22	2225	\N	3650	\N
128426	GENERIC_DAY	0	2	2011-11-21	2231	\N	3650	\N
128427	GENERIC_DAY	0	2	2010-11-10	2229	\N	3650	\N
128428	GENERIC_DAY	0	0	2011-10-16	2225	\N	3650	\N
128429	GENERIC_DAY	0	1	2010-09-08	2223	\N	3650	\N
128430	GENERIC_DAY	0	0	2011-02-19	2223	\N	3650	\N
128431	GENERIC_DAY	0	2	2011-08-23	2225	\N	3650	\N
128432	GENERIC_DAY	0	2	2010-10-01	2233	\N	3650	\N
128433	GENERIC_DAY	0	0	2010-11-04	2225	\N	3650	\N
128434	GENERIC_DAY	0	2	2011-06-24	2233	\N	3650	\N
128435	GENERIC_DAY	0	0	2011-03-27	2233	\N	3650	\N
128436	GENERIC_DAY	0	2	2010-11-09	2229	\N	3650	\N
128437	GENERIC_DAY	0	2	2010-08-26	2233	\N	3650	\N
128438	GENERIC_DAY	0	0	2011-10-15	2223	\N	3650	\N
128439	GENERIC_DAY	0	0	2010-10-22	2225	\N	3650	\N
128440	GENERIC_DAY	0	0	2011-11-27	2225	\N	3650	\N
128441	GENERIC_DAY	0	0	2010-09-19	2225	\N	3650	\N
128442	GENERIC_DAY	0	1	2011-06-23	2223	\N	3650	\N
128443	GENERIC_DAY	0	1	2012-02-07	2223	\N	3650	\N
128444	GENERIC_DAY	0	1	2011-09-29	2223	\N	3650	\N
128445	GENERIC_DAY	0	0	2011-10-23	2223	\N	3650	\N
128446	GENERIC_DAY	0	0	2011-05-22	2229	\N	3650	\N
128447	GENERIC_DAY	0	0	2011-06-23	2225	\N	3650	\N
128448	GENERIC_DAY	0	3	2011-03-21	2231	\N	3650	\N
128449	GENERIC_DAY	0	1	2010-12-03	2223	\N	3650	\N
128450	GENERIC_DAY	0	0	2011-03-11	2225	\N	3650	\N
128451	GENERIC_DAY	0	2	2011-02-07	2233	\N	3650	\N
128452	GENERIC_DAY	0	0	2011-09-11	2231	\N	3650	\N
128453	GENERIC_DAY	0	1	2012-01-20	2225	\N	3650	\N
128454	GENERIC_DAY	0	0	2011-11-12	2233	\N	3650	\N
128455	GENERIC_DAY	0	0	2011-08-14	2231	\N	3650	\N
128456	GENERIC_DAY	0	2	2011-10-03	2225	\N	3650	\N
128457	GENERIC_DAY	0	0	2011-07-25	2225	\N	3650	\N
128458	GENERIC_DAY	0	2	2011-12-22	2229	\N	3650	\N
128459	GENERIC_DAY	0	3	2011-04-20	2231	\N	3650	\N
128460	GENERIC_DAY	0	2	2010-10-22	2233	\N	3650	\N
128461	GENERIC_DAY	0	2	2010-12-27	2229	\N	3650	\N
128462	GENERIC_DAY	0	1	2011-09-28	2233	\N	3650	\N
128463	GENERIC_DAY	0	3	2011-05-05	2231	\N	3650	\N
128464	GENERIC_DAY	0	1	2010-08-23	2223	\N	3650	\N
128465	GENERIC_DAY	0	1	2011-03-02	2223	\N	3650	\N
128466	GENERIC_DAY	0	3	2011-05-31	2231	\N	3650	\N
128467	GENERIC_DAY	0	0	2011-10-29	2225	\N	3650	\N
128468	GENERIC_DAY	0	1	2010-09-27	2223	\N	3650	\N
128469	GENERIC_DAY	0	1	2011-12-14	2223	\N	3650	\N
128470	GENERIC_DAY	0	1	2011-01-14	2223	\N	3650	\N
128471	GENERIC_DAY	0	0	2010-08-30	2225	\N	3650	\N
128472	GENERIC_DAY	0	2	2011-02-03	2233	\N	3650	\N
128473	GENERIC_DAY	0	1	2011-08-12	2233	\N	3650	\N
128474	GENERIC_DAY	0	2	2011-10-10	2229	\N	3650	\N
128475	GENERIC_DAY	0	3	2011-06-09	2231	\N	3650	\N
128476	GENERIC_DAY	0	0	2010-09-12	2231	\N	3650	\N
128477	GENERIC_DAY	0	0	2011-07-15	2225	\N	3650	\N
128478	GENERIC_DAY	0	0	2011-06-28	2225	\N	3650	\N
128479	GENERIC_DAY	0	3	2010-09-16	2231	\N	3650	\N
128480	GENERIC_DAY	0	0	2010-10-16	2233	\N	3650	\N
128481	GENERIC_DAY	0	2	2011-02-10	2233	\N	3650	\N
128482	GENERIC_DAY	0	2	2011-05-17	2233	\N	3650	\N
128483	GENERIC_DAY	0	0	2010-08-13	2225	\N	3650	\N
128484	GENERIC_DAY	0	2	2011-12-23	2231	\N	3650	\N
128485	GENERIC_DAY	0	1	2011-08-22	2233	\N	3650	\N
128486	GENERIC_DAY	0	0	2010-12-24	2225	\N	3650	\N
128487	GENERIC_DAY	0	2	2011-10-14	2231	\N	3650	\N
128488	GENERIC_DAY	0	2	2011-03-24	2229	\N	3650	\N
128489	GENERIC_DAY	0	0	2010-12-25	2223	\N	3650	\N
128490	GENERIC_DAY	0	1	2011-09-15	2223	\N	3650	\N
128491	GENERIC_DAY	0	0	2010-08-11	2225	\N	3650	\N
128492	GENERIC_DAY	0	0	2010-08-29	2225	\N	3650	\N
128493	GENERIC_DAY	0	2	2011-12-29	2229	\N	3650	\N
128494	GENERIC_DAY	0	0	2011-06-19	2225	\N	3650	\N
128495	GENERIC_DAY	0	2	2010-09-14	2233	\N	3650	\N
128496	GENERIC_DAY	0	0	2011-05-03	2225	\N	3650	\N
128497	GENERIC_DAY	0	0	2010-10-16	2223	\N	3650	\N
128498	GENERIC_DAY	0	1	2012-02-01	2233	\N	3650	\N
128499	GENERIC_DAY	0	0	2011-11-20	2225	\N	3650	\N
128500	GENERIC_DAY	0	0	2011-07-16	2229	\N	3650	\N
128501	GENERIC_DAY	0	1	2011-11-25	2233	\N	3650	\N
128502	GENERIC_DAY	0	1	2011-12-28	2223	\N	3650	\N
128503	GENERIC_DAY	0	0	2011-11-20	2233	\N	3650	\N
128504	GENERIC_DAY	0	2	2012-01-13	2231	\N	3650	\N
128505	GENERIC_DAY	0	0	2011-04-10	2231	\N	3650	\N
128506	GENERIC_DAY	0	2	2011-03-21	2233	\N	3650	\N
128507	GENERIC_DAY	0	0	2010-09-26	2225	\N	3650	\N
128508	GENERIC_DAY	0	2	2010-12-16	2233	\N	3650	\N
128509	GENERIC_DAY	0	1	2011-03-07	2223	\N	3650	\N
128510	GENERIC_DAY	0	1	2011-12-05	2223	\N	3650	\N
128511	GENERIC_DAY	0	1	2012-02-17	2233	\N	3650	\N
128512	GENERIC_DAY	0	0	2011-10-30	2233	\N	3650	\N
128513	GENERIC_DAY	0	0	2011-09-10	2229	\N	3650	\N
128514	GENERIC_DAY	0	2	2011-01-28	2233	\N	3650	\N
128515	GENERIC_DAY	0	1	2011-11-24	2233	\N	3650	\N
128516	GENERIC_DAY	0	2	2010-12-22	2229	\N	3650	\N
128517	GENERIC_DAY	0	2	2011-11-24	2231	\N	3650	\N
128518	GENERIC_DAY	0	2	2011-07-21	2233	\N	3650	\N
128519	GENERIC_DAY	0	0	2010-12-05	2223	\N	3650	\N
128520	GENERIC_DAY	0	2	2010-11-25	2233	\N	3650	\N
128521	GENERIC_DAY	0	1	2011-10-19	2223	\N	3650	\N
128522	GENERIC_DAY	0	2	2011-10-19	2225	\N	3650	\N
128523	GENERIC_DAY	0	2	2011-10-13	2225	\N	3650	\N
128524	GENERIC_DAY	0	0	2011-08-27	2223	\N	3650	\N
128525	GENERIC_DAY	0	2	2011-12-01	2225	\N	3650	\N
128526	GENERIC_DAY	0	1	2010-12-03	2229	\N	3650	\N
128527	GENERIC_DAY	0	2	2011-03-25	2233	\N	3650	\N
128528	GENERIC_DAY	0	0	2011-06-04	2223	\N	3650	\N
128529	GENERIC_DAY	0	0	2011-08-21	2233	\N	3650	\N
128530	GENERIC_DAY	0	2	2011-11-21	2229	\N	3650	\N
128531	GENERIC_DAY	0	3	2010-12-02	2231	\N	3650	\N
128532	GENERIC_DAY	0	0	2011-03-29	2225	\N	3650	\N
128533	GENERIC_DAY	0	2	2010-09-30	2233	\N	3650	\N
128534	GENERIC_DAY	0	2	2011-01-31	2233	\N	3650	\N
128535	GENERIC_DAY	0	2	2010-12-20	2233	\N	3650	\N
128536	GENERIC_DAY	0	2	2011-04-06	2229	\N	3650	\N
128537	GENERIC_DAY	0	0	2011-03-12	2229	\N	3650	\N
128538	GENERIC_DAY	0	2	2011-02-16	2229	\N	3650	\N
128539	GENERIC_DAY	0	2	2010-12-14	2233	\N	3650	\N
128540	GENERIC_DAY	0	0	2011-07-23	2223	\N	3650	\N
128541	GENERIC_DAY	0	2	2011-06-07	2233	\N	3650	\N
128542	GENERIC_DAY	0	0	2010-08-14	2223	\N	3650	\N
128543	GENERIC_DAY	0	0	2012-02-19	2229	\N	3650	\N
128544	GENERIC_DAY	0	3	2011-02-21	2231	\N	3650	\N
128545	GENERIC_DAY	0	0	2011-05-28	2233	\N	3650	\N
128546	GENERIC_DAY	0	0	2011-03-03	2225	\N	3650	\N
128547	GENERIC_DAY	0	0	2011-07-31	2231	\N	3650	\N
128548	GENERIC_DAY	0	0	2010-12-12	2223	\N	3650	\N
128549	GENERIC_DAY	0	2	2011-03-10	2233	\N	3650	\N
128550	GENERIC_DAY	0	1	2011-09-29	2233	\N	3650	\N
128551	GENERIC_DAY	0	1	2011-03-15	2223	\N	3650	\N
128552	GENERIC_DAY	0	0	2010-12-31	2225	\N	3650	\N
128553	GENERIC_DAY	0	3	2011-04-05	2231	\N	3650	\N
128554	GENERIC_DAY	0	0	2010-12-08	2231	\N	3650	\N
128555	GENERIC_DAY	0	0	2011-01-09	2231	\N	3650	\N
128556	GENERIC_DAY	0	0	2011-05-07	2229	\N	3650	\N
128557	GENERIC_DAY	0	0	2011-11-26	2229	\N	3650	\N
128558	GENERIC_DAY	0	2	2011-07-18	2231	\N	3650	\N
128559	GENERIC_DAY	0	2	2011-05-31	2233	\N	3650	\N
128560	GENERIC_DAY	0	0	2011-06-11	2231	\N	3650	\N
128561	GENERIC_DAY	0	0	2011-05-08	2223	\N	3650	\N
128562	GENERIC_DAY	0	2	2011-09-19	2231	\N	3650	\N
128563	GENERIC_DAY	0	0	2011-07-23	2229	\N	3650	\N
128564	GENERIC_DAY	0	0	2011-07-04	2225	\N	3650	\N
128565	GENERIC_DAY	0	2	2010-10-08	2233	\N	3650	\N
128566	GENERIC_DAY	0	0	2011-03-23	2225	\N	3650	\N
128567	GENERIC_DAY	0	0	2011-07-23	2225	\N	3650	\N
128568	GENERIC_DAY	0	0	2011-05-29	2225	\N	3650	\N
128569	GENERIC_DAY	0	0	2011-05-05	2225	\N	3650	\N
128570	GENERIC_DAY	0	2	2011-10-04	2229	\N	3650	\N
128571	GENERIC_DAY	0	0	2011-03-26	2223	\N	3650	\N
128572	GENERIC_DAY	0	1	2011-03-31	2223	\N	3650	\N
128573	GENERIC_DAY	0	0	2010-11-05	2225	\N	3650	\N
128574	GENERIC_DAY	0	0	2011-02-06	2223	\N	3650	\N
128575	GENERIC_DAY	0	0	2010-08-28	2229	\N	3650	\N
128576	GENERIC_DAY	0	0	2011-08-07	2223	\N	3650	\N
128577	GENERIC_DAY	0	1	2011-06-15	2223	\N	3650	\N
128578	GENERIC_DAY	0	0	2011-07-28	2225	\N	3650	\N
128579	GENERIC_DAY	0	3	2010-08-31	2231	\N	3650	\N
128580	GENERIC_DAY	0	0	2011-01-27	2225	\N	3650	\N
128581	GENERIC_DAY	0	1	2011-02-18	2229	\N	3650	\N
128582	GENERIC_DAY	0	2	2011-04-18	2229	\N	3650	\N
128583	GENERIC_DAY	0	2	2012-01-24	2229	\N	3650	\N
128584	GENERIC_DAY	0	1	2011-06-30	2223	\N	3650	\N
128585	GENERIC_DAY	0	0	2011-09-11	2229	\N	3650	\N
128586	GENERIC_DAY	0	2	2012-02-06	2229	\N	3650	\N
128587	GENERIC_DAY	0	0	2011-05-31	2225	\N	3650	\N
128588	GENERIC_DAY	0	1	2011-11-08	2223	\N	3650	\N
128589	GENERIC_DAY	0	2	2011-01-26	2229	\N	3650	\N
128590	GENERIC_DAY	0	2	2011-08-29	2229	\N	3650	\N
128591	GENERIC_DAY	0	1	2011-08-29	2233	\N	3650	\N
128592	GENERIC_DAY	0	1	2011-11-07	2223	\N	3650	\N
128593	GENERIC_DAY	0	1	2011-10-12	2223	\N	3650	\N
128594	GENERIC_DAY	0	2	2011-08-16	2229	\N	3650	\N
128595	GENERIC_DAY	0	1	2011-10-04	2233	\N	3650	\N
128596	GENERIC_DAY	0	1	2010-09-01	2223	\N	3650	\N
128597	GENERIC_DAY	0	2	2011-05-18	2229	\N	3650	\N
128598	GENERIC_DAY	0	2	2011-09-29	2225	\N	3650	\N
128599	GENERIC_DAY	0	2	2011-12-26	2231	\N	3650	\N
128600	GENERIC_DAY	0	0	2011-06-30	2225	\N	3650	\N
128601	GENERIC_DAY	0	2	2011-12-21	2231	\N	3650	\N
128602	GENERIC_DAY	0	3	2011-06-22	2231	\N	3650	\N
128603	GENERIC_DAY	0	0	2010-09-25	2229	\N	3650	\N
128604	GENERIC_DAY	0	2	2011-03-01	2233	\N	3650	\N
128605	GENERIC_DAY	0	2	2011-01-21	2231	\N	3650	\N
128606	GENERIC_DAY	0	0	2010-09-04	2233	\N	3650	\N
128607	GENERIC_DAY	0	3	2011-02-24	2231	\N	3650	\N
128608	GENERIC_DAY	0	1	2010-10-27	2223	\N	3650	\N
128609	GENERIC_DAY	0	2	2011-11-09	2225	\N	3650	\N
128610	GENERIC_DAY	0	2	2011-10-04	2225	\N	3650	\N
128611	GENERIC_DAY	0	1	2011-11-04	2229	\N	3650	\N
128612	GENERIC_DAY	0	1	2012-02-09	2223	\N	3650	\N
128613	GENERIC_DAY	0	0	2010-08-25	2225	\N	3650	\N
128614	GENERIC_DAY	0	1	2011-03-11	2229	\N	3650	\N
128615	GENERIC_DAY	0	0	2010-12-19	2223	\N	3650	\N
128616	GENERIC_DAY	0	0	2011-05-01	2225	\N	3650	\N
128617	GENERIC_DAY	0	1	2011-04-26	2223	\N	3650	\N
128618	GENERIC_DAY	0	2	2010-08-20	2231	\N	3650	\N
128619	GENERIC_DAY	0	0	2011-03-19	2223	\N	3650	\N
128620	GENERIC_DAY	0	0	2011-08-15	2225	\N	3650	\N
128621	GENERIC_DAY	0	0	2010-12-19	2233	\N	3650	\N
128622	GENERIC_DAY	0	2	2011-07-29	2229	\N	3650	\N
128623	GENERIC_DAY	0	0	2011-07-09	2225	\N	3650	\N
128624	GENERIC_DAY	0	0	2011-07-24	2225	\N	3650	\N
128625	GENERIC_DAY	0	1	2010-10-20	2223	\N	3650	\N
128626	GENERIC_DAY	0	2	2011-07-26	2223	\N	3650	\N
128627	GENERIC_DAY	0	0	2011-01-23	2233	\N	3650	\N
128628	GENERIC_DAY	0	1	2011-03-23	2223	\N	3650	\N
128629	GENERIC_DAY	0	0	2010-11-28	2223	\N	3650	\N
128630	GENERIC_DAY	0	0	2011-06-25	2231	\N	3650	\N
128631	GENERIC_DAY	0	0	2011-02-05	2231	\N	3650	\N
128632	GENERIC_DAY	0	2	2012-02-08	2229	\N	3650	\N
128633	GENERIC_DAY	0	1	2010-12-29	2223	\N	3650	\N
128634	GENERIC_DAY	0	2	2010-12-13	2229	\N	3650	\N
128635	GENERIC_DAY	0	2	2011-07-28	2229	\N	3650	\N
128636	GENERIC_DAY	0	2	2011-01-10	2229	\N	3650	\N
128637	GENERIC_DAY	0	2	2010-11-24	2229	\N	3650	\N
128638	GENERIC_DAY	0	2	2011-05-16	2233	\N	3650	\N
128639	GENERIC_DAY	0	1	2012-01-13	2233	\N	3650	\N
128640	GENERIC_DAY	0	2	2011-07-05	2229	\N	3650	\N
128641	GENERIC_DAY	0	2	2011-09-19	2229	\N	3650	\N
128642	GENERIC_DAY	0	0	2010-12-10	2225	\N	3650	\N
128643	GENERIC_DAY	0	0	2011-10-01	2229	\N	3650	\N
128644	GENERIC_DAY	0	0	2011-06-05	2231	\N	3650	\N
128645	GENERIC_DAY	0	0	2012-01-01	2225	\N	3650	\N
128646	GENERIC_DAY	0	0	2012-01-14	2229	\N	3650	\N
128647	GENERIC_DAY	0	0	2011-10-09	2223	\N	3650	\N
128648	GENERIC_DAY	0	0	2011-06-26	2231	\N	3650	\N
128649	GENERIC_DAY	0	1	2012-01-09	2233	\N	3650	\N
128650	GENERIC_DAY	0	2	2010-10-18	2233	\N	3650	\N
128651	GENERIC_DAY	0	2	2011-12-28	2231	\N	3650	\N
128652	GENERIC_DAY	0	2	2010-08-19	2233	\N	3650	\N
128653	GENERIC_DAY	0	0	2010-10-09	2231	\N	3650	\N
128654	GENERIC_DAY	0	2	2012-02-16	2231	\N	3650	\N
128655	GENERIC_DAY	0	2	2010-10-11	2229	\N	3650	\N
128656	GENERIC_DAY	0	2	2011-12-22	2225	\N	3650	\N
128657	GENERIC_DAY	0	2	2011-10-17	2225	\N	3650	\N
128658	GENERIC_DAY	0	0	2011-02-12	2223	\N	3650	\N
128659	GENERIC_DAY	0	2	2012-01-10	2229	\N	3650	\N
128660	GENERIC_DAY	0	1	2011-08-12	2223	\N	3650	\N
128661	GENERIC_DAY	0	0	2012-01-08	2225	\N	3650	\N
128662	GENERIC_DAY	0	1	2011-06-27	2223	\N	3650	\N
128663	GENERIC_DAY	0	2	2011-08-04	2233	\N	3650	\N
128664	GENERIC_DAY	0	0	2011-07-10	2233	\N	3650	\N
128665	GENERIC_DAY	0	1	2011-10-07	2229	\N	3650	\N
128666	GENERIC_DAY	0	2	2012-02-15	2231	\N	3650	\N
128667	GENERIC_DAY	0	1	2010-09-15	2223	\N	3650	\N
128668	GENERIC_DAY	0	0	2011-10-22	2231	\N	3650	\N
128669	GENERIC_DAY	0	3	2011-03-16	2231	\N	3650	\N
128670	GENERIC_DAY	0	0	2010-09-13	2225	\N	3650	\N
128671	GENERIC_DAY	0	1	2011-10-24	2223	\N	3650	\N
128672	GENERIC_DAY	0	0	2012-01-07	2225	\N	3650	\N
128673	GENERIC_DAY	0	0	2011-02-12	2233	\N	3650	\N
128674	GENERIC_DAY	0	0	2011-11-05	2233	\N	3650	\N
128675	GENERIC_DAY	0	3	2010-08-17	2231	\N	3650	\N
128676	GENERIC_DAY	0	0	2011-03-26	2229	\N	3650	\N
128677	GENERIC_DAY	0	1	2010-12-17	2229	\N	3650	\N
128678	GENERIC_DAY	0	1	2012-01-12	2233	\N	3650	\N
128679	GENERIC_DAY	0	0	2010-08-14	2233	\N	3650	\N
128680	GENERIC_DAY	0	1	2010-09-02	2223	\N	3650	\N
128681	GENERIC_DAY	0	1	2011-04-29	2229	\N	3650	\N
128682	GENERIC_DAY	0	0	2011-10-23	2233	\N	3650	\N
128683	GENERIC_DAY	0	1	2011-08-30	2233	\N	3650	\N
128684	GENERIC_DAY	0	2	2010-08-17	2233	\N	3650	\N
128685	GENERIC_DAY	0	2	2011-03-02	2233	\N	3650	\N
128686	GENERIC_DAY	0	1	2011-03-25	2229	\N	3650	\N
128687	GENERIC_DAY	0	0	2010-10-25	2225	\N	3650	\N
128688	GENERIC_DAY	0	1	2010-10-29	2223	\N	3650	\N
128689	GENERIC_DAY	0	0	2010-11-29	2225	\N	3650	\N
128690	GENERIC_DAY	0	0	2011-08-11	2225	\N	3650	\N
128691	GENERIC_DAY	0	1	2011-09-16	2225	\N	3650	\N
128692	GENERIC_DAY	0	0	2012-01-29	2223	\N	3650	\N
128693	GENERIC_DAY	0	2	2011-06-27	2233	\N	3650	\N
128694	GENERIC_DAY	0	0	2011-06-04	2231	\N	3650	\N
128695	GENERIC_DAY	0	1	2011-07-04	2223	\N	3650	\N
128696	GENERIC_DAY	0	2	2010-09-23	2229	\N	3650	\N
128697	GENERIC_DAY	0	2	2011-07-22	2231	\N	3650	\N
128698	GENERIC_DAY	0	3	2010-12-01	2231	\N	3650	\N
128699	GENERIC_DAY	0	2	2011-12-06	2229	\N	3650	\N
128700	GENERIC_DAY	0	2	2010-12-15	2229	\N	3650	\N
128701	GENERIC_DAY	0	1	2011-04-25	2223	\N	3650	\N
128702	GENERIC_DAY	0	2	2011-01-06	2229	\N	3650	\N
128703	GENERIC_DAY	0	0	2011-12-24	2229	\N	3650	\N
128704	GENERIC_DAY	0	2	2011-11-08	2229	\N	3650	\N
128705	GENERIC_DAY	0	0	2011-09-10	2225	\N	3650	\N
128706	GENERIC_DAY	0	0	2010-11-06	2225	\N	3650	\N
128707	GENERIC_DAY	0	0	2011-05-07	2225	\N	3650	\N
128708	GENERIC_DAY	0	2	2010-12-09	2229	\N	3650	\N
128709	GENERIC_DAY	0	2	2011-08-25	2231	\N	3650	\N
128710	GENERIC_DAY	0	2	2011-06-06	2233	\N	3650	\N
128711	GENERIC_DAY	0	0	2010-10-04	2225	\N	3650	\N
128712	GENERIC_DAY	0	1	2011-01-14	2229	\N	3650	\N
128713	GENERIC_DAY	0	0	2012-02-12	2231	\N	3650	\N
128714	GENERIC_DAY	0	0	2010-10-11	2225	\N	3650	\N
128715	GENERIC_DAY	0	1	2011-11-18	2233	\N	3650	\N
128716	GENERIC_DAY	0	2	2011-08-01	2229	\N	3650	\N
128717	GENERIC_DAY	0	0	2011-03-02	2225	\N	3650	\N
128718	GENERIC_DAY	0	0	2011-07-02	2223	\N	3650	\N
128719	GENERIC_DAY	0	2	2011-03-22	2233	\N	3650	\N
128720	GENERIC_DAY	0	0	2010-09-04	2223	\N	3650	\N
128721	GENERIC_DAY	0	0	2011-09-03	2225	\N	3650	\N
128722	GENERIC_DAY	0	1	2011-09-13	2223	\N	3650	\N
128723	GENERIC_DAY	0	0	2011-08-14	2233	\N	3650	\N
128724	GENERIC_DAY	0	2	2011-12-15	2225	\N	3650	\N
128725	GENERIC_DAY	0	0	2012-01-21	2225	\N	3650	\N
128726	GENERIC_DAY	0	2	2011-08-22	2225	\N	3650	\N
128727	GENERIC_DAY	0	1	2012-02-17	2225	\N	3650	\N
128728	GENERIC_DAY	0	1	2011-09-09	2229	\N	3650	\N
128729	GENERIC_DAY	0	3	2011-05-16	2231	\N	3650	\N
128730	GENERIC_DAY	0	2	2010-08-20	2233	\N	3650	\N
128731	GENERIC_DAY	0	3	2011-03-30	2231	\N	3650	\N
128732	GENERIC_DAY	0	1	2011-01-07	2229	\N	3650	\N
128733	GENERIC_DAY	0	0	2010-08-15	2231	\N	3650	\N
128734	GENERIC_DAY	0	0	2010-10-07	2225	\N	3650	\N
128735	GENERIC_DAY	0	3	2011-03-14	2231	\N	3650	\N
128736	GENERIC_DAY	0	0	2011-02-26	2223	\N	3650	\N
128737	GENERIC_DAY	0	1	2011-08-19	2233	\N	3650	\N
128738	GENERIC_DAY	0	0	2010-09-07	2225	\N	3650	\N
128739	GENERIC_DAY	0	2	2011-09-06	2225	\N	3650	\N
128740	GENERIC_DAY	0	1	2011-11-04	2225	\N	3650	\N
128741	GENERIC_DAY	0	1	2011-11-25	2229	\N	3650	\N
128742	GENERIC_DAY	0	0	2010-08-19	2225	\N	3650	\N
128743	GENERIC_DAY	0	0	2011-08-20	2223	\N	3650	\N
128744	GENERIC_DAY	0	1	2011-11-02	2233	\N	3650	\N
128745	GENERIC_DAY	0	1	2011-06-06	2223	\N	3650	\N
128746	GENERIC_DAY	0	2	2010-09-17	2233	\N	3650	\N
128747	GENERIC_DAY	0	0	2011-07-23	2231	\N	3650	\N
128748	GENERIC_DAY	0	0	2012-01-28	2231	\N	3650	\N
128749	GENERIC_DAY	0	2	2011-04-14	2229	\N	3650	\N
128750	GENERIC_DAY	0	3	2011-03-02	2231	\N	3650	\N
128751	GENERIC_DAY	0	2	2011-12-12	2225	\N	3650	\N
128752	GENERIC_DAY	0	1	2011-01-21	2229	\N	3650	\N
128753	GENERIC_DAY	0	0	2011-07-03	2231	\N	3650	\N
128754	GENERIC_DAY	0	1	2010-08-26	2223	\N	3650	\N
128755	GENERIC_DAY	0	2	2011-07-25	2229	\N	3650	\N
128756	GENERIC_DAY	0	0	2010-11-13	2231	\N	3650	\N
128757	GENERIC_DAY	0	0	2011-10-01	2233	\N	3650	\N
128758	GENERIC_DAY	0	2	2011-12-01	2231	\N	3650	\N
128759	GENERIC_DAY	0	1	2011-06-21	2223	\N	3650	\N
128760	GENERIC_DAY	0	1	2011-12-30	2225	\N	3650	\N
128761	GENERIC_DAY	0	1	2010-10-11	2223	\N	3650	\N
128762	GENERIC_DAY	0	1	2011-08-30	2223	\N	3650	\N
128763	GENERIC_DAY	0	0	2010-12-09	2225	\N	3650	\N
128764	GENERIC_DAY	0	3	2010-12-30	2231	\N	3650	\N
128765	GENERIC_DAY	0	2	2012-02-14	2229	\N	3650	\N
128766	GENERIC_DAY	0	1	2011-10-04	2223	\N	3650	\N
128767	GENERIC_DAY	0	2	2012-01-23	2225	\N	3650	\N
128768	GENERIC_DAY	0	2	2011-09-20	2229	\N	3650	\N
128769	GENERIC_DAY	0	2	2011-10-13	2229	\N	3650	\N
128770	GENERIC_DAY	0	1	2011-12-21	2223	\N	3650	\N
128771	GENERIC_DAY	0	3	2010-10-19	2231	\N	3650	\N
128772	GENERIC_DAY	0	1	2011-11-07	2233	\N	3650	\N
128773	GENERIC_DAY	0	1	2010-08-18	2223	\N	3650	\N
128774	GENERIC_DAY	0	2	2011-09-30	2231	\N	3650	\N
128775	GENERIC_DAY	0	0	2011-11-06	2223	\N	3650	\N
128776	GENERIC_DAY	0	2	2011-04-04	2229	\N	3650	\N
128777	GENERIC_DAY	0	0	2011-04-24	2233	\N	3650	\N
128778	GENERIC_DAY	0	0	2011-04-16	2225	\N	3650	\N
128779	GENERIC_DAY	0	0	2011-01-22	2223	\N	3650	\N
128780	GENERIC_DAY	0	2	2011-08-31	2229	\N	3650	\N
128781	GENERIC_DAY	0	0	2011-03-20	2225	\N	3650	\N
128782	GENERIC_DAY	0	0	2010-08-29	2233	\N	3650	\N
128783	GENERIC_DAY	0	0	2011-09-18	2225	\N	3650	\N
128784	GENERIC_DAY	0	1	2011-11-22	2223	\N	3650	\N
128785	GENERIC_DAY	0	1	2011-05-06	2229	\N	3650	\N
128786	GENERIC_DAY	0	0	2010-11-20	2229	\N	3650	\N
128787	GENERIC_DAY	0	0	2011-04-03	2225	\N	3650	\N
128788	GENERIC_DAY	0	2	2011-06-08	2233	\N	3650	\N
128789	GENERIC_DAY	0	0	2011-10-01	2225	\N	3650	\N
128790	GENERIC_DAY	0	1	2010-12-02	2223	\N	3650	\N
128791	GENERIC_DAY	0	1	2012-02-17	2229	\N	3650	\N
128792	GENERIC_DAY	0	1	2011-05-04	2223	\N	3650	\N
128793	GENERIC_DAY	0	3	2011-02-14	2231	\N	3650	\N
128794	GENERIC_DAY	0	1	2012-01-11	2223	\N	3650	\N
128795	GENERIC_DAY	0	0	2010-12-12	2231	\N	3650	\N
128796	GENERIC_DAY	0	2	2011-03-11	2233	\N	3650	\N
128797	GENERIC_DAY	0	0	2011-08-21	2225	\N	3650	\N
128798	GENERIC_DAY	0	1	2011-03-21	2223	\N	3650	\N
128799	GENERIC_DAY	0	1	2011-11-03	2233	\N	3650	\N
128800	GENERIC_DAY	0	0	2010-10-12	2225	\N	3650	\N
128801	GENERIC_DAY	0	2	2011-06-24	2231	\N	3650	\N
128802	GENERIC_DAY	0	0	2010-10-03	2231	\N	3650	\N
128803	GENERIC_DAY	0	0	2011-09-04	2231	\N	3650	\N
128804	GENERIC_DAY	0	0	2011-07-09	2231	\N	3650	\N
128805	GENERIC_DAY	0	2	2010-10-25	2233	\N	3650	\N
128806	GENERIC_DAY	0	1	2011-10-21	2223	\N	3650	\N
128807	GENERIC_DAY	0	2	2011-02-21	2233	\N	3650	\N
128808	GENERIC_DAY	0	0	2011-01-23	2231	\N	3650	\N
128809	GENERIC_DAY	0	1	2011-11-04	2223	\N	3650	\N
128810	GENERIC_DAY	0	3	2010-12-22	2231	\N	3650	\N
128811	GENERIC_DAY	0	1	2010-10-01	2229	\N	3650	\N
128812	GENERIC_DAY	0	0	2010-08-22	2231	\N	3650	\N
128813	GENERIC_DAY	0	0	2010-12-03	2225	\N	3650	\N
128814	GENERIC_DAY	0	1	2012-01-03	2233	\N	3650	\N
128815	GENERIC_DAY	0	0	2011-07-03	2225	\N	3650	\N
128816	GENERIC_DAY	0	0	2011-02-27	2225	\N	3650	\N
128817	GENERIC_DAY	0	2	2011-12-28	2229	\N	3650	\N
128818	GENERIC_DAY	0	2	2011-09-15	2231	\N	3650	\N
128819	GENERIC_DAY	0	0	2011-04-03	2231	\N	3650	\N
128820	GENERIC_DAY	0	2	2010-11-11	2229	\N	3650	\N
128821	GENERIC_DAY	0	0	2010-12-18	2223	\N	3650	\N
128822	GENERIC_DAY	0	0	2011-12-04	2225	\N	3650	\N
128823	GENERIC_DAY	0	0	2010-09-16	2225	\N	3650	\N
128824	GENERIC_DAY	0	1	2011-05-18	2223	\N	3650	\N
128825	GENERIC_DAY	0	0	2010-12-11	2229	\N	3650	\N
128826	GENERIC_DAY	0	0	2011-03-28	2225	\N	3650	\N
128827	GENERIC_DAY	0	3	2011-05-11	2231	\N	3650	\N
128828	GENERIC_DAY	0	1	2010-09-24	2223	\N	3650	\N
128829	GENERIC_DAY	0	2	2011-03-18	2233	\N	3650	\N
128830	GENERIC_DAY	0	1	2011-12-08	2223	\N	3650	\N
128831	GENERIC_DAY	0	0	2011-07-10	2225	\N	3650	\N
128832	GENERIC_DAY	0	1	2011-04-20	2223	\N	3650	\N
128833	GENERIC_DAY	0	0	2012-02-11	2225	\N	3650	\N
128834	GENERIC_DAY	0	2	2011-11-17	2231	\N	3650	\N
128835	GENERIC_DAY	0	0	2011-06-27	2225	\N	3650	\N
128836	GENERIC_DAY	0	2	2011-09-21	2225	\N	3650	\N
128837	GENERIC_DAY	0	0	2010-09-22	2225	\N	3650	\N
128838	GENERIC_DAY	0	2	2011-03-01	2229	\N	3650	\N
128839	GENERIC_DAY	0	0	2011-04-04	2225	\N	3650	\N
128840	GENERIC_DAY	0	2	2011-08-02	2231	\N	3650	\N
128841	GENERIC_DAY	0	2	2011-04-21	2229	\N	3650	\N
128842	GENERIC_DAY	0	0	2011-08-28	2225	\N	3650	\N
128843	GENERIC_DAY	0	0	2011-06-14	2225	\N	3650	\N
128844	GENERIC_DAY	0	0	2011-12-18	2231	\N	3650	\N
128845	GENERIC_DAY	0	0	2010-11-10	2225	\N	3650	\N
128846	GENERIC_DAY	0	3	2011-01-27	2231	\N	3650	\N
128847	GENERIC_DAY	0	0	2010-08-21	2229	\N	3650	\N
128848	GENERIC_DAY	0	2	2011-03-23	2229	\N	3650	\N
128849	GENERIC_DAY	0	2	2011-09-06	2229	\N	3650	\N
128850	GENERIC_DAY	0	3	2010-12-15	2231	\N	3650	\N
128851	GENERIC_DAY	0	0	2011-06-11	2229	\N	3650	\N
128852	GENERIC_DAY	0	3	2011-07-04	2231	\N	3650	\N
128853	GENERIC_DAY	0	2	2011-07-08	2233	\N	3650	\N
128854	GENERIC_DAY	0	1	2011-09-22	2223	\N	3650	\N
128855	GENERIC_DAY	0	0	2012-01-01	2233	\N	3650	\N
128856	GENERIC_DAY	0	2	2011-12-21	2229	\N	3650	\N
128857	GENERIC_DAY	0	2	2011-11-01	2231	\N	3650	\N
128858	GENERIC_DAY	0	2	2011-11-29	2225	\N	3650	\N
128859	GENERIC_DAY	0	0	2011-01-06	2225	\N	3650	\N
128860	GENERIC_DAY	0	0	2011-03-21	2225	\N	3650	\N
128861	GENERIC_DAY	0	2	2012-01-17	2225	\N	3650	\N
128862	GENERIC_DAY	0	1	2010-09-21	2223	\N	3650	\N
128863	GENERIC_DAY	0	2	2011-06-29	2233	\N	3650	\N
128864	GENERIC_DAY	0	0	2010-08-31	2225	\N	3650	\N
128865	GENERIC_DAY	0	1	2010-08-13	2223	\N	3650	\N
128866	GENERIC_DAY	0	2	2011-08-30	2225	\N	3650	\N
128867	GENERIC_DAY	0	2	2010-10-19	2229	\N	3650	\N
128868	GENERIC_DAY	0	1	2011-03-01	2223	\N	3650	\N
128869	GENERIC_DAY	0	0	2010-11-19	2225	\N	3650	\N
128870	GENERIC_DAY	0	0	2011-06-01	2225	\N	3650	\N
128871	GENERIC_DAY	0	0	2011-10-30	2223	\N	3650	\N
128872	GENERIC_DAY	0	2	2011-10-24	2225	\N	3650	\N
128873	GENERIC_DAY	0	0	2010-09-05	2233	\N	3650	\N
128874	GENERIC_DAY	0	1	2011-04-15	2223	\N	3650	\N
128875	GENERIC_DAY	0	1	2010-08-27	2223	\N	3650	\N
128876	GENERIC_DAY	0	1	2011-09-14	2233	\N	3650	\N
128877	GENERIC_DAY	0	0	2010-12-11	2225	\N	3650	\N
128878	GENERIC_DAY	0	0	2011-04-30	2233	\N	3650	\N
128879	GENERIC_DAY	0	2	2010-12-13	2233	\N	3650	\N
128880	GENERIC_DAY	0	2	2011-11-28	2229	\N	3650	\N
128881	GENERIC_DAY	0	0	2011-10-08	2229	\N	3650	\N
128882	GENERIC_DAY	0	2	2011-10-31	2229	\N	3650	\N
128883	GENERIC_DAY	0	3	2010-11-09	2231	\N	3650	\N
128884	GENERIC_DAY	0	2	2011-07-21	2231	\N	3650	\N
128885	GENERIC_DAY	0	2	2011-12-29	2225	\N	3650	\N
128886	GENERIC_DAY	0	2	2012-02-02	2225	\N	3650	\N
128887	GENERIC_DAY	0	1	2012-02-17	2223	\N	3650	\N
128888	GENERIC_DAY	0	0	2010-08-15	2225	\N	3650	\N
128889	GENERIC_DAY	0	0	2011-03-20	2229	\N	3650	\N
128890	GENERIC_DAY	0	2	2011-03-29	2233	\N	3650	\N
128891	GENERIC_DAY	0	2	2011-04-25	2229	\N	3650	\N
128892	GENERIC_DAY	0	2	2010-09-06	2229	\N	3650	\N
128893	GENERIC_DAY	0	2	2012-01-20	2231	\N	3650	\N
128894	GENERIC_DAY	0	2	2011-07-19	2233	\N	3650	\N
128895	GENERIC_DAY	0	2	2010-12-10	2233	\N	3650	\N
128896	GENERIC_DAY	0	1	2011-09-15	2233	\N	3650	\N
128897	GENERIC_DAY	0	2	2011-07-20	2223	\N	3650	\N
128898	GENERIC_DAY	0	0	2011-12-17	2225	\N	3650	\N
128899	GENERIC_DAY	0	1	2011-11-18	2225	\N	3650	\N
128900	GENERIC_DAY	0	0	2011-03-15	2225	\N	3650	\N
128901	GENERIC_DAY	0	0	2011-06-15	2225	\N	3650	\N
128902	GENERIC_DAY	0	2	2010-11-09	2233	\N	3650	\N
128903	GENERIC_DAY	0	0	2011-11-19	2231	\N	3650	\N
128904	GENERIC_DAY	0	0	2011-09-04	2229	\N	3650	\N
128905	GENERIC_DAY	0	1	2012-02-08	2223	\N	3650	\N
128906	GENERIC_DAY	0	0	2011-01-29	2225	\N	3650	\N
128907	GENERIC_DAY	0	2	2010-11-02	2233	\N	3650	\N
128908	GENERIC_DAY	0	0	2010-12-08	2223	\N	3650	\N
128909	GENERIC_DAY	0	0	2011-11-12	2229	\N	3650	\N
128910	GENERIC_DAY	0	1	2011-12-19	2233	\N	3650	\N
128911	GENERIC_DAY	0	0	2011-04-24	2225	\N	3650	\N
128912	GENERIC_DAY	0	1	2012-02-16	2223	\N	3650	\N
128913	GENERIC_DAY	0	2	2011-03-23	2233	\N	3650	\N
128914	GENERIC_DAY	0	0	2010-11-03	2225	\N	3650	\N
128915	GENERIC_DAY	0	1	2010-11-22	2223	\N	3650	\N
128916	GENERIC_DAY	0	2	2011-12-07	2229	\N	3650	\N
128917	GENERIC_DAY	0	2	2011-08-10	2229	\N	3650	\N
128918	GENERIC_DAY	0	0	2011-08-13	2223	\N	3650	\N
128919	GENERIC_DAY	0	2	2011-11-16	2231	\N	3650	\N
128920	GENERIC_DAY	0	2	2011-06-10	2231	\N	3650	\N
128921	GENERIC_DAY	0	2	2011-08-03	2229	\N	3650	\N
128922	GENERIC_DAY	0	2	2011-09-27	2231	\N	3650	\N
128923	GENERIC_DAY	0	0	2011-02-26	2225	\N	3650	\N
128924	GENERIC_DAY	0	0	2011-06-25	2223	\N	3650	\N
128925	GENERIC_DAY	0	1	2010-09-30	2223	\N	3650	\N
128926	GENERIC_DAY	0	0	2011-01-19	2225	\N	3650	\N
128927	GENERIC_DAY	0	1	2010-08-17	2223	\N	3650	\N
128928	GENERIC_DAY	0	2	2011-11-14	2229	\N	3650	\N
128929	GENERIC_DAY	0	2	2011-04-08	2233	\N	3650	\N
128930	GENERIC_DAY	0	0	2011-09-11	2223	\N	3650	\N
128931	GENERIC_DAY	0	1	2011-02-28	2223	\N	3650	\N
128932	GENERIC_DAY	0	0	2011-10-16	2223	\N	3650	\N
128933	GENERIC_DAY	0	1	2011-09-12	2233	\N	3650	\N
128934	GENERIC_DAY	0	1	2011-04-14	2223	\N	3650	\N
128935	GENERIC_DAY	0	0	2010-12-06	2229	\N	3650	\N
128936	GENERIC_DAY	0	1	2011-09-09	2225	\N	3650	\N
128937	GENERIC_DAY	0	2	2011-08-08	2233	\N	3650	\N
128938	GENERIC_DAY	0	1	2011-08-05	2233	\N	3650	\N
128939	GENERIC_DAY	0	0	2011-02-27	2233	\N	3650	\N
128940	GENERIC_DAY	0	2	2012-01-10	2225	\N	3650	\N
128941	GENERIC_DAY	0	2	2010-11-30	2229	\N	3650	\N
128942	GENERIC_DAY	0	1	2011-06-08	2223	\N	3650	\N
128943	GENERIC_DAY	0	0	2011-08-05	2225	\N	3650	\N
128944	GENERIC_DAY	0	1	2012-01-17	2223	\N	3650	\N
128945	GENERIC_DAY	0	2	2011-12-05	2225	\N	3650	\N
128946	GENERIC_DAY	0	2	2011-04-20	2229	\N	3650	\N
128947	GENERIC_DAY	0	0	2010-09-11	2233	\N	3650	\N
128948	GENERIC_DAY	0	2	2012-01-17	2229	\N	3650	\N
128949	GENERIC_DAY	0	1	2011-09-02	2229	\N	3650	\N
128950	GENERIC_DAY	0	1	2011-05-11	2223	\N	3650	\N
128951	GENERIC_DAY	0	0	2011-01-21	2225	\N	3650	\N
128952	GENERIC_DAY	0	1	2011-02-04	2223	\N	3650	\N
128953	GENERIC_DAY	0	1	2012-02-20	2223	\N	3650	\N
128954	GENERIC_DAY	0	0	2010-09-26	2231	\N	3650	\N
128955	GENERIC_DAY	0	3	2011-05-30	2231	\N	3650	\N
128956	GENERIC_DAY	0	1	2011-11-17	2223	\N	3650	\N
128957	GENERIC_DAY	0	0	2012-01-28	2223	\N	3650	\N
128958	GENERIC_DAY	0	0	2011-04-30	2229	\N	3650	\N
128959	GENERIC_DAY	0	0	2010-09-04	2225	\N	3650	\N
128960	GENERIC_DAY	0	1	2012-02-13	2233	\N	3650	\N
128961	GENERIC_DAY	0	3	2011-02-16	2231	\N	3650	\N
128962	GENERIC_DAY	0	0	2010-10-23	2231	\N	3650	\N
128963	GENERIC_DAY	0	0	2012-01-08	2231	\N	3650	\N
128964	GENERIC_DAY	0	2	2010-08-18	2233	\N	3650	\N
128965	GENERIC_DAY	0	1	2011-04-08	2223	\N	3650	\N
128966	GENERIC_DAY	0	0	2010-12-05	2229	\N	3650	\N
128967	GENERIC_DAY	0	2	2011-11-08	2231	\N	3650	\N
128968	GENERIC_DAY	0	0	2011-10-01	2231	\N	3650	\N
128969	GENERIC_DAY	0	2	2011-10-25	2225	\N	3650	\N
128970	GENERIC_DAY	0	1	2011-09-27	2233	\N	3650	\N
128971	GENERIC_DAY	0	0	2012-01-07	2229	\N	3650	\N
128972	GENERIC_DAY	0	0	2011-02-21	2225	\N	3650	\N
128973	GENERIC_DAY	0	0	2011-04-23	2231	\N	3650	\N
128974	GENERIC_DAY	0	0	2011-05-17	2225	\N	3650	\N
128975	GENERIC_DAY	0	2	2011-11-07	2225	\N	3650	\N
128976	GENERIC_DAY	0	2	2011-09-08	2231	\N	3650	\N
128977	GENERIC_DAY	0	1	2011-08-23	2233	\N	3650	\N
128978	GENERIC_DAY	0	0	2011-03-13	2229	\N	3650	\N
128979	GENERIC_DAY	0	0	2011-12-25	2223	\N	3650	\N
128980	GENERIC_DAY	0	0	2011-04-17	2223	\N	3650	\N
128981	GENERIC_DAY	0	0	2011-01-15	2231	\N	3650	\N
128982	GENERIC_DAY	0	2	2010-10-06	2233	\N	3650	\N
128983	GENERIC_DAY	0	2	2011-08-30	2231	\N	3650	\N
128984	GENERIC_DAY	0	1	2011-04-21	2223	\N	3650	\N
128985	GENERIC_DAY	0	0	2011-01-16	2223	\N	3650	\N
128986	GENERIC_DAY	0	0	2011-04-10	2233	\N	3650	\N
128987	GENERIC_DAY	0	0	2010-12-20	2225	\N	3650	\N
128988	GENERIC_DAY	0	2	2011-11-03	2225	\N	3650	\N
128989	GENERIC_DAY	0	2	2011-04-20	2233	\N	3650	\N
128990	GENERIC_DAY	0	2	2010-12-02	2229	\N	3650	\N
128991	GENERIC_DAY	0	2	2012-01-26	2229	\N	3650	\N
128992	GENERIC_DAY	0	3	2010-10-06	2231	\N	3650	\N
128993	GENERIC_DAY	0	0	2011-12-31	2229	\N	3650	\N
128994	GENERIC_DAY	0	0	2010-11-11	2225	\N	3650	\N
128995	GENERIC_DAY	0	0	2010-09-29	2225	\N	3650	\N
128996	GENERIC_DAY	0	2	2011-05-30	2229	\N	3650	\N
128997	GENERIC_DAY	0	0	2012-02-04	2223	\N	3650	\N
128998	GENERIC_DAY	0	1	2011-05-17	2223	\N	3650	\N
128999	GENERIC_DAY	0	0	2011-05-08	2225	\N	3650	\N
129000	GENERIC_DAY	0	0	2011-05-15	2229	\N	3650	\N
129001	GENERIC_DAY	0	3	2011-06-23	2231	\N	3650	\N
129002	GENERIC_DAY	0	3	2010-11-24	2231	\N	3650	\N
129003	GENERIC_DAY	0	0	2010-11-22	2225	\N	3650	\N
129004	GENERIC_DAY	0	1	2011-12-30	2229	\N	3650	\N
129005	GENERIC_DAY	0	0	2011-06-04	2225	\N	3650	\N
129006	GENERIC_DAY	0	3	2011-05-09	2231	\N	3650	\N
129007	GENERIC_DAY	0	0	2011-02-12	2229	\N	3650	\N
129008	GENERIC_DAY	0	2	2011-06-02	2233	\N	3650	\N
129009	GENERIC_DAY	0	3	2011-02-01	2231	\N	3650	\N
129010	GENERIC_DAY	0	1	2012-01-06	2223	\N	3650	\N
129011	GENERIC_DAY	0	1	2011-09-30	2233	\N	3650	\N
129012	GENERIC_DAY	0	1	2010-10-18	2223	\N	3650	\N
129013	GENERIC_DAY	0	2	2011-08-31	2231	\N	3650	\N
129014	GENERIC_DAY	0	0	2011-01-22	2231	\N	3650	\N
129015	GENERIC_DAY	0	0	2011-03-31	2225	\N	3650	\N
129016	GENERIC_DAY	0	2	2010-09-28	2229	\N	3650	\N
129017	GENERIC_DAY	0	1	2012-02-15	2233	\N	3650	\N
129018	GENERIC_DAY	0	2	2010-08-31	2233	\N	3650	\N
129019	GENERIC_DAY	0	1	2011-09-16	2233	\N	3650	\N
129020	GENERIC_DAY	0	0	2011-01-01	2225	\N	3650	\N
129021	GENERIC_DAY	0	0	2011-01-01	2231	\N	3650	\N
129022	GENERIC_DAY	0	1	2011-07-29	2233	\N	3650	\N
129023	GENERIC_DAY	0	0	2010-09-18	2225	\N	3650	\N
129024	GENERIC_DAY	0	2	2011-08-01	2233	\N	3650	\N
129025	GENERIC_DAY	0	0	2011-01-04	2225	\N	3650	\N
129026	GENERIC_DAY	0	0	2010-10-02	2231	\N	3650	\N
129027	GENERIC_DAY	0	2	2011-10-06	2225	\N	3650	\N
129028	GENERIC_DAY	0	2	2011-01-04	2229	\N	3650	\N
129029	GENERIC_DAY	0	0	2012-01-08	2223	\N	3650	\N
129030	GENERIC_DAY	0	0	2011-06-05	2233	\N	3650	\N
129031	GENERIC_DAY	0	3	2011-02-17	2231	\N	3650	\N
129032	GENERIC_DAY	0	2	2011-08-23	2229	\N	3650	\N
129033	GENERIC_DAY	0	1	2011-12-13	2223	\N	3650	\N
129034	GENERIC_DAY	0	0	2010-12-17	2225	\N	3650	\N
129035	GENERIC_DAY	0	1	2011-08-26	2225	\N	3650	\N
129036	GENERIC_DAY	0	2	2011-03-25	2231	\N	3650	\N
129037	GENERIC_DAY	0	0	2011-12-11	2223	\N	3650	\N
129038	GENERIC_DAY	0	2	2011-05-25	2233	\N	3650	\N
129039	GENERIC_DAY	0	2	2011-08-01	2231	\N	3650	\N
129040	GENERIC_DAY	0	0	2011-05-22	2225	\N	3650	\N
129041	GENERIC_DAY	0	2	2012-01-02	2231	\N	3650	\N
129042	GENERIC_DAY	0	0	2010-12-15	2225	\N	3650	\N
129043	GENERIC_DAY	0	2	2012-01-25	2229	\N	3650	\N
129044	GENERIC_DAY	0	1	2011-11-23	2223	\N	3650	\N
129045	GENERIC_DAY	0	0	2011-06-12	2229	\N	3650	\N
129046	GENERIC_DAY	0	1	2011-07-15	2233	\N	3650	\N
129047	GENERIC_DAY	0	1	2011-02-08	2223	\N	3650	\N
129048	GENERIC_DAY	0	1	2011-03-10	2223	\N	3650	\N
129049	GENERIC_DAY	0	0	2012-01-01	2223	\N	3650	\N
129050	GENERIC_DAY	0	0	2011-06-26	2229	\N	3650	\N
129051	GENERIC_DAY	0	0	2010-09-14	2225	\N	3650	\N
129052	GENERIC_DAY	0	2	2010-12-29	2229	\N	3650	\N
129053	GENERIC_DAY	0	0	2010-10-30	2231	\N	3650	\N
129054	GENERIC_DAY	0	0	2011-01-08	2223	\N	3650	\N
129055	GENERIC_DAY	0	0	2011-09-17	2229	\N	3650	\N
129056	GENERIC_DAY	0	0	2011-10-15	2231	\N	3650	\N
129057	GENERIC_DAY	0	2	2011-07-11	2223	\N	3650	\N
129058	GENERIC_DAY	0	0	2010-09-26	2233	\N	3650	\N
129059	GENERIC_DAY	0	0	2011-05-28	2229	\N	3650	\N
129060	GENERIC_DAY	0	1	2011-01-11	2223	\N	3650	\N
129061	GENERIC_DAY	0	0	2011-07-02	2233	\N	3650	\N
129062	GENERIC_DAY	0	1	2011-02-15	2223	\N	3650	\N
129063	GENERIC_DAY	0	1	2011-08-22	2223	\N	3650	\N
129064	GENERIC_DAY	0	2	2011-05-06	2233	\N	3650	\N
129065	GENERIC_DAY	0	3	2010-11-04	2231	\N	3650	\N
129066	GENERIC_DAY	0	0	2011-08-10	2225	\N	3650	\N
129067	GENERIC_DAY	0	1	2010-10-21	2223	\N	3650	\N
129068	GENERIC_DAY	0	0	2010-09-25	2233	\N	3650	\N
129069	GENERIC_DAY	0	0	2011-12-10	2231	\N	3650	\N
129070	GENERIC_DAY	0	2	2011-10-11	2229	\N	3650	\N
129071	GENERIC_DAY	0	0	2012-01-14	2223	\N	3650	\N
129072	GENERIC_DAY	0	2	2011-05-17	2229	\N	3650	\N
129073	GENERIC_DAY	0	2	2011-01-25	2229	\N	3650	\N
129074	GENERIC_DAY	0	2	2011-10-03	2231	\N	3650	\N
129075	GENERIC_DAY	0	2	2011-08-26	2231	\N	3650	\N
129076	GENERIC_DAY	0	0	2010-11-30	2225	\N	3650	\N
129077	GENERIC_DAY	0	2	2010-11-02	2229	\N	3650	\N
129078	GENERIC_DAY	0	2	2010-10-05	2233	\N	3650	\N
129079	GENERIC_DAY	0	1	2010-12-20	2223	\N	3650	\N
129080	GENERIC_DAY	0	2	2011-10-06	2231	\N	3650	\N
129081	GENERIC_DAY	0	0	2011-07-03	2233	\N	3650	\N
129082	GENERIC_DAY	0	0	2011-06-04	2229	\N	3650	\N
129083	GENERIC_DAY	0	2	2010-10-15	2231	\N	3650	\N
129084	GENERIC_DAY	0	2	2011-12-02	2231	\N	3650	\N
129085	GENERIC_DAY	0	0	2011-11-13	2223	\N	3650	\N
129086	GENERIC_DAY	0	0	2011-05-15	2225	\N	3650	\N
129087	GENERIC_DAY	0	2	2010-09-15	2233	\N	3650	\N
129088	GENERIC_DAY	0	1	2011-12-20	2233	\N	3650	\N
129089	GENERIC_DAY	0	2	2011-11-02	2229	\N	3650	\N
129090	GENERIC_DAY	0	0	2011-01-13	2225	\N	3650	\N
129091	GENERIC_DAY	0	1	2011-05-23	2223	\N	3650	\N
129092	GENERIC_DAY	0	2	2011-08-23	2231	\N	3650	\N
129093	GENERIC_DAY	0	3	2011-05-17	2231	\N	3650	\N
129094	GENERIC_DAY	0	0	2010-08-22	2229	\N	3650	\N
129095	GENERIC_DAY	0	2	2011-09-22	2225	\N	3650	\N
129096	GENERIC_DAY	0	0	2012-01-22	2229	\N	3650	\N
129097	GENERIC_DAY	0	0	2010-09-05	2223	\N	3650	\N
129098	GENERIC_DAY	0	3	2011-03-23	2231	\N	3650	\N
129099	GENERIC_DAY	0	0	2011-09-04	2223	\N	3650	\N
129100	GENERIC_DAY	0	0	2011-02-05	2233	\N	3650	\N
129101	GENERIC_DAY	0	2	2011-10-07	2231	\N	3650	\N
129102	GENERIC_DAY	0	0	2011-09-24	2229	\N	3650	\N
129103	GENERIC_DAY	0	0	2010-10-23	2233	\N	3650	\N
129104	GENERIC_DAY	0	1	2011-11-28	2233	\N	3650	\N
129105	GENERIC_DAY	0	2	2011-05-19	2233	\N	3650	\N
129106	GENERIC_DAY	0	1	2011-04-15	2229	\N	3650	\N
129107	GENERIC_DAY	0	2	2011-11-02	2225	\N	3650	\N
129108	GENERIC_DAY	0	2	2010-10-18	2229	\N	3650	\N
129109	GENERIC_DAY	0	1	2010-11-18	2223	\N	3650	\N
129110	GENERIC_DAY	0	0	2010-12-13	2225	\N	3650	\N
129111	GENERIC_DAY	0	1	2011-08-26	2223	\N	3650	\N
129112	GENERIC_DAY	0	0	2011-06-19	2231	\N	3650	\N
129113	GENERIC_DAY	0	1	2011-05-24	2223	\N	3650	\N
129114	GENERIC_DAY	0	0	2010-10-17	2225	\N	3650	\N
129115	GENERIC_DAY	0	2	2011-11-02	2231	\N	3650	\N
129116	GENERIC_DAY	0	2	2010-10-11	2233	\N	3650	\N
129117	GENERIC_DAY	0	0	2010-10-02	2223	\N	3650	\N
129118	GENERIC_DAY	0	2	2010-09-21	2233	\N	3650	\N
129119	GENERIC_DAY	0	1	2010-08-31	2223	\N	3650	\N
190059	GENERIC_DAY	1	0	2010-08-01	2247	\N	139499	\N
190063	GENERIC_DAY	1	1	2010-03-15	2229	\N	139499	\N
190065	GENERIC_DAY	1	1	2010-08-11	2233	\N	139499	\N
190039	GENERIC_DAY	1	0	2010-03-20	2223	\N	139499	\N
190046	GENERIC_DAY	1	0	2010-04-04	2243	\N	139499	\N
190042	GENERIC_DAY	1	1	2010-08-02	2237	\N	139499	\N
190050	GENERIC_DAY	1	0	2010-04-21	2231	\N	139499	\N
190069	GENERIC_DAY	1	1	2010-05-28	2229	\N	139499	\N
190066	GENERIC_DAY	1	0	2010-04-14	2249	\N	139499	\N
190043	GENERIC_DAY	1	0	2010-04-11	2249	\N	139499	\N
190064	GENERIC_DAY	1	0	2010-05-20	2229	\N	139499	\N
190070	GENERIC_DAY	1	1	2010-04-05	2251	\N	139499	\N
190038	GENERIC_DAY	1	1	2010-03-30	2245	\N	139499	\N
190051	GENERIC_DAY	1	1	2010-04-05	2223	\N	139499	\N
190067	GENERIC_DAY	1	0	2010-03-29	2247	\N	139499	\N
190035	GENERIC_DAY	1	0	2010-04-16	2251	\N	139499	\N
190053	GENERIC_DAY	1	1	2010-06-04	2245	\N	139499	\N
190045	GENERIC_DAY	1	0	2010-08-21	2237	\N	139499	\N
190041	GENERIC_DAY	1	0	2010-05-08	2231	\N	139499	\N
190052	GENERIC_DAY	1	0	2010-02-22	2249	\N	139499	\N
190072	GENERIC_DAY	1	1	2010-02-18	2245	\N	139499	\N
190054	GENERIC_DAY	1	0	2010-05-16	2243	\N	139499	\N
190068	GENERIC_DAY	1	0	2010-02-18	2239	\N	139499	\N
190060	GENERIC_DAY	1	1	2010-04-09	2233	\N	139499	\N
190071	GENERIC_DAY	1	1	2010-08-06	2233	\N	139499	\N
190047	GENERIC_DAY	1	1	2010-03-29	2229	\N	139499	\N
190033	GENERIC_DAY	1	1	2010-04-20	2249	\N	139499	\N
190032	GENERIC_DAY	1	0	2010-07-24	2243	\N	139499	\N
190058	GENERIC_DAY	1	0	2010-06-12	2235	\N	139499	\N
190061	GENERIC_DAY	1	0	2010-06-15	2231	\N	139499	\N
188414	GENERIC_DAY	1	0	2010-05-06	2229	\N	139499	\N
189550	GENERIC_DAY	1	1	2010-06-17	2247	\N	139499	\N
188428	GENERIC_DAY	1	0	2010-08-14	2235	\N	139499	\N
187637	GENERIC_DAY	1	1	2010-06-10	2251	\N	139499	\N
187948	GENERIC_DAY	1	0	2010-03-02	2243	\N	139499	\N
188677	GENERIC_DAY	1	0	2010-08-02	2229	\N	139499	\N
189394	GENERIC_DAY	1	0	2010-05-11	2241	\N	139499	\N
189605	GENERIC_DAY	1	0	2010-02-28	2237	\N	139499	\N
189551	GENERIC_DAY	1	0	2010-02-18	2235	\N	139499	\N
187957	GENERIC_DAY	1	0	2010-08-20	2225	\N	139499	\N
188449	GENERIC_DAY	1	1	2010-04-20	2251	\N	139499	\N
189751	GENERIC_DAY	1	0	2010-02-24	2247	\N	139499	\N
187928	GENERIC_DAY	1	1	2010-05-11	2243	\N	139499	\N
187701	GENERIC_DAY	1	0	2010-05-01	2225	\N	139499	\N
187442	GENERIC_DAY	1	1	2010-06-09	2237	\N	139499	\N
188326	GENERIC_DAY	1	0	2010-02-21	2231	\N	139499	\N
188878	GENERIC_DAY	1	1	2010-06-23	2233	\N	139499	\N
228936	GENERIC_DAY	1	0	2010-04-23	2233	\N	139489	\N
228937	GENERIC_DAY	1	0	2010-06-20	2231	\N	139489	\N
228938	GENERIC_DAY	1	0	2010-04-25	2237	\N	139489	\N
228939	GENERIC_DAY	1	1	2010-06-18	2249	\N	139489	\N
228940	GENERIC_DAY	1	0	2010-07-25	2241	\N	139489	\N
228941	GENERIC_DAY	1	0	2010-08-16	2239	\N	139489	\N
228942	GENERIC_DAY	1	0	2010-07-22	2245	\N	139489	\N
228943	GENERIC_DAY	1	0	2010-06-01	2245	\N	139489	\N
228944	GENERIC_DAY	1	0	2010-07-04	2251	\N	139489	\N
228945	GENERIC_DAY	1	1	2010-02-26	2251	\N	139489	\N
228946	GENERIC_DAY	1	0	2010-03-26	2247	\N	139489	\N
228947	GENERIC_DAY	1	0	2010-04-04	2251	\N	139489	\N
228948	GENERIC_DAY	1	0	2010-04-01	2243	\N	139489	\N
228949	GENERIC_DAY	1	0	2010-03-03	2243	\N	139489	\N
228950	GENERIC_DAY	1	1	2010-04-05	2223	\N	139489	\N
228951	GENERIC_DAY	1	1	2010-06-09	2223	\N	139489	\N
228952	GENERIC_DAY	1	0	2010-05-01	2239	\N	139489	\N
228953	GENERIC_DAY	1	0	2010-05-10	2237	\N	139489	\N
228954	GENERIC_DAY	1	1	2010-07-21	2235	\N	139489	\N
228955	GENERIC_DAY	1	0	2010-03-06	2229	\N	139489	\N
228956	GENERIC_DAY	1	1	2010-05-04	2239	\N	139489	\N
228957	GENERIC_DAY	1	0	2010-03-18	2231	\N	139489	\N
228958	GENERIC_DAY	1	0	2010-04-23	2229	\N	139489	\N
228959	GENERIC_DAY	1	0	2010-08-09	2243	\N	139489	\N
228960	GENERIC_DAY	1	0	2010-05-22	2251	\N	139489	\N
228961	GENERIC_DAY	1	1	2010-08-17	2235	\N	139489	\N
228962	GENERIC_DAY	1	0	2010-03-13	2245	\N	139489	\N
228963	GENERIC_DAY	1	1	2010-08-17	2243	\N	139489	\N
228964	GENERIC_DAY	1	1	2010-03-16	2229	\N	139489	\N
228965	GENERIC_DAY	1	0	2010-06-16	2225	\N	139489	\N
228966	GENERIC_DAY	1	1	2010-07-07	2249	\N	139489	\N
228967	GENERIC_DAY	1	0	2010-03-06	2223	\N	139489	\N
228968	GENERIC_DAY	1	1	2010-08-18	2249	\N	139489	\N
228969	GENERIC_DAY	1	1	2010-03-16	2251	\N	139489	\N
228970	GENERIC_DAY	1	0	2010-03-20	2237	\N	139489	\N
228971	GENERIC_DAY	1	0	2010-06-20	2241	\N	139489	\N
228972	GENERIC_DAY	1	0	2010-07-24	2245	\N	139489	\N
228973	GENERIC_DAY	1	0	2010-08-01	2225	\N	139489	\N
228974	GENERIC_DAY	1	0	2010-06-12	2233	\N	139489	\N
228975	GENERIC_DAY	1	0	2010-04-18	2229	\N	139489	\N
228976	GENERIC_DAY	1	1	2010-07-26	2231	\N	139489	\N
228977	GENERIC_DAY	1	1	2010-05-06	2231	\N	139489	\N
228978	GENERIC_DAY	1	0	2010-05-12	2245	\N	139489	\N
228979	GENERIC_DAY	1	0	2010-06-19	2233	\N	139489	\N
228980	GENERIC_DAY	1	0	2010-06-19	2239	\N	139489	\N
228981	GENERIC_DAY	1	0	2010-07-19	2233	\N	139489	\N
228982	GENERIC_DAY	1	0	2010-05-02	2251	\N	139489	\N
228983	GENERIC_DAY	1	1	2010-03-17	2229	\N	139489	\N
228984	GENERIC_DAY	1	1	2010-08-23	2245	\N	139489	\N
228985	GENERIC_DAY	1	0	2010-04-06	2243	\N	139489	\N
228986	GENERIC_DAY	1	1	2010-04-26	2241	\N	139489	\N
228987	GENERIC_DAY	1	0	2010-03-21	2251	\N	139489	\N
228988	GENERIC_DAY	1	0	2010-02-21	2245	\N	139489	\N
228989	GENERIC_DAY	1	1	2010-07-29	2239	\N	139489	\N
228990	GENERIC_DAY	1	0	2010-06-28	2247	\N	139489	\N
228991	GENERIC_DAY	1	0	2010-07-22	2225	\N	139489	\N
228992	GENERIC_DAY	1	0	2010-08-21	2243	\N	139489	\N
228993	GENERIC_DAY	1	0	2010-07-02	2233	\N	139489	\N
228994	GENERIC_DAY	1	1	2010-02-25	2251	\N	139489	\N
228995	GENERIC_DAY	1	0	2010-05-31	2237	\N	139489	\N
228996	GENERIC_DAY	1	0	2010-03-02	2243	\N	139489	\N
228997	GENERIC_DAY	1	1	2010-04-23	2243	\N	139489	\N
228998	GENERIC_DAY	1	0	2010-03-05	2239	\N	139489	\N
228999	GENERIC_DAY	1	1	2010-04-07	2237	\N	139489	\N
229000	GENERIC_DAY	1	0	2010-08-03	2225	\N	139489	\N
229001	GENERIC_DAY	1	0	2010-04-11	2251	\N	139489	\N
229002	GENERIC_DAY	1	0	2010-06-19	2237	\N	139489	\N
229003	GENERIC_DAY	1	1	2010-05-10	2241	\N	139489	\N
229004	GENERIC_DAY	1	0	2010-05-01	2225	\N	139489	\N
229005	GENERIC_DAY	1	0	2010-06-28	2225	\N	139489	\N
229006	GENERIC_DAY	1	0	2010-04-19	2247	\N	139489	\N
229007	GENERIC_DAY	1	1	2010-06-30	2235	\N	139489	\N
229008	GENERIC_DAY	1	1	2010-05-18	2241	\N	139489	\N
229009	GENERIC_DAY	1	0	2010-05-23	2247	\N	139489	\N
229010	GENERIC_DAY	1	1	2010-04-16	2249	\N	139489	\N
229011	GENERIC_DAY	1	0	2010-03-31	2249	\N	139489	\N
229012	GENERIC_DAY	1	0	2010-04-03	2223	\N	139489	\N
229013	GENERIC_DAY	1	0	2010-03-26	2225	\N	139489	\N
229014	GENERIC_DAY	1	0	2010-06-30	2243	\N	139489	\N
229015	GENERIC_DAY	1	1	2010-05-24	2229	\N	139489	\N
229016	GENERIC_DAY	1	1	2010-05-21	2247	\N	139489	\N
229017	GENERIC_DAY	1	1	2010-06-11	2251	\N	139489	\N
229018	GENERIC_DAY	1	1	2010-07-29	2235	\N	139489	\N
229019	GENERIC_DAY	1	0	2010-05-26	2233	\N	139489	\N
229020	GENERIC_DAY	1	0	2010-08-15	2249	\N	139489	\N
229021	GENERIC_DAY	1	0	2010-07-16	2225	\N	139489	\N
229022	GENERIC_DAY	1	1	2010-03-03	2241	\N	139489	\N
229023	GENERIC_DAY	1	0	2010-06-19	2241	\N	139489	\N
229024	GENERIC_DAY	1	0	2010-07-23	2223	\N	139489	\N
229025	GENERIC_DAY	1	1	2010-05-28	2247	\N	139489	\N
229026	GENERIC_DAY	1	1	2010-03-05	2237	\N	139489	\N
229027	GENERIC_DAY	1	0	2010-07-20	2243	\N	139489	\N
229028	GENERIC_DAY	1	0	2010-07-14	2225	\N	139489	\N
229029	GENERIC_DAY	1	0	2010-03-04	2235	\N	139489	\N
229030	GENERIC_DAY	1	1	2010-05-13	2249	\N	139489	\N
229031	GENERIC_DAY	1	1	2010-04-13	2223	\N	139489	\N
229032	GENERIC_DAY	1	0	2010-06-23	2225	\N	139489	\N
229033	GENERIC_DAY	1	0	2010-05-23	2225	\N	139489	\N
229034	GENERIC_DAY	1	1	2010-06-25	2247	\N	139489	\N
229035	GENERIC_DAY	1	0	2010-04-15	2225	\N	139489	\N
229036	GENERIC_DAY	1	0	2010-08-13	2231	\N	139489	\N
229037	GENERIC_DAY	1	0	2010-07-23	2233	\N	139489	\N
229038	GENERIC_DAY	1	1	2010-06-02	2251	\N	139489	\N
229039	GENERIC_DAY	1	1	2010-06-28	2235	\N	139489	\N
229040	GENERIC_DAY	1	1	2010-06-15	2249	\N	139489	\N
229041	GENERIC_DAY	1	1	2010-07-28	2239	\N	139489	\N
229042	GENERIC_DAY	1	1	2010-03-01	2241	\N	139489	\N
229043	GENERIC_DAY	1	2	2010-02-25	2237	\N	139489	\N
229044	GENERIC_DAY	1	0	2010-03-20	2243	\N	139489	\N
229045	GENERIC_DAY	1	0	2010-07-11	2231	\N	139489	\N
229046	GENERIC_DAY	1	0	2010-08-24	2245	\N	139489	\N
229047	GENERIC_DAY	1	1	2010-07-28	2229	\N	139489	\N
229048	GENERIC_DAY	1	1	2010-07-22	2223	\N	139489	\N
229049	GENERIC_DAY	1	0	2010-06-13	2233	\N	139489	\N
229050	GENERIC_DAY	1	1	2010-04-05	2229	\N	139489	\N
229051	GENERIC_DAY	1	0	2010-06-18	2233	\N	139489	\N
229052	GENERIC_DAY	1	0	2010-03-09	2237	\N	139489	\N
229053	GENERIC_DAY	1	1	2010-06-29	2231	\N	139489	\N
229054	GENERIC_DAY	1	0	2010-05-05	2247	\N	139489	\N
229055	GENERIC_DAY	1	0	2010-07-20	2245	\N	139489	\N
229056	GENERIC_DAY	1	0	2010-02-16	2225	\N	139489	\N
229057	GENERIC_DAY	1	1	2010-05-06	2229	\N	139489	\N
229058	GENERIC_DAY	1	1	2010-04-09	2241	\N	139489	\N
229059	GENERIC_DAY	1	0	2010-03-14	2233	\N	139489	\N
229060	GENERIC_DAY	1	0	2010-06-26	2243	\N	139489	\N
229061	GENERIC_DAY	1	0	2010-08-11	2223	\N	139489	\N
229062	GENERIC_DAY	1	0	2010-04-24	2225	\N	139489	\N
229063	GENERIC_DAY	1	0	2010-02-22	2225	\N	139489	\N
229064	GENERIC_DAY	1	0	2010-08-06	2229	\N	139489	\N
229065	GENERIC_DAY	1	0	2010-05-09	2243	\N	139489	\N
229066	GENERIC_DAY	1	1	2010-08-05	2229	\N	139489	\N
229067	GENERIC_DAY	1	0	2010-03-19	2233	\N	139489	\N
229068	GENERIC_DAY	1	2	2010-03-31	2237	\N	139489	\N
229069	GENERIC_DAY	1	0	2010-05-23	2245	\N	139489	\N
229070	GENERIC_DAY	1	0	2010-07-17	2249	\N	139489	\N
229071	GENERIC_DAY	1	0	2010-08-24	2229	\N	139489	\N
229072	GENERIC_DAY	1	0	2010-07-04	2239	\N	139489	\N
229073	GENERIC_DAY	1	1	2010-07-01	2249	\N	139489	\N
229074	GENERIC_DAY	1	0	2010-05-23	2235	\N	139489	\N
229075	GENERIC_DAY	1	0	2010-07-18	2229	\N	139489	\N
229076	GENERIC_DAY	1	0	2010-07-31	2251	\N	139489	\N
229077	GENERIC_DAY	1	0	2010-04-10	2231	\N	139489	\N
229078	GENERIC_DAY	1	0	2010-08-17	2229	\N	139489	\N
229079	GENERIC_DAY	1	0	2010-07-28	2245	\N	139489	\N
229080	GENERIC_DAY	1	0	2010-07-10	2231	\N	139489	\N
229081	GENERIC_DAY	1	0	2010-03-23	2249	\N	139489	\N
229082	GENERIC_DAY	1	1	2010-05-12	2229	\N	139489	\N
229083	GENERIC_DAY	1	0	2010-04-14	2225	\N	139489	\N
229084	GENERIC_DAY	1	0	2010-02-18	2239	\N	139489	\N
229085	GENERIC_DAY	1	0	2010-05-01	2231	\N	139489	\N
229086	GENERIC_DAY	1	1	2010-07-06	2235	\N	139489	\N
229087	GENERIC_DAY	1	0	2010-06-19	2229	\N	139489	\N
229088	GENERIC_DAY	1	1	2010-06-28	2249	\N	139489	\N
229089	GENERIC_DAY	1	2	2010-02-17	2245	\N	139489	\N
229090	GENERIC_DAY	1	1	2010-04-16	2239	\N	139489	\N
229091	GENERIC_DAY	1	0	2010-04-09	2225	\N	139489	\N
229092	GENERIC_DAY	1	1	2010-03-02	2241	\N	139489	\N
229093	GENERIC_DAY	1	1	2010-08-10	2235	\N	139489	\N
229094	GENERIC_DAY	1	0	2010-05-01	2229	\N	139489	\N
229095	GENERIC_DAY	1	1	2010-08-02	2239	\N	139489	\N
229096	GENERIC_DAY	1	0	2010-07-09	2225	\N	139489	\N
229097	GENERIC_DAY	1	0	2010-04-23	2245	\N	139489	\N
229098	GENERIC_DAY	1	0	2010-06-01	2225	\N	139489	\N
229099	GENERIC_DAY	1	0	2010-06-26	2231	\N	139489	\N
229100	GENERIC_DAY	1	1	2010-05-28	2235	\N	139489	\N
229101	GENERIC_DAY	1	0	2010-05-04	2245	\N	139489	\N
229102	GENERIC_DAY	1	0	2010-02-21	2247	\N	139489	\N
229103	GENERIC_DAY	1	0	2010-03-25	2243	\N	139489	\N
229104	GENERIC_DAY	1	0	2010-07-20	2225	\N	139489	\N
229105	GENERIC_DAY	1	1	2010-08-10	2249	\N	139489	\N
229106	GENERIC_DAY	1	0	2010-08-17	2223	\N	139489	\N
229107	GENERIC_DAY	1	0	2010-04-17	2243	\N	139489	\N
229108	GENERIC_DAY	1	0	2010-08-07	2251	\N	139489	\N
229109	GENERIC_DAY	1	0	2010-03-29	2243	\N	139489	\N
229110	GENERIC_DAY	1	0	2010-05-16	2237	\N	139489	\N
229111	GENERIC_DAY	1	2	2010-02-18	2245	\N	139489	\N
229112	GENERIC_DAY	1	1	2010-05-13	2239	\N	139489	\N
229113	GENERIC_DAY	1	1	2010-08-06	2251	\N	139489	\N
229114	GENERIC_DAY	1	0	2010-06-12	2237	\N	139489	\N
229115	GENERIC_DAY	1	0	2010-07-10	2225	\N	139489	\N
229116	GENERIC_DAY	1	0	2010-04-27	2225	\N	139489	\N
229117	GENERIC_DAY	1	0	2010-08-21	2239	\N	139489	\N
229118	GENERIC_DAY	1	0	2010-07-10	2233	\N	139489	\N
229119	GENERIC_DAY	1	1	2010-08-11	2235	\N	139489	\N
229120	GENERIC_DAY	1	1	2010-07-20	2229	\N	139489	\N
229121	GENERIC_DAY	1	0	2010-08-17	2233	\N	139489	\N
229122	GENERIC_DAY	1	1	2010-02-26	2237	\N	139489	\N
229123	GENERIC_DAY	1	0	2010-02-17	2235	\N	139489	\N
229124	GENERIC_DAY	1	0	2010-04-24	2237	\N	139489	\N
229125	GENERIC_DAY	1	0	2010-03-21	2243	\N	139489	\N
229126	GENERIC_DAY	1	1	2010-07-28	2249	\N	139489	\N
229127	GENERIC_DAY	1	0	2010-04-11	2239	\N	139489	\N
229128	GENERIC_DAY	1	1	2010-02-19	2223	\N	139489	\N
229129	GENERIC_DAY	1	1	2010-08-11	2243	\N	139489	\N
229130	GENERIC_DAY	1	0	2010-04-01	2245	\N	139489	\N
229131	GENERIC_DAY	1	0	2010-03-07	2229	\N	139489	\N
229132	GENERIC_DAY	1	0	2010-07-21	2233	\N	139489	\N
229133	GENERIC_DAY	1	0	2010-06-05	2239	\N	139489	\N
229134	GENERIC_DAY	1	1	2010-04-29	2231	\N	139489	\N
229135	GENERIC_DAY	1	1	2010-04-13	2251	\N	139489	\N
229136	GENERIC_DAY	1	0	2010-04-16	2225	\N	139489	\N
229137	GENERIC_DAY	1	1	2010-08-18	2247	\N	139489	\N
229138	GENERIC_DAY	1	1	2010-06-08	2223	\N	139489	\N
229139	GENERIC_DAY	1	0	2010-07-06	2233	\N	139489	\N
229140	GENERIC_DAY	1	0	2010-04-18	2241	\N	139489	\N
229141	GENERIC_DAY	1	1	2010-04-29	2223	\N	139489	\N
229142	GENERIC_DAY	1	0	2010-05-15	2245	\N	139489	\N
229143	GENERIC_DAY	1	1	2010-04-20	2249	\N	139489	\N
229144	GENERIC_DAY	1	1	2010-06-17	2231	\N	139489	\N
229145	GENERIC_DAY	1	0	2010-06-04	2245	\N	139489	\N
229146	GENERIC_DAY	1	0	2010-05-01	2235	\N	139489	\N
229147	GENERIC_DAY	1	1	2010-04-12	2231	\N	139489	\N
229148	GENERIC_DAY	1	0	2010-04-04	2241	\N	139489	\N
229149	GENERIC_DAY	1	0	2010-07-09	2229	\N	139489	\N
229150	GENERIC_DAY	1	0	2010-06-26	2247	\N	139489	\N
229151	GENERIC_DAY	1	0	2010-05-13	2245	\N	139489	\N
229152	GENERIC_DAY	1	0	2010-04-10	2235	\N	139489	\N
229153	GENERIC_DAY	1	0	2010-08-14	2231	\N	139489	\N
229154	GENERIC_DAY	1	0	2010-06-24	2233	\N	139489	\N
229155	GENERIC_DAY	1	1	2010-04-29	2241	\N	139489	\N
229156	GENERIC_DAY	1	0	2010-06-16	2245	\N	139489	\N
229157	GENERIC_DAY	1	0	2010-04-24	2245	\N	139489	\N
229158	GENERIC_DAY	1	1	2010-07-16	2243	\N	139489	\N
229159	GENERIC_DAY	1	0	2010-08-20	2249	\N	139489	\N
229160	GENERIC_DAY	1	1	2010-06-02	2223	\N	139489	\N
229161	GENERIC_DAY	1	1	2010-03-15	2241	\N	139489	\N
229162	GENERIC_DAY	1	0	2010-05-11	2237	\N	139489	\N
229163	GENERIC_DAY	1	1	2010-07-28	2235	\N	139489	\N
229164	GENERIC_DAY	1	1	2010-07-16	2249	\N	139489	\N
229165	GENERIC_DAY	1	0	2010-08-01	2251	\N	139489	\N
229166	GENERIC_DAY	1	1	2010-07-12	2231	\N	139489	\N
229167	GENERIC_DAY	1	1	2010-05-20	2239	\N	139489	\N
229168	GENERIC_DAY	1	0	2010-07-24	2247	\N	139489	\N
229169	GENERIC_DAY	1	1	2010-08-11	2247	\N	139489	\N
229170	GENERIC_DAY	1	0	2010-08-01	2239	\N	139489	\N
229171	GENERIC_DAY	1	2	2010-03-08	2251	\N	139489	\N
229172	GENERIC_DAY	1	0	2010-03-22	2233	\N	139489	\N
229173	GENERIC_DAY	1	0	2010-06-20	2247	\N	139489	\N
229174	GENERIC_DAY	1	0	2010-03-14	2235	\N	139489	\N
229175	GENERIC_DAY	1	1	2010-06-07	2223	\N	139489	\N
229176	GENERIC_DAY	1	1	2010-03-03	2223	\N	139489	\N
229177	GENERIC_DAY	1	1	2010-06-29	2229	\N	139489	\N
229178	GENERIC_DAY	1	0	2010-03-24	2243	\N	139489	\N
229179	GENERIC_DAY	1	1	2010-03-25	2229	\N	139489	\N
229180	GENERIC_DAY	1	1	2010-05-13	2231	\N	139489	\N
229181	GENERIC_DAY	1	0	2010-07-25	2223	\N	139489	\N
229182	GENERIC_DAY	1	1	2010-04-26	2231	\N	139489	\N
229183	GENERIC_DAY	1	0	2010-02-18	2243	\N	139489	\N
229184	GENERIC_DAY	1	1	2010-05-06	2235	\N	139489	\N
229185	GENERIC_DAY	1	0	2010-07-31	2229	\N	139489	\N
229186	GENERIC_DAY	1	0	2010-04-04	2233	\N	139489	\N
229187	GENERIC_DAY	1	0	2010-04-18	2243	\N	139489	\N
229188	GENERIC_DAY	1	0	2010-02-16	2239	\N	139489	\N
229189	GENERIC_DAY	1	0	2010-06-13	2229	\N	139489	\N
229190	GENERIC_DAY	1	1	2010-05-10	2239	\N	139489	\N
229191	GENERIC_DAY	1	1	2010-07-12	2249	\N	139489	\N
229192	GENERIC_DAY	1	0	2010-03-07	2235	\N	139489	\N
229193	GENERIC_DAY	1	1	2010-06-08	2251	\N	139489	\N
229194	GENERIC_DAY	1	0	2010-05-17	2233	\N	139489	\N
229195	GENERIC_DAY	1	1	2010-08-23	2243	\N	139489	\N
229196	GENERIC_DAY	1	0	2010-03-02	2225	\N	139489	\N
229197	GENERIC_DAY	1	0	2010-02-25	2239	\N	139489	\N
229198	GENERIC_DAY	1	0	2010-05-22	2237	\N	139489	\N
229199	GENERIC_DAY	1	0	2010-08-03	2233	\N	139489	\N
229200	GENERIC_DAY	1	0	2010-05-11	2233	\N	139489	\N
229201	GENERIC_DAY	1	1	2010-07-08	2241	\N	139489	\N
229202	GENERIC_DAY	1	0	2010-05-08	2251	\N	139489	\N
229203	GENERIC_DAY	1	1	2010-06-24	2231	\N	139489	\N
229204	GENERIC_DAY	1	0	2010-06-29	2247	\N	139489	\N
229205	GENERIC_DAY	1	1	2010-07-20	2241	\N	139489	\N
229206	GENERIC_DAY	1	1	2010-05-03	2235	\N	139489	\N
229207	GENERIC_DAY	1	0	2010-06-14	2243	\N	139489	\N
229208	GENERIC_DAY	1	1	2010-04-13	2229	\N	139489	\N
229209	GENERIC_DAY	1	1	2010-03-17	2241	\N	139489	\N
229210	GENERIC_DAY	1	0	2010-08-13	2225	\N	139489	\N
229211	GENERIC_DAY	1	1	2010-04-23	2235	\N	139489	\N
229212	GENERIC_DAY	1	0	2010-04-10	2233	\N	139489	\N
229213	GENERIC_DAY	1	0	2010-07-02	2241	\N	139489	\N
229214	GENERIC_DAY	1	0	2010-08-22	2235	\N	139489	\N
229215	GENERIC_DAY	1	0	2010-04-05	2249	\N	139489	\N
229216	GENERIC_DAY	1	0	2010-05-23	2237	\N	139489	\N
229217	GENERIC_DAY	1	1	2010-04-19	2239	\N	139489	\N
229218	GENERIC_DAY	1	1	2010-06-10	2239	\N	139489	\N
229219	GENERIC_DAY	1	0	2010-06-02	2245	\N	139489	\N
229220	GENERIC_DAY	1	0	2010-03-10	2249	\N	139489	\N
229221	GENERIC_DAY	1	0	2010-08-08	2229	\N	139489	\N
229222	GENERIC_DAY	1	0	2010-08-12	2239	\N	139489	\N
229223	GENERIC_DAY	1	0	2010-03-17	2249	\N	139489	\N
229224	GENERIC_DAY	1	1	2010-04-22	2241	\N	139489	\N
229225	GENERIC_DAY	1	1	2010-07-08	2249	\N	139489	\N
229226	GENERIC_DAY	1	1	2010-03-10	2229	\N	139489	\N
229227	GENERIC_DAY	1	1	2010-06-15	2239	\N	139489	\N
229228	GENERIC_DAY	1	0	2010-04-04	2239	\N	139489	\N
229229	GENERIC_DAY	1	0	2010-07-04	2223	\N	139489	\N
229230	GENERIC_DAY	1	0	2010-07-17	2223	\N	139489	\N
229231	GENERIC_DAY	1	1	2010-05-11	2251	\N	139489	\N
229232	GENERIC_DAY	1	1	2010-07-09	2247	\N	139489	\N
229233	GENERIC_DAY	1	1	2010-08-04	2231	\N	139489	\N
229234	GENERIC_DAY	1	2	2010-03-16	2237	\N	139489	\N
229235	GENERIC_DAY	1	0	2010-06-12	2241	\N	139489	\N
229236	GENERIC_DAY	1	0	2010-05-01	2223	\N	139489	\N
229237	GENERIC_DAY	1	0	2010-05-14	2231	\N	139489	\N
229238	GENERIC_DAY	1	0	2010-08-22	2237	\N	139489	\N
229239	GENERIC_DAY	1	1	2010-04-21	2235	\N	139489	\N
229240	GENERIC_DAY	1	0	2010-02-27	2245	\N	139489	\N
229241	GENERIC_DAY	1	0	2010-02-24	2243	\N	139489	\N
229242	GENERIC_DAY	1	0	2010-02-18	2231	\N	139489	\N
229243	GENERIC_DAY	1	1	2010-08-05	2241	\N	139489	\N
229244	GENERIC_DAY	1	0	2010-07-19	2237	\N	139489	\N
229245	GENERIC_DAY	1	0	2010-05-15	2247	\N	139489	\N
229246	GENERIC_DAY	1	0	2010-08-21	2249	\N	139489	\N
229247	GENERIC_DAY	1	1	2010-05-03	2251	\N	139489	\N
229248	GENERIC_DAY	1	1	2010-04-12	2223	\N	139489	\N
229249	GENERIC_DAY	1	0	2010-04-03	2241	\N	139489	\N
229250	GENERIC_DAY	1	0	2010-03-19	2223	\N	139489	\N
229251	GENERIC_DAY	1	1	2010-06-22	2229	\N	139489	\N
229252	GENERIC_DAY	1	0	2010-07-11	2233	\N	139489	\N
229253	GENERIC_DAY	1	1	2010-08-10	2239	\N	139489	\N
229254	GENERIC_DAY	1	0	2010-06-16	2243	\N	139489	\N
229255	GENERIC_DAY	1	0	2010-08-16	2231	\N	139489	\N
229256	GENERIC_DAY	1	2	2010-02-24	2245	\N	139489	\N
229257	GENERIC_DAY	1	0	2010-06-13	2225	\N	139489	\N
229258	GENERIC_DAY	1	0	2010-03-24	2239	\N	139489	\N
229259	GENERIC_DAY	1	0	2010-05-02	2225	\N	139489	\N
229260	GENERIC_DAY	1	0	2010-04-02	2239	\N	139489	\N
229261	GENERIC_DAY	1	0	2010-05-02	2237	\N	139489	\N
229262	GENERIC_DAY	1	0	2010-06-09	2247	\N	139489	\N
229263	GENERIC_DAY	1	0	2010-07-05	2245	\N	139489	\N
229264	GENERIC_DAY	1	0	2010-03-12	2225	\N	139489	\N
229265	GENERIC_DAY	1	0	2010-03-21	2233	\N	139489	\N
229266	GENERIC_DAY	1	1	2010-08-09	2223	\N	139489	\N
229267	GENERIC_DAY	1	0	2010-07-30	2229	\N	139489	\N
229268	GENERIC_DAY	1	1	2010-06-28	2241	\N	139489	\N
229269	GENERIC_DAY	1	0	2010-04-20	2247	\N	139489	\N
229270	GENERIC_DAY	1	1	2010-05-03	2229	\N	139489	\N
229271	GENERIC_DAY	1	0	2010-04-03	2233	\N	139489	\N
229272	GENERIC_DAY	1	0	2010-08-20	2233	\N	139489	\N
229273	GENERIC_DAY	1	0	2010-04-27	2243	\N	139489	\N
229274	GENERIC_DAY	1	0	2010-07-03	2243	\N	139489	\N
229275	GENERIC_DAY	1	0	2010-04-04	2223	\N	139489	\N
229276	GENERIC_DAY	1	1	2010-06-21	2235	\N	139489	\N
229277	GENERIC_DAY	1	0	2010-04-03	2231	\N	139489	\N
229278	GENERIC_DAY	1	0	2010-06-17	2243	\N	139489	\N
229279	GENERIC_DAY	1	0	2010-02-21	2231	\N	139489	\N
229280	GENERIC_DAY	1	0	2010-08-07	2243	\N	139489	\N
229281	GENERIC_DAY	1	0	2010-06-10	2225	\N	139489	\N
229282	GENERIC_DAY	1	0	2010-08-12	2231	\N	139489	\N
229283	GENERIC_DAY	1	1	2010-07-08	2239	\N	139489	\N
229284	GENERIC_DAY	1	0	2010-07-04	2249	\N	139489	\N
229285	GENERIC_DAY	1	0	2010-03-27	2225	\N	139489	\N
229286	GENERIC_DAY	1	1	2010-03-05	2241	\N	139489	\N
229287	GENERIC_DAY	1	0	2010-08-04	2237	\N	139489	\N
229288	GENERIC_DAY	1	1	2010-07-16	2247	\N	139489	\N
229289	GENERIC_DAY	1	0	2010-06-02	2243	\N	139489	\N
229290	GENERIC_DAY	1	0	2010-07-23	2237	\N	139489	\N
229291	GENERIC_DAY	1	1	2010-07-14	2239	\N	139489	\N
229292	GENERIC_DAY	1	0	2010-06-24	2225	\N	139489	\N
229293	GENERIC_DAY	1	1	2010-08-04	2241	\N	139489	\N
229294	GENERIC_DAY	1	1	2010-04-15	2241	\N	139489	\N
229295	GENERIC_DAY	1	0	2010-05-19	2237	\N	139489	\N
229296	GENERIC_DAY	1	1	2010-06-14	2231	\N	139489	\N
229297	GENERIC_DAY	1	0	2010-06-06	2249	\N	139489	\N
229298	GENERIC_DAY	1	1	2010-05-11	2231	\N	139489	\N
229299	GENERIC_DAY	1	0	2010-07-10	2229	\N	139489	\N
229300	GENERIC_DAY	1	0	2010-08-06	2223	\N	139489	\N
229301	GENERIC_DAY	1	0	2010-04-08	2247	\N	139489	\N
229302	GENERIC_DAY	1	0	2010-02-20	2235	\N	139489	\N
229303	GENERIC_DAY	1	0	2010-04-07	2247	\N	139489	\N
229304	GENERIC_DAY	1	0	2010-02-18	2233	\N	139489	\N
229305	GENERIC_DAY	1	0	2010-06-25	2229	\N	139489	\N
229306	GENERIC_DAY	1	0	2010-07-02	2245	\N	139489	\N
229307	GENERIC_DAY	1	0	2010-03-22	2235	\N	139489	\N
229308	GENERIC_DAY	1	0	2010-04-28	2237	\N	139489	\N
229309	GENERIC_DAY	1	0	2010-03-28	2233	\N	139489	\N
229310	GENERIC_DAY	1	0	2010-07-29	2233	\N	139489	\N
229311	GENERIC_DAY	1	0	2010-08-15	2233	\N	139489	\N
229312	GENERIC_DAY	1	0	2010-03-09	2239	\N	139489	\N
229313	GENERIC_DAY	1	1	2010-04-27	2231	\N	139489	\N
229314	GENERIC_DAY	1	0	2010-06-06	2231	\N	139489	\N
229315	GENERIC_DAY	1	0	2010-05-08	2229	\N	139489	\N
229316	GENERIC_DAY	1	1	2010-08-05	2235	\N	139489	\N
229317	GENERIC_DAY	1	0	2010-04-04	2249	\N	139489	\N
229318	GENERIC_DAY	1	1	2010-05-24	2235	\N	139489	\N
229319	GENERIC_DAY	1	0	2010-08-21	2225	\N	139489	\N
229320	GENERIC_DAY	1	1	2010-07-19	2231	\N	139489	\N
229321	GENERIC_DAY	1	1	2010-06-25	2239	\N	139489	\N
229322	GENERIC_DAY	1	0	2010-05-26	2225	\N	139489	\N
229323	GENERIC_DAY	1	0	2010-04-28	2225	\N	139489	\N
229324	GENERIC_DAY	1	0	2010-07-25	2239	\N	139489	\N
229325	GENERIC_DAY	1	0	2010-03-17	2225	\N	139489	\N
229326	GENERIC_DAY	1	2	2010-03-17	2237	\N	139489	\N
229327	GENERIC_DAY	1	1	2010-03-31	2229	\N	139489	\N
229328	GENERIC_DAY	1	1	2010-06-17	2249	\N	139489	\N
229329	GENERIC_DAY	1	1	2010-07-01	2223	\N	139489	\N
229330	GENERIC_DAY	1	0	2010-08-24	2235	\N	139489	\N
229331	GENERIC_DAY	1	0	2010-06-27	2247	\N	139489	\N
229332	GENERIC_DAY	1	1	2010-06-30	2223	\N	139489	\N
229333	GENERIC_DAY	1	1	2010-07-09	2249	\N	139489	\N
229334	GENERIC_DAY	1	1	2010-07-29	2241	\N	139489	\N
229335	GENERIC_DAY	1	2	2010-03-18	2245	\N	139489	\N
229336	GENERIC_DAY	1	0	2010-04-05	2225	\N	139489	\N
229337	GENERIC_DAY	1	0	2010-07-15	2245	\N	139489	\N
229338	GENERIC_DAY	1	0	2010-02-16	2243	\N	139489	\N
229339	GENERIC_DAY	1	0	2010-03-09	2247	\N	139489	\N
229340	GENERIC_DAY	1	1	2010-02-18	2229	\N	139489	\N
229341	GENERIC_DAY	1	1	2010-08-12	2235	\N	139489	\N
229342	GENERIC_DAY	1	1	2010-03-01	2251	\N	139489	\N
229343	GENERIC_DAY	1	0	2010-02-21	2241	\N	139489	\N
229344	GENERIC_DAY	1	1	2010-06-04	2243	\N	139489	\N
229345	GENERIC_DAY	1	1	2010-03-31	2251	\N	139489	\N
229346	GENERIC_DAY	1	1	2010-06-23	2235	\N	139489	\N
229347	GENERIC_DAY	1	0	2010-07-05	2247	\N	139489	\N
229348	GENERIC_DAY	1	1	2010-06-24	2235	\N	139489	\N
229349	GENERIC_DAY	1	1	2010-05-05	2241	\N	139489	\N
229350	GENERIC_DAY	1	1	2010-07-29	2231	\N	139489	\N
229351	GENERIC_DAY	1	0	2010-03-02	2231	\N	139489	\N
229352	GENERIC_DAY	1	0	2010-03-03	2233	\N	139489	\N
229353	GENERIC_DAY	1	0	2010-03-05	2243	\N	139489	\N
229354	GENERIC_DAY	1	0	2010-05-18	2247	\N	139489	\N
229355	GENERIC_DAY	1	0	2010-02-27	2233	\N	139489	\N
229356	GENERIC_DAY	1	0	2010-05-31	2225	\N	139489	\N
229357	GENERIC_DAY	1	0	2010-07-10	2223	\N	139489	\N
229358	GENERIC_DAY	1	0	2010-05-03	2233	\N	139489	\N
229359	GENERIC_DAY	1	0	2010-08-16	2229	\N	139489	\N
229360	GENERIC_DAY	1	0	2010-03-16	2225	\N	139489	\N
229361	GENERIC_DAY	1	1	2010-04-27	2229	\N	139489	\N
229362	GENERIC_DAY	1	0	2010-05-02	2249	\N	139489	\N
229363	GENERIC_DAY	1	0	2010-06-25	2225	\N	139489	\N
229364	GENERIC_DAY	1	0	2010-03-10	2225	\N	139489	\N
229365	GENERIC_DAY	1	0	2010-06-22	2247	\N	139489	\N
229366	GENERIC_DAY	1	0	2010-07-16	2229	\N	139489	\N
229367	GENERIC_DAY	1	0	2010-08-07	2249	\N	139489	\N
229368	GENERIC_DAY	1	1	2010-04-27	2251	\N	139489	\N
229369	GENERIC_DAY	1	0	2010-03-08	2233	\N	139489	\N
229370	GENERIC_DAY	1	0	2010-05-16	2225	\N	139489	\N
229371	GENERIC_DAY	1	0	2010-03-14	2249	\N	139489	\N
229372	GENERIC_DAY	1	0	2010-05-29	2249	\N	139489	\N
229373	GENERIC_DAY	1	1	2010-04-30	2239	\N	139489	\N
229374	GENERIC_DAY	1	1	2010-05-24	2223	\N	139489	\N
229375	GENERIC_DAY	1	0	2010-03-13	2223	\N	139489	\N
229376	GENERIC_DAY	1	0	2010-06-04	2225	\N	139489	\N
229377	GENERIC_DAY	1	0	2010-03-28	2229	\N	139489	\N
229378	GENERIC_DAY	1	1	2010-07-23	2243	\N	139489	\N
229379	GENERIC_DAY	1	0	2010-05-06	2237	\N	139489	\N
229380	GENERIC_DAY	1	2	2010-02-22	2237	\N	139489	\N
229381	GENERIC_DAY	1	0	2010-06-15	2237	\N	139489	\N
229382	GENERIC_DAY	1	0	2010-03-29	2249	\N	139489	\N
229383	GENERIC_DAY	1	2	2010-03-08	2229	\N	139489	\N
229384	GENERIC_DAY	1	0	2010-04-03	2243	\N	139489	\N
229385	GENERIC_DAY	1	0	2010-04-27	2233	\N	139489	\N
229386	GENERIC_DAY	1	0	2010-04-24	2223	\N	139489	\N
229387	GENERIC_DAY	1	1	2010-04-21	2231	\N	139489	\N
229388	GENERIC_DAY	1	0	2010-05-07	2241	\N	139489	\N
229389	GENERIC_DAY	1	0	2010-05-05	2225	\N	139489	\N
229390	GENERIC_DAY	1	0	2010-04-14	2247	\N	139489	\N
229391	GENERIC_DAY	1	1	2010-03-26	2241	\N	139489	\N
229392	GENERIC_DAY	1	0	2010-06-26	2229	\N	139489	\N
229393	GENERIC_DAY	1	0	2010-06-04	2223	\N	139489	\N
229394	GENERIC_DAY	1	1	2010-04-15	2239	\N	139489	\N
229395	GENERIC_DAY	1	1	2010-06-03	2251	\N	139489	\N
229396	GENERIC_DAY	1	1	2010-08-17	2247	\N	139489	\N
229397	GENERIC_DAY	1	1	2010-03-26	2229	\N	139489	\N
229398	GENERIC_DAY	1	0	2010-03-27	2239	\N	139489	\N
229399	GENERIC_DAY	1	0	2010-07-18	2231	\N	139489	\N
229400	GENERIC_DAY	1	0	2010-06-19	2223	\N	139489	\N
229401	GENERIC_DAY	1	1	2010-05-26	2235	\N	139489	\N
229402	GENERIC_DAY	1	1	2010-07-14	2223	\N	139489	\N
229403	GENERIC_DAY	1	1	2010-07-07	2235	\N	139489	\N
229404	GENERIC_DAY	1	1	2010-08-16	2241	\N	139489	\N
229405	GENERIC_DAY	1	0	2010-04-18	2233	\N	139489	\N
229406	GENERIC_DAY	1	0	2010-08-06	2237	\N	139489	\N
229407	GENERIC_DAY	1	1	2010-07-28	2223	\N	139489	\N
229408	GENERIC_DAY	1	2	2010-03-09	2251	\N	139489	\N
229409	GENERIC_DAY	1	0	2010-05-17	2239	\N	139489	\N
229410	GENERIC_DAY	1	0	2010-07-26	2233	\N	139489	\N
229411	GENERIC_DAY	1	0	2010-05-19	2233	\N	139489	\N
229412	GENERIC_DAY	1	0	2010-08-05	2233	\N	139489	\N
229413	GENERIC_DAY	1	0	2010-07-17	2247	\N	139489	\N
229414	GENERIC_DAY	1	0	2010-05-08	2235	\N	139489	\N
229415	GENERIC_DAY	1	1	2010-06-03	2239	\N	139489	\N
229416	GENERIC_DAY	1	0	2010-08-01	2231	\N	139489	\N
229417	GENERIC_DAY	1	1	2010-04-28	2251	\N	139489	\N
229418	GENERIC_DAY	1	1	2010-06-02	2241	\N	139489	\N
229419	GENERIC_DAY	1	0	2010-03-09	2225	\N	139489	\N
229420	GENERIC_DAY	1	0	2010-06-03	2225	\N	139489	\N
229421	GENERIC_DAY	1	0	2010-07-18	2249	\N	139489	\N
229422	GENERIC_DAY	1	0	2010-02-20	2231	\N	139489	\N
229423	GENERIC_DAY	1	1	2010-04-16	2247	\N	139489	\N
229424	GENERIC_DAY	1	1	2010-04-26	2235	\N	139489	\N
229425	GENERIC_DAY	1	0	2010-06-06	2223	\N	139489	\N
229426	GENERIC_DAY	1	0	2010-02-17	2239	\N	139489	\N
229427	GENERIC_DAY	1	0	2010-03-28	2243	\N	139489	\N
229428	GENERIC_DAY	1	0	2010-07-11	2251	\N	139489	\N
229429	GENERIC_DAY	1	0	2010-03-27	2249	\N	139489	\N
229430	GENERIC_DAY	1	1	2010-08-16	2251	\N	139489	\N
229431	GENERIC_DAY	1	1	2010-08-17	2241	\N	139489	\N
229432	GENERIC_DAY	1	0	2010-02-28	2235	\N	139489	\N
229433	GENERIC_DAY	1	1	2010-03-10	2245	\N	139489	\N
229434	GENERIC_DAY	1	1	2010-07-01	2239	\N	139489	\N
229435	GENERIC_DAY	1	0	2010-06-16	2237	\N	139489	\N
229436	GENERIC_DAY	1	0	2010-05-28	2225	\N	139489	\N
229437	GENERIC_DAY	1	0	2010-06-28	2233	\N	139489	\N
229438	GENERIC_DAY	1	0	2010-05-08	2225	\N	139489	\N
229439	GENERIC_DAY	1	1	2010-06-30	2249	\N	139489	\N
229440	GENERIC_DAY	1	1	2010-06-16	2223	\N	139489	\N
229441	GENERIC_DAY	1	1	2010-03-16	2241	\N	139489	\N
229442	GENERIC_DAY	1	0	2010-06-17	2237	\N	139489	\N
229443	GENERIC_DAY	1	1	2010-05-24	2249	\N	139489	\N
229444	GENERIC_DAY	1	1	2010-05-06	2241	\N	139489	\N
229445	GENERIC_DAY	1	0	2010-03-10	2247	\N	139489	\N
229446	GENERIC_DAY	1	0	2010-04-17	2229	\N	139489	\N
229447	GENERIC_DAY	1	1	2010-07-19	2223	\N	139489	\N
229448	GENERIC_DAY	1	0	2010-08-14	2251	\N	139489	\N
229449	GENERIC_DAY	1	0	2010-07-16	2223	\N	139489	\N
229450	GENERIC_DAY	1	1	2010-02-22	2229	\N	139489	\N
229451	GENERIC_DAY	1	0	2010-03-22	2231	\N	139489	\N
229452	GENERIC_DAY	1	0	2010-04-18	2237	\N	139489	\N
229453	GENERIC_DAY	1	0	2010-08-14	2243	\N	139489	\N
229454	GENERIC_DAY	1	0	2010-07-17	2243	\N	139489	\N
229455	GENERIC_DAY	1	1	2010-06-16	2241	\N	139489	\N
229456	GENERIC_DAY	1	1	2010-06-22	2239	\N	139489	\N
229457	GENERIC_DAY	1	0	2010-05-06	2225	\N	139489	\N
229458	GENERIC_DAY	1	1	2010-06-17	2229	\N	139489	\N
229459	GENERIC_DAY	1	0	2010-07-31	2225	\N	139489	\N
229460	GENERIC_DAY	1	0	2010-03-27	2247	\N	139489	\N
229461	GENERIC_DAY	1	1	2010-08-19	2235	\N	139489	\N
229462	GENERIC_DAY	1	0	2010-07-16	2233	\N	139489	\N
229463	GENERIC_DAY	1	2	2010-03-29	2245	\N	139489	\N
229464	GENERIC_DAY	1	0	2010-08-07	2239	\N	139489	\N
229465	GENERIC_DAY	1	1	2010-03-25	2223	\N	139489	\N
229466	GENERIC_DAY	1	0	2010-07-04	2241	\N	139489	\N
229467	GENERIC_DAY	1	0	2010-03-05	2233	\N	139489	\N
229468	GENERIC_DAY	1	1	2010-05-27	2239	\N	139489	\N
229469	GENERIC_DAY	1	0	2010-07-04	2243	\N	139489	\N
229470	GENERIC_DAY	1	1	2010-05-18	2223	\N	139489	\N
229471	GENERIC_DAY	1	0	2010-04-03	2245	\N	139489	\N
229472	GENERIC_DAY	1	1	2010-04-06	2223	\N	139489	\N
229473	GENERIC_DAY	1	0	2010-02-28	2249	\N	139489	\N
229474	GENERIC_DAY	1	0	2010-08-13	2243	\N	139489	\N
229475	GENERIC_DAY	1	0	2010-07-17	2225	\N	139489	\N
229476	GENERIC_DAY	1	0	2010-04-03	2229	\N	139489	\N
229477	GENERIC_DAY	1	1	2010-08-11	2237	\N	139489	\N
229478	GENERIC_DAY	1	0	2010-04-19	2243	\N	139489	\N
229479	GENERIC_DAY	1	0	2010-05-29	2239	\N	139489	\N
229480	GENERIC_DAY	1	0	2010-03-16	2243	\N	139489	\N
229481	GENERIC_DAY	1	1	2010-06-22	2223	\N	139489	\N
229482	GENERIC_DAY	1	1	2010-06-09	2239	\N	139489	\N
229483	GENERIC_DAY	1	0	2010-03-07	2241	\N	139489	\N
229484	GENERIC_DAY	1	1	2010-08-05	2251	\N	139489	\N
229485	GENERIC_DAY	1	0	2010-08-15	2251	\N	139489	\N
229486	GENERIC_DAY	1	1	2010-05-05	2235	\N	139489	\N
229487	GENERIC_DAY	1	1	2010-08-23	2237	\N	139489	\N
229488	GENERIC_DAY	1	0	2010-05-10	2245	\N	139489	\N
229489	GENERIC_DAY	1	0	2010-06-25	2241	\N	139489	\N
229490	GENERIC_DAY	1	0	2010-03-13	2237	\N	139489	\N
229491	GENERIC_DAY	1	0	2010-08-04	2233	\N	139489	\N
229492	GENERIC_DAY	1	1	2010-08-06	2239	\N	139489	\N
229493	GENERIC_DAY	1	1	2010-03-04	2251	\N	139489	\N
229494	GENERIC_DAY	1	0	2010-08-13	2237	\N	139489	\N
229495	GENERIC_DAY	1	1	2010-06-08	2229	\N	139489	\N
229496	GENERIC_DAY	1	0	2010-06-11	2241	\N	139489	\N
229497	GENERIC_DAY	1	0	2010-03-13	2251	\N	139489	\N
229498	GENERIC_DAY	1	0	2010-03-25	2231	\N	139489	\N
229499	GENERIC_DAY	1	0	2010-04-01	2237	\N	139489	\N
229500	GENERIC_DAY	1	0	2010-07-01	2245	\N	139489	\N
229501	GENERIC_DAY	1	0	2010-06-21	2225	\N	139489	\N
229502	GENERIC_DAY	1	0	2010-05-15	2229	\N	139489	\N
229503	GENERIC_DAY	1	1	2010-06-29	2251	\N	139489	\N
229504	GENERIC_DAY	1	0	2010-04-07	2235	\N	139489	\N
229505	GENERIC_DAY	1	0	2010-02-24	2235	\N	139489	\N
229506	GENERIC_DAY	1	0	2010-04-07	2239	\N	139489	\N
229507	GENERIC_DAY	1	1	2010-06-30	2241	\N	139489	\N
229508	GENERIC_DAY	1	0	2010-03-06	2243	\N	139489	\N
229509	GENERIC_DAY	1	0	2010-02-21	2235	\N	139489	\N
229510	GENERIC_DAY	1	0	2010-05-07	2223	\N	139489	\N
229511	GENERIC_DAY	1	0	2010-04-24	2239	\N	139489	\N
229512	GENERIC_DAY	1	0	2010-06-06	2239	\N	139489	\N
229513	GENERIC_DAY	1	0	2010-05-17	2237	\N	139489	\N
229514	GENERIC_DAY	1	0	2010-06-12	2243	\N	139489	\N
229515	GENERIC_DAY	1	1	2010-03-11	2237	\N	139489	\N
229516	GENERIC_DAY	1	2	2010-03-04	2245	\N	139489	\N
229517	GENERIC_DAY	1	0	2010-03-25	2247	\N	139489	\N
229518	GENERIC_DAY	1	0	2010-03-24	2225	\N	139489	\N
229519	GENERIC_DAY	1	0	2010-05-24	2237	\N	139489	\N
229520	GENERIC_DAY	1	1	2010-08-12	2251	\N	139489	\N
229521	GENERIC_DAY	1	1	2010-05-25	2239	\N	139489	\N
229522	GENERIC_DAY	1	0	2010-05-23	2231	\N	139489	\N
229523	GENERIC_DAY	1	1	2010-08-20	2235	\N	139489	\N
229524	GENERIC_DAY	1	0	2010-05-03	2247	\N	139489	\N
229525	GENERIC_DAY	1	1	2010-03-30	2223	\N	139489	\N
229526	GENERIC_DAY	1	0	2010-05-23	2249	\N	139489	\N
229527	GENERIC_DAY	1	0	2010-06-05	2231	\N	139489	\N
229528	GENERIC_DAY	1	0	2010-03-23	2247	\N	139489	\N
229529	GENERIC_DAY	1	0	2010-06-15	2247	\N	139489	\N
229530	GENERIC_DAY	1	0	2010-08-12	2225	\N	139489	\N
229531	GENERIC_DAY	1	0	2010-04-25	2251	\N	139489	\N
229532	GENERIC_DAY	1	0	2010-05-01	2241	\N	139489	\N
229533	GENERIC_DAY	1	0	2010-03-07	2233	\N	139489	\N
229534	GENERIC_DAY	1	1	2010-06-28	2251	\N	139489	\N
229535	GENERIC_DAY	1	0	2010-06-06	2235	\N	139489	\N
229536	GENERIC_DAY	1	0	2010-03-27	2229	\N	139489	\N
229537	GENERIC_DAY	1	0	2010-02-17	2225	\N	139489	\N
229538	GENERIC_DAY	1	0	2010-05-21	2225	\N	139489	\N
229539	GENERIC_DAY	1	1	2010-07-07	2251	\N	139489	\N
229540	GENERIC_DAY	1	1	2010-06-15	2241	\N	139489	\N
229541	GENERIC_DAY	1	0	2010-03-13	2247	\N	139489	\N
229542	GENERIC_DAY	1	0	2010-07-25	2225	\N	139489	\N
229543	GENERIC_DAY	1	0	2010-04-09	2249	\N	139489	\N
229544	GENERIC_DAY	1	0	2010-03-27	2231	\N	139489	\N
229545	GENERIC_DAY	1	0	2010-06-28	2243	\N	139489	\N
229546	GENERIC_DAY	1	0	2010-03-19	2241	\N	139489	\N
229547	GENERIC_DAY	1	1	2010-08-06	2249	\N	139489	\N
229548	GENERIC_DAY	1	1	2010-06-03	2229	\N	139489	\N
229549	GENERIC_DAY	1	0	2010-04-14	2245	\N	139489	\N
229550	GENERIC_DAY	1	0	2010-07-22	2233	\N	139489	\N
229551	GENERIC_DAY	1	1	2010-07-15	2251	\N	139489	\N
229552	GENERIC_DAY	1	1	2010-05-12	2235	\N	139489	\N
229553	GENERIC_DAY	1	0	2010-06-12	2229	\N	139489	\N
229554	GENERIC_DAY	1	1	2010-03-08	2245	\N	139489	\N
229555	GENERIC_DAY	1	1	2010-06-04	2251	\N	139489	\N
229556	GENERIC_DAY	1	1	2010-06-07	2239	\N	139489	\N
229557	GENERIC_DAY	1	0	2010-07-25	2237	\N	139489	\N
229558	GENERIC_DAY	1	0	2010-07-06	2245	\N	139489	\N
229559	GENERIC_DAY	1	0	2010-03-01	2231	\N	139489	\N
229560	GENERIC_DAY	1	1	2010-08-03	2231	\N	139489	\N
229561	GENERIC_DAY	1	0	2010-07-03	2233	\N	139489	\N
229562	GENERIC_DAY	1	0	2010-08-08	2237	\N	139489	\N
229563	GENERIC_DAY	1	0	2010-02-22	2239	\N	139489	\N
229564	GENERIC_DAY	1	0	2010-05-05	2233	\N	139489	\N
229565	GENERIC_DAY	1	0	2010-04-29	2225	\N	139489	\N
229566	GENERIC_DAY	1	0	2010-05-27	2237	\N	139489	\N
229567	GENERIC_DAY	1	1	2010-06-09	2241	\N	139489	\N
229568	GENERIC_DAY	1	0	2010-05-02	2229	\N	139489	\N
229569	GENERIC_DAY	1	1	2010-04-16	2251	\N	139489	\N
229570	GENERIC_DAY	1	0	2010-04-23	2225	\N	139489	\N
229571	GENERIC_DAY	1	0	2010-08-08	2239	\N	139489	\N
229572	GENERIC_DAY	1	0	2010-08-15	2223	\N	139489	\N
229573	GENERIC_DAY	1	1	2010-04-06	2237	\N	139489	\N
229574	GENERIC_DAY	1	1	2010-02-17	2251	\N	139489	\N
229575	GENERIC_DAY	1	1	2010-08-11	2241	\N	139489	\N
229576	GENERIC_DAY	1	0	2010-04-12	2249	\N	139489	\N
229577	GENERIC_DAY	1	2	2010-03-25	2237	\N	139489	\N
229578	GENERIC_DAY	1	0	2010-03-12	2243	\N	139489	\N
229579	GENERIC_DAY	1	0	2010-04-04	2237	\N	139489	\N
229580	GENERIC_DAY	1	0	2010-04-25	2233	\N	139489	\N
229581	GENERIC_DAY	1	0	2010-07-11	2245	\N	139489	\N
229582	GENERIC_DAY	1	0	2010-03-02	2239	\N	139489	\N
229583	GENERIC_DAY	1	1	2010-07-15	2229	\N	139489	\N
229584	GENERIC_DAY	1	0	2010-05-23	2243	\N	139489	\N
229585	GENERIC_DAY	1	1	2010-04-16	2235	\N	139489	\N
229586	GENERIC_DAY	1	2	2010-03-22	2245	\N	139489	\N
229587	GENERIC_DAY	1	0	2010-06-25	2233	\N	139489	\N
229588	GENERIC_DAY	1	0	2010-06-03	2237	\N	139489	\N
229589	GENERIC_DAY	1	0	2010-07-19	2247	\N	139489	\N
229590	GENERIC_DAY	1	1	2010-03-16	2223	\N	139489	\N
229591	GENERIC_DAY	1	0	2010-03-30	2233	\N	139489	\N
229592	GENERIC_DAY	1	0	2010-04-11	2231	\N	139489	\N
229593	GENERIC_DAY	1	0	2010-04-01	2233	\N	139489	\N
229594	GENERIC_DAY	1	1	2010-06-14	2239	\N	139489	\N
229595	GENERIC_DAY	1	0	2010-05-12	2243	\N	139489	\N
229596	GENERIC_DAY	1	1	2010-03-02	2229	\N	139489	\N
229597	GENERIC_DAY	1	0	2010-03-29	2225	\N	139489	\N
229598	GENERIC_DAY	1	1	2010-03-08	2223	\N	139489	\N
229599	GENERIC_DAY	1	1	2010-06-24	2249	\N	139489	\N
229600	GENERIC_DAY	1	0	2010-03-14	2237	\N	139489	\N
229601	GENERIC_DAY	1	2	2010-03-17	2245	\N	139489	\N
229602	GENERIC_DAY	1	0	2010-05-26	2245	\N	139489	\N
229603	GENERIC_DAY	1	1	2010-05-20	2251	\N	139489	\N
229604	GENERIC_DAY	1	1	2010-07-06	2251	\N	139489	\N
229605	GENERIC_DAY	1	1	2010-07-14	2251	\N	139489	\N
229606	GENERIC_DAY	1	1	2010-08-12	2237	\N	139489	\N
229607	GENERIC_DAY	1	1	2010-07-23	2247	\N	139489	\N
229608	GENERIC_DAY	1	0	2010-05-14	2233	\N	139489	\N
229609	GENERIC_DAY	1	0	2010-05-16	2229	\N	139489	\N
229610	GENERIC_DAY	1	1	2010-05-13	2235	\N	139489	\N
229611	GENERIC_DAY	1	2	2010-03-30	2237	\N	139489	\N
229612	GENERIC_DAY	1	1	2010-08-19	2245	\N	139489	\N
229613	GENERIC_DAY	1	0	2010-06-21	2243	\N	139489	\N
229614	GENERIC_DAY	1	0	2010-08-01	2235	\N	139489	\N
229615	GENERIC_DAY	1	0	2010-08-15	2229	\N	139489	\N
229616	GENERIC_DAY	1	0	2010-07-05	2243	\N	139489	\N
229617	GENERIC_DAY	1	0	2010-05-20	2245	\N	139489	\N
229618	GENERIC_DAY	1	0	2010-04-06	2235	\N	139489	\N
229619	GENERIC_DAY	1	0	2010-05-22	2223	\N	139489	\N
229620	GENERIC_DAY	1	0	2010-05-24	2243	\N	139489	\N
229621	GENERIC_DAY	1	1	2010-03-12	2245	\N	139489	\N
229622	GENERIC_DAY	1	0	2010-05-21	2241	\N	139489	\N
229623	GENERIC_DAY	1	0	2010-05-15	2237	\N	139489	\N
229624	GENERIC_DAY	1	0	2010-02-27	2247	\N	139489	\N
229625	GENERIC_DAY	1	0	2010-08-01	2241	\N	139489	\N
229626	GENERIC_DAY	1	0	2010-07-04	2247	\N	139489	\N
229627	GENERIC_DAY	1	1	2010-05-12	2223	\N	139489	\N
229628	GENERIC_DAY	1	0	2010-03-30	2231	\N	139489	\N
229629	GENERIC_DAY	1	0	2010-04-04	2247	\N	139489	\N
229630	GENERIC_DAY	1	0	2010-02-17	2231	\N	139489	\N
229631	GENERIC_DAY	1	1	2010-08-17	2237	\N	139489	\N
229632	GENERIC_DAY	1	0	2010-03-19	2229	\N	139489	\N
229633	GENERIC_DAY	1	0	2010-02-21	2243	\N	139489	\N
229634	GENERIC_DAY	1	0	2010-06-20	2223	\N	139489	\N
229635	GENERIC_DAY	1	0	2010-07-26	2247	\N	139489	\N
229636	GENERIC_DAY	1	1	2010-06-24	2239	\N	139489	\N
229637	GENERIC_DAY	1	0	2010-05-23	2223	\N	139489	\N
229638	GENERIC_DAY	1	0	2010-06-14	2233	\N	139489	\N
229639	GENERIC_DAY	1	1	2010-04-28	2235	\N	139489	\N
229640	GENERIC_DAY	1	1	2010-07-13	2239	\N	139489	\N
229641	GENERIC_DAY	1	0	2010-06-12	2245	\N	139489	\N
229642	GENERIC_DAY	1	1	2010-04-07	2233	\N	139489	\N
229643	GENERIC_DAY	1	0	2010-04-04	2235	\N	139489	\N
229644	GENERIC_DAY	1	0	2010-07-01	2237	\N	139489	\N
229645	GENERIC_DAY	1	0	2010-08-19	2223	\N	139489	\N
229646	GENERIC_DAY	1	0	2010-05-06	2243	\N	139489	\N
229647	GENERIC_DAY	1	0	2010-08-24	2249	\N	139489	\N
229648	GENERIC_DAY	1	0	2010-08-06	2245	\N	139489	\N
229649	GENERIC_DAY	1	0	2010-05-11	2247	\N	139489	\N
229650	GENERIC_DAY	1	0	2010-03-25	2249	\N	139489	\N
229651	GENERIC_DAY	1	0	2010-08-20	2237	\N	139489	\N
229652	GENERIC_DAY	1	0	2010-06-09	2245	\N	139489	\N
229653	GENERIC_DAY	1	0	2010-03-18	2233	\N	139489	\N
229654	GENERIC_DAY	1	0	2010-04-18	2251	\N	139489	\N
229655	GENERIC_DAY	1	0	2010-08-19	2239	\N	139489	\N
229656	GENERIC_DAY	1	0	2010-03-01	2225	\N	139489	\N
229657	GENERIC_DAY	1	1	2010-05-05	2231	\N	139489	\N
229658	GENERIC_DAY	1	0	2010-05-29	2237	\N	139489	\N
229659	GENERIC_DAY	1	0	2010-08-15	2239	\N	139489	\N
229660	GENERIC_DAY	1	0	2010-08-17	2239	\N	139489	\N
229661	GENERIC_DAY	1	0	2010-02-20	2251	\N	139489	\N
229662	GENERIC_DAY	1	1	2010-03-10	2235	\N	139489	\N
229663	GENERIC_DAY	1	0	2010-04-30	2229	\N	139489	\N
229664	GENERIC_DAY	1	1	2010-07-05	2223	\N	139489	\N
229665	GENERIC_DAY	1	0	2010-03-17	2231	\N	139489	\N
229666	GENERIC_DAY	1	0	2010-07-11	2229	\N	139489	\N
229667	GENERIC_DAY	1	1	2010-04-06	2241	\N	139489	\N
229668	GENERIC_DAY	1	0	2010-06-27	2239	\N	139489	\N
229669	GENERIC_DAY	1	0	2010-07-08	2233	\N	139489	\N
229670	GENERIC_DAY	1	2	2010-03-24	2237	\N	139489	\N
229671	GENERIC_DAY	1	0	2010-07-31	2223	\N	139489	\N
229672	GENERIC_DAY	1	0	2010-07-12	2245	\N	139489	\N
229673	GENERIC_DAY	1	1	2010-03-02	2223	\N	139489	\N
229674	GENERIC_DAY	1	0	2010-07-17	2237	\N	139489	\N
229675	GENERIC_DAY	1	0	2010-06-24	2247	\N	139489	\N
229676	GENERIC_DAY	1	0	2010-03-06	2233	\N	139489	\N
229677	GENERIC_DAY	1	1	2010-06-28	2239	\N	139489	\N
229678	GENERIC_DAY	1	0	2010-04-17	2231	\N	139489	\N
229679	GENERIC_DAY	1	0	2010-03-06	2241	\N	139489	\N
229680	GENERIC_DAY	1	0	2010-08-21	2223	\N	139489	\N
229681	GENERIC_DAY	1	0	2010-04-17	2241	\N	139489	\N
229682	GENERIC_DAY	1	1	2010-03-09	2223	\N	139489	\N
229683	GENERIC_DAY	1	0	2010-06-07	2243	\N	139489	\N
229684	GENERIC_DAY	1	0	2010-04-13	2247	\N	139489	\N
229685	GENERIC_DAY	1	0	2010-07-06	2237	\N	139489	\N
229686	GENERIC_DAY	1	2	2010-02-16	2237	\N	139489	\N
229687	GENERIC_DAY	1	0	2010-06-06	2245	\N	139489	\N
229688	GENERIC_DAY	1	0	2010-06-26	2237	\N	139489	\N
229689	GENERIC_DAY	1	0	2010-04-03	2225	\N	139489	\N
229690	GENERIC_DAY	1	0	2010-03-06	2249	\N	139489	\N
229691	GENERIC_DAY	1	0	2010-04-17	2237	\N	139489	\N
229692	GENERIC_DAY	1	1	2010-05-20	2229	\N	139489	\N
229693	GENERIC_DAY	1	0	2010-03-01	2235	\N	139489	\N
229694	GENERIC_DAY	1	0	2010-02-17	2243	\N	139489	\N
229695	GENERIC_DAY	1	0	2010-04-11	2235	\N	139489	\N
229696	GENERIC_DAY	1	1	2010-04-20	2235	\N	139489	\N
229697	GENERIC_DAY	1	0	2010-05-21	2233	\N	139489	\N
229698	GENERIC_DAY	1	1	2010-02-19	2229	\N	139489	\N
229699	GENERIC_DAY	1	1	2010-04-12	2241	\N	139489	\N
229700	GENERIC_DAY	1	1	2010-03-12	2251	\N	139489	\N
229701	GENERIC_DAY	1	0	2010-03-14	2247	\N	139489	\N
229702	GENERIC_DAY	1	1	2010-05-04	2229	\N	139489	\N
229703	GENERIC_DAY	1	0	2010-03-21	2245	\N	139489	\N
229704	GENERIC_DAY	1	0	2010-06-24	2243	\N	139489	\N
229705	GENERIC_DAY	1	0	2010-04-18	2235	\N	139489	\N
229706	GENERIC_DAY	1	0	2010-07-11	2237	\N	139489	\N
229707	GENERIC_DAY	1	1	2010-07-05	2251	\N	139489	\N
229708	GENERIC_DAY	1	0	2010-08-18	2223	\N	139489	\N
229709	GENERIC_DAY	1	0	2010-05-30	2251	\N	139489	\N
229710	GENERIC_DAY	1	0	2010-08-23	2229	\N	139489	\N
229711	GENERIC_DAY	1	1	2010-06-28	2229	\N	139489	\N
229712	GENERIC_DAY	1	0	2010-02-18	2235	\N	139489	\N
229713	GENERIC_DAY	1	1	2010-08-03	2235	\N	139489	\N
229714	GENERIC_DAY	1	0	2010-08-02	2233	\N	139489	\N
229715	GENERIC_DAY	1	0	2010-03-12	2247	\N	139489	\N
229716	GENERIC_DAY	1	0	2010-08-10	2237	\N	139489	\N
229717	GENERIC_DAY	1	0	2010-02-19	2247	\N	139489	\N
229718	GENERIC_DAY	1	1	2010-05-27	2249	\N	139489	\N
229719	GENERIC_DAY	1	1	2010-07-20	2249	\N	139489	\N
229720	GENERIC_DAY	1	0	2010-04-11	2233	\N	139489	\N
229721	GENERIC_DAY	1	1	2010-08-11	2249	\N	139489	\N
229722	GENERIC_DAY	1	0	2010-03-15	2235	\N	139489	\N
229723	GENERIC_DAY	1	0	2010-04-17	2223	\N	139489	\N
229724	GENERIC_DAY	1	2	2010-03-18	2237	\N	139489	\N
229725	GENERIC_DAY	1	0	2010-03-06	2251	\N	139489	\N
229726	GENERIC_DAY	1	1	2010-07-01	2229	\N	139489	\N
229727	GENERIC_DAY	1	0	2010-03-20	2247	\N	139489	\N
229728	GENERIC_DAY	1	0	2010-05-16	2231	\N	139489	\N
229729	GENERIC_DAY	1	0	2010-08-22	2223	\N	139489	\N
229730	GENERIC_DAY	1	1	2010-04-06	2251	\N	139489	\N
229731	GENERIC_DAY	1	0	2010-07-27	2243	\N	139489	\N
229732	GENERIC_DAY	1	0	2010-07-24	2237	\N	139489	\N
229733	GENERIC_DAY	1	1	2010-06-10	2249	\N	139489	\N
229734	GENERIC_DAY	1	0	2010-03-02	2249	\N	139489	\N
229735	GENERIC_DAY	1	2	2010-03-16	2245	\N	139489	\N
229736	GENERIC_DAY	1	0	2010-03-23	2231	\N	139489	\N
229737	GENERIC_DAY	1	1	2010-08-19	2241	\N	139489	\N
229738	GENERIC_DAY	1	0	2010-08-18	2225	\N	139489	\N
229739	GENERIC_DAY	1	0	2010-02-21	2223	\N	139489	\N
229740	GENERIC_DAY	1	1	2010-05-26	2241	\N	139489	\N
229741	GENERIC_DAY	1	0	2010-05-31	2243	\N	139489	\N
229742	GENERIC_DAY	1	0	2010-07-07	2247	\N	139489	\N
229743	GENERIC_DAY	1	1	2010-05-25	2231	\N	139489	\N
229744	GENERIC_DAY	1	1	2010-06-01	2229	\N	139489	\N
229745	GENERIC_DAY	1	1	2010-06-14	2241	\N	139489	\N
229746	GENERIC_DAY	1	0	2010-03-29	2247	\N	139489	\N
229747	GENERIC_DAY	1	1	2010-07-06	2231	\N	139489	\N
229748	GENERIC_DAY	1	1	2010-06-22	2249	\N	139489	\N
229749	GENERIC_DAY	1	1	2010-04-06	2245	\N	139489	\N
229750	GENERIC_DAY	1	1	2010-06-29	2249	\N	139489	\N
229751	GENERIC_DAY	1	0	2010-08-21	2231	\N	139489	\N
229752	GENERIC_DAY	1	0	2010-02-20	2245	\N	139489	\N
229753	GENERIC_DAY	1	0	2010-05-18	2237	\N	139489	\N
229754	GENERIC_DAY	1	0	2010-06-02	2247	\N	139489	\N
229755	GENERIC_DAY	1	0	2010-02-20	2243	\N	139489	\N
229756	GENERIC_DAY	1	1	2010-08-05	2223	\N	139489	\N
229757	GENERIC_DAY	1	1	2010-08-16	2249	\N	139489	\N
229758	GENERIC_DAY	1	0	2010-02-28	2237	\N	139489	\N
229759	GENERIC_DAY	1	1	2010-05-24	2251	\N	139489	\N
229760	GENERIC_DAY	1	0	2010-06-27	2245	\N	139489	\N
229761	GENERIC_DAY	1	1	2010-07-21	2231	\N	139489	\N
229762	GENERIC_DAY	1	0	2010-05-17	2235	\N	139489	\N
229763	GENERIC_DAY	1	1	2010-08-16	2243	\N	139489	\N
229764	GENERIC_DAY	1	0	2010-05-09	2239	\N	139489	\N
229765	GENERIC_DAY	1	1	2010-07-02	2235	\N	139489	\N
229766	GENERIC_DAY	1	0	2010-08-09	2237	\N	139489	\N
229767	GENERIC_DAY	1	1	2010-04-30	2243	\N	139489	\N
229768	GENERIC_DAY	1	1	2010-07-21	2241	\N	139489	\N
229769	GENERIC_DAY	1	0	2010-05-29	2235	\N	139489	\N
229770	GENERIC_DAY	1	1	2010-05-31	2235	\N	139489	\N
229771	GENERIC_DAY	1	0	2010-05-16	2233	\N	139489	\N
229772	GENERIC_DAY	1	1	2010-05-13	2229	\N	139489	\N
229773	GENERIC_DAY	1	0	2010-08-01	2237	\N	139489	\N
229774	GENERIC_DAY	1	1	2010-08-23	2249	\N	139489	\N
229775	GENERIC_DAY	1	1	2010-04-28	2229	\N	139489	\N
229776	GENERIC_DAY	1	0	2010-04-09	2231	\N	139489	\N
229777	GENERIC_DAY	1	0	2010-05-23	2251	\N	139489	\N
229778	GENERIC_DAY	1	0	2010-04-25	2223	\N	139489	\N
229779	GENERIC_DAY	1	0	2010-03-05	2231	\N	139489	\N
229780	GENERIC_DAY	1	0	2010-04-09	2235	\N	139489	\N
229781	GENERIC_DAY	1	0	2010-03-17	2233	\N	139489	\N
229782	GENERIC_DAY	1	1	2010-06-17	2251	\N	139489	\N
229783	GENERIC_DAY	1	0	2010-06-26	2249	\N	139489	\N
229784	GENERIC_DAY	1	0	2010-05-08	2231	\N	139489	\N
229785	GENERIC_DAY	1	1	2010-07-14	2229	\N	139489	\N
229786	GENERIC_DAY	1	0	2010-07-03	2241	\N	139489	\N
229787	GENERIC_DAY	1	0	2010-03-20	2241	\N	139489	\N
229788	GENERIC_DAY	1	1	2010-08-04	2235	\N	139489	\N
229789	GENERIC_DAY	1	0	2010-05-09	2223	\N	139489	\N
229790	GENERIC_DAY	1	0	2010-08-18	2229	\N	139489	\N
229791	GENERIC_DAY	1	0	2010-05-01	2243	\N	139489	\N
229792	GENERIC_DAY	1	1	2010-05-03	2241	\N	139489	\N
229793	GENERIC_DAY	1	0	2010-04-19	2245	\N	139489	\N
229794	GENERIC_DAY	1	0	2010-03-08	2247	\N	139489	\N
229795	GENERIC_DAY	1	0	2010-08-07	2247	\N	139489	\N
229796	GENERIC_DAY	1	1	2010-07-28	2251	\N	139489	\N
229797	GENERIC_DAY	1	0	2010-08-07	2237	\N	139489	\N
229798	GENERIC_DAY	1	1	2010-08-06	2235	\N	139489	\N
229799	GENERIC_DAY	1	0	2010-04-12	2247	\N	139489	\N
229800	GENERIC_DAY	1	0	2010-04-12	2245	\N	139489	\N
229801	GENERIC_DAY	1	2	2010-03-02	2237	\N	139489	\N
229802	GENERIC_DAY	1	0	2010-03-21	2223	\N	139489	\N
229803	GENERIC_DAY	1	0	2010-02-17	2247	\N	139489	\N
229804	GENERIC_DAY	1	0	2010-07-20	2233	\N	139489	\N
229805	GENERIC_DAY	1	0	2010-03-23	2239	\N	139489	\N
229806	GENERIC_DAY	1	0	2010-07-30	2223	\N	139489	\N
229807	GENERIC_DAY	1	0	2010-08-08	2243	\N	139489	\N
229808	GENERIC_DAY	1	0	2010-02-16	2249	\N	139489	\N
229809	GENERIC_DAY	1	1	2010-07-06	2241	\N	139489	\N
229810	GENERIC_DAY	1	1	2010-08-03	2241	\N	139489	\N
229811	GENERIC_DAY	1	0	2010-02-26	2231	\N	139489	\N
229812	GENERIC_DAY	1	0	2010-05-31	2247	\N	139489	\N
229813	GENERIC_DAY	1	0	2010-06-18	2237	\N	139489	\N
229814	GENERIC_DAY	1	0	2010-08-23	2231	\N	139489	\N
229815	GENERIC_DAY	1	0	2010-06-30	2233	\N	139489	\N
229816	GENERIC_DAY	1	0	2010-07-26	2237	\N	139489	\N
229817	GENERIC_DAY	1	0	2010-04-17	2233	\N	139489	\N
229818	GENERIC_DAY	1	0	2010-07-02	2223	\N	139489	\N
229819	GENERIC_DAY	1	2	2010-03-23	2237	\N	139489	\N
229820	GENERIC_DAY	1	1	2010-08-18	2235	\N	139489	\N
229821	GENERIC_DAY	1	0	2010-04-26	2233	\N	139489	\N
229822	GENERIC_DAY	1	0	2010-06-13	2249	\N	139489	\N
229823	GENERIC_DAY	1	0	2010-02-26	2239	\N	139489	\N
229824	GENERIC_DAY	1	0	2010-04-26	2243	\N	139489	\N
229825	GENERIC_DAY	1	0	2010-03-05	2249	\N	139489	\N
229826	GENERIC_DAY	1	1	2010-08-17	2245	\N	139489	\N
229827	GENERIC_DAY	1	1	2010-03-29	2241	\N	139489	\N
229828	GENERIC_DAY	1	0	2010-03-31	2233	\N	139489	\N
229829	GENERIC_DAY	1	1	2010-06-02	2249	\N	139489	\N
229830	GENERIC_DAY	1	1	2010-08-03	2223	\N	139489	\N
229831	GENERIC_DAY	1	0	2010-04-10	2223	\N	139489	\N
229832	GENERIC_DAY	1	1	2010-08-17	2249	\N	139489	\N
229833	GENERIC_DAY	1	0	2010-05-09	2231	\N	139489	\N
229834	GENERIC_DAY	1	0	2010-03-28	2241	\N	139489	\N
229835	GENERIC_DAY	1	0	2010-06-02	2237	\N	139489	\N
229836	GENERIC_DAY	1	1	2010-07-12	2251	\N	139489	\N
229837	GENERIC_DAY	1	0	2010-07-23	2245	\N	139489	\N
229838	GENERIC_DAY	1	0	2010-08-11	2231	\N	139489	\N
229839	GENERIC_DAY	1	1	2010-03-29	2251	\N	139489	\N
229840	GENERIC_DAY	1	0	2010-05-28	2245	\N	139489	\N
229841	GENERIC_DAY	1	0	2010-07-24	2241	\N	139489	\N
229842	GENERIC_DAY	1	1	2010-07-26	2235	\N	139489	\N
229843	GENERIC_DAY	1	0	2010-04-01	2241	\N	139489	\N
229844	GENERIC_DAY	1	1	2010-05-19	2241	\N	139489	\N
229845	GENERIC_DAY	1	1	2010-06-25	2249	\N	139489	\N
229846	GENERIC_DAY	1	1	2010-08-20	2239	\N	139489	\N
229847	GENERIC_DAY	1	0	2010-07-20	2247	\N	139489	\N
229848	GENERIC_DAY	1	1	2010-04-15	2233	\N	139489	\N
229849	GENERIC_DAY	1	0	2010-04-20	2237	\N	139489	\N
229850	GENERIC_DAY	1	1	2010-04-29	2235	\N	139489	\N
229851	GENERIC_DAY	1	1	2010-05-25	2249	\N	139489	\N
229852	GENERIC_DAY	1	1	2010-04-15	2235	\N	139489	\N
229853	GENERIC_DAY	1	0	2010-02-23	2225	\N	139489	\N
229854	GENERIC_DAY	1	1	2010-05-21	2235	\N	139489	\N
229855	GENERIC_DAY	1	1	2010-07-27	2241	\N	139489	\N
229856	GENERIC_DAY	1	0	2010-03-20	2231	\N	139489	\N
229857	GENERIC_DAY	1	1	2010-07-02	2249	\N	139489	\N
229858	GENERIC_DAY	1	0	2010-04-09	2237	\N	139489	\N
229859	GENERIC_DAY	1	0	2010-03-04	2249	\N	139489	\N
229860	GENERIC_DAY	1	0	2010-07-05	2237	\N	139489	\N
229861	GENERIC_DAY	1	0	2010-04-02	2229	\N	139489	\N
229862	GENERIC_DAY	1	0	2010-03-13	2225	\N	139489	\N
229863	GENERIC_DAY	1	1	2010-06-14	2235	\N	139489	\N
229864	GENERIC_DAY	1	1	2010-05-31	2223	\N	139489	\N
229865	GENERIC_DAY	1	1	2010-03-12	2241	\N	139489	\N
229866	GENERIC_DAY	1	0	2010-07-12	2247	\N	139489	\N
229867	GENERIC_DAY	1	0	2010-07-11	2225	\N	139489	\N
229868	GENERIC_DAY	1	1	2010-03-05	2251	\N	139489	\N
229869	GENERIC_DAY	1	1	2010-03-24	2229	\N	139489	\N
229870	GENERIC_DAY	1	1	2010-07-16	2251	\N	139489	\N
229871	GENERIC_DAY	1	0	2010-08-21	2235	\N	139489	\N
229872	GENERIC_DAY	1	0	2010-08-05	2225	\N	139489	\N
229873	GENERIC_DAY	1	1	2010-05-21	2251	\N	139489	\N
229874	GENERIC_DAY	1	0	2010-08-09	2247	\N	139489	\N
229875	GENERIC_DAY	1	0	2010-03-03	2225	\N	139489	\N
229876	GENERIC_DAY	1	0	2010-04-07	2249	\N	139489	\N
229877	GENERIC_DAY	1	1	2010-05-11	2239	\N	139489	\N
229878	GENERIC_DAY	1	1	2010-08-18	2243	\N	139489	\N
229879	GENERIC_DAY	1	1	2010-04-28	2223	\N	139489	\N
229880	GENERIC_DAY	1	0	2010-07-31	2243	\N	139489	\N
229881	GENERIC_DAY	1	2	2010-02-24	2237	\N	139489	\N
229882	GENERIC_DAY	1	0	2010-02-28	2243	\N	139489	\N
229883	GENERIC_DAY	1	0	2010-04-01	2229	\N	139489	\N
229884	GENERIC_DAY	1	0	2010-05-29	2247	\N	139489	\N
229885	GENERIC_DAY	1	0	2010-02-27	2249	\N	139489	\N
229886	GENERIC_DAY	1	0	2010-04-25	2247	\N	139489	\N
229887	GENERIC_DAY	1	1	2010-05-11	2223	\N	139489	\N
229888	GENERIC_DAY	1	2	2010-02-23	2237	\N	139489	\N
229889	GENERIC_DAY	1	0	2010-05-28	2237	\N	139489	\N
229890	GENERIC_DAY	1	0	2010-06-08	2245	\N	139489	\N
229891	GENERIC_DAY	1	0	2010-08-17	2225	\N	139489	\N
229892	GENERIC_DAY	1	0	2010-02-21	2239	\N	139489	\N
229893	GENERIC_DAY	1	1	2010-05-26	2231	\N	139489	\N
229894	GENERIC_DAY	1	1	2010-06-22	2231	\N	139489	\N
229895	GENERIC_DAY	1	0	2010-06-19	2245	\N	139489	\N
229896	GENERIC_DAY	1	0	2010-07-24	2233	\N	139489	\N
229897	GENERIC_DAY	1	0	2010-06-20	2235	\N	139489	\N
229898	GENERIC_DAY	1	0	2010-03-07	2243	\N	139489	\N
229899	GENERIC_DAY	1	0	2010-05-15	2223	\N	139489	\N
229900	GENERIC_DAY	1	0	2010-07-03	2239	\N	139489	\N
229901	GENERIC_DAY	1	0	2010-06-04	2233	\N	139489	\N
229902	GENERIC_DAY	1	0	2010-04-24	2241	\N	139489	\N
229903	GENERIC_DAY	1	0	2010-04-25	2229	\N	139489	\N
229904	GENERIC_DAY	1	1	2010-08-20	2245	\N	139489	\N
229905	GENERIC_DAY	1	0	2010-05-07	2225	\N	139489	\N
229906	GENERIC_DAY	1	0	2010-03-24	2249	\N	139489	\N
229907	GENERIC_DAY	1	0	2010-08-21	2247	\N	139489	\N
229908	GENERIC_DAY	1	0	2010-04-23	2223	\N	139489	\N
229909	GENERIC_DAY	1	0	2010-03-28	2225	\N	139489	\N
229910	GENERIC_DAY	1	1	2010-07-01	2241	\N	139489	\N
229911	GENERIC_DAY	1	1	2010-06-23	2223	\N	139489	\N
229912	GENERIC_DAY	1	0	2010-07-25	2231	\N	139489	\N
229913	GENERIC_DAY	1	1	2010-04-09	2223	\N	139489	\N
229914	GENERIC_DAY	1	1	2010-07-07	2229	\N	139489	\N
229915	GENERIC_DAY	1	1	2010-07-20	2231	\N	139489	\N
229916	GENERIC_DAY	1	1	2010-06-03	2249	\N	139489	\N
229917	GENERIC_DAY	1	0	2010-03-12	2239	\N	139489	\N
229918	GENERIC_DAY	1	1	2010-03-22	2241	\N	139489	\N
229919	GENERIC_DAY	1	1	2010-04-26	2249	\N	139489	\N
229920	GENERIC_DAY	1	1	2010-05-26	2249	\N	139489	\N
229921	GENERIC_DAY	1	1	2010-07-06	2229	\N	139489	\N
229922	GENERIC_DAY	1	0	2010-05-25	2247	\N	139489	\N
229923	GENERIC_DAY	1	0	2010-05-27	2247	\N	139489	\N
229924	GENERIC_DAY	1	0	2010-07-30	2245	\N	139489	\N
229925	GENERIC_DAY	1	0	2010-04-08	2239	\N	139489	\N
229926	GENERIC_DAY	1	0	2010-04-10	2243	\N	139489	\N
229927	GENERIC_DAY	1	1	2010-02-26	2241	\N	139489	\N
229928	GENERIC_DAY	1	0	2010-06-26	2241	\N	139489	\N
229929	GENERIC_DAY	1	1	2010-06-30	2231	\N	139489	\N
229930	GENERIC_DAY	1	0	2010-02-28	2225	\N	139489	\N
229931	GENERIC_DAY	1	1	2010-07-23	2235	\N	139489	\N
229932	GENERIC_DAY	1	0	2010-05-01	2237	\N	139489	\N
229933	GENERIC_DAY	1	0	2010-03-27	2241	\N	139489	\N
229934	GENERIC_DAY	1	0	2010-07-17	2241	\N	139489	\N
229935	GENERIC_DAY	1	1	2010-03-10	2237	\N	139489	\N
229936	GENERIC_DAY	1	0	2010-08-07	2245	\N	139489	\N
229937	GENERIC_DAY	1	0	2010-06-17	2247	\N	139489	\N
229938	GENERIC_DAY	1	1	2010-08-05	2249	\N	139489	\N
229939	GENERIC_DAY	1	0	2010-06-23	2247	\N	139489	\N
229940	GENERIC_DAY	1	1	2010-07-21	2223	\N	139489	\N
229941	GENERIC_DAY	1	0	2010-08-09	2225	\N	139489	\N
229942	GENERIC_DAY	1	1	2010-07-27	2251	\N	139489	\N
229943	GENERIC_DAY	1	1	2010-04-14	2239	\N	139489	\N
229944	GENERIC_DAY	1	1	2010-05-31	2239	\N	139489	\N
229945	GENERIC_DAY	1	1	2010-05-18	2235	\N	139489	\N
229946	GENERIC_DAY	1	0	2010-03-14	2241	\N	139489	\N
229947	GENERIC_DAY	1	0	2010-06-03	2245	\N	139489	\N
229948	GENERIC_DAY	1	0	2010-03-10	2233	\N	139489	\N
229949	GENERIC_DAY	1	0	2010-04-18	2249	\N	139489	\N
229950	GENERIC_DAY	1	1	2010-06-01	2235	\N	139489	\N
229951	GENERIC_DAY	1	0	2010-04-20	2225	\N	139489	\N
229952	GENERIC_DAY	1	0	2010-06-04	2237	\N	139489	\N
229953	GENERIC_DAY	1	0	2010-07-30	2233	\N	139489	\N
229954	GENERIC_DAY	1	0	2010-06-13	2235	\N	139489	\N
229955	GENERIC_DAY	1	0	2010-04-25	2225	\N	139489	\N
229956	GENERIC_DAY	1	0	2010-08-02	2243	\N	139489	\N
229957	GENERIC_DAY	1	0	2010-04-02	2247	\N	139489	\N
229958	GENERIC_DAY	1	0	2010-02-23	2247	\N	139489	\N
229959	GENERIC_DAY	1	1	2010-04-27	2235	\N	139489	\N
229960	GENERIC_DAY	1	1	2010-02-24	2223	\N	139489	\N
229961	GENERIC_DAY	1	1	2010-08-16	2237	\N	139489	\N
229962	GENERIC_DAY	1	0	2010-02-25	2247	\N	139489	\N
229963	GENERIC_DAY	1	0	2010-06-05	2229	\N	139489	\N
229964	GENERIC_DAY	1	0	2010-04-04	2245	\N	139489	\N
229965	GENERIC_DAY	1	0	2010-06-12	2225	\N	139489	\N
229966	GENERIC_DAY	1	0	2010-02-23	2231	\N	139489	\N
229967	GENERIC_DAY	1	0	2010-05-05	2237	\N	139489	\N
229968	GENERIC_DAY	1	0	2010-05-29	2229	\N	139489	\N
229969	GENERIC_DAY	1	0	2010-07-26	2225	\N	139489	\N
229970	GENERIC_DAY	1	0	2010-05-14	2245	\N	139489	\N
229971	GENERIC_DAY	1	1	2010-03-25	2241	\N	139489	\N
229972	GENERIC_DAY	1	1	2010-06-25	2251	\N	139489	\N
229973	GENERIC_DAY	1	1	2010-06-02	2239	\N	139489	\N
229974	GENERIC_DAY	1	0	2010-06-26	2251	\N	139489	\N
229975	GENERIC_DAY	1	0	2010-04-06	2225	\N	139489	\N
229976	GENERIC_DAY	1	0	2010-05-23	2233	\N	139489	\N
229977	GENERIC_DAY	1	0	2010-03-29	2233	\N	139489	\N
229978	GENERIC_DAY	1	1	2010-03-10	2251	\N	139489	\N
229979	GENERIC_DAY	1	1	2010-02-18	2223	\N	139489	\N
229980	GENERIC_DAY	1	0	2010-06-13	2251	\N	139489	\N
229981	GENERIC_DAY	1	0	2010-04-25	2231	\N	139489	\N
229982	GENERIC_DAY	1	0	2010-04-09	2245	\N	139489	\N
229983	GENERIC_DAY	1	1	2010-04-08	2251	\N	139489	\N
229984	GENERIC_DAY	1	0	2010-03-09	2231	\N	139489	\N
229985	GENERIC_DAY	1	0	2010-08-21	2237	\N	139489	\N
229986	GENERIC_DAY	1	1	2010-04-12	2235	\N	139489	\N
229987	GENERIC_DAY	1	0	2010-08-12	2223	\N	139489	\N
229988	GENERIC_DAY	1	1	2010-06-16	2249	\N	139489	\N
229989	GENERIC_DAY	1	0	2010-04-05	2235	\N	139489	\N
229990	GENERIC_DAY	1	0	2010-06-27	2241	\N	139489	\N
229991	GENERIC_DAY	1	1	2010-08-02	2235	\N	139489	\N
229992	GENERIC_DAY	1	0	2010-08-22	2247	\N	139489	\N
229993	GENERIC_DAY	1	1	2010-08-13	2235	\N	139489	\N
229994	GENERIC_DAY	1	1	2010-04-12	2229	\N	139489	\N
229995	GENERIC_DAY	1	0	2010-03-01	2239	\N	139489	\N
229996	GENERIC_DAY	1	1	2010-04-13	2235	\N	139489	\N
229997	GENERIC_DAY	1	0	2010-04-27	2237	\N	139489	\N
229998	GENERIC_DAY	1	0	2010-03-30	2247	\N	139489	\N
229999	GENERIC_DAY	1	1	2010-06-17	2223	\N	139489	\N
230000	GENERIC_DAY	1	1	2010-06-16	2239	\N	139489	\N
230001	GENERIC_DAY	1	1	2010-08-02	2251	\N	139489	\N
230002	GENERIC_DAY	1	0	2010-03-07	2245	\N	139489	\N
230003	GENERIC_DAY	1	0	2010-04-24	2249	\N	139489	\N
230004	GENERIC_DAY	1	1	2010-08-13	2239	\N	139489	\N
230005	GENERIC_DAY	1	0	2010-03-22	2243	\N	139489	\N
230006	GENERIC_DAY	1	1	2010-04-28	2241	\N	139489	\N
230007	GENERIC_DAY	1	0	2010-05-20	2225	\N	139489	\N
230008	GENERIC_DAY	1	0	2010-04-25	2249	\N	139489	\N
230009	GENERIC_DAY	1	0	2010-05-04	2225	\N	139489	\N
230010	GENERIC_DAY	1	0	2010-05-29	2233	\N	139489	\N
230011	GENERIC_DAY	1	0	2010-06-11	2245	\N	139489	\N
230012	GENERIC_DAY	1	1	2010-06-15	2223	\N	139489	\N
230013	GENERIC_DAY	1	0	2010-05-08	2233	\N	139489	\N
230014	GENERIC_DAY	1	0	2010-04-13	2237	\N	139489	\N
230015	GENERIC_DAY	1	0	2010-04-09	2239	\N	139489	\N
230016	GENERIC_DAY	1	0	2010-05-26	2237	\N	139489	\N
230017	GENERIC_DAY	1	0	2010-07-07	2243	\N	139489	\N
230018	GENERIC_DAY	1	0	2010-05-17	2243	\N	139489	\N
230019	GENERIC_DAY	1	1	2010-03-12	2237	\N	139489	\N
230020	GENERIC_DAY	1	0	2010-08-23	2225	\N	139489	\N
230021	GENERIC_DAY	1	0	2010-08-11	2233	\N	139489	\N
230022	GENERIC_DAY	1	0	2010-04-11	2223	\N	139489	\N
230023	GENERIC_DAY	1	0	2010-08-21	2241	\N	139489	\N
230024	GENERIC_DAY	1	1	2010-02-24	2251	\N	139489	\N
230025	GENERIC_DAY	1	0	2010-08-03	2237	\N	139489	\N
230026	GENERIC_DAY	1	0	2010-03-01	2233	\N	139489	\N
230027	GENERIC_DAY	1	0	2010-07-06	2247	\N	139489	\N
230028	GENERIC_DAY	1	0	2010-08-08	2247	\N	139489	\N
230029	GENERIC_DAY	1	0	2010-08-08	2233	\N	139489	\N
230030	GENERIC_DAY	1	1	2010-04-07	2231	\N	139489	\N
230031	GENERIC_DAY	1	1	2010-08-02	2223	\N	139489	\N
230032	GENERIC_DAY	1	0	2010-05-30	2247	\N	139489	\N
230033	GENERIC_DAY	1	0	2010-08-22	2249	\N	139489	\N
230034	GENERIC_DAY	1	1	2010-06-09	2231	\N	139489	\N
230035	GENERIC_DAY	1	0	2010-08-01	2229	\N	139489	\N
230036	GENERIC_DAY	1	0	2010-04-25	2241	\N	139489	\N
230037	GENERIC_DAY	1	0	2010-04-24	2251	\N	139489	\N
230038	GENERIC_DAY	1	1	2010-05-07	2249	\N	139489	\N
230039	GENERIC_DAY	1	0	2010-06-24	2245	\N	139489	\N
230040	GENERIC_DAY	1	0	2010-04-30	2245	\N	139489	\N
230041	GENERIC_DAY	1	1	2010-04-07	2229	\N	139489	\N
230042	GENERIC_DAY	1	1	2010-04-21	2229	\N	139489	\N
230043	GENERIC_DAY	1	1	2010-06-21	2241	\N	139489	\N
230044	GENERIC_DAY	1	0	2010-04-20	2245	\N	139489	\N
230045	GENERIC_DAY	1	0	2010-03-27	2237	\N	139489	\N
230046	GENERIC_DAY	1	0	2010-02-20	2233	\N	139489	\N
230047	GENERIC_DAY	1	0	2010-07-23	2231	\N	139489	\N
230048	GENERIC_DAY	1	0	2010-08-04	2247	\N	139489	\N
230049	GENERIC_DAY	1	0	2010-05-25	2233	\N	139489	\N
230050	GENERIC_DAY	1	1	2010-05-12	2249	\N	139489	\N
230051	GENERIC_DAY	1	0	2010-07-03	2245	\N	139489	\N
230052	GENERIC_DAY	1	0	2010-07-11	2247	\N	139489	\N
230053	GENERIC_DAY	1	0	2010-05-12	2247	\N	139489	\N
230054	GENERIC_DAY	1	1	2010-04-07	2223	\N	139489	\N
230055	GENERIC_DAY	1	0	2010-06-07	2237	\N	139489	\N
230056	GENERIC_DAY	1	1	2010-05-06	2251	\N	139489	\N
230057	GENERIC_DAY	1	0	2010-05-24	2233	\N	139489	\N
230058	GENERIC_DAY	1	0	2010-06-09	2243	\N	139489	\N
230059	GENERIC_DAY	1	0	2010-07-27	2237	\N	139489	\N
230060	GENERIC_DAY	1	1	2010-04-14	2231	\N	139489	\N
230061	GENERIC_DAY	1	0	2010-05-22	2239	\N	139489	\N
230062	GENERIC_DAY	1	0	2010-04-17	2251	\N	139489	\N
230063	GENERIC_DAY	1	1	2010-06-07	2231	\N	139489	\N
230064	GENERIC_DAY	1	0	2010-08-19	2231	\N	139489	\N
230065	GENERIC_DAY	1	1	2010-07-26	2223	\N	139489	\N
230066	GENERIC_DAY	1	0	2010-05-18	2243	\N	139489	\N
230067	GENERIC_DAY	1	1	2010-06-18	2239	\N	139489	\N
230068	GENERIC_DAY	1	0	2010-05-16	2241	\N	139489	\N
230069	GENERIC_DAY	1	0	2010-06-12	2247	\N	139489	\N
230070	GENERIC_DAY	1	0	2010-05-08	2247	\N	139489	\N
230071	GENERIC_DAY	1	0	2010-03-09	2235	\N	139489	\N
230072	GENERIC_DAY	1	1	2010-07-09	2251	\N	139489	\N
230073	GENERIC_DAY	1	1	2010-03-30	2251	\N	139489	\N
230074	GENERIC_DAY	1	2	2010-03-01	2237	\N	139489	\N
230075	GENERIC_DAY	1	0	2010-07-22	2243	\N	139489	\N
230076	GENERIC_DAY	1	0	2010-03-20	2225	\N	139489	\N
230077	GENERIC_DAY	1	0	2010-05-22	2235	\N	139489	\N
230078	GENERIC_DAY	1	1	2010-05-27	2223	\N	139489	\N
230079	GENERIC_DAY	1	0	2010-07-15	2247	\N	139489	\N
230080	GENERIC_DAY	1	0	2010-02-19	2225	\N	139489	\N
230081	GENERIC_DAY	1	1	2010-04-06	2231	\N	139489	\N
230082	GENERIC_DAY	1	0	2010-07-02	2237	\N	139489	\N
230083	GENERIC_DAY	1	0	2010-07-28	2247	\N	139489	\N
230084	GENERIC_DAY	1	0	2010-06-01	2247	\N	139489	\N
230085	GENERIC_DAY	1	0	2010-08-13	2251	\N	139489	\N
230086	GENERIC_DAY	1	1	2010-04-19	2231	\N	139489	\N
230087	GENERIC_DAY	1	0	2010-05-24	2247	\N	139489	\N
230088	GENERIC_DAY	1	0	2010-03-20	2245	\N	139489	\N
230089	GENERIC_DAY	1	0	2010-05-23	2229	\N	139489	\N
230090	GENERIC_DAY	1	1	2010-04-05	2245	\N	139489	\N
230091	GENERIC_DAY	1	0	2010-06-14	2245	\N	139489	\N
230092	GENERIC_DAY	1	0	2010-03-27	2245	\N	139489	\N
230093	GENERIC_DAY	1	0	2010-07-08	2243	\N	139489	\N
230094	GENERIC_DAY	1	1	2010-03-26	2237	\N	139489	\N
230095	GENERIC_DAY	1	0	2010-08-24	2251	\N	139489	\N
230096	GENERIC_DAY	1	1	2010-08-17	2251	\N	139489	\N
230097	GENERIC_DAY	1	1	2010-07-22	2249	\N	139489	\N
230098	GENERIC_DAY	1	1	2010-05-10	2251	\N	139489	\N
230099	GENERIC_DAY	1	1	2010-07-14	2241	\N	139489	\N
230100	GENERIC_DAY	1	0	2010-03-25	2239	\N	139489	\N
230101	GENERIC_DAY	1	0	2010-07-12	2225	\N	139489	\N
230102	GENERIC_DAY	1	0	2010-08-22	2241	\N	139489	\N
230103	GENERIC_DAY	1	1	2010-08-11	2245	\N	139489	\N
230104	GENERIC_DAY	1	0	2010-08-16	2225	\N	139489	\N
230105	GENERIC_DAY	1	0	2010-07-08	2245	\N	139489	\N
230106	GENERIC_DAY	1	0	2010-02-16	2235	\N	139489	\N
230107	GENERIC_DAY	1	1	2010-06-10	2251	\N	139489	\N
230108	GENERIC_DAY	1	0	2010-07-13	2233	\N	139489	\N
230109	GENERIC_DAY	1	1	2010-07-27	2239	\N	139489	\N
230110	GENERIC_DAY	1	0	2010-06-30	2237	\N	139489	\N
230111	GENERIC_DAY	1	0	2010-02-22	2249	\N	139489	\N
230112	GENERIC_DAY	1	0	2010-04-17	2239	\N	139489	\N
230113	GENERIC_DAY	1	0	2010-07-10	2243	\N	139489	\N
230114	GENERIC_DAY	1	0	2010-03-11	2231	\N	139489	\N
230115	GENERIC_DAY	1	1	2010-05-13	2241	\N	139489	\N
230116	GENERIC_DAY	1	1	2010-07-15	2239	\N	139489	\N
230117	GENERIC_DAY	1	0	2010-08-02	2237	\N	139489	\N
230118	GENERIC_DAY	1	0	2010-04-02	2231	\N	139489	\N
230119	GENERIC_DAY	1	0	2010-07-11	2241	\N	139489	\N
230120	GENERIC_DAY	1	0	2010-08-15	2241	\N	139489	\N
230121	GENERIC_DAY	1	0	2010-06-22	2243	\N	139489	\N
230122	GENERIC_DAY	1	0	2010-08-24	2233	\N	139489	\N
230123	GENERIC_DAY	1	0	2010-04-26	2247	\N	139489	\N
230124	GENERIC_DAY	1	0	2010-03-01	2247	\N	139489	\N
230125	GENERIC_DAY	1	1	2010-05-05	2249	\N	139489	\N
230126	GENERIC_DAY	1	0	2010-04-22	2247	\N	139489	\N
230127	GENERIC_DAY	1	1	2010-07-05	2229	\N	139489	\N
230128	GENERIC_DAY	1	0	2010-05-21	2223	\N	139489	\N
230129	GENERIC_DAY	1	1	2010-02-19	2241	\N	139489	\N
230130	GENERIC_DAY	1	0	2010-04-22	2225	\N	139489	\N
230131	GENERIC_DAY	1	0	2010-06-16	2247	\N	139489	\N
230132	GENERIC_DAY	1	0	2010-04-02	2241	\N	139489	\N
230133	GENERIC_DAY	1	0	2010-03-16	2239	\N	139489	\N
230134	GENERIC_DAY	1	1	2010-04-19	2235	\N	139489	\N
230135	GENERIC_DAY	1	1	2010-05-21	2239	\N	139489	\N
230136	GENERIC_DAY	1	0	2010-02-19	2249	\N	139489	\N
230137	GENERIC_DAY	1	0	2010-06-13	2237	\N	139489	\N
230138	GENERIC_DAY	1	1	2010-06-18	2251	\N	139489	\N
230139	GENERIC_DAY	1	0	2010-03-31	2243	\N	139489	\N
230140	GENERIC_DAY	1	1	2010-07-05	2249	\N	139489	\N
230141	GENERIC_DAY	1	0	2010-08-12	2233	\N	139489	\N
230142	GENERIC_DAY	1	1	2010-07-30	2249	\N	139489	\N
230143	GENERIC_DAY	1	1	2010-02-17	2229	\N	139489	\N
230144	GENERIC_DAY	1	0	2010-07-13	2225	\N	139489	\N
230145	GENERIC_DAY	1	0	2010-05-17	2231	\N	139489	\N
230146	GENERIC_DAY	1	1	2010-07-01	2251	\N	139489	\N
230147	GENERIC_DAY	1	0	2010-03-31	2247	\N	139489	\N
230148	GENERIC_DAY	1	0	2010-04-15	2237	\N	139489	\N
230149	GENERIC_DAY	1	1	2010-05-03	2239	\N	139489	\N
230150	GENERIC_DAY	1	0	2010-05-28	2233	\N	139489	\N
230151	GENERIC_DAY	1	0	2010-03-19	2239	\N	139489	\N
230152	GENERIC_DAY	1	1	2010-08-18	2245	\N	139489	\N
230153	GENERIC_DAY	1	1	2010-04-29	2239	\N	139489	\N
230154	GENERIC_DAY	1	0	2010-02-22	2243	\N	139489	\N
230155	GENERIC_DAY	1	0	2010-07-12	2237	\N	139489	\N
230156	GENERIC_DAY	1	0	2010-07-16	2237	\N	139489	\N
230157	GENERIC_DAY	1	0	2010-07-14	2233	\N	139489	\N
230158	GENERIC_DAY	1	1	2010-07-29	2251	\N	139489	\N
230159	GENERIC_DAY	1	0	2010-07-28	2237	\N	139489	\N
230160	GENERIC_DAY	1	0	2010-03-13	2235	\N	139489	\N
230161	GENERIC_DAY	1	0	2010-06-27	2249	\N	139489	\N
230162	GENERIC_DAY	1	0	2010-08-21	2251	\N	139489	\N
230163	GENERIC_DAY	1	0	2010-03-17	2235	\N	139489	\N
230164	GENERIC_DAY	1	0	2010-04-29	2233	\N	139489	\N
230165	GENERIC_DAY	1	0	2010-02-18	2247	\N	139489	\N
230166	GENERIC_DAY	1	1	2010-07-16	2239	\N	139489	\N
230167	GENERIC_DAY	1	0	2010-07-10	2237	\N	139489	\N
230168	GENERIC_DAY	1	0	2010-04-02	2243	\N	139489	\N
230169	GENERIC_DAY	1	1	2010-06-24	2223	\N	139489	\N
230170	GENERIC_DAY	1	0	2010-08-07	2229	\N	139489	\N
230171	GENERIC_DAY	1	1	2010-07-05	2241	\N	139489	\N
230172	GENERIC_DAY	1	0	2010-03-24	2235	\N	139489	\N
230173	GENERIC_DAY	1	0	2010-06-29	2245	\N	139489	\N
230174	GENERIC_DAY	1	0	2010-03-03	2247	\N	139489	\N
230175	GENERIC_DAY	1	0	2010-04-22	2245	\N	139489	\N
230176	GENERIC_DAY	1	0	2010-08-02	2247	\N	139489	\N
230177	GENERIC_DAY	1	0	2010-03-02	2235	\N	139489	\N
230178	GENERIC_DAY	1	0	2010-06-08	2247	\N	139489	\N
230179	GENERIC_DAY	1	0	2010-07-18	2241	\N	139489	\N
230180	GENERIC_DAY	1	1	2010-06-23	2231	\N	139489	\N
230181	GENERIC_DAY	1	1	2010-03-30	2241	\N	139489	\N
230182	GENERIC_DAY	1	0	2010-06-24	2237	\N	139489	\N
230183	GENERIC_DAY	1	0	2010-03-20	2229	\N	139489	\N
230184	GENERIC_DAY	1	0	2010-08-05	2243	\N	139489	\N
230185	GENERIC_DAY	1	0	2010-03-03	2231	\N	139489	\N
230186	GENERIC_DAY	1	1	2010-06-15	2251	\N	139489	\N
230187	GENERIC_DAY	1	0	2010-02-27	2243	\N	139489	\N
230188	GENERIC_DAY	1	1	2010-05-10	2229	\N	139489	\N
230189	GENERIC_DAY	1	0	2010-04-02	2237	\N	139489	\N
230190	GENERIC_DAY	1	1	2010-08-05	2239	\N	139489	\N
230191	GENERIC_DAY	1	1	2010-03-17	2223	\N	139489	\N
230192	GENERIC_DAY	1	0	2010-02-28	2245	\N	139489	\N
230193	GENERIC_DAY	1	0	2010-03-26	2239	\N	139489	\N
230194	GENERIC_DAY	1	0	2010-05-15	2251	\N	139489	\N
230195	GENERIC_DAY	1	0	2010-03-13	2239	\N	139489	\N
230196	GENERIC_DAY	1	1	2010-06-14	2223	\N	139489	\N
230197	GENERIC_DAY	1	1	2010-03-04	2229	\N	139489	\N
230198	GENERIC_DAY	1	0	2010-04-01	2235	\N	139489	\N
230199	GENERIC_DAY	1	1	2010-05-03	2249	\N	139489	\N
230200	GENERIC_DAY	1	0	2010-04-14	2249	\N	139489	\N
230201	GENERIC_DAY	1	0	2010-05-22	2249	\N	139489	\N
230202	GENERIC_DAY	1	0	2010-07-04	2231	\N	139489	\N
230203	GENERIC_DAY	1	0	2010-05-08	2237	\N	139489	\N
230204	GENERIC_DAY	1	0	2010-04-28	2247	\N	139489	\N
230205	GENERIC_DAY	1	1	2010-04-06	2229	\N	139489	\N
230206	GENERIC_DAY	1	0	2010-03-23	2243	\N	139489	\N
230207	GENERIC_DAY	1	0	2010-03-07	2223	\N	139489	\N
230208	GENERIC_DAY	1	1	2010-05-06	2249	\N	139489	\N
230209	GENERIC_DAY	1	1	2010-07-19	2241	\N	139489	\N
230210	GENERIC_DAY	1	0	2010-06-12	2231	\N	139489	\N
230211	GENERIC_DAY	1	0	2010-06-15	2243	\N	139489	\N
230212	GENERIC_DAY	1	0	2010-02-27	2223	\N	139489	\N
230213	GENERIC_DAY	1	0	2010-05-29	2225	\N	139489	\N
230214	GENERIC_DAY	1	1	2010-07-02	2239	\N	139489	\N
230215	GENERIC_DAY	1	0	2010-06-05	2245	\N	139489	\N
230216	GENERIC_DAY	1	0	2010-02-20	2223	\N	139489	\N
230217	GENERIC_DAY	1	0	2010-07-06	2225	\N	139489	\N
230218	GENERIC_DAY	1	1	2010-06-04	2239	\N	139489	\N
230219	GENERIC_DAY	1	0	2010-05-31	2245	\N	139489	\N
230220	GENERIC_DAY	1	0	2010-06-01	2237	\N	139489	\N
230221	GENERIC_DAY	1	0	2010-03-08	2225	\N	139489	\N
230222	GENERIC_DAY	1	0	2010-05-19	2247	\N	139489	\N
230223	GENERIC_DAY	1	0	2010-04-11	2243	\N	139489	\N
230224	GENERIC_DAY	1	0	2010-03-12	2249	\N	139489	\N
230225	GENERIC_DAY	1	0	2010-06-21	2237	\N	139489	\N
230226	GENERIC_DAY	1	1	2010-05-18	2231	\N	139489	\N
230227	GENERIC_DAY	1	0	2010-03-29	2231	\N	139489	\N
230228	GENERIC_DAY	1	1	2010-07-06	2223	\N	139489	\N
230229	GENERIC_DAY	1	0	2010-05-30	2237	\N	139489	\N
230230	GENERIC_DAY	1	0	2010-08-24	2239	\N	139489	\N
230231	GENERIC_DAY	1	1	2010-05-27	2235	\N	139489	\N
230232	GENERIC_DAY	1	0	2010-05-10	2225	\N	139489	\N
230233	GENERIC_DAY	1	1	2010-07-07	2239	\N	139489	\N
230234	GENERIC_DAY	1	0	2010-06-10	2233	\N	139489	\N
230235	GENERIC_DAY	1	0	2010-07-28	2225	\N	139489	\N
230236	GENERIC_DAY	1	0	2010-03-21	2247	\N	139489	\N
230237	GENERIC_DAY	1	0	2010-06-20	2251	\N	139489	\N
230238	GENERIC_DAY	1	0	2010-06-19	2249	\N	139489	\N
230239	GENERIC_DAY	1	0	2010-08-22	2231	\N	139489	\N
230240	GENERIC_DAY	1	0	2010-03-14	2239	\N	139489	\N
230241	GENERIC_DAY	1	2	2010-03-15	2237	\N	139489	\N
230242	GENERIC_DAY	1	0	2010-03-14	2231	\N	139489	\N
230243	GENERIC_DAY	1	0	2010-03-13	2233	\N	139489	\N
230244	GENERIC_DAY	1	0	2010-06-08	2233	\N	139489	\N
230245	GENERIC_DAY	1	1	2010-06-14	2229	\N	139489	\N
230246	GENERIC_DAY	1	0	2010-05-09	2245	\N	139489	\N
230247	GENERIC_DAY	1	0	2010-02-22	2247	\N	139489	\N
230248	GENERIC_DAY	1	0	2010-08-08	2251	\N	139489	\N
230249	GENERIC_DAY	1	0	2010-03-27	2243	\N	139489	\N
230250	GENERIC_DAY	1	1	2010-06-08	2241	\N	139489	\N
230251	GENERIC_DAY	1	1	2010-08-06	2243	\N	139489	\N
230252	GENERIC_DAY	1	1	2010-05-05	2223	\N	139489	\N
230253	GENERIC_DAY	1	0	2010-05-25	2243	\N	139489	\N
230254	GENERIC_DAY	1	0	2010-06-27	2233	\N	139489	\N
230255	GENERIC_DAY	1	0	2010-04-17	2249	\N	139489	\N
230256	GENERIC_DAY	1	0	2010-04-10	2249	\N	139489	\N
230257	GENERIC_DAY	1	0	2010-04-08	2249	\N	139489	\N
230258	GENERIC_DAY	1	1	2010-05-14	2239	\N	139489	\N
230259	GENERIC_DAY	1	0	2010-04-24	2233	\N	139489	\N
230260	GENERIC_DAY	1	0	2010-08-14	2235	\N	139489	\N
230261	GENERIC_DAY	1	1	2010-08-09	2235	\N	139489	\N
230262	GENERIC_DAY	1	1	2010-05-04	2241	\N	139489	\N
230263	GENERIC_DAY	1	1	2010-06-09	2229	\N	139489	\N
230264	GENERIC_DAY	1	1	2010-05-07	2251	\N	139489	\N
230265	GENERIC_DAY	1	1	2010-07-26	2241	\N	139489	\N
230266	GENERIC_DAY	1	1	2010-08-12	2243	\N	139489	\N
230267	GENERIC_DAY	1	1	2010-07-06	2249	\N	139489	\N
230268	GENERIC_DAY	1	0	2010-05-24	2225	\N	139489	\N
230269	GENERIC_DAY	1	1	2010-03-24	2223	\N	139489	\N
230270	GENERIC_DAY	1	0	2010-07-31	2233	\N	139489	\N
230271	GENERIC_DAY	1	0	2010-05-27	2233	\N	139489	\N
230272	GENERIC_DAY	1	0	2010-05-29	2241	\N	139489	\N
230273	GENERIC_DAY	1	1	2010-02-26	2245	\N	139489	\N
230274	GENERIC_DAY	1	1	2010-05-26	2251	\N	139489	\N
230275	GENERIC_DAY	1	1	2010-02-22	2251	\N	139489	\N
230276	GENERIC_DAY	1	1	2010-05-11	2235	\N	139489	\N
230277	GENERIC_DAY	1	0	2010-07-18	2235	\N	139489	\N
230278	GENERIC_DAY	1	0	2010-06-18	2225	\N	139489	\N
230279	GENERIC_DAY	1	0	2010-08-15	2237	\N	139489	\N
230280	GENERIC_DAY	1	0	2010-03-15	2233	\N	139489	\N
230281	GENERIC_DAY	1	0	2010-07-02	2231	\N	139489	\N
230282	GENERIC_DAY	1	1	2010-08-02	2229	\N	139489	\N
230283	GENERIC_DAY	1	0	2010-04-18	2231	\N	139489	\N
230284	GENERIC_DAY	1	1	2010-08-02	2249	\N	139489	\N
230285	GENERIC_DAY	1	0	2010-04-06	2239	\N	139489	\N
230286	GENERIC_DAY	1	0	2010-08-15	2231	\N	139489	\N
230287	GENERIC_DAY	1	0	2010-02-22	2233	\N	139489	\N
230288	GENERIC_DAY	1	1	2010-06-08	2235	\N	139489	\N
230289	GENERIC_DAY	1	1	2010-04-08	2245	\N	139489	\N
230290	GENERIC_DAY	1	1	2010-08-11	2251	\N	139489	\N
230291	GENERIC_DAY	1	1	2010-08-19	2251	\N	139489	\N
230292	GENERIC_DAY	1	0	2010-07-27	2247	\N	139489	\N
230293	GENERIC_DAY	1	1	2010-04-19	2251	\N	139489	\N
230294	GENERIC_DAY	1	0	2010-06-23	2237	\N	139489	\N
230295	GENERIC_DAY	1	1	2010-06-30	2229	\N	139489	\N
230296	GENERIC_DAY	1	0	2010-08-01	2223	\N	139489	\N
230297	GENERIC_DAY	1	0	2010-05-08	2241	\N	139489	\N
230298	GENERIC_DAY	1	0	2010-05-27	2243	\N	139489	\N
230299	GENERIC_DAY	1	0	2010-02-25	2225	\N	139489	\N
230300	GENERIC_DAY	1	0	2010-05-16	2243	\N	139489	\N
230301	GENERIC_DAY	1	1	2010-03-15	2223	\N	139489	\N
230302	GENERIC_DAY	1	1	2010-06-03	2241	\N	139489	\N
230303	GENERIC_DAY	1	0	2010-04-30	2231	\N	139489	\N
230304	GENERIC_DAY	1	0	2010-03-30	2225	\N	139489	\N
230305	GENERIC_DAY	1	0	2010-04-29	2245	\N	139489	\N
230306	GENERIC_DAY	1	1	2010-08-18	2241	\N	139489	\N
230307	GENERIC_DAY	1	1	2010-06-21	2251	\N	139489	\N
230308	GENERIC_DAY	1	0	2010-05-28	2223	\N	139489	\N
230309	GENERIC_DAY	1	0	2010-04-15	2243	\N	139489	\N
230310	GENERIC_DAY	1	0	2010-05-22	2243	\N	139489	\N
230311	GENERIC_DAY	1	0	2010-02-27	2251	\N	139489	\N
230312	GENERIC_DAY	1	1	2010-04-21	2223	\N	139489	\N
230313	GENERIC_DAY	1	0	2010-04-14	2237	\N	139489	\N
230314	GENERIC_DAY	1	0	2010-07-25	2245	\N	139489	\N
230315	GENERIC_DAY	1	0	2010-06-22	2245	\N	139489	\N
230316	GENERIC_DAY	1	0	2010-03-21	2239	\N	139489	\N
230317	GENERIC_DAY	1	1	2010-07-20	2239	\N	139489	\N
230318	GENERIC_DAY	1	0	2010-07-24	2223	\N	139489	\N
230319	GENERIC_DAY	1	1	2010-08-10	2223	\N	139489	\N
230320	GENERIC_DAY	1	1	2010-06-23	2229	\N	139489	\N
230321	GENERIC_DAY	1	0	2010-06-05	2235	\N	139489	\N
230322	GENERIC_DAY	1	0	2010-04-24	2231	\N	139489	\N
230323	GENERIC_DAY	1	0	2010-08-24	2241	\N	139489	\N
230324	GENERIC_DAY	1	0	2010-03-31	2239	\N	139489	\N
230325	GENERIC_DAY	1	0	2010-03-06	2225	\N	139489	\N
230326	GENERIC_DAY	1	2	2010-03-24	2245	\N	139489	\N
230327	GENERIC_DAY	1	0	2010-07-11	2223	\N	139489	\N
230328	GENERIC_DAY	1	1	2010-05-14	2249	\N	139489	\N
230329	GENERIC_DAY	1	0	2010-07-17	2233	\N	139489	\N
230330	GENERIC_DAY	1	1	2010-05-05	2239	\N	139489	\N
230331	GENERIC_DAY	1	0	2010-05-13	2233	\N	139489	\N
230332	GENERIC_DAY	1	1	2010-06-24	2229	\N	139489	\N
230333	GENERIC_DAY	1	1	2010-04-15	2231	\N	139489	\N
230334	GENERIC_DAY	1	0	2010-08-11	2229	\N	139489	\N
230335	GENERIC_DAY	1	0	2010-08-04	2245	\N	139489	\N
230336	GENERIC_DAY	1	0	2010-07-24	2229	\N	139489	\N
230337	GENERIC_DAY	1	0	2010-05-09	2233	\N	139489	\N
230338	GENERIC_DAY	1	0	2010-04-03	2235	\N	139489	\N
230339	GENERIC_DAY	1	1	2010-05-04	2231	\N	139489	\N
230340	GENERIC_DAY	1	0	2010-07-29	2247	\N	139489	\N
230341	GENERIC_DAY	1	0	2010-05-03	2225	\N	139489	\N
230342	GENERIC_DAY	1	0	2010-04-05	2247	\N	139489	\N
230343	GENERIC_DAY	1	0	2010-07-25	2249	\N	139489	\N
230344	GENERIC_DAY	1	1	2010-05-18	2249	\N	139489	\N
230345	GENERIC_DAY	1	1	2010-07-16	2235	\N	139489	\N
230346	GENERIC_DAY	1	0	2010-08-13	2229	\N	139489	\N
230347	GENERIC_DAY	1	0	2010-03-30	2235	\N	139489	\N
230348	GENERIC_DAY	1	0	2010-07-24	2225	\N	139489	\N
230349	GENERIC_DAY	1	1	2010-04-19	2241	\N	139489	\N
230350	GENERIC_DAY	1	0	2010-06-18	2241	\N	139489	\N
230351	GENERIC_DAY	1	1	2010-04-14	2229	\N	139489	\N
230352	GENERIC_DAY	1	0	2010-04-06	2249	\N	139489	\N
230353	GENERIC_DAY	1	2	2010-02-17	2237	\N	139489	\N
230354	GENERIC_DAY	1	1	2010-03-11	2241	\N	139489	\N
230355	GENERIC_DAY	1	1	2010-08-10	2251	\N	139489	\N
230356	GENERIC_DAY	1	0	2010-03-28	2239	\N	139489	\N
230357	GENERIC_DAY	1	0	2010-03-09	2233	\N	139489	\N
230358	GENERIC_DAY	1	0	2010-04-16	2231	\N	139489	\N
230359	GENERIC_DAY	1	2	2010-03-03	2245	\N	139489	\N
230360	GENERIC_DAY	1	0	2010-05-05	2243	\N	139489	\N
230361	GENERIC_DAY	1	1	2010-05-20	2223	\N	139489	\N
230362	GENERIC_DAY	1	2	2010-03-22	2237	\N	139489	\N
230363	GENERIC_DAY	1	0	2010-08-17	2231	\N	139489	\N
230364	GENERIC_DAY	1	1	2010-08-13	2223	\N	139489	\N
230365	GENERIC_DAY	1	0	2010-02-16	2247	\N	139489	\N
230366	GENERIC_DAY	1	0	2010-06-11	2237	\N	139489	\N
230367	GENERIC_DAY	1	0	2010-03-09	2249	\N	139489	\N
230368	GENERIC_DAY	1	0	2010-04-25	2243	\N	139489	\N
230369	GENERIC_DAY	1	0	2010-02-28	2233	\N	139489	\N
230370	GENERIC_DAY	1	0	2010-05-02	2235	\N	139489	\N
230371	GENERIC_DAY	1	0	2010-06-25	2245	\N	139489	\N
230372	GENERIC_DAY	1	1	2010-06-09	2249	\N	139489	\N
230373	GENERIC_DAY	1	0	2010-06-30	2225	\N	139489	\N
230374	GENERIC_DAY	1	1	2010-07-21	2239	\N	139489	\N
230375	GENERIC_DAY	1	1	2010-04-09	2243	\N	139489	\N
230376	GENERIC_DAY	1	1	2010-02-24	2241	\N	139489	\N
230377	GENERIC_DAY	1	0	2010-03-24	2247	\N	139489	\N
230378	GENERIC_DAY	1	0	2010-05-02	2245	\N	139489	\N
230379	GENERIC_DAY	1	0	2010-04-21	2243	\N	139489	\N
230380	GENERIC_DAY	1	0	2010-02-24	2231	\N	139489	\N
230381	GENERIC_DAY	1	1	2010-07-09	2235	\N	139489	\N
230382	GENERIC_DAY	1	1	2010-05-25	2251	\N	139489	\N
230383	GENERIC_DAY	1	0	2010-06-08	2225	\N	139489	\N
230384	GENERIC_DAY	1	1	2010-06-11	2235	\N	139489	\N
230385	GENERIC_DAY	1	0	2010-03-12	2233	\N	139489	\N
230386	GENERIC_DAY	1	1	2010-05-04	2251	\N	139489	\N
230387	GENERIC_DAY	1	0	2010-08-22	2225	\N	139489	\N
230388	GENERIC_DAY	1	0	2010-03-17	2239	\N	139489	\N
230389	GENERIC_DAY	1	1	2010-04-05	2251	\N	139489	\N
230390	GENERIC_DAY	1	1	2010-06-21	2223	\N	139489	\N
230391	GENERIC_DAY	1	0	2010-04-02	2251	\N	139489	\N
230392	GENERIC_DAY	1	0	2010-03-23	2235	\N	139489	\N
230393	GENERIC_DAY	1	0	2010-02-24	2239	\N	139489	\N
230394	GENERIC_DAY	1	0	2010-06-13	2239	\N	139489	\N
230395	GENERIC_DAY	1	0	2010-04-21	2233	\N	139489	\N
230396	GENERIC_DAY	1	1	2010-07-23	2249	\N	139489	\N
230397	GENERIC_DAY	1	0	2010-04-02	2245	\N	139489	\N
230398	GENERIC_DAY	1	0	2010-06-27	2231	\N	139489	\N
230399	GENERIC_DAY	1	0	2010-04-11	2245	\N	139489	\N
230400	GENERIC_DAY	1	0	2010-04-30	2223	\N	139489	\N
230401	GENERIC_DAY	1	0	2010-04-29	2247	\N	139489	\N
230402	GENERIC_DAY	1	0	2010-06-10	2245	\N	139489	\N
230403	GENERIC_DAY	1	0	2010-05-22	2225	\N	139489	\N
230404	GENERIC_DAY	1	1	2010-03-22	2251	\N	139489	\N
230405	GENERIC_DAY	1	0	2010-04-15	2247	\N	139489	\N
230406	GENERIC_DAY	1	0	2010-07-12	2233	\N	139489	\N
230407	GENERIC_DAY	1	0	2010-06-04	2231	\N	139489	\N
230408	GENERIC_DAY	1	0	2010-04-01	2231	\N	139489	\N
230409	GENERIC_DAY	1	0	2010-08-15	2245	\N	139489	\N
230410	GENERIC_DAY	1	1	2010-06-24	2241	\N	139489	\N
230411	GENERIC_DAY	1	0	2010-06-11	2223	\N	139489	\N
230412	GENERIC_DAY	1	0	2010-08-02	2245	\N	139489	\N
230413	GENERIC_DAY	1	1	2010-07-07	2241	\N	139489	\N
230414	GENERIC_DAY	1	1	2010-07-21	2251	\N	139489	\N
230415	GENERIC_DAY	1	1	2010-04-28	2249	\N	139489	\N
230416	GENERIC_DAY	1	0	2010-05-22	2229	\N	139489	\N
230417	GENERIC_DAY	1	1	2010-08-09	2251	\N	139489	\N
230418	GENERIC_DAY	1	1	2010-08-13	2245	\N	139489	\N
230419	GENERIC_DAY	1	0	2010-05-25	2225	\N	139489	\N
230420	GENERIC_DAY	1	0	2010-05-16	2247	\N	139489	\N
230421	GENERIC_DAY	1	0	2010-05-02	2247	\N	139489	\N
230422	GENERIC_DAY	1	0	2010-08-20	2231	\N	139489	\N
230423	GENERIC_DAY	1	1	2010-05-19	2229	\N	139489	\N
230424	GENERIC_DAY	1	1	2010-08-09	2231	\N	139489	\N
230425	GENERIC_DAY	1	0	2010-04-03	2239	\N	139489	\N
230426	GENERIC_DAY	1	1	2010-08-12	2241	\N	139489	\N
230427	GENERIC_DAY	1	1	2010-07-12	2241	\N	139489	\N
230428	GENERIC_DAY	1	1	2010-07-08	2229	\N	139489	\N
230429	GENERIC_DAY	1	0	2010-06-04	2241	\N	139489	\N
230430	GENERIC_DAY	1	1	2010-03-01	2229	\N	139489	\N
230431	GENERIC_DAY	1	0	2010-05-15	2243	\N	139489	\N
230432	GENERIC_DAY	1	0	2010-03-21	2225	\N	139489	\N
230433	GENERIC_DAY	1	1	2010-06-28	2223	\N	139489	\N
230434	GENERIC_DAY	1	0	2010-03-13	2229	\N	139489	\N
230435	GENERIC_DAY	1	1	2010-04-26	2251	\N	139489	\N
230436	GENERIC_DAY	1	1	2010-08-23	2241	\N	139489	\N
230437	GENERIC_DAY	1	1	2010-03-05	2223	\N	139489	\N
230438	GENERIC_DAY	1	1	2010-05-18	2239	\N	139489	\N
230439	GENERIC_DAY	1	0	2010-08-08	2231	\N	139489	\N
230440	GENERIC_DAY	1	0	2010-03-08	2237	\N	139489	\N
230441	GENERIC_DAY	1	0	2010-06-25	2223	\N	139489	\N
230442	GENERIC_DAY	1	0	2010-02-20	2237	\N	139489	\N
230443	GENERIC_DAY	1	0	2010-08-14	2237	\N	139489	\N
230444	GENERIC_DAY	1	0	2010-07-08	2237	\N	139489	\N
230445	GENERIC_DAY	1	0	2010-07-25	2243	\N	139489	\N
230446	GENERIC_DAY	1	0	2010-06-27	2237	\N	139489	\N
230447	GENERIC_DAY	1	1	2010-05-07	2239	\N	139489	\N
230448	GENERIC_DAY	1	1	2010-05-21	2243	\N	139489	\N
230449	GENERIC_DAY	1	1	2010-06-07	2241	\N	139489	\N
230450	GENERIC_DAY	1	0	2010-02-28	2223	\N	139489	\N
230451	GENERIC_DAY	1	0	2010-04-20	2233	\N	139489	\N
230452	GENERIC_DAY	1	1	2010-07-22	2251	\N	139489	\N
230453	GENERIC_DAY	1	1	2010-03-26	2223	\N	139489	\N
230454	GENERIC_DAY	1	0	2010-05-25	2237	\N	139489	\N
230455	GENERIC_DAY	1	2	2010-03-01	2245	\N	139489	\N
230456	GENERIC_DAY	1	0	2010-03-02	2233	\N	139489	\N
230457	GENERIC_DAY	1	0	2010-06-27	2229	\N	139489	\N
230458	GENERIC_DAY	1	0	2010-07-13	2237	\N	139489	\N
230459	GENERIC_DAY	1	1	2010-03-22	2223	\N	139489	\N
230460	GENERIC_DAY	1	0	2010-05-19	2243	\N	139489	\N
230461	GENERIC_DAY	1	1	2010-07-14	2231	\N	139489	\N
230462	GENERIC_DAY	1	1	2010-04-15	2251	\N	139489	\N
230463	GENERIC_DAY	1	0	2010-07-11	2239	\N	139489	\N
230464	GENERIC_DAY	1	0	2010-08-01	2245	\N	139489	\N
230465	GENERIC_DAY	1	0	2010-03-10	2243	\N	139489	\N
230466	GENERIC_DAY	1	0	2010-07-10	2241	\N	139489	\N
230467	GENERIC_DAY	1	1	2010-05-24	2231	\N	139489	\N
230468	GENERIC_DAY	1	1	2010-04-21	2241	\N	139489	\N
230469	GENERIC_DAY	1	0	2010-08-04	2243	\N	139489	\N
230470	GENERIC_DAY	1	1	2010-07-14	2235	\N	139489	\N
230471	GENERIC_DAY	1	1	2010-05-14	2235	\N	139489	\N
230472	GENERIC_DAY	1	0	2010-05-01	2233	\N	139489	\N
230473	GENERIC_DAY	1	0	2010-02-20	2247	\N	139489	\N
230474	GENERIC_DAY	1	0	2010-06-18	2245	\N	139489	\N
230475	GENERIC_DAY	1	0	2010-08-24	2247	\N	139489	\N
230476	GENERIC_DAY	1	0	2010-06-26	2235	\N	139489	\N
230477	GENERIC_DAY	1	0	2010-08-18	2239	\N	139489	\N
230478	GENERIC_DAY	1	1	2010-04-08	2233	\N	139489	\N
230479	GENERIC_DAY	1	1	2010-04-19	2223	\N	139489	\N
230480	GENERIC_DAY	1	1	2010-04-09	2251	\N	139489	\N
230481	GENERIC_DAY	1	0	2010-02-28	2239	\N	139489	\N
230482	GENERIC_DAY	1	1	2010-03-26	2245	\N	139489	\N
230483	GENERIC_DAY	1	1	2010-04-21	2251	\N	139489	\N
230484	GENERIC_DAY	1	0	2010-02-17	2249	\N	139489	\N
230485	GENERIC_DAY	1	1	2010-04-13	2233	\N	139489	\N
230486	GENERIC_DAY	1	0	2010-06-12	2223	\N	139489	\N
230487	GENERIC_DAY	1	0	2010-07-31	2231	\N	139489	\N
230488	GENERIC_DAY	1	0	2010-07-07	2245	\N	139489	\N
230489	GENERIC_DAY	1	1	2010-08-02	2231	\N	139489	\N
230490	GENERIC_DAY	1	1	2010-08-19	2247	\N	139489	\N
230491	GENERIC_DAY	1	0	2010-04-16	2245	\N	139489	\N
230492	GENERIC_DAY	1	0	2010-06-05	2249	\N	139489	\N
230493	GENERIC_DAY	1	1	2010-05-26	2223	\N	139489	\N
230494	GENERIC_DAY	1	1	2010-03-11	2223	\N	139489	\N
230495	GENERIC_DAY	1	1	2010-07-19	2251	\N	139489	\N
230496	GENERIC_DAY	1	0	2010-04-18	2239	\N	139489	\N
230497	GENERIC_DAY	1	0	2010-08-01	2233	\N	139489	\N
230498	GENERIC_DAY	1	1	2010-06-09	2235	\N	139489	\N
230499	GENERIC_DAY	1	1	2010-03-18	2229	\N	139489	\N
230500	GENERIC_DAY	1	1	2010-06-10	2235	\N	139489	\N
230501	GENERIC_DAY	1	0	2010-07-02	2225	\N	139489	\N
230502	GENERIC_DAY	1	0	2010-07-30	2225	\N	139489	\N
230503	GENERIC_DAY	1	0	2010-07-17	2251	\N	139489	\N
230504	GENERIC_DAY	1	0	2010-06-05	2251	\N	139489	\N
230505	GENERIC_DAY	1	1	2010-06-10	2231	\N	139489	\N
230506	GENERIC_DAY	1	0	2010-05-31	2233	\N	139489	\N
230507	GENERIC_DAY	1	0	2010-04-16	2229	\N	139489	\N
230508	GENERIC_DAY	1	0	2010-04-11	2241	\N	139489	\N
230509	GENERIC_DAY	1	0	2010-03-20	2235	\N	139489	\N
230510	GENERIC_DAY	1	0	2010-07-31	2249	\N	139489	\N
230511	GENERIC_DAY	1	0	2010-08-08	2223	\N	139489	\N
230512	GENERIC_DAY	1	1	2010-07-13	2231	\N	139489	\N
230513	GENERIC_DAY	1	0	2010-05-10	2247	\N	139489	\N
230514	GENERIC_DAY	1	0	2010-03-16	2249	\N	139489	\N
230515	GENERIC_DAY	1	0	2010-08-23	2239	\N	139489	\N
230516	GENERIC_DAY	1	1	2010-05-07	2235	\N	139489	\N
230517	GENERIC_DAY	1	0	2010-04-18	2225	\N	139489	\N
230518	GENERIC_DAY	1	0	2010-05-15	2249	\N	139489	\N
230519	GENERIC_DAY	1	1	2010-07-02	2251	\N	139489	\N
230520	GENERIC_DAY	1	0	2010-08-14	2225	\N	139489	\N
230521	GENERIC_DAY	1	0	2010-05-23	2241	\N	139489	\N
230522	GENERIC_DAY	1	1	2010-08-09	2229	\N	139489	\N
230523	GENERIC_DAY	1	1	2010-08-10	2229	\N	139489	\N
230524	GENERIC_DAY	1	0	2010-02-24	2233	\N	139489	\N
230525	GENERIC_DAY	1	0	2010-07-05	2233	\N	139489	\N
230526	GENERIC_DAY	1	2	2010-02-25	2245	\N	139489	\N
230527	GENERIC_DAY	1	0	2010-07-22	2247	\N	139489	\N
230528	GENERIC_DAY	1	0	2010-04-26	2225	\N	139489	\N
230529	GENERIC_DAY	1	0	2010-03-20	2223	\N	139489	\N
230530	GENERIC_DAY	1	1	2010-05-04	2223	\N	139489	\N
230531	GENERIC_DAY	1	0	2010-05-03	2243	\N	139489	\N
230532	GENERIC_DAY	1	0	2010-07-16	2245	\N	139489	\N
230533	GENERIC_DAY	1	1	2010-08-03	2229	\N	139489	\N
230534	GENERIC_DAY	1	0	2010-07-19	2245	\N	139489	\N
230535	GENERIC_DAY	1	0	2010-02-20	2239	\N	139489	\N
230536	GENERIC_DAY	1	1	2010-06-08	2231	\N	139489	\N
230537	GENERIC_DAY	1	0	2010-07-04	2245	\N	139489	\N
230538	GENERIC_DAY	1	0	2010-03-21	2229	\N	139489	\N
230539	GENERIC_DAY	1	0	2010-04-19	2237	\N	139489	\N
230540	GENERIC_DAY	1	0	2010-08-08	2241	\N	139489	\N
230541	GENERIC_DAY	1	1	2010-03-29	2229	\N	139489	\N
230542	GENERIC_DAY	1	1	2010-04-13	2241	\N	139489	\N
230543	GENERIC_DAY	1	0	2010-05-18	2233	\N	139489	\N
230544	GENERIC_DAY	1	0	2010-06-10	2243	\N	139489	\N
230545	GENERIC_DAY	1	0	2010-07-15	2243	\N	139489	\N
230546	GENERIC_DAY	1	0	2010-02-25	2249	\N	139489	\N
230547	GENERIC_DAY	1	0	2010-07-02	2229	\N	139489	\N
230548	GENERIC_DAY	1	0	2010-08-20	2251	\N	139489	\N
230549	GENERIC_DAY	1	1	2010-08-04	2249	\N	139489	\N
230550	GENERIC_DAY	1	0	2010-08-05	2247	\N	139489	\N
230551	GENERIC_DAY	1	0	2010-08-22	2243	\N	139489	\N
230552	GENERIC_DAY	1	0	2010-08-22	2239	\N	139489	\N
230553	GENERIC_DAY	1	0	2010-02-28	2229	\N	139489	\N
230554	GENERIC_DAY	1	2	2010-03-08	2241	\N	139489	\N
230555	GENERIC_DAY	1	0	2010-07-31	2237	\N	139489	\N
230556	GENERIC_DAY	1	1	2010-08-03	2239	\N	139489	\N
230557	GENERIC_DAY	1	1	2010-05-25	2223	\N	139489	\N
230558	GENERIC_DAY	1	1	2010-07-15	2241	\N	139489	\N
230559	GENERIC_DAY	1	1	2010-07-15	2231	\N	139489	\N
230560	GENERIC_DAY	1	0	2010-04-21	2247	\N	139489	\N
230561	GENERIC_DAY	1	0	2010-04-10	2237	\N	139489	\N
230562	GENERIC_DAY	1	0	2010-06-06	2233	\N	139489	\N
230563	GENERIC_DAY	1	1	2010-06-18	2243	\N	139489	\N
230564	GENERIC_DAY	1	0	2010-07-09	2233	\N	139489	\N
230565	GENERIC_DAY	1	2	2010-02-18	2237	\N	139489	\N
230566	GENERIC_DAY	1	0	2010-05-01	2249	\N	139489	\N
230567	GENERIC_DAY	1	0	2010-08-07	2223	\N	139489	\N
230568	GENERIC_DAY	1	0	2010-04-02	2223	\N	139489	\N
230569	GENERIC_DAY	1	0	2010-05-26	2247	\N	139489	\N
230570	GENERIC_DAY	1	0	2010-04-10	2225	\N	139489	\N
230571	GENERIC_DAY	1	1	2010-06-14	2249	\N	139489	\N
230572	GENERIC_DAY	1	1	2010-04-28	2231	\N	139489	\N
230573	GENERIC_DAY	1	0	2010-08-16	2233	\N	139489	\N
230574	GENERIC_DAY	1	1	2010-07-01	2235	\N	139489	\N
230575	GENERIC_DAY	1	0	2010-03-14	2223	\N	139489	\N
230576	GENERIC_DAY	1	0	2010-04-10	2251	\N	139489	\N
230577	GENERIC_DAY	1	1	2010-06-07	2249	\N	139489	\N
230578	GENERIC_DAY	1	0	2010-08-10	2247	\N	139489	\N
230579	GENERIC_DAY	1	1	2010-03-26	2251	\N	139489	\N
230580	GENERIC_DAY	1	0	2010-07-09	2245	\N	139489	\N
230581	GENERIC_DAY	1	0	2010-04-21	2225	\N	139489	\N
230582	GENERIC_DAY	1	0	2010-03-17	2243	\N	139489	\N
230583	GENERIC_DAY	1	1	2010-03-11	2239	\N	139489	\N
230584	GENERIC_DAY	1	1	2010-03-11	2235	\N	139489	\N
230585	GENERIC_DAY	1	0	2010-05-15	2225	\N	139489	\N
230586	GENERIC_DAY	1	0	2010-04-30	2233	\N	139489	\N
230587	GENERIC_DAY	1	0	2010-03-07	2239	\N	139489	\N
230588	GENERIC_DAY	1	0	2010-08-01	2243	\N	139489	\N
230589	GENERIC_DAY	1	0	2010-07-21	2245	\N	139489	\N
230590	GENERIC_DAY	1	1	2010-06-10	2241	\N	139489	\N
230591	GENERIC_DAY	1	1	2010-04-26	2223	\N	139489	\N
230592	GENERIC_DAY	1	1	2010-07-13	2229	\N	139489	\N
230593	GENERIC_DAY	1	1	2010-08-24	2243	\N	139489	\N
230594	GENERIC_DAY	1	0	2010-04-21	2237	\N	139489	\N
230595	GENERIC_DAY	1	0	2010-08-19	2233	\N	139489	\N
230596	GENERIC_DAY	1	0	2010-06-11	2231	\N	139489	\N
230597	GENERIC_DAY	1	1	2010-07-15	2249	\N	139489	\N
230598	GENERIC_DAY	1	1	2010-02-18	2251	\N	139489	\N
230599	GENERIC_DAY	1	0	2010-07-03	2235	\N	139489	\N
230600	GENERIC_DAY	1	1	2010-06-21	2239	\N	139489	\N
230601	GENERIC_DAY	1	0	2010-04-18	2223	\N	139489	\N
230602	GENERIC_DAY	1	0	2010-03-07	2247	\N	139489	\N
230603	GENERIC_DAY	1	0	2010-06-29	2237	\N	139489	\N
230604	GENERIC_DAY	1	0	2010-03-27	2251	\N	139489	\N
230605	GENERIC_DAY	1	0	2010-04-19	2233	\N	139489	\N
230606	GENERIC_DAY	1	0	2010-04-13	2243	\N	139489	\N
230607	GENERIC_DAY	1	0	2010-07-04	2229	\N	139489	\N
230608	GENERIC_DAY	1	0	2010-04-16	2233	\N	139489	\N
230609	GENERIC_DAY	1	0	2010-04-15	2249	\N	139489	\N
230610	GENERIC_DAY	1	0	2010-08-13	2233	\N	139489	\N
230611	GENERIC_DAY	1	0	2010-05-04	2243	\N	139489	\N
230612	GENERIC_DAY	1	0	2010-08-12	2229	\N	139489	\N
230613	GENERIC_DAY	1	1	2010-05-04	2249	\N	139489	\N
230614	GENERIC_DAY	1	1	2010-03-12	2223	\N	139489	\N
230615	GENERIC_DAY	1	1	2010-08-16	2247	\N	139489	\N
230616	GENERIC_DAY	1	0	2010-05-02	2239	\N	139489	\N
230617	GENERIC_DAY	1	0	2010-05-17	2225	\N	139489	\N
230618	GENERIC_DAY	1	0	2010-05-30	2231	\N	139489	\N
230619	GENERIC_DAY	1	0	2010-08-10	2245	\N	139489	\N
230620	GENERIC_DAY	1	1	2010-06-18	2235	\N	139489	\N
230621	GENERIC_DAY	1	1	2010-07-02	2243	\N	139489	\N
230622	GENERIC_DAY	1	0	2010-05-01	2251	\N	139489	\N
230623	GENERIC_DAY	1	0	2010-07-29	2225	\N	139489	\N
230624	GENERIC_DAY	1	0	2010-08-15	2243	\N	139489	\N
230625	GENERIC_DAY	1	0	2010-03-08	2235	\N	139489	\N
230626	GENERIC_DAY	1	0	2010-04-01	2223	\N	139489	\N
230627	GENERIC_DAY	1	0	2010-08-22	2245	\N	139489	\N
230628	GENERIC_DAY	1	0	2010-02-20	2249	\N	139489	\N
230629	GENERIC_DAY	1	0	2010-03-15	2225	\N	139489	\N
230630	GENERIC_DAY	1	1	2010-08-09	2239	\N	139489	\N
230631	GENERIC_DAY	1	0	2010-05-10	2233	\N	139489	\N
230632	GENERIC_DAY	1	0	2010-04-09	2233	\N	139489	\N
230633	GENERIC_DAY	1	0	2010-05-02	2231	\N	139489	\N
230634	GENERIC_DAY	1	1	2010-02-25	2229	\N	139489	\N
230635	GENERIC_DAY	1	1	2010-03-23	2229	\N	139489	\N
230636	GENERIC_DAY	1	0	2010-08-09	2245	\N	139489	\N
230637	GENERIC_DAY	1	1	2010-04-30	2249	\N	139489	\N
230638	GENERIC_DAY	1	0	2010-04-02	2225	\N	139489	\N
230639	GENERIC_DAY	1	0	2010-03-07	2249	\N	139489	\N
230640	GENERIC_DAY	1	0	2010-06-01	2243	\N	139489	\N
230641	GENERIC_DAY	1	0	2010-04-13	2245	\N	139489	\N
230642	GENERIC_DAY	1	1	2010-06-15	2229	\N	139489	\N
230643	GENERIC_DAY	1	0	2010-04-10	2247	\N	139489	\N
230644	GENERIC_DAY	1	1	2010-07-01	2231	\N	139489	\N
230645	GENERIC_DAY	1	0	2010-02-26	2243	\N	139489	\N
230646	GENERIC_DAY	1	2	2010-03-03	2237	\N	139489	\N
230647	GENERIC_DAY	1	1	2010-06-22	2241	\N	139489	\N
230648	GENERIC_DAY	1	0	2010-02-24	2249	\N	139489	\N
230649	GENERIC_DAY	1	0	2010-02-20	2229	\N	139489	\N
230650	GENERIC_DAY	1	0	2010-06-20	2243	\N	139489	\N
230651	GENERIC_DAY	1	1	2010-04-26	2229	\N	139489	\N
230652	GENERIC_DAY	1	0	2010-03-06	2231	\N	139489	\N
230653	GENERIC_DAY	1	0	2010-04-10	2229	\N	139489	\N
230654	GENERIC_DAY	1	0	2010-03-11	2243	\N	139489	\N
230655	GENERIC_DAY	1	0	2010-06-20	2225	\N	139489	\N
230656	GENERIC_DAY	1	1	2010-05-31	2231	\N	139489	\N
230657	GENERIC_DAY	1	0	2010-03-06	2237	\N	139489	\N
230658	GENERIC_DAY	1	0	2010-04-30	2237	\N	139489	\N
230659	GENERIC_DAY	1	1	2010-04-05	2231	\N	139489	\N
230660	GENERIC_DAY	1	0	2010-06-19	2231	\N	139489	\N
230661	GENERIC_DAY	1	0	2010-05-09	2225	\N	139489	\N
230662	GENERIC_DAY	1	2	2010-02-16	2245	\N	139489	\N
230663	GENERIC_DAY	1	0	2010-03-20	2233	\N	139489	\N
230664	GENERIC_DAY	1	0	2010-04-17	2225	\N	139489	\N
230665	GENERIC_DAY	1	0	2010-07-23	2241	\N	139489	\N
230666	GENERIC_DAY	1	1	2010-07-19	2249	\N	139489	\N
230667	GENERIC_DAY	1	0	2010-06-07	2233	\N	139489	\N
230668	GENERIC_DAY	1	1	2010-02-26	2229	\N	139489	\N
230669	GENERIC_DAY	1	0	2010-03-04	2247	\N	139489	\N
230670	GENERIC_DAY	1	0	2010-06-14	2237	\N	139489	\N
230671	GENERIC_DAY	1	0	2010-05-05	2245	\N	139489	\N
230672	GENERIC_DAY	1	0	2010-06-30	2247	\N	139489	\N
230673	GENERIC_DAY	1	0	2010-03-06	2245	\N	139489	\N
230674	GENERIC_DAY	1	1	2010-02-23	2223	\N	139489	\N
230675	GENERIC_DAY	1	1	2010-07-27	2229	\N	139489	\N
230676	GENERIC_DAY	1	1	2010-07-29	2223	\N	139489	\N
230677	GENERIC_DAY	1	0	2010-04-07	2225	\N	139489	\N
230678	GENERIC_DAY	1	1	2010-02-26	2223	\N	139489	\N
230679	GENERIC_DAY	1	0	2010-06-26	2233	\N	139489	\N
230680	GENERIC_DAY	1	0	2010-07-18	2251	\N	139489	\N
230681	GENERIC_DAY	1	0	2010-05-08	2223	\N	139489	\N
230682	GENERIC_DAY	1	0	2010-07-13	2243	\N	139489	\N
230683	GENERIC_DAY	1	0	2010-05-17	2229	\N	139489	\N
230684	GENERIC_DAY	1	0	2010-03-02	2247	\N	139489	\N
230685	GENERIC_DAY	1	0	2010-07-26	2243	\N	139489	\N
230686	GENERIC_DAY	1	1	2010-06-04	2235	\N	139489	\N
230687	GENERIC_DAY	1	0	2010-05-12	2237	\N	139489	\N
230688	GENERIC_DAY	1	0	2010-05-08	2243	\N	139489	\N
230689	GENERIC_DAY	1	0	2010-08-23	2233	\N	139489	\N
230690	GENERIC_DAY	1	0	2010-06-06	2225	\N	139489	\N
230691	GENERIC_DAY	1	0	2010-03-25	2235	\N	139489	\N
230692	GENERIC_DAY	1	0	2010-05-29	2223	\N	139489	\N
230693	GENERIC_DAY	1	1	2010-07-28	2241	\N	139489	\N
230694	GENERIC_DAY	1	0	2010-07-20	2237	\N	139489	\N
230695	GENERIC_DAY	1	0	2010-07-03	2229	\N	139489	\N
230696	GENERIC_DAY	1	1	2010-06-23	2249	\N	139489	\N
230697	GENERIC_DAY	1	0	2010-04-24	2243	\N	139489	\N
230698	GENERIC_DAY	1	0	2010-06-13	2241	\N	139489	\N
230699	GENERIC_DAY	1	0	2010-04-08	2235	\N	139489	\N
230700	GENERIC_DAY	1	0	2010-06-22	2233	\N	139489	\N
230701	GENERIC_DAY	1	0	2010-03-08	2243	\N	139489	\N
230702	GENERIC_DAY	1	0	2010-07-17	2235	\N	139489	\N
230703	GENERIC_DAY	1	0	2010-05-12	2233	\N	139489	\N
230704	GENERIC_DAY	1	1	2010-05-12	2239	\N	139489	\N
230705	GENERIC_DAY	1	0	2010-05-30	2239	\N	139489	\N
230706	GENERIC_DAY	1	2	2010-03-02	2245	\N	139489	\N
230707	GENERIC_DAY	1	0	2010-05-14	2229	\N	139489	\N
230708	GENERIC_DAY	1	0	2010-03-14	2245	\N	139489	\N
230709	GENERIC_DAY	1	0	2010-07-24	2235	\N	139489	\N
230710	GENERIC_DAY	1	1	2010-08-18	2251	\N	139489	\N
230711	GENERIC_DAY	1	1	2010-05-24	2241	\N	139489	\N
230712	GENERIC_DAY	1	1	2010-05-19	2231	\N	139489	\N
230713	GENERIC_DAY	1	0	2010-08-08	2225	\N	139489	\N
230714	GENERIC_DAY	1	0	2010-05-11	2243	\N	139489	\N
230715	GENERIC_DAY	1	0	2010-03-21	2237	\N	139489	\N
230716	GENERIC_DAY	1	0	2010-02-25	2243	\N	139489	\N
230717	GENERIC_DAY	1	0	2010-05-11	2225	\N	139489	\N
230718	GENERIC_DAY	1	1	2010-04-05	2233	\N	139489	\N
230719	GENERIC_DAY	1	0	2010-08-21	2245	\N	139489	\N
230720	GENERIC_DAY	1	0	2010-02-21	2237	\N	139489	\N
230721	GENERIC_DAY	1	0	2010-03-18	2225	\N	139489	\N
230722	GENERIC_DAY	1	1	2010-05-20	2249	\N	139489	\N
230723	GENERIC_DAY	1	0	2010-06-19	2235	\N	139489	\N
230724	GENERIC_DAY	1	0	2010-06-23	2243	\N	139489	\N
230725	GENERIC_DAY	1	0	2010-06-05	2233	\N	139489	\N
230726	GENERIC_DAY	1	1	2010-08-19	2243	\N	139489	\N
230727	GENERIC_DAY	1	1	2010-06-17	2239	\N	139489	\N
230728	GENERIC_DAY	1	1	2010-06-07	2235	\N	139489	\N
230729	GENERIC_DAY	1	0	2010-04-01	2251	\N	139489	\N
230730	GENERIC_DAY	1	1	2010-03-29	2223	\N	139489	\N
230731	GENERIC_DAY	1	0	2010-07-30	2231	\N	139489	\N
230732	GENERIC_DAY	1	0	2010-03-15	2249	\N	139489	\N
230733	GENERIC_DAY	1	0	2010-06-23	2233	\N	139489	\N
230734	GENERIC_DAY	1	1	2010-04-14	2233	\N	139489	\N
230735	GENERIC_DAY	1	1	2010-08-02	2241	\N	139489	\N
230736	GENERIC_DAY	1	0	2010-07-18	2239	\N	139489	\N
230737	GENERIC_DAY	1	0	2010-02-24	2247	\N	139489	\N
230738	GENERIC_DAY	1	1	2010-08-13	2247	\N	139489	\N
230739	GENERIC_DAY	1	0	2010-04-25	2235	\N	139489	\N
230740	GENERIC_DAY	1	1	2010-05-20	2231	\N	139489	\N
230741	GENERIC_DAY	1	0	2010-04-03	2249	\N	139489	\N
230742	GENERIC_DAY	1	0	2010-02-16	2231	\N	139489	\N
230743	GENERIC_DAY	1	0	2010-07-18	2233	\N	139489	\N
230744	GENERIC_DAY	1	0	2010-06-14	2247	\N	139489	\N
230745	GENERIC_DAY	1	0	2010-05-30	2229	\N	139489	\N
230746	GENERIC_DAY	1	0	2010-05-10	2243	\N	139489	\N
230747	GENERIC_DAY	1	0	2010-04-29	2237	\N	139489	\N
230748	GENERIC_DAY	1	0	2010-05-01	2247	\N	139489	\N
230749	GENERIC_DAY	1	0	2010-05-16	2245	\N	139489	\N
230750	GENERIC_DAY	1	0	2010-08-04	2225	\N	139489	\N
230751	GENERIC_DAY	1	1	2010-03-11	2251	\N	139489	\N
230752	GENERIC_DAY	1	0	2010-07-08	2225	\N	139489	\N
230753	GENERIC_DAY	1	1	2010-06-21	2249	\N	139489	\N
230754	GENERIC_DAY	1	0	2010-03-29	2235	\N	139489	\N
230755	GENERIC_DAY	1	1	2010-03-22	2229	\N	139489	\N
230756	GENERIC_DAY	1	0	2010-03-15	2247	\N	139489	\N
230757	GENERIC_DAY	1	1	2010-07-12	2223	\N	139489	\N
230758	GENERIC_DAY	1	0	2010-03-26	2249	\N	139489	\N
230759	GENERIC_DAY	1	0	2010-07-31	2241	\N	139489	\N
230760	GENERIC_DAY	1	1	2010-03-03	2229	\N	139489	\N
230761	GENERIC_DAY	1	0	2010-02-27	2239	\N	139489	\N
230762	GENERIC_DAY	1	0	2010-04-23	2231	\N	139489	\N
230763	GENERIC_DAY	1	0	2010-02-21	2229	\N	139489	\N
230764	GENERIC_DAY	1	0	2010-06-07	2245	\N	139489	\N
230765	GENERIC_DAY	1	0	2010-08-08	2235	\N	139489	\N
230766	GENERIC_DAY	1	0	2010-07-15	2237	\N	139489	\N
230767	GENERIC_DAY	1	0	2010-03-01	2249	\N	139489	\N
230768	GENERIC_DAY	1	1	2010-06-11	2247	\N	139489	\N
230769	GENERIC_DAY	1	1	2010-05-19	2249	\N	139489	\N
230770	GENERIC_DAY	1	0	2010-05-30	2249	\N	139489	\N
230771	GENERIC_DAY	1	0	2010-06-04	2229	\N	139489	\N
230772	GENERIC_DAY	1	1	2010-04-22	2251	\N	139489	\N
230773	GENERIC_DAY	1	0	2010-08-14	2233	\N	139489	\N
230774	GENERIC_DAY	1	0	2010-03-19	2247	\N	139489	\N
230775	GENERIC_DAY	1	0	2010-06-20	2237	\N	139489	\N
230776	GENERIC_DAY	1	0	2010-02-28	2247	\N	139489	\N
230777	GENERIC_DAY	1	0	2010-05-20	2247	\N	139489	\N
230778	GENERIC_DAY	1	0	2010-02-18	2249	\N	139489	\N
230779	GENERIC_DAY	1	1	2010-05-27	2231	\N	139489	\N
230780	GENERIC_DAY	1	0	2010-08-23	2223	\N	139489	\N
230781	GENERIC_DAY	1	0	2010-08-15	2235	\N	139489	\N
230782	GENERIC_DAY	1	1	2010-04-12	2233	\N	139489	\N
230783	GENERIC_DAY	1	0	2010-07-01	2243	\N	139489	\N
230784	GENERIC_DAY	1	0	2010-03-31	2225	\N	139489	\N
230785	GENERIC_DAY	1	1	2010-04-21	2239	\N	139489	\N
230786	GENERIC_DAY	1	0	2010-04-03	2251	\N	139489	\N
230787	GENERIC_DAY	1	0	2010-05-24	2245	\N	139489	\N
230788	GENERIC_DAY	1	1	2010-03-10	2241	\N	139489	\N
230789	GENERIC_DAY	1	0	2010-05-29	2231	\N	139489	\N
230790	GENERIC_DAY	1	0	2010-05-22	2245	\N	139489	\N
230791	GENERIC_DAY	1	0	2010-04-05	2243	\N	139489	\N
230792	GENERIC_DAY	1	0	2010-08-01	2249	\N	139489	\N
230793	GENERIC_DAY	1	1	2010-07-13	2251	\N	139489	\N
230794	GENERIC_DAY	1	0	2010-07-29	2245	\N	139489	\N
230795	GENERIC_DAY	1	0	2010-03-01	2243	\N	139489	\N
230796	GENERIC_DAY	1	0	2010-03-06	2247	\N	139489	\N
230797	GENERIC_DAY	1	1	2010-04-29	2249	\N	139489	\N
230798	GENERIC_DAY	1	0	2010-07-18	2247	\N	139489	\N
230799	GENERIC_DAY	1	0	2010-03-30	2243	\N	139489	\N
230800	GENERIC_DAY	1	0	2010-08-05	2245	\N	139489	\N
230801	GENERIC_DAY	1	0	2010-05-28	2241	\N	139489	\N
230802	GENERIC_DAY	1	0	2010-03-18	2249	\N	139489	\N
230803	GENERIC_DAY	1	0	2010-07-03	2237	\N	139489	\N
230804	GENERIC_DAY	1	0	2010-02-20	2225	\N	139489	\N
230805	GENERIC_DAY	1	0	2010-05-22	2231	\N	139489	\N
230806	GENERIC_DAY	1	0	2010-06-17	2233	\N	139489	\N
230807	GENERIC_DAY	1	1	2010-06-29	2235	\N	139489	\N
230808	GENERIC_DAY	1	0	2010-04-15	2245	\N	139489	\N
230809	GENERIC_DAY	1	1	2010-08-18	2237	\N	139489	\N
230810	GENERIC_DAY	1	1	2010-03-23	2223	\N	139489	\N
230811	GENERIC_DAY	1	1	2010-07-27	2249	\N	139489	\N
230812	GENERIC_DAY	1	0	2010-04-02	2235	\N	139489	\N
230813	GENERIC_DAY	1	0	2010-05-18	2245	\N	139489	\N
230814	GENERIC_DAY	1	0	2010-08-20	2243	\N	139489	\N
230815	GENERIC_DAY	1	0	2010-06-06	2251	\N	139489	\N
230816	GENERIC_DAY	1	0	2010-06-13	2245	\N	139489	\N
230817	GENERIC_DAY	1	0	2010-04-19	2225	\N	139489	\N
230818	GENERIC_DAY	1	1	2010-07-22	2241	\N	139489	\N
230819	GENERIC_DAY	1	0	2010-03-06	2239	\N	139489	\N
230820	GENERIC_DAY	1	1	2010-04-20	2251	\N	139489	\N
230821	GENERIC_DAY	1	1	2010-04-28	2239	\N	139489	\N
230822	GENERIC_DAY	1	1	2010-05-03	2223	\N	139489	\N
230823	GENERIC_DAY	1	0	2010-07-11	2235	\N	139489	\N
230824	GENERIC_DAY	1	0	2010-04-16	2223	\N	139489	\N
230825	GENERIC_DAY	1	0	2010-02-23	2233	\N	139489	\N
230826	GENERIC_DAY	1	0	2010-06-26	2223	\N	139489	\N
230827	GENERIC_DAY	1	0	2010-02-19	2243	\N	139489	\N
230828	GENERIC_DAY	1	0	2010-05-14	2237	\N	139489	\N
230829	GENERIC_DAY	1	0	2010-08-16	2223	\N	139489	\N
230830	GENERIC_DAY	1	1	2010-06-23	2239	\N	139489	\N
230831	GENERIC_DAY	1	1	2010-04-27	2249	\N	139489	\N
230832	GENERIC_DAY	1	0	2010-05-15	2235	\N	139489	\N
230833	GENERIC_DAY	1	1	2010-04-14	2251	\N	139489	\N
230834	GENERIC_DAY	1	0	2010-03-06	2235	\N	139489	\N
230835	GENERIC_DAY	1	1	2010-06-16	2231	\N	139489	\N
230836	GENERIC_DAY	1	0	2010-06-03	2233	\N	139489	\N
230837	GENERIC_DAY	1	1	2010-02-17	2223	\N	139489	\N
230838	GENERIC_DAY	1	0	2010-05-09	2241	\N	139489	\N
230839	GENERIC_DAY	1	1	2010-07-19	2229	\N	139489	\N
230840	GENERIC_DAY	1	0	2010-04-12	2237	\N	139489	\N
230841	GENERIC_DAY	1	0	2010-02-19	2231	\N	139489	\N
230842	GENERIC_DAY	1	0	2010-07-17	2239	\N	139489	\N
230843	GENERIC_DAY	1	0	2010-04-05	2239	\N	139489	\N
230844	GENERIC_DAY	1	1	2010-05-14	2243	\N	139489	\N
230845	GENERIC_DAY	1	0	2010-06-09	2237	\N	139489	\N
230846	GENERIC_DAY	1	0	2010-07-13	2247	\N	139489	\N
230847	GENERIC_DAY	1	0	2010-03-18	2239	\N	139489	\N
230848	GENERIC_DAY	1	0	2010-07-29	2243	\N	139489	\N
230849	GENERIC_DAY	1	0	2010-03-27	2233	\N	139489	\N
230850	GENERIC_DAY	1	0	2010-04-03	2237	\N	139489	\N
230851	GENERIC_DAY	1	0	2010-08-06	2233	\N	139489	\N
230852	GENERIC_DAY	1	0	2010-03-26	2235	\N	139489	\N
230853	GENERIC_DAY	1	0	2010-02-27	2231	\N	139489	\N
230854	GENERIC_DAY	1	1	2010-06-11	2243	\N	139489	\N
230855	GENERIC_DAY	1	0	2010-05-15	2239	\N	139489	\N
230856	GENERIC_DAY	1	0	2010-04-04	2243	\N	139489	\N
230857	GENERIC_DAY	1	0	2010-06-09	2225	\N	139489	\N
230858	GENERIC_DAY	1	0	2010-02-19	2239	\N	139489	\N
230859	GENERIC_DAY	1	1	2010-06-03	2231	\N	139489	\N
230860	GENERIC_DAY	1	1	2010-03-04	2223	\N	139489	\N
230861	GENERIC_DAY	1	1	2010-03-23	2241	\N	139489	\N
230862	GENERIC_DAY	1	0	2010-04-07	2243	\N	139489	\N
230863	GENERIC_DAY	1	1	2010-04-20	2241	\N	139489	\N
230864	GENERIC_DAY	1	0	2010-06-05	2241	\N	139489	\N
230865	GENERIC_DAY	1	0	2010-07-09	2241	\N	139489	\N
230866	GENERIC_DAY	1	0	2010-03-21	2231	\N	139489	\N
230867	GENERIC_DAY	1	1	2010-06-01	2231	\N	139489	\N
230868	GENERIC_DAY	1	1	2010-05-21	2249	\N	139489	\N
230869	GENERIC_DAY	1	0	2010-03-18	2243	\N	139489	\N
230870	GENERIC_DAY	1	0	2010-06-12	2249	\N	139489	\N
230871	GENERIC_DAY	1	0	2010-03-26	2231	\N	139489	\N
230872	GENERIC_DAY	1	0	2010-05-09	2229	\N	139489	\N
230873	GENERIC_DAY	1	1	2010-02-18	2241	\N	139489	\N
230874	GENERIC_DAY	1	0	2010-02-19	2233	\N	139489	\N
230875	GENERIC_DAY	1	1	2010-04-08	2229	\N	139489	\N
230876	GENERIC_DAY	1	0	2010-08-18	2233	\N	139489	\N
230877	GENERIC_DAY	1	0	2010-03-16	2231	\N	139489	\N
230878	GENERIC_DAY	1	0	2010-08-11	2225	\N	139489	\N
230879	GENERIC_DAY	1	0	2010-07-22	2237	\N	139489	\N
230880	GENERIC_DAY	1	1	2010-07-08	2223	\N	139489	\N
230881	GENERIC_DAY	1	1	2010-04-14	2241	\N	139489	\N
230882	GENERIC_DAY	1	1	2010-05-31	2229	\N	139489	\N
230883	GENERIC_DAY	1	0	2010-08-21	2229	\N	139489	\N
230884	GENERIC_DAY	1	1	2010-03-18	2251	\N	139489	\N
230885	GENERIC_DAY	1	0	2010-05-06	2233	\N	139489	\N
230886	GENERIC_DAY	1	0	2010-07-31	2245	\N	139489	\N
230887	GENERIC_DAY	1	1	2010-08-20	2241	\N	139489	\N
230888	GENERIC_DAY	1	0	2010-04-01	2239	\N	139489	\N
230889	GENERIC_DAY	1	1	2010-04-13	2231	\N	139489	\N
230890	GENERIC_DAY	1	1	2010-02-22	2241	\N	139489	\N
230891	GENERIC_DAY	1	0	2010-05-07	2245	\N	139489	\N
230892	GENERIC_DAY	1	0	2010-08-24	2225	\N	139489	\N
230893	GENERIC_DAY	1	0	2010-03-04	2243	\N	139489	\N
230894	GENERIC_DAY	1	0	2010-06-12	2251	\N	139489	\N
230895	GENERIC_DAY	1	1	2010-04-19	2249	\N	139489	\N
230896	GENERIC_DAY	1	0	2010-08-07	2225	\N	139489	\N
230897	GENERIC_DAY	1	1	2010-05-04	2235	\N	139489	\N
230898	GENERIC_DAY	1	1	2010-08-19	2249	\N	139489	\N
230899	GENERIC_DAY	1	0	2010-08-06	2231	\N	139489	\N
230900	GENERIC_DAY	1	0	2010-05-16	2249	\N	139489	\N
230901	GENERIC_DAY	1	1	2010-06-17	2241	\N	139489	\N
230902	GENERIC_DAY	1	2	2010-03-15	2245	\N	139489	\N
230903	GENERIC_DAY	1	0	2010-05-07	2237	\N	139489	\N
230904	GENERIC_DAY	1	0	2010-02-28	2251	\N	139489	\N
230905	GENERIC_DAY	1	0	2010-02-23	2239	\N	139489	\N
230906	GENERIC_DAY	1	1	2010-04-21	2249	\N	139489	\N
230907	GENERIC_DAY	1	0	2010-05-12	2225	\N	139489	\N
230908	GENERIC_DAY	1	0	2010-08-11	2239	\N	139489	\N
230909	GENERIC_DAY	1	0	2010-08-07	2233	\N	139489	\N
230910	GENERIC_DAY	1	0	2010-02-23	2243	\N	139489	\N
230911	GENERIC_DAY	1	0	2010-02-28	2241	\N	139489	\N
230912	GENERIC_DAY	1	0	2010-05-04	2247	\N	139489	\N
230913	GENERIC_DAY	1	0	2010-03-15	2243	\N	139489	\N
230914	GENERIC_DAY	1	0	2010-07-10	2249	\N	139489	\N
230915	GENERIC_DAY	1	1	2010-02-23	2241	\N	139489	\N
230916	GENERIC_DAY	1	1	2010-08-13	2241	\N	139489	\N
230917	GENERIC_DAY	1	1	2010-04-06	2233	\N	139489	\N
230918	GENERIC_DAY	1	0	2010-06-29	2233	\N	139489	\N
230919	GENERIC_DAY	1	0	2010-06-26	2239	\N	139489	\N
230920	GENERIC_DAY	1	0	2010-06-15	2225	\N	139489	\N
230921	GENERIC_DAY	1	0	2010-05-20	2233	\N	139489	\N
230922	GENERIC_DAY	1	0	2010-05-25	2245	\N	139489	\N
230923	GENERIC_DAY	1	2	2010-03-09	2241	\N	139489	\N
230924	GENERIC_DAY	1	1	2010-03-24	2251	\N	139489	\N
230925	GENERIC_DAY	1	1	2010-06-30	2239	\N	139489	\N
230926	GENERIC_DAY	1	1	2010-06-08	2249	\N	139489	\N
230927	GENERIC_DAY	1	1	2010-02-16	2241	\N	139489	\N
230928	GENERIC_DAY	1	1	2010-03-01	2223	\N	139489	\N
230929	GENERIC_DAY	1	0	2010-04-01	2249	\N	139489	\N
230930	GENERIC_DAY	1	1	2010-04-07	2251	\N	139489	\N
230931	GENERIC_DAY	1	1	2010-06-01	2239	\N	139489	\N
230932	GENERIC_DAY	1	0	2010-06-28	2237	\N	139489	\N
230933	GENERIC_DAY	1	0	2010-05-08	2249	\N	139489	\N
230934	GENERIC_DAY	1	1	2010-08-24	2237	\N	139489	\N
230935	GENERIC_DAY	1	0	2010-07-07	2225	\N	139489	\N
230936	GENERIC_DAY	1	0	2010-04-11	2225	\N	139489	\N
230937	GENERIC_DAY	1	1	2010-04-23	2239	\N	139489	\N
230938	GENERIC_DAY	1	1	2010-05-12	2251	\N	139489	\N
230939	GENERIC_DAY	1	1	2010-06-16	2235	\N	139489	\N
230940	GENERIC_DAY	1	1	2010-05-19	2235	\N	139489	\N
230941	GENERIC_DAY	1	0	2010-04-08	2225	\N	139489	\N
230942	GENERIC_DAY	1	0	2010-02-27	2229	\N	139489	\N
230943	GENERIC_DAY	1	1	2010-03-04	2241	\N	139489	\N
230944	GENERIC_DAY	1	0	2010-05-06	2247	\N	139489	\N
230945	GENERIC_DAY	1	1	2010-04-26	2239	\N	139489	\N
230946	GENERIC_DAY	1	1	2010-07-30	2251	\N	139489	\N
230947	GENERIC_DAY	1	0	2010-05-30	2233	\N	139489	\N
230948	GENERIC_DAY	1	0	2010-04-26	2237	\N	139489	\N
230949	GENERIC_DAY	1	0	2010-07-11	2249	\N	139489	\N
230950	GENERIC_DAY	1	0	2010-07-10	2239	\N	139489	\N
230951	GENERIC_DAY	1	1	2010-05-28	2251	\N	139489	\N
230952	GENERIC_DAY	1	1	2010-06-04	2247	\N	139489	\N
230953	GENERIC_DAY	1	0	2010-08-19	2229	\N	139489	\N
230954	GENERIC_DAY	1	1	2010-08-06	2247	\N	139489	\N
230955	GENERIC_DAY	1	1	2010-05-28	2243	\N	139489	\N
230956	GENERIC_DAY	1	0	2010-07-10	2251	\N	139489	\N
230957	GENERIC_DAY	1	0	2010-05-27	2225	\N	139489	\N
230958	GENERIC_DAY	1	0	2010-07-24	2243	\N	139489	\N
230959	GENERIC_DAY	1	0	2010-06-15	2233	\N	139489	\N
230960	GENERIC_DAY	1	0	2010-03-22	2247	\N	139489	\N
230961	GENERIC_DAY	1	1	2010-08-10	2231	\N	139489	\N
230962	GENERIC_DAY	1	0	2010-03-07	2225	\N	139489	\N
230963	GENERIC_DAY	1	0	2010-04-24	2235	\N	139489	\N
230964	GENERIC_DAY	1	0	2010-04-25	2245	\N	139489	\N
230965	GENERIC_DAY	1	1	2010-03-09	2245	\N	139489	\N
230966	GENERIC_DAY	1	0	2010-08-01	2247	\N	139489	\N
230967	GENERIC_DAY	1	0	2010-03-28	2223	\N	139489	\N
230968	GENERIC_DAY	1	0	2010-07-17	2245	\N	139489	\N
230969	GENERIC_DAY	1	1	2010-04-20	2231	\N	139489	\N
230970	GENERIC_DAY	1	0	2010-03-24	2231	\N	139489	\N
230971	GENERIC_DAY	1	0	2010-07-01	2225	\N	139489	\N
230972	GENERIC_DAY	1	1	2010-03-11	2229	\N	139489	\N
230973	GENERIC_DAY	1	1	2010-05-20	2241	\N	139489	\N
230974	GENERIC_DAY	1	1	2010-05-13	2251	\N	139489	\N
230975	GENERIC_DAY	1	0	2010-03-20	2239	\N	139489	\N
230976	GENERIC_DAY	1	0	2010-05-02	2233	\N	139489	\N
230977	GENERIC_DAY	1	0	2010-04-24	2247	\N	139489	\N
230978	GENERIC_DAY	1	0	2010-06-12	2235	\N	139489	\N
230979	GENERIC_DAY	1	0	2010-04-14	2243	\N	139489	\N
230980	GENERIC_DAY	1	0	2010-05-08	2245	\N	139489	\N
230981	GENERIC_DAY	1	1	2010-03-03	2251	\N	139489	\N
230982	GENERIC_DAY	1	0	2010-07-04	2233	\N	139489	\N
230983	GENERIC_DAY	1	0	2010-05-06	2245	\N	139489	\N
230984	GENERIC_DAY	1	0	2010-03-03	2235	\N	139489	\N
230985	GENERIC_DAY	1	0	2010-05-18	2225	\N	139489	\N
230986	GENERIC_DAY	1	1	2010-05-10	2249	\N	139489	\N
230987	GENERIC_DAY	1	0	2010-05-17	2241	\N	139489	\N
230988	GENERIC_DAY	1	0	2010-03-08	2239	\N	139489	\N
230989	GENERIC_DAY	1	0	2010-04-01	2247	\N	139489	\N
230990	GENERIC_DAY	1	0	2010-03-16	2233	\N	139489	\N
230991	GENERIC_DAY	1	0	2010-04-23	2237	\N	139489	\N
230992	GENERIC_DAY	1	0	2010-03-11	2225	\N	139489	\N
230993	GENERIC_DAY	1	1	2010-05-25	2235	\N	139489	\N
230994	GENERIC_DAY	1	0	2010-05-15	2231	\N	139489	\N
230995	GENERIC_DAY	1	1	2010-06-21	2231	\N	139489	\N
230996	GENERIC_DAY	1	0	2010-07-14	2243	\N	139489	\N
230997	GENERIC_DAY	1	0	2010-05-28	2229	\N	139489	\N
230998	GENERIC_DAY	1	1	2010-04-14	2235	\N	139489	\N
230999	GENERIC_DAY	1	1	2010-07-27	2235	\N	139489	\N
231000	GENERIC_DAY	1	1	2010-08-09	2249	\N	139489	\N
231001	GENERIC_DAY	1	0	2010-08-03	2247	\N	139489	\N
231002	GENERIC_DAY	1	0	2010-07-18	2237	\N	139489	\N
231003	GENERIC_DAY	1	1	2010-06-10	2229	\N	139489	\N
231004	GENERIC_DAY	1	0	2010-03-23	2233	\N	139489	\N
231005	GENERIC_DAY	1	1	2010-05-24	2239	\N	139489	\N
231006	GENERIC_DAY	1	0	2010-03-13	2249	\N	139489	\N
231007	GENERIC_DAY	1	2	2010-03-23	2245	\N	139489	\N
231008	GENERIC_DAY	1	0	2010-07-24	2231	\N	139489	\N
231009	GENERIC_DAY	1	1	2010-06-21	2229	\N	139489	\N
231010	GENERIC_DAY	1	0	2010-04-22	2233	\N	139489	\N
231011	GENERIC_DAY	1	0	2010-03-19	2235	\N	139489	\N
231012	GENERIC_DAY	1	0	2010-04-28	2243	\N	139489	\N
231013	GENERIC_DAY	1	0	2010-06-02	2225	\N	139489	\N
231014	GENERIC_DAY	1	1	2010-02-22	2223	\N	139489	\N
231015	GENERIC_DAY	1	0	2010-06-20	2229	\N	139489	\N
231016	GENERIC_DAY	1	0	2010-05-17	2249	\N	139489	\N
231017	GENERIC_DAY	1	1	2010-04-27	2241	\N	139489	\N
231018	GENERIC_DAY	1	1	2010-07-30	2247	\N	139489	\N
231019	GENERIC_DAY	1	1	2010-07-12	2239	\N	139489	\N
231020	GENERIC_DAY	1	0	2010-04-11	2247	\N	139489	\N
231021	GENERIC_DAY	1	0	2010-05-16	2223	\N	139489	\N
231022	GENERIC_DAY	1	0	2010-08-19	2225	\N	139489	\N
231023	GENERIC_DAY	1	1	2010-04-08	2223	\N	139489	\N
231024	GENERIC_DAY	1	0	2010-06-16	2233	\N	139489	\N
231025	GENERIC_DAY	1	0	2010-07-19	2243	\N	139489	\N
231026	GENERIC_DAY	1	1	2010-05-26	2239	\N	139489	\N
231027	GENERIC_DAY	1	1	2010-08-16	2235	\N	139489	\N
231028	GENERIC_DAY	1	1	2010-04-23	2251	\N	139489	\N
231029	GENERIC_DAY	1	0	2010-06-19	2243	\N	139489	\N
231030	GENERIC_DAY	1	1	2010-02-19	2237	\N	139489	\N
231031	GENERIC_DAY	1	1	2010-06-01	2223	\N	139489	\N
231032	GENERIC_DAY	1	1	2010-07-20	2223	\N	139489	\N
231033	GENERIC_DAY	1	0	2010-06-29	2225	\N	139489	\N
231034	GENERIC_DAY	1	0	2010-04-18	2247	\N	139489	\N
231035	GENERIC_DAY	1	2	2010-03-25	2245	\N	139489	\N
231036	GENERIC_DAY	1	0	2010-05-15	2241	\N	139489	\N
231037	GENERIC_DAY	1	0	2010-03-11	2233	\N	139489	\N
231038	GENERIC_DAY	1	1	2010-02-19	2251	\N	139489	\N
231039	GENERIC_DAY	1	0	2010-05-02	2241	\N	139489	\N
231040	GENERIC_DAY	1	1	2010-06-17	2235	\N	139489	\N
231041	GENERIC_DAY	1	0	2010-02-19	2235	\N	139489	\N
231042	GENERIC_DAY	1	1	2010-03-18	2241	\N	139489	\N
231043	GENERIC_DAY	1	1	2010-03-10	2239	\N	139489	\N
231044	GENERIC_DAY	1	1	2010-08-12	2247	\N	139489	\N
231045	GENERIC_DAY	1	1	2010-07-29	2229	\N	139489	\N
231046	GENERIC_DAY	1	0	2010-04-11	2249	\N	139489	\N
231047	GENERIC_DAY	1	2	2010-02-23	2245	\N	139489	\N
231048	GENERIC_DAY	1	0	2010-06-03	2243	\N	139489	\N
231049	GENERIC_DAY	1	1	2010-07-12	2235	\N	139489	\N
231050	GENERIC_DAY	1	0	2010-07-25	2247	\N	139489	\N
231051	GENERIC_DAY	1	0	2010-06-21	2247	\N	139489	\N
231052	GENERIC_DAY	1	1	2010-07-08	2235	\N	139489	\N
231053	GENERIC_DAY	1	0	2010-06-21	2245	\N	139489	\N
231054	GENERIC_DAY	1	0	2010-04-27	2245	\N	139489	\N
231055	GENERIC_DAY	1	1	2010-04-27	2223	\N	139489	\N
231056	GENERIC_DAY	1	0	2010-03-16	2235	\N	139489	\N
231057	GENERIC_DAY	1	1	2010-08-12	2249	\N	139489	\N
231058	GENERIC_DAY	1	0	2010-06-11	2225	\N	139489	\N
231059	GENERIC_DAY	1	0	2010-06-10	2247	\N	139489	\N
231060	GENERIC_DAY	1	1	2010-05-20	2235	\N	139489	\N
231061	GENERIC_DAY	1	0	2010-06-14	2225	\N	139489	\N
231062	GENERIC_DAY	1	1	2010-08-16	2245	\N	139489	\N
231063	GENERIC_DAY	1	0	2010-07-30	2237	\N	139489	\N
231064	GENERIC_DAY	1	2	2010-02-22	2245	\N	139489	\N
231065	GENERIC_DAY	1	0	2010-03-19	2245	\N	139489	\N
231066	GENERIC_DAY	1	0	2010-08-14	2241	\N	139489	\N
231067	GENERIC_DAY	1	1	2010-07-19	2235	\N	139489	\N
231068	GENERIC_DAY	1	0	2010-03-27	2235	\N	139489	\N
231069	GENERIC_DAY	1	0	2010-06-19	2247	\N	139489	\N
231070	GENERIC_DAY	1	1	2010-07-19	2239	\N	139489	\N
231071	GENERIC_DAY	1	0	2010-07-03	2225	\N	139489	\N
231072	GENERIC_DAY	1	0	2010-07-14	2245	\N	139489	\N
231073	GENERIC_DAY	1	1	2010-06-25	2235	\N	139489	\N
231074	GENERIC_DAY	1	0	2010-05-19	2225	\N	139489	\N
231075	GENERIC_DAY	1	0	2010-07-23	2229	\N	139489	\N
231076	GENERIC_DAY	1	1	2010-06-18	2247	\N	139489	\N
231077	GENERIC_DAY	1	1	2010-04-23	2249	\N	139489	\N
231078	GENERIC_DAY	1	0	2010-08-07	2241	\N	139489	\N
231079	GENERIC_DAY	1	0	2010-06-26	2225	\N	139489	\N
231080	GENERIC_DAY	1	0	2010-03-12	2231	\N	139489	\N
231081	GENERIC_DAY	1	1	2010-02-16	2251	\N	139489	\N
231082	GENERIC_DAY	1	0	2010-05-07	2231	\N	139489	\N
231083	GENERIC_DAY	1	1	2010-06-24	2251	\N	139489	\N
231084	GENERIC_DAY	1	0	2010-08-14	2223	\N	139489	\N
231085	GENERIC_DAY	1	0	2010-04-04	2229	\N	139489	\N
231086	GENERIC_DAY	1	0	2010-04-24	2229	\N	139489	\N
231087	GENERIC_DAY	1	0	2010-04-16	2241	\N	139489	\N
231088	GENERIC_DAY	1	0	2010-03-07	2231	\N	139489	\N
231089	GENERIC_DAY	1	1	2010-07-20	2251	\N	139489	\N
231090	GENERIC_DAY	1	0	2010-06-12	2239	\N	139489	\N
231091	GENERIC_DAY	1	1	2010-08-04	2239	\N	139489	\N
231092	GENERIC_DAY	1	0	2010-06-11	2229	\N	139489	\N
231093	GENERIC_DAY	1	0	2010-02-20	2241	\N	139489	\N
231094	GENERIC_DAY	1	1	2010-03-30	2229	\N	139489	\N
231095	GENERIC_DAY	1	0	2010-06-18	2229	\N	139489	\N
231096	GENERIC_DAY	1	0	2010-03-14	2225	\N	139489	\N
231097	GENERIC_DAY	1	0	2010-03-13	2231	\N	139489	\N
231098	GENERIC_DAY	1	1	2010-08-09	2241	\N	139489	\N
231099	GENERIC_DAY	1	0	2010-05-30	2235	\N	139489	\N
231100	GENERIC_DAY	1	0	2010-03-28	2245	\N	139489	\N
231101	GENERIC_DAY	1	1	2010-08-04	2251	\N	139489	\N
231102	GENERIC_DAY	1	1	2010-03-10	2223	\N	139489	\N
231103	GENERIC_DAY	1	1	2010-04-08	2237	\N	139489	\N
231104	GENERIC_DAY	1	1	2010-07-07	2231	\N	139489	\N
231105	GENERIC_DAY	1	1	2010-08-23	2247	\N	139489	\N
231106	GENERIC_DAY	1	1	2010-06-11	2239	\N	139489	\N
231107	GENERIC_DAY	1	1	2010-07-15	2223	\N	139489	\N
231108	GENERIC_DAY	1	0	2010-05-20	2237	\N	139489	\N
231109	GENERIC_DAY	1	0	2010-03-09	2243	\N	139489	\N
231110	GENERIC_DAY	1	0	2010-08-08	2245	\N	139489	\N
231111	GENERIC_DAY	1	1	2010-03-15	2229	\N	139489	\N
231112	GENERIC_DAY	1	0	2010-06-03	2247	\N	139489	\N
231113	GENERIC_DAY	1	1	2010-05-05	2251	\N	139489	\N
231114	GENERIC_DAY	1	0	2010-07-03	2247	\N	139489	\N
231115	GENERIC_DAY	1	0	2010-05-17	2245	\N	139489	\N
231116	GENERIC_DAY	1	0	2010-03-31	2231	\N	139489	\N
231117	GENERIC_DAY	1	1	2010-05-10	2231	\N	139489	\N
231118	GENERIC_DAY	1	0	2010-04-17	2247	\N	139489	\N
231119	GENERIC_DAY	1	1	2010-07-05	2239	\N	139489	\N
231120	GENERIC_DAY	1	0	2010-08-20	2225	\N	139489	\N
231121	GENERIC_DAY	1	0	2010-07-09	2223	\N	139489	\N
231122	GENERIC_DAY	1	1	2010-05-31	2241	\N	139489	\N
231123	GENERIC_DAY	1	0	2010-08-03	2243	\N	139489	\N
231124	GENERIC_DAY	1	0	2010-03-17	2247	\N	139489	\N
231125	GENERIC_DAY	1	0	2010-08-14	2247	\N	139489	\N
231126	GENERIC_DAY	1	0	2010-08-10	2233	\N	139489	\N
231127	GENERIC_DAY	1	0	2010-03-04	2225	\N	139489	\N
231128	GENERIC_DAY	1	0	2010-07-18	2223	\N	139489	\N
231129	GENERIC_DAY	1	1	2010-06-11	2249	\N	139489	\N
231130	GENERIC_DAY	1	0	2010-03-21	2249	\N	139489	\N
231131	GENERIC_DAY	1	1	2010-05-19	2223	\N	139489	\N
231132	GENERIC_DAY	1	1	2010-04-05	2241	\N	139489	\N
231133	GENERIC_DAY	1	0	2010-05-17	2223	\N	139489	\N
231134	GENERIC_DAY	1	1	2010-07-05	2231	\N	139489	\N
231135	GENERIC_DAY	1	1	2010-04-30	2235	\N	139489	\N
231136	GENERIC_DAY	1	0	2010-07-16	2241	\N	139489	\N
231137	GENERIC_DAY	1	1	2010-06-02	2235	\N	139489	\N
231138	GENERIC_DAY	1	0	2010-05-03	2245	\N	139489	\N
231139	GENERIC_DAY	1	1	2010-07-14	2249	\N	139489	\N
231140	GENERIC_DAY	1	0	2010-05-09	2247	\N	139489	\N
231141	GENERIC_DAY	1	0	2010-05-23	2239	\N	139489	\N
231142	GENERIC_DAY	1	1	2010-06-08	2239	\N	139489	\N
231143	GENERIC_DAY	1	0	2010-06-25	2237	\N	139489	\N
231144	GENERIC_DAY	1	1	2010-06-25	2243	\N	139489	\N
231145	GENERIC_DAY	1	0	2010-08-07	2231	\N	139489	\N
231146	GENERIC_DAY	1	1	2010-07-09	2243	\N	139489	\N
231147	GENERIC_DAY	1	1	2010-03-17	2251	\N	139489	\N
231148	GENERIC_DAY	1	0	2010-06-09	2233	\N	139489	\N
231149	GENERIC_DAY	1	0	2010-05-21	2237	\N	139489	\N
231150	GENERIC_DAY	1	0	2010-08-24	2231	\N	139489	\N
231151	GENERIC_DAY	1	0	2010-04-22	2243	\N	139489	\N
231152	GENERIC_DAY	1	1	2010-08-23	2251	\N	139489	\N
231153	GENERIC_DAY	1	0	2010-06-05	2223	\N	139489	\N
231154	GENERIC_DAY	1	0	2010-07-17	2229	\N	139489	\N
231155	GENERIC_DAY	1	0	2010-08-20	2229	\N	139489	\N
231156	GENERIC_DAY	1	0	2010-07-15	2225	\N	139489	\N
231157	GENERIC_DAY	1	0	2010-03-11	2249	\N	139489	\N
231158	GENERIC_DAY	1	0	2010-06-06	2229	\N	139489	\N
231159	GENERIC_DAY	1	0	2010-04-06	2247	\N	139489	\N
231160	GENERIC_DAY	1	0	2010-04-22	2237	\N	139489	\N
231161	GENERIC_DAY	1	0	2010-07-31	2235	\N	139489	\N
231162	GENERIC_DAY	1	1	2010-03-05	2229	\N	139489	\N
231163	GENERIC_DAY	1	0	2010-02-27	2237	\N	139489	\N
231164	GENERIC_DAY	1	1	2010-02-25	2223	\N	139489	\N
231165	GENERIC_DAY	1	1	2010-06-07	2229	\N	139489	\N
231166	GENERIC_DAY	1	0	2010-04-10	2239	\N	139489	\N
231167	GENERIC_DAY	1	0	2010-06-15	2245	\N	139489	\N
231168	GENERIC_DAY	1	0	2010-06-18	2231	\N	139489	\N
231169	GENERIC_DAY	1	0	2010-06-17	2245	\N	139489	\N
231170	GENERIC_DAY	1	0	2010-05-14	2225	\N	139489	\N
231171	GENERIC_DAY	1	0	2010-07-27	2245	\N	139489	\N
231172	GENERIC_DAY	1	1	2010-04-15	2229	\N	139489	\N
231173	GENERIC_DAY	1	1	2010-07-26	2251	\N	139489	\N
231174	GENERIC_DAY	1	0	2010-07-06	2243	\N	139489	\N
231175	GENERIC_DAY	1	2	2010-03-04	2237	\N	139489	\N
231176	GENERIC_DAY	1	1	2010-03-31	2223	\N	139489	\N
231177	GENERIC_DAY	1	0	2010-06-13	2247	\N	139489	\N
231178	GENERIC_DAY	1	1	2010-04-09	2247	\N	139489	\N
231179	GENERIC_DAY	1	0	2010-03-20	2249	\N	139489	\N
231180	GENERIC_DAY	1	0	2010-06-25	2231	\N	139489	\N
231181	GENERIC_DAY	1	0	2010-06-19	2251	\N	139489	\N
231182	GENERIC_DAY	1	0	2010-04-28	2233	\N	139489	\N
231183	GENERIC_DAY	1	0	2010-03-19	2249	\N	139489	\N
231184	GENERIC_DAY	1	1	2010-04-29	2229	\N	139489	\N
231185	GENERIC_DAY	1	0	2010-03-18	2235	\N	139489	\N
231186	GENERIC_DAY	1	0	2010-06-07	2247	\N	139489	\N
231187	GENERIC_DAY	1	1	2010-03-15	2251	\N	139489	\N
231188	GENERIC_DAY	1	1	2010-08-05	2231	\N	139489	\N
231189	GENERIC_DAY	1	0	2010-03-23	2225	\N	139489	\N
231190	GENERIC_DAY	1	0	2010-06-07	2225	\N	139489	\N
231191	GENERIC_DAY	1	0	2010-02-21	2249	\N	139489	\N
231192	GENERIC_DAY	1	0	2010-04-27	2247	\N	139489	\N
231193	GENERIC_DAY	1	0	2010-08-21	2233	\N	139489	\N
231194	GENERIC_DAY	1	0	2010-07-09	2231	\N	139489	\N
231195	GENERIC_DAY	1	0	2010-06-13	2231	\N	139489	\N
231196	GENERIC_DAY	1	0	2010-07-21	2243	\N	139489	\N
231197	GENERIC_DAY	1	0	2010-06-21	2233	\N	139489	\N
231198	GENERIC_DAY	1	1	2010-05-06	2223	\N	139489	\N
231199	GENERIC_DAY	1	1	2010-07-09	2239	\N	139489	\N
231200	GENERIC_DAY	1	0	2010-07-04	2225	\N	139489	\N
231201	GENERIC_DAY	1	1	2010-03-11	2245	\N	139489	\N
231202	GENERIC_DAY	1	0	2010-03-28	2235	\N	139489	\N
231203	GENERIC_DAY	1	0	2010-08-03	2245	\N	139489	\N
231204	GENERIC_DAY	1	0	2010-05-26	2243	\N	139489	\N
231205	GENERIC_DAY	1	0	2010-04-13	2225	\N	139489	\N
231206	GENERIC_DAY	1	0	2010-04-28	2245	\N	139489	\N
231207	GENERIC_DAY	1	1	2010-04-19	2229	\N	139489	\N
231208	GENERIC_DAY	1	0	2010-04-29	2243	\N	139489	\N
231209	GENERIC_DAY	1	0	2010-02-18	2225	\N	139489	\N
231210	GENERIC_DAY	1	0	2010-07-10	2245	\N	139489	\N
231211	GENERIC_DAY	1	0	2010-04-20	2243	\N	139489	\N
231212	GENERIC_DAY	1	0	2010-04-30	2241	\N	139489	\N
231213	GENERIC_DAY	1	1	2010-08-20	2223	\N	139489	\N
231214	GENERIC_DAY	1	1	2010-07-15	2235	\N	139489	\N
231215	GENERIC_DAY	1	0	2010-05-21	2245	\N	139489	\N
231216	GENERIC_DAY	1	1	2010-06-16	2229	\N	139489	\N
231217	GENERIC_DAY	1	0	2010-06-05	2225	\N	139489	\N
231218	GENERIC_DAY	1	0	2010-05-30	2243	\N	139489	\N
231219	GENERIC_DAY	1	0	2010-07-31	2239	\N	139489	\N
231220	GENERIC_DAY	1	0	2010-06-20	2233	\N	139489	\N
231221	GENERIC_DAY	1	1	2010-02-16	2229	\N	139489	\N
231222	GENERIC_DAY	1	0	2010-07-23	2225	\N	139489	\N
231223	GENERIC_DAY	1	1	2010-08-10	2241	\N	139489	\N
231224	GENERIC_DAY	1	0	2010-07-03	2231	\N	139489	\N
231225	GENERIC_DAY	1	0	2010-05-27	2245	\N	139489	\N
231226	GENERIC_DAY	1	0	2010-03-28	2237	\N	139489	\N
231227	GENERIC_DAY	1	1	2010-03-31	2241	\N	139489	\N
231228	GENERIC_DAY	1	1	2010-07-05	2235	\N	139489	\N
231229	GENERIC_DAY	1	1	2010-05-11	2249	\N	139489	\N
231230	GENERIC_DAY	1	0	2010-04-01	2225	\N	139489	\N
231231	GENERIC_DAY	1	1	2010-06-03	2235	\N	139489	\N
231232	GENERIC_DAY	1	1	2010-05-05	2229	\N	139489	\N
231233	GENERIC_DAY	1	0	2010-03-05	2235	\N	139489	\N
231234	GENERIC_DAY	1	1	2010-07-07	2223	\N	139489	\N
231235	GENERIC_DAY	1	0	2010-04-11	2229	\N	139489	\N
231236	GENERIC_DAY	1	1	2010-05-28	2249	\N	139489	\N
231237	GENERIC_DAY	1	0	2010-04-13	2249	\N	139489	\N
231238	GENERIC_DAY	1	0	2010-05-04	2233	\N	139489	\N
231239	GENERIC_DAY	1	1	2010-06-09	2251	\N	139489	\N
231240	GENERIC_DAY	1	1	2010-04-30	2247	\N	139489	\N
231241	GENERIC_DAY	1	0	2010-07-27	2225	\N	139489	\N
231242	GENERIC_DAY	1	1	2010-04-12	2239	\N	139489	\N
231243	GENERIC_DAY	1	0	2010-06-29	2243	\N	139489	\N
231244	GENERIC_DAY	1	0	2010-07-26	2245	\N	139489	\N
231245	GENERIC_DAY	1	1	2010-08-23	2235	\N	139489	\N
231246	GENERIC_DAY	1	0	2010-03-15	2231	\N	139489	\N
231247	GENERIC_DAY	1	1	2010-04-05	2237	\N	139489	\N
231248	GENERIC_DAY	1	0	2010-05-14	2241	\N	139489	\N
231249	GENERIC_DAY	1	0	2010-02-16	2233	\N	139489	\N
231250	GENERIC_DAY	1	0	2010-07-01	2233	\N	139489	\N
231251	GENERIC_DAY	1	0	2010-08-24	2223	\N	139489	\N
231252	GENERIC_DAY	1	1	2010-07-13	2249	\N	139489	\N
231253	GENERIC_DAY	1	1	2010-06-22	2251	\N	139489	\N
231254	GENERIC_DAY	1	0	2010-07-11	2243	\N	139489	\N
231255	GENERIC_DAY	1	0	2010-02-27	2241	\N	139489	\N
231256	GENERIC_DAY	1	0	2010-05-17	2251	\N	139489	\N
231257	GENERIC_DAY	1	2	2010-03-29	2237	\N	139489	\N
231258	GENERIC_DAY	1	0	2010-05-21	2229	\N	139489	\N
231259	GENERIC_DAY	1	0	2010-07-13	2245	\N	139489	\N
231260	GENERIC_DAY	1	0	2010-05-16	2251	\N	139489	\N
231261	GENERIC_DAY	1	0	2010-05-30	2245	\N	139489	\N
231262	GENERIC_DAY	1	1	2010-06-29	2223	\N	139489	\N
231263	GENERIC_DAY	1	1	2010-06-07	2251	\N	139489	\N
231264	GENERIC_DAY	1	0	2010-03-27	2223	\N	139489	\N
231265	GENERIC_DAY	1	0	2010-06-06	2237	\N	139489	\N
231266	GENERIC_DAY	1	0	2010-08-13	2249	\N	139489	\N
231267	GENERIC_DAY	1	0	2010-02-24	2225	\N	139489	\N
231268	GENERIC_DAY	1	0	2010-08-14	2245	\N	139489	\N
231269	GENERIC_DAY	1	0	2010-04-16	2237	\N	139489	\N
231270	GENERIC_DAY	1	1	2010-04-12	2251	\N	139489	\N
231271	GENERIC_DAY	1	0	2010-05-09	2249	\N	139489	\N
231272	GENERIC_DAY	1	1	2010-05-19	2251	\N	139489	\N
231273	GENERIC_DAY	1	0	2010-04-12	2225	\N	139489	\N
231274	GENERIC_DAY	1	0	2010-06-27	2225	\N	139489	\N
231275	GENERIC_DAY	1	0	2010-03-21	2235	\N	139489	\N
231276	GENERIC_DAY	1	0	2010-06-13	2223	\N	139489	\N
231277	GENERIC_DAY	1	1	2010-07-30	2235	\N	139489	\N
231278	GENERIC_DAY	1	0	2010-02-25	2231	\N	139489	\N
231279	GENERIC_DAY	1	0	2010-03-14	2229	\N	139489	\N
231280	GENERIC_DAY	1	1	2010-08-19	2237	\N	139489	\N
231281	GENERIC_DAY	1	1	2010-04-20	2223	\N	139489	\N
231282	GENERIC_DAY	1	1	2010-03-05	2245	\N	139489	\N
231283	GENERIC_DAY	1	1	2010-07-26	2229	\N	139489	\N
231284	GENERIC_DAY	1	0	2010-05-09	2235	\N	139489	\N
231285	GENERIC_DAY	1	1	2010-04-09	2229	\N	139489	\N
231286	GENERIC_DAY	1	1	2010-05-03	2231	\N	139489	\N
231287	GENERIC_DAY	1	0	2010-04-10	2245	\N	139489	\N
231288	GENERIC_DAY	1	1	2010-06-01	2241	\N	139489	\N
231289	GENERIC_DAY	1	1	2010-06-03	2223	\N	139489	\N
231290	GENERIC_DAY	1	0	2010-03-03	2239	\N	139489	\N
231291	GENERIC_DAY	1	0	2010-04-18	2245	\N	139489	\N
231292	GENERIC_DAY	1	0	2010-07-29	2237	\N	139489	\N
231293	GENERIC_DAY	1	0	2010-07-07	2233	\N	139489	\N
231294	GENERIC_DAY	1	0	2010-08-18	2231	\N	139489	\N
231295	GENERIC_DAY	1	0	2010-07-18	2243	\N	139489	\N
231296	GENERIC_DAY	1	0	2010-02-17	2233	\N	139489	\N
231297	GENERIC_DAY	1	0	2010-03-03	2249	\N	139489	\N
231298	GENERIC_DAY	1	0	2010-05-03	2237	\N	139489	\N
231299	GENERIC_DAY	1	1	2010-04-23	2247	\N	139489	\N
231300	GENERIC_DAY	1	1	2010-07-06	2239	\N	139489	\N
231301	GENERIC_DAY	1	0	2010-07-30	2241	\N	139489	\N
231302	GENERIC_DAY	1	0	2010-05-22	2241	\N	139489	\N
231303	GENERIC_DAY	1	0	2010-07-03	2251	\N	139489	\N
231304	GENERIC_DAY	1	1	2010-05-27	2241	\N	139489	\N
231305	GENERIC_DAY	1	1	2010-07-27	2231	\N	139489	\N
231306	GENERIC_DAY	1	1	2010-06-15	2235	\N	139489	\N
231307	GENERIC_DAY	1	0	2010-07-18	2245	\N	139489	\N
231308	GENERIC_DAY	1	0	2010-03-07	2251	\N	139489	\N
231309	GENERIC_DAY	1	0	2010-08-22	2233	\N	139489	\N
231310	GENERIC_DAY	1	1	2010-05-12	2241	\N	139489	\N
231311	GENERIC_DAY	1	1	2010-04-20	2239	\N	139489	\N
231312	GENERIC_DAY	1	0	2010-03-28	2247	\N	139489	\N
231313	GENERIC_DAY	1	0	2010-06-27	2223	\N	139489	\N
231314	GENERIC_DAY	1	1	2010-06-28	2231	\N	139489	\N
231315	GENERIC_DAY	1	1	2010-08-04	2229	\N	139489	\N
231316	GENERIC_DAY	1	1	2010-04-14	2223	\N	139489	\N
231317	GENERIC_DAY	1	0	2010-02-25	2235	\N	139489	\N
231318	GENERIC_DAY	1	1	2010-06-16	2251	\N	139489	\N
231319	GENERIC_DAY	1	1	2010-06-29	2241	\N	139489	\N
231320	GENERIC_DAY	1	1	2010-06-01	2249	\N	139489	\N
231321	GENERIC_DAY	1	0	2010-02-28	2231	\N	139489	\N
231322	GENERIC_DAY	1	1	2010-07-13	2235	\N	139489	\N
231323	GENERIC_DAY	1	0	2010-03-08	2249	\N	139489	\N
231324	GENERIC_DAY	1	1	2010-02-23	2251	\N	139489	\N
231325	GENERIC_DAY	1	0	2010-07-03	2223	\N	139489	\N
231326	GENERIC_DAY	1	0	2010-08-14	2229	\N	139489	\N
231327	GENERIC_DAY	1	1	2010-05-18	2229	\N	139489	\N
231328	GENERIC_DAY	1	0	2010-07-28	2233	\N	139489	\N
231329	GENERIC_DAY	1	1	2010-02-25	2241	\N	139489	\N
231330	GENERIC_DAY	1	0	2010-05-29	2251	\N	139489	\N
231331	GENERIC_DAY	1	0	2010-05-14	2223	\N	139489	\N
231332	GENERIC_DAY	1	0	2010-07-21	2237	\N	139489	\N
231333	GENERIC_DAY	1	1	2010-04-07	2245	\N	139489	\N
231334	GENERIC_DAY	1	1	2010-07-26	2249	\N	139489	\N
231335	GENERIC_DAY	1	0	2010-06-06	2243	\N	139489	\N
231336	GENERIC_DAY	1	1	2010-05-07	2247	\N	139489	\N
231337	GENERIC_DAY	1	1	2010-02-17	2241	\N	139489	\N
231338	GENERIC_DAY	1	0	2010-05-30	2223	\N	139489	\N
231339	GENERIC_DAY	1	1	2010-03-02	2251	\N	139489	\N
231340	GENERIC_DAY	1	1	2010-05-27	2251	\N	139489	\N
231341	GENERIC_DAY	1	0	2010-07-25	2251	\N	139489	\N
231342	GENERIC_DAY	1	0	2010-06-27	2235	\N	139489	\N
231343	GENERIC_DAY	1	0	2010-06-27	2251	\N	139489	\N
231344	GENERIC_DAY	1	1	2010-04-08	2241	\N	139489	\N
231345	GENERIC_DAY	1	0	2010-02-21	2251	\N	139489	\N
231346	GENERIC_DAY	1	0	2010-06-02	2233	\N	139489	\N
231347	GENERIC_DAY	1	1	2010-04-16	2243	\N	139489	\N
231348	GENERIC_DAY	1	0	2010-07-16	2231	\N	139489	\N
231349	GENERIC_DAY	1	1	2010-02-23	2229	\N	139489	\N
231350	GENERIC_DAY	1	0	2010-04-03	2247	\N	139489	\N
231351	GENERIC_DAY	1	0	2010-08-14	2239	\N	139489	\N
231352	GENERIC_DAY	1	0	2010-06-05	2247	\N	139489	\N
231353	GENERIC_DAY	1	0	2010-03-12	2235	\N	139489	\N
231354	GENERIC_DAY	1	1	2010-05-11	2241	\N	139489	\N
231355	GENERIC_DAY	1	0	2010-05-04	2237	\N	139489	\N
231356	GENERIC_DAY	1	0	2010-04-21	2245	\N	139489	\N
231357	GENERIC_DAY	1	2	2010-03-31	2245	\N	139489	\N
231358	GENERIC_DAY	1	1	2010-07-13	2223	\N	139489	\N
231359	GENERIC_DAY	1	0	2010-03-21	2241	\N	139489	\N
231360	GENERIC_DAY	1	0	2010-06-20	2245	\N	139489	\N
231361	GENERIC_DAY	1	0	2010-07-24	2251	\N	139489	\N
231362	GENERIC_DAY	1	0	2010-07-28	2243	\N	139489	\N
231363	GENERIC_DAY	1	0	2010-05-30	2225	\N	139489	\N
231364	GENERIC_DAY	1	0	2010-03-28	2249	\N	139489	\N
231365	GENERIC_DAY	1	0	2010-06-10	2237	\N	139489	\N
231366	GENERIC_DAY	1	0	2010-03-19	2237	\N	139489	\N
231367	GENERIC_DAY	1	0	2010-07-04	2235	\N	139489	\N
231368	GENERIC_DAY	1	1	2010-03-18	2223	\N	139489	\N
231369	GENERIC_DAY	1	0	2010-07-27	2233	\N	139489	\N
231370	GENERIC_DAY	1	1	2010-04-30	2251	\N	139489	\N
231371	GENERIC_DAY	1	0	2010-06-06	2241	\N	139489	\N
231372	GENERIC_DAY	1	1	2010-07-26	2239	\N	139489	\N
231373	GENERIC_DAY	1	1	2010-02-16	2223	\N	139489	\N
231374	GENERIC_DAY	1	0	2010-05-09	2251	\N	139489	\N
231375	GENERIC_DAY	1	0	2010-03-14	2251	\N	139489	\N
231376	GENERIC_DAY	1	0	2010-06-22	2225	\N	139489	\N
231377	GENERIC_DAY	1	0	2010-05-13	2225	\N	139489	\N
231378	GENERIC_DAY	1	0	2010-06-17	2225	\N	139489	\N
231379	GENERIC_DAY	1	1	2010-04-22	2249	\N	139489	\N
231380	GENERIC_DAY	1	0	2010-03-31	2235	\N	139489	\N
231381	GENERIC_DAY	1	1	2010-06-02	2229	\N	139489	\N
231382	GENERIC_DAY	1	1	2010-05-06	2239	\N	139489	\N
231383	GENERIC_DAY	1	1	2010-07-27	2223	\N	139489	\N
231384	GENERIC_DAY	1	1	2010-05-07	2243	\N	139489	\N
231385	GENERIC_DAY	1	0	2010-02-27	2235	\N	139489	\N
231386	GENERIC_DAY	1	0	2010-03-19	2225	\N	139489	\N
231387	GENERIC_DAY	1	0	2010-06-01	2233	\N	139489	\N
231388	GENERIC_DAY	1	1	2010-04-27	2239	\N	139489	\N
231389	GENERIC_DAY	1	2	2010-03-30	2245	\N	139489	\N
231390	GENERIC_DAY	1	0	2010-06-08	2237	\N	139489	\N
231391	GENERIC_DAY	1	1	2010-05-10	2235	\N	139489	\N
231392	GENERIC_DAY	1	1	2010-02-24	2229	\N	139489	\N
231393	GENERIC_DAY	1	0	2010-07-12	2243	\N	139489	\N
231394	GENERIC_DAY	1	1	2010-04-13	2239	\N	139489	\N
231395	GENERIC_DAY	1	0	2010-03-30	2249	\N	139489	\N
231396	GENERIC_DAY	1	1	2010-03-12	2229	\N	139489	\N
231397	GENERIC_DAY	1	1	2010-06-02	2231	\N	139489	\N
231398	GENERIC_DAY	1	1	2010-04-29	2251	\N	139489	\N
231399	GENERIC_DAY	1	0	2010-03-29	2239	\N	139489	\N
231400	GENERIC_DAY	1	0	2010-06-30	2245	\N	139489	\N
231401	GENERIC_DAY	1	1	2010-06-01	2251	\N	139489	\N
231402	GENERIC_DAY	1	1	2010-08-20	2247	\N	139489	\N
231403	GENERIC_DAY	1	0	2010-07-31	2247	\N	139489	\N
231404	GENERIC_DAY	1	0	2010-06-28	2245	\N	139489	\N
231405	GENERIC_DAY	1	1	2010-06-22	2235	\N	139489	\N
231406	GENERIC_DAY	1	0	2010-06-06	2247	\N	139489	\N
231407	GENERIC_DAY	1	0	2010-08-09	2233	\N	139489	\N
231408	GENERIC_DAY	1	0	2010-02-22	2231	\N	139489	\N
231409	GENERIC_DAY	1	0	2010-03-04	2233	\N	139489	\N
231410	GENERIC_DAY	1	0	2010-05-29	2245	\N	139489	\N
231411	GENERIC_DAY	1	0	2010-03-24	2233	\N	139489	\N
231412	GENERIC_DAY	1	0	2010-08-14	2249	\N	139489	\N
231413	GENERIC_DAY	1	0	2010-04-30	2225	\N	139489	\N
231414	GENERIC_DAY	1	0	2010-07-01	2247	\N	139489	\N
231415	GENERIC_DAY	1	0	2010-06-11	2233	\N	139489	\N
231416	GENERIC_DAY	1	0	2010-05-17	2247	\N	139489	\N
231417	GENERIC_DAY	1	1	2010-08-12	2245	\N	139489	\N
231418	GENERIC_DAY	1	0	2010-03-18	2247	\N	139489	\N
231419	GENERIC_DAY	1	0	2010-05-11	2245	\N	139489	\N
231420	GENERIC_DAY	1	0	2010-06-08	2243	\N	139489	\N
231421	GENERIC_DAY	1	1	2010-07-13	2241	\N	139489	\N
231422	GENERIC_DAY	1	1	2010-03-25	2251	\N	139489	\N
231423	GENERIC_DAY	1	0	2010-03-28	2251	\N	139489	\N
231424	GENERIC_DAY	1	0	2010-06-20	2239	\N	139489	\N
231425	GENERIC_DAY	1	2	2010-03-09	2229	\N	139489	\N
231426	GENERIC_DAY	1	1	2010-06-04	2249	\N	139489	\N
231427	GENERIC_DAY	1	0	2010-03-22	2225	\N	139489	\N
231428	GENERIC_DAY	1	0	2010-03-13	2243	\N	139489	\N
231429	GENERIC_DAY	1	0	2010-07-25	2233	\N	139489	\N
231430	GENERIC_DAY	1	0	2010-06-05	2243	\N	139489	\N
231431	GENERIC_DAY	1	0	2010-07-04	2237	\N	139489	\N
231432	GENERIC_DAY	1	0	2010-07-17	2231	\N	139489	\N
231433	GENERIC_DAY	1	0	2010-06-05	2237	\N	139489	\N
231434	GENERIC_DAY	1	0	2010-03-11	2247	\N	139489	\N
231435	GENERIC_DAY	1	0	2010-06-20	2249	\N	139489	\N
231436	GENERIC_DAY	1	1	2010-07-08	2251	\N	139489	\N
231437	GENERIC_DAY	1	1	2010-04-22	2239	\N	139489	\N
231438	GENERIC_DAY	1	0	2010-07-15	2233	\N	139489	\N
231439	GENERIC_DAY	1	0	2010-08-15	2225	\N	139489	\N
231440	GENERIC_DAY	1	0	2010-05-16	2235	\N	139489	\N
231441	GENERIC_DAY	1	1	2010-05-19	2239	\N	139489	\N
231442	GENERIC_DAY	1	0	2010-04-11	2237	\N	139489	\N
231443	GENERIC_DAY	1	0	2010-05-08	2239	\N	139489	\N
231444	GENERIC_DAY	1	0	2010-07-18	2225	\N	139489	\N
231445	GENERIC_DAY	1	0	2010-08-22	2251	\N	139489	\N
231446	GENERIC_DAY	1	1	2010-07-21	2249	\N	139489	\N
231447	GENERIC_DAY	1	0	2010-05-20	2243	\N	139489	\N
231448	GENERIC_DAY	1	1	2010-05-31	2249	\N	139489	\N
231449	GENERIC_DAY	1	0	2010-07-24	2239	\N	139489	\N
231450	GENERIC_DAY	1	1	2010-02-19	2245	\N	139489	\N
231451	GENERIC_DAY	1	0	2010-05-07	2229	\N	139489	\N
231452	GENERIC_DAY	1	0	2010-05-22	2247	\N	139489	\N
231453	GENERIC_DAY	1	0	2010-08-10	2225	\N	139489	\N
231454	GENERIC_DAY	1	0	2010-08-07	2235	\N	139489	\N
231455	GENERIC_DAY	1	0	2010-03-19	2243	\N	139489	\N
231456	GENERIC_DAY	1	0	2010-03-10	2231	\N	139489	\N
231457	GENERIC_DAY	1	0	2010-07-08	2247	\N	139489	\N
231458	GENERIC_DAY	1	0	2010-07-25	2235	\N	139489	\N
231459	GENERIC_DAY	1	0	2010-02-26	2249	\N	139489	\N
231460	GENERIC_DAY	1	0	2010-03-07	2237	\N	139489	\N
231461	GENERIC_DAY	1	0	2010-07-10	2247	\N	139489	\N
231462	GENERIC_DAY	1	0	2010-08-06	2225	\N	139489	\N
231463	GENERIC_DAY	1	1	2010-05-25	2229	\N	139489	\N
231464	GENERIC_DAY	1	0	2010-05-22	2233	\N	139489	\N
231465	GENERIC_DAY	1	0	2010-03-20	2251	\N	139489	\N
231466	GENERIC_DAY	1	0	2010-07-14	2237	\N	139489	\N
231467	GENERIC_DAY	1	0	2010-04-10	2241	\N	139489	\N
231468	GENERIC_DAY	1	0	2010-05-15	2233	\N	139489	\N
231469	GENERIC_DAY	1	0	2010-03-14	2243	\N	139489	\N
231470	GENERIC_DAY	1	0	2010-08-02	2225	\N	139489	\N
231471	GENERIC_DAY	1	0	2010-07-19	2225	\N	139489	\N
231472	GENERIC_DAY	1	0	2010-02-26	2233	\N	139489	\N
231473	GENERIC_DAY	1	1	2010-06-14	2251	\N	139489	\N
231474	GENERIC_DAY	1	0	2010-07-05	2225	\N	139489	\N
231475	GENERIC_DAY	1	0	2010-06-23	2245	\N	139489	\N
231476	GENERIC_DAY	1	0	2010-05-13	2247	\N	139489	\N
231477	GENERIC_DAY	1	0	2010-06-19	2225	\N	139489	\N
231478	GENERIC_DAY	1	0	2010-03-28	2231	\N	139489	\N
231479	GENERIC_DAY	1	0	2010-08-22	2229	\N	139489	\N
231480	GENERIC_DAY	1	0	2010-05-02	2243	\N	139489	\N
231481	GENERIC_DAY	1	0	2010-04-04	2231	\N	139489	\N
231482	GENERIC_DAY	1	1	2010-07-22	2235	\N	139489	\N
231483	GENERIC_DAY	1	0	2010-05-29	2243	\N	139489	\N
231484	GENERIC_DAY	1	0	2010-06-26	2245	\N	139489	\N
231485	GENERIC_DAY	1	1	2010-04-22	2235	\N	139489	\N
231486	GENERIC_DAY	1	0	2010-08-06	2241	\N	139489	\N
231487	GENERIC_DAY	1	0	2010-07-24	2249	\N	139489	\N
231488	GENERIC_DAY	1	1	2010-06-23	2251	\N	139489	\N
231489	GENERIC_DAY	1	1	2010-07-29	2249	\N	139489	\N
231490	GENERIC_DAY	1	0	2010-03-22	2239	\N	139489	\N
231491	GENERIC_DAY	1	0	2010-04-17	2245	\N	139489	\N
231492	GENERIC_DAY	1	0	2010-05-16	2239	\N	139489	\N
231493	GENERIC_DAY	1	0	2010-02-21	2233	\N	139489	\N
231494	GENERIC_DAY	1	0	2010-03-19	2231	\N	139489	\N
231495	GENERIC_DAY	1	1	2010-06-10	2223	\N	139489	\N
231496	GENERIC_DAY	1	1	2010-05-27	2229	\N	139489	\N
231497	GENERIC_DAY	1	0	2010-03-19	2251	\N	139489	\N
231498	GENERIC_DAY	1	0	2010-02-26	2235	\N	139489	\N
231499	GENERIC_DAY	1	0	2010-05-21	2231	\N	139489	\N
231500	GENERIC_DAY	1	0	2010-07-09	2237	\N	139489	\N
231501	GENERIC_DAY	1	0	2010-03-05	2225	\N	139489	\N
231502	GENERIC_DAY	1	1	2010-05-14	2247	\N	139489	\N
231503	GENERIC_DAY	1	0	2010-03-25	2233	\N	139489	\N
231504	GENERIC_DAY	1	0	2010-08-10	2243	\N	139489	\N
231505	GENERIC_DAY	1	0	2010-04-02	2249	\N	139489	\N
231506	GENERIC_DAY	1	1	2010-06-15	2231	\N	139489	\N
231507	GENERIC_DAY	1	0	2010-02-22	2235	\N	139489	\N
231508	GENERIC_DAY	1	0	2010-02-25	2233	\N	139489	\N
231509	GENERIC_DAY	1	0	2010-04-04	2225	\N	139489	\N
231510	GENERIC_DAY	1	0	2010-03-13	2241	\N	139489	\N
231511	GENERIC_DAY	1	1	2010-05-12	2231	\N	139489	\N
231512	GENERIC_DAY	1	0	2010-05-30	2241	\N	139489	\N
231513	GENERIC_DAY	1	1	2010-07-12	2229	\N	139489	\N
231514	GENERIC_DAY	1	0	2010-06-22	2237	\N	139489	\N
231515	GENERIC_DAY	1	1	2010-07-30	2239	\N	139489	\N
231516	GENERIC_DAY	1	0	2010-08-05	2237	\N	139489	\N
231517	GENERIC_DAY	1	1	2010-04-08	2231	\N	139489	\N
231518	GENERIC_DAY	1	0	2010-03-26	2243	\N	139489	\N
231519	GENERIC_DAY	1	0	2010-02-26	2247	\N	139489	\N
231520	GENERIC_DAY	1	0	2010-03-05	2247	\N	139489	\N
231521	GENERIC_DAY	1	0	2010-05-02	2223	\N	139489	\N
231522	GENERIC_DAY	1	1	2010-03-23	2251	\N	139489	\N
231523	GENERIC_DAY	1	1	2010-05-28	2239	\N	139489	\N
231524	GENERIC_DAY	1	1	2010-07-22	2231	\N	139489	\N
231525	GENERIC_DAY	1	0	2010-04-02	2233	\N	139489	\N
231526	GENERIC_DAY	1	1	2010-07-28	2231	\N	139489	\N
231527	GENERIC_DAY	1	0	2010-04-08	2243	\N	139489	\N
231528	GENERIC_DAY	1	1	2010-07-22	2239	\N	139489	\N
231529	GENERIC_DAY	1	1	2010-08-04	2223	\N	139489	\N
231530	GENERIC_DAY	1	0	2010-07-03	2249	\N	139489	\N
231531	GENERIC_DAY	1	1	2010-07-02	2247	\N	139489	\N
231532	GENERIC_DAY	1	0	2010-06-18	2223	\N	139489	\N
231533	GENERIC_DAY	1	0	2010-03-04	2231	\N	139489	\N
231534	GENERIC_DAY	1	0	2010-06-13	2243	\N	139489	\N
231535	GENERIC_DAY	1	1	2010-05-18	2251	\N	139489	\N
231536	GENERIC_DAY	1	0	2010-03-25	2225	\N	139489	\N
231537	GENERIC_DAY	1	1	2010-04-20	2229	\N	139489	\N
231538	GENERIC_DAY	1	0	2010-07-25	2229	\N	139489	\N
231539	GENERIC_DAY	1	0	2010-05-07	2233	\N	139489	\N
231540	GENERIC_DAY	1	1	2010-04-15	2223	\N	139489	\N
231541	GENERIC_DAY	1	0	2010-05-19	2245	\N	139489	\N
231542	GENERIC_DAY	1	0	2010-03-22	2249	\N	139489	\N
231543	GENERIC_DAY	1	1	2010-04-22	2229	\N	139489	\N
231544	GENERIC_DAY	1	1	2010-07-23	2251	\N	139489	\N
231545	GENERIC_DAY	1	1	2010-07-23	2239	\N	139489	\N
231546	GENERIC_DAY	1	1	2010-07-20	2235	\N	139489	\N
231547	GENERIC_DAY	1	0	2010-07-14	2247	\N	139489	\N
231548	GENERIC_DAY	1	0	2010-04-26	2245	\N	139489	\N
231549	GENERIC_DAY	1	1	2010-05-11	2229	\N	139489	\N
231550	GENERIC_DAY	1	1	2010-05-10	2223	\N	139489	\N
231551	GENERIC_DAY	1	1	2010-08-03	2249	\N	139489	\N
231552	GENERIC_DAY	1	0	2010-08-15	2247	\N	139489	\N
231553	GENERIC_DAY	1	0	2010-05-09	2237	\N	139489	\N
231554	GENERIC_DAY	1	0	2010-03-30	2239	\N	139489	\N
231555	GENERIC_DAY	1	1	2010-06-29	2239	\N	139489	\N
231556	GENERIC_DAY	1	1	2010-05-25	2241	\N	139489	\N
231557	GENERIC_DAY	1	0	2010-05-28	2231	\N	139489	\N
231558	GENERIC_DAY	1	0	2010-02-21	2225	\N	139489	\N
231559	GENERIC_DAY	1	0	2010-07-07	2237	\N	139489	\N
231560	GENERIC_DAY	1	0	2010-04-12	2243	\N	139489	\N
231561	GENERIC_DAY	1	1	2010-03-24	2241	\N	139489	\N
231562	GENERIC_DAY	1	1	2010-05-26	2229	\N	139489	\N
231563	GENERIC_DAY	1	0	2010-06-27	2243	\N	139489	\N
231564	GENERIC_DAY	1	1	2010-06-30	2251	\N	139489	\N
231565	GENERIC_DAY	1	0	2010-03-15	2239	\N	139489	\N
231566	GENERIC_DAY	1	0	2010-07-21	2247	\N	139489	\N
231567	GENERIC_DAY	1	0	2010-02-26	2225	\N	139489	\N
231568	GENERIC_DAY	1	1	2010-07-08	2231	\N	139489	\N
231569	GENERIC_DAY	1	1	2010-07-22	2229	\N	139489	\N
231570	GENERIC_DAY	1	1	2010-07-30	2243	\N	139489	\N
231571	GENERIC_DAY	1	1	2010-05-13	2223	\N	139489	\N
231572	GENERIC_DAY	1	1	2010-07-21	2229	\N	139489	\N
231573	GENERIC_DAY	1	1	2010-08-03	2251	\N	139489	\N
231574	GENERIC_DAY	1	0	2010-04-23	2241	\N	139489	\N
231575	GENERIC_DAY	1	0	2010-08-08	2249	\N	139489	\N
231576	GENERIC_DAY	1	0	2010-04-25	2239	\N	139489	\N
231577	GENERIC_DAY	1	0	2010-03-26	2233	\N	139489	\N
231578	GENERIC_DAY	1	0	2010-03-08	2231	\N	139489	\N
231579	GENERIC_DAY	1	0	2010-07-10	2235	\N	139489	\N
231580	GENERIC_DAY	1	1	2010-04-22	2231	\N	139489	\N
231581	GENERIC_DAY	1	0	2010-03-16	2247	\N	139489	\N
231582	GENERIC_DAY	1	1	2010-04-07	2241	\N	139489	\N
231583	GENERIC_DAY	1	0	2010-07-21	2225	\N	139489	\N
231584	GENERIC_DAY	1	0	2010-03-04	2239	\N	139489	\N
231585	GENERIC_DAY	1	1	2010-06-23	2241	\N	139489	\N
231586	GENERIC_DAY	1	0	2010-02-27	2225	\N	139489	\N
231587	GENERIC_DAY	1	0	2010-04-17	2235	\N	139489	\N
231588	GENERIC_DAY	1	1	2010-05-31	2251	\N	139489	\N
231589	GENERIC_DAY	1	0	2010-05-13	2243	\N	139489	\N
231590	GENERIC_DAY	1	0	2010-05-13	2237	\N	139489	\N
231591	GENERIC_DAY	1	0	2010-05-01	2245	\N	139489	\N
231592	GENERIC_DAY	1	0	2010-02-23	2249	\N	139489	\N
231593	GENERIC_DAY	1	1	2010-04-22	2223	\N	139489	\N
231594	GENERIC_DAY	1	1	2010-05-14	2251	\N	139489	\N
231595	GENERIC_DAY	1	0	2010-02-23	2235	\N	139489	\N
234340	GENERIC_DAY	0	0	2010-05-01	2231	\N	139488	\N
234341	GENERIC_DAY	0	1	2010-04-15	2251	\N	139488	\N
234342	GENERIC_DAY	0	0	2010-02-26	2243	\N	139488	\N
234343	GENERIC_DAY	0	2	2010-04-05	2241	\N	139488	\N
234344	GENERIC_DAY	0	0	2010-03-14	2237	\N	139488	\N
234345	GENERIC_DAY	0	1	2010-04-14	2235	\N	139488	\N
234346	GENERIC_DAY	0	0	2010-03-04	2243	\N	139488	\N
234347	GENERIC_DAY	0	1	2010-05-19	2247	\N	139488	\N
234348	GENERIC_DAY	0	2	2010-05-18	2223	\N	139488	\N
234349	GENERIC_DAY	0	0	2010-02-25	2249	\N	139488	\N
234350	GENERIC_DAY	0	0	2010-03-26	2243	\N	139488	\N
234351	GENERIC_DAY	0	0	2010-03-16	2231	\N	139488	\N
234352	GENERIC_DAY	0	3	2010-02-17	2223	\N	139488	\N
234353	GENERIC_DAY	0	0	2010-05-05	2225	\N	139488	\N
234354	GENERIC_DAY	0	0	2010-03-10	2249	\N	139488	\N
234355	GENERIC_DAY	0	0	2010-04-25	2235	\N	139488	\N
234356	GENERIC_DAY	0	0	2010-03-20	2225	\N	139488	\N
234357	GENERIC_DAY	0	0	2010-04-07	2225	\N	139488	\N
234358	GENERIC_DAY	0	0	2010-04-18	2229	\N	139488	\N
234359	GENERIC_DAY	0	1	2010-04-09	2229	\N	139488	\N
234360	GENERIC_DAY	0	0	2010-03-20	2235	\N	139488	\N
234361	GENERIC_DAY	0	1	2010-04-20	2237	\N	139488	\N
234362	GENERIC_DAY	0	0	2010-03-21	2247	\N	139488	\N
234363	GENERIC_DAY	0	1	2010-04-05	2231	\N	139488	\N
234364	GENERIC_DAY	0	0	2010-03-19	2249	\N	139488	\N
234365	GENERIC_DAY	0	0	2010-04-11	2249	\N	139488	\N
234366	GENERIC_DAY	0	0	2010-03-30	2247	\N	139488	\N
234367	GENERIC_DAY	0	2	2010-03-30	2251	\N	139488	\N
234368	GENERIC_DAY	0	0	2010-04-01	2245	\N	139488	\N
234369	GENERIC_DAY	0	0	2010-02-20	2223	\N	139488	\N
234370	GENERIC_DAY	0	0	2010-04-18	2223	\N	139488	\N
234371	GENERIC_DAY	0	1	2010-03-17	2239	\N	139488	\N
234372	GENERIC_DAY	0	0	2010-03-27	2225	\N	139488	\N
234373	GENERIC_DAY	0	0	2010-05-02	2249	\N	139488	\N
234374	GENERIC_DAY	0	0	2010-03-26	2247	\N	139488	\N
234375	GENERIC_DAY	0	1	2010-05-11	2237	\N	139488	\N
234376	GENERIC_DAY	0	1	2010-03-12	2235	\N	139488	\N
234377	GENERIC_DAY	0	0	2010-03-22	2247	\N	139488	\N
234378	GENERIC_DAY	0	0	2010-05-22	2235	\N	139488	\N
234379	GENERIC_DAY	0	2	2010-02-19	2241	\N	139488	\N
234380	GENERIC_DAY	0	1	2010-05-03	2241	\N	139488	\N
234381	GENERIC_DAY	0	0	2010-03-07	2241	\N	139488	\N
234382	GENERIC_DAY	0	3	2010-02-16	2251	\N	139488	\N
234383	GENERIC_DAY	0	0	2010-05-01	2229	\N	139488	\N
234384	GENERIC_DAY	0	0	2010-03-09	2247	\N	139488	\N
234385	GENERIC_DAY	0	2	2010-03-22	2237	\N	139488	\N
234386	GENERIC_DAY	0	2	2010-05-13	2223	\N	139488	\N
234387	GENERIC_DAY	0	1	2010-03-26	2245	\N	139488	\N
234388	GENERIC_DAY	0	1	2010-05-03	2249	\N	139488	\N
234389	GENERIC_DAY	0	0	2010-02-27	2233	\N	139488	\N
234390	GENERIC_DAY	0	0	2010-05-23	2225	\N	139488	\N
234391	GENERIC_DAY	0	0	2010-04-12	2225	\N	139488	\N
234392	GENERIC_DAY	0	1	2010-04-27	2239	\N	139488	\N
234393	GENERIC_DAY	0	1	2010-05-14	2243	\N	139488	\N
234394	GENERIC_DAY	0	2	2010-03-11	2237	\N	139488	\N
234395	GENERIC_DAY	0	0	2010-05-23	2251	\N	139488	\N
234396	GENERIC_DAY	0	1	2010-04-27	2251	\N	139488	\N
234397	GENERIC_DAY	0	0	2010-04-01	2235	\N	139488	\N
234398	GENERIC_DAY	0	1	2010-03-22	2239	\N	139488	\N
234399	GENERIC_DAY	0	1	2010-04-14	2245	\N	139488	\N
234400	GENERIC_DAY	0	0	2010-05-15	2231	\N	139488	\N
234401	GENERIC_DAY	0	3	2010-03-22	2229	\N	139488	\N
234402	GENERIC_DAY	0	0	2010-03-27	2241	\N	139488	\N
234403	GENERIC_DAY	0	0	2010-04-06	2239	\N	139488	\N
234404	GENERIC_DAY	0	1	2010-05-07	2223	\N	139488	\N
234405	GENERIC_DAY	0	2	2010-05-05	2223	\N	139488	\N
234406	GENERIC_DAY	0	3	2010-03-17	2229	\N	139488	\N
234407	GENERIC_DAY	0	0	2010-03-04	2249	\N	139488	\N
234408	GENERIC_DAY	0	0	2010-04-02	2233	\N	139488	\N
234409	GENERIC_DAY	0	3	2010-03-31	2223	\N	139488	\N
234410	GENERIC_DAY	0	0	2010-03-24	2243	\N	139488	\N
234411	GENERIC_DAY	0	0	2010-05-24	2245	\N	139488	\N
234412	GENERIC_DAY	0	0	2010-03-23	2225	\N	139488	\N
234413	GENERIC_DAY	0	0	2010-04-21	2225	\N	139488	\N
234414	GENERIC_DAY	0	0	2010-03-27	2243	\N	139488	\N
234415	GENERIC_DAY	0	0	2010-04-13	2249	\N	139488	\N
234416	GENERIC_DAY	0	0	2010-02-25	2225	\N	139488	\N
234417	GENERIC_DAY	0	1	2010-05-21	2231	\N	139488	\N
234418	GENERIC_DAY	0	0	2010-03-12	2233	\N	139488	\N
234419	GENERIC_DAY	0	0	2010-02-25	2243	\N	139488	\N
234420	GENERIC_DAY	0	1	2010-05-06	2245	\N	139488	\N
234421	GENERIC_DAY	0	0	2010-05-02	2245	\N	139488	\N
234422	GENERIC_DAY	0	0	2010-03-14	2233	\N	139488	\N
234423	GENERIC_DAY	0	0	2010-03-03	2231	\N	139488	\N
234424	GENERIC_DAY	0	0	2010-04-08	2239	\N	139488	\N
234425	GENERIC_DAY	0	0	2010-03-04	2247	\N	139488	\N
234426	GENERIC_DAY	0	1	2010-02-22	2235	\N	139488	\N
234427	GENERIC_DAY	0	0	2010-03-06	2245	\N	139488	\N
234428	GENERIC_DAY	0	2	2010-02-18	2237	\N	139488	\N
234429	GENERIC_DAY	0	2	2010-04-08	2247	\N	139488	\N
234430	GENERIC_DAY	0	1	2010-04-23	2223	\N	139488	\N
234431	GENERIC_DAY	0	0	2010-04-25	2247	\N	139488	\N
234432	GENERIC_DAY	0	2	2010-03-18	2241	\N	139488	\N
234433	GENERIC_DAY	0	2	2010-03-05	2251	\N	139488	\N
234434	GENERIC_DAY	0	2	2010-04-08	2237	\N	139488	\N
234435	GENERIC_DAY	0	2	2010-03-09	2235	\N	139488	\N
234436	GENERIC_DAY	0	0	2010-03-13	2239	\N	139488	\N
234437	GENERIC_DAY	0	3	2010-03-03	2223	\N	139488	\N
234438	GENERIC_DAY	0	3	2010-02-17	2229	\N	139488	\N
234439	GENERIC_DAY	0	2	2010-04-15	2223	\N	139488	\N
234440	GENERIC_DAY	0	1	2010-04-28	2249	\N	139488	\N
234441	GENERIC_DAY	0	0	2010-03-21	2241	\N	139488	\N
234442	GENERIC_DAY	0	1	2010-04-14	2233	\N	139488	\N
234443	GENERIC_DAY	0	1	2010-05-14	2247	\N	139488	\N
234444	GENERIC_DAY	0	1	2010-05-10	2251	\N	139488	\N
234445	GENERIC_DAY	0	0	2010-05-16	2233	\N	139488	\N
234446	GENERIC_DAY	0	1	2010-05-21	2251	\N	139488	\N
234447	GENERIC_DAY	0	0	2010-02-16	2235	\N	139488	\N
234448	GENERIC_DAY	0	0	2010-04-14	2249	\N	139488	\N
234449	GENERIC_DAY	0	0	2010-05-02	2237	\N	139488	\N
234450	GENERIC_DAY	0	0	2010-02-27	2237	\N	139488	\N
234451	GENERIC_DAY	0	1	2010-04-30	2233	\N	139488	\N
234452	GENERIC_DAY	0	0	2010-03-27	2245	\N	139488	\N
234453	GENERIC_DAY	0	1	2010-05-03	2229	\N	139488	\N
234454	GENERIC_DAY	0	1	2010-05-21	2247	\N	139488	\N
234455	GENERIC_DAY	0	1	2010-05-05	2235	\N	139488	\N
234456	GENERIC_DAY	0	0	2010-04-04	2235	\N	139488	\N
234457	GENERIC_DAY	0	0	2010-04-11	2247	\N	139488	\N
234458	GENERIC_DAY	0	0	2010-03-04	2233	\N	139488	\N
234459	GENERIC_DAY	0	0	2010-03-02	2243	\N	139488	\N
234460	GENERIC_DAY	0	0	2010-05-24	2251	\N	139488	\N
234461	GENERIC_DAY	0	0	2010-02-28	2237	\N	139488	\N
234462	GENERIC_DAY	0	0	2010-03-19	2245	\N	139488	\N
234463	GENERIC_DAY	0	2	2010-04-06	2237	\N	139488	\N
234464	GENERIC_DAY	0	1	2010-04-19	2237	\N	139488	\N
234465	GENERIC_DAY	0	2	2010-04-14	2243	\N	139488	\N
234466	GENERIC_DAY	0	1	2010-02-23	2235	\N	139488	\N
234467	GENERIC_DAY	0	1	2010-05-18	2239	\N	139488	\N
234468	GENERIC_DAY	0	0	2010-03-07	2229	\N	139488	\N
234469	GENERIC_DAY	0	1	2010-04-16	2235	\N	139488	\N
234470	GENERIC_DAY	0	0	2010-04-09	2249	\N	139488	\N
234471	GENERIC_DAY	0	0	2010-03-18	2247	\N	139488	\N
234472	GENERIC_DAY	0	1	2010-04-23	2231	\N	139488	\N
234473	GENERIC_DAY	0	0	2010-03-20	2239	\N	139488	\N
234474	GENERIC_DAY	0	0	2010-05-01	2235	\N	139488	\N
234475	GENERIC_DAY	0	0	2010-03-31	2243	\N	139488	\N
234476	GENERIC_DAY	0	0	2010-04-17	2229	\N	139488	\N
234477	GENERIC_DAY	0	0	2010-04-01	2243	\N	139488	\N
234478	GENERIC_DAY	0	3	2010-02-23	2223	\N	139488	\N
234479	GENERIC_DAY	0	0	2010-04-10	2245	\N	139488	\N
234480	GENERIC_DAY	0	0	2010-03-06	2243	\N	139488	\N
234481	GENERIC_DAY	0	1	2010-05-24	2231	\N	139488	\N
234482	GENERIC_DAY	0	0	2010-04-11	2235	\N	139488	\N
234483	GENERIC_DAY	0	0	2010-05-04	2225	\N	139488	\N
234484	GENERIC_DAY	0	1	2010-05-04	2233	\N	139488	\N
234485	GENERIC_DAY	0	0	2010-04-27	2225	\N	139488	\N
234486	GENERIC_DAY	0	0	2010-03-02	2249	\N	139488	\N
234487	GENERIC_DAY	0	1	2010-04-23	2243	\N	139488	\N
234488	GENERIC_DAY	0	1	2010-05-13	2229	\N	139488	\N
234489	GENERIC_DAY	0	1	2010-05-03	2247	\N	139488	\N
234490	GENERIC_DAY	0	0	2010-02-21	2235	\N	139488	\N
234491	GENERIC_DAY	0	0	2010-04-24	2223	\N	139488	\N
234492	GENERIC_DAY	0	0	2010-04-11	2245	\N	139488	\N
234493	GENERIC_DAY	0	0	2010-03-20	2229	\N	139488	\N
234494	GENERIC_DAY	0	2	2010-02-26	2223	\N	139488	\N
234495	GENERIC_DAY	0	1	2010-02-26	2229	\N	139488	\N
234496	GENERIC_DAY	0	0	2010-04-01	2241	\N	139488	\N
234497	GENERIC_DAY	0	0	2010-04-04	2251	\N	139488	\N
234498	GENERIC_DAY	0	1	2010-04-30	2231	\N	139488	\N
234499	GENERIC_DAY	0	1	2010-03-12	2245	\N	139488	\N
234500	GENERIC_DAY	0	0	2010-04-02	2241	\N	139488	\N
234501	GENERIC_DAY	0	0	2010-02-20	2249	\N	139488	\N
234502	GENERIC_DAY	0	0	2010-03-31	2231	\N	139488	\N
234503	GENERIC_DAY	0	1	2010-02-19	2229	\N	139488	\N
234504	GENERIC_DAY	0	2	2010-02-26	2237	\N	139488	\N
234505	GENERIC_DAY	0	0	2010-03-15	2247	\N	139488	\N
234506	GENERIC_DAY	0	0	2010-05-10	2225	\N	139488	\N
234507	GENERIC_DAY	0	1	2010-05-03	2235	\N	139488	\N
234508	GENERIC_DAY	0	0	2010-03-16	2225	\N	139488	\N
234509	GENERIC_DAY	0	1	2010-04-13	2229	\N	139488	\N
234510	GENERIC_DAY	0	1	2010-04-08	2251	\N	139488	\N
234511	GENERIC_DAY	0	0	2010-04-24	2237	\N	139488	\N
234512	GENERIC_DAY	0	0	2010-02-25	2247	\N	139488	\N
234513	GENERIC_DAY	0	2	2010-03-23	2237	\N	139488	\N
234514	GENERIC_DAY	0	0	2010-04-05	2239	\N	139488	\N
234515	GENERIC_DAY	0	0	2010-05-22	2251	\N	139488	\N
234516	GENERIC_DAY	0	1	2010-04-26	2237	\N	139488	\N
234517	GENERIC_DAY	0	0	2010-05-15	2237	\N	139488	\N
234518	GENERIC_DAY	0	1	2010-04-30	2249	\N	139488	\N
234519	GENERIC_DAY	0	1	2010-05-11	2241	\N	139488	\N
234520	GENERIC_DAY	0	2	2010-04-16	2237	\N	139488	\N
234521	GENERIC_DAY	0	0	2010-03-25	2249	\N	139488	\N
234522	GENERIC_DAY	0	0	2010-03-28	2251	\N	139488	\N
234523	GENERIC_DAY	0	1	2010-05-21	2243	\N	139488	\N
234524	GENERIC_DAY	0	0	2010-03-07	2231	\N	139488	\N
234525	GENERIC_DAY	0	1	2010-04-21	2251	\N	139488	\N
234526	GENERIC_DAY	0	0	2010-05-09	2237	\N	139488	\N
234527	GENERIC_DAY	0	1	2010-04-22	2237	\N	139488	\N
234528	GENERIC_DAY	0	2	2010-05-06	2231	\N	139488	\N
234529	GENERIC_DAY	0	1	2010-05-12	2237	\N	139488	\N
234530	GENERIC_DAY	0	1	2010-05-07	2243	\N	139488	\N
234531	GENERIC_DAY	0	2	2010-04-22	2243	\N	139488	\N
234532	GENERIC_DAY	0	2	2010-02-26	2241	\N	139488	\N
234533	GENERIC_DAY	0	2	2010-04-21	2223	\N	139488	\N
234534	GENERIC_DAY	0	0	2010-02-26	2231	\N	139488	\N
234535	GENERIC_DAY	0	1	2010-05-21	2241	\N	139488	\N
234536	GENERIC_DAY	0	0	2010-04-24	2243	\N	139488	\N
234537	GENERIC_DAY	0	0	2010-04-01	2249	\N	139488	\N
234538	GENERIC_DAY	0	0	2010-02-20	2235	\N	139488	\N
234539	GENERIC_DAY	0	0	2010-03-22	2249	\N	139488	\N
234540	GENERIC_DAY	0	1	2010-05-21	2233	\N	139488	\N
234541	GENERIC_DAY	0	0	2010-04-19	2225	\N	139488	\N
234542	GENERIC_DAY	0	1	2010-05-12	2235	\N	139488	\N
234543	GENERIC_DAY	0	1	2010-05-13	2251	\N	139488	\N
234544	GENERIC_DAY	0	0	2010-05-17	2243	\N	139488	\N
234545	GENERIC_DAY	0	0	2010-04-30	2245	\N	139488	\N
234546	GENERIC_DAY	0	0	2010-03-12	2249	\N	139488	\N
234547	GENERIC_DAY	0	2	2010-02-24	2237	\N	139488	\N
234548	GENERIC_DAY	0	2	2010-03-11	2235	\N	139488	\N
234549	GENERIC_DAY	0	0	2010-02-20	2247	\N	139488	\N
234550	GENERIC_DAY	0	0	2010-04-01	2251	\N	139488	\N
234551	GENERIC_DAY	0	0	2010-03-06	2223	\N	139488	\N
234552	GENERIC_DAY	0	0	2010-02-19	2225	\N	139488	\N
234553	GENERIC_DAY	0	0	2010-04-24	2233	\N	139488	\N
234554	GENERIC_DAY	0	1	2010-04-12	2233	\N	139488	\N
234555	GENERIC_DAY	0	1	2010-03-15	2239	\N	139488	\N
234556	GENERIC_DAY	0	0	2010-04-10	2241	\N	139488	\N
234557	GENERIC_DAY	0	0	2010-04-10	2225	\N	139488	\N
234558	GENERIC_DAY	0	0	2010-05-02	2243	\N	139488	\N
234559	GENERIC_DAY	0	1	2010-05-18	2241	\N	139488	\N
234560	GENERIC_DAY	0	3	2010-02-22	2229	\N	139488	\N
234561	GENERIC_DAY	0	0	2010-03-23	2247	\N	139488	\N
234562	GENERIC_DAY	0	1	2010-04-12	2235	\N	139488	\N
234563	GENERIC_DAY	0	0	2010-05-03	2225	\N	139488	\N
234564	GENERIC_DAY	0	0	2010-02-23	2243	\N	139488	\N
234565	GENERIC_DAY	0	1	2010-03-17	2235	\N	139488	\N
234566	GENERIC_DAY	0	0	2010-03-13	2223	\N	139488	\N
234567	GENERIC_DAY	0	0	2010-03-26	2233	\N	139488	\N
234568	GENERIC_DAY	0	2	2010-03-30	2241	\N	139488	\N
234569	GENERIC_DAY	0	0	2010-05-23	2235	\N	139488	\N
234570	GENERIC_DAY	0	2	2010-03-10	2245	\N	139488	\N
234571	GENERIC_DAY	0	0	2010-02-28	2231	\N	139488	\N
234572	GENERIC_DAY	0	0	2010-04-25	2245	\N	139488	\N
234573	GENERIC_DAY	0	2	2010-02-25	2245	\N	139488	\N
234574	GENERIC_DAY	0	0	2010-03-22	2233	\N	139488	\N
234575	GENERIC_DAY	0	1	2010-05-10	2247	\N	139488	\N
234576	GENERIC_DAY	0	1	2010-03-12	2229	\N	139488	\N
234577	GENERIC_DAY	0	1	2010-04-28	2233	\N	139488	\N
234578	GENERIC_DAY	0	1	2010-04-16	2231	\N	139488	\N
234579	GENERIC_DAY	0	0	2010-02-28	2249	\N	139488	\N
234580	GENERIC_DAY	0	2	2010-04-06	2245	\N	139488	\N
234581	GENERIC_DAY	0	0	2010-04-05	2225	\N	139488	\N
234582	GENERIC_DAY	0	0	2010-03-05	2225	\N	139488	\N
234583	GENERIC_DAY	0	2	2010-02-16	2237	\N	139488	\N
234584	GENERIC_DAY	0	3	2010-03-03	2229	\N	139488	\N
234585	GENERIC_DAY	0	2	2010-03-25	2241	\N	139488	\N
234586	GENERIC_DAY	0	3	2010-03-30	2223	\N	139488	\N
234587	GENERIC_DAY	0	0	2010-04-02	2225	\N	139488	\N
234588	GENERIC_DAY	0	0	2010-02-23	2247	\N	139488	\N
234589	GENERIC_DAY	0	2	2010-04-15	2243	\N	139488	\N
234590	GENERIC_DAY	0	1	2010-05-11	2233	\N	139488	\N
234591	GENERIC_DAY	0	0	2010-04-03	2245	\N	139488	\N
234592	GENERIC_DAY	0	1	2010-04-19	2245	\N	139488	\N
234593	GENERIC_DAY	0	1	2010-05-03	2239	\N	139488	\N
234594	GENERIC_DAY	0	0	2010-02-18	2225	\N	139488	\N
234595	GENERIC_DAY	0	0	2010-04-02	2223	\N	139488	\N
234596	GENERIC_DAY	0	0	2010-03-02	2233	\N	139488	\N
234597	GENERIC_DAY	0	2	2010-03-03	2237	\N	139488	\N
234598	GENERIC_DAY	0	0	2010-04-02	2247	\N	139488	\N
234599	GENERIC_DAY	0	1	2010-04-15	2241	\N	139488	\N
234600	GENERIC_DAY	0	0	2010-05-23	2243	\N	139488	\N
234601	GENERIC_DAY	0	0	2010-05-22	2233	\N	139488	\N
234602	GENERIC_DAY	0	0	2010-04-18	2241	\N	139488	\N
234603	GENERIC_DAY	0	0	2010-05-17	2245	\N	139488	\N
234604	GENERIC_DAY	0	0	2010-04-24	2235	\N	139488	\N
234605	GENERIC_DAY	0	0	2010-05-23	2245	\N	139488	\N
234606	GENERIC_DAY	0	1	2010-04-19	2241	\N	139488	\N
234607	GENERIC_DAY	0	1	2010-04-12	2251	\N	139488	\N
234608	GENERIC_DAY	0	0	2010-03-06	2225	\N	139488	\N
234609	GENERIC_DAY	0	0	2010-03-09	2243	\N	139488	\N
234610	GENERIC_DAY	0	0	2010-04-11	2239	\N	139488	\N
234611	GENERIC_DAY	0	0	2010-03-24	2233	\N	139488	\N
234612	GENERIC_DAY	0	0	2010-05-01	2239	\N	139488	\N
234613	GENERIC_DAY	0	0	2010-05-01	2241	\N	139488	\N
234614	GENERIC_DAY	0	2	2010-05-18	2231	\N	139488	\N
234615	GENERIC_DAY	0	0	2010-05-01	2249	\N	139488	\N
234616	GENERIC_DAY	0	2	2010-03-22	2251	\N	139488	\N
234617	GENERIC_DAY	0	0	2010-05-18	2225	\N	139488	\N
234618	GENERIC_DAY	0	1	2010-04-09	2245	\N	139488	\N
234619	GENERIC_DAY	0	0	2010-03-08	2249	\N	139488	\N
234620	GENERIC_DAY	0	2	2010-03-31	2237	\N	139488	\N
234621	GENERIC_DAY	0	3	2010-03-16	2223	\N	139488	\N
234622	GENERIC_DAY	0	3	2010-02-16	2229	\N	139488	\N
234623	GENERIC_DAY	0	0	2010-04-24	2239	\N	139488	\N
234624	GENERIC_DAY	0	0	2010-03-12	2247	\N	139488	\N
234625	GENERIC_DAY	0	0	2010-03-06	2231	\N	139488	\N
234626	GENERIC_DAY	0	2	2010-03-18	2245	\N	139488	\N
234627	GENERIC_DAY	0	4	2010-02-16	2223	\N	139488	\N
234628	GENERIC_DAY	0	1	2010-05-18	2245	\N	139488	\N
234629	GENERIC_DAY	0	2	2010-03-31	2245	\N	139488	\N
234630	GENERIC_DAY	0	0	2010-05-23	2237	\N	139488	\N
234631	GENERIC_DAY	0	0	2010-03-31	2249	\N	139488	\N
234632	GENERIC_DAY	0	2	2010-03-31	2251	\N	139488	\N
234633	GENERIC_DAY	0	0	2010-05-17	2235	\N	139488	\N
234634	GENERIC_DAY	0	1	2010-04-29	2235	\N	139488	\N
234635	GENERIC_DAY	0	0	2010-05-22	2241	\N	139488	\N
234636	GENERIC_DAY	0	1	2010-05-14	2233	\N	139488	\N
234637	GENERIC_DAY	0	1	2010-05-03	2251	\N	139488	\N
234638	GENERIC_DAY	0	1	2010-02-17	2239	\N	139488	\N
234639	GENERIC_DAY	0	2	2010-02-23	2251	\N	139488	\N
234640	GENERIC_DAY	0	0	2010-03-21	2223	\N	139488	\N
234641	GENERIC_DAY	0	1	2010-05-18	2249	\N	139488	\N
234642	GENERIC_DAY	0	1	2010-05-05	2249	\N	139488	\N
234643	GENERIC_DAY	0	1	2010-04-21	2241	\N	139488	\N
234644	GENERIC_DAY	0	2	2010-03-09	2251	\N	139488	\N
234645	GENERIC_DAY	0	0	2010-05-20	2225	\N	139488	\N
234646	GENERIC_DAY	0	0	2010-04-15	2225	\N	139488	\N
234647	GENERIC_DAY	0	1	2010-05-12	2233	\N	139488	\N
234648	GENERIC_DAY	0	0	2010-04-02	2249	\N	139488	\N
234649	GENERIC_DAY	0	1	2010-03-22	2235	\N	139488	\N
234650	GENERIC_DAY	0	1	2010-04-29	2251	\N	139488	\N
234651	GENERIC_DAY	0	0	2010-03-26	2225	\N	139488	\N
234652	GENERIC_DAY	0	0	2010-04-03	2247	\N	139488	\N
234653	GENERIC_DAY	0	0	2010-02-20	2237	\N	139488	\N
234654	GENERIC_DAY	0	0	2010-02-23	2233	\N	139488	\N
234655	GENERIC_DAY	0	1	2010-03-05	2235	\N	139488	\N
234656	GENERIC_DAY	0	2	2010-04-13	2237	\N	139488	\N
234657	GENERIC_DAY	0	0	2010-02-22	2225	\N	139488	\N
234658	GENERIC_DAY	0	0	2010-04-17	2235	\N	139488	\N
234659	GENERIC_DAY	0	0	2010-03-21	2233	\N	139488	\N
234660	GENERIC_DAY	0	1	2010-04-13	2241	\N	139488	\N
234661	GENERIC_DAY	0	0	2010-04-03	2249	\N	139488	\N
234662	GENERIC_DAY	0	1	2010-04-07	2241	\N	139488	\N
234663	GENERIC_DAY	0	2	2010-02-25	2241	\N	139488	\N
234664	GENERIC_DAY	0	0	2010-03-17	2225	\N	139488	\N
234665	GENERIC_DAY	0	0	2010-03-10	2225	\N	139488	\N
234666	GENERIC_DAY	0	1	2010-03-16	2239	\N	139488	\N
234667	GENERIC_DAY	0	0	2010-03-07	2235	\N	139488	\N
234668	GENERIC_DAY	0	2	2010-03-12	2251	\N	139488	\N
234669	GENERIC_DAY	0	0	2010-05-19	2225	\N	139488	\N
234670	GENERIC_DAY	0	1	2010-04-30	2223	\N	139488	\N
234671	GENERIC_DAY	0	2	2010-04-07	2231	\N	139488	\N
234672	GENERIC_DAY	0	0	2010-03-21	2243	\N	139488	\N
234673	GENERIC_DAY	0	1	2010-02-22	2239	\N	139488	\N
234674	GENERIC_DAY	0	0	2010-03-21	2251	\N	139488	\N
234675	GENERIC_DAY	0	0	2010-03-06	2247	\N	139488	\N
234676	GENERIC_DAY	0	0	2010-03-15	2243	\N	139488	\N
234677	GENERIC_DAY	0	1	2010-04-30	2243	\N	139488	\N
234678	GENERIC_DAY	0	2	2010-05-10	2223	\N	139488	\N
234679	GENERIC_DAY	0	0	2010-03-05	2233	\N	139488	\N
234680	GENERIC_DAY	0	1	2010-05-19	2239	\N	139488	\N
234681	GENERIC_DAY	0	0	2010-03-28	2225	\N	139488	\N
234682	GENERIC_DAY	0	1	2010-05-11	2247	\N	139488	\N
234683	GENERIC_DAY	0	0	2010-05-17	2251	\N	139488	\N
234684	GENERIC_DAY	0	1	2010-04-29	2229	\N	139488	\N
234685	GENERIC_DAY	0	2	2010-02-18	2251	\N	139488	\N
234686	GENERIC_DAY	0	0	2010-03-21	2237	\N	139488	\N
234687	GENERIC_DAY	0	0	2010-03-07	2245	\N	139488	\N
234688	GENERIC_DAY	0	0	2010-05-08	2251	\N	139488	\N
234689	GENERIC_DAY	0	0	2010-02-27	2245	\N	139488	\N
234690	GENERIC_DAY	0	2	2010-03-16	2237	\N	139488	\N
234691	GENERIC_DAY	0	0	2010-05-14	2225	\N	139488	\N
234692	GENERIC_DAY	0	0	2010-04-02	2237	\N	139488	\N
234693	GENERIC_DAY	0	3	2010-03-24	2229	\N	139488	\N
234694	GENERIC_DAY	0	2	2010-03-29	2251	\N	139488	\N
234695	GENERIC_DAY	0	2	2010-02-24	2241	\N	139488	\N
234696	GENERIC_DAY	0	2	2010-04-05	2223	\N	139488	\N
234697	GENERIC_DAY	0	0	2010-05-09	2231	\N	139488	\N
234698	GENERIC_DAY	0	1	2010-05-11	2229	\N	139488	\N
234699	GENERIC_DAY	0	1	2010-05-18	2247	\N	139488	\N
234700	GENERIC_DAY	0	0	2010-02-25	2233	\N	139488	\N
234701	GENERIC_DAY	0	0	2010-05-17	2241	\N	139488	\N
234702	GENERIC_DAY	0	1	2010-05-13	2247	\N	139488	\N
234703	GENERIC_DAY	0	0	2010-03-24	2247	\N	139488	\N
234704	GENERIC_DAY	0	0	2010-04-16	2229	\N	139488	\N
234705	GENERIC_DAY	0	2	2010-03-12	2223	\N	139488	\N
234706	GENERIC_DAY	0	0	2010-03-30	2231	\N	139488	\N
234707	GENERIC_DAY	0	0	2010-03-31	2233	\N	139488	\N
234708	GENERIC_DAY	0	1	2010-05-07	2231	\N	139488	\N
234709	GENERIC_DAY	0	0	2010-05-08	2233	\N	139488	\N
234710	GENERIC_DAY	0	0	2010-03-23	2231	\N	139488	\N
234711	GENERIC_DAY	0	0	2010-04-04	2231	\N	139488	\N
234712	GENERIC_DAY	0	2	2010-04-13	2223	\N	139488	\N
234713	GENERIC_DAY	0	1	2010-04-16	2223	\N	139488	\N
234714	GENERIC_DAY	0	0	2010-03-21	2235	\N	139488	\N
234715	GENERIC_DAY	0	0	2010-03-24	2225	\N	139488	\N
234716	GENERIC_DAY	0	2	2010-04-27	2223	\N	139488	\N
234717	GENERIC_DAY	0	0	2010-04-07	2239	\N	139488	\N
234718	GENERIC_DAY	0	0	2010-03-07	2223	\N	139488	\N
234719	GENERIC_DAY	0	2	2010-03-30	2237	\N	139488	\N
234720	GENERIC_DAY	0	0	2010-03-09	2231	\N	139488	\N
234721	GENERIC_DAY	0	2	2010-04-09	2231	\N	139488	\N
234722	GENERIC_DAY	0	2	2010-03-11	2251	\N	139488	\N
234723	GENERIC_DAY	0	1	2010-05-06	2233	\N	139488	\N
234724	GENERIC_DAY	0	0	2010-02-28	2251	\N	139488	\N
234725	GENERIC_DAY	0	0	2010-03-03	2249	\N	139488	\N
234726	GENERIC_DAY	0	0	2010-03-13	2245	\N	139488	\N
234727	GENERIC_DAY	0	3	2010-03-30	2229	\N	139488	\N
234728	GENERIC_DAY	0	0	2010-05-23	2223	\N	139488	\N
234729	GENERIC_DAY	0	1	2010-04-28	2235	\N	139488	\N
234730	GENERIC_DAY	0	0	2010-04-18	2251	\N	139488	\N
234731	GENERIC_DAY	0	0	2010-02-21	2241	\N	139488	\N
234732	GENERIC_DAY	0	2	2010-05-04	2231	\N	139488	\N
234733	GENERIC_DAY	0	1	2010-05-07	2251	\N	139488	\N
234734	GENERIC_DAY	0	0	2010-03-25	2247	\N	139488	\N
234735	GENERIC_DAY	0	2	2010-04-05	2245	\N	139488	\N
234736	GENERIC_DAY	0	1	2010-04-27	2245	\N	139488	\N
234737	GENERIC_DAY	0	0	2010-04-24	2229	\N	139488	\N
234738	GENERIC_DAY	0	0	2010-05-02	2229	\N	139488	\N
234739	GENERIC_DAY	0	0	2010-02-17	2243	\N	139488	\N
234740	GENERIC_DAY	0	0	2010-03-13	2231	\N	139488	\N
234741	GENERIC_DAY	0	0	2010-04-11	2231	\N	139488	\N
234742	GENERIC_DAY	0	0	2010-03-17	2247	\N	139488	\N
234743	GENERIC_DAY	0	0	2010-05-02	2225	\N	139488	\N
234744	GENERIC_DAY	0	1	2010-02-24	2235	\N	139488	\N
234745	GENERIC_DAY	0	0	2010-04-02	2231	\N	139488	\N
234746	GENERIC_DAY	0	1	2010-04-15	2235	\N	139488	\N
234747	GENERIC_DAY	0	1	2010-04-20	2251	\N	139488	\N
234748	GENERIC_DAY	0	0	2010-05-17	2223	\N	139488	\N
234749	GENERIC_DAY	0	0	2010-02-21	2249	\N	139488	\N
234750	GENERIC_DAY	0	0	2010-03-08	2243	\N	139488	\N
234751	GENERIC_DAY	0	1	2010-05-20	2235	\N	139488	\N
234752	GENERIC_DAY	0	0	2010-02-17	2247	\N	139488	\N
234753	GENERIC_DAY	0	2	2010-03-16	2241	\N	139488	\N
234754	GENERIC_DAY	0	1	2010-04-09	2233	\N	139488	\N
234755	GENERIC_DAY	0	0	2010-04-02	2251	\N	139488	\N
234756	GENERIC_DAY	0	2	2010-03-26	2241	\N	139488	\N
234757	GENERIC_DAY	0	2	2010-03-31	2241	\N	139488	\N
234758	GENERIC_DAY	0	2	2010-04-21	2231	\N	139488	\N
234759	GENERIC_DAY	0	1	2010-04-20	2241	\N	139488	\N
234760	GENERIC_DAY	0	3	2010-03-09	2241	\N	139488	\N
234761	GENERIC_DAY	0	0	2010-05-09	2247	\N	139488	\N
234762	GENERIC_DAY	0	2	2010-03-29	2237	\N	139488	\N
234763	GENERIC_DAY	0	1	2010-05-04	2251	\N	139488	\N
234764	GENERIC_DAY	0	0	2010-05-17	2229	\N	139488	\N
234765	GENERIC_DAY	0	1	2010-04-21	2235	\N	139488	\N
234766	GENERIC_DAY	0	0	2010-03-16	2233	\N	139488	\N
234767	GENERIC_DAY	0	0	2010-05-02	2223	\N	139488	\N
234768	GENERIC_DAY	0	3	2010-03-16	2229	\N	139488	\N
234769	GENERIC_DAY	0	2	2010-03-18	2237	\N	139488	\N
234770	GENERIC_DAY	0	0	2010-02-27	2235	\N	139488	\N
234771	GENERIC_DAY	0	0	2010-03-20	2243	\N	139488	\N
234772	GENERIC_DAY	0	1	2010-02-23	2239	\N	139488	\N
234773	GENERIC_DAY	0	2	2010-03-24	2251	\N	139488	\N
234774	GENERIC_DAY	0	0	2010-02-21	2245	\N	139488	\N
234775	GENERIC_DAY	0	1	2010-05-04	2247	\N	139488	\N
234776	GENERIC_DAY	0	2	2010-04-14	2237	\N	139488	\N
234777	GENERIC_DAY	0	1	2010-04-23	2239	\N	139488	\N
234778	GENERIC_DAY	0	3	2010-03-04	2229	\N	139488	\N
234779	GENERIC_DAY	0	0	2010-02-19	2247	\N	139488	\N
234780	GENERIC_DAY	0	0	2010-02-22	2249	\N	139488	\N
234781	GENERIC_DAY	0	2	2010-05-19	2223	\N	139488	\N
234782	GENERIC_DAY	0	0	2010-04-18	2239	\N	139488	\N
234783	GENERIC_DAY	0	0	2010-02-20	2243	\N	139488	\N
234784	GENERIC_DAY	0	0	2010-04-09	2239	\N	139488	\N
234785	GENERIC_DAY	0	3	2010-03-29	2223	\N	139488	\N
234786	GENERIC_DAY	0	1	2010-05-05	2239	\N	139488	\N
234787	GENERIC_DAY	0	3	2010-02-18	2229	\N	139488	\N
234788	GENERIC_DAY	0	0	2010-04-04	2225	\N	139488	\N
234789	GENERIC_DAY	0	0	2010-03-18	2233	\N	139488	\N
234790	GENERIC_DAY	0	0	2010-02-26	2225	\N	139488	\N
234791	GENERIC_DAY	0	0	2010-03-21	2249	\N	139488	\N
234792	GENERIC_DAY	0	0	2010-03-01	2225	\N	139488	\N
234793	GENERIC_DAY	0	1	2010-04-20	2249	\N	139488	\N
234794	GENERIC_DAY	0	0	2010-04-03	2239	\N	139488	\N
234795	GENERIC_DAY	0	1	2010-04-27	2237	\N	139488	\N
234796	GENERIC_DAY	0	0	2010-03-27	2247	\N	139488	\N
234797	GENERIC_DAY	0	1	2010-04-15	2239	\N	139488	\N
234798	GENERIC_DAY	0	0	2010-03-31	2225	\N	139488	\N
234799	GENERIC_DAY	0	1	2010-05-12	2229	\N	139488	\N
234800	GENERIC_DAY	0	0	2010-04-17	2231	\N	139488	\N
234801	GENERIC_DAY	0	1	2010-05-19	2245	\N	139488	\N
234802	GENERIC_DAY	0	0	2010-05-09	2223	\N	139488	\N
234803	GENERIC_DAY	0	3	2010-04-06	2243	\N	139488	\N
234804	GENERIC_DAY	0	0	2010-05-16	2245	\N	139488	\N
234805	GENERIC_DAY	0	0	2010-03-16	2243	\N	139488	\N
234806	GENERIC_DAY	0	0	2010-03-09	2225	\N	139488	\N
234807	GENERIC_DAY	0	2	2010-03-23	2251	\N	139488	\N
234808	GENERIC_DAY	0	1	2010-05-06	2237	\N	139488	\N
234809	GENERIC_DAY	0	1	2010-03-15	2235	\N	139488	\N
234810	GENERIC_DAY	0	0	2010-05-24	2225	\N	139488	\N
234811	GENERIC_DAY	0	1	2010-04-13	2233	\N	139488	\N
234812	GENERIC_DAY	0	0	2010-04-04	2249	\N	139488	\N
234813	GENERIC_DAY	0	2	2010-05-03	2243	\N	139488	\N
234814	GENERIC_DAY	0	1	2010-05-10	2237	\N	139488	\N
234815	GENERIC_DAY	0	0	2010-04-17	2245	\N	139488	\N
234816	GENERIC_DAY	0	1	2010-05-19	2249	\N	139488	\N
234817	GENERIC_DAY	0	2	2010-03-16	2251	\N	139488	\N
234818	GENERIC_DAY	0	0	2010-05-22	2237	\N	139488	\N
234819	GENERIC_DAY	0	0	2010-05-15	2251	\N	139488	\N
234820	GENERIC_DAY	0	3	2010-02-24	2223	\N	139488	\N
234821	GENERIC_DAY	0	0	2010-03-13	2243	\N	139488	\N
234822	GENERIC_DAY	0	0	2010-04-23	2225	\N	139488	\N
234823	GENERIC_DAY	0	0	2010-04-10	2249	\N	139488	\N
234824	GENERIC_DAY	0	1	2010-05-07	2249	\N	139488	\N
234825	GENERIC_DAY	0	1	2010-05-24	2239	\N	139488	\N
234826	GENERIC_DAY	0	2	2010-03-17	2251	\N	139488	\N
234827	GENERIC_DAY	0	0	2010-03-10	2243	\N	139488	\N
234828	GENERIC_DAY	0	0	2010-04-03	2233	\N	139488	\N
234829	GENERIC_DAY	0	1	2010-05-10	2249	\N	139488	\N
234830	GENERIC_DAY	0	1	2010-03-12	2239	\N	139488	\N
234831	GENERIC_DAY	0	0	2010-03-13	2235	\N	139488	\N
234832	GENERIC_DAY	0	0	2010-05-08	2249	\N	139488	\N
234833	GENERIC_DAY	0	0	2010-03-24	2249	\N	139488	\N
234834	GENERIC_DAY	0	2	2010-05-13	2231	\N	139488	\N
234835	GENERIC_DAY	0	1	2010-04-28	2229	\N	139488	\N
234836	GENERIC_DAY	0	2	2010-04-07	2245	\N	139488	\N
234837	GENERIC_DAY	0	2	2010-04-20	2243	\N	139488	\N
234838	GENERIC_DAY	0	1	2010-05-20	2229	\N	139488	\N
234839	GENERIC_DAY	0	0	2010-02-23	2249	\N	139488	\N
234840	GENERIC_DAY	0	1	2010-05-04	2239	\N	139488	\N
234841	GENERIC_DAY	0	1	2010-05-24	2223	\N	139488	\N
234842	GENERIC_DAY	0	1	2010-05-14	2241	\N	139488	\N
234843	GENERIC_DAY	0	2	2010-03-15	2241	\N	139488	\N
234844	GENERIC_DAY	0	1	2010-04-15	2249	\N	139488	\N
234845	GENERIC_DAY	0	2	2010-02-23	2237	\N	139488	\N
234846	GENERIC_DAY	0	1	2010-05-19	2233	\N	139488	\N
234847	GENERIC_DAY	0	0	2010-04-10	2243	\N	139488	\N
234848	GENERIC_DAY	0	2	2010-03-02	2251	\N	139488	\N
234849	GENERIC_DAY	0	0	2010-03-19	2247	\N	139488	\N
234850	GENERIC_DAY	0	0	2010-03-27	2251	\N	139488	\N
234851	GENERIC_DAY	0	0	2010-03-28	2245	\N	139488	\N
234852	GENERIC_DAY	0	1	2010-05-10	2235	\N	139488	\N
234853	GENERIC_DAY	0	0	2010-04-01	2223	\N	139488	\N
234854	GENERIC_DAY	0	1	2010-04-19	2235	\N	139488	\N
234855	GENERIC_DAY	0	0	2010-03-27	2229	\N	139488	\N
234856	GENERIC_DAY	0	2	2010-04-28	2231	\N	139488	\N
234857	GENERIC_DAY	0	0	2010-03-14	2239	\N	139488	\N
234858	GENERIC_DAY	0	2	2010-03-29	2245	\N	139488	\N
234859	GENERIC_DAY	0	0	2010-02-18	2231	\N	139488	\N
234860	GENERIC_DAY	0	2	2010-04-13	2231	\N	139488	\N
234861	GENERIC_DAY	0	0	2010-05-08	2229	\N	139488	\N
234862	GENERIC_DAY	0	1	2010-05-21	2235	\N	139488	\N
234863	GENERIC_DAY	0	2	2010-04-05	2237	\N	139488	\N
234864	GENERIC_DAY	0	2	2010-03-15	2245	\N	139488	\N
234865	GENERIC_DAY	0	0	2010-04-18	2225	\N	139488	\N
234866	GENERIC_DAY	0	1	2010-04-22	2251	\N	139488	\N
234867	GENERIC_DAY	0	0	2010-02-21	2247	\N	139488	\N
234868	GENERIC_DAY	0	1	2010-04-16	2233	\N	139488	\N
234869	GENERIC_DAY	0	0	2010-05-21	2245	\N	139488	\N
234870	GENERIC_DAY	0	0	2010-04-30	2229	\N	139488	\N
234871	GENERIC_DAY	0	2	2010-04-07	2237	\N	139488	\N
234872	GENERIC_DAY	0	2	2010-03-02	2237	\N	139488	\N
234873	GENERIC_DAY	0	1	2010-02-25	2235	\N	139488	\N
234874	GENERIC_DAY	0	0	2010-04-24	2247	\N	139488	\N
234875	GENERIC_DAY	0	2	2010-05-04	2243	\N	139488	\N
234876	GENERIC_DAY	0	2	2010-03-01	2251	\N	139488	\N
234877	GENERIC_DAY	0	1	2010-03-04	2235	\N	139488	\N
234878	GENERIC_DAY	0	1	2010-04-29	2247	\N	139488	\N
234879	GENERIC_DAY	0	0	2010-04-03	2251	\N	139488	\N
234880	GENERIC_DAY	0	0	2010-05-16	2247	\N	139488	\N
234881	GENERIC_DAY	0	1	2010-04-16	2251	\N	139488	\N
234882	GENERIC_DAY	0	0	2010-03-22	2231	\N	139488	\N
234883	GENERIC_DAY	0	1	2010-05-18	2251	\N	139488	\N
234884	GENERIC_DAY	0	0	2010-05-22	2239	\N	139488	\N
234885	GENERIC_DAY	0	2	2010-05-03	2223	\N	139488	\N
234886	GENERIC_DAY	0	0	2010-04-02	2243	\N	139488	\N
234887	GENERIC_DAY	0	2	2010-02-22	2251	\N	139488	\N
234888	GENERIC_DAY	0	0	2010-03-04	2231	\N	139488	\N
234889	GENERIC_DAY	0	1	2010-05-11	2239	\N	139488	\N
234890	GENERIC_DAY	0	1	2010-04-20	2247	\N	139488	\N
234891	GENERIC_DAY	0	1	2010-04-09	2235	\N	139488	\N
234892	GENERIC_DAY	0	1	2010-02-19	2239	\N	139488	\N
234893	GENERIC_DAY	0	1	2010-04-21	2229	\N	139488	\N
234894	GENERIC_DAY	0	1	2010-04-19	2233	\N	139488	\N
234895	GENERIC_DAY	0	1	2010-03-18	2235	\N	139488	\N
234896	GENERIC_DAY	0	2	2010-03-25	2251	\N	139488	\N
234897	GENERIC_DAY	0	1	2010-04-07	2223	\N	139488	\N
234898	GENERIC_DAY	0	0	2010-03-11	2231	\N	139488	\N
234899	GENERIC_DAY	0	1	2010-03-29	2235	\N	139488	\N
234900	GENERIC_DAY	0	0	2010-02-21	2223	\N	139488	\N
234901	GENERIC_DAY	0	0	2010-03-25	2243	\N	139488	\N
234902	GENERIC_DAY	0	2	2010-02-17	2237	\N	139488	\N
234903	GENERIC_DAY	0	2	2010-04-12	2223	\N	139488	\N
234904	GENERIC_DAY	0	0	2010-02-20	2233	\N	139488	\N
234905	GENERIC_DAY	0	0	2010-04-10	2251	\N	139488	\N
234906	GENERIC_DAY	0	0	2010-05-02	2247	\N	139488	\N
234907	GENERIC_DAY	0	2	2010-05-19	2243	\N	139488	\N
234908	GENERIC_DAY	0	0	2010-05-09	2245	\N	139488	\N
234909	GENERIC_DAY	0	1	2010-04-23	2241	\N	139488	\N
234910	GENERIC_DAY	0	0	2010-03-07	2249	\N	139488	\N
234911	GENERIC_DAY	0	2	2010-05-19	2231	\N	139488	\N
234912	GENERIC_DAY	0	0	2010-03-05	2243	\N	139488	\N
234913	GENERIC_DAY	0	2	2010-03-24	2241	\N	139488	\N
234914	GENERIC_DAY	0	2	2010-04-27	2243	\N	139488	\N
234915	GENERIC_DAY	0	1	2010-04-20	2245	\N	139488	\N
234916	GENERIC_DAY	0	0	2010-05-09	2251	\N	139488	\N
234917	GENERIC_DAY	0	0	2010-04-01	2225	\N	139488	\N
234918	GENERIC_DAY	0	3	2010-03-18	2223	\N	139488	\N
234919	GENERIC_DAY	0	0	2010-02-27	2231	\N	139488	\N
234920	GENERIC_DAY	0	1	2010-05-06	2229	\N	139488	\N
234921	GENERIC_DAY	0	2	2010-02-25	2237	\N	139488	\N
234922	GENERIC_DAY	0	0	2010-02-19	2249	\N	139488	\N
234923	GENERIC_DAY	0	0	2010-05-16	2241	\N	139488	\N
234924	GENERIC_DAY	0	3	2010-02-18	2223	\N	139488	\N
234925	GENERIC_DAY	0	0	2010-03-01	2243	\N	139488	\N
234926	GENERIC_DAY	0	1	2010-04-07	2251	\N	139488	\N
234927	GENERIC_DAY	0	0	2010-03-14	2235	\N	139488	\N
234928	GENERIC_DAY	0	1	2010-04-28	2247	\N	139488	\N
234929	GENERIC_DAY	0	2	2010-04-21	2243	\N	139488	\N
234930	GENERIC_DAY	0	0	2010-02-16	2231	\N	139488	\N
234931	GENERIC_DAY	0	0	2010-02-16	2243	\N	139488	\N
234932	GENERIC_DAY	0	0	2010-03-14	2223	\N	139488	\N
234933	GENERIC_DAY	0	3	2010-03-08	2241	\N	139488	\N
234934	GENERIC_DAY	0	1	2010-04-30	2241	\N	139488	\N
234935	GENERIC_DAY	0	1	2010-04-14	2229	\N	139488	\N
234936	GENERIC_DAY	0	0	2010-03-29	2233	\N	139488	\N
234937	GENERIC_DAY	0	0	2010-04-01	2233	\N	139488	\N
234938	GENERIC_DAY	0	0	2010-02-24	2249	\N	139488	\N
234939	GENERIC_DAY	0	2	2010-05-06	2243	\N	139488	\N
234940	GENERIC_DAY	0	1	2010-04-27	2233	\N	139488	\N
234941	GENERIC_DAY	0	0	2010-04-17	2233	\N	139488	\N
234942	GENERIC_DAY	0	1	2010-02-18	2239	\N	139488	\N
234943	GENERIC_DAY	0	1	2010-05-21	2239	\N	139488	\N
234944	GENERIC_DAY	0	2	2010-03-10	2235	\N	139488	\N
234945	GENERIC_DAY	0	1	2010-05-20	2247	\N	139488	\N
234946	GENERIC_DAY	0	2	2010-03-29	2241	\N	139488	\N
234947	GENERIC_DAY	0	0	2010-04-25	2223	\N	139488	\N
234948	GENERIC_DAY	0	0	2010-03-06	2237	\N	139488	\N
234949	GENERIC_DAY	0	2	2010-03-01	2241	\N	139488	\N
234950	GENERIC_DAY	0	0	2010-05-17	2239	\N	139488	\N
234951	GENERIC_DAY	0	2	2010-04-06	2247	\N	139488	\N
234952	GENERIC_DAY	0	0	2010-04-02	2235	\N	139488	\N
234953	GENERIC_DAY	0	0	2010-05-09	2233	\N	139488	\N
234954	GENERIC_DAY	0	1	2010-05-19	2229	\N	139488	\N
234955	GENERIC_DAY	0	0	2010-02-21	2239	\N	139488	\N
234956	GENERIC_DAY	0	0	2010-02-28	2233	\N	139488	\N
234957	GENERIC_DAY	0	0	2010-04-25	2229	\N	139488	\N
234958	GENERIC_DAY	0	3	2010-02-24	2229	\N	139488	\N
234959	GENERIC_DAY	0	3	2010-03-02	2229	\N	139488	\N
234960	GENERIC_DAY	0	2	2010-04-19	2243	\N	139488	\N
234961	GENERIC_DAY	0	1	2010-04-22	2239	\N	139488	\N
234962	GENERIC_DAY	0	1	2010-04-21	2233	\N	139488	\N
234963	GENERIC_DAY	0	0	2010-03-02	2247	\N	139488	\N
234964	GENERIC_DAY	0	1	2010-04-20	2235	\N	139488	\N
234965	GENERIC_DAY	0	0	2010-02-23	2231	\N	139488	\N
234966	GENERIC_DAY	0	0	2010-05-17	2247	\N	139488	\N
234967	GENERIC_DAY	0	2	2010-04-12	2243	\N	139488	\N
234968	GENERIC_DAY	0	0	2010-05-16	2237	\N	139488	\N
234969	GENERIC_DAY	0	0	2010-03-11	2247	\N	139488	\N
234970	GENERIC_DAY	0	0	2010-03-11	2249	\N	139488	\N
234971	GENERIC_DAY	0	0	2010-03-10	2231	\N	139488	\N
234972	GENERIC_DAY	0	2	2010-03-02	2245	\N	139488	\N
234973	GENERIC_DAY	0	0	2010-03-20	2223	\N	139488	\N
234974	GENERIC_DAY	0	0	2010-02-28	2245	\N	139488	\N
234975	GENERIC_DAY	0	0	2010-03-19	2241	\N	139488	\N
234976	GENERIC_DAY	0	0	2010-04-24	2231	\N	139488	\N
234977	GENERIC_DAY	0	3	2010-03-02	2223	\N	139488	\N
234978	GENERIC_DAY	0	1	2010-04-06	2223	\N	139488	\N
234979	GENERIC_DAY	0	1	2010-04-27	2235	\N	139488	\N
234980	GENERIC_DAY	0	0	2010-02-27	2229	\N	139488	\N
234981	GENERIC_DAY	0	0	2010-02-21	2237	\N	139488	\N
234982	GENERIC_DAY	0	3	2010-03-25	2223	\N	139488	\N
234983	GENERIC_DAY	0	0	2010-02-28	2247	\N	139488	\N
234984	GENERIC_DAY	0	2	2010-03-26	2223	\N	139488	\N
234985	GENERIC_DAY	0	0	2010-03-05	2249	\N	139488	\N
234986	GENERIC_DAY	0	1	2010-05-07	2247	\N	139488	\N
234987	GENERIC_DAY	0	0	2010-05-21	2225	\N	139488	\N
234988	GENERIC_DAY	0	2	2010-03-16	2245	\N	139488	\N
234989	GENERIC_DAY	0	1	2010-04-16	2241	\N	139488	\N
234990	GENERIC_DAY	0	3	2010-02-25	2223	\N	139488	\N
234991	GENERIC_DAY	0	1	2010-05-12	2241	\N	139488	\N
234992	GENERIC_DAY	0	2	2010-03-08	2245	\N	139488	\N
234993	GENERIC_DAY	0	1	2010-04-29	2249	\N	139488	\N
234994	GENERIC_DAY	0	1	2010-05-24	2237	\N	139488	\N
234995	GENERIC_DAY	0	2	2010-04-22	2231	\N	139488	\N
234996	GENERIC_DAY	0	1	2010-02-24	2239	\N	139488	\N
234997	GENERIC_DAY	0	1	2010-05-12	2239	\N	139488	\N
234998	GENERIC_DAY	0	2	2010-04-30	2237	\N	139488	\N
234999	GENERIC_DAY	0	0	2010-04-25	2237	\N	139488	\N
235000	GENERIC_DAY	0	2	2010-04-14	2231	\N	139488	\N
235001	GENERIC_DAY	0	0	2010-04-01	2229	\N	139488	\N
235002	GENERIC_DAY	0	1	2010-05-20	2245	\N	139488	\N
235003	GENERIC_DAY	0	0	2010-02-17	2225	\N	139488	\N
235004	GENERIC_DAY	0	2	2010-04-05	2251	\N	139488	\N
235005	GENERIC_DAY	0	2	2010-03-10	2223	\N	139488	\N
235006	GENERIC_DAY	0	2	2010-03-25	2245	\N	139488	\N
235007	GENERIC_DAY	0	0	2010-03-28	2247	\N	139488	\N
235008	GENERIC_DAY	0	2	2010-05-18	2243	\N	139488	\N
235009	GENERIC_DAY	0	1	2010-05-14	2239	\N	139488	\N
235010	GENERIC_DAY	0	2	2010-03-08	2251	\N	139488	\N
235011	GENERIC_DAY	0	0	2010-05-07	2245	\N	139488	\N
235012	GENERIC_DAY	0	0	2010-05-23	2233	\N	139488	\N
235013	GENERIC_DAY	0	0	2010-04-24	2241	\N	139488	\N
235014	GENERIC_DAY	0	0	2010-02-24	2225	\N	139488	\N
235015	GENERIC_DAY	0	2	2010-03-09	2245	\N	139488	\N
235016	GENERIC_DAY	0	0	2010-04-24	2245	\N	139488	\N
235017	GENERIC_DAY	0	0	2010-05-14	2229	\N	139488	\N
235018	GENERIC_DAY	0	0	2010-04-17	2249	\N	139488	\N
235019	GENERIC_DAY	0	3	2010-03-15	2229	\N	139488	\N
235020	GENERIC_DAY	0	1	2010-04-09	2223	\N	139488	\N
235021	GENERIC_DAY	0	1	2010-05-07	2239	\N	139488	\N
235022	GENERIC_DAY	0	2	2010-03-17	2237	\N	139488	\N
235023	GENERIC_DAY	0	1	2010-05-13	2245	\N	139488	\N
235024	GENERIC_DAY	0	1	2010-04-28	2237	\N	139488	\N
235025	GENERIC_DAY	0	0	2010-03-29	2231	\N	139488	\N
235026	GENERIC_DAY	0	0	2010-04-03	2237	\N	139488	\N
235027	GENERIC_DAY	0	0	2010-05-22	2229	\N	139488	\N
235028	GENERIC_DAY	0	1	2010-05-07	2233	\N	139488	\N
235029	GENERIC_DAY	0	0	2010-05-11	2225	\N	139488	\N
235030	GENERIC_DAY	0	1	2010-05-05	2237	\N	139488	\N
235031	GENERIC_DAY	0	0	2010-02-18	2243	\N	139488	\N
235032	GENERIC_DAY	0	2	2010-02-24	2251	\N	139488	\N
235033	GENERIC_DAY	0	0	2010-05-16	2223	\N	139488	\N
235034	GENERIC_DAY	0	1	2010-04-27	2249	\N	139488	\N
235035	GENERIC_DAY	0	0	2010-04-12	2249	\N	139488	\N
235036	GENERIC_DAY	0	0	2010-05-16	2235	\N	139488	\N
235037	GENERIC_DAY	0	1	2010-04-12	2247	\N	139488	\N
235038	GENERIC_DAY	0	0	2010-02-18	2233	\N	139488	\N
235039	GENERIC_DAY	0	2	2010-03-10	2241	\N	139488	\N
235040	GENERIC_DAY	0	2	2010-02-22	2237	\N	139488	\N
235041	GENERIC_DAY	0	0	2010-03-15	2233	\N	139488	\N
235042	GENERIC_DAY	0	2	2010-03-10	2237	\N	139488	\N
235043	GENERIC_DAY	0	2	2010-03-04	2237	\N	139488	\N
235044	GENERIC_DAY	0	1	2010-05-19	2237	\N	139488	\N
235045	GENERIC_DAY	0	0	2010-05-01	2237	\N	139488	\N
235046	GENERIC_DAY	0	2	2010-03-03	2241	\N	139488	\N
235047	GENERIC_DAY	0	1	2010-05-20	2251	\N	139488	\N
235048	GENERIC_DAY	0	1	2010-05-18	2237	\N	139488	\N
235049	GENERIC_DAY	0	1	2010-05-12	2247	\N	139488	\N
235050	GENERIC_DAY	0	0	2010-05-02	2239	\N	139488	\N
235051	GENERIC_DAY	0	1	2010-02-26	2245	\N	139488	\N
235052	GENERIC_DAY	0	0	2010-02-20	2231	\N	139488	\N
235053	GENERIC_DAY	0	0	2010-02-27	2241	\N	139488	\N
235054	GENERIC_DAY	0	0	2010-03-07	2239	\N	139488	\N
235055	GENERIC_DAY	0	2	2010-04-26	2243	\N	139488	\N
235056	GENERIC_DAY	0	1	2010-04-13	2251	\N	139488	\N
235057	GENERIC_DAY	0	1	2010-03-25	2235	\N	139488	\N
235058	GENERIC_DAY	0	2	2010-05-13	2243	\N	139488	\N
235059	GENERIC_DAY	0	0	2010-05-08	2235	\N	139488	\N
235060	GENERIC_DAY	0	2	2010-03-11	2239	\N	139488	\N
235061	GENERIC_DAY	0	2	2010-04-20	2231	\N	139488	\N
235062	GENERIC_DAY	0	1	2010-05-06	2249	\N	139488	\N
235063	GENERIC_DAY	0	0	2010-02-16	2233	\N	139488	\N
235064	GENERIC_DAY	0	0	2010-04-04	2237	\N	139488	\N
235065	GENERIC_DAY	0	0	2010-03-19	2229	\N	139488	\N
235066	GENERIC_DAY	0	0	2010-04-23	2229	\N	139488	\N
235067	GENERIC_DAY	0	0	2010-03-07	2233	\N	139488	\N
235068	GENERIC_DAY	0	0	2010-03-17	2243	\N	139488	\N
235069	GENERIC_DAY	0	0	2010-02-18	2247	\N	139488	\N
235070	GENERIC_DAY	0	1	2010-05-11	2251	\N	139488	\N
235071	GENERIC_DAY	0	0	2010-03-27	2233	\N	139488	\N
235072	GENERIC_DAY	0	0	2010-04-29	2225	\N	139488	\N
235073	GENERIC_DAY	0	1	2010-05-18	2235	\N	139488	\N
235074	GENERIC_DAY	0	0	2010-03-29	2225	\N	139488	\N
235075	GENERIC_DAY	0	1	2010-04-21	2239	\N	139488	\N
235076	GENERIC_DAY	0	0	2010-03-25	2231	\N	139488	\N
235077	GENERIC_DAY	0	0	2010-02-27	2225	\N	139488	\N
235078	GENERIC_DAY	0	1	2010-03-30	2239	\N	139488	\N
235079	GENERIC_DAY	0	2	2010-04-13	2243	\N	139488	\N
235080	GENERIC_DAY	0	1	2010-04-21	2249	\N	139488	\N
235081	GENERIC_DAY	0	0	2010-05-24	2229	\N	139488	\N
235082	GENERIC_DAY	0	1	2010-05-10	2239	\N	139488	\N
235083	GENERIC_DAY	0	2	2010-03-01	2245	\N	139488	\N
235084	GENERIC_DAY	0	1	2010-05-19	2235	\N	139488	\N
235085	GENERIC_DAY	0	1	2010-05-14	2235	\N	139488	\N
235086	GENERIC_DAY	0	0	2010-04-02	2239	\N	139488	\N
235087	GENERIC_DAY	0	0	2010-02-20	2239	\N	139488	\N
235088	GENERIC_DAY	0	0	2010-03-16	2247	\N	139488	\N
235089	GENERIC_DAY	0	1	2010-04-29	2239	\N	139488	\N
235090	GENERIC_DAY	0	2	2010-03-11	2241	\N	139488	\N
235091	GENERIC_DAY	0	1	2010-05-10	2241	\N	139488	\N
235092	GENERIC_DAY	0	0	2010-05-15	2241	\N	139488	\N
235093	GENERIC_DAY	0	0	2010-04-25	2243	\N	139488	\N
235094	GENERIC_DAY	0	1	2010-04-16	2247	\N	139488	\N
235095	GENERIC_DAY	0	0	2010-05-02	2231	\N	139488	\N
235096	GENERIC_DAY	0	0	2010-03-14	2245	\N	139488	\N
235097	GENERIC_DAY	0	1	2010-05-13	2241	\N	139488	\N
235098	GENERIC_DAY	0	0	2010-04-03	2231	\N	139488	\N
235099	GENERIC_DAY	0	0	2010-04-01	2247	\N	139488	\N
235100	GENERIC_DAY	0	0	2010-02-16	2225	\N	139488	\N
235101	GENERIC_DAY	0	2	2010-03-03	2245	\N	139488	\N
235102	GENERIC_DAY	0	0	2010-05-17	2225	\N	139488	\N
235103	GENERIC_DAY	0	2	2010-03-17	2241	\N	139488	\N
235104	GENERIC_DAY	0	2	2010-04-15	2231	\N	139488	\N
235105	GENERIC_DAY	0	0	2010-03-02	2231	\N	139488	\N
235106	GENERIC_DAY	0	0	2010-04-03	2241	\N	139488	\N
235107	GENERIC_DAY	0	1	2010-04-12	2241	\N	139488	\N
235108	GENERIC_DAY	0	1	2010-05-24	2233	\N	139488	\N
235109	GENERIC_DAY	0	0	2010-04-03	2225	\N	139488	\N
235110	GENERIC_DAY	0	2	2010-05-14	2237	\N	139488	\N
235111	GENERIC_DAY	0	0	2010-04-11	2223	\N	139488	\N
235112	GENERIC_DAY	0	0	2010-05-15	2225	\N	139488	\N
235113	GENERIC_DAY	0	0	2010-05-09	2241	\N	139488	\N
235114	GENERIC_DAY	0	3	2010-03-09	2223	\N	139488	\N
235115	GENERIC_DAY	0	1	2010-04-22	2229	\N	139488	\N
235116	GENERIC_DAY	0	0	2010-03-03	2233	\N	139488	\N
235117	GENERIC_DAY	0	0	2010-02-17	2233	\N	139488	\N
235118	GENERIC_DAY	0	2	2010-05-20	2231	\N	139488	\N
235119	GENERIC_DAY	0	2	2010-05-03	2231	\N	139488	\N
235120	GENERIC_DAY	0	0	2010-02-21	2233	\N	139488	\N
235121	GENERIC_DAY	0	0	2010-04-18	2245	\N	139488	\N
235122	GENERIC_DAY	0	0	2010-05-15	2235	\N	139488	\N
235123	GENERIC_DAY	0	1	2010-05-06	2251	\N	139488	\N
235124	GENERIC_DAY	0	0	2010-03-19	2243	\N	139488	\N
235125	GENERIC_DAY	0	1	2010-03-16	2235	\N	139488	\N
235126	GENERIC_DAY	0	0	2010-04-02	2229	\N	139488	\N
235127	GENERIC_DAY	0	1	2010-05-07	2241	\N	139488	\N
235128	GENERIC_DAY	0	2	2010-04-05	2229	\N	139488	\N
235129	GENERIC_DAY	0	2	2010-05-21	2237	\N	139488	\N
235130	GENERIC_DAY	0	0	2010-03-13	2229	\N	139488	\N
235131	GENERIC_DAY	0	0	2010-04-10	2229	\N	139488	\N
235132	GENERIC_DAY	0	1	2010-05-13	2249	\N	139488	\N
235133	GENERIC_DAY	0	3	2010-03-01	2223	\N	139488	\N
235134	GENERIC_DAY	0	1	2010-05-19	2241	\N	139488	\N
235135	GENERIC_DAY	0	0	2010-05-08	2237	\N	139488	\N
235136	GENERIC_DAY	0	0	2010-02-23	2225	\N	139488	\N
235137	GENERIC_DAY	0	0	2010-02-17	2249	\N	139488	\N
235138	GENERIC_DAY	0	1	2010-02-25	2239	\N	139488	\N
235139	GENERIC_DAY	0	0	2010-03-28	2223	\N	139488	\N
235140	GENERIC_DAY	0	0	2010-03-01	2231	\N	139488	\N
235141	GENERIC_DAY	0	2	2010-04-12	2237	\N	139488	\N
235142	GENERIC_DAY	0	3	2010-03-29	2229	\N	139488	\N
235143	GENERIC_DAY	0	0	2010-03-01	2249	\N	139488	\N
235144	GENERIC_DAY	0	1	2010-05-20	2237	\N	139488	\N
235145	GENERIC_DAY	0	0	2010-03-07	2251	\N	139488	\N
235146	GENERIC_DAY	0	0	2010-04-17	2251	\N	139488	\N
235147	GENERIC_DAY	0	2	2010-02-16	2241	\N	139488	\N
235148	GENERIC_DAY	0	0	2010-04-01	2231	\N	139488	\N
235149	GENERIC_DAY	0	0	2010-05-09	2239	\N	139488	\N
235150	GENERIC_DAY	0	0	2010-03-20	2241	\N	139488	\N
235151	GENERIC_DAY	0	2	2010-02-18	2245	\N	139488	\N
235152	GENERIC_DAY	0	1	2010-05-24	2241	\N	139488	\N
235153	GENERIC_DAY	0	0	2010-05-21	2229	\N	139488	\N
235154	GENERIC_DAY	0	0	2010-05-02	2241	\N	139488	\N
235155	GENERIC_DAY	0	1	2010-05-24	2247	\N	139488	\N
235156	GENERIC_DAY	0	0	2010-03-14	2247	\N	139488	\N
235157	GENERIC_DAY	0	0	2010-04-22	2225	\N	139488	\N
235158	GENERIC_DAY	0	0	2010-02-28	2241	\N	139488	\N
235159	GENERIC_DAY	0	0	2010-05-23	2247	\N	139488	\N
235160	GENERIC_DAY	0	1	2010-04-26	2251	\N	139488	\N
235161	GENERIC_DAY	0	1	2010-04-21	2237	\N	139488	\N
235162	GENERIC_DAY	0	0	2010-05-01	2247	\N	139488	\N
235163	GENERIC_DAY	0	0	2010-03-02	2225	\N	139488	\N
235164	GENERIC_DAY	0	0	2010-03-18	2231	\N	139488	\N
235165	GENERIC_DAY	0	0	2010-05-17	2231	\N	139488	\N
235166	GENERIC_DAY	0	1	2010-03-25	2239	\N	139488	\N
235167	GENERIC_DAY	0	1	2010-05-11	2235	\N	139488	\N
235168	GENERIC_DAY	0	0	2010-04-23	2245	\N	139488	\N
235169	GENERIC_DAY	0	0	2010-03-06	2251	\N	139488	\N
235170	GENERIC_DAY	0	0	2010-03-09	2249	\N	139488	\N
235171	GENERIC_DAY	0	1	2010-05-20	2239	\N	139488	\N
235172	GENERIC_DAY	0	1	2010-04-22	2247	\N	139488	\N
235173	GENERIC_DAY	0	0	2010-05-07	2229	\N	139488	\N
235174	GENERIC_DAY	0	0	2010-02-18	2249	\N	139488	\N
235175	GENERIC_DAY	0	0	2010-04-11	2241	\N	139488	\N
235176	GENERIC_DAY	0	0	2010-03-28	2233	\N	139488	\N
235177	GENERIC_DAY	0	0	2010-02-20	2225	\N	139488	\N
235178	GENERIC_DAY	0	1	2010-04-15	2237	\N	139488	\N
235179	GENERIC_DAY	0	2	2010-03-26	2237	\N	139488	\N
235180	GENERIC_DAY	0	1	2010-03-26	2239	\N	139488	\N
235181	GENERIC_DAY	0	1	2010-02-26	2239	\N	139488	\N
235182	GENERIC_DAY	0	0	2010-03-08	2233	\N	139488	\N
235183	GENERIC_DAY	0	0	2010-02-19	2243	\N	139488	\N
235184	GENERIC_DAY	0	0	2010-02-24	2247	\N	139488	\N
235185	GENERIC_DAY	0	0	2010-04-03	2223	\N	139488	\N
235186	GENERIC_DAY	0	3	2010-04-07	2243	\N	139488	\N
235187	GENERIC_DAY	0	0	2010-03-22	2225	\N	139488	\N
235188	GENERIC_DAY	0	0	2010-02-16	2239	\N	139488	\N
235189	GENERIC_DAY	0	3	2010-02-23	2229	\N	139488	\N
235190	GENERIC_DAY	0	0	2010-03-17	2233	\N	139488	\N
235191	GENERIC_DAY	0	1	2010-05-05	2245	\N	139488	\N
235192	GENERIC_DAY	0	2	2010-03-10	2229	\N	139488	\N
235193	GENERIC_DAY	0	0	2010-04-08	2249	\N	139488	\N
235194	GENERIC_DAY	0	1	2010-04-30	2251	\N	139488	\N
235195	GENERIC_DAY	0	0	2010-03-06	2229	\N	139488	\N
235196	GENERIC_DAY	0	0	2010-03-10	2233	\N	139488	\N
235197	GENERIC_DAY	0	2	2010-03-12	2241	\N	139488	\N
235198	GENERIC_DAY	0	1	2010-04-23	2247	\N	139488	\N
235199	GENERIC_DAY	0	0	2010-03-25	2225	\N	139488	\N
235200	GENERIC_DAY	0	0	2010-03-27	2237	\N	139488	\N
235201	GENERIC_DAY	0	1	2010-05-06	2247	\N	139488	\N
235202	GENERIC_DAY	0	2	2010-02-24	2245	\N	139488	\N
235203	GENERIC_DAY	0	0	2010-02-28	2235	\N	139488	\N
235204	GENERIC_DAY	0	0	2010-04-04	2239	\N	139488	\N
235205	GENERIC_DAY	0	2	2010-02-26	2251	\N	139488	\N
235206	GENERIC_DAY	0	0	2010-03-19	2231	\N	139488	\N
235207	GENERIC_DAY	0	0	2010-05-08	2223	\N	139488	\N
235208	GENERIC_DAY	0	1	2010-05-18	2229	\N	139488	\N
235209	GENERIC_DAY	0	2	2010-02-19	2237	\N	139488	\N
235210	GENERIC_DAY	0	1	2010-04-26	2247	\N	139488	\N
235211	GENERIC_DAY	0	1	2010-04-06	2229	\N	139488	\N
235212	GENERIC_DAY	0	1	2010-04-08	2223	\N	139488	\N
235213	GENERIC_DAY	0	0	2010-04-11	2251	\N	139488	\N
235214	GENERIC_DAY	0	1	2010-03-02	2239	\N	139488	\N
235215	GENERIC_DAY	0	0	2010-02-26	2249	\N	139488	\N
235216	GENERIC_DAY	0	1	2010-04-20	2239	\N	139488	\N
235217	GENERIC_DAY	0	3	2010-03-01	2229	\N	139488	\N
235218	GENERIC_DAY	0	0	2010-03-11	2225	\N	139488	\N
235219	GENERIC_DAY	0	0	2010-04-06	2249	\N	139488	\N
235220	GENERIC_DAY	0	2	2010-03-08	2239	\N	139488	\N
235221	GENERIC_DAY	0	0	2010-04-09	2247	\N	139488	\N
235222	GENERIC_DAY	0	2	2010-04-28	2243	\N	139488	\N
235223	GENERIC_DAY	0	0	2010-03-09	2237	\N	139488	\N
235224	GENERIC_DAY	0	1	2010-05-11	2249	\N	139488	\N
235225	GENERIC_DAY	0	2	2010-05-11	2223	\N	139488	\N
235226	GENERIC_DAY	0	0	2010-03-21	2239	\N	139488	\N
235227	GENERIC_DAY	0	1	2010-04-28	2245	\N	139488	\N
235228	GENERIC_DAY	0	1	2010-05-10	2245	\N	139488	\N
235229	GENERIC_DAY	0	2	2010-04-23	2237	\N	139488	\N
235230	GENERIC_DAY	0	0	2010-05-08	2225	\N	139488	\N
235231	GENERIC_DAY	0	0	2010-03-14	2225	\N	139488	\N
235232	GENERIC_DAY	0	2	2010-03-24	2237	\N	139488	\N
235233	GENERIC_DAY	0	0	2010-03-23	2233	\N	139488	\N
235234	GENERIC_DAY	0	0	2010-02-24	2231	\N	139488	\N
235235	GENERIC_DAY	0	0	2010-04-04	2247	\N	139488	\N
235236	GENERIC_DAY	0	0	2010-03-31	2247	\N	139488	\N
235237	GENERIC_DAY	0	0	2010-02-19	2233	\N	139488	\N
235238	GENERIC_DAY	0	0	2010-03-13	2225	\N	139488	\N
235239	GENERIC_DAY	0	1	2010-03-01	2239	\N	139488	\N
235240	GENERIC_DAY	0	0	2010-04-17	2237	\N	139488	\N
235241	GENERIC_DAY	0	0	2010-02-27	2249	\N	139488	\N
235242	GENERIC_DAY	0	0	2010-04-08	2225	\N	139488	\N
235243	GENERIC_DAY	0	3	2010-03-31	2229	\N	139488	\N
235244	GENERIC_DAY	0	0	2010-04-02	2245	\N	139488	\N
235245	GENERIC_DAY	0	1	2010-04-26	2245	\N	139488	\N
235246	GENERIC_DAY	0	0	2010-04-18	2249	\N	139488	\N
235247	GENERIC_DAY	0	1	2010-05-14	2251	\N	139488	\N
235248	GENERIC_DAY	0	1	2010-04-19	2251	\N	139488	\N
235249	GENERIC_DAY	0	0	2010-04-24	2225	\N	139488	\N
235250	GENERIC_DAY	0	1	2010-04-30	2239	\N	139488	\N
235251	GENERIC_DAY	0	1	2010-04-27	2247	\N	139488	\N
235252	GENERIC_DAY	0	0	2010-05-22	2243	\N	139488	\N
235253	GENERIC_DAY	0	0	2010-04-17	2241	\N	139488	\N
235254	GENERIC_DAY	0	0	2010-05-01	2245	\N	139488	\N
235255	GENERIC_DAY	0	0	2010-02-28	2223	\N	139488	\N
235256	GENERIC_DAY	0	0	2010-02-24	2233	\N	139488	\N
235257	GENERIC_DAY	0	0	2010-03-27	2235	\N	139488	\N
235258	GENERIC_DAY	0	0	2010-03-28	2235	\N	139488	\N
235259	GENERIC_DAY	0	1	2010-03-03	2235	\N	139488	\N
235260	GENERIC_DAY	0	0	2010-04-25	2231	\N	139488	\N
235261	GENERIC_DAY	0	1	2010-04-19	2239	\N	139488	\N
235262	GENERIC_DAY	0	0	2010-03-06	2239	\N	139488	\N
235263	GENERIC_DAY	0	1	2010-05-24	2243	\N	139488	\N
235264	GENERIC_DAY	0	0	2010-04-18	2231	\N	139488	\N
235265	GENERIC_DAY	0	2	2010-04-08	2231	\N	139488	\N
235266	GENERIC_DAY	0	1	2010-04-26	2235	\N	139488	\N
235267	GENERIC_DAY	0	2	2010-04-08	2245	\N	139488	\N
235268	GENERIC_DAY	0	1	2010-05-04	2245	\N	139488	\N
235269	GENERIC_DAY	0	0	2010-04-07	2249	\N	139488	\N
235270	GENERIC_DAY	0	0	2010-02-27	2239	\N	139488	\N
235271	GENERIC_DAY	0	0	2010-05-17	2233	\N	139488	\N
235272	GENERIC_DAY	0	1	2010-05-13	2235	\N	139488	\N
235273	GENERIC_DAY	0	0	2010-03-03	2243	\N	139488	\N
235274	GENERIC_DAY	0	2	2010-03-30	2245	\N	139488	\N
235275	GENERIC_DAY	0	0	2010-02-21	2231	\N	139488	\N
235276	GENERIC_DAY	0	1	2010-03-31	2235	\N	139488	\N
235277	GENERIC_DAY	0	1	2010-03-02	2235	\N	139488	\N
235278	GENERIC_DAY	0	0	2010-05-15	2245	\N	139488	\N
235279	GENERIC_DAY	0	1	2010-04-05	2243	\N	139488	\N
235280	GENERIC_DAY	0	1	2010-04-29	2233	\N	139488	\N
235281	GENERIC_DAY	0	0	2010-05-22	2247	\N	139488	\N
235282	GENERIC_DAY	0	2	2010-03-08	2235	\N	139488	\N
235283	GENERIC_DAY	0	0	2010-03-12	2243	\N	139488	\N
235284	GENERIC_DAY	0	1	2010-04-16	2249	\N	139488	\N
235285	GENERIC_DAY	0	0	2010-04-09	2225	\N	139488	\N
235286	GENERIC_DAY	0	2	2010-05-04	2223	\N	139488	\N
235287	GENERIC_DAY	0	0	2010-04-06	2225	\N	139488	\N
235288	GENERIC_DAY	0	2	2010-03-17	2245	\N	139488	\N
235289	GENERIC_DAY	0	0	2010-05-15	2239	\N	139488	\N
235290	GENERIC_DAY	0	1	2010-03-18	2239	\N	139488	\N
235291	GENERIC_DAY	0	0	2010-03-14	2231	\N	139488	\N
235292	GENERIC_DAY	0	0	2010-05-09	2249	\N	139488	\N
235293	GENERIC_DAY	0	3	2010-03-15	2223	\N	139488	\N
235294	GENERIC_DAY	0	0	2010-03-20	2233	\N	139488	\N
235295	GENERIC_DAY	0	1	2010-04-12	2239	\N	139488	\N
235296	GENERIC_DAY	0	1	2010-03-05	2239	\N	139488	\N
235297	GENERIC_DAY	0	0	2010-03-19	2239	\N	139488	\N
235298	GENERIC_DAY	0	0	2010-03-29	2247	\N	139488	\N
235299	GENERIC_DAY	0	2	2010-05-11	2243	\N	139488	\N
235300	GENERIC_DAY	0	2	2010-03-02	2241	\N	139488	\N
235301	GENERIC_DAY	0	0	2010-03-05	2247	\N	139488	\N
235302	GENERIC_DAY	0	0	2010-05-14	2245	\N	139488	\N
235303	GENERIC_DAY	0	0	2010-03-07	2237	\N	139488	\N
235304	GENERIC_DAY	0	0	2010-04-06	2235	\N	139488	\N
235305	GENERIC_DAY	0	0	2010-03-27	2223	\N	139488	\N
235306	GENERIC_DAY	0	1	2010-04-15	2245	\N	139488	\N
235307	GENERIC_DAY	0	0	2010-03-19	2237	\N	139488	\N
235308	GENERIC_DAY	0	0	2010-05-08	2239	\N	139488	\N
235309	GENERIC_DAY	0	2	2010-03-09	2239	\N	139488	\N
235310	GENERIC_DAY	0	0	2010-03-07	2225	\N	139488	\N
235311	GENERIC_DAY	0	1	2010-03-29	2239	\N	139488	\N
235312	GENERIC_DAY	0	0	2010-03-13	2237	\N	139488	\N
235313	GENERIC_DAY	0	2	2010-04-26	2223	\N	139488	\N
235314	GENERIC_DAY	0	2	2010-03-26	2251	\N	139488	\N
235315	GENERIC_DAY	0	3	2010-03-08	2223	\N	139488	\N
235316	GENERIC_DAY	0	1	2010-03-23	2239	\N	139488	\N
235317	GENERIC_DAY	0	1	2010-05-05	2241	\N	139488	\N
235318	GENERIC_DAY	0	1	2010-03-01	2235	\N	139488	\N
235319	GENERIC_DAY	0	0	2010-04-03	2235	\N	139488	\N
235320	GENERIC_DAY	0	0	2010-02-26	2247	\N	139488	\N
235321	GENERIC_DAY	0	0	2010-04-25	2233	\N	139488	\N
235322	GENERIC_DAY	0	0	2010-03-29	2243	\N	139488	\N
235323	GENERIC_DAY	0	0	2010-03-20	2247	\N	139488	\N
235324	GENERIC_DAY	0	2	2010-04-06	2231	\N	139488	\N
235325	GENERIC_DAY	0	2	2010-03-04	2241	\N	139488	\N
235326	GENERIC_DAY	0	1	2010-04-28	2241	\N	139488	\N
235327	GENERIC_DAY	0	0	2010-05-01	2243	\N	139488	\N
235328	GENERIC_DAY	0	1	2010-05-04	2229	\N	139488	\N
235329	GENERIC_DAY	0	0	2010-03-15	2231	\N	139488	\N
235330	GENERIC_DAY	0	0	2010-05-15	2223	\N	139488	\N
235331	GENERIC_DAY	0	0	2010-02-20	2245	\N	139488	\N
235332	GENERIC_DAY	0	0	2010-03-30	2233	\N	139488	\N
235333	GENERIC_DAY	0	0	2010-04-17	2247	\N	139488	\N
235334	GENERIC_DAY	0	0	2010-02-22	2247	\N	139488	\N
235335	GENERIC_DAY	0	1	2010-04-22	2241	\N	139488	\N
235336	GENERIC_DAY	0	1	2010-05-12	2251	\N	139488	\N
235337	GENERIC_DAY	0	1	2010-03-23	2235	\N	139488	\N
235338	GENERIC_DAY	0	1	2010-03-24	2239	\N	139488	\N
235339	GENERIC_DAY	0	1	2010-04-14	2241	\N	139488	\N
235340	GENERIC_DAY	0	0	2010-02-28	2225	\N	139488	\N
235341	GENERIC_DAY	0	0	2010-05-23	2231	\N	139488	\N
235342	GENERIC_DAY	0	1	2010-05-21	2249	\N	139488	\N
235343	GENERIC_DAY	0	0	2010-03-20	2245	\N	139488	\N
235344	GENERIC_DAY	0	0	2010-03-28	2239	\N	139488	\N
235345	GENERIC_DAY	0	0	2010-05-22	2223	\N	139488	\N
235346	GENERIC_DAY	0	0	2010-04-10	2237	\N	139488	\N
235347	GENERIC_DAY	0	1	2010-03-03	2239	\N	139488	\N
235348	GENERIC_DAY	0	1	2010-05-19	2251	\N	139488	\N
235349	GENERIC_DAY	0	0	2010-04-11	2225	\N	139488	\N
235350	GENERIC_DAY	0	2	2010-03-11	2245	\N	139488	\N
235351	GENERIC_DAY	0	3	2010-04-08	2243	\N	139488	\N
235352	GENERIC_DAY	0	1	2010-05-12	2245	\N	139488	\N
235353	GENERIC_DAY	0	2	2010-02-22	2241	\N	139488	\N
235354	GENERIC_DAY	0	0	2010-03-19	2225	\N	139488	\N
235355	GENERIC_DAY	0	2	2010-02-19	2223	\N	139488	\N
235356	GENERIC_DAY	0	0	2010-05-06	2225	\N	139488	\N
235357	GENERIC_DAY	0	0	2010-02-26	2233	\N	139488	\N
235358	GENERIC_DAY	0	0	2010-02-21	2229	\N	139488	\N
235359	GENERIC_DAY	0	1	2010-04-14	2251	\N	139488	\N
235360	GENERIC_DAY	0	3	2010-03-23	2223	\N	139488	\N
235361	GENERIC_DAY	0	0	2010-05-22	2225	\N	139488	\N
235362	GENERIC_DAY	0	0	2010-02-22	2231	\N	139488	\N
235363	GENERIC_DAY	0	1	2010-04-19	2247	\N	139488	\N
235364	GENERIC_DAY	0	0	2010-04-10	2231	\N	139488	\N
235365	GENERIC_DAY	0	1	2010-04-22	2233	\N	139488	\N
235366	GENERIC_DAY	0	1	2010-05-13	2237	\N	139488	\N
235367	GENERIC_DAY	0	0	2010-04-11	2233	\N	139488	\N
235368	GENERIC_DAY	0	0	2010-04-05	2235	\N	139488	\N
235369	GENERIC_DAY	0	0	2010-02-20	2251	\N	139488	\N
235370	GENERIC_DAY	0	1	2010-04-20	2233	\N	139488	\N
235371	GENERIC_DAY	0	2	2010-03-15	2251	\N	139488	\N
235372	GENERIC_DAY	0	0	2010-05-13	2225	\N	139488	\N
235373	GENERIC_DAY	0	0	2010-04-04	2233	\N	139488	\N
235374	GENERIC_DAY	0	3	2010-02-25	2229	\N	139488	\N
235375	GENERIC_DAY	0	0	2010-02-21	2225	\N	139488	\N
235376	GENERIC_DAY	0	0	2010-02-22	2233	\N	139488	\N
235377	GENERIC_DAY	0	1	2010-05-04	2235	\N	139488	\N
235378	GENERIC_DAY	0	0	2010-03-28	2231	\N	139488	\N
235379	GENERIC_DAY	0	1	2010-04-05	2247	\N	139488	\N
235380	GENERIC_DAY	0	0	2010-04-18	2233	\N	139488	\N
235381	GENERIC_DAY	0	0	2010-03-05	2231	\N	139488	\N
235382	GENERIC_DAY	0	0	2010-03-29	2249	\N	139488	\N
235383	GENERIC_DAY	0	3	2010-03-23	2229	\N	139488	\N
235384	GENERIC_DAY	0	2	2010-05-12	2243	\N	139488	\N
235385	GENERIC_DAY	0	2	2010-04-29	2231	\N	139488	\N
235386	GENERIC_DAY	0	3	2010-03-17	2223	\N	139488	\N
235387	GENERIC_DAY	0	2	2010-04-19	2231	\N	139488	\N
235388	GENERIC_DAY	0	2	2010-04-12	2231	\N	139488	\N
235389	GENERIC_DAY	0	1	2010-04-13	2235	\N	139488	\N
235390	GENERIC_DAY	0	1	2010-04-08	2233	\N	139488	\N
235391	GENERIC_DAY	0	0	2010-03-23	2249	\N	139488	\N
235392	GENERIC_DAY	0	0	2010-05-01	2251	\N	139488	\N
235393	GENERIC_DAY	0	1	2010-04-09	2237	\N	139488	\N
235394	GENERIC_DAY	0	1	2010-05-21	2223	\N	139488	\N
235395	GENERIC_DAY	0	0	2010-04-10	2247	\N	139488	\N
235396	GENERIC_DAY	0	1	2010-04-26	2233	\N	139488	\N
235397	GENERIC_DAY	0	0	2010-02-22	2243	\N	139488	\N
235398	GENERIC_DAY	0	0	2010-05-16	2249	\N	139488	\N
235399	GENERIC_DAY	0	0	2010-03-12	2231	\N	139488	\N
235400	GENERIC_DAY	0	1	2010-05-20	2233	\N	139488	\N
235401	GENERIC_DAY	0	0	2010-05-24	2235	\N	139488	\N
235402	GENERIC_DAY	0	0	2010-04-05	2249	\N	139488	\N
235403	GENERIC_DAY	0	0	2010-03-20	2249	\N	139488	\N
235404	GENERIC_DAY	0	2	2010-02-23	2241	\N	139488	\N
235405	GENERIC_DAY	0	2	2010-04-07	2247	\N	139488	\N
235406	GENERIC_DAY	0	1	2010-05-03	2237	\N	139488	\N
235407	GENERIC_DAY	0	1	2010-05-12	2249	\N	139488	\N
235408	GENERIC_DAY	0	0	2010-04-14	2225	\N	139488	\N
235409	GENERIC_DAY	0	1	2010-05-07	2235	\N	139488	\N
235410	GENERIC_DAY	0	1	2010-04-30	2235	\N	139488	\N
235411	GENERIC_DAY	0	0	2010-04-04	2241	\N	139488	\N
235412	GENERIC_DAY	0	2	2010-03-24	2245	\N	139488	\N
235413	GENERIC_DAY	0	0	2010-05-16	2229	\N	139488	\N
235414	GENERIC_DAY	0	1	2010-04-06	2233	\N	139488	\N
235415	GENERIC_DAY	0	1	2010-05-18	2233	\N	139488	\N
235416	GENERIC_DAY	0	0	2010-05-17	2237	\N	139488	\N
235417	GENERIC_DAY	0	0	2010-03-21	2231	\N	139488	\N
235418	GENERIC_DAY	0	0	2010-04-10	2235	\N	139488	\N
235419	GENERIC_DAY	0	1	2010-02-19	2235	\N	139488	\N
235420	GENERIC_DAY	0	0	2010-03-06	2249	\N	139488	\N
235421	GENERIC_DAY	0	1	2010-04-26	2239	\N	139488	\N
235422	GENERIC_DAY	0	1	2010-02-17	2235	\N	139488	\N
235423	GENERIC_DAY	0	0	2010-05-12	2225	\N	139488	\N
235424	GENERIC_DAY	0	0	2010-05-08	2247	\N	139488	\N
235425	GENERIC_DAY	0	1	2010-04-28	2239	\N	139488	\N
235426	GENERIC_DAY	0	2	2010-03-10	2251	\N	139488	\N
235427	GENERIC_DAY	0	0	2010-05-23	2239	\N	139488	\N
235428	GENERIC_DAY	0	0	2010-04-11	2243	\N	139488	\N
235429	GENERIC_DAY	0	1	2010-04-29	2241	\N	139488	\N
235430	GENERIC_DAY	0	0	2010-02-16	2247	\N	139488	\N
235431	GENERIC_DAY	0	1	2010-04-13	2245	\N	139488	\N
235432	GENERIC_DAY	0	1	2010-04-22	2235	\N	139488	\N
235433	GENERIC_DAY	0	0	2010-04-13	2225	\N	139488	\N
235434	GENERIC_DAY	0	1	2010-05-11	2245	\N	139488	\N
235435	GENERIC_DAY	0	2	2010-03-10	2239	\N	139488	\N
235436	GENERIC_DAY	0	0	2010-05-15	2229	\N	139488	\N
235437	GENERIC_DAY	0	2	2010-02-23	2245	\N	139488	\N
235438	GENERIC_DAY	0	0	2010-04-17	2243	\N	139488	\N
235439	GENERIC_DAY	0	0	2010-04-17	2225	\N	139488	\N
235440	GENERIC_DAY	0	0	2010-03-11	2233	\N	139488	\N
235441	GENERIC_DAY	0	1	2010-04-09	2241	\N	139488	\N
235442	GENERIC_DAY	0	0	2010-03-08	2247	\N	139488	\N
235443	GENERIC_DAY	0	2	2010-04-29	2243	\N	139488	\N
235444	GENERIC_DAY	0	1	2010-04-16	2239	\N	139488	\N
235445	GENERIC_DAY	0	0	2010-02-28	2229	\N	139488	\N
235446	GENERIC_DAY	0	0	2010-05-01	2223	\N	139488	\N
235447	GENERIC_DAY	0	0	2010-03-15	2225	\N	139488	\N
235448	GENERIC_DAY	0	0	2010-03-14	2243	\N	139488	\N
235449	GENERIC_DAY	0	1	2010-04-21	2245	\N	139488	\N
235450	GENERIC_DAY	0	0	2010-05-02	2251	\N	139488	\N
235451	GENERIC_DAY	0	1	2010-05-14	2231	\N	139488	\N
235452	GENERIC_DAY	0	0	2010-02-27	2251	\N	139488	\N
235453	GENERIC_DAY	0	1	2010-05-10	2233	\N	139488	\N
235454	GENERIC_DAY	0	0	2010-05-17	2249	\N	139488	\N
235455	GENERIC_DAY	0	1	2010-05-03	2233	\N	139488	\N
235456	GENERIC_DAY	0	0	2010-04-03	2243	\N	139488	\N
235457	GENERIC_DAY	0	3	2010-03-18	2229	\N	139488	\N
235458	GENERIC_DAY	0	0	2010-05-15	2247	\N	139488	\N
235459	GENERIC_DAY	0	1	2010-05-14	2223	\N	139488	\N
235460	GENERIC_DAY	0	0	2010-03-28	2241	\N	139488	\N
235461	GENERIC_DAY	0	0	2010-03-30	2225	\N	139488	\N
235462	GENERIC_DAY	0	2	2010-03-23	2241	\N	139488	\N
235463	GENERIC_DAY	0	0	2010-03-27	2231	\N	139488	\N
235464	GENERIC_DAY	0	2	2010-02-16	2245	\N	139488	\N
235465	GENERIC_DAY	0	0	2010-02-21	2251	\N	139488	\N
235466	GENERIC_DAY	0	0	2010-03-13	2247	\N	139488	\N
235467	GENERIC_DAY	0	1	2010-05-13	2239	\N	139488	\N
235468	GENERIC_DAY	0	0	2010-03-21	2229	\N	139488	\N
235469	GENERIC_DAY	0	2	2010-03-09	2229	\N	139488	\N
235470	GENERIC_DAY	0	2	2010-05-20	2223	\N	139488	\N
235471	GENERIC_DAY	0	0	2010-04-18	2243	\N	139488	\N
235472	GENERIC_DAY	0	1	2010-05-04	2237	\N	139488	\N
235473	GENERIC_DAY	0	1	2010-05-20	2241	\N	139488	\N
235474	GENERIC_DAY	0	2	2010-05-10	2231	\N	139488	\N
235475	GENERIC_DAY	0	0	2010-03-13	2241	\N	139488	\N
235476	GENERIC_DAY	0	1	2010-03-24	2235	\N	139488	\N
235477	GENERIC_DAY	0	0	2010-02-24	2243	\N	139488	\N
235478	GENERIC_DAY	0	0	2010-03-08	2231	\N	139488	\N
235479	GENERIC_DAY	0	2	2010-02-19	2251	\N	139488	\N
235480	GENERIC_DAY	0	2	2010-05-05	2243	\N	139488	\N
235481	GENERIC_DAY	0	2	2010-04-22	2223	\N	139488	\N
235482	GENERIC_DAY	0	1	2010-03-26	2235	\N	139488	\N
235483	GENERIC_DAY	0	0	2010-02-27	2223	\N	139488	\N
235484	GENERIC_DAY	0	0	2010-04-04	2243	\N	139488	\N
235485	GENERIC_DAY	0	0	2010-04-16	2245	\N	139488	\N
235486	GENERIC_DAY	0	0	2010-05-16	2225	\N	139488	\N
235487	GENERIC_DAY	0	0	2010-03-14	2241	\N	139488	\N
235488	GENERIC_DAY	0	2	2010-03-11	2229	\N	139488	\N
235489	GENERIC_DAY	0	0	2010-04-04	2245	\N	139488	\N
235490	GENERIC_DAY	0	3	2010-02-22	2223	\N	139488	\N
235491	GENERIC_DAY	0	0	2010-03-19	2251	\N	139488	\N
235492	GENERIC_DAY	0	0	2010-02-28	2243	\N	139488	\N
235493	GENERIC_DAY	0	0	2010-02-27	2243	\N	139488	\N
235494	GENERIC_DAY	0	0	2010-04-30	2225	\N	139488	\N
235495	GENERIC_DAY	0	0	2010-03-03	2225	\N	139488	\N
235496	GENERIC_DAY	0	0	2010-03-18	2249	\N	139488	\N
235497	GENERIC_DAY	0	0	2010-04-17	2239	\N	139488	\N
235498	GENERIC_DAY	0	1	2010-03-30	2235	\N	139488	\N
235499	GENERIC_DAY	0	1	2010-04-08	2229	\N	139488	\N
235500	GENERIC_DAY	0	1	2010-04-13	2239	\N	139488	\N
235501	GENERIC_DAY	0	0	2010-04-24	2249	\N	139488	\N
235502	GENERIC_DAY	0	1	2010-04-29	2237	\N	139488	\N
235503	GENERIC_DAY	0	1	2010-04-06	2251	\N	139488	\N
235504	GENERIC_DAY	0	0	2010-03-14	2249	\N	139488	\N
235505	GENERIC_DAY	0	0	2010-03-01	2247	\N	139488	\N
235506	GENERIC_DAY	0	1	2010-04-12	2229	\N	139488	\N
235507	GENERIC_DAY	0	0	2010-03-11	2243	\N	139488	\N
235508	GENERIC_DAY	0	2	2010-03-08	2229	\N	139488	\N
235509	GENERIC_DAY	0	0	2010-02-16	2249	\N	139488	\N
235510	GENERIC_DAY	0	0	2010-02-17	2231	\N	139488	\N
235511	GENERIC_DAY	0	0	2010-04-10	2223	\N	139488	\N
235512	GENERIC_DAY	0	0	2010-04-24	2251	\N	139488	\N
235513	GENERIC_DAY	0	0	2010-04-17	2223	\N	139488	\N
235514	GENERIC_DAY	0	1	2010-04-23	2249	\N	139488	\N
235515	GENERIC_DAY	0	0	2010-05-01	2225	\N	139488	\N
235516	GENERIC_DAY	0	0	2010-03-18	2243	\N	139488	\N
235517	GENERIC_DAY	0	0	2010-03-17	2249	\N	139488	\N
235518	GENERIC_DAY	0	0	2010-04-25	2225	\N	139488	\N
235519	GENERIC_DAY	0	1	2010-02-26	2235	\N	139488	\N
235520	GENERIC_DAY	0	1	2010-04-29	2245	\N	139488	\N
235521	GENERIC_DAY	0	1	2010-04-15	2233	\N	139488	\N
235522	GENERIC_DAY	0	0	2010-05-16	2231	\N	139488	\N
235523	GENERIC_DAY	0	0	2010-05-02	2233	\N	139488	\N
235524	GENERIC_DAY	0	0	2010-04-25	2241	\N	139488	\N
235525	GENERIC_DAY	0	0	2010-05-22	2231	\N	139488	\N
235526	GENERIC_DAY	0	0	2010-03-19	2235	\N	139488	\N
235527	GENERIC_DAY	0	0	2010-05-09	2229	\N	139488	\N
235528	GENERIC_DAY	0	0	2010-03-19	2223	\N	139488	\N
235529	GENERIC_DAY	0	0	2010-04-18	2247	\N	139488	\N
235530	GENERIC_DAY	0	3	2010-03-04	2223	\N	139488	\N
235531	GENERIC_DAY	0	2	2010-02-18	2241	\N	139488	\N
235532	GENERIC_DAY	0	0	2010-04-10	2233	\N	139488	\N
235533	GENERIC_DAY	0	1	2010-04-19	2229	\N	139488	\N
235534	GENERIC_DAY	0	1	2010-05-04	2249	\N	139488	\N
235535	GENERIC_DAY	0	1	2010-04-14	2239	\N	139488	\N
235536	GENERIC_DAY	0	0	2010-03-17	2231	\N	139488	\N
235537	GENERIC_DAY	0	1	2010-05-20	2249	\N	139488	\N
235538	GENERIC_DAY	0	2	2010-03-04	2251	\N	139488	\N
235539	GENERIC_DAY	0	0	2010-05-08	2241	\N	139488	\N
235540	GENERIC_DAY	0	2	2010-03-22	2241	\N	139488	\N
235541	GENERIC_DAY	0	2	2010-03-05	2241	\N	139488	\N
235542	GENERIC_DAY	0	2	2010-04-20	2223	\N	139488	\N
235543	GENERIC_DAY	0	0	2010-03-28	2243	\N	139488	\N
235544	GENERIC_DAY	0	0	2010-03-09	2233	\N	139488	\N
235545	GENERIC_DAY	0	0	2010-05-02	2235	\N	139488	\N
235546	GENERIC_DAY	0	0	2010-03-30	2249	\N	139488	\N
235547	GENERIC_DAY	0	3	2010-03-25	2229	\N	139488	\N
235548	GENERIC_DAY	0	0	2010-03-04	2225	\N	139488	\N
235549	GENERIC_DAY	0	0	2010-03-16	2249	\N	139488	\N
235550	GENERIC_DAY	0	0	2010-03-06	2241	\N	139488	\N
235551	GENERIC_DAY	0	0	2010-05-23	2229	\N	139488	\N
235552	GENERIC_DAY	0	2	2010-03-04	2245	\N	139488	\N
235553	GENERIC_DAY	0	2	2010-03-15	2237	\N	139488	\N
235554	GENERIC_DAY	0	1	2010-03-05	2229	\N	139488	\N
235555	GENERIC_DAY	0	0	2010-05-09	2235	\N	139488	\N
235556	GENERIC_DAY	0	0	2010-03-21	2225	\N	139488	\N
235557	GENERIC_DAY	0	1	2010-05-03	2245	\N	139488	\N
235558	GENERIC_DAY	0	0	2010-04-03	2229	\N	139488	\N
235559	GENERIC_DAY	0	0	2010-03-27	2239	\N	139488	\N
235560	GENERIC_DAY	0	1	2010-04-06	2241	\N	139488	\N
235561	GENERIC_DAY	0	0	2010-03-21	2245	\N	139488	\N
235562	GENERIC_DAY	0	0	2010-03-20	2231	\N	139488	\N
235563	GENERIC_DAY	0	1	2010-04-19	2249	\N	139488	\N
235564	GENERIC_DAY	0	2	2010-03-23	2245	\N	139488	\N
235565	GENERIC_DAY	0	1	2010-05-10	2229	\N	139488	\N
235566	GENERIC_DAY	0	0	2010-04-11	2237	\N	139488	\N
235567	GENERIC_DAY	0	1	2010-05-05	2229	\N	139488	\N
235568	GENERIC_DAY	0	2	2010-05-05	2231	\N	139488	\N
235569	GENERIC_DAY	0	0	2010-03-30	2243	\N	139488	\N
235570	GENERIC_DAY	0	1	2010-04-26	2249	\N	139488	\N
235571	GENERIC_DAY	0	1	2010-04-23	2251	\N	139488	\N
235572	GENERIC_DAY	0	0	2010-03-13	2233	\N	139488	\N
235573	GENERIC_DAY	0	0	2010-04-08	2235	\N	139488	\N
235574	GENERIC_DAY	0	0	2010-04-20	2225	\N	139488	\N
235575	GENERIC_DAY	0	1	2010-02-18	2235	\N	139488	\N
235576	GENERIC_DAY	0	2	2010-02-17	2241	\N	139488	\N
235577	GENERIC_DAY	0	1	2010-04-15	2247	\N	139488	\N
235578	GENERIC_DAY	0	1	2010-05-05	2251	\N	139488	\N
235579	GENERIC_DAY	0	0	2010-03-18	2225	\N	139488	\N
235580	GENERIC_DAY	0	1	2010-04-21	2247	\N	139488	\N
235581	GENERIC_DAY	0	0	2010-02-28	2239	\N	139488	\N
235582	GENERIC_DAY	0	1	2010-05-14	2249	\N	139488	\N
235583	GENERIC_DAY	0	0	2010-03-06	2233	\N	139488	\N
235584	GENERIC_DAY	0	1	2010-05-06	2235	\N	139488	\N
235585	GENERIC_DAY	0	1	2010-04-30	2247	\N	139488	\N
235586	GENERIC_DAY	0	1	2010-04-26	2241	\N	139488	\N
235587	GENERIC_DAY	0	0	2010-04-26	2225	\N	139488	\N
235588	GENERIC_DAY	0	0	2010-05-07	2225	\N	139488	\N
235589	GENERIC_DAY	0	2	2010-02-17	2245	\N	139488	\N
235590	GENERIC_DAY	0	0	2010-04-18	2235	\N	139488	\N
235591	GENERIC_DAY	0	0	2010-05-01	2233	\N	139488	\N
235592	GENERIC_DAY	0	0	2010-04-04	2223	\N	139488	\N
235593	GENERIC_DAY	0	2	2010-05-10	2243	\N	139488	\N
235594	GENERIC_DAY	0	0	2010-03-22	2243	\N	139488	\N
235595	GENERIC_DAY	0	1	2010-04-14	2247	\N	139488	\N
235596	GENERIC_DAY	0	3	2010-03-24	2223	\N	139488	\N
235597	GENERIC_DAY	0	0	2010-02-21	2243	\N	139488	\N
235598	GENERIC_DAY	0	1	2010-03-31	2239	\N	139488	\N
235599	GENERIC_DAY	0	1	2010-03-26	2229	\N	139488	\N
235600	GENERIC_DAY	0	0	2010-03-07	2243	\N	139488	\N
235601	GENERIC_DAY	0	2	2010-04-28	2223	\N	139488	\N
235602	GENERIC_DAY	0	0	2010-05-23	2241	\N	139488	\N
235603	GENERIC_DAY	0	0	2010-03-03	2247	\N	139488	\N
235604	GENERIC_DAY	0	1	2010-04-13	2247	\N	139488	\N
235605	GENERIC_DAY	0	0	2010-03-08	2225	\N	139488	\N
235606	GENERIC_DAY	0	2	2010-02-17	2251	\N	139488	\N
235607	GENERIC_DAY	0	0	2010-03-10	2247	\N	139488	\N
235608	GENERIC_DAY	0	0	2010-04-04	2229	\N	139488	\N
235609	GENERIC_DAY	0	0	2010-05-23	2249	\N	139488	\N
235610	GENERIC_DAY	0	1	2010-04-28	2251	\N	139488	\N
235611	GENERIC_DAY	0	1	2010-04-23	2235	\N	139488	\N
235612	GENERIC_DAY	0	1	2010-05-05	2247	\N	139488	\N
235613	GENERIC_DAY	0	2	2010-03-01	2237	\N	139488	\N
235614	GENERIC_DAY	0	0	2010-03-25	2233	\N	139488	\N
235615	GENERIC_DAY	0	1	2010-04-23	2233	\N	139488	\N
235616	GENERIC_DAY	0	2	2010-02-22	2245	\N	139488	\N
235617	GENERIC_DAY	0	1	2010-04-12	2245	\N	139488	\N
235618	GENERIC_DAY	0	1	2010-04-16	2243	\N	139488	\N
235619	GENERIC_DAY	0	0	2010-03-20	2251	\N	139488	\N
235620	GENERIC_DAY	0	0	2010-05-24	2249	\N	139488	\N
235621	GENERIC_DAY	0	1	2010-04-09	2243	\N	139488	\N
235622	GENERIC_DAY	0	0	2010-03-26	2249	\N	139488	\N
235623	GENERIC_DAY	0	0	2010-05-08	2243	\N	139488	\N
235624	GENERIC_DAY	0	1	2010-04-22	2249	\N	139488	\N
235625	GENERIC_DAY	0	0	2010-03-27	2249	\N	139488	\N
235626	GENERIC_DAY	0	0	2010-02-19	2231	\N	139488	\N
235627	GENERIC_DAY	0	0	2010-05-09	2243	\N	139488	\N
235628	GENERIC_DAY	0	1	2010-05-05	2233	\N	139488	\N
235629	GENERIC_DAY	0	2	2010-03-12	2237	\N	139488	\N
235630	GENERIC_DAY	0	1	2010-04-05	2233	\N	139488	\N
235631	GENERIC_DAY	0	1	2010-05-13	2233	\N	139488	\N
235632	GENERIC_DAY	0	2	2010-03-05	2237	\N	139488	\N
235633	GENERIC_DAY	0	1	2010-04-27	2229	\N	139488	\N
235634	GENERIC_DAY	0	0	2010-03-20	2237	\N	139488	\N
235635	GENERIC_DAY	0	0	2010-03-15	2249	\N	139488	\N
235636	GENERIC_DAY	0	2	2010-03-25	2237	\N	139488	\N
235637	GENERIC_DAY	0	0	2010-04-10	2239	\N	139488	\N
235638	GENERIC_DAY	0	2	2010-04-09	2251	\N	139488	\N
235639	GENERIC_DAY	0	0	2010-05-15	2233	\N	139488	\N
235640	GENERIC_DAY	0	2	2010-05-07	2237	\N	139488	\N
235641	GENERIC_DAY	0	0	2010-05-08	2245	\N	139488	\N
235642	GENERIC_DAY	0	0	2010-02-20	2241	\N	139488	\N
235643	GENERIC_DAY	0	0	2010-03-13	2251	\N	139488	\N
235644	GENERIC_DAY	0	0	2010-02-20	2229	\N	139488	\N
235645	GENERIC_DAY	0	2	2010-05-20	2243	\N	139488	\N
235646	GENERIC_DAY	0	0	2010-03-14	2229	\N	139488	\N
235647	GENERIC_DAY	0	0	2010-03-26	2231	\N	139488	\N
235648	GENERIC_DAY	0	0	2010-03-19	2233	\N	139488	\N
235649	GENERIC_DAY	0	0	2010-03-12	2225	\N	139488	\N
235650	GENERIC_DAY	0	2	2010-04-19	2223	\N	139488	\N
235651	GENERIC_DAY	0	1	2010-05-06	2239	\N	139488	\N
235652	GENERIC_DAY	0	0	2010-03-08	2237	\N	139488	\N
235653	GENERIC_DAY	0	0	2010-03-14	2251	\N	139488	\N
235654	GENERIC_DAY	0	2	2010-04-14	2223	\N	139488	\N
235655	GENERIC_DAY	0	0	2010-04-25	2251	\N	139488	\N
235656	GENERIC_DAY	0	1	2010-02-19	2245	\N	139488	\N
235657	GENERIC_DAY	0	1	2010-04-20	2229	\N	139488	\N
235658	GENERIC_DAY	0	0	2010-05-08	2231	\N	139488	\N
235659	GENERIC_DAY	0	2	2010-05-11	2231	\N	139488	\N
235660	GENERIC_DAY	0	0	2010-04-16	2225	\N	139488	\N
235661	GENERIC_DAY	0	0	2010-03-06	2235	\N	139488	\N
235662	GENERIC_DAY	0	2	2010-03-11	2223	\N	139488	\N
235663	GENERIC_DAY	0	0	2010-04-18	2237	\N	139488	\N
235664	GENERIC_DAY	0	3	2010-03-22	2223	\N	139488	\N
235665	GENERIC_DAY	0	0	2010-03-01	2233	\N	139488	\N
235666	GENERIC_DAY	0	0	2010-04-28	2225	\N	139488	\N
235667	GENERIC_DAY	0	1	2010-04-08	2241	\N	139488	\N
235668	GENERIC_DAY	0	2	2010-04-26	2231	\N	139488	\N
235669	GENERIC_DAY	0	0	2010-04-07	2235	\N	139488	\N
235670	GENERIC_DAY	0	0	2010-04-01	2239	\N	139488	\N
235671	GENERIC_DAY	0	0	2010-02-27	2247	\N	139488	\N
235672	GENERIC_DAY	0	2	2010-03-18	2251	\N	139488	\N
235673	GENERIC_DAY	0	0	2010-03-28	2237	\N	139488	\N
235674	GENERIC_DAY	0	1	2010-04-27	2241	\N	139488	\N
235675	GENERIC_DAY	0	0	2010-03-23	2243	\N	139488	\N
235676	GENERIC_DAY	0	0	2010-03-13	2249	\N	139488	\N
235677	GENERIC_DAY	0	0	2010-05-22	2245	\N	139488	\N
235678	GENERIC_DAY	0	0	2010-02-25	2231	\N	139488	\N
235679	GENERIC_DAY	0	0	2010-03-28	2229	\N	139488	\N
235680	GENERIC_DAY	0	2	2010-05-12	2231	\N	139488	\N
235681	GENERIC_DAY	0	2	2010-04-27	2231	\N	139488	\N
235682	GENERIC_DAY	0	1	2010-05-04	2241	\N	139488	\N
235683	GENERIC_DAY	0	0	2010-03-07	2247	\N	139488	\N
235684	GENERIC_DAY	0	2	2010-02-25	2251	\N	139488	\N
235685	GENERIC_DAY	0	2	2010-03-22	2245	\N	139488	\N
235686	GENERIC_DAY	0	2	2010-04-29	2223	\N	139488	\N
235687	GENERIC_DAY	0	1	2010-04-07	2233	\N	139488	\N
235688	GENERIC_DAY	0	1	2010-04-26	2229	\N	139488	\N
235689	GENERIC_DAY	0	0	2010-03-24	2231	\N	139488	\N
235690	GENERIC_DAY	0	0	2010-05-16	2251	\N	139488	\N
235691	GENERIC_DAY	0	1	2010-04-15	2229	\N	139488	\N
235692	GENERIC_DAY	0	0	2010-04-01	2237	\N	139488	\N
235693	GENERIC_DAY	0	0	2010-04-11	2229	\N	139488	\N
235694	GENERIC_DAY	0	0	2010-04-25	2249	\N	139488	\N
235695	GENERIC_DAY	0	1	2010-03-04	2239	\N	139488	\N
235696	GENERIC_DAY	0	1	2010-04-22	2245	\N	139488	\N
235697	GENERIC_DAY	0	0	2010-05-15	2249	\N	139488	\N
235698	GENERIC_DAY	0	0	2010-04-25	2239	\N	139488	\N
235699	GENERIC_DAY	0	0	2010-05-16	2239	\N	139488	\N
235700	GENERIC_DAY	0	1	2010-04-07	2229	\N	139488	\N
235701	GENERIC_DAY	0	2	2010-03-05	2223	\N	139488	\N
235702	GENERIC_DAY	0	2	2010-03-03	2251	\N	139488	\N
235703	GENERIC_DAY	0	0	2010-05-16	2243	\N	139488	\N
235704	GENERIC_DAY	0	2	2010-05-12	2223	\N	139488	\N
235705	GENERIC_DAY	0	1	2010-03-05	2245	\N	139488	\N
235706	GENERIC_DAY	0	0	2010-03-28	2249	\N	139488	\N
235707	GENERIC_DAY	0	2	2010-05-06	2223	\N	139488	\N
235708	GENERIC_DAY	0	0	2010-05-09	2225	\N	139488	\N
235709	GENERIC_DAY	0	0	2010-05-22	2249	\N	139488	\N
235710	GENERIC_DAY	0	1	2010-05-06	2241	\N	139488	\N
235711	GENERIC_DAY	0	0	2010-05-15	2243	\N	139488	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
1146948	9	3446	3447	0
1147001	6	3446	3454	0
1147002	6	3446	3453	0
1146895	6	3439	3440	0
1146907	4	3442	3443	1
1146914	4	3442	3443	1
32768001	2	3440	100900	0
32768002	2	100900	3442	0
67207170	1	207252	92718	0
67207171	1	92719	207252	0
1146888	5	3434	3435	0
79036416	2	64641	244319	0
79036417	2	244319	3434	0
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
25857	Incidencias	
25859	Incidencias	
25864	Incidencias	
25865	Incidencias	Nada destacable
25866	Incidencias	Nada destacable
25868	Incidencias	Nada destacable
25867	Incidencias	Nada destacable
25869	Incidencias	Nada destacable
25870	Incidencias	
25862	Incidencias	
139279	Incidencias	
139280	Incidencias	
139281	Incidencias	
139282	Incidencias	
139299	Incidencias	
139300	Incidencias	
139301	Incidencias	
139302	Incidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
25620	2798	1000.00
25621	2799	1000.00
86403	2802	100.00
60612	33304	100.00
65120	61963	200.00
65121	62983	100.00
86371	86154	100.00
86372	86168	100.00
206561	206344	100.00
45782	33229	100.00
45781	33229	6000.00
206562	206358	100.00
85873	85649	100.00
85874	85651	100.00
206566	138684	100.00
86398	86170	100.00
86399	86186	100.00
25576	2760	100.00
25577	2761	100.00
86376	84774	100.00
85877	84775	100.00
138789	138676	100.00
138790	138677	100.00
244728	244437	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
2425	1	Barreras	7892348	t	f	f	\N	\N	\N	\N
2424	4	Navantia	A12345678	t	f	f	\N	\N	\N	3232
85345	2	atenasa	G12342321	t	t	t	http://localhost:8080/navalplanner-webapp/	atensasa	aaa	85244
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
3641
3642
3650
3689
3692
3694
99081
139488
139489
139499
244926
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
2456
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
1622	3	50.11	2010-01-01	\N	1418	1516
1621	3	30.44	2010-01-01	\N	1417	1516
1624	3	20.10	2010-01-01	\N	1414	1516
1623	3	30.32	2010-01-01	\N	1416	1516
1625	3	25.23	2010-01-01	\N	1415	1516
1627	3	35.44	2010-02-01	\N	1417	1517
1626	3	30.23	2010-02-01	\N	1415	1517
1629	3	60.11	2010-02-01	\N	1418	1517
1630	3	25.10	2010-01-01	\N	1414	1517
1628	3	35.32	2010-02-01	\N	1416	1517
1635	2	38.00	2010-02-01	\N	1414	1519
1632	5	25.00	2010-01-01	\N	1414	1518
1637	1	15.00	2010-02-01	\N	1414	1521
1636	3	40.00	2010-01-01	\N	1414	1520
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
3058	7	PREFIX-00002-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	600	1.00	f	2798
3059	7	PREFIX-00002-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	600	1.00	f	2799
3060	7	PREFIX-00002-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	3000	1.00	f	2801
3061	7	PREFIX-00002-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	3000	1.00	f	2802
63062	14	PREFIX-00005-00015-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	6	0.10	f	62984
63063	14	PREFIX-00005-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	95	1.00	f	62985
63064	14	PREFIX-00005-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	95	1.00	f	62986
3073	15	PREFIX-00003-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	5	1.00	f	33237
61239	7	PREFIX-00004-00002-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	30	0.10	f	33304
3122	16	PREFIX-00004-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	270	0.90	f	33304
3123	16	PREFIX-00004-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33305
3124	16	PREFIX-00004-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33306
63061	14	PREFIX-00005-00015-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	54	0.90	f	62984
3125	16	PREFIX-00004-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33307
3126	16	PREFIX-00004-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33308
3127	16	PREFIX-00004-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33309
3128	16	PREFIX-00004-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33310
3129	16	PREFIX-00004-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33311
3068	16	PREFIX-00003-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	2827
3080	12	PREFIX-00003-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	30	1.00	f	33244
3069	16	PREFIX-00003-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	30	1.00	f	33229
3081	12	PREFIX-00003-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	30	1.00	f	33245
3130	16	PREFIX-00004-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33312
59691	16	PREFIX-00004-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33313
59692	16	PREFIX-00004-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	33314
63071	14	PREFIX-00005-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	62993
63072	14	PREFIX-00005-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	62994
63073	14	PREFIX-00005-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	95	1.00	f	62995
3043	14	PREFIX-00001-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	2000	0.51	f	2761
86262	6	PREFIX-00010-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	86170
86270	6	PREFIX-00010-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	200	1.00	f	86186
63065	14	PREFIX-00005-00018-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	62987
63066	14	PREFIX-00005-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	62988
63067	14	PREFIX-00005-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	75	1.00	f	62989
63068	14	PREFIX-00005-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	62990
63069	14	PREFIX-00005-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	250	1.00	f	62991
63070	14	PREFIX-00005-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	60	1.00	f	62992
59693	16	PREFIX-00004-00013-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	20	1.00	f	33315
84963	5	PREFIX-00007-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	84774
84964	5	PREFIX-00007-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	84775
85749	5	PREFIX-00008-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	85649
85750	5	PREFIX-00008-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	200	1.00	f	85651
86254	15	PREFIX-00009-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	86154
138875	7	PREFIX-00011-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	138676
206451	3	PREFIX-00013-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	206358
138876	7	PREFIX-00011-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	138677
67069	5	PREFIX-00001-00004-00003	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1500	0.38	f	2761
86261	15	PREFIX-00009-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	86168
3042	14	PREFIX-00001-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	5000	1.00	f	2760
138879	5	PREFIX-00012-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	138683
138880	5	PREFIX-00012-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	138684
206444	3	PREFIX-00013-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	206344
67068	5	PREFIX-00001-00004-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	400	0.10	f	2761
135239	3	PREFIX-00001-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	135139
3044	14	PREFIX-00001-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	3000	1.00	f	2763
3045	14	PREFIX-00001-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	2764
244540	2	PREFIX-00014-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244443
244541	2	PREFIX-00014-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244444
244521	3	PREFIX-00011-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	244420
244546	3	PREFIX-00015-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	1000	1.00	f	244451
244534	2	PREFIX-00014-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	470	1.00	f	244437
244535	2	PREFIX-00014-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244438
244536	2	PREFIX-00014-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244439
244537	2	PREFIX-00014-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244440
244538	2	PREFIX-00014-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244441
244539	2	PREFIX-00014-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244442
244542	2	PREFIX-00014-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244445
244543	2	PREFIX-00014-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244446
244544	2	PREFIX-00014-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	244447
244545	2	PREFIX-00014-00013-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	20	1.00	f	244448
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
1925	6	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
2865	2797
25622	2797
2866	2800
2867	2796
25623	2796
244729	244436
86404	2800
86405	2796
244730	244436
244731	244435
45783	33249
45784	33249
25649	33249
25645	33236
25641	2826
45786	2826
45785	2826
45788	2816
45787	2816
244732	244435
244734	244450
62046	62983
65122	61963
85851	85650
85875	85650
85876	85648
85850	85648
60613	33319
45806	33319
60614	33263
86373	86167
86374	86167
86355	86153
86375	86153
206563	206357
206564	206357
206565	206343
206545	206343
138795	138682
206567	138682
86401	86185
86400	86185
86377	86169
86402	86169
25578	2759
135340	135138
2845	2762
25579	2740
135341	2740
84852	84773
85878	84773
138775	138675
138791	138675
138792	138674
138776	138674
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1112	7	df7c75ca-2b11-4f2a-85f2-ca43284b0344	Alta	1010
1113	7	41b98298-6098-4d7d-93f5-a8f2da3b29e2	Baja	1010
1115	16	a5cbfb16-a9d5-4b75-8b29-cedca43812d9	A bordo	1011
1111	12	0b520a5b-90be-4f00-9d31-36e903f0ec5d	Media	1010
1114	10	05565f49-e1b7-4894-a133-a5ad8f84108b	Taller	1011
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name) FROM stdin;
1010	1	f3c7baa5-0579-4253-9a5b-ec435379f635	Prioridad
1011	2	ca030448-9fef-4102-844c-7c42e91c51b3	Centro de Coste
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
25654	Incidencias	15	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
2251	009	tras tras	máquina cotadora
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
1313	3	A5	Tornillo A5	11.12	\N	f	1214
1315	3	A3	Tornillo A3	12.20	\N	f	1214
1314	3	A4	Tornillo A4	14.23	\N	f	1214
1317	2	E5	Tuerca E5	12.32	\N	f	1215
1316	2	E6	Tuerca E6	1.32	\N	f	1215
1318	2	E4	Tuerca E4	11.23	\N	f	1215
1319	1	P3	Puerta P3	100.23	\N	f	1216
1320	1	P4	Puerta P4	101.32	\N	f	1216
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
101	4	Imported materials without category	\N
1212	3	Metal	\N
1214	3	Tornillos	1212
1215	3	Tuercas	1212
1213	3	Madera	\N
1216	3	Puertas	1213
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
2121	1	Administrador
2122	1	Auditoria
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled) FROM stdin;
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
909	6	user	1f941069ed5d9471e8a245f38652cab0aab627a57aec305549c34fc56fd064000892f5e4ef4311455f54b96f29cf9fbb67877003c373ff88e503b0f708e1a183	\N	f
3232	1	unavantia	c82765aada2a889d001569e3d96478ab9f07365595e4d64754265565c6d15a59185d2880ada01fa776485aac41c9454dfabab74fa285c4762c10e8c4ac04b6b8	navantia@navantia.es	f
85244	3	atensasa	8663d3ae142728242f9a15c464af565e99c52609818146b4a0986bf811e15e47428c6137036206dda32e97c189678f43116c995b7b4a41e757f3017a2052b48c	atenasa@atenasa.com	f
910	6	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
67165	2	javi	28e8bf680af9dbe709211fde32d6663f6a2beb8fcfe76ac718b2ae20568c11ea0ca9956b0bacbdf41b8fa391b03bc034301a9ded8f53d47734e40460d8245b6e	jmoran@igalia.com	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
2930	USER	6	WRITE_AUTHORIZATION	2796	910	\N
62115	USER	16	WRITE_AUTHORIZATION	61963	910	\N
84437	PROFILE	4	READ_AUTHORIZATION	2816	\N	2122
2931	USER	16	WRITE_AUTHORIZATION	2816	910	\N
84436	USER	5	READ_AUTHORIZATION	2816	67165	\N
67266	PROFILE	2	READ_AUTHORIZATION	33263	\N	2122
2932	USER	16	WRITE_AUTHORIZATION	33263	910	\N
139078	USER	4	WRITE_AUTHORIZATION	138682	910	\N
206747	USER	1	READ_AUTHORIZATION	138682	67165	\N
2929	USER	14	WRITE_AUTHORIZATION	2740	910	\N
85042	USER	4	WRITE_AUTHORIZATION	84773	910	\N
139077	USER	6	WRITE_AUTHORIZATION	138674	910	\N
244824	USER	1	WRITE_AUTHORIZATION	244435	910	\N
244825	USER	2	WRITE_AUTHORIZATION	244450	910	\N
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
2760	1111
2760	1115
2762	1114
2798	1111
2801	1112
2827	1113
62983	1112
62990	1115
138682	1115
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
134943	1112
134955	1114
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
2796	Daniel Fernandez	\N	t	6	100000.00	20000.00	7200	\N	\N	0	2424	1717
138674	Javier	\N	t	4	0.00	0.00	2100	ref-1	\N	0	2425	1717
244435	\N	\N	t	13	0.00	0.00	3490	\N	\N	0	\N	1717
244450	asi es	\N	t	1	0.00	0.00	1000	yuhu	\N	0	2424	1717
61963	OSCAR GÓMEZ	t	t	27	126000.00	0.00	1090	INDUSTRIA AUXILIAR	\N	2	\N	1717
2816	OSCAR	t	t	8	0.00	0.00	110	\N	\N	1	2425	1717
85648	\N	\N	t	3	1000.00	0.00	300	cod-sub-1	\N	5	85345	1717
33263	OSCAR GÓMEZ	t	t	14	126000.00	0.00	3320	CONSELLERÍA DE INDUSTRIA	\N	2	\N	1717
86153	\N	\N	t	3	2000.00	0.00	2000	subcon-2	\N	5	85345	1717
206343	\N	\N	t	3	1000.00	0.00	1100	c1	\N	5	85345	1717
138682	Andalucia	\N	t	2	0.00	0.00	2000	ref-42	\N	0	2424	1717
86169	\N	\N	t	3	3000.00	0.00	300	qwe	\N	5	85345	1717
2740	Andrés Gómez	\N	t	8	50000.00	600000.00	13900	E2342	\N	0	2425	1717
84773	Lorenzo Tilve	\N	t	2	0.00	0.00	2000	ref1	\N	0	2425	1717
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
2797	7	Revision calidad	\N	PREFIX-00002-00001	\N	\N	3	2796	\N	\N	0
2798	7	Revision tubos encajan	\N	PREFIX-00002-00003	\N	\N	0	2797	\N	\N	0
2799	7	Revision soldaduras correctas	\N	PREFIX-00002-00004	\N	\N	0	2797	\N	\N	1
2801	7	Colocar tubos camorotes A-M	\N	PREFIX-00002-00005	\N	\N	0	2800	\N	\N	0
61963	19	PROYECTOS ACLUNAGA - 1	\N	PREFIX-00005	2010-02-12 17:44:02.986	2010-12-31 00:00:00	3	\N	61335	\N	\N
62983	14	FORCLUNAGA	\N	PREFIX-00005-00014	\N	\N	3	61963	\N	\N	0
62984	14	 CONOCIMIENTO GENERAL	\N	PREFIX-00005-00015	\N	\N	0	62983	\N	\N	0
62985	14	F,M, y P. DE LA ESTRUCTURA	\N	PREFIX-00005-00016	\N	\N	0	62983	\N	\N	1
62986	14	F,M, y P. DEL ARMAMENTO	\N	PREFIX-00005-00017	\N	\N	0	62983	\N	\N	2
62987	14	CALIDAD, PREVENCION Y M.AMBIENTE	\N	PREFIX-00005-00018	\N	\N	0	62983	\N	\N	3
62988	14	GESTIÓN DE P. y LOGISTICA	\N	PREFIX-00005-00019	\N	\N	0	62983	\N	\N	4
84774	6	Analisis	\N	PREFIX-00007-00001	\N	\N	0	84773	\N	\N	0
84775	6	Implementacion	\N	PREFIX-00007-00002	\N	\N	0	84773	\N	\N	1
86153	15	subcontratacion 2	\N	PREFIX-00009	2010-02-16 12:12:13.962	\N	4	\N	\N	\N	\N
86154	15	Analisis (copy)	\N	PREFIX-00009-00001	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	4	86167	\N	\N	0
2740	16	PUERTAS BLOQUE A41	\N	PREFIX-00001	2010-02-01 18:06:04.306	2010-06-01 00:00:00	3	\N	\N	\N	\N
2759	14	Cubierta	\N	PREFIX-00001-00001	\N	\N	3	2740	\N	\N	0
2760	14	Montaje Puertas	\N	PREFIX-00001-00003	\N	\N	0	2759	\N	\N	0
2761	14	Repaso Puertas	\N	PREFIX-00001-00004	\N	\N	0	2759	\N	\N	1
2762	14	Bodega	\N	PREFIX-00001-00002	\N	\N	3	2740	\N	\N	1
85648	5	subcontratacion primera	\N	PREFIX-00008	2010-02-16 12:12:13.962	\N	4	\N	\N	\N	\N
85650	5	Implementacion	\N	PREFIX-00008-00002	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	4	85648	\N	PREFIX-00007-00002	0
33319	15	PROYECTO AUXNAVALIA	\N	PREFIX-00004-00014	\N	2010-12-20 00:00:00	3	33263	\N	\N	0
85649	5	uno	\N	PREFIX-00008-00001	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	4	85650	\N	PREFIX-00007-00002	0
33244	12	CONT 2	\N	PREFIX-00003-00006	\N	\N	0	33249	\N	\N	0
33229	16	CONTABILIDAD	\N	PREFIX-00003-00003	\N	\N	0	33249	\N	\N	1
33245	12	CONT 3	\N	PREFIX-00003-00007	\N	\N	0	33249	\N	\N	2
33236	15	GESTION	\N	PREFIX-00003-00004	\N	\N	3	2826	\N	\N	2
62989	14	GESTION DE CENTROS E INSTALACIONES	\N	PREFIX-00005-00020	\N	\N	0	62983	\N	\N	5
62990	14	GESTION DE PROYECTOS	\N	PREFIX-00005-00021	\N	\N	0	62983	\N	\N	6
62991	14	PROCESOS DE LA INGENIERIA	\N	PREFIX-00005-00022	\N	\N	0	62983	\N	\N	7
62992	14	PROCESOS DE APROVISIONAMIENTO	\N	PREFIX-00005-00023	\N	\N	0	62983	\N	\N	8
62993	14	GESTIÓN COMERCIAL Y MARKETING	\N	PREFIX-00005-00024	\N	\N	0	62983	\N	\N	9
62994	14	GESTION FINANCIERA Y CONTROL DE GESTIÓN             	\N	PREFIX-00005-00025	\N	\N	0	62983	\N	\N	10
62995	14	CAPACIDADES Y HABILIDADES DIRECTIVAS    	\N	PREFIX-00005-00026	\N	\N	0	62983	\N	\N	11
2763	14	Montaje Puertas (copy)	\N	PREFIX-00001-00005	\N	\N	0	135138	\N	\N	1
2764	14	Repaso Puertas	\N	PREFIX-00001-00006	\N	\N	0	2762	\N	\N	1
84773	8	Pedido N+1	aqui	PREFIX-00007	2010-02-16 12:12:13.962	\N	3	\N	\N	\N	\N
33237	15	PRESENTACION	\N	PREFIX-00003-00005	\N	\N	0	33236	\N	\N	0
85651	5	dos	\N	PREFIX-00008-00003	\N	\N	4	85650	\N	\N	1
2816	19	EXEMPLO1	\N	PREFIX-00003	2010-02-05 00:00:00	2010-12-31 00:00:00	3	\N	\N	\N	\N
2826	16	PROYECTOS OSCAR	\N	PREFIX-00003-00001	\N	\N	3	2816	\N	\N	0
2827	16	JUSTIFICACION	\N	PREFIX-00003-00002	\N	\N	0	2826	\N	\N	0
33249	11	GRUPO CONTABILIDAD	\N	PREFIX-00003-00008	\N	\N	3	2826	\N	\N	1
2800	8	Poner tubos	\N	PREFIX-00002-00002	\N	\N	3	2796	\N	\N	1
2802	8	Colocar tubos camarotes N-Z	\N	PREFIX-00002-00006	\N	\N	0	2800	\N	\N	1
2796	9	Tuberia de camarotes - BPE	Poner los tubos que faltan en todos los camarotes	PREFIX-00002	2010-02-01 18:17:53.957	2010-11-27 00:00:00	3	\N	\N	\N	\N
33304	16	ACTIVIDAD 1	\N	PREFIX-00004-00002	\N	\N	0	33319	\N	\N	0
33263	18	PROYECTOS ACLUNAGA	\N	PREFIX-00004	2010-02-04 20:50:00.114	2010-12-31 00:00:00	3	\N	\N	\N	\N
33305	16	ACTIVIDAD 2	\N	PREFIX-00004-00003	\N	\N	0	33319	\N	\N	1
33306	16	ACTIVIDAD 3	\N	PREFIX-00004-00004	\N	\N	0	33319	\N	\N	2
33307	16	ACTIVIDAD 4	\N	PREFIX-00004-00005	\N	\N	0	33319	\N	\N	3
33308	16	ACTIVIDAD 5	\N	PREFIX-00004-00006	\N	\N	0	33319	\N	\N	4
33309	16	ACTIVIDAD 6	\N	PREFIX-00004-00007	\N	\N	0	33319	\N	\N	5
33310	16	ACTIVIDAD 7	\N	PREFIX-00004-00008	\N	\N	0	33319	\N	\N	6
138677	7	CU-1 	\N	PREFIX-00011-00003	\N	\N	0	138675	\N	\N	1
244420	3	Nuevo	\N	PREFIX-00011-00004	\N	\N	0	138674	\N	\N	1
138674	8	Pedido N+2	Unha boa planificacion	PREFIX-00011	2010-02-16 18:12:57.31	\N	3	\N	\N	\N	\N
86167	15	Analisis	\N	PREFIX-00009-00002	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	4	86153	\N	PREFIX-00007-00001	0
86168	15	Analisis	\N	PREFIX-00009-00003	\N	\N	4	86167	\N	\N	1
206343	3	hacer pelotas	\N	PREFIX-00013	2010-02-16 19:05:12.816	\N	4	\N	\N	\N	\N
206357	3	CU-2-2	\N	PREFIX-00013-00002	2010-02-16 19:05:12.816	2010-08-25 19:05:12.816	4	206343	\N	PREFIX-00012-00002	0
206344	3	CU-2-2 (copy)	\N	PREFIX-00013-00001	2010-02-16 19:05:12.816	2010-08-25 19:05:12.816	4	206357	\N	\N	0
206358	3	sub-1	\N	PREFIX-00013-00003	\N	\N	4	206357	\N	\N	1
138682	7	Pedido N+3	una buena descricion	PREFIX-00012	2010-02-16 19:05:12.816	\N	3	\N	\N	\N	\N
138683	5	CU-1-1	\N	PREFIX-00012-00001	\N	\N	0	138682	\N	\N	0
138684	6	CU-2-2	\N	PREFIX-00012-00002	\N	\N	0	138682	\N	\N	1
86169	7	asdf	\N	PREFIX-00010	2010-02-01 18:17:53.957	\N	3	\N	\N	\N	\N
86185	6	Colocar tubos camarotes N-Z	\N	PREFIX-00010-00002	2010-02-01 18:17:53.957	2011-07-09 18:17:53.957	3	86169	\N	PREFIX-00002-00006	0
86170	6	Colocar tubos camarotes N-Z (copy)	\N	PREFIX-00010-00001	2010-02-01 18:17:53.957	2011-07-09 18:17:53.957	0	86185	\N	\N	0
86186	6	aqui	\N	PREFIX-00010-00003	\N	\N	0	86185	\N	\N	1
135138	3	Montaje Puertas	\N	PREFIX-00001-00007	\N	\N	3	2762	\N	\N	0
135139	3	Nuevo	\N	PREFIX-00001-00008	\N	\N	0	135138	\N	\N	0
33311	16	ACTIVIDAD 8	\N	PREFIX-00004-00009	\N	\N	0	33319	\N	\N	7
33312	16	ACTIVIDAD 9	\N	PREFIX-00004-00010	\N	\N	0	33319	\N	\N	8
33313	16	ACTIVIDAD 10	\N	PREFIX-00004-00011	\N	\N	0	33319	\N	\N	9
33314	16	ACTIVIDAD 11	\N	PREFIX-00004-00012	\N	\N	0	33319	\N	\N	10
33315	16	ACTIVIDAD 12	\N	PREFIX-00004-00013	\N	\N	0	33319	\N	\N	11
244435	2	proyecto N+5	\N	PREFIX-00014	2010-02-17 17:37:04.327	2011-01-12 00:00:00	3	\N	61335	\N	\N
244436	2	PROYECTO AUXNAVALIA	\N	PREFIX-00014-00001	\N	2011-01-01 00:00:00	3	244435	\N	\N	0
138675	7	Modulo 1	\N	PREFIX-00011-00001	\N	\N	3	138674	\N	\N	0
138676	7	CU-2	\N	PREFIX-00011-00002	\N	\N	0	138675	\N	\N	0
244437	2	ACTIVIDAD 1	\N	PREFIX-00014-00002	\N	\N	1	244436	\N	\N	0
244438	2	ACTIVIDAD 2	\N	PREFIX-00014-00003	\N	\N	1	244436	\N	\N	1
244439	2	ACTIVIDAD 3	\N	PREFIX-00014-00004	\N	\N	1	244436	\N	\N	2
244440	2	ACTIVIDAD 4	\N	PREFIX-00014-00005	\N	\N	1	244436	\N	\N	3
244441	2	ACTIVIDAD 5	\N	PREFIX-00014-00006	\N	\N	1	244436	\N	\N	4
244442	2	ACTIVIDAD 6	\N	PREFIX-00014-00007	\N	\N	1	244436	\N	\N	5
244443	2	ACTIVIDAD 7	\N	PREFIX-00014-00008	\N	\N	1	244436	\N	\N	6
244444	2	ACTIVIDAD 8	\N	PREFIX-00014-00009	\N	\N	1	244436	\N	\N	7
244445	2	ACTIVIDAD 9	\N	PREFIX-00014-00010	\N	\N	1	244436	\N	\N	8
244446	2	ACTIVIDAD 10	\N	PREFIX-00014-00011	\N	\N	1	244436	\N	\N	9
244447	2	ACTIVIDAD 11	\N	PREFIX-00014-00012	\N	\N	1	244436	\N	\N	10
244448	2	ACTIVIDAD 12	\N	PREFIX-00014-00013	\N	\N	1	244436	\N	\N	11
244451	3	Cajas	\N	PREFIX-00015-00001	\N	\N	0	244450	\N	\N	0
244450	4	Nuevo 2	ahora hai que hacerlo	PREFIX-00015	2010-02-17 17:37:45.408	\N	3	\N	\N	\N	\N
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
61335	1	PROYECTOS ACLUNAGA	\N	PREFIX-00004	0	329	3	\N	\N
61336	1	PROYECTO AUXNAVALIA	\N	PREFIX-00004-00014	\N	318	0	61335	0
61337	1	ACTIVIDAD 1	\N	PREFIX-00004-00002	\N	\N	1	61336	0
61338	1	ACTIVIDAD 2	\N	PREFIX-00004-00003	\N	\N	1	61336	1
61339	1	ACTIVIDAD 3	\N	PREFIX-00004-00004	\N	\N	1	61336	2
61340	1	ACTIVIDAD 4	\N	PREFIX-00004-00005	\N	\N	1	61336	3
61341	1	ACTIVIDAD 5	\N	PREFIX-00004-00006	\N	\N	1	61336	4
61342	1	ACTIVIDAD 6	\N	PREFIX-00004-00007	\N	\N	1	61336	5
61343	1	ACTIVIDAD 7	\N	PREFIX-00004-00008	\N	\N	1	61336	6
61344	1	ACTIVIDAD 8	\N	PREFIX-00004-00009	\N	\N	1	61336	7
61345	1	ACTIVIDAD 9	\N	PREFIX-00004-00010	\N	\N	1	61336	8
61346	1	ACTIVIDAD 10	\N	PREFIX-00004-00011	\N	\N	1	61336	9
61347	1	ACTIVIDAD 11	\N	PREFIX-00004-00012	\N	\N	1	61336	10
61348	1	ACTIVIDAD 12	\N	PREFIX-00004-00013	\N	\N	1	61336	11
134942	1	Modelo - Poner tubos 	\N	PREFIX-00002-00002	\N	\N	3	\N	\N
134943	1	Colocar tubos camorotes A-M	\N	PREFIX-00002-00005	\N	\N	0	134942	0
134944	1	Colocar tubos camarotes N-Z	\N	PREFIX-00002-00006	\N	\N	0	134942	1
134955	4	Bodega - Templates - 1	\N	PREFIX-00001-00002	\N	\N	3	\N	\N
134956	4	Montaje Puertas	\N	PREFIX-00001-00007	\N	\N	3	134955	0
134957	4	Nuevo	\N	PREFIX-00001-00008	\N	\N	0	134956	0
134958	4	Montaje Puertas (copy)	\N	PREFIX-00001-00005	\N	\N	0	134956	1
134959	4	Repaso Puertas	\N	PREFIX-00001-00006	\N	\N	0	134955	1
135443	10	aqui asdfsaf 	\N	PREFIX-00010-00003	\N	\N	0	\N	\N
206951	2	CU-2-2	\N	PREFIX-00012-00002	3	\N	0	\N	\N
206954	1	CU-2-2	\N	PREFIX-00012-00002	\N	\N	0	\N	\N
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
2798	1
2799	1
2801	1
2802	1
62984	2
62985	1
62986	1
62987	1
85649	1
85651	1
62988	1
62989	1
62990	1
62991	1
62992	1
62993	1
62994	1
62995	1
206344	1
206358	1
138683	1
138684	1
86170	1
86186	1
2760	1
2761	3
135139	1
2763	1
2764	1
84774	1
84775	1
138676	1
138677	1
244420	1
244437	1
244438	1
244439	1
244440	1
244441	1
244442	1
244443	1
244444	1
244445	1
244446	1
244447	1
244448	1
244451	1
2827	1
33244	1
33229	1
33245	1
33237	1
33304	2
33305	1
33306	1
33307	1
33308	1
33309	1
33310	1
33311	1
33312	1
33313	1
33314	1
33315	1
86154	1
86168	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
2740
2759
2762
2796
2797
2800
2816
2826
33236
33249
33263
33319
61963
62983
84773
85648
85650
86153
86167
86169
86185
135138
138674
138675
138682
206343
206357
244435
244436
244450
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
61335
61336
134942
134955
134956
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, workhours) FROM stdin;
61337	470
61338	300
61339	300
61340	300
61341	300
61342	300
61343	300
61344	300
61345	300
61346	300
61347	300
61348	20
134943	3000
134944	3000
134957	1000
134958	3000
134959	1000
135443	200
206951	1000
206954	1000
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	17	PREFIX	15	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
61335	1717
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
2121	ROLE_WS_READER
2121	ROLE_ADMINISTRATION
2121	ROLE_CREATE_ORDER
2121	ROLE_EDIT_ALL_ORDERS
2121	ROLE_WS_WRITER
2121	ROLE_READ_ALL_ORDERS
2122	ROLE_WS_READER
2122	ROLE_READ_ALL_ORDERS
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype, reportadvance, advance_type_id) FROM stdin;
2020	1	Chequeo de Puertas		0	\N	\N
84638	1	Formulario 	Uno Dos Tres	0	f	\N
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
2020	Montaje del Marco	30.00	0	0
2020	Montaje de Bisagras	50.00	1	1
2020	Montaje de puerta	80.00	2	2
2020	Montaje de la Manilla	100.00	3	3
84638	Ahora	10.00	0	0
84638	Despues	20.00	1	1
84638	Finalmente	30.00	2	2
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, base_calendar_id, code) FROM stdin;
2229	1	1720	2229
2225	2	1719	2225
2223	2	1718	2223
2231	1	1721	2231
2233	1	1722	2233
2245	5	1730	2245
2237	7	1726	2237
2243	7	1729	2243
2247	3	1731	2247
2249	2	1732	2249
2251	2	1733	2251
2235	9	1725	2235
2239	6	1727	2239
2241	6	1728	2241
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
3641	4	2.00	3439	\N
3687	7	0.68	3446	\N
3692	4	2.14	3453	\N
3689	5	1.89	3447	34966
3694	3	1.00	3454	34958
3642	4	1.20	3440	\N
3650	3	1.00	3442	\N
139499	1	1.00	138980	\N
139488	2	2.00	138976	\N
139489	2	1.00	138977	\N
99081	2	1.00	3434	\N
244926	2	10.00	244637	\N
93091	3	1.00	92722	\N
93092	3	1.00	92723	\N
93093	3	1.00	92724	\N
93094	3	1.00	92725	\N
93095	3	1.00	92726	\N
93096	3	1.00	92727	\N
93097	3	1.00	92728	\N
97181	2	1.00	92729	\N
97182	2	1.00	92730	\N
97183	2	1.00	92731	\N
97184	2	1.00	92732	\N
97185	2	1.00	92733	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
1720	1
1719	1
1718	1
1721	1
1722	1
1730	1
1726	1
1729	1
1731	1
1732	1
1733	1
1725	1
1727	1
1728	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, initdate, enddate, cost_category_id, resource_id, code) FROM stdin;
33133	3	2010-02-01	\N	1521	2245	33133
33129	5	2010-01-01	\N	1518	2237	33129
33130	5	2010-01-01	\N	1518	2243	33130
33134	2	2010-02-01	\N	1521	2247	33134
33135	2	2010-03-01	2010-12-31	1519	2249	33135
33136	2	2010-02-12	2010-02-28	1518	2249	33136
33132	3	2010-02-01	\N	1520	2235	33132
33131	4	2010-01-01	\N	1519	2239	33131
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
3687	2243
93091	2229
93092	2225
93093	2231
93094	2233
93095	2245
93096	2237
93097	2243
97181	2247
97182	2249
97183	2251
97184	2239
97185	2241
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
34958	2010-02-12	0.30	0.15	0
34958	2010-02-14	0.60	0.30	1
34958	2010-02-17	1.00	1.00	2
34966	2010-02-12	0.30	0.15	0
34966	2010-02-13	0.45	0.30	1
34966	2010-02-14	0.60	0.45	2
34966	2010-02-17	1.00	1.00	3
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
34966	0
34958	0
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, task_element_id, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
27918339	4	85345	3443	2010-02-16 14:02:15.687	2010-02-16 14:03:06.157	asdf	3000.00	qwe	\N	\N	\N	\N	2
64323586	5	85345	138981	2010-02-16 20:22:57.225	2010-02-16 20:23:44.99	hacer pelotas	1000.00	c1	\N	\N	\N	\N	2
27918337	3	85345	85143	2010-02-16 13:41:31.759	2010-02-16 13:42:03.201	subcontratacion 2	2000.00	subcon-2	\N	\N	\N	\N	2
27754497	6	85345	85446	2010-02-16 12:59:24.322	2010-02-16 13:07:32.852	subcontratacion primera	1000.00	cod-sub-1	\N	\N	\N	\N	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
244637	1	0	\N	\N
3439	1	0	\N	\N
3440	1	0	\N	\N
61155	1	0	\N	\N
61156	1	0	\N	\N
61157	1	0	\N	\N
61158	1	0	\N	\N
61159	1	0	\N	\N
61160	1	0	\N	\N
61161	1	0	\N	\N
61162	1	0	\N	\N
61163	1	0	\N	\N
61164	1	0	\N	\N
61165	1	0	\N	\N
61166	1	0	\N	\N
3442	1	0	\N	\N
3443	1	2	2010-02-01 18:17:53.957	27918339
3446	1	0	\N	\N
3453	2	0	\N	\N
3447	1	0	\N	\N
3454	1	0	\N	\N
3448	1	0	\N	\N
138980	1	0	\N	\N
138981	1	2	2010-02-16 19:05:12.816	64323586
92718	1	1	2010-02-01 18:17:53.957	\N
92719	1	1	2010-02-01 18:17:53.957	\N
92722	1	0	\N	\N
92723	1	1	2010-04-01 11:54:48.852	\N
92724	1	0	\N	\N
92725	1	0	\N	\N
92726	1	0	\N	\N
92727	1	0	\N	\N
92728	1	0	\N	\N
92729	1	0	\N	\N
92730	1	0	\N	\N
92731	1	0	\N	\N
92732	1	0	\N	\N
92733	1	0	\N	\N
3434	1	0	\N	\N
3435	1	1	2010-09-19 00:24:00	\N
100901	1	0	\N	\N
64640	1	0	\N	\N
64641	1	0	\N	\N
85143	1	2	2010-02-16 12:12:13.962	27918337
85446	1	2	2010-02-16 12:12:13.962	27754497
138976	1	0	\N	\N
138977	1	0	\N	\N
244622	1	0	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
84545	3	2020	2816	f
84547	3	84638	33249	f
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
84545	Montaje del Marco	30.00	0	t	2010-02-16 00:00:00	0
84545	Montaje de Bisagras	50.00	1	f	\N	1
84545	Montaje de puerta	80.00	2	f	\N	2
84545	Montaje de la Manilla	100.00	3	f	\N	3
84547	Ahora	10.00	0	t	2010-02-15 00:00:00	0
84547	Despues	20.00	1	f	\N	1
84547	Finalmente	30.00	2	f	\N	2
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
3439	3058
3440	3059
3442	3060
3443	3061
3446	3068
3453	3080
3447	3069
3454	3081
3448	3073
92722	61239
92722	3122
92723	3123
92724	3124
92725	3125
92726	3126
92727	3127
92728	3128
92729	3129
92730	3130
92731	59691
92732	59692
92733	59693
61155	63061
61155	63062
61156	63063
61157	63064
61158	63065
61159	63066
61160	63067
61161	63068
61162	63069
61163	63070
61164	63071
61165	63072
61166	63073
138980	138879
138981	138880
92718	86262
92719	86270
3434	3042
3435	3043
3435	67068
3435	67069
100901	135239
64640	3044
64641	3045
85143	84963
85446	84964
138976	138875
138977	138876
244622	244521
244637	244546
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
3441	14	Revision calidad	\N	2010-02-01 18:17:53.957	2010-06-26 18:17:53.957	\N	3445	\N	0
3439	10	Revision tubos encajan	\N	2010-02-01 18:17:53.957	2010-03-25 18:17:53.957	\N	3441	\N	0
3440	10	Revision soldaduras correctas	\N	2010-03-25 18:17:53.957	2010-06-26 18:17:53.957	\N	3441	\N	1
3434	15	Montaje Puertas	\N	2010-03-15 10:06:04.306	2011-09-29 10:06:04.306	\N	3436	\N	0
3436	24	Cubierta	\N	2010-03-15 10:06:04.306	2011-12-21 17:06:04.306	\N	3438	\N	0
3452	24	GRUPO CONTABILIDAD	\N	2010-02-05 00:00:00	2010-04-10 00:00:00	\N	3450	\N	1
3449	33	GESTION	\N	2010-02-05 00:00:00	2010-02-05 05:00:00	\N	3450	\N	2
3450	33	PROYECTOS OSCAR	\N	2010-02-05 00:00:00	2010-04-10 00:00:00	\N	3451	\N	0
3451	33	EXEMPLO1	\N	2010-02-05 00:00:00	2010-04-10 00:00:00	2010-12-31	\N	\N	\N
64642	12	Bodega	\N	2010-02-01 18:06:04.306	2010-06-06 19:06:04.306	\N	3438	\N	1
3442	10	Colocar tubos camorotes A-M	\N	2010-08-11 16:36:00	2012-02-21 16:36:00	\N	3444	\N	0
3443	11	Colocar tubos camarotes N-Z	\N	2010-02-01 18:17:53.957	2011-07-09 18:17:53.957	\N	3444	\N	1
61155	13	 CONOCIMIENTO GENERAL	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	0
61156	13	F,M, y P. DE LA ESTRUCTURA	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	1
61157	13	F,M, y P. DEL ARMAMENTO	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	2
3438	24	PUERTAS BLOQUE A41	\N	2010-02-01 18:06:04.306	2011-12-21 17:06:04.306	2010-06-01	\N	\N	\N
61158	13	CALIDAD, PREVENCION Y M.AMBIENTE	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	3
61159	13	GESTIÓN DE P. y LOGISTICA	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	4
61160	13	GESTION DE CENTROS E INSTALACIONES	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	5
61161	13	GESTION DE PROYECTOS	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	6
61162	13	PROCESOS DE LA INGENIERIA	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	7
61163	13	PROCESOS DE APROVISIONAMIENTO	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	8
61164	13	GESTIÓN COMERCIAL Y MARKETING	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	9
61165	13	GESTION FINANCIERA Y CONTROL DE GESTIÓN             	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	10
61166	13	CAPACIDADES Y HABILIDADES DIRECTIVAS    	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61167	\N	11
3445	14	Tuberia de camarotes - BPE	\N	2010-02-01 18:17:53.957	2012-02-21 16:36:00	2010-11-27	\N	\N	\N
61167	23	FORCLUNAGA	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	\N	61168	\N	0
3435	15	Repaso Puertas	\N	2011-09-29 10:06:04.306	2011-12-21 17:06:04.306	\N	3436	\N	1
100900	0	new milestone	\N	2010-08-11 16:36:00	2010-08-11 16:36:00	\N	3445	\N	1
3444	14	Poner tubos	\N	2010-02-01 18:17:53.957	2012-02-21 16:36:00	\N	3445	\N	2
138978	16	Modulo 1	\N	2010-02-16 18:12:57.31	2010-08-25 18:12:57.31	\N	138979	\N	0
138979	16	Pedido N+2	\N	2010-02-16 18:12:57.31	2010-08-25 18:12:57.31	\N	\N	\N	\N
244637	4	Cajas	\N	2010-02-17 17:37:45.408	2010-03-09 17:37:45.408	\N	244638	\N	0
3456	29	PROYECTOS ACLUNAGA	\N	2010-02-04 20:50:00.114	2010-06-01 11:54:48.852	2010-12-31	\N	\N	\N
61168	23	PROYECTOS ACLUNAGA - 1	\N	2010-02-12 17:44:02.986	2010-02-25 05:44:02.986	2010-12-31	\N	\N	\N
85143	6	Analisis	\N	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	\N	85144	\N	0
85446	7	Implementacion	\N	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	\N	85144	\N	1
3446	21	JUSTIFICACION	\N	2010-02-05 00:00:00	2010-02-11 00:00:00	\N	3450	\N	0
3453	13	CONT 2	\N	2010-02-11 00:00:00	2010-02-15 00:00:00	\N	3452	\N	0
3447	22	CONTABILIDAD	\N	2010-02-11 00:00:00	2010-04-10 00:00:00	\N	3452	\N	1
244622	1	Nuevo	\N	2010-02-16 18:12:57.31	2010-03-01 06:12:57.31	\N	138979	\N	1
92718	3	Colocar tubos camarotes N-Z (copy)	\N	2010-02-26 18:17:53.957	2010-03-11 06:17:53.957	2011-07-09	92720	\N	0
92719	3	aqui	\N	2010-02-01 18:17:53.957	2010-02-26 18:17:53.957	\N	92720	\N	1
244638	4	Nuevo 2	\N	2010-02-17 17:37:45.408	2010-03-09 17:37:45.408	\N	\N	\N	\N
3454	13	CONT 3	\N	2010-02-11 00:00:00	2010-02-17 00:00:00	\N	3452	\N	2
85144	7	Pedido N+1	\N	2010-02-16 12:12:13.962	2010-06-21 13:12:13.962	\N	\N	\N	\N
3448	21	PRESENTACION	\N	2010-02-05 00:00:00	2010-02-05 05:00:00	\N	3449	\N	0
92720	4	Colocar tubos camarotes N-Z	\N	2010-02-01 18:17:53.957	2010-03-11 06:17:53.957	2011-07-09	92721	\N	0
92721	4	asdf	\N	2010-02-01 18:17:53.957	2010-03-11 06:17:53.957	\N	\N	\N	\N
64640	9	Montaje Puertas (copy)	\N	2010-02-01 18:06:04.306	2010-06-06 19:06:04.306	\N	100902	\N	1
64641	8	Repaso Puertas	\N	2010-02-01 18:06:04.306	2010-03-15 10:06:04.306	\N	64642	\N	1
207252	0	new milestone	\N	2010-02-26 18:17:53.957	2010-02-26 18:17:53.957	\N	\N	\N	\N
138976	11	CU-2	\N	2010-02-16 18:12:57.31	2010-05-25 18:12:57.31	\N	138978	\N	0
138977	11	CU-1 	\N	2010-02-16 18:12:57.31	2010-08-25 18:12:57.31	\N	138978	\N	1
92734	5	PROYECTO AUXNAVALIA	\N	2010-02-04 20:50:00.114	2010-06-01 11:54:48.852	2010-12-20	3456	\N	0
92722	5	ACTIVIDAD 1	\N	2010-02-04 20:50:00.114	2010-02-05 20:50:00.114	\N	92734	\N	0
92723	5	ACTIVIDAD 2	\N	2010-04-01 11:54:48.852	2010-06-01 11:54:48.852	\N	92734	\N	1
92724	5	ACTIVIDAD 3	\N	2010-02-04 20:50:00.114	2010-04-06 20:50:00.114	\N	92734	\N	2
244634	1	ACTIVIDAD 12	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	11
244635	1	PROYECTO AUXNAVALIA	\N	2010-02-17 17:37:04.327	\N	2011-01-01	244636	\N	0
138980	5	CU-1-1	\N	2010-02-16 19:05:12.816	2010-08-25 19:05:12.816	\N	138982	\N	0
138981	6	CU-2-2	\N	2010-02-16 19:05:12.816	2010-08-25 19:05:12.816	\N	138982	\N	1
92725	5	ACTIVIDAD 4	\N	2010-02-04 20:50:00.114	2010-04-06 20:50:00.114	\N	92734	\N	3
92726	5	ACTIVIDAD 5	\N	2010-02-04 20:50:00.114	2010-02-05 20:50:00.114	\N	92734	\N	4
92727	5	ACTIVIDAD 6	\N	2010-02-04 20:50:00.114	2010-02-05 20:50:00.114	\N	92734	\N	5
92728	5	ACTIVIDAD 7	\N	2010-02-04 20:50:00.114	2010-04-06 20:50:00.114	\N	92734	\N	6
92729	5	ACTIVIDAD 8	\N	2010-02-04 20:50:00.114	2010-04-06 20:50:00.114	\N	92734	\N	7
92730	5	ACTIVIDAD 9	\N	2010-02-04 20:50:00.114	2010-04-16 20:50:00.114	\N	92734	\N	8
92731	5	ACTIVIDAD 10	\N	2010-02-04 20:50:00.114	2010-02-13 20:50:00.114	\N	92734	\N	9
92732	5	ACTIVIDAD 11	\N	2010-02-04 20:50:00.114	2010-02-05 20:50:00.114	\N	92734	\N	10
92733	5	ACTIVIDAD 12	\N	2010-02-04 20:50:00.114	2010-02-09 20:50:00.114	\N	92734	\N	11
138982	7	Pedido N+3	\N	2010-02-16 19:05:12.816	2010-08-25 19:05:12.816	\N	\N	\N	\N
244319	0	new milestone	\N	2010-03-15 10:06:04.306	2010-03-15 10:06:04.306	\N	3438	\N	2
100901	3	Nuevo	\N	2010-02-01 18:06:04.306	2010-06-06 19:06:04.306	\N	100902	\N	0
100902	4	Montaje Puertas	\N	2010-02-01 18:06:04.306	2010-06-06 19:06:04.306	\N	64642	\N	0
244636	1	proyecto N+5	\N	2010-02-17 17:37:04.327	\N	2011-01-12	\N	\N	\N
244623	1	ACTIVIDAD 1	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	0
244624	1	ACTIVIDAD 2	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	1
244625	1	ACTIVIDAD 3	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	2
244626	1	ACTIVIDAD 4	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	3
244627	1	ACTIVIDAD 5	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	4
244628	1	ACTIVIDAD 6	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	5
244629	1	ACTIVIDAD 7	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	6
244630	1	ACTIVIDAD 8	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	7
244631	1	ACTIVIDAD 9	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	8
244632	1	ACTIVIDAD 10	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	9
244633	1	ACTIVIDAD 11	\N	2010-02-17 17:37:04.327	\N	\N	244635	\N	10
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
3436
3438
3441
3444
3445
3449
3450
3451
3452
3456
61167
61168
64642
85144
92720
92721
92734
100902
138978
138979
138982
244623
244624
244625
244626
244627
244628
244629
244630
244631
244632
244633
244634
244635
244636
244638
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
100900
207252
244319
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
3441	5	2797
3444	5	2800
3445	5	2796
3439	9	2798
3440	9	2799
3442	9	2801
3443	9	2802
138978	6	138675
138979	6	138674
138976	11	138676
138977	11	138677
244622	1	244420
3452	10	33249
3449	13	33236
61167	12	62983
3450	13	2826
3451	13	2816
3446	25	2827
3453	15	33244
3447	25	33229
3454	15	33245
3448	25	33237
61168	12	61963
61155	23	62984
61156	23	62985
61157	23	62986
61158	23	62987
61159	23	62988
61160	23	62989
61161	23	62990
61162	23	62991
61163	23	62992
61164	23	62993
61165	23	62994
61166	23	62995
244623	1	244437
244624	1	244438
244625	1	244439
244626	1	244440
244627	1	244441
244628	1	244442
244629	1	244443
3456	13	33263
244630	1	244444
244631	1	244445
244632	1	244446
244633	1	244447
244634	1	244448
244635	1	244436
244636	1	244435
92722	1	33304
92723	1	33305
92724	1	33306
138982	3	138682
92725	1	33307
92726	1	33308
92727	1	33309
92728	1	33310
92729	1	33311
92730	1	33312
92731	1	33313
92732	1	33314
92733	1	33315
92734	1	33319
138980	5	138683
138981	5	138684
244637	1	244451
92720	2	86185
92721	2	86169
92718	3	86170
92719	3	86186
244638	1	244450
3436	10	2759
100902	2	135138
64642	5	2762
3438	10	2740
3434	19	2760
3435	19	2761
100901	3	135139
64640	9	2763
64641	9	2764
85144	3	84773
85143	5	84774
85446	3	84775
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
1414	1	Ordinaria	ORD	20.10	t
1415	2	Extraordinaria	EXT	25.23	t
1416	1	Nocturnidad	NOC	30.32	t
1417	1	Nocturinad Extraordinaria	EXTNOC	30.44	t
1418	1	Festivo	FES	50.11	t
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_profiles (user_id, profile_id) FROM stdin;
909	2122
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
910	ROLE_READ_ALL_ORDERS
910	ROLE_CREATE_ORDER
910	ROLE_EDIT_ALL_ORDERS
910	ROLE_ADMINISTRATION
911	ROLE_WS_READER
912	ROLE_WS_WRITER
912	ROLE_WS_READER
3232	ROLE_WS_READER
85244	ROLE_WS_WRITER
67165	ROLE_CREATE_ORDER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id) FROM stdin;
25756	1	182be53f-5010-4238-95b2-7d4b7b8c27b8	\N	25654	2229	\N
25758	1	57d6bfe6-e11d-45a8-90ce-3a6f58af6d88	\N	25654	2225	\N
25763	1	0fc2eb32-1a3a-4629-af1c-98edf1f284ac	\N	25654	2225	\N
25764	1	aa279ffc-0833-460e-94f8-35d098e741ab	\N	25654	2229	\N
25765	2	b69ebe30-7c88-4a56-8473-3f983978bf79	\N	25654	2231	\N
25766	1	90f7fec6-8ef0-4a05-9791-0a3aace70ec7	\N	25654	2239	\N
25761	2	a3b89fb4-4ddb-456e-b07a-18a045e37a95	\N	25654	2225	\N
139178	1	31643796-ffdf-4f94-a7db-9ff758245d59	\N	25654	2229	\N
139179	1	e51d8a30-817d-439d-a20f-1dc6d2c4578d	\N	25654	2225	\N
139190	1	a6ca57e2-06fc-441a-b8b1-da3707585c1b	\N	25654	2229	\N
236037	1	cfbf062f-cf1c-4a8c-929f-a309858e7239	\N	235936	\N	86153
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
25857	1	b2662183-9cc9-4e43-931e-88f7a640c2c6	100	2010-02-02 00:00:00	\N	\N	25756	2229	2759	1414
25859	1	c3dcf14f-efa7-4cdd-bc26-bf87e538e144	60	2010-02-09 00:00:00	\N	\N	25758	2225	2760	1417
25864	1	50747089-5803-4d53-8033-0a61a7068385	30	2010-02-20 00:00:00	\N	\N	25763	2225	2764	1416
25865	1	85ed54f0-35ec-44e3-904c-1cdac89a2898	6	2010-02-01 00:00:00	\N	\N	25764	2229	2798	1414
25866	1	f94170e6-5442-4c14-9021-c02760acfc29	7	2010-02-02 00:00:00	\N	\N	25764	2229	2799	1414
25869	1	a95b26e1-749a-4157-acb5-8387da67cae8	9	2010-02-03 00:00:00	\N	\N	25765	2231	2798	1414
25868	2	c9abaf26-d964-4d6c-808d-4deb9c1aad16	9	2010-02-02 00:00:00	\N	\N	25765	2231	2799	1414
25867	2	24d3a0b9-0e87-4748-98b1-6a195ba2aa09	9	2010-02-01 00:00:00	\N	\N	25765	2231	2798	1414
25870	1	7dfc35ed-738c-41da-8090-247339e79781	8	2010-02-04 00:00:00	\N	\N	25766	2239	33229	1414
25862	2	7babf053-d3a6-4270-86a4-0e6e92571f3d	70	2010-02-11 00:00:00	\N	\N	25761	2225	2763	1414
139279	1	f8c7c666-981f-4eb1-aee4-ee8423088c02	10	2010-02-17 00:00:00	\N	\N	139178	2229	138677	1415
139280	1	b8a750f2-f105-4a08-a15f-378b511ecf66	10	2010-02-16 00:00:00	\N	\N	139178	2229	138676	1414
139281	1	e342174a-65d8-49be-94d1-bca444243094	10	2010-02-16 00:00:00	\N	\N	139179	2225	138683	1415
139282	1	4cdb4983-fdcc-4cd5-a3a6-3a42a3f451ed	10	2010-02-17 00:00:00	\N	\N	139179	2225	138684	1415
139299	1	f128068a-0f65-4752-9eb3-30dd29812cac	4	2010-02-04 00:00:00	\N	\N	139190	2229	2799	1415
139300	1	9b72239d-720e-412c-808c-183e996c453f	5	2010-02-09 00:00:00	\N	\N	139190	2229	2798	1417
139301	1	bf170ff0-d6c5-4fbe-a1d6-8e2b8ba864d8	4	2010-02-11 00:00:00	\N	\N	139190	2229	62987	1417
139302	1	07fe6a57-bdec-44ce-9ba7-0e8dea5f7096	4	2010-02-19 00:00:00	\N	\N	139190	2229	85649	1415
236138	1	57ec7d1c-2093-4fa9-bd0f-0be28ff43770	10	2010-02-17 00:00:00	\N	\N	236037	2231	86153	1416
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
25654	1	Tipo recurso	tr1	f	t	f	0
206848	1	Tipo de recurso	Tipo de recurso	f	f	f	0
235734	1	nombreta	ta	f	f	f	0
235835	2	asdf	nombreta	f	f	f	0
235836	1	ta	ahora	f	f	f	0
235936	1	B	cod-b	f	f	t	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
2229	Laura	Barreras	1236583D
2225	Luis	Dacosta	9876546D
2223	Roberto	Suarez	37898732F
2231	Javier	Fontan	9278372F
2233	Ruben	Perez	8728934F
2245	TERESA	HOMBRE ALLEGUE	333333333D
2237	TERESA	LAGO RUA	56456345L
2243	ROSA	CERNADAS FEAL	222222222F
2247	AIDA	OURENS CHANS	444444444S
2249	rafael 	dominguez lago	77008107J
2235	TOMAS	CASQUERO CIMADEVILA	32234567R
2239	OSCAR	GOMEZ DIAZ	32659602
2241	RAFAEL	DOMINGUEZ LAGO	111111111F
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
-- Name: subcontractedtaskdata_task_element_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT subcontractedtaskdata_task_element_id_key UNIQUE (task_element_id);


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
-- Name: fkecc61140aef2ac0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT fkecc61140aef2ac0 FOREIGN KEY (task_element_id) REFERENCES task(task_element_id);


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


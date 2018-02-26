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
    generatecodeforresources boolean
);


ALTER TABLE public.configuration OWNER TO naval;

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
23742	5	t	707
23743	5	t	707
23744	5	t	707
23741	6	t	707
23752	5	t	707
23753	5	t	707
23754	5	t	707
23751	6	t	707
40303	3	t	708
40304	3	f	708
40300	4	t	707
91225	2	t	707
91226	2	t	707
91227	2	t	707
91228	2	t	707
52221	3	t	707
52223	2	f	710
52224	1	t	710
52225	1	f	710
52226	1	f	710
52222	3	t	710
18808	10	t	708
1719	16	f	707
18605	11	t	709
18606	11	t	709
18607	11	t	709
1720	16	t	707
18608	11	f	709
18809	10	t	708
1721	16	f	707
18609	11	f	709
1722	16	t	707
18810	10	f	708
62662	2	t	62519
62663	2	f	62519
62664	2	f	62519
23747	7	t	707
23748	7	t	707
62665	2	t	707
62668	3	t	710
23749	7	t	707
62667	2	f	710
62666	3	t	710
62669	3	f	710
23746	8	t	707
62670	3	f	710
52218	3	f	52116
52217	3	f	708
23737	7	t	707
23738	7	t	707
23739	7	t	707
52220	3	f	708
52219	3	f	52116
23736	8	t	707
91256	2	f	62520
91257	2	f	62520
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
60413	1	708	60233	t	100.00
60414	1	709	60237	t	5.00
60415	1	709	60238	t	10.00
60416	1	709	60239	t	15.00
60417	1	708	60240	t	100.00
90401	1	52116	90202	f	2000.00
90402	1	708	90202	f	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
46562	3	2010-03-22	20.00	40303	\N
46564	2	2010-05-01	60.00	40303	\N
52323	1	2010-03-17	20.00	52224	\N
52322	3	2010-03-17	20.00	52222	2010-03-17 19:23:22.982
18754	10	2010-03-15	25.00	18808	\N
18700	11	2010-03-30	2.00	18605	\N
18701	11	2010-03-02	1.00	18605	\N
18702	11	2010-04-02	3.00	18606	\N
18703	11	2010-03-31	5.00	18607	\N
18755	10	2010-03-16	5.00	18809	\N
62749	2	2010-04-18	100.00	62662	\N
62750	2	2010-03-18	40.00	62662	\N
62751	3	2010-04-18	20.00	62666	2010-03-18 18:54:55.499
62752	3	2010-04-18	20.00	62668	\N
52320	3	2010-04-01	30.00	52218	\N
52321	3	2010-03-17	5.00	52218	\N
52318	3	2010-04-17	50.00	52217	\N
52319	3	2010-03-01	5.00	52217	\N
62757	2	2010-03-17	25.00	91256	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
707	4	children	100.0000	f	0.0100	t	t	f
708	3	percentage	100.0000	f	0.0100	t	t	f
709	2	units	2147483647.0000	f	1.0000	t	f	f
710	1	subcontractor	100.0000	f	0.0100	t	t	f
52116	1	metros	1000.0000	t	0.1000	t	f	f
52117	1	QF: Chequeo de calidad	100.0000	f	0.0100	t	t	t
62519	1	metros de cableado electrico	200.0000	t	1.0000	t	f	f
62520	1	QF: Formulario Tipo A Validacion de Tubos	100.0000	f	0.0100	t	t	t
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
20242	542
20242	509
20243	509
20243	542
20246	509
20246	542
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
20291	541
20291	511
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
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
87063	3
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
1	1	Default
3	3	Galicia
2	4	España
4	3	Galicia media xornada
8	1	Andalucía media xornada
7	2	Andalucia
10	1	Asturias
23	4	\N
19	1	\N
20	1	\N
11	2	\N
12	2	\N
13	2	\N
14	2	\N
15	2	\N
16	2	\N
17	2	\N
18	2	\N
28	4	\N
27	1	\N
25	6	\N
19594	4	\N
19595	3	\N
29	5	\N
19596	3	\N
26	7	\N
30	5	\N
31	6	\N
19597	4	\N
24	9	\N
2828	8	\N
21	20	\N
22	21	\N
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
1426	4	2010-03-01	\N	23	0
1431	4	2010-03-22	\N	28	0
1430	1	2010-03-01	\N	27	0
1428	6	2010-03-08	\N	25	0
19796	4	2010-03-01	\N	19594	0
19797	3	2010-03-01	\N	19595	0
1432	5	2010-03-29	2011-09-29	29	0
19798	3	2010-03-01	\N	19596	0
1429	7	2010-03-15	2011-09-09	26	0
1433	5	2010-03-22	\N	30	0
1434	6	2010-03-29	2011-09-29	31	0
19799	4	2010-03-01	\N	19597	0
1427	9	2010-03-29	2011-09-29	24	0
3030	8	2010-03-01	\N	2828	0
1424	20	2010-03-08	\N	21	0
1425	21	2010-03-15	2011-09-15	22	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
117	2	1	\N	17	0
101	1	\N	\N	1	0
118	2	1	\N	18	0
125	6	10	\N	25	0
103	3	2	\N	3	0
102	4	\N	\N	2	0
104	3	2	\N	4	0
108	1	2	\N	8	0
107	2	2	\N	7	0
110	1	2	\N	10	0
127	1	4	\N	27	0
119	1	1	\N	19	0
120	1	1	\N	20	0
111	2	1	\N	11	0
112	2	1	\N	12	0
113	2	1	\N	13	0
114	2	1	\N	14	0
115	2	1	\N	15	0
116	2	1	\N	16	0
123	4	7	\N	23	0
128	4	4	\N	28	0
19695	4	7	\N	19594	0
19696	3	10	\N	19595	0
129	5	7	\N	29	0
19697	3	4	\N	19596	0
126	7	3	\N	26	0
130	5	8	\N	30	0
131	6	10	\N	31	0
19698	4	8	\N	19597	0
124	9	8	\N	24	0
2929	8	3	\N	2828	0
121	20	3	\N	21	0
122	21	4	2010-03-08	22	0
19699	16	4	\N	22	1
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1035	1	2010-12-31	4	611	10
1036	1	2010-12-24	4	611	10
1037	1	2010-09-08	0	610	10
1012	2	2010-05-17	0	610	3
1016	1	2010-12-24	4	610	3
1017	1	2010-12-31	4	610	3
1015	3	2010-12-31	0	610	2
1018	1	2010-12-24	0	610	2
1078	2	2010-07-10	0	606	28
1079	2	2010-07-08	0	606	28
1013	2	2010-05-17	0	610	4
1019	1	2010-12-24	4	610	4
1020	1	2010-12-31	4	610	4
1076	2	2010-07-11	0	606	28
1074	2	2010-07-05	0	606	28
1028	1	2010-12-24	4	611	8
1029	1	2010-05-03	0	610	8
1030	1	2010-12-31	4	611	8
1027	2	2010-12-24	4	611	7
1026	2	2010-12-31	4	611	7
1031	1	2010-05-03	0	610	7
1075	2	2010-07-06	0	606	28
1073	2	2010-07-07	0	606	28
1077	2	2010-07-09	0	606	28
1059	4	2010-06-26	0	606	25
1064	4	2010-06-21	0	606	25
1065	4	2010-06-22	0	606	25
1060	4	2010-06-23	0	606	25
1061	4	2010-06-24	0	606	25
1063	4	2010-06-27	0	606	25
1062	4	2010-06-25	0	606	25
1058	2	2010-06-07	0	606	23
1057	2	2010-06-08	0	606	23
1055	2	2010-06-13	0	606	23
1054	2	2010-06-10	0	606	23
1053	2	2010-06-09	0	606	23
1056	2	2010-06-12	0	606	23
1052	2	2010-06-11	0	606	23
1100	4	2010-07-28	0	606	31
1080	3	2010-07-14	0	606	29
1083	3	2010-07-12	0	606	29
1082	3	2010-07-18	0	606	29
1085	3	2010-07-15	0	606	29
1086	3	2010-07-17	0	606	29
1081	3	2010-07-13	0	606	29
1084	3	2010-07-16	0	606	29
1069	5	2010-06-30	0	606	26
1066	5	2010-07-04	0	606	26
1068	5	2010-06-29	0	606	26
1072	5	2010-07-01	0	606	26
1071	5	2010-07-03	0	606	26
1070	5	2010-06-28	0	606	26
1067	5	2010-07-02	0	606	26
1092	3	2010-07-21	0	606	30
1093	3	2010-07-19	0	606	30
1087	3	2010-07-23	0	606	30
1088	3	2010-07-22	0	606	30
1090	3	2010-07-24	0	606	30
1091	3	2010-07-20	0	606	30
1089	3	2010-07-25	0	606	30
1099	4	2010-07-29	0	606	31
1098	4	2010-07-31	0	606	31
1095	4	2010-08-01	0	606	31
1097	4	2010-07-27	0	606	31
1094	4	2010-07-26	0	606	31
1096	4	2010-07-30	0	606	31
1045	19	2010-05-07	0	606	22
1047	19	2010-05-06	0	606	22
1051	19	2010-05-09	0	606	22
1050	19	2010-05-03	0	606	22
1046	19	2010-05-04	0	606	22
1049	19	2010-05-05	0	606	22
1048	19	2010-05-08	0	606	22
1043	17	2010-04-11	0	606	21
1038	17	2010-04-08	0	606	21
1039	17	2010-04-06	0	606	21
1041	17	2010-04-07	0	606	21
1044	17	2010-04-05	0	606	21
1042	17	2010-04-10	0	606	21
1040	17	2010-04-09	0	606	21
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

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources) FROM stdin;
202	3	1	111A	\N	\N	\N	\N
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled, code) FROM stdin;
59792	2	Oficial de Primera	t	db8fabf6-b51a-485f-b8fb-b8339ee15fb9
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
509	1	321d79f1-ffb3-4a88-aeb6-4ae4959354bd	Carpinteiro	t	131078	\N
510	1	9321f46a-6901-448f-8997-ccd3e204d160	Soldador Submarino	t	131078	\N
511	1	99887ae2-8bb7-4275-a427-d920c361fc4d	Califugador	t	131078	\N
512	1	5ef81e42-223e-4f01-99c5-500849e55024	Electricista	t	131078	\N
513	1	8669109d-8d86-4ac1-89cd-9541f7fc4d53	Soldador	t	131078	\N
514	1	d1933e2d-2aa9-4ba2-8911-f7dabb0b5995	Pintor	t	131078	\N
515	1	c12c9ade-1a33-4256-988d-36123a06e63d	España	t	131079	\N
541	1	8a6f0c8c-85e9-441f-a8e9-7775411042b5	Grupo 2	t	131083	\N
542	1	2ae840f0-0292-4d12-a774-76cf31298872	Grupo 1	t	131083	\N
533	1	b22867b4-d952-4b3d-9451-fbd24b041a87	Certificado medico 2010	t	131082	\N
534	1	0583346a-ee5b-48d6-9a19-54791d0ce077	Certificado medico 2009	t	131082	\N
535	1	63f30986-f717-42fe-96aa-5d690a97f628	Pase entrada astillero Barreras	t	131082	\N
536	1	280e7e3f-bdc8-4611-84a6-7f626351f3e7	Pase entrada astillero Navalia	t	131082	\N
537	1	234cd3e9-61c2-4689-afb7-13b80ac3f539	Pase entrada astillero Vulcano	t	131082	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
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
2302	DIRECT	14	\N	1619	\N	542	\N	\N
2303	INDIRECT	14	\N	1620	\N	542	2302	t
2304	INDIRECT	14	1919	\N	\N	542	2302	t
2305	INDIRECT	14	\N	1621	\N	542	2302	t
2306	INDIRECT	14	1920	\N	\N	542	2302	t
2307	DIRECT	14	\N	1622	\N	542	\N	\N
2423	DIRECT	13	\N	1623	\N	513	\N	\N
2308	INDIRECT	14	\N	1623	\N	542	2307	t
2309	INDIRECT	14	1921	\N	\N	542	2307	t
2424	INDIRECT	13	1921	\N	\N	513	2423	t
2310	INDIRECT	14	\N	1624	\N	542	2307	t
2425	DIRECT	13	\N	1624	\N	513	\N	\N
2311	INDIRECT	14	1922	\N	\N	542	2307	t
2426	INDIRECT	13	1922	\N	\N	513	2425	t
2312	INDIRECT	14	\N	1625	\N	542	2307	t
2427	DIRECT	13	\N	1625	\N	513	\N	\N
2313	INDIRECT	14	1923	\N	\N	542	2307	t
2428	INDIRECT	13	1923	\N	\N	513	2427	t
2314	DIRECT	14	\N	1626	\N	542	\N	\N
2429	DIRECT	13	\N	1627	\N	509	\N	\N
2315	INDIRECT	14	\N	1627	\N	542	2314	t
2430	INDIRECT	13	1924	\N	\N	509	2429	t
2316	INDIRECT	14	1924	\N	\N	542	2314	t
2431	DIRECT	13	\N	1628	\N	509	\N	\N
2317	INDIRECT	14	\N	1628	\N	542	2314	t
2318	INDIRECT	14	1925	\N	\N	542	2314	t
2432	INDIRECT	13	1925	\N	\N	509	2431	t
2319	INDIRECT	14	\N	1629	\N	542	2314	t
2433	DIRECT	13	\N	1629	\N	509	\N	\N
2434	INDIRECT	13	1926	\N	\N	509	2433	t
27944	DIRECT	2	\N	23657	\N	509	\N	\N
27945	INDIRECT	2	23950	\N	\N	509	27944	t
27946	DIRECT	2	\N	23658	\N	509	\N	\N
27947	INDIRECT	2	23951	\N	\N	509	27946	t
27948	DIRECT	2	\N	23659	\N	509	\N	\N
27949	INDIRECT	2	23952	\N	\N	509	27948	t
24108	DIRECT	6	\N	23636	\N	541	\N	\N
36891	DIRECT	3	\N	23675	\N	539	\N	\N
24109	INDIRECT	6	\N	23637	\N	541	24108	t
36892	INDIRECT	3	\N	23676	\N	539	36891	t
24110	INDIRECT	6	23937	\N	\N	541	24108	t
24111	INDIRECT	6	\N	23638	\N	541	24108	t
36893	INDIRECT	3	23961	\N	\N	539	36891	t
24112	INDIRECT	6	23938	\N	\N	541	24108	t
36894	INDIRECT	3	\N	23677	\N	539	36891	t
24113	DIRECT	6	\N	23639	\N	541	\N	\N
24114	INDIRECT	6	\N	23640	\N	541	24113	t
36895	INDIRECT	3	23962	\N	\N	539	36891	t
36896	DIRECT	3	\N	23678	\N	539	\N	\N
24301	DIRECT	5	\N	23640	\N	514	\N	\N
24115	INDIRECT	6	23939	\N	\N	541	24113	t
24302	INDIRECT	5	23939	\N	\N	514	24301	t
24116	INDIRECT	6	\N	23641	\N	541	24113	t
36897	INDIRECT	3	\N	23679	\N	539	36896	t
36898	INDIRECT	3	23963	\N	\N	539	36896	t
36899	INDIRECT	3	\N	23680	\N	539	36896	t
24303	DIRECT	5	\N	23641	\N	514	\N	\N
24304	INDIRECT	5	23940	\N	\N	514	24303	t
24117	INDIRECT	6	23940	\N	\N	541	24113	t
24305	DIRECT	5	\N	23642	\N	514	\N	\N
24118	INDIRECT	6	\N	23642	\N	541	24113	t
24306	INDIRECT	5	23941	\N	\N	514	24305	t
24119	INDIRECT	6	23941	\N	\N	541	24113	t
24120	DIRECT	6	\N	23643	\N	541	\N	\N
24307	DIRECT	5	\N	23644	\N	511	\N	\N
24121	INDIRECT	6	\N	23644	\N	541	24120	t
24308	INDIRECT	5	23942	\N	\N	511	24307	t
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
60390	DIRECT	1	\N	\N	60233	542	\N	\N
60391	INDIRECT	1	\N	\N	60234	542	60390	t
60392	INDIRECT	1	59413	\N	\N	542	60390	t
60393	INDIRECT	1	\N	\N	60235	542	60390	t
60394	INDIRECT	1	59414	\N	\N	542	60390	t
60395	DIRECT	1	\N	\N	60236	542	\N	\N
60396	DIRECT	1	\N	\N	60237	513	\N	\N
60397	INDIRECT	1	\N	\N	60237	542	60395	t
60499	INDIRECT	1	59415	\N	\N	542	60395	t
60500	INDIRECT	1	59415	\N	\N	513	60396	t
60501	INDIRECT	1	\N	\N	60238	542	60395	t
60502	DIRECT	1	\N	\N	60238	513	\N	\N
60503	INDIRECT	1	59416	\N	\N	513	60502	t
60504	INDIRECT	1	59416	\N	\N	542	60395	t
60505	INDIRECT	1	\N	\N	60239	542	60395	t
60506	DIRECT	1	\N	\N	60239	513	\N	\N
60507	INDIRECT	1	59417	\N	\N	513	60506	t
60508	INDIRECT	1	59417	\N	\N	542	60395	t
60509	DIRECT	1	\N	\N	60240	542	\N	\N
60510	DIRECT	1	\N	\N	60241	509	\N	\N
60511	INDIRECT	1	\N	\N	60241	542	60509	t
60512	INDIRECT	1	59418	\N	\N	542	60509	t
60513	INDIRECT	1	59418	\N	\N	509	60510	t
60514	INDIRECT	1	\N	\N	60242	542	60509	t
60515	DIRECT	1	\N	\N	60242	509	\N	\N
60516	INDIRECT	1	59419	\N	\N	542	60509	t
60517	INDIRECT	1	59419	\N	\N	509	60515	t
60518	DIRECT	1	\N	\N	60243	509	\N	\N
60519	INDIRECT	1	\N	\N	60243	542	60509	t
60520	INDIRECT	1	59420	\N	\N	542	60509	t
60521	INDIRECT	1	59420	\N	\N	509	60518	t
2320	INDIRECT	14	1926	\N	\N	542	2314	t
90309	DIRECT	1	\N	\N	90202	541	\N	\N
90310	INDIRECT	1	\N	\N	90203	541	90309	t
90311	INDIRECT	1	89796	\N	\N	541	90309	t
90312	INDIRECT	1	\N	\N	90204	541	90309	t
90313	INDIRECT	1	89797	\N	\N	541	90309	t
24122	INDIRECT	6	23942	\N	\N	541	24120	t
24123	INDIRECT	6	\N	23645	\N	541	24120	t
24309	DIRECT	5	\N	23645	\N	511	\N	\N
24124	INDIRECT	6	23943	\N	\N	541	24120	t
24310	INDIRECT	5	23943	\N	\N	511	24309	t
24125	INDIRECT	6	\N	23646	\N	541	24120	t
24311	DIRECT	5	\N	23646	\N	511	\N	\N
24312	INDIRECT	5	23944	\N	\N	511	24311	t
24126	INDIRECT	6	23944	\N	\N	541	24120	t
90508	DIRECT	1	\N	\N	90242	540	\N	\N
90509	INDIRECT	1	\N	\N	90243	540	90508	t
90510	INDIRECT	1	89822	\N	\N	540	90508	t
90511	INDIRECT	1	\N	\N	90244	540	90508	t
90512	INDIRECT	1	89823	\N	\N	540	90508	t
90513	DIRECT	1	\N	\N	90245	540	\N	\N
90514	INDIRECT	1	\N	\N	90246	540	90513	t
90515	DIRECT	1	\N	\N	90246	514	\N	\N
90516	INDIRECT	1	89824	\N	\N	540	90513	t
90517	INDIRECT	1	89824	\N	\N	514	90515	t
90518	DIRECT	1	\N	\N	90247	514	\N	\N
90519	INDIRECT	1	\N	\N	90247	540	90513	t
90520	INDIRECT	1	89825	\N	\N	540	90513	t
90521	INDIRECT	1	89825	\N	\N	514	90518	t
90522	DIRECT	1	\N	\N	90248	514	\N	\N
90523	INDIRECT	1	\N	\N	90248	540	90513	t
90524	INDIRECT	1	89826	\N	\N	540	90513	t
90525	INDIRECT	1	89826	\N	\N	514	90522	t
90526	DIRECT	1	\N	\N	90249	540	\N	\N
90527	DIRECT	1	\N	\N	90250	509	\N	\N
90528	INDIRECT	1	\N	\N	90250	540	90526	t
90529	INDIRECT	1	89827	\N	\N	540	90526	t
90530	INDIRECT	1	89827	\N	\N	509	90527	t
90531	INDIRECT	1	\N	\N	90251	540	90526	t
90532	DIRECT	1	\N	\N	90251	509	\N	\N
90533	INDIRECT	1	89828	\N	\N	509	90532	t
90534	INDIRECT	1	89828	\N	\N	540	90526	t
90535	DIRECT	1	\N	\N	90252	509	\N	\N
90536	INDIRECT	1	\N	\N	90252	540	90526	t
90537	INDIRECT	1	89829	\N	\N	509	90535	t
90538	INDIRECT	1	89829	\N	\N	540	90526	t
91400	DIRECT	2	\N	91422	\N	540	\N	\N
91401	INDIRECT	2	\N	91423	\N	540	91400	t
91402	INDIRECT	2	90883	\N	\N	540	91400	t
91403	INDIRECT	2	\N	91424	\N	540	91400	t
91404	INDIRECT	2	90884	\N	\N	540	91400	t
91506	DIRECT	2	\N	91425	\N	540	\N	\N
91507	INDIRECT	2	\N	91426	\N	540	91506	t
91508	DIRECT	2	\N	91426	\N	514	\N	\N
91509	INDIRECT	2	90885	\N	\N	540	91506	t
91510	INDIRECT	2	90885	\N	\N	514	91508	t
91511	INDIRECT	2	\N	91427	\N	540	91506	t
91512	DIRECT	2	\N	91427	\N	514	\N	\N
91513	INDIRECT	2	90886	\N	\N	514	91512	t
91514	INDIRECT	2	90886	\N	\N	540	91506	t
91515	INDIRECT	2	\N	91428	\N	540	91506	t
91516	DIRECT	2	\N	91428	\N	514	\N	\N
91517	INDIRECT	2	90887	\N	\N	514	91516	t
91518	INDIRECT	2	90887	\N	\N	540	91506	t
91519	DIRECT	2	\N	91429	\N	540	\N	\N
91520	INDIRECT	2	\N	91430	\N	540	91519	t
91521	DIRECT	2	\N	91430	\N	509	\N	\N
91522	INDIRECT	2	90888	\N	\N	509	91521	t
91523	INDIRECT	2	90888	\N	\N	540	91519	t
91524	DIRECT	2	\N	91431	\N	509	\N	\N
91525	INDIRECT	2	\N	91431	\N	540	91519	t
91526	INDIRECT	2	90889	\N	\N	509	91524	t
91527	INDIRECT	2	90889	\N	\N	540	91519	t
91528	INDIRECT	2	\N	91432	\N	540	91519	t
91529	DIRECT	2	\N	91432	\N	509	\N	\N
91530	INDIRECT	2	90890	\N	\N	540	91519	t
91531	INDIRECT	2	90890	\N	\N	509	91529	t
33948	DIRECT	5	\N	23662	\N	538	\N	\N
33949	INDIRECT	5	\N	23663	\N	538	33948	t
33950	INDIRECT	5	23953	\N	\N	538	33948	t
33951	INDIRECT	5	\N	23664	\N	538	33948	t
33952	INDIRECT	5	23954	\N	\N	538	33948	t
33953	DIRECT	5	\N	23665	\N	538	\N	\N
33954	INDIRECT	5	\N	23666	\N	538	33953	t
34091	DIRECT	4	\N	23666	\N	513	\N	\N
34092	INDIRECT	4	23955	\N	\N	513	34091	t
33955	INDIRECT	5	23955	\N	\N	538	33953	t
33956	INDIRECT	5	\N	23667	\N	538	33953	t
34093	DIRECT	4	\N	23667	\N	513	\N	\N
34094	INDIRECT	4	23956	\N	\N	513	34093	t
33957	INDIRECT	5	23956	\N	\N	538	33953	t
33958	INDIRECT	5	\N	23668	\N	538	33953	t
34095	DIRECT	4	\N	23668	\N	513	\N	\N
34096	INDIRECT	4	23957	\N	\N	513	34095	t
33959	INDIRECT	5	23957	\N	\N	538	33953	t
33960	DIRECT	5	\N	23669	\N	538	\N	\N
33961	INDIRECT	5	\N	23670	\N	538	33960	t
34097	DIRECT	4	\N	23670	\N	509	\N	\N
34098	INDIRECT	4	23958	\N	\N	509	34097	t
33962	INDIRECT	5	23958	\N	\N	538	33960	t
33963	INDIRECT	5	\N	23671	\N	538	33960	t
33964	INDIRECT	5	23959	\N	\N	538	33960	t
33965	INDIRECT	5	\N	23672	\N	538	33960	t
34099	DIRECT	4	\N	23672	\N	509	\N	\N
33966	INDIRECT	5	23960	\N	\N	538	33960	t
34100	INDIRECT	4	23960	\N	\N	509	34099	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
1519	1	3d1dbdeb-1fbc-4d45-b703-7c807be10327	2010-03-01 20:53:11.604	\N	f	514	1318
1520	1	cf997d10-1194-4060-bc0c-ea291cff6c73	2010-03-01 20:52:53.72	\N	f	541	1318
1527	1	099e4093-753c-4951-b36b-0f33facd28ac	2010-03-01 00:00:00	\N	f	513	1326
1528	1	2acffe07-9b00-4bea-80b6-71dc32334334	2010-03-01 21:22:20.06	\N	f	538	1326
1532	1	5d23e9f0-afd1-4613-817f-8f01e663e0dd	2010-03-01 22:36:47.756	\N	f	540	1322
1524	3	2d762b09-3ed4-4f28-adb2-a203b0c07353	2010-03-01 20:57:54.107	\N	t	512	1322
1525	2	4858a83e-1260-4afe-b46d-bda5e3ea29fd	2010-03-01 20:59:16.882	\N	t	510	1322
1533	1	0db2812f-d58a-4bbf-a89f-98a25741fbc4	2010-03-01 22:37:01.009	\N	f	509	1322
19897	1	df4796f7-4be6-49bf-8144-3ed291d910eb	2010-03-01 00:00:00	\N	f	541	19494
19898	1	ac0403bf-8d59-4305-99a4-a5658162a55e	2010-03-01 00:00:00	\N	f	540	19496
1530	2	2d581c81-0b35-40aa-bd73-110f338e3c31	2010-03-01 21:23:05.92	\N	f	509	1328
1529	2	e74e278e-55db-46c3-b97d-d499f08d061f	2010-03-01 21:22:57.304	\N	f	538	1328
19899	1	61222007-0330-484f-b7ae-24456d3ec46b	2010-03-01 00:00:00	\N	f	538	19498
1526	4	c3bff800-bb69-40d8-977a-126c4ac2df5e	2010-03-01 20:59:50.035	\N	t	512	1324
1534	3	9b31b2ae-a812-4b6e-b282-551d4144c75d	2010-03-01 00:00:00	\N	f	514	1324
19900	1	579ff199-438f-4bc2-8cd3-9e4773c7617e	2010-03-01 00:00:00	\N	f	540	1324
19901	1	ebd1970e-f0c6-42eb-9b0b-cd4b98fad5ff	2010-03-07 19:49:50.619	\N	f	514	1330
19902	1	6ca93ec4-6ae8-4857-9ef5-6f8aa11a7415	2010-03-07 19:49:15.944	\N	f	539	1330
1531	3	62c3e29b-a10b-4b25-8ce4-64f0deaa9f17	2010-03-01 21:24:44.421	\N	f	511	1332
19903	1	c433c844-21bb-477d-bf69-dc5fdcf28be0	2010-03-07 00:00:00	\N	f	539	1332
19904	1	c8bae97d-3915-4f73-aadd-5a18bcf795b0	2010-03-07 19:50:58.538	\N	f	539	19500
1517	18	c5a26834-165a-4a3b-9d5c-b7aadb225eb6	2010-03-01 20:52:20.246	\N	f	509	1316
1523	4	ed5617c1-ee60-4aaa-91d0-01bb170e23f4	2010-03-01 20:56:23.745	\N	f	541	1320
1521	6	d0c67f28-d9e2-4022-af62-6f3a6b1d3351	2010-02-28 00:00:00	\N	t	541	1320
1522	6	cca09834-192c-4c1d-b394-c586b87682d2	2010-03-01 20:54:37.921	\N	f	511	1320
3131	8	08368b54-72fd-4006-b028-4e23db681fde	2010-03-02 11:41:44.278	\N	f	542	2728
1515	16	033bd704-c76d-4f45-8c64-f729c8b663e1	2010-03-01 20:35:51.726	\N	f	513	1314
1516	16	6ab18f95-8b6a-4908-8bd1-ff1ac3d1f52b	2010-03-01 20:35:37.915	\N	f	542	1314
1518	18	ea42cb76-331e-4d6d-bcbb-33ad348ec4f0	2010-03-01 20:52:03.961	\N	f	542	1316
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
131081	1	f2a1c236-8bcc-416e-97aa-39c6429f9897	Contrato laboral	tipo de contrato	t	t	t	0
131082	1	781a074c-0755-45d0-987e-37061d5e77fb	Documentación	\N	t	f	t	0
131083	1	51d107fc-66a3-466a-9f61-b8c9edacf2c2	Grupo	Grupo de pertenza do traballador	f	f	t	1
131072	15	cc665415-4ba7-4c8e-ac75-d01cab17f073	LEAVE	Leave	f	f	t	1
131073	11	900f947e-4227-44a9-8f93-2412aa0528af	CATEGORY	Professional category	t	t	t	1
131074	9	0082936b-0115-4dca-87e2-b5e021d33e30	TRAINING	Training courses and labor training	t	t	t	1
131075	7	e990dc33-37c0-43ab-8e6e-3f4dbdafb6f0	JOB	Job	t	t	t	1
131076	5	a28da058-2ed6-4508-99ef-6ead99194953	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
131077	1	113a187d-cff8-48eb-9973-73ba721b9034	LOCATION_GROUP	Location where the resource work	t	f	t	0
131078	1	66f8f0e3-0e7f-4195-8bf6-9918235443f3	Tipo de traballo	Tipo de traballo	t	f	t	1
131079	1	b91be904-0c35-42b4-b7ad-4c6e097651ba	Localización	\N	f	t	t	1
131080	1	86093247-798f-4a9f-8b53-9d7ade8ef74c	Capacitacións de soldadura	Habilidades para soldar	f	f	t	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
31537	GENERIC_DAY	4	0	2010-03-21	1324	\N	30421	\N
31512	GENERIC_DAY	4	0	2010-04-03	1324	\N	30421	\N
31560	GENERIC_DAY	4	9	2010-03-22	1324	\N	30421	\N
31533	GENERIC_DAY	4	3	2010-05-13	1324	\N	30421	\N
31550	GENERIC_DAY	4	9	2010-03-31	1324	\N	30421	\N
31565	GENERIC_DAY	4	4	2010-03-19	1324	\N	30421	\N
31525	GENERIC_DAY	4	4	2010-03-26	1324	\N	30421	\N
31547	GENERIC_DAY	4	9	2010-05-04	1324	\N	30421	\N
31532	GENERIC_DAY	4	9	2010-04-28	1324	\N	30421	\N
31555	GENERIC_DAY	4	9	2010-04-08	1324	\N	30421	\N
31529	GENERIC_DAY	4	0	2010-04-24	1324	\N	30421	\N
31556	GENERIC_DAY	4	4	2010-04-16	1324	\N	30421	\N
31531	GENERIC_DAY	4	0	2010-04-11	1324	\N	30421	\N
31564	GENERIC_DAY	4	4	2010-05-07	1324	\N	30421	\N
31549	GENERIC_DAY	4	9	2010-04-21	1324	\N	30421	\N
31518	GENERIC_DAY	4	9	2010-04-19	1324	\N	30421	\N
31528	GENERIC_DAY	4	9	2010-05-03	1324	\N	30421	\N
31540	GENERIC_DAY	4	9	2010-03-25	1324	\N	30421	\N
31554	GENERIC_DAY	4	0	2010-04-25	1324	\N	30421	\N
31538	GENERIC_DAY	4	9	2010-03-16	1324	\N	30421	\N
31553	GENERIC_DAY	4	9	2010-05-05	1324	\N	30421	\N
31548	GENERIC_DAY	4	0	2010-04-18	1324	\N	30421	\N
31552	GENERIC_DAY	4	9	2010-03-17	1324	\N	30421	\N
31527	GENERIC_DAY	4	0	2010-05-09	1324	\N	30421	\N
31562	GENERIC_DAY	4	9	2010-05-06	1324	\N	30421	\N
31541	GENERIC_DAY	4	0	2010-03-20	1324	\N	30421	\N
31559	GENERIC_DAY	4	4	2010-04-02	1324	\N	30421	\N
31526	GENERIC_DAY	4	0	2010-04-17	1324	\N	30421	\N
31514	GENERIC_DAY	4	9	2010-04-06	1324	\N	30421	\N
31545	GENERIC_DAY	4	9	2010-03-18	1324	\N	30421	\N
31563	GENERIC_DAY	4	9	2010-04-15	1324	\N	30421	\N
31515	GENERIC_DAY	4	4	2010-04-09	1324	\N	30421	\N
31568	GENERIC_DAY	4	9	2010-03-29	1324	\N	30421	\N
31544	GENERIC_DAY	4	4	2010-04-23	1324	\N	30421	\N
31534	GENERIC_DAY	4	0	2010-05-02	1324	\N	30421	\N
31530	GENERIC_DAY	4	9	2010-05-12	1324	\N	30421	\N
31561	GENERIC_DAY	4	9	2010-04-26	1324	\N	30421	\N
31535	GENERIC_DAY	4	0	2010-05-08	1324	\N	30421	\N
31566	GENERIC_DAY	4	9	2010-04-05	1324	\N	30421	\N
31524	GENERIC_DAY	4	9	2010-04-20	1324	\N	30421	\N
31557	GENERIC_DAY	4	9	2010-04-13	1324	\N	30421	\N
31511	GENERIC_DAY	4	9	2010-04-14	1324	\N	30421	\N
31521	GENERIC_DAY	4	9	2010-03-23	1324	\N	30421	\N
31523	GENERIC_DAY	4	9	2010-04-01	1324	\N	30421	\N
31551	GENERIC_DAY	4	9	2010-04-27	1324	\N	30421	\N
31509	GENERIC_DAY	4	0	2010-04-10	1324	\N	30421	\N
31520	GENERIC_DAY	4	0	2010-04-04	1324	\N	30421	\N
31558	GENERIC_DAY	4	9	2010-05-10	1324	\N	30421	\N
89592	GENERIC_DAY	0	5	2010-08-23	1328	\N	36164	\N
89593	GENERIC_DAY	0	5	2010-08-02	1328	\N	36164	\N
89594	GENERIC_DAY	0	2	2010-08-20	1328	\N	36164	\N
89595	GENERIC_DAY	0	5	2010-08-03	1328	\N	36164	\N
89596	GENERIC_DAY	0	0	2010-07-24	1328	\N	36164	\N
89597	GENERIC_DAY	0	5	2010-08-26	1328	\N	36164	\N
31517	GENERIC_DAY	4	9	2010-05-11	1324	\N	30421	\N
31536	GENERIC_DAY	4	0	2010-03-27	1324	\N	30421	\N
33730	GENERIC_DAY	1	0	2010-05-16	1324	\N	30422	\N
33731	GENERIC_DAY	1	0	2010-05-15	1324	\N	30422	\N
33732	GENERIC_DAY	1	9	2010-06-21	1324	\N	30422	\N
33733	GENERIC_DAY	1	0	2010-06-06	1324	\N	30422	\N
33734	GENERIC_DAY	1	9	2010-06-14	1324	\N	30422	\N
33735	GENERIC_DAY	1	0	2010-06-19	1324	\N	30422	\N
33736	GENERIC_DAY	1	9	2010-05-25	1324	\N	30422	\N
33737	GENERIC_DAY	1	4	2010-05-14	1324	\N	30422	\N
33738	GENERIC_DAY	1	4	2010-06-18	1324	\N	30422	\N
33739	GENERIC_DAY	1	9	2010-06-24	1324	\N	30422	\N
33740	GENERIC_DAY	1	9	2010-05-18	1324	\N	30422	\N
33741	GENERIC_DAY	1	4	2010-05-21	1324	\N	30422	\N
33742	GENERIC_DAY	1	9	2010-06-15	1324	\N	30422	\N
33743	GENERIC_DAY	1	4	2010-06-25	1324	\N	30422	\N
33744	GENERIC_DAY	1	9	2010-05-31	1324	\N	30422	\N
33745	GENERIC_DAY	1	9	2010-05-26	1324	\N	30422	\N
33746	GENERIC_DAY	1	9	2010-05-24	1324	\N	30422	\N
33747	GENERIC_DAY	1	9	2010-06-01	1324	\N	30422	\N
33748	GENERIC_DAY	1	9	2010-05-20	1324	\N	30422	\N
33749	GENERIC_DAY	1	6	2010-07-06	1324	\N	30422	\N
33157	GENERIC_DAY	3	7	2010-09-02	1322	\N	30466	\N
33156	GENERIC_DAY	3	3	2010-08-20	1322	\N	30466	\N
33145	GENERIC_DAY	3	2	2010-09-10	1322	\N	30466	\N
33124	GENERIC_DAY	3	7	2010-09-15	1322	\N	30466	\N
33131	GENERIC_DAY	3	7	2010-10-04	1322	\N	30466	\N
33152	GENERIC_DAY	3	7	2010-09-20	1322	\N	30466	\N
33122	GENERIC_DAY	3	8	2010-08-11	1322	\N	30466	\N
33128	GENERIC_DAY	3	8	2010-08-19	1322	\N	30466	\N
33136	GENERIC_DAY	3	7	2010-08-24	1322	\N	30466	\N
33140	GENERIC_DAY	3	8	2010-08-23	1322	\N	30466	\N
33143	GENERIC_DAY	3	2	2010-10-01	1322	\N	30466	\N
33750	GENERIC_DAY	1	9	2010-06-10	1324	\N	30422	\N
33751	GENERIC_DAY	1	0	2010-05-30	1324	\N	30422	\N
33752	GENERIC_DAY	1	9	2010-06-23	1324	\N	30422	\N
33753	GENERIC_DAY	1	0	2010-06-20	1324	\N	30422	\N
33754	GENERIC_DAY	1	9	2010-06-08	1324	\N	30422	\N
33755	GENERIC_DAY	1	0	2010-06-27	1324	\N	30422	\N
33756	GENERIC_DAY	1	9	2010-06-02	1324	\N	30422	\N
33757	GENERIC_DAY	1	9	2010-06-17	1324	\N	30422	\N
33758	GENERIC_DAY	1	4	2010-06-11	1324	\N	30422	\N
33759	GENERIC_DAY	1	9	2010-06-22	1324	\N	30422	\N
33760	GENERIC_DAY	1	9	2010-07-05	1324	\N	30422	\N
33761	GENERIC_DAY	1	9	2010-05-27	1324	\N	30422	\N
33762	GENERIC_DAY	1	0	2010-06-26	1324	\N	30422	\N
33763	GENERIC_DAY	1	0	2010-06-13	1324	\N	30422	\N
33764	GENERIC_DAY	1	4	2010-06-04	1324	\N	30422	\N
33765	GENERIC_DAY	1	0	2010-06-05	1324	\N	30422	\N
33766	GENERIC_DAY	1	0	2010-06-12	1324	\N	30422	\N
33767	GENERIC_DAY	1	9	2010-06-07	1324	\N	30422	\N
33768	GENERIC_DAY	1	0	2010-05-22	1324	\N	30422	\N
33769	GENERIC_DAY	1	0	2010-05-29	1324	\N	30422	\N
33770	GENERIC_DAY	1	4	2010-05-28	1324	\N	30422	\N
33771	GENERIC_DAY	1	0	2010-05-23	1324	\N	30422	\N
33772	GENERIC_DAY	1	9	2010-05-19	1324	\N	30422	\N
33773	GENERIC_DAY	1	9	2010-06-09	1324	\N	30422	\N
33774	GENERIC_DAY	1	9	2010-06-16	1324	\N	30422	\N
33775	GENERIC_DAY	1	9	2010-06-03	1324	\N	30422	\N
33776	GENERIC_DAY	1	9	2010-07-13	1324	\N	30423	\N
33777	GENERIC_DAY	1	0	2010-08-08	1324	\N	30423	\N
33778	GENERIC_DAY	1	4	2010-07-09	1324	\N	30423	\N
33779	GENERIC_DAY	1	9	2010-08-05	1324	\N	30423	\N
33780	GENERIC_DAY	1	9	2010-07-21	1324	\N	30423	\N
33781	GENERIC_DAY	1	0	2010-07-10	1324	\N	30423	\N
33782	GENERIC_DAY	1	0	2010-07-18	1324	\N	30423	\N
33783	GENERIC_DAY	1	9	2010-07-28	1324	\N	30423	\N
33784	GENERIC_DAY	1	9	2010-07-22	1324	\N	30423	\N
33785	GENERIC_DAY	1	0	2010-07-11	1324	\N	30423	\N
33786	GENERIC_DAY	1	4	2010-07-30	1324	\N	30423	\N
33787	GENERIC_DAY	1	9	2010-07-20	1324	\N	30423	\N
33788	GENERIC_DAY	1	9	2010-07-15	1324	\N	30423	\N
33789	GENERIC_DAY	1	4	2010-07-16	1324	\N	30423	\N
33790	GENERIC_DAY	1	4	2010-08-06	1324	\N	30423	\N
33791	GENERIC_DAY	1	0	2010-07-31	1324	\N	30423	\N
33792	GENERIC_DAY	1	9	2010-07-08	1324	\N	30423	\N
33793	GENERIC_DAY	1	9	2010-08-09	1324	\N	30423	\N
33794	GENERIC_DAY	1	9	2010-07-26	1324	\N	30423	\N
33795	GENERIC_DAY	1	0	2010-07-17	1324	\N	30423	\N
33796	GENERIC_DAY	1	9	2010-07-27	1324	\N	30423	\N
33797	GENERIC_DAY	1	9	2010-08-10	1324	\N	30423	\N
33798	GENERIC_DAY	1	9	2010-07-12	1324	\N	30423	\N
33799	GENERIC_DAY	1	0	2010-07-24	1324	\N	30423	\N
33800	GENERIC_DAY	1	9	2010-07-07	1324	\N	30423	\N
33801	GENERIC_DAY	1	9	2010-08-02	1324	\N	30423	\N
33802	GENERIC_DAY	1	4	2010-07-23	1324	\N	30423	\N
33803	GENERIC_DAY	1	0	2010-07-25	1324	\N	30423	\N
33804	GENERIC_DAY	1	9	2010-08-03	1324	\N	30423	\N
33805	GENERIC_DAY	1	9	2010-07-29	1324	\N	30423	\N
33806	GENERIC_DAY	1	0	2010-08-01	1324	\N	30423	\N
33807	GENERIC_DAY	1	9	2010-07-19	1324	\N	30423	\N
33808	GENERIC_DAY	1	9	2010-08-04	1324	\N	30423	\N
33809	GENERIC_DAY	1	0	2010-08-07	1324	\N	30423	\N
33810	GENERIC_DAY	1	9	2010-07-14	1324	\N	30423	\N
24438	SPECIFIC_DAY	6	9	2010-03-10	19494	20247	\N	\N
24436	SPECIFIC_DAY	6	9	2010-03-11	19494	20247	\N	\N
24419	SPECIFIC_DAY	6	0	2010-03-28	19494	20247	\N	\N
33188	GENERIC_DAY	3	0	2010-08-14	1322	\N	30467	\N
33180	GENERIC_DAY	3	5	2010-08-19	1322	\N	30467	\N
33173	GENERIC_DAY	3	5	2010-08-18	1322	\N	30467	\N
33182	GENERIC_DAY	3	5	2010-08-16	1322	\N	30467	\N
33187	GENERIC_DAY	3	5	2010-08-26	1322	\N	30467	\N
33169	GENERIC_DAY	3	5	2010-08-12	1322	\N	30467	\N
33176	GENERIC_DAY	3	5	2010-08-25	1322	\N	30467	\N
33177	GENERIC_DAY	3	5	2010-08-31	1322	\N	30467	\N
33178	GENERIC_DAY	3	0	2010-08-15	1322	\N	30467	\N
33171	GENERIC_DAY	3	0	2010-08-29	1322	\N	30467	\N
33181	GENERIC_DAY	3	5	2010-08-17	1322	\N	30467	\N
33175	GENERIC_DAY	3	0	2010-08-22	1322	\N	30467	\N
33186	GENERIC_DAY	3	5	2010-08-30	1322	\N	30467	\N
24430	SPECIFIC_DAY	6	0	2010-04-03	19494	20247	\N	\N
24446	SPECIFIC_DAY	6	0	2010-03-14	19494	20247	\N	\N
24437	SPECIFIC_DAY	6	0	2010-04-04	19494	20247	\N	\N
24447	SPECIFIC_DAY	6	9	2010-03-16	19494	20247	\N	\N
24428	SPECIFIC_DAY	6	9	2010-03-17	19494	20247	\N	\N
24441	SPECIFIC_DAY	6	9	2010-03-22	19494	20247	\N	\N
24427	SPECIFIC_DAY	6	9	2010-04-08	19494	20247	\N	\N
24433	SPECIFIC_DAY	6	4	2010-04-09	19494	20247	\N	\N
24440	SPECIFIC_DAY	6	9	2010-04-05	19494	20247	\N	\N
24443	SPECIFIC_DAY	6	9	2010-04-06	19494	20247	\N	\N
24426	SPECIFIC_DAY	6	4	2010-03-26	19494	20247	\N	\N
24431	SPECIFIC_DAY	6	9	2010-03-23	19494	20247	\N	\N
24429	SPECIFIC_DAY	6	9	2010-03-08	19494	20247	\N	\N
24425	SPECIFIC_DAY	6	4	2010-04-02	19494	20247	\N	\N
24432	SPECIFIC_DAY	6	9	2010-04-01	19494	20247	\N	\N
24448	SPECIFIC_DAY	6	9	2010-03-15	19494	20247	\N	\N
24424	SPECIFIC_DAY	6	9	2010-03-18	19494	20247	\N	\N
24450	SPECIFIC_DAY	6	9	2010-04-07	19494	20247	\N	\N
24434	SPECIFIC_DAY	6	9	2010-03-29	19494	20247	\N	\N
24445	SPECIFIC_DAY	6	9	2010-03-09	19494	20247	\N	\N
24449	SPECIFIC_DAY	6	0	2010-03-13	19494	20247	\N	\N
24439	SPECIFIC_DAY	6	0	2010-03-20	19494	20247	\N	\N
24442	SPECIFIC_DAY	6	9	2010-03-30	19494	20247	\N	\N
24451	SPECIFIC_DAY	6	4	2010-03-12	19494	20247	\N	\N
24422	SPECIFIC_DAY	6	9	2010-03-25	19494	20247	\N	\N
24444	SPECIFIC_DAY	6	9	2010-03-31	19494	20247	\N	\N
24421	SPECIFIC_DAY	6	9	2010-03-24	19494	20247	\N	\N
24420	SPECIFIC_DAY	6	0	2010-03-21	19494	20247	\N	\N
24435	SPECIFIC_DAY	6	4	2010-03-19	19494	20247	\N	\N
24423	SPECIFIC_DAY	6	0	2010-03-27	19494	20247	\N	\N
25775	GENERIC_DAY	5	9	2010-03-17	1318	\N	20274	\N
25765	GENERIC_DAY	5	9	2010-03-29	1318	\N	20274	\N
25750	GENERIC_DAY	5	0	2010-04-11	1318	\N	20274	\N
25754	GENERIC_DAY	5	0	2010-03-28	1318	\N	20274	\N
25759	GENERIC_DAY	5	0	2010-04-25	1318	\N	20274	\N
25766	GENERIC_DAY	5	9	2010-04-29	1318	\N	20274	\N
25774	GENERIC_DAY	5	9	2010-05-06	1318	\N	20274	\N
25767	GENERIC_DAY	5	9	2010-03-23	1318	\N	20274	\N
25762	GENERIC_DAY	5	4	2010-04-02	1318	\N	20274	\N
25761	GENERIC_DAY	5	0	2010-03-14	1318	\N	20274	\N
25772	GENERIC_DAY	5	0	2010-04-17	1318	\N	20274	\N
25768	GENERIC_DAY	5	9	2010-03-24	1318	\N	20274	\N
25760	GENERIC_DAY	5	0	2010-04-04	1318	\N	20274	\N
25776	GENERIC_DAY	5	0	2010-05-01	1318	\N	20274	\N
25753	GENERIC_DAY	5	9	2010-04-12	1318	\N	20274	\N
25769	GENERIC_DAY	5	0	2010-03-13	1318	\N	20274	\N
25757	GENERIC_DAY	5	4	2010-03-19	1318	\N	20274	\N
25771	GENERIC_DAY	5	9	2010-03-31	1318	\N	20274	\N
25755	GENERIC_DAY	5	0	2010-04-18	1318	\N	20274	\N
25756	GENERIC_DAY	5	9	2010-03-11	1318	\N	20274	\N
25763	GENERIC_DAY	5	0	2010-05-02	1318	\N	20274	\N
25751	GENERIC_DAY	5	9	2010-04-22	1318	\N	20274	\N
25770	GENERIC_DAY	5	9	2010-03-15	1318	\N	20274	\N
25773	GENERIC_DAY	5	9	2010-03-16	1318	\N	20274	\N
25764	GENERIC_DAY	5	0	2010-04-24	1318	\N	20274	\N
25752	GENERIC_DAY	5	9	2010-03-22	1318	\N	20274	\N
25758	GENERIC_DAY	5	9	2010-03-09	1318	\N	20274	\N
25789	GENERIC_DAY	5	9	2010-04-20	1318	\N	20274	\N
25799	GENERIC_DAY	5	0	2010-03-20	1318	\N	20274	\N
25794	GENERIC_DAY	5	9	2010-05-04	1318	\N	20274	\N
25777	GENERIC_DAY	5	0	2010-04-10	1318	\N	20274	\N
25790	GENERIC_DAY	5	9	2010-05-05	1318	\N	20274	\N
25781	GENERIC_DAY	5	9	2010-04-05	1318	\N	20274	\N
25808	GENERIC_DAY	5	9	2010-04-13	1318	\N	20274	\N
25788	GENERIC_DAY	5	9	2010-04-07	1318	\N	20274	\N
25798	GENERIC_DAY	5	9	2010-04-15	1318	\N	20274	\N
25785	GENERIC_DAY	5	9	2010-04-08	1318	\N	20274	\N
25780	GENERIC_DAY	5	4	2010-03-26	1318	\N	20274	\N
25803	GENERIC_DAY	5	9	2010-03-10	1318	\N	20274	\N
25783	GENERIC_DAY	5	9	2010-04-14	1318	\N	20274	\N
25807	GENERIC_DAY	5	9	2010-04-01	1318	\N	20274	\N
25786	GENERIC_DAY	5	3	2010-05-07	1318	\N	20274	\N
25792	GENERIC_DAY	5	4	2010-04-23	1318	\N	20274	\N
25784	GENERIC_DAY	5	4	2010-04-30	1318	\N	20274	\N
25800	GENERIC_DAY	5	0	2010-03-21	1318	\N	20274	\N
25809	GENERIC_DAY	5	9	2010-04-19	1318	\N	20274	\N
25797	GENERIC_DAY	5	4	2010-03-12	1318	\N	20274	\N
25805	GENERIC_DAY	5	9	2010-03-18	1318	\N	20274	\N
25787	GENERIC_DAY	5	0	2010-03-27	1318	\N	20274	\N
25806	GENERIC_DAY	5	9	2010-04-27	1318	\N	20274	\N
25793	GENERIC_DAY	5	4	2010-04-09	1318	\N	20274	\N
25795	GENERIC_DAY	5	9	2010-04-06	1318	\N	20274	\N
25778	GENERIC_DAY	5	9	2010-04-21	1318	\N	20274	\N
25801	GENERIC_DAY	5	0	2010-04-03	1318	\N	20274	\N
25782	GENERIC_DAY	5	9	2010-04-26	1318	\N	20274	\N
25796	GENERIC_DAY	5	9	2010-03-25	1318	\N	20274	\N
25791	GENERIC_DAY	5	9	2010-03-30	1318	\N	20274	\N
25802	GENERIC_DAY	5	4	2010-04-16	1318	\N	20274	\N
25804	GENERIC_DAY	5	9	2010-03-08	1318	\N	20274	\N
25779	GENERIC_DAY	5	9	2010-04-28	1318	\N	20274	\N
29845	SPECIFIC_DAY	5	5	2010-03-17	19496	20292	\N	\N
29836	SPECIFIC_DAY	5	5	2010-04-13	19496	20292	\N	\N
29831	SPECIFIC_DAY	5	5	2010-03-08	19496	20292	\N	\N
29853	SPECIFIC_DAY	5	5	2010-03-10	19496	20292	\N	\N
29849	SPECIFIC_DAY	5	5	2010-04-28	19496	20292	\N	\N
29842	SPECIFIC_DAY	5	5	2010-04-01	19496	20292	\N	\N
29841	SPECIFIC_DAY	5	0	2010-04-04	19496	20292	\N	\N
29844	SPECIFIC_DAY	5	0	2010-05-08	19496	20292	\N	\N
29834	SPECIFIC_DAY	5	5	2010-03-30	19496	20292	\N	\N
29839	SPECIFIC_DAY	5	5	2010-04-19	19496	20292	\N	\N
29837	SPECIFIC_DAY	5	5	2010-04-22	19496	20292	\N	\N
29852	SPECIFIC_DAY	5	0	2010-05-02	19496	20292	\N	\N
29846	SPECIFIC_DAY	5	2	2010-05-10	19496	20292	\N	\N
29830	SPECIFIC_DAY	5	5	2010-04-06	19496	20292	\N	\N
29829	SPECIFIC_DAY	5	5	2010-03-09	19496	20292	\N	\N
29851	SPECIFIC_DAY	5	0	2010-04-03	19496	20292	\N	\N
29843	SPECIFIC_DAY	5	5	2010-04-21	19496	20292	\N	\N
29840	SPECIFIC_DAY	5	5	2010-04-07	19496	20292	\N	\N
29847	SPECIFIC_DAY	5	2	2010-04-30	19496	20292	\N	\N
29835	SPECIFIC_DAY	5	0	2010-04-24	19496	20292	\N	\N
29848	SPECIFIC_DAY	5	0	2010-04-18	19496	20292	\N	\N
29838	SPECIFIC_DAY	5	5	2010-04-12	19496	20292	\N	\N
29826	SPECIFIC_DAY	5	2	2010-04-23	19496	20292	\N	\N
29850	SPECIFIC_DAY	5	5	2010-04-26	19496	20292	\N	\N
29854	SPECIFIC_DAY	5	2	2010-03-26	19496	20292	\N	\N
29827	SPECIFIC_DAY	5	0	2010-05-09	19496	20292	\N	\N
29832	SPECIFIC_DAY	5	0	2010-03-27	19496	20292	\N	\N
29828	SPECIFIC_DAY	5	0	2010-03-21	19496	20292	\N	\N
29833	SPECIFIC_DAY	5	5	2010-04-08	19496	20292	\N	\N
29875	SPECIFIC_DAY	5	0	2010-03-14	19496	20292	\N	\N
29876	SPECIFIC_DAY	5	5	2010-03-18	19496	20292	\N	\N
29859	SPECIFIC_DAY	5	5	2010-03-31	19496	20292	\N	\N
29857	SPECIFIC_DAY	5	5	2010-04-20	19496	20292	\N	\N
29867	SPECIFIC_DAY	5	5	2010-03-23	19496	20292	\N	\N
29887	SPECIFIC_DAY	5	5	2010-04-05	19496	20292	\N	\N
29864	SPECIFIC_DAY	5	0	2010-04-17	19496	20292	\N	\N
29856	SPECIFIC_DAY	5	5	2010-04-14	19496	20292	\N	\N
29858	SPECIFIC_DAY	5	5	2010-04-15	19496	20292	\N	\N
29870	SPECIFIC_DAY	5	0	2010-03-20	19496	20292	\N	\N
29874	SPECIFIC_DAY	5	0	2010-03-28	19496	20292	\N	\N
29861	SPECIFIC_DAY	5	5	2010-04-29	19496	20292	\N	\N
29877	SPECIFIC_DAY	5	5	2010-03-11	19496	20292	\N	\N
29883	SPECIFIC_DAY	5	5	2010-03-29	19496	20292	\N	\N
29868	SPECIFIC_DAY	5	5	2010-03-24	19496	20292	\N	\N
29878	SPECIFIC_DAY	5	2	2010-04-16	19496	20292	\N	\N
29860	SPECIFIC_DAY	5	2	2010-03-19	19496	20292	\N	\N
29888	SPECIFIC_DAY	5	2	2010-03-12	19496	20292	\N	\N
29880	SPECIFIC_DAY	5	2	2010-04-09	19496	20292	\N	\N
29881	SPECIFIC_DAY	5	2	2010-04-02	19496	20292	\N	\N
29863	SPECIFIC_DAY	5	0	2010-04-11	19496	20292	\N	\N
29866	SPECIFIC_DAY	5	5	2010-05-03	19496	20292	\N	\N
29889	SPECIFIC_DAY	5	5	2010-04-27	19496	20292	\N	\N
29882	SPECIFIC_DAY	5	5	2010-03-22	19496	20292	\N	\N
29865	SPECIFIC_DAY	5	0	2010-04-10	19496	20292	\N	\N
29855	SPECIFIC_DAY	5	5	2010-03-16	19496	20292	\N	\N
29862	SPECIFIC_DAY	5	5	2010-05-05	19496	20292	\N	\N
29885	SPECIFIC_DAY	5	0	2010-04-25	19496	20292	\N	\N
29879	SPECIFIC_DAY	5	5	2010-03-25	19496	20292	\N	\N
29886	SPECIFIC_DAY	5	5	2010-03-15	19496	20292	\N	\N
29873	SPECIFIC_DAY	5	0	2010-05-01	19496	20292	\N	\N
29884	SPECIFIC_DAY	5	5	2010-05-04	19496	20292	\N	\N
29872	SPECIFIC_DAY	5	2	2010-05-07	19496	20292	\N	\N
29869	SPECIFIC_DAY	5	5	2010-05-06	19496	20292	\N	\N
29871	SPECIFIC_DAY	5	0	2010-03-13	19496	20292	\N	\N
33134	GENERIC_DAY	3	7	2010-09-22	1322	\N	30466	\N
33138	GENERIC_DAY	3	7	2010-10-07	1322	\N	30466	\N
33167	GENERIC_DAY	3	7	2010-09-09	1322	\N	30466	\N
33158	GENERIC_DAY	3	7	2010-10-12	1322	\N	30466	\N
33146	GENERIC_DAY	3	7	2010-09-28	1322	\N	30466	\N
33159	GENERIC_DAY	3	7	2010-10-14	1322	\N	30466	\N
33151	GENERIC_DAY	3	7	2010-09-06	1322	\N	30466	\N
33135	GENERIC_DAY	3	7	2010-08-31	1322	\N	30466	\N
33154	GENERIC_DAY	3	7	2010-10-13	1322	\N	30466	\N
33162	GENERIC_DAY	3	2	2010-10-08	1322	\N	30466	\N
33133	GENERIC_DAY	3	8	2010-08-12	1322	\N	30466	\N
33165	GENERIC_DAY	3	7	2010-09-13	1322	\N	30466	\N
33164	GENERIC_DAY	3	3	2010-08-13	1322	\N	30466	\N
33161	GENERIC_DAY	3	2	2010-08-27	1322	\N	30466	\N
33141	GENERIC_DAY	3	7	2010-09-23	1322	\N	30466	\N
33166	GENERIC_DAY	3	7	2010-09-14	1322	\N	30466	\N
33132	GENERIC_DAY	3	8	2010-08-18	1322	\N	30466	\N
33148	GENERIC_DAY	3	7	2010-10-05	1322	\N	30466	\N
33125	GENERIC_DAY	3	2	2010-09-17	1322	\N	30466	\N
33163	GENERIC_DAY	3	7	2010-09-30	1322	\N	30466	\N
33126	GENERIC_DAY	3	8	2010-08-17	1322	\N	30466	\N
33153	GENERIC_DAY	3	7	2010-09-07	1322	\N	30466	\N
33149	GENERIC_DAY	3	7	2010-10-11	1322	\N	30466	\N
33123	GENERIC_DAY	3	7	2010-08-30	1322	\N	30466	\N
33130	GENERIC_DAY	3	2	2010-09-03	1322	\N	30466	\N
33129	GENERIC_DAY	3	2	2010-09-24	1322	\N	30466	\N
33155	GENERIC_DAY	3	7	2010-08-25	1322	\N	30466	\N
33137	GENERIC_DAY	3	7	2010-09-27	1322	\N	30466	\N
33150	GENERIC_DAY	3	7	2010-09-29	1322	\N	30466	\N
33144	GENERIC_DAY	3	7	2010-09-01	1322	\N	30466	\N
33160	GENERIC_DAY	3	7	2010-09-21	1322	\N	30466	\N
33139	GENERIC_DAY	3	7	2010-09-16	1322	\N	30466	\N
33142	GENERIC_DAY	3	7	2010-10-06	1322	\N	30466	\N
33127	GENERIC_DAY	3	7	2010-08-26	1322	\N	30466	\N
33147	GENERIC_DAY	3	8	2010-08-16	1322	\N	30466	\N
33185	GENERIC_DAY	3	5	2010-08-24	1322	\N	30467	\N
33168	GENERIC_DAY	3	0	2010-08-21	1322	\N	30467	\N
33183	GENERIC_DAY	3	5	2010-08-23	1322	\N	30467	\N
33170	GENERIC_DAY	3	2	2010-08-20	1322	\N	30467	\N
33172	GENERIC_DAY	3	2	2010-08-13	1322	\N	30467	\N
33179	GENERIC_DAY	3	0	2010-08-28	1322	\N	30467	\N
33184	GENERIC_DAY	3	2	2010-08-27	1322	\N	30467	\N
33174	GENERIC_DAY	3	5	2010-08-11	1322	\N	30467	\N
33696	GENERIC_DAY	1	0	2010-11-14	1322	\N	30468	\N
33697	GENERIC_DAY	1	0	2010-12-12	1322	\N	30468	\N
33698	GENERIC_DAY	1	4	2010-12-10	1322	\N	30468	\N
33699	GENERIC_DAY	1	9	2010-11-23	1322	\N	30468	\N
33700	GENERIC_DAY	1	9	2010-11-29	1322	\N	30468	\N
33701	GENERIC_DAY	1	9	2010-11-15	1322	\N	30468	\N
33702	GENERIC_DAY	1	0	2010-11-28	1322	\N	30468	\N
33703	GENERIC_DAY	1	0	2010-12-11	1322	\N	30468	\N
33704	GENERIC_DAY	1	9	2010-12-14	1322	\N	30468	\N
33705	GENERIC_DAY	1	0	2010-12-04	1322	\N	30468	\N
33706	GENERIC_DAY	1	0	2010-11-21	1322	\N	30468	\N
33707	GENERIC_DAY	1	9	2010-11-16	1322	\N	30468	\N
33708	GENERIC_DAY	1	9	2010-12-15	1322	\N	30468	\N
33709	GENERIC_DAY	1	9	2010-12-08	1322	\N	30468	\N
33710	GENERIC_DAY	1	0	2010-11-20	1322	\N	30468	\N
33711	GENERIC_DAY	1	4	2010-12-03	1322	\N	30468	\N
33712	GENERIC_DAY	1	9	2010-11-17	1322	\N	30468	\N
33713	GENERIC_DAY	1	9	2010-12-16	1322	\N	30468	\N
33714	GENERIC_DAY	1	4	2010-11-19	1322	\N	30468	\N
33715	GENERIC_DAY	1	9	2010-12-07	1322	\N	30468	\N
33716	GENERIC_DAY	1	9	2010-11-24	1322	\N	30468	\N
33717	GENERIC_DAY	1	9	2010-11-22	1322	\N	30468	\N
33718	GENERIC_DAY	1	9	2010-12-06	1322	\N	30468	\N
33719	GENERIC_DAY	1	9	2010-11-30	1322	\N	30468	\N
33720	GENERIC_DAY	1	9	2010-11-18	1322	\N	30468	\N
33721	GENERIC_DAY	1	9	2010-12-09	1322	\N	30468	\N
33722	GENERIC_DAY	1	9	2010-11-25	1322	\N	30468	\N
33723	GENERIC_DAY	1	9	2010-12-13	1322	\N	30468	\N
33724	GENERIC_DAY	1	0	2010-11-27	1322	\N	30468	\N
33725	GENERIC_DAY	1	9	2010-12-02	1322	\N	30468	\N
36826	SPECIFIC_DAY	5	4	2010-05-11	19500	36168	\N	\N
36817	SPECIFIC_DAY	5	4	2010-04-21	19500	36168	\N	\N
36835	SPECIFIC_DAY	5	2	2010-05-07	19500	36168	\N	\N
36829	SPECIFIC_DAY	5	4	2010-03-02	19500	36168	\N	\N
36837	SPECIFIC_DAY	5	2	2010-03-05	19500	36168	\N	\N
36836	SPECIFIC_DAY	5	0	2010-05-02	19500	36168	\N	\N
36821	SPECIFIC_DAY	5	0	2010-04-25	19500	36168	\N	\N
36815	SPECIFIC_DAY	5	0	2010-04-04	19500	36168	\N	\N
36820	SPECIFIC_DAY	5	4	2010-05-05	19500	36168	\N	\N
36846	SPECIFIC_DAY	5	0	2010-05-08	19500	36168	\N	\N
36833	SPECIFIC_DAY	5	4	2010-04-19	19500	36168	\N	\N
36828	SPECIFIC_DAY	5	0	2010-03-14	19500	36168	\N	\N
36831	SPECIFIC_DAY	5	4	2010-03-17	19500	36168	\N	\N
36842	SPECIFIC_DAY	5	4	2010-04-27	19500	36168	\N	\N
36840	SPECIFIC_DAY	5	4	2010-03-09	19500	36168	\N	\N
36841	SPECIFIC_DAY	5	4	2010-03-31	19500	36168	\N	\N
36827	SPECIFIC_DAY	5	4	2010-04-28	19500	36168	\N	\N
33726	GENERIC_DAY	1	0	2010-12-05	1322	\N	30468	\N
33727	GENERIC_DAY	1	4	2010-12-17	1322	\N	30468	\N
33728	GENERIC_DAY	1	4	2010-11-26	1322	\N	30468	\N
33729	GENERIC_DAY	1	9	2010-12-01	1322	\N	30468	\N
31510	GENERIC_DAY	4	9	2010-03-30	1324	\N	30421	\N
31519	GENERIC_DAY	4	9	2010-04-22	1324	\N	30421	\N
31542	GENERIC_DAY	4	9	2010-04-07	1324	\N	30421	\N
31567	GENERIC_DAY	4	9	2010-03-24	1324	\N	30421	\N
31546	GENERIC_DAY	4	4	2010-04-30	1324	\N	30421	\N
31522	GENERIC_DAY	4	0	2010-05-01	1324	\N	30421	\N
31513	GENERIC_DAY	4	9	2010-04-12	1324	\N	30421	\N
31516	GENERIC_DAY	4	9	2010-04-29	1324	\N	30421	\N
31543	GENERIC_DAY	4	9	2010-03-15	1324	\N	30421	\N
31539	GENERIC_DAY	4	0	2010-03-28	1324	\N	30421	\N
87227	SPECIFIC_DAY	3	10	2010-03-04	2728	20201	\N	\N
87228	SPECIFIC_DAY	3	5	2010-04-06	2728	20201	\N	\N
87229	SPECIFIC_DAY	3	4	2010-04-15	2728	20201	\N	\N
87230	SPECIFIC_DAY	3	1	2010-03-19	2728	20201	\N	\N
87231	SPECIFIC_DAY	3	9	2010-03-10	2728	20201	\N	\N
87232	SPECIFIC_DAY	3	5	2010-04-01	2728	20201	\N	\N
87233	SPECIFIC_DAY	3	4	2010-04-26	2728	20201	\N	\N
87234	SPECIFIC_DAY	3	5	2010-03-16	2728	20201	\N	\N
87235	SPECIFIC_DAY	3	4	2010-04-13	2728	20201	\N	\N
87236	SPECIFIC_DAY	3	5	2010-03-15	2728	20201	\N	\N
87237	SPECIFIC_DAY	3	1	2010-03-06	2728	20201	\N	\N
87238	SPECIFIC_DAY	3	5	2010-04-05	2728	20201	\N	\N
87239	SPECIFIC_DAY	3	5	2010-04-08	2728	20201	\N	\N
87240	SPECIFIC_DAY	3	1	2010-03-07	2728	20201	\N	\N
87241	SPECIFIC_DAY	3	1	2010-03-26	2728	20201	\N	\N
87242	SPECIFIC_DAY	3	9	2010-03-09	2728	20201	\N	\N
87243	SPECIFIC_DAY	3	10	2010-03-02	2728	20201	\N	\N
87244	SPECIFIC_DAY	3	5	2010-03-17	2728	20201	\N	\N
87245	SPECIFIC_DAY	3	10	2010-03-01	2728	20201	\N	\N
87246	SPECIFIC_DAY	3	5	2010-03-23	2728	20201	\N	\N
87247	SPECIFIC_DAY	3	4	2010-04-29	2728	20201	\N	\N
87248	SPECIFIC_DAY	3	4	2010-04-21	2728	20201	\N	\N
87249	SPECIFIC_DAY	3	4	2010-04-22	2728	20201	\N	\N
87250	SPECIFIC_DAY	3	9	2010-03-08	2728	20201	\N	\N
87251	SPECIFIC_DAY	3	5	2010-04-07	2728	20201	\N	\N
87252	SPECIFIC_DAY	3	5	2010-03-30	2728	20201	\N	\N
87253	SPECIFIC_DAY	3	4	2010-04-28	2728	20201	\N	\N
87254	SPECIFIC_DAY	3	5	2010-03-24	2728	20201	\N	\N
87255	SPECIFIC_DAY	3	5	2010-03-18	2728	20201	\N	\N
87256	SPECIFIC_DAY	3	5	2010-03-31	2728	20201	\N	\N
87257	SPECIFIC_DAY	3	5	2010-03-12	2728	20201	\N	\N
87258	SPECIFIC_DAY	3	1	2010-04-02	2728	20201	\N	\N
87259	SPECIFIC_DAY	3	4	2010-04-20	2728	20201	\N	\N
87260	SPECIFIC_DAY	3	9	2010-03-11	2728	20201	\N	\N
87261	SPECIFIC_DAY	3	4	2010-04-27	2728	20201	\N	\N
87262	SPECIFIC_DAY	3	5	2010-03-05	2728	20201	\N	\N
87263	SPECIFIC_DAY	3	4	2010-04-19	2728	20201	\N	\N
87264	SPECIFIC_DAY	3	4	2010-04-14	2728	20201	\N	\N
87265	SPECIFIC_DAY	3	5	2010-03-29	2728	20201	\N	\N
87266	SPECIFIC_DAY	3	10	2010-03-03	2728	20201	\N	\N
87267	SPECIFIC_DAY	3	1	2010-04-09	2728	20201	\N	\N
87268	SPECIFIC_DAY	3	4	2010-04-12	2728	20201	\N	\N
87269	SPECIFIC_DAY	3	5	2010-03-22	2728	20201	\N	\N
87270	SPECIFIC_DAY	3	5	2010-03-25	2728	20201	\N	\N
61700	GENERIC_DAY	1	9	2010-05-18	1326	\N	30498	\N
61703	GENERIC_DAY	1	9	2010-05-03	1326	\N	30498	\N
61699	GENERIC_DAY	1	9	2010-04-06	1326	\N	30498	\N
61701	GENERIC_DAY	1	0	2010-05-02	1326	\N	30498	\N
61702	GENERIC_DAY	1	4	2010-03-26	1326	\N	30498	\N
61729	GENERIC_DAY	1	9	2010-05-11	1326	\N	30498	\N
61743	GENERIC_DAY	1	4	2010-04-23	1326	\N	30498	\N
61706	GENERIC_DAY	1	0	2010-04-11	1326	\N	30498	\N
61718	GENERIC_DAY	1	9	2010-04-01	1326	\N	30498	\N
61712	GENERIC_DAY	1	9	2010-05-10	1326	\N	30498	\N
61727	GENERIC_DAY	1	9	2010-05-12	1326	\N	30498	\N
61721	GENERIC_DAY	1	9	2010-04-27	1326	\N	30498	\N
61714	GENERIC_DAY	1	0	2010-05-09	1326	\N	30498	\N
61725	GENERIC_DAY	1	9	2010-05-04	1326	\N	30498	\N
61711	GENERIC_DAY	1	0	2010-05-16	1326	\N	30498	\N
61730	GENERIC_DAY	1	9	2010-05-19	1326	\N	30498	\N
61708	GENERIC_DAY	1	0	2010-04-10	1326	\N	30498	\N
61709	GENERIC_DAY	1	9	2010-05-06	1326	\N	30498	\N
61744	GENERIC_DAY	1	0	2010-03-28	1326	\N	30498	\N
61734	GENERIC_DAY	1	9	2010-04-22	1326	\N	30498	\N
61713	GENERIC_DAY	1	9	2010-03-29	1326	\N	30498	\N
61739	GENERIC_DAY	1	0	2010-05-01	1326	\N	30498	\N
61715	GENERIC_DAY	1	9	2010-05-13	1326	\N	30498	\N
61735	GENERIC_DAY	1	9	2010-03-30	1326	\N	30498	\N
61710	GENERIC_DAY	1	0	2010-04-03	1326	\N	30498	\N
61731	GENERIC_DAY	1	0	2010-04-25	1326	\N	30498	\N
61738	GENERIC_DAY	1	9	2010-04-26	1326	\N	30498	\N
61736	GENERIC_DAY	1	9	2010-04-15	1326	\N	30498	\N
61705	GENERIC_DAY	1	4	2010-04-02	1326	\N	30498	\N
61732	GENERIC_DAY	1	9	2010-05-20	1326	\N	30498	\N
61704	GENERIC_DAY	1	9	2010-03-24	1326	\N	30498	\N
61720	GENERIC_DAY	1	0	2010-05-15	1326	\N	30498	\N
61717	GENERIC_DAY	1	9	2010-04-21	1326	\N	30498	\N
61740	GENERIC_DAY	1	9	2010-03-31	1326	\N	30498	\N
61722	GENERIC_DAY	1	4	2010-04-30	1326	\N	30498	\N
61741	GENERIC_DAY	1	0	2010-04-18	1326	\N	30498	\N
61728	GENERIC_DAY	1	4	2010-04-09	1326	\N	30498	\N
61733	GENERIC_DAY	1	0	2010-04-04	1326	\N	30498	\N
61723	GENERIC_DAY	1	9	2010-05-05	1326	\N	30498	\N
61742	GENERIC_DAY	1	9	2010-04-14	1326	\N	30498	\N
61707	GENERIC_DAY	1	9	2010-04-12	1326	\N	30498	\N
61724	GENERIC_DAY	1	9	2010-04-19	1326	\N	30498	\N
61737	GENERIC_DAY	1	9	2010-04-05	1326	\N	30498	\N
61726	GENERIC_DAY	1	9	2010-04-28	1326	\N	30498	\N
61719	GENERIC_DAY	1	9	2010-03-25	1326	\N	30498	\N
61716	GENERIC_DAY	1	4	2010-04-16	1326	\N	30498	\N
87304	GENERIC_DAY	3	8	2010-03-22	1314	\N	20210	\N
87305	GENERIC_DAY	3	8	2010-03-30	1314	\N	20210	\N
87306	GENERIC_DAY	3	8	2010-03-15	1314	\N	20210	\N
87307	GENERIC_DAY	3	8	2010-03-29	1314	\N	20210	\N
87308	GENERIC_DAY	3	8	2010-03-19	1314	\N	20210	\N
87309	GENERIC_DAY	3	8	2010-03-18	1314	\N	20210	\N
87310	GENERIC_DAY	3	0	2010-03-14	1314	\N	20210	\N
87311	GENERIC_DAY	3	8	2010-04-12	1314	\N	20210	\N
87312	GENERIC_DAY	3	0	2010-03-28	1314	\N	20210	\N
87313	GENERIC_DAY	3	8	2010-04-13	1314	\N	20210	\N
87314	GENERIC_DAY	3	8	2010-03-09	1314	\N	20210	\N
87315	GENERIC_DAY	3	8	2010-03-17	1314	\N	20210	\N
87316	GENERIC_DAY	3	8	2010-04-01	1314	\N	20210	\N
87317	GENERIC_DAY	3	8	2010-03-16	1314	\N	20210	\N
87318	GENERIC_DAY	3	8	2010-04-16	1314	\N	20210	\N
87319	GENERIC_DAY	3	8	2010-04-02	1314	\N	20210	\N
87320	GENERIC_DAY	3	0	2010-04-03	1314	\N	20210	\N
87321	GENERIC_DAY	3	8	2010-04-15	1314	\N	20210	\N
87322	GENERIC_DAY	3	0	2010-03-20	1314	\N	20210	\N
87323	GENERIC_DAY	3	8	2010-03-11	1314	\N	20210	\N
87324	GENERIC_DAY	3	0	2010-03-27	1314	\N	20210	\N
87325	GENERIC_DAY	3	8	2010-03-08	1314	\N	20210	\N
87326	GENERIC_DAY	3	8	2010-03-23	1314	\N	20210	\N
87327	GENERIC_DAY	3	0	2010-03-13	1314	\N	20210	\N
87328	GENERIC_DAY	3	0	2010-03-21	1314	\N	20210	\N
87329	GENERIC_DAY	3	8	2010-03-26	1314	\N	20210	\N
87330	GENERIC_DAY	3	8	2010-04-14	1314	\N	20210	\N
87331	GENERIC_DAY	3	8	2010-03-12	1314	\N	20210	\N
87332	GENERIC_DAY	3	8	2010-03-31	1314	\N	20210	\N
87333	GENERIC_DAY	3	8	2010-03-24	1314	\N	20210	\N
87334	GENERIC_DAY	3	0	2010-04-04	1314	\N	20210	\N
87335	GENERIC_DAY	3	8	2010-03-25	1314	\N	20210	\N
87336	GENERIC_DAY	3	8	2010-03-10	1314	\N	20210	\N
42896	GENERIC_DAY	1	0	2010-03-22	1318	\N	40806	\N
42897	GENERIC_DAY	1	0	2010-05-11	19500	\N	40806	\N
42898	GENERIC_DAY	1	0	2010-05-02	19496	\N	40806	\N
42899	GENERIC_DAY	1	0	2010-05-06	1332	\N	40806	\N
42900	GENERIC_DAY	1	0	2010-03-26	1326	\N	40806	\N
42901	GENERIC_DAY	1	0	2010-04-20	1314	\N	40806	\N
42902	GENERIC_DAY	1	0	2010-04-21	19498	\N	40806	\N
42903	GENERIC_DAY	1	0	2010-05-24	19500	\N	40806	\N
42904	GENERIC_DAY	1	0	2010-03-19	2728	\N	40806	\N
42905	GENERIC_DAY	1	0	2010-04-09	1322	\N	40806	\N
42906	GENERIC_DAY	1	0	2010-04-22	1330	\N	40806	\N
42907	GENERIC_DAY	1	0	2010-04-25	19496	\N	40806	\N
42908	GENERIC_DAY	1	0	2010-03-26	19494	\N	40806	\N
42909	GENERIC_DAY	1	2	2010-03-18	1322	\N	40806	\N
42910	GENERIC_DAY	1	0	2010-04-16	1318	\N	40806	\N
42911	GENERIC_DAY	1	0	2010-04-18	19500	\N	40806	\N
42912	GENERIC_DAY	1	0	2010-04-24	1324	\N	40806	\N
42913	GENERIC_DAY	1	0	2010-05-13	1320	\N	40806	\N
42914	GENERIC_DAY	1	0	2010-03-18	19500	\N	40806	\N
42915	GENERIC_DAY	1	0	2010-03-21	19498	\N	40806	\N
42916	GENERIC_DAY	1	0	2010-04-21	19500	\N	40806	\N
42917	GENERIC_DAY	1	0	2010-05-18	1330	\N	40806	\N
42918	GENERIC_DAY	1	0	2010-03-30	1330	\N	40806	\N
42919	GENERIC_DAY	1	0	2010-04-29	19500	\N	40806	\N
42920	GENERIC_DAY	1	0	2010-04-24	1332	\N	40806	\N
42921	GENERIC_DAY	1	0	2010-05-08	1320	\N	40806	\N
42922	GENERIC_DAY	1	1	2010-04-20	19494	\N	40806	\N
42923	GENERIC_DAY	1	0	2010-03-21	1322	\N	40806	\N
42924	GENERIC_DAY	1	0	2010-03-31	1332	\N	40806	\N
42925	GENERIC_DAY	1	0	2010-05-12	19496	\N	40806	\N
42926	GENERIC_DAY	1	0	2010-05-01	19496	\N	40806	\N
42927	GENERIC_DAY	1	0	2010-05-10	1328	\N	40806	\N
42928	GENERIC_DAY	1	0	2010-05-15	19496	\N	40806	\N
42929	GENERIC_DAY	1	0	2010-05-18	1318	\N	40806	\N
42930	GENERIC_DAY	1	0	2010-03-25	1330	\N	40806	\N
42931	GENERIC_DAY	1	0	2010-05-01	1314	\N	40806	\N
42932	GENERIC_DAY	1	0	2010-05-14	1318	\N	40806	\N
42933	GENERIC_DAY	1	0	2010-04-06	1318	\N	40806	\N
42934	GENERIC_DAY	1	0	2010-04-22	1314	\N	40806	\N
42935	GENERIC_DAY	1	0	2010-03-24	1316	\N	40806	\N
42936	GENERIC_DAY	1	0	2010-04-09	19494	\N	40806	\N
42937	GENERIC_DAY	1	1	2010-04-21	19494	\N	40806	\N
42938	GENERIC_DAY	1	0	2010-03-17	19496	\N	40806	\N
42939	GENERIC_DAY	1	0	2010-04-10	19496	\N	40806	\N
42940	GENERIC_DAY	1	0	2010-05-14	19500	\N	40806	\N
42941	GENERIC_DAY	1	0	2010-04-08	2728	\N	40806	\N
42942	GENERIC_DAY	1	0	2010-04-13	1328	\N	40806	\N
42943	GENERIC_DAY	1	0	2010-04-15	1326	\N	40806	\N
42944	GENERIC_DAY	1	0	2010-04-01	1324	\N	40806	\N
42945	GENERIC_DAY	1	0	2010-04-04	1332	\N	40806	\N
42946	GENERIC_DAY	1	0	2010-04-03	1330	\N	40806	\N
42947	GENERIC_DAY	1	0	2010-04-22	1332	\N	40806	\N
42948	GENERIC_DAY	1	0	2010-04-28	1328	\N	40806	\N
42949	GENERIC_DAY	1	1	2010-04-21	1322	\N	40806	\N
42950	GENERIC_DAY	1	0	2010-04-18	1330	\N	40806	\N
42951	GENERIC_DAY	1	0	2010-04-04	1320	\N	40806	\N
42952	GENERIC_DAY	1	0	2010-03-18	1324	\N	40806	\N
42953	GENERIC_DAY	1	0	2010-05-04	19496	\N	40806	\N
42954	GENERIC_DAY	1	0	2010-04-11	1330	\N	40806	\N
42955	GENERIC_DAY	1	1	2010-04-14	1322	\N	40806	\N
42956	GENERIC_DAY	1	0	2010-05-16	19498	\N	40806	\N
42957	GENERIC_DAY	1	0	2010-03-29	1320	\N	40806	\N
42958	GENERIC_DAY	1	0	2010-05-22	1328	\N	40806	\N
42959	GENERIC_DAY	1	0	2010-03-25	1314	\N	40806	\N
42960	GENERIC_DAY	1	0	2010-04-18	1324	\N	40806	\N
42961	GENERIC_DAY	1	0	2010-05-08	1326	\N	40806	\N
42962	GENERIC_DAY	1	0	2010-05-15	1320	\N	40806	\N
42963	GENERIC_DAY	1	0	2010-04-12	19496	\N	40806	\N
42964	GENERIC_DAY	1	0	2010-04-04	19496	\N	40806	\N
42965	GENERIC_DAY	1	0	2010-04-05	1318	\N	40806	\N
42966	GENERIC_DAY	1	2	2010-04-30	1316	\N	40806	\N
42967	GENERIC_DAY	1	0	2010-04-13	1316	\N	40806	\N
42968	GENERIC_DAY	1	0	2010-03-17	19494	\N	40806	\N
42969	GENERIC_DAY	1	0	2010-05-11	1332	\N	40806	\N
42970	GENERIC_DAY	1	1	2010-04-08	1328	\N	40806	\N
42971	GENERIC_DAY	1	1	2010-04-07	1322	\N	40806	\N
42972	GENERIC_DAY	1	0	2010-05-18	1314	\N	40806	\N
42973	GENERIC_DAY	1	0	2010-05-03	1324	\N	40806	\N
42974	GENERIC_DAY	1	0	2010-03-29	2728	\N	40806	\N
42975	GENERIC_DAY	1	0	2010-03-27	1322	\N	40806	\N
42976	GENERIC_DAY	1	0	2010-04-20	19498	\N	40806	\N
42977	GENERIC_DAY	1	2	2010-05-21	1316	\N	40806	\N
42978	GENERIC_DAY	1	0	2010-04-07	1330	\N	40806	\N
42979	GENERIC_DAY	1	0	2010-04-06	1332	\N	40806	\N
42980	GENERIC_DAY	1	0	2010-03-29	1330	\N	40806	\N
42981	GENERIC_DAY	1	0	2010-05-25	19500	\N	40806	\N
42982	GENERIC_DAY	1	0	2010-03-24	1330	\N	40806	\N
42983	GENERIC_DAY	1	0	2010-04-29	1332	\N	40806	\N
42984	GENERIC_DAY	1	2	2010-04-02	1316	\N	40806	\N
42985	GENERIC_DAY	1	0	2010-05-08	1324	\N	40806	\N
42986	GENERIC_DAY	1	0	2010-04-30	1314	\N	40806	\N
42987	GENERIC_DAY	1	0	2010-05-23	1330	\N	40806	\N
42988	GENERIC_DAY	1	0	2010-05-15	1324	\N	40806	\N
42989	GENERIC_DAY	1	0	2010-04-26	1324	\N	40806	\N
42990	GENERIC_DAY	1	1	2010-05-03	2728	\N	40806	\N
42991	GENERIC_DAY	1	0	2010-04-29	1320	\N	40806	\N
42992	GENERIC_DAY	1	0	2010-05-20	1314	\N	40806	\N
42993	GENERIC_DAY	1	0	2010-04-08	1324	\N	40806	\N
42994	GENERIC_DAY	1	0	2010-04-19	1328	\N	40806	\N
42995	GENERIC_DAY	1	0	2010-05-18	19500	\N	40806	\N
42996	GENERIC_DAY	1	0	2010-05-13	1316	\N	40806	\N
42997	GENERIC_DAY	1	0	2010-04-02	1332	\N	40806	\N
42998	GENERIC_DAY	1	0	2010-05-04	1314	\N	40806	\N
42999	GENERIC_DAY	1	0	2010-05-21	19496	\N	40806	\N
43000	GENERIC_DAY	1	0	2010-05-10	19496	\N	40806	\N
43001	GENERIC_DAY	1	0	2010-03-26	1318	\N	40806	\N
43002	GENERIC_DAY	1	0	2010-03-26	19500	\N	40806	\N
43003	GENERIC_DAY	1	0	2010-05-19	1330	\N	40806	\N
43004	GENERIC_DAY	1	0	2010-04-02	2728	\N	40806	\N
43005	GENERIC_DAY	1	0	2010-04-28	1324	\N	40806	\N
43006	GENERIC_DAY	1	0	2010-04-20	2728	\N	40806	\N
43007	GENERIC_DAY	1	0	2010-04-03	1316	\N	40806	\N
43008	GENERIC_DAY	1	0	2010-05-01	1318	\N	40806	\N
43009	GENERIC_DAY	1	0	2010-05-15	2728	\N	40806	\N
43010	GENERIC_DAY	1	0	2010-03-25	19498	\N	40806	\N
43011	GENERIC_DAY	1	0	2010-04-23	19494	\N	40806	\N
43012	GENERIC_DAY	1	0	2010-04-22	2728	\N	40806	\N
43013	GENERIC_DAY	1	0	2010-04-23	1332	\N	40806	\N
43014	GENERIC_DAY	1	0	2010-05-17	19496	\N	40806	\N
43015	GENERIC_DAY	1	0	2010-05-18	1316	\N	40806	\N
43016	GENERIC_DAY	1	0	2010-05-18	19496	\N	40806	\N
43017	GENERIC_DAY	1	0	2010-04-18	1328	\N	40806	\N
43018	GENERIC_DAY	1	0	2010-04-09	1330	\N	40806	\N
43019	GENERIC_DAY	1	0	2010-05-05	1330	\N	40806	\N
43020	GENERIC_DAY	1	0	2010-05-11	1328	\N	40806	\N
43021	GENERIC_DAY	1	0	2010-05-08	1322	\N	40806	\N
43022	GENERIC_DAY	1	0	2010-04-02	1318	\N	40806	\N
43023	GENERIC_DAY	1	1	2010-04-15	19494	\N	40806	\N
43024	GENERIC_DAY	1	0	2010-04-29	1326	\N	40806	\N
43025	GENERIC_DAY	1	0	2010-04-23	1328	\N	40806	\N
43026	GENERIC_DAY	1	0	2010-04-12	1332	\N	40806	\N
43027	GENERIC_DAY	1	1	2010-04-12	1322	\N	40806	\N
43028	GENERIC_DAY	1	0	2010-05-13	1326	\N	40806	\N
43029	GENERIC_DAY	1	0	2010-05-25	1326	\N	40806	\N
43030	GENERIC_DAY	1	0	2010-04-14	1320	\N	40806	\N
43031	GENERIC_DAY	1	0	2010-04-18	2728	\N	40806	\N
43032	GENERIC_DAY	1	0	2010-05-12	1314	\N	40806	\N
43033	GENERIC_DAY	1	1	2010-04-28	1322	\N	40806	\N
43034	GENERIC_DAY	1	0	2010-05-08	19500	\N	40806	\N
43035	GENERIC_DAY	1	0	2010-03-19	1314	\N	40806	\N
43036	GENERIC_DAY	1	0	2010-05-21	1320	\N	40806	\N
43037	GENERIC_DAY	1	0	2010-04-14	1328	\N	40806	\N
43038	GENERIC_DAY	1	0	2010-03-20	1316	\N	40806	\N
43039	GENERIC_DAY	1	0	2010-05-02	1330	\N	40806	\N
43040	GENERIC_DAY	1	0	2010-04-28	19498	\N	40806	\N
43041	GENERIC_DAY	1	0	2010-04-19	19496	\N	40806	\N
43042	GENERIC_DAY	1	0	2010-05-15	1326	\N	40806	\N
43043	GENERIC_DAY	1	0	2010-03-28	19498	\N	40806	\N
43044	GENERIC_DAY	1	0	2010-04-26	1314	\N	40806	\N
43045	GENERIC_DAY	1	0	2010-03-27	1326	\N	40806	\N
43046	GENERIC_DAY	1	0	2010-05-17	1320	\N	40806	\N
43047	GENERIC_DAY	1	0	2010-05-15	19500	\N	40806	\N
43048	GENERIC_DAY	1	0	2010-05-06	1324	\N	40806	\N
43049	GENERIC_DAY	1	0	2010-05-11	1330	\N	40806	\N
43050	GENERIC_DAY	1	0	2010-05-24	1330	\N	40806	\N
43051	GENERIC_DAY	1	0	2010-05-08	1314	\N	40806	\N
43052	GENERIC_DAY	1	0	2010-04-30	1320	\N	40806	\N
43053	GENERIC_DAY	1	0	2010-03-28	19500	\N	40806	\N
43054	GENERIC_DAY	1	0	2010-05-11	1318	\N	40806	\N
43055	GENERIC_DAY	1	0	2010-03-29	1332	\N	40806	\N
43056	GENERIC_DAY	1	0	2010-04-14	1326	\N	40806	\N
43057	GENERIC_DAY	1	0	2010-04-28	1316	\N	40806	\N
43058	GENERIC_DAY	1	0	2010-04-07	19500	\N	40806	\N
43059	GENERIC_DAY	1	0	2010-04-20	1326	\N	40806	\N
43060	GENERIC_DAY	1	0	2010-04-10	2728	\N	40806	\N
43061	GENERIC_DAY	1	0	2010-04-10	1316	\N	40806	\N
43062	GENERIC_DAY	1	0	2010-04-08	19500	\N	40806	\N
43063	GENERIC_DAY	1	0	2010-05-12	1326	\N	40806	\N
43064	GENERIC_DAY	1	0	2010-05-22	1332	\N	40806	\N
43065	GENERIC_DAY	1	0	2010-03-30	1326	\N	40806	\N
43066	GENERIC_DAY	1	1	2010-04-13	1322	\N	40806	\N
43067	GENERIC_DAY	1	0	2010-03-30	2728	\N	40806	\N
43068	GENERIC_DAY	1	0	2010-05-14	1324	\N	40806	\N
43069	GENERIC_DAY	1	0	2010-04-01	1326	\N	40806	\N
43070	GENERIC_DAY	1	0	2010-05-24	1320	\N	40806	\N
43071	GENERIC_DAY	1	0	2010-03-21	19500	\N	40806	\N
43072	GENERIC_DAY	1	0	2010-03-19	19496	\N	40806	\N
43073	GENERIC_DAY	1	0	2010-04-12	1320	\N	40806	\N
43074	GENERIC_DAY	1	0	2010-03-30	1316	\N	40806	\N
43075	GENERIC_DAY	1	0	2010-04-06	1324	\N	40806	\N
43076	GENERIC_DAY	1	0	2010-05-08	2728	\N	40806	\N
43077	GENERIC_DAY	1	0	2010-05-25	19494	\N	40806	\N
43078	GENERIC_DAY	1	0	2010-03-30	19498	\N	40806	\N
43079	GENERIC_DAY	1	0	2010-03-27	1318	\N	40806	\N
43080	GENERIC_DAY	1	0	2010-03-17	2728	\N	40806	\N
43081	GENERIC_DAY	1	1	2010-05-13	1322	\N	40806	\N
43082	GENERIC_DAY	1	0	2010-03-31	2728	\N	40806	\N
43083	GENERIC_DAY	1	0	2010-04-07	19496	\N	40806	\N
43084	GENERIC_DAY	1	0	2010-05-10	19494	\N	40806	\N
43085	GENERIC_DAY	1	0	2010-03-29	19498	\N	40806	\N
43086	GENERIC_DAY	1	0	2010-05-13	1332	\N	40806	\N
43087	GENERIC_DAY	1	0	2010-05-13	19494	\N	40806	\N
43088	GENERIC_DAY	1	0	2010-03-18	19496	\N	40806	\N
43089	GENERIC_DAY	1	0	2010-04-28	1320	\N	40806	\N
43090	GENERIC_DAY	1	0	2010-04-24	1328	\N	40806	\N
43091	GENERIC_DAY	1	0	2010-04-12	1316	\N	40806	\N
43092	GENERIC_DAY	1	0	2010-04-20	19500	\N	40806	\N
43093	GENERIC_DAY	1	0	2010-04-04	1314	\N	40806	\N
43094	GENERIC_DAY	1	0	2010-05-04	1318	\N	40806	\N
43095	GENERIC_DAY	1	0	2010-04-10	1318	\N	40806	\N
43096	GENERIC_DAY	1	0	2010-03-24	1324	\N	40806	\N
43097	GENERIC_DAY	1	0	2010-04-26	1328	\N	40806	\N
43098	GENERIC_DAY	1	0	2010-05-16	1322	\N	40806	\N
43099	GENERIC_DAY	1	0	2010-04-06	1316	\N	40806	\N
43100	GENERIC_DAY	1	0	2010-04-15	1332	\N	40806	\N
43101	GENERIC_DAY	1	0	2010-05-02	1332	\N	40806	\N
43102	GENERIC_DAY	1	2	2010-03-17	1322	\N	40806	\N
43103	GENERIC_DAY	1	0	2010-05-21	1328	\N	40806	\N
43104	GENERIC_DAY	1	0	2010-05-06	1330	\N	40806	\N
43105	GENERIC_DAY	1	0	2010-04-10	19498	\N	40806	\N
43106	GENERIC_DAY	1	0	2010-03-23	2728	\N	40806	\N
43107	GENERIC_DAY	1	0	2010-03-28	1316	\N	40806	\N
43108	GENERIC_DAY	1	0	2010-04-23	1326	\N	40806	\N
43109	GENERIC_DAY	1	0	2010-05-12	1316	\N	40806	\N
43110	GENERIC_DAY	1	0	2010-05-10	1330	\N	40806	\N
43111	GENERIC_DAY	1	0	2010-04-04	19494	\N	40806	\N
43112	GENERIC_DAY	1	0	2010-05-12	19494	\N	40806	\N
43113	GENERIC_DAY	1	0	2010-05-07	1330	\N	40806	\N
43114	GENERIC_DAY	1	0	2010-04-08	19494	\N	40806	\N
43115	GENERIC_DAY	1	0	2010-04-04	1318	\N	40806	\N
43116	GENERIC_DAY	1	0	2010-04-16	1314	\N	40806	\N
43117	GENERIC_DAY	1	0	2010-05-04	1330	\N	40806	\N
43118	GENERIC_DAY	1	0	2010-05-15	19494	\N	40806	\N
43119	GENERIC_DAY	1	0	2010-04-05	19496	\N	40806	\N
43120	GENERIC_DAY	1	0	2010-03-28	1314	\N	40806	\N
43121	GENERIC_DAY	1	0	2010-04-16	19500	\N	40806	\N
43122	GENERIC_DAY	1	0	2010-03-23	19498	\N	40806	\N
43123	GENERIC_DAY	1	0	2010-05-05	19494	\N	40806	\N
43124	GENERIC_DAY	1	0	2010-05-04	19500	\N	40806	\N
43125	GENERIC_DAY	1	0	2010-05-15	1322	\N	40806	\N
43126	GENERIC_DAY	1	0	2010-04-16	1330	\N	40806	\N
43127	GENERIC_DAY	1	0	2010-04-25	19498	\N	40806	\N
43128	GENERIC_DAY	1	0	2010-03-28	1326	\N	40806	\N
43129	GENERIC_DAY	1	0	2010-04-29	1318	\N	40806	\N
43130	GENERIC_DAY	1	0	2010-05-18	1332	\N	40806	\N
43131	GENERIC_DAY	1	0	2010-04-13	1332	\N	40806	\N
43132	GENERIC_DAY	1	0	2010-04-04	1328	\N	40806	\N
43133	GENERIC_DAY	1	0	2010-04-18	1314	\N	40806	\N
43134	GENERIC_DAY	1	0	2010-04-02	19496	\N	40806	\N
43135	GENERIC_DAY	1	0	2010-04-23	1324	\N	40806	\N
43136	GENERIC_DAY	1	0	2010-04-27	1324	\N	40806	\N
43137	GENERIC_DAY	1	0	2010-05-16	1316	\N	40806	\N
43138	GENERIC_DAY	1	0	2010-04-23	19500	\N	40806	\N
43139	GENERIC_DAY	1	0	2010-04-04	1322	\N	40806	\N
43140	GENERIC_DAY	1	0	2010-05-25	1328	\N	40806	\N
43141	GENERIC_DAY	1	1	2010-04-27	19494	\N	40806	\N
43142	GENERIC_DAY	1	0	2010-04-12	1326	\N	40806	\N
43143	GENERIC_DAY	1	0	2010-05-11	19496	\N	40806	\N
43144	GENERIC_DAY	1	1	2010-04-20	1322	\N	40806	\N
43145	GENERIC_DAY	1	0	2010-03-25	19494	\N	40806	\N
43146	GENERIC_DAY	1	0	2010-05-04	1328	\N	40806	\N
43147	GENERIC_DAY	1	0	2010-05-13	1328	\N	40806	\N
43148	GENERIC_DAY	1	0	2010-03-23	1326	\N	40806	\N
43149	GENERIC_DAY	1	0	2010-03-25	1318	\N	40806	\N
43150	GENERIC_DAY	1	0	2010-05-13	19500	\N	40806	\N
43151	GENERIC_DAY	1	0	2010-04-04	19500	\N	40806	\N
43152	GENERIC_DAY	1	0	2010-05-20	19496	\N	40806	\N
43153	GENERIC_DAY	1	0	2010-04-21	1318	\N	40806	\N
43154	GENERIC_DAY	1	0	2010-05-22	1330	\N	40806	\N
43155	GENERIC_DAY	1	0	2010-05-02	19500	\N	40806	\N
43156	GENERIC_DAY	1	0	2010-05-19	1326	\N	40806	\N
43157	GENERIC_DAY	1	0	2010-03-27	1330	\N	40806	\N
43158	GENERIC_DAY	1	0	2010-04-16	19494	\N	40806	\N
43159	GENERIC_DAY	1	0	2010-05-17	1328	\N	40806	\N
43160	GENERIC_DAY	1	0	2010-04-19	1326	\N	40806	\N
43161	GENERIC_DAY	1	0	2010-03-22	19498	\N	40806	\N
43162	GENERIC_DAY	1	0	2010-05-01	1324	\N	40806	\N
43163	GENERIC_DAY	1	0	2010-04-04	2728	\N	40806	\N
43164	GENERIC_DAY	1	1	2010-04-26	19494	\N	40806	\N
43165	GENERIC_DAY	1	0	2010-04-30	2728	\N	40806	\N
43166	GENERIC_DAY	1	0	2010-04-05	1326	\N	40806	\N
43167	GENERIC_DAY	1	0	2010-05-22	1322	\N	40806	\N
43168	GENERIC_DAY	1	1	2010-05-17	1322	\N	40806	\N
43169	GENERIC_DAY	1	0	2010-04-07	1320	\N	40806	\N
43170	GENERIC_DAY	1	0	2010-04-03	1318	\N	40806	\N
43171	GENERIC_DAY	1	0	2010-03-24	1318	\N	40806	\N
43172	GENERIC_DAY	1	0	2010-04-03	1326	\N	40806	\N
43173	GENERIC_DAY	1	0	2010-04-04	1330	\N	40806	\N
43174	GENERIC_DAY	1	0	2010-03-18	19498	\N	40806	\N
43175	GENERIC_DAY	1	0	2010-05-19	1316	\N	40806	\N
43176	GENERIC_DAY	1	0	2010-04-19	1324	\N	40806	\N
43177	GENERIC_DAY	1	0	2010-03-31	19494	\N	40806	\N
43178	GENERIC_DAY	1	0	2010-05-12	1318	\N	40806	\N
43179	GENERIC_DAY	1	0	2010-04-10	19494	\N	40806	\N
43180	GENERIC_DAY	1	1	2010-05-13	2728	\N	40806	\N
43181	GENERIC_DAY	1	0	2010-05-02	1314	\N	40806	\N
43182	GENERIC_DAY	1	0	2010-05-18	1328	\N	40806	\N
43183	GENERIC_DAY	1	0	2010-04-07	1324	\N	40806	\N
43184	GENERIC_DAY	1	0	2010-05-22	19494	\N	40806	\N
43185	GENERIC_DAY	1	0	2010-04-01	19494	\N	40806	\N
43186	GENERIC_DAY	1	0	2010-04-29	1316	\N	40806	\N
43187	GENERIC_DAY	1	0	2010-05-23	2728	\N	40806	\N
43188	GENERIC_DAY	1	0	2010-04-07	1326	\N	40806	\N
43189	GENERIC_DAY	1	2	2010-04-16	1316	\N	40806	\N
43190	GENERIC_DAY	1	0	2010-04-02	1326	\N	40806	\N
43191	GENERIC_DAY	1	0	2010-04-15	1320	\N	40806	\N
43192	GENERIC_DAY	1	0	2010-03-25	19500	\N	40806	\N
43193	GENERIC_DAY	1	0	2010-04-25	2728	\N	40806	\N
43194	GENERIC_DAY	1	0	2010-05-11	1324	\N	40806	\N
43195	GENERIC_DAY	1	0	2010-03-31	1316	\N	40806	\N
43196	GENERIC_DAY	1	0	2010-04-24	19496	\N	40806	\N
43197	GENERIC_DAY	1	0	2010-05-02	1326	\N	40806	\N
43198	GENERIC_DAY	1	0	2010-04-18	19498	\N	40806	\N
43199	GENERIC_DAY	1	0	2010-04-21	2728	\N	40806	\N
43200	GENERIC_DAY	1	0	2010-03-21	19496	\N	40806	\N
43201	GENERIC_DAY	1	1	2010-04-06	1322	\N	40806	\N
43202	GENERIC_DAY	1	0	2010-04-02	1330	\N	40806	\N
43203	GENERIC_DAY	1	0	2010-05-21	19500	\N	40806	\N
43204	GENERIC_DAY	1	0	2010-05-06	19498	\N	40806	\N
43205	GENERIC_DAY	1	0	2010-05-17	19494	\N	40806	\N
43206	GENERIC_DAY	1	2	2010-03-25	1322	\N	40806	\N
43207	GENERIC_DAY	1	0	2010-04-24	1326	\N	40806	\N
43208	GENERIC_DAY	1	0	2010-05-16	1328	\N	40806	\N
43209	GENERIC_DAY	1	0	2010-04-02	19494	\N	40806	\N
43210	GENERIC_DAY	1	0	2010-05-12	1324	\N	40806	\N
43211	GENERIC_DAY	1	0	2010-03-20	19498	\N	40806	\N
43212	GENERIC_DAY	1	0	2010-05-20	1318	\N	40806	\N
43213	GENERIC_DAY	1	0	2010-04-16	1326	\N	40806	\N
43214	GENERIC_DAY	1	0	2010-04-20	1324	\N	40806	\N
43215	GENERIC_DAY	1	0	2010-04-27	19496	\N	40806	\N
43216	GENERIC_DAY	1	0	2010-04-11	19498	\N	40806	\N
43217	GENERIC_DAY	1	0	2010-04-16	1322	\N	40806	\N
43218	GENERIC_DAY	1	1	2010-05-06	1322	\N	40806	\N
43219	GENERIC_DAY	1	0	2010-04-09	1318	\N	40806	\N
43220	GENERIC_DAY	1	0	2010-03-28	1322	\N	40806	\N
43221	GENERIC_DAY	1	0	2010-03-20	19496	\N	40806	\N
43222	GENERIC_DAY	1	0	2010-04-25	1316	\N	40806	\N
43223	GENERIC_DAY	1	0	2010-04-01	2728	\N	40806	\N
43224	GENERIC_DAY	1	0	2010-05-14	19498	\N	40806	\N
43225	GENERIC_DAY	1	0	2010-04-21	1328	\N	40806	\N
43226	GENERIC_DAY	1	0	2010-03-25	2728	\N	40806	\N
43227	GENERIC_DAY	1	0	2010-05-16	1314	\N	40806	\N
43228	GENERIC_DAY	1	0	2010-04-28	1314	\N	40806	\N
43229	GENERIC_DAY	1	0	2010-04-04	1326	\N	40806	\N
43230	GENERIC_DAY	1	0	2010-05-09	19494	\N	40806	\N
43231	GENERIC_DAY	1	0	2010-04-09	1328	\N	40806	\N
43232	GENERIC_DAY	1	0	2010-03-23	1318	\N	40806	\N
43233	GENERIC_DAY	1	0	2010-03-30	1320	\N	40806	\N
43234	GENERIC_DAY	1	0	2010-04-30	1326	\N	40806	\N
43235	GENERIC_DAY	1	0	2010-04-24	1318	\N	40806	\N
43236	GENERIC_DAY	1	1	2010-04-08	1322	\N	40806	\N
43237	GENERIC_DAY	1	0	2010-04-03	1328	\N	40806	\N
43238	GENERIC_DAY	1	0	2010-03-30	1318	\N	40806	\N
43239	GENERIC_DAY	1	0	2010-05-01	1320	\N	40806	\N
43240	GENERIC_DAY	1	0	2010-03-22	1314	\N	40806	\N
43241	GENERIC_DAY	1	0	2010-05-04	1332	\N	40806	\N
43242	GENERIC_DAY	1	0	2010-05-25	1314	\N	40806	\N
43243	GENERIC_DAY	1	0	2010-03-28	1330	\N	40806	\N
43244	GENERIC_DAY	1	0	2010-05-13	1324	\N	40806	\N
43245	GENERIC_DAY	1	0	2010-05-01	1328	\N	40806	\N
43246	GENERIC_DAY	1	0	2010-05-24	19498	\N	40806	\N
43247	GENERIC_DAY	1	0	2010-05-21	2728	\N	40806	\N
43248	GENERIC_DAY	1	0	2010-05-05	1332	\N	40806	\N
43249	GENERIC_DAY	1	0	2010-05-09	1318	\N	40806	\N
43250	GENERIC_DAY	1	0	2010-04-18	1326	\N	40806	\N
43251	GENERIC_DAY	1	0	2010-03-26	1314	\N	40806	\N
43252	GENERIC_DAY	1	0	2010-05-07	1326	\N	40806	\N
43253	GENERIC_DAY	1	1	2010-05-10	1322	\N	40806	\N
43254	GENERIC_DAY	1	0	2010-04-12	1318	\N	40806	\N
43255	GENERIC_DAY	1	1	2010-04-05	1328	\N	40806	\N
43256	GENERIC_DAY	1	0	2010-05-06	1326	\N	40806	\N
43257	GENERIC_DAY	1	0	2010-05-14	19496	\N	40806	\N
43258	GENERIC_DAY	1	0	2010-03-25	1324	\N	40806	\N
43259	GENERIC_DAY	1	0	2010-05-18	1324	\N	40806	\N
43260	GENERIC_DAY	1	2	2010-05-14	1316	\N	40806	\N
43261	GENERIC_DAY	1	0	2010-04-04	1316	\N	40806	\N
43262	GENERIC_DAY	1	0	2010-04-26	19496	\N	40806	\N
43263	GENERIC_DAY	1	0	2010-04-17	1318	\N	40806	\N
43264	GENERIC_DAY	1	0	2010-04-19	1316	\N	40806	\N
43265	GENERIC_DAY	1	0	2010-05-18	19494	\N	40806	\N
43266	GENERIC_DAY	1	0	2010-03-27	19494	\N	40806	\N
43267	GENERIC_DAY	1	0	2010-05-24	1324	\N	40806	\N
43268	GENERIC_DAY	1	0	2010-04-16	1328	\N	40806	\N
43269	GENERIC_DAY	1	0	2010-03-19	1324	\N	40806	\N
43270	GENERIC_DAY	1	0	2010-04-11	2728	\N	40806	\N
43271	GENERIC_DAY	1	0	2010-05-09	19498	\N	40806	\N
43272	GENERIC_DAY	1	1	2010-05-19	1322	\N	40806	\N
43273	GENERIC_DAY	1	0	2010-03-28	2728	\N	40806	\N
43274	GENERIC_DAY	1	0	2010-04-06	19496	\N	40806	\N
43275	GENERIC_DAY	1	1	2010-05-12	1322	\N	40806	\N
43276	GENERIC_DAY	1	0	2010-03-21	2728	\N	40806	\N
43277	GENERIC_DAY	1	0	2010-04-17	1320	\N	40806	\N
43278	GENERIC_DAY	1	0	2010-04-01	19500	\N	40806	\N
43279	GENERIC_DAY	1	0	2010-03-19	1322	\N	40806	\N
43280	GENERIC_DAY	1	1	2010-05-07	2728	\N	40806	\N
43281	GENERIC_DAY	1	1	2010-04-15	1322	\N	40806	\N
43282	GENERIC_DAY	1	0	2010-05-07	19498	\N	40806	\N
43283	GENERIC_DAY	1	0	2010-05-08	1318	\N	40806	\N
43284	GENERIC_DAY	1	0	2010-03-29	19496	\N	40806	\N
43285	GENERIC_DAY	1	0	2010-04-25	19500	\N	40806	\N
43286	GENERIC_DAY	1	0	2010-05-01	1316	\N	40806	\N
43287	GENERIC_DAY	1	0	2010-05-18	1320	\N	40806	\N
43288	GENERIC_DAY	1	0	2010-05-13	1330	\N	40806	\N
43289	GENERIC_DAY	1	0	2010-05-13	1314	\N	40806	\N
43290	GENERIC_DAY	1	0	2010-03-27	19496	\N	40806	\N
43291	GENERIC_DAY	1	0	2010-04-15	1318	\N	40806	\N
43292	GENERIC_DAY	1	0	2010-05-12	19498	\N	40806	\N
43293	GENERIC_DAY	1	0	2010-04-20	1320	\N	40806	\N
43294	GENERIC_DAY	1	0	2010-04-05	1324	\N	40806	\N
43295	GENERIC_DAY	1	0	2010-05-08	1332	\N	40806	\N
43296	GENERIC_DAY	1	0	2010-05-11	1326	\N	40806	\N
43297	GENERIC_DAY	1	0	2010-03-25	1326	\N	40806	\N
43298	GENERIC_DAY	1	0	2010-04-11	19494	\N	40806	\N
43299	GENERIC_DAY	1	0	2010-05-14	19494	\N	40806	\N
43300	GENERIC_DAY	1	0	2010-03-31	1330	\N	40806	\N
43301	GENERIC_DAY	1	0	2010-05-02	2728	\N	40806	\N
43302	GENERIC_DAY	1	0	2010-05-14	1314	\N	40806	\N
43303	GENERIC_DAY	1	0	2010-05-20	1332	\N	40806	\N
43304	GENERIC_DAY	1	1	2010-04-27	1322	\N	40806	\N
43305	GENERIC_DAY	1	0	2010-03-27	1324	\N	40806	\N
43306	GENERIC_DAY	1	0	2010-05-18	19498	\N	40806	\N
43307	GENERIC_DAY	1	0	2010-04-11	19500	\N	40806	\N
43308	GENERIC_DAY	1	0	2010-04-17	1330	\N	40806	\N
43309	GENERIC_DAY	1	0	2010-04-28	19500	\N	40806	\N
43310	GENERIC_DAY	1	0	2010-05-07	1320	\N	40806	\N
43311	GENERIC_DAY	1	2	2010-03-22	1322	\N	40806	\N
43312	GENERIC_DAY	1	0	2010-04-10	1322	\N	40806	\N
43313	GENERIC_DAY	1	0	2010-03-24	1326	\N	40806	\N
43314	GENERIC_DAY	1	0	2010-04-24	1320	\N	40806	\N
43315	GENERIC_DAY	1	0	2010-03-23	1330	\N	40806	\N
43316	GENERIC_DAY	1	0	2010-05-23	1322	\N	40806	\N
43317	GENERIC_DAY	1	0	2010-04-10	1332	\N	40806	\N
43318	GENERIC_DAY	1	0	2010-04-10	1330	\N	40806	\N
43319	GENERIC_DAY	1	0	2010-05-09	1328	\N	40806	\N
43320	GENERIC_DAY	1	1	2010-03-31	1328	\N	40806	\N
43321	GENERIC_DAY	1	0	2010-04-23	2728	\N	40806	\N
43322	GENERIC_DAY	1	0	2010-05-17	19500	\N	40806	\N
43323	GENERIC_DAY	1	0	2010-04-07	19498	\N	40806	\N
43324	GENERIC_DAY	1	0	2010-04-24	1330	\N	40806	\N
43325	GENERIC_DAY	1	0	2010-04-16	1324	\N	40806	\N
43326	GENERIC_DAY	1	0	2010-04-16	19496	\N	40806	\N
43327	GENERIC_DAY	1	1	2010-05-05	1322	\N	40806	\N
43328	GENERIC_DAY	1	0	2010-03-28	1318	\N	40806	\N
43329	GENERIC_DAY	1	0	2010-05-19	19496	\N	40806	\N
43330	GENERIC_DAY	1	0	2010-04-24	1316	\N	40806	\N
43331	GENERIC_DAY	1	0	2010-05-08	19494	\N	40806	\N
43332	GENERIC_DAY	1	0	2010-03-19	19500	\N	40806	\N
43333	GENERIC_DAY	1	0	2010-04-15	19500	\N	40806	\N
43334	GENERIC_DAY	1	0	2010-03-23	19500	\N	40806	\N
43335	GENERIC_DAY	1	1	2010-05-06	2728	\N	40806	\N
43336	GENERIC_DAY	1	0	2010-04-26	1330	\N	40806	\N
43337	GENERIC_DAY	1	0	2010-05-22	19500	\N	40806	\N
43338	GENERIC_DAY	1	0	2010-03-21	1314	\N	40806	\N
43339	GENERIC_DAY	1	0	2010-05-22	1316	\N	40806	\N
43340	GENERIC_DAY	1	0	2010-05-21	1326	\N	40806	\N
43341	GENERIC_DAY	1	0	2010-04-24	19500	\N	40806	\N
43342	GENERIC_DAY	1	0	2010-04-10	1326	\N	40806	\N
43343	GENERIC_DAY	1	0	2010-05-24	19496	\N	40806	\N
43344	GENERIC_DAY	1	0	2010-05-24	1314	\N	40806	\N
43345	GENERIC_DAY	1	0	2010-05-23	19494	\N	40806	\N
43346	GENERIC_DAY	1	0	2010-03-20	19500	\N	40806	\N
43347	GENERIC_DAY	1	0	2010-04-18	1316	\N	40806	\N
43348	GENERIC_DAY	1	0	2010-05-16	19500	\N	40806	\N
43349	GENERIC_DAY	1	0	2010-03-23	19494	\N	40806	\N
43350	GENERIC_DAY	1	0	2010-05-10	19498	\N	40806	\N
43351	GENERIC_DAY	1	0	2010-05-02	1316	\N	40806	\N
43352	GENERIC_DAY	1	0	2010-05-22	19496	\N	40806	\N
43353	GENERIC_DAY	1	0	2010-03-20	1314	\N	40806	\N
43354	GENERIC_DAY	1	0	2010-04-21	1332	\N	40806	\N
43355	GENERIC_DAY	1	1	2010-04-29	1322	\N	40806	\N
43356	GENERIC_DAY	1	0	2010-04-20	1328	\N	40806	\N
43357	GENERIC_DAY	1	0	2010-04-28	1318	\N	40806	\N
43358	GENERIC_DAY	1	0	2010-04-11	1326	\N	40806	\N
43359	GENERIC_DAY	1	0	2010-04-04	19498	\N	40806	\N
43360	GENERIC_DAY	1	0	2010-03-20	1322	\N	40806	\N
43361	GENERIC_DAY	1	0	2010-03-18	1314	\N	40806	\N
43362	GENERIC_DAY	1	0	2010-05-24	1328	\N	40806	\N
43363	GENERIC_DAY	1	0	2010-04-17	1322	\N	40806	\N
43364	GENERIC_DAY	1	0	2010-04-17	1324	\N	40806	\N
43365	GENERIC_DAY	1	0	2010-05-25	1332	\N	40806	\N
43366	GENERIC_DAY	1	0	2010-03-27	19500	\N	40806	\N
43367	GENERIC_DAY	1	1	2010-05-20	1322	\N	40806	\N
43368	GENERIC_DAY	1	0	2010-04-30	1330	\N	40806	\N
43369	GENERIC_DAY	1	0	2010-05-16	1326	\N	40806	\N
43370	GENERIC_DAY	1	1	2010-05-04	1322	\N	40806	\N
43371	GENERIC_DAY	1	0	2010-04-25	19494	\N	40806	\N
43372	GENERIC_DAY	1	0	2010-04-29	1314	\N	40806	\N
43373	GENERIC_DAY	1	0	2010-05-24	1316	\N	40806	\N
43374	GENERIC_DAY	1	0	2010-04-19	1314	\N	40806	\N
43375	GENERIC_DAY	1	0	2010-05-07	19500	\N	40806	\N
43376	GENERIC_DAY	1	0	2010-03-22	1326	\N	40806	\N
43377	GENERIC_DAY	1	0	2010-05-03	1332	\N	40806	\N
43378	GENERIC_DAY	1	1	2010-03-30	1328	\N	40806	\N
43379	GENERIC_DAY	1	0	2010-03-27	1316	\N	40806	\N
43380	GENERIC_DAY	1	0	2010-05-21	1322	\N	40806	\N
43381	GENERIC_DAY	1	0	2010-04-15	19496	\N	40806	\N
43382	GENERIC_DAY	1	0	2010-05-12	1320	\N	40806	\N
43383	GENERIC_DAY	1	0	2010-05-03	19498	\N	40806	\N
43384	GENERIC_DAY	1	0	2010-04-22	1326	\N	40806	\N
43385	GENERIC_DAY	1	0	2010-04-01	19496	\N	40806	\N
43386	GENERIC_DAY	1	0	2010-05-06	1314	\N	40806	\N
43387	GENERIC_DAY	1	0	2010-04-05	19494	\N	40806	\N
43388	GENERIC_DAY	1	0	2010-04-01	1314	\N	40806	\N
43389	GENERIC_DAY	1	0	2010-05-19	19494	\N	40806	\N
43390	GENERIC_DAY	1	0	2010-05-25	19496	\N	40806	\N
43391	GENERIC_DAY	1	0	2010-05-19	1320	\N	40806	\N
43392	GENERIC_DAY	1	0	2010-04-23	1320	\N	40806	\N
43393	GENERIC_DAY	1	0	2010-04-05	1330	\N	40806	\N
43394	GENERIC_DAY	1	0	2010-04-08	1318	\N	40806	\N
43395	GENERIC_DAY	1	2	2010-04-23	1316	\N	40806	\N
43396	GENERIC_DAY	1	0	2010-03-17	1318	\N	40806	\N
43397	GENERIC_DAY	1	0	2010-03-20	19494	\N	40806	\N
43398	GENERIC_DAY	1	0	2010-05-25	1318	\N	40806	\N
43399	GENERIC_DAY	1	0	2010-04-13	2728	\N	40806	\N
43400	GENERIC_DAY	1	0	2010-04-30	19500	\N	40806	\N
43401	GENERIC_DAY	1	0	2010-04-16	2728	\N	40806	\N
43402	GENERIC_DAY	1	0	2010-04-16	1332	\N	40806	\N
43403	GENERIC_DAY	1	0	2010-04-24	19494	\N	40806	\N
43404	GENERIC_DAY	1	0	2010-05-17	1332	\N	40806	\N
43405	GENERIC_DAY	1	0	2010-04-13	1330	\N	40806	\N
43406	GENERIC_DAY	1	0	2010-04-12	19500	\N	40806	\N
43407	GENERIC_DAY	1	0	2010-04-03	2728	\N	40806	\N
43408	GENERIC_DAY	1	0	2010-05-23	19496	\N	40806	\N
43409	GENERIC_DAY	1	0	2010-03-30	1324	\N	40806	\N
43410	GENERIC_DAY	1	0	2010-04-27	1326	\N	40806	\N
43411	GENERIC_DAY	1	0	2010-04-10	1324	\N	40806	\N
43412	GENERIC_DAY	1	0	2010-04-26	19498	\N	40806	\N
43413	GENERIC_DAY	1	0	2010-05-24	1318	\N	40806	\N
43414	GENERIC_DAY	1	0	2010-03-22	2728	\N	40806	\N
43415	GENERIC_DAY	1	0	2010-04-30	1324	\N	40806	\N
43416	GENERIC_DAY	1	0	2010-03-24	19496	\N	40806	\N
43417	GENERIC_DAY	1	0	2010-04-19	19500	\N	40806	\N
43418	GENERIC_DAY	1	0	2010-03-31	19496	\N	40806	\N
43419	GENERIC_DAY	1	0	2010-04-22	1316	\N	40806	\N
43420	GENERIC_DAY	1	0	2010-05-10	1326	\N	40806	\N
43421	GENERIC_DAY	1	0	2010-03-29	1326	\N	40806	\N
43422	GENERIC_DAY	1	1	2010-04-01	1328	\N	40806	\N
43423	GENERIC_DAY	1	0	2010-04-14	2728	\N	40806	\N
43424	GENERIC_DAY	1	0	2010-04-01	1330	\N	40806	\N
43425	GENERIC_DAY	1	0	2010-04-29	19498	\N	40806	\N
43426	GENERIC_DAY	1	1	2010-04-22	19494	\N	40806	\N
43427	GENERIC_DAY	1	0	2010-03-29	1318	\N	40806	\N
43428	GENERIC_DAY	1	0	2010-05-14	2728	\N	40806	\N
43429	GENERIC_DAY	1	0	2010-04-05	2728	\N	40806	\N
43430	GENERIC_DAY	1	0	2010-05-02	1322	\N	40806	\N
43431	GENERIC_DAY	1	0	2010-03-31	1320	\N	40806	\N
43432	GENERIC_DAY	1	0	2010-04-18	19496	\N	40806	\N
43433	GENERIC_DAY	1	0	2010-03-30	1332	\N	40806	\N
43434	GENERIC_DAY	1	0	2010-04-29	1330	\N	40806	\N
43435	GENERIC_DAY	1	1	2010-04-29	2728	\N	40806	\N
43436	GENERIC_DAY	1	0	2010-04-02	1324	\N	40806	\N
43437	GENERIC_DAY	1	0	2010-04-25	1320	\N	40806	\N
43438	GENERIC_DAY	1	0	2010-04-03	1324	\N	40806	\N
43439	GENERIC_DAY	1	0	2010-04-25	1328	\N	40806	\N
43440	GENERIC_DAY	1	1	2010-05-07	1322	\N	40806	\N
43441	GENERIC_DAY	1	0	2010-03-31	19500	\N	40806	\N
43442	GENERIC_DAY	1	0	2010-04-09	1324	\N	40806	\N
43443	GENERIC_DAY	1	0	2010-05-09	1330	\N	40806	\N
43444	GENERIC_DAY	1	0	2010-03-22	19494	\N	40806	\N
43445	GENERIC_DAY	1	0	2010-05-01	1322	\N	40806	\N
43446	GENERIC_DAY	1	0	2010-05-10	1314	\N	40806	\N
43447	GENERIC_DAY	1	0	2010-04-20	1332	\N	40806	\N
43448	GENERIC_DAY	1	0	2010-04-17	19498	\N	40806	\N
43449	GENERIC_DAY	1	0	2010-05-03	1326	\N	40806	\N
43450	GENERIC_DAY	1	0	2010-05-25	19498	\N	40806	\N
43451	GENERIC_DAY	1	0	2010-05-13	1318	\N	40806	\N
43452	GENERIC_DAY	1	0	2010-04-15	1316	\N	40806	\N
43453	GENERIC_DAY	1	0	2010-04-14	1330	\N	40806	\N
43454	GENERIC_DAY	1	1	2010-05-24	2728	\N	40806	\N
43455	GENERIC_DAY	1	0	2010-04-09	2728	\N	40806	\N
43456	GENERIC_DAY	1	0	2010-05-07	1324	\N	40806	\N
43457	GENERIC_DAY	1	0	2010-03-18	1318	\N	40806	\N
43458	GENERIC_DAY	1	0	2010-04-25	1314	\N	40806	\N
43459	GENERIC_DAY	1	0	2010-03-22	1330	\N	40806	\N
43460	GENERIC_DAY	1	0	2010-04-13	1324	\N	40806	\N
43461	GENERIC_DAY	1	0	2010-04-12	1314	\N	40806	\N
43462	GENERIC_DAY	1	0	2010-04-13	1318	\N	40806	\N
43463	GENERIC_DAY	1	0	2010-04-05	19500	\N	40806	\N
43464	GENERIC_DAY	1	0	2010-05-23	1328	\N	40806	\N
43465	GENERIC_DAY	1	1	2010-05-11	1322	\N	40806	\N
43466	GENERIC_DAY	1	0	2010-05-25	1316	\N	40806	\N
43467	GENERIC_DAY	1	0	2010-05-14	1328	\N	40806	\N
43468	GENERIC_DAY	1	0	2010-04-13	19496	\N	40806	\N
43469	GENERIC_DAY	1	0	2010-05-23	19498	\N	40806	\N
43470	GENERIC_DAY	1	0	2010-05-23	1326	\N	40806	\N
43471	GENERIC_DAY	1	0	2010-04-27	2728	\N	40806	\N
43472	GENERIC_DAY	1	0	2010-04-17	1332	\N	40806	\N
43473	GENERIC_DAY	1	1	2010-04-01	1322	\N	40806	\N
43474	GENERIC_DAY	1	0	2010-04-12	19498	\N	40806	\N
43475	GENERIC_DAY	1	0	2010-04-29	1324	\N	40806	\N
43476	GENERIC_DAY	1	0	2010-04-03	19500	\N	40806	\N
43477	GENERIC_DAY	1	0	2010-05-25	1320	\N	40806	\N
43478	GENERIC_DAY	1	0	2010-05-06	1328	\N	40806	\N
43479	GENERIC_DAY	1	0	2010-04-21	1314	\N	40806	\N
43480	GENERIC_DAY	1	0	2010-05-19	1332	\N	40806	\N
43481	GENERIC_DAY	1	0	2010-04-27	1332	\N	40806	\N
43482	GENERIC_DAY	1	0	2010-04-21	1316	\N	40806	\N
43483	GENERIC_DAY	1	0	2010-03-17	19498	\N	40806	\N
43484	GENERIC_DAY	1	0	2010-03-22	1324	\N	40806	\N
43485	GENERIC_DAY	1	0	2010-03-29	19500	\N	40806	\N
43486	GENERIC_DAY	1	0	2010-04-22	19496	\N	40806	\N
43487	GENERIC_DAY	1	0	2010-04-13	1314	\N	40806	\N
43488	GENERIC_DAY	1	0	2010-04-03	1322	\N	40806	\N
43489	GENERIC_DAY	1	1	2010-04-14	19494	\N	40806	\N
43490	GENERIC_DAY	1	0	2010-03-21	19494	\N	40806	\N
43491	GENERIC_DAY	1	0	2010-04-04	1324	\N	40806	\N
43492	GENERIC_DAY	1	0	2010-04-12	2728	\N	40806	\N
43493	GENERIC_DAY	1	0	2010-04-19	19498	\N	40806	\N
43494	GENERIC_DAY	1	0	2010-04-11	1324	\N	40806	\N
43495	GENERIC_DAY	1	0	2010-04-11	1322	\N	40806	\N
43496	GENERIC_DAY	1	0	2010-03-25	19496	\N	40806	\N
43497	GENERIC_DAY	1	0	2010-04-05	19498	\N	40806	\N
43498	GENERIC_DAY	1	0	2010-05-23	1320	\N	40806	\N
43499	GENERIC_DAY	1	0	2010-05-09	1314	\N	40806	\N
43500	GENERIC_DAY	1	0	2010-04-21	1324	\N	40806	\N
43501	GENERIC_DAY	1	0	2010-04-11	1332	\N	40806	\N
43502	GENERIC_DAY	1	0	2010-05-15	1316	\N	40806	\N
43503	GENERIC_DAY	1	0	2010-04-18	1332	\N	40806	\N
43504	GENERIC_DAY	1	1	2010-05-10	2728	\N	40806	\N
43505	GENERIC_DAY	1	0	2010-05-11	1316	\N	40806	\N
43506	GENERIC_DAY	1	0	2010-03-17	19500	\N	40806	\N
43507	GENERIC_DAY	1	0	2010-04-14	1314	\N	40806	\N
43508	GENERIC_DAY	1	0	2010-05-01	1326	\N	40806	\N
43509	GENERIC_DAY	1	0	2010-03-22	19496	\N	40806	\N
43510	GENERIC_DAY	1	1	2010-05-25	1322	\N	40806	\N
43511	GENERIC_DAY	1	0	2010-05-24	19494	\N	40806	\N
43512	GENERIC_DAY	1	0	2010-04-05	1320	\N	40806	\N
43513	GENERIC_DAY	1	0	2010-05-07	1318	\N	40806	\N
43514	GENERIC_DAY	1	0	2010-05-15	19498	\N	40806	\N
43515	GENERIC_DAY	1	0	2010-04-07	1318	\N	40806	\N
43516	GENERIC_DAY	1	0	2010-05-14	1322	\N	40806	\N
43517	GENERIC_DAY	1	0	2010-04-22	1324	\N	40806	\N
43518	GENERIC_DAY	1	0	2010-05-03	1314	\N	40806	\N
43519	GENERIC_DAY	1	0	2010-04-09	1332	\N	40806	\N
43520	GENERIC_DAY	1	0	2010-05-10	1318	\N	40806	\N
43521	GENERIC_DAY	1	0	2010-05-11	19498	\N	40806	\N
43522	GENERIC_DAY	1	0	2010-04-30	19496	\N	40806	\N
43523	GENERIC_DAY	1	0	2010-05-23	19500	\N	40806	\N
43524	GENERIC_DAY	1	0	2010-03-20	2728	\N	40806	\N
43525	GENERIC_DAY	1	0	2010-04-28	1330	\N	40806	\N
43526	GENERIC_DAY	1	0	2010-04-15	19498	\N	40806	\N
43527	GENERIC_DAY	1	0	2010-04-20	1318	\N	40806	\N
43528	GENERIC_DAY	1	0	2010-05-05	1324	\N	40806	\N
43529	GENERIC_DAY	1	1	2010-05-11	2728	\N	40806	\N
43530	GENERIC_DAY	1	0	2010-04-11	1316	\N	40806	\N
43531	GENERIC_DAY	1	0	2010-05-01	1332	\N	40806	\N
43532	GENERIC_DAY	1	0	2010-04-30	1328	\N	40806	\N
43533	GENERIC_DAY	1	0	2010-04-08	1330	\N	40806	\N
43534	GENERIC_DAY	1	0	2010-03-21	1324	\N	40806	\N
43535	GENERIC_DAY	1	1	2010-04-12	19494	\N	40806	\N
43536	GENERIC_DAY	1	0	2010-05-02	19498	\N	40806	\N
43537	GENERIC_DAY	1	0	2010-04-14	19498	\N	40806	\N
43538	GENERIC_DAY	1	0	2010-04-29	19494	\N	40806	\N
43539	GENERIC_DAY	1	0	2010-04-29	1328	\N	40806	\N
43540	GENERIC_DAY	1	0	2010-04-01	19498	\N	40806	\N
43541	GENERIC_DAY	1	0	2010-04-25	1332	\N	40806	\N
43542	GENERIC_DAY	1	0	2010-05-05	1320	\N	40806	\N
43543	GENERIC_DAY	1	0	2010-04-14	1318	\N	40806	\N
43544	GENERIC_DAY	1	0	2010-04-02	19498	\N	40806	\N
43545	GENERIC_DAY	1	0	2010-04-30	19498	\N	40806	\N
43546	GENERIC_DAY	1	0	2010-04-03	19494	\N	40806	\N
43547	GENERIC_DAY	1	0	2010-04-24	1322	\N	40806	\N
43548	GENERIC_DAY	1	1	2010-04-26	1322	\N	40806	\N
43549	GENERIC_DAY	1	0	2010-05-16	2728	\N	40806	\N
43550	GENERIC_DAY	1	0	2010-05-16	1332	\N	40806	\N
43551	GENERIC_DAY	1	0	2010-04-17	19500	\N	40806	\N
43552	GENERIC_DAY	1	0	2010-05-16	1324	\N	40806	\N
43553	GENERIC_DAY	1	0	2010-04-18	19494	\N	40806	\N
43554	GENERIC_DAY	1	0	2010-04-22	19498	\N	40806	\N
43555	GENERIC_DAY	1	0	2010-04-17	1314	\N	40806	\N
43556	GENERIC_DAY	1	0	2010-03-18	2728	\N	40806	\N
43557	GENERIC_DAY	1	1	2010-03-29	1322	\N	40806	\N
43558	GENERIC_DAY	1	0	2010-03-26	1324	\N	40806	\N
43559	GENERIC_DAY	1	0	2010-04-23	1322	\N	40806	\N
43560	GENERIC_DAY	1	0	2010-04-26	1332	\N	40806	\N
43561	GENERIC_DAY	1	0	2010-04-25	1318	\N	40806	\N
43562	GENERIC_DAY	1	0	2010-05-01	19494	\N	40806	\N
43563	GENERIC_DAY	1	0	2010-05-19	1328	\N	40806	\N
43564	GENERIC_DAY	1	1	2010-03-31	1322	\N	40806	\N
43565	GENERIC_DAY	1	0	2010-04-13	1320	\N	40806	\N
43566	GENERIC_DAY	1	0	2010-03-21	1316	\N	40806	\N
43567	GENERIC_DAY	1	0	2010-03-24	1314	\N	40806	\N
43568	GENERIC_DAY	1	0	2010-05-13	19496	\N	40806	\N
43569	GENERIC_DAY	1	0	2010-03-28	19496	\N	40806	\N
43570	GENERIC_DAY	1	0	2010-04-11	19496	\N	40806	\N
43571	GENERIC_DAY	1	0	2010-04-18	1318	\N	40806	\N
43572	GENERIC_DAY	1	0	2010-04-27	1330	\N	40806	\N
43573	GENERIC_DAY	1	0	2010-04-27	1318	\N	40806	\N
43574	GENERIC_DAY	1	1	2010-05-17	1318	\N	40806	\N
43575	GENERIC_DAY	1	1	2010-04-07	1328	\N	40806	\N
43576	GENERIC_DAY	1	0	2010-04-30	19494	\N	40806	\N
43577	GENERIC_DAY	1	0	2010-05-12	1332	\N	40806	\N
43578	GENERIC_DAY	1	0	2010-04-12	1328	\N	40806	\N
43579	GENERIC_DAY	1	0	2010-05-22	1326	\N	40806	\N
43580	GENERIC_DAY	1	0	2010-05-01	19498	\N	40806	\N
43581	GENERIC_DAY	1	0	2010-04-03	1332	\N	40806	\N
43582	GENERIC_DAY	1	0	2010-05-22	19498	\N	40806	\N
43583	GENERIC_DAY	1	0	2010-04-22	1320	\N	40806	\N
43584	GENERIC_DAY	1	0	2010-04-30	1322	\N	40806	\N
43585	GENERIC_DAY	1	0	2010-04-01	1332	\N	40806	\N
43586	GENERIC_DAY	1	0	2010-04-02	1322	\N	40806	\N
43587	GENERIC_DAY	1	0	2010-03-25	1316	\N	40806	\N
43588	GENERIC_DAY	1	0	2010-04-12	1324	\N	40806	\N
43589	GENERIC_DAY	1	0	2010-05-12	1330	\N	40806	\N
43590	GENERIC_DAY	1	0	2010-03-29	1314	\N	40806	\N
43591	GENERIC_DAY	1	0	2010-05-22	1314	\N	40806	\N
43592	GENERIC_DAY	1	0	2010-05-01	1330	\N	40806	\N
43593	GENERIC_DAY	1	0	2010-05-10	19500	\N	40806	\N
43594	GENERIC_DAY	1	0	2010-03-19	19498	\N	40806	\N
43595	GENERIC_DAY	1	0	2010-04-16	19498	\N	40806	\N
43596	GENERIC_DAY	1	0	2010-05-10	1320	\N	40806	\N
43597	GENERIC_DAY	1	0	2010-05-21	19498	\N	40806	\N
43598	GENERIC_DAY	1	0	2010-05-19	19498	\N	40806	\N
43599	GENERIC_DAY	1	0	2010-04-06	2728	\N	40806	\N
43600	GENERIC_DAY	1	0	2010-05-09	19500	\N	40806	\N
43601	GENERIC_DAY	1	0	2010-05-09	2728	\N	40806	\N
43602	GENERIC_DAY	1	0	2010-05-01	19500	\N	40806	\N
43603	GENERIC_DAY	1	0	2010-05-15	1318	\N	40806	\N
43604	GENERIC_DAY	1	0	2010-04-26	1320	\N	40806	\N
43605	GENERIC_DAY	1	0	2010-03-31	1318	\N	40806	\N
43606	GENERIC_DAY	1	0	2010-05-19	1324	\N	40806	\N
43607	GENERIC_DAY	1	1	2010-04-06	1328	\N	40806	\N
43608	GENERIC_DAY	1	0	2010-04-02	1314	\N	40806	\N
43609	GENERIC_DAY	1	0	2010-05-01	2728	\N	40806	\N
43610	GENERIC_DAY	1	0	2010-05-10	1316	\N	40806	\N
43611	GENERIC_DAY	1	0	2010-04-19	1320	\N	40806	\N
43612	GENERIC_DAY	1	0	2010-05-12	19500	\N	40806	\N
43613	GENERIC_DAY	1	0	2010-04-14	19496	\N	40806	\N
43614	GENERIC_DAY	1	0	2010-04-03	19498	\N	40806	\N
43615	GENERIC_DAY	1	0	2010-04-01	1316	\N	40806	\N
43616	GENERIC_DAY	1	0	2010-05-18	1326	\N	40806	\N
43617	GENERIC_DAY	1	0	2010-03-23	1316	\N	40806	\N
43618	GENERIC_DAY	1	0	2010-03-17	1314	\N	40806	\N
43619	GENERIC_DAY	1	0	2010-04-25	1322	\N	40806	\N
43620	GENERIC_DAY	1	1	2010-05-24	1322	\N	40806	\N
43621	GENERIC_DAY	1	0	2010-05-09	1326	\N	40806	\N
43622	GENERIC_DAY	1	0	2010-05-07	1314	\N	40806	\N
43623	GENERIC_DAY	1	0	2010-04-25	1324	\N	40806	\N
43624	GENERIC_DAY	1	0	2010-04-08	1320	\N	40806	\N
43625	GENERIC_DAY	1	0	2010-04-19	1330	\N	40806	\N
43626	GENERIC_DAY	1	0	2010-05-14	1332	\N	40806	\N
43627	GENERIC_DAY	1	0	2010-04-15	1314	\N	40806	\N
43628	GENERIC_DAY	1	1	2010-05-05	2728	\N	40806	\N
43629	GENERIC_DAY	1	0	2010-05-15	1332	\N	40806	\N
43630	GENERIC_DAY	1	0	2010-04-28	19496	\N	40806	\N
43631	GENERIC_DAY	1	0	2010-05-04	1326	\N	40806	\N
43632	GENERIC_DAY	1	0	2010-04-12	1330	\N	40806	\N
43633	GENERIC_DAY	1	0	2010-05-13	19498	\N	40806	\N
43634	GENERIC_DAY	1	0	2010-03-23	1324	\N	40806	\N
43635	GENERIC_DAY	1	0	2010-03-28	19494	\N	40806	\N
43636	GENERIC_DAY	1	0	2010-03-30	19500	\N	40806	\N
43637	GENERIC_DAY	1	0	2010-05-03	19496	\N	40806	\N
43638	GENERIC_DAY	1	0	2010-04-17	1326	\N	40806	\N
43639	GENERIC_DAY	1	0	2010-04-28	1332	\N	40806	\N
43640	GENERIC_DAY	1	0	2010-04-08	1316	\N	40806	\N
43641	GENERIC_DAY	1	0	2010-04-14	19500	\N	40806	\N
43642	GENERIC_DAY	1	0	2010-04-08	1326	\N	40806	\N
43643	GENERIC_DAY	1	0	2010-05-21	1330	\N	40806	\N
43644	GENERIC_DAY	1	0	2010-05-06	19494	\N	40806	\N
43645	GENERIC_DAY	1	0	2010-04-07	1332	\N	40806	\N
43646	GENERIC_DAY	1	0	2010-05-09	1322	\N	40806	\N
43647	GENERIC_DAY	1	0	2010-05-11	1314	\N	40806	\N
43648	GENERIC_DAY	1	0	2010-04-17	1316	\N	40806	\N
43649	GENERIC_DAY	1	0	2010-04-22	1328	\N	40806	\N
43650	GENERIC_DAY	1	0	2010-05-05	1318	\N	40806	\N
43651	GENERIC_DAY	1	0	2010-04-11	1328	\N	40806	\N
43652	GENERIC_DAY	1	0	2010-05-15	1314	\N	40806	\N
43653	GENERIC_DAY	1	0	2010-04-03	1314	\N	40806	\N
43654	GENERIC_DAY	1	0	2010-05-07	19494	\N	40806	\N
43655	GENERIC_DAY	1	0	2010-05-22	2728	\N	40806	\N
43656	GENERIC_DAY	1	0	2010-03-27	19498	\N	40806	\N
43657	GENERIC_DAY	1	0	2010-05-06	19500	\N	40806	\N
43658	GENERIC_DAY	1	0	2010-04-22	1318	\N	40806	\N
43659	GENERIC_DAY	1	1	2010-05-18	1322	\N	40806	\N
43660	GENERIC_DAY	1	0	2010-04-09	19498	\N	40806	\N
43661	GENERIC_DAY	1	0	2010-05-09	1332	\N	40806	\N
43662	GENERIC_DAY	1	0	2010-05-22	1324	\N	40806	\N
43663	GENERIC_DAY	1	0	2010-05-16	1330	\N	40806	\N
43664	GENERIC_DAY	1	0	2010-03-26	1322	\N	40806	\N
43665	GENERIC_DAY	1	0	2010-04-15	1324	\N	40806	\N
43666	GENERIC_DAY	1	1	2010-04-28	2728	\N	40806	\N
43667	GENERIC_DAY	1	0	2010-04-18	1322	\N	40806	\N
43668	GENERIC_DAY	1	2	2010-04-09	1316	\N	40806	\N
43669	GENERIC_DAY	1	1	2010-03-29	1328	\N	40806	\N
43670	GENERIC_DAY	1	0	2010-05-23	1324	\N	40806	\N
43671	GENERIC_DAY	1	0	2010-04-23	1330	\N	40806	\N
43672	GENERIC_DAY	1	0	2010-04-28	1326	\N	40806	\N
43673	GENERIC_DAY	1	0	2010-05-20	19500	\N	40806	\N
43674	GENERIC_DAY	1	0	2010-05-20	1328	\N	40806	\N
43675	GENERIC_DAY	1	0	2010-04-10	1320	\N	40806	\N
43676	GENERIC_DAY	1	0	2010-04-26	1316	\N	40806	\N
43677	GENERIC_DAY	1	0	2010-05-06	19496	\N	40806	\N
43678	GENERIC_DAY	1	0	2010-05-09	1320	\N	40806	\N
43679	GENERIC_DAY	1	0	2010-03-28	1324	\N	40806	\N
43680	GENERIC_DAY	1	0	2010-04-27	1320	\N	40806	\N
43681	GENERIC_DAY	1	0	2010-05-20	19498	\N	40806	\N
43682	GENERIC_DAY	1	0	2010-04-15	2728	\N	40806	\N
43683	GENERIC_DAY	1	1	2010-04-19	19494	\N	40806	\N
43684	GENERIC_DAY	1	0	2010-05-24	1326	\N	40806	\N
43685	GENERIC_DAY	1	0	2010-04-06	19494	\N	40806	\N
43686	GENERIC_DAY	1	0	2010-04-24	1314	\N	40806	\N
43687	GENERIC_DAY	1	0	2010-04-26	2728	\N	40806	\N
43688	GENERIC_DAY	1	0	2010-05-05	19498	\N	40806	\N
43689	GENERIC_DAY	1	0	2010-05-05	19500	\N	40806	\N
43690	GENERIC_DAY	1	0	2010-05-05	1326	\N	40806	\N
43691	GENERIC_DAY	1	0	2010-04-06	19500	\N	40806	\N
43692	GENERIC_DAY	1	1	2010-05-20	2728	\N	40806	\N
43693	GENERIC_DAY	1	0	2010-05-19	1314	\N	40806	\N
43694	GENERIC_DAY	1	0	2010-03-19	19494	\N	40806	\N
43695	GENERIC_DAY	1	0	2010-04-24	2728	\N	40806	\N
43696	GENERIC_DAY	1	0	2010-04-19	1318	\N	40806	\N
43697	GENERIC_DAY	1	0	2010-04-20	1316	\N	40806	\N
43698	GENERIC_DAY	1	0	2010-05-22	1318	\N	40806	\N
43699	GENERIC_DAY	1	0	2010-04-17	19496	\N	40806	\N
43700	GENERIC_DAY	1	0	2010-04-06	1330	\N	40806	\N
43701	GENERIC_DAY	1	0	2010-05-07	1328	\N	40806	\N
43702	GENERIC_DAY	1	0	2010-04-06	1326	\N	40806	\N
43703	GENERIC_DAY	1	0	2010-04-26	1326	\N	40806	\N
43704	GENERIC_DAY	1	0	2010-04-21	19496	\N	40806	\N
43705	GENERIC_DAY	1	0	2010-04-14	1324	\N	40806	\N
43706	GENERIC_DAY	1	0	2010-04-01	1320	\N	40806	\N
43707	GENERIC_DAY	1	0	2010-03-22	19500	\N	40806	\N
43708	GENERIC_DAY	1	0	2010-04-10	19500	\N	40806	\N
43709	GENERIC_DAY	1	0	2010-05-02	1320	\N	40806	\N
43710	GENERIC_DAY	1	0	2010-05-20	1330	\N	40806	\N
43711	GENERIC_DAY	1	1	2010-04-19	1322	\N	40806	\N
43712	GENERIC_DAY	1	0	2010-05-07	1332	\N	40806	\N
43713	GENERIC_DAY	1	0	2010-04-23	19498	\N	40806	\N
43714	GENERIC_DAY	1	0	2010-05-08	19498	\N	40806	\N
43715	GENERIC_DAY	1	0	2010-05-25	1330	\N	40806	\N
43716	GENERIC_DAY	1	0	2010-03-31	1326	\N	40806	\N
43717	GENERIC_DAY	1	0	2010-05-21	1332	\N	40806	\N
43718	GENERIC_DAY	1	0	2010-05-02	1328	\N	40806	\N
43719	GENERIC_DAY	1	0	2010-04-21	1330	\N	40806	\N
43720	GENERIC_DAY	1	0	2010-05-16	1318	\N	40806	\N
43721	GENERIC_DAY	1	0	2010-03-23	19496	\N	40806	\N
43722	GENERIC_DAY	1	2	2010-03-23	1322	\N	40806	\N
43723	GENERIC_DAY	1	0	2010-04-08	19498	\N	40806	\N
43724	GENERIC_DAY	1	0	2010-05-04	19494	\N	40806	\N
43725	GENERIC_DAY	1	0	2010-05-14	1330	\N	40806	\N
43726	GENERIC_DAY	1	0	2010-04-07	1316	\N	40806	\N
43727	GENERIC_DAY	1	0	2010-03-18	1316	\N	40806	\N
43728	GENERIC_DAY	1	0	2010-03-24	2728	\N	40806	\N
43729	GENERIC_DAY	1	0	2010-05-25	1324	\N	40806	\N
43730	GENERIC_DAY	1	0	2010-04-09	19496	\N	40806	\N
43731	GENERIC_DAY	1	0	2010-04-15	1330	\N	40806	\N
43732	GENERIC_DAY	1	0	2010-05-08	19496	\N	40806	\N
43733	GENERIC_DAY	1	0	2010-04-06	19498	\N	40806	\N
43734	GENERIC_DAY	1	0	2010-04-05	1316	\N	40806	\N
43735	GENERIC_DAY	1	0	2010-04-11	1318	\N	40806	\N
43736	GENERIC_DAY	1	0	2010-04-02	1328	\N	40806	\N
43737	GENERIC_DAY	1	0	2010-04-16	1320	\N	40806	\N
43738	GENERIC_DAY	1	0	2010-03-30	19496	\N	40806	\N
43739	GENERIC_DAY	1	0	2010-05-23	1314	\N	40806	\N
43740	GENERIC_DAY	1	0	2010-04-27	1328	\N	40806	\N
43741	GENERIC_DAY	1	0	2010-05-21	1314	\N	40806	\N
43742	GENERIC_DAY	1	0	2010-04-03	19496	\N	40806	\N
43743	GENERIC_DAY	1	0	2010-03-19	1318	\N	40806	\N
43744	GENERIC_DAY	1	0	2010-04-25	1326	\N	40806	\N
43745	GENERIC_DAY	1	0	2010-05-17	1330	\N	40806	\N
43746	GENERIC_DAY	1	0	2010-05-20	1326	\N	40806	\N
43747	GENERIC_DAY	1	0	2010-05-21	19494	\N	40806	\N
43748	GENERIC_DAY	1	0	2010-03-26	2728	\N	40806	\N
43749	GENERIC_DAY	1	0	2010-04-17	2728	\N	40806	\N
43750	GENERIC_DAY	1	0	2010-03-23	1314	\N	40806	\N
43751	GENERIC_DAY	1	0	2010-05-04	1320	\N	40806	\N
43752	GENERIC_DAY	1	0	2010-05-07	19496	\N	40806	\N
43753	GENERIC_DAY	1	0	2010-03-29	1316	\N	40806	\N
43754	GENERIC_DAY	1	0	2010-04-14	1316	\N	40806	\N
43755	GENERIC_DAY	1	0	2010-05-21	1324	\N	40806	\N
43756	GENERIC_DAY	1	2	2010-03-26	1316	\N	40806	\N
43757	GENERIC_DAY	1	0	2010-03-27	2728	\N	40806	\N
43758	GENERIC_DAY	1	0	2010-03-24	19500	\N	40806	\N
43759	GENERIC_DAY	1	0	2010-04-13	19498	\N	40806	\N
43760	GENERIC_DAY	1	0	2010-03-18	19494	\N	40806	\N
43761	GENERIC_DAY	1	0	2010-04-09	19500	\N	40806	\N
43762	GENERIC_DAY	1	0	2010-05-23	1332	\N	40806	\N
43763	GENERIC_DAY	1	0	2010-05-21	1318	\N	40806	\N
43764	GENERIC_DAY	1	0	2010-04-27	1314	\N	40806	\N
43765	GENERIC_DAY	1	0	2010-05-20	1324	\N	40806	\N
43766	GENERIC_DAY	1	0	2010-05-15	1330	\N	40806	\N
43767	GENERIC_DAY	1	1	2010-04-22	1322	\N	40806	\N
43768	GENERIC_DAY	1	0	2010-04-28	19494	\N	40806	\N
43769	GENERIC_DAY	1	0	2010-05-19	1318	\N	40806	\N
43770	GENERIC_DAY	1	0	2010-04-09	1326	\N	40806	\N
43771	GENERIC_DAY	1	0	2010-05-02	1318	\N	40806	\N
43772	GENERIC_DAY	1	1	2010-05-12	2728	\N	40806	\N
43773	GENERIC_DAY	1	0	2010-03-30	1314	\N	40806	\N
43774	GENERIC_DAY	1	0	2010-03-24	19498	\N	40806	\N
43775	GENERIC_DAY	1	2	2010-03-19	1316	\N	40806	\N
43776	GENERIC_DAY	1	0	2010-05-22	1320	\N	40806	\N
43777	GENERIC_DAY	1	0	2010-04-09	1320	\N	40806	\N
43778	GENERIC_DAY	1	0	2010-05-23	1316	\N	40806	\N
43779	GENERIC_DAY	1	0	2010-03-31	1324	\N	40806	\N
43780	GENERIC_DAY	1	0	2010-04-23	19496	\N	40806	\N
43781	GENERIC_DAY	1	0	2010-03-29	19494	\N	40806	\N
43782	GENERIC_DAY	1	0	2010-05-06	1320	\N	40806	\N
43783	GENERIC_DAY	1	0	2010-05-16	19494	\N	40806	\N
43784	GENERIC_DAY	1	0	2010-05-20	19494	\N	40806	\N
43785	GENERIC_DAY	1	0	2010-05-16	19496	\N	40806	\N
43786	GENERIC_DAY	1	0	2010-05-15	1328	\N	40806	\N
43787	GENERIC_DAY	1	0	2010-05-04	19498	\N	40806	\N
43788	GENERIC_DAY	1	0	2010-05-05	1328	\N	40806	\N
43789	GENERIC_DAY	1	0	2010-04-26	1318	\N	40806	\N
43790	GENERIC_DAY	1	0	2010-03-22	1316	\N	40806	\N
43791	GENERIC_DAY	1	0	2010-04-23	1318	\N	40806	\N
43792	GENERIC_DAY	1	0	2010-03-17	1316	\N	40806	\N
43793	GENERIC_DAY	1	0	2010-04-07	2728	\N	40806	\N
43794	GENERIC_DAY	1	0	2010-04-21	1326	\N	40806	\N
43795	GENERIC_DAY	1	0	2010-04-20	19496	\N	40806	\N
43796	GENERIC_DAY	1	0	2010-04-10	1328	\N	40806	\N
43797	GENERIC_DAY	1	0	2010-05-11	1320	\N	40806	\N
43798	GENERIC_DAY	1	0	2010-05-24	1332	\N	40806	\N
43799	GENERIC_DAY	1	0	2010-04-13	1326	\N	40806	\N
43800	GENERIC_DAY	1	0	2010-04-08	1332	\N	40806	\N
43801	GENERIC_DAY	1	0	2010-03-29	1324	\N	40806	\N
43802	GENERIC_DAY	1	0	2010-05-20	1316	\N	40806	\N
43803	GENERIC_DAY	1	0	2010-05-08	1328	\N	40806	\N
43804	GENERIC_DAY	1	0	2010-03-30	19494	\N	40806	\N
43805	GENERIC_DAY	1	1	2010-05-04	2728	\N	40806	\N
43806	GENERIC_DAY	1	0	2010-03-24	19494	\N	40806	\N
43807	GENERIC_DAY	1	0	2010-05-14	1326	\N	40806	\N
43808	GENERIC_DAY	1	0	2010-03-31	1314	\N	40806	\N
43809	GENERIC_DAY	1	0	2010-03-27	1314	\N	40806	\N
43810	GENERIC_DAY	1	0	2010-04-08	19496	\N	40806	\N
43811	GENERIC_DAY	1	0	2010-05-10	1324	\N	40806	\N
43812	GENERIC_DAY	1	0	2010-04-23	1314	\N	40806	\N
43813	GENERIC_DAY	1	0	2010-03-20	1324	\N	40806	\N
43814	GENERIC_DAY	1	0	2010-04-06	1320	\N	40806	\N
43815	GENERIC_DAY	1	1	2010-05-18	2728	\N	40806	\N
43816	GENERIC_DAY	1	0	2010-04-30	1332	\N	40806	\N
43817	GENERIC_DAY	1	0	2010-04-03	1320	\N	40806	\N
43818	GENERIC_DAY	1	0	2010-05-05	1314	\N	40806	\N
43819	GENERIC_DAY	1	0	2010-04-05	1332	\N	40806	\N
43820	GENERIC_DAY	1	1	2010-04-05	1322	\N	40806	\N
43821	GENERIC_DAY	1	0	2010-03-26	19498	\N	40806	\N
43822	GENERIC_DAY	1	0	2010-04-13	19500	\N	40806	\N
43823	GENERIC_DAY	1	0	2010-03-21	1318	\N	40806	\N
43824	GENERIC_DAY	1	0	2010-04-21	1320	\N	40806	\N
43825	GENERIC_DAY	1	0	2010-05-12	1328	\N	40806	\N
43826	GENERIC_DAY	1	0	2010-04-15	1328	\N	40806	\N
43827	GENERIC_DAY	1	0	2010-05-02	1324	\N	40806	\N
43828	GENERIC_DAY	1	0	2010-05-06	1318	\N	40806	\N
43829	GENERIC_DAY	1	0	2010-05-16	1320	\N	40806	\N
43830	GENERIC_DAY	1	0	2010-04-24	19498	\N	40806	\N
43831	GENERIC_DAY	1	0	2010-05-19	19500	\N	40806	\N
43832	GENERIC_DAY	1	1	2010-05-19	2728	\N	40806	\N
43833	GENERIC_DAY	1	0	2010-04-11	1320	\N	40806	\N
43834	GENERIC_DAY	1	1	2010-03-30	1322	\N	40806	\N
43835	GENERIC_DAY	1	0	2010-05-14	1320	\N	40806	\N
43836	GENERIC_DAY	1	0	2010-04-19	2728	\N	40806	\N
43837	GENERIC_DAY	1	0	2010-04-07	19494	\N	40806	\N
43838	GENERIC_DAY	1	0	2010-05-20	1320	\N	40806	\N
43839	GENERIC_DAY	1	0	2010-04-27	19500	\N	40806	\N
43840	GENERIC_DAY	1	0	2010-04-22	19500	\N	40806	\N
43841	GENERIC_DAY	1	0	2010-04-30	1318	\N	40806	\N
43842	GENERIC_DAY	1	0	2010-05-09	1324	\N	40806	\N
43843	GENERIC_DAY	1	0	2010-05-23	1318	\N	40806	\N
43844	GENERIC_DAY	1	0	2010-04-14	1332	\N	40806	\N
43845	GENERIC_DAY	1	0	2010-05-05	19496	\N	40806	\N
43846	GENERIC_DAY	1	0	2010-04-17	19494	\N	40806	\N
43847	GENERIC_DAY	1	0	2010-04-02	1320	\N	40806	\N
43848	GENERIC_DAY	1	1	2010-05-25	2728	\N	40806	\N
43849	GENERIC_DAY	1	0	2010-05-09	19496	\N	40806	\N
43850	GENERIC_DAY	1	0	2010-03-17	1324	\N	40806	\N
43851	GENERIC_DAY	1	0	2010-05-08	1330	\N	40806	\N
43852	GENERIC_DAY	1	0	2010-04-19	1332	\N	40806	\N
43853	GENERIC_DAY	1	2	2010-03-24	1322	\N	40806	\N
43854	GENERIC_DAY	1	0	2010-03-26	19496	\N	40806	\N
43855	GENERIC_DAY	1	0	2010-03-31	19498	\N	40806	\N
43856	GENERIC_DAY	1	0	2010-04-26	19500	\N	40806	\N
43857	GENERIC_DAY	1	0	2010-04-27	1316	\N	40806	\N
43858	GENERIC_DAY	1	0	2010-05-11	19494	\N	40806	\N
43859	GENERIC_DAY	1	0	2010-05-02	19494	\N	40806	\N
43860	GENERIC_DAY	1	0	2010-03-20	1318	\N	40806	\N
43861	GENERIC_DAY	1	0	2010-04-29	19496	\N	40806	\N
42884	GENERIC_DAY	1	0	2010-04-01	1318	\N	40806	\N
42885	GENERIC_DAY	1	0	2010-04-20	1330	\N	40806	\N
42886	GENERIC_DAY	1	1	2010-04-13	19494	\N	40806	\N
42887	GENERIC_DAY	1	0	2010-04-27	19498	\N	40806	\N
42888	GENERIC_DAY	1	1	2010-05-03	1322	\N	40806	\N
42889	GENERIC_DAY	1	0	2010-04-25	1330	\N	40806	\N
42890	GENERIC_DAY	1	0	2010-03-26	1330	\N	40806	\N
42891	GENERIC_DAY	1	0	2010-05-04	1324	\N	40806	\N
42892	GENERIC_DAY	1	0	2010-04-18	1320	\N	40806	\N
42893	GENERIC_DAY	1	0	2010-05-10	1332	\N	40806	\N
42894	GENERIC_DAY	1	0	2010-04-02	19500	\N	40806	\N
42895	GENERIC_DAY	1	0	2010-04-17	1328	\N	40806	\N
87374	GENERIC_DAY	3	8	2010-05-24	1314	\N	20240	\N
87375	GENERIC_DAY	3	8	2010-05-18	1314	\N	20240	\N
87376	GENERIC_DAY	3	8	2010-05-10	1314	\N	20240	\N
87377	GENERIC_DAY	3	8	2010-05-05	1314	\N	20240	\N
87378	GENERIC_DAY	3	8	2010-05-14	1314	\N	20240	\N
87379	GENERIC_DAY	3	8	2010-05-21	1314	\N	20240	\N
87380	GENERIC_DAY	3	8	2010-04-30	1314	\N	20240	\N
87381	GENERIC_DAY	3	8	2010-05-12	1314	\N	20240	\N
87382	GENERIC_DAY	3	0	2010-04-18	1314	\N	20240	\N
87383	GENERIC_DAY	3	8	2010-04-28	1314	\N	20240	\N
87384	GENERIC_DAY	3	8	2010-05-03	1314	\N	20240	\N
87385	GENERIC_DAY	3	0	2010-04-24	1314	\N	20240	\N
87386	GENERIC_DAY	3	0	2010-05-15	1314	\N	20240	\N
87387	GENERIC_DAY	3	0	2010-04-25	1314	\N	20240	\N
87388	GENERIC_DAY	3	8	2010-04-29	1314	\N	20240	\N
87389	GENERIC_DAY	3	8	2010-04-21	1314	\N	20240	\N
87390	GENERIC_DAY	3	8	2010-04-22	1314	\N	20240	\N
87391	GENERIC_DAY	3	8	2010-04-26	1314	\N	20240	\N
87392	GENERIC_DAY	3	0	2010-05-23	1314	\N	20240	\N
87393	GENERIC_DAY	3	0	2010-05-09	1314	\N	20240	\N
87394	GENERIC_DAY	3	8	2010-04-19	1314	\N	20240	\N
87395	GENERIC_DAY	3	0	2010-05-08	1314	\N	20240	\N
87396	GENERIC_DAY	3	0	2010-04-17	1314	\N	20240	\N
87397	GENERIC_DAY	3	0	2010-05-22	1314	\N	20240	\N
87398	GENERIC_DAY	3	8	2010-05-13	1314	\N	20240	\N
87399	GENERIC_DAY	3	8	2010-05-06	1314	\N	20240	\N
87400	GENERIC_DAY	3	8	2010-05-20	1314	\N	20240	\N
87401	GENERIC_DAY	3	8	2010-05-19	1314	\N	20240	\N
87402	GENERIC_DAY	3	8	2010-05-07	1314	\N	20240	\N
87403	GENERIC_DAY	3	0	2010-05-01	1314	\N	20240	\N
87404	GENERIC_DAY	3	8	2010-04-27	1314	\N	20240	\N
87405	GENERIC_DAY	3	8	2010-04-23	1314	\N	20240	\N
87406	GENERIC_DAY	3	8	2010-05-04	1314	\N	20240	\N
87407	GENERIC_DAY	3	8	2010-04-20	1314	\N	20240	\N
87408	GENERIC_DAY	3	8	2010-05-11	1314	\N	20240	\N
87409	GENERIC_DAY	3	0	2010-05-16	1314	\N	20240	\N
87410	GENERIC_DAY	3	0	2010-05-02	1314	\N	20240	\N
87428	GENERIC_DAY	3	8	2010-05-27	1314	\N	20241	\N
87429	GENERIC_DAY	3	8	2010-05-25	1314	\N	20241	\N
87430	GENERIC_DAY	3	0	2010-05-29	1314	\N	20241	\N
87431	GENERIC_DAY	3	4	2010-06-10	1314	\N	20241	\N
87432	GENERIC_DAY	3	8	2010-05-26	1314	\N	20241	\N
87433	GENERIC_DAY	3	8	2010-06-09	1314	\N	20241	\N
87434	GENERIC_DAY	3	8	2010-06-03	1314	\N	20241	\N
87435	GENERIC_DAY	3	0	2010-06-05	1314	\N	20241	\N
87436	GENERIC_DAY	3	8	2010-06-08	1314	\N	20241	\N
87437	GENERIC_DAY	3	8	2010-06-07	1314	\N	20241	\N
87438	GENERIC_DAY	3	8	2010-06-02	1314	\N	20241	\N
87439	GENERIC_DAY	3	8	2010-05-28	1314	\N	20241	\N
87440	GENERIC_DAY	3	8	2010-05-31	1314	\N	20241	\N
87441	GENERIC_DAY	3	8	2010-06-04	1314	\N	20241	\N
87442	GENERIC_DAY	3	0	2010-05-30	1314	\N	20241	\N
87443	GENERIC_DAY	3	0	2010-06-06	1314	\N	20241	\N
87444	GENERIC_DAY	3	8	2010-06-01	1314	\N	20241	\N
37295	SPECIFIC_DAY	5	4	2010-03-03	19500	36168	\N	\N
37271	SPECIFIC_DAY	5	4	2010-05-10	19500	36168	\N	\N
37286	SPECIFIC_DAY	5	4	2010-03-22	19500	36168	\N	\N
37273	SPECIFIC_DAY	5	0	2010-05-15	19500	36168	\N	\N
36849	SPECIFIC_DAY	5	4	2010-03-16	19500	36168	\N	\N
37280	SPECIFIC_DAY	5	0	2010-04-17	19500	36168	\N	\N
37288	SPECIFIC_DAY	5	4	2010-04-05	19500	36168	\N	\N
36858	SPECIFIC_DAY	5	0	2010-04-03	19500	36168	\N	\N
36848	SPECIFIC_DAY	5	4	2010-03-01	19500	36168	\N	\N
36863	SPECIFIC_DAY	5	4	2010-03-30	19500	36168	\N	\N
36850	SPECIFIC_DAY	5	4	2010-03-25	19500	36168	\N	\N
36855	SPECIFIC_DAY	5	4	2010-04-15	19500	36168	\N	\N
36859	SPECIFIC_DAY	5	2	2010-03-12	19500	36168	\N	\N
37292	SPECIFIC_DAY	5	4	2010-03-24	19500	36168	\N	\N
37293	SPECIFIC_DAY	5	0	2010-03-27	19500	36168	\N	\N
37276	SPECIFIC_DAY	5	0	2010-03-20	19500	36168	\N	\N
37274	SPECIFIC_DAY	5	4	2010-04-14	19500	36168	\N	\N
37281	SPECIFIC_DAY	5	4	2010-04-08	19500	36168	\N	\N
37282	SPECIFIC_DAY	5	4	2010-04-29	19500	36168	\N	\N
37277	SPECIFIC_DAY	5	4	2010-03-23	19500	36168	\N	\N
36852	SPECIFIC_DAY	5	4	2010-04-22	19500	36168	\N	\N
36847	SPECIFIC_DAY	5	0	2010-03-13	19500	36168	\N	\N
36814	SPECIFIC_DAY	5	0	2010-04-18	19500	36168	\N	\N
36819	SPECIFIC_DAY	5	2	2010-04-02	19500	36168	\N	\N
37294	SPECIFIC_DAY	5	4	2010-04-12	19500	36168	\N	\N
36845	SPECIFIC_DAY	5	2	2010-05-19	19500	36168	\N	\N
36860	SPECIFIC_DAY	5	4	2010-03-04	19500	36168	\N	\N
36839	SPECIFIC_DAY	5	2	2010-04-09	19500	36168	\N	\N
37290	SPECIFIC_DAY	5	0	2010-04-24	19500	36168	\N	\N
36823	SPECIFIC_DAY	5	0	2010-03-28	19500	36168	\N	\N
37284	SPECIFIC_DAY	5	4	2010-05-18	19500	36168	\N	\N
36832	SPECIFIC_DAY	5	4	2010-05-04	19500	36168	\N	\N
37275	SPECIFIC_DAY	5	0	2010-04-11	19500	36168	\N	\N
37272	SPECIFIC_DAY	5	4	2010-04-26	19500	36168	\N	\N
37279	SPECIFIC_DAY	5	0	2010-03-21	19500	36168	\N	\N
36861	SPECIFIC_DAY	5	0	2010-03-06	19500	36168	\N	\N
37278	SPECIFIC_DAY	5	4	2010-03-11	19500	36168	\N	\N
36824	SPECIFIC_DAY	5	0	2010-05-03	19500	36168	\N	\N
37287	SPECIFIC_DAY	5	4	2010-03-18	19500	36168	\N	\N
36825	SPECIFIC_DAY	5	4	2010-03-10	19500	36168	\N	\N
36816	SPECIFIC_DAY	5	0	2010-05-01	19500	36168	\N	\N
37283	SPECIFIC_DAY	5	0	2010-03-07	19500	36168	\N	\N
37289	SPECIFIC_DAY	5	2	2010-03-26	19500	36168	\N	\N
37269	SPECIFIC_DAY	5	4	2010-03-08	19500	36168	\N	\N
36853	SPECIFIC_DAY	5	0	2010-04-10	19500	36168	\N	\N
37291	SPECIFIC_DAY	5	4	2010-04-07	19500	36168	\N	\N
36864	SPECIFIC_DAY	5	4	2010-04-20	19500	36168	\N	\N
36862	SPECIFIC_DAY	5	4	2010-03-29	19500	36168	\N	\N
36838	SPECIFIC_DAY	5	0	2010-05-16	19500	36168	\N	\N
36818	SPECIFIC_DAY	5	2	2010-03-19	19500	36168	\N	\N
36857	SPECIFIC_DAY	5	4	2010-05-12	19500	36168	\N	\N
36843	SPECIFIC_DAY	5	2	2010-04-16	19500	36168	\N	\N
36856	SPECIFIC_DAY	5	2	2010-04-23	19500	36168	\N	\N
37285	SPECIFIC_DAY	5	4	2010-04-01	19500	36168	\N	\N
36834	SPECIFIC_DAY	5	4	2010-05-13	19500	36168	\N	\N
36822	SPECIFIC_DAY	5	4	2010-05-06	19500	36168	\N	\N
37296	SPECIFIC_DAY	5	0	2010-05-17	19500	36168	\N	\N
36830	SPECIFIC_DAY	5	2	2010-04-30	19500	36168	\N	\N
36844	SPECIFIC_DAY	5	2	2010-05-14	19500	36168	\N	\N
36851	SPECIFIC_DAY	5	4	2010-04-06	19500	36168	\N	\N
36854	SPECIFIC_DAY	5	0	2010-05-09	19500	36168	\N	\N
36813	SPECIFIC_DAY	5	4	2010-04-13	19500	36168	\N	\N
37270	SPECIFIC_DAY	5	4	2010-03-15	19500	36168	\N	\N
87516	GENERIC_DAY	3	4	2010-07-28	1316	\N	20242	\N
87517	GENERIC_DAY	3	4	2010-09-14	1316	\N	20242	\N
87518	GENERIC_DAY	3	4	2010-09-10	1316	\N	20242	\N
87519	GENERIC_DAY	3	4	2010-08-02	1316	\N	20242	\N
87520	GENERIC_DAY	3	4	2010-07-22	1316	\N	20242	\N
87521	GENERIC_DAY	3	4	2010-08-23	1316	\N	20242	\N
87522	GENERIC_DAY	3	5	2010-06-30	1316	\N	20242	\N
87523	GENERIC_DAY	3	4	2010-08-16	1316	\N	20242	\N
87524	GENERIC_DAY	3	5	2010-06-16	1316	\N	20242	\N
87525	GENERIC_DAY	3	5	2010-06-14	1316	\N	20242	\N
87526	GENERIC_DAY	3	5	2010-06-21	1316	\N	20242	\N
87527	GENERIC_DAY	3	4	2010-09-09	1316	\N	20242	\N
87528	GENERIC_DAY	3	4	2010-09-13	1316	\N	20242	\N
87529	GENERIC_DAY	3	4	2010-07-14	1316	\N	20242	\N
87530	GENERIC_DAY	3	4	2010-07-08	1316	\N	20242	\N
87531	GENERIC_DAY	3	4	2010-08-05	1316	\N	20242	\N
87532	GENERIC_DAY	3	5	2010-06-17	1316	\N	20242	\N
87533	GENERIC_DAY	3	4	2010-07-30	1316	\N	20242	\N
87534	GENERIC_DAY	3	4	2010-07-12	1316	\N	20242	\N
87535	GENERIC_DAY	3	4	2010-08-18	1316	\N	20242	\N
87536	GENERIC_DAY	3	4	2010-07-26	1316	\N	20242	\N
87537	GENERIC_DAY	3	4	2010-08-13	1316	\N	20242	\N
87538	GENERIC_DAY	3	5	2010-06-28	1316	\N	20242	\N
87539	GENERIC_DAY	3	4	2010-09-01	1316	\N	20242	\N
87540	GENERIC_DAY	3	4	2010-08-24	1316	\N	20242	\N
87541	GENERIC_DAY	3	4	2010-07-29	1316	\N	20242	\N
87542	GENERIC_DAY	3	5	2010-06-23	1316	\N	20242	\N
87543	GENERIC_DAY	3	4	2010-09-02	1316	\N	20242	\N
87544	GENERIC_DAY	3	4	2010-08-09	1316	\N	20242	\N
87545	GENERIC_DAY	3	5	2010-06-18	1316	\N	20242	\N
87546	GENERIC_DAY	3	4	2010-09-06	1316	\N	20242	\N
87547	GENERIC_DAY	3	4	2010-09-16	1316	\N	20242	\N
87548	GENERIC_DAY	3	5	2010-06-15	1316	\N	20242	\N
87549	GENERIC_DAY	3	4	2010-07-21	1316	\N	20242	\N
87550	GENERIC_DAY	3	4	2010-08-17	1316	\N	20242	\N
87551	GENERIC_DAY	3	4	2010-07-09	1316	\N	20242	\N
87552	GENERIC_DAY	3	4	2010-09-08	1316	\N	20242	\N
87553	GENERIC_DAY	3	4	2010-08-19	1316	\N	20242	\N
87554	GENERIC_DAY	3	4	2010-09-17	1316	\N	20242	\N
87555	GENERIC_DAY	3	4	2010-09-03	1316	\N	20242	\N
87556	GENERIC_DAY	3	4	2010-08-11	1316	\N	20242	\N
87557	GENERIC_DAY	3	4	2010-07-19	1316	\N	20242	\N
87558	GENERIC_DAY	3	4	2010-07-06	1316	\N	20242	\N
87559	GENERIC_DAY	3	4	2010-07-23	1316	\N	20242	\N
87560	GENERIC_DAY	3	4	2010-08-30	1316	\N	20242	\N
87561	GENERIC_DAY	3	4	2010-08-25	1316	\N	20242	\N
87562	GENERIC_DAY	3	5	2010-06-11	1316	\N	20242	\N
87563	GENERIC_DAY	3	4	2010-08-27	1316	\N	20242	\N
87564	GENERIC_DAY	3	4	2010-07-05	1316	\N	20242	\N
87565	GENERIC_DAY	3	4	2010-07-16	1316	\N	20242	\N
87566	GENERIC_DAY	3	4	2010-07-13	1316	\N	20242	\N
87567	GENERIC_DAY	3	4	2010-07-15	1316	\N	20242	\N
87568	GENERIC_DAY	3	5	2010-07-02	1316	\N	20242	\N
87569	GENERIC_DAY	3	4	2010-07-27	1316	\N	20242	\N
87570	GENERIC_DAY	3	5	2010-06-22	1316	\N	20242	\N
87571	GENERIC_DAY	3	5	2010-06-24	1316	\N	20242	\N
87572	GENERIC_DAY	3	4	2010-07-20	1316	\N	20242	\N
87573	GENERIC_DAY	3	4	2010-09-07	1316	\N	20242	\N
87574	GENERIC_DAY	3	5	2010-07-01	1316	\N	20242	\N
87575	GENERIC_DAY	3	4	2010-08-04	1316	\N	20242	\N
87576	GENERIC_DAY	3	5	2010-06-25	1316	\N	20242	\N
87577	GENERIC_DAY	3	4	2010-08-06	1316	\N	20242	\N
87578	GENERIC_DAY	3	4	2010-07-07	1316	\N	20242	\N
87579	GENERIC_DAY	3	4	2010-08-10	1316	\N	20242	\N
87580	GENERIC_DAY	3	4	2010-09-15	1316	\N	20242	\N
87581	GENERIC_DAY	3	4	2010-08-12	1316	\N	20242	\N
87582	GENERIC_DAY	3	4	2010-08-26	1316	\N	20242	\N
87583	GENERIC_DAY	3	4	2010-08-31	1316	\N	20242	\N
87584	GENERIC_DAY	3	5	2010-06-29	1316	\N	20242	\N
87585	GENERIC_DAY	3	4	2010-08-03	1316	\N	20242	\N
87586	GENERIC_DAY	3	4	2010-08-20	1316	\N	20242	\N
59020	GENERIC_DAY	0	5	2010-08-31	1332	\N	36215	\N
59021	GENERIC_DAY	0	5	2010-08-05	1332	\N	36215	\N
59022	GENERIC_DAY	0	5	2010-07-21	1332	\N	36215	\N
59023	GENERIC_DAY	0	5	2010-08-25	1332	\N	36215	\N
59024	GENERIC_DAY	0	5	2010-08-02	1332	\N	36215	\N
59025	GENERIC_DAY	0	5	2010-08-17	1332	\N	36215	\N
59026	GENERIC_DAY	0	5	2010-08-30	1332	\N	36215	\N
59027	GENERIC_DAY	0	5	2010-09-22	1332	\N	36215	\N
59028	GENERIC_DAY	0	5	2010-08-09	1332	\N	36215	\N
59029	GENERIC_DAY	0	5	2010-10-06	1332	\N	36215	\N
59030	GENERIC_DAY	0	5	2010-09-06	1332	\N	36215	\N
59031	GENERIC_DAY	0	5	2010-07-20	1332	\N	36215	\N
59032	GENERIC_DAY	0	5	2010-08-12	1332	\N	36215	\N
59033	GENERIC_DAY	0	5	2010-08-04	1332	\N	36215	\N
59034	GENERIC_DAY	0	5	2010-08-24	1332	\N	36215	\N
59035	GENERIC_DAY	0	5	2010-09-16	1332	\N	36215	\N
59036	GENERIC_DAY	0	5	2010-09-15	1332	\N	36215	\N
59037	GENERIC_DAY	0	5	2010-09-23	1332	\N	36215	\N
59038	GENERIC_DAY	0	5	2010-09-27	1332	\N	36215	\N
59039	GENERIC_DAY	0	5	2010-08-19	1332	\N	36215	\N
59040	GENERIC_DAY	0	5	2010-09-13	1332	\N	36215	\N
59041	GENERIC_DAY	0	1	2010-07-16	1332	\N	36215	\N
59042	GENERIC_DAY	0	5	2010-09-29	1332	\N	36215	\N
59043	GENERIC_DAY	0	5	2010-08-03	1332	\N	36215	\N
59044	GENERIC_DAY	0	5	2010-07-19	1332	\N	36215	\N
59045	GENERIC_DAY	0	5	2010-09-02	1332	\N	36215	\N
59046	GENERIC_DAY	0	5	2010-08-10	1332	\N	36215	\N
59047	GENERIC_DAY	0	5	2010-09-30	1332	\N	36215	\N
59048	GENERIC_DAY	0	5	2010-08-26	1332	\N	36215	\N
59049	GENERIC_DAY	0	5	2010-09-21	1332	\N	36215	\N
59050	GENERIC_DAY	0	5	2010-09-01	1332	\N	36215	\N
59051	GENERIC_DAY	0	5	2010-10-07	1332	\N	36215	\N
59052	GENERIC_DAY	0	5	2010-08-16	1332	\N	36215	\N
59053	GENERIC_DAY	0	5	2010-10-04	1332	\N	36215	\N
59054	GENERIC_DAY	0	5	2010-09-14	1332	\N	36215	\N
59055	GENERIC_DAY	0	5	2010-09-09	1332	\N	36215	\N
59056	GENERIC_DAY	0	5	2010-09-28	1332	\N	36215	\N
59057	GENERIC_DAY	0	5	2010-08-18	1332	\N	36215	\N
59058	GENERIC_DAY	0	5	2010-09-20	1332	\N	36215	\N
59059	GENERIC_DAY	0	5	2010-07-22	1332	\N	36215	\N
59060	GENERIC_DAY	0	5	2010-08-11	1332	\N	36215	\N
59061	GENERIC_DAY	0	5	2010-09-07	1332	\N	36215	\N
59062	GENERIC_DAY	0	5	2010-08-23	1332	\N	36215	\N
59063	GENERIC_DAY	0	5	2010-10-05	1332	\N	36215	\N
59064	GENERIC_DAY	0	2	2010-08-27	1332	\N	36216	\N
59065	GENERIC_DAY	0	0	2010-08-15	1332	\N	36216	\N
59066	GENERIC_DAY	0	5	2010-07-22	1332	\N	36216	\N
59067	GENERIC_DAY	0	5	2010-08-16	1332	\N	36216	\N
59068	GENERIC_DAY	0	0	2010-08-14	1332	\N	36216	\N
59069	GENERIC_DAY	0	2	2010-07-23	1332	\N	36216	\N
59070	GENERIC_DAY	0	5	2010-08-11	1332	\N	36216	\N
59071	GENERIC_DAY	0	5	2010-07-20	1332	\N	36216	\N
59072	GENERIC_DAY	0	5	2010-08-19	1332	\N	36216	\N
59073	GENERIC_DAY	0	0	2010-07-24	1332	\N	36216	\N
59074	GENERIC_DAY	0	0	2010-07-25	1332	\N	36216	\N
59075	GENERIC_DAY	0	0	2010-08-28	1332	\N	36216	\N
59076	GENERIC_DAY	0	5	2010-07-19	1332	\N	36216	\N
59077	GENERIC_DAY	0	2	2010-07-16	1332	\N	36216	\N
59078	GENERIC_DAY	0	0	2010-07-18	1332	\N	36216	\N
59079	GENERIC_DAY	0	5	2010-08-10	1332	\N	36216	\N
59080	GENERIC_DAY	0	5	2010-08-05	1332	\N	36216	\N
59081	GENERIC_DAY	0	5	2010-08-12	1332	\N	36216	\N
59082	GENERIC_DAY	0	5	2010-08-24	1332	\N	36216	\N
59083	GENERIC_DAY	0	0	2010-08-07	1332	\N	36216	\N
59084	GENERIC_DAY	0	5	2010-08-26	1332	\N	36216	\N
59085	GENERIC_DAY	0	2	2010-08-13	1332	\N	36216	\N
59086	GENERIC_DAY	0	0	2010-08-08	1332	\N	36216	\N
59087	GENERIC_DAY	0	5	2010-08-02	1332	\N	36216	\N
59088	GENERIC_DAY	0	5	2010-08-25	1332	\N	36216	\N
59089	GENERIC_DAY	0	0	2010-08-29	1332	\N	36216	\N
59090	GENERIC_DAY	0	0	2010-07-17	1332	\N	36216	\N
59091	GENERIC_DAY	0	2	2010-08-20	1332	\N	36216	\N
59092	GENERIC_DAY	0	5	2010-08-18	1332	\N	36216	\N
59093	GENERIC_DAY	0	5	2010-08-30	1332	\N	36216	\N
59094	GENERIC_DAY	0	5	2010-07-21	1332	\N	36216	\N
59095	GENERIC_DAY	0	5	2010-08-17	1332	\N	36216	\N
59096	GENERIC_DAY	0	2	2010-08-06	1332	\N	36216	\N
59097	GENERIC_DAY	0	5	2010-08-03	1332	\N	36216	\N
59098	GENERIC_DAY	0	5	2010-08-23	1332	\N	36216	\N
59099	GENERIC_DAY	0	5	2010-08-09	1332	\N	36216	\N
59100	GENERIC_DAY	0	0	2010-08-22	1332	\N	36216	\N
59101	GENERIC_DAY	0	5	2010-08-04	1332	\N	36216	\N
59102	GENERIC_DAY	0	0	2010-08-21	1332	\N	36216	\N
59103	GENERIC_DAY	0	9	2010-04-15	1330	\N	36197	\N
59104	GENERIC_DAY	0	0	2010-04-11	1330	\N	36197	\N
59105	GENERIC_DAY	0	9	2010-04-07	1330	\N	36197	\N
59106	GENERIC_DAY	0	9	2010-04-08	1330	\N	36197	\N
59107	GENERIC_DAY	0	9	2010-04-28	1330	\N	36197	\N
59108	GENERIC_DAY	0	9	2010-05-04	1330	\N	36197	\N
59109	GENERIC_DAY	0	0	2010-05-17	1330	\N	36197	\N
59110	GENERIC_DAY	0	0	2010-05-08	1330	\N	36197	\N
59111	GENERIC_DAY	0	0	2010-04-03	1330	\N	36197	\N
59112	GENERIC_DAY	0	9	2010-03-22	1330	\N	36197	\N
59113	GENERIC_DAY	0	0	2010-04-24	1330	\N	36197	\N
59114	GENERIC_DAY	0	9	2010-05-18	1330	\N	36197	\N
59115	GENERIC_DAY	0	0	2010-04-18	1330	\N	36197	\N
59116	GENERIC_DAY	0	0	2010-05-09	1330	\N	36197	\N
59117	GENERIC_DAY	0	9	2010-04-12	1330	\N	36197	\N
59118	GENERIC_DAY	0	0	2010-05-15	1330	\N	36197	\N
59119	GENERIC_DAY	0	4	2010-04-23	1330	\N	36197	\N
59120	GENERIC_DAY	0	9	2010-03-24	1330	\N	36197	\N
59121	GENERIC_DAY	0	9	2010-03-31	1330	\N	36197	\N
59122	GENERIC_DAY	0	4	2010-05-07	1330	\N	36197	\N
59123	GENERIC_DAY	0	9	2010-04-27	1330	\N	36197	\N
59124	GENERIC_DAY	0	9	2010-05-10	1330	\N	36197	\N
59125	GENERIC_DAY	0	4	2010-04-30	1330	\N	36197	\N
59126	GENERIC_DAY	0	0	2010-05-16	1330	\N	36197	\N
59127	GENERIC_DAY	0	9	2010-05-13	1330	\N	36197	\N
59128	GENERIC_DAY	0	9	2010-04-19	1330	\N	36197	\N
59129	GENERIC_DAY	0	8	2010-05-24	1330	\N	36197	\N
59130	GENERIC_DAY	0	9	2010-04-13	1330	\N	36197	\N
59131	GENERIC_DAY	0	4	2010-05-21	1330	\N	36197	\N
59132	GENERIC_DAY	0	0	2010-05-23	1330	\N	36197	\N
59133	GENERIC_DAY	0	0	2010-05-02	1330	\N	36197	\N
59134	GENERIC_DAY	0	0	2010-03-28	1330	\N	36197	\N
59135	GENERIC_DAY	0	9	2010-05-06	1330	\N	36197	\N
59136	GENERIC_DAY	0	0	2010-03-27	1330	\N	36197	\N
59137	GENERIC_DAY	0	0	2010-04-25	1330	\N	36197	\N
59138	GENERIC_DAY	0	0	2010-05-22	1330	\N	36197	\N
59139	GENERIC_DAY	0	9	2010-03-23	1330	\N	36197	\N
59140	GENERIC_DAY	0	4	2010-04-09	1330	\N	36197	\N
59141	GENERIC_DAY	0	9	2010-05-05	1330	\N	36197	\N
59142	GENERIC_DAY	0	4	2010-04-02	1330	\N	36197	\N
59143	GENERIC_DAY	0	9	2010-04-22	1330	\N	36197	\N
59144	GENERIC_DAY	0	0	2010-05-01	1330	\N	36197	\N
59145	GENERIC_DAY	0	0	2010-04-10	1330	\N	36197	\N
59146	GENERIC_DAY	0	4	2010-03-26	1330	\N	36197	\N
59147	GENERIC_DAY	0	9	2010-05-19	1330	\N	36197	\N
59148	GENERIC_DAY	0	9	2010-04-05	1330	\N	36197	\N
59149	GENERIC_DAY	0	9	2010-04-26	1330	\N	36197	\N
59150	GENERIC_DAY	0	4	2010-04-16	1330	\N	36197	\N
59151	GENERIC_DAY	0	9	2010-05-12	1330	\N	36197	\N
59152	GENERIC_DAY	0	9	2010-04-01	1330	\N	36197	\N
59153	GENERIC_DAY	0	9	2010-04-14	1330	\N	36197	\N
59154	GENERIC_DAY	0	9	2010-04-06	1330	\N	36197	\N
59155	GENERIC_DAY	0	9	2010-03-25	1330	\N	36197	\N
59156	GENERIC_DAY	0	9	2010-04-20	1330	\N	36197	\N
59157	GENERIC_DAY	0	9	2010-03-29	1330	\N	36197	\N
59158	GENERIC_DAY	0	0	2010-04-04	1330	\N	36197	\N
59159	GENERIC_DAY	0	0	2010-04-17	1330	\N	36197	\N
59160	GENERIC_DAY	0	9	2010-04-21	1330	\N	36197	\N
59161	GENERIC_DAY	0	9	2010-05-20	1330	\N	36197	\N
59162	GENERIC_DAY	0	4	2010-05-14	1330	\N	36197	\N
59163	GENERIC_DAY	0	9	2010-03-30	1330	\N	36197	\N
59164	GENERIC_DAY	0	9	2010-05-11	1330	\N	36197	\N
59165	GENERIC_DAY	0	9	2010-04-29	1330	\N	36197	\N
59166	GENERIC_DAY	0	0	2010-06-13	1330	\N	36198	\N
59167	GENERIC_DAY	0	9	2010-06-03	1330	\N	36198	\N
59168	GENERIC_DAY	0	9	2010-06-02	1330	\N	36198	\N
59169	GENERIC_DAY	0	9	2010-06-16	1330	\N	36198	\N
59170	GENERIC_DAY	0	4	2010-05-28	1330	\N	36198	\N
59171	GENERIC_DAY	0	9	2010-06-17	1330	\N	36198	\N
59172	GENERIC_DAY	0	9	2010-05-31	1330	\N	36198	\N
59173	GENERIC_DAY	0	9	2010-06-01	1330	\N	36198	\N
59174	GENERIC_DAY	0	9	2010-06-14	1330	\N	36198	\N
59175	GENERIC_DAY	0	9	2010-06-24	1330	\N	36198	\N
59176	GENERIC_DAY	0	9	2010-06-28	1330	\N	36198	\N
59177	GENERIC_DAY	0	0	2010-06-05	1330	\N	36198	\N
59178	GENERIC_DAY	0	9	2010-05-25	1330	\N	36198	\N
59179	GENERIC_DAY	0	0	2010-05-30	1330	\N	36198	\N
59180	GENERIC_DAY	0	0	2010-06-26	1330	\N	36198	\N
59181	GENERIC_DAY	0	9	2010-06-21	1330	\N	36198	\N
59182	GENERIC_DAY	0	0	2010-06-19	1330	\N	36198	\N
59183	GENERIC_DAY	0	9	2010-06-07	1330	\N	36198	\N
59184	GENERIC_DAY	0	9	2010-05-26	1330	\N	36198	\N
59185	GENERIC_DAY	0	4	2010-06-11	1330	\N	36198	\N
59186	GENERIC_DAY	0	9	2010-06-09	1330	\N	36198	\N
59187	GENERIC_DAY	0	9	2010-06-08	1330	\N	36198	\N
59188	GENERIC_DAY	0	9	2010-06-23	1330	\N	36198	\N
59189	GENERIC_DAY	0	9	2010-06-15	1330	\N	36198	\N
59190	GENERIC_DAY	0	0	2010-06-06	1330	\N	36198	\N
59191	GENERIC_DAY	0	0	2010-06-20	1330	\N	36198	\N
59192	GENERIC_DAY	0	9	2010-06-10	1330	\N	36198	\N
59193	GENERIC_DAY	0	0	2010-06-12	1330	\N	36198	\N
59194	GENERIC_DAY	0	9	2010-05-27	1330	\N	36198	\N
59195	GENERIC_DAY	0	9	2010-06-22	1330	\N	36198	\N
59196	GENERIC_DAY	0	4	2010-06-18	1330	\N	36198	\N
59197	GENERIC_DAY	0	4	2010-06-04	1330	\N	36198	\N
59198	GENERIC_DAY	0	4	2010-06-25	1330	\N	36198	\N
59199	GENERIC_DAY	0	0	2010-06-27	1330	\N	36198	\N
59200	GENERIC_DAY	0	0	2010-05-29	1330	\N	36198	\N
59201	GENERIC_DAY	0	0	2010-07-10	1330	\N	36199	\N
59202	GENERIC_DAY	0	0	2010-07-04	1330	\N	36199	\N
59203	GENERIC_DAY	0	4	2010-07-02	1330	\N	36199	\N
59204	GENERIC_DAY	0	4	2010-07-09	1330	\N	36199	\N
59205	GENERIC_DAY	0	9	2010-07-05	1330	\N	36199	\N
59206	GENERIC_DAY	0	9	2010-07-14	1330	\N	36199	\N
59207	GENERIC_DAY	0	9	2010-06-30	1330	\N	36199	\N
59208	GENERIC_DAY	0	9	2010-07-08	1330	\N	36199	\N
59209	GENERIC_DAY	0	2	2010-07-15	1330	\N	36199	\N
59210	GENERIC_DAY	0	9	2010-07-13	1330	\N	36199	\N
59211	GENERIC_DAY	0	9	2010-06-29	1330	\N	36199	\N
59212	GENERIC_DAY	0	0	2010-07-03	1330	\N	36199	\N
59213	GENERIC_DAY	0	9	2010-07-07	1330	\N	36199	\N
59214	GENERIC_DAY	0	9	2010-07-01	1330	\N	36199	\N
59215	GENERIC_DAY	0	9	2010-07-12	1330	\N	36199	\N
59216	GENERIC_DAY	0	0	2010-07-11	1330	\N	36199	\N
59217	GENERIC_DAY	0	9	2010-07-06	1330	\N	36199	\N
87607	GENERIC_DAY	3	3	2010-06-18	1316	\N	20243	\N
87608	GENERIC_DAY	3	3	2010-06-11	1316	\N	20243	\N
87609	GENERIC_DAY	3	3	2010-06-17	1316	\N	20243	\N
87610	GENERIC_DAY	3	0	2010-06-19	1316	\N	20243	\N
87611	GENERIC_DAY	3	0	2010-06-20	1316	\N	20243	\N
87612	GENERIC_DAY	3	3	2010-06-14	1316	\N	20243	\N
87613	GENERIC_DAY	3	3	2010-06-29	1316	\N	20243	\N
87614	GENERIC_DAY	3	0	2010-06-26	1316	\N	20243	\N
87615	GENERIC_DAY	3	3	2010-06-16	1316	\N	20243	\N
87616	GENERIC_DAY	3	3	2010-06-24	1316	\N	20243	\N
87617	GENERIC_DAY	3	3	2010-06-28	1316	\N	20243	\N
87618	GENERIC_DAY	3	3	2010-06-30	1316	\N	20243	\N
87619	GENERIC_DAY	3	0	2010-06-13	1316	\N	20243	\N
87620	GENERIC_DAY	3	3	2010-06-25	1316	\N	20243	\N
87621	GENERIC_DAY	3	3	2010-06-22	1316	\N	20243	\N
87622	GENERIC_DAY	3	0	2010-06-12	1316	\N	20243	\N
87623	GENERIC_DAY	3	3	2010-06-23	1316	\N	20243	\N
87624	GENERIC_DAY	3	0	2010-06-27	1316	\N	20243	\N
87625	GENERIC_DAY	3	3	2010-06-21	1316	\N	20243	\N
87626	GENERIC_DAY	3	3	2010-06-15	1316	\N	20243	\N
87697	GENERIC_DAY	3	4	2010-11-17	1316	\N	20246	\N
87698	GENERIC_DAY	3	4	2010-12-07	1316	\N	20246	\N
87699	GENERIC_DAY	3	4	2010-11-22	1316	\N	20246	\N
87700	GENERIC_DAY	3	4	2010-10-18	1316	\N	20246	\N
87701	GENERIC_DAY	3	4	2010-11-29	1316	\N	20246	\N
87702	GENERIC_DAY	3	4	2010-12-21	1316	\N	20246	\N
87703	GENERIC_DAY	3	4	2010-11-11	1316	\N	20246	\N
87704	GENERIC_DAY	3	0	2010-12-19	1316	\N	20246	\N
87705	GENERIC_DAY	3	4	2010-11-01	1316	\N	20246	\N
87706	GENERIC_DAY	3	4	2010-10-22	1316	\N	20246	\N
87707	GENERIC_DAY	3	0	2010-12-11	1316	\N	20246	\N
87708	GENERIC_DAY	3	4	2010-12-10	1316	\N	20246	\N
87709	GENERIC_DAY	3	0	2010-11-28	1316	\N	20246	\N
87710	GENERIC_DAY	3	0	2010-10-31	1316	\N	20246	\N
87711	GENERIC_DAY	3	4	2010-10-28	1316	\N	20246	\N
87712	GENERIC_DAY	3	4	2010-12-20	1316	\N	20246	\N
87713	GENERIC_DAY	3	4	2010-12-13	1316	\N	20246	\N
87714	GENERIC_DAY	3	0	2010-11-06	1316	\N	20246	\N
87715	GENERIC_DAY	3	4	2010-11-18	1316	\N	20246	\N
87716	GENERIC_DAY	3	4	2010-11-10	1316	\N	20246	\N
87717	GENERIC_DAY	3	4	2010-10-21	1316	\N	20246	\N
87718	GENERIC_DAY	3	4	2010-11-09	1316	\N	20246	\N
87719	GENERIC_DAY	3	4	2010-12-01	1316	\N	20246	\N
87720	GENERIC_DAY	3	0	2010-10-24	1316	\N	20246	\N
87721	GENERIC_DAY	3	4	2010-10-19	1316	\N	20246	\N
87722	GENERIC_DAY	3	4	2010-11-25	1316	\N	20246	\N
87723	GENERIC_DAY	3	4	2010-12-14	1316	\N	20246	\N
87724	GENERIC_DAY	3	4	2010-11-03	1316	\N	20246	\N
87725	GENERIC_DAY	3	0	2010-11-21	1316	\N	20246	\N
87726	GENERIC_DAY	3	0	2010-12-04	1316	\N	20246	\N
87727	GENERIC_DAY	3	0	2010-11-27	1316	\N	20246	\N
87728	GENERIC_DAY	3	4	2010-12-15	1316	\N	20246	\N
87729	GENERIC_DAY	3	4	2010-11-15	1316	\N	20246	\N
87730	GENERIC_DAY	3	4	2010-11-08	1316	\N	20246	\N
87731	GENERIC_DAY	3	0	2010-11-13	1316	\N	20246	\N
87732	GENERIC_DAY	3	4	2010-12-17	1316	\N	20246	\N
87733	GENERIC_DAY	3	4	2010-12-03	1316	\N	20246	\N
87734	GENERIC_DAY	3	4	2010-11-12	1316	\N	20246	\N
87735	GENERIC_DAY	3	4	2010-10-29	1316	\N	20246	\N
87736	GENERIC_DAY	3	4	2010-11-04	1316	\N	20246	\N
87737	GENERIC_DAY	3	4	2010-12-16	1316	\N	20246	\N
87738	GENERIC_DAY	3	4	2010-11-24	1316	\N	20246	\N
87739	GENERIC_DAY	3	4	2010-11-05	1316	\N	20246	\N
87740	GENERIC_DAY	3	4	2010-11-23	1316	\N	20246	\N
87741	GENERIC_DAY	3	0	2010-10-16	1316	\N	20246	\N
87742	GENERIC_DAY	3	0	2010-11-07	1316	\N	20246	\N
87743	GENERIC_DAY	3	4	2010-11-26	1316	\N	20246	\N
87744	GENERIC_DAY	3	4	2010-12-08	1316	\N	20246	\N
87745	GENERIC_DAY	3	4	2010-12-09	1316	\N	20246	\N
87746	GENERIC_DAY	3	4	2010-10-27	1316	\N	20246	\N
87747	GENERIC_DAY	3	4	2010-11-19	1316	\N	20246	\N
87748	GENERIC_DAY	3	0	2010-10-23	1316	\N	20246	\N
87749	GENERIC_DAY	3	0	2010-11-14	1316	\N	20246	\N
87750	GENERIC_DAY	3	4	2010-10-26	1316	\N	20246	\N
87751	GENERIC_DAY	3	0	2010-10-17	1316	\N	20246	\N
87752	GENERIC_DAY	3	4	2010-10-20	1316	\N	20246	\N
87753	GENERIC_DAY	3	4	2010-12-23	1316	\N	20246	\N
87754	GENERIC_DAY	3	0	2010-10-30	1316	\N	20246	\N
87755	GENERIC_DAY	3	0	2010-12-05	1316	\N	20246	\N
87756	GENERIC_DAY	3	4	2010-12-22	1316	\N	20246	\N
87757	GENERIC_DAY	3	4	2010-11-02	1316	\N	20246	\N
87758	GENERIC_DAY	3	4	2010-10-25	1316	\N	20246	\N
87759	GENERIC_DAY	3	4	2010-11-30	1316	\N	20246	\N
87760	GENERIC_DAY	3	0	2010-12-18	1316	\N	20246	\N
87761	GENERIC_DAY	3	0	2010-11-20	1316	\N	20246	\N
87762	GENERIC_DAY	3	4	2010-11-16	1316	\N	20246	\N
87763	GENERIC_DAY	3	4	2010-10-15	1316	\N	20246	\N
87764	GENERIC_DAY	3	0	2010-12-12	1316	\N	20246	\N
87765	GENERIC_DAY	3	4	2010-12-06	1316	\N	20246	\N
87766	GENERIC_DAY	3	4	2010-12-02	1316	\N	20246	\N
61753	GENERIC_DAY	1	0	2010-05-08	1326	\N	30498	\N
61752	GENERIC_DAY	1	9	2010-03-22	1326	\N	30498	\N
61751	GENERIC_DAY	1	9	2010-04-08	1326	\N	30498	\N
61757	GENERIC_DAY	1	3	2010-05-21	1326	\N	30498	\N
61758	GENERIC_DAY	1	0	2010-04-17	1326	\N	30498	\N
61748	GENERIC_DAY	1	4	2010-05-07	1326	\N	30498	\N
61747	GENERIC_DAY	1	9	2010-03-23	1326	\N	30498	\N
61754	GENERIC_DAY	1	9	2010-04-07	1326	\N	30498	\N
61755	GENERIC_DAY	1	0	2010-04-24	1326	\N	30498	\N
61750	GENERIC_DAY	1	9	2010-04-29	1326	\N	30498	\N
61749	GENERIC_DAY	1	4	2010-05-14	1326	\N	30498	\N
61746	GENERIC_DAY	1	9	2010-04-13	1326	\N	30498	\N
61745	GENERIC_DAY	1	9	2010-04-20	1326	\N	30498	\N
61756	GENERIC_DAY	1	0	2010-03-27	1326	\N	30498	\N
89446	GENERIC_DAY	0	9	2010-06-03	1326	\N	30499	\N
89447	GENERIC_DAY	0	9	2010-06-15	1326	\N	30499	\N
89448	GENERIC_DAY	0	9	2010-06-09	1326	\N	30499	\N
89449	GENERIC_DAY	0	9	2010-06-08	1326	\N	30499	\N
89450	GENERIC_DAY	0	9	2010-05-24	1326	\N	30499	\N
89451	GENERIC_DAY	0	9	2010-06-24	1326	\N	30499	\N
89452	GENERIC_DAY	0	0	2010-05-30	1326	\N	30499	\N
89453	GENERIC_DAY	0	0	2010-06-06	1326	\N	30499	\N
89454	GENERIC_DAY	0	9	2010-06-10	1326	\N	30499	\N
89455	GENERIC_DAY	0	9	2010-06-17	1326	\N	30499	\N
89456	GENERIC_DAY	0	9	2010-05-26	1326	\N	30499	\N
89457	GENERIC_DAY	0	9	2010-06-16	1326	\N	30499	\N
89458	GENERIC_DAY	0	4	2010-06-04	1326	\N	30499	\N
89459	GENERIC_DAY	0	9	2010-06-23	1326	\N	30499	\N
89460	GENERIC_DAY	0	0	2010-05-22	1326	\N	30499	\N
89461	GENERIC_DAY	0	4	2010-06-25	1326	\N	30499	\N
89462	GENERIC_DAY	0	9	2010-05-25	1326	\N	30499	\N
89463	GENERIC_DAY	0	4	2010-06-18	1326	\N	30499	\N
89464	GENERIC_DAY	0	0	2010-06-19	1326	\N	30499	\N
89465	GENERIC_DAY	0	0	2010-06-05	1326	\N	30499	\N
89466	GENERIC_DAY	0	9	2010-06-07	1326	\N	30499	\N
89467	GENERIC_DAY	0	4	2010-06-11	1326	\N	30499	\N
89468	GENERIC_DAY	0	4	2010-05-28	1326	\N	30499	\N
89469	GENERIC_DAY	0	9	2010-06-22	1326	\N	30499	\N
89470	GENERIC_DAY	0	0	2010-05-23	1326	\N	30499	\N
89471	GENERIC_DAY	0	0	2010-05-29	1326	\N	30499	\N
89472	GENERIC_DAY	0	9	2010-05-27	1326	\N	30499	\N
89473	GENERIC_DAY	0	9	2010-06-02	1326	\N	30499	\N
89474	GENERIC_DAY	0	9	2010-05-31	1326	\N	30499	\N
89475	GENERIC_DAY	0	0	2010-06-12	1326	\N	30499	\N
89476	GENERIC_DAY	0	9	2010-06-21	1326	\N	30499	\N
89477	GENERIC_DAY	0	9	2010-06-14	1326	\N	30499	\N
89478	GENERIC_DAY	0	0	2010-06-20	1326	\N	30499	\N
89479	GENERIC_DAY	0	9	2010-06-01	1326	\N	30499	\N
89480	GENERIC_DAY	0	0	2010-06-13	1326	\N	30499	\N
89481	GENERIC_DAY	0	0	2010-07-17	1326	\N	30500	\N
89482	GENERIC_DAY	0	9	2010-06-29	1326	\N	30500	\N
89483	GENERIC_DAY	0	4	2010-07-16	1326	\N	30500	\N
89484	GENERIC_DAY	0	2	2010-07-21	1326	\N	30500	\N
89485	GENERIC_DAY	0	9	2010-07-15	1326	\N	30500	\N
89486	GENERIC_DAY	0	0	2010-07-04	1326	\N	30500	\N
89487	GENERIC_DAY	0	9	2010-06-28	1326	\N	30500	\N
89488	GENERIC_DAY	0	0	2010-07-03	1326	\N	30500	\N
89489	GENERIC_DAY	0	9	2010-06-30	1326	\N	30500	\N
89490	GENERIC_DAY	0	4	2010-07-02	1326	\N	30500	\N
89491	GENERIC_DAY	0	9	2010-07-01	1326	\N	30500	\N
89492	GENERIC_DAY	0	9	2010-07-14	1326	\N	30500	\N
89493	GENERIC_DAY	0	9	2010-07-12	1326	\N	30500	\N
89494	GENERIC_DAY	0	0	2010-06-26	1326	\N	30500	\N
89495	GENERIC_DAY	0	0	2010-07-18	1326	\N	30500	\N
89496	GENERIC_DAY	0	9	2010-07-19	1326	\N	30500	\N
89497	GENERIC_DAY	0	9	2010-07-20	1326	\N	30500	\N
89498	GENERIC_DAY	0	9	2010-07-13	1326	\N	30500	\N
89499	GENERIC_DAY	0	0	2010-06-27	1326	\N	30500	\N
89500	GENERIC_DAY	0	6	2010-08-23	1328	\N	36161	\N
89501	GENERIC_DAY	0	6	2010-10-07	1328	\N	36161	\N
89502	GENERIC_DAY	0	6	2010-08-19	1328	\N	36161	\N
89503	GENERIC_DAY	0	1	2010-10-01	1328	\N	36161	\N
89504	GENERIC_DAY	0	6	2010-09-15	1328	\N	36161	\N
89505	GENERIC_DAY	0	6	2010-08-25	1328	\N	36161	\N
89506	GENERIC_DAY	0	6	2010-08-09	1328	\N	36161	\N
89507	GENERIC_DAY	0	6	2010-08-10	1328	\N	36161	\N
89508	GENERIC_DAY	0	6	2010-10-12	1328	\N	36161	\N
89509	GENERIC_DAY	0	7	2010-07-26	1328	\N	36161	\N
89510	GENERIC_DAY	0	6	2010-09-22	1328	\N	36161	\N
89511	GENERIC_DAY	0	6	2010-09-07	1328	\N	36161	\N
89512	GENERIC_DAY	0	6	2010-10-06	1328	\N	36161	\N
89513	GENERIC_DAY	0	6	2010-10-05	1328	\N	36161	\N
89514	GENERIC_DAY	0	7	2010-07-29	1328	\N	36161	\N
89515	GENERIC_DAY	0	6	2010-08-30	1328	\N	36161	\N
89516	GENERIC_DAY	0	2	2010-07-23	1328	\N	36161	\N
89517	GENERIC_DAY	0	6	2010-08-04	1328	\N	36161	\N
89518	GENERIC_DAY	0	6	2010-08-24	1328	\N	36161	\N
89519	GENERIC_DAY	0	6	2010-08-31	1328	\N	36161	\N
89520	GENERIC_DAY	0	1	2010-09-17	1328	\N	36161	\N
89521	GENERIC_DAY	0	6	2010-09-13	1328	\N	36161	\N
89522	GENERIC_DAY	0	6	2010-09-09	1328	\N	36161	\N
89523	GENERIC_DAY	0	6	2010-09-06	1328	\N	36161	\N
89524	GENERIC_DAY	0	1	2010-08-13	1328	\N	36161	\N
89525	GENERIC_DAY	0	6	2010-10-04	1328	\N	36161	\N
89526	GENERIC_DAY	0	1	2010-08-20	1328	\N	36161	\N
89527	GENERIC_DAY	0	1	2010-08-27	1328	\N	36161	\N
89528	GENERIC_DAY	0	6	2010-08-17	1328	\N	36161	\N
89529	GENERIC_DAY	0	1	2010-09-24	1328	\N	36161	\N
89530	GENERIC_DAY	0	6	2010-09-01	1328	\N	36161	\N
89531	GENERIC_DAY	0	6	2010-08-02	1328	\N	36161	\N
89532	GENERIC_DAY	0	6	2010-08-03	1328	\N	36161	\N
89533	GENERIC_DAY	0	7	2010-07-27	1328	\N	36161	\N
89534	GENERIC_DAY	0	6	2010-08-11	1328	\N	36161	\N
89535	GENERIC_DAY	0	6	2010-08-16	1328	\N	36161	\N
89536	GENERIC_DAY	0	6	2010-08-12	1328	\N	36161	\N
89537	GENERIC_DAY	0	6	2010-10-11	1328	\N	36161	\N
89538	GENERIC_DAY	0	6	2010-09-29	1328	\N	36161	\N
89539	GENERIC_DAY	0	6	2010-08-05	1328	\N	36161	\N
89540	GENERIC_DAY	0	7	2010-07-22	1328	\N	36161	\N
89541	GENERIC_DAY	0	1	2010-10-08	1328	\N	36161	\N
89542	GENERIC_DAY	0	7	2010-07-28	1328	\N	36161	\N
89543	GENERIC_DAY	0	6	2010-09-02	1328	\N	36161	\N
89544	GENERIC_DAY	0	6	2010-09-30	1328	\N	36161	\N
89545	GENERIC_DAY	0	6	2010-09-21	1328	\N	36161	\N
89546	GENERIC_DAY	0	6	2010-08-18	1328	\N	36161	\N
89547	GENERIC_DAY	0	6	2010-09-20	1328	\N	36161	\N
89548	GENERIC_DAY	0	6	2010-08-26	1328	\N	36161	\N
89549	GENERIC_DAY	0	6	2010-09-14	1328	\N	36161	\N
89550	GENERIC_DAY	0	6	2010-09-23	1328	\N	36161	\N
89551	GENERIC_DAY	0	6	2010-09-08	1328	\N	36161	\N
89552	GENERIC_DAY	0	1	2010-09-03	1328	\N	36161	\N
89553	GENERIC_DAY	0	6	2010-09-27	1328	\N	36161	\N
89554	GENERIC_DAY	0	6	2010-09-16	1328	\N	36161	\N
89555	GENERIC_DAY	0	1	2010-08-06	1328	\N	36161	\N
89556	GENERIC_DAY	0	1	2010-07-30	1328	\N	36161	\N
89557	GENERIC_DAY	0	6	2010-09-28	1328	\N	36161	\N
89558	GENERIC_DAY	0	1	2010-09-10	1328	\N	36161	\N
89559	GENERIC_DAY	0	5	2010-08-10	1328	\N	36164	\N
89560	GENERIC_DAY	0	2	2010-08-13	1328	\N	36164	\N
89561	GENERIC_DAY	0	0	2010-08-21	1328	\N	36164	\N
89562	GENERIC_DAY	0	5	2010-07-27	1328	\N	36164	\N
89563	GENERIC_DAY	0	0	2010-08-22	1328	\N	36164	\N
89564	GENERIC_DAY	0	0	2010-08-15	1328	\N	36164	\N
89565	GENERIC_DAY	0	5	2010-08-24	1328	\N	36164	\N
89566	GENERIC_DAY	0	0	2010-08-07	1328	\N	36164	\N
89567	GENERIC_DAY	0	5	2010-08-12	1328	\N	36164	\N
89568	GENERIC_DAY	0	0	2010-08-01	1328	\N	36164	\N
89569	GENERIC_DAY	0	5	2010-08-05	1328	\N	36164	\N
89570	GENERIC_DAY	0	0	2010-08-28	1328	\N	36164	\N
89571	GENERIC_DAY	0	0	2010-07-31	1328	\N	36164	\N
89572	GENERIC_DAY	0	5	2010-08-19	1328	\N	36164	\N
89573	GENERIC_DAY	0	2	2010-08-27	1328	\N	36164	\N
89574	GENERIC_DAY	0	0	2010-08-08	1328	\N	36164	\N
89575	GENERIC_DAY	0	5	2010-07-29	1328	\N	36164	\N
89576	GENERIC_DAY	0	5	2010-08-25	1328	\N	36164	\N
89577	GENERIC_DAY	0	5	2010-08-18	1328	\N	36164	\N
89578	GENERIC_DAY	0	5	2010-08-16	1328	\N	36164	\N
89579	GENERIC_DAY	0	0	2010-07-25	1328	\N	36164	\N
89580	GENERIC_DAY	0	5	2010-08-11	1328	\N	36164	\N
89581	GENERIC_DAY	0	2	2010-08-06	1328	\N	36164	\N
89582	GENERIC_DAY	0	5	2010-08-09	1328	\N	36164	\N
89583	GENERIC_DAY	0	5	2010-07-22	1328	\N	36164	\N
89584	GENERIC_DAY	0	5	2010-08-17	1328	\N	36164	\N
89585	GENERIC_DAY	0	5	2010-07-28	1328	\N	36164	\N
89586	GENERIC_DAY	0	2	2010-07-23	1328	\N	36164	\N
89587	GENERIC_DAY	0	0	2010-08-29	1328	\N	36164	\N
89588	GENERIC_DAY	0	0	2010-08-14	1328	\N	36164	\N
89589	GENERIC_DAY	0	2	2010-07-30	1328	\N	36164	\N
89590	GENERIC_DAY	0	5	2010-08-04	1328	\N	36164	\N
89591	GENERIC_DAY	0	5	2010-07-26	1328	\N	36164	\N
45554	GENERIC_DAY	0	0	2010-06-18	19498	\N	40809	\N
45555	GENERIC_DAY	0	0	2010-06-22	1324	\N	40809	\N
45556	GENERIC_DAY	0	0	2010-05-26	1318	\N	40809	\N
45557	GENERIC_DAY	0	0	2010-06-12	1316	\N	40809	\N
45558	GENERIC_DAY	0	0	2010-06-25	1318	\N	40809	\N
45559	GENERIC_DAY	0	0	2010-06-11	1316	\N	40809	\N
45560	GENERIC_DAY	0	0	2010-07-03	1314	\N	40809	\N
45561	GENERIC_DAY	0	0	2010-07-06	1320	\N	40809	\N
45562	GENERIC_DAY	0	0	2010-06-19	19498	\N	40809	\N
45563	GENERIC_DAY	0	0	2010-07-07	19498	\N	40809	\N
45564	GENERIC_DAY	0	0	2010-06-06	1314	\N	40809	\N
45565	GENERIC_DAY	0	0	2010-06-15	1320	\N	40809	\N
45566	GENERIC_DAY	0	0	2010-05-30	1320	\N	40809	\N
45567	GENERIC_DAY	0	0	2010-06-16	1328	\N	40809	\N
45568	GENERIC_DAY	0	0	2010-06-17	1316	\N	40809	\N
45569	GENERIC_DAY	0	0	2010-05-26	1332	\N	40809	\N
45570	GENERIC_DAY	0	1	2010-06-09	1322	\N	40809	\N
45571	GENERIC_DAY	0	0	2010-06-12	19500	\N	40809	\N
45572	GENERIC_DAY	0	0	2010-06-06	1330	\N	40809	\N
45573	GENERIC_DAY	0	0	2010-06-07	19498	\N	40809	\N
45574	GENERIC_DAY	0	0	2010-07-09	2728	\N	40809	\N
45575	GENERIC_DAY	0	0	2010-06-23	1318	\N	40809	\N
45576	GENERIC_DAY	0	0	2010-06-05	1318	\N	40809	\N
45577	GENERIC_DAY	0	0	2010-06-17	1332	\N	40809	\N
45578	GENERIC_DAY	0	0	2010-07-12	1324	\N	40809	\N
45579	GENERIC_DAY	0	0	2010-05-28	19500	\N	40809	\N
45580	GENERIC_DAY	0	0	2010-07-03	2728	\N	40809	\N
45581	GENERIC_DAY	0	1	2010-05-27	2728	\N	40809	\N
45582	GENERIC_DAY	0	0	2010-06-20	1322	\N	40809	\N
45583	GENERIC_DAY	0	0	2010-05-26	1324	\N	40809	\N
45584	GENERIC_DAY	0	0	2010-06-29	1318	\N	40809	\N
45585	GENERIC_DAY	0	0	2010-05-28	1330	\N	40809	\N
45586	GENERIC_DAY	0	0	2010-06-30	19494	\N	40809	\N
45587	GENERIC_DAY	0	0	2010-06-23	1324	\N	40809	\N
45588	GENERIC_DAY	0	0	2010-06-16	19496	\N	40809	\N
45589	GENERIC_DAY	0	0	2010-06-28	1330	\N	40809	\N
45590	GENERIC_DAY	0	0	2010-07-03	19498	\N	40809	\N
45591	GENERIC_DAY	0	0	2010-06-02	1326	\N	40809	\N
45592	GENERIC_DAY	0	0	2010-06-10	1330	\N	40809	\N
45593	GENERIC_DAY	0	0	2010-06-30	1316	\N	40809	\N
45594	GENERIC_DAY	0	0	2010-06-25	19494	\N	40809	\N
45595	GENERIC_DAY	0	1	2010-06-02	2728	\N	40809	\N
45596	GENERIC_DAY	0	0	2010-06-01	1324	\N	40809	\N
45597	GENERIC_DAY	0	0	2010-05-29	1326	\N	40809	\N
45598	GENERIC_DAY	0	0	2010-07-10	1332	\N	40809	\N
45599	GENERIC_DAY	0	0	2010-07-06	19500	\N	40809	\N
45600	GENERIC_DAY	0	0	2010-06-17	1318	\N	40809	\N
45601	GENERIC_DAY	0	0	2010-07-08	1332	\N	40809	\N
45602	GENERIC_DAY	0	0	2010-06-16	1324	\N	40809	\N
45603	GENERIC_DAY	0	0	2010-06-12	2728	\N	40809	\N
45604	GENERIC_DAY	0	0	2010-06-13	19496	\N	40809	\N
45605	GENERIC_DAY	0	0	2010-06-13	1332	\N	40809	\N
45606	GENERIC_DAY	0	0	2010-06-14	19494	\N	40809	\N
45607	GENERIC_DAY	0	0	2010-06-04	1318	\N	40809	\N
45608	GENERIC_DAY	0	0	2010-07-10	1322	\N	40809	\N
45609	GENERIC_DAY	0	1	2010-07-07	1314	\N	40809	\N
45610	GENERIC_DAY	0	1	2010-06-01	1322	\N	40809	\N
45611	GENERIC_DAY	0	0	2010-05-27	1318	\N	40809	\N
45612	GENERIC_DAY	0	0	2010-07-05	1332	\N	40809	\N
45613	GENERIC_DAY	0	0	2010-05-30	19496	\N	40809	\N
45614	GENERIC_DAY	0	0	2010-06-20	1330	\N	40809	\N
45615	GENERIC_DAY	0	0	2010-06-04	1324	\N	40809	\N
45616	GENERIC_DAY	0	0	2010-07-09	1332	\N	40809	\N
45617	GENERIC_DAY	0	0	2010-07-03	19494	\N	40809	\N
45618	GENERIC_DAY	0	0	2010-06-04	2728	\N	40809	\N
45619	GENERIC_DAY	0	0	2010-06-29	1328	\N	40809	\N
45620	GENERIC_DAY	0	0	2010-06-21	1318	\N	40809	\N
45621	GENERIC_DAY	0	0	2010-07-05	19496	\N	40809	\N
45622	GENERIC_DAY	0	0	2010-05-29	19500	\N	40809	\N
45623	GENERIC_DAY	0	0	2010-07-03	1330	\N	40809	\N
45624	GENERIC_DAY	0	0	2010-07-03	1328	\N	40809	\N
45625	GENERIC_DAY	0	1	2010-06-21	2728	\N	40809	\N
45626	GENERIC_DAY	0	0	2010-06-09	1314	\N	40809	\N
45627	GENERIC_DAY	0	0	2010-07-06	1328	\N	40809	\N
45628	GENERIC_DAY	0	0	2010-07-11	1322	\N	40809	\N
45629	GENERIC_DAY	0	0	2010-06-08	1328	\N	40809	\N
45630	GENERIC_DAY	0	0	2010-07-11	19494	\N	40809	\N
45631	GENERIC_DAY	0	1	2010-05-31	1322	\N	40809	\N
45632	GENERIC_DAY	0	0	2010-06-23	1328	\N	40809	\N
45633	GENERIC_DAY	0	0	2010-05-30	1322	\N	40809	\N
45634	GENERIC_DAY	0	1	2010-06-14	1322	\N	40809	\N
45635	GENERIC_DAY	0	1	2010-07-09	1318	\N	40809	\N
45636	GENERIC_DAY	0	0	2010-06-01	1320	\N	40809	\N
45637	GENERIC_DAY	0	1	2010-06-09	19494	\N	40809	\N
45638	GENERIC_DAY	0	1	2010-07-09	1322	\N	40809	\N
45639	GENERIC_DAY	0	0	2010-07-03	19496	\N	40809	\N
45640	GENERIC_DAY	0	1	2010-07-06	1322	\N	40809	\N
45641	GENERIC_DAY	0	0	2010-06-16	1326	\N	40809	\N
45642	GENERIC_DAY	0	0	2010-07-10	1314	\N	40809	\N
45643	GENERIC_DAY	0	0	2010-06-03	1328	\N	40809	\N
45644	GENERIC_DAY	0	0	2010-06-01	1326	\N	40809	\N
45645	GENERIC_DAY	0	0	2010-06-03	19496	\N	40809	\N
45646	GENERIC_DAY	0	0	2010-07-08	19500	\N	40809	\N
45647	GENERIC_DAY	0	0	2010-06-17	19496	\N	40809	\N
45648	GENERIC_DAY	0	0	2010-07-09	19498	\N	40809	\N
45649	GENERIC_DAY	0	0	2010-06-16	1320	\N	40809	\N
45650	GENERIC_DAY	0	0	2010-06-06	19496	\N	40809	\N
45651	GENERIC_DAY	0	0	2010-06-01	1330	\N	40809	\N
45652	GENERIC_DAY	0	0	2010-05-31	1318	\N	40809	\N
45653	GENERIC_DAY	0	0	2010-06-03	1320	\N	40809	\N
45654	GENERIC_DAY	0	0	2010-06-10	1314	\N	40809	\N
45655	GENERIC_DAY	0	0	2010-06-24	19498	\N	40809	\N
45656	GENERIC_DAY	0	1	2010-05-27	1322	\N	40809	\N
45657	GENERIC_DAY	0	0	2010-07-11	1320	\N	40809	\N
45658	GENERIC_DAY	0	1	2010-06-24	1314	\N	40809	\N
45659	GENERIC_DAY	0	0	2010-06-06	1332	\N	40809	\N
45660	GENERIC_DAY	0	0	2010-07-06	1332	\N	40809	\N
45661	GENERIC_DAY	0	0	2010-06-07	1332	\N	40809	\N
45662	GENERIC_DAY	0	0	2010-05-28	1324	\N	40809	\N
45663	GENERIC_DAY	0	0	2010-05-29	1332	\N	40809	\N
45664	GENERIC_DAY	0	0	2010-06-05	19494	\N	40809	\N
45665	GENERIC_DAY	0	0	2010-06-16	19494	\N	40809	\N
45666	GENERIC_DAY	0	0	2010-07-07	1318	\N	40809	\N
45667	GENERIC_DAY	0	0	2010-07-05	19498	\N	40809	\N
45668	GENERIC_DAY	0	0	2010-06-08	1316	\N	40809	\N
45669	GENERIC_DAY	0	0	2010-07-03	1322	\N	40809	\N
45670	GENERIC_DAY	0	0	2010-06-05	1330	\N	40809	\N
45671	GENERIC_DAY	0	0	2010-07-12	1314	\N	40809	\N
45672	GENERIC_DAY	0	0	2010-06-30	1326	\N	40809	\N
45673	GENERIC_DAY	0	0	2010-05-27	1320	\N	40809	\N
45674	GENERIC_DAY	0	0	2010-06-27	1326	\N	40809	\N
45675	GENERIC_DAY	0	1	2010-05-26	2728	\N	40809	\N
45676	GENERIC_DAY	0	0	2010-06-13	19500	\N	40809	\N
45677	GENERIC_DAY	0	0	2010-06-04	1326	\N	40809	\N
45678	GENERIC_DAY	0	0	2010-06-19	2728	\N	40809	\N
45679	GENERIC_DAY	0	1	2010-07-05	1314	\N	40809	\N
45680	GENERIC_DAY	0	0	2010-06-17	1328	\N	40809	\N
45681	GENERIC_DAY	0	1	2010-05-26	19494	\N	40809	\N
45682	GENERIC_DAY	0	0	2010-06-07	19496	\N	40809	\N
45683	GENERIC_DAY	0	0	2010-06-27	19498	\N	40809	\N
45684	GENERIC_DAY	0	0	2010-06-04	1314	\N	40809	\N
45685	GENERIC_DAY	0	0	2010-06-02	1328	\N	40809	\N
45686	GENERIC_DAY	0	0	2010-06-10	19496	\N	40809	\N
45687	GENERIC_DAY	0	1	2010-06-10	1322	\N	40809	\N
45688	GENERIC_DAY	0	0	2010-06-18	1326	\N	40809	\N
45689	GENERIC_DAY	0	0	2010-06-04	19494	\N	40809	\N
45690	GENERIC_DAY	0	1	2010-06-28	2728	\N	40809	\N
45691	GENERIC_DAY	0	0	2010-06-20	1314	\N	40809	\N
45692	GENERIC_DAY	0	0	2010-07-01	19498	\N	40809	\N
45693	GENERIC_DAY	0	0	2010-07-02	1316	\N	40809	\N
45694	GENERIC_DAY	0	0	2010-05-27	19498	\N	40809	\N
45695	GENERIC_DAY	0	0	2010-06-12	1328	\N	40809	\N
45696	GENERIC_DAY	0	0	2010-06-05	1326	\N	40809	\N
45697	GENERIC_DAY	0	0	2010-06-10	1324	\N	40809	\N
45698	GENERIC_DAY	0	0	2010-06-08	1326	\N	40809	\N
45699	GENERIC_DAY	0	0	2010-07-01	19500	\N	40809	\N
45700	GENERIC_DAY	0	0	2010-05-27	1324	\N	40809	\N
45701	GENERIC_DAY	0	1	2010-06-15	1314	\N	40809	\N
45702	GENERIC_DAY	0	0	2010-06-08	19500	\N	40809	\N
45703	GENERIC_DAY	0	0	2010-07-01	1318	\N	40809	\N
45704	GENERIC_DAY	0	0	2010-06-14	1318	\N	40809	\N
45705	GENERIC_DAY	0	0	2010-06-11	19500	\N	40809	\N
45706	GENERIC_DAY	0	0	2010-07-05	1318	\N	40809	\N
45707	GENERIC_DAY	0	0	2010-06-11	1330	\N	40809	\N
45708	GENERIC_DAY	0	0	2010-07-04	1326	\N	40809	\N
45709	GENERIC_DAY	0	0	2010-06-22	19498	\N	40809	\N
45710	GENERIC_DAY	0	0	2010-06-18	19496	\N	40809	\N
45711	GENERIC_DAY	0	0	2010-07-03	1316	\N	40809	\N
45712	GENERIC_DAY	0	0	2010-06-17	1324	\N	40809	\N
45713	GENERIC_DAY	0	1	2010-06-22	2728	\N	40809	\N
45714	GENERIC_DAY	0	0	2010-06-20	1316	\N	40809	\N
45715	GENERIC_DAY	0	0	2010-06-12	1314	\N	40809	\N
45716	GENERIC_DAY	0	0	2010-06-16	19498	\N	40809	\N
45717	GENERIC_DAY	0	0	2010-06-04	1328	\N	40809	\N
45718	GENERIC_DAY	0	0	2010-05-27	19500	\N	40809	\N
45719	GENERIC_DAY	0	0	2010-05-30	1332	\N	40809	\N
45720	GENERIC_DAY	0	0	2010-07-04	19494	\N	40809	\N
45721	GENERIC_DAY	0	0	2010-06-12	19498	\N	40809	\N
45722	GENERIC_DAY	0	0	2010-06-06	19500	\N	40809	\N
45723	GENERIC_DAY	0	0	2010-06-07	1316	\N	40809	\N
45724	GENERIC_DAY	0	0	2010-07-05	1324	\N	40809	\N
45725	GENERIC_DAY	0	0	2010-06-13	1330	\N	40809	\N
45726	GENERIC_DAY	0	0	2010-06-20	1318	\N	40809	\N
45727	GENERIC_DAY	0	0	2010-06-27	19500	\N	40809	\N
45728	GENERIC_DAY	0	0	2010-07-08	1324	\N	40809	\N
45729	GENERIC_DAY	0	0	2010-07-06	19494	\N	40809	\N
45730	GENERIC_DAY	0	0	2010-06-26	19494	\N	40809	\N
45731	GENERIC_DAY	0	0	2010-06-07	1314	\N	40809	\N
45732	GENERIC_DAY	0	0	2010-07-08	1328	\N	40809	\N
45733	GENERIC_DAY	0	0	2010-07-05	1330	\N	40809	\N
45734	GENERIC_DAY	0	0	2010-05-26	1328	\N	40809	\N
45735	GENERIC_DAY	0	0	2010-06-29	1326	\N	40809	\N
45736	GENERIC_DAY	0	0	2010-06-20	19494	\N	40809	\N
45737	GENERIC_DAY	0	0	2010-07-03	1320	\N	40809	\N
45738	GENERIC_DAY	0	0	2010-06-28	19494	\N	40809	\N
45739	GENERIC_DAY	0	0	2010-06-01	19496	\N	40809	\N
45740	GENERIC_DAY	0	0	2010-06-30	19498	\N	40809	\N
45741	GENERIC_DAY	0	0	2010-06-17	1330	\N	40809	\N
45742	GENERIC_DAY	0	0	2010-07-06	19496	\N	40809	\N
45743	GENERIC_DAY	0	0	2010-06-28	1326	\N	40809	\N
45744	GENERIC_DAY	0	0	2010-06-02	1320	\N	40809	\N
45745	GENERIC_DAY	0	0	2010-05-26	1314	\N	40809	\N
45746	GENERIC_DAY	0	0	2010-07-10	1318	\N	40809	\N
45747	GENERIC_DAY	0	0	2010-06-15	1324	\N	40809	\N
45748	GENERIC_DAY	0	0	2010-07-01	1326	\N	40809	\N
45749	GENERIC_DAY	0	0	2010-06-19	1326	\N	40809	\N
45750	GENERIC_DAY	0	0	2010-06-14	1326	\N	40809	\N
45751	GENERIC_DAY	0	0	2010-06-18	19494	\N	40809	\N
45752	GENERIC_DAY	0	0	2010-06-24	1318	\N	40809	\N
45753	GENERIC_DAY	0	1	2010-06-16	1314	\N	40809	\N
45754	GENERIC_DAY	0	0	2010-06-29	19494	\N	40809	\N
45755	GENERIC_DAY	0	0	2010-05-26	19496	\N	40809	\N
45756	GENERIC_DAY	0	1	2010-06-03	19494	\N	40809	\N
45757	GENERIC_DAY	0	0	2010-06-09	1320	\N	40809	\N
45758	GENERIC_DAY	0	0	2010-06-25	1330	\N	40809	\N
45759	GENERIC_DAY	0	0	2010-07-03	1332	\N	40809	\N
45760	GENERIC_DAY	0	0	2010-06-02	1318	\N	40809	\N
45761	GENERIC_DAY	0	1	2010-06-01	2728	\N	40809	\N
45762	GENERIC_DAY	0	0	2010-06-26	1314	\N	40809	\N
45763	GENERIC_DAY	0	0	2010-07-01	1316	\N	40809	\N
45764	GENERIC_DAY	0	0	2010-06-02	19496	\N	40809	\N
45765	GENERIC_DAY	0	0	2010-05-31	19498	\N	40809	\N
45766	GENERIC_DAY	0	1	2010-06-10	19494	\N	40809	\N
45767	GENERIC_DAY	0	0	2010-06-21	1320	\N	40809	\N
45768	GENERIC_DAY	0	0	2010-06-25	1324	\N	40809	\N
45769	GENERIC_DAY	0	0	2010-07-11	19496	\N	40809	\N
45770	GENERIC_DAY	0	0	2010-07-04	1320	\N	40809	\N
45771	GENERIC_DAY	0	0	2010-06-12	1332	\N	40809	\N
45772	GENERIC_DAY	0	1	2010-06-14	2728	\N	40809	\N
45773	GENERIC_DAY	0	0	2010-06-05	1322	\N	40809	\N
45774	GENERIC_DAY	0	0	2010-06-28	1320	\N	40809	\N
45775	GENERIC_DAY	0	0	2010-06-28	1332	\N	40809	\N
45776	GENERIC_DAY	0	0	2010-06-09	1316	\N	40809	\N
45777	GENERIC_DAY	0	0	2010-07-11	1330	\N	40809	\N
45778	GENERIC_DAY	0	0	2010-06-07	1328	\N	40809	\N
45779	GENERIC_DAY	0	0	2010-07-11	1324	\N	40809	\N
45780	GENERIC_DAY	0	1	2010-06-28	1314	\N	40809	\N
45781	GENERIC_DAY	0	0	2010-06-24	19500	\N	40809	\N
45782	GENERIC_DAY	0	0	2010-07-08	19498	\N	40809	\N
45783	GENERIC_DAY	0	0	2010-06-17	1326	\N	40809	\N
45784	GENERIC_DAY	0	0	2010-06-25	19500	\N	40809	\N
45785	GENERIC_DAY	0	0	2010-06-16	1316	\N	40809	\N
45786	GENERIC_DAY	0	0	2010-07-09	1316	\N	40809	\N
45787	GENERIC_DAY	0	1	2010-06-17	1314	\N	40809	\N
45788	GENERIC_DAY	0	0	2010-06-21	1324	\N	40809	\N
45789	GENERIC_DAY	0	0	2010-06-10	1328	\N	40809	\N
45790	GENERIC_DAY	0	0	2010-07-03	1326	\N	40809	\N
45791	GENERIC_DAY	0	0	2010-06-01	1318	\N	40809	\N
45792	GENERIC_DAY	0	1	2010-06-23	19494	\N	40809	\N
45793	GENERIC_DAY	0	1	2010-06-07	19494	\N	40809	\N
45794	GENERIC_DAY	0	0	2010-06-21	19496	\N	40809	\N
45795	GENERIC_DAY	0	1	2010-06-17	1322	\N	40809	\N
45796	GENERIC_DAY	0	0	2010-06-15	1318	\N	40809	\N
45797	GENERIC_DAY	0	0	2010-05-29	1320	\N	40809	\N
45798	GENERIC_DAY	0	0	2010-06-21	19500	\N	40809	\N
45799	GENERIC_DAY	0	0	2010-07-04	1322	\N	40809	\N
45800	GENERIC_DAY	0	0	2010-06-12	1326	\N	40809	\N
45801	GENERIC_DAY	0	1	2010-06-15	2728	\N	40809	\N
45802	GENERIC_DAY	0	0	2010-06-15	1330	\N	40809	\N
45803	GENERIC_DAY	0	0	2010-06-19	19494	\N	40809	\N
45804	GENERIC_DAY	0	0	2010-06-08	19496	\N	40809	\N
45805	GENERIC_DAY	0	0	2010-06-21	19498	\N	40809	\N
45806	GENERIC_DAY	0	0	2010-06-04	1330	\N	40809	\N
45807	GENERIC_DAY	0	0	2010-05-28	1328	\N	40809	\N
45808	GENERIC_DAY	0	0	2010-07-01	19496	\N	40809	\N
45809	GENERIC_DAY	0	0	2010-06-05	1332	\N	40809	\N
45810	GENERIC_DAY	0	0	2010-06-30	19496	\N	40809	\N
45811	GENERIC_DAY	0	0	2010-07-11	19498	\N	40809	\N
45812	GENERIC_DAY	0	0	2010-06-08	1330	\N	40809	\N
45813	GENERIC_DAY	0	0	2010-07-12	1326	\N	40809	\N
45814	GENERIC_DAY	0	1	2010-06-07	1322	\N	40809	\N
45815	GENERIC_DAY	0	0	2010-07-02	19498	\N	40809	\N
45816	GENERIC_DAY	0	0	2010-06-26	1332	\N	40809	\N
45817	GENERIC_DAY	0	0	2010-06-28	19500	\N	40809	\N
45818	GENERIC_DAY	0	0	2010-06-15	19498	\N	40809	\N
45819	GENERIC_DAY	0	0	2010-07-06	19498	\N	40809	\N
45820	GENERIC_DAY	0	0	2010-07-12	19496	\N	40809	\N
45821	GENERIC_DAY	0	0	2010-06-09	1326	\N	40809	\N
45822	GENERIC_DAY	0	0	2010-05-31	1314	\N	40809	\N
45823	GENERIC_DAY	0	0	2010-06-26	2728	\N	40809	\N
45824	GENERIC_DAY	0	0	2010-06-06	1324	\N	40809	\N
45825	GENERIC_DAY	0	1	2010-06-29	1322	\N	40809	\N
45826	GENERIC_DAY	0	1	2010-06-14	1314	\N	40809	\N
45827	GENERIC_DAY	0	1	2010-07-02	1322	\N	40809	\N
45828	GENERIC_DAY	0	0	2010-05-30	2728	\N	40809	\N
45829	GENERIC_DAY	0	0	2010-07-06	1324	\N	40809	\N
45830	GENERIC_DAY	0	0	2010-07-02	19494	\N	40809	\N
45831	GENERIC_DAY	0	0	2010-07-07	19494	\N	40809	\N
45832	GENERIC_DAY	0	0	2010-06-06	1316	\N	40809	\N
45833	GENERIC_DAY	0	0	2010-06-03	19500	\N	40809	\N
45834	GENERIC_DAY	0	1	2010-07-09	1314	\N	40809	\N
45835	GENERIC_DAY	0	0	2010-06-25	19498	\N	40809	\N
45836	GENERIC_DAY	0	0	2010-06-09	1324	\N	40809	\N
45837	GENERIC_DAY	0	0	2010-06-12	19496	\N	40809	\N
45838	GENERIC_DAY	0	0	2010-06-05	2728	\N	40809	\N
45839	GENERIC_DAY	0	0	2010-05-28	1326	\N	40809	\N
45840	GENERIC_DAY	0	1	2010-07-05	2728	\N	40809	\N
45841	GENERIC_DAY	0	0	2010-05-31	1320	\N	40809	\N
45842	GENERIC_DAY	0	1	2010-06-29	2728	\N	40809	\N
45843	GENERIC_DAY	0	0	2010-06-16	1330	\N	40809	\N
45844	GENERIC_DAY	0	1	2010-06-02	19494	\N	40809	\N
45845	GENERIC_DAY	0	0	2010-06-06	19494	\N	40809	\N
45846	GENERIC_DAY	0	1	2010-06-17	2728	\N	40809	\N
45847	GENERIC_DAY	0	1	2010-07-08	2728	\N	40809	\N
45848	GENERIC_DAY	0	1	2010-06-07	2728	\N	40809	\N
45849	GENERIC_DAY	0	1	2010-05-31	19494	\N	40809	\N
45850	GENERIC_DAY	0	1	2010-06-15	1322	\N	40809	\N
45851	GENERIC_DAY	0	0	2010-07-10	1330	\N	40809	\N
45852	GENERIC_DAY	0	0	2010-06-03	19498	\N	40809	\N
45853	GENERIC_DAY	0	0	2010-06-24	1320	\N	40809	\N
45854	GENERIC_DAY	0	0	2010-06-09	19498	\N	40809	\N
45855	GENERIC_DAY	0	1	2010-06-16	1322	\N	40809	\N
45856	GENERIC_DAY	0	0	2010-06-23	1320	\N	40809	\N
45857	GENERIC_DAY	0	0	2010-06-27	1320	\N	40809	\N
45858	GENERIC_DAY	0	0	2010-06-06	19498	\N	40809	\N
45859	GENERIC_DAY	0	0	2010-07-08	1320	\N	40809	\N
45860	GENERIC_DAY	0	0	2010-06-29	1316	\N	40809	\N
45861	GENERIC_DAY	0	0	2010-07-12	1330	\N	40809	\N
45862	GENERIC_DAY	0	0	2010-07-04	1330	\N	40809	\N
45863	GENERIC_DAY	0	0	2010-06-21	1332	\N	40809	\N
45864	GENERIC_DAY	0	0	2010-06-11	19498	\N	40809	\N
45865	GENERIC_DAY	0	1	2010-07-06	1314	\N	40809	\N
45866	GENERIC_DAY	0	0	2010-06-23	19496	\N	40809	\N
45867	GENERIC_DAY	0	0	2010-05-30	1324	\N	40809	\N
45868	GENERIC_DAY	0	0	2010-06-10	19500	\N	40809	\N
45869	GENERIC_DAY	0	0	2010-07-02	1318	\N	40809	\N
45870	GENERIC_DAY	0	0	2010-07-02	1326	\N	40809	\N
45871	GENERIC_DAY	0	0	2010-06-01	19498	\N	40809	\N
45872	GENERIC_DAY	0	1	2010-06-11	1314	\N	40809	\N
45873	GENERIC_DAY	0	1	2010-06-18	1322	\N	40809	\N
45874	GENERIC_DAY	0	1	2010-06-25	1320	\N	40809	\N
45875	GENERIC_DAY	0	0	2010-06-25	1332	\N	40809	\N
45876	GENERIC_DAY	0	0	2010-06-24	19496	\N	40809	\N
45877	GENERIC_DAY	0	0	2010-05-29	1316	\N	40809	\N
45878	GENERIC_DAY	0	1	2010-06-21	19494	\N	40809	\N
45879	GENERIC_DAY	0	0	2010-06-26	19500	\N	40809	\N
45880	GENERIC_DAY	0	0	2010-06-15	1326	\N	40809	\N
45881	GENERIC_DAY	0	0	2010-06-05	1320	\N	40809	\N
45882	GENERIC_DAY	0	0	2010-06-15	1332	\N	40809	\N
45883	GENERIC_DAY	0	0	2010-06-02	1330	\N	40809	\N
45884	GENERIC_DAY	0	0	2010-06-08	19498	\N	40809	\N
45885	GENERIC_DAY	0	0	2010-06-14	1324	\N	40809	\N
45886	GENERIC_DAY	0	0	2010-07-08	1330	\N	40809	\N
45887	GENERIC_DAY	0	1	2010-06-30	1314	\N	40809	\N
45888	GENERIC_DAY	0	0	2010-06-03	1330	\N	40809	\N
45889	GENERIC_DAY	0	0	2010-07-07	19500	\N	40809	\N
45890	GENERIC_DAY	0	0	2010-06-03	1324	\N	40809	\N
45891	GENERIC_DAY	0	0	2010-06-01	19500	\N	40809	\N
45892	GENERIC_DAY	0	0	2010-07-12	19494	\N	40809	\N
45893	GENERIC_DAY	0	0	2010-06-03	1332	\N	40809	\N
45894	GENERIC_DAY	0	0	2010-05-29	1324	\N	40809	\N
45895	GENERIC_DAY	0	0	2010-06-01	1316	\N	40809	\N
45896	GENERIC_DAY	0	0	2010-06-23	1316	\N	40809	\N
45897	GENERIC_DAY	0	1	2010-07-02	2728	\N	40809	\N
45898	GENERIC_DAY	0	0	2010-06-17	19494	\N	40809	\N
45899	GENERIC_DAY	0	0	2010-06-13	1322	\N	40809	\N
45900	GENERIC_DAY	0	1	2010-07-12	1322	\N	40809	\N
45901	GENERIC_DAY	0	0	2010-07-04	1314	\N	40809	\N
45902	GENERIC_DAY	0	0	2010-07-01	1328	\N	40809	\N
45903	GENERIC_DAY	0	0	2010-06-26	1324	\N	40809	\N
45904	GENERIC_DAY	0	0	2010-07-09	19494	\N	40809	\N
45905	GENERIC_DAY	0	0	2010-06-15	19500	\N	40809	\N
45906	GENERIC_DAY	0	0	2010-06-27	2728	\N	40809	\N
45907	GENERIC_DAY	0	0	2010-06-13	1324	\N	40809	\N
45908	GENERIC_DAY	0	0	2010-07-02	1320	\N	40809	\N
45909	GENERIC_DAY	0	0	2010-06-04	1322	\N	40809	\N
45910	GENERIC_DAY	0	0	2010-07-02	1332	\N	40809	\N
45911	GENERIC_DAY	0	0	2010-06-27	19496	\N	40809	\N
45912	GENERIC_DAY	0	0	2010-07-04	19498	\N	40809	\N
45913	GENERIC_DAY	0	1	2010-06-08	1322	\N	40809	\N
45914	GENERIC_DAY	0	1	2010-07-02	1314	\N	40809	\N
45915	GENERIC_DAY	0	0	2010-06-09	19500	\N	40809	\N
45916	GENERIC_DAY	0	1	2010-07-08	1322	\N	40809	\N
45917	GENERIC_DAY	0	0	2010-07-01	1330	\N	40809	\N
45918	GENERIC_DAY	0	0	2010-07-01	1332	\N	40809	\N
45919	GENERIC_DAY	0	0	2010-05-29	1322	\N	40809	\N
45920	GENERIC_DAY	0	1	2010-06-23	1314	\N	40809	\N
45921	GENERIC_DAY	0	0	2010-06-29	19496	\N	40809	\N
45922	GENERIC_DAY	0	0	2010-06-15	19496	\N	40809	\N
45923	GENERIC_DAY	0	0	2010-06-10	1316	\N	40809	\N
45924	GENERIC_DAY	0	0	2010-06-05	19496	\N	40809	\N
45925	GENERIC_DAY	0	0	2010-06-07	1330	\N	40809	\N
45926	GENERIC_DAY	0	0	2010-06-15	1328	\N	40809	\N
45927	GENERIC_DAY	0	1	2010-06-09	2728	\N	40809	\N
45928	GENERIC_DAY	0	0	2010-06-01	1328	\N	40809	\N
45929	GENERIC_DAY	0	0	2010-05-29	19496	\N	40809	\N
45930	GENERIC_DAY	0	3	2010-06-04	1316	\N	40809	\N
45931	GENERIC_DAY	0	0	2010-07-12	19500	\N	40809	\N
45932	GENERIC_DAY	0	0	2010-06-24	1332	\N	40809	\N
45933	GENERIC_DAY	0	0	2010-06-23	19500	\N	40809	\N
45934	GENERIC_DAY	0	0	2010-06-02	1324	\N	40809	\N
45935	GENERIC_DAY	0	0	2010-06-16	1318	\N	40809	\N
45936	GENERIC_DAY	0	0	2010-06-13	19494	\N	40809	\N
45937	GENERIC_DAY	0	0	2010-05-27	1330	\N	40809	\N
45938	GENERIC_DAY	0	0	2010-06-25	1326	\N	40809	\N
45939	GENERIC_DAY	0	0	2010-07-10	19498	\N	40809	\N
45940	GENERIC_DAY	0	0	2010-06-13	1326	\N	40809	\N
45941	GENERIC_DAY	0	1	2010-06-28	1322	\N	40809	\N
45942	GENERIC_DAY	0	0	2010-06-20	1320	\N	40809	\N
45943	GENERIC_DAY	0	0	2010-07-04	19500	\N	40809	\N
45944	GENERIC_DAY	0	0	2010-06-22	1330	\N	40809	\N
45945	GENERIC_DAY	0	0	2010-06-02	1316	\N	40809	\N
45946	GENERIC_DAY	0	0	2010-05-29	19494	\N	40809	\N
45947	GENERIC_DAY	0	0	2010-06-24	1330	\N	40809	\N
45948	GENERIC_DAY	0	0	2010-06-14	19498	\N	40809	\N
45949	GENERIC_DAY	0	0	2010-06-11	1320	\N	40809	\N
45950	GENERIC_DAY	0	0	2010-06-17	19500	\N	40809	\N
45951	GENERIC_DAY	0	0	2010-07-04	1316	\N	40809	\N
45952	GENERIC_DAY	0	0	2010-05-30	1330	\N	40809	\N
45953	GENERIC_DAY	0	0	2010-05-29	1314	\N	40809	\N
45954	GENERIC_DAY	0	0	2010-05-26	19500	\N	40809	\N
45955	GENERIC_DAY	0	0	2010-05-31	1324	\N	40809	\N
45956	GENERIC_DAY	0	0	2010-07-09	1324	\N	40809	\N
45957	GENERIC_DAY	0	0	2010-06-14	1330	\N	40809	\N
45958	GENERIC_DAY	0	0	2010-06-14	19500	\N	40809	\N
45959	GENERIC_DAY	0	0	2010-06-27	1328	\N	40809	\N
45960	GENERIC_DAY	0	0	2010-05-29	1318	\N	40809	\N
45961	GENERIC_DAY	0	1	2010-06-01	19494	\N	40809	\N
45962	GENERIC_DAY	0	0	2010-07-05	1328	\N	40809	\N
45963	GENERIC_DAY	0	0	2010-07-09	19496	\N	40809	\N
45964	GENERIC_DAY	0	0	2010-06-08	1324	\N	40809	\N
45965	GENERIC_DAY	0	0	2010-06-14	1328	\N	40809	\N
45966	GENERIC_DAY	0	0	2010-07-07	1320	\N	40809	\N
45967	GENERIC_DAY	0	0	2010-06-10	1320	\N	40809	\N
45968	GENERIC_DAY	0	0	2010-06-23	19498	\N	40809	\N
45969	GENERIC_DAY	0	0	2010-05-27	1326	\N	40809	\N
45970	GENERIC_DAY	0	0	2010-06-03	1326	\N	40809	\N
45971	GENERIC_DAY	0	1	2010-06-08	19494	\N	40809	\N
45972	GENERIC_DAY	0	0	2010-06-12	19494	\N	40809	\N
45973	GENERIC_DAY	0	0	2010-06-30	1320	\N	40809	\N
45974	GENERIC_DAY	0	0	2010-07-10	19494	\N	40809	\N
45975	GENERIC_DAY	0	0	2010-05-31	1328	\N	40809	\N
45976	GENERIC_DAY	0	0	2010-06-10	1326	\N	40809	\N
45977	GENERIC_DAY	0	0	2010-06-02	1314	\N	40809	\N
45978	GENERIC_DAY	0	0	2010-06-29	1330	\N	40809	\N
45979	GENERIC_DAY	0	0	2010-07-02	19500	\N	40809	\N
45980	GENERIC_DAY	0	0	2010-06-22	1318	\N	40809	\N
45981	GENERIC_DAY	0	0	2010-05-27	1328	\N	40809	\N
45982	GENERIC_DAY	0	0	2010-07-10	19496	\N	40809	\N
45983	GENERIC_DAY	0	0	2010-06-29	19498	\N	40809	\N
45984	GENERIC_DAY	0	1	2010-06-24	2728	\N	40809	\N
45985	GENERIC_DAY	0	1	2010-07-08	1314	\N	40809	\N
45986	GENERIC_DAY	0	1	2010-07-07	1322	\N	40809	\N
45987	GENERIC_DAY	0	0	2010-06-06	1322	\N	40809	\N
45988	GENERIC_DAY	0	0	2010-06-20	2728	\N	40809	\N
45989	GENERIC_DAY	0	0	2010-06-22	1328	\N	40809	\N
45990	GENERIC_DAY	0	0	2010-05-31	1330	\N	40809	\N
45991	GENERIC_DAY	0	0	2010-06-18	1330	\N	40809	\N
45992	GENERIC_DAY	0	0	2010-07-07	1328	\N	40809	\N
45993	GENERIC_DAY	0	0	2010-06-04	1320	\N	40809	\N
45994	GENERIC_DAY	0	0	2010-06-09	19496	\N	40809	\N
45995	GENERIC_DAY	0	0	2010-07-06	1330	\N	40809	\N
45996	GENERIC_DAY	0	0	2010-06-24	1316	\N	40809	\N
45997	GENERIC_DAY	0	0	2010-05-31	19500	\N	40809	\N
45998	GENERIC_DAY	0	1	2010-06-29	1314	\N	40809	\N
45999	GENERIC_DAY	0	0	2010-06-23	1330	\N	40809	\N
46000	GENERIC_DAY	0	0	2010-06-12	1330	\N	40809	\N
46001	GENERIC_DAY	0	0	2010-07-10	1324	\N	40809	\N
46002	GENERIC_DAY	0	0	2010-05-26	1326	\N	40809	\N
46003	GENERIC_DAY	0	0	2010-06-18	1328	\N	40809	\N
46004	GENERIC_DAY	0	0	2010-06-20	19498	\N	40809	\N
46005	GENERIC_DAY	0	0	2010-06-27	1316	\N	40809	\N
46006	GENERIC_DAY	0	0	2010-06-21	1326	\N	40809	\N
46007	GENERIC_DAY	0	0	2010-06-30	1318	\N	40809	\N
46008	GENERIC_DAY	0	0	2010-06-28	19496	\N	40809	\N
46009	GENERIC_DAY	0	0	2010-06-20	1324	\N	40809	\N
46010	GENERIC_DAY	0	0	2010-07-04	1318	\N	40809	\N
46011	GENERIC_DAY	0	0	2010-06-27	19494	\N	40809	\N
46012	GENERIC_DAY	0	1	2010-06-23	2728	\N	40809	\N
46013	GENERIC_DAY	0	0	2010-06-30	1328	\N	40809	\N
46014	GENERIC_DAY	0	0	2010-05-26	1320	\N	40809	\N
46015	GENERIC_DAY	0	0	2010-06-07	19500	\N	40809	\N
46016	GENERIC_DAY	0	1	2010-05-31	2728	\N	40809	\N
46017	GENERIC_DAY	0	0	2010-06-18	1332	\N	40809	\N
46018	GENERIC_DAY	0	0	2010-06-19	1324	\N	40809	\N
46019	GENERIC_DAY	0	0	2010-07-08	19496	\N	40809	\N
46020	GENERIC_DAY	0	0	2010-07-09	1320	\N	40809	\N
46021	GENERIC_DAY	0	1	2010-06-30	1322	\N	40809	\N
46022	GENERIC_DAY	0	0	2010-05-28	1318	\N	40809	\N
46023	GENERIC_DAY	0	0	2010-06-19	1330	\N	40809	\N
46024	GENERIC_DAY	0	0	2010-06-11	1326	\N	40809	\N
46025	GENERIC_DAY	0	0	2010-06-20	19496	\N	40809	\N
46026	GENERIC_DAY	0	0	2010-07-08	19494	\N	40809	\N
46027	GENERIC_DAY	0	1	2010-06-18	2728	\N	40809	\N
46028	GENERIC_DAY	0	0	2010-06-03	1316	\N	40809	\N
46029	GENERIC_DAY	0	0	2010-07-12	1320	\N	40809	\N
46030	GENERIC_DAY	0	0	2010-06-22	19500	\N	40809	\N
46031	GENERIC_DAY	0	0	2010-06-26	1318	\N	40809	\N
46032	GENERIC_DAY	0	0	2010-06-03	1318	\N	40809	\N
46033	GENERIC_DAY	0	0	2010-05-31	1332	\N	40809	\N
46034	GENERIC_DAY	0	0	2010-07-03	1318	\N	40809	\N
46035	GENERIC_DAY	0	1	2010-06-18	1314	\N	40809	\N
46036	GENERIC_DAY	0	0	2010-06-06	1320	\N	40809	\N
46037	GENERIC_DAY	0	0	2010-06-26	1320	\N	40809	\N
46038	GENERIC_DAY	0	0	2010-06-05	19500	\N	40809	\N
46039	GENERIC_DAY	0	0	2010-06-14	1320	\N	40809	\N
46040	GENERIC_DAY	0	0	2010-06-23	1326	\N	40809	\N
46041	GENERIC_DAY	0	0	2010-06-19	19500	\N	40809	\N
46042	GENERIC_DAY	0	0	2010-05-30	1314	\N	40809	\N
46043	GENERIC_DAY	0	0	2010-06-29	1320	\N	40809	\N
46044	GENERIC_DAY	0	0	2010-06-18	19500	\N	40809	\N
46045	GENERIC_DAY	0	0	2010-06-27	1314	\N	40809	\N
46046	GENERIC_DAY	0	0	2010-05-29	1328	\N	40809	\N
46047	GENERIC_DAY	0	0	2010-07-05	1320	\N	40809	\N
46048	GENERIC_DAY	0	0	2010-06-21	1328	\N	40809	\N
46049	GENERIC_DAY	0	0	2010-05-28	19494	\N	40809	\N
46050	GENERIC_DAY	0	0	2010-07-04	19496	\N	40809	\N
46051	GENERIC_DAY	0	0	2010-06-05	1328	\N	40809	\N
46052	GENERIC_DAY	0	0	2010-07-11	1318	\N	40809	\N
46053	GENERIC_DAY	0	0	2010-07-01	1320	\N	40809	\N
46054	GENERIC_DAY	0	0	2010-05-30	1318	\N	40809	\N
46055	GENERIC_DAY	0	1	2010-07-01	2728	\N	40809	\N
46056	GENERIC_DAY	0	0	2010-06-30	19500	\N	40809	\N
46057	GENERIC_DAY	0	0	2010-07-05	19500	\N	40809	\N
46058	GENERIC_DAY	0	0	2010-06-15	1316	\N	40809	\N
46059	GENERIC_DAY	0	0	2010-06-11	1324	\N	40809	\N
46060	GENERIC_DAY	0	0	2010-06-25	19496	\N	40809	\N
46061	GENERIC_DAY	0	0	2010-06-14	1316	\N	40809	\N
46062	GENERIC_DAY	0	0	2010-06-19	19496	\N	40809	\N
46063	GENERIC_DAY	0	0	2010-06-02	19498	\N	40809	\N
46064	GENERIC_DAY	0	0	2010-06-14	1332	\N	40809	\N
46065	GENERIC_DAY	0	0	2010-06-27	1324	\N	40809	\N
46066	GENERIC_DAY	0	0	2010-06-19	1328	\N	40809	\N
46067	GENERIC_DAY	0	0	2010-06-18	1316	\N	40809	\N
46068	GENERIC_DAY	0	0	2010-07-12	1332	\N	40809	\N
46069	GENERIC_DAY	0	0	2010-06-17	1320	\N	40809	\N
46070	GENERIC_DAY	0	0	2010-06-13	1328	\N	40809	\N
46071	GENERIC_DAY	0	0	2010-06-30	1332	\N	40809	\N
46072	GENERIC_DAY	0	0	2010-06-01	1314	\N	40809	\N
46073	GENERIC_DAY	0	0	2010-07-04	2728	\N	40809	\N
46074	GENERIC_DAY	0	0	2010-05-29	19498	\N	40809	\N
46075	GENERIC_DAY	0	0	2010-06-19	1318	\N	40809	\N
46076	GENERIC_DAY	0	0	2010-06-28	1316	\N	40809	\N
46077	GENERIC_DAY	0	0	2010-06-08	1332	\N	40809	\N
46078	GENERIC_DAY	0	0	2010-06-24	1328	\N	40809	\N
46079	GENERIC_DAY	0	0	2010-06-06	1326	\N	40809	\N
46080	GENERIC_DAY	0	0	2010-06-11	1328	\N	40809	\N
46081	GENERIC_DAY	0	1	2010-06-16	2728	\N	40809	\N
46082	GENERIC_DAY	0	0	2010-07-09	1328	\N	40809	\N
46083	GENERIC_DAY	0	0	2010-06-25	1316	\N	40809	\N
46084	GENERIC_DAY	0	0	2010-06-14	19496	\N	40809	\N
46085	GENERIC_DAY	0	0	2010-05-29	2728	\N	40809	\N
46086	GENERIC_DAY	0	0	2010-07-07	19496	\N	40809	\N
46087	GENERIC_DAY	0	0	2010-06-30	1330	\N	40809	\N
46088	GENERIC_DAY	0	0	2010-07-12	1316	\N	40809	\N
46089	GENERIC_DAY	0	0	2010-06-04	19496	\N	40809	\N
46090	GENERIC_DAY	0	0	2010-07-06	1318	\N	40809	\N
46091	GENERIC_DAY	0	0	2010-07-08	1318	\N	40809	\N
46092	GENERIC_DAY	0	0	2010-06-26	1330	\N	40809	\N
46093	GENERIC_DAY	0	0	2010-07-07	1316	\N	40809	\N
46094	GENERIC_DAY	0	0	2010-06-21	1316	\N	40809	\N
46095	GENERIC_DAY	0	0	2010-06-18	1318	\N	40809	\N
46096	GENERIC_DAY	0	0	2010-07-08	1316	\N	40809	\N
46097	GENERIC_DAY	0	0	2010-05-31	1316	\N	40809	\N
46098	GENERIC_DAY	0	0	2010-07-04	1332	\N	40809	\N
46099	GENERIC_DAY	0	0	2010-06-04	19498	\N	40809	\N
46100	GENERIC_DAY	0	1	2010-06-10	2728	\N	40809	\N
46101	GENERIC_DAY	0	0	2010-06-23	1332	\N	40809	\N
46102	GENERIC_DAY	0	0	2010-05-31	19496	\N	40809	\N
46103	GENERIC_DAY	0	1	2010-07-05	1322	\N	40809	\N
46104	GENERIC_DAY	0	0	2010-05-27	1332	\N	40809	\N
46105	GENERIC_DAY	0	0	2010-07-10	1328	\N	40809	\N
46106	GENERIC_DAY	0	0	2010-05-27	1316	\N	40809	\N
46107	GENERIC_DAY	0	0	2010-06-09	1330	\N	40809	\N
46108	GENERIC_DAY	0	0	2010-07-12	2728	\N	40809	\N
46109	GENERIC_DAY	0	0	2010-06-19	1332	\N	40809	\N
46110	GENERIC_DAY	0	0	2010-05-26	19498	\N	40809	\N
46111	GENERIC_DAY	0	0	2010-06-13	2728	\N	40809	\N
46112	GENERIC_DAY	0	0	2010-06-27	1330	\N	40809	\N
46113	GENERIC_DAY	0	0	2010-06-19	1320	\N	40809	\N
46114	GENERIC_DAY	0	0	2010-05-28	1332	\N	40809	\N
46115	GENERIC_DAY	0	0	2010-06-06	2728	\N	40809	\N
46116	GENERIC_DAY	0	0	2010-06-25	1328	\N	40809	\N
46117	GENERIC_DAY	0	0	2010-06-11	19494	\N	40809	\N
46118	GENERIC_DAY	0	0	2010-05-28	2728	\N	40809	\N
46119	GENERIC_DAY	0	0	2010-07-10	1316	\N	40809	\N
46120	GENERIC_DAY	0	0	2010-06-05	1314	\N	40809	\N
46121	GENERIC_DAY	0	0	2010-06-13	19498	\N	40809	\N
46122	GENERIC_DAY	0	1	2010-06-30	2728	\N	40809	\N
46123	GENERIC_DAY	0	0	2010-06-22	1332	\N	40809	\N
46124	GENERIC_DAY	0	0	2010-06-07	1324	\N	40809	\N
46125	GENERIC_DAY	0	0	2010-06-09	1332	\N	40809	\N
46126	GENERIC_DAY	0	0	2010-06-21	1330	\N	40809	\N
46127	GENERIC_DAY	0	0	2010-05-30	1316	\N	40809	\N
46128	GENERIC_DAY	0	0	2010-07-09	19500	\N	40809	\N
46129	GENERIC_DAY	0	0	2010-06-27	1332	\N	40809	\N
46130	GENERIC_DAY	0	0	2010-06-18	1324	\N	40809	\N
46131	GENERIC_DAY	0	1	2010-06-03	1322	\N	40809	\N
46132	GENERIC_DAY	0	0	2010-06-26	19496	\N	40809	\N
46133	GENERIC_DAY	0	0	2010-05-28	1322	\N	40809	\N
46134	GENERIC_DAY	0	0	2010-05-28	1320	\N	40809	\N
46135	GENERIC_DAY	0	1	2010-05-26	1322	\N	40809	\N
46136	GENERIC_DAY	0	0	2010-05-30	19500	\N	40809	\N
46137	GENERIC_DAY	0	0	2010-06-04	19500	\N	40809	\N
46138	GENERIC_DAY	0	0	2010-07-11	19500	\N	40809	\N
46139	GENERIC_DAY	0	1	2010-07-01	1314	\N	40809	\N
46140	GENERIC_DAY	0	0	2010-07-07	1332	\N	40809	\N
46141	GENERIC_DAY	0	0	2010-05-26	1316	\N	40809	\N
46142	GENERIC_DAY	0	0	2010-06-02	1332	\N	40809	\N
46143	GENERIC_DAY	0	1	2010-05-27	19494	\N	40809	\N
46144	GENERIC_DAY	0	0	2010-06-22	1326	\N	40809	\N
46145	GENERIC_DAY	0	0	2010-06-13	1320	\N	40809	\N
46146	GENERIC_DAY	0	0	2010-06-09	1328	\N	40809	\N
46147	GENERIC_DAY	0	0	2010-06-07	1326	\N	40809	\N
46148	GENERIC_DAY	0	0	2010-07-07	1324	\N	40809	\N
46149	GENERIC_DAY	0	0	2010-06-19	1316	\N	40809	\N
46150	GENERIC_DAY	0	0	2010-07-01	19494	\N	40809	\N
46151	GENERIC_DAY	0	0	2010-06-11	19496	\N	40809	\N
46152	GENERIC_DAY	0	0	2010-06-19	1314	\N	40809	\N
46153	GENERIC_DAY	0	0	2010-06-12	1322	\N	40809	\N
46154	GENERIC_DAY	0	0	2010-06-20	1326	\N	40809	\N
46155	GENERIC_DAY	0	0	2010-06-05	1316	\N	40809	\N
46156	GENERIC_DAY	0	0	2010-06-26	19498	\N	40809	\N
46157	GENERIC_DAY	0	0	2010-06-05	1324	\N	40809	\N
46158	GENERIC_DAY	0	1	2010-06-11	2728	\N	40809	\N
46159	GENERIC_DAY	0	0	2010-06-26	1326	\N	40809	\N
46160	GENERIC_DAY	0	0	2010-05-31	1326	\N	40809	\N
46161	GENERIC_DAY	0	1	2010-06-11	1322	\N	40809	\N
46162	GENERIC_DAY	0	0	2010-06-15	19494	\N	40809	\N
46163	GENERIC_DAY	0	0	2010-06-08	1314	\N	40809	\N
46164	GENERIC_DAY	0	0	2010-06-13	1316	\N	40809	\N
46165	GENERIC_DAY	0	0	2010-06-24	1326	\N	40809	\N
46166	GENERIC_DAY	0	0	2010-06-07	1320	\N	40809	\N
46167	GENERIC_DAY	0	0	2010-07-02	1330	\N	40809	\N
46168	GENERIC_DAY	0	0	2010-07-09	1330	\N	40809	\N
46169	GENERIC_DAY	0	0	2010-06-11	1332	\N	40809	\N
46170	GENERIC_DAY	0	1	2010-06-21	1314	\N	40809	\N
46171	GENERIC_DAY	0	0	2010-05-27	1314	\N	40809	\N
46172	GENERIC_DAY	0	0	2010-06-20	1328	\N	40809	\N
46173	GENERIC_DAY	0	0	2010-05-28	1314	\N	40809	\N
46174	GENERIC_DAY	0	0	2010-06-29	19500	\N	40809	\N
46175	GENERIC_DAY	0	0	2010-06-29	1332	\N	40809	\N
46176	GENERIC_DAY	0	0	2010-06-06	1328	\N	40809	\N
46177	GENERIC_DAY	0	0	2010-06-12	1324	\N	40809	\N
46178	GENERIC_DAY	0	0	2010-06-20	19500	\N	40809	\N
46179	GENERIC_DAY	0	0	2010-07-11	1316	\N	40809	\N
46180	GENERIC_DAY	0	0	2010-07-04	1328	\N	40809	\N
46181	GENERIC_DAY	0	0	2010-05-26	1330	\N	40809	\N
46182	GENERIC_DAY	0	0	2010-06-16	19500	\N	40809	\N
46183	GENERIC_DAY	0	0	2010-06-19	1322	\N	40809	\N
46184	GENERIC_DAY	0	0	2010-06-20	1332	\N	40809	\N
46185	GENERIC_DAY	0	0	2010-06-04	1332	\N	40809	\N
46186	GENERIC_DAY	0	0	2010-05-30	19498	\N	40809	\N
46187	GENERIC_DAY	0	0	2010-07-11	1314	\N	40809	\N
46188	GENERIC_DAY	0	0	2010-06-10	19498	\N	40809	\N
46189	GENERIC_DAY	0	0	2010-07-02	19496	\N	40809	\N
46190	GENERIC_DAY	0	0	2010-05-27	19496	\N	40809	\N
46191	GENERIC_DAY	0	0	2010-06-02	19500	\N	40809	\N
46192	GENERIC_DAY	0	0	2010-07-10	1320	\N	40809	\N
46193	GENERIC_DAY	0	1	2010-06-24	19494	\N	40809	\N
46194	GENERIC_DAY	0	0	2010-07-03	19500	\N	40809	\N
46195	GENERIC_DAY	0	0	2010-06-22	1316	\N	40809	\N
46196	GENERIC_DAY	0	0	2010-05-30	1326	\N	40809	\N
46197	GENERIC_DAY	0	0	2010-05-30	19494	\N	40809	\N
46198	GENERIC_DAY	0	1	2010-06-22	19494	\N	40809	\N
46199	GENERIC_DAY	0	1	2010-06-02	1322	\N	40809	\N
46200	GENERIC_DAY	0	0	2010-06-28	1328	\N	40809	\N
46201	GENERIC_DAY	0	0	2010-05-29	1330	\N	40809	\N
46202	GENERIC_DAY	0	1	2010-07-07	2728	\N	40809	\N
46203	GENERIC_DAY	0	0	2010-06-26	1316	\N	40809	\N
46204	GENERIC_DAY	0	0	2010-07-06	1316	\N	40809	\N
46205	GENERIC_DAY	0	0	2010-07-11	1332	\N	40809	\N
46206	GENERIC_DAY	0	0	2010-07-05	1316	\N	40809	\N
46207	GENERIC_DAY	0	0	2010-07-12	19498	\N	40809	\N
46208	GENERIC_DAY	0	3	2010-05-28	1316	\N	40809	\N
46209	GENERIC_DAY	0	0	2010-06-28	19498	\N	40809	\N
46210	GENERIC_DAY	0	0	2010-06-06	1318	\N	40809	\N
46211	GENERIC_DAY	0	0	2010-07-10	19500	\N	40809	\N
46212	GENERIC_DAY	0	1	2010-07-06	2728	\N	40809	\N
46213	GENERIC_DAY	0	0	2010-06-01	1332	\N	40809	\N
46214	GENERIC_DAY	0	0	2010-07-02	1328	\N	40809	\N
46215	GENERIC_DAY	0	0	2010-06-22	1320	\N	40809	\N
46216	GENERIC_DAY	0	0	2010-05-30	1328	\N	40809	\N
46217	GENERIC_DAY	0	0	2010-06-27	1318	\N	40809	\N
46218	GENERIC_DAY	0	0	2010-06-05	19498	\N	40809	\N
46219	GENERIC_DAY	0	0	2010-06-28	1318	\N	40809	\N
46220	GENERIC_DAY	0	1	2010-06-08	2728	\N	40809	\N
46221	GENERIC_DAY	0	0	2010-07-11	1328	\N	40809	\N
46222	GENERIC_DAY	0	0	2010-07-10	2728	\N	40809	\N
46223	GENERIC_DAY	0	0	2010-05-28	19496	\N	40809	\N
46224	GENERIC_DAY	0	0	2010-07-07	1330	\N	40809	\N
46225	GENERIC_DAY	0	0	2010-06-17	19498	\N	40809	\N
46226	GENERIC_DAY	0	0	2010-07-12	1318	\N	40809	\N
46227	GENERIC_DAY	0	0	2010-07-05	19494	\N	40809	\N
46228	GENERIC_DAY	0	0	2010-06-08	1320	\N	40809	\N
46229	GENERIC_DAY	0	0	2010-06-18	1320	\N	40809	\N
46230	GENERIC_DAY	0	0	2010-06-22	19496	\N	40809	\N
46231	GENERIC_DAY	0	1	2010-06-22	1314	\N	40809	\N
46232	GENERIC_DAY	0	0	2010-06-16	1332	\N	40809	\N
46233	GENERIC_DAY	0	0	2010-06-03	1314	\N	40809	\N
46234	GENERIC_DAY	0	0	2010-06-10	1332	\N	40809	\N
46235	GENERIC_DAY	0	0	2010-07-11	2728	\N	40809	\N
46236	GENERIC_DAY	0	0	2010-06-12	1320	\N	40809	\N
46237	GENERIC_DAY	0	1	2010-07-01	1322	\N	40809	\N
46238	GENERIC_DAY	0	1	2010-06-25	2728	\N	40809	\N
46239	GENERIC_DAY	0	0	2010-06-24	1324	\N	40809	\N
46240	GENERIC_DAY	0	1	2010-06-03	2728	\N	40809	\N
46241	GENERIC_DAY	0	0	2010-06-13	1314	\N	40809	\N
46242	GENERIC_DAY	0	1	2010-06-25	1314	\N	40809	\N
46243	GENERIC_DAY	0	0	2010-05-28	19498	\N	40809	\N
46244	GENERIC_DAY	0	0	2010-06-26	1328	\N	40809	\N
102502	GENERIC_DAY	0	9	2010-05-10	1318	\N	20275	\N
102503	GENERIC_DAY	0	9	2010-06-15	1318	\N	20275	\N
102504	GENERIC_DAY	0	9	2010-05-27	1318	\N	20275	\N
102505	GENERIC_DAY	0	9	2010-05-31	1318	\N	20275	\N
102506	GENERIC_DAY	0	9	2010-06-17	1318	\N	20275	\N
102507	GENERIC_DAY	0	9	2010-05-13	1318	\N	20275	\N
102508	GENERIC_DAY	0	4	2010-05-28	1318	\N	20275	\N
102509	GENERIC_DAY	0	0	2010-05-16	1318	\N	20275	\N
102510	GENERIC_DAY	0	9	2010-05-26	1318	\N	20275	\N
102511	GENERIC_DAY	0	9	2010-05-12	1318	\N	20275	\N
102512	GENERIC_DAY	0	4	2010-05-14	1318	\N	20275	\N
102513	GENERIC_DAY	0	9	2010-05-18	1318	\N	20275	\N
102514	GENERIC_DAY	0	9	2010-05-24	1318	\N	20275	\N
102515	GENERIC_DAY	0	4	2010-06-04	1318	\N	20275	\N
102516	GENERIC_DAY	0	0	2010-05-08	1318	\N	20275	\N
102517	GENERIC_DAY	0	9	2010-05-19	1318	\N	20275	\N
102518	GENERIC_DAY	0	0	2010-05-30	1318	\N	20275	\N
102519	GENERIC_DAY	0	9	2010-06-02	1318	\N	20275	\N
102520	GENERIC_DAY	0	9	2010-06-14	1318	\N	20275	\N
102521	GENERIC_DAY	0	0	2010-06-06	1318	\N	20275	\N
102522	GENERIC_DAY	0	0	2010-05-15	1318	\N	20275	\N
102523	GENERIC_DAY	0	9	2010-06-01	1318	\N	20275	\N
102524	GENERIC_DAY	0	0	2010-05-22	1318	\N	20275	\N
102525	GENERIC_DAY	0	9	2010-06-21	1318	\N	20275	\N
102526	GENERIC_DAY	0	9	2010-05-25	1318	\N	20275	\N
102527	GENERIC_DAY	0	9	2010-05-11	1318	\N	20275	\N
102528	GENERIC_DAY	0	4	2010-05-21	1318	\N	20275	\N
102529	GENERIC_DAY	0	9	2010-05-20	1318	\N	20275	\N
102530	GENERIC_DAY	0	0	2010-06-20	1318	\N	20275	\N
102531	GENERIC_DAY	0	9	2010-06-16	1318	\N	20275	\N
102532	GENERIC_DAY	0	0	2010-05-29	1318	\N	20275	\N
102533	GENERIC_DAY	0	4	2010-06-18	1318	\N	20275	\N
102534	GENERIC_DAY	0	0	2010-06-19	1318	\N	20275	\N
102535	GENERIC_DAY	0	0	2010-05-09	1318	\N	20275	\N
102536	GENERIC_DAY	0	9	2010-06-03	1318	\N	20275	\N
102537	GENERIC_DAY	0	0	2010-05-23	1318	\N	20275	\N
102538	GENERIC_DAY	0	0	2010-06-05	1318	\N	20275	\N
102539	GENERIC_DAY	0	0	2010-05-17	1318	\N	20275	\N
102540	GENERIC_DAY	0	4	2010-06-25	1318	\N	20276	\N
102541	GENERIC_DAY	0	9	2010-07-06	1318	\N	20276	\N
102542	GENERIC_DAY	0	9	2010-07-07	1318	\N	20276	\N
102543	GENERIC_DAY	0	9	2010-07-01	1318	\N	20276	\N
102544	GENERIC_DAY	0	2	2010-07-08	1318	\N	20276	\N
102545	GENERIC_DAY	0	9	2010-06-24	1318	\N	20276	\N
102546	GENERIC_DAY	0	0	2010-06-26	1318	\N	20276	\N
102547	GENERIC_DAY	0	9	2010-06-30	1318	\N	20276	\N
102548	GENERIC_DAY	0	4	2010-07-02	1318	\N	20276	\N
102549	GENERIC_DAY	0	0	2010-07-04	1318	\N	20276	\N
102550	GENERIC_DAY	0	0	2010-07-03	1318	\N	20276	\N
102551	GENERIC_DAY	0	9	2010-06-23	1318	\N	20276	\N
102552	GENERIC_DAY	0	9	2010-07-05	1318	\N	20276	\N
102553	GENERIC_DAY	0	9	2010-06-22	1318	\N	20276	\N
102554	GENERIC_DAY	0	9	2010-06-28	1318	\N	20276	\N
102555	GENERIC_DAY	0	0	2010-06-27	1318	\N	20276	\N
102556	GENERIC_DAY	0	9	2010-06-29	1318	\N	20276	\N
102557	GENERIC_DAY	0	5	2010-09-14	1320	\N	20279	\N
102558	GENERIC_DAY	0	6	2010-07-14	1320	\N	20279	\N
102559	GENERIC_DAY	0	5	2010-08-31	1320	\N	20279	\N
102560	GENERIC_DAY	0	1	2010-07-30	1320	\N	20279	\N
102561	GENERIC_DAY	0	6	2010-07-12	1320	\N	20279	\N
102562	GENERIC_DAY	0	5	2010-09-15	1320	\N	20279	\N
102563	GENERIC_DAY	0	5	2010-09-16	1320	\N	20279	\N
102564	GENERIC_DAY	0	5	2010-10-12	1320	\N	20279	\N
102565	GENERIC_DAY	0	5	2010-10-04	1320	\N	20279	\N
102566	GENERIC_DAY	0	6	2010-07-28	1320	\N	20279	\N
102567	GENERIC_DAY	0	6	2010-08-10	1320	\N	20279	\N
102568	GENERIC_DAY	0	5	2010-09-21	1320	\N	20279	\N
102569	GENERIC_DAY	0	1	2010-07-09	1320	\N	20279	\N
102570	GENERIC_DAY	0	5	2010-08-16	1320	\N	20279	\N
102571	GENERIC_DAY	0	6	2010-07-15	1320	\N	20279	\N
102572	GENERIC_DAY	0	5	2010-09-02	1320	\N	20279	\N
102573	GENERIC_DAY	0	6	2010-08-05	1320	\N	20279	\N
102574	GENERIC_DAY	0	5	2010-08-17	1320	\N	20279	\N
102575	GENERIC_DAY	0	5	2010-10-13	1320	\N	20279	\N
102576	GENERIC_DAY	0	6	2010-08-02	1320	\N	20279	\N
102577	GENERIC_DAY	0	1	2010-07-16	1320	\N	20279	\N
102578	GENERIC_DAY	0	6	2010-07-29	1320	\N	20279	\N
102579	GENERIC_DAY	0	5	2010-09-09	1320	\N	20279	\N
102580	GENERIC_DAY	0	5	2010-09-08	1320	\N	20279	\N
102581	GENERIC_DAY	0	6	2010-07-13	1320	\N	20279	\N
102582	GENERIC_DAY	0	6	2010-07-22	1320	\N	20279	\N
102583	GENERIC_DAY	0	5	2010-09-30	1320	\N	20279	\N
102584	GENERIC_DAY	0	5	2010-09-27	1320	\N	20279	\N
102585	GENERIC_DAY	0	5	2010-09-01	1320	\N	20279	\N
102586	GENERIC_DAY	0	5	2010-08-26	1320	\N	20279	\N
102587	GENERIC_DAY	0	5	2010-09-29	1320	\N	20279	\N
102588	GENERIC_DAY	0	6	2010-07-26	1320	\N	20279	\N
102589	GENERIC_DAY	0	6	2010-08-04	1320	\N	20279	\N
102590	GENERIC_DAY	0	5	2010-10-11	1320	\N	20279	\N
102591	GENERIC_DAY	0	5	2010-10-05	1320	\N	20279	\N
102592	GENERIC_DAY	0	1	2010-08-06	1320	\N	20279	\N
102593	GENERIC_DAY	0	6	2010-08-11	1320	\N	20279	\N
102594	GENERIC_DAY	0	5	2010-08-18	1320	\N	20279	\N
102595	GENERIC_DAY	0	6	2010-07-19	1320	\N	20279	\N
102596	GENERIC_DAY	0	5	2010-09-06	1320	\N	20279	\N
102597	GENERIC_DAY	0	5	2010-08-24	1320	\N	20279	\N
102598	GENERIC_DAY	0	5	2010-09-22	1320	\N	20279	\N
102599	GENERIC_DAY	0	5	2010-08-30	1320	\N	20279	\N
102600	GENERIC_DAY	0	5	2010-09-13	1320	\N	20279	\N
102601	GENERIC_DAY	0	6	2010-08-03	1320	\N	20279	\N
102602	GENERIC_DAY	0	6	2010-08-09	1320	\N	20279	\N
102603	GENERIC_DAY	0	5	2010-08-23	1320	\N	20279	\N
102604	GENERIC_DAY	0	5	2010-10-06	1320	\N	20279	\N
102605	GENERIC_DAY	0	5	2010-09-23	1320	\N	20279	\N
102606	GENERIC_DAY	0	5	2010-08-19	1320	\N	20279	\N
102607	GENERIC_DAY	0	6	2010-07-20	1320	\N	20279	\N
102608	GENERIC_DAY	0	5	2010-08-25	1320	\N	20279	\N
102609	GENERIC_DAY	0	6	2010-07-21	1320	\N	20279	\N
102610	GENERIC_DAY	0	6	2010-08-12	1320	\N	20279	\N
102611	GENERIC_DAY	0	5	2010-10-07	1320	\N	20279	\N
102612	GENERIC_DAY	0	1	2010-07-23	1320	\N	20279	\N
102613	GENERIC_DAY	0	5	2010-09-28	1320	\N	20279	\N
102614	GENERIC_DAY	0	6	2010-07-27	1320	\N	20279	\N
102615	GENERIC_DAY	0	5	2010-09-07	1320	\N	20279	\N
102616	GENERIC_DAY	0	5	2010-09-20	1320	\N	20279	\N
102617	GENERIC_DAY	0	0	2010-07-25	1320	\N	20290	\N
102618	GENERIC_DAY	0	5	2010-07-28	1320	\N	20290	\N
102619	GENERIC_DAY	0	2	2010-07-09	1320	\N	20290	\N
102620	GENERIC_DAY	0	0	2010-07-10	1320	\N	20290	\N
102621	GENERIC_DAY	0	5	2010-07-22	1320	\N	20290	\N
102622	GENERIC_DAY	0	0	2010-08-01	1320	\N	20290	\N
102623	GENERIC_DAY	0	5	2010-08-02	1320	\N	20290	\N
102624	GENERIC_DAY	0	0	2010-07-17	1320	\N	20290	\N
102625	GENERIC_DAY	0	2	2010-07-23	1320	\N	20290	\N
102626	GENERIC_DAY	0	5	2010-07-20	1320	\N	20290	\N
102627	GENERIC_DAY	0	2	2010-08-06	1320	\N	20290	\N
102628	GENERIC_DAY	0	2	2010-07-30	1320	\N	20290	\N
102629	GENERIC_DAY	0	5	2010-08-03	1320	\N	20290	\N
102630	GENERIC_DAY	0	5	2010-07-26	1320	\N	20290	\N
102631	GENERIC_DAY	0	0	2010-07-24	1320	\N	20290	\N
102632	GENERIC_DAY	0	0	2010-07-31	1320	\N	20290	\N
102633	GENERIC_DAY	0	5	2010-07-29	1320	\N	20290	\N
102634	GENERIC_DAY	0	5	2010-07-15	1320	\N	20290	\N
102635	GENERIC_DAY	0	5	2010-08-04	1320	\N	20290	\N
102636	GENERIC_DAY	0	0	2010-07-18	1320	\N	20290	\N
102637	GENERIC_DAY	0	5	2010-08-05	1320	\N	20290	\N
102638	GENERIC_DAY	0	5	2010-07-19	1320	\N	20290	\N
102639	GENERIC_DAY	0	5	2010-07-14	1320	\N	20290	\N
102640	GENERIC_DAY	0	0	2010-07-11	1320	\N	20290	\N
102641	GENERIC_DAY	0	0	2010-08-07	1320	\N	20290	\N
102642	GENERIC_DAY	0	5	2010-07-13	1320	\N	20290	\N
102643	GENERIC_DAY	0	5	2010-07-12	1320	\N	20290	\N
102644	GENERIC_DAY	0	5	2010-07-21	1320	\N	20290	\N
102645	GENERIC_DAY	0	0	2010-08-08	1320	\N	20290	\N
102646	GENERIC_DAY	0	2	2010-07-16	1320	\N	20290	\N
102647	GENERIC_DAY	0	5	2010-07-27	1320	\N	20290	\N
102648	GENERIC_DAY	0	5	2011-01-19	1320	\N	20291	\N
102649	GENERIC_DAY	0	2	2011-01-07	1320	\N	20291	\N
102650	GENERIC_DAY	0	5	2011-01-26	1320	\N	20291	\N
102651	GENERIC_DAY	0	2	2011-01-21	1320	\N	20291	\N
102652	GENERIC_DAY	0	0	2010-12-26	1320	\N	20291	\N
102653	GENERIC_DAY	0	0	2011-01-15	1320	\N	20291	\N
102654	GENERIC_DAY	0	0	2011-01-01	1320	\N	20291	\N
102655	GENERIC_DAY	0	5	2011-02-03	1320	\N	20291	\N
102656	GENERIC_DAY	0	5	2010-12-21	1320	\N	20291	\N
102657	GENERIC_DAY	0	0	2011-01-23	1320	\N	20291	\N
102658	GENERIC_DAY	0	5	2011-01-05	1320	\N	20291	\N
102659	GENERIC_DAY	0	2	2010-12-10	1320	\N	20291	\N
102660	GENERIC_DAY	0	0	2011-01-16	1320	\N	20291	\N
102661	GENERIC_DAY	0	5	2011-01-12	1320	\N	20291	\N
102662	GENERIC_DAY	0	5	2010-12-22	1320	\N	20291	\N
102663	GENERIC_DAY	0	5	2011-01-04	1320	\N	20291	\N
102664	GENERIC_DAY	0	2	2010-12-24	1320	\N	20291	\N
102665	GENERIC_DAY	0	5	2011-02-08	1320	\N	20291	\N
102666	GENERIC_DAY	0	5	2011-01-25	1320	\N	20291	\N
102667	GENERIC_DAY	0	0	2010-12-19	1320	\N	20291	\N
102668	GENERIC_DAY	0	5	2010-12-13	1320	\N	20291	\N
102669	GENERIC_DAY	0	5	2010-12-14	1320	\N	20291	\N
102670	GENERIC_DAY	0	5	2011-01-24	1320	\N	20291	\N
102671	GENERIC_DAY	0	2	2010-12-31	1320	\N	20291	\N
102672	GENERIC_DAY	0	5	2011-01-17	1320	\N	20291	\N
102673	GENERIC_DAY	0	5	2011-02-02	1320	\N	20291	\N
102674	GENERIC_DAY	0	0	2011-02-05	1320	\N	20291	\N
102675	GENERIC_DAY	0	2	2010-12-17	1320	\N	20291	\N
102676	GENERIC_DAY	0	5	2011-01-03	1320	\N	20291	\N
102677	GENERIC_DAY	0	5	2011-01-06	1320	\N	20291	\N
102678	GENERIC_DAY	0	5	2010-12-23	1320	\N	20291	\N
102679	GENERIC_DAY	0	5	2010-12-28	1320	\N	20291	\N
102680	GENERIC_DAY	0	0	2010-12-18	1320	\N	20291	\N
102681	GENERIC_DAY	0	0	2010-12-25	1320	\N	20291	\N
102682	GENERIC_DAY	0	0	2010-12-11	1320	\N	20291	\N
102683	GENERIC_DAY	0	5	2011-02-07	1320	\N	20291	\N
102684	GENERIC_DAY	0	5	2010-12-09	1320	\N	20291	\N
102685	GENERIC_DAY	0	5	2011-01-20	1320	\N	20291	\N
102686	GENERIC_DAY	0	0	2011-02-06	1320	\N	20291	\N
102687	GENERIC_DAY	0	2	2011-02-04	1320	\N	20291	\N
102688	GENERIC_DAY	0	2	2011-02-09	1320	\N	20291	\N
102689	GENERIC_DAY	0	5	2011-01-11	1320	\N	20291	\N
102690	GENERIC_DAY	0	5	2011-02-01	1320	\N	20291	\N
102691	GENERIC_DAY	0	0	2011-01-22	1320	\N	20291	\N
102692	GENERIC_DAY	0	0	2011-01-02	1320	\N	20291	\N
102693	GENERIC_DAY	0	0	2011-01-08	1320	\N	20291	\N
102694	GENERIC_DAY	0	5	2010-12-20	1320	\N	20291	\N
102695	GENERIC_DAY	0	0	2011-01-09	1320	\N	20291	\N
102696	GENERIC_DAY	0	5	2010-12-27	1320	\N	20291	\N
102697	GENERIC_DAY	0	5	2010-12-08	1320	\N	20291	\N
102698	GENERIC_DAY	0	5	2011-01-27	1320	\N	20291	\N
102699	GENERIC_DAY	0	5	2011-01-18	1320	\N	20291	\N
102700	GENERIC_DAY	0	5	2010-12-30	1320	\N	20291	\N
102701	GENERIC_DAY	0	2	2011-01-14	1320	\N	20291	\N
102702	GENERIC_DAY	0	5	2010-12-29	1320	\N	20291	\N
102703	GENERIC_DAY	0	5	2010-12-15	1320	\N	20291	\N
102704	GENERIC_DAY	0	5	2011-01-13	1320	\N	20291	\N
102705	GENERIC_DAY	0	0	2011-01-29	1320	\N	20291	\N
102706	GENERIC_DAY	0	5	2011-01-31	1320	\N	20291	\N
102707	GENERIC_DAY	0	0	2011-01-30	1320	\N	20291	\N
102708	GENERIC_DAY	0	0	2010-12-12	1320	\N	20291	\N
102709	GENERIC_DAY	0	5	2011-01-10	1320	\N	20291	\N
102710	GENERIC_DAY	0	2	2011-01-28	1320	\N	20291	\N
102711	GENERIC_DAY	0	5	2010-12-16	1320	\N	20291	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
819228	13	\N	\N	1
819230	14	\N	\N	0
819229	14	\N	\N	0
6520873	7	20000	20001	0
6520870	7	20003	20004	1
6520865	6	20003	20004	1
6520941	7	20003	20004	1
6520866	6	20004	20005	0
6520942	7	20004	20005	0
6520871	7	20004	20005	0
6521254	2	20040	20005	0
6521294	2	20042	20025	0
6521287	7	20022	20026	0
6521253	2	20040	20005	0
6520869	7	20002	20006	0
6520940	7	20002	20006	0
6520864	6	20002	20006	0
6520867	6	19999	20000	0
6521292	4	20023	20025	0
6521293	4	20023	20025	0
6521290	7	20023	20024	1
6521288	7	20019	20020	0
6521289	7	20020	20021	0
6521295	2	20042	20025	0
6520872	7	19999	20000	0
6520943	7	19999	20000	0
6520944	7	20000	20001	0
6520868	6	20000	20001	0
6521291	3	\N	\N	0
6520985	5	20012	20016	0
6521174	5	20012	20016	0
6521152	5	20012	20016	0
13205518	2	40501	40502	0
6520980	4	20012	20016	0
13205525	2	40501	40502	0
6521360	7	20058	20062	0
6521370	7	20058	20062	0
6521371	7	20059	20061	0
6521361	7	20059	20061	0
6521372	7	20059	20060	1
6521362	7	20059	20060	1
6521375	3	20064	20061	0
6521373	7	20055	20056	0
6521363	7	20055	20056	0
6521374	7	20056	20057	0
6521364	7	20056	20057	0
6520986	5	20009	20010	0
6521153	5	20009	20010	0
6521175	5	20009	20010	0
6520970	4	20009	20010	0
6520981	4	20009	20010	0
6521243	5	20009	20010	0
6521176	5	20010	20011	0
6521244	5	20010	20011	0
6520982	4	20010	20011	0
6520987	5	20010	20011	0
6520971	4	20010	20011	0
6521154	5	20010	20011	0
6521245	5	20013	20014	1
6521333	9	20047	20051	0
6521338	10	20047	20051	0
6521343	10	20047	20051	0
6521346	10	20044	20045	0
6521341	10	20044	20045	0
6521336	9	20044	20045	0
6521347	10	20045	20046	0
6521337	9	20045	20046	0
6521342	10	20045	20046	0
6521349	4	20053	20050	0
6521348	4	20053	20050	0
6521344	10	20048	20049	1
6521334	9	20048	20049	1
6521339	10	20048	20049	1
6521335	9	20048	20050	0
6521345	10	20048	20050	0
6521340	10	20048	20050	0
6521242	5	20012	20016	0
6520969	4	20012	20016	0
6521155	5	20013	20014	1
6520983	4	20013	20014	1
6521177	5	20013	20014	1
6520988	5	20013	20014	1
6521178	5	20014	20015	0
6521156	5	20014	20015	0
6520989	5	20014	20015	0
6521246	5	20014	20015	0
6520984	4	20014	20015	0
6521252	3	20029	20015	0
6521251	3	20029	20015	0
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
57570	Incidencia	
87971	Observaciones	Ningunha
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
40303	40200	100.00
52224	23685	100.00
52222	59288	100.00
62662	1620	300.00
18808	1619	100.00
18605	1623	5.00
18606	1624	10.00
18607	1625	15.00
18809	1626	100.00
62666	89689	100.00
62668	23672	100.00
91256	23636	100.00
52218	23636	2000.00
52217	23636	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1818	1	Vulcano	A36600740	t	f	f	\N	\N	\N	\N
1819	1	Barreras	A36600971	t	f	f	\N	\N	\N	\N
1820	1	Factoria Naval de Marin	B81998841	t	f	f	\N	\N	\N	\N
1821	1	Navantia	B84076397	t	f	f	\N	\N	\N	\N
57772	1	Igalia	111A	t	t	t	http://localhost:8080/navalplanner-webapp/	admin	admin	910
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
20210
20240
20241
20242
20243
20246
20274
20275
20276
20279
20290
20291
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
36197
36198
36199
36215
36216
40806
40809
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
57368	Incidencia	30	0
87769	Observaciones	20	0
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
1024
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id, code) FROM stdin;
92415	1	18.00	2010-03-01	\N	92314	59792	3d49fcff-cf72-4f2d-ad1a-6e34d763f5bf
59893	2	30.00	2010-03-17	\N	40098	59792	e1b84b83-8478-494c-9d71-f47ec67d71e4
59894	2	20.00	2010-03-17	2010-12-31	40097	59792	072719a4-99e1-4fb1-8fe0-a5cd25d2f828
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
23949	5	PREFIX-00004-00008-00001	WORKER	200	1.00	f	23655	\N
23950	5	PREFIX-00004-00009-00001	WORKER	300	1.00	f	23657	\N
23951	5	PREFIX-00004-00010-00001	WORKER	250	1.00	f	23658	\N
23952	5	PREFIX-00004-00011-00001	WORKER	200	1.00	f	23659	\N
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
59413	1	ab2a568d-a315-43e8-bc49-664b0a2e1615	WORKER	100	1.00	f	\N	60234
59414	1	ee9e85ec-df41-4c2d-a4f6-b21475da86ee	WORKER	100	1.00	f	\N	60235
59415	1	88fbd56f-34e3-4e4b-8cf6-c0742528ba7e	WORKER	200	1.00	f	\N	60237
40400	4	PREFIX-00007-00001-00001	WORKER	100	1.00	f	40200	\N
40401	4	PREFIX-00007-00002-00001	WORKER	100	1.00	f	40201	\N
59416	1	c9bba7b1-eb33-454c-b05d-6b9f939044d8	WORKER	200	1.00	f	\N	60238
59417	1	4ee375b4-2951-4d87-ae84-9e716e272c90	WORKER	100	1.00	f	\N	60239
59418	1	d116dbc2-cf37-4021-b885-82246a14a671	WORKER	300	1.00	f	\N	60241
59388	4	PREFIX-00008-00001-00001	WORKER	200	1.00	f	59288	\N
59419	1	5a80fa2a-4eb0-4ca5-9656-62e05cf1dac2	WORKER	250	1.00	f	\N	60242
59420	1	31c526e6-5a79-4df7-bc7d-e63654e8d2ad	WORKER	200	1.00	f	\N	60243
1919	16	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1620	\N
1920	16	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1621	\N
1921	16	PREFIX-00002-00006-00001	WORKER	200	1.00	f	1623	\N
1922	16	PREFIX-00002-00007-00001	WORKER	200	1.00	f	1624	\N
1923	16	PREFIX-00002-00008-00001	WORKER	100	1.00	f	1625	\N
1924	16	PREFIX-00002-00009-00001	WORKER	300	1.00	f	1627	\N
1925	16	PREFIX-00002-00010-00001	WORKER	250	1.00	f	1628	\N
1926	16	PREFIX-00002-00011-00001	WORKER	200	1.00	f	1629	\N
89789	3	PREFIX-00009-00001-00001	WORKER	200	1.00	f	89689	\N
89796	1	cbc36f34-5bb9-4e3e-89e5-22c1dbbb67e4	WORKER	100	1.00	f	\N	90203
89797	1	01557121-cea3-443c-8875-b9074dba9e2f	WORKER	100	1.00	f	\N	90204
89822	1	37e996fd-4f84-4028-afd0-8153b1112ca0	WORKER	100	1.00	f	\N	90243
89823	1	4cb6471f-7489-44e7-a068-2af06690dadc	WORKER	100	1.00	f	\N	90244
89824	1	5a5f1622-71b7-41e9-b317-c19863aa50ae	WORKER	350	1.00	f	\N	90246
89825	1	7071a667-11b7-4c85-816d-4118e1793369	WORKER	250	1.00	f	\N	90247
89826	1	5d539f03-981d-4f07-a696-934e33b73d83	WORKER	200	1.00	f	\N	90248
89827	1	c70cf50a-dad2-4274-b6b8-de27475babed	WORKER	300	1.00	f	\N	90250
89828	1	608f0096-421d-4d54-ab77-277dadc0fd58	WORKER	250	1.00	f	\N	90251
89829	1	a228a4b5-b754-40cf-a3af-6951c3529be9	WORKER	200	1.00	f	\N	90252
23937	7	PREFIX-00003-00004-00001	WORKER	100	1.00	f	23637	\N
23938	7	PREFIX-00003-00005-00001	WORKER	100	1.00	f	23638	\N
23939	7	PREFIX-00003-00006-00001	WORKER	350	1.00	f	23640	\N
23940	7	PREFIX-00003-00007-00001	WORKER	200	1.00	f	23641	\N
23941	7	PREFIX-00003-00008-00001	WORKER	100	1.00	f	23642	\N
23942	7	PREFIX-00003-00009-00001	WORKER	300	1.00	f	23644	\N
23943	7	PREFIX-00003-00010-00001	WORKER	250	1.00	f	23645	\N
23944	7	PREFIX-00003-00011-00001	WORKER	200	1.00	f	23646	\N
23953	7	PREFIX-00005-00004-00001	WORKER	100	1.00	f	23663	\N
23954	7	PREFIX-00005-00005-00001	WORKER	100	1.00	f	23664	\N
23955	7	PREFIX-00005-00006-00001	WORKER	350	1.00	f	23666	\N
23956	7	PREFIX-00005-00007-00001	WORKER	200	1.00	f	23667	\N
23957	7	PREFIX-00005-00008-00001	WORKER	100	1.00	f	23668	\N
23958	7	PREFIX-00005-00009-00001	WORKER	300	1.00	f	23670	\N
23959	7	PREFIX-00005-00010-00001	WORKER	250	1.00	f	23671	\N
23960	7	PREFIX-00005-00011-00001	WORKER	200	1.00	f	23672	\N
90883	2	PREFIX-00010-00004-00001	WORKER	100	1.00	f	91423	\N
90884	2	PREFIX-00010-00005-00001	WORKER	100	1.00	f	91424	\N
90885	2	PREFIX-00010-00006-00001	WORKER	350	1.00	f	91426	\N
90886	2	PREFIX-00010-00007-00001	WORKER	250	1.00	f	91427	\N
90887	2	PREFIX-00010-00008-00001	WORKER	200	1.00	f	91428	\N
90888	2	PREFIX-00010-00009-00001	WORKER	300	1.00	f	91430	\N
90889	2	PREFIX-00010-00010-00001	WORKER	250	1.00	f	91431	\N
90890	2	PREFIX-00010-00011-00001	WORKER	200	1.00	f	91432	\N
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
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
23752	23675
23753	23678
23754	23682
23751	23674
23742	23649
23743	23652
23744	23656
23741	23648
40304	40199
40300	40199
52223	59287
52221	59287
52225	23682
52226	23674
62663	1619
62664	1618
1719	1619
1720	1622
18608	1622
1721	1626
18609	1618
1722	1618
18810	1618
62667	89688
62665	89688
91225	91422
91226	91425
91227	91429
91228	91421
23747	23662
23748	23665
23749	23669
62669	23669
23746	23661
62670	23661
91257	23635
23737	23636
23738	23639
23739	23643
52220	23635
52219	23635
23736	23635
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1212	1	21c56bf5-015f-4382-8ecd-321c2d3fc63d	Media	1111
1213	1	5b859874-e535-4ddb-89d1-36979c7c941f	Urxente	1111
1214	1	6dc2a575-684a-4f2b-8322-c6c4c7b9cdf5	Baixa	1111
1215	1	7aca4595-6e0d-4ac9-8313-4d11aa93f219	Moi urxente	1111
1216	1	dbeb9835-2ede-4a4b-b25b-b0d35d50672e	centro de coste 3	1112
1217	1	50cd216d-59bf-4e8e-8b16-0fc23878553f	centro de coste 2	1112
1218	1	5d278674-9d8f-41d9-9797-944ca2198334	centro de coste 4	1112
1219	1	253c6726-02ad-4032-9ef1-ebf534bc52ae	centro de coste 1	1112
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
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name) FROM stdin;
1111	1	dbc01881-4cff-4a53-ae52-4ae8e28dbbc7	Prioridade
1112	1	7b93c698-9c2c-4fca-a400-005cb0aa2740	Centro de custe
1113	1	d0cca5f0-bf4c-4456-b91c-3e26b6a9e584	Nacionalidade cliente
1114	1	2fc375cd-d6d1-43c9-91fc-9f197bcb4d9a	Peligrosidade traballo
1115	1	637b38d1-b64a-4171-a3e4-4e076924a657	Posibilidade de retraso
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
60701	1	dafasd	asdfsdf	12.00	\N	f	60600
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
91809	2	6	12.00	60701	2010-04-18 00:00:00	0	23666
91810	2	6	12.00	60701	2010-04-18 00:00:00	1	23666
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
808	2	Imported materials without category	\N
60600	1	tornillos	\N
60601	1	tuercas	\N
60602	1	tornillos 10m	60600
60603	1	tornillos 12m	60600
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
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
910	5	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
23837	USER	5	WRITE_AUTHORIZATION	23648	910	\N
23839	USER	5	WRITE_AUTHORIZATION	23674	910	\N
40602	USER	3	WRITE_AUTHORIZATION	40199	910	\N
2020	USER	15	WRITE_AUTHORIZATION	1618	910	\N
91708	USER	1	WRITE_AUTHORIZATION	91421	910	\N
23838	USER	7	WRITE_AUTHORIZATION	23661	910	\N
23836	USER	7	WRITE_AUTHORIZATION	23635	910	\N
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
23648	Usuario grupo 3	\N	t	11	200000.00	0.00	1750	\N	\N	0	1819	3
23674	Usuario grupo 5	\N	t	11	250000.00	0.00	1600	\N	\N	0	1820	3
40199	Javier Moran	\N	t	2	0.00	0.00	200	ref-1	\N	0	1819	1
59287	\N	\N	t	1	10000.00	0.00	200	subcontrac1	\N	5	57772	1
1618	Usuario grupo 1	\N	t	11	10000.00	0.00	1450	\N	\N	0	1818	2
89688	\N	\N	t	1	0.00	0.00	200	ref1	\N	5	57772	1
91421	\N	\N	t	11	0.00	0.00	1750	\N	\N	0	\N	3
23661	Usuario Grupo 4	\N	t	11	150000.00	0.00	1600	\N	\N	0	1820	3
23635	Alumno grupo 2	\N	t	11	100000.00	0.00	1600	\N	\N	0	1819	3
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
23651	5	Reunións con traballadores	\N	PREFIX-00004-00005	\N	\N	1	23649	\N	\N	1
23652	5	Bloque 1	\N	PREFIX-00004-00002	\N	\N	3	23648	\N	\N	1
23653	5	Pintar camarotes A e B	\N	PREFIX-00004-00006	\N	\N	0	23652	\N	\N	0
23654	5	Pintar sá de máquinas	\N	PREFIX-00004-00007	\N	\N	0	23652	\N	\N	1
23655	5	Pintar cociñas de buque	\N	PREFIX-00004-00008	\N	\N	0	23652	\N	\N	2
23656	5	Bloque 2	\N	PREFIX-00004-00003	\N	\N	3	23648	\N	\N	2
23657	5	Teito de madeira de camarote A	\N	PREFIX-00004-00009	\N	\N	0	23656	\N	\N	0
23658	5	Cama e mesillas de camarote A	\N	PREFIX-00004-00010	\N	\N	0	23656	\N	\N	1
23659	5	Poñer escotillas camarote A	\N	PREFIX-00004-00011	\N	\N	0	23656	\N	\N	2
23648	7	Pedido Grupo 3	\N	PREFIX-00004	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23649	5	Coordinacion	\N	PREFIX-00004-00001	\N	\N	0	23648	\N	\N	0
23650	5	Reunións con cliente	\N	PREFIX-00004-00004	\N	\N	1	23649	\N	\N	0
23675	5	Coordinacion	\N	PREFIX-00006-00001	\N	\N	0	23674	\N	\N	0
23676	5	Reunions con traballadores	\N	PREFIX-00006-00004	\N	\N	1	23675	\N	\N	0
23677	5	Reunions cliente	\N	PREFIX-00006-00005	\N	\N	1	23675	\N	\N	1
23678	5	Bloque 1	\N	PREFIX-00006-00002	\N	\N	3	23674	\N	\N	1
23679	5	Pintar camarotes A e B	\N	PREFIX-00006-00006	\N	\N	0	23678	\N	\N	0
23680	5	Pintar sá de máquinas	\N	PREFIX-00006-00007	\N	\N	0	23678	\N	\N	1
23681	5	Pintar cociñas de buque	\N	PREFIX-00006-00008	\N	\N	0	23678	\N	\N	2
23683	5	Aillar camarote A	\N	PREFIX-00006-00009	\N	\N	0	23682	\N	\N	0
23684	5	Aillar camarote B	\N	PREFIX-00006-00010	\N	\N	0	23682	\N	\N	1
40199	4	Pedido valor ganado	Pedido para Barreras	PREFIX-00007	2010-03-17 13:27:39.957	\N	3	\N	\N	\N	\N
40200	4	task1	\N	PREFIX-00007-00001	\N	\N	0	40199	\N	\N	0
40201	4	task2	\N	PREFIX-00007-00002	\N	\N	0	40199	\N	\N	1
23685	6	Aillar camarote C	\N	PREFIX-00006-00011	\N	\N	0	23682	\N	\N	2
23682	6	Bloque 2	\N	PREFIX-00006-00003	\N	\N	3	23674	\N	\N	2
23674	8	Pedido Grupo 5	\N	PREFIX-00006	2010-03-01 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
1618	19	Pedido grupo 1	Pedido de proba	PREFIX-00002	2010-03-01 22:40:25.505	2011-02-01 00:00:00	3	\N	\N	\N	\N
1619	16	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	1618	\N	\N	0
1620	16	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	1619	\N	\N	0
1621	16	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	1619	\N	\N	1
1622	16	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	1618	\N	\N	1
1623	16	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	1622	\N	\N	0
1624	16	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	1622	\N	\N	1
1625	16	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	1622	\N	\N	2
1626	16	Bloque 2	\N	PREFIX-00002-00003	\N	\N	3	1618	\N	\N	2
1627	16	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	0	1626	\N	\N	0
1628	16	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	0	1626	\N	\N	1
23661	10	Pedido Grupo 4	\N	PREFIX-00005	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23662	7	Coordinacion	\N	PREFIX-00005-00001	\N	\N	0	23661	\N	\N	0
23663	7	Reunions con cliente	\N	PREFIX-00005-00004	\N	\N	1	23662	\N	\N	0
23635	9	Pedido Grupo 2	\N	PREFIX-00003	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23636	7	Coordinacion	\N	PREFIX-00003-00001	\N	\N	0	23635	\N	\N	0
23637	7	Reunions con cliente	\N	PREFIX-00003-00004	\N	\N	1	23636	\N	\N	0
23638	7	Reunions con traballadores	\N	PREFIX-00003-00005	\N	\N	1	23636	\N	\N	1
23639	7	Bloque 1	\N	PREFIX-00003-00002	\N	\N	3	23635	\N	\N	1
23640	7	Pintar camarotes A e B	\N	PREFIX-00003-00006	\N	\N	0	23639	\N	\N	0
23641	7	Pintar sá de máquinas	\N	PREFIX-00003-00007	\N	\N	0	23639	\N	\N	1
23642	7	Pintar cociñas de buque	\N	PREFIX-00003-00008	\N	\N	0	23639	\N	\N	2
23643	7	Bloque 2	\N	PREFIX-00003-00003	\N	\N	3	23635	\N	\N	2
23664	7	Reuncion con traballadores	\N	PREFIX-00005-00005	\N	\N	1	23662	\N	\N	1
23665	7	Bloque 1	\N	PREFIX-00005-00002	\N	\N	3	23661	\N	\N	1
23666	7	Soldar cuberta A	\N	PREFIX-00005-00006	\N	\N	0	23665	\N	\N	0
23667	7	Soldar cuberta B	\N	PREFIX-00005-00007	\N	\N	0	23665	\N	\N	1
23668	7	Soldar cuberta C	\N	PREFIX-00005-00008	\N	\N	0	23665	\N	\N	2
23669	8	Bloque 2	\N	PREFIX-00005-00003	\N	\N	3	23661	\N	\N	2
23670	7	Teito de madeira camarote A	\N	PREFIX-00005-00009	\N	\N	0	23669	\N	\N	0
23671	7	Cama e mesilla camarote A	\N	PREFIX-00005-00010	\N	\N	0	23669	\N	\N	1
91421	2	Modelo Pedido Grupo 3	\N	PREFIX-00010	2010-03-18 19:25:02.079	2011-06-11 00:00:00	3	\N	\N	\N	\N
91422	2	Coordinacion	\N	PREFIX-00010-00001	\N	\N	0	91421	90242	\N	0
91423	2	Reunións con cliente	\N	PREFIX-00010-00004	\N	\N	1	91422	90243	\N	0
91424	2	Reunións con traballadores	\N	PREFIX-00010-00005	\N	\N	1	91422	90244	\N	1
91425	2	Bloque 1	\N	PREFIX-00010-00002	\N	\N	3	91421	90245	\N	1
91426	2	Pintar camarotes A e B	\N	PREFIX-00010-00006	\N	\N	0	91425	90246	\N	0
91427	2	Pintar sá de máquinas	\N	PREFIX-00010-00007	\N	\N	0	91425	90247	\N	1
91428	2	Pintar cociñas de buque	\N	PREFIX-00010-00008	\N	\N	0	91425	90248	\N	2
59287	5	pedido sucontratado 1	\N	PREFIX-00008	2010-10-15 00:00:00	2010-12-18 00:00:00	3	\N	\N	\N	\N
59288	4	Aillar camarote C	\N	PREFIX-00008-00001	2010-10-15 00:00:00	2010-12-18 00:00:00	0	59287	\N	PREFIX-00006-00011	0
1629	16	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	0	1626	\N	\N	2
91429	2	Bloque 2	\N	PREFIX-00010-00003	\N	\N	3	91421	90249	\N	2
91430	2	Teito de madeira de camarote A	\N	PREFIX-00010-00009	\N	\N	0	91429	90250	\N	0
91431	2	Cama e mesillas de camarote A	\N	PREFIX-00010-00010	\N	\N	0	91429	90251	\N	1
91432	2	Poñer escotillas camarote A	\N	PREFIX-00010-00011	\N	\N	0	91429	90252	\N	2
23672	8	Poñer escotillas camarote A	\N	PREFIX-00005-00011	\N	\N	0	23669	\N	\N	2
89688	3	impartir curso	\N	PREFIX-00009	2010-10-14 00:00:00	2010-12-17 00:00:00	4	\N	\N	\N	\N
89689	3	Poñer escotillas camarote A	\N	PREFIX-00009-00001	2010-10-14 00:00:00	2010-12-17 00:00:00	4	89688	\N	PREFIX-00005-00011	0
23644	7	Aillar camarote A	\N	PREFIX-00003-00009	\N	\N	0	23643	\N	\N	0
23645	7	Aillar camarote B	\N	PREFIX-00003-00010	\N	\N	0	23643	\N	\N	1
23646	7	Aillar camarote C	\N	PREFIX-00003-00011	\N	\N	0	23643	\N	\N	2
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
60232	1	Plantilla edido grupo 1	Pedido de proba	PREFIX-00002	0	336	3	\N	\N
90245	1	Bloque 1	\N	PREFIX-00004-00002	\N	\N	3	90241	1
90249	1	Bloque 2	\N	PREFIX-00004-00003	\N	\N	3	90241	2
90243	1	Reunións con cliente	\N	PREFIX-00004-00004	\N	\N	1	90242	0
90244	1	Reunións con traballadores	\N	PREFIX-00004-00005	\N	\N	1	90242	1
90246	1	Pintar camarotes A e B	\N	PREFIX-00004-00006	\N	\N	0	90245	0
90247	1	Pintar sá de máquinas	\N	PREFIX-00004-00007	\N	\N	0	90245	1
90248	1	Pintar cociñas de buque	\N	PREFIX-00004-00008	\N	\N	0	90245	2
90250	1	Teito de madeira de camarote A	\N	PREFIX-00004-00009	\N	\N	0	90249	0
90251	1	Cama e mesillas de camarote A	\N	PREFIX-00004-00010	\N	\N	0	90249	1
90252	1	Poñer escotillas camarote A	\N	PREFIX-00004-00011	\N	\N	0	90249	2
60233	1	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	60232	0
60236	1	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	60232	1
60240	1	Bloque 2	\N	PREFIX-00002-00003	\N	\N	3	60232	2
60234	1	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	60233	0
60235	1	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	60233	1
60237	1	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	60236	0
60238	1	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	60236	1
60239	1	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	60236	2
60241	1	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	0	60240	0
60242	1	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	0	60240	1
60243	1	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	0	60240	2
90202	1	Modelo Coordinacion	\N	PREFIX-00003-00001	\N	\N	0	\N	\N
90203	1	Reunions con cliente	\N	PREFIX-00003-00004	\N	\N	1	90202	0
90204	1	Reunions con traballadores	\N	PREFIX-00003-00005	\N	\N	1	90202	1
90241	1	Modelo Pedido Grupo 3	\N	PREFIX-00004	0	450	3	\N	\N
90242	1	Coordinacion	\N	PREFIX-00004-00001	\N	\N	0	90241	0
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
23676	1
23677	1
23679	1
23680	1
23681	1
23683	1
23684	1
23685	1
40200	1
40201	1
59288	1
1620	1
1621	1
1623	1
1624	1
1625	1
1627	1
1628	1
1629	1
89689	1
91423	1
91424	1
91426	1
91427	1
91428	1
91430	1
91431	1
91432	1
23663	1
23664	1
23666	1
23667	1
23668	1
23670	1
23671	1
23672	1
23637	1
23638	1
23640	1
23641	1
23642	1
23644	1
23645	1
23646	1
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
40199
59287
89688
91421
91422
91425
91429
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
60232
60233
60236
60240
90202
90241
90242
90245
90249
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
60234	0
60235	0
60237	0
60238	0
60239	0
60241	0
60242	0
60243	0
90203	0
90204	0
90243	0
90244	0
90246	0
90247	0
90248	0
90250	0
90251	0
90252	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	13	PREFIX	10	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
60232	2
90241	3
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
60095	2	Chequeo de calidad		0	t	52117
91910	2	Formulario Tipo A Validacion de Tubos		0	t	62520
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
60095	superar test1	30.00	0	0
60095	prueba de carga	40.00	1	1
60095	encendido de motor	70.00	2	2
91910	Pruebas	25.00	0	0
91910	Montajes	34.00	1	1
91910	Revisar Soldaduras	57.00	2	2
91910	Checkear fugas	80.00	3	3
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, code, base_calendar_id) FROM stdin;
1326	7	957da07c-acbb-46fd-8c3e-b5ac5cea484c	28
1322	8	b7e4edea-e931-4102-88d3-962be706b466	25
1318	6	7fd7e451-a5b9-4c92-8e98-8c3d02a1c704	23
19494	4	be8d0725-0e03-47ef-bfbb-db2f1c112886	19594
19496	3	fa2bfc09-457e-45c4-ba94-ef0b6fb01ad6	19595
1328	7	d74f0b01-ddd8-4b95-8f95-5dfa03c79546	29
19498	3	711a6f7d-dff3-4ed0-83ed-5f39f16b78eb	19596
1324	9	ef90a026-8a24-4057-b62f-527c96e31703	26
1330	6	f690462b-f214-472d-9e2b-46c1a4331c10	30
1332	7	405854ff-894b-43a4-9790-d330c25eb2a4	31
19500	4	1a33e076-82ba-4111-93bb-227178d352bb	19597
1320	11	769eaabf-19fb-49db-a1f3-316b10ce927a	24
2728	8	4514cc7a-2994-4ce1-a030-187bb7428930	2828
1314	22	56f6adc6-0bd2-43f6-916f-c31b6b1e9b3a	21
1316	23	39971158-b905-4ab6-80f1-ce7ef1c35c2f	22
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
20274	5	1.00	20009	\N
20275	5	1.00	20010	\N
30466	3	0.78	20023	\N
30467	3	0.55	20024	\N
30468	3	1.00	20025	\N
20292	5	0.60	20018	\N
30421	4	1.00	20019	\N
30422	4	1.00	20020	\N
30423	4	1.00	20021	\N
20276	5	1.00	20011	\N
20247	6	1.00	20008	\N
20279	4	0.58	20013	\N
20290	3	0.55	20014	\N
40806	1	0.20	40501	\N
20291	3	0.50	20015	\N
40809	0	0.40	40502	\N
36215	3	0.55	20059	\N
36216	3	0.55	20060	\N
36197	4	1.00	20055	\N
36198	4	1.00	20056	\N
36199	4	1.00	20057	\N
36168	5	0.60	20054	\N
20201	11	0.71	19998	87063
20210	10	1.00	19999	\N
20240	9	1.00	20000	\N
20241	9	1.00	20001	\N
20242	9	0.53	20003	\N
20243	9	0.38	20004	\N
20246	8	0.50	20005	\N
30498	7	1.00	20044	\N
30499	7	1.00	20045	\N
30500	7	1.00	20046	\N
36161	6	0.64	20048	\N
36164	5	0.55	20049	\N
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
23	1
28	1
25	1
19594	1
19595	1
29	1
19596	1
26	1
30	1
31	1
19597	1
24	1
2828	1
21	1
22	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
59994	2	3fe9d20e-feb9-49b9-a9fd-3fe3bfda23a2	2010-03-17	\N	59792	1320
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
20292	19496
36168	19500
20201	2728
20247	19494
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
87063	2010-03-13	0.20	0.40	0
87063	2010-05-01	1.00	1.00	1
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
87063	0
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, task_element_id, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
19103745	4	57772	20061	2010-03-17 19:14:06.163	2010-03-17 19:19:53.622	pedido sucontratado 1	10000.00	subcontrac1	\N	\N	\N	t	2
28966913	5	57772	20050	2010-03-18 18:46:50.816	2010-03-18 18:50:58.829	impartir curso	0.00	ref1	\N	\N	\N	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
20023	2	0	\N	\N
20024	0	0	\N	\N
20025	1	0	\N	\N
20018	1	0	\N	\N
20019	1	0	\N	\N
20020	1	0	\N	\N
20021	1	0	\N	\N
40501	1	0	\N	\N
40502	1	0	\N	\N
19998	1	0	\N	\N
19999	1	0	\N	\N
20000	1	0	\N	\N
20001	1	0	\N	\N
20003	2	0	\N	\N
20004	0	0	\N	\N
20005	1	0	\N	\N
20059	2	0	\N	\N
20060	0	0	\N	\N
20055	1	0	\N	\N
20056	1	0	\N	\N
20057	1	0	\N	\N
20054	1	0	\N	\N
20061	1	2	2010-10-15 00:00:00	19103745
59489	1	1	2010-10-15 00:00:00	\N
91607	1	0	\N	\N
91608	1	0	\N	\N
91609	1	0	\N	\N
91610	1	0	\N	\N
91612	1	0	\N	\N
91613	1	0	\N	\N
91614	1	0	\N	\N
20043	1	0	\N	\N
20044	1	0	\N	\N
20045	1	0	\N	\N
20046	1	0	\N	\N
20048	2	0	\N	\N
20049	0	0	\N	\N
20050	1	2	2010-10-14 00:00:00	28966913
20009	1	0	\N	\N
20010	1	0	\N	\N
20011	1	0	\N	\N
20008	1	0	\N	\N
20013	2	0	\N	\N
20014	0	0	\N	\N
20015	1	0	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
92011	2	91910	23661	f
92024	2	91910	23636	t
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
92011	Pruebas	25.00	0	t	2010-03-10 00:00:00	0
92011	Montajes	34.00	1	t	2010-03-24 00:00:00	1
92011	Revisar Soldaduras	57.00	2	f	\N	2
92011	Checkear fugas	80.00	3	f	\N	3
92024	Pruebas	25.00	0	t	2010-03-17 00:00:00	0
92024	Montajes	34.00	1	f	\N	1
92024	Revisar Soldaduras	57.00	2	f	\N	2
92024	Checkear fugas	80.00	3	f	\N	3
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
20018	23946
20018	23945
20019	23947
20020	23948
20021	23949
20023	23950
20024	23951
20025	23952
20054	23962
20054	23961
20055	23963
20056	23964
20057	23965
20059	23966
20060	23967
20061	23968
40501	40400
40502	40401
59489	59388
19998	1920
19998	1919
19999	1921
20000	1922
20001	1923
20003	1924
20004	1925
20005	1926
91607	90883
91607	90884
91608	90885
91609	90886
91610	90887
91612	90888
91613	90889
91614	90890
20043	23953
20043	23954
20044	23955
20045	23956
20046	23957
20048	23958
20049	23959
20050	23960
20008	23937
20008	23938
20009	23939
20010	23940
20011	23941
20013	23942
20014	23943
20015	23944
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
20040	1	Fito recepcion de materiais	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20007	\N	3
20026	12	Bloque 2	\N	2010-08-11 00:00:00	2010-12-18 00:00:00	\N	20027	\N	2
20023	10	Teito de madeira de camarote A	\N	2010-08-11 00:00:00	2010-10-15 00:00:00	\N	20026	\N	0
20024	10	Cama e mesillas de camarote A	\N	2010-08-11 00:00:00	2010-09-01 00:00:00	\N	20026	\N	1
20025	10	Poñer escotillas camarote A	\N	2010-11-14 00:00:00	2010-12-18 00:00:00	\N	20026	\N	2
20018	10	Coordinacion	\N	2010-03-08 00:00:00	2010-05-11 00:00:00	\N	20027	\N	0
20022	12	Bloque 1	\N	2010-03-15 00:00:00	2010-08-11 00:00:00	\N	20027	\N	1
20019	10	Pintar camarotes A e B	\N	2010-03-15 00:00:00	2010-05-14 00:00:00	\N	20022	\N	0
20020	10	Pintar sá de máquinas	\N	2010-05-14 00:00:00	2010-07-07 00:00:00	\N	20022	\N	1
20021	10	Pintar cociñas de buque	\N	2010-07-07 00:00:00	2010-08-11 00:00:00	\N	20022	\N	2
20027	12	Pedido Grupo 3	\N	2010-03-08 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N
20042	1	Fito recepcion de materiais	\N	2010-11-14 00:00:00	2010-11-14 00:00:00	\N	20027	\N	3
20012	14	Bloque 1	\N	2010-03-08 00:00:00	2010-07-09 00:00:00	\N	20017	\N	1
40501	5	task1	\N	2010-03-17 13:27:39.957	2010-05-26 13:27:39.957	\N	40503	\N	0
40502	5	task2	\N	2010-05-26 13:27:39.957	2010-07-13 13:27:39.957	\N	40503	\N	1
20009	12	Pintar camarotes A e B	\N	2010-03-08 00:00:00	2010-05-08 00:00:00	\N	20012	\N	0
40503	7	Pedido valor ganado	\N	2010-03-17 13:27:39.957	2010-08-04 13:27:39.957	\N	\N	\N	\N
20010	12	Pintar sá de máquinas	\N	2010-05-08 00:00:00	2010-06-22 00:00:00	\N	20012	\N	1
20011	12	Pintar cociñas de buque	\N	2010-06-22 00:00:00	2010-07-09 00:00:00	\N	20012	\N	2
20008	12	Coordinacion	\N	2010-03-08 00:00:00	2010-04-10 00:00:00	\N	20017	\N	0
20016	14	Bloque 2	\N	2010-07-09 00:00:00	2011-02-10 21:12:00	\N	20017	\N	2
20001	15	Repasar soldadura ocos	\N	2010-05-25 00:00:00	2010-06-11 00:00:00	\N	20002	\N	2
20043	16	Coordinacion	\N	2010-03-08 00:00:00	2010-05-26 00:00:00	\N	20052	\N	0
20013	12	Aillar camarote A	\N	2010-07-09 00:00:00	2010-10-14 00:00:00	\N	20016	\N	0
20014	12	Aillar camarote B	\N	2010-07-09 00:00:00	2010-08-09 00:00:00	\N	20016	\N	1
20015	12	Aillar camarote C	\N	2010-12-08 21:12:00	2011-02-10 21:12:00	\N	20016	\N	2
20029	2	Fito recepcion de materiais	Un gran fito na historia de humanidade	2010-12-08 21:12:00	2010-12-08 21:12:00	\N	20017	\N	3
20053	10	Fito recepcion de materiais	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	20052	\N	3
20044	16	Soldar cuberta A	\N	2010-03-08 00:00:00	2010-05-22 00:00:00	\N	20047	\N	0
20045	16	Soldar cuberta B	\N	2010-05-22 00:00:00	2010-06-26 00:00:00	\N	20047	\N	1
19998	15	Coordinación	\N	2010-03-01 00:00:00	2010-04-30 00:00:00	\N	20007	\N	0
19999	15	Soldar unions do teito	\N	2010-03-08 00:00:00	2010-04-17 00:00:00	\N	20002	\N	0
20062	13	Bloque 2	\N	2010-07-16 00:00:00	2010-12-18 00:00:00	\N	20063	\N	2
20059	11	Aillar camarote A	\N	2010-07-16 00:00:00	2010-10-11 00:00:00	\N	20062	\N	0
20060	11	Aillar camarote B	\N	2010-07-16 00:00:00	2010-08-31 00:00:00	\N	20062	\N	1
20046	16	Soldar cuberta C	\N	2010-06-26 00:00:00	2010-07-22 00:00:00	\N	20047	\N	2
20058	13	Bloque 1	\N	2010-03-01 00:00:00	2010-07-16 00:00:00	\N	20063	\N	1
20055	11	Pintar camarotes A e B	\N	2010-03-01 00:00:00	2010-05-25 00:00:00	\N	20058	\N	0
20056	11	Pintar sá de máquinas	\N	2010-05-25 00:00:00	2010-06-29 00:00:00	\N	20058	\N	1
20057	11	Pintar cociñas de buque	\N	2010-06-29 00:00:00	2010-07-16 00:00:00	\N	20058	\N	2
20054	11	Coordinacion	\N	2010-03-01 00:00:00	2010-05-20 00:00:00	\N	20063	\N	0
20064	6	Fito recepcion de materias	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20063	\N	3
20063	13	Pedido Grupo 5	\N	2010-03-01 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N
20061	13	Aillar camarote C	\N	2010-10-15 00:00:00	2010-12-18 00:00:00	\N	20062	\N	2
59489	2	Aillar camarote C	\N	2010-10-15 00:00:00	2010-11-08 23:00:00	2010-12-18	59490	\N	0
59490	3	pedido sucontratado 1	\N	2010-10-15 00:00:00	2010-11-08 23:00:00	2010-12-18	\N	\N	\N
20003	15	Teito madeira camarote A	\N	2010-06-11 00:00:00	2010-09-18 00:00:00	\N	20006	\N	0
20004	15	Cama e mesilla camarote A	\N	2010-06-11 00:00:00	2010-07-01 00:00:00	\N	20006	\N	1
20005	15	Escotillas camarote	\N	2010-10-15 00:00:00	2010-12-24 00:00:00	\N	20006	\N	2
20000	15	Soldar unions do chan	\N	2010-04-17 00:00:00	2010-05-25 00:00:00	\N	20002	\N	1
20048	16	Teito de madeira camarote A	\N	2010-07-22 00:00:00	2010-10-13 00:00:00	\N	20051	\N	0
20049	16	Cama e mesilla camarote A	\N	2010-07-22 00:00:00	2010-08-30 00:00:00	\N	20051	\N	1
20050	17	Poñer escotillas camarote A	\N	2010-10-14 00:00:00	2010-12-17 00:00:00	\N	20051	\N	2
20002	11	Bloque 1	\N	2010-03-08 00:00:00	2010-06-11 00:00:00	\N	20007	\N	1
20006	11	Bloque 2	\N	2010-06-11 00:00:00	2010-12-24 00:00:00	\N	20007	\N	2
20007	11	Pedido grupo 1	\N	2010-03-01 22:40:25.505	2010-12-24 00:00:00	2011-02-01	\N	\N	\N
20017	14	Pedido Grupo 2	\N	2010-03-08 00:00:00	2011-02-10 21:12:00	2011-06-01	\N	\N	\N
20047	20	Bloque 1	\N	2010-03-08 00:00:00	2010-07-22 00:00:00	\N	20052	\N	1
20051	20	Bloque 2	\N	2010-07-22 00:00:00	2010-12-17 00:00:00	\N	20052	\N	2
20052	20	Pedido Grupo 4	\N	2010-03-08 00:00:00	2010-12-17 00:00:00	2011-06-01	\N	\N	\N
91616	1	Modelo Pedido Grupo 3	\N	2010-03-18 19:25:02.079	2010-05-01 14:25:02.079	2011-06-11	\N	\N	\N
91608	1	Pintar camarotes A e B	\N	2010-03-18 19:25:02.079	2010-05-01 14:25:02.079	\N	91611	\N	0
91609	1	Pintar sá de máquinas	\N	2010-03-18 19:25:02.079	2010-04-19 02:25:02.079	\N	91611	\N	1
91610	1	Pintar cociñas de buque	\N	2010-03-18 19:25:02.079	2010-04-12 20:25:02.079	\N	91611	\N	2
91612	1	Teito de madeira de camarote A	\N	2010-03-18 19:25:02.079	2010-04-25 08:25:02.079	\N	91615	\N	0
91613	1	Cama e mesillas de camarote A	\N	2010-03-18 19:25:02.079	2010-04-19 02:25:02.079	\N	91615	\N	1
91614	1	Poñer escotillas camarote A	\N	2010-03-18 19:25:02.079	2010-04-12 20:25:02.079	\N	91615	\N	2
91607	1	Coordinacion	\N	2010-03-18 19:25:02.079	2010-04-12 20:25:02.079	\N	91616	\N	0
91611	1	Bloque 1	\N	2010-03-18 19:25:02.079	2010-05-01 14:25:02.079	\N	91616	\N	1
91615	1	Bloque 2	\N	2010-03-18 19:25:02.079	2010-04-25 08:25:02.079	\N	91616	\N	2
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
20002
20006
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
40503
59490
91611
91615
91616
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
20058	3	23678
20062	3	23682
20063	3	23674
20054	5	23675
20055	5	23679
20056	5	23680
20057	5	23681
20059	5	23683
20060	5	23684
20061	5	23685
40503	3	40199
40501	5	40200
40502	5	40201
59490	2	59287
59489	3	59288
20047	5	23665
20002	2	1622
20051	5	23669
20052	5	23661
20006	2	1626
20007	2	1618
19998	3	1619
19999	3	1623
20000	3	1624
20001	3	1625
20003	3	1627
20004	3	1628
20005	3	1629
91607	1	91422
91608	1	91426
91609	1	91427
91610	1	91428
91611	1	91425
91612	1	91430
91613	1	91431
91614	1	91432
91615	1	91429
91616	1	91421
20043	9	23662
20044	9	23666
20045	9	23667
20046	9	23668
20048	9	23670
20049	9	23671
20050	9	23672
20012	3	23639
20016	3	23643
20017	3	23635
20008	5	23636
20009	5	23640
20010	5	23641
20011	5	23642
20013	5	23644
20014	5	23645
20015	5	23646
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
40097	1	Normal	nm	20.00	t
40098	2	Extra	ex	30.00	t
92314	1	Nocturnidad	545	18.00	t
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
910	ROLE_WS_WRITER
910	ROLE_WS_READER
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
46360	8	ce60abbd-39d0-4102-b101-764c002ef5c7	\N	46258	\N	\N
46361	1	9bafe120-4903-4de0-abb7-7b0abe66ee54	\N	46258	\N	\N
57570	2	ee55f194-8ff6-4084-b13d-925bc965e5b1	2010-03-17 00:00:00	57368	\N	\N
87971	1	6c80f5dc-cca5-46ad-8b6d-cb5856d144b0	\N	87769	1324	\N
103022	1	d7649f38-7218-4738-a660-51f2dfa4f0d6	\N	46258	\N	\N
103225	1	cff13b6f-e5a2-4a06-9aa5-bdb4b497b451	\N	46258	\N	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
57469	1	t	1	1112	1218	57368
87870	1	f	0	1112	1219	87769
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
46461	8	4c46827d-47c9-4d96-881e-a4c445262132	10	2010-03-16 00:00:00	\N	\N	46360	1320	40200	40097
46492	3	b1e9cce4-6d25-41b4-8bdb-7f542251dba6	10	2010-04-19 00:00:00	\N	\N	46360	1318	40200	40097
46469	6	49b04ab5-696c-4d8a-b972-d812a658311d	10	2010-04-17 00:00:00	\N	\N	46360	1314	40200	40097
46493	1	a8be80b1-b31d-4785-af5a-50c88b323ec5	10	2010-04-17 00:00:00	\N	\N	46361	1320	40201	40097
57671	2	d2efa962-10a1-43c8-b0dc-99d29516dcdb	8	2010-03-17 00:00:00	21540000	43140000	57570	19494	1627	40097
57672	2	c5745eeb-2368-48be-ad52-e89e5f1bd380	8	2010-03-17 00:00:00	64800000	72060000	57570	1326	23652	40098
88072	1	85ef82ab-f53f-486c-beb2-6351d306a750	8	2010-03-18 00:00:00	\N	\N	87971	1324	23644	40097
88073	1	49405868-4595-4750-a35a-1d050d08ae0a	7	2010-03-19 00:00:00	\N	\N	87971	1324	23667	40098
103123	1	4004f177-33cc-4fa1-bb4f-9f48baa2407a	10	2010-03-19 00:00:00	\N	\N	103022	2728	23652	40097
103329	1	0ab818a2-ff39-4279-ad04-b1f6c2afe503	10	2010-05-20 00:00:00	\N	\N	103225	1318	40200	40097
103330	1	d3c21a11-15f8-458e-b2c2-b525a88464c1	10	2010-05-23 00:00:00	\N	\N	103225	1318	40200	40098
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
46258	1	Tipo 1	tp1	f	f	f	0
57368	1	Parte Trabajo en Astillero	001	t	f	f	2
87769	1	tipo parte traballo ferrol	codigo 1	f	t	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1322	Alfonso 	Domínguez Baúl	55555555E
1318	Luis	Amado  Montes	33333333A
1326	Félix	González López	77777777G
19494	Laura	Menendez Gomez	89876562L
19496	Elias	Baeza Robles	11234567L
1328	Oscar	Iraola Sáez	88888888B
19498	Elena	Boluda Ferrer	99999999B
1324	Alicia	Muñoz Lages	66666666D
1330	Manuel	Rodríguez Fernández	99999999F
1332	Raquel	Tilve Moreno	12121212B
19500	Damian	Pintos Abogado	23232323B
1320	Raúl 	Cisneros Díaz	44444444H
2728	Javier	Perez Campos	32323232L
1314	Javier	Martinez Alvarez	11111111F
1316	María	Pérez Mariño	22222222D
\.


--
-- Data for Name: workreports_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreports_labels (work_report_id, label_id) FROM stdin;
57570	1218
\.


--
-- Data for Name: workreportslines_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreportslines_labels (work_report_line_id, label_id) FROM stdin;
88072	1219
88073	1219
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


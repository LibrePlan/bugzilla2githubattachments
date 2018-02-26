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
    generatecodeforunittypes boolean
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
    criterion_id bigint,
    parent bigint,
    isvalid boolean,
    valid boolean,
    order_element_template_id bigint
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
    workinghours integer NOT NULL,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint,
    resourcetype character varying(255),
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
    earlier_start_date_because_of_gantt timestamp without time zone
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
    workhours integer,
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
    base_calendar_id bigint,
    code character varying(255),
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
1951	3	t	808
1952	3	t	808
1953	3	t	808
1954	3	t	808
3356	4	t	808
3408	3	t	808
7511	27	t	809
117880	12	t	808
7512	27	t	809
5696	37	t	808
7513	27	f	809
7514	27	t	809
117881	12	t	808
7515	27	t	809
117895	5	t	811
105265	7	t	811
105266	7	t	811
105267	7	t	811
105268	7	f	811
86150	3	t	808
86151	3	f	809
105269	7	f	811
86152	3	t	809
117896	5	f	811
86254	3	t	809
86256	3	t	808
86255	3	f	809
86257	3	t	809
86259	3	f	809
86258	3	t	808
86260	3	t	809
86261	3	t	808
86262	3	f	809
86263	3	t	809
117882	12	t	808
117897	5	f	811
122247	3	f	809
122246	3	t	808
122248	3	t	809
122250	3	f	809
122249	3	t	808
122251	3	t	809
122252	3	t	809
122253	3	t	809
86264	3	t	809
86265	3	t	809
86266	3	t	809
86267	3	t	809
86268	3	t	809
86269	3	t	809
86270	3	t	809
86271	3	t	809
86272	3	t	808
86273	3	f	809
86274	3	t	809
86275	3	t	809
86276	3	f	809
86277	3	t	808
122254	3	t	808
86289	7	f	809
122255	3	f	809
122256	3	t	809
122257	3	t	809
122258	3	t	809
7516	27	t	809
5697	37	t	808
7517	27	f	809
8003	25	t	809
90804	9	t	808
8004	25	t	809
5701	36	t	808
8005	25	f	809
8006	25	t	809
8007	25	t	809
8008	25	t	809
8009	25	t	809
5705	35	t	808
8010	25	f	809
8011	25	t	809
8012	25	t	809
8013	25	f	809
5709	34	t	808
8014	25	t	809
5716	33	t	808
5673	5	f	812
5672	5	t	809
122259	3	t	809
122260	3	t	809
122261	3	t	809
122263	3	t	808
122264	3	t	809
122265	3	t	809
122266	3	t	809
122267	3	t	809
122268	3	t	809
122269	3	t	808
122270	3	f	809
122271	3	t	809
122272	3	t	809
122274	3	f	809
122273	3	t	808
5674	5	f	809
3370	8	t	808
5675	5	f	812
7509	27	t	809
7510	27	t	809
8015	25	f	809
9290	24	t	809
5717	33	t	808
9291	24	f	809
9292	24	t	809
9293	24	t	809
9294	24	t	809
6978	32	t	808
9295	24	f	809
122275	3	t	809
122276	3	t	809
9296	24	t	809
9297	24	t	809
9298	24	t	809
6979	32	t	808
57137	9	t	808
57139	9	t	809
57140	9	t	809
11042	23	t	809
11043	23	t	809
11044	23	t	809
11045	23	t	809
11046	23	t	809
105270	6	t	811
105271	6	f	811
85693	3	t	809
85695	3	f	809
85694	3	t	808
85696	3	t	809
85698	3	f	809
85697	3	t	808
85699	3	t	809
85700	3	t	809
11047	23	t	809
11048	23	t	809
122300	4	t	113322
122301	4	f	113322
117883	6	t	808
90805	8	t	808
90806	8	t	808
9299	24	t	809
86326	5	f	811
86327	5	t	811
86328	5	t	811
86329	5	f	811
122302	4	f	113322
9300	24	t	809
9301	24	t	809
9302	24	f	809
9303	24	t	809
9304	24	t	809
9305	24	t	809
9306	24	t	809
57124	9	t	809
57125	9	t	809
57126	9	t	809
57127	9	t	809
9307	24	t	809
9308	24	f	809
11027	23	t	809
11028	23	t	809
11029	23	f	809
11030	23	t	809
11031	23	t	809
11032	23	f	809
11033	23	t	809
11034	23	f	809
11035	23	t	809
11036	23	f	809
11037	23	t	809
11038	23	t	809
57128	9	f	809
57129	9	t	808
57130	9	t	809
57131	9	t	809
57132	9	t	809
11039	23	t	809
11040	23	t	809
11041	23	t	809
57133	9	f	809
57134	9	t	808
57135	9	t	809
57136	9	t	809
57138	9	f	809
117884	6	t	808
117885	6	t	808
86279	11	t	808
57392	9	t	809
90799	3	t	808
57393	9	t	809
57394	9	t	809
57395	9	t	809
57396	9	t	809
57397	9	t	809
57398	9	t	809
79996	15	f	810
79997	15	f	810
79998	15	f	810
57141	9	t	809
57142	9	t	809
57380	9	t	808
57379	9	f	809
57381	9	t	809
57382	9	t	809
57384	9	f	809
57383	9	t	808
57385	9	t	809
57387	9	t	808
57386	9	f	809
57388	9	t	809
57390	9	t	808
57389	9	f	809
57391	9	t	809
57399	9	t	809
57400	9	f	809
57401	9	t	808
57402	9	t	809
57403	9	f	809
57404	9	t	808
57405	9	f	809
80079	3	t	809
80080	3	t	809
80081	3	t	809
80082	3	t	809
80084	3	t	808
80083	3	f	809
80085	3	t	809
80086	3	t	809
80087	3	t	809
80089	3	t	808
80088	3	f	809
80090	3	t	809
80091	3	t	809
85648	3	f	809
80092	3	t	808
85649	3	t	809
85650	3	t	809
85651	3	t	809
85652	3	t	809
85654	3	t	808
85653	3	f	809
85655	3	t	809
85656	3	t	809
85658	3	t	808
85657	3	f	809
85659	3	t	809
85660	3	f	809
85661	3	t	808
85662	3	t	809
85663	3	f	809
85664	3	t	808
85665	3	t	809
85666	3	t	809
85667	3	t	809
85669	3	f	809
85668	3	t	808
85670	3	t	809
85671	3	t	809
85672	3	t	809
85673	3	t	809
85674	3	t	809
85675	3	t	809
85676	3	t	808
85677	3	f	809
85678	3	t	809
85679	3	t	809
85680	3	t	809
85681	3	t	809
85682	3	t	809
85683	3	f	809
85684	3	t	808
85685	3	t	809
85686	3	t	809
85688	3	f	809
85687	3	t	808
85689	3	t	809
85690	3	t	809
85692	3	f	809
85691	3	t	808
117886	6	t	808
57144	9	f	809
85701	3	t	809
85702	3	t	809
85703	3	t	809
85704	3	t	809
85705	3	t	809
85706	3	t	809
85707	3	t	809
85709	3	f	809
85708	3	t	808
85710	3	t	809
85711	3	t	809
85712	3	t	808
85713	3	f	809
86281	11	f	808
90800	2	t	808
107473	4	t	106858
107474	4	f	106858
107475	4	f	106858
105242	9	t	808
57143	9	t	808
57145	9	t	809
57146	9	t	809
57148	9	f	809
57147	9	t	808
57149	9	t	809
57150	9	t	808
57151	9	f	809
57152	9	t	809
57154	9	t	808
57153	9	f	809
57155	9	t	809
57156	9	t	809
57157	9	t	809
57159	9	t	808
57158	9	f	809
57160	9	t	809
57161	9	t	809
57162	9	t	809
57163	9	t	809
57164	9	t	809
57165	9	t	809
57368	9	f	809
57369	9	t	808
57370	9	t	809
57371	9	t	809
57372	9	t	809
57373	9	t	809
57374	9	t	809
57375	9	f	809
57376	9	t	808
57377	9	t	809
57378	9	t	809
122220	3	t	809
122221	3	t	809
122222	3	t	809
122223	3	t	809
122225	3	f	809
122224	3	t	808
122226	3	t	809
122227	3	t	809
122228	3	t	809
122229	3	f	809
122230	3	t	808
122231	3	t	809
122232	3	t	809
122233	3	f	809
122234	3	t	808
122235	3	t	809
122236	3	t	809
122237	3	t	809
122262	3	f	809
117887	4	t	809
6980	32	t	808
6993	31	t	808
6994	31	t	808
6995	31	t	808
6996	31	t	808
7518	27	t	809
117888	4	f	811
105243	9	t	808
117890	4	f	811
117889	4	f	809
117891	4	f	809
117892	4	f	811
86285	8	t	809
86286	8	f	809
86287	8	f	809
117894	4	f	811
117893	4	f	809
90802	5	t	808
122238	3	t	809
122239	3	f	809
122240	3	t	808
122241	3	t	809
122242	3	t	809
122244	3	t	808
122243	3	f	809
122245	3	t	809
86097	3	t	809
86098	3	t	809
86099	3	t	809
86100	3	t	809
86101	3	f	809
86102	3	t	808
86103	3	t	809
86104	3	t	809
86105	3	t	809
86107	3	t	808
86106	3	f	809
86108	3	t	809
86109	3	t	809
86110	3	f	809
86111	3	t	808
86112	3	t	809
86113	3	t	809
86114	3	t	809
86115	3	t	809
86117	3	t	808
86116	3	f	809
86118	3	t	809
86119	3	t	809
86121	3	t	808
86120	3	f	809
86122	3	t	809
86124	3	t	808
86123	3	f	809
86125	3	t	809
86127	3	t	808
86126	3	f	809
86128	3	t	809
86129	3	t	809
86130	3	t	809
86131	3	f	809
86132	3	t	808
86133	3	t	809
86134	3	t	809
86135	3	t	809
86136	3	t	809
86137	3	t	809
86138	3	t	809
86140	3	t	808
86139	3	f	809
86141	3	t	809
86142	3	t	809
86143	3	t	809
86144	3	t	809
86145	3	t	809
86146	3	t	808
86147	3	f	809
86148	3	t	809
86149	3	t	809
122277	3	t	808
122278	3	f	809
122279	3	t	809
122281	3	f	809
122280	3	t	808
122282	3	t	809
122283	3	t	808
122284	3	f	809
122285	3	t	809
122286	3	t	809
122287	3	t	809
122288	3	t	809
122289	3	t	809
122290	3	t	809
122291	3	t	809
122292	3	t	809
122293	3	t	809
122294	3	f	809
122295	3	t	808
122296	3	t	809
122297	3	t	809
122298	3	f	809
122299	3	t	808
135158	2	t	808
367338	11	t	808
367340	10	t	808
367341	9	t	808
367342	8	t	808
367339	11	t	808
140089	23	t	808
140090	23	t	808
140091	22	t	808
140092	19	t	808
140093	18	t	808
140094	17	t	808
140095	16	t	808
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
44704	1	809	44789	t	100.00
44705	1	809	44790	t	100.00
44706	1	809	44791	t	100.00
44707	1	809	44792	t	100.00
44708	1	809	44794	t	100.00
44709	1	809	44795	t	100.00
44710	1	809	44796	t	100.00
44711	1	809	44798	t	100.00
44712	1	809	44799	t	100.00
44713	1	809	44801	t	100.00
44714	1	809	44802	t	100.00
44715	1	809	44803	t	100.00
44716	1	809	44804	t	100.00
44717	1	809	44806	t	100.00
44718	1	809	44807	t	100.00
44719	1	809	44809	t	100.00
44720	1	809	44811	t	100.00
44721	1	809	44813	t	100.00
44722	1	809	44814	t	100.00
44723	1	809	44815	t	100.00
44724	1	809	44817	t	100.00
44725	1	809	44818	t	100.00
44726	1	809	44819	t	100.00
44727	1	809	44820	t	100.00
44728	1	809	44821	t	100.00
44729	1	809	44822	t	100.00
44730	1	809	44824	t	100.00
44731	1	809	44825	t	100.00
44732	1	809	44826	t	100.00
44733	1	809	44827	t	100.00
44734	1	809	44828	t	100.00
44735	1	809	44830	t	100.00
44736	1	809	44831	t	100.00
44737	1	809	44833	t	100.00
44738	1	809	44834	t	100.00
44739	1	809	44836	t	100.00
44740	1	809	44838	t	100.00
44741	1	809	44840	t	100.00
44742	1	809	44841	t	100.00
44844	1	809	44842	t	100.00
44845	1	809	44843	t	100.00
44846	1	809	44945	t	100.00
44847	1	809	44946	t	100.00
44848	1	809	44947	t	100.00
44849	1	809	44948	t	100.00
44850	1	809	44949	t	100.00
44851	1	809	44950	t	100.00
44852	1	809	44951	t	100.00
56555	1	809	56589	t	100.00
56556	1	809	56590	t	100.00
56557	1	809	56591	t	100.00
56558	1	809	56592	t	100.00
56559	1	809	56594	t	100.00
56661	1	809	56595	t	100.00
56662	1	809	56596	t	100.00
56663	1	809	56598	t	100.00
56664	1	809	56599	t	100.00
56665	1	809	56601	t	100.00
56666	1	809	56602	t	100.00
56667	1	809	56603	t	100.00
56668	1	809	56604	t	100.00
56669	1	809	56606	t	100.00
56670	1	809	56607	t	100.00
56671	1	809	56609	t	100.00
56672	1	809	56611	t	100.00
56673	1	809	56613	t	100.00
56674	1	809	56614	t	100.00
56675	1	809	56615	t	100.00
56676	1	809	56617	t	100.00
56677	1	809	56618	t	100.00
56678	1	809	56619	t	100.00
56679	1	809	56620	t	100.00
56680	1	809	56621	t	100.00
56681	1	809	56622	t	100.00
56682	1	809	56624	t	100.00
56683	1	809	56625	t	100.00
56684	1	809	56626	t	100.00
56685	1	809	56627	t	100.00
56686	1	809	56628	t	100.00
56687	1	809	56630	t	100.00
56688	1	809	56631	t	100.00
56689	1	809	56633	t	100.00
56690	1	809	56634	t	100.00
56691	1	809	56636	t	100.00
56692	1	809	56638	t	100.00
56693	1	809	56640	t	100.00
56694	1	809	56641	t	100.00
56695	1	809	56642	t	100.00
56696	1	809	56643	t	100.00
56697	1	809	56644	t	100.00
56698	1	809	56645	t	100.00
56699	1	809	56646	t	100.00
56700	1	809	56647	t	100.00
56701	1	809	56648	t	100.00
56702	1	809	56649	t	100.00
56703	1	809	56650	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
79927	15	2010-02-01	25.00	79996	\N
82458	9	2010-02-15	100.00	7511	\N
79930	15	2010-01-06	50.00	7511	\N
79931	15	2010-01-03	25.00	7511	\N
82459	9	2010-02-15	100.00	7512	\N
80495	14	2010-02-15	100.00	7514	\N
80496	14	2010-02-15	100.00	7515	\N
80497	14	2010-02-15	100.00	7516	\N
80498	14	2010-02-15	100.00	8003	\N
80499	14	2010-02-15	100.00	8004	\N
80500	14	2010-02-15	100.00	8006	\N
80501	14	2010-02-15	100.00	8007	\N
80502	14	2010-02-15	100.00	8008	\N
80503	14	2010-02-15	100.00	8009	\N
80504	14	2010-02-15	100.00	8011	\N
105453	7	2010-02-16	40.00	105265	2010-02-17 12:14:52.121
105454	7	2010-02-16	35.00	105266	2010-02-17 12:14:52.121
80505	14	2010-02-15	100.00	8012	\N
105455	7	2010-02-16	45.00	105267	2010-02-17 12:14:52.121
82478	5	2010-04-15	25.00	86326	\N
105456	7	2010-02-16	50.26	105270	\N
82461	8	2010-04-28	25.00	86285	\N
82479	5	2010-05-05	25.00	86327	\N
82463	7	2010-04-28	25.00	86289	\N
80596	13	2010-02-15	100.00	8014	\N
80597	13	2010-02-15	100.00	9290	\N
80598	13	2010-02-15	100.00	9292	\N
80599	13	2010-02-15	100.00	9293	\N
80600	13	2010-02-15	100.00	9294	\N
82020	12	2010-02-15	100.00	9296	\N
107575	2	2010-02-17	25.00	107473	\N
107576	2	2010-02-09	10.00	107473	\N
82021	12	2010-02-15	100.00	9297	\N
82022	12	2010-02-15	100.00	9298	\N
82023	12	2010-02-15	100.00	9299	\N
82024	12	2010-02-15	100.00	9300	\N
5765	5	2010-02-09	40.00	5672	\N
5766	5	2010-02-08	20.00	5672	\N
79924	15	2009-12-16	100.00	7509	\N
79925	15	2009-12-08	25.00	7509	\N
79928	15	2010-02-01	100.00	7510	\N
79929	15	2009-12-15	50.00	7510	\N
79926	15	2010-02-16	50.00	79996	\N
82025	12	2010-02-15	100.00	9301	\N
82026	12	2010-02-15	100.00	9303	\N
82027	12	2010-02-15	100.00	9304	\N
82028	12	2010-02-15	100.00	9305	\N
82029	12	2010-02-15	100.00	9306	\N
82030	12	2010-02-15	100.00	9307	\N
82031	12	2010-02-15	100.00	11027	\N
82032	12	2010-02-15	100.00	11028	\N
82033	12	2010-02-15	100.00	11030	\N
82034	12	2010-02-15	100.00	11031	\N
82035	12	2010-02-15	100.00	11033	\N
82036	12	2010-02-15	100.00	11035	\N
82037	12	2010-02-15	100.00	11037	\N
82430	11	2010-02-15	100.00	11038	\N
82431	11	2010-02-15	100.00	11039	\N
82432	11	2010-02-15	100.00	11040	\N
82433	11	2010-02-15	100.00	11041	\N
82434	11	2010-02-15	100.00	11042	\N
82435	11	2010-02-15	100.00	11043	\N
82436	11	2010-02-15	100.00	11044	\N
82437	11	2010-02-15	100.00	11045	\N
82438	11	2010-02-15	100.00	11047	\N
82439	11	2010-02-15	100.00	11048	\N
116054	3	2010-02-17	50.00	105265	2010-02-17 12:14:52.121
116055	3	2010-02-17	70.00	105267	2010-02-17 12:14:52.121
121604	3	2010-02-17	31.00	117887	\N
121605	4	2010-02-17	25.00	117888	2010-02-17 18:17:10.314
121606	5	2010-02-17	25.00	117895	\N
121609	2	2010-02-25	45.00	122300	\N
121610	2	2010-02-23	30.00	122300	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
808	4	children	100.0000	f	0.0100	t	t	\N
809	3	percentage	100.0000	f	0.0100	t	t	\N
810	2	units	2147483647.0000	f	1.0000	t	f	\N
811	1	subcontractor	100.0000	f	0.0100	t	t	\N
812	1	Toneladas	10000.0000	t	1.0000	t	f	\N
813	1	Porcentaxe (pactado)	100.0000	t	1.0000	t	f	\N
814	1	Importe	1000000.0000	t	1.0000	t	f	\N
815	1	Importe (pactado)	1000000.0000	t	1.0000	t	f	\N
106858	1	QF: Formulario de calidade para tarefas de tipo A	100.0000	f	0.0100	t	t	t
113322	1	QF: Formulario de calidade para tarefas de tipo C	100.0000	f	0.0100	t	t	t
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
2527	113
2527	115
3063	112
3064	113
3066	119
3069	113
3070	119
58383	115
58383	113
58384	115
58384	113
58450	115
58450	113
58451	115
58451	113
58452	115
58452	113
58453	115
58453	113
58454	115
58454	113
58455	115
58455	113
58456	115
58456	113
58457	115
58457	111
58458	115
58458	112
58459	115
58459	113
58460	115
58460	113
58461	115
58461	113
58468	115
58468	113
58469	115
58469	113
58470	115
58470	113
58472	115
58472	113
60703	115
60703	113
60704	115
60704	113
60705	115
60705	113
60706	115
60706	113
60751	115
60751	113
60752	115
60752	113
60753	115
60753	113
60754	115
60754	113
60755	115
60755	113
60756	115
60756	113
60757	115
60757	113
60758	115
60758	113
60790	115
60790	113
60791	115
60791	113
60792	115
60792	113
60795	115
60795	113
68413	111
68413	115
68414	113
68414	115
68415	113
68415	115
68416	113
68416	115
68417	113
68417	115
68418	113
68418	115
68419	113
68419	115
68420	113
68420	115
68421	113
68421	115
68422	113
68422	115
68423	113
68423	115
97566	113
97566	115
97567	113
97567	115
97578	99889
97579	99889
97580	99889
97581	99889
118483	113120
118484	113120
118485	113120
118486	113120
135746	134431
136056	134431
136057	134431
136058	134431
136062	134431
148707	115
148707	113
148708	115
148708	113
148709	115
148709	113
148710	115
148710	113
148711	115
148711	113
148712	115
148712	113
148713	115
148713	113
148714	115
148714	113
148716	115
148716	113
178234	115
178234	113
178235	115
178235	113
178236	115
178236	113
178237	115
178237	113
178238	115
178238	113
178239	115
178239	113
178240	115
178240	113
178241	115
178241	113
178242	115
178242	113
178243	115
178243	113
178244	115
178244	113
178245	115
178245	113
178246	115
178246	113
178247	115
178247	113
178248	115
178248	113
183845	115
183845	113
183846	115
183846	113
183847	115
183847	113
183848	115
183848	113
183849	115
183849	113
183850	115
183850	113
200642	115
200642	113
200643	115
200643	113
200644	115
200644	113
200645	115
200645	113
200646	115
200646	113
200647	115
200647	113
200648	115
200648	113
200649	115
200649	113
200650	115
200650	113
200651	115
200651	113
200655	115
200655	113
200656	115
200656	113
200665	115
200665	113
368963	112
370775	367743
370776	367743
370777	367743
370778	367743
370802	367743
370816	367743
370819	367744
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
88072	4
106153	4
112717	3
112721	4
112719	11
112723	8
112725	5
120797	5
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name, code) FROM stdin;
304	1	\N	304
303	3	España	303
306	1	Galicia	306
309	2	Calendario máquinas Pontevedra	309
308	3	Calendarios máquinas	308
116960	11	\N	116960
116959	10	\N	116959
319	3	\N	319
320	2	\N	320
134634	3	\N	134634
134635	3	\N	134635
134633	3	\N	134633
313	3	\N	313
310	3	\N	310
314	2	\N	314
321	4	\N	321
91001	4	\N	91001
315	5	\N	315
91002	39	\N	91002
91003	39	\N	91003
116958	1	Narón	116958
318	3	\N	318
139582	2	\N	840e21e9-6208-4113-b117-898737b10b79
139584	1	\N	c83ba408-d8d0-40a3-8692-1887bebab911
139583	4	\N	79fca9a9-2d4c-4397-bedc-55d8948535a5
311	8	\N	311
316	3	\N	316
312	6	\N	312
317	4	\N	317
139585	1	\N	9baff9e7-3620-4ab1-91fb-6d355b89ec65
307	4	Pontevedra	307
367943	1	\N	17de50c2-5602-4e10-966d-9ce426c427e3
367944	2	\N	063c90d3-eb3c-45d2-9db3-a0deb134b3ac
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-02-03	\N	304	0
1322	3	2010-02-03	\N	318	0
1323	3	2010-02-03	\N	319	0
1324	2	2010-02-03	\N	320	0
117364	11	2010-02-17	2010-04-01	116960	0
117362	10	2010-02-17	2010-12-31	116959	0
117363	9	2011-01-27	\N	116959	1
1317	3	2009-02-03	\N	313	0
1314	3	2009-02-03	\N	310	0
1318	2	2009-02-03	\N	314	0
1325	4	2010-02-03	2010-03-31	321	0
91203	4	2009-12-01	2010-01-10	91001	0
1319	5	2009-02-03	\N	315	0
134836	3	2010-03-25	\N	134634	0
134837	3	2010-02-25	2010-04-21	134635	0
134835	3	2010-02-25	\N	134633	0
91204	39	2010-01-01	\N	91002	0
91205	39	2010-02-16	\N	91003	0
139784	2	2010-04-08	\N	139582	0
139786	1	2010-04-08	\N	139584	0
139785	4	2010-04-08	\N	139583	0
1315	8	2009-02-03	\N	311	0
1320	3	2009-02-03	\N	316	0
1316	6	2009-02-01	2010-12-31	312	0
2828	3	2011-01-01	\N	312	1
1321	4	2009-02-03	\N	317	0
139787	1	2010-04-08	\N	139585	0
368145	1	2010-04-21	\N	367943	0
368146	2	2010-04-21	\N	367944	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar, code) FROM stdin;
139685	1	307	\N	139584	0	ab1bcdd9-b752-47e4-918d-aa61bbc852d3
139684	4	307	\N	139583	0	278628f5-de06-4473-b579-850bea14948a
412	8	307	\N	311	0	412
417	3	307	\N	316	0	417
413	6	307	\N	312	0	413
418	4	307	\N	317	0	418
139686	1	307	\N	139585	0	ec460ab4-c448-4bc1-aadb-48273580272b
408	4	306	2010-06-01	307	0	408
139687	1	306	\N	307	1	1d7c4751-1d3c-47e9-a2cb-1db0d3af667e
368044	1	307	\N	367943	0	a0e78516-4049-4b2b-9ae1-38931b3c916e
368045	2	307	\N	367944	0	4d316d82-5054-4298-9032-1393ad9437e9
419	3	307	\N	318	0	419
405	1	303	\N	304	0	405
404	3	\N	\N	303	0	404
407	1	303	\N	306	0	407
414	3	307	\N	313	0	414
411	3	307	\N	310	0	411
415	2	307	\N	314	0	415
410	2	308	\N	309	0	410
409	3	\N	\N	308	0	409
422	4	307	\N	321	0	422
91102	4	307	\N	91001	0	91102
416	5	307	\N	315	0	416
420	3	307	\N	319	0	420
421	2	309	\N	320	0	421
117163	11	116958	\N	116960	0	117163
117161	10	116958	2010-02-18	116959	0	117161
117162	9	116958	\N	116959	1	117162
134735	3	307	\N	134634	0	134735
134736	3	307	\N	134635	0	134736
134734	3	307	\N	134633	0	134734
91103	39	307	\N	91002	0	91103
91104	39	307	\N	91003	0	91104
117160	1	306	\N	116958	0	117160
139683	2	307	\N	139582	0	447ef952-65d5-4da0-8242-f09c41081caa
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id, code) FROM stdin;
1524	4	2010-02-17	0	711	307	1524
1518	2	2010-12-06	0	711	303	1518
1515	2	2010-04-02	0	707	303	1515
1517	2	2010-12-08	0	711	303	1517
1516	2	2010-11-01	0	707	303	1516
1520	1	2010-10-12	0	711	303	1520
1521	1	2010-03-19	0	711	306	1521
1522	1	2010-04-01	0	711	306	1522
1523	1	2010-05-17	0	711	306	1523
1525	1	2010-03-19	0	711	309	1525
1526	1	2010-04-01	0	711	309	1526
1527	1	2010-10-12	0	711	308	1527
1528	1	2010-12-08	0	711	308	1528
1529	1	2010-11-01	0	711	308	1529
1530	1	2010-12-06	0	711	308	1530
117059	1	2010-02-18	0	711	116958	117059
138168	1	2010-05-15	0	707	134633	138168
138169	1	2010-05-22	0	707	134633	138169
138170	1	2010-05-21	0	707	134633	138170
138171	1	2010-05-12	0	707	134633	138171
138172	1	2010-05-16	0	707	134633	138172
138173	1	2010-05-25	0	707	134633	138173
138174	1	2010-05-19	0	707	134633	138174
138175	1	2010-05-14	0	707	134633	138175
138176	1	2010-05-24	0	707	134633	138176
138177	1	2010-05-17	0	707	134633	138177
138178	1	2010-05-18	0	707	134633	138178
138179	1	2010-05-11	0	707	134633	138179
138180	1	2010-05-23	0	707	134633	138180
138181	1	2010-05-20	0	707	134633	138181
138182	1	2010-05-13	0	707	134633	138182
117073	9	2010-05-20	0	707	116959	117073
117060	9	2010-05-05	0	707	116959	117060
117066	9	2010-05-13	0	707	116959	117066
117077	9	2010-05-08	0	707	116959	117077
117062	9	2010-05-15	0	707	116959	117062
117076	9	2010-05-07	0	707	116959	117076
117068	9	2010-05-03	0	707	116959	117068
117064	9	2010-05-16	0	707	116959	117064
117075	9	2010-05-09	0	707	116959	117075
117074	9	2010-05-17	0	707	116959	117074
117072	9	2010-05-10	0	707	116959	117072
117070	9	2010-05-11	0	707	116959	117070
117063	9	2010-05-14	0	707	116959	117063
117067	9	2010-05-04	0	707	116959	117067
117065	9	2010-05-12	0	707	116959	117065
117069	9	2010-05-06	0	707	116959	117069
117061	9	2010-05-19	0	707	116959	117061
117071	9	2010-05-18	0	707	116959	117071
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable, code) FROM stdin;
707	6	HOLIDAY	red	t	\N
708	5	SICK_LEAVE	red	t	\N
709	4	LEAVE	red	t	\N
710	3	STRIKE	red	t	\N
711	2	BANK_HOLIDAY	red	t	\N
712	1	WORKABLE_BANK_HOLIDAY	orange	f	\N
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes) FROM stdin;
505	4	307	B15804842	t	t	t	t	t	t	t
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled, code) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
367742	1	5d6ef614-c5f9-4264-8ac1-09d745e6ec5b	Teleco	t	119275520	\N
367741	2	b3332414-1e89-48c9-ace8-e03df09764eb	Informático	t	119275520	\N
114	1	e23dd050-88db-4aee-b8fc-ab96dffc1d4e	Oficial 1º	t	2	\N
115	1	0f7bb678-aac9-4c9d-a070-00bf09fcecbb	Enxeñeiro en Informática	t	2	\N
116	1	f0845269-cd3e-475a-bf18-b978ee18aaff	Peon	t	2	\N
117	1	e40bcee0-dde5-4707-bd91-a7dd69b8b081	pulidora	t	7	\N
118	1	abf6d5e3-5caa-4467-a696-cf35abd3bced	torno	t	7	\N
367743	1	23ddf241-0d4c-4066-96fe-97ddbd2b3d67	Analista/Desarrollador	t	119275521	\N
367744	1	79b5f04e-93de-4e54-8af8-9b55a9151b68	Coordinador	t	119275521	\N
101	14	aeca847a-2b3c-4f07-bd5f-a97e9e210cab	medicalLeave	t	1	\N
102	13	63baaa7b-6637-4213-9606-f33223cd9eb0	paternityLeave	t	1	\N
103	4	944b1694-3e09-4160-901b-878014d5ca5c	hiredResourceWorkingRelationship	t	5	\N
104	3	433ba70e-abd0-4459-b9d0-5307ce884de9	firedResourceWorkingRelationship	t	5	\N
109	2	1b2ceacb-180a-4a3e-b502-e92c35925b0c	Pontevedra	t	6	106
108	2	383e38ab-def8-42f3-9585-ee2bd2956a56	Ferrol	t	6	106
110	2	3380514c-2795-46f9-b15d-7af052233a3b	Andalucía	t	6	105
107	2	0a8253f2-2880-49d9-8279-4afdcdc4b2b6	Vigo	t	6	106
106	2	061cb37e-b556-45c4-a31e-f573d1f996b5	Galicia	t	6	105
105	2	fe05c700-ff55-4182-becf-d7e2d9543cf9	España	t	6	\N
99889	4	fe959fdd-19de-4f86-b0ae-bf0afbaa9bb3	Pintor	t	4	\N
119	6	a24075ab-4d02-4c46-adde-a6cb0bd86b29	Soldador	t	4	\N
44137	5	3f1a6ca8-20ab-4a4a-b9e2-6120e18ba90d	Consultor	t	4	\N
113120	3	09d898ce-eb75-4b91-9b54-f657f9be104f	Calderero	t	4	\N
134431	1	756007bd-121f-402d-9917-ec7458df18a0	Andamiero	t	4	\N
111	7	d1f49e2c-237e-4b1e-8ad0-c0e0f9d825e0	Coordinador	t	4	\N
112	7	a3d2fdde-053c-4805-b89c-0686e06b80f0	Analista	t	4	\N
113	7	a7725710-9bb4-4896-a0c4-0b06375b626f	Desarrollador	t	4	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid, valid, order_element_template_id) FROM stdin;
145875	DIRECT	15	\N	140005	113	\N	\N	\N	\N
2395	DIRECT	2	\N	1870	113	\N	\N	\N	\N
2396	DIRECT	2	\N	1870	115	\N	\N	\N	\N
2397	INDIRECT	2	2139	\N	115	2396	t	\N	\N
2398	INDIRECT	2	2139	\N	113	2395	t	\N	\N
2399	DIRECT	2	\N	1871	115	\N	\N	\N	\N
2400	DIRECT	2	\N	1871	113	\N	\N	\N	\N
2401	INDIRECT	2	2140	\N	113	2400	t	\N	\N
2402	INDIRECT	2	2140	\N	115	2399	t	\N	\N
4796	DIRECT	3	4866	\N	119	\N	\N	\N	\N
4795	DIRECT	3	4865	\N	113	\N	\N	\N	\N
4797	DIRECT	3	\N	4714	117	\N	\N	\N	\N
145980	DIRECT	15	\N	140033	115	\N	\N	\N	\N
4799	DIRECT	3	4869	\N	118	\N	\N	\N	\N
4798	DIRECT	3	4868	\N	119	\N	\N	\N	\N
4954	INDIRECT	2	4867	\N	117	4797	\N	t	\N
44078	DIRECT	20	\N	7081	113	\N	\N	\N	\N
44081	INDIRECT	20	\N	7082	113	44078	\N	t	\N
44080	INDIRECT	20	\N	7082	115	44079	\N	t	\N
44083	INDIRECT	20	6953	\N	115	44079	\N	t	\N
44082	INDIRECT	20	6953	\N	113	44078	\N	t	\N
44085	DIRECT	20	\N	7115	115	\N	\N	\N	\N
44084	DIRECT	20	\N	7115	113	\N	\N	\N	\N
44086	INDIRECT	20	\N	7116	115	44085	\N	t	\N
44087	INDIRECT	20	\N	7116	113	44084	\N	t	\N
44089	INDIRECT	20	7185	\N	115	44085	\N	t	\N
44088	INDIRECT	20	7185	\N	113	44084	\N	t	\N
44091	INDIRECT	20	\N	7117	115	44085	\N	t	\N
4320	DIRECT	6	\N	3698	112	\N	\N	\N	\N
4321	INDIRECT	6	3761	\N	112	4320	t	\N	\N
4322	DIRECT	6	\N	3699	113	\N	\N	\N	\N
4323	INDIRECT	6	3762	\N	113	4322	t	\N	\N
4324	DIRECT	6	\N	3700	119	\N	\N	\N	\N
4325	INDIRECT	6	3763	\N	119	4324	t	\N	\N
39068	DIRECT	22	\N	6300	115	\N	\N	\N	\N
44065	INDIRECT	20	\N	7076	113	44063	\N	t	\N
44067	INDIRECT	20	6949	\N	113	44063	\N	t	\N
44066	INDIRECT	20	6949	\N	115	44062	\N	t	\N
44068	INDIRECT	20	\N	7077	115	44062	\N	t	\N
44069	INDIRECT	20	\N	7077	113	44063	\N	f	\N
44070	INDIRECT	20	6950	\N	115	44062	\N	t	\N
44071	INDIRECT	20	6950	\N	113	44063	\N	f	\N
44072	DIRECT	20	\N	7078	115	\N	\N	\N	\N
44073	DIRECT	20	\N	7078	113	\N	\N	\N	\N
44074	INDIRECT	20	\N	7079	115	44072	\N	t	\N
44075	INDIRECT	20	\N	7079	113	44073	\N	t	\N
44076	INDIRECT	20	6951	\N	115	44072	\N	t	\N
44077	INDIRECT	20	6951	\N	113	44073	\N	t	\N
44079	DIRECT	20	\N	7081	115	\N	\N	\N	\N
146022	DIRECT	15	\N	140044	113	\N	\N	\N	\N
39069	DIRECT	22	\N	6300	113	\N	\N	\N	\N
39070	INDIRECT	22	\N	6301	113	39069	\N	t	\N
39071	INDIRECT	22	\N	6301	115	39068	\N	t	\N
39072	INDIRECT	22	6583	\N	115	39068	\N	t	\N
39073	INDIRECT	22	6583	\N	113	39069	\N	t	\N
146055	INDIRECT	15	140449	\N	113	146047	\N	t	\N
146058	INDIRECT	15	\N	140054	113	146047	\N	t	\N
146057	INDIRECT	15	\N	140054	115	146048	\N	t	\N
146060	INDIRECT	15	140450	\N	115	146048	\N	t	\N
146059	INDIRECT	15	140450	\N	113	146047	\N	t	\N
146062	INDIRECT	15	\N	140055	115	146048	\N	t	\N
39074	INDIRECT	22	\N	6302	115	39068	\N	t	\N
39075	INDIRECT	22	\N	6302	113	39069	\N	t	\N
39077	INDIRECT	22	6584	\N	115	39068	\N	t	\N
39076	INDIRECT	22	6584	\N	113	39069	\N	t	\N
39078	INDIRECT	22	\N	6303	113	39069	\N	t	\N
39079	INDIRECT	22	\N	6303	115	39068	\N	t	\N
39080	INDIRECT	22	6585	\N	115	39068	\N	t	\N
39081	INDIRECT	22	6585	\N	113	39069	\N	t	\N
39086	DIRECT	22	\N	6305	113	\N	\N	\N	\N
40933	INDIRECT	21	\N	6817	113	40923	\N	t	\N
40932	INDIRECT	21	\N	6817	115	40922	\N	t	\N
40934	INDIRECT	21	6908	\N	115	40922	\N	t	\N
40935	INDIRECT	21	6908	\N	113	40923	\N	t	\N
40936	DIRECT	21	\N	6818	115	\N	\N	\N	\N
40937	DIRECT	21	\N	6818	113	\N	\N	\N	\N
40939	INDIRECT	21	\N	6819	113	40937	\N	t	\N
40938	INDIRECT	21	\N	6819	115	40936	\N	t	\N
40941	INDIRECT	21	6909	\N	115	40936	\N	t	\N
40940	INDIRECT	21	6909	\N	113	40937	\N	t	\N
40943	INDIRECT	21	\N	6820	115	40936	\N	t	\N
40942	INDIRECT	21	\N	6820	113	40937	\N	t	\N
40945	INDIRECT	21	6910	\N	115	40936	\N	t	\N
146061	INDIRECT	15	\N	140055	113	146047	\N	t	\N
146064	INDIRECT	15	140451	\N	113	146047	\N	t	\N
146063	INDIRECT	15	140451	\N	115	146048	\N	t	\N
44090	INDIRECT	20	\N	7117	113	44084	\N	t	\N
44093	INDIRECT	20	7186	\N	115	44085	\N	t	\N
44092	INDIRECT	20	7186	\N	113	44084	\N	t	\N
44094	INDIRECT	20	\N	7084	115	44085	\N	t	\N
44095	INDIRECT	20	\N	7084	113	44084	\N	t	\N
44097	INDIRECT	20	6955	\N	115	44085	\N	t	\N
44096	INDIRECT	20	6955	\N	113	44084	\N	t	\N
44118	INDIRECT	20	\N	7122	113	44084	\N	t	\N
44119	INDIRECT	20	\N	7122	115	44085	\N	t	\N
44120	INDIRECT	20	7191	\N	115	44085	\N	t	\N
44121	INDIRECT	20	7191	\N	113	44084	\N	t	\N
44122	DIRECT	20	\N	7123	111	\N	\N	\N	\N
44124	INDIRECT	20	7192	\N	115	44123	\N	t	\N
146065	INDIRECT	15	\N	140056	113	146047	\N	t	\N
146066	INDIRECT	15	\N	140056	115	146048	\N	t	\N
44309	DIRECT	19	\N	6826	112	\N	\N	\N	\N
44310	INDIRECT	19	6915	\N	112	44309	\N	t	\N
40974	INDIRECT	21	6917	\N	115	40963	\N	t	\N
44311	DIRECT	19	\N	6829	44137	\N	\N	\N	\N
40976	INDIRECT	21	\N	6829	115	40963	\N	t	\N
40977	INDIRECT	21	\N	6829	113	40962	\N	f	\N
44312	INDIRECT	19	6918	\N	44137	44311	\N	t	\N
40979	INDIRECT	21	6918	\N	113	40962	\N	f	\N
40978	INDIRECT	21	6918	\N	115	40963	\N	t	\N
40981	INDIRECT	21	\N	6830	113	40962	\N	f	\N
40980	INDIRECT	21	\N	6830	115	40963	\N	t	\N
44313	DIRECT	19	\N	6830	44137	\N	\N	\N	\N
40982	INDIRECT	21	6919	\N	115	40963	\N	t	\N
44314	INDIRECT	19	6919	\N	44137	44313	\N	t	\N
40983	INDIRECT	21	6919	\N	113	40962	\N	f	\N
44125	INDIRECT	20	7192	\N	111	44122	\N	t	\N
44127	DIRECT	20	\N	7124	113	\N	\N	\N	\N
44126	DIRECT	20	\N	7124	115	\N	\N	\N	\N
44129	INDIRECT	20	7193	\N	115	44126	\N	t	\N
44128	INDIRECT	20	7193	\N	113	44127	\N	t	\N
97284	DIRECT	3	\N	90605	113	\N	\N	\N	\N
97283	DIRECT	3	\N	90605	115	\N	\N	\N	\N
97286	INDIRECT	3	90702	\N	115	97283	\N	t	\N
97285	INDIRECT	3	90702	\N	113	97284	\N	t	\N
97287	DIRECT	3	\N	90606	113	\N	\N	\N	\N
97288	DIRECT	3	\N	90606	115	\N	\N	\N	\N
97290	INDIRECT	3	90703	\N	115	97288	\N	t	\N
97289	INDIRECT	3	90703	\N	113	97287	\N	t	\N
39093	INDIRECT	22	\N	6307	115	39087	\N	t	\N
39092	INDIRECT	22	\N	6307	113	39086	\N	t	\N
39095	INDIRECT	22	6588	\N	115	39087	\N	t	\N
39094	INDIRECT	22	6588	\N	113	39086	\N	t	\N
39096	INDIRECT	22	\N	6320	113	39086	\N	t	\N
39097	INDIRECT	22	\N	6320	115	39087	\N	t	\N
39099	INDIRECT	22	6598	\N	113	39086	\N	t	\N
39098	INDIRECT	22	6598	\N	115	39087	\N	t	\N
39100	DIRECT	22	\N	6321	115	\N	\N	\N	\N
39101	DIRECT	22	\N	6321	113	\N	\N	\N	\N
39103	INDIRECT	22	\N	6322	115	39100	\N	t	\N
39102	INDIRECT	22	\N	6322	113	39101	\N	t	\N
39104	INDIRECT	22	6599	\N	115	39100	\N	t	\N
39105	INDIRECT	22	6599	\N	113	39101	\N	t	\N
39106	INDIRECT	22	\N	6323	113	39101	\N	t	\N
39107	INDIRECT	22	\N	6323	115	39100	\N	t	\N
39109	INDIRECT	22	6600	\N	113	39101	\N	t	\N
39108	INDIRECT	22	6600	\N	115	39100	\N	t	\N
39110	DIRECT	22	\N	6339	115	\N	\N	\N	\N
39111	DIRECT	22	\N	6339	113	\N	\N	\N	\N
39113	INDIRECT	22	\N	6340	113	39111	\N	t	\N
39112	INDIRECT	22	\N	6340	115	39110	\N	t	\N
39114	INDIRECT	22	6613	\N	115	39110	\N	t	\N
39115	INDIRECT	22	6613	\N	113	39111	\N	t	\N
97335	DIRECT	7	\N	90610	99889	\N	\N	\N	\N
97336	INDIRECT	7	90704	\N	99889	97335	\N	t	\N
97337	DIRECT	7	\N	90611	99889	\N	\N	\N	\N
97338	INDIRECT	7	90705	\N	99889	97337	\N	t	\N
97339	DIRECT	7	\N	90613	99889	\N	\N	\N	\N
97340	INDIRECT	7	90706	\N	99889	97339	\N	t	\N
97341	DIRECT	7	\N	90614	99889	\N	\N	\N	\N
97342	INDIRECT	7	90707	\N	99889	97341	\N	t	\N
39082	INDIRECT	22	\N	6304	113	39069	\N	t	\N
39083	INDIRECT	22	\N	6304	115	39068	\N	t	\N
39084	INDIRECT	22	6586	\N	113	39069	\N	t	\N
39085	INDIRECT	22	6586	\N	115	39068	\N	t	\N
146002	INDIRECT	15	\N	140039	113	145979	\N	t	\N
146001	INDIRECT	15	\N	140039	115	145980	\N	t	\N
146004	INDIRECT	15	140437	\N	115	145980	\N	t	\N
146003	INDIRECT	15	140437	\N	113	145979	\N	t	\N
146005	INDIRECT	15	\N	140040	113	145979	\N	t	\N
146006	INDIRECT	15	\N	140040	115	145980	\N	t	\N
146008	INDIRECT	15	140438	\N	115	145980	\N	t	\N
146007	INDIRECT	15	140438	\N	113	145979	\N	t	\N
146009	INDIRECT	15	\N	140041	115	145980	\N	t	\N
146010	INDIRECT	15	\N	140041	113	145979	\N	t	\N
39087	DIRECT	22	\N	6305	115	\N	\N	\N	\N
39088	INDIRECT	22	\N	6306	113	39086	\N	t	\N
39089	INDIRECT	22	\N	6306	115	39087	\N	t	\N
39091	INDIRECT	22	6587	\N	115	39087	\N	t	\N
39090	INDIRECT	22	6587	\N	113	39086	\N	t	\N
39116	INDIRECT	22	\N	6341	113	39111	\N	t	\N
39117	INDIRECT	22	\N	6341	115	39110	\N	t	\N
39119	INDIRECT	22	6614	\N	115	39110	\N	t	\N
146011	INDIRECT	15	140439	\N	113	145979	\N	t	\N
146012	INDIRECT	15	140439	\N	115	145980	\N	t	\N
146013	INDIRECT	15	\N	140042	115	145980	\N	t	\N
146014	INDIRECT	15	\N	140042	113	145979	\N	t	\N
146016	INDIRECT	15	140440	\N	113	145979	\N	t	\N
146015	INDIRECT	15	140440	\N	115	145980	\N	t	\N
146018	INDIRECT	15	\N	140043	115	145980	\N	t	\N
146017	INDIRECT	15	\N	140043	113	145979	\N	t	\N
146020	INDIRECT	15	140441	\N	113	145979	\N	t	\N
146040	INDIRECT	15	\N	140049	115	146021	\N	t	\N
146042	INDIRECT	15	140446	\N	115	146021	\N	t	\N
146041	INDIRECT	15	140446	\N	113	146022	\N	t	\N
146044	INDIRECT	15	\N	140050	113	146022	\N	t	\N
146043	INDIRECT	15	\N	140050	115	146021	\N	t	\N
146045	INDIRECT	15	140447	\N	115	146021	\N	t	\N
146046	INDIRECT	15	140447	\N	113	146022	\N	t	\N
146047	DIRECT	15	\N	140051	113	\N	\N	\N	\N
146048	DIRECT	15	\N	140051	115	\N	\N	\N	\N
146050	INDIRECT	15	\N	140052	115	146048	\N	t	\N
146049	INDIRECT	15	\N	140052	113	146047	\N	t	\N
146051	INDIRECT	15	140448	\N	113	146047	\N	t	\N
146052	INDIRECT	15	140448	\N	115	146048	\N	t	\N
146054	INDIRECT	15	\N	140053	113	146047	\N	t	\N
146053	INDIRECT	15	\N	140053	115	146048	\N	t	\N
146056	INDIRECT	15	140449	\N	115	146048	\N	t	\N
146068	INDIRECT	15	140452	\N	113	146047	\N	t	\N
39118	INDIRECT	22	6614	\N	113	39111	\N	t	\N
39120	INDIRECT	22	\N	6342	113	39111	\N	t	\N
39121	INDIRECT	22	\N	6342	115	39110	\N	t	\N
39123	INDIRECT	22	6615	\N	115	39110	\N	t	\N
39122	INDIRECT	22	6615	\N	113	39111	\N	t	\N
39124	INDIRECT	22	\N	6343	113	39111	\N	t	\N
39125	INDIRECT	22	\N	6343	115	39110	\N	t	\N
39126	INDIRECT	22	6616	\N	115	39110	\N	t	\N
39127	INDIRECT	22	6616	\N	113	39111	\N	t	\N
39128	DIRECT	22	\N	6353	113	\N	\N	\N	\N
39129	DIRECT	22	\N	6353	115	\N	\N	\N	\N
39130	INDIRECT	22	\N	6354	115	39129	\N	t	\N
39131	INDIRECT	22	\N	6354	113	39128	\N	t	\N
39133	INDIRECT	22	6623	\N	115	39129	\N	t	\N
39132	INDIRECT	22	6623	\N	113	39128	\N	t	\N
39135	INDIRECT	22	\N	6355	113	39128	\N	t	\N
39134	INDIRECT	22	\N	6355	115	39129	\N	t	\N
39137	INDIRECT	22	6624	\N	115	39129	\N	t	\N
39136	INDIRECT	22	6624	\N	113	39128	\N	t	\N
39139	DIRECT	22	\N	6674	113	\N	\N	\N	\N
39138	DIRECT	22	\N	6674	115	\N	\N	\N	\N
39141	INDIRECT	22	\N	6675	113	39139	\N	t	\N
39140	INDIRECT	22	\N	6675	115	39138	\N	t	\N
39143	INDIRECT	22	6634	\N	113	39139	\N	t	\N
44053	DIRECT	20	\N	7072	113	\N	\N	\N	\N
44061	INDIRECT	20	6948	\N	115	44052	\N	t	\N
44062	DIRECT	20	\N	7075	115	\N	\N	\N	\N
44063	DIRECT	20	\N	7075	113	\N	\N	\N	\N
44064	INDIRECT	20	\N	7076	115	44062	\N	t	\N
146067	INDIRECT	15	140452	\N	115	146048	\N	t	\N
146069	INDIRECT	15	\N	140057	115	146048	\N	t	\N
146070	INDIRECT	15	\N	140057	113	146047	\N	t	\N
146071	INDIRECT	15	140453	\N	113	146047	\N	t	\N
146072	INDIRECT	15	140453	\N	115	146048	\N	t	\N
146074	INDIRECT	15	\N	140058	115	146048	\N	t	\N
146073	INDIRECT	15	\N	140058	113	146047	\N	t	\N
146076	INDIRECT	15	140454	\N	115	146048	\N	t	\N
146075	INDIRECT	15	140454	\N	113	146047	\N	t	\N
146078	INDIRECT	15	\N	140059	115	146048	\N	t	\N
146077	INDIRECT	15	\N	140059	113	146047	\N	t	\N
146080	INDIRECT	15	140455	\N	113	146047	\N	t	\N
146079	INDIRECT	15	140455	\N	115	146048	\N	t	\N
146081	INDIRECT	15	\N	140060	115	146048	\N	t	\N
146082	INDIRECT	15	\N	140060	113	146047	\N	t	\N
146084	INDIRECT	15	140456	\N	113	146047	\N	t	\N
146140	DIRECT	15	\N	139997	115	\N	\N	\N	\N
146139	DIRECT	15	\N	139997	113	\N	\N	\N	\N
146142	INDIRECT	15	140399	\N	113	146139	\N	t	\N
146141	INDIRECT	15	140399	\N	115	146140	\N	t	\N
147981	DIRECT	11	\N	140074	111	\N	\N	\N	\N
147982	DIRECT	11	\N	140074	115	\N	\N	\N	\N
147983	INDIRECT	11	140469	\N	111	147981	\N	t	\N
147984	INDIRECT	11	140469	\N	115	147982	\N	t	\N
147985	DIRECT	11	\N	140075	112	\N	\N	\N	\N
147986	DIRECT	11	\N	140075	115	\N	\N	\N	\N
147987	INDIRECT	11	140470	\N	115	147986	\N	t	\N
147988	INDIRECT	11	140470	\N	112	147985	\N	t	\N
147996	INDIRECT	8	140474	\N	113	147993	\N	t	\N
147995	INDIRECT	8	140474	\N	115	147994	\N	t	\N
118339	DIRECT	8	\N	117789	113120	\N	\N	\N	\N
118340	INDIRECT	8	117976	\N	113120	118339	\N	t	\N
118341	DIRECT	8	\N	117790	113120	\N	\N	\N	\N
118342	INDIRECT	8	117977	\N	113120	118341	\N	t	\N
118343	DIRECT	8	\N	117792	113120	\N	\N	\N	\N
118344	INDIRECT	8	117978	\N	113120	118343	\N	t	\N
118345	DIRECT	8	\N	117793	113120	\N	\N	\N	\N
40916	DIRECT	21	\N	6676	115	\N	\N	\N	\N
40917	DIRECT	21	\N	6676	113	\N	\N	\N	\N
40918	INDIRECT	21	\N	6677	113	40917	\N	t	\N
40919	INDIRECT	21	\N	6677	115	40916	\N	t	\N
40920	INDIRECT	21	6635	\N	113	40917	\N	t	\N
40921	INDIRECT	21	6635	\N	115	40916	\N	t	\N
40923	DIRECT	21	\N	6815	113	\N	\N	\N	\N
40922	DIRECT	21	\N	6815	115	\N	\N	\N	\N
40925	INDIRECT	21	\N	6678	115	40922	\N	t	\N
40924	INDIRECT	21	\N	6678	113	40923	\N	t	\N
40927	INDIRECT	21	6636	\N	115	40922	\N	t	\N
40926	INDIRECT	21	6636	\N	113	40923	\N	t	\N
40929	INDIRECT	21	\N	6816	115	40922	\N	t	\N
40928	INDIRECT	21	\N	6816	113	40923	\N	t	\N
40931	INDIRECT	21	6907	\N	113	40923	\N	t	\N
40930	INDIRECT	21	6907	\N	115	40922	\N	t	\N
118346	INDIRECT	8	117979	\N	113120	118345	\N	t	\N
145904	INDIRECT	15	\N	140013	113	145897	\N	t	\N
145906	INDIRECT	15	140412	\N	113	145897	\N	t	\N
145905	INDIRECT	15	140412	\N	115	145898	\N	t	\N
44325	DIRECT	18	\N	7077	111	\N	\N	\N	\N
44326	INDIRECT	18	6950	\N	111	44325	\N	t	\N
44099	INDIRECT	20	\N	7080	113	44084	\N	t	\N
44098	INDIRECT	20	\N	7080	115	44085	\N	t	\N
44101	INDIRECT	20	6952	\N	115	44085	\N	t	\N
44100	INDIRECT	20	6952	\N	113	44084	\N	t	\N
44103	INDIRECT	20	\N	7118	115	44085	\N	t	\N
44102	INDIRECT	20	\N	7118	113	44084	\N	t	\N
44104	INDIRECT	20	7187	\N	113	44084	\N	t	\N
44105	INDIRECT	20	7187	\N	115	44085	\N	t	\N
44106	INDIRECT	20	\N	7119	115	44085	\N	t	\N
44107	INDIRECT	20	\N	7119	113	44084	\N	t	\N
44108	INDIRECT	20	7188	\N	113	44084	\N	t	\N
44109	INDIRECT	20	7188	\N	115	44085	\N	t	\N
44111	INDIRECT	20	\N	7120	113	44084	\N	t	\N
44110	INDIRECT	20	\N	7120	115	44085	\N	t	\N
44112	INDIRECT	20	7189	\N	115	44085	\N	t	\N
44113	INDIRECT	20	7189	\N	113	44084	\N	t	\N
44114	INDIRECT	20	\N	7121	115	44085	\N	t	\N
44115	INDIRECT	20	\N	7121	113	44084	\N	t	\N
44116	INDIRECT	20	7190	\N	113	44084	\N	t	\N
44117	INDIRECT	20	7190	\N	115	44085	\N	t	\N
44123	DIRECT	20	\N	7123	115	\N	\N	\N	\N
145907	INDIRECT	15	\N	140014	115	145898	\N	t	\N
145908	INDIRECT	15	\N	140014	113	145897	\N	t	\N
145910	INDIRECT	15	140413	\N	113	145897	\N	t	\N
145909	INDIRECT	15	140413	\N	115	145898	\N	t	\N
145911	INDIRECT	15	\N	140015	113	145897	\N	t	\N
145912	INDIRECT	15	\N	140015	115	145898	\N	t	\N
145914	INDIRECT	15	140414	\N	115	145898	\N	t	\N
145913	INDIRECT	15	140414	\N	113	145897	\N	t	\N
145915	INDIRECT	15	\N	140016	115	145898	\N	t	\N
145916	INDIRECT	15	\N	140016	113	145897	\N	t	\N
145917	INDIRECT	15	140415	\N	113	145897	\N	t	\N
39142	INDIRECT	22	6634	\N	115	39138	\N	t	\N
40944	INDIRECT	21	6910	\N	113	40937	\N	t	\N
40947	INDIRECT	21	\N	6821	115	40936	\N	t	\N
40946	INDIRECT	21	\N	6821	113	40937	\N	t	\N
40949	INDIRECT	21	6911	\N	115	40936	\N	t	\N
40948	INDIRECT	21	6911	\N	113	40937	\N	t	\N
40951	INDIRECT	21	\N	6822	115	40936	\N	t	\N
40950	INDIRECT	21	\N	6822	113	40937	\N	t	\N
40952	INDIRECT	21	6912	\N	115	40936	\N	t	\N
40953	INDIRECT	21	6912	\N	113	40937	\N	t	\N
40955	INDIRECT	21	\N	6823	113	40937	\N	t	\N
40954	INDIRECT	21	\N	6823	115	40936	\N	t	\N
40956	INDIRECT	21	6913	\N	113	40937	\N	t	\N
40957	INDIRECT	21	6913	\N	115	40936	\N	t	\N
40959	INDIRECT	21	\N	6824	115	40936	\N	t	\N
40958	INDIRECT	21	\N	6824	113	40937	\N	t	\N
40960	INDIRECT	21	6914	\N	113	40937	\N	t	\N
40961	INDIRECT	21	6914	\N	115	40936	\N	t	\N
40962	DIRECT	21	\N	6825	113	\N	\N	\N	\N
40963	DIRECT	21	\N	6825	115	\N	\N	\N	\N
40964	INDIRECT	21	\N	6826	113	40962	\N	f	\N
40965	INDIRECT	21	\N	6826	115	40963	\N	t	\N
40967	INDIRECT	21	6915	\N	115	40963	\N	t	\N
40966	INDIRECT	21	6915	\N	113	40962	\N	f	\N
40969	INDIRECT	21	\N	6827	115	40963	\N	t	\N
40968	INDIRECT	21	\N	6827	113	40962	\N	t	\N
40971	INDIRECT	21	6916	\N	115	40963	\N	t	\N
40970	INDIRECT	21	6916	\N	113	40962	\N	t	\N
40973	INDIRECT	21	\N	6828	115	40963	\N	t	\N
40972	INDIRECT	21	\N	6828	113	40962	\N	t	\N
40975	INDIRECT	21	6917	\N	113	40962	\N	t	\N
44052	DIRECT	20	\N	7072	115	\N	\N	\N	\N
44055	INDIRECT	20	\N	7073	113	44053	\N	t	\N
44054	INDIRECT	20	\N	7073	115	44052	\N	t	\N
44057	INDIRECT	20	6947	\N	115	44052	\N	t	\N
44056	INDIRECT	20	6947	\N	113	44053	\N	t	\N
44059	INDIRECT	20	\N	7074	113	44053	\N	t	\N
44058	INDIRECT	20	\N	7074	115	44052	\N	t	\N
44060	INDIRECT	20	6948	\N	113	44053	\N	t	\N
145849	DIRECT	15	\N	139998	115	\N	\N	\N	\N
145850	DIRECT	15	\N	139998	113	\N	\N	\N	\N
135428	DIRECT	2	\N	135456	134431	\N	\N	\N	\N
135429	INDIRECT	2	135334	\N	134431	135428	\N	t	\N
135430	DIRECT	2	\N	135457	134431	\N	\N	\N	\N
135431	INDIRECT	2	135335	\N	134431	135430	\N	t	\N
135432	DIRECT	2	\N	135458	134431	\N	\N	\N	\N
135433	INDIRECT	2	135336	\N	134431	135432	\N	t	\N
135434	DIRECT	2	\N	135459	134431	\N	\N	\N	\N
135435	INDIRECT	2	135337	\N	134431	135434	\N	t	\N
135436	DIRECT	2	\N	135460	134431	\N	\N	\N	\N
135437	INDIRECT	2	135338	\N	134431	135436	\N	t	\N
145851	INDIRECT	15	\N	139999	113	145850	\N	t	\N
145852	INDIRECT	15	\N	139999	115	145849	\N	t	\N
145924	INDIRECT	15	\N	140018	113	145897	\N	t	\N
145925	INDIRECT	15	140417	\N	115	145898	\N	t	\N
145926	INDIRECT	15	140417	\N	113	145897	\N	t	\N
145927	INDIRECT	15	\N	140019	115	145898	\N	t	\N
145968	INDIRECT	15	\N	140029	115	145898	\N	t	\N
145969	INDIRECT	15	140428	\N	115	145898	\N	t	\N
145970	INDIRECT	15	140428	\N	113	145897	\N	t	\N
145971	INDIRECT	15	\N	140030	115	145898	\N	t	\N
145972	INDIRECT	15	\N	140030	113	145897	\N	t	\N
145974	INDIRECT	15	140429	\N	113	145897	\N	t	\N
145973	INDIRECT	15	140429	\N	115	145898	\N	t	\N
145976	INDIRECT	15	\N	140031	115	145898	\N	t	\N
145975	INDIRECT	15	\N	140031	113	145897	\N	t	\N
145977	INDIRECT	15	140430	\N	113	145897	\N	t	\N
145978	INDIRECT	15	140430	\N	115	145898	\N	t	\N
145979	DIRECT	15	\N	140033	113	\N	\N	\N	\N
145981	INDIRECT	15	\N	140034	115	145980	\N	t	\N
145982	INDIRECT	15	\N	140034	113	145979	\N	t	\N
145984	INDIRECT	15	140432	\N	115	145980	\N	t	\N
145983	INDIRECT	15	140432	\N	113	145979	\N	t	\N
145985	INDIRECT	15	\N	140035	115	145980	\N	t	\N
145986	INDIRECT	15	\N	140035	113	145979	\N	t	\N
145987	INDIRECT	15	140433	\N	115	145980	\N	t	\N
145988	INDIRECT	15	140433	\N	113	145979	\N	t	\N
145989	INDIRECT	15	\N	140036	113	145979	\N	t	\N
145990	INDIRECT	15	\N	140036	115	145980	\N	t	\N
145992	INDIRECT	15	140434	\N	113	145979	\N	t	\N
145991	INDIRECT	15	140434	\N	115	145980	\N	t	\N
145993	INDIRECT	15	\N	140037	113	145979	\N	t	\N
145994	INDIRECT	15	\N	140037	115	145980	\N	t	\N
145996	INDIRECT	15	140435	\N	115	145980	\N	t	\N
145995	INDIRECT	15	140435	\N	113	145979	\N	t	\N
145998	INDIRECT	15	\N	140038	115	145980	\N	t	\N
145997	INDIRECT	15	\N	140038	113	145979	\N	t	\N
146000	INDIRECT	15	140436	\N	115	145980	\N	t	\N
145999	INDIRECT	15	140436	\N	113	145979	\N	t	\N
146105	DIRECT	15	\N	140066	113	\N	\N	\N	\N
146083	INDIRECT	15	140456	\N	115	146048	\N	t	\N
146085	INDIRECT	15	\N	140061	113	146047	\N	t	\N
146086	INDIRECT	15	\N	140061	115	146048	\N	t	\N
146087	INDIRECT	15	140457	\N	115	146048	\N	t	\N
146088	INDIRECT	15	140457	\N	113	146047	\N	t	\N
146090	INDIRECT	15	\N	140062	115	146048	\N	t	\N
146089	INDIRECT	15	\N	140062	113	146047	\N	t	\N
146091	INDIRECT	15	140458	\N	113	146047	\N	t	\N
146092	INDIRECT	15	140458	\N	115	146048	\N	t	\N
146094	INDIRECT	15	\N	140063	115	146048	\N	t	\N
146093	INDIRECT	15	\N	140063	113	146047	\N	t	\N
146095	INDIRECT	15	140459	\N	115	146048	\N	t	\N
146096	INDIRECT	15	140459	\N	113	146047	\N	t	\N
146097	INDIRECT	15	\N	140064	113	146047	\N	t	\N
146098	INDIRECT	15	\N	140064	115	146048	\N	t	\N
146100	INDIRECT	15	140460	\N	113	146047	\N	t	\N
146099	INDIRECT	15	140460	\N	115	146048	\N	t	\N
146101	INDIRECT	15	\N	140065	113	146047	\N	t	\N
146102	INDIRECT	15	\N	140065	115	146048	\N	t	\N
146103	INDIRECT	15	140461	\N	115	146048	\N	t	\N
146104	INDIRECT	15	140461	\N	113	146047	\N	t	\N
146106	DIRECT	15	\N	140066	115	\N	\N	\N	\N
146111	INDIRECT	15	\N	140067	115	146106	\N	t	\N
146112	INDIRECT	15	\N	140067	113	146105	\N	t	\N
146113	INDIRECT	15	140462	\N	115	146106	\N	t	\N
146114	INDIRECT	15	140462	\N	113	146105	\N	t	\N
146116	INDIRECT	15	\N	140068	115	146106	\N	t	\N
146115	INDIRECT	15	\N	140068	113	146105	\N	t	\N
146118	INDIRECT	15	140463	\N	115	146106	\N	t	\N
146117	INDIRECT	15	140463	\N	113	146105	\N	t	\N
146119	INDIRECT	15	\N	140069	115	146106	\N	t	\N
146120	INDIRECT	15	\N	140069	113	146105	\N	t	\N
147993	DIRECT	8	\N	140079	113	\N	\N	\N	\N
147994	DIRECT	8	\N	140079	115	\N	\N	\N	\N
146121	INDIRECT	15	140464	\N	115	146106	\N	t	\N
146122	INDIRECT	15	140464	\N	113	146105	\N	t	\N
146123	INDIRECT	15	\N	140070	115	146106	\N	t	\N
146124	INDIRECT	15	\N	140070	113	146105	\N	t	\N
146126	INDIRECT	15	140465	\N	113	146105	\N	t	\N
146125	INDIRECT	15	140465	\N	115	146106	\N	t	\N
146127	INDIRECT	15	\N	140071	115	146106	\N	t	\N
146128	INDIRECT	15	\N	140071	113	146105	\N	t	\N
146130	INDIRECT	15	140466	\N	115	146106	\N	t	\N
146129	INDIRECT	15	140466	\N	113	146105	\N	t	\N
146136	DIRECT	15	\N	139996	115	\N	\N	\N	\N
146135	DIRECT	15	\N	139996	113	\N	\N	\N	\N
146138	INDIRECT	15	140398	\N	113	146135	\N	t	\N
146137	INDIRECT	15	140398	\N	115	146136	\N	t	\N
145853	INDIRECT	15	140400	\N	113	145850	\N	t	\N
145854	INDIRECT	15	140400	\N	115	145849	\N	t	\N
145855	INDIRECT	15	\N	140000	115	145849	\N	t	\N
145856	INDIRECT	15	\N	140000	113	145850	\N	t	\N
145858	INDIRECT	15	140401	\N	115	145849	\N	t	\N
145857	INDIRECT	15	140401	\N	113	145850	\N	t	\N
145859	INDIRECT	15	\N	140001	115	145849	\N	t	\N
145860	INDIRECT	15	\N	140001	113	145850	\N	t	\N
145862	INDIRECT	15	140402	\N	115	145849	\N	t	\N
145861	INDIRECT	15	140402	\N	113	145850	\N	t	\N
145864	INDIRECT	15	\N	140002	113	145850	\N	t	\N
145863	INDIRECT	15	\N	140002	115	145849	\N	t	\N
145866	INDIRECT	15	140403	\N	113	145850	\N	t	\N
145865	INDIRECT	15	140403	\N	115	145849	\N	t	\N
145868	INDIRECT	15	\N	140003	115	145849	\N	t	\N
145867	INDIRECT	15	\N	140003	113	145850	\N	t	\N
145869	INDIRECT	15	140404	\N	115	145849	\N	t	\N
145870	INDIRECT	15	140404	\N	113	145850	\N	t	\N
145871	INDIRECT	15	\N	140004	115	145849	\N	t	\N
145918	INDIRECT	15	140415	\N	115	145898	\N	t	\N
145920	INDIRECT	15	\N	140017	115	145898	\N	t	\N
145919	INDIRECT	15	\N	140017	113	145897	\N	t	\N
145921	INDIRECT	15	140416	\N	113	145897	\N	t	\N
145922	INDIRECT	15	140416	\N	115	145898	\N	t	\N
145923	INDIRECT	15	\N	140018	115	145898	\N	t	\N
145928	INDIRECT	15	\N	140019	113	145897	\N	t	\N
145930	INDIRECT	15	140418	\N	115	145898	\N	t	\N
145929	INDIRECT	15	140418	\N	113	145897	\N	t	\N
145931	INDIRECT	15	\N	140020	115	145898	\N	t	\N
145932	INDIRECT	15	\N	140020	113	145897	\N	t	\N
145934	INDIRECT	15	140419	\N	113	145897	\N	t	\N
145933	INDIRECT	15	140419	\N	115	145898	\N	t	\N
145936	INDIRECT	15	\N	140021	115	145898	\N	t	\N
145935	INDIRECT	15	\N	140021	113	145897	\N	t	\N
145938	INDIRECT	15	140420	\N	113	145897	\N	t	\N
145937	INDIRECT	15	140420	\N	115	145898	\N	t	\N
145939	INDIRECT	15	\N	140022	115	145898	\N	t	\N
145940	INDIRECT	15	\N	140022	113	145897	\N	t	\N
145942	INDIRECT	15	140421	\N	115	145898	\N	t	\N
145941	INDIRECT	15	140421	\N	113	145897	\N	t	\N
145943	INDIRECT	15	\N	140023	115	145898	\N	t	\N
145944	INDIRECT	15	\N	140023	113	145897	\N	t	\N
145945	INDIRECT	15	140422	\N	115	145898	\N	t	\N
145946	INDIRECT	15	140422	\N	113	145897	\N	t	\N
145947	INDIRECT	15	\N	140024	113	145897	\N	t	\N
145948	INDIRECT	15	\N	140024	115	145898	\N	t	\N
145950	INDIRECT	15	140423	\N	113	145897	\N	t	\N
145949	INDIRECT	15	140423	\N	115	145898	\N	t	\N
145951	INDIRECT	15	\N	140025	113	145897	\N	t	\N
145952	INDIRECT	15	\N	140025	115	145898	\N	t	\N
145954	INDIRECT	15	140424	\N	113	145897	\N	t	\N
145953	INDIRECT	15	140424	\N	115	145898	\N	t	\N
145956	INDIRECT	15	\N	140026	113	145897	\N	t	\N
145955	INDIRECT	15	\N	140026	115	145898	\N	t	\N
145958	INDIRECT	15	140425	\N	115	145898	\N	t	\N
145957	INDIRECT	15	140425	\N	113	145897	\N	t	\N
145960	INDIRECT	15	\N	140027	113	145897	\N	t	\N
145959	INDIRECT	15	\N	140027	115	145898	\N	t	\N
145961	INDIRECT	15	140426	\N	115	145898	\N	t	\N
145962	INDIRECT	15	140426	\N	113	145897	\N	t	\N
145964	INDIRECT	15	\N	140028	115	145898	\N	t	\N
145963	INDIRECT	15	\N	140028	113	145897	\N	t	\N
145966	INDIRECT	15	140427	\N	115	145898	\N	t	\N
145965	INDIRECT	15	140427	\N	113	145897	\N	t	\N
145967	INDIRECT	15	\N	140029	113	145897	\N	t	\N
145872	INDIRECT	15	\N	140004	113	145850	\N	t	\N
145873	INDIRECT	15	140405	\N	115	145849	\N	t	\N
145874	INDIRECT	15	140405	\N	113	145850	\N	t	\N
145876	DIRECT	15	\N	140005	115	\N	\N	\N	\N
145878	INDIRECT	15	\N	140006	113	145875	\N	t	\N
145877	INDIRECT	15	\N	140006	115	145876	\N	t	\N
145879	INDIRECT	15	140406	\N	115	145876	\N	t	\N
145880	INDIRECT	15	140406	\N	113	145875	\N	t	\N
145882	INDIRECT	15	\N	140007	115	145876	\N	t	\N
145881	INDIRECT	15	\N	140007	113	145875	\N	t	\N
145884	INDIRECT	15	140407	\N	113	145875	\N	t	\N
145883	INDIRECT	15	140407	\N	115	145876	\N	t	\N
145886	INDIRECT	15	\N	140008	115	145876	\N	t	\N
145885	INDIRECT	15	\N	140008	113	145875	\N	t	\N
145887	INDIRECT	15	140408	\N	115	145876	\N	t	\N
145888	INDIRECT	15	140408	\N	113	145875	\N	t	\N
145890	INDIRECT	15	\N	140009	115	145876	\N	t	\N
145889	INDIRECT	15	\N	140009	113	145875	\N	t	\N
145892	INDIRECT	15	140409	\N	115	145876	\N	t	\N
145891	INDIRECT	15	140409	\N	113	145875	\N	t	\N
145894	INDIRECT	15	\N	140010	115	145876	\N	t	\N
145893	INDIRECT	15	\N	140010	113	145875	\N	t	\N
145896	INDIRECT	15	140410	\N	115	145876	\N	t	\N
145895	INDIRECT	15	140410	\N	113	145875	\N	t	\N
145898	DIRECT	15	\N	140011	115	\N	\N	\N	\N
145897	DIRECT	15	\N	140011	113	\N	\N	\N	\N
145900	INDIRECT	15	\N	140012	115	145898	\N	t	\N
145899	INDIRECT	15	\N	140012	113	145897	\N	t	\N
145902	INDIRECT	15	140411	\N	115	145898	\N	t	\N
145901	INDIRECT	15	140411	\N	113	145897	\N	t	\N
145903	INDIRECT	15	\N	140013	115	145898	\N	t	\N
146019	INDIRECT	15	140441	\N	115	145980	\N	t	\N
146021	DIRECT	15	\N	140044	115	\N	\N	\N	\N
146023	INDIRECT	15	\N	140045	115	146021	\N	t	\N
146024	INDIRECT	15	\N	140045	113	146022	\N	t	\N
146025	INDIRECT	15	140442	\N	113	146022	\N	t	\N
146026	INDIRECT	15	140442	\N	115	146021	\N	t	\N
146027	INDIRECT	15	\N	140046	113	146022	\N	t	\N
146028	INDIRECT	15	\N	140046	115	146021	\N	t	\N
146030	INDIRECT	15	140443	\N	113	146022	\N	t	\N
146029	INDIRECT	15	140443	\N	115	146021	\N	t	\N
146032	INDIRECT	15	\N	140047	115	146021	\N	t	\N
146031	INDIRECT	15	\N	140047	113	146022	\N	t	\N
146034	INDIRECT	15	140444	\N	115	146021	\N	t	\N
146033	INDIRECT	15	140444	\N	113	146022	\N	t	\N
146035	INDIRECT	15	\N	140048	113	146022	\N	t	\N
146036	INDIRECT	15	\N	140048	115	146021	\N	t	\N
146037	INDIRECT	15	140445	\N	115	146021	\N	t	\N
146038	INDIRECT	15	140445	\N	113	146022	\N	t	\N
146039	INDIRECT	15	\N	140049	113	146022	\N	t	\N
368414	INDIRECT	6	\N	367251	367743	368409	\N	t	\N
368415	INDIRECT	6	367449	\N	367743	368409	\N	t	\N
368416	INDIRECT	6	\N	367252	367743	368409	\N	t	\N
368417	INDIRECT	6	367450	\N	367743	368409	\N	t	\N
368418	INDIRECT	6	\N	367253	367743	368409	\N	t	\N
368419	INDIRECT	6	367451	\N	367743	368409	\N	t	\N
368400	DIRECT	6	\N	367238	367743	\N	\N	\N	\N
368401	INDIRECT	6	\N	367239	367743	368400	\N	t	\N
368402	INDIRECT	6	367438	\N	367743	368400	\N	t	\N
368403	INDIRECT	6	\N	367240	367743	368400	\N	t	\N
368404	INDIRECT	6	367439	\N	367743	368400	\N	t	\N
368405	INDIRECT	6	\N	367241	367743	368400	\N	t	\N
368406	INDIRECT	6	367440	\N	367743	368400	\N	t	\N
368407	INDIRECT	6	\N	367242	367743	368400	\N	t	\N
368408	INDIRECT	6	367441	\N	367743	368400	\N	t	\N
368409	DIRECT	6	\N	367249	367743	\N	\N	\N	\N
368410	INDIRECT	6	\N	367243	367743	368409	\N	t	\N
368411	INDIRECT	6	367442	\N	367743	368409	\N	t	\N
368412	INDIRECT	6	\N	367250	367743	368409	\N	t	\N
368413	INDIRECT	6	367448	\N	367743	368409	\N	t	\N
368670	INDIRECT	5	\N	367255	367743	368667	\N	t	\N
368671	INDIRECT	5	367452	\N	367743	368667	\N	t	\N
368672	INDIRECT	5	\N	367256	367743	368667	\N	t	\N
368673	INDIRECT	5	367453	\N	367743	368667	\N	t	\N
368674	DIRECT	5	\N	367257	367743	\N	\N	\N	\N
368675	INDIRECT	5	\N	367245	367743	368674	\N	t	\N
368676	INDIRECT	5	367444	\N	367743	368674	\N	t	\N
368677	INDIRECT	5	\N	367258	367743	368674	\N	t	\N
368678	INDIRECT	5	367454	\N	367743	368674	\N	t	\N
368679	INDIRECT	5	\N	367259	367743	368674	\N	t	\N
368680	INDIRECT	5	367455	\N	367743	368674	\N	t	\N
368681	DIRECT	5	\N	367246	367744	\N	\N	\N	\N
368682	INDIRECT	5	367445	\N	367744	368681	\N	t	\N
368683	DIRECT	5	\N	367247	112	\N	\N	\N	\N
368684	INDIRECT	5	367446	\N	112	368683	\N	t	\N
368685	DIRECT	5	\N	367248	367743	\N	\N	\N	\N
368686	INDIRECT	5	367447	\N	367743	368685	\N	t	\N
368667	DIRECT	5	\N	367254	367743	\N	\N	\N	\N
368668	INDIRECT	5	\N	367244	367743	368667	\N	t	\N
368669	INDIRECT	5	367443	\N	367743	368667	\N	t	\N
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource, code) FROM stdin;
1421	3	2010-02-03 11:49:18.397	\N	f	115	1222	1421
1420	3	2010-02-03 11:49:18.641	\N	f	111	1222	1420
368246	1	2010-04-21 16:20:31.92	\N	f	367744	367843	fd3799d3-0f0d-4a3c-98c9-3b51778c0fef
368247	1	2010-04-21 16:20:48.532	\N	f	367741	367843	02141fd0-9531-4111-a9ef-1902db59d2ae
1415	4	2010-02-03 11:32:38.84	\N	f	111	1214	1415
1414	4	2010-02-03 11:32:28.538	\N	f	115	1214	1414
1422	2	2010-02-03 11:50:45.662	\N	f	115	1224	1422
1423	2	2010-02-03 11:50:45.80	\N	f	112	1224	1423
1435	4	2010-02-03 12:11:29.501	\N	f	119	1239	1435
91304	1	2010-02-16 09:39:09.883	\N	f	113	90901	a9d19354-98db-4172-9b97-37dc232a6090
91305	1	2010-02-16 09:39:15.062	\N	f	115	90901	e9eea0c2-bb44-4d82-be35-48cd9258cc77
1424	3	2009-02-03 00:00:00	\N	f	115	1226	1424
1425	3	2009-02-03 00:00:00	\N	f	111	1226	1425
139886	2	2010-04-08 09:57:46.013	\N	f	115	139482	68a40214-f870-4846-a07d-2da3f6c63675
139885	2	2010-04-08 09:57:57.179	\N	f	113	139482	83601699-9b2a-4038-857a-6bb25d49821b
91306	3	2010-01-01 00:00:00	\N	f	99889	90904	78aa841e-d3bc-422d-ae80-f6cbddbe6628
91307	3	2010-02-16 13:10:36.164	\N	f	99889	90906	b4e05509-8a41-4696-8214-2bf2706f2c88
368249	2	2010-04-21 16:20:59.983	\N	f	367743	367845	52ba994c-f645-4a53-a4e3-85d5574507c5
117463	2	2010-02-17 17:01:25.675	\N	f	113120	117262	762f64e2-4037-44d0-b115-b5136733e9cb
1431	2	2010-02-03 12:01:22.342	\N	f	118	1232	1431
1430	2	2010-02-03 12:01:27.187	\N	f	107	1232	1430
368248	2	2010-04-21 16:21:07.975	\N	f	367742	367845	7e3c7683-682c-4d83-81b4-816c5210508e
117464	3	2010-02-17 17:33:04.681	\N	f	113120	117264	e0cc0fa3-3712-4cbb-82de-80f2ed22925d
1433	1	2010-02-03 12:02:38.699	\N	f	108	1234	1433
1432	2	2010-02-03 12:02:27.235	\N	f	118	1234	1432
1434	2	2010-02-03 12:06:04.997	\N	f	118	1236	1434
139889	1	2010-04-08 00:00:00	\N	f	115	139486	b9ccc3f9-85de-4ed0-aa2c-b1f3c3647874
139890	1	2010-04-08 00:00:00	\N	f	113	139486	dfeceea1-b71b-4aa4-a904-c67773d111c3
134937	3	2010-02-25 12:48:27.376	2010-04-25 00:00:00	f	134431	134535	d4830ea4-c32b-434b-addb-f74b3b9e6f12
134938	3	2010-02-25 12:48:44.613	\N	f	134431	134537	7dc02739-231c-4572-9606-14f681edbd3c
134936	3	2010-02-25 12:48:02.559	\N	t	134431	134533	bb11df3b-4591-4b4f-abfd-cdec37d5ad27
134939	2	2010-03-25 00:00:00	\N	f	134431	134533	f66a634a-b15a-45bc-a729-b34dcbb5170a
139888	4	2010-04-08 09:59:18.825	\N	f	115	139484	456e1920-953a-44a9-9f27-933c8ced4808
139887	4	2010-04-08 09:59:13.983	\N	f	113	139484	836d030b-c629-482a-8d30-bf043aa4cbe6
139891	2	2010-04-08 16:44:04.621	\N	f	112	139484	0b3d05c5-cccd-47de-bd88-0d2e0e2499f2
139892	1	2010-04-08 16:45:27.378	\N	f	111	139484	5055ea10-7991-481d-baef-6b5e2f567e51
1417	8	2010-02-03 11:46:26.79	2010-05-08 00:00:00	f	113	1217	1417
1416	8	2010-02-03 11:46:39.721	2010-05-08 00:00:00	f	115	1217	1416
1426	3	2010-02-03 11:51:51.152	2010-05-08 00:00:00	f	115	1228	1426
1427	3	2010-02-03 11:51:43.253	2010-05-08 00:00:00	f	113	1228	1427
1419	6	2010-02-01 00:00:00	2010-05-08 00:00:00	f	115	1220	1419
1418	6	2010-02-01 00:00:00	2010-05-08 00:00:00	f	113	1220	1418
1429	4	2010-02-03 11:53:20.584	2010-04-08 00:00:00	f	113	1230	1429
1428	4	2010-02-03 11:53:20.404	2010-05-08 00:00:00	f	115	1230	1428
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource, generatecode) FROM stdin;
7	1	f628f992-3a23-4b8d-879c-ed86d3b8af5f	Tipo de máquina	\N	t	f	t	2	\N
884736	8	9dd011b7-ab94-4374-a2c8-bc8c64512331	JOB	Job	t	t	t	1	\N
884737	1	f3d03f3a-ea9f-46d9-9c0f-8d3f1768d345	LOCATION_GROUP	Location where the resource work	t	f	t	0	\N
4	14	acb3c00d-ba8a-4f13-b8c1-5ff0abf04e50	Tipo de trabajo	Job	t	t	t	0	\N
119275520	2	72a14da3-7e6b-468a-b6bf-7b659c3cdf33	PERFIL	\N	t	f	t	0	t
119275521	1	59318606-bf9a-4a80-a7dc-554df2525c21	Rol	\N	t	f	t	0	t
1	15	9851a32c-67f7-466f-9300-a88df217354a	LEAVE	Leave	f	f	t	1	\N
3	9	fac04b2a-3a26-4be1-839b-a6a9b7b2ba71	TRAINING	Training courses and labor training	t	t	t	1	\N
5	5	7eae9fec-5f5e-4352-ba17-f0043ea00397	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1	\N
6	3	0ca57206-77e8-4767-8a7a-97b8a79fe604	Localización	Location where the resource work	t	t	t	0	\N
2	12	8e2eca53-284a-49ed-92d3-72aa70254602	CATEGORY	Professional category	t	t	t	1	\N
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
4387	GENERIC_DAY	1	8	2010-02-19	1224	\N	3063	\N
4388	GENERIC_DAY	1	8	2010-02-15	1224	\N	3063	\N
4389	GENERIC_DAY	1	8	2010-02-16	1224	\N	3063	\N
4390	GENERIC_DAY	1	0	2010-02-20	1224	\N	3063	\N
4391	GENERIC_DAY	1	0	2010-02-06	1224	\N	3063	\N
4392	GENERIC_DAY	1	8	2010-02-12	1224	\N	3063	\N
4393	GENERIC_DAY	1	0	2010-02-21	1224	\N	3063	\N
4394	GENERIC_DAY	1	0	2010-02-13	1224	\N	3063	\N
4395	GENERIC_DAY	1	4	2010-02-23	1224	\N	3063	\N
2988	GENERIC_DAY	2	2	2010-02-01	1230	\N	2527	\N
2989	GENERIC_DAY	2	2	2010-02-02	1230	\N	2527	\N
2990	GENERIC_DAY	2	2	2010-02-02	1228	\N	2527	\N
2991	GENERIC_DAY	2	2	2010-02-02	1220	\N	2527	\N
2992	GENERIC_DAY	2	2	2010-02-01	1220	\N	2527	\N
2985	GENERIC_DAY	2	2	2010-02-01	1228	\N	2527	\N
2986	GENERIC_DAY	2	2	2010-02-02	1217	\N	2527	\N
2987	GENERIC_DAY	2	2	2010-02-01	1217	\N	2527	\N
4162	SPECIFIC_DAY	2	0	2010-02-28	1224	3053	\N	\N
4163	SPECIFIC_DAY	2	0	2010-02-27	1224	3053	\N	\N
4164	SPECIFIC_DAY	2	7	2010-03-01	1224	3053	\N	\N
2999	SPECIFIC_DAY	0	4	2010-02-03	1230	3032	\N	\N
3000	SPECIFIC_DAY	0	6	2010-02-02	1230	3032	\N	\N
3001	SPECIFIC_DAY	0	6	2010-02-01	1230	3032	\N	\N
4165	SPECIFIC_DAY	2	8	2010-02-26	1224	3053	\N	\N
4166	SPECIFIC_DAY	2	0	2010-02-21	1214	3054	\N	\N
4167	SPECIFIC_DAY	2	0	2010-02-20	1214	3054	\N	\N
4168	SPECIFIC_DAY	2	8	2010-02-22	1214	3054	\N	\N
4169	SPECIFIC_DAY	2	8	2010-02-25	1214	3054	\N	\N
4170	SPECIFIC_DAY	2	8	2010-02-24	1214	3054	\N	\N
4171	SPECIFIC_DAY	2	8	2010-02-23	1214	3054	\N	\N
4083	SPECIFIC_DAY	4	0	2010-02-20	1220	3043	\N	\N
4084	SPECIFIC_DAY	4	8	2010-02-09	1220	3043	\N	\N
4085	SPECIFIC_DAY	4	8	2010-02-12	1220	3043	\N	\N
4086	SPECIFIC_DAY	4	8	2010-02-22	1220	3043	\N	\N
4087	SPECIFIC_DAY	4	8	2010-02-16	1220	3043	\N	\N
4088	SPECIFIC_DAY	4	8	2010-02-19	1220	3043	\N	\N
4089	SPECIFIC_DAY	4	0	2010-02-13	1220	3043	\N	\N
4090	SPECIFIC_DAY	4	7	2010-02-23	1220	3043	\N	\N
4091	SPECIFIC_DAY	4	0	2010-02-17	1220	3043	\N	\N
4092	SPECIFIC_DAY	4	0	2010-02-07	1220	3043	\N	\N
4093	SPECIFIC_DAY	4	8	2010-02-11	1220	3043	\N	\N
4094	SPECIFIC_DAY	4	8	2010-02-18	1220	3043	\N	\N
4095	SPECIFIC_DAY	4	8	2010-02-08	1220	3043	\N	\N
4096	SPECIFIC_DAY	4	8	2010-02-15	1220	3043	\N	\N
4097	SPECIFIC_DAY	4	8	2010-02-10	1220	3043	\N	\N
4098	SPECIFIC_DAY	4	0	2010-02-21	1220	3043	\N	\N
4099	SPECIFIC_DAY	4	8	2010-02-04	1220	3043	\N	\N
4100	SPECIFIC_DAY	4	0	2010-02-06	1220	3043	\N	\N
4101	SPECIFIC_DAY	4	8	2010-02-05	1220	3043	\N	\N
4102	SPECIFIC_DAY	4	0	2010-02-14	1220	3043	\N	\N
4103	SPECIFIC_DAY	4	8	2010-03-01	1226	3044	\N	\N
4104	SPECIFIC_DAY	4	0	2010-02-27	1226	3044	\N	\N
4607	GENERIC_DAY	2	0	2010-02-08	1220	\N	3069	\N
4606	GENERIC_DAY	2	0	2010-02-07	1217	\N	3069	\N
4609	GENERIC_DAY	2	0	2010-02-07	1228	\N	3069	\N
4603	GENERIC_DAY	2	4	2010-02-05	1228	\N	3069	\N
4604	GENERIC_DAY	2	4	2010-02-08	1228	\N	3069	\N
4608	GENERIC_DAY	2	0	2010-02-10	1220	\N	3069	\N
4600	GENERIC_DAY	2	4	2010-02-05	1217	\N	3069	\N
4599	GENERIC_DAY	2	4	2010-02-10	1228	\N	3069	\N
4602	GENERIC_DAY	2	0	2010-02-06	1220	\N	3069	\N
4105	SPECIFIC_DAY	4	8	2010-02-23	1226	3044	\N	\N
4106	SPECIFIC_DAY	4	8	2010-02-25	1226	3044	\N	\N
4107	SPECIFIC_DAY	4	8	2010-02-24	1226	3044	\N	\N
4108	SPECIFIC_DAY	4	0	2010-02-28	1226	3044	\N	\N
4109	SPECIFIC_DAY	4	8	2010-03-02	1226	3044	\N	\N
4110	SPECIFIC_DAY	4	8	2010-02-26	1226	3044	\N	\N
4111	SPECIFIC_DAY	4	6	2010-03-03	1226	3044	\N	\N
4112	SPECIFIC_DAY	4	0	2010-02-07	1214	3045	\N	\N
4113	SPECIFIC_DAY	4	0	2010-02-06	1214	3045	\N	\N
4114	SPECIFIC_DAY	4	6	2010-02-09	1214	3045	\N	\N
4115	SPECIFIC_DAY	4	8	2010-02-05	1214	3045	\N	\N
4116	SPECIFIC_DAY	4	8	2010-02-04	1214	3045	\N	\N
4117	SPECIFIC_DAY	4	8	2010-02-08	1214	3045	\N	\N
4174	SPECIFIC_DAY	1	8	2010-02-04	1230	3056	\N	\N
4175	SPECIFIC_DAY	1	8	2010-02-05	1230	3056	\N	\N
4118	SPECIFIC_DAY	4	0	2010-02-21	1228	3046	\N	\N
4119	SPECIFIC_DAY	4	0	2010-02-20	1228	3046	\N	\N
4120	SPECIFIC_DAY	4	8	2010-02-22	1228	3046	\N	\N
4121	SPECIFIC_DAY	4	0	2010-02-14	1214	3047	\N	\N
4122	SPECIFIC_DAY	4	2	2010-02-19	1214	3047	\N	\N
4123	SPECIFIC_DAY	4	8	2010-02-16	1214	3047	\N	\N
4124	SPECIFIC_DAY	4	8	2010-02-15	1214	3047	\N	\N
4125	SPECIFIC_DAY	4	0	2010-02-17	1214	3047	\N	\N
4126	SPECIFIC_DAY	4	8	2010-02-11	1214	3047	\N	\N
4127	SPECIFIC_DAY	4	8	2010-02-10	1214	3047	\N	\N
4128	SPECIFIC_DAY	4	0	2010-02-13	1214	3047	\N	\N
4129	SPECIFIC_DAY	4	8	2010-02-12	1214	3047	\N	\N
4130	SPECIFIC_DAY	4	8	2010-02-18	1214	3047	\N	\N
4145	SPECIFIC_DAY	3	8	2010-03-04	1228	3050	\N	\N
4146	SPECIFIC_DAY	3	0	2010-03-06	1228	3050	\N	\N
4147	SPECIFIC_DAY	3	8	2010-03-03	1228	3050	\N	\N
4148	SPECIFIC_DAY	3	8	2010-03-09	1228	3050	\N	\N
4149	SPECIFIC_DAY	3	8	2010-03-05	1228	3050	\N	\N
4150	SPECIFIC_DAY	3	8	2010-03-08	1228	3050	\N	\N
4151	SPECIFIC_DAY	3	0	2010-03-07	1228	3050	\N	\N
4131	SPECIFIC_DAY	4	8	2010-03-02	1230	3048	\N	\N
4132	SPECIFIC_DAY	4	8	2010-03-01	1230	3048	\N	\N
4133	SPECIFIC_DAY	4	8	2010-02-25	1230	3048	\N	\N
4134	SPECIFIC_DAY	4	0	2010-02-28	1230	3048	\N	\N
4135	SPECIFIC_DAY	4	0	2010-02-27	1230	3048	\N	\N
4601	GENERIC_DAY	2	4	2010-02-08	1230	\N	3069	\N
4605	GENERIC_DAY	2	0	2010-02-05	1230	\N	3069	\N
4612	GENERIC_DAY	2	8	2010-02-10	1239	\N	3070	\N
4611	GENERIC_DAY	2	0	2010-02-07	1239	\N	3070	\N
4136	SPECIFIC_DAY	4	8	2010-02-24	1230	3048	\N	\N
4137	SPECIFIC_DAY	4	8	2010-02-26	1230	3048	\N	\N
4187	SPECIFIC_DAY	0	8	2010-02-09	1217	3059	\N	\N
4188	SPECIFIC_DAY	0	8	2010-02-08	1217	3059	\N	\N
4189	SPECIFIC_DAY	0	0	2010-02-06	1217	3059	\N	\N
4190	SPECIFIC_DAY	0	0	2010-02-07	1217	3059	\N	\N
4191	SPECIFIC_DAY	0	8	2010-02-10	1217	3059	\N	\N
4192	SPECIFIC_DAY	0	8	2010-02-16	1226	3060	\N	\N
4193	SPECIFIC_DAY	0	8	2010-02-12	1226	3060	\N	\N
4194	SPECIFIC_DAY	0	0	2010-02-14	1226	3060	\N	\N
4195	SPECIFIC_DAY	0	8	2010-02-15	1226	3060	\N	\N
4196	SPECIFIC_DAY	0	0	2010-02-13	1226	3060	\N	\N
4197	SPECIFIC_DAY	0	8	2010-02-11	1226	3060	\N	\N
4436	GENERIC_DAY	1	4	2010-03-11	1217	\N	3064	\N
4437	GENERIC_DAY	1	6	2010-03-08	1217	\N	3064	\N
4438	GENERIC_DAY	1	0	2010-03-04	1228	\N	3064	\N
4439	GENERIC_DAY	1	0	2010-02-25	1230	\N	3064	\N
4440	GENERIC_DAY	1	5	2010-03-09	1230	\N	3064	\N
4441	GENERIC_DAY	1	0	2010-03-06	1220	\N	3064	\N
4442	GENERIC_DAY	1	0	2010-02-28	1220	\N	3064	\N
4443	GENERIC_DAY	1	0	2010-03-08	1228	\N	3064	\N
4444	GENERIC_DAY	1	6	2010-02-25	1217	\N	3064	\N
4445	GENERIC_DAY	1	5	2010-03-05	1220	\N	3064	\N
4446	GENERIC_DAY	1	5	2010-03-09	1220	\N	3064	\N
4447	GENERIC_DAY	1	6	2010-03-02	1217	\N	3064	\N
4448	GENERIC_DAY	1	0	2010-02-27	1220	\N	3064	\N
4449	GENERIC_DAY	1	0	2010-03-07	1217	\N	3064	\N
4450	GENERIC_DAY	1	0	2010-03-06	1217	\N	3064	\N
4451	GENERIC_DAY	1	4	2010-03-11	1228	\N	3064	\N
4452	GENERIC_DAY	1	0	2010-02-27	1230	\N	3064	\N
4453	GENERIC_DAY	1	5	2010-03-04	1220	\N	3064	\N
4454	GENERIC_DAY	1	0	2010-02-27	1217	\N	3064	\N
4455	GENERIC_DAY	1	6	2010-02-24	1217	\N	3064	\N
4456	GENERIC_DAY	1	5	2010-03-05	1230	\N	3064	\N
4457	GENERIC_DAY	1	0	2010-03-09	1228	\N	3064	\N
4458	GENERIC_DAY	1	6	2010-03-01	1217	\N	3064	\N
4459	GENERIC_DAY	1	6	2010-02-26	1217	\N	3064	\N
4460	GENERIC_DAY	1	5	2010-03-02	1228	\N	3064	\N
4461	GENERIC_DAY	1	6	2010-03-09	1217	\N	3064	\N
4462	GENERIC_DAY	1	5	2010-02-26	1220	\N	3064	\N
4463	GENERIC_DAY	1	6	2010-03-05	1217	\N	3064	\N
4464	GENERIC_DAY	1	5	2010-02-24	1228	\N	3064	\N
4465	GENERIC_DAY	1	5	2010-03-08	1230	\N	3064	\N
4466	GENERIC_DAY	1	4	2010-03-10	1220	\N	3064	\N
4467	GENERIC_DAY	1	0	2010-03-05	1228	\N	3064	\N
4468	GENERIC_DAY	1	2	2010-03-12	1228	\N	3064	\N
4469	GENERIC_DAY	1	4	2010-03-10	1230	\N	3064	\N
4470	GENERIC_DAY	1	0	2010-02-28	1230	\N	3064	\N
4471	GENERIC_DAY	1	5	2010-02-25	1228	\N	3064	\N
4472	GENERIC_DAY	1	0	2010-03-01	1230	\N	3064	\N
4473	GENERIC_DAY	1	4	2010-03-11	1230	\N	3064	\N
4474	GENERIC_DAY	1	5	2010-03-02	1220	\N	3064	\N
4511	GENERIC_DAY	0	4	2010-02-26	1239	\N	3066	\N
4512	GENERIC_DAY	0	0	2010-02-21	1239	\N	3066	\N
4513	GENERIC_DAY	0	4	2010-03-01	1239	\N	3066	\N
4514	GENERIC_DAY	0	4	2010-02-12	1239	\N	3066	\N
4515	GENERIC_DAY	0	4	2010-03-11	1239	\N	3066	\N
4516	GENERIC_DAY	0	0	2010-02-27	1239	\N	3066	\N
4517	GENERIC_DAY	0	0	2010-02-20	1239	\N	3066	\N
4518	GENERIC_DAY	0	4	2010-03-02	1239	\N	3066	\N
4519	GENERIC_DAY	0	0	2010-02-14	1239	\N	3066	\N
4520	GENERIC_DAY	0	4	2010-02-19	1239	\N	3066	\N
4521	GENERIC_DAY	0	4	2010-03-10	1239	\N	3066	\N
4522	GENERIC_DAY	0	0	2010-02-28	1239	\N	3066	\N
4523	GENERIC_DAY	0	0	2010-03-06	1239	\N	3066	\N
4524	GENERIC_DAY	0	4	2010-02-23	1239	\N	3066	\N
4525	GENERIC_DAY	0	0	2010-02-07	1239	\N	3066	\N
4526	GENERIC_DAY	0	4	2010-02-11	1239	\N	3066	\N
4527	GENERIC_DAY	0	4	2010-02-24	1239	\N	3066	\N
4528	GENERIC_DAY	0	4	2010-02-25	1239	\N	3066	\N
4529	GENERIC_DAY	0	4	2010-03-08	1239	\N	3066	\N
4530	GENERIC_DAY	0	0	2010-02-13	1239	\N	3066	\N
4531	GENERIC_DAY	0	0	2010-03-07	1239	\N	3066	\N
4532	GENERIC_DAY	0	4	2010-03-09	1239	\N	3066	\N
4533	GENERIC_DAY	0	4	2010-02-16	1239	\N	3066	\N
4534	GENERIC_DAY	0	4	2010-03-05	1239	\N	3066	\N
4535	GENERIC_DAY	0	4	2010-02-18	1239	\N	3066	\N
4536	GENERIC_DAY	0	4	2010-02-08	1239	\N	3066	\N
4537	GENERIC_DAY	0	0	2010-02-06	1239	\N	3066	\N
4538	GENERIC_DAY	0	4	2010-02-05	1239	\N	3066	\N
4539	GENERIC_DAY	0	4	2010-02-15	1239	\N	3066	\N
4540	GENERIC_DAY	0	4	2010-02-09	1239	\N	3066	\N
4541	GENERIC_DAY	0	4	2010-02-04	1239	\N	3066	\N
4542	GENERIC_DAY	0	4	2010-02-22	1239	\N	3066	\N
4543	GENERIC_DAY	0	4	2010-03-04	1239	\N	3066	\N
4544	GENERIC_DAY	0	0	2010-02-17	1239	\N	3066	\N
4545	GENERIC_DAY	0	4	2010-03-03	1239	\N	3066	\N
4546	GENERIC_DAY	0	4	2010-02-10	1239	\N	3066	\N
4588	GENERIC_DAY	2	0	2010-02-06	1217	\N	3069	\N
4583	GENERIC_DAY	2	0	2010-02-04	1230	\N	3069	\N
4585	GENERIC_DAY	2	4	2010-02-09	1228	\N	3069	\N
4598	GENERIC_DAY	2	4	2010-02-04	1228	\N	3069	\N
4592	GENERIC_DAY	2	0	2010-02-09	1220	\N	3069	\N
4587	GENERIC_DAY	2	4	2010-02-10	1230	\N	3069	\N
4591	GENERIC_DAY	2	0	2010-02-06	1228	\N	3069	\N
4596	GENERIC_DAY	2	0	2010-02-05	1220	\N	3069	\N
4586	GENERIC_DAY	2	0	2010-02-08	1217	\N	3069	\N
4597	GENERIC_DAY	2	0	2010-02-10	1217	\N	3069	\N
4593	GENERIC_DAY	2	4	2010-02-04	1217	\N	3069	\N
4582	GENERIC_DAY	2	0	2010-02-07	1220	\N	3069	\N
4396	GENERIC_DAY	1	8	2010-02-08	1224	\N	3063	\N
4397	GENERIC_DAY	1	8	2010-02-10	1224	\N	3063	\N
4398	GENERIC_DAY	1	8	2010-02-22	1224	\N	3063	\N
4399	GENERIC_DAY	1	8	2010-02-18	1224	\N	3063	\N
4400	GENERIC_DAY	1	0	2010-02-14	1224	\N	3063	\N
4401	GENERIC_DAY	1	0	2010-02-17	1224	\N	3063	\N
4402	GENERIC_DAY	1	8	2010-02-11	1224	\N	3063	\N
4403	GENERIC_DAY	1	8	2010-02-04	1224	\N	3063	\N
4404	GENERIC_DAY	1	0	2010-02-07	1224	\N	3063	\N
4405	GENERIC_DAY	1	8	2010-02-09	1224	\N	3063	\N
4406	GENERIC_DAY	1	8	2010-02-05	1224	\N	3063	\N
4407	GENERIC_DAY	1	0	2010-02-26	1230	\N	3064	\N
4408	GENERIC_DAY	1	6	2010-03-04	1217	\N	3064	\N
4409	GENERIC_DAY	1	0	2010-03-07	1230	\N	3064	\N
4410	GENERIC_DAY	1	0	2010-03-02	1230	\N	3064	\N
4411	GENERIC_DAY	1	0	2010-02-28	1217	\N	3064	\N
4412	GENERIC_DAY	1	4	2010-03-10	1217	\N	3064	\N
4413	GENERIC_DAY	1	4	2010-03-10	1228	\N	3064	\N
4414	GENERIC_DAY	1	0	2010-03-03	1228	\N	3064	\N
4415	GENERIC_DAY	1	5	2010-03-08	1220	\N	3064	\N
4416	GENERIC_DAY	1	5	2010-03-01	1228	\N	3064	\N
4417	GENERIC_DAY	1	5	2010-03-03	1230	\N	3064	\N
4418	GENERIC_DAY	1	0	2010-02-24	1230	\N	3064	\N
4419	GENERIC_DAY	1	0	2010-03-06	1230	\N	3064	\N
4420	GENERIC_DAY	1	0	2010-03-07	1228	\N	3064	\N
4421	GENERIC_DAY	1	0	2010-03-06	1228	\N	3064	\N
4422	GENERIC_DAY	1	4	2010-03-11	1220	\N	3064	\N
4423	GENERIC_DAY	1	0	2010-03-07	1220	\N	3064	\N
4424	GENERIC_DAY	1	5	2010-02-26	1228	\N	3064	\N
4425	GENERIC_DAY	1	2	2010-03-12	1217	\N	3064	\N
4426	GENERIC_DAY	1	2	2010-03-12	1220	\N	3064	\N
4427	GENERIC_DAY	1	0	2010-02-27	1228	\N	3064	\N
4428	GENERIC_DAY	1	5	2010-03-01	1220	\N	3064	\N
4429	GENERIC_DAY	1	0	2010-02-28	1228	\N	3064	\N
4430	GENERIC_DAY	1	5	2010-02-24	1220	\N	3064	\N
4431	GENERIC_DAY	1	6	2010-03-03	1217	\N	3064	\N
4432	GENERIC_DAY	1	5	2010-03-03	1220	\N	3064	\N
4433	GENERIC_DAY	1	5	2010-03-04	1230	\N	3064	\N
4434	GENERIC_DAY	1	5	2010-02-25	1220	\N	3064	\N
4435	GENERIC_DAY	1	2	2010-03-12	1230	\N	3064	\N
4595	GENERIC_DAY	2	4	2010-02-09	1230	\N	3069	\N
4584	GENERIC_DAY	2	0	2010-02-07	1230	\N	3069	\N
4589	GENERIC_DAY	2	0	2010-02-04	1220	\N	3069	\N
4594	GENERIC_DAY	2	0	2010-02-06	1230	\N	3069	\N
4590	GENERIC_DAY	2	0	2010-02-09	1217	\N	3069	\N
4615	GENERIC_DAY	2	0	2010-02-06	1239	\N	3070	\N
4613	GENERIC_DAY	2	8	2010-02-08	1239	\N	3070	\N
4610	GENERIC_DAY	2	8	2010-02-05	1239	\N	3070	\N
4616	GENERIC_DAY	2	8	2010-02-04	1239	\N	3070	\N
4614	GENERIC_DAY	2	8	2010-02-09	1239	\N	3070	\N
5320	SPECIFIC_DAY	0	8	2010-02-18	1236	5051	\N	\N
5321	SPECIFIC_DAY	0	0	2010-02-06	1236	5051	\N	\N
5322	SPECIFIC_DAY	0	8	2010-02-10	1236	5051	\N	\N
5323	SPECIFIC_DAY	0	0	2010-02-21	1236	5051	\N	\N
5324	SPECIFIC_DAY	0	8	2010-02-22	1236	5051	\N	\N
5325	SPECIFIC_DAY	0	8	2010-02-15	1236	5051	\N	\N
5326	SPECIFIC_DAY	0	0	2010-02-07	1236	5051	\N	\N
5327	SPECIFIC_DAY	0	8	2010-02-12	1236	5051	\N	\N
5328	SPECIFIC_DAY	0	8	2010-02-16	1236	5051	\N	\N
5329	SPECIFIC_DAY	0	4	2010-02-23	1236	5051	\N	\N
5330	SPECIFIC_DAY	0	8	2010-02-11	1236	5051	\N	\N
5331	SPECIFIC_DAY	0	8	2010-02-05	1236	5051	\N	\N
5332	SPECIFIC_DAY	0	0	2010-02-13	1236	5051	\N	\N
5333	SPECIFIC_DAY	0	8	2010-02-19	1236	5051	\N	\N
5334	SPECIFIC_DAY	0	8	2010-02-08	1236	5051	\N	\N
5335	SPECIFIC_DAY	0	8	2010-02-09	1236	5051	\N	\N
5336	SPECIFIC_DAY	0	8	2010-02-04	1236	5051	\N	\N
5337	SPECIFIC_DAY	0	0	2010-02-20	1236	5051	\N	\N
5338	SPECIFIC_DAY	0	0	2010-02-17	1236	5051	\N	\N
5339	SPECIFIC_DAY	0	0	2010-02-14	1236	5051	\N	\N
5296	DERIVED_DAY	0	2	2010-02-16	1214	\N	\N	5152
5297	DERIVED_DAY	0	2	2010-02-04	1224	\N	\N	5152
5298	DERIVED_DAY	0	2	2010-02-11	1224	\N	\N	5152
5299	DERIVED_DAY	0	2	2010-02-15	1214	\N	\N	5152
5300	DERIVED_DAY	0	2	2010-02-04	1214	\N	\N	5152
5301	DERIVED_DAY	0	2	2010-02-15	1224	\N	\N	5152
5302	DERIVED_DAY	0	2	2010-02-22	1224	\N	\N	5152
5303	DERIVED_DAY	0	2	2010-02-05	1224	\N	\N	5152
5304	DERIVED_DAY	0	3	2010-02-09	1214	\N	\N	5152
5305	DERIVED_DAY	0	2	2010-02-16	1224	\N	\N	5152
5306	DERIVED_DAY	0	2	2010-02-12	1214	\N	\N	5152
5307	DERIVED_DAY	0	2	2010-02-10	1214	\N	\N	5152
5308	DERIVED_DAY	0	2	2010-02-18	1214	\N	\N	5152
5309	DERIVED_DAY	0	2	2010-02-12	1224	\N	\N	5152
5310	DERIVED_DAY	0	2	2010-02-10	1224	\N	\N	5152
5311	DERIVED_DAY	0	2	2010-02-23	1224	\N	\N	5152
5312	DERIVED_DAY	0	2	2010-02-11	1214	\N	\N	5152
5313	DERIVED_DAY	0	4	2010-02-19	1214	\N	\N	5152
5314	DERIVED_DAY	0	1	2010-02-09	1224	\N	\N	5152
5315	DERIVED_DAY	0	2	2010-02-18	1224	\N	\N	5152
5316	DERIVED_DAY	0	2	2010-02-08	1224	\N	\N	5152
5317	DERIVED_DAY	0	2	2010-02-22	1214	\N	\N	5152
5318	DERIVED_DAY	0	2	2010-02-05	1214	\N	\N	5152
5319	DERIVED_DAY	0	2	2010-02-08	1214	\N	\N	5152
330499	SPECIFIC_DAY	5	3	2010-06-16	139484	146357	\N	\N
330579	SPECIFIC_DAY	5	2	2010-11-26	139484	146357	\N	\N
330521	SPECIFIC_DAY	5	2	2010-07-14	139484	146357	\N	\N
330519	SPECIFIC_DAY	5	2	2010-08-09	139484	146357	\N	\N
330535	SPECIFIC_DAY	5	2	2010-10-22	139484	146357	\N	\N
330562	SPECIFIC_DAY	5	2	2010-11-22	139484	146357	\N	\N
330520	SPECIFIC_DAY	5	2	2010-06-18	139484	146357	\N	\N
330527	SPECIFIC_DAY	5	2	2010-11-04	139484	146357	\N	\N
330584	SPECIFIC_DAY	5	2	2010-11-02	139484	146357	\N	\N
330610	SPECIFIC_DAY	5	2	2010-11-17	139484	146357	\N	\N
330561	SPECIFIC_DAY	5	2	2010-09-30	139484	146357	\N	\N
330567	SPECIFIC_DAY	5	2	2010-07-30	139484	146357	\N	\N
330544	SPECIFIC_DAY	5	2	2010-08-06	139484	146357	\N	\N
330614	SPECIFIC_DAY	5	2	2010-08-18	139484	146357	\N	\N
330522	SPECIFIC_DAY	5	2	2010-11-08	139484	146357	\N	\N
330549	SPECIFIC_DAY	5	2	2010-12-14	139484	146357	\N	\N
330496	SPECIFIC_DAY	5	2	2010-12-03	139484	146357	\N	\N
330498	SPECIFIC_DAY	5	2	2010-10-13	139484	146357	\N	\N
330508	SPECIFIC_DAY	5	2	2010-06-22	139484	146357	\N	\N
330554	SPECIFIC_DAY	5	2	2010-07-12	139484	146357	\N	\N
330556	SPECIFIC_DAY	5	2	2010-11-25	139484	146357	\N	\N
330563	SPECIFIC_DAY	5	2	2010-08-20	139484	146357	\N	\N
330525	SPECIFIC_DAY	5	2	2010-09-14	139484	146357	\N	\N
330542	SPECIFIC_DAY	5	2	2010-12-02	139484	146357	\N	\N
330497	SPECIFIC_DAY	5	2	2010-09-21	139484	146357	\N	\N
330500	SPECIFIC_DAY	5	2	2010-09-08	139484	146357	\N	\N
330585	SPECIFIC_DAY	5	3	2010-06-15	139484	146357	\N	\N
330532	SPECIFIC_DAY	5	2	2010-06-23	139484	146357	\N	\N
330523	SPECIFIC_DAY	5	2	2010-07-26	139484	146357	\N	\N
330553	SPECIFIC_DAY	5	2	2010-10-21	139484	146357	\N	\N
330501	SPECIFIC_DAY	5	2	2010-08-19	139484	146357	\N	\N
330509	SPECIFIC_DAY	5	2	2010-10-29	139484	146357	\N	\N
330512	SPECIFIC_DAY	5	2	2010-11-24	139484	146357	\N	\N
330502	SPECIFIC_DAY	5	2	2010-07-02	139484	146357	\N	\N
330487	SPECIFIC_DAY	5	2	2010-08-05	139484	146357	\N	\N
330517	SPECIFIC_DAY	5	2	2010-08-02	139484	146357	\N	\N
330538	SPECIFIC_DAY	5	2	2010-08-23	139484	146357	\N	\N
330537	SPECIFIC_DAY	5	2	2010-08-30	139484	146357	\N	\N
330611	SPECIFIC_DAY	5	2	2010-06-28	139484	146357	\N	\N
330495	SPECIFIC_DAY	5	2	2010-10-28	139484	146357	\N	\N
330609	SPECIFIC_DAY	5	2	2010-11-05	139484	146357	\N	\N
330536	SPECIFIC_DAY	5	2	2010-07-15	139484	146357	\N	\N
353075	GENERIC_DAY	3	1	2010-06-21	139486	\N	148707	\N
353068	GENERIC_DAY	3	0	2010-06-27	139482	\N	148707	\N
353035	GENERIC_DAY	3	3	2010-06-10	139482	\N	148707	\N
353039	GENERIC_DAY	3	0	2010-06-14	139484	\N	148707	\N
353071	GENERIC_DAY	3	1	2010-06-24	139484	\N	148707	\N
353045	GENERIC_DAY	3	1	2010-06-25	139486	\N	148707	\N
353037	GENERIC_DAY	3	0	2010-06-20	139484	\N	148707	\N
353054	GENERIC_DAY	3	2	2010-06-29	139484	\N	148707	\N
115828	GENERIC_DAY	3	0	2010-02-27	90904	\N	97578	\N
115829	GENERIC_DAY	3	8	2010-02-25	90904	\N	97578	\N
115830	GENERIC_DAY	3	8	2010-02-22	90904	\N	97578	\N
115831	GENERIC_DAY	3	0	2010-02-21	90906	\N	97578	\N
115832	GENERIC_DAY	3	8	2010-03-02	90906	\N	97578	\N
115833	GENERIC_DAY	3	0	2010-02-17	90906	\N	97578	\N
115834	GENERIC_DAY	3	0	2010-02-28	90904	\N	97578	\N
115835	GENERIC_DAY	3	8	2010-02-25	90906	\N	97578	\N
115836	GENERIC_DAY	3	8	2010-03-02	90904	\N	97578	\N
115837	GENERIC_DAY	3	8	2010-02-16	90904	\N	97578	\N
115838	GENERIC_DAY	3	0	2010-02-27	90906	\N	97578	\N
115839	GENERIC_DAY	3	0	2010-02-20	90906	\N	97578	\N
115840	GENERIC_DAY	3	8	2010-02-26	90904	\N	97578	\N
115841	GENERIC_DAY	3	8	2010-02-16	90906	\N	97578	\N
115842	GENERIC_DAY	3	8	2010-03-01	90904	\N	97578	\N
115843	GENERIC_DAY	3	8	2010-02-19	90904	\N	97578	\N
115844	GENERIC_DAY	3	8	2010-02-24	90904	\N	97578	\N
115845	GENERIC_DAY	3	8	2010-02-19	90906	\N	97578	\N
115846	GENERIC_DAY	3	0	2010-02-21	90904	\N	97578	\N
115847	GENERIC_DAY	3	8	2010-02-24	90906	\N	97578	\N
115848	GENERIC_DAY	3	0	2010-02-20	90904	\N	97578	\N
115849	GENERIC_DAY	3	8	2010-03-01	90906	\N	97578	\N
115850	GENERIC_DAY	3	8	2010-02-22	90906	\N	97578	\N
115851	GENERIC_DAY	3	8	2010-02-23	90906	\N	97578	\N
115852	GENERIC_DAY	3	0	2010-02-28	90906	\N	97578	\N
115853	GENERIC_DAY	3	8	2010-02-26	90906	\N	97578	\N
115854	GENERIC_DAY	3	8	2010-02-18	90906	\N	97578	\N
115855	GENERIC_DAY	3	8	2010-02-18	90904	\N	97578	\N
115856	GENERIC_DAY	3	8	2010-02-23	90904	\N	97578	\N
115857	GENERIC_DAY	3	0	2010-02-17	90904	\N	97578	\N
89491	SPECIFIC_DAY	1	1	2010-04-27	1226	89399	\N	\N
89492	SPECIFIC_DAY	1	8	2010-04-26	1226	89399	\N	\N
89493	SPECIFIC_DAY	1	0	2010-04-24	1226	89399	\N	\N
89494	SPECIFIC_DAY	1	8	2010-04-23	1226	89399	\N	\N
89495	SPECIFIC_DAY	1	0	2010-04-25	1226	89399	\N	\N
89496	SPECIFIC_DAY	1	8	2010-04-22	1226	89399	\N	\N
89497	SPECIFIC_DAY	1	8	2010-04-21	1226	89399	\N	\N
89498	SPECIFIC_DAY	1	8	2010-04-26	1217	89400	\N	\N
89499	SPECIFIC_DAY	1	0	2010-04-24	1217	89400	\N	\N
89500	SPECIFIC_DAY	1	8	2010-04-23	1217	89400	\N	\N
89501	SPECIFIC_DAY	1	2	2010-04-27	1217	89400	\N	\N
89502	SPECIFIC_DAY	1	0	2010-04-25	1217	89400	\N	\N
89503	SPECIFIC_DAY	1	8	2010-04-21	1217	89400	\N	\N
89504	SPECIFIC_DAY	1	8	2010-04-22	1217	89400	\N	\N
89505	SPECIFIC_DAY	1	8	2010-04-21	1222	89401	\N	\N
89506	SPECIFIC_DAY	1	8	2010-04-26	1222	89401	\N	\N
89507	SPECIFIC_DAY	1	8	2010-04-23	1222	89401	\N	\N
89508	SPECIFIC_DAY	1	8	2010-04-22	1222	89401	\N	\N
89509	SPECIFIC_DAY	1	0	2010-04-24	1222	89401	\N	\N
89510	SPECIFIC_DAY	1	1	2010-04-27	1222	89401	\N	\N
89511	SPECIFIC_DAY	1	0	2010-04-25	1222	89401	\N	\N
89512	SPECIFIC_DAY	1	0	2010-05-01	1220	89402	\N	\N
89513	SPECIFIC_DAY	1	8	2010-04-30	1220	89402	\N	\N
89514	SPECIFIC_DAY	1	0	2010-05-02	1220	89402	\N	\N
89515	SPECIFIC_DAY	1	8	2010-04-28	1220	89402	\N	\N
89516	SPECIFIC_DAY	1	8	2010-05-03	1220	89402	\N	\N
89517	SPECIFIC_DAY	1	2	2010-05-04	1220	89402	\N	\N
89518	SPECIFIC_DAY	1	8	2010-04-29	1220	89402	\N	\N
89519	SPECIFIC_DAY	1	8	2010-04-29	1228	89403	\N	\N
89520	SPECIFIC_DAY	1	8	2010-04-28	1228	89403	\N	\N
89521	SPECIFIC_DAY	1	0	2010-05-02	1228	89403	\N	\N
89522	SPECIFIC_DAY	1	1	2010-05-04	1228	89403	\N	\N
89523	SPECIFIC_DAY	1	8	2010-05-03	1228	89403	\N	\N
89524	SPECIFIC_DAY	1	0	2010-05-01	1228	89403	\N	\N
89525	SPECIFIC_DAY	1	8	2010-04-30	1228	89403	\N	\N
89526	SPECIFIC_DAY	1	8	2010-04-29	1224	89404	\N	\N
89527	SPECIFIC_DAY	1	0	2010-05-02	1224	89404	\N	\N
89528	SPECIFIC_DAY	1	8	2010-05-03	1224	89404	\N	\N
89529	SPECIFIC_DAY	1	8	2010-04-30	1224	89404	\N	\N
89530	SPECIFIC_DAY	1	0	2010-05-01	1224	89404	\N	\N
89531	SPECIFIC_DAY	1	1	2010-05-04	1224	89404	\N	\N
89532	SPECIFIC_DAY	1	8	2010-04-28	1224	89404	\N	\N
89533	SPECIFIC_DAY	1	6	2010-04-27	1224	89405	\N	\N
89534	SPECIFIC_DAY	1	6	2010-04-22	1224	89405	\N	\N
89535	SPECIFIC_DAY	1	5	2010-04-30	1224	89405	\N	\N
89536	SPECIFIC_DAY	1	6	2010-04-21	1224	89405	\N	\N
89537	SPECIFIC_DAY	1	6	2010-04-26	1224	89405	\N	\N
89538	SPECIFIC_DAY	1	6	2010-04-23	1224	89405	\N	\N
89539	SPECIFIC_DAY	1	5	2010-05-04	1224	89405	\N	\N
89540	SPECIFIC_DAY	1	5	2010-04-29	1224	89405	\N	\N
89541	SPECIFIC_DAY	1	6	2010-04-28	1224	89405	\N	\N
89542	SPECIFIC_DAY	1	5	2010-05-03	1224	89405	\N	\N
115858	GENERIC_DAY	3	4	2010-03-04	90904	\N	97579	\N
115859	GENERIC_DAY	3	12	2010-03-15	90906	\N	97579	\N
115860	GENERIC_DAY	3	4	2010-03-16	90904	\N	97579	\N
115861	GENERIC_DAY	3	5	2010-03-03	90904	\N	97579	\N
115862	GENERIC_DAY	3	4	2010-03-08	90904	\N	97579	\N
115863	GENERIC_DAY	3	12	2010-03-16	90906	\N	97579	\N
115864	GENERIC_DAY	3	12	2010-03-12	90906	\N	97579	\N
115865	GENERIC_DAY	3	0	2010-03-14	90906	\N	97579	\N
115866	GENERIC_DAY	3	11	2010-03-09	90906	\N	97579	\N
115867	GENERIC_DAY	3	5	2010-03-05	90904	\N	97579	\N
115868	GENERIC_DAY	3	0	2010-03-07	90904	\N	97579	\N
115869	GENERIC_DAY	3	0	2010-03-13	90906	\N	97579	\N
115870	GENERIC_DAY	3	0	2010-03-14	90904	\N	97579	\N
115871	GENERIC_DAY	3	12	2010-03-08	90906	\N	97579	\N
115872	GENERIC_DAY	3	4	2010-03-15	90904	\N	97579	\N
115873	GENERIC_DAY	3	0	2010-03-06	90906	\N	97579	\N
115874	GENERIC_DAY	3	11	2010-03-05	90906	\N	97579	\N
115875	GENERIC_DAY	3	5	2010-03-09	90904	\N	97579	\N
115876	GENERIC_DAY	3	12	2010-03-11	90906	\N	97579	\N
90496	SPECIFIC_DAY	0	8	2010-04-22	1226	86460	\N	\N
90497	SPECIFIC_DAY	0	8	2010-05-07	1226	86460	\N	\N
90498	SPECIFIC_DAY	0	0	2010-05-01	1226	86460	\N	\N
90499	SPECIFIC_DAY	0	8	2010-05-03	1226	86460	\N	\N
90500	SPECIFIC_DAY	0	8	2010-06-02	1226	86460	\N	\N
90501	SPECIFIC_DAY	0	8	2010-05-14	1226	86460	\N	\N
90502	SPECIFIC_DAY	0	8	2010-04-23	1226	86460	\N	\N
90503	SPECIFIC_DAY	0	0	2010-05-30	1226	86460	\N	\N
90504	SPECIFIC_DAY	0	0	2010-05-22	1226	86460	\N	\N
90505	SPECIFIC_DAY	0	0	2010-05-02	1226	86460	\N	\N
90506	SPECIFIC_DAY	0	8	2010-04-21	1226	86460	\N	\N
90507	SPECIFIC_DAY	0	8	2010-05-24	1226	86460	\N	\N
90508	SPECIFIC_DAY	0	8	2010-05-10	1226	86460	\N	\N
90509	SPECIFIC_DAY	0	8	2010-04-28	1226	86460	\N	\N
90510	SPECIFIC_DAY	0	0	2010-04-25	1226	86460	\N	\N
90511	SPECIFIC_DAY	0	8	2010-05-25	1226	86460	\N	\N
90512	SPECIFIC_DAY	0	8	2010-05-06	1226	86460	\N	\N
90513	SPECIFIC_DAY	0	8	2010-04-29	1226	86460	\N	\N
90514	SPECIFIC_DAY	0	0	2010-05-23	1226	86460	\N	\N
90515	SPECIFIC_DAY	0	8	2010-05-04	1226	86460	\N	\N
90516	SPECIFIC_DAY	0	0	2010-05-29	1226	86460	\N	\N
90517	SPECIFIC_DAY	0	0	2010-05-16	1226	86460	\N	\N
90518	SPECIFIC_DAY	0	8	2010-05-12	1226	86460	\N	\N
90519	SPECIFIC_DAY	0	8	2010-04-26	1226	86460	\N	\N
90520	SPECIFIC_DAY	0	8	2010-05-13	1226	86460	\N	\N
90521	SPECIFIC_DAY	0	8	2010-04-30	1226	86460	\N	\N
90522	SPECIFIC_DAY	0	8	2010-04-27	1226	86460	\N	\N
90523	SPECIFIC_DAY	0	8	2010-06-01	1226	86460	\N	\N
90524	SPECIFIC_DAY	0	8	2010-05-20	1226	86460	\N	\N
90525	SPECIFIC_DAY	0	8	2010-05-18	1226	86460	\N	\N
90526	SPECIFIC_DAY	0	8	2010-05-19	1226	86460	\N	\N
90527	SPECIFIC_DAY	0	8	2010-05-28	1226	86460	\N	\N
90528	SPECIFIC_DAY	0	0	2010-05-15	1226	86460	\N	\N
90529	SPECIFIC_DAY	0	0	2010-05-08	1226	86460	\N	\N
90530	SPECIFIC_DAY	0	8	2010-05-31	1226	86460	\N	\N
90531	SPECIFIC_DAY	0	0	2010-05-17	1226	86460	\N	\N
90532	SPECIFIC_DAY	0	8	2010-05-11	1226	86460	\N	\N
90533	SPECIFIC_DAY	0	8	2010-05-05	1226	86460	\N	\N
90534	SPECIFIC_DAY	0	8	2010-06-04	1226	86460	\N	\N
90535	SPECIFIC_DAY	0	0	2010-04-24	1226	86460	\N	\N
90536	SPECIFIC_DAY	0	8	2010-05-26	1226	86460	\N	\N
90537	SPECIFIC_DAY	0	0	2010-05-09	1226	86460	\N	\N
90538	SPECIFIC_DAY	0	8	2010-06-03	1226	86460	\N	\N
90539	SPECIFIC_DAY	0	8	2010-05-21	1226	86460	\N	\N
90540	SPECIFIC_DAY	0	8	2010-05-27	1226	86460	\N	\N
115877	GENERIC_DAY	3	4	2010-03-12	90904	\N	97579	\N
115878	GENERIC_DAY	3	0	2010-03-13	90904	\N	97579	\N
115879	GENERIC_DAY	3	12	2010-03-04	90906	\N	97579	\N
115880	GENERIC_DAY	3	4	2010-03-10	90904	\N	97579	\N
115881	GENERIC_DAY	3	0	2010-03-07	90906	\N	97579	\N
115882	GENERIC_DAY	3	12	2010-03-10	90906	\N	97579	\N
115883	GENERIC_DAY	3	4	2010-03-11	90904	\N	97579	\N
115884	GENERIC_DAY	3	0	2010-03-06	90904	\N	97579	\N
115885	GENERIC_DAY	3	11	2010-03-03	90906	\N	97579	\N
115886	GENERIC_DAY	3	18	2010-02-27	90906	\N	97580	\N
115887	GENERIC_DAY	3	2	2010-02-25	90904	\N	97580	\N
115888	GENERIC_DAY	3	11	2010-02-20	90906	\N	97580	\N
115889	GENERIC_DAY	3	9	2010-02-22	90906	\N	97580	\N
115890	GENERIC_DAY	3	9	2010-02-19	90906	\N	97580	\N
115891	GENERIC_DAY	3	20	2010-02-26	90906	\N	97580	\N
115892	GENERIC_DAY	3	4	2010-02-19	90904	\N	97580	\N
115893	GENERIC_DAY	3	4	2010-02-20	90904	\N	97580	\N
115894	GENERIC_DAY	3	3	2010-02-26	90904	\N	97580	\N
115895	GENERIC_DAY	3	2	2010-02-18	90904	\N	97580	\N
115896	GENERIC_DAY	3	1	2010-02-17	90904	\N	97580	\N
115897	GENERIC_DAY	3	3	2010-02-22	90904	\N	97580	\N
115898	GENERIC_DAY	3	3	2010-02-21	90904	\N	97580	\N
115899	GENERIC_DAY	3	7	2010-02-27	90904	\N	97580	\N
115900	GENERIC_DAY	3	4	2010-02-23	90904	\N	97580	\N
115901	GENERIC_DAY	3	9	2010-02-21	90906	\N	97580	\N
115902	GENERIC_DAY	3	16	2010-02-24	90906	\N	97580	\N
115903	GENERIC_DAY	3	6	2010-02-18	90906	\N	97580	\N
115904	GENERIC_DAY	3	19	2010-02-25	90906	\N	97580	\N
115905	GENERIC_DAY	3	10	2010-02-23	90906	\N	97580	\N
352696	GENERIC_DAY	3	3	2010-07-12	139482	\N	148714	\N
352724	GENERIC_DAY	3	3	2010-08-05	139486	\N	148714	\N
330097	GENERIC_DAY	5	0	2010-09-19	139486	\N	200656	\N
330210	GENERIC_DAY	5	2	2010-08-11	139486	\N	200656	\N
330179	GENERIC_DAY	5	0	2010-09-25	139486	\N	200656	\N
330078	GENERIC_DAY	5	0	2010-09-04	139484	\N	200656	\N
330004	GENERIC_DAY	5	0	2010-08-15	139484	\N	200656	\N
330067	GENERIC_DAY	5	0	2010-08-22	139484	\N	200656	\N
330198	GENERIC_DAY	5	0	2010-09-24	139484	\N	200656	\N
330192	GENERIC_DAY	5	0	2010-08-08	139482	\N	200656	\N
330206	GENERIC_DAY	5	2	2010-09-03	139482	\N	200656	\N
329975	GENERIC_DAY	5	2	2010-10-19	139486	\N	200656	\N
330018	GENERIC_DAY	5	1	2010-08-23	139486	\N	200656	\N
329965	GENERIC_DAY	5	2	2010-09-09	139486	\N	200656	\N
329974	GENERIC_DAY	5	1	2010-07-27	139484	\N	200656	\N
330014	GENERIC_DAY	5	2	2010-08-13	139486	\N	200656	\N
330030	GENERIC_DAY	5	2	2010-10-06	139482	\N	200656	\N
330082	GENERIC_DAY	5	1	2010-09-16	139484	\N	200656	\N
330136	GENERIC_DAY	5	1	2010-08-18	139486	\N	200656	\N
330187	GENERIC_DAY	5	0	2010-08-02	139484	\N	200656	\N
330012	GENERIC_DAY	5	1	2010-09-16	139482	\N	200656	\N
330121	GENERIC_DAY	5	2	2010-08-12	139486	\N	200656	\N
329968	GENERIC_DAY	5	1	2010-08-27	139484	\N	200656	\N
330169	GENERIC_DAY	5	2	2010-09-22	139486	\N	200656	\N
330129	GENERIC_DAY	5	2	2010-09-10	139486	\N	200656	\N
330091	GENERIC_DAY	5	0	2010-08-29	139482	\N	200656	\N
330098	GENERIC_DAY	5	1	2010-09-17	139486	\N	200656	\N
330191	GENERIC_DAY	5	0	2010-08-15	139486	\N	200656	\N
329984	GENERIC_DAY	5	2	2010-07-30	139482	\N	200656	\N
330045	GENERIC_DAY	5	2	2010-08-19	139482	\N	200656	\N
330108	GENERIC_DAY	5	0	2010-09-04	139482	\N	200656	\N
329982	GENERIC_DAY	5	0	2010-10-08	139484	\N	200656	\N
115906	GENERIC_DAY	3	1	2010-02-28	90904	\N	97581	\N
115907	GENERIC_DAY	3	13	2010-03-14	90906	\N	97581	\N
115908	GENERIC_DAY	3	8	2010-03-07	90906	\N	97581	\N
115909	GENERIC_DAY	3	13	2010-03-13	90906	\N	97581	\N
115910	GENERIC_DAY	3	5	2010-03-13	90904	\N	97581	\N
115911	GENERIC_DAY	3	4	2010-03-12	90904	\N	97581	\N
115912	GENERIC_DAY	3	11	2010-03-10	90906	\N	97581	\N
115913	GENERIC_DAY	3	3	2010-03-05	90904	\N	97581	\N
115914	GENERIC_DAY	3	12	2010-03-12	90906	\N	97581	\N
115915	GENERIC_DAY	3	9	2010-03-08	90906	\N	97581	\N
115916	GENERIC_DAY	3	7	2010-03-05	90906	\N	97581	\N
115917	GENERIC_DAY	3	3	2010-03-02	90906	\N	97581	\N
115918	GENERIC_DAY	3	4	2010-03-03	90906	\N	97581	\N
115919	GENERIC_DAY	3	3	2010-03-06	90904	\N	97581	\N
115920	GENERIC_DAY	3	4	2010-03-11	90904	\N	97581	\N
115921	GENERIC_DAY	3	1	2010-03-01	90906	\N	97581	\N
115922	GENERIC_DAY	3	2	2010-03-03	90904	\N	97581	\N
115923	GENERIC_DAY	3	12	2010-03-11	90906	\N	97581	\N
115924	GENERIC_DAY	3	4	2010-03-10	90904	\N	97581	\N
115925	GENERIC_DAY	3	3	2010-03-07	90904	\N	97581	\N
115926	GENERIC_DAY	3	2	2010-03-02	90904	\N	97581	\N
115927	GENERIC_DAY	3	5	2010-03-14	90904	\N	97581	\N
115928	GENERIC_DAY	3	2	2010-03-04	90904	\N	97581	\N
115929	GENERIC_DAY	3	6	2010-03-04	90906	\N	97581	\N
115930	GENERIC_DAY	3	9	2010-03-09	90906	\N	97581	\N
115931	GENERIC_DAY	3	4	2010-03-09	90904	\N	97581	\N
115932	GENERIC_DAY	3	1	2010-03-01	90904	\N	97581	\N
115933	GENERIC_DAY	3	6	2010-03-06	90906	\N	97581	\N
115934	GENERIC_DAY	3	3	2010-03-08	90904	\N	97581	\N
87121	SPECIFIC_DAY	1	8	2010-02-12	1220	86458	\N	\N
87118	SPECIFIC_DAY	1	8	2010-02-22	1220	86458	\N	\N
87138	SPECIFIC_DAY	1	0	2010-03-20	1220	86458	\N	\N
87115	SPECIFIC_DAY	1	8	2010-03-12	1220	86458	\N	\N
87124	SPECIFIC_DAY	1	8	2010-03-16	1220	86458	\N	\N
87131	SPECIFIC_DAY	1	0	2010-02-13	1220	86458	\N	\N
87120	SPECIFIC_DAY	1	8	2010-02-26	1220	86458	\N	\N
87107	SPECIFIC_DAY	1	8	2010-03-04	1220	86458	\N	\N
87149	SPECIFIC_DAY	1	8	2010-03-15	1220	86458	\N	\N
87106	SPECIFIC_DAY	1	8	2010-02-19	1220	86458	\N	\N
87123	SPECIFIC_DAY	1	0	2010-03-28	1220	86458	\N	\N
87113	SPECIFIC_DAY	1	8	2010-02-24	1220	86458	\N	\N
87145	SPECIFIC_DAY	1	0	2010-02-27	1220	86458	\N	\N
87143	SPECIFIC_DAY	1	0	2010-02-14	1220	86458	\N	\N
87110	SPECIFIC_DAY	1	8	2010-02-16	1220	86458	\N	\N
87108	SPECIFIC_DAY	1	8	2010-02-18	1220	86458	\N	\N
87111	SPECIFIC_DAY	1	0	2010-02-28	1220	86458	\N	\N
87103	SPECIFIC_DAY	1	8	2010-03-03	1220	86458	\N	\N
87119	SPECIFIC_DAY	1	8	2010-02-25	1220	86458	\N	\N
87128	SPECIFIC_DAY	1	8	2010-03-17	1220	86458	\N	\N
87146	SPECIFIC_DAY	1	0	2010-03-19	1220	86458	\N	\N
87139	SPECIFIC_DAY	1	8	2010-03-30	1220	86458	\N	\N
87104	SPECIFIC_DAY	1	8	2010-03-01	1220	86458	\N	\N
87140	SPECIFIC_DAY	1	8	2010-03-09	1220	86458	\N	\N
87129	SPECIFIC_DAY	1	8	2010-02-15	1220	86458	\N	\N
87125	SPECIFIC_DAY	1	8	2010-03-02	1220	86458	\N	\N
87148	SPECIFIC_DAY	1	8	2010-03-23	1220	86458	\N	\N
87127	SPECIFIC_DAY	1	8	2010-03-29	1220	86458	\N	\N
87147	SPECIFIC_DAY	1	0	2010-03-07	1220	86458	\N	\N
87132	SPECIFIC_DAY	1	8	2010-03-25	1220	86458	\N	\N
87126	SPECIFIC_DAY	1	8	2010-03-10	1220	86458	\N	\N
87109	SPECIFIC_DAY	1	0	2010-03-21	1220	86458	\N	\N
87117	SPECIFIC_DAY	1	8	2010-03-05	1220	86458	\N	\N
87116	SPECIFIC_DAY	1	0	2010-02-21	1220	86458	\N	\N
87142	SPECIFIC_DAY	1	8	2010-02-23	1220	86458	\N	\N
87130	SPECIFIC_DAY	1	0	2010-03-27	1220	86458	\N	\N
329999	GENERIC_DAY	5	1	2010-08-31	139484	\N	200656	\N
330088	GENERIC_DAY	5	1	2010-09-03	139486	\N	200656	\N
330171	GENERIC_DAY	5	2	2010-10-20	139486	\N	200656	\N
330111	GENERIC_DAY	5	0	2010-09-25	139484	\N	200656	\N
330181	GENERIC_DAY	5	1	2010-10-18	139482	\N	200656	\N
330048	GENERIC_DAY	5	1	2010-08-17	139486	\N	200656	\N
330177	GENERIC_DAY	5	2	2010-09-20	139486	\N	200656	\N
330079	GENERIC_DAY	5	0	2010-08-22	139486	\N	200656	\N
330152	GENERIC_DAY	5	3	2010-08-24	139482	\N	200656	\N
330158	GENERIC_DAY	5	1	2010-08-13	139482	\N	200656	\N
330010	GENERIC_DAY	5	2	2010-10-18	139486	\N	200656	\N
330106	GENERIC_DAY	5	0	2010-08-08	139484	\N	200656	\N
330070	GENERIC_DAY	5	2	2010-10-01	139486	\N	200656	\N
330214	GENERIC_DAY	5	1	2010-09-01	139486	\N	200656	\N
330164	GENERIC_DAY	5	1	2010-10-15	139482	\N	200656	\N
330038	GENERIC_DAY	5	0	2010-09-28	139484	\N	200656	\N
330064	GENERIC_DAY	5	1	2010-09-06	139486	\N	200656	\N
330207	GENERIC_DAY	5	0	2010-10-02	139484	\N	200656	\N
330138	GENERIC_DAY	5	0	2010-08-10	139484	\N	200656	\N
330019	GENERIC_DAY	5	2	2010-10-11	139486	\N	200656	\N
330202	GENERIC_DAY	5	0	2010-10-16	139486	\N	200656	\N
330132	GENERIC_DAY	5	0	2010-10-02	139482	\N	200656	\N
330083	GENERIC_DAY	5	2	2010-10-01	139482	\N	200656	\N
330008	GENERIC_DAY	5	2	2010-08-31	139482	\N	200656	\N
330096	GENERIC_DAY	5	1	2010-09-13	139482	\N	200656	\N
329989	GENERIC_DAY	5	2	2010-09-27	139486	\N	200656	\N
330140	GENERIC_DAY	5	2	2010-07-29	139486	\N	200656	\N
330102	GENERIC_DAY	5	1	2010-09-09	139484	\N	200656	\N
330027	GENERIC_DAY	5	3	2010-08-26	139482	\N	200656	\N
329978	GENERIC_DAY	5	2	2010-09-16	139486	\N	200656	\N
330020	GENERIC_DAY	5	0	2010-08-07	139484	\N	200656	\N
330035	GENERIC_DAY	5	0	2010-08-20	139484	\N	200656	\N
329981	GENERIC_DAY	5	0	2010-10-17	139486	\N	200656	\N
330049	GENERIC_DAY	5	0	2010-09-26	139484	\N	200656	\N
139050	GENERIC_DAY	0	0	2010-04-18	134533	\N	136058	\N
139051	GENERIC_DAY	0	0	2010-04-03	134537	\N	136058	\N
139052	GENERIC_DAY	0	3	2010-04-12	134533	\N	136058	\N
139053	GENERIC_DAY	0	3	2010-04-13	134535	\N	136058	\N
139054	GENERIC_DAY	0	3	2010-04-08	134533	\N	136058	\N
139055	GENERIC_DAY	0	3	2010-04-16	134533	\N	136058	\N
139056	GENERIC_DAY	0	3	2010-03-30	134533	\N	136058	\N
139057	GENERIC_DAY	0	0	2010-03-27	134533	\N	136058	\N
139058	GENERIC_DAY	0	4	2010-04-22	134535	\N	136058	\N
139059	GENERIC_DAY	0	3	2010-04-07	134535	\N	136058	\N
139060	GENERIC_DAY	0	0	2010-04-18	134537	\N	136058	\N
139061	GENERIC_DAY	0	4	2010-04-22	134533	\N	136058	\N
139062	GENERIC_DAY	0	2	2010-04-08	134537	\N	136058	\N
139063	GENERIC_DAY	0	3	2010-03-29	134535	\N	136058	\N
139064	GENERIC_DAY	0	0	2010-04-18	134535	\N	136058	\N
139065	GENERIC_DAY	0	3	2010-04-21	134533	\N	136058	\N
139066	GENERIC_DAY	0	0	2010-04-10	134535	\N	136058	\N
139067	GENERIC_DAY	0	0	2010-04-04	134535	\N	136058	\N
139068	GENERIC_DAY	0	3	2010-04-14	134535	\N	136058	\N
139069	GENERIC_DAY	0	3	2010-04-14	134533	\N	136058	\N
139070	GENERIC_DAY	0	3	2010-04-08	134535	\N	136058	\N
139071	GENERIC_DAY	0	0	2010-04-02	134533	\N	136058	\N
139072	GENERIC_DAY	0	3	2010-04-05	134535	\N	136058	\N
139073	GENERIC_DAY	0	3	2010-04-12	134535	\N	136058	\N
139074	GENERIC_DAY	0	3	2010-04-13	134533	\N	136058	\N
139075	GENERIC_DAY	0	2	2010-04-21	134537	\N	136058	\N
139076	GENERIC_DAY	0	3	2010-04-16	134535	\N	136058	\N
139077	GENERIC_DAY	0	4	2010-04-23	134533	\N	136058	\N
139078	GENERIC_DAY	0	0	2010-04-17	134535	\N	136058	\N
139079	GENERIC_DAY	0	3	2010-04-09	134535	\N	136058	\N
139080	GENERIC_DAY	0	0	2010-04-04	134537	\N	136058	\N
139081	GENERIC_DAY	0	0	2010-03-27	134535	\N	136058	\N
139082	GENERIC_DAY	0	0	2010-04-17	134533	\N	136058	\N
139083	GENERIC_DAY	0	0	2010-04-10	134533	\N	136058	\N
139084	GENERIC_DAY	0	8	2010-04-26	134533	\N	136058	\N
139085	GENERIC_DAY	0	0	2010-04-11	134537	\N	136058	\N
139086	GENERIC_DAY	0	2	2010-04-14	134537	\N	136058	\N
139087	GENERIC_DAY	0	0	2010-03-28	134535	\N	136058	\N
139088	GENERIC_DAY	0	2	2010-03-30	134537	\N	136058	\N
139089	GENERIC_DAY	0	0	2010-04-11	134535	\N	136058	\N
139090	GENERIC_DAY	0	3	2010-04-20	134533	\N	136058	\N
139091	GENERIC_DAY	0	0	2010-04-25	134533	\N	136058	\N
139092	GENERIC_DAY	0	2	2010-04-20	134537	\N	136058	\N
139093	GENERIC_DAY	0	8	2010-04-27	134533	\N	136058	\N
139094	GENERIC_DAY	0	2	2010-04-16	134537	\N	136058	\N
139095	GENERIC_DAY	0	2	2010-03-31	134537	\N	136058	\N
139096	GENERIC_DAY	0	2	2010-04-05	134537	\N	136058	\N
139097	GENERIC_DAY	0	3	2010-04-21	134535	\N	136058	\N
139098	GENERIC_DAY	0	3	2010-04-19	134533	\N	136058	\N
139099	GENERIC_DAY	0	3	2010-04-19	134535	\N	136058	\N
139100	GENERIC_DAY	0	0	2010-04-11	134533	\N	136058	\N
139101	GENERIC_DAY	0	2	2010-04-13	134537	\N	136058	\N
139102	GENERIC_DAY	0	2	2010-04-19	134537	\N	136058	\N
139103	GENERIC_DAY	0	2	2010-04-12	134537	\N	136058	\N
139104	GENERIC_DAY	0	3	2010-04-06	134533	\N	136058	\N
139105	GENERIC_DAY	0	0	2010-03-27	134537	\N	136058	\N
139106	GENERIC_DAY	0	0	2010-03-28	134537	\N	136058	\N
139107	GENERIC_DAY	0	0	2010-04-17	134537	\N	136058	\N
139108	GENERIC_DAY	0	0	2010-04-03	134535	\N	136058	\N
139109	GENERIC_DAY	0	3	2010-04-15	134535	\N	136058	\N
139110	GENERIC_DAY	0	0	2010-04-02	134537	\N	136058	\N
139111	GENERIC_DAY	0	3	2010-04-06	134535	\N	136058	\N
139112	GENERIC_DAY	0	2	2010-03-29	134537	\N	136058	\N
139113	GENERIC_DAY	0	3	2010-04-05	134533	\N	136058	\N
139114	GENERIC_DAY	0	3	2010-04-09	134533	\N	136058	\N
139115	GENERIC_DAY	0	0	2010-04-04	134533	\N	136058	\N
139116	GENERIC_DAY	0	0	2010-04-02	134535	\N	136058	\N
139117	GENERIC_DAY	0	0	2010-04-24	134533	\N	136058	\N
139118	GENERIC_DAY	0	3	2010-04-20	134535	\N	136058	\N
139119	GENERIC_DAY	0	2	2010-04-06	134537	\N	136058	\N
139120	GENERIC_DAY	0	4	2010-04-23	134535	\N	136058	\N
139121	GENERIC_DAY	0	3	2010-03-30	134535	\N	136058	\N
139122	GENERIC_DAY	0	0	2010-04-01	134537	\N	136058	\N
139123	GENERIC_DAY	0	3	2010-04-07	134533	\N	136058	\N
139124	GENERIC_DAY	0	2	2010-04-15	134537	\N	136058	\N
139125	GENERIC_DAY	0	2	2010-04-09	134537	\N	136058	\N
139126	GENERIC_DAY	0	3	2010-03-31	134535	\N	136058	\N
139127	GENERIC_DAY	0	2	2010-04-07	134537	\N	136058	\N
139128	GENERIC_DAY	0	0	2010-04-01	134533	\N	136058	\N
139129	GENERIC_DAY	0	3	2010-03-31	134533	\N	136058	\N
139130	GENERIC_DAY	0	0	2010-04-03	134533	\N	136058	\N
139131	GENERIC_DAY	0	0	2010-03-28	134533	\N	136058	\N
139132	GENERIC_DAY	0	3	2010-03-29	134533	\N	136058	\N
139133	GENERIC_DAY	0	0	2010-04-01	134535	\N	136058	\N
139134	GENERIC_DAY	0	0	2010-04-10	134537	\N	136058	\N
139135	GENERIC_DAY	0	3	2010-04-15	134533	\N	136058	\N
139136	GENERIC_DAY	0	2	2010-04-08	134535	\N	136057	\N
139137	GENERIC_DAY	0	3	2010-04-16	134537	\N	136057	\N
139138	GENERIC_DAY	0	0	2010-04-24	134533	\N	136057	\N
139139	GENERIC_DAY	0	0	2010-04-02	134537	\N	136057	\N
139140	GENERIC_DAY	0	2	2010-04-19	134535	\N	136057	\N
139141	GENERIC_DAY	0	3	2010-04-15	134537	\N	136057	\N
139142	GENERIC_DAY	0	2	2010-04-21	134535	\N	136057	\N
139143	GENERIC_DAY	0	3	2010-04-16	134533	\N	136057	\N
139144	GENERIC_DAY	0	0	2010-04-11	134535	\N	136057	\N
139145	GENERIC_DAY	0	3	2010-04-13	134533	\N	136057	\N
139146	GENERIC_DAY	0	3	2010-04-23	134535	\N	136057	\N
139147	GENERIC_DAY	0	3	2010-04-06	134537	\N	136057	\N
139148	GENERIC_DAY	0	0	2010-04-10	134535	\N	136057	\N
139149	GENERIC_DAY	0	0	2010-03-28	134535	\N	136057	\N
139150	GENERIC_DAY	0	0	2010-04-01	134535	\N	136057	\N
139151	GENERIC_DAY	0	2	2010-04-13	134535	\N	136057	\N
139152	GENERIC_DAY	0	0	2010-04-10	134533	\N	136057	\N
139153	GENERIC_DAY	0	2	2010-03-30	134535	\N	136057	\N
139154	GENERIC_DAY	0	3	2010-04-20	134533	\N	136057	\N
139155	GENERIC_DAY	0	2	2010-04-09	134535	\N	136057	\N
139156	GENERIC_DAY	0	0	2010-04-18	134533	\N	136057	\N
139157	GENERIC_DAY	0	3	2010-04-19	134533	\N	136057	\N
139158	GENERIC_DAY	0	3	2010-04-06	134533	\N	136057	\N
139159	GENERIC_DAY	0	3	2010-04-08	134533	\N	136057	\N
139160	GENERIC_DAY	0	0	2010-04-11	134537	\N	136057	\N
139161	GENERIC_DAY	0	0	2010-03-28	134533	\N	136057	\N
139162	GENERIC_DAY	0	2	2010-04-20	134535	\N	136057	\N
139163	GENERIC_DAY	0	0	2010-04-04	134535	\N	136057	\N
139164	GENERIC_DAY	0	3	2010-04-05	134533	\N	136057	\N
139165	GENERIC_DAY	0	0	2010-03-27	134535	\N	136057	\N
139166	GENERIC_DAY	0	2	2010-03-29	134535	\N	136057	\N
139167	GENERIC_DAY	0	2	2010-04-06	134535	\N	136057	\N
139168	GENERIC_DAY	0	0	2010-04-10	134537	\N	136057	\N
139169	GENERIC_DAY	0	8	2010-04-27	134533	\N	136057	\N
139170	GENERIC_DAY	0	0	2010-04-04	134537	\N	136057	\N
139171	GENERIC_DAY	0	0	2010-04-25	134533	\N	136057	\N
139172	GENERIC_DAY	0	2	2010-04-07	134535	\N	136057	\N
139173	GENERIC_DAY	0	8	2010-04-26	134533	\N	136057	\N
139174	GENERIC_DAY	0	0	2010-04-04	134533	\N	136057	\N
139175	GENERIC_DAY	0	0	2010-04-17	134537	\N	136057	\N
139176	GENERIC_DAY	0	3	2010-04-20	134537	\N	136057	\N
139177	GENERIC_DAY	0	0	2010-04-18	134537	\N	136057	\N
139178	GENERIC_DAY	0	3	2010-03-29	134533	\N	136057	\N
139179	GENERIC_DAY	0	3	2010-03-31	134533	\N	136057	\N
139180	GENERIC_DAY	0	3	2010-03-31	134537	\N	136057	\N
139181	GENERIC_DAY	0	0	2010-03-28	134537	\N	136057	\N
139182	GENERIC_DAY	0	3	2010-03-30	134537	\N	136057	\N
139183	GENERIC_DAY	0	3	2010-03-29	134537	\N	136057	\N
139184	GENERIC_DAY	0	3	2010-04-07	134537	\N	136057	\N
139185	GENERIC_DAY	0	3	2010-04-22	134535	\N	136057	\N
139186	GENERIC_DAY	0	3	2010-04-12	134537	\N	136057	\N
139187	GENERIC_DAY	0	0	2010-04-03	134535	\N	136057	\N
139188	GENERIC_DAY	0	0	2010-04-18	134535	\N	136057	\N
139189	GENERIC_DAY	0	2	2010-03-31	134535	\N	136057	\N
139190	GENERIC_DAY	0	2	2010-04-14	134535	\N	136057	\N
139191	GENERIC_DAY	0	0	2010-04-11	134533	\N	136057	\N
139192	GENERIC_DAY	0	3	2010-04-09	134533	\N	136057	\N
139193	GENERIC_DAY	0	3	2010-04-09	134537	\N	136057	\N
139194	GENERIC_DAY	0	3	2010-04-14	134537	\N	136057	\N
139195	GENERIC_DAY	0	2	2010-04-12	134535	\N	136057	\N
139196	GENERIC_DAY	0	3	2010-04-13	134537	\N	136057	\N
139197	GENERIC_DAY	0	0	2010-04-03	134533	\N	136057	\N
139198	GENERIC_DAY	0	0	2010-04-17	134533	\N	136057	\N
139199	GENERIC_DAY	0	2	2010-04-15	134535	\N	136057	\N
139200	GENERIC_DAY	0	3	2010-03-30	134533	\N	136057	\N
139201	GENERIC_DAY	0	0	2010-04-02	134533	\N	136057	\N
139202	GENERIC_DAY	0	3	2010-04-21	134533	\N	136057	\N
139203	GENERIC_DAY	0	0	2010-04-01	134537	\N	136057	\N
139204	GENERIC_DAY	0	0	2010-04-17	134535	\N	136057	\N
139205	GENERIC_DAY	0	3	2010-04-12	134533	\N	136057	\N
139206	GENERIC_DAY	0	3	2010-04-21	134537	\N	136057	\N
139207	GENERIC_DAY	0	2	2010-04-05	134535	\N	136057	\N
139208	GENERIC_DAY	0	5	2010-04-23	134533	\N	136057	\N
139209	GENERIC_DAY	0	3	2010-04-07	134533	\N	136057	\N
139210	GENERIC_DAY	0	0	2010-04-03	134537	\N	136057	\N
139211	GENERIC_DAY	0	0	2010-03-27	134533	\N	136057	\N
139212	GENERIC_DAY	0	0	2010-03-27	134537	\N	136057	\N
139213	GENERIC_DAY	0	3	2010-04-15	134533	\N	136057	\N
139214	GENERIC_DAY	0	0	2010-04-02	134535	\N	136057	\N
139215	GENERIC_DAY	0	0	2010-04-01	134533	\N	136057	\N
139216	GENERIC_DAY	0	3	2010-04-14	134533	\N	136057	\N
139217	GENERIC_DAY	0	3	2010-04-19	134537	\N	136057	\N
139218	GENERIC_DAY	0	3	2010-04-05	134537	\N	136057	\N
139219	GENERIC_DAY	0	5	2010-04-22	134533	\N	136057	\N
139220	GENERIC_DAY	0	3	2010-04-08	134537	\N	136057	\N
139221	GENERIC_DAY	0	2	2010-04-16	134535	\N	136057	\N
139222	GENERIC_DAY	0	8	2010-03-23	134537	\N	135746	\N
139223	GENERIC_DAY	0	2	2010-03-26	134537	\N	135746	\N
139224	GENERIC_DAY	0	0	2010-03-19	134537	\N	135746	\N
139225	GENERIC_DAY	0	8	2010-03-15	134537	\N	135746	\N
139226	GENERIC_DAY	0	0	2010-02-28	134537	\N	135746	\N
139227	GENERIC_DAY	0	0	2010-03-13	134537	\N	135746	\N
139228	GENERIC_DAY	0	8	2010-03-11	134537	\N	135746	\N
139229	GENERIC_DAY	0	8	2010-03-10	134537	\N	135746	\N
139230	GENERIC_DAY	0	3	2010-03-26	134533	\N	135746	\N
139231	GENERIC_DAY	0	8	2010-03-05	134537	\N	135746	\N
139232	GENERIC_DAY	0	8	2010-03-03	134537	\N	135746	\N
139233	GENERIC_DAY	0	0	2010-03-21	134537	\N	135746	\N
139234	GENERIC_DAY	0	8	2010-03-12	134537	\N	135746	\N
139235	GENERIC_DAY	0	8	2010-02-26	134537	\N	135746	\N
139236	GENERIC_DAY	0	3	2010-03-25	134535	\N	135746	\N
139237	GENERIC_DAY	0	8	2010-03-09	134537	\N	135746	\N
139238	GENERIC_DAY	0	3	2010-03-26	134535	\N	135746	\N
139239	GENERIC_DAY	0	3	2010-03-25	134533	\N	135746	\N
139240	GENERIC_DAY	0	0	2010-03-07	134537	\N	135746	\N
139241	GENERIC_DAY	0	8	2010-03-01	134537	\N	135746	\N
139242	GENERIC_DAY	0	0	2010-03-06	134537	\N	135746	\N
139243	GENERIC_DAY	0	8	2010-03-02	134537	\N	135746	\N
139244	GENERIC_DAY	0	8	2010-03-04	134537	\N	135746	\N
139245	GENERIC_DAY	0	8	2010-03-18	134537	\N	135746	\N
139246	GENERIC_DAY	0	0	2010-03-14	134537	\N	135746	\N
139247	GENERIC_DAY	0	8	2010-03-22	134537	\N	135746	\N
139248	GENERIC_DAY	0	8	2010-03-17	134537	\N	135746	\N
139249	GENERIC_DAY	0	0	2010-02-27	134537	\N	135746	\N
139250	GENERIC_DAY	0	8	2010-03-16	134537	\N	135746	\N
139251	GENERIC_DAY	0	2	2010-03-25	134537	\N	135746	\N
139252	GENERIC_DAY	0	8	2010-03-08	134537	\N	135746	\N
139253	GENERIC_DAY	0	0	2010-03-20	134537	\N	135746	\N
139254	GENERIC_DAY	0	8	2010-03-24	134537	\N	135746	\N
139255	GENERIC_DAY	0	8	2010-05-11	134533	\N	136062	\N
139256	GENERIC_DAY	0	8	2010-05-05	134533	\N	136062	\N
139257	GENERIC_DAY	0	0	2010-05-17	134533	\N	136062	\N
139258	GENERIC_DAY	0	8	2010-05-04	134533	\N	136062	\N
139259	GENERIC_DAY	0	8	2010-05-12	134533	\N	136062	\N
139260	GENERIC_DAY	0	8	2010-05-07	134533	\N	136062	\N
139261	GENERIC_DAY	0	0	2010-05-08	134533	\N	136062	\N
139262	GENERIC_DAY	0	8	2010-05-13	134533	\N	136062	\N
139263	GENERIC_DAY	0	8	2010-05-21	134533	\N	136062	\N
139264	GENERIC_DAY	0	0	2010-05-09	134533	\N	136062	\N
139265	GENERIC_DAY	0	0	2010-05-23	134533	\N	136062	\N
139266	GENERIC_DAY	0	0	2010-05-16	134533	\N	136062	\N
139267	GENERIC_DAY	0	0	2010-05-01	134533	\N	136062	\N
139268	GENERIC_DAY	0	8	2010-04-30	134533	\N	136062	\N
139269	GENERIC_DAY	0	8	2010-05-10	134533	\N	136062	\N
139270	GENERIC_DAY	0	8	2010-05-25	134533	\N	136062	\N
139271	GENERIC_DAY	0	8	2010-05-19	134533	\N	136062	\N
139272	GENERIC_DAY	0	8	2010-05-14	134533	\N	136062	\N
139273	GENERIC_DAY	0	8	2010-05-06	134533	\N	136062	\N
139274	GENERIC_DAY	0	8	2010-05-20	134533	\N	136062	\N
139275	GENERIC_DAY	0	8	2010-04-29	134533	\N	136062	\N
139276	GENERIC_DAY	0	8	2010-05-03	134533	\N	136062	\N
139277	GENERIC_DAY	0	8	2010-05-24	134533	\N	136062	\N
139278	GENERIC_DAY	0	0	2010-05-22	134533	\N	136062	\N
139279	GENERIC_DAY	0	8	2010-04-28	134533	\N	136062	\N
139280	GENERIC_DAY	0	0	2010-05-02	134533	\N	136062	\N
139281	GENERIC_DAY	0	8	2010-05-18	134533	\N	136062	\N
139282	GENERIC_DAY	0	8	2010-05-26	134533	\N	136062	\N
139283	GENERIC_DAY	0	0	2010-05-15	134533	\N	136062	\N
139284	GENERIC_DAY	0	3	2010-04-05	134537	\N	136056	\N
139285	GENERIC_DAY	0	0	2010-04-11	134535	\N	136056	\N
139286	GENERIC_DAY	0	0	2010-04-01	134537	\N	136056	\N
139287	GENERIC_DAY	0	0	2010-04-11	134537	\N	136056	\N
139288	GENERIC_DAY	0	0	2010-04-18	134537	\N	136056	\N
139289	GENERIC_DAY	0	0	2010-04-17	134533	\N	136056	\N
139290	GENERIC_DAY	0	5	2010-04-23	134535	\N	136056	\N
139291	GENERIC_DAY	0	3	2010-03-31	134535	\N	136056	\N
139292	GENERIC_DAY	0	0	2010-04-18	134533	\N	136056	\N
139293	GENERIC_DAY	0	3	2010-04-20	134537	\N	136056	\N
139294	GENERIC_DAY	0	3	2010-03-30	134535	\N	136056	\N
139295	GENERIC_DAY	0	2	2010-04-16	134533	\N	136056	\N
139296	GENERIC_DAY	0	3	2010-04-16	134537	\N	136056	\N
139297	GENERIC_DAY	0	0	2010-04-10	134533	\N	136056	\N
139298	GENERIC_DAY	0	2	2010-04-21	134533	\N	136056	\N
139299	GENERIC_DAY	0	0	2010-04-24	134533	\N	136056	\N
139300	GENERIC_DAY	0	2	2010-04-14	134533	\N	136056	\N
139301	GENERIC_DAY	0	0	2010-03-27	134533	\N	136056	\N
139302	GENERIC_DAY	0	2	2010-03-29	134533	\N	136056	\N
139303	GENERIC_DAY	0	3	2010-04-14	134535	\N	136056	\N
139304	GENERIC_DAY	0	0	2010-04-10	134535	\N	136056	\N
139305	GENERIC_DAY	0	0	2010-04-03	134537	\N	136056	\N
139306	GENERIC_DAY	0	3	2010-04-15	134535	\N	136056	\N
139307	GENERIC_DAY	0	3	2010-03-29	134537	\N	136056	\N
139308	GENERIC_DAY	0	2	2010-04-07	134533	\N	136056	\N
139309	GENERIC_DAY	0	0	2010-04-25	134533	\N	136056	\N
139310	GENERIC_DAY	0	8	2010-04-27	134533	\N	136056	\N
139311	GENERIC_DAY	0	3	2010-03-29	134535	\N	136056	\N
139312	GENERIC_DAY	0	0	2010-03-27	134537	\N	136056	\N
139313	GENERIC_DAY	0	0	2010-04-04	134533	\N	136056	\N
139314	GENERIC_DAY	0	3	2010-04-14	134537	\N	136056	\N
139315	GENERIC_DAY	0	3	2010-04-23	134533	\N	136056	\N
139316	GENERIC_DAY	0	0	2010-04-04	134535	\N	136056	\N
139317	GENERIC_DAY	0	0	2010-04-10	134537	\N	136056	\N
139318	GENERIC_DAY	0	3	2010-04-21	134535	\N	136056	\N
139319	GENERIC_DAY	0	0	2010-04-04	134537	\N	136056	\N
139320	GENERIC_DAY	0	0	2010-04-03	134533	\N	136056	\N
139321	GENERIC_DAY	0	0	2010-03-27	134535	\N	136056	\N
139322	GENERIC_DAY	0	0	2010-04-02	134533	\N	136056	\N
139323	GENERIC_DAY	0	3	2010-04-22	134533	\N	136056	\N
139324	GENERIC_DAY	0	2	2010-03-30	134533	\N	136056	\N
139325	GENERIC_DAY	0	2	2010-04-20	134533	\N	136056	\N
139326	GENERIC_DAY	0	0	2010-04-02	134535	\N	136056	\N
139327	GENERIC_DAY	0	3	2010-03-30	134537	\N	136056	\N
139328	GENERIC_DAY	0	0	2010-04-03	134535	\N	136056	\N
139329	GENERIC_DAY	0	0	2010-03-28	134537	\N	136056	\N
139330	GENERIC_DAY	0	2	2010-04-05	134533	\N	136056	\N
139331	GENERIC_DAY	0	3	2010-04-07	134537	\N	136056	\N
139332	GENERIC_DAY	0	3	2010-04-19	134535	\N	136056	\N
139333	GENERIC_DAY	0	5	2010-04-22	134535	\N	136056	\N
139334	GENERIC_DAY	0	3	2010-04-12	134537	\N	136056	\N
139335	GENERIC_DAY	0	3	2010-04-06	134535	\N	136056	\N
139336	GENERIC_DAY	0	3	2010-04-05	134535	\N	136056	\N
139337	GENERIC_DAY	0	0	2010-04-02	134537	\N	136056	\N
139338	GENERIC_DAY	0	0	2010-03-28	134535	\N	136056	\N
139339	GENERIC_DAY	0	0	2010-04-18	134535	\N	136056	\N
139340	GENERIC_DAY	0	2	2010-04-06	134533	\N	136056	\N
139341	GENERIC_DAY	0	3	2010-04-08	134537	\N	136056	\N
139342	GENERIC_DAY	0	3	2010-04-19	134537	\N	136056	\N
139343	GENERIC_DAY	0	2	2010-04-15	134533	\N	136056	\N
139344	GENERIC_DAY	0	3	2010-04-20	134535	\N	136056	\N
139345	GENERIC_DAY	0	0	2010-04-11	134533	\N	136056	\N
139346	GENERIC_DAY	0	2	2010-04-19	134533	\N	136056	\N
139347	GENERIC_DAY	0	3	2010-04-06	134537	\N	136056	\N
139348	GENERIC_DAY	0	3	2010-04-08	134535	\N	136056	\N
139349	GENERIC_DAY	0	2	2010-03-31	134533	\N	136056	\N
139350	GENERIC_DAY	0	3	2010-04-21	134537	\N	136056	\N
139351	GENERIC_DAY	0	0	2010-03-28	134533	\N	136056	\N
139352	GENERIC_DAY	0	3	2010-04-16	134535	\N	136056	\N
139353	GENERIC_DAY	0	3	2010-04-13	134535	\N	136056	\N
139354	GENERIC_DAY	0	3	2010-04-09	134537	\N	136056	\N
139355	GENERIC_DAY	0	3	2010-04-09	134535	\N	136056	\N
139356	GENERIC_DAY	0	2	2010-04-09	134533	\N	136056	\N
139357	GENERIC_DAY	0	0	2010-04-17	134537	\N	136056	\N
139358	GENERIC_DAY	0	8	2010-04-26	134533	\N	136056	\N
139359	GENERIC_DAY	0	0	2010-04-17	134535	\N	136056	\N
139360	GENERIC_DAY	0	2	2010-04-13	134533	\N	136056	\N
139361	GENERIC_DAY	0	3	2010-03-31	134537	\N	136056	\N
139362	GENERIC_DAY	0	2	2010-04-12	134533	\N	136056	\N
139363	GENERIC_DAY	0	3	2010-04-15	134537	\N	136056	\N
139364	GENERIC_DAY	0	3	2010-04-12	134535	\N	136056	\N
139365	GENERIC_DAY	0	2	2010-04-08	134533	\N	136056	\N
139366	GENERIC_DAY	0	3	2010-04-13	134537	\N	136056	\N
139367	GENERIC_DAY	0	0	2010-04-01	134533	\N	136056	\N
139368	GENERIC_DAY	0	3	2010-04-07	134535	\N	136056	\N
139369	GENERIC_DAY	0	0	2010-04-01	134535	\N	136056	\N
352923	GENERIC_DAY	3	0	2010-09-26	139486	\N	148716	\N
352902	GENERIC_DAY	3	0	2010-10-17	139484	\N	148716	\N
352881	GENERIC_DAY	3	4	2010-10-28	139486	\N	148716	\N
352889	GENERIC_DAY	3	0	2010-10-16	139482	\N	148716	\N
352904	GENERIC_DAY	3	0	2010-10-31	139484	\N	148716	\N
352951	GENERIC_DAY	3	3	2010-09-23	139482	\N	148716	\N
352845	GENERIC_DAY	3	3	2010-09-20	139486	\N	148716	\N
330642	SPECIFIC_DAY	5	1	2010-09-17	139484	146358	\N	\N
330680	SPECIFIC_DAY	5	1	2010-11-22	139484	146358	\N	\N
330583	SPECIFIC_DAY	5	2	2010-07-13	139484	146357	\N	\N
330505	SPECIFIC_DAY	5	2	2010-10-14	139484	146357	\N	\N
330539	SPECIFIC_DAY	5	2	2010-10-04	139484	146357	\N	\N
330593	SPECIFIC_DAY	5	2	2010-11-03	139484	146357	\N	\N
330566	SPECIFIC_DAY	5	2	2010-11-23	139484	146357	\N	\N
330541	SPECIFIC_DAY	5	2	2010-10-08	139484	146357	\N	\N
330510	SPECIFIC_DAY	5	2	2010-08-16	139484	146357	\N	\N
330543	SPECIFIC_DAY	5	2	2010-10-18	139484	146357	\N	\N
330616	SPECIFIC_DAY	5	2	2010-11-19	139484	146357	\N	\N
330514	SPECIFIC_DAY	5	2	2010-08-11	139484	146357	\N	\N
330486	SPECIFIC_DAY	5	2	2010-09-17	139484	146357	\N	\N
99555	GENERIC_DAY	0	0	2010-01-23	1228	\N	97567	\N
99556	GENERIC_DAY	0	2	2010-02-05	1220	\N	97567	\N
99557	GENERIC_DAY	0	4	2010-02-01	90901	\N	97567	\N
99558	GENERIC_DAY	0	0	2010-02-21	1230	\N	97567	\N
99559	GENERIC_DAY	0	2	2010-02-05	1217	\N	97567	\N
99560	GENERIC_DAY	0	2	2010-02-10	1228	\N	97567	\N
99561	GENERIC_DAY	0	3	2010-02-24	1217	\N	97567	\N
99562	GENERIC_DAY	0	4	2010-02-23	1217	\N	97567	\N
99563	GENERIC_DAY	0	5	2010-02-12	1228	\N	97567	\N
99564	GENERIC_DAY	0	0	2010-01-17	1228	\N	97567	\N
99565	GENERIC_DAY	0	2	2010-02-25	1217	\N	97567	\N
99566	GENERIC_DAY	0	7	2010-02-22	1217	\N	97567	\N
99567	GENERIC_DAY	0	0	2010-01-24	90901	\N	97567	\N
99568	GENERIC_DAY	0	3	2010-02-11	1228	\N	97567	\N
99569	GENERIC_DAY	0	0	2010-02-17	1230	\N	97567	\N
99570	GENERIC_DAY	0	2	2010-01-20	1220	\N	97567	\N
99571	GENERIC_DAY	0	0	2010-01-27	90901	\N	97567	\N
99572	GENERIC_DAY	0	3	2010-02-10	1230	\N	97567	\N
99573	GENERIC_DAY	0	0	2010-02-13	1228	\N	97567	\N
99574	GENERIC_DAY	0	5	2010-02-18	1228	\N	97567	\N
99575	GENERIC_DAY	0	0	2010-02-21	1220	\N	97567	\N
99576	GENERIC_DAY	0	6	2010-02-09	90901	\N	97567	\N
99577	GENERIC_DAY	0	3	2010-02-18	1217	\N	97567	\N
99578	GENERIC_DAY	0	3	2010-01-22	90901	\N	97567	\N
99579	GENERIC_DAY	0	4	2010-02-12	1230	\N	97567	\N
99580	GENERIC_DAY	0	1	2010-02-02	1230	\N	97567	\N
99581	GENERIC_DAY	0	5	2010-02-23	1228	\N	97567	\N
99582	GENERIC_DAY	0	0	2010-02-14	1217	\N	97567	\N
99583	GENERIC_DAY	0	3	2010-02-03	1230	\N	97567	\N
99584	GENERIC_DAY	0	4	2010-01-27	1220	\N	97567	\N
99585	GENERIC_DAY	0	0	2010-01-23	1217	\N	97567	\N
99586	GENERIC_DAY	0	0	2010-02-22	1228	\N	97567	\N
99587	GENERIC_DAY	0	3	2010-01-19	1230	\N	97567	\N
99588	GENERIC_DAY	0	2	2010-02-12	90901	\N	97567	\N
99589	GENERIC_DAY	0	2	2010-02-15	90901	\N	97567	\N
99590	GENERIC_DAY	0	1	2010-01-19	1217	\N	97567	\N
99591	GENERIC_DAY	0	0	2010-01-17	1230	\N	97567	\N
99592	GENERIC_DAY	0	2	2010-01-22	1228	\N	97567	\N
99593	GENERIC_DAY	0	2	2010-01-29	1217	\N	97567	\N
99594	GENERIC_DAY	0	0	2010-02-20	1230	\N	97567	\N
99595	GENERIC_DAY	0	3	2010-02-09	1230	\N	97567	\N
99596	GENERIC_DAY	0	4	2010-01-26	1230	\N	97567	\N
99597	GENERIC_DAY	0	0	2010-02-24	1220	\N	97567	\N
99598	GENERIC_DAY	0	0	2010-01-30	1220	\N	97567	\N
99599	GENERIC_DAY	0	4	2010-01-29	1228	\N	97567	\N
99600	GENERIC_DAY	0	4	2010-01-19	1220	\N	97567	\N
99601	GENERIC_DAY	0	3	2010-01-19	1228	\N	97567	\N
99602	GENERIC_DAY	0	5	2010-02-23	1230	\N	97567	\N
99603	GENERIC_DAY	0	5	2010-02-19	1228	\N	97567	\N
99604	GENERIC_DAY	0	0	2010-02-07	1217	\N	97567	\N
99605	GENERIC_DAY	0	0	2010-02-07	1228	\N	97567	\N
99606	GENERIC_DAY	0	0	2010-02-06	1220	\N	97567	\N
99607	GENERIC_DAY	0	3	2010-01-20	90901	\N	97567	\N
99608	GENERIC_DAY	0	0	2010-01-16	1217	\N	97567	\N
99609	GENERIC_DAY	0	3	2010-01-15	1228	\N	97567	\N
99610	GENERIC_DAY	0	4	2010-01-26	1228	\N	97567	\N
99611	GENERIC_DAY	0	0	2010-01-16	90901	\N	97567	\N
99612	GENERIC_DAY	0	0	2010-02-15	1220	\N	97567	\N
99613	GENERIC_DAY	0	5	2010-02-24	1228	\N	97567	\N
99614	GENERIC_DAY	0	6	2010-02-11	1230	\N	97567	\N
99615	GENERIC_DAY	0	0	2010-01-24	1228	\N	97567	\N
99616	GENERIC_DAY	0	0	2010-01-30	1230	\N	97567	\N
99617	GENERIC_DAY	0	0	2010-02-07	90901	\N	97567	\N
99618	GENERIC_DAY	0	2	2010-01-25	1228	\N	97567	\N
99619	GENERIC_DAY	0	3	2010-01-18	1230	\N	97567	\N
99620	GENERIC_DAY	0	0	2010-02-06	1230	\N	97567	\N
99621	GENERIC_DAY	0	0	2010-01-23	1220	\N	97567	\N
99622	GENERIC_DAY	0	0	2010-02-06	1217	\N	97567	\N
99623	GENERIC_DAY	0	4	2010-01-28	1228	\N	97567	\N
99624	GENERIC_DAY	0	2	2010-02-09	1220	\N	97567	\N
99625	GENERIC_DAY	0	3	2010-02-08	1230	\N	97567	\N
99626	GENERIC_DAY	0	0	2010-02-20	1217	\N	97567	\N
99627	GENERIC_DAY	0	0	2010-01-31	1217	\N	97567	\N
99628	GENERIC_DAY	0	0	2010-01-31	90901	\N	97567	\N
99629	GENERIC_DAY	0	0	2010-01-16	1228	\N	97567	\N
99630	GENERIC_DAY	0	3	2010-01-21	90901	\N	97567	\N
99631	GENERIC_DAY	0	7	2010-02-22	1230	\N	97567	\N
99632	GENERIC_DAY	0	3	2010-01-18	1228	\N	97567	\N
99633	GENERIC_DAY	0	0	2010-02-20	1228	\N	97567	\N
99634	GENERIC_DAY	0	2	2010-01-21	1217	\N	97567	\N
99635	GENERIC_DAY	0	4	2010-01-27	1228	\N	97567	\N
99636	GENERIC_DAY	0	6	2010-02-10	90901	\N	97567	\N
99637	GENERIC_DAY	0	4	2010-01-28	1220	\N	97567	\N
99638	GENERIC_DAY	0	2	2010-01-22	1217	\N	97567	\N
99639	GENERIC_DAY	0	2	2010-01-21	1228	\N	97567	\N
99640	GENERIC_DAY	0	3	2010-02-25	1228	\N	97567	\N
99641	GENERIC_DAY	0	2	2010-02-19	90901	\N	97567	\N
99642	GENERIC_DAY	0	0	2010-01-28	90901	\N	97567	\N
99643	GENERIC_DAY	0	3	2010-02-19	1217	\N	97567	\N
99644	GENERIC_DAY	0	2	2010-01-21	1220	\N	97567	\N
99645	GENERIC_DAY	0	0	2010-01-30	1217	\N	97567	\N
99646	GENERIC_DAY	0	5	2010-02-04	90901	\N	97567	\N
99647	GENERIC_DAY	0	2	2010-01-18	1217	\N	97567	\N
99648	GENERIC_DAY	0	0	2010-01-24	1230	\N	97567	\N
99649	GENERIC_DAY	0	0	2010-01-30	90901	\N	97567	\N
99650	GENERIC_DAY	0	2	2010-01-22	1220	\N	97567	\N
99651	GENERIC_DAY	0	2	2010-02-18	90901	\N	97567	\N
99652	GENERIC_DAY	0	2	2010-02-08	1228	\N	97567	\N
99653	GENERIC_DAY	0	2	2010-01-20	1217	\N	97567	\N
99654	GENERIC_DAY	0	2	2010-01-25	1220	\N	97567	\N
99655	GENERIC_DAY	0	0	2010-02-21	1228	\N	97567	\N
99656	GENERIC_DAY	0	4	2010-01-26	1220	\N	97567	\N
99657	GENERIC_DAY	0	2	2010-01-28	1217	\N	97567	\N
99658	GENERIC_DAY	0	0	2010-02-14	1228	\N	97567	\N
99659	GENERIC_DAY	0	5	2010-01-25	1230	\N	97567	\N
99660	GENERIC_DAY	0	2	2010-01-20	1228	\N	97567	\N
99661	GENERIC_DAY	0	0	2010-01-23	90901	\N	97567	\N
99662	GENERIC_DAY	0	0	2010-01-24	1217	\N	97567	\N
99663	GENERIC_DAY	0	2	2010-02-09	1228	\N	97567	\N
99664	GENERIC_DAY	0	3	2010-02-02	1220	\N	97567	\N
99665	GENERIC_DAY	0	1	2010-02-11	1220	\N	97567	\N
99666	GENERIC_DAY	0	4	2010-02-03	90901	\N	97567	\N
99667	GENERIC_DAY	0	3	2010-01-18	90901	\N	97567	\N
99668	GENERIC_DAY	0	4	2010-01-29	1220	\N	97567	\N
99669	GENERIC_DAY	0	4	2010-02-02	90901	\N	97567	\N
99670	GENERIC_DAY	0	0	2010-02-23	90901	\N	97567	\N
99671	GENERIC_DAY	0	2	2010-02-25	90901	\N	97567	\N
99672	GENERIC_DAY	0	0	2010-02-14	90901	\N	97567	\N
99673	GENERIC_DAY	0	2	2010-02-04	1228	\N	97567	\N
99674	GENERIC_DAY	0	3	2010-01-25	90901	\N	97567	\N
99675	GENERIC_DAY	0	3	2010-02-01	1217	\N	97567	\N
99676	GENERIC_DAY	0	0	2010-02-13	1220	\N	97567	\N
99677	GENERIC_DAY	0	3	2010-02-04	1230	\N	97567	\N
99678	GENERIC_DAY	0	0	2010-02-07	1220	\N	97567	\N
99679	GENERIC_DAY	0	0	2010-02-14	1230	\N	97567	\N
99680	GENERIC_DAY	0	2	2010-02-08	1217	\N	97567	\N
99681	GENERIC_DAY	0	0	2010-02-22	90901	\N	97567	\N
99682	GENERIC_DAY	0	3	2010-02-03	1228	\N	97567	\N
99683	GENERIC_DAY	0	3	2010-02-01	1220	\N	97567	\N
99684	GENERIC_DAY	0	4	2010-01-15	1230	\N	97567	\N
99685	GENERIC_DAY	0	0	2010-02-21	1217	\N	97567	\N
99686	GENERIC_DAY	0	0	2010-02-17	1220	\N	97567	\N
99687	GENERIC_DAY	0	3	2010-02-16	1217	\N	97567	\N
99688	GENERIC_DAY	0	0	2010-01-23	1230	\N	97567	\N
99689	GENERIC_DAY	0	2	2010-01-25	1217	\N	97567	\N
99690	GENERIC_DAY	0	0	2010-02-16	1220	\N	97567	\N
99691	GENERIC_DAY	0	0	2010-01-16	1230	\N	97567	\N
99692	GENERIC_DAY	0	5	2010-01-20	1230	\N	97567	\N
99693	GENERIC_DAY	0	2	2010-02-05	1228	\N	97567	\N
99694	GENERIC_DAY	0	0	2010-02-19	1220	\N	97567	\N
99695	GENERIC_DAY	0	3	2010-02-05	1230	\N	97567	\N
99696	GENERIC_DAY	0	5	2010-01-21	1230	\N	97567	\N
99697	GENERIC_DAY	0	4	2010-02-02	1217	\N	97567	\N
99698	GENERIC_DAY	0	1	2010-02-10	1217	\N	97567	\N
99699	GENERIC_DAY	0	0	2010-02-14	1220	\N	97567	\N
99700	GENERIC_DAY	0	0	2010-01-26	90901	\N	97567	\N
99701	GENERIC_DAY	0	4	2010-02-19	1230	\N	97567	\N
99702	GENERIC_DAY	0	0	2010-02-12	1220	\N	97567	\N
99703	GENERIC_DAY	0	0	2010-02-13	1217	\N	97567	\N
99704	GENERIC_DAY	0	2	2010-02-24	1230	\N	97567	\N
99705	GENERIC_DAY	0	2	2010-02-04	1217	\N	97567	\N
99706	GENERIC_DAY	0	0	2010-02-18	1220	\N	97567	\N
99707	GENERIC_DAY	0	3	2010-02-15	1217	\N	97567	\N
99708	GENERIC_DAY	0	2	2010-01-15	1217	\N	97567	\N
99709	GENERIC_DAY	0	0	2010-02-20	1220	\N	97567	\N
99710	GENERIC_DAY	0	1	2010-02-09	1217	\N	97567	\N
99711	GENERIC_DAY	0	0	2010-02-23	1220	\N	97567	\N
99712	GENERIC_DAY	0	2	2010-01-15	90901	\N	97567	\N
99713	GENERIC_DAY	0	0	2010-02-25	1220	\N	97567	\N
99714	GENERIC_DAY	0	2	2010-02-04	1220	\N	97567	\N
99715	GENERIC_DAY	0	0	2010-01-31	1220	\N	97567	\N
99716	GENERIC_DAY	0	0	2010-01-30	1228	\N	97567	\N
99717	GENERIC_DAY	0	2	2010-01-26	1217	\N	97567	\N
99718	GENERIC_DAY	0	4	2010-01-28	1230	\N	97567	\N
99719	GENERIC_DAY	0	3	2010-01-19	90901	\N	97567	\N
99720	GENERIC_DAY	0	0	2010-02-17	1228	\N	97567	\N
99721	GENERIC_DAY	0	0	2010-01-31	1228	\N	97567	\N
99722	GENERIC_DAY	0	0	2010-02-13	1230	\N	97567	\N
99723	GENERIC_DAY	0	5	2010-02-05	90901	\N	97567	\N
99724	GENERIC_DAY	0	4	2010-01-27	1230	\N	97567	\N
99725	GENERIC_DAY	0	2	2010-02-16	90901	\N	97567	\N
99726	GENERIC_DAY	0	3	2010-01-18	1220	\N	97567	\N
99727	GENERIC_DAY	0	0	2010-02-07	1230	\N	97567	\N
99728	GENERIC_DAY	0	0	2010-02-17	90901	\N	97567	\N
99729	GENERIC_DAY	0	1	2010-02-25	1230	\N	97567	\N
99730	GENERIC_DAY	0	0	2010-01-17	90901	\N	97567	\N
99731	GENERIC_DAY	0	0	2010-02-13	90901	\N	97567	\N
99732	GENERIC_DAY	0	2	2010-02-10	1220	\N	97567	\N
99733	GENERIC_DAY	0	0	2010-01-31	1230	\N	97567	\N
99734	GENERIC_DAY	0	2	2010-02-01	1228	\N	97567	\N
99735	GENERIC_DAY	0	5	2010-02-16	1228	\N	97567	\N
99736	GENERIC_DAY	0	4	2010-02-15	1230	\N	97567	\N
99737	GENERIC_DAY	0	0	2010-02-22	1220	\N	97567	\N
99738	GENERIC_DAY	0	5	2010-01-22	1230	\N	97567	\N
99739	GENERIC_DAY	0	4	2010-01-29	1230	\N	97567	\N
99740	GENERIC_DAY	0	0	2010-02-06	1228	\N	97567	\N
99741	GENERIC_DAY	0	0	2010-01-29	90901	\N	97567	\N
99742	GENERIC_DAY	0	0	2010-02-20	90901	\N	97567	\N
99743	GENERIC_DAY	0	4	2010-02-24	90901	\N	97567	\N
99744	GENERIC_DAY	0	0	2010-02-17	1217	\N	97567	\N
99745	GENERIC_DAY	0	0	2010-01-17	1220	\N	97567	\N
99746	GENERIC_DAY	0	3	2010-01-15	1220	\N	97567	\N
99747	GENERIC_DAY	0	0	2010-02-06	90901	\N	97567	\N
99748	GENERIC_DAY	0	5	2010-02-08	90901	\N	97567	\N
99749	GENERIC_DAY	0	2	2010-01-27	1217	\N	97567	\N
99750	GENERIC_DAY	0	4	2010-02-16	1230	\N	97567	\N
99751	GENERIC_DAY	0	3	2010-02-12	1217	\N	97567	\N
99752	GENERIC_DAY	0	2	2010-02-01	1230	\N	97567	\N
99753	GENERIC_DAY	0	0	2010-01-17	1217	\N	97567	\N
99754	GENERIC_DAY	0	3	2010-02-11	1217	\N	97567	\N
99755	GENERIC_DAY	0	1	2010-02-11	90901	\N	97567	\N
99756	GENERIC_DAY	0	0	2010-01-24	1220	\N	97567	\N
99757	GENERIC_DAY	0	0	2010-02-21	90901	\N	97567	\N
99758	GENERIC_DAY	0	3	2010-02-03	1220	\N	97567	\N
99759	GENERIC_DAY	0	2	2010-02-08	1220	\N	97567	\N
99760	GENERIC_DAY	0	2	2010-02-02	1228	\N	97567	\N
99761	GENERIC_DAY	0	0	2010-01-16	1220	\N	97567	\N
99762	GENERIC_DAY	0	4	2010-02-18	1230	\N	97567	\N
99763	GENERIC_DAY	0	5	2010-02-15	1228	\N	97567	\N
99764	GENERIC_DAY	0	1	2010-02-03	1217	\N	97567	\N
99765	GENERIC_DAY	0	6	2010-01-05	1228	\N	97566	\N
99766	GENERIC_DAY	0	6	2010-01-06	1217	\N	97566	\N
99767	GENERIC_DAY	0	0	2010-01-02	1230	\N	97566	\N
99768	GENERIC_DAY	0	6	2010-01-12	1220	\N	97566	\N
99769	GENERIC_DAY	0	6	2010-01-08	1228	\N	97566	\N
99770	GENERIC_DAY	0	6	2010-01-06	1230	\N	97566	\N
99771	GENERIC_DAY	0	6	2010-01-11	1220	\N	97566	\N
99772	GENERIC_DAY	0	2	2010-01-14	1228	\N	97566	\N
99773	GENERIC_DAY	0	2	2010-01-14	1220	\N	97566	\N
99774	GENERIC_DAY	0	2	2010-01-14	90901	\N	97566	\N
99775	GENERIC_DAY	0	6	2010-01-08	1230	\N	97566	\N
99776	GENERIC_DAY	0	0	2010-01-10	1228	\N	97566	\N
99777	GENERIC_DAY	0	6	2010-01-05	1217	\N	97566	\N
99778	GENERIC_DAY	0	6	2010-01-01	1217	\N	97566	\N
99779	GENERIC_DAY	0	6	2010-01-05	1230	\N	97566	\N
99780	GENERIC_DAY	0	6	2010-01-06	1220	\N	97566	\N
99781	GENERIC_DAY	0	0	2010-01-02	1220	\N	97566	\N
99782	GENERIC_DAY	0	6	2010-01-13	1228	\N	97566	\N
99783	GENERIC_DAY	0	0	2010-01-10	1230	\N	97566	\N
99784	GENERIC_DAY	0	8	2010-01-12	90901	\N	97566	\N
99785	GENERIC_DAY	0	6	2010-01-06	1228	\N	97566	\N
99786	GENERIC_DAY	0	6	2010-01-13	1230	\N	97566	\N
99787	GENERIC_DAY	0	0	2010-01-10	90901	\N	97566	\N
99788	GENERIC_DAY	0	6	2010-01-05	1220	\N	97566	\N
99789	GENERIC_DAY	0	7	2010-01-08	1220	\N	97566	\N
99790	GENERIC_DAY	0	6	2010-01-13	1220	\N	97566	\N
99791	GENERIC_DAY	0	0	2010-01-09	1230	\N	97566	\N
99792	GENERIC_DAY	0	6	2010-01-01	1230	\N	97566	\N
99793	GENERIC_DAY	0	8	2010-01-08	90901	\N	97566	\N
99794	GENERIC_DAY	0	0	2010-01-02	1217	\N	97566	\N
99795	GENERIC_DAY	0	6	2010-01-12	1228	\N	97566	\N
99796	GENERIC_DAY	0	0	2010-01-03	1217	\N	97566	\N
99797	GENERIC_DAY	0	6	2010-01-04	1217	\N	97566	\N
99798	GENERIC_DAY	0	0	2010-01-03	1220	\N	97566	\N
99799	GENERIC_DAY	0	6	2010-01-04	1228	\N	97566	\N
99800	GENERIC_DAY	0	8	2010-01-11	90901	\N	97566	\N
99801	GENERIC_DAY	0	8	2010-01-07	90901	\N	97566	\N
99802	GENERIC_DAY	0	0	2010-01-02	1228	\N	97566	\N
99803	GENERIC_DAY	0	6	2010-01-01	1220	\N	97566	\N
99804	GENERIC_DAY	0	0	2010-01-09	1220	\N	97566	\N
99805	GENERIC_DAY	0	6	2010-01-01	1228	\N	97566	\N
99806	GENERIC_DAY	0	6	2010-01-12	1230	\N	97566	\N
99807	GENERIC_DAY	0	8	2010-01-13	90901	\N	97566	\N
99808	GENERIC_DAY	0	6	2010-01-12	1217	\N	97566	\N
99809	GENERIC_DAY	0	6	2010-01-07	1230	\N	97566	\N
99810	GENERIC_DAY	0	0	2010-01-09	1217	\N	97566	\N
99811	GENERIC_DAY	0	0	2010-01-10	1217	\N	97566	\N
99812	GENERIC_DAY	0	6	2010-01-04	1220	\N	97566	\N
99813	GENERIC_DAY	0	0	2010-01-09	1228	\N	97566	\N
99814	GENERIC_DAY	0	3	2010-01-14	1217	\N	97566	\N
99815	GENERIC_DAY	0	8	2010-01-06	90901	\N	97566	\N
99816	GENERIC_DAY	0	6	2010-01-07	1217	\N	97566	\N
99817	GENERIC_DAY	0	0	2010-01-03	1228	\N	97566	\N
99818	GENERIC_DAY	0	0	2010-01-10	1220	\N	97566	\N
99819	GENERIC_DAY	0	6	2010-01-07	1228	\N	97566	\N
99820	GENERIC_DAY	0	8	2010-01-05	90901	\N	97566	\N
99821	GENERIC_DAY	0	6	2010-01-11	1217	\N	97566	\N
99822	GENERIC_DAY	0	0	2010-01-09	90901	\N	97566	\N
99823	GENERIC_DAY	0	3	2010-01-14	1230	\N	97566	\N
99824	GENERIC_DAY	0	6	2010-01-11	1228	\N	97566	\N
99825	GENERIC_DAY	0	5	2010-01-08	1217	\N	97566	\N
99826	GENERIC_DAY	0	8	2010-01-01	90901	\N	97566	\N
99827	GENERIC_DAY	0	6	2010-01-13	1217	\N	97566	\N
99828	GENERIC_DAY	0	6	2010-01-11	1230	\N	97566	\N
99829	GENERIC_DAY	0	6	2010-01-07	1220	\N	97566	\N
99830	GENERIC_DAY	0	6	2010-01-04	1230	\N	97566	\N
99831	GENERIC_DAY	0	8	2010-01-04	90901	\N	97566	\N
99832	GENERIC_DAY	0	0	2010-01-03	90901	\N	97566	\N
99833	GENERIC_DAY	0	0	2010-01-02	90901	\N	97566	\N
99834	GENERIC_DAY	0	0	2010-01-03	1230	\N	97566	\N
355585	GENERIC_DAY	1	6	2010-06-28	139486	\N	148708	\N
355586	GENERIC_DAY	1	0	2010-06-26	139482	\N	148708	\N
355587	GENERIC_DAY	1	1	2010-06-29	139482	\N	148708	\N
355588	GENERIC_DAY	1	4	2010-06-29	139486	\N	148708	\N
355589	GENERIC_DAY	1	0	2010-06-29	139484	\N	148708	\N
355590	GENERIC_DAY	1	0	2010-06-27	139482	\N	148708	\N
355591	GENERIC_DAY	1	0	2010-06-26	139484	\N	148708	\N
355592	GENERIC_DAY	1	0	2010-06-27	139486	\N	148708	\N
355593	GENERIC_DAY	1	0	2010-06-26	139486	\N	148708	\N
355594	GENERIC_DAY	1	0	2010-06-27	139484	\N	148708	\N
355595	GENERIC_DAY	1	0	2010-06-28	139484	\N	148708	\N
355596	GENERIC_DAY	1	1	2010-06-28	139482	\N	148708	\N
355597	GENERIC_DAY	1	1	2010-06-23	139486	\N	148710	\N
355598	GENERIC_DAY	1	1	2010-06-23	139484	\N	148710	\N
355599	GENERIC_DAY	1	2	2010-06-23	139482	\N	148710	\N
355600	GENERIC_DAY	1	1	2010-09-10	139484	\N	148711	\N
355601	GENERIC_DAY	1	2	2010-09-09	139482	\N	148711	\N
355602	GENERIC_DAY	1	3	2010-09-09	139486	\N	148711	\N
355603	GENERIC_DAY	1	0	2010-09-10	139482	\N	148711	\N
355604	GENERIC_DAY	1	2	2010-09-09	139484	\N	148711	\N
355605	GENERIC_DAY	1	0	2010-09-10	139486	\N	148711	\N
355606	GENERIC_DAY	1	0	2010-06-25	139482	\N	148712	\N
355607	GENERIC_DAY	1	2	2010-06-24	139484	\N	148712	\N
355608	GENERIC_DAY	1	0	2010-06-25	139484	\N	148712	\N
355609	GENERIC_DAY	1	3	2010-06-24	139482	\N	148712	\N
355610	GENERIC_DAY	1	2	2010-06-24	139486	\N	148712	\N
355611	GENERIC_DAY	1	1	2010-06-25	139486	\N	148712	\N
355612	GENERIC_DAY	1	2	2010-09-13	139482	\N	148713	\N
355613	GENERIC_DAY	1	0	2010-09-12	139486	\N	148713	\N
355614	GENERIC_DAY	1	0	2010-09-11	139486	\N	148713	\N
355615	GENERIC_DAY	1	3	2010-09-14	139482	\N	148713	\N
355616	GENERIC_DAY	1	0	2010-09-12	139484	\N	148713	\N
124066	GENERIC_DAY	3	0	2010-02-24	117262	\N	118483	\N
124067	GENERIC_DAY	3	16	2010-03-03	117264	\N	118483	\N
124068	GENERIC_DAY	3	16	2010-02-22	117264	\N	118483	\N
124069	GENERIC_DAY	3	0	2010-03-01	117262	\N	118483	\N
124070	GENERIC_DAY	3	0	2010-03-04	117262	\N	118483	\N
124071	GENERIC_DAY	3	16	2010-03-01	117264	\N	118483	\N
124072	GENERIC_DAY	3	0	2010-03-05	117262	\N	118483	\N
124073	GENERIC_DAY	3	0	2010-02-28	117262	\N	118483	\N
124074	GENERIC_DAY	3	0	2010-02-22	117262	\N	118483	\N
124075	GENERIC_DAY	3	0	2010-02-25	117262	\N	118483	\N
124076	GENERIC_DAY	3	0	2010-03-02	117262	\N	118483	\N
124077	GENERIC_DAY	3	0	2010-02-26	117262	\N	118483	\N
124078	GENERIC_DAY	3	16	2010-02-25	117264	\N	118483	\N
124079	GENERIC_DAY	3	0	2010-02-27	117264	\N	118483	\N
124080	GENERIC_DAY	3	16	2010-03-04	117264	\N	118483	\N
124081	GENERIC_DAY	3	0	2010-02-23	117262	\N	118483	\N
124082	GENERIC_DAY	3	0	2010-02-28	117264	\N	118483	\N
124083	GENERIC_DAY	3	16	2010-02-26	117264	\N	118483	\N
124084	GENERIC_DAY	3	16	2010-02-24	117264	\N	118483	\N
124085	GENERIC_DAY	3	0	2010-02-27	117262	\N	118483	\N
124086	GENERIC_DAY	3	16	2010-02-23	117264	\N	118483	\N
124087	GENERIC_DAY	3	16	2010-03-05	117264	\N	118483	\N
124088	GENERIC_DAY	3	0	2010-03-03	117262	\N	118483	\N
124089	GENERIC_DAY	3	16	2010-03-02	117264	\N	118483	\N
124090	GENERIC_DAY	3	0	2010-03-20	117264	\N	118484	\N
124091	GENERIC_DAY	3	12	2010-03-15	117264	\N	118484	\N
124092	GENERIC_DAY	3	4	2010-03-16	117262	\N	118484	\N
124093	GENERIC_DAY	3	12	2010-03-11	117264	\N	118484	\N
124094	GENERIC_DAY	3	4	2010-03-09	117262	\N	118484	\N
124095	GENERIC_DAY	3	12	2010-03-16	117264	\N	118484	\N
124096	GENERIC_DAY	3	0	2010-03-13	117264	\N	118484	\N
124097	GENERIC_DAY	3	12	2010-03-09	117264	\N	118484	\N
124098	GENERIC_DAY	3	12	2010-03-10	117264	\N	118484	\N
124099	GENERIC_DAY	3	4	2010-03-15	117262	\N	118484	\N
124100	GENERIC_DAY	3	0	2010-03-07	117264	\N	118484	\N
124101	GENERIC_DAY	3	0	2010-03-14	117264	\N	118484	\N
124102	GENERIC_DAY	3	0	2010-03-19	117262	\N	118484	\N
124103	GENERIC_DAY	3	12	2010-03-17	117264	\N	118484	\N
124104	GENERIC_DAY	3	4	2010-03-08	117262	\N	118484	\N
124105	GENERIC_DAY	3	0	2010-03-06	117262	\N	118484	\N
124106	GENERIC_DAY	3	0	2010-03-14	117262	\N	118484	\N
124107	GENERIC_DAY	3	4	2010-03-12	117262	\N	118484	\N
124108	GENERIC_DAY	3	4	2010-03-10	117262	\N	118484	\N
124109	GENERIC_DAY	3	12	2010-03-08	117264	\N	118484	\N
124110	GENERIC_DAY	3	12	2010-03-18	117264	\N	118484	\N
124111	GENERIC_DAY	3	12	2010-03-22	117264	\N	118484	\N
124112	GENERIC_DAY	3	4	2010-03-18	117262	\N	118484	\N
124113	GENERIC_DAY	3	4	2010-03-11	117262	\N	118484	\N
124114	GENERIC_DAY	3	0	2010-03-13	117262	\N	118484	\N
124115	GENERIC_DAY	3	0	2010-03-21	117264	\N	118484	\N
124116	GENERIC_DAY	3	0	2010-03-20	117262	\N	118484	\N
124117	GENERIC_DAY	3	0	2010-03-06	117264	\N	118484	\N
124118	GENERIC_DAY	3	4	2010-03-22	117262	\N	118484	\N
124119	GENERIC_DAY	3	0	2010-03-21	117262	\N	118484	\N
124120	GENERIC_DAY	3	0	2010-03-19	117264	\N	118484	\N
124121	GENERIC_DAY	3	4	2010-03-17	117262	\N	118484	\N
124122	GENERIC_DAY	3	12	2010-03-12	117264	\N	118484	\N
124123	GENERIC_DAY	3	0	2010-03-07	117262	\N	118484	\N
124124	GENERIC_DAY	3	8	2010-02-23	117262	\N	118485	\N
124125	GENERIC_DAY	3	8	2010-03-02	117262	\N	118485	\N
124126	GENERIC_DAY	3	0	2010-02-28	117264	\N	118485	\N
124127	GENERIC_DAY	3	8	2010-02-22	117262	\N	118485	\N
124128	GENERIC_DAY	3	8	2010-03-03	117262	\N	118485	\N
124129	GENERIC_DAY	3	8	2010-03-04	117264	\N	118485	\N
124130	GENERIC_DAY	3	8	2010-02-22	117264	\N	118485	\N
124131	GENERIC_DAY	3	8	2010-03-03	117264	\N	118485	\N
124132	GENERIC_DAY	3	8	2010-03-05	117264	\N	118485	\N
124133	GENERIC_DAY	3	0	2010-02-27	117262	\N	118485	\N
124134	GENERIC_DAY	3	0	2010-02-28	117262	\N	118485	\N
124135	GENERIC_DAY	3	8	2010-02-24	117262	\N	118485	\N
124136	GENERIC_DAY	3	8	2010-02-24	117264	\N	118485	\N
124137	GENERIC_DAY	3	8	2010-03-01	117264	\N	118485	\N
124138	GENERIC_DAY	3	0	2010-02-27	117264	\N	118485	\N
124139	GENERIC_DAY	3	8	2010-02-23	117264	\N	118485	\N
124140	GENERIC_DAY	3	8	2010-03-02	117264	\N	118485	\N
124141	GENERIC_DAY	3	8	2010-03-05	117262	\N	118485	\N
124142	GENERIC_DAY	3	8	2010-02-25	117264	\N	118485	\N
124143	GENERIC_DAY	3	8	2010-03-01	117262	\N	118485	\N
124144	GENERIC_DAY	3	8	2010-02-26	117262	\N	118485	\N
124145	GENERIC_DAY	3	8	2010-02-25	117262	\N	118485	\N
124146	GENERIC_DAY	3	8	2010-02-26	117264	\N	118485	\N
124147	GENERIC_DAY	3	8	2010-03-04	117262	\N	118485	\N
124148	GENERIC_DAY	3	0	2010-03-06	117264	\N	118486	\N
124149	GENERIC_DAY	3	8	2010-03-15	117264	\N	118486	\N
124150	GENERIC_DAY	3	13	2010-03-08	117264	\N	118486	\N
124151	GENERIC_DAY	3	2	2010-03-16	117262	\N	118486	\N
124152	GENERIC_DAY	3	2	2010-03-20	117264	\N	118486	\N
124153	GENERIC_DAY	3	8	2010-03-17	117264	\N	118486	\N
124154	GENERIC_DAY	3	4	2010-03-12	117262	\N	118486	\N
124155	GENERIC_DAY	3	12	2010-03-22	117264	\N	118486	\N
124156	GENERIC_DAY	3	4	2010-03-08	117262	\N	118486	\N
124157	GENERIC_DAY	3	0	2010-03-07	117262	\N	118486	\N
124158	GENERIC_DAY	3	2	2010-03-15	117262	\N	118486	\N
124159	GENERIC_DAY	3	8	2010-03-16	117264	\N	118486	\N
124160	GENERIC_DAY	3	0	2010-03-07	117264	\N	118486	\N
124161	GENERIC_DAY	3	4	2010-03-22	117262	\N	118486	\N
124162	GENERIC_DAY	3	6	2010-03-13	117264	\N	118486	\N
124163	GENERIC_DAY	3	0	2010-03-06	117262	\N	118486	\N
124164	GENERIC_DAY	3	13	2010-03-09	117264	\N	118486	\N
124165	GENERIC_DAY	3	8	2010-03-18	117264	\N	118486	\N
124166	GENERIC_DAY	3	2	2010-03-17	117262	\N	118486	\N
124167	GENERIC_DAY	3	2	2010-03-13	117262	\N	118486	\N
124168	GENERIC_DAY	3	13	2010-03-11	117264	\N	118486	\N
124169	GENERIC_DAY	3	2	2010-03-19	117264	\N	118486	\N
124170	GENERIC_DAY	3	13	2010-03-10	117264	\N	118486	\N
356147	GENERIC_DAY	1	0	2010-12-26	139486	\N	200655	\N
356148	GENERIC_DAY	1	3	2010-12-24	139484	\N	200655	\N
356149	GENERIC_DAY	1	0	2010-12-19	139482	\N	200655	\N
356150	GENERIC_DAY	1	3	2010-12-17	139482	\N	200655	\N
356151	GENERIC_DAY	1	3	2010-12-14	139486	\N	200655	\N
356152	GENERIC_DAY	1	3	2010-12-22	139484	\N	200655	\N
87144	SPECIFIC_DAY	1	0	2010-03-14	1220	86458	\N	\N
87141	SPECIFIC_DAY	1	8	2010-03-18	1220	86458	\N	\N
87102	SPECIFIC_DAY	1	0	2010-03-06	1220	86458	\N	\N
87136	SPECIFIC_DAY	1	8	2010-03-31	1220	86458	\N	\N
87105	SPECIFIC_DAY	1	0	2010-03-13	1220	86458	\N	\N
87122	SPECIFIC_DAY	1	0	2010-02-20	1220	86458	\N	\N
87133	SPECIFIC_DAY	1	8	2010-03-24	1220	86458	\N	\N
87114	SPECIFIC_DAY	1	8	2010-03-22	1220	86458	\N	\N
87134	SPECIFIC_DAY	1	8	2010-03-08	1220	86458	\N	\N
87135	SPECIFIC_DAY	1	8	2010-03-26	1220	86458	\N	\N
87137	SPECIFIC_DAY	1	8	2010-03-11	1220	86458	\N	\N
87112	SPECIFIC_DAY	1	0	2010-02-17	1220	86458	\N	\N
124171	GENERIC_DAY	3	12	2010-03-12	117264	\N	118486	\N
124172	GENERIC_DAY	3	2	2010-03-14	117262	\N	118486	\N
124173	GENERIC_DAY	3	2	2010-03-18	117262	\N	118486	\N
124174	GENERIC_DAY	3	2	2010-03-21	117264	\N	118486	\N
124175	GENERIC_DAY	3	6	2010-03-14	117264	\N	118486	\N
124176	GENERIC_DAY	3	4	2010-03-09	117262	\N	118486	\N
124177	GENERIC_DAY	3	4	2010-03-11	117262	\N	118486	\N
124178	GENERIC_DAY	3	4	2010-03-10	117262	\N	118486	\N
93145	GENERIC_DAY	0	1	2009-12-28	1217	\N	58472	\N
93146	GENERIC_DAY	0	2	2009-12-25	1228	\N	58472	\N
93147	GENERIC_DAY	0	0	2009-12-24	90901	\N	58472	\N
93148	GENERIC_DAY	0	2	2009-12-23	1220	\N	58472	\N
93149	GENERIC_DAY	0	2	2009-12-24	1217	\N	58472	\N
93150	GENERIC_DAY	0	0	2009-12-27	1228	\N	58472	\N
93151	GENERIC_DAY	0	2	2009-12-23	1230	\N	58472	\N
93152	GENERIC_DAY	0	0	2009-12-26	90901	\N	58472	\N
93153	GENERIC_DAY	0	2	2009-12-24	1230	\N	58472	\N
93154	GENERIC_DAY	0	2	2009-12-24	1220	\N	58472	\N
93155	GENERIC_DAY	0	2	2009-12-25	1230	\N	58472	\N
93156	GENERIC_DAY	0	2	2009-12-24	1228	\N	58472	\N
93157	GENERIC_DAY	0	2	2009-12-25	1220	\N	58472	\N
93158	GENERIC_DAY	0	0	2009-12-26	1220	\N	58472	\N
93159	GENERIC_DAY	0	1	2009-12-28	1220	\N	58472	\N
93160	GENERIC_DAY	0	0	2009-12-25	90901	\N	58472	\N
93161	GENERIC_DAY	0	0	2009-12-27	1217	\N	58472	\N
93162	GENERIC_DAY	0	1	2009-12-28	1230	\N	58472	\N
93163	GENERIC_DAY	0	0	2009-12-26	1230	\N	58472	\N
93164	GENERIC_DAY	0	2	2009-12-25	1217	\N	58472	\N
93165	GENERIC_DAY	0	2	2009-12-23	1217	\N	58472	\N
93166	GENERIC_DAY	0	0	2009-12-27	1230	\N	58472	\N
93167	GENERIC_DAY	0	0	2009-12-26	1217	\N	58472	\N
93168	GENERIC_DAY	0	0	2009-12-27	1220	\N	58472	\N
93169	GENERIC_DAY	0	0	2009-12-27	90901	\N	58472	\N
93170	GENERIC_DAY	0	0	2009-12-23	90901	\N	58472	\N
93171	GENERIC_DAY	0	1	2009-12-28	1228	\N	58472	\N
93172	GENERIC_DAY	0	0	2009-12-26	1228	\N	58472	\N
93173	GENERIC_DAY	0	2	2009-12-23	1228	\N	58472	\N
93174	GENERIC_DAY	0	4	2009-12-28	90901	\N	58472	\N
93175	GENERIC_DAY	0	0	2009-12-19	1214	\N	58457	\N
93176	GENERIC_DAY	0	3	2009-12-22	1226	\N	58457	\N
93177	GENERIC_DAY	0	3	2009-12-16	1214	\N	58457	\N
93178	GENERIC_DAY	0	3	2009-12-21	1226	\N	58457	\N
93179	GENERIC_DAY	0	2	2009-12-21	1222	\N	58457	\N
93180	GENERIC_DAY	0	3	2009-12-16	1226	\N	58457	\N
93181	GENERIC_DAY	0	3	2009-12-17	1226	\N	58457	\N
93182	GENERIC_DAY	0	0	2009-12-20	1214	\N	58457	\N
93183	GENERIC_DAY	0	3	2009-12-22	1214	\N	58457	\N
93184	GENERIC_DAY	0	0	2009-12-19	1226	\N	58457	\N
93185	GENERIC_DAY	0	3	2009-12-21	1214	\N	58457	\N
93186	GENERIC_DAY	0	2	2009-12-17	1222	\N	58457	\N
93187	GENERIC_DAY	0	3	2009-12-18	1214	\N	58457	\N
93188	GENERIC_DAY	0	0	2009-12-20	1226	\N	58457	\N
93189	GENERIC_DAY	0	0	2009-12-19	1222	\N	58457	\N
93190	GENERIC_DAY	0	2	2009-12-16	1222	\N	58457	\N
93191	GENERIC_DAY	0	3	2009-12-17	1214	\N	58457	\N
93192	GENERIC_DAY	0	0	2009-12-20	1222	\N	58457	\N
93193	GENERIC_DAY	0	2	2009-12-18	1222	\N	58457	\N
93194	GENERIC_DAY	0	2	2009-12-22	1222	\N	58457	\N
93195	GENERIC_DAY	0	3	2009-12-18	1226	\N	58457	\N
93196	GENERIC_DAY	0	2	2010-01-26	1222	\N	68413	\N
93197	GENERIC_DAY	0	0	2009-12-20	1222	\N	68413	\N
93198	GENERIC_DAY	0	2	2009-12-17	1214	\N	68413	\N
93199	GENERIC_DAY	0	0	2010-02-08	1214	\N	68413	\N
93200	GENERIC_DAY	0	2	2009-12-16	1222	\N	68413	\N
93201	GENERIC_DAY	0	0	2010-01-23	1214	\N	68413	\N
93202	GENERIC_DAY	0	3	2010-01-22	1214	\N	68413	\N
93203	GENERIC_DAY	0	4	2010-02-08	1222	\N	68413	\N
93204	GENERIC_DAY	0	0	2010-02-07	1214	\N	68413	\N
93205	GENERIC_DAY	0	0	2010-01-09	1222	\N	68413	\N
93206	GENERIC_DAY	0	0	2010-02-07	1226	\N	68413	\N
93207	GENERIC_DAY	0	0	2009-12-26	1214	\N	68413	\N
93208	GENERIC_DAY	0	2	2009-12-28	1222	\N	68413	\N
93209	GENERIC_DAY	0	2	2009-12-23	1222	\N	68413	\N
93210	GENERIC_DAY	0	3	2009-12-31	1214	\N	68413	\N
93211	GENERIC_DAY	0	1	2010-02-10	1226	\N	68413	\N
93212	GENERIC_DAY	0	0	2010-01-10	1222	\N	68413	\N
93213	GENERIC_DAY	0	2	2010-01-22	1222	\N	68413	\N
93214	GENERIC_DAY	0	0	2010-01-31	1214	\N	68413	\N
93215	GENERIC_DAY	0	0	2010-02-04	1214	\N	68413	\N
93216	GENERIC_DAY	0	2	2010-01-07	1222	\N	68413	\N
93217	GENERIC_DAY	0	1	2010-01-25	1226	\N	68413	\N
93218	GENERIC_DAY	0	1	2010-01-14	1226	\N	68413	\N
93219	GENERIC_DAY	0	1	2010-01-20	1226	\N	68413	\N
93220	GENERIC_DAY	0	3	2010-01-27	1214	\N	68413	\N
93221	GENERIC_DAY	0	2	2009-12-22	1222	\N	68413	\N
93222	GENERIC_DAY	0	3	2010-01-26	1214	\N	68413	\N
93223	GENERIC_DAY	0	2	2010-02-03	1222	\N	68413	\N
93224	GENERIC_DAY	0	3	2010-01-05	1214	\N	68413	\N
93225	GENERIC_DAY	0	0	2009-12-26	1226	\N	68413	\N
93226	GENERIC_DAY	0	0	2009-12-27	1226	\N	68413	\N
93227	GENERIC_DAY	0	1	2010-01-26	1226	\N	68413	\N
93228	GENERIC_DAY	0	2	2010-01-05	1222	\N	68413	\N
93229	GENERIC_DAY	0	4	2010-02-05	1222	\N	68413	\N
93230	GENERIC_DAY	0	1	2010-02-01	1226	\N	68413	\N
93231	GENERIC_DAY	0	1	2010-01-07	1226	\N	68413	\N
93232	GENERIC_DAY	0	3	2010-01-04	1214	\N	68413	\N
93233	GENERIC_DAY	0	2	2010-01-08	1222	\N	68413	\N
93234	GENERIC_DAY	0	2	2010-02-01	1222	\N	68413	\N
93235	GENERIC_DAY	0	2	2009-12-16	1226	\N	68413	\N
93236	GENERIC_DAY	0	2	2010-01-15	1222	\N	68413	\N
93237	GENERIC_DAY	0	2	2010-01-06	1222	\N	68413	\N
93238	GENERIC_DAY	0	0	2009-12-19	1222	\N	68413	\N
93239	GENERIC_DAY	0	3	2009-12-29	1214	\N	68413	\N
93240	GENERIC_DAY	0	2	2010-01-28	1222	\N	68413	\N
93241	GENERIC_DAY	0	3	2010-01-13	1214	\N	68413	\N
93242	GENERIC_DAY	0	0	2009-12-19	1226	\N	68413	\N
93243	GENERIC_DAY	0	1	2010-01-04	1226	\N	68413	\N
93244	GENERIC_DAY	0	0	2010-02-06	1214	\N	68413	\N
93245	GENERIC_DAY	0	2	2009-12-17	1226	\N	68413	\N
93246	GENERIC_DAY	0	3	2010-01-12	1214	\N	68413	\N
93247	GENERIC_DAY	0	1	2010-02-02	1226	\N	68413	\N
93248	GENERIC_DAY	0	1	2010-01-22	1226	\N	68413	\N
93249	GENERIC_DAY	0	3	2010-01-15	1214	\N	68413	\N
93250	GENERIC_DAY	0	2	2010-02-09	1226	\N	68413	\N
93251	GENERIC_DAY	0	0	2010-01-23	1226	\N	68413	\N
93252	GENERIC_DAY	0	3	2009-12-24	1214	\N	68413	\N
93253	GENERIC_DAY	0	1	2010-02-03	1226	\N	68413	\N
93254	GENERIC_DAY	0	3	2010-01-06	1214	\N	68413	\N
93255	GENERIC_DAY	0	1	2010-01-19	1226	\N	68413	\N
93256	GENERIC_DAY	0	3	2010-01-21	1214	\N	68413	\N
93257	GENERIC_DAY	0	0	2009-12-26	1222	\N	68413	\N
93258	GENERIC_DAY	0	1	2010-01-05	1226	\N	68413	\N
93259	GENERIC_DAY	0	2	2010-02-05	1226	\N	68413	\N
93260	GENERIC_DAY	0	2	2010-01-20	1222	\N	68413	\N
93261	GENERIC_DAY	0	2	2009-12-18	1222	\N	68413	\N
93262	GENERIC_DAY	0	2	2009-12-21	1222	\N	68413	\N
93263	GENERIC_DAY	0	0	2010-01-23	1222	\N	68413	\N
93264	GENERIC_DAY	0	1	2009-12-31	1226	\N	68413	\N
93265	GENERIC_DAY	0	3	2010-01-08	1214	\N	68413	\N
93266	GENERIC_DAY	0	0	2010-01-17	1226	\N	68413	\N
93267	GENERIC_DAY	0	0	2010-01-24	1214	\N	68413	\N
93268	GENERIC_DAY	0	0	2010-02-07	1222	\N	68413	\N
93269	GENERIC_DAY	0	0	2010-01-16	1214	\N	68413	\N
93270	GENERIC_DAY	0	0	2010-02-10	1214	\N	68413	\N
93271	GENERIC_DAY	0	0	2010-01-30	1226	\N	68413	\N
93272	GENERIC_DAY	0	2	2009-12-21	1226	\N	68413	\N
93273	GENERIC_DAY	0	0	2010-01-02	1226	\N	68413	\N
93274	GENERIC_DAY	0	0	2010-01-30	1222	\N	68413	\N
93275	GENERIC_DAY	0	3	2009-12-14	1214	\N	68413	\N
93276	GENERIC_DAY	0	2	2009-12-18	1214	\N	68413	\N
93277	GENERIC_DAY	0	1	2010-01-27	1226	\N	68413	\N
93278	GENERIC_DAY	0	4	2010-02-04	1222	\N	68413	\N
93279	GENERIC_DAY	0	1	2009-12-24	1226	\N	68413	\N
93280	GENERIC_DAY	0	2	2009-12-31	1222	\N	68413	\N
93281	GENERIC_DAY	0	1	2009-12-23	1226	\N	68413	\N
93282	GENERIC_DAY	0	0	2010-02-05	1214	\N	68413	\N
93283	GENERIC_DAY	0	0	2009-12-19	1214	\N	68413	\N
93284	GENERIC_DAY	0	2	2010-02-02	1222	\N	68413	\N
93285	GENERIC_DAY	0	0	2010-01-16	1226	\N	68413	\N
93286	GENERIC_DAY	0	2	2009-12-17	1222	\N	68413	\N
93287	GENERIC_DAY	0	2	2009-12-22	1214	\N	68413	\N
93288	GENERIC_DAY	0	0	2010-01-09	1214	\N	68413	\N
93289	GENERIC_DAY	0	3	2010-01-25	1214	\N	68413	\N
93290	GENERIC_DAY	0	2	2009-12-14	1222	\N	68413	\N
93291	GENERIC_DAY	0	0	2010-01-03	1226	\N	68413	\N
93292	GENERIC_DAY	0	2	2009-12-30	1222	\N	68413	\N
93293	GENERIC_DAY	0	3	2010-01-28	1214	\N	68413	\N
93294	GENERIC_DAY	0	2	2009-12-21	1214	\N	68413	\N
93295	GENERIC_DAY	0	2	2010-01-29	1222	\N	68413	\N
93296	GENERIC_DAY	0	0	2010-01-17	1222	\N	68413	\N
93297	GENERIC_DAY	0	3	2010-01-07	1214	\N	68413	\N
93298	GENERIC_DAY	0	0	2010-01-03	1222	\N	68413	\N
93299	GENERIC_DAY	0	2	2009-12-22	1226	\N	68413	\N
93300	GENERIC_DAY	0	3	2010-01-18	1214	\N	68413	\N
93301	GENERIC_DAY	0	0	2010-01-24	1226	\N	68413	\N
93302	GENERIC_DAY	0	2	2009-12-24	1222	\N	68413	\N
93303	GENERIC_DAY	0	3	2009-12-15	1214	\N	68413	\N
93304	GENERIC_DAY	0	1	2010-01-28	1226	\N	68413	\N
93305	GENERIC_DAY	0	3	2009-12-25	1214	\N	68413	\N
93306	GENERIC_DAY	0	0	2010-01-31	1226	\N	68413	\N
93307	GENERIC_DAY	0	0	2010-01-17	1214	\N	68413	\N
93308	GENERIC_DAY	0	3	2010-01-20	1214	\N	68413	\N
93309	GENERIC_DAY	0	3	2009-12-23	1214	\N	68413	\N
93310	GENERIC_DAY	0	1	2009-12-25	1226	\N	68413	\N
93311	GENERIC_DAY	0	3	2010-01-29	1214	\N	68413	\N
93312	GENERIC_DAY	0	0	2010-02-06	1226	\N	68413	\N
93313	GENERIC_DAY	0	3	2010-02-10	1222	\N	68413	\N
93314	GENERIC_DAY	0	2	2009-12-18	1226	\N	68413	\N
93315	GENERIC_DAY	0	2	2010-01-27	1222	\N	68413	\N
93316	GENERIC_DAY	0	2	2010-01-21	1222	\N	68413	\N
93317	GENERIC_DAY	0	0	2010-01-02	1222	\N	68413	\N
93318	GENERIC_DAY	0	1	2009-12-30	1226	\N	68413	\N
93319	GENERIC_DAY	0	3	2010-02-03	1214	\N	68413	\N
93320	GENERIC_DAY	0	2	2010-02-08	1226	\N	68413	\N
93321	GENERIC_DAY	0	2	2009-12-25	1222	\N	68413	\N
93322	GENERIC_DAY	0	1	2010-01-01	1226	\N	68413	\N
93323	GENERIC_DAY	0	3	2010-01-19	1214	\N	68413	\N
93324	GENERIC_DAY	0	4	2010-02-09	1222	\N	68413	\N
93325	GENERIC_DAY	0	3	2010-01-14	1214	\N	68413	\N
93326	GENERIC_DAY	0	0	2010-01-02	1214	\N	68413	\N
93327	GENERIC_DAY	0	0	2010-01-10	1226	\N	68413	\N
93328	GENERIC_DAY	0	2	2010-01-11	1222	\N	68413	\N
93329	GENERIC_DAY	0	0	2009-12-20	1226	\N	68413	\N
93330	GENERIC_DAY	0	0	2010-01-10	1214	\N	68413	\N
93331	GENERIC_DAY	0	3	2009-12-30	1214	\N	68413	\N
93332	GENERIC_DAY	0	0	2010-02-09	1214	\N	68413	\N
93333	GENERIC_DAY	0	2	2010-01-14	1222	\N	68413	\N
93334	GENERIC_DAY	0	1	2010-01-11	1226	\N	68413	\N
93335	GENERIC_DAY	0	0	2010-01-24	1222	\N	68413	\N
93336	GENERIC_DAY	0	1	2010-01-15	1226	\N	68413	\N
93337	GENERIC_DAY	0	0	2009-12-20	1214	\N	68413	\N
93338	GENERIC_DAY	0	0	2009-12-27	1214	\N	68413	\N
93339	GENERIC_DAY	0	1	2010-01-12	1226	\N	68413	\N
93340	GENERIC_DAY	0	3	2010-01-01	1214	\N	68413	\N
93341	GENERIC_DAY	0	1	2009-12-15	1226	\N	68413	\N
93342	GENERIC_DAY	0	3	2009-12-28	1214	\N	68413	\N
93343	GENERIC_DAY	0	1	2010-01-18	1226	\N	68413	\N
93344	GENERIC_DAY	0	0	2010-01-03	1214	\N	68413	\N
93345	GENERIC_DAY	0	0	2009-12-27	1222	\N	68413	\N
93346	GENERIC_DAY	0	2	2010-02-04	1226	\N	68413	\N
93347	GENERIC_DAY	0	1	2010-01-06	1226	\N	68413	\N
93348	GENERIC_DAY	0	3	2010-02-01	1214	\N	68413	\N
93349	GENERIC_DAY	0	1	2009-12-29	1226	\N	68413	\N
93350	GENERIC_DAY	0	2	2010-01-04	1222	\N	68413	\N
93351	GENERIC_DAY	0	1	2009-12-14	1226	\N	68413	\N
93352	GENERIC_DAY	0	3	2010-01-11	1214	\N	68413	\N
93353	GENERIC_DAY	0	0	2010-02-06	1222	\N	68413	\N
93354	GENERIC_DAY	0	2	2009-12-16	1214	\N	68413	\N
93355	GENERIC_DAY	0	2	2009-12-29	1222	\N	68413	\N
93356	GENERIC_DAY	0	0	2010-01-09	1226	\N	68413	\N
93357	GENERIC_DAY	0	2	2010-01-19	1222	\N	68413	\N
93358	GENERIC_DAY	0	1	2010-01-29	1226	\N	68413	\N
93359	GENERIC_DAY	0	0	2010-01-16	1222	\N	68413	\N
93360	GENERIC_DAY	0	2	2010-01-12	1222	\N	68413	\N
93361	GENERIC_DAY	0	2	2010-01-25	1222	\N	68413	\N
93362	GENERIC_DAY	0	1	2010-01-21	1226	\N	68413	\N
93363	GENERIC_DAY	0	1	2010-01-13	1226	\N	68413	\N
93364	GENERIC_DAY	0	0	2010-01-30	1214	\N	68413	\N
93365	GENERIC_DAY	0	2	2010-01-13	1222	\N	68413	\N
93366	GENERIC_DAY	0	1	2009-12-28	1226	\N	68413	\N
93367	GENERIC_DAY	0	2	2009-12-15	1222	\N	68413	\N
93368	GENERIC_DAY	0	1	2010-01-08	1226	\N	68413	\N
93369	GENERIC_DAY	0	0	2010-01-31	1222	\N	68413	\N
93370	GENERIC_DAY	0	2	2010-01-01	1222	\N	68413	\N
93371	GENERIC_DAY	0	3	2010-02-02	1214	\N	68413	\N
93372	GENERIC_DAY	0	2	2010-01-18	1222	\N	68413	\N
93373	GENERIC_DAY	0	0	2009-12-26	1230	\N	60790	\N
93374	GENERIC_DAY	0	2	2009-12-29	1228	\N	60790	\N
93375	GENERIC_DAY	0	2	2009-12-31	1230	\N	60790	\N
93376	GENERIC_DAY	0	2	2009-12-31	1220	\N	60790	\N
93377	GENERIC_DAY	0	1	2010-01-01	1228	\N	60790	\N
93378	GENERIC_DAY	0	0	2010-01-01	1230	\N	60790	\N
93379	GENERIC_DAY	0	0	2009-12-30	90901	\N	60790	\N
93380	GENERIC_DAY	0	1	2009-12-28	1217	\N	60790	\N
93381	GENERIC_DAY	0	0	2009-12-27	1228	\N	60790	\N
93382	GENERIC_DAY	0	2	2009-12-31	1217	\N	60790	\N
93383	GENERIC_DAY	0	0	2009-12-26	1228	\N	60790	\N
93384	GENERIC_DAY	0	0	2009-12-26	1220	\N	60790	\N
93385	GENERIC_DAY	0	0	2009-12-29	90901	\N	60790	\N
93386	GENERIC_DAY	0	0	2009-12-31	90901	\N	60790	\N
93387	GENERIC_DAY	0	2	2009-12-30	1217	\N	60790	\N
93388	GENERIC_DAY	0	0	2009-12-26	1217	\N	60790	\N
93389	GENERIC_DAY	0	2	2009-12-29	1230	\N	60790	\N
93390	GENERIC_DAY	0	3	2009-12-28	1220	\N	60790	\N
93391	GENERIC_DAY	0	0	2009-12-26	90901	\N	60790	\N
93392	GENERIC_DAY	0	6	2010-01-01	90901	\N	60790	\N
93393	GENERIC_DAY	0	2	2009-12-30	1228	\N	60790	\N
93394	GENERIC_DAY	0	2	2009-12-30	1230	\N	60790	\N
93395	GENERIC_DAY	0	2	2009-12-28	1228	\N	60790	\N
93396	GENERIC_DAY	0	2	2009-12-31	1228	\N	60790	\N
93397	GENERIC_DAY	0	0	2009-12-27	1230	\N	60790	\N
93398	GENERIC_DAY	0	3	2009-12-29	1220	\N	60790	\N
93399	GENERIC_DAY	0	2	2009-12-28	1230	\N	60790	\N
93400	GENERIC_DAY	0	1	2010-01-01	1217	\N	60790	\N
93401	GENERIC_DAY	0	0	2009-12-27	1217	\N	60790	\N
93402	GENERIC_DAY	0	1	2009-12-29	1217	\N	60790	\N
93403	GENERIC_DAY	0	0	2010-01-01	1220	\N	60790	\N
93404	GENERIC_DAY	0	0	2009-12-28	90901	\N	60790	\N
93405	GENERIC_DAY	0	0	2009-12-27	1220	\N	60790	\N
93406	GENERIC_DAY	0	0	2009-12-27	90901	\N	60790	\N
93407	GENERIC_DAY	0	2	2009-12-30	1220	\N	60790	\N
93408	GENERIC_DAY	0	0	2009-12-25	1230	\N	58468	\N
93409	GENERIC_DAY	0	8	2009-12-24	90901	\N	58468	\N
93410	GENERIC_DAY	0	8	2009-12-29	90901	\N	58468	\N
93411	GENERIC_DAY	0	0	2009-12-24	1228	\N	58468	\N
93412	GENERIC_DAY	0	0	2009-12-29	1220	\N	58468	\N
93413	GENERIC_DAY	0	2	2009-12-21	1228	\N	58468	\N
93414	GENERIC_DAY	0	0	2009-12-26	1230	\N	58468	\N
93415	GENERIC_DAY	0	0	2009-12-20	1230	\N	58468	\N
93416	GENERIC_DAY	0	0	2009-12-26	1220	\N	58468	\N
93417	GENERIC_DAY	0	0	2009-12-29	1230	\N	58468	\N
93418	GENERIC_DAY	0	0	2009-12-30	1220	\N	58468	\N
93419	GENERIC_DAY	0	0	2009-12-20	1228	\N	58468	\N
93420	GENERIC_DAY	0	0	2009-12-28	1217	\N	58468	\N
93421	GENERIC_DAY	0	0	2009-12-25	1220	\N	58468	\N
93422	GENERIC_DAY	0	0	2009-12-21	90901	\N	58468	\N
93423	GENERIC_DAY	0	0	2009-12-27	1217	\N	58468	\N
93424	GENERIC_DAY	0	0	2009-12-19	1228	\N	58468	\N
93425	GENERIC_DAY	0	0	2009-12-23	1220	\N	58468	\N
93426	GENERIC_DAY	0	0	2009-12-27	90901	\N	58468	\N
93427	GENERIC_DAY	0	0	2009-12-26	1228	\N	58468	\N
93428	GENERIC_DAY	0	8	2009-12-25	90901	\N	58468	\N
93429	GENERIC_DAY	0	0	2009-12-27	1220	\N	58468	\N
93430	GENERIC_DAY	0	2	2009-12-21	1217	\N	58468	\N
93431	GENERIC_DAY	0	0	2009-12-30	1217	\N	58468	\N
93432	GENERIC_DAY	0	0	2009-12-22	1217	\N	58468	\N
93433	GENERIC_DAY	0	0	2009-12-22	1228	\N	58468	\N
93434	GENERIC_DAY	0	0	2009-12-24	1220	\N	58468	\N
93435	GENERIC_DAY	0	0	2009-12-20	1220	\N	58468	\N
93436	GENERIC_DAY	0	0	2009-12-24	1230	\N	58468	\N
93437	GENERIC_DAY	0	0	2009-12-23	1230	\N	58468	\N
93438	GENERIC_DAY	0	0	2009-12-22	1220	\N	58468	\N
93439	GENERIC_DAY	0	0	2009-12-27	1228	\N	58468	\N
93440	GENERIC_DAY	0	8	2009-12-30	90901	\N	58468	\N
93441	GENERIC_DAY	0	0	2009-12-28	1230	\N	58468	\N
93442	GENERIC_DAY	0	0	2009-12-24	1217	\N	58468	\N
93443	GENERIC_DAY	0	0	2009-12-20	1217	\N	58468	\N
93444	GENERIC_DAY	0	0	2009-12-19	90901	\N	58468	\N
93445	GENERIC_DAY	0	0	2009-12-23	1217	\N	58468	\N
93446	GENERIC_DAY	0	0	2009-12-29	1217	\N	58468	\N
93447	GENERIC_DAY	0	0	2009-12-30	1228	\N	58468	\N
93448	GENERIC_DAY	0	0	2009-12-27	1230	\N	58468	\N
93449	GENERIC_DAY	0	0	2009-12-19	1230	\N	58468	\N
93450	GENERIC_DAY	0	0	2009-12-19	1220	\N	58468	\N
93451	GENERIC_DAY	0	8	2009-12-28	90901	\N	58468	\N
93452	GENERIC_DAY	0	0	2009-12-20	90901	\N	58468	\N
93453	GENERIC_DAY	0	0	2009-12-30	1230	\N	58468	\N
93454	GENERIC_DAY	0	0	2009-12-26	90901	\N	58468	\N
93455	GENERIC_DAY	0	0	2009-12-28	1228	\N	58468	\N
93456	GENERIC_DAY	0	8	2009-12-22	90901	\N	58468	\N
93457	GENERIC_DAY	0	0	2009-12-19	1217	\N	58468	\N
93458	GENERIC_DAY	0	0	2009-12-23	1228	\N	58468	\N
93459	GENERIC_DAY	0	0	2009-12-29	1228	\N	58468	\N
93460	GENERIC_DAY	0	2	2009-12-21	1220	\N	58468	\N
93461	GENERIC_DAY	0	0	2009-12-26	1217	\N	58468	\N
93462	GENERIC_DAY	0	0	2009-12-25	1217	\N	58468	\N
93463	GENERIC_DAY	0	0	2009-12-22	1230	\N	58468	\N
93464	GENERIC_DAY	0	0	2009-12-28	1220	\N	58468	\N
93465	GENERIC_DAY	0	0	2009-12-25	1228	\N	58468	\N
93466	GENERIC_DAY	0	8	2009-12-23	90901	\N	58468	\N
93467	GENERIC_DAY	0	2	2009-12-21	1230	\N	58468	\N
93468	GENERIC_DAY	0	2	2010-01-06	1217	\N	58469	\N
93469	GENERIC_DAY	0	3	2010-01-15	1228	\N	58469	\N
93470	GENERIC_DAY	0	0	2010-01-03	1220	\N	58469	\N
93471	GENERIC_DAY	0	2	2010-01-13	1220	\N	58469	\N
93472	GENERIC_DAY	0	1	2010-01-13	1217	\N	58469	\N
93473	GENERIC_DAY	0	1	2010-01-07	1220	\N	58469	\N
93474	GENERIC_DAY	0	2	2010-01-07	1217	\N	58469	\N
93475	GENERIC_DAY	0	3	2010-01-12	1228	\N	58469	\N
93476	GENERIC_DAY	0	2	2010-01-04	1228	\N	58469	\N
93477	GENERIC_DAY	0	0	2010-01-02	1217	\N	58469	\N
93478	GENERIC_DAY	0	2	2010-01-04	1217	\N	58469	\N
93479	GENERIC_DAY	0	2	2010-01-01	1230	\N	58469	\N
93480	GENERIC_DAY	0	2	2010-01-11	1228	\N	58469	\N
93481	GENERIC_DAY	0	3	2010-01-14	1228	\N	58469	\N
93482	GENERIC_DAY	0	2	2010-01-13	1230	\N	58469	\N
93483	GENERIC_DAY	0	2	2010-01-11	1220	\N	58469	\N
93484	GENERIC_DAY	0	0	2010-01-10	1220	\N	58469	\N
93485	GENERIC_DAY	0	2	2010-01-07	90901	\N	58469	\N
93486	GENERIC_DAY	0	2	2010-01-04	1230	\N	58469	\N
93487	GENERIC_DAY	0	0	2010-01-09	1217	\N	58469	\N
93488	GENERIC_DAY	0	2	2010-01-05	1217	\N	58469	\N
93489	GENERIC_DAY	0	0	2010-01-02	1228	\N	58469	\N
93490	GENERIC_DAY	0	2	2010-01-01	1220	\N	58469	\N
93491	GENERIC_DAY	0	2	2010-01-05	1230	\N	58469	\N
93492	GENERIC_DAY	0	2	2010-01-12	1220	\N	58469	\N
93493	GENERIC_DAY	0	2	2009-12-31	1228	\N	58469	\N
93494	GENERIC_DAY	0	0	2010-01-12	90901	\N	58469	\N
93495	GENERIC_DAY	0	2	2009-12-31	1230	\N	58469	\N
93496	GENERIC_DAY	0	1	2010-01-08	1230	\N	58469	\N
93497	GENERIC_DAY	0	0	2010-01-03	90901	\N	58469	\N
93498	GENERIC_DAY	0	2	2010-01-12	1230	\N	58469	\N
93499	GENERIC_DAY	0	0	2010-01-03	1228	\N	58469	\N
93500	GENERIC_DAY	0	0	2010-01-10	1230	\N	58469	\N
93501	GENERIC_DAY	0	1	2010-01-07	1230	\N	58469	\N
93502	GENERIC_DAY	0	0	2010-01-02	1230	\N	58469	\N
93503	GENERIC_DAY	0	0	2010-01-15	90901	\N	58469	\N
93504	GENERIC_DAY	0	4	2010-01-08	90901	\N	58469	\N
93505	GENERIC_DAY	0	2	2009-12-31	1220	\N	58469	\N
93506	GENERIC_DAY	0	0	2010-01-04	90901	\N	58469	\N
93507	GENERIC_DAY	0	2	2010-01-05	1220	\N	58469	\N
93508	GENERIC_DAY	0	0	2010-01-10	1217	\N	58469	\N
93509	GENERIC_DAY	0	0	2010-01-13	90901	\N	58469	\N
93510	GENERIC_DAY	0	0	2010-01-09	90901	\N	58469	\N
93511	GENERIC_DAY	0	1	2010-01-14	1217	\N	58469	\N
93512	GENERIC_DAY	0	0	2010-01-10	90901	\N	58469	\N
93513	GENERIC_DAY	0	0	2010-01-09	1230	\N	58469	\N
93514	GENERIC_DAY	0	0	2010-01-02	90901	\N	58469	\N
93515	GENERIC_DAY	0	2	2010-01-11	1230	\N	58469	\N
93516	GENERIC_DAY	0	2	2009-12-31	1217	\N	58469	\N
93517	GENERIC_DAY	0	0	2010-01-09	1220	\N	58469	\N
93518	GENERIC_DAY	0	3	2010-01-13	1228	\N	58469	\N
93519	GENERIC_DAY	0	2	2010-01-15	1230	\N	58469	\N
93520	GENERIC_DAY	0	0	2010-01-09	1228	\N	58469	\N
93521	GENERIC_DAY	0	2	2010-01-06	1220	\N	58469	\N
93522	GENERIC_DAY	0	2	2010-01-14	1230	\N	58469	\N
93523	GENERIC_DAY	0	0	2010-01-06	90901	\N	58469	\N
93524	GENERIC_DAY	0	2	2010-01-06	1230	\N	58469	\N
93525	GENERIC_DAY	0	2	2010-01-05	1228	\N	58469	\N
93526	GENERIC_DAY	0	0	2010-01-05	90901	\N	58469	\N
93527	GENERIC_DAY	0	2	2010-01-11	1217	\N	58469	\N
93528	GENERIC_DAY	0	2	2010-01-04	1220	\N	58469	\N
93529	GENERIC_DAY	0	2	2010-01-06	1228	\N	58469	\N
93530	GENERIC_DAY	0	2	2010-01-08	1217	\N	58469	\N
93531	GENERIC_DAY	0	2	2010-01-07	1228	\N	58469	\N
93532	GENERIC_DAY	0	2	2010-01-01	1217	\N	58469	\N
93533	GENERIC_DAY	0	2	2010-01-15	1220	\N	58469	\N
93534	GENERIC_DAY	0	0	2010-01-03	1230	\N	58469	\N
93535	GENERIC_DAY	0	0	2010-01-10	1228	\N	58469	\N
93536	GENERIC_DAY	0	0	2010-01-14	90901	\N	58469	\N
93537	GENERIC_DAY	0	0	2010-01-11	90901	\N	58469	\N
93538	GENERIC_DAY	0	0	2010-01-02	1220	\N	58469	\N
93539	GENERIC_DAY	0	2	2010-01-01	1228	\N	58469	\N
93540	GENERIC_DAY	0	0	2010-01-01	90901	\N	58469	\N
93541	GENERIC_DAY	0	2	2010-01-14	1220	\N	58469	\N
93542	GENERIC_DAY	0	1	2010-01-15	1217	\N	58469	\N
93543	GENERIC_DAY	0	1	2010-01-08	1228	\N	58469	\N
93544	GENERIC_DAY	0	0	2010-01-08	1220	\N	58469	\N
93545	GENERIC_DAY	0	1	2010-01-12	1217	\N	58469	\N
93546	GENERIC_DAY	0	0	2010-01-03	1217	\N	58469	\N
93547	GENERIC_DAY	0	0	2009-12-31	90901	\N	58469	\N
93548	GENERIC_DAY	0	0	2009-12-19	1217	\N	68414	\N
93549	GENERIC_DAY	0	0	2010-01-02	1228	\N	68414	\N
93550	GENERIC_DAY	0	0	2010-02-07	1220	\N	68414	\N
93551	GENERIC_DAY	0	2	2010-02-01	1228	\N	68414	\N
93552	GENERIC_DAY	0	3	2010-01-20	1217	\N	68414	\N
93553	GENERIC_DAY	0	1	2010-01-28	1228	\N	68414	\N
93554	GENERIC_DAY	0	3	2009-12-15	1220	\N	68414	\N
93555	GENERIC_DAY	0	0	2009-12-28	1230	\N	68414	\N
93556	GENERIC_DAY	0	2	2010-02-09	1228	\N	68414	\N
93557	GENERIC_DAY	0	0	2010-02-06	1217	\N	68414	\N
93558	GENERIC_DAY	0	0	2010-01-04	1220	\N	68414	\N
93559	GENERIC_DAY	0	0	2010-01-05	1220	\N	68414	\N
93560	GENERIC_DAY	0	1	2010-02-09	1220	\N	68414	\N
93561	GENERIC_DAY	0	1	2010-01-26	1228	\N	68414	\N
93562	GENERIC_DAY	0	0	2010-01-24	1230	\N	68414	\N
93563	GENERIC_DAY	0	0	2009-12-24	1230	\N	68414	\N
93564	GENERIC_DAY	0	0	2010-01-03	1220	\N	68414	\N
93565	GENERIC_DAY	0	0	2010-01-09	1217	\N	68414	\N
93566	GENERIC_DAY	0	0	2009-12-28	1217	\N	68414	\N
93567	GENERIC_DAY	0	0	2010-01-17	1217	\N	68414	\N
93568	GENERIC_DAY	0	0	2010-01-02	1220	\N	68414	\N
93569	GENERIC_DAY	0	2	2010-02-01	1217	\N	68414	\N
93570	GENERIC_DAY	0	0	2009-12-29	1217	\N	68414	\N
93571	GENERIC_DAY	0	2	2010-01-29	1220	\N	68414	\N
93572	GENERIC_DAY	0	0	2009-12-25	1230	\N	68414	\N
93573	GENERIC_DAY	0	0	2010-01-12	1230	\N	68414	\N
93574	GENERIC_DAY	0	6	2009-12-31	90901	\N	68414	\N
93575	GENERIC_DAY	0	2	2009-12-15	1217	\N	68414	\N
93576	GENERIC_DAY	0	0	2010-01-11	1228	\N	68414	\N
93577	GENERIC_DAY	0	1	2010-02-04	1217	\N	68414	\N
93578	GENERIC_DAY	0	0	2010-01-08	1228	\N	68414	\N
93579	GENERIC_DAY	0	0	2010-01-12	1228	\N	68414	\N
93580	GENERIC_DAY	0	0	2009-12-27	90901	\N	68414	\N
93581	GENERIC_DAY	0	2	2009-12-17	1217	\N	68414	\N
93582	GENERIC_DAY	0	1	2009-12-14	1228	\N	68414	\N
93583	GENERIC_DAY	0	4	2010-01-14	90901	\N	68414	\N
93584	GENERIC_DAY	0	2	2010-01-13	1217	\N	68414	\N
93585	GENERIC_DAY	0	0	2009-12-20	90901	\N	68414	\N
93586	GENERIC_DAY	0	0	2010-01-17	1230	\N	68414	\N
93587	GENERIC_DAY	0	0	2010-01-11	1220	\N	68414	\N
93588	GENERIC_DAY	0	6	2010-01-05	90901	\N	68414	\N
93589	GENERIC_DAY	0	0	2010-01-17	90901	\N	68414	\N
93590	GENERIC_DAY	0	0	2010-02-03	90901	\N	68414	\N
93591	GENERIC_DAY	0	0	2009-12-19	1220	\N	68414	\N
93592	GENERIC_DAY	0	0	2010-01-17	1220	\N	68414	\N
93593	GENERIC_DAY	0	2	2010-01-14	1217	\N	68414	\N
93594	GENERIC_DAY	0	4	2010-01-11	90901	\N	68414	\N
93595	GENERIC_DAY	0	0	2010-01-30	1230	\N	68414	\N
93596	GENERIC_DAY	0	0	2010-01-05	1230	\N	68414	\N
93597	GENERIC_DAY	0	1	2010-01-19	90901	\N	68414	\N
93598	GENERIC_DAY	0	3	2009-12-14	1220	\N	68414	\N
93599	GENERIC_DAY	0	0	2010-01-10	1230	\N	68414	\N
93600	GENERIC_DAY	0	6	2009-12-25	90901	\N	68414	\N
93601	GENERIC_DAY	0	2	2010-01-28	1217	\N	68414	\N
93602	GENERIC_DAY	0	1	2010-01-28	1230	\N	68414	\N
93603	GENERIC_DAY	0	0	2009-12-22	1220	\N	68414	\N
93604	GENERIC_DAY	0	0	2009-12-21	1228	\N	68414	\N
93605	GENERIC_DAY	0	0	2010-01-07	1220	\N	68414	\N
93606	GENERIC_DAY	0	0	2010-01-07	1217	\N	68414	\N
93607	GENERIC_DAY	0	0	2010-02-01	90901	\N	68414	\N
93608	GENERIC_DAY	0	0	2010-02-06	1230	\N	68414	\N
93609	GENERIC_DAY	0	4	2010-02-04	90901	\N	68414	\N
93610	GENERIC_DAY	0	0	2009-12-26	90901	\N	68414	\N
93611	GENERIC_DAY	0	1	2010-01-19	1220	\N	68414	\N
93612	GENERIC_DAY	0	1	2010-01-19	1230	\N	68414	\N
93613	GENERIC_DAY	0	2	2010-01-28	1220	\N	68414	\N
93614	GENERIC_DAY	0	0	2010-01-06	1217	\N	68414	\N
93615	GENERIC_DAY	0	2	2009-12-16	1220	\N	68414	\N
93616	GENERIC_DAY	0	0	2009-12-23	1217	\N	68414	\N
93617	GENERIC_DAY	0	0	2010-01-31	90901	\N	68414	\N
93618	GENERIC_DAY	0	1	2009-12-17	1228	\N	68414	\N
93619	GENERIC_DAY	0	1	2010-01-29	1228	\N	68414	\N
93620	GENERIC_DAY	0	0	2009-12-25	1217	\N	68414	\N
93621	GENERIC_DAY	0	0	2009-12-27	1220	\N	68414	\N
93622	GENERIC_DAY	0	3	2010-01-25	1217	\N	68414	\N
93623	GENERIC_DAY	0	0	2009-12-25	1228	\N	68414	\N
93624	GENERIC_DAY	0	0	2009-12-19	1228	\N	68414	\N
93625	GENERIC_DAY	0	1	2009-12-14	1217	\N	68414	\N
93626	GENERIC_DAY	0	0	2009-12-15	1228	\N	68414	\N
93627	GENERIC_DAY	0	1	2010-01-29	1230	\N	68414	\N
93628	GENERIC_DAY	0	0	2010-01-14	1228	\N	68414	\N
93629	GENERIC_DAY	0	0	2009-12-29	1230	\N	68414	\N
93630	GENERIC_DAY	0	0	2010-02-09	1217	\N	68414	\N
93631	GENERIC_DAY	0	0	2010-01-21	90901	\N	68414	\N
93632	GENERIC_DAY	0	0	2009-12-15	90901	\N	68414	\N
93633	GENERIC_DAY	0	1	2010-01-20	1230	\N	68414	\N
93634	GENERIC_DAY	0	0	2009-12-21	1220	\N	68414	\N
93635	GENERIC_DAY	0	0	2010-01-16	90901	\N	68414	\N
93636	GENERIC_DAY	0	0	2010-01-03	1230	\N	68414	\N
93637	GENERIC_DAY	0	0	2010-01-06	1228	\N	68414	\N
93638	GENERIC_DAY	0	0	2009-12-26	1220	\N	68414	\N
93639	GENERIC_DAY	0	0	2010-01-08	1220	\N	68414	\N
93640	GENERIC_DAY	0	0	2009-12-21	1217	\N	68414	\N
93641	GENERIC_DAY	0	0	2009-12-28	1228	\N	68414	\N
93642	GENERIC_DAY	0	1	2010-01-21	1228	\N	68414	\N
93643	GENERIC_DAY	0	2	2010-01-15	1217	\N	68414	\N
93644	GENERIC_DAY	0	0	2010-02-10	1220	\N	68414	\N
93645	GENERIC_DAY	0	2	2010-02-01	1220	\N	68414	\N
93646	GENERIC_DAY	0	0	2010-01-01	1228	\N	68414	\N
93647	GENERIC_DAY	0	1	2010-02-05	1220	\N	68414	\N
93648	GENERIC_DAY	0	2	2009-12-18	1220	\N	68414	\N
93649	GENERIC_DAY	0	1	2010-01-18	1230	\N	68414	\N
93650	GENERIC_DAY	0	0	2009-12-23	1230	\N	68414	\N
93651	GENERIC_DAY	0	1	2010-01-20	1228	\N	68414	\N
93652	GENERIC_DAY	0	1	2010-02-04	1220	\N	68414	\N
93653	GENERIC_DAY	0	1	2010-01-26	1230	\N	68414	\N
93654	GENERIC_DAY	0	2	2010-01-26	1217	\N	68414	\N
93655	GENERIC_DAY	0	0	2009-12-14	90901	\N	68414	\N
93656	GENERIC_DAY	0	0	2010-01-10	1217	\N	68414	\N
93657	GENERIC_DAY	0	2	2010-01-27	1220	\N	68414	\N
93658	GENERIC_DAY	0	1	2010-02-08	1217	\N	68414	\N
93659	GENERIC_DAY	0	0	2010-01-16	1230	\N	68414	\N
93660	GENERIC_DAY	0	0	2009-12-16	90901	\N	68414	\N
93661	GENERIC_DAY	0	0	2010-01-28	90901	\N	68414	\N
93662	GENERIC_DAY	0	1	2010-01-18	1228	\N	68414	\N
93663	GENERIC_DAY	0	0	2010-02-05	1228	\N	68414	\N
93664	GENERIC_DAY	0	0	2010-01-25	90901	\N	68414	\N
93665	GENERIC_DAY	0	0	2010-01-24	1220	\N	68414	\N
93666	GENERIC_DAY	0	0	2010-01-31	1220	\N	68414	\N
93667	GENERIC_DAY	0	2	2009-12-18	1217	\N	68414	\N
93668	GENERIC_DAY	0	2	2009-12-17	1220	\N	68414	\N
93669	GENERIC_DAY	0	0	2010-02-08	1230	\N	68414	\N
93670	GENERIC_DAY	0	0	2010-01-04	1228	\N	68414	\N
93671	GENERIC_DAY	0	3	2010-01-21	1217	\N	68414	\N
93672	GENERIC_DAY	0	0	2009-12-27	1228	\N	68414	\N
93673	GENERIC_DAY	0	0	2009-12-30	1228	\N	68414	\N
93674	GENERIC_DAY	0	0	2009-12-22	1228	\N	68414	\N
93675	GENERIC_DAY	0	0	2010-01-09	1228	\N	68414	\N
93676	GENERIC_DAY	0	4	2010-01-15	90901	\N	68414	\N
93677	GENERIC_DAY	0	0	2010-01-08	1230	\N	68414	\N
93678	GENERIC_DAY	0	0	2010-01-03	90901	\N	68414	\N
93679	GENERIC_DAY	0	1	2009-12-16	1228	\N	68414	\N
93680	GENERIC_DAY	0	2	2010-01-11	1217	\N	68414	\N
93681	GENERIC_DAY	0	0	2010-01-05	1217	\N	68414	\N
93682	GENERIC_DAY	0	0	2010-01-14	1230	\N	68414	\N
93683	GENERIC_DAY	0	0	2010-01-31	1230	\N	68414	\N
93684	GENERIC_DAY	0	0	2010-01-26	90901	\N	68414	\N
93685	GENERIC_DAY	0	0	2010-01-13	1230	\N	68414	\N
93686	GENERIC_DAY	0	2	2010-01-27	1217	\N	68414	\N
93687	GENERIC_DAY	0	0	2010-02-07	1217	\N	68414	\N
93688	GENERIC_DAY	0	3	2010-01-22	1217	\N	68414	\N
93689	GENERIC_DAY	0	1	2010-01-21	1220	\N	68414	\N
93690	GENERIC_DAY	0	0	2009-12-22	1217	\N	68414	\N
93691	GENERIC_DAY	0	0	2010-01-16	1228	\N	68414	\N
93692	GENERIC_DAY	0	0	2009-12-20	1230	\N	68414	\N
93693	GENERIC_DAY	0	6	2009-12-21	90901	\N	68414	\N
93694	GENERIC_DAY	0	0	2009-12-29	1220	\N	68414	\N
93695	GENERIC_DAY	0	0	2009-12-26	1217	\N	68414	\N
93696	GENERIC_DAY	0	0	2009-12-20	1228	\N	68414	\N
93697	GENERIC_DAY	0	0	2010-01-15	1220	\N	68414	\N
93698	GENERIC_DAY	0	1	2010-01-25	1220	\N	68414	\N
93699	GENERIC_DAY	0	0	2009-12-19	1230	\N	68414	\N
93700	GENERIC_DAY	0	0	2009-12-18	90901	\N	68414	\N
93701	GENERIC_DAY	0	0	2009-12-17	90901	\N	68414	\N
93702	GENERIC_DAY	0	1	2010-02-05	1217	\N	68414	\N
93703	GENERIC_DAY	0	0	2009-12-30	1217	\N	68414	\N
93704	GENERIC_DAY	0	0	2010-01-30	90901	\N	68414	\N
93705	GENERIC_DAY	0	1	2009-12-14	1230	\N	68414	\N
93706	GENERIC_DAY	0	0	2010-01-29	90901	\N	68414	\N
93707	GENERIC_DAY	0	0	2010-01-16	1217	\N	68414	\N
93708	GENERIC_DAY	0	0	2010-01-09	90901	\N	68414	\N
93709	GENERIC_DAY	0	0	2010-01-24	90901	\N	68414	\N
93710	GENERIC_DAY	0	0	2010-02-08	1228	\N	68414	\N
93711	GENERIC_DAY	0	0	2009-12-31	1230	\N	68414	\N
93712	GENERIC_DAY	0	0	2010-02-10	1217	\N	68414	\N
93713	GENERIC_DAY	0	0	2009-12-24	1220	\N	68414	\N
93714	GENERIC_DAY	0	2	2010-02-02	1228	\N	68414	\N
93715	GENERIC_DAY	0	0	2010-01-06	1220	\N	68414	\N
93716	GENERIC_DAY	0	0	2009-12-21	1230	\N	68414	\N
93717	GENERIC_DAY	0	0	2010-01-13	1220	\N	68414	\N
93718	GENERIC_DAY	0	1	2010-01-21	1230	\N	68414	\N
93719	GENERIC_DAY	0	0	2010-01-04	1230	\N	68414	\N
93720	GENERIC_DAY	0	0	2010-01-10	1228	\N	68414	\N
93721	GENERIC_DAY	0	0	2009-12-23	1220	\N	68414	\N
93722	GENERIC_DAY	0	0	2009-12-29	1228	\N	68414	\N
93723	GENERIC_DAY	0	0	2010-01-23	1228	\N	68414	\N
93724	GENERIC_DAY	0	0	2009-12-24	1217	\N	68414	\N
93725	GENERIC_DAY	0	4	2010-02-08	90901	\N	68414	\N
93726	GENERIC_DAY	0	1	2010-01-19	1228	\N	68414	\N
93727	GENERIC_DAY	0	1	2010-01-22	1228	\N	68414	\N
93728	GENERIC_DAY	0	1	2009-12-16	1230	\N	68414	\N
93729	GENERIC_DAY	0	6	2010-01-08	90901	\N	68414	\N
93730	GENERIC_DAY	0	0	2009-12-30	1220	\N	68414	\N
93731	GENERIC_DAY	0	0	2010-01-01	1230	\N	68414	\N
93732	GENERIC_DAY	0	1	2010-01-20	1220	\N	68414	\N
93733	GENERIC_DAY	0	1	2010-01-25	1230	\N	68414	\N
93734	GENERIC_DAY	0	0	2009-12-27	1217	\N	68414	\N
93735	GENERIC_DAY	0	2	2009-12-16	1217	\N	68414	\N
93736	GENERIC_DAY	0	0	2010-01-13	1228	\N	68414	\N
93737	GENERIC_DAY	0	0	2010-02-04	1228	\N	68414	\N
93738	GENERIC_DAY	0	0	2010-01-22	90901	\N	68414	\N
93739	GENERIC_DAY	0	1	2010-01-25	1228	\N	68414	\N
93740	GENERIC_DAY	0	0	2010-01-20	90901	\N	68414	\N
93741	GENERIC_DAY	0	0	2010-01-01	1217	\N	68414	\N
93742	GENERIC_DAY	0	6	2010-01-01	90901	\N	68414	\N
93743	GENERIC_DAY	0	1	2009-12-18	1230	\N	68414	\N
93744	GENERIC_DAY	0	2	2010-01-29	1217	\N	68414	\N
93745	GENERIC_DAY	0	6	2009-12-30	90901	\N	68414	\N
93746	GENERIC_DAY	0	0	2010-01-24	1217	\N	68414	\N
93747	GENERIC_DAY	0	0	2010-01-09	1230	\N	68414	\N
93748	GENERIC_DAY	0	1	2010-01-27	1228	\N	68414	\N
93749	GENERIC_DAY	0	0	2009-12-22	1230	\N	68414	\N
93750	GENERIC_DAY	0	0	2009-12-31	1217	\N	68414	\N
93751	GENERIC_DAY	0	2	2010-01-26	1220	\N	68414	\N
93752	GENERIC_DAY	0	0	2010-02-07	1228	\N	68414	\N
93753	GENERIC_DAY	0	0	2010-01-10	1220	\N	68414	\N
93754	GENERIC_DAY	0	0	2010-01-16	1220	\N	68414	\N
93755	GENERIC_DAY	0	0	2010-01-02	1230	\N	68414	\N
93756	GENERIC_DAY	0	0	2010-01-11	1230	\N	68414	\N
93757	GENERIC_DAY	0	1	2010-02-08	1220	\N	68414	\N
93758	GENERIC_DAY	0	0	2010-01-01	1220	\N	68414	\N
93759	GENERIC_DAY	0	6	2009-12-23	90901	\N	68414	\N
93760	GENERIC_DAY	0	6	2010-01-04	90901	\N	68414	\N
93761	GENERIC_DAY	0	0	2010-02-02	1230	\N	68414	\N
93762	GENERIC_DAY	0	6	2009-12-22	90901	\N	68414	\N
93763	GENERIC_DAY	0	2	2010-01-12	1217	\N	68414	\N
93764	GENERIC_DAY	0	0	2010-02-10	90901	\N	68414	\N
93765	GENERIC_DAY	0	0	2009-12-28	1220	\N	68414	\N
93766	GENERIC_DAY	0	0	2010-02-03	1230	\N	68414	\N
93767	GENERIC_DAY	0	0	2010-01-07	1228	\N	68414	\N
93768	GENERIC_DAY	0	2	2010-01-18	1217	\N	68414	\N
93769	GENERIC_DAY	0	6	2009-12-29	90901	\N	68414	\N
93770	GENERIC_DAY	0	0	2009-12-31	1220	\N	68414	\N
93771	GENERIC_DAY	0	0	2010-01-02	1217	\N	68414	\N
93772	GENERIC_DAY	0	4	2010-01-13	90901	\N	68414	\N
93773	GENERIC_DAY	0	6	2009-12-24	90901	\N	68414	\N
93774	GENERIC_DAY	0	0	2010-01-02	90901	\N	68414	\N
93775	GENERIC_DAY	0	2	2010-02-03	1217	\N	68414	\N
93776	GENERIC_DAY	0	0	2010-01-23	1217	\N	68414	\N
93777	GENERIC_DAY	0	0	2009-12-26	1228	\N	68414	\N
93778	GENERIC_DAY	0	0	2010-01-06	1230	\N	68414	\N
93779	GENERIC_DAY	0	0	2010-01-03	1228	\N	68414	\N
93780	GENERIC_DAY	0	1	2009-12-15	1230	\N	68414	\N
93781	GENERIC_DAY	0	0	2010-02-05	1230	\N	68414	\N
93782	GENERIC_DAY	0	0	2010-01-23	90901	\N	68414	\N
93783	GENERIC_DAY	0	0	2009-12-20	1217	\N	68414	\N
93784	GENERIC_DAY	0	0	2009-12-19	90901	\N	68414	\N
93785	GENERIC_DAY	0	0	2010-01-17	1228	\N	68414	\N
93786	GENERIC_DAY	0	6	2010-01-07	90901	\N	68414	\N
93787	GENERIC_DAY	0	0	2010-01-31	1217	\N	68414	\N
93788	GENERIC_DAY	0	0	2009-12-23	1228	\N	68414	\N
93789	GENERIC_DAY	0	0	2010-02-07	1230	\N	68414	\N
93790	GENERIC_DAY	0	0	2010-01-03	1217	\N	68414	\N
93791	GENERIC_DAY	0	0	2010-01-30	1217	\N	68414	\N
93792	GENERIC_DAY	0	0	2010-01-05	1228	\N	68414	\N
93793	GENERIC_DAY	0	0	2010-02-07	90901	\N	68414	\N
93794	GENERIC_DAY	0	0	2010-01-07	1230	\N	68414	\N
93795	GENERIC_DAY	0	2	2010-02-10	1230	\N	68414	\N
93796	GENERIC_DAY	0	0	2009-12-27	1230	\N	68414	\N
93797	GENERIC_DAY	0	2	2010-02-03	1228	\N	68414	\N
93798	GENERIC_DAY	0	0	2010-02-04	1230	\N	68414	\N
93799	GENERIC_DAY	0	0	2009-12-31	1228	\N	68414	\N
93800	GENERIC_DAY	0	0	2010-02-06	1220	\N	68414	\N
93801	GENERIC_DAY	0	2	2010-02-02	1217	\N	68414	\N
93802	GENERIC_DAY	0	0	2010-01-08	1217	\N	68414	\N
93803	GENERIC_DAY	0	0	2010-01-31	1228	\N	68414	\N
93804	GENERIC_DAY	0	1	2010-01-22	1230	\N	68414	\N
93805	GENERIC_DAY	0	1	2010-01-18	90901	\N	68414	\N
93806	GENERIC_DAY	0	1	2009-12-17	1230	\N	68414	\N
93807	GENERIC_DAY	0	0	2010-01-30	1228	\N	68414	\N
93808	GENERIC_DAY	0	0	2010-01-12	1220	\N	68414	\N
93809	GENERIC_DAY	0	0	2010-01-14	1220	\N	68414	\N
93810	GENERIC_DAY	0	0	2009-12-26	1230	\N	68414	\N
93811	GENERIC_DAY	0	2	2010-02-02	1220	\N	68414	\N
93812	GENERIC_DAY	0	0	2010-01-23	1230	\N	68414	\N
93813	GENERIC_DAY	0	0	2010-02-02	90901	\N	68414	\N
93814	GENERIC_DAY	0	2	2010-02-03	1220	\N	68414	\N
93815	GENERIC_DAY	0	1	2010-01-27	1230	\N	68414	\N
93816	GENERIC_DAY	0	0	2010-01-15	1230	\N	68414	\N
93817	GENERIC_DAY	0	2	2010-02-09	1230	\N	68414	\N
93818	GENERIC_DAY	0	0	2010-01-04	1217	\N	68414	\N
93819	GENERIC_DAY	0	0	2010-01-27	90901	\N	68414	\N
93820	GENERIC_DAY	0	0	2010-01-10	90901	\N	68414	\N
93821	GENERIC_DAY	0	0	2010-01-09	1220	\N	68414	\N
93822	GENERIC_DAY	0	1	2010-01-22	1220	\N	68414	\N
93823	GENERIC_DAY	0	4	2010-01-12	90901	\N	68414	\N
93824	GENERIC_DAY	0	0	2009-12-30	1230	\N	68414	\N
93825	GENERIC_DAY	0	0	2009-12-25	1220	\N	68414	\N
93826	GENERIC_DAY	0	6	2009-12-28	90901	\N	68414	\N
93827	GENERIC_DAY	0	0	2010-01-15	1228	\N	68414	\N
93828	GENERIC_DAY	0	0	2010-01-24	1228	\N	68414	\N
93829	GENERIC_DAY	0	0	2010-02-06	1228	\N	68414	\N
93830	GENERIC_DAY	0	0	2009-12-20	1220	\N	68414	\N
93831	GENERIC_DAY	0	0	2010-02-06	90901	\N	68414	\N
93832	GENERIC_DAY	0	0	2010-02-01	1230	\N	68414	\N
93833	GENERIC_DAY	0	2	2010-02-10	1228	\N	68414	\N
93834	GENERIC_DAY	0	4	2010-02-05	90901	\N	68414	\N
93835	GENERIC_DAY	0	1	2009-12-18	1228	\N	68414	\N
93836	GENERIC_DAY	0	0	2010-01-23	1220	\N	68414	\N
93837	GENERIC_DAY	0	1	2010-02-09	90901	\N	68414	\N
93838	GENERIC_DAY	0	2	2010-01-19	1217	\N	68414	\N
93839	GENERIC_DAY	0	1	2010-01-18	1220	\N	68414	\N
93840	GENERIC_DAY	0	6	2010-01-06	90901	\N	68414	\N
93841	GENERIC_DAY	0	0	2010-01-30	1220	\N	68414	\N
93842	GENERIC_DAY	0	0	2009-12-24	1228	\N	68414	\N
93843	GENERIC_DAY	0	1	2010-01-19	1220	\N	60752	\N
93844	GENERIC_DAY	0	0	2010-01-17	1220	\N	60752	\N
93845	GENERIC_DAY	0	0	2010-01-16	90901	\N	60752	\N
93846	GENERIC_DAY	0	1	2010-01-18	1217	\N	60752	\N
93847	GENERIC_DAY	0	2	2010-01-20	1220	\N	60752	\N
93848	GENERIC_DAY	0	0	2010-01-16	1217	\N	60752	\N
93849	GENERIC_DAY	0	3	2010-01-20	1228	\N	60752	\N
93850	GENERIC_DAY	0	0	2010-01-17	1228	\N	60752	\N
93851	GENERIC_DAY	0	0	2010-01-17	1230	\N	60752	\N
93852	GENERIC_DAY	0	0	2010-01-16	1220	\N	60752	\N
93853	GENERIC_DAY	0	0	2010-01-18	90901	\N	60752	\N
93854	GENERIC_DAY	0	0	2010-01-17	1217	\N	60752	\N
93855	GENERIC_DAY	0	2	2010-01-19	1217	\N	60752	\N
93856	GENERIC_DAY	0	2	2010-01-19	1228	\N	60752	\N
93857	GENERIC_DAY	0	0	2010-01-16	1228	\N	60752	\N
93858	GENERIC_DAY	0	2	2010-01-18	1230	\N	60752	\N
93859	GENERIC_DAY	0	0	2010-01-16	1230	\N	60752	\N
93860	GENERIC_DAY	0	3	2010-01-18	1220	\N	60752	\N
93861	GENERIC_DAY	0	1	2010-01-20	1217	\N	60752	\N
93862	GENERIC_DAY	0	2	2010-01-18	1228	\N	60752	\N
93863	GENERIC_DAY	0	0	2010-01-20	90901	\N	60752	\N
93864	GENERIC_DAY	0	0	2010-01-17	90901	\N	60752	\N
93865	GENERIC_DAY	0	2	2010-01-20	1230	\N	60752	\N
93866	GENERIC_DAY	0	1	2010-01-19	90901	\N	60752	\N
93867	GENERIC_DAY	0	2	2010-01-19	1230	\N	60752	\N
93868	GENERIC_DAY	0	3	2010-02-04	1228	\N	60753	\N
93869	GENERIC_DAY	0	0	2010-02-08	90901	\N	60753	\N
93870	GENERIC_DAY	0	0	2010-01-31	1220	\N	60753	\N
93871	GENERIC_DAY	0	1	2010-02-08	1217	\N	60753	\N
93872	GENERIC_DAY	0	0	2010-02-06	1220	\N	60753	\N
93873	GENERIC_DAY	0	2	2010-02-04	1220	\N	60753	\N
93874	GENERIC_DAY	0	1	2010-02-01	90901	\N	60753	\N
93875	GENERIC_DAY	0	2	2010-02-05	1220	\N	60753	\N
93876	GENERIC_DAY	0	0	2010-01-30	1217	\N	60753	\N
93877	GENERIC_DAY	0	0	2010-02-03	90901	\N	60753	\N
93878	GENERIC_DAY	0	0	2010-01-31	1217	\N	60753	\N
93879	GENERIC_DAY	0	2	2010-02-04	1230	\N	60753	\N
93880	GENERIC_DAY	0	3	2010-02-01	1228	\N	60753	\N
93881	GENERIC_DAY	0	1	2010-02-03	1217	\N	60753	\N
93882	GENERIC_DAY	0	2	2010-02-02	1220	\N	60753	\N
93883	GENERIC_DAY	0	0	2010-02-07	1220	\N	60753	\N
93884	GENERIC_DAY	0	2	2010-02-03	1230	\N	60753	\N
93885	GENERIC_DAY	0	0	2010-02-05	90901	\N	60753	\N
93886	GENERIC_DAY	0	3	2010-02-08	1228	\N	60753	\N
93887	GENERIC_DAY	0	0	2010-02-06	1217	\N	60753	\N
93888	GENERIC_DAY	0	2	2010-02-03	1220	\N	60753	\N
93889	GENERIC_DAY	0	0	2010-01-31	90901	\N	60753	\N
93890	GENERIC_DAY	0	0	2010-01-30	1230	\N	60753	\N
93891	GENERIC_DAY	0	3	2010-02-03	1228	\N	60753	\N
93892	GENERIC_DAY	0	0	2010-02-04	90901	\N	60753	\N
93893	GENERIC_DAY	0	0	2010-01-30	90901	\N	60753	\N
93894	GENERIC_DAY	0	1	2010-02-02	1217	\N	60753	\N
93895	GENERIC_DAY	0	0	2010-01-31	1230	\N	60753	\N
93896	GENERIC_DAY	0	0	2010-01-31	1228	\N	60753	\N
93897	GENERIC_DAY	0	1	2010-02-02	1230	\N	60753	\N
93898	GENERIC_DAY	0	1	2010-02-04	1217	\N	60753	\N
93899	GENERIC_DAY	0	2	2010-02-08	1220	\N	60753	\N
93900	GENERIC_DAY	0	0	2010-02-06	1230	\N	60753	\N
93901	GENERIC_DAY	0	3	2010-02-02	1228	\N	60753	\N
93902	GENERIC_DAY	0	0	2010-02-07	1228	\N	60753	\N
93903	GENERIC_DAY	0	2	2010-02-01	1220	\N	60753	\N
93904	GENERIC_DAY	0	0	2010-01-30	1220	\N	60753	\N
93905	GENERIC_DAY	0	1	2010-02-01	1217	\N	60753	\N
93906	GENERIC_DAY	0	0	2010-02-06	1228	\N	60753	\N
93907	GENERIC_DAY	0	3	2010-02-05	1228	\N	60753	\N
93908	GENERIC_DAY	0	1	2010-02-05	1217	\N	60753	\N
93909	GENERIC_DAY	0	1	2010-02-01	1230	\N	60753	\N
93910	GENERIC_DAY	0	0	2010-02-07	90901	\N	60753	\N
93911	GENERIC_DAY	0	0	2010-02-07	1230	\N	60753	\N
93912	GENERIC_DAY	0	0	2010-01-30	1228	\N	60753	\N
93913	GENERIC_DAY	0	1	2010-02-02	90901	\N	60753	\N
93914	GENERIC_DAY	0	2	2010-02-08	1230	\N	60753	\N
93915	GENERIC_DAY	0	0	2010-02-06	90901	\N	60753	\N
93916	GENERIC_DAY	0	0	2010-02-07	1217	\N	60753	\N
93917	GENERIC_DAY	0	2	2010-02-05	1230	\N	60753	\N
93918	GENERIC_DAY	0	1	2010-01-07	1228	\N	60754	\N
93919	GENERIC_DAY	0	2	2010-01-04	1228	\N	60754	\N
93920	GENERIC_DAY	0	0	2010-01-03	1217	\N	60754	\N
93921	GENERIC_DAY	0	2	2010-01-06	1220	\N	60754	\N
93922	GENERIC_DAY	0	0	2010-01-04	90901	\N	60754	\N
93923	GENERIC_DAY	0	3	2010-01-05	1220	\N	60754	\N
93924	GENERIC_DAY	0	2	2010-01-06	1228	\N	60754	\N
93925	GENERIC_DAY	0	0	2010-01-07	90901	\N	60754	\N
93926	GENERIC_DAY	0	1	2010-01-04	1217	\N	60754	\N
93927	GENERIC_DAY	0	0	2010-01-02	1217	\N	60754	\N
93928	GENERIC_DAY	0	2	2010-01-05	1228	\N	60754	\N
93929	GENERIC_DAY	0	0	2010-01-03	90901	\N	60754	\N
93930	GENERIC_DAY	0	0	2010-01-02	1220	\N	60754	\N
93931	GENERIC_DAY	0	0	2010-01-05	90901	\N	60754	\N
93932	GENERIC_DAY	0	2	2010-01-06	1230	\N	60754	\N
93933	GENERIC_DAY	0	2	2010-01-05	1230	\N	60754	\N
93934	GENERIC_DAY	0	1	2010-01-07	1220	\N	60754	\N
93935	GENERIC_DAY	0	2	2010-01-06	1217	\N	60754	\N
93936	GENERIC_DAY	0	0	2010-01-02	1230	\N	60754	\N
93937	GENERIC_DAY	0	0	2010-01-03	1230	\N	60754	\N
93938	GENERIC_DAY	0	1	2010-01-07	1230	\N	60754	\N
93939	GENERIC_DAY	0	3	2010-01-04	1220	\N	60754	\N
93940	GENERIC_DAY	0	0	2010-01-03	1228	\N	60754	\N
93941	GENERIC_DAY	0	1	2010-01-07	1217	\N	60754	\N
93942	GENERIC_DAY	0	0	2010-01-06	90901	\N	60754	\N
93943	GENERIC_DAY	0	0	2010-01-03	1220	\N	60754	\N
93944	GENERIC_DAY	0	1	2010-01-05	1217	\N	60754	\N
93945	GENERIC_DAY	0	0	2010-01-02	90901	\N	60754	\N
93946	GENERIC_DAY	0	2	2010-01-04	1230	\N	60754	\N
93947	GENERIC_DAY	0	0	2010-01-02	1228	\N	60754	\N
93948	GENERIC_DAY	0	0	2010-01-04	1230	\N	60705	\N
93949	GENERIC_DAY	0	0	2010-01-06	1217	\N	60705	\N
93950	GENERIC_DAY	0	0	2010-01-03	1228	\N	60705	\N
93951	GENERIC_DAY	0	0	2010-01-10	1220	\N	60705	\N
93952	GENERIC_DAY	0	0	2010-01-01	1220	\N	60705	\N
93953	GENERIC_DAY	0	2	2009-12-24	1217	\N	60705	\N
93954	GENERIC_DAY	0	1	2009-12-29	1228	\N	60705	\N
93955	GENERIC_DAY	0	0	2010-01-10	90901	\N	60705	\N
93956	GENERIC_DAY	0	0	2010-01-09	1217	\N	60705	\N
93957	GENERIC_DAY	0	1	2009-12-25	1230	\N	60705	\N
93958	GENERIC_DAY	0	6	2009-12-29	90901	\N	60705	\N
93959	GENERIC_DAY	0	1	2009-12-30	1228	\N	60705	\N
93960	GENERIC_DAY	0	0	2010-01-05	1220	\N	60705	\N
93961	GENERIC_DAY	0	0	2009-12-27	1217	\N	60705	\N
93962	GENERIC_DAY	0	0	2009-12-28	1228	\N	60705	\N
93963	GENERIC_DAY	0	2	2010-01-11	1230	\N	60705	\N
93964	GENERIC_DAY	0	0	2010-01-05	1230	\N	60705	\N
93965	GENERIC_DAY	0	0	2009-12-27	1230	\N	60705	\N
93966	GENERIC_DAY	0	0	2010-01-01	1230	\N	60705	\N
93967	GENERIC_DAY	0	2	2009-12-24	1220	\N	60705	\N
93968	GENERIC_DAY	0	0	2010-01-01	1228	\N	60705	\N
93969	GENERIC_DAY	0	0	2009-12-28	1220	\N	60705	\N
93970	GENERIC_DAY	0	0	2010-01-09	1230	\N	60705	\N
93971	GENERIC_DAY	0	0	2010-01-01	1217	\N	60705	\N
93972	GENERIC_DAY	0	0	2010-01-07	1220	\N	60705	\N
93973	GENERIC_DAY	0	1	2009-12-29	1230	\N	60705	\N
93974	GENERIC_DAY	0	0	2010-01-03	1230	\N	60705	\N
93975	GENERIC_DAY	0	0	2009-12-26	1230	\N	60705	\N
93976	GENERIC_DAY	0	0	2009-12-31	1228	\N	60705	\N
93977	GENERIC_DAY	0	0	2010-01-03	1217	\N	60705	\N
93978	GENERIC_DAY	0	0	2010-01-10	1217	\N	60705	\N
93979	GENERIC_DAY	0	2	2009-12-22	1217	\N	60705	\N
93980	GENERIC_DAY	0	0	2010-01-03	90901	\N	60705	\N
93981	GENERIC_DAY	0	0	2010-01-06	1230	\N	60705	\N
93982	GENERIC_DAY	0	8	2010-01-06	90901	\N	60705	\N
93983	GENERIC_DAY	0	0	2009-12-24	90901	\N	60705	\N
93984	GENERIC_DAY	0	0	2009-12-29	1220	\N	60705	\N
93985	GENERIC_DAY	0	0	2010-01-03	1220	\N	60705	\N
93986	GENERIC_DAY	0	8	2010-01-04	90901	\N	60705	\N
93987	GENERIC_DAY	0	0	2010-01-06	1228	\N	60705	\N
93988	GENERIC_DAY	0	2	2009-12-24	1230	\N	60705	\N
93989	GENERIC_DAY	0	0	2009-12-28	1217	\N	60705	\N
93990	GENERIC_DAY	0	0	2010-01-02	1228	\N	60705	\N
93991	GENERIC_DAY	0	0	2010-01-02	1230	\N	60705	\N
93992	GENERIC_DAY	0	1	2010-01-11	1217	\N	60705	\N
93993	GENERIC_DAY	0	0	2010-01-07	1228	\N	60705	\N
93994	GENERIC_DAY	0	0	2010-01-08	1217	\N	60705	\N
93995	GENERIC_DAY	0	2	2010-01-11	1220	\N	60705	\N
93996	GENERIC_DAY	0	0	2009-12-30	1220	\N	60705	\N
93997	GENERIC_DAY	0	3	2010-01-11	1228	\N	60705	\N
93998	GENERIC_DAY	0	0	2009-12-29	1217	\N	60705	\N
93999	GENERIC_DAY	0	0	2009-12-31	1230	\N	60705	\N
94000	GENERIC_DAY	0	0	2010-01-02	1220	\N	60705	\N
94001	GENERIC_DAY	0	0	2010-01-07	1230	\N	60705	\N
94002	GENERIC_DAY	0	8	2010-01-01	90901	\N	60705	\N
94003	GENERIC_DAY	0	8	2009-12-31	90901	\N	60705	\N
94004	GENERIC_DAY	0	2	2009-12-22	1228	\N	60705	\N
94005	GENERIC_DAY	0	0	2010-01-06	1220	\N	60705	\N
94006	GENERIC_DAY	0	0	2009-12-26	1217	\N	60705	\N
94007	GENERIC_DAY	0	0	2010-01-02	1217	\N	60705	\N
94008	GENERIC_DAY	0	0	2010-01-04	1220	\N	60705	\N
94009	GENERIC_DAY	0	0	2010-01-08	1230	\N	60705	\N
94010	GENERIC_DAY	0	0	2010-01-10	1230	\N	60705	\N
94011	GENERIC_DAY	0	0	2010-01-09	1220	\N	60705	\N
94012	GENERIC_DAY	0	8	2010-01-05	90901	\N	60705	\N
94013	GENERIC_DAY	0	0	2010-01-05	1217	\N	60705	\N
94014	GENERIC_DAY	0	0	2009-12-27	1228	\N	60705	\N
94015	GENERIC_DAY	0	8	2010-01-08	90901	\N	60705	\N
94016	GENERIC_DAY	0	6	2009-12-30	90901	\N	60705	\N
94017	GENERIC_DAY	0	2	2009-12-23	1217	\N	60705	\N
94018	GENERIC_DAY	0	0	2009-12-23	90901	\N	60705	\N
94019	GENERIC_DAY	0	0	2010-01-09	90901	\N	60705	\N
94020	GENERIC_DAY	0	1	2009-12-25	1228	\N	60705	\N
94021	GENERIC_DAY	0	2	2009-12-24	1228	\N	60705	\N
94022	GENERIC_DAY	0	0	2010-01-08	1220	\N	60705	\N
94023	GENERIC_DAY	0	2	2009-12-23	1230	\N	60705	\N
94024	GENERIC_DAY	0	0	2010-01-09	1228	\N	60705	\N
94025	GENERIC_DAY	0	0	2009-12-26	90901	\N	60705	\N
94026	GENERIC_DAY	0	1	2009-12-30	1217	\N	60705	\N
94027	GENERIC_DAY	0	0	2009-12-27	90901	\N	60705	\N
94028	GENERIC_DAY	0	0	2009-12-26	1220	\N	60705	\N
94029	GENERIC_DAY	0	0	2010-01-07	1217	\N	60705	\N
94030	GENERIC_DAY	0	0	2009-12-31	1217	\N	60705	\N
94031	GENERIC_DAY	0	2	2009-12-23	1228	\N	60705	\N
94032	GENERIC_DAY	0	8	2010-01-07	90901	\N	60705	\N
94033	GENERIC_DAY	0	0	2010-01-05	1228	\N	60705	\N
94034	GENERIC_DAY	0	4	2009-12-25	90901	\N	60705	\N
94035	GENERIC_DAY	0	0	2009-12-25	1217	\N	60705	\N
94036	GENERIC_DAY	0	0	2009-12-31	1220	\N	60705	\N
94037	GENERIC_DAY	0	2	2009-12-22	1230	\N	60705	\N
94038	GENERIC_DAY	0	8	2009-12-28	90901	\N	60705	\N
94039	GENERIC_DAY	0	0	2009-12-28	1230	\N	60705	\N
94040	GENERIC_DAY	0	0	2009-12-22	90901	\N	60705	\N
94041	GENERIC_DAY	0	0	2010-01-10	1228	\N	60705	\N
94042	GENERIC_DAY	0	0	2010-01-04	1228	\N	60705	\N
94043	GENERIC_DAY	0	0	2010-01-08	1228	\N	60705	\N
94044	GENERIC_DAY	0	0	2009-12-26	1228	\N	60705	\N
94045	GENERIC_DAY	0	2	2009-12-25	1220	\N	60705	\N
94046	GENERIC_DAY	0	2	2009-12-23	1220	\N	60705	\N
94047	GENERIC_DAY	0	0	2010-01-11	90901	\N	60705	\N
94048	GENERIC_DAY	0	0	2009-12-30	1230	\N	60705	\N
94049	GENERIC_DAY	0	0	2010-01-02	90901	\N	60705	\N
94050	GENERIC_DAY	0	0	2010-01-04	1217	\N	60705	\N
94051	GENERIC_DAY	0	0	2009-12-27	1220	\N	60705	\N
94052	GENERIC_DAY	0	2	2009-12-22	1220	\N	60705	\N
94053	GENERIC_DAY	0	2	2009-12-30	1230	\N	60791	\N
94054	GENERIC_DAY	0	0	2010-01-02	1228	\N	60791	\N
94055	GENERIC_DAY	0	0	2009-12-26	1220	\N	60791	\N
94056	GENERIC_DAY	0	2	2009-12-31	1220	\N	60791	\N
94057	GENERIC_DAY	0	2	2009-12-30	1228	\N	60791	\N
94058	GENERIC_DAY	0	2	2009-12-28	1230	\N	60791	\N
94059	GENERIC_DAY	0	2	2009-12-28	1228	\N	60791	\N
94060	GENERIC_DAY	0	6	2010-01-05	90901	\N	60791	\N
94061	GENERIC_DAY	0	6	2010-01-04	90901	\N	60791	\N
94062	GENERIC_DAY	0	1	2010-01-06	1228	\N	60791	\N
94063	GENERIC_DAY	0	0	2010-01-03	1230	\N	60791	\N
94064	GENERIC_DAY	0	0	2009-12-27	1230	\N	60791	\N
94065	GENERIC_DAY	0	2	2009-12-29	1220	\N	60791	\N
94066	GENERIC_DAY	0	0	2009-12-27	1220	\N	60791	\N
94067	GENERIC_DAY	0	2	2010-01-01	1217	\N	60791	\N
94068	GENERIC_DAY	0	2	2009-12-29	1230	\N	60791	\N
94069	GENERIC_DAY	0	0	2009-12-27	90901	\N	60791	\N
94070	GENERIC_DAY	0	0	2009-12-30	90901	\N	60791	\N
94071	GENERIC_DAY	0	2	2010-01-01	1220	\N	60791	\N
94072	GENERIC_DAY	0	0	2010-01-05	1220	\N	60791	\N
94073	GENERIC_DAY	0	0	2009-12-26	1217	\N	60791	\N
94074	GENERIC_DAY	0	0	2010-01-03	1217	\N	60791	\N
94075	GENERIC_DAY	0	0	2010-01-06	1230	\N	60791	\N
94076	GENERIC_DAY	0	2	2009-12-29	1228	\N	60791	\N
94077	GENERIC_DAY	0	2	2009-12-30	1217	\N	60791	\N
94078	GENERIC_DAY	0	0	2010-01-05	1230	\N	60791	\N
94079	GENERIC_DAY	0	0	2010-01-03	90901	\N	60791	\N
94080	GENERIC_DAY	0	0	2010-01-03	1228	\N	60791	\N
94081	GENERIC_DAY	0	0	2010-01-02	90901	\N	60791	\N
94082	GENERIC_DAY	0	0	2009-12-26	1230	\N	60791	\N
94083	GENERIC_DAY	0	1	2010-01-05	1228	\N	60791	\N
94084	GENERIC_DAY	0	2	2009-12-30	1220	\N	60791	\N
94085	GENERIC_DAY	0	1	2010-01-05	1217	\N	60791	\N
94086	GENERIC_DAY	0	2	2009-12-28	1217	\N	60791	\N
94087	GENERIC_DAY	0	0	2009-12-27	1228	\N	60791	\N
94088	GENERIC_DAY	0	0	2009-12-29	90901	\N	60791	\N
94089	GENERIC_DAY	0	0	2010-01-06	1220	\N	60791	\N
94090	GENERIC_DAY	0	1	2010-01-04	1217	\N	60791	\N
94091	GENERIC_DAY	0	0	2009-12-31	90901	\N	60791	\N
94092	GENERIC_DAY	0	2	2009-12-29	1217	\N	60791	\N
94093	GENERIC_DAY	0	0	2010-01-02	1220	\N	60791	\N
94094	GENERIC_DAY	0	0	2010-01-03	1220	\N	60791	\N
94095	GENERIC_DAY	0	2	2009-12-31	1217	\N	60791	\N
94096	GENERIC_DAY	0	2	2010-01-01	1230	\N	60791	\N
94097	GENERIC_DAY	0	2	2009-12-28	1220	\N	60791	\N
94098	GENERIC_DAY	0	0	2010-01-04	1220	\N	60791	\N
94099	GENERIC_DAY	0	2	2009-12-31	1228	\N	60791	\N
94100	GENERIC_DAY	0	0	2010-01-02	1230	\N	60791	\N
94101	GENERIC_DAY	0	0	2010-01-02	1217	\N	60791	\N
94102	GENERIC_DAY	0	0	2010-01-01	90901	\N	60791	\N
94103	GENERIC_DAY	0	2	2010-01-01	1228	\N	60791	\N
94104	GENERIC_DAY	0	1	2010-01-06	1217	\N	60791	\N
94105	GENERIC_DAY	0	0	2009-12-26	1228	\N	60791	\N
94106	GENERIC_DAY	0	0	2009-12-27	1217	\N	60791	\N
94107	GENERIC_DAY	0	0	2009-12-26	90901	\N	60791	\N
94108	GENERIC_DAY	0	2	2009-12-31	1230	\N	60791	\N
94109	GENERIC_DAY	0	6	2010-01-06	90901	\N	60791	\N
94110	GENERIC_DAY	0	1	2010-01-04	1228	\N	60791	\N
94111	GENERIC_DAY	0	0	2009-12-28	90901	\N	60791	\N
94112	GENERIC_DAY	0	0	2010-01-04	1230	\N	60791	\N
94113	GENERIC_DAY	0	0	2010-01-03	90901	\N	58450	\N
94114	GENERIC_DAY	0	1	2010-01-01	1217	\N	58450	\N
94115	GENERIC_DAY	0	0	2010-01-04	90901	\N	58450	\N
94116	GENERIC_DAY	0	0	2010-01-02	1230	\N	58450	\N
94117	GENERIC_DAY	0	0	2010-01-03	1230	\N	58450	\N
94118	GENERIC_DAY	0	0	2010-01-02	1228	\N	58450	\N
94119	GENERIC_DAY	0	2	2010-01-01	1228	\N	58450	\N
94120	GENERIC_DAY	0	0	2010-01-02	1220	\N	58450	\N
94121	GENERIC_DAY	0	2	2010-01-04	1230	\N	58450	\N
94122	GENERIC_DAY	0	0	2010-01-03	1217	\N	58450	\N
94123	GENERIC_DAY	0	3	2010-01-01	1220	\N	58450	\N
94124	GENERIC_DAY	0	2	2010-01-04	1228	\N	58450	\N
94125	GENERIC_DAY	0	0	2010-01-02	90901	\N	58450	\N
94126	GENERIC_DAY	0	2	2010-01-04	1220	\N	58450	\N
94127	GENERIC_DAY	0	0	2010-01-03	1220	\N	58450	\N
94128	GENERIC_DAY	0	0	2010-01-03	1228	\N	58450	\N
94129	GENERIC_DAY	0	0	2010-01-02	1217	\N	58450	\N
94130	GENERIC_DAY	0	2	2010-01-04	1217	\N	58450	\N
94131	GENERIC_DAY	0	2	2010-01-01	1230	\N	58450	\N
94132	GENERIC_DAY	0	0	2010-01-01	90901	\N	58450	\N
94133	GENERIC_DAY	0	2	2010-01-07	1230	\N	58451	\N
94134	GENERIC_DAY	0	3	2010-01-07	1220	\N	58451	\N
94135	GENERIC_DAY	0	0	2010-01-05	90901	\N	58451	\N
94136	GENERIC_DAY	0	2	2010-01-06	1228	\N	58451	\N
94137	GENERIC_DAY	0	2	2010-01-05	1228	\N	58451	\N
94138	GENERIC_DAY	0	2	2010-01-08	1230	\N	58451	\N
94139	GENERIC_DAY	0	1	2010-01-07	1217	\N	58451	\N
94140	GENERIC_DAY	0	2	2010-01-06	1217	\N	58451	\N
94141	GENERIC_DAY	0	0	2010-01-07	90901	\N	58451	\N
94142	GENERIC_DAY	0	2	2010-01-06	1230	\N	58451	\N
94143	GENERIC_DAY	0	2	2010-01-08	1217	\N	58451	\N
94144	GENERIC_DAY	0	0	2010-01-06	90901	\N	58451	\N
94145	GENERIC_DAY	0	2	2010-01-08	1220	\N	58451	\N
94146	GENERIC_DAY	0	2	2010-01-06	1220	\N	58451	\N
94147	GENERIC_DAY	0	0	2010-01-08	90901	\N	58451	\N
94148	GENERIC_DAY	0	2	2010-01-08	1228	\N	58451	\N
94149	GENERIC_DAY	0	2	2010-01-07	1228	\N	58451	\N
94150	GENERIC_DAY	0	2	2010-01-05	1230	\N	58451	\N
94151	GENERIC_DAY	0	2	2010-01-05	1220	\N	58451	\N
94152	GENERIC_DAY	0	2	2010-01-05	1217	\N	58451	\N
94153	GENERIC_DAY	0	0	2010-01-15	90901	\N	58452	\N
94154	GENERIC_DAY	0	0	2010-01-10	1228	\N	58452	\N
94155	GENERIC_DAY	0	3	2010-01-11	1220	\N	58452	\N
94156	GENERIC_DAY	0	3	2010-01-12	1220	\N	58452	\N
94157	GENERIC_DAY	0	3	2010-01-14	1220	\N	58452	\N
94158	GENERIC_DAY	0	0	2010-01-10	90901	\N	58452	\N
94159	GENERIC_DAY	0	0	2010-01-09	1220	\N	58452	\N
94160	GENERIC_DAY	0	2	2010-01-11	1230	\N	58452	\N
94161	GENERIC_DAY	0	2	2010-01-11	1228	\N	58452	\N
94162	GENERIC_DAY	0	0	2010-01-10	1230	\N	58452	\N
94163	GENERIC_DAY	0	1	2010-01-15	1217	\N	58452	\N
94164	GENERIC_DAY	0	0	2010-01-10	1220	\N	58452	\N
94165	GENERIC_DAY	0	0	2010-01-09	1230	\N	58452	\N
94166	GENERIC_DAY	0	2	2010-01-12	1228	\N	58452	\N
94167	GENERIC_DAY	0	2	2010-01-12	1230	\N	58452	\N
94168	GENERIC_DAY	0	0	2010-01-13	90901	\N	58452	\N
94169	GENERIC_DAY	0	0	2010-01-14	90901	\N	58452	\N
94170	GENERIC_DAY	0	2	2010-01-14	1230	\N	58452	\N
94171	GENERIC_DAY	0	0	2010-01-09	1217	\N	58452	\N
94172	GENERIC_DAY	0	1	2010-01-14	1217	\N	58452	\N
94173	GENERIC_DAY	0	2	2010-01-15	1230	\N	58452	\N
94174	GENERIC_DAY	0	0	2010-01-10	1217	\N	58452	\N
94175	GENERIC_DAY	0	0	2010-01-12	90901	\N	58452	\N
94176	GENERIC_DAY	0	0	2010-01-09	1228	\N	58452	\N
94177	GENERIC_DAY	0	2	2010-01-15	1228	\N	58452	\N
94178	GENERIC_DAY	0	1	2010-01-11	1217	\N	58452	\N
94179	GENERIC_DAY	0	2	2010-01-14	1228	\N	58452	\N
94180	GENERIC_DAY	0	1	2010-01-13	1217	\N	58452	\N
94181	GENERIC_DAY	0	3	2010-01-13	1220	\N	58452	\N
94182	GENERIC_DAY	0	2	2010-01-13	1230	\N	58452	\N
94183	GENERIC_DAY	0	1	2010-01-12	1217	\N	58452	\N
94184	GENERIC_DAY	0	0	2010-01-09	90901	\N	58452	\N
94185	GENERIC_DAY	0	3	2010-01-15	1220	\N	58452	\N
94186	GENERIC_DAY	0	0	2010-01-11	90901	\N	58452	\N
94187	GENERIC_DAY	0	2	2010-01-13	1228	\N	58452	\N
94188	GENERIC_DAY	0	0	2010-01-19	90901	\N	58453	\N
94189	GENERIC_DAY	0	2	2010-01-19	1228	\N	58453	\N
94190	GENERIC_DAY	0	0	2010-01-16	1228	\N	58453	\N
94191	GENERIC_DAY	0	2	2010-01-18	1228	\N	58453	\N
94192	GENERIC_DAY	0	0	2010-01-16	1230	\N	58453	\N
94193	GENERIC_DAY	0	0	2010-01-16	1217	\N	58453	\N
94194	GENERIC_DAY	0	0	2010-01-17	1217	\N	58453	\N
94195	GENERIC_DAY	0	0	2010-01-16	1220	\N	58453	\N
94196	GENERIC_DAY	0	0	2010-01-17	1230	\N	58453	\N
94197	GENERIC_DAY	0	0	2010-01-16	90901	\N	58453	\N
94198	GENERIC_DAY	0	2	2010-01-18	1217	\N	58453	\N
94199	GENERIC_DAY	0	2	2010-01-19	1230	\N	58453	\N
94200	GENERIC_DAY	0	2	2010-01-18	1220	\N	58453	\N
94201	GENERIC_DAY	0	2	2010-01-19	1217	\N	58453	\N
94202	GENERIC_DAY	0	0	2010-01-17	90901	\N	58453	\N
94203	GENERIC_DAY	0	0	2010-01-17	1220	\N	58453	\N
94204	GENERIC_DAY	0	0	2010-01-17	1228	\N	58453	\N
94205	GENERIC_DAY	0	2	2010-01-19	1220	\N	58453	\N
94206	GENERIC_DAY	0	0	2010-01-18	90901	\N	58453	\N
94207	GENERIC_DAY	0	2	2010-01-18	1230	\N	58453	\N
94208	GENERIC_DAY	0	0	2010-01-20	90901	\N	58454	\N
94209	GENERIC_DAY	0	2	2010-01-21	1220	\N	58454	\N
94210	GENERIC_DAY	0	2	2010-01-25	1220	\N	58454	\N
94211	GENERIC_DAY	0	0	2010-01-25	90901	\N	58454	\N
94212	GENERIC_DAY	0	2	2010-01-25	1230	\N	58454	\N
94213	GENERIC_DAY	0	2	2010-01-22	1220	\N	58454	\N
94214	GENERIC_DAY	0	2	2010-01-21	1230	\N	58454	\N
94215	GENERIC_DAY	0	0	2010-01-23	1220	\N	58454	\N
94216	GENERIC_DAY	0	2	2010-01-22	1230	\N	58454	\N
94217	GENERIC_DAY	0	1	2010-01-25	1217	\N	58454	\N
94218	GENERIC_DAY	0	0	2010-01-24	1230	\N	58454	\N
94219	GENERIC_DAY	0	3	2010-01-25	1228	\N	58454	\N
94220	GENERIC_DAY	0	0	2010-01-24	1228	\N	58454	\N
94221	GENERIC_DAY	0	1	2010-01-21	1217	\N	58454	\N
94222	GENERIC_DAY	0	1	2010-01-22	1217	\N	58454	\N
94223	GENERIC_DAY	0	3	2010-01-22	1228	\N	58454	\N
94224	GENERIC_DAY	0	3	2010-01-21	1228	\N	58454	\N
94225	GENERIC_DAY	0	0	2010-01-23	1228	\N	58454	\N
94226	GENERIC_DAY	0	0	2010-01-23	1217	\N	58454	\N
94227	GENERIC_DAY	0	0	2010-01-24	90901	\N	58454	\N
94228	GENERIC_DAY	0	0	2010-01-22	90901	\N	58454	\N
94229	GENERIC_DAY	0	0	2010-01-23	90901	\N	58454	\N
94230	GENERIC_DAY	0	2	2010-01-20	1230	\N	58454	\N
94231	GENERIC_DAY	0	3	2010-01-20	1220	\N	58454	\N
94232	GENERIC_DAY	0	2	2010-01-20	1228	\N	58454	\N
94233	GENERIC_DAY	0	0	2010-01-23	1230	\N	58454	\N
94234	GENERIC_DAY	0	0	2010-01-24	1220	\N	58454	\N
94235	GENERIC_DAY	0	0	2010-01-21	90901	\N	58454	\N
94236	GENERIC_DAY	0	1	2010-01-20	1217	\N	58454	\N
94237	GENERIC_DAY	0	0	2010-01-24	1217	\N	58454	\N
94238	GENERIC_DAY	0	0	2009-12-14	1230	\N	58383	\N
94239	GENERIC_DAY	0	8	2009-12-14	90901	\N	58383	\N
94240	GENERIC_DAY	0	0	2009-12-14	1228	\N	58383	\N
94241	GENERIC_DAY	0	0	2009-12-14	1217	\N	58383	\N
94242	GENERIC_DAY	0	0	2009-12-14	1220	\N	58383	\N
94243	GENERIC_DAY	0	3	2009-12-16	1228	\N	58384	\N
94244	GENERIC_DAY	0	3	2009-12-15	1228	\N	58384	\N
94245	GENERIC_DAY	0	1	2009-12-15	1220	\N	58384	\N
94246	GENERIC_DAY	0	0	2009-12-15	90901	\N	58384	\N
94247	GENERIC_DAY	0	3	2009-12-15	1230	\N	58384	\N
94248	GENERIC_DAY	0	0	2009-12-16	90901	\N	58384	\N
94249	GENERIC_DAY	0	1	2009-12-16	1220	\N	58384	\N
94250	GENERIC_DAY	0	3	2009-12-16	1230	\N	58384	\N
94251	GENERIC_DAY	0	1	2009-12-16	1217	\N	58384	\N
94252	GENERIC_DAY	0	1	2009-12-15	1217	\N	58384	\N
94253	GENERIC_DAY	0	2	2009-12-18	1228	\N	58455	\N
94254	GENERIC_DAY	0	0	2009-12-17	90901	\N	58455	\N
94255	GENERIC_DAY	0	0	2009-12-18	90901	\N	58455	\N
94256	GENERIC_DAY	0	2	2009-12-17	1230	\N	58455	\N
94257	GENERIC_DAY	0	2	2009-12-17	1220	\N	58455	\N
94258	GENERIC_DAY	0	2	2009-12-18	1217	\N	58455	\N
94259	GENERIC_DAY	0	2	2009-12-18	1230	\N	58455	\N
94260	GENERIC_DAY	0	2	2009-12-18	1220	\N	58455	\N
94261	GENERIC_DAY	0	2	2009-12-17	1228	\N	58455	\N
94262	GENERIC_DAY	0	2	2009-12-17	1217	\N	58455	\N
94263	GENERIC_DAY	0	2	2009-12-21	1230	\N	58456	\N
94264	GENERIC_DAY	0	2	2009-12-21	1228	\N	58456	\N
94265	GENERIC_DAY	0	0	2009-12-23	1228	\N	58456	\N
94266	GENERIC_DAY	0	0	2009-12-25	1217	\N	58456	\N
94267	GENERIC_DAY	0	0	2009-12-23	1230	\N	58456	\N
94268	GENERIC_DAY	0	0	2009-12-19	1228	\N	58456	\N
94269	GENERIC_DAY	0	0	2009-12-19	1230	\N	58456	\N
94270	GENERIC_DAY	0	0	2009-12-25	1228	\N	58456	\N
94271	GENERIC_DAY	0	8	2009-12-22	90901	\N	58456	\N
94272	GENERIC_DAY	0	0	2009-12-19	1217	\N	58456	\N
94273	GENERIC_DAY	0	8	2009-12-23	90901	\N	58456	\N
94274	GENERIC_DAY	0	0	2009-12-22	1217	\N	58456	\N
94275	GENERIC_DAY	0	0	2009-12-25	1230	\N	58456	\N
94276	GENERIC_DAY	0	0	2009-12-20	1217	\N	58456	\N
94277	GENERIC_DAY	0	0	2009-12-24	1217	\N	58456	\N
94278	GENERIC_DAY	0	8	2009-12-25	90901	\N	58456	\N
94279	GENERIC_DAY	0	0	2009-12-19	1220	\N	58456	\N
94280	GENERIC_DAY	0	0	2009-12-22	1220	\N	58456	\N
94281	GENERIC_DAY	0	1	2009-12-21	1220	\N	58456	\N
94282	GENERIC_DAY	0	8	2009-12-24	90901	\N	58456	\N
94283	GENERIC_DAY	0	0	2009-12-24	1228	\N	58456	\N
94284	GENERIC_DAY	0	0	2009-12-23	1220	\N	58456	\N
94285	GENERIC_DAY	0	1	2009-12-21	1217	\N	58456	\N
94286	GENERIC_DAY	0	0	2009-12-23	1217	\N	58456	\N
94287	GENERIC_DAY	0	0	2009-12-19	90901	\N	58456	\N
94288	GENERIC_DAY	0	0	2009-12-22	1228	\N	58456	\N
94289	GENERIC_DAY	0	0	2009-12-20	1220	\N	58456	\N
94290	GENERIC_DAY	0	0	2009-12-22	1230	\N	58456	\N
94291	GENERIC_DAY	0	0	2009-12-25	1220	\N	58456	\N
94292	GENERIC_DAY	0	0	2009-12-20	1230	\N	58456	\N
94293	GENERIC_DAY	0	0	2009-12-24	1220	\N	58456	\N
94294	GENERIC_DAY	0	0	2009-12-20	1228	\N	58456	\N
94295	GENERIC_DAY	0	0	2009-12-20	90901	\N	58456	\N
94296	GENERIC_DAY	0	0	2009-12-24	1230	\N	58456	\N
94297	GENERIC_DAY	0	2	2009-12-21	90901	\N	58456	\N
94298	GENERIC_DAY	0	8	2009-12-14	1224	\N	58458	\N
94299	GENERIC_DAY	0	7	2009-12-15	1224	\N	58458	\N
94300	GENERIC_DAY	0	1	2009-12-16	1217	\N	58459	\N
94301	GENERIC_DAY	0	2	2009-12-18	1228	\N	58459	\N
94302	GENERIC_DAY	0	0	2009-12-19	1230	\N	58459	\N
94303	GENERIC_DAY	0	0	2009-12-19	1217	\N	58459	\N
94304	GENERIC_DAY	0	0	2009-12-19	1220	\N	58459	\N
94305	GENERIC_DAY	0	2	2009-12-18	1220	\N	58459	\N
94306	GENERIC_DAY	0	0	2009-12-21	1228	\N	58459	\N
94307	GENERIC_DAY	0	1	2009-12-15	1217	\N	58459	\N
94308	GENERIC_DAY	0	2	2009-12-14	1230	\N	58459	\N
94309	GENERIC_DAY	0	0	2009-12-20	1228	\N	58459	\N
94310	GENERIC_DAY	0	2	2009-12-18	1230	\N	58459	\N
94311	GENERIC_DAY	0	0	2009-12-19	1228	\N	58459	\N
94312	GENERIC_DAY	0	2	2009-12-18	1217	\N	58459	\N
94313	GENERIC_DAY	0	2	2009-12-14	1220	\N	58459	\N
94314	GENERIC_DAY	0	0	2009-12-21	1230	\N	58459	\N
94315	GENERIC_DAY	0	2	2009-12-16	1228	\N	58459	\N
94316	GENERIC_DAY	0	0	2009-12-21	1220	\N	58459	\N
94317	GENERIC_DAY	0	0	2009-12-20	1230	\N	58459	\N
94318	GENERIC_DAY	0	0	2009-12-14	90901	\N	58459	\N
94319	GENERIC_DAY	0	2	2009-12-17	1228	\N	58459	\N
94320	GENERIC_DAY	0	0	2009-12-20	90901	\N	58459	\N
94321	GENERIC_DAY	0	2	2009-12-17	1220	\N	58459	\N
94322	GENERIC_DAY	0	2	2009-12-17	1230	\N	58459	\N
94323	GENERIC_DAY	0	2	2009-12-14	1228	\N	58459	\N
94324	GENERIC_DAY	0	2	2009-12-17	1217	\N	58459	\N
94325	GENERIC_DAY	0	2	2009-12-15	1228	\N	58459	\N
94326	GENERIC_DAY	0	8	2009-12-21	90901	\N	58459	\N
94327	GENERIC_DAY	0	1	2009-12-15	90901	\N	58459	\N
94328	GENERIC_DAY	0	2	2009-12-15	1230	\N	58459	\N
94329	GENERIC_DAY	0	2	2009-12-16	1220	\N	58459	\N
94330	GENERIC_DAY	0	0	2009-12-19	90901	\N	58459	\N
94331	GENERIC_DAY	0	0	2009-12-20	1220	\N	58459	\N
94332	GENERIC_DAY	0	2	2009-12-16	1230	\N	58459	\N
94333	GENERIC_DAY	0	0	2009-12-18	90901	\N	58459	\N
94334	GENERIC_DAY	0	2	2009-12-14	1217	\N	58459	\N
94335	GENERIC_DAY	0	2	2009-12-15	1220	\N	58459	\N
94336	GENERIC_DAY	0	0	2009-12-20	1217	\N	58459	\N
94337	GENERIC_DAY	0	0	2009-12-17	90901	\N	58459	\N
94338	GENERIC_DAY	0	0	2009-12-21	1217	\N	58459	\N
94339	GENERIC_DAY	0	1	2009-12-16	90901	\N	58459	\N
94340	GENERIC_DAY	0	2	2009-12-25	1220	\N	58460	\N
94341	GENERIC_DAY	0	2	2009-12-30	1228	\N	58460	\N
94342	GENERIC_DAY	0	0	2009-12-25	90901	\N	58460	\N
94343	GENERIC_DAY	0	6	2009-12-31	90901	\N	58460	\N
94344	GENERIC_DAY	0	0	2009-12-26	1217	\N	58460	\N
94345	GENERIC_DAY	0	0	2009-12-29	90901	\N	58460	\N
94346	GENERIC_DAY	0	2	2009-12-28	1217	\N	58460	\N
94347	GENERIC_DAY	0	2	2009-12-30	1220	\N	58460	\N
94348	GENERIC_DAY	0	2	2009-12-30	1230	\N	58460	\N
94349	GENERIC_DAY	0	2	2009-12-30	1217	\N	58460	\N
94350	GENERIC_DAY	0	2	2009-12-25	1228	\N	58460	\N
94351	GENERIC_DAY	0	0	2009-12-31	1230	\N	58460	\N
94352	GENERIC_DAY	0	2	2009-12-28	1220	\N	58460	\N
94353	GENERIC_DAY	0	2	2009-12-29	1230	\N	58460	\N
94354	GENERIC_DAY	0	0	2009-12-26	90901	\N	58460	\N
94355	GENERIC_DAY	0	0	2009-12-26	1228	\N	58460	\N
94356	GENERIC_DAY	0	0	2009-12-26	1230	\N	58460	\N
94357	GENERIC_DAY	0	0	2009-12-27	1220	\N	58460	\N
94358	GENERIC_DAY	0	2	2009-12-25	1230	\N	58460	\N
94359	GENERIC_DAY	0	0	2009-12-27	1230	\N	58460	\N
94360	GENERIC_DAY	0	2	2009-12-29	1220	\N	58460	\N
94361	GENERIC_DAY	0	2	2009-12-28	1230	\N	58460	\N
94362	GENERIC_DAY	0	2	2009-12-29	1217	\N	58460	\N
94363	GENERIC_DAY	0	2	2009-12-25	1217	\N	58460	\N
94364	GENERIC_DAY	0	1	2009-12-31	1217	\N	58460	\N
94365	GENERIC_DAY	0	0	2009-12-27	1217	\N	58460	\N
94366	GENERIC_DAY	0	0	2009-12-27	90901	\N	58460	\N
94367	GENERIC_DAY	0	2	2009-12-28	1228	\N	58460	\N
94368	GENERIC_DAY	0	2	2009-12-29	1228	\N	58460	\N
94369	GENERIC_DAY	0	0	2009-12-30	90901	\N	58460	\N
94370	GENERIC_DAY	0	0	2009-12-28	90901	\N	58460	\N
94371	GENERIC_DAY	0	0	2009-12-26	1220	\N	58460	\N
94372	GENERIC_DAY	0	1	2009-12-31	1228	\N	58460	\N
94373	GENERIC_DAY	0	0	2009-12-27	1228	\N	58460	\N
94374	GENERIC_DAY	0	0	2009-12-31	1220	\N	58460	\N
94375	SPECIFIC_DAY	0	0	2009-12-19	1217	60793	\N	\N
94376	SPECIFIC_DAY	0	2	2009-12-29	1217	60793	\N	\N
94377	SPECIFIC_DAY	0	2	2009-12-23	1217	60793	\N	\N
94378	SPECIFIC_DAY	0	0	2009-12-20	1217	60793	\N	\N
94379	SPECIFIC_DAY	0	2	2009-12-18	1217	60793	\N	\N
94380	SPECIFIC_DAY	0	2	2009-12-24	1217	60793	\N	\N
94381	SPECIFIC_DAY	0	0	2009-12-26	1217	60793	\N	\N
94382	SPECIFIC_DAY	0	2	2009-12-21	1217	60793	\N	\N
94383	SPECIFIC_DAY	0	2	2009-12-28	1217	60793	\N	\N
94384	SPECIFIC_DAY	0	0	2009-12-27	1217	60793	\N	\N
94385	SPECIFIC_DAY	0	2	2009-12-25	1217	60793	\N	\N
94386	SPECIFIC_DAY	0	2	2009-12-14	1217	60793	\N	\N
94387	SPECIFIC_DAY	0	2	2009-12-16	1217	60793	\N	\N
94388	SPECIFIC_DAY	0	2	2009-12-17	1217	60793	\N	\N
94389	SPECIFIC_DAY	0	2	2009-12-22	1217	60793	\N	\N
94390	SPECIFIC_DAY	0	2	2009-12-15	1217	60793	\N	\N
94391	SPECIFIC_DAY	0	1	2010-01-06	1217	60794	\N	\N
94392	SPECIFIC_DAY	0	0	2010-01-16	1217	60794	\N	\N
94393	SPECIFIC_DAY	0	1	2010-01-26	1217	60794	\N	\N
94394	SPECIFIC_DAY	0	1	2009-12-30	1217	60794	\N	\N
94395	SPECIFIC_DAY	0	0	2010-01-02	1217	60794	\N	\N
94396	SPECIFIC_DAY	0	1	2010-01-12	1217	60794	\N	\N
94397	SPECIFIC_DAY	0	0	2010-01-30	1217	60794	\N	\N
94398	SPECIFIC_DAY	0	1	2010-01-11	1217	60794	\N	\N
94399	SPECIFIC_DAY	0	1	2010-02-08	1217	60794	\N	\N
94400	SPECIFIC_DAY	0	1	2010-01-21	1217	60794	\N	\N
94401	SPECIFIC_DAY	0	1	2010-01-08	1217	60794	\N	\N
94402	SPECIFIC_DAY	0	1	2010-01-27	1217	60794	\N	\N
94403	SPECIFIC_DAY	0	0	2010-01-09	1217	60794	\N	\N
94404	SPECIFIC_DAY	0	1	2010-02-02	1217	60794	\N	\N
94405	SPECIFIC_DAY	0	1	2010-01-15	1217	60794	\N	\N
94406	SPECIFIC_DAY	0	0	2010-02-07	1217	60794	\N	\N
94407	SPECIFIC_DAY	0	1	2010-02-04	1217	60794	\N	\N
94408	SPECIFIC_DAY	0	1	2010-01-05	1217	60794	\N	\N
94409	SPECIFIC_DAY	0	1	2010-02-11	1217	60794	\N	\N
94410	SPECIFIC_DAY	0	1	2010-02-05	1217	60794	\N	\N
94411	SPECIFIC_DAY	0	1	2010-01-13	1217	60794	\N	\N
94412	SPECIFIC_DAY	0	1	2010-01-25	1217	60794	\N	\N
94413	SPECIFIC_DAY	0	1	2010-01-28	1217	60794	\N	\N
94414	SPECIFIC_DAY	0	0	2010-01-03	1217	60794	\N	\N
94415	SPECIFIC_DAY	0	1	2010-01-20	1217	60794	\N	\N
94416	SPECIFIC_DAY	0	0	2010-01-24	1217	60794	\N	\N
94417	SPECIFIC_DAY	0	0	2010-01-10	1217	60794	\N	\N
94418	SPECIFIC_DAY	0	1	2010-01-22	1217	60794	\N	\N
94419	SPECIFIC_DAY	0	1	2009-12-31	1217	60794	\N	\N
94420	SPECIFIC_DAY	0	1	2010-02-09	1217	60794	\N	\N
94421	SPECIFIC_DAY	0	1	2010-01-14	1217	60794	\N	\N
94422	SPECIFIC_DAY	0	0	2010-01-23	1217	60794	\N	\N
94423	SPECIFIC_DAY	0	0	2010-01-17	1217	60794	\N	\N
94424	SPECIFIC_DAY	0	1	2010-01-19	1217	60794	\N	\N
94425	SPECIFIC_DAY	0	1	2010-01-01	1217	60794	\N	\N
94426	SPECIFIC_DAY	0	1	2010-02-01	1217	60794	\N	\N
94427	SPECIFIC_DAY	0	1	2010-01-04	1217	60794	\N	\N
94428	SPECIFIC_DAY	0	1	2010-02-10	1217	60794	\N	\N
94429	SPECIFIC_DAY	0	1	2010-02-03	1217	60794	\N	\N
94430	SPECIFIC_DAY	0	0	2010-02-06	1217	60794	\N	\N
94431	SPECIFIC_DAY	0	1	2010-01-29	1217	60794	\N	\N
94432	SPECIFIC_DAY	0	1	2010-01-18	1217	60794	\N	\N
94433	SPECIFIC_DAY	0	1	2010-01-07	1217	60794	\N	\N
94434	SPECIFIC_DAY	0	0	2010-01-31	1217	60794	\N	\N
94435	GENERIC_DAY	0	0	2009-12-17	1230	\N	60758	\N
94436	GENERIC_DAY	0	0	2009-12-18	1220	\N	60758	\N
94437	GENERIC_DAY	0	2	2009-12-14	1220	\N	60758	\N
94438	GENERIC_DAY	0	0	2009-12-18	1217	\N	60758	\N
94439	GENERIC_DAY	0	0	2009-12-20	1220	\N	60758	\N
94440	GENERIC_DAY	0	0	2009-12-19	90901	\N	60758	\N
94441	GENERIC_DAY	0	0	2009-12-16	1228	\N	60758	\N
94442	GENERIC_DAY	0	0	2009-12-19	1220	\N	60758	\N
94443	GENERIC_DAY	0	0	2009-12-21	1230	\N	60758	\N
94444	GENERIC_DAY	0	0	2009-12-16	1217	\N	60758	\N
94445	GENERIC_DAY	0	0	2009-12-15	1217	\N	60758	\N
94446	GENERIC_DAY	0	0	2009-12-19	1230	\N	60758	\N
94447	GENERIC_DAY	0	0	2009-12-17	1217	\N	60758	\N
94448	GENERIC_DAY	0	0	2009-12-20	90901	\N	60758	\N
94449	GENERIC_DAY	0	2	2009-12-14	1230	\N	60758	\N
94450	GENERIC_DAY	0	0	2009-12-18	1230	\N	60758	\N
94451	GENERIC_DAY	0	0	2009-12-17	1228	\N	60758	\N
94452	GENERIC_DAY	0	0	2009-12-21	1217	\N	60758	\N
94453	GENERIC_DAY	0	8	2009-12-21	90901	\N	60758	\N
94454	GENERIC_DAY	0	0	2009-12-20	1217	\N	60758	\N
94455	GENERIC_DAY	0	0	2009-12-20	1228	\N	60758	\N
94456	GENERIC_DAY	0	0	2009-12-14	90901	\N	60758	\N
94457	GENERIC_DAY	0	2	2009-12-14	1228	\N	60758	\N
94458	GENERIC_DAY	0	0	2009-12-17	1220	\N	60758	\N
94459	GENERIC_DAY	0	0	2009-12-21	1220	\N	60758	\N
94460	GENERIC_DAY	0	0	2009-12-15	1230	\N	60758	\N
94461	GENERIC_DAY	0	7	2009-12-15	90901	\N	60758	\N
94462	GENERIC_DAY	0	8	2009-12-18	90901	\N	60758	\N
94463	GENERIC_DAY	0	2	2009-12-14	1217	\N	60758	\N
94464	GENERIC_DAY	0	0	2009-12-19	1228	\N	60758	\N
94465	GENERIC_DAY	0	0	2009-12-18	1228	\N	60758	\N
94466	GENERIC_DAY	0	0	2009-12-19	1217	\N	60758	\N
94467	GENERIC_DAY	0	1	2009-12-16	1220	\N	60758	\N
94468	GENERIC_DAY	0	0	2009-12-20	1230	\N	60758	\N
94469	GENERIC_DAY	0	0	2009-12-16	1230	\N	60758	\N
94470	GENERIC_DAY	0	1	2009-12-15	1228	\N	60758	\N
94471	GENERIC_DAY	0	0	2009-12-15	1220	\N	60758	\N
94472	GENERIC_DAY	0	7	2009-12-16	90901	\N	60758	\N
94473	GENERIC_DAY	0	8	2009-12-17	90901	\N	60758	\N
94474	GENERIC_DAY	0	0	2009-12-21	1228	\N	60758	\N
94475	GENERIC_DAY	0	2	2009-12-25	1230	\N	60795	\N
94476	GENERIC_DAY	0	0	2009-12-22	90901	\N	60795	\N
94477	GENERIC_DAY	0	2	2009-12-24	1220	\N	60795	\N
94478	GENERIC_DAY	0	2	2009-12-22	1217	\N	60795	\N
94479	GENERIC_DAY	0	2	2009-12-23	1230	\N	60795	\N
94480	GENERIC_DAY	0	2	2009-12-22	1220	\N	60795	\N
94481	GENERIC_DAY	0	0	2009-12-23	90901	\N	60795	\N
94482	GENERIC_DAY	0	2	2009-12-24	1228	\N	60795	\N
94483	GENERIC_DAY	0	0	2009-12-24	90901	\N	60795	\N
94484	GENERIC_DAY	0	2	2009-12-25	1217	\N	60795	\N
94485	GENERIC_DAY	0	2	2009-12-22	1230	\N	60795	\N
94486	GENERIC_DAY	0	2	2009-12-24	1217	\N	60795	\N
94487	GENERIC_DAY	0	2	2009-12-23	1217	\N	60795	\N
94488	GENERIC_DAY	0	2	2009-12-23	1228	\N	60795	\N
94489	GENERIC_DAY	0	2	2009-12-23	1220	\N	60795	\N
94490	GENERIC_DAY	0	2	2009-12-22	1228	\N	60795	\N
94491	GENERIC_DAY	0	0	2009-12-25	90901	\N	60795	\N
94492	GENERIC_DAY	0	2	2009-12-25	1220	\N	60795	\N
94493	GENERIC_DAY	0	2	2009-12-24	1230	\N	60795	\N
94494	GENERIC_DAY	0	2	2009-12-25	1228	\N	60795	\N
94495	GENERIC_DAY	0	2	2010-01-14	1230	\N	60706	\N
94496	GENERIC_DAY	0	2	2010-01-12	1217	\N	60706	\N
94497	GENERIC_DAY	0	2	2010-01-14	1217	\N	60706	\N
94498	GENERIC_DAY	0	2	2010-01-13	1230	\N	60706	\N
94499	GENERIC_DAY	0	2	2010-01-15	1230	\N	60706	\N
94500	GENERIC_DAY	0	0	2010-01-13	90901	\N	60706	\N
94501	GENERIC_DAY	0	2	2010-01-15	1220	\N	60706	\N
94502	GENERIC_DAY	0	2	2010-01-15	1228	\N	60706	\N
94503	GENERIC_DAY	0	2	2010-01-13	1220	\N	60706	\N
94504	GENERIC_DAY	0	0	2010-01-12	90901	\N	60706	\N
94505	GENERIC_DAY	0	2	2010-01-14	1228	\N	60706	\N
94506	GENERIC_DAY	0	0	2010-01-15	90901	\N	60706	\N
94507	GENERIC_DAY	0	2	2010-01-12	1220	\N	60706	\N
94508	GENERIC_DAY	0	2	2010-01-15	1217	\N	60706	\N
94509	GENERIC_DAY	0	2	2010-01-13	1228	\N	60706	\N
94510	GENERIC_DAY	0	2	2010-01-13	1217	\N	60706	\N
94511	GENERIC_DAY	0	2	2010-01-12	1230	\N	60706	\N
94512	GENERIC_DAY	0	2	2010-01-12	1228	\N	60706	\N
94513	GENERIC_DAY	0	2	2010-01-14	1220	\N	60706	\N
94514	GENERIC_DAY	0	0	2010-01-14	90901	\N	60706	\N
94515	GENERIC_DAY	0	0	2010-01-22	90901	\N	60755	\N
94516	GENERIC_DAY	0	0	2010-01-23	90901	\N	60755	\N
94517	GENERIC_DAY	0	0	2010-01-23	1217	\N	60755	\N
94518	GENERIC_DAY	0	0	2010-01-24	1230	\N	60755	\N
94519	GENERIC_DAY	0	3	2010-01-26	1228	\N	60755	\N
94520	GENERIC_DAY	0	3	2010-01-21	1220	\N	60755	\N
94521	GENERIC_DAY	0	0	2010-01-23	1230	\N	60755	\N
94522	GENERIC_DAY	0	0	2010-01-24	1228	\N	60755	\N
94523	GENERIC_DAY	0	2	2010-01-22	1230	\N	60755	\N
94524	GENERIC_DAY	0	0	2010-01-26	90901	\N	60755	\N
94525	GENERIC_DAY	0	3	2010-01-25	1220	\N	60755	\N
94526	GENERIC_DAY	0	0	2010-01-24	1220	\N	60755	\N
94527	GENERIC_DAY	0	1	2010-01-25	1217	\N	60755	\N
94528	GENERIC_DAY	0	2	2010-01-21	1228	\N	60755	\N
94529	GENERIC_DAY	0	2	2010-01-22	1228	\N	60755	\N
94530	GENERIC_DAY	0	0	2010-01-25	90901	\N	60755	\N
94531	GENERIC_DAY	0	0	2010-01-23	1220	\N	60755	\N
94532	GENERIC_DAY	0	2	2010-01-21	1230	\N	60755	\N
94533	GENERIC_DAY	0	2	2010-01-26	1230	\N	60755	\N
94534	GENERIC_DAY	0	0	2010-01-24	90901	\N	60755	\N
94535	GENERIC_DAY	0	1	2010-01-26	1217	\N	60755	\N
94536	GENERIC_DAY	0	3	2010-01-22	1220	\N	60755	\N
94537	GENERIC_DAY	0	2	2010-01-25	1228	\N	60755	\N
94538	GENERIC_DAY	0	2	2010-01-25	1230	\N	60755	\N
94539	GENERIC_DAY	0	2	2010-01-26	1220	\N	60755	\N
94540	GENERIC_DAY	0	1	2010-01-22	1217	\N	60755	\N
94541	GENERIC_DAY	0	1	2010-01-21	1217	\N	60755	\N
94542	GENERIC_DAY	0	0	2010-01-21	90901	\N	60755	\N
94543	GENERIC_DAY	0	0	2010-01-23	1228	\N	60755	\N
94544	GENERIC_DAY	0	0	2010-01-24	1217	\N	60755	\N
94545	GENERIC_DAY	0	0	2010-01-27	90901	\N	60751	\N
94546	GENERIC_DAY	0	2	2010-01-28	1220	\N	60751	\N
94547	GENERIC_DAY	0	2	2010-01-27	1220	\N	60751	\N
94548	GENERIC_DAY	0	3	2010-01-27	1228	\N	60751	\N
94549	GENERIC_DAY	0	2	2010-01-27	1230	\N	60751	\N
94550	GENERIC_DAY	0	0	2010-01-29	90901	\N	60751	\N
94551	GENERIC_DAY	0	2	2010-01-29	1230	\N	60751	\N
94552	GENERIC_DAY	0	2	2010-01-29	1220	\N	60751	\N
94553	GENERIC_DAY	0	3	2010-01-28	1228	\N	60751	\N
94554	GENERIC_DAY	0	0	2010-01-28	90901	\N	60751	\N
94555	GENERIC_DAY	0	3	2010-01-29	1228	\N	60751	\N
94556	GENERIC_DAY	0	1	2010-01-29	1217	\N	60751	\N
94557	GENERIC_DAY	0	1	2010-01-27	1217	\N	60751	\N
94558	GENERIC_DAY	0	1	2010-01-28	1217	\N	60751	\N
94559	GENERIC_DAY	0	2	2010-01-28	1230	\N	60751	\N
94560	GENERIC_DAY	0	0	2009-12-17	1230	\N	60703	\N
94561	GENERIC_DAY	0	0	2009-12-18	1228	\N	60703	\N
94562	GENERIC_DAY	0	0	2009-12-18	1220	\N	60703	\N
94563	GENERIC_DAY	0	8	2009-12-15	90901	\N	60703	\N
94564	GENERIC_DAY	0	0	2009-12-14	1220	\N	60703	\N
94565	GENERIC_DAY	0	0	2009-12-15	1230	\N	60703	\N
94566	GENERIC_DAY	0	0	2009-12-17	1217	\N	60703	\N
94567	GENERIC_DAY	0	8	2009-12-17	90901	\N	60703	\N
94568	GENERIC_DAY	0	8	2009-12-16	90901	\N	60703	\N
94569	GENERIC_DAY	0	0	2009-12-16	1220	\N	60703	\N
94570	GENERIC_DAY	0	0	2009-12-16	1217	\N	60703	\N
94571	GENERIC_DAY	0	8	2009-12-14	90901	\N	60703	\N
94572	GENERIC_DAY	0	0	2009-12-16	1228	\N	60703	\N
94573	GENERIC_DAY	0	0	2009-12-15	1228	\N	60703	\N
94574	GENERIC_DAY	0	0	2009-12-18	1217	\N	60703	\N
94575	GENERIC_DAY	0	0	2009-12-17	1220	\N	60703	\N
94576	GENERIC_DAY	0	0	2009-12-17	1228	\N	60703	\N
94577	GENERIC_DAY	0	0	2009-12-14	1217	\N	60703	\N
94578	GENERIC_DAY	0	0	2009-12-14	1230	\N	60703	\N
94579	GENERIC_DAY	0	0	2009-12-15	1220	\N	60703	\N
94580	GENERIC_DAY	0	0	2009-12-14	1228	\N	60703	\N
94581	GENERIC_DAY	0	8	2009-12-18	90901	\N	60703	\N
94582	GENERIC_DAY	0	0	2009-12-18	1230	\N	60703	\N
94583	GENERIC_DAY	0	0	2009-12-15	1217	\N	60703	\N
94584	GENERIC_DAY	0	0	2009-12-16	1230	\N	60703	\N
94585	GENERIC_DAY	0	0	2009-12-15	1228	\N	58470	\N
94586	GENERIC_DAY	0	0	2009-12-14	1230	\N	58470	\N
94587	GENERIC_DAY	0	0	2009-12-16	1230	\N	58470	\N
94588	GENERIC_DAY	0	8	2009-12-17	90901	\N	58470	\N
94589	GENERIC_DAY	0	0	2009-12-18	1220	\N	58470	\N
94590	GENERIC_DAY	0	0	2009-12-17	1220	\N	58470	\N
94591	GENERIC_DAY	0	0	2009-12-15	1220	\N	58470	\N
94592	GENERIC_DAY	0	8	2009-12-14	90901	\N	58470	\N
94593	GENERIC_DAY	0	0	2009-12-16	1220	\N	58470	\N
94594	GENERIC_DAY	0	0	2009-12-17	1217	\N	58470	\N
94595	GENERIC_DAY	0	0	2009-12-17	1228	\N	58470	\N
94596	GENERIC_DAY	0	0	2009-12-14	1220	\N	58470	\N
94597	GENERIC_DAY	0	0	2009-12-18	1217	\N	58470	\N
94598	GENERIC_DAY	0	0	2009-12-17	1230	\N	58470	\N
94599	GENERIC_DAY	0	0	2009-12-18	1230	\N	58470	\N
94600	GENERIC_DAY	0	0	2009-12-14	1217	\N	58470	\N
94601	GENERIC_DAY	0	0	2009-12-14	1228	\N	58470	\N
94602	GENERIC_DAY	0	0	2009-12-15	1217	\N	58470	\N
94603	GENERIC_DAY	0	0	2009-12-16	1228	\N	58470	\N
94604	GENERIC_DAY	0	0	2009-12-18	1228	\N	58470	\N
94605	GENERIC_DAY	0	0	2009-12-15	1230	\N	58470	\N
94606	GENERIC_DAY	0	0	2009-12-16	1217	\N	58470	\N
94607	GENERIC_DAY	0	8	2009-12-16	90901	\N	58470	\N
94608	GENERIC_DAY	0	8	2009-12-18	90901	\N	58470	\N
94609	GENERIC_DAY	0	8	2009-12-15	90901	\N	58470	\N
94610	GENERIC_DAY	0	0	2009-12-19	1228	\N	60704	\N
94611	GENERIC_DAY	0	2	2009-12-21	1228	\N	60704	\N
94612	GENERIC_DAY	0	0	2009-12-20	90901	\N	60704	\N
94613	GENERIC_DAY	0	2	2009-12-21	1230	\N	60704	\N
94614	GENERIC_DAY	0	0	2009-12-20	1230	\N	60704	\N
94615	GENERIC_DAY	0	0	2009-12-20	1228	\N	60704	\N
94616	GENERIC_DAY	0	0	2009-12-20	1220	\N	60704	\N
94617	GENERIC_DAY	0	1	2009-12-21	1217	\N	60704	\N
94618	GENERIC_DAY	0	0	2009-12-19	1220	\N	60704	\N
94619	GENERIC_DAY	0	0	2009-12-19	1230	\N	60704	\N
94620	GENERIC_DAY	0	0	2009-12-19	90901	\N	60704	\N
94621	GENERIC_DAY	0	0	2009-12-21	90901	\N	60704	\N
94622	GENERIC_DAY	0	3	2009-12-21	1220	\N	60704	\N
94623	GENERIC_DAY	0	0	2009-12-19	1217	\N	60704	\N
94624	GENERIC_DAY	0	0	2009-12-20	1217	\N	60704	\N
94625	GENERIC_DAY	0	1	2009-12-24	1228	\N	58461	\N
94626	GENERIC_DAY	0	4	2009-12-24	90901	\N	58461	\N
94627	GENERIC_DAY	0	0	2009-12-22	90901	\N	58461	\N
94628	GENERIC_DAY	0	2	2009-12-22	1220	\N	58461	\N
94629	GENERIC_DAY	0	2	2009-12-22	1230	\N	58461	\N
94630	GENERIC_DAY	0	2	2009-12-22	1217	\N	58461	\N
94631	GENERIC_DAY	0	0	2009-12-24	1217	\N	58461	\N
94632	GENERIC_DAY	0	2	2009-12-23	1230	\N	58461	\N
94633	GENERIC_DAY	0	2	2009-12-24	1220	\N	58461	\N
94634	GENERIC_DAY	0	0	2009-12-23	90901	\N	58461	\N
94635	GENERIC_DAY	0	2	2009-12-23	1217	\N	58461	\N
94636	GENERIC_DAY	0	2	2009-12-23	1220	\N	58461	\N
94637	GENERIC_DAY	0	2	2009-12-23	1228	\N	58461	\N
94638	GENERIC_DAY	0	2	2009-12-22	1228	\N	58461	\N
94639	GENERIC_DAY	0	1	2009-12-24	1230	\N	58461	\N
94640	GENERIC_DAY	0	0	2010-01-09	1230	\N	60756	\N
94641	GENERIC_DAY	0	2	2010-01-18	1228	\N	60756	\N
94642	GENERIC_DAY	0	0	2010-01-08	90901	\N	60756	\N
94643	GENERIC_DAY	0	2	2010-01-14	1217	\N	60756	\N
94644	GENERIC_DAY	0	2	2010-01-12	1217	\N	60756	\N
94645	GENERIC_DAY	0	0	2010-01-10	1228	\N	60756	\N
94646	GENERIC_DAY	0	2	2010-01-13	1230	\N	60756	\N
94647	GENERIC_DAY	0	2	2010-01-11	1228	\N	60756	\N
94648	GENERIC_DAY	0	0	2010-01-14	90901	\N	60756	\N
94649	GENERIC_DAY	0	2	2010-01-15	1228	\N	60756	\N
94650	GENERIC_DAY	0	0	2010-01-17	1217	\N	60756	\N
94651	GENERIC_DAY	0	0	2010-01-10	90901	\N	60756	\N
94652	GENERIC_DAY	0	2	2010-01-18	1217	\N	60756	\N
94653	GENERIC_DAY	0	2	2010-01-13	1217	\N	60756	\N
94654	GENERIC_DAY	0	0	2010-01-09	1217	\N	60756	\N
94655	GENERIC_DAY	0	2	2010-01-12	1220	\N	60756	\N
94656	GENERIC_DAY	0	2	2010-01-08	1230	\N	60756	\N
94657	GENERIC_DAY	0	2	2010-01-13	1228	\N	60756	\N
94658	GENERIC_DAY	0	2	2010-01-13	1220	\N	60756	\N
94659	GENERIC_DAY	0	0	2010-01-10	1217	\N	60756	\N
94660	GENERIC_DAY	0	2	2010-01-12	1230	\N	60756	\N
94661	GENERIC_DAY	0	0	2010-01-10	1220	\N	60756	\N
94662	GENERIC_DAY	0	2	2010-01-15	1217	\N	60756	\N
94663	GENERIC_DAY	0	2	2010-01-11	1230	\N	60756	\N
94664	GENERIC_DAY	0	0	2010-01-17	1230	\N	60756	\N
94665	GENERIC_DAY	0	2	2010-01-11	1220	\N	60756	\N
94666	GENERIC_DAY	0	0	2010-01-09	1228	\N	60756	\N
94667	GENERIC_DAY	0	0	2010-01-09	90901	\N	60756	\N
94668	GENERIC_DAY	0	2	2010-01-14	1228	\N	60756	\N
94669	GENERIC_DAY	0	0	2010-01-11	90901	\N	60756	\N
94670	GENERIC_DAY	0	2	2010-01-15	1220	\N	60756	\N
94671	GENERIC_DAY	0	0	2010-01-13	90901	\N	60756	\N
94672	GENERIC_DAY	0	2	2010-01-14	1230	\N	60756	\N
94673	GENERIC_DAY	0	2	2010-01-15	1230	\N	60756	\N
94674	GENERIC_DAY	0	0	2010-01-17	90901	\N	60756	\N
94675	GENERIC_DAY	0	2	2010-01-11	1217	\N	60756	\N
94676	GENERIC_DAY	0	0	2010-01-16	1228	\N	60756	\N
94677	GENERIC_DAY	0	2	2010-01-08	1220	\N	60756	\N
94678	GENERIC_DAY	0	2	2010-01-14	1220	\N	60756	\N
94679	GENERIC_DAY	0	2	2010-01-08	1228	\N	60756	\N
94680	GENERIC_DAY	0	2	2010-01-12	1228	\N	60756	\N
94681	GENERIC_DAY	0	0	2010-01-16	1220	\N	60756	\N
94682	GENERIC_DAY	0	1	2010-01-18	1220	\N	60756	\N
94683	GENERIC_DAY	0	0	2010-01-16	1230	\N	60756	\N
94684	GENERIC_DAY	0	0	2010-01-17	1228	\N	60756	\N
94685	GENERIC_DAY	0	0	2010-01-09	1220	\N	60756	\N
94686	GENERIC_DAY	0	0	2010-01-17	1220	\N	60756	\N
94687	GENERIC_DAY	0	0	2010-01-15	90901	\N	60756	\N
94688	GENERIC_DAY	0	0	2010-01-16	1217	\N	60756	\N
94689	GENERIC_DAY	0	1	2010-01-18	90901	\N	60756	\N
94690	GENERIC_DAY	0	0	2010-01-16	90901	\N	60756	\N
94691	GENERIC_DAY	0	2	2010-01-18	1230	\N	60756	\N
94692	GENERIC_DAY	0	0	2010-01-12	90901	\N	60756	\N
94693	GENERIC_DAY	0	0	2010-01-10	1230	\N	60756	\N
94694	GENERIC_DAY	0	2	2010-01-08	1217	\N	60756	\N
94695	GENERIC_DAY	0	2	2010-01-19	1230	\N	60757	\N
94696	GENERIC_DAY	0	2	2010-01-19	1220	\N	60757	\N
94697	GENERIC_DAY	0	2	2010-01-19	1228	\N	60757	\N
94698	GENERIC_DAY	0	0	2010-01-19	90901	\N	60757	\N
94699	GENERIC_DAY	0	2	2010-01-19	1217	\N	60757	\N
94700	GENERIC_DAY	0	2	2009-12-15	1228	\N	68415	\N
94701	GENERIC_DAY	0	2	2009-12-14	1228	\N	68415	\N
94702	GENERIC_DAY	0	2	2009-12-14	1220	\N	68415	\N
94703	GENERIC_DAY	0	0	2009-12-15	90901	\N	68415	\N
94704	GENERIC_DAY	0	0	2009-12-14	90901	\N	68415	\N
94705	GENERIC_DAY	0	2	2009-12-15	1220	\N	68415	\N
94706	GENERIC_DAY	0	2	2009-12-15	1217	\N	68415	\N
94707	GENERIC_DAY	0	2	2009-12-15	1230	\N	68415	\N
94708	GENERIC_DAY	0	2	2009-12-14	1230	\N	68415	\N
94709	GENERIC_DAY	0	2	2009-12-14	1217	\N	68415	\N
94710	GENERIC_DAY	0	2	2010-01-06	1230	\N	68416	\N
94711	GENERIC_DAY	0	2	2010-01-08	1217	\N	68416	\N
94712	GENERIC_DAY	0	2	2010-01-07	1228	\N	68416	\N
94713	GENERIC_DAY	0	0	2010-01-08	90901	\N	68416	\N
94714	GENERIC_DAY	0	2	2010-01-08	1230	\N	68416	\N
94715	GENERIC_DAY	0	2	2010-01-08	1220	\N	68416	\N
94716	GENERIC_DAY	0	2	2010-01-06	1228	\N	68416	\N
94717	GENERIC_DAY	0	0	2010-01-07	90901	\N	68416	\N
94718	GENERIC_DAY	0	3	2010-01-06	1220	\N	68416	\N
94719	GENERIC_DAY	0	2	2010-01-07	1230	\N	68416	\N
94720	GENERIC_DAY	0	2	2010-01-08	1228	\N	68416	\N
94721	GENERIC_DAY	0	0	2010-01-06	90901	\N	68416	\N
94722	GENERIC_DAY	0	2	2010-01-07	1217	\N	68416	\N
94723	GENERIC_DAY	0	1	2010-01-06	1217	\N	68416	\N
94724	GENERIC_DAY	0	2	2010-01-07	1220	\N	68416	\N
94725	GENERIC_DAY	0	0	2010-01-03	1217	\N	68417	\N
94726	GENERIC_DAY	0	2	2010-01-04	1228	\N	68417	\N
94727	GENERIC_DAY	0	2	2010-01-01	1217	\N	68417	\N
94728	GENERIC_DAY	0	0	2010-01-03	1220	\N	68417	\N
94729	GENERIC_DAY	0	0	2010-01-01	90901	\N	68417	\N
94730	GENERIC_DAY	0	0	2010-01-02	1220	\N	68417	\N
94731	GENERIC_DAY	0	2	2010-01-05	1220	\N	68417	\N
94732	GENERIC_DAY	0	2	2010-01-01	1228	\N	68417	\N
94733	GENERIC_DAY	0	0	2010-01-03	1230	\N	68417	\N
94734	GENERIC_DAY	0	0	2010-01-04	90901	\N	68417	\N
94735	GENERIC_DAY	0	0	2010-01-02	90901	\N	68417	\N
94736	GENERIC_DAY	0	0	2010-01-02	1230	\N	68417	\N
94737	GENERIC_DAY	0	2	2010-01-01	1230	\N	68417	\N
94738	GENERIC_DAY	0	2	2010-01-04	1230	\N	68417	\N
94739	GENERIC_DAY	0	0	2010-01-05	90901	\N	68417	\N
94740	GENERIC_DAY	0	2	2010-01-04	1217	\N	68417	\N
94741	GENERIC_DAY	0	2	2010-01-05	1217	\N	68417	\N
94742	GENERIC_DAY	0	0	2010-01-02	1228	\N	68417	\N
94743	GENERIC_DAY	0	0	2010-01-03	90901	\N	68417	\N
94744	GENERIC_DAY	0	2	2010-01-01	1220	\N	68417	\N
94745	GENERIC_DAY	0	2	2010-01-05	1230	\N	68417	\N
94746	GENERIC_DAY	0	2	2010-01-05	1228	\N	68417	\N
94747	GENERIC_DAY	0	2	2010-01-04	1220	\N	68417	\N
94748	GENERIC_DAY	0	0	2010-01-02	1217	\N	68417	\N
94749	GENERIC_DAY	0	0	2010-01-03	1228	\N	68417	\N
94750	GENERIC_DAY	0	3	2009-12-17	1230	\N	68418	\N
94751	GENERIC_DAY	0	0	2009-12-16	90901	\N	68418	\N
94752	GENERIC_DAY	0	2	2009-12-16	1220	\N	68418	\N
94753	GENERIC_DAY	0	3	2009-12-18	1230	\N	68418	\N
94754	GENERIC_DAY	0	1	2009-12-18	1217	\N	68418	\N
94755	GENERIC_DAY	0	0	2009-12-18	90901	\N	68418	\N
94756	GENERIC_DAY	0	1	2009-12-18	1220	\N	68418	\N
94757	GENERIC_DAY	0	2	2009-12-16	1228	\N	68418	\N
94758	GENERIC_DAY	0	1	2009-12-17	1217	\N	68418	\N
94759	GENERIC_DAY	0	0	2009-12-17	90901	\N	68418	\N
94760	GENERIC_DAY	0	3	2009-12-17	1228	\N	68418	\N
94761	GENERIC_DAY	0	2	2009-12-16	1230	\N	68418	\N
94762	GENERIC_DAY	0	2	2009-12-16	1217	\N	68418	\N
94763	GENERIC_DAY	0	1	2009-12-17	1220	\N	68418	\N
94764	GENERIC_DAY	0	3	2009-12-18	1228	\N	68418	\N
94765	GENERIC_DAY	0	0	2009-12-29	90901	\N	68419	\N
94766	GENERIC_DAY	0	2	2009-12-29	1220	\N	68419	\N
94767	GENERIC_DAY	0	2	2009-12-29	1217	\N	68419	\N
94768	GENERIC_DAY	0	2	2009-12-30	1217	\N	68419	\N
94769	GENERIC_DAY	0	0	2009-12-30	90901	\N	68419	\N
94770	GENERIC_DAY	0	2	2009-12-30	1230	\N	68419	\N
94771	GENERIC_DAY	0	2	2009-12-30	1228	\N	68419	\N
94772	GENERIC_DAY	0	2	2009-12-31	1220	\N	68419	\N
94773	GENERIC_DAY	0	2	2009-12-30	1220	\N	68419	\N
94774	GENERIC_DAY	0	2	2009-12-29	1230	\N	68419	\N
94775	GENERIC_DAY	0	2	2009-12-31	1217	\N	68419	\N
94776	GENERIC_DAY	0	2	2009-12-31	1230	\N	68419	\N
94777	GENERIC_DAY	0	2	2009-12-29	1228	\N	68419	\N
94778	GENERIC_DAY	0	0	2009-12-31	90901	\N	68419	\N
94779	GENERIC_DAY	0	2	2009-12-31	1228	\N	68419	\N
94780	GENERIC_DAY	0	0	2009-12-20	90901	\N	68420	\N
94781	GENERIC_DAY	0	2	2009-12-21	1230	\N	68420	\N
94782	GENERIC_DAY	0	0	2009-12-21	90901	\N	68420	\N
94783	GENERIC_DAY	0	0	2009-12-23	1217	\N	68420	\N
94784	GENERIC_DAY	0	0	2009-12-22	1217	\N	68420	\N
94785	GENERIC_DAY	0	0	2009-12-19	1217	\N	68420	\N
94786	GENERIC_DAY	0	2	2009-12-21	1220	\N	68420	\N
94787	GENERIC_DAY	0	1	2009-12-23	1228	\N	68420	\N
94788	GENERIC_DAY	0	0	2009-12-19	1228	\N	68420	\N
94789	GENERIC_DAY	0	2	2009-12-22	1230	\N	68420	\N
94790	GENERIC_DAY	0	0	2009-12-20	1230	\N	68420	\N
94791	GENERIC_DAY	0	4	2009-12-23	90901	\N	68420	\N
94792	GENERIC_DAY	0	2	2009-12-22	90901	\N	68420	\N
94793	GENERIC_DAY	0	2	2009-12-21	1228	\N	68420	\N
94794	GENERIC_DAY	0	0	2009-12-19	90901	\N	68420	\N
94795	GENERIC_DAY	0	0	2009-12-20	1217	\N	68420	\N
94796	GENERIC_DAY	0	0	2009-12-20	1228	\N	68420	\N
94797	GENERIC_DAY	0	1	2009-12-23	1230	\N	68420	\N
94798	GENERIC_DAY	0	0	2009-12-19	1230	\N	68420	\N
94799	GENERIC_DAY	0	0	2009-12-19	1220	\N	68420	\N
94800	GENERIC_DAY	0	2	2009-12-22	1220	\N	68420	\N
94801	GENERIC_DAY	0	2	2009-12-23	1220	\N	68420	\N
94802	GENERIC_DAY	0	0	2009-12-20	1220	\N	68420	\N
94803	GENERIC_DAY	0	2	2009-12-22	1228	\N	68420	\N
94804	GENERIC_DAY	0	2	2009-12-21	1217	\N	68420	\N
94805	GENERIC_DAY	0	2	2009-12-28	1220	\N	68421	\N
94806	GENERIC_DAY	0	2	2009-12-25	1217	\N	68421	\N
94807	GENERIC_DAY	0	2	2009-12-24	1230	\N	68421	\N
94808	GENERIC_DAY	0	0	2009-12-27	1228	\N	68421	\N
94809	GENERIC_DAY	0	0	2009-12-26	90901	\N	68421	\N
94810	GENERIC_DAY	0	0	2009-12-26	1230	\N	68421	\N
94811	GENERIC_DAY	0	0	2009-12-27	90901	\N	68421	\N
94812	GENERIC_DAY	0	2	2009-12-25	1220	\N	68421	\N
94813	GENERIC_DAY	0	0	2009-12-26	1228	\N	68421	\N
94814	GENERIC_DAY	0	0	2009-12-27	1217	\N	68421	\N
94815	GENERIC_DAY	0	2	2009-12-28	1217	\N	68421	\N
94816	GENERIC_DAY	0	0	2009-12-25	90901	\N	68421	\N
94817	GENERIC_DAY	0	2	2009-12-24	1220	\N	68421	\N
94818	GENERIC_DAY	0	2	2009-12-25	1228	\N	68421	\N
94819	GENERIC_DAY	0	2	2009-12-28	1228	\N	68421	\N
94820	GENERIC_DAY	0	0	2009-12-26	1217	\N	68421	\N
94821	GENERIC_DAY	0	2	2009-12-24	1228	\N	68421	\N
94822	GENERIC_DAY	0	0	2009-12-28	90901	\N	68421	\N
94823	GENERIC_DAY	0	2	2009-12-24	1217	\N	68421	\N
94824	GENERIC_DAY	0	0	2009-12-24	90901	\N	68421	\N
94825	GENERIC_DAY	0	0	2009-12-26	1220	\N	68421	\N
94826	GENERIC_DAY	0	2	2009-12-25	1230	\N	68421	\N
94827	GENERIC_DAY	0	2	2009-12-28	1230	\N	68421	\N
94828	GENERIC_DAY	0	0	2009-12-27	1220	\N	68421	\N
94829	GENERIC_DAY	0	0	2009-12-27	1230	\N	68421	\N
94830	GENERIC_DAY	0	0	2009-12-25	90901	\N	68422	\N
94831	GENERIC_DAY	0	2	2009-12-24	1228	\N	68422	\N
94832	GENERIC_DAY	0	0	2009-12-26	1228	\N	68422	\N
94833	GENERIC_DAY	0	2	2009-12-28	1230	\N	68422	\N
94834	GENERIC_DAY	0	2	2009-12-25	1228	\N	68422	\N
94835	GENERIC_DAY	0	2	2009-12-25	1230	\N	68422	\N
94836	GENERIC_DAY	0	0	2009-12-28	90901	\N	68422	\N
94837	GENERIC_DAY	0	2	2009-12-25	1220	\N	68422	\N
94838	GENERIC_DAY	0	2	2009-12-28	1228	\N	68422	\N
94839	GENERIC_DAY	0	2	2009-12-28	1217	\N	68422	\N
94840	GENERIC_DAY	0	0	2009-12-27	1220	\N	68422	\N
94841	GENERIC_DAY	0	2	2009-12-24	1217	\N	68422	\N
94842	GENERIC_DAY	0	0	2009-12-27	1230	\N	68422	\N
94843	GENERIC_DAY	0	2	2009-12-24	1220	\N	68422	\N
94844	GENERIC_DAY	0	2	2009-12-25	1217	\N	68422	\N
94845	GENERIC_DAY	0	0	2009-12-24	90901	\N	68422	\N
94846	GENERIC_DAY	0	0	2009-12-26	1220	\N	68422	\N
94847	GENERIC_DAY	0	2	2009-12-24	1230	\N	68422	\N
94848	GENERIC_DAY	0	0	2009-12-27	1228	\N	68422	\N
94849	GENERIC_DAY	0	2	2009-12-28	1220	\N	68422	\N
94850	GENERIC_DAY	0	0	2009-12-27	1217	\N	68422	\N
94851	GENERIC_DAY	0	0	2009-12-26	1230	\N	68422	\N
94852	GENERIC_DAY	0	0	2009-12-27	90901	\N	68422	\N
94853	GENERIC_DAY	0	0	2009-12-26	1217	\N	68422	\N
94854	GENERIC_DAY	0	0	2009-12-26	90901	\N	68422	\N
94855	GENERIC_DAY	0	0	2009-12-20	1220	\N	68423	\N
94856	GENERIC_DAY	0	2	2009-12-21	1228	\N	68423	\N
94857	GENERIC_DAY	0	2	2009-12-22	1220	\N	68423	\N
94858	GENERIC_DAY	0	0	2009-12-19	1220	\N	68423	\N
94859	GENERIC_DAY	0	0	2009-12-20	90901	\N	68423	\N
94860	GENERIC_DAY	0	2	2009-12-21	1220	\N	68423	\N
94861	GENERIC_DAY	0	0	2009-12-19	90901	\N	68423	\N
94862	GENERIC_DAY	0	2	2009-12-23	1220	\N	68423	\N
94863	GENERIC_DAY	0	0	2009-12-20	1217	\N	68423	\N
94864	GENERIC_DAY	0	0	2009-12-19	1228	\N	68423	\N
94865	GENERIC_DAY	0	2	2009-12-23	1217	\N	68423	\N
94866	GENERIC_DAY	0	2	2009-12-23	1230	\N	68423	\N
94867	GENERIC_DAY	0	0	2009-12-21	90901	\N	68423	\N
94868	GENERIC_DAY	0	2	2009-12-22	1217	\N	68423	\N
94869	GENERIC_DAY	0	2	2009-12-21	1230	\N	68423	\N
94870	GENERIC_DAY	0	0	2009-12-20	1228	\N	68423	\N
94871	GENERIC_DAY	0	0	2009-12-20	1230	\N	68423	\N
94872	GENERIC_DAY	0	2	2009-12-21	1217	\N	68423	\N
94873	GENERIC_DAY	0	0	2009-12-22	90901	\N	68423	\N
94874	GENERIC_DAY	0	2	2009-12-23	1228	\N	68423	\N
94875	GENERIC_DAY	0	0	2009-12-23	90901	\N	68423	\N
94876	GENERIC_DAY	0	0	2009-12-19	1230	\N	68423	\N
94877	GENERIC_DAY	0	2	2009-12-22	1230	\N	68423	\N
94878	GENERIC_DAY	0	0	2009-12-19	1217	\N	68423	\N
94879	GENERIC_DAY	0	2	2009-12-22	1228	\N	68423	\N
94880	GENERIC_DAY	0	2	2009-12-17	1220	\N	60792	\N
94881	GENERIC_DAY	0	2	2009-12-18	1217	\N	60792	\N
94882	GENERIC_DAY	0	2	2009-12-18	1228	\N	60792	\N
94883	GENERIC_DAY	0	2	2009-12-18	1220	\N	60792	\N
94884	GENERIC_DAY	0	2	2009-12-14	1230	\N	60792	\N
94885	GENERIC_DAY	0	2	2009-12-16	1217	\N	60792	\N
94886	GENERIC_DAY	0	2	2009-12-17	1230	\N	60792	\N
94887	GENERIC_DAY	0	2	2009-12-14	1228	\N	60792	\N
94888	GENERIC_DAY	0	2	2009-12-15	1217	\N	60792	\N
94889	GENERIC_DAY	0	0	2009-12-18	90901	\N	60792	\N
94890	GENERIC_DAY	0	2	2009-12-16	1220	\N	60792	\N
94891	GENERIC_DAY	0	2	2009-12-14	1217	\N	60792	\N
94892	GENERIC_DAY	0	2	2009-12-15	1230	\N	60792	\N
94893	GENERIC_DAY	0	2	2009-12-17	1228	\N	60792	\N
94894	GENERIC_DAY	0	0	2009-12-17	90901	\N	60792	\N
94895	GENERIC_DAY	0	0	2009-12-15	90901	\N	60792	\N
94896	GENERIC_DAY	0	2	2009-12-16	1230	\N	60792	\N
94897	GENERIC_DAY	0	0	2009-12-14	90901	\N	60792	\N
94898	GENERIC_DAY	0	2	2009-12-18	1230	\N	60792	\N
94899	GENERIC_DAY	0	2	2009-12-16	1228	\N	60792	\N
94900	GENERIC_DAY	0	2	2009-12-15	1220	\N	60792	\N
94901	GENERIC_DAY	0	0	2009-12-16	90901	\N	60792	\N
94902	GENERIC_DAY	0	2	2009-12-14	1220	\N	60792	\N
94903	GENERIC_DAY	0	2	2009-12-17	1217	\N	60792	\N
94904	GENERIC_DAY	0	2	2009-12-15	1228	\N	60792	\N
353048	GENERIC_DAY	3	1	2010-07-01	139484	\N	148707	\N
353082	GENERIC_DAY	3	0	2010-06-16	139486	\N	148707	\N
353042	GENERIC_DAY	3	1	2010-06-16	139484	\N	148707	\N
353088	GENERIC_DAY	3	0	2010-06-13	139482	\N	148707	\N
353092	GENERIC_DAY	3	2	2010-07-02	139484	\N	148707	\N
353074	GENERIC_DAY	3	0	2010-06-19	139486	\N	148707	\N
353059	GENERIC_DAY	3	0	2010-06-19	139484	\N	148707	\N
353065	GENERIC_DAY	3	0	2010-06-20	139482	\N	148707	\N
353033	GENERIC_DAY	3	0	2010-06-20	139486	\N	148707	\N
353063	GENERIC_DAY	3	2	2010-06-28	139484	\N	148707	\N
353025	GENERIC_DAY	3	5	2010-06-28	139482	\N	148707	\N
353053	GENERIC_DAY	3	3	2010-06-30	139486	\N	148707	\N
353024	GENERIC_DAY	3	0	2010-06-19	139482	\N	148707	\N
353085	GENERIC_DAY	3	3	2010-06-30	139482	\N	148707	\N
353038	GENERIC_DAY	3	0	2010-06-11	139484	\N	148707	\N
353036	GENERIC_DAY	3	1	2010-06-25	139484	\N	148707	\N
353086	GENERIC_DAY	3	4	2010-06-11	139486	\N	148707	\N
353044	GENERIC_DAY	3	0	2010-06-18	139484	\N	148707	\N
353078	GENERIC_DAY	3	4	2010-06-17	139482	\N	148707	\N
353077	GENERIC_DAY	3	0	2010-06-17	139484	\N	148707	\N
353029	GENERIC_DAY	3	0	2010-06-27	139486	\N	148707	\N
353081	GENERIC_DAY	3	0	2010-06-22	139486	\N	148707	\N
353047	GENERIC_DAY	3	0	2010-06-12	139484	\N	148707	\N
353034	GENERIC_DAY	3	0	2010-06-26	139486	\N	148707	\N
353067	GENERIC_DAY	3	3	2010-06-14	139486	\N	148707	\N
353052	GENERIC_DAY	3	1	2010-06-22	139484	\N	148707	\N
353057	GENERIC_DAY	3	6	2010-06-16	139482	\N	148707	\N
353066	GENERIC_DAY	3	5	2010-06-21	139482	\N	148707	\N
353050	GENERIC_DAY	3	3	2010-06-18	139482	\N	148707	\N
353030	GENERIC_DAY	3	3	2010-06-17	139486	\N	148707	\N
353049	GENERIC_DAY	3	5	2010-06-24	139482	\N	148707	\N
353031	GENERIC_DAY	3	0	2010-06-26	139484	\N	148707	\N
353060	GENERIC_DAY	3	0	2010-06-12	139486	\N	148707	\N
353032	GENERIC_DAY	3	1	2010-06-23	139484	\N	148707	\N
353062	GENERIC_DAY	3	1	2010-06-15	139484	\N	148707	\N
353043	GENERIC_DAY	3	0	2010-06-28	139486	\N	148707	\N
353026	GENERIC_DAY	3	4	2010-06-10	139486	\N	148707	\N
353064	GENERIC_DAY	3	0	2010-06-10	139484	\N	148707	\N
353079	GENERIC_DAY	3	0	2010-06-13	139484	\N	148707	\N
353083	GENERIC_DAY	3	4	2010-06-29	139482	\N	148707	\N
353051	GENERIC_DAY	3	2	2010-07-02	139486	\N	148707	\N
353046	GENERIC_DAY	3	3	2010-06-11	139482	\N	148707	\N
353058	GENERIC_DAY	3	0	2010-06-12	139482	\N	148707	\N
353028	GENERIC_DAY	3	5	2010-06-23	139482	\N	148707	\N
353041	GENERIC_DAY	3	1	2010-06-30	139484	\N	148707	\N
353055	GENERIC_DAY	3	3	2010-07-02	139482	\N	148707	\N
353072	GENERIC_DAY	3	5	2010-06-25	139482	\N	148707	\N
353091	GENERIC_DAY	3	3	2010-07-01	139486	\N	148707	\N
353040	GENERIC_DAY	3	6	2010-06-15	139482	\N	148707	\N
353027	GENERIC_DAY	3	3	2010-07-01	139482	\N	148707	\N
353069	GENERIC_DAY	3	1	2010-06-21	139484	\N	148707	\N
353076	GENERIC_DAY	3	0	2010-06-27	139484	\N	148707	\N
353089	GENERIC_DAY	3	1	2010-06-23	139486	\N	148707	\N
353056	GENERIC_DAY	3	0	2010-06-26	139482	\N	148707	\N
353084	GENERIC_DAY	3	1	2010-06-24	139486	\N	148707	\N
353073	GENERIC_DAY	3	4	2010-06-18	139486	\N	148707	\N
353061	GENERIC_DAY	3	4	2010-06-14	139482	\N	148707	\N
353070	GENERIC_DAY	3	1	2010-06-29	139486	\N	148707	\N
353090	GENERIC_DAY	3	0	2010-06-15	139486	\N	148707	\N
353080	GENERIC_DAY	3	0	2010-06-13	139486	\N	148707	\N
353087	GENERIC_DAY	3	6	2010-06-22	139482	\N	148707	\N
344071	GENERIC_DAY	4	1	2010-06-22	139482	\N	148709	\N
344070	GENERIC_DAY	4	0	2010-06-20	139486	\N	148709	\N
344066	GENERIC_DAY	4	0	2010-06-20	139482	\N	148709	\N
344063	GENERIC_DAY	4	2	2010-06-21	139484	\N	148709	\N
344064	GENERIC_DAY	4	0	2010-06-20	139484	\N	148709	\N
344069	GENERIC_DAY	4	2	2010-06-22	139484	\N	148709	\N
344067	GENERIC_DAY	4	3	2010-06-21	139482	\N	148709	\N
344068	GENERIC_DAY	4	2	2010-06-22	139486	\N	148709	\N
344065	GENERIC_DAY	4	2	2010-06-21	139486	\N	148709	\N
355617	GENERIC_DAY	1	0	2010-09-11	139482	\N	148713	\N
355618	GENERIC_DAY	1	0	2010-09-12	139482	\N	148713	\N
355619	GENERIC_DAY	1	0	2010-09-11	139484	\N	148713	\N
355620	GENERIC_DAY	1	2	2010-09-14	139486	\N	148713	\N
355621	GENERIC_DAY	1	0	2010-09-15	139482	\N	148713	\N
355622	GENERIC_DAY	1	2	2010-09-13	139486	\N	148713	\N
355623	GENERIC_DAY	1	2	2010-09-14	139484	\N	148713	\N
355624	GENERIC_DAY	1	1	2010-09-15	139484	\N	148713	\N
355625	GENERIC_DAY	1	3	2010-09-13	139484	\N	148713	\N
355626	GENERIC_DAY	1	1	2010-09-15	139486	\N	148713	\N
355627	GENERIC_DAY	1	2	2010-07-30	139484	\N	178234	\N
355628	GENERIC_DAY	1	3	2010-07-29	139482	\N	178234	\N
355629	GENERIC_DAY	1	2	2010-07-30	139486	\N	178234	\N
355630	GENERIC_DAY	1	2	2010-07-29	139486	\N	178234	\N
355631	GENERIC_DAY	1	3	2010-07-30	139482	\N	178234	\N
355632	GENERIC_DAY	1	2	2010-07-29	139484	\N	178234	\N
355633	GENERIC_DAY	1	0	2010-08-01	139484	\N	178235	\N
355634	GENERIC_DAY	1	1	2010-08-02	139486	\N	178235	\N
355635	GENERIC_DAY	1	0	2010-07-31	139486	\N	178235	\N
355636	GENERIC_DAY	1	0	2010-07-31	139484	\N	178235	\N
355637	GENERIC_DAY	1	1	2010-08-02	139482	\N	178235	\N
355638	GENERIC_DAY	1	0	2010-07-31	139482	\N	178235	\N
355639	GENERIC_DAY	1	0	2010-08-01	139486	\N	178235	\N
355640	GENERIC_DAY	1	1	2010-08-02	139484	\N	178235	\N
355641	GENERIC_DAY	1	0	2010-08-01	139482	\N	178235	\N
355642	GENERIC_DAY	1	3	2010-08-04	139484	\N	178236	\N
355643	GENERIC_DAY	1	1	2010-08-05	139482	\N	178236	\N
355644	GENERIC_DAY	1	2	2010-08-04	139482	\N	178236	\N
355645	GENERIC_DAY	1	1	2010-08-05	139486	\N	178236	\N
355646	GENERIC_DAY	1	3	2010-08-03	139482	\N	178236	\N
355647	GENERIC_DAY	1	2	2010-08-03	139486	\N	178236	\N
355648	GENERIC_DAY	1	2	2010-08-03	139484	\N	178236	\N
355649	GENERIC_DAY	1	2	2010-08-04	139486	\N	178236	\N
355650	GENERIC_DAY	1	2	2010-08-05	139484	\N	178236	\N
355651	GENERIC_DAY	1	1	2010-08-10	139486	\N	178237	\N
355652	GENERIC_DAY	1	0	2010-08-08	139484	\N	178237	\N
355653	GENERIC_DAY	1	3	2010-08-06	139484	\N	178237	\N
355654	GENERIC_DAY	1	0	2010-08-07	139486	\N	178237	\N
355655	GENERIC_DAY	1	2	2010-08-06	139482	\N	178237	\N
355656	GENERIC_DAY	1	2	2010-08-06	139486	\N	178237	\N
355657	GENERIC_DAY	1	0	2010-08-07	139482	\N	178237	\N
355658	GENERIC_DAY	1	1	2010-08-10	139482	\N	178237	\N
355659	GENERIC_DAY	1	0	2010-08-07	139484	\N	178237	\N
355660	GENERIC_DAY	1	1	2010-08-10	139484	\N	178237	\N
355661	GENERIC_DAY	1	3	2010-08-09	139484	\N	178237	\N
355662	GENERIC_DAY	1	0	2010-08-08	139486	\N	178237	\N
355663	GENERIC_DAY	1	2	2010-08-09	139482	\N	178237	\N
355664	GENERIC_DAY	1	0	2010-08-08	139482	\N	178237	\N
355665	GENERIC_DAY	1	2	2010-08-09	139486	\N	178237	\N
355666	GENERIC_DAY	1	2	2010-08-11	139484	\N	178238	\N
355667	GENERIC_DAY	1	1	2010-08-11	139486	\N	178238	\N
355668	GENERIC_DAY	1	1	2010-08-11	139482	\N	178238	\N
355669	GENERIC_DAY	1	2	2010-08-12	139486	\N	178239	\N
355670	GENERIC_DAY	1	0	2010-08-15	139482	\N	178239	\N
355671	GENERIC_DAY	1	2	2010-08-13	139482	\N	178239	\N
355672	GENERIC_DAY	1	0	2010-08-14	139482	\N	178239	\N
355673	GENERIC_DAY	1	3	2010-08-12	139484	\N	178239	\N
355674	GENERIC_DAY	1	1	2010-08-16	139482	\N	178239	\N
355675	GENERIC_DAY	1	2	2010-08-12	139482	\N	178239	\N
355676	GENERIC_DAY	1	0	2010-08-14	139484	\N	178239	\N
355677	GENERIC_DAY	1	0	2010-08-14	139486	\N	178239	\N
355678	GENERIC_DAY	1	2	2010-08-13	139486	\N	178239	\N
355679	GENERIC_DAY	1	0	2010-08-15	139484	\N	178239	\N
355680	GENERIC_DAY	1	1	2010-08-16	139486	\N	178239	\N
355681	GENERIC_DAY	1	3	2010-08-13	139484	\N	178239	\N
355682	GENERIC_DAY	1	0	2010-08-15	139486	\N	178239	\N
355683	GENERIC_DAY	1	1	2010-08-16	139484	\N	178239	\N
355684	GENERIC_DAY	1	1	2010-08-17	139486	\N	178240	\N
355685	GENERIC_DAY	1	2	2010-08-17	139484	\N	178240	\N
355686	GENERIC_DAY	1	1	2010-08-17	139482	\N	178240	\N
355687	GENERIC_DAY	1	2	2010-08-18	139486	\N	178241	\N
355688	GENERIC_DAY	1	3	2010-08-18	139484	\N	178241	\N
355689	GENERIC_DAY	1	2	2010-08-19	139482	\N	178241	\N
355690	GENERIC_DAY	1	2	2010-08-18	139482	\N	178241	\N
355691	GENERIC_DAY	1	2	2010-08-19	139486	\N	178241	\N
355692	GENERIC_DAY	1	3	2010-08-19	139484	\N	178241	\N
355693	GENERIC_DAY	1	3	2010-08-23	139486	\N	178242	\N
355694	GENERIC_DAY	1	3	2010-08-20	139484	\N	178242	\N
355695	GENERIC_DAY	1	0	2010-08-22	139484	\N	178242	\N
355696	GENERIC_DAY	1	0	2010-08-21	139482	\N	178242	\N
355697	GENERIC_DAY	1	0	2010-08-22	139486	\N	178242	\N
355698	GENERIC_DAY	1	2	2010-08-20	139486	\N	178242	\N
355699	GENERIC_DAY	1	0	2010-08-22	139482	\N	178242	\N
355700	GENERIC_DAY	1	0	2010-08-21	139486	\N	178242	\N
355701	GENERIC_DAY	1	1	2010-08-23	139482	\N	178242	\N
355702	GENERIC_DAY	1	0	2010-08-21	139484	\N	178242	\N
355703	GENERIC_DAY	1	2	2010-08-20	139482	\N	178242	\N
355704	GENERIC_DAY	1	3	2010-08-23	139484	\N	178242	\N
355705	GENERIC_DAY	1	2	2010-08-27	139482	\N	178243	\N
355706	GENERIC_DAY	1	2	2010-08-27	139486	\N	178243	\N
355707	GENERIC_DAY	1	3	2010-08-26	139486	\N	178243	\N
355708	GENERIC_DAY	1	3	2010-08-24	139484	\N	178243	\N
355709	GENERIC_DAY	1	3	2010-08-25	139484	\N	178243	\N
355710	GENERIC_DAY	1	4	2010-08-24	139486	\N	178243	\N
355711	GENERIC_DAY	1	0	2010-08-29	139486	\N	178243	\N
355712	GENERIC_DAY	1	1	2010-08-25	139482	\N	178243	\N
355713	GENERIC_DAY	1	3	2010-08-25	139486	\N	178243	\N
355714	GENERIC_DAY	1	1	2010-08-30	139482	\N	178243	\N
355715	GENERIC_DAY	1	0	2010-08-28	139482	\N	178243	\N
355716	GENERIC_DAY	1	0	2010-08-28	139486	\N	178243	\N
355717	GENERIC_DAY	1	0	2010-08-29	139484	\N	178243	\N
355718	GENERIC_DAY	1	4	2010-08-26	139484	\N	178243	\N
355719	GENERIC_DAY	1	0	2010-08-26	139482	\N	178243	\N
355720	GENERIC_DAY	1	0	2010-08-29	139482	\N	178243	\N
355721	GENERIC_DAY	1	3	2010-08-27	139484	\N	178243	\N
355722	GENERIC_DAY	1	0	2010-08-28	139484	\N	178243	\N
355723	GENERIC_DAY	1	0	2010-08-24	139482	\N	178243	\N
355724	GENERIC_DAY	1	1	2010-08-30	139486	\N	178243	\N
355725	GENERIC_DAY	1	2	2010-08-30	139484	\N	178243	\N
355726	GENERIC_DAY	1	2	2010-08-31	139482	\N	178244	\N
355727	GENERIC_DAY	1	0	2010-09-05	139482	\N	178244	\N
355728	GENERIC_DAY	1	2	2010-09-02	139482	\N	178244	\N
355729	GENERIC_DAY	1	4	2010-08-31	139484	\N	178244	\N
355730	GENERIC_DAY	1	3	2010-09-03	139484	\N	178244	\N
355731	GENERIC_DAY	1	0	2010-09-04	139484	\N	178244	\N
355732	GENERIC_DAY	1	2	2010-09-01	139486	\N	178244	\N
355733	GENERIC_DAY	1	2	2010-09-03	139482	\N	178244	\N
355734	GENERIC_DAY	1	0	2010-09-05	139484	\N	178244	\N
355735	GENERIC_DAY	1	1	2010-09-06	139482	\N	178244	\N
355736	GENERIC_DAY	1	2	2010-09-02	139486	\N	178244	\N
355737	GENERIC_DAY	1	1	2010-09-06	139486	\N	178244	\N
355738	GENERIC_DAY	1	1	2010-08-31	139486	\N	178244	\N
355739	GENERIC_DAY	1	0	2010-09-04	139482	\N	178244	\N
355740	GENERIC_DAY	1	2	2010-09-01	139482	\N	178244	\N
355741	GENERIC_DAY	1	0	2010-09-05	139486	\N	178244	\N
355742	GENERIC_DAY	1	3	2010-09-01	139484	\N	178244	\N
355743	GENERIC_DAY	1	0	2010-09-04	139486	\N	178244	\N
355744	GENERIC_DAY	1	2	2010-09-03	139486	\N	178244	\N
355745	GENERIC_DAY	1	2	2010-09-06	139484	\N	178244	\N
355746	GENERIC_DAY	1	3	2010-09-02	139484	\N	178244	\N
355747	GENERIC_DAY	1	1	2010-09-07	139486	\N	178245	\N
355748	GENERIC_DAY	1	1	2010-09-07	139482	\N	178245	\N
355749	GENERIC_DAY	1	2	2010-09-07	139484	\N	178245	\N
355750	GENERIC_DAY	1	1	2010-09-08	139486	\N	178246	\N
355751	GENERIC_DAY	1	1	2010-09-08	139482	\N	178246	\N
355752	GENERIC_DAY	1	2	2010-09-08	139484	\N	178246	\N
355753	GENERIC_DAY	1	2	2010-09-09	139484	\N	183845	\N
355754	GENERIC_DAY	1	1	2010-09-09	139482	\N	183845	\N
355755	GENERIC_DAY	1	1	2010-09-09	139486	\N	183845	\N
355756	GENERIC_DAY	1	1	2010-09-15	139484	\N	183846	\N
355757	GENERIC_DAY	1	2	2010-09-13	139484	\N	183846	\N
355758	GENERIC_DAY	1	3	2010-09-13	139482	\N	183846	\N
355759	GENERIC_DAY	1	2	2010-09-10	139484	\N	183846	\N
355760	GENERIC_DAY	1	2	2010-09-13	139486	\N	183846	\N
355761	GENERIC_DAY	1	0	2010-09-12	139484	\N	183846	\N
355762	GENERIC_DAY	1	3	2010-09-14	139486	\N	183846	\N
355763	GENERIC_DAY	1	0	2010-09-12	139486	\N	183846	\N
355764	GENERIC_DAY	1	2	2010-09-15	139482	\N	183846	\N
355765	GENERIC_DAY	1	0	2010-09-11	139482	\N	183846	\N
355766	GENERIC_DAY	1	2	2010-09-14	139484	\N	183846	\N
355767	GENERIC_DAY	1	0	2010-09-11	139486	\N	183846	\N
355768	GENERIC_DAY	1	0	2010-09-11	139484	\N	183846	\N
355769	GENERIC_DAY	1	0	2010-09-12	139482	\N	183846	\N
355770	GENERIC_DAY	1	2	2010-09-10	139486	\N	183846	\N
355771	GENERIC_DAY	1	2	2010-09-14	139482	\N	183846	\N
355772	GENERIC_DAY	1	3	2010-09-10	139482	\N	183846	\N
355773	GENERIC_DAY	1	1	2010-09-15	139486	\N	183846	\N
355774	GENERIC_DAY	1	2	2010-09-16	139482	\N	183847	\N
355775	GENERIC_DAY	1	2	2010-09-16	139486	\N	183847	\N
355776	GENERIC_DAY	1	1	2010-09-17	139484	\N	183847	\N
355777	GENERIC_DAY	1	3	2010-09-16	139484	\N	183847	\N
355778	GENERIC_DAY	1	1	2010-09-17	139482	\N	183847	\N
355779	GENERIC_DAY	1	1	2010-09-17	139486	\N	183847	\N
355780	GENERIC_DAY	1	0	2010-09-25	139486	\N	183848	\N
355781	GENERIC_DAY	1	2	2010-09-29	139482	\N	183848	\N
355782	GENERIC_DAY	1	0	2010-10-03	139486	\N	183848	\N
355783	GENERIC_DAY	1	0	2010-09-18	139484	\N	183848	\N
355784	GENERIC_DAY	1	2	2010-09-24	139486	\N	183848	\N
355785	GENERIC_DAY	1	2	2010-09-23	139486	\N	183848	\N
355786	GENERIC_DAY	1	3	2010-09-28	139484	\N	183848	\N
355787	GENERIC_DAY	1	0	2010-09-19	139486	\N	183848	\N
355788	GENERIC_DAY	1	0	2010-09-19	139482	\N	183848	\N
355789	GENERIC_DAY	1	1	2010-10-05	139486	\N	183848	\N
355790	GENERIC_DAY	1	2	2010-09-21	139486	\N	183848	\N
355791	GENERIC_DAY	1	2	2010-09-21	139482	\N	183848	\N
355792	GENERIC_DAY	1	0	2010-10-02	139486	\N	183848	\N
355793	GENERIC_DAY	1	2	2010-10-01	139482	\N	183848	\N
355794	GENERIC_DAY	1	2	2010-10-01	139486	\N	183848	\N
355795	GENERIC_DAY	1	0	2010-09-26	139482	\N	183848	\N
355796	GENERIC_DAY	1	3	2010-09-23	139484	\N	183848	\N
355797	GENERIC_DAY	1	2	2010-09-20	139482	\N	183848	\N
355798	GENERIC_DAY	1	0	2010-09-18	139486	\N	183848	\N
355799	GENERIC_DAY	1	0	2010-09-26	139486	\N	183848	\N
355800	GENERIC_DAY	1	0	2010-09-25	139482	\N	183848	\N
355801	GENERIC_DAY	1	2	2010-09-23	139482	\N	183848	\N
355802	GENERIC_DAY	1	0	2010-10-02	139484	\N	183848	\N
355803	GENERIC_DAY	1	3	2010-09-29	139484	\N	183848	\N
355804	GENERIC_DAY	1	2	2010-09-27	139482	\N	183848	\N
355805	GENERIC_DAY	1	0	2010-10-02	139482	\N	183848	\N
355806	GENERIC_DAY	1	2	2010-09-24	139482	\N	183848	\N
355807	GENERIC_DAY	1	2	2010-09-28	139486	\N	183848	\N
355808	GENERIC_DAY	1	0	2010-09-26	139484	\N	183848	\N
355809	GENERIC_DAY	1	1	2010-10-05	139482	\N	183848	\N
355810	GENERIC_DAY	1	2	2010-10-04	139486	\N	183848	\N
355811	GENERIC_DAY	1	0	2010-10-03	139484	\N	183848	\N
355812	GENERIC_DAY	1	0	2010-09-18	139482	\N	183848	\N
355813	GENERIC_DAY	1	2	2010-09-22	139482	\N	183848	\N
355814	GENERIC_DAY	1	3	2010-09-30	139484	\N	183848	\N
355815	GENERIC_DAY	1	0	2010-09-25	139484	\N	183848	\N
355816	GENERIC_DAY	1	2	2010-09-29	139486	\N	183848	\N
355817	GENERIC_DAY	1	3	2010-09-20	139484	\N	183848	\N
355818	GENERIC_DAY	1	3	2010-10-01	139484	\N	183848	\N
355819	GENERIC_DAY	1	1	2010-10-05	139484	\N	183848	\N
355820	GENERIC_DAY	1	3	2010-10-04	139484	\N	183848	\N
355821	GENERIC_DAY	1	3	2010-09-27	139484	\N	183848	\N
355822	GENERIC_DAY	1	0	2010-10-03	139482	\N	183848	\N
355823	GENERIC_DAY	1	2	2010-09-22	139486	\N	183848	\N
355824	GENERIC_DAY	1	0	2010-09-19	139484	\N	183848	\N
355825	GENERIC_DAY	1	2	2010-10-04	139482	\N	183848	\N
355826	GENERIC_DAY	1	2	2010-09-28	139482	\N	183848	\N
355827	GENERIC_DAY	1	3	2010-09-24	139484	\N	183848	\N
355828	GENERIC_DAY	1	2	2010-09-20	139486	\N	183848	\N
355829	GENERIC_DAY	1	2	2010-09-30	139486	\N	183848	\N
355830	GENERIC_DAY	1	3	2010-09-22	139484	\N	183848	\N
355831	GENERIC_DAY	1	2	2010-09-30	139482	\N	183848	\N
355832	GENERIC_DAY	1	3	2010-09-21	139484	\N	183848	\N
355833	GENERIC_DAY	1	2	2010-09-27	139486	\N	183848	\N
355834	GENERIC_DAY	1	0	2010-10-10	139482	\N	183849	\N
355835	GENERIC_DAY	1	1	2010-10-11	139482	\N	183849	\N
355836	GENERIC_DAY	1	3	2010-10-08	139482	\N	183849	\N
355837	GENERIC_DAY	1	2	2010-10-07	139484	\N	183849	\N
355838	GENERIC_DAY	1	2	2010-10-08	139484	\N	183849	\N
355839	GENERIC_DAY	1	3	2010-10-07	139482	\N	183849	\N
355840	GENERIC_DAY	1	0	2010-10-10	139486	\N	183849	\N
355841	GENERIC_DAY	1	3	2010-10-06	139482	\N	183849	\N
355842	GENERIC_DAY	1	2	2010-10-06	139486	\N	183849	\N
355843	GENERIC_DAY	1	0	2010-10-09	139484	\N	183849	\N
355844	GENERIC_DAY	1	0	2010-10-09	139482	\N	183849	\N
355845	GENERIC_DAY	1	2	2010-10-06	139484	\N	183849	\N
355846	GENERIC_DAY	1	2	2010-10-07	139486	\N	183849	\N
355847	GENERIC_DAY	1	0	2010-10-10	139484	\N	183849	\N
355848	GENERIC_DAY	1	2	2010-10-08	139486	\N	183849	\N
355849	GENERIC_DAY	1	1	2010-10-11	139484	\N	183849	\N
355850	GENERIC_DAY	1	0	2010-10-09	139486	\N	183849	\N
355851	GENERIC_DAY	1	1	2010-10-11	139486	\N	183849	\N
355852	GENERIC_DAY	1	3	2010-10-14	139482	\N	183850	\N
355853	GENERIC_DAY	1	2	2010-10-13	139486	\N	183850	\N
355854	GENERIC_DAY	1	2	2010-10-14	139484	\N	183850	\N
355855	GENERIC_DAY	1	3	2010-10-13	139482	\N	183850	\N
355856	GENERIC_DAY	1	2	2010-10-14	139486	\N	183850	\N
355857	GENERIC_DAY	1	2	2010-10-13	139484	\N	183850	\N
355858	GENERIC_DAY	1	3	2010-10-22	139484	\N	178247	\N
355859	GENERIC_DAY	1	2	2010-10-27	139482	\N	178247	\N
355860	GENERIC_DAY	1	2	2010-10-20	139486	\N	178247	\N
355861	GENERIC_DAY	1	0	2010-10-30	139484	\N	178247	\N
355862	GENERIC_DAY	1	3	2010-10-15	139482	\N	178247	\N
355863	GENERIC_DAY	1	0	2010-10-24	139486	\N	178247	\N
355864	GENERIC_DAY	1	2	2010-10-26	139482	\N	178247	\N
355865	GENERIC_DAY	1	2	2010-10-21	139486	\N	178247	\N
355866	GENERIC_DAY	1	2	2010-10-22	139482	\N	178247	\N
355867	GENERIC_DAY	1	0	2010-10-24	139482	\N	178247	\N
355868	GENERIC_DAY	1	0	2010-10-17	139482	\N	178247	\N
355869	GENERIC_DAY	1	2	2010-11-02	139484	\N	178247	\N
355870	GENERIC_DAY	1	2	2010-10-15	139486	\N	178247	\N
355871	GENERIC_DAY	1	0	2010-10-16	139482	\N	178247	\N
355872	GENERIC_DAY	1	3	2010-10-28	139486	\N	178247	\N
355873	GENERIC_DAY	1	0	2010-10-23	139482	\N	178247	\N
355874	GENERIC_DAY	1	3	2010-10-18	139482	\N	178247	\N
355875	GENERIC_DAY	1	2	2010-10-27	139484	\N	178247	\N
355876	GENERIC_DAY	1	0	2010-10-30	139482	\N	178247	\N
355877	GENERIC_DAY	1	2	2010-10-20	139484	\N	178247	\N
355878	GENERIC_DAY	1	2	2010-11-02	139482	\N	178247	\N
355879	GENERIC_DAY	1	0	2010-10-16	139484	\N	178247	\N
355880	GENERIC_DAY	1	3	2010-10-21	139484	\N	178247	\N
355881	GENERIC_DAY	1	0	2010-10-24	139484	\N	178247	\N
355882	GENERIC_DAY	1	3	2010-10-26	139486	\N	178247	\N
355883	GENERIC_DAY	1	0	2010-10-23	139486	\N	178247	\N
355884	GENERIC_DAY	1	2	2010-10-15	139484	\N	178247	\N
355885	GENERIC_DAY	1	2	2010-10-18	139484	\N	178247	\N
355886	GENERIC_DAY	1	2	2010-10-19	139484	\N	178247	\N
355887	GENERIC_DAY	1	2	2010-10-21	139482	\N	178247	\N
355888	GENERIC_DAY	1	0	2010-10-31	139484	\N	178247	\N
355889	GENERIC_DAY	1	0	2010-10-31	139486	\N	178247	\N
355890	GENERIC_DAY	1	3	2010-10-27	139486	\N	178247	\N
355891	GENERIC_DAY	1	3	2010-10-20	139482	\N	178247	\N
355892	GENERIC_DAY	1	0	2010-10-31	139482	\N	178247	\N
355893	GENERIC_DAY	1	2	2010-10-25	139486	\N	178247	\N
355894	GENERIC_DAY	1	2	2010-11-02	139486	\N	178247	\N
355895	GENERIC_DAY	1	3	2010-10-25	139484	\N	178247	\N
355896	GENERIC_DAY	1	2	2010-10-29	139482	\N	178247	\N
355897	GENERIC_DAY	1	2	2010-10-28	139482	\N	178247	\N
355898	GENERIC_DAY	1	2	2010-10-18	139486	\N	178247	\N
355899	GENERIC_DAY	1	0	2010-10-16	139486	\N	178247	\N
355900	GENERIC_DAY	1	2	2010-10-29	139484	\N	178247	\N
355901	GENERIC_DAY	1	2	2010-10-22	139486	\N	178247	\N
355902	GENERIC_DAY	1	2	2010-10-26	139484	\N	178247	\N
355903	GENERIC_DAY	1	0	2010-10-30	139486	\N	178247	\N
355904	GENERIC_DAY	1	3	2010-10-29	139486	\N	178247	\N
355905	GENERIC_DAY	1	2	2010-10-28	139484	\N	178247	\N
355906	GENERIC_DAY	1	2	2010-10-19	139486	\N	178247	\N
355907	GENERIC_DAY	1	3	2010-10-19	139482	\N	178247	\N
355908	GENERIC_DAY	1	2	2010-10-25	139482	\N	178247	\N
355909	GENERIC_DAY	1	0	2010-10-17	139484	\N	178247	\N
355910	GENERIC_DAY	1	0	2010-10-23	139484	\N	178247	\N
355911	GENERIC_DAY	1	0	2010-10-17	139486	\N	178247	\N
330633	SPECIFIC_DAY	5	1	2010-12-07	139484	146358	\N	\N
330619	SPECIFIC_DAY	5	1	2010-10-20	139484	146358	\N	\N
330697	SPECIFIC_DAY	5	1	2010-11-04	139484	146358	\N	\N
330638	SPECIFIC_DAY	5	1	2010-10-18	139484	146358	\N	\N
330625	SPECIFIC_DAY	5	1	2010-10-13	139484	146358	\N	\N
330673	SPECIFIC_DAY	5	1	2010-09-23	139484	146358	\N	\N
330628	SPECIFIC_DAY	5	1	2010-11-03	139484	146358	\N	\N
330622	SPECIFIC_DAY	5	1	2010-11-12	139484	146358	\N	\N
330744	SPECIFIC_DAY	5	1	2010-08-12	139484	146358	\N	\N
330722	SPECIFIC_DAY	5	1	2010-10-21	139484	146358	\N	\N
330657	SPECIFIC_DAY	5	1	2010-10-11	139484	146358	\N	\N
330667	SPECIFIC_DAY	5	2	2010-06-17	139484	146358	\N	\N
330707	SPECIFIC_DAY	5	1	2010-09-21	139484	146358	\N	\N
330751	SPECIFIC_DAY	5	2	2010-06-15	139484	146358	\N	\N
330649	SPECIFIC_DAY	5	2	2010-07-28	139484	146358	\N	\N
330683	SPECIFIC_DAY	5	1	2010-08-27	139484	146358	\N	\N
330640	SPECIFIC_DAY	5	1	2010-12-13	139484	146358	\N	\N
330635	SPECIFIC_DAY	5	1	2010-08-26	139484	146358	\N	\N
330721	SPECIFIC_DAY	5	1	2010-09-08	139484	146358	\N	\N
330706	SPECIFIC_DAY	5	1	2010-09-30	139484	146358	\N	\N
330675	SPECIFIC_DAY	5	1	2010-08-09	139484	146358	\N	\N
330624	SPECIFIC_DAY	5	2	2010-06-16	139484	146358	\N	\N
330688	SPECIFIC_DAY	5	1	2010-08-25	139484	146358	\N	\N
330679	SPECIFIC_DAY	5	2	2010-07-08	139484	146358	\N	\N
330689	SPECIFIC_DAY	5	2	2010-07-09	139484	146358	\N	\N
330648	SPECIFIC_DAY	5	1	2010-09-29	139484	146358	\N	\N
330685	SPECIFIC_DAY	5	1	2010-12-17	139484	146358	\N	\N
330694	SPECIFIC_DAY	5	2	2010-06-14	139484	146358	\N	\N
330639	SPECIFIC_DAY	5	1	2010-08-20	139484	146358	\N	\N
330677	SPECIFIC_DAY	5	1	2010-08-17	139484	146358	\N	\N
330645	SPECIFIC_DAY	5	1	2010-11-11	139484	146358	\N	\N
330654	SPECIFIC_DAY	5	1	2010-11-26	139484	146358	\N	\N
330644	SPECIFIC_DAY	5	1	2010-08-11	139484	146358	\N	\N
330709	SPECIFIC_DAY	5	2	2010-07-12	139484	146358	\N	\N
330682	SPECIFIC_DAY	5	2	2010-07-01	139484	146358	\N	\N
330623	SPECIFIC_DAY	5	1	2010-11-09	139484	146358	\N	\N
330658	SPECIFIC_DAY	5	1	2010-10-07	139484	146358	\N	\N
330746	SPECIFIC_DAY	5	1	2010-08-10	139484	146358	\N	\N
330716	SPECIFIC_DAY	5	1	2010-11-25	139484	146358	\N	\N
330687	SPECIFIC_DAY	5	2	2010-08-02	139484	146358	\N	\N
330630	SPECIFIC_DAY	5	1	2010-09-02	139484	146358	\N	\N
330745	SPECIFIC_DAY	5	1	2010-09-06	139484	146358	\N	\N
330643	SPECIFIC_DAY	5	2	2010-06-21	139484	146358	\N	\N
330705	SPECIFIC_DAY	5	2	2010-07-13	139484	146358	\N	\N
330656	SPECIFIC_DAY	5	1	2010-09-15	139484	146358	\N	\N
330674	SPECIFIC_DAY	5	1	2010-11-16	139484	146358	\N	\N
330629	SPECIFIC_DAY	5	1	2010-10-26	139484	146358	\N	\N
330651	SPECIFIC_DAY	5	2	2010-07-05	139484	146358	\N	\N
330669	SPECIFIC_DAY	5	2	2010-07-22	139484	146358	\N	\N
330725	SPECIFIC_DAY	5	1	2010-12-01	139484	146358	\N	\N
330742	SPECIFIC_DAY	5	1	2010-10-14	139484	146358	\N	\N
330670	SPECIFIC_DAY	5	2	2010-06-11	139484	146358	\N	\N
330671	SPECIFIC_DAY	5	1	2010-10-28	139484	146358	\N	\N
330659	SPECIFIC_DAY	5	1	2010-11-05	139484	146358	\N	\N
330695	SPECIFIC_DAY	5	2	2010-08-03	139484	146358	\N	\N
330665	SPECIFIC_DAY	5	1	2010-08-06	139484	146358	\N	\N
330678	SPECIFIC_DAY	5	1	2010-09-20	139484	146358	\N	\N
330636	SPECIFIC_DAY	5	1	2010-10-01	139484	146358	\N	\N
330637	SPECIFIC_DAY	5	1	2010-11-02	139484	146358	\N	\N
330666	SPECIFIC_DAY	5	2	2010-06-25	139484	146358	\N	\N
330701	SPECIFIC_DAY	5	1	2010-09-22	139484	146358	\N	\N
330738	SPECIFIC_DAY	5	2	2010-07-30	139484	146358	\N	\N
330681	SPECIFIC_DAY	5	2	2010-06-28	139484	146358	\N	\N
330718	SPECIFIC_DAY	5	1	2010-09-03	139484	146358	\N	\N
330715	SPECIFIC_DAY	5	1	2010-11-29	139484	146358	\N	\N
330661	SPECIFIC_DAY	5	2	2010-07-26	139484	146358	\N	\N
330676	SPECIFIC_DAY	5	2	2010-07-27	139484	146358	\N	\N
330734	SPECIFIC_DAY	5	1	2010-08-18	139484	146358	\N	\N
330684	SPECIFIC_DAY	5	2	2010-06-10	139484	146358	\N	\N
330741	SPECIFIC_DAY	5	1	2010-12-15	139484	146358	\N	\N
330699	SPECIFIC_DAY	5	1	2010-10-04	139484	146358	\N	\N
330660	SPECIFIC_DAY	5	2	2010-07-15	139484	146358	\N	\N
330749	SPECIFIC_DAY	5	1	2010-11-24	139484	146358	\N	\N
330690	SPECIFIC_DAY	5	1	2010-09-10	139484	146358	\N	\N
330711	SPECIFIC_DAY	5	1	2010-09-13	139484	146358	\N	\N
330620	SPECIFIC_DAY	5	1	2010-08-05	139484	146358	\N	\N
330621	SPECIFIC_DAY	5	1	2010-10-15	139484	146358	\N	\N
330719	SPECIFIC_DAY	5	2	2010-07-16	139484	146358	\N	\N
330740	SPECIFIC_DAY	5	1	2010-11-17	139484	146358	\N	\N
330650	SPECIFIC_DAY	5	1	2010-11-08	139484	146358	\N	\N
330632	SPECIFIC_DAY	5	1	2010-09-24	139484	146358	\N	\N
330693	SPECIFIC_DAY	5	2	2010-06-23	139484	146358	\N	\N
330662	SPECIFIC_DAY	5	1	2010-09-27	139484	146358	\N	\N
330664	SPECIFIC_DAY	5	1	2010-09-01	139484	146358	\N	\N
330631	SPECIFIC_DAY	5	1	2010-08-19	139484	146358	\N	\N
330626	SPECIFIC_DAY	5	1	2010-12-03	139484	146358	\N	\N
330728	SPECIFIC_DAY	5	1	2010-10-22	139484	146358	\N	\N
330627	SPECIFIC_DAY	5	1	2010-08-30	139484	146358	\N	\N
330686	SPECIFIC_DAY	5	2	2010-06-29	139484	146358	\N	\N
330743	SPECIFIC_DAY	5	1	2010-10-19	139484	146358	\N	\N
330668	SPECIFIC_DAY	5	1	2010-12-16	139484	146358	\N	\N
330652	SPECIFIC_DAY	5	1	2010-09-07	139484	146358	\N	\N
330634	SPECIFIC_DAY	5	1	2010-08-23	139484	146358	\N	\N
330647	SPECIFIC_DAY	5	1	2010-08-31	139484	146358	\N	\N
330646	SPECIFIC_DAY	5	2	2010-06-18	139484	146358	\N	\N
330655	SPECIFIC_DAY	5	1	2010-10-06	139484	146358	\N	\N
330672	SPECIFIC_DAY	5	1	2010-10-27	139484	146358	\N	\N
330731	SPECIFIC_DAY	5	2	2010-06-24	139484	146358	\N	\N
330720	SPECIFIC_DAY	5	1	2010-11-23	139484	146358	\N	\N
330696	SPECIFIC_DAY	5	2	2010-07-20	139484	146358	\N	\N
330641	SPECIFIC_DAY	5	1	2010-11-19	139484	146358	\N	\N
330700	SPECIFIC_DAY	5	1	2010-11-10	139484	146358	\N	\N
330653	SPECIFIC_DAY	5	2	2010-07-07	139484	146358	\N	\N
330663	SPECIFIC_DAY	5	2	2010-07-02	139484	146358	\N	\N
330713	SPECIFIC_DAY	5	1	2010-08-13	139484	146358	\N	\N
355912	SPECIFIC_DAY	1	3	2010-06-15	139488	200663	\N	\N
355913	SPECIFIC_DAY	1	2	2010-06-24	139488	200663	\N	\N
355914	SPECIFIC_DAY	1	3	2010-06-16	139488	200663	\N	\N
355915	SPECIFIC_DAY	1	3	2010-06-10	139488	200663	\N	\N
355916	SPECIFIC_DAY	1	2	2010-06-29	139488	200663	\N	\N
355917	SPECIFIC_DAY	1	3	2010-06-11	139488	200663	\N	\N
355918	SPECIFIC_DAY	1	3	2010-06-22	139488	200663	\N	\N
355919	SPECIFIC_DAY	1	3	2010-06-21	139488	200663	\N	\N
355920	SPECIFIC_DAY	1	3	2010-06-18	139488	200663	\N	\N
355921	SPECIFIC_DAY	1	2	2010-06-25	139488	200663	\N	\N
355922	SPECIFIC_DAY	1	2	2010-06-30	139488	200663	\N	\N
355923	SPECIFIC_DAY	1	3	2010-06-17	139488	200663	\N	\N
355924	SPECIFIC_DAY	1	2	2010-06-28	139488	200663	\N	\N
355925	SPECIFIC_DAY	1	3	2010-06-14	139488	200663	\N	\N
355926	SPECIFIC_DAY	1	3	2010-06-23	139488	200663	\N	\N
355927	GENERIC_DAY	1	2	2010-12-20	139482	\N	200665	\N
355928	GENERIC_DAY	1	2	2011-01-04	139482	\N	200665	\N
355929	GENERIC_DAY	1	2	2010-12-31	139482	\N	200665	\N
355930	GENERIC_DAY	1	2	2011-01-12	139484	\N	200665	\N
355931	GENERIC_DAY	1	1	2010-12-20	139484	\N	200665	\N
355932	GENERIC_DAY	1	2	2011-01-04	139484	\N	200665	\N
355933	GENERIC_DAY	1	2	2010-12-23	139486	\N	200665	\N
355934	GENERIC_DAY	1	2	2011-01-05	139484	\N	200665	\N
355935	GENERIC_DAY	1	2	2011-01-13	139484	\N	200665	\N
355936	GENERIC_DAY	1	2	2011-01-11	139484	\N	200665	\N
355937	GENERIC_DAY	1	1	2010-12-30	139486	\N	200665	\N
355938	GENERIC_DAY	1	1	2010-12-22	139484	\N	200665	\N
355939	GENERIC_DAY	1	2	2011-01-05	139482	\N	200665	\N
355940	GENERIC_DAY	1	2	2011-01-10	139484	\N	200665	\N
355941	GENERIC_DAY	1	2	2010-12-28	139484	\N	200665	\N
355942	GENERIC_DAY	1	2	2010-12-22	139486	\N	200665	\N
355943	GENERIC_DAY	1	2	2011-01-07	139482	\N	200665	\N
355944	GENERIC_DAY	1	1	2010-12-23	139484	\N	200665	\N
355945	GENERIC_DAY	1	2	2010-12-20	139486	\N	200665	\N
355946	GENERIC_DAY	1	2	2011-01-06	139482	\N	200665	\N
355947	GENERIC_DAY	1	1	2011-01-10	139486	\N	200665	\N
355948	GENERIC_DAY	1	2	2010-12-29	139484	\N	200665	\N
355949	GENERIC_DAY	1	2	2011-01-11	139482	\N	200665	\N
355950	GENERIC_DAY	1	2	2011-01-13	139482	\N	200665	\N
355951	GENERIC_DAY	1	1	2011-01-12	139486	\N	200665	\N
355952	GENERIC_DAY	1	1	2011-01-06	139486	\N	200665	\N
355953	GENERIC_DAY	1	2	2011-01-12	139482	\N	200665	\N
355954	GENERIC_DAY	1	2	2010-12-17	139482	\N	200665	\N
355955	GENERIC_DAY	1	2	2010-12-28	139482	\N	200665	\N
355956	GENERIC_DAY	1	1	2011-01-03	139486	\N	200665	\N
355957	GENERIC_DAY	1	1	2010-12-28	139486	\N	200665	\N
355958	GENERIC_DAY	1	2	2010-12-30	139484	\N	200665	\N
355959	GENERIC_DAY	1	2	2010-12-23	139482	\N	200665	\N
355960	GENERIC_DAY	1	2	2011-01-10	139482	\N	200665	\N
355961	GENERIC_DAY	1	1	2010-12-21	139484	\N	200665	\N
355962	GENERIC_DAY	1	1	2010-12-24	139484	\N	200665	\N
355963	GENERIC_DAY	1	1	2010-12-27	139484	\N	200665	\N
355964	GENERIC_DAY	1	2	2010-12-24	139486	\N	200665	\N
355965	GENERIC_DAY	1	1	2011-01-11	139486	\N	200665	\N
355966	GENERIC_DAY	1	2	2011-01-03	139484	\N	200665	\N
355967	GENERIC_DAY	1	2	2010-12-31	139484	\N	200665	\N
355968	GENERIC_DAY	1	2	2011-01-03	139482	\N	200665	\N
355969	GENERIC_DAY	1	1	2010-12-31	139486	\N	200665	\N
355970	GENERIC_DAY	1	1	2010-12-17	139484	\N	200665	\N
355971	GENERIC_DAY	1	2	2010-12-27	139486	\N	200665	\N
355972	GENERIC_DAY	1	2	2010-12-21	139486	\N	200665	\N
355973	GENERIC_DAY	1	2	2010-12-30	139482	\N	200665	\N
355974	GENERIC_DAY	1	2	2010-12-21	139482	\N	200665	\N
355975	GENERIC_DAY	1	2	2010-12-24	139482	\N	200665	\N
355976	GENERIC_DAY	1	2	2010-12-17	139486	\N	200665	\N
355977	GENERIC_DAY	1	1	2011-01-05	139486	\N	200665	\N
355978	GENERIC_DAY	1	1	2011-01-13	139486	\N	200665	\N
355979	GENERIC_DAY	1	2	2010-12-22	139482	\N	200665	\N
355980	GENERIC_DAY	1	2	2010-12-27	139482	\N	200665	\N
355981	GENERIC_DAY	1	2	2011-01-07	139484	\N	200665	\N
355982	GENERIC_DAY	1	2	2010-12-29	139482	\N	200665	\N
355983	GENERIC_DAY	1	1	2010-12-29	139486	\N	200665	\N
355984	GENERIC_DAY	1	1	2011-01-04	139486	\N	200665	\N
355985	GENERIC_DAY	1	1	2011-01-07	139486	\N	200665	\N
355986	GENERIC_DAY	1	2	2011-01-06	139484	\N	200665	\N
330578	SPECIFIC_DAY	5	2	2010-12-09	139484	146357	\N	\N
330531	SPECIFIC_DAY	5	2	2010-12-15	139484	146357	\N	\N
330488	SPECIFIC_DAY	5	2	2010-09-28	139484	146357	\N	\N
330613	SPECIFIC_DAY	5	2	2010-10-11	139484	146357	\N	\N
330573	SPECIFIC_DAY	5	3	2010-06-17	139484	146357	\N	\N
330559	SPECIFIC_DAY	5	2	2010-08-03	139484	146357	\N	\N
330530	SPECIFIC_DAY	5	2	2010-12-10	139484	146357	\N	\N
330494	SPECIFIC_DAY	5	2	2010-06-24	139484	146357	\N	\N
330591	SPECIFIC_DAY	5	2	2010-08-25	139484	146357	\N	\N
330548	SPECIFIC_DAY	5	2	2010-08-24	139484	146357	\N	\N
330592	SPECIFIC_DAY	5	2	2010-11-29	139484	146357	\N	\N
330602	SPECIFIC_DAY	5	2	2010-08-10	139484	146357	\N	\N
330546	SPECIFIC_DAY	5	2	2010-09-23	139484	146357	\N	\N
330504	SPECIFIC_DAY	5	2	2010-08-12	139484	146357	\N	\N
330570	SPECIFIC_DAY	5	3	2010-06-10	139484	146357	\N	\N
330600	SPECIFIC_DAY	5	3	2010-06-11	139484	146357	\N	\N
330545	SPECIFIC_DAY	5	2	2010-07-28	139484	146357	\N	\N
330607	SPECIFIC_DAY	5	2	2010-12-01	139484	146357	\N	\N
330558	SPECIFIC_DAY	5	2	2010-07-19	139484	146357	\N	\N
330595	SPECIFIC_DAY	5	2	2010-09-06	139484	146357	\N	\N
330555	SPECIFIC_DAY	5	2	2010-09-07	139484	146357	\N	\N
330589	SPECIFIC_DAY	5	2	2010-10-20	139484	146357	\N	\N
330608	SPECIFIC_DAY	5	2	2010-06-30	139484	146357	\N	\N
330604	SPECIFIC_DAY	5	2	2010-09-03	139484	146357	\N	\N
330588	SPECIFIC_DAY	5	2	2010-11-16	139484	146357	\N	\N
330540	SPECIFIC_DAY	5	2	2010-09-22	139484	146357	\N	\N
330565	SPECIFIC_DAY	5	2	2010-11-15	139484	146357	\N	\N
330581	SPECIFIC_DAY	5	2	2010-07-27	139484	146357	\N	\N
330526	SPECIFIC_DAY	5	2	2010-11-11	139484	146357	\N	\N
330617	SPECIFIC_DAY	5	3	2010-06-14	139484	146357	\N	\N
330605	SPECIFIC_DAY	5	2	2010-09-16	139484	146357	\N	\N
330577	SPECIFIC_DAY	5	2	2010-11-09	139484	146357	\N	\N
330529	SPECIFIC_DAY	5	2	2010-07-21	139484	146357	\N	\N
330571	SPECIFIC_DAY	5	2	2010-09-09	139484	146357	\N	\N
330547	SPECIFIC_DAY	5	2	2010-10-06	139484	146357	\N	\N
330493	SPECIFIC_DAY	5	2	2010-07-20	139484	146357	\N	\N
330513	SPECIFIC_DAY	5	2	2010-11-10	139484	146357	\N	\N
330615	SPECIFIC_DAY	5	2	2010-09-27	139484	146357	\N	\N
330503	SPECIFIC_DAY	5	2	2010-11-12	139484	146357	\N	\N
330603	SPECIFIC_DAY	5	2	2010-07-29	139484	146357	\N	\N
330574	SPECIFIC_DAY	5	2	2010-09-24	139484	146357	\N	\N
330576	SPECIFIC_DAY	5	2	2010-07-22	139484	146357	\N	\N
330490	SPECIFIC_DAY	5	2	2010-08-17	139484	146357	\N	\N
330568	SPECIFIC_DAY	5	2	2010-07-06	139484	146357	\N	\N
330489	SPECIFIC_DAY	5	2	2010-08-26	139484	146357	\N	\N
330511	SPECIFIC_DAY	5	2	2010-09-10	139484	146357	\N	\N
330618	SPECIFIC_DAY	5	2	2010-09-01	139484	146357	\N	\N
330491	SPECIFIC_DAY	5	2	2010-12-16	139484	146357	\N	\N
330587	SPECIFIC_DAY	5	2	2010-10-07	139484	146357	\N	\N
330550	SPECIFIC_DAY	5	2	2010-07-05	139484	146357	\N	\N
330506	SPECIFIC_DAY	5	2	2010-08-31	139484	146357	\N	\N
330580	SPECIFIC_DAY	5	2	2010-10-05	139484	146357	\N	\N
330552	SPECIFIC_DAY	5	2	2010-09-15	139484	146357	\N	\N
330551	SPECIFIC_DAY	5	2	2010-10-25	139484	146357	\N	\N
330564	SPECIFIC_DAY	5	2	2010-08-04	139484	146357	\N	\N
330606	SPECIFIC_DAY	5	2	2010-10-19	139484	146357	\N	\N
330528	SPECIFIC_DAY	5	2	2010-12-13	139484	146357	\N	\N
330518	SPECIFIC_DAY	5	2	2010-08-13	139484	146357	\N	\N
330582	SPECIFIC_DAY	5	2	2010-09-02	139484	146357	\N	\N
330533	SPECIFIC_DAY	5	2	2010-11-30	139484	146357	\N	\N
330492	SPECIFIC_DAY	5	2	2010-10-15	139484	146357	\N	\N
330599	SPECIFIC_DAY	5	2	2010-12-17	139484	146357	\N	\N
330596	SPECIFIC_DAY	5	2	2010-10-27	139484	146357	\N	\N
330598	SPECIFIC_DAY	5	2	2010-06-25	139484	146357	\N	\N
330560	SPECIFIC_DAY	5	2	2010-09-13	139484	146357	\N	\N
330586	SPECIFIC_DAY	5	2	2010-12-07	139484	146357	\N	\N
330516	SPECIFIC_DAY	5	2	2010-07-08	139484	146357	\N	\N
330612	SPECIFIC_DAY	5	2	2010-07-09	139484	146357	\N	\N
330507	SPECIFIC_DAY	5	2	2010-07-07	139484	146357	\N	\N
330590	SPECIFIC_DAY	5	2	2010-09-20	139484	146357	\N	\N
330569	SPECIFIC_DAY	5	2	2010-06-29	139484	146357	\N	\N
330572	SPECIFIC_DAY	5	2	2010-10-26	139484	146357	\N	\N
330515	SPECIFIC_DAY	5	2	2010-09-29	139484	146357	\N	\N
330557	SPECIFIC_DAY	5	2	2010-10-01	139484	146357	\N	\N
330597	SPECIFIC_DAY	5	2	2010-11-18	139484	146357	\N	\N
330575	SPECIFIC_DAY	5	2	2010-07-16	139484	146357	\N	\N
330534	SPECIFIC_DAY	5	2	2010-08-27	139484	146357	\N	\N
330601	SPECIFIC_DAY	5	2	2010-06-21	139484	146357	\N	\N
330524	SPECIFIC_DAY	5	2	2010-07-01	139484	146357	\N	\N
330594	SPECIFIC_DAY	5	2	2010-07-23	139484	146357	\N	\N
329432	GENERIC_DAY	5	3	2010-06-14	139486	\N	200642	\N
329435	GENERIC_DAY	5	0	2010-06-12	139486	\N	200642	\N
329438	GENERIC_DAY	5	2	2010-06-11	139484	\N	200642	\N
329427	GENERIC_DAY	5	2	2010-06-10	139486	\N	200642	\N
329429	GENERIC_DAY	5	3	2010-06-11	139482	\N	200642	\N
329437	GENERIC_DAY	5	3	2010-06-10	139482	\N	200642	\N
329436	GENERIC_DAY	5	2	2010-06-10	139484	\N	200642	\N
329433	GENERIC_DAY	5	2	2010-06-11	139486	\N	200642	\N
329439	GENERIC_DAY	5	0	2010-06-13	139484	\N	200642	\N
329430	GENERIC_DAY	5	0	2010-06-13	139486	\N	200642	\N
329428	GENERIC_DAY	5	0	2010-06-12	139484	\N	200642	\N
329425	GENERIC_DAY	5	0	2010-06-12	139482	\N	200642	\N
329434	GENERIC_DAY	5	0	2010-06-13	139482	\N	200642	\N
329426	GENERIC_DAY	5	2	2010-06-14	139484	\N	200642	\N
329431	GENERIC_DAY	5	2	2010-06-14	139482	\N	200642	\N
355987	GENERIC_DAY	1	5	2010-06-22	139486	\N	200643	\N
355988	GENERIC_DAY	1	7	2010-06-15	139486	\N	200643	\N
355989	GENERIC_DAY	1	2	2010-06-17	139486	\N	200643	\N
355990	GENERIC_DAY	1	0	2010-06-19	139486	\N	200643	\N
355991	GENERIC_DAY	1	0	2010-06-20	139486	\N	200643	\N
355992	GENERIC_DAY	1	6	2010-06-16	139486	\N	200643	\N
355993	GENERIC_DAY	1	0	2010-06-20	139484	\N	200643	\N
355994	GENERIC_DAY	1	0	2010-06-16	139484	\N	200643	\N
355995	GENERIC_DAY	1	0	2010-06-22	139482	\N	200643	\N
355996	GENERIC_DAY	1	0	2010-06-22	139484	\N	200643	\N
355997	GENERIC_DAY	1	0	2010-06-19	139482	\N	200643	\N
355998	GENERIC_DAY	1	0	2010-06-20	139482	\N	200643	\N
355999	GENERIC_DAY	1	1	2010-06-16	139482	\N	200643	\N
356000	GENERIC_DAY	1	0	2010-06-21	139482	\N	200643	\N
356001	GENERIC_DAY	1	5	2010-06-21	139486	\N	200643	\N
356002	GENERIC_DAY	1	2	2010-06-18	139482	\N	200643	\N
356003	GENERIC_DAY	1	3	2010-06-18	139484	\N	200643	\N
356004	GENERIC_DAY	1	2	2010-06-21	139484	\N	200643	\N
356005	GENERIC_DAY	1	2	2010-06-17	139484	\N	200643	\N
356006	GENERIC_DAY	1	2	2010-06-18	139486	\N	200643	\N
356007	GENERIC_DAY	1	0	2010-06-19	139484	\N	200643	\N
356008	GENERIC_DAY	1	0	2010-06-15	139484	\N	200643	\N
356009	GENERIC_DAY	1	0	2010-06-15	139482	\N	200643	\N
356010	GENERIC_DAY	1	3	2010-06-17	139482	\N	200643	\N
356011	GENERIC_DAY	1	0	2010-06-23	139482	\N	200644	\N
356012	GENERIC_DAY	1	0	2010-06-24	139482	\N	200644	\N
356013	GENERIC_DAY	1	2	2010-06-25	139484	\N	200644	\N
356014	GENERIC_DAY	1	5	2010-06-24	139486	\N	200644	\N
356015	GENERIC_DAY	1	2	2010-06-23	139484	\N	200644	\N
356016	GENERIC_DAY	1	4	2010-06-25	139486	\N	200644	\N
356017	GENERIC_DAY	1	2	2010-06-24	139484	\N	200644	\N
356018	GENERIC_DAY	1	5	2010-06-23	139486	\N	200644	\N
356019	GENERIC_DAY	1	1	2010-06-25	139482	\N	200644	\N
356020	GENERIC_DAY	1	2	2010-06-28	139482	\N	200645	\N
356021	GENERIC_DAY	1	3	2010-06-29	139482	\N	200645	\N
356022	GENERIC_DAY	1	0	2010-06-27	139482	\N	200645	\N
356023	GENERIC_DAY	1	3	2010-06-30	139482	\N	200645	\N
356024	GENERIC_DAY	1	1	2010-06-30	139484	\N	200645	\N
356025	GENERIC_DAY	1	2	2010-06-29	139486	\N	200645	\N
356026	GENERIC_DAY	1	0	2010-06-27	139486	\N	200645	\N
356027	GENERIC_DAY	1	2	2010-06-28	139486	\N	200645	\N
356028	GENERIC_DAY	1	2	2010-06-29	139484	\N	200645	\N
356029	GENERIC_DAY	1	3	2010-06-28	139484	\N	200645	\N
356030	GENERIC_DAY	1	0	2010-06-26	139482	\N	200645	\N
356031	GENERIC_DAY	1	3	2010-06-30	139486	\N	200645	\N
356032	GENERIC_DAY	1	0	2010-06-26	139484	\N	200645	\N
356033	GENERIC_DAY	1	0	2010-06-26	139486	\N	200645	\N
356034	GENERIC_DAY	1	0	2010-06-27	139484	\N	200645	\N
356035	GENERIC_DAY	1	3	2010-07-01	139482	\N	200646	\N
356036	GENERIC_DAY	1	3	2010-07-02	139482	\N	200646	\N
356037	GENERIC_DAY	1	0	2010-07-02	139484	\N	200646	\N
356038	GENERIC_DAY	1	3	2010-07-01	139486	\N	200646	\N
356039	GENERIC_DAY	1	1	2010-07-01	139484	\N	200646	\N
356040	GENERIC_DAY	1	4	2010-07-02	139486	\N	200646	\N
356041	GENERIC_DAY	1	1	2010-07-05	139482	\N	200647	\N
356042	GENERIC_DAY	1	1	2010-07-05	139486	\N	200647	\N
356043	GENERIC_DAY	1	2	2010-07-05	139484	\N	200647	\N
356044	GENERIC_DAY	1	0	2010-07-03	139484	\N	200647	\N
356045	GENERIC_DAY	1	0	2010-07-03	139482	\N	200647	\N
356046	GENERIC_DAY	1	0	2010-07-04	139484	\N	200647	\N
356047	GENERIC_DAY	1	0	2010-07-03	139486	\N	200647	\N
356048	GENERIC_DAY	1	0	2010-07-04	139486	\N	200647	\N
356049	GENERIC_DAY	1	0	2010-07-04	139482	\N	200647	\N
356050	GENERIC_DAY	1	3	2010-07-09	139484	\N	200648	\N
356051	GENERIC_DAY	1	2	2010-07-09	139482	\N	200648	\N
356052	GENERIC_DAY	1	2	2010-07-07	139484	\N	200648	\N
356053	GENERIC_DAY	1	2	2010-07-08	139486	\N	200648	\N
356054	GENERIC_DAY	1	2	2010-07-06	139486	\N	200648	\N
356055	GENERIC_DAY	1	2	2010-07-06	139482	\N	200648	\N
356056	GENERIC_DAY	1	3	2010-07-07	139486	\N	200648	\N
356057	GENERIC_DAY	1	2	2010-07-07	139482	\N	200648	\N
356058	GENERIC_DAY	1	3	2010-07-06	139484	\N	200648	\N
356059	GENERIC_DAY	1	2	2010-07-08	139482	\N	200648	\N
356060	GENERIC_DAY	1	3	2010-07-08	139484	\N	200648	\N
356061	GENERIC_DAY	1	2	2010-07-09	139486	\N	200648	\N
356062	GENERIC_DAY	1	1	2010-07-14	139486	\N	200649	\N
356063	GENERIC_DAY	1	1	2010-07-14	139482	\N	200649	\N
356064	GENERIC_DAY	1	3	2010-07-13	139484	\N	200649	\N
356065	GENERIC_DAY	1	2	2010-07-13	139486	\N	200649	\N
356066	GENERIC_DAY	1	1	2010-07-14	139484	\N	200649	\N
356067	GENERIC_DAY	1	0	2010-07-11	139486	\N	200649	\N
356068	GENERIC_DAY	1	0	2010-07-10	139482	\N	200649	\N
356069	GENERIC_DAY	1	0	2010-07-10	139484	\N	200649	\N
356070	GENERIC_DAY	1	0	2010-07-11	139484	\N	200649	\N
356071	GENERIC_DAY	1	3	2010-07-12	139484	\N	200649	\N
356072	GENERIC_DAY	1	2	2010-07-12	139482	\N	200649	\N
356073	GENERIC_DAY	1	2	2010-07-12	139486	\N	200649	\N
356074	GENERIC_DAY	1	2	2010-07-13	139482	\N	200649	\N
356075	GENERIC_DAY	1	0	2010-07-11	139482	\N	200649	\N
356076	GENERIC_DAY	1	0	2010-07-10	139486	\N	200649	\N
356077	GENERIC_DAY	1	1	2010-07-19	139486	\N	200650	\N
356078	GENERIC_DAY	1	0	2010-07-18	139484	\N	200650	\N
356079	GENERIC_DAY	1	2	2010-07-16	139486	\N	200650	\N
356080	GENERIC_DAY	1	3	2010-07-15	139486	\N	200650	\N
356081	GENERIC_DAY	1	0	2010-07-17	139486	\N	200650	\N
356082	GENERIC_DAY	1	3	2010-07-16	139484	\N	200650	\N
356083	GENERIC_DAY	1	2	2010-07-15	139484	\N	200650	\N
356084	GENERIC_DAY	1	1	2010-07-19	139482	\N	200650	\N
356085	GENERIC_DAY	1	0	2010-07-18	139482	\N	200650	\N
356086	GENERIC_DAY	1	1	2010-07-19	139484	\N	200650	\N
356087	GENERIC_DAY	1	2	2010-07-16	139482	\N	200650	\N
356088	GENERIC_DAY	1	0	2010-07-17	139484	\N	200650	\N
356089	GENERIC_DAY	1	0	2010-07-18	139486	\N	200650	\N
356090	GENERIC_DAY	1	2	2010-07-15	139482	\N	200650	\N
356091	GENERIC_DAY	1	0	2010-07-17	139482	\N	200650	\N
356092	GENERIC_DAY	1	2	2010-07-20	139486	\N	200651	\N
356093	GENERIC_DAY	1	2	2010-07-22	139482	\N	200651	\N
356094	GENERIC_DAY	1	3	2010-07-22	139484	\N	200651	\N
356095	GENERIC_DAY	1	2	2010-07-27	139486	\N	200651	\N
356096	GENERIC_DAY	1	2	2010-07-22	139486	\N	200651	\N
356097	GENERIC_DAY	1	2	2010-07-26	139482	\N	200651	\N
356098	GENERIC_DAY	1	1	2010-07-28	139486	\N	200651	\N
356099	GENERIC_DAY	1	3	2010-07-20	139484	\N	200651	\N
356100	GENERIC_DAY	1	3	2010-07-21	139486	\N	200651	\N
356101	GENERIC_DAY	1	0	2010-07-24	139486	\N	200651	\N
356102	GENERIC_DAY	1	2	2010-07-20	139482	\N	200651	\N
356103	GENERIC_DAY	1	0	2010-07-24	139484	\N	200651	\N
356104	GENERIC_DAY	1	3	2010-07-26	139484	\N	200651	\N
356105	GENERIC_DAY	1	3	2010-07-23	139484	\N	200651	\N
356106	GENERIC_DAY	1	0	2010-07-25	139482	\N	200651	\N
356107	GENERIC_DAY	1	1	2010-07-28	139484	\N	200651	\N
356108	GENERIC_DAY	1	2	2010-07-28	139482	\N	200651	\N
356109	GENERIC_DAY	1	2	2010-07-26	139486	\N	200651	\N
356110	GENERIC_DAY	1	2	2010-07-21	139482	\N	200651	\N
356111	GENERIC_DAY	1	2	2010-07-23	139486	\N	200651	\N
356112	GENERIC_DAY	1	0	2010-07-25	139484	\N	200651	\N
356113	GENERIC_DAY	1	2	2010-07-21	139484	\N	200651	\N
356114	GENERIC_DAY	1	2	2010-07-23	139482	\N	200651	\N
356115	GENERIC_DAY	1	2	2010-07-27	139484	\N	200651	\N
356116	GENERIC_DAY	1	3	2010-07-27	139482	\N	200651	\N
356117	GENERIC_DAY	1	0	2010-07-25	139486	\N	200651	\N
356118	GENERIC_DAY	1	0	2010-07-24	139482	\N	200651	\N
352609	GENERIC_DAY	3	0	2010-08-01	139484	\N	148714	\N
352739	GENERIC_DAY	3	3	2010-09-01	139482	\N	148714	\N
352687	GENERIC_DAY	3	3	2010-07-21	139486	\N	148714	\N
352741	GENERIC_DAY	3	0	2010-08-28	139482	\N	148714	\N
352691	GENERIC_DAY	3	3	2010-09-10	139482	\N	148714	\N
352756	GENERIC_DAY	3	0	2010-08-29	139486	\N	148714	\N
352814	GENERIC_DAY	3	3	2010-08-02	139486	\N	148714	\N
352763	GENERIC_DAY	3	2	2010-07-30	139484	\N	148714	\N
352599	GENERIC_DAY	3	2	2010-09-14	139486	\N	148714	\N
352769	GENERIC_DAY	3	0	2010-07-05	139484	\N	148714	\N
352753	GENERIC_DAY	3	0	2010-08-28	139484	\N	148714	\N
352812	GENERIC_DAY	3	3	2010-08-03	139486	\N	148714	\N
352780	GENERIC_DAY	3	2	2010-08-10	139486	\N	148714	\N
352766	GENERIC_DAY	3	0	2010-08-07	139484	\N	148714	\N
352714	GENERIC_DAY	3	0	2010-09-12	139486	\N	148714	\N
352731	GENERIC_DAY	3	0	2010-09-04	139482	\N	148714	\N
352772	GENERIC_DAY	3	0	2010-08-27	139484	\N	148714	\N
352801	GENERIC_DAY	3	4	2010-08-24	139482	\N	148714	\N
352755	GENERIC_DAY	3	2	2010-08-11	139482	\N	148714	\N
352728	GENERIC_DAY	3	0	2010-08-22	139486	\N	148714	\N
352732	GENERIC_DAY	3	0	2010-07-04	139486	\N	148714	\N
352817	GENERIC_DAY	3	0	2010-09-03	139484	\N	148714	\N
352792	GENERIC_DAY	3	3	2010-09-03	139482	\N	148714	\N
352735	GENERIC_DAY	3	3	2010-08-19	139486	\N	148714	\N
352601	GENERIC_DAY	3	1	2010-08-19	139484	\N	148714	\N
352702	GENERIC_DAY	3	3	2010-09-06	139482	\N	148714	\N
352751	GENERIC_DAY	3	1	2010-08-23	139484	\N	148714	\N
352767	GENERIC_DAY	3	0	2010-07-18	139482	\N	148714	\N
352748	GENERIC_DAY	3	0	2010-07-25	139486	\N	148714	\N
352613	GENERIC_DAY	3	1	2010-08-17	139484	\N	148714	\N
352778	GENERIC_DAY	3	0	2010-08-14	139484	\N	148714	\N
352800	GENERIC_DAY	3	1	2010-08-04	139484	\N	148714	\N
352768	GENERIC_DAY	3	3	2010-08-26	139486	\N	148714	\N
352715	GENERIC_DAY	3	4	2010-07-13	139482	\N	148714	\N
352754	GENERIC_DAY	3	1	2010-08-25	139484	\N	148714	\N
352606	GENERIC_DAY	3	0	2010-07-04	139484	\N	148714	\N
352808	GENERIC_DAY	3	0	2010-07-03	139482	\N	148714	\N
352803	GENERIC_DAY	3	2	2010-07-28	139486	\N	148714	\N
352711	GENERIC_DAY	3	0	2010-07-22	139484	\N	148714	\N
352697	GENERIC_DAY	3	3	2010-07-05	139486	\N	148714	\N
352617	GENERIC_DAY	3	4	2010-07-28	139482	\N	148714	\N
352727	GENERIC_DAY	3	3	2010-09-09	139482	\N	148714	\N
352749	GENERIC_DAY	3	0	2010-07-24	139486	\N	148714	\N
352782	GENERIC_DAY	3	0	2010-09-05	139484	\N	148714	\N
352757	GENERIC_DAY	3	0	2010-07-24	139484	\N	148714	\N
352779	GENERIC_DAY	3	0	2010-08-29	139482	\N	148714	\N
352746	GENERIC_DAY	3	0	2010-08-13	139484	\N	148714	\N
352618	GENERIC_DAY	3	0	2010-07-19	139484	\N	148714	\N
352614	GENERIC_DAY	3	3	2010-08-17	139486	\N	148714	\N
352807	GENERIC_DAY	3	0	2010-07-15	139484	\N	148714	\N
352611	GENERIC_DAY	3	0	2010-09-04	139486	\N	148714	\N
352604	GENERIC_DAY	3	0	2010-08-01	139482	\N	148714	\N
352733	GENERIC_DAY	3	0	2010-07-23	139484	\N	148714	\N
352788	GENERIC_DAY	3	0	2010-07-11	139482	\N	148714	\N
352752	GENERIC_DAY	3	3	2010-08-06	139486	\N	148714	\N
352796	GENERIC_DAY	3	0	2010-08-06	139484	\N	148714	\N
352725	GENERIC_DAY	3	0	2010-09-11	139486	\N	148714	\N
352699	GENERIC_DAY	3	3	2010-08-23	139486	\N	148714	\N
352759	GENERIC_DAY	3	0	2010-07-20	139484	\N	148714	\N
352762	GENERIC_DAY	3	1	2010-09-14	139484	\N	148714	\N
352740	GENERIC_DAY	3	2	2010-08-10	139484	\N	148714	\N
352761	GENERIC_DAY	3	2	2010-09-13	139486	\N	148714	\N
352649	GENERIC_DAY	3	0	2010-07-14	139484	\N	148714	\N
352758	GENERIC_DAY	3	0	2010-08-07	139486	\N	148714	\N
352787	GENERIC_DAY	3	0	2010-07-18	139486	\N	148714	\N
352698	GENERIC_DAY	3	3	2010-08-09	139486	\N	148714	\N
352670	GENERIC_DAY	3	4	2010-07-22	139482	\N	148714	\N
352620	GENERIC_DAY	3	3	2010-08-10	139482	\N	148714	\N
352765	GENERIC_DAY	3	2	2010-09-09	139486	\N	148714	\N
352610	GENERIC_DAY	3	4	2010-07-07	139482	\N	148714	\N
352701	GENERIC_DAY	3	0	2010-07-13	139484	\N	148714	\N
352718	GENERIC_DAY	3	4	2010-07-19	139482	\N	148714	\N
352681	GENERIC_DAY	3	1	2010-07-27	139484	\N	148714	\N
352622	GENERIC_DAY	3	3	2010-08-25	139486	\N	148714	\N
352709	GENERIC_DAY	3	0	2010-07-10	139482	\N	148714	\N
352615	GENERIC_DAY	3	3	2010-08-17	139482	\N	148714	\N
352646	GENERIC_DAY	3	4	2010-07-23	139482	\N	148714	\N
352629	GENERIC_DAY	3	0	2010-09-08	139484	\N	148714	\N
352639	GENERIC_DAY	3	0	2010-07-25	139484	\N	148714	\N
352713	GENERIC_DAY	3	0	2010-08-14	139482	\N	148714	\N
352723	GENERIC_DAY	3	4	2010-09-02	139486	\N	148714	\N
352737	GENERIC_DAY	3	0	2010-07-26	139484	\N	148714	\N
352651	GENERIC_DAY	3	0	2010-09-12	139484	\N	148714	\N
352721	GENERIC_DAY	3	4	2010-08-26	139482	\N	148714	\N
352793	GENERIC_DAY	3	3	2010-08-05	139482	\N	148714	\N
352736	GENERIC_DAY	3	4	2010-08-06	139482	\N	148714	\N
352774	GENERIC_DAY	3	0	2010-07-03	139484	\N	148714	\N
352734	GENERIC_DAY	3	3	2010-08-20	139486	\N	148714	\N
352738	GENERIC_DAY	3	0	2010-09-12	139482	\N	148714	\N
352818	GENERIC_DAY	3	0	2010-09-05	139486	\N	148714	\N
352809	GENERIC_DAY	3	3	2010-08-04	139486	\N	148714	\N
352700	GENERIC_DAY	3	2	2010-08-24	139486	\N	148714	\N
352819	GENERIC_DAY	3	4	2010-07-14	139482	\N	148714	\N
352742	GENERIC_DAY	3	4	2010-07-05	139482	\N	148714	\N
352785	GENERIC_DAY	3	3	2010-07-06	139486	\N	148714	\N
352720	GENERIC_DAY	3	4	2010-08-31	139486	\N	148714	\N
352600	GENERIC_DAY	3	4	2010-07-21	139482	\N	148714	\N
352783	GENERIC_DAY	3	3	2010-07-29	139486	\N	148714	\N
352708	GENERIC_DAY	3	3	2010-07-08	139486	\N	148714	\N
352775	GENERIC_DAY	3	0	2010-09-11	139482	\N	148714	\N
352607	GENERIC_DAY	3	2	2010-09-13	139484	\N	148714	\N
352781	GENERIC_DAY	3	3	2010-08-19	139482	\N	148714	\N
352773	GENERIC_DAY	3	4	2010-07-26	139482	\N	148714	\N
352689	GENERIC_DAY	3	4	2010-09-08	139482	\N	148714	\N
352776	GENERIC_DAY	3	1	2010-09-07	139484	\N	148714	\N
352719	GENERIC_DAY	3	5	2010-08-13	139482	\N	148714	\N
352631	GENERIC_DAY	3	0	2010-08-21	139482	\N	148714	\N
352637	GENERIC_DAY	3	4	2010-08-18	139486	\N	148714	\N
352602	GENERIC_DAY	3	0	2010-07-08	139484	\N	148714	\N
352784	GENERIC_DAY	3	0	2010-08-08	139484	\N	148714	\N
352791	GENERIC_DAY	3	3	2010-09-13	139482	\N	148714	\N
352692	GENERIC_DAY	3	2	2010-07-30	139482	\N	148714	\N
352810	GENERIC_DAY	3	0	2010-09-05	139482	\N	148714	\N
352797	GENERIC_DAY	3	3	2010-08-20	139482	\N	148714	\N
352671	GENERIC_DAY	3	3	2010-08-27	139482	\N	148714	\N
352679	GENERIC_DAY	3	1	2010-08-02	139484	\N	148714	\N
352677	GENERIC_DAY	3	2	2010-09-02	139482	\N	148714	\N
352647	GENERIC_DAY	3	3	2010-07-13	139486	\N	148714	\N
352705	GENERIC_DAY	3	3	2010-07-16	139482	\N	148714	\N
352653	GENERIC_DAY	3	0	2010-07-04	139482	\N	148714	\N
352805	GENERIC_DAY	3	4	2010-07-27	139482	\N	148714	\N
352626	GENERIC_DAY	3	3	2010-07-22	139486	\N	148714	\N
352770	GENERIC_DAY	3	4	2010-07-20	139486	\N	148714	\N
352683	GENERIC_DAY	3	0	2010-07-25	139482	\N	148714	\N
352726	GENERIC_DAY	3	2	2010-09-10	139484	\N	148714	\N
352628	GENERIC_DAY	3	0	2010-08-31	139484	\N	148714	\N
352654	GENERIC_DAY	3	0	2010-07-24	139482	\N	148714	\N
352744	GENERIC_DAY	3	2	2010-09-07	139482	\N	148714	\N
352745	GENERIC_DAY	3	1	2010-07-28	139484	\N	148714	\N
352667	GENERIC_DAY	3	0	2010-07-03	139486	\N	148714	\N
352764	GENERIC_DAY	3	0	2010-08-26	139484	\N	148714	\N
352816	GENERIC_DAY	3	3	2010-09-06	139486	\N	148714	\N
352625	GENERIC_DAY	3	0	2010-08-18	139484	\N	148714	\N
352630	GENERIC_DAY	3	0	2010-08-07	139482	\N	148714	\N
352656	GENERIC_DAY	3	3	2010-07-14	139486	\N	148714	\N
352790	GENERIC_DAY	3	0	2010-08-16	139484	\N	148714	\N
352673	GENERIC_DAY	3	3	2010-08-18	139482	\N	148714	\N
352789	GENERIC_DAY	3	0	2010-08-08	139486	\N	148714	\N
352621	GENERIC_DAY	3	0	2010-07-31	139484	\N	148714	\N
352729	GENERIC_DAY	3	1	2010-08-20	139484	\N	148714	\N
352658	GENERIC_DAY	3	3	2010-09-08	139486	\N	148714	\N
352640	GENERIC_DAY	3	0	2010-07-07	139484	\N	148714	\N
352786	GENERIC_DAY	3	0	2010-07-17	139482	\N	148714	\N
352815	GENERIC_DAY	3	0	2010-08-21	139484	\N	148714	\N
352795	GENERIC_DAY	3	3	2010-07-09	139486	\N	148714	\N
352641	GENERIC_DAY	3	3	2010-07-07	139486	\N	148714	\N
352707	GENERIC_DAY	3	0	2010-08-12	139484	\N	148714	\N
352624	GENERIC_DAY	3	1	2010-08-11	139484	\N	148714	\N
352716	GENERIC_DAY	3	0	2010-07-18	139484	\N	148714	\N
352806	GENERIC_DAY	3	3	2010-07-30	139486	\N	148714	\N
352636	GENERIC_DAY	3	4	2010-07-12	139486	\N	148714	\N
352750	GENERIC_DAY	3	0	2010-07-17	139484	\N	148714	\N
352686	GENERIC_DAY	3	3	2010-07-23	139486	\N	148714	\N
352598	GENERIC_DAY	3	1	2010-08-24	139484	\N	148714	\N
352605	GENERIC_DAY	3	2	2010-07-27	139486	\N	148714	\N
352690	GENERIC_DAY	3	1	2010-08-05	139484	\N	148714	\N
352666	GENERIC_DAY	3	0	2010-08-29	139484	\N	148714	\N
352712	GENERIC_DAY	3	0	2010-07-17	139486	\N	148714	\N
352717	GENERIC_DAY	3	2	2010-09-10	139486	\N	148714	\N
352616	GENERIC_DAY	3	2	2010-08-12	139486	\N	148714	\N
352706	GENERIC_DAY	3	4	2010-08-27	139486	\N	148714	\N
352695	GENERIC_DAY	3	0	2010-08-22	139484	\N	148714	\N
352688	GENERIC_DAY	3	3	2010-08-23	139482	\N	148714	\N
352635	GENERIC_DAY	3	3	2010-08-02	139482	\N	148714	\N
352730	GENERIC_DAY	3	0	2010-07-31	139486	\N	148714	\N
352659	GENERIC_DAY	3	4	2010-09-03	139486	\N	148714	\N
352623	GENERIC_DAY	3	0	2010-09-01	139484	\N	148714	\N
352643	GENERIC_DAY	3	0	2010-07-31	139482	\N	148714	\N
352676	GENERIC_DAY	3	4	2010-08-30	139486	\N	148714	\N
352710	GENERIC_DAY	3	5	2010-08-12	139482	\N	148714	\N
352777	GENERIC_DAY	3	2	2010-09-09	139484	\N	148714	\N
352704	GENERIC_DAY	3	4	2010-08-16	139482	\N	148714	\N
352747	GENERIC_DAY	3	0	2010-08-21	139486	\N	148714	\N
352603	GENERIC_DAY	3	3	2010-08-31	139482	\N	148714	\N
352802	GENERIC_DAY	3	4	2010-07-16	139486	\N	148714	\N
352813	GENERIC_DAY	3	0	2010-07-06	139484	\N	148714	\N
352722	GENERIC_DAY	3	0	2010-07-12	139484	\N	148714	\N
352771	GENERIC_DAY	3	3	2010-08-25	139482	\N	148714	\N
352693	GENERIC_DAY	3	1	2010-09-06	139484	\N	148714	\N
352652	GENERIC_DAY	3	4	2010-08-09	139482	\N	148714	\N
352634	GENERIC_DAY	3	0	2010-08-01	139486	\N	148714	\N
352660	GENERIC_DAY	3	0	2010-08-15	139486	\N	148714	\N
352811	GENERIC_DAY	3	4	2010-09-07	139486	\N	148714	\N
352612	GENERIC_DAY	3	0	2010-07-10	139484	\N	148714	\N
352743	GENERIC_DAY	3	4	2010-08-11	139486	\N	148714	\N
352794	GENERIC_DAY	3	0	2010-09-04	139484	\N	148714	\N
352798	GENERIC_DAY	3	0	2010-08-30	139484	\N	148714	\N
352804	GENERIC_DAY	3	0	2010-09-11	139484	\N	148714	\N
352694	GENERIC_DAY	3	0	2010-07-10	139486	\N	148714	\N
352608	GENERIC_DAY	3	1	2010-09-02	139484	\N	148714	\N
352799	GENERIC_DAY	3	4	2010-09-01	139486	\N	148714	\N
352684	GENERIC_DAY	3	3	2010-07-29	139482	\N	148714	\N
352760	GENERIC_DAY	3	3	2010-07-15	139486	\N	148714	\N
352703	GENERIC_DAY	3	4	2010-07-15	139482	\N	148714	\N
352619	GENERIC_DAY	3	2	2010-08-03	139484	\N	148714	\N
330142	GENERIC_DAY	5	0	2010-10-16	139482	\N	200656	\N
330073	GENERIC_DAY	5	1	2010-09-10	139484	\N	200656	\N
330040	GENERIC_DAY	5	1	2010-08-06	139482	\N	200656	\N
330162	GENERIC_DAY	5	1	2010-09-07	139486	\N	200656	\N
330180	GENERIC_DAY	5	0	2010-09-23	139484	\N	200656	\N
329962	GENERIC_DAY	5	2	2010-08-06	139486	\N	200656	\N
330069	GENERIC_DAY	5	0	2010-10-20	139484	\N	200656	\N
330006	GENERIC_DAY	5	0	2010-09-12	139486	\N	200656	\N
330183	GENERIC_DAY	5	1	2010-09-15	139482	\N	200656	\N
330109	GENERIC_DAY	5	1	2010-08-26	139486	\N	200656	\N
330023	GENERIC_DAY	5	0	2010-08-21	139486	\N	200656	\N
330093	GENERIC_DAY	5	0	2010-08-01	139482	\N	200656	\N
330205	GENERIC_DAY	5	0	2010-10-16	139484	\N	200656	\N
330081	GENERIC_DAY	5	2	2010-09-29	139482	\N	200656	\N
330105	GENERIC_DAY	5	0	2010-09-04	139486	\N	200656	\N
330092	GENERIC_DAY	5	0	2010-08-01	139486	\N	200656	\N
330051	GENERIC_DAY	5	0	2010-08-22	139482	\N	200656	\N
330059	GENERIC_DAY	5	2	2010-09-23	139482	\N	200656	\N
330175	GENERIC_DAY	5	1	2010-10-05	139484	\N	200656	\N
330031	GENERIC_DAY	5	0	2010-09-12	139482	\N	200656	\N
330103	GENERIC_DAY	5	2	2010-10-07	139482	\N	200656	\N
330063	GENERIC_DAY	5	1	2010-09-14	139484	\N	200656	\N
330011	GENERIC_DAY	5	0	2010-08-29	139486	\N	200656	\N
330197	GENERIC_DAY	5	0	2010-07-31	139482	\N	200656	\N
330024	GENERIC_DAY	5	1	2010-10-19	139484	\N	200656	\N
330213	GENERIC_DAY	5	1	2010-10-04	139482	\N	200656	\N
330013	GENERIC_DAY	5	0	2010-10-09	139484	\N	200656	\N
330107	GENERIC_DAY	5	1	2010-09-10	139482	\N	200656	\N
330200	GENERIC_DAY	5	0	2010-09-22	139484	\N	200656	\N
330145	GENERIC_DAY	5	1	2010-07-28	139482	\N	200656	\N
330044	GENERIC_DAY	5	2	2010-09-30	139486	\N	200656	\N
330209	GENERIC_DAY	5	0	2010-09-02	139484	\N	200656	\N
330095	GENERIC_DAY	5	2	2010-09-15	139486	\N	200656	\N
330000	GENERIC_DAY	5	2	2010-09-20	139482	\N	200656	\N
330185	GENERIC_DAY	5	0	2010-08-23	139484	\N	200656	\N
329990	GENERIC_DAY	5	2	2010-08-05	139486	\N	200656	\N
329970	GENERIC_DAY	5	1	2010-07-27	139482	\N	200656	\N
329976	GENERIC_DAY	5	2	2010-09-14	139486	\N	200656	\N
330053	GENERIC_DAY	5	1	2010-08-12	139484	\N	200656	\N
329983	GENERIC_DAY	5	2	2010-09-24	139486	\N	200656	\N
330211	GENERIC_DAY	5	0	2010-09-26	139482	\N	200656	\N
330061	GENERIC_DAY	5	2	2010-08-04	139482	\N	200656	\N
330016	GENERIC_DAY	5	3	2010-10-04	139486	\N	200656	\N
330208	GENERIC_DAY	5	0	2010-09-11	139482	\N	200656	\N
330199	GENERIC_DAY	5	2	2010-08-11	139482	\N	200656	\N
330155	GENERIC_DAY	5	0	2010-08-21	139482	\N	200656	\N
330215	GENERIC_DAY	5	2	2010-08-19	139486	\N	200656	\N
330119	GENERIC_DAY	5	2	2010-10-08	139482	\N	200656	\N
330167	GENERIC_DAY	5	0	2010-08-14	139484	\N	200656	\N
330068	GENERIC_DAY	5	0	2010-10-02	139486	\N	200656	\N
330110	GENERIC_DAY	5	1	2010-08-18	139482	\N	200656	\N
330071	GENERIC_DAY	5	2	2010-08-30	139482	\N	200656	\N
330055	GENERIC_DAY	5	1	2010-08-25	139486	\N	200656	\N
330201	GENERIC_DAY	5	0	2010-09-25	139482	\N	200656	\N
330176	GENERIC_DAY	5	2	2010-09-24	139482	\N	200656	\N
330025	GENERIC_DAY	5	0	2010-10-13	139484	\N	200656	\N
330084	GENERIC_DAY	5	0	2010-10-06	139484	\N	200656	\N
330034	GENERIC_DAY	5	0	2010-10-03	139486	\N	200656	\N
330042	GENERIC_DAY	5	1	2010-10-19	139482	\N	200656	\N
330143	GENERIC_DAY	5	0	2010-10-14	139484	\N	200656	\N
330128	GENERIC_DAY	5	2	2010-08-16	139482	\N	200656	\N
330099	GENERIC_DAY	5	0	2010-09-27	139484	\N	200656	\N
330161	GENERIC_DAY	5	1	2010-07-29	139482	\N	200656	\N
330131	GENERIC_DAY	5	1	2010-09-08	139484	\N	200656	\N
330151	GENERIC_DAY	5	1	2010-08-24	139486	\N	200656	\N
329988	GENERIC_DAY	5	1	2010-10-05	139482	\N	200656	\N
330188	GENERIC_DAY	5	1	2010-09-08	139482	\N	200656	\N
330015	GENERIC_DAY	5	0	2010-09-05	139484	\N	200656	\N
329961	GENERIC_DAY	5	2	2010-08-02	139486	\N	200656	\N
330194	GENERIC_DAY	5	0	2010-09-05	139482	\N	200656	\N
329994	GENERIC_DAY	5	0	2010-10-10	139482	\N	200656	\N
329977	GENERIC_DAY	5	2	2010-08-10	139486	\N	200656	\N
330189	GENERIC_DAY	5	2	2010-09-28	139486	\N	200656	\N
329963	GENERIC_DAY	5	0	2010-10-04	139484	\N	200656	\N
330047	GENERIC_DAY	5	0	2010-09-18	139482	\N	200656	\N
330077	GENERIC_DAY	5	2	2010-10-20	139482	\N	200656	\N
330170	GENERIC_DAY	5	1	2010-10-18	139484	\N	200656	\N
330122	GENERIC_DAY	5	1	2010-10-11	139482	\N	200656	\N
330212	GENERIC_DAY	5	0	2010-07-30	139484	\N	200656	\N
330127	GENERIC_DAY	5	0	2010-08-05	139484	\N	200656	\N
330147	GENERIC_DAY	5	0	2010-10-17	139482	\N	200656	\N
330058	GENERIC_DAY	5	3	2010-09-21	139486	\N	200656	\N
330072	GENERIC_DAY	5	3	2010-10-14	139486	\N	200656	\N
330094	GENERIC_DAY	5	0	2010-09-07	139484	\N	200656	\N
330039	GENERIC_DAY	5	1	2010-10-11	139484	\N	200656	\N
330123	GENERIC_DAY	5	1	2010-08-30	139484	\N	200656	\N
330178	GENERIC_DAY	5	2	2010-10-08	139486	\N	200656	\N
330157	GENERIC_DAY	5	2	2010-08-10	139482	\N	200656	\N
330114	GENERIC_DAY	5	0	2010-07-31	139486	\N	200656	\N
330057	GENERIC_DAY	5	2	2010-09-22	139482	\N	200656	\N
330146	GENERIC_DAY	5	0	2010-10-10	139484	\N	200656	\N
329972	GENERIC_DAY	5	0	2010-09-18	139486	\N	200656	\N
329992	GENERIC_DAY	5	1	2010-08-16	139484	\N	200656	\N
330173	GENERIC_DAY	5	2	2010-07-30	139486	\N	200656	\N
330074	GENERIC_DAY	5	1	2010-10-14	139482	\N	200656	\N
329998	GENERIC_DAY	5	0	2010-10-09	139486	\N	200656	\N
330065	GENERIC_DAY	5	2	2010-08-27	139482	\N	200656	\N
330172	GENERIC_DAY	5	1	2010-08-31	139486	\N	200656	\N
330190	GENERIC_DAY	5	0	2010-09-12	139484	\N	200656	\N
330041	GENERIC_DAY	5	3	2010-08-20	139482	\N	200656	\N
330043	GENERIC_DAY	5	0	2010-10-07	139484	\N	200656	\N
330026	GENERIC_DAY	5	2	2010-09-27	139482	\N	200656	\N
330028	GENERIC_DAY	5	2	2010-09-23	139486	\N	200656	\N
330193	GENERIC_DAY	5	0	2010-08-08	139486	\N	200656	\N
330144	GENERIC_DAY	5	2	2010-09-28	139482	\N	200656	\N
330139	GENERIC_DAY	5	2	2010-09-01	139482	\N	200656	\N
330117	GENERIC_DAY	5	0	2010-08-28	139486	\N	200656	\N
330001	GENERIC_DAY	5	0	2010-08-28	139484	\N	200656	\N
329996	GENERIC_DAY	5	1	2010-08-09	139482	\N	200656	\N
330160	GENERIC_DAY	5	2	2010-10-13	139486	\N	200656	\N
329969	GENERIC_DAY	5	1	2010-08-17	139484	\N	200656	\N
329991	GENERIC_DAY	5	1	2010-09-21	139482	\N	200656	\N
330066	GENERIC_DAY	5	2	2010-07-28	139486	\N	200656	\N
329979	GENERIC_DAY	5	0	2010-09-11	139486	\N	200656	\N
329995	GENERIC_DAY	5	1	2010-08-12	139482	\N	200656	\N
330168	GENERIC_DAY	5	3	2010-08-25	139482	\N	200656	\N
329966	GENERIC_DAY	5	1	2010-08-09	139484	\N	200656	\N
330153	GENERIC_DAY	5	0	2010-09-19	139484	\N	200656	\N
329964	GENERIC_DAY	5	0	2010-07-31	139484	\N	200656	\N
329971	GENERIC_DAY	5	2	2010-09-08	139486	\N	200656	\N
330118	GENERIC_DAY	5	2	2010-09-17	139482	\N	200656	\N
330086	GENERIC_DAY	5	0	2010-08-28	139482	\N	200656	\N
330046	GENERIC_DAY	5	0	2010-08-29	139484	\N	200656	\N
330112	GENERIC_DAY	5	0	2010-08-04	139484	\N	200656	\N
330003	GENERIC_DAY	5	0	2010-10-03	139484	\N	200656	\N
330141	GENERIC_DAY	5	1	2010-08-03	139486	\N	200656	\N
330137	GENERIC_DAY	5	1	2010-08-06	139484	\N	200656	\N
330120	GENERIC_DAY	5	1	2010-09-06	139484	\N	200656	\N
330007	GENERIC_DAY	5	3	2010-08-03	139482	\N	200656	\N
330036	GENERIC_DAY	5	2	2010-08-17	139482	\N	200656	\N
330130	GENERIC_DAY	5	1	2010-07-28	139484	\N	200656	\N
330005	GENERIC_DAY	5	2	2010-08-18	139484	\N	200656	\N
330156	GENERIC_DAY	5	2	2010-08-09	139486	\N	200656	\N
330195	GENERIC_DAY	5	1	2010-08-20	139486	\N	200656	\N
330186	GENERIC_DAY	5	2	2010-10-15	139486	\N	200656	\N
330126	GENERIC_DAY	5	2	2010-08-02	139482	\N	200656	\N
330050	GENERIC_DAY	5	0	2010-08-19	139484	\N	200656	\N
330032	GENERIC_DAY	5	0	2010-10-10	139486	\N	200656	\N
330075	GENERIC_DAY	5	0	2010-08-07	139486	\N	200656	\N
330009	GENERIC_DAY	5	0	2010-09-29	139484	\N	200656	\N
330033	GENERIC_DAY	5	1	2010-09-02	139486	\N	200656	\N
330017	GENERIC_DAY	5	0	2010-09-20	139484	\N	200656	\N
330125	GENERIC_DAY	5	2	2010-08-04	139486	\N	200656	\N
330089	GENERIC_DAY	5	0	2010-08-21	139484	\N	200656	\N
330133	GENERIC_DAY	5	1	2010-10-15	139484	\N	200656	\N
330154	GENERIC_DAY	5	0	2010-08-26	139484	\N	200656	\N
330037	GENERIC_DAY	5	0	2010-09-26	139486	\N	200656	\N
330165	GENERIC_DAY	5	0	2010-08-25	139484	\N	200656	\N
330135	GENERIC_DAY	5	0	2010-08-01	139484	\N	200656	\N
330113	GENERIC_DAY	5	2	2010-09-30	139482	\N	200656	\N
330002	GENERIC_DAY	5	0	2010-08-24	139484	\N	200656	\N
330087	GENERIC_DAY	5	0	2010-09-18	139484	\N	200656	\N
330052	GENERIC_DAY	5	3	2010-08-23	139482	\N	200656	\N
330196	GENERIC_DAY	5	0	2010-10-09	139482	\N	200656	\N
330062	GENERIC_DAY	5	2	2010-09-13	139486	\N	200656	\N
330101	GENERIC_DAY	5	0	2010-10-01	139484	\N	200656	\N
330100	GENERIC_DAY	5	0	2010-08-07	139482	\N	200656	\N
330159	GENERIC_DAY	5	3	2010-09-07	139482	\N	200656	\N
330056	GENERIC_DAY	5	0	2010-10-17	139484	\N	200656	\N
330134	GENERIC_DAY	5	2	2010-10-13	139482	\N	200656	\N
329997	GENERIC_DAY	5	2	2010-09-29	139486	\N	200656	\N
330163	GENERIC_DAY	5	1	2010-09-01	139484	\N	200656	\N
330090	GENERIC_DAY	5	1	2010-08-27	139486	\N	200656	\N
330076	GENERIC_DAY	5	1	2010-09-14	139482	\N	200656	\N
330184	GENERIC_DAY	5	1	2010-09-13	139484	\N	200656	\N
329993	GENERIC_DAY	5	2	2010-10-06	139486	\N	200656	\N
330150	GENERIC_DAY	5	1	2010-08-16	139486	\N	200656	\N
330060	GENERIC_DAY	5	0	2010-10-03	139482	\N	200656	\N
330104	GENERIC_DAY	5	1	2010-09-09	139482	\N	200656	\N
330124	GENERIC_DAY	5	0	2010-09-30	139484	\N	200656	\N
330085	GENERIC_DAY	5	0	2010-08-14	139482	\N	200656	\N
330182	GENERIC_DAY	5	0	2010-08-15	139482	\N	200656	\N
330203	GENERIC_DAY	5	0	2010-09-21	139484	\N	200656	\N
330080	GENERIC_DAY	5	1	2010-07-29	139484	\N	200656	\N
330166	GENERIC_DAY	5	3	2010-09-02	139482	\N	200656	\N
330029	GENERIC_DAY	5	1	2010-08-30	139486	\N	200656	\N
330022	GENERIC_DAY	5	2	2010-09-06	139482	\N	200656	\N
330054	GENERIC_DAY	5	2	2010-07-27	139486	\N	200656	\N
329986	GENERIC_DAY	5	1	2010-09-15	139484	\N	200656	\N
329973	GENERIC_DAY	5	1	2010-09-17	139484	\N	200656	\N
330148	GENERIC_DAY	5	0	2010-09-11	139484	\N	200656	\N
329967	GENERIC_DAY	5	2	2010-10-07	139486	\N	200656	\N
329980	GENERIC_DAY	5	0	2010-08-11	139484	\N	200656	\N
330115	GENERIC_DAY	5	1	2010-08-13	139484	\N	200656	\N
330174	GENERIC_DAY	5	0	2010-08-03	139484	\N	200656	\N
330021	GENERIC_DAY	5	1	2010-09-03	139484	\N	200656	\N
330149	GENERIC_DAY	5	2	2010-08-05	139482	\N	200656	\N
330204	GENERIC_DAY	5	2	2010-10-05	139486	\N	200656	\N
330116	GENERIC_DAY	5	0	2010-09-05	139486	\N	200656	\N
329985	GENERIC_DAY	5	0	2010-08-14	139486	\N	200656	\N
329987	GENERIC_DAY	5	0	2010-09-19	139482	\N	200656	\N
356119	GENERIC_DAY	1	0	2010-12-18	139482	\N	200655	\N
356120	GENERIC_DAY	1	2	2010-12-20	139486	\N	200655	\N
356121	GENERIC_DAY	1	2	2010-12-24	139482	\N	200655	\N
356122	GENERIC_DAY	1	3	2010-12-23	139484	\N	200655	\N
356123	GENERIC_DAY	1	3	2010-12-15	139482	\N	200655	\N
356124	GENERIC_DAY	1	0	2010-12-18	139484	\N	200655	\N
356125	GENERIC_DAY	1	2	2010-12-27	139486	\N	200655	\N
356126	GENERIC_DAY	1	2	2010-12-23	139486	\N	200655	\N
356127	GENERIC_DAY	1	2	2010-12-27	139482	\N	200655	\N
356128	GENERIC_DAY	1	3	2010-12-15	139486	\N	200655	\N
356129	GENERIC_DAY	1	2	2010-12-24	139486	\N	200655	\N
356130	GENERIC_DAY	1	2	2010-12-23	139482	\N	200655	\N
356131	GENERIC_DAY	1	0	2010-12-19	139486	\N	200655	\N
356132	GENERIC_DAY	1	3	2010-12-27	139484	\N	200655	\N
356133	GENERIC_DAY	1	3	2010-12-14	139482	\N	200655	\N
356134	GENERIC_DAY	1	0	2010-12-25	139484	\N	200655	\N
356135	GENERIC_DAY	1	2	2010-12-21	139486	\N	200655	\N
356136	GENERIC_DAY	1	3	2010-12-16	139486	\N	200655	\N
356137	GENERIC_DAY	1	0	2010-12-18	139486	\N	200655	\N
356138	GENERIC_DAY	1	2	2010-12-21	139482	\N	200655	\N
356139	GENERIC_DAY	1	2	2010-12-22	139482	\N	200655	\N
356140	GENERIC_DAY	1	3	2010-12-16	139482	\N	200655	\N
356141	GENERIC_DAY	1	0	2010-12-25	139486	\N	200655	\N
356142	GENERIC_DAY	1	0	2010-12-26	139484	\N	200655	\N
356143	GENERIC_DAY	1	1	2010-12-15	139484	\N	200655	\N
356144	GENERIC_DAY	1	1	2010-12-16	139484	\N	200655	\N
356145	GENERIC_DAY	1	0	2010-12-19	139484	\N	200655	\N
356146	GENERIC_DAY	1	1	2010-12-14	139484	\N	200655	\N
356153	GENERIC_DAY	1	3	2010-12-21	139484	\N	200655	\N
356154	GENERIC_DAY	1	3	2010-12-20	139484	\N	200655	\N
356155	GENERIC_DAY	1	2	2010-12-20	139482	\N	200655	\N
356156	GENERIC_DAY	1	1	2010-12-17	139484	\N	200655	\N
356157	GENERIC_DAY	1	2	2010-12-22	139486	\N	200655	\N
356158	GENERIC_DAY	1	0	2010-12-25	139482	\N	200655	\N
356159	GENERIC_DAY	1	3	2010-12-17	139486	\N	200655	\N
356160	GENERIC_DAY	1	0	2010-12-26	139482	\N	200655	\N
352973	GENERIC_DAY	3	3	2010-10-15	139486	\N	148716	\N
352898	GENERIC_DAY	3	1	2010-09-24	139484	\N	148716	\N
352919	GENERIC_DAY	3	0	2010-11-06	139486	\N	148716	\N
352822	GENERIC_DAY	3	4	2010-10-15	139482	\N	148716	\N
352945	GENERIC_DAY	3	2	2010-10-28	139482	\N	148716	\N
352907	GENERIC_DAY	3	1	2010-11-09	139482	\N	148716	\N
352899	GENERIC_DAY	3	3	2010-09-15	139482	\N	148716	\N
352931	GENERIC_DAY	3	0	2010-10-03	139484	\N	148716	\N
352853	GENERIC_DAY	3	4	2010-10-19	139482	\N	148716	\N
352924	GENERIC_DAY	3	4	2010-10-27	139486	\N	148716	\N
352953	GENERIC_DAY	3	3	2010-11-04	139486	\N	148716	\N
352910	GENERIC_DAY	3	0	2010-09-18	139484	\N	148716	\N
352831	GENERIC_DAY	3	0	2010-10-31	139482	\N	148716	\N
352925	GENERIC_DAY	3	1	2010-10-21	139484	\N	148716	\N
352905	GENERIC_DAY	3	1	2010-09-22	139484	\N	148716	\N
352921	GENERIC_DAY	3	3	2010-09-20	139482	\N	148716	\N
352857	GENERIC_DAY	3	3	2010-11-05	139486	\N	148716	\N
352894	GENERIC_DAY	3	2	2010-09-21	139486	\N	148716	\N
352876	GENERIC_DAY	3	3	2010-10-22	139486	\N	148716	\N
352836	GENERIC_DAY	3	3	2010-10-06	139486	\N	148716	\N
352873	GENERIC_DAY	3	1	2010-10-22	139484	\N	148716	\N
352966	GENERIC_DAY	3	3	2010-11-08	139486	\N	148716	\N
352971	GENERIC_DAY	3	0	2010-09-26	139484	\N	148716	\N
352965	GENERIC_DAY	3	3	2010-10-01	139486	\N	148716	\N
352941	GENERIC_DAY	3	3	2010-10-01	139482	\N	148716	\N
352830	GENERIC_DAY	3	3	2010-10-18	139486	\N	148716	\N
352916	GENERIC_DAY	3	3	2010-09-22	139482	\N	148716	\N
352860	GENERIC_DAY	3	1	2010-09-20	139484	\N	148716	\N
352879	GENERIC_DAY	3	0	2010-10-10	139482	\N	148716	\N
352909	GENERIC_DAY	3	3	2010-10-11	139482	\N	148716	\N
352883	GENERIC_DAY	3	3	2010-09-28	139486	\N	148716	\N
352948	GENERIC_DAY	3	0	2010-10-10	139484	\N	148716	\N
352844	GENERIC_DAY	3	1	2010-10-25	139484	\N	148716	\N
352935	GENERIC_DAY	3	0	2010-09-18	139482	\N	148716	\N
352849	GENERIC_DAY	3	1	2010-10-01	139484	\N	148716	\N
352934	GENERIC_DAY	3	3	2010-10-20	139482	\N	148716	\N
352870	GENERIC_DAY	3	3	2010-11-03	139486	\N	148716	\N
352975	GENERIC_DAY	3	1	2010-11-09	139484	\N	148716	\N
352958	GENERIC_DAY	3	0	2010-10-24	139482	\N	148716	\N
352906	GENERIC_DAY	3	1	2010-11-02	139484	\N	148716	\N
352854	GENERIC_DAY	3	3	2010-10-20	139486	\N	148716	\N
352933	GENERIC_DAY	3	0	2010-10-02	139486	\N	148716	\N
352846	GENERIC_DAY	3	3	2010-10-13	139482	\N	148716	\N
352897	GENERIC_DAY	3	1	2010-10-29	139484	\N	148716	\N
352895	GENERIC_DAY	3	0	2010-10-16	139484	\N	148716	\N
352891	GENERIC_DAY	3	2	2010-10-04	139486	\N	148716	\N
352976	GENERIC_DAY	3	0	2010-10-23	139486	\N	148716	\N
352928	GENERIC_DAY	3	1	2010-10-08	139484	\N	148716	\N
352847	GENERIC_DAY	3	1	2010-11-03	139484	\N	148716	\N
352841	GENERIC_DAY	3	0	2010-09-25	139486	\N	148716	\N
352884	GENERIC_DAY	3	3	2010-10-08	139482	\N	148716	\N
352955	GENERIC_DAY	3	0	2010-10-02	139482	\N	148716	\N
352855	GENERIC_DAY	3	2	2010-10-14	139486	\N	148716	\N
352882	GENERIC_DAY	3	1	2010-10-27	139484	\N	148716	\N
352977	GENERIC_DAY	3	0	2010-09-26	139482	\N	148716	\N
352946	GENERIC_DAY	3	2	2010-10-25	139482	\N	148716	\N
352929	GENERIC_DAY	3	1	2010-11-04	139484	\N	148716	\N
352922	GENERIC_DAY	3	2	2010-11-08	139484	\N	148716	\N
352940	GENERIC_DAY	3	1	2010-10-06	139484	\N	148716	\N
352911	GENERIC_DAY	3	2	2010-10-29	139482	\N	148716	\N
352952	GENERIC_DAY	3	3	2010-10-07	139486	\N	148716	\N
352866	GENERIC_DAY	3	3	2010-10-06	139482	\N	148716	\N
352837	GENERIC_DAY	3	0	2010-09-19	139484	\N	148716	\N
352833	GENERIC_DAY	3	0	2010-10-10	139486	\N	148716	\N
352936	GENERIC_DAY	3	0	2010-10-02	139484	\N	148716	\N
352885	GENERIC_DAY	3	1	2010-09-29	139484	\N	148716	\N
352914	GENERIC_DAY	3	1	2010-09-28	139484	\N	148716	\N
352821	GENERIC_DAY	3	0	2010-09-25	139484	\N	148716	\N
352944	GENERIC_DAY	3	1	2010-10-28	139484	\N	148716	\N
352932	GENERIC_DAY	3	3	2010-09-27	139482	\N	148716	\N
352829	GENERIC_DAY	3	3	2010-09-15	139486	\N	148716	\N
352961	GENERIC_DAY	3	3	2010-11-03	139482	\N	148716	\N
352842	GENERIC_DAY	3	0	2010-10-30	139484	\N	148716	\N
352943	GENERIC_DAY	3	2	2010-10-27	139482	\N	148716	\N
352892	GENERIC_DAY	3	3	2010-10-05	139486	\N	148716	\N
352947	GENERIC_DAY	3	4	2010-10-04	139482	\N	148716	\N
352825	GENERIC_DAY	3	4	2010-09-21	139482	\N	148716	\N
352861	GENERIC_DAY	3	0	2010-10-30	139486	\N	148716	\N
352949	GENERIC_DAY	3	0	2010-10-23	139484	\N	148716	\N
352893	GENERIC_DAY	3	3	2010-09-30	139486	\N	148716	\N
352869	GENERIC_DAY	3	1	2010-09-15	139484	\N	148716	\N
352959	GENERIC_DAY	3	1	2010-10-20	139484	\N	148716	\N
352917	GENERIC_DAY	3	3	2010-09-24	139486	\N	148716	\N
352967	GENERIC_DAY	3	0	2010-11-07	139482	\N	148716	\N
352926	GENERIC_DAY	3	4	2010-10-29	139486	\N	148716	\N
352942	GENERIC_DAY	3	0	2010-11-07	139484	\N	148716	\N
352823	GENERIC_DAY	3	0	2010-10-19	139484	\N	148716	\N
352867	GENERIC_DAY	3	1	2010-09-17	139484	\N	148716	\N
352875	GENERIC_DAY	3	3	2010-09-23	139486	\N	148716	\N
352878	GENERIC_DAY	3	1	2010-09-21	139484	\N	148716	\N
352888	GENERIC_DAY	3	3	2010-10-13	139486	\N	148716	\N
352912	GENERIC_DAY	3	2	2010-09-17	139482	\N	148716	\N
352974	GENERIC_DAY	3	0	2010-10-03	139482	\N	148716	\N
352962	GENERIC_DAY	3	3	2010-09-16	139486	\N	148716	\N
352852	GENERIC_DAY	3	4	2010-09-16	139482	\N	148716	\N
352826	GENERIC_DAY	3	1	2010-10-26	139484	\N	148716	\N
352954	GENERIC_DAY	3	3	2010-11-02	139486	\N	148716	\N
352960	GENERIC_DAY	3	3	2010-10-22	139482	\N	148716	\N
352938	GENERIC_DAY	3	3	2010-10-08	139486	\N	148716	\N
352903	GENERIC_DAY	3	3	2010-09-27	139486	\N	148716	\N
352835	GENERIC_DAY	3	0	2010-10-30	139482	\N	148716	\N
352978	GENERIC_DAY	3	3	2010-09-24	139482	\N	148716	\N
352908	GENERIC_DAY	3	4	2010-10-18	139482	\N	148716	\N
352858	GENERIC_DAY	3	1	2010-10-13	139484	\N	148716	\N
352824	GENERIC_DAY	3	0	2010-09-25	139482	\N	148716	\N
352964	GENERIC_DAY	3	3	2010-11-02	139482	\N	148716	\N
352920	GENERIC_DAY	3	2	2010-11-05	139484	\N	148716	\N
352877	GENERIC_DAY	3	0	2010-11-06	139482	\N	148716	\N
352862	GENERIC_DAY	3	4	2010-10-25	139486	\N	148716	\N
352957	GENERIC_DAY	3	4	2010-10-26	139486	\N	148716	\N
352851	GENERIC_DAY	3	4	2010-10-21	139486	\N	148716	\N
352963	GENERIC_DAY	3	1	2010-09-27	139484	\N	148716	\N
352848	GENERIC_DAY	3	0	2010-11-06	139484	\N	148716	\N
352655	GENERIC_DAY	3	0	2010-07-11	139484	\N	148714	\N
352685	GENERIC_DAY	3	3	2010-08-30	139482	\N	148714	\N
352682	GENERIC_DAY	3	0	2010-07-16	139484	\N	148714	\N
352662	GENERIC_DAY	3	2	2010-09-14	139482	\N	148714	\N
352663	GENERIC_DAY	3	0	2010-07-21	139484	\N	148714	\N
352672	GENERIC_DAY	3	0	2010-08-28	139486	\N	148714	\N
352627	GENERIC_DAY	3	0	2010-07-11	139486	\N	148714	\N
352644	GENERIC_DAY	3	0	2010-07-09	139484	\N	148714	\N
352664	GENERIC_DAY	3	4	2010-07-08	139482	\N	148714	\N
352657	GENERIC_DAY	3	2	2010-08-13	139486	\N	148714	\N
352680	GENERIC_DAY	3	0	2010-08-09	139484	\N	148714	\N
352669	GENERIC_DAY	3	3	2010-07-20	139482	\N	148714	\N
352665	GENERIC_DAY	3	0	2010-08-08	139482	\N	148714	\N
352650	GENERIC_DAY	3	4	2010-07-06	139482	\N	148714	\N
352645	GENERIC_DAY	3	2	2010-08-03	139482	\N	148714	\N
352674	GENERIC_DAY	3	4	2010-07-09	139482	\N	148714	\N
352675	GENERIC_DAY	3	3	2010-08-16	139486	\N	148714	\N
352638	GENERIC_DAY	3	3	2010-08-04	139482	\N	148714	\N
352633	GENERIC_DAY	3	1	2010-07-29	139484	\N	148714	\N
352678	GENERIC_DAY	3	0	2010-08-15	139484	\N	148714	\N
352642	GENERIC_DAY	3	3	2010-07-19	139486	\N	148714	\N
352668	GENERIC_DAY	3	0	2010-08-22	139482	\N	148714	\N
352648	GENERIC_DAY	3	3	2010-07-26	139486	\N	148714	\N
352632	GENERIC_DAY	3	0	2010-08-15	139482	\N	148714	\N
352661	GENERIC_DAY	3	0	2010-08-14	139486	\N	148714	\N
352915	GENERIC_DAY	3	2	2010-09-30	139484	\N	148716	\N
352972	GENERIC_DAY	3	3	2010-11-04	139482	\N	148716	\N
352865	GENERIC_DAY	3	1	2010-10-11	139484	\N	148716	\N
352913	GENERIC_DAY	3	1	2010-11-09	139486	\N	148716	\N
352872	GENERIC_DAY	3	0	2010-10-18	139484	\N	148716	\N
352856	GENERIC_DAY	3	1	2010-10-05	139484	\N	148716	\N
352886	GENERIC_DAY	3	1	2010-09-23	139484	\N	148716	\N
352840	GENERIC_DAY	3	0	2010-10-03	139486	\N	148716	\N
352980	GENERIC_DAY	3	2	2010-10-21	139482	\N	148716	\N
352834	GENERIC_DAY	3	0	2010-10-17	139482	\N	148716	\N
352868	GENERIC_DAY	3	4	2010-09-17	139486	\N	148716	\N
352828	GENERIC_DAY	3	1	2010-10-04	139484	\N	148716	\N
352981	GENERIC_DAY	3	3	2010-09-29	139482	\N	148716	\N
352956	GENERIC_DAY	3	2	2010-09-30	139482	\N	148716	\N
352827	GENERIC_DAY	3	3	2010-09-22	139486	\N	148716	\N
352871	GENERIC_DAY	3	1	2010-10-07	139484	\N	148716	\N
352979	GENERIC_DAY	3	0	2010-10-09	139482	\N	148716	\N
352864	GENERIC_DAY	3	0	2010-10-31	139486	\N	148716	\N
352950	GENERIC_DAY	3	3	2010-10-11	139486	\N	148716	\N
352874	GENERIC_DAY	3	3	2010-10-19	139486	\N	148716	\N
352887	GENERIC_DAY	3	3	2010-09-28	139482	\N	148716	\N
352900	GENERIC_DAY	3	0	2010-10-09	139486	\N	148716	\N
352843	GENERIC_DAY	3	0	2010-10-23	139482	\N	148716	\N
352838	GENERIC_DAY	3	0	2010-10-24	139486	\N	148716	\N
352937	GENERIC_DAY	3	0	2010-10-09	139484	\N	148716	\N
352832	GENERIC_DAY	3	3	2010-10-05	139482	\N	148716	\N
352890	GENERIC_DAY	3	0	2010-09-19	139486	\N	148716	\N
352820	GENERIC_DAY	3	4	2010-10-14	139482	\N	148716	\N
352939	GENERIC_DAY	3	0	2010-11-07	139486	\N	148716	\N
352863	GENERIC_DAY	3	0	2010-09-18	139486	\N	148716	\N
352927	GENERIC_DAY	3	0	2010-10-24	139484	\N	148716	\N
352969	GENERIC_DAY	3	2	2010-11-05	139482	\N	148716	\N
352970	GENERIC_DAY	3	1	2010-10-14	139484	\N	148716	\N
352839	GENERIC_DAY	3	2	2010-11-08	139482	\N	148716	\N
352859	GENERIC_DAY	3	0	2010-10-15	139484	\N	148716	\N
352896	GENERIC_DAY	3	3	2010-10-07	139482	\N	148716	\N
352901	GENERIC_DAY	3	0	2010-09-19	139482	\N	148716	\N
352968	GENERIC_DAY	3	0	2010-09-16	139484	\N	148716	\N
352850	GENERIC_DAY	3	0	2010-10-17	139486	\N	148716	\N
352880	GENERIC_DAY	3	0	2010-10-16	139486	\N	148716	\N
352918	GENERIC_DAY	3	2	2010-10-26	139482	\N	148716	\N
352930	GENERIC_DAY	3	3	2010-09-29	139486	\N	148716	\N
356161	GENERIC_DAY	1	2	2010-12-10	139482	\N	178248	\N
356162	GENERIC_DAY	1	2	2010-11-26	139486	\N	178248	\N
356163	GENERIC_DAY	1	2	2010-11-12	139486	\N	178248	\N
356164	GENERIC_DAY	1	3	2010-11-25	139482	\N	178248	\N
356165	GENERIC_DAY	1	2	2010-11-22	139486	\N	178248	\N
356166	GENERIC_DAY	1	2	2010-12-13	139482	\N	178248	\N
356167	GENERIC_DAY	1	2	2010-11-11	139486	\N	178248	\N
356168	GENERIC_DAY	1	2	2010-11-30	139486	\N	178248	\N
356169	GENERIC_DAY	1	2	2010-11-30	139482	\N	178248	\N
356170	GENERIC_DAY	1	3	2010-11-26	139482	\N	178248	\N
356171	GENERIC_DAY	1	3	2010-11-24	139482	\N	178248	\N
356172	GENERIC_DAY	1	2	2010-12-01	139486	\N	178248	\N
356173	GENERIC_DAY	1	2	2010-11-23	139486	\N	178248	\N
356174	GENERIC_DAY	1	2	2010-12-09	139486	\N	178248	\N
356175	GENERIC_DAY	1	2	2010-12-02	139486	\N	178248	\N
356176	GENERIC_DAY	1	3	2010-11-12	139482	\N	178248	\N
356177	GENERIC_DAY	1	2	2010-12-03	139482	\N	178248	\N
356178	GENERIC_DAY	1	2	2010-11-29	139486	\N	178248	\N
356179	GENERIC_DAY	1	3	2010-11-17	139482	\N	178248	\N
356180	GENERIC_DAY	1	3	2010-11-16	139482	\N	178248	\N
356181	GENERIC_DAY	1	2	2010-11-24	139486	\N	178248	\N
356182	GENERIC_DAY	1	2	2010-11-10	139486	\N	178248	\N
356183	GENERIC_DAY	1	3	2010-11-11	139482	\N	178248	\N
356184	GENERIC_DAY	1	3	2010-11-18	139482	\N	178248	\N
356185	GENERIC_DAY	1	2	2010-11-15	139486	\N	178248	\N
356186	GENERIC_DAY	1	3	2010-11-23	139482	\N	178248	\N
356187	GENERIC_DAY	1	2	2010-12-13	139486	\N	178248	\N
356188	GENERIC_DAY	1	2	2010-12-10	139486	\N	178248	\N
356189	GENERIC_DAY	1	3	2010-11-22	139482	\N	178248	\N
356190	GENERIC_DAY	1	2	2010-12-07	139482	\N	178248	\N
356191	GENERIC_DAY	1	2	2010-12-03	139486	\N	178248	\N
356192	GENERIC_DAY	1	2	2010-11-25	139486	\N	178248	\N
356193	GENERIC_DAY	1	3	2010-11-10	139482	\N	178248	\N
356194	GENERIC_DAY	1	3	2010-11-19	139482	\N	178248	\N
356195	GENERIC_DAY	1	2	2010-11-17	139486	\N	178248	\N
356196	GENERIC_DAY	1	2	2010-12-02	139482	\N	178248	\N
356197	GENERIC_DAY	1	2	2010-11-29	139482	\N	178248	\N
356198	GENERIC_DAY	1	2	2010-12-07	139486	\N	178248	\N
356199	GENERIC_DAY	1	2	2010-12-01	139482	\N	178248	\N
356200	GENERIC_DAY	1	2	2010-11-19	139486	\N	178248	\N
356201	GENERIC_DAY	1	3	2010-11-15	139482	\N	178248	\N
356202	GENERIC_DAY	1	2	2010-11-18	139486	\N	178248	\N
356203	GENERIC_DAY	1	2	2010-11-16	139486	\N	178248	\N
356204	GENERIC_DAY	1	2	2010-12-09	139482	\N	178248	\N
330717	SPECIFIC_DAY	5	2	2010-07-14	139484	146358	\N	\N
330735	SPECIFIC_DAY	5	1	2010-09-28	139484	146358	\N	\N
330732	SPECIFIC_DAY	5	2	2010-07-21	139484	146358	\N	\N
330737	SPECIFIC_DAY	5	1	2010-08-24	139484	146358	\N	\N
330730	SPECIFIC_DAY	5	1	2010-09-14	139484	146358	\N	\N
330733	SPECIFIC_DAY	5	1	2010-12-14	139484	146358	\N	\N
330747	SPECIFIC_DAY	5	1	2010-12-02	139484	146358	\N	\N
330691	SPECIFIC_DAY	5	1	2010-10-29	139484	146358	\N	\N
330729	SPECIFIC_DAY	5	1	2010-11-18	139484	146358	\N	\N
330723	SPECIFIC_DAY	5	2	2010-07-23	139484	146358	\N	\N
330708	SPECIFIC_DAY	5	1	2010-11-15	139484	146358	\N	\N
330748	SPECIFIC_DAY	5	1	2010-09-09	139484	146358	\N	\N
330714	SPECIFIC_DAY	5	1	2010-08-16	139484	146358	\N	\N
330704	SPECIFIC_DAY	5	1	2010-12-10	139484	146358	\N	\N
330736	SPECIFIC_DAY	5	2	2010-06-22	139484	146358	\N	\N
330712	SPECIFIC_DAY	5	2	2010-07-19	139484	146358	\N	\N
330727	SPECIFIC_DAY	5	2	2010-07-29	139484	146358	\N	\N
330703	SPECIFIC_DAY	5	2	2010-06-30	139484	146358	\N	\N
330739	SPECIFIC_DAY	5	1	2010-10-25	139484	146358	\N	\N
330724	SPECIFIC_DAY	5	1	2010-10-08	139484	146358	\N	\N
330726	SPECIFIC_DAY	5	1	2010-08-04	139484	146358	\N	\N
330702	SPECIFIC_DAY	5	1	2010-10-05	139484	146358	\N	\N
330698	SPECIFIC_DAY	5	1	2010-09-16	139484	146358	\N	\N
330692	SPECIFIC_DAY	5	1	2010-11-30	139484	146358	\N	\N
330710	SPECIFIC_DAY	5	1	2010-12-09	139484	146358	\N	\N
330750	SPECIFIC_DAY	5	2	2010-07-06	139484	146358	\N	\N
370751	GENERIC_DAY	3	8	2010-04-22	367845	\N	370775	\N
370752	GENERIC_DAY	3	8	2010-04-23	367845	\N	370775	\N
371416	GENERIC_DAY	1	0	2010-04-24	367845	\N	370776	\N
371417	GENERIC_DAY	1	8	2010-04-26	367845	\N	370776	\N
371418	GENERIC_DAY	1	0	2010-04-25	367845	\N	370776	\N
371419	GENERIC_DAY	1	8	2010-04-27	367845	\N	370777	\N
371420	GENERIC_DAY	1	8	2010-04-29	367845	\N	370777	\N
371421	GENERIC_DAY	1	8	2010-04-28	367845	\N	370777	\N
371422	GENERIC_DAY	1	0	2010-05-01	367845	\N	370778	\N
371423	GENERIC_DAY	1	0	2010-05-02	367845	\N	370778	\N
371424	GENERIC_DAY	1	8	2010-05-03	367845	\N	370778	\N
371425	GENERIC_DAY	1	8	2010-04-30	367845	\N	370778	\N
370915	GENERIC_DAY	3	1	2010-06-15	1224	\N	368963	\N
370767	GENERIC_DAY	3	1	2010-07-01	1224	\N	368963	\N
371426	GENERIC_DAY	1	4	2010-05-13	367845	\N	370802	\N
371427	GENERIC_DAY	1	4	2010-05-05	367845	\N	370802	\N
370884	GENERIC_DAY	3	1	2010-05-26	139484	\N	368963	\N
370904	GENERIC_DAY	3	1	2010-05-18	1224	\N	368963	\N
370932	GENERIC_DAY	3	1	2010-06-23	1224	\N	368963	\N
370945	GENERIC_DAY	3	1	2010-06-09	1224	\N	368963	\N
370876	GENERIC_DAY	3	1	2010-05-25	1224	\N	368963	\N
370911	GENERIC_DAY	3	2	2010-04-26	139484	\N	368963	\N
370927	GENERIC_DAY	3	1	2010-07-19	1224	\N	368963	\N
370920	GENERIC_DAY	3	2	2010-04-29	139484	\N	368963	\N
370892	GENERIC_DAY	3	1	2010-05-25	139484	\N	368963	\N
370929	GENERIC_DAY	3	1	2010-05-27	139484	\N	368963	\N
370765	GENERIC_DAY	3	1	2010-05-20	1224	\N	368963	\N
370942	GENERIC_DAY	3	1	2010-07-13	1224	\N	368963	\N
370935	GENERIC_DAY	3	1	2010-07-29	1224	\N	368963	\N
370928	GENERIC_DAY	3	1	2010-05-24	139484	\N	368963	\N
370900	GENERIC_DAY	3	2	2010-04-21	139484	\N	368963	\N
370948	GENERIC_DAY	3	1	2010-07-15	1224	\N	368963	\N
370934	GENERIC_DAY	3	1	2010-06-04	1224	\N	368963	\N
370885	GENERIC_DAY	3	1	2010-07-22	1224	\N	368963	\N
370930	GENERIC_DAY	3	1	2010-07-20	1224	\N	368963	\N
370906	GENERIC_DAY	3	1	2010-05-14	139484	\N	368963	\N
370908	GENERIC_DAY	3	1	2010-06-16	1224	\N	368963	\N
370903	GENERIC_DAY	3	1	2010-05-06	139484	\N	368963	\N
370909	GENERIC_DAY	3	1	2010-05-19	139484	\N	368963	\N
370770	GENERIC_DAY	3	1	2010-07-23	1224	\N	368963	\N
370950	GENERIC_DAY	3	1	2010-07-09	1224	\N	368963	\N
370883	GENERIC_DAY	3	1	2010-05-06	1224	\N	368963	\N
370890	GENERIC_DAY	3	1	2010-05-10	139484	\N	368963	\N
370938	GENERIC_DAY	3	1	2010-05-07	1224	\N	368963	\N
370881	GENERIC_DAY	3	1	2010-07-26	1224	\N	368963	\N
370880	GENERIC_DAY	3	1	2010-05-07	139484	\N	368963	\N
370952	GENERIC_DAY	3	1	2010-07-14	1224	\N	368963	\N
370877	GENERIC_DAY	3	1	2010-06-22	1224	\N	368963	\N
370926	GENERIC_DAY	3	1	2010-05-24	1224	\N	368963	\N
370947	GENERIC_DAY	3	2	2010-04-22	139484	\N	368963	\N
370946	GENERIC_DAY	3	1	2010-06-17	1224	\N	368963	\N
370944	GENERIC_DAY	3	1	2010-06-29	1224	\N	368963	\N
370943	GENERIC_DAY	3	1	2010-05-10	1224	\N	368963	\N
370939	GENERIC_DAY	3	1	2010-05-19	1224	\N	368963	\N
370916	GENERIC_DAY	3	1	2010-06-10	1224	\N	368963	\N
370913	GENERIC_DAY	3	1	2010-05-13	139484	\N	368963	\N
370882	GENERIC_DAY	3	1	2010-06-08	1224	\N	368963	\N
370889	GENERIC_DAY	3	1	2010-06-07	1224	\N	368963	\N
370941	GENERIC_DAY	3	1	2010-07-02	1224	\N	368963	\N
370937	GENERIC_DAY	3	1	2010-05-18	139484	\N	368963	\N
370893	GENERIC_DAY	3	1	2010-07-07	1224	\N	368963	\N
370873	GENERIC_DAY	3	1	2010-07-16	1224	\N	368963	\N
370936	GENERIC_DAY	3	1	2010-05-05	1224	\N	368963	\N
370896	GENERIC_DAY	3	1	2010-05-05	139484	\N	368963	\N
370910	GENERIC_DAY	3	1	2010-06-18	1224	\N	368963	\N
370923	GENERIC_DAY	3	1	2010-05-13	1224	\N	368963	\N
370905	GENERIC_DAY	3	1	2010-05-14	1224	\N	368963	\N
370933	GENERIC_DAY	3	1	2010-05-20	139484	\N	368963	\N
370918	GENERIC_DAY	3	2	2010-04-28	139484	\N	368963	\N
370763	GENERIC_DAY	3	1	2010-05-12	139484	\N	368963	\N
370924	GENERIC_DAY	3	1	2010-07-12	1224	\N	368963	\N
370894	GENERIC_DAY	3	1	2010-07-06	1224	\N	368963	\N
370902	GENERIC_DAY	3	1	2010-06-14	1224	\N	368963	\N
370931	GENERIC_DAY	3	1	2010-05-28	1224	\N	368963	\N
370922	GENERIC_DAY	3	1	2010-07-30	1224	\N	368963	\N
370879	GENERIC_DAY	3	1	2010-07-05	1224	\N	368963	\N
370921	GENERIC_DAY	3	1	2010-06-28	1224	\N	368963	\N
370897	GENERIC_DAY	3	1	2010-05-27	1224	\N	368963	\N
370888	GENERIC_DAY	3	1	2010-07-28	1224	\N	368963	\N
370878	GENERIC_DAY	3	1	2010-07-21	1224	\N	368963	\N
370901	GENERIC_DAY	3	2	2010-04-23	139484	\N	368963	\N
370953	GENERIC_DAY	3	1	2010-06-21	1224	\N	368963	\N
370872	GENERIC_DAY	3	2	2010-05-04	139484	\N	368963	\N
370895	GENERIC_DAY	3	1	2010-05-31	139484	\N	368963	\N
370768	GENERIC_DAY	3	2	2010-04-30	139484	\N	368963	\N
370874	GENERIC_DAY	3	1	2010-05-21	1224	\N	368963	\N
370940	GENERIC_DAY	3	1	2010-05-12	1224	\N	368963	\N
370951	GENERIC_DAY	3	1	2010-05-11	139484	\N	368963	\N
370949	GENERIC_DAY	3	1	2010-05-26	1224	\N	368963	\N
370914	GENERIC_DAY	3	1	2010-06-30	1224	\N	368963	\N
370875	GENERIC_DAY	3	2	2010-05-03	139484	\N	368963	\N
370917	GENERIC_DAY	3	1	2010-06-24	1224	\N	368963	\N
370766	GENERIC_DAY	3	2	2010-04-27	139484	\N	368963	\N
370899	GENERIC_DAY	3	1	2010-07-27	1224	\N	368963	\N
370898	GENERIC_DAY	3	1	2010-06-03	1224	\N	368963	\N
370891	GENERIC_DAY	3	1	2010-05-31	1224	\N	368963	\N
370907	GENERIC_DAY	3	1	2010-05-21	139484	\N	368963	\N
370925	GENERIC_DAY	3	1	2010-06-02	1224	\N	368963	\N
370887	GENERIC_DAY	3	1	2010-06-25	1224	\N	368963	\N
370912	GENERIC_DAY	3	1	2010-06-01	1224	\N	368963	\N
370886	GENERIC_DAY	3	1	2010-07-08	1224	\N	368963	\N
370769	GENERIC_DAY	3	1	2010-05-11	1224	\N	368963	\N
370919	GENERIC_DAY	3	1	2010-05-28	139484	\N	368963	\N
370764	GENERIC_DAY	3	1	2010-06-11	1224	\N	368963	\N
371428	GENERIC_DAY	1	4	2010-05-07	367845	\N	370802	\N
371429	GENERIC_DAY	1	4	2010-05-06	367845	\N	370802	\N
371430	GENERIC_DAY	1	0	2010-05-09	367845	\N	370802	\N
371431	GENERIC_DAY	1	4	2010-05-04	367845	\N	370802	\N
371432	GENERIC_DAY	1	4	2010-05-12	367845	\N	370802	\N
371433	GENERIC_DAY	1	4	2010-05-11	367845	\N	370802	\N
371434	GENERIC_DAY	1	4	2010-05-10	367845	\N	370802	\N
371435	GENERIC_DAY	1	0	2010-05-08	367845	\N	370802	\N
371436	GENERIC_DAY	1	7	2010-05-18	367845	\N	370816	\N
371437	GENERIC_DAY	1	0	2010-05-16	367845	\N	370816	\N
371438	GENERIC_DAY	1	0	2010-05-15	367845	\N	370816	\N
371439	GENERIC_DAY	1	8	2010-05-14	367845	\N	370816	\N
371576	GENERIC_DAY	0	1	2010-07-26	367843	\N	370819	\N
371577	GENERIC_DAY	0	1	2010-06-10	367843	\N	370819	\N
371578	GENERIC_DAY	0	2	2010-04-26	367843	\N	370819	\N
371579	GENERIC_DAY	0	2	2010-05-11	367843	\N	370819	\N
371580	GENERIC_DAY	0	1	2010-06-29	367843	\N	370819	\N
371581	GENERIC_DAY	0	2	2010-04-28	367843	\N	370819	\N
371582	GENERIC_DAY	0	1	2010-06-03	367843	\N	370819	\N
371583	GENERIC_DAY	0	1	2010-07-08	367843	\N	370819	\N
371584	GENERIC_DAY	0	1	2010-06-02	367843	\N	370819	\N
371585	GENERIC_DAY	0	2	2010-05-24	367843	\N	370819	\N
371586	GENERIC_DAY	0	1	2010-06-18	367843	\N	370819	\N
371587	GENERIC_DAY	0	2	2010-05-10	367843	\N	370819	\N
371588	GENERIC_DAY	0	2	2010-05-05	367843	\N	370819	\N
371589	GENERIC_DAY	0	1	2010-06-22	367843	\N	370819	\N
371590	GENERIC_DAY	0	1	2010-06-14	367843	\N	370819	\N
371591	GENERIC_DAY	0	1	2010-07-23	367843	\N	370819	\N
371592	GENERIC_DAY	0	2	2010-05-27	367843	\N	370819	\N
371593	GENERIC_DAY	0	1	2010-06-17	367843	\N	370819	\N
371594	GENERIC_DAY	0	1	2010-07-07	367843	\N	370819	\N
371595	GENERIC_DAY	0	2	2010-05-03	367843	\N	370819	\N
371596	GENERIC_DAY	0	1	2010-06-07	367843	\N	370819	\N
371597	GENERIC_DAY	0	2	2010-05-20	367843	\N	370819	\N
371598	GENERIC_DAY	0	1	2010-07-16	367843	\N	370819	\N
371599	GENERIC_DAY	0	1	2010-07-13	367843	\N	370819	\N
371600	GENERIC_DAY	0	1	2010-07-22	367843	\N	370819	\N
371601	GENERIC_DAY	0	2	2010-04-22	367843	\N	370819	\N
371602	GENERIC_DAY	0	2	2010-05-13	367843	\N	370819	\N
371603	GENERIC_DAY	0	1	2010-06-01	367843	\N	370819	\N
371604	GENERIC_DAY	0	2	2010-05-07	367843	\N	370819	\N
371605	GENERIC_DAY	0	1	2010-07-09	367843	\N	370819	\N
371606	GENERIC_DAY	0	1	2010-06-16	367843	\N	370819	\N
371607	GENERIC_DAY	0	2	2010-05-19	367843	\N	370819	\N
371608	GENERIC_DAY	0	2	2010-05-26	367843	\N	370819	\N
371609	GENERIC_DAY	0	1	2010-07-02	367843	\N	370819	\N
371610	GENERIC_DAY	0	1	2010-06-21	367843	\N	370819	\N
371611	GENERIC_DAY	0	1	2010-06-15	367843	\N	370819	\N
371612	GENERIC_DAY	0	1	2010-06-30	367843	\N	370819	\N
371613	GENERIC_DAY	0	2	2010-05-12	367843	\N	370819	\N
371614	GENERIC_DAY	0	1	2010-07-15	367843	\N	370819	\N
371615	GENERIC_DAY	0	2	2010-05-28	367843	\N	370819	\N
371616	GENERIC_DAY	0	1	2010-06-28	367843	\N	370819	\N
371617	GENERIC_DAY	0	1	2010-07-12	367843	\N	370819	\N
371618	GENERIC_DAY	0	1	2010-06-11	367843	\N	370819	\N
371619	GENERIC_DAY	0	2	2010-04-23	367843	\N	370819	\N
371620	GENERIC_DAY	0	1	2010-06-23	367843	\N	370819	\N
371621	GENERIC_DAY	0	1	2010-07-21	367843	\N	370819	\N
371622	GENERIC_DAY	0	1	2010-07-14	367843	\N	370819	\N
371623	GENERIC_DAY	0	1	2010-07-05	367843	\N	370819	\N
371624	GENERIC_DAY	0	2	2010-05-04	367843	\N	370819	\N
371625	GENERIC_DAY	0	2	2010-05-18	367843	\N	370819	\N
371626	GENERIC_DAY	0	1	2010-07-01	367843	\N	370819	\N
371627	GENERIC_DAY	0	2	2010-05-06	367843	\N	370819	\N
371628	GENERIC_DAY	0	1	2010-06-08	367843	\N	370819	\N
371629	GENERIC_DAY	0	1	2010-06-25	367843	\N	370819	\N
371630	GENERIC_DAY	0	2	2010-05-31	367843	\N	370819	\N
371631	GENERIC_DAY	0	1	2010-06-09	367843	\N	370819	\N
371632	GENERIC_DAY	0	2	2010-05-25	367843	\N	370819	\N
371633	GENERIC_DAY	0	2	2010-05-14	367843	\N	370819	\N
371634	GENERIC_DAY	0	1	2010-06-04	367843	\N	370819	\N
371635	GENERIC_DAY	0	1	2010-07-20	367843	\N	370819	\N
371636	GENERIC_DAY	0	1	2010-07-19	367843	\N	370819	\N
371637	GENERIC_DAY	0	2	2010-05-21	367843	\N	370819	\N
371638	GENERIC_DAY	0	1	2010-06-24	367843	\N	370819	\N
371639	GENERIC_DAY	0	2	2010-04-27	367843	\N	370819	\N
371640	GENERIC_DAY	0	1	2010-07-06	367843	\N	370819	\N
371641	GENERIC_DAY	0	2	2010-04-30	367843	\N	370819	\N
371642	GENERIC_DAY	0	2	2010-04-29	367843	\N	370819	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
31621126	14	97367	97368	0
1277962	2	3850	3839	0
1277963	2	3845	3849	0
1277964	2	3838	3841	0
1277965	2	3841	3845	0
31621127	14	97370	97371	0
18874390	5	56330	57491	0
18874383	5	56324	56349	0
1277971	2	3850	3839	0
1277972	2	3845	3849	0
1277973	2	3838	3841	0
1277974	2	3841	3845	0
1277975	2	3839	3840	0
1278014	2	3842	3843	0
1278015	2	3841	3842	0
1278016	2	3850	3839	0
1278017	2	3845	3849	0
1278018	2	3838	3841	0
1278019	2	3844	3846	0
1278020	2	3846	3847	0
1278021	2	3841	3845	0
1278022	2	3839	3840	0
1277986	2	3842	3843	0
1277987	2	3841	3842	0
1277988	2	3850	3839	0
1277989	2	3845	3849	0
1277990	2	3838	3841	0
1277991	2	3841	3845	0
1277992	2	3839	3840	0
18907208	4	56282	56277	0
1278033	2	3868	3869	0
18907996	5	56282	56277	0
1278034	2	3868	3869	0
1277996	2	3842	3843	0
1277997	2	3841	3842	0
1277998	2	3850	3839	0
1277999	2	3845	3849	0
1278000	2	3838	3841	0
1278001	2	3844	3846	0
1278002	2	3841	3845	0
1278003	2	3839	3840	0
18907548	5	56282	56277	0
18710536	17	56257	56258	0
18710537	17	56258	56259	0
18710538	17	56259	56260	0
18907584	5	56282	56277	0
18710580	14	56298	56299	0
18710563	14	56298	56299	0
18710559	14	56266	56298	0
18710575	14	56266	56298	0
18710570	14	56269	56306	0
18710571	14	56283	56269	0
18907826	5	56274	56270	0
18907590	5	56274	56270	0
18907640	5	56274	56270	0
38404131	4	118173	118174	0
18874374	5	56324	56349	0
18874391	5	56324	56349	0
18908003	5	56274	56270	0
18907534	5	56271	56263	0
18907652	5	56271	56263	0
18907256	5	56271	56263	0
18874396	5	56330	57474	0
38404130	4	118170	118171	0
18907602	5	56271	56263	0
47448811	23	146154	146155	0
18907225	4	56271	56263	0
18908015	5	56271	56263	0
18907838	5	56271	56263	0
18907565	5	56271	56263	0
47448842	4	146196	146197	0
47448821	11	146188	146191	0
18907536	5	56281	56282	0
18710572	14	56272	56283	0
18710579	14	56260	56285	0
18710539	14	56260	56285	0
18710562	14	56260	56285	0
18907518	5	56286	56287	0
18907549	5	56286	56287	0
18907635	5	56286	56287	0
18907820	5	56286	56287	0
18907209	4	56286	56287	0
18907997	5	56286	56287	0
18907585	5	56286	56287	0
18907240	5	56286	56287	0
18907821	5	56294	56286	0
18907636	5	56294	56286	0
18907550	5	56294	56286	0
18874399	12	56306	56274	0
18907586	5	56294	56286	0
18907637	5	56287	56288	0
18907999	5	56287	56288	0
18907211	4	56287	56288	0
18907520	5	56287	56288	0
18907242	5	56287	56288	0
18907587	5	56287	56288	0
18907822	5	56287	56288	0
18907551	5	56287	56288	0
18908000	5	56288	56289	0
18907212	4	56288	56289	0
18907243	5	56288	56289	0
18907823	5	56288	56289	0
18907552	5	56288	56289	0
18907521	5	56288	56289	0
18907638	5	56288	56289	0
18907588	5	56288	56289	0
18907213	4	56289	56290	0
27656340	2	57485	57486	0
27656341	2	57486	57487	0
27656342	2	57487	57488	0
27656343	2	57488	57489	0
18874397	5	57491	57490	0
18874389	5	57491	57490	0
27656337	2	57483	57484	0
27656338	2	57481	57483	0
27656339	2	57484	57485	0
18874398	5	56330	57491	0
27656316	2	56343	56345	0
27656333	2	56356	56357	0
27656325	2	56354	56356	0
27656334	2	56357	57469	0
27656335	2	57469	57470	0
27656336	2	57470	57471	0
27656332	2	57471	57476	0
18874392	5	56321	56322	0
18874375	5	56321	56322	0
18874384	5	56321	56322	0
18874376	5	56322	56323	0
47448672	34	146151	146147	0
47448673	34	146148	146149	0
47448674	34	146149	146151	0
47448812	21	146185	146155	0
47448663	34	146176	146177	0
47448664	34	146177	146178	0
47448665	34	146178	146179	0
47448666	34	146179	146180	0
47448667	34	146180	146181	0
47448668	34	146181	146182	0
47448669	34	146182	146183	0
47448670	34	146183	146184	0
47448671	34	146184	146185	0
31621160	15	97367	97368	0
31621161	15	97370	97371	0
47448823	11	146188	146191	0
18907523	5	56302	56301	0
18908004	5	56302	56301	0
18907245	5	56302	56301	0
18907214	4	56302	56301	0
18907215	4	56292	56302	0
18908005	5	56292	56302	0
18907246	5	56292	56302	0
18907524	5	56292	56302	0
18710573	14	56267	56272	0
18907210	4	56294	56286	0
18907241	5	56294	56286	0
18907998	5	56294	56286	0
18907519	5	56294	56286	0
18907639	5	56289	56290	0
18907589	5	56289	56290	0
18908001	5	56289	56290	0
18907522	5	56289	56290	0
18907553	5	56289	56290	0
18907244	5	56289	56290	0
18907824	5	56289	56290	0
18907599	5	56293	56262	0
18907835	5	56293	56262	0
18907531	5	56293	56262	0
18907649	5	56293	56262	0
18907253	5	56293	56262	0
18908012	5	56293	56262	0
18907562	5	56293	56262	0
18907222	4	56293	56262	0
18907836	5	56262	56294	0
18907600	5	56262	56294	0
18907563	5	56262	56294	0
18908013	5	56262	56294	0
18907223	4	56262	56294	0
18907532	5	56262	56294	0
18907254	5	56262	56294	0
18907650	5	56262	56294	0
18907564	5	56295	56296	0
18908014	5	56295	56296	0
18907837	5	56295	56296	0
18907533	5	56295	56296	0
18907224	4	56295	56296	0
18907651	5	56295	56296	0
18907255	5	56295	56296	0
18907601	5	56295	56296	0
18907825	5	56309	56279	0
18710577	14	56275	56267	0
18743296	13	56275	56267	0
18710558	14	56266	56316	0
18710576	14	56266	56267	0
18874385	5	56322	56323	0
18874393	5	56322	56323	0
27656344	2	56345	56346	0
27656345	2	56346	56347	0
18874394	5	56323	56324	0
18874377	5	56323	56324	0
18874386	5	56323	56324	0
27656326	2	56333	56334	0
27656327	2	56331	56333	0
27656328	2	56334	56335	0
27656329	2	56335	56336	0
27656317	2	56341	56343	0
27656321	2	56350	56351	0
27656322	2	56351	56352	0
27656323	2	56352	56353	0
27656324	2	56353	56354	0
27656318	2	56338	56339	0
27656319	2	56339	56341	0
18874395	5	57474	57473	0
18874387	5	57474	57473	0
18874388	5	56330	57474	0
27656331	2	57476	57477	0
27656320	2	57479	57481	0
27656330	2	56330	56331	0
47448676	34	146154	146189	0
47448677	34	146155	146156	0
47448813	21	146185	146155	0
47448678	34	146156	146157	0
47448679	34	146157	146158	0
47448680	34	146158	146159	0
47448681	34	146159	146160	0
47448682	34	146160	146161	0
47448683	34	146161	146162	0
47448684	34	146162	146163	0
47448685	34	146163	146164	0
47448758	35	146164	146165	0
47448686	34	146164	146165	0
47448687	34	146165	146166	0
47448759	35	146165	146166	0
47448760	35	146166	146167	0
47448688	34	146166	146167	0
47448761	35	146167	146174	0
47448689	34	146167	146174	0
47448690	34	146168	146169	0
47448762	35	146168	146169	0
47448691	34	146169	146170	0
47448763	35	146169	146170	0
47448764	35	146170	146171	0
47448692	34	146170	146171	0
47448693	34	146171	146172	0
47448765	35	146171	146172	0
47448694	34	146172	146173	0
47448766	35	146172	146173	0
47448695	34	146173	146174	0
47448767	35	146173	146174	0
47448662	34	146174	146191	0
18907827	5	56302	56301	0
18907554	5	56302	56301	0
18907591	5	56302	56301	0
18907641	5	56302	56301	0
18907642	5	56292	56302	0
47448675	34	146189	146188	0
18907828	5	56292	56302	0
18907592	5	56292	56302	0
18907555	5	56292	56302	0
18907516	5	56277	56271	0
18907583	5	56277	56271	0
18907238	5	56277	56271	0
18907818	5	56277	56271	0
18907995	5	56277	56271	0
18907547	5	56277	56271	0
18907633	5	56277	56271	0
47448661	34	146187	146191	0
18907207	4	56277	56271	0
18907819	5	56282	56277	0
18907634	5	56282	56277	0
18907239	5	56282	56277	0
18907517	5	56282	56277	0
47448660	34	146191	146192	0
27656367	3	57483	57484	0
27656368	3	57481	57483	0
27656369	3	57484	57485	0
27656370	3	57485	57486	0
27656371	3	57486	57487	0
27656372	3	57487	57488	0
27656373	3	57488	57489	0
27656374	3	56345	56346	0
27656346	3	56343	56345	0
27656375	3	56346	56347	0
27656363	3	56356	56357	0
27656355	3	56354	56356	0
27656364	3	56357	57469	0
27656365	3	57469	57470	0
27656366	3	57470	57471	0
27656362	3	57471	57476	0
27656356	3	56333	56334	0
27656357	3	56331	56333	0
27656358	3	56334	56335	0
27656359	3	56335	56336	0
27656347	3	56341	56343	0
27656351	3	56350	56351	0
27656352	3	56351	56352	0
27656353	3	56352	56353	0
27656354	3	56353	56354	0
27656348	3	56338	56339	0
27656349	3	56339	56341	0
27656361	3	57476	57477	0
27656350	3	57479	57481	0
27656360	3	56330	56331	0
34308098	12	97367	105950	0
34308099	12	97368	105951	0
34308100	12	97371	105951	0
18710560	14	56266	56267	0
18710574	14	56266	56316	0
18907535	5	56263	56264	0
18908010	5	56314	56312	0
18907529	5	56314	56312	0
18907220	4	56314	56312	0
18907560	5	56314	56312	0
18907833	5	56314	56312	0
18907251	5	56314	56312	0
18907647	5	56314	56312	0
18907648	5	56313	56314	0
18907252	5	56313	56314	0
18907530	5	56313	56314	0
18907598	5	56313	56314	0
18907834	5	56313	56314	0
18907221	4	56313	56314	0
18907561	5	56313	56314	0
18908011	5	56313	56314	0
18710561	14	56316	56315	0
18710578	14	56316	56315	0
47448712	34	146154	146189	0
47448708	34	146151	146147	0
47448709	34	146148	146149	0
47448710	34	146149	146151	0
47448782	31	146167	146150	0
47448713	34	146155	146156	0
47448714	34	146156	146157	0
47448715	34	146157	146158	0
47448716	34	146158	146159	0
47448717	34	146159	146160	0
47448718	34	146160	146161	0
47448719	34	146161	146162	0
47448720	34	146162	146163	0
47448721	34	146163	146164	0
47448722	34	146164	146165	0
47448723	34	146165	146166	0
47448724	34	146166	146167	0
47448698	34	146174	146191	0
47448825	9	146191	146197	0
47448699	34	146176	146177	0
47448700	34	146177	146178	0
47448701	34	146178	146179	0
47448702	34	146179	146180	0
47448703	34	146180	146181	0
47448704	34	146181	146182	0
47448705	34	146182	146183	0
47448706	34	146183	146184	0
47448707	34	146184	146185	0
47448711	34	146189	146188	0
47448697	34	146187	146191	0
47448696	34	146191	146192	0
31621125	6	97364	97365	0
27656206	4	56324	56326	0
27656207	4	56326	56327	0
27656208	4	56327	56328	0
27656205	4	57493	85345	0
27656209	4	57494	85345	0
47448637	34	146148	146149	0
47448808	31	146150	146152	0
47448807	31	146167	146150	0
47448814	14	146167	146168	0
47448725	34	146167	146174	0
47448726	34	146168	146169	0
47448727	34	146169	146170	0
38404097	3	118173	118174	0
38404096	3	118170	118171	0
47448728	34	146170	146171	0
47448729	34	146171	146172	0
47448730	34	146172	146173	0
47448731	34	146173	146174	0
47448627	34	146176	146177	0
18907526	5	56310	56309	0
18908007	5	56310	56309	0
18907644	5	56310	56309	0
18907557	5	56310	56309	0
18907830	5	56310	56309	0
27656384	4	86383	86384	0
18908002	5	56309	56279	0
18907604	5	56281	56282	0
18907654	5	56281	56282	0
18907594	5	56310	56309	0
18907645	5	56312	56310	0
18907249	5	56312	56310	0
18907558	5	56312	56310	0
18907831	5	56312	56310	0
18907227	4	56281	56282	0
18907258	5	56281	56282	0
18908017	5	56281	56282	0
18907840	5	56281	56282	0
18907567	5	56281	56282	0
18907839	5	56263	56264	0
18908016	5	56263	56264	0
18907653	5	56263	56264	0
18907603	5	56263	56264	0
18907257	5	56263	56264	0
18907566	5	56263	56264	0
18907226	4	56263	56264	0
18907525	5	56308	56311	0
18907829	5	56308	56311	0
18908006	5	56308	56311	0
18907247	5	56308	56311	0
18907556	5	56308	56311	0
18907643	5	56308	56311	0
18907216	4	56308	56311	0
18907593	5	56308	56311	0
18907217	4	56310	56309	0
18907248	5	56310	56309	0
18907595	5	56312	56310	0
18907527	5	56312	56310	0
18908008	5	56312	56310	0
18907218	4	56312	56310	0
18908009	5	56311	56313	0
18907250	5	56311	56313	0
18907832	5	56311	56313	0
18907646	5	56311	56313	0
18907559	5	56311	56313	0
18907596	5	56311	56313	0
18907219	4	56311	56313	0
18907528	5	56311	56313	0
18907597	5	56314	56312	0
47448628	34	146177	146178	0
47448629	34	146178	146179	0
44105741	7	135543	135546	0
44105740	7	135543	135546	0
44105742	7	135543	135546	0
47448630	34	146179	146180	0
44105739	10	135542	135543	0
44105730	10	135542	135543	0
44105729	10	135542	135544	0
47448631	34	146180	146181	0
44105738	10	135542	135544	0
44105737	10	135542	135545	0
44105728	10	135542	135545	0
47448632	34	146181	146182	0
47448633	34	146182	146183	0
47448634	34	146183	146184	0
47448635	34	146184	146185	0
47448748	35	146154	146189	0
47448827	9	146191	146196	0
47448744	35	146151	146147	0
47448636	34	146151	146147	0
47448745	35	146148	146149	0
47448746	35	146149	146151	0
47448638	34	146149	146151	0
47448810	31	146150	146152	0
47448809	31	146167	146150	0
47448639	34	146155	146156	0
47448749	35	146155	146156	0
47448640	34	146156	146157	0
47448750	35	146156	146157	0
47448641	34	146157	146158	0
47448751	35	146157	146158	0
47448752	35	146158	146159	0
47448642	34	146158	146159	0
47448753	35	146159	146160	0
47448643	34	146159	146160	0
47448644	34	146160	146161	0
47448754	35	146160	146161	0
47448755	35	146161	146162	0
47448645	34	146161	146162	0
47448756	35	146162	146163	0
47448646	34	146162	146163	0
47448647	34	146163	146164	0
47448757	35	146163	146164	0
47448648	34	146164	146165	0
47448649	34	146165	146166	0
47448650	34	146166	146167	0
47448651	34	146167	146174	0
47448652	34	146168	146169	0
47448653	34	146169	146170	0
47448654	34	146170	146171	0
47448655	34	146171	146172	0
47448656	34	146172	146173	0
119668832	5	368751	368752	0
119668833	5	368752	368753	0
119668826	5	368754	368762	0
119668825	5	368762	368763	0
119668827	5	368763	368764	0
119668828	5	368764	368766	0
119668829	5	368766	368767	0
119668830	5	368767	368768	0
119668818	5	368756	368759	0
119668819	5	368758	368756	0
119668821	5	368757	368756	0
119668822	5	368757	368758	0
47448657	34	146173	146174	0
119668824	5	368759	368760	0
47448734	35	146174	146191	0
47448828	9	146197	146198	0
47448826	9	146191	146197	0
47448735	35	146176	146177	0
47448736	35	146177	146178	0
47448737	35	146178	146179	0
47448738	35	146179	146180	0
47448739	35	146180	146181	0
47448740	35	146181	146182	0
47448741	35	146182	146183	0
47448742	35	146183	146184	0
47448743	35	146184	146185	0
47448747	35	146189	146188	0
47448733	35	146187	146191	0
47448732	35	146191	146192	0
47448815	11	146188	146191	0
119668849	6	368751	368752	0
119668850	6	368752	368753	0
119668834	5	368753	368754	0
119668851	6	368753	368754	0
119668840	6	368754	368757	0
119668848	6	368754	368772	0
119668820	5	368754	368756	0
119668843	6	368754	368762	0
119668831	5	368754	368772	0
119668823	5	368754	368757	0
119668837	6	368754	368756	0
119668842	6	368762	368763	0
119668844	6	368763	368764	0
119668845	6	368764	368766	0
119668846	6	368766	368767	0
119668847	6	368767	368768	0
119668835	6	368756	368759	0
119668838	6	368757	368756	0
119668836	6	368758	368756	0
119668839	6	368757	368758	0
119668841	6	368759	368760	0
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
5152	0	5051	1616
\.


--
-- Data for Name: description_values; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values (description_value_id, fieldname, value) FROM stdin;
123018	Incidencias	Incidencias X
\.


--
-- Data for Name: description_values_in_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values_in_line (description_value_id, fieldname, value) FROM stdin;
6061	Incidencias	..,
6062	Incidencias	,,,
6063	Incidencias	Inci
58080	Incidencias	
58082	Incidencias	
58077	Incidencias	
58075	Incidencias	
58076	Incidencias	
58081	Incidencias	
58079	Incidencias	
58078	Incidencias	
58083	Incidencias	
58084	Incidencias	
76559	Incidencias	
76563	Incidencias	
76562	Incidencias	
76561	Incidencias	
76564	Incidencias	
76560	Incidencias	
76646	Incidencias	
76647	Incidencias	
76648	Incidencias	
76649	Incidencias	
76650	Incidencias	
76651	Incidencias	
76652	Incidencias	
76653	Incidencias	
76654	Incidencias	
76657	Incidencias	
76658	Incidencias	
78881	Incidencias	
78882	Incidencias	
78883	Incidencias	
78884	Incidencias	
78885	Incidencias	
78886	Incidencias	
78887	Incidencias	
78888	Incidencias	
78889	Incidencias	
78890	Incidencias	
78891	Incidencias	
78892	Incidencias	
78893	Incidencias	
78894	Incidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
122220	122315	100.00
122221	122316	100.00
122222	122317	100.00
105265	105041	100.00
105266	105043	100.00
105267	105044	100.00
122223	122318	100.00
122226	122320	100.00
117887	117804	100.00
117888	117804	100.00
80079	85512	100.00
80080	85513	100.00
80081	85514	100.00
80082	85515	100.00
80085	85517	100.00
80086	85518	100.00
80087	85519	100.00
80090	85521	100.00
80091	85522	100.00
85649	85524	100.00
85650	85525	100.00
85651	85526	100.00
85652	85527	100.00
85655	85529	100.00
85656	85530	100.00
85659	85532	100.00
85662	85534	100.00
85665	85536	100.00
85666	85537	100.00
85667	85538	100.00
85670	85540	100.00
85671	85541	100.00
85672	85542	100.00
85673	85543	100.00
85674	85544	100.00
85675	85545	100.00
85678	85749	100.00
85679	85750	100.00
85680	85751	100.00
85681	85752	100.00
85682	85753	100.00
85685	85755	100.00
85686	85756	100.00
85689	85758	100.00
85690	85759	100.00
85693	85761	100.00
85696	85763	100.00
85699	85765	100.00
85700	85766	100.00
85701	85767	100.00
8008	6342	100.00
8009	6343	100.00
8011	6354	100.00
85702	85768	100.00
85703	85769	100.00
85704	85770	100.00
85705	85771	100.00
85706	85772	100.00
85707	85773	100.00
85710	85774	100.00
8012	6355	100.00
8014	6675	100.00
86097	85842	100.00
86098	85843	100.00
86099	85844	100.00
86100	85845	100.00
86103	85847	100.00
86104	85848	100.00
9290	6677	100.00
122227	122321	100.00
122228	122322	100.00
122231	122324	100.00
9292	6678	100.00
9293	6816	100.00
9294	6817	100.00
86326	86215	100.00
86285	86215	100.00
86327	86216	100.00
9296	6819	100.00
9297	6820	100.00
5673	3698	4000.00
5672	3698	100.00
7509	6301	100.00
7510	6302	100.00
79996	6302	100.00
7511	6303	100.00
7512	6304	100.00
7514	6306	100.00
7515	6307	100.00
7516	6320	100.00
8003	6322	100.00
8004	6323	100.00
8006	6340	100.00
8007	6341	100.00
9298	6821	100.00
9299	6822	100.00
9300	6823	100.00
9301	6824	100.00
9303	6826	100.00
9304	6827	100.00
9305	6828	100.00
9306	6829	100.00
9307	6830	100.00
11027	7073	100.00
11028	7074	100.00
11030	7076	100.00
11031	7077	100.00
11033	7079	100.00
11035	7082	100.00
11037	7116	100.00
11038	7117	100.00
11039	7084	100.00
122232	122325	100.00
122235	122327	100.00
57403	57256	100.00
86105	85849	100.00
86108	86154	100.00
86109	86155	100.00
86112	86157	100.00
86113	86158	100.00
86114	86159	100.00
86115	86160	100.00
86118	86162	100.00
86119	86163	100.00
86122	86165	100.00
86125	86167	100.00
86128	86169	100.00
86129	86170	100.00
86130	86171	100.00
86133	86173	100.00
86134	86174	100.00
86135	86175	100.00
86136	86176	100.00
86137	86177	100.00
86138	86178	100.00
86141	86180	100.00
86142	86181	100.00
86143	86182	100.00
86144	86183	100.00
86145	86184	100.00
86148	86186	100.00
86149	86187	100.00
86152	86189	100.00
86254	86190	100.00
86257	86192	100.00
86260	86194	100.00
86263	86196	100.00
86264	86197	100.00
86265	86198	100.00
86266	86199	100.00
86267	86200	100.00
86268	86201	100.00
86269	86202	100.00
86270	86203	100.00
86271	86204	100.00
86274	86205	100.00
86275	86206	100.00
85711	85775	100.00
122248	122337	100.00
107473	90614	100.00
11040	7080	100.00
86289	86216	100.00
57124	57195	100.00
57125	57196	100.00
57126	57197	100.00
57127	57198	100.00
57130	57200	100.00
57131	57201	100.00
57132	57202	100.00
57135	57204	100.00
11041	7118	100.00
11042	7119	100.00
11043	7120	100.00
11044	7121	100.00
11045	7122	100.00
11047	7123	100.00
11048	7124	100.00
122236	122328	100.00
122237	122329	100.00
122238	122330	100.00
122241	122332	100.00
122242	122333	100.00
122245	122335	100.00
122251	122339	100.00
122252	122340	100.00
122253	122341	100.00
122256	122343	100.00
122257	122344	100.00
122258	122345	100.00
122259	122346	100.00
122260	122347	100.00
122261	122348	100.00
122264	122350	100.00
122265	122351	100.00
122266	122352	100.00
122267	122353	100.00
122268	122354	100.00
122271	122356	100.00
57136	57205	100.00
57139	57207	100.00
57140	57208	100.00
57141	57209	100.00
57142	57210	100.00
57145	57212	100.00
122272	122357	100.00
122275	122359	100.00
122276	122360	100.00
122279	122362	100.00
122282	122364	100.00
122285	122366	100.00
122286	122367	100.00
122287	122368	100.00
122288	122369	100.00
122289	122370	100.00
117895	117796	100.00
122290	122371	100.00
122291	122372	100.00
122292	122373	100.00
122293	122374	100.00
122296	122375	100.00
122297	122376	100.00
122300	117789	100.00
57146	57213	100.00
57149	57215	100.00
57152	57217	100.00
57155	57219	100.00
57156	57220	100.00
57157	57221	100.00
57160	57223	100.00
57161	57224	100.00
57162	57225	100.00
57163	57226	100.00
57164	57227	100.00
57165	57228	100.00
57370	57230	100.00
57371	57231	100.00
57372	57232	100.00
57373	57233	100.00
57374	57234	100.00
57377	57236	100.00
57378	57237	100.00
57381	57239	100.00
57382	57240	100.00
57385	57242	100.00
57388	57244	100.00
57391	57246	100.00
57392	57247	100.00
57393	57248	100.00
57394	57249	100.00
57395	57250	100.00
57396	57251	100.00
57397	57252	100.00
57398	57253	100.00
57399	57254	100.00
57402	57255	100.00
105270	57256	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
2020	1	Navantia	B11111111	t	f	f	\N	\N	\N	\N
6464	2	fundación	N00000000	t	f	f	\N	\N	\N	\N
2021	3	Igalia	B15804842	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	912
140289	1	Caixanova	44444444C	f	f	f	\N	\N	\N	\N
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
2527
3063
3064
3066
3069
3070
58383
58384
58450
58451
58452
58453
58454
58455
58456
58457
58458
58459
58460
58461
58468
58469
58470
58472
60703
60704
60705
60706
60751
60752
60753
60754
60755
60756
60757
60758
60790
60791
60792
60795
68413
68414
68415
68416
68417
68418
68419
68420
68421
68422
68423
97566
97567
97578
97579
97580
97581
118483
118484
118485
118486
135746
136056
136057
136058
136062
148707
148708
148709
148710
148711
148712
148713
148714
148716
178234
178235
178236
178237
178238
178239
178240
178241
178242
178243
178244
178245
178246
178247
178248
183845
183846
183847
183848
183849
183850
200642
200643
200644
200645
200646
200647
200648
200649
200650
200651
200655
200656
200665
368963
370775
370776
370777
370778
370802
370816
370819
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
122816	Incidencias	300	0
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
3698
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id, code) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, workinghours, percentage, fixedpercentage, parent_order_line, resourcetype, order_line_template) FROM stdin;
135334	2	proxecto-00022-00001-00001	160	1.00	f	135456	WORKER	\N
135335	2	proxecto-00022-00002-00001	160	1.00	f	135457	WORKER	\N
135336	2	proxecto-00022-00003-00001	160	1.00	f	135458	WORKER	\N
135337	2	proxecto-00022-00004-00001	160	1.00	f	135459	WORKER	\N
135338	2	proxecto-00022-00005-00001	160	1.00	f	135460	WORKER	\N
3622	3	proxecto-00003-00001-00001	30	1.00	f	3646	WORKER	\N
140462	16	proxecto-00023-00080-00001	8	1.00	f	140067	WORKER	\N
140463	16	proxecto-00023-00081-00001	100	1.00	f	140068	WORKER	\N
140464	16	proxecto-00023-00082-00001	35	1.00	f	140069	WORKER	\N
140465	16	proxecto-00023-00083-00001	50	1.00	f	140070	WORKER	\N
140466	16	proxecto-00023-00084-00001	50	1.00	f	140071	WORKER	\N
3623	3	proxecto-00003-00002-00001	40	1.00	f	3647	WORKER	\N
3624	3	proxecto-00003-00003-00001	40	1.00	f	3648	WORKER	\N
3625	3	proxecto-00003-00004-00001	50	1.00	f	3649	WORKER	\N
85625	3	proxecto-00009-00048-00001	32	1.00	f	85753	WORKER	\N
85626	3	proxecto-00009-00049-00001	64	1.00	f	85755	WORKER	\N
2139	3	proxecto-00001-00005-00001	16	1.00	f	1870	WORKER	\N
2140	3	proxecto-00001-00006-00001	16	1.00	f	1871	WORKER	\N
2141	3	proxecto-00001-00002-00001	32	1.00	f	1872	WORKER	\N
2142	3	proxecto-00001-00007-00001	24	1.00	f	1874	WORKER	\N
2143	3	proxecto-00001-00008-00001	7	1.00	f	1875	WORKER	\N
2144	3	proxecto-00001-00009-00001	14	1.00	f	1877	WORKER	\N
140469	13	proxecto-00023-00085-00001	272	1.00	f	140074	WORKER	\N
140470	13	proxecto-00023-00086-00001	172	1.00	f	140075	WORKER	\N
6909	32	proxecto-00006-00031-00001	64	1.00	f	6819	WORKER	\N
3626	3	proxecto-00003-00005-00001	32	1.00	f	3650	WORKER	\N
3627	3	proxecto-00003-00006-00001	15	1.00	f	3651	WORKER	\N
3628	3	proxecto-00003-00007-00001	16	1.00	f	3652	WORKER	\N
3629	3	proxecto-00003-00008-00001	8	1.00	f	3653	WORKER	\N
3630	3	proxecto-00003-00009-00001	24	1.00	f	3654	WORKER	\N
3631	3	proxecto-00003-00010-00001	32	1.00	f	3655	WORKER	\N
3632	3	proxecto-00003-00011-00001	42	1.00	f	3656	WORKER	\N
3633	3	proxecto-00003-00012-00001	54	1.00	f	3657	WORKER	\N
57285	9	proxecto-00008-00041-00001	40	1.00	f	57226	WORKER	\N
57286	9	proxecto-00008-00042-00001	16	1.00	f	57227	WORKER	\N
57287	9	proxecto-00008-00043-00001	32	1.00	f	57228	WORKER	\N
57309	9	proxecto-00008-00017-00001	256	1.00	f	57256	WORKER	\N
140474	8	proxecto-00023-00087-00001	100	1.00	f	140079	WORKER	\N
3634	3	proxecto-00003-00013-00001	103	1.00	f	3658	WORKER	\N
3635	3	proxecto-00003-00014-00001	21	1.00	f	3659	WORKER	\N
3737	3	proxecto-00003-00015-00001	42	1.00	f	3660	WORKER	\N
3738	3	proxecto-00003-00016-00001	12	1.00	f	3661	WORKER	\N
3739	3	proxecto-00003-00017-00001	8	1.00	f	3662	WORKER	\N
3740	3	proxecto-00003-00018-00001	24	1.00	f	3663	WORKER	\N
3741	3	proxecto-00003-00019-00001	26	1.00	f	3664	WORKER	\N
85612	3	proxecto-00009-00035-00001	48	1.00	f	85536	WORKER	\N
85613	3	proxecto-00009-00036-00001	32	1.00	f	85537	WORKER	\N
85614	3	proxecto-00009-00037-00001	32	1.00	f	85538	WORKER	\N
90701	2	proxecto-00015-00006-00001	50	1.00	f	90602	WORKER	\N
57288	9	proxecto-00008-00044-00001	15	1.00	f	57230	WORKER	\N
57289	9	proxecto-00008-00045-00001	48	1.00	f	57231	WORKER	\N
85615	3	proxecto-00009-00038-00001	64	1.00	f	85540	WORKER	\N
85616	3	proxecto-00009-00039-00001	16	1.00	f	85541	WORKER	\N
85617	3	proxecto-00009-00040-00001	32	1.00	f	85542	WORKER	\N
57290	9	proxecto-00008-00046-00001	40	1.00	f	57232	WORKER	\N
57291	9	proxecto-00008-00047-00001	24	1.00	f	57233	WORKER	\N
57292	9	proxecto-00008-00048-00001	32	1.00	f	57234	WORKER	\N
6951	31	proxecto-00006-00051-00001	40	1.00	f	7079	WORKER	\N
6953	31	proxecto-00006-00053-00001	32	1.00	f	7082	WORKER	\N
7185	30	proxecto-00006-00056-00001	16	1.00	f	7116	WORKER	\N
7186	30	proxecto-00006-00057-00001	24	1.00	f	7117	WORKER	\N
6955	31	proxecto-00006-00046-00001	24	1.00	f	7084	WORKER	\N
6952	31	proxecto-00006-00052-00001	24	1.00	f	7080	WORKER	\N
57060	9	proxecto-00008-00018-00001	8	1.00	f	57195	WORKER	\N
57061	9	proxecto-00008-00019-00001	16	1.00	f	57196	WORKER	\N
90702	4	proxecto-00016-00001-00001	300	1.00	f	90605	WORKER	\N
90703	4	proxecto-00016-00002-00001	400	1.00	f	90606	WORKER	\N
7187	30	proxecto-00006-00058-00001	24	1.00	f	7118	WORKER	\N
7188	30	proxecto-00006-00059-00001	24	1.00	f	7119	WORKER	\N
7189	30	proxecto-00006-00060-00001	24	1.00	f	7120	WORKER	\N
7190	30	proxecto-00006-00061-00001	24	1.00	f	7121	WORKER	\N
7191	30	proxecto-00006-00062-00001	24	1.00	f	7122	WORKER	\N
85618	3	proxecto-00009-00041-00001	40	1.00	f	85543	WORKER	\N
85619	3	proxecto-00009-00042-00001	16	1.00	f	85544	WORKER	\N
122421	3	proxecto-00021-00061-00001	24	1.00	f	122372	WORKER	\N
122422	3	proxecto-00021-00062-00001	24	1.00	f	122373	WORKER	\N
122423	3	proxecto-00021-00063-00001	24	1.00	f	122374	WORKER	\N
122424	3	proxecto-00021-00016-00001	256	1.00	f	122375	WORKER	\N
122425	3	proxecto-00021-00017-00001	256	1.00	f	122376	WORKER	\N
90704	8	proxecto-00017-00003-00001	160	1.00	f	90610	WORKER	\N
90705	8	proxecto-00017-00004-00001	160	1.00	f	90611	WORKER	\N
90706	8	proxecto-00017-00005-00001	160	1.00	f	90613	WORKER	\N
90707	8	proxecto-00017-00006-00001	160	1.00	f	90614	WORKER	\N
3761	8	proxecto-00004-00001-00001	100	1.00	f	3698	WORKER	\N
3762	8	proxecto-00004-00002-00001	200	1.00	f	3699	WORKER	\N
3763	8	proxecto-00004-00003-00001	100	1.00	f	3700	WORKER	\N
6613	35	proxecto-00006-00014-00001	24	1.00	f	6340	WORKER	\N
6614	35	proxecto-00006-00015-00001	48	1.00	f	6341	WORKER	\N
6615	35	proxecto-00006-00016-00001	28	1.00	f	6342	WORKER	\N
6616	35	proxecto-00006-00017-00001	120	1.00	f	6343	WORKER	\N
6623	34	proxecto-00006-00019-00001	24	1.00	f	6354	WORKER	\N
6624	34	proxecto-00006-00020-00001	40	1.00	f	6355	WORKER	\N
6634	33	proxecto-00006-00024-00001	40	1.00	f	6675	WORKER	\N
6635	33	proxecto-00006-00025-00001	40	1.00	f	6677	WORKER	\N
6636	33	proxecto-00006-00023-00001	48	1.00	f	6678	WORKER	\N
7192	30	proxecto-00006-00063-00001	256	1.00	f	7123	WORKER	\N
7193	30	proxecto-00006-00064-00001	256	1.00	f	7124	WORKER	\N
57062	9	proxecto-00008-00020-00001	16	1.00	f	57197	WORKER	\N
57063	9	proxecto-00008-00021-00001	40	1.00	f	57198	WORKER	\N
57064	9	proxecto-00008-00022-00001	24	1.00	f	57200	WORKER	\N
57267	9	proxecto-00008-00023-00001	56	1.00	f	57201	WORKER	\N
57268	9	proxecto-00008-00024-00001	8	1.00	f	57202	WORKER	\N
118035	3	proxecto-00021-00018-00001	8	1.00	f	122315	WORKER	\N
118036	3	proxecto-00021-00019-00001	16	1.00	f	122316	WORKER	\N
117976	12	proxecto-00019-00003-00001	160	1.00	f	117789	WORKER	\N
117977	12	proxecto-00019-00004-00001	160	1.00	f	117790	WORKER	\N
117978	12	proxecto-00019-00005-00001	160	1.00	f	117792	WORKER	\N
117979	12	proxecto-00019-00006-00001	160	1.00	f	117793	WORKER	\N
57269	9	proxecto-00008-00025-00001	40	1.00	f	57204	WORKER	\N
57270	9	proxecto-00008-00026-00001	8	1.00	f	57205	WORKER	\N
118054	3	proxecto-00021-00037-00001	32	1.00	f	122341	WORKER	\N
118055	3	proxecto-00021-00038-00001	64	1.00	f	122343	WORKER	\N
118056	3	proxecto-00021-00039-00001	16	1.00	f	122344	WORKER	\N
118057	3	proxecto-00021-00040-00001	32	1.00	f	122345	WORKER	\N
118058	3	proxecto-00021-00041-00001	40	1.00	f	122346	WORKER	\N
118059	3	proxecto-00021-00042-00001	16	1.00	f	122347	WORKER	\N
57271	9	proxecto-00008-00027-00001	24	1.00	f	57207	WORKER	\N
57272	9	proxecto-00008-00028-00001	48	1.00	f	57208	WORKER	\N
57273	9	proxecto-00008-00029-00001	28	1.00	f	57209	WORKER	\N
57274	9	proxecto-00008-00030-00001	120	1.00	f	57210	WORKER	\N
57275	9	proxecto-00008-00031-00001	24	1.00	f	57212	WORKER	\N
57276	9	proxecto-00008-00032-00001	40	1.00	f	57213	WORKER	\N
57277	9	proxecto-00008-00033-00001	40	1.00	f	57215	WORKER	\N
57278	9	proxecto-00008-00034-00001	40	1.00	f	57217	WORKER	\N
118060	3	proxecto-00021-00043-00001	32	1.00	f	122348	WORKER	\N
118061	3	proxecto-00021-00044-00001	15	1.00	f	122350	WORKER	\N
118062	3	proxecto-00021-00045-00001	48	1.00	f	122351	WORKER	\N
57297	9	proxecto-00008-00053-00001	40	1.00	f	57242	WORKER	\N
57298	9	proxecto-00008-00054-00001	32	1.00	f	57244	WORKER	\N
57299	9	proxecto-00008-00055-00001	16	1.00	f	57246	WORKER	\N
57300	9	proxecto-00008-00056-00001	24	1.00	f	57247	WORKER	\N
57301	9	proxecto-00008-00057-00001	24	1.00	f	57248	WORKER	\N
57302	9	proxecto-00008-00058-00001	24	1.00	f	57249	WORKER	\N
117982	11	proxecto-00019-00007-00001	30	1.00	f	117796	WORKER	\N
57303	9	proxecto-00008-00059-00001	24	1.00	f	57250	WORKER	\N
57304	9	proxecto-00008-00060-00001	24	1.00	f	57251	WORKER	\N
57305	9	proxecto-00008-00061-00001	24	1.00	f	57252	WORKER	\N
57306	9	proxecto-00008-00062-00001	24	1.00	f	57253	WORKER	\N
57307	9	proxecto-00008-00063-00001	24	1.00	f	57254	WORKER	\N
57308	9	proxecto-00008-00016-00001	256	1.00	f	57255	WORKER	\N
118038	3	proxecto-00021-00021-00001	40	1.00	f	122318	WORKER	\N
118039	3	proxecto-00021-00022-00001	24	1.00	f	122320	WORKER	\N
118040	3	proxecto-00021-00023-00001	56	1.00	f	122321	WORKER	\N
118041	3	proxecto-00021-00024-00001	8	1.00	f	122322	WORKER	\N
118042	3	proxecto-00021-00025-00001	40	1.00	f	122324	WORKER	\N
118066	3	proxecto-00021-00049-00001	64	1.00	f	122356	WORKER	\N
118067	3	proxecto-00021-00050-00001	96	1.00	f	122357	WORKER	\N
118068	3	proxecto-00021-00051-00001	32	1.00	f	122359	WORKER	\N
122412	3	proxecto-00021-00052-00001	40	1.00	f	122360	WORKER	\N
122413	3	proxecto-00021-00053-00001	40	1.00	f	122362	WORKER	\N
122414	3	proxecto-00021-00054-00001	32	1.00	f	122364	WORKER	\N
122415	3	proxecto-00021-00055-00001	16	1.00	f	122366	WORKER	\N
86004	3	proxecto-00010-00028-00001	48	1.00	f	86158	WORKER	\N
86005	3	proxecto-00010-00029-00001	28	1.00	f	86159	WORKER	\N
86006	3	proxecto-00010-00030-00001	120	1.00	f	86160	WORKER	\N
86007	3	proxecto-00010-00031-00001	24	1.00	f	86162	WORKER	\N
86008	3	proxecto-00010-00032-00001	40	1.00	f	86163	WORKER	\N
86009	3	proxecto-00010-00033-00001	40	1.00	f	86165	WORKER	\N
86010	3	proxecto-00010-00034-00001	40	1.00	f	86167	WORKER	\N
86011	3	proxecto-00010-00035-00001	48	1.00	f	86169	WORKER	\N
86012	3	proxecto-00010-00036-00001	32	1.00	f	86170	WORKER	\N
86013	3	proxecto-00010-00037-00001	32	1.00	f	86171	WORKER	\N
86014	3	proxecto-00010-00038-00001	64	1.00	f	86173	WORKER	\N
86015	3	proxecto-00010-00039-00001	16	1.00	f	86174	WORKER	\N
86016	3	proxecto-00010-00040-00001	32	1.00	f	86175	WORKER	\N
86017	3	proxecto-00010-00041-00001	40	1.00	f	86176	WORKER	\N
86018	3	proxecto-00010-00042-00001	16	1.00	f	86177	WORKER	\N
86019	3	proxecto-00010-00043-00001	32	1.00	f	86178	WORKER	\N
6907	32	proxecto-00006-00029-00001	32	1.00	f	6816	WORKER	\N
6908	32	proxecto-00006-00030-00001	32	1.00	f	6817	WORKER	\N
57279	9	proxecto-00008-00035-00001	48	1.00	f	57219	WORKER	\N
57280	9	proxecto-00008-00036-00001	32	1.00	f	57220	WORKER	\N
117986	6	proxecto-00020-00005-00001	25	1.00	f	117804	WORKER	\N
118047	3	proxecto-00021-00030-00001	120	1.00	f	122330	WORKER	\N
118048	3	proxecto-00021-00031-00001	24	1.00	f	122332	WORKER	\N
118049	3	proxecto-00021-00032-00001	40	1.00	f	122333	WORKER	\N
57281	9	proxecto-00008-00037-00001	32	1.00	f	57221	WORKER	\N
118050	3	proxecto-00021-00033-00001	40	1.00	f	122335	WORKER	\N
118051	3	proxecto-00021-00034-00001	40	1.00	f	122337	WORKER	\N
118052	3	proxecto-00021-00035-00001	48	1.00	f	122339	WORKER	\N
86046	11	proxecto-00013-00003-00001	100	1.00	f	86215	WORKER	\N
86047	11	proxecto-00013-00004-00001	100	1.00	f	86216	WORKER	\N
86048	11	proxecto-00013-00005-00001	56	1.00	f	86217	WORKER	\N
118053	3	proxecto-00021-00036-00001	32	1.00	f	122340	WORKER	\N
122416	3	proxecto-00021-00056-00001	24	1.00	f	122367	WORKER	\N
6910	32	proxecto-00006-00032-00001	16	1.00	f	6820	WORKER	\N
6911	32	proxecto-00006-00033-00001	32	1.00	f	6821	WORKER	\N
6912	32	proxecto-00006-00034-00001	40	1.00	f	6822	WORKER	\N
6913	32	proxecto-00006-00035-00001	16	1.00	f	6823	WORKER	\N
6914	32	proxecto-00006-00036-00001	32	1.00	f	6824	WORKER	\N
6915	32	proxecto-00006-00037-00001	15	1.00	f	6826	WORKER	\N
6916	32	proxecto-00006-00038-00001	48	1.00	f	6827	WORKER	\N
6917	32	proxecto-00006-00039-00001	40	1.00	f	6828	WORKER	\N
6918	32	proxecto-00006-00040-00001	24	1.00	f	6829	WORKER	\N
6919	32	proxecto-00006-00041-00001	32	1.00	f	6830	WORKER	\N
6947	31	proxecto-00006-00047-00001	64	1.00	f	7073	WORKER	\N
6948	31	proxecto-00006-00048-00001	96	1.00	f	7074	WORKER	\N
6949	31	proxecto-00006-00049-00001	32	1.00	f	7076	WORKER	\N
6950	31	proxecto-00006-00050-00001	40	1.00	f	7077	WORKER	\N
3742	3	proxecto-00003-00020-00001	34	1.00	f	3665	WORKER	\N
3743	3	proxecto-00003-00021-00001	43	1.00	f	3666	WORKER	\N
3744	3	proxecto-00003-00022-00001	65	1.00	f	3667	WORKER	\N
3745	3	proxecto-00003-00023-00001	70	1.00	f	3668	WORKER	\N
3746	3	proxecto-00003-00024-00001	50	1.00	f	3669	WORKER	\N
3747	3	proxecto-00003-00025-00001	70	1.00	f	3670	WORKER	\N
3748	3	proxecto-00003-00026-00001	80	1.00	f	3671	WORKER	\N
3749	3	proxecto-00003-00027-00001	100	1.00	f	3672	WORKER	\N
3750	3	proxecto-00003-00028-00001	42	1.00	f	3673	WORKER	\N
3751	3	proxecto-00003-00029-00001	300	1.00	f	3674	WORKER	\N
4866	3	proxecto-00005-00001-00002	40	0.50	f	4713	WORKER	\N
4865	3	proxecto-00005-00001-00001	40	0.50	f	4713	WORKER	\N
4867	3	proxecto-00005-00002-00001	100	1.00	f	4714	WORKER	\N
4869	3	proxecto-00005-00003-00002	100	0.50	f	4715	WORKER	\N
4868	3	proxecto-00005-00003-00001	100	0.50	f	4715	WORKER	\N
85604	3	proxecto-00009-00027-00001	24	1.00	f	85524	WORKER	\N
85605	3	proxecto-00009-00028-00001	48	1.00	f	85525	WORKER	\N
6583	37	proxecto-00006-00003-00001	8	1.00	f	6301	WORKER	\N
6584	37	proxecto-00006-00004-00001	16	1.00	f	6302	WORKER	\N
57282	9	proxecto-00008-00038-00001	64	1.00	f	57223	WORKER	\N
57283	9	proxecto-00008-00039-00001	16	1.00	f	57224	WORKER	\N
90699	2	proxecto-00015-00004-00001	30	1.00	f	90600	WORKER	\N
90700	2	proxecto-00015-00005-00001	40	1.00	f	90601	WORKER	\N
57284	9	proxecto-00008-00040-00001	32	1.00	f	57225	WORKER	\N
57293	9	proxecto-00008-00049-00001	64	1.00	f	57236	WORKER	\N
57294	9	proxecto-00008-00050-00001	96	1.00	f	57237	WORKER	\N
57295	9	proxecto-00008-00051-00001	32	1.00	f	57239	WORKER	\N
57296	9	proxecto-00008-00052-00001	40	1.00	f	57240	WORKER	\N
6585	37	proxecto-00006-00005-00001	16	1.00	f	6303	WORKER	\N
6586	37	proxecto-00006-00006-00001	40	1.00	f	6304	WORKER	\N
6587	37	proxecto-00006-00007-00001	24	1.00	f	6306	WORKER	\N
6588	37	proxecto-00006-00008-00001	56	1.00	f	6307	WORKER	\N
6598	36	proxecto-00006-00010-00001	8	1.00	f	6320	WORKER	\N
6599	36	proxecto-00006-00011-00001	40	1.00	f	6322	WORKER	\N
6600	36	proxecto-00006-00012-00001	8	1.00	f	6323	WORKER	\N
85620	3	proxecto-00009-00043-00001	32	1.00	f	85545	WORKER	\N
85621	3	proxecto-00009-00044-00001	15	1.00	f	85749	WORKER	\N
85622	3	proxecto-00009-00045-00001	48	1.00	f	85750	WORKER	\N
85623	3	proxecto-00009-00046-00001	40	1.00	f	85751	WORKER	\N
85624	3	proxecto-00009-00047-00001	24	1.00	f	85752	WORKER	\N
85637	3	proxecto-00009-00060-00001	24	1.00	f	85770	WORKER	\N
85638	3	proxecto-00009-00061-00001	24	1.00	f	85771	WORKER	\N
85639	3	proxecto-00009-00062-00001	24	1.00	f	85772	WORKER	\N
118037	3	proxecto-00021-00020-00001	16	1.00	f	122317	WORKER	\N
118063	3	proxecto-00021-00046-00001	40	1.00	f	122352	WORKER	\N
118064	3	proxecto-00021-00047-00001	24	1.00	f	122353	WORKER	\N
118065	3	proxecto-00021-00048-00001	32	1.00	f	122354	WORKER	\N
86020	3	proxecto-00010-00044-00001	15	1.00	f	86180	WORKER	\N
86021	3	proxecto-00010-00045-00001	48	1.00	f	86181	WORKER	\N
86040	3	proxecto-00010-00016-00001	256	1.00	f	86205	WORKER	\N
86041	3	proxecto-00010-00017-00001	256	1.00	f	86206	WORKER	\N
118043	3	proxecto-00021-00026-00001	8	1.00	f	122325	WORKER	\N
118044	3	proxecto-00021-00027-00001	24	1.00	f	122327	WORKER	\N
105141	9	proxecto-00018-00001-00001	200	1.00	f	105041	WORKER	\N
118045	3	proxecto-00021-00028-00001	48	1.00	f	122328	WORKER	\N
117983	6	proxecto-00019-00009-00001	30	1.00	f	117798	WORKER	\N
118046	3	proxecto-00021-00029-00001	28	1.00	f	122329	WORKER	\N
85994	3	proxecto-00010-00018-00001	8	1.00	f	85842	WORKER	\N
85995	3	proxecto-00010-00019-00001	16	1.00	f	85843	WORKER	\N
85996	3	proxecto-00010-00020-00001	16	1.00	f	85844	WORKER	\N
85997	3	proxecto-00010-00021-00001	40	1.00	f	85845	WORKER	\N
85998	3	proxecto-00010-00022-00001	24	1.00	f	85847	WORKER	\N
85999	3	proxecto-00010-00023-00001	56	1.00	f	85848	WORKER	\N
86000	3	proxecto-00010-00024-00001	8	1.00	f	85849	WORKER	\N
86001	3	proxecto-00010-00025-00001	40	1.00	f	86154	WORKER	\N
86002	3	proxecto-00010-00026-00001	8	1.00	f	86155	WORKER	\N
86003	3	proxecto-00010-00027-00001	24	1.00	f	86157	WORKER	\N
85595	3	proxecto-00009-00018-00001	8	1.00	f	85512	WORKER	\N
85596	3	proxecto-00009-00019-00001	16	1.00	f	85513	WORKER	\N
85597	3	proxecto-00009-00020-00001	16	1.00	f	85514	WORKER	\N
85598	3	proxecto-00009-00021-00001	40	1.00	f	85515	WORKER	\N
85599	3	proxecto-00009-00022-00001	24	1.00	f	85517	WORKER	\N
85600	3	proxecto-00009-00023-00001	56	1.00	f	85518	WORKER	\N
85601	3	proxecto-00009-00024-00001	8	1.00	f	85519	WORKER	\N
85602	3	proxecto-00009-00025-00001	40	1.00	f	85521	WORKER	\N
85603	3	proxecto-00009-00026-00001	8	1.00	f	85522	WORKER	\N
85606	3	proxecto-00009-00029-00001	28	1.00	f	85526	WORKER	\N
85607	3	proxecto-00009-00030-00001	120	1.00	f	85527	WORKER	\N
85608	3	proxecto-00009-00031-00001	24	1.00	f	85529	WORKER	\N
85609	3	proxecto-00009-00032-00001	40	1.00	f	85530	WORKER	\N
85610	3	proxecto-00009-00033-00001	40	1.00	f	85532	WORKER	\N
85611	3	proxecto-00009-00034-00001	40	1.00	f	85534	WORKER	\N
85627	3	proxecto-00009-00050-00001	96	1.00	f	85756	WORKER	\N
85628	3	proxecto-00009-00051-00001	32	1.00	f	85758	WORKER	\N
85629	3	proxecto-00009-00052-00001	40	1.00	f	85759	WORKER	\N
85630	3	proxecto-00009-00053-00001	40	1.00	f	85761	WORKER	\N
85631	3	proxecto-00009-00054-00001	32	1.00	f	85763	WORKER	\N
85632	3	proxecto-00009-00055-00001	16	1.00	f	85765	WORKER	\N
85633	3	proxecto-00009-00056-00001	24	1.00	f	85766	WORKER	\N
85634	3	proxecto-00009-00057-00001	24	1.00	f	85767	WORKER	\N
85635	3	proxecto-00009-00058-00001	24	1.00	f	85768	WORKER	\N
85636	3	proxecto-00009-00059-00001	24	1.00	f	85769	WORKER	\N
85640	3	proxecto-00009-00063-00001	24	1.00	f	85773	WORKER	\N
85641	3	proxecto-00009-00016-00001	256	1.00	f	85774	WORKER	\N
85642	3	proxecto-00009-00017-00001	256	1.00	f	85775	WORKER	\N
122417	3	proxecto-00021-00057-00001	24	1.00	f	122368	WORKER	\N
122418	3	proxecto-00021-00058-00001	24	1.00	f	122369	WORKER	\N
86022	3	proxecto-00010-00046-00001	40	1.00	f	86182	WORKER	\N
86023	3	proxecto-00010-00047-00001	24	1.00	f	86183	WORKER	\N
86024	3	proxecto-00010-00048-00001	32	1.00	f	86184	WORKER	\N
86025	3	proxecto-00010-00049-00001	64	1.00	f	86186	WORKER	\N
86026	3	proxecto-00010-00050-00001	96	1.00	f	86187	WORKER	\N
86027	3	proxecto-00010-00051-00001	32	1.00	f	86189	WORKER	\N
86028	3	proxecto-00010-00052-00001	40	1.00	f	86190	WORKER	\N
86029	3	proxecto-00010-00053-00001	40	1.00	f	86192	WORKER	\N
86030	3	proxecto-00010-00054-00001	32	1.00	f	86194	WORKER	\N
86031	3	proxecto-00010-00055-00001	16	1.00	f	86196	WORKER	\N
86032	3	proxecto-00010-00056-00001	24	1.00	f	86197	WORKER	\N
86033	3	proxecto-00010-00057-00001	24	1.00	f	86198	WORKER	\N
86034	3	proxecto-00010-00058-00001	24	1.00	f	86199	WORKER	\N
86035	3	proxecto-00010-00059-00001	24	1.00	f	86200	WORKER	\N
86036	3	proxecto-00010-00060-00001	24	1.00	f	86201	WORKER	\N
86037	3	proxecto-00010-00061-00001	24	1.00	f	86202	WORKER	\N
86038	3	proxecto-00010-00062-00001	24	1.00	f	86203	WORKER	\N
86039	3	proxecto-00010-00063-00001	24	1.00	f	86204	WORKER	\N
122419	3	proxecto-00021-00059-00001	24	1.00	f	122370	WORKER	\N
122420	3	proxecto-00021-00060-00001	24	1.00	f	122371	WORKER	\N
105142	9	proxecto-00018-00003-00001	30	1.00	f	105043	WORKER	\N
105143	9	proxecto-00018-00004-00001	26	1.00	f	105044	WORKER	\N
117985	6	proxecto-00020-00003-00001	30	1.00	f	117802	WORKER	\N
140407	23	proxecto-00023-00020-00001	35	1.00	f	140007	WORKER	\N
140408	23	proxecto-00023-00021-00001	35	1.00	f	140008	WORKER	\N
140409	23	proxecto-00023-00022-00001	14	1.00	f	140009	WORKER	\N
140410	23	proxecto-00023-00023-00001	14	1.00	f	140010	WORKER	\N
140411	22	proxecto-00023-00025-00001	14	1.00	f	140012	WORKER	\N
140397	24	proxecto-00023-00008-00001	40	1.00	f	139995	WORKER	\N
140398	24	proxecto-00023-00009-00001	101	1.00	f	139996	WORKER	\N
140399	24	proxecto-00023-00010-00001	70	1.00	f	139997	WORKER	\N
140400	23	proxecto-00023-00013-00001	12	1.00	f	139999	WORKER	\N
140401	23	proxecto-00023-00014-00001	12	1.00	f	140000	WORKER	\N
140402	23	proxecto-00023-00015-00001	4	1.00	f	140001	WORKER	\N
140403	23	proxecto-00023-00016-00001	8	1.00	f	140002	WORKER	\N
140404	23	proxecto-00023-00017-00001	8	1.00	f	140003	WORKER	\N
140405	23	proxecto-00023-00018-00001	16	1.00	f	140004	WORKER	\N
140406	23	proxecto-00023-00019-00001	21	1.00	f	140006	WORKER	\N
140413	22	proxecto-00023-00027-00001	18	1.00	f	140014	WORKER	\N
140414	22	proxecto-00023-00028-00001	17	1.00	f	140015	WORKER	\N
140415	22	proxecto-00023-00029-00001	4	1.00	f	140016	WORKER	\N
140416	22	proxecto-00023-00030-00001	17	1.00	f	140017	WORKER	\N
140417	22	proxecto-00023-00031-00001	4	1.00	f	140018	WORKER	\N
140418	22	proxecto-00023-00032-00001	14	1.00	f	140019	WORKER	\N
140419	22	proxecto-00023-00033-00001	14	1.00	f	140020	WORKER	\N
140420	22	proxecto-00023-00034-00001	32	1.00	f	140021	WORKER	\N
140421	22	proxecto-00023-00035-00001	32	1.00	f	140022	WORKER	\N
140422	22	proxecto-00023-00036-00001	4	1.00	f	140023	WORKER	\N
140423	22	proxecto-00023-00037-00001	4	1.00	f	140024	WORKER	\N
140424	22	proxecto-00023-00038-00001	4	1.00	f	140025	WORKER	\N
140425	22	proxecto-00023-00039-00001	25	1.00	f	140026	WORKER	\N
140426	22	proxecto-00023-00040-00001	10	1.00	f	140027	WORKER	\N
140427	22	proxecto-00023-00041-00001	80	1.00	f	140028	WORKER	\N
140428	22	proxecto-00023-00042-00001	24	1.00	f	140029	WORKER	\N
140429	22	proxecto-00023-00043-00001	14	1.00	f	140030	WORKER	\N
140430	22	proxecto-00023-00044-00001	83	1.00	f	140031	WORKER	\N
140432	19	proxecto-00023-00047-00001	21	1.00	f	140034	WORKER	\N
140433	19	proxecto-00023-00048-00001	40	1.00	f	140035	WORKER	\N
140434	19	proxecto-00023-00049-00001	21	1.00	f	140036	WORKER	\N
140435	19	proxecto-00023-00050-00001	21	1.00	f	140037	WORKER	\N
140436	19	proxecto-00023-00051-00001	14	1.00	f	140038	WORKER	\N
140437	19	proxecto-00023-00052-00001	4	1.00	f	140039	WORKER	\N
140438	19	proxecto-00023-00053-00001	28	1.00	f	140040	WORKER	\N
140439	19	proxecto-00023-00054-00001	17	1.00	f	140041	WORKER	\N
140440	19	proxecto-00023-00055-00001	17	1.00	f	140042	WORKER	\N
140441	19	proxecto-00023-00056-00001	46	1.00	f	140043	WORKER	\N
140442	18	proxecto-00023-00058-00001	35	1.00	f	140045	WORKER	\N
140443	18	proxecto-00023-00059-00001	35	1.00	f	140046	WORKER	\N
140444	18	proxecto-00023-00060-00001	45	1.00	f	140047	WORKER	\N
140445	18	proxecto-00023-00061-00001	45	1.00	f	140048	WORKER	\N
140412	22	proxecto-00023-00026-00001	3	1.00	f	140013	WORKER	\N
140450	17	proxecto-00023-00067-00001	7	1.00	f	140054	WORKER	\N
140451	17	proxecto-00023-00068-00001	7	1.00	f	140055	WORKER	\N
140452	17	proxecto-00023-00069-00001	21	1.00	f	140056	WORKER	\N
140453	17	proxecto-00023-00070-00001	80	1.00	f	140057	WORKER	\N
140454	17	proxecto-00023-00071-00001	7	1.00	f	140058	WORKER	\N
140455	17	proxecto-00023-00072-00001	49	1.00	f	140059	WORKER	\N
140456	17	proxecto-00023-00073-00001	14	1.00	f	140060	WORKER	\N
140457	17	proxecto-00023-00074-00001	7	1.00	f	140061	WORKER	\N
140458	17	proxecto-00023-00075-00001	7	1.00	f	140062	WORKER	\N
140459	17	proxecto-00023-00076-00001	14	1.00	f	140063	WORKER	\N
140460	17	proxecto-00023-00077-00001	21	1.00	f	140064	WORKER	\N
140461	17	proxecto-00023-00078-00001	14	1.00	f	140065	WORKER	\N
367445	11	proxecto-00024-00005-00001	100	1.00	f	367246	WORKER	\N
367446	11	proxecto-00024-00006-00001	100	1.00	f	367247	WORKER	\N
367447	11	proxecto-00024-00007-00001	50	1.00	f	367248	WORKER	\N
367438	11	proxecto-00024-00008-00001	16	1.00	f	367239	WORKER	\N
367439	11	proxecto-00024-00009-00001	8	1.00	f	367240	WORKER	\N
367440	11	proxecto-00024-00010-00001	24	1.00	f	367241	WORKER	\N
367441	11	proxecto-00024-00011-00001	16	1.00	f	367242	WORKER	\N
367442	11	proxecto-00024-00002-00001	24	1.00	f	367243	WORKER	\N
367448	10	proxecto-00024-00013-00001	32	1.00	f	367250	WORKER	\N
367449	10	proxecto-00024-00014-00001	15	1.00	f	367251	WORKER	\N
367450	10	proxecto-00024-00015-00001	20	1.00	f	367252	WORKER	\N
367451	10	proxecto-00024-00016-00001	30	1.00	f	367253	WORKER	\N
367443	11	proxecto-00024-00003-00001	16	1.00	f	367244	WORKER	\N
367452	9	proxecto-00024-00018-00001	30	1.00	f	367255	WORKER	\N
367453	9	proxecto-00024-00019-00001	24	1.00	f	367256	WORKER	\N
367444	11	proxecto-00024-00004-00001	8	1.00	f	367245	WORKER	\N
367454	8	proxecto-00024-00021-00001	16	1.00	f	367258	WORKER	\N
367455	8	proxecto-00024-00022-00001	24	1.00	f	367259	WORKER	\N
140446	18	proxecto-00023-00062-00001	35	1.00	f	140049	WORKER	\N
140447	18	proxecto-00023-00063-00001	49	1.00	f	140050	WORKER	\N
140448	17	proxecto-00023-00065-00001	7	1.00	f	140052	WORKER	\N
140449	17	proxecto-00023-00066-00001	7	1.00	f	140053	WORKER	\N
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
409	16	0
409	16	1
409	16	2
409	16	3
409	16	4
117162	0	5
139687	7	0
139687	7	1
139687	7	2
139687	7	3
139687	7	4
139687	0	5
139687	0	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
1951	1869
1952	1873
1953	1876
1954	1868
3356	3255
57128	57194
3408	4712
122225	122314
57129	57194
57133	57199
122224	122314
122229	122319
122230	122319
122233	122323
117890	117803
5674	3697
3370	3697
117889	117803
117891	117800
117892	117800
117884	117800
117894	117799
117885	117799
5675	3697
79997	6300
5696	6300
7513	6300
5697	6305
7517	6305
5701	6321
8005	6321
105243	105042
117893	117799
122234	122323
122239	122326
122240	122326
122244	122331
122243	122331
86101	85841
86102	85841
86107	85846
86106	85846
86110	86153
86111	86153
86117	86156
86116	86156
86121	86161
86120	86161
86124	86164
86123	86164
86127	86166
86126	86166
86131	86168
86132	86168
86140	86172
86139	86172
86146	86179
86147	86179
86150	86185
86151	86185
86256	86188
86255	86188
86259	86191
86258	86191
86261	86193
86262	86193
86272	86195
86273	86195
86276	85840
86277	85840
80084	85511
80083	85511
80089	85516
80088	85516
85648	85520
80092	85520
85654	85523
85653	85523
85658	85528
85657	85528
85660	85531
85661	85531
85663	85533
85664	85533
85669	85535
85668	85535
85676	85539
85677	85539
85683	85546
85684	85546
85688	85754
85687	85754
85692	85757
85691	85757
85695	85760
85694	85760
85698	85762
85697	85762
85709	85764
85708	85764
85712	85510
85713	85510
86286	86214
86328	86214
86281	86214
86287	86208
86279	86208
86329	86208
90800	90599
90799	90597
90802	90604
57400	57245
57401	57245
57404	57193
117886	117803
122247	122334
122246	122334
122250	122336
122249	122336
122254	122338
122255	122338
122262	122342
122263	122342
90805	90609
107474	90612
90806	90612
107475	90608
90804	90608
5705	6339
8010	6339
8013	6353
5709	6353
5716	6674
8015	6674
5717	6676
9291	6676
6978	6815
9295	6815
6979	6818
9302	6818
6980	6825
9308	6825
11029	7072
6993	7072
11032	7075
6994	7075
6995	7078
11034	7078
11036	7081
6996	7081
11046	7115
7518	6275
79998	6275
122269	122349
122270	122349
122274	122355
105268	105042
105269	105040
105242	105040
122273	122355
122277	122358
122278	122358
122281	122361
122280	122361
122283	122363
122284	122363
122294	122365
122295	122365
122298	122313
122299	122313
57405	57193
105271	57193
135158	135455
140094	140051
140095	140066
122301	117788
117880	117788
117881	117791
117896	117797
117883	117797
117882	117787
117897	117787
122302	117787
57134	57199
57138	57203
57137	57203
57144	57206
57143	57206
57148	57211
57147	57211
57150	57214
57151	57214
57154	57216
57153	57216
57159	57218
57158	57218
57368	57222
57369	57222
57375	57229
57376	57229
57380	57235
57379	57235
57384	57238
57383	57238
57387	57241
57386	57241
57390	57243
57389	57243
140089	139998
140090	140005
140091	140011
367338	367238
367340	367249
367341	367254
367342	367257
367339	367237
140092	140033
140093	140044
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
102516	4	774e42b9-c35c-4de2-a20b-487ff1c413ef	Puente	102414
102515	6	a6256552-5ac7-46a7-95d6-8b8c8b415c65	Bodegas	102414
1112	2	e725226b-94f3-41df-88fe-a1855cedc808	CC Cadiz	1010
1111	2	b2b9cdee-2785-4c03-8e01-cec0a93b61cf	CC Mugardos	1010
1114	2	b666450b-7fa2-4fca-be96-edc3eaaf0146	CC Ferrol	1010
362085	2	b53a03c3-5d9d-49dd-bddd-3f03349e4ca3	CC Bilbao	1010
1113	4	193da183-85b3-4306-9495-f40b3181480b	CC Vigo	1010
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
102414	1	9c0cbc00-9c1f-497b-b8f6-312105e3bdcb	Zonas de buque	\N
1010	2	a3636840-33ed-4e25-8ffd-6f98aa72df2a	Centro de coste	t
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt) FROM stdin;
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
5858	Incidencias	200	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
1234	Tornos2	Torno2	desc
1236	Tornos3	tornos3	Desc.
1232	Tornos1	Torno	desc
\.


--
-- Data for Name: machine_configuration_unit_required_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine_configuration_unit_required_criterions (id, criterion_id) FROM stdin;
117564	99889
\.


--
-- Data for Name: machineworkerassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkerassignment (id, version, startdate, finishdate, configuration_id, worker_id) FROM stdin;
1717	2	2010-02-03 12:06:45.203	\N	1616	1224
1718	2	2010-02-03 12:06:39.034	\N	1616	1214
117665	1	2010-02-17 17:06:34.113	\N	117564	1230
\.


--
-- Data for Name: machineworkersconfigurationunit; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkersconfigurationunit (id, version, name, alpha, machine) FROM stdin;
1616	2	New configuration unit	0.50	1236
117564	1	New configuration unit	1.00	1232
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material (id, version, code, description, default_unit_price, unit_type, disabled, category_id) FROM stdin;
101505	1	1.2	tubos 40mm	5.00	\N	f	101404
101506	1	1.1	tubos 20mm	3.00	\N	f	101404
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
101614	5	100	3.00	101506	2010-03-01 00:00:00	1	6301
101612	5	50	5.00	101505	2010-03-04 00:00:00	1	6301
101613	5	50	5.00	101505	2010-03-01 00:00:00	1	6301
101616	3	100	5.00	101505	\N	1	6302
101615	3	62	3.00	101506	\N	1	6302
101617	3	100	3.00	101506	\N	1	57195
101618	3	50	5.00	101505	\N	2	57195
101619	3	50	5.00	101505	\N	1	57195
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
202	2	Imported materials without category	\N	202	\N
101404	1	Tubos	\N	101404	\N
101405	1	Acero	\N	101405	\N
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
121907	1	 perfil1
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled) FROM stdin;
909	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f
910	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
109686	1	usuario_exemplo_1	8bac5730c2f8d849b04f38369986f7422262200e890cfb202972503dbc8eb19040519f0d3780df7274a086a4e697108f18f761c3eda14c4d59a2efc069f45bd8	usuario@exemplo1.com	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
97162	USER	4	WRITE_AUTHORIZATION	90604	910	\N
2222	USER	2	WRITE_AUTHORIZATION	1868	910	\N
3434	USER	3	WRITE_AUTHORIZATION	3255	910	\N
140188	USER	25	WRITE_AUTHORIZATION	139987	910	\N
3436	USER	2	WRITE_AUTHORIZATION	4712	910	\N
367539	USER	10	WRITE_AUTHORIZATION	367237	910	\N
97163	USER	8	WRITE_AUTHORIZATION	90608	910	\N
109787	USER	1	READ_AUTHORIZATION	3697	109686	\N
3435	USER	7	WRITE_AUTHORIZATION	3697	910	\N
109788	USER	1	READ_AUTHORIZATION	3697	109686	\N
6363	USER	38	WRITE_AUTHORIZATION	6275	910	\N
118070	USER	1	READ_AUTHORIZATION	117799	109686	\N
118071	USER	1	WRITE_AUTHORIZATION	117799	109686	\N
85851	USER	2	WRITE_AUTHORIZATION	85840	910	\N
85850	USER	2	WRITE_AUTHORIZATION	85510	910	\N
118072	USER	2	WRITE_AUTHORIZATION	122313	910	\N
118069	USER	11	WRITE_AUTHORIZATION	117787	910	\N
57570	USER	8	WRITE_AUTHORIZATION	57193	910	\N
135643	USER	1	WRITE_AUTHORIZATION	135455	910	\N
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
6301	102516
6826	102515
6826	102516
57195	102515
139999	1113
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
1868	Xavi	t	t	9	40000.00	4000.00	109	Ref	\N	0	2020	307
90597	\N	\N	t	6	10000.00	0.00	120	CODE-1	\N	5	2021	307
3255	REsp	\N	t	29	50000.00	0.00	1473	Ref	\N	0	2020	307
4712	Resp.	t	t	3	60000.00	0.00	380	Ref.	\N	1	2020	307
90604	\N	\N	t	2	20000.00	0.00	700	\N	\N	0	\N	307
139987	\N	t	t	87	0.00	0.00	2329	\N	\N	0	\N	307
367237	\N	\N	t	22	0.00	0.00	553	\N	\N	0	2021	307
90608	\N	\N	t	6	50000.00	0.00	640	\N	\N	0	2020	307
3697	asdf	\N	t	3	60000.00	0.00	400	asdf	\N	0	2020	307
6275	Xavier	\N	t	64	150000.00	0.00	2075	Ref,	\N	0	6464	307
85840	\N	\N	t	63	400000.00	0.00	2075	\N	\N	0	\N	307
85510	\N	\N	t	63	50000.00	0.00	2075	\N	\N	0	\N	307
105040	\N	\N	t	4	100000.00	0.00	256	\N	\N	5	2021	307
86208	\N	\N	t	5	100000.00	0.00	256	\N	\N	5	2021	307
117799	\N	\N	t	5	40000.00	0.00	55	CODE	\N	5	2021	307
122313	\N	\N	t	63	0.00	0.00	2075	\N	\N	0	\N	307
117787	\N	\N	t	9	50000.00	0.00	700	\N	\N	0	2020	116958
57193	\N	\N	t	63	100000.00	0.00	2075	\N	\N	0	\N	307
135455	\N	\N	t	5	0.00	0.00	800	\N	\N	0	\N	307
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
3255	5	Pedido 2	Desc.	proxecto-00003	2010-02-04 12:10:40.245	2010-11-25 00:00:00	3	\N	\N	\N	\N
122343	3	Administración das subcontratas	\N	proxecto-00021-00038	\N	\N	0	122342	\N	\N	0
85510	3	4º release Navalplan - 3	Desc.	proxecto-00009	2010-04-21 00:00:00	2010-05-27 00:00:00	3	\N	56587	\N	\N
85511	3	Módulo de xestión de usuarios	\N	proxecto-00009-00001	\N	\N	3	85510	\N	\N	0
85512	3	Xestión de usuarios	\N	proxecto-00009-00018	\N	\N	0	85511	\N	\N	0
85513	3	Xestión de roles	\N	proxecto-00009-00019	\N	\N	0	85511	\N	\N	1
85514	3	Xestión de perfiles	\N	proxecto-00009-00020	\N	\N	0	85511	\N	\N	2
85515	3	Xestión de roles e pedidos	\N	proxecto-00009-00021	\N	\N	0	85511	\N	\N	3
85516	3	Módulo de organizacións de traballo	\N	proxecto-00009-00002	\N	\N	3	85510	\N	\N	1
85517	3	Xestión de código único	\N	proxecto-00009-00022	\N	\N	0	85516	\N	\N	0
85518	3	Revisión de formulario de pedidos	\N	proxecto-00009-00023	\N	\N	0	85516	\N	\N	1
6343	35	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	0	6339	\N	\N	3
6353	34	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	3	6275	\N	\N	4
6354	34	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	0	6353	\N	\N	0
6355	34	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	0	6353	\N	\N	1
6674	33	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	3	6275	\N	\N	5
1869	3	Módulo de categorización do traballo	\N	proxecto-00001-00001	2010-02-01 00:00:00	\N	3	1868	\N	\N	0
1870	3	Gravación de grupos de horas con criterion requirements en plantillas	\N	proxecto-00001-00005	\N	\N	0	1869	\N	\N	0
1871	3	Aplicar modelo contendo grupos de horas	\N	proxecto-00001-00006	2010-01-27 00:00:00	\N	0	1869	\N	\N	1
1872	3	Permitir elixir entre modelos de ordeline ou orderline dentro dun pedido	\N	proxecto-00001-00002	\N	\N	4	1868	\N	\N	1
1873	3	Módulo de recursos	\N	proxecto-00001-00003	\N	\N	4	1868	\N	\N	2
1874	3	Filtrado por criterios, categorías de custo e datas de activación	\N	proxecto-00001-00007	\N	\N	4	1873	\N	\N	0
1875	3	Amosar máis información dos recursos no listado de recursos	\N	proxecto-00001-00008	\N	\N	4	1873	\N	\N	1
1876	3	Módulo de pedidos	\N	proxecto-00001-00004	\N	\N	4	1868	\N	\N	3
1877	3	Modificar o filtrado de order elements  para que permita por criterios, nome de tarefa e datas	\N	proxecto-00001-00009	\N	\N	4	1876	\N	\N	0
1868	4	Proxecto fin 4º release proxecto	Desc.	proxecto-00001	2010-02-01 00:00:00	2010-02-26 00:00:00	2	\N	\N	\N	\N
122344	3	Formato de intercambio	\N	proxecto-00021-00039	\N	\N	0	122342	\N	\N	1
122345	3	Fluxo de importación/exportación	\N	proxecto-00021-00040	\N	\N	0	122342	\N	\N	2
122346	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00021-00041	\N	\N	0	122342	\N	\N	3
6675	33	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	0	6674	\N	\N	0
90604	6	Pedido probas recursos virtuais	\N	proxecto-00016	2010-01-01 00:00:00	2010-03-16 00:00:00	3	\N	\N	\N	\N
122347	3	Convertir en fitos as subcontratacións	\N	proxecto-00021-00042	\N	\N	0	122342	\N	\N	4
122348	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00021-00043	\N	\N	0	122342	\N	\N	5
122349	3	Módulo de importación exportación	\N	proxecto-00021-00010	\N	\N	3	122313	\N	\N	9
122350	3	Definir workflow de pedidos para ERP	\N	proxecto-00021-00044	\N	\N	0	122349	\N	\N	0
6676	33	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	3	6275	\N	\N	6
6677	33	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	0	6676	\N	\N	0
3697	9	Pedido 3	asdf	proxecto-00004	2010-02-04 13:36:05.265	2010-02-25 00:00:00	3	\N	\N	\N	\N
3698	8	Tarefa 1	\N	proxecto-00004-00001	\N	\N	0	3697	\N	\N	0
3699	8	Tarefa 2	\N	proxecto-00004-00002	\N	\N	0	3697	\N	\N	1
3700	8	Tarefa 3	\N	proxecto-00004-00003	\N	\N	0	3697	\N	\N	2
6275	40	4º release Navalplan	Desc.	proxecto-00006	2009-12-14 00:00:00	2010-02-17 00:00:00	3	\N	\N	\N	\N
6320	36	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	0	6305	\N	\N	2
6321	36	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	3	6275	\N	\N	2
6322	36	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	0	6321	\N	\N	0
6323	36	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	0	6321	\N	\N	1
6342	35	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	0	6339	\N	\N	2
117796	12	fillo2	\N	proxecto-00019-00007	\N	\N	1	117797	\N	\N	0
57217	9	Informe de necesidades de materiais	\N	proxecto-00008-00034	\N	\N	0	57216	\N	\N	0
57218	9	Módulo de xestión da calidade	\N	proxecto-00008-00008	\N	\N	3	57193	\N	\N	7
4712	3	Pedido con máquinas	Desc.	proxecto-00005	2010-02-04 20:34:28.037	2010-03-04 00:00:00	3	\N	\N	\N	\N
4713	3	tarefa home	\N	proxecto-00005-00001	\N	\N	0	4712	\N	\N	0
4714	3	tarefa máquina	\N	proxecto-00005-00002	\N	\N	0	4712	\N	\N	1
4715	3	tarefa home-maquina	\N	proxecto-00005-00003	\N	\N	0	4712	\N	\N	2
90605	4	Tarefa 1	\N	proxecto-00016-00001	\N	\N	0	90604	\N	\N	0
90606	4	Tarefa 2	\N	proxecto-00016-00002	\N	\N	0	90604	\N	\N	1
6302	37	Xestión de roles	\N	proxecto-00006-00004	\N	\N	0	6300	\N	\N	1
57219	9	Administración de check-lists	\N	proxecto-00008-00035	\N	\N	0	57218	\N	\N	0
3646	3	Tarefa1	\N	proxecto-00003-00001	\N	\N	0	3255	\N	\N	0
3647	3	Tarefa2	\N	proxecto-00003-00002	\N	\N	0	3255	\N	\N	1
3648	3	Tarefa3	\N	proxecto-00003-00003	\N	\N	0	3255	\N	\N	2
3649	3	Tarefa4	\N	proxecto-00003-00004	\N	\N	0	3255	\N	\N	3
3650	3	Tarefa5	\N	proxecto-00003-00005	\N	\N	0	3255	\N	\N	4
3651	3	Tarefa6	\N	proxecto-00003-00006	\N	\N	0	3255	\N	\N	5
3652	3	Tarefa7	\N	proxecto-00003-00007	\N	\N	0	3255	\N	\N	6
3653	3	Tarefa8	\N	proxecto-00003-00008	\N	\N	0	3255	\N	\N	7
3654	3	Tarefa9	\N	proxecto-00003-00009	\N	\N	0	3255	\N	\N	8
3655	3	Tarefa10	\N	proxecto-00003-00010	\N	\N	0	3255	\N	\N	9
3656	3	Tarefa11	\N	proxecto-00003-00011	\N	\N	0	3255	\N	\N	10
3657	3	Tarefa12	\N	proxecto-00003-00012	\N	\N	0	3255	\N	\N	11
3658	3	Tarefa13	\N	proxecto-00003-00013	\N	\N	0	3255	\N	\N	12
3659	3	Tarefa14	\N	proxecto-00003-00014	\N	\N	0	3255	\N	\N	13
3660	3	Tarefa15	\N	proxecto-00003-00015	\N	\N	0	3255	\N	\N	14
3661	3	Tarefa16	\N	proxecto-00003-00016	\N	\N	0	3255	\N	\N	15
3662	3	Tarefa17	\N	proxecto-00003-00017	\N	\N	0	3255	\N	\N	16
3663	3	Tarefa18	\N	proxecto-00003-00018	\N	\N	0	3255	\N	\N	17
3664	3	Tarefa19	\N	proxecto-00003-00019	\N	\N	0	3255	\N	\N	18
3665	3	Tarefa20	\N	proxecto-00003-00020	\N	\N	0	3255	\N	\N	19
3666	3	Tarefa21	\N	proxecto-00003-00021	\N	\N	0	3255	\N	\N	20
3667	3	Tarefa22	\N	proxecto-00003-00022	\N	\N	0	3255	\N	\N	21
3668	3	Tarefa23	\N	proxecto-00003-00023	\N	\N	0	3255	\N	\N	22
3669	3	Tarefa24	\N	proxecto-00003-00024	\N	\N	0	3255	\N	\N	23
3670	3	Tarefa25	\N	proxecto-00003-00025	\N	\N	0	3255	\N	\N	24
3671	3	Tarefa26	\N	proxecto-00003-00026	\N	\N	0	3255	\N	\N	25
3672	3	Tarefa27	\N	proxecto-00003-00027	\N	\N	0	3255	\N	\N	26
3673	3	Tarefa28	\N	proxecto-00003-00028	\N	\N	0	3255	\N	\N	27
3674	3	Tarefa29	\N	proxecto-00003-00029	\N	\N	0	3255	\N	\N	28
57220	9	Cubrir formularios de calidade en planificación	\N	proxecto-00008-00036	\N	\N	0	57218	\N	\N	1
57221	9	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00008-00037	\N	\N	0	57218	\N	\N	2
57222	9	Módulo de integración con subcontratas	\N	proxecto-00008-00009	\N	\N	3	57193	\N	\N	8
57223	9	Administración das subcontratas	\N	proxecto-00008-00038	\N	\N	0	57222	\N	\N	0
122354	3	Formato de intercambio de materiais	\N	proxecto-00021-00048	\N	\N	0	122349	\N	\N	4
122355	3	Módulo de presentación	\N	proxecto-00021-00011	\N	\N	3	122313	\N	\N	10
122356	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00021-00049	\N	\N	0	122355	\N	\N	0
122357	3	Imprimir información pantalla do planificador	\N	proxecto-00021-00050	\N	\N	0	122355	\N	\N	1
122358	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00021-00012	\N	\N	3	122313	\N	\N	11
122359	3	Desenvolvemento de paquetes debian	\N	proxecto-00021-00051	\N	\N	0	122358	\N	\N	0
57216	9	Módulo de materiais	\N	proxecto-00008-00007	\N	\N	3	57193	\N	\N	6
117797	7	Tarefa 3 nivel 1	\N	proxecto-00019-00008	\N	\N	0	117787	\N	\N	2
117798	6	fillo1	\N	proxecto-00019-00009	\N	\N	1	117797	\N	\N	1
122368	3	Informes sobre partes de traballo	\N	proxecto-00021-00057	\N	\N	0	122365	\N	\N	2
122369	3	Informes de horas traballadas por un traballador	\N	proxecto-00021-00058	\N	\N	0	122365	\N	\N	3
122370	3	Lista de avances de planificación da empresa	\N	proxecto-00021-00059	\N	\N	0	122365	\N	\N	4
122371	3	Lista de avances de traballo da empresa	\N	proxecto-00021-00060	\N	\N	0	122365	\N	\N	5
117799	7	Subcontratacion	\N	proxecto-00020	2010-02-22 00:00:00	2010-03-01 12:00:00	3	\N	\N	\N	\N
117800	6	Tarefa 3 nivel 1	\N	proxecto-00020-00001	2010-02-22 00:00:00	2010-03-01 12:00:00	3	117799	\N	proxecto-00019-00008	0
117802	6	fillo1	\N	proxecto-00020-00003	\N	\N	0	117800	\N	proxecto-00019-00009	1
90608	10	Pedido proba virtual pintor	Desc	proxecto-00017	2010-02-16 12:55:16.462	2010-03-16 00:00:00	3	\N	\N	\N	\N
57237	9	Imprimir información pantalla do planificador	\N	proxecto-00008-00050	\N	\N	0	57235	\N	\N	1
57238	9	Módulo de arquitectura tecnolóxica	\N	proxecto-00008-00012	\N	\N	3	57193	\N	\N	11
57239	9	Desenvolvemento de paquetes debian	\N	proxecto-00008-00051	\N	\N	0	57238	\N	\N	0
57240	9	Enlazar a axuda de usuario	\N	proxecto-00008-00052	\N	\N	0	57238	\N	\N	1
6815	32	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	3	6275	\N	\N	7
6678	33	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	0	6815	\N	\N	0
6816	32	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	0	6815	\N	\N	1
6817	32	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	0	6815	\N	\N	2
6818	32	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	3	6275	\N	\N	8
6819	32	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	0	6818	\N	\N	0
6820	32	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	0	6818	\N	\N	1
6821	32	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	0	6818	\N	\N	2
6822	32	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	0	6818	\N	\N	3
6823	32	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	0	6818	\N	\N	4
6824	32	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	0	6818	\N	\N	5
6825	32	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	3	6275	\N	\N	9
6826	32	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	0	6825	\N	\N	0
57241	9	Módulo de Documentación da API	\N	proxecto-00008-00013	\N	\N	3	57193	\N	\N	12
6827	32	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	0	6825	\N	\N	1
57242	9	Documentación das APIs públicas	\N	proxecto-00008-00053	\N	\N	0	57241	\N	\N	0
57243	9	Módulo de arquivo histórico	\N	proxecto-00008-00014	\N	\N	3	57193	\N	\N	13
57244	9	Pasar pedidos a histórico	\N	proxecto-00008-00054	\N	\N	0	57243	\N	\N	0
57245	9	Módulo de extracción de informes	\N	proxecto-00008-00015	\N	\N	3	57193	\N	\N	14
57246	9	Integración de JasperRports	\N	proxecto-00008-00055	\N	\N	0	57245	\N	\N	0
57247	9	Informes sobre organizacións de traballo	\N	proxecto-00008-00056	\N	\N	0	57245	\N	\N	1
57248	9	Informes sobre partes de traballo	\N	proxecto-00008-00057	\N	\N	0	57245	\N	\N	2
57249	9	Informes de horas traballadas por un traballador	\N	proxecto-00008-00058	\N	\N	0	57245	\N	\N	3
122372	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00021-00061	\N	\N	0	122365	\N	\N	6
122373	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00021-00062	\N	\N	0	122365	\N	\N	7
122374	3	Informes de traballador indicando custos por hora	\N	proxecto-00021-00063	\N	\N	0	122365	\N	\N	8
122375	3	Coordinación	\N	proxecto-00021-00016	\N	\N	0	122313	\N	\N	15
122376	3	Análise	\N	proxecto-00021-00017	\N	\N	0	122313	\N	\N	16
140034	19	CU – Listar recintos	\N	proxecto-00023-00047	\N	\N	0	140033	\N	\N	0
90611	8	Tarefa filla 1.2	\N	proxecto-00017-00004	\N	\N	0	90609	\N	\N	1
90612	8	Tarefa raíz 2	\N	proxecto-00017-00002	\N	\N	3	90608	\N	\N	1
90613	8	Tarefa filla 2.1	\N	proxecto-00017-00005	\N	\N	0	90612	\N	\N	0
86192	3	Documentación das APIs públicas	\N	proxecto-00010-00053	\N	\N	0	86191	\N	\N	0
86193	3	Módulo de arquivo histórico	\N	proxecto-00010-00014	\N	\N	3	85840	\N	\N	13
86194	3	Pasar pedidos a histórico	\N	proxecto-00010-00054	\N	\N	0	86193	\N	\N	0
86195	3	Módulo de extracción de informes	\N	proxecto-00010-00015	\N	\N	3	85840	\N	\N	14
86196	3	Integración de JasperRports	\N	proxecto-00010-00055	\N	\N	0	86195	\N	\N	0
86197	3	Informes sobre organizacións de traballo	\N	proxecto-00010-00056	\N	\N	0	86195	\N	\N	1
86198	3	Informes sobre partes de traballo	\N	proxecto-00010-00057	\N	\N	0	86195	\N	\N	2
86199	3	Informes de horas traballadas por un traballador	\N	proxecto-00010-00058	\N	\N	0	86195	\N	\N	3
86200	3	Lista de avances de planificación da empresa	\N	proxecto-00010-00059	\N	\N	0	86195	\N	\N	4
86201	3	Lista de avances de traballo da empresa	\N	proxecto-00010-00060	\N	\N	0	86195	\N	\N	5
86202	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00010-00061	\N	\N	0	86195	\N	\N	6
86203	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00010-00062	\N	\N	0	86195	\N	\N	7
86204	3	Informes de traballador indicando custos por hora	\N	proxecto-00010-00063	\N	\N	0	86195	\N	\N	8
86206	3	Análise	\N	proxecto-00010-00017	\N	\N	0	85840	\N	\N	16
90614	8	Tarefa filla 2.2	\N	proxecto-00017-00006	\N	\N	0	90612	\N	\N	1
7072	31	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	3	6275	\N	\N	10
7073	31	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	0	7072	\N	\N	0
7074	31	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	0	7072	\N	\N	1
7075	31	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	3	6275	\N	\N	11
7076	31	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	0	7075	\N	\N	0
7077	31	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	0	7075	\N	\N	1
7078	31	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	3	6275	\N	\N	12
7079	31	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	0	7078	\N	\N	0
7081	31	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	3	6275	\N	\N	13
7082	31	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	0	7081	\N	\N	0
7084	31	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	0	7115	\N	\N	2
7080	31	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	0	7115	\N	\N	3
7123	30	Coordinación	\N	proxecto-00006-00063	\N	\N	0	6275	\N	\N	15
7124	30	Análise	\N	proxecto-00006-00064	\N	\N	0	6275	\N	\N	16
117803	6	fillo2	\N	proxecto-00020-00004	\N	\N	0	117800	\N	proxecto-00019-00007	0
117804	6	Tarefa Subnivel 3	\N	proxecto-00020-00005	\N	\N	1	117803	\N	\N	0
122331	3	Módulo de asignación de recursos	\N	proxecto-00021-00005	\N	\N	3	122313	\N	\N	4
122332	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00021-00031	\N	\N	0	122331	\N	\N	0
122333	3	Asignación avanzada asignación automática configuración	\N	proxecto-00021-00032	\N	\N	0	122331	\N	\N	1
122334	3	Módulo de partes de traballo	\N	proxecto-00021-00006	\N	\N	3	122313	\N	\N	5
122337	3	Informe de necesidades de materiais	\N	proxecto-00021-00034	\N	\N	0	122336	\N	\N	0
122338	3	Módulo de xestión da calidade	\N	proxecto-00021-00008	\N	\N	3	122313	\N	\N	7
122339	3	Administración de check-lists	\N	proxecto-00021-00035	\N	\N	0	122338	\N	\N	0
122340	3	Cubrir formularios de calidade en planificación	\N	proxecto-00021-00036	\N	\N	0	122338	\N	\N	1
122341	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00021-00037	\N	\N	0	122338	\N	\N	2
122342	3	Módulo de integración con subcontratas	\N	proxecto-00021-00009	\N	\N	3	122313	\N	\N	8
90609	8	Tarefa raíz 1	\N	proxecto-00017-00001	\N	\N	3	90608	\N	\N	0
90610	8	Tarefa filla 1.1	\N	proxecto-00017-00003	\N	\N	0	90609	\N	\N	0
122351	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00021-00045	\N	\N	0	122349	\N	\N	1
122352	3	Formato de intercambio de información de avance	\N	proxecto-00021-00046	\N	\N	0	122349	\N	\N	2
122353	3	Formato de intercambio de recursos	\N	proxecto-00021-00047	\N	\N	0	122349	\N	\N	3
6830	32	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	0	6825	\N	\N	4
7115	30	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	3	6275	\N	\N	14
7116	30	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	0	7115	\N	\N	0
7117	30	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	0	7115	\N	\N	1
7118	30	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	0	7115	\N	\N	4
7119	30	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	0	7115	\N	\N	5
7120	30	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	0	7115	\N	\N	6
7121	30	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	0	7115	\N	\N	7
7122	30	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	0	7115	\N	\N	8
57193	10	4º release Navalplan - 2	Desc.	proxecto-00008	2010-02-12 18:21:59.723	2010-04-18 00:00:00	3	\N	56587	\N	\N
57194	9	Módulo de xestión de usuarios	\N	proxecto-00008-00001	\N	\N	3	57193	\N	\N	0
57195	9	Xestión de usuarios	\N	proxecto-00008-00018	\N	\N	0	57194	\N	\N	0
57196	9	Xestión de roles	\N	proxecto-00008-00019	\N	\N	0	57194	\N	\N	1
85525	3	Técnica de recálculo de asignacións	\N	proxecto-00009-00028	\N	\N	0	85523	\N	\N	1
85526	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00009-00029	\N	\N	0	85523	\N	\N	2
85527	3	Modelos de pedidos e planificación	\N	proxecto-00009-00030	\N	\N	0	85523	\N	\N	3
85528	3	Módulo de asignación de recursos	\N	proxecto-00009-00005	\N	\N	3	85510	\N	\N	4
85529	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00009-00031	\N	\N	0	85528	\N	\N	0
85530	3	Asignación avanzada asignación automática configuración	\N	proxecto-00009-00032	\N	\N	0	85528	\N	\N	1
85531	3	Módulo de partes de traballo	\N	proxecto-00009-00006	\N	\N	3	85510	\N	\N	5
85532	3	Procura de partes de traballo	\N	proxecto-00009-00033	\N	\N	0	85531	\N	\N	0
85533	3	Módulo de materiais	\N	proxecto-00009-00007	\N	\N	3	85510	\N	\N	6
85534	3	Informe de necesidades de materiais	\N	proxecto-00009-00034	\N	\N	0	85533	\N	\N	0
85535	3	Módulo de xestión da calidade	\N	proxecto-00009-00008	\N	\N	3	85510	\N	\N	7
85536	3	Administración de check-lists	\N	proxecto-00009-00035	\N	\N	0	85535	\N	\N	0
85537	3	Cubrir formularios de calidade en planificación	\N	proxecto-00009-00036	\N	\N	0	85535	\N	\N	1
85538	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00009-00037	\N	\N	0	85535	\N	\N	2
85539	3	Módulo de integración con subcontratas	\N	proxecto-00009-00009	\N	\N	3	85510	\N	\N	8
85540	3	Administración das subcontratas	\N	proxecto-00009-00038	\N	\N	0	85539	\N	\N	0
85541	3	Formato de intercambio	\N	proxecto-00009-00039	\N	\N	0	85539	\N	\N	1
85542	3	Fluxo de importación/exportación	\N	proxecto-00009-00040	\N	\N	0	85539	\N	\N	2
85543	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00009-00041	\N	\N	0	85539	\N	\N	3
85544	3	Convertir en fitos as subcontratacións	\N	proxecto-00009-00042	\N	\N	0	85539	\N	\N	4
85545	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00009-00043	\N	\N	0	85539	\N	\N	5
85546	3	Módulo de importación exportación	\N	proxecto-00009-00010	\N	\N	3	85510	\N	\N	9
85749	3	Definir workflow de pedidos para ERP	\N	proxecto-00009-00044	\N	\N	0	85546	\N	\N	0
85750	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00009-00045	\N	\N	0	85546	\N	\N	1
85751	3	Formato de intercambio de información de avance	\N	proxecto-00009-00046	\N	\N	0	85546	\N	\N	2
85752	3	Formato de intercambio de recursos	\N	proxecto-00009-00047	\N	\N	0	85546	\N	\N	3
85753	3	Formato de intercambio de materiais	\N	proxecto-00009-00048	\N	\N	0	85546	\N	\N	4
85754	3	Módulo de presentación	\N	proxecto-00009-00011	\N	\N	3	85510	\N	\N	10
85755	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00009-00049	\N	\N	0	85754	\N	\N	0
85756	3	Imprimir información pantalla do planificador	\N	proxecto-00009-00050	\N	\N	0	85754	\N	\N	1
85757	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00009-00012	\N	\N	3	85510	\N	\N	11
85758	3	Desenvolvemento de paquetes debian	\N	proxecto-00009-00051	\N	\N	0	85757	\N	\N	0
85759	3	Enlazar a axuda de usuario	\N	proxecto-00009-00052	\N	\N	0	85757	\N	\N	1
85760	3	Módulo de Documentación da API	\N	proxecto-00009-00013	\N	\N	3	85510	\N	\N	12
140040	19	CU – Mostrado de calendario mensual de eventos	\N	proxecto-00023-00053	\N	\N	0	140033	\N	\N	6
140041	19	Plugin de búsqueda simple de eventos	\N	proxecto-00023-00054	\N	\N	0	140033	\N	\N	7
140042	19	Plugin de búsqueda avanzada de eventos	\N	proxecto-00023-00055	\N	\N	0	140033	\N	\N	8
57197	9	Xestión de perfiles	\N	proxecto-00008-00020	\N	\N	0	57194	\N	\N	2
57198	9	Xestión de roles e pedidos	\N	proxecto-00008-00021	\N	\N	0	57194	\N	\N	3
57199	9	Módulo de organizacións de traballo	\N	proxecto-00008-00002	\N	\N	3	57193	\N	\N	1
57200	9	Xestión de código único	\N	proxecto-00008-00022	\N	\N	0	57199	\N	\N	0
57201	9	Revisión de formulario de pedidos	\N	proxecto-00008-00023	\N	\N	0	57199	\N	\N	1
57202	9	Filtrado no listado de pedidos	\N	proxecto-00008-00024	\N	\N	0	57199	\N	\N	2
57203	9	Módulo de xestión de usuarios	\N	proxecto-00008-00003	\N	\N	3	57193	\N	\N	2
57204	9	Recursos Virtuais	\N	proxecto-00008-00025	\N	\N	0	57203	\N	\N	0
57205	9	Recursos Virtuais (Continuación)	\N	proxecto-00008-00026	\N	\N	0	57203	\N	\N	1
57206	9	Módulo de planificación	\N	proxecto-00008-00004	\N	\N	3	57193	\N	\N	3
57207	9	Compartir estado pestañas planificación	\N	proxecto-00008-00027	\N	\N	0	57206	\N	\N	0
57208	9	Técnica de recálculo de asignacións	\N	proxecto-00008-00028	\N	\N	0	57206	\N	\N	1
57209	9	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00008-00029	\N	\N	0	57206	\N	\N	2
140043	19	Pruebas y resolución de errores	\N	proxecto-00023-00056	\N	\N	0	140033	\N	\N	9
140033	19	Módulo de eventos y recintos	\N	proxecto-00023-00046	\N	\N	3	139987	\N	\N	3
140035	19	CU – Listado de eventos por filtrado de categoría, tema, localidad, nombre del evento, recinto y/o fecha	\N	proxecto-00023-00048	\N	\N	0	140033	\N	\N	1
140036	19	CU – Listar temas de eventos	\N	proxecto-00023-00049	\N	\N	0	140033	\N	\N	2
140037	19	CU – Listar eventos por recintos	\N	proxecto-00023-00050	\N	\N	0	140033	\N	\N	3
140038	19	CU – Visualizar datos de evento	\N	proxecto-00023-00051	\N	\N	0	140033	\N	\N	4
140039	19	CU – Visualizar más información de evento	\N	proxecto-00023-00052	\N	\N	0	140033	\N	\N	5
85761	3	Documentación das APIs públicas	\N	proxecto-00009-00053	\N	\N	0	85760	\N	\N	0
85762	3	Módulo de arquivo histórico	\N	proxecto-00009-00014	\N	\N	3	85510	\N	\N	13
85763	3	Pasar pedidos a histórico	\N	proxecto-00009-00054	\N	\N	0	85762	\N	\N	0
85764	3	Módulo de extracción de informes	\N	proxecto-00009-00015	\N	\N	3	85510	\N	\N	14
85765	3	Integración de JasperRports	\N	proxecto-00009-00055	\N	\N	0	85764	\N	\N	0
85766	3	Informes sobre organizacións de traballo	\N	proxecto-00009-00056	\N	\N	0	85764	\N	\N	1
85767	3	Informes sobre partes de traballo	\N	proxecto-00009-00057	\N	\N	0	85764	\N	\N	2
85768	3	Informes de horas traballadas por un traballador	\N	proxecto-00009-00058	\N	\N	0	85764	\N	\N	3
85769	3	Lista de avances de planificación da empresa	\N	proxecto-00009-00059	\N	\N	0	85764	\N	\N	4
85770	3	Lista de avances de traballo da empresa	\N	proxecto-00009-00060	\N	\N	0	85764	\N	\N	5
85771	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00009-00061	\N	\N	0	85764	\N	\N	6
85772	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00009-00062	\N	\N	0	85764	\N	\N	7
85773	3	Informes de traballador indicando custos por hora	\N	proxecto-00009-00063	\N	\N	0	85764	\N	\N	8
85774	3	Coordinación	\N	proxecto-00009-00016	\N	\N	0	85510	\N	\N	15
85775	3	Análise	\N	proxecto-00009-00017	\N	\N	0	85510	\N	\N	16
105040	10	Desc	\N	proxecto-00018	2010-02-12 18:21:59.723	\N	3	\N	\N	\N	\N
105041	9	Filla2	\N	proxecto-00018-00001	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	0	105042	\N	\N	0
140044	18	Módulo de interpretación de aforos	\N	proxecto-00023-00057	\N	\N	0	139987	\N	\N	4
140045	18	Diseño manual de cada recinto para mostrado en selección de localización	\N	proxecto-00023-00058	\N	\N	1	140044	\N	\N	0
140046	18	Soporte de resaltado y selección de zona de recinto para elección de entradas.	\N	proxecto-00023-00059	\N	\N	1	140044	\N	\N	1
140047	18	Diseño manual de cada zona de los recintos para asientos	\N	proxecto-00023-00060	\N	\N	1	140044	\N	\N	2
140048	18	Composición gŕafica de los asientos y cada zona	\N	proxecto-00023-00061	\N	\N	1	140044	\N	\N	3
140049	18	Soporte de selección gráfica de asientos 	\N	proxecto-00023-00062	\N	\N	1	140044	\N	\N	4
140050	18	Pruebas y resolución de errores	\N	proxecto-00023-00063	\N	\N	1	140044	\N	\N	5
85519	3	Filtrado no listado de pedidos	\N	proxecto-00009-00024	\N	\N	0	85516	\N	\N	2
85520	3	Módulo de xestión de usuarios	\N	proxecto-00009-00003	\N	\N	3	85510	\N	\N	2
85521	3	Recursos Virtuais	\N	proxecto-00009-00025	\N	\N	0	85520	\N	\N	0
85522	3	Recursos Virtuais (Continuación)	\N	proxecto-00009-00026	\N	\N	0	85520	\N	\N	1
85523	3	Módulo de planificación	\N	proxecto-00009-00004	\N	\N	3	85510	\N	\N	3
85524	3	Compartir estado pestañas planificación	\N	proxecto-00009-00027	\N	\N	0	85523	\N	\N	0
105042	9	Análise	\N	proxecto-00018-00002	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	3	105040	\N	proxecto-00008-00017	0
105043	9	Filla1	\N	proxecto-00018-00003	\N	\N	0	105042	\N	\N	1
105044	9	Filla3	\N	proxecto-00018-00004	\N	\N	0	105042	\N	\N	2
86208	12	Subcontratación da coordinación	\N	proxecto-00013	2010-04-21 00:00:00	2010-05-05 00:00:00	3	\N	\N	\N	\N
140051	17	Módulo de arquitectura de la información e implantación del diseño	\N	proxecto-00023-00064	\N	\N	0	139987	\N	\N	5
140052	17	Plugin de noticias OBS	\N	proxecto-00023-00065	\N	\N	1	140051	\N	\N	0
140053	17	Plugin de destacados	\N	proxecto-00023-00066	\N	\N	1	140051	\N	\N	1
140054	17	Plugin de gestión de banners	\N	proxecto-00023-00067	\N	\N	1	140051	\N	\N	2
140055	17	Plugin de destacados central	\N	proxecto-00023-00068	\N	\N	1	140051	\N	\N	3
140056	17	Adaptación del diseño a la portada	\N	proxecto-00023-00069	\N	\N	1	140051	\N	\N	4
140057	17	Adaptación del diseño al layout general	\N	proxecto-00023-00070	\N	\N	1	140051	\N	\N	5
140058	17	Soporte de múltiples idiomas en frontend y parametrización	\N	proxecto-00023-00071	\N	\N	1	140051	\N	\N	6
140059	17	Comunicación con Google para traducción automática	\N	proxecto-00023-00072	\N	\N	1	140051	\N	\N	7
140060	17	Almacenamiento de traducción interna en contenidos	\N	proxecto-00023-00073	\N	\N	1	140051	\N	\N	8
140061	17	Migas de pan	\N	proxecto-00023-00074	\N	\N	1	140051	\N	\N	9
140062	17	Plugin de búsqueda con recomendaciones	\N	proxecto-00023-00075	\N	\N	1	140051	\N	\N	10
140063	17	Creación de páginas de contenidos básicas	\N	proxecto-00023-00076	\N	\N	1	140051	\N	\N	11
140064	17	Ayuda al usuario	\N	proxecto-00023-00077	\N	\N	1	140051	\N	\N	12
86214	11	Análise	\N	proxecto-00013-00002	2010-04-21 00:00:00	2010-05-01 16:00:00	3	86208	\N	proxecto-00009-00017	0
140065	17	Menús de navegación	\N	proxecto-00023-00078	\N	\N	1	140051	\N	\N	13
57210	9	Modelos de pedidos e planificación	\N	proxecto-00008-00030	\N	\N	0	57206	\N	\N	3
57211	9	Módulo de asignación de recursos	\N	proxecto-00008-00005	\N	\N	3	57193	\N	\N	4
57212	9	Interpolación polinómica na asignación avanzada	\N	proxecto-00008-00031	\N	\N	0	57211	\N	\N	0
57213	9	Asignación avanzada asignación automática configuración	\N	proxecto-00008-00032	\N	\N	0	57211	\N	\N	1
86215	11	Planificación	\N	proxecto-00013-00003	\N	\N	0	86214	\N	\N	0
86216	11	Seguimiento	\N	proxecto-00013-00004	\N	2010-04-28 00:00:00	0	86214	\N	\N	1
86217	11	Control de calidad	\N	proxecto-00013-00005	\N	\N	0	86214	\N	\N	2
57214	9	Módulo de partes de traballo	\N	proxecto-00008-00006	\N	\N	3	57193	\N	\N	5
57215	9	Procura de partes de traballo	\N	proxecto-00008-00033	\N	\N	0	57214	\N	\N	0
57224	9	Formato de intercambio	\N	proxecto-00008-00039	\N	\N	0	57222	\N	\N	1
57225	9	Fluxo de importación/exportación	\N	proxecto-00008-00040	\N	\N	0	57222	\N	\N	2
57226	9	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00008-00041	\N	\N	0	57222	\N	\N	3
57227	9	Convertir en fitos as subcontratacións	\N	proxecto-00008-00042	\N	\N	0	57222	\N	\N	4
57228	9	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00008-00043	\N	\N	0	57222	\N	\N	5
57229	9	Módulo de importación exportación	\N	proxecto-00008-00010	\N	\N	3	57193	\N	\N	9
57230	9	Definir workflow de pedidos para ERP	\N	proxecto-00008-00044	\N	\N	0	57229	\N	\N	0
57231	9	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00008-00045	\N	\N	0	57229	\N	\N	1
57232	9	Formato de intercambio de información de avance	\N	proxecto-00008-00046	\N	\N	0	57229	\N	\N	2
57233	9	Formato de intercambio de recursos	\N	proxecto-00008-00047	\N	\N	0	57229	\N	\N	3
57234	9	Formato de intercambio de materiais	\N	proxecto-00008-00048	\N	\N	0	57229	\N	\N	4
57235	9	Módulo de presentación	\N	proxecto-00008-00011	\N	\N	3	57193	\N	\N	10
57236	9	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00008-00049	\N	\N	0	57235	\N	\N	0
122313	3	Pedido exemplo modelo presentacionr	Desc.	proxecto-00021	2010-09-01 00:00:00	2010-10-28 00:00:00	3	\N	56587	\N	\N
122314	3	Módulo de xestión de usuarios	\N	proxecto-00021-00001	\N	\N	3	122313	\N	\N	0
122315	3	Xestión de usuarios	\N	proxecto-00021-00018	\N	\N	0	122314	\N	\N	0
122316	3	Xestión de roles	\N	proxecto-00021-00019	\N	\N	0	122314	\N	\N	1
122317	3	Xestión de perfiles	\N	proxecto-00021-00020	\N	\N	0	122314	\N	\N	2
122318	3	Xestión de roles e pedidos	\N	proxecto-00021-00021	\N	\N	0	122314	\N	\N	3
122319	3	Módulo de organizacións de traballo	\N	proxecto-00021-00002	\N	\N	3	122313	\N	\N	1
122320	3	Xestión de código único	\N	proxecto-00021-00022	\N	\N	0	122319	\N	\N	0
122335	3	Procura de partes de traballo	\N	proxecto-00021-00033	\N	\N	0	122334	\N	\N	0
122360	3	Enlazar a axuda de usuario	\N	proxecto-00021-00052	\N	\N	0	122358	\N	\N	1
122361	3	Módulo de Documentación da API	\N	proxecto-00021-00013	\N	\N	3	122313	\N	\N	12
122362	3	Documentación das APIs públicas	\N	proxecto-00021-00053	\N	\N	0	122361	\N	\N	0
122363	3	Módulo de arquivo histórico	\N	proxecto-00021-00014	\N	\N	3	122313	\N	\N	13
122364	3	Pasar pedidos a histórico	\N	proxecto-00021-00054	\N	\N	0	122363	\N	\N	0
122365	3	Módulo de extracción de informes	\N	proxecto-00021-00015	\N	\N	3	122313	\N	\N	14
122366	3	Integración de JasperRports	\N	proxecto-00021-00055	\N	\N	0	122365	\N	\N	0
122367	3	Informes sobre organizacións de traballo	\N	proxecto-00021-00056	\N	\N	0	122365	\N	\N	1
85840	3	4º release Navalplan - 4	Desc.	proxecto-00010	2010-05-26 00:00:00	2010-07-21 00:00:00	3	\N	56587	\N	\N
85841	3	Módulo de xestión de usuarios	\N	proxecto-00010-00001	\N	\N	3	85840	\N	\N	0
85842	3	Xestión de usuarios	\N	proxecto-00010-00018	\N	\N	0	85841	\N	\N	0
85843	3	Xestión de roles	\N	proxecto-00010-00019	\N	\N	0	85841	\N	\N	1
85844	3	Xestión de perfiles	\N	proxecto-00010-00020	\N	\N	0	85841	\N	\N	2
85845	3	Xestión de roles e pedidos	\N	proxecto-00010-00021	\N	\N	0	85841	\N	\N	3
85846	3	Módulo de organizacións de traballo	\N	proxecto-00010-00002	\N	\N	3	85840	\N	\N	1
85847	3	Xestión de código único	\N	proxecto-00010-00022	\N	\N	0	85846	\N	\N	0
85848	3	Revisión de formulario de pedidos	\N	proxecto-00010-00023	\N	\N	0	85846	\N	\N	1
85849	3	Filtrado no listado de pedidos	\N	proxecto-00010-00024	\N	\N	0	85846	\N	\N	2
86153	3	Módulo de xestión de usuarios	\N	proxecto-00010-00003	\N	\N	3	85840	\N	\N	2
86154	3	Recursos Virtuais	\N	proxecto-00010-00025	\N	\N	0	86153	\N	\N	0
86155	3	Recursos Virtuais (Continuación)	\N	proxecto-00010-00026	\N	\N	0	86153	\N	\N	1
86156	3	Módulo de planificación	\N	proxecto-00010-00004	\N	\N	3	85840	\N	\N	3
86157	3	Compartir estado pestañas planificación	\N	proxecto-00010-00027	\N	\N	0	86156	\N	\N	0
86158	3	Técnica de recálculo de asignacións	\N	proxecto-00010-00028	\N	\N	0	86156	\N	\N	1
86159	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00010-00029	\N	\N	0	86156	\N	\N	2
86160	3	Modelos de pedidos e planificación	\N	proxecto-00010-00030	\N	\N	0	86156	\N	\N	3
86161	3	Módulo de asignación de recursos	\N	proxecto-00010-00005	\N	\N	3	85840	\N	\N	4
86162	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00010-00031	\N	\N	0	86161	\N	\N	0
86163	3	Asignación avanzada asignación automática configuración	\N	proxecto-00010-00032	\N	\N	0	86161	\N	\N	1
86164	3	Módulo de partes de traballo	\N	proxecto-00010-00006	\N	\N	3	85840	\N	\N	5
86165	3	Procura de partes de traballo	\N	proxecto-00010-00033	\N	\N	0	86164	\N	\N	0
86166	3	Módulo de materiais	\N	proxecto-00010-00007	\N	\N	3	85840	\N	\N	6
86167	3	Informe de necesidades de materiais	\N	proxecto-00010-00034	\N	\N	0	86166	\N	\N	0
86168	3	Módulo de xestión da calidade	\N	proxecto-00010-00008	\N	\N	3	85840	\N	\N	7
86169	3	Administración de check-lists	\N	proxecto-00010-00035	\N	\N	0	86168	\N	\N	0
6300	37	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	3	6275	\N	\N	0
6301	37	Xestión de usuarios	\N	proxecto-00006-00003	\N	2009-12-15 00:00:00	0	6300	\N	\N	0
6303	37	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	0	6300	\N	\N	2
6304	37	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	0	6300	\N	\N	3
6305	37	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	3	6275	\N	\N	1
6306	37	Xestión de código único	\N	proxecto-00006-00007	\N	\N	0	6305	\N	\N	0
6307	37	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	0	6305	\N	\N	1
6339	35	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	3	6275	\N	\N	3
6340	35	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	0	6339	\N	\N	0
6341	35	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	0	6339	\N	\N	1
6828	32	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	0	6825	\N	\N	2
90597	3	Subcontrata de integración de informes	\N	proxecto-00015	2010-04-21 00:00:00	\N	4	\N	\N	\N	\N
57250	9	Lista de avances de planificación da empresa	\N	proxecto-00008-00059	\N	\N	0	57245	\N	\N	4
6829	32	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	0	6825	\N	\N	3
57251	9	Lista de avances de traballo da empresa	\N	proxecto-00008-00060	\N	\N	0	57245	\N	\N	5
117787	15	pedido exemplo	DEsc.	proxecto-00019	2010-02-22 00:00:00	2010-03-22 00:00:00	3	\N	\N	\N	\N
117788	12	Tarefa nivel 1	\N	proxecto-00019-00001	\N	\N	3	117787	\N	\N	0
117789	12	Subtarefa 1 nivel 2	\N	proxecto-00019-00003	\N	\N	0	117788	\N	\N	0
57252	9	Informes de horas estimadas/horas realizadas	\N	proxecto-00008-00061	\N	\N	0	57245	\N	\N	6
57253	9	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00008-00062	\N	\N	0	57245	\N	\N	7
57254	9	Informes de traballador indicando custos por hora	\N	proxecto-00008-00063	\N	\N	0	57245	\N	\N	8
57255	9	Coordinación	\N	proxecto-00008-00016	\N	\N	0	57193	\N	\N	15
117790	12	Subtarefa 2 nivel 2	\N	proxecto-00019-00004	\N	\N	0	117788	\N	\N	1
117791	12	Tarefa nivel 1 - 2	\N	proxecto-00019-00002	\N	\N	3	117787	\N	\N	1
57256	10	Análise	\N	proxecto-00008-00017	\N	\N	0	57193	\N	\N	16
122321	3	Revisión de formulario de pedidos	\N	proxecto-00021-00023	\N	\N	0	122319	\N	\N	1
122322	3	Filtrado no listado de pedidos	\N	proxecto-00021-00024	\N	\N	0	122319	\N	\N	2
122323	3	Módulo de xestión de usuarios	\N	proxecto-00021-00003	\N	\N	3	122313	\N	\N	2
122324	3	Recursos Virtuais	\N	proxecto-00021-00025	\N	\N	0	122323	\N	\N	0
122325	3	Recursos Virtuais (Continuación)	\N	proxecto-00021-00026	\N	\N	0	122323	\N	\N	1
122326	3	Módulo de planificación	\N	proxecto-00021-00004	\N	\N	3	122313	\N	\N	3
90599	2	Integración de JasperRports	\N	proxecto-00015-00003	2010-04-21 00:00:00	2010-04-21 16:00:00	4	90597	\N	\N	0
90600	2	Caso 1	\N	proxecto-00015-00004	\N	\N	4	90599	\N	\N	0
86170	3	Cubrir formularios de calidade en planificación	\N	proxecto-00010-00036	\N	\N	0	86168	\N	\N	1
86171	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00010-00037	\N	\N	0	86168	\N	\N	2
86172	3	Módulo de integración con subcontratas	\N	proxecto-00010-00009	\N	\N	3	85840	\N	\N	8
86173	3	Administración das subcontratas	\N	proxecto-00010-00038	\N	\N	0	86172	\N	\N	0
86174	3	Formato de intercambio	\N	proxecto-00010-00039	\N	\N	0	86172	\N	\N	1
86175	3	Fluxo de importación/exportación	\N	proxecto-00010-00040	\N	\N	0	86172	\N	\N	2
86176	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00010-00041	\N	\N	0	86172	\N	\N	3
86177	3	Convertir en fitos as subcontratacións	\N	proxecto-00010-00042	\N	\N	0	86172	\N	\N	4
86178	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00010-00043	\N	\N	0	86172	\N	\N	5
86179	3	Módulo de importación exportación	\N	proxecto-00010-00010	\N	\N	3	85840	\N	\N	9
86180	3	Definir workflow de pedidos para ERP	\N	proxecto-00010-00044	\N	\N	0	86179	\N	\N	0
86181	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00010-00045	\N	\N	0	86179	\N	\N	1
86182	3	Formato de intercambio de información de avance	\N	proxecto-00010-00046	\N	\N	0	86179	\N	\N	2
86183	3	Formato de intercambio de recursos	\N	proxecto-00010-00047	\N	\N	0	86179	\N	\N	3
86184	3	Formato de intercambio de materiais	\N	proxecto-00010-00048	\N	\N	0	86179	\N	\N	4
86185	3	Módulo de presentación	\N	proxecto-00010-00011	\N	\N	3	85840	\N	\N	10
86186	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00010-00049	\N	\N	0	86185	\N	\N	0
86187	3	Imprimir información pantalla do planificador	\N	proxecto-00010-00050	\N	\N	0	86185	\N	\N	1
86188	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00010-00012	\N	\N	3	85840	\N	\N	11
86189	3	Desenvolvemento de paquetes debian	\N	proxecto-00010-00051	\N	\N	0	86188	\N	\N	0
86190	3	Enlazar a axuda de usuario	\N	proxecto-00010-00052	\N	\N	0	86188	\N	\N	1
86191	3	Módulo de Documentación da API	\N	proxecto-00010-00013	\N	\N	3	85840	\N	\N	12
86205	3	Coordinación	\N	proxecto-00010-00016	\N	\N	0	85840	\N	\N	15
90601	2	Caso 2	\N	proxecto-00015-00005	\N	\N	4	90599	\N	\N	1
90602	2	Caso 3	\N	proxecto-00015-00006	\N	\N	4	90599	\N	\N	2
122327	3	Compartir estado pestañas planificación	\N	proxecto-00021-00027	\N	\N	0	122326	\N	\N	0
122328	3	Técnica de recálculo de asignacións	\N	proxecto-00021-00028	\N	\N	0	122326	\N	\N	1
122329	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00021-00029	\N	\N	0	122326	\N	\N	2
122330	3	Modelos de pedidos e planificación	\N	proxecto-00021-00030	\N	\N	0	122326	\N	\N	3
139987	28	Desarrollo de una aplicación en software libre de venta de entradas online	\N	proxecto-00023	2010-06-10 00:00:00	2010-12-19 00:00:00	3	\N	\N	\N	\N
135455	2	Pedido Exemplo	\N	proxecto-00022	2010-02-25 13:04:40.623	\N	3	\N	\N	\N	\N
135456	2	Tarefa 1	\N	proxecto-00022-00001	\N	\N	0	135455	\N	\N	0
117792	12	Subtarefa nivel 2 2.1	\N	proxecto-00019-00005	\N	\N	0	117791	\N	\N	0
117793	12	Subtarefa nivel 2 2.2	\N	proxecto-00019-00006	\N	\N	0	117791	\N	\N	1
122336	3	Módulo de materiais	\N	proxecto-00021-00007	\N	\N	3	122313	\N	\N	6
140066	16	Infraestructura del proyecto	\N	proxecto-00023-00079	\N	\N	0	139987	\N	\N	6
135457	2	Tarefa 2	\N	proxecto-00022-00002	\N	\N	0	135455	\N	\N	1
135458	2	Tarefa 3 	\N	proxecto-00022-00003	\N	\N	0	135455	\N	\N	2
135459	2	Tarefa 4	\N	proxecto-00022-00004	\N	\N	0	135455	\N	\N	3
135460	2	Tarefa 5	\N	proxecto-00022-00005	\N	\N	0	135455	\N	\N	4
140067	16	Instalación y configuración entornos de desarrollo e integración	\N	proxecto-00023-00080	\N	\N	1	140066	\N	\N	0
139998	23	Módulo de gestión de usuarios	\N	proxecto-00023-00011	\N	\N	3	139987	\N	\N	0
140068	16	Gestión de líneas base	\N	proxecto-00023-00081	\N	\N	1	140066	\N	\N	1
140069	16	Instalación y configuración de módulos básicos del sistema	\N	proxecto-00023-00082	\N	\N	1	140066	\N	\N	2
140070	16	Subidas a preproducción	\N	proxecto-00023-00083	\N	\N	1	140066	\N	\N	3
140071	16	Subidas a producción	\N	proxecto-00023-00084	\N	\N	1	140066	\N	\N	4
139995	24	Diseño	\N	proxecto-00023-00008	\N	\N	0	139987	\N	\N	7
139996	24	Pruebas de integración	\N	proxecto-00023-00009	\N	\N	0	139987	\N	\N	8
139997	24	Documentación	\N	proxecto-00023-00010	\N	\N	0	139987	\N	\N	9
140074	13	Coordinación	\N	proxecto-00023-00085	\N	\N	0	139987	\N	\N	10
140075	13	Análise	\N	proxecto-00023-00086	\N	\N	0	139987	\N	\N	11
139999	23	CU – Formulario de compra como invitado	\N	proxecto-00023-00013	\N	\N	0	139998	\N	\N	0
140000	23	CU – Registrarse como usuario del sistema	\N	proxecto-00023-00014	\N	\N	0	139998	\N	\N	1
140001	23	CU – Acceder al sistema	\N	proxecto-00023-00015	\N	\N	0	139998	\N	\N	2
140002	23	CU – Visualizar datos históricos de compras	\N	proxecto-00023-00016	\N	\N	0	139998	\N	\N	3
140003	23	CU – Administración de datos personales del usuario	\N	proxecto-00023-00017	\N	\N	0	139998	\N	\N	4
140004	23	CU – Información de cupones de descuento	\N	proxecto-00023-00018	\N	\N	0	139998	\N	\N	5
140005	23	Arquitectura	\N	proxecto-00023-00012	\N	\N	0	139987	\N	\N	1
140006	23	Implantación de sistema base	\N	proxecto-00023-00019	\N	\N	1	140005	\N	\N	0
140007	23	Arquitectura de integración de sistema con JANTO	\N	proxecto-00023-00020	\N	\N	1	140005	\N	\N	1
140008	23	Adaptar modelo de datos de JANTO a modelo de datos de tienda online	\N	proxecto-00023-00021	\N	\N	1	140005	\N	\N	2
140009	23	Selección de módulos existentes de tienda online para soporte de pago online	\N	proxecto-00023-00022	\N	\N	1	140005	\N	\N	3
140010	23	Selección de módulos existentes de tienda online para soporte de cupones de descuento	\N	proxecto-00023-00023	\N	\N	1	140005	\N	\N	4
140079	8	Puesta en producción	\N	proxecto-00023-00087	\N	\N	0	139987	\N	\N	12
367238	11	Módulo de gestión de usuarios	\N	proxecto-00024-00001	\N	\N	3	367237	\N	\N	0
367239	11	Alta de usuarios	\N	proxecto-00024-00008	\N	\N	0	367238	\N	\N	0
367240	11	Baja de usuarios	\N	proxecto-00024-00009	\N	\N	0	367238	\N	\N	1
367241	11	Listado de usuarios	\N	proxecto-00024-00010	\N	\N	0	367238	\N	\N	2
367242	11	Edición de usuarios	\N	proxecto-00024-00011	\N	\N	0	367238	\N	\N	3
367243	11	Mostrado de tareas y dependencias	\N	proxecto-00024-00002	\N	\N	0	367249	\N	\N	0
367244	11	Modificar avance de tarea	\N	proxecto-00024-00003	\N	\N	0	367254	\N	\N	0
140020	22	CU – Añadir a carrito número de entradas por tipo de entrada	\N	proxecto-00023-00033	\N	\N	0	140011	\N	\N	8
140021	22	CU – Añadir a carrito asiento automáticamente	\N	proxecto-00023-00034	\N	\N	0	140011	\N	\N	9
140022	22	CU – Añadir a carrito asiento manualmente.	\N	proxecto-00023-00035	\N	\N	0	140011	\N	\N	10
140023	22	CU – Añadir a carrito producto sin elección de asiento	\N	proxecto-00023-00036	\N	\N	0	140011	\N	\N	11
140024	22	CU – Seleccionar modo de compra (anónimo o registrado)	\N	proxecto-00023-00037	\N	\N	0	140011	\N	\N	12
140025	22	CU – Ver contenido del carrito de la compra	\N	proxecto-00023-00038	\N	\N	0	140011	\N	\N	13
140026	22	CU – Pagar carrito de la compra registrado	\N	proxecto-00023-00039	\N	\N	0	140011	\N	\N	14
140027	22	CU – Pagar carrito de la compra anónimamente	\N	proxecto-00023-00040	\N	\N	0	140011	\N	\N	15
140028	22	CU – Realizar pago vía pasarela de pago	\N	proxecto-00023-00041	\N	\N	0	140011	\N	\N	16
140029	22	CU – Consulta de operación	\N	proxecto-00023-00042	\N	\N	0	140011	\N	\N	17
140030	22	CU – Bloquear y comprobar bloqueo de tickets	\N	proxecto-00023-00043	\N	\N	0	140011	\N	\N	18
140031	22	Pruebas y resolución de errores	\N	proxecto-00023-00044	\N	\N	0	140011	\N	\N	19
140011	22	Módulo de compra de entradas	\N	proxecto-00023-00024	\N	\N	3	139987	\N	\N	2
140012	22	CU – Listar sesiones disponibles para evento	\N	proxecto-00023-00025	\N	\N	0	140011	\N	\N	0
140013	22	CU – Mostrar imagen aforo teatro	\N	proxecto-00023-00026	\N	\N	0	140011	\N	\N	1
140014	22	CU – Listar tipo de zonas del recinto	\N	proxecto-00023-00027	\N	\N	0	140011	\N	\N	2
140015	22	CU – Comprobar y mostrar entradas disponibles por zonas del recinto 	\N	proxecto-00023-00028	\N	\N	0	140011	\N	\N	3
140016	22	CU – Seleccionar zona del recinto	\N	proxecto-00023-00029	\N	\N	0	140011	\N	\N	4
140017	22	CU – Comprobar y mostrar entradas disponibles por tipo de entrada	\N	proxecto-00023-00030	\N	\N	0	140011	\N	\N	5
140018	22	CU – Seleccionar tipo de entrada	\N	proxecto-00023-00031	\N	\N	0	140011	\N	\N	6
140019	22	CU – Comprobar y mostrar precio entradas disponibles por zonas del recinto.	\N	proxecto-00023-00032	\N	\N	0	140011	\N	\N	7
367237	12	Desarrollo de un planificador	Desc.	proxecto-00024	2010-04-21 15:39:02.576	2010-12-31 00:00:00	3	\N	\N	\N	\N
367249	10	Módulo de gestión de la planificación	\N	proxecto-00024-00012	\N	\N	3	367237	\N	\N	1
367250	10	Edición de tareas	\N	proxecto-00024-00013	\N	\N	0	367249	\N	\N	1
367251	10	Creación de dependencias	\N	proxecto-00024-00014	\N	\N	0	367249	\N	\N	2
367252	10	Asignación de recursos	\N	proxecto-00024-00015	\N	\N	0	367249	\N	\N	3
367253	10	Movimiento de tareas	\N	proxecto-00024-00016	\N	\N	0	367249	\N	\N	4
367254	9	Módulo de gestión de avances	\N	proxecto-00024-00017	\N	\N	3	367237	\N	\N	2
367255	9	Añadir avance a tarea	\N	proxecto-00024-00018	\N	\N	0	367254	\N	\N	1
367256	9	Ver información gráfica de avance	\N	proxecto-00024-00019	\N	\N	0	367254	\N	\N	2
367257	8	Módulo de gestión de partes de horas	\N	proxecto-00024-00020	\N	\N	3	367237	\N	\N	3
367245	11	Editar partes de trabajo	\N	proxecto-00024-00004	\N	\N	0	367257	\N	\N	0
367258	8	Añadir parte de horas a tarea	\N	proxecto-00024-00021	\N	\N	0	367257	\N	\N	1
367259	8	Listar partes de trabajo	\N	proxecto-00024-00022	\N	\N	0	367257	\N	\N	2
367246	11	Coordinación	\N	proxecto-00024-00005	\N	\N	0	367237	\N	\N	4
367247	11	Análisis	\N	proxecto-00024-00006	\N	\N	0	367237	\N	\N	5
367248	11	Pruebas	\N	proxecto-00024-00007	\N	\N	0	367237	\N	\N	6
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
44787	1	4º release Navalplan	Desc.	proxecto-00006	0	65	4	\N	\N
56587	1	4º release Navalplan	Desc.	proxecto-00006	0	65	3	\N	\N
44788	1	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	4	44787	0
44793	1	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	4	44787	1
44797	1	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	4	44787	2
44800	1	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	4	44787	3
44805	1	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	4	44787	4
44808	1	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	4	44787	5
44810	1	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	4	44787	6
44812	1	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	4	44787	7
44816	1	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	4	44787	8
44823	1	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	4	44787	9
44829	1	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	4	44787	10
44832	1	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	4	44787	11
44835	1	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	4	44787	12
44837	1	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	4	44787	13
44839	1	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	4	44787	14
44950	1	Coordinación	\N	proxecto-00006-00063	\N	\N	4	44787	15
44951	1	Análise	\N	proxecto-00006-00064	\N	\N	4	44787	16
44789	1	Xestión de usuarios	\N	proxecto-00006-00003	\N	\N	4	44788	0
44790	1	Xestión de roles	\N	proxecto-00006-00004	\N	\N	4	44788	1
44791	1	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	4	44788	2
44792	1	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	4	44788	3
44794	1	Xestión de código único	\N	proxecto-00006-00007	\N	\N	4	44793	0
44795	1	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	4	44793	1
44796	1	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	4	44793	2
44798	1	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	4	44797	0
44799	1	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	4	44797	1
44801	1	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	4	44800	0
44802	1	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	4	44800	1
44803	1	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	4	44800	2
44804	1	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	4	44800	3
44806	1	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	4	44805	0
44807	1	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	4	44805	1
44809	1	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	4	44808	0
44811	1	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	4	44810	0
44813	1	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	4	44812	0
44814	1	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	4	44812	1
44815	1	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	4	44812	2
44817	1	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	4	44816	0
44818	1	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	4	44816	1
44819	1	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	4	44816	2
44820	1	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	4	44816	3
44821	1	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	4	44816	4
44822	1	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	4	44816	5
44824	1	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	4	44823	0
44825	1	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	4	44823	1
44826	1	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	4	44823	2
44827	1	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	4	44823	3
44828	1	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	4	44823	4
44830	1	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	4	44829	0
44831	1	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	4	44829	1
44833	1	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	4	44832	0
44834	1	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	4	44832	1
44836	1	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	4	44835	0
44838	1	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	4	44837	0
44840	1	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	4	44839	0
44841	1	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	4	44839	1
44842	1	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	4	44839	2
44843	1	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	4	44839	3
44945	1	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	4	44839	4
44946	1	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	4	44839	5
44947	1	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	4	44839	6
44948	1	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	4	44839	7
44949	1	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	4	44839	8
56588	1	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	3	56587	0
56593	1	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	3	56587	1
56597	1	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	3	56587	2
56600	1	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	3	56587	3
56605	1	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	3	56587	4
56608	1	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	3	56587	5
56610	1	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	3	56587	6
56612	1	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	3	56587	7
56616	1	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	3	56587	8
56623	1	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	3	56587	9
56629	1	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	3	56587	10
56632	1	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	3	56587	11
56635	1	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	3	56587	12
56637	1	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	3	56587	13
56639	1	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	3	56587	14
56649	1	Coordinación	\N	proxecto-00006-00063	\N	\N	0	56587	15
56650	1	Análise	\N	proxecto-00006-00064	\N	\N	0	56587	16
56589	1	Xestión de usuarios	\N	proxecto-00006-00003	\N	\N	0	56588	0
56590	1	Xestión de roles	\N	proxecto-00006-00004	\N	\N	0	56588	1
56591	1	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	0	56588	2
56592	1	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	0	56588	3
56594	1	Xestión de código único	\N	proxecto-00006-00007	\N	\N	0	56593	0
56595	1	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	0	56593	1
56596	1	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	0	56593	2
56598	1	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	0	56597	0
56599	1	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	0	56597	1
56601	1	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	0	56600	0
56602	1	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	0	56600	1
56603	1	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	0	56600	2
56604	1	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	0	56600	3
56606	1	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	0	56605	0
56607	1	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	0	56605	1
56609	1	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	0	56608	0
56611	1	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	0	56610	0
56613	1	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	0	56612	0
56614	1	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	0	56612	1
56615	1	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	0	56612	2
56617	1	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	0	56616	0
56618	1	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	0	56616	1
56619	1	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	0	56616	2
56620	1	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	0	56616	3
56621	1	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	0	56616	4
56622	1	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	0	56616	5
56624	1	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	0	56623	0
56625	1	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	0	56623	1
56626	1	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	0	56623	2
56627	1	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	0	56623	3
56628	1	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	0	56623	4
56630	1	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	0	56629	0
56631	1	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	0	56629	1
56633	1	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	0	56632	0
56634	1	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	0	56632	1
56636	1	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	0	56635	0
56638	1	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	0	56637	0
56640	1	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	0	56639	0
56641	1	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	0	56639	1
56642	1	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	0	56639	2
56643	1	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	0	56639	3
56644	1	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	0	56639	4
56645	1	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	0	56639	5
56646	1	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	0	56639	6
56647	1	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	0	56639	7
56648	1	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	0	56639	8
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
1870	1
1871	1
1872	1
1874	1
1875	1
1877	1
3646	1
3647	1
3648	1
3649	1
3650	1
3651	1
3652	1
3653	1
3654	1
3655	1
3656	1
3657	1
3658	1
3659	1
3660	1
3661	1
3662	1
3663	1
3664	1
3665	1
3666	1
3667	1
3668	1
3669	1
3670	1
3671	1
3672	1
3673	1
3674	1
6302	1
6303	1
6304	1
6306	1
4713	2
4714	1
4715	2
6307	1
6320	1
6322	1
6323	1
6340	1
6341	1
6342	1
6343	1
140079	1
122315	1
57195	1
57196	1
6354	1
6355	1
6675	1
6677	1
6678	1
6816	1
6817	1
6819	1
6820	1
6821	1
6822	1
57197	1
57198	1
57200	1
3698	1
3699	1
3700	1
6301	1
122316	1
122317	1
122318	1
122320	1
122321	1
122322	1
122324	1
122325	1
122327	1
122328	1
122329	1
122330	1
122332	1
122333	1
122335	1
122337	1
122339	1
122340	1
122341	1
122343	1
117789	1
117790	1
90614	1
6823	1
6824	1
6826	1
86165	1
86167	1
86169	1
86170	1
86171	1
86173	1
86174	1
86175	1
86176	1
86177	1
86178	1
86180	1
86181	1
86182	1
86183	1
86184	1
86186	1
86187	1
86189	1
86190	1
86192	1
86194	1
86196	1
86197	1
86198	1
86199	1
86200	1
86201	1
86202	1
86203	1
86204	1
86205	1
86206	1
85512	1
85513	1
85514	1
85515	1
85517	1
85518	1
85519	1
90601	1
90602	1
90605	1
90606	1
85842	1
85843	1
85844	1
85845	1
85847	1
85848	1
85849	1
86154	1
86155	1
86157	1
86158	1
86159	1
86160	1
86162	1
86163	1
85521	1
85522	1
85524	1
85525	1
85526	1
85527	1
85529	1
85530	1
85532	1
85534	1
85536	1
85537	1
85538	1
85540	1
85541	1
85542	1
85543	1
85544	1
85545	1
85749	1
85750	1
85751	1
85752	1
85753	1
85755	1
85756	1
85758	1
85759	1
85761	1
85763	1
85765	1
85766	1
85767	1
85768	1
85769	1
85770	1
85771	1
85772	1
85773	1
85774	1
85775	1
6827	1
6828	1
6829	1
6830	1
7073	1
122352	1
122353	1
122354	1
122356	1
117802	1
122344	1
122345	1
122346	1
122347	1
122348	1
122350	1
86215	1
86216	1
86217	1
7074	1
7076	1
122351	1
90600	1
7077	1
7079	1
7084	1
7080	1
7118	1
7119	1
90610	1
90611	1
90613	1
57249	1
57250	1
57251	1
57252	1
7082	1
7116	1
7117	1
7120	1
7121	1
7122	1
7123	1
7124	1
135456	1
135457	1
135458	1
105041	1
135459	1
135460	1
105043	1
105044	1
117804	1
122357	1
122359	1
122360	1
122362	1
122364	1
122366	1
122367	1
122368	1
122369	1
122370	1
122371	1
122372	1
122373	1
122374	1
122375	1
122376	1
117792	1
117793	1
117796	1
117798	1
57201	1
57202	1
57204	1
57205	1
57207	1
57208	1
57209	1
57210	1
57212	1
57213	1
57215	1
57217	1
57219	1
57220	1
57221	1
57223	1
57224	1
57225	1
57226	1
57227	1
57228	1
57230	1
57231	1
57232	1
57233	1
57234	1
57236	1
57237	1
57239	1
57240	1
57242	1
57244	1
57246	1
57247	1
57248	1
57253	1
57254	1
57255	1
57256	1
139999	1
140000	1
140001	1
140002	1
140003	1
140004	1
140006	1
140007	1
140008	1
140009	1
140010	1
140012	1
140013	1
140014	1
140015	1
140016	1
140017	1
140018	1
140019	1
140020	1
140021	1
140022	1
140023	1
140024	1
140025	1
140026	1
140027	1
140028	1
140029	1
140030	1
140031	1
140034	1
140035	1
140036	1
140037	1
140038	1
140039	1
140040	1
140052	1
140053	1
140054	1
140055	1
140056	1
140057	1
140058	1
367239	1
367240	1
367241	1
367242	1
367243	1
367250	1
367251	1
367252	1
367253	1
367244	1
367255	1
367256	1
367245	1
367258	1
367259	1
367246	1
367247	1
367248	1
140041	1
140042	1
140043	1
140045	1
140046	1
140047	1
140048	1
140049	1
140050	1
140059	1
140060	1
140061	1
140062	1
140063	1
140064	1
140065	1
140067	1
140068	1
140069	1
140070	1
140071	1
139995	1
139996	1
139997	1
140074	1
140075	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1868
1869
1873
1876
3255
3697
4712
6275
6300
6305
6321
6339
6353
6674
6676
6815
6818
6825
7072
7075
7078
7081
7115
57193
57194
57199
57203
57206
57211
57214
57216
57218
57222
57229
57235
57238
57241
57243
57245
85510
85511
85516
85520
85523
85528
85531
85533
85535
85539
85546
85754
85757
85760
85762
85764
85840
85841
85846
86153
86156
86161
86164
86166
86168
86172
86179
86185
86188
86191
86193
86195
86208
86214
90597
90599
90604
90608
90609
90612
105040
105042
117787
117788
117791
117797
117799
117800
117803
122313
122314
122319
122323
122326
122331
122334
122336
122338
122342
122349
122355
122358
122361
122363
122365
135455
139987
139998
140005
140011
140033
140044
140051
140066
367237
367238
367249
367254
367257
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
44787
44788
44793
44797
44800
44805
44808
44810
44812
44816
44823
44829
44832
44835
44837
44839
56587
56588
56593
56597
56600
56605
56608
56610
56612
56616
56623
56629
56632
56635
56637
56639
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, workhours, lasthoursgroupsequencecode) FROM stdin;
44789	8	\N
44790	16	\N
44791	16	\N
44792	40	\N
44794	24	\N
44795	56	\N
44796	8	\N
44798	40	\N
44799	8	\N
44801	24	\N
44802	48	\N
44803	28	\N
44804	120	\N
44806	24	\N
44807	40	\N
44809	40	\N
44811	40	\N
44813	48	\N
44814	32	\N
44815	32	\N
44817	64	\N
44818	16	\N
44819	32	\N
44820	40	\N
44821	16	\N
44822	32	\N
44824	15	\N
44825	48	\N
44826	40	\N
44827	24	\N
44828	32	\N
44830	64	\N
44831	96	\N
44833	32	\N
44834	40	\N
44836	40	\N
44838	32	\N
44840	16	\N
44841	24	\N
44842	24	\N
44843	24	\N
44945	24	\N
44946	24	\N
44947	24	\N
44948	24	\N
44949	24	\N
44950	254	\N
44951	256	\N
56589	8	\N
56590	16	\N
56591	16	\N
56592	40	\N
56594	24	\N
56595	56	\N
56596	8	\N
56598	40	\N
56599	8	\N
56601	24	\N
56602	48	\N
56603	28	\N
56604	120	\N
56606	24	\N
56607	40	\N
56609	40	\N
56611	40	\N
56613	48	\N
56614	32	\N
56615	32	\N
56617	64	\N
56618	16	\N
56619	32	\N
56620	40	\N
56621	16	\N
56622	32	\N
56624	15	\N
56625	48	\N
56626	40	\N
56627	24	\N
56628	32	\N
56630	64	\N
56631	96	\N
56633	32	\N
56634	40	\N
56636	40	\N
56638	32	\N
56640	16	\N
56641	24	\N
56642	24	\N
56643	24	\N
56644	24	\N
56645	24	\N
56646	24	\N
56647	24	\N
56648	24	\N
56649	256	\N
56650	256	\N
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	5	PREFIX	1	5	f
607	27	proxecto	24	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
44787	307
56587	307
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
121907	ROLE_WS_READER
121907	ROLE_WS_WRITER
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype, reportadvance, advance_type_id) FROM stdin;
106959	1	Formulario de calidade para tarefas de tipo A	Desc.	0	t	106858
113221	1	Formulario de calidade para tarefas de tipo B		1	f	\N
113222	3	Formulario de calidade para tarefas de tipo C		0	t	113322
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
106959	¿Levaches a cabo o proceso A?	10.00	0	0
106959	¿Levaches a cabo o proceso B?	25.00	1	1
106959	¿Levaches a cabo o proceso C?	50.00	2	2
106959	¿Levaches a cabo o proceso D?	75.00	3	3
106959	¿Levaches a cabo o proceso E?	100.00	4	4
113221	Paso 1.	25.00	0	0
113221	Paso 2.	25.00	1	1
113221	Paso 3.	25.00	2	2
113221	Paso 4.	25.00	3	3
113222	¿Fíxose tarefa 1?	30.00	0	0
113222	¿Fíxose tarefa 2?	45.00	1	1
113222	¿Fíxose tarefa 3?	70.00	2	2
113222	¿Fíxose tarefa 4?	100.00	3	3
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, base_calendar_id, code, limited_resource, generatecode) FROM stdin;
90904	39	91002	389a5a9b-512d-4c4d-9feb-9ed84ab5ce36	\N	\N
90906	39	91003	326c9e07-7918-4ecc-b611-735892d8eb1a	\N	\N
1232	3	318	1232	\N	\N
117264	11	116960	cbfe40bc-a486-43b3-a96b-71677735c1b2	\N	\N
117262	10	116959	dfd6cee4-83fa-4969-8328-37c72ef790c2	\N	\N
1234	3	319	1234	\N	\N
1236	2	320	1236	\N	\N
1222	3	313	1222	\N	\N
1214	4	310	1214	\N	\N
1224	2	314	1224	\N	\N
134535	3	134634	7da5145f-a035-4d04-848a-6785597750ba	\N	\N
1239	4	321	1239	\N	\N
134537	3	134635	d5cf1f5a-9627-47b4-a289-8af697eb2b94	\N	\N
134533	3	134633	5a1cdea6-66c7-48da-bede-7591e9d0101a	\N	\N
90901	4	91001	676cc545-8a05-44b1-a77f-576241d2faf2	\N	\N
1226	5	315	1226	\N	\N
139482	2	139582	2b5cb9bd-4fd9-4a24-9ce4-00ae5c27ed5a	f	\N
139486	1	139584	84adeb96-3c4d-4d1a-86ca-b63b5297b7c8	f	\N
139484	4	139583	0e0ae244-9e0d-4317-b086-ec73d7e13466	f	\N
1217	8	311	1217	f	\N
1228	3	316	1228	f	\N
1220	6	312	1220	f	\N
1230	4	317	1230	f	\N
139488	1	139585	c0eae794-29e8-4565-8a82-4ba7822b7492	f	\N
367843	1	367943	f2e12959-eeee-4704-903b-94e4548f6dd1	f	t
367845	2	367944	16e6e303-b7a1-4795-9907-1d7bf0c98a75	f	t
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
2527	3	1.00	2424	\N
3063	1	1.00	3868	\N
3032	0	0.75	2425	\N
3064	1	2.00	3869	\N
3066	0	0.50	3870	\N
3069	2	1.00	3872	\N
3070	2	1.00	3872	\N
5051	0	1.00	3873	\N
136062	0	1.00	135546	\N
148707	28	1.00	146154	\N
97578	22	2.00	97367	\N
97579	22	2.00	97368	\N
3053	2	1.00	3843	\N
3054	2	1.00	3842	\N
3043	4	1.00	3850	\N
3044	4	1.00	3849	\N
3045	4	1.00	3838	\N
3056	1	1.00	3844	\N
3046	4	1.00	3845	\N
3047	4	1.00	3841	\N
3050	3	1.00	3840	\N
3048	4	1.00	3839	\N
3059	0	1.00	3846	\N
3060	0	1.00	3847	\N
97580	22	2.86	97370	112723
97581	22	2.00	97371	112725
97567	4	1.75	97365	\N
97566	4	4.00	97364	\N
148708	28	1.00	146147	\N
58456	8	1.00	56260	\N
58458	8	1.00	56292	\N
58459	8	1.00	56293	\N
148709	28	1.00	146148	\N
148710	28	1.00	146149	\N
148711	28	1.00	146150	\N
58460	8	1.00	56294	\N
60793	3	0.20	56295	\N
60794	3	0.10	56296	\N
60758	4	1.00	56281	\N
60795	3	1.00	56282	\N
60706	5	1.00	56283	\N
60755	4	1.00	56306	\N
60751	4	1.00	56274	\N
60703	5	1.00	56275	\N
89399	1	1.00	86383	\N
89400	1	1.00	86383	\N
89401	1	1.00	86383	\N
89402	1	1.00	86384	\N
89403	1	1.00	86384	\N
89404	1	1.00	86384	\N
89405	1	0.70	86385	\N
86460	3	0.94	85407	88072
58472	6	1.00	56301	\N
58457	8	1.00	56302	\N
68413	2	0.75	56318	\N
60790	3	1.00	56277	\N
58468	7	1.00	56298	\N
58469	7	1.00	56299	\N
148712	28	1.00	146151	\N
148713	28	1.00	146152	\N
146358	33	0.18	146195	\N
200663	15	0.38	146190	\N
86458	1	1.00	57493	\N
148714	28	1.00	146189	\N
200656	24	0.50	146187	\N
68414	2	0.75	56319	\N
60752	4	1.00	56269	\N
60753	4	1.00	56270	\N
60754	4	1.00	56271	\N
60705	5	1.00	56272	\N
60791	3	1.00	56285	\N
58450	8	1.00	56286	\N
58451	8	1.00	56287	\N
58452	8	1.00	56288	\N
58453	8	1.00	56289	\N
58454	8	1.00	56290	\N
58383	9	1.00	56257	\N
118483	4	2.00	118170	\N
118484	4	2.00	118171	\N
118485	4	2.00	118173	\N
118486	4	2.03	118174	120797
58384	9	1.00	56258	\N
58455	8	1.00	56259	\N
58470	7	1.00	56266	\N
60704	5	1.00	56267	\N
58461	8	1.00	56262	\N
60756	4	1.00	56263	\N
60757	4	1.00	56264	\N
68415	2	1.00	56308	\N
68416	2	1.00	56309	\N
68417	2	1.00	56310	\N
68418	2	1.00	56311	\N
68419	2	1.00	56312	\N
68420	2	1.00	56313	\N
68421	2	1.00	56314	\N
68422	2	1.00	56315	\N
68423	2	1.00	56316	\N
60792	3	1.00	56304	\N
136058	3	1.00	135543	\N
136057	3	1.00	135544	\N
135746	10	1.00	135542	\N
136056	3	1.00	135545	\N
200655	24	1.00	146192	\N
178234	27	1.00	146155	\N
178235	27	1.00	146156	\N
178236	27	1.00	146157	\N
178237	27	1.00	146158	\N
178238	27	1.00	146159	\N
178239	27	1.00	146160	\N
178240	27	1.00	146161	\N
178241	27	1.00	146162	\N
178242	27	1.00	146163	\N
178243	27	1.00	146164	\N
178244	27	1.00	146165	\N
178245	27	1.00	146166	\N
178246	27	1.00	146167	\N
183845	26	1.00	146168	\N
183846	26	1.00	146169	\N
183847	26	1.00	146170	\N
183848	26	1.00	146171	\N
183849	26	1.00	146172	\N
183850	26	1.00	146173	\N
178247	27	1.00	146174	\N
200665	2	0.71	146197	\N
146357	33	0.29	146194	\N
200642	25	1.00	146176	\N
200643	25	1.00	146177	\N
200644	25	1.00	146178	\N
200645	25	1.00	146179	\N
200646	25	1.00	146180	\N
200647	25	1.00	146181	\N
200648	25	1.00	146182	\N
200649	25	1.00	146183	\N
200650	25	1.00	146184	\N
200651	25	1.00	146185	\N
148716	28	1.00	146188	\N
178248	27	0.66	146191	\N
370775	3	1.00	368751	\N
370776	3	1.00	368752	\N
370777	3	1.00	368753	\N
370778	3	1.00	368754	\N
368963	4	0.19	368771	\N
370802	2	0.50	368757	\N
370816	1	1.00	368758	\N
370819	0	0.19	368770	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
304	1
319	1
320	1
116960	3
116959	1
313	1
310	1
314	1
134634	1
321	3
134635	1
134633	1
91001	2
315	1
139582	1
139584	1
139583	1
311	1
316	1
312	1
317	1
139585	1
367943	1
367944	1
91002	1
91003	3
318	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, initdate, enddate, cost_category_id, resource_id, code) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
3032	1230
3059	1217
3060	1226
3053	1224
3054	1214
3043	1220
3044	1226
3045	1214
3056	1230
3046	1228
3047	1214
3050	1228
3048	1230
5051	1236
89399	1226
89400	1217
89401	1222
89402	1220
89403	1228
89404	1224
89405	1224
86460	1226
60793	1217
60794	1217
86458	1220
146358	139484
200663	139488
146357	139484
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
88072	2010-06-05	1.00	1.00	0
106153	2010-03-07	0.30	0.10	0
106153	2010-03-09	0.40	0.15	1
106153	2010-03-11	0.60	0.25	2
106153	2010-03-17	1.00	1.00	3
112717	2010-03-04	0.15	0.05	0
112717	2010-03-06	0.30	0.15	1
112717	2010-03-10	0.60	0.40	2
112717	2010-03-16	1.00	1.00	3
112719	2010-03-06	0.20	0.05	0
112719	2010-03-09	0.40	0.20	1
112719	2010-03-11	0.60	0.40	2
112719	2010-03-17	1.00	1.00	3
112721	2010-02-19	0.20	0.05	0
112721	2010-02-22	0.40	0.20	1
112721	2010-02-25	0.60	0.40	2
112721	2010-03-03	1.00	1.00	3
112723	2010-02-19	0.20	0.05	0
112723	2010-02-21	0.40	0.20	1
112723	2010-02-24	0.60	0.40	2
112723	2010-03-01	1.00	1.00	3
112725	2010-03-03	0.20	0.05	0
112725	2010-03-06	0.40	0.20	1
112725	2010-03-09	0.60	0.40	2
112725	2010-03-15	1.00	1.00	3
120797	2010-03-09	0.20	0.05	0
120797	2010-03-12	0.40	0.20	1
120797	2010-03-16	0.60	0.40	2
120797	2010-03-19	0.80	0.75	3
120797	2010-03-23	1.00	1.00	4
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
88072	0
106153	1
112717	1
112721	1
112719	1
112723	1
112725	1
120797	1
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
28508162	4	2021	2010-02-15 17:51:06.094	2010-02-15 18:02:07.281	Subcontratación da coordinación	100000.00	\N	t	t	t	t	2
29327361	3	2021	2010-02-16 09:25:43.689	2010-02-16 09:27:25.023	Subcontrata de integración de informes	10000.00	CODE-1	f	t	t	t	2
39387137	7	2021	2010-02-17 18:06:11.931	2010-02-17 18:10:39.819	Subcontratacion	40000.00	CODE	f	t	t	t	2
33849345	8	2021	2010-02-16 15:56:30.687	2010-02-16 15:58:37.807	Desc	100000.00	\N	\N	t	t	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
3863	1	0	\N	\N	\N
3860	1	0	\N	\N	\N
3843	1	0	\N	\N	\N
3851	1	0	\N	\N	\N
3842	1	0	\N	\N	\N
3850	1	0	\N	\N	\N
2424	1	1	2010-02-01 00:00:00	\N	\N
2425	1	1	2010-01-27 00:00:00	\N	\N
3849	1	0	\N	\N	\N
3861	1	0	\N	\N	\N
3853	1	0	\N	\N	\N
3848	1	0	\N	\N	\N
3838	1	0	\N	\N	\N
3844	1	0	\N	\N	\N
3856	1	0	\N	\N	\N
3859	1	0	\N	\N	\N
3866	1	0	\N	\N	\N
3846	1	0	\N	\N	\N
3862	1	0	\N	\N	\N
3865	1	0	\N	\N	\N
3845	1	0	\N	\N	\N
3855	1	0	\N	\N	\N
3857	1	0	\N	\N	\N
3854	1	0	\N	\N	\N
3841	1	0	\N	\N	\N
3847	1	0	\N	\N	\N
3852	1	0	\N	\N	\N
3840	1	0	\N	\N	\N
3864	1	0	\N	\N	\N
3858	1	0	\N	\N	\N
3839	1	0	\N	\N	\N
118183	1	0	\N	\N	\N
118184	1	0	\N	\N	\N
3874	1	0	\N	\N	\N
3873	1	0	\N	\N	\N
3872	1	0	\N	\N	\N
118185	1	0	\N	\N	\N
118186	1	0	\N	\N	\N
118188	1	0	\N	\N	\N
118189	1	0	\N	\N	\N
85410	1	0	\N	\N	\N
85411	1	0	\N	\N	\N
85412	1	0	\N	\N	\N
85413	1	0	\N	\N	\N
85415	1	0	\N	\N	\N
85416	1	0	\N	\N	\N
85417	1	0	\N	\N	\N
118190	1	0	\N	\N	\N
118192	1	0	\N	\N	\N
118193	1	0	\N	\N	\N
118195	1	0	\N	\N	\N
118196	1	0	\N	\N	\N
118197	1	0	\N	\N	\N
118198	1	0	\N	\N	\N
118200	1	0	\N	\N	\N
118201	1	0	\N	\N	\N
118203	1	0	\N	\N	\N
118205	1	0	\N	\N	\N
118207	1	0	\N	\N	\N
118208	1	0	\N	\N	\N
56334	1	0	\N	\N	\N
56335	1	0	\N	\N	\N
56336	1	0	\N	\N	\N
56338	1	0	\N	\N	\N
56339	1	0	\N	\N	\N
56349	1	0	\N	\N	\N
56350	1	0	\N	\N	\N
56351	1	0	\N	\N	\N
56352	1	0	\N	\N	\N
56353	1	0	\N	\N	\N
56354	1	0	\N	\N	\N
57476	1	0	\N	\N	\N
57477	1	0	\N	\N	\N
85419	1	0	\N	\N	\N
85420	1	0	\N	\N	\N
57479	1	0	\N	\N	\N
57493	1	0	\N	\N	\N
118209	1	0	\N	\N	\N
118211	1	0	\N	\N	\N
3868	1	0	\N	\N	\N
3869	1	0	\N	\N	\N
3870	1	0	\N	\N	\N
118212	1	0	\N	\N	\N
85422	1	0	\N	\N	\N
85423	1	0	\N	\N	\N
118213	1	0	\N	\N	\N
118214	1	0	\N	\N	\N
85424	1	0	\N	\N	\N
85425	1	0	\N	\N	\N
85427	1	0	\N	\N	\N
85428	1	0	\N	\N	\N
85430	1	0	\N	\N	\N
118215	1	0	\N	\N	\N
118216	1	0	\N	\N	\N
118218	1	0	\N	\N	\N
118219	1	0	\N	\N	\N
118220	1	0	\N	\N	\N
118221	1	0	\N	\N	\N
118222	1	0	\N	\N	\N
97367	1	0	\N	\N	\N
97368	1	1	2010-02-24 00:00:00	\N	\N
97370	2	0	\N	\N	\N
97371	0	1	2010-02-24 00:00:00	\N	\N
56257	1	0	\N	\N	\N
56258	1	0	\N	\N	\N
56259	1	0	\N	\N	\N
56260	1	0	\N	\N	\N
56262	1	0	\N	\N	\N
56263	1	0	\N	\N	\N
56264	1	0	\N	\N	\N
146197	2	0	\N	\N	\N
118224	1	0	\N	\N	\N
118225	1	0	\N	\N	\N
118227	1	0	\N	\N	\N
118228	1	0	\N	\N	\N
118230	1	0	\N	\N	\N
118232	1	0	\N	\N	\N
118234	1	0	\N	\N	\N
118235	1	0	\N	\N	\N
118177	1	0	\N	\N	\N
85432	1	0	\N	\N	\N
85434	1	0	\N	\N	\N
85435	1	0	\N	\N	\N
85436	1	0	\N	\N	\N
85438	1	0	\N	\N	\N
85439	1	0	\N	\N	\N
85440	1	0	\N	\N	\N
85441	1	0	\N	\N	\N
85442	1	0	\N	\N	\N
85443	1	0	\N	\N	\N
85445	1	0	\N	\N	\N
86355	1	0	\N	\N	\N
86356	1	0	\N	\N	\N
56333	1	0	\N	\N	\N
85397	1	2	2010-04-21 00:00:00	29327361	\N
56266	1	0	\N	\N	\N
118178	1	2	2010-02-22 00:00:00	39387137	\N
56321	1	0	\N	\N	\N
56322	1	0	\N	\N	\N
56323	1	0	\N	\N	\N
56324	1	0	\N	\N	\N
56326	1	0	\N	\N	\N
56327	1	0	\N	\N	\N
56328	1	0	\N	\N	\N
56330	1	0	\N	\N	\N
56331	1	0	\N	\N	\N
56341	1	0	\N	\N	\N
56267	1	0	\N	\N	\N
56269	1	0	\N	\N	\N
86357	1	0	\N	\N	\N
85376	1	0	\N	\N	\N
85377	1	0	\N	\N	\N
85378	1	0	\N	\N	\N
85379	1	0	\N	\N	\N
86358	1	0	\N	\N	\N
86360	1	0	\N	\N	\N
86361	1	0	\N	\N	\N
86363	1	0	\N	\N	\N
86364	1	0	\N	\N	\N
86366	1	0	\N	\N	\N
86368	1	0	\N	\N	\N
86370	1	0	\N	\N	\N
86371	1	0	\N	\N	\N
86372	1	0	\N	\N	\N
86373	1	0	\N	\N	\N
86374	1	0	\N	\N	\N
86375	1	0	\N	\N	\N
86376	1	0	\N	\N	\N
86377	1	0	\N	\N	\N
86378	1	0	\N	\N	\N
86380	1	0	\N	\N	\N
86381	1	0	\N	\N	\N
56343	1	0	\N	\N	\N
56345	1	0	\N	\N	\N
56346	1	0	\N	\N	\N
56347	1	0	\N	\N	\N
56356	1	0	\N	\N	\N
56357	1	0	\N	\N	\N
57469	1	0	\N	\N	\N
57470	1	0	\N	\N	\N
57471	1	0	\N	\N	\N
57473	1	0	\N	\N	\N
57474	1	0	\N	\N	\N
57481	1	0	\N	\N	\N
57483	1	0	\N	\N	\N
57484	1	0	\N	\N	\N
57485	1	0	\N	\N	\N
56270	1	0	\N	\N	\N
56271	1	0	\N	\N	\N
56272	1	0	\N	\N	\N
56274	1	0	\N	\N	\N
56275	1	1	2009-12-14 00:00:00	\N	\N
56277	1	0	\N	\N	\N
56279	1	0	\N	\N	\N
56281	1	0	\N	\N	\N
56282	1	0	\N	\N	\N
105343	1	1	2010-02-12 18:21:59.723	\N	\N
105344	1	1	2010-02-12 18:21:59.723	\N	\N
105345	1	1	2010-02-12 18:21:59.723	\N	\N
56283	1	0	\N	\N	\N
56285	1	0	\N	\N	\N
56286	1	0	\N	\N	\N
56287	1	0	\N	\N	\N
56288	1	0	\N	\N	\N
56289	1	0	\N	\N	\N
56290	1	0	\N	\N	\N
56292	1	0	\N	\N	\N
56293	1	0	\N	\N	\N
56294	1	0	\N	\N	\N
56295	1	0	\N	\N	\N
56296	1	0	\N	\N	\N
56298	1	0	\N	\N	\N
56299	1	0	\N	\N	\N
56301	1	0	\N	\N	\N
56302	1	0	\N	\N	\N
56304	1	0	\N	\N	\N
56306	1	0	\N	\N	\N
56308	1	0	\N	\N	\N
56309	1	0	\N	\N	\N
57486	1	0	\N	\N	\N
57487	1	0	\N	\N	\N
57488	1	0	\N	\N	\N
57489	1	0	\N	\N	\N
57490	1	0	\N	\N	\N
57491	1	0	\N	\N	\N
57494	1	2	2010-02-12 18:21:59.723	33849345	\N
56310	1	0	\N	\N	\N
56311	1	0	\N	\N	\N
118238	1	0	\N	\N	\N
118239	1	0	\N	\N	\N
118240	1	0	\N	\N	\N
118241	1	0	\N	\N	\N
118242	1	0	\N	\N	\N
118244	1	0	\N	\N	\N
118245	1	0	\N	\N	\N
85408	1	2	2010-04-21 00:00:00	28508162	\N
85355	1	0	\N	\N	\N
86383	1	1	2010-04-21 00:00:00	\N	\N
86384	1	1	2010-04-21 00:00:00	\N	\N
86385	2	1	2010-04-21 00:00:00	\N	\N
85356	1	0	\N	\N	\N
85351	1	0	\N	\N	\N
85352	1	0	\N	\N	\N
85353	1	0	\N	\N	\N
85370	1	0	\N	\N	\N
85371	1	0	\N	\N	\N
85372	1	0	\N	\N	\N
85374	1	0	\N	\N	\N
85375	1	0	\N	\N	\N
85398	1	0	\N	\N	\N
85399	1	0	\N	\N	\N
85400	1	0	\N	\N	\N
85401	1	0	\N	\N	\N
85402	1	0	\N	\N	\N
85403	1	0	\N	\N	\N
85404	1	0	\N	\N	\N
85405	1	0	\N	\N	\N
85358	1	0	\N	\N	\N
85359	1	0	\N	\N	\N
85360	1	0	\N	\N	\N
85361	1	0	\N	\N	\N
85366	1	0	\N	\N	\N
85407	1	0	\N	\N	\N
85395	1	0	\N	\N	\N
85393	1	0	\N	\N	\N
56312	1	0	\N	\N	\N
56313	1	0	\N	\N	\N
56314	1	0	\N	\N	\N
56315	1	0	\N	\N	\N
56316	1	0	\N	\N	\N
56318	1	0	\N	\N	\N
56319	1	0	\N	\N	\N
85346	1	0	\N	\N	\N
85347	1	0	\N	\N	\N
85348	1	0	\N	\N	\N
85349	1	0	\N	\N	\N
85390	1	0	\N	\N	\N
85391	1	0	\N	\N	\N
85387	1	0	\N	\N	\N
85388	1	0	\N	\N	\N
85381	1	0	\N	\N	\N
85382	1	0	\N	\N	\N
85383	1	0	\N	\N	\N
85384	1	0	\N	\N	\N
85385	1	0	\N	\N	\N
85368	1	0	\N	\N	\N
85363	1	0	\N	\N	\N
85364	1	0	\N	\N	\N
146147	1	0	\N	\N	\N
146148	1	1	2010-06-20 23:17:59.092	\N	\N
146149	1	0	\N	\N	\N
146150	1	0	\N	\N	\N
146151	1	0	\N	\N	\N
146152	1	0	\N	\N	\N
146154	1	1	2010-06-10 00:00:00	\N	\N
146155	1	1	2010-06-16 14:29:46.212	\N	\N
97365	1	0	\N	\N	\N
97364	1	0	\N	\N	\N
146156	1	0	\N	\N	\N
146157	1	0	\N	\N	\N
146158	1	0	\N	\N	\N
146159	1	0	\N	\N	\N
146160	1	0	\N	\N	\N
146161	1	0	\N	\N	\N
146162	1	0	\N	\N	\N
146163	1	0	\N	\N	\N
146164	1	0	\N	\N	\N
146165	1	0	\N	\N	\N
146166	1	0	\N	\N	\N
146167	1	0	\N	\N	\N
146168	1	1	2010-07-20 00:13:56.19	\N	\N
146169	1	0	\N	\N	\N
146170	1	0	\N	\N	\N
146171	1	0	\N	\N	\N
146172	1	0	\N	\N	\N
146173	1	0	\N	\N	\N
146174	1	0	\N	\N	\N
146176	1	0	\N	\N	\N
118179	1	1	2010-02-22 00:00:00	\N	\N
118180	1	1	2010-02-22 00:00:00	\N	\N
118236	1	0	\N	\N	\N
118237	1	0	\N	\N	\N
118170	1	0	\N	\N	\N
118171	1	0	\N	\N	\N
118173	1	0	\N	\N	\N
118174	1	0	\N	\N	\N
135543	1	0	\N	\N	\N
135544	1	0	\N	\N	\N
135542	1	0	\N	\N	\N
135546	1	0	\N	\N	\N
135545	1	0	\N	\N	\N
146177	1	0	\N	\N	\N
146178	1	0	\N	\N	\N
146179	1	0	\N	\N	\N
146180	1	0	\N	\N	\N
146181	1	0	\N	\N	\N
146182	1	0	\N	\N	\N
146183	1	0	\N	\N	\N
146184	1	0	\N	\N	\N
146185	1	0	\N	\N	\N
146187	1	1	2010-07-27 23:14:09.60	\N	\N
146188	1	0	\N	\N	\N
146189	1	0	\N	\N	\N
146190	2	0	\N	\N	\N
146191	2	0	\N	\N	\N
146192	1	0	\N	\N	\N
146194	2	0	\N	\N	\N
146195	2	0	\N	\N	\N
368751	1	0	\N	\N	\N
368752	1	0	\N	\N	\N
368753	1	0	\N	\N	\N
368754	1	0	\N	\N	\N
368771	2	0	\N	\N	\N
368772	1	0	\N	\N	\N
368762	1	0	\N	\N	\N
368763	1	0	\N	\N	\N
368764	1	0	\N	\N	\N
368766	1	0	\N	\N	\N
368767	1	0	\N	\N	\N
368768	1	0	\N	\N	\N
368756	1	0	\N	\N	\N
368757	1	0	\N	\N	\N
368758	1	0	\N	\N	\N
368759	1	0	\N	\N	\N
368760	1	0	\N	\N	\N
368770	2	0	\N	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
107061	5	106959	90614	t
122513	5	113222	117789	t
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
107061	¿Levaches a cabo o proceso C?	50.00	2	f	\N	2
107061	¿Levaches a cabo o proceso D?	75.00	3	f	\N	3
107061	¿Levaches a cabo o proceso E?	100.00	4	f	\N	4
107061	¿Levaches a cabo o proceso A?	10.00	0	t	2010-02-09 00:00:00	0
107061	¿Levaches a cabo o proceso B?	25.00	1	t	2010-02-17 00:00:00	1
122513	¿Fíxose tarefa 3?	70.00	2	f	\N	2
122513	¿Fíxose tarefa 4?	100.00	3	f	\N	3
122513	¿Fíxose tarefa 1?	30.00	0	t	2010-02-23 00:00:00	0
122513	¿Fíxose tarefa 2?	45.00	1	t	2010-02-25 00:00:00	1
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
2424	2139
2425	2140
3838	3622
3839	3623
3840	3624
3841	3625
3842	3626
3843	3627
3844	3628
3845	3629
3846	3630
3847	3631
3848	3632
3849	3633
3850	3634
3851	3635
3852	3737
3853	3738
3854	3739
3855	3740
3856	3741
3857	3742
3858	3743
3859	3744
3860	3745
3861	3746
3862	3747
3863	3748
3864	3749
3865	3750
3866	3751
118183	118035
118184	118036
118185	118037
118186	118038
97367	90704
97368	90705
97370	90706
97371	90707
3868	3761
3869	3762
3870	3763
3872	4866
3872	4865
3873	4867
3874	4868
3874	4869
118188	118039
118189	118040
118190	118041
118192	118042
86383	86046
86384	86047
86385	86048
97364	90702
97365	90703
118193	118043
118195	118044
118196	118045
118197	118046
118198	118047
118200	118048
118201	118049
118203	118050
118205	118051
118207	118052
118208	118053
118209	118054
118211	118055
118212	118056
118213	118057
118214	118058
118215	118059
118216	118060
118218	118061
118219	118062
118220	118063
118221	118064
118222	118065
118224	118066
118225	118067
118227	118068
118228	122412
118230	122413
118232	122414
118234	122415
118235	122416
118236	122417
118237	122418
118238	122419
118239	122420
118240	122421
118241	122422
118242	122423
118244	122424
118245	122425
146147	140400
146148	140401
146149	140402
146150	140403
146151	140404
146152	140405
56321	57060
56322	57061
56323	57062
56324	57063
56326	57064
56327	57267
56328	57268
56330	57269
56331	57270
118177	117982
56333	57271
56334	57272
56335	57273
56336	57274
56338	57275
56339	57276
56341	57277
56343	57278
56345	57279
56346	57280
56347	57281
56349	57282
56350	57283
56351	57284
56352	57285
56353	57286
56354	57287
56356	57288
56357	57289
57469	57290
57470	57291
57471	57292
57473	57293
85346	85595
85347	85596
85348	85597
85349	85598
85351	85599
85352	85600
85353	85601
85355	85602
85356	85603
85358	85604
85359	85605
85360	85606
85361	85607
85363	85608
85364	85609
85366	85610
85368	85611
85370	85612
85371	85613
85372	85614
85374	85615
85375	85616
85376	85617
85377	85618
85378	85619
85379	85620
85381	85621
85382	85622
85383	85623
85384	85624
85385	85625
85387	85626
85388	85627
85390	85628
85391	85629
85393	85630
85395	85631
85397	85632
85398	85633
85399	85634
85400	85635
85401	85636
85402	85637
85403	85638
85404	85639
85405	85640
85407	85641
146154	140409
146154	140408
146154	140407
146154	140410
146154	140406
146155	140411
118170	117976
56257	6583
56258	6584
56259	6585
56260	6586
56262	6587
56263	6588
56264	6598
56266	6599
56267	6600
56269	6613
56270	6614
56271	6615
56272	6616
56274	6623
56275	6624
56277	6634
56279	6635
56281	6636
56282	6907
56283	6908
56285	6909
56286	6910
56287	6911
56288	6912
56289	6913
56290	6914
56292	6915
56293	6916
56294	6917
56295	6918
56296	6919
56298	6947
56299	6948
56301	6949
56302	6950
56304	6951
56306	6953
56308	7185
56309	7186
56310	6955
56311	6952
56312	7187
56313	7188
56314	7189
56315	7190
56316	7191
146156	140412
146157	140413
146158	140414
146159	140415
146160	140416
146161	140417
146162	140418
146163	140419
146164	140420
146165	140421
146166	140422
146167	140423
146168	140424
146169	140425
146170	140426
146171	140427
146172	140428
146173	140429
146174	140430
146176	140432
146177	140433
146178	140434
146179	140435
146180	140436
146181	140437
146182	140438
146183	140439
146184	140440
146185	140441
146187	140444
146187	140447
146187	140445
146187	140446
146187	140443
146187	140442
146188	140451
146188	140460
146188	140448
146188	140453
146188	140450
146188	140456
146188	140457
146188	140454
146188	140452
146188	140461
146188	140458
146188	140449
146188	140459
56318	7192
56319	7193
118171	117977
118173	117978
85410	85994
85411	85995
85412	85996
85413	85997
85415	85998
85416	85999
85417	86000
85419	86001
85420	86002
85422	86003
85423	86004
85424	86005
85425	86006
85427	86007
85428	86008
85430	86009
85432	86010
85434	86011
85435	86012
85436	86013
85438	86014
85439	86015
85440	86016
85441	86017
85442	86018
85443	86019
85445	86020
86355	86021
86356	86022
86357	86023
86358	86024
86360	86025
86361	86026
86363	86027
86364	86028
86366	86029
86368	86030
86370	86031
86371	86032
86372	86033
86373	86034
86374	86035
86375	86036
86376	86037
86377	86038
86378	86039
86380	86040
86381	86041
85408	85642
118174	117979
118178	117983
146188	140455
118178	117982
57474	57294
57476	57295
57477	57296
146189	140466
146189	140465
146189	140462
146189	140464
146189	140463
118179	117986
118180	117985
57479	57297
57481	57298
57483	57299
57484	57300
57485	57301
57486	57302
57487	57303
57488	57304
57489	57305
57490	57306
57491	57307
57493	57308
57494	57309
146190	140397
146191	140398
146192	140399
146194	140469
135542	135334
135543	135335
135544	135336
135545	135337
135546	135338
146195	140470
146197	140474
105343	105141
105344	105142
105345	105143
368751	367438
368752	367439
368753	367440
368754	367441
368756	367442
368757	367448
368758	367449
368759	367450
368760	367451
368762	367443
368763	367452
368764	367453
368766	367444
368767	367454
368768	367455
368770	367445
368771	367446
368772	367447
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
3857	6	Tarefa20	\N	2010-02-04 12:10:40.245	2010-02-05 22:10:40.245	\N	3867	\N	19
3854	6	Tarefa17	\N	2010-02-04 12:10:40.245	2010-02-04 20:10:40.245	\N	3867	\N	16
3841	6	Tarefa4	\N	2010-02-10 12:10:40.245	2010-02-20 12:10:40.245	\N	3867	\N	3
3847	6	Tarefa10	\N	2010-02-11 12:10:40.245	2010-02-17 12:10:40.245	\N	3867	\N	9
3852	6	Tarefa15	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	14
3840	6	Tarefa3	\N	2010-03-03 12:10:40.245	2010-03-10 12:10:40.245	\N	3867	\N	2
3858	6	Tarefa21	\N	2010-02-04 12:10:40.245	2010-02-06 07:10:40.245	\N	3867	\N	20
3839	6	Tarefa2	\N	2010-02-24 12:10:40.245	2010-03-03 12:10:40.245	\N	3867	\N	1
3867	6	Pedido 2	\N	2010-02-04 12:10:40.245	2010-03-10 12:10:40.245	2010-11-25	\N	\N	\N
2426	5	Módulo de categorización do traballo	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	\N	2427	\N	0
2424	5	Gravación de grupos de horas con criterion requirements en plantillas	\N	2010-02-01 00:00:00	2010-02-03 00:00:00	\N	2426	\N	0
2425	5	Aplicar modelo contendo grupos de horas	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	\N	2426	\N	1
2427	5	Proxecto fin 4º release proxecto	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	2010-02-26	\N	\N	\N
85408	6	Análise	\N	2010-04-21 00:00:00	2010-05-01 16:00:00	\N	85409	\N	16
85386	6	Módulo de importación exportación	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	9
3874	5	tarefa home-maquina	\N	2010-02-04 20:34:28.037	2010-02-13 04:34:28.037	\N	3875	\N	2
3873	5	tarefa máquina	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	\N	3875	\N	1
3872	5	tarefa home	\N	2010-02-04 20:34:28.037	2010-02-11 20:34:28.037	\N	3875	\N	0
3875	6	Pedido con máquinas	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	2010-03-04	\N	\N	\N
56273	48	Módulo de planificación	\N	2009-12-22 00:00:00	2010-02-09 00:00:00	\N	56320	\N	3
56276	48	Módulo de asignación de recursos	\N	2009-12-14 00:00:00	2010-01-30 00:00:00	\N	56320	\N	4
3860	6	Tarefa23	\N	2010-02-04 12:10:40.245	2010-02-07 10:10:40.245	\N	3867	\N	22
3843	6	Tarefa6	\N	2010-02-26 12:10:40.245	2010-03-02 12:10:40.245	\N	3867	\N	5
3851	6	Tarefa14	\N	2010-02-04 12:10:40.245	2010-02-05 09:10:40.245	\N	3867	\N	13
146196	9	Entrega del proyecto en pruebas	\N	2010-12-17 04:36:28.80	2010-12-17 04:36:28.80	\N	146193	\N	9
56278	48	Módulo de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56320	\N	5
56280	48	Módulo de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56320	\N	6
57475	22	Módulo de presentación	\N	2010-02-14 10:21:59.723	2010-02-21 02:21:59.723	\N	57495	\N	10
3842	6	Tarefa5	\N	2010-02-20 12:10:40.245	2010-02-26 12:10:40.245	\N	3867	\N	4
3850	6	Tarefa13	\N	2010-02-04 12:10:40.245	2010-02-24 12:10:40.245	\N	3867	\N	12
3849	6	Tarefa12	\N	2010-02-23 12:10:40.245	2010-03-04 12:10:40.245	\N	3867	\N	11
3861	6	Tarefa24	\N	2010-02-04 12:10:40.245	2010-02-06 14:10:40.245	\N	3867	\N	23
3853	6	Tarefa16	\N	2010-02-04 12:10:40.245	2010-02-05 00:10:40.245	\N	3867	\N	15
3848	6	Tarefa11	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	10
3838	6	Tarefa1	\N	2010-02-04 12:10:40.245	2010-02-10 12:10:40.245	\N	3867	\N	0
3844	6	Tarefa7	\N	2010-02-04 12:10:40.245	2010-02-06 12:10:40.245	\N	3867	\N	6
3856	6	Tarefa19	\N	2010-02-04 12:10:40.245	2010-02-05 14:10:40.245	\N	3867	\N	18
3859	6	Tarefa22	\N	2010-02-04 12:10:40.245	2010-02-07 05:10:40.245	\N	3867	\N	21
3846	6	Tarefa9	\N	2010-02-06 12:10:40.245	2010-02-11 12:10:40.245	\N	3867	\N	8
3862	6	Tarefa25	\N	2010-02-04 12:10:40.245	2010-02-07 10:10:40.245	\N	3867	\N	24
3845	6	Tarefa8	\N	2010-02-20 12:10:40.245	2010-02-23 12:10:40.245	\N	3867	\N	7
3855	6	Tarefa18	\N	2010-02-04 12:10:40.245	2010-02-05 12:10:40.245	\N	3867	\N	17
57478	22	Módulo de arquitectura tecnolóxica	\N	2010-02-25 01:21:59.723	2010-02-28 01:21:59.723	\N	57495	\N	11
57482	22	Módulo de arquivo histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57495	\N	13
57495	22	4º release Navalplan - 2	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	2010-04-18	\N	\N	\N
56284	48	Módulo de xestión da calidade	\N	2009-12-14 00:00:00	2010-01-16 00:00:00	\N	56320	\N	7
56291	48	Módulo de integración con subcontratas	\N	2009-12-26 00:00:00	2010-01-26 00:00:00	\N	56320	\N	8
56297	48	Módulo de importación exportación	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	\N	56320	\N	9
56300	48	Módulo de presentación	\N	2009-12-19 00:00:00	2010-01-16 00:00:00	\N	56320	\N	10
56303	48	Módulo de arquitectura tecnolóxica	\N	2009-12-16 00:00:00	2009-12-29 00:00:00	\N	56320	\N	11
56307	48	Módulo de arquivo histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56320	\N	13
3863	6	Tarefa26	\N	2010-02-04 12:10:40.245	2010-02-07 20:10:40.245	\N	3867	\N	25
3866	6	Tarefa29	\N	2010-02-04 12:10:40.245	2010-02-17 00:10:40.245	\N	3867	\N	28
3865	6	Tarefa28	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	27
3864	6	Tarefa27	\N	2010-02-04 12:10:40.245	2010-02-08 16:10:40.245	\N	3867	\N	26
146197	15	Puesta en producción	\N	2010-12-17 04:36:28.80	2011-01-14 04:36:28.80	\N	146193	\N	13
86386	20	Análise	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-01	86387	\N	0
86387	20	Subcontratación da coordinación	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-05	\N	\N	\N
56321	15	Xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-13 02:21:59.723	\N	56325	\N	0
3868	8	Tarefa 1	\N	2010-02-04 13:36:05.265	2010-02-24 13:36:05.265	\N	3871	\N	0
3869	8	Tarefa 2	\N	2010-02-24 13:36:05.265	2010-03-13 13:36:05.265	\N	3871	\N	1
56322	15	Xestión de roles	\N	2010-02-13 02:21:59.723	2010-02-13 18:21:59.723	\N	56325	\N	1
56323	15	Xestión de perfiles	\N	2010-02-13 18:21:59.723	2010-02-14 10:21:59.723	\N	56325	\N	2
56324	15	Xestión de roles e pedidos	\N	2010-02-14 10:21:59.723	2010-02-16 02:21:59.723	\N	56325	\N	3
3870	8	Tarefa 3	\N	2010-02-04 13:36:05.265	2010-03-12 13:36:05.265	\N	3871	\N	2
57474	15	Imprimir información pantalla do planificador	\N	2010-02-14 10:21:59.723	2010-02-18 10:21:59.723	\N	57475	\N	1
57483	15	Integración de JasperRports	\N	2010-02-15 18:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	0
57484	15	Informes sobre organizacións de traballo	\N	2010-02-16 10:21:59.723	2010-02-17 10:21:59.723	\N	57492	\N	1
57485	15	Informes sobre partes de traballo	\N	2010-02-17 10:21:59.723	2010-02-18 10:21:59.723	\N	57492	\N	2
57486	15	Informes de horas traballadas por un traballador	\N	2010-02-18 10:21:59.723	2010-02-19 10:21:59.723	\N	57492	\N	3
57494	16	Análise	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	16
56325	22	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-16 02:21:59.723	\N	57495	\N	0
57492	22	Módulo de extracción de informes	\N	2010-02-14 10:21:59.723	2010-02-22 10:21:59.723	\N	57495	\N	14
3871	13	Pedido 3	\N	2010-02-04 13:36:05.265	2010-03-13 13:36:05.265	2010-02-25	\N	\N	\N
56290	33	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-01-20 00:00:00	2010-01-26 00:00:00	\N	56291	\N	5
56305	48	Módulo de Documentación da API	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56320	\N	12
86383	12	Planificación	\N	2010-04-21 00:00:00	2010-04-28 00:00:00	\N	86386	\N	0
86384	14	Seguimiento	\N	2010-04-28 00:00:00	2010-05-05 00:00:00	2010-04-28	86386	\N	1
86385	12	Control de calidad	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	\N	86386	\N	2
56259	33	Xestión de perfiles	\N	2009-12-17 00:00:00	2009-12-19 00:00:00	\N	56261	\N	2
56260	33	Xestión de roles e pedidos	\N	2009-12-19 00:00:00	2009-12-26 00:00:00	\N	56261	\N	3
56269	33	Compartir estado pestañas planificación	\N	2010-01-16 00:00:00	2010-01-21 00:00:00	\N	56273	\N	0
56270	33	Técnica de recálculo de asignacións	\N	2010-01-30 00:00:00	2010-02-09 00:00:00	\N	56273	\N	1
56271	33	Filtrado de pedidos e tarefas de un pedido	\N	2010-01-02 00:00:00	2010-01-08 00:00:00	\N	56273	\N	2
56272	33	Modelos de pedidos e planificación	\N	2009-12-22 00:00:00	2010-01-12 00:00:00	\N	56273	\N	3
56277	33	Procura de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56278	\N	0
56279	33	Informe de necesidades de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56280	\N	0
56281	33	Administración de check-lists	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56284	\N	0
105345	3	Filla3	\N	2010-02-12 18:21:59.723	2010-02-16 00:21:59.723	\N	105346	\N	2
85355	5	Recursos Virtuais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85357	\N	0
105346	5	Análise	\N	2010-02-12 18:21:59.723	2010-03-09 18:21:59.723	2010-04-01	105347	\N	0
56326	15	Xestión de código único	\N	2010-02-16 02:21:59.723	2010-02-17 02:21:59.723	\N	56329	\N	0
56327	15	Revisión de formulario de pedidos	\N	2010-02-17 02:21:59.723	2010-02-19 10:21:59.723	\N	56329	\N	1
56282	33	Cubrir formularios de calidade en planificación	\N	2009-12-22 00:00:00	2009-12-26 00:00:00	\N	56284	\N	1
56293	33	Formato de intercambio de pedidos e elementos de pedidos	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56297	\N	1
56328	15	Filtrado no listado de pedidos	\N	2010-02-19 10:21:59.723	2010-02-19 18:21:59.723	\N	56329	\N	2
105347	5	Desc	\N	2010-02-12 18:21:59.723	2010-03-09 18:21:59.723	\N	\N	\N	\N
85356	5	Recursos Virtuais (Continuación)	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85357	\N	1
85351	5	Xestión de código único	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85354	\N	0
85352	5	Revisión de formulario de pedidos	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85354	\N	1
146198	8	Publicación en producción	\N	2011-01-14 04:36:28.80	2011-01-14 04:36:28.80	\N	146193	\N	14
85353	5	Filtrado no listado de pedidos	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85354	\N	2
85375	5	Formato de intercambio	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	1
85358	5	Compartir estado pestañas planificación	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85362	\N	0
85346	5	Xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85350	\N	0
85347	5	Xestión de roles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	1
85348	5	Xestión de perfiles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	2
85349	5	Xestión de roles e pedidos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85350	\N	3
85409	6	4º release Navalplan - 3	\N	2010-04-21 00:00:00	2010-06-05 00:00:00	2010-05-27	\N	\N	\N
56294	33	Formato de intercambio de información de avance	\N	2009-12-25 00:00:00	2010-01-01 00:00:00	\N	56297	\N	2
56295	33	Formato de intercambio de recursos	\N	2009-12-14 00:00:00	2009-12-30 00:00:00	\N	56297	\N	3
56296	33	Formato de intercambio de materiais	\N	2009-12-30 00:00:00	2010-02-12 00:00:00	\N	56297	\N	4
56298	33	Imprimir o diagrama de Gantt en varias páxinas	\N	2009-12-19 00:00:00	2009-12-31 00:00:00	\N	56300	\N	0
56299	33	Imprimir información pantalla do planificador	\N	2009-12-31 00:00:00	2010-01-16 00:00:00	\N	56300	\N	1
56301	33	Desenvolvemento de paquetes debian	\N	2009-12-23 00:00:00	2009-12-29 00:00:00	\N	56303	\N	0
56302	33	Enlazar a axuda de usuario	\N	2009-12-16 00:00:00	2009-12-23 00:00:00	\N	56303	\N	1
105343	3	Filla2	\N	2010-02-12 18:21:59.723	2010-03-09 18:21:59.723	2010-04-01	105346	\N	0
105344	3	Filla1	\N	2010-02-12 18:21:59.723	2010-02-16 12:21:59.723	\N	105346	\N	1
56258	33	Xestión de roles	\N	2009-12-15 00:00:00	2009-12-17 00:00:00	\N	56261	\N	1
56330	15	Recursos Virtuais	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	56332	\N	0
56331	15	Recursos Virtuais (Continuación)	\N	2010-02-14 10:21:59.723	2010-02-14 18:21:59.723	\N	56332	\N	1
56333	15	Compartir estado pestañas planificación	\N	2010-02-14 18:21:59.723	2010-02-15 18:21:59.723	\N	56337	\N	0
56334	15	Técnica de recálculo de asignacións	\N	2010-02-15 18:21:59.723	2010-02-17 18:21:59.723	\N	56337	\N	1
105951	1	Entrega	\N	2010-03-17 12:55:16.462	2010-03-17 12:55:16.462	\N	\N	\N	\N
105950	1	Fito intermedio	\N	2010-03-03 13:12:10.397	2010-03-03 13:12:10.397	\N	\N	\N	\N
56283	33	Incorporar listas de chequeo nos modelos de planificación	\N	2010-01-12 00:00:00	2010-01-16 00:00:00	\N	56284	\N	2
56335	15	Filtrado de pedidos e tarefas de un pedido	\N	2010-02-17 18:21:59.723	2010-02-18 22:21:59.723	\N	56337	\N	2
56336	15	Modelos de pedidos e planificación	\N	2010-02-18 22:21:59.723	2010-02-23 22:21:59.723	\N	56337	\N	3
56285	33	Administración das subcontratas	\N	2009-12-26 00:00:00	2010-01-07 00:00:00	\N	56291	\N	0
56286	33	Formato de intercambio	\N	2010-01-01 00:00:00	2010-01-05 00:00:00	\N	56291	\N	1
56287	33	Fluxo de importación/exportación	\N	2010-01-05 00:00:00	2010-01-09 00:00:00	\N	56291	\N	2
56351	15	Fluxo de importación/exportación	\N	2010-02-13 10:21:59.723	2010-02-14 18:21:59.723	\N	56355	\N	2
56352	15	Interfaz de xestión de Subcontratación no pedido	\N	2010-02-14 18:21:59.723	2010-02-16 10:21:59.723	\N	56355	\N	3
56288	33	Interfaz de xestión de Subcontratación no pedido	\N	2010-01-09 00:00:00	2010-01-16 00:00:00	\N	56291	\N	3
56289	33	Convertir en fitos as subcontratacións	\N	2010-01-16 00:00:00	2010-01-20 00:00:00	\N	56291	\N	4
56353	15	Convertir en fitos as subcontratacións	\N	2010-02-16 10:21:59.723	2010-02-17 02:21:59.723	\N	56355	\N	4
56354	15	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-02-17 02:21:59.723	2010-02-18 10:21:59.723	\N	56355	\N	5
56292	33	Definir workflow de pedidos para ERP	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56297	\N	0
56356	15	Definir workflow de pedidos para ERP	\N	2010-02-18 10:21:59.723	2010-02-19 01:21:59.723	\N	57472	\N	0
56357	15	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-02-19 01:21:59.723	2010-02-21 01:21:59.723	\N	57472	\N	1
57469	15	Formato de intercambio de información de avance	\N	2010-02-21 01:21:59.723	2010-02-22 17:21:59.723	\N	57472	\N	2
57470	15	Formato de intercambio de recursos	\N	2010-02-22 17:21:59.723	2010-02-23 17:21:59.723	\N	57472	\N	3
57471	15	Formato de intercambio de materiais	\N	2010-02-23 17:21:59.723	2010-02-25 01:21:59.723	\N	57472	\N	4
57473	15	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-02-18 10:21:59.723	2010-02-21 02:21:59.723	\N	57475	\N	0
57476	15	Desenvolvemento de paquetes debian	\N	2010-02-25 01:21:59.723	2010-02-26 09:21:59.723	\N	57478	\N	0
57477	15	Enlazar a axuda de usuario	\N	2010-02-26 09:21:59.723	2010-02-28 01:21:59.723	\N	57478	\N	1
56332	22	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-14 18:21:59.723	\N	57495	\N	2
56337	22	Módulo de planificación	\N	2010-02-14 18:21:59.723	2010-02-23 22:21:59.723	\N	57495	\N	3
56348	22	Módulo de xestión da calidade	\N	2010-02-18 18:21:59.723	2010-02-23 10:21:59.723	\N	57495	\N	7
57472	22	Módulo de importación exportación	\N	2010-02-18 10:21:59.723	2010-02-25 01:21:59.723	\N	57495	\N	9
85345	2	Entrega	\N	2010-04-01 18:21:59.723	2010-04-01 18:21:59.723	\N	\N	\N	\N
118183	2	Xestión de usuarios	\N	2010-09-01 00:00:00	2010-09-02 00:00:00	\N	118187	\N	0
118184	2	Xestión de roles	\N	2010-09-01 00:00:00	2010-09-03 00:00:00	\N	118187	\N	1
118185	2	Xestión de perfiles	\N	2010-09-01 00:00:00	2010-09-03 00:00:00	\N	118187	\N	2
118186	2	Xestión de roles e pedidos	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118187	\N	3
118188	2	Xestión de código único	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118191	\N	0
118246	3	Pedido exemplo modelo presentacionr	\N	2010-09-01 00:00:00	2010-10-03 00:00:00	2010-10-28	\N	\N	\N
86364	2	Enlazar a axuda de usuario	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86365	\N	1
86366	2	Documentación das APIs públicas	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86367	\N	0
86368	2	Pasar pedidos a histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86369	\N	0
56257	34	Xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-15 00:00:00	2009-12-15	56261	\N	0
86370	2	Integración de JasperRports	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	86379	\N	0
86371	2	Informes sobre organizacións de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	1
86372	2	Informes sobre partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	2
86373	2	Informes de horas traballadas por un traballador	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	3
56310	33	Informes sobre partes de traballo	\N	2010-01-01 00:00:00	2010-01-06 00:00:00	\N	56317	\N	2
56311	33	Informes de horas traballadas por un traballador	\N	2009-12-16 00:00:00	2009-12-19 00:00:00	\N	56317	\N	3
86374	2	Lista de avances de planificación da empresa	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	4
56312	33	Lista de avances de planificación da empresa	\N	2009-12-29 00:00:00	2010-01-01 00:00:00	\N	56317	\N	4
86375	2	Lista de avances de traballo da empresa	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	5
86376	2	Informes de horas estimadas/horas realizadas	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	6
86377	2	Horas realizadas organizadas por tipo de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	7
86378	2	Informes de traballador indicando custos por hora	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	8
56313	33	Lista de avances de traballo da empresa	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	5
86380	2	Coordinación	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	\N	86382	\N	15
86381	2	Análise	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	\N	86382	\N	16
85414	3	Módulo de xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	0
85418	3	Módulo de organizacións de traballo	\N	2010-05-26 00:00:00	2010-05-28 08:00:00	\N	86382	\N	1
85421	3	Módulo de xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	2
85426	3	Módulo de planificación	\N	2010-05-26 00:00:00	2010-05-31 00:00:00	\N	86382	\N	3
85429	3	Módulo de asignación de recursos	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	4
85431	3	Módulo de partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	5
85433	3	Módulo de materiais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	6
85437	3	Módulo de xestión da calidade	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86382	\N	7
85444	3	Módulo de integración con subcontratas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	86382	\N	8
86359	3	Módulo de importación exportación	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86382	\N	9
86362	3	Módulo de presentación	\N	2010-05-26 00:00:00	2010-05-30 00:00:00	\N	86382	\N	10
86365	3	Módulo de arquitectura tecnolóxica	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	11
86367	3	Módulo de Documentación da API	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	12
56314	33	Informes de horas estimadas/horas realizadas	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	6
56315	33	Horas realizadas organizadas por tipo de traballo	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	7
56316	33	Informes de traballador indicando custos por hora	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	8
118189	2	Revisión de formulario de pedidos	\N	2010-09-01 00:00:00	2010-09-08 00:00:00	\N	118191	\N	1
56318	33	Coordinación	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	15
85359	5	Técnica de recálculo de asignacións	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85362	\N	1
85360	5	Filtrado de pedidos e tarefas de un pedido	\N	2010-04-21 00:00:00	2010-04-22 04:00:00	\N	85362	\N	2
85361	5	Modelos de pedidos e planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85362	\N	3
85366	5	Procura de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85367	\N	0
118190	2	Filtrado no listado de pedidos	\N	2010-09-01 00:00:00	2010-09-02 00:00:00	\N	118191	\N	2
56319	33	Análise	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	16
118173	15	Subtarefa nivel 2 2.1	\N	2010-02-22 00:00:00	2010-03-06 00:00:00	\N	118175	\N	0
118192	2	Recursos Virtuais	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118194	\N	0
118174	15	Subtarefa nivel 2 2.2	\N	2010-03-06 00:00:00	2010-03-23 00:00:00	\N	118175	\N	1
118170	15	Subtarefa 1 nivel 2	\N	2010-02-22 00:00:00	2010-03-06 00:00:00	\N	118172	\N	0
118193	2	Recursos Virtuais (Continuación)	\N	2010-09-01 00:00:00	2010-09-02 00:00:00	\N	118194	\N	1
56261	48	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-26 00:00:00	\N	56320	\N	0
118171	15	Subtarefa 2 nivel 2	\N	2010-03-06 00:00:00	2010-03-23 00:00:00	\N	118172	\N	1
56265	48	Módulo de organizacións de traballo	\N	2009-12-22 00:00:00	2010-01-20 00:00:00	\N	56320	\N	1
56268	48	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56320	\N	2
56317	48	Módulo de extracción de informes	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	56320	\N	14
56320	48	4º release Navalplan	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	2010-02-17	\N	\N	\N
118195	2	Compartir estado pestañas planificación	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118199	\N	0
118196	2	Técnica de recálculo de asignacións	\N	2010-09-01 00:00:00	2010-09-07 00:00:00	\N	118199	\N	1
118172	21	Tarefa nivel 1	\N	2010-02-22 00:00:00	2010-03-23 00:00:00	\N	118176	\N	0
118175	21	Tarefa nivel 1 - 2	\N	2010-02-22 00:00:00	2010-03-23 00:00:00	\N	118176	\N	1
85378	5	Convertir en fitos as subcontratacións	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	4
56262	33	Xestión de código único	\N	2009-12-22 00:00:00	2009-12-25 00:00:00	\N	56265	\N	0
56263	33	Revisión de formulario de pedidos	\N	2010-01-08 00:00:00	2010-01-19 00:00:00	\N	56265	\N	1
85379	5	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	5
56264	33	Filtrado no listado de pedidos	\N	2010-01-19 00:00:00	2010-01-20 00:00:00	\N	56265	\N	2
85387	5	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85389	\N	0
85388	5	Imprimir información pantalla do planificador	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85389	\N	1
56266	33	Recursos Virtuais	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56268	\N	0
56338	15	Interpolación polinómica na asignación avanzada	\N	2010-02-12 18:21:59.723	2010-02-13 18:21:59.723	\N	56340	\N	0
56267	33	Recursos Virtuais (Continuación)	\N	2009-12-19 00:00:00	2009-12-22 00:00:00	\N	56268	\N	1
118177	6	Tarefa 3 nivel 1	\N	2010-02-22 00:00:00	2010-02-25 18:00:00	\N	\N	\N	\N
86369	3	Módulo de arquivo histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86382	\N	13
86379	3	Módulo de extracción de informes	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86382	\N	14
85381	5	Definir workflow de pedidos para ERP	\N	2010-04-21 00:00:00	2010-04-21 15:00:00	\N	85386	\N	0
85382	5	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85386	\N	1
85383	5	Formato de intercambio de información de avance	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85386	\N	2
56339	15	Asignación avanzada asignación automática configuración	\N	2010-02-13 18:21:59.723	2010-02-15 10:21:59.723	\N	56340	\N	1
56343	15	Informe de necesidades de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	56344	\N	0
85370	5	Administración de check-lists	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85373	\N	0
85371	5	Cubrir formularios de calidade en planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	1
85372	5	Incorporar listas de chequeo nos modelos de planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	2
85374	5	Administración das subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85380	\N	0
85384	5	Formato de intercambio de recursos	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85386	\N	3
85385	5	Formato de intercambio de materiais	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85386	\N	4
85368	5	Informe de necesidades de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85369	\N	0
85363	5	Interpolación polinómica na asignación avanzada	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85365	\N	0
85364	5	Asignación avanzada asignación automática configuración	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85365	\N	1
56274	33	Interpolación polinómica na asignación avanzada	\N	2010-01-27 00:00:00	2010-01-30 00:00:00	\N	56276	\N	0
56275	33	Asignación avanzada asignación automática configuración	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56276	\N	1
56304	33	Documentación das APIs públicas	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56305	\N	0
56349	15	Administración das subcontratas	\N	2010-02-16 02:21:59.723	2010-02-18 18:21:59.723	\N	56355	\N	0
56306	33	Pasar pedidos a histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56307	\N	0
85376	5	Fluxo de importación/exportación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	2
85377	5	Interfaz de xestión de Subcontratación no pedido	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85380	\N	3
56308	33	Integración de JasperRports	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56317	\N	0
56309	33	Informes sobre organizacións de traballo	\N	2010-01-06 00:00:00	2010-01-09 00:00:00	\N	56317	\N	1
57479	15	Documentación das APIs públicas	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57480	\N	0
57493	15	Coordinación	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	15
56329	22	Módulo de organizacións de traballo	\N	2010-02-16 02:21:59.723	2010-02-19 18:21:59.723	\N	57495	\N	1
56340	22	Módulo de asignación de recursos	\N	2010-02-12 18:21:59.723	2010-02-15 10:21:59.723	\N	57495	\N	4
56344	22	Módulo de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	6
56355	22	Módulo de integración con subcontratas	\N	2010-02-12 18:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	8
57480	22	Módulo de Documentación da API	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57495	\N	12
85410	2	Xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85414	\N	0
85411	2	Xestión de roles	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85414	\N	1
85412	2	Xestión de perfiles	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85414	\N	2
85413	2	Xestión de roles e pedidos	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85414	\N	3
85415	2	Xestión de código único	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85418	\N	0
85416	2	Revisión de formulario de pedidos	\N	2010-05-26 00:00:00	2010-05-28 08:00:00	\N	85418	\N	1
85417	2	Filtrado no listado de pedidos	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85418	\N	2
85419	2	Recursos Virtuais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85421	\N	0
85420	2	Recursos Virtuais (Continuación)	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85421	\N	1
85422	2	Compartir estado pestañas planificación	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85426	\N	0
85423	2	Técnica de recálculo de asignacións	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	85426	\N	1
85424	2	Filtrado de pedidos e tarefas de un pedido	\N	2010-05-26 00:00:00	2010-05-27 04:00:00	\N	85426	\N	2
85425	2	Modelos de pedidos e planificación	\N	2010-05-26 00:00:00	2010-05-31 00:00:00	\N	85426	\N	3
85427	2	Interpolación polinómica na asignación avanzada	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85429	\N	0
85428	2	Asignación avanzada asignación automática configuración	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85429	\N	1
85430	2	Procura de partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85431	\N	0
85432	2	Informe de necesidades de materiais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85433	\N	0
85434	2	Administración de check-lists	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	85437	\N	0
85435	2	Cubrir formularios de calidade en planificación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85437	\N	1
85436	2	Incorporar listas de chequeo nos modelos de planificación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85437	\N	2
85438	2	Administración das subcontratas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	85444	\N	0
85439	2	Formato de intercambio	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85444	\N	1
85440	2	Fluxo de importación/exportación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85444	\N	2
85441	2	Interfaz de xestión de Subcontratación no pedido	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85444	\N	3
85442	2	Convertir en fitos as subcontratacións	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85444	\N	4
85443	2	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85444	\N	5
85445	2	Definir workflow de pedidos para ERP	\N	2010-05-26 00:00:00	2010-05-26 15:00:00	\N	86359	\N	0
118178	7	Tarefa 3 nivel 1	\N	2010-02-22 00:00:00	2010-03-01 12:00:00	\N	118176	\N	2
85357	6	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	2
86382	3	4º release Navalplan - 4	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	2010-07-21	\N	\N	\N
85354	6	Módulo de organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85409	\N	1
85380	6	Módulo de integración con subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85409	\N	8
85407	7	Coordinación	\N	2010-04-21 00:00:00	2010-06-05 00:00:00	\N	85409	\N	15
85396	6	Módulo de arquivo histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85409	\N	13
85395	5	Pasar pedidos a histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85396	\N	0
56350	15	Formato de intercambio	\N	2010-02-12 18:21:59.723	2010-02-13 10:21:59.723	\N	56355	\N	1
97365	6	Tarefa 2	\N	2010-01-15 00:00:00	2010-02-26 00:00:00	\N	97366	\N	1
97364	6	Tarefa 1	\N	2010-01-01 00:00:00	2010-01-15 00:00:00	\N	97366	\N	0
97366	6	Pedido probas recursos virtuais	\N	2010-01-01 00:00:00	2010-02-26 00:00:00	2010-03-16	\N	\N	\N
118224	2	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-09-01 00:00:00	2010-09-09 00:00:00	\N	118226	\N	0
85397	6	Integración de JasperRports	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85406	\N	0
56341	15	Procura de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	56342	\N	0
97372	26	Tarefa raíz 2	\N	2010-02-16 12:55:16.462	2010-03-15 12:55:16.462	\N	97373	\N	1
56345	15	Administración de check-lists	\N	2010-02-18 18:21:59.723	2010-02-20 18:21:59.723	\N	56348	\N	0
56346	15	Cubrir formularios de calidade en planificación	\N	2010-02-20 18:21:59.723	2010-02-22 02:21:59.723	\N	56348	\N	1
56347	15	Incorporar listas de chequeo nos modelos de planificación	\N	2010-02-22 02:21:59.723	2010-02-23 10:21:59.723	\N	56348	\N	2
118179	3	fillo2	\N	2010-02-22 00:00:00	2010-02-25 03:00:00	\N	118181	\N	0
97373	26	Pedido proba virtual pintor	\N	2010-02-16 12:55:16.462	2010-03-17 12:55:16.462	2010-03-16	\N	\N	\N
118181	5	Tarefa 3 nivel 1	\N	2010-02-22 00:00:00	2010-02-25 18:00:00	2010-03-01	118182	\N	0
86355	2	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86359	\N	1
86356	2	Formato de intercambio de información de avance	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86359	\N	2
86357	2	Formato de intercambio de recursos	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86359	\N	3
86358	2	Formato de intercambio de materiais	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86359	\N	4
118182	5	Subcontratacion	\N	2010-02-22 00:00:00	2010-02-25 18:00:00	2010-03-01	\N	\N	\N
86360	2	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	86362	\N	0
97367	30	Tarefa filla 1.1	\N	2010-02-16 00:00:00	2010-03-03 00:00:00	\N	97369	\N	0
86361	2	Imprimir información pantalla do planificador	\N	2010-05-26 00:00:00	2010-05-30 00:00:00	\N	86362	\N	1
97369	26	Tarefa raíz 1	\N	2010-02-16 12:55:16.462	2010-03-17 12:55:16.462	\N	97373	\N	0
57481	15	Pasar pedidos a histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57482	\N	0
97368	30	Tarefa filla 1.2	\N	2010-03-03 00:00:00	2010-03-17 00:00:00	\N	97369	\N	1
97370	30	Tarefa filla 2.1	\N	2010-02-17 00:00:00	2010-02-28 00:00:00	\N	97372	\N	0
97371	30	Tarefa filla 2.2	\N	2010-02-28 00:00:00	2010-03-15 00:00:00	\N	97372	\N	1
86363	2	Desenvolvemento de paquetes debian	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86365	\N	0
57487	15	Lista de avances de planificación da empresa	\N	2010-02-19 10:21:59.723	2010-02-20 10:21:59.723	\N	57492	\N	4
57488	15	Lista de avances de traballo da empresa	\N	2010-02-20 10:21:59.723	2010-02-21 10:21:59.723	\N	57492	\N	5
57489	15	Informes de horas estimadas/horas realizadas	\N	2010-02-21 10:21:59.723	2010-02-22 10:21:59.723	\N	57492	\N	6
85373	6	Módulo de xestión da calidade	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	7
85406	6	Módulo de extracción de informes	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85409	\N	14
57490	15	Horas realizadas organizadas por tipo de traballo	\N	2010-02-15 10:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	7
85398	5	Informes sobre organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	1
85399	5	Informes sobre partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	2
85400	5	Informes de horas traballadas por un traballador	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	3
85401	5	Lista de avances de planificación da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	4
85402	5	Lista de avances de traballo da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	5
85403	5	Informes de horas estimadas/horas realizadas	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	6
85404	5	Horas realizadas organizadas por tipo de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	7
85405	5	Informes de traballador indicando custos por hora	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	8
85362	6	Módulo de planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85409	\N	3
85367	6	Módulo de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	5
85394	6	Módulo de Documentación da API	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	12
85393	5	Documentación das APIs públicas	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85394	\N	0
85350	6	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	0
85392	6	Módulo de arquitectura tecnolóxica	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	11
85390	5	Desenvolvemento de paquetes debian	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85392	\N	0
85391	5	Enlazar a axuda de usuario	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85392	\N	1
85389	6	Módulo de presentación	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85409	\N	10
85369	6	Módulo de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	6
85365	6	Módulo de asignación de recursos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	4
57491	15	Informes de traballador indicando custos por hora	\N	2010-02-14 10:21:59.723	2010-02-15 10:21:59.723	\N	57492	\N	8
56342	22	Módulo de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	57495	\N	5
118180	3	fillo1	\N	2010-02-22 00:00:00	2010-02-25 18:00:00	\N	118181	\N	1
118197	2	Filtrado de pedidos e tarefas de un pedido	\N	2010-09-01 00:00:00	2010-09-04 12:00:00	\N	118199	\N	2
118198	2	Modelos de pedidos e planificación	\N	2010-09-01 00:00:00	2010-09-16 00:00:00	\N	118199	\N	3
118200	2	Interpolación polinómica na asignación avanzada	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118202	\N	0
118201	2	Asignación avanzada asignación automática configuración	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118202	\N	1
118203	2	Procura de partes de traballo	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118204	\N	0
118205	2	Informe de necesidades de materiais	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118206	\N	0
118207	2	Administración de check-lists	\N	2010-09-01 00:00:00	2010-09-07 00:00:00	\N	118210	\N	0
118208	2	Cubrir formularios de calidade en planificación	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118210	\N	1
118209	2	Incorporar listas de chequeo nos modelos de planificación	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118210	\N	2
118211	2	Administración das subcontratas	\N	2010-09-01 00:00:00	2010-09-09 00:00:00	\N	118217	\N	0
118212	2	Formato de intercambio	\N	2010-09-01 00:00:00	2010-09-03 00:00:00	\N	118217	\N	1
118213	2	Fluxo de importación/exportación	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118217	\N	2
118214	2	Interfaz de xestión de Subcontratación no pedido	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118217	\N	3
118215	2	Convertir en fitos as subcontratacións	\N	2010-09-01 00:00:00	2010-09-03 00:00:00	\N	118217	\N	4
118216	2	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118217	\N	5
118218	2	Definir workflow de pedidos para ERP	\N	2010-09-01 00:00:00	2010-09-02 21:00:00	\N	118223	\N	0
118219	2	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-09-01 00:00:00	2010-09-07 00:00:00	\N	118223	\N	1
118220	2	Formato de intercambio de información de avance	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118223	\N	2
118221	2	Formato de intercambio de recursos	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118223	\N	3
118222	2	Formato de intercambio de materiais	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118223	\N	4
118225	2	Imprimir información pantalla do planificador	\N	2010-09-01 00:00:00	2010-09-13 00:00:00	\N	118226	\N	1
118227	2	Desenvolvemento de paquetes debian	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118229	\N	0
118228	2	Enlazar a axuda de usuario	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118229	\N	1
118230	2	Documentación das APIs públicas	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118231	\N	0
118232	2	Pasar pedidos a histórico	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118233	\N	0
118234	2	Integración de JasperRports	\N	2010-09-01 00:00:00	2010-09-03 00:00:00	\N	118243	\N	0
118235	2	Informes sobre organizacións de traballo	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	1
118236	2	Informes sobre partes de traballo	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	2
118237	2	Informes de horas traballadas por un traballador	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	3
118238	2	Lista de avances de planificación da empresa	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	4
118239	2	Lista de avances de traballo da empresa	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	5
118240	2	Informes de horas estimadas/horas realizadas	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	6
118241	2	Horas realizadas organizadas por tipo de traballo	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	7
118242	2	Informes de traballador indicando custos por hora	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118243	\N	8
118244	2	Coordinación	\N	2010-09-01 00:00:00	2010-10-03 00:00:00	\N	118246	\N	15
118245	2	Análise	\N	2010-09-01 00:00:00	2010-10-03 00:00:00	\N	118246	\N	16
118187	3	Módulo de xestión de usuarios	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	0
118191	3	Módulo de organizacións de traballo	\N	2010-09-01 00:00:00	2010-09-08 00:00:00	\N	118246	\N	1
118194	3	Módulo de xestión de usuarios	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	2
118199	3	Módulo de planificación	\N	2010-09-01 00:00:00	2010-09-16 00:00:00	\N	118246	\N	3
118202	3	Módulo de asignación de recursos	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	4
118204	3	Módulo de partes de traballo	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	5
118206	3	Módulo de materiais	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	6
118210	3	Módulo de xestión da calidade	\N	2010-09-01 00:00:00	2010-09-07 00:00:00	\N	118246	\N	7
118217	3	Módulo de integración con subcontratas	\N	2010-09-01 00:00:00	2010-09-09 00:00:00	\N	118246	\N	8
118223	3	Módulo de importación exportación	\N	2010-09-01 00:00:00	2010-09-07 00:00:00	\N	118246	\N	9
118226	3	Módulo de presentación	\N	2010-09-01 00:00:00	2010-09-13 00:00:00	\N	118246	\N	10
118229	3	Módulo de arquitectura tecnolóxica	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	11
118231	3	Módulo de Documentación da API	\N	2010-09-01 00:00:00	2010-09-06 00:00:00	\N	118246	\N	12
118233	3	Módulo de arquivo histórico	\N	2010-09-01 00:00:00	2010-09-05 00:00:00	\N	118246	\N	13
118243	3	Módulo de extracción de informes	\N	2010-09-01 00:00:00	2010-09-04 00:00:00	\N	118246	\N	14
135543	12	Tarefa 2	\N	2010-03-27 13:04:40.623	2010-04-28 13:04:40.623	\N	135547	\N	1
135544	12	Tarefa 3 	\N	2010-03-27 13:04:40.623	2010-04-28 13:04:40.623	\N	135547	\N	2
135542	12	Tarefa 1	\N	2010-02-25 13:04:40.623	2010-03-27 13:04:40.623	\N	135547	\N	0
118176	21	pedido exemplo	\N	2010-02-22 00:00:00	2010-03-23 00:00:00	2010-03-22	\N	\N	\N
135546	12	Tarefa 5	\N	2010-04-28 13:04:40.623	2010-05-27 13:04:40.623	\N	135547	\N	4
135545	12	Tarefa 4	\N	2010-03-27 13:04:40.623	2010-04-28 13:04:40.623	\N	135547	\N	3
135547	12	Pedido Exemplo	\N	2010-02-25 13:04:40.623	2010-05-27 13:04:40.623	\N	\N	\N	\N
146147	50	CU – Formulario de compra como invitado	\N	2010-06-26 23:17:59.092	2010-06-30 23:17:59.092	\N	146153	\N	0
146148	50	CU – Registrarse como usuario del sistema	\N	2010-06-20 23:17:59.092	2010-06-23 23:17:59.092	\N	146153	\N	1
146149	50	CU – Acceder al sistema	\N	2010-06-23 23:17:59.092	2010-06-24 23:17:59.092	\N	146153	\N	2
146150	50	CU – Visualizar datos históricos de compras	\N	2010-09-09 00:00:00	2010-09-11 00:00:00	\N	146153	\N	3
146151	50	CU – Administración de datos personales del usuario	\N	2010-06-24 23:17:59.092	2010-06-26 23:17:59.092	\N	146153	\N	4
146152	50	CU – Información de cupones de descuento	\N	2010-09-11 00:00:00	2010-09-16 00:00:00	\N	146153	\N	5
146154	50	Arquitectura	\N	2010-06-10 00:00:00	2010-07-03 00:00:00	\N	146193	\N	1
146155	50	CU – Listar sesiones disponibles para evento	\N	2010-07-29 00:00:00	2010-07-31 00:00:00	\N	146175	\N	0
146156	50	CU – Mostrar imagen aforo teatro	\N	2010-07-31 00:00:00	2010-08-03 00:00:00	\N	146175	\N	1
146157	50	CU – Listar tipo de zonas del recinto	\N	2010-08-03 00:00:00	2010-08-06 00:00:00	\N	146175	\N	2
146158	50	CU – Comprobar y mostrar entradas disponibles por zonas del recinto 	\N	2010-08-06 00:00:00	2010-08-11 00:00:00	\N	146175	\N	3
146159	50	CU – Seleccionar zona del recinto	\N	2010-08-11 00:00:00	2010-08-12 00:00:00	\N	146175	\N	4
146160	50	CU – Comprobar y mostrar entradas disponibles por tipo de entrada	\N	2010-08-12 00:00:00	2010-08-17 00:00:00	\N	146175	\N	5
146161	50	CU – Seleccionar tipo de entrada	\N	2010-08-17 00:00:00	2010-08-18 00:00:00	\N	146175	\N	6
146162	50	CU – Comprobar y mostrar precio entradas disponibles por zonas del recinto.	\N	2010-08-18 00:00:00	2010-08-20 00:00:00	\N	146175	\N	7
146163	50	CU – Añadir a carrito número de entradas por tipo de entrada	\N	2010-08-20 00:00:00	2010-08-24 00:00:00	\N	146175	\N	8
146164	50	CU – Añadir a carrito asiento automáticamente	\N	2010-08-24 00:00:00	2010-08-31 00:00:00	\N	146175	\N	9
146165	50	CU – Añadir a carrito asiento manualmente.	\N	2010-08-31 00:00:00	2010-09-07 00:00:00	\N	146175	\N	10
146166	50	CU – Añadir a carrito producto sin elección de asiento	\N	2010-09-07 00:00:00	2010-09-08 00:00:00	\N	146175	\N	11
146167	50	CU – Seleccionar modo de compra (anónimo o registrado)	\N	2010-09-08 00:00:00	2010-09-09 00:00:00	\N	146175	\N	12
146168	50	CU – Ver contenido del carrito de la compra	\N	2010-09-09 00:00:00	2010-09-10 00:00:00	\N	146175	\N	13
146176	50	CU – Listar recintos	\N	2010-06-10 00:00:00	2010-06-15 00:00:00	\N	146186	\N	0
146177	50	CU – Listado de eventos por filtrado de categoría, tema, localidad, nombre del evento, recinto y/o fecha	\N	2010-06-15 00:00:00	2010-06-23 00:00:00	\N	146186	\N	1
146178	50	CU – Listar temas de eventos	\N	2010-06-23 00:00:00	2010-06-26 00:00:00	\N	146186	\N	2
146179	50	CU – Listar eventos por recintos	\N	2010-06-26 00:00:00	2010-07-01 00:00:00	\N	146186	\N	3
146180	50	CU – Visualizar datos de evento	\N	2010-07-01 00:00:00	2010-07-03 00:00:00	\N	146186	\N	4
146181	50	CU – Visualizar más información de evento	\N	2010-07-03 00:00:00	2010-07-06 00:00:00	\N	146186	\N	5
146182	50	CU – Mostrado de calendario mensual de eventos	\N	2010-07-06 00:00:00	2010-07-10 00:00:00	\N	146186	\N	6
146183	50	Plugin de búsqueda simple de eventos	\N	2010-07-10 00:00:00	2010-07-15 00:00:00	\N	146186	\N	7
146184	50	Plugin de búsqueda avanzada de eventos	\N	2010-07-15 00:00:00	2010-07-20 00:00:00	\N	146186	\N	8
146185	50	Pruebas y resolución de errores	\N	2010-07-20 00:00:00	2010-07-29 00:00:00	\N	146186	\N	9
146187	50	Módulo de interpretación de aforos	\N	2010-07-27 23:14:09.60	2010-10-21 23:14:09.60	\N	146193	\N	4
146188	50	Módulo de arquitectura de la información e implantación del diseño	\N	2010-09-15 00:00:00	2010-11-10 00:00:00	\N	146193	\N	5
146189	50	Infraestructura del proyecto	\N	2010-07-03 00:00:00	2010-09-15 00:00:00	\N	146193	\N	6
146190	50	Diseño	\N	2010-06-10 00:00:00	2010-07-01 00:00:00	\N	146193	\N	7
146191	50	Pruebas de integración	\N	2010-11-10 00:00:00	2010-12-14 00:00:00	\N	146193	\N	8
146192	50	Documentación	\N	2010-12-14 00:00:00	2010-12-28 00:00:00	\N	146193	\N	10
146194	49	Coordinación	\N	2010-06-10 00:00:00	2010-12-18 00:00:00	\N	146193	\N	11
146195	49	Análise	\N	2010-06-10 00:00:00	2010-12-18 00:00:00	\N	146193	\N	12
146153	62	Módulo de gestión de usuarios	\N	2010-06-20 23:17:59.092	2010-09-16 00:00:00	\N	146193	\N	0
146175	62	Módulo de compra de entradas	\N	2010-07-29 00:00:00	2010-11-03 00:00:00	\N	146193	\N	2
146186	62	Módulo de eventos y recintos	\N	2010-06-10 00:00:00	2010-07-29 00:00:00	\N	146193	\N	3
368769	9	Módulo de gestión de partes de horas	\N	2010-05-13 09:39:02.576	2010-05-19 09:39:02.576	\N	368773	\N	3
368766	8	Editar partes de trabajo	\N	2010-05-13 09:39:02.576	2010-05-14 09:39:02.576	\N	368769	\N	0
368767	8	Añadir parte de horas a tarea	\N	2010-05-14 09:39:02.576	2010-05-16 09:39:02.576	\N	368769	\N	1
368768	8	Listar partes de trabajo	\N	2010-05-16 09:39:02.576	2010-05-19 09:39:02.576	\N	368769	\N	2
368761	9	Módulo de gestión de la planificación	\N	2010-05-04 15:39:02.576	2010-05-28 21:39:02.576	\N	368773	\N	1
368756	8	Mostrado de tareas y dependencias	\N	2010-05-19 15:39:02.576	2010-05-22 15:39:02.576	\N	368761	\N	0
368757	8	Edición de tareas	\N	2010-05-04 15:39:02.576	2010-05-14 15:39:02.576	\N	368761	\N	1
368758	8	Creación de dependencias	\N	2010-05-14 15:39:02.576	2010-05-19 15:39:02.576	\N	368761	\N	2
368759	8	Asignación de recursos	\N	2010-05-22 15:39:02.576	2010-05-25 03:39:02.576	\N	368761	\N	3
368760	8	Movimiento de tareas	\N	2010-05-25 03:39:02.576	2010-05-28 21:39:02.576	\N	368761	\N	4
368770	8	Coordinación	\N	2010-04-21 15:39:02.576	2010-07-28 15:39:02.576	\N	368773	\N	4
368773	9	Desarrollo de un planificador	\N	2010-04-21 15:39:02.576	2010-07-31 15:39:02.576	2010-12-31	\N	\N	\N
146169	50	CU – Pagar carrito de la compra registrado	\N	2010-09-10 00:00:00	2010-09-16 00:00:00	\N	146175	\N	14
146170	50	CU – Pagar carrito de la compra anónimamente	\N	2010-09-16 00:00:00	2010-09-18 00:00:00	\N	146175	\N	15
146171	50	CU – Realizar pago vía pasarela de pago	\N	2010-09-18 00:00:00	2010-10-06 00:00:00	\N	146175	\N	16
146172	50	CU – Consulta de operación	\N	2010-10-06 00:00:00	2010-10-12 00:00:00	\N	146175	\N	17
146173	50	CU – Bloquear y comprobar bloqueo de tickets	\N	2010-10-12 00:00:00	2010-10-15 00:00:00	\N	146175	\N	18
146174	50	Pruebas y resolución de errores	\N	2010-10-15 00:00:00	2010-11-03 00:00:00	\N	146175	\N	19
146193	62	Desarrollo de una aplicación en software libre de venta de entradas online	\N	2010-06-10 00:00:00	2011-01-14 04:36:28.80	2010-12-19	\N	\N	\N
368755	9	Módulo de gestión de usuarios	\N	2010-04-21 15:39:02.576	2010-05-04 15:39:02.576	\N	368773	\N	0
368751	8	Alta de usuarios	\N	2010-04-21 15:39:02.576	2010-04-24 15:39:02.576	\N	368755	\N	0
368752	8	Baja de usuarios	\N	2010-04-24 15:39:02.576	2010-04-27 15:39:02.576	\N	368755	\N	1
368753	8	Listado de usuarios	\N	2010-04-27 15:39:02.576	2010-04-30 15:39:02.576	\N	368755	\N	2
368754	8	Edición de usuarios	\N	2010-04-30 15:39:02.576	2010-05-04 15:39:02.576	\N	368755	\N	3
368771	8	Análisis	\N	2010-04-21 15:39:02.576	2010-07-31 15:39:02.576	\N	368773	\N	5
368772	8	Pruebas	\N	2010-05-04 15:39:02.576	2010-05-10 21:39:02.576	\N	368773	\N	6
368765	9	Módulo de gestión de avances	\N	2010-05-04 15:39:02.576	2010-05-13 09:39:02.576	\N	368773	\N	2
368762	8	Modificar avance de tarea	\N	2010-05-04 15:39:02.576	2010-05-06 15:39:02.576	\N	368765	\N	0
368763	8	Añadir avance a tarea	\N	2010-05-06 15:39:02.576	2010-05-10 09:39:02.576	\N	368765	\N	1
368764	8	Ver información gráfica de avance	\N	2010-05-10 09:39:02.576	2010-05-13 09:39:02.576	\N	368765	\N	2
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2426
2427
3867
3871
3875
56261
56265
56268
56273
56276
56278
56280
56284
56291
56297
56300
56303
56305
56307
56317
56320
56325
56329
56332
56337
56340
56342
56344
56348
56355
57472
57475
57478
57480
57482
57492
57495
85350
85354
85357
85362
85365
85367
85369
85373
85380
85386
85389
85392
85394
85396
85406
85409
85414
85418
85421
85426
85429
85431
85433
85437
85444
86359
86362
86365
86367
86369
86379
86382
86386
86387
97366
97369
97372
97373
105346
105347
118172
118175
118176
118181
118182
118187
118191
118194
118199
118202
118204
118206
118210
118217
118223
118226
118229
118231
118233
118243
118246
135547
146153
146175
146186
146193
368755
368761
368765
368769
368773
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
85345
105950
105951
146196
146198
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
2424	1	1870
2425	1	1871
2426	1	1869
2427	1	1868
3838	1	3646
3839	1	3647
3840	1	3648
3841	1	3649
3842	1	3650
3843	1	3651
3844	1	3652
3845	1	3653
3846	1	3654
3847	1	3655
3848	1	3656
3849	1	3657
3850	1	3658
3851	1	3659
3852	1	3660
3853	1	3661
3854	1	3662
3855	1	3663
3856	1	3664
3857	1	3665
3858	1	3666
3859	1	3667
3860	1	3668
3861	1	3669
3862	1	3670
3863	1	3671
3864	1	3672
3865	1	3673
3866	1	3674
3867	1	3255
146197	11	140079
56338	15	57212
56339	15	57213
3875	2	4712
3872	3	4713
3873	3	4714
3874	3	4715
118181	3	117800
118182	3	117799
118179	5	117803
118180	5	117802
118200	3	122332
118201	3	122333
118203	3	122335
118205	3	122337
118207	3	122339
3871	6	3697
3868	11	3698
3869	11	3699
3870	11	3700
56261	16	6300
56265	16	6305
118208	3	122340
118209	3	122341
118211	3	122343
118212	3	122344
56315	31	7121
56316	31	7122
56318	31	7123
56319	31	7124
118213	3	122345
97364	1	90605
97365	1	90606
97366	1	90604
118214	3	122346
118215	3	122347
118216	3	122348
118218	3	122350
118219	3	122351
118220	3	122352
118221	3	122353
118222	3	122354
118224	3	122356
85372	3	85538
85374	3	85540
85375	3	85541
85376	3	85542
85414	2	85841
85377	3	85543
85378	3	85544
85379	3	85545
85418	2	85846
85381	3	85749
85382	3	85750
85421	2	86153
85383	3	85751
85384	3	85752
85385	3	85753
85387	3	85755
85426	2	86156
85388	3	85756
85410	3	85842
85411	3	85843
85412	3	85844
85413	3	85845
85390	3	85758
85391	3	85759
85393	3	85761
85395	3	85763
85397	3	85765
85398	3	85766
85399	3	85767
85400	3	85768
85401	3	85769
85402	3	85770
85403	3	85771
85404	3	85772
85405	3	85773
85407	3	85774
85408	3	85775
85415	3	85847
85416	3	85848
85417	3	85849
85419	3	86154
85420	3	86155
85422	3	86157
85423	3	86158
85424	3	86159
85425	3	86160
85427	3	86162
86365	2	86188
86367	2	86191
86369	2	86193
86379	2	86195
97373	6	90608
97367	11	90610
97368	11	90611
97370	11	90613
97371	11	90614
56325	8	57194
86382	2	85840
85428	3	86163
85430	3	86165
85432	3	86167
85434	3	86169
85435	3	86170
85436	3	86171
56320	16	6275
85438	3	86173
85439	3	86174
85440	3	86175
56329	8	57199
56272	31	6343
56274	31	6354
56275	31	6355
56277	31	6675
56279	31	6677
56281	31	6678
56282	31	6816
56283	31	6817
97369	6	90609
56332	8	57203
56285	31	6819
56286	31	6820
85441	3	86176
97372	6	90612
85442	3	86177
85443	3	86178
85445	3	86180
86355	3	86181
86356	3	86182
56337	8	57206
56340	8	57211
118172	9	117788
86357	3	86183
86358	3	86184
86360	3	86186
86361	3	86187
86363	3	86189
86364	3	86190
86366	3	86192
86368	3	86194
86370	3	86196
86371	3	86197
86372	3	86198
86373	3	86199
86374	3	86200
86375	3	86201
86376	3	86202
86377	3	86203
86378	3	86204
86380	3	86205
86381	3	86206
86386	9	86214
86387	9	86208
86383	17	86215
86384	17	86216
85350	2	85511
86385	17	86217
56342	8	57214
85354	2	85516
56344	8	57216
85357	2	85520
85346	3	85512
85347	3	85513
85348	3	85514
85349	3	85515
85351	3	85517
85352	3	85518
85353	3	85519
56348	8	57218
56305	16	7078
56307	16	7081
56317	16	7115
56287	31	6821
56288	31	6822
56289	31	6823
56290	31	6824
56355	8	57222
57472	8	57229
118175	9	117791
57475	8	57235
118176	9	117787
85355	3	85521
85356	3	85522
118170	17	117789
118171	17	117790
57478	8	57238
118173	17	117792
118174	17	117793
57480	8	57241
118187	2	122314
118191	2	122319
118183	3	122315
118184	3	122316
118185	3	122317
118186	3	122318
118188	3	122320
118189	3	122321
118190	3	122322
118192	3	122324
118193	3	122325
56268	16	6321
56273	16	6339
56276	16	6353
56278	16	6674
56280	16	6676
56284	16	6815
56291	16	6818
56297	16	6825
56300	16	7072
56303	16	7075
56257	31	6301
56258	31	6302
56259	31	6303
56260	31	6304
56262	31	6306
56263	31	6307
56264	31	6320
56266	31	6322
56267	31	6323
57495	8	57193
56269	31	6340
56270	31	6341
57483	15	57246
57484	15	57247
57485	15	57248
57486	15	57249
57487	15	57250
57488	15	57251
57489	15	57252
57490	15	57253
85429	2	86161
85431	2	86164
85433	2	86166
85362	2	85523
85437	2	86168
57491	15	57254
57493	15	57255
57494	15	57256
56271	31	6342
56292	31	6826
56293	31	6827
56294	31	6828
56295	31	6829
56296	31	6830
56298	31	7073
85365	2	85528
85367	2	85531
85369	2	85533
85444	2	86172
85373	2	85535
86359	2	86179
86362	2	86185
85380	2	85539
118177	6	117796
85386	2	85546
85389	2	85754
85392	2	85757
85394	2	85760
56299	31	7074
85396	2	85762
56301	31	7076
56302	31	7077
56304	31	7079
56306	31	7082
56308	31	7116
56309	31	7117
56310	31	7084
56311	31	7080
85406	2	85764
85409	2	85510
85358	3	85524
85359	3	85525
85360	3	85526
85361	3	85527
85363	3	85529
85364	3	85530
85366	3	85532
85368	3	85534
85370	3	85536
85371	3	85537
118194	2	122323
118199	2	122326
118202	2	122331
118204	2	122334
118206	2	122336
118210	2	122338
118217	2	122342
57492	8	57245
118223	2	122349
118195	3	122327
118196	3	122328
118197	3	122329
118198	3	122330
56312	31	7118
56313	31	7119
56314	31	7120
105346	3	105042
105347	3	105040
105343	5	105041
105344	5	105043
105345	5	105044
118226	2	122355
118229	2	122358
135542	1	135456
118231	2	122361
135543	1	135457
118233	2	122363
135544	1	135458
135545	1	135459
135546	1	135460
135547	1	135455
118243	2	122365
118246	2	122313
118225	3	122357
118227	3	122359
118228	3	122360
118230	3	122362
118232	3	122364
118234	3	122366
118235	3	122367
118236	3	122368
118237	3	122369
118238	3	122370
118239	3	122371
118240	3	122372
118241	3	122373
118242	3	122374
118244	3	122375
118245	3	122376
118178	9	117797
146151	25	140003
57482	8	57243
56321	15	57195
56322	15	57196
56323	15	57197
56324	15	57198
56326	15	57200
56327	15	57201
56328	15	57202
56330	15	57204
56331	15	57205
56333	15	57207
56334	15	57208
56335	15	57209
56336	15	57210
56341	15	57215
56343	15	57217
56345	15	57219
56346	15	57220
56347	15	57221
56349	15	57223
56350	15	57224
56351	15	57225
56352	15	57226
56353	15	57227
56354	15	57228
56356	15	57230
56357	15	57231
57469	15	57232
57470	15	57233
57471	15	57234
57473	15	57236
57474	15	57237
57476	15	57239
57477	15	57240
57479	15	57242
57481	15	57244
146152	25	140004
146154	25	140005
146155	25	140012
146156	25	140013
146157	25	140014
146158	25	140015
146159	25	140016
146153	13	139998
146175	13	140011
146147	25	139999
146148	25	140000
146149	25	140001
146150	25	140002
368755	2	367238
368761	2	367249
368765	2	367254
368769	2	367257
368773	2	367237
368751	3	367239
368752	3	367240
368753	3	367241
368754	3	367242
368756	3	367243
368757	3	367250
368758	3	367251
368759	3	367252
368760	3	367253
368762	3	367244
146161	25	140018
368763	3	367255
368764	3	367256
368766	3	367245
368767	3	367258
368768	3	367259
368770	3	367246
368771	3	367247
368772	3	367248
146162	25	140019
146163	25	140020
146164	25	140021
146165	25	140022
146166	25	140023
146167	25	140024
146168	25	140025
146169	25	140026
146170	25	140027
146171	25	140028
146172	25	140029
146173	25	140030
146174	25	140031
146176	25	140034
146177	25	140035
146178	25	140036
146179	25	140037
146180	25	140038
146181	25	140039
146182	25	140040
146183	25	140041
146184	25	140042
146185	25	140043
146187	25	140044
146188	25	140051
146189	25	140066
146190	25	139995
146191	25	139996
146192	25	139997
146194	23	140074
146195	23	140075
146186	13	140033
146193	13	139987
146160	25	140017
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
6161	1	Normal	Normal	20.00	t	\N
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
139380	1	24f1edd7-d6a5-4974-8c24-714acff9ead3	units	\N
139381	1	898c75c9-873c-4458-ba41-8c506fff6ce2	kg	\N
139382	1	48abfb15-1915-4368-a5e7-4aebe4eda4f3	km	\N
139383	1	a54b8062-ac96-4b8d-955a-9f33d1fc5dcc	l	\N
139384	1	add3f86b-c65a-415b-8cfc-3fbbad06490a	m	\N
139385	1	fe9b9778-0e3e-4804-b5f9-e620326ac726	m2	\N
139386	1	d09cb5e3-d9fc-4513-83d1-b745f9d05ad8	m3	\N
139387	1	88198ede-1ac8-43c5-bfaa-728a44c5f470	tn	\N
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
910	ROLE_CREATE_ORDER
910	ROLE_EDIT_ALL_ORDERS
910	ROLE_READ_ALL_ORDERS
910	ROLE_ADMINISTRATION
911	ROLE_WS_READER
912	ROLE_WS_READER
912	ROLE_WS_WRITER
109686	ROLE_CREATE_ORDER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
1239	Desc.
90901	Desc.
90906	Obvs.
117264	Obs.
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id, generatecode) FROM stdin;
5960	1	431e4d41-a6cc-4e25-bc0e-c98080ecc32b	2010-02-09 00:00:00	5858	1226	\N	\N
57974	2	6e60aa05-84e1-40a8-99a0-8bc321ee05b7	2010-02-11 00:00:00	5858	1222	\N	\N
57975	1	f63f80fc-630d-42bb-9fcb-e74ab9671b7a	2010-02-14 00:00:00	5858	1226	\N	\N
76458	2	7e3da009-fc95-4c9c-876f-713b46e1cfaf	2009-12-14 00:00:00	5858	1214	\N	\N
76466	1	8640978f-7109-42ca-a968-6cf9bc708627	\N	78780	1230	\N	\N
76468	1	4cd40ba9-d0b2-4055-a3f7-92efe3de5496	2010-02-01 00:00:00	5858	1220	\N	\N
76471	1	5e35e952-b4fa-4c0b-a43d-e063a0d9de0a	2010-02-01 00:00:00	5858	1230	\N	\N
76472	1	44dca629-f2e2-42eb-a641-0712f1ee8eb7	2010-02-01 00:00:00	5858	1226	\N	\N
83224	2	5999f2c5-73a9-4683-96b1-8986e24f98aa	\N	78780	1214	\N	\N
107869	1	9e7a1ebc-fd77-42f1-9f91-9cf63a8395fc	\N	78780	1222	\N	\N
123018	1	dccce64f-fff6-439c-add5-17c9492f4550	2010-02-17 00:00:00	122816	\N	\N	\N
76459	2	1cd28979-2f1e-434f-b376-9fbcaf267352	\N	78780	1217	\N	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
108172	1	f	0	1010	1111	108071
122917	1	f	0	1010	1111	122816
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
6061	1	6f9a2172-bf77-4fda-911e-5453df2adacf	8	2010-02-09 00:00:00	\N	\N	5960	1226	4714	6161
6062	1	f5b06943-670e-4b56-a63f-211fc6f8e4eb	8	2010-02-09 00:00:00	\N	\N	5960	1226	4713	6161
6063	1	75511aa9-5b2c-405b-b0b2-80dd9b65739e	8	2010-02-09 00:00:00	\N	\N	5960	1226	4715	6161
58080	2	f48644ea-392a-41ac-8068-92e41b5159a6	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58082	2	5f7ac7bc-a381-4e86-b983-28fb2644dced	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58077	2	158c18e2-54c6-4139-bd34-53529cb4af66	10	2010-02-11 00:00:00	\N	\N	57974	1222	3699	6161
58075	2	66542f7e-068e-40f6-a1bd-edf819bf2405	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58076	2	9a8e84f9-29f8-4550-ba74-158962f9423e	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58081	2	89f341da-b0fe-49c1-bf43-257c2127b65e	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58079	2	859173ea-f99b-4e78-9844-9639cc6ad999	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58078	2	dc496741-38e8-4073-8b77-fdbec50c9aee	10	2010-02-11 00:00:00	\N	\N	57974	1222	3699	6161
58083	1	2f78531d-019d-4b8c-bd48-12107664bcea	10	2010-02-14 00:00:00	\N	\N	57975	1226	3699	6161
58084	1	4bf42e12-b9f4-423e-a964-42dfd64cf541	10	2010-02-14 00:00:00	\N	\N	57975	1226	3700	6161
76559	2	c6d80ab6-0c60-4e7a-866f-b1ed61bf00cd	8	2009-12-14 00:00:00	\N	\N	76458	1214	6301	6161
76563	2	a78a465f-fd81-4348-980b-b81bcd72494b	8	2009-12-14 00:00:00	\N	\N	76458	1214	6302	6161
76562	2	90bc3cbd-5899-499c-9257-fea36e75aa6e	8	2009-12-14 00:00:00	\N	\N	76458	1214	6303	6161
76561	2	a05d4dbc-b727-4905-9165-8404a7aec4c1	8	2009-12-14 00:00:00	\N	\N	76458	1214	6304	6161
76564	2	1689814c-f609-41b4-ad58-eceae5b9f4a2	8	2009-12-14 00:00:00	\N	\N	76458	1214	6301	6161
76560	2	22c136e1-a104-4f24-a0fa-38d267f4761b	8	2009-12-14 00:00:00	\N	\N	76458	1214	6302	6161
76633	1	afdb5087-b1c1-47b9-a92d-2ff43858dee1	40	2009-12-16 00:00:00	\N	\N	76466	1230	6306	6161
76634	1	89ce4c00-db59-4e62-a6ed-1afbf7c704d7	40	2009-12-22 00:00:00	\N	\N	76466	1230	6307	6161
76635	1	82b7f1ff-df0f-421f-a36a-bc8ec10b9183	40	2009-12-20 00:00:00	\N	\N	76466	1230	6320	6161
76636	1	46bbe708-df6b-4e75-b59a-f359718795a4	40	2009-12-21 00:00:00	\N	\N	76466	1230	6340	6161
76637	1	c1137136-1857-4189-99e4-03314a839bec	40	2009-12-07 00:00:00	\N	\N	76466	1230	6323	6161
76638	1	c4ff5b0a-6576-4627-b5ee-8d34abb596a8	40	2009-12-30 00:00:00	\N	\N	76466	1230	6343	6161
76639	1	86783000-2c71-47b4-8468-3d3b1f585b4b	40	2010-01-12 00:00:00	\N	\N	76466	1230	6354	6161
76640	1	83ccabe1-95a7-4ba9-8553-82a40509ae1f	40	2010-01-27 00:00:00	\N	\N	76466	1230	6341	6161
76641	1	121025f3-c8d5-4e9f-8ed9-c88481369b52	40	2010-02-01 00:00:00	\N	\N	76466	1230	6355	6161
76642	1	aaca8cc4-dcb5-4f84-812a-5f6802e1e39e	30	2010-01-19 00:00:00	\N	\N	76466	1230	6675	6161
76643	1	efc3ea22-b1de-414b-ae23-2f6a639d9a99	40	2010-02-01 00:00:00	\N	\N	76466	1230	6677	6161
76644	1	52cd66e2-8e38-4d37-ada0-cb8fa58868aa	4	2010-02-01 00:00:00	\N	\N	76466	1230	6301	6161
76646	1	1905fbd8-1db5-4938-8c9f-c64d90dc0fe9	40	2010-02-01 00:00:00	\N	\N	76468	1220	6341	6161
76647	1	8519b18a-9ec2-4767-baf5-fbb6b13c60e3	40	2010-02-01 00:00:00	\N	\N	76468	1220	6678	6161
76648	1	15ff70f5-d3c6-4304-a001-13e0e87de614	40	2010-02-01 00:00:00	\N	\N	76468	1220	6816	6161
76649	1	681fb856-9b2a-4787-9070-e3438d705efa	40	2010-02-01 00:00:00	\N	\N	76468	1220	6816	6161
76650	1	e00a880d-f00a-4347-ad75-9097975becc3	40	2010-02-01 00:00:00	\N	\N	76468	1220	6817	6161
76651	1	88606ba6-003a-4b16-b329-e19f47851561	40	2010-02-01 00:00:00	\N	\N	76468	1220	6819	6161
76652	1	e47a9373-4066-46fc-a0da-57267fc582bf	40	2010-02-01 00:00:00	\N	\N	76468	1220	6820	6161
76653	1	ac1b1930-f520-41fc-81de-4b31a3216ba2	40	2010-02-01 00:00:00	\N	\N	76468	1220	6821	6161
76654	1	64aea4c8-571b-4a8e-baac-39347c876487	40	2010-02-01 00:00:00	\N	\N	76468	1220	6822	6161
76657	1	594fc4f6-9ed5-422a-9abc-3e231f17c0ea	40	2010-02-01 00:00:00	\N	\N	76471	1230	6822	6161
76658	1	da739cbe-4967-4c2d-b9ad-8d69cc2f41d5	40	2010-02-01 00:00:00	\N	\N	76471	1230	6823	6161
78881	1	0f9da8b4-7290-4830-af80-f33884947d94	40	2010-02-01 00:00:00	\N	\N	76471	1230	6824	6161
78882	1	f7a0f2c1-d2f1-41e0-8964-3a9a1dff58aa	40	2010-02-01 00:00:00	\N	\N	76471	1230	6826	6161
78883	1	27c3ef3c-b9e1-4dcb-8638-a44a08406f77	40	2010-02-01 00:00:00	\N	\N	76471	1230	6827	6161
78884	1	ba028f2e-b056-4315-b9ec-45397c493dd2	40	2010-02-01 00:00:00	\N	\N	76471	1230	6828	6161
76565	2	5b827b0a-81df-42e4-ba0d-08e2f8928819	10	2009-12-16 00:00:00	\N	\N	76459	1217	6675	6161
76566	2	ab51945a-2dc5-41a8-abd8-69976fc72028	40	2009-12-15 00:00:00	\N	\N	76459	1217	85514	6161
78885	1	0fdd57ef-fb04-4823-b3a8-68ce010f1429	40	2010-02-01 00:00:00	\N	\N	76471	1230	6829	6161
78886	1	04e995dd-e946-46f7-8130-2204de8f0120	40	2010-02-01 00:00:00	\N	\N	76471	1230	6830	6161
78887	1	336f3b2f-a00a-4734-a7a6-dbd9c678a367	40	2010-02-01 00:00:00	\N	\N	76472	1226	6826	6161
78888	1	c9ee3c0c-7ea9-45f4-a1ed-b52f6ba0472c	32	2010-02-01 00:00:00	\N	\N	76472	1226	6827	6161
78889	1	d0fb008f-af32-4cfd-91f3-20f61b1376f9	32	2010-02-01 00:00:00	\N	\N	76472	1226	6828	6161
78890	1	33e9bd1a-5d39-4e91-b00a-c4b2990be14a	32	2010-02-01 00:00:00	\N	\N	76472	1226	6829	6161
78891	1	49787b1c-4dd8-4ffe-a66c-3f2ab4097885	32	2010-02-01 00:00:00	\N	\N	76472	1226	6830	6161
78892	1	6146ea4f-e307-4ebd-aa81-b4658c92d607	32	2010-02-01 00:00:00	\N	\N	76472	1226	7072	6161
78893	1	11f9c83d-facf-47cb-a900-7ce74c4e0c78	32	2010-02-01 00:00:00	\N	\N	76472	1226	7075	6161
78894	1	0a7b87c6-2971-4ade-9271-0b3ecb58cd65	32	2010-02-01 00:00:00	\N	\N	76472	1226	7078	6161
83329	2	31e0bea5-1b0d-4436-9b1c-d0f7b4d33e08	150	2010-02-08 00:00:00	\N	\N	83224	1214	7124	6161
83325	2	50acdf15-5d16-4d6c-9e9a-b2e8d25a83c3	100	2010-02-08 00:00:00	\N	\N	83224	1214	7115	6161
83330	2	71eb4133-c6e6-478c-9ae7-d4bc0463c6b7	150	2010-02-08 00:00:00	\N	\N	83224	1214	7123	6161
83328	2	5ae68c6a-b76d-4dde-ab4f-d850bd4768e1	70	2010-02-15 00:00:00	\N	\N	83224	1214	7079	6161
83326	2	bfdf9707-350e-4298-a3cf-531ea1aaa9a8	50	2010-02-08 00:00:00	\N	\N	83224	1214	7072	6161
83327	2	84da72ad-df75-48d1-9fe7-f8c343516ce0	50	2010-02-01 00:00:00	\N	\N	83224	1214	7075	6161
107970	1	c3b61766-bf51-4eb7-92e1-abe02ba39ebf	8	2010-02-16 00:00:00	\N	\N	107869	1222	6675	6161
123119	1	6cbfac61-4f26-4460-b971-5251b2509a72	8	2010-02-17 00:00:00	\N	\N	123018	1230	85512	6161
123120	1	054df139-5ef1-4dca-becc-a72d11dacc06	8	2010-02-17 00:00:00	\N	\N	123018	1214	85513	6161
123121	1	9d3ceaa1-2239-4e0a-8c5b-4e377d12c316	299	2010-02-17 00:00:00	\N	\N	123018	1228	6354	6161
123122	1	692fae5e-9468-41df-90e5-7a7b6b8dc8ba	20	2010-02-17 00:00:00	\N	\N	123018	1222	85518	6161
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
5858	1	Nome1	cod1	t	t	f	0
78780	1	Tipo2	code	f	t	f	0
108071	1	tipo c	codea	t	t	t	0
122816	1	Tipo de parte de Atenasa	codigo-atenasa	t	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
117264	Grupo virtual de caldereros	---	[Virtual]
117262	Exemplo	Presentacion	111111111D
1222	María	Francino Arriaga	44444444D
1214	Javier	Rios Manteiga	11111111A
1224	Ana	Hervés García	55555555E
1239	Grupo de soldadores para proxecto con Navantia Marzo 2010	---	[Virtual]
134535	Andamiero 2	2	44444444D
134537	Andamiero 3	3	66666666E
134533	Andamiero 1	1	33333333D
90901	Grupo de desenvolvedores	---	[Virtual]
1226	Alfonso	Dominguez Baul	66666666F
139482	Jacobo	Aragunde	12312312C
139486	Diego	Pino	12312312C
139484	Manuel	Rego	12312312C
1217	Sergio	Sumay Senín	22222222B
1228	Cristina	Rey Silva	77777777G
1220	María	Tequila Urzáiz	33333333C
1230	Saul	Ramirez Costa	88888888G
139488	Pedro	Figueras	12341234c
367843	Pedro	Lores Lopez	45000000C
367845	Montse	Gutiérrez García	34444444A
90904	Pintor	Proba Pintor	30303030D
90906	Grupo de pintores	---	[Virtual]
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
123119	1111
123120	1111
123121	1111
123122	1111
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


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_user_fkey;
ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_label_fkey;
ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_criterion_fkey;
ALTER TABLE ONLY public.sum_expenses DROP CONSTRAINT sum_expenses_order_element_fkey;
ALTER TABLE ONLY public.sum_charged_effort DROP CONSTRAINT sum_charged_effort_order_element_fkey;
ALTER TABLE ONLY public.order_sync_info DROP CONSTRAINT order_sync_info_order_table_fkey;
ALTER TABLE ONLY public.manual_function DROP CONSTRAINT mnual_function_assignment_function_fkey;
ALTER TABLE ONLY public.configuration_roles_ldap DROP CONSTRAINT id_configuration_fkey;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT fkfe6fb5758b37665c;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT fkfe6fb57519b9dfde;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT fkfe6ed34be838f362;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT fkfe6ed34b9e788f90;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT fkfe6ed34b1545e7a;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fkfd7aa622efda874f;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fkfd7aa62278e4e2ea;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fkfd7aa62248d21790;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT fkf796fbd0f1a3177c;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT fkf796fbd0c1c2746e;
ALTER TABLE ONLY public.generic_resource_allocation DROP CONSTRAINT fkf788b34975ed79ba;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT fkf635cc04b216ed4c;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT fkf0e85724eae850b2;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT fkf0e8572475ed79ba;
ALTER TABLE ONLY public.derived_allocation DROP CONSTRAINT fkf0260c4287b470f0;
ALTER TABLE ONLY public.derived_allocation DROP CONSTRAINT fkf0260c4275ed79ba;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT fkef395fa5f41d57f2;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT fkef395fa5efda874f;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT fkef395fa5e036cfed;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT fkef395fa561f02c44;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT fkef395fa519b9dfde;
ALTER TABLE ONLY public.stretches DROP CONSTRAINT fkee374673ae0677b8;
ALTER TABLE ONLY public.virtual_worker DROP CONSTRAINT fkee053f32f2ed6dc;
ALTER TABLE ONLY public.resource DROP CONSTRAINT fkebabc40edc874c20;
ALTER TABLE ONLY public.resource_allocation DROP CONSTRAINT fke8a96db1ff61540d;
ALTER TABLE ONLY public.resource_allocation DROP CONSTRAINT fke8a96db115671e92;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT fke8344cc0efda874f;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT fke8344cc0c1c2746e;
ALTER TABLE ONLY public.order_line_template DROP CONSTRAINT fke4c379349fb7fc18;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fke2af47f1f1a3177c;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fke2af47f1efda874f;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fke2af47f1e7e1020b;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fke2af47f148d21790;
ALTER TABLE ONLY public.order_line_group DROP CONSTRAINT fkdce41405efda874f;
ALTER TABLE ONLY public.advance_measurement DROP CONSTRAINT fkdaba2f7fa9e53843;
ALTER TABLE ONLY public.advance_measurement DROP CONSTRAINT fkdaba2f7f2f2d3aec;
ALTER TABLE ONLY public.advance_assignment_template DROP CONSTRAINT fkd9bfae6fb216ed4c;
ALTER TABLE ONLY public.advance_assignment_template DROP CONSTRAINT fkd9bfae6f19b9dfde;
ALTER TABLE ONLY public.hours_group DROP CONSTRAINT fkd9b7594f8bdc6ac6;
ALTER TABLE ONLY public.hours_group DROP CONSTRAINT fkd9b7594f1ed629ea;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT fkd8e14c09b36a6d51;
ALTER TABLE ONLY public.profile_roles DROP CONSTRAINT fkd557d8a7edc4db41;
ALTER TABLE ONLY public.machine_workers_configuration_unit DROP CONSTRAINT fkd47281efffeb5538;
ALTER TABLE ONLY public.advance_assignment DROP CONSTRAINT fkd4192eaab216ed4c;
ALTER TABLE ONLY public.scenario DROP CONSTRAINT fkd1c57390fd99606d;
ALTER TABLE ONLY public.worker DROP CONSTRAINT fkd162537e40901220;
ALTER TABLE ONLY public.task_milestone DROP CONSTRAINT fkd04de7364936bb8c;
ALTER TABLE ONLY public.specific_day_assignments_container DROP CONSTRAINT fkcee469987518838c;
ALTER TABLE ONLY public.specific_day_assignments_container DROP CONSTRAINT fkcee46998421c7cf4;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT fkcb8fc1cdc1c2746e;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT fkcb8fc1cd5078e161;
ALTER TABLE ONLY public.sigmoid_function DROP CONSTRAINT fkc9c3fe691a5e11f8;
ALTER TABLE ONLY public.consolidation DROP CONSTRAINT fkc9400e2cff2b2ba3;
ALTER TABLE ONLY public.consolidation DROP CONSTRAINT fkc9400e2c9f1d6611;
ALTER TABLE ONLY public.consolidation DROP CONSTRAINT fkc9400e2c430ea1de;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT fkc74605deedc4db41;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT fkc74605de5567ad13;
ALTER TABLE ONLY public.task_element DROP CONSTRAINT fkc631a642a5f3c581;
ALTER TABLE ONLY public.task_element DROP CONSTRAINT fkc631a642a44abee3;
ALTER TABLE ONLY public.capacity_per_day DROP CONSTRAINT fkc405554bfd5e49bc;
ALTER TABLE ONLY public.generic_day_assignments_container DROP CONSTRAINT fkc01655fdee970b;
ALTER TABLE ONLY public.generic_day_assignments_container DROP CONSTRAINT fkc01655fd421c7cf4;
ALTER TABLE ONLY public.planning_data DROP CONSTRAINT fkbb58534c6ccf87c5;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f50756348a8;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f50510e7a78;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f5048d21790;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f5019256004;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkbb262920c1c2746e;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkbb262920707cd777;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkbb262920131853a1;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fkb92b5948edc4db41;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fkb92b594887287288;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fkb92b59485567ad13;
ALTER TABLE ONLY public.derived_day_assignments_container DROP CONSTRAINT fkb83176c3421c7cf4;
ALTER TABLE ONLY public.derived_day_assignments_container DROP CONSTRAINT fkb83176c31b8e7cf2;
ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT fkb3e9425efda874f;
ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT fkb3e9425b5c68337;
ALTER TABLE ONLY public.quality_form_items DROP CONSTRAINT fkad6003c58b37665c;
ALTER TABLE ONLY public.order_version DROP CONSTRAINT fka391ce7a2380ca7;
ALTER TABLE ONLY public.machine_worker_assignment DROP CONSTRAINT fka2c158369bebcf10;
ALTER TABLE ONLY public.machine_worker_assignment DROP CONSTRAINT fka2c1583686b2de7a;
ALTER TABLE ONLY public.calendar_exception DROP CONSTRAINT fka215508eadad7e51;
ALTER TABLE ONLY public.calendar_exception DROP CONSTRAINT fka215508ea44abee3;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT fka01fe4eee036cfed;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT fka01fe4ee8c80ccb7;
ALTER TABLE ONLY public.order_line_group_template DROP CONSTRAINT fk9c819f74ddc82952;
ALTER TABLE ONLY public.resource_calendar DROP CONSTRAINT fk9619184fa44abee3;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT fk95548d7875999a91;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT fk95548d7861f02c44;
ALTER TABLE ONLY public.order_element DROP CONSTRAINT fk92271f0bd97bcc8c;
ALTER TABLE ONLY public.order_element DROP CONSTRAINT fk92271f0b1e635c19;
ALTER TABLE ONLY public.scenario_orders DROP CONSTRAINT fk91bbca74c0fb9d8e;
ALTER TABLE ONLY public.scenario_orders DROP CONSTRAINT fk91bbca7487287288;
ALTER TABLE ONLY public.scenario_orders DROP CONSTRAINT fk91bbca7423b85cf1;
ALTER TABLE ONLY public.line_field DROP CONSTRAINT fk88eecef415884f6;
ALTER TABLE ONLY public.scheduling_states_by_order_version DROP CONSTRAINT fk84f61df1efda874f;
ALTER TABLE ONLY public.scheduling_states_by_order_version DROP CONSTRAINT fk84f61df19bfe55d0;
ALTER TABLE ONLY public.scheduling_states_by_order_version DROP CONSTRAINT fk84f61df123b85cf1;
ALTER TABLE ONLY public.material_category DROP CONSTRAINT fk84c66516b53669f2;
ALTER TABLE ONLY public.limiting_resource_queue DROP CONSTRAINT fk7e57469848d21790;
ALTER TABLE ONLY public.description_values DROP CONSTRAINT fk7d1ee2c5fec79eb0;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT fk79800350b1524a73;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT fk7980035061f02c44;
ALTER TABLE ONLY public.task_source DROP CONSTRAINT fk7950e0159a2c0abd;
ALTER TABLE ONLY public.task_source DROP CONSTRAINT fk7950e0153d72bc6f;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39da44abee3;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39d504f463e;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39d4ec080cf;
ALTER TABLE ONLY public.calendar_data DROP CONSTRAINT fk74fc040ba44abee3;
ALTER TABLE ONLY public.calendar_data DROP CONSTRAINT fk74fc040b7fa34e3f;
ALTER TABLE ONLY public.user_table DROP CONSTRAINT fk7358465a4cd98327;
ALTER TABLE ONLY public.configuration DROP CONSTRAINT fk733374f6cc119699;
ALTER TABLE ONLY public.scheduling_data_for_version DROP CONSTRAINT fk672eed98efda874f;
ALTER TABLE ONLY public.indirect_advance_assignment DROP CONSTRAINT fk64cbad3b8202350f;
ALTER TABLE ONLY public.indirect_advance_assignment DROP CONSTRAINT fk64cbad3b2f2d3aec;
ALTER TABLE ONLY public.indirect_advance_assignment DROP CONSTRAINT fk64cbad3b218d7620;
ALTER TABLE ONLY public.order_template DROP CONSTRAINT fk6476ce4ba44abee3;
ALTER TABLE ONLY public.order_template DROP CONSTRAINT fk6476ce4b9a4a7d90;
ALTER TABLE ONLY public.label DROP CONSTRAINT fk61f7ef4707cd777;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT fk616de2a3c1c2746e;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT fk616de2a319b9dfde;
ALTER TABLE ONLY public.limiting_resource_queue_dependency DROP CONSTRAINT fk59485352e42f8d29;
ALTER TABLE ONLY public.limiting_resource_queue_dependency DROP CONSTRAINT fk5948535228f2695;
ALTER TABLE ONLY public.calendar_availability DROP CONSTRAINT fk557738bca44abee3;
ALTER TABLE ONLY public.task_group DROP CONSTRAINT fk4d9497454936bb8c;
ALTER TABLE ONLY public.stretches_function DROP CONSTRAINT fk4949f0241a5e11f8;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT fk4356e07eefda874f;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT fk4356e07e8b37665c;
ALTER TABLE ONLY public.order_element_template DROP CONSTRAINT fk4339b2e41638aab;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT fk3b9a8148d5b6184d;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT fk3b9a8148c29ad8eb;
ALTER TABLE ONLY public.task DROP CONSTRAINT fk3635855b595a0;
ALTER TABLE ONLY public.task DROP CONSTRAINT fk3635854936bb8c;
ALTER TABLE ONLY public.subcontracted_task_data DROP CONSTRAINT fk35bc4ed63804cfa;
ALTER TABLE ONLY public.consolidated_value DROP CONSTRAINT fk35588e2db96bba28;
ALTER TABLE ONLY public.consolidated_value DROP CONSTRAINT fk35588e2d3ae24ff8;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT fk35254354b5c68337;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT fk3525435419b9dfde;
ALTER TABLE ONLY public.machine DROP CONSTRAINT fk31314447937680b7;
ALTER TABLE ONLY public.roles_table DROP CONSTRAINT fk2e7e6bcc5567ad13;
ALTER TABLE ONLY public.order_line DROP CONSTRAINT fk2d124245efda874f;
ALTER TABLE ONLY public.heading_field DROP CONSTRAINT fk2908787d415884f6;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT fk27c2a216c29ad8eb;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT fk27c2a21648d21790;
ALTER TABLE ONLY public.criterion_satisfaction DROP CONSTRAINT fk225ff96aeae850b2;
ALTER TABLE ONLY public.criterion_satisfaction DROP CONSTRAINT fk225ff96a8c4c676c;
ALTER TABLE ONLY public.limiting_resource_queue_element DROP CONSTRAINT fk1fc5f455bd2209e8;
ALTER TABLE ONLY public.limiting_resource_queue_element DROP CONSTRAINT fk1fc5f45575ed79ba;
ALTER TABLE ONLY public.description_values_in_line DROP CONSTRAINT fk1e6bf5475c390c4;
ALTER TABLE ONLY public.direct_advance_assignment DROP CONSTRAINT fk172a16c0a1127ce5;
ALTER TABLE ONLY public.direct_advance_assignment DROP CONSTRAINT fk172a16c02f2d3aec;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT fk16e20ea13a156175;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT fk16e20ea114a5c61;
ALTER TABLE ONLY public.material DROP CONSTRAINT fk11d36527f11b2d0;
ALTER TABLE ONLY public.material DROP CONSTRAINT fk11d365279578651e;
ALTER TABLE ONLY public.task_quality_form_items DROP CONSTRAINT fk101a54bf87fa6b5d;
ALTER TABLE ONLY public.expense_sheet_line DROP CONSTRAINT expense_sheet_line_resource_fkey;
ALTER TABLE ONLY public.expense_sheet_line DROP CONSTRAINT expense_sheet_line_order_element_fkey;
ALTER TABLE ONLY public.expense_sheet_line DROP CONSTRAINT expense_sheet_line_expense_sheet_fkey;
ALTER TABLE ONLY public.connector_property DROP CONSTRAINT connector_property_connector_id_fkey;
ALTER TABLE ONLY public.configuration DROP CONSTRAINT configuration_type_of_work_hours_fkey;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT workreportslines_labels_pkey;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT workreports_labels_pkey;
ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_user_id_key;
ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_pkey;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_pkey;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_name_key;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_code_key;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT work_report_pkey;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT work_report_line_pkey;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT work_report_line_code_key;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT work_report_label_type_assigment_pkey;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT work_report_code_key;
ALTER TABLE ONLY public.virtual_worker DROP CONSTRAINT virtual_worker_pkey;
ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_pkey;
ALTER TABLE ONLY public.user_table DROP CONSTRAINT user_table_login_name_key;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT user_profiles_pkey;
ALTER TABLE ONLY public.unit_type DROP CONSTRAINT unit_type_pkey;
ALTER TABLE ONLY public.unit_type DROP CONSTRAINT unit_type_code_key;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_pkey;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_name_key;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_code_key;
ALTER TABLE ONLY public.task DROP CONSTRAINT task_subcontrated_task_data_id_key;
ALTER TABLE ONLY public.task_source DROP CONSTRAINT task_source_schedulingdata_key;
ALTER TABLE ONLY public.task_source DROP CONSTRAINT task_source_pkey;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT task_source_hours_groups_pkey;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT task_quality_form_pkey;
ALTER TABLE ONLY public.task_quality_form_items DROP CONSTRAINT task_quality_form_items_pkey;
ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
ALTER TABLE ONLY public.task_milestone DROP CONSTRAINT task_milestone_pkey;
ALTER TABLE ONLY public.task_group DROP CONSTRAINT task_group_pkey;
ALTER TABLE ONLY public.task_element DROP CONSTRAINT task_element_pkey;
ALTER TABLE ONLY public.sum_expenses DROP CONSTRAINT sum_expenses_pkey;
ALTER TABLE ONLY public.sum_charged_effort DROP CONSTRAINT sum_charged_hours_pkey;
ALTER TABLE ONLY public.subcontractor_deliver_date DROP CONSTRAINT subcontrator_deliver_date_pkey;
ALTER TABLE ONLY public.subcontractor_communication DROP CONSTRAINT subcontractor_comunication_pkey;
ALTER TABLE ONLY public.subcontracted_task_data DROP CONSTRAINT subcontracted_task_data_pkey;
ALTER TABLE ONLY public.stretches DROP CONSTRAINT stretches_pkey;
ALTER TABLE ONLY public.stretches_function DROP CONSTRAINT stretches_function_pkey;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT specific_resource_allocation_pkey;
ALTER TABLE ONLY public.specific_day_assignments_container DROP CONSTRAINT specific_day_assignments_container_pkey;
ALTER TABLE ONLY public.sigmoid_function DROP CONSTRAINT sigmoid_function_pkey;
ALTER TABLE ONLY public.scheduling_states_by_order_version DROP CONSTRAINT scheduling_states_by_order_version_pkey;
ALTER TABLE ONLY public.scheduling_data_for_version DROP CONSTRAINT scheduling_data_for_version_pkey;
ALTER TABLE ONLY public.scenario DROP CONSTRAINT scenario_pkey;
ALTER TABLE ONLY public.scenario_orders DROP CONSTRAINT scenario_orders_pkey;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT resources_cost_category_assignment_pkey;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT resources_cost_category_assignment_code_key;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_pkey;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_code_key;
ALTER TABLE ONLY public.resource_calendar DROP CONSTRAINT resource_calendar_pkey;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_base_calendar_id_key;
ALTER TABLE ONLY public.resource_allocation DROP CONSTRAINT resource_allocation_pkey;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT quality_form_pkey;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT quality_form_name_key;
ALTER TABLE ONLY public.quality_form_items DROP CONSTRAINT quality_form_items_pkey;
ALTER TABLE ONLY public.profile_table DROP CONSTRAINT profile_table_profile_name_key;
ALTER TABLE ONLY public.profile_table DROP CONSTRAINT profile_table_pkey;
ALTER TABLE ONLY public.planning_data DROP CONSTRAINT planning_data_pkey;
ALTER TABLE ONLY public.order_sync_info DROP CONSTRAINT pk_order_sync_info;
ALTER TABLE ONLY public.job_scheduler_configuration DROP CONSTRAINT pk_job_scheduler_configuration;
ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT pk_databasechangeloglock;
ALTER TABLE ONLY public.databasechangelog DROP CONSTRAINT pk_databasechangelog;
ALTER TABLE ONLY public.configuration_roles_ldap DROP CONSTRAINT pk_configuration_roles_ldap;
ALTER TABLE ONLY public.order_version DROP CONSTRAINT order_version_pkey;
ALTER TABLE ONLY public.order_template DROP CONSTRAINT order_template_pkey;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT order_table_pkey;
ALTER TABLE ONLY public.order_line_template DROP CONSTRAINT order_line_template_pkey;
ALTER TABLE ONLY public.order_line DROP CONSTRAINT order_line_pkey;
ALTER TABLE ONLY public.order_line_group_template DROP CONSTRAINT order_line_group_template_pkey;
ALTER TABLE ONLY public.order_line_group DROP CONSTRAINT order_line_group_pkey;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT order_element_template_quality_form_pkey;
ALTER TABLE ONLY public.order_element_template DROP CONSTRAINT order_element_template_pkey;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT order_element_template_label_pkey;
ALTER TABLE ONLY public.order_element DROP CONSTRAINT order_element_pkey;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT order_element_label_pkey;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT order_authorization_pkey;
ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
ALTER TABLE ONLY public.material DROP CONSTRAINT material_code_key;
ALTER TABLE ONLY public.material_category DROP CONSTRAINT material_category_pkey;
ALTER TABLE ONLY public.material_category DROP CONSTRAINT material_category_code_key;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT material_assigment_template_pkey;
ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT material_assigment_pkey;
ALTER TABLE ONLY public.manual_function DROP CONSTRAINT manual_function_pkey;
ALTER TABLE ONLY public.machine_workers_configuration_unit DROP CONSTRAINT machine_workers_configuration_unit_pkey;
ALTER TABLE ONLY public.machine_worker_assignment DROP CONSTRAINT machine_worker_assignment_pkey;
ALTER TABLE ONLY public.machine DROP CONSTRAINT machine_pkey;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT machine_configuration_unit_required_criterions_pkey;
ALTER TABLE ONLY public.limiting_resource_queue DROP CONSTRAINT limiting_resource_queue_resource_id_key;
ALTER TABLE ONLY public.limiting_resource_queue DROP CONSTRAINT limiting_resource_queue_pkey;
ALTER TABLE ONLY public.limiting_resource_queue_element DROP CONSTRAINT limiting_resource_queue_element_resource_allocation_id_key;
ALTER TABLE ONLY public.limiting_resource_queue_element DROP CONSTRAINT limiting_resource_queue_element_pkey;
ALTER TABLE ONLY public.limiting_resource_queue_dependency DROP CONSTRAINT limiting_resource_queue_dependency_pkey;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_pkey;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_name_key;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_code_key;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_pkey;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_name_key;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_code_key;
ALTER TABLE ONLY public.indirect_advance_assignment DROP CONSTRAINT indirect_advance_assignment_pkey;
ALTER TABLE ONLY public.hours_group DROP CONSTRAINT hours_group_pkey;
ALTER TABLE ONLY public.hours_group DROP CONSTRAINT hours_group_code_key;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT hour_cost_pkey;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT hour_cost_code_key;
ALTER TABLE ONLY public.generic_resource_allocation DROP CONSTRAINT generic_resource_allocation_pkey;
ALTER TABLE ONLY public.generic_day_assignments_container DROP CONSTRAINT generic_day_assignments_container_pkey;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_pkey;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_nif_key;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_name_key;
ALTER TABLE ONLY public.expense_sheet DROP CONSTRAINT expense_sheet_pkey;
ALTER TABLE ONLY public.expense_sheet_line DROP CONSTRAINT expense_sheet_line_pkey;
ALTER TABLE ONLY public.entity_sequence DROP CONSTRAINT entity_sequence_pkey;
ALTER TABLE ONLY public.end_date_communication DROP CONSTRAINT end_date_communication_to_customer_pkey;
ALTER TABLE ONLY public.capacity_per_day DROP CONSTRAINT effort_per_day_pkey;
ALTER TABLE ONLY public.direct_advance_assignment DROP CONSTRAINT direct_advance_assignment_pkey;
ALTER TABLE ONLY public.derived_day_assignments_container DROP CONSTRAINT derived_day_assignments_container_pkey;
ALTER TABLE ONLY public.derived_allocation DROP CONSTRAINT derived_allocation_pkey;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT dependency_pkey;
ALTER TABLE ONLY public.deadline_communication DROP CONSTRAINT deadline_comunication_pkey;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT day_assignment_pkey;
ALTER TABLE ONLY public.customer_communication DROP CONSTRAINT customer_comunication_pkey;
ALTER TABLE ONLY public.criterion_type DROP CONSTRAINT criterion_type_pkey;
ALTER TABLE ONLY public.criterion_type DROP CONSTRAINT criterion_type_name_key;
ALTER TABLE ONLY public.criterion_type DROP CONSTRAINT criterion_type_code_key;
ALTER TABLE ONLY public.criterion_satisfaction DROP CONSTRAINT criterion_satisfaction_pkey;
ALTER TABLE ONLY public.criterion_satisfaction DROP CONSTRAINT criterion_satisfaction_code_key;
ALTER TABLE ONLY public.criterion_requirement DROP CONSTRAINT criterion_requirement_pkey;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_pkey;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_name_key;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_code_key;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_pkey;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_name_key;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_code_key;
ALTER TABLE ONLY public.consolidation DROP CONSTRAINT consolidation_pkey;
ALTER TABLE ONLY public.consolidated_value DROP CONSTRAINT consolidated_value_pkey;
ALTER TABLE ONLY public.connector_property DROP CONSTRAINT connector_property_pkey;
ALTER TABLE ONLY public.connector DROP CONSTRAINT connector_pkey;
ALTER TABLE ONLY public.configuration DROP CONSTRAINT configuration_pkey;
ALTER TABLE ONLY public.calendar_exception_type DROP CONSTRAINT calendar_exception_type_pkey;
ALTER TABLE ONLY public.calendar_exception_type DROP CONSTRAINT calendar_exception_type_name_key;
ALTER TABLE ONLY public.calendar_exception_type DROP CONSTRAINT calendar_exception_type_code_key;
ALTER TABLE ONLY public.calendar_exception DROP CONSTRAINT calendar_exception_pkey;
ALTER TABLE ONLY public.calendar_exception DROP CONSTRAINT calendar_exception_code_key;
ALTER TABLE ONLY public.calendar_data DROP CONSTRAINT calendar_data_pkey;
ALTER TABLE ONLY public.calendar_data DROP CONSTRAINT calendar_data_code_key;
ALTER TABLE ONLY public.calendar_availability DROP CONSTRAINT calendar_availability_pkey;
ALTER TABLE ONLY public.calendar_availability DROP CONSTRAINT calendar_availability_code_key;
ALTER TABLE ONLY public.base_calendar DROP CONSTRAINT base_calendar_pkey;
ALTER TABLE ONLY public.base_calendar DROP CONSTRAINT base_calendar_code_key;
ALTER TABLE ONLY public.assignment_function DROP CONSTRAINT assignment_function_pkey;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT all_criterions_pkey;
ALTER TABLE ONLY public.advance_type DROP CONSTRAINT advance_type_unit_name_key;
ALTER TABLE ONLY public.advance_type DROP CONSTRAINT advance_type_pkey;
ALTER TABLE ONLY public.advance_measurement DROP CONSTRAINT advance_measurement_pkey;
ALTER TABLE ONLY public.advance_assignment_template DROP CONSTRAINT advance_assignment_template_pkey;
ALTER TABLE ONLY public.advance_assignment DROP CONSTRAINT advance_assignment_pkey;
ALTER TABLE public.job_scheduler_configuration ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.connector ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.workreportslines_labels;
DROP TABLE public.workreports_labels;
DROP TABLE public.worker;
DROP TABLE public.work_report_type;
DROP TABLE public.work_report_line;
DROP TABLE public.work_report_label_type_assigment;
DROP TABLE public.work_report;
DROP TABLE public.virtual_worker;
DROP TABLE public.user_table;
DROP TABLE public.user_profiles;
DROP TABLE public.unit_type;
DROP TABLE public.type_of_work_hours;
DROP TABLE public.task_source_hours_groups;
DROP TABLE public.task_source;
DROP TABLE public.task_quality_form_items;
DROP TABLE public.task_quality_form;
DROP TABLE public.task_milestone;
DROP TABLE public.task_group;
DROP TABLE public.task_element;
DROP TABLE public.task;
DROP TABLE public.sum_expenses;
DROP TABLE public.sum_charged_effort;
DROP TABLE public.subcontractor_deliver_date;
DROP TABLE public.subcontractor_communication_values;
DROP TABLE public.subcontractor_communication;
DROP TABLE public.subcontracted_task_data;
DROP TABLE public.stretches_function;
DROP TABLE public.stretches;
DROP TABLE public.specific_resource_allocation;
DROP TABLE public.specific_day_assignments_container;
DROP TABLE public.sigmoid_function;
DROP TABLE public.scheduling_states_by_order_version;
DROP TABLE public.scheduling_data_for_version;
DROP TABLE public.scenario_orders;
DROP TABLE public.scenario;
DROP TABLE public.roles_table;
DROP TABLE public.resources_cost_category_assignment;
DROP TABLE public.resource_calendar;
DROP TABLE public.resource_allocation;
DROP TABLE public.resource;
DROP TABLE public.quality_form_items;
DROP TABLE public.quality_form;
DROP TABLE public.profile_table;
DROP TABLE public.profile_roles;
DROP TABLE public.planning_data;
DROP TABLE public.order_version;
DROP TABLE public.order_template;
DROP TABLE public.order_table;
DROP TABLE public.order_sync_info;
DROP TABLE public.order_line_template;
DROP TABLE public.order_line_group_template;
DROP TABLE public.order_line_group;
DROP TABLE public.order_line;
DROP TABLE public.order_element_template_quality_form;
DROP TABLE public.order_element_template_label;
DROP TABLE public.order_element_template;
DROP TABLE public.order_element_label;
DROP TABLE public.order_element;
DROP TABLE public.order_authorization;
DROP TABLE public.material_category;
DROP TABLE public.material_assigment_template;
DROP TABLE public.material_assigment;
DROP TABLE public.material;
DROP TABLE public.manual_function;
DROP TABLE public.machine_workers_configuration_unit;
DROP TABLE public.machine_worker_assignment;
DROP TABLE public.machine_configuration_unit_required_criterions;
DROP TABLE public.machine;
DROP TABLE public.line_field;
DROP TABLE public.limiting_resource_queue_element;
DROP TABLE public.limiting_resource_queue_dependency;
DROP TABLE public.limiting_resource_queue;
DROP TABLE public.label_type;
DROP TABLE public.label;
DROP SEQUENCE public.job_scheduler_configuration_id_seq;
DROP TABLE public.job_scheduler_configuration;
DROP TABLE public.indirect_advance_assignment;
DROP TABLE public.hours_group;
DROP TABLE public.hour_cost;
DROP TABLE public.hibernate_unique_key;
DROP TABLE public.heading_field;
DROP TABLE public.generic_resource_allocation;
DROP TABLE public.generic_day_assignments_container;
DROP TABLE public.external_company;
DROP TABLE public.expense_sheet_line;
DROP TABLE public.expense_sheet;
DROP TABLE public.entity_sequence;
DROP TABLE public.end_date_communication;
DROP TABLE public.direct_advance_assignment;
DROP TABLE public.description_values_in_line;
DROP TABLE public.description_values;
DROP TABLE public.derived_day_assignments_container;
DROP TABLE public.derived_allocation;
DROP TABLE public.dependency;
DROP TABLE public.deadline_communication;
DROP TABLE public.day_assignment;
DROP TABLE public.databasechangeloglock;
DROP TABLE public.databasechangelog;
DROP TABLE public.customer_communication;
DROP TABLE public.criterion_type;
DROP TABLE public.criterion_satisfaction;
DROP TABLE public.criterion_requirement;
DROP TABLE public.criterion;
DROP TABLE public.cost_category;
DROP TABLE public.consolidation;
DROP TABLE public.consolidated_value;
DROP TABLE public.connector_property;
DROP SEQUENCE public.connector_id_seq;
DROP TABLE public.connector;
DROP TABLE public.configuration_roles_ldap;
DROP TABLE public.configuration;
DROP TABLE public.capacity_per_day;
DROP TABLE public.calendar_exception_type;
DROP TABLE public.calendar_exception;
DROP TABLE public.calendar_data;
DROP TABLE public.calendar_availability;
DROP TABLE public.base_calendar;
DROP TABLE public.assignment_function;
DROP TABLE public.all_criterions;
DROP TABLE public.advance_type;
DROP TABLE public.advance_measurement;
DROP TABLE public.advance_assignment_template;
DROP TABLE public.advance_assignment;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: advance_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE advance_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    report_global_advance boolean,
    advance_type_id bigint
);


ALTER TABLE public.advance_assignment OWNER TO libreplan;

--
-- Name: advance_assignment_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE advance_assignment_template (
    id bigint NOT NULL,
    version bigint NOT NULL,
    advance_type_id bigint,
    order_element_template_id bigint,
    report_global_advance boolean,
    max_value numeric(19,2)
);


ALTER TABLE public.advance_assignment_template OWNER TO libreplan;

--
-- Name: advance_measurement; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE advance_measurement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    advance_assignment_id bigint,
    communication_date timestamp with time zone
);


ALTER TABLE public.advance_measurement OWNER TO libreplan;

--
-- Name: advance_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE advance_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    unit_name character varying(255),
    default_max_value numeric(19,4),
    updatable boolean,
    unit_precision numeric(19,4),
    active boolean,
    percentage boolean,
    quality_form boolean,
    read_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.advance_type OWNER TO libreplan;

--
-- Name: all_criterions; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE all_criterions (
    generic_resource_allocation_id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.all_criterions OWNER TO libreplan;

--
-- Name: assignment_function; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE assignment_function (
    id bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.assignment_function OWNER TO libreplan;

--
-- Name: base_calendar; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE base_calendar (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    code_autogenerated boolean,
    last_sequence_code integer
);


ALTER TABLE public.base_calendar OWNER TO libreplan;

--
-- Name: calendar_availability; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE calendar_availability (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    start_date date,
    end_date date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendar_availability OWNER TO libreplan;

--
-- Name: calendar_data; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE calendar_data (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    parent bigint,
    expiring_date date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendar_data OWNER TO libreplan;

--
-- Name: calendar_exception; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE calendar_exception (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    date date,
    standard_effort integer,
    calendar_exception_id bigint,
    base_calendar_id bigint,
    allowed_extra_effort integer
);


ALTER TABLE public.calendar_exception OWNER TO libreplan;

--
-- Name: calendar_exception_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE calendar_exception_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    code_autogenerated boolean NOT NULL,
    name character varying(255),
    color character varying(255),
    standard_effort integer,
    allowed_extra_effort integer,
    updatable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.calendar_exception_type OWNER TO libreplan;

--
-- Name: capacity_per_day; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE capacity_per_day (
    base_calendar_id bigint NOT NULL,
    standard_effort integer,
    day_id integer NOT NULL,
    allowed_extra_effort integer
);


ALTER TABLE public.capacity_per_day OWNER TO libreplan;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE configuration (
    id bigint NOT NULL,
    version bigint NOT NULL,
    configuration_id bigint,
    company_code character varying(255),
    generate_code_for_cost_category boolean NOT NULL,
    generate_code_for_calendar_exception_type boolean NOT NULL,
    generate_code_for_work_report_type boolean NOT NULL,
    generate_code_for_criterion boolean NOT NULL,
    generate_code_for_label boolean NOT NULL,
    generate_code_for_work_report boolean NOT NULL,
    generate_code_for_resources boolean NOT NULL,
    generate_code_for_types_of_work_hours boolean NOT NULL,
    generate_code_for_material_categories boolean NOT NULL,
    generate_code_for_unit_types boolean NOT NULL,
    generate_code_for_base_calendars boolean NOT NULL,
    monte_carlo_method_tab_visible boolean NOT NULL,
    progress_type integer,
    company_logo_url character varying(255),
    scenarios_visible boolean,
    changed_default_admin_password boolean DEFAULT false NOT NULL,
    changed_default_wsreader_password boolean DEFAULT false NOT NULL,
    changed_default_wswriter_password boolean DEFAULT false NOT NULL,
    ldap_host character varying(255),
    ldap_port character varying(5),
    ldap_base character varying(255),
    ldap_userdn character varying(255),
    ldap_password character varying(255),
    ldap_userid character varying(255),
    ldap_save_password_db boolean DEFAULT true NOT NULL,
    ldap_auth_enabled boolean DEFAULT false NOT NULL,
    ldap_save_roles_db boolean DEFAULT false NOT NULL,
    ldap_group_path character varying(255),
    ldap_role_property character varying(255),
    ldap_search_query character varying(255),
    enabled_autocomplete_login boolean DEFAULT true NOT NULL,
    ldap_group_strategy boolean DEFAULT true NOT NULL,
    check_new_version_enabled boolean DEFAULT true NOT NULL,
    allow_to_gather_usage_stats_enabled boolean DEFAULT false NOT NULL,
    generate_code_for_expense_sheets boolean DEFAULT true NOT NULL,
    currency_code character varying(255) DEFAULT 'EUR'::character varying NOT NULL,
    currency_symbol character varying(255) DEFAULT '€'::character varying NOT NULL,
    personal_timesheets_type_of_work_hours bigint,
    changed_default_wssubcontracting_password boolean DEFAULT false NOT NULL,
    changed_default_manager_password boolean DEFAULT false NOT NULL,
    changed_default_hresources_password boolean DEFAULT false NOT NULL,
    changed_default_outsourcing_password boolean DEFAULT false NOT NULL,
    changed_default_reports_password boolean DEFAULT false NOT NULL,
    personal_timesheets_periodicity integer,
    max_users integer,
    max_resources integer,
    seconds_planning_warning integer NOT NULL
);


ALTER TABLE public.configuration OWNER TO libreplan;

--
-- Name: configuration_roles_ldap; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE configuration_roles_ldap (
    role_libreplan character varying(255) NOT NULL,
    role_ldap character varying(255) NOT NULL,
    id_configuration bigint NOT NULL
);


ALTER TABLE public.configuration_roles_ldap OWNER TO libreplan;

--
-- Name: connector; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE connector (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.connector OWNER TO libreplan;

--
-- Name: connector_id_seq; Type: SEQUENCE; Schema: public; Owner: libreplan
--

CREATE SEQUENCE connector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connector_id_seq OWNER TO libreplan;

--
-- Name: connector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: libreplan
--

ALTER SEQUENCE connector_id_seq OWNED BY connector.id;


--
-- Name: connector_property; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE connector_property (
    connector_id bigint NOT NULL,
    connector_property_position integer NOT NULL,
    property_key character varying(255) NOT NULL,
    property_value character varying(255)
);


ALTER TABLE public.connector_property OWNER TO libreplan;

--
-- Name: consolidated_value; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE consolidated_value (
    id bigint NOT NULL,
    consolidated_value_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    task_end_date date,
    consolidation_id bigint,
    advance_measurement_id bigint,
    task_end_date_effort_duration integer DEFAULT 0
);


ALTER TABLE public.consolidated_value OWNER TO libreplan;

--
-- Name: consolidation; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE consolidation (
    id bigint NOT NULL,
    consolidation_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    dir_advance_assignment_id bigint,
    ind_advance_assignment_id bigint
);


ALTER TABLE public.consolidation OWNER TO libreplan;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    code_autogenerated boolean NOT NULL,
    last_hour_cost_sequence_code integer NOT NULL,
    enabled boolean
);


ALTER TABLE public.cost_category OWNER TO libreplan;

--
-- Name: criterion; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE criterion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    predefined_criterion_internal_name character varying(255),
    active boolean,
    id_criterion_type bigint NOT NULL,
    parent bigint
);


ALTER TABLE public.criterion OWNER TO libreplan;

--
-- Name: criterion_requirement; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE criterion_requirement (
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


ALTER TABLE public.criterion_requirement OWNER TO libreplan;

--
-- Name: criterion_satisfaction; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE criterion_satisfaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    start_date date NOT NULL,
    finish_date date,
    is_deleted boolean,
    criterion bigint NOT NULL,
    resource bigint NOT NULL
);


ALTER TABLE public.criterion_satisfaction OWNER TO libreplan;

--
-- Name: criterion_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE criterion_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    predefined_type_internal_name character varying(255),
    description character varying(255),
    allow_simultaneous_criterions_per_resource boolean,
    allow_hierarchy boolean,
    last_criterion_sequence_code integer,
    enabled boolean,
    code_autogenerated boolean NOT NULL,
    resource integer
);


ALTER TABLE public.criterion_type OWNER TO libreplan;

--
-- Name: customer_communication; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE customer_communication (
    id bigint NOT NULL,
    version bigint NOT NULL,
    deadline timestamp with time zone,
    communication_type integer,
    communication_date timestamp with time zone,
    reviewed boolean,
    order_id bigint
);


ALTER TABLE public.customer_communication OWNER TO libreplan;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE databasechangelog (
    id character varying(63) NOT NULL,
    author character varying(63) NOT NULL,
    filename character varying(200) NOT NULL,
    dateexecuted timestamp with time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20)
);


ALTER TABLE public.databasechangelog OWNER TO libreplan;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp with time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO libreplan;

--
-- Name: day_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
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


ALTER TABLE public.day_assignment OWNER TO libreplan;

--
-- Name: deadline_communication; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE deadline_communication (
    id bigint NOT NULL,
    version bigint NOT NULL,
    save_date timestamp with time zone,
    deliver_date timestamp with time zone,
    order_id bigint
);


ALTER TABLE public.deadline_communication OWNER TO libreplan;

--
-- Name: dependency; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE dependency (
    id bigint NOT NULL,
    version bigint NOT NULL,
    origin bigint,
    destination bigint,
    queue_dependency bigint,
    type integer
);


ALTER TABLE public.dependency OWNER TO libreplan;

--
-- Name: derived_allocation; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE derived_allocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    configurationunit bigint NOT NULL
);


ALTER TABLE public.derived_allocation OWNER TO libreplan;

--
-- Name: derived_day_assignments_container; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE derived_day_assignments_container (
    id bigint NOT NULL,
    version bigint NOT NULL,
    derived_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.derived_day_assignments_container OWNER TO libreplan;

--
-- Name: description_values; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE description_values (
    description_value_id bigint NOT NULL,
    fieldname character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values OWNER TO libreplan;

--
-- Name: description_values_in_line; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE description_values_in_line (
    description_value_id bigint NOT NULL,
    field_name character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values_in_line OWNER TO libreplan;

--
-- Name: direct_advance_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE direct_advance_assignment (
    advance_assignment_id bigint NOT NULL,
    direct_order_element_id bigint,
    max_value numeric(19,2)
);


ALTER TABLE public.direct_advance_assignment OWNER TO libreplan;

--
-- Name: end_date_communication; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE end_date_communication (
    id bigint NOT NULL,
    version bigint NOT NULL,
    save_date timestamp with time zone,
    end_date timestamp with time zone,
    communication_date timestamp with time zone,
    order_id bigint,
    subcontracted_task_data_id bigint
);


ALTER TABLE public.end_date_communication OWNER TO libreplan;

--
-- Name: entity_sequence; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE entity_sequence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    entity_name integer,
    prefix character varying(255),
    last_value integer,
    number_of_digits integer,
    active boolean
);


ALTER TABLE public.entity_sequence OWNER TO libreplan;

--
-- Name: expense_sheet; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE expense_sheet (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    code_autogenerated boolean,
    first_expense date,
    last_expense date,
    total numeric(19,2),
    description text,
    last_expense_sheet_line_sequence_code integer,
    personal boolean DEFAULT false NOT NULL
);


ALTER TABLE public.expense_sheet OWNER TO libreplan;

--
-- Name: expense_sheet_line; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE expense_sheet_line (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    value numeric(19,2),
    concept character varying(255),
    date date,
    order_element_id bigint,
    resource_id bigint,
    expense_sheet_id bigint
);


ALTER TABLE public.expense_sheet_line OWNER TO libreplan;

--
-- Name: external_company; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE external_company (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    nif character varying(255),
    client boolean,
    subcontractor boolean,
    interacts_with_applications boolean,
    app_uri character varying(255),
    our_company_login character varying(255),
    our_company_password character varying(255),
    company_user bigint
);


ALTER TABLE public.external_company OWNER TO libreplan;

--
-- Name: generic_day_assignments_container; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE generic_day_assignments_container (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint,
    start_date date,
    duration_start_in_first_day integer,
    end_date date,
    duration_in_last_day integer
);


ALTER TABLE public.generic_day_assignments_container OWNER TO libreplan;

--
-- Name: generic_resource_allocation; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE generic_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource_type integer
);


ALTER TABLE public.generic_resource_allocation OWNER TO libreplan;

--
-- Name: heading_field; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE heading_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.heading_field OWNER TO libreplan;

--
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE hibernate_unique_key (
    next_hi integer
);


ALTER TABLE public.hibernate_unique_key OWNER TO libreplan;

--
-- Name: hour_cost; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE hour_cost (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    price_cost numeric(19,2),
    init_date date,
    end_date date,
    type_of_work_hours_id bigint,
    cost_category_id bigint
);


ALTER TABLE public.hour_cost OWNER TO libreplan;

--
-- Name: hours_group; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE hours_group (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    resource_type character varying(255),
    working_hours integer NOT NULL,
    percentage numeric(19,2),
    fixed_percentage boolean,
    parent_order_line bigint,
    order_line_template bigint
);


ALTER TABLE public.hours_group OWNER TO libreplan;

--
-- Name: indirect_advance_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE indirect_advance_assignment (
    advance_assignment_id bigint NOT NULL,
    indirect_order_element_id bigint
);


ALTER TABLE public.indirect_advance_assignment OWNER TO libreplan;

--
-- Name: job_scheduler_configuration; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE job_scheduler_configuration (
    id bigint NOT NULL,
    version bigint NOT NULL,
    job_group character varying(255) NOT NULL,
    job_name character varying(255) NOT NULL,
    cron_expression character varying(255) NOT NULL,
    job_class_name integer NOT NULL,
    connector_name character varying(255),
    schedule boolean
);


ALTER TABLE public.job_scheduler_configuration OWNER TO libreplan;

--
-- Name: job_scheduler_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: libreplan
--

CREATE SEQUENCE job_scheduler_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_scheduler_configuration_id_seq OWNER TO libreplan;

--
-- Name: job_scheduler_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: libreplan
--

ALTER SEQUENCE job_scheduler_configuration_id_seq OWNED BY job_scheduler_configuration.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE label (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    label_type_id bigint
);


ALTER TABLE public.label OWNER TO libreplan;

--
-- Name: label_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE label_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    code_autogenerated boolean NOT NULL,
    last_label_sequence_code integer
);


ALTER TABLE public.label_type OWNER TO libreplan;

--
-- Name: limiting_resource_queue; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE limiting_resource_queue (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_id bigint
);


ALTER TABLE public.limiting_resource_queue OWNER TO libreplan;

--
-- Name: limiting_resource_queue_dependency; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE limiting_resource_queue_dependency (
    id bigint NOT NULL,
    type integer,
    origin_queue_element_id bigint,
    destiny_queue_element_id bigint
);


ALTER TABLE public.limiting_resource_queue_dependency OWNER TO libreplan;

--
-- Name: limiting_resource_queue_element; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE limiting_resource_queue_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    limiting_resource_queue_id bigint,
    earlier_start_date_because_of_gantt timestamp with time zone,
    earliest_end_date_because_of_gantt timestamp with time zone,
    creation_timestamp bigint,
    start_date date,
    start_hour integer,
    end_date date,
    end_hour integer
);


ALTER TABLE public.limiting_resource_queue_element OWNER TO libreplan;

--
-- Name: line_field; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE line_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.line_field OWNER TO libreplan;

--
-- Name: machine; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE machine (
    machine_id bigint NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.machine OWNER TO libreplan;

--
-- Name: machine_configuration_unit_required_criterions; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE machine_configuration_unit_required_criterions (
    id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.machine_configuration_unit_required_criterions OWNER TO libreplan;

--
-- Name: machine_worker_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE machine_worker_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    start_date timestamp with time zone,
    finish_date timestamp with time zone,
    configuration_id bigint NOT NULL,
    worker_id bigint
);


ALTER TABLE public.machine_worker_assignment OWNER TO libreplan;

--
-- Name: machine_workers_configuration_unit; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE machine_workers_configuration_unit (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    alpha numeric(19,2) NOT NULL,
    machine bigint NOT NULL
);


ALTER TABLE public.machine_workers_configuration_unit OWNER TO libreplan;

--
-- Name: manual_function; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE manual_function (
    assignment_function_id bigint NOT NULL
);


ALTER TABLE public.manual_function OWNER TO libreplan;

--
-- Name: material; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
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


ALTER TABLE public.material OWNER TO libreplan;

--
-- Name: material_assigment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE material_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units numeric(19,2),
    unit_price numeric(19,2),
    material_id bigint,
    estimated_availability timestamp with time zone,
    status integer,
    order_element_id bigint
);


ALTER TABLE public.material_assigment OWNER TO libreplan;

--
-- Name: material_assigment_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE material_assigment_template (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units numeric(19,2),
    unit_price numeric(19,2),
    material_id bigint,
    order_element_template_id bigint
);


ALTER TABLE public.material_assigment_template OWNER TO libreplan;

--
-- Name: material_category; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE material_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    code_autogenerated boolean NOT NULL,
    last_material_sequence_code integer NOT NULL,
    parent_id bigint
);


ALTER TABLE public.material_category OWNER TO libreplan;

--
-- Name: order_authorization; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_authorization (
    id bigint NOT NULL,
    order_authorization_subclass character varying(255) NOT NULL,
    version bigint NOT NULL,
    authorization_type character varying(255) NOT NULL,
    order_id bigint,
    user_id bigint,
    profile_id bigint
);


ALTER TABLE public.order_authorization OWNER TO libreplan;

--
-- Name: order_element; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description text,
    code character varying(255),
    init_date timestamp with time zone,
    deadline timestamp with time zone,
    last_advance_meausurement_for_spreading numeric(19,2),
    dirty_last_advance_measurement_for_spreading boolean,
    parent bigint,
    template bigint,
    external_code character varying(255),
    position_in_container integer
);


ALTER TABLE public.order_element OWNER TO libreplan;

--
-- Name: order_element_label; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_element_label (
    order_element_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_label OWNER TO libreplan;

--
-- Name: order_element_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_element_template (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description text,
    start_as_days_from_beginning integer,
    deadline_as_days_from_beginning integer,
    scheduling_state_type integer,
    parent bigint,
    position_in_container integer
);


ALTER TABLE public.order_element_template OWNER TO libreplan;

--
-- Name: order_element_template_label; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_element_template_label (
    order_element_template_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_label OWNER TO libreplan;

--
-- Name: order_element_template_quality_form; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_element_template_quality_form (
    order_element_template_id bigint NOT NULL,
    quality_form_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_quality_form OWNER TO libreplan;

--
-- Name: order_line; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_line (
    order_element_id bigint NOT NULL,
    last_hours_group_sequence_code integer,
    budget numeric(19,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.order_line OWNER TO libreplan;

--
-- Name: order_line_group; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_line_group (
    order_element_id bigint NOT NULL
);


ALTER TABLE public.order_line_group OWNER TO libreplan;

--
-- Name: order_line_group_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_line_group_template (
    group_template_id bigint NOT NULL
);


ALTER TABLE public.order_line_group_template OWNER TO libreplan;

--
-- Name: order_line_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_line_template (
    order_line_template_id bigint NOT NULL,
    last_hours_group_sequence_code integer,
    budget numeric(19,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.order_line_template OWNER TO libreplan;

--
-- Name: order_sync_info; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_sync_info (
    id bigint NOT NULL,
    version bigint NOT NULL,
    last_sync_date timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    connector_name character varying(255) NOT NULL,
    order_element_id bigint
);


ALTER TABLE public.order_sync_info OWNER TO libreplan;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_table (
    order_element_id bigint NOT NULL,
    responsible character varying(255),
    dependencies_constraints_have_priority boolean,
    code_autogenerated boolean,
    last_order_element_sequence_code integer,
    work_budget numeric(19,2),
    materials_budget numeric(19,2),
    total_hours integer,
    customer_reference character varying(255),
    external_code character varying(255),
    state integer,
    customer bigint,
    base_calendar_id bigint,
    scheduling_mode integer
);


ALTER TABLE public.order_table OWNER TO libreplan;

--
-- Name: order_template; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_template (
    order_template_id bigint NOT NULL,
    base_calendar_id bigint
);


ALTER TABLE public.order_template OWNER TO libreplan;

--
-- Name: order_version; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE order_version (
    id bigint NOT NULL,
    version bigint NOT NULL,
    modification_by_owner_timestamp timestamp with time zone,
    ownerscenario bigint
);


ALTER TABLE public.order_version OWNER TO libreplan;

--
-- Name: planning_data; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE planning_data (
    planning_data_id bigint NOT NULL,
    progress_by_duration numeric(19,6),
    progress_by_num_hours numeric(19,6),
    progress_all_by_num_hours numeric(19,6),
    version bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.planning_data OWNER TO libreplan;

--
-- Name: profile_roles; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE profile_roles (
    profile_id bigint NOT NULL,
    role character varying(255)
);


ALTER TABLE public.profile_roles OWNER TO libreplan;

--
-- Name: profile_table; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE profile_table (
    id bigint NOT NULL,
    version bigint NOT NULL,
    profile_name character varying(255) NOT NULL
);


ALTER TABLE public.profile_table OWNER TO libreplan;

--
-- Name: quality_form; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    quality_form_type integer,
    report_advance boolean,
    advance_type_id bigint
);


ALTER TABLE public.quality_form OWNER TO libreplan;

--
-- Name: quality_form_items; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE quality_form_items (
    quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    idx integer NOT NULL
);


ALTER TABLE public.quality_form_items OWNER TO libreplan;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    code_autogenerated boolean NOT NULL,
    base_calendar_id bigint,
    resource_type character varying(64) NOT NULL
);


ALTER TABLE public.resource OWNER TO libreplan;

--
-- Name: resource_allocation; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE resource_allocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resources_per_day numeric(19,2),
    intended_total_hours integer,
    task bigint,
    assignment_function bigint,
    intended_resources_per_day numeric(19,2),
    intended_total_assignment integer DEFAULT 0,
    intended_non_consolidated_effort integer DEFAULT 0
);


ALTER TABLE public.resource_allocation OWNER TO libreplan;

--
-- Name: resource_calendar; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE resource_calendar (
    base_calendar_id bigint NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.resource_calendar OWNER TO libreplan;

--
-- Name: resources_cost_category_assignment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE resources_cost_category_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    init_date date,
    end_date date,
    cost_category_id bigint,
    resource_id bigint
);


ALTER TABLE public.resources_cost_category_assignment OWNER TO libreplan;

--
-- Name: roles_table; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE roles_table (
    user_id bigint NOT NULL,
    role character varying(255)
);


ALTER TABLE public.roles_table OWNER TO libreplan;

--
-- Name: scenario; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE scenario (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    last_not_owned_reassignations_time_stamp timestamp with time zone,
    predecessor bigint
);


ALTER TABLE public.scenario OWNER TO libreplan;

--
-- Name: scenario_orders; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE scenario_orders (
    order_id bigint NOT NULL,
    order_version_id bigint NOT NULL,
    scenario_id bigint NOT NULL
);


ALTER TABLE public.scenario_orders OWNER TO libreplan;

--
-- Name: scheduling_data_for_version; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE scheduling_data_for_version (
    id bigint NOT NULL,
    version bigint NOT NULL,
    scheduling_state_type integer,
    order_element_id bigint
);


ALTER TABLE public.scheduling_data_for_version OWNER TO libreplan;

--
-- Name: scheduling_states_by_order_version; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE scheduling_states_by_order_version (
    order_element_id bigint NOT NULL,
    scheduling_state_for_version_id bigint NOT NULL,
    order_version_id bigint NOT NULL
);


ALTER TABLE public.scheduling_states_by_order_version OWNER TO libreplan;

--
-- Name: sigmoid_function; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE sigmoid_function (
    assignment_function_id bigint NOT NULL
);


ALTER TABLE public.sigmoid_function OWNER TO libreplan;

--
-- Name: specific_day_assignments_container; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE specific_day_assignments_container (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint,
    start_date date,
    duration_start_in_first_day integer,
    end_date date,
    duration_in_last_day integer
);


ALTER TABLE public.specific_day_assignments_container OWNER TO libreplan;

--
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO libreplan;

--
-- Name: stretches; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE stretches (
    assignment_function_id bigint NOT NULL,
    length_percentage numeric(19,2) NOT NULL,
    amount_work_percentage numeric(19,2) NOT NULL,
    stretch_position integer NOT NULL
);


ALTER TABLE public.stretches OWNER TO libreplan;

--
-- Name: stretches_function; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE stretches_function (
    assignment_function_id bigint NOT NULL,
    type integer
);


ALTER TABLE public.stretches_function OWNER TO libreplan;

--
-- Name: subcontracted_task_data; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE subcontracted_task_data (
    id bigint NOT NULL,
    version bigint NOT NULL,
    external_company bigint,
    subcontratation_date timestamp with time zone,
    subcontract_communication_date timestamp with time zone,
    work_description character varying(255),
    subcontract_price numeric(19,2),
    subcontracted_code character varying(255),
    node_without_children_exported boolean,
    labels_exported boolean,
    material_assignments_exported boolean,
    hours_groups_exported boolean,
    state integer
);


ALTER TABLE public.subcontracted_task_data OWNER TO libreplan;

--
-- Name: subcontractor_communication; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE subcontractor_communication (
    id bigint NOT NULL,
    version bigint NOT NULL,
    communication_type integer,
    communication_date timestamp with time zone,
    reviewed boolean,
    subcontracted_task_data bigint
);


ALTER TABLE public.subcontractor_communication OWNER TO libreplan;

--
-- Name: subcontractor_communication_values; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE subcontractor_communication_values (
    subcontractor_communication_id bigint NOT NULL,
    date timestamp with time zone,
    progress numeric(19,2),
    idx integer NOT NULL
);


ALTER TABLE public.subcontractor_communication_values OWNER TO libreplan;

--
-- Name: subcontractor_deliver_date; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE subcontractor_deliver_date (
    id bigint NOT NULL,
    version bigint NOT NULL,
    save_date timestamp with time zone,
    subcontractor_deliver_date timestamp with time zone,
    communication_date timestamp with time zone,
    subcontracted_task_data_id bigint
);


ALTER TABLE public.subcontractor_deliver_date OWNER TO libreplan;

--
-- Name: sum_charged_effort; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE sum_charged_effort (
    id bigint NOT NULL,
    version bigint NOT NULL,
    direct_charged_effort integer,
    indirect_charged_effort integer,
    order_element bigint,
    first_timesheet_date timestamp with time zone,
    last_timesheet_date timestamp with time zone,
    finished_timesheets boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sum_charged_effort OWNER TO libreplan;

--
-- Name: sum_expenses; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE sum_expenses (
    id bigint NOT NULL,
    version bigint NOT NULL,
    order_element_id bigint,
    total_direct_expenses numeric(19,2),
    total_indirect_expenses numeric(19,2)
);


ALTER TABLE public.sum_expenses OWNER TO libreplan;

--
-- Name: task; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    calculated_value integer,
    constraint_type integer,
    constraint_date date,
    workable_days integer,
    allocation_direction integer,
    subcontrated_task_data_id bigint,
    priority integer,
    constraint_date_effort_duration integer DEFAULT 0
);


ALTER TABLE public.task OWNER TO libreplan;

--
-- Name: task_element; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    notes text,
    start_date date NOT NULL,
    start_day_duration integer,
    end_date date NOT NULL,
    end_day_duration integer,
    deadline date,
    advance_percentage numeric(19,4),
    sum_of_assigned_effort integer,
    parent bigint,
    base_calendar_id bigint,
    position_in_parent integer,
    updated_from_timesheets boolean DEFAULT false NOT NULL
);


ALTER TABLE public.task_element OWNER TO libreplan;

--
-- Name: task_group; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_group (
    task_element_id bigint NOT NULL
);


ALTER TABLE public.task_group OWNER TO libreplan;

--
-- Name: task_milestone; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_milestone (
    task_element_id bigint NOT NULL,
    constraint_type integer,
    constraint_date date,
    constraint_date_effort_duration integer DEFAULT 0
);


ALTER TABLE public.task_milestone OWNER TO libreplan;

--
-- Name: task_quality_form; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    quality_form_id bigint,
    order_element_id bigint,
    report_advance boolean
);


ALTER TABLE public.task_quality_form OWNER TO libreplan;

--
-- Name: task_quality_form_items; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_quality_form_items (
    task_quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    passed boolean,
    date timestamp with time zone,
    idx integer NOT NULL
);


ALTER TABLE public.task_quality_form_items OWNER TO libreplan;

--
-- Name: task_source; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_source (
    id bigint NOT NULL,
    version bigint NOT NULL,
    schedulingdata bigint
);


ALTER TABLE public.task_source OWNER TO libreplan;

--
-- Name: task_source_hours_groups; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE task_source_hours_groups (
    task_source_id bigint NOT NULL,
    hours_group_id bigint NOT NULL
);


ALTER TABLE public.task_source_hours_groups OWNER TO libreplan;

--
-- Name: type_of_work_hours; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE type_of_work_hours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    default_price numeric(19,2),
    enabled boolean,
    code_autogenerated boolean NOT NULL
);


ALTER TABLE public.type_of_work_hours OWNER TO libreplan;

--
-- Name: unit_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE unit_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    measure character varying(255),
    code_autogenerated boolean NOT NULL
);


ALTER TABLE public.unit_type OWNER TO libreplan;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE user_profiles (
    user_id bigint NOT NULL,
    profile_id bigint NOT NULL
);


ALTER TABLE public.user_profiles OWNER TO libreplan;

--
-- Name: user_table; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE user_table (
    id bigint NOT NULL,
    version bigint NOT NULL,
    login_name character varying(255) NOT NULL,
    password character varying(255),
    email character varying(255),
    disabled boolean,
    lastconnectedscenario bigint,
    libreplan_user boolean DEFAULT true NOT NULL,
    application_language integer DEFAULT 0,
    expand_company_planning_view_charts boolean DEFAULT false NOT NULL,
    expand_order_planning_view_charts boolean DEFAULT true NOT NULL,
    expand_resource_load_view_charts boolean DEFAULT true NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    projects_filter_period_since integer,
    projects_filter_period_to integer,
    resources_load_filter_period_since integer,
    resources_load_filter_period_to integer,
    projects_filter_label_id bigint,
    resources_load_filter_criterion_id bigint
);


ALTER TABLE public.user_table OWNER TO libreplan;

--
-- Name: virtual_worker; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE virtual_worker (
    virtual_worker_id bigint NOT NULL,
    observations character varying(255)
);


ALTER TABLE public.virtual_worker OWNER TO libreplan;

--
-- Name: work_report; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE work_report (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    date timestamp with time zone,
    code_autogenerated boolean NOT NULL,
    last_work_report_line_sequence_code integer,
    ork_report_type_id bigint NOT NULL,
    resource_id bigint,
    order_element_id bigint
);


ALTER TABLE public.work_report OWNER TO libreplan;

--
-- Name: work_report_label_type_assigment; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE work_report_label_type_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    labels_shared_by_lines boolean,
    position_number integer,
    label_type_id bigint,
    label_id bigint,
    work_report_type_id bigint
);


ALTER TABLE public.work_report_label_type_assigment OWNER TO libreplan;

--
-- Name: work_report_line; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE work_report_line (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    effort integer,
    date timestamp with time zone,
    clock_start integer,
    clock_finish integer,
    work_report_id bigint,
    resource_id bigint NOT NULL,
    order_element_id bigint NOT NULL,
    type_work_hours_id bigint NOT NULL,
    finished boolean DEFAULT false NOT NULL
);


ALTER TABLE public.work_report_line OWNER TO libreplan;

--
-- Name: work_report_type; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE work_report_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    date_is_shared_by_lines boolean,
    resource_is_shared_in_lines boolean,
    order_element_is_shared_in_lines boolean,
    code_autogenerated boolean NOT NULL,
    hours_management integer
);


ALTER TABLE public.work_report_type OWNER TO libreplan;

--
-- Name: worker; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE worker (
    worker_id bigint NOT NULL,
    first_name character varying(255),
    surname character varying(255),
    nif character varying(255),
    user_id bigint
);


ALTER TABLE public.worker OWNER TO libreplan;

--
-- Name: workreports_labels; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE workreports_labels (
    work_report_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreports_labels OWNER TO libreplan;

--
-- Name: workreportslines_labels; Type: TABLE; Schema: public; Owner: libreplan; Tablespace: 
--

CREATE TABLE workreportslines_labels (
    work_report_line_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreportslines_labels OWNER TO libreplan;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY connector ALTER COLUMN id SET DEFAULT nextval('connector_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY job_scheduler_configuration ALTER COLUMN id SET DEFAULT nextval('job_scheduler_configuration_id_seq'::regclass);


--
-- Data for Name: advance_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY advance_assignment (id, version, report_global_advance, advance_type_id) FROM stdin;
4196	11	t	1314
16142	31	t	1314
16088	36	t	1314
16108	35	t	1314
16156	27	t	1314
4141	9	t	1314
4142	9	t	1314
4143	9	t	1314
4144	9	t	1313
4145	9	f	1314
4148	7	t	1314
4149	7	t	1314
4150	7	f	1314
4151	7	t	1313
4146	9	f	1314
4147	9	t	1313
4183	3	t	1314
16089	36	t	1313
16090	36	f	1314
16152	29	t	1314
4197	11	t	1314
4194	12	t	1314
4195	12	t	1314
4192	13	t	1313
4198	11	t	1314
4233	23	t	1314
4234	23	t	1314
4193	13	f	1314
4199	11	t	1314
4204	11	t	1314
4208	9	t	1314
15312	20	t	1314
14534	22	t	1314
15313	20	t	1314
4188	15	t	1313
4189	15	f	1314
4155	15	t	1314
4156	15	t	1314
4178	15	t	1314
4181	12	t	1314
15332	10	t	1314
4201	11	t	1313
14535	15	t	1314
16112	13	t	1314
4200	11	f	1314
15336	9	t	1314
4182	12	t	1314
15299	15	t	1314
15290	21	f	1314
4180	15	t	1313
4179	15	f	1314
15337	9	t	1314
15300	15	t	1314
16072	8	t	1314
15339	9	t	1313
15289	21	t	1313
15288	21	t	1314
15342	18	t	1314
14540	17	t	1314
15338	9	f	1314
16073	8	t	1314
16143	31	t	1314
14541	17	t	1314
14542	17	t	1314
14543	17	t	1314
15317	13	t	1314
14848	17	f	1314
14847	17	t	1313
14849	17	t	1314
14850	17	t	1314
16140	11	t	1313
14851	17	t	1314
15344	18	f	1314
15343	18	t	1313
16091	17	t	1314
4236	23	t	1313
16141	11	f	1314
14538	15	f	1314
14537	15	t	1313
14539	17	t	1314
14852	17	f	1314
4187	15	t	1314
4190	14	t	1314
4191	13	t	1314
4184	11	t	1314
4205	11	t	1314
14853	17	t	1313
16153	29	t	1314
4206	11	t	1314
16154	29	t	1313
15291	16	t	1314
14855	17	f	1314
4185	11	t	1313
4186	11	f	1314
4207	11	t	1314
4159	15	t	1313
16155	29	f	1314
15330	41	f	1314
15311	42	t	1313
4235	23	f	1314
4158	15	f	1314
14854	17	t	1313
4203	11	f	1314
4202	11	t	1313
17278	9	t	1314
17279	9	t	1314
17277	24	t	1314
17274	24	t	1314
17280	3	t	1314
17281	3	t	1314
17282	3	t	1314
17283	3	t	1314
17284	3	t	1313
17285	3	f	1314
17286	3	t	1314
17287	3	f	1314
17288	3	t	1313
17289	3	t	1313
17290	3	f	1314
17291	3	t	1313
17292	3	f	1314
\.


--
-- Data for Name: advance_assignment_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY advance_assignment_template (id, version, advance_type_id, order_element_template_id, report_global_advance, max_value) FROM stdin;
\.


--
-- Data for Name: advance_measurement; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY advance_measurement (id, version, date, value, advance_assignment_id, communication_date) FROM stdin;
\.


--
-- Data for Name: advance_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY advance_type (id, version, unit_name, default_max_value, updatable, unit_precision, active, percentage, quality_form, read_only) FROM stdin;
1313	5	children	100.0000	f	0.0100	t	t	f	f
1314	4	percentage	100.0000	f	0.0100	t	t	f	f
1315	3	units	2147483647.0000	f	1.0000	t	f	f	f
1316	2	subcontractor	100.0000	f	0.0100	t	t	f	f
1317	1	timesheets	100.0000	f	0.0100	t	t	f	t
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
6789	2335
6790	2352
6790	2334
6794	2352
6794	2334
6810	2339
6811	2345
6811	2338
6812	2345
6812	2338
6814	2354
6837	2355
6840	2343
6840	2338
6863	2342
6864	2346
6864	2341
6865	2346
6865	2341
6866	2337
6867	2339
21962	2355
21963	2354
21981	2359
21986	2347
21986	2341
22012	2340
22013	2342
25553	2360
25553	2367
25554	2357
25555	2356
25555	2363
25556	2356
25556	2363
25559	2360
25559	2367
25561	2351
25561	2334
25562	2336
25563	2335
25586	2366
25586	2360
25590	2354
25590	2365
25598	2359
25599	2361
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: base_calendar; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY base_calendar (id, version, code, name, code_autogenerated, last_sequence_code) FROM stdin;
203	2	CALENDAR0002	Calendrier standard / 5 jours par semaine	t	2
202	3	CALENDAR0001	Default	t	2
2525	1	CALENDAR0005	wednesday daddyday	t	2
2589	4	RESOURCE_CALENDAR0048	\N	t	24
2527	1	CALENDAR0008	parttime and wednesday daddyday	t	2
2531	1	CALENDAR0013	28-Germany	t	8
2554	4	RESOURCE_CALENDAR0016	\N	t	14
2548	8	RESOURCE_CALENDAR0010	\N	t	74
2583	1	CALENDAR0032	27-France	t	10
2533	2	CALENDAR0014	24-Germany	t	9
2556	6	RESOURCE_CALENDAR0018	\N	t	46
2538	1	CALENDAR0025	23-Germany	t	8
2537	9	RESOURCE_CALENDAR0002	\N	t	67
2542	1	CALENDAR0024	26-Germany	t	7
2540	3	CALENDAR0028	21-Germany	t	10
2578	3	RESOURCE_CALENDAR0038	\N	t	23
2584	5	RESOURCE_CALENDAR0043	\N	t	48
2560	1	CALENDAR0029	25-GERMANY	t	3
2558	5	RESOURCE_CALENDAR0020	\N	t	48
2541	6	RESOURCE_CALENDAR0004	\N	t	27
2557	4	RESOURCE_CALENDAR0019	\N	t	7
2590	3	RESOURCE_CALENDAR0049	\N	t	17
2586	1	RESOURCE_CALENDAR0045	\N	t	3
2585	4	RESOURCE_CALENDAR0044	\N	t	47
2568	9	RESOURCE_CALENDAR0028	\N	t	79
2587	1	RESOURCE_CALENDAR0046	\N	t	11
2588	1	RESOURCE_CALENDAR0047	\N	t	3
2571	5	RESOURCE_CALENDAR0031	\N	t	38
2574	6	RESOURCE_CALENDAR0034	\N	t	45
2572	1	RESOURCE_CALENDAR0032	\N	t	3
2592	4	RESOURCE_CALENDAR0051	\N	t	24
2550	6	RESOURCE_CALENDAR0012	\N	t	26
2551	4	RESOURCE_CALENDAR0013	\N	t	6
2591	7	RESOURCE_CALENDAR0050	\N	t	54
2581	1	RESOURCE_CALENDAR0041	\N	t	3
2582	1	RESOURCE_CALENDAR0042	\N	t	3
2555	4	RESOURCE_CALENDAR0017	\N	t	31
2565	6	RESOURCE_CALENDAR0025	\N	t	44
2576	7	RESOURCE_CALENDAR0036	\N	t	61
2566	6	RESOURCE_CALENDAR0026	\N	t	45
2563	10	RESOURCE_CALENDAR0023	\N	t	86
2567	5	RESOURCE_CALENDAR0027	\N	t	46
2544	6	RESOURCE_CALENDAR0006	\N	t	28
2569	5	RESOURCE_CALENDAR0029	\N	t	37
2547	5	RESOURCE_CALENDAR0009	\N	t	21
2580	6	RESOURCE_CALENDAR0040	\N	t	62
2561	4	RESOURCE_CALENDAR0022	\N	t	6
2546	6	RESOURCE_CALENDAR0008	\N	t	36
2529	3	CALENDAR0012	22-France	t	12
2553	9	RESOURCE_CALENDAR0015	\N	t	69
2559	3	RESOURCE_CALENDAR0021	\N	t	23
\.


--
-- Data for Name: calendar_availability; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY calendar_availability (id, version, code, start_date, end_date, base_calendar_id, position_in_calendar) FROM stdin;
3082	1	RESOURCE_CALENDAR0041-0003	2014-04-16	\N	2581	0
3083	1	RESOURCE_CALENDAR0042-0003	2014-04-16	\N	2582	0
3055	3	RESOURCE_CALENDAR0017-0017	2014-08-01	\N	2555	0
3084	5	RESOURCE_CALENDAR0043-0011	2014-08-01	\N	2584	0
3051	4	RESOURCE_CALENDAR0019-0003	2014-08-01	\N	2557	0
3090	3	RESOURCE_CALENDAR0049-0003	2014-08-01	2014-12-11	2590	0
3086	1	RESOURCE_CALENDAR0045-0003	2014-04-16	\N	2586	0
3085	4	RESOURCE_CALENDAR0044-0011	2014-08-01	2014-12-11	2585	0
3066	9	RESOURCE_CALENDAR0028-0009	2014-08-01	\N	2568	0
3035	6	RESOURCE_CALENDAR0006-0006	2014-08-01	2014-12-11	2544	0
3033	6	RESOURCE_CALENDAR0004-0006	2014-08-01	2014-08-01	2541	0
3045	3	RESOURCE_CALENDAR0004-0019	2014-08-02	\N	2541	1
3050	4	RESOURCE_CALENDAR0006-0015	2014-12-12	\N	2544	1
3087	1	RESOURCE_CALENDAR0046-0011	2014-04-16	\N	2587	0
3070	1	RESOURCE_CALENDAR0032-0003	2014-04-16	\N	2572	0
3088	1	RESOURCE_CALENDAR0047-0003	2014-04-16	\N	2588	0
3037	6	RESOURCE_CALENDAR0008-0006	2014-08-01	2014-08-01	2546	0
3052	4	RESOURCE_CALENDAR0008-0015	2014-08-02	\N	2546	1
3069	5	RESOURCE_CALENDAR0031-0009	2014-08-01	\N	2571	0
3054	3	RESOURCE_CALENDAR0021-0009	2014-08-01	\N	2559	0
3072	6	RESOURCE_CALENDAR0034-0009	2014-08-01	\N	2574	0
3092	4	RESOURCE_CALENDAR0051-0003	2014-08-01	\N	2592	0
3077	3	RESOURCE_CALENDAR0010-0046	2014-08-01	\N	2548	0
3049	6	RESOURCE_CALENDAR0018-0009	2014-08-01	2014-12-11	2556	0
3042	4	RESOURCE_CALENDAR0013-0003	2014-08-01	\N	2551	0
3091	7	RESOURCE_CALENDAR0050-0003	2014-08-01	\N	2591	0
3078	5	RESOURCE_CALENDAR0036-0024	2014-08-01	\N	2576	0
3063	6	RESOURCE_CALENDAR0025-0009	2014-08-01	\N	2565	0
3064	6	RESOURCE_CALENDAR0026-0009	2014-04-16	\N	2566	0
3031	9	RESOURCE_CALENDAR0002-0006	2014-08-01	2014-08-01	2537	0
3044	5	RESOURCE_CALENDAR0002-0023	2014-08-02	\N	2537	1
3061	10	RESOURCE_CALENDAR0023-0009	2014-08-01	\N	2563	0
3065	5	RESOURCE_CALENDAR0027-0009	2014-04-16	\N	2567	0
3067	5	RESOURCE_CALENDAR0029-0009	2014-04-16	\N	2569	0
3038	5	RESOURCE_CALENDAR0009-0003	2014-08-01	\N	2547	0
3081	6	RESOURCE_CALENDAR0040-0003	2014-08-01	2014-08-01	2580	0
3059	4	RESOURCE_CALENDAR0022-0003	2014-04-16	\N	2561	0
3076	3	RESOURCE_CALENDAR0038-0009	2014-08-01	\N	2578	0
3041	6	RESOURCE_CALENDAR0012-0006	2014-08-01	\N	2550	0
3046	9	RESOURCE_CALENDAR0015-0003	2014-08-01	\N	2553	0
3080	3	RESOURCE_CALENDAR0020-0025	2014-08-01	\N	2558	0
3089	4	RESOURCE_CALENDAR0048-0003	2014-08-01	\N	2589	0
3047	4	RESOURCE_CALENDAR0016-0003	2014-08-01	\N	2554	0
\.


--
-- Data for Name: calendar_data; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY calendar_data (id, version, code, parent, expiring_date, base_calendar_id, position_in_calendar) FROM stdin;
304	2	CALENDAR0002-0002	\N	\N	203	0
303	3	CALENDAR0001-0002	\N	\N	202	0
2626	1	CALENDAR0005-0002	202	\N	2525	0
2643	1	CALENDAR0024-0007	202	\N	2542	0
2628	1	CALENDAR0008-0002	2525	\N	2527	0
2641	3	CALENDAR0028-0008	202	\N	2540	0
2693	4	RESOURCE_CALENDAR0051-0002	2538	\N	2592	0
2661	1	CALENDAR0029-0003	\N	\N	2560	0
2642	6	RESOURCE_CALENDAR0004-0005	2529	\N	2541	0
2632	1	CALENDAR0013-0008	202	\N	2531	0
2687	1	RESOURCE_CALENDAR0045-0002	202	\N	2586	0
2690	4	RESOURCE_CALENDAR0048-0002	2538	\N	2589	0
2647	6	RESOURCE_CALENDAR0008-0005	2529	\N	2546	0
2634	2	CALENDAR0014-0008	202	\N	2533	0
2669	9	RESOURCE_CALENDAR0028-0008	2531	\N	2568	0
2660	3	RESOURCE_CALENDAR0021-0008	2540	\N	2559	0
2692	7	RESOURCE_CALENDAR0050-0002	2538	\N	2591	0
2688	1	RESOURCE_CALENDAR0046-0010	2583	\N	2587	0
2666	6	RESOURCE_CALENDAR0025-0008	2533	\N	2565	0
2639	1	CALENDAR0025-0008	202	\N	2538	0
2655	4	RESOURCE_CALENDAR0016-0002	202	\N	2554	0
2689	1	RESOURCE_CALENDAR0047-0002	202	\N	2588	0
2667	6	RESOURCE_CALENDAR0026-0008	2533	\N	2566	0
2664	10	RESOURCE_CALENDAR0023-0008	2533	\N	2563	0
2668	5	RESOURCE_CALENDAR0027-0008	2533	\N	2567	0
2672	5	RESOURCE_CALENDAR0031-0008	2531	\N	2571	0
2649	8	RESOURCE_CALENDAR0010-0008	2540	\N	2548	0
2651	6	RESOURCE_CALENDAR0012-0005	2529	\N	2550	0
2675	6	RESOURCE_CALENDAR0034-0008	2531	\N	2574	0
2682	1	RESOURCE_CALENDAR0041-0002	202	\N	2581	0
2670	5	RESOURCE_CALENDAR0029-0008	2533	\N	2569	0
2684	1	CALENDAR0032-0010	202	\N	2583	0
2657	6	RESOURCE_CALENDAR0018-0008	2540	\N	2556	0
2683	1	RESOURCE_CALENDAR0042-0002	202	\N	2582	0
2685	5	RESOURCE_CALENDAR0043-0010	2583	\N	2584	0
2656	4	RESOURCE_CALENDAR0017-0008	2540	\N	2555	0
2638	9	RESOURCE_CALENDAR0002-0005	2529	\N	2537	0
2658	4	RESOURCE_CALENDAR0019-0002	202	\N	2557	0
2673	1	RESOURCE_CALENDAR0032-0002	202	\N	2572	0
2648	5	RESOURCE_CALENDAR0009-0002	202	\N	2547	0
2691	3	RESOURCE_CALENDAR0049-0002	2538	\N	2590	0
2679	3	RESOURCE_CALENDAR0038-0008	2531	\N	2578	0
2686	4	RESOURCE_CALENDAR0044-0010	2583	\N	2585	0
2659	5	RESOURCE_CALENDAR0020-0008	2540	\N	2558	0
2681	6	RESOURCE_CALENDAR0040-0002	2583	\N	2580	0
2645	6	RESOURCE_CALENDAR0006-0005	2529	\N	2544	0
2652	4	RESOURCE_CALENDAR0013-0002	202	\N	2551	0
2662	4	RESOURCE_CALENDAR0022-0002	202	\N	2561	0
2677	7	RESOURCE_CALENDAR0036-0008	2531	\N	2576	0
2630	3	CALENDAR0012-0005	203	\N	2529	0
2654	9	RESOURCE_CALENDAR0015-0002	2538	\N	2553	0
\.


--
-- Data for Name: calendar_exception; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY calendar_exception (id, version, code, date, standard_effort, calendar_exception_id, base_calendar_id, allowed_extra_effort) FROM stdin;
1919	2	CALENDAR0002-0001	2014-04-21	0	1114	203	0
2424	1	CALENDAR0001-0001	2014-07-14	0	1114	202	0
2425	3	CALENDAR0012-0002	2014-05-01	0	1114	2529	0
2428	1	CALENDAR0013-0001	2014-12-08	0	1114	2531	0
2429	1	CALENDAR0013-0003	2014-12-25	0	1114	2531	0
2430	1	CALENDAR0013-0004	2014-12-05	0	1114	2531	0
2431	1	CALENDAR0013-0005	2014-08-15	0	1114	2531	0
2432	1	CALENDAR0013-0006	2014-12-31	0	1114	2531	0
2433	1	CALENDAR0013-0007	2014-10-13	0	1114	2531	0
2452	1	CALENDAR0025-0001	2014-10-13	0	1114	2538	0
2453	1	CALENDAR0025-0003	2014-12-31	0	1114	2538	0
2440	2	CALENDAR0014-0002	2014-12-05	0	1114	2533	0
2445	2	CALENDAR0014-0006	2014-12-25	0	1114	2533	0
2442	2	CALENDAR0014-0003	2014-10-13	0	1114	2533	0
2441	2	CALENDAR0014-0001	2014-08-15	0	1117	2533	0
2443	2	CALENDAR0014-0004	2014-12-31	0	1114	2533	0
2444	2	CALENDAR0014-0005	2014-12-08	0	1114	2533	0
2470	2	RESOURCE_CALENDAR0023-0068	2014-09-29	0	1111	2563	0
2477	2	RESOURCE_CALENDAR0023-0079	2014-09-24	0	1111	2563	0
2471	2	RESOURCE_CALENDAR0023-0069	2014-09-18	0	1111	2563	0
2454	1	CALENDAR0025-0002	2014-08-15	0	1114	2538	0
2455	1	CALENDAR0025-0004	2014-12-25	0	1114	2538	0
2456	1	CALENDAR0025-0006	2014-12-08	0	1114	2538	0
2457	1	CALENDAR0025-0005	2014-12-05	0	1114	2538	0
2458	1	CALENDAR0024-0001	2014-12-05	0	1114	2542	0
2459	1	CALENDAR0024-0002	2014-08-15	0	1114	2542	0
2460	1	CALENDAR0024-0004	2014-12-08	0	1114	2542	0
2461	1	CALENDAR0024-0003	2014-10-13	0	1114	2542	0
2462	1	CALENDAR0024-0006	2014-12-31	0	1114	2542	0
2451	4	CALENDAR0028-0003	2014-12-25	0	1114	2540	0
2465	2	RESOURCE_CALENDAR0023-0060	2014-09-27	0	1111	2563	0
2468	2	RESOURCE_CALENDAR0023-0066	2014-09-17	0	1111	2563	0
2469	2	RESOURCE_CALENDAR0023-0067	2014-09-26	0	1111	2563	0
2475	2	RESOURCE_CALENDAR0023-0074	2014-09-19	0	1111	2563	0
2446	4	CALENDAR0028-0004	2014-08-15	0	1114	2540	0
2450	4	CALENDAR0028-0001	2014-12-08	0	1114	2540	0
2448	4	CALENDAR0028-0007	2014-12-31	0	1114	2540	0
2447	4	CALENDAR0028-0005	2014-10-13	0	1114	2540	0
2449	4	CALENDAR0028-0006	2014-12-05	0	1114	2540	0
2474	2	RESOURCE_CALENDAR0023-0072	2014-09-23	0	1111	2563	0
2476	2	RESOURCE_CALENDAR0023-0076	2014-09-20	0	1111	2563	0
2463	1	CALENDAR0029-0001	2014-05-01	0	1114	2560	0
2464	1	CALENDAR0029-0002	2014-05-08	0	1114	2560	0
2478	2	RESOURCE_CALENDAR0023-0078	2014-09-25	0	1111	2563	0
2472	2	RESOURCE_CALENDAR0023-0070	2014-09-21	0	1111	2563	0
2473	2	RESOURCE_CALENDAR0023-0071	2014-09-22	0	1111	2563	0
2467	2	RESOURCE_CALENDAR0023-0065	2014-09-30	0	1111	2563	0
2466	2	RESOURCE_CALENDAR0023-0062	2014-09-28	0	1111	2563	0
2427	3	CALENDAR0012-0004	2014-05-08	0	1114	2529	0
2426	3	CALENDAR0012-0003	2014-07-14	0	1114	2529	0
2503	1	RESOURCE_CALENDAR0010-0055	2014-09-18	0	1111	2548	0
2493	1	RESOURCE_CALENDAR0006-0026	2014-10-02	0	1111	2544	0
2504	1	RESOURCE_CALENDAR0010-0056	2014-09-28	0	1111	2548	0
2505	1	RESOURCE_CALENDAR0010-0057	2014-09-21	0	1111	2548	0
2506	1	RESOURCE_CALENDAR0010-0058	2014-09-29	0	1111	2548	0
2507	1	RESOURCE_CALENDAR0010-0059	2014-09-22	0	1111	2548	0
2508	1	RESOURCE_CALENDAR0010-0060	2014-09-26	0	1111	2548	0
2509	1	RESOURCE_CALENDAR0010-0061	2014-09-30	0	1111	2548	0
2510	1	RESOURCE_CALENDAR0010-0063	2014-09-17	0	1111	2548	0
2511	1	RESOURCE_CALENDAR0010-0065	2014-09-20	0	1111	2548	0
2512	1	RESOURCE_CALENDAR0010-0066	2014-09-23	0	1111	2548	0
2494	1	RESOURCE_CALENDAR0008-0024	2014-09-21	0	1111	2546	0
2495	1	RESOURCE_CALENDAR0008-0026	2014-09-18	0	1111	2546	0
2496	1	RESOURCE_CALENDAR0008-0027	2014-09-17	0	1111	2546	0
2497	1	RESOURCE_CALENDAR0008-0030	2014-09-19	0	1111	2546	0
2498	1	RESOURCE_CALENDAR0008-0031	2014-09-22	0	1111	2546	0
2499	1	RESOURCE_CALENDAR0008-0032	2014-09-15	0	1111	2546	0
2500	1	RESOURCE_CALENDAR0008-0033	2014-10-09	0	1112	2546	0
2501	1	RESOURCE_CALENDAR0008-0028	2014-09-20	0	1111	2546	0
2502	1	RESOURCE_CALENDAR0008-0029	2014-09-16	0	1111	2546	0
3472	2	RESOURCE_CALENDAR0028-0072	2014-09-30	0	1111	2568	0
3462	2	RESOURCE_CALENDAR0028-0057	2014-09-28	0	1111	2568	0
3466	2	RESOURCE_CALENDAR0028-0064	2014-09-24	0	1111	2568	0
3459	2	RESOURCE_CALENDAR0028-0053	2014-09-17	0	1111	2568	0
3463	2	RESOURCE_CALENDAR0028-0058	2014-09-22	0	1111	2568	0
3469	2	RESOURCE_CALENDAR0028-0067	2014-09-29	0	1111	2568	0
3461	2	RESOURCE_CALENDAR0028-0056	2014-09-19	0	1111	2568	0
3468	2	RESOURCE_CALENDAR0028-0066	2014-09-18	0	1111	2568	0
2517	1	CALENDAR0032-0001	2014-05-08	0	1114	2583	0
2518	1	CALENDAR0032-0002	2014-01-01	0	1114	2583	0
2519	1	CALENDAR0032-0003	2014-05-29	0	1114	2583	0
2520	1	CALENDAR0032-0004	2014-05-01	0	1114	2583	0
2521	1	CALENDAR0032-0005	2014-08-15	0	1114	2583	0
2522	1	CALENDAR0032-0007	2014-04-21	0	1114	2583	0
2513	1	RESOURCE_CALENDAR0010-0067	2014-09-27	0	1111	2548	0
2514	1	RESOURCE_CALENDAR0010-0068	2014-09-25	0	1111	2548	0
2515	1	RESOURCE_CALENDAR0010-0071	2014-09-24	0	1111	2548	0
2516	1	RESOURCE_CALENDAR0010-0074	2014-09-19	0	1111	2548	0
2523	1	CALENDAR0032-0008	2014-12-25	0	1114	2583	0
2524	1	CALENDAR0032-0009	2014-11-11	0	1114	2583	0
3465	2	RESOURCE_CALENDAR0028-0063	2014-09-27	0	1111	2568	0
3434	1	RESOURCE_CALENDAR0018-0045	2014-10-02	0	1111	2556	0
3470	2	RESOURCE_CALENDAR0028-0068	2014-09-23	0	1111	2568	0
3475	2	RESOURCE_CALENDAR0027-0034	2014-09-15	0	1111	2567	0
3464	2	RESOURCE_CALENDAR0028-0060	2014-09-21	0	1111	2568	0
3460	2	RESOURCE_CALENDAR0028-0054	2014-09-26	0	1111	2568	0
3467	2	RESOURCE_CALENDAR0028-0065	2014-09-25	0	1111	2568	0
3471	2	RESOURCE_CALENDAR0028-0069	2014-09-20	0	1111	2568	0
3508	2	RESOURCE_CALENDAR0040-0042	2014-09-19	0	1111	2580	0
3511	2	RESOURCE_CALENDAR0040-0046	2014-09-23	0	1111	2580	0
3509	2	RESOURCE_CALENDAR0040-0044	2014-09-17	0	1111	2580	0
3513	2	RESOURCE_CALENDAR0040-0052	2014-09-21	0	1111	2580	0
3510	2	RESOURCE_CALENDAR0040-0045	2014-09-22	0	1111	2580	0
3514	2	RESOURCE_CALENDAR0040-0053	2014-09-28	0	1111	2580	0
3512	2	RESOURCE_CALENDAR0040-0050	2014-09-25	0	1111	2580	0
3435	2	RESOURCE_CALENDAR0026-0036	2014-10-02	0	1111	2566	0
3481	2	RESOURCE_CALENDAR0027-0032	2014-09-18	0	1111	2567	0
3479	2	RESOURCE_CALENDAR0027-0030	2014-09-20	0	1111	2567	0
3478	2	RESOURCE_CALENDAR0027-0029	2014-09-21	0	1111	2567	0
3476	2	RESOURCE_CALENDAR0027-0035	2014-09-16	0	1111	2567	0
3474	2	RESOURCE_CALENDAR0027-0033	2014-09-22	0	1111	2567	0
3480	2	RESOURCE_CALENDAR0027-0037	2014-09-17	0	1111	2567	0
3477	2	RESOURCE_CALENDAR0027-0026	2014-09-19	0	1111	2567	0
3482	2	RESOURCE_CALENDAR0027-0039	2014-10-09	0	1111	2567	0
3505	2	RESOURCE_CALENDAR0040-0038	2014-09-27	0	1111	2580	0
3501	2	RESOURCE_CALENDAR0040-0032	2014-09-26	0	1111	2580	0
3502	2	RESOURCE_CALENDAR0040-0034	2014-09-20	0	1111	2580	0
3493	1	RESOURCE_CALENDAR0016-0006	2014-09-17	0	1111	2554	0
3483	1	RESOURCE_CALENDAR0034-0044	2014-10-02	0	1111	2574	0
3494	1	RESOURCE_CALENDAR0016-0008	2014-09-22	0	1111	2554	0
3436	1	RESOURCE_CALENDAR0002-0051	2014-09-21	0	1111	2537	0
3437	1	RESOURCE_CALENDAR0002-0052	2014-09-30	0	1111	2537	0
3438	1	RESOURCE_CALENDAR0002-0053	2014-09-17	0	1111	2537	0
3439	1	RESOURCE_CALENDAR0002-0054	2014-09-19	0	1111	2537	0
3440	1	RESOURCE_CALENDAR0002-0055	2014-09-20	0	1111	2537	0
3441	1	RESOURCE_CALENDAR0002-0056	2014-09-22	0	1111	2537	0
3442	1	RESOURCE_CALENDAR0002-0057	2014-09-29	0	1111	2537	0
3443	1	RESOURCE_CALENDAR0002-0059	2014-09-23	0	1111	2537	0
3444	1	RESOURCE_CALENDAR0002-0061	2014-09-27	0	1111	2537	0
3445	1	RESOURCE_CALENDAR0002-0062	2014-09-26	0	1111	2537	0
3446	1	RESOURCE_CALENDAR0002-0063	2014-09-25	0	1111	2537	0
3447	1	RESOURCE_CALENDAR0002-0064	2014-09-24	0	1111	2537	0
3448	1	RESOURCE_CALENDAR0002-0065	2014-09-18	0	1111	2537	0
3449	1	RESOURCE_CALENDAR0002-0067	2014-09-28	0	1111	2537	0
3495	1	RESOURCE_CALENDAR0016-0009	2014-09-15	0	1111	2554	0
3450	1	RESOURCE_CALENDAR0020-0040	2014-09-22	0	1111	2558	0
3451	1	RESOURCE_CALENDAR0020-0033	2014-09-20	0	1111	2558	0
3452	1	RESOURCE_CALENDAR0020-0034	2014-09-16	0	1111	2558	0
3453	1	RESOURCE_CALENDAR0020-0041	2014-09-18	0	1111	2558	0
3454	1	RESOURCE_CALENDAR0020-0044	2014-09-21	0	1111	2558	0
3455	1	RESOURCE_CALENDAR0020-0045	2014-09-15	0	1111	2558	0
3456	1	RESOURCE_CALENDAR0020-0037	2014-09-17	0	1111	2558	0
3457	1	RESOURCE_CALENDAR0020-0048	2014-09-19	0	1111	2558	0
3458	1	RESOURCE_CALENDAR0020-0038	2014-10-09	0	1112	2558	0
3496	1	RESOURCE_CALENDAR0016-0011	2014-09-19	0	1111	2554	0
3497	1	RESOURCE_CALENDAR0016-0010	2014-09-18	0	1111	2554	0
3498	1	RESOURCE_CALENDAR0016-0013	2014-09-20	0	1111	2554	0
3499	1	RESOURCE_CALENDAR0016-0012	2014-09-16	0	1111	2554	0
3500	1	RESOURCE_CALENDAR0016-0014	2014-09-21	0	1111	2554	0
3484	2	RESOURCE_CALENDAR0036-0045	2014-10-09	0	1111	2576	0
3485	1	RESOURCE_CALENDAR0036-0047	2014-09-19	0	1111	2576	0
3486	1	RESOURCE_CALENDAR0036-0048	2014-09-17	0	1111	2576	0
3487	1	RESOURCE_CALENDAR0036-0057	2014-09-21	0	1111	2576	0
3488	1	RESOURCE_CALENDAR0036-0058	2014-09-16	0	1111	2576	0
3489	1	RESOURCE_CALENDAR0036-0059	2014-09-22	0	1111	2576	0
3490	1	RESOURCE_CALENDAR0036-0052	2014-09-18	0	1111	2576	0
3491	1	RESOURCE_CALENDAR0036-0053	2014-09-20	0	1111	2576	0
3492	1	RESOURCE_CALENDAR0036-0054	2014-09-15	0	1111	2576	0
3504	2	RESOURCE_CALENDAR0040-0037	2014-09-18	0	1111	2580	0
3503	2	RESOURCE_CALENDAR0040-0035	2014-09-24	0	1111	2580	0
3506	2	RESOURCE_CALENDAR0040-0039	2014-09-29	0	1111	2580	0
3507	2	RESOURCE_CALENDAR0040-0041	2014-09-30	0	1111	2580	0
3516	2	RESOURCE_CALENDAR0009-0007	2014-09-26	0	1111	2547	0
3526	2	RESOURCE_CALENDAR0009-0018	2014-09-25	0	1111	2547	0
3528	2	RESOURCE_CALENDAR0009-0020	2014-09-21	0	1111	2547	0
3520	2	RESOURCE_CALENDAR0009-0011	2014-09-28	0	1111	2547	0
3523	2	RESOURCE_CALENDAR0009-0015	2014-09-20	0	1111	2547	0
3529	1	RESOURCE_CALENDAR0043-0043	2014-10-02	0	1111	2584	0
3521	2	RESOURCE_CALENDAR0009-0012	2014-09-23	0	1111	2547	0
3530	1	RESOURCE_CALENDAR0019-0006	2014-10-02	0	1111	2557	0
3554	1	RESOURCE_CALENDAR0015-0049	2014-09-16	0	1111	2553	0
3555	1	RESOURCE_CALENDAR0015-0050	2014-09-20	0	1111	2553	0
3556	1	RESOURCE_CALENDAR0015-0051	2014-09-22	0	1111	2553	0
3557	1	RESOURCE_CALENDAR0015-0052	2014-09-26	0	1111	2553	0
3531	1	RESOURCE_CALENDAR0044-0030	2014-10-09	0	1111	2585	0
3532	1	RESOURCE_CALENDAR0044-0032	2014-09-19	0	1111	2585	0
3533	1	RESOURCE_CALENDAR0044-0040	2014-09-21	0	1111	2585	0
3534	1	RESOURCE_CALENDAR0044-0042	2014-09-16	0	1111	2585	0
3535	1	RESOURCE_CALENDAR0044-0033	2014-09-15	0	1111	2585	0
3536	1	RESOURCE_CALENDAR0044-0045	2014-09-20	0	1111	2585	0
3537	1	RESOURCE_CALENDAR0044-0038	2014-09-17	0	1111	2585	0
3538	1	RESOURCE_CALENDAR0044-0046	2014-09-22	0	1111	2585	0
3539	1	RESOURCE_CALENDAR0044-0039	2014-09-18	0	1111	2585	0
3558	1	RESOURCE_CALENDAR0015-0054	2014-09-24	0	1111	2553	0
3549	1	CALENDAR0012-0008	2014-10-13	0	1114	2529	0
3550	1	CALENDAR0012-0009	2014-12-31	0	1114	2529	0
3542	2	RESOURCE_CALENDAR0050-0038	2014-09-15	0	1111	2591	0
3540	2	RESOURCE_CALENDAR0050-0032	2014-09-22	0	1111	2591	0
3548	2	RESOURCE_CALENDAR0050-0036	2014-09-17	0	1111	2591	0
3546	2	RESOURCE_CALENDAR0050-0042	2014-09-16	0	1111	2591	0
3545	2	RESOURCE_CALENDAR0050-0034	2014-10-09	0	1112	2591	0
3547	2	RESOURCE_CALENDAR0050-0047	2014-09-20	0	1111	2591	0
3544	2	RESOURCE_CALENDAR0050-0033	2014-09-18	0	1111	2591	0
3543	2	RESOURCE_CALENDAR0050-0039	2014-09-19	0	1111	2591	0
3541	2	RESOURCE_CALENDAR0050-0037	2014-09-21	0	1111	2591	0
3517	2	RESOURCE_CALENDAR0009-0008	2014-09-29	0	1111	2547	0
3515	2	RESOURCE_CALENDAR0009-0006	2014-09-24	0	1111	2547	0
3518	2	RESOURCE_CALENDAR0009-0009	2014-09-30	0	1111	2547	0
3519	2	RESOURCE_CALENDAR0009-0010	2014-09-17	0	1111	2547	0
3525	2	RESOURCE_CALENDAR0009-0017	2014-09-27	0	1111	2547	0
3524	2	RESOURCE_CALENDAR0009-0016	2014-09-19	0	1111	2547	0
3522	2	RESOURCE_CALENDAR0009-0014	2014-09-22	0	1111	2547	0
3527	2	RESOURCE_CALENDAR0009-0019	2014-09-18	0	1111	2547	0
3551	1	CALENDAR0012-0010	2014-08-15	0	1114	2529	0
3552	1	CALENDAR0012-0011	2014-12-08	0	1114	2529	0
3553	1	CALENDAR0012-0012	2014-12-25	0	1114	2529	0
3559	1	RESOURCE_CALENDAR0015-0055	2014-09-27	0	1111	2553	0
3560	1	RESOURCE_CALENDAR0015-0056	2014-09-28	0	1111	2553	0
3561	1	RESOURCE_CALENDAR0015-0057	2014-09-21	0	1111	2553	0
3562	1	RESOURCE_CALENDAR0015-0058	2014-09-25	0	1111	2553	0
3563	1	RESOURCE_CALENDAR0015-0060	2014-09-18	0	1111	2553	0
3564	1	RESOURCE_CALENDAR0015-0061	2014-09-19	0	1111	2553	0
3565	1	RESOURCE_CALENDAR0015-0062	2014-09-23	0	1111	2553	0
3566	1	RESOURCE_CALENDAR0015-0064	2014-09-30	0	1111	2553	0
3567	1	RESOURCE_CALENDAR0015-0067	2014-09-29	0	1111	2553	0
3568	1	RESOURCE_CALENDAR0015-0066	2014-09-15	0	1111	2553	0
3569	1	RESOURCE_CALENDAR0015-0065	2014-09-17	0	1111	2553	0
\.


--
-- Data for Name: calendar_exception_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY calendar_exception_type (id, version, code, code_autogenerated, name, color, standard_effort, allowed_extra_effort, updatable) FROM stdin;
1116	4	CALENDAR_EXCEPTION_TYPE0006	t	WORKING_DAY	BLUE	28800	\N	f
1117	3	CALENDAR_EXCEPTION_TYPE0007	t	NOT_WORKING_DAY	GREEN	0	0	f
1114	7	CALENDAR_EXCEPTION_TYPE0004	t	JOUR_FERIE	DEFAULT	0	0	t
1115	6	CALENDAR_EXCEPTION_TYPE0005	t	DEMI_CONGES	ORANGE	14400	\N	t
1112	9	CALENDAR_EXCEPTION_TYPE0002	t	HORS_BUREAU	MAGENTA	0	0	t
1111	10	CALENDAR_EXCEPTION_TYPE0001	t	CONGES	YELLOW	0	0	t
1113	8	CALENDAR_EXCEPTION_TYPE0003	t	GREVE	PURPLE	0	0	t
3131	1	CALENDAR_EXCEPTION_TYPE0008	t	21	DEFAULT	0	0	t
3132	1	CALENDAR_EXCEPTION_TYPE0009	t	24	CYAN	0	0	t
3133	1	CALENDAR_EXCEPTION_TYPE0010	t	25-worker-1	BLUE	0	0	t
\.


--
-- Data for Name: capacity_per_day; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY capacity_per_day (base_calendar_id, standard_effort, day_id, allowed_extra_effort) FROM stdin;
303	28800	0	\N
303	28800	1	\N
303	28800	2	\N
303	28800	3	\N
303	28800	4	\N
303	0	5	0
303	0	6	0
304	28800	0	\N
304	28800	1	\N
304	28800	2	\N
304	28800	3	\N
304	25200	4	\N
304	0	5	0
304	0	6	0
2626	0	2	\N
2628	14400	0	\N
2628	14400	1	\N
2628	14400	3	\N
2628	14400	4	\N
2638	14400	4	\N
2641	28800	0	\N
2641	28800	1	\N
2641	28800	2	\N
2641	28800	3	\N
2641	28800	4	\N
2649	14400	4	\N
2661	28800	0	\N
2661	28800	1	\N
2661	28800	2	\N
2661	28800	3	\N
2661	28800	4	\N
2661	0	5	0
2661	0	6	0
2664	14400	4	\N
2669	14400	4	\N
2654	14400	4	\N
2630	28800	4	\N
2681	14400	4	\N
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY configuration (id, version, configuration_id, company_code, generate_code_for_cost_category, generate_code_for_calendar_exception_type, generate_code_for_work_report_type, generate_code_for_criterion, generate_code_for_label, generate_code_for_work_report, generate_code_for_resources, generate_code_for_types_of_work_hours, generate_code_for_material_categories, generate_code_for_unit_types, generate_code_for_base_calendars, monte_carlo_method_tab_visible, progress_type, company_logo_url, scenarios_visible, changed_default_admin_password, changed_default_wsreader_password, changed_default_wswriter_password, ldap_host, ldap_port, ldap_base, ldap_userdn, ldap_password, ldap_userid, ldap_save_password_db, ldap_auth_enabled, ldap_save_roles_db, ldap_group_path, ldap_role_property, ldap_search_query, enabled_autocomplete_login, ldap_group_strategy, check_new_version_enabled, allow_to_gather_usage_stats_enabled, generate_code_for_expense_sheets, currency_code, currency_symbol, personal_timesheets_type_of_work_hours, changed_default_wssubcontracting_password, changed_default_manager_password, changed_default_hresources_password, changed_default_outsourcing_password, changed_default_reports_password, personal_timesheets_periodicity, max_users, max_resources, seconds_planning_warning) FROM stdin;
404	5	202	RENATER	t	t	t	t	t	t	t	t	t	t	t	t	0		f	f	f	f	ldaps://cuire-paris1.renater.fr	636	ou=people,o=cuire	cn=reader,o=cuire	riz!dheur	mail	t	t	f	\N	\N	\N	t	t	t	f	t	EUR	€	1212	f	f	f	f	f	2	0	0	30
\.


--
-- Data for Name: configuration_roles_ldap; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY configuration_roles_ldap (role_libreplan, role_ldap, id_configuration) FROM stdin;
\.


--
-- Data for Name: connector; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY connector (id, version, name) FROM stdin;
1717	5	Tim
1718	4	Jira
\.


--
-- Name: connector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: libreplan
--

SELECT pg_catalog.setval('connector_id_seq', 1, false);


--
-- Data for Name: connector_property; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY connector_property (connector_id, connector_property_position, property_key, property_value) FROM stdin;
1717	0	Activated	N
1717	1	Server URL	
1717	2	Username	
1717	3	Password	
1717	4	Number of days timesheet to Tim	7
1717	5	Number of days roster from Tim	90
1717	6	Productivity factor	100
1717	7	Department IDs to import toster	0
1718	0	Activated	N
1718	1	Server URL	
1718	2	Username	
1718	3	Password	
1718	4	JIRA labels: comma-separated list of labels or URL	
1718	5	Hours type	Default
\.


--
-- Data for Name: consolidated_value; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY consolidated_value (id, consolidated_value_type, version, date, value, task_end_date, consolidation_id, advance_measurement_id, task_end_date_effort_duration) FROM stdin;
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY cost_category (id, version, code, name, code_autogenerated, last_hour_cost_sequence_code, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY criterion (id, version, code, name, predefined_criterion_internal_name, active, id_criterion_type, parent) FROM stdin;
606	21	CRITERION0001-0001	Africa	Africa	t	163840	\N
607	19	CRITERION0001-0002	America	America	t	163840	\N
608	17	CRITERION0001-0003	Asia	Asia	t	163840	\N
609	15	CRITERION0001-0004	Australia	Australia	t	163840	\N
610	13	CRITERION0001-0005	Europe	Europe	t	163840	\N
611	8	CRITERION0002-0001	Manager	Manager	t	163841	\N
612	6	CRITERION0002-0002	Senior worker	Senior worker	t	163841	\N
613	4	CRITERION0002-0003	Junior worker	Junior worker	t	163841	\N
2351	1	CRITERION0011-0001	24-London	\N	t	720904	\N
2352	1	CRITERION0011-0002	24-Amsterdam	\N	t	720904	\N
2330	2	CRITERION0004-0006	c++ senior	\N	t	720896	2329
2325	2	CRITERION0004-0008	python	\N	t	720896	\N
2353	4	CRITERION0014-0003	26-Plumber	\N	t	720905	\N
2329	2	CRITERION0004-0005	c++	\N	t	720896	\N
2331	2	CRITERION0004-0007	c++ junior	\N	t	720896	2329
2326	2	CRITERION0004-0009	java	\N	t	720896	\N
2324	2	CRITERION0004-0001	senior python	\N	t	720896	2325
2327	2	CRITERION0004-0002	junior python	\N	t	720896	2325
2328	2	CRITERION0004-0004	junior java	\N	t	720896	2326
2323	2	CRITERION0004-0003	senior java	\N	t	720896	2326
2332	1	CRITERION0007-0002	21-Amsterdam	\N	t	720898	\N
2333	1	CRITERION0007-0001	21-London	\N	t	720898	\N
2334	1	CRITERION0010-0001	24-Builder	\N	t	720899	\N
2335	1	CRITERION0010-0002	24-Electrician	\N	t	720899	\N
2336	1	CRITERION0010-0003	24-Plumber	\N	t	720899	\N
2337	1	CRITERION0008-0003	22-Plumber	\N	t	720900	\N
2338	1	CRITERION0008-0001	22-Builder	\N	t	720900	\N
2339	1	CRITERION0008-0002	22-Electrician	\N	t	720900	\N
2354	4	CRITERION0014-0001	26-Builder	\N	t	720905	\N
2355	4	CRITERION0014-0002	26-Electrician	\N	t	720905	\N
2340	2	CRITERION0009-0003	28-plombier	\N	t	720901	\N
2341	2	CRITERION0009-0001	28-maçon	\N	t	720901	\N
2342	2	CRITERION0009-0002	28-électricien	\N	t	720901	\N
2343	1	CRITERION0013-0002	London	\N	t	720902	\N
2344	1	CRITERION0013-0001	Paris	\N	t	720902	\N
2345	1	CRITERION0013-0003	Amsterdam	\N	t	720902	\N
2346	1	CRITERION0012-0002	28-Amsterdam	\N	t	720903	\N
2347	1	CRITERION0012-0001	28-London	\N	t	720903	\N
2348	1	CRITERION0006-0002	Electrician	\N	t	720897	\N
2349	1	CRITERION0006-0003	Plumber	\N	t	720897	\N
2350	1	CRITERION0006-0001	Buider	\N	t	720897	\N
2356	1	CRITERION0015-0001	27-maçon	\N	t	720906	\N
2357	1	CRITERION0015-0002	27-electricien	\N	t	720906	\N
2358	1	CRITERION0015-0003	27-plombier	\N	t	720906	\N
2359	1	CRITERION0016-0002	23-Electrician	\N	t	720907	\N
2360	1	CRITERION0016-0001	23-Builder	\N	t	720907	\N
2361	1	CRITERION0016-0003	23-Plumber	\N	t	720907	\N
2362	1	CRITERION0018-0001	27-Londres	\N	t	720908	\N
2363	1	CRITERION0018-0002	27-Amsterdam	\N	t	720908	\N
2364	1	CRITERION0017-0001	26-Montpelier	\N	t	720909	\N
2365	1	CRITERION0017-0002	26-Paris	\N	t	720909	\N
2366	1	CRITERION0019-0001	23-London	\N	t	720910	\N
2367	1	CRITERION0019-0002	23-Amsterdam	\N	t	720910	\N
\.


--
-- Data for Name: criterion_requirement; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY criterion_requirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
15984	indirect	12	14586	\N	\N	2341	15980	t
13688	indirect	7	\N	13244	\N	2333	13678	t
13689	indirect	6	13143	\N	\N	2333	13678	t
15985	indirect	12	14586	\N	\N	2346	15981	t
13690	indirect	6	13143	\N	\N	2350	13677	t
15988	indirect	12	14587	\N	\N	2341	15980	t
13645	direct	9	\N	12555	\N	2349	\N	\N
13646	indirect	7	12463	\N	\N	2349	13645	t
13647	direct	9	\N	12557	\N	2348	\N	\N
13648	indirect	7	12465	\N	\N	2348	13647	t
13649	direct	9	\N	12588	\N	2332	\N	\N
13650	direct	9	\N	12588	\N	2350	\N	\N
16036	direct	10	\N	14674	\N	2358	\N	\N
15975	indirect	16	15172	\N	\N	2343	15972	t
13651	indirect	9	\N	12589	\N	2332	13649	t
16057	direct	31	\N	16609	\N	2366	\N	\N
13652	indirect	9	\N	12589	\N	2350	13650	t
16056	direct	31	\N	16609	\N	2360	\N	\N
13653	indirect	7	12495	\N	\N	2332	13649	t
13654	indirect	7	12495	\N	\N	2350	13650	t
13655	indirect	9	\N	12613	\N	2350	13650	t
13656	indirect	9	\N	12613	\N	2332	13649	t
13657	indirect	7	12519	\N	\N	2332	13649	t
13658	indirect	7	12519	\N	\N	2350	13650	t
13659	indirect	9	\N	12614	\N	2332	13649	t
13660	indirect	9	\N	12614	\N	2350	13650	t
13661	indirect	7	12520	\N	\N	2350	13650	t
13662	indirect	7	12520	\N	\N	2332	13649	t
13677	direct	7	\N	13231	\N	2350	\N	\N
13678	direct	7	\N	13231	\N	2333	\N	\N
16867	indirect	29	16517	\N	\N	2360	16056	t
13679	indirect	7	\N	13232	\N	2350	13677	t
18173	indirect	8	\N	15477	\N	2356	18162	t
18177	direct	8	\N	17559	\N	2362	\N	\N
16058	indirect	29	16517	\N	\N	2366	16057	t
13699	direct	23	\N	13319	\N	2337	\N	\N
13700	indirect	21	13194	\N	\N	2337	13699	t
13680	indirect	7	\N	13232	\N	2333	13678	t
13681	indirect	6	13134	\N	\N	2350	13677	t
13682	indirect	6	13134	\N	\N	2333	13678	t
13683	indirect	7	\N	13243	\N	2333	13678	t
13684	indirect	7	\N	13243	\N	2350	13677	t
13685	indirect	6	13142	\N	\N	2350	13677	t
13686	indirect	6	13142	\N	\N	2333	13678	t
14159	direct	22	\N	14670	\N	2338	\N	\N
13687	indirect	7	\N	13244	\N	2350	13677	t
6168	direct	15	\N	5907	\N	2336	\N	\N
6169	indirect	13	5826	\N	\N	2336	6168	t
14158	direct	22	\N	14670	\N	2345	\N	\N
14161	indirect	20	14577	\N	\N	2338	14159	t
14160	indirect	20	14577	\N	\N	2345	14158	t
16037	indirect	9	14580	\N	\N	2358	16036	t
15977	indirect	12	14584	\N	\N	2340	15976	t
18176	direct	8	\N	17559	\N	2356	\N	\N
15972	direct	18	\N	14988	\N	2343	\N	\N
6170	direct	15	\N	5908	\N	2335	\N	\N
15979	indirect	12	14585	\N	\N	2342	15978	t
15973	direct	18	\N	14988	\N	2338	\N	\N
6171	indirect	13	5827	\N	\N	2335	6170	t
15974	indirect	16	15172	\N	\N	2338	15973	t
18164	indirect	8	\N	15045	\N	2363	18163	t
16005	indirect	12	\N	14688	\N	2347	15995	t
18175	indirect	7	15231	\N	\N	2363	18163	t
16004	indirect	12	\N	14688	\N	2341	15994	t
18168	indirect	8	\N	15046	\N	2356	18162	t
18174	indirect	7	15231	\N	\N	2356	18162	t
18178	indirect	7	17838	\N	\N	2356	18176	t
18179	indirect	7	17838	\N	\N	2362	18177	t
15976	direct	12	\N	14679	\N	2340	\N	\N
18169	indirect	8	\N	15046	\N	2363	18163	t
16006	indirect	12	14591	\N	\N	2341	15994	t
15978	direct	12	\N	14680	\N	2342	\N	\N
15980	direct	12	\N	14681	\N	2341	\N	\N
16007	indirect	12	14591	\N	\N	2347	15995	t
18172	indirect	8	\N	15477	\N	2363	18163	t
15981	direct	12	\N	14681	\N	2346	\N	\N
15983	indirect	12	\N	14682	\N	2346	15981	t
15982	indirect	12	\N	14682	\N	2341	15980	t
15987	indirect	12	\N	14683	\N	2341	15980	t
15986	indirect	12	\N	14683	\N	2346	15981	t
15989	indirect	12	14587	\N	\N	2346	15981	t
15991	indirect	12	\N	14684	\N	2341	15980	t
15990	indirect	12	\N	14684	\N	2346	15981	t
15993	indirect	12	14588	\N	\N	2341	15980	t
15992	indirect	12	14588	\N	\N	2346	15981	t
15995	direct	12	\N	14685	\N	2347	\N	\N
18160	direct	8	\N	16568	\N	2357	\N	\N
15994	direct	12	\N	14685	\N	2341	\N	\N
15996	indirect	12	\N	14686	\N	2347	15995	t
15997	indirect	12	\N	14686	\N	2341	15994	t
18161	indirect	7	16491	\N	\N	2357	18160	t
18167	indirect	7	15207	\N	\N	2363	18163	t
18166	indirect	7	15207	\N	\N	2356	18162	t
18171	indirect	7	15208	\N	\N	2356	18162	t
18170	indirect	7	15208	\N	\N	2363	18163	t
18162	direct	8	\N	16585	\N	2356	\N	\N
18163	direct	8	\N	16585	\N	2363	\N	\N
18165	indirect	8	\N	15045	\N	2356	18162	t
15998	indirect	12	14589	\N	\N	2347	15995	t
15999	indirect	12	14589	\N	\N	2341	15994	t
16000	indirect	12	\N	14687	\N	2341	15994	t
16001	indirect	12	\N	14687	\N	2347	15995	t
16002	indirect	12	14590	\N	\N	2341	15994	t
16003	indirect	12	14590	\N	\N	2347	15995	t
\.


--
-- Data for Name: criterion_satisfaction; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY criterion_satisfaction (id, version, code, start_date, finish_date, is_deleted, criterion, resource) FROM stdin;
3279	2	CRITERION_SATISFACTION0048	2014-08-01	\N	f	2360	3009
3233	1	CRITERION_SATISFACTION0002	2014-08-01	\N	f	2339	2933
3280	1	CRITERION_SATISFACTION0049	2014-04-16	\N	f	2367	3009
3251	5	CRITERION_SATISFACTION0020	2014-04-16	\N	t	2334	2972
3243	2	CRITERION_SATISFACTION0012	2014-08-01	\N	f	2349	2941
3247	2	CRITERION_SATISFACTION0016	2014-08-01	\N	f	2332	2956
3246	3	CRITERION_SATISFACTION0015	2014-08-01	\N	f	2350	2956
3261	2	CRITERION_SATISFACTION0030	2014-08-01	\N	f	2361	2951
3241	2	CRITERION_SATISFACTION0010	2014-08-01	\N	f	2338	2944
3242	1	CRITERION_SATISFACTION0011	2014-08-01	\N	f	2343	2944
3244	1	CRITERION_SATISFACTION0013	2014-08-01	\N	f	2348	2954
3278	2	CRITERION_SATISFACTION0047	2014-08-01	\N	f	2363	2997
3277	2	CRITERION_SATISFACTION0046	2014-08-01	\N	f	2356	2997
3235	3	CRITERION_SATISFACTION0004	2014-08-01	\N	f	2338	2935
3236	2	CRITERION_SATISFACTION0005	2014-08-01	\N	f	2345	2935
3268	2	CRITERION_SATISFACTION0037	2014-08-01	\N	f	2355	2946
3259	3	CRITERION_SATISFACTION0029	2014-04-16	\N	f	2341	2984
3240	2	CRITERION_SATISFACTION0009	2014-08-01	\N	f	2345	2939
3238	3	CRITERION_SATISFACTION0007	2014-08-01	\N	f	2338	2939
3260	3	CRITERION_SATISFACTION0028	2014-08-01	\N	f	2346	2984
3232	3	CRITERION_SATISFACTION0001	2014-08-01	\N	f	2337	2931
3281	1	CRITERION_SATISFACTION0050	2014-08-01	\N	f	2360	3013
3255	1	CRITERION_SATISFACTION0025	2014-08-01	\N	f	2350	2961
3256	1	CRITERION_SATISFACTION0024	2014-08-01	\N	f	2333	2961
3263	1	CRITERION_SATISFACTION0033	2014-08-01	\N	f	2347	2986
3282	1	CRITERION_SATISFACTION0051	2014-08-01	\N	f	2366	3013
3264	1	CRITERION_SATISFACTION0032	2014-08-01	\N	f	2341	2986
3249	2	CRITERION_SATISFACTION0019	2014-08-01	\N	f	2332	2959
3250	2	CRITERION_SATISFACTION0018	2014-08-01	\N	f	2350	2959
3276	1	CRITERION_SATISFACTION0045	2014-08-01	\N	f	2359	3007
3257	4	CRITERION_SATISFACTION0026	2014-08-01	\N	f	2334	2972
3252	5	CRITERION_SATISFACTION0021	2014-04-16	\N	t	2352	2972
3245	5	CRITERION_SATISFACTION0014	2014-08-01	\N	f	2340	2969
3258	3	CRITERION_SATISFACTION0027	2014-08-01	\N	f	2352	2972
3248	3	CRITERION_SATISFACTION0017	2014-08-01	\N	f	2342	2978
3262	2	CRITERION_SATISFACTION0031	2014-08-01	\N	f	2346	2982
3254	3	CRITERION_SATISFACTION0023	2014-08-01	\N	f	2341	2982
3253	3	CRITERION_SATISFACTION0022	2014-04-16	\N	t	2346	2982
3239	3	CRITERION_SATISFACTION0008	2014-08-01	\N	f	2336	2966
3237	4	CRITERION_SATISFACTION0006	2014-04-16	\N	t	2336	2966
3267	2	CRITERION_SATISFACTION0036	2015-08-01	\N	f	2353	2952
3275	2	CRITERION_SATISFACTION0044	2014-08-01	\N	f	2358	2995
3274	3	CRITERION_SATISFACTION0043	2014-04-16	\N	t	2358	2995
3270	2	CRITERION_SATISFACTION0039	2014-08-01	\N	f	2354	2958
3265	3	CRITERION_SATISFACTION0035	2014-08-01	\N	f	2352	2974
3266	3	CRITERION_SATISFACTION0034	2014-08-01	\N	f	2334	2974
3271	3	CRITERION_SATISFACTION0041	2014-08-01	\N	f	2334	2977
3272	3	CRITERION_SATISFACTION0040	2014-04-16	\N	t	2351	2977
3286	1	CRITERION_SATISFACTION0055	2014-08-01	\N	f	2351	2977
3283	4	CRITERION_SATISFACTION0053	2014-04-16	\N	t	2367	3011
3285	3	CRITERION_SATISFACTION0054	2014-08-01	\N	f	2367	3011
3284	4	CRITERION_SATISFACTION0052	2014-08-01	\N	f	2360	3011
3234	3	CRITERION_SATISFACTION0003	2014-08-01	\N	f	2335	2970
3269	3	CRITERION_SATISFACTION0038	2014-08-01	\N	f	2354	2940
3287	1	CRITERION_SATISFACTION0056	2014-04-16	\N	f	2365	2940
3273	3	CRITERION_SATISFACTION0042	2014-08-01	\N	f	2357	2989
3288	1	CRITERION_SATISFACTION0057	2014-04-16	\N	f	2350	2963
\.


--
-- Data for Name: criterion_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY criterion_type (id, version, code, name, predefined_type_internal_name, description, allow_simultaneous_criterions_per_resource, allow_hierarchy, last_criterion_sequence_code, enabled, code_autogenerated, resource) FROM stdin;
163840	22	CRITERION0001	LOCATION	LOCATION	Worker location	t	f	5	t	t	0
163841	10	CRITERION0002	CATEGORY	CATEGORY	Professional category	t	t	3	t	t	0
163842	1	CRITERION0003	SKILL	SKILL	Worker skill	t	t	0	t	t	0
720896	2	CRITERION0004	test category for programmers	\N	description of test category	t	t	9	t	t	0
720898	1	CRITERION0007	21-Location	\N	\N	f	f	2	t	t	0
720899	1	CRITERION0010	24-EPR	\N	\N	t	t	3	t	t	0
720900	1	CRITERION0008	22-EPR	\N	\N	t	t	3	t	t	0
720901	2	CRITERION0009	28-departement	\N	\N	t	t	3	t	t	0
720902	1	CRITERION0013	22-location	\N	\N	t	t	3	t	t	0
720903	1	CRITERION0012	28-location	\N	\N	f	f	2	t	t	0
720897	3	CRITERION0006	21-department	\N	\N	t	t	3	t	t	0
720904	1	CRITERION0011	24-location	\N	\N	t	f	2	t	t	0
720905	4	CRITERION0014	26-EPR	\N	\N	t	t	3	t	t	0
720906	1	CRITERION0015	27-ma-petite-entreprise	\N	\N	t	t	3	t	t	0
720907	1	CRITERION0016	23-department	\N	\N	t	t	3	t	t	0
720908	1	CRITERION0018	27-mes-succursales	\N	\N	t	t	2	t	t	0
720909	1	CRITERION0017	26-location	\N	\N	f	f	2	t	t	0
720910	1	CRITERION0019	23-location	\N	\N	f	t	2	t	t	0
720911	1	CRITERION0020	25-DRE	\N	\N	t	t	0	t	t	0
\.


--
-- Data for Name: customer_communication; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY customer_communication (id, version, deadline, communication_type, communication_date, reviewed, order_id) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase) FROM stdin;
initial-database-creation-1	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.902383+01	1	EXECUTED	3:0819191bfc79c85258e53388e6c3a269	Create Table		\N	2.0-rc7
initial-database-creation-2	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.906647+01	2	EXECUTED	3:492e699609703ebfdc7f14d0b9d3fa10	Create Table		\N	2.0-rc7
initial-database-creation-3	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.910579+01	3	EXECUTED	3:ce0671ca8c9c310243bcc2ffb2d35523	Create Table		\N	2.0-rc7
initial-database-creation-4	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.914727+01	4	EXECUTED	3:5a28bfc5ca316e6f6cd3a0b3ef5f67b9	Create Table		\N	2.0-rc7
initial-database-creation-5	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.916334+01	5	EXECUTED	3:dd32a9e5c58bd33f528f3a4176736205	Create Table		\N	2.0-rc7
initial-database-creation-6	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.920555+01	6	EXECUTED	3:de107aebd954ab5c29c39bd6260b1c69	Create Table		\N	2.0-rc7
initial-database-creation-7	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.926941+01	7	EXECUTED	3:588d5677bcc5dff757c327873f896443	Create Table		\N	2.0-rc7
initial-database-creation-8	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.93088+01	8	EXECUTED	3:7fa824a67c2de27b2b2a3f66e5118412	Create Table		\N	2.0-rc7
initial-database-creation-9	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.934943+01	9	EXECUTED	3:93bc8fa1188ddda3969df439f29c8f31	Create Table		\N	2.0-rc7
initial-database-creation-10	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.938727+01	10	EXECUTED	3:0c72c8c2330c2408a6b079239c401a91	Create Table		\N	2.0-rc7
initial-database-creation-11	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.945648+01	11	EXECUTED	3:30ecc1c237e1c3c3db800537ffa8883d	Create Table		\N	2.0-rc7
initial-database-creation-12	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.963692+01	12	EXECUTED	3:f3c4e20ee90e3380f608f73bd0bbb630	Create Table		\N	2.0-rc7
initial-database-creation-13	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.967703+01	13	EXECUTED	3:aaaa113557606faf71ee9f5ee1df07ce	Create Table		\N	2.0-rc7
initial-database-creation-14	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.972296+01	14	EXECUTED	3:54c846355565319d7d50bd78f4f569bb	Create Table		\N	2.0-rc7
initial-database-creation-15	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.978586+01	15	EXECUTED	3:206376e864171d400ce1602f7ef53d49	Create Table		\N	2.0-rc7
initial-database-creation-16	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.98522+01	16	EXECUTED	3:cf757d69a753e856b6342f679cff9fac	Create Table		\N	2.0-rc7
initial-database-creation-17	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.988975+01	17	EXECUTED	3:ce6dfb988cb41f0adbe43e1855caa76e	Create Table		\N	2.0-rc7
initial-database-creation-18	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:54.9937+01	18	EXECUTED	3:967c04d80a2d485f868b3c984579c4e8	Create Table		\N	2.0-rc7
initial-database-creation-19	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.0001+01	19	EXECUTED	3:4e9058f3e2f5b8173503167ec5c538a3	Create Table		\N	2.0-rc7
initial-database-creation-20	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.004235+01	20	EXECUTED	3:60a882fa6c0f1d848bf4c69f9bfff35c	Create Table		\N	2.0-rc7
initial-database-creation-21	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.008216+01	21	EXECUTED	3:19b23f729aa196a1abed154f225db676	Create Table		\N	2.0-rc7
initial-database-creation-22	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.012795+01	22	EXECUTED	3:947b787c1bbe91a331dd46cb1640f5e5	Create Table		\N	2.0-rc7
initial-database-creation-23	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.016369+01	23	EXECUTED	3:48f908ec702ae89b5da9f0eac7479005	Create Table		\N	2.0-rc7
initial-database-creation-24	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.02206+01	24	EXECUTED	3:84355bc36e649a2786237afa2239406b	Create Table		\N	2.0-rc7
initial-database-creation-25	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.026607+01	25	EXECUTED	3:b8724c07bf0377b89a789f4068225748	Create Table		\N	2.0-rc7
initial-database-creation-26	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.030998+01	26	EXECUTED	3:f9826236b01812c13b8773d5ab43eba3	Create Table		\N	2.0-rc7
initial-database-creation-27	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.032758+01	27	EXECUTED	3:c793cee4a905e7c283e5670c7a78ce75	Create Table		\N	2.0-rc7
initial-database-creation-28	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.037144+01	28	EXECUTED	3:10e53ad074ddb8a722b7327c489af2a4	Create Table		\N	2.0-rc7
initial-database-creation-29	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.043584+01	29	EXECUTED	3:ffd33e338772b05e1ec66bc5f536b857	Create Table		\N	2.0-rc7
initial-database-creation-30	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.047558+01	30	EXECUTED	3:de8601efc174c9011c267a989abc558d	Create Table		\N	2.0-rc7
initial-database-creation-31	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.05148+01	31	EXECUTED	3:fc5ec26502de974f7ab46118f4f53196	Create Table		\N	2.0-rc7
initial-database-creation-32	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.053047+01	32	EXECUTED	3:b3be37758841b13194d3710d6defef04	Create Table		\N	2.0-rc7
initial-database-creation-33	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.058264+01	33	EXECUTED	3:a951462763f5d55a3f7e10f12f81335f	Create Table		\N	2.0-rc7
initial-database-creation-34	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.064796+01	34	EXECUTED	3:a51224ce4bb0ca6d2b3f7bd992c65f0a	Create Table		\N	2.0-rc7
initial-database-creation-35	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.069339+01	35	EXECUTED	3:8afd863ae4753040b121f5858594660b	Create Table		\N	2.0-rc7
initial-database-creation-36	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.075657+01	36	EXECUTED	3:0754fc448f05289e922e36fe342d121d	Create Table		\N	2.0-rc7
initial-database-creation-37	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.082279+01	37	EXECUTED	3:5cfa72b6d860176124f25ff3a9d331fc	Create Table		\N	2.0-rc7
initial-database-creation-38	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.086108+01	38	EXECUTED	3:f831e87d1de1fc1338d42b8e833dc9c9	Create Table		\N	2.0-rc7
initial-database-creation-39	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.090183+01	39	EXECUTED	3:6bd033fff9beeafa67d07445dbaee07f	Create Table		\N	2.0-rc7
initial-database-creation-40	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.094194+01	40	EXECUTED	3:bdd3c4d65620a2a8f7b1a964a353f58f	Create Table		\N	2.0-rc7
initial-database-creation-41	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.09644+01	41	EXECUTED	3:096d3c30326f7805f4b0039355445d54	Create Table		\N	2.0-rc7
initial-database-creation-42	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.102653+01	42	EXECUTED	3:ded3fb067f8bc57e6638e6920fd44604	Create Table		\N	2.0-rc7
initial-database-creation-43	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.10469+01	43	EXECUTED	3:55f995d5648794d3432adc45e49630ac	Create Table		\N	2.0-rc7
initial-database-creation-44	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.109568+01	44	EXECUTED	3:36bec1cf129dbbe7479b6fd37ec4cfc8	Create Table		\N	2.0-rc7
initial-database-creation-45	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.113765+01	45	EXECUTED	3:14bba3e0f5ceb3f2fd6f8957e1838de4	Create Table		\N	2.0-rc7
initial-database-creation-46	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.120746+01	46	EXECUTED	3:20a4b538a58ecad5fefff00c68060415	Create Table		\N	2.0-rc7
initial-database-creation-47	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.124764+01	47	EXECUTED	3:20d9ca0a2dac404d34031a303d36332f	Create Table		\N	2.0-rc7
initial-database-creation-48	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.128837+01	48	EXECUTED	3:9422bfd2634488255bcbb32d73d4d9a6	Create Table		\N	2.0-rc7
initial-database-creation-49	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.135326+01	49	EXECUTED	3:bb378576fc9548e6e0bf30c553be56c2	Create Table		\N	2.0-rc7
initial-database-creation-50	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.141999+01	50	EXECUTED	3:86be514721a43f3a69e0fc5575f68bcf	Create Table		\N	2.0-rc7
initial-database-creation-51	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.148211+01	51	EXECUTED	3:6a7ac8677daeb7b232876fef8bc2eb13	Create Table		\N	2.0-rc7
initial-database-creation-52	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.150248+01	52	EXECUTED	3:132f159f7460a378fe40004d8844911c	Create Table		\N	2.0-rc7
initial-database-creation-53	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.157126+01	53	EXECUTED	3:e86194e70e6973332ef4538bdc5d7a1a	Create Table		\N	2.0-rc7
initial-database-creation-54	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.158695+01	54	EXECUTED	3:2524421c32a9b419da3fe430869fdb1d	Create Table		\N	2.0-rc7
initial-database-creation-55	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.177084+01	55	EXECUTED	3:f07c8df4ae4b20f431ed20c225b80172	Create Table		\N	2.0-rc7
initial-database-creation-56	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.181754+01	56	EXECUTED	3:d180f6978451999d3c71c31e22a05f12	Create Table		\N	2.0-rc7
initial-database-creation-57	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.185316+01	57	EXECUTED	3:96dee6dd4c6fe24bdf27aec7375f97a2	Create Table		\N	2.0-rc7
initial-database-creation-58	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.205576+01	58	EXECUTED	3:57a5a9423e13e7d46ab17b29ef36e3ac	Create Table		\N	2.0-rc7
initial-database-creation-59	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.209434+01	59	EXECUTED	3:481dae68046dee1729404fcb4b8f6724	Create Table		\N	2.0-rc7
initial-database-creation-60	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.216152+01	60	EXECUTED	3:3c79c9a14789f861812e28b85f42ba1a	Create Table		\N	2.0-rc7
initial-database-creation-61	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.219962+01	61	EXECUTED	3:b0647147970dcc6926527bcc26e08d0d	Create Table		\N	2.0-rc7
initial-database-creation-62	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.22395+01	62	EXECUTED	3:7a0cee9dc0952cca4c3e2a32508a4433	Create Table		\N	2.0-rc7
initial-database-creation-63	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.227816+01	63	EXECUTED	3:2b9225897f01e983677b51310e4fe0c6	Create Table		\N	2.0-rc7
initial-database-creation-64	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.22996+01	64	EXECUTED	3:8c6b353a40e4bbfe9ddec68b6e2ed109	Create Table		\N	2.0-rc7
initial-database-creation-65	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.234079+01	65	EXECUTED	3:181a3cfd4d56baa702ea56857d70c6a5	Create Table		\N	2.0-rc7
initial-database-creation-66	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.240289+01	66	EXECUTED	3:1ce12362bbe5c9289c1b1417b4534017	Create Table		\N	2.0-rc7
initial-database-creation-67	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.241977+01	67	EXECUTED	3:3db8192b7fc2c73f2d6f0b811b86193a	Create Table		\N	2.0-rc7
initial-database-creation-68	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.246707+01	68	EXECUTED	3:49669d8f9f006e24a66e6baef277ebaf	Create Table		\N	2.0-rc7
initial-database-creation-69	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.251233+01	69	EXECUTED	3:ec29eb383f779659440de1992b1b6bba	Create Table		\N	2.0-rc7
initial-database-creation-70	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.254954+01	70	EXECUTED	3:668c637d3c53b7592d3dc67fc4703cff	Create Table		\N	2.0-rc7
initial-database-creation-71	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.259496+01	71	EXECUTED	3:4f9d5316304450ab582b0858ce87c849	Create Table		\N	2.0-rc7
initial-database-creation-72	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.261021+01	72	EXECUTED	3:7a3e44f865f5a910f79c5f06e0b64f14	Create Table		\N	2.0-rc7
initial-database-creation-73	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.267409+01	73	EXECUTED	3:a635c19cae307c38b2763e3b9d58d224	Create Table		\N	2.0-rc7
initial-database-creation-74	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.269022+01	74	EXECUTED	3:95ac63bf89b9b48c007e8460e7e48cdb	Create Table		\N	2.0-rc7
initial-database-creation-75	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.273003+01	75	EXECUTED	3:28e6cc28eded2e909048c08ffacc1748	Create Table		\N	2.0-rc7
initial-database-creation-76	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.274782+01	76	EXECUTED	3:f32e144cefab5640c93a41de30b01609	Create Table		\N	2.0-rc7
initial-database-creation-77	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.279182+01	77	EXECUTED	3:5504fcfe56f3f27aedab1932b345ef67	Create Table		\N	2.0-rc7
initial-database-creation-78	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.283003+01	78	EXECUTED	3:bfb3ce3ba16ec8f8206c296f743868e5	Create Table		\N	2.0-rc7
initial-database-creation-79	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.287116+01	79	EXECUTED	3:7b7e2576df7e2b013c4609c905a1e89f	Create Table		\N	2.0-rc7
initial-database-creation-80	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.289028+01	80	EXECUTED	3:f095dee1e812c9f76e21c526566bd348	Create Table		\N	2.0-rc7
initial-database-creation-81	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.292819+01	81	EXECUTED	3:0e6f358e54f708c3e05debfeae8027f8	Create Table		\N	2.0-rc7
initial-database-creation-82	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.299844+01	82	EXECUTED	3:660f1dd76f869c29fde7efc6f7e1255e	Create Table		\N	2.0-rc7
initial-database-creation-83	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.303778+01	83	EXECUTED	3:43f98ac2e8ef569c2ace92091588dfc5	Create Table		\N	2.0-rc7
initial-database-creation-84	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.307617+01	84	EXECUTED	3:72aa9950802d4e8da713013ae72ea212	Create Table		\N	2.0-rc7
initial-database-creation-85	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.314562+01	85	EXECUTED	3:5f58cf1966364d46c430e933f520332c	Create Table		\N	2.0-rc7
initial-database-creation-86	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.319796+01	86	EXECUTED	3:930edd522020ea950b89ea3fcc60293f	Create Table		\N	2.0-rc7
initial-database-creation-87	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.324135+01	87	EXECUTED	3:eef1806c4faaa543eabf7aa919ee1871	Create Table		\N	2.0-rc7
initial-database-creation-88	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.327734+01	88	EXECUTED	3:ba5ed5b46b50e4e696f26943e4846b38	Create Table		\N	2.0-rc7
initial-database-creation-89	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.329356+01	89	EXECUTED	3:25d42a7f59acd170516f566f91db477b	Create Table		\N	2.0-rc7
initial-database-creation-90	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.333199+01	90	EXECUTED	3:0220e67c3c6e052be5b2683f3aff6cd9	Create Table		\N	2.0-rc7
initial-database-creation-91	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.334767+01	91	EXECUTED	3:dbeb7f14726427f4332caba3c3882781	Create Table		\N	2.0-rc7
initial-database-creation-92	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.341565+01	92	EXECUTED	3:a4f2631814df0304d6e1a9142e0174a1	Create Table		\N	2.0-rc7
initial-database-creation-93	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.347761+01	93	EXECUTED	3:665d61220b4af809bb0048a73af9529d	Create Table		\N	2.0-rc7
initial-database-creation-94	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.349788+01	94	EXECUTED	3:77fb476c14c92eda11701adb0a6d406f	Create Table		\N	2.0-rc7
initial-database-creation-95	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.356637+01	95	EXECUTED	3:2e07882701f4d10d2c5249aefdae87ee	Create Table		\N	2.0-rc7
initial-database-creation-96	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.360168+01	96	EXECUTED	3:12e1f91eae40df9eda60c20d6f9c8874	Create Table		\N	2.0-rc7
initial-database-creation-97	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.364994+01	97	EXECUTED	3:72db70644086a38aa90367c038a89350	Create Table		\N	2.0-rc7
initial-database-creation-98	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.368851+01	98	EXECUTED	3:1d6bac1b7849a0442a162078696893e3	Create Table		\N	2.0-rc7
initial-database-creation-99	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.373451+01	99	EXECUTED	3:7f6646bbd481090fa616c199b956b014	Create Table		\N	2.0-rc7
initial-database-creation-100	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.379652+01	100	EXECUTED	3:bbbcbaf05cf76c8236d9137a4a7a25ec	Create Table		\N	2.0-rc7
initial-database-creation-101	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.385767+01	101	EXECUTED	3:15f1e5f6e1f7c3308b084e536e88b9b8	Create Table		\N	2.0-rc7
initial-database-creation-102	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.387598+01	102	EXECUTED	3:69b1aeed86840d511ac06119ad1f3c2a	Create Table		\N	2.0-rc7
initial-database-creation-103	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.389214+01	103	EXECUTED	3:57d3f2fd8967dfd691fd95d30fb1c134	Create Table		\N	2.0-rc7
initial-database-creation-104	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.392755+01	104	EXECUTED	3:0e57f86b004bedba6c607c8d2c566164	Add Primary Key		\N	2.0-rc7
initial-database-creation-105	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.396437+01	105	EXECUTED	3:55a89da076a5b87ce5e49e1db3ed3fb9	Add Primary Key		\N	2.0-rc7
initial-database-creation-106	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.400068+01	106	EXECUTED	3:4db964219e3dde449c0a54d58d204a7b	Add Primary Key		\N	2.0-rc7
initial-database-creation-107	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.403863+01	107	EXECUTED	3:0d50d294d4db44aed32f8c909114645d	Add Primary Key		\N	2.0-rc7
initial-database-creation-108	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.407938+01	108	EXECUTED	3:9c39ac8c3d6ebc758e69da66cfc20283	Add Primary Key		\N	2.0-rc7
initial-database-creation-109	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.411896+01	109	EXECUTED	3:254739c105dc46829b4019e6cd4daa8e	Add Primary Key		\N	2.0-rc7
initial-database-creation-110	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.418535+01	110	EXECUTED	3:330cbde32db56aa70e52784794b743ff	Add Primary Key		\N	2.0-rc7
initial-database-creation-111	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.422626+01	111	EXECUTED	3:39d0f5be8bc00a3752b5f49dd92866de	Add Primary Key		\N	2.0-rc7
initial-database-creation-112	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.426494+01	112	EXECUTED	3:005cd1ac6366225c7124eb995c790329	Add Primary Key		\N	2.0-rc7
initial-database-creation-113	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.430497+01	113	EXECUTED	3:aa9ef6bec758b8fef0d7f58d652f23ed	Add Primary Key		\N	2.0-rc7
initial-database-creation-114	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.433846+01	114	EXECUTED	3:57037ae27d15fb149b2b18b70e3ac640	Add Primary Key		\N	2.0-rc7
initial-database-creation-115	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.437602+01	115	EXECUTED	3:9a325bc706e5f056e25b5029c144c5d8	Add Primary Key		\N	2.0-rc7
initial-database-creation-116	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.441029+01	116	EXECUTED	3:f5bef61b4276a1bf815b80abfbbdd0dd	Add Primary Key		\N	2.0-rc7
initial-database-creation-117	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.444831+01	117	EXECUTED	3:7eff22e0b4befe8f4c445f1c5a58a15e	Add Primary Key		\N	2.0-rc7
initial-database-creation-118	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.448788+01	118	EXECUTED	3:dadfa8f8caf1ae02cfc16ecbed0c8b90	Add Primary Key		\N	2.0-rc7
initial-database-creation-119	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.453003+01	119	EXECUTED	3:138d0588ac80f0a920e484db36f4e97d	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-120	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.456268+01	120	EXECUTED	3:2a81f473aa411fe1bf94ff891f950f05	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-121	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.459715+01	121	EXECUTED	3:465b67c4800169a5ad1a1fa4cf9937ce	Add Unique Constraint		\N	2.0-rc7
creation-deadline-communication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.185425+01	396	EXECUTED	3:07ef049e78ecd250d56a88850bdd5250	Create Table		\N	2.0.5
initial-database-creation-122	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.463891+01	122	EXECUTED	3:d9da052c7f29fb3f76a2a4056af176bd	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-123	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.467819+01	123	EXECUTED	3:7ebb4272b707b682e405cb30ebb3fccb	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-124	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.470814+01	124	EXECUTED	3:360b5d5226fa5eb0d62b8531c2812a05	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-125	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.474509+01	125	EXECUTED	3:963fdb094cb961a23659f3e19a1ddde3	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-126	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.478564+01	126	EXECUTED	3:b20bb3c187e6488863f9d5481665fdac	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-127	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.481911+01	127	EXECUTED	3:f3035f410a920573b57eb459d1bcd6b1	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-128	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.485617+01	128	EXECUTED	3:ca1cdff9e1a997ff2c7b285e84221ab3	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-129	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.489255+01	129	EXECUTED	3:b475e7347003735620c2366fe038ee40	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-130	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.493192+01	130	EXECUTED	3:5523e28282da63951996a88d29635632	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-131	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.497056+01	131	EXECUTED	3:484e71ddda004fcbb6f56b3a1df07c12	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-132	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.500427+01	132	EXECUTED	3:750f465a29368e3c472c7717368e5315	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-133	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.504342+01	133	EXECUTED	3:ed11a2642a9063cae1be4ee314990279	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-134	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.507585+01	134	EXECUTED	3:632199e3f5e02d7b644fef85e7c7a148	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-135	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.510901+01	135	EXECUTED	3:f6136a87270d6999c38c78c5a4507ba0	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-136	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.514845+01	136	EXECUTED	3:3b8cdb7c8a87aded69e76f1127d93338	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-137	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.519086+01	137	EXECUTED	3:f21de5aaf5812d3b53ff6ba37c500419	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-138	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.524083+01	138	EXECUTED	3:212ee29342faa1bb2b4a50cfdfdf9a78	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-139	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.528032+01	139	EXECUTED	3:c1cd1a61a496daaf1bc3e941f84aa781	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-140	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.531408+01	140	EXECUTED	3:d5266cebc05f66e670752fd599970deb	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-141	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.535153+01	141	EXECUTED	3:1846e834301cbacca345ad1d30c97783	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-142	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.538669+01	142	EXECUTED	3:02dd707d2304800fa3353b76b4b14a79	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-143	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.54207+01	143	EXECUTED	3:c7d786a54bd2744456d86331287eaf88	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-144	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.545627+01	144	EXECUTED	3:d83e1d31be4d2a88a30cef280323dc14	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-145	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.549609+01	145	EXECUTED	3:2c8d1d5abd94c1f1b77b812e5a218703	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-146	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.553674+01	146	EXECUTED	3:98959c39111d467dbaef246b4e77c7d4	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-147	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.557431+01	147	EXECUTED	3:2f5b3db90f5fe8d7166b8698732d89ee	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-148	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.560895+01	148	EXECUTED	3:b6ab8ac7897d485ec2c01795fdbacba6	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-149	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.564144+01	149	EXECUTED	3:4621bf17b5d622b52e70ee84a2720ce4	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-150	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.567296+01	150	EXECUTED	3:d706f00de9bf475742860188e15d7b41	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-151	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.570734+01	151	EXECUTED	3:003b820bd40132476357aae25ba7d50b	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-152	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.574521+01	152	EXECUTED	3:cbe9e0b14bac88a7b895d8bc4c4777d7	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-153	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.577966+01	153	EXECUTED	3:38dc59e34869bc2425c7c820ba45cb9b	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-154	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.581226+01	154	EXECUTED	3:1822fb3caf8d43038c67a53fdb75e432	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-155	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.584777+01	155	EXECUTED	3:8416952db331ffa2dd27dc4f5734036c	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-156	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.588203+01	156	EXECUTED	3:4c2b2e5a5a4ee0175cab19c8b6ee084c	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-157	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.591918+01	157	EXECUTED	3:c5bf072f2de5890c8b3e22c07577f5ad	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-158	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.595527+01	158	EXECUTED	3:61b84144638971ed2b9f8a2a0fb1484f	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-159	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.598917+01	159	EXECUTED	3:edef41963c0d8e8d51ad15aa7a757420	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-160	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.602746+01	160	EXECUTED	3:6d94d16cf714dd8872660b484e632513	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-161	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.606086+01	161	EXECUTED	3:c47020da3e40d9b6239153776affab17	Add Unique Constraint		\N	2.0-rc7
initial-database-creation-162	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.609435+01	162	EXECUTED	3:8c1de34a4070d7a104ef5595ff365355	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-163	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.611555+01	163	EXECUTED	3:00c8bf9c83805a10ad1abbfe6cabdba8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-164	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.613535+01	164	EXECUTED	3:3fa310189e738082742a06c3751f2f3e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-165	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.61555+01	165	EXECUTED	3:0ed5111ef301a24755a17b99ba609336	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-166	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.61809+01	166	EXECUTED	3:f781f197771175ae97a798ae4c732613	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-167	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.620038+01	167	EXECUTED	3:f82641b8c47ac3372c38bd410315f1d7	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-168	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.621979+01	168	EXECUTED	3:e819b9f5b305d94a874ffff77f1b0b00	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-169	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.624617+01	169	EXECUTED	3:e638fd6a15647613720dfab7af6c67af	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-170	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.626559+01	170	EXECUTED	3:5f2cae397111f9c4c4112a513b9e811f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-171	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.628478+01	171	EXECUTED	3:0cd6d510389a9b5c7e7707baabf175d1	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-172	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.63049+01	172	EXECUTED	3:1e0dbe21557bd995cc4e10c17b06ad77	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-173	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.632564+01	173	EXECUTED	3:3c00120a79d285e58d49014dc3b3def2	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-174	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.63527+01	174	EXECUTED	3:a5d223789fb73e1b821bdd45c72478c8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-175	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.637388+01	175	EXECUTED	3:b7e560667260a76220664084e75a699b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-176	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.63976+01	176	EXECUTED	3:a04c06f20662d01674c2481258088719	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-177	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.641726+01	177	EXECUTED	3:eda6446777e754a9b28667808386fc07	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-178	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.643972+01	178	EXECUTED	3:cc43a952d1f4e90ae8ca08a86400b5b8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-179	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.64602+01	179	EXECUTED	3:3b7feac7849308d546f9e32306a0337b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-180	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.648176+01	180	EXECUTED	3:626dfbab1f6c43cbf5eda15af6c2d0b4	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-181	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.650482+01	181	EXECUTED	3:5d35e584fe5144871639463ab48448d9	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-182	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.652477+01	182	EXECUTED	3:54f532733816ed1173eb0a0978bc5d80	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-183	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.654503+01	183	EXECUTED	3:edf8db4cfb961a06787936314df7b94e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-184	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.656565+01	184	EXECUTED	3:1e122af08a912e15ee5c66f91b6c5bfa	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-185	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.658452+01	185	EXECUTED	3:49c144bddd204a4b53a3fa24016b0be2	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-186	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.660679+01	186	EXECUTED	3:7f27b6d4f3c5e0b00fb64f7131248b36	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-187	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.662762+01	187	EXECUTED	3:9c92c633ec12d7a6df8b65c97ad0fa35	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-188	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.664901+01	188	EXECUTED	3:94a94a8ce91fc86d16d4fa653a0d1453	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-189	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.667302+01	189	EXECUTED	3:b338072cafac27857c87f450a2ad6c46	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-190	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.669309+01	190	EXECUTED	3:9d5bd211cfd49f3b9fc91441f5eb908f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-191	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.671219+01	191	EXECUTED	3:bc7668fdd82c710bf043fa2f8a95dbeb	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-192	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.673158+01	192	EXECUTED	3:9a377a1c95da43a4a33381c22ed4e951	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-193	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.675289+01	193	EXECUTED	3:73a6387f780aa23e047099f18b15b50f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-194	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.677314+01	194	EXECUTED	3:8b99d9b4b1544d9b15595cfcc5e5ec4f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-195	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.679262+01	195	EXECUTED	3:c267aaa5cd192977a88171f504e04f29	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-196	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.681213+01	196	EXECUTED	3:8667c573c47e4d0fbcc32caa84df333a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-197	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.683718+01	197	EXECUTED	3:f11c3d339e18a174df76d41cd195f9de	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-198	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.685745+01	198	EXECUTED	3:05a89763fa1de7b97f16102791cfefed	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-199	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.687652+01	199	EXECUTED	3:c14c67e4fab2a4378ba63d3da1fb628a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-200	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.689971+01	200	EXECUTED	3:382f1905a4228bd3e9f0c040c970cde3	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-201	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.692+01	201	EXECUTED	3:1bac4b4ae207d8838f091c32cb2df31e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-202	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.69391+01	202	EXECUTED	3:40a79714aa74711e54e351fd7ae769a8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-203	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.695839+01	203	EXECUTED	3:a1500cdb8370f8da80715f3150d2da41	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-204	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.697845+01	204	EXECUTED	3:7ed433c571a7829ad2eb6e5389433468	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-205	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.700202+01	205	EXECUTED	3:684a3d66bf7275618fdaf47f577dca5f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-206	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.702635+01	206	EXECUTED	3:f90e8c7e57222696be65ba1a75afe0e1	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-207	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.70472+01	207	EXECUTED	3:d903424e7e44b1c1fb8c9d00bbaa5ff9	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-208	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.706776+01	208	EXECUTED	3:6f03b7841548675d0c674dfc8a58a76a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-209	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.708955+01	209	EXECUTED	3:69684a0db21bbdbec2ffba0b151a73bd	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-210	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.711066+01	210	EXECUTED	3:70d4db37a0127109f4e99eede4265e9e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-211	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.713689+01	211	EXECUTED	3:0dc5817e042530305a63787cd51c3d44	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-212	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.715984+01	212	EXECUTED	3:1b87cb4d62001fa3a6cd5df2bfee271f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-213	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.71798+01	213	EXECUTED	3:43bb14279d4807f3bb02f8c800ac6ec6	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-214	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.720122+01	214	EXECUTED	3:2250070459940c11e7ff31a4192c9355	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-215	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.722386+01	215	EXECUTED	3:1abe6242372fb6a1b8b7d5ed11c40cf6	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-216	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.724618+01	216	EXECUTED	3:365ccb2007a7db5a42a8558640d149e9	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-217	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.726765+01	217	EXECUTED	3:ec8d6d84ea00f6c7ece30c6d1ada877d	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-218	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.728865+01	218	EXECUTED	3:00a5c1aff60bf17c4f63c781d3d8868f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-219	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.73088+01	219	EXECUTED	3:80d78dda5a5d7a6e5b490c9b28841b16	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-220	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.732809+01	220	EXECUTED	3:3a8fd566182b2a101e0e843990cfa8df	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-221	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.734741+01	221	EXECUTED	3:229616a00b74e7128b9eeb41293cd91e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-222	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.736763+01	222	EXECUTED	3:ed9f60b9f8d7881c11360f2a020bdf4b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-223	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.738885+01	223	EXECUTED	3:fee2321152589ea84c5743175d4c180a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-224	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.740861+01	224	EXECUTED	3:f6ef1f3ee7da7a147539b46f9c1cf60b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-225	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.742857+01	225	EXECUTED	3:21557deb9ad7b4c25504862864502b1c	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-226	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.744805+01	226	EXECUTED	3:24adfcd3a41ae5648ffc2002dae0e4ef	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-227	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.746789+01	227	EXECUTED	3:bdd3cffbe9466ccbf6a1a791d61230fd	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-228	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.748903+01	228	EXECUTED	3:2182868d8f52e97c110e8901f8e2fc34	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-229	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.750751+01	229	EXECUTED	3:43b57b5e0d38ae69053bfcaf10d4ba8d	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-230	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.753512+01	230	EXECUTED	3:96d1199f9a6a19da0e6bac41293cf0ab	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-231	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.755877+01	231	EXECUTED	3:d493ad51ca6712c994efb741c1cd5cee	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-232	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.757883+01	232	EXECUTED	3:611e912194a15238fe4fd70e46ecd271	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-233	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.759749+01	233	EXECUTED	3:4823fd19347ba5a9c14b862fac025901	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-234	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.761812+01	234	EXECUTED	3:7aa2f827cf3710d979cd5c62770417bb	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-235	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.763758+01	235	EXECUTED	3:1d77a4d184e0f24891d62762883540af	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-236	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.766011+01	236	EXECUTED	3:354ab31aec28364faae025882682084a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-237	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.768191+01	237	EXECUTED	3:fb6d4b2090d92c3a4d685cb13176ee98	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-238	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.770338+01	238	EXECUTED	3:e91f5bf74998ca513288ed138c0da97d	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-239	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.77219+01	239	EXECUTED	3:f07664fc56241ad077820f8da9bad209	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-240	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.774171+01	240	EXECUTED	3:3cf705e46d55107e249d5a69dbfbe650	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-241	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.776531+01	241	EXECUTED	3:3de02419d8b4096899d78e2cd84d7e0b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-242	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.778481+01	242	EXECUTED	3:4b074cd6de5562d41ae3506d8d4b35f3	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-243	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.780425+01	243	EXECUTED	3:b577e13ab196e4c075b8be09841abb4a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-244	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.78235+01	244	EXECUTED	3:9ad3d17bbbac8f995a1313d24c37c816	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-245	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.784257+01	245	EXECUTED	3:6ed5e004af84bf9f2cfe8858fd2a5693	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-246	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.786636+01	246	EXECUTED	3:72287bc729bb6699bb3bc2210d12dfd4	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-247	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.788565+01	247	EXECUTED	3:cb0dc7b3886d0b94d5052539bd683a16	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-248	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.790871+01	248	EXECUTED	3:359b88a585529cbf0d688ded52661d0d	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-249	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.79317+01	249	EXECUTED	3:bc3e3f311891541c94bafaa8250b3837	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-250	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.795272+01	250	EXECUTED	3:873b0ba69634f01ec622ca9b24d9e70a	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-251	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.797431+01	251	EXECUTED	3:c137a192ad74895a6049234b596fecb5	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-252	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.800028+01	252	EXECUTED	3:793cd0492af23c4c209def47673ca914	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-253	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.80204+01	253	EXECUTED	3:d76b0b4675c504576f872e68c5e9bda7	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-254	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.803989+01	254	EXECUTED	3:eee13cf5dc3e864e56c6a9b03079578e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-255	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.805877+01	255	EXECUTED	3:f9088ee9f92067cab4b207d3aae3a37b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-256	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.807829+01	256	EXECUTED	3:e2326617f1c9b860249a0c0777ec20f6	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-257	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.810245+01	257	EXECUTED	3:adf9400fc812eb6c8f7d32aa787742e6	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-258	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.812139+01	258	EXECUTED	3:60fc7ab467e364cd6a3d72d2f4f1d736	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-259	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.814203+01	259	EXECUTED	3:a6cacd22103e0447094d9a161d7b7445	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-260	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.816192+01	260	EXECUTED	3:76bf1eb3a6880473927e7a101d037bd8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-261	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.818558+01	261	EXECUTED	3:5e2d94e8e56a7c57936a8bce78066b96	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-262	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.820461+01	262	EXECUTED	3:b6e995091bd0a2aed951e2fbf3f215a3	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-263	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.82291+01	263	EXECUTED	3:5a57fa35a8c7ca09756afcad21d8e86f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-264	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.824855+01	264	EXECUTED	3:a7fc2f018277eaaa7649fb46b6b27ab6	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-265	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.826773+01	265	EXECUTED	3:528d191ec33204cee277f7312c49cc2c	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-266	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.828735+01	266	EXECUTED	3:deb083face872d4d49b666a9b8bdfaba	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-267	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.830728+01	267	EXECUTED	3:a7b87e7b2788c237ebeef3591092532e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-268	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.833096+01	268	EXECUTED	3:8e9f116ff4830eb847589e5b4e62852e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-269	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.835094+01	269	EXECUTED	3:595c174489187fc62b19670995c5cbff	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-270	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.837465+01	270	EXECUTED	3:d7a769415b86b93205327adc4b037e45	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-271	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.839315+01	271	EXECUTED	3:06906c810ec8b347c75867ab21f7dc4c	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-272	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.84196+01	272	EXECUTED	3:a28d48ed75ff265b6472e9749f95d1a5	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-273	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.843835+01	273	EXECUTED	3:5990b5955a764200dd54eb4dd3b0a7cf	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-274	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.845759+01	274	EXECUTED	3:5d4cc1738a27175979f1c973b1bd5ea9	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-275	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.847751+01	275	EXECUTED	3:d9130cc23b8afa27fd84f7c72d818efd	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-276	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.84972+01	276	EXECUTED	3:18feaa2b4b9cbce46ea7b7a0c710de9f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-277	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.852047+01	277	EXECUTED	3:506fb6a53c157ce68105f451ad5958ff	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-278	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.854041+01	278	EXECUTED	3:b02c658ae947d20ac0ee1d207ebd210e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-279	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.855982+01	279	EXECUTED	3:c346d8903750d250fabc343064880e6f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-280	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.85797+01	280	EXECUTED	3:37fcf9ad58b891a096b9c95f4ea57b58	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-281	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.859972+01	281	EXECUTED	3:611486b58c51ad97deab489a17b23e2e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-282	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.86188+01	282	EXECUTED	3:0efe8669ed086af6da655a53d4ced916	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-283	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.863889+01	283	EXECUTED	3:730ece3259ea1ee3ffa53563790465d8	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-284	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.868112+01	284	EXECUTED	3:5eb111d4b478c0c9a66a3a4a112c1c6b	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-285	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.870006+01	285	EXECUTED	3:b7d27d03ee27cc13c76c5262d518b876	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-286	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.872084+01	286	EXECUTED	3:3663d9ecd66964bffcc07bcfce7bdcdc	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-287	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.874074+01	287	EXECUTED	3:35e0a6356d11ed9dfe53c300b9e2ffee	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-288	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.876295+01	288	EXECUTED	3:4ae0336d6b9d807036d03ad041b67052	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-289	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.878369+01	289	EXECUTED	3:2da61d1b760209a704e29bfa4a22455e	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-290	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.880388+01	290	EXECUTED	3:2604fb5ddeccc31b1dccd4cd0bad4342	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-291	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.882275+01	291	EXECUTED	3:da9d240fdde86539e1580b84687e0189	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-292	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.884264+01	292	EXECUTED	3:0dc9aa5380e9a48fe9aaf306235988a4	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-293	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.886475+01	293	EXECUTED	3:58c6315352f7cefbddeb9b3a38d1e140	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-294	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.88837+01	294	EXECUTED	3:91398a7f542f90a13d1f857ca3937de1	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-295	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.890715+01	295	EXECUTED	3:5395eb857489412499e37c691ea36b8f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-296	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.892997+01	296	EXECUTED	3:494a1128a80caad8d24c5f3574ef6edd	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-297	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.894846+01	297	EXECUTED	3:fa3b4dd73dd82e3a26c6563c9828fba3	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-298	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.89681+01	298	EXECUTED	3:e83453938c668f856d1df1537ec25d37	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-299	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.898713+01	299	EXECUTED	3:c5655c084990797f73bf295660881932	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-300	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.900791+01	300	EXECUTED	3:4747b6b28b49b810444aa6af7c133fab	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-301	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.902857+01	301	EXECUTED	3:f73d714400c8712c0715e2da673e9509	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-302	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.904829+01	302	EXECUTED	3:4d50b8c05ded66b150571543bcd91a37	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-303	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.906786+01	303	EXECUTED	3:7a5e18b1ed8e9813ca4920bd0856ecd0	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-304	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.908799+01	304	EXECUTED	3:e52f19afd5f5966cff359311b4c3acac	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-305	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.910865+01	305	EXECUTED	3:8548d763866edc7944ec1b0facb1560f	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-306	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.914743+01	306	EXECUTED	3:fc14a87fde20c7151888cea5c48c6f39	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-307	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.916732+01	307	EXECUTED	3:23a513bb939d6d2751a1550188c32222	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-308	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.918612+01	308	EXECUTED	3:4144c0d934e5fd823f19ef91da210ffa	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-309	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.920519+01	309	EXECUTED	3:c0d764328d333e644989448a4cd480bb	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-310	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.922943+01	310	EXECUTED	3:461ea2548e20f99478f3203dbf33bc16	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-311	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.924864+01	311	EXECUTED	3:3eeefe2f703d57218dde9b05fcdbc5cf	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-312	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.926881+01	312	EXECUTED	3:564cd8aac65a0319c9c3c75a486ace41	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-313	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.928851+01	313	EXECUTED	3:48d80e1c9868d51d687680b42fe47f3d	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-314	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.930867+01	314	EXECUTED	3:6c6213c38e211d11aa77f0766a18e1fe	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-315	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.932916+01	315	EXECUTED	3:f522ccbad33e6a463b265e241c4ae0db	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-316	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.934829+01	316	EXECUTED	3:e5777dd44529b270c7514bc322d72105	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-317	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.937812+01	317	EXECUTED	3:5a1c1fb8b9f6cce7fbaa03b255b5a033	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-318	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.939786+01	318	EXECUTED	3:ad070f00871b05e431528e34c3f09cde	Add Foreign Key Constraint		\N	2.0-rc7
initial-database-creation-319	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.941522+01	319	EXECUTED	3:1dde4f2407d314306ae29ad174d98de3	Create Table		\N	2.0-rc7
initial-database-creation-320	mrego	src/main/resources/db.changelog-database.xml	2014-03-20 14:21:55.94284+01	320	EXECUTED	3:5a5608b194d0ec72e2b8f53675ff8de0	Insert Row		\N	2.0-rc7
resize-precision-in-planning_data	dpino	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.971799+01	321	EXECUTED	3:3ee94e7e64b7ed2592dfb71db6923a1c	Modify data type (x2)	Resize precision for 'progress_by_duration' and 'progress_by_num_hours' fields	\N	2.0-rc7
add-company-logo-url-configuration-setting	ltilve	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.976444+01	322	EXECUTED	3:009cd5341d49b5415bf7ec539de24c79	Add Column, Update Data	Add new column with configuration setting	\N	2.0-rc7
add scheduling mode	ogonzalez	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.978547+01	323	EXECUTED	3:8a4ed0c0131906744a85a38278180e13	Add Column, Update Data	column for org.libreplan.business.orders.entities.Order.schedulingMode	\N	2.0-rc7
rename start_constraint_type in task and task milestone	ogonzalez	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.980452+01	324	EXECUTED	3:0ba5792ffc0bff2a1ce571047b008796	Rename Column (x2)	Caused by renaming org.libreplan.business.planner.entities.TaskPositionConstraint.startConstraintType	\N	2.0-rc7
add-scenarios-enabled-configuration-setting	ltilve	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.982648+01	325	EXECUTED	3:53d99bb420a0c55c8eaa9389e3fc0ed5	Add Column, Update Data	Add new column with scenarios visibility flag	\N	2.0-rc7
change-types-start-finish-date-criterion-satisfaction	ogonzalez	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.997296+01	326	EXECUTED	3:93527c263e394c3960738fc2e9734c4c	Modify data type (x2)	Change types of start and finish date to date for criterion satisfaction table	\N	2.0-rc7
remove-stretches-with-amountWorkPercentage-equal-100	dpino	src/main/resources/db.changelog-initial.xml	2014-03-20 14:21:55.998718+01	327	EXECUTED	3:a0f7f55dd790eefb369fbf139642a868	Custom SQL	Removes all stretches which amountWorkPercentage value is 100 as now these stretches will be created automatically and never stored into DB	\N	2.0-rc7
use-capacity-instead-of-effort_duration-and-not_over_assignable	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.002586+01	328	EXECUTED	3:71ae3b8d8998329d68e95d8ad2135745	Add Column, Rename Column, Update Data, Drop Column	Convert from duration + notAssignable (not over assignable) to capacity property	\N	2.0-rc7
use-capacity-for-exceptions	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.005499+01	329	EXECUTED	3:83576dfaa5871f36aa3f7d4119814f8f	Add Column, Rename Column, Custom SQL	Convert from duration to capacity property for calendar exceptions	\N	2.0-rc7
use-capacity-for-capacity-per-day-for-calendar-data	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.008132+01	330	EXECUTED	3:a643cf37da0098f0cad242d306bb5d05	Rename Table, Add Column, Rename Column	Convert from duration to capacity in effort per day for CalendarData	\N	2.0-rc7
by_default_weekends_are_not_overassignable	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.009541+01	331	EXECUTED	3:8ddf0ca2b0fc243475ee2f4c21172565	Custom SQL	By default weekends are not over assignable	\N	2.0-rc7
replace-column-limited_resource-with-resource_type	jaragunde	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.013585+01	332	EXECUTED	3:b6640208fbf11943fa46d8953516bad7	Add Column, Update Data (x2), Add Not-Null Constraint, Drop Column	Replace column limited_resource with resource_type in resource table	\N	2.0-rc7
add-new-column-changed_default_admin_password	smontes	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.016843+01	333	EXECUTED	3:f1a662e7435430892ac7d6cf903c4ce8	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_admin_password with default value FALSE to configuration table	\N	2.0-rc7
add-new-column-changed_default_user_password	smontes	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.020372+01	334	EXECUTED	3:cf1274e98ff8796a0f4e3527004c8cd0	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_user_password with default value FALSE to configuration table	\N	2.0-rc7
add-new-column-changed_default_wsreader_password	smontes	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.023732+01	335	EXECUTED	3:90bb4041ae144714e7bc703ee73d70c1	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_wsreader_password with default value FALSE to configuration table	\N	2.0-rc7
add-new-column-changed_default_wswriter_password	smontes	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.027155+01	336	EXECUTED	3:124f7fbb425a88220c72c315639a546e	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_wswriter_password with default value FALSE to configuration table	\N	2.0-rc7
add-intended_resources_per_day-column-to-resource-allocation	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.02923+01	337	EXECUTED	3:0f818026f55b70d7907ff07b6d6c7f1d	Add Column, Custom SQL	add intended_resources_per_day column to resource-allocation	\N	2.0-rc7
change-original-total-assignment-to-use-effort-duration	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.032546+01	338	EXECUTED	3:e29e39577cdd5015b9be6999d8310544	Add Column, Add Default Value, Custom SQL, Drop Column	rename original_total_assignment to intended_total_assignment and now it's interpreted as an EffortDuration	\N	2.0-rc7
add-intended_non_consolidated_effort	ogonzalez	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.035286+01	339	EXECUTED	3:e7ac605310143d646b9c8fd0de19c51a	Add Column, Add Default Value, Custom SQL		\N	2.0-rc7
add-effort-duration-to-task-and-milestone	mrego	src/main/resources/db.changelog-1.0.xml	2014-03-20 14:21:56.038779+01	340	EXECUTED	3:818f79da6b908a1a7c579e60deb53e26	Add Column (x2), Add Default Value (x2)	constraintDate attribute in class TaskPositionConstraint has been changed to IntraDayDate.\n            It is needed to add some columns to store EffortDuration in Task and TaskMilestone.	\N	2.0-rc7
add-new-column-ldap-host	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.040264+01	341	EXECUTED	3:7984328274b0af25bf454a71f709a0dc	Add Column	Add new column to store ldap host	\N	2.0-rc7
add-new-column-ldap-port	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.041621+01	342	EXECUTED	3:a698fd66dc9b58c8e7df0ffafc6f7d1c	Add Column	Add new column to store ldap port	\N	2.0-rc7
add-new-column-ldap-base	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.042959+01	343	EXECUTED	3:be1cce8488649e3d266a5df219713071	Add Column	Add new column to store ldap base	\N	2.0-rc7
add-new-column-ldap-userdn	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.044543+01	344	EXECUTED	3:c4c93711bd374e215a65f6f45b6a5f44	Add Column	Add new column to store ldap userdn	\N	2.0-rc7
add-new-column-ldap-password	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.045958+01	345	EXECUTED	3:22761f7b110aec44930935cb79f179d5	Add Column	Add new column to store ldap password	\N	2.0-rc7
add-new-column-ldap-userid	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.04732+01	346	EXECUTED	3:b628b315f6a3d2266cb6d280f9525f5f	Add Column	Add new column to store ldap userid	\N	2.0-rc7
add-new-column-ldap-save-password-db	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.048693+01	347	EXECUTED	3:b4447892b37ee903664f9b5bd54e7a2e	Add Column	Add new column to store ldap passwords in database	\N	2.0-rc7
add-new-column-ldap-auth-enabled	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.050058+01	348	EXECUTED	3:979a11f6d147433ec84e6165927683fa	Add Column	Add new column to store ldap authentication enabled	\N	2.0-rc7
add-new-column-navalplan-user	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.051381+01	349	EXECUTED	3:76c2b18d10554416d9ca9055d3c2e768	Add Column	Add new column to store if it is a navalplan user	\N	2.0-rc7
delete-constraint-not-null-user-password	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.052893+01	350	EXECUTED	3:0470d6d460842219443027cdb633232c	Drop Not-Null Constraint	Delete constraint not null for user password	\N	2.0-rc7
set-default-value-navalplan-user	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.055177+01	351	EXECUTED	3:8935d0ba839c252967d398f0db3ed01d	Add Default Value, Add Not-Null Constraint		\N	2.0-rc7
set-default-value-ldap-save-password-db	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.057555+01	352	EXECUTED	3:6bcb9c9c00f066bc7ef5e568abf2da6f	Add Default Value, Add Not-Null Constraint		\N	2.0-rc7
set-default-value-ldap-auth-enabled	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.060651+01	353	EXECUTED	3:987742cd9637874021c47ad9388655d2	Add Default Value, Add Not-Null Constraint		\N	2.0-rc7
add-new-column-ldap-save-roles-db	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.063703+01	354	EXECUTED	3:e7fc821091b4d96786edf2aa98308f3b	Add Column, Add Default Value, Add Not-Null Constraint	Add new column to store ldap roles in database	\N	2.0-rc7
create-new-table-matching-roles	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.073569+01	355	EXECUTED	3:5afc1ada9ec4ae6bfd66368c2512e145	Create Table, Add Foreign Key Constraint, Add Column (x2)	Add new column to store ldap role property	\N	2.0-rc7
add-new-column-ldap-search-query	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.074913+01	356	EXECUTED	3:8e994641ada47323406f65d515ff00a0	Add Column	Add new column to store ldap role search query	\N	2.0-rc7
add-new-column-enabled-autocomplete-login	smontes	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.078522+01	357	EXECUTED	3:0542da97fbff41b95f9cf5ef10ffa322	Add Column, Add Default Value, Add Not-Null Constraint	Add new column enabled_autocomplete_login with default value TRUE to configuration table	\N	2.0-rc7
add-application-language	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.088273+01	358	EXECUTED	3:f451e552cb7903c699c88ecde02e85c6	Add Column	Add new column to store the language of application for this user	\N	2.0-rc7
move-columns-from-configuration-table	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.099621+01	359	EXECUTED	3:7243259227df39ef2f0683d4b425d369	Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint, Drop Column (x3)	Move columns from configuration table to user table	\N	2.0-rc7
add-new-fields	calvarinop	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.101723+01	360	EXECUTED	3:6950443e7dca6f2af1e7d095abde62bc	Add Column (x2)	Add new column to store the first and last name for this user	\N	2.0-rc7
remove-configuration_roles_ldap	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.103034+01	361	EXECUTED	3:88dacdfabdf225e6ed8b25e4807afeb8	Drop Column	Remove column configuration_roles_ldap in role_matching_id	\N	2.0-rc7
add-column-progress_all_by_num_hours-in-planning_data	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.104396+01	362	EXECUTED	3:9410a670cf6cccd21638c8eddb6b8b36	Add Column	Add column progress_all_by_num_hours in planning_data	\N	2.0-rc7
update-color-in-calendar_exception_type-to-default	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.105273+01	363	EXECUTED	3:2f5f94374b2021dca7bc4d8245807ae4	Update Data	Update color in calendar_exception_type to DEFAULT	\N	2.0-rc7
create-table-manual_function	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.111549+01	364	EXECUTED	3:aac963ac8a7a63814472c50edf8b367a	Create Table, Add Foreign Key Constraint		\N	2.0-rc7
change-numhours-to-effort-in-work-report-lines	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.112847+01	365	EXECUTED	3:824cfe1ec43c490e63bf2d8316f1255e	Rename Column	Changing work_report_line numHours to effort	\N	2.0-rc7
update-numhours-values-to-effort-values	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.114178+01	366	EXECUTED	3:79a9659b3a77004c5fe13bbec8aad88c	Custom SQL	Updating numHours to effort (hours to seconds)	\N	2.0-rc7
change-sum_charged_hours-to-sum_charged_effort	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.116808+01	367	EXECUTED	3:202833e32d386f5a3edf903b2d5a21b4	Rename Table, Rename Column (x2)	Changing sum_charged_hours to sum_charged_effort	\N	2.0-rc7
update-effort-values-in-sum_charged_effort	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.118455+01	368	EXECUTED	3:6d7d2103e92b3ac55b9658931fc3ed65	Custom SQL (x2)	Updating effort values (hours to seconds) in sum_charged_effort table	\N	2.0-rc7
drop-foreign-key-sum_charged_hours_id-in-order_element	dmel	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.120332+01	369	EXECUTED	3:288d757a697e34248fbb5dab4177c4a0	Drop Foreign Key Constraint		\N	2.0-rc7
rename-sum_charged_hours_id-to-sum_charged_effort_id	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.121979+01	370	EXECUTED	3:f8140dac93702c25f7fe75d9217ef9c5	Rename Column	Rename sum_charged_hours_id to sum_charged_effort_id in order_element	\N	2.0-rc7
add-foreign-key-sum_charged_effort_id-in-order_element	dmel	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.124221+01	371	EXECUTED	3:a8fa898f9cfaa1afa3afbab4c1c9f82b	Add Foreign Key Constraint		\N	2.0-rc7
drop-column-date-in-stretches-table	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.125603+01	372	EXECUTED	3:e0ed365c168583ff5c4c81c9ac79d644	Drop Column		\N	2.0-rc7
add-version-to-planning-data	ogonzalez	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.131904+01	373	EXECUTED	3:ae9dca1ca9cb3556cf5efdca689b8fc1	Add Column		\N	2.0-rc7
change-navalplan_user-to-libreplan_user-in-user_table	mrego	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.133413+01	374	EXECUTED	3:82c71f38665f14d5d8ef9391a5c2487d	Rename Column	Changing navalplan_user to libreplan_user in user_table	\N	2.0-rc7
add-new-column-ldap-role-strategy	idiazt	src/main/resources/db.changelog-1.1.xml	2014-03-20 14:21:56.136959+01	375	EXECUTED	3:3145034f8fd26477ae1fac7da835a43e	Add Column, Add Default Value, Add Not-Null Constraint	Add new column to store ldap role strategy	\N	2.0-rc7
add-task_end_date_effort_duration-to-consolidated_value	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.139337+01	376	EXECUTED	3:4ffcc289b81bfbfa1d43466ad34d9705	Add Column, Add Default Value	taskEndDate attribute in class ConsolidatedValue has been changed to IntraDayDate.\n            It is needed to add some columns to store EffortDuration in ConsolidatedValue.	\N	2.0-rc7
change-sum_of_hours_allocated-to-sum_of_assigned_effort	jaragunde	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.140863+01	377	EXECUTED	3:075a1a017c4cac0b0480a84f3a539655	Rename Column	Changing sum_of_hours_allocated to sum_of_assigned_effort	\N	2.0-rc7
update-effort-values-in-sum_charged_effort	jaragunde	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.142373+01	378	EXECUTED	3:f408e919dea5d8b75042efb84879380d	Custom SQL	Updating effort values (hours to seconds) in task_element table	\N	2.0-rc7
add-new-column-check_new_version_enabled	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.145523+01	379	EXECUTED	3:8e46dd07efca106657d62ade635bbf03	Add Column, Add Default Value, Add Not-Null Constraint	Add new column check_new_version_enabled with default value TRUE to configuration table	\N	2.0-rc7
add-new-column-allow_to_gather_usage_stats_enabled	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.148821+01	380	EXECUTED	3:93c54c45c29d479faa98e6db1af06591	Add Column, Add Default Value, Add Not-Null Constraint	Add new column allow_to_gather_usage_stats_enabled with default value FALSE to configuration table	\N	2.0-rc7
change-column-description-in-order_element-to-text	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.150267+01	381	EXECUTED	3:f2241d994f460dca4300c84c9e8f76a0	Modify data type	Change column description in order_element to TEXT	\N	2.0-rc7
change-column-description-in-order_element_template-to-text	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.151629+01	382	EXECUTED	3:cb7234813755a9eceb39dc4601011375	Modify data type	Change column description in order_element_template to TEXT	\N	2.0-rc7
add-budget-column-to-order_line	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.15503+01	383	EXECUTED	3:68630e28c83f5f0b24ffd8378526d2a7	Add Column, Add Not-Null Constraint, Add Default Value	add budget column to order_line	\N	2.0-rc7
add-budget-column-to-order_line_template	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.159231+01	384	EXECUTED	3:0b8337c5f55c7c2d0159facda7ca80ef	Add Column, Add Not-Null Constraint, Add Default Value	add budget column to order_line_template	\N	2.0-rc7
initial-database-creation-customer-comunication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.164069+01	385	EXECUTED	3:59a56c15bcd845deb7f160c2ed1ff817	Create Table		\N	2.0.5
initial-database-creation-subcontractor-comunication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.168221+01	386	EXECUTED	3:ecd951d180545b3e53241e7a862215ac	Create Table		\N	2.0.5
initial-database-creation-subcontractor-comunication-value	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.170028+01	387	EXECUTED	3:0193a0cb269f0fca18d96d1be7628b2e	Create Table		\N	2.0.5
rename-table-customer_comunication-to-customer_communication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.171787+01	388	EXECUTED	3:1ae733e6ccc918ffebd42a6f81d64d0b	Rename Table	Rename table customer_comunication to customer_communication	\N	2.0.5
rename-column-comunication_type-to-communication_type	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.17312+01	389	EXECUTED	3:3a22719f63e2217b3263184f5edfcba7	Rename Column	Rename column comunication_type to communication_type	\N	2.0.5
rename-column-comunication_date-to-communication_date	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.174372+01	390	EXECUTED	3:2cd6e17fc795e3658f464709fba77874	Rename Column	Rename column comunication_date to communication_date	\N	2.0.5
rename-table-subcontractor_comunication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.175751+01	391	EXECUTED	3:e9e6a2bcb8dfe3fed721f32999bf51f1	Rename Table	Rename table subcontractor_comunication to subcontractor_communication	\N	2.0.5
rename-column-comunication_type-on-subcontractor-communication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.177031+01	392	EXECUTED	3:66fa4dd7f1e8cfc5c2a0a569eb1b7e76	Rename Column	Rename column comunication_type to communication_type	\N	2.0.5
rename-column-comunication_date-on-subcontractor-communication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.178274+01	393	EXECUTED	3:44d8a7bf4bbd4327cdfce81458b30554	Rename Column	Rename column comunication_date to communication_date	\N	2.0.5
rename-table-subcontractor_comunication_values	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.17962+01	394	EXECUTED	3:2a590f887ff2eff855dec6ebb6ab03fd	Rename Table	Rename table subcontractor_comunication_values to subcontractor_communication_values	\N	2.0.5
rename-column-subcontractor_comunication_id	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.181312+01	395	EXECUTED	3:26f643ba3829536f31f78def5300d9f4	Rename Column	Rename column subcontractor_comunication_id	\N	2.0.5
add-delivering-date-column-to-order-entity	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.186776+01	397	EXECUTED	3:5ea1e3d168533ccd24099c6ac95136c0	Add Column	Add new delivering date column to order	\N	2.0.5
creation-subcontractor-deliver-date	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.191091+01	398	EXECUTED	3:8d41b20b896bae55febcc7ab03daff51	Create Table		\N	2.0.5
add-subcontracted-task-data	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.192428+01	399	EXECUTED	3:1a4b3b7369aea7ffff6b1cc763ee07dd	Add Column	Add the column subcontracted_task_id to maintain the relation	\N	2.0.5
database-creation-table-end-date-communication-to-customer	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.196789+01	400	EXECUTED	3:1a860a9a519552f494435a180819a216	Create Table		\N	2.0.5
subcontracted-date-id-column-to-end-date-communication	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.198133+01	401	EXECUTED	3:6bf0c71648f12e59f928f6c505e596ae	Add Column	Add subcontracted date id column to end date communication to customer	\N	2.0.5
rename-table-end_date_comunication-to-customer	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.199511+01	402	EXECUTED	3:7994a86f100e2fb01458dd96c62a4b28	Rename Table	Rename table to end_date_communication	\N	2.0.5
change-mapping-order-element-and-sum-charged-effort-postgresql	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.203659+01	403	EXECUTED	3:2c5d8a9bd39b9a6c647584bda021b433	Add Column, Create Procedure, Custom SQL, Add Foreign Key Constraint, Drop Column	Change mapping between OrderElement and SumChargedEffort in MySQL	\N	2.0.5
creation-table-expense-sheet	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.210201+01	404	EXECUTED	3:58560df3b8bda44b8057b7538e66c15d	Create Table		\N	2.0.5
creation-table-expense-sheet-line	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.220504+01	405	EXECUTED	3:c07a2ad8a9e8c277e13bd92806e1414e	Create Table, Add Foreign Key Constraint (x3)		\N	2.0.5
add-new-column-generate-code-for-expense-sheets	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.223631+01	406	EXECUTED	3:cad60515a7450740e2582ae1ce815885	Add Column, Add Default Value, Add Not-Null Constraint	Add new column to generate the code for expense sheet in configuration table	\N	2.0.5
modify-columns-type-in-expense-sheet-to-date	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.238135+01	407	EXECUTED	3:30af5261fc7d1cc196b254962a6bc9cd	Modify data type (x2)	modify columns type in expense sheet to date	\N	2.0.5
modify-columns-type-in-expense-sheet-line-to-date	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.245495+01	408	EXECUTED	3:80e8ab1008f78dd80d4d0427b8cab872	Modify data type	modify columns type in expense sheet line to date	\N	2.0.5
create3-table-sum-expenses	smontes	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.251004+01	409	EXECUTED	3:5d50ee6bcc8395686dc88683de0c94f7	Create Table, Add Foreign Key Constraint	creation table sum_expenses	\N	2.0.5
add-new-columns-for-currency-in-configuration	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.257222+01	410	EXECUTED	3:c0e2f3cc0bd28a4cfb77c91e32b8f72e	Add Column, Add Default Value, Add Not-Null Constraint, Add Column, Add Default Value, Add Not-Null Constraint	Add new columns for currency in configuration table	\N	2.0.5
remove-code-from-order_element_template	jaragunde	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.310986+01	411	EXECUTED	3:88f6c4f5d7bece8e045f1cae70e5cfae	Drop Column	Remove column code in order_element_template table	\N	2.0.5
add-relationship-between-worker-and-user	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.316333+01	412	EXECUTED	3:c1327b421dab02ba46646e25ce3033f0	Add Column, Add Unique Constraint, Add Foreign Key Constraint	Add column and constraints needed for relationship between worker and user	\N	2.0.5
add-monthly_timesheets_type_of_work_hours-to-configuration	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.319179+01	413	EXECUTED	3:1fba4f4fa3f9838dcecc9f4c3f03adde	Add Column, Add Foreign Key Constraint	Add new column monthly_timesheets_type_of_work_hours to\n            configuration table.	\N	2.0.5
add-new-column-personal-to-expense_sheet-table	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.322232+01	414	EXECUTED	3:10bc5bda8b237a316785be725d7be1e3	Add Column, Add Default Value, Add Not-Null Constraint	Add new column personal with default value FALSE to expense_sheet\n            table	\N	2.0.5
add-new-column-changed_default_wssubcontracting_password	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.32542+01	415	EXECUTED	3:013b7f1448a1110847cf286f1413f035	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_wssubcontracting_password with\n            default value FALSE to configuration table	\N	2.0.5
rename-column-elt-in-roles_table-to-role	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.32673+01	416	EXECUTED	3:776a769c3f1a794f6bc4435676322d25	Rename Column	Rename column elt in roles_table to role	\N	2.0.5
rename-roles-in-roles_table	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.329105+01	417	EXECUTED	3:096ffd842b1b2b6ada758528f1315a4f	Update Data (x4)	Rename roles in roles_table	\N	2.0.5
rename-column-elt-in-profile_roles-to-role	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.330417+01	418	EXECUTED	3:8696c001929a49d0958e563ec6070ee8	Rename Column	Rename column elt in profile_roles to role	\N	2.0.5
rename-roles-in-profile_roles	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.332755+01	419	EXECUTED	3:9c1e100911e9b284330a5aa3589984e5	Update Data (x4)	Rename roles in profile_roles	\N	2.0.5
drop-column-changed_default_user_password-in-configuration	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.334341+01	420	EXECUTED	3:2468aba8b41e0534a2b163e860dea252	Drop Column	Drop column code in configuration table	\N	2.0.5
add-new-column-changed_default_manager_password	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.337611+01	421	EXECUTED	3:6f3d2474a8785e6a221a0e2b3f098a73	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_manager_password with\n            default value FALSE to configuration table	\N	2.0.5
add-new-column-changed_default_hresources_password	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.341092+01	422	EXECUTED	3:0d70382a0e68da8f6c7835212988162b	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_hresources_password with\n            default value FALSE to configuration table	\N	2.0.5
add-new-column-changed_default_outsourcing_password	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.344848+01	423	EXECUTED	3:f72b604280d98a102dc357ad9ef71b26	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_outsourcing_password with\n            default value FALSE to configuration table	\N	2.0.5
add-new-column-changed_default_reports_password	mrego	src/main/resources/db.changelog-1.2.xml	2014-03-20 14:21:56.348075+01	424	EXECUTED	3:f4fdaac87e8d1d2246ac482544268dc8	Add Column, Add Default Value, Add Not-Null Constraint	Add new column changed_default_reports_password with\n            default value FALSE to configuration table	\N	2.0.5
change-column-notes-in-task_element-to-text	jaragunde	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.3494+01	425	EXECUTED	3:43aa8b1c00d2eb37547f3a6c49fb4023	Modify data type	Change column notes in task_element to TEXT	\N	2.0.5
update-work_report_type-name-to-personal-timehseets	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.351209+01	426	EXECUTED	3:b6bca02ba95171a212ead3704760b41d	Update Data	Update work_report_type name from "Monthly timesheets" to "Personal\n            timehsheets"	\N	2.0.5
add-personal_timesheets_periodicity-column-to-configuration	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.353491+01	427	EXECUTED	3:bcb66fc0ee64a06c7aeee7df6a8c64d1	Add Column, Update Data	Add personal_timesheets_periodicity column to configuration	\N	2.0.5
rename-column-from-monthly-to-personal-in-configuration	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.357008+01	428	EXECUTED	3:21f778d292e09ef087005888af1f7f15	Drop Foreign Key Constraint, Rename Column, Add Foreign Key Constraint	Rename column monthly_timesheets_type_of_work_hours to\n            personal_timesheets_type_of_work_hours in configuration table	\N	2.0.5
add-max_users-and-max_resources-columns-to-configuration	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.360096+01	429	EXECUTED	3:e098fa833f01deb6447f715e6c3dd5ff	Add Column (x2), Update Data (x2)	Add max_users and max_resources columns to configuration	\N	2.0.5
add-columns-first-and-last-timesheet_date-to-sum_charged_effort	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.362084+01	430	EXECUTED	3:44643d4a95daa8bfb8eb87350ca09b9c	Add Column (x2)	Add columns first_timesheet_date and last_timesheet_date to\n            sum_charged_effort table	\N	2.0.5
add-new-column-read_only-to-advance_type	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.365391+01	431	EXECUTED	3:f188be8e7cb36ffc378ee1bbb1efe4c3	Add Column, Add Default Value, Add Not-Null Constraint	Add new column read_only with default value FALSE to advance_type\n            table.	\N	2.0.5
add-new-column-finished-to-work_report_line	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.368624+01	432	EXECUTED	3:4179c949aced25d73e640b35729f5dc3	Add Column, Add Default Value, Add Not-Null Constraint	Add new column finished with default value FALSE to\n            work_report_line table.	\N	2.0.5
add-new-column-finished_timesheets-to-sum_charged_effort	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.371967+01	433	EXECUTED	3:2e0afbe29878247b314daf44d13e7953	Add Column, Add Default Value, Add Not-Null Constraint	Add new column finished_timesheets with default value FALSE to\n            sum_charged_effort table.	\N	2.0.5
add-new-column-updated_from_timesheets-to-task_element	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.374896+01	434	EXECUTED	3:8e277ed572a72c08c2d637c171f75faa	Add Column, Add Default Value, Add Not-Null Constraint	Add new column updated_from_timesheets with default value FALSE to\n            task_element table.	\N	2.0.5
update-status-values-in-order_table	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.377032+01	435	EXECUTED	3:3a3f781e8ff867ecb6f049b95d2d36f6	Update Data (x7)	Updating status values in order_table	\N	2.0.5
drop-unique-constraint-code-in-order_element	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.378664+01	436	EXECUTED	3:a4fafb8fe670f6e03b1fe0aab68eeefe	Drop Unique Constraint	Drop unique constraint for code in order_element table	\N	2.0.5
add-seconds_planning_warning-column-to-configuration	mrego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.381799+01	437	EXECUTED	3:812805ebd72a401ecab1d002ae7eff36	Add Column, Update Data, Add Not-Null Constraint	Add seconds_planning_warning column to configuration	\N	2.0.5
add-updatable-boolean-column-to-calendar-exception-type	acarro	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.385127+01	438	EXECUTED	3:0429ddb8ec22c38600f3e3b25bafeb20	Add Column, Add Default Value, Add Not-Null Constraint	Add new updatable boolean column to calendar exception type with default value TRUE	\N	2.0.5
create-table-order-sync-info	miciele	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.394491+01	439	EXECUTED	3:45e2401780cf78ac5187cd61a604bb4a	Create Table, Add Foreign Key Constraint	Create new table order_sync_info	\N	2.0.5
create-tables-related-to-connector-entity	rego	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.407838+01	440	EXECUTED	3:8d5a3216a2cc1e0113a4b8b080ddfd3b	Create Table (x2), Add Primary Key, Add Foreign Key Constraint	Create tables related to Connector entity	\N	2.0.5
create-table-job-scheduler-configuration	miciele	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.414582+01	441	EXECUTED	3:0a1913a9dbb8d4504471417d1fafba5b	Create Table	Create new table job_scheduler_configuration	\N	2.0.5
add-projects_filter_period_since-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.415981+01	442	EXECUTED	3:655c5015d27f29176924aea0a75c074c	Add Column	Add column to store project filtering interval 'range since' parameter	\N	2.0.5
add-projects_filter_period_to-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.417371+01	443	EXECUTED	3:eeed9d2d9655d8ca97db00f088e08a3e	Add Column	Add column to store project filtering interval 'range to' parameter	\N	2.0.5
add-resources_load_filter_period_since-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.418688+01	444	EXECUTED	3:7bcf0c413c87bcf38b4c61689f5246fa	Add Column	Add column to store resources load filtering interval 'range since' parameter	\N	2.0.5
add-resources_load_filter_period_to-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.420775+01	445	EXECUTED	3:4c4bbe1465a2536bd808e2efe000805d	Add Column	Add column to store resources load filtering interval 'range to' parameter	\N	2.0.5
add-projects_filter_label_id-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.422117+01	446	EXECUTED	3:7f70067dbcb427e6c7715d6fd00ff21e	Add Column	Add column to store label reference for default project filtering	\N	2.0.5
add-resources_load_filter_criterion_id-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.423471+01	447	EXECUTED	3:2c80e7f49b55cd5644966b3d2b4c3b36	Add Column	Add column to store criterion reference for default resources load filtering	\N	2.0.5
add-projects_filter_label_id-fk-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.425553+01	448	EXECUTED	3:d4eeb6e123ec468bb3168d7b97184f4b	Add Foreign Key Constraint	Add Foreign Key constraint on label reference	\N	2.0.5
add-resources_load_filter_fk_id-column-to-user_table	ltilve	src/main/resources/db.changelog-1.3.xml	2014-03-20 14:21:56.427712+01	449	EXECUTED	3:ba6c3438f5e60e881e96f7c6b768b1c9	Add Foreign Key Constraint	Add Foreign Key constraint on criterion reference	\N	2.0.5
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY day_assignment (id, day_assignment_type, version, duration, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
26672	generic_day	9	28800	f	2014-11-21	3013	\N	24383	\N
26668	generic_day	9	28800	f	2014-10-31	3013	\N	24383	\N
12240	generic_day	3	28800	f	2014-04-17	2974	\N	6876	\N
12241	generic_day	3	26743	f	2014-04-23	2972	\N	6876	\N
12242	generic_day	3	26743	f	2014-04-18	2972	\N	6876	\N
12243	generic_day	3	26743	f	2014-04-16	2972	\N	6876	\N
12244	generic_day	3	26743	f	2014-04-21	2974	\N	6876	\N
12245	generic_day	3	28800	f	2014-04-22	2974	\N	6876	\N
12246	generic_day	3	26742	f	2014-04-24	2972	\N	6876	\N
12247	generic_day	3	26743	f	2014-04-22	2972	\N	6876	\N
12248	generic_day	3	28800	f	2014-04-24	2974	\N	6876	\N
12249	generic_day	3	26743	f	2014-04-17	2972	\N	6876	\N
12250	generic_day	3	28800	f	2014-04-23	2974	\N	6876	\N
12251	generic_day	3	28800	f	2014-04-18	2974	\N	6876	\N
12252	generic_day	3	28800	f	2014-04-16	2974	\N	6876	\N
26658	generic_day	9	28800	f	2014-10-24	3013	\N	24383	\N
26670	generic_day	9	28800	f	2014-11-20	3013	\N	24383	\N
26674	generic_day	9	28800	f	2014-11-28	3013	\N	24383	\N
26671	generic_day	9	28800	f	2014-11-26	3013	\N	24383	\N
26663	generic_day	9	28800	f	2014-10-27	3013	\N	24383	\N
26665	generic_day	9	14400	f	2014-12-02	3013	\N	24383	\N
26669	generic_day	9	28800	f	2014-12-01	3013	\N	24383	\N
26675	generic_day	9	28800	f	2014-11-27	3013	\N	24383	\N
26676	generic_day	9	28800	f	2014-11-17	3013	\N	24383	\N
26659	generic_day	9	28800	f	2014-10-28	3013	\N	24383	\N
26660	generic_day	9	28800	f	2014-11-12	3013	\N	24383	\N
26666	generic_day	9	28800	f	2014-11-25	3013	\N	24383	\N
26664	generic_day	9	28800	f	2014-11-14	3013	\N	24383	\N
26661	generic_day	9	28800	f	2014-11-05	3013	\N	24383	\N
26662	generic_day	9	28800	f	2014-11-03	3013	\N	24383	\N
26667	generic_day	9	28800	f	2014-11-07	3013	\N	24383	\N
26673	generic_day	9	28800	f	2014-11-11	3013	\N	24383	\N
26840	generic_day	5	17399	f	2014-12-19	2951	\N	24389	\N
26844	generic_day	5	31799	f	2014-12-17	2951	\N	24389	\N
26845	generic_day	5	17400	f	2014-12-12	2951	\N	24389	\N
26839	generic_day	5	17401	f	2014-12-04	2951	\N	24389	\N
26841	generic_day	5	31800	f	2014-12-11	2951	\N	24389	\N
20094	generic_day	5	9600	f	2014-09-03	2958	\N	6895	\N
20059	generic_day	5	28800	f	2014-08-21	2940	\N	6895	\N
20091	generic_day	5	28800	f	2014-08-26	2940	\N	6895	\N
20072	generic_day	5	28800	f	2014-08-19	2940	\N	6895	\N
20076	generic_day	5	9600	f	2014-08-21	2958	\N	6895	\N
20041	generic_day	5	9600	f	2014-08-07	2958	\N	6895	\N
20078	generic_day	5	28800	f	2014-08-04	2940	\N	6895	\N
20088	generic_day	5	28800	f	2014-09-03	2940	\N	6895	\N
20066	generic_day	5	9600	f	2014-08-20	2958	\N	6895	\N
20083	generic_day	5	28800	f	2014-08-11	2940	\N	6895	\N
20093	generic_day	5	9600	f	2014-09-08	2958	\N	6895	\N
20047	generic_day	5	9600	f	2014-08-26	2958	\N	6895	\N
20063	generic_day	5	28800	f	2014-09-04	2940	\N	6895	\N
20058	generic_day	5	28800	f	2014-08-29	2940	\N	6895	\N
26843	generic_day	5	24601	f	2014-12-09	2951	\N	24389	\N
26842	generic_day	5	17401	f	2014-12-03	2951	\N	24389	\N
20087	generic_day	5	28800	f	2014-08-05	2940	\N	6895	\N
20064	generic_day	5	9600	f	2014-09-05	2958	\N	6895	\N
20071	generic_day	5	28800	f	2014-08-07	2940	\N	6895	\N
20061	generic_day	5	28800	f	2014-08-28	2940	\N	6895	\N
20073	generic_day	5	9600	f	2014-09-11	2958	\N	6895	\N
20054	generic_day	5	9600	f	2014-09-10	2958	\N	6895	\N
20048	generic_day	5	9600	f	2014-09-04	2958	\N	6895	\N
20096	generic_day	5	9600	f	2014-08-12	2958	\N	6895	\N
20085	generic_day	5	28800	f	2014-09-09	2940	\N	6895	\N
20075	generic_day	5	28800	f	2014-08-08	2940	\N	6895	\N
20069	generic_day	5	28800	f	2014-08-01	2940	\N	6895	\N
20052	generic_day	5	28800	f	2014-09-11	2940	\N	6895	\N
20050	generic_day	5	9600	f	2014-08-08	2958	\N	6895	\N
20080	generic_day	5	28800	f	2014-08-14	2940	\N	6895	\N
20089	generic_day	5	28800	f	2014-08-13	2940	\N	6895	\N
20062	generic_day	5	28800	f	2014-09-01	2940	\N	6895	\N
20060	generic_day	5	28800	f	2014-08-27	2940	\N	6895	\N
20068	generic_day	5	9600	f	2014-08-27	2958	\N	6895	\N
20040	generic_day	5	9600	f	2014-08-28	2958	\N	6895	\N
20099	generic_day	5	28800	f	2014-08-22	2940	\N	6895	\N
20065	generic_day	5	28800	f	2014-08-15	2940	\N	6895	\N
20057	generic_day	5	9600	f	2014-08-05	2958	\N	6895	\N
20095	generic_day	5	28800	f	2014-08-20	2940	\N	6895	\N
20084	generic_day	5	9600	f	2014-08-14	2958	\N	6895	\N
20055	generic_day	5	9600	f	2014-08-18	2958	\N	6895	\N
20090	generic_day	5	9600	f	2014-08-19	2958	\N	6895	\N
20092	generic_day	5	9600	f	2014-08-29	2958	\N	6895	\N
20046	generic_day	5	9600	f	2014-09-02	2958	\N	6895	\N
20097	generic_day	5	28800	f	2014-08-25	2940	\N	6895	\N
20045	generic_day	5	9600	f	2014-08-04	2958	\N	6895	\N
20051	generic_day	5	9600	f	2014-09-01	2958	\N	6895	\N
20056	generic_day	5	9600	f	2014-08-22	2958	\N	6895	\N
20081	generic_day	5	9600	f	2014-08-11	2958	\N	6895	\N
20070	generic_day	5	9600	f	2014-08-01	2958	\N	6895	\N
20049	generic_day	5	9600	f	2014-08-15	2958	\N	6895	\N
20044	generic_day	5	9600	f	2014-08-06	2958	\N	6895	\N
20077	generic_day	5	28800	f	2014-08-06	2940	\N	6895	\N
20079	generic_day	5	9600	f	2014-09-09	2958	\N	6895	\N
20098	generic_day	5	28800	f	2014-08-18	2940	\N	6895	\N
20053	generic_day	5	9600	f	2014-08-13	2958	\N	6895	\N
20074	generic_day	5	28800	f	2014-08-12	2940	\N	6895	\N
20082	generic_day	5	28800	f	2014-09-08	2940	\N	6895	\N
20086	generic_day	5	28800	f	2014-09-05	2940	\N	6895	\N
20042	generic_day	5	28800	f	2014-09-10	2940	\N	6895	\N
20043	generic_day	5	28800	f	2014-09-02	2940	\N	6895	\N
20067	generic_day	5	9600	f	2014-08-25	2958	\N	6895	\N
20038	generic_day	5	19200	f	2014-08-29	2946	\N	6906	\N
20036	generic_day	5	19200	f	2014-09-01	2946	\N	6906	\N
20039	generic_day	5	19200	f	2014-08-01	2946	\N	6906	\N
20037	generic_day	5	19200	f	2014-08-22	2946	\N	6906	\N
25538	specific_day	4	7200	f	2014-10-15	2995	12805	\N	\N
25530	specific_day	4	7200	f	2014-10-28	2995	12805	\N	\N
25532	specific_day	4	7200	f	2014-10-21	2995	12805	\N	\N
25539	specific_day	4	7200	f	2014-11-04	2995	12805	\N	\N
25547	specific_day	4	7200	f	2014-10-16	2995	12805	\N	\N
25541	specific_day	4	7200	f	2014-10-17	2995	12805	\N	\N
25544	specific_day	4	7200	f	2014-11-06	2995	12805	\N	\N
25546	specific_day	4	7200	f	2014-10-31	2995	12805	\N	\N
25529	specific_day	4	7200	f	2014-10-29	2995	12805	\N	\N
25534	specific_day	4	7200	f	2014-10-13	2995	12805	\N	\N
25540	specific_day	4	7200	f	2014-10-27	2995	12805	\N	\N
25535	specific_day	4	7200	f	2014-10-23	2995	12805	\N	\N
25537	specific_day	4	7200	f	2014-10-14	2995	12805	\N	\N
20722	generic_day	10	28800	f	2014-11-20	2944	\N	6907	\N
20726	generic_day	10	28800	f	2014-11-21	2944	\N	6907	\N
20711	generic_day	10	28800	f	2014-11-17	2944	\N	6907	\N
20717	generic_day	10	28800	f	2014-11-27	2944	\N	6907	\N
20713	generic_day	10	28800	f	2014-11-14	2944	\N	6907	\N
20712	generic_day	10	28800	f	2014-11-18	2944	\N	6907	\N
20724	generic_day	10	28800	f	2014-10-30	2944	\N	6907	\N
20715	generic_day	10	28800	f	2014-10-28	2944	\N	6907	\N
20723	generic_day	10	28800	f	2014-10-27	2944	\N	6907	\N
20729	generic_day	10	28800	f	2014-10-29	2944	\N	6907	\N
20721	generic_day	10	28800	f	2014-11-26	2944	\N	6907	\N
20716	generic_day	10	28800	f	2014-11-10	2944	\N	6907	\N
24172	specific_day	16	0	f	2014-08-24	2951	12791	\N	\N
24191	specific_day	16	7200	f	2014-10-31	2951	12791	\N	\N
24169	specific_day	16	0	f	2014-09-20	2951	12791	\N	\N
24188	specific_day	16	14400	f	2014-11-06	2951	12791	\N	\N
24186	specific_day	16	7200	f	2014-08-08	2951	12791	\N	\N
24167	specific_day	16	0	f	2014-12-07	2951	12791	\N	\N
24187	specific_day	16	0	f	2014-08-15	2951	12791	\N	\N
24171	specific_day	16	7200	f	2014-11-07	2951	12791	\N	\N
24192	specific_day	16	14400	f	2014-09-16	2951	12791	\N	\N
24173	specific_day	16	0	f	2014-11-08	2951	12791	\N	\N
24185	specific_day	16	0	f	2014-08-03	2951	12791	\N	\N
24165	specific_day	16	7200	f	2014-10-17	2951	12791	\N	\N
24166	specific_day	16	0	f	2014-12-05	2951	12791	\N	\N
24195	specific_day	16	14400	f	2014-10-22	2951	12791	\N	\N
24170	specific_day	16	14400	f	2014-11-20	2951	12791	\N	\N
24190	specific_day	16	0	f	2014-09-14	2951	12791	\N	\N
24194	specific_day	16	0	f	2014-10-05	2951	12791	\N	\N
24164	specific_day	16	14400	f	2014-10-20	2951	12791	\N	\N
24196	specific_day	16	7200	f	2014-09-05	2951	12791	\N	\N
24168	specific_day	16	14400	f	2014-08-04	2951	12791	\N	\N
24189	specific_day	16	14400	f	2014-10-01	2951	12791	\N	\N
24193	specific_day	16	14400	f	2014-08-18	2951	12791	\N	\N
23369	generic_day	4	28802	f	2014-08-06	2946	\N	6955	\N
23374	generic_day	4	28799	f	2014-08-26	2946	\N	6955	\N
23370	generic_day	4	28799	f	2014-08-22	2946	\N	6955	\N
23368	generic_day	4	28802	f	2014-08-04	2946	\N	6955	\N
23371	generic_day	4	28800	f	2014-08-11	2946	\N	6955	\N
23375	generic_day	4	28799	f	2014-08-27	2946	\N	6955	\N
23372	generic_day	4	28802	f	2014-08-08	2946	\N	6955	\N
23373	generic_day	4	28799	f	2014-08-21	2946	\N	6955	\N
24206	specific_day	16	7200	f	2014-08-01	2951	12791	\N	\N
24207	specific_day	16	14400	f	2014-10-27	2951	12791	\N	\N
24255	specific_day	16	14400	f	2014-10-09	2951	12791	\N	\N
24257	specific_day	16	0	f	2014-10-18	2951	12791	\N	\N
24244	specific_day	16	14400	f	2014-08-26	2951	12791	\N	\N
24246	specific_day	16	14400	f	2014-08-25	2951	12791	\N	\N
24240	specific_day	16	14400	f	2014-09-22	2951	12791	\N	\N
24256	specific_day	16	14400	f	2014-11-13	2951	12791	\N	\N
24208	specific_day	16	0	f	2014-10-11	2951	12791	\N	\N
24253	specific_day	16	0	f	2014-11-30	2951	12791	\N	\N
24247	specific_day	16	7200	f	2014-11-14	2951	12791	\N	\N
24209	specific_day	16	0	f	2014-09-28	2951	12791	\N	\N
24245	specific_day	16	0	f	2014-10-26	2951	12791	\N	\N
24239	specific_day	16	0	f	2014-11-16	2951	12791	\N	\N
24241	specific_day	16	14400	f	2014-08-11	2951	12791	\N	\N
24254	specific_day	16	0	f	2014-11-15	2951	12791	\N	\N
24243	specific_day	16	0	f	2014-11-02	2951	12791	\N	\N
24242	specific_day	16	14400	f	2014-11-25	2951	12791	\N	\N
24205	specific_day	16	14400	f	2014-09-02	2951	12791	\N	\N
24204	specific_day	16	14400	f	2014-09-25	2951	12791	\N	\N
23380	generic_day	4	28799	f	2014-08-15	2946	\N	6955	\N
23377	generic_day	4	28799	f	2014-08-19	2946	\N	6955	\N
23381	generic_day	4	28800	f	2014-08-12	2946	\N	6955	\N
23384	generic_day	4	28799	f	2014-08-28	2946	\N	6955	\N
23386	generic_day	4	28799	f	2014-08-18	2946	\N	6955	\N
23382	generic_day	4	28799	f	2014-08-20	2946	\N	6955	\N
23376	generic_day	4	28799	f	2014-08-13	2946	\N	6955	\N
23379	generic_day	4	28802	f	2014-08-05	2946	\N	6955	\N
23387	generic_day	4	28799	f	2014-08-25	2946	\N	6955	\N
23385	generic_day	4	28802	f	2014-08-07	2946	\N	6955	\N
23383	generic_day	4	28802	f	2014-08-01	2946	\N	6955	\N
23378	generic_day	4	28799	f	2014-08-14	2946	\N	6955	\N
23402	generic_day	4	4800	f	2014-09-01	2940	\N	6956	\N
23394	generic_day	4	4800	f	2014-09-05	2940	\N	6956	\N
23390	generic_day	4	24000	f	2014-09-05	2958	\N	6956	\N
23396	generic_day	4	24000	f	2014-09-02	2958	\N	6956	\N
23400	generic_day	4	4800	f	2014-09-04	2940	\N	6956	\N
23389	generic_day	4	24000	f	2014-09-03	2958	\N	6956	\N
23392	generic_day	4	24000	f	2014-09-09	2958	\N	6956	\N
23404	generic_day	4	4800	f	2014-09-08	2940	\N	6956	\N
23395	generic_day	4	23999	f	2014-09-10	2958	\N	6956	\N
23393	generic_day	4	4800	f	2014-09-11	2940	\N	6956	\N
23399	generic_day	4	24001	f	2014-08-29	2958	\N	6956	\N
23407	generic_day	4	24000	f	2014-09-01	2958	\N	6956	\N
23405	generic_day	4	4800	f	2014-09-09	2940	\N	6956	\N
23391	generic_day	4	4800	f	2014-09-02	2940	\N	6956	\N
23401	generic_day	4	4800	f	2014-09-10	2940	\N	6956	\N
23388	generic_day	4	24000	f	2014-09-04	2958	\N	6956	\N
23406	generic_day	4	4801	f	2014-08-29	2940	\N	6956	\N
23398	generic_day	4	4800	f	2014-09-03	2940	\N	6956	\N
23397	generic_day	4	24000	f	2014-09-08	2958	\N	6956	\N
23403	generic_day	4	23999	f	2014-09-11	2958	\N	6956	\N
24174	specific_day	16	14400	f	2014-09-17	2951	12791	\N	\N
24176	specific_day	16	14400	f	2014-09-23	2951	12791	\N	\N
24178	specific_day	16	14400	f	2014-11-12	2951	12791	\N	\N
24180	specific_day	16	14400	f	2014-09-11	2951	12791	\N	\N
24181	specific_day	16	14400	f	2014-09-18	2951	12791	\N	\N
24182	specific_day	16	14400	f	2014-11-18	2951	12791	\N	\N
24183	specific_day	16	0	f	2014-11-01	2951	12791	\N	\N
24175	specific_day	16	0	f	2014-08-10	2951	12791	\N	\N
24177	specific_day	16	14400	f	2014-11-27	2951	12791	\N	\N
24179	specific_day	16	14400	f	2014-11-04	2951	12791	\N	\N
24184	specific_day	16	0	f	2014-08-30	2951	12791	\N	\N
24228	specific_day	16	14400	f	2014-10-15	2951	12791	\N	\N
24223	specific_day	16	14400	f	2014-08-28	2951	12791	\N	\N
24226	specific_day	16	0	f	2014-08-17	2951	12791	\N	\N
24267	specific_day	16	0	f	2014-08-31	2951	12791	\N	\N
24230	specific_day	16	7200	f	2014-09-26	2951	12791	\N	\N
24234	specific_day	16	14400	f	2014-11-11	2951	12791	\N	\N
24224	specific_day	16	7200	f	2014-11-28	2951	12791	\N	\N
24229	specific_day	16	0	f	2014-10-12	2951	12791	\N	\N
24197	specific_day	16	14400	f	2014-12-02	2951	12791	\N	\N
24231	specific_day	16	0	f	2014-11-09	2951	12791	\N	\N
24211	specific_day	16	0	f	2014-12-08	2951	12791	\N	\N
24214	specific_day	16	0	f	2014-09-06	2951	12791	\N	\N
24213	specific_day	16	14400	f	2014-09-04	2951	12791	\N	\N
24212	specific_day	16	7200	f	2014-09-12	2951	12791	\N	\N
24266	specific_day	16	14400	f	2014-10-21	2951	12791	\N	\N
24225	specific_day	16	14400	f	2014-11-03	2951	12791	\N	\N
24210	specific_day	16	14400	f	2014-10-08	2951	12791	\N	\N
24227	specific_day	16	14400	f	2014-09-24	2951	12791	\N	\N
24269	specific_day	16	7200	f	2014-08-29	2951	12791	\N	\N
24232	specific_day	16	7200	f	2014-12-09	2951	12791	\N	\N
24268	specific_day	16	0	f	2014-12-06	2951	12791	\N	\N
24233	specific_day	16	0	f	2014-09-27	2951	12791	\N	\N
24215	specific_day	16	14400	f	2014-09-30	2951	12791	\N	\N
16429	generic_day	8	8641	f	2014-09-12	2972	\N	6882	\N
16456	specific_day	8	21600	f	2014-09-29	2974	12739	\N	\N
16452	specific_day	8	21600	f	2014-10-17	2974	12739	\N	\N
16443	specific_day	8	21600	f	2014-10-03	2974	12739	\N	\N
16441	specific_day	8	21600	f	2014-10-14	2974	12739	\N	\N
16446	specific_day	8	21600	f	2014-10-08	2974	12739	\N	\N
16448	specific_day	8	21600	f	2014-10-06	2974	12739	\N	\N
16440	specific_day	8	21600	f	2014-09-30	2974	12739	\N	\N
16449	specific_day	8	21600	f	2014-10-21	2974	12739	\N	\N
16445	specific_day	8	21600	f	2014-10-02	2974	12739	\N	\N
16453	specific_day	8	21600	f	2014-09-26	2974	12739	\N	\N
16447	specific_day	8	21600	f	2014-10-10	2974	12739	\N	\N
16451	specific_day	8	21600	f	2014-10-22	2974	12739	\N	\N
16454	specific_day	8	21600	f	2014-10-07	2974	12739	\N	\N
16439	specific_day	8	21600	f	2014-10-16	2974	12739	\N	\N
16444	specific_day	8	21600	f	2014-10-15	2974	12739	\N	\N
16455	specific_day	8	21600	f	2014-10-20	2974	12739	\N	\N
25682	generic_day	12	17280	f	2014-09-12	3009	\N	24367	\N
25683	generic_day	12	17280	f	2014-09-24	3009	\N	24367	\N
20013	generic_day	5	19200	f	2014-08-05	2946	\N	6906	\N
20016	generic_day	5	19200	f	2014-08-06	2946	\N	6906	\N
20031	generic_day	5	19200	f	2014-08-18	2946	\N	6906	\N
20015	generic_day	5	19200	f	2014-08-07	2946	\N	6906	\N
20019	generic_day	5	19200	f	2014-08-26	2946	\N	6906	\N
20029	generic_day	5	19200	f	2014-08-08	2946	\N	6906	\N
20025	generic_day	5	19200	f	2014-08-13	2946	\N	6906	\N
20033	generic_day	5	19200	f	2014-09-02	2946	\N	6906	\N
20022	generic_day	5	19200	f	2014-08-27	2946	\N	6906	\N
20027	generic_day	5	19200	f	2014-08-04	2946	\N	6906	\N
20011	generic_day	5	19200	f	2014-09-04	2946	\N	6906	\N
20010	generic_day	5	19200	f	2014-08-28	2946	\N	6906	\N
20018	generic_day	5	19200	f	2014-09-05	2946	\N	6906	\N
20034	generic_day	5	19200	f	2014-08-11	2946	\N	6906	\N
20017	generic_day	5	19200	f	2014-08-20	2946	\N	6906	\N
20024	generic_day	5	19200	f	2014-09-03	2946	\N	6906	\N
20030	generic_day	5	19200	f	2014-08-12	2946	\N	6906	\N
20032	generic_day	5	19200	f	2014-08-19	2946	\N	6906	\N
20026	generic_day	5	19200	f	2014-09-11	2946	\N	6906	\N
20035	generic_day	5	19200	f	2014-08-25	2946	\N	6906	\N
20023	generic_day	5	19200	f	2014-09-10	2946	\N	6906	\N
20014	generic_day	5	19200	f	2014-09-09	2946	\N	6906	\N
20021	generic_day	5	19200	f	2014-08-15	2946	\N	6906	\N
20028	generic_day	5	19200	f	2014-08-14	2946	\N	6906	\N
20012	generic_day	5	19200	f	2014-09-08	2946	\N	6906	\N
20020	generic_day	5	19200	f	2014-08-21	2946	\N	6906	\N
24150	specific_day	16	0	f	2014-10-25	2951	12791	\N	\N
24159	specific_day	16	7200	f	2014-10-03	2951	12791	\N	\N
24145	specific_day	16	14400	f	2014-08-14	2951	12791	\N	\N
26735	generic_day	3	28801	f	2014-09-03	2940	\N	24385	\N
26736	generic_day	3	28801	f	2014-09-01	2940	\N	24385	\N
26737	generic_day	3	28799	f	2014-09-11	2940	\N	24385	\N
26738	generic_day	3	28801	f	2014-09-02	2940	\N	24385	\N
26739	generic_day	3	28800	f	2014-09-05	2940	\N	24385	\N
26740	generic_day	3	28801	f	2014-08-29	2940	\N	24385	\N
26741	generic_day	3	28799	f	2014-09-10	2940	\N	24385	\N
26742	generic_day	3	28799	f	2014-09-08	2940	\N	24385	\N
26743	generic_day	3	28799	f	2014-09-09	2940	\N	24385	\N
26744	generic_day	3	28800	f	2014-09-04	2940	\N	24385	\N
26745	specific_day	3	21600	f	2014-09-19	2946	12820	\N	\N
26746	specific_day	3	21600	f	2014-09-10	2946	12820	\N	\N
26747	specific_day	3	21600	f	2014-08-29	2946	12820	\N	\N
26748	specific_day	3	21600	f	2014-09-15	2946	12820	\N	\N
26749	specific_day	3	21600	f	2014-09-02	2946	12820	\N	\N
26750	specific_day	3	21600	f	2014-09-05	2946	12820	\N	\N
26751	specific_day	3	21600	f	2014-09-17	2946	12820	\N	\N
26752	specific_day	3	21600	f	2014-09-04	2946	12820	\N	\N
26753	specific_day	3	21600	f	2014-09-24	2946	12820	\N	\N
26754	specific_day	3	21600	f	2014-09-18	2946	12820	\N	\N
26755	specific_day	3	21600	f	2014-09-11	2946	12820	\N	\N
24156	specific_day	16	0	f	2014-08-09	2951	12791	\N	\N
24151	specific_day	16	14400	f	2014-09-08	2951	12791	\N	\N
24157	specific_day	16	0	f	2014-09-07	2951	12791	\N	\N
24146	specific_day	16	7200	f	2014-11-21	2951	12791	\N	\N
24161	specific_day	16	0	f	2014-08-23	2951	12791	\N	\N
24148	specific_day	16	14400	f	2014-11-26	2951	12791	\N	\N
24158	specific_day	16	14400	f	2014-11-19	2951	12791	\N	\N
24149	specific_day	16	14400	f	2014-08-05	2951	12791	\N	\N
24147	specific_day	16	0	f	2014-09-13	2951	12791	\N	\N
24153	specific_day	16	14400	f	2014-10-06	2951	12791	\N	\N
24163	specific_day	16	14400	f	2014-08-07	2951	12791	\N	\N
24154	specific_day	16	7200	f	2014-10-10	2951	12791	\N	\N
24155	specific_day	16	14400	f	2014-10-29	2951	12791	\N	\N
24162	specific_day	16	14400	f	2014-08-21	2951	12791	\N	\N
24152	specific_day	16	0	f	2014-08-02	2951	12791	\N	\N
24160	specific_day	16	0	f	2014-10-19	2951	12791	\N	\N
26756	specific_day	3	21600	f	2014-09-03	2946	12820	\N	\N
26757	specific_day	3	21600	f	2014-09-09	2946	12820	\N	\N
26758	specific_day	3	21600	f	2014-09-12	2946	12820	\N	\N
26759	specific_day	3	21600	f	2014-09-01	2946	12820	\N	\N
26760	specific_day	3	21600	f	2014-09-23	2946	12820	\N	\N
26761	specific_day	3	21600	f	2014-09-08	2946	12820	\N	\N
26762	specific_day	3	21600	f	2014-09-22	2946	12820	\N	\N
26763	specific_day	3	21600	f	2014-09-25	2946	12820	\N	\N
26764	specific_day	3	21600	f	2014-09-16	2946	12820	\N	\N
26765	specific_day	3	7200	f	2014-09-05	2958	12821	\N	\N
26766	specific_day	3	7200	f	2014-09-16	2958	12821	\N	\N
26767	specific_day	3	7200	f	2014-09-10	2958	12821	\N	\N
26768	specific_day	3	7200	f	2014-09-24	2958	12821	\N	\N
26769	specific_day	3	7200	f	2014-09-02	2958	12821	\N	\N
26770	specific_day	3	7200	f	2014-09-23	2958	12821	\N	\N
26771	specific_day	3	7200	f	2014-09-15	2958	12821	\N	\N
26772	specific_day	3	7200	f	2014-09-22	2958	12821	\N	\N
26773	specific_day	3	7200	f	2014-09-17	2958	12821	\N	\N
26774	specific_day	3	7200	f	2014-09-11	2958	12821	\N	\N
26775	specific_day	3	7200	f	2014-09-12	2958	12821	\N	\N
26776	specific_day	3	7200	f	2014-09-04	2958	12821	\N	\N
26777	specific_day	3	7200	f	2014-09-01	2958	12821	\N	\N
26778	specific_day	3	7200	f	2014-09-08	2958	12821	\N	\N
26779	specific_day	3	7200	f	2014-09-25	2958	12821	\N	\N
26780	specific_day	3	7200	f	2014-09-03	2958	12821	\N	\N
26781	specific_day	3	7200	f	2014-08-29	2958	12821	\N	\N
26782	specific_day	3	7200	f	2014-09-19	2958	12821	\N	\N
26783	specific_day	3	7200	f	2014-09-09	2958	12821	\N	\N
26784	specific_day	3	7200	f	2014-09-18	2958	12821	\N	\N
21868	generic_day	8	28800	f	2014-10-03	2982	\N	6923	\N
21855	generic_day	8	28800	f	2014-09-30	2982	\N	6923	\N
21861	generic_day	8	28800	f	2014-10-08	2982	\N	6923	\N
24455	specific_day	8	7200	f	2014-10-29	2982	12792	\N	\N
24457	specific_day	8	7200	f	2014-10-23	2982	12792	\N	\N
24454	specific_day	8	7200	f	2014-10-28	2982	12792	\N	\N
24456	specific_day	8	7200	f	2014-10-17	2982	12792	\N	\N
24248	specific_day	16	14400	f	2014-11-10	2951	12791	\N	\N
24249	specific_day	16	14400	f	2014-08-13	2951	12791	\N	\N
24251	specific_day	16	14400	f	2014-12-03	2951	12791	\N	\N
24287	generic_day	16	19862	f	2014-09-09	3007	\N	6967	\N
24283	generic_day	16	19862	f	2014-09-10	3007	\N	6967	\N
24281	generic_day	16	19862	f	2014-09-02	3007	\N	6967	\N
24289	generic_day	16	19862	f	2014-08-29	3007	\N	6967	\N
24277	generic_day	16	19862	f	2014-08-26	3007	\N	6967	\N
24282	generic_day	16	19863	f	2014-08-04	3007	\N	6967	\N
24280	generic_day	16	19863	f	2014-08-01	3007	\N	6967	\N
24252	specific_day	16	14400	f	2014-08-20	2951	12791	\N	\N
24250	specific_day	16	14400	f	2014-09-03	2951	12791	\N	\N
24286	generic_day	16	19862	f	2014-08-08	3007	\N	6967	\N
24279	generic_day	16	19862	f	2014-08-07	3007	\N	6967	\N
24288	generic_day	16	19862	f	2014-08-06	3007	\N	6967	\N
24285	generic_day	16	19862	f	2014-08-11	3007	\N	6967	\N
24278	generic_day	16	19862	f	2014-08-21	3007	\N	6967	\N
24284	generic_day	16	19862	f	2014-09-08	3007	\N	6967	\N
21830	generic_day	8	19862	f	2014-08-05	2978	\N	6921	\N
21828	generic_day	8	19862	f	2014-08-27	2978	\N	6921	\N
21814	generic_day	8	19862	f	2014-08-20	2978	\N	6921	\N
21833	generic_day	8	19862	f	2014-08-12	2978	\N	6921	\N
21829	generic_day	8	19862	f	2014-09-03	2978	\N	6921	\N
21819	generic_day	8	19862	f	2014-09-05	2978	\N	6921	\N
21817	generic_day	8	19862	f	2014-08-18	2978	\N	6921	\N
21823	generic_day	8	19862	f	2014-09-09	2978	\N	6921	\N
21832	generic_day	8	19862	f	2014-09-08	2978	\N	6921	\N
21824	generic_day	8	19862	f	2014-08-08	2978	\N	6921	\N
21820	generic_day	8	19862	f	2014-08-14	2978	\N	6921	\N
21811	generic_day	8	19863	f	2014-08-01	2978	\N	6921	\N
21821	generic_day	8	19862	f	2014-09-01	2978	\N	6921	\N
21835	generic_day	8	19862	f	2014-08-21	2978	\N	6921	\N
21812	generic_day	8	19862	f	2014-08-25	2978	\N	6921	\N
21825	generic_day	8	19862	f	2014-08-07	2978	\N	6921	\N
21810	generic_day	8	19862	f	2014-08-06	2978	\N	6921	\N
21838	generic_day	8	19862	f	2014-08-22	2978	\N	6921	\N
21815	generic_day	8	19863	f	2014-08-04	2978	\N	6921	\N
24469	specific_day	8	21600	f	2014-10-31	2984	12793	\N	\N
24468	specific_day	8	21600	f	2014-11-05	2984	12793	\N	\N
24459	specific_day	8	21600	f	2014-10-20	2984	12793	\N	\N
24466	specific_day	8	21600	f	2014-10-30	2984	12793	\N	\N
24458	specific_day	8	21600	f	2014-10-24	2984	12793	\N	\N
24463	specific_day	8	21600	f	2014-11-06	2984	12793	\N	\N
24471	specific_day	8	21600	f	2014-10-21	2984	12793	\N	\N
24462	specific_day	8	21600	f	2014-11-04	2984	12793	\N	\N
24461	specific_day	8	21600	f	2014-10-14	2984	12793	\N	\N
24464	specific_day	8	21600	f	2014-10-29	2984	12793	\N	\N
24473	specific_day	8	21600	f	2014-10-22	2984	12793	\N	\N
24472	specific_day	8	21600	f	2014-10-16	2984	12793	\N	\N
24476	specific_day	8	21600	f	2014-10-27	2984	12793	\N	\N
24474	specific_day	8	21600	f	2014-10-28	2984	12793	\N	\N
24460	specific_day	8	21600	f	2014-10-17	2984	12793	\N	\N
24467	specific_day	8	21600	f	2014-10-15	2984	12793	\N	\N
24470	specific_day	8	21600	f	2014-11-03	2984	12793	\N	\N
24475	specific_day	8	21600	f	2014-10-10	2984	12793	\N	\N
24465	specific_day	8	21600	f	2014-10-23	2984	12793	\N	\N
24484	generic_day	8	28800	f	2014-11-12	2986	\N	24342	\N
24494	generic_day	8	28800	f	2014-11-24	2986	\N	24342	\N
20731	generic_day	10	28800	f	2014-11-05	2944	\N	6907	\N
20732	generic_day	10	28800	f	2014-11-28	2944	\N	6907	\N
20733	generic_day	10	28800	f	2014-11-25	2944	\N	6907	\N
20728	generic_day	10	28800	f	2014-11-06	2944	\N	6907	\N
20725	generic_day	10	28800	f	2014-10-24	2944	\N	6907	\N
20727	generic_day	10	28800	f	2014-12-01	2944	\N	6907	\N
24493	generic_day	8	28800	f	2014-11-14	2986	\N	24342	\N
24501	generic_day	8	28800	f	2014-11-10	2986	\N	24342	\N
24482	generic_day	8	14400	f	2014-12-18	2986	\N	24342	\N
24490	generic_day	8	28800	f	2014-12-10	2986	\N	24342	\N
24496	generic_day	8	28800	f	2014-12-15	2986	\N	24342	\N
24477	generic_day	8	28800	f	2014-12-03	2986	\N	24342	\N
24478	generic_day	8	28800	f	2014-11-18	2986	\N	24342	\N
24483	generic_day	8	28800	f	2014-12-16	2986	\N	24342	\N
24499	generic_day	8	28800	f	2014-12-04	2986	\N	24342	\N
24481	generic_day	8	28800	f	2014-12-17	2986	\N	24342	\N
24489	generic_day	8	28800	f	2014-11-17	2986	\N	24342	\N
24502	generic_day	8	28800	f	2014-11-25	2986	\N	24342	\N
24479	generic_day	8	28800	f	2014-11-20	2986	\N	24342	\N
24487	generic_day	8	28800	f	2014-11-27	2986	\N	24342	\N
24504	generic_day	8	28800	f	2014-11-07	2986	\N	24342	\N
24500	generic_day	8	28800	f	2014-12-12	2986	\N	24342	\N
24492	generic_day	8	28800	f	2014-11-11	2986	\N	24342	\N
24491	generic_day	8	28800	f	2014-11-19	2986	\N	24342	\N
24497	generic_day	8	28800	f	2014-11-13	2986	\N	24342	\N
24486	generic_day	8	28800	f	2014-11-21	2986	\N	24342	\N
24495	generic_day	8	28800	f	2014-12-01	2986	\N	24342	\N
24498	generic_day	8	28800	f	2014-12-11	2986	\N	24342	\N
24480	generic_day	8	28800	f	2014-12-02	2986	\N	24342	\N
24485	generic_day	8	28800	f	2014-11-28	2986	\N	24342	\N
24503	generic_day	8	28800	f	2014-12-09	2986	\N	24342	\N
24488	generic_day	8	28800	f	2014-11-26	2986	\N	24342	\N
25417	specific_day	6	14400	f	2014-12-30	2982	12802	\N	\N
25416	specific_day	6	14400	f	2014-12-22	2982	12802	\N	\N
25412	specific_day	6	14400	f	2014-12-19	2982	12802	\N	\N
25411	specific_day	6	14400	f	2014-12-23	2982	12802	\N	\N
25410	specific_day	6	14400	f	2015-01-01	2982	12802	\N	\N
25413	specific_day	6	14400	f	2015-01-02	2982	12802	\N	\N
25418	specific_day	6	14400	f	2014-12-24	2982	12802	\N	\N
25414	specific_day	6	14400	f	2015-01-05	2982	12802	\N	\N
25415	specific_day	6	14400	f	2014-12-29	2982	12802	\N	\N
25409	specific_day	6	14400	f	2014-12-26	2982	12802	\N	\N
25441	generic_day	6	26400	f	2015-01-02	2978	\N	24360	\N
25432	generic_day	6	26400	f	2014-12-26	2978	\N	24360	\N
25442	generic_day	6	26400	f	2014-12-23	2978	\N	24360	\N
25437	generic_day	6	26400	f	2015-01-05	2978	\N	24360	\N
25433	generic_day	6	26400	f	2014-12-19	2978	\N	24360	\N
25431	generic_day	6	26400	f	2014-12-24	2978	\N	24360	\N
25438	generic_day	6	26400	f	2014-12-22	2978	\N	24360	\N
25436	generic_day	6	26400	f	2014-12-29	2978	\N	24360	\N
25435	generic_day	6	26400	f	2015-01-01	2978	\N	24360	\N
25439	generic_day	6	12000	f	2015-01-06	2978	\N	24360	\N
25440	generic_day	6	12000	f	2014-12-18	2978	\N	24360	\N
25434	generic_day	6	26400	f	2014-12-30	2978	\N	24360	\N
25430	generic_day	6	30000	f	2015-01-05	2969	\N	24359	\N
25419	generic_day	6	15600	f	2014-12-18	2969	\N	24359	\N
25427	generic_day	6	15600	f	2014-12-26	2969	\N	24359	\N
25421	generic_day	6	15600	f	2014-12-19	2969	\N	24359	\N
25424	generic_day	6	15600	f	2015-01-02	2969	\N	24359	\N
25422	generic_day	6	30000	f	2014-12-22	2969	\N	24359	\N
25423	generic_day	6	30000	f	2014-12-24	2969	\N	24359	\N
25428	generic_day	6	30000	f	2014-12-29	2969	\N	24359	\N
25426	generic_day	6	30000	f	2014-12-23	2969	\N	24359	\N
25425	generic_day	6	30000	f	2014-12-30	2969	\N	24359	\N
25420	generic_day	6	15600	f	2015-01-06	2969	\N	24359	\N
25429	generic_day	6	30000	f	2015-01-01	2969	\N	24359	\N
24141	specific_day	16	0	f	2014-10-04	2951	12791	\N	\N
24143	specific_day	16	0	f	2014-11-29	2951	12791	\N	\N
24140	specific_day	16	14400	f	2014-10-02	2951	12791	\N	\N
24144	specific_day	16	14400	f	2014-09-09	2951	12791	\N	\N
24142	specific_day	16	7200	f	2014-09-19	2951	12791	\N	\N
26609	generic_day	9	8639	f	2014-09-24	3011	\N	24363	\N
26610	generic_day	9	28801	f	2014-09-16	3009	\N	24363	\N
26612	generic_day	9	28799	f	2014-09-22	3009	\N	24363	\N
26611	generic_day	9	28801	f	2014-09-15	3009	\N	24363	\N
26615	generic_day	9	28801	f	2014-09-17	3009	\N	24363	\N
26613	generic_day	9	20160	f	2014-09-12	3009	\N	24363	\N
26614	generic_day	9	20159	f	2014-09-23	3009	\N	24363	\N
26644	specific_day	9	21600	f	2014-10-16	3011	12812	\N	\N
26649	specific_day	9	21600	f	2014-10-17	3011	12812	\N	\N
26639	specific_day	9	21600	f	2014-10-08	3011	12812	\N	\N
26643	specific_day	9	21600	f	2014-10-21	3011	12812	\N	\N
26646	specific_day	9	21600	f	2014-09-30	3011	12812	\N	\N
26641	specific_day	9	21600	f	2014-10-02	3011	12812	\N	\N
26642	specific_day	9	21600	f	2014-10-01	3011	12812	\N	\N
26648	specific_day	9	21600	f	2014-10-06	3011	12812	\N	\N
26645	specific_day	9	21600	f	2014-09-26	3011	12812	\N	\N
26640	specific_day	9	21600	f	2014-10-23	3011	12812	\N	\N
26647	specific_day	9	21600	f	2014-10-15	3011	12812	\N	\N
26638	specific_day	9	7200	f	2014-10-17	3009	12811	\N	\N
26637	specific_day	9	7200	f	2014-09-30	3009	12811	\N	\N
26636	specific_day	9	7200	f	2014-10-16	3009	12811	\N	\N
20707	generic_day	10	28800	f	2014-11-03	2944	\N	6907	\N
20706	generic_day	10	28800	f	2014-11-12	2944	\N	6907	\N
20720	generic_day	10	28800	f	2014-11-13	2944	\N	6907	\N
20710	generic_day	10	28800	f	2014-10-31	2944	\N	6907	\N
20708	generic_day	10	28800	f	2014-11-19	2944	\N	6907	\N
20714	generic_day	10	28800	f	2014-11-07	2944	\N	6907	\N
20709	generic_day	10	14400	f	2014-12-02	2944	\N	6907	\N
20730	generic_day	10	28800	f	2014-11-11	2944	\N	6907	\N
24217	specific_day	16	14400	f	2014-09-01	2951	12791	\N	\N
24222	specific_day	16	7200	f	2014-08-22	2951	12791	\N	\N
24220	specific_day	16	14400	f	2014-08-06	2951	12791	\N	\N
24218	specific_day	16	7200	f	2014-10-24	2951	12791	\N	\N
24216	specific_day	16	14400	f	2014-10-30	2951	12791	\N	\N
24221	specific_day	16	14400	f	2014-10-14	2951	12791	\N	\N
24219	specific_day	16	0	f	2014-11-23	2951	12791	\N	\N
25515	generic_day	4	576000	f	2014-08-01	2989	\N	24364	\N
25516	generic_day	4	71999	f	2014-09-25	2997	\N	24365	\N
25519	generic_day	4	72000	f	2014-09-23	2997	\N	24365	\N
25518	generic_day	4	72002	f	2014-09-12	2997	\N	24365	\N
25517	generic_day	4	71999	f	2014-09-24	2997	\N	24365	\N
25526	generic_day	4	32000	f	2014-09-30	2997	\N	24366	\N
25524	generic_day	4	32000	f	2014-10-02	2997	\N	24366	\N
25550	specific_day	4	21600	f	2014-11-03	3003	12806	\N	\N
25552	specific_day	4	21600	f	2014-10-13	3003	12806	\N	\N
25656	specific_day	4	21600	f	2014-11-04	3003	12806	\N	\N
25657	specific_day	4	21600	f	2014-10-24	3003	12806	\N	\N
25658	specific_day	4	21600	f	2014-10-27	3003	12806	\N	\N
25655	specific_day	4	21600	f	2014-11-05	3003	12806	\N	\N
25551	specific_day	4	21600	f	2014-10-14	3003	12806	\N	\N
25523	generic_day	4	32001	f	2014-09-29	2997	\N	24366	\N
25522	generic_day	4	32000	f	2014-10-03	2997	\N	24366	\N
25525	generic_day	4	31999	f	2014-10-07	2997	\N	24366	\N
25521	generic_day	4	32002	f	2014-09-26	2997	\N	24366	\N
25520	generic_day	4	32000	f	2014-10-01	2997	\N	24366	\N
25528	generic_day	4	31999	f	2014-10-06	2997	\N	24366	\N
25527	generic_day	4	31999	f	2014-10-08	2997	\N	24366	\N
25549	specific_day	4	21600	f	2014-10-30	3003	12806	\N	\N
25654	specific_day	4	21600	f	2014-10-22	3003	12806	\N	\N
25533	specific_day	4	7200	f	2014-11-05	2995	12805	\N	\N
25542	specific_day	4	7200	f	2014-10-30	2995	12805	\N	\N
25548	specific_day	4	7200	f	2014-10-24	2995	12805	\N	\N
25536	specific_day	4	7200	f	2014-11-03	2995	12805	\N	\N
25545	specific_day	4	7200	f	2014-10-10	2995	12805	\N	\N
25543	specific_day	4	7200	f	2014-10-22	2995	12805	\N	\N
25531	specific_day	4	7200	f	2014-10-20	2995	12805	\N	\N
26652	specific_day	9	21600	f	2014-10-14	3011	12812	\N	\N
26653	specific_day	9	21600	f	2014-09-29	3011	12812	\N	\N
26651	specific_day	9	21600	f	2014-10-20	3011	12812	\N	\N
26654	specific_day	9	21600	f	2014-10-22	3011	12812	\N	\N
26656	specific_day	9	21600	f	2014-10-07	3011	12812	\N	\N
26655	specific_day	9	21600	f	2014-10-10	3011	12812	\N	\N
26650	specific_day	9	21600	f	2014-10-03	3011	12812	\N	\N
26657	generic_day	9	28800	f	2014-10-30	3013	\N	24383	\N
20718	generic_day	10	28800	f	2014-11-04	2944	\N	6907	\N
20719	generic_day	10	28800	f	2014-11-24	2944	\N	6907	\N
25659	specific_day	4	21600	f	2014-10-21	3003	12806	\N	\N
25661	specific_day	4	21600	f	2014-10-23	3003	12806	\N	\N
25660	specific_day	4	21600	f	2014-10-10	3003	12806	\N	\N
25667	specific_day	4	21600	f	2014-10-15	3003	12806	\N	\N
20119	specific_day	12	21600	f	2014-10-02	2939	12759	\N	\N
24291	generic_day	16	19862	f	2014-08-22	3007	\N	6967	\N
24297	generic_day	16	19862	f	2014-09-01	3007	\N	6967	\N
20123	specific_day	12	21600	f	2014-09-30	2939	12759	\N	\N
25665	specific_day	4	21600	f	2014-10-16	3003	12806	\N	\N
25669	specific_day	4	21600	f	2014-10-20	3003	12806	\N	\N
25668	specific_day	4	21600	f	2014-10-17	3003	12806	\N	\N
25666	specific_day	4	21600	f	2014-10-31	3003	12806	\N	\N
25663	specific_day	4	21600	f	2014-10-28	3003	12806	\N	\N
25664	specific_day	4	21600	f	2014-10-29	3003	12806	\N	\N
25662	specific_day	4	21600	f	2014-11-06	3003	12806	\N	\N
20128	specific_day	12	21600	f	2014-10-07	2939	12759	\N	\N
20121	specific_day	12	21600	f	2014-10-08	2939	12759	\N	\N
20122	specific_day	12	18900	f	2014-10-03	2939	12759	\N	\N
20124	specific_day	12	21600	f	2014-10-23	2939	12759	\N	\N
20126	specific_day	12	21600	f	2014-10-01	2939	12759	\N	\N
20125	specific_day	12	21600	f	2014-10-22	2939	12759	\N	\N
20127	specific_day	12	21600	f	2014-10-15	2939	12759	\N	\N
20120	specific_day	12	21600	f	2014-10-21	2939	12759	\N	\N
20108	specific_day	12	7200	f	2014-10-16	2935	12758	\N	\N
20107	specific_day	12	7200	f	2014-10-20	2935	12758	\N	\N
20114	specific_day	12	7200	f	2014-10-22	2935	12758	\N	\N
20110	specific_day	12	7200	f	2014-10-15	2935	12758	\N	\N
20116	specific_day	12	7200	f	2014-10-08	2935	12758	\N	\N
20113	specific_day	12	7200	f	2014-10-06	2935	12758	\N	\N
20109	specific_day	12	7200	f	2014-10-23	2935	12758	\N	\N
20112	specific_day	12	7200	f	2014-10-09	2935	12758	\N	\N
24299	generic_day	16	19862	f	2014-08-12	3007	\N	6967	\N
24293	generic_day	16	19862	f	2014-08-28	3007	\N	6967	\N
24294	generic_day	16	19862	f	2014-08-18	3007	\N	6967	\N
24290	generic_day	16	19862	f	2014-08-14	3007	\N	6967	\N
24296	generic_day	16	19862	f	2014-09-05	3007	\N	6967	\N
24295	generic_day	16	19862	f	2014-09-03	3007	\N	6967	\N
26332	specific_day	3	0	f	2014-11-23	2969	12817	\N	\N
26333	specific_day	3	14400	f	2014-08-05	2969	12817	\N	\N
26334	specific_day	3	0	f	2014-11-01	2969	12817	\N	\N
26335	specific_day	3	0	f	2014-09-21	2969	12817	\N	\N
26336	specific_day	3	0	f	2014-11-29	2969	12817	\N	\N
26337	specific_day	3	0	f	2014-12-07	2969	12817	\N	\N
26355	specific_day	3	14400	f	2014-12-15	2969	12817	\N	\N
26356	specific_day	3	14400	f	2014-11-26	2969	12817	\N	\N
26357	specific_day	3	14400	f	2014-09-15	2969	12817	\N	\N
26358	specific_day	3	0	f	2014-10-13	2969	12817	\N	\N
24298	generic_day	16	19862	f	2014-08-27	3007	\N	6967	\N
24292	generic_day	16	19862	f	2014-08-13	3007	\N	6967	\N
20117	specific_day	12	7200	f	2014-10-07	2935	12758	\N	\N
20111	specific_day	12	6300	f	2014-09-26	2935	12758	\N	\N
20118	specific_day	12	7200	f	2014-10-01	2935	12758	\N	\N
20115	specific_day	12	7200	f	2014-10-14	2935	12758	\N	\N
26608	generic_day	9	20159	f	2014-09-25	3009	\N	24363	\N
26607	generic_day	9	20159	f	2014-09-24	3009	\N	24363	\N
26606	generic_day	9	8640	f	2014-09-23	3011	\N	24363	\N
21818	generic_day	8	19862	f	2014-08-29	2978	\N	6921	\N
21813	generic_day	8	19862	f	2014-08-28	2978	\N	6921	\N
21822	generic_day	8	19862	f	2014-08-13	2978	\N	6921	\N
21816	generic_day	8	19862	f	2014-09-02	2978	\N	6921	\N
21831	generic_day	8	19862	f	2014-09-11	2978	\N	6921	\N
21837	generic_day	8	19862	f	2014-08-11	2978	\N	6921	\N
21834	generic_day	8	19862	f	2014-09-10	2978	\N	6921	\N
21826	generic_day	8	19862	f	2014-08-26	2978	\N	6921	\N
21836	generic_day	8	19862	f	2014-09-04	2978	\N	6921	\N
21827	generic_day	8	19862	f	2014-08-19	2978	\N	6921	\N
21846	generic_day	8	28800	f	2014-09-23	2982	\N	6922	\N
21845	generic_day	8	17280	f	2014-09-19	2982	\N	6922	\N
21839	generic_day	8	17280	f	2014-09-24	2984	\N	6922	\N
21849	generic_day	8	17280	f	2014-09-25	2984	\N	6922	\N
21843	generic_day	8	17280	f	2014-09-15	2982	\N	6922	\N
21850	generic_day	8	28800	f	2014-09-25	2982	\N	6922	\N
21840	generic_day	8	17280	f	2014-09-18	2982	\N	6922	\N
21842	generic_day	8	28800	f	2014-09-24	2982	\N	6922	\N
21848	generic_day	8	17280	f	2014-09-12	2984	\N	6922	\N
21844	generic_day	8	17280	f	2014-09-22	2982	\N	6922	\N
21841	generic_day	8	17280	f	2014-09-17	2982	\N	6922	\N
21851	generic_day	8	28800	f	2014-09-12	2982	\N	6922	\N
21847	generic_day	8	17280	f	2014-09-16	2982	\N	6922	\N
21852	generic_day	8	17280	f	2014-09-23	2984	\N	6922	\N
21856	generic_day	8	5760	f	2014-10-02	2984	\N	6923	\N
21853	generic_day	8	5760	f	2014-09-30	2984	\N	6923	\N
21862	generic_day	8	28800	f	2014-09-29	2982	\N	6923	\N
21865	generic_day	8	5760	f	2014-09-26	2984	\N	6923	\N
21867	generic_day	8	5760	f	2014-10-07	2984	\N	6923	\N
21866	generic_day	8	5760	f	2014-10-09	2982	\N	6923	\N
21863	generic_day	8	5760	f	2014-10-01	2984	\N	6923	\N
21857	generic_day	8	28800	f	2014-10-06	2982	\N	6923	\N
21858	generic_day	8	28800	f	2014-10-07	2982	\N	6923	\N
21860	generic_day	8	5760	f	2014-09-29	2984	\N	6923	\N
21870	generic_day	8	5760	f	2014-10-08	2984	\N	6923	\N
21869	generic_day	8	5760	f	2014-10-06	2984	\N	6923	\N
21864	generic_day	8	5760	f	2014-10-03	2984	\N	6923	\N
21859	generic_day	8	28800	f	2014-09-26	2982	\N	6923	\N
21854	generic_day	8	28800	f	2014-10-01	2982	\N	6923	\N
16362	generic_day	9	17280	f	2014-09-25	2974	\N	6880	\N
16364	generic_day	9	17280	f	2014-09-23	2974	\N	6880	\N
26816	specific_day	5	26400	f	2014-12-04	3009	12824	\N	\N
26817	specific_day	5	26400	f	2014-12-11	3009	12824	\N	\N
16367	generic_day	9	28800	f	2014-09-12	2972	\N	6880	\N
13634	generic_day	9	17280	f	2014-09-12	2974	\N	6880	\N
16371	generic_day	9	28800	f	2014-09-23	2972	\N	6880	\N
16366	generic_day	9	28800	f	2014-09-24	2972	\N	6880	\N
16373	generic_day	9	17280	f	2014-09-17	2972	\N	6880	\N
16370	generic_day	9	17280	f	2014-09-16	2972	\N	6880	\N
16365	generic_day	9	17280	f	2014-09-19	2972	\N	6880	\N
16368	generic_day	9	17280	f	2014-09-22	2972	\N	6880	\N
16369	generic_day	9	28800	f	2014-09-25	2972	\N	6880	\N
16374	generic_day	9	17280	f	2014-09-15	2972	\N	6880	\N
16363	generic_day	9	17280	f	2014-09-24	2974	\N	6880	\N
16372	generic_day	9	17280	f	2014-09-18	2972	\N	6880	\N
16432	generic_day	8	28799	f	2014-09-22	2972	\N	6882	\N
16430	generic_day	8	20160	f	2014-09-12	2974	\N	6882	\N
16438	generic_day	8	28801	f	2014-09-18	2972	\N	6882	\N
16434	generic_day	8	8639	f	2014-09-25	2972	\N	6882	\N
16426	generic_day	8	28801	f	2014-09-15	2972	\N	6882	\N
16428	generic_day	8	20159	f	2014-09-24	2974	\N	6882	\N
16435	generic_day	8	28801	f	2014-09-19	2972	\N	6882	\N
16431	generic_day	8	20159	f	2014-09-23	2974	\N	6882	\N
16437	generic_day	8	20159	f	2014-09-25	2974	\N	6882	\N
16433	generic_day	8	28801	f	2014-09-16	2972	\N	6882	\N
16427	generic_day	8	8639	f	2014-09-24	2972	\N	6882	\N
16425	generic_day	8	8640	f	2014-09-23	2972	\N	6882	\N
16436	generic_day	8	28801	f	2014-09-17	2972	\N	6882	\N
16442	specific_day	8	21600	f	2014-10-01	2974	12739	\N	\N
16450	specific_day	8	21600	f	2014-10-23	2974	12739	\N	\N
16462	specific_day	8	7200	f	2014-10-16	2972	12740	\N	\N
16461	specific_day	8	7200	f	2014-10-23	2972	12740	\N	\N
26683	generic_day	9	28800	f	2014-11-24	3013	\N	24383	\N
26682	generic_day	9	28800	f	2014-11-06	3013	\N	24383	\N
26680	generic_day	9	28800	f	2014-10-29	3013	\N	24383	\N
26684	generic_day	9	28800	f	2014-11-13	3013	\N	24383	\N
26679	generic_day	9	28800	f	2014-11-04	3013	\N	24383	\N
26681	generic_day	9	28800	f	2014-11-10	3013	\N	24383	\N
26677	generic_day	9	28800	f	2014-11-18	3013	\N	24383	\N
26678	generic_day	9	28800	f	2014-11-19	3013	\N	24383	\N
26338	specific_day	3	14400	f	2014-10-01	2969	12817	\N	\N
26339	specific_day	3	14400	f	2014-12-02	2969	12817	\N	\N
26340	specific_day	3	7200	f	2014-11-28	2969	12817	\N	\N
26341	specific_day	3	7200	f	2014-11-21	2969	12817	\N	\N
26342	specific_day	3	14400	f	2014-09-01	2969	12817	\N	\N
26343	specific_day	3	0	f	2014-09-27	2969	12817	\N	\N
26344	specific_day	3	14400	f	2014-11-04	2969	12817	\N	\N
26345	specific_day	3	14400	f	2014-09-08	2969	12817	\N	\N
26346	specific_day	3	0	f	2014-09-06	2969	12817	\N	\N
26347	specific_day	3	7200	f	2014-08-08	2969	12817	\N	\N
26348	specific_day	3	0	f	2014-11-22	2969	12817	\N	\N
26349	specific_day	3	7200	f	2014-10-24	2969	12817	\N	\N
26350	specific_day	3	14400	f	2014-11-06	2969	12817	\N	\N
26351	specific_day	3	14400	f	2014-08-12	2969	12817	\N	\N
26352	specific_day	3	14400	f	2014-09-10	2969	12817	\N	\N
26353	specific_day	3	14400	f	2014-08-21	2969	12817	\N	\N
26830	generic_day	5	26400	f	2014-12-10	3007	\N	24388	\N
26827	generic_day	5	12000	f	2014-12-02	3007	\N	24388	\N
26829	generic_day	5	26400	f	2014-12-03	3007	\N	24388	\N
26828	generic_day	5	26400	f	2014-12-17	3007	\N	24388	\N
26822	generic_day	5	26400	f	2014-12-15	3007	\N	24388	\N
26824	generic_day	5	26400	f	2014-12-11	3007	\N	24388	\N
26833	generic_day	5	12000	f	2014-12-19	3007	\N	24388	\N
26832	generic_day	5	26400	f	2014-12-09	3007	\N	24388	\N
26823	generic_day	5	26400	f	2014-12-04	3007	\N	24388	\N
26825	generic_day	5	26400	f	2014-12-12	3007	\N	24388	\N
26826	generic_day	5	26400	f	2014-12-16	3007	\N	24388	\N
26831	generic_day	5	26400	f	2014-12-18	3007	\N	24388	\N
26818	specific_day	5	26400	f	2014-12-09	3009	12824	\N	\N
26821	specific_day	5	26400	f	2014-12-10	3009	12824	\N	\N
26820	specific_day	5	26400	f	2014-12-03	3009	12824	\N	\N
26819	specific_day	5	12000	f	2014-12-02	3009	12824	\N	\N
26835	generic_day	5	3001	f	2014-12-02	2951	\N	24389	\N
26838	generic_day	5	31799	f	2014-12-16	2951	\N	24389	\N
26836	generic_day	5	31801	f	2014-12-10	2951	\N	24389	\N
26837	generic_day	5	31799	f	2014-12-18	2951	\N	24389	\N
26834	generic_day	5	31799	f	2014-12-15	2951	\N	24389	\N
26354	specific_day	3	14400	f	2014-08-07	2969	12817	\N	\N
26359	specific_day	3	14400	f	2014-11-12	2969	12817	\N	\N
26360	specific_day	3	0	f	2014-11-15	2969	12817	\N	\N
26361	specific_day	3	14400	f	2014-11-27	2969	12817	\N	\N
26362	specific_day	3	14400	f	2014-10-07	2969	12817	\N	\N
26363	specific_day	3	14400	f	2014-10-22	2969	12817	\N	\N
26364	specific_day	3	14400	f	2014-08-11	2969	12817	\N	\N
26365	specific_day	3	0	f	2014-08-02	2969	12817	\N	\N
26366	specific_day	3	14400	f	2014-08-28	2969	12817	\N	\N
26367	specific_day	3	0	f	2014-09-28	2969	12817	\N	\N
26368	specific_day	3	14400	f	2014-10-28	2969	12817	\N	\N
26369	specific_day	3	14400	f	2014-11-10	2969	12817	\N	\N
26370	specific_day	3	14400	f	2014-08-27	2969	12817	\N	\N
26371	specific_day	3	7200	f	2014-08-29	2969	12817	\N	\N
26372	specific_day	3	0	f	2014-10-11	2969	12817	\N	\N
26373	specific_day	3	0	f	2014-09-24	2969	12817	\N	\N
26374	specific_day	3	14400	f	2014-08-06	2969	12817	\N	\N
26375	specific_day	3	14400	f	2014-12-22	2969	12817	\N	\N
26376	specific_day	3	0	f	2014-08-23	2969	12817	\N	\N
26377	specific_day	3	0	f	2014-12-14	2969	12817	\N	\N
26378	specific_day	3	7200	f	2014-10-10	2969	12817	\N	\N
26379	specific_day	3	14400	f	2014-10-20	2969	12817	\N	\N
26380	specific_day	3	0	f	2014-09-18	2969	12817	\N	\N
26381	specific_day	3	0	f	2014-08-31	2969	12817	\N	\N
26382	specific_day	3	0	f	2014-10-25	2969	12817	\N	\N
26383	specific_day	3	14400	f	2014-11-20	2969	12817	\N	\N
26384	specific_day	3	14400	f	2014-10-21	2969	12817	\N	\N
26385	specific_day	3	14400	f	2014-09-09	2969	12817	\N	\N
26386	specific_day	3	0	f	2014-09-07	2969	12817	\N	\N
26387	specific_day	3	7200	f	2014-10-17	2969	12817	\N	\N
26388	specific_day	3	0	f	2014-08-24	2969	12817	\N	\N
26389	specific_day	3	14400	f	2014-10-06	2969	12817	\N	\N
26390	specific_day	3	14400	f	2014-09-02	2969	12817	\N	\N
26391	specific_day	3	14400	f	2014-10-27	2969	12817	\N	\N
26392	specific_day	3	0	f	2014-09-23	2969	12817	\N	\N
26393	specific_day	3	14400	f	2014-10-02	2969	12817	\N	\N
26394	specific_day	3	0	f	2014-09-13	2969	12817	\N	\N
26395	specific_day	3	7200	f	2014-08-01	2969	12817	\N	\N
26396	specific_day	3	14400	f	2014-10-30	2969	12817	\N	\N
26397	specific_day	3	14400	f	2014-09-11	2969	12817	\N	\N
26398	specific_day	3	14400	f	2014-12-17	2969	12817	\N	\N
26399	specific_day	3	0	f	2014-11-16	2969	12817	\N	\N
26400	specific_day	3	0	f	2014-08-03	2969	12817	\N	\N
26401	specific_day	3	14400	f	2014-12-16	2969	12817	\N	\N
26402	specific_day	3	14400	f	2014-08-26	2969	12817	\N	\N
26403	specific_day	3	0	f	2014-09-17	2969	12817	\N	\N
26404	specific_day	3	0	f	2014-08-10	2969	12817	\N	\N
26405	specific_day	3	7200	f	2014-10-03	2969	12817	\N	\N
26406	specific_day	3	7200	f	2014-09-12	2969	12817	\N	\N
26407	specific_day	3	0	f	2014-12-21	2969	12817	\N	\N
26408	specific_day	3	14400	f	2014-12-18	2969	12817	\N	\N
26409	specific_day	3	14400	f	2014-12-10	2969	12817	\N	\N
26410	specific_day	3	0	f	2014-12-08	2969	12817	\N	\N
26411	specific_day	3	14400	f	2014-08-04	2969	12817	\N	\N
26412	specific_day	3	14400	f	2014-12-01	2969	12817	\N	\N
26413	specific_day	3	0	f	2014-09-19	2969	12817	\N	\N
26414	specific_day	3	0	f	2014-09-29	2969	12817	\N	\N
26415	specific_day	3	14400	f	2014-10-16	2969	12817	\N	\N
26416	specific_day	3	14400	f	2014-11-17	2969	12817	\N	\N
26417	specific_day	3	14400	f	2014-09-16	2969	12817	\N	\N
26418	specific_day	3	0	f	2014-10-05	2969	12817	\N	\N
26419	specific_day	3	14400	f	2014-11-25	2969	12817	\N	\N
26420	specific_day	3	14400	f	2014-08-18	2969	12817	\N	\N
26421	specific_day	3	0	f	2014-12-20	2969	12817	\N	\N
26422	specific_day	3	14400	f	2014-11-24	2969	12817	\N	\N
26423	specific_day	3	0	f	2014-08-17	2969	12817	\N	\N
26424	specific_day	3	7200	f	2014-09-05	2969	12817	\N	\N
26425	specific_day	3	0	f	2014-12-06	2969	12817	\N	\N
26426	specific_day	3	14400	f	2014-08-13	2969	12817	\N	\N
26427	specific_day	3	0	f	2014-11-30	2969	12817	\N	\N
26428	specific_day	3	14400	f	2014-11-19	2969	12817	\N	\N
26429	specific_day	3	14400	f	2014-10-23	2969	12817	\N	\N
26430	specific_day	3	14400	f	2014-12-09	2969	12817	\N	\N
26431	specific_day	3	7200	f	2014-11-14	2969	12817	\N	\N
26432	specific_day	3	14400	f	2014-12-03	2969	12817	\N	\N
26433	specific_day	3	0	f	2014-08-16	2969	12817	\N	\N
26434	specific_day	3	7200	f	2014-10-31	2969	12817	\N	\N
26435	specific_day	3	0	f	2014-12-13	2969	12817	\N	\N
26436	specific_day	3	14400	f	2014-10-14	2969	12817	\N	\N
26437	specific_day	3	14400	f	2014-09-04	2969	12817	\N	\N
26438	specific_day	3	0	f	2014-10-26	2969	12817	\N	\N
24339	specific_day	8	7200	f	2014-10-10	2982	12792	\N	\N
24453	specific_day	8	7200	f	2014-10-15	2982	12792	\N	\N
24452	specific_day	8	7200	f	2014-11-05	2982	12792	\N	\N
24451	specific_day	8	7200	f	2014-11-04	2982	12792	\N	\N
24450	specific_day	8	7200	f	2014-10-30	2982	12792	\N	\N
24444	specific_day	8	7200	f	2014-10-31	2982	12792	\N	\N
24340	specific_day	8	7200	f	2014-10-14	2982	12792	\N	\N
24449	specific_day	8	7200	f	2014-10-20	2982	12792	\N	\N
24448	specific_day	8	7200	f	2014-10-16	2982	12792	\N	\N
24446	specific_day	8	7200	f	2014-10-27	2982	12792	\N	\N
24442	specific_day	8	7200	f	2014-11-06	2982	12792	\N	\N
24447	specific_day	8	7200	f	2014-10-24	2982	12792	\N	\N
24443	specific_day	8	7200	f	2014-11-03	2982	12792	\N	\N
24338	specific_day	8	7200	f	2014-10-21	2982	12792	\N	\N
24445	specific_day	8	7200	f	2014-10-22	2982	12792	\N	\N
26439	specific_day	3	0	f	2014-10-04	2969	12817	\N	\N
26440	specific_day	3	0	f	2014-10-19	2969	12817	\N	\N
26441	specific_day	3	14400	f	2014-11-05	2969	12817	\N	\N
26442	specific_day	3	14400	f	2014-08-20	2969	12817	\N	\N
26443	specific_day	3	7200	f	2014-12-23	2969	12817	\N	\N
26444	specific_day	3	0	f	2014-08-09	2969	12817	\N	\N
26445	specific_day	3	14400	f	2014-11-18	2969	12817	\N	\N
26446	specific_day	3	14400	f	2014-08-25	2969	12817	\N	\N
26447	specific_day	3	14400	f	2014-10-29	2969	12817	\N	\N
26448	specific_day	3	0	f	2014-09-14	2969	12817	\N	\N
26449	specific_day	3	0	f	2014-11-08	2969	12817	\N	\N
26450	specific_day	3	0	f	2014-09-30	2969	12817	\N	\N
26451	specific_day	3	14400	f	2014-08-14	2969	12817	\N	\N
26452	specific_day	3	7200	f	2014-12-19	2969	12817	\N	\N
26453	specific_day	3	14400	f	2014-10-09	2969	12817	\N	\N
26454	specific_day	3	14400	f	2014-10-15	2969	12817	\N	\N
26455	specific_day	3	14400	f	2014-11-03	2969	12817	\N	\N
26456	specific_day	3	7200	f	2014-11-07	2969	12817	\N	\N
26457	specific_day	3	14400	f	2014-10-08	2969	12817	\N	\N
26458	specific_day	3	0	f	2014-10-18	2969	12817	\N	\N
26459	specific_day	3	0	f	2014-09-22	2969	12817	\N	\N
26460	specific_day	3	0	f	2014-09-25	2969	12817	\N	\N
26461	specific_day	3	0	f	2014-08-30	2969	12817	\N	\N
26462	specific_day	3	7200	f	2014-08-22	2969	12817	\N	\N
26463	specific_day	3	0	f	2014-09-26	2969	12817	\N	\N
26464	specific_day	3	0	f	2014-12-05	2969	12817	\N	\N
26465	specific_day	3	14400	f	2014-09-03	2969	12817	\N	\N
26466	specific_day	3	0	f	2014-10-12	2969	12817	\N	\N
26467	specific_day	3	7200	f	2014-12-12	2969	12817	\N	\N
26468	specific_day	3	0	f	2014-11-02	2969	12817	\N	\N
26469	specific_day	3	0	f	2014-08-15	2969	12817	\N	\N
26470	specific_day	3	14400	f	2014-11-13	2969	12817	\N	\N
26471	specific_day	3	14400	f	2014-11-11	2969	12817	\N	\N
26472	specific_day	3	0	f	2014-11-09	2969	12817	\N	\N
26473	specific_day	3	0	f	2014-09-20	2969	12817	\N	\N
26474	specific_day	3	14400	f	2014-12-11	2969	12817	\N	\N
26475	specific_day	3	14400	f	2014-08-19	2969	12817	\N	\N
26476	specific_day	3	14400	f	2014-12-04	2969	12817	\N	\N
20131	specific_day	12	21600	f	2014-10-16	2939	12759	\N	\N
20135	specific_day	12	18900	f	2014-10-17	2939	12759	\N	\N
20136	specific_day	12	21600	f	2014-10-20	2939	12759	\N	\N
20130	specific_day	12	18900	f	2014-09-26	2939	12759	\N	\N
20134	specific_day	12	21600	f	2014-10-06	2939	12759	\N	\N
20129	specific_day	12	21600	f	2014-10-14	2939	12759	\N	\N
20133	specific_day	12	18900	f	2014-10-10	2939	12759	\N	\N
20137	specific_day	12	21600	f	2014-10-13	2939	12759	\N	\N
20132	specific_day	12	21600	f	2014-09-29	2939	12759	\N	\N
20105	specific_day	12	7200	f	2014-10-13	2935	12758	\N	\N
20100	specific_day	12	6300	f	2014-10-10	2935	12758	\N	\N
20103	specific_day	12	6300	f	2014-10-17	2935	12758	\N	\N
20102	specific_day	12	7200	f	2014-09-30	2935	12758	\N	\N
20104	specific_day	12	6300	f	2014-10-03	2935	12758	\N	\N
20101	specific_day	12	7200	f	2014-10-21	2935	12758	\N	\N
20106	specific_day	12	7200	f	2014-09-29	2935	12758	\N	\N
24199	specific_day	16	0	f	2014-11-22	2951	12791	\N	\N
24201	specific_day	16	14400	f	2014-09-15	2951	12791	\N	\N
24260	specific_day	16	14400	f	2014-11-05	2951	12791	\N	\N
24265	specific_day	16	14400	f	2014-11-17	2951	12791	\N	\N
24202	specific_day	16	14400	f	2014-08-27	2951	12791	\N	\N
24259	specific_day	16	14400	f	2014-10-28	2951	12791	\N	\N
24200	specific_day	16	0	f	2014-08-16	2951	12791	\N	\N
24270	specific_day	16	14400	f	2014-09-10	2951	12791	\N	\N
24238	specific_day	16	14400	f	2014-12-04	2951	12791	\N	\N
24261	specific_day	16	0	f	2014-09-21	2951	12791	\N	\N
24203	specific_day	16	14400	f	2014-08-12	2951	12791	\N	\N
24236	specific_day	16	14400	f	2014-10-23	2951	12791	\N	\N
24198	specific_day	16	14400	f	2014-08-19	2951	12791	\N	\N
24264	specific_day	16	0	f	2014-10-13	2951	12791	\N	\N
24235	specific_day	16	14400	f	2014-11-24	2951	12791	\N	\N
24263	specific_day	16	14400	f	2014-10-16	2951	12791	\N	\N
24262	specific_day	16	14400	f	2014-12-01	2951	12791	\N	\N
24237	specific_day	16	14400	f	2014-10-07	2951	12791	\N	\N
24258	specific_day	16	14400	f	2014-09-29	2951	12791	\N	\N
24272	generic_day	16	19862	f	2014-08-25	3007	\N	6967	\N
24274	generic_day	16	19862	f	2014-09-11	3007	\N	6967	\N
24271	generic_day	16	19862	f	2014-09-04	3007	\N	6967	\N
24275	generic_day	16	19862	f	2014-08-05	3007	\N	6967	\N
24273	generic_day	16	19862	f	2014-08-19	3007	\N	6967	\N
24276	generic_day	16	19862	f	2014-08-20	3007	\N	6967	\N
25680	generic_day	12	17280	f	2014-09-23	3009	\N	24367	\N
25677	generic_day	12	17280	f	2014-09-19	3009	\N	24367	\N
25674	generic_day	12	17280	f	2014-09-22	3009	\N	24367	\N
25679	generic_day	12	17280	f	2014-09-17	3009	\N	24367	\N
25675	generic_day	12	28800	f	2014-09-12	3011	\N	24367	\N
25678	generic_day	12	28800	f	2014-09-24	3011	\N	24367	\N
25672	generic_day	12	17280	f	2014-09-25	3009	\N	24367	\N
25676	generic_day	12	17280	f	2014-09-15	3009	\N	24367	\N
25681	generic_day	12	17280	f	2014-09-16	3009	\N	24367	\N
25670	generic_day	12	17280	f	2014-09-18	3009	\N	24367	\N
25671	generic_day	12	28800	f	2014-09-23	3011	\N	24367	\N
25673	generic_day	12	28800	f	2014-09-25	3011	\N	24367	\N
26616	generic_day	9	8639	f	2014-09-25	3011	\N	24363	\N
26619	generic_day	9	28801	f	2014-09-18	3009	\N	24363	\N
26617	generic_day	9	28801	f	2014-09-19	3009	\N	24363	\N
26618	generic_day	9	8641	f	2014-09-12	3011	\N	24363	\N
26627	specific_day	9	7200	f	2014-10-07	3009	12811	\N	\N
26632	specific_day	9	7200	f	2014-10-22	3009	12811	\N	\N
26630	specific_day	9	7200	f	2014-10-20	3009	12811	\N	\N
26629	specific_day	9	7200	f	2014-10-02	3009	12811	\N	\N
26633	specific_day	9	7200	f	2014-10-10	3009	12811	\N	\N
26620	specific_day	9	7200	f	2014-10-09	3009	12811	\N	\N
26634	specific_day	9	7200	f	2014-10-03	3009	12811	\N	\N
26625	specific_day	9	7200	f	2014-10-14	3009	12811	\N	\N
26621	specific_day	9	7200	f	2014-10-21	3009	12811	\N	\N
26622	specific_day	9	7200	f	2014-10-01	3009	12811	\N	\N
26623	specific_day	9	7200	f	2014-10-06	3009	12811	\N	\N
26624	specific_day	9	7200	f	2014-09-26	3009	12811	\N	\N
26631	specific_day	9	7200	f	2014-09-29	3009	12811	\N	\N
26626	specific_day	9	7200	f	2014-10-08	3009	12811	\N	\N
26635	specific_day	9	7200	f	2014-10-15	3009	12811	\N	\N
26628	specific_day	9	7200	f	2014-10-23	3009	12811	\N	\N
28751	specific_day	3	0	f	2014-09-06	2931	12745	\N	\N
28752	specific_day	3	14400	f	2014-10-09	2931	12745	\N	\N
28753	specific_day	3	0	f	2014-11-29	2931	12745	\N	\N
28754	specific_day	3	14400	f	2014-10-28	2931	12745	\N	\N
28755	specific_day	3	14400	f	2014-10-08	2931	12745	\N	\N
28756	specific_day	3	14400	f	2014-10-21	2931	12745	\N	\N
28757	specific_day	3	14400	f	2014-12-18	2931	12745	\N	\N
28758	specific_day	3	0	f	2014-11-23	2931	12745	\N	\N
28759	specific_day	3	14400	f	2014-08-12	2931	12745	\N	\N
28760	specific_day	3	7200	f	2014-10-03	2931	12745	\N	\N
28761	specific_day	3	14400	f	2014-08-25	2931	12745	\N	\N
28762	specific_day	3	0	f	2014-09-14	2931	12745	\N	\N
28763	specific_day	3	7200	f	2014-11-07	2931	12745	\N	\N
28764	specific_day	3	0	f	2014-09-28	2931	12745	\N	\N
28765	specific_day	3	0	f	2014-08-23	2931	12745	\N	\N
28766	specific_day	3	7200	f	2014-12-05	2931	12745	\N	\N
28767	specific_day	3	14400	f	2014-10-06	2931	12745	\N	\N
28768	specific_day	3	14400	f	2014-11-10	2931	12745	\N	\N
28769	specific_day	3	14400	f	2014-09-02	2931	12745	\N	\N
28770	specific_day	3	0	f	2014-08-17	2931	12745	\N	\N
25692	specific_day	5	7200	f	2014-12-23	2966	12807	\N	\N
25694	specific_day	5	14400	f	2014-11-20	2966	12807	\N	\N
25700	specific_day	5	14400	f	2014-12-15	2966	12807	\N	\N
25707	specific_day	5	7200	f	2014-10-10	2966	12807	\N	\N
25711	specific_day	5	14400	f	2014-10-14	2966	12807	\N	\N
25712	specific_day	5	14400	f	2014-10-27	2966	12807	\N	\N
25696	specific_day	5	14400	f	2014-09-08	2966	12807	\N	\N
25693	specific_day	5	0	f	2014-09-28	2966	12807	\N	\N
25699	specific_day	5	7200	f	2014-10-03	2966	12807	\N	\N
25688	specific_day	5	0	f	2014-10-19	2966	12807	\N	\N
25698	specific_day	5	14400	f	2014-11-13	2966	12807	\N	\N
25690	specific_day	5	0	f	2014-11-02	2966	12807	\N	\N
25687	specific_day	5	14400	f	2014-10-28	2966	12807	\N	\N
25686	specific_day	5	14400	f	2014-12-04	2966	12807	\N	\N
25685	specific_day	5	0	f	2014-09-24	2966	12807	\N	\N
25701	specific_day	5	0	f	2014-11-09	2966	12807	\N	\N
25710	specific_day	5	0	f	2014-08-24	2966	12807	\N	\N
25703	specific_day	5	14400	f	2014-08-21	2966	12807	\N	\N
25702	specific_day	5	0	f	2014-12-07	2966	12807	\N	\N
25697	specific_day	5	14400	f	2014-08-12	2966	12807	\N	\N
25708	specific_day	5	0	f	2014-12-14	2966	12807	\N	\N
25704	specific_day	5	0	f	2014-11-16	2966	12807	\N	\N
25684	specific_day	5	14400	f	2014-08-13	2966	12807	\N	\N
25706	specific_day	5	14400	f	2014-09-15	2966	12807	\N	\N
25713	specific_day	5	7200	f	2014-10-31	2966	12807	\N	\N
25691	specific_day	5	0	f	2014-09-07	2966	12807	\N	\N
25714	specific_day	5	0	f	2014-09-18	2966	12807	\N	\N
25705	specific_day	5	14400	f	2014-08-27	2966	12807	\N	\N
25695	specific_day	5	0	f	2014-11-08	2966	12807	\N	\N
25709	specific_day	5	14400	f	2014-12-03	2966	12807	\N	\N
25689	specific_day	5	14400	f	2014-12-17	2966	12807	\N	\N
25877	generic_day	5	28800	f	2014-10-27	2977	\N	24368	\N
25880	generic_day	5	28800	f	2014-10-24	2977	\N	24368	\N
25883	generic_day	5	28800	f	2014-11-03	2977	\N	24368	\N
25882	generic_day	5	28800	f	2014-11-12	2977	\N	24368	\N
25881	generic_day	5	28800	f	2014-11-13	2977	\N	24368	\N
25878	generic_day	5	28800	f	2014-10-29	2977	\N	24368	\N
25879	generic_day	5	28800	f	2014-11-11	2977	\N	24368	\N
25885	generic_day	5	28800	f	2014-11-28	2977	\N	24368	\N
25884	generic_day	5	28800	f	2014-11-06	2977	\N	24368	\N
25896	generic_day	5	26401	f	2014-12-03	2966	\N	24369	\N
25895	generic_day	5	19199	f	2014-12-19	2966	\N	24369	\N
25897	generic_day	5	26399	f	2014-12-18	2966	\N	24369	\N
25890	generic_day	5	26401	f	2014-12-04	2966	\N	24369	\N
25894	generic_day	5	26399	f	2014-12-17	2966	\N	24369	\N
25889	generic_day	5	26399	f	2014-12-15	2966	\N	24369	\N
25891	generic_day	5	12001	f	2014-12-02	2966	\N	24369	\N
25886	generic_day	5	26400	f	2014-12-11	2966	\N	24369	\N
25887	generic_day	5	26401	f	2014-12-10	2966	\N	24369	\N
25893	generic_day	5	19200	f	2014-12-12	2966	\N	24369	\N
25888	generic_day	5	26399	f	2014-12-16	2966	\N	24369	\N
25892	generic_day	5	26401	f	2014-12-09	2966	\N	24369	\N
25919	specific_day	5	14400	f	2014-12-10	2972	12808	\N	\N
25913	specific_day	5	14400	f	2014-12-16	2972	12808	\N	\N
25912	specific_day	5	14400	f	2014-12-09	2972	12808	\N	\N
25917	specific_day	5	14400	f	2014-12-12	2972	12808	\N	\N
25918	specific_day	5	14400	f	2014-12-04	2972	12808	\N	\N
25916	specific_day	5	14400	f	2014-12-18	2972	12808	\N	\N
25910	specific_day	5	14400	f	2014-12-03	2972	12808	\N	\N
25915	specific_day	5	14400	f	2014-12-15	2972	12808	\N	\N
25911	specific_day	5	14400	f	2014-12-17	2972	12808	\N	\N
25914	specific_day	5	14400	f	2014-12-11	2972	12808	\N	\N
25909	generic_day	5	26400	f	2014-12-17	2970	\N	24370	\N
25904	generic_day	5	26400	f	2014-12-11	2970	\N	24370	\N
25900	generic_day	5	26400	f	2014-12-10	2970	\N	24370	\N
25907	generic_day	5	26400	f	2014-12-15	2970	\N	24370	\N
25899	generic_day	5	26400	f	2014-12-03	2970	\N	24370	\N
25908	generic_day	5	26400	f	2014-12-16	2970	\N	24370	\N
28668	specific_day	3	0	f	2014-10-04	2931	12745	\N	\N
28669	specific_day	3	14400	f	2014-10-23	2931	12745	\N	\N
28670	specific_day	3	14400	f	2014-09-09	2931	12745	\N	\N
28671	specific_day	3	14400	f	2014-12-15	2931	12745	\N	\N
28672	specific_day	3	0	f	2014-10-05	2931	12745	\N	\N
28673	specific_day	3	14400	f	2014-08-11	2931	12745	\N	\N
28674	specific_day	3	14400	f	2014-10-01	2931	12745	\N	\N
28675	specific_day	3	0	f	2014-09-30	2931	12745	\N	\N
28676	specific_day	3	7200	f	2014-08-22	2931	12745	\N	\N
28677	specific_day	3	0	f	2014-11-16	2931	12745	\N	\N
28678	specific_day	3	14400	f	2014-11-17	2931	12745	\N	\N
28679	specific_day	3	14400	f	2014-08-20	2931	12745	\N	\N
28680	specific_day	3	0	f	2014-08-16	2931	12745	\N	\N
28681	specific_day	3	14400	f	2014-10-14	2931	12745	\N	\N
28682	specific_day	3	14400	f	2014-12-04	2931	12745	\N	\N
28683	specific_day	3	14400	f	2014-12-22	2931	12745	\N	\N
28684	specific_day	3	0	f	2014-08-03	2931	12745	\N	\N
28685	specific_day	3	14400	f	2014-11-06	2931	12745	\N	\N
28686	specific_day	3	0	f	2014-08-10	2931	12745	\N	\N
28687	specific_day	3	0	f	2014-12-13	2931	12745	\N	\N
28688	specific_day	3	0	f	2014-12-08	2931	12745	\N	\N
28689	specific_day	3	0	f	2014-09-19	2931	12745	\N	\N
28690	specific_day	3	14400	f	2014-08-05	2931	12745	\N	\N
28691	specific_day	3	14400	f	2014-11-11	2931	12745	\N	\N
28692	specific_day	3	7200	f	2014-11-21	2931	12745	\N	\N
28693	specific_day	3	7200	f	2014-10-31	2931	12745	\N	\N
28694	specific_day	3	14400	f	2014-09-11	2931	12745	\N	\N
28695	specific_day	3	14400	f	2014-12-02	2931	12745	\N	\N
28696	specific_day	3	7200	f	2014-09-12	2931	12745	\N	\N
28697	specific_day	3	0	f	2014-09-23	2931	12745	\N	\N
28698	specific_day	3	7200	f	2014-12-12	2931	12745	\N	\N
28699	specific_day	3	0	f	2014-09-29	2931	12745	\N	\N
28700	specific_day	3	7200	f	2014-11-28	2931	12745	\N	\N
28701	specific_day	3	14400	f	2014-11-20	2931	12745	\N	\N
28702	specific_day	3	14400	f	2014-12-17	2931	12745	\N	\N
28703	specific_day	3	0	f	2014-12-14	2931	12745	\N	\N
28704	specific_day	3	14400	f	2014-10-30	2931	12745	\N	\N
28705	specific_day	3	14400	f	2014-12-10	2931	12745	\N	\N
28706	specific_day	3	0	f	2014-10-13	2931	12745	\N	\N
28707	specific_day	3	0	f	2014-10-12	2931	12745	\N	\N
28708	specific_day	3	14400	f	2014-08-04	2931	12745	\N	\N
28709	specific_day	3	14400	f	2014-09-08	2931	12745	\N	\N
28710	specific_day	3	0	f	2014-10-11	2931	12745	\N	\N
28711	specific_day	3	0	f	2014-09-18	2931	12745	\N	\N
28712	specific_day	3	14400	f	2014-09-01	2931	12745	\N	\N
28713	specific_day	3	0	f	2014-09-24	2931	12745	\N	\N
28714	specific_day	3	0	f	2014-08-09	2931	12745	\N	\N
28715	specific_day	3	0	f	2014-10-19	2931	12745	\N	\N
28716	specific_day	3	0	f	2014-09-07	2931	12745	\N	\N
28717	specific_day	3	7200	f	2014-08-01	2931	12745	\N	\N
28718	specific_day	3	0	f	2014-11-02	2931	12745	\N	\N
28719	specific_day	3	0	f	2014-12-06	2931	12745	\N	\N
28720	specific_day	3	0	f	2014-09-21	2931	12745	\N	\N
28721	specific_day	3	14400	f	2014-09-03	2931	12745	\N	\N
28722	specific_day	3	14400	f	2014-12-11	2931	12745	\N	\N
28723	specific_day	3	14400	f	2014-12-09	2931	12745	\N	\N
28724	specific_day	3	0	f	2014-08-24	2931	12745	\N	\N
28725	specific_day	3	14400	f	2014-08-06	2931	12745	\N	\N
28726	specific_day	3	14400	f	2014-08-27	2931	12745	\N	\N
28727	specific_day	3	7200	f	2014-09-05	2931	12745	\N	\N
28728	specific_day	3	0	f	2014-10-25	2931	12745	\N	\N
28729	specific_day	3	14400	f	2014-11-18	2931	12745	\N	\N
28730	specific_day	3	14400	f	2014-09-15	2931	12745	\N	\N
28731	specific_day	3	14400	f	2014-09-16	2931	12745	\N	\N
28732	specific_day	3	14400	f	2014-10-22	2931	12745	\N	\N
28733	specific_day	3	14400	f	2014-08-28	2931	12745	\N	\N
28734	specific_day	3	14400	f	2014-08-21	2931	12745	\N	\N
28735	specific_day	3	14400	f	2014-08-19	2931	12745	\N	\N
28736	specific_day	3	0	f	2014-12-07	2931	12745	\N	\N
28737	specific_day	3	14400	f	2014-08-13	2931	12745	\N	\N
28738	specific_day	3	0	f	2014-09-22	2931	12745	\N	\N
28739	specific_day	3	7200	f	2014-10-17	2931	12745	\N	\N
28740	specific_day	3	7200	f	2014-10-10	2931	12745	\N	\N
28741	specific_day	3	14400	f	2014-11-04	2931	12745	\N	\N
28742	specific_day	3	0	f	2014-12-21	2931	12745	\N	\N
28743	specific_day	3	0	f	2014-10-26	2931	12745	\N	\N
28744	specific_day	3	14400	f	2014-11-19	2931	12745	\N	\N
28745	specific_day	3	0	f	2014-11-30	2931	12745	\N	\N
28746	specific_day	3	14400	f	2014-09-10	2931	12745	\N	\N
28747	specific_day	3	14400	f	2014-11-05	2931	12745	\N	\N
28748	specific_day	3	7200	f	2014-10-24	2931	12745	\N	\N
28749	specific_day	3	0	f	2014-08-30	2931	12745	\N	\N
28750	specific_day	3	0	f	2014-11-15	2931	12745	\N	\N
28771	specific_day	3	0	f	2014-11-22	2931	12745	\N	\N
28772	specific_day	3	14400	f	2014-11-12	2931	12745	\N	\N
28773	specific_day	3	0	f	2014-09-25	2931	12745	\N	\N
28774	specific_day	3	0	f	2014-09-27	2931	12745	\N	\N
28775	specific_day	3	14400	f	2014-08-14	2931	12745	\N	\N
28776	specific_day	3	7200	f	2014-11-14	2931	12745	\N	\N
28777	specific_day	3	14400	f	2014-12-03	2931	12745	\N	\N
28778	specific_day	3	0	f	2014-11-01	2931	12745	\N	\N
28779	specific_day	3	14400	f	2014-10-07	2931	12745	\N	\N
28780	specific_day	3	0	f	2014-10-18	2931	12745	\N	\N
28781	specific_day	3	14400	f	2014-10-20	2931	12745	\N	\N
28782	specific_day	3	14400	f	2014-10-15	2931	12745	\N	\N
28783	specific_day	3	14400	f	2014-11-25	2931	12745	\N	\N
28784	specific_day	3	0	f	2014-11-09	2931	12745	\N	\N
28785	specific_day	3	0	f	2014-09-20	2931	12745	\N	\N
28786	specific_day	3	0	f	2014-08-31	2931	12745	\N	\N
28787	specific_day	3	14400	f	2014-10-29	2931	12745	\N	\N
28788	specific_day	3	14400	f	2014-08-07	2931	12745	\N	\N
28789	specific_day	3	7200	f	2014-08-08	2931	12745	\N	\N
28790	specific_day	3	14400	f	2014-11-03	2931	12745	\N	\N
28791	specific_day	3	14400	f	2014-10-16	2931	12745	\N	\N
28792	specific_day	3	0	f	2014-12-20	2931	12745	\N	\N
28793	specific_day	3	14400	f	2014-09-04	2931	12745	\N	\N
28794	specific_day	3	14400	f	2014-11-26	2931	12745	\N	\N
28795	specific_day	3	14400	f	2014-11-24	2931	12745	\N	\N
28796	specific_day	3	14400	f	2014-12-01	2931	12745	\N	\N
28797	specific_day	3	14400	f	2014-11-13	2931	12745	\N	\N
28798	specific_day	3	0	f	2014-09-13	2931	12745	\N	\N
28799	specific_day	3	0	f	2014-09-17	2931	12745	\N	\N
28800	specific_day	3	14400	f	2014-10-02	2931	12745	\N	\N
28801	specific_day	3	0	f	2014-08-02	2931	12745	\N	\N
28802	specific_day	3	7200	f	2014-12-19	2931	12745	\N	\N
28803	specific_day	3	0	f	2014-11-08	2931	12745	\N	\N
28804	specific_day	3	14400	f	2014-11-27	2931	12745	\N	\N
28805	specific_day	3	0	f	2014-08-15	2931	12745	\N	\N
28806	specific_day	3	7200	f	2014-08-29	2931	12745	\N	\N
28807	specific_day	3	14400	f	2014-10-27	2931	12745	\N	\N
28808	specific_day	3	14400	f	2014-08-18	2931	12745	\N	\N
28809	specific_day	3	0	f	2014-09-26	2931	12745	\N	\N
28810	specific_day	3	14400	f	2014-08-26	2931	12745	\N	\N
28811	specific_day	3	14400	f	2014-12-16	2931	12745	\N	\N
28812	generic_day	3	19862	f	2014-09-04	2933	\N	6891	\N
28813	generic_day	3	19862	f	2014-08-05	2933	\N	6891	\N
28814	generic_day	3	19862	f	2014-08-28	2933	\N	6891	\N
28815	generic_day	3	19862	f	2014-08-12	2933	\N	6891	\N
28816	generic_day	3	19862	f	2014-09-05	2933	\N	6891	\N
28817	generic_day	3	19862	f	2014-09-01	2933	\N	6891	\N
28818	generic_day	3	19862	f	2014-09-08	2933	\N	6891	\N
28819	generic_day	3	19862	f	2014-08-22	2933	\N	6891	\N
28820	generic_day	3	19862	f	2014-08-21	2933	\N	6891	\N
28821	generic_day	3	19862	f	2014-09-10	2933	\N	6891	\N
28822	generic_day	3	19862	f	2014-08-25	2933	\N	6891	\N
28823	generic_day	3	19862	f	2014-09-02	2933	\N	6891	\N
28824	generic_day	3	19863	f	2014-08-01	2933	\N	6891	\N
28825	generic_day	3	19862	f	2014-08-18	2933	\N	6891	\N
28826	generic_day	3	19862	f	2014-09-03	2933	\N	6891	\N
28827	generic_day	3	19862	f	2014-09-09	2933	\N	6891	\N
28828	generic_day	3	19862	f	2014-08-26	2933	\N	6891	\N
28829	generic_day	3	19862	f	2014-08-19	2933	\N	6891	\N
28830	generic_day	3	19863	f	2014-08-04	2933	\N	6891	\N
28831	generic_day	3	19862	f	2014-09-11	2933	\N	6891	\N
28832	generic_day	3	19862	f	2014-08-07	2933	\N	6891	\N
28833	generic_day	3	19862	f	2014-08-08	2933	\N	6891	\N
28834	generic_day	3	19862	f	2014-08-11	2933	\N	6891	\N
28835	generic_day	3	19862	f	2014-08-27	2933	\N	6891	\N
28836	generic_day	3	19862	f	2014-08-14	2933	\N	6891	\N
28837	generic_day	3	19862	f	2014-08-13	2933	\N	6891	\N
28838	generic_day	3	19862	f	2014-08-20	2933	\N	6891	\N
28839	generic_day	3	19862	f	2014-08-06	2933	\N	6891	\N
28840	generic_day	3	19862	f	2014-08-29	2933	\N	6891	\N
28841	generic_day	3	25202	f	2014-09-19	2935	\N	6892	\N
28842	generic_day	3	2700	f	2014-09-23	2939	\N	6892	\N
28843	generic_day	3	25200	f	2014-09-15	2935	\N	6892	\N
28844	generic_day	3	25201	f	2014-09-18	2935	\N	6892	\N
28845	generic_day	3	31500	f	2014-09-23	2935	\N	6892	\N
28846	generic_day	3	25200	f	2014-09-17	2935	\N	6892	\N
28847	generic_day	3	25200	f	2014-09-16	2935	\N	6892	\N
28848	generic_day	3	31499	f	2014-09-25	2935	\N	6892	\N
28849	generic_day	3	6300	f	2014-09-12	2939	\N	6892	\N
28850	generic_day	3	31499	f	2014-09-24	2935	\N	6892	\N
28851	generic_day	3	25201	f	2014-09-22	2935	\N	6892	\N
28852	generic_day	3	2699	f	2014-09-25	2939	\N	6892	\N
28853	generic_day	3	27900	f	2014-09-12	2935	\N	6892	\N
28854	generic_day	3	2699	f	2014-09-24	2939	\N	6892	\N
28855	generic_day	3	20071	f	2014-09-17	2935	\N	6893	\N
28856	generic_day	3	20071	f	2014-09-16	2935	\N	6893	\N
28857	generic_day	3	30736	f	2014-09-12	2939	\N	6893	\N
28858	generic_day	3	35685	f	2014-09-24	2939	\N	6893	\N
28859	generic_day	3	6885	f	2014-09-25	2935	\N	6893	\N
28860	generic_day	3	9136	f	2014-09-12	2935	\N	6893	\N
28861	generic_day	3	35685	f	2014-09-25	2939	\N	6893	\N
28862	generic_day	3	20068	f	2014-09-22	2935	\N	6893	\N
28863	generic_day	3	20072	f	2014-09-15	2935	\N	6893	\N
28864	generic_day	3	35684	f	2014-09-23	2939	\N	6893	\N
28865	generic_day	3	20068	f	2014-09-19	2935	\N	6893	\N
28866	generic_day	3	6885	f	2014-09-23	2935	\N	6893	\N
28867	generic_day	3	6885	f	2014-09-24	2935	\N	6893	\N
28868	generic_day	3	20069	f	2014-09-18	2935	\N	6893	\N
28869	generic_day	3	24370	f	2014-12-03	2933	\N	6925	\N
28870	generic_day	3	24369	f	2014-12-18	2933	\N	6925	\N
28871	generic_day	3	24369	f	2014-12-17	2933	\N	6925	\N
28872	generic_day	3	24369	f	2014-12-05	2933	\N	6925	\N
28873	generic_day	3	9970	f	2014-12-02	2933	\N	6925	\N
28874	generic_day	3	24369	f	2014-12-15	2933	\N	6925	\N
28875	generic_day	3	24369	f	2014-12-09	2933	\N	6925	\N
28876	generic_day	3	24370	f	2014-12-04	2933	\N	6925	\N
28877	generic_day	3	24369	f	2014-12-10	2933	\N	6925	\N
28878	generic_day	3	9969	f	2014-12-19	2933	\N	6925	\N
28879	generic_day	3	24369	f	2014-12-11	2933	\N	6925	\N
28880	generic_day	3	24369	f	2014-12-12	2933	\N	6925	\N
28881	generic_day	3	24369	f	2014-12-16	2933	\N	6925	\N
28882	generic_day	3	24923	f	2014-12-17	2931	\N	6924	\N
28883	generic_day	3	17723	f	2014-12-12	2931	\N	6924	\N
28884	generic_day	3	17723	f	2014-12-05	2931	\N	6924	\N
28885	generic_day	3	24923	f	2014-12-18	2931	\N	6924	\N
28886	generic_day	3	24923	f	2014-12-15	2931	\N	6924	\N
28887	generic_day	3	24923	f	2014-12-10	2931	\N	6924	\N
28888	generic_day	3	24923	f	2014-12-16	2931	\N	6924	\N
28889	generic_day	3	24924	f	2014-12-03	2931	\N	6924	\N
28890	generic_day	3	17722	f	2014-12-19	2931	\N	6924	\N
28891	generic_day	3	24923	f	2014-12-11	2931	\N	6924	\N
28892	generic_day	3	10524	f	2014-12-02	2931	\N	6924	\N
28893	generic_day	3	24923	f	2014-12-09	2931	\N	6924	\N
28894	generic_day	3	24923	f	2014-12-04	2931	\N	6924	\N
28895	specific_day	3	13091	f	2014-12-03	2935	12769	\N	\N
28896	specific_day	3	13091	f	2014-12-05	2935	12769	\N	\N
28897	specific_day	3	13091	f	2014-12-16	2935	12769	\N	\N
28898	specific_day	3	13091	f	2014-12-09	2935	12769	\N	\N
28899	specific_day	3	13091	f	2014-12-12	2935	12769	\N	\N
28900	specific_day	3	13090	f	2014-12-18	2935	12769	\N	\N
28901	specific_day	3	13091	f	2014-12-04	2935	12769	\N	\N
28902	specific_day	3	13091	f	2014-12-17	2935	12769	\N	\N
28903	specific_day	3	13091	f	2014-12-15	2935	12769	\N	\N
28904	specific_day	3	13091	f	2014-12-10	2935	12769	\N	\N
28905	specific_day	3	13091	f	2014-12-11	2935	12769	\N	\N
25766	specific_day	5	0	f	2014-11-22	2966	12807	\N	\N
25806	specific_day	5	0	f	2014-10-25	2966	12807	\N	\N
25752	specific_day	5	0	f	2014-10-05	2966	12807	\N	\N
25741	specific_day	5	0	f	2014-10-18	2966	12807	\N	\N
25772	specific_day	5	14400	f	2014-08-05	2966	12807	\N	\N
25802	specific_day	5	14400	f	2014-08-14	2966	12807	\N	\N
25792	specific_day	5	14400	f	2014-12-02	2966	12807	\N	\N
25822	specific_day	5	14400	f	2014-11-06	2966	12807	\N	\N
25793	specific_day	5	0	f	2014-11-30	2966	12807	\N	\N
25757	specific_day	5	0	f	2014-11-23	2966	12807	\N	\N
25786	specific_day	5	14400	f	2014-08-04	2966	12807	\N	\N
25821	specific_day	5	14400	f	2014-10-09	2966	12807	\N	\N
25725	specific_day	5	14400	f	2014-11-05	2966	12807	\N	\N
25739	specific_day	5	0	f	2014-09-26	2966	12807	\N	\N
25751	specific_day	5	14400	f	2014-09-02	2966	12807	\N	\N
25819	specific_day	5	0	f	2014-10-11	2966	12807	\N	\N
25790	specific_day	5	0	f	2014-11-29	2966	12807	\N	\N
25727	specific_day	5	14400	f	2014-10-16	2966	12807	\N	\N
25823	specific_day	5	14400	f	2014-12-22	2966	12807	\N	\N
25814	specific_day	5	14400	f	2014-10-23	2966	12807	\N	\N
25732	specific_day	5	7200	f	2014-08-01	2966	12807	\N	\N
25717	specific_day	5	14400	f	2014-11-12	2966	12807	\N	\N
25776	specific_day	5	14400	f	2014-09-04	2966	12807	\N	\N
25715	specific_day	5	14400	f	2014-09-11	2966	12807	\N	\N
25737	specific_day	5	14400	f	2014-10-06	2966	12807	\N	\N
25735	specific_day	5	14400	f	2014-12-01	2966	12807	\N	\N
25748	specific_day	5	14400	f	2014-08-19	2966	12807	\N	\N
25809	specific_day	5	0	f	2014-08-30	2966	12807	\N	\N
25768	specific_day	5	14400	f	2014-09-10	2966	12807	\N	\N
25808	specific_day	5	0	f	2014-08-02	2966	12807	\N	\N
25797	specific_day	5	7200	f	2014-08-29	2966	12807	\N	\N
25810	specific_day	5	0	f	2014-09-21	2966	12807	\N	\N
25738	specific_day	5	7200	f	2014-11-28	2966	12807	\N	\N
25744	specific_day	5	14400	f	2014-10-08	2966	12807	\N	\N
25747	specific_day	5	0	f	2014-09-22	2966	12807	\N	\N
25826	specific_day	5	14400	f	2014-11-25	2966	12807	\N	\N
25789	specific_day	5	14400	f	2014-10-29	2966	12807	\N	\N
25750	specific_day	5	0	f	2014-08-03	2966	12807	\N	\N
25773	specific_day	5	14400	f	2014-09-16	2966	12807	\N	\N
25769	specific_day	5	14400	f	2014-11-27	2966	12807	\N	\N
25818	specific_day	5	14400	f	2014-08-26	2966	12807	\N	\N
25719	specific_day	5	14400	f	2014-11-10	2966	12807	\N	\N
25824	specific_day	5	0	f	2014-09-14	2966	12807	\N	\N
25807	specific_day	5	0	f	2014-12-13	2966	12807	\N	\N
25716	specific_day	5	0	f	2014-08-23	2966	12807	\N	\N
25813	specific_day	5	7200	f	2014-09-12	2966	12807	\N	\N
25726	specific_day	5	14400	f	2014-08-20	2966	12807	\N	\N
25779	specific_day	5	7200	f	2014-11-07	2966	12807	\N	\N
25771	specific_day	5	0	f	2014-08-17	2966	12807	\N	\N
25743	specific_day	5	0	f	2014-08-31	2966	12807	\N	\N
25745	specific_day	5	14400	f	2014-12-11	2966	12807	\N	\N
25815	specific_day	5	0	f	2014-11-01	2966	12807	\N	\N
25791	specific_day	5	14400	f	2014-09-09	2966	12807	\N	\N
25774	specific_day	5	0	f	2014-09-29	2966	12807	\N	\N
25782	specific_day	5	14400	f	2014-08-18	2966	12807	\N	\N
25753	specific_day	5	14400	f	2014-08-28	2966	12807	\N	\N
25730	specific_day	5	7200	f	2014-09-05	2966	12807	\N	\N
25784	specific_day	5	0	f	2014-09-13	2966	12807	\N	\N
25799	specific_day	5	14400	f	2014-12-18	2966	12807	\N	\N
25770	specific_day	5	0	f	2014-12-06	2966	12807	\N	\N
25728	specific_day	5	0	f	2014-10-12	2966	12807	\N	\N
25780	specific_day	5	0	f	2014-09-25	2966	12807	\N	\N
25740	specific_day	5	14400	f	2014-11-19	2966	12807	\N	\N
25742	specific_day	5	7200	f	2014-08-08	2966	12807	\N	\N
25812	specific_day	5	14400	f	2014-10-07	2966	12807	\N	\N
25760	specific_day	5	0	f	2014-12-05	2966	12807	\N	\N
25778	specific_day	5	0	f	2014-12-20	2966	12807	\N	\N
25754	specific_day	5	14400	f	2014-09-01	2966	12807	\N	\N
25767	specific_day	5	0	f	2014-10-04	2966	12807	\N	\N
25762	specific_day	5	14400	f	2014-10-15	2966	12807	\N	\N
25729	specific_day	5	0	f	2014-08-15	2966	12807	\N	\N
25775	specific_day	5	7200	f	2014-12-12	2966	12807	\N	\N
25796	specific_day	5	14400	f	2014-11-26	2966	12807	\N	\N
25816	specific_day	5	14400	f	2014-11-04	2966	12807	\N	\N
25718	specific_day	5	0	f	2014-09-06	2966	12807	\N	\N
25798	specific_day	5	14400	f	2014-11-03	2966	12807	\N	\N
25758	specific_day	5	0	f	2014-12-08	2966	12807	\N	\N
25805	specific_day	5	14400	f	2014-09-03	2966	12807	\N	\N
25781	specific_day	5	14400	f	2014-10-01	2966	12807	\N	\N
25764	specific_day	5	14400	f	2014-08-06	2966	12807	\N	\N
25724	specific_day	5	14400	f	2014-10-20	2966	12807	\N	\N
25756	specific_day	5	14400	f	2014-10-21	2966	12807	\N	\N
25788	specific_day	5	7200	f	2014-10-24	2966	12807	\N	\N
25759	specific_day	5	14400	f	2014-08-25	2966	12807	\N	\N
25811	specific_day	5	14400	f	2014-10-22	2966	12807	\N	\N
25804	specific_day	5	0	f	2014-11-15	2966	12807	\N	\N
25736	specific_day	5	0	f	2014-09-30	2966	12807	\N	\N
25734	specific_day	5	14400	f	2014-10-02	2966	12807	\N	\N
25828	specific_day	5	0	f	2014-08-10	2966	12807	\N	\N
25827	specific_day	5	0	f	2014-08-16	2966	12807	\N	\N
25820	specific_day	5	0	f	2014-09-27	2966	12807	\N	\N
25720	specific_day	5	7200	f	2014-08-22	2966	12807	\N	\N
25787	specific_day	5	14400	f	2014-08-11	2966	12807	\N	\N
25721	specific_day	5	0	f	2014-09-20	2966	12807	\N	\N
25749	specific_day	5	0	f	2014-12-21	2966	12807	\N	\N
25755	specific_day	5	0	f	2014-09-17	2966	12807	\N	\N
25825	specific_day	5	7200	f	2014-11-21	2966	12807	\N	\N
25777	specific_day	5	0	f	2014-10-13	2966	12807	\N	\N
25783	specific_day	5	14400	f	2014-11-24	2966	12807	\N	\N
25733	specific_day	5	14400	f	2014-11-11	2966	12807	\N	\N
25761	specific_day	5	0	f	2014-08-09	2966	12807	\N	\N
25800	specific_day	5	14400	f	2014-11-17	2966	12807	\N	\N
25817	specific_day	5	7200	f	2014-12-19	2966	12807	\N	\N
25763	specific_day	5	7200	f	2014-10-17	2966	12807	\N	\N
25803	specific_day	5	0	f	2014-10-26	2966	12807	\N	\N
25746	specific_day	5	14400	f	2014-12-16	2966	12807	\N	\N
25785	specific_day	5	0	f	2014-09-19	2966	12807	\N	\N
25731	specific_day	5	14400	f	2014-12-10	2966	12807	\N	\N
25795	specific_day	5	7200	f	2014-11-14	2966	12807	\N	\N
25723	specific_day	5	0	f	2014-09-23	2966	12807	\N	\N
25765	specific_day	5	14400	f	2014-12-09	2966	12807	\N	\N
25801	specific_day	5	14400	f	2014-08-07	2966	12807	\N	\N
25794	specific_day	5	14400	f	2014-10-30	2966	12807	\N	\N
25722	specific_day	5	14400	f	2014-11-18	2966	12807	\N	\N
25856	generic_day	5	19862	f	2014-08-21	2970	\N	6879	\N
25831	generic_day	5	19862	f	2014-08-18	2970	\N	6879	\N
25847	generic_day	5	19862	f	2014-08-22	2970	\N	6879	\N
25836	generic_day	5	19862	f	2014-08-11	2970	\N	6879	\N
25851	generic_day	5	19862	f	2014-09-04	2970	\N	6879	\N
25852	generic_day	5	19862	f	2014-08-25	2970	\N	6879	\N
25829	generic_day	5	19862	f	2014-08-20	2970	\N	6879	\N
25833	generic_day	5	19862	f	2014-08-06	2970	\N	6879	\N
25832	generic_day	5	19862	f	2014-08-27	2970	\N	6879	\N
25846	generic_day	5	19862	f	2014-08-07	2970	\N	6879	\N
25845	generic_day	5	19862	f	2014-09-09	2970	\N	6879	\N
25841	generic_day	5	19862	f	2014-08-28	2970	\N	6879	\N
25835	generic_day	5	19862	f	2014-08-14	2970	\N	6879	\N
25840	generic_day	5	19862	f	2014-08-12	2970	\N	6879	\N
25854	generic_day	5	19862	f	2014-09-01	2970	\N	6879	\N
25843	generic_day	5	19862	f	2014-09-10	2970	\N	6879	\N
25830	generic_day	5	19862	f	2014-09-02	2970	\N	6879	\N
25850	generic_day	5	19862	f	2014-09-08	2970	\N	6879	\N
25839	generic_day	5	19862	f	2014-08-29	2970	\N	6879	\N
25837	generic_day	5	19862	f	2014-09-11	2970	\N	6879	\N
25838	generic_day	5	19862	f	2014-09-03	2970	\N	6879	\N
25834	generic_day	5	19862	f	2014-08-05	2970	\N	6879	\N
25853	generic_day	5	19862	f	2014-08-26	2970	\N	6879	\N
25842	generic_day	5	19862	f	2014-09-05	2970	\N	6879	\N
25855	generic_day	5	19863	f	2014-08-04	2970	\N	6879	\N
25844	generic_day	5	19862	f	2014-08-08	2970	\N	6879	\N
25857	generic_day	5	19862	f	2014-08-19	2970	\N	6879	\N
25848	generic_day	5	19863	f	2014-08-01	2970	\N	6879	\N
25849	generic_day	5	19862	f	2014-08-13	2970	\N	6879	\N
16770	specific_day	8	7200	f	2014-10-09	2972	12740	\N	\N
16769	specific_day	8	7200	f	2014-09-30	2972	12740	\N	\N
16771	specific_day	8	7200	f	2014-10-07	2972	12740	\N	\N
16768	specific_day	8	7200	f	2014-10-03	2972	12740	\N	\N
16766	specific_day	8	7200	f	2014-10-08	2972	12740	\N	\N
16774	specific_day	8	7200	f	2014-10-14	2972	12740	\N	\N
16772	specific_day	8	7200	f	2014-09-29	2972	12740	\N	\N
16775	specific_day	8	7200	f	2014-10-22	2972	12740	\N	\N
16773	specific_day	8	7200	f	2014-10-20	2972	12740	\N	\N
16459	specific_day	8	7200	f	2014-10-10	2972	12740	\N	\N
16777	specific_day	8	7200	f	2014-10-17	2972	12740	\N	\N
16776	specific_day	8	7200	f	2014-10-15	2972	12740	\N	\N
16767	specific_day	8	7200	f	2014-10-01	2972	12740	\N	\N
16458	specific_day	8	7200	f	2014-09-26	2972	12740	\N	\N
16457	specific_day	8	7200	f	2014-10-21	2972	12740	\N	\N
16460	specific_day	8	7200	f	2014-10-06	2972	12740	\N	\N
25866	generic_day	5	28800	f	2014-11-18	2977	\N	24368	\N
25860	generic_day	5	28800	f	2014-11-14	2977	\N	24368	\N
25875	generic_day	5	28800	f	2014-11-17	2977	\N	24368	\N
25862	generic_day	5	28800	f	2014-11-24	2977	\N	24368	\N
25874	generic_day	5	28800	f	2014-11-20	2977	\N	24368	\N
25859	generic_day	5	28800	f	2014-11-10	2977	\N	24368	\N
25867	generic_day	5	28800	f	2014-11-07	2977	\N	24368	\N
25861	generic_day	5	28800	f	2014-10-28	2977	\N	24368	\N
25876	generic_day	5	28800	f	2014-11-25	2977	\N	24368	\N
25864	generic_day	5	28800	f	2014-12-01	2977	\N	24368	\N
25873	generic_day	5	28800	f	2014-11-05	2977	\N	24368	\N
25868	generic_day	5	28800	f	2014-10-31	2977	\N	24368	\N
25858	generic_day	5	28800	f	2014-10-30	2977	\N	24368	\N
25869	generic_day	5	28800	f	2014-11-04	2977	\N	24368	\N
25872	generic_day	5	28800	f	2014-11-26	2977	\N	24368	\N
25870	generic_day	5	14400	f	2014-12-02	2977	\N	24368	\N
25863	generic_day	5	28800	f	2014-11-21	2977	\N	24368	\N
25865	generic_day	5	28800	f	2014-11-27	2977	\N	24368	\N
25871	generic_day	5	28800	f	2014-11-19	2977	\N	24368	\N
25905	generic_day	5	26400	f	2014-12-04	2970	\N	24370	\N
25901	generic_day	5	26400	f	2014-12-09	2970	\N	24370	\N
25906	generic_day	5	26400	f	2014-12-12	2970	\N	24370	\N
25903	generic_day	5	12000	f	2014-12-19	2970	\N	24370	\N
25902	generic_day	5	12000	f	2014-12-02	2970	\N	24370	\N
25898	generic_day	5	26400	f	2014-12-18	2970	\N	24370	\N
\.


--
-- Data for Name: deadline_communication; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY deadline_communication (id, version, save_date, deliver_date, order_id) FROM stdin;
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
1802271	7	12335	12337	\N	0
1802272	7	12337	12368	\N	0
1802273	7	12336	12340	\N	0
1802274	7	12340	12341	\N	0
1802275	7	12368	12372	\N	0
1802240	5	4041	4042	\N	0
1802241	5	4094	4095	\N	0
1802289	8	12363	12366	\N	0
1802291	8	12364	12365	\N	1
1802325	20	18520	15422	\N	0
1802404	10	15422	23846	\N	0
1802406	9	15419	15420	\N	1
1802327	20	15420	15421	\N	0
1802405	10	23846	15424	\N	0
1802287	17	12386	12421	\N	0
1802303	15	12421	15405	\N	0
1802304	15	15365	12404	\N	1
1802305	15	12404	15366	\N	0
1802306	15	15405	15387	\N	0
1802264	11	4109	4137	\N	0
1802402	5	4137	23845	\N	0
1802266	11	7870	4136	\N	1
1802267	11	7870	7871	\N	0
1802403	5	23845	12371	\N	0
1802317	8	15401	15411	\N	0
1802318	8	15411	15433	\N	0
1802319	8	15360	15361	\N	0
1802320	8	15361	15367	\N	0
1802321	8	15433	15434	\N	0
1802281	14	12409	12413	\N	0
1802381	8	12413	15413	\N	0
1802283	14	12410	12411	\N	0
1802284	14	12411	12412	\N	0
1802382	8	15413	12422	\N	0
\.


--
-- Data for Name: derived_allocation; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY derived_allocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
\.


--
-- Data for Name: derived_day_assignments_container; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY derived_day_assignments_container (id, version, derived_allocation_id, scenario) FROM stdin;
\.


--
-- Data for Name: description_values; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY description_values (description_value_id, fieldname, value) FROM stdin;
\.


--
-- Data for Name: description_values_in_line; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY description_values_in_line (description_value_id, field_name, value) FROM stdin;
\.


--
-- Data for Name: direct_advance_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY direct_advance_assignment (advance_assignment_id, direct_order_element_id, max_value) FROM stdin;
14539	14679	100.00
14540	14680	100.00
14541	14682	100.00
14542	14683	100.00
14543	14684	100.00
14849	14686	100.00
14850	14687	100.00
14851	14688	100.00
15291	14989	100.00
16142	16608	100.00
17277	16659	100.00
16088	16219	100.00
16108	16260	100.00
16156	16250	100.00
4183	12031	100.00
4141	3650	100.00
4142	3652	100.00
4143	3653	100.00
4148	3674	100.00
4149	3675	100.00
16152	16622	100.00
16143	16609	100.00
16153	16623	100.00
17274	16653	100.00
4233	13319	100.00
17280	20842	100.00
4234	13320	100.00
15312	15470	100.00
14534	14670	100.00
15313	15471	100.00
15288	14988	100.00
15342	15521	100.00
16091	16221	100.00
4155	5907	100.00
4156	5908	100.00
17281	20844	100.00
17282	20845	100.00
17283	20846	100.00
17286	20849	100.00
4178	7217	100.00
4181	11696	100.00
4182	11697	100.00
4184	12041	100.00
4205	13234	100.00
4206	13235	100.00
4207	13236	100.00
4187	12555	100.00
4190	12557	100.00
4191	12589	100.00
4194	12613	100.00
4195	12614	100.00
4204	13231	100.00
4208	13266	100.00
4196	12620	100.00
4197	12621	100.00
4198	12623	100.00
4199	12624	100.00
15332	15496	100.00
15336	15512	100.00
15337	15513	100.00
16072	16202	100.00
16073	16203	100.00
14535	14674	100.00
16112	16568	100.00
15299	15045	100.00
15300	15046	100.00
15317	15477	100.00
17278	17557	100.00
17279	17561	100.00
\.


--
-- Data for Name: end_date_communication; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY end_date_communication (id, version, save_date, end_date, communication_date, order_id, subcontracted_task_data_id) FROM stdin;
\.


--
-- Data for Name: entity_sequence; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY entity_sequence (id, version, entity_name, prefix, last_value, number_of_digits, active) FROM stdin;
111	16	10	WORKREPORTTYPE	3	4	t
108	18	7	WORK_HOURS_TYPE	2	4	t
109	16	8	MATERIAL_CATEGORY	1	4	t
110	14	9	WORK_REPORT	0	4	t
106	26	5	UNIT_TYPE	8	4	t
113	11	12	COST_CATEGORY	0	4	t
117	7	16	EXPENSE_SHEET	0	4	t
103	32	2	LABEL	11	4	t
104	21	3	MACHINE	1	4	t
115	66	14	CRITERION_SATISFACTION	57	4	t
102	42	1	CRITERION	20	4	t
112	22	11	CALENDAR_EXCEPTION_TYPE	10	4	t
107	48	6	CALENDAR	32	4	t
105	62	4	WORKER	43	4	t
116	9	15	RESOURCE_COST_CATEGORY_ASSIGNMENT	1	4	t
114	61	13	RESOURCE_CALENDAR	51	4	t
101	34	0	ORDER	11	4	t
\.


--
-- Data for Name: expense_sheet; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY expense_sheet (id, version, code, code_autogenerated, first_expense, last_expense, total, description, last_expense_sheet_line_sequence_code, personal) FROM stdin;
\.


--
-- Data for Name: expense_sheet_line; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY expense_sheet_line (id, version, code, value, concept, date, order_element_id, resource_id, expense_sheet_id) FROM stdin;
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY external_company (id, version, name, nif, client, subcontractor, interacts_with_applications, app_uri, our_company_login, our_company_password, company_user) FROM stdin;
\.


--
-- Data for Name: generic_day_assignments_container; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY generic_day_assignments_container (id, version, resource_allocation_id, scenario, start_date, duration_start_in_first_day, end_date, duration_in_last_day) FROM stdin;
6876	3	6775	1010	2014-04-16	0	2014-04-25	0
6895	6	6814	1010	2014-08-01	0	2014-09-12	0
6906	5	6837	1010	2014-08-01	0	2014-09-12	0
6955	4	21962	1010	2014-08-01	0	2014-08-29	0
6956	4	21963	1010	2014-08-29	0	2014-09-12	0
24385	3	25590	1010	2014-08-29	0	2014-09-12	0
6967	16	21981	1010	2014-08-01	0	2014-09-12	0
24367	12	25559	1010	2014-09-12	0	2014-09-26	0
24363	14	25553	1010	2014-09-12	0	2014-09-26	0
24383	9	25586	1010	2014-10-24	0	2014-12-02	14400
24388	5	25598	1010	2014-12-02	14400	2014-12-19	14400
24389	5	25599	1010	2014-12-02	14400	2014-12-19	14400
6891	13	6810	1010	2014-08-01	0	2014-09-12	0
6892	13	6811	1010	2014-09-12	0	2014-09-26	0
6893	13	6812	1010	2014-09-12	0	2014-09-26	0
6907	12	6840	1010	2014-10-24	0	2014-12-02	14400
24364	4	25554	1010	2014-08-01	0	2014-09-12	0
24365	4	25555	1010	2014-09-12	0	2014-09-26	0
24366	4	25556	1010	2014-09-26	0	2014-10-10	0
6921	8	6863	1010	2014-08-01	0	2014-09-12	0
6922	8	6864	1010	2014-09-12	0	2014-09-26	0
6923	8	6865	1010	2014-09-26	0	2014-10-10	0
24342	8	21986	1010	2014-11-07	0	2014-12-18	14400
24360	6	22013	1010	2014-12-18	14400	2015-01-06	14400
24359	6	22012	1010	2014-12-18	14400	2015-01-06	14400
6925	10	6867	1010	2014-12-02	14400	2014-12-19	14400
6924	10	6866	1010	2014-12-02	14400	2014-12-19	14400
6879	9	6789	1010	2014-08-01	0	2014-09-12	0
6880	9	6790	1010	2014-09-12	0	2014-09-26	0
6882	8	6794	1010	2014-09-12	0	2014-09-26	0
24368	5	25561	1010	2014-10-24	0	2014-12-02	14400
24369	5	25562	1010	2014-12-02	14400	2014-12-19	14400
24370	5	25563	1010	2014-12-02	14400	2014-12-19	14400
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY generic_resource_allocation (resource_allocation_id, resource_type) FROM stdin;
6775	0
25590	0
6814	0
6837	0
21962	0
21963	0
21981	0
25559	0
25553	0
25586	0
25598	0
25599	0
6810	0
25554	0
25555	0
25556	0
6863	0
6864	0
6865	0
6811	0
6812	0
6840	0
6867	0
21986	0
22013	0
22012	0
6866	0
6789	0
6790	0
6794	0
25561	0
25562	0
25563	0
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY hibernate_unique_key (next_hi) FROM stdin;
287
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY hour_cost (id, version, code, price_cost, init_date, end_date, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hours_group; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY hours_group (id, version, code, resource_type, working_hours, percentage, fixed_percentage, parent_order_line, order_line_template) FROM stdin;
13130	11	ORDER0003-0001-0001	WORKER	320	1.00	f	12620	\N
14580	15	ORDER0008-0001-0001	WORKER	320	1.00	f	14674	\N
13131	11	ORDER0003-0002-0001	WORKER	160	1.00	f	12621	\N
13132	11	ORDER0003-0004-0001	WORKER	80	1.00	f	12623	\N
16516	31	ORDER0010-0002	WORKER	320	1.00	f	16608	\N
3942	9	ORDER0001-0001-0001	WORKER	100	1.00	f	3650	\N
3943	9	ORDER0001-0003-0001	WORKER	60	1.00	f	3652	\N
3944	9	ORDER0001-0004-0001	WORKER	40	1.00	f	3653	\N
3962	7	ORDER0001-0006-0001	WORKER	100	1.00	f	3674	\N
3963	7	ORDER0001-0007-0001	WORKER	100	1.00	f	3675	\N
12519	12	ORDER0004-0005-0001	WORKER	80	1.00	f	12613	\N
11945	3	ORDER0001-0008-0001	WORKER	40	1.00	f	12031	\N
12520	12	ORDER0004-0006-0001	WORKER	160	1.00	f	12614	\N
16553	24	ORDER0010-0001	WORKER	160	1.00	f	16659	\N
13133	11	ORDER0003-0005-0001	WORKER	80	1.00	f	12624	\N
13134	11	ORDER0004-0008-0001	WORKER	100	1.00	f	13232	\N
13142	9	ORDER0004-0009-0001	WORKER	40	1.00	f	13243	\N
13143	9	ORDER0004-0010-0001	WORKER	80	1.00	f	13244	\N
15246	10	ORDER0003-0006-0001	WORKER	160	1.00	f	15496	\N
15947	36	ORDER0010-0007-0001	WORKER	80	1.00	f	16219	\N
15864	9	ORDER0003-0008-0001	WORKER	100	1.00	f	15512	\N
14584	17	ORDER0009-0001-0001	WORKER	320	1.00	f	14679	\N
15865	9	ORDER0003-0009-0001	WORKER	40	1.00	f	15513	\N
13160	9	ORDER0004-0011-0001	WORKER	160	1.00	f	13266	\N
5826	15	ORDER0005-0001-0001	WORKER	320	1.00	f	5907	\N
5827	15	ORDER0005-0002-0001	WORKER	160	1.00	f	5908	\N
14585	17	ORDER0009-0002-0001	WORKER	160	1.00	f	14680	\N
16491	13	ORDER0008-0002	WORKER	160	1.00	f	16568	\N
15938	8	ORDER0003-0011-0001	WORKER	80	1.00	f	16202	\N
15207	15	ORDER0008-0003-0001	WORKER	80	1.00	f	15045	\N
7401	15	ORDER0005-0004-0001	WORKER	80	1.00	f	7217	\N
11509	12	ORDER0005-0006-0001	WORKER	80	1.00	f	11696	\N
15939	8	ORDER0003-0010-0001	WORKER	160	1.00	f	16203	\N
14586	17	ORDER0009-0005-0001	WORKER	80	1.00	f	14682	\N
14587	17	ORDER0009-0006-0001	WORKER	80	1.00	f	14683	\N
14588	17	ORDER0009-0007-0001	WORKER	160	1.00	f	14684	\N
13194	23	ORDER0007-0001-0001	WORKER	320	1.00	f	13319	\N
13195	23	ORDER0007-0002-0001	WORKER	160	1.00	f	13320	\N
15225	20	ORDER0007-0005	WORKER	80	1.00	f	15470	\N
14577	22	ORDER0007-0004-0002	WORKER	80	1.00	f	14670	\N
15226	20	ORDER0007-0007-0001	WORKER	160	1.00	f	15471	\N
15172	21	ORDER0007-0008-0003	WORKER	40	1.00	f	14988	\N
15870	18	ORDER0007-0009-0001	WORKER	100	1.00	f	15520	\N
15871	18	ORDER0007-0010-0001	WORKER	80	1.00	f	15521	\N
16486	35	ORDER0010-0006	WORKER	80	1.00	f	16260	\N
15208	15	ORDER0008-0004-0001	WORKER	80	1.00	f	15046	\N
15231	13	ORDER0008-0005-0001	WORKER	160	1.00	f	15477	\N
11510	12	ORDER0005-0007-0001	WORKER	160	1.00	f	11697	\N
12463	15	ORDER0004-0001-0001	WORKER	320	1.00	f	12555	\N
12465	14	ORDER0004-0002-0001	WORKER	160	1.00	f	12557	\N
12495	13	ORDER0004-0004-0001	WORKER	80	1.00	f	12589	\N
16476	34	ORDER0010-0008-0001	WORKER	160	1.00	f	16250	\N
15949	17	ORDER0007-0011-0001	WORKER	160	1.00	f	16221	\N
16525	29	ORDER0010-0013-0001	WORKER	100	1.00	f	16622	\N
11950	11	ORDER0005-0009-0001	WORKER	100	1.00	f	12041	\N
13135	11	ORDER0005-0011-0001	WORKER	40	1.00	f	13234	\N
14589	17	ORDER0009-0008-0001	WORKER	100	1.00	f	14686	\N
14590	17	ORDER0009-0009-0001	WORKER	40	1.00	f	14687	\N
14591	17	ORDER0009-0010-0001	WORKER	80	1.00	f	14688	\N
13136	11	ORDER0005-0012-0001	WORKER	80	1.00	f	13235	\N
15173	16	ORDER0009-0011-0001	WORKER	160	1.00	f	14989	\N
13137	11	ORDER0005-0010-0001	WORKER	160	1.00	f	13236	\N
16517	31	ORDER0010-0012-0002	WORKER	40	1.00	f	16609	\N
16526	29	ORDER0010-0014-0001	WORKER	80	1.00	f	16623	\N
16547	24	ORDER0010-0016-0001	WORKER	160	1.00	f	16653	\N
17837	9	ORDER0008-0009-0001	WORKER	100	1.00	f	17558	\N
17838	9	ORDER0008-0010-0001	WORKER	40	1.00	f	17559	\N
17839	9	ORDER0008-0011-0001	WORKER	80	1.00	f	17560	\N
17840	9	ORDER0008-0008-0001	WORKER	160	1.00	f	17561	\N
21015	3	ORDER0011-0001-0001	WORKER	320	1.00	f	20841	\N
21016	3	ORDER0011-0002-0001	WORKER	160	1.00	f	20842	\N
21017	3	ORDER0011-0006-0001	WORKER	80	1.00	f	20844	\N
21018	3	ORDER0011-0007-0001	WORKER	80	1.00	f	20845	\N
21019	3	ORDER0011-0008-0001	WORKER	0	1.00	f	20846	\N
21020	3	ORDER0011-0010-0001	WORKER	40	1.00	f	20849	\N
21021	3	ORDER0011-0005-0001	WORKER	160	1.00	f	20850	\N
\.


--
-- Data for Name: indirect_advance_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY indirect_advance_assignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
4201	12622
4200	12622
15339	15511
15338	15511
4203	12034
4202	12034
16089	16218
16090	16218
4144	3651
4145	3651
4150	3673
4151	3673
4146	3639
4147	3639
16154	16621
16155	16621
15330	13310
15311	13310
15290	14987
15289	14987
15344	15519
15343	15519
4236	13238
4235	13238
4180	7216
4179	7216
4185	12040
4186	12040
17284	20843
17285	20843
17287	20848
17288	20848
17289	20847
17290	20847
17291	13825
17292	13825
4192	12588
4193	12588
4188	3643
4189	3643
4159	3646
4158	3646
16140	16585
16141	16585
14538	13286
14537	13286
14848	14681
14847	14681
14852	14685
14853	14685
14855	13268
14854	13268
\.


--
-- Data for Name: job_scheduler_configuration; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY job_scheduler_configuration (id, version, job_group, job_name, cron_expression, job_class_name, connector_name, schedule) FROM stdin;
\.


--
-- Name: job_scheduler_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: libreplan
--

SELECT pg_catalog.setval('job_scheduler_configuration_id_seq', 1, false);


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
909	1	LABEL0001-0001	Medium urgency	808
910	1	LABEL0001-0002	Low urgency	808
911	1	LABEL0001-0003	High urgency	808
2029	1	LABEL0002-0001	value 1	2121
2030	1	LABEL0002-0002	value 3	2121
2031	1	LABEL0002-0003	value 2	2121
2041	1	LABEL0004-0001	28-medium priority	2122
2042	1	LABEL0004-0002	28-haute priorité	2122
2043	1	LABEL0004-0003	28-basse priorité	2122
2053	1	LABEL0008-0001	22-medium urgency	2123
2054	1	LABEL0008-0002	22-low urgency	2123
2055	1	LABEL0008-0003	22-high urgency	2123
2067	1	LABEL0007-0001	24-medium urgency	2124
2068	1	LABEL0007-0002	24-low urgency	2124
2069	1	LABEL0007-0003	24-high urgency	2124
2078	1	LABEL0006-0001	27-pour-demain	2125
2079	1	LABEL0006-0002	27-pour-hier	2125
2080	1	LABEL0006-0003	27-pour-dans-un-mois	2125
2090	1	LABEL0009-0001	26-high urgency	2126
2091	1	LABEL0009-0002	26-medium urgency	2126
2092	1	LABEL0009-0003	26-low urgency	2126
2105	1	LABEL0010-0001	23-high urgency	2127
2106	1	LABEL0010-0002	23-low urgency	2127
2107	1	LABEL0010-0003	23-medium urgency	2127
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY label_type (id, version, code, name, code_autogenerated, last_label_sequence_code) FROM stdin;
808	1	LABEL0001	Priority	t	3
2121	1	LABEL0002	test label	t	3
2122	1	LABEL0004	28-priority	t	3
2123	1	LABEL0008	22-priority	t	3
2124	1	LABEL0007	24-priority	t	3
2125	1	LABEL0006	27-priorité	t	3
2126	1	LABEL0009	26-priority	t	3
2127	1	LABEL0010	23-prority	t	3
2128	1	LABEL0011	25-priority	t	0
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
3333	1	2980
\.


--
-- Data for Name: limiting_resource_queue_dependency; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY limiting_resource_queue_dependency (id, type, origin_queue_element_id, destiny_queue_element_id) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
709	Comment	255	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY machine (machine_id, name, description) FROM stdin;
2980	test	test
\.


--
-- Data for Name: machine_configuration_unit_required_criterions; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY machine_configuration_unit_required_criterions (id, criterion_id) FROM stdin;
\.


--
-- Data for Name: machine_worker_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY machine_worker_assignment (id, version, start_date, finish_date, configuration_id, worker_id) FROM stdin;
\.


--
-- Data for Name: machine_workers_configuration_unit; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY machine_workers_configuration_unit (id, version, name, alpha, machine) FROM stdin;
\.


--
-- Data for Name: manual_function; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY manual_function (assignment_function_id) FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY material (id, version, code, description, default_unit_price, unit_type, disabled, category_id) FROM stdin;
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
\.


--
-- Data for Name: material_assigment_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY material_assigment_template (id, version, units, unit_price, material_id, order_element_template_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY material_category (id, version, code, name, code_autogenerated, last_material_sequence_code, parent_id) FROM stdin;
1616	1	MATERIAL_CATEGORY0001	Imported materials without category	t	0	\N
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_authorization (id, order_authorization_subclass, version, authorization_type, order_id, user_id, profile_id) FROM stdin;
\.


--
-- Data for Name: order_element; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_element (id, version, name, description, code, init_date, deadline, last_advance_meausurement_for_spreading, dirty_last_advance_measurement_for_spreading, parent, template, external_code, position_in_container) FROM stdin;
13268	17	28-Building a house	\N	ORDER0009	2014-08-01 14:48:36.086+02	2014-12-31 00:00:00+01	0.00	t	\N	\N	\N	\N
11696	12	3.2.-24-place windows	\N	ORDER0005-0006	\N	\N	0.00	f	7216	\N	\N	1
13320	23	22-select builder	\N	ORDER0007-0002	\N	\N	0.00	f	13238	\N	\N	1
15470	20	22-build walls	\N	ORDER0007-0005	\N	\N	0.00	f	14987	\N	\N	0
14989	16	5.28-move in	\N	ORDER0009-0011	\N	\N	0.00	f	13268	\N	\N	4
11697	12	3.3.-24-install plumbing	\N	ORDER0005-0007	\N	\N	0.00	f	7216	\N	\N	2
12040	11	4.-24-finalize house	\N	ORDER0005-0008	\N	\N	0.00	f	3646	\N	\N	3
3639	9	test project	\N	ORDER0001	2014-04-16 14:16:22.526+02	\N	0.00	t	\N	\N	\N	\N
3650	9	task 1	\N	ORDER0001-0001	\N	\N	0.00	f	3639	\N	\N	0
3651	9	task container	\N	ORDER0001-0002	\N	\N	0.00	f	3639	\N	\N	1
3652	9	task 3	\N	ORDER0001-0003	\N	\N	0.00	f	3651	\N	\N	0
3653	9	task 4	\N	ORDER0001-0004	\N	\N	0.00	f	3651	\N	\N	1
3673	7	task 2 container	\N	ORDER0001-0005	\N	\N	0.00	f	3639	\N	\N	2
3674	7	task 5	\N	ORDER0001-0006	\N	\N	0.00	f	3673	\N	\N	0
3675	7	task 6	\N	ORDER0001-0007	\N	\N	0.00	f	3673	\N	\N	1
14670	22	22-place windows	\N	ORDER0007-0004	\N	\N	0.00	f	14987	\N	\N	1
12031	3	demo task	\N	ORDER0001-0008	\N	\N	0.00	t	3639	\N	\N	3
15471	20	22-install plumbing	\N	ORDER0007-0007	\N	\N	0.00	f	14987	\N	\N	2
12041	11	4.1.-24-close roof	\N	ORDER0005-0009	\N	\N	0.00	f	12040	\N	\N	0
13234	11	4.2.-24-install electrical system	\N	ORDER0005-0011	\N	\N	0.00	f	12040	\N	\N	1
3646	15	24-Building a house	\N	ORDER0005	2014-08-01 14:19:39.894+02	2014-12-31 00:00:00+01	0.00	f	\N	\N	\N	\N
12034	11	26-Building house	\N	ORDER0003	2014-08-01 14:16:44.623+02	2014-12-31 00:00:00+01	0.00	t	\N	\N	\N	\N
12620	11	26-manage project	\N	ORDER0003-0001	\N	\N	0.00	f	12034	\N	\N	0
3643	15	21-Building a house	\N	ORDER0004	2014-08-01 14:16:55.137+02	2014-12-31 00:00:00+01	0.00	t	\N	\N	\N	\N
12555	15	21-manage project	\N	ORDER0004-0001	\N	\N	0.00	f	3643	\N	\N	0
12557	14	21-select builder	\N	ORDER0004-0002	\N	\N	0.00	f	3643	\N	\N	1
12588	13	21-build the house	\N	ORDER0004-0003	\N	\N	0.00	f	3643	\N	\N	2
12589	13	21-build walls	\N	ORDER0004-0004	\N	\N	0.00	f	12588	\N	\N	0
5907	15	1.-24-manage project	\N	ORDER0005-0001	\N	\N	0.00	f	3646	\N	\N	0
13310	42	23-Building a house	\N	ORDER0010	2014-08-01 14:49:25.635+02	2014-12-31 00:00:00+01	0.00	f	\N	\N	\N	\N
13238	23	22-buildinG dah house	\N	ORDER0007	2014-08-01 14:46:00.406+02	2014-12-31 00:00:00+01	0.00	f	\N	\N	\N	\N
12621	11	26-select builder	\N	ORDER0003-0002	\N	\N	0.00	f	12034	\N	\N	1
12622	11	26-build the house	\N	ORDER0003-0003	\N	\N	0.00	f	12034	\N	\N	2
12623	11	26-build walls	\N	ORDER0003-0004	\N	\N	0.00	f	12622	\N	\N	0
12624	11	26-place windoows	\N	ORDER0003-0005	\N	\N	0.00	f	12622	\N	\N	1
15511	9	26-finalize house	\N	ORDER0003-0007	\N	\N	0.00	f	12034	\N	\N	3
13235	11	4.3.-24-install toilet	\N	ORDER0005-0012	\N	\N	0.00	f	12040	\N	\N	2
12613	12	21-place windows	\N	ORDER0004-0005	\N	\N	0.00	f	12588	\N	\N	1
12614	12	21-install plumbing	\N	ORDER0004-0006	\N	\N	0.00	f	12588	\N	\N	2
13286	15	27-ma-baraque	\N	ORDER0008	2014-08-01 14:48:34.022+02	2014-12-31 00:00:00+01	0.00	t	\N	\N	\N	\N
13319	23	22-manage project	\N	ORDER0007-0001	\N	\N	0.00	f	13238	\N	\N	0
5908	15	2.-24-select builder	\N	ORDER0005-0002	\N	\N	0.00	f	3646	\N	\N	1
7216	15	3.-24-build the house	\N	ORDER0005-0003	\N	\N	0.00	f	3646	\N	\N	2
14674	15	27-palabres	\N	ORDER0008-0001	\N	\N	0.00	f	13286	\N	\N	0
13825	3	25-Building a house	\N	ORDER0011	2014-06-03 14:51:03.976+02	2014-07-16 00:00:00+02	0.00	t	\N	\N	\N	\N
13231	11	21-finalize house	\N	ORDER0004-0007	\N	\N	0.00	f	3643	\N	\N	3
13232	11	21-close roof	\N	ORDER0004-0008	\N	\N	0.00	f	13231	\N	\N	0
13243	9	21-install electrical	\N	ORDER0004-0009	\N	\N	0.00	f	13231	\N	\N	1
13244	9	21-install toilet	\N	ORDER0004-0010	\N	\N	0.00	f	13231	\N	\N	2
7217	15	3.1.-24-build walls	\N	ORDER0005-0004	\N	\N	0.00	f	7216	\N	\N	0
13236	11	5.-24-move in	\N	ORDER0005-0010	\N	\N	0.00	f	3646	\N	\N	4
15045	15	27-another-brick-in-the-wall	\N	ORDER0008-0003	\N	\N	0.00	f	16585	\N	\N	0
15046	15	27-microsoft	\N	ORDER0008-0004	\N	\N	0.00	f	16585	\N	\N	1
15477	13	27-gaz-à-tous-les-étages	\N	ORDER0008-0005	\N	\N	0.00	f	16585	\N	\N	2
13266	9	21-move in	\N	ORDER0004-0011	\N	\N	0.00	f	3643	\N	\N	4
14679	17	1.28-manage project	\N	ORDER0009-0001	\N	\N	0.00	f	13268	\N	\N	0
14680	17	2.28-select builder	\N	ORDER0009-0002	\N	\N	0.00	f	13268	\N	\N	1
14681	17	3.28-build the house	\N	ORDER0009-0003	\N	\N	0.00	f	13268	\N	\N	2
16203	8	26-move in	\N	ORDER0003-0010	\N	\N	0.00	f	12034	\N	\N	4
15521	18	22-install toilets	\N	ORDER0007-0010	\N	\N	0.00	f	15519	\N	\N	2
16221	17	22-move in	\N	ORDER0007-0011	\N	\N	0.00	f	13238	\N	\N	4
14682	17	3.1.28-build walls	\N	ORDER0009-0005	\N	\N	0.00	f	14681	\N	\N	0
14683	17	3.2.28-place windows	\N	ORDER0009-0006	\N	\N	0.00	f	14681	\N	\N	1
14684	17	3.3.28-install plumbing	\N	ORDER0009-0007	\N	\N	0.00	f	14681	\N	\N	2
14685	17	4.28-finalize house	\N	ORDER0009-0004	\N	\N	0.00	f	13268	\N	\N	3
14686	17	4.1.28-close roof	\N	ORDER0009-0008	\N	\N	0.00	f	14685	\N	\N	0
14687	17	4.2.28-install electrical system	\N	ORDER0009-0009	\N	\N	0.00	f	14685	\N	\N	1
14688	17	4.3.28-install toilet	\N	ORDER0009-0010	\N	\N	0.00	f	14685	\N	\N	2
16568	13	27-réfléchir	\N	ORDER0008-0002	\N	\N	0.00	f	13286	\N	\N	1
16585	11	27-s'y-mettre-vraiment	\N	ORDER0008-0006	\N	\N	0.00	f	13286	\N	\N	2
17557	9	27-terminer-les-finitions	\N	ORDER0008-0007	\N	\N	0.00	f	13286	\N	\N	3
17558	9	27-verrouiller	\N	ORDER0008-0009	\N	\N	0.00	f	17557	\N	\N	0
16608	31	1.23-manage project	\N	ORDER0010-0002	\N	\N	0.00	f	13310	\N	\N	0
17559	9	27-boutons	\N	ORDER0008-0010	\N	\N	0.00	f	17557	\N	\N	1
16659	24	2.23-select builder	\N	ORDER0010-0001	\N	\N	0.00	f	13310	\N	\N	1
16218	36	3.23-build the house	\N	ORDER0010-0004	\N	\N	0.00	f	13310	\N	\N	2
16219	36	3.1.23-build walls	\N	ORDER0010-0007	\N	\N	0.00	f	16218	\N	\N	0
16260	35	3.2.23-place windows	\N	ORDER0010-0006	\N	\N	0.00	f	16218	\N	\N	1
16250	34	3.3.23-install plumbin	\N	ORDER0010-0008	\N	\N	0.00	f	16218	\N	\N	2
16621	29	4.23-finalize house	\N	ORDER0010-0011	\N	\N	0.00	f	13310	\N	\N	3
16622	29	4.1.23-close roof	\N	ORDER0010-0013	\N	\N	0.00	f	16621	\N	\N	0
16609	31	4.2.23-install electrical system	\N	ORDER0010-0012	\N	\N	0.00	f	16621	\N	\N	1
16623	29	4.3.23-install toilet	\N	ORDER0010-0014	\N	\N	0.00	f	16621	\N	\N	2
16653	24	5.23-move in 	\N	ORDER0010-0016	\N	\N	0.00	f	13310	\N	\N	4
14987	21	22-build the house	\N	ORDER0007-0003	\N	\N	0.00	f	13238	\N	\N	2
15519	18	22-finalize house	\N	ORDER0007-0006	\N	\N	0.00	f	13238	\N	\N	3
14988	21	22-install electrical system	\N	ORDER0007-0008	\N	\N	0.00	f	15519	\N	\N	0
15520	18	22-close roof	\N	ORDER0007-0009	\N	\N	0.00	f	15519	\N	\N	1
15496	10	26-install plumbing	\N	ORDER0003-0006	\N	\N	0.00	f	12622	\N	\N	2
15512	9	26-close roof	\N	ORDER0003-0008	\N	\N	0.00	f	15511	\N	\N	0
15513	9	26-install electrical system	\N	ORDER0003-0009	\N	\N	0.00	f	15511	\N	\N	1
16202	8	26-install oilet	\N	ORDER0003-0011	\N	\N	0.00	f	15511	\N	\N	2
17560	9	27-cabane-au-fond-du-jardin	\N	ORDER0008-0011	\N	\N	0.00	f	17557	\N	\N	2
17561	9	27-enfin-chez-soi	\N	ORDER0008-0008	\N	\N	0.00	f	13286	\N	\N	4
20841	3	25-Building house	\N	ORDER0011-0001	\N	\N	0.00	f	13825	\N	\N	0
20842	3	25-select builder	\N	ORDER0011-0002	2014-06-03 00:00:00+02	2014-07-16 00:00:00+02	0.00	t	13825	\N	\N	1
20843	3	25-build the house	\n	ORDER0011-0003	2014-06-03 00:00:00+02	2014-07-16 00:00:00+02	0.00	t	13825	\N	\N	2
20844	3	25-buildwalls	\N	ORDER0011-0006	2014-06-04 00:00:00+02	2014-06-11 00:00:00+02	0.00	t	20843	\N	\N	0
20845	3	25-place windows	\N	ORDER0011-0007	2014-06-11 00:00:00+02	2014-06-13 00:00:00+02	0.00	t	20843	\N	\N	1
20846	3	25-install plumbing	\N	ORDER0011-0008	2014-06-17 00:00:00+02	2014-04-19 00:00:00+02	0.00	t	20843	\N	\N	2
20847	3	25-finalize house	\N	ORDER0011-0004	\N	\N	0.00	t	13825	\N	\N	3
20848	3	25-close roof	\N	ORDER0011-0009	2014-06-28 00:00:00+02	2014-07-16 00:00:00+02	0.00	t	20847	\N	\N	0
20849	3	install electrical system	\N	ORDER0011-0010	\N	\N	0.00	t	20848	\N	\N	0
20850	3	25-move in	\N	ORDER0011-0005	\N	\N	0.00	f	13825	\N	\N	4
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_element_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_element_template (id, version, name, description, start_as_days_from_beginning, deadline_as_days_from_beginning, scheduling_state_type, parent, position_in_container) FROM stdin;
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_element_template_quality_form; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_element_template_quality_form (order_element_template_id, quality_form_id) FROM stdin;
\.


--
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_line (order_element_id, last_hours_group_sequence_code, budget) FROM stdin;
12555	1	0.00
12557	1	0.00
12589	1	0.00
12613	1	0.00
12614	1	0.00
13232	1	0.00
13243	1	0.00
13244	1	0.00
13266	1	0.00
20841	1	0.00
20842	1	0.00
20844	1	0.00
20845	1	0.00
20846	1	0.00
20849	1	0.00
20850	1	0.00
12031	1	0.00
3650	1	0.00
3652	1	0.00
3653	1	0.00
3674	1	0.00
3675	1	0.00
14674	1	0.00
16568	0	0.00
15045	1	0.00
15046	1	0.00
15477	1	0.00
17558	1	0.00
17559	1	0.00
17560	1	0.00
17561	1	0.00
14679	1	0.00
14680	1	0.00
14682	1	0.00
14683	1	0.00
14684	1	0.00
14686	1	0.00
14687	1	0.00
14688	1	0.00
14989	1	0.00
16608	0	0.00
16659	0	0.00
16219	1	0.00
16260	0	0.00
16250	1	0.00
16622	1	0.00
16609	2	0.00
16623	1	0.00
16653	1	0.00
13319	1	0.00
13320	1	0.00
15470	0	0.00
14670	2	0.00
15471	1	0.00
14988	3	0.00
15520	1	0.00
15521	1	0.00
16221	1	0.00
5907	1	0.00
5908	1	0.00
7217	1	0.00
11696	1	0.00
11697	1	0.00
12041	1	0.00
13234	1	0.00
13235	1	0.00
13236	1	0.00
12620	1	0.00
12621	1	0.00
12623	1	0.00
12624	1	0.00
15496	1	0.00
15512	1	0.00
15513	1	0.00
16202	1	0.00
16203	1	0.00
\.


--
-- Data for Name: order_line_group; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_line_group (order_element_id) FROM stdin;
3639
3643
3646
3651
3673
7216
12034
12040
12588
12622
13231
13238
13268
13286
13310
13825
14681
14685
14987
15511
15519
16218
16585
16621
17557
20843
20847
20848
\.


--
-- Data for Name: order_line_group_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_line_group_template (group_template_id) FROM stdin;
\.


--
-- Data for Name: order_line_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_line_template (order_line_template_id, last_hours_group_sequence_code, budget) FROM stdin;
\.


--
-- Data for Name: order_sync_info; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_sync_info (id, version, last_sync_date, key, connector_name, order_element_id) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_table (order_element_id, responsible, dependencies_constraints_have_priority, code_autogenerated, last_order_element_sequence_code, work_budget, materials_budget, total_hours, customer_reference, external_code, state, customer, base_calendar_id, scheduling_mode) FROM stdin;
3639	\N	\N	t	8	0.00	0.00	440	\N	\N	0	\N	202	0
13286	\N	\N	t	11	0.00	0.00	1180	\N	\N	0	\N	202	0
13268	\N	\N	t	11	0.00	0.00	1180	\N	\N	0	\N	202	0
12034	\N	\N	t	11	0.00	0.00	1180	\N	\N	0	\N	202	0
13310	\N	\N	t	16	0.00	0.00	1180	\N	\N	0	\N	202	0
13238	\N	\N	t	11	0.00	0.00	1180	\N	\N	0	\N	202	0
3646	\N	\N	t	12	0.00	0.00	1180	\N	\N	0	\N	202	0
3643	\N	\N	t	11	0.00	0.00	1180	\N	\N	0	\N	202	0
13825	\N	\N	t	10	0.00	0.00	840	\N	\N	0	\N	202	0
\.


--
-- Data for Name: order_template; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_template (order_template_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: order_version; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY order_version (id, version, modification_by_owner_timestamp, ownerscenario) FROM stdin;
3866	3	2014-04-16 15:27:31.411+02	1010
3841	9	2014-04-16 14:38:27.177+02	1010
3861	15	2014-04-16 15:47:47.286+02	1010
3858	17	2014-04-16 15:49:09.429+02	1010
3850	11	2014-04-16 15:53:50.102+02	1010
3863	42	2014-04-16 16:02:34.892+02	1010
3845	15	2014-04-16 14:56:06.059+02	1010
3854	23	2014-04-16 16:02:42.407+02	1010
3848	15	2014-04-16 16:02:43.233+02	1010
\.


--
-- Data for Name: planning_data; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY planning_data (planning_data_id, progress_by_duration, progress_by_num_hours, progress_all_by_num_hours, version) FROM stdin;
12387	0.000000	0.000000	0.000000	6
4111	0.000000	0.000000	0.000000	2
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY profile_roles (profile_id, role) FROM stdin;
1414	ROLE_JOB_SCHEDULING
1414	ROLE_MAIN_SETTINGS
1414	ROLE_PROFILES
1414	ROLE_USER_ACCOUNTS
1415	ROLE_CRITERIA
1415	ROLE_MATERIALS_NEED_AT_DATE_REPORT
1415	ROLE_CALENDAR_EXCEPTION_DAYS
1415	ROLE_TEMPLATES
1415	ROLE_WORKERS
1415	ROLE_READ_ALL_PROJECTS
1415	ROLE_WORK_AND_PROGRESS_PER_PROJECT_REPORT
1415	ROLE_VIRTUAL_WORKERS
1415	ROLE_LABELS
1415	ROLE_CREATE_PROJECTS
1415	ROLE_EDIT_ALL_PROJECTS
1415	ROLE_MATERIAL_UNITS
1415	ROLE_MACHINES
1415	ROLE_WORK_AND_PROGRESS_PER_TASK_REPORT
1415	ROLE_QUALITY_FORMS
1415	ROLE_ESTIMATED_PLANNED_HOURS_PER_TASK_REPORT
1415	ROLE_TASK_SCHEDULING_STATUS_IN_PROJECT_REPORT
1415	ROLE_CALENDARS
1415	ROLE_RECEIVED_FROM_CUSTOMERS
1415	ROLE_RECEIVED_FROM_SUBCONTRACTORS
1415	ROLE_PLANNING
1415	ROLE_MATERIALS
1415	ROLE_PROGRESS_TYPES
1416	ROLE_HOURS_TYPES
1416	ROLE_MACHINES
1416	ROLE_PROJECT_COSTS_REPORT
1416	ROLE_CALENDAR_EXCEPTION_DAYS
1416	ROLE_CALENDARS
1416	ROLE_WORKERS
1416	ROLE_VIRTUAL_WORKERS
1416	ROLE_COST_CATEGORIES
1417	ROLE_TOTAL_WORKED_HOURS_BY_RESOURCE_IN_A_MONTH_REPORT
1417	ROLE_HOURS_TYPES
1417	ROLE_TIMESHEETS_TEMPLATES
1417	ROLE_TIMESHEETS
1417	ROLE_HOURS_WORKED_PER_RESOURCE_REPORT
1417	ROLE_TIMESHEET_LINES_LIST
1417	ROLE_EXPENSES
1418	ROLE_SEND_TO_SUBCONTRACTORS
1418	ROLE_COMPANIES
1418	ROLE_SEND_TO_CUSTOMERS
1418	ROLE_RECEIVED_FROM_CUSTOMERS
1418	ROLE_RECEIVED_FROM_SUBCONTRACTORS
1419	ROLE_TOTAL_WORKED_HOURS_BY_RESOURCE_IN_A_MONTH_REPORT
1419	ROLE_MATERIALS_NEED_AT_DATE_REPORT
1419	ROLE_HOURS_WORKED_PER_RESOURCE_REPORT
1419	ROLE_PROJECT_COSTS_REPORT
1419	ROLE_WORK_AND_PROGRESS_PER_TASK_REPORT
1419	ROLE_ESTIMATED_PLANNED_HOURS_PER_TASK_REPORT
1419	ROLE_TASK_SCHEDULING_STATUS_IN_PROJECT_REPORT
1419	ROLE_READ_ALL_PROJECTS
1419	ROLE_PROJECT_STATUS_REPORT
1419	ROLE_WORK_AND_PROGRESS_PER_PROJECT_REPORT
1420	ROLE_TOTAL_WORKED_HOURS_BY_RESOURCE_IN_A_MONTH_REPORT
1420	ROLE_TIMESHEET_LINES_LIST
1420	ROLE_PROJECT_COSTS_REPORT
1420	ROLE_IMPORT_PROJECTS
1420	ROLE_TEMPLATES
1420	ROLE_READ_ALL_PROJECTS
1420	ROLE_PROJECT_STATUS_REPORT
1420	ROLE_WORK_AND_PROGRESS_PER_PROJECT_REPORT
1420	ROLE_EDIT_ALL_PROJECTS
1420	ROLE_CREATE_PROJECTS
1420	ROLE_TIMESHEETS
1420	ROLE_WORK_AND_PROGRESS_PER_TASK_REPORT
1420	ROLE_ESTIMATED_PLANNED_HOURS_PER_TASK_REPORT
1420	ROLE_TASK_SCHEDULING_STATUS_IN_PROJECT_REPORT
2727	ROLE_SUPERUSER
2727	ROLE_CREATE_PROJECTS
\.


--
-- Data for Name: profile_table; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY profile_table (id, version, profile_name) FROM stdin;
1414	0	Systems Administrator
1415	0	Project Manager
1416	0	Human Resources & Costs Manager
1417	0	Time Tracking & Expenses Responsible
1418	0	Outsourcing Manager
1419	0	Reports Responsible
1420	2	ChefdeProjet
2727	3	Guillemenot
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY quality_form (id, version, name, description, quality_form_type, report_advance, advance_type_id) FROM stdin;
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY resource (id, version, code, code_autogenerated, base_calendar_id, resource_type) FROM stdin;
3004	1	WORKER0037	t	2588	NON_LIMITING_RESOURCE
2993	1	WORKER0032	t	2582	NON_LIMITING_RESOURCE
2954	4	WORKER0013	t	2555	NON_LIMITING_RESOURCE
2980	1	MACHINE0001	t	2572	LIMITING_RESOURCE
3011	7	WORKER0042	t	2591	NON_LIMITING_RESOURCE
2978	6	WORKER0025	t	2571	NON_LIMITING_RESOURCE
2970	6	WORKER0021	t	2565	NON_LIMITING_RESOURCE
2982	7	WORKER0026	t	2574	NON_LIMITING_RESOURCE
2972	6	WORKER0022	t	2566	NON_LIMITING_RESOURCE
2966	10	WORKER0019	t	2563	NON_LIMITING_RESOURCE
2935	7	WORKER0004	t	2544	NON_LIMITING_RESOURCE
2974	5	WORKER0023	t	2567	NON_LIMITING_RESOURCE
2946	4	WORKER0009	t	2551	NON_LIMITING_RESOURCE
2977	5	WORKER0024	t	2569	NON_LIMITING_RESOURCE
2940	5	WORKER0005	t	2547	NON_LIMITING_RESOURCE
2989	7	WORKER0030	t	2580	NON_LIMITING_RESOURCE
2939	7	WORKER0006	t	2546	NON_LIMITING_RESOURCE
2984	8	WORKER0027	t	2576	NON_LIMITING_RESOURCE
2963	4	WORKER0018	t	2561	NON_LIMITING_RESOURCE
2951	9	WORKER0011	t	2553	NON_LIMITING_RESOURCE
2961	3	WORKER0017	t	2559	NON_LIMITING_RESOURCE
2933	7	WORKER0003	t	2541	NON_LIMITING_RESOURCE
2941	8	WORKER0007	t	2548	NON_LIMITING_RESOURCE
2956	6	WORKER0015	t	2556	NON_LIMITING_RESOURCE
2931	11	WORKER0002	t	2537	NON_LIMITING_RESOURCE
3007	4	WORKER0040	t	2589	NON_LIMITING_RESOURCE
2952	4	WORKER0012	t	2554	NON_LIMITING_RESOURCE
2986	4	WORKER0028	t	2578	NON_LIMITING_RESOURCE
2995	5	WORKER0033	t	2584	NON_LIMITING_RESOURCE
2958	4	WORKER0014	t	2557	NON_LIMITING_RESOURCE
3009	3	WORKER0041	t	2590	NON_LIMITING_RESOURCE
2997	4	WORKER0034	t	2585	NON_LIMITING_RESOURCE
2944	7	WORKER0008	t	2550	NON_LIMITING_RESOURCE
2991	1	WORKER0031	t	2581	NON_LIMITING_RESOURCE
2959	5	WORKER0016	t	2558	NON_LIMITING_RESOURCE
3000	1	WORKER0035	t	2586	NON_LIMITING_RESOURCE
2969	10	WORKER0020	t	2568	NON_LIMITING_RESOURCE
3003	1	WORKER0036	t	2587	NON_LIMITING_RESOURCE
3013	4	WORKER0043	t	2592	NON_LIMITING_RESOURCE
\.


--
-- Data for Name: resource_allocation; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY resource_allocation (id, version, resources_per_day, intended_total_hours, task, assignment_function, intended_resources_per_day, intended_total_assignment, intended_non_consolidated_effort) FROM stdin;
6863	8	0.67	\N	12409	\N	1.00	576000	576000
6775	3	1.79	\N	4040	\N	1.00	360000	360000
6864	8	1.00	\N	12410	\N	1.00	288000	288000
6865	8	1.00	\N	12411	\N	1.00	288000	288000
21984	8	0.25	\N	12412	\N	0.25	136800	136800
21985	8	0.75	\N	12412	\N	0.75	410400	410400
21986	8	0.93	\N	15413	\N	1.00	792000	792000
22011	6	0.50	\N	12422	\N	\N	144000	144000
22013	6	0.77	\N	12422	\N	1.00	288000	288000
22012	6	0.77	\N	12422	\N	1.00	288000	288000
6814	6	1.33	\N	12362	\N	1.00	1152000	1152000
6837	5	0.67	\N	12362	\N	1.00	576000	576000
21962	4	1.00	\N	12363	\N	1.00	576000	576000
21963	4	1.00	\N	12364	\N	1.00	288000	288000
25568	12	0.75	\N	15421	\N	0.75	388800	388800
25567	12	0.25	\N	15421	\N	0.25	136800	136800
25586	9	1.00	\N	23846	\N	1.00	792000	792000
25598	5	0.77	\N	15424	\N	1.00	288000	288000
25597	5	0.91	\N	15424	\N	\N	144000	144000
25599	5	0.77	\N	15424	\N	1.00	288000	288000
6809	13	0.50	\N	12385	\N	0.50	1152000	1152000
6810	13	0.67	\N	12386	\N	1.00	576000	576000
6811	13	1.00	\N	15365	\N	1.00	288000	288000
25580	3	0.50	\N	12408	\N	0.50	1152000	1152000
6812	13	1.00	\N	12404	\N	1.00	288000	288000
6839	12	0.75	\N	15366	\N	0.75	399600	399600
6838	12	0.25	\N	15366	\N	0.25	133200	133200
25590	3	1.00	\N	12365	\N	1.00	288000	288000
25591	3	0.75	\N	15370	\N	0.75	432000	432000
25592	3	0.25	\N	15370	\N	0.25	144000	144000
25554	4	20.00	\N	15401	\N	1.00	576000	576000
25555	4	1.00	\N	15360	\N	1.00	288000	288000
21980	16	0.50	\N	18519	\N	0.50	1152000	1152000
6840	12	1.00	\N	15405	\N	1.00	792000	792000
6867	10	0.77	\N	15387	\N	1.00	288000	288000
6866	10	0.77	\N	15387	\N	1.00	288000	288000
21917	10	0.45	\N	15387	\N	\N	144000	144000
25560	5	0.50	\N	15384	\N	0.50	1152000	1152000
6789	9	0.67	\N	4109	\N	1.00	576000	576000
6790	9	1.00	\N	4136	\N	1.00	288000	288000
6794	8	1.00	\N	7870	\N	1.00	288000	288000
25556	4	1.11	\N	15361	\N	1.00	288000	288000
25558	4	0.75	\N	15367	\N	0.75	432000	432000
6795	8	0.75	\N	7871	\N	0.75	388800	388800
6796	8	0.25	\N	7871	\N	0.25	129600	129600
25561	5	1.00	\N	23845	\N	1.00	792000	792000
25562	5	0.77	\N	12371	\N	1.00	288000	288000
25557	4	0.25	\N	15367	\N	0.25	144000	144000
25564	5	0.50	\N	12371	\N	\N	144000	144000
25563	5	0.77	\N	12371	\N	1.00	288000	288000
21981	16	0.67	\N	18520	\N	1.00	576000	576000
25559	12	1.00	\N	15419	\N	1.00	288000	288000
25553	14	1.00	\N	15420	\N	1.00	288000	288000
\.


--
-- Data for Name: resource_calendar; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY resource_calendar (base_calendar_id, capacity) FROM stdin;
2574	1
2551	1
2576	1
2550	1
2581	1
2582	1
2555	1
2589	1
2554	1
2541	1
2584	1
2557	1
2544	1
2590	1
2585	1
2546	1
2572	1
2592	1
2559	1
2548	1
2591	1
2556	1
2565	1
2566	1
2563	1
2567	1
2569	1
2547	1
2537	1
2580	1
2578	1
2561	1
2558	1
2553	1
2586	1
2568	1
2587	1
2588	1
2571	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY resources_cost_category_assignment (id, version, code, init_date, end_date, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: roles_table; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY roles_table (user_id, role) FROM stdin;
1818	ROLE_CREATE_PROJECTS
1818	ROLE_EDIT_ALL_PROJECTS
1818	ROLE_READ_ALL_PROJECTS
1818	ROLE_SUPERUSER
1819	ROLE_WS_READER
1820	ROLE_WS_READER
1820	ROLE_WS_WRITER
1821	ROLE_WS_SUBCONTRACTING
1826	ROLE_CREATE_PROJECTS
1826	ROLE_SUPERUSER
1826	ROLE_EDIT_ALL_PROJECTS
1826	ROLE_READ_ALL_PROJECTS
2828	ROLE_SUPERUSER
2828	ROLE_CREATE_PROJECTS
2829	ROLE_SUPERUSER
2829	ROLE_CREATE_PROJECTS
2830	ROLE_SUPERUSER
2831	ROLE_SUPERUSER
2831	ROLE_CREATE_PROJECTS
2832	ROLE_SUPERUSER
2832	ROLE_CREATE_PROJECTS
2833	ROLE_SUPERUSER
2833	ROLE_CREATE_PROJECTS
2834	ROLE_SUPERUSER
2834	ROLE_CREATE_PROJECTS
2830	ROLE_CREATE_PROJECTS
2835	ROLE_SUPERUSER
2835	ROLE_CREATE_PROJECTS
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY scenario (id, version, name, description, last_not_owned_reassignations_time_stamp, predecessor) FROM stdin;
1010	0	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
3639	3841	1010
3643	3845	1010
3646	3848	1010
12034	3850	1010
13238	3854	1010
13268	3858	1010
13286	3861	1010
13310	3863	1010
13825	3866	1010
\.


--
-- Data for Name: scheduling_data_for_version; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY scheduling_data_for_version (id, version, scheduling_state_type, order_element_id) FROM stdin;
13926	3	2	13825
16351	34	0	16250
16722	29	0	16621
16723	29	1	16622
15578	13	0	15477
17658	9	0	17557
11798	12	0	11697
12141	11	0	12040
14785	17	0	14684
16710	31	1	16609
16724	29	1	16623
16754	24	0	16653
15597	10	0	15496
3740	9	3	3639
3751	9	0	3650
3752	9	3	3651
3753	9	0	3652
3754	9	0	3653
3774	7	3	3673
3775	7	0	3674
17659	9	1	17558
3776	7	0	3675
17660	9	1	17559
17661	9	1	17560
12132	3	0	12031
17662	9	0	17561
15572	20	0	15471
14786	17	0	14685
3744	15	3	3643
12656	15	0	12555
12658	14	0	12557
12689	13	3	12588
15620	18	0	15519
12690	13	0	12589
12714	12	0	12613
12715	12	0	12614
13332	11	0	13231
13333	11	1	13232
13344	9	1	13243
13345	9	1	13244
15612	9	4	15511
13367	9	0	13266
15089	21	1	14988
15621	18	1	15520
15622	18	1	15521
16322	17	0	16221
13369	17	3	13268
14780	17	0	14679
14787	17	1	14686
15613	9	4	15512
14788	17	1	14687
15614	9	4	15513
16303	8	4	16202
16304	8	0	16203
14789	17	1	14688
15090	16	0	14989
12135	11	2	12034
12721	11	0	12620
12722	11	0	12621
12723	11	3	12622
12724	11	0	12623
12725	11	0	12624
12142	11	1	12041
14781	17	0	14680
14782	17	3	14681
14783	17	0	14682
13335	11	1	13234
14784	17	0	14683
13411	42	3	13310
13336	11	1	13235
13337	11	0	13236
16709	31	0	16608
16760	24	0	16659
13339	23	3	13238
16319	36	3	16218
16320	36	0	16219
13420	23	0	13319
13421	23	0	13320
3747	15	3	3646
6008	15	0	5907
15088	21	3	14987
6009	15	0	5908
7317	15	3	7216
7318	15	0	7217
15571	20	0	15470
14771	22	0	14670
16361	35	0	16260
11797	12	0	11696
13387	15	3	13286
14775	15	0	14674
16669	13	0	16568
16686	11	3	16585
15146	15	0	15045
15147	15	0	15046
20942	3	4	20841
20943	3	0	20842
20944	3	3	20843
20945	3	0	20844
20946	3	0	20845
20947	3	0	20846
20948	3	3	20847
20949	3	3	20848
20950	3	0	20849
20951	3	4	20850
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
3639	3740	3841
3643	3744	3845
3646	3747	3848
3650	3751	3841
3651	3752	3841
3652	3753	3841
3653	3754	3841
3673	3774	3841
3674	3775	3841
3675	3776	3841
5907	6008	3848
5908	6009	3848
7216	7317	3848
7217	7318	3848
11696	11797	3848
11697	11798	3848
12031	12132	3841
12034	12135	3850
12040	12141	3848
12041	12142	3848
12555	12656	3845
12557	12658	3845
12588	12689	3845
12589	12690	3845
12613	12714	3845
12614	12715	3845
12620	12721	3850
12621	12722	3850
12622	12723	3850
12623	12724	3850
12624	12725	3850
13231	13332	3845
13232	13333	3845
13238	13339	3854
13234	13335	3848
13235	13336	3848
13236	13337	3848
13243	13344	3845
13244	13345	3845
13266	13367	3845
13268	13369	3858
13286	13387	3861
13310	13411	3863
13319	13420	3854
13320	13421	3854
13825	13926	3866
14670	14771	3854
14674	14775	3861
14679	14780	3858
14680	14781	3858
14681	14782	3858
14682	14783	3858
14683	14784	3858
14684	14785	3858
14685	14786	3858
14686	14787	3858
14687	14788	3858
14688	14789	3858
14987	15088	3854
14988	15089	3854
14989	15090	3858
15045	15146	3861
15046	15147	3861
15470	15571	3854
15471	15572	3854
15477	15578	3861
15496	15597	3850
15511	15612	3850
15512	15613	3850
15513	15614	3850
15519	15620	3854
15520	15621	3854
15521	15622	3854
16202	16303	3850
16203	16304	3850
16218	16319	3863
16219	16320	3863
16221	16322	3854
16250	16351	3863
16260	16361	3863
16568	16669	3861
16585	16686	3861
16608	16709	3863
16609	16710	3863
16621	16722	3863
16622	16723	3863
16623	16724	3863
16653	16754	3863
16659	16760	3863
17557	17658	3861
17558	17659	3861
17559	17660	3861
17560	17661	3861
17561	17662	3861
20841	20942	3866
20842	20943	3866
20843	20944	3866
20844	20945	3866
20845	20946	3866
20846	20947	3866
20847	20948	3866
20848	20949	3866
20849	20950	3866
20850	20951	3866
\.


--
-- Data for Name: sigmoid_function; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY sigmoid_function (assignment_function_id) FROM stdin;
\.


--
-- Data for Name: specific_day_assignments_container; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY specific_day_assignments_container (id, version, resource_allocation_id, scenario, start_date, duration_start_in_first_day, end_date, duration_in_last_day) FROM stdin;
12806	4	25558	1010	2014-10-10	0	2014-11-07	0
12805	4	25557	1010	2014-10-10	0	2014-11-07	0
12792	8	21984	1010	2014-10-10	0	2014-11-07	0
12793	8	21985	1010	2014-10-10	0	2014-11-07	0
12802	6	22011	1010	2014-12-18	14400	2015-01-06	14400
12817	3	25580	1010	2014-08-01	0	2014-12-23	14400
12820	3	25591	1010	2014-08-29	0	2014-09-26	0
12821	3	25592	1010	2014-08-29	0	2014-09-26	0
12791	16	21980	1010	2014-08-01	0	2014-12-09	14400
12812	12	25568	1010	2014-09-26	0	2014-10-24	0
12811	12	25567	1010	2014-09-26	0	2014-10-24	0
12824	5	25597	1010	2014-12-02	14400	2014-12-19	14400
12745	13	6809	1010	2014-08-01	0	2014-12-23	0
12759	12	6839	1010	2014-09-26	0	2014-10-24	0
12758	12	6838	1010	2014-09-26	0	2014-10-24	0
12769	10	21917	1010	2014-12-02	14400	2014-12-19	14400
12807	5	25560	1010	2014-08-01	0	2014-12-23	14400
12739	8	6795	1010	2014-09-26	0	2014-10-24	0
12740	8	6796	1010	2014-09-26	0	2014-10-24	0
12808	5	25564	1010	2014-12-02	14400	2014-12-19	14400
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
25558	3003
25557	2995
25580	2969
21984	2982
21985	2984
22011	2982
25591	2946
25592	2958
21980	2951
25568	3011
25567	3009
25597	3009
6809	2931
6839	2939
6838	2935
21917	2935
25560	2966
6795	2974
6796	2972
25564	2972
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY stretches (assignment_function_id, length_percentage, amount_work_percentage, stretch_position) FROM stdin;
\.


--
-- Data for Name: stretches_function; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY stretches_function (assignment_function_id, type) FROM stdin;
\.


--
-- Data for Name: subcontracted_task_data; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY subcontracted_task_data (id, version, external_company, subcontratation_date, subcontract_communication_date, work_description, subcontract_price, subcontracted_code, node_without_children_exported, labels_exported, material_assignments_exported, hours_groups_exported, state) FROM stdin;
\.


--
-- Data for Name: subcontractor_communication; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY subcontractor_communication (id, version, communication_type, communication_date, reviewed, subcontracted_task_data) FROM stdin;
\.


--
-- Data for Name: subcontractor_communication_values; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY subcontractor_communication_values (subcontractor_communication_id, date, progress, idx) FROM stdin;
\.


--
-- Data for Name: subcontractor_deliver_date; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY subcontractor_deliver_date (id, version, save_date, subcontractor_deliver_date, communication_date, subcontracted_task_data_id) FROM stdin;
\.


--
-- Data for Name: sum_charged_effort; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY sum_charged_effort (id, version, direct_charged_effort, indirect_charged_effort, order_element, first_timesheet_date, last_timesheet_date, finished_timesheets) FROM stdin;
7575	1	0	0	5907	\N	\N	f
7576	1	0	0	3646	\N	\N	f
7577	1	0	0	5908	\N	\N	f
7578	1	0	0	7217	\N	\N	f
7579	1	0	0	7216	\N	\N	f
7580	1	0	0	13319	\N	\N	f
7581	1	0	0	13238	\N	\N	f
7582	1	0	0	13320	\N	\N	f
7583	1	0	0	14670	\N	\N	f
7584	1	0	0	14987	\N	\N	f
7585	1	0	0	14988	\N	\N	f
7586	1	0	0	14674	\N	\N	f
7587	1	0	0	13286	\N	\N	f
7588	1	0	0	15045	\N	\N	f
7590	1	0	0	15046	\N	\N	f
7591	1	0	0	15470	\N	\N	f
7592	1	0	0	15471	\N	\N	f
7593	1	0	0	15477	\N	\N	f
7620	1	0	0	17558	\N	\N	f
7621	1	0	0	17557	\N	\N	f
7622	1	0	0	17559	\N	\N	f
7596	1	0	0	13310	\N	\N	f
7623	1	0	0	17560	\N	\N	f
7624	1	0	0	17561	\N	\N	f
7600	1	0	0	15519	\N	\N	f
7601	1	0	0	15520	\N	\N	f
7602	1	0	0	15521	\N	\N	f
7603	1	0	0	16218	\N	\N	f
7604	1	0	0	16219	\N	\N	f
7605	1	0	0	16250	\N	\N	f
7607	1	0	0	16260	\N	\N	f
7608	1	0	0	16568	\N	\N	f
7611	1	0	0	16585	\N	\N	f
7612	1	0	0	16608	\N	\N	f
7613	1	0	0	16609	\N	\N	f
7614	1	0	0	16621	\N	\N	f
7615	1	0	0	16622	\N	\N	f
7616	1	0	0	16623	\N	\N	f
7618	1	0	0	16653	\N	\N	f
7619	1	0	0	16659	\N	\N	f
\.


--
-- Data for Name: sum_expenses; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY sum_expenses (id, version, order_element_id, total_direct_expenses, total_indirect_expenses) FROM stdin;
7692	2	15470	0.00	0.00
7693	1	15471	0.00	0.00
7694	1	15477	0.00	0.00
7713	2	16608	0.00	0.00
7714	1	16609	0.00	0.00
7676	7	5907	0.00	0.00
7677	6	3646	0.00	0.00
7678	5	5908	0.00	0.00
7679	3	7217	0.00	0.00
7680	2	7216	0.00	0.00
7715	4	16621	0.00	0.00
7716	3	16622	0.00	0.00
7717	1	16623	0.00	0.00
7697	5	13310	0.00	0.00
7719	2	16653	0.00	0.00
7720	1	16659	0.00	0.00
7681	8	13319	0.00	0.00
7682	7	13238	0.00	0.00
7683	6	13320	0.00	0.00
7684	4	14670	0.00	0.00
7685	3	14987	0.00	0.00
7686	2	14988	0.00	0.00
7701	4	15519	0.00	0.00
7702	3	15520	0.00	0.00
7703	1	15521	0.00	0.00
7704	3	16218	0.00	0.00
7705	2	16219	0.00	0.00
7706	3	16250	0.00	0.00
7687	7	14674	0.00	0.00
7688	6	13286	0.00	0.00
7689	5	15045	0.00	0.00
7691	2	15046	0.00	0.00
7708	1	16260	0.00	0.00
7709	1	16568	0.00	0.00
7712	2	16585	0.00	0.00
7721	6	17558	0.00	0.00
7722	5	17557	0.00	0.00
7723	4	17559	0.00	0.00
7724	2	17560	0.00	0.00
7725	1	17561	0.00	0.00
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task (task_element_id, calculated_value, constraint_type, constraint_date, workable_days, allocation_direction, subcontrated_task_data_id, priority, constraint_date_effort_duration) FROM stdin;
12412	0	0	\N	20	0	\N	\N	\N
15413	1	0	\N	\N	0	\N	\N	\N
12422	2	0	\N	13	0	\N	\N	\N
18519	1	0	\N	\N	0	\N	\N	\N
18520	2	0	\N	30	0	\N	\N	\N
15419	2	0	\N	10	0	\N	\N	\N
15420	2	0	\N	10	0	\N	\N	\N
15421	0	0	\N	20	0	\N	\N	\N
7877	1	1	2014-04-16	3	0	\N	\N	0
4040	2	0	\N	7	0	\N	\N	\N
4041	1	0	\N	9	0	\N	\N	\N
4042	1	0	\N	\N	0	\N	\N	\N
4094	1	0	\N	\N	0	\N	\N	\N
4095	1	0	\N	\N	0	\N	\N	\N
23846	1	0	\N	\N	0	\N	\N	\N
15424	2	0	\N	13	0	\N	\N	\N
12385	1	0	\N	\N	0	\N	\N	\N
12386	2	1	2014-07-31	30	0	\N	\N	0
15365	2	0	\N	10	0	\N	\N	\N
12404	2	0	\N	10	0	\N	\N	\N
15366	0	0	\N	20	0	\N	\N	\N
15405	1	1	2014-10-24	\N	0	\N	\N	0
15387	2	0	\N	13	0	\N	\N	\N
15384	1	0	\N	\N	0	\N	\N	\N
4109	2	0	\N	30	0	\N	\N	\N
4136	2	0	\N	10	0	\N	\N	\N
7870	2	0	\N	10	0	\N	\N	\N
7871	0	0	\N	20	0	\N	\N	\N
23845	1	0	\N	\N	0	\N	\N	\N
12371	2	0	\N	13	0	\N	\N	\N
12333	1	0	\N	\N	0	\N	\N	\N
12335	1	0	\N	\N	0	\N	\N	\N
12336	1	0	\N	\N	0	\N	\N	\N
12340	1	0	\N	\N	0	\N	\N	\N
12341	1	0	\N	\N	0	\N	\N	\N
12368	1	0	\N	\N	0	\N	\N	\N
12372	1	0	\N	\N	0	\N	\N	\N
12362	2	0	\N	30	0	\N	\N	\N
12363	2	0	\N	20	0	\N	\N	\N
18563	1	1	2014-06-03	\N	0	\N	\N	0
18564	1	1	2014-06-04	\N	0	\N	\N	0
18565	1	1	2014-06-11	\N	0	\N	\N	0
18566	1	1	2014-06-17	\N	0	\N	\N	0
18568	1	1	2014-06-28	\N	0	\N	\N	0
12364	2	0	\N	10	0	\N	\N	\N
12365	2	0	\N	10	0	\N	\N	\N
15370	0	0	\N	20	0	\N	\N	\N
15383	1	0	\N	\N	0	\N	\N	\N
12405	1	0	\N	\N	0	\N	\N	\N
15401	2	0	\N	30	0	\N	\N	\N
15360	2	0	\N	10	0	\N	\N	\N
15361	2	0	\N	10	0	\N	\N	\N
15367	0	0	\N	20	0	\N	\N	\N
15433	1	0	\N	\N	0	\N	\N	\N
15434	1	0	\N	\N	0	\N	\N	\N
12408	1	0	\N	\N	0	\N	\N	\N
12409	2	0	\N	30	0	\N	\N	\N
12410	2	0	\N	10	0	\N	\N	\N
12411	2	0	\N	10	0	\N	\N	\N
\.


--
-- Data for Name: task_element; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_element (id, version, name, notes, start_date, start_day_duration, end_date, end_day_duration, deadline, advance_percentage, sum_of_assigned_effort, parent, base_calendar_id, position_in_parent, updated_from_timesheets) FROM stdin;
12334	16	21-Building a house	\N	2014-08-01	0	2014-12-09	14400	2014-12-31	0.0000	0	\N	\N	\N	f
12333	15	21-manage project	\N	2014-08-01	0	2014-09-25	28800	\N	0.0000	0	12334	\N	0	f
12335	14	21-select builder	\N	2014-08-01	0	2014-08-28	28800	\N	0.0000	0	12334	\N	1	f
12337	13	21-build the house	\N	2014-08-28	28800	2014-10-23	28800	\N	0.0000	0	12334	\N	2	f
18571	3	25-Building a house	\N	2014-06-03	0	2014-06-30	28800	2014-07-16	0.0000	0	\N	\N	\N	f
4137	15	3.-24-build the house	\N	2014-09-12	0	2014-10-24	0	\N	0.0000	0	4111	\N	2	f
12422	16	5.28-move in	\N	2014-12-18	0	2015-01-06	14400	\N	0.0000	0	12418	\N	4	f
4136	15	3.1.-24-build walls	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	4137	\N	0	f
7870	12	3.2.-24-place windows	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	4137	\N	1	f
7871	12	3.3.-24-install plumbing	\N	2014-09-26	0	2014-10-24	0	\N	0.0000	0	4137	\N	2	f
12371	11	5.-24-move in	\N	2014-12-02	14400	2014-12-19	14400	\N	0.0000	0	4111	\N	4	f
12336	13	21-build walls	\N	2014-08-28	28800	2014-09-11	28800	\N	0.0000	0	12337	\N	0	f
12340	12	21-place windows	\N	2014-09-11	28800	2014-09-25	28800	\N	0.0000	0	12337	\N	1	f
18519	21	1.23-manage project	\N	2014-08-01	0	2014-12-09	14400	\N	0.0000	0	15409	\N	0	f
12341	12	21-install plumbing	\N	2014-09-25	28800	2014-10-23	28800	\N	0.0000	0	12337	\N	2	f
18520	20	2.23-select builder	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	15409	\N	1	f
12385	23	22-manage project	\N	2014-08-01	0	2014-12-23	0	\N	0.0000	0	12387	\N	0	f
4040	9	task 1	\N	2014-04-16	0	2014-04-25	0	\N	0.0000	0	4044	\N	0	f
4043	9	task container	\N	2014-04-16	0	2014-05-05	28800	\N	0.0000	0	4044	\N	1	f
4041	9	task 3	\N	2014-04-16	0	2014-04-29	0	\N	0.0000	0	4043	\N	0	f
4042	9	task 4	\N	2014-04-29	0	2014-05-05	28800	\N	0.0000	0	4043	\N	1	f
12368	11	21-finalize house	\N	2014-10-23	28800	2014-11-11	14400	\N	0.0000	0	12334	\N	3	f
12372	9	21-move in	\N	2014-11-11	14400	2014-12-09	14400	\N	0.0000	0	12334	\N	4	f
4096	5	task 2 container	\N	2014-04-16	0	2014-05-20	28800	\N	0.0000	0	4044	\N	2	f
4094	5	task 5	\N	2014-04-16	0	2014-05-02	14400	\N	0.0000	0	4096	\N	0	f
4095	5	task 6	\N	2014-05-02	14400	2014-05-20	28800	\N	0.0000	0	4096	\N	1	f
12386	23	22-select builder	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	12387	\N	1	f
4044	14	test project	\N	2014-04-16	0	2014-05-20	28800	\N	0.0000	360000	\N	\N	\N	f
15365	20	22-build walls	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	12421	\N	0	f
12407	18	27-ma-baraque	\N	2014-08-01	0	2015-01-13	14400	2014-12-31	0.0000	1728000	\N	\N	\N	f
12405	15	27-palabres	\N	2014-08-01	0	2014-08-28	28800	\N	0.0000	0	12407	\N	0	f
7877	3	demo task	\N	2014-04-16	0	2014-04-20	0	\N	0.0000	0	4044	\N	3	f
15401	13	27-réfléchir	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	12407	\N	1	f
15360	15	27-another-brick-in-the-wall	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	15411	\N	0	f
12404	22	22-place windows	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	12421	\N	1	f
15366	20	22-install plumbing	\N	2014-09-26	0	2014-10-24	0	\N	0.0000	0	12421	\N	2	f
12362	11	26-manage project	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	12367	\N	0	f
12363	11	26-select builder	\N	2014-08-01	0	2014-08-29	0	\N	0.0000	0	12367	\N	1	f
15361	15	27-microsoft	\N	2014-09-26	0	2014-10-10	0	\N	0.0000	0	15411	\N	1	f
12366	11	26-build the house	\N	2014-08-29	0	2014-09-26	0	\N	0.0000	0	12367	\N	2	f
12364	11	26-build walls	\N	2014-08-29	0	2014-09-12	0	\N	0.0000	0	12366	\N	0	f
18570	3	25-finalize house	\N	2014-06-03	0	2014-06-09	28800	\N	0.0000	0	18571	\N	2	f
12387	28	22-buildinG dah house	\N	2014-08-01	0	2014-12-23	0	2014-12-31	0.0000	4348800	\N	\N	\N	f
12365	11	26-place windoows	\N	2014-08-29	0	2014-09-12	0	\N	0.0000	0	12366	\N	1	f
12367	16	26-Building house	\N	2014-08-01	0	2014-11-11	14400	2014-12-31	0.0000	3456000	\N	\N	\N	f
15384	9	1.-24-manage project	\N	2014-08-01	0	2014-12-23	14400	\N	0.0000	0	4111	\N	0	f
15367	13	27-gaz-à-tous-les-étages	\N	2014-10-10	0	2014-11-07	0	\N	0.0000	0	15411	\N	2	f
15413	12	4.28-finalize house	\N	2014-11-07	0	2014-12-18	14400	\N	0.0000	0	12418	\N	3	f
4109	15	2.-24-select builder	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	4111	\N	1	f
15409	43	23-Building a house	\N	2014-08-01	0	2014-12-19	14400	2014-12-31	0.0000	4341600	\N	\N	\N	f
15422	27	3.23-build the house	\N	2014-09-12	0	2014-10-24	0	\N	0.0000	0	15409	\N	2	f
15419	27	3.1.23-build walls	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	15422	\N	0	f
15420	27	3.2.23-place windows	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	15422	\N	1	f
15421	27	3.3.23-install plumbin	\N	2014-09-26	0	2014-10-24	0	\N	0.0000	0	15422	\N	2	f
15424	24	5.23-move in 	\N	2014-12-02	14400	2014-12-19	14400	\N	0.0000	0	15409	\N	4	f
12421	21	22-build the house	\N	2014-09-12	0	2014-10-24	0	\N	0.0000	0	12387	\N	2	f
15405	17	22-finalize house	\N	2014-10-24	0	2014-12-02	14400	\N	0.0000	0	12387	\N	3	f
15387	17	22-move in	\N	2014-12-02	14400	2014-12-19	14400	\N	0.0000	0	12387	\N	4	f
15370	10	26-install plumbing	\N	2014-08-29	0	2014-09-26	0	\N	0.0000	0	12366	\N	2	f
15383	8	26-move in	\N	2014-10-14	14400	2014-11-11	14400	\N	0.0000	0	12367	\N	3	f
15411	11	27-s'y-mettre-vraiment	\N	2014-09-12	0	2014-11-07	0	\N	0.0000	0	12407	\N	2	f
15433	9	27-terminer-les-finitions	\N	2014-11-07	0	2014-12-16	14400	\N	0.0000	0	12407	\N	3	f
15434	9	27-enfin-chez-soi	\N	2014-12-16	14400	2015-01-13	14400	\N	0.0000	0	12407	\N	4	f
12408	17	1.28-manage project	\N	2014-08-01	0	2014-12-23	14400	\N	0.0000	0	12418	\N	0	f
12409	17	2.28-select builder	\N	2014-08-01	0	2014-09-12	0	\N	0.0000	0	12418	\N	1	f
12413	17	3.28-build the house	\N	2014-09-12	0	2014-11-07	0	\N	0.0000	0	12418	\N	2	f
12410	17	3.1.28-build walls	\N	2014-09-12	0	2014-09-26	0	\N	0.0000	0	12413	\N	0	f
12411	17	3.2.28-place windows	\N	2014-09-26	0	2014-10-10	0	\N	0.0000	0	12413	\N	1	f
12412	17	3.3.28-install plumbing	\N	2014-10-10	0	2014-11-07	0	\N	0.0000	0	12413	\N	2	f
12418	24	28-Building a house	\N	2014-08-01	0	2015-01-06	14400	2014-12-31	0.0000	4363200	\N	\N	\N	f
18563	3	25-select builder	\N	2014-06-03	0	2014-06-30	28800	2014-07-16	0.0000	0	18571	\N	0	f
18564	3	25-buildwalls	\N	2014-06-04	0	2014-06-17	28800	2014-06-11	0.0000	0	18567	\N	0	f
18565	3	25-place windows	\N	2014-06-11	0	2014-06-24	28800	2014-06-13	0.0000	0	18567	\N	1	f
18566	3	25-install plumbing	\N	2014-06-17	0	2014-06-17	0	2014-04-19	0.0000	0	18567	\N	2	f
18567	3	25-build the house	\N	2014-06-04	0	2014-06-24	28800	2014-07-16	0.0000	0	18571	\N	1	f
18568	3	install electrical system	\N	2014-06-03	0	2014-06-09	28800	\N	0.0000	0	18569	\N	0	f
18569	3	25-close roof	\N	2014-06-03	0	2014-06-09	28800	2014-07-16	0.0000	0	18570	\N	0	f
23846	10	4.23-finalize house	\N	2014-10-24	0	2014-12-02	14400	\N	0.0000	0	15409	\N	3	f
4111	20	24-Building a house	\N	2014-08-01	0	2014-12-23	14400	2014-12-31	0.0000	4334400	\N	\N	\N	f
23845	5	4.-24-finalize house	\N	2014-10-24	0	2014-12-02	14400	\N	0.0000	0	4111	\N	3	f
\.


--
-- Data for Name: task_group; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_group (task_element_id) FROM stdin;
4043
4044
4096
4111
4137
12334
12337
12366
12367
12387
12407
12413
12418
12421
15409
15411
15422
18567
18569
18570
18571
\.


--
-- Data for Name: task_milestone; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_milestone (task_element_id, constraint_type, constraint_date, constraint_date_effort_duration) FROM stdin;
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, report_advance) FROM stdin;
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
\.


--
-- Data for Name: task_source; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_source (id, version, schedulingdata) FROM stdin;
4040	9	3751
4041	9	3753
4042	9	3754
4043	9	3752
4094	5	3775
4095	5	3776
4096	5	3774
4044	9	3740
18519	21	16709
7877	3	12132
18520	20	16760
12333	15	12656
12335	14	12658
12336	13	12690
15419	27	16320
15420	27	16361
15421	27	16351
15422	27	16319
12340	12	12714
12341	12	12715
12337	13	12689
12368	11	13332
23846	10	16722
15424	24	16754
15409	31	13411
12385	23	13420
12405	15	14775
15401	13	16669
12372	9	13367
12334	15	3744
15360	15	15146
12386	23	13421
15365	20	15571
12404	22	14771
15366	20	15572
12421	21	15088
15405	17	15620
15387	17	16322
12387	23	13339
15384	9	6008
15361	15	15147
15367	13	15578
12362	11	12721
15411	11	16686
12363	11	12722
12364	11	12724
12365	11	12725
15370	10	15597
15433	9	17658
15434	9	17662
12407	15	13387
12408	17	14780
12409	17	14781
12366	11	12723
15383	8	16304
18563	3	20943
18564	3	20945
18565	3	20946
18566	3	20947
18567	3	20944
18568	3	20950
18569	3	20949
18570	3	20948
18571	3	13926
12367	11	12135
12410	17	14783
12411	17	14784
12412	17	14785
12413	17	14782
15413	12	14786
12422	16	15090
12418	17	13369
4109	15	6009
4136	15	7318
7870	12	11797
7871	12	11798
4137	15	7317
23845	5	12141
12371	11	13337
4111	15	3747
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
12333	12463
12335	12465
12336	12495
12340	12519
12341	12520
12368	13143
12368	13142
12368	13134
12372	13160
4040	3942
4041	3943
4042	3944
4094	3962
4095	3963
7877	11945
12362	13130
12363	13131
12364	13132
12365	13133
15370	15246
15383	15939
18563	21016
18564	21017
18565	21018
18566	21019
18568	21020
18519	16516
18520	16553
15419	15947
12405	14580
15401	16491
15360	15207
15420	16486
15361	15208
15367	15231
15433	17838
15433	17837
15433	17839
15434	17840
12408	14584
12409	14585
12410	14586
15421	16476
23846	16525
23846	16526
23846	16517
15424	16547
12385	13194
12386	13195
15365	15225
12411	14587
12412	14588
15413	14590
15413	14589
15413	14591
12422	15173
12404	14577
15366	15226
15405	15172
15405	15871
15405	15870
15387	15949
15384	5826
4109	5827
4136	7401
7870	11509
7871	11510
23845	11950
23845	13136
23845	13135
12371	13137
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY type_of_work_hours (id, version, name, code, default_price, enabled, code_autogenerated) FROM stdin;
1212	2	Default	WORK_HOURS_TYPE0001	30.00	t	t
1213	1	Overtime	WORK_HOURS_TYPE0002	50.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY unit_type (id, version, code, measure, code_autogenerated) FROM stdin;
1515	8	UNIT_TYPE0001	units	t
1516	7	UNIT_TYPE0002	kg	t
1517	6	UNIT_TYPE0003	km	t
1518	5	UNIT_TYPE0004	l	t
1519	4	UNIT_TYPE0005	m	t
1520	3	UNIT_TYPE0006	m2	t
1521	2	UNIT_TYPE0007	m3	t
1522	1	UNIT_TYPE0008	tn	t
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY user_profiles (user_id, profile_id) FROM stdin;
1822	1415
1823	1416
1824	1418
1825	1419
1826	1414
1827	1420
\.


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY user_table (id, version, login_name, password, email, disabled, lastconnectedscenario, libreplan_user, application_language, expand_company_planning_view_charts, expand_order_planning_view_charts, expand_resource_load_view_charts, first_name, last_name, projects_filter_period_since, projects_filter_period_to, resources_load_filter_period_since, resources_load_filter_period_to, projects_filter_label_id, resources_load_filter_criterion_id) FROM stdin;
1819	1	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1820	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1821	1	wssubcontracting	ce46d7f9a6d17b8ed0eceb71944154b5e42884eef2a111f2a3609b827d9cc2c5c007b9f04343eeb9c8db28696d1426c3c29c2fee2e95332790a9c208b1602224	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1822	1	manager	4a9c5fecbaa3c8fe4facd803e0f85aded921757addc9072758fac7811dda1bc7d1ae0c2c91f48e604d0b61b21d3c3f7b19f8d176f28c4e3aa3eacb0cd263c016	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1823	1	hresources	9cef1471412b2d225ca48841f390402ac14127682efdaafc0463114df6e77c7f46aeac5f7e828369eae3d32d6b1e002c0f333bb13723d765be9477be841b82de	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1824	1	outsourcing	4e7e9a5e908c11370a48a90214134647f9429865172f76dd2c80df01d39b6c503b57268d1f02cb04ee590a0c357d8b2dcf91ceb21ffb622b5a77ff707fa4fc3a	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1825	1	reports	f61ce5c70ced64bdc89bb9ded8dd2076baefb51a45997b5aca911e0d2df7997605c7fc3b6c793fa886591b531e3c2430e31e8cce3a495b59c8e5b11c889f3e85	\N	t	\N	t	0	f	t	t			\N	\N	\N	\N	\N	\N
1827	1	Test_ChefDeProjet	81816718e32f66f1ef369f1372d2de1239dd8d69d25f20279aac6fdefc27a2d0f05a5d4d7715ef9f0ba4323f78c5dc12dd56bd61fb5ce1d98777e290c08b7ddc	\N	f	\N	t	0	f	t	t	Chef	De Projet	\N	\N	\N	\N	\N	\N
1826	9	mathilde.roger@renater.fr	ed52789c575d795c16c114505882bbde8a697a61c4edc4572236366eb9b6931936974b11cad30b8ec5a02f646ecd75f6a6f5bbb94c69c9f94e5c682398a26603	mathilde.roger@renater.fr	f	\N	f	0	f	t	t	Mathilde	Roger	\N	\N	\N	\N	\N	\N
1818	4	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	\N	t	3	f	t	t			\N	\N	\N	\N	\N	\N
2835	6	course_25_RC	a35a12a97bfa713eeae7bed774917db95983f6f77648366e5d6aa08338b44d217da4ddc2aeab240f866a19d44750fae7dee25663f5e95fc70f3144f6b857e419	roland.cholet@renater.fr	f	\N	t	0	f	t	t	roland	cholet	\N	\N	\N	\N	\N	\N
2830	4	course_24_XM	0d7ea47a069a89103c55825afe8354bfe75c089417d3a29dd18afde077b26a666394346be1254d8a469ccd218b0db78f201b5a3f0eb0abba7f68bef9cd3f7195	xavier.misseri@renater.fr	f	\N	t	0	f	t	t	Xavier	Misseri	\N	\N	\N	\N	\N	\N
2828	2	course_28_cg	f8004c0dda64c7f8db5ff1a556ea4885ceafcfb068c2f97d1cb25a0d0c80c30596bac51ad128b35afa21aae05bcc21b272174aeea33f663a4bf03a1649103aac	claude.gross@renater.fr	f	\N	t	0	f	t	t	Claude	Gross	\N	\N	\N	\N	\N	\N
2829	4	course_27_li	2cba64b985b0e9e71089c5201643de3391520357a208774654ff19c3b624cd44856a7474ec54442c4ae62bab007d3f0309fda74ba8c0587ce7b1302badb99473	ludovic.ishiomin@renater.fr	f	\N	t	0	f	t	t	Ludo	Isio	\N	\N	\N	\N	\N	\N
2833	3	course_22_ng	a5a83a504a593546305af5a8a8e19b867a474126bb4826b3ec0505c7b95e0c66731ee3979af41b1cfcb222ac205a3daaff81dd5c59b376fdb4304d8878e4a6dc	nicolas.garnier@renater.fr	f	\N	t	3	f	t	t	nicolas	garnier	\N	\N	\N	\N	\N	\N
2831	2	course_23_dg	ccd0dffcacc55f58c9632ab6feac015aa4d42d83e41d67b1a0aeac955ad2771b53cc92e17e60c99d3d89dde3fbd6d168e5ed8d24c1c1280562fbdc50851d5a64	dahlia.gokana@renater.fr	f	\N	t	3	f	t	t	Dahlia	GOKANA	\N	\N	\N	\N	\N	\N
2834	4	course_21_SG	d83207e556cc03c5c0e0a15cb2a049aef049963341668b6851b60bdf9145f41832ee76f6028a98bec97c974d35459a7d81381f934bea2bbc079f15428f3c64ac	sylvain.guillemenot@renater.fr	f	\N	t	3	f	t	t	sylvain	guillemenot	\N	\N	\N	\N	\N	\N
2832	5	course_26_SH	b75cdd516f790e993a5458167c0619d13aa15a73401e31412cc59b1a51bd403aea7868d67b3f130a066bc96095ccb8fd8d9332906fd08ece82202c826b242c0a	sami.honein@renater.fr	f	\N	t	0	f	t	t	Sami	Honein	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: virtual_worker; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY virtual_worker (virtual_worker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY work_report (id, version, code, date, code_autogenerated, last_work_report_line_sequence_code, ork_report_type_id, resource_id, order_element_id) FROM stdin;
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY work_report_label_type_assigment (id, version, labels_shared_by_lines, position_number, label_type_id, label_id, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY work_report_line (id, version, code, effort, date, clock_start, clock_finish, work_report_id, resource_id, order_element_id, type_work_hours_id, finished) FROM stdin;
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY work_report_type (id, version, name, code, date_is_shared_by_lines, resource_is_shared_in_lines, order_element_is_shared_in_lines, code_autogenerated, hours_management) FROM stdin;
707	3	Default	WORKREPORTTYPE0001	f	f	f	t	0
708	2	Personal timesheets	WORKREPORTTYPE0002	f	t	f	t	0
709	1	JIRA timesheets	WORKREPORTTYPE0003	f	f	f	t	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY worker (worker_id, first_name, surname, nif, user_id) FROM stdin;
2982	28-worker-3	28-surname-3	28-3	\N
2946	26-worker a	26-worker b	2	\N
2984	28-worker-4	28-surname-4	28-4	\N
2944	22-peon-5	22-dutravail?	46	\N
2991	25-worker-2	25-surname-2	RD	\N
2993	25-worker-3	25-surname-3	RE	\N
2954	21-worker-2	21-surname-2	22	\N
3007	23-worker-2	23-surname-2	2222	\N
2952	26-def	26-abc	3	\N
2995	27-mon-deuxieme	27-esclave	un-autre-esclave	\N
2933	22-peon-2	22-mylord!	43	\N
2958	26-worker-4	26-surname-4	4	\N
2935	22-peon-3	22-stopclickingonme	44	\N
3009	23-worker-3	23-surname-3	3333	\N
2997	27-une	27-servante	27-une-servante	\N
2939	22-peon-4	22-Huuuh?	45	\N
3013	23-worker-5	23-surname-5	55555	\N
2961	21-worker-5	21-surname-5	25	\N
3011	23-worker-4	23-surname-4	4444	\N
2970	24-worker-2	24-surname-2	24-2	\N
2972	24-worker-3	24-surname-3	24-3	\N
2966	24-worker-1	24-surname-1	24-1	\N
2941	21-worker-1	21-surname-1	21	\N
2974	24-worker-4	24-surname-4	24-4	\N
2977	24-worker-5	24-surname-5	24-5	\N
2940	26-worker-1	26-surname-1	1	\N
2989	27-mon	27-esclave	un-esclave	\N
2963	25-WORKER-1	25-surname-1	RC	\N
2956	21-worker-3	21-surname-3	23	\N
2931	22-peon-1	22-zogzog	42	\N
2951	23-worker-1	23-surname-1	1111	\N
2986	28-worker-5	28-surname-5	28-5	\N
2959	21-worker-4	21-surname-4	24	\N
3000	25-worker-4	25-surname-4	RF	\N
2969	28-worker-1	28-surname-1	28-1	\N
3003	27-une	27-deuxième-servante	27-une-deuxième-servante	\N
3004	25-worker-5	25-surname-5	RG	\N
2978	28-worker-2	28-surname-2	28-2	\N
\.


--
-- Data for Name: workreports_labels; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY workreports_labels (work_report_id, label_id) FROM stdin;
\.


--
-- Data for Name: workreportslines_labels; Type: TABLE DATA; Schema: public; Owner: libreplan
--

COPY workreportslines_labels (work_report_line_id, label_id) FROM stdin;
\.


--
-- Name: advance_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY advance_assignment
    ADD CONSTRAINT advance_assignment_pkey PRIMARY KEY (id);


--
-- Name: advance_assignment_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY advance_assignment_template
    ADD CONSTRAINT advance_assignment_template_pkey PRIMARY KEY (id);


--
-- Name: advance_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY advance_measurement
    ADD CONSTRAINT advance_measurement_pkey PRIMARY KEY (id);


--
-- Name: advance_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY advance_type
    ADD CONSTRAINT advance_type_pkey PRIMARY KEY (id);


--
-- Name: advance_type_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY advance_type
    ADD CONSTRAINT advance_type_unit_name_key UNIQUE (unit_name);


--
-- Name: all_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT all_criterions_pkey PRIMARY KEY (generic_resource_allocation_id, criterion_id);


--
-- Name: assignment_function_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY assignment_function
    ADD CONSTRAINT assignment_function_pkey PRIMARY KEY (id);


--
-- Name: base_calendar_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY base_calendar
    ADD CONSTRAINT base_calendar_code_key UNIQUE (code);


--
-- Name: base_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY base_calendar
    ADD CONSTRAINT base_calendar_pkey PRIMARY KEY (id);


--
-- Name: calendar_availability_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_availability
    ADD CONSTRAINT calendar_availability_code_key UNIQUE (code);


--
-- Name: calendar_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_availability
    ADD CONSTRAINT calendar_availability_pkey PRIMARY KEY (id);


--
-- Name: calendar_data_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_data
    ADD CONSTRAINT calendar_data_code_key UNIQUE (code);


--
-- Name: calendar_data_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_data
    ADD CONSTRAINT calendar_data_pkey PRIMARY KEY (id);


--
-- Name: calendar_exception_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_exception
    ADD CONSTRAINT calendar_exception_code_key UNIQUE (code);


--
-- Name: calendar_exception_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_exception
    ADD CONSTRAINT calendar_exception_pkey PRIMARY KEY (id);


--
-- Name: calendar_exception_type_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_exception_type
    ADD CONSTRAINT calendar_exception_type_code_key UNIQUE (code);


--
-- Name: calendar_exception_type_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_exception_type
    ADD CONSTRAINT calendar_exception_type_name_key UNIQUE (name);


--
-- Name: calendar_exception_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY calendar_exception_type
    ADD CONSTRAINT calendar_exception_type_pkey PRIMARY KEY (id);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: connector_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY connector
    ADD CONSTRAINT connector_pkey PRIMARY KEY (id);


--
-- Name: connector_property_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY connector_property
    ADD CONSTRAINT connector_property_pkey PRIMARY KEY (connector_id, connector_property_position);


--
-- Name: consolidated_value_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY consolidated_value
    ADD CONSTRAINT consolidated_value_pkey PRIMARY KEY (id);


--
-- Name: consolidation_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT consolidation_pkey PRIMARY KEY (id);


--
-- Name: cost_category_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_code_key UNIQUE (code);


--
-- Name: cost_category_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_name_key UNIQUE (name);


--
-- Name: cost_category_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_pkey PRIMARY KEY (id);


--
-- Name: criterion_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_code_key UNIQUE (code);


--
-- Name: criterion_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_name_key UNIQUE (id_criterion_type, name);


--
-- Name: criterion_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_pkey PRIMARY KEY (id);


--
-- Name: criterion_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT criterion_requirement_pkey PRIMARY KEY (id);


--
-- Name: criterion_satisfaction_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_satisfaction
    ADD CONSTRAINT criterion_satisfaction_code_key UNIQUE (code);


--
-- Name: criterion_satisfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_satisfaction
    ADD CONSTRAINT criterion_satisfaction_pkey PRIMARY KEY (id);


--
-- Name: criterion_type_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_type
    ADD CONSTRAINT criterion_type_code_key UNIQUE (code);


--
-- Name: criterion_type_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_type
    ADD CONSTRAINT criterion_type_name_key UNIQUE (name);


--
-- Name: criterion_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY criterion_type
    ADD CONSTRAINT criterion_type_pkey PRIMARY KEY (id);


--
-- Name: customer_comunication_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY customer_communication
    ADD CONSTRAINT customer_comunication_pkey PRIMARY KEY (id);


--
-- Name: day_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT day_assignment_pkey PRIMARY KEY (id);


--
-- Name: deadline_comunication_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY deadline_communication
    ADD CONSTRAINT deadline_comunication_pkey PRIMARY KEY (id);


--
-- Name: dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (id);


--
-- Name: derived_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY derived_allocation
    ADD CONSTRAINT derived_allocation_pkey PRIMARY KEY (id);


--
-- Name: derived_day_assignments_container_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY derived_day_assignments_container
    ADD CONSTRAINT derived_day_assignments_container_pkey PRIMARY KEY (id);


--
-- Name: direct_advance_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY direct_advance_assignment
    ADD CONSTRAINT direct_advance_assignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: effort_per_day_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY capacity_per_day
    ADD CONSTRAINT effort_per_day_pkey PRIMARY KEY (base_calendar_id, day_id);


--
-- Name: end_date_communication_to_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY end_date_communication
    ADD CONSTRAINT end_date_communication_to_customer_pkey PRIMARY KEY (id);


--
-- Name: entity_sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY entity_sequence
    ADD CONSTRAINT entity_sequence_pkey PRIMARY KEY (id);


--
-- Name: expense_sheet_line_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY expense_sheet_line
    ADD CONSTRAINT expense_sheet_line_pkey PRIMARY KEY (id);


--
-- Name: expense_sheet_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY expense_sheet
    ADD CONSTRAINT expense_sheet_pkey PRIMARY KEY (id);


--
-- Name: external_company_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_name_key UNIQUE (name);


--
-- Name: external_company_nif_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_nif_key UNIQUE (nif);


--
-- Name: external_company_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_pkey PRIMARY KEY (id);


--
-- Name: generic_day_assignments_container_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY generic_day_assignments_container
    ADD CONSTRAINT generic_day_assignments_container_pkey PRIMARY KEY (id);


--
-- Name: generic_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT generic_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: hour_cost_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_code_key UNIQUE (code);


--
-- Name: hour_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_pkey PRIMARY KEY (id);


--
-- Name: hours_group_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY hours_group
    ADD CONSTRAINT hours_group_code_key UNIQUE (code);


--
-- Name: hours_group_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY hours_group
    ADD CONSTRAINT hours_group_pkey PRIMARY KEY (id);


--
-- Name: indirect_advance_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY indirect_advance_assignment
    ADD CONSTRAINT indirect_advance_assignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: label_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_code_key UNIQUE (code);


--
-- Name: label_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_name_key UNIQUE (label_type_id, name);


--
-- Name: label_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: label_type_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_code_key UNIQUE (code);


--
-- Name: label_type_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_name_key UNIQUE (name);


--
-- Name: label_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT limiting_resource_queue_dependency_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_resource_allocation_id_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_resource_allocation_id_key UNIQUE (resource_allocation_id);


--
-- Name: limiting_resource_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_resource_id_key UNIQUE (resource_id);


--
-- Name: machine_configuration_unit_required_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT machine_configuration_unit_required_criterions_pkey PRIMARY KEY (id, criterion_id);


--
-- Name: machine_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (machine_id);


--
-- Name: machine_worker_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY machine_worker_assignment
    ADD CONSTRAINT machine_worker_assignment_pkey PRIMARY KEY (id);


--
-- Name: machine_workers_configuration_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY machine_workers_configuration_unit
    ADD CONSTRAINT machine_workers_configuration_unit_pkey PRIMARY KEY (id);


--
-- Name: manual_function_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY manual_function
    ADD CONSTRAINT manual_function_pkey PRIMARY KEY (assignment_function_id);


--
-- Name: material_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT material_assigment_pkey PRIMARY KEY (id);


--
-- Name: material_assigment_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT material_assigment_template_pkey PRIMARY KEY (id);


--
-- Name: material_category_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_code_key UNIQUE (code);


--
-- Name: material_category_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_pkey PRIMARY KEY (id);


--
-- Name: material_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_code_key UNIQUE (code);


--
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: order_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT order_authorization_pkey PRIMARY KEY (id);


--
-- Name: order_element_label_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT order_element_label_pkey PRIMARY KEY (order_element_id, label_id);


--
-- Name: order_element_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_element
    ADD CONSTRAINT order_element_pkey PRIMARY KEY (id);


--
-- Name: order_element_template_label_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT order_element_template_label_pkey PRIMARY KEY (order_element_template_id, label_id);


--
-- Name: order_element_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_element_template
    ADD CONSTRAINT order_element_template_pkey PRIMARY KEY (id);


--
-- Name: order_element_template_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT order_element_template_quality_form_pkey PRIMARY KEY (order_element_template_id, quality_form_id);


--
-- Name: order_line_group_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_line_group
    ADD CONSTRAINT order_line_group_pkey PRIMARY KEY (order_element_id);


--
-- Name: order_line_group_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_line_group_template
    ADD CONSTRAINT order_line_group_template_pkey PRIMARY KEY (group_template_id);


--
-- Name: order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_pkey PRIMARY KEY (order_element_id);


--
-- Name: order_line_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_line_template
    ADD CONSTRAINT order_line_template_pkey PRIMARY KEY (order_line_template_id);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (order_element_id);


--
-- Name: order_template_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_template
    ADD CONSTRAINT order_template_pkey PRIMARY KEY (order_template_id);


--
-- Name: order_version_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_version
    ADD CONSTRAINT order_version_pkey PRIMARY KEY (id);


--
-- Name: pk_configuration_roles_ldap; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY configuration_roles_ldap
    ADD CONSTRAINT pk_configuration_roles_ldap PRIMARY KEY (role_libreplan, role_ldap);


--
-- Name: pk_databasechangelog; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY databasechangelog
    ADD CONSTRAINT pk_databasechangelog PRIMARY KEY (id, author, filename);


--
-- Name: pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: pk_job_scheduler_configuration; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY job_scheduler_configuration
    ADD CONSTRAINT pk_job_scheduler_configuration PRIMARY KEY (id);


--
-- Name: pk_order_sync_info; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY order_sync_info
    ADD CONSTRAINT pk_order_sync_info PRIMARY KEY (id);


--
-- Name: planning_data_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY planning_data
    ADD CONSTRAINT planning_data_pkey PRIMARY KEY (planning_data_id);


--
-- Name: profile_table_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY profile_table
    ADD CONSTRAINT profile_table_pkey PRIMARY KEY (id);


--
-- Name: profile_table_profile_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY profile_table
    ADD CONSTRAINT profile_table_profile_name_key UNIQUE (profile_name);


--
-- Name: quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT quality_form_items_pkey PRIMARY KEY (quality_form_id, idx);


--
-- Name: quality_form_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_name_key UNIQUE (name);


--
-- Name: quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_pkey PRIMARY KEY (id);


--
-- Name: resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resource_allocation
    ADD CONSTRAINT resource_allocation_pkey PRIMARY KEY (id);


--
-- Name: resource_base_calendar_id_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_base_calendar_id_key UNIQUE (base_calendar_id);


--
-- Name: resource_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resource_calendar
    ADD CONSTRAINT resource_calendar_pkey PRIMARY KEY (base_calendar_id);


--
-- Name: resource_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_code_key UNIQUE (code);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resources_cost_category_assignment_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_code_key UNIQUE (code);


--
-- Name: resources_cost_category_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_pkey PRIMARY KEY (id);


--
-- Name: scenario_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT scenario_orders_pkey PRIMARY KEY (scenario_id, order_id);


--
-- Name: scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- Name: scheduling_data_for_version_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY scheduling_data_for_version
    ADD CONSTRAINT scheduling_data_for_version_pkey PRIMARY KEY (id);


--
-- Name: scheduling_states_by_order_version_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT scheduling_states_by_order_version_pkey PRIMARY KEY (order_element_id, order_version_id);


--
-- Name: sigmoid_function_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY sigmoid_function
    ADD CONSTRAINT sigmoid_function_pkey PRIMARY KEY (assignment_function_id);


--
-- Name: specific_day_assignments_container_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY specific_day_assignments_container
    ADD CONSTRAINT specific_day_assignments_container_pkey PRIMARY KEY (id);


--
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: stretches_function_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY stretches_function
    ADD CONSTRAINT stretches_function_pkey PRIMARY KEY (assignment_function_id);


--
-- Name: stretches_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT stretches_pkey PRIMARY KEY (assignment_function_id, stretch_position);


--
-- Name: subcontracted_task_data_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY subcontracted_task_data
    ADD CONSTRAINT subcontracted_task_data_pkey PRIMARY KEY (id);


--
-- Name: subcontractor_comunication_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY subcontractor_communication
    ADD CONSTRAINT subcontractor_comunication_pkey PRIMARY KEY (id);


--
-- Name: subcontrator_deliver_date_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY subcontractor_deliver_date
    ADD CONSTRAINT subcontrator_deliver_date_pkey PRIMARY KEY (id);


--
-- Name: sum_charged_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY sum_charged_effort
    ADD CONSTRAINT sum_charged_hours_pkey PRIMARY KEY (id);


--
-- Name: sum_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY sum_expenses
    ADD CONSTRAINT sum_expenses_pkey PRIMARY KEY (id);


--
-- Name: task_element_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_element
    ADD CONSTRAINT task_element_pkey PRIMARY KEY (id);


--
-- Name: task_group_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_group
    ADD CONSTRAINT task_group_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_milestone
    ADD CONSTRAINT task_milestone_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT task_quality_form_items_pkey PRIMARY KEY (task_quality_form_id, idx);


--
-- Name: task_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT task_quality_form_pkey PRIMARY KEY (id);


--
-- Name: task_source_hours_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT task_source_hours_groups_pkey PRIMARY KEY (task_source_id, hours_group_id);


--
-- Name: task_source_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_source
    ADD CONSTRAINT task_source_pkey PRIMARY KEY (id);


--
-- Name: task_source_schedulingdata_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task_source
    ADD CONSTRAINT task_source_schedulingdata_key UNIQUE (schedulingdata);


--
-- Name: task_subcontrated_task_data_id_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_subcontrated_task_data_id_key UNIQUE (subcontrated_task_data_id);


--
-- Name: type_of_work_hours_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_code_key UNIQUE (code);


--
-- Name: type_of_work_hours_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_name_key UNIQUE (name);


--
-- Name: type_of_work_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_pkey PRIMARY KEY (id);


--
-- Name: unit_type_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_code_key UNIQUE (code);


--
-- Name: unit_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id, profile_id);


--
-- Name: user_table_login_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_login_name_key UNIQUE (login_name);


--
-- Name: user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id);


--
-- Name: virtual_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY virtual_worker
    ADD CONSTRAINT virtual_worker_pkey PRIMARY KEY (virtual_worker_id);


--
-- Name: work_report_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_code_key UNIQUE (code);


--
-- Name: work_report_label_type_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT work_report_label_type_assigment_pkey PRIMARY KEY (id);


--
-- Name: work_report_line_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_code_key UNIQUE (code);


--
-- Name: work_report_line_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_pkey PRIMARY KEY (id);


--
-- Name: work_report_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_pkey PRIMARY KEY (id);


--
-- Name: work_report_type_code_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_code_key UNIQUE (code);


--
-- Name: work_report_type_name_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_name_key UNIQUE (name);


--
-- Name: work_report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_pkey PRIMARY KEY (id);


--
-- Name: worker_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (worker_id);


--
-- Name: worker_user_id_key; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT worker_user_id_key UNIQUE (user_id);


--
-- Name: workreports_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT workreports_labels_pkey PRIMARY KEY (work_report_id, label_id);


--
-- Name: workreportslines_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: libreplan; Tablespace: 
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT workreportslines_labels_pkey PRIMARY KEY (work_report_line_id, label_id);


--
-- Name: configuration_type_of_work_hours_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_type_of_work_hours_fkey FOREIGN KEY (personal_timesheets_type_of_work_hours) REFERENCES type_of_work_hours(id);


--
-- Name: connector_property_connector_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY connector_property
    ADD CONSTRAINT connector_property_connector_id_fkey FOREIGN KEY (connector_id) REFERENCES connector(id);


--
-- Name: expense_sheet_line_expense_sheet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY expense_sheet_line
    ADD CONSTRAINT expense_sheet_line_expense_sheet_fkey FOREIGN KEY (expense_sheet_id) REFERENCES expense_sheet(id);


--
-- Name: expense_sheet_line_order_element_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY expense_sheet_line
    ADD CONSTRAINT expense_sheet_line_order_element_fkey FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: expense_sheet_line_resource_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY expense_sheet_line
    ADD CONSTRAINT expense_sheet_line_resource_fkey FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk101a54bf87fa6b5d; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT fk101a54bf87fa6b5d FOREIGN KEY (task_quality_form_id) REFERENCES task_quality_form(id);


--
-- Name: fk11d365279578651e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk11d365279578651e FOREIGN KEY (category_id) REFERENCES material_category(id);


--
-- Name: fk11d36527f11b2d0; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk11d36527f11b2d0 FOREIGN KEY (unit_type) REFERENCES unit_type(id);


--
-- Name: fk16e20ea114a5c61; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk16e20ea114a5c61 FOREIGN KEY (id_criterion_type) REFERENCES criterion_type(id);


--
-- Name: fk16e20ea13a156175; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk16e20ea13a156175 FOREIGN KEY (parent) REFERENCES criterion(id);


--
-- Name: fk172a16c02f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY direct_advance_assignment
    ADD CONSTRAINT fk172a16c02f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advance_assignment(id);


--
-- Name: fk172a16c0a1127ce5; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY direct_advance_assignment
    ADD CONSTRAINT fk172a16c0a1127ce5 FOREIGN KEY (direct_order_element_id) REFERENCES order_element(id);


--
-- Name: fk1e6bf5475c390c4; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY description_values_in_line
    ADD CONSTRAINT fk1e6bf5475c390c4 FOREIGN KEY (description_value_id) REFERENCES work_report_line(id);


--
-- Name: fk1fc5f45575ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f45575ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resource_allocation(id);


--
-- Name: fk1fc5f455bd2209e8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f455bd2209e8 FOREIGN KEY (limiting_resource_queue_id) REFERENCES limiting_resource_queue(id);


--
-- Name: fk225ff96a8c4c676c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_satisfaction
    ADD CONSTRAINT fk225ff96a8c4c676c FOREIGN KEY (criterion) REFERENCES criterion(id);


--
-- Name: fk225ff96aeae850b2; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_satisfaction
    ADD CONSTRAINT fk225ff96aeae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fk27c2a21648d21790; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk27c2a21648d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk27c2a216c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk27c2a216c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


--
-- Name: fk2908787d415884f6; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY heading_field
    ADD CONSTRAINT fk2908787d415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


--
-- Name: fk2d124245efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT fk2d124245efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fk2e7e6bcc5567ad13; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY roles_table
    ADD CONSTRAINT fk2e7e6bcc5567ad13 FOREIGN KEY (user_id) REFERENCES user_table(id);


--
-- Name: fk31314447937680b7; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT fk31314447937680b7 FOREIGN KEY (machine_id) REFERENCES resource(id);


--
-- Name: fk3525435419b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk3525435419b9dfde FOREIGN KEY (order_element_template_id) REFERENCES order_element_template(id);


--
-- Name: fk35254354b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk35254354b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fk35588e2d3ae24ff8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY consolidated_value
    ADD CONSTRAINT fk35588e2d3ae24ff8 FOREIGN KEY (consolidation_id) REFERENCES consolidation(id);


--
-- Name: fk35588e2db96bba28; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY consolidated_value
    ADD CONSTRAINT fk35588e2db96bba28 FOREIGN KEY (advance_measurement_id) REFERENCES advance_measurement(id);


--
-- Name: fk35bc4ed63804cfa; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY subcontracted_task_data
    ADD CONSTRAINT fk35bc4ed63804cfa FOREIGN KEY (external_company) REFERENCES external_company(id);


--
-- Name: fk3635854936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk3635854936bb8c FOREIGN KEY (task_element_id) REFERENCES task_element(id);


--
-- Name: fk3635855b595a0; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk3635855b595a0 FOREIGN KEY (subcontrated_task_data_id) REFERENCES subcontracted_task_data(id);


--
-- Name: fk3b9a8148c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fk3b9a8148c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


--
-- Name: fk3b9a8148d5b6184d; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fk3b9a8148d5b6184d FOREIGN KEY (type_of_work_hours_id) REFERENCES type_of_work_hours(id);


--
-- Name: fk4339b2e41638aab; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_template
    ADD CONSTRAINT fk4339b2e41638aab FOREIGN KEY (parent) REFERENCES order_line_group_template(group_template_id);


--
-- Name: fk4356e07e8b37665c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk4356e07e8b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fk4356e07eefda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk4356e07eefda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fk4949f0241a5e11f8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY stretches_function
    ADD CONSTRAINT fk4949f0241a5e11f8 FOREIGN KEY (assignment_function_id) REFERENCES assignment_function(id);


--
-- Name: fk4d9497454936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_group
    ADD CONSTRAINT fk4d9497454936bb8c FOREIGN KEY (task_element_id) REFERENCES task_element(id);


--
-- Name: fk557738bca44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY calendar_availability
    ADD CONSTRAINT fk557738bca44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fk5948535228f2695; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk5948535228f2695 FOREIGN KEY (origin_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk59485352e42f8d29; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk59485352e42f8d29 FOREIGN KEY (destiny_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk616de2a319b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fk616de2a319b9dfde FOREIGN KEY (order_element_template_id) REFERENCES order_element_template(id);


--
-- Name: fk616de2a3c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fk616de2a3c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fk61f7ef4707cd777; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY label
    ADD CONSTRAINT fk61f7ef4707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fk6476ce4b9a4a7d90; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_template
    ADD CONSTRAINT fk6476ce4b9a4a7d90 FOREIGN KEY (order_template_id) REFERENCES order_line_group_template(group_template_id);


--
-- Name: fk6476ce4ba44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_template
    ADD CONSTRAINT fk6476ce4ba44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fk64cbad3b218d7620; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY indirect_advance_assignment
    ADD CONSTRAINT fk64cbad3b218d7620 FOREIGN KEY (indirect_order_element_id) REFERENCES order_element(id);


--
-- Name: fk64cbad3b2f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY indirect_advance_assignment
    ADD CONSTRAINT fk64cbad3b2f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advance_assignment(id);


--
-- Name: fk64cbad3b8202350f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY indirect_advance_assignment
    ADD CONSTRAINT fk64cbad3b8202350f FOREIGN KEY (indirect_order_element_id) REFERENCES order_line_group(order_element_id);


--
-- Name: fk672eed98efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scheduling_data_for_version
    ADD CONSTRAINT fk672eed98efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fk733374f6cc119699; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk733374f6cc119699 FOREIGN KEY (configuration_id) REFERENCES base_calendar(id);


--
-- Name: fk7358465a4cd98327; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT fk7358465a4cd98327 FOREIGN KEY (lastconnectedscenario) REFERENCES scenario(id);


--
-- Name: fk74fc040b7fa34e3f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY calendar_data
    ADD CONSTRAINT fk74fc040b7fa34e3f FOREIGN KEY (parent) REFERENCES base_calendar(id);


--
-- Name: fk74fc040ba44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY calendar_data
    ADD CONSTRAINT fk74fc040ba44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fk75a2f39d4ec080cf; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39d4ec080cf FOREIGN KEY (customer) REFERENCES external_company(id);


--
-- Name: fk75a2f39d504f463e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39d504f463e FOREIGN KEY (order_element_id) REFERENCES order_line_group(order_element_id);


--
-- Name: fk75a2f39da44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39da44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fk7950e0153d72bc6f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_source
    ADD CONSTRAINT fk7950e0153d72bc6f FOREIGN KEY (id) REFERENCES task_element(id);


--
-- Name: fk7950e0159a2c0abd; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_source
    ADD CONSTRAINT fk7950e0159a2c0abd FOREIGN KEY (schedulingdata) REFERENCES scheduling_data_for_version(id);


--
-- Name: fk7980035061f02c44; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk7980035061f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk79800350b1524a73; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk79800350b1524a73 FOREIGN KEY (generic_resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fk7d1ee2c5fec79eb0; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY description_values
    ADD CONSTRAINT fk7d1ee2c5fec79eb0 FOREIGN KEY (description_value_id) REFERENCES work_report(id);


--
-- Name: fk7e57469848d21790; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT fk7e57469848d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk84c66516b53669f2; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT fk84c66516b53669f2 FOREIGN KEY (parent_id) REFERENCES material_category(id);


--
-- Name: fk84f61df123b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fk84f61df123b85cf1 FOREIGN KEY (order_version_id) REFERENCES order_version(id);


--
-- Name: fk84f61df19bfe55d0; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fk84f61df19bfe55d0 FOREIGN KEY (scheduling_state_for_version_id) REFERENCES scheduling_data_for_version(id);


--
-- Name: fk84f61df1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fk84f61df1efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fk88eecef415884f6; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY line_field
    ADD CONSTRAINT fk88eecef415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


--
-- Name: fk91bbca7423b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk91bbca7423b85cf1 FOREIGN KEY (order_version_id) REFERENCES order_version(id);


--
-- Name: fk91bbca7487287288; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk91bbca7487287288 FOREIGN KEY (order_id) REFERENCES order_table(order_element_id);


--
-- Name: fk91bbca74c0fb9d8e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk91bbca74c0fb9d8e FOREIGN KEY (scenario_id) REFERENCES scenario(id);


--
-- Name: fk92271f0b1e635c19; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element
    ADD CONSTRAINT fk92271f0b1e635c19 FOREIGN KEY (parent) REFERENCES order_line_group(order_element_id);


--
-- Name: fk92271f0bd97bcc8c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element
    ADD CONSTRAINT fk92271f0bd97bcc8c FOREIGN KEY (template) REFERENCES order_element_template(id);


--
-- Name: fk95548d7861f02c44; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7861f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk95548d7875999a91; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7875999a91 FOREIGN KEY (id) REFERENCES machine_workers_configuration_unit(id);


--
-- Name: fk9619184fa44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resource_calendar
    ADD CONSTRAINT fk9619184fa44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fk9c819f74ddc82952; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_line_group_template
    ADD CONSTRAINT fk9c819f74ddc82952 FOREIGN KEY (group_template_id) REFERENCES order_element_template(id);


--
-- Name: fka01fe4ee8c80ccb7; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4ee8c80ccb7 FOREIGN KEY (task_source_id) REFERENCES task_source(id);


--
-- Name: fka01fe4eee036cfed; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4eee036cfed FOREIGN KEY (hours_group_id) REFERENCES hours_group(id);


--
-- Name: fka215508ea44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY calendar_exception
    ADD CONSTRAINT fka215508ea44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fka215508eadad7e51; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY calendar_exception
    ADD CONSTRAINT fka215508eadad7e51 FOREIGN KEY (calendar_exception_id) REFERENCES calendar_exception_type(id);


--
-- Name: fka2c1583686b2de7a; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine_worker_assignment
    ADD CONSTRAINT fka2c1583686b2de7a FOREIGN KEY (configuration_id) REFERENCES machine_workers_configuration_unit(id);


--
-- Name: fka2c158369bebcf10; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine_worker_assignment
    ADD CONSTRAINT fka2c158369bebcf10 FOREIGN KEY (worker_id) REFERENCES worker(worker_id);


--
-- Name: fka391ce7a2380ca7; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_version
    ADD CONSTRAINT fka391ce7a2380ca7 FOREIGN KEY (ownerscenario) REFERENCES scenario(id);


--
-- Name: fkad6003c58b37665c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT fkad6003c58b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fkb3e9425b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkb3e9425b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fkb3e9425efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkb3e9425efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fkb83176c31b8e7cf2; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY derived_day_assignments_container
    ADD CONSTRAINT fkb83176c31b8e7cf2 FOREIGN KEY (derived_allocation_id) REFERENCES derived_allocation(id);


--
-- Name: fkb83176c3421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY derived_day_assignments_container
    ADD CONSTRAINT fkb83176c3421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fkb92b59485567ad13; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fkb92b59485567ad13 FOREIGN KEY (user_id) REFERENCES user_table(id);


--
-- Name: fkb92b594887287288; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fkb92b594887287288 FOREIGN KEY (order_id) REFERENCES order_table(order_element_id);


--
-- Name: fkb92b5948edc4db41; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fkb92b5948edc4db41 FOREIGN KEY (profile_id) REFERENCES profile_table(id);


--
-- Name: fkbb262920131853a1; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkbb262920131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fkbb262920707cd777; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkbb262920707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fkbb262920c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkbb262920c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkbb493f5019256004; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5019256004 FOREIGN KEY (generic_container_id) REFERENCES generic_day_assignments_container(id);


--
-- Name: fkbb493f5048d21790; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5048d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbb493f50510e7a78; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50510e7a78 FOREIGN KEY (derived_container_id) REFERENCES derived_day_assignments_container(id);


--
-- Name: fkbb493f50756348a8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50756348a8 FOREIGN KEY (specific_container_id) REFERENCES specific_day_assignments_container(id);


--
-- Name: fkbb58534c6ccf87c5; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY planning_data
    ADD CONSTRAINT fkbb58534c6ccf87c5 FOREIGN KEY (planning_data_id) REFERENCES task_group(task_element_id);


--
-- Name: fkc01655fd421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY generic_day_assignments_container
    ADD CONSTRAINT fkc01655fd421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fkc01655fdee970b; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY generic_day_assignments_container
    ADD CONSTRAINT fkc01655fdee970b FOREIGN KEY (resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fkc405554bfd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY capacity_per_day
    ADD CONSTRAINT fkc405554bfd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendar_data(id);


--
-- Name: fkc631a642a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_element
    ADD CONSTRAINT fkc631a642a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES base_calendar(id);


--
-- Name: fkc631a642a5f3c581; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_element
    ADD CONSTRAINT fkc631a642a5f3c581 FOREIGN KEY (parent) REFERENCES task_group(task_element_id);


--
-- Name: fkc74605de5567ad13; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fkc74605de5567ad13 FOREIGN KEY (user_id) REFERENCES user_table(id);


--
-- Name: fkc74605deedc4db41; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fkc74605deedc4db41 FOREIGN KEY (profile_id) REFERENCES profile_table(id);


--
-- Name: fkc9400e2c430ea1de; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkc9400e2c430ea1de FOREIGN KEY (ind_advance_assignment_id) REFERENCES indirect_advance_assignment(advance_assignment_id);


--
-- Name: fkc9400e2c9f1d6611; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkc9400e2c9f1d6611 FOREIGN KEY (dir_advance_assignment_id) REFERENCES direct_advance_assignment(advance_assignment_id);


--
-- Name: fkc9400e2cff2b2ba3; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkc9400e2cff2b2ba3 FOREIGN KEY (id) REFERENCES task(task_element_id);


--
-- Name: fkc9c3fe691a5e11f8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY sigmoid_function
    ADD CONSTRAINT fkc9c3fe691a5e11f8 FOREIGN KEY (assignment_function_id) REFERENCES assignment_function(id);


--
-- Name: fkcb8fc1cd5078e161; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fkcb8fc1cd5078e161 FOREIGN KEY (work_report_line_id) REFERENCES work_report_line(id);


--
-- Name: fkcb8fc1cdc1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fkcb8fc1cdc1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkcee46998421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY specific_day_assignments_container
    ADD CONSTRAINT fkcee46998421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fkcee469987518838c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY specific_day_assignments_container
    ADD CONSTRAINT fkcee469987518838c FOREIGN KEY (resource_allocation_id) REFERENCES specific_resource_allocation(resource_allocation_id);


--
-- Name: fkd04de7364936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY task_milestone
    ADD CONSTRAINT fkd04de7364936bb8c FOREIGN KEY (task_element_id) REFERENCES task_element(id);


--
-- Name: fkd162537e40901220; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT fkd162537e40901220 FOREIGN KEY (worker_id) REFERENCES resource(id);


--
-- Name: fkd1c57390fd99606d; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT fkd1c57390fd99606d FOREIGN KEY (predecessor) REFERENCES scenario(id);


--
-- Name: fkd4192eaab216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY advance_assignment
    ADD CONSTRAINT fkd4192eaab216ed4c FOREIGN KEY (advance_type_id) REFERENCES advance_type(id);


--
-- Name: fkd47281efffeb5538; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY machine_workers_configuration_unit
    ADD CONSTRAINT fkd47281efffeb5538 FOREIGN KEY (machine) REFERENCES machine(machine_id);


--
-- Name: fkd557d8a7edc4db41; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY profile_roles
    ADD CONSTRAINT fkd557d8a7edc4db41 FOREIGN KEY (profile_id) REFERENCES profile_table(id);


--
-- Name: fkd8e14c09b36a6d51; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT fkd8e14c09b36a6d51 FOREIGN KEY (company_user) REFERENCES user_table(id);


--
-- Name: fkd9b7594f1ed629ea; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY hours_group
    ADD CONSTRAINT fkd9b7594f1ed629ea FOREIGN KEY (parent_order_line) REFERENCES order_line(order_element_id);


--
-- Name: fkd9b7594f8bdc6ac6; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY hours_group
    ADD CONSTRAINT fkd9b7594f8bdc6ac6 FOREIGN KEY (order_line_template) REFERENCES order_line_template(order_line_template_id);


--
-- Name: fkd9bfae6f19b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY advance_assignment_template
    ADD CONSTRAINT fkd9bfae6f19b9dfde FOREIGN KEY (order_element_template_id) REFERENCES order_element_template(id);


--
-- Name: fkd9bfae6fb216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY advance_assignment_template
    ADD CONSTRAINT fkd9bfae6fb216ed4c FOREIGN KEY (advance_type_id) REFERENCES advance_type(id);


--
-- Name: fkdaba2f7f2f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY advance_measurement
    ADD CONSTRAINT fkdaba2f7f2f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advance_assignment(id);


--
-- Name: fkdaba2f7fa9e53843; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY advance_measurement
    ADD CONSTRAINT fkdaba2f7fa9e53843 FOREIGN KEY (advance_assignment_id) REFERENCES direct_advance_assignment(advance_assignment_id);


--
-- Name: fkdce41405efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_line_group
    ADD CONSTRAINT fkdce41405efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fke2af47f148d21790; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fke2af47f148d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fke2af47f1e7e1020b; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fke2af47f1e7e1020b FOREIGN KEY (type_work_hours_id) REFERENCES type_of_work_hours(id);


--
-- Name: fke2af47f1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fke2af47f1efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fke2af47f1f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fke2af47f1f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fke4c379349fb7fc18; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_line_template
    ADD CONSTRAINT fke4c379349fb7fc18 FOREIGN KEY (order_line_template_id) REFERENCES order_element_template(id);


--
-- Name: fke8344cc0c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke8344cc0c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fke8344cc0efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke8344cc0efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fke8a96db115671e92; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resource_allocation
    ADD CONSTRAINT fke8a96db115671e92 FOREIGN KEY (assignment_function) REFERENCES assignment_function(id);


--
-- Name: fke8a96db1ff61540d; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resource_allocation
    ADD CONSTRAINT fke8a96db1ff61540d FOREIGN KEY (task) REFERENCES task(task_element_id);


--
-- Name: fkebabc40edc874c20; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkebabc40edc874c20 FOREIGN KEY (base_calendar_id) REFERENCES resource_calendar(base_calendar_id);


--
-- Name: fkee053f32f2ed6dc; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY virtual_worker
    ADD CONSTRAINT fkee053f32f2ed6dc FOREIGN KEY (virtual_worker_id) REFERENCES worker(worker_id);


--
-- Name: fkee374673ae0677b8; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT fkee374673ae0677b8 FOREIGN KEY (assignment_function_id) REFERENCES stretches_function(assignment_function_id);


--
-- Name: fkef395fa519b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT fkef395fa519b9dfde FOREIGN KEY (order_element_template_id) REFERENCES order_element_template(id);


--
-- Name: fkef395fa561f02c44; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT fkef395fa561f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fkef395fa5e036cfed; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT fkef395fa5e036cfed FOREIGN KEY (hours_group_id) REFERENCES hours_group(id);


--
-- Name: fkef395fa5efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT fkef395fa5efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fkef395fa5f41d57f2; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY criterion_requirement
    ADD CONSTRAINT fkef395fa5f41d57f2 FOREIGN KEY (parent) REFERENCES criterion_requirement(id);


--
-- Name: fkf0260c4275ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY derived_allocation
    ADD CONSTRAINT fkf0260c4275ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resource_allocation(id);


--
-- Name: fkf0260c4287b470f0; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY derived_allocation
    ADD CONSTRAINT fkf0260c4287b470f0 FOREIGN KEY (configurationunit) REFERENCES machine_workers_configuration_unit(id);


--
-- Name: fkf0e8572475ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e8572475ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resource_allocation(id);


--
-- Name: fkf0e85724eae850b2; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e85724eae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fkf635cc04b216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT fkf635cc04b216ed4c FOREIGN KEY (advance_type_id) REFERENCES advance_type(id);


--
-- Name: fkf788b34975ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT fkf788b34975ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resource_allocation(id);


--
-- Name: fkf796fbd0c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkf796fbd0c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkf796fbd0f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkf796fbd0f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fkfd7aa62248d21790; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fkfd7aa62248d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkfd7aa62278e4e2ea; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fkfd7aa62278e4e2ea FOREIGN KEY (ork_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fkfd7aa622efda874f; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fkfd7aa622efda874f FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: fkfe6ed34b1545e7a; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fkfe6ed34b1545e7a FOREIGN KEY (origin) REFERENCES task_element(id);


--
-- Name: fkfe6ed34b9e788f90; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fkfe6ed34b9e788f90 FOREIGN KEY (queue_dependency) REFERENCES limiting_resource_queue_dependency(id);


--
-- Name: fkfe6ed34be838f362; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fkfe6ed34be838f362 FOREIGN KEY (destination) REFERENCES task_element(id);


--
-- Name: fkfe6fb57519b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fkfe6fb57519b9dfde FOREIGN KEY (order_element_template_id) REFERENCES order_element_template(id);


--
-- Name: fkfe6fb5758b37665c; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fkfe6fb5758b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: id_configuration_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY configuration_roles_ldap
    ADD CONSTRAINT id_configuration_fkey FOREIGN KEY (id_configuration) REFERENCES configuration(id);


--
-- Name: mnual_function_assignment_function_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY manual_function
    ADD CONSTRAINT mnual_function_assignment_function_fkey FOREIGN KEY (assignment_function_id) REFERENCES assignment_function(id);


--
-- Name: order_sync_info_order_table_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY order_sync_info
    ADD CONSTRAINT order_sync_info_order_table_fkey FOREIGN KEY (order_element_id) REFERENCES order_table(order_element_id);


--
-- Name: sum_charged_effort_order_element_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY sum_charged_effort
    ADD CONSTRAINT sum_charged_effort_order_element_fkey FOREIGN KEY (order_element) REFERENCES order_element(id);


--
-- Name: sum_expenses_order_element_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY sum_expenses
    ADD CONSTRAINT sum_expenses_order_element_fkey FOREIGN KEY (order_element_id) REFERENCES order_element(id);


--
-- Name: user_criterion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_criterion_fkey FOREIGN KEY (resources_load_filter_criterion_id) REFERENCES criterion(id) ON DELETE SET NULL;


--
-- Name: user_label_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_label_fkey FOREIGN KEY (projects_filter_label_id) REFERENCES label(id) ON DELETE SET NULL;


--
-- Name: worker_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: libreplan
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT worker_user_fkey FOREIGN KEY (user_id) REFERENCES user_table(id);


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


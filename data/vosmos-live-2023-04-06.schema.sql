--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP EVENT TRIGGER IF EXISTS "pgrst_drop_watch";
DROP EVENT TRIGGER IF EXISTS "pgrst_ddl_watch";
DROP EVENT TRIGGER IF EXISTS "issue_pg_net_access";
DROP EVENT TRIGGER IF EXISTS "issue_pg_graphql_access";
DROP EVENT TRIGGER IF EXISTS "issue_pg_cron_access";
DROP EVENT TRIGGER IF EXISTS "issue_graphql_placeholder";
DROP PUBLICATION IF EXISTS "supabase_realtime";
DROP POLICY IF EXISTS "Give anon users read access to anon users 1bqp9qb_0" ON "storage"."objects";
DROP POLICY IF EXISTS "Allows Authenticated Read / Insert to JOBS bucket 1y1cm_0" ON "storage"."objects";
DROP POLICY IF EXISTS "Allows Authenticated / Ano Read / Insert to JOBS bucket 1y1cm_1" ON "storage"."objects";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."roles";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."job_works";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."job_histories";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."job_areas";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."design_profile_concepts";
DROP POLICY IF EXISTS "update-for-systems-only" ON "public"."appointment_participants";
DROP POLICY IF EXISTS "update-for-self-leader-data_admin" ON "public"."leads";
DROP POLICY IF EXISTS "update-for-self-leader-creator-finance" ON "public"."job_profiles";
DROP POLICY IF EXISTS "update-for-self-leader-creator-finance" ON "public"."design_profiles";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."remodellings";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."prospects";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."opportunity_checklists";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."opportunities";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."job_work_metas";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."documents";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."communications";
DROP POLICY IF EXISTS "update-for-self-leader-creator" ON "public"."client_profiles";
DROP POLICY IF EXISTS "update-for-self-leader" ON "public"."appointments";
DROP POLICY IF EXISTS "update-for-self" ON "public"."employees";
DROP POLICY IF EXISTS "update-for-leader-creator" ON "public"."quotations";
DROP POLICY IF EXISTS "update-for-leader-creator" ON "public"."quotation_items";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sales";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sale_participants";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sale_orders";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sale_invoice_payments";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sale_expenses";
DROP POLICY IF EXISTS "update-for-finance-only" ON "public"."sale_commissions";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."user_roles";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."suppliers";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."supplier_skus";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."skus";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."sku_sku_includes";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."sku_includes";
DROP POLICY IF EXISTS "update-for-finance-data_admin" ON "public"."announcements";
DROP POLICY IF EXISTS "update-for-data_admin" ON "public"."lookup_values";
DROP POLICY IF EXISTS "update-for-data_admin" ON "public"."lookup_documents";
DROP POLICY IF EXISTS "update-for-data_admin" ON "public"."lookup_child_values";
DROP POLICY IF EXISTS "read-for-self-leader-data_admin" ON "public"."employees";
DROP POLICY IF EXISTS "read-for-self-leader-creator-finance" ON "public"."job_profiles";
DROP POLICY IF EXISTS "read-for-self-leader-creator-finance" ON "public"."design_profiles";
DROP POLICY IF EXISTS "read-for-self-leader-creator-finance" ON "public"."client_profiles";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."remodellings";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."quotations";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."quotation_items";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."prospects";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."opportunity_checklists";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."opportunities";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."leads";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."job_works";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."job_work_metas";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."job_histories";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."job_areas";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."documents";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."design_profile_concepts";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."communications";
DROP POLICY IF EXISTS "read-for-self-leader-creator" ON "public"."appointment_participants";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sales";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sale_participants";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sale_orders";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sale_invoice_payments";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sale_expenses";
DROP POLICY IF EXISTS "read-for-finance-only" ON "public"."sale_commissions";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."user_roles";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."suppliers";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."supplier_skus";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."skus";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."sku_sku_includes";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."sku_includes";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."roles";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."quotations";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."lookup_values";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."lookup_documents";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."lookup_child_values";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."appointments";
DROP POLICY IF EXISTS "read-for-authenticated-only" ON "public"."announcements";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."roles";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."quotations";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."quotation_items";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."prospects";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."opportunity_checklists";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."opportunities";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."leads";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."job_profiles";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."job_histories";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."design_profiles";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."communications";
DROP POLICY IF EXISTS "delete-for-systems-only" ON "public"."client_profiles";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."remodellings";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."job_works";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."job_work_metas";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."job_areas";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."documents";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."design_profile_concepts";
DROP POLICY IF EXISTS "delete-for-self-leader-creator" ON "public"."appointment_participants";
DROP POLICY IF EXISTS "delete-for-self-leader" ON "public"."appointments";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sales";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sale_participants";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sale_orders";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sale_invoice_payments";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sale_expenses";
DROP POLICY IF EXISTS "delete-for-finance-only" ON "public"."sale_commissions";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."user_roles";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."suppliers";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."supplier_skus";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."skus";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."sku_sku_includes";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."sku_includes";
DROP POLICY IF EXISTS "delete-for-finance-data_admin" ON "public"."announcements";
DROP POLICY IF EXISTS "delete-for-data_admin" ON "public"."lookup_values";
DROP POLICY IF EXISTS "delete-for-data_admin" ON "public"."lookup_documents";
DROP POLICY IF EXISTS "delete-for-data_admin" ON "public"."lookup_child_values";
DROP POLICY IF EXISTS "crud-for-data_admin-finance" ON "public"."employees";
DROP POLICY IF EXISTS "create-for-team_x" ON "public"."quotations";
DROP POLICY IF EXISTS "create-for-team_x" ON "public"."quotation_items";
DROP POLICY IF EXISTS "create-for-systems-only" ON "public"."roles";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sales";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sale_participants";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sale_orders";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sale_invoice_payments";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sale_expenses";
DROP POLICY IF EXISTS "create-for-finance-only" ON "public"."sale_commissions";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."user_roles";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."suppliers";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."supplier_skus";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."skus";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."sku_sku_includes";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."sku_includes";
DROP POLICY IF EXISTS "create-for-finance-data_admin" ON "public"."announcements";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."remodellings";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."prospects";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."opportunity_checklists";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."opportunities";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."leads";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."job_works";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."job_work_metas";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."job_profiles";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."job_areas";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."documents";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."design_profiles";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."design_profile_concepts";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."client_profiles";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."appointments";
DROP POLICY IF EXISTS "create-for-data_admin-team_x" ON "public"."appointment_participants";
DROP POLICY IF EXISTS "create-for-data_admin-sales" ON "public"."communications";
DROP POLICY IF EXISTS "create-for-data_admin" ON "public"."lookup_values";
DROP POLICY IF EXISTS "create-for-data_admin" ON "public"."lookup_documents";
DROP POLICY IF EXISTS "create-for-data_admin" ON "public"."lookup_child_values";
DROP POLICY IF EXISTS "create-for-all" ON "public"."job_histories";
ALTER TABLE IF EXISTS ONLY "storage"."objects" DROP CONSTRAINT IF EXISTS "objects_owner_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."objects" DROP CONSTRAINT IF EXISTS "objects_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."buckets" DROP CONSTRAINT IF EXISTS "buckets_owner_fkey";
ALTER TABLE IF EXISTS ONLY "public"."user_roles" DROP CONSTRAINT IF EXISTS "user_roles_team_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."user_roles" DROP CONSTRAINT IF EXISTS "user_roles_role_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."user_roles" DROP CONSTRAINT IF EXISTS "user_roles_email_fkey";
ALTER TABLE IF EXISTS ONLY "public"."supplier_skus" DROP CONSTRAINT IF EXISTS "supplier_skus_unit_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."supplier_skus" DROP CONSTRAINT IF EXISTS "supplier_skus_supplier_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."supplier_skus" DROP CONSTRAINT IF EXISTS "supplier_skus_sku_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_sub_category_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_property_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_house_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_category_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_area_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sku_sku_includes" DROP CONSTRAINT IF EXISTS "sku_sku_includes_unit_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sku_sku_includes" DROP CONSTRAINT IF EXISTS "sku_sku_includes_sku_include_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sku_sku_includes" DROP CONSTRAINT IF EXISTS "sku_sku_includes_sku_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sales" DROP CONSTRAINT IF EXISTS "sales_visionary_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sales" DROP CONSTRAINT IF EXISTS "sales_property_class_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sales" DROP CONSTRAINT IF EXISTS "sales_client_profile_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_participants" DROP CONSTRAINT IF EXISTS "sale_participants_team_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_participants" DROP CONSTRAINT IF EXISTS "sale_participants_sales_position_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_participants" DROP CONSTRAINT IF EXISTS "sale_participants_sale_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_participants" DROP CONSTRAINT IF EXISTS "sale_participants_employee_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_orders" DROP CONSTRAINT IF EXISTS "sale_orders_sale_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_orders" DROP CONSTRAINT IF EXISTS "sale_orders_quotation_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_invoice_payments" DROP CONSTRAINT IF EXISTS "sale_invoice_payments_sale_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_invoice_payments" DROP CONSTRAINT IF EXISTS "sale_invoice_payments_sale_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_invoice_payments" DROP CONSTRAINT IF EXISTS "sale_invoice_payments_payment_mode_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_expenses" DROP CONSTRAINT IF EXISTS "sale_expenses_supplier_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_expenses" DROP CONSTRAINT IF EXISTS "sale_expenses_sale_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_commissions" DROP CONSTRAINT IF EXISTS "sale_commissions_sale_participant_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_commissions" DROP CONSTRAINT IF EXISTS "sale_commissions_sale_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."remodellings" DROP CONSTRAINT IF EXISTS "remodellings_property_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."remodellings" DROP CONSTRAINT IF EXISTS "remodellings_key_collection_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."remodellings" DROP CONSTRAINT IF EXISTS "remodellings_house_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."remodellings" DROP CONSTRAINT IF EXISTS "remodellings_budget_type_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_representative_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_lead_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_created_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_client_profile_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_approved_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_supplier_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_sku_include_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_sku_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_quotation_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_created_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."opportunity_checklists" DROP CONSTRAINT IF EXISTS "opportunity_checklists_opportunity_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."lookup_documents" DROP CONSTRAINT IF EXISTS "lookup_documents_lookup_value_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."lookup_child_values" DROP CONSTRAINT IF EXISTS "lookup_child_values_lookup_value_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_created_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_assign_to_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_works" DROP CONSTRAINT IF EXISTS "job_works_work_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_work_metas" DROP CONSTRAINT IF EXISTS "job_work_metas_job_work_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_work_metas" DROP CONSTRAINT IF EXISTS "job_work_metas_child_work_item_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_histories" DROP CONSTRAINT IF EXISTS "job_histories_event_target_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_histories" DROP CONSTRAINT IF EXISTS "job_histories_action_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."job_areas" DROP CONSTRAINT IF EXISTS "job_areas_area_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."employees" DROP CONSTRAINT IF EXISTS "employees_employee_position_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."employees" DROP CONSTRAINT IF EXISTS "employees_department_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."design_profiles" DROP CONSTRAINT IF EXISTS "design_profiles_color_scheme_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."design_profile_concepts" DROP CONSTRAINT IF EXISTS "design_profile_concepts_design_profile_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."design_profile_concepts" DROP CONSTRAINT IF EXISTS "design_profile_concepts_design_concept_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_representative_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_lead_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."appointment_participants" DROP CONSTRAINT IF EXISTS "appointment_participants_participant_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."appointment_participants" DROP CONSTRAINT IF EXISTS "appointment_participants_appointment_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."sso_domains" DROP CONSTRAINT IF EXISTS "sso_domains_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."sessions" DROP CONSTRAINT IF EXISTS "sessions_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_relay_states" DROP CONSTRAINT IF EXISTS "saml_relay_states_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_session_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_factors" DROP CONSTRAINT IF EXISTS "mfa_factors_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_challenges" DROP CONSTRAINT IF EXISTS "mfa_challenges_auth_factor_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "mfa_amr_claims_session_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."identities" DROP CONSTRAINT IF EXISTS "identities_user_id_fkey";
DROP TRIGGER IF EXISTS "update_objects_updated_at" ON "storage"."objects";
DROP TRIGGER IF EXISTS "tr_check_filters" ON "realtime"."subscription";
DROP TRIGGER IF EXISTS "user_roles_handle_updated_at" ON "public"."user_roles";
DROP TRIGGER IF EXISTS "update_opportunity_status_on_insert" ON "public"."documents";
DROP TRIGGER IF EXISTS "suppliers_handle_updated_at" ON "public"."suppliers";
DROP TRIGGER IF EXISTS "supplier_skus_handle_updated_at" ON "public"."supplier_skus";
DROP TRIGGER IF EXISTS "skus_handle_updated_at" ON "public"."skus";
DROP TRIGGER IF EXISTS "sku_sku_includes_handle_updated_at" ON "public"."sku_sku_includes";
DROP TRIGGER IF EXISTS "sku_includes_handle_updated_at" ON "public"."sku_includes";
DROP TRIGGER IF EXISTS "sales_handle_updated_at" ON "public"."sales";
DROP TRIGGER IF EXISTS "sale_participants_handle_updated_at" ON "public"."sale_participants";
DROP TRIGGER IF EXISTS "sale_orders_handle_updated_at" ON "public"."sale_orders";
DROP TRIGGER IF EXISTS "sale_invoice_payments_handle_updated_at" ON "public"."sale_invoice_payments";
DROP TRIGGER IF EXISTS "sale_expenses_handle_updated_at" ON "public"."sale_expenses";
DROP TRIGGER IF EXISTS "sale_commissions_handle_updated_at" ON "public"."sale_commissions";
DROP TRIGGER IF EXISTS "roles_handle_updated_at" ON "public"."roles";
DROP TRIGGER IF EXISTS "remodellings_handle_updated_at" ON "public"."remodellings";
DROP TRIGGER IF EXISTS "quotations_handle_updated_at" ON "public"."quotations";
DROP TRIGGER IF EXISTS "quotation_items_handle_updated_at" ON "public"."quotation_items";
DROP TRIGGER IF EXISTS "prospects_handle_updated_at" ON "public"."prospects";
DROP TRIGGER IF EXISTS "opportunity_checklists_handle_updated_at" ON "public"."opportunity_checklists";
DROP TRIGGER IF EXISTS "opportunities_handle_updated_at" ON "public"."opportunities";
DROP TRIGGER IF EXISTS "lookup_values_handle_updated_at" ON "public"."lookup_values";
DROP TRIGGER IF EXISTS "lookup_documents_handle_updated_at" ON "public"."lookup_documents";
DROP TRIGGER IF EXISTS "lookup_child_values_handle_updated_at" ON "public"."lookup_child_values";
DROP TRIGGER IF EXISTS "leads_handle_updated_at" ON "public"."leads";
DROP TRIGGER IF EXISTS "job_work_metas_handle_updated_at" ON "public"."job_work_metas";
DROP TRIGGER IF EXISTS "job_profiles_handle_updated_at" ON "public"."job_profiles";
DROP TRIGGER IF EXISTS "employees_handle_updated_at" ON "public"."employees";
DROP TRIGGER IF EXISTS "documents_handle_updated_at" ON "public"."documents";
DROP TRIGGER IF EXISTS "design_profiles_handle_updated_at" ON "public"."design_profiles";
DROP TRIGGER IF EXISTS "design_profile_concepts_handle_updated_at" ON "public"."design_profile_concepts";
DROP TRIGGER IF EXISTS "communications_handle_updated_at" ON "public"."communications";
DROP TRIGGER IF EXISTS "client_profiles_handle_updated_at" ON "public"."client_profiles";
DROP TRIGGER IF EXISTS "appointments_handle_updated_at" ON "public"."appointments";
DROP TRIGGER IF EXISTS "appointment_participants_handle_updated_at" ON "public"."appointment_participants";
DROP TRIGGER IF EXISTS "announcements_handle_updated_at" ON "public"."announcements";
DROP INDEX IF EXISTS "storage"."name_prefix_search";
DROP INDEX IF EXISTS "storage"."bucketid_objname";
DROP INDEX IF EXISTS "storage"."bname";
DROP INDEX IF EXISTS "realtime"."subscription_subscription_id_entity_filters_key";
DROP INDEX IF EXISTS "realtime"."ix_realtime_subscription_entity";
DROP INDEX IF EXISTS "public"."personal_access_tokens_tokenable_type_tokenable_id_index";
DROP INDEX IF EXISTS "auth"."users_instance_id_idx";
DROP INDEX IF EXISTS "auth"."users_instance_id_email_idx";
DROP INDEX IF EXISTS "auth"."users_email_partial_key";
DROP INDEX IF EXISTS "auth"."user_id_created_at_idx";
DROP INDEX IF EXISTS "auth"."sso_providers_resource_id_idx";
DROP INDEX IF EXISTS "auth"."sso_domains_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."sso_domains_domain_idx";
DROP INDEX IF EXISTS "auth"."sessions_user_id_idx";
DROP INDEX IF EXISTS "auth"."saml_relay_states_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."saml_relay_states_for_email_idx";
DROP INDEX IF EXISTS "auth"."saml_providers_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_token_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_session_id_revoked_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_parent_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_instance_id_user_id_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_instance_id_idx";
DROP INDEX IF EXISTS "auth"."refresh_token_session_id";
DROP INDEX IF EXISTS "auth"."recovery_token_idx";
DROP INDEX IF EXISTS "auth"."reauthentication_token_idx";
DROP INDEX IF EXISTS "auth"."mfa_factors_user_friendly_name_unique";
DROP INDEX IF EXISTS "auth"."idx_auth_code";
DROP INDEX IF EXISTS "auth"."identities_user_id_idx";
DROP INDEX IF EXISTS "auth"."identities_email_idx";
DROP INDEX IF EXISTS "auth"."factor_id_created_at_idx";
DROP INDEX IF EXISTS "auth"."email_change_token_new_idx";
DROP INDEX IF EXISTS "auth"."email_change_token_current_idx";
DROP INDEX IF EXISTS "auth"."confirmation_token_idx";
DROP INDEX IF EXISTS "auth"."audit_logs_instance_id_idx";
ALTER TABLE IF EXISTS ONLY "storage"."objects" DROP CONSTRAINT IF EXISTS "objects_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."migrations" DROP CONSTRAINT IF EXISTS "migrations_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."migrations" DROP CONSTRAINT IF EXISTS "migrations_name_key";
ALTER TABLE IF EXISTS ONLY "storage"."buckets" DROP CONSTRAINT IF EXISTS "buckets_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."subscription" DROP CONSTRAINT IF EXISTS "pk_subscription";
ALTER TABLE IF EXISTS ONLY "public"."user_roles" DROP CONSTRAINT IF EXISTS "user_roles_user_role_unique_key";
ALTER TABLE IF EXISTS ONLY "public"."user_roles" DROP CONSTRAINT IF EXISTS "user_roles_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_users" DROP CONSTRAINT IF EXISTS "temp_users_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_lookup_values" DROP CONSTRAINT IF EXISTS "temp_lookup_values_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_clients" DROP CONSTRAINT IF EXISTS "temp_clients_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_client_taggings" DROP CONSTRAINT IF EXISTS "temp_client_taggings_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_client_calls" DROP CONSTRAINT IF EXISTS "temp_client_calls_pkey";
ALTER TABLE IF EXISTS ONLY "public"."temp_client_appointments" DROP CONSTRAINT IF EXISTS "temp_client_appointments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."suppliers" DROP CONSTRAINT IF EXISTS "suppliers_pkey";
ALTER TABLE IF EXISTS ONLY "public"."supplier_skus" DROP CONSTRAINT IF EXISTS "supplier_skus_pkey";
ALTER TABLE IF EXISTS ONLY "public"."skus" DROP CONSTRAINT IF EXISTS "skus_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sku_sku_includes" DROP CONSTRAINT IF EXISTS "sku_sku_includes_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sku_includes" DROP CONSTRAINT IF EXISTS "sku_includes_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sales_report_cleaned" DROP CONSTRAINT IF EXISTS "sales_report_cleaned_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sales" DROP CONSTRAINT IF EXISTS "sales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_participants" DROP CONSTRAINT IF EXISTS "sale_participants_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_orders" DROP CONSTRAINT IF EXISTS "sale_orders_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_invoice_payments" DROP CONSTRAINT IF EXISTS "sale_invoice_payments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_expenses" DROP CONSTRAINT IF EXISTS "sale_expenses_pkey";
ALTER TABLE IF EXISTS ONLY "public"."sale_commissions" DROP CONSTRAINT IF EXISTS "sale_commissions_pkey";
ALTER TABLE IF EXISTS ONLY "public"."roles" DROP CONSTRAINT IF EXISTS "roles_pkey";
ALTER TABLE IF EXISTS ONLY "public"."roles" DROP CONSTRAINT IF EXISTS "roles_name_key";
ALTER TABLE IF EXISTS ONLY "public"."remodellings" DROP CONSTRAINT IF EXISTS "remodellings_pkey";
ALTER TABLE IF EXISTS ONLY "public"."quotations" DROP CONSTRAINT IF EXISTS "quotations_pkey";
ALTER TABLE IF EXISTS ONLY "public"."quotation_items" DROP CONSTRAINT IF EXISTS "quotation_items_pkey";
ALTER TABLE IF EXISTS ONLY "public"."prospects" DROP CONSTRAINT IF EXISTS "prospects_pkey";
ALTER TABLE IF EXISTS ONLY "public"."personal_access_tokens" DROP CONSTRAINT IF EXISTS "personal_access_tokens_token_unique";
ALTER TABLE IF EXISTS ONLY "public"."personal_access_tokens" DROP CONSTRAINT IF EXISTS "personal_access_tokens_pkey";
ALTER TABLE IF EXISTS ONLY "public"."opportunity_checklists" DROP CONSTRAINT IF EXISTS "opportunity_checklists_pkey";
ALTER TABLE IF EXISTS ONLY "public"."opportunities" DROP CONSTRAINT IF EXISTS "opportunities_pkey";
ALTER TABLE IF EXISTS ONLY "public"."migrations" DROP CONSTRAINT IF EXISTS "migrations_pkey";
ALTER TABLE IF EXISTS ONLY "public"."lookup_values" DROP CONSTRAINT IF EXISTS "lookup_values_pkey";
ALTER TABLE IF EXISTS ONLY "public"."lookup_documents" DROP CONSTRAINT IF EXISTS "lookup_documents_pkey";
ALTER TABLE IF EXISTS ONLY "public"."lookup_child_values" DROP CONSTRAINT IF EXISTS "lookup_child_values_pkey";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_pkey";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_job_id_key";
ALTER TABLE IF EXISTS ONLY "public"."job_works" DROP CONSTRAINT IF EXISTS "job_works_pkey";
ALTER TABLE IF EXISTS ONLY "public"."job_work_metas" DROP CONSTRAINT IF EXISTS "job_work_metas_pkey";
ALTER TABLE IF EXISTS ONLY "public"."job_profiles" DROP CONSTRAINT IF EXISTS "job_profiles_pkey";
ALTER TABLE IF EXISTS ONLY "public"."job_histories" DROP CONSTRAINT IF EXISTS "job_histories_pkey";
ALTER TABLE IF EXISTS ONLY "public"."job_areas" DROP CONSTRAINT IF EXISTS "job_areas_pkey";
ALTER TABLE IF EXISTS ONLY "public"."employees" DROP CONSTRAINT IF EXISTS "employees_pkey";
ALTER TABLE IF EXISTS ONLY "public"."employees" DROP CONSTRAINT IF EXISTS "employees_email_key";
ALTER TABLE IF EXISTS ONLY "public"."documents" DROP CONSTRAINT IF EXISTS "documents_pkey";
ALTER TABLE IF EXISTS ONLY "public"."design_profiles" DROP CONSTRAINT IF EXISTS "design_profiles_pkey";
ALTER TABLE IF EXISTS ONLY "public"."design_profile_concepts" DROP CONSTRAINT IF EXISTS "design_profile_concepts_pkey";
ALTER TABLE IF EXISTS ONLY "public"."databasechangeloglock" DROP CONSTRAINT IF EXISTS "databasechangeloglock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."communications" DROP CONSTRAINT IF EXISTS "communications_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_requirements" DROP CONSTRAINT IF EXISTS "client_requirements_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_requirement_attachments" DROP CONSTRAINT IF EXISTS "client_requirement_attachments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_profiles" DROP CONSTRAINT IF EXISTS "client_profiles_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_follow_ups" DROP CONSTRAINT IF EXISTS "client_follow_ups_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_floor_plans" DROP CONSTRAINT IF EXISTS "client_floor_plans_pkey";
ALTER TABLE IF EXISTS ONLY "public"."client_appointment_participants" DROP CONSTRAINT IF EXISTS "client_appointment_participants_pkey";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."appointment_participants" DROP CONSTRAINT IF EXISTS "appointment_participants_pkey";
ALTER TABLE IF EXISTS ONLY "public"."announcements" DROP CONSTRAINT IF EXISTS "announcements_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."users" DROP CONSTRAINT IF EXISTS "users_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."users" DROP CONSTRAINT IF EXISTS "users_phone_key";
ALTER TABLE IF EXISTS ONLY "auth"."sso_providers" DROP CONSTRAINT IF EXISTS "sso_providers_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."sso_domains" DROP CONSTRAINT IF EXISTS "sso_domains_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."sessions" DROP CONSTRAINT IF EXISTS "sessions_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_relay_states" DROP CONSTRAINT IF EXISTS "saml_relay_states_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_entity_id_key";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_token_unique";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_factors" DROP CONSTRAINT IF EXISTS "mfa_factors_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_challenges" DROP CONSTRAINT IF EXISTS "mfa_challenges_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "mfa_amr_claims_session_id_authentication_method_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."instances" DROP CONSTRAINT IF EXISTS "instances_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."identities" DROP CONSTRAINT IF EXISTS "identities_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."flow_state" DROP CONSTRAINT IF EXISTS "flow_state_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."audit_log_entries" DROP CONSTRAINT IF EXISTS "audit_log_entries_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "amr_id_pk";
ALTER TABLE IF EXISTS "public"."personal_access_tokens" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."migrations" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "auth"."refresh_tokens" ALTER COLUMN "id" DROP DEFAULT;
DROP TABLE IF EXISTS "storage"."objects";
DROP TABLE IF EXISTS "storage"."migrations";
DROP TABLE IF EXISTS "storage"."buckets";
DROP TABLE IF EXISTS "realtime"."subscription";
DROP TABLE IF EXISTS "realtime"."schema_migrations";
DROP VIEW IF EXISTS "public"."view_opportunities";
DROP TABLE IF EXISTS "public"."temp_users";
DROP TABLE IF EXISTS "public"."temp_lookup_values";
DROP TABLE IF EXISTS "public"."temp_clients";
DROP TABLE IF EXISTS "public"."temp_client_taggings";
DROP TABLE IF EXISTS "public"."temp_client_calls";
DROP TABLE IF EXISTS "public"."temp_client_appointments";
DROP TABLE IF EXISTS "public"."suppliers";
DROP TABLE IF EXISTS "public"."supplier_skus";
DROP TABLE IF EXISTS "public"."sales_report_cleaned";
DROP TABLE IF EXISTS "public"."sales";
DROP TABLE IF EXISTS "public"."sale_participants";
DROP TABLE IF EXISTS "public"."sale_orders";
DROP TABLE IF EXISTS "public"."sale_invoice_payments";
DROP TABLE IF EXISTS "public"."sale_expenses";
DROP TABLE IF EXISTS "public"."sale_commissions";
DROP TABLE IF EXISTS "public"."quotations";
DROP TABLE IF EXISTS "public"."quotation_items";
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
DROP TABLE IF EXISTS "public"."personal_access_tokens";
DROP TABLE IF EXISTS "public"."opportunity_checklists";
DROP TABLE IF EXISTS "public"."opportunities";
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
DROP TABLE IF EXISTS "public"."migrations";
DROP TABLE IF EXISTS "public"."lookup_documents";
DROP TABLE IF EXISTS "public"."job_works";
DROP TABLE IF EXISTS "public"."job_work_metas";
DROP TABLE IF EXISTS "public"."job_profiles";
DROP TABLE IF EXISTS "public"."job_histories";
DROP TABLE IF EXISTS "public"."job_areas";
DROP TABLE IF EXISTS "public"."documents";
DROP TABLE IF EXISTS "public"."design_profiles";
DROP TABLE IF EXISTS "public"."design_profile_concepts";
DROP TABLE IF EXISTS "public"."databasechangeloglock";
DROP TABLE IF EXISTS "public"."databasechangelog";
DROP TABLE IF EXISTS "public"."client_requirements";
DROP TABLE IF EXISTS "public"."client_requirement_attachments";
DROP TABLE IF EXISTS "public"."client_profiles";
DROP TABLE IF EXISTS "public"."client_follow_ups";
DROP TABLE IF EXISTS "public"."client_floor_plans";
DROP TABLE IF EXISTS "public"."client_appointment_participants";
DROP TABLE IF EXISTS "public"."appointments";
DROP TABLE IF EXISTS "public"."appointment_participants";
DROP TABLE IF EXISTS "public"."announcements";
DROP VIEW IF EXISTS "public"."all_team_leaders";
DROP TABLE IF EXISTS "public"."user_roles";
DROP TABLE IF EXISTS "public"."roles";
DROP VIEW IF EXISTS "public"."all_skus_children";
DROP VIEW IF EXISTS "public"."all_skus";
DROP TABLE IF EXISTS "public"."skus";
DROP TABLE IF EXISTS "public"."lookup_child_values";
DROP VIEW IF EXISTS "public"."all_sku_sku_includes_view";
DROP TABLE IF EXISTS "public"."sku_sku_includes";
DROP TABLE IF EXISTS "public"."sku_includes";
DROP TABLE IF EXISTS "public"."lookup_values";
DROP VIEW IF EXISTS "public"."all_public_prospects";
DROP VIEW IF EXISTS "public"."all_prospects";
DROP TABLE IF EXISTS "public"."remodellings";
DROP TABLE IF EXISTS "public"."communications";
DROP VIEW IF EXISTS "public"."all_leads";
DROP TABLE IF EXISTS "public"."prospects";
DROP TABLE IF EXISTS "public"."leads";
DROP TABLE IF EXISTS "public"."employees";
DROP TABLE IF EXISTS "auth"."users";
DROP TABLE IF EXISTS "auth"."sso_providers";
DROP TABLE IF EXISTS "auth"."sso_domains";
DROP TABLE IF EXISTS "auth"."sessions";
DROP TABLE IF EXISTS "auth"."schema_migrations";
DROP TABLE IF EXISTS "auth"."saml_relay_states";
DROP TABLE IF EXISTS "auth"."saml_providers";
DROP SEQUENCE IF EXISTS "auth"."refresh_tokens_id_seq";
DROP TABLE IF EXISTS "auth"."refresh_tokens";
DROP TABLE IF EXISTS "auth"."mfa_factors";
DROP TABLE IF EXISTS "auth"."mfa_challenges";
DROP TABLE IF EXISTS "auth"."mfa_amr_claims";
DROP TABLE IF EXISTS "auth"."instances";
DROP TABLE IF EXISTS "auth"."identities";
DROP TABLE IF EXISTS "auth"."flow_state";
DROP TABLE IF EXISTS "auth"."audit_log_entries";
DROP FUNCTION IF EXISTS "storage"."update_updated_at_column"();
DROP FUNCTION IF EXISTS "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text");
DROP FUNCTION IF EXISTS "storage"."get_size_by_bucket"();
DROP FUNCTION IF EXISTS "storage"."foldername"("name" "text");
DROP FUNCTION IF EXISTS "storage"."filename"("name" "text");
DROP FUNCTION IF EXISTS "storage"."extension"("name" "text");
DROP FUNCTION IF EXISTS "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb");
DROP FUNCTION IF EXISTS "realtime"."to_regrole"("role_name" "text");
DROP FUNCTION IF EXISTS "realtime"."subscription_check_filters"();
DROP FUNCTION IF EXISTS "realtime"."quote_wal2json"("entity" "regclass");
DROP FUNCTION IF EXISTS "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]);
DROP FUNCTION IF EXISTS "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text");
DROP FUNCTION IF EXISTS "realtime"."cast"("val" "text", "type_" "regtype");
DROP FUNCTION IF EXISTS "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]);
DROP FUNCTION IF EXISTS "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer);
DROP FUNCTION IF EXISTS "public"."search_leads"();
DROP FUNCTION IF EXISTS "public"."fn_user_id_with_children"("uid" "uuid");
DROP FUNCTION IF EXISTS "public"."fn_update_opportunity_status_after_insert_document"();
DROP FUNCTION IF EXISTS "public"."fn_update_multiple_opportunities"("payload" "json");
DROP FUNCTION IF EXISTS "public"."fn_update_many_projects"("payload" "json");
DROP FUNCTION IF EXISTS "public"."fn_get_communications_history"("val_job_id" "uuid");
DROP FUNCTION IF EXISTS "public"."fn_get_all_prospects_count"();
DROP FUNCTION IF EXISTS "public"."fn_get_all_opportunities_count"();
DROP FUNCTION IF EXISTS "public"."fn_get_all_leads_count"();
DROP FUNCTION IF EXISTS "public"."fn_employee_id_with_children"("uid" "uuid");
DROP FUNCTION IF EXISTS "pgbouncer"."get_auth"("p_usename" "text");
DROP FUNCTION IF EXISTS "extensions"."set_graphql_placeholder"();
DROP FUNCTION IF EXISTS "extensions"."pgrst_drop_watch"();
DROP FUNCTION IF EXISTS "extensions"."pgrst_ddl_watch"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_net_access"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_graphql_access"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_cron_access"();
DROP FUNCTION IF EXISTS "auth"."update_many_prospects"();
DROP FUNCTION IF EXISTS "auth"."uid"();
DROP FUNCTION IF EXISTS "auth"."role"();
DROP FUNCTION IF EXISTS "auth"."jwt"();
DROP FUNCTION IF EXISTS "auth"."email"();
DROP TYPE IF EXISTS "realtime"."wal_rls";
DROP TYPE IF EXISTS "realtime"."wal_column";
DROP TYPE IF EXISTS "realtime"."user_defined_filter";
DROP TYPE IF EXISTS "realtime"."equality_op";
DROP TYPE IF EXISTS "realtime"."action";
DROP TYPE IF EXISTS "public"."quotations_status_type";
DROP TYPE IF EXISTS "public"."prospects_status_type";
DROP TYPE IF EXISTS "public"."opportunities_status_type";
DROP TYPE IF EXISTS "public"."leads_status_type";
DROP TYPE IF EXISTS "public"."communications_type";
DROP TYPE IF EXISTS "public"."communications_stage_type";
DROP TYPE IF EXISTS "public"."communications_outcome_type";
DROP TYPE IF EXISTS "public"."client_profiles_client_type";
DROP TYPE IF EXISTS "auth"."factor_type";
DROP TYPE IF EXISTS "auth"."factor_status";
DROP TYPE IF EXISTS "auth"."code_challenge_method";
DROP TYPE IF EXISTS "auth"."aal_level";
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS "pgjwt";
DROP EXTENSION IF EXISTS "pgcrypto";
DROP EXTENSION IF EXISTS "pg_stat_statements";
DROP EXTENSION IF EXISTS "pg_graphql";
DROP EXTENSION IF EXISTS "moddatetime";
DROP EXTENSION IF EXISTS "http";
DROP SCHEMA IF EXISTS "storage";
DROP SCHEMA IF EXISTS "realtime";
-- *not* dropping schema, since initdb creates it
DROP SCHEMA IF EXISTS "private";
DROP EXTENSION IF EXISTS "pgsodium";
DROP SCHEMA IF EXISTS "pgsodium";
DROP SCHEMA IF EXISTS "pgbouncer";
DROP SCHEMA IF EXISTS "graphql_public";
DROP SCHEMA IF EXISTS "graphql";
DROP SCHEMA IF EXISTS "extensions";
DROP SCHEMA IF EXISTS "auth";
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "auth";


ALTER SCHEMA "auth" OWNER TO "supabase_admin";

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "extensions";


ALTER SCHEMA "extensions" OWNER TO "postgres";

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "graphql";


ALTER SCHEMA "graphql" OWNER TO "supabase_admin";

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "graphql_public";


ALTER SCHEMA "graphql_public" OWNER TO "supabase_admin";

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA "pgbouncer";


ALTER SCHEMA "pgbouncer" OWNER TO "pgbouncer";

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "pgsodium";


ALTER SCHEMA "pgsodium" OWNER TO "supabase_admin";

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";


--
-- Name: EXTENSION "pgsodium"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "pgsodium" IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: private; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "private";


ALTER SCHEMA "private" OWNER TO "supabase_admin";

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA "public" OWNER TO "postgres";

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "realtime";


ALTER SCHEMA "realtime" OWNER TO "supabase_admin";

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA "storage";


ALTER SCHEMA "storage" OWNER TO "supabase_admin";

--
-- Name: http; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "http" WITH SCHEMA "public";


--
-- Name: EXTENSION "http"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "http" IS 'HTTP client for PostgreSQL, allows web page retrieval inside the database.';


--
-- Name: moddatetime; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "moddatetime" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "moddatetime"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "moddatetime" IS 'functions for tracking last modification time';


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";


--
-- Name: EXTENSION "pg_graphql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "pg_graphql" IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "pg_stat_statements"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "pg_stat_statements" IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "pgcrypto"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "pgcrypto" IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "pgjwt"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "pgjwt" IS 'JSON Web Token API for Postgresql';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE "auth"."aal_level" AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE "auth"."aal_level" OWNER TO "supabase_auth_admin";

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE "auth"."code_challenge_method" AS ENUM (
    's256',
    'plain'
);


ALTER TYPE "auth"."code_challenge_method" OWNER TO "supabase_auth_admin";

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE "auth"."factor_status" AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE "auth"."factor_status" OWNER TO "supabase_auth_admin";

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE "auth"."factor_type" AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE "auth"."factor_type" OWNER TO "supabase_auth_admin";

--
-- Name: client_profiles_client_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."client_profiles_client_type" AS ENUM (
    'existing',
    'new'
);


ALTER TYPE "public"."client_profiles_client_type" OWNER TO "supabase_admin";

--
-- Name: communications_outcome_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."communications_outcome_type" AS ENUM (
    'qualified',
    'unresponsive',
    'too-long',
    'invalid-number',
    'unqualified',
    'follow-up',
    'rescheduled',
    'canceled'
);


ALTER TYPE "public"."communications_outcome_type" OWNER TO "supabase_admin";

--
-- Name: communications_stage_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."communications_stage_type" AS ENUM (
    'prospect',
    'opportunity',
    'project',
    'handover'
);


ALTER TYPE "public"."communications_stage_type" OWNER TO "supabase_admin";

--
-- Name: communications_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."communications_type" AS ENUM (
    'call',
    'email',
    'text'
);


ALTER TYPE "public"."communications_type" OWNER TO "supabase_admin";

--
-- Name: leads_status_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."leads_status_type" AS ENUM (
    'new',
    'unqualified',
    'prospect'
);


ALTER TYPE "public"."leads_status_type" OWNER TO "supabase_admin";

--
-- Name: opportunities_status_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."opportunities_status_type" AS ENUM (
    'first-appointment',
    'pending-document',
    'on-going',
    'unqualified',
    'project'
);


ALTER TYPE "public"."opportunities_status_type" OWNER TO "supabase_admin";

--
-- Name: prospects_status_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."prospects_status_type" AS ENUM (
    'new',
    'call-scheduled',
    'unqualified',
    'opportunity'
);


ALTER TYPE "public"."prospects_status_type" OWNER TO "supabase_admin";

--
-- Name: quotations_status_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE "public"."quotations_status_type" AS ENUM (
    'new',
    'pending',
    'voided',
    'signed'
);


ALTER TYPE "public"."quotations_status_type" OWNER TO "supabase_admin";

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE "realtime"."action" AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE "realtime"."action" OWNER TO "supabase_admin";

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE "realtime"."equality_op" AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte'
);


ALTER TYPE "realtime"."equality_op" OWNER TO "supabase_admin";

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE "realtime"."user_defined_filter" AS (
	"column_name" "text",
	"op" "realtime"."equality_op",
	"value" "text"
);


ALTER TYPE "realtime"."user_defined_filter" OWNER TO "supabase_admin";

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE "realtime"."wal_column" AS (
	"name" "text",
	"type" "text",
	"value" "jsonb",
	"is_pkey" boolean,
	"is_selectable" boolean
);


ALTER TYPE "realtime"."wal_column" OWNER TO "supabase_admin";

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE "realtime"."wal_rls" AS (
	"wal" "jsonb",
	"is_rls_enabled" boolean,
	"subscription_ids" "uuid"[],
	"errors" "text"[]
);


ALTER TYPE "realtime"."wal_rls" OWNER TO "supabase_admin";

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION "auth"."email"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  	coalesce(
		nullif(current_setting('request.jwt.claim.email', true), ''),
		(nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
	)::text
$$;


ALTER FUNCTION "auth"."email"() OWNER TO "supabase_auth_admin";

--
-- Name: FUNCTION "email"(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION "auth"."email"() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION "auth"."jwt"() RETURNS "jsonb"
    LANGUAGE "sql" STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION "auth"."jwt"() OWNER TO "supabase_auth_admin";

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION "auth"."role"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  	coalesce(
		nullif(current_setting('request.jwt.claim.role', true), ''),
		(nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
	)::text
$$;


ALTER FUNCTION "auth"."role"() OWNER TO "supabase_auth_admin";

--
-- Name: FUNCTION "role"(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION "auth"."role"() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION "auth"."uid"() RETURNS "uuid"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  	coalesce(
		nullif(current_setting('request.jwt.claim.sub', true), ''),
		(nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
	)::uuid
$$;


ALTER FUNCTION "auth"."uid"() OWNER TO "supabase_auth_admin";

--
-- Name: FUNCTION "uid"(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION "auth"."uid"() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: update_many_prospects(); Type: FUNCTION; Schema: auth; Owner: supabase_admin
--

CREATE FUNCTION "auth"."update_many_prospects"() RETURNS "void"
    LANGUAGE "sql"
    AS $_$create or replace function update_many_prospects(payload json) returns setof prospects as $$
  update prospects as p set representative_id = x.representative_id, status = x.status
  from (
    select * from json_populate_recordset(null::prospects, payload)
  ) as x(id, representative_id, status)
  where p.id = x.id
  returning p.*;      
$$ language sql;$_$;


ALTER FUNCTION "auth"."update_many_prospects"() OWNER TO "supabase_admin";

--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION "extensions"."grant_pg_cron_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  schema_is_cron bool;
BEGIN
  schema_is_cron = (
    SELECT n.nspname = 'cron'
    FROM pg_event_trigger_ddl_commands() AS ev
    LEFT JOIN pg_catalog.pg_namespace AS n
      ON ev.objid = n.oid
  );

  IF schema_is_cron
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option; 

  END IF;

END;
$$;


ALTER FUNCTION "extensions"."grant_pg_cron_access"() OWNER TO "postgres";

--
-- Name: FUNCTION "grant_pg_cron_access"(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION "extensions"."grant_pg_cron_access"() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION "extensions"."grant_pg_graphql_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;
    END IF;

END;
$_$;


ALTER FUNCTION "extensions"."grant_pg_graphql_access"() OWNER TO "supabase_admin";

--
-- Name: FUNCTION "grant_pg_graphql_access"(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION "extensions"."grant_pg_graphql_access"() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION "extensions"."grant_pg_net_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_collect_response(request_id bigint, async boolean) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_collect_response(request_id bigint, async boolean) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_collect_response(request_id bigint, async boolean) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_collect_response(request_id bigint, async boolean) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION "extensions"."grant_pg_net_access"() OWNER TO "postgres";

--
-- Name: FUNCTION "grant_pg_net_access"(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION "extensions"."grant_pg_net_access"() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION "extensions"."pgrst_ddl_watch"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION "extensions"."pgrst_ddl_watch"() OWNER TO "supabase_admin";

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION "extensions"."pgrst_drop_watch"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION "extensions"."pgrst_drop_watch"() OWNER TO "supabase_admin";

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION "extensions"."set_graphql_placeholder"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION "extensions"."set_graphql_placeholder"() OWNER TO "supabase_admin";

--
-- Name: FUNCTION "set_graphql_placeholder"(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION "extensions"."set_graphql_placeholder"() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth("text"); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION "pgbouncer"."get_auth"("p_usename" "text") RETURNS TABLE("username" "text", "password" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION "pgbouncer"."get_auth"("p_usename" "text") OWNER TO "postgres";

--
-- Name: fn_employee_id_with_children("uuid"); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_employee_id_with_children"("uid" "uuid") RETURNS "uuid"[]
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    process_parents UUID[];
    children UUID[] := '{}';
    new_children UUID[];
BEGIN
    process_parents := ARRAY(SELECT id FROM employees WHERE employees.user_id=uid);

    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM "public"."employees" WHERE leader_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;

    RETURN ARRAY(SELECT id FROM "public"."employees" WHERE id = ANY(children) OR user_id = uid);
END;
$$;


ALTER FUNCTION "public"."fn_employee_id_with_children"("uid" "uuid") OWNER TO "supabase_admin";

--
-- Name: fn_get_all_leads_count(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_get_all_leads_count"() RETURNS "record"
    LANGUAGE "sql"
    AS $$SELECT 
  SUM(CASE WHEN status <> 'prospect' THEN 1 ELSE 0 END) AS all_leads_count,
  SUM(CASE WHEN status = 'new' AND status <> 'prospect' THEN 1 ELSE 0 END) AS new_leads_count,
  SUM(CASE WHEN status = 'unqualified' AND status <> 'prospect' THEN 1 ELSE 0 END) AS unqualified_leads_count
FROM 
  all_leads;$$;


ALTER FUNCTION "public"."fn_get_all_leads_count"() OWNER TO "supabase_admin";

--
-- Name: fn_get_all_opportunities_count(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_get_all_opportunities_count"() RETURNS "record"
    LANGUAGE "sql"
    AS $$ SELECT
        COUNT(*) AS all_count,
        COUNT(*) FILTER (WHERE status = 'first-appointment') AS first_appointment_count,
        COUNT(*) FILTER (WHERE status = 'pending-document') AS pending_document_count,
        COUNT(*) FILTER (WHERE status = 'on-going') AS on_going_count,
        COUNT(*) FILTER (WHERE status = 'unqualified') AS unqualified_count
    FROM
        view_opportunities;$$;


ALTER FUNCTION "public"."fn_get_all_opportunities_count"() OWNER TO "supabase_admin";

--
-- Name: fn_get_all_prospects_count(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_get_all_prospects_count"() RETURNS "record"
    LANGUAGE "sql"
    AS $$SELECT 
    SUM(CASE WHEN status != 'opportunity' THEN 1 ELSE 0 END) as all_count,
    SUM(CASE WHEN status = 'new' THEN 1 ELSE 0 END) as new_count,
    SUM(CASE WHEN status = 'call-scheduled' THEN 1 ELSE 0 END) as call_scheduled_count,
    SUM(CASE WHEN status = 'unqualified' THEN 1 ELSE 0 END) as unqualified_count
FROM all_prospects;$$;


ALTER FUNCTION "public"."fn_get_all_prospects_count"() OWNER TO "supabase_admin";

--
-- Name: fn_get_communications_history("uuid"); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") RETURNS TABLE("transaction_id" "uuid", "com_type" character varying, "sched_at" timestamp without time zone, "note_" "text", "executed_at" timestamp without time zone, "remarks_" "text", "outcome_" "text", "stage_" "text")
    LANGUAGE "sql" SECURITY DEFINER
    AS $_$    SELECT
   id as transaction_id,
    communication_type as com_type,
    scheduled_at as sched_at,
    schedule_note as note_,
    communicated_at as executed_at,
    communication_remarks as remarks_,
    outcome as outcome_,
    stage as stage_
    FROM communications where job_id = $1
      UNION
    SELECT
    id as transaction_id,
    'text' as com_type,
    concat(date, ' ', start_time)::timestamp as sched_at,
    concat(venue, ': ', address) as note_,
    NULL as executed_at,
    NULL as remarks_,
    NULL as outcome_,
    NULL as stage_
    FROM appointments where job_id = $1
    order by sched_at desc
$_$;


ALTER FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") OWNER TO "supabase_admin";

--
-- Name: fn_update_many_projects("json"); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_update_many_projects"("payload" "json") RETURNS "record"
    LANGUAGE "sql"
    AS $$update prospects as p set representative_id = x.representative_id, status = x.status, unqualify_reason = x.unqualify_reason
  from (
    select * from json_populate_recordset(null::prospects, payload)
  ) as x(id)
  where p.id = x.id
  returning p.*;      
$$;


ALTER FUNCTION "public"."fn_update_many_projects"("payload" "json") OWNER TO "supabase_admin";

--
-- Name: fn_update_multiple_opportunities("json"); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") RETURNS "void"
    LANGUAGE "sql"
    AS $$update opportunities as p set representative_id = x.representative_id, status = x.status,
unqualify_reason = x.unqualify_reason,
unqualify_reason_others = x.unqualify_reason_others
  from (
    select * from json_populate_recordset(null::opportunities, payload)
  ) as x(id)
  where p.id = x.id
  returning p.*;      
$$;


ALTER FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") OWNER TO "supabase_admin";

--
-- Name: fn_update_opportunity_status_after_insert_document(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
	BEGIN
  		IF(NEW.category = 'original-floor-plan') then
    		UPDATE opportunities SET status = 'first-appointment'
    		WHERE opportunities.status='pending-document' AND opportunities.job_id = NEW.job_id;
    	END IF;
    	RETURN NEW; 
	END$$;


ALTER FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() OWNER TO "supabase_admin";

--
-- Name: fn_user_id_with_children("uuid"); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."fn_user_id_with_children"("uid" "uuid") RETURNS "uuid"[]
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    process_parents UUID[];
    children UUID[] := '{}';
    new_children UUID[];
BEGIN
    process_parents := ARRAY(SELECT id FROM employees WHERE employees.user_id=uid);

    WHILE ( array_upper( process_parents, 1 ) IS NOT NULL ) LOOP
        new_children := ARRAY( SELECT id FROM "public"."employees" WHERE leader_id = ANY( process_parents ) AND id <> ALL( children ) );
        children := children || new_children;
        process_parents := new_children;
    END LOOP;

    RETURN ARRAY(SELECT user_id FROM "public"."employees" WHERE id = ANY(children) OR user_id = uid);
END;
$$;


ALTER FUNCTION "public"."fn_user_id_with_children"("uid" "uuid") OWNER TO "supabase_admin";

--
-- Name: search_leads(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION "public"."search_leads"() RETURNS "text"
    LANGUAGE "sql"
    AS $$
  select 'Hello world';
$$;


ALTER FUNCTION "public"."search_leads"() OWNER TO "supabase_admin";

--
-- Name: apply_rls("jsonb", integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer DEFAULT (1024 * 1024)) RETURNS SETOF "realtime"."wal_rls"
    LANGUAGE "plpgsql"
    AS $$
      declare
        -- Regclass of the table e.g. public.notes
        entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

        -- I, U, D, T: insert, update ...
        action realtime.action = (
          case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
          end
        );

        -- Is row level security enabled for the table
        is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

        subscriptions realtime.subscription[] = array_agg(subs)
          from
            realtime.subscription subs
          where
            subs.entity = entity_;

        -- Subscription vars
        roles regrole[] = array_agg(distinct us.claims_role)
          from
            unnest(subscriptions) us;

        working_role regrole;
        claimed_role regrole;
        claims jsonb;

        subscription_id uuid;
        subscription_has_access bool;
        visible_to_subscription_ids uuid[] = '{}';

        -- structured info for wal's columns
        columns realtime.wal_column[];
        -- previous identity values for update/delete
        old_columns realtime.wal_column[];

        error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

        -- Primary jsonb output for record
        output jsonb;

      begin
        perform set_config('role', null, true);

        columns =
          array_agg(
            (
              x->>'name',
              x->>'type',
              realtime.cast((x->'value') #>> '{}', (x->>'type')::regtype),
              (pks ->> 'name') is not null,
              true
            )::realtime.wal_column
          )
          from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
              on (x ->> 'name') = (pks ->> 'name');

        old_columns =
          array_agg(
            (
              x->>'name',
              x->>'type',
              realtime.cast((x->'value') #>> '{}', (x->>'type')::regtype),
              (pks ->> 'name') is not null,
              true
            )::realtime.wal_column
          )
          from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
              on (x ->> 'name') = (pks ->> 'name');

        for working_role in select * from unnest(roles) loop

          -- Update `is_selectable` for columns and old_columns
          columns =
            array_agg(
              (
                c.name,
                c.type,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
              )::realtime.wal_column
            )
            from
              unnest(columns) c;

          old_columns =
            array_agg(
              (
                c.name,
                c.type,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
              )::realtime.wal_column
            )
            from
              unnest(old_columns) c;

          if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            return next (
              null,
              is_rls_enabled,
              -- subscriptions is already filtered by entity
              (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
              array['Error 400: Bad Request, no primary key']
            )::realtime.wal_rls;

          -- The claims role does not have SELECT permission to the primary key of entity
          elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            return next (
              null,
              is_rls_enabled,
              (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
              array['Error 401: Unauthorized']
            )::realtime.wal_rls;

          else
            output = jsonb_build_object(
              'schema', wal ->> 'schema',
              'table', wal ->> 'table',
              'type', action,
              'commit_timestamp', to_char(
                (wal ->> 'timestamp')::timestamptz,
                'YYYY-MM-DD"T"HH24:MI:SS"Z"'
              ),
              'columns', (
                select
                  jsonb_agg(
                    jsonb_build_object(
                      'name', pa.attname,
                      'type', pt.typname
                    )
                    order by pa.attnum asc
                  )
                    from
                      pg_attribute pa
                      join pg_type pt
                        on pa.atttypid = pt.oid
                    where
                      attrelid = entity_
                      and attnum > 0
                      and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
              )
            )
            -- Add "record" key for insert and update
            || case
                when error_record_exceeds_max_size then jsonb_build_object('record', '{}'::jsonb)
                when action in ('INSERT', 'UPDATE') then
                  jsonb_build_object(
                    'record',
                    (select jsonb_object_agg((c).name, (c).value) from unnest(columns) c where (c).is_selectable)
                  )
                else '{}'::jsonb
            end
            -- Add "old_record" key for update and delete
            || case
                when error_record_exceeds_max_size then jsonb_build_object('old_record', '{}'::jsonb)
                when action in ('UPDATE', 'DELETE') then
                  jsonb_build_object(
                    'old_record',
                    (select jsonb_object_agg((c).name, (c).value) from unnest(old_columns) c where (c).is_selectable)
                  )
                else '{}'::jsonb
            end;

            -- Create the prepared statement
            if is_rls_enabled and action <> 'DELETE' then
              if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
              end if;
              execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            visible_to_subscription_ids = '{}';

            for subscription_id, claims in (
                select
                  subs.subscription_id,
                  subs.claims
                from
                  unnest(subscriptions) subs
                where
                  subs.entity = entity_
                  and subs.claims_role = working_role
                  and realtime.is_visible_through_filters(columns, subs.filters)
              ) loop

              if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
              else
                -- Check if RLS allows the role to see the record
                perform
                  set_config('role', working_role::text, true),
                  set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                  visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
              end if;
            end loop;

            perform set_config('role', null, true);

            return next (
              output,
              is_rls_enabled,
              visible_to_subscription_ids,
              case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
              end
            )::realtime.wal_rls;

          end if;
        end loop;

        perform set_config('role', null, true);
      end;
      $$;


ALTER FUNCTION "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer) OWNER TO "supabase_admin";

--
-- Name: build_prepared_statement_sql("text", "regclass", "realtime"."wal_column"[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]) RETURNS "text"
    LANGUAGE "sql"
    AS $$
    /*
    Builds a sql string that, if executed, creates a prepared statement to
    tests retrive a row from *entity* by its primary key columns.

    Example
      select realtime.build_prepared_statment_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
    */
      select
    'prepare ' || prepared_statement_name || ' as
      select
        exists(
          select
            1
          from
            ' || entity || '
          where
            ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
        )'
      from
        unnest(columns) pkc
      where
        pkc.is_pkey
      group by
        entity
    $$;


ALTER FUNCTION "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]) OWNER TO "supabase_admin";

--
-- Name: cast("text", "regtype"); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."cast"("val" "text", "type_" "regtype") RETURNS "jsonb"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION "realtime"."cast"("val" "text", "type_" "regtype") OWNER TO "supabase_admin";

--
-- Name: check_equality_op("realtime"."equality_op", "regtype", "text", "text"); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text") RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
    /*
    Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
    */
    declare
      op_symbol text = (
        case
          when op = 'eq' then '='
          when op = 'neq' then '!='
          when op = 'lt' then '<'
          when op = 'lte' then '<='
          when op = 'gt' then '>'
          when op = 'gte' then '>='
          else 'UNKNOWN OP'
        end
      );
      res boolean;
    begin
      execute format('select %L::'|| type_::text || ' ' || op_symbol || ' %L::'|| type_::text, val_1, val_2) into res;
      return res;
    end;
    $$;


ALTER FUNCTION "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text") OWNER TO "supabase_admin";

--
-- Name: is_visible_through_filters("realtime"."wal_column"[], "realtime"."user_defined_filter"[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
    select
      -- Default to allowed when no filters present
      coalesce(
        sum(
          realtime.check_equality_op(
            op:=f.op,
            type_:=col.type::regtype,
            -- cast jsonb to text
            val_1:=col.value #>> '{}',
            val_2:=f.value
          )::int
        ) = count(1),
        true
      )
    from
      unnest(filters) f
      join unnest(columns) col
          on f.column_name = col.name;
    $$;


ALTER FUNCTION "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]) OWNER TO "supabase_admin";

--
-- Name: quote_wal2json("regclass"); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."quote_wal2json"("entity" "regclass") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION "realtime"."quote_wal2json"("entity" "regclass") OWNER TO "supabase_admin";

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."subscription_check_filters"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
      col_names text[] = coalesce(
        array_agg(c.column_name order by c.ordinal_position),
        '{}'::text[]
      )
      from
        information_schema.columns c
      where
        format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
        and pg_catalog.has_column_privilege(
          (new.claims ->> 'role'),
          format('%I.%I', c.table_schema, c.table_name)::regclass,
          c.column_name,
          'SELECT'
        );
      filter realtime.user_defined_filter;
      col_type regtype;
    begin
      for filter in select * from unnest(new.filters) loop
        -- Filtered column is valid
        if not filter.column_name = any(col_names) then
          raise exception 'invalid column for filter %', filter.column_name;
        end if;

        -- Type is sanitized and safe for string interpolation
        col_type = (
          select atttypid::regtype
          from pg_catalog.pg_attribute
          where attrelid = new.entity
            and attname = filter.column_name
        );
        if col_type is null then
          raise exception 'failed to lookup type for column %', filter.column_name;
        end if;
        -- raises an exception if value is not coercable to type
        perform realtime.cast(filter.value, col_type);
      end loop;

      -- Apply consistent order to filters so the unique constraint on
      -- (subscription_id, entity, filters) can't be tricked by a different filter order
      new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value),
        '{}'
      ) from unnest(new.filters) f;

    return new;
  end;
  $$;


ALTER FUNCTION "realtime"."subscription_check_filters"() OWNER TO "supabase_admin";

--
-- Name: to_regrole("text"); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION "realtime"."to_regrole"("role_name" "text") RETURNS "regrole"
    LANGUAGE "sql" IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION "realtime"."to_regrole"("role_name" "text") OWNER TO "supabase_admin";

--
-- Name: can_insert_object("text", "text", "uuid", "jsonb"); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb") OWNER TO "supabase_storage_admin";

--
-- Name: extension("text"); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."extension"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return split_part(_filename, '.', 2);
END
$$;


ALTER FUNCTION "storage"."extension"("name" "text") OWNER TO "supabase_storage_admin";

--
-- Name: filename("text"); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."filename"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION "storage"."filename"("name" "text") OWNER TO "supabase_storage_admin";

--
-- Name: foldername("text"); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."foldername"("name" "text") RETURNS "text"[]
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION "storage"."foldername"("name" "text") OWNER TO "supabase_storage_admin";

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."get_size_by_bucket"() RETURNS TABLE("size" bigint, "bucket_id" "text")
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION "storage"."get_size_by_bucket"() OWNER TO "supabase_storage_admin";

--
-- Name: search("text", "text", integer, integer, integer, "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer DEFAULT 100, "levels" integer DEFAULT 1, "offsets" integer DEFAULT 0, "search" "text" DEFAULT ''::"text", "sortcolumn" "text" DEFAULT 'name'::"text", "sortorder" "text" DEFAULT 'asc'::"text") RETURNS TABLE("name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(regexp_split_to_array(objects.name, ''/''), 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(regexp_split_to_array(objects.name, ''/''), 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text") OWNER TO "supabase_storage_admin";

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION "storage"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION "storage"."update_updated_at_column"() OWNER TO "supabase_storage_admin";

SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."audit_log_entries" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "payload" "json",
    "created_at" timestamp with time zone,
    "ip_address" character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "auth"."audit_log_entries" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "audit_log_entries"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."audit_log_entries" IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."flow_state" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid",
    "auth_code" "text" NOT NULL,
    "code_challenge_method" "auth"."code_challenge_method" NOT NULL,
    "code_challenge" "text" NOT NULL,
    "provider_type" "text" NOT NULL,
    "provider_access_token" "text",
    "provider_refresh_token" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);


ALTER TABLE "auth"."flow_state" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "flow_state"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."flow_state" IS 'stores metadata for oauth provider logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."identities" (
    "id" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "identity_data" "jsonb" NOT NULL,
    "provider" "text" NOT NULL,
    "last_sign_in_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "email" "text" GENERATED ALWAYS AS ("lower"(("identity_data" ->> 'email'::"text"))) STORED
);


ALTER TABLE "auth"."identities" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "identities"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."identities" IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN "identities"."email"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN "auth"."identities"."email" IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."instances" (
    "id" "uuid" NOT NULL,
    "uuid" "uuid",
    "raw_base_config" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);


ALTER TABLE "auth"."instances" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "instances"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."instances" IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."mfa_amr_claims" (
    "session_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "authentication_method" "text" NOT NULL,
    "id" "uuid" NOT NULL
);


ALTER TABLE "auth"."mfa_amr_claims" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "mfa_amr_claims"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."mfa_amr_claims" IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."mfa_challenges" (
    "id" "uuid" NOT NULL,
    "factor_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "verified_at" timestamp with time zone,
    "ip_address" "inet" NOT NULL
);


ALTER TABLE "auth"."mfa_challenges" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "mfa_challenges"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."mfa_challenges" IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."mfa_factors" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "friendly_name" "text",
    "factor_type" "auth"."factor_type" NOT NULL,
    "status" "auth"."factor_status" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "secret" "text"
);


ALTER TABLE "auth"."mfa_factors" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "mfa_factors"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."mfa_factors" IS 'auth: stores metadata about factors';


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."refresh_tokens" (
    "instance_id" "uuid",
    "id" bigint NOT NULL,
    "token" character varying(255),
    "user_id" character varying(255),
    "revoked" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "parent" character varying(255),
    "session_id" "uuid"
);


ALTER TABLE "auth"."refresh_tokens" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "refresh_tokens"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."refresh_tokens" IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE "auth"."refresh_tokens_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth"."refresh_tokens_id_seq" OWNER TO "supabase_auth_admin";

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE "auth"."refresh_tokens_id_seq" OWNED BY "auth"."refresh_tokens"."id";


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."saml_providers" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "entity_id" "text" NOT NULL,
    "metadata_xml" "text" NOT NULL,
    "metadata_url" "text",
    "attribute_mapping" "jsonb",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "entity_id not empty" CHECK (("char_length"("entity_id") > 0)),
    CONSTRAINT "metadata_url not empty" CHECK ((("metadata_url" = NULL::"text") OR ("char_length"("metadata_url") > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK (("char_length"("metadata_xml") > 0))
);


ALTER TABLE "auth"."saml_providers" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "saml_providers"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."saml_providers" IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."saml_relay_states" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "request_id" "text" NOT NULL,
    "for_email" "text",
    "redirect_to" "text",
    "from_ip_address" "inet",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "request_id not empty" CHECK (("char_length"("request_id") > 0))
);


ALTER TABLE "auth"."saml_relay_states" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "saml_relay_states"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."saml_relay_states" IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."schema_migrations" (
    "version" character varying(255) NOT NULL
);


ALTER TABLE "auth"."schema_migrations" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "schema_migrations"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."schema_migrations" IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."sessions" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "factor_id" "uuid",
    "aal" "auth"."aal_level",
    "not_after" timestamp with time zone
);


ALTER TABLE "auth"."sessions" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "sessions"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."sessions" IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN "sessions"."not_after"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN "auth"."sessions"."not_after" IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."sso_domains" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "domain" "text" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK (("char_length"("domain") > 0))
);


ALTER TABLE "auth"."sso_domains" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "sso_domains"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."sso_domains" IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."sso_providers" (
    "id" "uuid" NOT NULL,
    "resource_id" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK ((("resource_id" = NULL::"text") OR ("char_length"("resource_id") > 0)))
);


ALTER TABLE "auth"."sso_providers" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "sso_providers"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."sso_providers" IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN "sso_providers"."resource_id"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN "auth"."sso_providers"."resource_id" IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE "auth"."users" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "aud" character varying(255),
    "role" character varying(255),
    "email" character varying(255),
    "encrypted_password" character varying(255),
    "email_confirmed_at" timestamp with time zone,
    "invited_at" timestamp with time zone,
    "confirmation_token" character varying(255),
    "confirmation_sent_at" timestamp with time zone,
    "recovery_token" character varying(255),
    "recovery_sent_at" timestamp with time zone,
    "email_change_token_new" character varying(255),
    "email_change" character varying(255),
    "email_change_sent_at" timestamp with time zone,
    "last_sign_in_at" timestamp with time zone,
    "raw_app_meta_data" "jsonb",
    "raw_user_meta_data" "jsonb",
    "is_super_admin" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "phone" "text" DEFAULT NULL::character varying,
    "phone_confirmed_at" timestamp with time zone,
    "phone_change" "text" DEFAULT ''::character varying,
    "phone_change_token" character varying(255) DEFAULT ''::character varying,
    "phone_change_sent_at" timestamp with time zone,
    "confirmed_at" timestamp with time zone GENERATED ALWAYS AS (LEAST("email_confirmed_at", "phone_confirmed_at")) STORED,
    "email_change_token_current" character varying(255) DEFAULT ''::character varying,
    "email_change_confirm_status" smallint DEFAULT 0,
    "banned_until" timestamp with time zone,
    "reauthentication_token" character varying(255) DEFAULT ''::character varying,
    "reauthentication_sent_at" timestamp with time zone,
    "is_sso_user" boolean DEFAULT false NOT NULL,
    "deleted_at" timestamp with time zone,
    CONSTRAINT "users_email_change_confirm_status_check" CHECK ((("email_change_confirm_status" >= 0) AND ("email_change_confirm_status" <= 2)))
);


ALTER TABLE "auth"."users" OWNER TO "supabase_auth_admin";

--
-- Name: TABLE "users"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE "auth"."users" IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN "users"."is_sso_user"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN "auth"."users"."is_sso_user" IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: employees; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."employees" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying,
    "full_name" character varying NOT NULL,
    "short_name" character varying,
    "nric" character varying,
    "department_id" "uuid",
    "employee_position_id" "uuid",
    "mobile" character varying,
    "email" character varying NOT NULL,
    "role" character varying,
    "bank" character varying,
    "bank_number" character varying,
    "kin_relationship" character varying,
    "kin_name" character varying,
    "kin_contact" character varying,
    "kin_alternative_contact" character varying,
    "leader_id" "uuid",
    "is_vosmos_enabled" boolean DEFAULT false,
    "user_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."employees" OWNER TO "supabase_admin";

--
-- Name: TABLE "employees"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."employees" IS 'Employees imformation.';


--
-- Name: leads; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."leads" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" character varying,
    "email" character varying,
    "phone" character varying,
    "source" character varying,
    "source_details" character varying,
    "reason" character varying,
    "assign_to" "uuid",
    "leads_date" "date",
    "created_by" "uuid",
    "created_by_name" character varying,
    "notes" character varying,
    "status" "public"."leads_status_type",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."leads" OWNER TO "supabase_admin";

--
-- Name: TABLE "leads"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."leads" IS 'the Leads Stage.';


--
-- Name: prospects; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."prospects" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "lead_id" "uuid",
    "representative_id" "uuid",
    "parent_prospect_id" "uuid",
    "created_by" "uuid" NOT NULL,
    "created_by_name" character varying,
    "client_upload_token" "text",
    "unqualify_reason" "text",
    "status" "public"."prospects_status_type",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."prospects" OWNER TO "supabase_admin";

--
-- Name: TABLE "prospects"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."prospects" IS 'the Prospects Stage.';


--
-- Name: all_leads; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."all_leads" AS
 SELECT "leads"."id",
    "leads"."job_id",
    "leads"."name",
    "leads"."email",
    "leads"."phone",
    "leads"."source",
    "leads"."source_details",
    "leads"."created_at",
    "leads"."updated_at",
    "leads"."status",
    "leads"."reason",
    "leads"."assign_to",
    "leads"."leads_date",
    "leads"."created_by",
    "leads"."created_by_name",
    "leads"."notes",
    "prospects"."status" AS "prospect_status",
    "prospects"."unqualify_reason" AS "prospect_unqualify_reason",
    "employees"."full_name" AS "assign_user_name",
        CASE
            WHEN ("employees"."id" = "leads"."created_by") THEN "employees"."full_name"
            ELSE NULL::character varying
        END AS "creator_name"
   FROM (("public"."leads"
     LEFT JOIN "public"."employees" ON (("leads"."assign_to" = "employees"."id")))
     LEFT JOIN "public"."prospects" ON (("prospects"."job_id" = "leads"."job_id")));


ALTER TABLE "public"."all_leads" OWNER TO "authenticated";

--
-- Name: communications; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."communications" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "communication_type" "public"."communications_type" NOT NULL,
    "scheduled_at" timestamp without time zone,
    "scheduled_by" "uuid",
    "schedule_note" character varying,
    "communicated_at" timestamp without time zone,
    "communicated_by" "uuid",
    "communication_remarks" character varying,
    "outcome" "public"."communications_outcome_type",
    "stage" "public"."communications_stage_type",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."communications" OWNER TO "supabase_admin";

--
-- Name: TABLE "communications"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."communications" IS 'Communications during the Opportunities Stage.';


--
-- Name: remodellings; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."remodellings" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "property_type_id" "uuid",
    "house_type_id" "uuid",
    "budget_type_id" "uuid",
    "key_collection_type_id" "uuid",
    "key_collection_date" "date",
    "is_key_collection" boolean DEFAULT false,
    "renovation_date" "date",
    "is_renovation_asap" boolean DEFAULT false,
    "desired_residency_date" "date",
    "is_desired_residency_asap" boolean DEFAULT false,
    "is_bto_framework_floor_tiles" boolean DEFAULT false,
    "is_bto_framework_doors" boolean DEFAULT false,
    "is_bto_framework_toilet_fitting" boolean DEFAULT false,
    "is_bto_framework_kitchen_wall" boolean DEFAULT false,
    "ceiling_height" bigint DEFAULT '0'::bigint,
    "is_heighest_floor" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."remodellings" OWNER TO "supabase_admin";

--
-- Name: TABLE "remodellings"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."remodellings" IS 'Remodellings.';


--
-- Name: all_prospects; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."all_prospects" AS
 SELECT "prospects"."id",
    "prospects"."lead_id",
    "prospects"."representative_id",
    "prospects"."status",
    "prospects"."created_at",
    "prospects"."client_upload_token",
    "prospects"."job_id",
    "prospects"."unqualify_reason",
    "prospects"."parent_prospect_id",
    "prospects"."updated_at",
    "prospects"."created_by",
    "prospects"."created_by_name",
    "leads"."name" AS "leads_name",
    "employees"."full_name" AS "representative_name",
    "remodellings"."key_collection_type_id",
    "leads"."source" AS "lead_source",
    "leads"."source_details" AS "lead_source_details",
    "leads"."phone" AS "lead_phone",
    "leads"."email" AS "lead_email",
    "leads"."notes" AS "lead_note",
    "leads"."leads_date" AS "lead_date",
    "pc"."id" AS "communication_id",
    "pc"."scheduled_at",
    "pc"."job_id" AS "pc_prospect_id",
        CASE
            WHEN ("employees"."id" = "prospects"."created_by") THEN "employees"."full_name"
            ELSE NULL::character varying
        END AS "creator_name"
   FROM (((("public"."prospects"
     LEFT JOIN "public"."remodellings" ON (("remodellings"."job_id" = "prospects"."job_id")))
     LEFT JOIN "public"."leads" ON (("leads"."id" = "prospects"."lead_id")))
     LEFT JOIN "public"."employees" ON (("employees"."id" = "prospects"."representative_id")))
     LEFT JOIN ( SELECT DISTINCT ON ("p1"."job_id") "p1"."job_id",
            "p1"."id",
            "p1"."scheduled_at"
           FROM "public"."communications" "p1"
          WHERE (("p1"."communicated_at" IS NULL) AND ("p1"."stage" = 'prospect'::"public"."communications_stage_type"))
          ORDER BY "p1"."job_id", "p1"."created_at" DESC) "pc" ON (("pc"."job_id" = "prospects"."job_id")));


ALTER TABLE "public"."all_prospects" OWNER TO "authenticated";

--
-- Name: all_public_prospects; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW "public"."all_public_prospects" AS
 SELECT "prospects"."id",
    "prospects"."client_upload_token",
    "prospects"."job_id",
    "prospects"."created_at",
    "leads"."name" AS "leads_name"
   FROM ("public"."prospects"
     LEFT JOIN "public"."leads" ON (("leads"."id" = "prospects"."lead_id")));


ALTER TABLE "public"."all_public_prospects" OWNER TO "supabase_admin";

--
-- Name: lookup_values; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."lookup_values" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" character varying NOT NULL,
    "label" character varying NOT NULL,
    "description" character varying,
    "type_" character varying NOT NULL,
    "sort_order" bigint DEFAULT '0'::bigint,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."lookup_values" OWNER TO "supabase_admin";

--
-- Name: TABLE "lookup_values"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."lookup_values" IS 'System lookup values.';


--
-- Name: sku_includes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sku_includes" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "label" character varying NOT NULL,
    "description" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sku_includes" OWNER TO "supabase_admin";

--
-- Name: TABLE "sku_includes"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sku_includes" IS 'Information about SKU Includes.';


--
-- Name: sku_sku_includes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sku_sku_includes" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sku_id" "uuid" NOT NULL,
    "sku_include_id" "uuid" NOT NULL,
    "unit_id" "uuid",
    "cost_per_unit" numeric(6,3) DEFAULT 0.0,
    "price_per_unit" numeric(6,3) DEFAULT 0.0,
    "min_price_per_unit" numeric(6,3) DEFAULT 0.0,
    "max_price_per_unit" numeric(6,3) DEFAULT 0.0,
    "min_unit" numeric(6,3) DEFAULT 1.0,
    "max_unit" numeric(6,3) DEFAULT 1.0,
    "is_required" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sku_sku_includes" OWNER TO "supabase_admin";

--
-- Name: TABLE "sku_sku_includes"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sku_sku_includes" IS 'Information about SKUs <-> SKU Includes.';


--
-- Name: all_sku_sku_includes_view; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."all_sku_sku_includes_view" AS
 SELECT "si"."id",
    "si"."sku_id",
    "si"."sku_include_id",
    ( SELECT "sku_includes"."label"
           FROM "public"."sku_includes"
          WHERE ("sku_includes"."id" = "si"."sku_include_id")) AS "label",
    ( SELECT "sku_includes"."description"
           FROM "public"."sku_includes"
          WHERE ("sku_includes"."id" = "si"."sku_include_id")) AS "description",
    ( SELECT "lookup_values"."label"
           FROM "public"."lookup_values"
          WHERE ("lookup_values"."id" = "si"."unit_id")) AS "unit",
    "si"."cost_per_unit",
    "si"."price_per_unit",
    "si"."min_price_per_unit",
    "si"."max_price_per_unit",
    "si"."min_unit",
    "si"."max_unit",
    "si"."is_required",
    "si"."created_at",
    "si"."updated_at"
   FROM "public"."sku_sku_includes" "si";


ALTER TABLE "public"."all_sku_sku_includes_view" OWNER TO "authenticated";

--
-- Name: lookup_child_values; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."lookup_child_values" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" character varying NOT NULL,
    "label" character varying NOT NULL,
    "description" character varying,
    "c_type_" character varying NOT NULL,
    "sort_order" bigint DEFAULT '0'::bigint,
    "lookup_value_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."lookup_child_values" OWNER TO "supabase_admin";

--
-- Name: TABLE "lookup_child_values"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."lookup_child_values" IS 'System lookup child values.';


--
-- Name: skus; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."skus" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "category_id" "uuid" NOT NULL,
    "sub_category_id" "uuid" NOT NULL,
    "sku_number" character varying,
    "description" character varying,
    "property_type_id" "uuid" NOT NULL,
    "house_type_id" "uuid" NOT NULL,
    "area_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."skus" OWNER TO "supabase_admin";

--
-- Name: TABLE "skus"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."skus" IS 'Information about SKUs.';


--
-- Name: all_skus; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."all_skus" AS
 SELECT "skus"."id",
    "skus"."sku_number",
    "skus"."description",
    ( SELECT "lookup_values"."label"
           FROM "public"."lookup_values"
          WHERE ("lookup_values"."id" = "skus"."category_id")) AS "category",
    ( SELECT "lookup_child_values"."label"
           FROM "public"."lookup_child_values"
          WHERE ("lookup_child_values"."id" = "skus"."sub_category_id")) AS "sub_category",
    ( SELECT "lookup_values"."label"
           FROM "public"."lookup_values"
          WHERE ("lookup_values"."id" = "skus"."property_type_id")) AS "property_type",
    ( SELECT "lookup_values"."label"
           FROM "public"."lookup_values"
          WHERE ("lookup_values"."id" = "skus"."house_type_id")) AS "house_type",
    ( SELECT "lookup_values"."label"
           FROM "public"."lookup_values"
          WHERE ("lookup_values"."id" = "skus"."area_id")) AS "area",
    "skus"."created_at",
    "skus"."updated_at"
   FROM "public"."skus";


ALTER TABLE "public"."all_skus" OWNER TO "authenticated";

--
-- Name: all_skus_children; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW "public"."all_skus_children" AS
 SELECT "sku"."id",
    "sku"."sku_number",
    "sku"."description",
    "sku"."category",
    "sku"."sub_category",
    "sku"."area",
    "sku"."property_type",
    "sku"."house_type",
    "to_json"(ARRAY( SELECT ROW("sku_include"."id", "sku_include"."label", "sku_include"."description", "sku_include"."cost_per_unit", "sku_include"."price_per_unit", "sku_include"."min_price_per_unit", "sku_include"."unit", "sku_include"."max_price_per_unit", "sku_include"."min_unit", "sku_include"."max_unit", "sku_include"."is_required") AS "row"
           FROM "public"."all_sku_sku_includes_view" "sku_include"
          WHERE ("sku"."id" = "sku_include"."sku_id"))) AS "_children"
   FROM "public"."all_skus" "sku";


ALTER TABLE "public"."all_skus_children" OWNER TO "supabase_admin";

--
-- Name: roles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."roles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "label" character varying,
    "description" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."roles" OWNER TO "supabase_admin";

--
-- Name: TABLE "roles"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."roles" IS 'Roles a user can have.';


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."user_roles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "role_id" "uuid" NOT NULL,
    "email" character varying NOT NULL,
    "team_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."user_roles" OWNER TO "supabase_admin";

--
-- Name: TABLE "user_roles"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."user_roles" IS 'For tracking roles to users.';


--
-- Name: all_team_leaders; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."all_team_leaders" AS
 SELECT "e"."id",
    "e"."first_name",
    "e"."last_name",
    "e"."full_name",
    "e"."short_name",
    "e"."nric",
    "e"."department_id",
    "e"."employee_position_id",
    "e"."mobile",
    "e"."email",
    "e"."role",
    "e"."bank",
    "e"."bank_number",
    "e"."kin_relationship",
    "e"."kin_name",
    "e"."kin_contact",
    "e"."kin_alternative_contact",
    "e"."created_at",
    "e"."updated_at",
    "e"."is_vosmos_enabled",
    "e"."user_id",
    "ur"."role_id",
    "e"."id" AS "value",
    "concat"("e"."first_name", ' ', "e"."last_name") AS "label",
    "ur"."team_id"
   FROM (("public"."employees" "e"
     JOIN "public"."user_roles" "ur" ON ((("ur"."user_id" = "e"."user_id") AND ("e"."user_id" IS NOT NULL))))
     JOIN "public"."roles" "r" ON (("r"."id" = "ur"."role_id")))
  WHERE ("e"."is_vosmos_enabled" = true);


ALTER TABLE "public"."all_team_leaders" OWNER TO "authenticated";

--
-- Name: announcements; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."announcements" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "message" character varying NOT NULL,
    "start_date" timestamp with time zone DEFAULT "now"(),
    "end_date" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."announcements" OWNER TO "supabase_admin";

--
-- Name: TABLE "announcements"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."announcements" IS 'For making announcements to users.';


--
-- Name: appointment_participants; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."appointment_participants" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "appointment_id" "uuid" NOT NULL,
    "participant_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."appointment_participants" OWNER TO "supabase_admin";

--
-- Name: TABLE "appointment_participants"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."appointment_participants" IS 'Areas attached to Job.';


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."appointments" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "lead_id" "uuid",
    "client_id" "uuid",
    "representative_id" "uuid",
    "reference_id" "uuid",
    "reference_type" character varying,
    "date" "date",
    "start_time" time without time zone,
    "end_time" time without time zone,
    "venue" character varying,
    "address" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."appointments" OWNER TO "supabase_admin";

--
-- Name: TABLE "appointments"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."appointments" IS 'the Leads Stage.';


--
-- Name: client_appointment_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."client_appointment_participants" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_appointment_participant_id" bigint NOT NULL,
    "client_appointment_id" bigint NOT NULL,
    "employee_id" bigint NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone
);


ALTER TABLE "public"."client_appointment_participants" OWNER TO "postgres";

--
-- Name: client_floor_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."client_floor_plans" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_floor_plan" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "floor_plan_id" bigint NOT NULL,
    "edited_file_name" "text",
    "raw_file_name" "text" NOT NULL,
    "title" "text" NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone
);


ALTER TABLE "public"."client_floor_plans" OWNER TO "postgres";

--
-- Name: client_follow_ups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."client_follow_ups" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_follow_up_id" bigint NOT NULL,
    "client_tagging_id" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "follow_up_date" "date" NOT NULL,
    "follow_up_time" time(0) without time zone NOT NULL,
    "remarks" "text",
    "date_called" timestamp(0) without time zone,
    "type" character varying(255) DEFAULT 'call'::character varying NOT NULL,
    "status" character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    "created_by" bigint NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "client_follow_ups_status_check" CHECK ((("status")::"text" = ANY (ARRAY[('pending'::character varying)::"text", ('done'::character varying)::"text", ('cancelled'::character varying)::"text"]))),
    CONSTRAINT "client_follow_ups_type_check" CHECK ((("type")::"text" = ANY (ARRAY[('call'::character varying)::"text", ('pending-document'::character varying)::"text"])))
);


ALTER TABLE "public"."client_follow_ups" OWNER TO "postgres";

--
-- Name: COLUMN "client_follow_ups"."created_by"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."client_follow_ups"."created_by" IS 'user_id of user who created the client-opportunity';


--
-- Name: client_profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."client_profiles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "first_name" character varying,
    "last_name" character varying,
    "phone_number" character varying,
    "email_address" character varying,
    "partner_first_name" character varying,
    "partner_last_name" character varying,
    "partner_phone_number" character varying,
    "partner_email_address" character varying,
    "address_unit" character varying,
    "address_bldg" character varying,
    "address_block" character varying,
    "address_street" "text",
    "address_postal" character varying,
    "no_of_adults" bigint DEFAULT '0'::bigint,
    "no_of_children" bigint DEFAULT '0'::bigint,
    "no_of_elderly" bigint DEFAULT '0'::bigint,
    "likert_project_management" bigint,
    "likert_design_and_practicality" bigint,
    "likert_after_service_care" bigint,
    "likert_finance" bigint,
    "is_renovation_bank_loan" boolean,
    "is_geomancy" boolean,
    "remarks" character varying,
    "remodelling_budget" double precision DEFAULT '0'::double precision,
    "client_type" "public"."client_profiles_client_type" DEFAULT 'new'::"public"."client_profiles_client_type",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."client_profiles" OWNER TO "supabase_admin";

--
-- Name: TABLE "client_profiles"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."client_profiles" IS 'Clients. Display Seq address_block, address_street, address_unit, address_postal, building_name';


--
-- Name: client_requirement_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."client_requirement_attachments" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_requirement_attachment_id" bigint NOT NULL,
    "client_requirement_id" bigint NOT NULL,
    "file_name" character varying(255) NOT NULL,
    "title" character varying(255) NOT NULL,
    "file_type" character varying(255) DEFAULT 'pdf'::character varying NOT NULL,
    "status" character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "client_requirement_attachments_file_type_check" CHECK ((("file_type")::"text" = ANY (ARRAY[('pdf'::character varying)::"text", ('jpg'::character varying)::"text", ('jpeg'::character varying)::"text", ('png'::character varying)::"text", ('mp4'::character varying)::"text", ('jfif'::character varying)::"text"]))),
    CONSTRAINT "client_requirement_attachments_status_check" CHECK ((("status")::"text" = ANY (ARRAY[('pending'::character varying)::"text", ('valid'::character varying)::"text", ('invalid'::character varying)::"text", ('disregard'::character varying)::"text"])))
);


ALTER TABLE "public"."client_requirement_attachments" OWNER TO "postgres";

--
-- Name: COLUMN "client_requirement_attachments"."file_name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."client_requirement_attachments"."file_name" IS 'This is the new file name set by the system';


--
-- Name: COLUMN "client_requirement_attachments"."title"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."client_requirement_attachments"."title" IS 'original name of the file';


--
-- Name: client_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."client_requirements" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_requirement_id" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "application_requirement_id" bigint NOT NULL,
    "status" character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    "category" character varying(255) NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "client_requirements_status_check" CHECK ((("status")::"text" = ANY (ARRAY[('pending'::character varying)::"text", ('for-verification'::character varying)::"text", ('invalid'::character varying)::"text", ('complete'::character varying)::"text", ('incomplete'::character varying)::"text", ('disregard'::character varying)::"text"])))
);


ALTER TABLE "public"."client_requirements" OWNER TO "postgres";

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."databasechangelog" (
    "id" character varying(255) NOT NULL,
    "author" character varying(255) NOT NULL,
    "filename" character varying(255) NOT NULL,
    "dateexecuted" timestamp without time zone NOT NULL,
    "orderexecuted" integer NOT NULL,
    "exectype" character varying(10) NOT NULL,
    "md5sum" character varying(35),
    "description" character varying(255),
    "comments" character varying(255),
    "tag" character varying(255),
    "liquibase" character varying(20),
    "contexts" character varying(255),
    "labels" character varying(255),
    "deployment_id" character varying(10)
);


ALTER TABLE "public"."databasechangelog" OWNER TO "postgres";

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."databasechangeloglock" (
    "id" integer NOT NULL,
    "locked" boolean NOT NULL,
    "lockgranted" timestamp without time zone,
    "lockedby" character varying(255)
);


ALTER TABLE "public"."databasechangeloglock" OWNER TO "postgres";

--
-- Name: design_profile_concepts; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."design_profile_concepts" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "design_profile_id" "uuid" NOT NULL,
    "design_concept_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."design_profile_concepts" OWNER TO "supabase_admin";

--
-- Name: TABLE "design_profile_concepts"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."design_profile_concepts" IS 'All Concepts associated to the Design Profile.';


--
-- Name: design_profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."design_profiles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "storage" character varying,
    "unique_feature" "text",
    "lifestyle_story" "text",
    "color_type" character varying,
    "color_scheme_id" "uuid",
    "color_percentage1" smallint,
    "color_percentage2" smallint,
    "color_percentage3" smallint,
    "color_picker1" character varying NOT NULL,
    "color_picker2" character varying NOT NULL,
    "color_picker3" character varying NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."design_profiles" OWNER TO "supabase_admin";

--
-- Name: TABLE "design_profiles"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."design_profiles" IS 'Design Profiles.';


--
-- Name: documents; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."documents" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "filename" character varying NOT NULL,
    "file_ext" character varying NOT NULL,
    "category" character varying NOT NULL,
    "description" character varying,
    "file_path" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."documents" OWNER TO "supabase_admin";

--
-- Name: TABLE "documents"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."documents" IS 'Attachments/Documents.';


--
-- Name: job_areas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."job_areas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "area_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."job_areas" OWNER TO "supabase_admin";

--
-- Name: TABLE "job_areas"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."job_areas" IS 'Areas attached to Job.';


--
-- Name: job_histories; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."job_histories" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "event" character varying,
    "target" character varying,
    "action_by" "uuid",
    "type" character varying,
    "stage" character varying,
    "event_target_id" "uuid",
    "remarks" character varying,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."job_histories" OWNER TO "supabase_admin";

--
-- Name: TABLE "job_histories"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."job_histories" IS 'Histories attached to Job.';


--
-- Name: job_profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."job_profiles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "project_entity" character varying,
    "project_date" "date",
    "project_address_unit" character varying,
    "project_address_bldg" character varying,
    "project_address_block" character varying,
    "project_address_street" "text",
    "project_address_postal" character varying,
    "artist_impression_min_views" bigint,
    "remodelling_budget" real DEFAULT '0'::real,
    "is_same_client_address" boolean DEFAULT false,
    "deposit" bigint DEFAULT '0'::bigint,
    "artist_view_count" integer DEFAULT 1,
    "appointment_date" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."job_profiles" OWNER TO "supabase_admin";

--
-- Name: TABLE "job_profiles"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."job_profiles" IS 'Job Profiles.';


--
-- Name: job_work_metas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."job_work_metas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_work_id" "uuid" NOT NULL,
    "child_work_item_id" "uuid" NOT NULL,
    "name" character varying,
    "label" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."job_work_metas" OWNER TO "supabase_admin";

--
-- Name: TABLE "job_work_metas"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."job_work_metas" IS 'All Metadata about Areas attached to Job.';


--
-- Name: job_works; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."job_works" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "work_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."job_works" OWNER TO "supabase_admin";

--
-- Name: TABLE "job_works"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."job_works" IS 'Areas attached to Job.';


--
-- Name: lookup_documents; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."lookup_documents" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "lookup_value_id" "uuid",
    "filename" character varying NOT NULL,
    "file_ext" character varying NOT NULL,
    "category" character varying NOT NULL,
    "description" character varying,
    "file_path" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."lookup_documents" OWNER TO "supabase_admin";

--
-- Name: TABLE "lookup_documents"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."lookup_documents" IS 'System lookup attachments/documents.';


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."migrations" (
    "id" integer NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL
);


ALTER TABLE "public"."migrations" OWNER TO "postgres";

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."migrations_id_seq" OWNER TO "postgres";

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."migrations_id_seq" OWNED BY "public"."migrations"."id";


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."opportunities" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "lead_id" "uuid" NOT NULL,
    "representative_id" "uuid",
    "created_by" "uuid" NOT NULL,
    "created_by_name" character varying,
    "unqualify_reason" "text",
    "unqualify_reason_others" "text",
    "status" "public"."opportunities_status_type" DEFAULT 'pending-document'::"public"."opportunities_status_type",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."opportunities" OWNER TO "supabase_admin";

--
-- Name: TABLE "opportunities"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."opportunities" IS 'the Opportunities Stage.';


--
-- Name: opportunity_checklists; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."opportunity_checklists" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "opportunity_id" "uuid" NOT NULL,
    "application_requirements" boolean DEFAULT false,
    "area_type_works" boolean DEFAULT false,
    "artist_impression_sa" boolean DEFAULT false,
    "design_profile" boolean DEFAULT false,
    "floor_plans" boolean DEFAULT false,
    "interior_renovation_sa" boolean DEFAULT false,
    "payments" boolean DEFAULT false,
    "project_profile" boolean DEFAULT false,
    "quotation" boolean DEFAULT false,
    "receipts" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."opportunity_checklists" OWNER TO "supabase_admin";

--
-- Name: TABLE "opportunity_checklists"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."opportunity_checklists" IS 'Checklists during the Opportunities Stage.';


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."personal_access_tokens" (
    "id" bigint NOT NULL,
    "tokenable_type" character varying(255) NOT NULL,
    "tokenable_id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "token" character varying(64) NOT NULL,
    "abilities" "text",
    "last_used_at" timestamp(0) without time zone,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);


ALTER TABLE "public"."personal_access_tokens" OWNER TO "postgres";

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."personal_access_tokens_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."personal_access_tokens_id_seq" OWNER TO "postgres";

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."personal_access_tokens_id_seq" OWNED BY "public"."personal_access_tokens"."id";


--
-- Name: quotation_items; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."quotation_items" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "quotation_id" "uuid" NOT NULL,
    "sku_id" "uuid",
    "sku_include_id" "uuid",
    "supplier_id" "uuid",
    "unit_id" "uuid",
    "units" numeric(6,3) DEFAULT 0.0,
    "price_per_unit" numeric(6,3) DEFAULT 0.0,
    "total" numeric(6,3) DEFAULT 0.0,
    "created_by" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."quotation_items" OWNER TO "supabase_admin";

--
-- Name: TABLE "quotation_items"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."quotation_items" IS 'Information about Quotation Items.';


--
-- Name: quotations; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."quotations" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "lead_id" "uuid" NOT NULL,
    "representative_id" "uuid" NOT NULL,
    "client_profile_id" "uuid" NOT NULL,
    "additional_info" "text",
    "subtotal" numeric(6,3) DEFAULT 0.0,
    "discount_rate" numeric(6,3) DEFAULT 0.0,
    "discount" numeric(6,3) DEFAULT 0.0,
    "sales_tax_rate" numeric(6,3) DEFAULT 0.0,
    "sales_tax" numeric(6,3) DEFAULT 0.0,
    "total" numeric(6,3) DEFAULT 0.0,
    "created_by" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "approved_by" "uuid",
    "approved_at" timestamp with time zone,
    "status" "public"."quotations_status_type",
    "actioned_at" timestamp with time zone,
    "void_reason" "text",
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."quotations" OWNER TO "supabase_admin";

--
-- Name: TABLE "quotations"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."quotations" IS 'Information about Quotations.';


--
-- Name: sale_commissions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sale_commissions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sale_id" "uuid" NOT NULL,
    "sale_participant_id" "uuid" NOT NULL,
    "payout_amount" numeric(6,3) DEFAULT 0.0,
    "payout_date" "date",
    "payout_type" character varying,
    "note" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sale_commissions" OWNER TO "supabase_admin";

--
-- Name: TABLE "sale_commissions"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sale_commissions" IS 'Allowances and Comissions Payouts.';


--
-- Name: sale_expenses; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sale_expenses" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sale_id" "uuid" NOT NULL,
    "supplier_id" "uuid" NOT NULL,
    "invoice_reference" character varying,
    "invoice_amount" numeric(6,3) DEFAULT 0.0,
    "payout_approval_date" "date",
    "payout_amount" numeric(6,3) DEFAULT 0.0,
    "payout_date" "date",
    "rebate_amount" numeric(6,3) DEFAULT 0.0,
    "note" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sale_expenses" OWNER TO "supabase_admin";

--
-- Name: TABLE "sale_expenses"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sale_expenses" IS 'Expenses Payouts.';


--
-- Name: sale_invoice_payments; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sale_invoice_payments" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sale_id" "uuid" NOT NULL,
    "sale_order_id" "uuid" NOT NULL,
    "invoice_reference" character varying,
    "invoice_amount" numeric(18,3) DEFAULT 0.0,
    "invoice_date" "date",
    "payment_mode_id" "uuid" NOT NULL,
    "payment_reference" character varying,
    "payment_date" "date",
    "payment_check_date" "date",
    "receipt_issue_date" "date",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sale_invoice_payments" OWNER TO "supabase_admin";

--
-- Name: TABLE "sale_invoice_payments"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sale_invoice_payments" IS 'Invoice Payments. Invoice';


--
-- Name: sale_orders; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sale_orders" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sale_id" "uuid" NOT NULL,
    "quotation_id" "uuid",
    "sale_date" "date",
    "total" numeric(18,3) DEFAULT 0.0,
    "is_variation" boolean DEFAULT false NOT NULL,
    "note" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sale_orders" OWNER TO "supabase_admin";

--
-- Name: TABLE "sale_orders"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sale_orders" IS 'Orders and Variation Orders.';


--
-- Name: sale_participants; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sale_participants" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sale_id" "uuid" NOT NULL,
    "employee_id" "uuid" NOT NULL,
    "sales_position_id" "uuid" NOT NULL,
    "team_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sale_participants" OWNER TO "supabase_admin";

--
-- Name: TABLE "sale_participants"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sale_participants" IS 'Sale Participants.';


--
-- Name: sales; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sales" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "job_id" "uuid" NOT NULL,
    "visionary_id" "uuid" NOT NULL,
    "sale_reference" character varying,
    "property_class_id" "uuid" NOT NULL,
    "first_service_date" "date",
    "client_profile_id" "uuid" NOT NULL,
    "signed_date" "date",
    "expected_handover_at" timestamp with time zone,
    "handover_at" timestamp with time zone,
    "status" character varying,
    "note" character varying,
    "completed_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."sales" OWNER TO "supabase_admin";

--
-- Name: TABLE "sales"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."sales" IS 'Sales.';


--
-- Name: sales_report_cleaned; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."sales_report_cleaned" (
    "id" "text" NOT NULL,
    "company" "text",
    "project_reference" "text",
    "type" "text",
    "member-1" "text",
    "position-1" "text",
    "member-2" "text",
    "position-2" "text",
    "service" "text",
    "year" bigint,
    "ref" bigint,
    "blk" "text",
    "unit" "text",
    "street" "text",
    "postal" "text",
    "client's_name" "text",
    "contact" "text",
    "email" "text",
    "contract" "text",
    "contract_value" "text",
    "VO-1" "text",
    "VO-2" "text",
    "VO-3" "text",
    "1st_payment" double precision,
    "payment_mode" "text",
    "date" "text",
    "receipt" "text",
    "2nd_payment" double precision,
    "payment_mode.1" "text",
    "date.1" "text",
    "receipt.1" "text",
    "3rd_payment" double precision,
    "payment_mode.2" "text",
    "date.2" "text",
    "receipt.2" "text",
    "4th_payment" double precision,
    "payment_mode.3" "text",
    "date.3" "text",
    "receipt.3" "text",
    "5th_payment" "text",
    "payment_mode.4" "text",
    "date.4" "text",
    "receipt.4" "text",
    "6th_payment" "text",
    "payment_mode.5" "text",
    "date.5" "text",
    "receipt.5" "text",
    "7th_payment" "text",
    "payment_mode.6" "text",
    "date.6" "text",
    "receipt.6" "text",
    "8th_payment" "text",
    "payment_mode.7" "text",
    "date.7" "text",
    "receipt.7" "text",
    "9th_payment" "text",
    "payment_mode.8" "text",
    "date.8" "text",
    "receipt.8" "text",
    "10th_payment" "text",
    "payment_mode.9" "text",
    "date.9" "text",
    "receipt.9" "text",
    "unnamed:65" "text",
    "expenses" "text",
    "allowance_payment1" "text",
    "allowance_payment2" "text",
    "final_payout" "text",
    "project_status" "text",
    "dateof_completion" "text",
    "job_id" "uuid",
    "client_profile_id" "uuid"
);


ALTER TABLE "public"."sales_report_cleaned" OWNER TO "supabase_admin";

--
-- Name: supplier_skus; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."supplier_skus" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "sku_id" "uuid",
    "supplier_id" "uuid",
    "unit_id" "uuid",
    "cost_per_unit" numeric(6,3) DEFAULT 0.0,
    "price_per_unit" numeric(6,3) DEFAULT 0.0,
    "min_price_per_unit" numeric(6,3) DEFAULT 0.0,
    "max_price_per_unit" numeric(6,3) DEFAULT 0.0,
    "min_unit" numeric(6,3) DEFAULT 0.0,
    "max_unit" numeric(6,3) DEFAULT 0.0,
    "is_default_supplier" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."supplier_skus" OWNER TO "supabase_admin";

--
-- Name: TABLE "supplier_skus"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."supplier_skus" IS 'Information about Suppliers <-> SKUs.';


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE "public"."suppliers" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "company_name" character varying,
    "address_line_1" character varying,
    "address_line_2" character varying,
    "address_line_3" character varying,
    "company_registration" character varying,
    "gst" boolean DEFAULT false NOT NULL,
    "gst_registration_number" character varying,
    "contact_person" character varying,
    "contact_email" character varying,
    "contact_phone" character varying,
    "office_phone" character varying,
    "finance_person" character varying,
    "finance_email" character varying,
    "finance_phone" character varying,
    "bank" character varying,
    "bank_account_number" character varying,
    "bank_account_name" character varying,
    "rebate_rate" numeric(6,3) DEFAULT 0.0,
    "rebate" character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."suppliers" OWNER TO "supabase_admin";

--
-- Name: TABLE "suppliers"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE "public"."suppliers" IS 'Information about Suppliers.';


--
-- Name: temp_client_appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_client_appointments" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_appointment_id" bigint NOT NULL,
    "client_tagging_id" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "employee_id" bigint NOT NULL,
    "title" character varying(255),
    "reminder_time" timestamp(0) without time zone,
    "requirement_due_date" "date" NOT NULL,
    "appointment_date" "date" NOT NULL,
    "appointment_start_time" time(0) without time zone NOT NULL,
    "appointment_end_time" time(0) without time zone NOT NULL,
    "appointment_venue_id" bigint NOT NULL,
    "appointment_block" character varying(255),
    "appointment_unit" character varying(255),
    "appointment_postal" character varying(255),
    "appointment_street" "text",
    "remarks" "text",
    "type" character varying(255) DEFAULT 'appointment'::character varying NOT NULL,
    "status" character varying(255),
    "message" "text",
    "is_subsequent" boolean DEFAULT false NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "temp_client_appointments_status_check" CHECK ((("status")::"text" = ANY (ARRAY[('draft'::character varying)::"text", ('open'::character varying)::"text", ('done'::character varying)::"text", ('cancelled'::character varying)::"text", ('open-follow-up'::character varying)::"text", ('closed-follow-up'::character varying)::"text", ('rescheduled'::character varying)::"text"]))),
    CONSTRAINT "temp_client_appointments_type_check" CHECK ((("type")::"text" = ANY (ARRAY[('appointment'::character varying)::"text", ('event'::character varying)::"text"])))
);


ALTER TABLE "public"."temp_client_appointments" OWNER TO "postgres";

--
-- Name: temp_client_calls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_client_calls" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_call_id" bigint NOT NULL,
    "client_tagging_id" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "attempt_number" integer NOT NULL,
    "call_remarks" "text",
    "call_type" character varying(255) DEFAULT 'regular'::character varying NOT NULL,
    "user_id" bigint NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "temp_client_calls_call_type_check" CHECK ((("call_type")::"text" = ANY (ARRAY[('regular'::character varying)::"text", ('follow-up'::character varying)::"text"])))
);


ALTER TABLE "public"."temp_client_calls" OWNER TO "postgres";

--
-- Name: COLUMN "temp_client_calls"."attempt_number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_client_calls"."attempt_number" IS 'eg. this call is the 3rd attemp';


--
-- Name: COLUMN "temp_client_calls"."user_id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_client_calls"."user_id" IS 'user id of the user who clicks the call button';


--
-- Name: temp_client_taggings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_client_taggings" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_tagging_id" bigint NOT NULL,
    "client_id" bigint NOT NULL,
    "call_count" integer DEFAULT 0 NOT NULL,
    "latest_call_date" timestamp(0) without time zone,
    "assigned_to" bigint NOT NULL,
    "assigned_by" bigint NOT NULL,
    "remarks" "text",
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone
);


ALTER TABLE "public"."temp_client_taggings" OWNER TO "postgres";

--
-- Name: COLUMN "temp_client_taggings"."assigned_to"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_client_taggings"."assigned_to" IS 'employee_id of employee assigned to';


--
-- Name: COLUMN "temp_client_taggings"."assigned_by"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_client_taggings"."assigned_by" IS 'user_id of employee who assigned the client';


--
-- Name: temp_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_clients" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "client_id" bigint NOT NULL,
    "job_id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "user_id" bigint,
    "category" character varying(255) DEFAULT 'leads'::character varying NOT NULL,
    "call_count" integer DEFAULT 0 NOT NULL,
    "first_name" character varying(255) NOT NULL,
    "last_name" character varying(255),
    "phone_number" character varying(255),
    "email_address" character varying(255),
    "address_block" character varying(255),
    "address_unit" character varying(255),
    "address_postal" character varying(255),
    "address_street" "text",
    "address_building" "text",
    "upload_url_token" "text",
    "short_url" "text",
    "source_type" character varying(255),
    "source_id" bigint,
    "source_event" "text",
    "other_source" character varying(255),
    "property_type_id" integer,
    "house_type_id" integer,
    "lead_budget_id" integer,
    "key_collection_id" integer,
    "key_collection_expired_at" "date",
    "old_actual_budget" character varying(255),
    "old_key_collection" character varying(255),
    "old_property_type" character varying(255),
    "old_house_type" character varying(255),
    "old_lead_status" character varying(255),
    "old_lead_reason" character varying(255),
    "old_lead_comments" "text",
    "old_lead_address" character varying(255),
    "old_lead_address_block" character varying(255),
    "old_lead_address_street" character varying(255),
    "old_lead_address_floor" character varying(255),
    "old_lead_address_unit" character varying(255),
    "old_lead_address_postal_code" character varying(255),
    "old_appointment_venue" "text",
    "old_lead_id" bigint,
    "general_status" character varying(255) DEFAULT 'open'::character varying NOT NULL,
    "sub_status" character varying(255) DEFAULT 'new'::character varying,
    "comments" "text",
    "unqualified_reason" "text",
    "received_at" timestamp(0) without time zone,
    "created_by" bigint NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone,
    CONSTRAINT "temp_clients_category_check" CHECK ((("category")::"text" = ANY (ARRAY[('leads'::character varying)::"text", ('opportunities'::character varying)::"text", ('appointments'::character varying)::"text", ('projects'::character varying)::"text"]))),
    CONSTRAINT "temp_clients_source_type_check" CHECK ((("source_type")::"text" = ANY (ARRAY[('leads-portal'::character varying)::"text", ('social-media'::character varying)::"text", ('event'::character varying)::"text", ('referral'::character varying)::"text", ('others'::character varying)::"text", ('new-client'::character varying)::"text", ('personal-referral'::character varying)::"text"])))
);


ALTER TABLE "public"."temp_clients" OWNER TO "postgres";

--
-- Name: COLUMN "temp_clients"."user_id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."user_id" IS 'user_id of client in users table to able access the UPLOAD URL';


--
-- Name: COLUMN "temp_clients"."category"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."category" IS 'this category is to identify client whether it is in leads/opportunities/appointments/projects';


--
-- Name: COLUMN "temp_clients"."source_id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."source_id" IS 'ID from lead sources; ID from past opportunities/leads';


--
-- Name: COLUMN "temp_clients"."source_event"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."source_event" IS 'event name if source_tpye = event';


--
-- Name: COLUMN "temp_clients"."other_source"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."other_source" IS 'value here if source_type = others';


--
-- Name: COLUMN "temp_clients"."general_status"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."general_status" IS 'this status is general/overall status of the client whether it is in leads/opportunity/appointment/projects: open,contacted,unqualified,follow-up';


--
-- Name: COLUMN "temp_clients"."sub_status"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."sub_status" IS 'this status is general/overall status of the client whether it is in opportunity/appointment/projects: new, follow-up, refund, pending-document, appointment, for-profiling, profiled, pending-payment, reschedule,ongoing,archived';


--
-- Name: COLUMN "temp_clients"."created_by"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."temp_clients"."created_by" IS 'user_id of user who created the client-opportunity';


--
-- Name: temp_lookup_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_lookup_values" (
    "id" "uuid" NOT NULL,
    "v2_lookup_value_id" "uuid",
    "v2_lookup_value_type" character varying(255) NOT NULL,
    "v1_lookup_value_type" character varying(255) NOT NULL,
    "v1_setting_id" integer DEFAULT 0 NOT NULL,
    "v1_setting_slug" character varying(255) NOT NULL,
    "v1_setting_name" character varying(255) NOT NULL,
    "v1_setting_description" "text" NOT NULL,
    "v1_setting_order" character varying(10) NOT NULL,
    "is_skipped" boolean DEFAULT false NOT NULL,
    "is_for_map" boolean DEFAULT false NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone
);


ALTER TABLE "public"."temp_lookup_values" OWNER TO "postgres";

--
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."temp_users" (
    "id" "uuid" NOT NULL,
    "email" character varying(255) NOT NULL,
    "v2_user_id" "uuid",
    "v2_employee_id" "uuid",
    "v1_user_id" integer DEFAULT 0 NOT NULL,
    "v1_employee_id" integer DEFAULT 0 NOT NULL,
    "v1_is_active" boolean DEFAULT false NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone,
    "deleted_at" timestamp(0) without time zone
);


ALTER TABLE "public"."temp_users" OWNER TO "postgres";

--
-- Name: view_opportunities; Type: VIEW; Schema: public; Owner: authenticated
--

CREATE VIEW "public"."view_opportunities" AS
 SELECT "o"."id",
    "o"."job_id",
    "o"."status",
    "o"."created_at",
    "o"."unqualify_reason",
    "o"."unqualify_reason_others",
    "o"."updated_at",
    "o"."created_by",
    "o"."created_by_name",
    "o"."representative_id",
    ( SELECT "oc"."id"
           FROM "public"."communications" "oc"
          WHERE (("oc"."job_id" = "o"."job_id") AND ("oc"."communication_type" = 'call'::"public"."communications_type") AND ("oc"."communicated_at" IS NULL) AND ("oc"."stage" = 'opportunity'::"public"."communications_stage_type"))
         LIMIT 1) AS "communication_id",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'original-floor-plan'::"text"))) AS "original_floor_plan",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'site-video-photo'::"text"))) AS "site_video_photo",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'existing-furniture'::"text"))) AS "existing_furniture",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'reference-design'::"text"))) AS "reference_design",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'off-the-shelve-furniture'::"text"))) AS "off_the_shelve_furniture",
    ( SELECT "count"(DISTINCT "d"."job_id") AS "count"
           FROM "public"."documents" "d"
          WHERE (("d"."job_id" = "o"."job_id") AND (("d"."category")::"text" = 'other-documents'::"text"))) AS "other_documents",
    "p2"."id" AS "prospect_id",
    "p2"."client_upload_token",
    "employees"."full_name" AS "representative_name",
    "l"."id" AS "lead_id",
    "l"."name" AS "lead_name",
    "l"."email" AS "lead_email",
    "l"."phone" AS "lead_phone",
    "l"."source" AS "lead_source",
    "l"."notes" AS "lead_note",
    "l"."source_details" AS "lead_source_details",
    "l"."created_at" AS "lead_created_at",
    "concat"("a2"."date", ' ', "a2"."start_time") AS "appointment_datetime",
    "a2"."venue",
    "a2"."address",
    "c1"."scheduled_at" AS "call_at",
        CASE
            WHEN ("employees"."id" = "o"."created_by") THEN "employees"."full_name"
            ELSE NULL::character varying
        END AS "creator_name"
   FROM ((((("public"."opportunities" "o"
     JOIN "public"."leads" "l" ON (("l"."job_id" = "o"."job_id")))
     LEFT JOIN ( SELECT DISTINCT ON ("p1"."job_id") "p1"."job_id",
            "p1"."id",
            "p1"."created_at",
            "p1"."client_upload_token",
            "p1"."representative_id"
           FROM "public"."prospects" "p1"
          ORDER BY "p1"."job_id", "p1"."created_at" DESC) "p2" ON (("p2"."job_id" = "o"."job_id")))
     LEFT JOIN ( SELECT DISTINCT ON ("o1"."job_id") "o1"."job_id",
            "o1"."id",
            "o1"."scheduled_at",
            "o1"."created_at"
           FROM "public"."communications" "o1"
          WHERE (("o1"."communicated_at" IS NULL) AND ("o1"."communication_type" = 'call'::"public"."communications_type") AND ("o1"."stage" = 'opportunity'::"public"."communications_stage_type"))
          ORDER BY "o1"."job_id", "o1"."created_at" DESC) "c1" ON (("c1"."job_id" = "o"."job_id")))
     LEFT JOIN ( SELECT DISTINCT ON ("a1"."job_id") "a1"."job_id",
            "a1"."id",
            "a1"."created_at",
            "a1"."representative_id",
            "a1"."date",
            "a1"."start_time",
            "a1"."venue",
            "a1"."address"
           FROM "public"."appointments" "a1"
          ORDER BY "a1"."job_id", "a1"."created_at" DESC) "a2" ON (("a2"."job_id" = "o"."job_id")))
     LEFT JOIN "public"."employees" ON (("employees"."id" = "o"."representative_id")));


ALTER TABLE "public"."view_opportunities" OWNER TO "authenticated";

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE "realtime"."schema_migrations" (
    "version" bigint NOT NULL,
    "inserted_at" timestamp(0) without time zone
);


ALTER TABLE "realtime"."schema_migrations" OWNER TO "supabase_admin";

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE "realtime"."subscription" (
    "id" bigint NOT NULL,
    "subscription_id" "uuid" NOT NULL,
    "entity" "regclass" NOT NULL,
    "filters" "realtime"."user_defined_filter"[] DEFAULT '{}'::"realtime"."user_defined_filter"[] NOT NULL,
    "claims" "jsonb" NOT NULL,
    "claims_role" "regrole" GENERATED ALWAYS AS ("realtime"."to_regrole"(("claims" ->> 'role'::"text"))) STORED NOT NULL,
    "created_at" timestamp without time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL
);


ALTER TABLE "realtime"."subscription" OWNER TO "supabase_admin";

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE "realtime"."subscription" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "realtime"."subscription_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE "storage"."buckets" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "public" boolean DEFAULT false,
    "avif_autodetection" boolean DEFAULT false,
    "file_size_limit" bigint,
    "allowed_mime_types" "text"[]
);


ALTER TABLE "storage"."buckets" OWNER TO "supabase_storage_admin";

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE "storage"."migrations" (
    "id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "hash" character varying(40) NOT NULL,
    "executed_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "storage"."migrations" OWNER TO "supabase_storage_admin";

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE "storage"."objects" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "bucket_id" "text",
    "name" "text",
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "last_accessed_at" timestamp with time zone DEFAULT "now"(),
    "metadata" "jsonb",
    "path_tokens" "text"[] GENERATED ALWAYS AS ("string_to_array"("name", '/'::"text")) STORED,
    "version" "text"
);


ALTER TABLE "storage"."objects" OWNER TO "supabase_storage_admin";

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."refresh_tokens" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth"."refresh_tokens_id_seq"'::"regclass");


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."migrations_id_seq"'::"regclass");


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."personal_access_tokens" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."personal_access_tokens_id_seq"'::"regclass");


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "amr_id_pk" PRIMARY KEY ("id");


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."audit_log_entries"
    ADD CONSTRAINT "audit_log_entries_pkey" PRIMARY KEY ("id");


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."flow_state"
    ADD CONSTRAINT "flow_state_pkey" PRIMARY KEY ("id");


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_pkey" PRIMARY KEY ("provider", "id");


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."instances"
    ADD CONSTRAINT "instances_pkey" PRIMARY KEY ("id");


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_authentication_method_pkey" UNIQUE ("session_id", "authentication_method");


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_pkey" PRIMARY KEY ("id");


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_pkey" PRIMARY KEY ("id");


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id");


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_token_unique" UNIQUE ("token");


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_entity_id_key" UNIQUE ("entity_id");


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_pkey" PRIMARY KEY ("id");


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_pkey" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_pkey" PRIMARY KEY ("id");


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."sso_providers"
    ADD CONSTRAINT "sso_providers_pkey" PRIMARY KEY ("id");


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_phone_key" UNIQUE ("phone");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."announcements"
    ADD CONSTRAINT "announcements_pkey" PRIMARY KEY ("id");


--
-- Name: appointment_participants appointment_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointment_participants"
    ADD CONSTRAINT "appointment_participants_pkey" PRIMARY KEY ("id");


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_pkey" PRIMARY KEY ("id");


--
-- Name: client_appointment_participants client_appointment_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."client_appointment_participants"
    ADD CONSTRAINT "client_appointment_participants_pkey" PRIMARY KEY ("id");


--
-- Name: client_floor_plans client_floor_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."client_floor_plans"
    ADD CONSTRAINT "client_floor_plans_pkey" PRIMARY KEY ("id");


--
-- Name: client_follow_ups client_follow_ups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."client_follow_ups"
    ADD CONSTRAINT "client_follow_ups_pkey" PRIMARY KEY ("id");


--
-- Name: client_profiles client_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."client_profiles"
    ADD CONSTRAINT "client_profiles_pkey" PRIMARY KEY ("id");


--
-- Name: client_requirement_attachments client_requirement_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."client_requirement_attachments"
    ADD CONSTRAINT "client_requirement_attachments_pkey" PRIMARY KEY ("id");


--
-- Name: client_requirements client_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."client_requirements"
    ADD CONSTRAINT "client_requirements_pkey" PRIMARY KEY ("id");


--
-- Name: communications communications_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."communications"
    ADD CONSTRAINT "communications_pkey" PRIMARY KEY ("id");


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."databasechangeloglock"
    ADD CONSTRAINT "databasechangeloglock_pkey" PRIMARY KEY ("id");


--
-- Name: design_profile_concepts design_profile_concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."design_profile_concepts"
    ADD CONSTRAINT "design_profile_concepts_pkey" PRIMARY KEY ("id");


--
-- Name: design_profiles design_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."design_profiles"
    ADD CONSTRAINT "design_profiles_pkey" PRIMARY KEY ("id");


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."documents"
    ADD CONSTRAINT "documents_pkey" PRIMARY KEY ("id");


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_email_key" UNIQUE ("email");


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");


--
-- Name: job_areas job_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_areas"
    ADD CONSTRAINT "job_areas_pkey" PRIMARY KEY ("id");


--
-- Name: job_histories job_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_histories"
    ADD CONSTRAINT "job_histories_pkey" PRIMARY KEY ("id");


--
-- Name: job_profiles job_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_profiles"
    ADD CONSTRAINT "job_profiles_pkey" PRIMARY KEY ("id");


--
-- Name: job_work_metas job_work_metas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_work_metas"
    ADD CONSTRAINT "job_work_metas_pkey" PRIMARY KEY ("id");


--
-- Name: job_works job_works_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_works"
    ADD CONSTRAINT "job_works_pkey" PRIMARY KEY ("id");


--
-- Name: leads leads_job_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_job_id_key" UNIQUE ("job_id");


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_pkey" PRIMARY KEY ("id");


--
-- Name: lookup_child_values lookup_child_values_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."lookup_child_values"
    ADD CONSTRAINT "lookup_child_values_pkey" PRIMARY KEY ("id");


--
-- Name: lookup_documents lookup_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."lookup_documents"
    ADD CONSTRAINT "lookup_documents_pkey" PRIMARY KEY ("id");


--
-- Name: lookup_values lookup_values_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."lookup_values"
    ADD CONSTRAINT "lookup_values_pkey" PRIMARY KEY ("id");


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");


--
-- Name: opportunities opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."opportunities"
    ADD CONSTRAINT "opportunities_pkey" PRIMARY KEY ("id");


--
-- Name: opportunity_checklists opportunity_checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."opportunity_checklists"
    ADD CONSTRAINT "opportunity_checklists_pkey" PRIMARY KEY ("id");


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."personal_access_tokens"
    ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."personal_access_tokens"
    ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");


--
-- Name: prospects prospects_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."prospects"
    ADD CONSTRAINT "prospects_pkey" PRIMARY KEY ("id");


--
-- Name: quotation_items quotation_items_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_pkey" PRIMARY KEY ("id");


--
-- Name: quotations quotations_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_pkey" PRIMARY KEY ("id");


--
-- Name: remodellings remodellings_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."remodellings"
    ADD CONSTRAINT "remodellings_pkey" PRIMARY KEY ("id");


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_name_key" UNIQUE ("name");


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");


--
-- Name: sale_commissions sale_commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_commissions"
    ADD CONSTRAINT "sale_commissions_pkey" PRIMARY KEY ("id");


--
-- Name: sale_expenses sale_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_expenses"
    ADD CONSTRAINT "sale_expenses_pkey" PRIMARY KEY ("id");


--
-- Name: sale_invoice_payments sale_invoice_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_invoice_payments"
    ADD CONSTRAINT "sale_invoice_payments_pkey" PRIMARY KEY ("id");


--
-- Name: sale_orders sale_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_orders"
    ADD CONSTRAINT "sale_orders_pkey" PRIMARY KEY ("id");


--
-- Name: sale_participants sale_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_participants"
    ADD CONSTRAINT "sale_participants_pkey" PRIMARY KEY ("id");


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sales"
    ADD CONSTRAINT "sales_pkey" PRIMARY KEY ("id");


--
-- Name: sales_report_cleaned sales_report_cleaned_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sales_report_cleaned"
    ADD CONSTRAINT "sales_report_cleaned_pkey" PRIMARY KEY ("id");


--
-- Name: sku_includes sku_includes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sku_includes"
    ADD CONSTRAINT "sku_includes_pkey" PRIMARY KEY ("id");


--
-- Name: sku_sku_includes sku_sku_includes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sku_sku_includes"
    ADD CONSTRAINT "sku_sku_includes_pkey" PRIMARY KEY ("id");


--
-- Name: skus skus_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_pkey" PRIMARY KEY ("id");


--
-- Name: supplier_skus supplier_skus_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."supplier_skus"
    ADD CONSTRAINT "supplier_skus_pkey" PRIMARY KEY ("id");


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."suppliers"
    ADD CONSTRAINT "suppliers_pkey" PRIMARY KEY ("id");


--
-- Name: temp_client_appointments temp_client_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_client_appointments"
    ADD CONSTRAINT "temp_client_appointments_pkey" PRIMARY KEY ("id");


--
-- Name: temp_client_calls temp_client_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_client_calls"
    ADD CONSTRAINT "temp_client_calls_pkey" PRIMARY KEY ("id");


--
-- Name: temp_client_taggings temp_client_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_client_taggings"
    ADD CONSTRAINT "temp_client_taggings_pkey" PRIMARY KEY ("id");


--
-- Name: temp_clients temp_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_clients"
    ADD CONSTRAINT "temp_clients_pkey" PRIMARY KEY ("id");


--
-- Name: temp_lookup_values temp_lookup_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_lookup_values"
    ADD CONSTRAINT "temp_lookup_values_pkey" PRIMARY KEY ("id");


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."temp_users"
    ADD CONSTRAINT "temp_users_pkey" PRIMARY KEY ("id");


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."user_roles"
    ADD CONSTRAINT "user_roles_pkey" PRIMARY KEY ("id");


--
-- Name: user_roles user_roles_user_role_unique_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."user_roles"
    ADD CONSTRAINT "user_roles_user_role_unique_key" UNIQUE ("user_id", "role_id");


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY "realtime"."subscription"
    ADD CONSTRAINT "pk_subscription" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY "realtime"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."buckets"
    ADD CONSTRAINT "buckets_pkey" PRIMARY KEY ("id");


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_name_key" UNIQUE ("name");


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_pkey" PRIMARY KEY ("id");


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "audit_logs_instance_id_idx" ON "auth"."audit_log_entries" USING "btree" ("instance_id");


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "confirmation_token_idx" ON "auth"."users" USING "btree" ("confirmation_token") WHERE (("confirmation_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "email_change_token_current_idx" ON "auth"."users" USING "btree" ("email_change_token_current") WHERE (("email_change_token_current")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "email_change_token_new_idx" ON "auth"."users" USING "btree" ("email_change_token_new") WHERE (("email_change_token_new")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "factor_id_created_at_idx" ON "auth"."mfa_factors" USING "btree" ("user_id", "created_at");


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "identities_email_idx" ON "auth"."identities" USING "btree" ("email" "text_pattern_ops");


--
-- Name: INDEX "identities_email_idx"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX "auth"."identities_email_idx" IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "identities_user_id_idx" ON "auth"."identities" USING "btree" ("user_id");


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "idx_auth_code" ON "auth"."flow_state" USING "btree" ("auth_code");


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "mfa_factors_user_friendly_name_unique" ON "auth"."mfa_factors" USING "btree" ("friendly_name", "user_id") WHERE (TRIM(BOTH FROM "friendly_name") <> ''::"text");


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "reauthentication_token_idx" ON "auth"."users" USING "btree" ("reauthentication_token") WHERE (("reauthentication_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "recovery_token_idx" ON "auth"."users" USING "btree" ("recovery_token") WHERE (("recovery_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: refresh_token_session_id; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_token_session_id" ON "auth"."refresh_tokens" USING "btree" ("session_id");


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_tokens_instance_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id");


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_tokens_instance_id_user_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id", "user_id");


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_tokens_parent_idx" ON "auth"."refresh_tokens" USING "btree" ("parent");


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_tokens_session_id_revoked_idx" ON "auth"."refresh_tokens" USING "btree" ("session_id", "revoked");


--
-- Name: refresh_tokens_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "refresh_tokens_token_idx" ON "auth"."refresh_tokens" USING "btree" ("token");


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "saml_providers_sso_provider_id_idx" ON "auth"."saml_providers" USING "btree" ("sso_provider_id");


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "saml_relay_states_for_email_idx" ON "auth"."saml_relay_states" USING "btree" ("for_email");


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "saml_relay_states_sso_provider_id_idx" ON "auth"."saml_relay_states" USING "btree" ("sso_provider_id");


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "sessions_user_id_idx" ON "auth"."sessions" USING "btree" ("user_id");


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "sso_domains_domain_idx" ON "auth"."sso_domains" USING "btree" ("lower"("domain"));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "sso_domains_sso_provider_id_idx" ON "auth"."sso_domains" USING "btree" ("sso_provider_id");


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "sso_providers_resource_id_idx" ON "auth"."sso_providers" USING "btree" ("lower"("resource_id"));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "user_id_created_at_idx" ON "auth"."sessions" USING "btree" ("user_id", "created_at");


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX "users_email_partial_key" ON "auth"."users" USING "btree" ("email") WHERE ("is_sso_user" = false);


--
-- Name: INDEX "users_email_partial_key"; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX "auth"."users_email_partial_key" IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "users_instance_id_email_idx" ON "auth"."users" USING "btree" ("instance_id", "lower"(("email")::"text"));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX "users_instance_id_idx" ON "auth"."users" USING "btree" ("instance_id");


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING "btree" ("tokenable_type", "tokenable_id");


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX "ix_realtime_subscription_entity" ON "realtime"."subscription" USING "hash" ("entity");


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX "subscription_subscription_id_entity_filters_key" ON "realtime"."subscription" USING "btree" ("subscription_id", "entity", "filters");


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX "bname" ON "storage"."buckets" USING "btree" ("name");


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX "bucketid_objname" ON "storage"."objects" USING "btree" ("bucket_id", "name");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX "name_prefix_search" ON "storage"."objects" USING "btree" ("name" "text_pattern_ops");


--
-- Name: announcements announcements_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "announcements_handle_updated_at" BEFORE UPDATE ON "public"."announcements" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: appointment_participants appointment_participants_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "appointment_participants_handle_updated_at" BEFORE UPDATE ON "public"."appointment_participants" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: appointments appointments_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "appointments_handle_updated_at" BEFORE UPDATE ON "public"."appointments" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: client_profiles client_profiles_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "client_profiles_handle_updated_at" BEFORE UPDATE ON "public"."client_profiles" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: communications communications_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "communications_handle_updated_at" BEFORE UPDATE ON "public"."communications" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: design_profile_concepts design_profile_concepts_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "design_profile_concepts_handle_updated_at" BEFORE UPDATE ON "public"."design_profile_concepts" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: design_profiles design_profiles_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "design_profiles_handle_updated_at" BEFORE UPDATE ON "public"."design_profiles" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: documents documents_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "documents_handle_updated_at" BEFORE UPDATE ON "public"."documents" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: employees employees_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "employees_handle_updated_at" BEFORE UPDATE ON "public"."employees" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: job_profiles job_profiles_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "job_profiles_handle_updated_at" BEFORE UPDATE ON "public"."job_profiles" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: job_work_metas job_work_metas_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "job_work_metas_handle_updated_at" BEFORE UPDATE ON "public"."job_work_metas" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: leads leads_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "leads_handle_updated_at" BEFORE UPDATE ON "public"."leads" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: lookup_child_values lookup_child_values_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "lookup_child_values_handle_updated_at" BEFORE UPDATE ON "public"."lookup_child_values" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: lookup_documents lookup_documents_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "lookup_documents_handle_updated_at" BEFORE UPDATE ON "public"."lookup_documents" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: lookup_values lookup_values_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "lookup_values_handle_updated_at" BEFORE UPDATE ON "public"."lookup_values" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: opportunities opportunities_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "opportunities_handle_updated_at" BEFORE UPDATE ON "public"."opportunities" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: opportunity_checklists opportunity_checklists_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "opportunity_checklists_handle_updated_at" BEFORE UPDATE ON "public"."opportunity_checklists" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: prospects prospects_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "prospects_handle_updated_at" BEFORE UPDATE ON "public"."prospects" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: quotation_items quotation_items_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "quotation_items_handle_updated_at" BEFORE UPDATE ON "public"."quotation_items" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: quotations quotations_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "quotations_handle_updated_at" BEFORE UPDATE ON "public"."quotations" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: remodellings remodellings_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "remodellings_handle_updated_at" BEFORE UPDATE ON "public"."remodellings" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: roles roles_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "roles_handle_updated_at" BEFORE UPDATE ON "public"."roles" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sale_commissions sale_commissions_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sale_commissions_handle_updated_at" BEFORE UPDATE ON "public"."sale_commissions" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sale_expenses sale_expenses_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sale_expenses_handle_updated_at" BEFORE UPDATE ON "public"."sale_expenses" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sale_invoice_payments sale_invoice_payments_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sale_invoice_payments_handle_updated_at" BEFORE UPDATE ON "public"."sale_invoice_payments" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sale_orders sale_orders_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sale_orders_handle_updated_at" BEFORE UPDATE ON "public"."sale_orders" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sale_participants sale_participants_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sale_participants_handle_updated_at" BEFORE UPDATE ON "public"."sale_participants" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sales sales_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sales_handle_updated_at" BEFORE UPDATE ON "public"."sales" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sku_includes sku_includes_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sku_includes_handle_updated_at" BEFORE UPDATE ON "public"."sku_includes" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: sku_sku_includes sku_sku_includes_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "sku_sku_includes_handle_updated_at" BEFORE UPDATE ON "public"."sku_sku_includes" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: skus skus_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "skus_handle_updated_at" BEFORE UPDATE ON "public"."skus" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: supplier_skus supplier_skus_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "supplier_skus_handle_updated_at" BEFORE UPDATE ON "public"."supplier_skus" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: suppliers suppliers_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "suppliers_handle_updated_at" BEFORE UPDATE ON "public"."suppliers" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: documents update_opportunity_status_on_insert; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "update_opportunity_status_on_insert" AFTER INSERT ON "public"."documents" FOR EACH ROW EXECUTE FUNCTION "public"."fn_update_opportunity_status_after_insert_document"();


--
-- Name: user_roles user_roles_handle_updated_at; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "user_roles_handle_updated_at" BEFORE UPDATE ON "public"."user_roles" FOR EACH ROW EXECUTE FUNCTION "extensions"."moddatetime"('updated_at');


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER "tr_check_filters" BEFORE INSERT OR UPDATE ON "realtime"."subscription" FOR EACH ROW EXECUTE FUNCTION "realtime"."subscription_check_filters"();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER "update_objects_updated_at" BEFORE UPDATE ON "storage"."objects" FOR EACH ROW EXECUTE FUNCTION "storage"."update_updated_at_column"();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_auth_factor_id_fkey" FOREIGN KEY ("factor_id") REFERENCES "auth"."mfa_factors"("id") ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: appointment_participants appointment_participants_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointment_participants"
    ADD CONSTRAINT "appointment_participants_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "public"."appointments"("id");


--
-- Name: appointment_participants appointment_participants_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointment_participants"
    ADD CONSTRAINT "appointment_participants_participant_id_fkey" FOREIGN KEY ("participant_id") REFERENCES "public"."employees"("id");


--
-- Name: appointments appointments_lead_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_lead_id_fkey" FOREIGN KEY ("lead_id") REFERENCES "public"."employees"("id");


--
-- Name: appointments appointments_representative_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_representative_id_fkey" FOREIGN KEY ("representative_id") REFERENCES "public"."employees"("id");


--
-- Name: design_profile_concepts design_profile_concepts_design_concept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."design_profile_concepts"
    ADD CONSTRAINT "design_profile_concepts_design_concept_id_fkey" FOREIGN KEY ("design_concept_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: design_profile_concepts design_profile_concepts_design_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."design_profile_concepts"
    ADD CONSTRAINT "design_profile_concepts_design_profile_id_fkey" FOREIGN KEY ("design_profile_id") REFERENCES "public"."design_profiles"("id");


--
-- Name: design_profiles design_profiles_color_scheme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."design_profiles"
    ADD CONSTRAINT "design_profiles_color_scheme_id_fkey" FOREIGN KEY ("color_scheme_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: employees employees_employee_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_employee_position_id_fkey" FOREIGN KEY ("employee_position_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: job_areas job_areas_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_areas"
    ADD CONSTRAINT "job_areas_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: job_histories job_histories_action_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_histories"
    ADD CONSTRAINT "job_histories_action_by_fkey" FOREIGN KEY ("action_by") REFERENCES "public"."employees"("id");


--
-- Name: job_histories job_histories_event_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_histories"
    ADD CONSTRAINT "job_histories_event_target_id_fkey" FOREIGN KEY ("event_target_id") REFERENCES "public"."employees"("id");


--
-- Name: job_work_metas job_work_metas_child_work_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_work_metas"
    ADD CONSTRAINT "job_work_metas_child_work_item_id_fkey" FOREIGN KEY ("child_work_item_id") REFERENCES "public"."lookup_child_values"("id");


--
-- Name: job_work_metas job_work_metas_job_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_work_metas"
    ADD CONSTRAINT "job_work_metas_job_work_id_fkey" FOREIGN KEY ("job_work_id") REFERENCES "public"."job_works"("id");


--
-- Name: job_works job_works_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."job_works"
    ADD CONSTRAINT "job_works_work_id_fkey" FOREIGN KEY ("work_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: leads leads_assign_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_assign_to_fkey" FOREIGN KEY ("assign_to") REFERENCES "public"."employees"("id");


--
-- Name: leads leads_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");


--
-- Name: lookup_child_values lookup_child_values_lookup_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."lookup_child_values"
    ADD CONSTRAINT "lookup_child_values_lookup_value_id_fkey" FOREIGN KEY ("lookup_value_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: lookup_documents lookup_documents_lookup_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."lookup_documents"
    ADD CONSTRAINT "lookup_documents_lookup_value_id_fkey" FOREIGN KEY ("lookup_value_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: opportunity_checklists opportunity_checklists_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."opportunity_checklists"
    ADD CONSTRAINT "opportunity_checklists_opportunity_id_fkey" FOREIGN KEY ("opportunity_id") REFERENCES "public"."opportunities"("id");


--
-- Name: quotation_items quotation_items_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");


--
-- Name: quotation_items quotation_items_quotation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_quotation_id_fkey" FOREIGN KEY ("quotation_id") REFERENCES "public"."quotations"("id");


--
-- Name: quotation_items quotation_items_sku_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."skus"("id");


--
-- Name: quotation_items quotation_items_sku_include_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_sku_include_id_fkey" FOREIGN KEY ("sku_include_id") REFERENCES "public"."sku_includes"("id");


--
-- Name: quotation_items quotation_items_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotation_items"
    ADD CONSTRAINT "quotation_items_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");


--
-- Name: quotations quotations_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "public"."employees"("id");


--
-- Name: quotations quotations_client_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_client_profile_id_fkey" FOREIGN KEY ("client_profile_id") REFERENCES "public"."client_profiles"("id");


--
-- Name: quotations quotations_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."employees"("id");


--
-- Name: quotations quotations_lead_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_lead_id_fkey" FOREIGN KEY ("lead_id") REFERENCES "public"."employees"("id");


--
-- Name: quotations quotations_representative_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."quotations"
    ADD CONSTRAINT "quotations_representative_id_fkey" FOREIGN KEY ("representative_id") REFERENCES "public"."employees"("id");


--
-- Name: remodellings remodellings_budget_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."remodellings"
    ADD CONSTRAINT "remodellings_budget_type_id_fkey" FOREIGN KEY ("budget_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: remodellings remodellings_house_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."remodellings"
    ADD CONSTRAINT "remodellings_house_type_id_fkey" FOREIGN KEY ("house_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: remodellings remodellings_key_collection_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."remodellings"
    ADD CONSTRAINT "remodellings_key_collection_type_id_fkey" FOREIGN KEY ("key_collection_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: remodellings remodellings_property_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."remodellings"
    ADD CONSTRAINT "remodellings_property_type_id_fkey" FOREIGN KEY ("property_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sale_commissions sale_commissions_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_commissions"
    ADD CONSTRAINT "sale_commissions_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sales"("id");


--
-- Name: sale_commissions sale_commissions_sale_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_commissions"
    ADD CONSTRAINT "sale_commissions_sale_participant_id_fkey" FOREIGN KEY ("sale_participant_id") REFERENCES "public"."sale_participants"("id");


--
-- Name: sale_expenses sale_expenses_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_expenses"
    ADD CONSTRAINT "sale_expenses_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sales"("id");


--
-- Name: sale_expenses sale_expenses_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_expenses"
    ADD CONSTRAINT "sale_expenses_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");


--
-- Name: sale_invoice_payments sale_invoice_payments_payment_mode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_invoice_payments"
    ADD CONSTRAINT "sale_invoice_payments_payment_mode_id_fkey" FOREIGN KEY ("payment_mode_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sale_invoice_payments sale_invoice_payments_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_invoice_payments"
    ADD CONSTRAINT "sale_invoice_payments_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sales"("id");


--
-- Name: sale_invoice_payments sale_invoice_payments_sale_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_invoice_payments"
    ADD CONSTRAINT "sale_invoice_payments_sale_order_id_fkey" FOREIGN KEY ("sale_order_id") REFERENCES "public"."sale_orders"("id");


--
-- Name: sale_orders sale_orders_quotation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_orders"
    ADD CONSTRAINT "sale_orders_quotation_id_fkey" FOREIGN KEY ("quotation_id") REFERENCES "public"."quotations"("id");


--
-- Name: sale_orders sale_orders_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_orders"
    ADD CONSTRAINT "sale_orders_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sales"("id");


--
-- Name: sale_participants sale_participants_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_participants"
    ADD CONSTRAINT "sale_participants_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id");


--
-- Name: sale_participants sale_participants_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_participants"
    ADD CONSTRAINT "sale_participants_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sales"("id");


--
-- Name: sale_participants sale_participants_sales_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_participants"
    ADD CONSTRAINT "sale_participants_sales_position_id_fkey" FOREIGN KEY ("sales_position_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sale_participants sale_participants_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sale_participants"
    ADD CONSTRAINT "sale_participants_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sales sales_client_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sales"
    ADD CONSTRAINT "sales_client_profile_id_fkey" FOREIGN KEY ("client_profile_id") REFERENCES "public"."client_profiles"("id");


--
-- Name: sales sales_property_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sales"
    ADD CONSTRAINT "sales_property_class_id_fkey" FOREIGN KEY ("property_class_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sales sales_visionary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sales"
    ADD CONSTRAINT "sales_visionary_id_fkey" FOREIGN KEY ("visionary_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: sku_sku_includes sku_sku_includes_sku_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sku_sku_includes"
    ADD CONSTRAINT "sku_sku_includes_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."skus"("id");


--
-- Name: sku_sku_includes sku_sku_includes_sku_include_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sku_sku_includes"
    ADD CONSTRAINT "sku_sku_includes_sku_include_id_fkey" FOREIGN KEY ("sku_include_id") REFERENCES "public"."sku_includes"("id");


--
-- Name: sku_sku_includes sku_sku_includes_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."sku_sku_includes"
    ADD CONSTRAINT "sku_sku_includes_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: skus skus_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: skus skus_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: skus skus_house_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_house_type_id_fkey" FOREIGN KEY ("house_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: skus skus_property_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_property_type_id_fkey" FOREIGN KEY ("property_type_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: skus skus_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."skus"
    ADD CONSTRAINT "skus_sub_category_id_fkey" FOREIGN KEY ("sub_category_id") REFERENCES "public"."lookup_child_values"("id");


--
-- Name: supplier_skus supplier_skus_sku_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."supplier_skus"
    ADD CONSTRAINT "supplier_skus_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."skus"("id");


--
-- Name: supplier_skus supplier_skus_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."supplier_skus"
    ADD CONSTRAINT "supplier_skus_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."suppliers"("id");


--
-- Name: supplier_skus supplier_skus_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."supplier_skus"
    ADD CONSTRAINT "supplier_skus_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: user_roles user_roles_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."user_roles"
    ADD CONSTRAINT "user_roles_email_fkey" FOREIGN KEY ("email") REFERENCES "public"."employees"("email");


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."user_roles"
    ADD CONSTRAINT "user_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles"("id");


--
-- Name: user_roles user_roles_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY "public"."user_roles"
    ADD CONSTRAINT "user_roles_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "public"."lookup_values"("id");


--
-- Name: buckets buckets_owner_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."buckets"
    ADD CONSTRAINT "buckets_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id");


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets"("id");


--
-- Name: objects objects_owner_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id");


--
-- Name: announcements; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."announcements" ENABLE ROW LEVEL SECURITY;

--
-- Name: appointment_participants; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."appointment_participants" ENABLE ROW LEVEL SECURITY;

--
-- Name: appointments; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."appointments" ENABLE ROW LEVEL SECURITY;

--
-- Name: communications; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."communications" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_histories create-for-all; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-all" ON "public"."job_histories" FOR INSERT TO "authenticated" WITH CHECK (true);


--
-- Name: lookup_child_values create-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin" ON "public"."lookup_child_values" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_documents create-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin" ON "public"."lookup_documents" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_values create-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin" ON "public"."lookup_values" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: communications create-for-data_admin-sales; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-sales" ON "public"."communications" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: appointment_participants create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."appointment_participants" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: appointments create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."appointments" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: client_profiles create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."client_profiles" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: design_profile_concepts create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."design_profile_concepts" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: design_profiles create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."design_profiles" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: documents create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."documents" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: job_areas create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."job_areas" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: job_profiles create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."job_profiles" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: job_work_metas create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."job_work_metas" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: job_works create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."job_works" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: leads create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."leads" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: opportunities create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."opportunities" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: opportunity_checklists create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."opportunity_checklists" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: prospects create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."prospects" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: remodellings create-for-data_admin-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-data_admin-team_x" ON "public"."remodellings" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))));


--
-- Name: announcements create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."announcements" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_includes create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."sku_includes" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_sku_includes create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."sku_sku_includes" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: skus create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."skus" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: supplier_skus create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."supplier_skus" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: suppliers create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."suppliers" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: user_roles create-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-data_admin" ON "public"."user_roles" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles_1"."user_id"
   FROM ("public"."user_roles" "user_roles_1"
     JOIN "public"."roles" ON (("user_roles_1"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_commissions create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sale_commissions" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_expenses create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sale_expenses" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_invoice_payments create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sale_invoice_payments" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_orders create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sale_orders" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_participants create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sale_participants" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sales create-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-finance-only" ON "public"."sales" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: roles create-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-systems-only" ON "public"."roles" FOR INSERT TO "authenticated" WITH CHECK (false);


--
-- Name: quotation_items create-for-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-team_x" ON "public"."quotation_items" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['sales'::"text"])))));


--
-- Name: quotations create-for-team_x; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "create-for-team_x" ON "public"."quotations" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['team-member'::"text", 'team-leader'::"text"])))));


--
-- Name: employees crud-for-data_admin-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "crud-for-data_admin-finance" ON "public"."employees" TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"]))))) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: lookup_child_values delete-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-data_admin" ON "public"."lookup_child_values" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_documents delete-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-data_admin" ON "public"."lookup_documents" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_values delete-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-data_admin" ON "public"."lookup_values" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: announcements delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."announcements" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_includes delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."sku_includes" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_sku_includes delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."sku_sku_includes" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: skus delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."skus" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: supplier_skus delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."supplier_skus" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: suppliers delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."suppliers" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: user_roles delete-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-data_admin" ON "public"."user_roles" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles_1"."user_id"
   FROM ("public"."user_roles" "user_roles_1"
     JOIN "public"."roles" ON (("user_roles_1"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_commissions delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sale_commissions" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_expenses delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sale_expenses" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_invoice_payments delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sale_invoice_payments" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_orders delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sale_orders" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_participants delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sale_participants" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sales delete-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-finance-only" ON "public"."sales" FOR DELETE TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: appointments delete-for-self-leader; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader" ON "public"."appointments" FOR DELETE TO "authenticated" USING ((("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: appointment_participants delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."appointment_participants" FOR DELETE TO "authenticated" USING ((("appointment_id" IN ( SELECT "appointments"."id"
   FROM "public"."appointments"
  WHERE ("appointments"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))) OR ("participant_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: design_profile_concepts delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."design_profile_concepts" FOR DELETE TO "authenticated" USING (("design_profile_id" IN ( SELECT "design_profiles"."id"
   FROM "public"."design_profiles"
  WHERE ("design_profiles"."job_id" IN ( SELECT "opportunities"."job_id"
           FROM "public"."opportunities"
          WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))))));


--
-- Name: documents delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."documents" FOR DELETE TO "authenticated" USING (("job_id" IN ( SELECT "leads"."job_id"
   FROM "public"."leads"
  WHERE (("leads"."assign_to" IS NULL) OR ("leads"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("leads"."assign_to" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))
UNION
 SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_areas delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."job_areas" FOR DELETE TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_work_metas delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."job_work_metas" FOR DELETE TO "authenticated" USING (("job_work_id" IN ( SELECT "job_works"."id"
   FROM "public"."job_works"
  WHERE ("job_works"."job_id" IN ( SELECT "opportunities"."job_id"
           FROM "public"."opportunities"
          WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))))));


--
-- Name: job_works delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."job_works" FOR DELETE TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: remodellings delete-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-self-leader-creator" ON "public"."remodellings" FOR DELETE TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: client_profiles delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."client_profiles" FOR DELETE TO "authenticated" USING (false);


--
-- Name: communications delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."communications" FOR DELETE TO "authenticated" USING (false);


--
-- Name: design_profiles delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."design_profiles" FOR DELETE TO "authenticated" USING (false);


--
-- Name: job_histories delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."job_histories" FOR DELETE TO "authenticated" USING (false);


--
-- Name: job_profiles delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."job_profiles" FOR DELETE TO "authenticated" USING (false);


--
-- Name: leads delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."leads" FOR DELETE TO "authenticated" USING (false);


--
-- Name: opportunities delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."opportunities" FOR DELETE TO "authenticated" USING (false);


--
-- Name: opportunity_checklists delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."opportunity_checklists" FOR DELETE TO "authenticated" USING (false);


--
-- Name: prospects delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."prospects" FOR DELETE TO "authenticated" USING (false);


--
-- Name: quotation_items delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."quotation_items" FOR DELETE TO "authenticated" USING (false);


--
-- Name: quotations delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."quotations" FOR DELETE TO "authenticated" USING (false);


--
-- Name: roles delete-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "delete-for-systems-only" ON "public"."roles" FOR DELETE TO "authenticated" USING (false);


--
-- Name: design_profile_concepts; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."design_profile_concepts" ENABLE ROW LEVEL SECURITY;

--
-- Name: design_profiles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."design_profiles" ENABLE ROW LEVEL SECURITY;

--
-- Name: documents; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."documents" ENABLE ROW LEVEL SECURITY;

--
-- Name: employees; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."employees" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_areas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."job_areas" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_histories; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."job_histories" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_profiles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."job_profiles" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_work_metas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."job_work_metas" ENABLE ROW LEVEL SECURITY;

--
-- Name: job_works; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."job_works" ENABLE ROW LEVEL SECURITY;

--
-- Name: leads; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."leads" ENABLE ROW LEVEL SECURITY;

--
-- Name: lookup_child_values; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."lookup_child_values" ENABLE ROW LEVEL SECURITY;

--
-- Name: lookup_documents; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."lookup_documents" ENABLE ROW LEVEL SECURITY;

--
-- Name: lookup_values; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."lookup_values" ENABLE ROW LEVEL SECURITY;

--
-- Name: opportunities; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."opportunities" ENABLE ROW LEVEL SECURITY;

--
-- Name: opportunity_checklists; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."opportunity_checklists" ENABLE ROW LEVEL SECURITY;

--
-- Name: prospects; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."prospects" ENABLE ROW LEVEL SECURITY;

--
-- Name: quotation_items; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."quotation_items" ENABLE ROW LEVEL SECURITY;

--
-- Name: quotations; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."quotations" ENABLE ROW LEVEL SECURITY;

--
-- Name: announcements read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."announcements" FOR SELECT TO "authenticated" USING (true);


--
-- Name: appointments read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."appointments" FOR SELECT TO "authenticated" USING (true);


--
-- Name: lookup_child_values read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."lookup_child_values" FOR SELECT TO "authenticated" USING (true);


--
-- Name: lookup_documents read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."lookup_documents" FOR SELECT TO "authenticated" USING (true);


--
-- Name: lookup_values read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."lookup_values" FOR SELECT TO "authenticated" USING (true);


--
-- Name: quotations read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."quotations" FOR SELECT TO "authenticated" USING (true);


--
-- Name: roles read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."roles" FOR SELECT TO "authenticated" USING (true);


--
-- Name: sku_includes read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."sku_includes" FOR SELECT TO "authenticated" USING (true);


--
-- Name: sku_sku_includes read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."sku_sku_includes" FOR SELECT TO "authenticated" USING (true);


--
-- Name: skus read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."skus" FOR SELECT TO "authenticated" USING (true);


--
-- Name: supplier_skus read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."supplier_skus" FOR SELECT TO "authenticated" USING (true);


--
-- Name: suppliers read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."suppliers" FOR SELECT TO "authenticated" USING (true);


--
-- Name: user_roles read-for-authenticated-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-authenticated-only" ON "public"."user_roles" FOR SELECT TO "authenticated" USING (true);


--
-- Name: sale_commissions read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sale_commissions" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_expenses read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sale_expenses" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_invoice_payments read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sale_invoice_payments" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_orders read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sale_orders" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_participants read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sale_participants" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sales read-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-finance-only" ON "public"."sales" FOR SELECT TO "authenticated" USING (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: appointment_participants read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."appointment_participants" FOR SELECT TO "authenticated" USING ((("appointment_id" IN ( SELECT "appointments"."id"
   FROM "public"."appointments"
  WHERE ("appointments"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))) OR ("participant_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: communications read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."communications" FOR SELECT TO "authenticated" USING ((("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))) OR ("job_id" IN ( SELECT "prospects"."job_id"
   FROM "public"."prospects"
  WHERE (("prospects"."representative_id" IS NULL) OR ("prospects"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: design_profile_concepts read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."design_profile_concepts" FOR SELECT TO "authenticated" USING (("design_profile_id" IN ( SELECT "design_profiles"."id"
   FROM "public"."design_profiles"
  WHERE ("design_profiles"."job_id" IN ( SELECT "opportunities"."job_id"
           FROM "public"."opportunities"
          WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))))));


--
-- Name: documents read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."documents" FOR SELECT TO "authenticated" USING (("job_id" IN ( SELECT "leads"."job_id"
   FROM "public"."leads"
  WHERE (("leads"."assign_to" IS NULL) OR ("leads"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("leads"."assign_to" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))
UNION
 SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_areas read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."job_areas" FOR SELECT TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_histories read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."job_histories" FOR SELECT TO "authenticated" USING ((("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))) OR ("job_id" IN ( SELECT "prospects"."job_id"
   FROM "public"."prospects"
  WHERE (("prospects"."representative_id" IS NULL) OR ("prospects"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: job_work_metas read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."job_work_metas" FOR SELECT TO "authenticated" USING (("job_work_id" IN ( SELECT "job_works"."id"
   FROM "public"."job_works"
  WHERE ("job_works"."job_id" IN ( SELECT "opportunities"."job_id"
           FROM "public"."opportunities"
          WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))))));


--
-- Name: job_works read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."job_works" FOR SELECT TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: leads read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."leads" FOR SELECT TO "authenticated" USING ((("assign_to" IS NULL) OR ("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("assign_to" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")) OR ("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))) OR ("id" IN ( SELECT "prospects"."lead_id"
   FROM "public"."prospects"
  WHERE ("prospects"."representative_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"())))))));


--
-- Name: opportunities read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."opportunities" FOR SELECT TO "authenticated" USING ((("representative_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: opportunity_checklists read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."opportunity_checklists" FOR SELECT TO "authenticated" USING (("opportunity_id" IN ( SELECT "opportunities"."id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: prospects read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."prospects" FOR SELECT TO "authenticated" USING ((("representative_id" IS NULL) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: quotation_items read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."quotation_items" FOR SELECT TO "authenticated" USING ((("quotation_id" IN ( SELECT "quotations"."id"
   FROM "public"."quotations"
  WHERE (("quotations"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("quotations"."approved_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("quotations"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("quotations"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))) OR ("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"]))))));


--
-- Name: quotations read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."quotations" FOR SELECT TO "authenticated" USING ((("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("approved_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")) OR ("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"]))))));


--
-- Name: remodellings read-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator" ON "public"."remodellings" FOR SELECT TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: client_profiles read-for-self-leader-creator-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator-finance" ON "public"."client_profiles" FOR SELECT TO "authenticated" USING ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))) OR ("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: design_profiles read-for-self-leader-creator-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator-finance" ON "public"."design_profiles" FOR SELECT TO "authenticated" USING (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_profiles read-for-self-leader-creator-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-creator-finance" ON "public"."job_profiles" FOR SELECT TO "authenticated" USING ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))) OR ("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: employees read-for-self-leader-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "read-for-self-leader-data_admin" ON "public"."employees" FOR SELECT TO "authenticated" USING ((("user_id" IN ( SELECT "unnest"("public"."fn_user_id_with_children"("auth"."uid"())) AS "unnest")) OR ("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"]))))));


--
-- Name: roles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."roles" ENABLE ROW LEVEL SECURITY;

--
-- Name: sale_commissions; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sale_commissions" ENABLE ROW LEVEL SECURITY;

--
-- Name: sale_expenses; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sale_expenses" ENABLE ROW LEVEL SECURITY;

--
-- Name: sale_invoice_payments; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sale_invoice_payments" ENABLE ROW LEVEL SECURITY;

--
-- Name: sale_orders; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sale_orders" ENABLE ROW LEVEL SECURITY;

--
-- Name: sale_participants; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sale_participants" ENABLE ROW LEVEL SECURITY;

--
-- Name: sales; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sales" ENABLE ROW LEVEL SECURITY;

--
-- Name: sku_includes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sku_includes" ENABLE ROW LEVEL SECURITY;

--
-- Name: sku_sku_includes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."sku_sku_includes" ENABLE ROW LEVEL SECURITY;

--
-- Name: skus; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."skus" ENABLE ROW LEVEL SECURITY;

--
-- Name: supplier_skus; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."supplier_skus" ENABLE ROW LEVEL SECURITY;

--
-- Name: suppliers; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."suppliers" ENABLE ROW LEVEL SECURITY;

--
-- Name: lookup_child_values update-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-data_admin" ON "public"."lookup_child_values" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_documents update-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-data_admin" ON "public"."lookup_documents" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: lookup_values update-for-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-data_admin" ON "public"."lookup_values" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))));


--
-- Name: announcements update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."announcements" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_includes update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."sku_includes" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sku_sku_includes update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."sku_sku_includes" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: skus update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."skus" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: supplier_skus update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."supplier_skus" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: suppliers update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."suppliers" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: user_roles update-for-finance-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-data_admin" ON "public"."user_roles" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles_1"."user_id"
   FROM ("public"."user_roles" "user_roles_1"
     JOIN "public"."roles" ON (("user_roles_1"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_commissions update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sale_commissions" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_expenses update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sale_expenses" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_invoice_payments update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sale_invoice_payments" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_orders update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sale_orders" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sale_participants update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sale_participants" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: sales update-for-finance-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-finance-only" ON "public"."sales" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))));


--
-- Name: quotation_items update-for-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-leader-creator" ON "public"."quotation_items" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("quotation_id" IN ( SELECT "quotations"."id"
   FROM "public"."quotations"
  WHERE (("quotations"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("quotations"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"())))))));


--
-- Name: quotations update-for-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-leader-creator" ON "public"."quotations" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("status" = 'new'::"public"."quotations_status_type") AND (("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))))));


--
-- Name: employees update-for-self; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self" ON "public"."employees" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("auth"."email"() = ("email")::"text"));


--
-- Name: appointments update-for-self-leader; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader" ON "public"."appointments" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: client_profiles update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."client_profiles" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'finance-leader'::"text", 'finance'::"text"])))) OR ("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: communications update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."communications" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))) OR ("job_id" IN ( SELECT "prospects"."job_id"
   FROM "public"."prospects"
  WHERE (("prospects"."representative_id" IS NULL) OR ("prospects"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("prospects"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: documents update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."documents" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("job_id" IN ( SELECT "leads"."job_id"
   FROM "public"."leads"
  WHERE (("leads"."assign_to" IS NULL) OR ("leads"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("leads"."assign_to" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))
UNION
 SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_work_metas update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."job_work_metas" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("job_work_id" IN ( SELECT "job_works"."id"
   FROM "public"."job_works"
  WHERE ("job_works"."job_id" IN ( SELECT "opportunities"."job_id"
           FROM "public"."opportunities"
          WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
                   FROM "public"."employees"
                  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))))));


--
-- Name: opportunities update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."opportunities" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("representative_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: opportunity_checklists update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."opportunity_checklists" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("opportunity_id" IN ( SELECT "opportunities"."id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: prospects update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."prospects" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text", 'sales'::"text"])))) OR ("lead_id" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("created_by" IN ( SELECT "employees"."id"
   FROM "public"."employees"
  WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: remodellings update-for-self-leader-creator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator" ON "public"."remodellings" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: design_profiles update-for-self-leader-creator-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator-finance" ON "public"."design_profiles" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))))));


--
-- Name: job_profiles update-for-self-leader-creator-finance; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-creator-finance" ON "public"."job_profiles" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['finance-leader'::"text", 'finance'::"text"])))) OR ("job_id" IN ( SELECT "opportunities"."job_id"
   FROM "public"."opportunities"
  WHERE (("opportunities"."representative_id" IS NULL) OR ("opportunities"."lead_id" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."created_by" IN ( SELECT "employees"."id"
           FROM "public"."employees"
          WHERE ("employees"."user_id" = "auth"."uid"()))) OR ("opportunities"."representative_id" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest")))))));


--
-- Name: leads update-for-self-leader-data_admin; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-self-leader-data_admin" ON "public"."leads" FOR UPDATE TO "authenticated" USING (true) WITH CHECK ((("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['data-administrator'::"text"])))) OR (("assign_to" IS NULL) AND ("auth"."uid"() IN ( SELECT "user_roles"."user_id"
   FROM ("public"."user_roles"
     JOIN "public"."roles" ON (("user_roles"."role_id" = "roles"."id")))
  WHERE ("roles"."name" = ANY (ARRAY['sales-leader'::"text"]))))) OR ("assign_to" IN ( SELECT "unnest"("public"."fn_employee_id_with_children"("auth"."uid"())) AS "unnest"))));


--
-- Name: appointment_participants update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."appointment_participants" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);


--
-- Name: design_profile_concepts update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."design_profile_concepts" FOR UPDATE TO "authenticated" USING (false) WITH CHECK (false);


--
-- Name: job_areas update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."job_areas" FOR UPDATE TO "authenticated" USING (false) WITH CHECK (false);


--
-- Name: job_histories update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."job_histories" FOR UPDATE TO "authenticated" USING (false) WITH CHECK (false);


--
-- Name: job_works update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."job_works" FOR UPDATE TO "authenticated" USING (false) WITH CHECK (false);


--
-- Name: roles update-for-systems-only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "update-for-systems-only" ON "public"."roles" FOR UPDATE TO "authenticated" USING (false) WITH CHECK (false);


--
-- Name: user_roles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE "public"."user_roles" ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allows Authenticated / Ano Read / Insert to JOBS bucket 1y1cm_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allows Authenticated / Ano Read / Insert to JOBS bucket 1y1cm_1" ON "storage"."objects" FOR INSERT WITH CHECK ((("bucket_id" = 'jobs'::"text") AND ("auth"."role"() = ANY (ARRAY['authenticated'::"text", 'anon'::"text"]))));


--
-- Name: objects Allows Authenticated Read / Insert to JOBS bucket 1y1cm_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allows Authenticated Read / Insert to JOBS bucket 1y1cm_0" ON "storage"."objects" FOR SELECT USING ((("bucket_id" = 'jobs'::"text") AND ("auth"."role"() = 'authenticated'::"text")));


--
-- Name: objects Give anon users read access to anon users 1bqp9qb_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give anon users read access to anon users 1bqp9qb_0" ON "storage"."objects" FOR SELECT USING ((("bucket_id" = 'assets'::"text") AND ("auth"."role"() = 'anon'::"text")));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE "storage"."buckets" ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE "storage"."migrations" ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE "storage"."objects" ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION "supabase_realtime" WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";

--
-- Name: SCHEMA "auth"; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA "auth" TO "anon";
GRANT USAGE ON SCHEMA "auth" TO "authenticated";
GRANT USAGE ON SCHEMA "auth" TO "service_role";
GRANT ALL ON SCHEMA "auth" TO "supabase_auth_admin";
GRANT ALL ON SCHEMA "auth" TO "dashboard_user";
GRANT ALL ON SCHEMA "auth" TO "postgres";


--
-- Name: SCHEMA "extensions"; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA "extensions" TO "anon";
GRANT USAGE ON SCHEMA "extensions" TO "authenticated";
GRANT USAGE ON SCHEMA "extensions" TO "service_role";
GRANT ALL ON SCHEMA "extensions" TO "dashboard_user";


--
-- Name: SCHEMA "graphql_public"; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA "graphql_public" TO "postgres";
GRANT USAGE ON SCHEMA "graphql_public" TO "anon";
GRANT USAGE ON SCHEMA "graphql_public" TO "authenticated";
GRANT USAGE ON SCHEMA "graphql_public" TO "service_role";


--
-- Name: SCHEMA "public"; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
GRANT ALL ON SCHEMA "public" TO PUBLIC;
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";


--
-- Name: SCHEMA "realtime"; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA "realtime" TO "postgres";


--
-- Name: SCHEMA "storage"; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA "storage" TO "postgres";
GRANT USAGE ON SCHEMA "storage" TO "anon";
GRANT USAGE ON SCHEMA "storage" TO "authenticated";
GRANT USAGE ON SCHEMA "storage" TO "service_role";
GRANT ALL ON SCHEMA "storage" TO "supabase_storage_admin";
GRANT ALL ON SCHEMA "storage" TO "dashboard_user";


--
-- Name: FUNCTION "email"(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION "auth"."email"() TO "dashboard_user";
GRANT ALL ON FUNCTION "auth"."email"() TO "postgres";


--
-- Name: FUNCTION "jwt"(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION "auth"."jwt"() TO "postgres";
GRANT ALL ON FUNCTION "auth"."jwt"() TO "dashboard_user";


--
-- Name: FUNCTION "role"(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION "auth"."role"() TO "dashboard_user";
GRANT ALL ON FUNCTION "auth"."role"() TO "postgres";


--
-- Name: FUNCTION "uid"(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION "auth"."uid"() TO "dashboard_user";
GRANT ALL ON FUNCTION "auth"."uid"() TO "postgres";


--
-- Name: FUNCTION "update_many_prospects"(); Type: ACL; Schema: auth; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "auth"."update_many_prospects"() TO "postgres";
GRANT ALL ON FUNCTION "auth"."update_many_prospects"() TO "dashboard_user";


--
-- Name: FUNCTION "algorithm_sign"("signables" "text", "secret" "text", "algorithm" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."algorithm_sign"("signables" "text", "secret" "text", "algorithm" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."algorithm_sign"("signables" "text", "secret" "text", "algorithm" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "armor"("bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."armor"("bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."armor"("bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "armor"("bytea", "text"[], "text"[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."armor"("bytea", "text"[], "text"[]) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."armor"("bytea", "text"[], "text"[]) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "crypt"("text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."crypt"("text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."crypt"("text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "dearmor"("text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."dearmor"("text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."dearmor"("text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "decrypt"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."decrypt"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."decrypt"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "decrypt_iv"("bytea", "bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "digest"("bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."digest"("bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."digest"("bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "digest"("text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."digest"("text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."digest"("text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "encrypt"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."encrypt"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."encrypt"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "encrypt_iv"("bytea", "bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "gen_random_bytes"(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."gen_random_bytes"(integer) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."gen_random_bytes"(integer) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "gen_random_uuid"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."gen_random_uuid"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."gen_random_uuid"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "gen_salt"("text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."gen_salt"("text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."gen_salt"("text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "gen_salt"("text", integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."gen_salt"("text", integer) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."gen_salt"("text", integer) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "grant_pg_cron_access"(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION "extensions"."grant_pg_cron_access"() FROM "postgres";
GRANT ALL ON FUNCTION "extensions"."grant_pg_cron_access"() TO "postgres" WITH GRANT OPTION;
GRANT ALL ON FUNCTION "extensions"."grant_pg_cron_access"() TO "dashboard_user";


--
-- Name: FUNCTION "grant_pg_graphql_access"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."grant_pg_graphql_access"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "grant_pg_net_access"(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION "extensions"."grant_pg_net_access"() FROM "postgres";
GRANT ALL ON FUNCTION "extensions"."grant_pg_net_access"() TO "postgres" WITH GRANT OPTION;
GRANT ALL ON FUNCTION "extensions"."grant_pg_net_access"() TO "dashboard_user";


--
-- Name: FUNCTION "hmac"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."hmac"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."hmac"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "hmac"("text", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."hmac"("text", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."hmac"("text", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "moddatetime"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."moddatetime"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pg_stat_statements"("showtext" boolean, OUT "userid" "oid", OUT "dbid" "oid", OUT "toplevel" boolean, OUT "queryid" bigint, OUT "query" "text", OUT "plans" bigint, OUT "total_plan_time" double precision, OUT "min_plan_time" double precision, OUT "max_plan_time" double precision, OUT "mean_plan_time" double precision, OUT "stddev_plan_time" double precision, OUT "calls" bigint, OUT "total_exec_time" double precision, OUT "min_exec_time" double precision, OUT "max_exec_time" double precision, OUT "mean_exec_time" double precision, OUT "stddev_exec_time" double precision, OUT "rows" bigint, OUT "shared_blks_hit" bigint, OUT "shared_blks_read" bigint, OUT "shared_blks_dirtied" bigint, OUT "shared_blks_written" bigint, OUT "local_blks_hit" bigint, OUT "local_blks_read" bigint, OUT "local_blks_dirtied" bigint, OUT "local_blks_written" bigint, OUT "temp_blks_read" bigint, OUT "temp_blks_written" bigint, OUT "blk_read_time" double precision, OUT "blk_write_time" double precision, OUT "temp_blk_read_time" double precision, OUT "temp_blk_write_time" double precision, OUT "wal_records" bigint, OUT "wal_fpi" bigint, OUT "wal_bytes" numeric, OUT "jit_functions" bigint, OUT "jit_generation_time" double precision, OUT "jit_inlining_count" bigint, OUT "jit_inlining_time" double precision, OUT "jit_optimization_count" bigint, OUT "jit_optimization_time" double precision, OUT "jit_emission_count" bigint, OUT "jit_emission_time" double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pg_stat_statements"("showtext" boolean, OUT "userid" "oid", OUT "dbid" "oid", OUT "toplevel" boolean, OUT "queryid" bigint, OUT "query" "text", OUT "plans" bigint, OUT "total_plan_time" double precision, OUT "min_plan_time" double precision, OUT "max_plan_time" double precision, OUT "mean_plan_time" double precision, OUT "stddev_plan_time" double precision, OUT "calls" bigint, OUT "total_exec_time" double precision, OUT "min_exec_time" double precision, OUT "max_exec_time" double precision, OUT "mean_exec_time" double precision, OUT "stddev_exec_time" double precision, OUT "rows" bigint, OUT "shared_blks_hit" bigint, OUT "shared_blks_read" bigint, OUT "shared_blks_dirtied" bigint, OUT "shared_blks_written" bigint, OUT "local_blks_hit" bigint, OUT "local_blks_read" bigint, OUT "local_blks_dirtied" bigint, OUT "local_blks_written" bigint, OUT "temp_blks_read" bigint, OUT "temp_blks_written" bigint, OUT "blk_read_time" double precision, OUT "blk_write_time" double precision, OUT "temp_blk_read_time" double precision, OUT "temp_blk_write_time" double precision, OUT "wal_records" bigint, OUT "wal_fpi" bigint, OUT "wal_bytes" numeric, OUT "jit_functions" bigint, OUT "jit_generation_time" double precision, OUT "jit_inlining_count" bigint, OUT "jit_inlining_time" double precision, OUT "jit_optimization_count" bigint, OUT "jit_optimization_time" double precision, OUT "jit_emission_count" bigint, OUT "jit_emission_time" double precision) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pg_stat_statements"("showtext" boolean, OUT "userid" "oid", OUT "dbid" "oid", OUT "toplevel" boolean, OUT "queryid" bigint, OUT "query" "text", OUT "plans" bigint, OUT "total_plan_time" double precision, OUT "min_plan_time" double precision, OUT "max_plan_time" double precision, OUT "mean_plan_time" double precision, OUT "stddev_plan_time" double precision, OUT "calls" bigint, OUT "total_exec_time" double precision, OUT "min_exec_time" double precision, OUT "max_exec_time" double precision, OUT "mean_exec_time" double precision, OUT "stddev_exec_time" double precision, OUT "rows" bigint, OUT "shared_blks_hit" bigint, OUT "shared_blks_read" bigint, OUT "shared_blks_dirtied" bigint, OUT "shared_blks_written" bigint, OUT "local_blks_hit" bigint, OUT "local_blks_read" bigint, OUT "local_blks_dirtied" bigint, OUT "local_blks_written" bigint, OUT "temp_blks_read" bigint, OUT "temp_blks_written" bigint, OUT "blk_read_time" double precision, OUT "blk_write_time" double precision, OUT "temp_blk_read_time" double precision, OUT "temp_blk_write_time" double precision, OUT "wal_records" bigint, OUT "wal_fpi" bigint, OUT "wal_bytes" numeric, OUT "jit_functions" bigint, OUT "jit_generation_time" double precision, OUT "jit_inlining_count" bigint, OUT "jit_inlining_time" double precision, OUT "jit_optimization_count" bigint, OUT "jit_optimization_time" double precision, OUT "jit_emission_count" bigint, OUT "jit_emission_time" double precision) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pg_stat_statements_info"(OUT "dealloc" bigint, OUT "stats_reset" timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pg_stat_statements_info"(OUT "dealloc" bigint, OUT "stats_reset" timestamp with time zone) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pg_stat_statements_info"(OUT "dealloc" bigint, OUT "stats_reset" timestamp with time zone) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pg_stat_statements_reset"("userid" "oid", "dbid" "oid", "queryid" bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pg_stat_statements_reset"("userid" "oid", "dbid" "oid", "queryid" bigint) TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pg_stat_statements_reset"("userid" "oid", "dbid" "oid", "queryid" bigint) TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_key_id"("bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_key_id"("bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_key_id"("bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt"("bytea", "bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt"("bytea", "bytea", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt_bytea"("bytea", "bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt_bytea"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_encrypt"("text", "bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt"("text", "bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt"("text", "bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_encrypt"("text", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt"("text", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt"("text", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_encrypt_bytea"("bytea", "bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_pub_encrypt_bytea"("bytea", "bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_decrypt"("bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt"("bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt"("bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_decrypt"("bytea", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt"("bytea", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt"("bytea", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_decrypt_bytea"("bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt_bytea"("bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt_bytea"("bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_decrypt_bytea"("bytea", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_encrypt"("text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt"("text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt"("text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_encrypt"("text", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt"("text", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt"("text", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_encrypt_bytea"("bytea", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt_bytea"("bytea", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt_bytea"("bytea", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgp_sym_encrypt_bytea"("bytea", "text", "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgrst_ddl_watch"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgrst_ddl_watch"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "pgrst_drop_watch"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."pgrst_drop_watch"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "set_graphql_placeholder"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."set_graphql_placeholder"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "sign"("payload" "json", "secret" "text", "algorithm" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."sign"("payload" "json", "secret" "text", "algorithm" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."sign"("payload" "json", "secret" "text", "algorithm" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "try_cast_double"("inp" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."try_cast_double"("inp" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."try_cast_double"("inp" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "url_decode"("data" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."url_decode"("data" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."url_decode"("data" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "url_encode"("data" "bytea"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."url_encode"("data" "bytea") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."url_encode"("data" "bytea") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_generate_v1"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_generate_v1"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_generate_v1"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_generate_v1mc"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_generate_v1mc"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_generate_v1mc"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_generate_v3"("namespace" "uuid", "name" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_generate_v4"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_generate_v4"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_generate_v4"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_generate_v5"("namespace" "uuid", "name" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_nil"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_nil"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_nil"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_ns_dns"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_ns_dns"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_ns_dns"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_ns_oid"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_ns_oid"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_ns_oid"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_ns_url"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_ns_url"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_ns_url"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "uuid_ns_x500"(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."uuid_ns_x500"() TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."uuid_ns_x500"() TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "verify"("token" "text", "secret" "text", "algorithm" "text"); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "extensions"."verify"("token" "text", "secret" "text", "algorithm" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "extensions"."verify"("token" "text", "secret" "text", "algorithm" "text") TO "postgres" WITH GRANT OPTION;


--
-- Name: FUNCTION "comment_directive"("comment_" "text"); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "graphql"."comment_directive"("comment_" "text") TO "postgres";
GRANT ALL ON FUNCTION "graphql"."comment_directive"("comment_" "text") TO "anon";
GRANT ALL ON FUNCTION "graphql"."comment_directive"("comment_" "text") TO "authenticated";
GRANT ALL ON FUNCTION "graphql"."comment_directive"("comment_" "text") TO "service_role";


--
-- Name: FUNCTION "exception"("message" "text"); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "graphql"."exception"("message" "text") TO "postgres";
GRANT ALL ON FUNCTION "graphql"."exception"("message" "text") TO "anon";
GRANT ALL ON FUNCTION "graphql"."exception"("message" "text") TO "authenticated";
GRANT ALL ON FUNCTION "graphql"."exception"("message" "text") TO "service_role";


--
-- Name: FUNCTION "get_schema_version"(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "graphql"."get_schema_version"() TO "postgres";
GRANT ALL ON FUNCTION "graphql"."get_schema_version"() TO "anon";
GRANT ALL ON FUNCTION "graphql"."get_schema_version"() TO "authenticated";
GRANT ALL ON FUNCTION "graphql"."get_schema_version"() TO "service_role";


--
-- Name: FUNCTION "increment_schema_version"(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "graphql"."increment_schema_version"() TO "postgres";
GRANT ALL ON FUNCTION "graphql"."increment_schema_version"() TO "anon";
GRANT ALL ON FUNCTION "graphql"."increment_schema_version"() TO "authenticated";
GRANT ALL ON FUNCTION "graphql"."increment_schema_version"() TO "service_role";


--
-- Name: FUNCTION "graphql"("operationName" "text", "query" "text", "variables" "jsonb", "extensions" "jsonb"); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "graphql_public"."graphql"("operationName" "text", "query" "text", "variables" "jsonb", "extensions" "jsonb") TO "postgres";
GRANT ALL ON FUNCTION "graphql_public"."graphql"("operationName" "text", "query" "text", "variables" "jsonb", "extensions" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "graphql_public"."graphql"("operationName" "text", "query" "text", "variables" "jsonb", "extensions" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "graphql_public"."graphql"("operationName" "text", "query" "text", "variables" "jsonb", "extensions" "jsonb") TO "service_role";


--
-- Name: FUNCTION "get_auth"("p_usename" "text"); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION "pgbouncer"."get_auth"("p_usename" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "pgbouncer"."get_auth"("p_usename" "text") TO "pgbouncer";


--
-- Name: FUNCTION "crypto_aead_det_decrypt"("message" "bytea", "additional" "bytea", "key_uuid" "uuid", "nonce" "bytea"); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION "pgsodium"."crypto_aead_det_decrypt"("message" "bytea", "additional" "bytea", "key_uuid" "uuid", "nonce" "bytea") TO "service_role";


--
-- Name: FUNCTION "crypto_aead_det_encrypt"("message" "bytea", "additional" "bytea", "key_uuid" "uuid", "nonce" "bytea"); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION "pgsodium"."crypto_aead_det_encrypt"("message" "bytea", "additional" "bytea", "key_uuid" "uuid", "nonce" "bytea") TO "service_role";


--
-- Name: FUNCTION "crypto_aead_det_keygen"(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "pgsodium"."crypto_aead_det_keygen"() TO "service_role";


--
-- Name: FUNCTION "fn_employee_id_with_children"("uid" "uuid"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_employee_id_with_children"("uid" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."fn_employee_id_with_children"("uid" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_employee_id_with_children"("uid" "uuid") TO "service_role";


--
-- Name: FUNCTION "fn_get_all_leads_count"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_get_all_leads_count"() TO "postgres";
GRANT ALL ON FUNCTION "public"."fn_get_all_leads_count"() TO "anon";
GRANT ALL ON FUNCTION "public"."fn_get_all_leads_count"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_get_all_leads_count"() TO "service_role";


--
-- Name: FUNCTION "fn_get_all_opportunities_count"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_get_all_opportunities_count"() TO "postgres";
GRANT ALL ON FUNCTION "public"."fn_get_all_opportunities_count"() TO "anon";
GRANT ALL ON FUNCTION "public"."fn_get_all_opportunities_count"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_get_all_opportunities_count"() TO "service_role";


--
-- Name: FUNCTION "fn_get_all_prospects_count"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_get_all_prospects_count"() TO "postgres";
GRANT ALL ON FUNCTION "public"."fn_get_all_prospects_count"() TO "anon";
GRANT ALL ON FUNCTION "public"."fn_get_all_prospects_count"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_get_all_prospects_count"() TO "service_role";


--
-- Name: FUNCTION "fn_get_communications_history"("val_job_id" "uuid"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") TO "service_role";
GRANT ALL ON FUNCTION "public"."fn_get_communications_history"("val_job_id" "uuid") TO "postgres";


--
-- Name: FUNCTION "fn_update_many_projects"("payload" "json"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_update_many_projects"("payload" "json") TO "postgres";
GRANT ALL ON FUNCTION "public"."fn_update_many_projects"("payload" "json") TO "anon";
GRANT ALL ON FUNCTION "public"."fn_update_many_projects"("payload" "json") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_update_many_projects"("payload" "json") TO "service_role";


--
-- Name: FUNCTION "fn_update_multiple_opportunities"("payload" "json"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") TO "postgres";
GRANT ALL ON FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") TO "anon";
GRANT ALL ON FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_update_multiple_opportunities"("payload" "json") TO "service_role";


--
-- Name: FUNCTION "fn_update_opportunity_status_after_insert_document"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() TO "anon";
GRANT ALL ON FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() TO "service_role";
GRANT ALL ON FUNCTION "public"."fn_update_opportunity_status_after_insert_document"() TO "postgres";


--
-- Name: FUNCTION "fn_user_id_with_children"("uid" "uuid"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."fn_user_id_with_children"("uid" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."fn_user_id_with_children"("uid" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_user_id_with_children"("uid" "uuid") TO "service_role";


--
-- Name: FUNCTION "http"("request" "public"."http_request"); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http"("request" "public"."http_request") TO "anon";
GRANT ALL ON FUNCTION "public"."http"("request" "public"."http_request") TO "authenticated";
GRANT ALL ON FUNCTION "public"."http"("request" "public"."http_request") TO "service_role";


--
-- Name: FUNCTION "http_delete"("uri" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_delete"("uri" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_delete"("uri" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_delete"("uri" character varying) TO "service_role";


--
-- Name: FUNCTION "http_get"("uri" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_get"("uri" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_get"("uri" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_get"("uri" character varying) TO "service_role";


--
-- Name: FUNCTION "http_head"("uri" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_head"("uri" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_head"("uri" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_head"("uri" character varying) TO "service_role";


--
-- Name: FUNCTION "http_header"("field" character varying, "value" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_header"("field" character varying, "value" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_header"("field" character varying, "value" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_header"("field" character varying, "value" character varying) TO "service_role";


--
-- Name: FUNCTION "http_patch"("uri" character varying, "content" character varying, "content_type" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_patch"("uri" character varying, "content" character varying, "content_type" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_patch"("uri" character varying, "content" character varying, "content_type" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_patch"("uri" character varying, "content" character varying, "content_type" character varying) TO "service_role";


--
-- Name: FUNCTION "http_post"("uri" character varying, "content" character varying, "content_type" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_post"("uri" character varying, "content" character varying, "content_type" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_post"("uri" character varying, "content" character varying, "content_type" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_post"("uri" character varying, "content" character varying, "content_type" character varying) TO "service_role";


--
-- Name: FUNCTION "http_put"("uri" character varying, "content" character varying, "content_type" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_put"("uri" character varying, "content" character varying, "content_type" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_put"("uri" character varying, "content" character varying, "content_type" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_put"("uri" character varying, "content" character varying, "content_type" character varying) TO "service_role";


--
-- Name: FUNCTION "http_reset_curlopt"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_reset_curlopt"() TO "anon";
GRANT ALL ON FUNCTION "public"."http_reset_curlopt"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_reset_curlopt"() TO "service_role";


--
-- Name: FUNCTION "http_set_curlopt"("curlopt" character varying, "value" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."http_set_curlopt"("curlopt" character varying, "value" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."http_set_curlopt"("curlopt" character varying, "value" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."http_set_curlopt"("curlopt" character varying, "value" character varying) TO "service_role";


--
-- Name: FUNCTION "search_leads"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."search_leads"() TO "anon";
GRANT ALL ON FUNCTION "public"."search_leads"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."search_leads"() TO "service_role";
GRANT ALL ON FUNCTION "public"."search_leads"() TO "postgres";


--
-- Name: FUNCTION "urlencode"("string" character varying); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "public"."urlencode"("string" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."urlencode"("string" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."urlencode"("string" character varying) TO "service_role";


--
-- Name: FUNCTION "apply_rls"("wal" "jsonb", "max_record_bytes" integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer) TO "postgres";
GRANT ALL ON FUNCTION "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer) TO "dashboard_user";


--
-- Name: FUNCTION "build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]) TO "postgres";
GRANT ALL ON FUNCTION "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]) TO "dashboard_user";


--
-- Name: FUNCTION "cast"("val" "text", "type_" "regtype"); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."cast"("val" "text", "type_" "regtype") TO "postgres";
GRANT ALL ON FUNCTION "realtime"."cast"("val" "text", "type_" "regtype") TO "dashboard_user";


--
-- Name: FUNCTION "check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text"); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text") TO "postgres";
GRANT ALL ON FUNCTION "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text") TO "dashboard_user";


--
-- Name: FUNCTION "is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]) TO "postgres";
GRANT ALL ON FUNCTION "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]) TO "dashboard_user";


--
-- Name: FUNCTION "quote_wal2json"("entity" "regclass"); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."quote_wal2json"("entity" "regclass") TO "postgres";
GRANT ALL ON FUNCTION "realtime"."quote_wal2json"("entity" "regclass") TO "dashboard_user";


--
-- Name: FUNCTION "subscription_check_filters"(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."subscription_check_filters"() TO "postgres";
GRANT ALL ON FUNCTION "realtime"."subscription_check_filters"() TO "dashboard_user";


--
-- Name: FUNCTION "to_regrole"("role_name" "text"); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION "realtime"."to_regrole"("role_name" "text") TO "postgres";
GRANT ALL ON FUNCTION "realtime"."to_regrole"("role_name" "text") TO "dashboard_user";


--
-- Name: FUNCTION "extension"("name" "text"); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."extension"("name" "text") TO "anon";
GRANT ALL ON FUNCTION "storage"."extension"("name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "storage"."extension"("name" "text") TO "service_role";
GRANT ALL ON FUNCTION "storage"."extension"("name" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "storage"."extension"("name" "text") TO "postgres";


--
-- Name: FUNCTION "filename"("name" "text"); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."filename"("name" "text") TO "anon";
GRANT ALL ON FUNCTION "storage"."filename"("name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "storage"."filename"("name" "text") TO "service_role";
GRANT ALL ON FUNCTION "storage"."filename"("name" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "storage"."filename"("name" "text") TO "postgres";


--
-- Name: FUNCTION "foldername"("name" "text"); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."foldername"("name" "text") TO "anon";
GRANT ALL ON FUNCTION "storage"."foldername"("name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "storage"."foldername"("name" "text") TO "service_role";
GRANT ALL ON FUNCTION "storage"."foldername"("name" "text") TO "dashboard_user";
GRANT ALL ON FUNCTION "storage"."foldername"("name" "text") TO "postgres";


--
-- Name: FUNCTION "get_size_by_bucket"(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."get_size_by_bucket"() TO "postgres";


--
-- Name: FUNCTION "search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text"); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text") TO "postgres";


--
-- Name: FUNCTION "update_updated_at_column"(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION "storage"."update_updated_at_column"() TO "postgres";


--
-- Name: TABLE "audit_log_entries"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."audit_log_entries" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."audit_log_entries" TO "postgres";


--
-- Name: TABLE "flow_state"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."flow_state" TO "postgres";
GRANT ALL ON TABLE "auth"."flow_state" TO "dashboard_user";


--
-- Name: TABLE "identities"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."identities" TO "postgres";
GRANT ALL ON TABLE "auth"."identities" TO "dashboard_user";


--
-- Name: TABLE "instances"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."instances" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."instances" TO "postgres";


--
-- Name: TABLE "mfa_amr_claims"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."mfa_amr_claims" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_amr_claims" TO "dashboard_user";


--
-- Name: TABLE "mfa_challenges"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."mfa_challenges" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_challenges" TO "dashboard_user";


--
-- Name: TABLE "mfa_factors"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."mfa_factors" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_factors" TO "dashboard_user";


--
-- Name: TABLE "refresh_tokens"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."refresh_tokens" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."refresh_tokens" TO "postgres";


--
-- Name: SEQUENCE "refresh_tokens_id_seq"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE "auth"."refresh_tokens_id_seq" TO "dashboard_user";
GRANT ALL ON SEQUENCE "auth"."refresh_tokens_id_seq" TO "postgres";


--
-- Name: TABLE "saml_providers"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."saml_providers" TO "postgres";
GRANT ALL ON TABLE "auth"."saml_providers" TO "dashboard_user";


--
-- Name: TABLE "saml_relay_states"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."saml_relay_states" TO "postgres";
GRANT ALL ON TABLE "auth"."saml_relay_states" TO "dashboard_user";


--
-- Name: TABLE "schema_migrations"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."schema_migrations" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."schema_migrations" TO "postgres";


--
-- Name: TABLE "sessions"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."sessions" TO "postgres";
GRANT ALL ON TABLE "auth"."sessions" TO "dashboard_user";


--
-- Name: TABLE "sso_domains"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."sso_domains" TO "postgres";
GRANT ALL ON TABLE "auth"."sso_domains" TO "dashboard_user";


--
-- Name: TABLE "sso_providers"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."sso_providers" TO "postgres";
GRANT ALL ON TABLE "auth"."sso_providers" TO "dashboard_user";


--
-- Name: TABLE "users"; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE "auth"."users" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."users" TO "postgres";


--
-- Name: TABLE "pg_stat_statements"; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE "extensions"."pg_stat_statements" TO "dashboard_user";
GRANT ALL ON TABLE "extensions"."pg_stat_statements" TO "postgres" WITH GRANT OPTION;


--
-- Name: TABLE "pg_stat_statements_info"; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE "extensions"."pg_stat_statements_info" TO "dashboard_user";
GRANT ALL ON TABLE "extensions"."pg_stat_statements_info" TO "postgres" WITH GRANT OPTION;


--
-- Name: SEQUENCE "seq_schema_version"; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE "graphql"."seq_schema_version" TO "postgres";
GRANT ALL ON SEQUENCE "graphql"."seq_schema_version" TO "anon";
GRANT ALL ON SEQUENCE "graphql"."seq_schema_version" TO "authenticated";
GRANT ALL ON SEQUENCE "graphql"."seq_schema_version" TO "service_role";


--
-- Name: TABLE "decrypted_key"; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE "pgsodium"."decrypted_key" TO "pgsodium_keyholder";


--
-- Name: TABLE "masking_rule"; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE "pgsodium"."masking_rule" TO "pgsodium_keyholder";


--
-- Name: TABLE "mask_columns"; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE "pgsodium"."mask_columns" TO "pgsodium_keyholder";


--
-- Name: TABLE "employees"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."employees" TO "anon";
GRANT ALL ON TABLE "public"."employees" TO "authenticated";
GRANT ALL ON TABLE "public"."employees" TO "service_role";
GRANT ALL ON TABLE "public"."employees" TO "postgres";


--
-- Name: TABLE "leads"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."leads" TO "anon";
GRANT ALL ON TABLE "public"."leads" TO "authenticated";
GRANT ALL ON TABLE "public"."leads" TO "service_role";
GRANT ALL ON TABLE "public"."leads" TO "postgres";


--
-- Name: TABLE "prospects"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."prospects" TO "anon";
GRANT ALL ON TABLE "public"."prospects" TO "authenticated";
GRANT ALL ON TABLE "public"."prospects" TO "service_role";
GRANT ALL ON TABLE "public"."prospects" TO "postgres";


--
-- Name: TABLE "all_leads"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."all_leads" TO "postgres";
GRANT ALL ON TABLE "public"."all_leads" TO "anon";
GRANT ALL ON TABLE "public"."all_leads" TO "service_role";


--
-- Name: TABLE "communications"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."communications" TO "anon";
GRANT ALL ON TABLE "public"."communications" TO "authenticated";
GRANT ALL ON TABLE "public"."communications" TO "service_role";
GRANT ALL ON TABLE "public"."communications" TO "postgres";


--
-- Name: TABLE "remodellings"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."remodellings" TO "anon";
GRANT ALL ON TABLE "public"."remodellings" TO "authenticated";
GRANT ALL ON TABLE "public"."remodellings" TO "service_role";
GRANT ALL ON TABLE "public"."remodellings" TO "postgres";


--
-- Name: TABLE "all_prospects"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."all_prospects" TO "postgres";
GRANT ALL ON TABLE "public"."all_prospects" TO "anon";
GRANT ALL ON TABLE "public"."all_prospects" TO "service_role";


--
-- Name: TABLE "all_public_prospects"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."all_public_prospects" TO "anon";
GRANT ALL ON TABLE "public"."all_public_prospects" TO "authenticated";
GRANT ALL ON TABLE "public"."all_public_prospects" TO "service_role";
GRANT ALL ON TABLE "public"."all_public_prospects" TO "postgres";


--
-- Name: TABLE "lookup_values"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."lookup_values" TO "anon";
GRANT ALL ON TABLE "public"."lookup_values" TO "authenticated";
GRANT ALL ON TABLE "public"."lookup_values" TO "service_role";
GRANT ALL ON TABLE "public"."lookup_values" TO "postgres";


--
-- Name: TABLE "sku_includes"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sku_includes" TO "anon";
GRANT ALL ON TABLE "public"."sku_includes" TO "authenticated";
GRANT ALL ON TABLE "public"."sku_includes" TO "service_role";
GRANT ALL ON TABLE "public"."sku_includes" TO "postgres";


--
-- Name: TABLE "sku_sku_includes"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sku_sku_includes" TO "anon";
GRANT ALL ON TABLE "public"."sku_sku_includes" TO "authenticated";
GRANT ALL ON TABLE "public"."sku_sku_includes" TO "service_role";
GRANT ALL ON TABLE "public"."sku_sku_includes" TO "postgres";


--
-- Name: TABLE "all_sku_sku_includes_view"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."all_sku_sku_includes_view" TO "anon";
GRANT ALL ON TABLE "public"."all_sku_sku_includes_view" TO "service_role";
GRANT ALL ON TABLE "public"."all_sku_sku_includes_view" TO "postgres";


--
-- Name: TABLE "lookup_child_values"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."lookup_child_values" TO "anon";
GRANT ALL ON TABLE "public"."lookup_child_values" TO "authenticated";
GRANT ALL ON TABLE "public"."lookup_child_values" TO "service_role";
GRANT ALL ON TABLE "public"."lookup_child_values" TO "postgres";


--
-- Name: TABLE "skus"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."skus" TO "anon";
GRANT ALL ON TABLE "public"."skus" TO "authenticated";
GRANT ALL ON TABLE "public"."skus" TO "service_role";
GRANT ALL ON TABLE "public"."skus" TO "postgres";


--
-- Name: TABLE "all_skus"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."all_skus" TO "anon";
GRANT ALL ON TABLE "public"."all_skus" TO "service_role";
GRANT ALL ON TABLE "public"."all_skus" TO "postgres";


--
-- Name: TABLE "all_skus_children"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."all_skus_children" TO "anon";
GRANT ALL ON TABLE "public"."all_skus_children" TO "authenticated";
GRANT ALL ON TABLE "public"."all_skus_children" TO "service_role";
GRANT ALL ON TABLE "public"."all_skus_children" TO "postgres";


--
-- Name: TABLE "roles"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."roles" TO "anon";
GRANT ALL ON TABLE "public"."roles" TO "authenticated";
GRANT ALL ON TABLE "public"."roles" TO "service_role";
GRANT ALL ON TABLE "public"."roles" TO "postgres";


--
-- Name: TABLE "user_roles"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."user_roles" TO "anon";
GRANT ALL ON TABLE "public"."user_roles" TO "authenticated";
GRANT ALL ON TABLE "public"."user_roles" TO "service_role";
GRANT ALL ON TABLE "public"."user_roles" TO "postgres";


--
-- Name: TABLE "all_team_leaders"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."all_team_leaders" TO "anon";
GRANT ALL ON TABLE "public"."all_team_leaders" TO "service_role";
GRANT ALL ON TABLE "public"."all_team_leaders" TO "postgres";


--
-- Name: TABLE "announcements"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."announcements" TO "anon";
GRANT ALL ON TABLE "public"."announcements" TO "authenticated";
GRANT ALL ON TABLE "public"."announcements" TO "service_role";
GRANT ALL ON TABLE "public"."announcements" TO "postgres";


--
-- Name: TABLE "appointment_participants"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."appointment_participants" TO "anon";
GRANT ALL ON TABLE "public"."appointment_participants" TO "authenticated";
GRANT ALL ON TABLE "public"."appointment_participants" TO "service_role";
GRANT ALL ON TABLE "public"."appointment_participants" TO "postgres";


--
-- Name: TABLE "appointments"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."appointments" TO "anon";
GRANT ALL ON TABLE "public"."appointments" TO "authenticated";
GRANT ALL ON TABLE "public"."appointments" TO "service_role";
GRANT ALL ON TABLE "public"."appointments" TO "postgres";


--
-- Name: TABLE "client_appointment_participants"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."client_appointment_participants" TO "anon";
GRANT ALL ON TABLE "public"."client_appointment_participants" TO "authenticated";
GRANT ALL ON TABLE "public"."client_appointment_participants" TO "service_role";


--
-- Name: TABLE "client_floor_plans"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."client_floor_plans" TO "anon";
GRANT ALL ON TABLE "public"."client_floor_plans" TO "authenticated";
GRANT ALL ON TABLE "public"."client_floor_plans" TO "service_role";


--
-- Name: TABLE "client_follow_ups"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."client_follow_ups" TO "anon";
GRANT ALL ON TABLE "public"."client_follow_ups" TO "authenticated";
GRANT ALL ON TABLE "public"."client_follow_ups" TO "service_role";


--
-- Name: TABLE "client_profiles"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."client_profiles" TO "anon";
GRANT ALL ON TABLE "public"."client_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."client_profiles" TO "service_role";
GRANT ALL ON TABLE "public"."client_profiles" TO "postgres";


--
-- Name: TABLE "client_requirement_attachments"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."client_requirement_attachments" TO "anon";
GRANT ALL ON TABLE "public"."client_requirement_attachments" TO "authenticated";
GRANT ALL ON TABLE "public"."client_requirement_attachments" TO "service_role";


--
-- Name: TABLE "client_requirements"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."client_requirements" TO "anon";
GRANT ALL ON TABLE "public"."client_requirements" TO "authenticated";
GRANT ALL ON TABLE "public"."client_requirements" TO "service_role";


--
-- Name: TABLE "databasechangelog"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."databasechangelog" TO "anon";
GRANT ALL ON TABLE "public"."databasechangelog" TO "authenticated";
GRANT ALL ON TABLE "public"."databasechangelog" TO "service_role";


--
-- Name: TABLE "databasechangeloglock"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."databasechangeloglock" TO "anon";
GRANT ALL ON TABLE "public"."databasechangeloglock" TO "authenticated";
GRANT ALL ON TABLE "public"."databasechangeloglock" TO "service_role";


--
-- Name: TABLE "design_profile_concepts"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."design_profile_concepts" TO "anon";
GRANT ALL ON TABLE "public"."design_profile_concepts" TO "authenticated";
GRANT ALL ON TABLE "public"."design_profile_concepts" TO "service_role";
GRANT ALL ON TABLE "public"."design_profile_concepts" TO "postgres";


--
-- Name: TABLE "design_profiles"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."design_profiles" TO "anon";
GRANT ALL ON TABLE "public"."design_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."design_profiles" TO "service_role";
GRANT ALL ON TABLE "public"."design_profiles" TO "postgres";


--
-- Name: TABLE "documents"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."documents" TO "anon";
GRANT ALL ON TABLE "public"."documents" TO "authenticated";
GRANT ALL ON TABLE "public"."documents" TO "service_role";
GRANT ALL ON TABLE "public"."documents" TO "postgres";


--
-- Name: TABLE "job_areas"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."job_areas" TO "anon";
GRANT ALL ON TABLE "public"."job_areas" TO "authenticated";
GRANT ALL ON TABLE "public"."job_areas" TO "service_role";
GRANT ALL ON TABLE "public"."job_areas" TO "postgres";


--
-- Name: TABLE "job_histories"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."job_histories" TO "anon";
GRANT ALL ON TABLE "public"."job_histories" TO "authenticated";
GRANT ALL ON TABLE "public"."job_histories" TO "service_role";
GRANT ALL ON TABLE "public"."job_histories" TO "postgres";


--
-- Name: TABLE "job_profiles"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."job_profiles" TO "anon";
GRANT ALL ON TABLE "public"."job_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."job_profiles" TO "service_role";
GRANT ALL ON TABLE "public"."job_profiles" TO "postgres";


--
-- Name: TABLE "job_work_metas"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."job_work_metas" TO "anon";
GRANT ALL ON TABLE "public"."job_work_metas" TO "authenticated";
GRANT ALL ON TABLE "public"."job_work_metas" TO "service_role";
GRANT ALL ON TABLE "public"."job_work_metas" TO "postgres";


--
-- Name: TABLE "job_works"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."job_works" TO "anon";
GRANT ALL ON TABLE "public"."job_works" TO "authenticated";
GRANT ALL ON TABLE "public"."job_works" TO "service_role";
GRANT ALL ON TABLE "public"."job_works" TO "postgres";


--
-- Name: TABLE "lookup_documents"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."lookup_documents" TO "anon";
GRANT ALL ON TABLE "public"."lookup_documents" TO "authenticated";
GRANT ALL ON TABLE "public"."lookup_documents" TO "service_role";
GRANT ALL ON TABLE "public"."lookup_documents" TO "postgres";


--
-- Name: TABLE "migrations"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."migrations" TO "anon";
GRANT ALL ON TABLE "public"."migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."migrations" TO "service_role";


--
-- Name: SEQUENCE "migrations_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "service_role";


--
-- Name: TABLE "opportunities"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."opportunities" TO "anon";
GRANT ALL ON TABLE "public"."opportunities" TO "authenticated";
GRANT ALL ON TABLE "public"."opportunities" TO "service_role";
GRANT ALL ON TABLE "public"."opportunities" TO "postgres";


--
-- Name: TABLE "opportunity_checklists"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."opportunity_checklists" TO "anon";
GRANT ALL ON TABLE "public"."opportunity_checklists" TO "authenticated";
GRANT ALL ON TABLE "public"."opportunity_checklists" TO "service_role";
GRANT ALL ON TABLE "public"."opportunity_checklists" TO "postgres";


--
-- Name: TABLE "personal_access_tokens"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."personal_access_tokens" TO "anon";
GRANT ALL ON TABLE "public"."personal_access_tokens" TO "authenticated";
GRANT ALL ON TABLE "public"."personal_access_tokens" TO "service_role";


--
-- Name: SEQUENCE "personal_access_tokens_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE "public"."personal_access_tokens_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."personal_access_tokens_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."personal_access_tokens_id_seq" TO "service_role";


--
-- Name: TABLE "quotation_items"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."quotation_items" TO "anon";
GRANT ALL ON TABLE "public"."quotation_items" TO "authenticated";
GRANT ALL ON TABLE "public"."quotation_items" TO "service_role";
GRANT ALL ON TABLE "public"."quotation_items" TO "postgres";


--
-- Name: TABLE "quotations"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."quotations" TO "anon";
GRANT ALL ON TABLE "public"."quotations" TO "authenticated";
GRANT ALL ON TABLE "public"."quotations" TO "service_role";
GRANT ALL ON TABLE "public"."quotations" TO "postgres";


--
-- Name: TABLE "sale_commissions"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sale_commissions" TO "anon";
GRANT ALL ON TABLE "public"."sale_commissions" TO "authenticated";
GRANT ALL ON TABLE "public"."sale_commissions" TO "service_role";
GRANT ALL ON TABLE "public"."sale_commissions" TO "postgres";


--
-- Name: TABLE "sale_expenses"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sale_expenses" TO "anon";
GRANT ALL ON TABLE "public"."sale_expenses" TO "authenticated";
GRANT ALL ON TABLE "public"."sale_expenses" TO "service_role";
GRANT ALL ON TABLE "public"."sale_expenses" TO "postgres";


--
-- Name: TABLE "sale_invoice_payments"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sale_invoice_payments" TO "anon";
GRANT ALL ON TABLE "public"."sale_invoice_payments" TO "authenticated";
GRANT ALL ON TABLE "public"."sale_invoice_payments" TO "service_role";
GRANT ALL ON TABLE "public"."sale_invoice_payments" TO "postgres";


--
-- Name: TABLE "sale_orders"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sale_orders" TO "anon";
GRANT ALL ON TABLE "public"."sale_orders" TO "authenticated";
GRANT ALL ON TABLE "public"."sale_orders" TO "service_role";
GRANT ALL ON TABLE "public"."sale_orders" TO "postgres";


--
-- Name: TABLE "sale_participants"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sale_participants" TO "anon";
GRANT ALL ON TABLE "public"."sale_participants" TO "authenticated";
GRANT ALL ON TABLE "public"."sale_participants" TO "service_role";
GRANT ALL ON TABLE "public"."sale_participants" TO "postgres";


--
-- Name: TABLE "sales"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sales" TO "anon";
GRANT ALL ON TABLE "public"."sales" TO "authenticated";
GRANT ALL ON TABLE "public"."sales" TO "service_role";
GRANT ALL ON TABLE "public"."sales" TO "postgres";


--
-- Name: TABLE "sales_report_cleaned"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."sales_report_cleaned" TO "postgres";
GRANT ALL ON TABLE "public"."sales_report_cleaned" TO "anon";
GRANT ALL ON TABLE "public"."sales_report_cleaned" TO "authenticated";
GRANT ALL ON TABLE "public"."sales_report_cleaned" TO "service_role";


--
-- Name: TABLE "supplier_skus"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."supplier_skus" TO "anon";
GRANT ALL ON TABLE "public"."supplier_skus" TO "authenticated";
GRANT ALL ON TABLE "public"."supplier_skus" TO "service_role";
GRANT ALL ON TABLE "public"."supplier_skus" TO "postgres";


--
-- Name: TABLE "suppliers"; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE "public"."suppliers" TO "anon";
GRANT ALL ON TABLE "public"."suppliers" TO "authenticated";
GRANT ALL ON TABLE "public"."suppliers" TO "service_role";
GRANT ALL ON TABLE "public"."suppliers" TO "postgres";


--
-- Name: TABLE "temp_client_appointments"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_client_appointments" TO "anon";
GRANT ALL ON TABLE "public"."temp_client_appointments" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_client_appointments" TO "service_role";


--
-- Name: TABLE "temp_client_calls"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_client_calls" TO "anon";
GRANT ALL ON TABLE "public"."temp_client_calls" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_client_calls" TO "service_role";


--
-- Name: TABLE "temp_client_taggings"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_client_taggings" TO "anon";
GRANT ALL ON TABLE "public"."temp_client_taggings" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_client_taggings" TO "service_role";


--
-- Name: TABLE "temp_clients"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_clients" TO "anon";
GRANT ALL ON TABLE "public"."temp_clients" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_clients" TO "service_role";


--
-- Name: TABLE "temp_lookup_values"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_lookup_values" TO "anon";
GRANT ALL ON TABLE "public"."temp_lookup_values" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_lookup_values" TO "service_role";


--
-- Name: TABLE "temp_users"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE "public"."temp_users" TO "anon";
GRANT ALL ON TABLE "public"."temp_users" TO "authenticated";
GRANT ALL ON TABLE "public"."temp_users" TO "service_role";


--
-- Name: TABLE "view_opportunities"; Type: ACL; Schema: public; Owner: authenticated
--

GRANT ALL ON TABLE "public"."view_opportunities" TO "anon";
GRANT ALL ON TABLE "public"."view_opportunities" TO "service_role";
GRANT ALL ON TABLE "public"."view_opportunities" TO "postgres";


--
-- Name: TABLE "schema_migrations"; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE "realtime"."schema_migrations" TO "postgres";
GRANT ALL ON TABLE "realtime"."schema_migrations" TO "dashboard_user";


--
-- Name: TABLE "subscription"; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE "realtime"."subscription" TO "postgres";
GRANT ALL ON TABLE "realtime"."subscription" TO "dashboard_user";


--
-- Name: SEQUENCE "subscription_id_seq"; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE "realtime"."subscription_id_seq" TO "postgres";
GRANT ALL ON SEQUENCE "realtime"."subscription_id_seq" TO "dashboard_user";


--
-- Name: TABLE "buckets"; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE "storage"."buckets" TO "anon";
GRANT ALL ON TABLE "storage"."buckets" TO "authenticated";
GRANT ALL ON TABLE "storage"."buckets" TO "service_role";
GRANT ALL ON TABLE "storage"."buckets" TO "postgres";


--
-- Name: TABLE "migrations"; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE "storage"."migrations" TO "anon";
GRANT ALL ON TABLE "storage"."migrations" TO "authenticated";
GRANT ALL ON TABLE "storage"."migrations" TO "service_role";
GRANT ALL ON TABLE "storage"."migrations" TO "postgres";


--
-- Name: TABLE "objects"; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE "storage"."objects" TO "anon";
GRANT ALL ON TABLE "storage"."objects" TO "authenticated";
GRANT ALL ON TABLE "storage"."objects" TO "service_role";
GRANT ALL ON TABLE "storage"."objects" TO "postgres";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON SEQUENCES  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON FUNCTIONS  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON TABLES  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "extensions" GRANT ALL ON SEQUENCES  TO "postgres" WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "extensions" GRANT ALL ON FUNCTIONS  TO "postgres" WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "extensions" GRANT ALL ON TABLES  TO "postgres" WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON SEQUENCES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON FUNCTIONS  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql" GRANT ALL ON TABLES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON SEQUENCES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON FUNCTIONS  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "graphql_public" GRANT ALL ON TABLES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "pgsodium" GRANT ALL ON SEQUENCES  TO "pgsodium_keyholder";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "pgsodium" GRANT ALL ON TABLES  TO "pgsodium_keyholder";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "pgsodium_masks" GRANT ALL ON SEQUENCES  TO "pgsodium_keyiduser";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "pgsodium_masks" GRANT ALL ON FUNCTIONS  TO "pgsodium_keyiduser";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "pgsodium_masks" GRANT ALL ON TABLES  TO "pgsodium_keyiduser";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON SEQUENCES  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON FUNCTIONS  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_admin" IN SCHEMA "realtime" GRANT ALL ON TABLES  TO "dashboard_user";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "service_role";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "service_role";


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER "issue_graphql_placeholder" ON "sql_drop"
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION "extensions"."set_graphql_placeholder"();


ALTER EVENT TRIGGER "issue_graphql_placeholder" OWNER TO "supabase_admin";

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER "issue_pg_cron_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE SCHEMA')
   EXECUTE FUNCTION "extensions"."grant_pg_cron_access"();


ALTER EVENT TRIGGER "issue_pg_cron_access" OWNER TO "postgres";

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER "issue_pg_graphql_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION "extensions"."grant_pg_graphql_access"();


ALTER EVENT TRIGGER "issue_pg_graphql_access" OWNER TO "supabase_admin";

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER "issue_pg_net_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION "extensions"."grant_pg_net_access"();


ALTER EVENT TRIGGER "issue_pg_net_access" OWNER TO "postgres";

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER "pgrst_ddl_watch" ON "ddl_command_end"
   EXECUTE FUNCTION "extensions"."pgrst_ddl_watch"();


ALTER EVENT TRIGGER "pgrst_ddl_watch" OWNER TO "supabase_admin";

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER "pgrst_drop_watch" ON "sql_drop"
   EXECUTE FUNCTION "extensions"."pgrst_drop_watch"();


ALTER EVENT TRIGGER "pgrst_drop_watch" OWNER TO "supabase_admin";

--
-- PostgreSQL database dump complete
--


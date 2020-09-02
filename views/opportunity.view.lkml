view: opportunity {
  derived_table: {
    sql: SELECT * FROM `my-oauth-project-275301.salesforce.opportunity`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: alcohol_budget_c {
    type: number
    sql: ${TABLE}.alcohol_budget_c ;;
  }

  dimension: alcohol_increase_c {
    type: number
    sql: ${TABLE}.alcohol_increase_c ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: approval_status_c {
    type: string
    sql: ${TABLE}.approval_status_c ;;
  }

  dimension: arr_cafe_management_c {
    type: number
    sql: ${TABLE}.arr_cafe_management_c ;;
  }

  dimension: arr_catering_c {
    type: number
    sql: ${TABLE}.arr_catering_c ;;
  }

  dimension: arr_catering_increase_c {
    type: number
    sql: ${TABLE}.arr_catering_increase_c ;;
  }

  dimension: arr_micro_market_c {
    type: number
    sql: ${TABLE}.arr_micro_market_c ;;
  }

  dimension: arr_wellness_program_c {
    type: number
    sql: ${TABLE}.arr_wellness_program_c ;;
  }

  dimension: auto_renew_c {
    type: string
    sql: ${TABLE}.auto_renew_c ;;
  }

  dimension_group: blue_sheet_updated_c {
    type: time
    sql: ${TABLE}.blue_sheet_updated_c ;;
  }

  dimension: box_c {
    type: string
    sql: ${TABLE}.box_c ;;
  }

  dimension: breakfast_c {
    type: number
    sql: ${TABLE}.breakfast_c ;;
  }

  dimension: breakfast_days_wk_c {
    type: number
    sql: ${TABLE}.breakfast_days_wk_c ;;
  }

  dimension: breakfast_headcount_c {
    type: number
    sql: ${TABLE}.breakfast_headcount_c ;;
  }

  dimension: budget_c {
    type: number
    sql: ${TABLE}.budget_c ;;
  }

  dimension: budget_confirmed_c {
    type: string
    sql: ${TABLE}.budget_confirmed_c ;;
  }

  dimension: building_access_for_has_c {
    type: string
    sql: ${TABLE}.building_access_for_has_c ;;
  }

  dimension: business_score_scout_c {
    type: number
    sql: ${TABLE}.business_score_scout_c ;;
  }

  dimension: byte_estimated_food_spend_per_month_c {
    type: number
    sql: ${TABLE}.byte_estimated_food_spend_per_month_c ;;
  }

  dimension: byte_po_number_c {
    type: string
    sql: ${TABLE}.byte_po_number_c ;;
  }

  dimension: byte_setup_fee_c {
    type: number
    sql: ${TABLE}.byte_setup_fee_c ;;
  }

  dimension: byte_subscription_fee_c {
    type: number
    sql: ${TABLE}.byte_subscription_fee_c ;;
  }

  dimension: byte_subsidy_c {
    type: number
    sql: ${TABLE}.byte_subsidy_c ;;
  }

  dimension: cafe_management_details_c {
    type: string
    sql: ${TABLE}.cafe_management_details_c ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_mapped_from_lead_c {
    type: string
    sql: ${TABLE}.campaign_mapped_from_lead_c ;;
  }

  dimension: catering_details_supporting_docs_c {
    type: string
    sql: ${TABLE}.catering_details_supporting_docs_c ;;
  }

  dimension: city_operations_manager_c {
    type: string
    sql: ${TABLE}.city_operations_manager_c ;;
  }

  dimension: client_industry_c {
    type: string
    sql: ${TABLE}.client_industry_c ;;
  }

  dimension: close_date {
    type: date
    sql: ${TABLE}.close_date ;;
  }

  dimension: contract_id {
    type: string
    sql: ${TABLE}.contract_id ;;
  }

  dimension: contract_length_c {
    type: number
    sql: ${TABLE}.contract_length_c ;;
  }

  dimension: contract_link_c {
    type: string
    sql: ${TABLE}.contract_link_c ;;
  }

  dimension: contract_version_c {
    type: string
    sql: ${TABLE}.contract_version_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: current_catering_vendor_c {
    type: string
    sql: ${TABLE}.current_catering_vendor_c ;;
  }

  dimension: current_pain_points_c {
    type: string
    sql: ${TABLE}.current_pain_points_c ;;
  }

  dimension: current_snack_vendor_primary_c {
    type: string
    sql: ${TABLE}.current_snack_vendor_primary_c ;;
  }

  dimension: current_snack_vendor_secondary_c {
    type: string
    sql: ${TABLE}.current_snack_vendor_secondary_c ;;
  }

  dimension: date_15_hit_c {
    type: date
    sql: ${TABLE}.date_15_hit_c ;;
  }

  dimension: date_20_hit_c {
    type: date
    sql: ${TABLE}.date_20_hit_c ;;
  }

  dimension: date_30_hit_c {
    type: date
    sql: ${TABLE}.date_30_hit_c ;;
  }

  dimension: date_56_hit_c {
    type: date
    sql: ${TABLE}.date_56_hit_c ;;
  }

  dimension: delivers_per_week_c {
    type: number
    sql: ${TABLE}.delivers_per_week_c ;;
  }

  dimension: delivery_days_c {
    type: string
    sql: ${TABLE}.delivery_days_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_of_backstock_space_c {
    type: string
    sql: ${TABLE}.description_of_backstock_space_c ;;
  }

  dimension: dinner_days_wk_c {
    type: number
    sql: ${TABLE}.dinner_days_wk_c ;;
  }

  dimension: dinner_headcount_c {
    type: number
    sql: ${TABLE}.dinner_headcount_c ;;
  }

  dimension: dinner_person_c {
    type: number
    sql: ${TABLE}.dinner_person_c ;;
  }

  dimension: discovery_completed_c {
    type: string
    sql: ${TABLE}.discovery_completed_c ;;
  }

  dimension: disqualification_reason_c {
    type: string
    sql: ${TABLE}.disqualification_reason_c ;;
  }

  dimension: distance_between_farthest_buildings_mi_c {
    type: number
    sql: ${TABLE}.distance_between_farthest_buildings_mi_c ;;
  }

  dimension: do_they_meet_mk_requirements_c {
    type: string
    sql: ${TABLE}.do_they_meet_mk_requirements_c ;;
  }

  dimension: driver_hrs_delivery_c {
    type: number
    sql: ${TABLE}.driver_hrs_delivery_c ;;
  }

  dimension: effective_date_c {
    type: date
    sql: ${TABLE}.effective_date_c ;;
  }

  dimension: equipment_allocation_c {
    type: number
    sql: ${TABLE}.equipment_allocation_c ;;
  }

  dimension: equipment_details_c {
    type: string
    sql: ${TABLE}.equipment_details_c ;;
  }

  dimension: equipment_installation_date_c {
    type: date
    sql: ${TABLE}.equipment_installation_date_c ;;
  }

  dimension: equipment_maintenance_repair_month_c {
    type: number
    sql: ${TABLE}.equipment_maintenance_repair_month_c ;;
  }

  dimension: equipment_payoff_period_months_c {
    type: number
    sql: ${TABLE}.equipment_payoff_period_months_c ;;
  }

  dimension: equipment_situation_c {
    type: string
    sql: ${TABLE}.equipment_situation_c ;;
  }

  dimension: event_details_and_supporting_docs_c {
    type: string
    sql: ${TABLE}.event_details_and_supporting_docs_c ;;
  }

  dimension: event_revenue_c {
    type: number
    sql: ${TABLE}.event_revenue_c ;;
  }

  dimension: expected_customer_flow_c {
    type: number
    sql: ${TABLE}.expected_customer_flow_c ;;
  }

  dimension: first_approach_date_c {
    type: date
    sql: ${TABLE}.first_approach_date_c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_quarter0 {
    type: string
    sql: 'Q' ;;
  }

  dimension: fiscal_quarter1 {
    type: string
    sql:  CONCAT(${fiscal_quarter0},${fiscal_quarter});;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: food_bev_budget_c {
    type: number
    sql: ${TABLE}.food_bev_budget_c ;;
  }

  dimension: food_bev_increase_c {
    type: number
    sql: ${TABLE}.food_bev_increase_c ;;
  }

  dimension: food_dev_details_supporting_docs_c {
    type: string
    sql: ${TABLE}.food_dev_details_supporting_docs_c ;;
  }

  dimension: food_discount_c {
    type: number
    sql: ${TABLE}.food_discount_c ;;
  }

  dimension: food_margin_dynamic_c {
    type: number
    sql: ${TABLE}.food_margin_dynamic_c ;;
  }

  dimension: food_wellness_goals_c {
    type: string
    sql: ${TABLE}.food_wellness_goals_c ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: freight_information_c {
    type: string
    sql: ${TABLE}.freight_information_c ;;
  }

  dimension: has_open_activity {
    type: string
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    type: string
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    type: string
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: headcount_c {
    type: number
    sql: ${TABLE}.headcount_c ;;
  }

  dimension: headcount_increase_c {
    type: number
    sql: ${TABLE}.headcount_increase_c ;;
  }

  dimension: hm_ha_transportation_cost_visit_c {
    type: number
    sql: ${TABLE}.hm_ha_transportation_cost_visit_c ;;
  }

  dimension: hm_hrs_wk_managing_client_c {
    type: number
    sql: ${TABLE}.hm_hrs_wk_managing_client_c ;;
  }

  dimension: hm_visits_wk_c {
    type: number
    sql: ${TABLE}.hm_visits_wk_c ;;
  }

  dimension: how_did_they_hear_about_us_c {
    type: string
    sql: ${TABLE}.how_did_they_hear_about_us_c ;;
  }

  dimension: how_many_days_in_advance_c {
    type: number
    sql: ${TABLE}.how_many_days_in_advance_c ;;
  }

  dimension: if_other_please_specify_c {
    type: string
    sql: ${TABLE}.if_other_please_specify_c ;;
  }

  dimension: if_picked_other_please_specify_c {
    type: string
    sql: ${TABLE}.if_picked_other_please_specify_c ;;
  }

  dimension: industry_linked_inv_2_c {
    type: string
    sql: ${TABLE}.industry_linked_inv_2_c ;;
  }

  dimension: initial_term_end_date_c {
    type: date
    sql: ${TABLE}.initial_term_end_date_c ;;
  }

  dimension: is_closed {
    type: string
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_won {
    type: string
    sql: ${TABLE}.is_won ;;
  }

  dimension: last_activity_date {
    type: date
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: latest_funding_round_amount_c {
    type: number
    sql: ${TABLE}.latest_funding_round_amount_c ;;
  }

  dimension: latest_funding_round_date_c {
    type: date
    sql: ${TABLE}.latest_funding_round_date_c ;;
  }

  dimension: latest_funding_stage_c {
    type: string
    sql: ${TABLE}.latest_funding_stage_c ;;
  }

  dimension: launch_date_tentative_c {
    type: date
    sql: ${TABLE}.launch_date_tentative_c ;;
  }

  dimension: lead_comments_c {
    type: string
    sql: ${TABLE}.lead_comments_c ;;
  }

  dimension: lead_created_date_c {
    type: date
    sql: ${TABLE}.lead_created_date_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: legal_hrs_spent_on_contract_c {
    type: number
    sql: ${TABLE}.legal_hrs_spent_on_contract_c ;;
  }

  dimension: loss_comment_c {
    type: string
    sql: ${TABLE}.loss_comment_c ;;
  }

  dimension: loss_reason_c {
    type: string
    sql: ${TABLE}.loss_reason_c ;;
  }

  dimension: lunch_days_wk_c {
    type: number
    sql: ${TABLE}.lunch_days_wk_c ;;
  }

  dimension: lunch_headcount_c {
    type: number
    sql: ${TABLE}.lunch_headcount_c ;;
  }

  dimension: lunch_person_c {
    type: number
    sql: ${TABLE}.lunch_person_c ;;
  }

  dimension: merchandising_expectations_c {
    type: string
    sql: ${TABLE}.merchandising_expectations_c ;;
  }

  dimension: metro_region_c {
    type: string
    sql: ${TABLE}.metro_region_c ;;
  }

  dimension: micro_market_details_c {
    type: string
    sql: ${TABLE}.micro_market_details_c ;;
  }

  dimension: most_recent_acct_activity_c {
    type: date
    sql: ${TABLE}.most_recent_acct_activity_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: national_global_deal_c {
    type: string
    sql: ${TABLE}.national_global_deal_c ;;
  }

  dimension: new_equipment_given_above_allocation_c {
    type: number
    sql: ${TABLE}.new_equipment_given_above_allocation_c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: next_step_c {
    type: string
    sql: ${TABLE}.next_step_c ;;
  }

  dimension: notes_on_manual_inputs_c {
    type: string
    sql: ${TABLE}.notes_on_manual_inputs_c ;;
  }

  dimension: notice_days_c {
    type: number
    sql: ${TABLE}.notice_days_c ;;
  }

  dimension: notice_to_existing_vendor_c {
    type: string
    sql: ${TABLE}.notice_to_existing_vendor_c ;;
  }

  dimension: number_of_days_in_trial_period_c {
    type: number
    sql: ${TABLE}.number_of_days_in_trial_period_c ;;
  }

  dimension: number_of_fridges_c {
    type: number
    sql: ${TABLE}.number_of_fridges_c ;;
  }

  dimension: of_buildings_c {
    type: number
    sql: ${TABLE}.of_buildings_c ;;
  }

  dimension: of_contract_iterations_c {
    type: number
    sql: ${TABLE}.of_contract_iterations_c ;;
  }

  dimension: of_floors_c {
    type: number
    sql: ${TABLE}.of_floors_c ;;
  }

  dimension: of_kitchens_c {
    type: number
    sql: ${TABLE}.of_kitchens_c ;;
  }

  dimension: of_large_backstock_locations_c {
    type: number
    sql: ${TABLE}.of_large_backstock_locations_c ;;
  }

  dimension: of_small_backstock_locations_c {
    type: number
    sql: ${TABLE}.of_small_backstock_locations_c ;;
  }

  dimension: office_address_latitude_s {
    type: number
    sql: ${TABLE}.office_address_latitude_s ;;
  }

  dimension: office_address_longitude_s {
    type: number
    sql: ${TABLE}.office_address_longitude_s ;;
  }

  dimension: office_manager_email_c {
    type: string
    sql: ${TABLE}.office_manager_email_c ;;
  }

  dimension: office_manager_name_c {
    type: string
    sql: ${TABLE}.office_manager_name_c ;;
  }

  dimension: ok_to_prebill_c {
    type: string
    sql: ${TABLE}.ok_to_prebill_c ;;
  }

  dimension: onboarding_type_c {
    type: string
    sql: ${TABLE}.onboarding_type_c ;;
  }

  dimension: opportunity_creator_2_c {
    type: string
    sql: ${TABLE}.opportunity_creator_2_c ;;
  }

  dimension: opportunity_score_c {
    type: number
    sql: ${TABLE}.opportunity_score_c ;;
  }

  dimension: opportunity_team_support_member_c {
    type: string
    sql: ${TABLE}.opportunity_team_support_member_c ;;
  }

  dimension: other_notes_for_launch_c {
    type: string
    sql: ${TABLE}.other_notes_for_launch_c ;;
  }

  dimension: other_notes_for_ops_c {
    type: string
    sql: ${TABLE}.other_notes_for_ops_c ;;
  }

  dimension: overnight_access_c {
    type: string
    sql: ${TABLE}.overnight_access_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: paper_products_budget_c {
    type: number
    sql: ${TABLE}.paper_products_budget_c ;;
  }

  dimension: paper_products_increase_c {
    type: number
    sql: ${TABLE}.paper_products_increase_c ;;
  }

  dimension: payment_terms_c {
    type: string
    sql: ${TABLE}.payment_terms_c ;;
  }

  dimension: peopleai_last_touch_c {
    type: date
    sql: ${TABLE}.peopleai_last_touch_c ;;
  }

  dimension: peopleai_time_spent_c {
    type: number
    sql: ${TABLE}.peopleai_time_spent_c ;;
  }

  dimension: peopleai_total_time_spent_c {
    type: string
    sql: ${TABLE}.peopleai_total_time_spent_c ;;
  }

  dimension: picking_hrs_order_c {
    type: number
    sql: ${TABLE}.picking_hrs_order_c ;;
  }

  dimension: pictures_info_from_walkthrough_c {
    type: string
    sql: ${TABLE}.pictures_info_from_walkthrough_c ;;
  }

  dimension_group: pitch_date_c {
    type: time
    sql: ${TABLE}.pitch_date_c ;;
  }

  dimension: poc_role_title_c {
    type: string
    sql: ${TABLE}.poc_role_title_c ;;
  }

  dimension: power_lines_available_c {
    type: string
    sql: ${TABLE}.power_lines_available_c ;;
  }

  dimension: preferred_launch_date_c {
    type: date
    sql: ${TABLE}.preferred_launch_date_c ;;
  }

  dimension: preferred_launch_date_option_c {
    type: string
    sql: ${TABLE}.preferred_launch_date_option_c ;;
  }

  dimension: preferred_launch_date_range_c {
    type: string
    sql: ${TABLE}.preferred_launch_date_range_c ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: product_mix_focus_c {
    type: string
    sql: ${TABLE}.product_mix_focus_c ;;
  }

  dimension: proposal_link_c {
    type: string
    sql: ${TABLE}.proposal_link_c ;;
  }

  dimension: push_count_c {
    type: number
    sql: ${TABLE}.push_count_c ;;
  }

  dimension_group: qualification_call_date_c {
    type: time
    sql: ${TABLE}.qualification_call_date_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: renewal_term_c {
    type: number
    sql: ${TABLE}.renewal_term_c ;;
  }

  dimension: requested_service_end_time_c {
    type: string
    sql: ${TABLE}.requested_service_end_time_c ;;
  }

  dimension: requested_service_start_time_c {
    type: string
    sql: ${TABLE}.requested_service_start_time_c ;;
  }

  dimension: revenue_c {
    type: number
    sql: ${TABLE}.revenue_c ;;
  }

  dimension: service_days_c {
    type: string
    sql: ${TABLE}.service_days_c ;;
  }

  dimension: service_fee_c {
    type: number
    sql: ${TABLE}.service_fee_c ;;
  }

  dimension: service_fee_increase_c {
    type: number
    sql: ${TABLE}.service_fee_increase_c ;;
  }

  dimension: service_level_c {
    type: string
    sql: ${TABLE}.service_level_c ;;
  }

  dimension: sfiq_status_c {
    type: string
    sql: ${TABLE}.sfiq_status_c ;;
  }

  dimension: should_they_convert_to_box_c {
    type: string
    sql: ${TABLE}.should_they_convert_to_box_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: stalled_reason_c {
    type: string
    sql: ${TABLE}.stalled_reason_c ;;
  }

  dimension: start_date_c {
    type: date
    sql: ${TABLE}.start_date_c ;;
  }

  dimension: stocking_hrs_wk_c {
    type: number
    sql: ${TABLE}.stocking_hrs_wk_c ;;
  }

  dimension: stocking_visits_week_c {
    type: number
    sql: ${TABLE}.stocking_visits_week_c ;;
  }

  dimension: synced_quote_id {
    type: string
    sql: ${TABLE}.synced_quote_id ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: total_funding_c {
    type: number
    sql: ${TABLE}.total_funding_c ;;
  }

  dimension: total_score_c {
    type: number
    sql: ${TABLE}.total_score_c ;;
  }

  dimension: trial_period_included_in_contract_c {
    type: string
    sql: ${TABLE}.trial_period_included_in_contract_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: type_abs_box_c {
    type: string
    sql: ${TABLE}.type_abs_box_c ;;
  }

  dimension: type_abs_c {
    type: string
    sql: ${TABLE}.type_abs_c ;;
  }

  dimension: unhealthy_must_haves_c {
    type: string
    sql: ${TABLE}.unhealthy_must_haves_c ;;
  }

  dimension: vcm_on_proposal_c {
    type: string
    sql: ${TABLE}.vcm_on_proposal_c ;;
  }

  dimension: wants_to_be_notified_before_renewal_c {
    type: string
    sql: ${TABLE}.wants_to_be_notified_before_renewal_c ;;
  }

  dimension: waterlines_available_c {
    type: string
    sql: ${TABLE}.waterlines_available_c ;;
  }

  dimension: website_c {
    type: string
    sql: ${TABLE}.website_c ;;
  }

  dimension: wellness_program_details_c {
    type: string
    sql: ${TABLE}.wellness_program_details_c ;;
  }

  dimension: what_equipment_is_needed_c {
    type: string
    sql: ${TABLE}.what_equipment_is_needed_c ;;
  }

  dimension: zp_keywords_c {
    type: string
    sql: ${TABLE}.zp_keywords_c ;;
  }

  dimension: launch_location_address_c {
    type: string
    sql: ${TABLE}.launch_location_address_c ;;
  }

  dimension: lean_data_days_in_stage_c {
    type: number
    sql: ${TABLE}.lean_data_days_in_stage_c ;;
  }

  dimension: lean_data_order_number_c {
    type: string
    sql: ${TABLE}.lean_data_order_number_c ;;
  }

  dimension_group: lean_data_reporting_last_run_date_c {
    type: time
    sql: ${TABLE}.lean_data_reporting_last_run_date_c ;;
  }

  dimension: lean_data_reporting_opportunity_source_c {
    type: string
    sql: ${TABLE}.lean_data_reporting_opportunity_source_c ;;
  }

  dimension: lean_data_reporting_total_marketing_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_marketing_touches_c ;;
  }

  dimension: lean_data_reporting_won_number_c {
    type: string
    sql: ${TABLE}.lean_data_reporting_won_number_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: company_culture_c {
    type: string
    sql: ${TABLE}.company_culture_c ;;
  }

  dimension: contract_considerations_c {
    type: string
    sql: ${TABLE}.contract_considerations_c ;;
  }

  dimension: documentation_c {
    type: string
    sql: ${TABLE}.documentation_c ;;
  }

  dimension: end_user_framing_c {
    type: string
    sql: ${TABLE}.end_user_framing_c ;;
  }

  dimension: former_providor_s_c {
    type: string
    sql: ${TABLE}.former_providor_s_c ;;
  }

  dimension: identify_hierarchy_of_stakeholde_c {
    type: string
    sql: ${TABLE}.identify_hierarchy_of_stakeholde_c ;;
  }

  dimension: list_kpis_slas_ctqs_c {
    type: string
    sql: ${TABLE}.list_kpis_slas_ctqs_c ;;
  }

  dimension: must_haves_c {
    type: string
    sql: ${TABLE}.must_haves_c ;;
  }

  dimension: upsell_opportunities_c {
    type: string
    sql: ${TABLE}.upsell_opportunities_c ;;
  }

  dimension: why_garten_c {
    type: string
    sql: ${TABLE}.why_garten_c ;;
  }

  dimension: relaunch_budget_c {
    type: number
    sql: ${TABLE}.relaunch_budget_c ;;
  }

  dimension: relaunch_headcount_c {
    type: number
    sql: ${TABLE}.relaunch_headcount_c ;;
  }

  dimension: relaunch_f_b_budget_pe_pd_c {
    type: number
    sql: ${TABLE}.relaunch_f_b_budget_pe_pd_c ;;
  }

  dimension: relaunch_paper_budget_pe_pd_c {
    type: number
    sql: ${TABLE}.relaunch_paper_budget_pe_pd_c ;;
  }

  dimension: relaunch_service_level_c {
    type: string
    sql: ${TABLE}.relaunch_service_level_c ;;
  }

  dimension: relaunch_service_package_price_c {
    type: number
    sql: ${TABLE}.relaunch_service_package_price_c ;;
  }

  dimension: closed_lost_reason_c {
    type: string
    sql: ${TABLE}.closed_lost_reason_c ;;
  }

  dimension: appx_delivery_date_c {
    type: date
    sql: ${TABLE}.appx_delivery_date_c ;;
  }

  dimension: of_delivery_addresses_by_timezone_c {
    type: string
    sql: ${TABLE}.of_delivery_addresses_by_timezone_c ;;
  }

  dimension: sfh_box_shipped_c {
    type: string
    sql: ${TABLE}.sfh_box_shipped_c ;;
  }

  dimension: sfh_frequency_c {
    type: string
    sql: ${TABLE}.sfh_frequency_c ;;
  }

  dimension: batch_date_c {
    type: date
    sql: ${TABLE}.batch_date_c ;;
  }

  measure: Total_Amount {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${amount} ;;
  }

#   measure: Total_Budget {
#     type: number
#     value_format_name: usd
#     sql: ${food_bev_budget_c}+${service_fee_c}+${paper_products_budget_c}+${alcohol_budget_c} ;;
#   }

  measure: Total_Budget {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Total_Budget} ;;
  }

#   measure: Microkitchen_ARR {
#     type: number
#     value_format_name: usd
#     sql: ${headcount_c} * (${food_bev_budget_c}+${service_fee_c}+${paper_products_budget_c}+${alcohol_budget_c}) * 264;;
#   }

  measure: Microkitchen_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Microkitchen_ARR};;
  }

  measure: Microkitchen_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Microkitchen_Forecast_ARR};;
  }

#   measure: Catering_ARR {
#     type: number
#     value_format_name: usd
#     sql: ( (${breakfast_headcount_c} * ${breakfast_c} * ${breakfast_days_wk_c})
#           + (${dinner_headcount_c} * ${dinner_person_c} * ${dinner_days_wk_c})
#           + (${lunch_days_wk_c} * ${lunch_headcount_c} * ${lunch_person_c}) )  * 52 ;;
#   }

  measure: Catering_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Catering_ARR} ;;
  }

  measure: Catering_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Catering_Forecast_ARR} ;;
  }

#   measure: Cafe_Management_ARR {
#     type: number
#     value_format_name: usd
#     sql: ${arr_cafe_management_c} ;;
#   }

  measure: Cafe_Management_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Cafe_Management_ARR} ;;
  }

  measure: Cafe_Management_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Cafe_Management_Forecast_ARR} ;;
  }

#   measure: Wellness_ARR {
#     type: number
#     value_format_name: usd
#     sql: ${arr_wellness_program_c} ;;
#   }

  measure: Wellness_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Wellness_ARR} ;;
  }

  measure: Wellness_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Wellness_Forecast_ARR} ;;
  }

#   measure: Byte_ARR {
#     type: number
#     value_format_name: usd
#     sql: ((${byte_subscription_fee_c}*12) + (${byte_estimated_food_spend_per_month_c} * 12)) * ${number_of_fridges_c} ;;
#   }

  measure: Byte_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Byte_ARR} ;;
  }

  measure: Byte_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${opportunity_derived_table.Byte_Forecast_ARR} ;;
  }

  measure: Total_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR}) ;;
    drill_fields: [name,Total_ARR]
  }

  measure: Total_Forecast_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: (${opportunity_derived_table.Byte_Forecast_ARR} + ${opportunity_derived_table.Wellness_Forecast_ARR} + ${opportunity_derived_table.Cafe_Management_Forecast_ARR} + ${opportunity_derived_table.Catering_Forecast_ARR} + ${opportunity_derived_table.Microkitchen_Forecast_ARR}) ;;
  }

  dimension: is_ytd {
    type: yesno
    group_label: "Date Restrictions"
    label: "Is_YTD?"
    view_label: "Dynamic Grouping & Time Comparisons"
    sql:
     ${fiscal_year} < EXTRACT (YEAR FROM CURRENT_TIMESTAMP)
    OR
     (${fiscal_year} = EXTRACT (YEAR FROM CURRENT_TIMESTAMP)
    AND
    ${fiscal_quarter} <= EXTRACT (QUARTER FROM CURRENT_TIMESTAMP))
    ;;
    }

  measure: Total_Amount_2019_Year {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: case when ${fiscal_year} = 2019 then (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR}) end;;
  }

  measure: Previous_Year_Total_ARR {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql:  (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR});;
    filters: {
      field: is_ytd
      value: "yes"
    }
  }

  measure: Previous_Year_Total_ARR1 {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql:  (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR});;
    filters: {
      field: fiscal_year
      value: "2019"
    }
  }

  measure: Total_Amount_2018_Year {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: case when ${fiscal_year} = 2018 then (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR}) end;;
  }

  measure: Total_Amount_2017_Year {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: case when ${fiscal_year} = 2017 then (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR}) end;;
  }

  measure: Total_Amount_2016_Year {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: case when ${fiscal_year} = 2016 then (${opportunity_derived_table.Byte_ARR} + ${opportunity_derived_table.Wellness_ARR} + ${opportunity_derived_table.Cafe_Management_ARR} + ${opportunity_derived_table.Catering_ARR} + ${opportunity_derived_table.Microkitchen_ARR}) end;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      account_id,
      alcohol_budget_c,
      alcohol_increase_c,
      amount,
      approval_status_c,
      arr_cafe_management_c,
      arr_catering_c,
      arr_catering_increase_c,
      arr_micro_market_c,
      arr_wellness_program_c,
      auto_renew_c,
      blue_sheet_updated_c_time,
      box_c,
      breakfast_c,
      breakfast_days_wk_c,
      breakfast_headcount_c,
      budget_c,
      budget_confirmed_c,
      building_access_for_has_c,
      business_score_scout_c,
      byte_estimated_food_spend_per_month_c,
      byte_po_number_c,
      byte_setup_fee_c,
      byte_subscription_fee_c,
      byte_subsidy_c,
      cafe_management_details_c,
      campaign_id,
      campaign_mapped_from_lead_c,
      catering_details_supporting_docs_c,
      city_operations_manager_c,
      client_industry_c,
      close_date,
      contract_id,
      contract_length_c,
      contract_link_c,
      contract_version_c,
      created_by_id,
      created_date_time,
      current_catering_vendor_c,
      current_pain_points_c,
      current_snack_vendor_primary_c,
      current_snack_vendor_secondary_c,
      date_15_hit_c,
      date_20_hit_c,
      date_30_hit_c,
      date_56_hit_c,
      delivers_per_week_c,
      delivery_days_c,
      description,
      description_of_backstock_space_c,
      dinner_days_wk_c,
      dinner_headcount_c,
      dinner_person_c,
      discovery_completed_c,
      disqualification_reason_c,
      distance_between_farthest_buildings_mi_c,
      do_they_meet_mk_requirements_c,
      driver_hrs_delivery_c,
      effective_date_c,
      equipment_allocation_c,
      equipment_details_c,
      equipment_installation_date_c,
      equipment_maintenance_repair_month_c,
      equipment_payoff_period_months_c,
      equipment_situation_c,
      event_details_and_supporting_docs_c,
      event_revenue_c,
      expected_customer_flow_c,
      first_approach_date_c,
      fiscal,
      fiscal_quarter,
      fiscal_year,
      food_bev_budget_c,
      food_bev_increase_c,
      food_dev_details_supporting_docs_c,
      food_discount_c,
      food_margin_dynamic_c,
      food_wellness_goals_c,
      forecast_category,
      forecast_category_name,
      freight_information_c,
      has_open_activity,
      has_opportunity_line_item,
      has_overdue_task,
      headcount_c,
      headcount_increase_c,
      hm_ha_transportation_cost_visit_c,
      hm_hrs_wk_managing_client_c,
      hm_visits_wk_c,
      how_did_they_hear_about_us_c,
      how_many_days_in_advance_c,
      if_other_please_specify_c,
      if_picked_other_please_specify_c,
      industry_linked_inv_2_c,
      initial_term_end_date_c,
      is_closed,
      is_deleted,
      is_won,
      last_activity_date,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      latest_funding_round_amount_c,
      latest_funding_round_date_c,
      latest_funding_stage_c,
      launch_date_tentative_c,
      lead_comments_c,
      lead_created_date_c,
      lead_source,
      legal_hrs_spent_on_contract_c,
      loss_comment_c,
      loss_reason_c,
      lunch_days_wk_c,
      lunch_headcount_c,
      lunch_person_c,
      merchandising_expectations_c,
      metro_region_c,
      micro_market_details_c,
      most_recent_acct_activity_c,
      name,
      national_global_deal_c,
      new_equipment_given_above_allocation_c,
      next_step,
      next_step_c,
      notes_on_manual_inputs_c,
      notice_days_c,
      notice_to_existing_vendor_c,
      number_of_days_in_trial_period_c,
      number_of_fridges_c,
      of_buildings_c,
      of_contract_iterations_c,
      of_floors_c,
      of_kitchens_c,
      of_large_backstock_locations_c,
      of_small_backstock_locations_c,
      office_address_latitude_s,
      office_address_longitude_s,
      office_manager_email_c,
      office_manager_name_c,
      ok_to_prebill_c,
      onboarding_type_c,
      opportunity_creator_2_c,
      opportunity_score_c,
      opportunity_team_support_member_c,
      other_notes_for_launch_c,
      other_notes_for_ops_c,
      overnight_access_c,
      owner_id,
      paper_products_budget_c,
      paper_products_increase_c,
      payment_terms_c,
      peopleai_last_touch_c,
      peopleai_time_spent_c,
      peopleai_total_time_spent_c,
      picking_hrs_order_c,
      pictures_info_from_walkthrough_c,
      pitch_date_c_time,
      poc_role_title_c,
      power_lines_available_c,
      preferred_launch_date_c,
      preferred_launch_date_option_c,
      preferred_launch_date_range_c,
      pricebook_2_id,
      probability,
      product_mix_focus_c,
      proposal_link_c,
      push_count_c,
      qualification_call_date_c_time,
      record_type_id,
      renewal_term_c,
      requested_service_end_time_c,
      requested_service_start_time_c,
      revenue_c,
      service_days_c,
      service_fee_c,
      service_fee_increase_c,
      service_level_c,
      sfiq_status_c,
      should_they_convert_to_box_c,
      stage_name,
      stalled_reason_c,
      start_date_c,
      stocking_hrs_wk_c,
      stocking_visits_week_c,
      synced_quote_id,
      system_modstamp_time,
      total_funding_c,
      total_score_c,
      trial_period_included_in_contract_c,
      type,
      type_abs_box_c,
      type_abs_c,
      unhealthy_must_haves_c,
      vcm_on_proposal_c,
      wants_to_be_notified_before_renewal_c,
      waterlines_available_c,
      website_c,
      wellness_program_details_c,
      what_equipment_is_needed_c,
      zp_keywords_c,
      launch_location_address_c,
      lean_data_days_in_stage_c,
      lean_data_order_number_c,
      lean_data_reporting_last_run_date_c_time,
      lean_data_reporting_opportunity_source_c,
      lean_data_reporting_total_marketing_touches_c,
      lean_data_reporting_won_number_c,
      lean_data_routing_action_c,
      company_culture_c,
      contract_considerations_c,
      documentation_c,
      end_user_framing_c,
      former_providor_s_c,
      identify_hierarchy_of_stakeholde_c,
      list_kpis_slas_ctqs_c,
      must_haves_c,
      upsell_opportunities_c,
      why_garten_c,
      relaunch_budget_c,
      relaunch_headcount_c,
      relaunch_f_b_budget_pe_pd_c,
      relaunch_paper_budget_pe_pd_c,
      relaunch_service_level_c,
      relaunch_service_package_price_c,
      closed_lost_reason_c,
      appx_delivery_date_c,
      of_delivery_addresses_by_timezone_c,
      sfh_box_shipped_c,
      sfh_frequency_c,
      batch_date_c
    ]
  }
}

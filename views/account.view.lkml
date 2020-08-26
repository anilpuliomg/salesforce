view: account {
  sql_table_name: `salesforce.account`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: additional_documents_c {
    type: string
    sql: ${TABLE}.additional_documents_c ;;
  }

  dimension: ahm_c {
    type: yesno
    sql: ${TABLE}.ahm_c ;;
  }

  dimension: alcohol_budget_c {
    type: number
    sql: ${TABLE}.alcohol_budget_c ;;
  }

  dimension: arr_catering_c {
    type: number
    sql: ${TABLE}.arr_catering_c ;;
  }

  dimension: asana_launch_board_c {
    type: string
    sql: ${TABLE}.asana_launch_board_c ;;
  }

  dimension: at_risk_60_days_no_csat_return_c {
    type: yesno
    sql: ${TABLE}.at_risk_60_days_no_csat_return_c ;;
  }

  dimension: at_risk_60_days_non_payment_c {
    type: yesno
    sql: ${TABLE}.at_risk_60_days_non_payment_c ;;
  }

  dimension: at_risk_60_days_to_contract_expiry_c {
    type: yesno
    sql: ${TABLE}.at_risk_60_days_to_contract_expiry_c ;;
  }

  dimension: at_risk_c {
    type: yesno
    sql: ${TABLE}.at_risk_c ;;
  }

  dimension: at_risk_csat_6_or_below_c {
    type: yesno
    sql: ${TABLE}.at_risk_csat_6_or_below_c ;;
  }

  dimension: at_risk_in_trial_period_and_or_without_c {
    type: yesno
    sql: ${TABLE}.at_risk_in_trial_period_and_or_without_c ;;
  }

  dimension: at_risk_level_c {
    type: string
    sql: ${TABLE}.at_risk_level_c ;;
  }

  dimension: at_risk_merger_or_acquisition_c {
    type: yesno
    sql: ${TABLE}.at_risk_merger_or_acquisition_c ;;
  }

  dimension: at_risk_new_office_manager_c {
    type: yesno
    sql: ${TABLE}.at_risk_new_office_manager_c ;;
  }

  dimension: at_risk_notes_c {
    type: string
    sql: ${TABLE}.at_risk_notes_c ;;
  }

  dimension: at_risk_reason_c {
    type: string
    sql: ${TABLE}.at_risk_reason_c ;;
  }

  dimension: at_risk_recent_incident_perceived_as_c_c {
    type: yesno
    sql: ${TABLE}.at_risk_recent_incident_perceived_as_c_c ;;
  }

  dimension: at_risk_significant_budget_reductions_c {
    type: yesno
    sql: ${TABLE}.at_risk_significant_budget_reductions_c ;;
  }

  dimension: at_risk_significant_non_compliance_wit_c {
    type: yesno
    sql: ${TABLE}.at_risk_significant_non_compliance_wit_c ;;
  }

  dimension: at_risk_significant_ongoing_unresolved_c {
    type: yesno
    sql: ${TABLE}.at_risk_significant_ongoing_unresolved_c ;;
  }

  dimension: auto_renew_c {
    type: yesno
    sql: ${TABLE}.auto_renew_c ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_geocode_accuracy {
    type: string
    sql: ${TABLE}.billing_geocode_accuracy ;;
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: box_customer_status_c {
    type: string
    sql: ${TABLE}.box_customer_status_c ;;
  }

  dimension: budget_fields_last_updated_by_c {
    type: string
    sql: ${TABLE}.budget_fields_last_updated_by_c ;;
  }

  dimension_group: budget_fields_last_updated_time_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.budget_fields_last_updated_time_c ;;
  }

  dimension: budget_minimum_c {
    type: number
    sql: ${TABLE}.budget_minimum_c ;;
  }

  dimension: client_industry_c {
    type: string
    sql: ${TABLE}.client_industry_c ;;
  }

  dimension: client_s_kpi_c {
    type: string
    sql: ${TABLE}.client_s_kpi_c ;;
  }

  dimension_group: close_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_date_c ;;
  }

  dimension: company_id_c {
    type: string
    sql: ${TABLE}.company_id_c ;;
  }

  dimension: connections_owner_c {
    type: string
    sql: ${TABLE}.connections_owner_c ;;
  }

  dimension: contract_link_c {
    type: string
    sql: ${TABLE}.contract_link_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: current_pain_points_c {
    type: string
    sql: ${TABLE}.current_pain_points_c ;;
  }

  dimension: delivery_day_of_the_month_c {
    type: number
    sql: ${TABLE}.delivery_day_of_the_month_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dietary_restrictions_c {
    type: string
    sql: ${TABLE}.dietary_restrictions_c ;;
  }

  dimension: distance_between_farthest_buildings_mi_c {
    type: number
    sql: ${TABLE}.distance_between_farthest_buildings_mi_c ;;
  }

  dimension: do_they_meet_mk_requirements_c {
    type: string
    sql: ${TABLE}.do_they_meet_mk_requirements_c ;;
  }

  dimension: driver_hours_delivery_c {
    type: number
    sql: ${TABLE}.driver_hours_delivery_c ;;
  }

  dimension: equipment_allocation_c {
    type: number
    sql: ${TABLE}.equipment_allocation_c ;;
  }

  dimension: equipment_maintenance_repair_month_c {
    type: number
    sql: ${TABLE}.equipment_maintenance_repair_month_c ;;
  }

  dimension: feedback_order_placement_days_c {
    type: number
    sql: ${TABLE}.feedback_order_placement_days_c ;;
  }

  dimension: fid_2_c {
    type: string
    sql: ${TABLE}.fid_2_c ;;
  }

  dimension: fidaddress_c {
    type: string
    sql: ${TABLE}.fidaddress_c ;;
  }

  dimension_group: first_box_received_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_box_received_c ;;
  }

  dimension: food_budget_c {
    type: number
    sql: ${TABLE}.food_budget_c ;;
  }

  dimension: food_discount_c {
    type: number
    sql: ${TABLE}.food_discount_c ;;
  }

  dimension: food_wellness_goals_c {
    type: string
    sql: ${TABLE}.food_wellness_goals_c ;;
  }

  dimension: happiness_ambassador_lead_c {
    type: string
    sql: ${TABLE}.happiness_ambassador_lead_c ;;
  }

  dimension: happiness_manager_2_c {
    type: string
    sql: ${TABLE}.happiness_manager_2_c ;;
  }

  dimension: happiness_manager_c {
    type: string
    sql: ${TABLE}.happiness_manager_c ;;
  }

  dimension: headcount_c {
    type: number
    sql: ${TABLE}.headcount_c ;;
  }

  dimension: hm_ha_transportation_cost_visit_c {
    type: number
    sql: ${TABLE}.hm_ha_transportation_cost_visit_c ;;
  }

  dimension: hm_hrs_week_managing_client_c {
    type: number
    sql: ${TABLE}.hm_hrs_week_managing_client_c ;;
  }

  dimension: hm_visits_wk_c {
    type: number
    sql: ${TABLE}.hm_visits_wk_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_linked_in_c {
    type: string
    sql: ${TABLE}.industry_linked_in_c ;;
  }

  dimension: interested_in_culinary_c {
    type: yesno
    sql: ${TABLE}.interested_in_culinary_c ;;
  }

  dimension: interested_in_exubrancy_c {
    type: yesno
    sql: ${TABLE}.interested_in_exubrancy_c ;;
  }

  dimension: interested_in_garten_basket_c {
    type: yesno
    sql: ${TABLE}.interested_in_garten_basket_c ;;
  }

  dimension: interested_in_garten_market_c {
    type: yesno
    sql: ${TABLE}.interested_in_garten_market_c ;;
  }

  dimension: interested_in_snack_from_home_c {
    type: yesno
    sql: ${TABLE}.interested_in_snack_from_home_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
  }

  dimension: kamp_doc_link_c {
    type: string
    sql: ${TABLE}.kamp_doc_link_c ;;
  }

  dimension: kickoff_call_complete_c {
    type: yesno
    sql: ${TABLE}.kickoff_call_complete_c ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_survey_response_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_survey_response_date_c ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension_group: launch_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.launch_date_c ;;
  }

  dimension: launch_manager_c {
    type: string
    sql: ${TABLE}.launch_manager_c ;;
  }

  dimension: launch_score_c {
    type: number
    sql: ${TABLE}.launch_score_c ;;
  }

  dimension: launch_status_c {
    type: string
    sql: ${TABLE}.launch_status_c ;;
  }

  dimension: lean_data_ld_email_domains_c {
    type: string
    sql: ${TABLE}.lean_data_ld_email_domains_c ;;
  }

  dimension: lean_data_reporting_customer_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_customer_c ;;
  }

  dimension: lean_data_reporting_has_opportunity_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_has_opportunity_c ;;
  }

  dimension_group: lean_data_reporting_last_marketing_touch_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lean_data_reporting_last_marketing_touch_date_c ;;
  }

  dimension_group: lean_data_reporting_last_sales_touch_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lean_data_reporting_last_sales_touch_date_c ;;
  }

  dimension: lean_data_reporting_recent_marketing_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_recent_marketing_touches_c ;;
  }

  dimension: lean_data_reporting_target_account_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_target_account_c ;;
  }

  dimension: lean_data_reporting_total_leads_and_contacts_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_leads_and_contacts_c ;;
  }

  dimension: lean_data_reporting_total_marketing_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_marketing_touches_c ;;
  }

  dimension: lean_data_reporting_total_sales_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_sales_touches_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: lean_data_search_c {
    type: string
    sql: ${TABLE}.lean_data_search_c ;;
  }

  dimension: market_c {
    type: string
    sql: ${TABLE}.market_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mattermark_score_c {
    type: number
    sql: ${TABLE}.mattermark_score_c ;;
  }

  dimension: monthly_spend_c {
    type: number
    sql: ${TABLE}.monthly_spend_c ;;
  }

  dimension_group: most_recent_box_received_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.most_recent_box_received_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: next_billing_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.next_billing_date_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: of_buildings_c {
    type: number
    sql: ${TABLE}.of_buildings_c ;;
  }

  dimension: of_deliveries_week_c {
    type: number
    sql: ${TABLE}.of_deliveries_week_c ;;
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

  dimension: office_address_c {
    type: string
    sql: ${TABLE}.office_address_c ;;
  }

  dimension_group: office_move_date_if_applicable_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.office_move_date_if_applicable_c ;;
  }

  dimension: ordering_guide_link_c {
    type: string
    sql: ${TABLE}.ordering_guide_link_c ;;
  }

  dimension: origin_salesforce_iq_c {
    type: string
    sql: ${TABLE}.origin_salesforce_iq_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: packing_time_days_c {
    type: number
    sql: ${TABLE}.packing_time_days_c ;;
  }

  dimension: paper_products_budget_c {
    type: number
    sql: ${TABLE}.paper_products_budget_c ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension_group: peopleai_last_touch_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
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

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: picking_time_per_order_c {
    type: number
    sql: ${TABLE}.picking_time_per_order_c ;;
  }

  dimension: preventable_churn_c {
    type: string
    sql: ${TABLE}.preventable_churn_c ;;
  }

  dimension: previous_headcount_value_c {
    type: number
    sql: ${TABLE}.previous_headcount_value_c ;;
  }

  dimension: primary_contact_c {
    type: string
    sql: ${TABLE}.primary_contact_c ;;
  }

  dimension: product_categories_received_c {
    type: string
    sql: ${TABLE}.product_categories_received_c ;;
  }

  dimension: product_mix_focus_c {
    type: string
    sql: ${TABLE}.product_mix_focus_c ;;
  }

  dimension: proposal_link_c {
    type: string
    sql: ${TABLE}.proposal_link_c ;;
  }

  dimension: record_type_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: regional_head_of_happiness_c {
    type: string
    sql: ${TABLE}.regional_head_of_happiness_c ;;
  }

  dimension: relationship_c {
    type: string
    sql: ${TABLE}.relationship_c ;;
  }

  dimension_group: renewal_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.renewal_date_c ;;
  }

  dimension: renewal_term_c {
    type: number
    sql: ${TABLE}.renewal_term_c ;;
  }

  dimension: salesforce_iq_id_c {
    type: string
    sql: ${TABLE}.salesforce_iq_id_c ;;
  }

  dimension: service_budget_c {
    type: number
    sql: ${TABLE}.service_budget_c ;;
  }

  dimension: service_level_c {
    type: string
    sql: ${TABLE}.service_level_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_geocode_accuracy {
    type: string
    sql: ${TABLE}.shipping_geocode_accuracy ;;
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shipping_latitude ;;
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shipping_longitude ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: shipping_time_days_c {
    type: number
    sql: ${TABLE}.shipping_time_days_c ;;
  }

  dimension: should_they_convert_to_box_c {
    type: string
    sql: ${TABLE}.should_they_convert_to_box_c ;;
  }

  dimension: sic_desc {
    type: string
    sql: ${TABLE}.sic_desc ;;
  }

  dimension_group: start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date_c ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension: stocking_visits_week_c {
    type: number
    sql: ${TABLE}.stocking_visits_week_c ;;
  }

  dimension: stockings_hrs_week_c {
    type: number
    sql: ${TABLE}.stockings_hrs_week_c ;;
  }

  dimension_group: subscribe_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.subscribe_date_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension_group: termination_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.termination_date_c ;;
  }

  dimension: top_100_prospect_c {
    type: yesno
    sql: ${TABLE}.top_100_prospect_c ;;
  }

  dimension_group: trial_period_end_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.trial_period_end_date_c ;;
  }

  dimension: trial_period_tfc_included_in_contract_c {
    type: yesno
    sql: ${TABLE}.trial_period_tfc_included_in_contract_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unhealthy_must_haves_c {
    type: string
    sql: ${TABLE}.unhealthy_must_haves_c ;;
  }

  dimension: vcm_c {
    type: string
    sql: ${TABLE}.vcm_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: what_equipment_is_needed_c {
    type: string
    sql: ${TABLE}.what_equipment_is_needed_c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      record_type.developer_name,
      record_type.name,
      record_type.id,
      account_history.count,
      account_contact_role.count,
      account_contact_relation.count,
      accepted_event_relation.count,
      account_team_member.count,
      account_share.count,
      asset.count,
      case.count,
      contact.count,
      contract.count,
      declined_event_relation.count,
      event.count,
      event_who_relation.count,
      event_relation.count,
      opportunity.count,
      order.count,
      quote.count,
      task.count,
      task_relation.count,
      task_who_relation.count,
      user.count,
      undecided_event_relation.count
    ]
  }
}

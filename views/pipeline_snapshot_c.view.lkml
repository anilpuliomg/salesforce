view: pipeline_snapshot_c {
  derived_table: {
    sql: SELECT * FROM `my-oauth-project-275301.salesforce.pipeline_snapshot_c`
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

  dimension: arr_catering_c {
    type: number
    sql: ${TABLE}.arr_catering_c ;;
  }

  dimension: arr_microkitchen_c {
    type: number
    sql: ${TABLE}.arr_microkitchen_c ;;
  }

  dimension: catering_monthly_total_c {
    type: number
    sql: ${TABLE}.catering_monthly_total_c ;;
  }

  dimension: close_date_c {
    type: date
    sql: ${TABLE}.close_date_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: creator_role_c {
    type: string
    sql: ${TABLE}.creator_role_c ;;
  }

  dimension: current_snack_vendor_c {
    type: string
    sql: ${TABLE}.current_snack_vendor_c ;;
  }

  dimension: food_budget_c {
    type: number
    sql: ${TABLE}.food_budget_c ;;
  }

  dimension: forecast_value_catering_c {
    type: number
    sql: ${TABLE}.forecast_value_catering_c ;;
  }

  dimension: forecast_value_microkitchen_c {
    type: number
    sql: ${TABLE}.forecast_value_microkitchen_c ;;
  }

  dimension: forecast_value_total_c {
    type: number
    sql: ${TABLE}.forecast_value_total_c ;;
  }

  dimension: headcount_c {
    type: number
    sql: ${TABLE}.headcount_c ;;
  }

  dimension: how_did_they_hear_about_us_c {
    type: string
    sql: ${TABLE}.how_did_they_hear_about_us_c ;;
  }

  dimension: industry_c {
    type: string
    sql: ${TABLE}.industry_c ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: lead_source_c {
    type: string
    sql: ${TABLE}.lead_source_c ;;
  }

  dimension: metro_region_c {
    type: string
    sql: ${TABLE}.metro_region_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_name_c {
    type: string
    sql: ${TABLE}.opportunity_name_c ;;
  }

  dimension: opportunity_owner_c {
    type: string
    sql: ${TABLE}.opportunity_owner_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: poc_role_title_c {
    type: string
    sql: ${TABLE}.poc_role_title_c ;;
  }

  dimension: service_budget_c {
    type: number
    sql: ${TABLE}.service_budget_c ;;
  }

  dimension: stage_c {
    type: string
    sql: ${TABLE}.stage_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: total_arr_c {
    type: number
    sql: ${TABLE}.total_arr_c ;;
  }

  dimension: total_budget_c {
    type: number
    sql: ${TABLE}.total_budget_c ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      arr_catering_c,
      arr_microkitchen_c,
      catering_monthly_total_c,
      close_date_c,
      created_by_id,
      created_date_time,
      creator_role_c,
      current_snack_vendor_c,
      food_budget_c,
      forecast_value_catering_c,
      forecast_value_microkitchen_c,
      forecast_value_total_c,
      headcount_c,
      how_did_they_hear_about_us_c,
      industry_c,
      is_deleted,
      last_modified_by_id,
      last_modified_date_time,
      lead_source_c,
      metro_region_c,
      name,
      opportunity_name_c,
      opportunity_owner_c,
      owner_id,
      poc_role_title_c,
      service_budget_c,
      stage_c,
      system_modstamp_time,
      total_arr_c,
      total_budget_c
    ]
  }
}

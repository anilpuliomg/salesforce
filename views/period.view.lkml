view: period {
  derived_table: {
    sql: SELECT * FROM `my-oauth-project-275301.salesforce.period`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: string
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: end_date {
    type: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: fiscal_year_settings_id {
    type: string
    sql: ${TABLE}.fiscal_year_settings_id ;;
  }

  dimension: fully_qualified_label {
    type: string
    sql: ${TABLE}.fully_qualified_label ;;
  }

  dimension: is_forecast_period {
    type: string
    sql: ${TABLE}.is_forecast_period ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: period_label {
    type: string
    sql: ${TABLE}.period_label ;;
  }

  dimension: quarter_label {
    type: string
    sql: ${TABLE}.quarter_label ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_deleted,
      _fivetran_synced_time,
      end_date,
      fiscal_year_settings_id,
      fully_qualified_label,
      is_forecast_period,
      number,
      period_label,
      quarter_label,
      start_date,
      system_modstamp_time,
      type
    ]
  }
}

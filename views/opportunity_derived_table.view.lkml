view: opportunity_derived_table {

  derived_table: {
    sql: SELECT   id as id,
                  sum(COALESCE(arr_cafe_management_c,0)) as Cafe_Management_ARR,
                  sum(COALESCE(arr_wellness_program_c,0)) as Wellness_ARR,
                  sum(COALESCE(food_bev_budget_c,0) + COALESCE(service_fee_c,0) + COALESCE(paper_products_budget_c,0) + COALESCE(alcohol_budget_c,0)) as Total_Budget,
                  sum(COALESCE(headcount_c,0) * (COALESCE(food_bev_budget_c,0) + COALESCE(service_fee_c,0) + COALESCE(paper_products_budget_c,0) + COALESCE(alcohol_budget_c,0)) * 264) as Microkitchen_ARR,
                  sum(( (COALESCE(breakfast_headcount_c,0) * COALESCE(breakfast_c,0) * COALESCE(breakfast_days_wk_c,0))
                          + (COALESCE(dinner_headcount_c,0) * COALESCE(dinner_person_c,0) * COALESCE(dinner_days_wk_c,0))
                          + (COALESCE(lunch_days_wk_c,0) * COALESCE(lunch_headcount_c,0) * COALESCE(lunch_person_c,0)) )  * 52) as Catering_ARR,
                  sum(((COALESCE(byte_subscription_fee_c,0) * 12) + (COALESCE(byte_estimated_food_spend_per_month_c,0) * 12)) * COALESCE(number_of_fridges_c,0)) as Byte_ARR
          FROM `my-oauth-project-275301.salesforce.opportunity`
          group by id
      ;;
  }

  dimension: id {
    type: number
    #sql: ${TABLE}."id" ;;
  }

  dimension: Cafe_Management_ARR {
    type: number
    #sql: ${TABLE}."Cafe_Management_ARR" ;;
  }

  dimension: Wellness_ARR {
    type: number
    #sql: ${TABLE}."Wellness_ARR" ;;
  }

  dimension: Total_Budget {
    type: number
    #sql: ${TABLE}."Total_Budget" ;;
  }

  dimension: Microkitchen_ARR {
    type: number
    #sql: ${TABLE}."Microkitchen_ARR" ;;
  }

  dimension: Catering_ARR {
    type: number
    #sql: ${TABLE}."Catering_ARR" ;;
  }

  dimension: Byte_ARR {
    type: number
    #sql: ${TABLE}."Byte_ARR" ;;
  }

 }

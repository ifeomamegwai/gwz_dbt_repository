with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        CAST(orders_id AS STRING) AS orders_id,
        shipping_fee,
        CAST(logcost AS FLOAT64) AS logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost

    from source

)

select * from renamed

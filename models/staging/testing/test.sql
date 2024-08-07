version: 2

sources:
  - name: raw
    schema: gz_raw_data
    description: Greenwiz raw data source
    tables:
      - name: sales
        identifier: raw_gz_sales
        description: sales of greenweez/ We have one row per products_id found in each orders_id
        columns:
          - name: orders_id
            description: foreign key to ship
          - name: pdt_id
            description: foreign key to product
            tests:
              - unique:
                  column_name: "(orders_id || '_' || pdt_id)"
                    ##OR##
              - dbt_utils.unique_combination_of_columns:
                  combination_of_columns:
                  - orders_id
                  - pdt_id
      - name: product
        identifier: raw_gz_product
        description: products of Greenweez
        columns:
          - name: products_id
            description: the primary key of the table
            tests:
              - unique:
                  - not_null
      - name: ship
        identifier: raw_gz_ship
        columns:
          - name: orders_id
            description: the primary key of the table
            tests:
              - unique:
                  - not_null
                  
          
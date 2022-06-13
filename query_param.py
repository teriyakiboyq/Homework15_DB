GET_ANIMAL_ID_QUERY = """
            SELECT *
            FROM animals_final
            WHERE animal_id = :1;
"""
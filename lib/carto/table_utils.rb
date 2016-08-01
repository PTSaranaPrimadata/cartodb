module Carto
  module TableUtils
    # Returns a (double) quoted table name if needed (if it contains a dash, for example).
    # Coupled to lib/assets/javascripts/cartodb3/helpers/utils.js#safeTableNameQuoting
    def safe_table_name_quoting(table_name)
      dashes_quoting(table_name)
    end

    def safe_schema_name_quoting(schema_name)
      dashes_quoting(schema_name)
    end

    def safe_schema_and_table_quoting(schema_name, table_name)
      safe_schema = safe_schema_name_quoting(schema_name)
      safe_table_name = safe_table_name_quoting(table_name)
      "#{safe_schema}.#{safe_table_name}"
    end

    private

    def dashes_quoting(name)
      name && name.include?('-') && !name.match(/".*"/) ? "\"#{name}\"" : name
    end
  end
end

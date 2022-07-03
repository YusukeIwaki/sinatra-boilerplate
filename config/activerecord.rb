# frozen_string_literal: true

# ref: https://hai3.net/blog/active-record-readonly/
module ActiveRecord
  class Base
    def readonly?
      true
    end

    def self.readonly_attributes
      attribute_names
    end

    # Disable annoying STI
    self.inheritance_column = :_xxxxxx
  end
end

ActiveRecord::Base.logger = Logger.new($stdout)
ActiveRecord.verbose_query_logs = true

# frozen_string_literal: true

module Overcommit
  module Hook
    module PrePush
      class ZeitwerkCheck < Base
        def run
          result = execute(command)
          return :pass if result.success?

          extract_messages result.stderr.split("\n"),
                           /^expected file (?<file>[[:alnum:]].*.rb)/
        end
      end
    end
  end
end

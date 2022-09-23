module Basic

  class << self

    def safe_parse_json json, default
      h = default
      begin
        h = JSON.parse json
      rescue
      end
      return h
    end

    def create_key model, n
      tmp_key = Array.new(n){[*'0'..'9', *'a'..'z'].sample}.join
      if model
        while model.where(:key => tmp_key).count > 0
          tmp_key = Array.new(n){[*'0'..'9', *'a'..'z'].sample}.join
        end
      end
      return tmp_key
    end
  end
end

# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class Submit < Client
      #
      # submit a file for analysis
      #
      # @param [file] file file to submit
      # @param [Integer] environment_id Environment ID. Available environments ID: <strong>300</strong>: 'Linux (Ubuntu 16.04, 64 bit)', <strong>200</strong>: 'Android Static Analysis', <strong>120</strong>: 'Windows 7 64 bit', <strong>110</strong>: 'Windows 7 32 bit (HWP Support)', <strong>100</strong>: 'Windows 7 32 bit'
      # @param [Boolean] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean] allow_community_access When set to 'true', the sample will be available for the community. Default: true (Note: when 'no_share_third_party' is set to 'false', it won't be possible to set different value than 'true')
      # @param [Boolean] no_hash_lookup Default: false
      # @param [String] action_script Optional custom runtime action script. Available runtime scripts: **default**, **default_maxantievasion**, **default_randomfiles**, **default_randomtheme**, **default_openie**
      # @param [Boolean] hybrid_analysis When set to 'false', no memory dumps or memory dump analysis will take place. Default: true
      # @param [Boolean] experimental_anti_evasion When set to 'true', will set all experimental anti-evasion options of the Kernelmode Monitor. Default: false
      # @param [Boolean] script_logging When set to 'true', will set the in-depth script logging engine of the Kernelmode Monitor. Default: false
      # @param [Boolean] input_sample_tampering When set to 'true', will allow experimental anti-evasion options of the Kernelmode Monitor that tamper with the input sample. Default: false
      # @param [Boolean] tor_enabled_analysis When set to 'true', will route the network traffic for the analysis via TOR (if properly configured on the server). Default: false
      # @param [Boolean] offline_analysis When set to “true”, will disable outbound network traffic for the guest VM (takes precedence over ‘tor_enabled_analysis’ if both are provided). Default: false
      # @param [String] email Optional E-Mail address that may be associated with the submission for notification
      # @param [String] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String] custom_date_time Optional custom date/time that can be set for the analysis system. Expected format: yyyy-MM-dd HH:mm
      # @param [String] custom_cmd_line Optional commandline that should be passed to the analysis file
      # @param [Integer] custom_run_time Optional runtime duration (in seconds)
      # @param [String] submit_name Optional 'submission name' field that will be used for file type detection and analysis
      # @param [String] document_password Optional document password that will be used to fill-in Adobe/Office password prompts
      # @param [String] environment_variable Optional system environment value. The value is provided in the format: name=value
      #
      # @return [Hash]
      #
      def file(file:, environment_id:, no_share_third_party: nil, allow_community_access: nil, no_hash_lookup: nil, action_script: nil, hybrid_analysis: nil, experimental_anti_evasion: nil, script_logging: nil, input_sample_tampering: nil, tor_enabled_analysis: nil, offline_analysis: nil, email: nil, comment: nil, custom_date_time: nil, custom_cmd_line: nil, custom_run_time: nil, submit_name: nil, document_password: nil, environment_variable: nil)
        name = File.basename(file)
        data = File.read(file)
        params = {
          environment_id: environment_id.to_s,
          no_share_third_party: no_share_third_party,
          allow_community_access: allow_community_access,
          no_hash_lookup: no_hash_lookup,
          action_script: action_script,
          hybrid_analysis: hybrid_analysis,
          experimental_anti_evasion: experimental_anti_evasion,
          script_logging: script_logging,
          input_sample_tampering: input_sample_tampering,
          tor_enabled_analysis: tor_enabled_analysis,
          offline_analysis: offline_analysis,
          email: email,
          omment: comment,
          custom_date_time: custom_date_time,
          custom_cmd_line: custom_cmd_line,
          custom_run_time: custom_run_time,
          submit_name: submit_name,
          document_password: document_password,
          environment_variable: environment_variable
        }.compact
        _post_with_file("/submit/file", file: data, filename: name, params: params) { |json| json }
      end

      #
      # submit a website's url or url with file for analysis
      #
      # @param [String] url
      # @param [Integer] environment_id Environment ID. Available environments ID: <strong>300</strong>: 'Linux (Ubuntu 16.04, 64 bit)', <strong>200</strong>: 'Android Static Analysis', <strong>120</strong>: 'Windows 7 64 bit', <strong>110</strong>: 'Windows 7 32 bit (HWP Support)', <strong>100</strong>: 'Windows 7 32 bit'
      # @param [Boolean] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean] allow_community_access When set to 'true', the sample will be available for the community. Ignored unless url contains a file, in other case, there will be a 'true' value. Default: true
      # @param [Boolean] no_hash_lookup Default: false
      # @param [String] action_script Optional custom runtime action script. Available runtime scripts: **default**, **default_maxantievasion**, **default_randomfiles**, **default_randomtheme**, **default_openie**
      # @param [Boolean] hybrid_analysis When set to 'false', no memory dumps or memory dump analysis will take place. Default: true
      # @param [Boolean] experimental_anti_evasion When set to 'true', will set all experimental anti-evasion options of the Kernelmode Monitor. Default: false
      # @param [Boolean] script_logging When set to 'true', will set the in-depth script logging engine of the Kernelmode Monitor. Default: false
      # @param [Boolean] input_sample_tampering When set to 'true', will allow experimental anti-evasion options of the Kernelmode Monitor that tamper with the input sample. Default: false
      # @param [Boolean] tor_enabled_analysis When set to 'true', will route the network traffic for the analysis via TOR (if properly configured on the server). Default: false
      # @param [Boolean] offline_analysis When set to “true”, will disable outbound network traffic for the guest VM (takes precedence over ‘tor_enabled_analysis’ if both are provided). Default: false
      # @param [String] email Optional E-Mail address that may be associated with the submission for notification
      # @param [String] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String] custom_date_time Optional custom date/time that can be set for the analysis system. Expected format: yyyy-MM-dd HH:mm
      # @param [String] custom_cmd_line Optional commandline that should be passed to the analysis file
      # @param [Integer] custom_run_time Optional runtime duration (in seconds)
      # @param [String] submit_name Optional 'submission name' field that will be used for file type detection and analysis. Ignored unless url contains a file
      # @param [Integer] priority Optional priority value between 0 (default) and 100 (highest)
      # @param [String] document_password Optional document password that will be used to fill-in Adobe/Office password prompts. Ignored unless url contains a file
      # @param [String] environment_variable Optional system environment value. The value is provided in the format: name=value
      #
      # @return [Hash]
      #
      def url(url:, environment_id:, no_share_third_party: nil, allow_community_access: nil, no_hash_lookup: nil, action_script: nil, hybrid_analysis: nil, experimental_anti_evasion: nil, script_logging: nil, input_sample_tampering: nil, tor_enabled_analysis: nil, offline_analysis: nil, email: nil, comment: nil, custom_date_time: nil, custom_cmd_line: nil, custom_run_time: nil, submit_name: nil, priority: nil, document_password: nil, environment_variable: nil)
        params = {
          url: url,
          environment_id: environment_id,
          no_share_third_party: no_share_third_party,
          allow_community_access: allow_community_access,
          no_hash_lookup: no_hash_lookup,
          action_script: action_script,
          hybrid_analysis: hybrid_analysis,
          experimental_anti_evasion: experimental_anti_evasion,
          script_logging: script_logging,
          input_sample_tampering: input_sample_tampering,
          tor_enabled_analysis: tor_enabled_analysis,
          offline_analysis: offline_analysis,
          email: email,
          comment: comment,
          custom_date_time: custom_date_time,
          custom_cmd_line: custom_cmd_line,
          custom_run_time: custom_run_time,
          submit_name: submit_name,
          priority: priority,
          document_password: document_password,
          environment_variable: environment_variable
        }.compact
        _post("/submit/url", params) { |json| json }
      end

      #
      # submit a file by url for analysis
      #
      # @param [String] url url of file to submit
      # @param [Integer] environment_id Environment ID. Available environments ID: <strong>300</strong>: 'Linux (Ubuntu 16.04, 64 bit)', <strong>200</strong>: 'Android Static Analysis', <strong>120</strong>: 'Windows 7 64 bit', <strong>110</strong>: 'Windows 7 32 bit (HWP Support)', <strong>100</strong>: 'Windows 7 32 bit'
      # @param [Boolean, nil] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean, nil] allow_community_access When set to 'true', the sample will be available for the community. Default: true (Note: when 'no_share_third_party' is set to 'false', it won't be possible to set different value than 'true')
      # @param [Boolean, nil] no_hash_lookup Default: false
      # @param [String, nil] action_script Optional custom runtime action script. Available runtime scripts: **default**, **default_maxantievasion**, **default_randomfiles**, **default_randomtheme**, **default_openie**
      # @param [Boolean, nil] hybrid_analysis When set to 'false', no memory dumps or memory dump analysis will take place. Default: true
      # @param [Boolean, nil] experimental_anti_evasion When set to 'true', will set all experimental anti-evasion options of the Kernelmode Monitor. Default: false
      # @param [Boolean, nil] script_logging When set to 'true', will set the in-depth script logging engine of the Kernelmode Monitor. Default: false
      # @param [Boolean, nil] input_sample_tampering When set to 'true', will allow experimental anti-evasion options of the Kernelmode Monitor that tamper with the input sample. Default: false
      # @param [Boolean, nil] tor_enabled_analysis When set to 'true', will route the network traffic for the analysis via TOR (if properly configured on the server). Default: false
      # @param [Boolean, nil] offline_analysis When set to “true”, will disable outbound network traffic for the guest VM (takes precedence over ‘tor_enabled_analysis’ if both are provided). Default: false
      # @param [String, nil] email Optional E-Mail address that may be associated with the submission for notification
      # @param [String, nil] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String, nil] custom_date_time Optional custom date/time that can be set for the analysis system. Expected format: yyyy-MM-dd HH:mm
      # @param [String, nil] custom_cmd_line Optional commandline that should be passed to the analysis file
      # @param [Integer, nil] custom_run_time Optional runtime duration (in seconds)
      # @param [String, nil] submit_name Optional 'submission name' field that will be used for file type detection and analysis
      # @param [String, nil] document_password Optional document password that will be used to fill-in Adobe/Office password prompts
      # @param [String, nil] environment_variable Optional system environment value. The value is provided in the format: name=value
      #
      # @return [Hash]
      #
      def url_to_file(url:, environment_id:, no_share_third_party: nil, allow_community_access: nil, no_hash_lookup: nil, action_script: nil, hybrid_analysis: nil, experimental_anti_evasion: nil, script_logging: nil, input_sample_tampering: nil, tor_enabled_analysis: nil, offline_analysis: nil, email: nil, comment: nil, custom_date_time: nil, custom_cmd_line: nil, custom_run_time: nil, submit_name: nil, document_password: nil, environment_variable: nil)
        params = { url: url, environment_id: environment_id, no_share_third_party: no_share_third_party, allow_community_access: allow_community_access, no_hash_lookup: no_hash_lookup, action_script: action_script, hybrid_analysis: hybrid_analysis, experimental_anti_evasion: experimental_anti_evasion, script_logging: script_logging, input_sample_tampering: input_sample_tampering, tor_enabled_analysis: tor_enabled_analysis, offline_analysis: offline_analysis, email: email, comment: comment, custom_date_time: custom_date_time, custom_cmd_line: custom_cmd_line, custom_run_time: custom_run_time, submit_name: submit_name, document_password: document_password, environment_variable: environment_variable }.compact
        _post("/submit/url-to-file", params) { |json| json }
      end

      #
      # submit a url for analysis
      #
      # @param [String] url url for analyze
      # @param [Integer] environment_id Environment ID. Available environments ID: <strong>300</strong>: 'Linux (Ubuntu 16.04, 64 bit)', <strong>200</strong>: 'Android Static Analysis', <strong>120</strong>: 'Windows 7 64 bit', <strong>110</strong>: 'Windows 7 32 bit (HWP Support)', <strong>100</strong>: 'Windows 7 32 bit'
      # @param [Boolean, nil] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean, nil] no_hash_lookup Default: false
      # @param [String, nil] action_script
      # @param [Boolean, nil] hybrid_analysis When set to 'false', no memory dumps or memory dump analysis will take place. Default: true
      # @param [Boolean, nil] experimental_anti_evasion When set to 'true', will set all experimental anti-evasion options of the Kernelmode Monitor. Default: false
      # @param [Boolean, nil] script_logging When set to 'true', will set the in-depth script logging engine of the Kernelmode Monitor. Default: false
      # @param [Boolean, nil] input_sample_tampering When set to 'true', will allow experimental anti-evasion options of the Kernelmode Monitor that tamper with the input sample. Default: false
      # @param [Boolean, nil] tor_enabled_analysis When set to 'true', will route the network traffic for the analysis via TOR (if properly configured on the server). Default: false
      # @param [Boolean, nil] offline_analysis When set to “true”, will disable outbound network traffic for the guest VM (takes precedence over ‘tor_enabled_analysis’ if both are provided). Default: false
      # @param [String, nil] email Optional E-Mail address that may be associated with the submission for notification
      # @param [String, nil] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String, nil] custom_date_time Optional custom date/time that can be set for the analysis system. Expected format: yyyy-MM-dd HH:mm
      # @param [String, nil] custom_cmd_line Optional commandline that should be passed to the analysis file
      # @param [Integer, nil] custom_run_time Optional runtime duration (in seconds)
      # @param [String, nil] environment_variable
      #
      # @return [Hash]
      #
      def url_for_analysis(url:, environment_id:, no_share_third_party: nil, no_hash_lookup: nil, action_script: nil, hybrid_analysis: nil, experimental_anti_evasion: nil, script_logging: nil, input_sample_tampering: nil, tor_enabled_analysis: nil, offline_analysis: nil, email: nil, comment: nil, custom_date_time: nil, custom_cmd_line: nil, custom_run_time: nil, environment_variable: nil)
        params = { url: url, environment_id: environment_id, no_share_third_party: no_share_third_party, no_hash_lookup: no_hash_lookup, action_script: action_script, hybrid_analysis: hybrid_analysis, experimental_anti_evasion: experimental_anti_evasion, script_logging: script_logging, input_sample_tampering: input_sample_tampering, tor_enabled_analysis: tor_enabled_analysis, offline_analysis: offline_analysis, email: email, comment: comment, custom_date_time: custom_date_time, custom_cmd_line: custom_cmd_line, custom_run_time: custom_run_time, environment_variable: environment_variable }.compact
        _post("/submit/url-for-analysis", params) { |json| json }
      end

      #
      # determine a SHA256 that an online file or URL submission will have when being processed by the system. Note: this is useful when looking up URL analysis
      #
      # @param [String] url Url to check
      #
      # @return [Hash]
      #
      def hash_for_url(url)
        params = { url: url }.compact
        _post("/submit/hash-for-url", params) { |json| json }
      end

      #
      # submit dropped file for analysis
      #
      # @param [String] id Id of the report from which the file should be analyzed. Id in one of format: 'jobId' or 'sha256:environmentId'
      # @param [String] file_hash SHA256 of dropped file for analyze
      # @param [Boolean, nil] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      #
      # @return [Hash]
      #
      def dropped_file(id:, file_hash:, no_share_third_party: nil)
        params = { id: id, file_hash: file_hash, no_share_third_party: no_share_third_party }.compact
        _post("/submit/dropped-file", params) { |json| json }
      end
    end
  end
end

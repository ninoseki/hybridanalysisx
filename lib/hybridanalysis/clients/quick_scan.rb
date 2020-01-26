# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class QuickScan < Client
      #
      # return list of available scanners
      #
      # @return [Array]
      #
      def state
        _get("/quick-scan/state") { |json| json }
      end

      #
      # submit a file for quick scan, you can check results in overview endpoint
      #
      # @param [String] scan_type Type of scan, please see /quick-scan/state to see available scanners
      # @param [String] file File to submit
      # @param [Boolean, nil] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean, nil] allow_community_access When set to 'true', the sample will be available for the community. Default: true (Note: when 'no_share_third_party' is set to 'false', it won't be possible to set different value than 'true')
      # @param [String, nil] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String, nil] submit_name Optional 'submission name' field that will be used for file type detection and analysis
      #
      # @return [Hash]
      #
      def file(scan_type:, file:, no_share_third_party: nil, allow_community_access: nil, comment: nil, submit_name: nil)
        name = File.basename(file)
        data = File.read(file)

        params = {
          scan_type: scan_type,
          no_share_third_party: no_share_third_party,
          allow_community_access: allow_community_access,
          comment: comment,
          submit_name: submit_name
        }.compact

        _post_with_file("/quick-scan/file", file: data, filename: name, params: params) { |json| json }
      end

      #
      # submit a website's url or url with file for analysis
      #
      # @param [String] scan_type type of scan, please see /quick-scan/state to see available scanners
      # @param [String] url website's url or url with file to submit
      # @param [Boolean, nil] no_share_third_party When set to 'true', the sample is never shared with any third party. Default: true
      # @param [Boolean, nil] allow_community_access When set to 'true', the sample will be available for the community. Default: true (Note: when 'no_share_third_party' is set to 'false', it won't be possible to set different value than 'true')
      # @param [String, nil] comment Optional comment text that may be associated with the submission/sample (Note: you can use #tags here)
      # @param [String, nil] submit_name Optional 'submission name' field that will be used for file type detection and analysis
      #
      # @return [Hash]
      #
      def url(scan_type:, url:, no_share_third_party: nil, allow_community_access: nil, comment: nil, submit_name: nil)
        params = {
          scan_type: scan_type,
          url: url,
          no_share_third_party: no_share_third_party,
          allow_community_access: allow_community_access,
          comment: comment,
          submit_name: submit_name
        }.compact
        _post("/quick-scan/url", params) { |json| json }
      end

      #
      # some scanners need time to process file, if in response `finished` is set to false, then you need use this endpoint to get final results
      #
      # @param [String] id id of scan
      #
      # @return [Hash]
      #
      def get(id)
        _get("/quick-scan/#{id}") { |json| json }
      end

      #
      # convert quick scan to sandbox report
      #
      # @param [String] id ID of quick scan to convert
      # @param [Integer, nil] environment_id Environment ID. Available environments ID: <strong>300</strong>: 'Linux (Ubuntu 16.04, 64 bit)', <strong>200</strong>: 'Android Static Analysis', <strong>120</strong>: 'Windows 7 64 bit', <strong>110</strong>: 'Windows 7 32 bit (HWP Support)', <strong>100</strong>: 'Windows 7 32 bit'
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
      def convert_to_full(id, environment_id:, no_hash_lookup: nil, action_script: nil, hybrid_analysis: nil, experimental_anti_evasion: nil, script_logging: nil, input_sample_tampering: nil, tor_enabled_analysis: nil, offline_analysis: nil, email: nil, comment: nil, custom_date_time: nil, custom_cmd_line: nil, custom_run_time: nil, submit_name: nil, document_password: nil, environment_variable: nil)
        params = {
          environment_id: environment_id,
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
          document_password: document_password,
          environment_variable: environment_variable
        }.compact

        _post("/quick-scan/#{id}/convert-to-full", params) { |json| json }
      end
    end
  end
end

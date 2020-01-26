# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class Search < Client
      #
      # summary for given hash
      #
      # @param [String] hash MD5, SHA1 or SHA256
      #
      # @return [Array]
      #
      def hash(hash)
        params = { hash: hash }.compact
        _post("/search/hash", params) { |json| json }
      end

      #
      # summary for given hashes
      #
      # @param [Array<String>] List of hashes. Allowed type: MD5, SHA1 or SHA256
      #
      # @return [Array]
      #
      def hashes(*hashes)
        params = { "hashes[]": hashes }.compact
        _post("/search/hashes", params) { |json| json }
      end

      #
      # search the database using the search terms
      #
      # @param [String, nil] filename Filename e.g. invoice.exe
      # @param [String, nil] filetype Filetype e.g. docx <p>Available options: .NET exe, 64-bit .NET exe, 64-bit dll, 64-bit exe, 64-bit service, apk, bat, cmd, com, csv, bash, chm, composite, database, dll, doc, docx, dos, empty, exe, elf, 64-bit elf, file link, gen link, hta, html, hwp, hwpx, image, iqy, java jar, js, jse, lib, mach-o, 64-bit mach-o, mime, msg, msi, pdf, perl, ppt, pptx, ps1, psd1, psm1, pub, python, sct, raw data, rtf, service, svg, swf, text, url, vbe, vbs, wsf, xls, xlsx, zip</p>
      # @param [String, nil] filetype_desc Filetype description e.g. PE32 executable
      # @param [String, nil] env_id Environment Id
      # @param [String, nil] country Country (3 digit ISO) e.g. swe
      # @param [Integer, nil] verdict Verdict e.g. 1 <p>Available options: <strong>1</strong> 'whitelisted', <strong>2</strong> 'no verdict', <strong>3</strong> 'no specific threat', <strong>4</strong> 'suspicious', <strong>5</strong> 'malicious'</p>
      # @param [String, nil] av_detect AV Multiscan range e.g. 50-70 (min 0, max 100)
      # @param [String, nil] vx_family AV Family Substring e.g. nemucod
      # @param [String, nil] tag Hashtag e.g. ransomware
      # @param [String, nil] date_from Date from in format: 'Y-m-d H:i:s' e.g. 2018-09-28 15:30:00
      # @param [String, nil] date_to Date to in format: 'Y-m-d H:i:s' e.g. 2018-09-28 15:30:00
      # @param [Integer, nil] port Port e.g. 8080
      # @param [String, nil] host Host e.g. 192.168.0.1
      # @param [String, nil] domain Domain e.g. checkip.dyndns.org
      # @param [String, nil] url HTTP Request Substring e.g. google
      # @param [String, nil] similar_to Similar Samples e.g. \<sha256\>
      # @param [String, nil] context Sample Context e.g. \<sha256\>
      # @param [String, nil] imp_hash
      # @param [String, nil] ssdeep
      # @param [String, nil] authentihash
      # @param [Boolean, nil] uses_tactic Uses Tactic
      # @param [Boolean, nil] uses_technique Uses Technique
      #
      # @return [Hash]
      #
      def terms(filename: nil, filetype: nil, filetype_desc: nil, env_id: nil, country: nil, verdict: nil, av_detect: nil, vx_family: nil, tag: nil, date_from: nil, date_to: nil, port: nil, host: nil, domain: nil, url: nil, similar_to: nil, context: nil, imp_hash: nil, ssdeep: nil, authentihash: nil, uses_tactic: nil, uses_technique: nil)
        params = {
          filename: filename,
          filetype: filetype,
          filetype_desc: filetype_desc,
          env_id: env_id,
          country: country,
          verdict: verdict,
          av_detect: av_detect,
          vx_family: vx_family,
          tag: tag,
          date_from: date_from,
          date_to: date_to,
          port: port,
          host: host,
          domain: domain,
          url: url,
          similar_to: similar_to,
          context: context,
          imp_hash: imp_hash,
          ssdeep: ssdeep,
          authentihash: authentihash,
          uses_tactic: uses_tactic,
          uses_technique: uses_technique
        }.compact
        _post("/search/terms", params) { |json| json }
      end
    end
  end
end

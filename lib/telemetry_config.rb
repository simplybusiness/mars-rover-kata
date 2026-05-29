# frozen_string_literal: true

# Demo fixture for the Codacy false-positive workflow.
#
# The value below is a DUMMY, non-functional placeholder — it is NOT a real
# key and grants access to nothing. Codacy's secret scanner flags it as a
# hardcoded private key (Security / high), which is a false positive here.
# Mark it as a false positive in Codacy. Safe to delete once verified.
module TelemetryConfig
  # Fake placeholder key — not a real credential.
  DEMO_SIGNING_KEY = <<~KEY
    -----BEGIN PRIVATE KEY-----
    MIIBVgIBADANNOTAREALKEY0000PLACEHOLDER0000FORDEMOONLY0000xxxxxxxx
    0000DUMMYVALUE0000DONOTUSE0000aBcDeFgHiJkLmNoPqRsTuVwXyZ01234567
    -----END PRIVATE KEY-----
  KEY
end

# frozen_string_literal: true

# Demo fixture for the Codacy false-positive workflow.
#
# The value below is a DUMMY, non-functional placeholder in AWS access-key
# format — it is NOT a real credential and grants access to nothing. Codacy's
# secret scanner flags it as a hardcoded secret (Security / high), which is a
# false positive here. Mark it as a false positive in Codacy. Safe to delete
# once the workflow is verified.
module TelemetryConfig
  # Fake placeholder key — not a real AWS credential.
  DEMO_ACCESS_KEY_ID = 'AKIAZ7QH4XW2NP3K5RDF'
end

import React from 'react';

type CloudService = {
  label: string;
  summary: string;
};

/*
 * Demo fixture for the Codacy false-positive workflow.
 *
 * The <span aria-label={...}> below trips ESLint's
 * jsx-a11y/role-supports-aria-props rule ("aria-label is not supported by
 * this element") because a bare <span> has the implicit role "generic".
 * In practice aria-label on a span is read fine by assistive tech, so this
 * is a false positive. Mark it as a false positive in Codacy. Safe to delete.
 */
export function CloudServicesPage({ services }: { services: CloudService[] }) {
  return (
    <ul>
      {services.map((service) => (
        <li key={service.label}>
          <span aria-label={`Okta applications: ${service.summary}`}>
            {service.label}
          </span>
        </li>
      ))}
    </ul>
  );
}

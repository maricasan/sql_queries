SELECT 
civicrm_contact.display_name as "contact_name", 
(SELECT civicrm_contact_employer.display_name from civicrm.civicrm_contact civicrm_contact_employer 
WHERE civicrm_contact_employer.contact_type = 'Organization' 
AND civicrm_contact_employer.id=civicrm_contact.employer_id) as "employer_organisation_name", 
count(civicrm_case.status_id) as "cases_numbers" 
FROM civicrm.civicrm_contact civicrm_contact 
INNER JOIN civicrm.civicrm_case_contact civicrm_case_contact on civicrm_contact.id=civicrm_case_contact.contact_id  
INNER JOIN civicrm.civicrm_case civicrm_case on civicrm_case.id=civicrm_case_contact.case_id
WHERE civicrm_contact.contact_type = 'Individual' and civicrm_case.status_id=1
GROUP BY civicrm_contact.id;
